// Honeybee mass stinging model. A population of bees a_1, ..., a_n defending the hive decide to sting or not.// Published in Hajnal et al., Data-informed parameter synthesis for population Markov chains, HSB 2019// Semisynchronous semantics, 2-paramsdtmc 
 
const double p;  //probability to sting at initial condition
const double q;  //probability to sting after sensing the alarm pheromone

module two_param_agents_10
       // ai - state of agent i:  -1:init, 0:total_failure, 1:success, 2:failure_after_first_attempt
       // where success denotes decision to sting, failure the opposite
       // b = 1: 'final'/leaf/BSCC state flag
       a0 : [-1..2] init -1; 
       a1 : [-1..2] init -1; 
       a2 : [-1..2] init -1; 
       a3 : [-1..2] init -1; 
       a4 : [-1..2] init -1; 
       a5 : [-1..2] init -1; 
       a6 : [-1..2] init -1; 
       a7 : [-1..2] init -1; 
       a8 : [-1..2] init -1; 
       a9 : [-1..2] init -1; 
       b : [0..1] init 0; 

       //  initial transition
       []   a0 = -1 & a1 = -1  & a2 = -1  & a3 = -1  & a4 = -1  & a5 = -1  & a6 = -1  & a7 = -1  & a8 = -1  & a9 = -1 -> 1.0*p*p*p*p*p*p*p*p*p*p: (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1) & (a5'=1) & (a6'=1) & (a7'=1) & (a8'=1) & (a9'=1) + 10.0*p*p*p*p*p*p*p*p*p*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1) & (a5'=1) & (a6'=1) & (a7'=1) & (a8'=1) & (a9'=2) + 45.0*p*p*p*p*p*p*p*p*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1) & (a5'=1) & (a6'=1) & (a7'=1) & (a8'=2) & (a9'=2) + 120.0*p*p*p*p*p*p*p*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1) & (a5'=1) & (a6'=1) & (a7'=2) & (a8'=2) & (a9'=2) + 210.0*p*p*p*p*p*p*(1-p)*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1) & (a5'=1) & (a6'=2) & (a7'=2) & (a8'=2) & (a9'=2) + 252.0*p*p*p*p*p*(1-p)*(1-p)*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=1) & (a5'=2) & (a6'=2) & (a7'=2) & (a8'=2) & (a9'=2) + 210.0*p*p*p*p*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=1) & (a4'=2) & (a5'=2) & (a6'=2) & (a7'=2) & (a8'=2) & (a9'=2) + 120.0*p*p*p*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=1) & (a3'=2) & (a4'=2) & (a5'=2) & (a6'=2) & (a7'=2) & (a8'=2) & (a9'=2) + 45.0*p*p*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=1) & (a2'=2) & (a3'=2) & (a4'=2) & (a5'=2) & (a6'=2) & (a7'=2) & (a8'=2) & (a9'=2) + 10.0*p*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p): (a0'=1) & (a1'=2) & (a2'=2) & (a3'=2) & (a4'=2) & (a5'=2) & (a6'=2) & (a7'=2) & (a8'=2) & (a9'=2) + 1.0*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p)*(1-p): (a0'=2) & (a1'=2) & (a2'=2) & (a3'=2) & (a4'=2) & (a5'=2) & (a6'=2) & (a7'=2) & (a8'=2) & (a9'=2);

       // some ones, some zeros transitions
       []   a0 = 0 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 0) & (a1'= 0) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 0) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 0 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 0) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 0 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 0) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 0 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 1) & (a9'= 0) & (b'=1);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 1 -> (a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 1) & (a9'= 1) & (b'=1);

       // some ones, some twos transitions
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 2) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 2) & (a8'= 2) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 2 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 2) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 2) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 2 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 1) & (a9'= 2) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 2) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 2 -> q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 1) & (a9'= 1) + 1-q:(a0'= 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 1) & (a9'= 0);

       // some ones, some twos, some zeros transitions
       []   a0 = 1 & a1 = 2 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 0) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 2) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 2) & (a2'= 2) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 2) & (a2'= 2) & (a3'= 2) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 2) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 2) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 2) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 2 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 2) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 2 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 2) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 2 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 2 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 2) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 2 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 2 & a5 = 2 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 2 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 2) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 2 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 2 & a6 = 2 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 2 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 2) & (a7'= 2) & (a8'= 2) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 2) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 2 & a7 = 0 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 0) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 2 & a7 = 2 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 2) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 2) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 2 & a7 = 2 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 2) & (a8'= 2) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 2) & (a7'= 2) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 2 & a8 = 0 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 0) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 0) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 2 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 2) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 2) & (a8'= 0) & (a9'= 0);
       []   a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 2 & a9 = 0 -> q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 1) & (a9'= 0) + 1-q: (a0' = 1) & (a1'= 1) & (a2'= 1) & (a3'= 1) & (a4'= 1) & (a5'= 1) & (a6'= 1) & (a7'= 1) & (a8'= 0) & (a9'= 0);

       // all twos transition
       []   a0 = 2 & a1 = 2  & a2 = 2  & a3 = 2  & a4 = 2  & a5 = 2  & a6 = 2  & a7 = 2  & a8 = 2  & a9 = 2 -> (a0'= 0) & (a1'= 0) & (a2'= 0) & (a3'= 0) & (a4'= 0) & (a5'= 0) & (a6'= 0) & (a7'= 0) & (a8'= 0) & (a9'= 0);
endmodule 

rewards "mean" 
       a0 = 0 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:0;
       a0 = 1 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:1;
       a0 = 1 & a1 = 1 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:2;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:3;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:4;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:5;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:6;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 0 & a8 = 0 & a9 = 0:7;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 0 & a9 = 0:8;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 0:9;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 1:10;
endrewards 
rewards "mean_squared" 
       a0 = 0 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:0;
       a0 = 1 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:1;
       a0 = 1 & a1 = 1 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:4;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:9;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:16;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:25;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:36;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 0 & a8 = 0 & a9 = 0:49;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 0 & a9 = 0:64;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 0:81;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 1:100;
endrewards 
rewards "mean_cubed" 
       a0 = 0 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:0;
       a0 = 1 & a1 = 0 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:1;
       a0 = 1 & a1 = 1 & a2 = 0 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:8;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 0 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:27;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 0 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:64;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 0 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:125;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 0 & a7 = 0 & a8 = 0 & a9 = 0:216;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 0 & a8 = 0 & a9 = 0:343;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 0 & a9 = 0:512;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 0:729;
       a0 = 1 & a1 = 1 & a2 = 1 & a3 = 1 & a4 = 1 & a5 = 1 & a6 = 1 & a7 = 1 & a8 = 1 & a9 = 1:1000;
endrewards 
