function ditstance(source, target) {
    var src_length = source.length + 1;
    var tgt_length = target.length + 1;
    
    if (src_length == 1) {
        return tgt_length - 1;
    }
    if (tgt_length == 1) {
        return src_length - 1;
    }

    var matrix  = new Array();
    var row = new Array();
    for (i = 0; i < tgt_length; i++){
        row[i] = i;
    }
    matrix[0] = row;
    for (i = 1; i < src_length; i++) {
        var row = new Array();
        row[0] = i;
        for (j = 1; j < tgt_length; j++) {
            row[j] = 0;
        }
        matrix[i] = row;
    }

    for (i = 1; i < src_length; i++) {
        var src_char = source[i-1];
        for (j = 1; j < tgt_length; j++) {
            var tgt_char = target[j-1];
            var cost;
            if (src_char === tgt_char) {
                cost = 0;
            } else {
                cost = 1;
            }
            var above = matrix[i-1][j]+1;
            var left = matrix[i][j-1]+1;
            var diag = matrix[i-1][j-1]+cost;
            var value = Math.min(above, left, diag);
            matrix[i][j] = value;
        }
    }
    return matrix[src_length - 1][tgt_length - 1];
}
