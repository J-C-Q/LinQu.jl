
mutable struct CustomizedGate
	f::Function
	qubits::Vector{Int}
	param:: Vector{T} where {T<:Real}
	name::String
	CustomizedGate(f::Function, 
				   qubits::Vector{Int},
				   param:: Vector{T} where {T <: Number},
				   name="CustomizedGate") = new(f,qubits, param, name)
end # struct

qubits(gate::CustomizedGate) = gate.qubits
func(gate::CustomizedGate) = gate.f
name(gate::CustomizedGate) = gate.name
param(gate::CustomizedGate) = gate.param
copy(gate::CustomizedGate) = CustomizedGate(gate.f,copy(gate.qubits), copy(gate.param), gate.name)

changeParams!(gate::CustomizedGate, newParam::Vector{Real}) = (gate.param = newParam; return gate)
changeParams(gate::CustomizedGate, newParam::Vector{Real}) = CustomizedGate(gate.f, newParam, copy(qubits))
changeParam!(gate::CustomizedGate, newParam::Real) = (gate.param = [newParam]; return gate)

data(gate::CustomizedGate) = func(gate)((gate.param)...)

RxFunc(θ::Real) = cos(θ/2)I_DATA - sin(θ/2)im* X_DATA
RyFunc(θ::Real) = cos(θ/2)I_DATA - sin(θ/2)im* Y_DATA
RzFunc(θ::Real) = cos(θ/2)I_DATA - sin(θ/2)im* Z_DATA

function RϕFunc(θ::Real)
	phaseGate = zeros(ComplexF64,2,2)
	phaseGate[1,1] = 1
	phaseGate[2,2] = exp(θ* 1im)
	return phaseGate
end

Rx(θ::Real, qubits::Location...) = CustomizedGate(RxFunc, [θ], qubits, "Rx")
Ry(θ::Real, qubits::Location...) = CustomizedGate(RyFunc, [θ], qubits, "Ry")
Rz(θ::Real, qubits::Location...) = CustomizedGate(RzFunc, [θ], qubits, "Rz")
Rϕ(θ::Real, qubits::Location...) = CustomizedGate(RϕFunc, [θ], qubits, "Rϕ")

function show(io::IO,gate::CustomizedGate)
	print("$(name(gate)), $(param(gate)) ,  $(qubits(gate))\n")
end