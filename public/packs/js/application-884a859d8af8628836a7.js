/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/application.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/application.js":
/*!*********************************************!*\
  !*** ./app/javascript/packs/application.js ***!
  \*********************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
/* harmony import */ var _richtext__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ../richtext */ "./app/javascript/richtext.js");
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//require("@rails/ujs").start()
//require("turbolinks").start()
//require("@rails/activestorage").start()
//require("channels")
var Trix = window.Trix = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module 'trix'"); e.code = 'MODULE_NOT_FOUND'; throw e; }()));



__webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module 'trix'"); e.code = 'MODULE_NOT_FOUND'; throw e; }()));

__webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module '@rails/actiontext'"); e.code = 'MODULE_NOT_FOUND'; throw e; }())); // Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

/***/ }),

/***/ "./app/javascript/richtext.js":
/*!************************************!*\
  !*** ./app/javascript/richtext.js ***!
  \************************************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
__webpack_require__.r(__webpack_exports__);
!(function webpackMissingModule() { var e = new Error("Cannot find module 'trix'"); e.code = 'MODULE_NOT_FOUND'; throw e; }());
function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } }

function _createClass(Constructor, protoProps, staticProps) { if (protoProps) _defineProperties(Constructor.prototype, protoProps); if (staticProps) _defineProperties(Constructor, staticProps); return Constructor; }


addHeadingAttributes();
addForegroundColorAttributes();
addBackgroundColorAttributes();
addEventListener("trix-initialize", function (event) {
  new RichText(event.target);
});
addEventListener("trix-action-invoke", function (event) {
  if (event.actionName == "x-horizontal-rule") insertHorizontalRule();

  function insertHorizontalRule() {
    event.target.editor.insertAttachment(buildHorizontalRule());
  }

  function buildHorizontalRule() {
    return new !(function webpackMissingModule() { var e = new Error("Cannot find module 'trix'"); e.code = 'MODULE_NOT_FOUND'; throw e; }()).Attachment({
      content: "<hr>",
      contentType: "vnd.rubyonrails.horizontal-rule.html"
    });
  }
});

var RichText = /*#__PURE__*/function () {
  function RichText(element) {
    _classCallCheck(this, RichText);

    this.element = element;
    this.insertHeadingElements();
    this.insertDividerElements();
    this.insertColorElements();
  }

  _createClass(RichText, [{
    key: "insertHeadingElements",
    value: function insertHeadingElements() {
      this.removeOriginalHeadingButton();
      this.insertNewHeadingButton();
      this.insertHeadingDialog();
    }
  }, {
    key: "removeOriginalHeadingButton",
    value: function removeOriginalHeadingButton() {
      this.buttonGroupBlockTools.removeChild(this.originalHeadingButton);
    }
  }, {
    key: "insertNewHeadingButton",
    value: function insertNewHeadingButton() {
      this.buttonGroupBlockTools.insertAdjacentHTML("afterbegin", this.headingButtonTemplate);
    }
  }, {
    key: "insertHeadingDialog",
    value: function insertHeadingDialog() {
      this.dialogsElement.insertAdjacentHTML("beforeend", this.dialogHeadingTemplate);
    }
  }, {
    key: "insertDividerElements",
    value: function insertDividerElements() {
      this.quoteButton.insertAdjacentHTML("afterend", this.horizontalButtonTemplate);
    }
  }, {
    key: "insertColorElements",
    value: function insertColorElements() {
      this.insertColorButton();
      this.insertDialogColor();
    }
  }, {
    key: "insertColorButton",
    value: function insertColorButton() {
      this.buttonGroupTextTools.insertAdjacentHTML("beforeend", this.colorButtonTemplate);
    }
  }, {
    key: "insertDialogColor",
    value: function insertDialogColor() {
      this.dialogsElement.insertAdjacentHTML("beforeend", this.dialogColorTemplate);
    }
  }, {
    key: "buttonGroupBlockTools",
    get: function get() {
      return this.toolbarElement.querySelector("[data-trix-button-group=block-tools]");
    }
  }, {
    key: "buttonGroupTextTools",
    get: function get() {
      return this.toolbarElement.querySelector("[data-trix-button-group=text-tools]");
    }
  }, {
    key: "dialogsElement",
    get: function get() {
      return this.toolbarElement.querySelector("[data-trix-dialogs]");
    }
  }, {
    key: "originalHeadingButton",
    get: function get() {
      return this.toolbarElement.querySelector("[data-trix-attribute=heading1]");
    }
  }, {
    key: "quoteButton",
    get: function get() {
      return this.toolbarElement.querySelector("[data-trix-attribute=quote]");
    }
  }, {
    key: "toolbarElement",
    get: function get() {
      return this.element.toolbarElement;
    }
  }, {
    key: "horizontalButtonTemplate",
    get: function get() {
      return '<button type="button" class="trix-button trix-button--icon trix-button--icon-horizontal-rule" data-trix-action="x-horizontal-rule" tabindex="-1" title="Divider">Divider</button>';
    }
  }, {
    key: "headingButtonTemplate",
    get: function get() {
      return '<button type="button" class="trix-button trix-button--icon trix-button--icon-heading-1" data-trix-action="x-heading" title="Heading" tabindex="-1">Heading</button>';
    }
  }, {
    key: "colorButtonTemplate",
    get: function get() {
      return '<button type="button" class="trix-button trix-button--icon trix-button--icon-color" data-trix-action="x-color" title="Color" tabindex="-1">Color</button>';
    }
  }, {
    key: "dialogHeadingTemplate",
    get: function get() {
      return "\n      <div class=\"trix-dialog trix-dialog--heading\" data-trix-dialog=\"x-heading\" data-trix-dialog-attribute=\"x-heading\">\n        <div class=\"trix-dialog__link-fields\">\n          <input type=\"text\" name=\"x-heading\" class=\"trix-dialog-hidden__input\" data-trix-input>\n          <div class=\"trix-button-group\">\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"heading1\">H1</button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"heading2\">H2</button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"heading3\">H3</button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"heading4\">H4</button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"heading5\">H5</button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"heading6\">H6</button>\n          </div>\n        </div>\n      </div>\n    ";
    }
  }, {
    key: "dialogColorTemplate",
    get: function get() {
      return "\n      <div class=\"trix-dialog trix-dialog--color\" data-trix-dialog=\"x-color\" data-trix-dialog-attribute=\"x-color\">\n        <div class=\"trix-dialog__link-fields\">\n          <input type=\"text\" name=\"x-color\" class=\"trix-dialog-hidden__input\" data-trix-input>\n          <div class=\"trix-button-group\">\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor1\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor2\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor3\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor4\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor5\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor6\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor7\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor8\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"fgColor9\" data-trix-method=\"hideDialog\"></button>\n          </div>\n          <div class=\"trix-button-group\">\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor1\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor2\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor3\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor4\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor5\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor6\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor7\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor8\" data-trix-method=\"hideDialog\"></button>\n            <button type=\"button\" class=\"trix-button trix-button--dialog\" data-trix-attribute=\"bgColor9\" data-trix-method=\"hideDialog\"></button>\n          </div>\n        </div>\n      </div>\n    ";
    }
  }]);

  return RichText;
}();

function addHeadingAttributes() {
  Array.from(["h1", "h2", "h3", "h4", "h5", "h6"]).forEach(function (tagName, i) {
    !(function webpackMissingModule() { var e = new Error("Cannot find module 'trix'"); e.code = 'MODULE_NOT_FOUND'; throw e; }()).config.blockAttributes["heading".concat(i + 1)] = {
      tagName: tagName,
      terminal: true,
      breakOnReturn: true,
      group: false
    };
  });
}

function addForegroundColorAttributes() {
  Array.from(["rgb(136, 118, 38)", "rgb(185, 94, 6)", "rgb(207, 0, 0)", "rgb(216, 28, 170)", "rgb(144, 19, 254)", "rgb(5, 98, 185)", "rgb(17, 138, 15)", "rgb(148, 82, 22)", "rgb(102, 102, 102)"]).forEach(function (color, i) {
    !(function webpackMissingModule() { var e = new Error("Cannot find module 'trix'"); e.code = 'MODULE_NOT_FOUND'; throw e; }()).config.textAttributes["fgColor".concat(i + 1)] = {
      style: {
        color: color
      },
      inheritable: true,
      parser: function parser(e) {
        return e.style.color == color;
      }
    };
  });
}

function addBackgroundColorAttributes() {
  Array.from(["rgb(250, 247, 133)", "rgb(255, 240, 219)", "rgb(255, 229, 229)", "rgb(255, 228, 247)", "rgb(242, 237, 255)", "rgb(225, 239, 252)", "rgb(228, 248, 226)", "rgb(238, 226, 215)", "rgb(242, 242, 242)"]).forEach(function (color, i) {
    !(function webpackMissingModule() { var e = new Error("Cannot find module 'trix'"); e.code = 'MODULE_NOT_FOUND'; throw e; }()).config.textAttributes["bgColor".concat(i + 1)] = {
      style: {
        backgroundColor: color
      },
      inheritable: true,
      parser: function parser(e) {
        return e.style.backgroundColor == color;
      }
    };
  });
}

/***/ })

/******/ });
//# sourceMappingURL=application-884a859d8af8628836a7.js.map