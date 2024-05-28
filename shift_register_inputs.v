module shift_register_inputs(
    input clk,rstn
    input [7:0] data_in,
    input [1:0] selector,  // From the state machine. Determines where do the neuron inputs come from
    
    input [7:0] neuron0_output;
    input [7:0] neuron1_output;
    input [7:0] neuron2_output;
    input [7:0] neuron3_output;

    output reg [7:0] neuron_input0,
    output reg [7:0] neuron_input1,
    output reg [7:0] neuron_input2,
    output reg [7:0] neuron_input3,
);




always@(posedge clk)
begin

    if(rstn) 
    begin
        neuron_input0 <= 8'b00000000;
        neuron_input1 <= 8'b00000000;
        neuron_input2 <= 8'b00000000;
        neuron_input3 <= 8'b00000000;
        output <= 8'b00000000;
    end

    else
    begin
        case(selector)
            2'b00   :   begin 
                            neuron_input0 <= data_in;
                            neuron_input1 <= neuron_input0;
                            neuron_input2 <= neuron_input1;
                            neuron_input3 <= neuron_input2;
                        end
            2'b01   :   begin
                            neuron_input0 <= neuron_input0;
                            neuron_input1 <= neuron_input1;
                            neuron_input2 <= neuron_input2;
                            neuron_input3 <= neuron_input3;
                        end
            2'b10   :   begin
                            neuron_input0 <= neuron0_output
                            neuron_input1 <= neuron1_output
                            neuron_input2 <= neuron2_output
                            neuron_input3 <= neuron3_output
                        end
            default :   begin
                            neuron_input0 <= neuron_input0;
                            neuron_input1 <= neuron_input1;
                            neuron_input2 <= neuron_input2;
                            neuron_input3 <= neuron_input3;
                        end

        endcase
    end
end
endmodule