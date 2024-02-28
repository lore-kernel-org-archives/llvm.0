Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4485713D2E0;
	Wed, 28 Feb 2024 23:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709162324; cv=none; b=hs37f1cWhdmOaWBidN9M3Mdyu1Ko7ny9E3F3i7/rtHoLvqYWLekarDvDqmQ5avC/CQ+mzbiP5/D4ZsJG4J0OCxOy8qhfXtVAf6MQ7evlhNpzO66DFKhHA6n+19/Y5WW5vmNMyeiCkI4Aglz9W1gWkNCWMlDOrGNh6xmY7Dtx+HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709162324; c=relaxed/simple;
	bh=0QuoyCcebQN8iX2Qs7bIgvX6UGw8gqREbf96xp4gwYs=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VS/kyQhyHIahC8D1xCBFZH7u3M27q+gtITHth9X/msRdNdz06DEIfmWFcjEec3c+b3AuAi7MEj4XAdKbqWkywyHuC/AeV4ieC3pWNT8TJs0Lozk7yu3QgzvwNdxWnvcdCAN3AB4Wx8RrShMD6KSDsJuPLV1l7JGg04/rJpVOMRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ar511jz8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ar511jz8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709162322; x=1740698322;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0QuoyCcebQN8iX2Qs7bIgvX6UGw8gqREbf96xp4gwYs=;
  b=Ar511jz8EwHw3tKwFFi+M14SMEijij0jCynriN71hEeriW2wsRCrgC44
   NSHsPw6a3RX7Ub+CFQAk5j2NexvprnBYIi/vHTVVNl3zh7hDmy+S1SAdb
   4tTqp/KXoV6sbpbgsyHXDcDr5cyA4uszbulwm3iY/jTVw+tiDe1Cj+6tO
   BeTZr/dalRb1ILJeFZ0XSS5SFeDfxa2iJfZWAy0SAsQr+r0cYCUCOf3vd
   mv6X9HJ+JofoHwiWvQPZyCU+yjm66gyjGjeYv6ZiB6k85t12rLs0T5TPL
   cjzFh/OEK4SbTn3U6jRKFBY4jzk33itIa4v/qeplg/RQ/avab94aOIk5J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="29035229"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="29035229"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 15:18:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="7718963"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Feb 2024 15:18:40 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfTCA-000CTH-0I;
	Wed, 28 Feb 2024 23:18:38 +0000
Date: Thu, 29 Feb 2024 07:18:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [sean-jc:svm/vmenter_stack_frames 16/19] vmlinux.o: warning:
 objtool: svm_vcpu_enter_exit+0xb4: call to sev_es_host_save_area() leaves
 .noinstr.text section
Message-ID: <202402290737.kR9Co3cD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux svm/vmenter_stack_frames
head:   73fb663774f64f20e9c282ced1ab44370fb2b25a
commit: 71ec1d1e5278b1b8496e3ffffcae945c1544d5de [16/19] KVM: SVM: Save/restore non-volatile GPRs in SEV-ES VMRUN via host save area
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240229/202402290737.kR9Co3cD-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290737.kR9Co3cD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290737.kR9Co3cD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: balance_leaf+0x7738: stack state mismatch: cfa1=4+376 cfa2=4+368
>> vmlinux.o: warning: objtool: svm_vcpu_enter_exit+0xb4: call to sev_es_host_save_area() leaves .noinstr.text section
   vmlinux.o: warning: objtool: set_ftrace_ops_ro+0x46: relocation to !ENDBR: .text+0x3b0a38
   vmlinux.o: warning: objtool: bad call to elf_init_reloc_text_sym() for data symbol .rodata


objdump-func vmlinux.o svm_vcpu_enter_exit:
0000 0000000000001b00 <svm_vcpu_enter_exit>:
0000     1b00:	55                   	push   %rbp
0001     1b01:	41 57                	push   %r15
0003     1b03:	41 56                	push   %r14
0005     1b05:	41 55                	push   %r13
0007     1b07:	41 54                	push   %r12
0009     1b09:	53                   	push   %rbx
000a     1b0a:	89 f5                	mov    %esi,%ebp
000c     1b0c:	48 89 fb             	mov    %rdi,%rbx
000f     1b0f:	4c 63 77 20          	movslq 0x20(%rdi),%r14
0013     1b13:	49 81 fe 00 20 00 00 	cmp    $0x2000,%r14
001a     1b1a:	73 5b                	jae    1b77 <svm_vcpu_enter_exit+0x77>
001c     1b1c:	49 c7 c7 00 00 00 00 	mov    $0x0,%r15	1b1f: R_X86_64_32S	svm_data
0023     1b23:	4e 03 3c f5 00 00 00 00 	add    0x0(,%r14,8),%r15	1b27: R_X86_64_32S	__per_cpu_offset
002b     1b2b:	90                   	nop
002c     1b2c:	e8 00 00 00 00       	call   1b31 <svm_vcpu_enter_exit+0x31>	1b2d: R_X86_64_PLT32	trace_hardirqs_on_prepare-0x4
0031     1b31:	e8 00 00 00 00       	call   1b36 <svm_vcpu_enter_exit+0x36>	1b32: R_X86_64_PLT32	lockdep_hardirqs_on_prepare-0x4
0036     1b36:	90                   	nop
0037     1b37:	90                   	nop
0038     1b38:	31 ff                	xor    %edi,%edi
003a     1b3a:	e8 00 00 00 00       	call   1b3f <svm_vcpu_enter_exit+0x3f>	1b3b: R_X86_64_PLT32	rcu_note_context_switch-0x4
003f     1b3f:	90                   	nop
0040     1b40:	4c 8b 74 24 30       	mov    0x30(%rsp),%r14
0045     1b45:	4c 89 f7             	mov    %r14,%rdi
0048     1b48:	e8 00 00 00 00       	call   1b4d <svm_vcpu_enter_exit+0x4d>	1b49: R_X86_64_PLT32	lockdep_hardirqs_on-0x4
004d     1b4d:	e8 00 00 00 00       	call   1b52 <svm_vcpu_enter_exit+0x52>	1b4e: R_X86_64_PLT32	amd_clear_divider-0x4
0052     1b52:	4c 8b 2b             	mov    (%rbx),%r13
0055     1b55:	45 0f b6 a5 b9 a5 00 00 	movzbl 0xa5b9(%r13),%r12d
005d     1b5d:	49 83 fc 02          	cmp    $0x2,%r12
0061     1b61:	73 25                	jae    1b88 <svm_vcpu_enter_exit+0x88>
0063     1b63:	41 f6 c4 01          	test   $0x1,%r12b
0067     1b67:	75 34                	jne    1b9d <svm_vcpu_enter_exit+0x9d>
0069     1b69:	40 0f b6 f5          	movzbl %bpl,%esi
006d     1b6d:	48 89 df             	mov    %rbx,%rdi
0070     1b70:	e8 00 00 00 00       	call   1b75 <svm_vcpu_enter_exit+0x75>	1b71: R_X86_64_PLT32	__svm_vcpu_run-0x4
0075     1b75:	eb 51                	jmp    1bc8 <svm_vcpu_enter_exit+0xc8>
0077     1b77:	44 89 f6             	mov    %r14d,%esi
007a     1b7a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1b7d: R_X86_64_32S	.data+0x4fdd0
0081     1b81:	e8 00 00 00 00       	call   1b86 <svm_vcpu_enter_exit+0x86>	1b82: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0086     1b86:	eb 94                	jmp    1b1c <svm_vcpu_enter_exit+0x1c>
0088     1b88:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1b8b: R_X86_64_32S	.data+0x4f470
008f     1b8f:	4c 89 e6             	mov    %r12,%rsi
0092     1b92:	e8 00 00 00 00       	call   1b97 <svm_vcpu_enter_exit+0x97>	1b93: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
0097     1b97:	41 f6 c4 01          	test   $0x1,%r12b
009b     1b9b:	74 cc                	je     1b69 <svm_vcpu_enter_exit+0x69>
009d     1b9d:	45 0f b6 a5 b8 a5 00 00 	movzbl 0xa5b8(%r13),%r12d
00a5     1ba5:	49 83 fc 02          	cmp    $0x2,%r12
00a9     1ba9:	73 44                	jae    1bef <svm_vcpu_enter_exit+0xef>
00ab     1bab:	41 f6 c4 01          	test   $0x1,%r12b
00af     1baf:	74 53                	je     1c04 <svm_vcpu_enter_exit+0x104>
00b1     1bb1:	4c 89 ff             	mov    %r15,%rdi
00b4     1bb4:	e8 00 00 00 00       	call   1bb9 <svm_vcpu_enter_exit+0xb9>	1bb5: R_X86_64_PLT32	.text+0x27733c
00b9     1bb9:	40 0f b6 f5          	movzbl %bpl,%esi
00bd     1bbd:	48 89 df             	mov    %rbx,%rdi
00c0     1bc0:	48 89 c2             	mov    %rax,%rdx
00c3     1bc3:	e8 00 00 00 00       	call   1bc8 <svm_vcpu_enter_exit+0xc8>	1bc4: R_X86_64_PLT32	__svm_sev_es_vcpu_run-0x4
00c8     1bc8:	4c 89 f7             	mov    %r14,%rdi
00cb     1bcb:	e8 00 00 00 00       	call   1bd0 <svm_vcpu_enter_exit+0xd0>	1bcc: R_X86_64_PLT32	lockdep_hardirqs_off-0x4
00d0     1bd0:	90                   	nop
00d1     1bd1:	e8 00 00 00 00       	call   1bd6 <svm_vcpu_enter_exit+0xd6>	1bd2: R_X86_64_PLT32	trace_hardirqs_off_finish-0x4
00d6     1bd6:	90                   	nop
00d7     1bd7:	5b                   	pop    %rbx
00d8     1bd8:	41 5c                	pop    %r12
00da     1bda:	41 5d                	pop    %r13
00dc     1bdc:	41 5e                	pop    %r14
00de     1bde:	41 5f                	pop    %r15
00e0     1be0:	5d                   	pop    %rbp
00e1     1be1:	31 c0                	xor    %eax,%eax
00e3     1be3:	31 ff                	xor    %edi,%edi
00e5     1be5:	31 d2                	xor    %edx,%edx
00e7     1be7:	31 f6                	xor    %esi,%esi
00e9     1be9:	2e e9 00 00 00 00    	cs jmp 1bef <svm_vcpu_enter_exit+0xef>	1beb: R_X86_64_PLT32	__x86_return_thunk-0x4
00ef     1bef:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1bf2: R_X86_64_32S	.data+0x4f490
00f6     1bf6:	4c 89 e6             	mov    %r12,%rsi
00f9     1bf9:	e8 00 00 00 00       	call   1bfe <svm_vcpu_enter_exit+0xfe>	1bfa: R_X86_64_PLT32	__ubsan_handle_load_invalid_value-0x4
00fe     1bfe:	41 f6 c4 01          	test   $0x1,%r12b
0102     1c02:	75 ad                	jne    1bb1 <svm_vcpu_enter_exit+0xb1>
0104     1c04:	90                   	nop
0105     1c05:	0f 0b                	ud2
0107     1c07:	90                   	nop
0108     1c08:	e9 5c ff ff ff       	jmp    1b69 <svm_vcpu_enter_exit+0x69>
010d     1c0d:	cc                   	int3
010e     1c0e:	cc                   	int3
010f     1c0f:	cc                   	int3
0110     1c10:	cc                   	int3
0111     1c11:	cc                   	int3
0112     1c12:	cc                   	int3
0113     1c13:	cc                   	int3
0114     1c14:	cc                   	int3
0115     1c15:	cc                   	int3
0116     1c16:	cc                   	int3
0117     1c17:	cc                   	int3
0118     1c18:	cc                   	int3
0119     1c19:	cc                   	int3
011a     1c1a:	cc                   	int3
011b     1c1b:	cc                   	int3
011c     1c1c:	cc                   	int3
011d     1c1d:	cc                   	int3
011e     1c1e:	cc                   	int3
011f     1c1f:	cc                   	int3
0120     1c20:	cc                   	int3
0121     1c21:	cc                   	int3
0122     1c22:	cc                   	int3
0123     1c23:	cc                   	int3
0124     1c24:	cc                   	int3
0125     1c25:	cc                   	int3
0126     1c26:	cc                   	int3
0127     1c27:	cc                   	int3
0128     1c28:	cc                   	int3
0129     1c29:	cc                   	int3
012a     1c2a:	cc                   	int3
012b     1c2b:	cc                   	int3
012c     1c2c:	cc                   	int3
012d     1c2d:	cc                   	int3
012e     1c2e:	cc                   	int3
012f     1c2f:	cc                   	int3
0130     1c30:	cc                   	int3
0131     1c31:	cc                   	int3
0132     1c32:	cc                   	int3
0133     1c33:	cc                   	int3
0134     1c34:	cc                   	int3
0135     1c35:	cc                   	int3
0136     1c36:	cc                   	int3
0137     1c37:	cc                   	int3
0138     1c38:	cc                   	int3
0139     1c39:	cc                   	int3
013a     1c3a:	cc                   	int3
013b     1c3b:	cc                   	int3
013c     1c3c:	cc                   	int3
013d     1c3d:	cc                   	int3
013e     1c3e:	cc                   	int3
013f     1c3f:	cc                   	int3
0140     1c40:	90                   	nop
0141     1c41:	90                   	nop
0142     1c42:	90                   	nop
0143     1c43:	90                   	nop
0144     1c44:	90                   	nop
0145     1c45:	90                   	nop
0146     1c46:	90                   	nop
0147     1c47:	90                   	nop
0148     1c48:	90                   	nop
0149     1c49:	90                   	nop
014a     1c4a:	90                   	nop
014b     1c4b:	90                   	nop
014c     1c4c:	90                   	nop
014d     1c4d:	90                   	nop
014e     1c4e:	90                   	nop
014f     1c4f:	90                   	nop
0150     1c50:	90                   	nop
0151     1c51:	90                   	nop
0152     1c52:	90                   	nop
0153     1c53:	90                   	nop
0154     1c54:	90                   	nop
0155     1c55:	90                   	nop
0156     1c56:	90                   	nop
0157     1c57:	90                   	nop
0158     1c58:	90                   	nop
0159     1c59:	90                   	nop
015a     1c5a:	90                   	nop
015b     1c5b:	90                   	nop
015c     1c5c:	90                   	nop
015d     1c5d:	90                   	nop
015e     1c5e:	90                   	nop
015f     1c5f:	90                   	nop
0160     1c60:	90                   	nop
0161     1c61:	90                   	nop
0162     1c62:	90                   	nop
0163     1c63:	90                   	nop
0164     1c64:	90                   	nop
0165     1c65:	90                   	nop
0166     1c66:	90                   	nop
0167     1c67:	90                   	nop
0168     1c68:	90                   	nop
0169     1c69:	90                   	nop
016a     1c6a:	90                   	nop
016b     1c6b:	90                   	nop
016c     1c6c:	90                   	nop
016d     1c6d:	90                   	nop
016e     1c6e:	90                   	nop
016f     1c6f:	90                   	nop
0170     1c70:	90                   	nop
0171     1c71:	90                   	nop
0172     1c72:	90                   	nop
0173     1c73:	90                   	nop
0174     1c74:	90                   	nop
0175     1c75:	90                   	nop
0176     1c76:	90                   	nop
0177     1c77:	90                   	nop
0178     1c78:	90                   	nop
0179     1c79:	90                   	nop
017a     1c7a:	90                   	nop
017b     1c7b:	90                   	nop
017c     1c7c:	90                   	nop
017d     1c7d:	90                   	nop
017e     1c7e:	90                   	nop
017f     1c7f:	90                   	nop

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
