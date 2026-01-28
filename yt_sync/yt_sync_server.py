#!/usr/bin/env python3
"""
YouTube Sync Server
Run this on the master PC (192.168.1.122)
"""

from flask import Flask, request, jsonify
from flask_cors import CORS
import time

app = Flask(__name__)
CORS(app)  # Allow requests from Firefox extensions

# Store the current playback state in memory
current_state = {
    'videoId': '',
    'timestamp': 0,
    'playing': False,
    'updatedAt': 0
}

@app.route('/ping', methods=['GET'])
def ping():
    """Health check endpoint"""
    return jsonify({'status': 'ok', 'server': 'YouTube Sync Server'})

@app.route('/state', methods=['GET', 'POST'])
def sync_state():
    """
    GET: Slave devices fetch the current state
    POST: Master device updates the current state
    """
    global current_state
    
    if request.method == 'POST':
        # Master is updating state
        data = request.json
        current_state = {
            'videoId': data.get('videoId', ''),
            'timestamp': data.get('timestamp', 0),
            'playing': data.get('playing', False),
            'updatedAt': time.time()
        }
        print(f"📡 Master update: {current_state['videoId']} @ {current_state['timestamp']:.1f}s - {'▶️ PLAYING' if current_state['playing'] else '⏸️  PAUSED'}")
        return jsonify({'status': 'ok'})
    
    else:
        # Slave is fetching state
        return jsonify(current_state)

if __name__ == '__main__':
    print("=" * 60)
    print("🎬 YouTube Sync Server")
    print("=" * 60)
    print(f"Server running on: http://192.168.1.122:5000")
    print(f"Master device: Install extension, set to MASTER mode")
    print(f"Slave device: Install extension, set to SLAVE mode")
    print("=" * 60)
    print()
    
    app.run(host='0.0.0.0', port=5000, debug=False)