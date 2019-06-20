## YQ Quantum Circuit Simulator
* Language: [Julia](https://julialang.org)
* Dependency: [ITensors](https://itensor.org)
* Uses Tensor Network methods, namely _Matrix Product State (MPS)_ to simulate quantum circuit.

## TODO:
- [x] Get dependence working
- [x] Get basic gate application working
- [x] Design algm to support non-local gates (using SWAP gates)
- [x] Build YQ Module, clean up dependency
- [x] Renormalization after SVD truncation (Need to make sure gauge is properly positioned)
- [x] Add support for Exact State
- [x] Implement common gates
- [ ] Add support for left & right svd to reduce cost of moving gauge
- [ ] Measurement
- [ ] QCircuit Basic Structure Design
- [ ] Add support for block of quantum circuits (maybe via QGateSet)
- [ ] Add user-friendly interface
- [ ] Sample quantum algorithms
- [ ] Support Mixed state (part of the state was traced out)

## Potential Changes/ Optimizations / Improvements
- [ ] Consider both adding SWAP and moving gauge when deciding center of canonical form
- [ ] Maybe add support to remember truncation `kwargs...` (in interface.jl?)