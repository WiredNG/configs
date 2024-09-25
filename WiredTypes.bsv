package WiredTypes;

import WiredParam::*;
import LoongArchInst::*;

// 分支 SPEC BITS
typedef Bit#(BRANCH_SLOT) SpecTag;
typedef Bit#(TLog#(BRANCH_SLOT)) SpecId;

typedef Bit#(64) Data_t;
typedef Bit#(64) VAddr_t;
typedef Bit#(48) PAddr_t;

// 流水线中的类型信息
typedef Bit#(5) GpArchRid;
typedef Bit#(5) FpArchRid;
typedef union tagged {
    GpArchRid Gp;
    FpArchRid Fp;
} ArchRid deriving (Bits, Eq, FShow, Bounded);

typedef Bit#(TLog#(INT_PHYREG_NUM)) GpPhyRid;
typedef Bit#(TLog#(FP_PHYREG_NUM))  FpPhyRid;

typedef union tagged {
    GpPhyRid Gp;
    FpPhyRid Fp;
} PhyRid deriving (Bits, Eq, FShow, Bounded);

typedef struct {
    Maybe#(ArchRid) src0; // A Valid dst with 0, means scratch pad
    Maybe#(ArchRid) src1;
    Maybe#(ArchRid) dst;  // A Valid dst with 0, means temp registers for sta/fmadd
} ArchRegs deriving (Bits, Eq, FShow);
// stx may need 3 src registers 
// fmadd may need 3 src registers with an additional dst registers

typedef struct {
    Maybe#(PhyRid) src0;
    Maybe#(PhyRid) src1;
    Maybe#(PhyRid) dst;
} PhyRegs deriving (Bits, Eq, FShow);

typedef Bit#(TLog#(ROB_ENTRY_NUM)) RobId;

typedef struct {
    PhyRid dst;
    RobId robId;
} ExcBundle deriving(Bits, Eq, FShow);

endpackage : WiredTypes
