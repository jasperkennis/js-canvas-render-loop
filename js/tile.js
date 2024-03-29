// Generated by CoffeeScript 1.5.0
var Tile,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Tile = (function(_super) {

  __extends(Tile, _super);

  Tile.prototype.hovered = false;

  Tile.prototype.changed = true;

  function Tile(row, col, h, w) {
    this.row = row;
    this.col = col;
    this.h = h != null ? h : 25;
    this.w = w != null ? w : 25;
    this.draw = __bind(this.draw, this);
    Tile.__super__.constructor.apply(this, arguments);
    this.x = (this.w * this.col * 2) + (this.w * (this.row % 2));
    this.y = this.h * this.row * 0.5;
    this.draw();
    this.bind();
  }

  Tile.prototype.bind = function() {
    return this.signals.preparedDraw.add(this.draw);
  };

  Tile.prototype.setHovered = function(val) {
    if (val == null) {
      val = false;
    }
    this.hovered = val;
    return this.changed = true;
  };

  Tile.prototype.draw = function() {
    if (this.changed) {
      if (this.visible()) {
        this.ctx.fillStyle = this.color;
        if (this.hovered) {
          this.ctx.fillStyle = 'black';
        }
        this.ctx.beginPath();
        this.ctx.moveTo(this.x + this.w, this.y + 0);
        this.ctx.lineTo(this.x + (this.w * 2), this.y + this.h / 2);
        this.ctx.lineTo(this.x + this.w, this.y + this.h);
        this.ctx.lineTo(this.x + 0, this.y + this.h / 2);
        this.ctx.closePath();
        this.setHovered();
        this.ctx.fill();
      }
      return this.changed = false;
    }
  };

  Tile.prototype.collision = function(b) {
    this.r = this.x + this.w;
    this.b = this.y + this.h;
    b.r = b.x + b.w;
    b.b = b.y + b.h;
    if (this.b <= b.y) {
      return false;
    }
    if (this.y >= b.b) {
      return false;
    }
    if (this.r <= b.x) {
      return false;
    }
    if (this.x >= b.r) {
      return false;
    }
    return true;
  };

  Tile.prototype.visible = function() {
    return this.collision(this.visibeArea);
  };

  return Tile;

})(Base);
