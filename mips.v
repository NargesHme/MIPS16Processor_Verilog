 module mips_16( input[2:0] opcode,
					  input[3:0] Function,
					  input[15:0] reg1,reg2,L,LJ,
                 output[15:0] alu_result,pc_out
   );  
 reg[15:0] pc_current;
 wire signed[15:0] pc_next,pc2;  
 wire [15:0] instr;  
 wire[1:0] reg_dst,mem_to_reg,alu_op;  
 wire jump,branch,mem_read,mem_write,alu_src,reg_write;
 wire JRControl;  
 wire [2:0] ALU_Control;  
 wire [15:0] ALU_out;  
 wire zero_flag;   
 wire sign_or_zero; 
 wire signed[15:0] PC_j, PC_beq, PC_4beq,PC_4beqj,PC_jr;
 always @(pc_next)  
 begin 
       pc_current <= pc_next; 
		  
 end 	
 assign pc2 = pc_current + 16'd2;
 assign PC_beq = L;
 
 // control unit  
 control control_unit(.opcode(opcode),.reg_dst(reg_dst)  
                ,.mem_to_reg(mem_to_reg),.alu_op(alu_op),.jump(jump),.branch(branch),.mem_read(mem_read),  
                .mem_write(mem_write),.alu_src(alu_src),.reg_write(reg_write),.sign_or_zero(sign_or_zero));     
 // JR control  
 JR_Control JRControl_unit(.alu_op(alu_op),.funct(Function),.JRControl(JRControl));       
 // ALU control unit  
 ALUControl ALU_Control_unit(.ALUOp(alu_op),.Function(Function),.ALU_Control(ALU_Control));    
 // ALU   
 alu alu_unit(.a(reg1),.b(reg2),.alu_control(ALU_Control),.result(ALU_out),.zero(zero_flag));    
 // beq control  
 assign beq_control = branch & zero_flag;
 assign PC_4beq = (beq_control==1'b1) ? PC_beq : pc2;
// PC_j  
 assign PC_j = LJ;  
 // PC_4beqj  
 assign PC_4beqj = (jump == 1'b1) ? PC_j : PC_4beq;  
 // PC_jr  
 assign PC_jr = reg1;  
 // PC_next  
 assign pc_next = (JRControl==1'b1) ? PC_jr : PC_4beqj;  
 // output   
 assign pc_out = pc_current;
 assign alu_result = ALU_out;  
 endmodule  