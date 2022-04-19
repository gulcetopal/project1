// Auto-generated. Do not edit!

// (in-package odom.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class reset_odomRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.new_x = null;
      this.new_y = null;
      this.new_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('new_x')) {
        this.new_x = initObj.new_x
      }
      else {
        this.new_x = 0.0;
      }
      if (initObj.hasOwnProperty('new_y')) {
        this.new_y = initObj.new_y
      }
      else {
        this.new_y = 0.0;
      }
      if (initObj.hasOwnProperty('new_yaw')) {
        this.new_yaw = initObj.new_yaw
      }
      else {
        this.new_yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type reset_odomRequest
    // Serialize message field [new_x]
    bufferOffset = _serializer.float64(obj.new_x, buffer, bufferOffset);
    // Serialize message field [new_y]
    bufferOffset = _serializer.float64(obj.new_y, buffer, bufferOffset);
    // Serialize message field [new_yaw]
    bufferOffset = _serializer.float64(obj.new_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type reset_odomRequest
    let len;
    let data = new reset_odomRequest(null);
    // Deserialize message field [new_x]
    data.new_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [new_y]
    data.new_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [new_yaw]
    data.new_yaw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'odom/reset_odomRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2f2a014aa06478f778bb22ed471b089d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 new_x
    float64 new_y
    float64 new_yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new reset_odomRequest(null);
    if (msg.new_x !== undefined) {
      resolved.new_x = msg.new_x;
    }
    else {
      resolved.new_x = 0.0
    }

    if (msg.new_y !== undefined) {
      resolved.new_y = msg.new_y;
    }
    else {
      resolved.new_y = 0.0
    }

    if (msg.new_yaw !== undefined) {
      resolved.new_yaw = msg.new_yaw;
    }
    else {
      resolved.new_yaw = 0.0
    }

    return resolved;
    }
};

class reset_odomResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.old_x = null;
      this.old_y = null;
      this.old_yaw = null;
    }
    else {
      if (initObj.hasOwnProperty('old_x')) {
        this.old_x = initObj.old_x
      }
      else {
        this.old_x = 0.0;
      }
      if (initObj.hasOwnProperty('old_y')) {
        this.old_y = initObj.old_y
      }
      else {
        this.old_y = 0.0;
      }
      if (initObj.hasOwnProperty('old_yaw')) {
        this.old_yaw = initObj.old_yaw
      }
      else {
        this.old_yaw = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type reset_odomResponse
    // Serialize message field [old_x]
    bufferOffset = _serializer.float64(obj.old_x, buffer, bufferOffset);
    // Serialize message field [old_y]
    bufferOffset = _serializer.float64(obj.old_y, buffer, bufferOffset);
    // Serialize message field [old_yaw]
    bufferOffset = _serializer.float64(obj.old_yaw, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type reset_odomResponse
    let len;
    let data = new reset_odomResponse(null);
    // Deserialize message field [old_x]
    data.old_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [old_y]
    data.old_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [old_yaw]
    data.old_yaw = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'odom/reset_odomResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '12559404318431143b8cb18e1b42122d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 old_x
    float64 old_y
    float64 old_yaw
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new reset_odomResponse(null);
    if (msg.old_x !== undefined) {
      resolved.old_x = msg.old_x;
    }
    else {
      resolved.old_x = 0.0
    }

    if (msg.old_y !== undefined) {
      resolved.old_y = msg.old_y;
    }
    else {
      resolved.old_y = 0.0
    }

    if (msg.old_yaw !== undefined) {
      resolved.old_yaw = msg.old_yaw;
    }
    else {
      resolved.old_yaw = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: reset_odomRequest,
  Response: reset_odomResponse,
  md5sum() { return '67113a69c2a17203e20c1586e4277dc3'; },
  datatype() { return 'odom/reset_odom'; }
};
