Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E30713BC01;
	Thu, 11 Apr 2024 04:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712808910; cv=none; b=DaldUnd/6jk3cCvrKFPgsn/TZJ371vojulgPk6FYR/zGiXvqdQwB/bF3swoDAAjUo8AtV6tUPlgHBBrlSF7sSZBA5R9JqXfacbllnrr9bbKVGglh+W00byPLC7yOd5ocnAd+BjQx23JPFJcZHB3qW6qTp63poKxZpjD56qWd1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712808910; c=relaxed/simple;
	bh=cyI7oGSzPYnt3x/2f84KTC8CxRxIZ1lekTuLMHu68fk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Svh7xV3V7x18AuvWVY8O49KUMipZ7bf6LQLsyMwzZZBhPu256a/J3OlJOeDgDH1SsGCaAwVmZyfyNaxwaYORFxHw797FjMQSdZgerhDL4d6lKBJxSzTbRUZ/GYHm6/hm9wnJgCVgIFpFcENs9znqnzapwGTLFGjaQL8fWnr1YPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UJAgRFZg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJAgRFZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712808909; x=1744344909;
  h=date:from:cc:subject:message-id:mime-version;
  bh=cyI7oGSzPYnt3x/2f84KTC8CxRxIZ1lekTuLMHu68fk=;
  b=UJAgRFZg+PnCE2jG/FZReUbqQUY1qTuFgJEaCpQu4sJ0IBmBkO3D+1l/
   +SLDfoEH2K6R1o6Ly15F/YQtVcReXQejRMnvg/3H9PPHtQceVPtpruMT8
   vAM7O1/xTxdQi1fy90b5W97u8ef9BoIQSve1mf9BbBvKV0AgZGfrAhs8V
   C1rCaIGfc2O56jWgtnuNmQgsWqkN63mIho5UyV+rVgooS8HA/aKRLEtXc
   rBBNqp0mn8DRqi6DMFLHjtiIkzhFlOqDBA4Ao3gI13CviZMppZxmemjdE
   G3pV7yabC2nXyZ29zNwPDyX+EDEqHnEMq7dD1xfbfggqGtT1cSxLXTqJn
   A==;
X-CSE-ConnectionGUID: v/i5XlAbTBOO/cFtj2W6+Q==
X-CSE-MsgGUID: qhwepNTtTmC/TAfbAwrdjA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8310314"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8310314"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 21:15:07 -0700
X-CSE-ConnectionGUID: /zka5c59SDa38F0ExvuDRw==
X-CSE-MsgGUID: Y2nHXT0sSmiYf8KTo7kx7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="25259612"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Apr 2024 21:15:05 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rulq3-0008Co-0L;
	Thu, 11 Apr 2024 04:15:03 +0000
Date: Thu, 11 Apr 2024 12:15:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [RFC PATCH v3 01/10] KVM: VMX: Virtualize Intel IA32_SPEC_CTRL
Message-ID: <202404111234.ubrDd2tE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20240410143446.797262-2-chao.gao@intel.com>
References: <20240410143446.797262-2-chao.gao@intel.com>
TO: Chao Gao <chao.gao@intel.com>

Hi Chao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 2c71fdf02a95b3dd425b42f28fd47fb2b1d22702]

url:    https://github.com/intel-lab-lkp/linux/commits/Chao-Gao/KVM-VMX-Virtualize-Intel-IA32_SPEC_CTRL/20240410-224015
base:   2c71fdf02a95b3dd425b42f28fd47fb2b1d22702
patch link:    https://lore.kernel.org/r/20240410143446.797262-2-chao.gao%40intel.com
patch subject: [RFC PATCH v3 01/10] KVM: VMX: Virtualize Intel IA32_SPEC_CTRL
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240411/202404111234.ubrDd2tE-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240411/202404111234.ubrDd2tE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404111234.ubrDd2tE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0x7738: stack state mismatch: cfa1=4+376 cfa2=4+368
>> vmlinux.o: warning: objtool: vmx_spec_ctrl_restore_host+0x21: call to cpu_has_spec_ctrl_shadow() leaves .noinstr.text section
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x46: relocation to !ENDBR: .text+0x3bedb4
   vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata


objdump-func vmlinux.o vmx_spec_ctrl_restore_host:
0000 0000000000001ec0 <vmx_spec_ctrl_restore_host>:
0000     1ec0:	f3 0f 1e fa          	endbr64
0004     1ec4:	41 56                	push   %r14
0006     1ec6:	53                   	push   %rbx
0007     1ec7:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # 1ecf <vmx_spec_ctrl_restore_host+0xf>	1ecb: R_X86_64_PC32	x86_spec_ctrl_current-0x4
000f     1ecf:	e9 00 00 00 00       	jmp    1ed4 <vmx_spec_ctrl_restore_host+0x14>	1ed0: R_X86_64_PLT32	.altinstr_aux+0x566
0014     1ed4:	f3 0f 1e fa          	endbr64
0018     1ed8:	49 89 fe             	mov    %rdi,%r14
001b     1edb:	40 f6 c6 02          	test   $0x2,%sil
001f     1edf:	74 47                	je     1f28 <vmx_spec_ctrl_restore_host+0x68>
0021     1ee1:	e8 00 00 00 00       	call   1ee6 <vmx_spec_ctrl_restore_host+0x26>	1ee2: R_X86_64_PLT32	.text+0x1ff87c
0026     1ee6:	84 c0                	test   %al,%al
0028     1ee8:	74 29                	je     1f13 <vmx_spec_ctrl_restore_host+0x53>
002a     1eea:	66 90                	xchg   %ax,%ax
002c     1eec:	b8 4c 20 00 00       	mov    $0x204c,%eax
0031     1ef1:	0f 78 c0             	vmread %rax,%rax
0034     1ef4:	0f 86 9d 00 00 00    	jbe    1f97 <vmx_spec_ctrl_restore_host+0xd7>
003a     1efa:	49 8b 0e             	mov    (%r14),%rcx
003d     1efd:	48 8b 91 60 a1 00 00 	mov    0xa160(%rcx),%rdx
0044     1f04:	48 f7 d2             	not    %rdx
0047     1f07:	48 21 c2             	and    %rax,%rdx
004a     1f0a:	48 0b 91 68 a1 00 00 	or     0xa168(%rcx),%rdx
0051     1f11:	eb 0e                	jmp    1f21 <vmx_spec_ctrl_restore_host+0x61>
0053     1f13:	b9 48 00 00 00       	mov    $0x48,%ecx
0058     1f18:	0f 32                	rdmsr
005a     1f1a:	48 c1 e2 20          	shl    $0x20,%rdx
005e     1f1e:	48 09 c2             	or     %rax,%rdx
0061     1f21:	49 89 96 38 1f 00 00 	mov    %rdx,0x1f38(%r14)
0068     1f28:	e9 00 00 00 00       	jmp    1f2d <vmx_spec_ctrl_restore_host+0x6d>	1f29: R_X86_64_PLT32	.altinstr_aux+0x578
006d     1f2d:	f3 0f 1e fa          	endbr64
0071     1f31:	48 89 da             	mov    %rbx,%rdx
0074     1f34:	48 c1 ea 20          	shr    $0x20,%rdx
0078     1f38:	b9 48 00 00 00       	mov    $0x48,%ecx
007d     1f3d:	89 d8                	mov    %ebx,%eax
007f     1f3f:	0f 30                	wrmsr
0081     1f41:	90                   	nop
0082     1f42:	90                   	nop
0083     1f43:	90                   	nop
0084     1f44:	f3 0f 1e fa          	endbr64
0088     1f48:	5b                   	pop    %rbx
0089     1f49:	41 5e                	pop    %r14
008b     1f4b:	31 c0                	xor    %eax,%eax
008d     1f4d:	31 c9                	xor    %ecx,%ecx
008f     1f4f:	31 ff                	xor    %edi,%edi
0091     1f51:	31 d2                	xor    %edx,%edx
0093     1f53:	31 f6                	xor    %esi,%esi
0095     1f55:	2e e9 00 00 00 00    	cs jmp 1f5b <vmx_spec_ctrl_restore_host+0x9b>	1f57: R_X86_64_PLT32	__x86_return_thunk-0x4
009b     1f5b:	f3 0f 1e fa          	endbr64
009f     1f5f:	49 39 9e 38 1f 00 00 	cmp    %rbx,0x1f38(%r14)
00a6     1f66:	74 d9                	je     1f41 <vmx_spec_ctrl_restore_host+0x81>
00a8     1f68:	eb c3                	jmp    1f2d <vmx_spec_ctrl_restore_host+0x6d>
00aa     1f6a:	f3 0f 1e fa          	endbr64
00ae     1f6e:	81 3d 00 00 00 00 09 13 00 00 	cmpl   $0x1309,0x0(%rip)        # 1f78 <vmx_spec_ctrl_restore_host+0xb8>	1f70: R_X86_64_PC32	nr_evmcs_1_fields-0x8
00b8     1f78:	72 3f                	jb     1fb9 <vmx_spec_ctrl_restore_host+0xf9>
00ba     1f7a:	0f b7 05 00 00 00 00 	movzwl 0x0(%rip),%eax        # 1f81 <vmx_spec_ctrl_restore_host+0xc1>	1f7d: R_X86_64_PC32	vmcs_field_to_evmcs_1+0x4c1c
00c1     1f81:	48 85 c0             	test   %rax,%rax
00c4     1f84:	74 33                	je     1fb9 <vmx_spec_ctrl_restore_host+0xf9>
00c6     1f86:	65 48 8b 0d 00 00 00 00 	mov    %gs:0x0(%rip),%rcx        # 1f8e <vmx_spec_ctrl_restore_host+0xce>	1f8a: R_X86_64_PC32	current_vmcs-0x4
00ce     1f8e:	48 8b 04 01          	mov    (%rcx,%rax,1),%rax
00d2     1f92:	e9 63 ff ff ff       	jmp    1efa <vmx_spec_ctrl_restore_host+0x3a>
00d7     1f97:	f3 0f 1e fa          	endbr64
00db     1f9b:	90                   	nop
00dc     1f9c:	bf 4c 20 00 00       	mov    $0x204c,%edi
00e1     1fa1:	e8 00 00 00 00       	call   1fa6 <vmx_spec_ctrl_restore_host+0xe6>	1fa2: R_X86_64_PLT32	vmread_error-0x4
00e6     1fa6:	90                   	nop
00e7     1fa7:	eb 09                	jmp    1fb2 <vmx_spec_ctrl_restore_host+0xf2>
00e9     1fa9:	f3 0f 1e fa          	endbr64
00ed     1fad:	e8 00 00 00 00       	call   1fb2 <vmx_spec_ctrl_restore_host+0xf2>	1fae: R_X86_64_PLT32	kvm_spurious_fault-0x4
00f2     1fb2:	31 c0                	xor    %eax,%eax
00f4     1fb4:	e9 41 ff ff ff       	jmp    1efa <vmx_spec_ctrl_restore_host+0x3a>
00f9     1fb9:	80 3d 00 00 00 00 00 	cmpb   $0x0,0x0(%rip)        # 1fc0 <vmx_spec_ctrl_restore_host+0x100>	1fbb: R_X86_64_PC32	.data.once+0x88
0100     1fc0:	75 f0                	jne    1fb2 <vmx_spec_ctrl_restore_host+0xf2>
0102     1fc2:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 1fc9 <vmx_spec_ctrl_restore_host+0x109>	1fc4: R_X86_64_PC32	.data.once+0x88
0109     1fc9:	90                   	nop
010a     1fca:	be 4c 20 00 00       	mov    $0x204c,%esi
010f     1fcf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1fd2: R_X86_64_32S	.rodata.str1.1+0xb59591
0116     1fd6:	e8 00 00 00 00       	call   1fdb <vmx_spec_ctrl_restore_host+0x11b>	1fd7: R_X86_64_PLT32	__warn_printk-0x4
011b     1fdb:	90                   	nop
011c     1fdc:	0f 0b                	ud2
011e     1fde:	90                   	nop
011f     1fdf:	90                   	nop
0120     1fe0:	eb d0                	jmp    1fb2 <vmx_spec_ctrl_restore_host+0xf2>
0122     1fe2:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0131     1ff1:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0140     2000:	90                   	nop
0141     2001:	90                   	nop
0142     2002:	90                   	nop
0143     2003:	90                   	nop
0144     2004:	90                   	nop
0145     2005:	90                   	nop
0146     2006:	90                   	nop
0147     2007:	90                   	nop
0148     2008:	90                   	nop
0149     2009:	90                   	nop
014a     200a:	90                   	nop
014b     200b:	90                   	nop
014c     200c:	90                   	nop
014d     200d:	90                   	nop
014e     200e:	90                   	nop
014f     200f:	90                   	nop
0150     2010:	90                   	nop
0151     2011:	90                   	nop
0152     2012:	90                   	nop
0153     2013:	90                   	nop
0154     2014:	90                   	nop
0155     2015:	90                   	nop
0156     2016:	90                   	nop
0157     2017:	90                   	nop
0158     2018:	90                   	nop
0159     2019:	90                   	nop
015a     201a:	90                   	nop
015b     201b:	90                   	nop
015c     201c:	90                   	nop
015d     201d:	90                   	nop
015e     201e:	90                   	nop
015f     201f:	90                   	nop
0160     2020:	90                   	nop
0161     2021:	90                   	nop
0162     2022:	90                   	nop
0163     2023:	90                   	nop
0164     2024:	90                   	nop
0165     2025:	90                   	nop
0166     2026:	90                   	nop
0167     2027:	90                   	nop
0168     2028:	90                   	nop
0169     2029:	90                   	nop
016a     202a:	90                   	nop
016b     202b:	90                   	nop
016c     202c:	90                   	nop
016d     202d:	90                   	nop
016e     202e:	90                   	nop
016f     202f:	90                   	nop
0170     2030:	90                   	nop
0171     2031:	90                   	nop
0172     2032:	90                   	nop
0173     2033:	90                   	nop
0174     2034:	90                   	nop
0175     2035:	90                   	nop
0176     2036:	90                   	nop
0177     2037:	90                   	nop
0178     2038:	90                   	nop
0179     2039:	90                   	nop
017a     203a:	90                   	nop
017b     203b:	90                   	nop
017c     203c:	90                   	nop
017d     203d:	90                   	nop
017e     203e:	90                   	nop
017f     203f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
