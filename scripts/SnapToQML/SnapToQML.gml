/// @return QML string that encodes the struct/array nested data
/// 
/// @param struct/array          The data to be encoded. Can contain structs, arrays, strings, and numbers.   N.B. Will not encode ds_list, ds_map etc.
/// @param constructorDict
/// @param [accurateFloats]      (bool) Whether to output floats at a higher accuracy than GM normally defaults to. Defaults to <false>. Setting this to <true> confers a performance penalty
/// 
/// @jujuadams 2022-12-23

function SnapToQML(_ds, _constructorDict, _accurateFloats = false)
{
    var _buffer = buffer_create(1024, buffer_grow, 1);
    SnapBufferWriteQML(_buffer, _ds, _constructorDict, _accurateFloats);
    buffer_seek(_buffer, buffer_seek_start, 0);
    var _string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer);
    return _string; 
}