function code_DC = codeDC(dif)
size = find_size_DC(dif);
size_Huffman = code_size_DC(size);
amp_Huffman = code_amp(dif);

if(dif~=0)
    code_DC = [size_Huffman amp_Huffman];
else
    code_DC = [size_Huffman];
end