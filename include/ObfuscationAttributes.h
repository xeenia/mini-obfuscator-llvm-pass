#pragma once
#include "llvm/ADT/StringRef.h"
#include "llvm/Support/ErrorHandling.h"

namespace obfAttributes {

enum class DummyRole : unsigned {
    Generic = 0,
    CFFState = 1,
};

inline constexpr llvm::StringLiteral dummyFunctionAttr = "obf.dummy";

inline constexpr llvm::StringLiteral dummyRoleAttr = "obf.dummy.role";

inline llvm::StringRef toString(DummyRole role) {
    switch (role) {
        case DummyRole::Generic: return "0";
        case DummyRole::CFFState: return "1";
    }
    llvm_unreachable("Unknown dummy role");
}

} // namespace obfAttributes