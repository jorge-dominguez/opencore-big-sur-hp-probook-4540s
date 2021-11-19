/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20140424-64 [Jun 25 2014]
 * Copyright (c) 2000 - 2014 Intel Corporation
 * 
 * Disassembly of DSDT.aml, Fri Nov 19 08:49:13 2021
 *
 * Original Table Header:
 *     Signature        "DSDT"
 *     Length           0x0002154C (136524)
 *     Revision         0x02
 *     Checksum         0xB6
 *     OEM ID           "HPQOEM"
 *     OEM Table ID     "17F6    "
 *     OEM Revision     0x00000001 (1)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20110112 (537985298)
 */
DefinitionBlock ("DSDT.aml", "DSDT", 2, "HPQOEM", "17F6    ", 0x00000001)
{
    /*
     * iASL Warning: There were 4 external control methods found during
     * disassembly, but only 1 was resolved (3 unresolved). Additional
     * ACPI tables may be required to properly disassemble the code. This
     * resulting disassembler output file may not compile because the
     * disassembler did not know how many arguments to assign to the
     * unresolved methods.
     *
     * If necessary, the -fe option can be used to specify a file containing
     * control method external declarations with the associated method
     * argument counts. Each line of the file must be of the form:
     *     External (<method pathname>, MethodObj, <argument count>)
     * Invocation:
     *     iasl -fe refs.txt -d dsdt.aml
     *
     * The following methods were unresolved and many not compile properly
     * because the disassembler had to guess at the number of arguments
     * required for each:
     */
    External (_TZX.OSIT, MethodObj)    // Warning: Unresolved method, guessing 0 arguments
    External (FPED, MethodObj)    // Warning: Unresolved method, guessing 0 arguments
    External (WMAB, MethodObj)    // Warning: Unresolved method, guessing 1 arguments

    External (_PR_.CPPC, IntObj)
    External (_PR_.CPU0._PPC, IntObj)
    External (_PR_.CPU0._PSS, IntObj)
    External (_SB_.IFFS.FFRU, UnknownObj)
    External (_SB_.PCI0.PEGP.DGFX.DD02, UnknownObj)
    External (_SB_.PCI0.PEGP.DGFX.SVID, UnknownObj)
    External (_SB_.PNLF, UnknownObj)
    External (CFGD, UnknownObj)
    External (PDC0, UnknownObj)
    External (PDC1, UnknownObj)
    External (PDC2, UnknownObj)
    External (PDC3, UnknownObj)
    External (PDC4, UnknownObj)
    External (PDC5, UnknownObj)
    External (PDC6, UnknownObj)
    External (PDC7, UnknownObj)
    External (XOSI, MethodObj)    // 1 Arguments

    Name (FMBL, 0x01)
    Name (LSTA, 0x00)
    Name (IDPM, 0x00)
    Method (\HPTS, 1, NotSerialized)
    {
        Store (Arg0, SLPT) /* \SLPT */
        \_SB.ODGW (Or (0x5400, Arg0))
        If (CondRefOf (\_SB.IFFS.FFRU))
        {
            Store (0x00, \_SB.IFFS.FFRU) /* External reference */
        }

        If (LEqual (Arg0, 0x05))
        {
            \_SB.SSMI (0xEA82, Arg0, 0x00, 0x00, 0x00)
        }

        If (LGreater (Arg0, 0x00))
        {
            \_SB.SSMI (0xEA83, 0x00, 0x00, 0x00, 0x00)
            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
            If (\_SB.PCI0.LPCB.EC0.ECRG)
            {
                Store (0x00, \_SB.PCI0.LPCB.EC0.HSST)
            }

            Release (\_SB.PCI0.LPCB.EC0.ECMX)
            PPTS (Arg0)
            If (LNotEqual (Arg0, 0x05))
            {
                \_SB.PCI0.LPCB.EC0.BTDR (0x00)
                Store (0xFF, \_SB.PCI0.LPCB.EC0.NGBF)
                Store (0xFF, \_SB.PCI0.LPCB.EC0.NGBT)
                Store (0x07, \_SB.PCI0.LPCB.EC0.GACP)
                Store (0x01, \_SB.NFBS)
                If (LEqual (Arg0, 0x03))
                {
                    Store (\_SB.LID._LID (), LSTA) /* \LSTA */
                    If (LNotEqual (And (PNHM, 0x000F0FF0), 0x000106E0))
                    {
                        Store (\APMC, IDPM) /* \IDPM */
                    }
                }

                If (LEqual (Arg0, 0x04))
                {
                    \_SB.WLBU.INIT ()
                }
            }
        }
    }

    Method (\HWAK, 1, NotSerialized)
    {
        Store (0x00, SLPT) /* \SLPT */
        \_SB.ODGW (Or (0x5600, Arg0))
        If (LEqual (Arg0, 0x03))
        {
            \_SB.SSMI (0xEA80, 0x00, 0x00, 0x00, 0x00)
        }

        \_SB.PCI0.LPCB.EC0.ITLB ()
        \_SB.PCI0.LPCB.EC0.RPPC (0x01)
        If (\_SB.PCI0.LPCB.EC0.ECRG)
        {
            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
            Store (0x01, \_SB.PCI0.LPCB.EC0.ACPI)
            Store (0x00, \_SB.PCI0.LPCB.EC0.SLPT)
            Store (\WCOS (), \_SB.PCI0.LPCB.EC0.OST)
            Release (\_SB.PCI0.LPCB.EC0.ECMX)
        }

        If (LGreater (Arg0, 0x02))
        {
            \_TZ.RETD ()
            \_TZ.INTM (0x01)
            Store (0x01, \_SB.NFBS)
            If (LEqual (Arg0, 0x03))
            {
                If (CondRefOf (\_SB.IFFS.FFRU))
                {
                    Notify (\_SB.SLPB, 0x02) // Device Wake
                }

                Store (\_SB.LID._LID (), Local0)
                If (XOr (Local0, LSTA))
                {
                    \_SB.PCI0.GFX0.GLID (Local0)
                }

                If (LNotEqual (And (PNHM, 0x000F0FF0), 0x000106E0))
                {
                    Store (IDPM, \APMC)
                }
            }

            If (LEqual (Arg0, 0x04))
            {
                \_SB.WMID.WGWE (0x05, 0x00)
            }
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (\WCOS (), 0x01)))
        {
            Notify (\_SB.SLPB, 0x02) // Device Wake
        }

        Store (\_SB.PCI0.LPCB.EC0.GACS (), Local2)
        \_SB.PCI0.LPCB.EC0.PWUP (0x03, 0xFF)
        Store (\_SB.PCI0.LPCB.EC0.GBAP (), Local1)
        Store (\_SB.PCI0.LPCB.EC0.GACS (), Local3)
        Store (Local3, PWRS) /* \PWRS */
        XOr (Local2, Local3, Local3)
        If (LGreater (Arg0, 0x02))
        {
            Notify (\_SB.AC, 0x80) // Status Change
            PCNT ()
        }

        If (LEqual (Local3, 0x00))
        {
            If (LEqual (Arg0, 0x04))
            {
                XOr (Local2, 0x01, \_SB.ACST)
            }
        }

        PWAK (Arg0)
        \_SB.VWAK (Arg0)
        Store (\_SB.HST1.GHID (), Local0)
        If (LEqual (Arg0, 0x03)) {}
        Else
        {
            \_SB.PCI0.ACEL.ITAL ()
        }
    }

    Method (PCNT, 0, Serialized)
    {
        If (LGreater (TCNT, 0x01))
        {
            If (And (PDC0, 0x18))
            {
                Notify (\_PR.CPU0, 0x81) // C-State Change
            }

            If (And (PDC1, 0x18))
            {
                Notify (\_PR.CPU1, 0x81) // C-State Change
            }

            If (And (PDC2, 0x18))
            {
                Notify (\_PR.CPU2, 0x81) // C-State Change
            }

            If (And (PDC3, 0x18))
            {
                Notify (\_PR.CPU3, 0x81) // C-State Change
            }

            If (And (PDC4, 0x18))
            {
                Notify (\_PR.CPU4, 0x81) // C-State Change
            }

            If (And (PDC5, 0x18))
            {
                Notify (\_PR.CPU5, 0x81) // C-State Change
            }

            If (And (PDC6, 0x18))
            {
                Notify (\_PR.CPU6, 0x81) // C-State Change
            }

            If (And (PDC7, 0x18))
            {
                Notify (\_PR.CPU7, 0x81) // C-State Change
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x81) // C-State Change
        }
    }

    Mutex (MUTX, 0x00)
    Method (P8XH, 2, Serialized)
    {
        If (LEqual (Arg0, 0x00))
        {
            \_SB.ODBG (Arg1)
            Store (Or (And (P80D, 0xFFFFFF00), Arg1), P80D) /* \P80D */
        }

        If (LEqual (Arg0, 0x01))
        {
            \_SB.ODG1 (Arg1)
            Store (Or (And (P80D, 0xFFFF00FF), ShiftLeft (Arg1, 0x08)
                ), P80D) /* \P80D */
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Or (And (P80D, 0xFF00FFFF), ShiftLeft (Arg1, 0x10)
                ), P80D) /* \P80D */
        }

        If (LEqual (Arg0, 0x03))
        {
            Store (Or (And (P80D, 0x00FFFFFF), ShiftLeft (Arg1, 0x18)
                ), P80D) /* \P80D */
        }
    }

    OperationRegion (SPRT, SystemIO, 0xB2, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }

    Method (\_PIC, 1, NotSerialized)  // _PIC: Interrupt Model
    {
        Store (Arg0, GPIC) /* \GPIC */
    }

    Method (_PTS, 1, NotSerialized)  // _PTS: Prepare To Sleep
    {
        HPTS (Arg0)
        If (LEqual (Arg0, 0x03))
        {
            If (LAnd (DTSE, LGreater (TCNT, 0x01)))
            {
                TRAP (0x02, 0x1E)
            }
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x05)))
        {
            If (LEqual (XHCI, 0x02))
            {
                Store (0xFFFFFFF0, Local0)
                And (Local0, \_SB.PCI0.XHC.PR3, \_SB.PCI0.XHC.PR3)
            }
        }
    }

    Method (_WAK, 1, NotSerialized)  // _WAK: Wake
    {
        HWAK (Arg0)
        \_SB.PCI0.POSC (OSCC, 0x00)
        If (LEqual (Arg0, 0x03)) {}
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            If (LAnd (DTSE, LGreater (TCNT, 0x01)))
            {
                TRAP (0x02, 0x14)
            }

            If (And (CFGD, 0x01000000))
            {
                If (LAnd (And (CFGD, 0xF0), LAnd (LEqual (OSYS, 0x07D1), 
                    LNot (And (PDC0, 0x10)))))
                {
                    TRAP (0x01, 0x48)
                }
            }

            If (LEqual (OSYS, 0x07D2))
            {
                If (And (CFGD, 0x01))
                {
                    If (LGreater (\_PR.CPU0._PPC, 0x00))
                    {
                        Subtract (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                        Add (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                    }
                    Else
                    {
                        Add (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                        Subtract (\_PR.CPU0._PPC, 0x01, \_PR.CPU0._PPC) /* External reference */
                        PNOT ()
                    }
                }
            }
        }

        Return (Package (0x02)
        {
            0x00, 
            0x00
        })
    }

    Method (GETB, 3, Serialized)
    {
        Multiply (Arg0, 0x08, Local0)
        Multiply (Arg1, 0x08, Local1)
        CreateField (Arg2, Local0, Local1, TBF3)
        Return (TBF3) /* \GETB.TBF3 */
    }

    Method (PNOT, 0, Serialized)
    {
        If (LGreater (TCNT, 0x01))
        {
            If (And (PDC0, 0x08))
            {
                Notify (\_PR.CPU0, 0x80) // Performance Capability Change
                If (And (PDC0, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU0, 0x81) // C-State Change
                }
            }

            If (And (PDC1, 0x08))
            {
                Notify (\_PR.CPU1, 0x80) // Performance Capability Change
                If (And (PDC1, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU1, 0x81) // C-State Change
                }
            }

            If (And (PDC2, 0x08))
            {
                Notify (\_PR.CPU2, 0x80) // Performance Capability Change
                If (And (PDC2, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU2, 0x81) // C-State Change
                }
            }

            If (And (PDC3, 0x08))
            {
                Notify (\_PR.CPU3, 0x80) // Performance Capability Change
                If (And (PDC3, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU3, 0x81) // C-State Change
                }
            }

            If (And (PDC4, 0x08))
            {
                Notify (\_PR.CPU4, 0x80) // Performance Capability Change
                If (And (PDC4, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU4, 0x81) // C-State Change
                }
            }

            If (And (PDC5, 0x08))
            {
                Notify (\_PR.CPU5, 0x80) // Performance Capability Change
                If (And (PDC5, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU5, 0x81) // C-State Change
                }
            }

            If (And (PDC6, 0x08))
            {
                Notify (\_PR.CPU6, 0x80) // Performance Capability Change
                If (And (PDC6, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU6, 0x81) // C-State Change
                }
            }

            If (And (PDC7, 0x08))
            {
                Notify (\_PR.CPU7, 0x80) // Performance Capability Change
                If (And (PDC7, 0x10))
                {
                    Sleep (0x64)
                    Notify (\_PR.CPU7, 0x81) // C-State Change
                }
            }
        }
        Else
        {
            Notify (\_PR.CPU0, 0x80) // Performance Capability Change
            Sleep (0x64)
            Notify (\_PR.CPU0, 0x81) // C-State Change
        }
    }

    Method (TRAP, 2, Serialized)
    {
        Store (Arg1, SMIF) /* \SMIF */
        If (LEqual (Arg0, 0x01))
        {
            Store (0x00, TRP0) /* \TRP0 */
        }

        If (LEqual (Arg0, 0x02))
        {
            Store (Arg1, DTSF) /* \DTSF */
            Store (0x00, TRPD) /* \TRPD */
            Return (DTSF) /* \DTSF */
        }

        Return (SMIF) /* \SMIF */
    }

    Scope (\_SB)
    {
        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            Store (0x07D0, OSYS) /* \OSYS */
            If (CondRefOf (\XOSI, Local0))
            {
                If (\XOSI ("Linux"))
                {
                    Store (0x03E8, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2001"))
                {
                    Store (0x07D1, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2001 SP1"))
                {
                    Store (0x07D1, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2001 SP2"))
                {
                    Store (0x07D2, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2001.1"))
                {
                    Store (0x07D3, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2006"))
                {
                    Store (0x07D6, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2009"))
                {
                    Store (0x07D9, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2012"))
                {
                    Store (0x07DC, OSYS) /* \OSYS */
                }

                If (\XOSI ("Windows 2013"))
                {
                    Store (0x07DD, OSYS) /* \OSYS */
                }
            }

            \_TZ.BOTT ()
            \_TZ.RETD ()
            Store (0x01, PFLV) /* \PFLV */
        }
    }

    OperationRegion (GNVS, SystemMemory, 0xB9F79918, 0x01C6)
    Field (GNVS, AnyAcc, Lock, Preserve)
    {
        OSYS,   16, 
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        SCIF,   8, 
        PRM2,   8, 
        PRM3,   8, 
        LCKF,   8, 
        PRM4,   8, 
        PRM5,   8, 
        P80D,   32, 
        LIDS,   8, 
        PWRS,   8, 
        DBGS,   8, 
        THOF,   8, 
        ACT1,   8, 
        ACTT,   8, 
        PSVT,   8, 
        TC1V,   8, 
        TC2V,   8, 
        TSPV,   8, 
        CRTT,   8, 
        DTSE,   8, 
        DTS1,   8, 
        DTS2,   8, 
        DTSF,   8, 
        Offset (0x25), 
        REVN,   8, 
        RES3,   8, 
        Offset (0x28), 
        APIC,   8, 
        TCNT,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PPCM,   8, 
        PPMF,   32, 
        C67L,   8, 
        NATP,   8, 
        CMAP,   8, 
        CMBP,   8, 
        LPTP,   8, 
        FDCP,   8, 
        CMCP,   8, 
        CIRP,   8, 
        SMSC,   8, 
        W381,   8, 
        SMC1,   8, 
        IGDS,   8, 
        TLST,   8, 
        CADL,   8, 
        PADL,   8, 
        CSTE,   16, 
        NSTE,   16, 
        SSTE,   16, 
        NDID,   8, 
        DID1,   32, 
        DID2,   32, 
        DID3,   32, 
        DID4,   32, 
        DID5,   32, 
        KSV0,   32, 
        KSV1,   8, 
        Offset (0x62), 
        DCLK,   16, 
        FSBF,   16, 
        Offset (0x67), 
        BLCS,   8, 
        BRTL,   8, 
        ALSE,   8, 
        ALAF,   8, 
        LLOW,   8, 
        LHIH,   8, 
        Offset (0x6E), 
        EMAE,   8, 
        EMAP,   16, 
        EMAL,   16, 
        Offset (0x74), 
        MEFE,   8, 
        DSTS,   8, 
        Offset (0x78), 
        TPMP,   8, 
        TPME,   8, 
        MORD,   8, 
        TCGP,   8, 
        PPRP,   32, 
        PPRQ,   8, 
        LPPR,   8, 
        GTF0,   56, 
        GTF2,   56, 
        IDEM,   8, 
        GTF1,   56, 
        BID,    8, 
        PLID,   8, 
        Offset (0xAA), 
        ASLB,   32, 
        IBTT,   8, 
        IPAT,   8, 
        ITVF,   8, 
        ITVM,   8, 
        IPSC,   8, 
        IBLC,   8, 
        IBIA,   8, 
        ISSC,   8, 
        I409,   8, 
        I509,   8, 
        I609,   8, 
        I709,   8, 
        IPCF,   8, 
        IDMS,   8, 
        IF1E,   8, 
        HVCO,   8, 
        NXD1,   32, 
        NXD2,   32, 
        NXD3,   32, 
        NXD4,   32, 
        NXD5,   32, 
        NXD6,   32, 
        NXD7,   32, 
        NXD8,   32, 
        GSMI,   8, 
        PAVP,   8, 
        Offset (0xE1), 
        OSCC,   8, 
        NEXP,   8, 
        SBV1,   8, 
        SBV2,   8, 
        Offset (0xEB), 
        DSEN,   8, 
        ECON,   8, 
        GPIC,   8, 
        CTYP,   8, 
        L01C,   8, 
        VFN0,   8, 
        VFN1,   8, 
        VFN2,   8, 
        VFN3,   8, 
        VFN4,   8, 
        Offset (0x100), 
        NVGA,   32, 
        NVHA,   32, 
        AMDA,   32, 
        DID6,   32, 
        DID7,   32, 
        DID8,   32, 
        EBAS,   32, 
        CPSP,   32, 
        EECP,   32, 
        EVCP,   32, 
        XBAS,   32, 
        OBS1,   32, 
        OBS2,   32, 
        OBS3,   32, 
        OBS4,   32, 
        OBS5,   32, 
        OBS6,   32, 
        OBS7,   32, 
        OBS8,   32, 
        Offset (0x157), 
        ATMC,   8, 
        PTMC,   8, 
        ATRA,   8, 
        PTRA,   8, 
        PNHM,   32, 
        TBAB,   32, 
        TBAH,   32, 
        RTIP,   8, 
        TSOD,   8, 
        ATPC,   8, 
        PTPC,   8, 
        PFLV,   8, 
        BREV,   8, 
        SGMD,   8, 
        SGFL,   8, 
        PWOK,   8, 
        HLRS,   8, 
        DSEL,   8, 
        ESEL,   8, 
        PSEL,   8, 
        PWEN,   8, 
        PRST,   8, 
        MXD1,   32, 
        MXD2,   32, 
        MXD3,   32, 
        MXD4,   32, 
        MXD5,   32, 
        MXD6,   32, 
        MXD7,   32, 
        MXD8,   32, 
        GBAS,   16, 
        SGGP,   8, 
        Offset (0x19D), 
        ALFP,   8, 
        IMON,   8, 
        PDTS,   8, 
        PKGA,   8, 
        PAMT,   8, 
        AC0F,   8, 
        AC1F,   8, 
        DTS3,   8, 
        DTS4,   8, 
        Offset (0x1B2), 
        XHCI,   8, 
        XHPM,   8, 
        Offset (0x1B7), 
        XTUB,   32, 
        XTUS,   32, 
        XMPB,   32, 
        Offset (0x1C4), 
        LPMV,   8, 
        MM64,   8
    }

    OperationRegion (ASMA, SystemMemory, 0xB9F7B018, 0x1060)
    Field (ASMA, AnyAcc, NoLock, Preserve)
    {
        ASMB,   33536
    }

    OperationRegion (AF10, SystemMemory, 0xB9F7D018, 0x0D5D)
    Field (AF10, AnyAcc, Lock, Preserve)
    {
        STAT,   32, 
        EVAL,   8, 
        ASTL,   8, 
        ASTG,   256, 
        OWNT,   640, 
        PROD,   640, 
        MODL,   640, 
        PTYP,   640, 
        PFRQ,   640, 
        MEMS,   640, 
        DATE,   640, 
        FAMI,   640, 
        SERL,   640, 
        VREV,   640, 
        VRE2,   640, 
        KBCD,   640, 
        HDDS,   160, 
        HDDM,   320, 
        CDAT,   136, 
        CSTS,   8, 
        CYCL,   8, 
        PBSN,   144, 
        SBSN,   144, 
        BSTS,   8, 
        BORD,   72, 
        APST,   8, 
        OAPW,   3200, 
        NAPW,   3200, 
        SECO,   32, 
        SECS,   32, 
        SKUN,   128, 
        SVID,   80, 
        SSID,   32, 
        BTFC,   160, 
        WLFC,   160, 
        WWFC,   160, 
        GPFC,   160, 
        UUID,   256, 
        CFID,   208, 
        PWDL,   16, 
        USRN,   264, 
        ROLE,   32, 
        CMDV,   32, 
        KBDL,   32, 
        HASH,   160, 
        SPSF,   8, 
        FMOD,   8, 
        NBDL,   8, 
        MBDL,   8, 
        NBAD,   8, 
        MBAD,   8, 
        WUFI,   72, 
        LFND,   1296, 
        ATIM,   48, 
        PCID,   512, 
        PCVR,   40, 
        CURL,   1040, 
        FWSF,   32, 
        FCM,    32, 
        MPMC,   8, 
        SBCT,   120, 
        MSDM,   800, 
        CPRV,   120, 
        PLFN,   320, 
        SNMD,   8, 
        PSSA,   8, 
        PSCF,   8, 
        BCIE,   8, 
        BCSC,   8, 
        HVER,   256, 
        HVCH,   512, 
        MMS1,   640, 
        MMS2,   640, 
        MMS3,   640, 
        MMS4,   640, 
        NMMS,   8, 
        CUBT,   480, 
        FBID,   1600, 
        ETOD,   88
    }

    OperationRegion (HPDF, SystemMemory, 0xB9F7EE18, 0x017D)
    Field (HPDF, AnyAcc, Lock, Preserve)
    {
        SLPT,   4, 
        WHOS,   4, 
        SDFG,   4, 
        LEGF,   1, 
        KCDB,   1, 
        KLDB,   1, 
        TPMX,   1, 
        FOAL,   1, 
        AEDA,   1, 
        ALSF,   1, 
        WOLD,   1, 
        HSED,   1, 
        HDEN,   1, 
        MDEN,   1, 
        ICPT,   1, 
        PMCS,   1, 
        UWKD,   1, 
        ILUX,   1, 
        ITPS,   1, 
        FCIN,   1, 
        ASFG,   3, 
        WDPE,   8, 
        WDSA,   16, 
        WDST,   16, 
        WDGN,   16, 
        WDSS,   16, 
        WLBN,   8, 
        PRDT,   8, 
        LPDP,   16, 
        EAX,    32, 
        EBX,    32, 
        ECX,    32, 
        EDX,    32, 
        REFS,   32, 
        SSCI,   8, 
        SBFC,   8, 
        TJMX,   8, 
        TRCN,   8, 
        DCAP,   8, 
        LOTR,   160, 
        HITR,   160, 
        WABN,   8, 
        WADN,   8, 
        WAFN,   8, 
        DTCD,   32, 
        BDCP,   8, 
        TBRB,   32, 
        OHCB,   32, 
        EDID,   2048, 
        ESTA,   8, 
        VRMS,   32, 
        VRMB,   32, 
        SGME,   8, 
        AMNS,   32, 
        AMNP,   32, 
        AMVS,   32, 
        AMVP,   32, 
        TBOD,   8
    }

    OperationRegion (HPD2, SystemMemory, 0xB99F1F18, 0x006D)
    Field (HPD2, AnyAcc, Lock, Preserve)
    {
        CFPS,   8, 
        CMDS,   8, 
        BRID,   8, 
        F11,    1, 
        RSVD,   31, 
        WLDA,   768, 
        WLFL,   8, 
        WLIX,   8, 
        BTIX,   8, 
        WWIX,   8, 
        W2IX,   8, 
        GPSI,   8
    }

    OperationRegion (HPBR, SystemMemory, 0xB9F7AF18, 0x007E)
    Field (HPBR, AnyAcc, Lock, Preserve)
    {
        PAID,   32, 
        PHSZ,   8, 
        PVSZ,   8, 
        BRCT,   8, 
        BCCT,   8, 
        BMAP,   88, 
        BCLV,   216, 
        BRLV,   200, 
        BRNT,   400, 
        BPWG,   16, 
        BPWO,   16, 
        PNLF,   8
    }

    Scope (\_GPE)
    {
        Method (_L01, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Add (L01C, 0x01, L01C) /* \L01C */
            \_SB.PCI0.RP01.HPLG ()
            \_SB.PCI0.RP02.HPLG ()
            \_SB.PCI0.RP03.HPLG ()
            \_SB.PCI0.RP04.HPLG ()
            \_SB.PCI0.RP05.HPLG ()
            \_SB.PCI0.RP06.HPLG ()
            \_SB.PCI0.RP07.HPLG ()
            \_SB.PCI0.RP08.HPLG ()
        }

        Method (_L02, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Store (0x00, GPEC) /* \GPEC */
            Store (SSCI, Local0)
            If (Local0)
            {
                Store (0x00, SSCI) /* \SSCI */
                If (LEqual (Local0, 0x01))
                {
                    VFN4 ()
                }

                If (LEqual (Local0, 0x04))
                {
                    \_SB.WMID.WGWE (Local0, 0x00)
                }

                If (LEqual (Local0, 0x05))
                {
                    If (\_SB.WLBU._STA ())
                    {
                        Notify (\_SB.WLBU, 0x80) // Status Change
                    }
                    Else
                    {
                        \_SB.WMID.WGWE (Local0, 0x00)
                    }
                }

                If (LEqual (Local0, 0x03))
                {
                    VBRE (0x87)
                }

                If (LEqual (Local0, 0x02))
                {
                    VBRE (0x86)
                }
            }
        }

        Method (_L09, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            \_SB.PCI0.RP01.PME ()
            \_SB.PCI0.RP02.PME ()
            \_SB.PCI0.RP03.PME ()
            \_SB.PCI0.RP04.PME ()
            \_SB.PCI0.RP05.PME ()
            \_SB.PCI0.RP06.PME ()
            \_SB.PCI0.RP07.PME ()
            \_SB.PCI0.RP08.PME ()
        }

        Method (_L0B, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            Notify (\_SB.PCI0.PCIB, 0x02) // Device Wake
        }

        Method (_L0D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            If (\_SB.PCI0.EHC1.PMES)
            {
                Store (0x01, \_SB.PCI0.EHC1.PMES)
                Notify (\_SB.PCI0.EHC1, 0x02) // Device Wake
            }

            If (\_SB.PCI0.EHC2.PMES)
            {
                Store (0x01, \_SB.PCI0.EHC2.PMES)
                Notify (\_SB.PCI0.EHC2, 0x02) // Device Wake
            }

            If (\_SB.PCI0.XHC.PMES)
            {
                Store (0x01, \_SB.PCI0.XHC.PMES)
                Notify (\_SB.PCI0.XHC, 0x02) // Device Wake
            }

            If (\_SB.PCI0.HDEF.PMES)
            {
                Store (0x01, \_SB.PCI0.HDEF.PMES)
                Notify (\_SB.PCI0.HDEF, 0x02) // Device Wake
            }

            Notify (\_SB.PCI0.LANC, 0x02) // Device Wake
        }

        Method (_L13, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            And (GPIE, Not (0x08), Local0)
            Store (Local0, GPIE) /* \GPIE */
            And (GPSL, Not (0x08), Local0)
            Store (Local0, GPSL) /* \GPSL */
            Or (GPL3, 0x10, Local0)
            Store (Local0, GPL3) /* \GPL3 */
            Sleep (0x03E8)
            Or (GPSL, 0x08, GPSL) /* \GPSL */
            If (LEqual (PRDT, 0x04))
            {
                Notify (\_SB.PCI0.SATA, 0x82) // Device-Specific Change
            }
            Else
            {
                Notify (\_SB.PCI0.SATA, 0x81) // Information Change
            }
        }

        Method (_L1D, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
        {
            XOr (GIV, 0x2000, Local0)
            Store (Local0, GIV) /* \GIV_ */
            VDET ()
            \_SB.WMID.WGWE (0x01, 0x00)
            Sleep (0x03E8)
            Notify (\_SB.PCI0.EHC2, 0x00) // Bus Check
            Notify (\_SB.PCI0.SATA, 0x00) // Bus Check
            DKET ()
        }

        Method (HWWP, 1, Serialized)
        {
            If (LEqual (Arg0, 0x01))
            {
                Store (0x00, Local0)
                If (And (GPL0, 0x00400000))
                {
                    Store (0x01, Local0)
                }

                \_SB.PCI0.LPCB.EC0.HWWP (Local0)
            }
        }
    }

    Scope (\_PR)
    {
        Processor (CPU0, 0x00, 0x00000410, 0x06) {}
        Processor (CPU1, 0x01, 0x00000410, 0x06) {}
        Processor (CPU2, 0x02, 0x00000410, 0x06) {}
        Processor (CPU3, 0x03, 0x00000410, 0x06) {}
        Processor (CPU4, 0x04, 0x00000410, 0x06) {}
        Processor (CPU5, 0x05, 0x00000410, 0x06) {}
        Processor (CPU6, 0x06, 0x00000410, 0x06) {}
        Processor (CPU7, 0x07, 0x00000410, 0x06) {}
    }

    Scope (\_TZ)
    {
        Name (TRPC, Package (0x05)
        {
            Package (0x04)
            {
                0x60, 
                0x63, 
                0x80, 
                0x80
            }, 

            Package (0x04)
            {
                0x65, 
                0x6C, 
                0x80, 
                0x80
            }, 

            Package (0x04)
            {
                0x80, 
                0x80, 
                0x80, 
                0x80
            }, 

            Package (0x04)
            {
                0x80, 
                0x80, 
                0x80, 
                0x80
            }, 

            Package (0x04)
            {
                0x36, 
                0x37, 
                0x80, 
                0x80
            }
        })
        Name (TRIP, Package (0x05)
        {
            Package (0x04) {}, 
            Package (0x04) {}, 
            Package (0x04) {}, 
            Package (0x04) {}, 
            Package (0x04) {}
        })
        Name (CLSH, Package (0x04)
        {
            0x62, 
            0x69, 
            0x80, 
            0x80
        })
        Method (TRUP, 0, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            While (One)
            {
                Store (PRDT, _T_0) /* \_TZ_.TRUP._T_0 */
                If (LEqual (_T_0, 0x01))
                {
                    Store (0x10CC, MRPM) /* \_TZ_.MRPM */
                }
                Else
                {
                    If (LEqual (_T_0, 0x02))
                    {
                        Store (0x10CC, MRPM) /* \_TZ_.MRPM */
                        Store (CLSH, Index (TRPC, 0x01))
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x03))
                        {
                            Store (0x10CC, MRPM) /* \_TZ_.MRPM */
                        }
                    }
                }

                Break
            }

            If (LGreater (TJMX, 0x00))
            {
                Subtract (TJMX, 0x01, Local0)
                Store (Local0, Index (DerefOf (Index (TRPC, 0x00)), 0x02))
                Store (Local0, Index (DerefOf (Index (TRPC, 0x00)), 0x01))
                Subtract (TJMX, 0x04, Index (DerefOf (Index (TRPC, 0x00)), 0x00
                    ))
            }

            Store (0x10CC, MRPM) /* \_TZ_.MRPM */
        }

        Method (INTM, 1, Serialized)
        {
            Store (0x00, Local0)
            OTHI (Arg0)
        }

        Name (WHTR, 0x1F)
        Name (OSTH, 0x00)
        Name (LARE, Package (0x06) {})
        Name (LARP, Package (0x06) {})
        Name (CUZO, Package (0x06) {})
        Name (LATR, Package (0x06) {})
        Mutex (THER, 0x00)
        Name (THSC, 0x1F)
        Name (MRPM, 0x1388)
        Method (BOTT, 0, Serialized)
        {
            TRUP ()
            Store (SizeOf (TRPC), Local3)
            Store (DerefOf (Index (TRPC, 0x00)), Local5)
            Store (SizeOf (Local5), Local4)
            Store (0x00, Local0)
            While (LLess (Local0, Local3))
            {
                Store (0x00, Local1)
                While (LLess (Local1, Local4))
                {
                    Store (DerefOf (Index (DerefOf (Index (TRPC, Local0)), Local1)), 
                        Local6)
                    Store (GETK (Local6), Local7)
                    Store (Local7, Index (DerefOf (Index (TRIP, Local0)), Local1))
                    Increment (Local1)
                }

                Increment (Local0)
            }
        }

        Method (RETD, 0, Serialized)
        {
            Acquire (THER, 0xFFFF)
            Store (0x1F, THSC) /* \_TZ_.THSC */
            Store (0x1F, WHTR) /* \_TZ_.WHTR */
            Store (0x00, Local0)
            While (LLess (Local0, 0x06))
            {
                Store (0x00, Index (LARE, Local0))
                Store (0x00, Index (LARP, Local0))
                Store (0xFF, Index (CUZO, Local0))
                Store (0x00, Index (LATR, Local0))
                Increment (Local0)
            }

            Release (THER)
        }

        Method (OTHI, 1, Serialized)
        {
            ECTI (0x01)
            If (Arg0)
            {
                NTHS (0x1F)
            }
        }

        Name (OTID, 0x00)
        Method (ECTI, 1, Serialized)
        {
            Store (0x00, Local0)
            If (LEqual (Arg0, 0x01))
            {
                Store (0x01, OTID) /* \_TZ_.OTID */
            }

            If (LAnd (\_SB.PCI0.LPCB.EC0.ECRG, OTID))
            {
                NTHS (0x1F)
                Store (0x00, OTID) /* \_TZ_.OTID */
            }
        }

        Method (OSIT, 0, Serialized)
        {
            If (LEqual (OSTH, 0x00))
            {
                \_TZ.INTM (0x00)
                Store (0x01, OSTH) /* \_TZ_.OSTH */
            }
        }

        Method (GETP, 2, Serialized)
        {
            Store (Arg1, Local0)
            If (LEqual (Arg1, 0x01))
            {
                Store (DerefOf (Index (CUZO, Arg0)), Local3)
                If (LAnd (LGreater (Local3, 0x01), LNotEqual (Local3, 0xFF)))
                {
                    Store (0x00, Local0)
                }
            }

            Store (DerefOf (Index (DerefOf (Index (TRIP, Arg0)), Local0)), 
                Local2)
            Return (Local2)
        }

        Method (GETK, 1, Serialized)
        {
            Multiply (Arg0, 0x0A, Local0)
            Add (Local0, 0x0AAC, Local1)
            Return (Local1)
        }

        Method (GTTP, 5, Serialized)
        {
            Store (Arg2, Local1)
            If (LAnd (LLessEqual (Arg0, 0x04), \_SB.PCI0.LPCB.EC0.ECRG))
            {
                Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                Store (Arg1, \_SB.PCI0.LPCB.EC0.CRZN)
                Store (\_SB.PCI0.LPCB.EC0.TEMP, Local1)
                Release (\_SB.PCI0.LPCB.EC0.ECMX)
            }

            Store (Local1, Local2)
            If (LLess (Local1, Arg3))
            {
                If (LLess (DerefOf (Index (LARE, Arg0)), Arg3))
                {
                    Store (Arg3, Index (LARP, Arg0))
                }

                Store (DerefOf (Index (LARP, Arg0)), Local1)
            }
            Else
            {
                If (LGreater (Local1, Arg4))
                {
                    If (LGreater (DerefOf (Index (LARE, Arg0)), Arg4))
                    {
                        Store (Arg4, Index (LARP, Arg0))
                    }

                    Store (DerefOf (Index (LARP, Arg0)), Local1)
                }
            }

            Store (Local2, Index (LARE, Arg0))
            Store (Local1, Index (LARP, Arg0))
            Return (Local1)
        }

        Method (SETM, 3, Serialized)
        {
            Store (0x00, Local5)
            If (LLessEqual (Arg0, 0x04))
            {
                Acquire (THER, 0xFFFF)
                Store (ShiftLeft (0x01, Arg0), Local7)
                If (LAnd (And (THSC, Local7), \_SB.PCI0.LPCB.EC0.ECRG))
                {
                    If (LAnd (DerefOf (Index (LATR, Arg0)), LNotEqual (Arg0, 
                        0x04)))
                    {
                        Add (Arg2, 0x02, Local4)
                    }
                    Else
                    {
                        Store (Arg2, Local4)
                    }

                    Store (DerefOf (Index (DerefOf (Index (TRPC, Arg0)), 0x00)), 
                        Local2)
                    Store (0x01, Local0)
                    While (LLessEqual (Local0, 0x03))
                    {
                        Store (DerefOf (Index (DerefOf (Index (TRPC, Arg0)), Local0)), 
                            Local6)
                        If (LLess (Local4, Local6))
                        {
                            Break
                        }
                        Else
                        {
                            Increment (Local0)
                        }
                    }

                    If (LEqual (Local0, 0x01))
                    {
                        If (LGreater (Arg2, Local2))
                        {
                            If (LGreater (DerefOf (Index (LATR, Arg0)), Local6))
                            {
                                Increment (Local0)
                            }
                        }
                    }

                    Store (DerefOf (Index (TRPC, Arg0)), Local3)
                    Store (SizeOf (Local3), Local4)
                    If (LAnd (LNotEqual (Local0, DerefOf (Index (CUZO, Arg0))), 
                        LLess (Local0, Local4)))
                    {
                        Store (0x01, Local5)
                        Store (Local0, Index (CUZO, Arg0))
                        If (LLess (Arg0, 0x04))
                        {
                            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                            Store (Arg1, \_SB.PCI0.LPCB.EC0.CRZN)
                            If (LEqual (DerefOf (Index (LATR, Arg0)), 0x00))
                            {
                                Store (Local2, \_SB.PCI0.LPCB.EC0.PLTP)
                            }

                            Store (Local6, \_SB.PCI0.LPCB.EC0.PHTP)
                            Release (\_SB.PCI0.LPCB.EC0.ECMX)
                        }

                        Store (Local6, Index (LATR, Arg0))
                    }

                    And (THSC, Not (Local7), THSC) /* \_TZ_.THSC */
                }

                Release (THER)
            }

            Return (Local5)
        }

        Method (CHOT, 1, Serialized)
        {
            If (And (DTCD, 0x00020000))
            {
                Store (0x0FAC, Local0)
            }
            Else
            {
                Store (GETP (Arg0, 0x02), Local0)
            }

            Return (Local0)
        }

        ThermalZone (CPUZ)
        {
            Method (_HOT, 0, Serialized)  // _HOT: Hot Temperature
            {
                Return (CHOT (0x00))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (GETP (0x00, 0x03))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                \_TZX.OSIT ()
                Store (0x00, Local0)
                Store (GTTP (0x00, 0x01, 0x10, 0x00, 0x7F), Local0)
                If (SETM (0x00, 0x01, Local0))
                {
                    Notify (\_TZ.CPUZ, 0x81) // Thermal Trip Point Change
                }

                Return (GETK (Local0))
            }
        }

        ThermalZone (GFXZ)
        {
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (GETP (0x01, 0x01))
            }

            Method (_PSL, 0, NotSerialized)  // _PSL: Passive List
            {
                Return (PSL ())
            }

            Name (_TSP, 0x012C)  // _TSP: Thermal Sampling Period
            Name (_TC1, 0x01)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x02)  // _TC2: Thermal Constant 2
            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (GETP (0x01, 0x03))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Store (0x00, Local0)
                Store (GTTP (0x01, 0x02, 0x10, 0x00, 0x7F), Local0)
                If (SETM (0x01, 0x02, Local0))
                {
                    Notify (\_TZ.GFXZ, 0x81) // Thermal Trip Point Change
                }

                Return (GETK (Local0))
            }
        }

        ThermalZone (EXTZ)
        {
            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (GETP (0x02, 0x03))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Store (0x00, Local0)
                Store (GTTP (0x02, 0x03, 0x10, 0x00, 0x7F), Local0)
                Return (GETK (Local0))
            }
        }

        ThermalZone (LOCZ)
        {
            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (GETP (0x03, 0x03))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Store (0x00, Local0)
                Store (GTTP (0x03, 0x04, 0x10, 0x00, 0x7F), Local0)
                Return (GETK (Local0))
            }
        }

        ThermalZone (BATZ)
        {
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (GETP (0x04, 0x01))
            }

            Method (_PSL, 0, NotSerialized)  // _PSL: Passive List
            {
                Return (PSL ())
            }

            Name (_TSP, 0x012C)  // _TSP: Thermal Sampling Period
            Name (_TC1, 0x32)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x00)  // _TC2: Thermal Constant 2
            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (GETP (0x04, 0x03))
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Store (0x00, Local0)
                Store (GTTP (0x04, 0x05, 0x00, 0x00, 0x7F), Local0)
                If (SETM (0x04, 0x05, Local0))
                {
                    Notify (\_TZ.BATZ, 0x81) // Thermal Trip Point Change
                }

                Return (GETK (Local0))
            }
        }

        Method (NTHS, 1, Serialized)
        {
            If (And (Arg0, 0x01))
            {
                Notify (CPUZ, 0x80) // Thermal Status Change
            }

            If (And (Arg0, 0x02))
            {
                Notify (GFXZ, 0x80) // Thermal Status Change
            }

            If (And (Arg0, 0x04))
            {
                Notify (EXTZ, 0x80) // Thermal Status Change
            }

            If (And (Arg0, 0x08))
            {
                Notify (LOCZ, 0x80) // Thermal Status Change
            }

            If (And (Arg0, 0x10))
            {
                Notify (BATZ, 0x80) // Thermal Status Change
            }
        }

        Method (ECTE, 1, Serialized)
        {
            Store (0x00, Local1)
            If (Arg0)
            {
                If (And (Arg0, 0x01))
                {
                    Or (Local1, 0x01, Local1)
                }

                If (And (Arg0, 0x02))
                {
                    Or (Local1, 0x02, Local1)
                }

                If (And (Arg0, 0x04))
                {
                    Or (Local1, 0x04, Local1)
                }

                If (And (Arg0, 0x08))
                {
                    Or (Local1, 0x08, Local1)
                }

                If (And (Arg0, 0x10))
                {
                    Or (Local1, 0x10, Local1)
                }
            }
            Else
            {
                Or (Local1, 0x10, Local1)
            }

            Acquire (THER, 0xFFFF)
            Or (THSC, Local1, THSC) /* \_TZ_.THSC */
            Release (THER)
            NTHS (Local1)
        }

        Method (GFRM, 0, Serialized)
        {
            Store (0x00, Local0)
            If (\_SB.PCI0.LPCB.EC0.ECRG)
            {
                Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                Store (\_SB.PCI0.LPCB.EC0.FRDC, Local0)
                Release (\_SB.PCI0.LPCB.EC0.ECMX)
                If (Local0)
                {
                    ShiftRight (Local0, 0x01, Local1)
                    Add (0x0003C000, Local1, Local2)
                    Divide (Local2, Local0, Local1, Local0)
                }
            }

            Return (Local0)
        }

        Method (GTRM, 0, Serialized)
        {
            Store (0x00, Local0)
            If (\_SB.PCI0.LPCB.EC0.ECRG)
            {
                Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                Store (\_SB.PCI0.LPCB.EC0.FTGC, Local0)
                Release (\_SB.PCI0.LPCB.EC0.ECMX)
                If (Local0)
                {
                    ShiftRight (Local0, 0x01, Local1)
                    Add (0x0003C000, Local1, Local2)
                    Divide (Local2, Local0, Local1, Local0)
                }
            }

            Return (Local0)
        }

        Method (GFSD, 0, Serialized)
        {
            Store (GFRM (), Local0)
            Multiply (Local0, 0x64, Local1)
            Divide (Local1, MRPM, Local1, Local2)
            Return (Local2)
        }

        Method (CTCT, 1, Serialized)
        {
            Multiply (Arg0, MRPM, Local1)
            Divide (Local1, 0x64, Local2, Local0)
            If (Local0)
            {
                ShiftRight (Local0, 0x01, Local1)
                Add (0x0003C000, Local1, Local2)
                Divide (Local2, Local0, Local1, Local0)
            }

            If (LGreater (Local0, 0xF4))
            {
                Store (0xF4, Local0)
            }

            Return (Local0)
        }

        Method (PSL, 0, Serialized)
        {
            If (And (CFGD, 0x01000000))
            {
                If (LEqual (TCNT, 0x08))
                {
                    Return (Package (0x08)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1, 
                        \_PR.CPU2, 
                        \_PR.CPU3, 
                        \_PR.CPU4, 
                        \_PR.CPU5, 
                        \_PR.CPU6, 
                        \_PR.CPU7
                    })
                }

                If (LEqual (TCNT, 0x04))
                {
                    Return (Package (0x04)
                    {
                        \_PR.CPU0, 
                        \_PR.CPU1, 
                        \_PR.CPU2, 
                        \_PR.CPU3
                    })
                }

                Return (Package (0x02)
                {
                    \_PR.CPU0, 
                    \_PR.CPU1
                })
            }
            Else
            {
                Return (Package (0x01)
                {
                    \_PR.CPU0
                })
            }
        }

        ThermalZone (PCHZ)
        {
            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (0x0FAC)
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Store (0x00, Local0)
                Store (GTTP (0x05, 0x00, PCHT, 0x00, 0x7F), Local0)
                Store (DerefOf (Index (DerefOf (Index (\_SB.WMID.TSTV, 0x02)), 0x02)), 
                    Local1)
                If (LNotEqual (Local1, 0xFF))
                {
                    Store (Local1, Local0)
                }

                Return (GETK (Local0))
            }
        }

        Method (GDTP, 2, Serialized)
        {
            If (LOr (Arg1, DTZS ()))
            {
                Store (\_SB.PCI0.SBUS.SRDW (Arg0, 0x05), Local0)
                If (LEqual (Local0, 0xFFFFFFFF))
                {
                    Store (0x00, Local0)
                }
                Else
                {
                    If (And (Local0, 0x1000))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        ShiftRight (Local0, 0x04, Local0)
                        And (Local0, 0xFF, Local0)
                    }
                }

                Return (\_TZ.GETK (Local0))
            }
            Else
            {
                Return (0x0AAC)
            }
        }

        Method (DTZS, 0, NotSerialized)
        {
            If (And (DTCD, 0x00010000))
            {
                Return (0x0F)
            }

            Return (0x00)
        }

        ThermalZone (DM1Z)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (DTZS ())
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Return (GDTP (0x30, 0x00))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (0x0FAC)
            }
        }

        ThermalZone (DM2Z)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (DTZS ())
            }

            Method (_TMP, 0, Serialized)  // _TMP: Temperature
            {
                Return (GDTP (0x34, 0x00))
            }

            Method (_CRT, 0, Serialized)  // _CRT: Critical Temperature
            {
                Return (0x0FAC)
            }
        }

        Name (SEN1, Package (0x06)
        {
            Package (0x0C)
            {
                "Fan", 
                "Reports fan speed", 
                0x0C, 
                "", 
                0x00, 
                "", 
                "Normal", 
                "Caution", 
                "Stalled", 
                0x13, 
                0x00, 
                0x00
            }, 

            Package (0x0C)
            {
                "CPU Temperature", 
                "Reports CPU package temperature", 
                0x02, 
                "", 
                0x00, 
                "", 
                "Normal", 
                "Caution", 
                "Critical", 
                0x02, 
                0x00, 
                0x00
            }, 

            Package (0x0C)
            {
                "Graphics Temperature", 
                "Reports discrete graphics temperature", 
                0x02, 
                "", 
                0x00, 
                "", 
                "Normal", 
                "Caution", 
                "Critical", 
                0x02, 
                0x00, 
                0x00
            }, 

            Package (0x0C)
            {
                "Remote Temperature", 
                "Reports external/remote temperature", 
                0x02, 
                "", 
                0x00, 
                "", 
                "Normal", 
                "Caution", 
                "Critical", 
                0x02, 
                0x00, 
                0x00
            }, 

            Package (0x0C)
            {
                "Local Temperature", 
                "Reports internal/local temperature", 
                0x02, 
                "", 
                0x00, 
                "", 
                "Normal", 
                "Caution", 
                "Critical", 
                0x02, 
                0x00, 
                0x00
            }, 

            Package (0x0C)
            {
                "Battery Temperature", 
                "Reports maximum temperature of all batteries", 
                0x02, 
                "", 
                0x00, 
                "", 
                "Normal", 
                "Caution", 
                "Critical", 
                0x02, 
                0x00, 
                0x00
            }
        })
        Method (WQBI, 1, Serialized)
        {
            Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
            Store (0x02, Index (DerefOf (Index (SEN1, Arg0)), 0x04))
            Store ("Normal", Index (DerefOf (Index (SEN1, Arg0)), 0x05))
            While (One)
            {
                Store (Arg0, _T_0) /* \_TZ_.WQBI._T_0 */
                If (LEqual (_T_0, 0x00))
                {
                    Store (\_TZ.GFRM (), Local0)
                    Store (\_TZ.GTRM (), Local1)
                    Store (0x05DC, Local2)
                    If (LAnd (LLess (Local0, Local2), LLess (Local1, Local2)))
                    {
                        Store (0x00, Local0)
                    }
                    Else
                    {
                        If (LGreater (Local1, Add (Local0, 0xC8)))
                        {
                            Store (0x03, Index (DerefOf (Index (SEN1, Arg0)), 0x04))
                            Store ("Stalled", Index (DerefOf (Index (SEN1, Arg0)), 0x05))
                        }
                    }
                }
                Else
                {
                    If (LEqual (_T_0, 0x01))
                    {
                        Store (\_TZ.CPUZ._TMP (), Local0)
                        Store (\_TZ.CPUZ._HOT (), Local1)
                        If (LGreaterEqual (Local0, Local1))
                        {
                            Store (0x03, Index (DerefOf (Index (SEN1, Arg0)), 0x04))
                            Store ("Critical", Index (DerefOf (Index (SEN1, Arg0)), 0x05))
                        }
                        Else
                        {
                            Subtract (Local1, Local0, Local1)
                            If (LLessEqual (Local1, 0x32))
                            {
                                Store (0x03, Index (DerefOf (Index (SEN1, Arg0)), 0x04))
                                Store ("Caution", Index (DerefOf (Index (SEN1, Arg0)), 0x05))
                            }
                        }
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x02))
                        {
                            Store (\_TZ.GFXZ._TMP (), Local0)
                            Store (\_TZ.GFXZ._PSV (), Local1)
                            If (LGreaterEqual (Local0, Local1))
                            {
                                Store (0x03, Index (DerefOf (Index (SEN1, Arg0)), 0x04))
                                Store ("Caution", Index (DerefOf (Index (SEN1, Arg0)), 0x05))
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x03))
                            {
                                Store (\_TZ.EXTZ._TMP (), Local0)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x04))
                                {
                                    Store (\_TZ.LOCZ._TMP (), Local0)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x05))
                                    {
                                        Store (\_TZ.BATZ._TMP (), Local0)
                                        Store (\_TZ.BATZ._PSV (), Local1)
                                        If (LGreaterEqual (Local0, Local1))
                                        {
                                            Store (0x03, Index (DerefOf (Index (SEN1, Arg0)), 0x04))
                                            Store ("Caution", Index (DerefOf (Index (SEN1, Arg0)), 0x05))
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Break
            }

            If (LGreater (Arg0, 0x00))
            {
                Subtract (Local0, 0x0AAC, Local1)
                Divide (Local1, 0x0A, Local2, Local0)
            }

            Store (Local0, Index (DerefOf (Index (SEN1, Arg0)), 0x0B))
            Return (DerefOf (Index (SEN1, Arg0)))
        }
    }

    Name (\NIST, Package (0x10)
    {
        "0", 
        "1", 
        "2", 
        "3", 
        "4", 
        "5", 
        "6", 
        "7", 
        "8", 
        "9", 
        "A", 
        "B", 
        "C", 
        "D", 
        "E", 
        "F"
    })
    Method (\ISTR, 2, NotSerialized)
    {
        Store (Arg0, Local0)
        Store ("", Local7)
        Store (Arg1, Local4)
        While (LGreater (Local4, 0x00))
        {
            And (Local0, 0x0F, Local1)
            Store (DerefOf (Index (\NIST, Local1)), Local2)
            Concatenate (Local2, Local7, Local3)
            Store (Local3, Local7)
            ShiftRight (Local0, 0x04, Local0)
            Decrement (Local4)
        }

        Return (Local7)
    }

    Method (\SRCP, 2, NotSerialized)
    {
        Store (SizeOf (Arg0), Local7)
        If (LNotEqual (Local7, SizeOf (Arg1)))
        {
            Return (0x00)
        }

        Name (ST00, Buffer (Local7) {})
        Name (ST01, Buffer (Local7) {})
        Store (Arg0, ST00) /* \SRCP.ST00 */
        Store (Arg1, ST01) /* \SRCP.ST01 */
        Store (0x00, Local6)
        Store (0x01, Local0)
        While (LAnd (LNotEqual (Local6, Local7), Local0))
        {
            Store (DerefOf (Index (ST00, Local6)), Local2)
            Store (DerefOf (Index (ST01, Local6)), Local3)
            Increment (Local6)
            If (LNotEqual (Local2, Local3))
            {
                Store (0x00, Local0)
            }
        }

        Return (Local0)
    }

    Name (WOSI, 0xFF)
    Name (OSID, Package (0x03)
    {
        "Microsoft Windows", 
        "Microsoft WindowsME: Millennium Edition", 
        "Microsoft Windows NT"
    })
    Method (\SRCM, 3, NotSerialized)
    {
        Name (ST00, Buffer (0x8C) {})
        Name (ST01, Buffer (0x8C) {})
        Store (Arg0, ST00) /* \SRCM.ST00 */
        Store (Arg1, ST01) /* \SRCM.ST01 */
        Store (0x00, Local6)
        Store (0x01, Local0)
        While (LAnd (LNotEqual (Local6, Arg2), Local0))
        {
            Store (DerefOf (Index (ST00, Local6)), Local2)
            Store (DerefOf (Index (ST01, Local6)), Local3)
            Increment (Local6)
            If (LNotEqual (Local2, Local3))
            {
                Store (0x00, Local0)
            }
        }

        Return (Local0)
    }

    Method (WCOS, 0, Serialized)
    {
        If (LEqual (WOSI, 0xFF))
        {
            Store (\_OS, Local0)
            Store (SizeOf (OSID), Local7)
            Store (0x00, Local1)
            While (LAnd (LLess (Local1, Local7), LEqual (WOSI, 0xFF)))
            {
                Store (\SRCP (Local0, DerefOf (Index (OSID, Local1))), Local2)
                If (Local2)
                {
                    Add (Local1, 0x01, WOSI) /* \WOSI */
                }
                Else
                {
                    Increment (Local1)
                }
            }

            If (LEqual (WOSI, 0xFF))
            {
                Store (0x00, WOSI) /* \WOSI */
            }

            If (LOr (LEqual (WOSI, 0x00), LEqual (WOSI, 0x03)))
            {
                If (CondRefOf (\XOSI, Local0))
                {
                    If (\XOSI ("Windows 2001"))
                    {
                        Store (0x04, WOSI) /* \WOSI */
                    }

                    If (\XOSI ("Windows 2001 SP1"))
                    {
                        Store (0x04, WOSI) /* \WOSI */
                    }

                    If (\XOSI ("Windows 2001 SP2"))
                    {
                        Store (0x05, WOSI) /* \WOSI */
                    }

                    If (\XOSI ("Windows 2006"))
                    {
                        Store (0x06, WOSI) /* \WOSI */
                    }

                    If (\XOSI ("Windows 2009"))
                    {
                        Store (0x07, WOSI) /* \WOSI */
                    }

                    If (\XOSI ("Windows 2012"))
                    {
                        Store (0x08, WOSI) /* \WOSI */
                    }

                    If (\XOSI ("Windows 2013"))
                    {
                        Store (0x09, WOSI) /* \WOSI */
                    }
                }
            }

            Store (WOSI, WHOS) /* \WHOS */
        }

        Return (WOSI) /* \WOSI */
    }

    Method (UPRW, 2, Serialized)
    {
        Store (Package (0x02)
            {
                0x00, 
                0x00
            }, Local0)
        Store (Arg0, Index (Local0, 0x00))
        If (LEqual (UWKD, 0x00))
        {
            Store (Arg1, Index (Local0, 0x01))
        }

        Return (Local0)
    }

    Name (EUPC, Package (0x04)
    {
        0xFF, 
        0xFF, 
        0x00, 
        0x00
    })
    Name (EPLD, Buffer (0x10)
    {
        /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
        /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    })
    Method (CBRT, 2, Serialized)
    {
        Store (SizeOf (Arg0), Local6)
        Store (SizeOf (Arg1), Local7)
        If (LEqual (Local6, 0x00))
        {
            Store (Arg1, Local0)
            Return (Local0)
        }

        If (LEqual (Local7, 0x00))
        {
            Store (Arg0, Local0)
            Return (Local0)
        }

        Add (Local7, Local6, Local1)
        Subtract (Local1, 0x02, Local1)
        Store (Buffer (Local1) {}, Local0)
        Store (0x00, Local1)
        While (LLess (Local1, SizeOf (Arg0)))
        {
            Store (DerefOf (Index (Arg0, Local1)), Index (Local0, Local1))
            Increment (Local1)
        }

        Subtract (Local1, 0x02, Local1)
        Store (0x00, Local2)
        While (LLess (Local2, SizeOf (Arg1)))
        {
            Store (DerefOf (Index (Arg1, Local2)), Index (Local0, Local1))
            Increment (Local1)
            Increment (Local2)
        }

        Return (Local0)
    }

    Scope (\_SB)
    {
        Mutex (MSMI, 0x00)
        Method (SSMI, 5, NotSerialized)
        {
            Acquire (MSMI, 0xFFFF)
            If (Arg4)
            {
                Acquire (\_GL, 0xFFFF)
            }

            ShiftLeft (Arg0, 0x10, EAX) /* \EAX_ */
            Store (Arg1, EBX) /* \EBX_ */
            Store (Arg2, ECX) /* \ECX_ */
            Store (Arg3, EDX) /* \EDX_ */
            Store (0x00, REFS) /* \REFS */
            \_SB.PCI0.GSWS (Arg0)
            Store (REFS, Local0)
            If (Arg4)
            {
                Release (\_GL)
            }

            Release (MSMI)
            Return (Local0)
        }

        Name (BCLI, 0x00)
        Name (BCLS, Package (0x03)
        {
            Package (0x0D) {}, 
            Package (0x17) {}, 
            Package (0x1B) {}
        })
        Name (NITS, Package (0x03)
        {
            Buffer (0x16) {}, 
            Buffer (0x2A) {}, 
            Buffer (0x32) {}
        })
        Name (BCLC, 0x00)
        Method (BCL, 0, Serialized)
        {
            If (LEqual (BCLC, 0x00))
            {
                If (LGreater (\WCOS (), 0x06))
                {
                    Store (BCCT, BRCT) /* \BRCT */
                }

                Store (0x00, Local7)
                If (LGreaterEqual (BRCT, 0x15))
                {
                    Store (0x01, BCLI) /* \_SB_.BCLI */
                    Store (0x01, Local7)
                    If (LEqual (BRCT, 0x19))
                    {
                        Store (0x02, BCLI) /* \_SB_.BCLI */
                    }
                }

                Store (0x00, Local1)
                If (And (DCAP, 0x10))
                {
                    Store (BRLV, Local0)
                    Store (0x00, Local5)
                    Store (BMAP, Local4)
                    While (LLess (Local1, BRCT))
                    {
                        If (Local7)
                        {
                            Store (Local1, Local3)
                        }
                        Else
                        {
                            Store (DerefOf (Index (Local4, Local1)), Local3)
                        }

                        Store (DerefOf (Index (Local0, Local3)), Local2)
                        Multiply (Local2, 0x64, Local3)
                        Divide (Add (Local3, 0x7F), 0xFF, Local6, Local2)
                        Store (Local2, Index (DerefOf (Index (BCLS, BCLI)), Add (Local1, 
                            0x02)))
                        If (LGreater (Local2, Local5))
                        {
                            Store (Local2, Local5)
                        }

                        Increment (Local1)
                    }

                    ShiftRight (BRCT, 0x01, Local3)
                    Store (DerefOf (Index (DerefOf (Index (BCLS, BCLI)), Local3)), 
                        Index (DerefOf (Index (BCLS, BCLI)), 0x01))
                    Store (Local5, Index (DerefOf (Index (BCLS, BCLI)), 0x00))
                }
                Else
                {
                    Store (BCLV, Local4)
                    Store (BMAP, Local0)
                    While (LLess (Local1, Add (BRCT, 0x02)))
                    {
                        If (LOr (Local7, LLess (Local1, 0x02)))
                        {
                            Store (Local1, Local3)
                        }
                        Else
                        {
                            Store (DerefOf (Index (Local0, Subtract (Local1, 0x02))), Local3)
                            Add (Local3, 0x02, Local3)
                        }

                        Store (DerefOf (Index (Local4, Local3)), Local2)
                        Store (Local2, Index (DerefOf (Index (BCLS, BCLI)), Local1))
                        Increment (Local1)
                    }
                }

                Store (BRNT, Local0)
                Store (BMAP, Local1)
                Store (0x00, Local2)
                While (LLess (Local2, BRCT))
                {
                    If (Local7)
                    {
                        Store (Local2, Local3)
                    }
                    Else
                    {
                        Store (DerefOf (Index (Local1, Local2)), Local3)
                    }

                    ShiftLeft (Local3, 0x01, Local3)
                    ShiftLeft (Local2, 0x01, Local5)
                    Store (DerefOf (Index (Local0, Local3)), Local4)
                    Store (Local4, Index (DerefOf (Index (NITS, BCLI)), Local5))
                    Store (DerefOf (Index (Local0, Add (Local3, 0x01))), Local4)
                    Store (Local4, Index (DerefOf (Index (NITS, BCLI)), Add (Local5, 
                        0x01)))
                    Increment (Local2)
                }

                Store (0x01, BCLC) /* \_SB_.BCLC */
            }

            Return (DerefOf (Index (BCLS, BCLI)))
        }

        Name (BRIG, 0x64)
        Method (BCM, 1, Serialized)
        {
            Store (0x00, Local0)
            If (LGreater (\WCOS (), 0x05))
            {
                Or (WDPE, 0x40, WDPE) /* \WDPE */
                Store (0x01, Local0)
            }

            Store (Arg0, BRIG) /* \_SB_.BRIG */
            Store (Match (DerefOf (Index (BCLS, BCLI)), MGE, Arg0, MTR, 
                0x00, 0x02), Local1)
            If (LEqual (Local1, Ones))
            {
                Subtract (SizeOf (DerefOf (Index (BCLS, BCLI))), 0x01, Local1)
            }

            Subtract (Local1, 0x02, Local1)
            If (Local0)
            {
                Store (Local1, BRID) /* \BRID */
            }

            Return (Local0)
        }

        Method (BQC, 0, Serialized)
        {
            Store (BRIG, Local0)
            Return (Local0)
        }

        Method (HDDC, 1, Serialized)
        {
            If (LEqual (Arg0, 0x02))
            {
                Store (EDID, Local1)
            }
            Else
            {
                Store (EDID, Local3)
                Store (0x80, Local0)
                Store (Buffer (Local0) {}, Local1)
                Store (0x00, Local2)
                While (LLess (Local2, Local0))
                {
                    Store (DerefOf (Index (Local3, Local2)), Index (Local1, Local2))
                    Increment (Local2)
                }
            }

            Return (Local1)
        }

        Method (SBRC, 0, Serialized)
        {
            Store (BRID, Local0)
            Subtract (BRCT, 0x01, Local4)
            If (LGreater (BRID, Local4))
            {
                Store (Local4, Local0)
            }

            If (LLess (BRID, 0x00))
            {
                Store (0x00, Local0)
            }

            Store (BRLV, Local2)
            Store (BMAP, Local5)
            If (LEqual (BRCT, 0x0B))
            {
                Store (DerefOf (Index (Local5, Local0)), Local0)
            }

            Store (DerefOf (Index (Local2, Local0)), Local1)
            Store (Local1, Debug)
            Return (Local1)
        }

        Device (WLBU)
        {
            Name (_HID, EisaId ("HPQ6001"))  // _HID: Hardware ID
            Name (DEPT, 0xFF)
            Method (INIT, 0, Serialized)
            {
                If (LEqual (DEPT, 0x0F))
                {
                    Store (0xFF, DEPT) /* \_SB_.WLBU.DEPT */
                }
            }

            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If (LEqual (DEPT, 0xFF))
                {
                    Store (0x00, Local0)
                    If (LGreaterEqual (\WCOS (), 0x08))
                    {
                        Store (0x0F, Local0)
                        UWLS ()
                    }

                    Store (Local0, DEPT) /* \_SB_.WLBU.DEPT */
                }

                Return (DEPT) /* \_SB_.WLBU.DEPT */
            }

            Method (UWLS, 0, Serialized)
            {
                Store (WLDA, Local0)
                Store (DerefOf (Index (Local0, 0x07)), Local1)
                If (And (WLFL, 0x02))
                {
                    And (WLFL, Not (0x02), WLFL) /* \WLFL */
                }

                Multiply (Local1, 0x10, Local1)
                Add (Local1, 0x10, Local1)
                Store (0x1B, Local2)
                Store (0x10, Local5)
                Store (0x00, Local4)
                While (LLess (Local2, Local1))
                {
                    Store (DerefOf (Index (Local0, Local2)), Local3)
                    Store (DerefOf (Index (Local0, Local5)), Local6)
                    If (LNotEqual (And (Local3, 0x0A), 0x0A))
                    {
                        Or (Local3, 0x0A, Index (Local0, Local2))
                        Store (0x01, Local4)
                    }

                    If (LEqual (Local6, 0x00))
                    {
                        If (LNotEqual (And (Local3, 0x10), 0x00))
                        {
                            And (Local3, 0xEF, Index (Local0, Local2))
                            Store (0x01, Local4)
                        }
                    }

                    Add (Local2, 0x10, Local2)
                    Add (Local5, 0x10, Local5)
                }

                If (Local4)
                {
                    Store (Local0, WLDA) /* \WLDA */
                    \_SB.SSMI (0xEA84, 0x00, 0x00, 0x00, 0x00)
                }
            }
        }
    }

    Scope (\_SB)
    {
        Device (PCI0)
        {
            Name (_HPP, Package (0x04)  // _HPP: Hot Plug Parameters
            {
                0x10, 
                0x40, 
                0x00, 
                0x00
            })
            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                Return (0x02)
            }

            Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
            {
                Return (0x02)
            }

            Name (_HID, EisaId ("PNP0A08"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03"))  // _CID: Compatible ID
            Name (_ADR, 0x00)  // _ADR: Address
            OperationRegion (HBUS, PCI_Config, 0x00, 0x0100)
            Field (HBUS, DWordAcc, NoLock, Preserve)
            {
                Offset (0x40), 
                EPEN,   1, 
                    ,   11, 
                EPBR,   20, 
                Offset (0x48), 
                MHEN,   1, 
                    ,   14, 
                MHBR,   17, 
                Offset (0x50), 
                GCLK,   1, 
                Offset (0x54), 
                D0EN,   1, 
                Offset (0x60), 
                PXEN,   1, 
                PXSZ,   2, 
                    ,   23, 
                PXBR,   6, 
                Offset (0x68), 
                DIEN,   1, 
                    ,   11, 
                DIBR,   20, 
                Offset (0x70), 
                    ,   20, 
                MEBR,   12, 
                Offset (0x80), 
                    ,   4, 
                PM0H,   2, 
                Offset (0x81), 
                PM1L,   2, 
                    ,   2, 
                PM1H,   2, 
                Offset (0x82), 
                PM2L,   2, 
                    ,   2, 
                PM2H,   2, 
                Offset (0x83), 
                PM3L,   2, 
                    ,   2, 
                PM3H,   2, 
                Offset (0x84), 
                PM4L,   2, 
                    ,   2, 
                PM4H,   2, 
                Offset (0x85), 
                PM5L,   2, 
                    ,   2, 
                PM5H,   2, 
                Offset (0x86), 
                PM6L,   2, 
                    ,   2, 
                PM6H,   2, 
                Offset (0x87), 
                Offset (0xA8), 
                    ,   20, 
                TUUD,   19, 
                Offset (0xBC), 
                    ,   20, 
                TLUD,   12, 
                Offset (0xC8), 
                    ,   7, 
                HTSE,   1
            }

            OperationRegion (MCHT, SystemMemory, 0xFED10000, 0x1100)
            Field (MCHT, ByteAcc, NoLock, Preserve)
            {
            }

            Name (BUF0, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    ,, _Y00)
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000CF7,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000CF8,         // Length
                    ,, , TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                DWordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x00000000,         // Granularity
                    0x00000D00,         // Range Minimum
                    0x0000FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x0000F300,         // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y01, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y04, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y05, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y06, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y07, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y08, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y09, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0A, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0B, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    ,, _Y0C, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000F0000,         // Range Minimum
                    0x000FFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00010000,         // Length
                    ,, _Y0D, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0x00000000,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00000000,         // Length
                    ,, _Y0E, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x00000000,         // Range Minimum
                    0xFEDFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0xFEE00000,         // Length
                    ,, _Y0F, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFEE01000,         // Range Minimum
                    0xFFFFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x011FF000,         // Length
                    ,, , AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                CreateWordField (BUF0, \_SB.PCI0._Y00._MAX, PBMX)  // _MAX: Maximum Base Address
                Store (Subtract (ShiftRight (0x04000000, 0x14), 0x02), PBMX) /* \_SB_.PCI0._CRS.PBMX */
                CreateWordField (BUF0, \_SB.PCI0._Y00._LEN, PBLN)  // _LEN: Length
                Store (Subtract (ShiftRight (0x04000000, 0x14), 0x01), PBLN) /* \_SB_.PCI0._CRS.PBLN */
                If (PM1L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y01._LEN, C0LN)  // _LEN: Length
                    Store (Zero, C0LN) /* \_SB_.PCI0._CRS.C0LN */
                }

                If (LEqual (PM1L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y01._RW, C0RW)  // _RW_: Read-Write Status
                    Store (Zero, C0RW) /* \_SB_.PCI0._CRS.C0RW */
                }

                If (PM1H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y02._LEN, C4LN)  // _LEN: Length
                    Store (Zero, C4LN) /* \_SB_.PCI0._CRS.C4LN */
                }

                If (LEqual (PM1H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y02._RW, C4RW)  // _RW_: Read-Write Status
                    Store (Zero, C4RW) /* \_SB_.PCI0._CRS.C4RW */
                }

                If (PM2L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y03._LEN, C8LN)  // _LEN: Length
                    Store (Zero, C8LN) /* \_SB_.PCI0._CRS.C8LN */
                }

                If (LEqual (PM2L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y03._RW, C8RW)  // _RW_: Read-Write Status
                    Store (Zero, C8RW) /* \_SB_.PCI0._CRS.C8RW */
                }

                If (PM2H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y04._LEN, CCLN)  // _LEN: Length
                    Store (Zero, CCLN) /* \_SB_.PCI0._CRS.CCLN */
                }

                If (LEqual (PM2H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y04._RW, CCRW)  // _RW_: Read-Write Status
                    Store (Zero, CCRW) /* \_SB_.PCI0._CRS.CCRW */
                }

                If (PM3L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y05._LEN, D0LN)  // _LEN: Length
                    Store (Zero, D0LN) /* \_SB_.PCI0._CRS.D0LN */
                }

                If (LEqual (PM3L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y05._RW, D0RW)  // _RW_: Read-Write Status
                    Store (Zero, D0RW) /* \_SB_.PCI0._CRS.D0RW */
                }

                If (PM3H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y06._LEN, D4LN)  // _LEN: Length
                    Store (Zero, D4LN) /* \_SB_.PCI0._CRS.D4LN */
                }

                If (LEqual (PM3H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y06._RW, D4RW)  // _RW_: Read-Write Status
                    Store (Zero, D4RW) /* \_SB_.PCI0._CRS.D4RW */
                }

                If (PM4L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y07._LEN, D8LN)  // _LEN: Length
                    Store (Zero, D8LN) /* \_SB_.PCI0._CRS.D8LN */
                }

                If (LEqual (PM4L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y07._RW, D8RW)  // _RW_: Read-Write Status
                    Store (Zero, D8RW) /* \_SB_.PCI0._CRS.D8RW */
                }

                If (PM4H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y08._LEN, DCLN)  // _LEN: Length
                    Store (Zero, DCLN) /* \_SB_.PCI0._CRS.DCLN */
                }

                If (LEqual (PM4H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y08._RW, DCRW)  // _RW_: Read-Write Status
                    Store (Zero, DCRW) /* \_SB_.PCI0._CRS.DCRW */
                }

                If (PM5L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y09._LEN, E0LN)  // _LEN: Length
                    Store (Zero, E0LN) /* \_SB_.PCI0._CRS.E0LN */
                }

                If (LEqual (PM5L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y09._RW, E0RW)  // _RW_: Read-Write Status
                    Store (Zero, E0RW) /* \_SB_.PCI0._CRS.E0RW */
                }

                If (PM5H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0A._LEN, E4LN)  // _LEN: Length
                    Store (Zero, E4LN) /* \_SB_.PCI0._CRS.E4LN */
                }

                If (LEqual (PM5H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0A._RW, E4RW)  // _RW_: Read-Write Status
                    Store (Zero, E4RW) /* \_SB_.PCI0._CRS.E4RW */
                }

                If (PM6L)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0B._LEN, E8LN)  // _LEN: Length
                    Store (Zero, E8LN) /* \_SB_.PCI0._CRS.E8LN */
                }

                If (LEqual (PM6L, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0B._RW, E8RW)  // _RW_: Read-Write Status
                    Store (Zero, E8RW) /* \_SB_.PCI0._CRS.E8RW */
                }

                If (PM6H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0C._LEN, ECLN)  // _LEN: Length
                    Store (Zero, ECLN) /* \_SB_.PCI0._CRS.ECLN */
                }

                If (LEqual (PM6H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0C._RW, ECRW)  // _RW_: Read-Write Status
                    Store (Zero, ECRW) /* \_SB_.PCI0._CRS.ECRW */
                }

                If (PM0H)
                {
                    CreateDWordField (BUF0, \_SB.PCI0._Y0D._LEN, F0LN)  // _LEN: Length
                    Store (Zero, F0LN) /* \_SB_.PCI0._CRS.F0LN */
                }

                If (LEqual (PM0H, 0x01))
                {
                    CreateBitField (BUF0, \_SB.PCI0._Y0D._RW, F0RW)  // _RW_: Read-Write Status
                    Store (Zero, F0RW) /* \_SB_.PCI0._CRS.F0RW */
                }

                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MIN, M1MN)  // _MIN: Minimum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._MAX, M1MX)  // _MAX: Maximum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0E._LEN, M1LN)  // _LEN: Length
                ShiftLeft (TLUD, 0x14, M1MN) /* \_SB_.PCI0._CRS.M1MN */
                ShiftLeft (PXBR, 0x1A, Local0)
                Subtract (Local0, 0x01, M1MX) /* \_SB_.PCI0._CRS.M1MX */
                Add (Subtract (M1MX, M1MN), 0x01, M1LN) /* \_SB_.PCI0._CRS.M1LN */
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._MIN, M2MN)  // _MIN: Minimum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._MAX, M2MX)  // _MAX: Maximum Base Address
                CreateDWordField (BUF0, \_SB.PCI0._Y0F._LEN, M2LN)  // _LEN: Length
                ShiftRight (0x10000000, PXSZ, Local1)
                Add (Local0, Local1, M2MN) /* \_SB_.PCI0._CRS.M2MN */
                Add (Subtract (M2MX, M2MN), 0x01, M2LN) /* \_SB_.PCI0._CRS.M2LN */
                Return (BUF0) /* \_SB_.PCI0.BUF0 */
            }

            Device (PDRC)
            {
                Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                Name (_UID, 0x01)  // _UID: Unique ID
                Name (BUF0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00004000,         // Address Length
                        _Y10)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00008000,         // Address Length
                        _Y11)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y12)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y13)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00001000,         // Address Length
                        _Y15)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y14)
                    Memory32Fixed (ReadWrite,
                        0xFED20000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0xFED90000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFED45000,         // Address Base
                        0x0004B000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0xFEC00000,         // Address Base
                        0x00001000,         // Address Length
                        )
                })
                Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                {
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y10._BAS, RBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.LPCB.RCBA, 0x0E, RBR0) /* \_SB_.PCI0.PDRC._CRS.RBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y11._BAS, MBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.MHBR, 0x0F, MBR0) /* \_SB_.PCI0.PDRC._CRS.MBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y12._BAS, DBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.DIBR, 0x0C, DBR0) /* \_SB_.PCI0.PDRC._CRS.DBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y13._BAS, EBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.EPBR, 0x0C, EBR0) /* \_SB_.PCI0.PDRC._CRS.EBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y14._BAS, XBR0)  // _BAS: Base Address
                    ShiftLeft (\_SB.PCI0.PXBR, 0x1A, XBR0) /* \_SB_.PCI0.PDRC._CRS.XBR0 */
                    CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y14._LEN, XSZ0)  // _LEN: Length
                    ShiftRight (0x10000000, \_SB.PCI0.PXSZ, XSZ0) /* \_SB_.PCI0.PDRC._CRS.XSZ0 */
                    If (TBRB)
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y15._BAS, TBR0)  // _BAS: Base Address
                        Store (TBRB, TBR0) /* \_SB_.PCI0.PDRC._CRS.TBR0 */
                    }
                    Else
                    {
                        CreateDWordField (BUF0, \_SB.PCI0.PDRC._Y15._LEN, TBLN)  // _LEN: Length
                        Store (Zero, TBLN) /* \_SB_.PCI0.PDRC._CRS.TBLN */
                    }

                    Return (BUF0) /* \_SB_.PCI0.PDRC.BUF0 */
                }
            }

            Device (PEGP)
            {
                Name (_ADR, 0x00010000)  // _ADR: Address
                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (GFX0)
            {
                Name (_ADR, 0x00020000)  // _ADR: Address
                Method (_DOS, 1, NotSerialized)  // _DOS: Disable Output Switching
                {
                    Store (And (Arg0, 0x07), DSEN) /* \DSEN */
                    HDOS (Arg0)
                }

                Method (_DOD, 0, NotSerialized)  // _DOD: Display Output Devices
                {
                    If (LEqual (DODC, 0x00))
                    {
                        Store (0x01, DODC) /* \_SB_.PCI0.GFX0.DODC */
                        If (SCIP ())
                        {
                            HDOD ()
                            Store (0x00, NDID) /* \NDID */
                            If (CondRefOf (IDAB)) {}
                            Else
                            {
                                If (LNotEqual (DIDL, Zero))
                                {
                                    Store (SDDL (DIDL), DID1) /* \DID1 */
                                }

                                If (LNotEqual (DDL2, Zero))
                                {
                                    Store (SDDL (DDL2), DID2) /* \DID2 */
                                }

                                If (LNotEqual (DDL3, Zero))
                                {
                                    Store (SDDL (DDL3), DID3) /* \DID3 */
                                }

                                If (LNotEqual (DDL4, Zero))
                                {
                                    Store (SDDL (DDL4), DID4) /* \DID4 */
                                }

                                If (LNotEqual (DDL5, Zero))
                                {
                                    Store (SDDL (DDL5), DID5) /* \DID5 */
                                }

                                If (LNotEqual (DDL6, Zero))
                                {
                                    Store (SDDL (DDL6), DID6) /* \DID6 */
                                }

                                If (LNotEqual (DDL7, Zero))
                                {
                                    Store (SDDL (DDL7), DID7) /* \DID7 */
                                }

                                If (LNotEqual (DDL8, Zero))
                                {
                                    Store (SDDL (DDL8), DID8) /* \DID8 */
                                }
                            }
                        }

                        If (LEqual (NDID, 0x00))
                        {
                            Store (0x0400, Index (DerefOf (Index (DODS, NDID)), 0x00))
                        }

                        If (LEqual (NDID, 0x01))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                        }

                        If (LEqual (NDID, 0x02))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                        }

                        If (LEqual (NDID, 0x03))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                        }

                        If (LEqual (NDID, 0x04))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                        }

                        If (LEqual (NDID, 0x05))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                        }

                        If (LEqual (NDID, 0x06))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                            Store (Or (0x00010000, DID6), Index (DerefOf (Index (DODS, NDID
                                )), 0x05))
                        }

                        If (LEqual (NDID, 0x07))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                            Store (Or (0x00010000, DID6), Index (DerefOf (Index (DODS, NDID
                                )), 0x05))
                            Store (Or (0x00010000, DID7), Index (DerefOf (Index (DODS, NDID
                                )), 0x06))
                        }

                        If (LEqual (NDID, 0x08))
                        {
                            Store (Or (0x00010000, DID1), Index (DerefOf (Index (DODS, NDID
                                )), 0x00))
                            Store (Or (0x00010000, DID2), Index (DerefOf (Index (DODS, NDID
                                )), 0x01))
                            Store (Or (0x00010000, DID3), Index (DerefOf (Index (DODS, NDID
                                )), 0x02))
                            Store (Or (0x00010000, DID4), Index (DerefOf (Index (DODS, NDID
                                )), 0x03))
                            Store (Or (0x00010000, DID5), Index (DerefOf (Index (DODS, NDID
                                )), 0x04))
                            Store (Or (0x00010000, DID6), Index (DerefOf (Index (DODS, NDID
                                )), 0x05))
                            Store (Or (0x00010000, DID7), Index (DerefOf (Index (DODS, NDID
                                )), 0x06))
                            Store (Or (0x00010000, DID8), Index (DerefOf (Index (DODS, NDID
                                )), 0x07))
                        }
                    }

                    Store (NDID, Local0)
                    If (LGreater (NDID, 0x08))
                    {
                        Store (0x00, Local0)
                    }

                    Return (DerefOf (Index (DODS, Local0)))
                }

                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LEqual (\_SB.PCI0.GFX0.INIM, 0x01))
                    {
                        \_SB.PCI0.GFX0.GLID (\_SB.LID._LID ())
                        Store (0x00, \_SB.PCI0.GFX0.INIM)
                    }
                }

                Device (DD01)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID1, 0x00))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID1))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        Return (CDDS (DID1))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD1) /* \NXD1 */
                        }

                        Return (NDDS (DID1))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD02)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID2, 0x00))
                        {
                            Return (0x02)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID2))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (LIDS, 0x00))
                        {
                            Return (0x00)
                        }

                        Return (CDDS (DID2))
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD2) /* \NXD2 */
                        }

                        Return (NDDS (DID2))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD03)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x03)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID3))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID3, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID3))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD3) /* \NXD3 */
                        }

                        Return (NDDS (DID3))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD04)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x04)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID4))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID4, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID4))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD4) /* \NXD4 */
                        }

                        Return (NDDS (DID4))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD05)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x05)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID5))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID5, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID5))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD5) /* \NXD5 */
                        }

                        Return (NDDS (DID5))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD06)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID6, 0x00))
                        {
                            Return (0x06)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID6))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID6, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID6))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD6) /* \NXD6 */
                        }

                        Return (NDDS (DID6))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD07)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID7, 0x00))
                        {
                            Return (0x07)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID7))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID7, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID7))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD7) /* \NXD7 */
                        }

                        Return (NDDS (DID7))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Device (DD08)
                {
                    Method (_ADR, 0, Serialized)  // _ADR: Address
                    {
                        If (LEqual (DID8, 0x00))
                        {
                            Return (0x08)
                        }
                        Else
                        {
                            Return (And (0xFFFF, DID8))
                        }
                    }

                    Method (_DCS, 0, NotSerialized)  // _DCS: Display Current Status
                    {
                        If (LEqual (DID8, 0x00))
                        {
                            Return (0x0B)
                        }
                        Else
                        {
                            Return (CDDS (DID8))
                        }
                    }

                    Method (_DGS, 0, NotSerialized)  // _DGS: Display Graphics State
                    {
                        If (CondRefOf (SNXD))
                        {
                            Return (NXD8) /* \NXD8 */
                        }

                        Return (NDDS (DID8))
                    }

                    Method (_DSS, 1, NotSerialized)  // _DSS: Device Set State
                    {
                        If (LEqual (And (Arg0, 0xC0000000), 0xC0000000))
                        {
                            Store (NSTE, CSTE) /* \CSTE */
                        }
                    }
                }

                Method (SDDL, 1, NotSerialized)
                {
                    Increment (NDID)
                    Store (And (Arg0, 0x0F0F), Local0)
                    Or (0x80000000, Local0, Local1)
                    If (LEqual (DIDL, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL2, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL3, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL4, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL5, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL6, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL7, Local0))
                    {
                        Return (Local1)
                    }

                    If (LEqual (DDL8, Local0))
                    {
                        Return (Local1)
                    }

                    Return (0x00)
                }

                Method (CDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x1D)
                    }

                    If (LEqual (CADL, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL2, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL3, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL4, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL5, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL6, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL7, Local0))
                    {
                        Return (0x1F)
                    }

                    If (LEqual (CAL8, Local0))
                    {
                        Return (0x1F)
                    }

                    Return (0x1D)
                }

                Method (NDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x00)
                    }

                    If (LEqual (NADL, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL2, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL3, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL4, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL5, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL6, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL7, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (NDL8, Local0))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Scope (\_SB.PCI0)
                {
                    OperationRegion (MCHP, PCI_Config, 0x40, 0xC0)
                    Field (MCHP, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x60), 
                        TASM,   10, 
                        Offset (0x62)
                    }
                }

                OperationRegion (IGDP, PCI_Config, 0x40, 0xC0)
                Field (IGDP, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x12), 
                        ,   1, 
                    GIVD,   1, 
                        ,   2, 
                    GUMA,   3, 
                    Offset (0x14), 
                        ,   4, 
                    GMFN,   1, 
                    Offset (0x18), 
                    Offset (0xA4), 
                    ASLE,   8, 
                    Offset (0xA8), 
                    GSSE,   1, 
                    GSSB,   14, 
                    GSES,   1, 
                    Offset (0xB0), 
                        ,   12, 
                    CDVL,   1, 
                    Offset (0xB2), 
                    Offset (0xB5), 
                    LBPC,   8, 
                    Offset (0xBC), 
                    ASLS,   32
                }

                OperationRegion (IGDM, SystemMemory, ASLB, 0x2000)
                Field (IGDM, AnyAcc, NoLock, Preserve)
                {
                    SIGN,   128, 
                    SIZE,   32, 
                    OVER,   32, 
                    SVER,   256, 
                    VVER,   128, 
                    GVER,   128, 
                    MBOX,   32, 
                    DMOD,   32, 
                    PCON,   32, 
                    DVER,   64, 
                    Offset (0x100), 
                    DRDY,   32, 
                    CSTS,   32, 
                    CEVT,   32, 
                    Offset (0x120), 
                    DIDL,   32, 
                    DDL2,   32, 
                    DDL3,   32, 
                    DDL4,   32, 
                    DDL5,   32, 
                    DDL6,   32, 
                    DDL7,   32, 
                    DDL8,   32, 
                    CPDL,   32, 
                    CPL2,   32, 
                    CPL3,   32, 
                    CPL4,   32, 
                    CPL5,   32, 
                    CPL6,   32, 
                    CPL7,   32, 
                    CPL8,   32, 
                    CADL,   32, 
                    CAL2,   32, 
                    CAL3,   32, 
                    CAL4,   32, 
                    CAL5,   32, 
                    CAL6,   32, 
                    CAL7,   32, 
                    CAL8,   32, 
                    NADL,   32, 
                    NDL2,   32, 
                    NDL3,   32, 
                    NDL4,   32, 
                    NDL5,   32, 
                    NDL6,   32, 
                    NDL7,   32, 
                    NDL8,   32, 
                    ASLP,   32, 
                    TIDX,   32, 
                    CHPD,   32, 
                    CLID,   32, 
                    CDCK,   32, 
                    SXSW,   32, 
                    EVTS,   32, 
                    CNOT,   32, 
                    NRDY,   32, 
                    Offset (0x200), 
                    SCIE,   1, 
                    GEFC,   4, 
                    GXFC,   3, 
                    GESF,   8, 
                    Offset (0x204), 
                    PARM,   32, 
                    DSLP,   32, 
                    Offset (0x300), 
                    ARDY,   32, 
                    ASLC,   32, 
                    TCHE,   32, 
                    ALSI,   32, 
                    BCLP,   32, 
                    PFIT,   32, 
                    CBLV,   32, 
                    BCLM,   320, 
                    CPFM,   32, 
                    EPFM,   32, 
                    PLUT,   592, 
                    PFMB,   32, 
                    CCDV,   32, 
                    PCFT,   32, 
                    Offset (0x400), 
                    GVD1,   49152, 
                    PHED,   32, 
                    BDDC,   2048
                }

                If (CondRefOf (FPED))
                {
                    FPED ()
                }

                Name (DBTB, Package (0x15)
                {
                    0x00, 
                    0x07, 
                    0x38, 
                    0x01C0, 
                    0x0E00, 
                    0x3F, 
                    0x01C7, 
                    0x0E07, 
                    0x01F8, 
                    0x0E38, 
                    0x0FC0, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x7000, 
                    0x7007, 
                    0x7038, 
                    0x71C0, 
                    0x7E00
                })
                Name (CDCT, Package (0x05)
                {
                    Package (0x02)
                    {
                        0xE4, 
                        0x0140
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }, 

                    Package (0x02)
                    {
                        0x00, 
                        0x00
                    }, 

                    Package (0x02)
                    {
                        0xDE, 
                        0x014D
                    }
                })
                Name (SUCC, 0x01)
                Name (NVLD, 0x02)
                Name (CRIT, 0x04)
                Name (NCRT, 0x06)
                Method (GSCI, 0, Serialized)
                {
                    Method (GBDA, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x59, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                        }

                        If (LEqual (GESF, 0x01))
                        {
                            Store (0x80, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                        }

                        If (LEqual (GESF, 0x04))
                        {
                            Store (0x30000000, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                        }

                        If (LEqual (GESF, 0x05))
                        {
                            Or (PARM, ShiftLeft (LIDS, 0x10), PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Add (PARM, 0x00010000, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                        }

                        If (LEqual (GESF, 0x06))
                        {
                            Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (Zero)
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            Store (GIVD, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            XOr (PARM, 0x01, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Or (PARM, ShiftLeft (GMFN, 0x01), PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Or (PARM, ShiftLeft (0x03, 0x0B), PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Or (PARM, ShiftLeft (IDMS, 0x11), PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Or (ShiftLeft (DerefOf (Index (DerefOf (Index (CDCT, HVCO)), CDVL
                                )), 0x15), PARM, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (0x01, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                        }

                        If (LEqual (GESF, 0x0A))
                        {
                            Store (0x00, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (0x00, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (Zero)
                        }

                        Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                        Return (CRIT) /* \_SB_.PCI0.GFX0.CRIT */
                    }

                    Method (SBCB, 0, Serialized)
                    {
                        If (LEqual (GESF, 0x00))
                        {
                            Store (0x00, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (0x000F87FD, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (0x40, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                        }

                        If (LEqual (GESF, 0x07))
                        {
                            If (LEqual (PARM, 0x00))
                            {
                                Store (CLID, Local0)
                                If (And (0x80000000, Local0))
                                {
                                    And (CLID, 0x0F, CLID) /* \_SB_.PCI0.GFX0.CLID */
                                    GLID (CLID)
                                }
                            }

                            Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                            Store (Zero, PARM) /* \_SB_.PCI0.GFX0.PARM */
                            Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                        }

                        Store (Zero, GESF) /* \_SB_.PCI0.GFX0.GESF */
                        Return (SUCC) /* \_SB_.PCI0.GFX0.SUCC */
                    }

                    If (LEqual (GEFC, 0x04))
                    {
                        Store (GBDA (), GXFC) /* \_SB_.PCI0.GFX0.GXFC */
                    }

                    If (LEqual (GEFC, 0x06))
                    {
                        Store (SBCB (), GXFC) /* \_SB_.PCI0.GFX0.GXFC */
                    }

                    Store (0x00, GEFC) /* \_SB_.PCI0.GFX0.GEFC */
                    Store (0x01, SCIS) /* \SCIS */
                    Store (0x00, GSSE) /* \_SB_.PCI0.GFX0.GSSE */
                    Store (0x00, SCIE) /* \_SB_.PCI0.GFX0.SCIE */
                    Return (Zero)
                }

                Method (PDRD, 0, NotSerialized)
                {
                    If (LNot (DRDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (DRDY))
                }

                Method (PSTS, 0, NotSerialized)
                {
                    If (LGreater (CSTS, 0x02))
                    {
                        Sleep (ASLP)
                    }

                    Return (LEqual (CSTS, 0x03))
                }

                Method (GNOT, 2, NotSerialized)
                {
                    If (PDRD ())
                    {
                        Return (0x01)
                    }

                    Store (Arg0, CEVT) /* \_SB_.PCI0.GFX0.CEVT */
                    Store (0x03, CSTS) /* \_SB_.PCI0.GFX0.CSTS */
                    If (LAnd (LEqual (CHPD, 0x00), LEqual (Arg1, 0x00)))
                    {
                        If (LAnd (LGreater (OSYS, 0x07D0), LLess (OSYS, 0x07D6)))
                        {
                            Notify (\_SB.PCI0, Arg1)
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.GFX0, Arg1)
                        }
                    }

                    If (CondRefOf (WMAB))
                    {
                        WMAB (Arg0)
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.GFX0, 0x80) // Status Change
                    }

                    If (LNot (PSTS ()))
                    {
                        Store (0x00, CEVT) /* \_SB_.PCI0.GFX0.CEVT */
                    }

                    Return (0x00)
                }

                Method (GHDS, 1, NotSerialized)
                {
                    Store (Arg0, TIDX) /* \_SB_.PCI0.GFX0.TIDX */
                    Return (GNOT (0x01, 0x00))
                }

                Method (GLID, 1, NotSerialized)
                {
                    Store (Arg0, CLID) /* \_SB_.PCI0.GFX0.CLID */
                    Return (GNOT (0x02, 0x00))
                }

                Method (GDCK, 1, NotSerialized)
                {
                    Store (Arg0, CDCK) /* \_SB_.PCI0.GFX0.CDCK */
                    Return (GNOT (0x04, 0x00))
                }

                Method (PARD, 0, NotSerialized)
                {
                    If (LNot (ARDY))
                    {
                        Sleep (ASLP)
                    }

                    Return (LNot (ARDY))
                }

                Method (AINT, 2, NotSerialized)
                {
                    If (LNot (And (TCHE, ShiftLeft (0x01, Arg0))))
                    {
                        Return (0x01)
                    }

                    If (PARD ())
                    {
                        Return (0x01)
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        If (CPFM)
                        {
                            And (CPFM, 0x0F, Local0)
                            And (EPFM, 0x0F, Local1)
                            If (LEqual (Local0, 0x01))
                            {
                                If (And (Local1, 0x06))
                                {
                                    Store (0x06, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                }
                                Else
                                {
                                    If (And (Local1, 0x08))
                                    {
                                        Store (0x08, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                    }
                                    Else
                                    {
                                        Store (0x01, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x06))
                            {
                                If (And (Local1, 0x08))
                                {
                                    Store (0x08, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                }
                                Else
                                {
                                    If (And (Local1, 0x01))
                                    {
                                        Store (0x01, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                    }
                                    Else
                                    {
                                        Store (0x06, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                    }
                                }
                            }

                            If (LEqual (Local0, 0x08))
                            {
                                If (And (Local1, 0x01))
                                {
                                    Store (0x01, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                }
                                Else
                                {
                                    If (And (Local1, 0x06))
                                    {
                                        Store (0x06, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                    }
                                    Else
                                    {
                                        Store (0x08, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                                    }
                                }
                            }
                        }
                        Else
                        {
                            XOr (PFIT, 0x07, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        }

                        Or (PFIT, 0x80000000, PFIT) /* \_SB_.PCI0.GFX0.PFIT */
                        Store (0x04, ASLC) /* \_SB_.PCI0.GFX0.ASLC */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Arg1, BCLP) /* \_SB_.PCI0.GFX0.BCLP */
                            Or (BCLP, 0x80000000, BCLP) /* \_SB_.PCI0.GFX0.BCLP */
                            Store (0x02, ASLC) /* \_SB_.PCI0.GFX0.ASLC */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x00))
                            {
                                Store (Arg1, ALSI) /* \_SB_.PCI0.GFX0.ALSI */
                                Store (0x01, ASLC) /* \_SB_.PCI0.GFX0.ASLC */
                            }
                            Else
                            {
                                Return (0x01)
                            }
                        }
                    }

                    Store (0x01, ASLE) /* \_SB_.PCI0.GFX0.ASLE */
                    Return (0x00)
                }

                Method (SCIP, 0, NotSerialized)
                {
                    If (LNotEqual (OVER, 0x00))
                    {
                        Return (LNot (GSMI))
                    }

                    Return (0x00)
                }

                Device (\_SB.MEM2)
                {
                    Name (_HID, EisaId ("PNP0C01"))  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (CRS1, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x20000000,         // Address Base
                            0x00200000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x40000000,         // Address Base
                            0x00200000,         // Address Length
                            )
                    })
                    Name (CRS2, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x20000000,         // Address Base
                            0x00200000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0x40004000,         // Address Base
                            0x00001000,         // Address Length
                            )
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (IGDS)
                        {
                            Return (0x0F)
                        }

                        Return (0x00)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        If (LOr (LEqual (And (PNHM, 0x0FFF0FF0), 0x000206A0), LEqual (And (
                            PNHM, 0x0FFF0FFF), 0x000306A0)))
                        {
                            Return (CRS1) /* \_SB_.MEM2.CRS1 */
                        }

                        Return (CRS2) /* \_SB_.MEM2.CRS2 */
                    }
                }

                Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
                {
                    Name (DRET, Buffer (0x04)
                    {
                         0x00
                    })
                    If (LEqual (Arg0, Buffer (0x10)
                            {
                                /* 0000 */   0xE1, 0x75, 0x39, 0x6F, 0x82, 0x7A, 0x67, 0x4F,
                                /* 0008 */   0x8B, 0x97, 0x15, 0xBE, 0xE0, 0x60, 0xBE, 0xDF
                            }))
                    {
                        If (LEqual (Arg2, 0x00))
                        {
                            CreateWordField (DRET, 0x00, F0SS)
                            Store (0x02, F0SS) /* \_SB_.PCI0.GFX0._DSM.F0SS */
                            Return (DRET) /* \_SB_.PCI0.GFX0._DSM.DRET */
                        }

                        If (LEqual (Arg2, 0x01))
                        {
                            If (LEqual (\_SB.PCI0.PEGP.DGFX.LNKV, 0x03))
                            {
                                Return (0x00)
                            }

                            Return (0x01)
                        }
                    }

                    Return (DRET) /* \_SB_.PCI0.GFX0._DSM.DRET */
                }
            }

            Scope (GFX0)
            {
                Name (DODC, 0x00)
                Name (INIM, 0x00)
                Name (HPDD, Package (0x09)
                {
                    0x0400, 
                    0x0100, 
                    0x0200, 
                    0x0300, 
                    0x0301, 
                    0x0302, 
                    0x0303, 
                    0x0304, 
                    0x0305
                })
                Name (DSPR, Buffer (0x09)
                {
                    /* 0000 */   0x00, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x01,
                    /* 0008 */   0x02
                })
                Name (DODS, Package (0x09)
                {
                    Package (0x01)
                    {
                        0xFFFFFFFF
                    }, 

                    Package (0x01)
                    {
                        0xFFFFFFFF
                    }, 

                    Package (0x02)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x03)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x04)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x05)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x06)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x07)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }, 

                    Package (0x08)
                    {
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF, 
                        0xFFFFFFFF
                    }
                })
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    Store (0x01, INIM) /* \_SB_.PCI0.GFX0.INIM */
                    DKET ()
                    Store (0x00, WDSA) /* \WDSA */
                    Store (0x00, WDST) /* \WDST */
                    Store (0x00, WDGN) /* \WDGN */
                }

                Method (HDOS, 1, NotSerialized)
                {
                    And (WDPE, 0xF8, Local0)
                    And (WDPE, 0x87, Local1)
                    Or (Local0, Arg0, WDPE) /* \WDPE */
                    If (CondRefOf (^PDOS, Local2))
                    {
                        ^PDOS (Arg0, Local1)
                    }
                }

                Method (HDOD, 0, NotSerialized)
                {
                    Store (0x01, Local1)
                    If (And (TCHE, 0x02))
                    {
                        Store (0x03, Local1)
                    }

                    Or (DCAP, Local1, DCAP) /* \DCAP */
                }

                Method (PDDS, 1, NotSerialized)
                {
                    Store (And (Arg0, 0x0F0F), Local0)
                    If (LEqual (0x00, Local0))
                    {
                        Return (0x00)
                    }

                    If (LEqual (CPDL, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL2, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL3, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL4, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL5, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL6, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL7, Local0))
                    {
                        Return (0x01)
                    }

                    If (LEqual (CPL8, Local0))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (UPNA, 2, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (NADL, Local1)
                        Store (Arg1, NADL) /* \_SB_.PCI0.GFX0.NADL */
                    }

                    If (LEqual (Arg0, 0x01))
                    {
                        Store (NDL2, Local1)
                        Store (Arg1, NDL2) /* \_SB_.PCI0.GFX0.NDL2 */
                    }

                    If (LEqual (Arg0, 0x02))
                    {
                        Store (NDL3, Local1)
                        Store (Arg1, NDL3) /* \_SB_.PCI0.GFX0.NDL3 */
                    }

                    If (LEqual (Arg0, 0x03))
                    {
                        Store (NDL4, Local1)
                        Store (Arg1, NDL4) /* \_SB_.PCI0.GFX0.NDL4 */
                    }

                    If (LEqual (Arg0, 0x04))
                    {
                        Store (NDL5, Local1)
                        Store (Arg1, NDL5) /* \_SB_.PCI0.GFX0.NDL5 */
                    }

                    If (LEqual (Arg0, 0x05))
                    {
                        Store (NDL6, Local1)
                        Store (Arg1, NDL6) /* \_SB_.PCI0.GFX0.NDL6 */
                    }

                    If (LEqual (Arg0, 0x06))
                    {
                        Store (NDL7, Local1)
                        Store (Arg1, NDL7) /* \_SB_.PCI0.GFX0.NDL7 */
                    }

                    If (LEqual (Arg0, 0x07))
                    {
                        Store (NDL8, Local1)
                        Store (Arg1, NDL8) /* \_SB_.PCI0.GFX0.NDL8 */
                    }

                    Return (Local1)
                }

                Method (UPAA, 0, Serialized)
                {
                    Store (0x00, Local1)
                    While (LLess (Local1, SizeOf (HPDD)))
                    {
                        ShiftLeft (0x01, Local1, Local0)
                        Store (DerefOf (Index (HPDD, Local1)), Local2)
                        If (PDDS (Local2))
                        {
                            Or (WDST, Local0, WDST) /* \WDST */
                        }
                        Else
                        {
                            And (WDST, Not (Local0), WDST) /* \WDST */
                        }

                        If (LEqual (CDDS (Local2), 0x1F))
                        {
                            Or (WDSA, Local0, WDSA) /* \WDSA */
                        }
                        Else
                        {
                            And (WDSA, Not (Local0), WDSA) /* \WDSA */
                        }

                        Increment (Local1)
                    }
                }

                Method (UPND, 0, Serialized)
                {
                    Store (WDGN, Local1)
                    Store (0x00, Local0)
                    Store (0x00, Local2)
                    While (LAnd (LLess (Local0, SizeOf (DSPR)), Local1))
                    {
                        Store (DerefOf (Index (DSPR, Local0)), Local3)
                        ShiftLeft (0x01, Local3, Local4)
                        If (And (Local1, Local4))
                        {
                            Store (DerefOf (Index (HPDD, Local3)), Local5)
                            UPNA (Local2, Local5)
                            Increment (Local2)
                            And (Local1, Not (Local4), Local1)
                        }

                        If (LGreaterEqual (Local2, 0x02))
                        {
                            Break
                        }

                        Increment (Local0)
                    }

                    XOr (WDGN, Local1, WDGN) /* \WDGN */
                    Store (0x01, Local1)
                    While (LAnd (LLess (Local2, 0x08), Local1))
                    {
                        Store (UPNA (Local2, 0x00), Local1)
                        Increment (Local2)
                    }
                }

                Method (GF4E, 1, Serialized)
                {
                    UPAA ()
                    If (LEqual (WDSA, 0x01))
                    {
                        Or (WDST, 0x01, WDGN) /* \WDGN */
                    }
                    Else
                    {
                        If (And (WDSA, 0x01))
                        {
                            And (WDST, Not (0x01), WDGN) /* \WDGN */
                        }
                        Else
                        {
                            Store (0x01, WDGN) /* \WDGN */
                        }
                    }

                    UPND ()
                    Signal (\_SB.F4EV)
                    GHDS (0x00)
                    Return (0x01)
                }

                Method (DKET, 0, NotSerialized)
                {
                    If (LEqual (\_SB.PCI0.GFX0.GIVD, 0x00))
                    {
                        Store ("GFX DockEvent Enter", Debug)
                        Store (\_SB.DCKD (), Local0)
                        Store ("Dock Status", Debug)
                        Store (Local0, Debug)
                        \_SB.PCI0.GFX0.GDCK (Local0)
                        Store ("GFX DockEvent Exit", Debug)
                    }

                    Return (0x00)
                }

                Method (RFHS, 1, Serialized)
                {
                    If (Arg0)
                    {
                        UPAA ()
                    }
                    Else
                    {
                        Wait (\_SB.F4EV, 0x0500)
                    }
                }

                Method (SNXS, 0, Serialized)
                {
                    UPND ()
                    GHDS (0x00)
                }

                Method (SBRV, 0, Serialized)
                {
                    Store ("Set Brightness", Debug)
                    If (LEqual (And (DCAP, 0x02), 0x00))
                    {
                        If (And (TCHE, 0x02))
                        {
                            Store ("TCHE set", Debug)
                            Or (DCAP, 0x02, DCAP) /* \DCAP */
                        }
                    }

                    And (DCAP, 0x02, Local3)
                    If (Local3)
                    {
                        Store ("OpRegion take control of Brightness", Debug)
                        Store (\_SB.SBRC (), Local1)
                        Store (Local1, Debug)
                        AINT (0x01, Local1)
                    }

                    Return (Local3)
                }

                Scope (DD02)
                {
                    Method (_BCL, 0, Serialized)  // _BCL: Brightness Control Levels
                    {
                        If (LLessEqual (\WCOS (), 0x07))
                        {
                            Return (\_SB.BCL ())
                        }
                        Else
                        {
                            Return (Package (0x67)
                            {
                                0x50, 
                                0x32, 
                                0x00, 
                                0x01, 
                                0x02, 
                                0x03, 
                                0x04, 
                                0x05, 
                                0x06, 
                                0x07, 
                                0x08, 
                                0x09, 
                                0x0A, 
                                0x0B, 
                                0x0C, 
                                0x0D, 
                                0x0E, 
                                0x0F, 
                                0x10, 
                                0x11, 
                                0x12, 
                                0x13, 
                                0x14, 
                                0x15, 
                                0x16, 
                                0x17, 
                                0x18, 
                                0x19, 
                                0x1A, 
                                0x1B, 
                                0x1C, 
                                0x1D, 
                                0x1E, 
                                0x1F, 
                                0x20, 
                                0x21, 
                                0x22, 
                                0x23, 
                                0x24, 
                                0x25, 
                                0x26, 
                                0x27, 
                                0x28, 
                                0x29, 
                                0x2A, 
                                0x2B, 
                                0x2C, 
                                0x2D, 
                                0x2E, 
                                0x2F, 
                                0x30, 
                                0x31, 
                                0x32, 
                                0x33, 
                                0x34, 
                                0x35, 
                                0x36, 
                                0x37, 
                                0x38, 
                                0x39, 
                                0x3A, 
                                0x3B, 
                                0x3C, 
                                0x3D, 
                                0x3E, 
                                0x3F, 
                                0x40, 
                                0x41, 
                                0x42, 
                                0x43, 
                                0x45, 
                                0x45, 
                                0x46, 
                                0x47, 
                                0x48, 
                                0x49, 
                                0x4A, 
                                0x4B, 
                                0x4C, 
                                0x4D, 
                                0x4E, 
                                0x4F, 
                                0x50, 
                                0x51, 
                                0x52, 
                                0x53, 
                                0x54, 
                                0x55, 
                                0x56, 
                                0x57, 
                                0x58, 
                                0x59, 
                                0x5A, 
                                0x5B, 
                                0x5C, 
                                0x5D, 
                                0x5E, 
                                0x5F, 
                                0x60, 
                                0x61, 
                                0x62, 
                                0x63, 
                                0x64
                            })
                        }
                    }

                    Method (_BCM, 1, Serialized)  // _BCM: Brightness Control Method
                    {
                        Store (\_SB.BCM (Arg0), Local0)
                        If (Local0)
                        {
                            Store (BRID, Local1)
                            If (LEqual (SBRV (), 0x00))
                            {
                                \_SB.SSMI (0xEA74, 0x04, Local1, 0x00, 0x00)
                            }

                            Signal (\_SB.BEVT)
                        }
                    }

                    Method (_BQC, 0, Serialized)  // _BQC: Brightness Query Current
                    {
                        Return (\_SB.BQC ())
                    }
                }

                Scope (\_GPE)
                {
                    Method (_L06, 0, NotSerialized)  // _Lxx: Level-Triggered GPE
                    {
                        If (LEqual (\_SB.PCI0.GFX0.GIVD, 0x00))
                        {
                            If (LAnd (\_SB.PCI0.GFX0.GSSE, LNot (GSMI)))
                            {
                                \_SB.PCI0.GFX0.GSCI ()
                            }
                            Else
                            {
                                Store (0x01, SCIS) /* \SCIS */
                            }
                        }
                    }

                    Name (WOAT, 0xFF)
                    Method (CNDD, 1, NotSerialized)
                    {
                        If (LEqual (\_SB.PCI0.GFX0.GIVD, 0x00))
                        {
                            If (LOr (Arg0, LNotEqual (WDST, WOAT)))
                            {
                                Store (WDST, WOAT) /* \_GPE.WOAT */
                                If (LGreaterEqual (\WCOS (), 0x04))
                                {
                                    Notify (\_SB.PCI0, 0x00) // Bus Check
                                }
                                Else
                                {
                                    Notify (\_SB.PCI0.GFX0, 0x00) // Bus Check
                                }

                                Sleep (0x02EE)
                            }
                        }
                    }

                    Method (VHIV, 3, Serialized)
                    {
                        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                        If (\_SB.PCI0.GFX0.GIVD)
                        {
                            Return (0x01)
                        }

                        While (One)
                        {
                            Store (Arg2, _T_0) /* \_GPE.VHIV._T_0 */
                            If (LEqual (_T_0, 0x01))
                            {
                                If (And (Arg0, 0x80))
                                {
                                    Notify (\_SB.PCI0.GFX0.DD02, Arg0)
                                }
                                Else
                                {
                                    Store ("Verify no OS controlled brightness b/c VideoBrightnessEvent", Debug)
                                    If (LEqual (And (WDPE, 0x44), 0x00))
                                    {
                                        Store ("VBRE method, use OpRegion method", Debug)
                                        \_SB.PCI0.GFX0.SBRV ()
                                    }
                                }
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x02))
                                {
                                    \_SB.PCI0.GFX0.GDCC (0x01)
                                    If (LEqual (And (WDPE, 0x03), 0x00))
                                    {
                                        If (And (DCAP, 0x01))
                                        {
                                            \_SB.PCI0.GFX0.DKET ()
                                        }
                                        Else
                                        {
                                            \_SB.SSMI (0xEA74, 0x06, 0x00, 0x00, 0x00)
                                            CNDD (0x00)
                                            Notify (\_SB.PCI0.GFX0, 0x80) // Status Change
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03))
                                    {
                                        Store (\_SB.LID._LID (), \_SB.PCI0.GFX0.CLID)
                                        If (LOr (LLess (\WCOS (), 0x06), LEqual (And (WDPE, 0x03), 
                                            0x00)))
                                        {
                                            If (And (DCAP, 0x01))
                                            {
                                                If (\_SB.PCI0.GFX0.GLID (\_SB.LID._LID ()))
                                                {
                                                    Or (0x80000000, \_SB.PCI0.GFX0.CLID, \_SB.PCI0.GFX0.CLID)
                                                }
                                            }
                                            Else
                                            {
                                                \_SB.SSMI (0xEA74, 0x05, 0x00, 0x00, 0x00)
                                                CNDD (0x01)
                                                Notify (\_SB.PCI0.GFX0, 0x80) // Status Change
                                                If (LLess (\WCOS (), 0x06))
                                                {
                                                    Store (0x00, LRSC) /* \_GPE.LRSC */
                                                }
                                            }
                                        }
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x04))
                                        {
                                            If (LEqual (And (WDPE, 0x03), 0x00))
                                            {
                                                If (And (DCAP, 0x01))
                                                {
                                                    \_SB.PCI0.GFX0.GF4E (0x00)
                                                }
                                                Else
                                                {
                                                    CNDD (0x00)
                                                    Notify (\_SB.PCI0.GFX0, 0x80) // Status Change
                                                }
                                            }
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                If (And (DCAP, 0x01))
                                                {
                                                    \_SB.PCI0.GFX0.SNXS ()
                                                }
                                                Else
                                                {
                                                    \_GPE.CNDD (0x00)
                                                    Notify (\_SB.PCI0.GFX0, 0x80) // Status Change
                                                }
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x07))
                                                {
                                                    \_SB.PCI0.GFX0.RFHS (Arg0)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x08))
                                                    {
                                                        If (LEqual (Arg0, 0x04))
                                                        {
                                                            \_SB.PCI0.GFX0.GLID (\_SB.LID._LID ())
                                                            \_SB.PCI0.GFX0.DKET ()
                                                        }

                                                        If (LGreaterEqual (Arg0, 0x03))
                                                        {
                                                            If (LEqual (And (WDPE, 0x44), 0x00))
                                                            {
                                                                Store (\_SB.SBRC (), Local0)
                                                                Or (Local0, 0x80000000, \_SB.PCI0.GFX0.BCLP)
                                                            }
                                                        }
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x09))
                                                        {
                                                            If (LEqual (And (WDPE, 0x04), 0x00))
                                                            {
                                                                \_SB.PCI0.GFX0.SBRV ()
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }

                            Break
                        }

                        Return (0x00)
                    }
                }

                Event (\_SB.BEVT)
                Event (\_SB.F4EV)
                Scope (\_GPE)
                {
                    Method (VBRE, 1, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (Arg0, 0x00, 0x01), Local1)
                        }

                        If (And (SGMD, 0x0F))
                        {
                            If (LNotEqual (\_SB.PCI0.PEGP.DGFX.SVID, 0xFFFF))
                            {
                                If (And (Arg0, 0x80))
                                {
                                    Notify (\_SB.PCI0.PEGP.DGFX.DD02, Arg0)
                                }
                            }
                        }
                    }

                    Method (VFN4, 0, Serialized)
                    {
                        Signal (\_SB.F4EV)
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x04), Local1)
                        }
                    }

                    Method (VDET, 0, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x02), Local1)
                        }
                    }

                    Name (LRSC, 0x01)
                    Method (VLET, 0, Serialized)
                    {
                        Store (0x01, LRSC) /* \_GPE.LRSC */
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x03), Local1)
                        }

                        Return (LRSC) /* \_GPE.LRSC */
                    }

                    Method (VPUP, 2, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (Arg0, Arg1, 0x05), Local1)
                        }
                    }
                }

                Scope (\_SB)
                {
                    Method (VSDD, 1, Serialized)
                    {
                        If (And (DCAP, 0x04))
                        {
                            Return (0xFFFF)
                        }
                        Else
                        {
                            If (LEqual (And (WDPE, 0x03), 0x00))
                            {
                                Store (Arg0, WDGN) /* \WDGN */
                                Store (0x01, Local1)
                                If (Local1)
                                {
                                    Store (\_GPE.VHIV (Arg0, 0x00, 0x06), Local1)
                                }
                            }

                            Return (0x00)
                        }

                        Return (Zero)
                    }

                    Method (VGDD, 1, Serialized)
                    {
                        If (LAnd (And (DCAP, 0x04), Arg0))
                        {
                            Return (0xFFFF)
                        }
                        Else
                        {
                            If (And (DCAP, 0x01))
                            {
                                If (LEqual (Arg0, 0x00))
                                {
                                    Wait (\_SB.F4EV, 0x0500)
                                }

                                Store (0x01, Local1)
                                If (Local1)
                                {
                                    Store (\_GPE.VHIV (Arg0, 0x00, 0x07), Local1)
                                }
                            }
                            Else
                            {
                                If (Arg0)
                                {
                                    \_SB.SSMI (0xEA74, 0x02, 0x00, 0x00, 0x00)
                                }
                            }

                            Return (WDST) /* \WDST */
                        }
                    }

                    Method (VWAK, 1, Serialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (Arg0, 0x00, 0x08), Local1)
                        }
                    }

                    Method (WBRT, 0, NotSerialized)
                    {
                        Store (0x01, Local1)
                        If (Local1)
                        {
                            Store (\_GPE.VHIV (0x00, 0x00, 0x09), Local1)
                        }
                    }
                }

                Name (DCSC, 0xFF)
                Method (GDCC, 1, Serialized)
                {
                    If (LAnd (Arg0, LEqual (DCSC, 0xFF)))
                    {
                        Store (Or (0x01, Or (0x02, 0x04)), Local0)
                        If (\_SB.DCKD ())
                        {
                            Or (Local0, 0x08, Local0)
                        }

                        Store (Local0, DCSC) /* \_SB_.PCI0.GFX0.DCSC */
                    }

                    Return (DCSC) /* \_SB_.PCI0.GFX0.DCSC */
                }

                Method (PDOS, 2, NotSerialized)
                {
                }
            }

            Device (PEGP.DGFX)
            {
                Name (_ADR, 0x00)  // _ADR: Address
                OperationRegion (VIDR, PCI_Config, 0x00, 0xF0)
                Field (VIDR, WordAcc, NoLock, Preserve)
                {
                    VVID,   16, 
                    Offset (0x0B), 
                    LNKV,   8
                }
            }

            Scope (\)
            {
                OperationRegion (IO_T, SystemIO, 0x1000, 0x10)
                Field (IO_T, ByteAcc, NoLock, Preserve)
                {
                    TRPI,   16, 
                    Offset (0x04), 
                    Offset (0x06), 
                    Offset (0x08), 
                    TRP0,   8, 
                    Offset (0x0A), 
                    Offset (0x0B), 
                    Offset (0x0C), 
                    Offset (0x0D), 
                    Offset (0x0E), 
                    Offset (0x0F), 
                    Offset (0x10)
                }

                OperationRegion (IO_D, SystemIO, 0x0810, 0x04)
                Field (IO_D, ByteAcc, NoLock, Preserve)
                {
                    TRPD,   8
                }

                OperationRegion (IO_H, SystemIO, 0x1000, 0x04)
                Field (IO_H, ByteAcc, NoLock, Preserve)
                {
                    TRPH,   8
                }

                OperationRegion (PMIO, SystemIO, 0x0400, 0x80)
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x20), 
                        ,   2, 
                    SPST,   1, 
                        ,   16, 
                    GPS3,   1, 
                    Offset (0x42), 
                        ,   1, 
                    GPEC,   1, 
                    Offset (0x64), 
                        ,   9, 
                    SCIS,   1, 
                    Offset (0x66)
                }

                OperationRegion (GPIO, SystemIO, 0x0500, 0x64)
                Field (GPIO, ByteAcc, NoLock, Preserve)
                {
                    GU00,   8, 
                    GU01,   8, 
                    GU02,   8, 
                    GU03,   8, 
                    GIO0,   8, 
                    GIO1,   8, 
                    GIO2,   8, 
                    GIO3,   8, 
                    Offset (0x0C), 
                    GL00,   8, 
                    GL01,   8, 
                    GL02,   8, 
                        ,   3, 
                    GP27,   1, 
                    GP28,   1, 
                    Offset (0x10), 
                    Offset (0x18), 
                    GB00,   8, 
                    GB01,   8, 
                    GB02,   8, 
                    GB03,   8, 
                    Offset (0x2C), 
                    GIV0,   8, 
                    GIV1,   8, 
                    GIV2,   8, 
                    GIV3,   8, 
                    GU04,   8, 
                    GU05,   8, 
                    GU06,   8, 
                    GU07,   8, 
                    GIO4,   8, 
                    GIO5,   8, 
                    GIO6,   8, 
                    GIO7,   8, 
                        ,   5, 
                        ,   1, 
                    Offset (0x39), 
                    GL05,   8, 
                    GL06,   8, 
                    GL07,   8, 
                    Offset (0x40), 
                    GU08,   8, 
                    GU09,   8, 
                    GU0A,   8, 
                    GU0B,   8, 
                        ,   5, 
                    GI69,   1, 
                        ,   1, 
                    GI71,   1, 
                    GIO9,   8, 
                    GIOA,   8, 
                    GIOB,   8, 
                        ,   5, 
                    GL69,   1, 
                        ,   1, 
                    GL71,   1, 
                    GL09,   8, 
                    GL0A,   8, 
                    GL0B,   8
                }

                OperationRegion (RCRB, SystemMemory, 0xFED1C000, 0x4000)
                Field (RCRB, DWordAcc, Lock, Preserve)
                {
                    Offset (0x1A8), 
                    APMC,   2, 
                    Offset (0x1000), 
                    Offset (0x3000), 
                    Offset (0x3404), 
                    HPAS,   2, 
                        ,   5, 
                    HPAE,   1, 
                    Offset (0x3418), 
                        ,   1, 
                        ,   1, 
                    SATD,   1, 
                    SMBD,   1, 
                    HDAD,   1, 
                    Offset (0x341A), 
                    RP1D,   1, 
                    RP2D,   1, 
                    RP3D,   1, 
                    RP4D,   1, 
                    RP5D,   1, 
                    RP6D,   1, 
                    RP7D,   1, 
                    RP8D,   1
                }

                Method (GETP, 1, Serialized)
                {
                    If (LEqual (And (Arg0, 0x09), 0x00))
                    {
                        Return (0xFFFFFFFF)
                    }

                    If (LEqual (And (Arg0, 0x09), 0x08))
                    {
                        Return (0x0384)
                    }

                    ShiftRight (And (Arg0, 0x0300), 0x08, Local0)
                    ShiftRight (And (Arg0, 0x3000), 0x0C, Local1)
                    Return (Multiply (0x1E, Subtract (0x09, Add (Local0, Local1))
                        ))
                }

                Method (GDMA, 5, Serialized)
                {
                    If (Arg0)
                    {
                        If (LAnd (Arg1, Arg4))
                        {
                            Return (0x14)
                        }

                        If (LAnd (Arg2, Arg4))
                        {
                            Return (Multiply (Subtract (0x04, Arg3), 0x0F))
                        }

                        Return (Multiply (Subtract (0x04, Arg3), 0x1E))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (GETT, 1, Serialized)
                {
                    Return (Multiply (0x1E, Subtract (0x09, Add (And (ShiftRight (Arg0, 0x02
                        ), 0x03), And (Arg0, 0x03)))))
                }

                Method (GETF, 3, Serialized)
                {
                    Name (TMPF, 0x00)
                    If (Arg0)
                    {
                        Or (TMPF, 0x01, TMPF) /* \GETF.TMPF */
                    }

                    If (And (Arg2, 0x02))
                    {
                        Or (TMPF, 0x02, TMPF) /* \GETF.TMPF */
                    }

                    If (Arg1)
                    {
                        Or (TMPF, 0x04, TMPF) /* \GETF.TMPF */
                    }

                    If (And (Arg2, 0x20))
                    {
                        Or (TMPF, 0x08, TMPF) /* \GETF.TMPF */
                    }

                    If (And (Arg2, 0x4000))
                    {
                        Or (TMPF, 0x10, TMPF) /* \GETF.TMPF */
                    }

                    Return (TMPF) /* \GETF.TMPF */
                }

                Method (SETP, 3, Serialized)
                {
                    If (LGreater (Arg0, 0xF0))
                    {
                        Return (0x08)
                    }
                    Else
                    {
                        If (And (Arg1, 0x02))
                        {
                            If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                            {
                                Return (0x2301)
                            }

                            If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                            {
                                Return (0x2101)
                            }
                        }

                        Return (0x1001)
                    }
                }

                Method (SDMA, 1, Serialized)
                {
                    If (LLessEqual (Arg0, 0x14))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x1E))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x2D))
                    {
                        Return (0x01)
                    }

                    If (LLessEqual (Arg0, 0x3C))
                    {
                        Return (0x02)
                    }

                    If (LLessEqual (Arg0, 0x5A))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SETT, 3, Serialized)
                {
                    If (And (Arg1, 0x02))
                    {
                        If (LAnd (LLessEqual (Arg0, 0x78), And (Arg2, 0x02)))
                        {
                            Return (0x0B)
                        }

                        If (LAnd (LLessEqual (Arg0, 0xB4), And (Arg2, 0x01)))
                        {
                            Return (0x09)
                        }
                    }

                    Return (0x04)
                }
            }

            Device (LANC)
            {
                Name (_ADR, 0x00190000)  // _ADR: Address
                Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                {
                    Store (Package (0x02)
                        {
                            0x0D, 
                            0x05
                        }, Local0)
                    If (WOLD)
                    {
                        Store (0x00, Index (Local0, 0x01))
                    }

                    Return (Local0)
                }
            }

            Device (HDEF)
            {
                Name (_ADR, 0x001B0000)  // _ADR: Address
                OperationRegion (HDAR, PCI_Config, 0x4C, 0x10)
                Field (HDAR, WordAcc, NoLock, Preserve)
                {
                    DCKA,   1, 
                    Offset (0x01), 
                    DCKM,   1, 
                        ,   6, 
                    DCKS,   1, 
                    Offset (0x08), 
                        ,   15, 
                    PMES,   1
                }
            }

            Device (EHC1)
            {
                Name (_ADR, 0x001D0000)  // _ADR: Address
                OperationRegion (EHCX, PCI_Config, 0x54, 0x30)
                Field (EHCX, AnyAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1, 
                    Offset (0x0E), 
                    PIMP,   1, 
                    PMSK,   8, 
                    Offset (0x2E), 
                        ,   1, 
                    RMH1,   1
                }

                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LAnd (LEqual (Arg0, 0x02), LEqual (Arg1, 0x01)))
                    {
                        Store (0x01, PMSK) /* \_SB_.PCI0.EHC1.PMSK */
                        Store (0x01, PIMP) /* \_SB_.PCI0.EHC1.PIMP */
                    }
                }

                Device (RHUB)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Device (PRT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                    }

                    Device (PRT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (UPRW (0x0D, 0x03))
                }

                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S4D, 0x03)  // _S4D: S4 Device State
                Scope (RHUB.PRT0)
                {
                    Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                    {
                        Return (EUPC) /* \EUPC */
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Device (HPT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                    }

                    Device (HPT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (HPT2)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                    }

                    Device (HPT3)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                    }

                    Device (HPT4)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_EJD, 0, NotSerialized)  // _EJD: Ejection Dependent Device
                        {
                            Return ("\\_SB.PCI0.RP02.ECF0")
                        }
                    }

                    Device (HPT5)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }

                    Device (HPT6)
                    {
                        Name (_ADR, 0x07)  // _ADR: Address
                    }

                    Device (HPT7)
                    {
                        Name (_ADR, 0x08)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }
                }
            }

            Device (EHC2)
            {
                Name (_ADR, 0x001A0000)  // _ADR: Address
                OperationRegion (EHCX, PCI_Config, 0x54, 0x30)
                Field (EHCX, AnyAcc, NoLock, Preserve)
                {
                        ,   15, 
                    PMES,   1, 
                    Offset (0x0E), 
                    PIMP,   1, 
                    PMSK,   8, 
                    Offset (0x2E), 
                        ,   1, 
                    RMH1,   1
                }

                Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                {
                    If (LAnd (LEqual (Arg0, 0x02), LEqual (Arg1, 0x01)))
                    {
                        Store (0x01, PMSK) /* \_SB_.PCI0.EHC2.PMSK */
                        Store (0x01, PIMP) /* \_SB_.PCI0.EHC2.PIMP */
                    }
                }

                Device (RHUB)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Device (PRT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                    }

                    Device (PRT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (UPRW (0x0D, 0x03))
                }

                Name (_S3D, 0x02)  // _S3D: S3 Device State
                Name (_S4D, 0x03)  // _S4D: S4 Device State
                Scope (RHUB.PRT0)
                {
                    Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                    {
                        Return (EUPC) /* \EUPC */
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Device (HPT0)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }

                    Device (HPT1)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                    }

                    Device (HPT2)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
                        {
                            If (\XOSI ("Windows 2012"))
                            {
                                Return (Package (0x04)
                                {
                                    0x00, 
                                    0xFF, 
                                    0x00, 
                                    0x00
                                })
                            }
                            Else
                            {
                                Return (EUPC) /* \EUPC */
                            }
                        }

                        Device (CAM0)
                        {
                            Name (_ADR, 0x03)  // _ADR: Address
                            Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x25, 0x1D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                    /*           Revision : 02     */
                                    /*        IgnoreColor : 01     */
                                    /*              Color : 000000 */
                                    /*              Width : 0000   */
                                    /*             Height : 0000   */
                                    /*        UserVisible : 01     */
                                    /*               Dock : 00     */
                                    /*                Lid : 01     */
                                    /*              Panel : 04     */
                                    /*   VerticalPosition : 00     */
                                    /* HorizontalPosition : 01     */
                                    /*              Shape : 07     */
                                    /*   GroupOrientation : 00     */
                                    /*         GroupToken : 00     */
                                    /*      GroupPosition : 00     */
                                    /*                Bay : 00     */
                                    /*          Ejectable : 00     */
                                    /*  OspmEjectRequired : 00     */
                                    /*      CabinetNumber : 00     */
                                    /*     CardCageNumber : 00     */
                                    /*          Reference : 00     */
                                    /*           Rotation : 00     */
                                    /*              Order : 00     */
                                    /*     VerticalOffset : FFFF   */
                                    /*   HorizontalOffset : FFFF   */
                                }
                            })
                        }

                        Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
                        {
                            If (\XOSI ("Windows 2012"))
                            {
                                Return (Package (0x00) {})
                            }
                            Else
                            {
                                Return (EPLD) /* \EPLD */
                            }
                        }
                    }

                    Device (HPT3)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                    }

                    Device (HPT4)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Return (EUPC) /* \EUPC */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Return (EPLD) /* \EPLD */
                        }
                    }

                    Device (HPT5)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                    }
                }
            }

            Device (XHC)
            {
                Name (_ADR, 0x00140000)  // _ADR: Address
                OperationRegion (XPRT, PCI_Config, 0x74, 0x6C)
                Field (XPRT, DWordAcc, NoLock, Preserve)
                {
                    Offset (0x01), 
                    PMEE,   1, 
                        ,   6, 
                    PMES,   1, 
                    Offset (0x5C), 
                    PR2,    32, 
                    PR2M,   32, 
                    PR3,    32, 
                    PR3M,   32
                }

                Name (XRST, Zero)
                Method (CUID, 1, Serialized)
                {
                    If (LEqual (Arg0, Buffer (0x10)
                            {
                                /* 0000 */   0xA9, 0x12, 0x95, 0x7C, 0x05, 0x17, 0xB4, 0x4C,
                                /* 0008 */   0xAF, 0x7D, 0x50, 0x6A, 0x24, 0x23, 0xAB, 0x71
                            }))
                    {
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (POSC, 3, Serialized)
                {
                    CreateDWordField (Arg2, 0x00, CDW1)
                    CreateDWordField (Arg2, 0x08, CDW3)
                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1) /* \_SB_.PCI0.XHC_.POSC.CDW1 */
                    }

                    If (LEqual (XHCI, 0x00))
                    {
                        Or (CDW1, 0x02, CDW1) /* \_SB_.PCI0.XHC_.POSC.CDW1 */
                    }

                    If (LNot (And (CDW1, 0x01)))
                    {
                        If (And (CDW3, 0x01))
                        {
                            ESEL ()
                        }
                        Else
                        {
                            XSEL ()
                        }
                    }

                    Return (Arg2)
                }

                Method (XSEL, 0, Serialized)
                {
                    If (LOr (LEqual (XHCI, 0x02), LEqual (XHCI, 0x03)))
                    {
                        Store (0x01, XUSB) /* \_SB_.XUSB */
                        Store (0x01, XRST) /* \_SB_.PCI0.XHC_.XRST */
                        Store (0x00, Local0)
                        And (PR3, 0xFFFFFFF0, Local0)
                        Or (Local0, XHPM, Local0)
                        And (Local0, PR3M, PR3) /* \_SB_.PCI0.XHC_.PR3_ */
                        Store (0x00, Local0)
                        And (PR2, 0xFFFFFFF0, Local0)
                        Or (Local0, XHPM, Local0)
                        And (Local0, PR2M, PR2) /* \_SB_.PCI0.XHC_.PR2_ */
                    }
                }

                Method (ESEL, 0, Serialized)
                {
                    If (LOr (LEqual (XHCI, 0x02), LEqual (XHCI, 0x03)))
                    {
                        And (PR3, 0xFFFFFFF0, PR3) /* \_SB_.PCI0.XHC_.PR3_ */
                        And (PR2, 0xFFFFFFF0, PR2) /* \_SB_.PCI0.XHC_.PR2_ */
                        Store (0x00, XUSB) /* \_SB_.XUSB */
                        Store (0x00, XRST) /* \_SB_.PCI0.XHC_.XRST */
                    }
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (UPRW (0x0D, 0x03))
                }

                Method (XWAK, 0, Serialized)
                {
                    If (LOr (LEqual (XUSB, 0x01), LEqual (XRST, 0x01)))
                    {
                        XSEL ()
                    }
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x02)
                }

                Method (_S4D, 0, NotSerialized)  // _S4D: S4 Device State
                {
                    Return (0x02)
                }

                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (HSP1)
                    {
                        Name (_ADR, 0x01)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x01)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP1._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x01)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP1._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP1._PLD.PLDP */
                        }
                    }

                    Device (HSP2)
                    {
                        Name (_ADR, 0x02)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x02)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP2._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x02)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP2._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP2._PLD.PLDP */
                        }
                    }

                    Device (HSP3)
                    {
                        Name (_ADR, 0x03)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x04)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP3._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x04)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP3._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP3._PLD.PLDP */
                        }
                    }

                    Device (HSP4)
                    {
                        Name (_ADR, 0x04)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR2, 0x08)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.HSP4._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR2, 0x08)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.HSP4._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.HSP4._PLD.PLDP */
                        }
                    }

                    Device (SSP1)
                    {
                        Name (_ADR, 0x05)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x01)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP1._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x01)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP1._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP1._PLD.PLDP */
                        }
                    }

                    Device (SSP2)
                    {
                        Name (_ADR, 0x06)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x02)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP2._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x02)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP2._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP2._PLD.PLDP */
                        }
                    }

                    Device (SSP3)
                    {
                        Name (_ADR, 0x07)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x04)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP3._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x04)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP3._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP3._PLD.PLDP */
                        }
                    }

                    Device (SSP4)
                    {
                        Name (_ADR, 0x08)  // _ADR: Address
                        Method (_UPC, 0, Serialized)  // _UPC: USB Port Capabilities
                        {
                            Name (UPCP, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                0x00, 
                                0x00
                            })
                            If (LNot (And (PR3, 0x08)))
                            {
                                Store (0x00, Index (UPCP, 0x00))
                            }

                            Return (UPCP) /* \_SB_.PCI0.XHC_.RHUB.SSP4._UPC.UPCP */
                        }

                        Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                        {
                            Name (PLDP, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x01, 0xC6, 0x72, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x69, 0x0C, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            CreateBitField (DerefOf (Index (PLDP, 0x00)), 0x40, VIS)
                            If (LNot (And (PR3, 0x08)))
                            {
                                And (VIS, 0x00, VIS) /* \_SB_.PCI0.XHC_.RHUB.SSP4._PLD.VIS_ */
                            }

                            Return (PLDP) /* \_SB_.PCI0.XHC_.RHUB.SSP4._PLD.PLDP */
                        }
                    }
                }
            }

            Device (PCIB)
            {
                Name (_ADR, 0x001E0000)  // _ADR: Address
                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x0B, 
                    0x05
                })
            }

            Device (LPCB)
            {
                Name (_ADR, 0x001F0000)  // _ADR: Address
                Scope (\_SB)
                {
                    OperationRegion (\_SB.PCI0.LPCB.LPC1, PCI_Config, 0x40, 0xC0)
                    Field (\_SB.PCI0.LPCB.LPC1, AnyAcc, NoLock, Preserve)
                    {
                        Offset (0x20), 
                        PARC,   8, 
                        PBRC,   8, 
                        PCRC,   8, 
                        PDRC,   8, 
                        Offset (0x28), 
                        PERC,   8, 
                        PFRC,   8, 
                        PGRC,   8, 
                        PHRC,   8, 
                        Offset (0x6C), 
                        Offset (0x6D), 
                        Offset (0x6E), 
                        XUSB,   1
                    }

                    Device (LNKA)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x01)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PARC, 0x80, PARC) /* \_SB_.PARC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLA, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y16)
                                    {}
                            })
                            CreateWordField (RTLA, \_SB.LNKA._CRS._Y16._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKA._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PARC, 0x0F), IRQ0) /* \_SB_.LNKA._CRS.IRQ0 */
                            Return (RTLA) /* \_SB_.LNKA._CRS.RTLA */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PARC) /* \_SB_.PARC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PARC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKB)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x02)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PBRC, 0x80, PBRC) /* \_SB_.PBRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLB, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y17)
                                    {}
                            })
                            CreateWordField (RTLB, \_SB.LNKB._CRS._Y17._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKB._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PBRC, 0x0F), IRQ0) /* \_SB_.LNKB._CRS.IRQ0 */
                            Return (RTLB) /* \_SB_.LNKB._CRS.RTLB */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PBRC) /* \_SB_.PBRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PBRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKC)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x03)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PCRC, 0x80, PCRC) /* \_SB_.PCRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLC, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y18)
                                    {}
                            })
                            CreateWordField (RTLC, \_SB.LNKC._CRS._Y18._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKC._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PCRC, 0x0F), IRQ0) /* \_SB_.LNKC._CRS.IRQ0 */
                            Return (RTLC) /* \_SB_.LNKC._CRS.RTLC */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PCRC) /* \_SB_.PCRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PCRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKD)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x04)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PDRC, 0x80, PDRC) /* \_SB_.PDRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLD, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y19)
                                    {}
                            })
                            CreateWordField (RTLD, \_SB.LNKD._CRS._Y19._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKD._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PDRC, 0x0F), IRQ0) /* \_SB_.LNKD._CRS.IRQ0 */
                            Return (RTLD) /* \_SB_.LNKD._CRS.RTLD */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PDRC) /* \_SB_.PDRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PDRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKE)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x05)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PERC, 0x80, PERC) /* \_SB_.PERC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLE, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1A)
                                    {}
                            })
                            CreateWordField (RTLE, \_SB.LNKE._CRS._Y1A._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKE._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PERC, 0x0F), IRQ0) /* \_SB_.LNKE._CRS.IRQ0 */
                            Return (RTLE) /* \_SB_.LNKE._CRS.RTLE */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PERC) /* \_SB_.PERC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PERC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKF)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x06)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PFRC, 0x80, PFRC) /* \_SB_.PFRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLF, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1B)
                                    {}
                            })
                            CreateWordField (RTLF, \_SB.LNKF._CRS._Y1B._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKF._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PFRC, 0x0F), IRQ0) /* \_SB_.LNKF._CRS.IRQ0 */
                            Return (RTLF) /* \_SB_.LNKF._CRS.RTLF */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PFRC) /* \_SB_.PFRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PFRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKG)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x07)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PGRC, 0x80, PGRC) /* \_SB_.PGRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLG, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1C)
                                    {}
                            })
                            CreateWordField (RTLG, \_SB.LNKG._CRS._Y1C._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKG._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PGRC, 0x0F), IRQ0) /* \_SB_.LNKG._CRS.IRQ0 */
                            Return (RTLG) /* \_SB_.LNKG._CRS.RTLG */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PGRC) /* \_SB_.PGRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PGRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }

                    Device (LNKH)
                    {
                        Name (_HID, EisaId ("PNP0C0F"))  // _HID: Hardware ID
                        Name (_UID, 0x08)  // _UID: Unique ID
                        Method (_DIS, 0, Serialized)  // _DIS: Disable Device
                        {
                            Or (PHRC, 0x80, PHRC) /* \_SB_.PHRC */
                        }

                        Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                        {
                            IRQ (Level, ActiveLow, Shared, )
                                {3,4,5,6,10,11,12,14,15}
                        })
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (RTLH, ResourceTemplate ()
                            {
                                IRQ (Level, ActiveLow, Shared, _Y1D)
                                    {}
                            })
                            CreateWordField (RTLH, \_SB.LNKH._CRS._Y1D._INT, IRQ0)  // _INT: Interrupts
                            Store (Zero, IRQ0) /* \_SB_.LNKH._CRS.IRQ0 */
                            ShiftLeft (0x01, And (PHRC, 0x0F), IRQ0) /* \_SB_.LNKH._CRS.IRQ0 */
                            Return (RTLH) /* \_SB_.LNKH._CRS.RTLH */
                        }

                        Method (_SRS, 1, Serialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x01, IRQ0)
                            FindSetRightBit (IRQ0, Local0)
                            Decrement (Local0)
                            Store (Local0, PHRC) /* \_SB_.PHRC */
                        }

                        Method (_STA, 0, Serialized)  // _STA: Status
                        {
                            If (And (PHRC, 0x80))
                            {
                                Return (0x09)
                            }
                            Else
                            {
                                Return (0x0B)
                            }
                        }
                    }
                }

                OperationRegion (LPC0, PCI_Config, 0x40, 0xC0)
                Field (LPC0, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x40), 
                    IOD0,   8, 
                    IOD1,   8, 
                    Offset (0xB0), 
                    RAEN,   1, 
                        ,   13, 
                    RCBA,   18
                }

                Device (EC0)
                {
                    Name (_HID, EisaId ("PNP0C09"))  // _HID: Hardware ID
                    Name (_UID, 0x01)  // _UID: Unique ID
                    Name (_GPE, 0x16)  // _GPE: General Purpose Events
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0062,             // Range Minimum
                            0x0062,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0066,             // Range Minimum
                            0x0066,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                    Mutex (ECMX, 0x00)
                    Name (ECRG, 0x00)
                    Name (HSWK, 0x00)
                    Method (ECRI, 0, Serialized)
                    {
                        Store (\WCOS (), OST) /* \_SB_.PCI0.LPCB.EC0_.OST_ */
                        PWUP (0x07, 0xFF)
                        Store (GBAP (), Local0)
                        ITLB ()
                        SBTN (Local0, 0x81)
                        PRIT ()
                    }

                    Method (_REG, 2, NotSerialized)  // _REG: Region Availability
                    {
                        If (LEqual (Arg0, 0x03))
                        {
                            Store (Arg1, ECRG) /* \_SB_.PCI0.LPCB.EC0_.ECRG */
                            Store (LOr (LEqual (\WCOS (), 0x01), LEqual (\WCOS (), 0x02)), Local1)
                            If (LAnd (Arg1, LNot (Local1)))
                            {
                                ECRI ()
                            }
                        }
                    }

                    OperationRegion (ECRM, EmbeddedControl, 0x00, 0xFF)
                    Field (ECRM, ByteAcc, NoLock, Preserve)
                    {
                        PMCD,   32, 
                        S0FL,   8, 
                        SXF0,   8, 
                        SXF1,   8, 
                        CPWR,   16, 
                        CVLT,   16, 
                        CCUR,   16, 
                        DIDX,   8, 
                        CIDX,   8, 
                        PMCC,   8, 
                        PMEP,   8, 
                        Offset (0x22), 
                        CRZN,   8, 
                        THTA,   8, 
                        HYST,   8, 
                        CRIT,   8, 
                        TEMP,   8, 
                        TENA,   8, 
                        Offset (0x29), 
                        TOAD,   8, 
                        PHTP,   8, 
                        THEM,   8, 
                        TMPO,   8, 
                        Offset (0x2E), 
                        FRDC,   8, 
                        FTGC,   8, 
                        PLTP,   8, 
                        Offset (0x32), 
                        DTMP,   8, 
                        Offset (0x35), 
                        PL1,    8, 
                        PL2,    8, 
                        BCVD,   8, 
                        Offset (0x40), 
                        ABDI,   8, 
                        ABAD,   8, 
                        ABIX,   8, 
                        ABDA,   8, 
                        ABST,   8, 
                        PORI,   8, 
                        Offset (0x4C), 
                        PSSB,   8, 
                        Offset (0x80), 
                        Offset (0x81), 
                            ,   4, 
                        SLPT,   4, 
                        FNSW,   1, 
                        SFNC,   1, 
                        ACPI,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        DETF,   1, 
                        LIDS,   1, 
                        TBLT,   1, 
                            ,   1, 
                            ,   1, 
                            ,   1, 
                        COMM,   1, 
                        PME,    1, 
                        SBVD,   1, 
                        ADP,    1, 
                        ADID,   2, 
                        LCTV,   1, 
                        BATP,   4, 
                        BPU,    1, 
                        Offset (0x86), 
                        BSEL,   4, 
                        Offset (0x87), 
                        LB1,    8, 
                        LB2,    8, 
                        BDC,    16, 
                        Offset (0x8D), 
                        BFC,    16, 
                        BRTE,   16, 
                        BTC,    1, 
                        Offset (0x92), 
                        BME,    16, 
                        BDN,    8, 
                        BDV,    16, 
                        BCV1,   16, 
                        BST,    4, 
                        Offset (0x9B), 
                        BATE,   16, 
                        BPR,    16, 
                        BCR,    16, 
                        BRC,    16, 
                        BCC,    16, 
                        BPV,    16, 
                        BCV2,   16, 
                        BCV3,   16, 
                        BCV4,   16, 
                        BCW,    16, 
                        BATF,   16, 
                        BCL,    16, 
                        MAXC,   16, 
                        BCG1,   8, 
                        BT1I,   1, 
                        BT2I,   1, 
                            ,   2, 
                        BATN,   4, 
                        BSTS,   16, 
                        BCG2,   8, 
                        Offset (0xBD), 
                        BMO,    8, 
                        Offset (0xBF), 
                        BRCV,   8, 
                        Offset (0xC1), 
                        BIF,    8, 
                        BRCC,   8, 
                        Offset (0xC9), 
                        BSN,    16, 
                        BDAT,   16, 
                        BMF,    8, 
                        Offset (0xCF), 
                        CTLB,   8, 
                        Offset (0xD1), 
                        BTY,    8, 
                        Offset (0xD5), 
                        MFAC,   8, 
                        CFAN,   8, 
                        PFAN,   8, 
                        OCPS,   8, 
                        OCPR,   8, 
                        OCPE,   8, 
                        TMP1,   8, 
                        TMP2,   8, 
                        NABT,   4, 
                        BCM,    4, 
                        CCBQ,   16, 
                        CBT,    16, 
                        Offset (0xE3), 
                        OST,    4, 
                        Offset (0xE4), 
                        Offset (0xE5), 
                        TPTE,   1, 
                        TBBN,   1, 
                            ,   3, 
                        TP,     1, 
                        Offset (0xE6), 
                        SHK,    8, 
                        AUDS,   1, 
                        SPKR,   1, 
                        Offset (0xE8), 
                        HSEN,   4, 
                        HSST,   4, 
                        Offset (0xEA), 
                            ,   2, 
                        WWP,    1, 
                        WLP,    1, 
                        Offset (0xEC), 
                            ,   7, 
                        TBOS,   1, 
                        Offset (0xEF), 
                        INCH,   2, 
                        IDIS,   2, 
                        INAC,   1
                    }

                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        If (LOr (LEqual (\WCOS (), 0x01), LEqual (\WCOS (), 0x02)))
                        {
                            ECRI ()
                        }
                    }

                    OperationRegion (MAIO, SystemIO, 0x0200, 0x02)
                    Field (MAIO, ByteAcc, NoLock, Preserve)
                    {
                        MAIN,   8, 
                        MADT,   8
                    }

                    IndexField (MAIN, MADT, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x8C), 
                            ,   7, 
                        CLID,   1, 
                        Offset (0x95), 
                        PWM0,   8, 
                        Offset (0x9D), 
                        PWMC,   8
                    }

                    Method (KFCL, 2, NotSerialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg1, MFAC) /* \_SB_.PCI0.LPCB.EC0_.MFAC */
                            If (LAnd (LGreaterEqual (Arg0, 0x00), LLessEqual (Arg0, 0x64)))
                            {
                                Store (Arg0, CFAN) /* \_SB_.PCI0.LPCB.EC0_.CFAN */
                            }
                        }

                        Release (ECMX)
                    }

                    Method (KSFS, 1, NotSerialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, CFAN) /* \_SB_.PCI0.LPCB.EC0_.CFAN */
                        }

                        Release (ECMX)
                    }

                    Method (KGFS, 0, NotSerialized)
                    {
                        Store (0x14, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (CFAN, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (KRFS, 0, NotSerialized)
                    {
                        Store (0x1E, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (PFAN, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (SFSD, 1, Serialized)
                    {
                        Multiply (Arg0, 0x40, Local1)
                        Divide (Local1, 0x64, Local2, Local0)
                        Subtract (0x40, Local0, Local0)
                        And (PWM0, 0x80, Local1)
                        If (LEqual (Local0, 0x40))
                        {
                            Or (Local1, 0x01, Local1)
                        }
                        Else
                        {
                            ShiftLeft (Local0, 0x01, Local0)
                            Or (Local0, Local1, Local1)
                        }

                        Store (Local1, PWM0) /* \_SB_.PCI0.LPCB.EC0_.PWM0 */
                    }

                    Method (GFSD, 0, Serialized)
                    {
                        And (PWM0, 0x7F, Local0)
                        If (And (Local0, 0x01))
                        {
                            Store (0x00, Local1)
                        }
                        Else
                        {
                            ShiftRight (Local0, 0x01, Local0)
                            Subtract (0x40, Local0, Local0)
                            Multiply (Local0, 0x64, Local0)
                            Divide (Add (Local0, 0x20), 0x40, Local2, Local1)
                            Increment (Local1)
                        }

                        Return (Local1)
                    }

                    Method (GSHK, 0, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (SHK, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (SSHK, 1, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, Debug)
                            Store (Arg0, SHK) /* \_SB_.PCI0.LPCB.EC0_.SHK_ */
                        }

                        Release (ECMX)
                    }

                    Method (SAST, 1, Serialized)
                    {
                        Store (0x00, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, AUDS) /* \_SB_.PCI0.LPCB.EC0_.AUDS */
                            Store (0x01, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (HSPW, 2, Serialized)
                    {
                        If (HSED)
                        {
                            Store (HSWK, Local0)
                            If (Arg0)
                            {
                                Or (Local0, Arg1, HSWK) /* \_SB_.PCI0.LPCB.EC0_.HSWK */
                            }
                            Else
                            {
                                And (Local0, Not (Arg1), HSWK) /* \_SB_.PCI0.LPCB.EC0_.HSWK */
                            }
                        }
                        Else
                        {
                            Store (0x00, HSWK) /* \_SB_.PCI0.LPCB.EC0_.HSWK */
                        }
                    }

                    Method (UHSW, 0, Serialized)
                    {
                    }

                    Method (CHSW, 1, Serialized)
                    {
                        Store (0x00, Local1)
                        Return (Local1)
                    }

                    Method (SHSW, 2, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            If (Arg1)
                            {
                                Or (HSEN, Arg0, HSEN) /* \_SB_.PCI0.LPCB.EC0_.HSEN */
                            }
                            Else
                            {
                                And (HSEN, Not (Arg0), HSEN) /* \_SB_.PCI0.LPCB.EC0_.HSEN */
                            }
                        }

                        Release (ECMX)
                    }

                    Method (HWLP, 1, NotSerialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            XOr (Arg0, 0x00, WLP) /* \_SB_.PCI0.LPCB.EC0_.WLP_ */
                        }

                        Release (ECMX)
                    }

                    Method (HWWP, 1, Serialized)
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            If (LAnd (And (WWIX, 0x80), LEqual (Arg0, 0x00)))
                            {
                                Sleep (0x1388)
                            }

                            XOr (And (Arg0, 0x01), 0x01, WWP) /* \_SB_.PCI0.LPCB.EC0_.WWP_ */
                        }

                        Release (ECMX)
                    }

                    Method (ECAB, 4, Serialized)
                    {
                        Store (0xECAB, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (0xFF00, Local0)
                            Store (Arg0, ABDI) /* \_SB_.PCI0.LPCB.EC0_.ABDI */
                            Store (Arg1, ABAD) /* \_SB_.PCI0.LPCB.EC0_.ABAD */
                            Store (Arg2, ABIX) /* \_SB_.PCI0.LPCB.EC0_.ABIX */
                            If (LEqual (And (Arg1, 0x01), 0x00))
                            {
                                Store (Arg3, ABDA) /* \_SB_.PCI0.LPCB.EC0_.ABDA */
                            }

                            Store (0xFF, ABST) /* \_SB_.PCI0.LPCB.EC0_.ABST */
                            Sleep (0x5A)
                            Store (0x80, Local0)
                            Store (0x0B, Local1)
                            While (LAnd (And (Local0, 0x80), LGreater (Local1, 0x00)))
                            {
                                Sleep (0x0A)
                                Store (ABST, Local0)
                                Decrement (Local1)
                            }

                            ShiftLeft (Local0, 0x08, Local0)
                            If (LAnd (LEqual (Local0, 0x00), And (Arg1, 0x01)))
                            {
                                And (ABDA, 0xFF, Local1)
                                Or (Local0, Local1, Local0)
                            }
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Name (NGBF, 0xFF)
                    Name (NGBT, 0xFF)
                    Name (GACP, 0x07)
                    Name (ACST, 0x01)
                    Name (SMAR, 0x00)
                    Name (NBAP, 0x00)
                    Name (NNBO, 0x01)
                    Name (NDCB, 0x00)
                    Name (NLB1, 0xC8)
                    Name (NLB2, 0x64)
                    Mutex (BTMX, 0x00)
                    Method (UPAD, 0, Serialized)
                    {
                        Acquire (BTMX, 0xFFFF)
                        If (And (GACP, 0x01))
                        {
                            And (GACP, 0x06, GACP) /* \_SB_.PCI0.LPCB.EC0_.GACP */
                            Release (BTMX)
                            Store (0x01, Local0)
                            Store (0x00, Local1)
                            Acquire (ECMX, 0xFFFF)
                            If (ECRG)
                            {
                                Store (ADP, Local0)
                                Store (ADID, Local1)
                            }

                            Release (ECMX)
                            Store (Local0, ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                            If (And (DTCD, 0x0800))
                            {
                                If (And (DTCD, 0x1000))
                                {
                                    Store (0x00, ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                                }
                                Else
                                {
                                    Store (0x01, ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                                }
                            }

                            Store (Local1, SMAR) /* \_SB_.PCI0.LPCB.EC0_.SMAR */
                        }
                        Else
                        {
                            Release (BTMX)
                        }
                    }

                    Method (GACS, 0, Serialized)
                    {
                        UPAD ()
                        Return (ACST) /* \_SB_.PCI0.LPCB.EC0_.ACST */
                    }

                    Method (GPID, 0, Serialized)
                    {
                        UPAD ()
                        Return (SMAR) /* \_SB_.PCI0.LPCB.EC0_.SMAR */
                    }

                    Method (GBAP, 0, Serialized)
                    {
                        Acquire (BTMX, 0xFFFF)
                        If (And (GACP, 0x02))
                        {
                            And (GACP, 0x05, GACP) /* \_SB_.PCI0.LPCB.EC0_.GACP */
                            Release (BTMX)
                            Acquire (ECMX, 0xFFFF)
                            If (ECRG)
                            {
                                Store (BATP, NBAP) /* \_SB_.PCI0.LPCB.EC0_.NBAP */
                            }

                            Release (ECMX)
                        }
                        Else
                        {
                            Release (BTMX)
                        }

                        Return (NBAP) /* \_SB_.PCI0.LPCB.EC0_.NBAP */
                    }

                    Method (PWUP, 2, Serialized)
                    {
                        Store (0x00, Local0)
                        Acquire (BTMX, 0xFFFF)
                        Or (Arg0, GACP, Local1)
                        And (Local1, 0x07, GACP) /* \_SB_.PCI0.LPCB.EC0_.GACP */
                        If (And (GACP, 0x02))
                        {
                            Or (NGBF, Arg1, NGBF) /* \_SB_.PCI0.LPCB.EC0_.NGBF */
                        }

                        If (And (GACP, 0x04))
                        {
                            If (LNotEqual (NGBT, 0xFF))
                            {
                                Store (0x01, Local0)
                            }

                            Or (NGBT, Arg1, NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        }

                        Release (BTMX)
                        Return (Local0)
                    }

                    Method (BTDR, 1, Serialized)
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (0x01, NNBO) /* \_SB_.PCI0.LPCB.EC0_.NNBO */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x00))
                            {
                                Store (0x00, NNBO) /* \_SB_.PCI0.LPCB.EC0_.NNBO */
                            }
                        }

                        Return (NNBO) /* \_SB_.PCI0.LPCB.EC0_.NNBO */
                    }

                    Method (BSTA, 1, Serialized)
                    {
                        BTDR (0x01)
                        Store (GBAP (), Local0)
                        Store (0x0F, Local1)
                        If (And (Local0, Arg0))
                        {
                            Store (0x1F, Local1)
                        }

                        Return (Local1)
                    }

                    Method (GBSS, 2, Serialized)
                    {
                        ToBCD (Arg0, Local0)
                        Store (\ISTR (Local0, 0x05), Local3)
                        Concatenate (Local3, " ", Local4)
                        ShiftRight (Arg1, 0x09, Local0)
                        Add (Local0, 0x07BC, Local1)
                        ToBCD (Local1, Local0)
                        Store (\ISTR (Local0, 0x04), Local2)
                        Concatenate (Local4, Local2, Local3)
                        Concatenate (Local3, "/", Local4)
                        ShiftRight (Arg1, 0x05, Local0)
                        And (Local0, 0x0F, Local1)
                        ToBCD (Local1, Local0)
                        Store (\ISTR (Local0, 0x02), Local2)
                        Concatenate (Local4, Local2, Local3)
                        Concatenate (Local3, "/", Local4)
                        And (Arg1, 0x1F, Local1)
                        ToBCD (Local1, Local0)
                        Store (\ISTR (Local0, 0x02), Local2)
                        Concatenate (Local4, Local2, Local3)
                        Return (Local3)
                    }

                    Method (GBMF, 0, Serialized)
                    {
                        Store (Buffer (0x12) {}, Local0)
                        Store (0x00, Local3)
                        Store (BMF, Local1)
                        While (LAnd (LLess (Local3, 0x10), LNotEqual (Local1, 0x00)))
                        {
                            Store (Local1, Index (Local0, Local3))
                            Increment (Local3)
                            Store (BMF, Local1)
                        }

                        Return (Local0)
                    }

                    Method (GCTL, 1, Serialized)
                    {
                        Name (CTBF, Buffer (0x10) {})
                        Store (0x00, Local3)
                        Store (0x00, Local2)
                        While (LNotEqual (Local3, 0x10))
                        {
                            Store (CTLB, Index (CTBF, Local2))
                            Increment (Local2)
                            Increment (Local3)
                        }

                        Return (CTBF) /* \_SB_.PCI0.LPCB.EC0_.GCTL.CTBF */
                    }

                    Method (GDNM, 1, Serialized)
                    {
                        Name (DNBF, Buffer (0x07) {})
                        Store (0x00, Local3)
                        Store (0x00, Local2)
                        While (LNotEqual (Local3, 0x07))
                        {
                            Store (BDN, Index (DNBF, Local2))
                            Increment (Local2)
                            Increment (Local3)
                        }

                        Return (DNBF) /* \_SB_.PCI0.LPCB.EC0_.GDNM.DNBF */
                    }

                    Method (GDCH, 1, Serialized)
                    {
                        Name (DCBF, Buffer (0x04) {})
                        Store (0x00, Local3)
                        Store (0x00, Local2)
                        While (LNotEqual (Local3, 0x04))
                        {
                            Store (BTY, Index (DCBF, Local2))
                            Increment (Local2)
                            Increment (Local3)
                        }

                        Return (DCBF) /* \_SB_.PCI0.LPCB.EC0_.GDCH.DCBF */
                    }

                    Method (BTIF, 1, Serialized)
                    {
                        ShiftLeft (0x01, Arg0, Local7)
                        BTDR (0x01)
                        If (LEqual (BSTA (Local7), 0x0F))
                        {
                            Return (0xFF)
                        }

                        Acquire (BTMX, 0xFFFF)
                        Store (NGBF, Local0)
                        Release (BTMX)
                        If (LEqual (And (Local0, Local7), 0x00))
                        {
                            Return (0x00)
                        }

                        Store (NDBS, Index (NBST, Arg0))
                        Acquire (BTMX, 0xFFFF)
                        Or (NGBT, Local7, NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        Release (BTMX)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                            Store (BFC, Local0)
                            Store (Local0, Index (DerefOf (Index (NBTI, Arg0)), 0x01))
                            Store (Local0, Index (DerefOf (Index (NBTI, Arg0)), 0x02))
                            Store (BDV, Index (DerefOf (Index (NBTI, Arg0)), 0x04))
                            Store (NLB1, Index (DerefOf (Index (NBTI, Arg0)), 0x05))
                            Store (NLB2, Index (DerefOf (Index (NBTI, Arg0)), 0x06))
                            Store (BSN, Local0)
                            Store (BDAT, Local1)
                        }

                        Release (ECMX)
                        Store (GBSS (Local0, Local1), Local2)
                        Store (Local2, Index (DerefOf (Index (NBTI, Arg0)), 0x0A))
                        Acquire (BTMX, 0xFFFF)
                        And (NGBF, Not (Local7), NGBF) /* \_SB_.PCI0.LPCB.EC0_.NGBF */
                        Release (BTMX)
                        Return (0x00)
                    }

                    Method (BTST, 2, Serialized)
                    {
                        ShiftLeft (0x01, Arg0, Local7)
                        BTDR (0x01)
                        If (LEqual (BSTA (Local7), 0x0F))
                        {
                            Store (Package (0x04)
                                {
                                    0x00, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF
                                }, Index (NBST, Arg0))
                            Return (0xFF)
                        }

                        Acquire (BTMX, 0xFFFF)
                        If (Arg1)
                        {
                            Store (0xFF, NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        }

                        Store (NGBT, Local0)
                        Release (BTMX)
                        If (LEqual (And (Local0, Local7), 0x00))
                        {
                            Return (0x00)
                        }

                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg0, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                            Store (BST, Local0)
                            Store (BPR, Local3)
                            Store (BRC, Index (DerefOf (Index (NBST, Arg0)), 0x02))
                            Store (BPV, Index (DerefOf (Index (NBST, Arg0)), 0x03))
                        }

                        Release (ECMX)
                        If (LEqual (GACS (), 0x01))
                        {
                            And (Not (0x01), Local0, Local0)
                        }
                        Else
                        {
                            And (Not (0x02), Local0, Local0)
                        }

                        If (And (Local0, 0x01))
                        {
                            Acquire (BTMX, 0xFFFF)
                            Store (Local7, NDCB) /* \_SB_.PCI0.LPCB.EC0_.NDCB */
                            Release (BTMX)
                        }

                        Store (Local0, Index (DerefOf (Index (NBST, Arg0)), 0x00))
                        If (And (Local0, 0x01))
                        {
                            If (LOr (LLess (Local3, 0x0190), LGreater (Local3, 0x1964)))
                            {
                                Store (DerefOf (Index (DerefOf (Index (NBST, Arg0)), 0x01)), 
                                    Local5)
                                If (LOr (LLess (Local5, 0x0190), LGreater (Local5, 0x1964)))
                                {
                                    Store (Divide (0x1AF4, 0x02, ), Local3)
                                }
                                Else
                                {
                                    Store (Local5, Local3)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (And (Local0, 0x02), 0x00))
                            {
                                Store (0x00, Local3)
                            }
                        }

                        Store (Local3, Index (DerefOf (Index (NBST, Arg0)), 0x01))
                        Acquire (BTMX, 0xFFFF)
                        And (NGBT, Not (Local7), NGBT) /* \_SB_.PCI0.LPCB.EC0_.NGBT */
                        Release (BTMX)
                        Return (0x00)
                    }

                    Method (ITLB, 0, NotSerialized)
                    {
                        Divide (Add (NLB1, 0x09), 0x0A, Local0, Local1)
                        Divide (Add (0x96, 0x09), 0x0A, Local0, Local2)
                        If (ECRG)
                        {
                            Store (Local1, LB1) /* \_SB_.PCI0.LPCB.EC0_.LB1_ */
                            Store (Local2, LB2) /* \_SB_.PCI0.LPCB.EC0_.LB2_ */
                        }
                    }

                    Method (GBTI, 1, NotSerialized)
                    {
                        Store ("Enter getbattinfo", Debug)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            If (And (BATP, ShiftLeft (0x01, Arg0)))
                            {
                                Store (Arg0, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                                Store (Package (0x03)
                                    {
                                        0x00, 
                                        0x6B, 
                                        Buffer (0x6B) {}
                                    }, Local0)
                                Store (BDC, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                Store (ShiftRight (BDC, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x01))
                                Store (BFC, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                                Store (ShiftRight (BFC, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x03))
                                Store (BRC, Index (DerefOf (Index (Local0, 0x02)), 0x04))
                                Store (ShiftRight (BRC, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x05))
                                Store (BME, Index (DerefOf (Index (Local0, 0x02)), 0x06))
                                Store (ShiftRight (BME, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x07))
                                Store (BCC, Index (DerefOf (Index (Local0, 0x02)), 0x08))
                                Store (ShiftRight (BCC, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x09))
                                Store (CBT, Local1)
                                Subtract (Local1, 0x0AAC, Local1)
                                Divide (Local1, 0x0A, Local2, Local3)
                                Store (Local3, Index (DerefOf (Index (Local0, 0x02)), 0x0A))
                                Store (ShiftRight (Local3, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x0B))
                                Store (BPV, Index (DerefOf (Index (Local0, 0x02)), 0x0C))
                                Store (ShiftRight (BPV, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x0D))
                                Store (BPR, Local1)
                                If (Local1)
                                {
                                    If (And (BSTS, 0x40))
                                    {
                                        Add (Not (Local1), 0x01, Local1)
                                        And (Local1, 0xFFFF, Local1)
                                    }
                                }

                                Store (Local1, Index (DerefOf (Index (Local0, 0x02)), 0x0E))
                                Store (ShiftRight (Local1, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x0F))
                                Store (BDV, Index (DerefOf (Index (Local0, 0x02)), 0x10))
                                Store (ShiftRight (BDV, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x11))
                                Store (BSTS, Index (DerefOf (Index (Local0, 0x02)), 0x12))
                                Store (ShiftRight (BSTS, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x13))
                                Store (BCV1, Index (DerefOf (Index (Local0, 0x02)), 0x14))
                                Store (ShiftRight (BCV1, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x15))
                                Store (BCV2, Index (DerefOf (Index (Local0, 0x02)), 0x16))
                                Store (ShiftRight (BCV2, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x17))
                                Store (BCV3, Index (DerefOf (Index (Local0, 0x02)), 0x18))
                                Store (ShiftRight (BCV3, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x19))
                                Store (BCV4, Index (DerefOf (Index (Local0, 0x02)), 0x1A))
                                Store (ShiftRight (BCV4, 0x08), Index (DerefOf (Index (Local0, 0x02
                                    )), 0x1B))
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (0x1C, 0x08), 
                                    Multiply (0x10, 0x08), BTSN)
                                Store (GBSS (BSN, BDAT), BTSN) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BTSN */
                                Store (GBMF (), Local1)
                                Store (SizeOf (Local1), Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (0x2C, 0x08), 
                                    Multiply (Local2, 0x08), BMAN)
                                Store (Local1, BMAN) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BMAN */
                                Add (Local2, 0x2C, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x10, 0x08), CLBL)
                                Store (GCTL (0x00), CLBL) /* \_SB_.PCI0.LPCB.EC0_.GBTI.CLBL */
                                Add (Local2, 0x11, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x07, 0x08), DNAM)
                                Store (GDNM (0x00), DNAM) /* \_SB_.PCI0.LPCB.EC0_.GBTI.DNAM */
                                Add (Local2, 0x07, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x04, 0x08), DCHE)
                                Store (GDCH (0x00), DCHE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.DCHE */
                                Add (Local2, 0x04, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BMAC)
                                Store (0x00, BMAC) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BMAC */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BMAD)
                                Store (BDAT, BMAD) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BMAD */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BCCU)
                                Store (BRCC, BCCU) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BCCU */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BCVO)
                                Store (BRCV, BCVO) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BCVO */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), BAVC)
                                Store (BCR, Local1)
                                If (Local1)
                                {
                                    If (And (BSTS, 0x40))
                                    {
                                        Add (Not (Local1), 0x01, Local1)
                                        And (Local1, 0xFFFF, Local1)
                                    }
                                }

                                Store (Local1, BAVC) /* \_SB_.PCI0.LPCB.EC0_.GBTI.BAVC */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), RTTE)
                                Store (BRTE, RTTE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.RTTE */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), ATTE)
                                Store (BATE, RTTE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.RTTE */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x02, 0x08), ATTF)
                                Store (BATF, RTTE) /* \_SB_.PCI0.LPCB.EC0_.GBTI.RTTE */
                                Add (Local2, 0x02, Local2)
                                CreateField (DerefOf (Index (Local0, 0x02)), Multiply (Local2, 0x08), 
                                    Multiply (0x01, 0x08), NOBS)
                                Store (BATN, NOBS) /* \_SB_.PCI0.LPCB.EC0_.GBTI.NOBS */
                            }
                            Else
                            {
                                Store (Package (0x02)
                                    {
                                        0x34, 
                                        0x00
                                    }, Local0)
                            }
                        }
                        Else
                        {
                            Store (Package (0x02)
                                {
                                    0x0D, 
                                    0x00
                                }, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (GBTC, 0, NotSerialized)
                    {
                        Store ("Enter GetBatteryControl", Debug)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Package (0x03)
                                {
                                    0x00, 
                                    0x04, 
                                    Buffer (0x04) {}
                                }, Local0)
                            If (And (BATP, 0x01))
                            {
                                Store (0x00, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                                Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                If (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x00)), LEqual (
                                    IDIS, 0x00)))
                                {
                                    Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                }
                                Else
                                {
                                    If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x02)), 
                                        LEqual (IDIS, 0x01)), LEqual (MAXC, 0x00)))
                                    {
                                        Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                    }
                                    Else
                                    {
                                        If (LAnd (LEqual (INAC, 0x01), LEqual (IDIS, 0x02)))
                                        {
                                            Store (0x02, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                        }
                                        Else
                                        {
                                            If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x02)), 
                                                LEqual (IDIS, 0x01)), LEqual (MAXC, 0xFA)))
                                            {
                                                Store (0x03, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                            }
                                            Else
                                            {
                                                If (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x03)))
                                                {
                                                    Store (0x04, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                            }

                            If (And (BATP, 0x02))
                            {
                                Store (0x01, BSEL) /* \_SB_.PCI0.LPCB.EC0_.BSEL */
                                Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                If (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x00)), LEqual (
                                    IDIS, 0x00)))
                                {
                                    Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                }
                                Else
                                {
                                    If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x01)), 
                                        LEqual (IDIS, 0x02)), LEqual (MAXC, 0x00)))
                                    {
                                        Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                    }
                                    Else
                                    {
                                        If (LAnd (LEqual (INAC, 0x01), LEqual (IDIS, 0x01)))
                                        {
                                            Store (0x02, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                        }
                                        Else
                                        {
                                            If (LAnd (LAnd (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x01)), 
                                                LEqual (IDIS, 0x02)), LEqual (MAXC, 0xFA)))
                                            {
                                                Store (0x03, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                            }
                                            Else
                                            {
                                                If (LAnd (LEqual (INAC, 0x00), LEqual (INCH, 0x03)))
                                                {
                                                    Store (0x04, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Else
                            {
                                Store (0xFF, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                            }
                        }
                        Else
                        {
                            Store (Package (0x02)
                                {
                                    0x35, 
                                    0x00
                                }, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (SBTC, 3, NotSerialized)
                    {
                        Store ("Enter SetBatteryControl", Debug)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (Arg2, Local0)
                            Store (Local0, Debug)
                            Store (Package (0x02)
                                {
                                    0x06, 
                                    0x00
                                }, Local4)
                            Store (0x00, Local1)
                            Store (0x00, Local2)
                            Store (DerefOf (Index (Local0, 0x10)), Local1)
                            If (LEqual (Local1, 0x00))
                            {
                                Store ("battery 0", Debug)
                                If (And (BATP, 0x01))
                                {
                                    Store (DerefOf (Index (Local0, 0x11)), Local2)
                                    If (LEqual (Local2, 0x00))
                                    {
                                        Store (0x00, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x00, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x00, MAXC) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x01, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x01))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x02, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x01, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, MAXC) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x02))
                                    {
                                        Store (0x01, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x01, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x02, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x03))
                                    {
                                        Store (0x02, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x01, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0xFA, MAXC) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x04))
                                    {
                                        Store (0xFA, MAXC) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x05))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x03, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }
                                }
                                Else
                                {
                                    Store (Package (0x02)
                                        {
                                            0x34, 
                                            0x00
                                        }, Local4)
                                }
                            }

                            If (LEqual (Local1, 0x01))
                            {
                                If (And (BATP, 0x02))
                                {
                                    Store ("battery 1", Debug)
                                    Store (DerefOf (Index (Local0, 0x11)), Local2)
                                    If (LEqual (Local2, 0x00))
                                    {
                                        Store (0x00, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x00, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x00, MAXC) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x01, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x01))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x01, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x02, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, MAXC) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x02))
                                    {
                                        Store (0x01, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x02, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x01, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x03))
                                    {
                                        Store (0x01, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x02, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0xFA, MAXC) /* \_SB_.PCI0.LPCB.EC0_.MAXC */
                                        Store (0x00, PSSB) /* \_SB_.PCI0.LPCB.EC0_.PSSB */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x04))
                                    {
                                        Store (0x00, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (0x00, IDIS) /* \_SB_.PCI0.LPCB.EC0_.IDIS */
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }

                                    If (LEqual (Local2, 0x05))
                                    {
                                        Store (0x00, INAC) /* \_SB_.PCI0.LPCB.EC0_.INAC */
                                        Store (0x03, INCH) /* \_SB_.PCI0.LPCB.EC0_.INCH */
                                        Store (Package (0x02)
                                            {
                                                0x00, 
                                                0x00
                                            }, Local4)
                                    }
                                }
                                Else
                                {
                                    Store (Package (0x02)
                                        {
                                            0x34, 
                                            0x00
                                        }, Local4)
                                }
                            }
                        }

                        Release (ECMX)
                        Return (Local4)
                    }

                    Mutex (OTMT, 0x00)
                    Name (OTLL, 0x01)
                    Name (OTSI, 0x01)
                    Name (OTRT, 0x00)
                    Name (OTEN, 0x00)
                    Name (LRPC, 0x00)
                    Name (MXCP, 0x00)
                    Name (DCCP, 0x00)
                    Method (_Q03, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (BTMX, 0xFFFF)
                        Store (NDCB, Local0)
                        Release (BTMX)
                        PWUP (0x04, Local0)
                        SBTN (Local0, 0x80)
                    }

                    Method (_Q04, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (OTMT, 0xFFFF)
                        Store (GTST (), OTLL) /* \_SB_.PCI0.LPCB.EC0_.OTLL */
                        Store (0x01, OTSI) /* \_SB_.PCI0.LPCB.EC0_.OTSI */
                        Release (OTMT)
                        If (LNotEqual (RPPC (0x00), 0x00))
                        {
                            PPNT ()
                        }
                    }

                    Method (_Q05, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (THEM, Local0)
                        \_TZ.ECTE (Local0)
                    }

                    Method (_Q06, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x05, Or (0x02, 0x01))
                        If (BTDR (0x02))
                        {
                            Notify (\_SB.AC, 0x80) // Status Change
                        }

                        \_GPE.VBRE (0x00)
                        If (\_SB.PCI0.RP03.PDSX)
                        {
                            If (LEqual (\_SB.PCI0.LPCB.EC0.ADP, One))
                            {
                                Store (0x00, \_SB.PCI0.RP03.SMHC.D3EF)
                            }
                            Else
                            {
                                Store (0x01, \_SB.PCI0.RP03.SMHC.D3EF)
                            }
                        }
                        Else
                        {
                            If (LEqual (\_SB.PCI0.LPCB.EC0.ADP, One))
                            {
                                Store (0x00, GI69) /* \GI69 */
                                Store (0x00, GL69) /* \GL69 */
                                Sleep (0x05)
                                Store (0x01, GL69) /* \GL69 */
                                Store (0x01, GI69) /* \GI69 */
                            }
                        }
                    }

                    Method (_Q08, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x06, 0x01)
                        Store (GBAP (), Local0)
                        If (LNotEqual (Local0, 0x02))
                        {
                            PWUP (0x04, 0x02)
                            If (BTDR (0x02))
                            {
                                Notify (\_SB.BAT1, 0x80) // Status Change
                            }
                        }

                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT0, 0x81) // Information Change
                        }
                    }

                    Method (_Q0A, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (\_GPE.VLET (), Local4)
                        Notify (\_SB.LID, 0x80) // Status Change
                        \_SB.PCI0.ACEL.AJAL ()
                        \_SB.WMID.WGWE (0x08, Add (\_SB.LID._LID (), 0x01))
                    }

                    Method (_Q09, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x04, 0x01)
                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT0, 0x80) // Status Change
                        }
                    }

                    Method (_Q0B, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        \_SB.WMID.WGWE (0x00020000, 0x00)
                    }

                    Method (_Q0C, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (THEM, Local0)
                        \_TZ.ECTE (Local0)
                    }

                    Method (_Q18, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x06, 0x02)
                        Store (GBAP (), Local0)
                        If (LNotEqual (Local0, 0x01))
                        {
                            PWUP (0x04, 0x01)
                            If (BTDR (0x02))
                            {
                                Notify (\_SB.BAT0, 0x80) // Status Change
                            }
                        }

                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT1, 0x81) // Information Change
                        }
                    }

                    Method (_Q19, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        PWUP (0x04, 0x02)
                        If (BTDR (0x02))
                        {
                            Notify (\_SB.BAT1, 0x80) // Status Change
                        }
                    }

                    Method (_Q20, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (And (PSSA, 0x01), Local0)
                            Store (And (PSSB, 0x01), Local1)
                            Store (And (PSSA, 0x02), Local2)
                            Store (And (PSSB, 0x02), Local3)
                            Store (And (PSSA, 0x10), Local4)
                            Store (And (PSSB, 0x10), Local5)
                            If (LAnd (LNotEqual (Local0, Local1), LEqual (Local0, 0x00)))
                            {
                                \_SB.WMID.WGWE (0x0F, 0x00)
                                Store (PSSB, PSSA) /* \PSSA */
                            }
                            Else
                            {
                                If (LAnd (LNotEqual (Local4, Local5), LEqual (Local4, 0x00)))
                                {
                                    \_SB.WMID.WGWE (0x0F, 0x03)
                                    Store (PSSB, PSSA) /* \PSSA */
                                }
                                Else
                                {
                                    If (LAnd (LNotEqual (Local0, Local1), LEqual (Local0, 0x01)))
                                    {
                                        \_SB.WMID.WGWE (0x0F, 0x01)
                                        Store (PSSB, PSSA) /* \PSSA */
                                    }
                                    Else
                                    {
                                        If (LAnd (LNotEqual (Local2, Local3), LEqual (Local2, 0x02)))
                                        {
                                            If (LNot (BCIE))
                                            {
                                                \_SB.WMID.WGWE (0x10, 0x00)
                                            }

                                            Store (0x00, BCIE) /* \BCIE */
                                            Store (PSSB, PSSA) /* \PSSA */
                                        }
                                        Else
                                        {
                                            If (LAnd (LNotEqual (Local2, Local3), LEqual (Local2, 0x00)))
                                            {
                                                If (LNot (BCIE))
                                                {
                                                    \_SB.WMID.WGWE (0x10, 0x01)
                                                }

                                                Store (0x00, BCIE) /* \BCIE */
                                                Store (PSSB, PSSA) /* \PSSA */
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        Release (ECMX)
                    }

                    Method (_Q22, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x01, \_SB.PCI0.LPCB.EC0.TBOS)
                        \_SB.PCI0.LPCB.EC0.SMCP (0x01)
                    }

                    Method (_Q23, 0, NotSerialized)  // _Qxx: EC Query
                    {
                        Store (0x00, \_SB.PCI0.LPCB.EC0.TBOS)
                        \_SB.PCI0.LPCB.EC0.SMCP (0x00)
                    }

                    Method (SBTN, 2, Serialized)
                    {
                        If (And (Arg0, 0x01))
                        {
                            Notify (\_SB.BAT0, Arg1)
                        }

                        If (And (Arg0, 0x02))
                        {
                            Notify (\_SB.BAT1, Arg1)
                        }
                    }

                    Method (PRIT, 0, NotSerialized)
                    {
                        Store (GACS (), Local0)
                        Store (Local0, PWRS) /* \PWRS */
                        \_SB.PCI0.LPCB.EC0.SMCP (Local0)
                        If (LEqual (\_SB.PCI0.HDEF.ASTI, 0x00))
                        {
                            SAST (\_SB.PCI0.HDEF.ASTA)
                        }

                        Store (\_SB.HST1.GHID (), Local0)
                        If (And (GBAP (), 0x01))
                        {
                            Store (0x1F, BT0P) /* \_SB_.BT0P */
                        }

                        \_SB.PCI0.ACEL.ITAL ()
                        Notify (\_SB.PCI0.ACEL, 0x00) // Bus Check
                        \_TZ.ECTI (0x00)
                    }

                    Method (GTST, 0, Serialized)
                    {
                        Store (0x02, Local0)
                        Acquire (ECMX, 0xFFFF)
                        If (ECRG)
                        {
                            Store (OCPS, Local0)
                        }

                        Release (ECMX)
                        Return (Local0)
                    }

                    Method (ETSI, 3, Serialized)
                    {
                        If (LNotEqual (Arg2, 0x00))
                        {
                            Store (0x00, OTRT) /* \_SB_.PCI0.LPCB.EC0_.OTRT */
                        }

                        If (LOr (LNotEqual (Arg1, OTRT), LNotEqual (Arg0, OTEN)))
                        {
                            Acquire (ECMX, 0xFFFF)
                            If (ECRG)
                            {
                                If (LNotEqual (Arg1, OTRT))
                                {
                                    Store (Arg1, OCPR) /* \_SB_.PCI0.LPCB.EC0_.OCPR */
                                    Store (Arg1, OTRT) /* \_SB_.PCI0.LPCB.EC0_.OTRT */
                                }

                                Store (Arg0, OCPE) /* \_SB_.PCI0.LPCB.EC0_.OCPE */
                                Store (Arg0, OTEN) /* \_SB_.PCI0.LPCB.EC0_.OTEN */
                            }

                            Release (ECMX)
                        }
                    }

                    Method (SMCP, 1, Serialized)
                    {
                        Store (0x00, Local0)
                        Store (DCCP, Local1)
                        If (LEqual (Local1, 0x00))
                        {
                            Store (0x01, Local1)
                            If (CondRefOf (\_PR.CPPC, Local7))
                            {
                                If (LGreater (\_PR.CPPC, 0x00))
                                {
                                    Store (\_PR.CPPC, Local1)
                                }
                            }
                        }

                        Acquire (OTMT, 0xFFFF)
                        If (LEqual (Arg0, 0x00))
                        {
                            If (LAnd (TBOD, \_SB.PCI0.LPCB.EC0.TBOS))
                            {
                                Store (Local0, MXCP) /* \_SB_.PCI0.LPCB.EC0_.MXCP */
                                Store (Local1, Local2)
                            }
                            Else
                            {
                                Store (Local1, MXCP) /* \_SB_.PCI0.LPCB.EC0_.MXCP */
                                Store (Local0, Local2)
                            }
                        }
                        Else
                        {
                            Store (Local0, MXCP) /* \_SB_.PCI0.LPCB.EC0_.MXCP */
                            Store (Local1, Local2)
                        }

                        If (LEqual (LRPC, Local2))
                        {
                            Store (MXCP, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                        }

                        Release (OTMT)
                        RPPC (0x01)
                        If (LEqual (DCCP, 0x00))
                        {
                            Store (Local1, DCCP) /* \_SB_.PCI0.LPCB.EC0_.DCCP */
                            If (CondRefOf (\_PR.CPU0._PPC, Local5))
                            {
                                If (LNotEqual (\_PR.CPPC, \_PR.CPU0._PPC))
                                {
                                    Store (\_PR.CPU0._PPC, \_PR.CPPC) /* External reference */
                                }
                            }
                        }

                        PNOT ()
                    }

                    Method (RPPC, 1, Serialized)
                    {
                        Store (0x00, Local1)
                        If (CondRefOf (\_PR.CPU0._PSS, Local2))
                        {
                            Store (\_PR.CPU0._PSS, Local0)
                            Store (SizeOf (Local0), Local1)
                        }

                        Store (0x00, Local3)
                        If (LGreater (Local1, 0x00))
                        {
                            Subtract (Local1, 0x01, Local1)
                        }
                        Else
                        {
                            Store (0x03, Local3)
                        }

                        Acquire (OTMT, 0xFFFF)
                        If (OTSI)
                        {
                            Store (OTLL, Local0)
                            Store (0x00, OTSI) /* \_SB_.PCI0.LPCB.EC0_.OTSI */
                            If (LEqual (Local0, 0x00))
                            {
                                If (LLess (LRPC, Local1))
                                {
                                    Add (LRPC, 0x01, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                                }
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x02))
                                {
                                    If (LGreater (LRPC, MXCP))
                                    {
                                        Subtract (LRPC, 0x01, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                                    }
                                }
                                Else
                                {
                                    If (LEqual (Local0, 0x03))
                                    {
                                        Store (Local1, LRPC) /* \_SB_.PCI0.LPCB.EC0_.LRPC */
                                    }
                                }
                            }
                        }

                        If (LLess (LRPC, Local1))
                        {
                            Or (Local3, 0x01, Local3)
                        }

                        If (LGreater (LRPC, MXCP))
                        {
                            Or (Local3, 0x02, Local3)
                        }

                        ETSI (Local3, 0x14, Arg0)
                        Store (0x00, Local4)
                        If (CondRefOf (\_PR.CPU0._PPC, Local5))
                        {
                            If (LNotEqual (LRPC, \_PR.CPU0._PPC))
                            {
                                Store (LRPC, \_PR.CPU0._PPC) /* External reference */
                                Store (0x01, Local4)
                            }
                        }

                        Release (OTMT)
                        Return (Local4)
                    }

                    Method (PPNT, 0, Serialized)
                    {
                        If (LGreater (TCNT, 0x01))
                        {
                            If (And (PDC0, 0x08))
                            {
                                Notify (\_PR.CPU0, 0x80) // Performance Capability Change
                            }

                            If (And (PDC1, 0x08))
                            {
                                Notify (\_PR.CPU1, 0x80) // Performance Capability Change
                            }

                            If (And (PDC2, 0x08))
                            {
                                Notify (\_PR.CPU2, 0x80) // Performance Capability Change
                            }

                            If (And (PDC3, 0x08))
                            {
                                Notify (\_PR.CPU3, 0x80) // Performance Capability Change
                            }

                            If (And (PDC4, 0x08))
                            {
                                Notify (\_PR.CPU4, 0x80) // Performance Capability Change
                            }

                            If (And (PDC5, 0x08))
                            {
                                Notify (\_PR.CPU5, 0x80) // Performance Capability Change
                            }

                            If (And (PDC6, 0x08))
                            {
                                Notify (\_PR.CPU6, 0x80) // Performance Capability Change
                            }

                            If (And (PDC7, 0x08))
                            {
                                Notify (\_PR.CPU7, 0x80) // Performance Capability Change
                            }
                        }
                        Else
                        {
                            Notify (\_PR.CPU0, 0x80) // Performance Capability Change
                        }
                    }
                }

                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x11,               // Length
                            )
                        IO (Decode16,
                            0x0093,             // Range Minimum
                            0x0093,             // Range Maximum
                            0x01,               // Alignment
                            0x0D,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }

                Device (FWHD)
                {
                    Name (_HID, EisaId ("INT0800"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        Memory32Fixed (ReadOnly,
                            0xFF000000,         // Address Base
                            0x01000000,         // Address Length
                            )
                    })
                }

                Device (HTAM)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x05)  // _UID: Unique ID
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Return (ResourceTemplate ()
                        {
                            IO (Decode16,
                                0xFE00,             // Range Minimum
                                0xFE00,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            IO (Decode16,
                                0xFE80,             // Range Minimum
                                0xFE80,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            Memory32Fixed (ReadWrite,
                                0xFED40000,         // Address Base
                                0x00005000,         // Address Length
                                )
                        })
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (TPMX, 0x00))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            Return (0x0F)
                        }
                    }
                }

                Device (GTPM)
                {
                    Method (_HID, 0, Serialized)  // _HID: Hardware ID
                    {
                        If (LEqual (TVID, 0x15D1))
                        {
                            Return (0x0201D824)
                        }
                        Else
                        {
                            Return (0x310CD041)
                        }
                    }

                    Name (_CID, EisaId ("PNP0C31"))  // _CID: Compatible ID
                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        Return (ResourceTemplate ()
                        {
                            IO (Decode16,
                                0xFE00,             // Range Minimum
                                0xFE00,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            IO (Decode16,
                                0xFE80,             // Range Minimum
                                0xFE80,             // Range Maximum
                                0x01,               // Alignment
                                0x10,               // Length
                                )
                            Memory32Fixed (ReadWrite,
                                0xFED40000,         // Address Base
                                0x00005000,         // Address Length
                                )
                        })
                    }

                    OperationRegion (TMMB, SystemMemory, 0xFED40000, 0x1000)
                    Field (TMMB, ByteAcc, Lock, Preserve)
                    {
                        ACCS,   8, 
                        Offset (0x18), 
                        TSTA,   8, 
                        TBCA,   8, 
                        Offset (0xF00), 
                        TVID,   16, 
                        TDID,   16
                    }

                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LEqual (ACCS, 0xFF))
                        {
                            Return (0x00)
                        }
                        Else
                        {
                            If (LEqual (TPMX, 0x01))
                            {
                                Return (0x00)
                            }
                            Else
                            {
                                Return (0x0F)
                            }
                        }
                    }

                    Name (PUID, Buffer (0x10)
                    {
                        /* 0000 */   0xA6, 0xFA, 0xDD, 0x3D, 0x1B, 0x36, 0xB4, 0x4E,
                        /* 0008 */   0xA4, 0x24, 0x8D, 0x10, 0x08, 0x9D, 0x16, 0x53
                    })
                    Name (REV1, "1.2")
                    Name (PPIB, Buffer (0x02)
                    {
                         0x00, 0x00
                    })
                    Name (MUID, Buffer (0x10)
                    {
                        /* 0000 */   0xED, 0x54, 0x60, 0x37, 0x13, 0xCC, 0x75, 0x46,
                        /* 0008 */   0x90, 0x1C, 0x47, 0x56, 0xD7, 0xF2, 0xD4, 0x5D
                    })
                    Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                    {
                        Store (Arg0, Local0)
                        If (LEqual (\SRCP (Local0, PUID), 0x01))
                        {
                            Return (HPPI (Arg0, Arg1, Arg2, Arg3))
                        }

                        If (LEqual (\SRCP (Local0, MUID), 0x01))
                        {
                            Return (HMOR (Arg0, Arg1, Arg2, Arg3))
                        }

                        Return (0x00)
                    }

                    Method (HPPI, 4, NotSerialized)
                    {
                        If (LNotEqual (Arg1, 0x01))
                        {
                            Return (Buffer (0x01)
                            {
                                 0x00
                            })
                        }

                        If (LLessEqual (Arg2, 0x08))
                        {
                            If (LEqual (Arg2, 0x00))
                            {
                                Return (Buffer (0x02)
                                {
                                     0xFF, 0x01
                                })
                            }

                            If (LEqual (Arg2, 0x01))
                            {
                                Return (REV1) /* \_SB_.PCI0.LPCB.GTPM.REV1 */
                            }

                            If (LEqual (Arg2, 0x02))
                            {
                                Store (DerefOf (Index (Arg3, 0x00)), Local0)
                                Store ("TPM Func 2", Debug)
                                Store (Local0, Debug)
                                If (LLessEqual (Local0, 0x16))
                                {
                                    If (LOr (LEqual (Local0, 0x0C), LEqual (Local0, 0x0D)))
                                    {
                                        Return (0x01)
                                    }
                                    Else
                                    {
                                        If (LOr (LEqual (Local0, 0x13), LEqual (Local0, 0x14)))
                                        {
                                            Return (0x01)
                                        }
                                        Else
                                        {
                                            Store (0x02, Local2)
                                            \_SB.SSMI (0xEA7D, 0x05, 0x00, 0x00, 0x00)
                                            Store (ECX, Local1)
                                            If (LEqual (And (Local1, 0x01), 0x01))
                                            {
                                                If (LEqual (And (Local1, 0x02), 0x00))
                                                {
                                                    If (LOr (LEqual (Local0, 0x05), LEqual (Local0, 0x0E)))
                                                    {
                                                        Return (Local2)
                                                    }
                                                    Else
                                                    {
                                                        If (LOr (LEqual (Local0, 0x15), LEqual (Local0, 0x16)))
                                                        {
                                                            Return (Local2)
                                                        }
                                                    }
                                                }

                                                \_SB.SSMI (0xEA7E, 0x00, Local0, 0x00, 0x01)
                                                Store (EAX, Debug)
                                                Store (EBX, Debug)
                                                Store (ECX, Debug)
                                                If (LEqual (EBX, 0x00))
                                                {
                                                    Store (0x00, Local2)
                                                }
                                            }

                                            Return (Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }

                            If (LEqual (Arg2, 0x03))
                            {
                                Store ("TPM Func 3", Debug)
                                \_SB.SSMI (0xEA7D, 0x00, 0x00, 0x00, 0x01)
                                Store (EAX, Debug)
                                Store (EBX, Debug)
                                Store (ECX, Debug)
                                Name (DSMB, Package (0x02)
                                {
                                    0x01, 
                                    0x00
                                })
                                If (LEqual (EBX, 0x00))
                                {
                                    Store (0x00, Index (DSMB, 0x00))
                                    Store (0x00, Index (DSMB, 0x01))
                                    Store (ECX, Local0)
                                    If (LLessEqual (Local0, 0x16))
                                    {
                                        Store (0x00, Index (DSMB, 0x00))
                                        Store (Local0, Index (DSMB, 0x01))
                                    }
                                }

                                Return (DSMB) /* \_SB_.PCI0.LPCB.GTPM.HPPI.DSMB */
                            }

                            If (LEqual (Arg2, 0x04))
                            {
                                Return (0x02)
                            }

                            If (LEqual (Arg2, 0x05))
                            {
                                Store ("TPM Func 5", Debug)
                                \_SB.SSMI (0xEA7D, 0x01, 0x00, 0x00, 0x01)
                                Name (DSMC, Package (0x03)
                                {
                                    0x01, 
                                    0x00, 
                                    0x00
                                })
                                Store (EAX, Debug)
                                Store (EBX, Debug)
                                Store (ECX, Debug)
                                If (LEqual (EBX, 0x00))
                                {
                                    Store (0x00, Index (DSMC, 0x00))
                                    Store (ECX, Index (DSMC, 0x01))
                                    \_SB.SSMI (0xEA7D, 0x02, 0x00, 0x00, 0x01)
                                    Store (ECX, Index (DSMC, 0x02))
                                }

                                Return (DSMC) /* \_SB_.PCI0.LPCB.GTPM.HPPI.DSMC */
                            }

                            If (LEqual (Arg2, 0x06))
                            {
                                Store ("TPM Func 6", Debug)
                                Return (0x03)
                            }

                            If (LEqual (Arg2, 0x07))
                            {
                                Store (DerefOf (Index (Arg3, 0x00)), Local0)
                                Store ("TPM Func 7", Debug)
                                Store (Local0, Debug)
                                If (LLessEqual (Local0, 0x16))
                                {
                                    If (LOr (LEqual (Local0, 0x0C), LEqual (Local0, 0x0D)))
                                    {
                                        Return (0x01)
                                    }
                                    Else
                                    {
                                        If (LOr (LEqual (Local0, 0x13), LEqual (Local0, 0x14)))
                                        {
                                            Return (0x01)
                                        }
                                        Else
                                        {
                                            Store (0x02, Local2)
                                            \_SB.SSMI (0xEA7D, 0x05, 0x00, 0x00, 0x00)
                                            Store (ECX, Local1)
                                            If (LEqual (And (Local1, 0x01), 0x01))
                                            {
                                                If (LEqual (And (Local1, 0x02), 0x00))
                                                {
                                                    If (LOr (LEqual (Local0, 0x05), LEqual (Local0, 0x0E)))
                                                    {
                                                        Return (0x03)
                                                    }
                                                    Else
                                                    {
                                                        If (LOr (LEqual (Local0, 0x15), LEqual (Local0, 0x16)))
                                                        {
                                                            Return (0x03)
                                                        }
                                                    }
                                                }

                                                \_SB.SSMI (0xEA7E, 0x00, Local0, 0x00, 0x01)
                                                Store (EAX, Debug)
                                                Store (EBX, Debug)
                                                Store (ECX, Debug)
                                                If (LEqual (EBX, 0x00))
                                                {
                                                    Store (0x00, Local2)
                                                }
                                            }

                                            Return (Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }

                            If (LEqual (Arg2, 0x08))
                            {
                                Store (DerefOf (Index (Arg3, 0x00)), Local0)
                                Store ("TPM Func 8", Debug)
                                Store (Local0, Debug)
                                If (LLessEqual (Local0, 0x16))
                                {
                                    If (LOr (LEqual (Local0, 0x0C), LEqual (Local0, 0x0D)))
                                    {
                                        Return (0x00)
                                    }
                                    Else
                                    {
                                        If (LOr (LEqual (Local0, 0x13), LEqual (Local0, 0x14)))
                                        {
                                            Return (0x00)
                                        }
                                        Else
                                        {
                                            \_SB.SSMI (0xEA7D, 0x06, 0x00, Local0, 0x01)
                                            Store (EAX, Debug)
                                            Store (EBX, Debug)
                                            Store (ECX, Debug)
                                            If (LEqual (EBX, 0x00))
                                            {
                                                If (LEqual (ECX, 0x00))
                                                {
                                                    Store (0x03, Local2)
                                                }
                                                Else
                                                {
                                                    Store (0x04, Local2)
                                                }
                                            }

                                            Return (Local2)
                                        }
                                    }
                                }
                                Else
                                {
                                    Return (0x01)
                                }
                            }
                        }

                        Return (Buffer (0x01)
                        {
                             0x00
                        })
                    }

                    Method (HMOR, 4, NotSerialized)
                    {
                        If (LNotEqual (Arg1, 0x01))
                        {
                            Return (0x01)
                        }

                        If (LNotEqual (Arg2, 0x01))
                        {
                            Return (0x01)
                        }

                        Store (DerefOf (Index (Arg3, 0x00)), Local0)
                        \_SB.SSMI (0xEA7F, Local0, 0x00, 0x00, 0x01)
                        Store (0x00, Local0)
                        If (LNotEqual (EBX, 0x00))
                        {
                            Store (0x01, Local0)
                        }

                        Return (Local0)
                    }
                }

                Device (HPET)
                {
                    Name (_HID, EisaId ("PNP0103"))  // _HID: Hardware ID
                    Name (_UID, 0x00)  // _UID: Unique ID
                    Name (BUF0, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y1E)
                    })
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        If (LGreaterEqual (OSYS, 0x07D1))
                        {
                            If (HPAE)
                            {
                                Return (0x0F)
                            }
                        }
                        Else
                        {
                            If (HPAE)
                            {
                                Return (0x0B)
                            }
                        }

                        Return (0x00)
                    }

                    Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                    {
                        If (HPAE)
                        {
                            CreateDWordField (BUF0, \_SB.PCI0.LPCB.HPET._Y1E._BAS, HPT0)  // _BAS: Base Address
                            If (LEqual (HPAS, 0x01))
                            {
                                Store (0xFED01000, HPT0) /* \_SB_.PCI0.LPCB.HPET._CRS.HPT0 */
                            }

                            If (LEqual (HPAS, 0x02))
                            {
                                Store (0xFED02000, HPT0) /* \_SB_.PCI0.LPCB.HPET._CRS.HPT0 */
                            }

                            If (LEqual (HPAS, 0x03))
                            {
                                Store (0xFED03000, HPT0) /* \_SB_.PCI0.LPCB.HPET._CRS.HPT0 */
                            }
                        }

                        Return (BUF0) /* \_SB_.PCI0.LPCB.HPET.BUF0 */
                    }
                }

                Device (IPIC)
                {
                    Name (_HID, EisaId ("PNP0000"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0024,             // Range Minimum
                            0x0024,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0028,             // Range Minimum
                            0x0028,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x002C,             // Range Minimum
                            0x002C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0030,             // Range Minimum
                            0x0030,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0034,             // Range Minimum
                            0x0034,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0038,             // Range Minimum
                            0x0038,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x003C,             // Range Minimum
                            0x003C,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A4,             // Range Minimum
                            0x00A4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A8,             // Range Minimum
                            0x00A8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00AC,             // Range Minimum
                            0x00AC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B4,             // Range Minimum
                            0x00B4,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00B8,             // Range Minimum
                            0x00B8,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00BC,             // Range Minimum
                            0x00BC,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }

                Device (MATH)
                {
                    Name (_HID, EisaId ("PNP0C04"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }

                Device (LDRC)
                {
                    Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x002E,             // Range Minimum
                            0x002E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x004E,             // Range Minimum
                            0x004E,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0063,             // Range Minimum
                            0x0063,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0065,             // Range Minimum
                            0x0065,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0067,             // Range Minimum
                            0x0067,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B2,             // Range Minimum
                            0x00B2,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0200,             // Range Minimum
                            0x0200,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x1000,             // Range Minimum
                            0x1000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0xFFFF,             // Range Minimum
                            0xFFFF,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0x0500,             // Range Minimum
                            0x0500,             // Range Maximum
                            0x01,               // Alignment
                            0x80,               // Length
                            )
                        IO (Decode16,
                            0xEF80,             // Range Minimum
                            0xEF80,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                    })
                }

                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x08,               // Length
                            )
                        IRQNoFlags ()
                            {8}
                    })
                }

                Device (TIMR)
                {
                    Name (_HID, EisaId ("PNP0100"))  // _HID: Hardware ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IO (Decode16,
                            0x0050,             // Range Minimum
                            0x0050,             // Range Maximum
                            0x10,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                }

                Device (SIO)
                {
                    Name (_HID, EisaId ("PNP0A06"))  // _HID: Hardware ID
                    OperationRegion (SOCG, SystemIO, 0x4E, 0x02)
                    Field (SOCG, ByteAcc, NoLock, Preserve)
                    {
                        SIOI,   8, 
                        SIOD,   8
                    }

                    IndexField (SIOI, SIOD, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x01), 
                            ,   2, 
                        PPPW,   1, 
                        PPM,    1, 
                        Offset (0x02), 
                            ,   3, 
                        S1PW,   1, 
                            ,   3, 
                        S2PW,   1, 
                        Offset (0x04), 
                        PPXM,   2, 
                        Offset (0x0D), 
                        CR0D,   8, 
                        Offset (0x23), 
                        PPBS,   8, 
                        S1BS,   8, 
                        S2BS,   8, 
                        PPDM,   4, 
                        Offset (0x27), 
                        PPIQ,   4, 
                        Offset (0x28), 
                        S2IQ,   4, 
                        S1IQ,   4, 
                        Offset (0x2B), 
                        FRBS,   8, 
                        FRDM,   4
                    }

                    OperationRegion (SORT, SystemIO, 0x0210, 0x10)
                    Field (SORT, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x0C), 
                        GP1,    8, 
                        GP2,    5, 
                        Offset (0x0E), 
                        GP3,    8, 
                        GP4,    8
                    }

                    Mutex (SIOM, 0x00)
                    Name (MSPS, 0x00)
                    Name (MSPV, 0x00)
                    Method (_INI, 0, NotSerialized)  // _INI: Initialize
                    {
                        ECM ()
                        If (LNotEqual (CR0D, 0x7A))
                        {
                            Store (0x00, SDFG) /* \SDFG */
                        }

                        DCM ()
                    }

                    Method (ECM, 0, NotSerialized)
                    {
                        Acquire (SIOM, 0xFFFF)
                        Store (0x55, SIOI) /* \_SB_.PCI0.LPCB.SIO_.SIOI */
                    }

                    Method (DCM, 0, NotSerialized)
                    {
                        Store (0xAA, SIOI) /* \_SB_.PCI0.LPCB.SIO_.SIOI */
                        Release (SIOM)
                    }

                    Method (GETS, 1, NotSerialized)
                    {
                        ECM ()
                        Store (0x00, Local0)
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (PPBS, Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (S1BS, Local0)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (S2BS, Local0)
                                }
                            }
                        }

                        Store (0x00, Local1)
                        If (And (Local0, 0xC0))
                        {
                            ShiftLeft (Local0, 0x02, Local1)
                        }

                        DCM ()
                        Return (Local1)
                    }

                    Method (GETR, 1, NotSerialized)
                    {
                        Name (GRES, Package (0x04)
                        {
                            0x00, 
                            0x00, 
                            0x00, 
                            0x00
                        })
                        ECM ()
                        Store (0x00, Local0)
                        Store (0x00, Local1)
                        Store (0x00, Local2)
                        Store (0x00, Local3)
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (PPBS, Local0)
                            Store (PPIQ, Local2)
                            Store (PPDM, Local3)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (S1BS, Local0)
                                Store (S1IQ, Local2)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (S2BS, Local0)
                                    Store (FRBS, Local1)
                                    Store (S2IQ, Local2)
                                    Store (FRDM, Local3)
                                }
                            }
                        }

                        ShiftLeft (Local0, 0x02, Index (GRES, 0x00))
                        ShiftLeft (Local1, 0x03, Index (GRES, 0x01))
                        Store (0x00, Local4)
                        If (LGreater (Local2, 0x00))
                        {
                            ShiftLeft (0x01, Local2, Local4)
                        }

                        Store (Local4, Index (GRES, 0x02))
                        Store (0x00, Local4)
                        If (LAnd (LGreater (Local3, 0x00), LLess (Local3, 0x04)))
                        {
                            ShiftLeft (0x01, Local3, Local4)
                        }

                        Store (Local4, Index (GRES, 0x03))
                        DCM ()
                        Return (GRES) /* \_SB_.PCI0.LPCB.SIO_.GETR.GRES */
                    }

                    Method (SETR, 5, NotSerialized)
                    {
                        ECM ()
                        ShiftRight (Arg1, 0x02, Local0)
                        FindSetRightBit (Arg3, Local1)
                        If (LAnd (LGreater (Local1, 0x01), LLess (Local1, 0x11)))
                        {
                            Decrement (Local1)
                        }
                        Else
                        {
                            Store (0x00, Local1)
                        }

                        FindSetRightBit (Arg4, Local2)
                        If (LAnd (LGreater (Local2, 0x01), LLess (Local2, 0x05)))
                        {
                            Decrement (Local2)
                        }
                        Else
                        {
                            Store (0x0F, Local2)
                        }

                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Local0, PPBS) /* \_SB_.PCI0.LPCB.SIO_.PPBS */
                            Store (Local1, PPIQ) /* \_SB_.PCI0.LPCB.SIO_.PPIQ */
                            Store (Local2, PPDM) /* \_SB_.PCI0.LPCB.SIO_.PPDM */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                And (Local0, 0xFE, S1BS) /* \_SB_.PCI0.LPCB.SIO_.S1BS */
                                Store (Local1, S1IQ) /* \_SB_.PCI0.LPCB.SIO_.S1IQ */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    And (Local0, 0xFE, S2BS) /* \_SB_.PCI0.LPCB.SIO_.S2BS */
                                    ShiftRight (Arg2, 0x03, FRBS) /* \_SB_.PCI0.LPCB.SIO_.FRBS */
                                    Store (Local1, S2IQ) /* \_SB_.PCI0.LPCB.SIO_.S2IQ */
                                    Store (Local2, FRDM) /* \_SB_.PCI0.LPCB.SIO_.FRDM */
                                }
                            }
                        }

                        DCM ()
                    }

                    Method (GLPM, 0, NotSerialized)
                    {
                        ECM ()
                        Store (PPM, Local0)
                        Store (PPXM, Local1)
                        DCM ()
                        If (Local0)
                        {
                            Store (0x00, Local2)
                        }
                        Else
                        {
                            Store (0x03, Local2)
                            If (LEqual (Local1, 0x00))
                            {
                                Store (0x01, Local2)
                            }

                            If (LEqual (Local1, 0x01))
                            {
                                Store (0x02, Local2)
                            }
                        }

                        Return (Local2)
                    }

                    Method (DPWS, 1, Serialized)
                    {
                        ECM ()
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (PPPW, Local0)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (S1PW, Local0)
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (S2PW, Local0)
                                }
                            }
                        }

                        DCM ()
                        Return (Local0)
                    }

                    Method (DPW, 2, Serialized)
                    {
                        ECM ()
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (Arg1, PPPW) /* \_SB_.PCI0.LPCB.SIO_.PPPW */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (Arg1, S1PW) /* \_SB_.PCI0.LPCB.SIO_.S1PW */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (Arg1, S2PW) /* \_SB_.PCI0.LPCB.SIO_.S2PW */
                                }
                            }
                        }

                        DCM ()
                    }

                    Method (GDPA, 0, Serialized)
                    {
                        Store (GETS (0x02), Local0)
                        Return (Local0)
                    }

                    Alias (GDPA, \_SB.GDPA)
                    Method (SODS, 2, Serialized)
                    {
                        And (Not (SDFG), Arg1, Local1)
                        If (LOr (LEGF, Local1))
                        {
                            Store (0x00, Local0)
                        }
                        Else
                        {
                            Store (GETS (Arg0), Local1)
                            Store (0x0D, Local0)
                            If (Local1)
                            {
                                Store (0x0F, Local0)
                            }
                        }

                        Return (Local0)
                    }

                    Method (DSOD, 1, Serialized)
                    {
                        If (GETS (Arg0))
                        {
                            Store (GETR (Arg0), Local0)
                            Store (DerefOf (Index (Local0, 0x01)), Local1)
                            Store (DerefOf (Index (Local0, 0x02)), Local2)
                            Store (DerefOf (Index (Local0, 0x03)), Local3)
                            Store (DerefOf (Index (Local0, 0x00)), Local4)
                            Or (ShiftLeft (Local4, 0x08), Local3, Local3)
                            \_SB.PCI0.LPCB.CFG (Arg0, 0x00, Local1, Local2, Local3)
                            SETR (Arg0, 0x00, 0x00, 0x00, 0x00)
                        }
                    }

                    Device (HCOM)
                    {
                        Name (_HID, EisaId ("PNP0C02"))  // _HID: Hardware ID
                        Name (_UID, 0x04)  // _UID: Unique ID
                        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                        {
                            Name (CMRS, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y1F)
                            })
                            CreateWordField (CMRS, \_SB.PCI0.LPCB.SIO.HCOM._CRS._Y1F._MIN, MIN1)  // _MIN: Minimum Base Address
                            CreateWordField (CMRS, \_SB.PCI0.LPCB.SIO.HCOM._CRS._Y1F._MAX, MAX1)  // _MAX: Maximum Base Address
                            Store (GETR (0x02), Local1)
                            Store (DerefOf (Index (Local1, 0x00)), MIN1) /* \_SB_.PCI0.LPCB.SIO_.HCOM._CRS.MIN1 */
                            Store (MIN1, MAX1) /* \_SB_.PCI0.LPCB.SIO_.HCOM._CRS.MAX1 */
                            Return (CMRS) /* \_SB_.PCI0.LPCB.SIO_.HCOM._CRS.CMRS */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Store (0x00, Local0)
                            If (LEGF)
                            {
                                If (GETS (0x02))
                                {
                                    Store (0x0F, Local0)
                                }
                            }

                            Return (Local0)
                        }
                    }

                    Device (COM1)
                    {
                        Name (_HID, EisaId ("PNP0501"))  // _HID: Hardware ID
                        Name (_CID, EisaId ("PNP0500"))  // _CID: Compatible ID
                        Name (_DDN, "COM1")  // _DDN: DOS Device Name
                        Name (RCOD, 0x00)
                        Name (POSS, ResourceTemplate ()
                        {
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02F8,             // Range Minimum
                                    0x02F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03E8,             // Range Minimum
                                    0x03E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {4}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x02E8,             // Range Minimum
                                    0x02E8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IRQNoFlags ()
                                    {3}
                            }
                            EndDependentFn ()
                        })
                        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                        {
                            Return (POSS) /* \_SB_.PCI0.LPCB.SIO_.COM1.POSS */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Store (0x00, Local0)
                            If (LOr (\_SB.DCKD (), ICPT))
                            {
                                If (LNot (RCOD))
                                {
                                    Store (SODS (0x02, 0x02), Local0)
                                }
                                Else
                                {
                                    Store (0x0D, Local0)
                                }
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            DSOD (0x02)
                            Return (0x00)
                        }

                        Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, MIN1)
                            CreateWordField (Arg0, 0x09, IRQ0)
                            If (SODS (0x02, 0x02))
                            {
                                _DIS ()
                                \_SB.PCI0.LPCB.CFG (0x02, MIN1, 0x00, IRQ0, 0x00)
                                SETR (0x02, MIN1, 0x00, IRQ0, 0x00)
                            }

                            Store (0x00, RCOD) /* \_SB_.PCI0.LPCB.SIO_.COM1.RCOD */
                        }

                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            Name (CRES, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x03F8,             // Range Minimum
                                    0x03F8,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y20)
                                IRQNoFlags (_Y21)
                                    {4}
                            })
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.COM1._CRS._Y20._MIN, MIN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.COM1._CRS._Y20._MAX, MAX1)  // _MAX: Maximum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.COM1._CRS._Y21._INT, IRQ0)  // _INT: Interrupts
                            If (RCOD)
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Store (SODS (0x02, 0x02), Local0)
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, MIN1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MIN1 */
                                Store (0x00, MAX1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MAX1 */
                                Store (0x00, IRQ0) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.IRQ0 */
                                Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.CRES */
                            }

                            Store (GETR (0x02), Local1)
                            Store (DerefOf (Index (Local1, 0x00)), MIN1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MIN1 */
                            Store (MIN1, MAX1) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.MAX1 */
                            Store (DerefOf (Index (Local1, 0x02)), IRQ0) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.IRQ0 */
                            Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.COM1._CRS.CRES */
                        }

                        PowerResource (COMP, 0x00, 0x0000)
                        {
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (DPWS (0x02))
                            }

                            Method (_ON, 0, NotSerialized)  // _ON_: Power On
                            {
                                DPW (0x02, 0x01)
                            }

                            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                            {
                            }
                        }

                        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                        {
                            COMP
                        })
                    }

                    Device (LPT0)
                    {
                        Method (_HID, 0, Serialized)  // _HID: Hardware ID
                        {
                            If (GTM ())
                            {
                                Store (0x0104D041, Local0)
                            }
                            Else
                            {
                                Store (0x0004D041, Local0)
                            }

                            Return (Local0)
                        }

                        Name (LPM, 0xFF)
                        Method (GTM, 0, Serialized)
                        {
                            If (LEqual (LPM, 0xFF))
                            {
                                Store (GLPM (), Local0)
                                Store (0x00, LPM) /* \_SB_.PCI0.LPCB.SIO_.LPT0.LPM_ */
                                If (LGreater (Local0, 0x01))
                                {
                                    Store (0x01, LPM) /* \_SB_.PCI0.LPCB.SIO_.LPT0.LPM_ */
                                }
                            }

                            Return (LPM) /* \_SB_.PCI0.LPCB.SIO_.LPT0.LPM_ */
                        }

                        Name (RLPD, 0x00)
                        Name (POSS, ResourceTemplate ()
                        {
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFn (0x00, 0x00)
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {1,3}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {5,7}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x0278,             // Range Minimum
                                    0x0278,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    )
                                IO (Decode16,
                                    0x0678,             // Range Minimum
                                    0x0678,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            StartDependentFnNoPri ()
                            {
                                IO (Decode16,
                                    0x03BC,             // Range Minimum
                                    0x03BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x04,               // Length
                                    )
                                IO (Decode16,
                                    0x07BC,             // Range Minimum
                                    0x07BC,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    )
                                IRQNoFlags ()
                                    {}
                                DMA (Compatibility, NotBusMaster, Transfer8, )
                                    {}
                            }
                            EndDependentFn ()
                        })
                        Method (_PRS, 0, NotSerialized)  // _PRS: Possible Resource Settings
                        {
                            Return (POSS) /* \_SB_.PCI0.LPCB.SIO_.LPT0.POSS */
                        }

                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            If (RLPD)
                            {
                                Store (0x0D, Local0)
                            }
                            Else
                            {
                                Store (SODS (0x01, 0x04), Local0)
                            }

                            Return (Local0)
                        }

                        Method (_DIS, 0, NotSerialized)  // _DIS: Disable Device
                        {
                            DSOD (0x01)
                            Return (0x00)
                        }

                        Method (_SRS, 1, NotSerialized)  // _SRS: Set Resource Settings
                        {
                            CreateWordField (Arg0, 0x02, MIN1)
                            CreateWordField (Arg0, 0x0A, MIN2)
                            CreateWordField (Arg0, 0x11, IRQ0)
                            CreateWordField (Arg0, 0x14, DMA0)
                            If (SODS (0x01, 0x04))
                            {
                                _DIS ()
                                \_SB.PCI0.LPCB.CFG (0x01, MIN1, MIN2, IRQ0, DMA0)
                                SETR (0x01, MIN1, MIN2, IRQ0, DMA0)
                            }

                            Store (0x00, RLPD) /* \_SB_.PCI0.LPCB.SIO_.LPT0.RLPD */
                        }

                        Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                        {
                            Name (CRES, ResourceTemplate ()
                            {
                                IO (Decode16,
                                    0x0378,             // Range Minimum
                                    0x0378,             // Range Maximum
                                    0x01,               // Alignment
                                    0x08,               // Length
                                    _Y22)
                                IO (Decode16,
                                    0x0778,             // Range Minimum
                                    0x0778,             // Range Maximum
                                    0x01,               // Alignment
                                    0x03,               // Length
                                    _Y23)
                                IRQNoFlags (_Y24)
                                    {7}
                                DMA (Compatibility, NotBusMaster, Transfer8, _Y25)
                                    {3}
                            })
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y22._MIN, MIN1)  // _MIN: Minimum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y22._MAX, MAX1)  // _MAX: Maximum Base Address
                            CreateByteField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y22._LEN, LEN1)  // _LEN: Length
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y23._MIN, MIN2)  // _MIN: Minimum Base Address
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y23._MAX, MAX2)  // _MAX: Maximum Base Address
                            CreateByteField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y23._LEN, LEN2)  // _LEN: Length
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y24._INT, IRQ0)  // _INT: Interrupts
                            CreateWordField (CRES, \_SB.PCI0.LPCB.SIO.LPT0._CRS._Y25._DMA, DMA0)  // _DMA: Direct Memory Access
                            If (RLPD)
                            {
                                Store (0x00, Local0)
                            }
                            Else
                            {
                                Store (SODS (0x01, 0x04), Local0)
                            }

                            If (LEqual (Local0, 0x00))
                            {
                                Store (0x00, MIN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN1 */
                                Store (0x00, MAX1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX1 */
                                Store (0x00, MIN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN2 */
                                Store (0x00, MAX2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX2 */
                                Store (0x00, IRQ0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.IRQ0 */
                                Store (0x00, DMA0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.DMA0 */
                                Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.CRES */
                            }

                            Store (GETR (0x01), Local1)
                            Store (DerefOf (Index (Local1, 0x00)), MIN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN1 */
                            Store (MIN1, MAX1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX1 */
                            If (LEqual (MIN1, 0x0278))
                            {
                                Store (0x08, LEN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN1 */
                                Store (0x03, LEN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN2 */
                            }

                            If (LEqual (MIN1, 0x03BC))
                            {
                                Store (0x04, LEN1) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN1 */
                                Store (0x03, LEN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.LEN2 */
                            }

                            Add (MIN1, 0x0400, MIN2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MIN2 */
                            Store (MIN2, MAX2) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.MAX2 */
                            Store (DerefOf (Index (Local1, 0x02)), IRQ0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.IRQ0 */
                            Store (DerefOf (Index (Local1, 0x03)), DMA0) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.DMA0 */
                            Return (CRES) /* \_SB_.PCI0.LPCB.SIO_.LPT0._CRS.CRES */
                        }

                        PowerResource (LPP, 0x00, 0x0000)
                        {
                            Method (_STA, 0, NotSerialized)  // _STA: Status
                            {
                                Return (DPWS (0x01))
                            }

                            Method (_ON, 0, NotSerialized)  // _ON_: Power On
                            {
                                DPW (0x01, 0x01)
                            }

                            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                            {
                            }
                        }

                        Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                        {
                            LPP
                        })
                    }
                }

                Device (PS2K)
                {
                    Name (_HID, EisaId ("HPQ8001"))  // _HID: Hardware ID
                    Name (_CID, EisaId ("PNP0303"))  // _CID: Compatible ID
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {1}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            FixedIO (
                                0x0060,             // Address
                                0x01,               // Length
                                )
                            FixedIO (
                                0x0064,             // Address
                                0x01,               // Length
                                )
                            IRQNoFlags ()
                                {1}
                        }
                        EndDependentFn ()
                    })
                }

                Device (PS2M)
                {
                    Name (_CID, Package (0x03)  // _CID: Compatible ID
                    {
                        EisaId ("SYN0100"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Name (_PRS, ResourceTemplate ()  // _PRS: Possible Resource Settings
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
                    })
                }
            }

            Device (SATA)
            {
                Name (_ADR, 0x001F0002)  // _ADR: Address
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                    Offset (0x50), 
                    MAPV,   2
                }
            }

            Device (SAT1)
            {
                Name (_ADR, 0x001F0005)  // _ADR: Address
                OperationRegion (SACS, PCI_Config, 0x40, 0xC0)
                Field (SACS, DWordAcc, NoLock, Preserve)
                {
                    PRIT,   16, 
                    SECT,   16, 
                    PSIT,   4, 
                    SSIT,   4, 
                    Offset (0x08), 
                    SYNC,   4, 
                    Offset (0x0A), 
                    SDT0,   2, 
                        ,   2, 
                    SDT1,   2, 
                    Offset (0x0B), 
                    SDT2,   2, 
                        ,   2, 
                    SDT3,   2, 
                    Offset (0x14), 
                    ICR0,   4, 
                    ICR1,   4, 
                    ICR2,   4, 
                    ICR3,   4, 
                    ICR4,   4, 
                    ICR5,   4, 
                    Offset (0x50), 
                    MAPV,   2
                }
            }

            Device (SBUS)
            {
                Name (_ADR, 0x001F0003)  // _ADR: Address
                OperationRegion (SMBP, PCI_Config, 0x40, 0xC0)
                Field (SMBP, DWordAcc, NoLock, Preserve)
                {
                        ,   2, 
                    I2CE,   1
                }

                OperationRegion (SMBI, SystemIO, 0xEF80, 0x10)
                Field (SMBI, ByteAcc, NoLock, Preserve)
                {
                    HSTS,   8, 
                    Offset (0x02), 
                    HCON,   8, 
                    HCOM,   8, 
                    TXSA,   8, 
                    DAT0,   8, 
                    DAT1,   8, 
                    HBDR,   8, 
                    PECR,   8, 
                    RXSA,   8, 
                    SDAT,   16
                }

                Method (SSXB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x48, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRXB, 1, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (0x44, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    }

                    Return (0xFFFF)
                }

                Method (SWRB, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (Arg2, DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    Store (0x48, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDB, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x48, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    }

                    Return (0xFFFF)
                }

                Method (SWRW, 3, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    And (Arg2, 0xFF, DAT1) /* \_SB_.PCI0.SBUS.DAT1 */
                    And (ShiftRight (Arg2, 0x08), 0xFF, DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    Store (0x4C, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SRDW, 2, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0xFFFF)
                    }

                    Store (0x00, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x4C, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (Or (ShiftLeft (DAT0, 0x08), DAT1))
                    }

                    Return (0xFFFFFFFF)
                }

                Method (SBLW, 4, Serialized)
                {
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg3, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Arg0, TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (SizeOf (Arg2), DAT0) /* \_SB_.PCI0.SBUS.DAT0 */
                    Store (0x00, Local1)
                    Store (DerefOf (Index (Arg2, 0x00)), HBDR) /* \_SB_.PCI0.SBUS.HBDR */
                    Store (0x54, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    While (LGreater (SizeOf (Arg2), Local1))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (0x80, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Increment (Local1)
                        If (LGreater (SizeOf (Arg2), Local1))
                        {
                            Store (DerefOf (Index (Arg2, Local1)), HBDR) /* \_SB_.PCI0.SBUS.HBDR */
                        }
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (0x01)
                    }

                    Return (0x00)
                }

                Method (SBLR, 3, Serialized)
                {
                    Name (TBUF, Buffer (0x0100) {})
                    If (STRT ())
                    {
                        Return (0x00)
                    }

                    Store (Arg2, I2CE) /* \_SB_.PCI0.SBUS.I2CE */
                    Store (0xBF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (Or (Arg0, 0x01), TXSA) /* \_SB_.PCI0.SBUS.TXSA */
                    Store (Arg1, HCOM) /* \_SB_.PCI0.SBUS.HCOM */
                    Store (0x54, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    Store (0x0FA0, Local0)
                    While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                    {
                        Decrement (Local0)
                        Stall (0x32)
                    }

                    If (LNot (Local0))
                    {
                        KILL ()
                        Return (0x00)
                    }

                    Store (DAT0, Index (TBUF, 0x00))
                    Store (0x80, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                    Store (0x01, Local1)
                    While (LLess (Local1, DerefOf (Index (TBUF, 0x00))))
                    {
                        Store (0x0FA0, Local0)
                        While (LAnd (LNot (And (HSTS, 0x80)), Local0))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                        }

                        If (LNot (Local0))
                        {
                            KILL ()
                            Return (0x00)
                        }

                        Store (HBDR, Index (TBUF, Local1))
                        Store (0x80, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Increment (Local1)
                    }

                    If (COMP ())
                    {
                        Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                        Return (TBUF) /* \_SB_.PCI0.SBUS.SBLR.TBUF */
                    }

                    Return (0x00)
                }

                Method (STRT, 0, Serialized)
                {
                    Store (0xC8, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x40))
                        {
                            Decrement (Local0)
                            Sleep (0x01)
                            If (LEqual (Local0, 0x00))
                            {
                                Return (0x01)
                            }
                        }
                        Else
                        {
                            Store (0x00, Local0)
                        }
                    }

                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x01))
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                        Else
                        {
                            Return (0x00)
                        }
                    }

                    Return (0x01)
                }

                Method (COMP, 0, Serialized)
                {
                    Store (0x0FA0, Local0)
                    While (Local0)
                    {
                        If (And (HSTS, 0x02))
                        {
                            Return (0x01)
                        }
                        Else
                        {
                            Decrement (Local0)
                            Stall (0x32)
                            If (LEqual (Local0, 0x00))
                            {
                                KILL ()
                            }
                        }
                    }

                    Return (0x00)
                }

                Method (KILL, 0, Serialized)
                {
                    Or (HCON, 0x02, HCON) /* \_SB_.PCI0.SBUS.HCON */
                    Or (HSTS, 0xFF, HSTS) /* \_SB_.PCI0.SBUS.HSTS */
                }
            }

            Scope (\)
            {
                OperationRegion (THMR, SystemMemory, TBRB, 0xDC)
                Field (THMR, AnyAcc, Lock, Preserve)
                {
                    Offset (0x30), 
                    CTV1,   16, 
                    CTV2,   16, 
                    Offset (0x60), 
                    PTV,    8, 
                    Offset (0xD8), 
                    PCHT,   8, 
                    MCHT,   8
                }
            }

            Device (RP01)
            {
                Name (_ADR, 0x001C0000)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP01.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP01.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP01.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP01.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP01.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP01.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP01.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP01.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP01.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP01.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP01.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP01.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP01.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x13
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKD, 
                                0x00
                            }
                        })
                    }
                }
            }

            Device (RP02)
            {
                Name (_ADR, 0x001C0001)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP02.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP02.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP02.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP02.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP02.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP02.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP02.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP02.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP02.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP02.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP02.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP02.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP02.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x10
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKA, 
                                0x00
                            }
                        })
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Device (ECF0)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                    {
                        Return (^^_PRW) /* \_SB_.PCI0.RP02._PRW */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        Return (0x01)
                    }
                }

                Device (ECF1)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                }

                Device (ECF2)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                }

                Device (ECF3)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                }

                Device (ECF4)
                {
                    Name (_ADR, 0x04)  // _ADR: Address
                }

                Device (ECF5)
                {
                    Name (_ADR, 0x05)  // _ADR: Address
                }

                Device (ECF6)
                {
                    Name (_ADR, 0x06)  // _ADR: Address
                }

                Device (ECF7)
                {
                    Name (_ADR, 0x07)  // _ADR: Address
                }

                Scope (ECF0)
                {
                    Method (_EJD, 0, NotSerialized)  // _EJD: Ejection Dependent Device
                    {
                        Return ("\\_SB.PCI0.EHC1.RHUB.PRT0.HPT4")
                    }
                }
            }

            Device (RP03)
            {
                Name (_ADR, 0x001C0002)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP03.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP03.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP03.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP03.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP03.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP03.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP03.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP03.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP03.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP03.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP03.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP03.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP03.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x12
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x11
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKC, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKB, 
                                0x00
                            }
                        })
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
                Device (SMHC)
                {
                    OperationRegion (JMDE, PCI_Config, 0xAC, 0x10)
                    Field (JMDE, AnyAcc, NoLock, Preserve)
                    {
                            ,   6, 
                        D3EF,   1, 
                        Offset (0x01)
                    }

                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        If (\XOSI ("Windows 2009"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (One)
                        }
                    }
                }

                Device (MSHC)
                {
                    Name (_ADR, 0x01)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        If (\XOSI ("Windows 2009"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (One)
                        }
                    }
                }

                Device (XDCC)
                {
                    Name (_ADR, 0x02)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        If (\XOSI ("Windows 2009"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (One)
                        }
                    }
                }

                Device (I1C)
                {
                    Name (_ADR, 0x03)  // _ADR: Address
                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                    {
                        If (\XOSI ("Windows 2009"))
                        {
                            Return (Zero)
                        }
                        Else
                        {
                            Return (One)
                        }
                    }
                }
            }

            Device (RP04)
            {
                Name (_ADR, 0x001C0003)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP04.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP04.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP04.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP04.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP04.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP04.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP04.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP04.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP04.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP04.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP04.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP04.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP04.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    If (\GPIC)
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                0x00, 
                                0x13
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                0x00, 
                                0x10
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                0x00, 
                                0x11
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                0x00, 
                                0x12
                            }
                        })
                    }
                    Else
                    {
                        Return (Package (0x04)
                        {
                            Package (0x04)
                            {
                                0xFFFF, 
                                0x00, 
                                LNKD, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x01, 
                                LNKA, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x02, 
                                LNKB, 
                                0x00
                            }, 

                            Package (0x04)
                            {
                                0xFFFF, 
                                0x03, 
                                LNKC, 
                                0x00
                            }
                        })
                    }
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x05
                })
                Device (WNIC)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                    {
                        Return (^^_PRW) /* \_SB_.PCI0.RP04._PRW */
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }
                }
            }

            Device (RP05)
            {
                Name (_ADR, 0x001C0004)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP05.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP05.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP05.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP05.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP05.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP05.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP05.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP05.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP05.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP05.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP05.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP05.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP05.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP01._PRT ())
                }
            }

            Device (RP06)
            {
                Name (_ADR, 0x001C0005)  // _ADR: Address
                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP06.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP06.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP06.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP06.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP06.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP06.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP06.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP06.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP06.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP06.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP06.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP06.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP06.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP02._PRT ())
                }
            }

            Device (RP07)
            {
                Name (_ADR, 0x001C0006)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP7D))
                }

                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP07.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP07.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP07.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP07.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP07.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP07.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP07.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP07.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP07.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP07.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP07.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP07.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP07.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP03._PRT ())
                }

                Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
                {
                    0x09, 
                    0x04
                })
            }

            Device (RP08)
            {
                Name (_ADR, 0x001C0007)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP8D))
                }

                OperationRegion (PXCS, PCI_Config, 0x40, 0xC0)
                Field (PXCS, AnyAcc, NoLock, WriteAsZeros)
                {
                    Offset (0x12), 
                        ,   13, 
                    LASX,   1, 
                    Offset (0x1A), 
                    ABPX,   1, 
                        ,   2, 
                    PDCX,   1, 
                        ,   2, 
                    PDSX,   1, 
                    Offset (0x1B), 
                    LSCX,   1, 
                    Offset (0x20), 
                    Offset (0x22), 
                    PSPX,   1, 
                    Offset (0x98), 
                        ,   30, 
                    HPEX,   1, 
                    PMEX,   1, 
                        ,   30, 
                    HPSX,   1, 
                    PMSX,   1
                }

                Field (PXCS, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), 
                    Offset (0x03), 
                    SI,     1, 
                    Offset (0x10), 
                        ,   4, 
                    LD,     1, 
                    Offset (0x18), 
                    SCTL,   16, 
                    SSTS,   16, 
                    Offset (0x98), 
                        ,   30, 
                    HPCE,   1, 
                    PMCE,   1
                }

                Method (HPLG, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (HPSX)
                        {
                            Sleep (0x64)
                            If (PDCX)
                            {
                                Store (0x01, PDCX) /* \_SB_.PCI0.RP08.PDCX */
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP08.HPSX */
                                \_SB.SSMI (0x5D, 0x00, 0x00, 0x00, 0x00)
                                Notify (^, 0x00) // Bus Check
                            }
                            Else
                            {
                                Store (0x01, HPSX) /* \_SB_.PCI0.RP08.HPSX */
                            }
                        }
                    }
                }

                Method (PME, 0, Serialized)
                {
                    If (_STA ())
                    {
                        If (PSPX)
                        {
                            While (PSPX)
                            {
                                Store (0x01, PSPX) /* \_SB_.PCI0.RP08.PSPX */
                            }

                            Store (0x01, PMSX) /* \_SB_.PCI0.RP08.PMSX */
                            Notify (^, 0x02) // Device Wake
                        }
                    }
                }

                Method (OSC, 2, Serialized)
                {
                    If (_STA ())
                    {
                        Store (Arg0, HPCE) /* \_SB_.PCI0.RP08.HPCE */
                        If (Arg0)
                        {
                            And (SCTL, 0xFFC0, Local6)
                            If (SI)
                            {
                                Or (Local6, 0x01, Local6)
                            }

                            Store (Local6, SCTL) /* \_SB_.PCI0.RP08.SCTL */
                            Store (0x3F, SSTS) /* \_SB_.PCI0.RP08.SSTS */
                        }
                        Else
                        {
                            Store (0x01, ABPX) /* \_SB_.PCI0.RP08.ABPX */
                            Store (0x01, PDCX) /* \_SB_.PCI0.RP08.PDCX */
                            Store (0x01, HPSX) /* \_SB_.PCI0.RP08.HPSX */
                        }

                        Store (Arg1, PMCE) /* \_SB_.PCI0.RP08.PMCE */
                        If (LEqual (Arg1, 0x00))
                        {
                            Store (0x01, PMSX) /* \_SB_.PCI0.RP08.PMSX */
                        }
                    }
                }

                Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
                {
                    Return (^^RP04._PRT ())
                }

                Method (_PRW, 0, NotSerialized)  // _PRW: Power Resources for Wake
                {
                    Return (UPRW (0x09, 0x04))
                }
            }

            Method (POSC, 2, Serialized)
            {
                If (LOr (Arg1, LOr (And (Arg0, 0x01), And (Arg0, 
                    0x04))))
                {
                    XOr (And (Arg0, 0x01), 0x01, Local4)
                    XOr (And (ShiftRight (Arg0, 0x02), 0x01), 0x01, Local5)
                    \_SB.PCI0.RP01.OSC (Local4, Local5)
                    \_SB.PCI0.RP02.OSC (Local4, Local5)
                    If (LAnd (\_SB.PCI0.RP03.HPCE, 0x00))
                    {
                        \_SB.PCI0.RP03.OSC (Local4, Local5)
                    }
                    Else
                    {
                        \_SB.PCI0.RP03.OSC (0x01, Local5)
                    }

                    \_SB.PCI0.RP04.OSC (Local4, Local5)
                    \_SB.PCI0.RP05.OSC (Local4, Local5)
                    \_SB.PCI0.RP06.OSC (Local4, Local5)
                    \_SB.PCI0.RP07.OSC (Local4, Local5)
                    \_SB.PCI0.RP08.OSC (Local4, Local5)
                    Store (Local5, \_SB.PCI0.LPCB.BPEE)
                }
            }

            Device (B0D4)
            {
                Name (_ADR, 0x00040000)  // _ADR: Address
            }

            Scope (\)
            {
                Field (PMIO, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x22), 
                    GPIS,   16, 
                    Offset (0x2A), 
                    GPIE,   16, 
                    Offset (0x30), 
                    GSIE,   1, 
                    EOS,    1, 
                        ,   2, 
                    SSME,   1, 
                    SWSM,   1, 
                    Offset (0x34), 
                        ,   5, 
                    APMS,   1, 
                    Offset (0x38), 
                    AGSE,   16, 
                    AGSS,   16
                }

                Field (GPIO, ByteAcc, NoLock, Preserve)
                {
                    Offset (0x04), 
                    GPSL,   32, 
                    Offset (0x0C), 
                    GPL0,   32, 
                    Offset (0x2C), 
                    GIV,    32, 
                    Offset (0x38), 
                    GPL2,   32, 
                    Offset (0x48), 
                    GPL3,   32
                }
            }

            Method (GUPT, 1, NotSerialized)
            {
                And (Arg0, 0x0F, Local2)
                Store (0x06, Local1)
                If (LEqual (Arg0, 0x001D0003))
                {
                    Store (0x0A, Local0)
                    Return (Local0)
                }

                ShiftLeft (Local2, 0x01, Local0)
                If (LEqual (And (Arg0, 0x001A0000), 0x001A0000))
                {
                    Add (Local0, Local1, Local0)
                }

                Return (Local0)
            }

            Method (UPSW, 1, Serialized)
            {
                Store (0x01, Local0)
                ShiftRight (0x3C13, Arg0, Local1)
                And (Local1, 0x01, Local0)
                Return (Local0)
            }

            Method (\_SB.PCI0.GSWS, 1, NotSerialized)
            {
                While (APMS)
                {
                    Stall (0x01)
                }

                While (LNotEqual (SWSM, 0x01))
                {
                    Store (0x01, SWSM) /* \SWSM */
                }

                Store (0xF3, SSMP) /* \SSMP */
                Stall (0x32)
                While (APMS)
                {
                    Stall (0x01)
                }
            }

            Mutex (SMIM, 0x00)
            Name (SMIS, 0x00)
            Name (SMID, 0x00)
            Method (DSMI, 0, NotSerialized)
            {
                Acquire (SMIM, 0xFFFF)
                If (LEqual (SMID, 0x00))
                {
                    Store (0x00, GSIE) /* \GSIE */
                    Store (0x00, EOS) /* \EOS_ */
                }

                Increment (SMID)
                Release (SMIM)
            }

            Method (ESMI, 0, NotSerialized)
            {
                Acquire (SMIM, 0xFFFF)
                Decrement (SMID)
                If (LEqual (SMID, 0x00))
                {
                    Store (0x01, EOS) /* \EOS_ */
                    Store (0x01, GSIE) /* \GSIE */
                }

                Release (SMIM)
            }

            Alias (DSMI, \DSMI)
            Alias (ESMI, \ESMI)
            Name (PUID, Buffer (0x10)
            {
                /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
            })
            Name (XCNT, 0x00)
            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                CreateDWordField (Arg3, 0x00, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (\_SB.PCI0.XHC.CUID (Arg0))
                {
                    Return (\_SB.PCI0.XHC.POSC (Arg1, Arg2, Arg3))
                }
                Else
                {
                    If (LGreaterEqual (OSYS, 0x07DC))
                    {
                        If (LEqual (XCNT, 0x00))
                        {
                            \_SB.PCI0.XHC.XSEL ()
                            Increment (XCNT)
                        }
                    }
                }

                Store (Arg0, Local1)
                If (LEqual (\SRCP (Local1, PUID), 0x01))
                {
                    Store (CDW2, Local2)
                    Store (CDW3, Local3)
                    If (LNotEqual (And (Local2, 0x16), 0x16))
                    {
                        And (Local3, 0x1E, Local3)
                    }

                    And (Local3, 0x1D, Local3)
                    If (LNot (And (CDW1, 0x01)))
                    {
                        POSC (Local3, 0x01)
                        If (And (Local3, 0x10)) {}
                    }

                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    If (LNotEqual (CDW3, Local3))
                    {
                        Or (CDW1, 0x10, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    }

                    Store (Local3, CDW3) /* \_SB_.PCI0._OSC.CDW3 */
                    Store (Local3, OSCC) /* \OSCC */
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1) /* \_SB_.PCI0._OSC.CDW1 */
                    Return (Arg3)
                }
            }

            Method (ICST, 1, NotSerialized)
            {
                Store (0x0F, Local0)
                If (LEqual (Arg0, 0x01))
                {
                    Store (0x00, Local0)
                }

                Return (Local0)
            }

            Scope (RP01)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP1D))
                }
            }

            Scope (RP02)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP2D))
                }
            }

            Scope (RP03)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP3D))
                }
            }

            Scope (RP04)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP4D))
                }
            }

            Scope (RP05)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP5D))
                }
            }

            Scope (RP06)
            {
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (ICST (RP6D))
                }
            }

            Scope (HDEF)
            {
                Name (ASTA, 0x00)
                Name (ASTI, 0x00)
                PowerResource (APPR, 0x00, 0x0000)
                {
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (ASTA) /* \_SB_.PCI0.HDEF.ASTA */
                    }

                    Method (_ON, 0, NotSerialized)  // _ON_: Power On
                    {
                        Store (0x01, ASTA) /* \_SB_.PCI0.HDEF.ASTA */
                        Store (\_SB.PCI0.LPCB.EC0.SAST (0x01), ASTI) /* \_SB_.PCI0.HDEF.ASTI */
                    }

                    Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
                    {
                        Store (0x00, ASTA) /* \_SB_.PCI0.HDEF.ASTA */
                        Store (\_SB.PCI0.LPCB.EC0.SAST (0x00), ASTI) /* \_SB_.PCI0.HDEF.ASTI */
                    }
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    APPR
                })
            }

            Scope (LPCB)
            {
                OperationRegion (LPC2, PCI_Config, 0x80, 0x3C)
                Field (LPC2, AnyAcc, NoLock, Preserve)
                {
                    CMAD,   3, 
                        ,   1, 
                    CMBD,   3, 
                    Offset (0x01), 
                    LPDC,   2, 
                        ,   2, 
                    FDDC,   1, 
                    Offset (0x02), 
                    CALE,   1, 
                    CBLE,   1, 
                    LLPE,   1, 
                    FDLE,   1, 
                    Offset (0x08), 
                    G2DC,   16, 
                    G2MK,   8, 
                    Offset (0x20), 
                        ,   10, 
                    BPEE,   1, 
                    Offset (0x38), 
                    GPRO,   32
                }

                Name (CDC, Package (0x08)
                {
                    0x03F8, 
                    0x02F8, 
                    0x0220, 
                    0x0228, 
                    0x0238, 
                    0x02E8, 
                    0x0338, 
                    0x03E8
                })
                Name (LPD, Package (0x03)
                {
                    0x0378, 
                    0x0278, 
                    0x03BC
                })
                Method (\_SB.PCI0.LPCB.SMAB, 3, Serialized)
                {
                    If (LEqual (And (Arg0, 0x01), 0x00))
                    {
                        Store (0x01, Local0)
                        Store (\_SB.PCI0.SBUS.SWRB (Arg0, Arg1, Arg2), Local1)
                        If (Local1)
                        {
                            Store (0x00, Local0)
                        }
                    }
                    Else
                    {
                        Store (\_SB.PCI0.SBUS.SRDB (Arg0, Arg1), Local0)
                    }

                    Return (Local0)
                }

                Method (DCS, 3, NotSerialized)
                {
                    Store (0x00, Local1)
                    Store (Match (Arg0, MEQ, Arg1, MTR, 0x00, 0x00), Local0)
                    If (LNotEqual (Local0, Ones))
                    {
                        ShiftLeft (Local0, Arg2, Local1)
                    }

                    Return (Local1)
                }

                Method (DPD, 2, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x00, FDLE) /* \_SB_.PCI0.LPCB.FDLE */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (0x00, LLPE) /* \_SB_.PCI0.LPCB.LLPE */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (0x00, CALE) /* \_SB_.PCI0.LPCB.CALE */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (0x00, CBLE) /* \_SB_.PCI0.LPCB.CBLE */
                                    And (G2DC, Not (0x01), G2DC) /* \_SB_.PCI0.LPCB.G2DC */
                                }
                            }
                        }
                    }
                }

                Method (EPD, 3, Serialized)
                {
                    If (LEqual (Arg0, 0x00))
                    {
                        Store (0x00, Local0)
                        If (LEqual (Arg1, 0x0370))
                        {
                            Store (0x01, Local0)
                        }

                        Store (Local0, FDDC) /* \_SB_.PCI0.LPCB.FDDC */
                        Store (0x01, FDLE) /* \_SB_.PCI0.LPCB.FDLE */
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (DCS (LPD, Arg1, 0x00), LPDC) /* \_SB_.PCI0.LPCB.LPDC */
                            Store (0x01, LLPE) /* \_SB_.PCI0.LPCB.LLPE */
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x02))
                            {
                                Store (DCS (CDC, Arg1, 0x00), CMAD) /* \_SB_.PCI0.LPCB.CMAD */
                                Store (0x01, CALE) /* \_SB_.PCI0.LPCB.CALE */
                            }
                            Else
                            {
                                If (LEqual (Arg0, 0x03))
                                {
                                    Store (DCS (CDC, Arg1, 0x00), CMBD) /* \_SB_.PCI0.LPCB.CMBD */
                                    Store (0x01, CBLE) /* \_SB_.PCI0.LPCB.CBLE */
                                    Store (0x0C, G2MK) /* \_SB_.PCI0.LPCB.G2MK */
                                    Or (Arg2, 0x01, G2DC) /* \_SB_.PCI0.LPCB.G2DC */
                                }
                            }
                        }
                    }
                }

                Method (CFG, 5, Serialized)
                {
                    If (LEqual (Arg1, 0x00))
                    {
                        ^DPD (Arg0, Arg2)
                    }
                    Else
                    {
                        ^EPD (Arg0, Arg1, Arg2)
                    }
                }
            }

            Device (ACEL)
            {
                Name (_HID, EisaId ("HPQ6000"))  // _HID: Hardware ID
                Name (DEPT, 0xFF)
                Name (CTST, 0xFF)
                Method (_INI, 0, NotSerialized)  // _INI: Initialize
                {
                    ITAL ()
                }

                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000017,
                    }
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (LEqual (DEPT, 0xFF))
                    {
                        Store (0x0F, Local0)
                        Store (ALRD (0x20), Local1)
                        If (And (Local1, 0xFF00))
                        {
                            If (LNotEqual (Local1, 0xECAB))
                            {
                                Store (0x00, Local0)
                            }
                        }

                        Store (Local0, DEPT) /* \_SB_.PCI0.ACEL.DEPT */
                    }

                    Return (DEPT) /* \_SB_.PCI0.ACEL.DEPT */
                }

                Method (ITAL, 0, Serialized)
                {
                    If (_STA ())
                    {
                        ALWR (0x20, 0x5F)
                        ALWR (0x21, 0x22)
                        ALWR (0x32, 0x16)
                        ALWR (0x33, 0x02)
                        ALWR (0x30, 0x95)
                        ALWR (0x36, 0x13)
                        ALWR (0x37, 0x01)
                        ALWR (0x34, 0x0A)
                        Store (0xFF, CTST) /* \_SB_.PCI0.ACEL.CTST */
                        AJAL ()
                    }
                }

                Method (AJAL, 0, Serialized)
                {
                    If (_STA ())
                    {
                        Store (\_SB.PCI0.LPCB.EC0.GACS (), Local0)
                        If (LAnd (LEqual (\_SB.LID._LID (), 0x00), LEqual (Local0, 0x00)))
                        {
                            If (LNotEqual (CTST, 0x01))
                            {
                                Store (0x01, CTST) /* \_SB_.PCI0.ACEL.CTST */
                                ALWR (0x22, 0x60)
                            }
                        }
                        Else
                        {
                            If (LNotEqual (CTST, 0x00))
                            {
                                Store (0x00, CTST) /* \_SB_.PCI0.ACEL.CTST */
                                ALWR (0x22, 0x40)
                            }
                        }
                    }
                }

                Method (CLRI, 0, Serialized)
                {
                    Store (0x00, Local2)
                    If (LEqual (\_SB.PCI0.LPCB.EC0.GACS (), 0x00))
                    {
                        Store (0x04, Local0)
                        Store (0x04, Local1)
                        If (LEqual (\_SB.BAT0._STA (), 0x1F))
                        {
                            Store (DerefOf (Index (DerefOf (Index (NBST, 0x00)), 0x00)), 
                                Local0)
                        }

                        If (LEqual (\_SB.BAT1._STA (), 0x1F))
                        {
                            Store (DerefOf (Index (DerefOf (Index (NBST, 0x01)), 0x00)), 
                                Local1)
                        }

                        And (Local0, Local1, Local0)
                        If (And (Local0, 0x04))
                        {
                            Store (0x01, Local2)
                        }
                    }

                    Return (Local2)
                }

                Method (ALRD, 1, Serialized)
                {
                    Store (\_SB.PCI0.LPCB.EC0.ECAB (0x01, 0x01, Arg0, 0x00), Local0)
                    Return (Local0)
                }

                Method (ALWR, 2, Serialized)
                {
                    Store (\_SB.PCI0.LPCB.EC0.ECAB (0x01, 0x00, Arg0, Arg1), Local0)
                    Return (Local0)
                }

                Method (ALID, 1, Serialized)
                {
                    Return (\_SB.LID._LID ())
                }

                Method (ADSN, 0, Serialized)
                {
                    Store (HDDS, Local0)
                    Store (0x00, Local0)
                    Return (Local0)
                }
            }

            Method (_PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (GPIC)
                {
                    Return (Package (0x1A)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            0x00, 
                            0x15
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x00, 
                            0x00, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x01, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            0x00, 
                            0x12
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            0x00, 
                            0x13
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            0x00, 
                            0x10
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            0x00, 
                            0x11
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            0x00, 
                            0x12
                        }
                    })
                }
                Else
                {
                    Return (Package (0x1A)
                    {
                        Package (0x04)
                        {
                            0x0001FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0002FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0019FFFF, 
                            0x00, 
                            LNKE, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001AFFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001BFFFF, 
                            0x00, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x00, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x01, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001CFFFF, 
                            0x03, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001DFFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x00, 
                            LNKF, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x01, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x001FFFFF, 
                            0x03, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x01, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0016FFFF, 
                            0x03, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x00, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x01, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x02, 
                            LNKC, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0004FFFF, 
                            0x03, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            LNKD, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            LNKA, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            LNKB, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            LNKC, 
                            0x00
                        }
                    })
                }
            }

            Method (PCIB._PRT, 0, NotSerialized)  // _PRT: PCI Routing Table
            {
                If (GPIC)
                {
                    Return (Package (0x06)
                    {
                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            0x00, 
                            0x14
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x04, 
                            0x00, 
                            0x16
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x05, 
                            0x00, 
                            0x16
                        }
                    })
                }
                Else
                {
                    Return (Package (0x06)
                    {
                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x00, 
                            LNKE, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x01, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x02, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x03, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x04, 
                            LNKG, 
                            0x00
                        }, 

                        Package (0x04)
                        {
                            0x0006FFFF, 
                            0x05, 
                            LNKG, 
                            0x00
                        }
                    })
                }
            }

            Field (GPIO, ByteAcc, NoLock, Preserve)
            {
                Offset (0x0C), 
                Offset (0x0C), 
                GLEP,   1
            }

            Scope (RP06)
            {
                Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                {
                    Store (Package (0x02)
                        {
                            0x09, 
                            0x05
                        }, Local0)
                    If (WOLD)
                    {
                        Store (0x00, Index (Local0, 0x01))
                    }

                    Return (Local0)
                }

                OperationRegion (NPCI, PCI_Config, 0x19, 0x01)
                Field (NPCI, ByteAcc, NoLock, Preserve)
                {
                    BUSN,   8
                }

                Method (GADD, 0, Serialized)
                {
                    Store (BUSN, Local0)
                    ShiftLeft (Local0, 0x14, Local0)
                    Add (0xE0000000, Local0, Local1)
                    Return (Local1)
                }

                Device (NIC)
                {
                    Name (_ADR, 0x00)  // _ADR: Address
                    Method (_PRW, 0, Serialized)  // _PRW: Power Resources for Wake
                    {
                        Return (^^_PRW ())
                    }

                    Method (EJ0, 0, NotSerialized)
                    {
                        Sleep (0x0A)
                        Store (0x00, GLEP) /* \_SB_.PCI0.GLEP */
                    }

                    Method (LPON, 0, NotSerialized)
                    {
                        Store (CondRefOf (\_GPE._L1C, Local0), Local1)
                        Return (Local1)
                    }

                    Method (_PLD, 0, Serialized)  // _PLD: Physical Location of Device
                    {
                        Return (EPLD) /* \EPLD */
                    }

                    OperationRegion (PCIR, PCI_Config, 0x0C, 0x01)
                    Field (PCIR, AnyAcc, NoLock, Preserve)
                    {
                        CLSZ,   8
                    }
                }
            }

            Scope (\_GPE)
            {
                Name (CBID, 0x00)
                Method (L1C, 0, NotSerialized)
                {
                    Sleep (0x64)
                    If (LEqual (CBID, 0x01))
                    {
                        HNLP (0x1000)
                        Store (GIV, Local0)
                        XOr (Local0, 0x1000, GIV) /* \GIV_ */
                        Store (0x00, CBID) /* \_GPE.CBID */
                    }
                    Else
                    {
                        Increment (CBID)
                    }
                }

                Method (HNLP, 1, Serialized)
                {
                    If (\_SB.PCI0.RP06.NIC.LPON ())
                    {
                        If (NNST ())
                        {
                            INIC ()
                        }
                        Else
                        {
                            If (\_SB.PCI0.GLEP)
                            {
                                If (ILUX)
                                {
                                    Notify (\_SB.PCI0.RP06.NIC, 0x03) // Eject Request
                                }
                                Else
                                {
                                    \_SB.PCI0.RP06.NIC.EJ0 ()
                                }
                            }
                        }

                        Sleep (0x64)
                        Notify (\_SB.PCI0.RP06, 0x00) // Bus Check
                    }
                }

                Method (NNST, 0, Serialized)
                {
                    Store (GPL0, Local1)
                    Store (0x01, Local3)
                    If (And (Local1, 0x2000))
                    {
                        If (LEqual (\_SB.PCI0.LPCB.EC0.GACS (), 0x00))
                        {
                            If (And (Local1, 0x1000))
                            {
                                Store (0x00, Local3)
                            }
                        }
                    }

                    Return (Local3)
                }

                Method (INIC, 0, Serialized)
                {
                    OperationRegion (NPC2, SystemMemory, \_SB.PCI0.RP06.GADD (), 0x02)
                    Field (NPC2, AnyAcc, NoLock, Preserve)
                    {
                        VEID,   16
                    }

                    Store (0x0B, Local1)
                    Store (0x01, Local3)
                    If (\_SB.PCI0.GLEP)
                    {
                        If (LEqual (VEID, 0x11AB))
                        {
                            Store (0x00, Local1)
                            Store (0x00, Local3)
                        }
                    }

                    Store (\_SB.PCI0.RP06.HPCE, Local2)
                    While (LAnd (LGreater (Local1, 0x00), NNST ()))
                    {
                        Store (0x01, \_SB.PCI0.GLEP)
                        Sleep (0x012C)
                        Store (VEID, Local0)
                        If (LOr (LEqual (Local0, 0x11AB), LEqual (Local1, 0x01)))
                        {
                            Store (0x00, Local1)
                        }
                        Else
                        {
                            Store (0x00, \_SB.PCI0.GLEP)
                            Sleep (0xC8)
                            Decrement (Local1)
                        }
                    }

                    Store (Local2, \_SB.PCI0.RP06.HPCE)
                    If (Local3)
                    {
                        \_SB.SSMI (0xEA3E, 0x00, 0x00, 0x00, 0x00)
                    }

                    If (LEqual (\WCOS (), 0x03))
                    {
                        Store (0x10, \_SB.PCI0.RP06.NIC.CLSZ)
                    }
                }
            }
        }

        Name (NBTI, Package (0x02)
        {
            Package (0x0D)
            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x00, 
                0x00, 
                0x64, 
                0x64, 
                "Primary", 
                "100000", 
                "LIon", 
                "Hewlett-Packard"
            }, 

            Package (0x0D)
            {
                0x01, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                0x01, 
                0xFFFFFFFF, 
                0x00, 
                0x00, 
                0x64, 
                0x64, 
                "Travel", 
                "100000", 
                "LIon", 
                "Hewlett-Packard"
            }
        })
        Name (NBST, Package (0x02)
        {
            Package (0x04)
            {
                0x00, 
                0x00, 
                0x0FA0, 
                0x04B0
            }, 

            Package (0x04)
            {
                0x00, 
                0x00, 
                0x0FA0, 
                0x04B0
            }
        })
        Name (NDBS, Package (0x04)
        {
            0x00, 
            0x00, 
            0x0FA0, 
            0x04B0
        })
        Name (ACST, 0x01)
        Name (SMAR, 0x00)
        Name (BT0P, 0x0F)
        Method (BTIF, 1, Serialized)
        {
            Store (\_SB.PCI0.LPCB.EC0.BTIF (Arg0), Local0)
            If (LEqual (Local0, 0xFF))
            {
                Return (Package (0x0D)
                {
                    0x00, 
                    0xFFFFFFFF, 
                    0xFFFFFFFF, 
                    0x01, 
                    0xFFFFFFFF, 
                    0x00, 
                    0x00, 
                    0x00, 
                    0x00, 
                    "", 
                    "", 
                    "", 
                    0x00
                })
            }
            Else
            {
                Return (DerefOf (Index (NBTI, Arg0)))
            }
        }

        Name (NFBS, 0x01)
        Method (BTST, 1, Serialized)
        {
            Store (NFBS, Local1)
            If (NFBS)
            {
                Store (0x00, NFBS) /* \_SB_.NFBS */
            }

            Store (\_SB.PCI0.LPCB.EC0.BTST (Arg0, Local1), Local0)
            Return (DerefOf (Index (NBST, Arg0)))
        }

        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Store (\_SB.PCI0.LPCB.EC0.BSTA (0x01), Local0)
                If (XOr (BT0P, Local0))
                {
                    Store (Local0, BT0P) /* \_SB_.BT0P */
                    Store (Local0, Local1)
                    If (LNotEqual (Local1, 0x1F))
                    {
                        Store (0x00, Local1)
                    }

                    \_SB.SSMI (0xEA3A, 0x00, Local1, 0x00, 0x00)
                    Store (ECX, Local1)
                    \_GPE.HWWP (0x01)
                    \_SB.PCI0.LPCB.EC0.HWWP (Local1)
                    \_SB.WMID.WGWE (0x05, 0x00)
                }

                Return (Local0)
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (BTIF (0x00))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Return (BTST (0x00))
            }

            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
        }

        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))  // _HID: Hardware ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x00)
            }

            Method (_BIF, 0, NotSerialized)  // _BIF: Battery Information
            {
                Return (BTIF (0x01))
            }

            Method (_BST, 0, NotSerialized)  // _BST: Battery Status
            {
                Return (BTST (0x01))
            }

            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
        }

        Device (AC)
        {
            Name (_HID, "ACPI0003")  // _HID: Hardware ID
            Name (_PCL, Package (0x01)  // _PCL: Power Consumer List
            {
                \_SB
            })
            Method (_PSR, 0, NotSerialized)  // _PSR: Power Source
            {
                Store (\_SB.PCI0.LPCB.EC0.GACS (), Local0)
                Store (Local0, PWRS) /* \PWRS */
                Store (\_SB.PCI0.LPCB.EC0.GPID (), Local1)
                If (XOr (Local0, ACST))
                {
                    \_GPE.HNLP (0x00)
                    \_SB.PCI0.ACEL.AJAL ()
                    \_GPE.VPUP (Local0, Local1)
                    \_SB.PCI0.LPCB.EC0.SMCP (Local0)
                }

                If (LOr (LAnd (Local0, LNot (ACST)), LAnd (Local1, LNot (SMAR))))
                {
                    \_SB.WMID.WGWE (0x03, 0x00)
                }

                Store (Local0, ACST) /* \_SB_.ACST */
                Store (Local1, SMAR) /* \_SB_.SMAR */
                Return (Local0)
            }
        }

        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))  // _HID: Hardware ID
        }

        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))  // _HID: Hardware ID
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Store (\_SB.PCI0.LPCB.EC0.CLID, Local0)
                Return (Local0)
            }
        }

        Device (HST1)
        {
            Name (_HID, EisaId ("PNP0C32"))  // _HID: Hardware ID
            Name (_UID, 0x01)  // _UID: Unique ID
            Name (HS1S, 0xFF)
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                If (LEqual (HS1S, 0xFF))
                {
                    Store (0x00, Local0)
                    If (LGreaterEqual (\WCOS (), 0x06))
                    {
                        If (ISUD ())
                        {
                            Store (0x0F, Local0)
                        }
                    }

                    Store (Local0, HS1S) /* \_SB_.HST1.HS1S */
                }

                Return (HS1S) /* \_SB_.HST1.HS1S */
            }

            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x0A, 
                0x05
            })
            Method (_PSW, 1, NotSerialized)  // _PSW: Power State Wake
            {
                \_SB.PCI0.LPCB.EC0.HSPW (Arg0, 0x01)
            }

            Method (GHID, 0, Serialized)
            {
                If (_STA ())
                {
                    If (\_SB.PCI0.LPCB.EC0.CHSW (0x01))
                    {
                        Notify (\_SB.HST1, 0x02) // Device Wake
                    }
                }

                Return (Buffer (0x01)
                {
                     0x01
                })
            }
        }

        Name (WSIP, Buffer (0x09)
        {
            /* 0000 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0008 */   0xFF
        })
        Name (SUIP, Buffer (0x09)
        {
            /* 0000 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0008 */   0xFF
        })
        Name (BSOL, Package (0x02)
        {
            Package (0x1D)
            {
                "Legacy Boot Order", 
                " Optical Disk Drive, Notebook Hard Drive, USB Floppy, USB CD-ROM, USB Hard Drive, Notebook Ethernet, SD Card, , , , , , , , , ,", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0104, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x09, 
                " Optical Disk Drive ", 
                " Notebook Hard Drive ", 
                " USB Floppy ", 
                " USB CD-ROM ", 
                " USB Hard Drive ", 
                " Notebook Ethernet ", 
                " SD Card ", 
                " Dock Upgrade Bay", 
                " eSATA Drive", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " "
            }, 

            Package (0x1D)
            {
                "UEFI Boot Order", 
                " Notebook Upgrade Bay, OS Boot Manager, Notebook IPV4 Ethernet, Notebook IPV6 Ethernet, USB Hard Drive, SD Card Boot, HP Hypervisor, Generic USB Device, Customized Boot, , , , , , , ,", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0143, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x09, 
                " Notebook Upgrade Bay", 
                " OS Boot Manager", 
                " Notebook IPV4 Ethernet", 
                " Notebook IPV6 Ethernet", 
                " USB Hard Drive", 
                " SD Card Boot", 
                " HP Hypervisor", 
                " Generic USB Device", 
                " Customized Boot", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " "
            }
        })
        Name (RMBI, Package (0x09)
        {
            Package (0x02)
            {
                0x01, 
                " Optical Disk Drive "
            }, 

            Package (0x02)
            {
                0x02, 
                " Notebook Hard Drive "
            }, 

            Package (0x02)
            {
                0x03, 
                " USB Floppy "
            }, 

            Package (0x02)
            {
                0x05, 
                " USB CD-ROM "
            }, 

            Package (0x02)
            {
                0x06, 
                " USB Hard Drive "
            }, 

            Package (0x02)
            {
                0x07, 
                " Notebook Ethernet "
            }, 

            Package (0x02)
            {
                0x08, 
                " SD Card "
            }, 

            Package (0x02)
            {
                0x0A, 
                " Dock Upgrade Bay "
            }, 

            Package (0x02)
            {
                0x0B, 
                " eSATA Drive "
            }
        })
        Name (UEBL, Package (0x09)
        {
            Package (0x02)
            {
                0x01, 
                " Notebook Upgrade Bay"
            }, 

            Package (0x02)
            {
                0x02, 
                " OS Boot Manager"
            }, 

            Package (0x02)
            {
                0x03, 
                " Notebook IPV4 Ethernet"
            }, 

            Package (0x02)
            {
                0x04, 
                " Notebook IPV6 Ethernet"
            }, 

            Package (0x02)
            {
                0x06, 
                " USB Hard Drive"
            }, 

            Package (0x02)
            {
                0x07, 
                " Generic USB Device"
            }, 

            Package (0x02)
            {
                0x09, 
                " SD Card Boot"
            }, 

            Package (0x02)
            {
                0x0B, 
                " HP Hypervisor"
            }, 

            Package (0x02)
            {
                0x0D, 
                " Customized Boot"
            }
        })
        Name (CRBI, Package (0x09)
        {
            " Boot Device 1", 
            " Boot Device 2", 
            " Boot Device 3", 
            " Boot Device 5", 
            " Boot Device 6", 
            " Boot Device 7", 
            " Boot Device 8", 
            " ", 
            " "
        })
        Name (CUBO, Package (0x09)
        {
            " UEFI Boot Device 1", 
            " UEFI Boot Device 2", 
            " UEFI Boot Device 3", 
            " UEFI Boot Device 4", 
            " UEFI Boot Device 5", 
            " UEFI Boot Device 6", 
            " UEFI Boot Device 7", 
            " UEFI Boot Device 8", 
            " UEFI Boot Device 9"
        })
        Name (FLAG, 0x05)
        Name (PCHG, 0x00)
        Name (DVAL, 0x00)
        Name (VFSZ, 0x00)
        Name (PCBF, Buffer (0x0190) {})
        Name (WSPS, Buffer (0x3F) {})
        Name (WNWP, Buffer (0x3F) {})
        Name (WPPS, Buffer (0x3F) {})
        Name (WNPP, Buffer (0x3F) {})
        Name (WTB2, Buffer (0xC8) {})
        Name (BUFU, Buffer (0x21) {})
        Name (WTB3, Buffer (0x12) {})
        Name (WTB4, Buffer (0x28) {})
        Name (WBOR, Buffer (0x09) {})
        Name (BOID, Buffer (0x64)
        {
            /* 0000 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0008 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0018 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0020 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0028 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0030 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0038 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0040 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0048 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0050 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0058 */   0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,
            /* 0060 */   0xFF, 0xFF, 0xFF, 0xFF
        })
        Name (TEMP, Buffer (0x32) {})
        Name (ST01, Buffer (0x64) {})
        Name (STG0, Buffer (0x1E) {})
        Name (STG1, Buffer (0x1E) {})
        Name (ST02, Buffer (0xA2) {})
        Name (WATS, Buffer (0x12) {})
        Name (WONT, Buffer (0x50) {})
        Name (ST03, Buffer (0x32) {})
        Name (ST14, Buffer (0x32) {})
        Name (BF01, Buffer (0x32) {})
        Name (BVAL, Buffer (0x0190) {})
        Name (TM03, Buffer (0x1E) {})
        Name (ST06, "Enable")
        Name (ST07, "Disable")
        Name (ST11, Buffer (0x96) {})
        Name (WHVV, Buffer (0x20) {})
        Name (WHVC, Buffer (0x40) {})
        Name (WCBT, Buffer (0x3B) {})
        Name (WETD, Buffer (0x0B) {})
        Name (VIEW, "View")
        Name (CHGE, "Change")
        Name (HIDE, "Hide")
        Name (DFLT, "Default")
        Name (ONON, "On")
        Name (OFOF, "Off")
        Name (UNLK, "Unlock")
        Name (LLCK, "Lock")
        Name (NOIN, "Information Not Available")
        Name (YESY, "Yes")
        Name (NONO, "No")
        Name (BF2S, "                                                                                                                                                            ")
        Name (BB2S, "                                                                                                                                                                                                                                                                                               ")
        Name (BOIN, Buffer (0x1000) {})
        Name (WLNF, Buffer (0xA2) {})
        Name (TATM, Buffer (0x05) {})
        Name (TPCD, Buffer (0x40) {})
        Name (TPFB, Buffer (0xC8) {})
        Name (TURL, Buffer (0x82) {})
        Name (TBUF, Buffer (0x22) {})
        Name (TSKU, Buffer (0x10) {})
        Name (TBCT, Buffer (0x0F) {})
        Name (TOA3, Buffer (0x64) {})
        Name (TROS, Package (0x1B)
        {
            "Manufacturer", 
            "Processor Type", 
            "Processor Speed", 
            "Total Memory Size", 
            "BIOS Date", 
            "System BIOS Version", 
            "Video BIOS Revision", 
            "Keyboard Controller Version", 
            "Hard Disk Serial Number", 
            "Hard Disk Make and Model", 
            "Completion Date", 
            "Completion Status", 
            "Write Cycles Completed", 
            "Warranty Start Date", 
            "System Board ID", 
            "Primary Battery Serial Number", 
            "Secondary Battery Serial Number", 
            "Bluetooth FCC ID", 
            "WLAN FCC ID", 
            "WWAN FCC ID", 
            "GPS FCC ID", 
            "MicroCode Revision", 
            "Universally Unique Identifier (UUID)", 
            "Memory Slot 1 Information", 
            "Memory Slot 2 Information", 
            "Memory Slot 3 Information", 
            "Memory Slot 4 Information"
        })
        Name (MPMS, Package (0x06)
        {
            "System Configuration ID", 
            "Product Name", 
            "Serial Number", 
            "SKU Number", 
            "System Board CT", 
            "Product Family"
        })
        Name (MPMI, Buffer (0x01)
        {
             0x01
        })
        Name (BISE, Package (0xFD)
        {
            Package (0x10)
            {
                "Serial port", 
                "", 
                "\\System Configuration\\Port Options", 
                0x00, 
                0x01, 
                0x00, 
                0x64, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Parallel port", 
                "", 
                "\\System Configuration\\Port Options", 
                0x00, 
                0x01, 
                0x00, 
                0x67, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "CD-ROM boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xDC, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Floppy boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xE6, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "USB legacy support", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x012D, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "PXE Internal NIC boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xF0, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Fan Always on while on AC Power", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0130, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Flash media reader", 
                "", 
                "\\System Configuration\\Port Options", 
                0x00, 
                0x01, 
                0x00, 
                0x68, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x16)
            {
                "Startup Menu Delay (Sec.)", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xC8, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "0", 
                0x08, 
                "0", 
                "5", 
                "10", 
                "15", 
                "20", 
                "25", 
                "30", 
                "35"
            }, 

            Package (0x12)
            {
                "Parallel port mode", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x012E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "EPP", 
                0x04, 
                "EPP", 
                "Bidirectional", 
                "Standard", 
                "ECP"
            }, 

            Package (0x16)
            {
                "Multiboot Express Popup Delay(Sec)", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xD7, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "0", 
                0x08, 
                "0", 
                "5", 
                "10", 
                "15", 
                "20", 
                "25", 
                "30", 
                "35"
            }, 

            Package (0x10)
            {
                "LAN/WLAN Switching", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0208, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Embedded Bluetooth Device", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01FE, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Embedded WLAN Device", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01F5, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Embedded WWAN Device", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01F4, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Data Execution Prevention", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0132, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "SATA Device Mode", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0134, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "AHCI", 
                0x02, 
                "IDE", 
                "AHCI"
            }, 

            Package (0x10)
            {
                "USB Port", 
                "", 
                "\\System Configuration\\Port Options", 
                0x00, 
                0x01, 
                0x00, 
                0x69, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Multi Core CPU", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0135, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x11)
            {
                "Wake on LAN", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x021C, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Boot to Network", 
                0x03, 
                "Disable", 
                "Boot to Network", 
                "Follow Boot Order"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "TPM Activation Policy", 
                "", 
                "\\Security\\TPM Embedded Security", 
                0x00, 
                0x00, 
                0x00, 
                0x0289, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'TPM Device\' AND CurrentValue=\'Available\'", 
                " ", 
                0x03, 
                "F1 to Boot", 
                0x03, 
                "F1 to Boot", 
                "Allow user to reject", 
                "No prompts"
            }, 

            Package (0x10)
            {
                "Fingerprint Device", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01F6, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Optical Disk Drive", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01F7, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Embedded LAN Controller", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01F8, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Virtualization Technology (VTx)", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x013A, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x03, 
                "Disable", 
                "Enable", 
                "Reset to default"
            }, 

            Package (0x10)
            {
                "SOL Terminal Emulation Mode", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02BD, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "ANSI", 
                0x02, 
                "VT100", 
                "ANSI"
            }, 

            Package (0x10)
            {
                "Firmware Verbosity", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02BD, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Firmware Progress Event Support", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02C2, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Unconfigure AMT on next boot", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02C0, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Integrated Camera", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01FA, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Custom Logo", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xC9, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "SD Card boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xE1, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP QuickLook", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0137, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Wireless Button State", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01F3, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Modem Device", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x01FF, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "At least one symbol required", 
                "", 
                "\\Security\\Administrator Tools\\Password Policy", 
                0x00, 
                0x01, 
                0x00, 
                0x0296, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "No", 
                0x02, 
                "No", 
                "Yes"
            }, 

            Package (0x10)
            {
                "At least one number required", 
                "", 
                "\\Security\\Administrator Tools\\Password Policy", 
                0x00, 
                0x01, 
                0x00, 
                0x0297, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "No", 
                0x02, 
                "No", 
                "Yes"
            }, 

            Package (0x10)
            {
                "At least one upper case character required", 
                "", 
                "\\Security\\Administrator Tools\\Password Policy", 
                0x00, 
                0x01, 
                0x00, 
                0x0298, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "No", 
                0x02, 
                "No", 
                "Yes"
            }, 

            Package (0x10)
            {
                "At least one lower case character required", 
                "", 
                "\\Security\\Administrator Tools\\Password Policy", 
                0x00, 
                0x01, 
                0x00, 
                0x0299, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "No", 
                0x02, 
                "No", 
                "Yes"
            }, 

            Package (0x10)
            {
                "Are spaces allowed in password", 
                "", 
                "\\Security\\Administrator Tools\\Password Policy", 
                0x00, 
                0x01, 
                0x00, 
                0x029B, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "No", 
                0x02, 
                "No", 
                "Yes"
            }, 

            Package (0x10)
            {
                "Fingerprint Reset on Reboot (If Present)", 
                "", 
                "\\Security\\Administrator Tools", 
                0x00, 
                0x01, 
                0x00, 
                0x029D, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP SpareKey", 
                "", 
                "\\Security\\Administrator Tools", 
                0x00, 
                0x01, 
                0x00, 
                0x029A, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Trusted Execution Technology (TXT)", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x01, 
                0x00, 
                0x00, 
                0x013D, 
                0x03, 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'TPM Device\' AND CurrentValue=\'Available\'", 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'Virtualization Technology (VTx)\' AND CurrentValue=\'Enable\'", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Display Diagnostic URL", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0105, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Smart Card", 
                "", 
                "\\System Configuration\\Port Options", 
                0x00, 
                0x01, 
                0x00, 
                0x6C, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Always Prompt for HP SpareKey Enrollment", 
                "", 
                "\\Security\\Administrator Tools", 
                0x00, 
                0x01, 
                0x00, 
                0x029E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'HP SpareKey\' AND CurrentValue=\'Enable\' ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "USB Key Provisioning Support", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02C1, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "AMT Setup Prompt(Ctrl-P)", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02C3, 
                0x03, 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'Firmware Verbosity\' AND CurrentValue=\'Enable\'", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Bypass Power-on password on restart", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x00, 
                0x00, 
                0x02C4, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Microphone", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0200, 
                0x03, 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'Audio Device\' AND CurrentValue=\'Enable\'", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x1C)
            {
                "Language", 
                " *English, Francais, Deutsch, Espanol, Italiano, Dansk, Nederlands, Suomi, Japanese, Norsk, Portugues, Svenska, Simplified Chinese, Traditional Chinese", 
                "\\System Configuration", 
                0x00, 
                0x01, 
                0x00, 
                0x79, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "English", 
                0x0E, 
                "English", 
                "Francais", 
                "Deutsch", 
                "Espanol", 
                "Italiano", 
                "Dansk", 
                "Nederlands", 
                "Suomi", 
                "Japanese", 
                "Norsk", 
                "Portugues", 
                "Svenska", 
                "Simplified Chinese", 
                "Traditional Chinese"
            }, 

            Package (0x10)
            {
                "NumLock on at boot", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x013B, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Preboot authentication on HP QuickLook Boot", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0138, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Initiate Intel CIRA", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02C5, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Intel (R) Anti-Theft", 
                "", 
                "\\Security\\Anti Theft", 
                0x00, 
                0x01, 
                0x00, 
                0x029C, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Power Monitor Circuit", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x013E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Speakers and Headphones", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0208, 
                0x03, 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'Audio Device\' AND CurrentValue=\'Enable\'", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Audio Device", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0209, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                "", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "eSATA Port", 
                "", 
                "\\System Configuration\\Port Options", 
                0x00, 
                0x01, 
                0x00, 
                0x71, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Wake on USB", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0140, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Intel (R) HT Technology", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0141, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x11)
            {
                "Boot Mode", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0142, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Legacy", 
                0x03, 
                "Legacy", 
                "UEFI Hybrid (With CSM)", 
                "UEFI Native (Without CSM)"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x0143, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                "Backlit Keyboard Timeout", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0xDD, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Sunday", 
                "", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x32, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Monday", 
                "", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x33, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Tuesday", 
                "", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x34, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Wednesday", 
                "", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x35, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Thursday", 
                "", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x36, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Friday", 
                "", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x37, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Saturday", 
                "", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x38, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "USB device boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x013E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Audio alerts during boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0144, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Fast Boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0xDC, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "DriveLock password on restart", 
                "", 
                "\\Security", 
                0x00, 
                0x01, 
                0x00, 
                0x028F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enabled", 
                0x02, 
                "Disabled", 
                "Enabled"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Custom Help and URL message", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0146, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                "USB Charging Port", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x01, 
                0x00, 
                0x00, 
                0x0147, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                "Disable charging port in all sleep/off states below(%):", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x01, 
                0x00, 
                0x00, 
                0x018F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "System Management Command", 
                "", 
                "\\Security", 
                0x00, 
                0x01, 
                0x00, 
                0x0147, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Manufacturing Programming Mode", 
                "", 
                "\\dir Place holder for Path", 
                0x00, 
                0x01, 
                0x00, 
                0x0377, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Unlock", 
                0x02, 
                "Lock", 
                "Unlock"
            }, 

            Package (0x10)
            {
                "eSATA boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0149, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                "Embedded GPS Device", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x020A, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Switchable Graphics", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x020B, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Restore Defaults", 
                "", 
                "\\File", 
                0x00, 
                0x01, 
                0x00, 
                0x020C, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "No", 
                0x02, 
                "No", 
                "Yes"
            }, 

            Package (0x10)
            {
                "Intel (R) Anti-Theft Suspend", 
                "", 
                "\\Security\\Anti Theft", 
                0x00, 
                0x01, 
                0x00, 
                0x029F, 
                0x03, 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'Intel (R) Anti-Theft\' AND CurrentValue=\'Enable\'", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Reset BIOS security to factory default", 
                "", 
                "\\File", 
                0x00, 
                0x01, 
                0x00, 
                0x020D, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "No", 
                0x02, 
                "No", 
                "Yes"
            }, 

            Package (0x10)
            {
                "Smart Card Reader Power Setting (If Present)", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02A1, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Powered on if card is present", 
                0x02, 
                "Always powered on", 
                "Powered on if card is present"
            }, 

            Package (0x10)
            {
                "Power-On when AC is detected", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02A2, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Opening the lid wakes the computer from standby", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02A4, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                "Power Control", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02A5, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Opening the lid powers on the computer", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02A6, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Save/Restore MBR of the system Hard Drive", 
                "", 
                "\\Security", 
                0x00, 
                0x01, 
                0x00, 
                0x02A7, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02A7, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "WWAN Quick Connect", 
                "", 
                "\\Security", 
                0x00, 
                0x01, 
                0x00, 
                0x02A9, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Boost Converter", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02AA, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Soft Temporary Disable", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x01, 
                0x00, 
                0x00, 
                0x02BC, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02C1, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Update System BIOS", 
                "", 
                "\\File", 
                0x00, 
                0x01, 
                0x00, 
                0x02C6, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "SecureBoot", 
                "", 
                "\\File", 
                0x00, 
                0x01, 
                0x00, 
                0x02C7, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Create a backup image of the System BIOS", 
                "", 
                "\\File", 
                0x00, 
                0x01, 
                0x00, 
                0x02C8, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "Require acknowledgment of battery errors", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02C9, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                "Max SATA Speed", 
                "", 
                "", 
                0x01, 
                0x00, 
                0x00, 
                0x02CA, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02C9, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02CA, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02CB, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02CC, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "HP Hypervisor", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02CD, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP Hypervisor Version Control", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02CE, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP Hypervisor Configuration Lockdown", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02CF, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP Hypervisor Version Exact Match", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02D0, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP Hypervisor Bootloader Package Check Failure Policy", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02D1, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP Hypervisor Remote Recovery User Presence Policy", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02D2, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "HP Hypervisor Remote Recovery Policy", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02D3, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02D4, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x10)
            {
                "Clear Secure Boot Keys", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02D5, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "User Mode", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02D6, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "HP Factory Keys", 
                0x02, 
                "HP Factory Keys", 
                "Customer Keys"
            }, 

            Package (0x10)
            {
                "Customized Boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02D7, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02D8, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02D9, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02DA, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02DB, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x02DC, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x1A)
            {
                "Bypass Power-on password on ALL restarts", 
                "*Disable, Enable", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x00, 
                0x00, 
                0x02D8, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x0C, 
                "Disable", 
                "Enable", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " "
            }, 

            Package (0x10)
            {
                "PXE Internal IPV4 NIC boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0137, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x10)
            {
                "PXE Internal IPV6 NIC boot", 
                "", 
                "\\System Configuration\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x0138, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            Package (0x11)
            {
                "PXE Internal IPV4/IPV6 NIC boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0358, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Serial port Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0320, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Parallel port Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0322, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "CD-ROM boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0323, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Floppy boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0324, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "PXE Internal NIC boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0325, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "USB legacy support Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0327, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Fan Always on while on AC Power Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0328, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Flash media reader Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0329, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Startup Menu Delay (Sec.) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x032A, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Parallel port mode Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x032B, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x1A)
            {
                "Multiboot Express Popup Delay(Sec) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x032C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " ", 
                " "
            }, 

            Package (0x11)
            {
                "LAN/WLAN Switching Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x032E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Embedded Bluetooth Device Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x032F, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Embedded WLAN Device Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0330, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Embedded WWAN Device Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0331, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Power-On Authentication Support Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0333, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Data Execution Prevention Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0336, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "SATA Device Mode Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0337, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "USB Port Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0338, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Multi Core CPU Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x033C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Wake on LAN Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x033D, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Fingerprint Device Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0346, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Optical Disk Drive Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0347, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Embedded LAN Controller Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0348, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Virtualization Technology (VTx) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x034B, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "SOL Terminal Emulation Mode Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x0350, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Hide", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Firmware Verbosity Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x034C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Hide", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Firmware Progress Event Support Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x0351, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Hide", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Unconfigure AMT on next boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x034F, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Hide", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Integrated Camera Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0352, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Asset Tracking Number Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0353, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Ownership Tag Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0354, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Legacy Boot Order Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0355, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Custom Logo Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0356, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "SD Card boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0357, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "HP QuickLook Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0358, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Wireless Button State Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0359, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Modem Device Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x035A, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Finger Print reset Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x035B, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "HP SpareKey Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x035C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Trusted Execution Technology (TXT) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x035D, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Hide", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Display Diagnostic URL Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x035E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "USB Key Provisioning Support Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x034E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "AMT Setup Prompt(Ctrl-P) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x035E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Microphone Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0360, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Disk Sanitizer Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0361, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Boot Mode Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0362, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "NumLock on at boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0361, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Preboot authentication on HP QuickLook Boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0362, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Initiate Intel CIRA Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x0365, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Intel (R) Anti-Theft Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0366, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Power Monitor Circuit Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0367, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Speakers and Headphones Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0368, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Audio Device Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0369, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "eSATA Port Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x036A, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Wake on USB Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x036B, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Intel (R) HT Technology Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x036C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "UEFI Boot Order Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x036C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Set DriveLock Password Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x036D, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                "Backlit Keyboard Timeout Security Level", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x00, 
                0x036E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "BIOS Power-on Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0370, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "USB device boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0372, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Fast Boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x036F, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "DriveLock password on restart Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0370, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x12)
            {
                "Set All Security Levels", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0371, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Default", 
                0x04, 
                "Default", 
                "View", 
                "Change", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Custom Help and URL message Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0372, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                "USB Charging Port Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x0373, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "System Management Command Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0374, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "eSATA boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0376, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x0E)
            {
                "Embedded GPS Device Security Level", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x00, 
                0x037A, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Switchable Graphics Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x037B, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Secure Erase Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x037C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Smart Card Reader Power Setting Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x037E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Power-On when AC is detected Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x037F, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Opening the lid wakes the computer from standby Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0381, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                "Power Control Security Level", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x00, 
                0x0382, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Opening the lid powers on the computer Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0383, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Save/Restore MBR Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0384, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "WWAN Quick Connect Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0386, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Boost Converter Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0387, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Soft Temporary Disable Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x01, 
                0x00, 
                0x00, 
                0x034D, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Hide", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x00, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Update System BIOS Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x038A, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "SecureBoot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x038B, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Require acknowledgment of battery errors Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x038D, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                "Max SATA Speed Security Level", 
                "", 
                "", 
                0x01, 
                0x00, 
                0x00, 
                0x038E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "", 
                0x00
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x038D, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "HP Hypervisor Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0391, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "HP Hypervisor Version Control Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0392, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "HP Hypervisor Configuration Lockdown Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0393, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x0394, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }, 

            Package (0x11)
            {
                "Key Management Policy", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0395, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x11)
            {
                "Customized Boot Policy", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0396, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x01, 
                0x0397, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                " ", 
                0x00
            }
        })
        Name (BSPV, Package (0x05)
        {
            Package (0x12)
            {
                "Setup Password", 
                " ", 
                "\\Security", 
                0x00, 
                0x01, 
                0x01, 
                0x0258, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00
            }, 

            Package (0x12)
            {
                "Notebook hard drive drivelock master password", 
                " ", 
                "\\Security", 
                0x00, 
                0x01, 
                0x00, 
                0x025E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00
            }, 

            Package (0x12)
            {
                "Notebook hard drive drivelock user password", 
                " ", 
                "\\Security", 
                0x00, 
                0x01, 
                0x01, 
                0x025F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00
            }, 

            Package (0x12)
            {
                "Upgrade bay hard drive drivelock master password", 
                " ", 
                "\\Security", 
                0x00, 
                0x01, 
                0x01, 
                0x0260, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00
            }, 

            Package (0x12)
            {
                "Upgrade bay hard drive drivelock user password", 
                " ", 
                "\\Security", 
                0x00, 
                0x01, 
                0x01, 
                0x0261, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00
            }
        })
        Name (BSIN, Package (0x02)
        {
            Package (0x0F)
            {
                "Password Minimum Length", 
                "Place holder ", 
                "\\Security\\Administrator Tools\\Password Policy", 
                0x00, 
                0x01, 
                0x00, 
                0x0295, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                0x04, 
                0x20, 
                0x04
            }, 

            Package (0x0F)
            {
                "Manufacturing Programming Mode Counter", 
                "Place holder ", 
                "\\Place holder for Path", 
                0x00, 
                0x01, 
                0x00, 
                0x0376, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x0A, 
                0x00
            }
        })
        Name (BSSS, Package (0x2F)
        {
            Package (0x0E)
            {
                "Asset Tracking Number", 
                " ", 
                "\\Security\\System IDs", 
                0x00, 
                0x01, 
                0x00, 
                0x63, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Ownership Tag", 
                "Ownershiptag place holder", 
                "\\Security\\System IDs", 
                0x00, 
                0x01, 
                0x00, 
                0x62, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x50
            }, 

            Package (0x0E)
            {
                " ", 
                " ", 
                " ", 
                0x01, 
                0x00, 
                0x00, 
                0x5B, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0xA0
            }, 

            Package (0x0E)
            {
                "BIOS Power-On Time (hh:mm)", 
                " ", 
                "\\System Configuration\\BIOS Power-on", 
                0x00, 
                0x01, 
                0x00, 
                0x39, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x05
            }, 

            Package (0x0E)
            {
                "System Configuration ID", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x01, 
                0x00, 
                0x3B, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x40
            }, 

            Package (0x0E)
            {
                "Define Custom URL", 
                " ", 
                "\\System Configuration\\Device Configuration", 
                0x00, 
                0x01, 
                0x00, 
                0x3D, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x82
            }, 

            Package (0x0E)
            {
                "PCID Version", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x3A, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x05
            }, 

            Package (0x0E)
            {
                "Manufacturer", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x14, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Product Name", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x01, 
                0x00, 
                0x1E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x20
            }, 

            Package (0x0E)
            {
                "Processor Type", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x28, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Processor Speed", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x31, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x0A
            }, 

            Package (0x0E)
            {
                "Total Memory Size", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x50, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "BIOS Date", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x5A, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "System BIOS Version", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x5C, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Serial Number", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x01, 
                0x00, 
                0x5E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Video BIOS Revision", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x5F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Video BIOS Revision 2", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x60, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Keyboard Controller Version", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x61, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Hard Disk Serial Number", 
                " ", 
                "\\Security\\Hard Disk Sanitization Completion Report", 
                0x01, 
                0x01, 
                0x00, 
                0x044C, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x14
            }, 

            Package (0x0E)
            {
                "Hard Disk Make and Model", 
                " ", 
                "\\Security\\Hard Disk Sanitization Completion Report", 
                0x01, 
                0x01, 
                0x00, 
                0x044D, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x28
            }, 

            Package (0x0E)
            {
                "Completion Date", 
                " ", 
                "\\Security\\Hard Disk Sanitization Completion Report", 
                0x01, 
                0x01, 
                0x00, 
                0x044E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x11
            }, 

            Package (0x0E)
            {
                "Completion Status", 
                " ", 
                "\\Security\\Hard Disk Sanitization Completion Report", 
                0x01, 
                0x01, 
                0x00, 
                0x044F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x16
            }, 

            Package (0x0E)
            {
                "Write Cycles Completed", 
                " ", 
                "\\Security\\Hard Disk Sanitization Completion Report", 
                0x01, 
                0x01, 
                0x00, 
                0x0450, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x01
            }, 

            Package (0x0E)
            {
                "Warranty Start Date", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x2A, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x0A
            }, 

            Package (0x0E)
            {
                "SKU Number", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x01, 
                0x00, 
                0x29, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x10
            }, 

            Package (0x0E)
            {
                "System Board ID", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x1F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x04
            }, 

            Package (0x0E)
            {
                "Primary Battery Serial Number", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x64, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Secondary Battery Serial Number", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x00, 
                0x00, 
                0x66, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x12
            }, 

            Package (0x0E)
            {
                "Bluetooth FCC ID", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x6F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x14
            }, 

            Package (0x0E)
            {
                "WLAN FCC ID", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x6E, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x14
            }, 

            Package (0x0E)
            {
                "WWAN FCC ID", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x6D, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x14
            }, 

            Package (0x0E)
            {
                "GPS FCC ID", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x72, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x14
            }, 

            Package (0x0E)
            {
                "Universally Unique Identifier (UUID)", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x20, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x20
            }, 

            Package (0x0E)
            {
                "System Board CT", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x01, 
                0x00, 
                0x70, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x0F
            }, 

            Package (0x0E)
            {
                "MS Digital Marker", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x01, 
                0x00, 
                0x72, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x62
            }, 

            Package (0x0E)
            {
                "MicroCode Revision", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x77, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x0F
            }, 

            Package (0x0E)
            {
                "Product Family", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x01, 
                0x00, 
                0x70, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x28
            }, 

            Package (0x0E)
            {
                "Disk Sanitation Method", 
                " ", 
                "\\Security\\Hard Disk Sanitization Completion Report", 
                0x01, 
                0x01, 
                0x00, 
                0x0451, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x1A
            }, 

            Package (0x0E)
            {
                "HP Hypervisor Version", 
                "Asset Tag Place Holder", 
                "", 
                0x00, 
                0x00, 
                0x00, 
                0xD5, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x20
            }, 

            Package (0x0E)
            {
                "HP Hypervisor Config Hash", 
                "Asset Tag Place Holder", 
                "", 
                0x00, 
                0x00, 
                0x00, 
                0xD6, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x40
            }, 

            Package (0x0E)
            {
                "Memory Slot 1 Information", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x51, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x50
            }, 

            Package (0x0E)
            {
                "Memory Slot 2 Information", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x52, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x50
            }, 

            Package (0x0E)
            {
                "Memory Slot 3 Information", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x53, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x50
            }, 

            Package (0x0E)
            {
                "Memory Slot 4 Information", 
                " ", 
                "\\File\\System Information", 
                0x01, 
                0x01, 
                0x00, 
                0x54, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x50
            }, 

            Package (0x0E)
            {
                "Custom Boot Path", 
                " ", 
                "\\File\\System Information\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x55, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x3B
            }, 

            Package (0x0E)
            {
                "", 
                " ", 
                "\\File\\System Information", 
                0x00, 
                0x00, 
                0x00, 
                0x56, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0xC8
            }, 

            Package (0x0E)
            {
                "Turbo Boost support while on battery", 
                " ", 
                "\\File\\System Information\\Boot Options", 
                0x00, 
                0x01, 
                0x00, 
                0x57, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x00, 
                0x0A
            }
        })
        Name (DSTS, Package (0x04)
        {
            "Success", 
            "Error writing to disk", 
            "Error verifying disk", 
            "User aborted operation"
        })
        Name (DSMD, Package (0x05)
        {
            " ", 
            "Fast", 
            "Optimum", 
            "Custom", 
            "Secure Erase"
        })
        Name (DYEN, Package (0x3E)
        {
            0x02, 
            Package (0x10)
            {
                "Trusted Execution Technology (TXT)", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x013A, 
                0x03, 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'TPM Device\' AND CurrentValue=\'Available\'", 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'Virtualization Technology (VTx)\' AND CurrentValue=\'Enable\'", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x02, 
            Package (0x11)
            {
                "Trusted Execution Technology (TXT) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x035D, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x10)
            {
                "SOL Terminal Emulation Mode", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02BD, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "ANSI", 
                0x02, 
                "VT100", 
                "ANSI"
            }, 

            0x03, 
            Package (0x10)
            {
                "Firmware Verbosity", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02BD, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x03, 
            Package (0x10)
            {
                "Firmware Progress Event Support", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02C2, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x03, 
            Package (0x10)
            {
                "Unconfigure AMT on next boot", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02C0, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x03, 
            Package (0x10)
            {
                "USB Key Provisioning Support", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02C1, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Enable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x03, 
            Package (0x10)
            {
                "AMT Setup Prompt(Ctrl-P)", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02C3, 
                0x03, 
                "SELECT * FROM HP_BIOSEnumeration WHERE Name=\'Firmware Verbosity\' AND CurrentValue=\'Enable\'", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x03, 
            Package (0x10)
            {
                "Initiate Intel CIRA", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02C5, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x03, 
            Package (0x11)
            {
                "SOL Terminal Emulation Mode Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0350, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x11)
            {
                "Firmware Verbosity Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x034C, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x11)
            {
                "Firmware Progress Event Support Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0351, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x11)
            {
                "Unconfigure AMT on next boot Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x034F, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x11)
            {
                "USB Key Provisioning Support Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x034E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x11)
            {
                "AMT Setup Prompt(Ctrl-P) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x035E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x11)
            {
                "Initiate Intel CIRA Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0365, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x03, 
            Package (0x10)
            {
                "Soft Temporary Disable", 
                "", 
                "\\System Configuration\\AMT Options", 
                0x00, 
                0x01, 
                0x00, 
                0x02BC, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x03, 
            Package (0x11)
            {
                "Soft Temporary Disable Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x034D, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "Hide", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x04, 
            Package (0x14)
            {
                "Backlit Keyboard Timeout", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0xDD, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "15 secs.", 
                0x06, 
                "5 secs.", 
                "15 secs.", 
                "30 secs.", 
                "1 min.", 
                "5 mins.", 
                "Never"
            }, 

            0x04, 
            Package (0x11)
            {
                "Backlit Keyboard Timeout Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x036E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x05, 
            Package (0x10)
            {
                "USB Charging Port", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x0147, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x05, 
            Package (0x18)
            {
                "Disable charging port in all sleep/off states below(%):", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x018F, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "10", 
                0x0A, 
                "10", 
                "20", 
                "30", 
                "40", 
                "50", 
                "60", 
                "70", 
                "80", 
                "90", 
                "100"
            }, 

            0x05, 
            Package (0x11)
            {
                "USB Charging Port Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0373, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x06, 
            Package (0x10)
            {
                "Power Control", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02A5, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x06, 
            Package (0x11)
            {
                "Power Control Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x0382, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x07, 
            Package (0x11)
            {
                "Virtualization Technology for Directed I/O (VTd)", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0xDE, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x03, 
                "Disable", 
                "Enable", 
                "Reset to default"
            }, 

            0x07, 
            Package (0x11)
            {
                "Virtualization Technology for Directed I/O (VTd) Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0xDF, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x08, 
            Package (0x10)
            {
                "Embedded GPS Device", 
                "", 
                "\\System Configuration\\Built-In Device Options", 
                0x00, 
                0x01, 
                0x00, 
                0x020A, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "Disable", 
                0x02, 
                "Disable", 
                "Enable"
            }, 

            0x08, 
            Package (0x11)
            {
                "Embedded GPS Device Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x037A, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "View", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }, 

            0x09, 
            Package (0x10)
            {
                "Max SATA Speed", 
                "", 
                "\\System Configuration\\Device Configurations", 
                0x00, 
                0x01, 
                0x00, 
                0x02CA, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                "", 
                0x02, 
                "3.0 Gbps", 
                "6.0 Gbps"
            }, 

            0x09, 
            Package (0x11)
            {
                "Max SATA Speed Security Level", 
                "", 
                "\\System Configuration\\Security Level", 
                0x00, 
                0x01, 
                0x00, 
                0x038E, 
                0x03, 
                "SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", 
                " ", 
                " ", 
                0x00, 
                "", 
                0x03, 
                "Change", 
                "View", 
                "Hide"
            }
        })
        Name (BUSR, Package (0x05)
        {
            Package (0x13)
            {
                " ", 
                " ", 
                "\\Security", 
                0x01, 
                0x00, 
                0x01, 
                0x0259, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00, 
                0x00
            }, 

            Package (0x13)
            {
                " ", 
                " ", 
                "\\Security", 
                0x01, 
                0x00, 
                0x01, 
                0x025A, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00, 
                0x00
            }, 

            Package (0x13)
            {
                " ", 
                " ", 
                "\\Security", 
                0x01, 
                0x00, 
                0x01, 
                0x025B, 
                0x03, 
                " ", 
                " ", 
                " ", 
                0x00, 
                0x08, 
                0x20, 
                "utf-16", 
                " ", 
                0x00, 
                0x00, 
                0x00
            }
        })
        Name (ETYP, Buffer (0x01) {})
        Device (WMID)
        {
            Name (WCDS, Package (0x3A)
            {
                0x04, 
                0x04, 
                0x04, 
                0x00, 
                0x04, 
                0x04, 
                0x00, 
                0x00, 
                0x04, 
                0x04, 
                0x0C, 
                0x00, 
                0x00, 
                0x00, 
                0x00, 
                0x05, 
                0x00, 
                0x00, 
                0x00, 
                0x04, 
                0x00, 
                0x00, 
                0x00, 
                0x04, 
                0x04, 
                0x00, 
                0x04, 
                0x00, 
                0x04, 
                0x00, 
                0x04, 
                0x00, 
                0x04, 
                0x04, 
                0x02, 
                0x00, 
                0x00, 
                0x00, 
                0x00, 
                0x80, 
                0x80, 
                0x04, 
                0x04, 
                0x00, 
                0x04, 
                0x00, 
                0x80, 
                0x00, 
                0x00, 
                0x00, 
                0x04, 
                0x04, 
                0x00, 
                0x80, 
                0x80, 
                0x04, 
                0x00, 
                0x00
            })
            Name (ZOBF, Buffer (Add (0x1000, 0x10)) {})
            Method (WHCM, 2, NotSerialized)
            {
                CreateDWordField (Arg1, 0x00, SNIN)
                CreateDWordField (Arg1, 0x04, COMD)
                CreateDWordField (Arg1, 0x08, CMTP)
                CreateDWordField (Arg1, 0x0C, DASI)
                If (LEqual (Arg0, 0x01))
                {
                    Store (0x00, Local0)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (0x04, Local0)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (0x80, Local0)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (0x0400, Local0)
                }

                If (LEqual (Arg0, 0x05))
                {
                    Store (0x1000, Local0)
                }

                Store (Buffer (Add (0x08, Local0)) {}, Local1)
                CreateDWordField (Local1, 0x00, SNOU)
                CreateDWordField (Local1, 0x04, RTCD)
                Store (0x4C494146, SNOU) /* \_SB_.WMID.WHCM.SNOU */
                Store (DASI, Local5)
                If (LGreater (DASI, 0x2000))
                {
                    Store (0x05, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    Return (Local1)
                }

                Store (DASI, Local5)
                CreateField (Arg1, 0x00, Multiply (Add (Local5, 0x10), 0x08), 
                    DAIN)
                Store (DAIN, ASMB) /* \ASMB */
                Store (0x02, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                If (LEqual (SNIN, 0x55434553))
                {
                    Store (0x03, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    If (LEqual (COMD, 0x01))
                    {
                        Store (0x04, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        If (LEqual (CMTP, 0x01))
                        {
                            Store (^WGDD (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x02))
                        {
                            Store (^WGHP (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x03))
                        {
                            Store (^WALS (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x04))
                        {
                            Store (^WGDS (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x07))
                        {
                            If (DASI)
                            {
                                Store (DerefOf (Index (Arg1, 0x10)), Local3)
                                Store (WGBI (Local3), Local2)
                                Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                            }
                            Else
                            {
                                Store (0x05, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                            }
                        }

                        If (LEqual (CMTP, 0x08))
                        {
                            Store ("Bezel button table", Debug)
                            Store (^WGBN (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x0D))
                        {
                            Store ("Feature Report", Debug)
                            Store (^GFRT (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x09))
                        {
                            Store ("Hotkey Scancode", Debug)
                            Store (^GHKS (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x0A))
                        {
                            Store ("Hotkey Function", Debug)
                            Store (^GHKF (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x0C))
                        {
                            Store ("Bezel button", Debug)
                            Store (^WGBV (), Local2)
                            Store (Local2, Debug)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x0F))
                        {
                            Store (^GSAS (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x10))
                        {
                            Store (^GSRV (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x11))
                        {
                            Store (^GVPR (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x12))
                        {
                            Store (^GBRS (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x14))
                        {
                            Store (^GWPT (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x18))
                        {
                            Store ("Get system configuration", Debug)
                            Store (^GDBT (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x1B))
                        {
                            If (LNotEqual (\_SB.WLBU._STA (), 0x0F))
                            {
                                Store (^WGWS (), Local2)
                                Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                            }
                        }

                        If (LEqual (CMTP, 0x1C))
                        {
                            Store (^GPMC (0x00), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x1D))
                        {
                            Store ("Get Diags mode", Debug)
                            Store (^GDMD (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x1E))
                        {
                            Store ("Get BIOS Update status", Debug)
                            Store (^GBUS (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x28))
                        {
                            Store ("Get thermal status", Debug)
                            If (LNotEqual (DASI, 0x04))
                            {
                                Store (0x05, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                            }
                            Else
                            {
                                CreateField (Arg1, 0x80, Multiply (DASI, 0x08), GTSD)
                                Store (^GTMS (GTSD), Local2)
                                Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                            }
                        }

                        If (LEqual (CMTP, 0x2B))
                        {
                            Store ("Get Battery control", Debug)
                            Store (^WGBC (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x20))
                        {
                            Store (^GBTT (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x21))
                        {
                            If (LLess (DASI, DerefOf (Index (WCDS, Subtract (CMTP, 0x01)
                                ))))
                            {
                                Store (0x05, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                            }
                            Else
                            {
                                If (LGreaterEqual (\WCOS (), 0x06))
                                {
                                    Store (0x04, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }
                                Else
                                {
                                    CreateDWordField (Arg1, 0x10, BTYP)
                                    Store (^GBTL (BTYP), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }
                            }
                        }

                        If (LEqual (CMTP, 0x22))
                        {
                            Store ("Quick Button Policy", Debug)
                            Store (^GQBP (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x23))
                        {
                            Store (^GPIN (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x25))
                        {
                            Store (^GPMC (0x01), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x29))
                        {
                            Store (^GFCC (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x2A))
                        {
                            Store (^GPES (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x2E))
                        {
                            Store (^GLID (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x30))
                        {
                            Store (^GEID (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x33))
                        {
                            Store (^GDES (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x36))
                        {
                            Store (^GPST (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x37))
                        {
                            Store (^GBCT (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }

                        If (LEqual (CMTP, 0x38))
                        {
                            Store (^GPSH (), Local2)
                            Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }
                    }

                    If (LEqual (COMD, 0x02))
                    {
                        Store (0x04, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        If (LAnd (LGreater (CMTP, 0x00), LLessEqual (CMTP, 0x39)))
                        {
                            If (LLess (DASI, DerefOf (Index (WCDS, Subtract (CMTP, 0x01)
                                ))))
                            {
                                Store (0x05, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                            }
                            Else
                            {
                                CreateDWordField (Arg1, 0x10, DDWD)
                                If (LEqual (CMTP, 0x01))
                                {
                                    Store ("set display switch", Debug)
                                    Store (^WSDD (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x02))
                                {
                                    Store (^WITH (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x03))
                                {
                                    Store (^WSAL (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x06))
                                {
                                    Store ("write Brightness", Debug)
                                    Store (^SBBC (DDWD), Local2)
                                    Store (Local2, Debug)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x09))
                                {
                                    Store ("Hotkey Scancode", Debug)
                                    Store (^SHKS (DDWD), Local2)
                                    Store (Local2, Debug)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x0A))
                                {
                                    Store ("Hotkey Function", Debug)
                                    Store (^SHKF (DDWD), Local2)
                                    Store (Local2, Debug)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x10))
                                {
                                    Store ("Set Service ID", Debug)
                                    Store (^SSRV (DDWD), Local2)
                                    Store (Local2, Debug)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x14))
                                {
                                    Store (^SWPT (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x18))
                                {
                                    Store ("Set System configuration", Debug)
                                    Store (^SDBT (DDWD), Local2)
                                    XOr (DDWD, DTCD, Local3)
                                    If (And (Local3, 0x1800))
                                    {
                                        \_SB.PCI0.LPCB.EC0.PWUP (0x01, 0x00)
                                        Notify (\_SB.AC, 0x80) // Status Change
                                        Store (DDWD, DTCD) /* \DTCD */
                                    }

                                    Store (Local2, Debug)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x1B))
                                {
                                    If (LNotEqual (\_SB.WLBU._STA (), 0x0F))
                                    {
                                        Store (^WSWS (DDWD), Local2)
                                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                        WGWE (0x05, 0x00)
                                    }
                                }

                                If (LEqual (CMTP, 0x1D))
                                {
                                    Store ("Get Diags mode", Debug)
                                    Store (^SDMD (DDWD), Local2)
                                    Store (Local2, Debug)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x1E))
                                {
                                    Store ("Get BIOS Update status", Debug)
                                    Store (^SBUS (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x28))
                                {
                                    Store ("Set thermal status", Debug)
                                    CreateField (Arg1, 0x80, Multiply (DASI, 0x08), STSD)
                                    Store (^STMM (STSD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x2B))
                                {
                                    Store ("Get Battery control", Debug)
                                    Store (^WSBC (CMTP, DASI, DAIN), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x21))
                                {
                                    If (LGreaterEqual (\WCOS (), 0x06))
                                    {
                                        Store (0x04, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                    }
                                    Else
                                    {
                                        Store (^SBRT (And (DDWD, 0xFF), And (ShiftRight (DDWD, 0x08
                                            ), 0xFFFF)), Local2)
                                        If (LNotEqual (Local2, Ones))
                                        {
                                            Store (Local2, BRID) /* \BRID */
                                            \_SB.SSMI (0xEA74, 0x08, Local2, 0x00, 0x00)
                                            \_SB.WBRT ()
                                            Store (Package (0x02)
                                                {
                                                    0x00, 
                                                    0x00
                                                }, Local2)
                                        }
                                        Else
                                        {
                                            Store (Package (0x02)
                                                {
                                                    0x06, 
                                                    0x00
                                                }, Local2)
                                        }

                                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                    }
                                }

                                If (LEqual (CMTP, 0x22))
                                {
                                    Store ("Set Quick Button Policy", Debug)
                                    Store (^SQBP (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x23))
                                {
                                    Store (^SPIN (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x25))
                                {
                                    Store (^CPMC (), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x29))
                                {
                                    Store (^SFCC (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x2A))
                                {
                                    Store (^SPES (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }

                                If (LEqual (CMTP, 0x36))
                                {
                                    Store (^SPST (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                    If (LEqual (DerefOf (Index (Local2, 0x00)), 0x00))
                                    {
                                        If (LEqual (PSCF, 0x01))
                                        {
                                            \_SB.WMID.WGWE (0x0F, 0x02)
                                        }
                                    }
                                }

                                If (LEqual (CMTP, 0x37))
                                {
                                    Store (^SBCP (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                    If (LEqual (DerefOf (Index (Local2, 0x00)), 0x00))
                                    {
                                        If (LEqual (PSCF, 0x01))
                                        {
                                            \_SB.WMID.WGWE (0x10, 0x02)
                                        }

                                        If (LEqual (BCSC, 0x01))
                                        {
                                            \_SB.WMID.WGWE (0x10, 0x00)
                                        }

                                        Store (0x00, BCSC) /* \BCSC */
                                    }
                                }

                                If (LEqual (CMTP, 0x38))
                                {
                                    Store (^SPSH (DDWD), Local2)
                                    Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                    If (LEqual (DerefOf (Index (Local2, 0x00)), 0x00))
                                    {
                                        If (LEqual (PSCF, 0x01))
                                        {
                                            \_SB.WMID.WGWE (0x0F, 0x04)
                                        }
                                    }
                                }
                            }
                        }
                    }

                    If (LEqual (COMD, 0x03))
                    {
                        Store (\_SB.HODM (CMTP, DASI, DAIN), Local2)
                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    }

                    If (LEqual (COMD, 0x00020000))
                    {
                        \_SB.SSMI (0xEA75, COMD, CMTP, 0x574D4953, 0x00)
                        Store (WFDA (), Local2)
                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    }

                    If (LEqual (COMD, 0x00020001))
                    {
                        \_SB.SSMI (0xEA75, COMD, CMTP, 0x574D4953, 0x00)
                        If (LEqual (EDX, 0x5A5A))
                        {
                            While (LEqual (EDX, 0x5A5A))
                            {
                                \_SB.SSMI (0xEA75, COMD, 0x10, 0x574D4953, 0x00)
                                Sleep (0x19)
                            }

                            Store (0x00, ECX) /* \ECX_ */
                            Store (0x574D4953, EDX) /* \EDX_ */
                        }

                        Store (WFDA (), Local2)
                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    }

                    If (LEqual (COMD, 0x00020002))
                    {
                        \_SB.SSMI (0xEA75, COMD, CMTP, 0x574D4953, 0x00)
                        Store (WFDA (), Local2)
                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    }

                    If (LEqual (COMD, 0x00020003))
                    {
                        If (LEqual (CMTP, 0x06))
                        {
                            If (LEqual (DASI, 0x04))
                            {
                                CreateDWordField (Arg1, 0x10, EVNR)
                                Store (HPMC (CMTP, EVNR), Local2)
                            }
                            Else
                            {
                                Store (Package (0x02)
                                    {
                                        0x05, 
                                        0x00
                                    }, Local2)
                            }
                        }
                        Else
                        {
                            Store (HPMC (CMTP, 0x00), Local2)
                        }

                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    }

                    If (LEqual (COMD, 0x00020004))
                    {
                        \_SB.SSMI (0xEA75, COMD, CMTP, 0x574D4953, 0x00)
                        Store (WFDA (), Local2)
                        Store (0x00, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    }
                }

                If (LEqual (RTCD, 0x00))
                {
                    Store (DerefOf (Index (Local2, 0x00)), RTCD) /* \_SB_.WMID.WHCM.RTCD */
                    If (LEqual (RTCD, 0x00))
                    {
                        Store (DerefOf (Index (Local2, 0x01)), Local3)
                        If (LLessEqual (Local3, Local0))
                        {
                            Store (0x00, Local5)
                            While (LLess (Local5, Local3))
                            {
                                Store (DerefOf (Index (DerefOf (Index (Local2, 0x02)), Local5)), 
                                    Index (Local1, Add (Local5, 0x08)))
                                Increment (Local5)
                            }

                            If (LEqual (COMD, 0x00020000))
                            {
                                If (EDX)
                                {
                                    Store ("Encrypted Data Out", Debug)
                                    Or (ShiftLeft (Local3, 0x10), RTCD, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                                }
                                Else
                                {
                                    Store ("No Encrypted Data Out", Debug)
                                }
                            }

                            Store (0x53534150, SNOU) /* \_SB_.WMID.WHCM.SNOU */
                        }
                        Else
                        {
                            Store (0x05, RTCD) /* \_SB_.WMID.WHCM.RTCD */
                        }
                    }
                }

                Store (ZOBF, ASMB) /* \ASMB */
                Return (Local1)
            }

            Method (WFDA, 0, NotSerialized)
            {
                If (LOr (LEqual (ECX, 0x00), LNotEqual (EBX, 0x00)))
                {
                    Store (Package (0x02)
                        {
                            0x00, 
                            0x00
                        }, Local0)
                }
                Else
                {
                    Store (ECX, Local1)
                    Store (Package (0x03)
                        {
                            0x00, 
                            0x00, 
                            Buffer (Local1) {}
                        }, Local0)
                    Store (ECX, Debug)
                }

                Store (EBX, Index (Local0, 0x00))
                If (LEqual (EBX, 0x00))
                {
                    Store (ECX, Index (Local0, 0x01))
                    If (LNotEqual (ECX, 0x00))
                    {
                        Store (ASMB, Local1)
                        Store (0x00, Local2)
                        While (LLess (Local2, ECX))
                        {
                            Store (DerefOf (Index (Local1, Local2)), Index (DerefOf (Index (Local0, 
                                0x02)), Local2))
                            Increment (Local2)
                        }
                    }
                }

                Return (Local0)
            }

            Method (WGWE, 2, NotSerialized)
            {
                If (LEqual (\_SB.WMID.WEI1, 0x00))
                {
                    Store (Arg0, \_SB.WMID.WEI1)
                    Store (Arg1, \_SB.WMID.WED1)
                }
                Else
                {
                    Store (Arg0, \_SB.WMID.WEI2)
                    Store (Arg1, \_SB.WMID.WED2)
                }

                Notify (\_SB.WMID, 0x80) // Status Change
            }

            Method (HPMC, 2, NotSerialized)
            {
                Store (Buffer (0x80) {}, Local0)
                Store (0x01, Index (Local0, 0x00))
                Store (0x00, Index (Local0, 0x01))
                If (LEqual (Arg0, 0x03))
                {
                    CreateWordField (Local0, 0x04, SYSD)
                    CreateWordField (Local0, 0x06, SUPP)
                    CreateDWordField (Local0, 0x08, S0AC)
                    CreateDWordField (Local0, 0x0C, S3AC)
                    CreateDWordField (Local0, 0x10, S5AC)
                    CreateDWordField (Local0, 0x14, S0DA)
                    CreateDWordField (Local0, 0x18, S3DA)
                    CreateDWordField (Local0, 0x1C, S5DA)
                    Store (0x96, SYSD) /* \_SB_.WMID.HPMC.SYSD */
                    Store (0x05DF, SUPP) /* \_SB_.WMID.HPMC.SUPP */
                    Store (0x78, S0AC) /* \_SB_.WMID.HPMC.S0AC */
                    Store (0x07B8, S3AC) /* \_SB_.WMID.HPMC.S3AC */
                    Store (0x07B8, S5AC) /* \_SB_.WMID.HPMC.S5AC */
                    Store (0x00, S0DA) /* \_SB_.WMID.HPMC.S0DA */
                    Store (0x0790, S3DA) /* \_SB_.WMID.HPMC.S3DA */
                    Store (0x0790, S5DA) /* \_SB_.WMID.HPMC.S5DA */
                    Store (Package (0x03)
                        {
                            0x00, 
                            0x80, 
                            Buffer (0x80) {}
                        }, Local1)
                    Store (Local0, Index (Local1, 0x02))
                    Return (Local1)
                }

                If (LEqual (Arg0, 0x04))
                {
                    If (LEqual (PMCS, 0x01))
                    {
                        If (\_SB.PCI0.LPCB.EC0.ECRG)
                        {
                            Store (0x01, \_SB.PCI0.LPCB.EC0.PMCC)
                            CreateWordField (Local0, 0x02, SYSS)
                            CreateDWordField (Local0, 0x05, S0AD)
                            CreateDWordField (Local0, 0x08, S0PW)
                            CreateDWordField (Local0, 0x0C, S0CT)
                            CreateDWordField (Local0, 0x10, S3AD)
                            CreateDWordField (Local0, 0x13, S3PW)
                            CreateDWordField (Local0, 0x17, S3CT)
                            CreateDWordField (Local0, 0x1B, S5AD)
                            CreateDWordField (Local0, 0x1E, S5PW)
                            CreateDWordField (Local0, 0x22, S5CT)
                            CreateDWordField (Local0, 0x26, S0DD)
                            CreateDWordField (Local0, 0x29, S0DP)
                            CreateDWordField (Local0, 0x2D, S0DC)
                            CreateDWordField (Local0, 0x31, S3DD)
                            CreateDWordField (Local0, 0x34, S3DP)
                            CreateDWordField (Local0, 0x38, S3DC)
                            CreateDWordField (Local0, 0x3C, S5DD)
                            CreateDWordField (Local0, 0x3F, S5DP)
                            CreateDWordField (Local0, 0x43, S5DC)
                            Store (\_SB.PCI0.LPCB.EC0.S0FL, Local1)
                            Store (0x01, Local3)
                            If (LEqual (And (Local1, 0x10), 0x00))
                            {
                                Or (Local3, 0x02, Local3)
                            }

                            Store (Local3, SYSS) /* \_SB_.WMID.HPMC.SYSS */
                            Store (0x00140000, S0AD) /* \_SB_.WMID.HPMC.S0AD */
                            Or (ShiftLeft (And (Local1, 0x0F), 0x03), S0AD, S0AD) /* \_SB_.WMID.HPMC.S0AD */
                            Store (0x00140000, Local2)
                            Or (ShiftLeft (And (\_SB.PCI0.LPCB.EC0.SXF0, 0xF0), 0x03), Local2, Local2)
                            Store (Local2, Local3)
                            Store (\_SB.PCI0.LPCB.EC0.SXF1, Local4)
                            If (And (Local4, 0x01))
                            {
                                Or (Local3, 0x08, Local3)
                            }

                            If (And (Local4, 0x04))
                            {
                                Or (Local3, 0x10, Local3)
                            }

                            If (And (Local4, 0x40))
                            {
                                Or (Local3, 0x20, Local3)
                            }

                            If (LEqual (And (Local3, 0x08), 0x00))
                            {
                                Or (Local3, 0x8000, Local3)
                            }

                            Store (Local3, S3AD) /* \_SB_.WMID.HPMC.S3AD */
                            Store (Local2, Local3)
                            If (And (Local4, 0x02))
                            {
                                Or (Local3, 0x08, Local3)
                            }

                            If (And (Local4, 0x10))
                            {
                                Or (Local3, 0x10, Local3)
                            }

                            If (And (Local4, 0x80))
                            {
                                Or (Local3, 0x20, Local3)
                            }

                            If (LEqual (And (Local3, 0x08), 0x00))
                            {
                                Or (Local3, 0x8000, Local3)
                            }

                            Store (Local3, S5AD) /* \_SB_.WMID.HPMC.S5AD */
                            Store (0x00, S0DD) /* \_SB_.WMID.HPMC.S0DD */
                            Store (0x00148000, Local3)
                            If (And (Local4, 0x08))
                            {
                                Or (Local3, 0x10, Local3)
                            }

                            Store (Local3, S3DD) /* \_SB_.WMID.HPMC.S3DD */
                            Store (0x00148000, Local3)
                            If (And (Local4, 0x20))
                            {
                                Or (Local3, 0x10, Local3)
                            }

                            Store (Local3, S5DD) /* \_SB_.WMID.HPMC.S5DD */
                            If (And (Local1, 0x20))
                            {
                                Store (0xFFFFFFFF, S0PW) /* \_SB_.WMID.HPMC.S0PW */
                                Store (0xFFFFFFFF, S0CT) /* \_SB_.WMID.HPMC.S0CT */
                                Store (0xFFFFFFFF, S3PW) /* \_SB_.WMID.HPMC.S3PW */
                                Store (0xFFFFFFFF, S3CT) /* \_SB_.WMID.HPMC.S3CT */
                                Store (0xFFFFFFFF, S5PW) /* \_SB_.WMID.HPMC.S5PW */
                                Store (0xFFFFFFFF, S5CT) /* \_SB_.WMID.HPMC.S5CT */
                                Store (0xFFFFFFFF, S0DP) /* \_SB_.WMID.HPMC.S0DP */
                                Store (0xFFFFFFFF, S0DC) /* \_SB_.WMID.HPMC.S0DC */
                                Store (0xFFFFFFFF, S3DP) /* \_SB_.WMID.HPMC.S3DP */
                                Store (0xFFFFFFFF, S3DC) /* \_SB_.WMID.HPMC.S3DC */
                                Store (0xFFFFFFFF, S5DP) /* \_SB_.WMID.HPMC.S5DP */
                                Store (0xFFFFFFFF, S5DC) /* \_SB_.WMID.HPMC.S5DC */
                            }
                            Else
                            {
                                Store (0x00, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, S0PW) /* \_SB_.WMID.HPMC.S0PW */
                                Store (0x01, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, S0CT) /* \_SB_.WMID.HPMC.S0CT */
                                Store (0x02, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local2)
                                Store (0x03, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local3)
                                Store (0x06, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local4)
                                Add (Local2, Multiply (Local4, 0x01B8), S3PW) /* \_SB_.WMID.HPMC.S3PW */
                                Add (Local3, Local4, S3CT) /* \_SB_.WMID.HPMC.S3CT */
                                Store (0x04, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local2)
                                Store (0x05, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local3)
                                Store (0x07, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local4)
                                Add (Local2, Multiply (Local4, 0x01B8), S5PW) /* \_SB_.WMID.HPMC.S5PW */
                                Add (Local3, Local4, S5CT) /* \_SB_.WMID.HPMC.S5CT */
                                Store (0x00, S0DP) /* \_SB_.WMID.HPMC.S0DP */
                                Store (0x00, S0DC) /* \_SB_.WMID.HPMC.S0DC */
                                Store (0x08, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local2)
                                Multiply (Local2, 0x01B8, S3DP) /* \_SB_.WMID.HPMC.S3DP */
                                Store (Local2, S3DC) /* \_SB_.WMID.HPMC.S3DC */
                                Store (0x09, \_SB.PCI0.LPCB.EC0.DIDX)
                                Store (\_SB.PCI0.LPCB.EC0.PMCD, Local2)
                                Multiply (Local2, 0x01B8, S5DP) /* \_SB_.WMID.HPMC.S5DP */
                                Store (Local2, S5DC) /* \_SB_.WMID.HPMC.S5DC */
                            }

                            Store (0x00, \_SB.PCI0.LPCB.EC0.PMCC)
                        }
                        Else
                        {
                            Return (Package (0x02)
                            {
                                0x0D, 
                                0x00
                            })
                        }
                    }

                    Store (Package (0x03)
                        {
                            0x00, 
                            0x80, 
                            Buffer (0x80) {}
                        }, Local1)
                    Store (Local0, Index (Local1, 0x02))
                    Return (Local1)
                }

                If (LEqual (Arg0, 0x05))
                {
                    If (LEqual (PMCS, 0x01))
                    {
                        If (\_SB.PCI0.LPCB.EC0.ECRG)
                        {
                            Store (Package (0x03)
                                {
                                    0x00, 
                                    0x04, 
                                    Buffer (0x04) {}
                                }, Local1)
                            Store (\_SB.PCI0.LPCB.EC0.PMEP, Index (DerefOf (Index (Local1, 0x02)), 0x00))
                            Return (Local1)
                        }
                        Else
                        {
                            Return (Package (0x02)
                            {
                                0x0D, 
                                0x00
                            })
                        }
                    }
                }

                If (LEqual (Arg0, 0x06))
                {
                    If (LEqual (PMCS, 0x01))
                    {
                        If (\_SB.PCI0.LPCB.EC0.ECRG)
                        {
                            Store (Arg1, \_SB.PCI0.LPCB.EC0.PMEP)
                            WGWE (0x00020000, 0x00)
                            Return (Package (0x02)
                            {
                                0x00, 
                                0x00
                            })
                        }
                        Else
                        {
                            Return (Package (0x02)
                            {
                                0x0D, 
                                0x00
                            })
                        }
                    }
                }

                Return (Package (0x02)
                {
                    0x04, 
                    0x00
                })
            }

            Method (GBTT, 0, NotSerialized)
            {
                Store (BCL (), Local1)
                Store (Add (Multiply (BRCT, 0x04), 0x0C), Local5)
                Store (Buffer (Local5) {}, Local0)
                Store (0x03, Index (Local0, 0x00))
                Store (PNLF, Index (Local0, 0x01))
                Store (0x00, Index (Local0, 0x02))
                Store (BRCT, Index (Local0, 0x03))
                Store (0x00, Local2)
                Store (0x04, Local3)
                While (LLess (Local2, BRCT))
                {
                    Store (DerefOf (Index (Local1, Add (Local2, 0x02))), Index (
                        Local0, Local3))
                    Store (0x00, Index (Local0, Add (Local3, 0x01)))
                    Increment (Local2)
                    Add (Local3, 0x02, Local3)
                }

                Store (0x01, Index (Local0, Local3))
                Increment (Local3)
                Store (BRCT, Index (Local0, Local3))
                Increment (Local3)
                Store (0x00, Local2)
                While (LLess (Local2, Multiply (BRCT, 0x02)))
                {
                    Store (DerefOf (Index (DerefOf (Index (NITS, BCLI)), Local2)), 
                        Index (Local0, Local3))
                    Increment (Local2)
                    Increment (Local3)
                }

                Store (0x02, Index (Local0, Local3))
                Increment (Local3)
                Store (0x02, Index (Local0, Local3))
                Increment (Local3)
                Store (BPWG, Local2)
                Store (And (Local2, 0xFF), Index (Local0, Local3))
                Increment (Local3)
                Store (And (ShiftRight (Local2, 0x08), 0xFF), Index (Local0, 
                    Local3))
                Increment (Local3)
                Store (BPWO, Local2)
                Store (And (Local2, 0xFF), Index (Local0, Local3))
                Increment (Local3)
                Store (And (ShiftRight (Local2, 0x08), 0xFF), Index (Local0, 
                    Local3))
                Increment (Local3)
                Store (Package (0x03) {}, Local2)
                Store (0x00, Index (Local2, 0x00))
                Store (Local5, Index (Local2, 0x01))
                Store (Local0, Index (Local2, 0x02))
                Return (Local2)
            }

            Method (GBTL, 1, NotSerialized)
            {
                Store (0x00, Local0)
                Store (BCL (), Local1)
                If (LEqual (Arg0, 0x00))
                {
                    Store (DerefOf (Index (Local1, Add (BRID, 0x02))), Local2)
                }
                Else
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        Store (BRID, Local2)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            ShiftLeft (BRID, 0x01, Local4)
                            Store (DerefOf (Index (DerefOf (Index (NITS, BCLI)), Local4)), 
                                Local2)
                            Store (DerefOf (Index (DerefOf (Index (NITS, BCLI)), Add (Local4, 
                                0x01))), Local3)
                            Store (Or (ShiftLeft (Local3, 0x08), Local2), Local2)
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x03))
                            {
                                Store (BRLV, Local1)
                                Store (BRID, Local3)
                                If (LEqual (BCLI, 0x00))
                                {
                                    Store (BMAP, Local2)
                                    Store (DerefOf (Index (Local2, BRID)), Local3)
                                }

                                Store (DerefOf (Index (Local1, Local3)), Local2)
                            }
                            Else
                            {
                                Store (0x06, Local0)
                            }
                        }
                    }
                }

                Store (Package (0x03) {}, Local1)
                Store (Local0, Index (Local1, 0x00))
                If (LEqual (Local0, 0x00))
                {
                    Store (0x04, Index (Local1, 0x01))
                    Store (Buffer (0x04) {}, Local3)
                    Store (And (Local2, 0xFF), Index (Local3, 0x00))
                    Store (And (ShiftRight (Local2, 0x08), 0xFF), Index (Local3, 
                        0x01))
                    Store (Local3, Index (Local1, 0x02))
                }
                Else
                {
                    Store (0x00, Index (Local1, 0x01))
                }

                Return (Local1)
            }

            Method (SBRT, 2, NotSerialized)
            {
                Store (BCL (), Local0)
                Store (Ones, Local1)
                If (LEqual (Arg0, 0x00))
                {
                    Store (Match (Local0, MEQ, Arg1, MTR, 0x00, 0x02), Local1)
                    If (LNotEqual (Local1, Ones))
                    {
                        Subtract (Local1, 0x02, Local1)
                    }
                }
                Else
                {
                    If (LEqual (Arg0, 0x01))
                    {
                        If (LLess (Arg1, BRCT))
                        {
                            Store (Arg1, Local1)
                        }
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Store (DerefOf (Index (NITS, BCLI)), Local2)
                            Store (0x00, Local3)
                            While (LLess (Local3, BRCT))
                            {
                                If (LEqual (DerefOf (Index (Local2, Multiply (Local3, 0x02))), 
                                    Arg1))
                                {
                                    Store (Local3, Local1)
                                    Store (0xFF, Local3)
                                }

                                Increment (Local3)
                            }
                        }
                        Else
                        {
                            If (LEqual (Arg0, 0x03))
                            {
                                Store (BRLV, Local2)
                                Store (BMAP, Local3)
                                Store (0x00, Local4)
                                While (LLess (Local4, BRCT))
                                {
                                    Store (Local4, Local5)
                                    If (LEqual (BCLI, 0x00))
                                    {
                                        Store (DerefOf (Index (Local3, Local4)), Local5)
                                    }

                                    If (LEqual (DerefOf (Index (Local2, Local5)), Arg1))
                                    {
                                        Store (Local4, Local1)
                                        Store (0xFF, Local4)
                                    }

                                    Increment (Local4)
                                }
                            }
                        }
                    }
                }

                Return (Local1)
            }

            Method (GEID, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        0x00, 
                        0x04, 
                        Buffer (0x0400) {}
                    }, Local0)
                Store (0x0400, Index (Local0, 0x01))
                Store (EDID, Local1)
                Store (0x00, Local2)
                While (LLess (Local2, 0x0100))
                {
                    Store (DerefOf (Index (Local1, Local2)), Index (DerefOf (Index (Local0, 
                        0x02)), Local2))
                    Increment (Local2)
                }

                Return (Local0)
            }

            Name (NULL, "                                      ")
            Method (WQBC, 1, Serialized)
            {
                Name (_T_1, Zero)  // _T_x: Emitted by ASL Compiler
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                IWMP ()
                \_SB.SSMI (0xEA7B, 0x00, 0x01, Arg0, 0x00)
                If (LEqual (STAT, 0x80))
                {
                    Store (0x00, Index (DerefOf (Index (BISE, Arg0)), 0x04))
                }

                Store (DerefOf (Index (BISE, Arg0)), Local5)
                Store (DerefOf (Index (Local5, 0x00)), Local0)
                If (LEqual (FMOD, 0x00))
                {
                    If (LOr (\SRCP (Local0, "Virtualization Technology (VTx)"), \SRCP (Local0, "Virtualization Technology for Directed I/O (VTd)")))
                    {
                        Store (0x01, Index (DerefOf (Index (BISE, Arg0)), 0x05))
                        Store ("SELECT * FROM HP_BIOSPassword WHERE Name=\'Setup Password\' AND IsSet=1", Index (DerefOf (Index (BISE, Arg0)), 0x08))
                    }

                    If (\SRCP (Local0, "Manufacturing Programming Mode"))
                    {
                        Store (0x01, Index (DerefOf (Index (BISE, Arg0)), 0x03))
                    }
                }

                Store (EVAL, Local6)
                Store (ShiftRight (And (Local6, 0xF0), 0x04), Index (DerefOf (
                    Index (BISE, Arg0)), 0x0B))
                Store (And (Local6, 0x0F), Local6)
                Store (SizeOf (Local5), Local4)
                Store (DerefOf (Index (Local5, 0x0D)), Local2)
                If (LGreater (Local2, 0x00))
                {
                    Add (0x0E, Local2, Local2)
                    If (LLess (Local2, Local4))
                    {
                        Store (Local2, Local4)
                    }

                    If (\SRCP (Local0, "Parallel port mode"))
                    {
                        If (LEqual (Local6, 0x04))
                        {
                            Store (0x03, Local6)
                        }
                    }

                    If (\SRCP (DerefOf (Index (Local5, 0x0E)), CHGE))
                    {
                        While (One)
                        {
                            Store (Local6, _T_0) /* \_SB_.WMID.WQBC._T_0 */
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (0x00, Local6)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Store (0x02, Local6)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x00))
                                    {
                                        Store (DerefOf (Index (Local5, 0x0C)), Local7)
                                        Name (ST99, Buffer (SizeOf (Local7)) {})
                                        Store (Local7, ST99) /* \_SB_.WMID.WQBC.ST99 */
                                        While (One)
                                        {
                                            Store (DerefOf (Index (ST99, 0x00)), _T_1) /* \_SB_.WMID.WQBC._T_1 */
                                            If (LEqual (_T_1, 0x48))
                                            {
                                                Store (0x02, Local6)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_1, 0x56))
                                                {
                                                    Store (0x01, Local6)
                                                }
                                                Else
                                                {
                                                    Store (0x00, Local6)
                                                }
                                            }

                                            Break
                                        }
                                    }
                                }
                            }

                            Break
                        }
                    }

                    Add (0x0E, Local6, Local6)
                    If (LGreaterEqual (Local6, Local4))
                    {
                        Subtract (Local4, 0x01, Local6)
                    }

                    Store (DerefOf (Index (DerefOf (Index (BISE, Arg0)), Local6)), 
                        Local7)
                    Store (Local7, Index (DerefOf (Index (BISE, Arg0)), 0x0C))
                    Store (" ", Local1)
                    Store (0x0E, Local2)
                    While (LLess (Local2, Local6))
                    {
                        Store (DerefOf (Index (Local5, Local2)), Local3)
                        Concatenate (Local1, Local3, Local7)
                        Concatenate (Local7, ", ", Local1)
                        Increment (Local2)
                    }

                    Concatenate (Local1, "*", Local7)
                    While (LLess (Local2, Local4))
                    {
                        Store (DerefOf (Index (Local5, Local2)), Local3)
                        If (\SRCP (Local3, " "))
                        {
                            Break
                        }
                        Else
                        {
                            If (LNotEqual (Local2, Local6))
                            {
                                Concatenate (Local7, ", ", Local1)
                            }
                            Else
                            {
                                Store (Local7, Local1)
                            }

                            Concatenate (Local1, Local3, Local7)
                        }

                        Increment (Local2)
                    }

                    Store (Local7, Index (DerefOf (Index (BISE, Arg0)), 0x01))
                }

                Return (DerefOf (Index (BISE, Arg0)))
            }

            Method (WQBD, 1, NotSerialized)
            {
                Store (0x00, Local0)
                Store (0x00, Local1)
                Store (0x00, Local2)
                Store (0x00, Local4)
                Store (0x00, Local5)
                Store (0x00, Local6)
                Store (0x00, Local7)
                \_SB.SSMI (0xEA7B, 0x00, 0x02, 0x00, 0x00)
                If (LEqual (FMOD, 0x00))
                {
                    Store (0x01, Local4)
                    While (LAnd (Local4, LLess (Local2, SizeOf (MPMS))))
                    {
                        Store (DerefOf (Index (DerefOf (Index (BSSS, Arg0)), 0x00)), 
                            Local3)
                        If (\SRCM (Local3, DerefOf (Index (MPMS, Local2)), SizeOf (Local3)))
                        {
                            Store (0x01, Index (DerefOf (Index (BSSS, Arg0)), 0x03))
                            Store (0x00, Local4)
                        }

                        Increment (Local2)
                    }

                    Store (0x00, Local4)
                }

                If (LEqual (Arg0, 0x00))
                {
                    Store (ASTG, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0100, CAST)
                    Store (CAST, BF2S) /* \_SB_.BF2S */
                    Store (ShiftRight (And (STAT, 0xF0), 0x04), Index (DerefOf (
                        Index (BSSS, Arg0)), 0x0B))
                }

                If (LEqual (Arg0, 0x01))
                {
                    Store (OWNT, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, COWT)
                    Store (COWT, BF2S) /* \_SB_.BF2S */
                    Store (ShiftRight (And (STAT, 0xF0), 0x04), Index (DerefOf (
                        Index (BSSS, Arg0)), 0x0B))
                }

                If (LEqual (Arg0, 0x02))
                {
                    Store (LFND, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0510, WLFD)
                    Store (WLFD, BF2S) /* \_SB_.BF2S */
                    Store (EVAL, Local6)
                    Store (Local6, Index (DerefOf (Index (BSSS, Arg0)), 0x0B))
                }

                If (LEqual (Arg0, 0x03))
                {
                    Store (ATIM, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x28, WATM)
                    Store (WATM, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x04))
                {
                    Store (PCID, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0200, WPCD)
                    Store (WPCD, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x05))
                {
                    Store (CURL, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0410, WURL)
                    Store (WURL, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x06))
                {
                    Store (PCVR, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x28, PCIV)
                    Store (PCIV, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x07))
                {
                    Store (PROD, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CRPD)
                    Store (CRPD, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x08))
                {
                    Store (MODL, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CMOD)
                    Store (CMOD, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x09))
                {
                    Store (PTYP, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CCPU)
                    Store (CCPU, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x0A))
                {
                    Store (PFRQ, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x50, CFRQ)
                    Store (CFRQ, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x0B))
                {
                    Store (MEMS, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, MEMS)
                    Store (MEMS, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x0C))
                {
                    Store (DATE, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CDAT)
                    Store (CDAT, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Store (FAMI, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CFAM)
                    Store (CFAM, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x0E))
                {
                    Store (SERL, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CSER)
                    Store (CSER, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x0F))
                {
                    Store (VREV, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CREV)
                    Store (CREV, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x10))
                {
                    Store (VRE2, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CRE2)
                    Store (CRE2, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x11))
                {
                    Store (KBCD, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, CKBC)
                    Store (CKBC, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x12))
                {
                    If (LEqual (STAT, 0x80))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                        Store (NOIN, BF2S) /* \_SB_.BF2S */
                    }
                    Else
                    {
                        Store (HDDS, WTB2) /* \_SB_.WTB2 */
                        CreateField (WTB2, 0x00, 0xA8, WHDD)
                        Store (WHDD, BF2S) /* \_SB_.BF2S */
                    }
                }

                If (LEqual (Arg0, 0x13))
                {
                    If (LEqual (STAT, 0x80))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                        Store (NOIN, BF2S) /* \_SB_.BF2S */
                    }
                    Else
                    {
                        Store (HDDM, WTB2) /* \_SB_.WTB2 */
                        CreateField (WTB2, 0x00, 0x0148, WHDM)
                        Store (WHDM, BF2S) /* \_SB_.BF2S */
                    }
                }

                If (LEqual (Arg0, 0x14))
                {
                    If (LEqual (STAT, 0x80))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                        Store (NOIN, BF2S) /* \_SB_.BF2S */
                    }
                    Else
                    {
                        Store (CDAT, WTB2) /* \_SB_.WTB2 */
                        CreateField (WTB2, 0x00, 0x88, WCDT)
                        Store (WCDT, BF2S) /* \_SB_.BF2S */
                    }
                }

                If (LEqual (Arg0, 0x15))
                {
                    If (LEqual (STAT, 0x80))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                        Store (NOIN, BF2S) /* \_SB_.BF2S */
                    }
                    Else
                    {
                        Store (CSTS, WTB2) /* \_SB_.WTB2 */
                        CreateByteField (WTB2, 0x00, WCST)
                        Store (WCST, Local5)
                        If (LEqual (Local5, 0x00))
                        {
                            Store (0x00, Local0)
                            Store (DerefOf (Index (DSTS, Local0)), WTB4) /* \_SB_.WTB4 */
                            Store (WTB4, BF2S) /* \_SB_.BF2S */
                        }

                        If (LEqual (Local5, 0xFF))
                        {
                            Store (0x01, Local0)
                            Store (DerefOf (Index (DSTS, Local0)), WTB4) /* \_SB_.WTB4 */
                            Store (WTB4, BF2S) /* \_SB_.BF2S */
                        }

                        If (LEqual (Local5, 0xFE))
                        {
                            Store (0x02, Local0)
                            Store (DerefOf (Index (DSTS, Local0)), WTB4) /* \_SB_.WTB4 */
                            Store (WTB4, BF2S) /* \_SB_.BF2S */
                        }

                        If (LEqual (Local5, 0xFD))
                        {
                            Store (0x03, Local0)
                            Store (DerefOf (Index (DSTS, Local0)), WTB4) /* \_SB_.WTB4 */
                            Store (WTB4, BF2S) /* \_SB_.BF2S */
                        }
                    }
                }

                If (LEqual (Arg0, 0x16))
                {
                    If (LEqual (STAT, 0x80))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                        Store (NOIN, BF2S) /* \_SB_.BF2S */
                    }
                    Else
                    {
                        Store (CYCL, WTB2) /* \_SB_.WTB2 */
                        CreateByteField (WTB2, 0x00, WCYC)
                        ToBCD (WCYC, Local1)
                        Store (0x01, Local2)
                        If (LLessEqual (WCYC, 0x09))
                        {
                            Store (0x01, Local2)
                        }

                        If (LGreaterEqual (WCYC, 0x0A))
                        {
                            Store (0x02, Local2)
                        }

                        If (LGreaterEqual (WCYC, 0x64))
                        {
                            Store (0x03, Local2)
                        }

                        If (LGreaterEqual (WCYC, 0x03E8))
                        {
                            Store (0x04, Local2)
                        }

                        If (LGreaterEqual (WCYC, 0x2710))
                        {
                            Store (0x05, Local2)
                        }

                        Store (\ISTR (Local1, Local2), Local3)
                        Store (Local3, BF2S) /* \_SB_.BF2S */
                    }
                }

                If (LEqual (Arg0, 0x17))
                {
                    Store (SVID, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x50, CSID)
                    Store (CSID, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x18))
                {
                    Store (SKUN, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x80, CSKU)
                    Store (CSKU, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x19))
                {
                    Store (SSID, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x20, WSID)
                    Store (WSID, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x1A))
                {
                    Store (PBSN, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x90, WPSN)
                    Store (WPSN, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x1B))
                {
                    Store (SBSN, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x90, WSSN)
                    Store (WSSN, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x1C))
                {
                    Store (BTFC, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0xA0, WBTF)
                    Store (WBTF, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x1D))
                {
                    Store (WLFC, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0xA0, WWLF)
                    Store (WWLF, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x1E))
                {
                    Store (WWFC, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0xA0, WWWF)
                    Store (WWWF, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x1F))
                {
                    Store (GPFC, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0xA0, WGPF)
                    Store (WGPF, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x20))
                {
                    Store (UUID, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0100, WUUI)
                    Store (WUUI, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x21))
                {
                    Store (SBCT, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x78, WBCT)
                    Store (WBCT, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x22))
                {
                    Store (MSDM, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0310, WOA3)
                    Store (WOA3, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x23))
                {
                    Store (CPRV, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x78, WCRV)
                    Store (WCRV, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x24))
                {
                    Store (PLFN, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0140, WPRF)
                    Store (WPRF, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x25))
                {
                    If (LEqual (STAT, 0x80))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                        Store (NOIN, BF2S) /* \_SB_.BF2S */
                    }
                    Else
                    {
                        Store (SNMD, WTB2) /* \_SB_.WTB2 */
                        CreateByteField (WTB2, 0x00, WSNM)
                        Store (WSNM, Local5)
                        Store (DerefOf (Index (DSMD, Local5)), WTB4) /* \_SB_.WTB4 */
                        Store (WTB4, BF2S) /* \_SB_.BF2S */
                    }
                }

                If (LEqual (Arg0, 0x26))
                {
                    Store (HVER, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0100, WHVV)
                    Store (WHVV, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x27))
                {
                    Store (HVCH, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0200, WHVC)
                    Store (WHVC, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x28))
                {
                    Store (MMS1, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, WMS1)
                    Store (WMS1, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x29))
                {
                    If (LLess (NMMS, 0x02))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                    }

                    Store (MMS2, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, WMS2)
                    Store (WMS2, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x2A))
                {
                    If (LLess (NMMS, 0x03))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                    }

                    Store (MMS3, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, WMS3)
                    Store (WMS3, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x2B))
                {
                    If (LLess (NMMS, 0x04))
                    {
                        Store (0x00, Index (DerefOf (Index (BSSS, Arg0)), 0x04))
                    }

                    Store (MMS4, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0280, WMS4)
                    Store (WMS4, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x2C))
                {
                    Store (CUBT, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x01E0, CCBT)
                    Store (CCBT, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x2D))
                {
                    Store (FBID, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x0640, WPFB)
                    Store (WPFB, BF2S) /* \_SB_.BF2S */
                }

                If (LEqual (Arg0, 0x2E))
                {
                    Store (ETOD, WTB2) /* \_SB_.WTB2 */
                    CreateField (WTB2, 0x00, 0x58, CETD)
                    Store (CETD, BF2S) /* \_SB_.BF2S */
                }

                Store (BF2S, Index (DerefOf (Index (BSSS, Arg0)), 0x01))
                Return (DerefOf (Index (BSSS, Arg0)))
            }

            Method (WQBE, 1, NotSerialized)
            {
                Store (0x00, Local1)
                Store (0x00, Local2)
                Store (0x00, Local4)
                Store (0x00, Local5)
                Store (0x00, Local6)
                Store (0x00, Local7)
                If (LEqual (Arg0, 0x00))
                {
                    \_SB.SSMI (0xEA7B, 0x00, 0x03, Arg0, 0x00)
                    Store (ShiftRight (And (STAT, 0xF0), 0x04), Index (DerefOf (
                        Index (BSOL, Arg0)), 0x0B))
                    And (STAT, 0x0F, STAT) /* \STAT */
                    Store (BORD, WBOR) /* \_SB_.WBOR */
                    CreateField (WBOR, 0x00, Multiply (0x09, 0x08), CBOS)
                    While (LNotEqual (Local1, 0x09))
                    {
                        Store (DerefOf (Index (WBOR, Local1)), Local4)
                        If (LNotEqual (Local4, 0xFF))
                        {
                            Store (0x00, Local5)
                            While (LNotEqual (Local5, 0x09))
                            {
                                Store (DerefOf (Index (DerefOf (Index (RMBI, Local5)), 0x00)), 
                                    Local7)
                                If (LEqual (Local4, Local7))
                                {
                                    Store (DerefOf (Index (DerefOf (Index (RMBI, Local5)), 0x01)), 
                                        BF01) /* \_SB_.BF01 */
                                    Store (BF01, BF2S) /* \_SB_.BF2S */
                                    Store (BF2S, Index (CRBI, Local6))
                                    Increment (Local6)
                                    Store (Subtract (0x09, 0x01), Local5)
                                }

                                Increment (Local5)
                            }
                        }

                        Increment (Local1)
                    }

                    Store (0x00, Local0)
                    Store (0x00, Local5)
                    Store (0x00, Local4)
                    Store (0x0D, Local0)
                    While (LNotEqual (Local5, 0x09))
                    {
                        Store (DerefOf (Index (CRBI, Local5)), BF01) /* \_SB_.BF01 */
                        Store (BF01, BF2S) /* \_SB_.BF2S */
                        Store (BF2S, Index (DerefOf (Index (BSOL, 0x00)), Local0))
                        Increment (Local5)
                        Increment (Local0)
                    }

                    Store (0x00, Local1)
                    Store (0x00, Local2)
                    While (LNotEqual (Local2, 0x09))
                    {
                        Store (DerefOf (Index (CRBI, Local2)), BF01) /* \_SB_.BF01 */
                        Store (0x00, Local5)
                        While (LNotEqual (DerefOf (Index (BF01, Local5)), 0x00))
                        {
                            Store (DerefOf (Index (BF01, Local5)), Local3)
                            Store (Local3, Index (BVAL, Local1))
                            Increment (Local5)
                            Increment (Local1)
                        }

                        Store (0x2C, Index (BVAL, Local1))
                        Increment (Local1)
                        Increment (Local2)
                    }

                    Store (0x00, Local2)
                    While (LNotEqual (Local2, 0x09))
                    {
                        Store (0x20, Index (BVAL, Local1))
                        Increment (Local1)
                        Store (0x2C, Index (BVAL, Local1))
                        Increment (Local1)
                        Increment (Local2)
                    }

                    Store (BVAL, BB2S) /* \_SB_.BB2S */
                    Store (BB2S, Index (DerefOf (Index (BSOL, 0x00)), 0x01))
                }

                If (LEqual (Arg0, 0x01))
                {
                    Store (IBUF (), Local4)
                    \_SB.SSMI (0xEA7B, 0x00, 0x08, Arg0, 0x00)
                    Store (ShiftRight (And (STAT, 0xF0), 0x04), Index (DerefOf (
                        Index (BSOL, Arg0)), 0x0B))
                    And (STAT, 0x0F, STAT) /* \STAT */
                    Store (WUFI, SUIP) /* \_SB_.SUIP */
                    While (LNotEqual (Local1, 0x09))
                    {
                        Store (DerefOf (Index (SUIP, Local1)), Local4)
                        If (LNotEqual (Local4, 0xFF))
                        {
                            Store (0x00, Local5)
                            While (LNotEqual (Local5, 0x09))
                            {
                                Store (DerefOf (Index (DerefOf (Index (UEBL, Local5)), 0x00)), 
                                    Local7)
                                If (LEqual (Local4, Local7))
                                {
                                    Store (DerefOf (Index (DerefOf (Index (UEBL, Local5)), 0x01)), 
                                        BF01) /* \_SB_.BF01 */
                                    Store (BF01, BF2S) /* \_SB_.BF2S */
                                    Store (BF2S, Index (CUBO, Local6))
                                    Increment (Local6)
                                    Store (Subtract (0x09, 0x01), Local5)
                                }

                                Increment (Local5)
                            }
                        }

                        Increment (Local1)
                    }

                    Store (0x00, Local0)
                    Store (0x00, Local5)
                    Store (0x00, Local4)
                    Store (0x0D, Local0)
                    While (LNotEqual (Local5, 0x09))
                    {
                        Store (DerefOf (Index (CUBO, Local5)), BF01) /* \_SB_.BF01 */
                        Store (BF01, BF2S) /* \_SB_.BF2S */
                        Store (BF2S, Index (DerefOf (Index (BSOL, Arg0)), Local0))
                        Increment (Local5)
                        Increment (Local0)
                    }

                    Store (0x00, Local1)
                    Store (0x00, Local2)
                    While (LNotEqual (Local2, 0x09))
                    {
                        Store (DerefOf (Index (CUBO, Local2)), BF01) /* \_SB_.BF01 */
                        Store (0x00, Local5)
                        While (LNotEqual (DerefOf (Index (BF01, Local5)), 0x00))
                        {
                            Store (DerefOf (Index (BF01, Local5)), Local3)
                            Store (Local3, Index (BVAL, Local1))
                            Increment (Local5)
                            Increment (Local1)
                        }

                        Store (0x2C, Index (BVAL, Local1))
                        Increment (Local1)
                        Increment (Local2)
                    }

                    Store (0x00, Local2)
                    While (LNotEqual (Local2, 0x09))
                    {
                        Store (0x20, Index (BVAL, Local1))
                        Increment (Local1)
                        Store (0x2C, Index (BVAL, Local1))
                        Increment (Local1)
                        Increment (Local2)
                    }

                    Store (BVAL, BB2S) /* \_SB_.BB2S */
                    Store (BB2S, Index (DerefOf (Index (BSOL, Arg0)), 0x01))
                }

                Return (DerefOf (Index (BSOL, Arg0)))
            }

            Method (ISSP, 0, NotSerialized)
            {
                Store (0x00, Local0)
                \_SB.SSMI (0xEA7B, 0x00, 0x04, 0x00, 0x00)
                If (LEqual (APST, 0x01))
                {
                    Store (0x01, Local0)
                }
                Else
                {
                    Store (0x00, Local0)
                }

                Return (Local0)
            }

            Method (PLOK, 1, NotSerialized)
            {
                Store (0x00, Local1)
                Store (0x00, Local2)
                If (LEqual (Arg0, 0x00))
                {
                    While (LNotEqual (DerefOf (Index (OAPW, Local1)), 0x00))
                    {
                        Increment (Local1)
                    }

                    While (LNotEqual (DerefOf (Index (NAPW, Local2)), 0x00))
                    {
                        Increment (Local2)
                    }

                    If (LOr (LGreater (Local1, 0x20), LGreater (Local2, 0x20)))
                    {
                        Return (0x00)
                    }
                    Else
                    {
                        Return (0x01)
                    }
                }

                Return (0x00)
            }

            Method (GBID, 0, NotSerialized)
            {
                Store (0x00, Local1)
                Store (0x00, Local4)
                Store (0x00, Local5)
                Store (0x00, Local6)
                Store (0x64, Local7)
                Store (SizeOf (BOIN), Local2)
                Decrement (Local2)
                While (LNotEqual (Local4, Local2))
                {
                    Store (0x00, Local1)
                    While (LNotEqual (Local1, SizeOf (TEMP)))
                    {
                        Store (0x00, Index (TEMP, Local1))
                        Increment (Local1)
                    }

                    Store (0x00, Local1)
                    While (LNotEqual (Local1, 0x32))
                    {
                        Store (DerefOf (Index (BOIN, Local4)), Index (TEMP, Local1))
                        If (LOr (LEqual (DerefOf (Index (BOIN, Local4)), 0x2C), LEqual (
                            DerefOf (Index (BOIN, Local4)), 0x00)))
                        {
                            Store (0x32, Local1)
                            Decrement (Local1)
                        }

                        Increment (Local1)
                        Increment (Local4)
                    }

                    If (LNotEqual (DerefOf (Index (BOIN, Local4)), 0x00))
                    {
                        Store (FNID (), Local3)
                        If (LNotEqual (Local3, 0xFF))
                        {
                            Store (Local3, Index (BOID, Local6))
                        }

                        Increment (Local6)
                    }
                    Else
                    {
                        Store (Local2, Local4)
                    }
                }

                Return (Local7)
            }

            Method (FNID, 0, NotSerialized)
            {
                Store (0xFF, Local3)
                If (LOr (\SRCM (TEMP, "Optical Disk Drive", 0x11), \SRCM (TEMP, " Optical Disk Drive", SizeOf (
                    STG0))))
                {
                    Store (0x01, Local3)
                }

                If (LOr (\SRCM (TEMP, "Notebook Upgrade Bay", 0x14), \SRCM (TEMP, " Notebook Upgrade Bay", SizeOf (
                    STG0))))
                {
                    Store (0x01, Local3)
                }

                If (LOr (\SRCM (TEMP, "Notebook Hard Drive", 0x13), \SRCM (TEMP, " Notebook Hard Drive ", 0x15)))
                {
                    Store (0x02, Local3)
                }

                If (LOr (\SRCM (TEMP, "Hard Drive 2", 0x0C), \SRCM (TEMP, " Hard Drive 2", SizeOf (
                    STG0))))
                {
                    Store (0x0C, Local3)
                }

                If (LOr (\SRCM (TEMP, "USB Floppy", 0x0A), \SRCM (TEMP, " USB Floppy", SizeOf (
                    STG0))))
                {
                    Store (0x03, Local3)
                }

                If (LOr (\SRCM (TEMP, "USB CD-ROM", 0x0A), \SRCM (TEMP, " USB CD-ROM", SizeOf (
                    STG0))))
                {
                    Store (0x05, Local3)
                }

                If (LOr (\SRCM (TEMP, "USB Hard Drive", 0x0E), \SRCM (TEMP, " USB Hard Drive", SizeOf (
                    STG0))))
                {
                    Store (0x06, Local3)
                }

                If (LOr (\SRCM (TEMP, "Notebook Ethernet", 0x11), \SRCM (TEMP, " Notebook Ethernet ", SizeOf (
                    STG0))))
                {
                    Store (0x07, Local3)
                }

                If (LOr (\SRCM (TEMP, "SD Card", 0x07), \SRCM (TEMP, " SD Card ", 0x09)))
                {
                    Store (0x08, Local3)
                }

                If (LOr (\SRCM (TEMP, "Dock Upgrade Bay", 0x10), \SRCM (TEMP, " Dock Upgrade Bay ", 0x12)))
                {
                    Store (0x0A, Local3)
                }

                If (LOr (\SRCM (TEMP, "eSATA Drive", 0x0B), \SRCM (TEMP, " eSATA Drive ", 0x0D)))
                {
                    Store (0x0B, Local3)
                }

                If (LOr (\SRCM (TEMP, "Notebook Upgrade Bay", 0x14), \SRCM (TEMP, " Notebook Upgrade Bay", 0x15)))
                {
                    Store (0x01, Local3)
                }

                If (LOr (\SRCM (TEMP, "OS Boot Manager", 0x0F), \SRCM (TEMP, " OS Boot Manager", SizeOf (
                    STG0))))
                {
                    Store (0x02, Local3)
                }

                If (LOr (\SRCM (TEMP, "Notebook IPV4 Ethernet", 0x16), \SRCM (TEMP, " Notebook IPV4 Ethernet", 0x17)))
                {
                    Store (0x03, Local3)
                }

                If (LOr (\SRCM (TEMP, "Notebook IPV6 Ethernet", 0x16), \SRCM (TEMP, " Notebook IPV6 Ethernet", 0x17)))
                {
                    Store (0x04, Local3)
                }

                If (LOr (\SRCM (TEMP, "USB Hard Drive", 0x0E), \SRCM (TEMP, " USB Hard Drive", 0x0F)))
                {
                    Store (0x06, Local3)
                }

                If (LOr (\SRCM (TEMP, "Generic USB Device", 0x12), \SRCM (TEMP, " Generic USB Device", 0x13)))
                {
                    Store (0x07, Local3)
                }

                If (LOr (\SRCM (TEMP, "eSata Hard Drive", 0x10), \SRCM (TEMP, " eSata Hard Drive", 0x11)))
                {
                    Store (0x08, Local3)
                }

                If (LOr (\SRCM (TEMP, "SD Card Boot", 0x0C), \SRCM (TEMP, " SD Card Boot", 0x0D)))
                {
                    Store (0x09, Local3)
                }

                If (LOr (\SRCM (TEMP, "HP System Diagnostics", 0x15), \SRCM (TEMP, " HP System Diagnostics", 0x16)))
                {
                    Store (0x0A, Local3)
                }

                If (LOr (\SRCM (TEMP, "HP Hypervisor", 0x0D), \SRCM (TEMP, " HP Hypervisor", 0x0E)))
                {
                    Store (0x0B, Local3)
                }

                If (LOr (\SRCM (TEMP, "HP Remote Image Deployment", 0x1A), \SRCM (TEMP, " HP Remote Image Deployment", 0x1B)))
                {
                    Store (0x0C, Local3)
                }

                If (LOr (\SRCM (TEMP, "Customized Boot", 0x0F), \SRCM (TEMP, " Customized Boot", 0x10)))
                {
                    Store (0x0D, Local3)
                }

                Return (Local3)
            }

            Method (WQBF, 1, NotSerialized)
            {
                If (LEqual (Arg0, 0x00))
                {
                    If (LEqual (ISSP (), 0x01))
                    {
                        Store (0x01, Index (DerefOf (Index (BSPV, 0x00)), 0x10))
                        Store (SPSF, Index (DerefOf (Index (BSPV, 0x00)), 0x11))
                    }
                    Else
                    {
                        Store (0x00, Index (DerefOf (Index (BSPV, 0x00)), 0x10))
                        Store (0xFFFFFFFF, Index (DerefOf (Index (BSPV, 0x00)), 0x11))
                    }

                    \_SB.SSMI (0xEA7B, 0x00, 0x06, 0x00, 0x00)
                    Store (PWDL, Index (DerefOf (Index (BSPV, 0x00)), 0x0C))
                }
                Else
                {
                    \_SB.SSMI (0xEA7B, 0x00, 0x07, Arg0, 0x00)
                }

                Return (DerefOf (Index (BSPV, Arg0)))
            }

            Method (WQBG, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA7B, 0x00, 0x06, 0x00, 0x00)
                If (LEqual (FMOD, 0x00))
                {
                    Store (0x00, Local1)
                    Store (0x00, Local2)
                    Store (0x01, Local3)
                    While (LAnd (Local3, LLess (Local1, SizeOf (MPMI))))
                    {
                        Store (DerefOf (Index (MPMI, Local1)), Local2)
                        If (LEqual (Arg0, Local2))
                        {
                            Store (0x01, Index (DerefOf (Index (BSIN, Arg0)), 0x03))
                            Store (0x00, Local3)
                        }
                        Else
                        {
                            If (LLess (Arg0, Local2))
                            {
                                Store (0x00, Local3)
                            }
                        }

                        Increment (Local1)
                    }

                    Store (0x00, Local3)
                }

                Store (0x00, Local4)
                If (LEqual (Arg0, 0x00))
                {
                    Store (PWDL, Local4)
                }

                If (LEqual (Arg0, 0x01))
                {
                    Store (MPMC, Local4)
                }

                Store (Local4, Index (DerefOf (Index (BSIN, Arg0)), 0x0E))
                If (LLessEqual (Local4, 0x09))
                {
                    Store (0x01, Local2)
                }
                Else
                {
                    Store (0x02, Local2)
                }

                ToBCD (Local4, Local1)
                Store (\ISTR (Local1, Local2), Local3)
                Store (Local3, BF2S) /* \_SB_.BF2S */
                Store (BF2S, Index (DerefOf (Index (BSIN, Arg0)), 0x01))
                Return (DerefOf (Index (BSIN, Arg0)))
            }

            Method (WQBH, 0, NotSerialized)
            {
            }

            Method (WQBI, 1, NotSerialized)
            {
                \_TZ.WQBI (Arg0)
            }

            Method (WQBJ, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA7B, 0x02, Arg0, 0x00, 0x00)
                If (LEqual (STAT, 0x00))
                {
                    Store (USRN, BF2S) /* \_SB_.BF2S */
                    Store (BF2S, Index (DerefOf (Index (BUSR, Arg0)), 0x00))
                    Store (ROLE, Index (DerefOf (Index (BUSR, Arg0)), 0x12))
                    CreateDWordField (HASH, 0x00, HSH1)
                    If (LNotEqual (HSH1, 0x00))
                    {
                        Store (0x01, Index (DerefOf (Index (BUSR, Arg0)), 0x10))
                        If (LEqual (Arg0, 0x00))
                        {
                            Store (SPSF, Index (DerefOf (Index (BUSR, Arg0)), 0x11))
                        }
                        Else
                        {
                            Store (0x00, Index (DerefOf (Index (BUSR, Arg0)), 0x11))
                        }
                    }
                    Else
                    {
                        Store (0x00, Index (DerefOf (Index (BUSR, Arg0)), 0x10))
                    }
                }
                Else
                {
                    Store (NULL, Index (DerefOf (Index (BUSR, Arg0)), 0x00))
                    Store (0x00, Index (DerefOf (Index (BUSR, 0x00)), 0x12))
                    Store (0x00, Index (DerefOf (Index (BUSR, Arg0)), 0x10))
                }

                Return (DerefOf (Index (BUSR, Arg0)))
            }

            Method (USPP, 0, NotSerialized)
            {
                Store (0x00, Local0)
                \_SB.SSMI (0xEA7B, 0x00, 0x05, 0x00, 0x00)
                If (LEqual (SECO, 0x01))
                {
                    Store (0x01, Local0)
                }
                Else
                {
                    Store (0x00, Local0)
                }

                Return (Local0)
            }

            Method (ZPBF, 0, NotSerialized)
            {
                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (PCBF)))
                {
                    Store (0x00, Index (PCBF, Local3))
                    Increment (Local3)
                }

                Return (0x00)
            }

            Method (PARP, 0, NotSerialized)
            {
                Return (0x00)
            }

            Name (LEN2, 0x00)
            Method (WMBH, 1, NotSerialized)
            {
                Return (0x00)
            }

            Method (WMBA, 3, Serialized)
            {
                Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
                IWMP ()
                If (LEqual (Arg1, 0x01))
                {
                    Store (Arg2, Local0)
                    Store (SizeOf (Local0), Local1)
                    Store (0x00, Local2)
                    Store (DerefOf (Index (Local0, Local2)), Local4)
                    Increment (Local2)
                    Increment (Local2)
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (0x00, Local3)
                    Store (IBUF (), Local3)
                    While (LNotEqual (Local5, Local4))
                    {
                        Store (DerefOf (Index (Local0, Local2)), Index (ST01, Local6))
                        Increment (Local2)
                        Increment (Local5)
                        Increment (Local6)
                        Increment (Local2)
                        Increment (Local5)
                    }

                    Store (DerefOf (Index (Local0, Local2)), Local4)
                    Increment (Local2)
                    Increment (Local2)
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (0x00, PCHG) /* \_SB_.PCHG */
                    If (LOr (\SRCM (ST01, "Legacy Boot Order Security Level", 0x20), \SRCM (ST01, "UEFI Boot Order Security Level", 0x1E)))
                    {
                        Store (0x00, Local5)
                    }
                    Else
                    {
                        If (LOr (\SRCM (ST01, "Legacy Boot Order", 0x11), \SRCM (ST01, "UEFI Boot Order", 0x0F)))
                        {
                            Decrement (Local2)
                            Add (Local4, Multiply (DerefOf (Index (Local0, Local2)), 0x0100), 
                                Local4)
                            Increment (Local2)
                            While (LNotEqual (Local5, Local4))
                            {
                                Store (DerefOf (Index (Local0, Local2)), Index (BOIN, Local6))
                                Increment (Local2)
                                Increment (Local5)
                                Increment (Local6)
                                Increment (Local2)
                                Increment (Local5)
                            }

                            If (LEqual (Local5, Local4))
                            {
                                Store (0x00, Local4)
                            }
                        }
                    }

                    If (\SRCM (ST01, "Setup Password", 0x0E))
                    {
                        While (LNotEqual (Local5, Local4))
                        {
                            Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                            Increment (Local2)
                            Increment (Local5)
                            Increment (Local6)
                        }

                        Store (PCBF, NAPW) /* \NAPW */
                        Store (DerefOf (Index (Local0, Local2)), Local4)
                        Increment (Local2)
                        Increment (Local2)
                        Store (0x00, Local5)
                        Store (0x00, Local6)
                        Store (ZPBF (), Local3)
                        While (LNotEqual (Local5, Local4))
                        {
                            Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                            Increment (Local2)
                            Increment (Local5)
                            Increment (Local6)
                        }

                        Store (PCBF, OAPW) /* \OAPW */
                        \_SB.SSMI (0xEA7B, 0x01, 0x04, 0x0400, 0x00)
                        If (LEqual (STAT, 0x00))
                        {
                            Store (0x00, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }

                        If (LEqual (STAT, 0x06))
                        {
                            Store (0x01, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }

                        Return (STAT) /* \STAT */
                    }

                    If (\SRCM (ST01, "Notebook hard drive drivelock master password", 0x2D))
                    {
                        Store (HDDL (Local0, Local2, Local4, 0x00), STAT) /* \STAT */
                        Return (STAT) /* \STAT */
                    }

                    If (\SRCM (ST01, "Notebook hard drive drivelock user password", 0x2B))
                    {
                        Store (HDDL (Local0, Local2, Local4, 0x01), STAT) /* \STAT */
                        Return (STAT) /* \STAT */
                    }

                    If (\SRCM (ST01, "Upgrade bay hard drive drivelock master password", 0x30))
                    {
                        Store (HDDL (Local0, Local2, Local4, 0x02), STAT) /* \STAT */
                        Return (STAT) /* \STAT */
                    }

                    If (\SRCM (ST01, "Upgrade bay hard drive drivelock user password", 0x2E))
                    {
                        Store (HDDL (Local0, Local2, Local4, 0x03), STAT) /* \STAT */
                        Return (STAT) /* \STAT */
                    }

                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (Local4, VFSZ) /* \_SB_.VFSZ */
                    While (LNotEqual (Local5, Local4))
                    {
                        Store (DerefOf (Index (Local0, Local2)), Index (ST02, Local6))
                        Increment (Local2)
                        Increment (Local5)
                        Increment (Local6)
                        Increment (Local2)
                        Increment (Local5)
                    }

                    Store (Local6, LEN2) /* \_SB_.WMID.LEN2 */
                    Store (DerefOf (Index (Local0, Local2)), Local4)
                    If (LAnd (LEqual (ISSP (), 0x01), LEqual (Local4, 0x00)))
                    {
                        Store (0x01, Index (ETYP, 0x00))
                        Notify (\_SB.WMID, 0xA0) // Device-Specific
                        Return (0x06)
                    }

                    Increment (Local2)
                    Increment (Local2)
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (ZPBF (), Local3)
                    While (LNotEqual (Local5, Local4))
                    {
                        Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                        Increment (Local2)
                        Increment (Local5)
                        Increment (Local6)
                    }

                    Store (PCBF, OAPW) /* \OAPW */
                    Store (0x00, Local7)
                    Store (0x00, Local4)
                    Store (0x00, Local2)
                    Store (0xFD, Local5)
                    While (LNotEqual (Local5, Local4))
                    {
                        Store (DerefOf (Index (DerefOf (Index (BISE, Local4)), 0x00)), 
                            ST14) /* \_SB_.ST14 */
                        If (\SRCM (ST01, ST14, SizeOf (ST14)))
                        {
                            Store (0xFD, Local4)
                            Decrement (Local4)
                            Store (0x01, Local2)
                        }

                        Increment (Local7)
                        Increment (Local4)
                    }

                    Decrement (Local7)
                    If (LOr (\SRCM (ST01, "Legacy Boot Order Security Level", 0x20), \SRCM (ST01, "UEFI Boot Order Security Level", 0x1E)))
                    {
                        Store (0x01, Local2)
                    }
                    Else
                    {
                        If (\SRCM (ST01, "Legacy Boot Order", 0x11))
                        {
                            Store (0x03, Local2)
                        }

                        If (\SRCM (ST01, "UEFI Boot Order", 0x0F))
                        {
                            Store (0x08, Local2)
                        }
                    }

                    If (LOr (\SRCM (ST01, "Password Minimum Length", 0x17), \SRCM (ST01, "Manufacturing Programming Mode Counter", 0x26)))
                    {
                        Store (0x06, Local2)
                        If (LEqual (VFSZ, 0x04))
                        {
                            CreateByteField (ST02, 0x00, HIGB)
                            CreateByteField (ST02, 0x01, LOWB)
                            Subtract (HIGB, 0x30, Local4)
                            Subtract (LOWB, 0x30, Local5)
                            Add (Local5, Multiply (Local4, 0x0A), Local4)
                        }
                        Else
                        {
                            CreateByteField (ST02, 0x00, MINL)
                            Subtract (MINL, 0x30, Local4)
                        }

                        If (\SRCM (ST01, "Password Minimum Length", 0x17))
                        {
                            If (LAnd (LGreaterEqual (Local4, 0x04), LLessEqual (Local4, 0x20)))
                            {
                                Store (Local4, PWDL) /* \PWDL */
                                Store (0x00, FLAG) /* \_SB_.FLAG */
                                Store (0x00, Local7)
                            }
                            Else
                            {
                                Store (0x05, STAT) /* \STAT */
                                Return (STAT) /* \STAT */
                            }
                        }

                        If (\SRCM (ST01, "Manufacturing Programming Mode Counter", 0x26))
                        {
                            If (FMOD)
                            {
                                If (LAnd (LGreaterEqual (Local4, 0x00), LLessEqual (Local4, 0x0A)))
                                {
                                    Store (Local4, MPMC) /* \MPMC */
                                    Store (0x00, FLAG) /* \_SB_.FLAG */
                                    Store (0x01, Local7)
                                    If (LEqual (Local4, 0x0A))
                                    {
                                        Store (0x00, Local0)
                                        While (LLess (Local0, 0xFD))
                                        {
                                            Store (DerefOf (Index (DerefOf (Index (BISE, Local0)), 0x00)), 
                                                Local5)
                                            If (\SRCP (Local5, "Manufacturing Programming Mode"))
                                            {
                                                Break
                                            }

                                            Increment (Local0)
                                        }

                                        \_SB.SSMI (0xEA7B, 0x01, Local0, 0x0100, 0x00)
                                        Store (0x00, FMOD) /* \FMOD */
                                    }
                                }
                                Else
                                {
                                    Store (0x05, STAT) /* \STAT */
                                    Return (STAT) /* \STAT */
                                }
                            }
                            Else
                            {
                                Store (0x01, STAT) /* \STAT */
                                Return (STAT) /* \STAT */
                            }
                        }

                        Store (0x06, Local6)
                        ShiftLeft (Local6, 0x08, Local6)
                    }

                    If (LEqual (Local2, 0x00))
                    {
                        Store (0x00, Local7)
                        Store (0x00, Local4)
                        While (LLess (Local4, 0x2F))
                        {
                            Store (DerefOf (Index (DerefOf (Index (BSSS, Local4)), 0x00)), 
                                ST14) /* \_SB_.ST14 */
                            If (\SRCM (ST01, ST14, SizeOf (ST14)))
                            {
                                Store (0x2F, Local4)
                                Store (0x02, Local2)
                            }

                            Increment (Local7)
                            Increment (Local4)
                        }

                        Decrement (Local7)
                    }

                    If (LEqual (Local2, 0x01))
                    {
                        Store (0x05, FLAG) /* \_SB_.FLAG */
                        If (FMOD)
                        {
                            If (\SRCM (ST01, "Manufacturing Programming Mode", 0x1E))
                            {
                                If (\SRCM (ST02, LLCK, 0x04))
                                {
                                    Store (0x00, Local6)
                                    Store (0x00, FLAG) /* \_SB_.FLAG */
                                    Store (0x00, FMOD) /* \FMOD */
                                }
                            }
                        }

                        Store (DerefOf (Index (BISE, Local7)), Local0)
                        Store (0x0E, Local1)
                        Store (DerefOf (Index (Local0, 0x0D)), Local3)
                        Add (Local3, Local1, Local3)
                        While (LLess (Local1, Local3))
                        {
                            Store (DerefOf (Index (Local0, Local1)), Local4)
                            If (\SRCM (ST02, Local4, LEN2))
                            {
                                Subtract (Local1, 0x0E, Local6)
                                Store (0x00, FLAG) /* \_SB_.FLAG */
                                Break
                            }

                            Increment (Local1)
                        }

                        If (\SRCP (DerefOf (Index (Local0, 0x0E)), CHGE))
                        {
                            While (One)
                            {
                                Store (Local6, _T_0) /* \_SB_.WMID.WMBA._T_0 */
                                If (LEqual (_T_0, 0x00))
                                {
                                    Store (0x02, Local6)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x01))
                                    {
                                        Store (0x01, Local6)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x02))
                                        {
                                            Store (0x03, Local6)
                                        }
                                    }
                                }

                                Break
                            }

                            Store (0x01, PCHG) /* \_SB_.PCHG */
                        }
                        Else
                        {
                            If (\SRCP (DerefOf (Index (Local0, 0x0E)), NONO))
                            {
                                If (\SRCM (ST01, "Restore Defaults", 0x10))
                                {
                                    If (\SRCM (ST02, "Yes", 0x03))
                                    {
                                        \_SB.SSMI (0xEA7C, 0x00, 0x00, 0x00, 0x00)
                                        If (LEqual (STAT, 0x00))
                                        {
                                            Store (0x00, Index (ETYP, 0x00))
                                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                                        }

                                        If (LEqual (STAT, 0x06))
                                        {
                                            Store (0x01, Index (ETYP, 0x00))
                                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                                        }
                                    }
                                }
                                Else
                                {
                                    If (LEqual (\SRCM (ST01, "Reset BIOS security to factory default", 0x26), 0x00))
                                    {
                                        Store (0x01, PCHG) /* \_SB_.PCHG */
                                    }
                                }
                            }
                            Else
                            {
                                If (LAnd (\SRCM (ST01, "Parallel port mode", 0x12), LEqual (Local6, 0x03)))
                                {
                                    Store (0x04, Local6)
                                }
                                Else
                                {
                                    If (\SRCM (ST01, "Disable charging port in all sleep/off states below(%):", 0x37))
                                    {
                                        Increment (Local6)
                                    }
                                    Else
                                    {
                                        If (\SRCM (ST01, "Manufacturing Programming Mode", 0x1E))
                                        {
                                            If (LNot (FMOD))
                                            {
                                                If (LEqual (Local6, 0x01))
                                                {
                                                    Store (0x05, FLAG) /* \_SB_.FLAG */
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }

                        If (LEqual (PCHG, 0x01))
                        {
                            Store (0x01, Local1)
                            If (FMOD)
                            {
                                If (LOr (\SRCM (ST01, "Reset Authentication Credential", 0x1F), \SRCM (ST01, "TPM Reset to Factory Defaults", 0x1D)))
                                {
                                    Store (0x00, Local1)
                                }
                            }

                            If (LAnd (Local1, LEqual (ISSP (), 0x00)))
                            {
                                Store (0x8001, STAT) /* \STAT */
                                Return (STAT) /* \STAT */
                            }
                        }

                        And (Local6, 0xFF, Local6)
                        Store (0x01, Local3)
                        Or (ShiftLeft (Local3, 0x08), Local6, Local6)
                    }

                    If (LEqual (Local2, 0x02))
                    {
                        Store (0x00, Local4)
                        Store (0x02, Local5)
                        If (LEqual (FMOD, 0x00))
                        {
                            While (LLess (Local4, SizeOf (MPMS)))
                            {
                                If (\SRCM (ST01, DerefOf (Index (MPMS, Local4)), SizeOf (ST01)))
                                {
                                    Store (0x01, STAT) /* \STAT */
                                    Return (STAT) /* \STAT */
                                }

                                Increment (Local4)
                            }

                            Store (0x00, Local4)
                        }

                        While (LLess (Local4, SizeOf (TROS)))
                        {
                            If (\SRCM (ST01, DerefOf (Index (TROS, Local4)), SizeOf (ST01)))
                            {
                                Store (0x01, STAT) /* \STAT */
                                Return (STAT) /* \STAT */
                            }

                            Increment (Local4)
                        }

                        Store (0x00, Local4)
                        Store (0x00, Local7)
                        If (\SRCM (ST01, "Asset Tracking Number", SizeOf (ST01)))
                        {
                            Store (ST02, BF2S) /* \_SB_.BF2S */
                            Store (0x00, Local4)
                            Store (0x00, Local5)
                            Store (0x00, Local1)
                            Store (SizeOf (ST02), Local1)
                            While (LNotEqual (Local5, Local1))
                            {
                                If (LEqual (DerefOf (Index (ST02, Local4)), 0x00))
                                {
                                    Store (SizeOf (ST02), Local5)
                                    Decrement (Local5)
                                }

                                Increment (Local4)
                                Increment (Local5)
                            }

                            Decrement (Local4)
                            If (LGreater (Local4, 0x12))
                            {
                                Store (0x05, FLAG) /* \_SB_.FLAG */
                            }
                            Else
                            {
                                Store (0x00, FLAG) /* \_SB_.FLAG */
                            }

                            Store (Local4, ASTL) /* \ASTL */
                            Store (ST02, WATS) /* \_SB_.WATS */
                            Store (WATS, ASTG) /* \ASTG */
                            Store (ASTG, WTB3) /* \_SB_.WTB3 */
                        }

                        If (\SRCM (ST01, "Ownership Tag", SizeOf (ST01)))
                        {
                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x50))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (WONT, Local1))
                                Increment (Local1)
                            }

                            Store (WONT, OWNT) /* \OWNT */
                            Store (0x01, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "BIOS Power-On Time (hh:mm)", SizeOf (ST01)))
                        {
                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x05))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TATM, Local1))
                                Increment (Local1)
                            }

                            Store (TATM, ATIM) /* \ATIM */
                            Store (0x03, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "System Configuration ID", 0x17))
                        {
                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x40))
                            {
                                Store (0x00, Index (TPCD, Local1))
                                Increment (Local1)
                            }

                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x40))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TPCD, Local1))
                                Increment (Local1)
                            }

                            Store (TPCD, PCID) /* \PCID */
                            Store (0x04, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "Serial Number", 0x0D))
                        {
                            Store (0x00, Local1)
                            While (LLess (Local1, SizeOf (TBUF)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TBUF, Local1))
                                Increment (Local1)
                            }

                            Store (TBUF, SERL) /* \SERL */
                            Store (0x06, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "SKU Number", 0x0A))
                        {
                            Store (0x00, Local1)
                            While (LLess (Local1, SizeOf (TSKU)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TSKU, Local1))
                                Increment (Local1)
                            }

                            Store (TSKU, SKUN) /* \SKUN */
                            Store (0x07, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "Product Name", 0x0C))
                        {
                            Store (0x00, Local1)
                            While (LLess (Local1, SizeOf (TBUF)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TBUF, Local1))
                                Increment (Local1)
                            }

                            Store (TBUF, MODL) /* \MODL */
                            Store (0x08, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "MS Digital Marker", 0x11))
                        {
                            Store (0x00, Local1)
                            While (LLess (Local1, SizeOf (TOA3)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TOA3, Local1))
                                Increment (Local1)
                            }

                            Store (TOA3, MSDM) /* \MSDM */
                            Store (0x0A, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "Product Family", 0x0E))
                        {
                            Store (0x00, Local1)
                            While (LLess (Local1, SizeOf (WTB4)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (WTB4, Local1))
                                Increment (Local1)
                            }

                            Store (WTB4, PLFN) /* \PLFN */
                            Store (0x0B, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "System Board CT", 0x0F))
                        {
                            Store (0x00, Local1)
                            While (LNotEqual (Local1, SizeOf (TBCT)))
                            {
                                Store (0x00, Index (TBCT, Local1))
                                Increment (Local1)
                            }

                            Store (0x00, Local1)
                            While (LLess (Local1, Subtract (SizeOf (TBCT), 0x01)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TBCT, Local1))
                                Increment (Local1)
                            }

                            Store (TBCT, SBCT) /* \SBCT */
                            Store (0x09, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "Define Custom URL", 0x11))
                        {
                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x82))
                            {
                                Store (0x00, Index (TURL, Local1))
                                Increment (Local1)
                            }

                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x82))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (TURL, Local1))
                                Increment (Local1)
                            }

                            Store (TURL, CURL) /* \CURL */
                            Store (0x05, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "HP Hypervisor Version", 0x15))
                        {
                            Store ("HP Hypervisor Version", Debug)
                            Store (0x00, Local1)
                            While (LLess (Local1, SizeOf (WHVV)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (WHVV, Local1))
                                Increment (Local1)
                            }

                            Store (WHVV, HVER) /* \HVER */
                            Store (0x0C, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                            Store (HVER, Debug)
                        }

                        If (\SRCM (ST01, "HP Hypervisor Config Hash", 0x19))
                        {
                            Store ("HP Hypervisor Config Hash", Debug)
                            Store (0x00, Local1)
                            While (LLess (Local1, SizeOf (WHVC)))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (WHVC, Local1))
                                Increment (Local1)
                            }

                            Store (WHVC, HVCH) /* \HVCH */
                            Store (0x0D, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                            Store (HVCH, Debug)
                        }

                        If (\SRCM (ST01, "Custom Boot Path", SizeOf (ST01)))
                        {
                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x3B))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (WCBT, Local1))
                                Increment (Local1)
                            }

                            Store (WCBT, CUBT) /* \CUBT */
                            Store (0x0E, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        If (\SRCM (ST01, "Turbo Boost support while on battery", 0x24))
                        {
                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x0A))
                            {
                                Store (0x00, Index (WETD, Local1))
                                Increment (Local1)
                            }

                            Store (0x00, Local1)
                            While (LNotEqual (Local1, 0x0A))
                            {
                                Store (DerefOf (Index (ST02, Local1)), Index (WETD, Local1))
                                Increment (Local1)
                            }

                            Store (WETD, ETOD) /* \ETOD */
                            Store (0x10, Local7)
                            Store (0x00, FLAG) /* \_SB_.FLAG */
                        }

                        Store (0x02, Local6)
                        ShiftLeft (Local6, 0x08, Local6)
                    }

                    If (LEqual (Local2, 0x03))
                    {
                        Store (0x00, Local1)
                        Store (0x00, Local2)
                        Store (0x00, Local3)
                        Store (0x00, Local4)
                        Store (0x00, Local5)
                        Store (0x00, Local6)
                        Store (0x00, Local7)
                        \_SB.SSMI (0xEA7B, 0x00, 0x03, 0x00, 0x00)
                        Store (0x00, Local2)
                        Store (BORD, WSIP) /* \_SB_.WSIP */
                        Store (GBID (), Local1)
                        Store (0x00, DVAL) /* \_SB_.DVAL */
                        While (LLess (Local2, 0x64))
                        {
                            Store (0x00, Local5)
                            Store (0x00, Local6)
                            While (LLess (Local6, 0x09))
                            {
                                If (LEqual (DerefOf (Index (BOID, Local2)), DerefOf (Index (WSIP, 
                                    Local5))))
                                {
                                    Store (0x01, DVAL) /* \_SB_.DVAL */
                                    Store (Subtract (0x09, 0x01), Local6)
                                }

                                Increment (Local5)
                                Increment (Local6)
                            }

                            Decrement (Local5)
                            If (LEqual (DVAL, 0x01))
                            {
                                Store (Local5, Local4)
                                Decrement (Local4)
                                While (LGreater (Local5, Local3))
                                {
                                    Store (DerefOf (Index (WSIP, Local4)), Index (WSIP, Local5))
                                    Decrement (Local5)
                                    Decrement (Local4)
                                }

                                Store (DerefOf (Index (BOID, Local2)), Index (WSIP, Local3))
                                Increment (Local3)
                            }

                            Increment (Local2)
                            Store (0x00, DVAL) /* \_SB_.DVAL */
                        }

                        Store (WSIP, BORD) /* \BORD */
                        Store (0x00, FLAG) /* \_SB_.FLAG */
                        Store (0x00, Local7)
                        Store (0x03, Local6)
                        ShiftLeft (Local6, 0x08, Local6)
                    }

                    If (LEqual (Local2, 0x08))
                    {
                        Store (0x00, Local1)
                        Store (0x00, Local2)
                        Store (0x00, Local3)
                        Store (0x00, Local4)
                        Store (0x00, Local5)
                        Store (0x00, Local6)
                        Store (0x00, Local7)
                        \_SB.SSMI (0xEA7B, 0x00, 0x08, 0x00, 0x00)
                        Store (0x00, Local2)
                        Store (WUFI, SUIP) /* \_SB_.SUIP */
                        Store (GBID (), Local1)
                        Store (0x00, DVAL) /* \_SB_.DVAL */
                        While (LLess (Local2, 0x64))
                        {
                            Store (0x00, Local5)
                            Store (0x00, Local6)
                            While (LLess (Local6, 0x09))
                            {
                                If (LEqual (DerefOf (Index (BOID, Local2)), DerefOf (Index (SUIP, 
                                    Local5))))
                                {
                                    Store (0x01, DVAL) /* \_SB_.DVAL */
                                    Store (Subtract (0x09, 0x01), Local6)
                                }

                                Increment (Local5)
                                Increment (Local6)
                            }

                            Decrement (Local5)
                            If (LEqual (DVAL, 0x01))
                            {
                                Store (Local5, Local4)
                                Decrement (Local4)
                                While (LGreater (Local5, Local3))
                                {
                                    Store (DerefOf (Index (SUIP, Local4)), Index (SUIP, Local5))
                                    Decrement (Local5)
                                    Decrement (Local4)
                                }

                                Store (DerefOf (Index (BOID, Local2)), Index (SUIP, Local3))
                                Increment (Local3)
                            }

                            Increment (Local2)
                            Store (0x00, DVAL) /* \_SB_.DVAL */
                        }

                        Store (SUIP, WUFI) /* \WUFI */
                        Store (0x00, FLAG) /* \_SB_.FLAG */
                        Store (0x00, Local7)
                        Store (0x08, Local6)
                        ShiftLeft (Local6, 0x08, Local6)
                    }

                    If (LEqual (Local2, 0x00))
                    {
                        Store (0x01, STAT) /* \STAT */
                        Return (STAT) /* \STAT */
                    }

                    If (LEqual (FLAG, 0x05))
                    {
                        Store (0x05, STAT) /* \STAT */
                        Return (STAT) /* \STAT */
                    }

                    If (LNotEqual (Local2, 0x00))
                    {
                        \_SB.SSMI (0xEA7B, 0x01, Local7, Local6, 0x00)
                        If (LEqual (STAT, 0x00))
                        {
                            Store (0x00, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }

                        If (LEqual (STAT, 0x06))
                        {
                            Store (0x01, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }
                    }

                    Return (STAT) /* \STAT */
                }

                If (LEqual (Arg1, 0x02))
                {
                    Store (Arg2, Local0)
                    Store (SizeOf (Local0), Local1)
                    Store (0x00, Local2)
                    Store (DerefOf (Index (Local0, Local2)), Local4)
                    Increment (Local2)
                    Increment (Local2)
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (0x00, Local3)
                    Store (ZPBF (), Local3)
                    If (LEqual (ISSP (), 0x01))
                    {
                        While (LNotEqual (Local5, Local4))
                        {
                            Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                            Increment (Local2)
                            Increment (Local5)
                            Increment (Local6)
                        }

                        Store (PCBF, OAPW) /* \OAPW */
                        Store (DerefOf (Index (Local0, Local2)), Local4)
                        Increment (Local2)
                        Increment (Local2)
                        Store (0x00, Local5)
                        Store (0x00, Local6)
                        While (LNotEqual (Local5, Local4))
                        {
                            Store (DerefOf (Index (Local0, Local2)), Index (STG1, Local6))
                            Increment (Local2)
                            Increment (Local5)
                            Increment (Local6)
                            Increment (Local2)
                            Increment (Local5)
                        }
                    }

                    If (\SRCM (STG1, "true", 0x04))
                    {
                        \_SB.SSMI (0xEA7C, 0x01, 0x00, 0x00, 0x00)
                        If (LEqual (STAT, 0x00))
                        {
                            Store (0x00, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }

                        If (LEqual (STAT, 0x06))
                        {
                            Store (0x01, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }

                        Return (STAT) /* \STAT */
                    }
                    Else
                    {
                        \_SB.SSMI (0xEA7C, 0x00, 0x00, 0x00, 0x00)
                        If (LEqual (STAT, 0x00))
                        {
                            Store (0x00, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }

                        If (LEqual (STAT, 0x06))
                        {
                            Store (0x01, Index (ETYP, 0x00))
                            Notify (\_SB.WMID, 0xA0) // Device-Specific
                        }

                        Return (STAT) /* \STAT */
                    }
                }
                Else
                {
                    Store (0x05, STAT) /* \STAT */
                    Return (STAT) /* \STAT */
                }
            }

            Method (IBUF, 0, NotSerialized)
            {
                Store (0x00, Local3)
                Store (0x05, STAT) /* \STAT */
                While (LNotEqual (Local3, SizeOf (ST01)))
                {
                    Store (0x00, Index (ST01, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (ST02)))
                {
                    Store (0x00, Index (ST02, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (ST03)))
                {
                    Store (0x00, Index (ST03, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (BOIN)))
                {
                    Store (0x00, Index (BOIN, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (BOID)))
                {
                    Store (0xFF, Index (BOID, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (WSPS)))
                {
                    Store (0x00, Index (WSPS, Local3))
                    Store (0x00, Index (WNWP, Local3))
                    Store (0x00, Index (WPPS, Local3))
                    Store (0x00, Index (WNPP, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (PCBF)))
                {
                    Store (0x00, Index (PCBF, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (ST11)))
                {
                    Store (0x00, Index (ST11, Local3))
                    Increment (Local3)
                }

                Store (WSPS, OAPW) /* \OAPW */
                Store (WNWP, NAPW) /* \NAPW */
                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (BVAL)))
                {
                    Store (0x00, Index (BVAL, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, SizeOf (BF01)))
                {
                    Store (0x00, Index (BF01, Local3))
                    Increment (Local3)
                }

                Store (0x00, Local3)
                While (LNotEqual (Local3, 0x09))
                {
                    Store (0x00, Index (SUIP, Local3))
                    Increment (Local3)
                }

                Return (0x00)
            }

            Method (WMAC, 3, NotSerialized)
            {
                If (LEqual (Arg1, 0x01))
                {
                    Store (Arg2, Local0)
                    Store (SizeOf (Local0), Local1)
                    Store (0x00, Local2)
                    Store (DerefOf (Index (Local0, Local2)), Local4)
                    Increment (Local2)
                    Increment (Local2)
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (0x00, Local3)
                    If (LGreater (Local4, 0x40))
                    {
                        Store (0x05, STAT) /* \STAT */
                        Return (STAT) /* \STAT */
                    }

                    Store (0x00, Local3)
                    While (LNotEqual (Local3, SizeOf (BUFU)))
                    {
                        Store (0x00, Index (BUFU, Local3))
                        Increment (Local3)
                    }

                    Divide (Local4, 0x02, Local3, Local1)
                    Store (0x00, Local3)
                    While (LNotEqual (Local5, Local4))
                    {
                        Store (DerefOf (Index (Local0, Local2)), Index (BUFU, Local6))
                        Increment (Local2)
                        Increment (Local5)
                        Increment (Local6)
                        Increment (Local2)
                        Increment (Local5)
                    }

                    And (Local1, 0x01, Local5)
                    If (LEqual (Local5, 0x00))
                    {
                        Store (DerefOf (Index (Local0, Local2)), Local4)
                        Increment (Local2)
                        Increment (Local2)
                    }

                    Store (BUFU, USRN) /* \USRN */
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    CreateDWordField (Local0, Local2, WROL)
                    Store (WROL, ROLE) /* \ROLE */
                    Add (Local2, 0x04, Local2)
                    CreateDWordField (Local0, Local2, WCMD)
                    Store (WCMD, CMDV) /* \CMDV */
                    Add (Local2, 0x04, Local2)
                    CreateDWordField (Local0, Local2, WKBD)
                    Store (WKBD, KBDL) /* \KBDL */
                    Add (Local2, 0x04, Local2)
                    Store (DerefOf (Index (Local0, Local2)), Local4)
                    Increment (Local2)
                    Increment (Local2)
                    Store (ZPBF (), Local3)
                    Store (PCBF, OAPW) /* \OAPW */
                    Store (PCBF, NAPW) /* \NAPW */
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (0x00, Local3)
                    While (LNotEqual (Local5, Local4))
                    {
                        Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                        Increment (Local2)
                        Increment (Local5)
                        Increment (Local6)
                    }

                    Store (PCBF, OAPW) /* \OAPW */
                    Store (DerefOf (Index (Local0, Local2)), Local4)
                    Increment (Local2)
                    Increment (Local2)
                    Store (0x00, Local5)
                    Store (0x00, Local6)
                    Store (ZPBF (), Local3)
                    While (LNotEqual (Local5, Local4))
                    {
                        Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                        Increment (Local2)
                        Increment (Local5)
                        Increment (Local6)
                    }

                    Store (PCBF, NAPW) /* \NAPW */
                    \_SB.SSMI (0xEA7B, 0x03, CMDV, 0x00, 0x00)
                    If (LEqual (STAT, 0x00))
                    {
                        Store (0x00, Index (ETYP, 0x00))
                        Notify (\_SB.WMID, 0xA0) // Device-Specific
                    }

                    If (LEqual (STAT, 0x06))
                    {
                        Store (0x01, Index (ETYP, 0x00))
                        Notify (\_SB.WMID, 0xA0) // Device-Specific
                    }

                    Return (STAT) /* \STAT */
                }
                Else
                {
                    Store (0x05, STAT) /* \STAT */
                    Return (STAT) /* \STAT */
                }
            }

            Method (STLN, 1, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (0x00, Local1)
                While (LNotEqual (Local1, SizeOf (Local0)))
                {
                    Store (DerefOf (Index (Local0, Local1)), Local2)
                    If (LEqual (Local2, 0x00))
                    {
                        Store (SizeOf (Local0), Local1)
                    }
                    Else
                    {
                        Increment (Local1)
                    }
                }

                Return (Local1)
            }

            Method (HDDL, 4, NotSerialized)
            {
                Store (Arg0, Local0)
                Store (Arg1, Local2)
                Store (Arg2, Local4)
                Store (Arg3, Local3)
                Store (0x00, Local6)
                Store (0x00, Local5)
                While (LNotEqual (Local5, Local4))
                {
                    Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                    Increment (Local2)
                    Increment (Local5)
                    Increment (Local6)
                }

                Store (PCBF, NAPW) /* \NAPW */
                Store (DerefOf (Index (Local0, Local2)), Local4)
                Increment (Local2)
                Increment (Local2)
                Store (0x00, Local5)
                Store (0x00, Local6)
                Store (ZPBF (), Local1)
                While (LNotEqual (Local5, Local4))
                {
                    Store (DerefOf (Index (Local0, Local2)), Index (PCBF, Local6))
                    Increment (Local2)
                    Increment (Local5)
                    Increment (Local6)
                }

                Store (PCBF, OAPW) /* \OAPW */
                \_SB.SSMI (0xEA7B, 0x01, Local3, 0x0700, 0x00)
                If (LEqual (STAT, 0x00))
                {
                    Store (0x00, Index (ETYP, 0x00))
                    Notify (\_SB.WMID, 0xA0) // Device-Specific
                }
                Else
                {
                }

                If (LEqual (STAT, 0x06))
                {
                    Store (0x01, Index (ETYP, 0x00))
                    Notify (\_SB.WMID, 0xA0) // Device-Specific
                }

                Return (STAT) /* \STAT */
            }

            Name (THCT, Buffer (0x06)
            {
                 0x01, 0x01, 0x03, 0x01, 0x01, 0x02
            })
            Name (PRFI, Buffer (0x06)
            {
                 0x00, 0x08, 0x0C, 0x14, 0x18, 0x1C
            })
            Name (TSTM, 0x00)
            Name (TSTV, Package (0x06)
            {
                Buffer (0x01)
                {
                     0xFF
                }, 

                Buffer (0x01)
                {
                     0xFF
                }, 

                Buffer (0x03)
                {
                     0xFF, 0xFF, 0xFF
                }, 

                Buffer (0x01)
                {
                     0xFF
                }, 

                Buffer (0x01)
                {
                     0xFF
                }, 

                Buffer (0x02)
                {
                     0xFF, 0xFF
                }
            })
            Method (WMAA, 3, Serialized)
            {
                Store ("WMAA Enter", Debug)
                Return (WHCM (Arg1, Arg2))
            }

            Method (WGDD, 0, NotSerialized)
            {
                Store ("GetDisplayDevices", Debug)
                Store (VGDD (0x01), Local1)
                If (LEqual (Local1, 0xFFFF))
                {
                    Return (Package (0x02)
                    {
                        0x04, 
                        0x00
                    })
                }
                Else
                {
                    And (Local1, 0x1F, Local2)
                    If (And (Local1, 0xFFE0))
                    {
                        Or (Local2, 0x20, Local2)
                    }

                    Store (Package (0x03)
                        {
                            0x00, 
                            0x04, 
                            Buffer (0x04) {}
                        }, Local0)
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                    Return (Local0)
                }
            }

            Method (WSDD, 1, NotSerialized)
            {
                Store ("SETDisplayDevices", Debug)
                Store (Arg0, Debug)
                And (Arg0, 0x1F, Local0)
                If (And (Arg0, 0x20))
                {
                    And (WDST, 0xFFE0, Local1)
                    If (FindSetRightBit (Local1, Local2))
                    {
                        ShiftLeft (0x01, Decrement (Local2), Local3)
                        Or (Local0, Local3, Local0)
                    }
                }

                Store (Local0, Debug)
                Store (WDPE, Debug)
                If (LEqual (VSDD (Local0), 0xFFFF))
                {
                    Return (Package (0x02)
                    {
                        0x04, 
                        0x00
                    })
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        0x00, 
                        0x00
                    })
                }
            }

            Method (WGHP, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x04, 
                    0x00
                })
            }

            Method (WITH, 1, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x04, 
                    0x00
                })
            }

            Method (WALS, 0, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x04, 
                    0x00
                })
            }

            Method (WSAL, 1, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x04, 
                    0x00
                })
            }

            Method (WGDS, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        0x00, 
                        0x01, 
                        Buffer (0x01)
                        {
                             0x00
                        }
                    }, Local0)
                If (\_SB.DCKD ())
                {
                    Store (Package (0x03)
                        {
                            0x00, 
                            0x01, 
                            Buffer (0x01)
                            {
                                 0x01
                            }
                        }, Local0)
                }

                Return (Local0)
            }

            Method (WGWS, 0, NotSerialized)
            {
                Store (Package (0x03) {}, Local2)
                Store (0x00, Index (Local2, 0x00))
                Store (0x50, Index (Local2, 0x01))
                Store (WLDA, Index (Local2, 0x02))
                Return (Local2)
            }

            Method (WSWS, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x1B, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SBBC, 1, NotSerialized)
            {
                Return (Package (0x02)
                {
                    0x04, 
                    0x00
                })
            }

            Method (WGBI, 1, NotSerialized)
            {
                If (LLess (Arg0, SizeOf (NBTI)))
                {
                    Return (\_SB.PCI0.LPCB.EC0.GBTI (Arg0))
                }
                Else
                {
                    Return (Package (0x02)
                    {
                        0x06, 
                        0x00
                    })
                }
            }

            Method (WGBN, 0, NotSerialized)
            {
                Store ("Return Bezel function table", Debug)
                Store (0x10, Local0)
                Add (Local0, 0x02, Local0)
                Store (Buffer (0x0A)
                    {
                        /* 0000 */   0x31, 0x01, 0xAE, 0x01, 0x9E, 0x01, 0xB6, 0x01,
                        /* 0008 */   0xB7, 0x01
                    }, Local1)
                Concatenate (Local1, Buffer (0x08)
                    {
                         0xFF, 0xFF, 0x9B, 0x21, 0xA9, 0x21, 0x00, 0x00
                    }, Local2)
                Store (Package (0x03) {}, Local3)
                Store (0x00, Index (Local3, 0x00))
                Store (Local0, Index (Local3, 0x01))
                Store (Local2, Index (Local3, 0x02))
                Return (Local3)
            }

            Method (GHKS, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        0x00, 
                        0x04, 
                        Buffer (0x04) {}
                    }, Local0)
                Store (\_SB.PCI0.LPCB.EC0.GSHK (), Index (DerefOf (Index (Local0, 0x02)), 0x00))
                Return (Local0)
            }

            Method (SHKS, 1, NotSerialized)
            {
                \_SB.PCI0.LPCB.EC0.SSHK (Arg0)
                Store ("SHK VALUE", Debug)
                Store (\_SB.PCI0.LPCB.EC0.SHK, Debug)
                Return (Package (0x02)
                {
                    0x00, 
                    0x00
                })
            }

            Method (FUF4, 1, NotSerialized)
            {
                And (Arg0, 0x1F, Local0)
                And (Arg0, 0xFFE0, Local1)
                If (Local1)
                {
                    Or (Local0, 0x20, Local0)
                    FindSetRightBit (Local1, Local2)
                    ShiftLeft (0x01, Decrement (Local2), Local3)
                    And (Local1, Not (Local3), Local1)
                    If (Local1)
                    {
                        Or (Local0, 0x10, Local0)
                    }
                }

                Return (Local0)
            }

            Method (HKFR, 0, NotSerialized)
            {
                Store ("HotkeyFunctionResponse", Debug)
                Store (Package (0x03)
                    {
                        0x00, 
                        0x04, 
                        Buffer (0x04) {}
                    }, Local0)
                Store (ASMB, Local2)
                Store (DerefOf (Index (Local2, 0x00)), Local1)
                If (LEqual (Local1, 0x0D))
                {
                    Store (0x31, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                }

                If (LEqual (Local1, 0x04))
                {
                    Store ("VideoGetDisplayDevices enter", Debug)
                    VGDD (0x00)
                    Store (0xAE, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                    Store (FUF4 (WDGN), Local3)
                    Store (FUF4 (WDSA), Local4)
                    Store (Local3, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                    Store (Local4, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                    Store ("Next Display devices variable", Debug)
                    Store (WDGN, Debug)
                    Store ("Current active Display Devices Variable", Debug)
                    Store (WDSA, Debug)
                    Store ("VideoGetDisplayDevices exit", Debug)
                }

                If (LEqual (Local1, 0x05))
                {
                    Store (0x9D, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                }

                If (LEqual (Local1, 0x06))
                {
                    Store (0x9E, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                }

                If (LOr (LEqual (Local1, 0x02), LEqual (Local1, 0x03)))
                {
                    If (LEqual (Local1, 0x02))
                    {
                        Store (0x09, Local1)
                    }
                    Else
                    {
                        If (LEqual (Local1, 0x03))
                        {
                            Store (0x0A, Local1)
                        }
                    }

                    \_GPE.VBRE (Local1)
                    Add (0xAD, Local1, Index (DerefOf (Index (Local0, 0x02)), 0x00
                        ))
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                    If (And (WDPE, 0x40))
                    {
                        Wait (\_SB.BEVT, 0x10)
                    }

                    Store (BRID, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                    Store (DerefOf (Index (Local2, 0x03)), Index (DerefOf (Index (Local0, 
                        0x02)), 0x03))
                }

                Return (Local0)
            }

            Method (GHKF, 0, NotSerialized)
            {
                Store (WDPE, Debug)
                Store (WDSA, Debug)
                Store (WDST, Debug)
                Store (WDGN, Debug)
                Reset (\_SB.BEVT)
                Reset (\_SB.F4EV)
                \_SB.SSMI (0xEA75, 0x01, 0x0A, 0x574D4953, 0x00)
                Store (DID1, Debug)
                Store (WDSA, Debug)
                Store (WDST, Debug)
                Store (WDGN, Debug)
                Return (HKFR ())
            }

            Method (SHKF, 1, NotSerialized)
            {
                Reset (\_SB.BEVT)
                Reset (\_SB.F4EV)
                \_SB.SSMI (0xEA75, 0x02, 0x0A, 0x574D4953, 0x00)
                Return (HKFR ())
            }

            Method (WGBV, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        0x00, 
                        0x04, 
                        Buffer (0x04) {}
                    }, Local0)
                Store (WLBN, Local1)
                Store (0x00, WLBN) /* \WLBN */
                If (LEqual (Local1, 0x01))
                {
                    Store (0x9B, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x21, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                }

                If (LEqual (Local1, 0x02))
                {
                    Store (0x9A, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x21, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                }

                If (LEqual (Local1, 0x03))
                {
                    Store (\_SB.PCI0.LPCB.EC0.TP, Local2)
                    Store (0xA9, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x21, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                    Store (0x00, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                }

                Return (Local0)
            }

            Method (GSAS, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        0x00, 
                        0x04, 
                        Buffer (0x04) {}
                    }, Local0)
                Store (\_SB.PCI0.LPCB.EC0.GPID (), Local1)
                Add (Local1, 0x01, Local1)
                Store (Local1, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                Return (Local0)
            }

            Method (GSRV, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x10, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GVPR, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x11, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GBRS, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x12, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SSRV, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x10, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GWPT, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x14, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SWPT, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x14, 0x574D4953, 0x00)
                Store (WFDA (), Local1)
                HWWB ()
                Return (Local1)
            }

            Method (HWWB, 0, NotSerialized)
            {
                Store (BT0P, Local0)
                If (LNotEqual (Local0, 0x1F))
                {
                    Store (0x00, Local0)
                }

                \_SB.SSMI (0xEA3A, 0x00, Local0, 0x00, 0x00)
                \_GPE.HWWP (0x01)
                WGWE (0x05, 0x00)
            }

            Method (GDBT, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x18, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SDBT, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x18, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GFRT, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x0D, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SDMD, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x1D, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GDMD, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x1D, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SBUS, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x1E, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GBUS, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x1E, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (STMM, 1, NotSerialized)
            {
                Store ("SetThermalStatus", Debug)
                CreateByteField (Arg0, 0x00, IDTA)
                If (LAnd (LGreaterEqual (IDTA, 0x10), LLessEqual (IDTA, 0x15)))
                {
                    \_SB.SSMI (0xEA75, 0x02, 0x28, 0x574D4953, 0x00)
                    Return (WFDA ())
                }

                Store (Package (0x02)
                    {
                        0x00, 
                        0x00
                    }, Local0)
                If (LAnd (LGreaterEqual (IDTA, 0x20), LLessEqual (IDTA, 0x24)))
                {
                    Subtract (IDTA, 0x20, Local7)
                    Store (DerefOf (Index (Arg0, 0x01)), Local1)
                    Store (DerefOf (Index (Arg0, 0x02)), Local2)
                    If (LNotEqual (Local1, DerefOf (Index (THCT, Local7))))
                    {
                        Return (Package (0x02)
                        {
                            0x06, 
                            0x00
                        })
                    }

                    If (LEqual (Local1, 0x00))
                    {
                        Return (Local0)
                    }

                    If (\_SB.PCI0.LPCB.EC0.ECRG)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                        If (LOr (LLess (Local7, 0x03), LEqual (Local7, 0x04)))
                        {
                            Store (Add (0x01, Local7), \_SB.PCI0.LPCB.EC0.CRZN)
                            If (LEqual (Local2, 0xFF))
                            {
                                Store (0x00, Local2)
                            }

                            Store (Local2, \_SB.PCI0.LPCB.EC0.TEMP)
                            If (LEqual (Local7, 0x02))
                            {
                                Store (DerefOf (Index (Arg0, 0x03)), Local2)
                                Store (0x04, \_SB.PCI0.LPCB.EC0.CRZN)
                                If (LEqual (Local2, 0xFF))
                                {
                                    Store (0x00, Local2)
                                }

                                Store (Local2, \_SB.PCI0.LPCB.EC0.TEMP)
                            }
                        }
                        Else
                        {
                            If (LNotEqual (Local2, 0xFF))
                            {
                                Store (\_TZ.CTCT (Local2), Local2)
                            }

                            Store (Local2, \_SB.PCI0.LPCB.EC0.FTGC)
                        }

                        Release (\_SB.PCI0.LPCB.EC0.ECMX)
                    }

                    Store (0x00, Local6)
                    While (LLess (Local6, Local1))
                    {
                        Store (DerefOf (Index (Arg0, Add (Local6, 0x02))), Index (
                            DerefOf (Index (TSTV, Local7)), Local6))
                        Increment (Local6)
                    }

                    Store (0x01, TSTM) /* \_SB_.WMID.TSTM */
                    Return (Local0)
                }

                If (LEqual (IDTA, 0xAA))
                {
                    Store (0x00, Local1)
                    While (LLess (Local1, SizeOf (TSTV)))
                    {
                        Store (0x00, Local2)
                        Store (DerefOf (Index (THCT, Local1)), Local3)
                        While (LLess (Local2, Local3))
                        {
                            Store (0xFF, Index (DerefOf (Index (TSTV, Local1)), Local2))
                            Increment (Local2)
                        }

                        Increment (Local1)
                    }

                    If (\_SB.PCI0.LPCB.EC0.ECRG)
                    {
                        Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                        Store (0x01, Local1)
                        While (LLessEqual (Local1, 0x05))
                        {
                            Store (Local1, \_SB.PCI0.LPCB.EC0.CRZN)
                            Store (0x00, \_SB.PCI0.LPCB.EC0.TEMP)
                            Increment (Local1)
                        }

                        Store (0xFF, \_SB.PCI0.LPCB.EC0.FTGC)
                        Release (\_SB.PCI0.LPCB.EC0.ECMX)
                    }

                    Store (0x00, TSTM) /* \_SB_.WMID.TSTM */
                    Return (Local0)
                }

                Return (Package (0x02)
                {
                    0x06, 
                    0x00
                })
            }

            Method (GTMS, 1, NotSerialized)
            {
                Store ("GetThermalStatus", Debug)
                Store (Arg0, Debug)
                Store (Package (0x03)
                    {
                        0x00, 
                        0x80, 
                        Buffer (0x80) {}
                    }, Local0)
                CreateByteField (Arg0, 0x00, IDTA)
                If (LAnd (LGreaterEqual (IDTA, 0x00), LLessEqual (IDTA, 0x04)))
                {
                    Store (DerefOf (Index (THCT, IDTA)), Local2)
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    If (LEqual (Local2, 0x00))
                    {
                        Return (Local0)
                    }

                    If (LOr (LLess (IDTA, 0x03), LEqual (IDTA, 0x04)))
                    {
                        If (\_SB.PCI0.LPCB.EC0.ECRG)
                        {
                            Acquire (\_SB.PCI0.LPCB.EC0.ECMX, 0xFFFF)
                            Store (Add (0x01, IDTA), \_SB.PCI0.LPCB.EC0.CRZN)
                            Store (\_SB.PCI0.LPCB.EC0.DTMP, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                            If (LEqual (IDTA, 0x02))
                            {
                                Store (0x04, \_SB.PCI0.LPCB.EC0.CRZN)
                                Store (\_SB.PCI0.LPCB.EC0.DTMP, Index (DerefOf (Index (Local0, 0x02)), 0x02))
                            }

                            Release (\_SB.PCI0.LPCB.EC0.ECMX)
                        }

                        If (LEqual (IDTA, 0x02))
                        {
                            Store (PCHT, Index (DerefOf (Index (Local0, 0x02)), 0x03))
                        }
                    }

                    If (LEqual (IDTA, 0x03))
                    {
                        Store (\_TZ.GFSD (), Local1)
                        Store (Local1, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                    }

                    Return (Local0)
                }

                If (LEqual (IDTA, 0x06))
                {
                    If (TRCN)
                    {
                        Store (0x01, Local1)
                    }
                    Else
                    {
                        Store (0x00, Local1)
                    }

                    Store (0x00, TRCN) /* \TRCN */
                    Store (0x01, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (Local1, Index (DerefOf (Index (Local0, 0x02)), 0x01))
                    Return (Local0)
                }

                If (LAnd (LGreaterEqual (IDTA, 0x10), LLessEqual (IDTA, 0x15)))
                {
                    \_SB.SSMI (0xEA75, 0x01, 0x28, 0x574D4953, 0x00)
                    If (LEqual (EBX, 0x00))
                    {
                        Store (ASMB, Local1)
                    }
                    Else
                    {
                        Return (Local0)
                    }

                    Subtract (IDTA, 0x10, Local7)
                    Store (DerefOf (Index (THCT, Local7)), Local2)
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (DerefOf (Index (PRFI, Local7)), Local4)
                    Store (0x00, Local3)
                    While (LLess (Local3, Local2))
                    {
                        Store (DerefOf (Index (Local1, Add (Local3, Local4))), Index (
                            DerefOf (Index (Local0, 0x02)), Add (Local3, 0x01)))
                        Increment (Local3)
                    }

                    Return (Local0)
                }

                If (LAnd (LGreaterEqual (IDTA, 0x20), LLessEqual (IDTA, 0x25)))
                {
                    Subtract (IDTA, 0x20, Local7)
                    Store (DerefOf (Index (THCT, Local7)), Local2)
                    Store (Local2, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Store (0x00, Local3)
                    While (LLess (Local3, Local2))
                    {
                        Store (DerefOf (Index (DerefOf (Index (TSTV, Local7)), Local3)), 
                            Index (DerefOf (Index (Local0, 0x02)), Add (Local3, 0x01)))
                        Increment (Local3)
                    }

                    Return (Local0)
                }

                If (LEqual (IDTA, 0xAA))
                {
                    Store (TSTM, Index (DerefOf (Index (Local0, 0x02)), 0x00))
                    Return (Local0)
                }

                Return (Package (0x02)
                {
                    0x06, 
                    0x00
                })
            }

            Method (SBTC, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x1F, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GBTC, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x1F, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GPMC, 1, NotSerialized)
            {
                Store (Buffer (0x80) {}, Local0)
                Store (0x01, Index (Local0, 0x00))
                Store (0x00, Index (Local0, 0x01))
                If (LEqual (PMCS, 0x01))
                {
                    If (\_SB.PCI0.LPCB.EC0.ECRG)
                    {
                        CreateWordField (Local0, 0x02, SYS)
                        CreateWordField (Local0, 0x04, P1)
                        CreateWordField (Local0, 0x06, BV1)
                        CreateWordField (Local0, 0x08, BI1)
                        CreateWordField (Local0, 0x0A, P2)
                        CreateWordField (Local0, 0x0C, BV2)
                        CreateWordField (Local0, 0x0E, BI2)
                        CreateWordField (Local0, 0x10, E1)
                        CreateWordField (Local0, 0x12, E2)
                        Store (\_SB.PCI0.LPCB.EC0.S0FL, Local1)
                        Store (0x01, Local2)
                        If (LEqual (And (Local1, 0x10), 0x00))
                        {
                            Or (Local2, 0x02, Local2)
                        }

                        Store (Local2, SYS) /* \_SB_.WMID.GPMC.SYS_ */
                        If (LEqual (Arg0, 0x01))
                        {
                            Store (0x00, \_SB.PCI0.LPCB.EC0.CIDX)
                            Store (\_SB.PCI0.LPCB.EC0.CPWR, P1) /* \_SB_.WMID.GPMC.P1__ */
                            Store (\_SB.PCI0.LPCB.EC0.CVLT, BV1) /* \_SB_.WMID.GPMC.BV1_ */
                            Store (\_SB.PCI0.LPCB.EC0.CCUR, BI1) /* \_SB_.WMID.GPMC.BI1_ */
                            Store (0x01, \_SB.PCI0.LPCB.EC0.CIDX)
                            Store (\_SB.PCI0.LPCB.EC0.CPWR, P2) /* \_SB_.WMID.GPMC.P2__ */
                            Store (\_SB.PCI0.LPCB.EC0.CVLT, BV2) /* \_SB_.WMID.GPMC.BV2_ */
                            Store (\_SB.PCI0.LPCB.EC0.CCUR, BI2) /* \_SB_.WMID.GPMC.BI2_ */
                        }
                        Else
                        {
                            Store (ASMB, Local2)
                            Store (0x00, Index (Local2, 0x10))
                            Store (Local2, ASMB) /* \ASMB */
                            \_SB.SSMI (0xEA75, 0x01, 0x1C, 0x574D4953, 0x00)
                            If (LEqual (EBX, 0x00))
                            {
                                Store (ASMB, Local1)
                                Store (0x00, Local2)
                                While (LLess (Local2, 0x0C))
                                {
                                    Store (DerefOf (Index (Local1, Local2)), Index (Local0, Add (Local2, 
                                        0x04)))
                                    Increment (Local2)
                                }

                                And (SYS, Not (0x02), SYS) /* \_SB_.WMID.GPMC.SYS_ */
                            }
                            Else
                            {
                                If (And (SYS, 0x02))
                                {
                                    Store (0x011C, P1) /* \_SB_.WMID.GPMC.P1__ */
                                    Store (0x2E18, BV1) /* \_SB_.WMID.GPMC.BV1_ */
                                    Store (0x0F50, BI1) /* \_SB_.WMID.GPMC.BI1_ */
                                    Store (0x55, P2) /* \_SB_.WMID.GPMC.P2__ */
                                    Store (0x3264, BV2) /* \_SB_.WMID.GPMC.BV2_ */
                                    Store (0x0432, BI2) /* \_SB_.WMID.GPMC.BI2_ */
                                }
                                Else
                                {
                                    Store (0x00, \_SB.PCI0.LPCB.EC0.CIDX)
                                    Store (\_SB.PCI0.LPCB.EC0.CPWR, P1) /* \_SB_.WMID.GPMC.P1__ */
                                    Store (\_SB.PCI0.LPCB.EC0.CVLT, BV1) /* \_SB_.WMID.GPMC.BV1_ */
                                    Store (\_SB.PCI0.LPCB.EC0.CCUR, BI1) /* \_SB_.WMID.GPMC.BI1_ */
                                    Store (0x01, \_SB.PCI0.LPCB.EC0.CIDX)
                                    Store (\_SB.PCI0.LPCB.EC0.CPWR, P2) /* \_SB_.WMID.GPMC.P2__ */
                                    Store (\_SB.PCI0.LPCB.EC0.CVLT, BV2) /* \_SB_.WMID.GPMC.BV2_ */
                                    Store (\_SB.PCI0.LPCB.EC0.CCUR, BI2) /* \_SB_.WMID.GPMC.BI2_ */
                                    Store (0x00, Local1)
                                    If (LOr (LGreater (P1, 0x0202), LLess (P1, 0x80)))
                                    {
                                        Store (0x01, Local1)
                                    }

                                    If (LOr (LGreater (P2, 0x8D), LLess (P2, 0x46)))
                                    {
                                        Store (0x01, Local1)
                                    }

                                    If (LLess (BV1, 0x36B0))
                                    {
                                        If (LOr (LGreater (BV1, 0x3390), LLess (BV1, 0x2CEC)))
                                        {
                                            Store (0x01, Local1)
                                        }

                                        If (LOr (LGreater (BV2, 0x3390), LLess (BV2, 0x2CEC)))
                                        {
                                            Store (0x01, Local1)
                                        }

                                        If (LOr (LGreater (BI1, 0x1068), LLess (BI1, 0x06A4)))
                                        {
                                            Store (0x01, Local1)
                                        }

                                        If (LOr (LGreater (BI2, 0x04B0), LLess (BI2, 0x0384)))
                                        {
                                            Store (0x01, Local1)
                                        }
                                    }
                                    Else
                                    {
                                        If (LOr (LGreater (BV1, 0x445C), LLess (BV1, 0x3C28)))
                                        {
                                            Store (0x01, Local1)
                                        }

                                        If (LOr (LGreater (BV2, 0x445C), LLess (BV2, 0x3C28)))
                                        {
                                            Store (0x01, Local1)
                                        }

                                        If (LOr (LGreater (BI1, 0x1068), LLess (BI1, 0x06A4)))
                                        {
                                            Store (0x01, Local1)
                                        }

                                        If (LOr (LGreater (BI2, 0x04B0), LLess (BI2, 0x0384)))
                                        {
                                            Store (0x01, Local1)
                                        }
                                    }

                                    If (LEqual (Local1, 0x01))
                                    {
                                        Store (0x00, \_SB.PCI0.LPCB.EC0.S0FL)
                                        Store (0x011C, P1) /* \_SB_.WMID.GPMC.P1__ */
                                        Store (0x2E18, BV1) /* \_SB_.WMID.GPMC.BV1_ */
                                        Store (0x0F50, BI1) /* \_SB_.WMID.GPMC.BI1_ */
                                        Store (0x55, P2) /* \_SB_.WMID.GPMC.P2__ */
                                        Store (0x3264, BV2) /* \_SB_.WMID.GPMC.BV2_ */
                                        Store (0x0432, BI2) /* \_SB_.WMID.GPMC.BI2_ */
                                        Or (SYS, 0x02, SYS) /* \_SB_.WMID.GPMC.SYS_ */
                                    }
                                    Else
                                    {
                                        Store (ASMB, Local2)
                                        CreateField (Local0, 0x20, 0x60, CDAT)
                                        CreateField (Local2, 0xA0, 0x60, BDAT)
                                        Store (CDAT, BDAT) /* \_SB_.WMID.GPMC.BDAT */
                                        Store (0x01, Index (Local2, 0x10))
                                        Store (Local2, ASMB) /* \ASMB */
                                        \_SB.SSMI (0xEA75, 0x01, 0x1C, 0x574D4953, 0x00)
                                    }
                                }
                            }
                        }

                        If (LGreater (BV2, 0x3A98))
                        {
                            Store (0x03B6, E1) /* \_SB_.WMID.GPMC.E1__ */
                            Store (0x03B6, E2) /* \_SB_.WMID.GPMC.E2__ */
                        }
                        Else
                        {
                            Store (0x0398, E1) /* \_SB_.WMID.GPMC.E1__ */
                            Store (0x0398, E2) /* \_SB_.WMID.GPMC.E2__ */
                        }
                    }
                    Else
                    {
                        Return (Package (0x02)
                        {
                            0x0D, 
                            0x00
                        })
                    }
                }

                Store (Package (0x03)
                    {
                        0x00, 
                        0x80, 
                        Buffer (0x80) {}
                    }, Local1)
                Store (Local0, Index (Local1, 0x02))
                Return (Local1)
            }

            Method (CPMC, 0, NotSerialized)
            {
                If (LEqual (PMCS, 0x01))
                {
                    If (\_SB.PCI0.LPCB.EC0.ECRG)
                    {
                        Store (0x00, \_SB.PCI0.LPCB.EC0.S0FL)
                        Return (Package (0x02)
                        {
                            0x00, 
                            0x00
                        })
                    }
                }

                Return (Package (0x02)
                {
                    0x0D, 
                    0x00
                })
            }

            Method (SQBP, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x22, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GQBP, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x22, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GPIN, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x23, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SPIN, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x23, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (WGBC, 0, NotSerialized)
            {
                Return (\_SB.PCI0.LPCB.EC0.GBTC ())
            }

            Method (WSBC, 3, NotSerialized)
            {
                Return (\_SB.PCI0.LPCB.EC0.SBTC (Arg0, Arg1, Arg2))
            }

            Method (GFCC, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x29, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SFCC, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x29, 0x574D4953, 0x00)
                Store (WFDA (), Local1)
                If (EDX)
                {
                    HWWB ()
                }

                Return (Local1)
            }

            Method (GPES, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x2A, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SPES, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x2A, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GLID, 0, NotSerialized)
            {
                Store (Package (0x03)
                    {
                        0x00, 
                        0x04, 
                        Buffer (0x04) {}
                    }, Local0)
                Store (Add (\_SB.LID._LID (), 0x01), Index (DerefOf (Index (Local0, 0x02
                    )), 0x00))
                Return (Local0)
            }

            Method (GDES, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x33, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GBLC, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x34, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SBLC, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x34, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GPST, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x36, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SPST, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x36, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GBCT, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x37, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SBCP, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x37, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (GPSH, 0, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x01, 0x38, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Method (SPSH, 1, NotSerialized)
            {
                \_SB.SSMI (0xEA75, 0x02, 0x38, 0x574D4953, 0x00)
                Return (WFDA ())
            }

            Name (_HID, EisaId ("PNP0C14"))  // _HID: Hardware ID
            Name (_UID, 0x00)  // _UID: Unique ID
            Name (WEI1, 0x00)
            Name (WED1, 0x00)
            Name (WEI2, 0x00)
            Name (WED2, 0x00)
            Name (WEVT, 0x00)
            Name (_WDG, Buffer (0x0118)
            {
                /* 0000 */   0x34, 0xF0, 0xB7, 0x5F, 0x63, 0x2C, 0xE9, 0x45,
                /* 0008 */   0xBE, 0x91, 0x3D, 0x44, 0xE2, 0xC7, 0x07, 0xE4,
                /* 0010 */   0x41, 0x41, 0x01, 0x02, 0x79, 0x42, 0xF2, 0x95,
                /* 0018 */   0x7B, 0x4D, 0x34, 0x43, 0x93, 0x87, 0xAC, 0xCD,
                /* 0020 */   0xC6, 0x7E, 0xF6, 0x1C, 0x80, 0x00, 0x01, 0x08,
                /* 0028 */   0x18, 0x43, 0x81, 0x2B, 0xE8, 0x4B, 0x07, 0x47,
                /* 0030 */   0x9D, 0x84, 0xA1, 0x90, 0xA8, 0x59, 0xB5, 0xD0,
                /* 0038 */   0xA0, 0x00, 0x01, 0x08, 0x21, 0x12, 0x90, 0x05,
                /* 0040 */   0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,
                /* 0048 */   0xC9, 0x06, 0x29, 0x10, 0x41, 0x42, 0x01, 0x00,
                /* 0050 */   0xEB, 0x91, 0x4C, 0x1F, 0x5C, 0xDC, 0x0B, 0x46,
                /* 0058 */   0x95, 0x1D, 0xC7, 0xCB, 0x9B, 0x4B, 0x8D, 0x5E,
                /* 0060 */   0x42, 0x41, 0x01, 0x02, 0x49, 0x4B, 0x11, 0x2D,
                /* 0068 */   0xFB, 0x2D, 0x30, 0x41, 0xB8, 0xFE, 0x4A, 0x3C,
                /* 0070 */   0x09, 0xE7, 0x51, 0x33, 0x42, 0x43, 0xFD, 0x00,
                /* 0078 */   0xE3, 0x08, 0x8D, 0x98, 0xF4, 0x68, 0x35, 0x4C,
                /* 0080 */   0xAF, 0x3E, 0x6A, 0x1B, 0x81, 0x06, 0xF8, 0x3C,
                /* 0088 */   0x42, 0x44, 0x2F, 0x00, 0x46, 0x97, 0xEA, 0x14,
                /* 0090 */   0x1F, 0xCE, 0x98, 0x40, 0xA0, 0xE0, 0x70, 0x45,
                /* 0098 */   0xCB, 0x4D, 0xA7, 0x45, 0x42, 0x45, 0x02, 0x00,
                /* 00A0 */   0x28, 0x20, 0x2F, 0x32, 0x84, 0x0F, 0x01, 0x49,
                /* 00A8 */   0x98, 0x8E, 0x01, 0x51, 0x76, 0x04, 0x9E, 0x2D,
                /* 00B0 */   0x42, 0x46, 0x05, 0x00, 0x3D, 0xDE, 0x32, 0x82,
                /* 00B8 */   0x3D, 0x66, 0x27, 0x43, 0xA8, 0xF4, 0xE2, 0x93,
                /* 00C0 */   0xAD, 0xB9, 0xBF, 0x05, 0x42, 0x47, 0x02, 0x00,
                /* 00C8 */   0x36, 0x64, 0x1F, 0x8F, 0x42, 0x9F, 0xC8, 0x42,
                /* 00D0 */   0xBA, 0xDC, 0x0E, 0x94, 0x24, 0xF2, 0x0C, 0x9A,
                /* 00D8 */   0x42, 0x48, 0x00, 0x00, 0x35, 0x64, 0x1F, 0x8F,
                /* 00E0 */   0x42, 0x9F, 0xC8, 0x42, 0xBA, 0xDC, 0x0E, 0x94,
                /* 00E8 */   0x24, 0xF2, 0x0C, 0x9A, 0x42, 0x49, 0x06, 0x00,
                /* 00F0 */   0x61, 0xA6, 0x91, 0x73, 0x3A, 0x22, 0xDB, 0x47,
                /* 00F8 */   0xA7, 0x7A, 0x7B, 0xE8, 0x4C, 0x60, 0x82, 0x2D,
                /* 0100 */   0x41, 0x43, 0x01, 0x02, 0xB6, 0x63, 0x4E, 0xDF,
                /* 0108 */   0xBC, 0x3B, 0x58, 0x48, 0x97, 0x37, 0xC7, 0x4F,
                /* 0110 */   0x82, 0xF8, 0x21, 0xF3, 0x42, 0x4A, 0x03, 0x00
            })
            Name (EVNT, Package (0x03)
            {
                Package (0x05)
                {
                    "BIOS Configuration Change", 
                    "BIOS Settings", 
                    0x04, 
                    0x05, 
                    0x02
                }, 

                Package (0x05)
                {
                    "BIOS Configuration Security", 
                    "An attempt has been made to Access BIOS features unsuccessfully", 
                    0x04, 
                    0x0A, 
                    0x06
                }, 

                Package (0x05)
                {
                    "Unknown Event", 
                    "Unknown event type", 
                    0x00, 
                    0x00, 
                    0x00
                }
            })
            Name (IWPN, 0x01)
            Method (IWMP, 0, Serialized)
            {
                If (IWPN)
                {
                    Name (TYPS, Buffer (0x0A) {})
                    Store (0x00, Local0)
                    While (LLess (Local0, 0x0A))
                    {
                        Store (0x00, Index (TYPS, Local0))
                        Increment (Local0)
                    }

                    Store (SizeOf (DYEN), Local4)
                    Store (0x00, Local0)
                    While (LLess (Local0, Local4))
                    {
                        Store (DerefOf (Index (DYEN, Local0)), Local7)
                        If (LAnd (LGreater (Local7, 0x00), LLess (Local7, 0x0A)))
                        {
                            Store (DerefOf (Index (TYPS, Local7)), Local1)
                            Add (Local1, 0x01, Index (TYPS, Local7))
                        }

                        Add (Local0, 0x02, Local0)
                    }

                    Store (0x01, Local0)
                    ShiftRight (FWSF, 0x01, Local1)
                    While (LLess (Local0, 0x0A))
                    {
                        If (LEqual (And (Local1, 0x01), 0x00))
                        {
                            Store (0x00, Index (TYPS, Local0))
                        }

                        ShiftRight (Local1, 0x01, Local1)
                        Increment (Local0)
                    }

                    Store (0x00, Local0)
                    While (LLess (Local0, 0xFD))
                    {
                        Store (DerefOf (Index (DerefOf (Index (BISE, Local0)), 0x00)), 
                            Local6)
                        Store (0x00, Local2)
                        While (LLess (Local2, Local4))
                        {
                            Store (DerefOf (Index (DYEN, Local2)), Local7)
                            If (LAnd (LGreater (Local7, 0x00), LLess (Local7, 0x0A)))
                            {
                                If (DerefOf (Index (TYPS, Local7)))
                                {
                                    Store (DerefOf (Index (DerefOf (Index (DYEN, Add (Local2, 0x01)
                                        )), 0x00)), Local5)
                                    If (\SRCP (Local6, Local5))
                                    {
                                        Store (0x00, Index (DYEN, Local2))
                                        Store (DerefOf (Index (DYEN, Add (Local2, 0x01))), Index (
                                            BISE, Local0))
                                        Store (DerefOf (Index (TYPS, Local7)), Local1)
                                        Subtract (Local1, 0x01, Index (TYPS, Local7))
                                        Break
                                    }
                                }
                            }

                            Add (Local2, 0x02, Local2)
                        }

                        Increment (Local0)
                    }

                    Store (0x00, IWPN) /* \_SB_.WMID.IWPN */
                }
            }

            Method (_WED, 1, NotSerialized)  // _Wxx: Wake Event
            {
                If (LEqual (Arg0, 0xA0))
                {
                    If (LEqual (DerefOf (Index (ETYP, 0x00)), 0x00))
                    {
                        Store (ST01, BF2S) /* \_SB_.BF2S */
                        Store (BF2S, Index (DerefOf (Index (EVNT, 0x00)), 0x01))
                        Return (DerefOf (Index (EVNT, 0x00)))
                    }

                    If (LEqual (DerefOf (Index (ETYP, 0x00)), 0x01))
                    {
                        Return (DerefOf (Index (EVNT, 0x01)))
                    }
                    Else
                    {
                        Return (DerefOf (Index (EVNT, 0x02)))
                    }
                }
                Else
                {
                    Store (Buffer (0x08)
                        {
                             0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                        }, Local0)
                    CreateDWordField (Local0, 0x00, EVID)
                    CreateDWordField (Local0, 0x04, EVDA)
                    Store (WEI1, EVID) /* \_SB_.WMID._WED.EVID */
                    Store (WED1, EVDA) /* \_SB_.WMID._WED.EVDA */
                    If (LNotEqual (WEI2, 0x00))
                    {
                        Store (WEI2, WEI1) /* \_SB_.WMID.WEI1 */
                        Store (WED2, WED1) /* \_SB_.WMID.WED1 */
                        Store (WEI1, EVID) /* \_SB_.WMID._WED.EVID */
                        Store (WED1, EVDA) /* \_SB_.WMID._WED.EVDA */
                        Store (0x00, WEI2) /* \_SB_.WMID.WEI2 */
                        Store (0x00, WED2) /* \_SB_.WMID.WED2 */
                        If (LEqual (WEVT, 0x00))
                        {
                            Store (0x01, WEVT) /* \_SB_.WMID.WEVT */
                            Notify (\_SB.WMID, 0x80) // Status Change
                        }
                    }
                    Else
                    {
                        Store (0x00, WEI1) /* \_SB_.WMID.WEI1 */
                        Store (0x00, WED1) /* \_SB_.WMID.WED1 */
                    }

                    Return (Local0)
                }
            }

            Name (WQAB, Buffer (0x1E73)
            {
                /* 0000 */   0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,
                /* 0008 */   0x63, 0x1E, 0x00, 0x00, 0x44, 0xBD, 0x00, 0x00,
                /* 0010 */   0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,
                /* 0018 */   0x28, 0x2A, 0x9A, 0x00, 0x01, 0x06, 0x18, 0x42,
                /* 0020 */   0x10, 0x4D, 0x10, 0x92, 0x46, 0x62, 0x02, 0x89,
                /* 0028 */   0x80, 0x90, 0x18, 0x18, 0x14, 0x81, 0x85, 0x00,
                /* 0030 */   0x49, 0x02, 0x88, 0xC4, 0x41, 0xE1, 0x20, 0xD4,
                /* 0038 */   0x9F, 0x40, 0x7E, 0x05, 0x20, 0x74, 0x28, 0x40,
                /* 0040 */   0xA6, 0x00, 0x83, 0x02, 0x9C, 0x22, 0x88, 0xA0,
                /* 0048 */   0x57, 0x01, 0x36, 0x05, 0x98, 0x14, 0x60, 0x51,
                /* 0050 */   0x80, 0x76, 0x01, 0x96, 0x05, 0xE8, 0x16, 0x20,
                /* 0058 */   0x1D, 0x96, 0x88, 0x04, 0x47, 0x89, 0x01, 0x47,
                /* 0060 */   0xE9, 0xC4, 0x16, 0x6E, 0xD8, 0xE0, 0x85, 0xA2,
                /* 0068 */   0x68, 0x06, 0x51, 0x12, 0x94, 0x8B, 0x20, 0x5D,
                /* 0070 */   0x10, 0x52, 0x2E, 0xC0, 0x37, 0x82, 0x06, 0x10,
                /* 0078 */   0xA5, 0x77, 0x01, 0xB6, 0x05, 0x98, 0x86, 0x27,
                /* 0080 */   0xD2, 0x20, 0xE4, 0x60, 0x08, 0x54, 0xCE, 0x80,
                /* 0088 */   0x20, 0x69, 0x44, 0x21, 0x1E, 0xA7, 0x44, 0x08,
                /* 0090 */   0x0A, 0x84, 0x90, 0xD4, 0xF1, 0xA0, 0xA0, 0x71,
                /* 0098 */   0x88, 0xAD, 0xCE, 0x46, 0x93, 0xA9, 0x74, 0x7E,
                /* 00A0 */   0x48, 0x82, 0x70, 0xC6, 0x2A, 0x7E, 0x3A, 0x9A,
                /* 00A8 */   0xD0, 0xD9, 0x9C, 0x60, 0xE7, 0x18, 0x72, 0x3C,
                /* 00B0 */   0x48, 0xF4, 0x20, 0xB8, 0x00, 0x0F, 0x1C, 0x2C,
                /* 00B8 */   0x34, 0x84, 0x22, 0x6B, 0x80, 0xC1, 0x8C, 0xDD,
                /* 00C0 */   0x63, 0xB1, 0x0B, 0x4E, 0x0A, 0xEC, 0x61, 0xB3,
                /* 00C8 */   0x01, 0x19, 0xA2, 0x24, 0x38, 0xD4, 0x11, 0xC0,
                /* 00D0 */   0x12, 0x05, 0x98, 0x1F, 0x87, 0x0C, 0x0F, 0x95,
                /* 00D8 */   0x8C, 0x25, 0x24, 0x1B, 0xAB, 0x87, 0xC2, 0xA5,
                /* 00E0 */   0x40, 0x68, 0x6C, 0x27, 0xED, 0x19, 0x45, 0x2C,
                /* 00E8 */   0x79, 0x4A, 0x82, 0x49, 0xE0, 0x51, 0x44, 0x36,
                /* 00F0 */   0x1A, 0x27, 0x28, 0x1B, 0x1A, 0x25, 0x03, 0x42,
                /* 00F8 */   0x9E, 0x05, 0x58, 0x07, 0x26, 0x04, 0x76, 0x2F,
                /* 0100 */   0xC0, 0x9A, 0x00, 0x73, 0xB3, 0x90, 0xB1, 0xB9,
                /* 0108 */   0xE8, 0xFF, 0x0F, 0x71, 0xB0, 0x31, 0xDA, 0x9A,
                /* 0110 */   0xAE, 0x90, 0xC2, 0xC4, 0x88, 0x12, 0x2C, 0x5E,
                /* 0118 */   0xC5, 0xC3, 0x10, 0xCA, 0x93, 0x42, 0xA8, 0x48,
                /* 0120 */   0x95, 0xA1, 0x68, 0xB4, 0x51, 0x2A, 0x14, 0xE0,
                /* 0128 */   0x4C, 0x80, 0x30, 0x5C, 0x1D, 0x03, 0x82, 0x46,
                /* 0130 */   0x88, 0x15, 0x29, 0x56, 0xFB, 0x83, 0x20, 0xF1,
                /* 0138 */   0x2D, 0x40, 0x54, 0x01, 0xA2, 0x48, 0xA3, 0x41,
                /* 0140 */   0x9D, 0x03, 0x3C, 0x5C, 0x0F, 0xF5, 0xF0, 0x3D,
                /* 0148 */   0xF6, 0x93, 0x0C, 0x72, 0x90, 0x67, 0xF1, 0xA8,
                /* 0150 */   0x70, 0x9C, 0x06, 0x49, 0xE0, 0x0B, 0x80, 0x4F,
                /* 0158 */   0x08, 0x1E, 0x38, 0xDE, 0x35, 0xA0, 0x66, 0x7C,
                /* 0160 */   0xBC, 0x4C, 0x10, 0x1C, 0x6A, 0x88, 0x1E, 0x68,
                /* 0168 */   0xB8, 0x13, 0x38, 0x44, 0x06, 0xE8, 0x49, 0x3D,
                /* 0170 */   0x52, 0x60, 0x07, 0x77, 0x32, 0xEF, 0x01, 0xAF,
                /* 0178 */   0x0A, 0xCD, 0x5E, 0x12, 0x08, 0xC1, 0xF1, 0xF8,
                /* 0180 */   0x7E, 0xC0, 0x26, 0x9C, 0xC0, 0xF2, 0x07, 0x81,
                /* 0188 */   0x1A, 0x99, 0xA1, 0x3D, 0xCA, 0xD3, 0x8A, 0x19,
                /* 0190 */   0xF2, 0x31, 0xC1, 0x04, 0x16, 0x0B, 0x21, 0x05,
                /* 0198 */   0x10, 0x1A, 0x0F, 0xF8, 0x6F, 0x00, 0x8F, 0x17,
                /* 01A0 */   0xBE, 0x12, 0xC4, 0xF6, 0x80, 0x12, 0x0C, 0x0B,
                /* 01A8 */   0x21, 0x23, 0xAB, 0xF0, 0x78, 0xE8, 0x28, 0x7C,
                /* 01B0 */   0x95, 0x38, 0x9C, 0xD3, 0x8A, 0x67, 0x82, 0xE1,
                /* 01B8 */   0x20, 0xF4, 0x05, 0x90, 0x00, 0x51, 0xE7, 0x0C,
                /* 01C0 */   0xD4, 0x61, 0xC1, 0xE7, 0x04, 0x76, 0x33, 0x38,
                /* 01C8 */   0x83, 0x47, 0x00, 0x8F, 0xE4, 0x84, 0xFC, 0x2B,
                /* 01D0 */   0xF1, 0xC0, 0xE0, 0x03, 0xE2, 0xEF, 0x1F, 0xA7,
                /* 01D8 */   0xEC, 0x11, 0x9C, 0xA9, 0x01, 0x7D, 0x1C, 0xF0,
                /* 01E0 */   0xFF, 0x7F, 0x28, 0x7C, 0x88, 0x1E, 0xDF, 0x29,
                /* 01E8 */   0x1F, 0xAF, 0x4F, 0x17, 0x96, 0x35, 0x4E, 0xE8,
                /* 01F0 */   0x77, 0x08, 0x9F, 0x38, 0x7C, 0x64, 0x71, 0x44,
                /* 01F8 */   0x08, 0x39, 0x39, 0x05, 0xA0, 0x81, 0x4F, 0xF7,
                /* 0200 */   0xEC, 0x22, 0x9C, 0xAE, 0x27, 0xE5, 0x40, 0xC3,
                /* 0208 */   0xA0, 0xE3, 0x04, 0xC7, 0x79, 0x00, 0x1C, 0xE3,
                /* 0210 */   0x84, 0x7F, 0x2E, 0x80, 0x3F, 0x40, 0x7E, 0xCA,
                /* 0218 */   0x78, 0xC5, 0x48, 0xE0, 0x98, 0x23, 0x44, 0x9F,
                /* 0220 */   0x6B, 0x3C, 0x42, 0x2C, 0xFC, 0x53, 0x45, 0xE1,
                /* 0228 */   0x03, 0x21, 0x63, 0x04, 0x17, 0xA0, 0xC7, 0x08,
                /* 0230 */   0x7C, 0x03, 0x8E, 0x11, 0x7D, 0x94, 0xE0, 0xEA,
                /* 0238 */   0x0F, 0x1A, 0x74, 0x80, 0xB8, 0xFF, 0xFF, 0x00,
                /* 0240 */   0xE1, 0x83, 0x7A, 0x80, 0xC0, 0x37, 0xFA, 0xD1,
                /* 0248 */   0x03, 0x3D, 0x2E, 0x8B, 0x3E, 0x0F, 0xC8, 0xF8,
                /* 0250 */   0x89, 0x46, 0xF3, 0xE2, 0xA7, 0x03, 0x7E, 0xF8,
                /* 0258 */   0x00, 0x0F, 0xA8, 0x87, 0x84, 0x03, 0xC5, 0x4C,
                /* 0260 */   0x9B, 0x83, 0x3E, 0xBB, 0x1C, 0x3A, 0x76, 0xB8,
                /* 0268 */   0xE0, 0x3F, 0x81, 0x80, 0x4B, 0xDE, 0x21, 0x0C,
                /* 0270 */   0x14, 0x23, 0xC6, 0x9F, 0x83, 0x7C, 0x0A, 0x03,
                /* 0278 */   0xFF, 0xFF, 0xFF, 0x14, 0x06, 0xFE, 0xE1, 0xF0,
                /* 0280 */   0x20, 0x4F, 0x07, 0x9F, 0xB6, 0xA8, 0x74, 0x18,
                /* 0288 */   0xD4, 0x81, 0x0B, 0xB0, 0x32, 0x89, 0x08, 0xCF,
                /* 0290 */   0x12, 0xB5, 0x41, 0xE8, 0xD4, 0xF0, 0x36, 0xF1,
                /* 0298 */   0xB6, 0xE5, 0x5B, 0x40, 0x9C, 0xD3, 0xEC, 0xED,
                /* 02A0 */   0xC0, 0x45, 0x30, 0x22, 0xD4, 0x0C, 0x45, 0x4E,
                /* 02A8 */   0x5A, 0x11, 0x63, 0x44, 0x79, 0xDC, 0x32, 0xCA,
                /* 02B0 */   0xDB, 0xD6, 0x0B, 0x40, 0xBC, 0x13, 0x7B, 0xDE,
                /* 02B8 */   0x32, 0x46, 0xF0, 0xC8, 0x0F, 0x5C, 0x2C, 0xC6,
                /* 02C0 */   0xEA, 0xF5, 0x5F, 0xF3, 0x81, 0x0B, 0x70, 0xF6,
                /* 02C8 */   0xFF, 0x3F, 0x70, 0x01, 0x1C, 0x0A, 0x7A, 0x18,
                /* 02D0 */   0x42, 0x0F, 0xC3, 0x53, 0x39, 0x97, 0x87, 0xC8,
                /* 02D8 */   0x53, 0x89, 0x18, 0x35, 0x4C, 0xD4, 0x67, 0x28,
                /* 02E0 */   0xDF, 0x2D, 0x7C, 0x20, 0x02, 0xDF, 0x99, 0x0B,
                /* 02E8 */   0xF8, 0xFD, 0xFF, 0x0F, 0x44, 0x70, 0x8E, 0x29,
                /* 02F0 */   0xB8, 0x33, 0x0D, 0x78, 0x7C, 0xCE, 0x40, 0x20,
                /* 02F8 */   0xA7, 0xE2, 0x43, 0x0D, 0x60, 0x41, 0xF4, 0x13,
                /* 0300 */   0xC2, 0x27, 0x1A, 0x2A, 0x13, 0x06, 0x75, 0xA8,
                /* 0308 */   0x01, 0xAC, 0x5C, 0x61, 0x9E, 0x46, 0xCF, 0xF9,
                /* 0310 */   0x59, 0xC6, 0xA7, 0x1A, 0x1F, 0x4A, 0x8D, 0x63,
                /* 0318 */   0x88, 0x97, 0x99, 0x87, 0x1A, 0x1F, 0x0B, 0x5E,
                /* 0320 */   0x49, 0x7D, 0xA8, 0x31, 0x54, 0x9C, 0x87, 0x1A,
                /* 0328 */   0x0F, 0x37, 0x50, 0xD4, 0x37, 0x9B, 0x67, 0x1B,
                /* 0330 */   0xA3, 0xC7, 0xF7, 0x0D, 0xD5, 0x10, 0x0F, 0x35,
                /* 0338 */   0x4C, 0xF2, 0x4A, 0x35, 0x16, 0x1F, 0x6A, 0xC0,
                /* 0340 */   0xF1, 0xFF, 0x3F, 0xD4, 0x00, 0xFC, 0xFF, 0xFF,
                /* 0348 */   0x1F, 0x6A, 0x00, 0x47, 0x47, 0x03, 0x38, 0x47,
                /* 0350 */   0x46, 0xDC, 0xD1, 0x00, 0x5C, 0x87, 0x52, 0xE0,
                /* 0358 */   0x70, 0x34, 0x00, 0x1E, 0x47, 0x21, 0x30, 0x5F,
                /* 0360 */   0x68, 0x7C, 0x14, 0x02, 0x16, 0xFF, 0xFF, 0xA3,
                /* 0368 */   0x10, 0xF8, 0x65, 0x9F, 0x83, 0x50, 0x42, 0x8F,
                /* 0370 */   0x42, 0x80, 0xA0, 0xDB, 0xCF, 0x53, 0xC4, 0xB3,
                /* 0378 */   0x8F, 0x2F, 0x3F, 0x0F, 0x04, 0x11, 0x5E, 0xF3,
                /* 0380 */   0x7D, 0x0A, 0xF2, 0x21, 0xDF, 0x47, 0x21, 0x06,
                /* 0388 */   0x63, 0x28, 0x5F, 0x83, 0x7C, 0x14, 0x62, 0x50,
                /* 0390 */   0xAF, 0x41, 0xBE, 0xEF, 0x1B, 0xE4, 0xF1, 0x22,
                /* 0398 */   0x48, 0xEC, 0x67, 0x02, 0x1F, 0x85, 0x98, 0xE8,
                /* 03A0 */   0xA3, 0x10, 0xA0, 0xF0, 0xFF, 0x7F, 0x14, 0x02,
                /* 03A8 */   0xF8, 0xFF, 0xFF, 0x3F, 0x0A, 0x01, 0xCE, 0x02,
                /* 03B0 */   0x1C, 0x0D, 0x40, 0x37, 0xAD, 0x47, 0x21, 0xF0,
                /* 03B8 */   0xDE, 0x59, 0x4E, 0xFB, 0x04, 0x7C, 0x16, 0x02,
                /* 03C0 */   0xCC, 0xFE, 0xFF, 0xCF, 0x42, 0xC0, 0xEC, 0x28,
                /* 03C8 */   0x74, 0x14, 0x67, 0xF9, 0x2A, 0xF4, 0x04, 0xF0,
                /* 03D0 */   0x02, 0x10, 0x23, 0xCC, 0x3B, 0xD0, 0x4B, 0x26,
                /* 03D8 */   0xBB, 0x8B, 0x1B, 0xE7, 0xC9, 0xE5, 0x2C, 0x9E,
                /* 03E0 */   0xC4, 0x7D, 0x09, 0xF2, 0x81, 0xE2, 0x59, 0xC8,
                /* 03E8 */   0x50, 0xA7, 0x1B, 0xF4, 0x8D, 0xDC, 0x03, 0x8B,
                /* 03F0 */   0x19, 0x3F, 0xC4, 0xF3, 0x90, 0x21, 0x9E, 0x85,
                /* 03F8 */   0x00, 0x76, 0xFD, 0xFF, 0xCF, 0x42, 0x00, 0xFF,
                /* 0400 */   0xFF, 0xFF, 0x47, 0x03, 0xF8, 0x2F, 0x00, 0x9F,
                /* 0408 */   0x85, 0x80, 0xE7, 0x09, 0xE0, 0x41, 0xDB, 0x67,
                /* 0410 */   0x21, 0x80, 0x33, 0x87, 0xCB, 0xF3, 0x7F, 0x05,
                /* 0418 */   0x3A, 0x96, 0xF7, 0x08, 0xCF, 0xFA, 0x24, 0x5F,
                /* 0420 */   0x2F, 0x3D, 0xD3, 0x87, 0x82, 0x67, 0x21, 0x86,
                /* 0428 */   0x75, 0x18, 0x3E, 0x0B, 0x31, 0x88, 0x17, 0x4D,
                /* 0430 */   0x43, 0xBC, 0x70, 0xFA, 0x30, 0xE0, 0xFF, 0x3F,
                /* 0438 */   0x5E, 0xE0, 0x57, 0x4E, 0x03, 0x05, 0x09, 0xF4,
                /* 0440 */   0x2C, 0x04, 0x30, 0xFE, 0xFF, 0x7F, 0x16, 0x02,
                /* 0448 */   0xC8, 0xB8, 0x46, 0x9D, 0x85, 0x80, 0xE5, 0x6D,
                /* 0450 */   0xE5, 0x19, 0xDB, 0xA7, 0x95, 0x04, 0xFF, 0xFF,
                /* 0458 */   0x67, 0x21, 0xC0, 0x41, 0x2E, 0x23, 0x07, 0x21,
                /* 0460 */   0x4C, 0xC4, 0x87, 0x83, 0x8F, 0x99, 0x80, 0x9E,
                /* 0468 */   0x29, 0xBE, 0xB8, 0x1B, 0xE3, 0x09, 0xE0, 0x45,
                /* 0470 */   0xE2, 0x31, 0x93, 0x1D, 0x35, 0x0D, 0xF3, 0x2C,
                /* 0478 */   0x64, 0xBC, 0xB3, 0x78, 0x0D, 0x78, 0x82, 0xF7,
                /* 0480 */   0xE4, 0x9F, 0x85, 0x18, 0xD8, 0x61, 0x05, 0x7B,
                /* 0488 */   0x14, 0x32, 0xA8, 0xC1, 0x63, 0x87, 0x08, 0x13,
                /* 0490 */   0xE8, 0x59, 0x88, 0xC5, 0x7D, 0xAE, 0xE8, 0x3C,
                /* 0498 */   0xE1, 0xB3, 0x10, 0xF0, 0xFE, 0xFF, 0x9F, 0x25,
                /* 04A0 */   0xE0, 0x5E, 0x0D, 0x9E, 0x85, 0x00, 0x13, 0x87,
                /* 04A8 */   0x0D, 0x9F, 0x35, 0xC0, 0x33, 0x7C, 0x8F, 0xEA,
                /* 04B0 */   0x1C, 0x1E, 0x8F, 0x81, 0x7F, 0x56, 0x1D, 0xE7,
                /* 04B8 */   0x04, 0x96, 0x7B, 0xD1, 0xB2, 0x71, 0xA0, 0xA1,
                /* 04C0 */   0x23, 0xB2, 0x3A, 0x20, 0x8D, 0x0D, 0x73, 0x29,
                /* 04C8 */   0x89, 0x7C, 0x72, 0x6C, 0xD4, 0x56, 0x04, 0xA7,
                /* 04D0 */   0x33, 0x93, 0x4F, 0x00, 0xD6, 0x42, 0x21, 0x05,
                /* 04D8 */   0x34, 0x1A, 0x8B, 0xE1, 0x9D, 0xF9, 0xE8, 0x44,
                /* 04E0 */   0x41, 0x0C, 0xE8, 0xE3, 0x90, 0x6D, 0x1C, 0x0A,
                /* 04E8 */   0x50, 0x7B, 0xD1, 0x14, 0xC8, 0x39, 0x07, 0xA3,
                /* 04F0 */   0x7F, 0x76, 0x74, 0x36, 0xBE, 0x13, 0x70, 0x0D,
                /* 04F8 */   0x10, 0x3A, 0x25, 0x18, 0xDA, 0x6A, 0x04, 0xFC,
                /* 0500 */   0xFF, 0x67, 0x89, 0x01, 0x33, 0xFE, 0x53, 0x8C,
                /* 0508 */   0x09, 0x7C, 0x8E, 0xC1, 0x1F, 0x0C, 0xF0, 0x03,
                /* 0510 */   0x7F, 0x31, 0xA8, 0xFA, 0x5E, 0xA0, 0xFB, 0x82,
                /* 0518 */   0xD5, 0xDD, 0x64, 0x20, 0xCC, 0xC8, 0x04, 0xF5,
                /* 0520 */   0x9D, 0x0E, 0x40, 0x01, 0xE4, 0x0B, 0x81, 0xCF,
                /* 0528 */   0x51, 0x0F, 0x05, 0x6C, 0x22, 0x21, 0xC2, 0x44,
                /* 0530 */   0x33, 0x3A, 0x62, 0xC2, 0xA8, 0xE8, 0x13, 0xA6,
                /* 0538 */   0x20, 0x9E, 0xB0, 0x63, 0x4D, 0x18, 0x3D, 0x13,
                /* 0540 */   0x5F, 0x74, 0xD8, 0x88, 0x31, 0x21, 0xAE, 0x1E,
                /* 0548 */   0xD0, 0x26, 0x18, 0xD4, 0x97, 0x22, 0x58, 0x43,
                /* 0550 */   0xE6, 0x63, 0xF1, 0x05, 0x02, 0x37, 0x65, 0x30,
                /* 0558 */   0xCE, 0x89, 0x5D, 0x13, 0x7C, 0xD9, 0xC1, 0xCD,
                /* 0560 */   0x19, 0x8C, 0xF0, 0x98, 0xBB, 0x18, 0xBF, 0x3A,
                /* 0568 */   0x79, 0x74, 0xFC, 0xA0, 0xE0, 0x1B, 0x0E, 0xC3,
                /* 0570 */   0x7E, 0x32, 0xF3, 0x8C, 0xDE, 0xCB, 0x7C, 0x8D,
                /* 0578 */   0xC3, 0xC0, 0x7A, 0xBC, 0x1C, 0xD6, 0x68, 0x61,
                /* 0580 */   0x0F, 0xED, 0x3D, 0xC4, 0xFF, 0xFF, 0x43, 0x8C,
                /* 0588 */   0xCF, 0x13, 0xC6, 0x08, 0xEB, 0xDB, 0x0B, 0x38,
                /* 0590 */   0xEE, 0x59, 0xF0, 0xEF, 0x1A, 0xE0, 0xB9, 0x84,
                /* 0598 */   0xF8, 0xAE, 0x01, 0x30, 0xF0, 0xFF, 0x7F, 0xD7,
                /* 05A0 */   0x00, 0x4E, 0xD7, 0x04, 0xDF, 0x35, 0x80, 0xF7,
                /* 05A8 */   0xD0, 0x7D, 0xD7, 0x00, 0xAE, 0xD9, 0xEF, 0x1A,
                /* 05B0 */   0xA8, 0x63, 0x80, 0x15, 0xDE, 0x35, 0xA0, 0x5D,
                /* 05B8 */   0xD9, 0xDE, 0xD7, 0x9E, 0xB0, 0xAC, 0xE9, 0xB2,
                /* 05C0 */   0x81, 0x52, 0x73, 0xD9, 0x00, 0x14, 0xFC, 0xFF,
                /* 05C8 */   0x2F, 0x1B, 0x80, 0x01, 0x29, 0x13, 0x46, 0x85,
                /* 05D0 */   0x9F, 0x30, 0x05, 0xF1, 0x84, 0x1D, 0xEC, 0xB2,
                /* 05D8 */   0x01, 0x8A, 0x18, 0x97, 0x0D, 0xD0, 0x8F, 0xED,
                /* 05E0 */   0x65, 0x03, 0x18, 0xDC, 0x13, 0xF8, 0x6D, 0x03,
                /* 05E8 */   0x78, 0x43, 0xFA, 0xB6, 0x01, 0xD6, 0xFF, 0xFF,
                /* 05F0 */   0x6D, 0x03, 0xAC, 0xF9, 0x6F, 0x1B, 0x28, 0x0E,
                /* 05F8 */   0xAB, 0xBC, 0x6D, 0x40, 0x3C, 0xC9, 0x33, 0x02,
                /* 0600 */   0xAB, 0xBA, 0x6E, 0xA0, 0xF4, 0x5C, 0x37, 0x00,
                /* 0608 */   0x12, 0x88, 0x99, 0x30, 0x2A, 0xFE, 0x84, 0x29,
                /* 0610 */   0x88, 0x27, 0xEC, 0x68, 0xD7, 0x0D, 0x50, 0x04,
                /* 0618 */   0xB9, 0x6E, 0x80, 0x7E, 0x5E, 0x09, 0xFE, 0xFF,
                /* 0620 */   0xAF, 0x1B, 0xC0, 0xE0, 0xA2, 0x80, 0xB9, 0x6F,
                /* 0628 */   0x00, 0x6F, 0x58, 0x7E, 0xDF, 0x00, 0x7C, 0xDC,
                /* 0630 */   0xC4, 0x31, 0xF7, 0x0D, 0xC0, 0xCC, 0xFF, 0xFF,
                /* 0638 */   0xBE, 0x01, 0xB0, 0xE7, 0xA2, 0x80, 0xBB, 0x6F,
                /* 0640 */   0x00, 0xEF, 0x8B, 0xB4, 0xEF, 0x1B, 0x60, 0xFE,
                /* 0648 */   0xFF, 0xDF, 0x37, 0xC0, 0x28, 0x6D, 0xFD, 0x1E,
                /* 0650 */   0x1C, 0x3D, 0x21, 0x78, 0x7C, 0xB8, 0xFB, 0xA5,
                /* 0658 */   0xC7, 0xE7, 0xBB, 0x39, 0x38, 0x06, 0x79, 0x8C,
                /* 0660 */   0x87, 0x76, 0xC0, 0xAF, 0xEF, 0x9E, 0x98, 0xEF,
                /* 0668 */   0xE6, 0xC0, 0xFF, 0x4C, 0x70, 0x3C, 0x18, 0x68,
                /* 0670 */   0x1C, 0x62, 0xAB, 0x97, 0x06, 0x72, 0x34, 0x38,
                /* 0678 */   0x3F, 0xDC, 0x19, 0x81, 0x61, 0x15, 0x7F, 0xF2,
                /* 0680 */   0x47, 0x38, 0xC7, 0xD0, 0xD9, 0xE1, 0x20, 0xB1,
                /* 0688 */   0x83, 0xE0, 0xC1, 0x56, 0x6D, 0x02, 0x85, 0x86,
                /* 0690 */   0x50, 0x14, 0x18, 0x14, 0x8B, 0x0F, 0x18, 0xF8,
                /* 0698 */   0x61, 0xB3, 0xB3, 0x00, 0x93, 0x04, 0x87, 0x3A,
                /* 06A0 */   0x02, 0xF8, 0x3E, 0xD1, 0xFC, 0x38, 0x74, 0x37,
                /* 06A8 */   0x38, 0x54, 0x8F, 0xE5, 0xA1, 0x80, 0x9E, 0x01,
                /* 06B0 */   0x71, 0xC7, 0x0C, 0x32, 0x69, 0xCF, 0x28, 0xE2,
                /* 06B8 */   0x53, 0xC2, 0x29, 0x85, 0x49, 0xE0, 0xF3, 0x03,
                /* 06C0 */   0x43, 0xE3, 0x04, 0xAF, 0x0D, 0xA1, 0xF9, 0xFF,
                /* 06C8 */   0xFF, 0xA4, 0xC0, 0x3C, 0xDF, 0x31, 0x04, 0x6C,
                /* 06D0 */   0x02, 0xBB, 0xBF, 0x64, 0xC8, 0xDA, 0xC0, 0x75,
                /* 06D8 */   0x4B, 0x32, 0x44, 0x6F, 0x38, 0xB2, 0x85, 0xA2,
                /* 06E0 */   0xE9, 0x44, 0x79, 0xDF, 0x88, 0x62, 0x67, 0x08,
                /* 06E8 */   0xC2, 0x88, 0x12, 0x2C, 0xC8, 0xA3, 0x42, 0xAC,
                /* 06F0 */   0x28, 0x2F, 0x05, 0x46, 0x88, 0x18, 0xE2, 0x95,
                /* 06F8 */   0x23, 0xD0, 0x09, 0x87, 0x0F, 0xF2, 0xD8, 0x14,
                /* 0700 */   0xA7, 0xFD, 0x41, 0x90, 0x58, 0x4F, 0x02, 0x8D,
                /* 0708 */   0xC5, 0x91, 0x46, 0x83, 0x3A, 0x07, 0x78, 0xB8,
                /* 0710 */   0x3E, 0xC4, 0x78, 0xF8, 0x0F, 0x21, 0x06, 0x39,
                /* 0718 */   0xC8, 0x73, 0x7B, 0x54, 0x38, 0x4E, 0x5F, 0x25,
                /* 0720 */   0x4C, 0xF0, 0x02, 0xE0, 0x83, 0x0A, 0x1C, 0xD7,
                /* 0728 */   0x80, 0x9A, 0xF1, 0x33, 0x06, 0x58, 0x8E, 0xE3,
                /* 0730 */   0x3E, 0xA9, 0xC0, 0x1D, 0x8F, 0xEF, 0x07, 0x6C,
                /* 0738 */   0xC2, 0x09, 0x2C, 0x7F, 0x10, 0xA8, 0xE3, 0x0C,
                /* 0740 */   0x9F, 0xE7, 0x0B, 0x8B, 0x21, 0x1F, 0x13, 0x4C,
                /* 0748 */   0x60, 0xB1, 0x27, 0x1B, 0x3A, 0x1E, 0xF0, 0xDF,
                /* 0750 */   0x63, 0x1E, 0x2F, 0x7C, 0x32, 0xF1, 0x7C, 0x4D,
                /* 0758 */   0x30, 0x22, 0x84, 0x9C, 0x8C, 0x07, 0x7D, 0x87,
                /* 0760 */   0xC0, 0x5C, 0x6F, 0xD8, 0xB9, 0x85, 0x8B, 0x3A,
                /* 0768 */   0x68, 0xA0, 0x4E, 0x0B, 0x3E, 0x28, 0xB0, 0x9B,
                /* 0770 */   0x11, 0xE6, 0xB8, 0xCE, 0xCF, 0x2A, 0x60, 0xF8,
                /* 0778 */   0xFF, 0x9F, 0x55, 0x60, 0x8F, 0x10, 0xFE, 0xED,
                /* 0780 */   0xC1, 0xF3, 0xF2, 0x95, 0xE1, 0xD5, 0x21, 0x81,
                /* 0788 */   0x43, 0x8E, 0x10, 0x3D, 0x2E, 0x8F, 0x10, 0x73,
                /* 0790 */   0x3E, 0xC2, 0x0C, 0x11, 0x5C, 0x67, 0x01, 0x70,
                /* 0798 */   0x0C, 0x11, 0xF8, 0x1C, 0x70, 0xC0, 0x71, 0x69,
                /* 07A0 */   0xE2, 0x03, 0xF5, 0x01, 0x07, 0x70, 0x70, 0x4D,
                /* 07A8 */   0xC3, 0x1D, 0x70, 0xC0, 0x71, 0x16, 0x60, 0xFF,
                /* 07B0 */   0xFF, 0xC3, 0x0D, 0x2C, 0x49, 0x26, 0x0E, 0x23,
                /* 07B8 */   0x18, 0x11, 0x30, 0x28, 0x02, 0x02, 0xA4, 0xB3,
                /* 07C0 */   0x80, 0x0F, 0x29, 0x00, 0x1F, 0xAE, 0x0C, 0x0F,
                /* 07C8 */   0x29, 0xD8, 0x93, 0x86, 0x07, 0x8E, 0x1B, 0x85,
                /* 07D0 */   0x07, 0x8D, 0x0B, 0x30, 0x68, 0x7A, 0xE2, 0x80,
                /* 07D8 */   0x7F, 0x4C, 0xF0, 0x19, 0x05, 0x1C, 0xE3, 0x06,
                /* 07E0 */   0xDF, 0x2A, 0x0C, 0xFC, 0xFF, 0x3F, 0x30, 0xCC,
                /* 07E8 */   0xE1, 0xC2, 0x63, 0x39, 0x8A, 0xA0, 0x07, 0x1E,
                /* 07F0 */   0xD4, 0xF7, 0x8C, 0x33, 0xF7, 0x24, 0x8F, 0xD1,
                /* 07F8 */   0x51, 0x0F, 0x27, 0xF4, 0xE4, 0x85, 0x3B, 0x57,
                /* 0800 */   0xF9, 0x0A, 0x71, 0x14, 0x18, 0xB8, 0x77, 0x29,
                /* 0808 */   0x8F, 0xCF, 0x17, 0x2B, 0xC3, 0x63, 0x46, 0xFB,
                /* 0810 */   0x1E, 0x72, 0xD6, 0x11, 0x02, 0xE2, 0x2F, 0x75,
                /* 0818 */   0x6C, 0xC0, 0x60, 0x39, 0x18, 0x00, 0x87, 0x01,
                /* 0820 */   0xE3, 0x13, 0x0D, 0x58, 0x67, 0x1B, 0x3C, 0xF4,
                /* 0828 */   0x69, 0x31, 0xC4, 0xE3, 0x0B, 0xFB, 0x56, 0x61,
                /* 0830 */   0x82, 0xEA, 0x41, 0x75, 0x12, 0xF4, 0xD0, 0xC0,
                /* 0838 */   0x01, 0xE8, 0xA1, 0xC1, 0x3F, 0xB9, 0x90, 0xFB,
                /* 0840 */   0x2B, 0x1D, 0x82, 0xB5, 0xE2, 0x69, 0xDE, 0x47,
                /* 0848 */   0x1E, 0xF3, 0xDC, 0xA2, 0xBC, 0x0D, 0x3C, 0x07,
                /* 0850 */   0xF0, 0xD3, 0x82, 0x87, 0xE3, 0x63, 0x81, 0xC7,
                /* 0858 */   0xE9, 0x4B, 0x58, 0x82, 0xF7, 0x1A, 0x9F, 0x6C,
                /* 0860 */   0x1E, 0x5C, 0x58, 0xB2, 0x21, 0xA0, 0x06, 0xEB,
                /* 0868 */   0x21, 0x60, 0xA6, 0x9A, 0xC0, 0x49, 0x46, 0x80,
                /* 0870 */   0xCA, 0x00, 0xA1, 0x1B, 0xCB, 0xE9, 0x3E, 0x8B,
                /* 0878 */   0x84, 0x38, 0xCD, 0x47, 0x99, 0xC7, 0x02, 0x8F,
                /* 0880 */   0xF5, 0xC1, 0xC0, 0xFF, 0x7F, 0xCD, 0x23, 0xD4,
                /* 0888 */   0x7D, 0xCD, 0x33, 0x7B, 0x3A, 0xC0, 0xAC, 0x22,
                /* 0890 */   0xDC, 0x7B, 0xCE, 0x1B, 0x86, 0xD1, 0x9E, 0x2D,
                /* 0898 */   0x7C, 0xCD, 0x78, 0xD6, 0x34, 0x42, 0x38, 0x76,
                /* 08A0 */   0x83, 0xF3, 0x48, 0x8C, 0xF0, 0x82, 0xC0, 0x4E,
                /* 08A8 */   0x0C, 0x0F, 0x30, 0xC6, 0x39, 0x79, 0xC3, 0xFA,
                /* 08B0 */   0xC2, 0xCB, 0x40, 0x83, 0x19, 0xDB, 0x97, 0x01,
                /* 08B8 */   0x36, 0x2A, 0xDF, 0x88, 0xC0, 0x97, 0xFC, 0x62,
                /* 08C0 */   0x00, 0x65, 0x16, 0xBE, 0x9E, 0xF8, 0xA0, 0xC4,
                /* 08C8 */   0x2E, 0x06, 0x2C, 0xE5, 0xC5, 0x00, 0x54, 0x37,
                /* 08D0 */   0x0C, 0x5F, 0x0C, 0xE0, 0x5F, 0x89, 0x5E, 0x0C,
                /* 08D8 */   0xC0, 0x70, 0x71, 0xF2, 0x3D, 0xC0, 0x1E, 0xEE,
                /* 08E0 */   0xA3, 0x74, 0x9C, 0xBE, 0xFD, 0xBD, 0x19, 0xF8,
                /* 08E8 */   0x6C, 0xC0, 0x60, 0x3C, 0xC3, 0x30, 0xC6, 0x08,
                /* 08F0 */   0xE3, 0x51, 0x86, 0x31, 0xC1, 0xDC, 0xB7, 0x03,
                /* 08F8 */   0xE8, 0x39, 0x87, 0x81, 0x4A, 0x78, 0x3B, 0x80,
                /* 0900 */   0x72, 0x0E, 0xE8, 0xF2, 0x68, 0x42, 0x4F, 0x01,
                /* 0908 */   0x4F, 0x07, 0x3E, 0x29, 0x1A, 0xA2, 0xAF, 0xB1,
                /* 0910 */   0x0A, 0x26, 0x50, 0xC4, 0x07, 0x0D, 0x3E, 0xB5,
                /* 0918 */   0x28, 0x3E, 0x15, 0x78, 0x2D, 0xCF, 0x4E, 0xE1,
                /* 0920 */   0xE2, 0x9C, 0x89, 0xA7, 0x6A, 0x38, 0x03, 0xBD,
                /* 0928 */   0xE6, 0x86, 0x63, 0xFF, 0x7F, 0x38, 0xFC, 0xA9,
                /* 0930 */   0xE0, 0x35, 0x80, 0x1D, 0x24, 0x3D, 0x2D, 0x23,
                /* 0938 */   0xC2, 0x38, 0xA4, 0x3C, 0x32, 0xF8, 0xB6, 0x18,
                /* 0940 */   0xC7, 0x90, 0x0F, 0x91, 0xBE, 0x13, 0x18, 0xF2,
                /* 0948 */   0x21, 0xEF, 0x79, 0xC7, 0xC0, 0xAF, 0x08, 0x71,
                /* 0950 */   0x9E, 0xB2, 0x7C, 0x67, 0xF0, 0x65, 0x01, 0x7C,
                /* 0958 */   0x91, 0x2E, 0x0B, 0x68, 0x68, 0x9F, 0x64, 0x7C,
                /* 0960 */   0x41, 0x30, 0xEC, 0x89, 0xB3, 0x00, 0x77, 0x05,
                /* 0968 */   0x50, 0x81, 0xFA, 0xAE, 0x00, 0xFF, 0x42, 0xF0,
                /* 0970 */   0xAE, 0x00, 0x86, 0x79, 0xF9, 0x56, 0xC0, 0x35,
                /* 0978 */   0x1D, 0x4A, 0xD0, 0x67, 0x12, 0x5F, 0x17, 0x70,
                /* 0980 */   0x53, 0x64, 0xA9, 0x8E, 0x0A, 0xD0, 0x53, 0x4C,
                /* 0988 */   0x02, 0x75, 0x47, 0xF7, 0x51, 0x01, 0xC6, 0x4D,
                /* 0990 */   0xD9, 0x07, 0x54, 0x76, 0x5A, 0x60, 0x67, 0x21,
                /* 0998 */   0x76, 0x1D, 0xC1, 0x5D, 0x49, 0x18, 0xCA, 0xB3,
                /* 09A0 */   0x81, 0x2F, 0x59, 0xFC, 0x70, 0x00, 0x03, 0xDC,
                /* 09A8 */   0xB3, 0x38, 0xC4, 0x08, 0xB1, 0xD9, 0x81, 0xEB,
                /* 09B0 */   0x75, 0xD2, 0x70, 0x2F, 0x44, 0xEC, 0xFF, 0x7F,
                /* 09B8 */   0x32, 0x00, 0xE3, 0x51, 0x1B, 0x1C, 0x27, 0x9D,
                /* 09C0 */   0xF0, 0x91, 0x9E, 0x59, 0xF8, 0x49, 0x19, 0x30,
                /* 09C8 */   0x71, 0xF2, 0x03, 0xE3, 0xC9, 0x1A, 0xC6, 0x00,
                /* 09D0 */   0xB8, 0xBC, 0x57, 0x95, 0x81, 0xFC, 0x43, 0x90,
                /* 09D8 */   0x20, 0x18, 0xD4, 0x29, 0x19, 0x38, 0x1C, 0xC5,
                /* 09E0 */   0x70, 0xA7, 0x64, 0x78, 0x50, 0xF8, 0xC3, 0x00,
                /* 09E8 */   0xE6, 0x46, 0xE8, 0x7B, 0x82, 0xA1, 0xDE, 0x93,
                /* 09F0 */   0x0E, 0xE3, 0x91, 0xD0, 0x04, 0x3E, 0x2D, 0xC3,
                /* 09F8 */   0xFA, 0xFF, 0x9F, 0x96, 0xF9, 0x39, 0x21, 0xFE,
                /* 0A00 */   0x53, 0xCE, 0xFB, 0xC5, 0x83, 0xB2, 0x31, 0xA2,
                /* 0A08 */   0xBC, 0x2A, 0xFB, 0x9C, 0x69, 0x14, 0x76, 0x4B,
                /* 0A10 */   0x7E, 0x73, 0x78, 0x55, 0xF6, 0x69, 0xF9, 0xDC,
                /* 0A18 */   0x22, 0xBD, 0x2F, 0x7B, 0xE4, 0x31, 0xE3, 0xC4,
                /* 0A20 */   0x0A, 0x12, 0xE8, 0x7D, 0x23, 0x4A, 0xD8, 0x18,
                /* 0A28 */   0xE1, 0x02, 0x3D, 0x2D, 0xB3, 0x63, 0xBB, 0x87,
                /* 0A30 */   0xEC, 0xB3, 0x02, 0xEE, 0xEC, 0x00, 0x77, 0x7A,
                /* 0A38 */   0xFC, 0xF4, 0x00, 0x38, 0x01, 0x7A, 0x7A, 0x00,
                /* 0A40 */   0xDB, 0x79, 0x03, 0xEE, 0x81, 0x00, 0x71, 0xFC,
                /* 0A48 */   0x47, 0x05, 0xBF, 0xB2, 0x50, 0x38, 0x7E, 0x6C,
                /* 0A50 */   0xE7, 0xC7, 0x12, 0xDC, 0xE1, 0xC0, 0x47, 0x06,
                /* 0A58 */   0x1F, 0x20, 0x71, 0x43, 0xF1, 0xA1, 0x02, 0x79,
                /* 0A60 */   0x16, 0x00, 0xC5, 0xE8, 0xD9, 0x08, 0xD8, 0x0D,
                /* 0A68 */   0xE6, 0xA5, 0x25, 0xCA, 0xFF, 0xFF, 0xBD, 0x81,
                /* 0A70 */   0x9D, 0x52, 0x70, 0x07, 0x01, 0xF0, 0x1D, 0x03,
                /* 0A78 */   0xC0, 0x3B, 0x18, 0x2E, 0x6B, 0xCC, 0x28, 0x21,
                /* 0A80 */   0x30, 0x1A, 0x33, 0xEE, 0x10, 0xC2, 0x4F, 0x04,
                /* 0A88 */   0xB8, 0x31, 0x7B, 0xDC, 0x1E, 0x33, 0xEE, 0x38,
                /* 0A90 */   0xCB, 0x47, 0xF5, 0x94, 0x11, 0xCA, 0x07, 0x0E,
                /* 0A98 */   0x76, 0xCE, 0x78, 0x23, 0xE0, 0x43, 0x07, 0x1E,
                /* 0AA0 */   0x07, 0x18, 0xDC, 0x91, 0x02, 0x8C, 0x97, 0x03,
                /* 0AA8 */   0x36, 0x76, 0x70, 0x07, 0x21, 0xA7, 0x40, 0x96,
                /* 0AB0 */   0x0E, 0xA3, 0xB1, 0xE3, 0x64, 0x03, 0xE9, 0x18,
                /* 0AB8 */   0xE3, 0x43, 0xAE, 0xC7, 0x8E, 0x1B, 0xAC, 0xC7,
                /* 0AC0 */   0x8E, 0x3B, 0xBE, 0x60, 0xFF, 0xFF, 0xC7, 0x17,
                /* 0AC8 */   0x30, 0x8C, 0x81, 0x8B, 0x1F, 0x06, 0xFA, 0xE6,
                /* 0AD0 */   0xE7, 0xD1, 0x19, 0xDC, 0xC3, 0xF6, 0x09, 0x26,
                /* 0AD8 */   0xC6, 0x1B, 0x4C, 0x88, 0x47, 0x96, 0x97, 0x96,
                /* 0AE0 */   0x08, 0x0F, 0x2D, 0xBE, 0xB9, 0xBC, 0xB4, 0xF8,
                /* 0AE8 */   0x16, 0x63, 0x94, 0x10, 0x11, 0x0E, 0x26, 0xCE,
                /* 0AF0 */   0x13, 0x8C, 0x11, 0x0E, 0x3C, 0x8A, 0x21, 0x22,
                /* 0AF8 */   0x9C, 0x40, 0x88, 0x93, 0x3E, 0xD9, 0x20, 0xE1,
                /* 0B00 */   0x63, 0x84, 0x8D, 0x16, 0xE5, 0x09, 0x86, 0x8D,
                /* 0B08 */   0x85, 0x9F, 0x57, 0x3C, 0x78, 0x7E, 0x5A, 0xF3,
                /* 0B10 */   0x5D, 0xD0, 0x93, 0x39, 0xC7, 0x87, 0x2C, 0x4F,
                /* 0B18 */   0xED, 0x71, 0xD2, 0x87, 0x59, 0xDC, 0xA0, 0x1E,
                /* 0B20 */   0x1C, 0xD9, 0x5D, 0xC7, 0xC7, 0x6B, 0xEC, 0x29,
                /* 0B28 */   0xC8, 0x43, 0xE0, 0x27, 0x02, 0x5F, 0x10, 0x3D,
                /* 0B30 */   0x59, 0xDF, 0xF5, 0xD8, 0xBD, 0xCC, 0x18, 0xD5,
                /* 0B38 */   0x4F, 0x01, 0x75, 0x4C, 0x39, 0x83, 0x57, 0x08,
                /* 0B40 */   0x76, 0xCF, 0xF3, 0x21, 0xDB, 0x77, 0x49, 0x36,
                /* 0B48 */   0x0A, 0xDC, 0x21, 0xC1, 0x67, 0x24, 0x7E, 0xAA,
                /* 0B50 */   0xF0, 0x30, 0x3C, 0x0A, 0x18, 0x33, 0x78, 0x47,
                /* 0B58 */   0x38, 0xB4, 0x10, 0x07, 0xFC, 0xBE, 0xCB, 0x86,
                /* 0B60 */   0x1A, 0xE3, 0xF4, 0x7C, 0xFE, 0x60, 0x83, 0x80,
                /* 0B68 */   0x0F, 0x75, 0xA8, 0x1E, 0xE6, 0x51, 0xBD, 0x14,
                /* 0B70 */   0x32, 0x9C, 0xB3, 0x83, 0x3B, 0x08, 0xEC, 0xF1,
                /* 0B78 */   0xC3, 0x83, 0xE0, 0x37, 0x4B, 0x3E, 0x08, 0x76,
                /* 0B80 */   0xBE, 0x79, 0x83, 0x33, 0xC8, 0xFF, 0xFF, 0x18,
                /* 0B88 */   0x60, 0x9F, 0xA9, 0x7C, 0x34, 0x41, 0x1C, 0x01,
                /* 0B90 */   0xD1, 0xE7, 0x0F, 0x8F, 0xE1, 0x4D, 0x8E, 0x0F,
                /* 0B98 */   0x07, 0x7B, 0xF4, 0xC0, 0x9D, 0x44, 0xE0, 0x1E,
                /* 0BA0 */   0xBB, 0x0E, 0xDA, 0xD7, 0x38, 0x5F, 0xB4, 0x60,
                /* 0BA8 */   0xDC, 0xF7, 0x9E, 0x45, 0xC0, 0x8F, 0xF1, 0xD8,
                /* 0BB0 */   0x02, 0x8E, 0x43, 0x09, 0xB8, 0x83, 0x1D, 0xD7,
                /* 0BB8 */   0x38, 0x84, 0xA2, 0xC0, 0xE8, 0x50, 0x82, 0x8B,
                /* 0BC0 */   0x01, 0x24, 0x18, 0xC7, 0x38, 0xA3, 0xA1, 0x2F,
                /* 0BC8 */   0x91, 0x3E, 0xA4, 0xC1, 0x19, 0x34, 0xEC, 0x79,
                /* 0BD0 */   0x3E, 0xA1, 0x70, 0x7B, 0x02, 0x14, 0x9D, 0x50,
                /* 0BD8 */   0x40, 0x86, 0xFB, 0x0C, 0x82, 0x3D, 0x21, 0xF0,
                /* 0BE0 */   0x33, 0x08, 0xFB, 0xFF, 0x1F, 0x1C, 0x3D, 0xEE,
                /* 0BE8 */   0xF7, 0x46, 0x9F, 0x1A, 0xD9, 0xDC, 0x1F, 0x02,
                /* 0BF0 */   0x4E, 0xE0, 0xDC, 0xD9, 0xA9, 0x19, 0x77, 0x66,
                /* 0BF8 */   0xC0, 0x9E, 0x3F, 0x3C, 0x04, 0x7E, 0x2E, 0xF0,
                /* 0C00 */   0xF0, 0x3D, 0x04, 0xFC, 0xE0, 0x1F, 0x98, 0x0D,
                /* 0C08 */   0x0E, 0xC6, 0x53, 0x84, 0xAF, 0x1D, 0x1C, 0x9C,
                /* 0C10 */   0x9F, 0x06, 0x0C, 0xCE, 0x5F, 0xA1, 0x3E, 0xCF,
                /* 0C18 */   0x33, 0x70, 0xEC, 0xA9, 0xD7, 0xF7, 0x0E, 0xCF,
                /* 0C20 */   0xD7, 0x87, 0x0A, 0xFC, 0x4D, 0xCF, 0x87, 0x0A,
                /* 0C28 */   0x70, 0x1C, 0x1E, 0xF8, 0x61, 0x85, 0x0D, 0xE1,
                /* 0C30 */   0x51, 0x00, 0x7F, 0x6A, 0xF1, 0xF1, 0x2F, 0xCE,
                /* 0C38 */   0x53, 0x04, 0xBB, 0x8D, 0x60, 0x0F, 0x17, 0x80,
                /* 0C40 */   0xA3, 0x68, 0x67, 0x31, 0x54, 0x98, 0xB3, 0x18,
                /* 0C48 */   0xF9, 0xFF, 0x9F, 0xA3, 0x50, 0x67, 0x31, 0x7A,
                /* 0C50 */   0xB8, 0x00, 0x5C, 0x08, 0x3E, 0x1E, 0x80, 0xE6,
                /* 0C58 */   0x20, 0xF0, 0xB8, 0xE0, 0x0B, 0xC1, 0x91, 0x1C,
                /* 0C60 */   0xC8, 0xD3, 0x01, 0xE0, 0x53, 0x1E, 0x09, 0x3D,
                /* 0C68 */   0x1F, 0x59, 0x10, 0x0C, 0xEA, 0x7C, 0xE0, 0x13,
                /* 0C70 */   0x8A, 0x8F, 0x1D, 0xFC, 0x6C, 0xE0, 0x1B, 0xB9,
                /* 0C78 */   0x87, 0xCA, 0x4F, 0xCD, 0x3E, 0x69, 0xF3, 0xE0,
                /* 0C80 */   0x3F, 0x69, 0xD9, 0x80, 0x51, 0xA0, 0x61, 0xA0,
                /* 0C88 */   0x46, 0xE4, 0x23, 0xD2, 0xFF, 0xFF, 0xB9, 0x0D,
                /* 0C90 */   0x1B, 0x60, 0x68, 0xF4, 0x1C, 0x0E, 0xE3, 0x80,
                /* 0C98 */   0xEB, 0x73, 0x38, 0x76, 0x40, 0x3E, 0x87, 0xC3,
                /* 0CA0 */   0x3F, 0x47, 0xC3, 0x1F, 0x1B, 0x3B, 0xDD, 0xF3,
                /* 0CA8 */   0x81, 0xC1, 0xBA, 0x7E, 0x63, 0x06, 0x06, 0xB6,
                /* 0CB0 */   0x6F, 0x91, 0x07, 0x06, 0x1C, 0x51, 0xCF, 0xC6,
                /* 0CB8 */   0x57, 0x08, 0x0F, 0x0C, 0x6C, 0x80, 0x1E, 0x18,
                /* 0CC0 */   0xF0, 0x89, 0x05, 0x21, 0x27, 0x03, 0x43, 0x9D,
                /* 0CC8 */   0x32, 0x8C, 0x1C, 0xF3, 0x89, 0xC3, 0xC3, 0xF0,
                /* 0CD0 */   0xA1, 0x22, 0xEA, 0x33, 0xC0, 0x23, 0x1E, 0x1B,
                /* 0CD8 */   0x1B, 0xFB, 0xFF, 0x8F, 0x0D, 0x2C, 0xC7, 0x16,
                /* 0CE0 */   0x8F, 0x0D, 0xFC, 0x47, 0x78, 0xFC, 0xD8, 0xE0,
                /* 0CE8 */   0x8C, 0xE5, 0xD1, 0xC4, 0x97, 0x99, 0x23, 0x3B,
                /* 0CF0 */   0x8D, 0x33, 0x7B, 0x0D, 0xF1, 0xD1, 0xEE, 0xF1,
                /* 0CF8 */   0xDB, 0x63, 0x03, 0x97, 0x85, 0xB1, 0x01, 0xA5,
                /* 0D00 */   0x90, 0x63, 0x43, 0x1F, 0x52, 0x7C, 0x0A, 0xB0,
                /* 0D08 */   0x71, 0x54, 0x32, 0x0F, 0x1F, 0xAF, 0x7C, 0x62,
                /* 0D10 */   0x38, 0xBA, 0x20, 0x6F, 0xE8, 0xBE, 0x5C, 0xF8,
                /* 0D18 */   0x48, 0x63, 0x30, 0x5F, 0x5A, 0x7C, 0x06, 0xE5,
                /* 0D20 */   0x43, 0x04, 0x97, 0x86, 0x21, 0x02, 0xA5, 0x50,
                /* 0D28 */   0x43, 0x44, 0x8F, 0xE7, 0xFF, 0xFF, 0x08, 0xE6,
                /* 0D30 */   0x21, 0xB2, 0xA1, 0x81, 0xF7, 0x1B, 0xA3, 0xA1,
                /* 0D38 */   0x01, 0xA1, 0x70, 0x43, 0x43, 0x1F, 0xD6, 0x7C,
                /* 0D40 */   0x08, 0x60, 0x10, 0xBE, 0x0D, 0xB0, 0xAB, 0x80,
                /* 0D48 */   0xAF, 0x42, 0x1E, 0xE0, 0x93, 0x28, 0x1B, 0x1E,
                /* 0D50 */   0xF8, 0x06, 0xE5, 0xE1, 0x01, 0x9F, 0xF0, 0xC0,
                /* 0D58 */   0x5E, 0x85, 0x87, 0x47, 0xCF, 0x4A, 0x1E, 0x1E,
                /* 0D60 */   0x3C, 0x90, 0xC7, 0x08, 0x76, 0x0E, 0xF1, 0xE0,
                /* 0D68 */   0xC0, 0x61, 0x62, 0x70, 0xA0, 0x38, 0xFA, 0xE3,
                /* 0D70 */   0x86, 0xC0, 0x2E, 0xB3, 0x9E, 0x38, 0xBF, 0xB2,
                /* 0D78 */   0x78, 0x50, 0xF8, 0xFF, 0xFF, 0x11, 0x00, 0xD6,
                /* 0D80 */   0x71, 0x06, 0x7C, 0xC1, 0x0E, 0x07, 0xE8, 0x63,
                /* 0D88 */   0x22, 0x1B, 0xC3, 0x43, 0xC4, 0x83, 0xAB, 0x07,
                /* 0D90 */   0xE2, 0x6B, 0xC7, 0x6B, 0x31, 0xEE, 0x68, 0x00,
                /* 0D98 */   0x2E, 0x15, 0x47, 0x03, 0xA0, 0x74, 0xB0, 0x05,
                /* 0DA0 */   0xC7, 0x3D, 0xCD, 0x47, 0x3B, 0xCC, 0x1C, 0x3D,
                /* 0DA8 */   0x80, 0xE7, 0x37, 0x8F, 0x96, 0x9F, 0xDF, 0x00,
                /* 0DB0 */   0x47, 0x41, 0x0F, 0xB6, 0x74, 0xE0, 0x8E, 0x06,
                /* 0DB8 */   0x83, 0x3A, 0xBF, 0x61, 0xFE, 0xFF, 0xE7, 0x37,
                /* 0DC0 */   0x30, 0x44, 0x00, 0xD7, 0x99, 0xC6, 0xE7, 0x17,
                /* 0DC8 */   0x38, 0x43, 0x3D, 0x68, 0x5F, 0x13, 0x3C, 0x6B,
                /* 0DD0 */   0xDF, 0xB8, 0xD8, 0x39, 0x01, 0x5C, 0x03, 0xF2,
                /* 0DD8 */   0x49, 0x07, 0x38, 0x02, 0x9F, 0xC4, 0x03, 0xFE,
                /* 0DE0 */   0xA1, 0x81, 0x79, 0x58, 0x1E, 0x1A, 0xF0, 0x39,
                /* 0DE8 */   0x1A, 0xE0, 0x4E, 0x14, 0xE0, 0xB9, 0x8D, 0xE0,
                /* 0DF0 */   0x0E, 0x14, 0xC0, 0xE2, 0xFF, 0x7F, 0xA0, 0x00,
                /* 0DF8 */   0x56, 0x47, 0x7C, 0x8F, 0x8B, 0x43, 0xE3, 0x10,
                /* 0E00 */   0x1F, 0xD2, 0xCE, 0xD9, 0xE7, 0xAF, 0x33, 0xC5,
                /* 0E08 */   0x9D, 0x45, 0xC0, 0x30, 0x06, 0x2E, 0x7F, 0x49,
                /* 0E10 */   0x54, 0xC4, 0x03, 0x43, 0x82, 0x61, 0x50, 0x27,
                /* 0E18 */   0x20, 0x0F, 0xC5, 0x07, 0x03, 0x0E, 0xEC, 0x23,
                /* 0E20 */   0x02, 0x3B, 0x17, 0xB0, 0x03, 0x94, 0xE1, 0xF8,
                /* 0E28 */   0x59, 0xC0, 0xA7, 0x84, 0x87, 0x9A, 0xE3, 0x78,
                /* 0E30 */   0xDC, 0xF4, 0xDD, 0xCC, 0x90, 0xEC, 0x6A, 0xF0,
                /* 0E38 */   0xFC, 0x83, 0x3D, 0xED, 0xC2, 0x39, 0xE2, 0x82,
                /* 0E40 */   0x8B, 0xC0, 0x67, 0x1D, 0x8F, 0x82, 0x9F, 0x1E,
                /* 0E48 */   0x3C, 0xC7, 0x37, 0x06, 0x9F, 0x1E, 0x98, 0x7B,
                /* 0E50 */   0x01, 0xE6, 0x0E, 0xDD, 0x42, 0x38, 0xA6, 0xD7,
                /* 0E58 */   0x87, 0x18, 0x47, 0xFD, 0xD8, 0xD0, 0x96, 0x00,
                /* 0E60 */   0x6D, 0x28, 0xBA, 0x03, 0xBC, 0x0C, 0x44, 0x09,
                /* 0E68 */   0x71, 0x04, 0x91, 0x5A, 0x43, 0xD1, 0xCC, 0x23,
                /* 0E70 */   0x45, 0x09, 0x18, 0xCF, 0x30, 0x8D, 0x4D, 0x46,
                /* 0E78 */   0x90, 0x31, 0x42, 0xC7, 0x09, 0x16, 0x25, 0xDA,
                /* 0E80 */   0x2B, 0x40, 0xFB, 0x83, 0x20, 0x62, 0x8F, 0x26,
                /* 0E88 */   0x34, 0xD2, 0xC9, 0x12, 0x3D, 0x6C, 0x1F, 0xB3,
                /* 0E90 */   0xF1, 0xA7, 0x55, 0xCC, 0xFF, 0x9F, 0xE0, 0x55,
                /* 0E98 */   0xC5, 0x5F, 0x00, 0x1F, 0x00, 0xF0, 0x2E, 0x01,
                /* 0EA0 */   0x75, 0x75, 0xF4, 0xB8, 0x7D, 0xDE, 0x00, 0xFF,
                /* 0EA8 */   0xF5, 0x02, 0x7B, 0x44, 0xD0, 0x20, 0x50, 0x23,
                /* 0EB0 */   0x33, 0xB4, 0xC7, 0xF9, 0x36, 0x63, 0xC8, 0x27,
                /* 0EB8 */   0x27, 0x0F, 0x92, 0x9C, 0x50, 0x81, 0xC6, 0xE0,
                /* 0EC0 */   0x9F, 0x36, 0x7C, 0x6D, 0xF7, 0x7C, 0x7D, 0xF2,
                /* 0EC8 */   0xC2, 0x1E, 0x47, 0xE0, 0x5E, 0x13, 0xF8, 0x81,
                /* 0ED0 */   0x04, 0x70, 0x06, 0xF4, 0x40, 0x02, 0x9E, 0xFF,
                /* 0ED8 */   0xFF, 0x81, 0x04, 0xD6, 0x50, 0x71, 0x43, 0xE0,
                /* 0EE0 */   0x11, 0x56, 0x44, 0x0F, 0x03, 0x16, 0x0D, 0x83,
                /* 0EE8 */   0x3A, 0x43, 0x81, 0x4B, 0x1C, 0xB8, 0x0E, 0x8F,
                /* 0EF0 */   0x3E, 0xAF, 0xC2, 0x19, 0xD4, 0x69, 0xF7, 0x7E,
                /* 0EF8 */   0x01, 0x21, 0x97, 0x03, 0x0F, 0xFA, 0x7C, 0x9E,
                /* 0F00 */   0x14, 0xD8, 0x21, 0x0A, 0xF8, 0x8F, 0x0D, 0xCE,
                /* 0F08 */   0x0D, 0xE0, 0xC9, 0x36, 0xC2, 0xB1, 0x81, 0xFD,
                /* 0F10 */   0x14, 0x05, 0x9C, 0xCE, 0x5B, 0x70, 0xAE, 0x35,
                /* 0F18 */   0xEC, 0x06, 0x8E, 0x1B, 0x1A, 0xEE, 0xFF, 0x3F,
                /* 0F20 */   0x34, 0x30, 0x1C, 0xDF, 0x7D, 0x20, 0x04, 0x0C,
                /* 0F28 */   0x1C, 0x84, 0xF8, 0xA5, 0xE2, 0x99, 0x88, 0x1F,
                /* 0F30 */   0xB8, 0x00, 0xE7, 0x27, 0x12, 0x7E, 0xDA, 0xF2,
                /* 0F38 */   0x89, 0x84, 0x1F, 0xB8, 0xC0, 0xFE, 0xFF, 0x3F,
                /* 0F40 */   0x70, 0x01, 0xF7, 0xFB, 0xD5, 0x3B, 0xC3, 0x4B,
                /* 0F48 */   0x83, 0xE7, 0xF4, 0xBE, 0x65, 0x8C, 0x17, 0x2D,
                /* 0F50 */   0x23, 0x44, 0x61, 0xB7, 0x81, 0x68, 0xF6, 0x76,
                /* 0F58 */   0xE0, 0x22, 0xA7, 0x2E, 0x8E, 0x19, 0xE9, 0xE9,
                /* 0F60 */   0x2B, 0x58, 0xA4, 0x88, 0x87, 0x13, 0x25, 0x44,
                /* 0F68 */   0xB0, 0xD7, 0x89, 0x27, 0xAF, 0x07, 0x2E, 0x26,
                /* 0F70 */   0xF8, 0xC0, 0x05, 0x74, 0x5C, 0x1F, 0xB8, 0x80,
                /* 0F78 */   0xCA, 0xE1, 0x17, 0x7F, 0xE0, 0x02, 0xEE, 0xE7,
                /* 0F80 */   0x26, 0x1C, 0xF0, 0xFF, 0xFF, 0x81, 0x0B, 0x5C,
                /* 0F88 */   0x27, 0x12, 0xC0, 0xF5, 0x58, 0x61, 0x8C, 0x81,
                /* 0F90 */   0x87, 0x39, 0x8E, 0xF0, 0x43, 0x25, 0x0E, 0x8E,
                /* 0F98 */   0x4A, 0x3F, 0x68, 0xD1, 0x43, 0xB7, 0x4F, 0x14,
                /* 0FA0 */   0xF8, 0xB9, 0x3C, 0x73, 0xFB, 0x7E, 0xE0, 0x43,
                /* 0FA8 */   0x11, 0xD8, 0x4F, 0x5A, 0xC0, 0xE1, 0x50, 0x81,
                /* 0FB0 */   0xF9, 0xFF, 0x1F, 0x2A, 0x58, 0xA0, 0xE3, 0x13,
                /* 0FB8 */   0x7A, 0x14, 0x3E, 0xB4, 0xE3, 0x8E, 0x59, 0xC0,
                /* 0FC0 */   0x3F, 0x32, 0xB0, 0x57, 0xE1, 0x81, 0x51, 0x16,
                /* 0FC8 */   0xA3, 0xBE, 0x41, 0x1C, 0xE2, 0xFB, 0xBD, 0xCF,
                /* 0FD0 */   0x72, 0xEF, 0x19, 0xBE, 0x04, 0x60, 0x6E, 0xFA,
                /* 0FD8 */   0x3E, 0x11, 0xB0, 0x63, 0x8F, 0x4F, 0x5A, 0xC0,
                /* 0FE0 */   0x69, 0x08, 0xEC, 0xFE, 0xE3, 0x99, 0xF3, 0x21,
                /* 0FE8 */   0x9C, 0x8D, 0x47, 0x8F, 0x3B, 0x11, 0x80, 0xEF,
                /* 0FF0 */   0x58, 0x02, 0x9E, 0x93, 0x05, 0x66, 0x06, 0xE1,
                /* 0FF8 */   0x9F, 0x3E, 0xD8, 0x51, 0xD0, 0xE7, 0x17, 0x4F,
                /* 1000 */   0xFA, 0x45, 0xC5, 0xC7, 0x12, 0x70, 0xFD, 0xFF,
                /* 1008 */   0xCF, 0x5D, 0x80, 0xC9, 0x28, 0x87, 0x2E, 0x94,
                /* 1010 */   0xF8, 0x73, 0x17, 0x20, 0xF0, 0xD6, 0xE5, 0x9B,
                /* 1018 */   0x72, 0x84, 0x17, 0x81, 0x33, 0x08, 0xF1, 0xAC,
                /* 1020 */   0xF5, 0xBE, 0x15, 0xC9, 0x77, 0x80, 0x38, 0xCF,
                /* 1028 */   0x5D, 0x06, 0x7B, 0xED, 0x78, 0x90, 0x88, 0xF2,
                /* 1030 */   0xCC, 0x6C, 0xA8, 0xE7, 0x66, 0x43, 0x9D, 0xFC,
                /* 1038 */   0x33, 0xB3, 0xB1, 0xC2, 0x06, 0x7A, 0xFC, 0x7A,
                /* 1040 */   0xEB, 0x0A, 0x69, 0x84, 0xE7, 0x2E, 0x26, 0xFC,
                /* 1048 */   0xDC, 0x05, 0xF1, 0xFF, 0x7F, 0xEE, 0x02, 0xD8,
                /* 1050 */   0x70, 0x54, 0xC0, 0x9D, 0xBB, 0xC0, 0x76, 0x26,
                /* 1058 */   0x01, 0xAC, 0x1D, 0x01, 0xFE, 0xFF, 0xCF, 0x24,
                /* 1060 */   0xE0, 0x1E, 0x2D, 0xCC, 0xB3, 0x07, 0xE2, 0xE0,
                /* 1068 */   0x85, 0x0A, 0xFF, 0x38, 0x30, 0x1C, 0x2A, 0xF8,
                /* 1070 */   0xA9, 0x82, 0x9E, 0xA7, 0x80, 0xCB, 0x81, 0x19,
                /* 1078 */   0x38, 0x09, 0x39, 0xC1, 0xE8, 0x3C, 0x85, 0x1B,
                /* 1080 */   0x8F, 0x41, 0x9F, 0x1E, 0x7C, 0x25, 0xE0, 0x87,
                /* 1088 */   0x29, 0x16, 0x1A, 0x42, 0x16, 0x4E, 0x5E, 0x40,
                /* 1090 */   0xEB, 0x30, 0x05, 0x8E, 0x2B, 0x4B, 0x60, 0xEC,
                /* 1098 */   0xED, 0xE0, 0x5D, 0xCE, 0x93, 0x78, 0x34, 0x39,
                /* 10A0 */   0xCE, 0x10, 0xEF, 0xD6, 0x26, 0x78, 0x30, 0x88,
                /* 10A8 */   0xF4, 0x5E, 0xC3, 0x06, 0x18, 0xFD, 0x25, 0xC2,
                /* 10B0 */   0xFF, 0xFF, 0xA3, 0x15, 0x70, 0x84, 0x38, 0x1B,
                /* 10B8 */   0x7E, 0xBA, 0x30, 0xE6, 0xE9, 0xF0, 0xA3, 0x15,
                /* 10C0 */   0xC0, 0xC1, 0xFF, 0xFF, 0xD1, 0x0A, 0xFC, 0x17,
                /* 10C8 */   0x2B, 0x8F, 0xF9, 0x8C, 0xDF, 0xA6, 0x9E, 0xA6,
                /* 10D0 */   0xA2, 0xBC, 0x1F, 0xBF, 0x52, 0xBD, 0x1B, 0x18,
                /* 10D8 */   0xEB, 0x21, 0xE0, 0xA9, 0xCA, 0x77, 0x2A, 0x1F,
                /* 10E0 */   0x2B, 0x9E, 0x90, 0x8D, 0x12, 0xEB, 0xE5, 0xCA,
                /* 10E8 */   0x98, 0x31, 0x82, 0xBD, 0x57, 0xC5, 0x7C, 0xCC,
                /* 10F0 */   0xF2, 0x08, 0xA3, 0x05, 0xF7, 0x09, 0x99, 0x1F,
                /* 10F8 */   0xAD, 0x00, 0x86, 0x9D, 0x49, 0xF0, 0xFF, 0xFF,
                /* 1100 */   0x33, 0x09, 0x60, 0xE9, 0x68, 0x05, 0xF6, 0xD1,
                /* 1108 */   0xC2, 0x1C, 0x05, 0x8F, 0xF9, 0x1E, 0x31, 0x10,
                /* 1110 */   0x0D, 0x06, 0x83, 0x22, 0x70, 0x28, 0x20, 0x99,
                /* 1118 */   0x00, 0xF1, 0xD1, 0x0A, 0x7D, 0x10, 0xF1, 0xB0,
                /* 1120 */   0x1F, 0x1A, 0x3C, 0x89, 0x53, 0xF5, 0xAD, 0xE1,
                /* 1128 */   0x28, 0x9E, 0x00, 0x7C, 0xB8, 0x02, 0xFE, 0x43,
                /* 1130 */   0x83, 0x35, 0x89, 0xE2, 0x87, 0x06, 0xE9, 0xFF,
                /* 1138 */   0x7F, 0x4A, 0x06, 0xE6, 0x51, 0x4F, 0xC9, 0xE8,
                /* 1140 */   0x83, 0x8E, 0xCF, 0x06, 0x31, 0x5F, 0xAD, 0x22,
                /* 1148 */   0x3C, 0x5A, 0xF9, 0xFA, 0xC0, 0x4E, 0x72, 0x3E,
                /* 1150 */   0x85, 0x04, 0x8A, 0xF2, 0x3A, 0xC2, 0xE3, 0x1C,
                /* 1158 */   0x93, 0x81, 0xCE, 0x21, 0xC2, 0x43, 0xE0, 0x03,
                /* 1160 */   0xF4, 0x0C, 0x1E, 0x21, 0x1E, 0x4F, 0xF8, 0x11,
                /* 1168 */   0x1C, 0x38, 0x5C, 0xCD, 0x7C, 0x67, 0x62, 0xA7,
                /* 1170 */   0x01, 0xB0, 0xE9, 0x38, 0x0D, 0x00, 0xA5, 0x58,
                /* 1178 */   0x03, 0x43, 0x1F, 0x55, 0xFE, 0xFF, 0x0F, 0x4D,
                /* 1180 */   0xF6, 0x3E, 0x09, 0x4D, 0x8C, 0x5D, 0x47, 0x5E,
                /* 1188 */   0x52, 0x7C, 0x3D, 0x79, 0x1C, 0x04, 0x9F, 0x8F,
                /* 1190 */   0xB1, 0x01, 0xA5, 0x61, 0xF8, 0x28, 0x07, 0x36,
                /* 1198 */   0x98, 0x83, 0x79, 0x69, 0xF7, 0x20, 0x1F, 0xF5,
                /* 11A0 */   0xD8, 0x41, 0x0E, 0xB0, 0x1E, 0xE1, 0x14, 0x87,
                /* 11A8 */   0x12, 0x7D, 0x90, 0x03, 0xC1, 0xFF, 0xFF, 0x20,
                /* 11B0 */   0x07, 0xF8, 0xB9, 0x33, 0x18, 0xE1, 0xFC, 0x43,
                /* 11B8 */   0x3C, 0x40, 0x84, 0x78, 0x86, 0x33, 0x48, 0x9C,
                /* 11C0 */   0x20, 0x2F, 0x03, 0x0F, 0x72, 0xBE, 0xC7, 0xC5,
                /* 11C8 */   0x79, 0x96, 0x8B, 0xF2, 0x26, 0x67, 0x84, 0x47,
                /* 11D0 */   0x6E, 0x03, 0xF9, 0xBC, 0xED, 0x5B, 0xDC, 0x33,
                /* 11D8 */   0xDD, 0xAB, 0x9C, 0xEF, 0xDC, 0xBE, 0x7E, 0xFB,
                /* 11E0 */   0x20, 0xC7, 0x04, 0x1F, 0xE4, 0x00, 0x42, 0xFC,
                /* 11E8 */   0xFF, 0x0F, 0x72, 0xB0, 0x4E, 0xAA, 0xE0, 0x39,
                /* 11F0 */   0xC8, 0xC1, 0x38, 0x91, 0x00, 0xAE, 0xC7, 0x0A,
                /* 11F8 */   0xE3, 0xDC, 0x81, 0x38, 0xC1, 0xF1, 0xE3, 0x88,
                /* 1200 */   0xC2, 0x9F, 0x48, 0x00, 0x39, 0xFF, 0xFF, 0x13,
                /* 1208 */   0x09, 0x38, 0x66, 0x74, 0xFA, 0x6F, 0xAA, 0xBE,
                /* 1210 */   0x84, 0xBC, 0x93, 0x1C, 0xC2, 0x93, 0xAA, 0x41,
                /* 1218 */   0x8C, 0x70, 0xDC, 0x4F, 0x24, 0x3E, 0x8E, 0x3C,
                /* 1220 */   0x8C, 0x3C, 0x96, 0xF8, 0xC2, 0x6A, 0xB0, 0x10,
                /* 1228 */   0x2F, 0xAC, 0x3E, 0xA5, 0xFA, 0x66, 0xE2, 0xEB,
                /* 1230 */   0x89, 0x31, 0x7C, 0x68, 0x35, 0xDC, 0x13, 0x09,
                /* 1238 */   0x3B, 0xAE, 0xDB, 0xC3, 0x89, 0x04, 0xA0, 0xC8,
                /* 1240 */   0x19, 0x0E, 0xCE, 0xA1, 0x22, 0x22, 0x3B, 0x98,
                /* 1248 */   0x81, 0x6F, 0x30, 0x1E, 0x18, 0xAC, 0xFF, 0xFF,
                /* 1250 */   0xC1, 0x0C, 0xCC, 0xF2, 0x0E, 0x66, 0x20, 0x3C,
                /* 1258 */   0x85, 0x3C, 0x08, 0xBC, 0x58, 0xB0, 0x53, 0x0B,
                /* 1260 */   0xE0, 0x3C, 0x83, 0x0A, 0x10, 0x76, 0x14, 0xB0,
                /* 1268 */   0xA4, 0x33, 0x8B, 0x60, 0x38, 0x8B, 0x4F, 0x08,
                /* 1270 */   0x3E, 0x17, 0xF0, 0x13, 0x82, 0x47, 0x50, 0xF1,
                /* 1278 */   0x38, 0xE9, 0xC9, 0xC4, 0x67, 0x5B, 0x76, 0x32,
                /* 1280 */   0x70, 0xF4, 0x41, 0xD2, 0x91, 0xE1, 0xCE, 0x03,
                /* 1288 */   0x60, 0x3B, 0xB0, 0xE0, 0xFF, 0xFF, 0x67, 0x08,
                /* 1290 */   0x76, 0x28, 0x00, 0xDC, 0xE8, 0x7C, 0x0F, 0x6B,
                /* 1298 */   0xE4, 0xD6, 0x08, 0x22, 0x1B, 0x87, 0x57, 0xCA,
                /* 12A0 */   0xE1, 0x24, 0x8B, 0xD3, 0x31, 0xD7, 0x07, 0x1F,
                /* 12A8 */   0xDF, 0x4D, 0x4E, 0xE5, 0x54, 0xF1, 0x18, 0x4F,
                /* 12B0 */   0x1A, 0x82, 0x14, 0xBC, 0x0F, 0x26, 0xD6, 0x0C,
                /* 12B8 */   0xA3, 0x78, 0x0F, 0x22, 0x8D, 0xC6, 0x67, 0x53,
                /* 12C0 */   0x02, 0x23, 0x38, 0x83, 0xF8, 0x50, 0xE3, 0x6C,
                /* 12C8 */   0x87, 0x1A, 0xB4, 0x12, 0x10, 0x8D, 0x81, 0x1F,
                /* 12D0 */   0x69, 0x30, 0x41, 0xEE, 0xB3, 0x74, 0xE6, 0xBE,
                /* 12D8 */   0x1C, 0xF0, 0x4B, 0x9C, 0xCF, 0x1D, 0x06, 0xF7,
                /* 12E0 */   0x9D, 0x04, 0x1C, 0xB3, 0xB1, 0x1A, 0x50, 0xD4,
                /* 12E8 */   0x00, 0x8C, 0x86, 0x39, 0x07, 0x3C, 0xD9, 0x80,
                /* 12F0 */   0x2B, 0xD7, 0xCD, 0x05, 0xFD, 0x92, 0xF0, 0xCD,
                /* 12F8 */   0x05, 0x33, 0x37, 0x30, 0xFC, 0xFF, 0xE7, 0x06,
                /* 1300 */   0x86, 0xF1, 0x7B, 0x6E, 0xB0, 0xD0, 0x3C, 0x37,
                /* 1308 */   0xF8, 0xB7, 0x17, 0x6C, 0xB4, 0xB9, 0xA1, 0x91,
                /* 1310 */   0xD9, 0x65, 0xD6, 0x08, 0xAF, 0x08, 0x3E, 0x7C,
                /* 1318 */   0x78, 0x74, 0xC0, 0x01, 0xD0, 0xA3, 0x83, 0x85,
                /* 1320 */   0xE4, 0xD1, 0x81, 0x2D, 0xE1, 0xE8, 0xD0, 0x7A,
                /* 1328 */   0x40, 0xE4, 0xF2, 0x34, 0x45, 0x4E, 0x26, 0xA7,
                /* 1330 */   0x77, 0x32, 0x6F, 0x2A, 0x3E, 0x5D, 0x04, 0x09,
                /* 1338 */   0x14, 0x27, 0xFA, 0xB3, 0x89, 0x27, 0x08, 0x1C,
                /* 1340 */   0x06, 0xE0, 0x09, 0xC2, 0x42, 0xF3, 0x04, 0xC1,
                /* 1348 */   0x16, 0xF1, 0x9A, 0x81, 0xBE, 0x7F, 0x18, 0x39,
                /* 1350 */   0xE4, 0xE9, 0x45, 0xF8, 0xFF, 0x3F, 0x9A, 0xB0,
                /* 1358 */   0xDB, 0x0D, 0x8C, 0x11, 0x02, 0x07, 0x0B, 0x23,
                /* 1360 */   0x84, 0x88, 0xE6, 0xA3, 0x06, 0xD8, 0xE2, 0x8D,
                /* 1368 */   0x10, 0x3D, 0x2C, 0xDF, 0x4A, 0xCE, 0xEF, 0xE4,
                /* 1370 */   0x8E, 0x0F, 0x58, 0x01, 0x7B, 0x7C, 0xB0, 0x50,
                /* 1378 */   0x3C, 0x3E, 0xB0, 0xE9, 0xBB, 0x1B, 0x81, 0x02,
                /* 1380 */   0xC8, 0x27, 0x21, 0x9F, 0x4F, 0x5E, 0x86, 0xD8,
                /* 1388 */   0x18, 0x5E, 0xA5, 0x8C, 0x66, 0x74, 0x9E, 0x69,
                /* 1390 */   0x4B, 0x3A, 0xDF, 0xF0, 0x14, 0x30, 0x3A, 0xBB,
                /* 1398 */   0x18, 0xC4, 0x37, 0x12, 0x2B, 0x04, 0xD1, 0x31,
                /* 13A0 */   0x04, 0x8F, 0xFF, 0xE2, 0xEC, 0x9B, 0x82, 0x67,
                /* 13A8 */   0x6B, 0x82, 0x7A, 0x20, 0x75, 0x1C, 0xF0, 0x01,
                /* 13B0 */   0x10, 0xFB, 0xFF, 0x27, 0x78, 0xBB, 0xE0, 0xD3,
                /* 13B8 */   0xB0, 0x70, 0x28, 0x9F, 0x84, 0xE8, 0xB4, 0xAD,
                /* 13C0 */   0x75, 0xD0, 0xBA, 0xC2, 0x04, 0x3C, 0x85, 0x57,
                /* 13C8 */   0x21, 0xE3, 0xF9, 0xDC, 0xCA, 0xC6, 0x63, 0x1B,
                /* 13D0 */   0x07, 0x23, 0x7A, 0xC2, 0xF2, 0x41, 0x31, 0xC1,
                /* 13D8 */   0xAB, 0x84, 0x0F, 0x13, 0x4F, 0x4A, 0xEC, 0xD2,
                /* 13E0 */   0x98, 0xE0, 0xD1, 0x31, 0xC1, 0x23, 0x63, 0x82,
                /* 13E8 */   0x07, 0xC6, 0x04, 0xCF, 0x8D, 0x21, 0x8D, 0xCA,
                /* 13F0 */   0x60, 0x0D, 0xF1, 0x04, 0xC7, 0xF4, 0xAD, 0x4F,
                /* 13F8 */   0x83, 0xE1, 0xA3, 0xF3, 0x60, 0x30, 0xF7, 0x23,
                /* 1400 */   0x8F, 0x4E, 0x80, 0x1A, 0x0B, 0x57, 0x02, 0xA3,
                /* 1408 */   0x41, 0x87, 0x7B, 0xBA, 0x7A, 0xBB, 0xF2, 0x65,
                /* 1410 */   0xC1, 0x17, 0x06, 0x5F, 0xA8, 0xBC, 0x80, 0x60,
                /* 1418 */   0x9E, 0x57, 0x84, 0x17, 0x06, 0xDF, 0xA6, 0xD8,
                /* 1420 */   0xF9, 0xC8, 0x87, 0x2A, 0x43, 0xC5, 0x09, 0xFC,
                /* 1428 */   0x4A, 0xF0, 0xAE, 0x15, 0x22, 0x98, 0x61, 0x1F,
                /* 1430 */   0x03, 0x1E, 0x37, 0x8C, 0xEA, 0x33, 0xA8, 0xB1,
                /* 1438 */   0x1E, 0x93, 0x3C, 0x62, 0x7E, 0x9F, 0x3A, 0xA0,
                /* 1440 */   0x48, 0xCF, 0x3F, 0x9E, 0x80, 0x2F, 0x59, 0xBE,
                /* 1448 */   0x29, 0x9E, 0x94, 0xCF, 0x9C, 0x46, 0x7F, 0x95,
                /* 1450 */   0xF0, 0xA5, 0xCC, 0xC8, 0x3E, 0x81, 0xB1, 0x3B,
                /* 1458 */   0x23, 0x1B, 0x14, 0x47, 0x7C, 0x70, 0x78, 0x08,
                /* 1460 */   0xF1, 0x54, 0xD8, 0xFD, 0x09, 0x03, 0x76, 0x04,
                /* 1468 */   0x3E, 0x0C, 0xF2, 0xA3, 0x4B, 0xA0, 0x28, 0xC5,
                /* 1470 */   0x63, 0xEA, 0xE6, 0xE0, 0x19, 0x1A, 0x14, 0x03,
                /* 1478 */   0x7F, 0x90, 0x6C, 0x76, 0x71, 0x8D, 0xE5, 0x7B,
                /* 1480 */   0x89, 0x11, 0xB1, 0x03, 0x62, 0x28, 0x91, 0x4E,
                /* 1488 */   0xA0, 0x7A, 0x14, 0x32, 0x07, 0x8F, 0xC8, 0xB3,
                /* 1490 */   0xF1, 0x74, 0xD8, 0xA9, 0x03, 0x3F, 0x09, 0x9F,
                /* 1498 */   0x9A, 0x7C, 0x83, 0xF5, 0x80, 0x3C, 0x14, 0x3E,
                /* 14A0 */   0x85, 0xFF, 0xFF, 0x29, 0x1A, 0x18, 0x0E, 0xCC,
                /* 14A8 */   0x4B, 0x00, 0x83, 0xF6, 0xF0, 0x19, 0xFA, 0x8B,
                /* 14B0 */   0x91, 0xD1, 0xF9, 0x79, 0xE7, 0x74, 0x7C, 0xE2,
                /* 14B8 */   0xF4, 0x51, 0xC3, 0xF7, 0x00, 0xCC, 0x99, 0xCC,
                /* 14C0 */   0x27, 0x00, 0x9F, 0xD9, 0x18, 0x50, 0x88, 0xE7,
                /* 14C8 */   0xB8, 0xA8, 0xBE, 0x99, 0xB2, 0xCB, 0x0F, 0x06,
                /* 14D0 */   0xE9, 0x34, 0x9E, 0x7E, 0x70, 0xF7, 0x33, 0x0E,
                /* 14D8 */   0x16, 0xE8, 0x58, 0xF9, 0x64, 0xE2, 0x79, 0xC2,
                /* 14E0 */   0x1E, 0x29, 0x9C, 0x2B, 0x06, 0x3B, 0x98, 0xF0,
                /* 14E8 */   0x2B, 0x86, 0x0F, 0x26, 0xEC, 0x1A, 0x88, 0xB9,
                /* 14F0 */   0x63, 0x82, 0xEB, 0x8A, 0xE1, 0x93, 0x09, 0x98,
                /* 14F8 */   0xE1, 0x31, 0xB7, 0x53, 0x9F, 0x67, 0x2C, 0x6B,
                /* 1500 */   0x5C, 0xA8, 0x23, 0x8D, 0x4F, 0x32, 0x4F, 0xC8,
                /* 1508 */   0xC6, 0x7E, 0x18, 0xF0, 0xA4, 0x0F, 0xF3, 0x04,
                /* 1510 */   0x5F, 0xD6, 0x30, 0xB0, 0xBE, 0x94, 0x70, 0x58,
                /* 1518 */   0xA3, 0x85, 0x7D, 0x1D, 0x30, 0xEC, 0x23, 0x20,
                /* 1520 */   0xEE, 0xA2, 0x0B, 0x16, 0x40, 0xFC, 0x25, 0xE1,
                /* 1528 */   0xC1, 0xC0, 0x13, 0x30, 0x20, 0x8B, 0x73, 0xA7,
                /* 1530 */   0x46, 0x05, 0x80, 0xD1, 0xFF, 0xFF, 0x5A, 0x0D,
                /* 1538 */   0xD8, 0xBB, 0x4C, 0xFB, 0x1C, 0xF3, 0x0E, 0xF3,
                /* 1540 */   0x50, 0xF0, 0x2E, 0x13, 0x21, 0xC8, 0xF3, 0xF4,
                /* 1548 */   0x3B, 0x42, 0x84, 0x50, 0x81, 0x5E, 0xAB, 0x8D,
                /* 1550 */   0x17, 0xF4, 0x65, 0x22, 0x4A, 0x9C, 0x28, 0x11,
                /* 1558 */   0x42, 0x19, 0xE3, 0x5C, 0x9E, 0x0E, 0x5E, 0x6A,
                /* 1560 */   0xC2, 0x3D, 0x26, 0x04, 0x7E, 0x72, 0x78, 0xAE,
                /* 1568 */   0x36, 0xC2, 0x31, 0xBE, 0x56, 0x33, 0xF1, 0x17,
                /* 1570 */   0x19, 0xDD, 0x93, 0x7C, 0xAD, 0x06, 0x5C, 0xFF,
                /* 1578 */   0xFF, 0xAF, 0xD5, 0xE0, 0x1C, 0x86, 0xEF, 0xB3,
                /* 1580 */   0xE0, 0xB8, 0x26, 0xF0, 0x1B, 0x2D, 0xE0, 0x70,
                /* 1588 */   0x1A, 0x6F, 0xCD, 0xE0, 0x1E, 0x2E, 0xEC, 0x61,
                /* 1590 */   0xF0, 0x64, 0x2F, 0x03, 0x7A, 0x28, 0xB0, 0xA8,
                /* 1598 */   0x8B, 0x33, 0x68, 0xC3, 0x8F, 0x93, 0x9E, 0x49,
                /* 15A0 */   0x70, 0x27, 0x03, 0xB8, 0xFF, 0xFF, 0x91, 0x61,
                /* 15A8 */   0x10, 0x9E, 0x6B, 0x7C, 0x80, 0xF0, 0x49, 0xC2,
                /* 15B0 */   0x53, 0x83, 0x73, 0x30, 0x00, 0xDC, 0x68, 0x7F,
                /* 15B8 */   0xEE, 0xEA, 0xAC, 0xE1, 0x00, 0x1F, 0x3D, 0xDD,
                /* 15C0 */   0x9C, 0x71, 0x31, 0x9F, 0x39, 0x9A, 0x26, 0x1B,
                /* 15C8 */   0x2A, 0x2C, 0x02, 0xC7, 0xBA, 0x32, 0xD3, 0x01,
                /* 15D0 */   0xF8, 0xCE, 0x6C, 0xED, 0x24, 0xBA, 0x0A, 0x72,
                /* 15D8 */   0xB5, 0x17, 0x3A, 0x0A, 0xE2, 0x93, 0x8F, 0x0F,
                /* 15E0 */   0xC3, 0x3E, 0xB7, 0xE0, 0x0E, 0xC3, 0xBE, 0x37,
                /* 15E8 */   0x03, 0x66, 0x82, 0xCD, 0x0D, 0x7D, 0x5F, 0xF1,
                /* 15F0 */   0x49, 0x10, 0x33, 0x38, 0xFF, 0xFF, 0x0F, 0xCE,
                /* 15F8 */   0xC0, 0x7F, 0x70, 0xD8, 0x13, 0x39, 0x9C, 0x83,
                /* 1600 */   0x2A, 0xB0, 0xBA, 0x38, 0x83, 0xFD, 0xA0, 0x0A,
                /* 1608 */   0x9C, 0x34, 0xDD, 0x26, 0x50, 0x2A, 0x6E, 0x13,
                /* 1610 */   0x14, 0xC4, 0x37, 0x00, 0x27, 0xA4, 0xD1, 0x41,
                /* 1618 */   0x15, 0x7E, 0x1E, 0x48, 0x1D, 0x54, 0xE1, 0x4F,
                /* 1620 */   0xE8, 0x41, 0x15, 0xFF, 0xFF, 0x3F, 0xA8, 0xC2,
                /* 1628 */   0xB8, 0xD3, 0x79, 0x3C, 0x3E, 0xF5, 0x9B, 0xD5,
                /* 1630 */   0x07, 0x55, 0xB8, 0x79, 0x07, 0x81, 0x3A, 0xA0,
                /* 1638 */   0xC2, 0xC9, 0x37, 0x06, 0x54, 0x32, 0x08, 0x1D,
                /* 1640 */   0x50, 0x01, 0x5B, 0x07, 0x49, 0xC0, 0xF1, 0xFF,
                /* 1648 */   0xFF, 0x20, 0x09, 0x7C, 0x72, 0xAF, 0x4B, 0x07,
                /* 1650 */   0x22, 0x7E, 0x7A, 0xB4, 0xBA, 0x03, 0x11, 0x02,
                /* 1658 */   0xE3, 0x99, 0xEF, 0xF1, 0xC3, 0xB3, 0xF1, 0x51,
                /* 1660 */   0xC0, 0xC7, 0x28, 0xCF, 0xFC, 0x8C, 0x9E, 0x78,
                /* 1668 */   0x99, 0x96, 0x13, 0x11, 0x4A, 0x05, 0x8C, 0x02,
                /* 1670 */   0xD3, 0xE8, 0xCE, 0xC1, 0x23, 0xC2, 0x08, 0xCE,
                /* 1678 */   0x20, 0x1E, 0xAD, 0x6F, 0x2E, 0xC0, 0xF4, 0x4C,
                /* 1680 */   0x04, 0x5C, 0x42, 0xCE, 0x0E, 0x3D, 0x6F, 0x4F,
                /* 1688 */   0x9B, 0xE1, 0x3E, 0x17, 0x63, 0xA6, 0x0D, 0xE3,
                /* 1690 */   0x64, 0x04, 0xEC, 0xFE, 0xFF, 0x27, 0x23, 0x30,
                /* 1698 */   0xDE, 0x75, 0x00, 0x36, 0xFF, 0xFF, 0xEF, 0x3A,
                /* 16A0 */   0x80, 0xCD, 0xFB, 0x83, 0xEF, 0x3A, 0xC0, 0x35,
                /* 16A8 */   0xD2, 0x05, 0x1C, 0x15, 0xE2, 0x0E, 0x0E, 0x48,
                /* 16B0 */   0xFB, 0xFF, 0xDF, 0xC1, 0x71, 0xC7, 0x8D, 0x97,
                /* 16B8 */   0x88, 0xD7, 0x6E, 0x5F, 0xC2, 0x7D, 0x26, 0x38,
                /* 16C0 */   0x85, 0x87, 0xEF, 0xC3, 0x8A, 0xF3, 0xBE, 0x11,
                /* 16C8 */   0xE2, 0x1D, 0xDC, 0x87, 0x6F, 0xDF, 0xC1, 0x8D,
                /* 16D0 */   0x17, 0x29, 0x60, 0xB4, 0x28, 0xC1, 0x1E, 0xC2,
                /* 16D8 */   0x43, 0x04, 0x8D, 0x14, 0x22, 0x60, 0x88, 0x77,
                /* 16E0 */   0xF0, 0x58, 0xE1, 0xA2, 0xBF, 0x83, 0xB3, 0x00,
                /* 16E8 */   0x77, 0x70, 0x80, 0x26, 0xD7, 0x68, 0xDC, 0x1D,
                /* 16F0 */   0x1C, 0x6C, 0x97, 0x63, 0xE0, 0xF0, 0xFF, 0xBF,
                /* 16F8 */   0x1C, 0x03, 0x73, 0xC1, 0x97, 0x70, 0x90, 0x8F,
                /* 1700 */   0x17, 0x0C, 0xE3, 0xE0, 0xCA, 0x49, 0xE8, 0xB1,
                /* 1708 */   0xC0, 0x5A, 0x61, 0x50, 0xB7, 0x70, 0x70, 0x69,
                /* 1710 */   0x02, 0xD7, 0x55, 0xD9, 0x87, 0x1A, 0x1F, 0x82,
                /* 1718 */   0xF1, 0xE7, 0x0B, 0x5C, 0x80, 0x21, 0xD3, 0x53,
                /* 1720 */   0x19, 0x8C, 0x6B, 0x8A, 0x4F, 0x65, 0x98, 0xBB,
                /* 1728 */   0x83, 0x07, 0xE4, 0x23, 0x06, 0xF0, 0x59, 0x85,
                /* 1730 */   0x07, 0x86, 0x3B, 0x2D, 0xF8, 0xA6, 0x64, 0xD0,
                /* 1738 */   0x73, 0x0C, 0xEA, 0x23, 0xCF, 0xC9, 0xFB, 0x9E,
                /* 1740 */   0xF0, 0x38, 0xE1, 0xA8, 0xE7, 0x20, 0xF2, 0xFF,
                /* 1748 */   0x1F, 0x1B, 0x58, 0x8E, 0x1B, 0xE0, 0x38, 0xDC,
                /* 1750 */   0xE0, 0xCE, 0x79, 0x6C, 0x5C, 0x18, 0xB8, 0xE7,
                /* 1758 */   0x02, 0x0F, 0xC3, 0x37, 0x1D, 0x8F, 0x08, 0x33,
                /* 1760 */   0xFE, 0x47, 0x3D, 0x23, 0x04, 0xC4, 0x5F, 0x8C,
                /* 1768 */   0xD8, 0x80, 0xC1, 0x78, 0x6B, 0xF3, 0xF5, 0x0D,
                /* 1770 */   0x37, 0x60, 0x5F, 0x1D, 0x7C, 0xC1, 0xF0, 0x09,
                /* 1778 */   0xCC, 0xE8, 0x2F, 0x30, 0x4F, 0x62, 0x3E, 0x36,
                /* 1780 */   0x90, 0x0B, 0x1C, 0x1D, 0x30, 0x38, 0x00, 0x3D,
                /* 1788 */   0x60, 0xF8, 0x87, 0x8B, 0x77, 0x39, 0x30, 0x5C,
                /* 1790 */   0x05, 0x7D, 0x5C, 0xF0, 0xB1, 0xC7, 0x8A, 0xEE,
                /* 1798 */   0x72, 0xE8, 0x9B, 0x9C, 0x61, 0xE2, 0x18, 0xE2,
                /* 17A0 */   0x0D, 0x8C, 0xDD, 0x25, 0xC8, 0x61, 0x0E, 0xEA,
                /* 17A8 */   0x5D, 0xC2, 0x73, 0xE0, 0x67, 0x0B, 0x9F, 0xE0,
                /* 17B0 */   0x7C, 0xF3, 0x09, 0x71, 0xAA, 0x8F, 0x56, 0xEF,
                /* 17B8 */   0x01, 0x3E, 0x7A, 0xBC, 0x77, 0xF9, 0xEC, 0xC4,
                /* 17C0 */   0x2E, 0x02, 0x3E, 0x72, 0x19, 0xC7, 0xD3, 0xF4,
                /* 17C8 */   0x15, 0xD0, 0x43, 0xF6, 0xFF, 0x1F, 0xEC, 0x55,
                /* 17D0 */   0xC3, 0x27, 0x30, 0x1F, 0xDD, 0x70, 0xC7, 0x28,
                /* 17D8 */   0xCF, 0xC4, 0xD3, 0xF7, 0x1D, 0x84, 0x1D, 0x49,
                /* 17E0 */   0x8E, 0x3A, 0xD4, 0x35, 0x3D, 0xA2, 0x9C, 0xD0,
                /* 17E8 */   0x81, 0xF8, 0xD6, 0x06, 0xCE, 0x68, 0xF7, 0x0F,
                /* 17F0 */   0xF4, 0x36, 0x3D, 0x32, 0xCC, 0xD1, 0x00, 0xD6,
                /* 17F8 */   0x25, 0x04, 0x5C, 0x77, 0x0C, 0x5F, 0x42, 0x80,
                /* 1800 */   0x4F, 0xD0, 0x4B, 0x04, 0xFA, 0x9A, 0xE1, 0xD1,
                /* 1808 */   0x3D, 0x02, 0x60, 0xAE, 0x18, 0xEC, 0x58, 0xE0,
                /* 1810 */   0xC3, 0x86, 0xAF, 0x01, 0xEC, 0x5E, 0xE0, 0x30,
                /* 1818 */   0xF7, 0x08, 0x50, 0x81, 0x7A, 0x78, 0xF0, 0xD5,
                /* 1820 */   0xDE, 0x23, 0x40, 0x71, 0xB2, 0xF4, 0xA1, 0xC1,
                /* 1828 */   0x03, 0xB5, 0xAA, 0x33, 0x26, 0x94, 0x23, 0x26,
                /* 1830 */   0x87, 0x8A, 0xC6, 0xC0, 0xFC, 0xFF, 0xBF, 0x5D,
                /* 1838 */   0xB2, 0x9B, 0x04, 0xDC, 0x3C, 0xB3, 0x40, 0x25,
                /* 1840 */   0xB9, 0x49, 0x40, 0x87, 0xE9, 0xF2, 0x32, 0x43,
                /* 1848 */   0xE7, 0x7F, 0xE0, 0xBE, 0xD5, 0x79, 0x84, 0x3E,
                /* 1850 */   0x44, 0x30, 0x94, 0xF7, 0x3C, 0x9F, 0xC2, 0xF8,
                /* 1858 */   0x19, 0xC2, 0x07, 0x4C, 0x76, 0xA6, 0xE0, 0x67,
                /* 1860 */   0x4D, 0xDC, 0x1D, 0xC0, 0x28, 0x6F, 0x9E, 0x9E,
                /* 1868 */   0x00, 0x3B, 0x7F, 0x1A, 0xF9, 0xDD, 0xE0, 0x5D,
                /* 1870 */   0xC0, 0xD3, 0xF7, 0xBD, 0x88, 0x9F, 0x28, 0xC0,
                /* 1878 */   0x17, 0xEC, 0x4E, 0x07, 0x05, 0xFA, 0x84, 0x3C,
                /* 1880 */   0x22, 0xA3, 0xFA, 0x88, 0xC0, 0x2F, 0x49, 0x60,
                /* 1888 */   0x3C, 0x92, 0xF8, 0x40, 0x01, 0x84, 0xEE, 0x05,
                /* 1890 */   0xA8, 0xD3, 0x07, 0x3F, 0x3C, 0xFB, 0x82, 0x6A,
                /* 1898 */   0xCC, 0x77, 0xAB, 0x47, 0x38, 0x4F, 0x0E, 0x73,
                /* 18A0 */   0x39, 0x60, 0x71, 0xAE, 0x49, 0xA0, 0xFA, 0xFF,
                /* 18A8 */   0x1F, 0x77, 0xF9, 0xE8, 0xE0, 0x5E, 0x5B, 0xF1,
                /* 18B0 */   0x83, 0x7B, 0x67, 0x79, 0xE7, 0x33, 0x94, 0x07,
                /* 18B8 */   0x09, 0xBE, 0x6B, 0x2B, 0x38, 0xAE, 0x6A, 0x30,
                /* 18C0 */   0x8E, 0x2D, 0xFC, 0x92, 0x07, 0xD8, 0x19, 0x16,
                /* 18C8 */   0x17, 0xFC, 0xF7, 0x30, 0x10, 0x95, 0x08, 0x83,
                /* 18D0 */   0x22, 0xB0, 0xBC, 0x7B, 0x2B, 0x85, 0x3F, 0x64,
                /* 18D8 */   0x30, 0xDE, 0x14, 0xF8, 0xA4, 0xB1, 0xA3, 0x06,
                /* 18E0 */   0xFB, 0xFF, 0x7F, 0xD4, 0xC0, 0x6F, 0xA8, 0xB8,
                /* 18E8 */   0x9B, 0x22, 0x58, 0xA7, 0x8A, 0x19, 0x02, 0x0F,
                /* 18F0 */   0xF6, 0x00, 0xF0, 0xF9, 0xCA, 0x67, 0x00, 0x45,
                /* 18F8 */   0x81, 0x41, 0x1D, 0xDA, 0xE1, 0xDC, 0x86, 0x01,
                /* 1900 */   0x07, 0x23, 0xC6, 0x5D, 0x0A, 0xE1, 0x4E, 0xF9,
                /* 1908 */   0x1D, 0x25, 0xF6, 0x73, 0x39, 0x9B, 0x2E, 0xEE,
                /* 1910 */   0x6A, 0xEE, 0xD3, 0x09, 0xBB, 0x20, 0xC3, 0x38,
                /* 1918 */   0x0B, 0x3C, 0x02, 0xBC, 0x9A, 0xF3, 0x0B, 0xF2,
                /* 1920 */   0x0B, 0xF1, 0x0B, 0xC1, 0x1B, 0xB2, 0x6F, 0x4A,
                /* 1928 */   0xCF, 0x06, 0x2F, 0x3B, 0x31, 0xDE, 0x8D, 0x7D,
                /* 1930 */   0x4A, 0xF6, 0x79, 0xE7, 0x05, 0xD9, 0x18, 0x47,
                /* 1938 */   0x13, 0x31, 0xCA, 0xB9, 0x3D, 0x0C, 0xBC, 0x26,
                /* 1940 */   0x1B, 0xE5, 0xFD, 0xE4, 0xFF, 0xFF, 0x42, 0x10,
                /* 1948 */   0x31, 0x9A, 0x21, 0x82, 0xC6, 0x08, 0xF4, 0xBE,
                /* 1950 */   0x6C, 0xBC, 0x17, 0x64, 0x26, 0xF0, 0xAD, 0xA0,
                /* 1958 */   0x83, 0x8B, 0x2F, 0xC8, 0x00, 0x3F, 0x4E, 0x46,
                /* 1960 */   0x80, 0xBB, 0xFF, 0xFF, 0x19, 0x00, 0xCE, 0x89,
                /* 1968 */   0x03, 0x77, 0xA9, 0x06, 0xDF, 0xC9, 0x06, 0x70,
                /* 1970 */   0x36, 0x74, 0x9F, 0x6C, 0xC0, 0x3D, 0x5A, 0x78,
                /* 1978 */   0x47, 0x13, 0xC4, 0xC9, 0x86, 0x02, 0x39, 0xF8,
                /* 1980 */   0xBA, 0x28, 0x1C, 0x0F, 0x7D, 0x12, 0xA1, 0x47,
                /* 1988 */   0x27, 0x1F, 0x25, 0x71, 0x67, 0x06, 0x4F, 0xE4,
                /* 1990 */   0x9D, 0xC5, 0xA3, 0x78, 0x19, 0xF4, 0xBD, 0xE0,
                /* 1998 */   0x44, 0x5E, 0x1F, 0x2C, 0xE7, 0x18, 0x09, 0xAA,
                /* 19A0 */   0x91, 0xF8, 0xF8, 0x00, 0xFF, 0xFF, 0x7F, 0x7D,
                /* 19A8 */   0xF1, 0x31, 0x12, 0x3E, 0x9F, 0x7F, 0x58, 0x1E,
                /* 19B0 */   0x8C, 0x21, 0x7D, 0x8A, 0xE4, 0x20, 0xCF, 0x2E,
                /* 19B8 */   0x8F, 0x21, 0xFC, 0x02, 0x09, 0xF7, 0x34, 0x73,
                /* 19C0 */   0x00, 0x18, 0x59, 0x97, 0x47, 0xF4, 0xD9, 0x91,
                /* 19C8 */   0x63, 0xC4, 0xF5, 0x45, 0xD1, 0x57, 0x60, 0x1F,
                /* 19D0 */   0x04, 0xCE, 0xE7, 0x39, 0x11, 0xAC, 0xA3, 0xE6,
                /* 19D8 */   0x47, 0x1B, 0x3E, 0x7E, 0x0E, 0xFE, 0x56, 0xF0,
                /* 19E0 */   0x40, 0xE9, 0x63, 0x51, 0x88, 0x47, 0x24, 0x7E,
                /* 19E8 */   0x4E, 0x04, 0x97, 0x89, 0x73, 0x22, 0x90, 0x38,
                /* 19F0 */   0xF4, 0xC2, 0x38, 0x2D, 0xE0, 0x06, 0xE2, 0x33,
                /* 19F8 */   0x25, 0x76, 0xCA, 0x27, 0xC2, 0xCE, 0x25, 0x98,
                /* 1A00 */   0xD1, 0x81, 0xEB, 0x72, 0xEF, 0xD1, 0xC1, 0xFF,
                /* 1A08 */   0xFF, 0x9F, 0x04, 0xC0, 0x87, 0xF5, 0x78, 0x07,
                /* 1A10 */   0xBE, 0x93, 0xBA, 0xEF, 0x26, 0xBE, 0xC8, 0xF8,
                /* 1A18 */   0x50, 0xF4, 0x7C, 0x07, 0xF8, 0x0F, 0x77, 0xB8,
                /* 1A20 */   0x43, 0xC5, 0x39, 0xDF, 0x01, 0x0A, 0xFE, 0xFF,
                /* 1A28 */   0xE7, 0x3B, 0xC0, 0xCB, 0xD9, 0xFA, 0xF9, 0x0E,
                /* 1A30 */   0xEC, 0x22, 0xCF, 0x77, 0x00, 0x4D, 0xFE, 0xFF,
                /* 1A38 */   0xE7, 0x3B, 0xC0, 0xE7, 0x19, 0x0D, 0x77, 0xBE,
                /* 1A40 */   0x03, 0xDB, 0xD1, 0x06, 0x30, 0x37, 0x8D, 0x47,
                /* 1A48 */   0x1B, 0x30, 0xFF, 0xFF, 0x87, 0x0B, 0x7F, 0x18,
                /* 1A50 */   0x5C, 0xA1, 0x4D, 0x9F, 0x1A, 0x8D, 0x5A, 0x35,
                /* 1A58 */   0x28, 0x53, 0xA3, 0x4C, 0x83, 0x5A, 0x7D, 0x2A,
                /* 1A60 */   0x35, 0x66, 0xCC, 0xD0, 0xE9, 0x46, 0x01, 0x1F,
                /* 1A68 */   0x15, 0x1A, 0x9B, 0xE5, 0x51, 0x08, 0xC4, 0x62,
                /* 1A70 */   0x5E, 0x0D, 0x02, 0x71, 0x58, 0x10, 0x1A, 0xE9,
                /* 1A78 */   0x95, 0x23, 0x10, 0x4B, 0x7E, 0xF6, 0x0B, 0xC4,
                /* 1A80 */   0x72, 0xDF, 0x0C, 0x02, 0x71, 0xC0, 0x37, 0x98,
                /* 1A88 */   0xC0, 0xC9, 0xC3, 0x4A, 0xE0, 0xE4, 0xDD, 0x20,
                /* 1A90 */   0x10, 0x47, 0x06, 0xA1, 0x42, 0x75, 0x80, 0xB0,
                /* 1A98 */   0x98, 0x20, 0x34, 0x94, 0x0F, 0x10, 0x26, 0xFD,
                /* 1AA0 */   0x91, 0x20, 0x40, 0x62, 0x04, 0x84, 0x85, 0x7B,
                /* 1AA8 */   0x7F, 0x09, 0xC4, 0xD2, 0xDE, 0x13, 0x02, 0xB1,
                /* 1AB0 */   0x10, 0x2B, 0x20, 0x2C, 0x2E, 0x08, 0x0D, 0xA7,
                /* 1AB8 */   0x05, 0x84, 0x49, 0x32, 0x03, 0xC2, 0x02, 0x81,
                /* 1AC0 */   0x50, 0xF9, 0x6A, 0x40, 0x98, 0x48, 0x37, 0x80,
                /* 1AC8 */   0x74, 0xF5, 0x02, 0x71, 0x10, 0x3D, 0x20, 0x4C,
                /* 1AD0 */   0x86, 0x1F, 0x10, 0x16, 0x1A, 0x84, 0x46, 0x7B,
                /* 1AD8 */   0x60, 0x08, 0x90, 0x18, 0x02, 0x61, 0xF1, 0x1D,
                /* 1AE0 */   0x81, 0x30, 0xF1, 0xAF, 0x22, 0x81, 0x38, 0xBF,
                /* 1AE8 */   0x25, 0x88, 0x9B, 0xD2, 0x10, 0x6B, 0x02, 0x62,
                /* 1AF0 */   0x1A, 0x3C, 0x01, 0x31, 0x45, 0x20, 0x02, 0x72,
                /* 1AF8 */   0xEC, 0xA7, 0x87, 0x80, 0xAC, 0xC1, 0x14, 0x10,
                /* 1B00 */   0x8B, 0x0E, 0x22, 0x20, 0x0B, 0x51, 0x05, 0xC4,
                /* 1B08 */   0xF2, 0xBA, 0x02, 0x62, 0xE1, 0x41, 0x04, 0xE4,
                /* 1B10 */   0xCC, 0x2F, 0x3F, 0x01, 0x59, 0xC1, 0x4B, 0xE7,
                /* 1B18 */   0x21, 0x80, 0xBD, 0x21, 0x02, 0x91, 0xE4, 0x20,
                /* 1B20 */   0x02, 0x72, 0x60, 0x5F, 0x40, 0x2C, 0x3E, 0x88,
                /* 1B28 */   0x80, 0x9C, 0xF5, 0x51, 0x28, 0x20, 0x07, 0x07,
                /* 1B30 */   0xD1, 0x20, 0xC8, 0xD7, 0x4C, 0x40, 0x4E, 0x0F,
                /* 1B38 */   0x22, 0x20, 0xF2, 0x09, 0x0A, 0x42, 0xD4, 0x7A,
                /* 1B40 */   0x03, 0x61, 0x7A, 0x1E, 0x85, 0x1A, 0x0A, 0x01,
                /* 1B48 */   0xD1, 0xFF, 0x1F, 0xC4, 0xCA, 0xD5, 0x9D, 0x63,
                /* 1B50 */   0x58, 0x0E, 0x10, 0x9A, 0x0B, 0x44, 0x60, 0x56,
                /* 1B58 */   0xE1, 0x0E, 0x88, 0xA9, 0x02, 0x11, 0x90, 0x13,
                /* 1B60 */   0x00, 0xD1, 0x54, 0x20, 0x34, 0x25, 0x18, 0xD5,
                /* 1B68 */   0x25, 0x0F, 0x88, 0x25, 0x00, 0xA1, 0xA9, 0x40,
                /* 1B70 */   0x68, 0x4A, 0x10, 0x01, 0x5A, 0x95, 0x3D, 0x20,
                /* 1B78 */   0xA6, 0x14, 0x84, 0x2A, 0x07, 0xA1, 0xE9, 0x40,
                /* 1B80 */   0xA8, 0x6C, 0x7D, 0x87, 0x05, 0x0A, 0x22, 0x20,
                /* 1B88 */   0x47, 0x07, 0xA1, 0xC2, 0xFD, 0x81, 0x30, 0xBD,
                /* 1B90 */   0x2F, 0x0D, 0x01, 0x3A, 0x1D, 0x88, 0x80, 0x9C,
                /* 1B98 */   0x18, 0x84, 0x2A, 0xF8, 0x64, 0x04, 0x21, 0x62,
                /* 1BA0 */   0x41, 0xA8, 0x82, 0x4F, 0x46, 0x50, 0xA2, 0xE5,
                /* 1BA8 */   0x65, 0x27, 0x20, 0xEB, 0x03, 0xA1, 0x7A, 0x41,
                /* 1BB0 */   0x04, 0xE6, 0x6C, 0x40, 0x34, 0x2F, 0x08, 0xCD,
                /* 1BB8 */   0x0F, 0x46, 0xB5, 0x1A, 0x05, 0x62, 0xFA, 0x41,
                /* 1BC0 */   0x68, 0x1E, 0x10, 0x81, 0x59, 0xC1, 0xF3, 0xE3,
                /* 1BC8 */   0x80, 0x19, 0x08, 0x55, 0x09, 0x22, 0x30, 0xE7,
                /* 1BD0 */   0x02, 0xA2, 0x59, 0x41, 0x68, 0x76, 0x30, 0xAA,
                /* 1BD8 */   0xFD, 0x1F, 0xA2, 0x01, 0x10, 0x10, 0x9A, 0x0F,
                /* 1BE0 */   0x44, 0x87, 0x01, 0xF2, 0x2C, 0x13, 0x90, 0x35,
                /* 1BE8 */   0x82, 0x50, 0xCD, 0x20, 0x3A, 0x1E, 0x10, 0x20,
                /* 1BF0 */   0x9A, 0x1F, 0x84, 0xEA, 0xF9, 0x9B, 0x04, 0x23,
                /* 1BF8 */   0x19, 0x40, 0x74, 0x24, 0x20, 0x20, 0x34, 0x27,
                /* 1C00 */   0x08, 0xD5, 0xF2, 0x0C, 0x0D, 0x48, 0xF4, 0x83,
                /* 1C08 */   0x08, 0xC8, 0x99, 0x40, 0x68, 0x46, 0x30, 0xAA,
                /* 1C10 */   0xF6, 0xBD, 0xA3, 0x23, 0x01, 0x01, 0xA1, 0x89,
                /* 1C18 */   0x40, 0x34, 0x44, 0xF2, 0xF6, 0x39, 0x44, 0x06,
                /* 1C20 */   0x42, 0x55, 0x82, 0x08, 0xCC, 0x1A, 0x9F, 0x2F,
                /* 1C28 */   0xFA, 0xFF, 0x83, 0x38, 0x21, 0x08, 0x4D, 0xA5,
                /* 1C30 */   0x17, 0x90, 0x25, 0x05, 0xA1, 0xC9, 0x41, 0x34,
                /* 1C38 */   0x70, 0xF2, 0x76, 0x39, 0x70, 0x06, 0x42, 0xF3,
                /* 1C40 */   0x80, 0xE8, 0xB8, 0x41, 0x80, 0xA8, 0x26, 0xC1,
                /* 1C48 */   0x03, 0xA5, 0x20, 0x1A, 0x06, 0x79, 0xD4, 0x69,
                /* 1C50 */   0x18, 0x04, 0x84, 0xE6, 0xF8, 0x60, 0x09, 0xD0,
                /* 1C58 */   0xD9, 0x40, 0x68, 0x56, 0x10, 0x1D, 0x1F, 0xC8,
                /* 1C60 */   0x53, 0x2E, 0x10, 0xD1, 0x0A, 0x42, 0xB5, 0x83,
                /* 1C68 */   0x08, 0xCC, 0x89, 0x81, 0xA8, 0x8A, 0x4F, 0x92,
                /* 1C70 */   0x86, 0x47, 0x40, 0xA8, 0x5A, 0x10, 0x01, 0x5A,
                /* 1C78 */   0xB1, 0xEA, 0x63, 0x06, 0x05, 0xA1, 0xA9, 0x9E,
                /* 1C80 */   0x71, 0x1A, 0x1E, 0x01, 0xA1, 0xC9, 0x41, 0x04,
                /* 1C88 */   0x66, 0xA5, 0xBF, 0x9C, 0x40, 0x44, 0x3D, 0x08,
                /* 1C90 */   0x4D, 0x03, 0x42, 0x53, 0x82, 0x50, 0x05, 0x0F,
                /* 1C98 */   0x2E, 0x1D, 0x35, 0x88, 0xF1, 0xE3, 0x00, 0x05,
                /* 1CA0 */   0xA1, 0x6A, 0x7F, 0x5A, 0x3A, 0x02, 0x10, 0x10,
                /* 1CA8 */   0x9A, 0x08, 0x44, 0x47, 0x00, 0xF2, 0x6E, 0xD3,
                /* 1CB0 */   0xA0, 0x08, 0x08, 0x55, 0x09, 0xA2, 0x63, 0x05,
                /* 1CB8 */   0x01, 0xA2, 0x89, 0x41, 0xA8, 0x82, 0x47, 0xD0,
                /* 1CC0 */   0x43, 0x02, 0x03, 0xD1, 0xB1, 0x81, 0x00, 0xD1,
                /* 1CC8 */   0x3C, 0x20, 0x34, 0x1F, 0x18, 0x55, 0xF4, 0x4E,
                /* 1CD0 */   0x3B, 0x04, 0x06, 0x42, 0x55, 0x83, 0x08, 0xCC,
                /* 1CD8 */   0xAA, 0x9F, 0x72, 0x3A, 0x98, 0x10, 0x10, 0x9A,
                /* 1CE0 */   0xFB, 0xE1, 0x26, 0x30, 0xF2, 0xCD, 0xD3, 0x31,
                /* 1CE8 */   0x80, 0x80, 0x08, 0xD8, 0xA9, 0x41, 0xA8, 0x0A,
                /* 1CF0 */   0xFD, 0xC7, 0x1E, 0x5A, 0x00, 0x88, 0x89, 0x07,
                /* 1CF8 */   0xD1, 0x81, 0xC5, 0x49, 0x40, 0x74, 0x34, 0x20,
                /* 1D00 */   0x60, 0x54, 0x53, 0x02, 0x30, 0x26, 0x10, 0x44,
                /* 1D08 */   0x60, 0x4E, 0x06, 0xA2, 0xFF, 0x3F, 0x98, 0xD3,
                /* 1D10 */   0x82, 0xD1, 0xE8, 0x60, 0x54, 0x7A, 0x03, 0x30,
                /* 1D18 */   0x16, 0x07, 0x44, 0x60, 0xCE, 0x06, 0x22, 0x30,
                /* 1D20 */   0x8B, 0x8B, 0x00, 0xC6, 0x04, 0x83, 0x08, 0xCC,
                /* 1D28 */   0xEA, 0x41, 0x74, 0xC8, 0x21, 0x60, 0x54, 0x4E,
                /* 1D30 */   0x05, 0x30, 0xA6, 0x0D, 0x44, 0x60, 0xD6, 0x91,
                /* 1D38 */   0xE1, 0xF8, 0x40, 0x41, 0x68, 0xBC, 0x10, 0x80,
                /* 1D40 */   0x2C, 0x2C, 0x88, 0x00, 0x2D, 0xB6, 0x04, 0x18,
                /* 1D48 */   0x8B, 0x00, 0x42, 0x83, 0x81, 0xD0, 0xA0, 0x20,
                /* 1D50 */   0x34, 0x44, 0x0B, 0x50, 0x26, 0x21, 0xC6, 0x91,
                /* 1D58 */   0x82, 0xF6, 0x00, 0x63, 0xBA, 0x41, 0x68, 0x16,
                /* 1D60 */   0x10, 0x0D, 0xC2, 0xC1, 0x40, 0x74, 0x1C, 0x22,
                /* 1D68 */   0x41, 0x8E, 0x03, 0x14, 0x84, 0x6A, 0x04, 0x11,
                /* 1D70 */   0xA0, 0x05, 0x83, 0x08, 0xD0, 0xF1, 0xC0, 0x68,
                /* 1D78 */   0x54, 0x10, 0x1A, 0x1F, 0x90, 0x6A, 0x29, 0x02,
                /* 1D80 */   0xC8, 0x92, 0x82, 0x08, 0xCC, 0xB9, 0x41, 0xA8,
                /* 1D88 */   0xBE, 0x24, 0xC3, 0xA4, 0x4D, 0x40, 0x99, 0x38,
                /* 1D90 */   0x10, 0x1D, 0xA3, 0x08, 0x88, 0xC0, 0x1C, 0x19,
                /* 1D98 */   0x84, 0x0A, 0x89, 0x02, 0xC2, 0x84, 0x81, 0xD0,
                /* 1DA0 */   0xC4, 0x20, 0x34, 0x3D, 0x08, 0x55, 0x54, 0x65,
                /* 1DA8 */   0x00, 0x4C, 0x1E, 0x88, 0x0E, 0x17, 0x04, 0x44,
                /* 1DB0 */   0x60, 0x4E, 0x08, 0x42, 0x53, 0x03, 0x52, 0x09,
                /* 1DB8 */   0x59, 0x0E, 0x5E, 0x14, 0x44, 0x60, 0x8E, 0x0B,
                /* 1DC0 */   0x42, 0x65, 0x75, 0x39, 0x2A, 0xD0, 0x30, 0xA0,
                /* 1DC8 */   0x4C, 0x13, 0x88, 0x40, 0x9D, 0x09, 0x44, 0xC7,
                /* 1DD0 */   0x0D, 0x02, 0x42, 0xF3, 0x83, 0x50, 0x3D, 0x65,
                /* 1DD8 */   0x8E, 0x22, 0x34, 0xCD, 0x91, 0x83, 0xB6, 0x39,
                /* 1DE0 */   0x00, 0xD0, 0x3A, 0x87, 0x02, 0x0A, 0x42, 0xF3,
                /* 1DE8 */   0x80, 0xE8, 0xFF, 0x7F, 0xCC, 0x20, 0x79, 0x8E,
                /* 1DF0 */   0x19, 0x14, 0x84, 0xAA, 0x04, 0xA1, 0x79, 0x40,
                /* 1DF8 */   0x04, 0x48, 0xFA, 0x00, 0x52, 0x10, 0xAA, 0x12,
                /* 1E00 */   0x84, 0xC6, 0x01, 0xA1, 0xF2, 0x02, 0x1D, 0xCD,
                /* 1E08 */   0x28, 0x88, 0x0E, 0x08, 0x04, 0x84, 0x06, 0x07,
                /* 1E10 */   0xA3, 0x82, 0x0B, 0x1D, 0x12, 0x28, 0x08, 0x0D,
                /* 1E18 */   0x05, 0x42, 0x15, 0x24, 0x02, 0x61, 0x01, 0x41,
                /* 1E20 */   0x74, 0xCA, 0x26, 0x8D, 0x80, 0x98, 0x50, 0x10,
                /* 1E28 */   0x2A, 0x1C, 0x44, 0x87, 0x34, 0x02, 0x44, 0x25,
                /* 1E30 */   0xBC, 0x51, 0x05, 0x62, 0x81, 0x20, 0x02, 0x73,
                /* 1E38 */   0x98, 0x50, 0xA7, 0x7A, 0x5A, 0xEA, 0x00, 0x47,
                /* 1E40 */   0x41, 0x68, 0xB8, 0x56, 0xA0, 0x2C, 0x30, 0x08,
                /* 1E48 */   0x15, 0x10, 0x0B, 0x84, 0x49, 0x04, 0xA1, 0x71,
                /* 1E50 */   0x40, 0x74, 0x8C, 0x20, 0xB5, 0x0E, 0x02, 0x14,
                /* 1E58 */   0x84, 0xCA, 0x04, 0xD1, 0x00, 0x08, 0x10, 0x0D,
                /* 1E60 */   0x0C, 0x42, 0x9F, 0x44, 0xC1, 0x98, 0xD4, 0x62,
                /* 1E68 */   0x20, 0x2C, 0x28, 0x08, 0x0D, 0x94, 0x0C, 0x84,
                /* 1E70 */   0xFD, 0xFF, 0x01
            })
        }

        OperationRegion (LDPT, SystemIO, 0x80, 0x01)
        Field (LDPT, ByteAcc, NoLock, Preserve)
        {
            LPDG,   8
        }

        OperationRegion (LDBP, SystemIO, 0x024C, 0x04)
        Field (LDBP, ByteAcc, NoLock, Preserve)
        {
            SLD1,   8, 
            SLD2,   8, 
            LLPD,   8, 
            LUPD,   8
        }

        Mutex (LDPS, 0x00)
        Mutex (LEXD, 0x00)
        Name (EDDA, 0x00)
        Method (ODBG, 1, NotSerialized)
        {
            Acquire (LDPS, 0xFFFF)
            Store (Arg0, LLPD) /* \_SB_.LLPD */
            Store (Arg0, LPDG) /* \_SB_.LPDG */
            Release (LDPS)
            Return (0x00)
        }

        Method (ODG1, 1, NotSerialized)
        {
            Acquire (LDPS, 0xFFFF)
            Store (Arg0, LUPD) /* \_SB_.LUPD */
            Release (LDPS)
            Return (0x00)
        }

        Method (ODGW, 1, NotSerialized)
        {
            Acquire (LDPS, 0xFFFF)
            Store (And (Arg0, 0xFF), LLPD) /* \_SB_.LLPD */
            Store (And (ShiftRight (Arg0, 0x08), 0xFF), LUPD) /* \_SB_.LUPD */
            Store (And (Arg0, 0xFF), LPDG) /* \_SB_.LPDG */
            Release (LDPS)
            Return (0x00)
        }

        Method (ODGD, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (OTBY, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (OTWD, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (OTDD, 1, NotSerialized)
        {
            Return (0x00)
        }

        Method (ISDR, 0, NotSerialized)
        {
            Return (0x00)
        }

        Method (EODB, 0, Serialized)
        {
            Acquire (LEXD, 0xFFFF)
            ODBG (EDDA)
            Release (LEXD)
        }

        Method (EODW, 0, Serialized)
        {
            Acquire (LEXD, 0xFFFF)
            ODGW (EDDA)
            Release (LEXD)
        }

        Method (EODD, 0, Serialized)
        {
            Acquire (LEXD, 0xFFFF)
            ODGD (EDDA)
            Release (LEXD)
        }
    }

    Method (\_SB.DCKD, 0, Serialized)
    {
        Store (0x01, Local0)
        If (And (GPL0, 0x2000))
        {
            Store (0x00, Local0)
        }

        Return (Local0)
    }

    Method (\_SB.HST1.ISUD, 0, Serialized)
    {
        Return (0x00)
    }

    Method (\_GPE.DKET, 0, Serialized)
    {
        If (LEqual (ICPT, 0x00))
        {
            If (\_SB.DCKD ())
            {
                Notify (\_SB.PCI0.LPCB.SIO.COM1, 0x00) // Bus Check
            }
            Else
            {
                Notify (\_SB.PCI0.LPCB.SIO.COM1, 0x01) // Device Check
            }
        }
    }

    Method (\_SB.PCI0.ACEL.ALED, 1, Serialized)
    {
        If (Arg0)
        {
            Or (GPL2, 0x02, GPL2) /* \GPL2 */
        }
        Else
        {
            And (GPL2, Not (0x02), GPL2) /* \GPL2 */
        }
    }

    Method (\_SB.GRFS, 0, Serialized)
    {
        Store (\_SB.PCI0.LPCB.EC0.KRFS (), Local0)
        Return (Local0)
    }

    Method (\_SB.HODM, 3, NotSerialized)
    {
        Return (Package (0x02)
        {
            0x03, 
            0x00
        })
    }

    Method (PPTS, 1, Serialized)
    {
        \_SB.SSMI (0x5D, 0x03, 0x00, 0x00, 0x00)
        Store (0x00, Local0)
    }

    Method (PWAK, 1, Serialized)
    {
        Notify (\_SB.PCI0.LPCB.SIO.COM1, 0x00) // Bus Check
        Notify (\_SB.PCI0.RP02, 0x00) // Bus Check
        Notify (\_SB.PCI0.EHC1, 0x00) // Bus Check
        Notify (\_SB.PCI0.EHC2, 0x00) // Bus Check
        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            \_SB.SSMI (0x5D, 0x01, 0x00, 0x00, 0x00)
            Notify (\_SB.PCI0.RP03, 0x00) // Bus Check
        }

        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
        {
            \_SB.PCI0.XHC.XWAK ()
        }

        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x03)))
        {
            If (LEqual (\WCOS (), 0x06))
            {
                If (\_SB.PCI0.RP06.NIC.LPON ())
                {
                    If (\_SB.DCKD ())
                    {
                        Notify (\_SB.PCI0.RP06.NIC, 0x00) // Bus Check
                    }
                }
            }
        }
    }

    Method (\_SB.PCI0.LPCB.PS2M._HID, 0, Serialized)  // _HID: Hardware ID
    {
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
        While (One)
        {
            Store (PRDT, _T_0) /* \_SB_.PCI0.LPCB.PS2M._HID._T_0 */
            If (LEqual (_T_0, 0x01))
            {
                Store (0x8F012E4F, Local1)
            }
            Else
            {
                If (LEqual (_T_0, 0x02))
                {
                    Store (0x8E012E4F, Local1)
                }
                Else
                {
                    If (LEqual (_T_0, 0x03))
                    {
                        Store (0x91012E4F, Local1)
                    }
                    Else
                    {
                        If (LEqual (_T_0, 0x04))
                        {
                            Store (0x8D012E4F, Local1)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x05))
                            {
                                Store (0x9B012E4F, Local1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x06))
                                {
                                    Store (0x98012E4F, Local1)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x07))
                                    {
                                        Store (0x80012E4F, Local1)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x08))
                                        {
                                            Store (0x95012E4F, Local1)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x09))
                                            {
                                                Store (0x96012E4F, Local1)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x0A))
                                                {
                                                    Store (0x97012E4F, Local1)
                                                }
                                                Else
                                                {
                                                    If (LEqual (_T_0, 0x0D))
                                                    {
                                                        Store (0x9D012E4F, Local1)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (_T_0, 0x0C))
                                                        {
                                                            Store (0x92012E4F, Local1)
                                                        }
                                                        Else
                                                        {
                                                            Store (0x65012E4F, Local1)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Break
        }

        Return (Local1)
    }

    Name (_S0, Package (0x03)  // _S0_: S0 System State
    {
        0x00, 
        0x00, 
        0x00
    })
    Name (_S3, Package (0x03)  // _S3_: S3 System State
    {
        0x05, 
        0x05, 
        0x00
    })
    Name (_S4, Package (0x03)  // _S4_: S4 System State
    {
        0x06, 
        0x06, 
        0x00
    })
    Name (_S5, Package (0x03)  // _S5_: S5 System State
    {
        0x07, 
        0x07, 
        0x00
    })
}

