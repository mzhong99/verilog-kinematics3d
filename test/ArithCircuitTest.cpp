#define DOCTEST_CONFIG_IMPLEMENT_WITH_MAIN
#include <doctest.h>

#include <verilated.h>
#include <verilated_vcd_c.h>

#include "VArithCircuit.h"
#include "VArithCircuit___024root.h"

#define SIM_STEP 1

TEST_CASE("ArithCircuitTest") {
    VArithCircuit *dut = new VArithCircuit;

    Verilated::traceEverOn(true);
    VerilatedVcdC *vcd_trace = new VerilatedVcdC();
    dut->trace(vcd_trace, 5);
    vcd_trace->open("waveform.vcd");

    vluint64_t sim_time = 0;

    for (uint64_t OpA = 0; OpA < UINT8_MAX; OpA++) {
        for (uint64_t OpB = 0; OpB < UINT8_MAX; OpB++) {
            for (uint64_t opsel = 0; opsel < (1 << 3); opsel++) {
                dut->OpA = OpA;
                dut->OpB = OpB;
                dut->opselect = opsel;

                dut->eval();
                vcd_trace->dump(sim_time);
                sim_time += SIM_STEP;
            }
        }
    }

    vcd_trace->close();
    delete dut;
}
