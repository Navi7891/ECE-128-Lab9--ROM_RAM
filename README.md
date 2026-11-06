# ECE 128 Lab 9 — Simple Text-File Versions

These files extend the original RAM and ROM designs for **Q1 and Q2** of Lab 9. The original designs, simulations, and synthesis results already collected in Vivado can stay unchanged.

## What each file does

- `MEM.v` — the **same original RAM design** (8 locations × 8 bits), included only so the new testbench has its design available.
- `MEM_file_tb.v` — uses the RAM design, writes eight values, then saves the eight RAM words to `ram_data.txt` using `$writememh`.
- `ROM_file.v` — an 8-location × 4-bit ROM, using the simple memory-array syntax from Lecture 8; loads its eight words from `rom_data.mem` using `$readmemh`.
- `ROM_file_tb.v` — tests ROM addresses 0 through 7 like the original `ROM_tb.v`.
- `rom_data.mem` — **plain text**, one hexadecimal digit per line. Vivado recognizes the `.mem` extension as a memory initialization file. It is a text file even though its extension is `.mem`.

The two new file-I/O commands are a small addition **authorized by the student's clarification**; they were not demonstrated in the uploaded lectures. The memory designs, data widths, `initial`, `assign`, and testbench delays follow the style in the class materials.

## Q1 — Save RAM to a text file

1. Keep your existing `MEM.v` under **Design Sources**. Do not add a second copy of `MEM.v` if it is already there.
2. Add `MEM_file_tb.v` as a **Simulation Source**.
3. Under Simulation Sources, right-click `MEM_file_tb` and select **Set as Top**.
4. Run **Behavioral Simulation** and use **Zoom Fit**.
5. Take a screenshot of the waveform. The line `$writememh("ram_data.txt", dut.mem);` creates a text file during simulation. For a standard Vivado project, look in the simulation working directory under `<project_name>.sim/sim_1/behav/xsim/`; if you cannot locate it, inspect Tcl Console output and search your project folder for `ram_data.txt`.

### Expected `ram_data.txt` contents

Each line represents the value at addresses 0 through 7, in order:

```
0f
aa
55
f0
01
33
cc
ff
```

These are the **expected** values based on the testbench; you must verify the file Vivado actually writes. The simulation also checks reading the values through the RAM's output.

## Q2 — Load ROM from a text file

1. Add `ROM_file.v` as a **Design Source**.
2. Add `ROM_file_tb.v` as a **Simulation Source**.
3. Add `rom_data.mem` to the Vivado project as a **Memory Initialization File** (it is plain text). In **Add Sources**, choose **Add or Create Design Sources**, click **Add Files**, select `rom_data.mem`, and keep **Copy sources into project** checked. Vivado should classify the `.mem` file as a memory initialization file.
4. Under Simulation Sources, right-click `ROM_file_tb` and select **Set as Top**.
5. Run **Behavioral Simulation**, use **Zoom Fit**, and take a screenshot. The expected output at addresses 0 to 7 is `0, C, 6, 7, 8, 1, D, E`.

If the ROM waveform contains `X` values, first verify that `rom_data.mem` is listed in the project and can be found by the simulator. Do not change the ROM table values.

## Synthesis

To synthesize the text-file ROM version, set `ROM_file` (not `ROM_file_tb`) as **Design Top** and run synthesis. The RAM design remains `MEM.v` so its logic is unchanged; the new RAM file-saving command exists only in its testbench and is not intended for synthesis. Save utilization screenshots from the actual Vivado reports; do not invent metrics.

## GitHub and report

Upload the Verilog sources, both testbenches, and `rom_data.mem`. After running the RAM testbench, also add the **actual generated** `ram_data.txt` as evidence. Include the two waveform screenshots and the utilization results in the report. The existing original files should be kept too.

## Sources

- `Lab#9_Assignment_ROM_RAM.docx`, page 1: Q1, Q2 and report requirements.
- `ECE128_L8_ROM_RAM.pdf`, slides 10, 11, 14, and 17: memory array, single-port RAM, ROM design examples.
- `ECE128_L10_Xilinx IP.pdf`, slides 10–11: basic testbench pattern (not file I/O).
