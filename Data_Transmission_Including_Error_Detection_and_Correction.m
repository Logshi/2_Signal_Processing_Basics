%Hamming Code for Error Detection and Correction
% Define a 4-bit message
msg = [1 0 1 1];

% Generate Hamming(7,4) code
hamming_code = encode(msg, 7, 4, 'hamming/binary');

% Introduce an error in one bit
hamming_code(3) = ~hamming_code(3);

% Decode and correct the message
[decoded_msg, err] = decode(hamming_code, 7, 4, 'hamming/binary');

% Display results
disp('Original message:');
disp(msg);
disp('Decoded message:');
disp(decoded_msg);
disp('Number of corrected errors:');
disp(err);
