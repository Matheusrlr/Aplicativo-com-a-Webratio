/*
 *
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 *
*/

/*
 * removeRecursively
 *
 * IN:
 *  args
 *   0 - URL of DirectoryEntry to remove recursively
 * OUT:
 *  success - (no args)
 *  fail - FileError
 */

/* eslint-disable no-undef */
var resolve = cordova.require('cordova-plugin-file.resolveLocalFileSystemURIProxy');
var requestAnimationFrame = cordova.require('cordova-plugin-file.bb10RequestAnimationFrame');
/* eslint-enable no-undef */

module.exports = function (success, fail, args) {
    var uri = args[0];
    var onSuccess = function (data) {
        if (typeof success === 'function') {
            success(data);
        }
    };
    var onFail = function (error) {
        if (typeof fail === 'function') {
            if (error.code) {
                if (error.code === FileError.INVALID_MODIFICATION_ERR) { // eslint-disable-line no-undef
                    // mobile-spec expects this error code
                    fail(FileError.NO_MODIFICATION_ALLOWED_ERR); // eslint-disable-line no-undef
                } else {
                    fail(error.code);
                }
            } else {
                fail(error);
            }
        }
    };
    resolve(function (fs) {
        requestAnimationFrame(function () {
            fs.nativeEntry.removeRecursively(onSuccess, onFail);
        });
    }, fail, [uri]);
};
