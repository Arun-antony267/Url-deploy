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
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/header.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/header.js":
/*!****************************************!*\
  !*** ./app/javascript/packs/header.js ***!
  \****************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/arun/url_shortener/app/javascript/packs/header.js: Expected corresponding JSX closing tag for <>. (40:6)\n\n  38 | </div>\n  39 |\n> 40 |       </div>\n     |       ^\n  41 |    </>\n  42 |       \n  43 |     );\n    at constructor (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:356:19)\n    at JSXParserMixin.raise (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:3223:19)\n    at JSXParserMixin.jsxParseElementAt (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:6885:14)\n    at JSXParserMixin.jsxParseElement (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:6920:17)\n    at JSXParserMixin.parseExprAtom (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:6932:19)\n    at JSXParserMixin.parseExprSubscripts (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10862:23)\n    at JSXParserMixin.parseUpdate (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10845:21)\n    at JSXParserMixin.parseMaybeUnary (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10821:23)\n    at JSXParserMixin.parseMaybeUnaryOrPrivate (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10659:61)\n    at JSXParserMixin.parseExprOps (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10664:23)\n    at JSXParserMixin.parseMaybeConditional (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10641:23)\n    at JSXParserMixin.parseMaybeAssign (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10602:21)\n    at /home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10572:39\n    at JSXParserMixin.allowInAnd (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12289:12)\n    at JSXParserMixin.parseMaybeAssignAllowIn (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10572:17)\n    at JSXParserMixin.parseParenAndDistinguishExpression (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:11504:28)\n    at JSXParserMixin.parseExprAtom (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:11142:23)\n    at JSXParserMixin.parseExprAtom (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:6937:20)\n    at JSXParserMixin.parseExprSubscripts (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10862:23)\n    at JSXParserMixin.parseUpdate (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10845:21)\n    at JSXParserMixin.parseMaybeUnary (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10821:23)\n    at JSXParserMixin.parseMaybeUnaryOrPrivate (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10659:61)\n    at JSXParserMixin.parseExprOps (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10664:23)\n    at JSXParserMixin.parseMaybeConditional (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10641:23)\n    at JSXParserMixin.parseMaybeAssign (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10602:21)\n    at JSXParserMixin.parseExpressionBase (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10556:23)\n    at /home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10552:39\n    at JSXParserMixin.allowInAnd (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12284:16)\n    at JSXParserMixin.parseExpression (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:10552:17)\n    at JSXParserMixin.parseReturnStatement (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13008:28)\n    at JSXParserMixin.parseStatementContent (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12626:21)\n    at JSXParserMixin.parseStatementLike (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12593:17)\n    at JSXParserMixin.parseStatementListItem (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12573:17)\n    at JSXParserMixin.parseBlockOrModuleBlockBody (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13194:61)\n    at JSXParserMixin.parseBlockBody (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13187:10)\n    at JSXParserMixin.parseBlock (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13175:10)\n    at JSXParserMixin.parseFunctionBody (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:11940:24)\n    at JSXParserMixin.parseFunctionBodyAndFinish (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:11926:10)\n    at /home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13323:12\n    at JSXParserMixin.withSmartMixTopicForbiddingContext (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12266:14)\n    at JSXParserMixin.parseFunction (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13322:10)\n    at JSXParserMixin.parseFunctionStatement (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12989:17)\n    at JSXParserMixin.parseStatementContent (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12619:21)\n    at JSXParserMixin.parseStatementLike (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12593:17)\n    at JSXParserMixin.parseModuleItem (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12570:17)\n    at JSXParserMixin.parseBlockOrModuleBlockBody (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13194:36)\n    at JSXParserMixin.parseBlockBody (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:13187:10)\n    at JSXParserMixin.parseProgram (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12469:10)\n    at JSXParserMixin.parseTopLevel (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:12459:25)\n    at JSXParserMixin.parse (/home/arun/url_shortener/node_modules/@babel/parser/lib/index.js:14381:10)");

/***/ })

/******/ });
//# sourceMappingURL=header-83a225c36231af6837ba.js.map