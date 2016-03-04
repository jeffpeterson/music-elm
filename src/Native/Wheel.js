Elm.Native = Elm.Native || {};
Elm.Native.Wheel = {};
Elm.Native.Wheel.make = function(localRuntime) {
  localRuntime.Native = localRuntime.Native || {};
  localRuntime.Native.Wheel = localRuntime.Native.Wheel || {};
  if (localRuntime.Native.Wheel.values) {
    return localRuntime.Native.Wheel.values;
  }

  var NS = Elm.Native.Signal.make(localRuntime);

  var delta = NS.input('Wheel.delta', 0);

  var node = localRuntime.isFullscreen()
    ? document
    : localRuntime.node;


  localRuntime.addListener([delta.id], node, 'wheel', function wheel(e) {
    localRuntime.notify(delta.id, e.deltaY);
  });

  return localRuntime.Native.Wheel.values = {
    delta: delta
  };
};
