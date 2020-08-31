// Auto-generated. Do not edit!

// (in-package omniwheel_control.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class move_base {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.v_right = null;
      this.v_left = null;
      this.v_back = null;
    }
    else {
      if (initObj.hasOwnProperty('v_right')) {
        this.v_right = initObj.v_right
      }
      else {
        this.v_right = 0;
      }
      if (initObj.hasOwnProperty('v_left')) {
        this.v_left = initObj.v_left
      }
      else {
        this.v_left = 0;
      }
      if (initObj.hasOwnProperty('v_back')) {
        this.v_back = initObj.v_back
      }
      else {
        this.v_back = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type move_base
    // Serialize message field [v_right]
    bufferOffset = _serializer.int64(obj.v_right, buffer, bufferOffset);
    // Serialize message field [v_left]
    bufferOffset = _serializer.int64(obj.v_left, buffer, bufferOffset);
    // Serialize message field [v_back]
    bufferOffset = _serializer.int64(obj.v_back, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type move_base
    let len;
    let data = new move_base(null);
    // Deserialize message field [v_right]
    data.v_right = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [v_left]
    data.v_left = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [v_back]
    data.v_back = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'omniwheel_control/move_base';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e7eb46e0f2c9f6ac4de66b4a1727ce26';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 v_right
    int64 v_left
    int64 v_back
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new move_base(null);
    if (msg.v_right !== undefined) {
      resolved.v_right = msg.v_right;
    }
    else {
      resolved.v_right = 0
    }

    if (msg.v_left !== undefined) {
      resolved.v_left = msg.v_left;
    }
    else {
      resolved.v_left = 0
    }

    if (msg.v_back !== undefined) {
      resolved.v_back = msg.v_back;
    }
    else {
      resolved.v_back = 0
    }

    return resolved;
    }
};

module.exports = move_base;
