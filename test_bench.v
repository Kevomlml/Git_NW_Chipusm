`timescale 1ns / 1ps

module tb_neural_network;

    // Entradas
    reg clk;
    reg reset;
    reg changes;
    reg [7:0] data_in; 

    // Salidas
    wire [7:0] network_outputs;

    // Instancia del módulo a probar
    neural_network uut (
        .clk(clk),
        .reset(reset),
        .changes(changes),
        .data_in(data_in),
        .network_outputs(network_outputs)
    );

    always #8 clk = ~clk;
    
    initial begin
        $dumpfile("signals.vcd");
        $dumpvars(0,tb_neural_network);
        // Inicialización de señales
        clk = 0;
        reset = 1;
        changes = 0;
        data_in = 8'd0;

        // Esperar 80 ns para el reset global
        #80;
        
        // Desactivar reset
        reset = 0;

        //state_in 
        #8
        data_in = 8'd10; //x_in_3
        #8
        data_in = 8'd9; //x_in_2
        #8
        data_in = 8'd8; //x_in_1
        #8
        data_in = 8'd7; //x_in_0
        #8
        changes = 1;
        #8
        changes = 0;
        #8
        data_in = 8'd0; //th3
        #8
        data_in = 8'd4; //b3
        #8
        data_in = 8'd4; //w33
        #8
        data_in = 8'd4; //w32
        #8
        data_in = 8'd4; //w31
        #8
        data_in = 8'd4; //w30
        #8
        data_in = 8'd0; //th2
        #8
        data_in = 8'd3; //b2
        #8
        data_in = 8'd3; //w23
        #8
        data_in = 8'd3; //w22
        #8
        data_in = 8'd3; //w21
        #8
        data_in = 8'd3; //w20
        #8
        data_in = 8'd0; //th1
        #8
        data_in = 8'd2; //b1
        #8
        data_in = 8'd2; //w13
        #8
        data_in = 8'd2; //w12
        #8
        data_in = 8'd2; //w11
        #8
        data_in = 8'd2; //w10
        #8
        data_in = 8'd0; //th0
        #8
        data_in = 8'd1; //b0
        #8
        data_in = 8'd1; //w03
        #8
        data_in = 8'd1; //w02
        #8
        data_in = 8'd1; //w01
        #8
        data_in = 8'd1; //w00
        #8
        changes=1;
        #8
        changes=0;
        #16 //result


        // Finalizar simulación
        #200;
        $finish;

    end
endmodule
