// Generated by CoffeeScript 1.5.0
var Grid,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Grid = (function(_super) {

  __extends(Grid, _super);

  Grid.prototype.tiles = [];

  Grid.prototype.level = [[0, 0, 0, 1, 0, 0, 0, 0, 0, 1], [1, 0, 0, 1, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 1, 0, 0, 0, 0, 0, 0], [0, 1, 0, 1, 0, 1, 0, 1, 0, 1], [0, 0, 0, 0, 0, 1, 0, 0, 0, 1], [0, 0, 0, 1, 0, 0, 0, 0, 0, 1], [0, 0, 0, 0, 0, 1, 0, 0, 0, 1], [1, 0, 0, 0, 0, 0, 1, 0, 0, 0], [1, 1, 0, 0, 0, 1, 0, 0, 0, 0]];

  Grid.prototype.types = [Grass, Sand];

  function Grid() {
    this.drawTiles();
  }

  Grid.prototype.drawTiles = function() {
    var c, r, t, tile, tt, _i, _len, _ref, _results;
    _ref = this.level;
    _results = [];
    for (r = _i = 0, _len = _ref.length; _i < _len; r = ++_i) {
      t = _ref[r];
      _results.push((function() {
        var _j, _len1, _results1;
        _results1 = [];
        for (c = _j = 0, _len1 = t.length; _j < _len1; c = ++_j) {
          tt = t[c];
          _results1.push(tile = new this.types[tt](r, c));
        }
        return _results1;
      }).call(this));
    }
    return _results;
  };

  return Grid;

})(Base);
