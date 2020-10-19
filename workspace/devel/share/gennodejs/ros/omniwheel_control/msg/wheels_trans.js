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

class wheels_trans {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.wID = null;
      this.wcenterx = null;
      this.wcentery = null;
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('wID')) {
        this.wID = initObj.wID
      }
      else {
        this.wID = [];
      }
      if (initObj.hasOwnProperty('wcenterx')) {
        this.wcenterx = initObj.wcenterx
      }
      else {
        this.wcenterx = 0;
      }
      if (initObj.hasOwnProperty('wcentery')) {
        this.wcentery = initObj.wcentery
      }
      else {
        this.wcentery = 0;
      }
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type wheels_trans
    // Serialize message field [wID]
    bufferOffset = _arraySerializer.int32(obj.wID, buffer, bufferOffset, null);
    // Serialize message field [wcenterx]
    bufferOffset = _serializer.int32(obj.wcenterx, buffer, bufferOffset);
    // Serialize message field [wcentery]
    bufferOffset = _serializer.int32(obj.wcentery, buffer, bufferOffset);
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type wheels_trans
    let len;
    let data = new wheels_trans(null);
    // Deserialize message field [wID]
    data.wID = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [wcenterx]
    data.wcenterx = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [wcentery]
    data.wcentery = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.wID.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'omniwheel_control/wheels_trans';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c432407a8349c63fa0f07653bd392f4a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] wID
    int32 wcenterx
    int32 wcentery
    float64 angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new wheels_trans(null);
    if (msg.wID !== undefined) {
      resolved.wID = msg.wID;
    }
    else {
      resolved.wID = []
    }

    if (msg.wcenterx !== undefined) {
      resolved.wcenterx = msg.wcenterx;
    }
    else {
      resolved.wcenterx = 0
    }

    if (msg.wcentery !== undefined) {
      resolved.wcentery = msg.wcentery;
    }
    else {
      resolved.wcentery = 0
    }

    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = wheels_trans;
