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

class num {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.cell = null;
    }
    else {
      if (initObj.hasOwnProperty('cell')) {
        this.cell = initObj.cell
      }
      else {
        this.cell = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type num
    // Serialize message field [cell]
    bufferOffset = _serializer.int8(obj.cell, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type num
    let len;
    let data = new num(null);
    // Deserialize message field [cell]
    data.cell = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'omniwheel_control/num';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '289056e7a02f898217ead636fc3f6d34';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 cell
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new num(null);
    if (msg.cell !== undefined) {
      resolved.cell = msg.cell;
    }
    else {
      resolved.cell = 0
    }

    return resolved;
    }
};

module.exports = num;
