//===-- SWIG Interface for SBTarget -----------------------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

namespace lldb {

%feature("docstring",
"Represents a collection of SBValues.  Both SBFrame's GetVariables() and
GetRegisters() return a SBValueList.

SBValueList supports SBValue iteration. For example (from test/lldbutil.py),

def get_registers(frame, kind):
    '''Returns the registers given the frame and the kind of registers desired.

    Returns None if there's no such kind.
    '''
    registerSet = frame.GetRegisters() # Return type of SBValueList.
    for value in registerSet:
        if kind.lower() in value.GetName().lower():
            return value

    return None

def get_GPRs(frame):
    '''Returns the general purpose registers of the frame as an SBValue.

    The returned SBValue object is iterable.  An example:
        ...
        from lldbutil import get_GPRs
        regs = get_GPRs(frame)
        for reg in regs:
            print '%s => %s' % (reg.GetName(), reg.GetValue())
        ...
    '''
    return get_registers(frame, 'general purpose')

def get_FPRs(frame):
    '''Returns the floating point registers of the frame as an SBValue.

    The returned SBValue object is iterable.  An example:
        ...
        from lldbutil import get_FPRs
        regs = get_FPRs(frame)
        for reg in regs:
            print '%s => %s' % (reg.GetName(), reg.GetValue())
        ...
    '''
    return get_registers(frame, 'floating point')

def get_ESRs(frame):
    '''Returns the exception state registers of the frame as an SBValue.

    The returned SBValue object is iterable.  An example:
        ...
        from lldbutil import get_ESRs
        regs = get_ESRs(frame)
        for reg in regs:
            print '%s => %s' % (reg.GetName(), reg.GetValue())
        ...
    '''
    return get_registers(frame, 'exception state')
"
         ) SBValueList;
class SBValueList
{
public:

    SBValueList ();

    SBValueList (const lldb::SBValueList &rhs);

    ~SBValueList();

    bool
    IsValid() const;

    void
    Append (const lldb::SBValue &val_obj);

    void
    Append (const lldb::SBValueList& value_list);

    uint32_t
    GetSize() const;

    lldb::SBValue
    GetValueAtIndex (uint32_t idx) const;

    lldb::SBValue
    FindValueObjectByUID (lldb::user_id_t uid);
};

} // namespace lldb
