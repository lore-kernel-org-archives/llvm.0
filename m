Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA7F125BD;
	Fri, 29 Dec 2023 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqZS17E0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703866589; x=1735402589;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7zR7TWcbDXWPrHuf8ejYzuowuBIJM2eWJPQj5G3tGzc=;
  b=TqZS17E0wOXehC2IL/qej3XwTru6pb4ZDi38a6aSOfC2kG22rU/sLfcZ
   F1PoroMlQZmhGafDdnnO649CNnpi8gpddLFrk2lqja+khe0lxSAgXuXA6
   NjvQM87Kp+ESP38aAtbksAqd/adAJsK1pQKPnkDfc7/ue+0J58niw1Ter
   dmiGFpJC2qOhCnXimtmt6TToE6kCzHWGcPPBUJrumJ16F6Cz/Z9IIPKJm
   TeRk1w3XQfjTWgVOblCahJwb24jMNtkXmb4X73/urEKgcJA2yWakZMTwk
   Jhz7VdKTguOmEUoqF1YHbgCy8OZP7lQwwGsbwZuEM7+RXKJFVepHALdpN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="482843293"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="482843293"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 08:16:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="1110208356"
X-IronPort-AV: E=Sophos;i="6.04,315,1695711600"; 
   d="scan'208";a="1110208356"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 29 Dec 2023 08:16:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJFX7-000HaD-0V;
	Fri, 29 Dec 2023 16:16:25 +0000
Date: Sat, 30 Dec 2023 00:16:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [intel-tdx:guest-hardening-rebased 10/35] vmlinux.o: warning:
 objtool: prepare_msrs+0x17e: stack state mismatch: cfa1=4+80 cfa2=-1+0
Message-ID: <202312300045.wSPXJgAV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Andi Kleen <ak@linux.intel.com>
CC: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

tree:   https://github.com/intel/tdx.git guest-hardening-rebased
head:   8ed649d924451f564906171d7536679c69c6bfd4
commit: 570abb767308fcf70d00a607b44618e34bc94629 [10/35] x86/tdx/paravirt: Move wrmsrl outside PARAVIRT_XXL
config: x86_64-buildonly-randconfig-004-20231229 (https://download.01.org/0day-ci/archive/20231230/202312300045.wSPXJgAV-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300045.wSPXJgAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300045.wSPXJgAV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: prepare_msrs+0x17e: stack state mismatch: cfa1=4+80 cfa2=-1+0


objdump-func vmlinux.o prepare_msrs:
0000 000000000005bd80 <prepare_msrs>:
0000    5bd80:	f3 0f 1e fa          	endbr64
0004    5bd84:	e8 00 00 00 00       	call   5bd89 <prepare_msrs+0x9>	5bd85: R_X86_64_PLT32	__fentry__-0x4
0009    5bd89:	55                   	push   %rbp
000a    5bd8a:	41 57                	push   %r15
000c    5bd8c:	41 56                	push   %r14
000e    5bd8e:	41 55                	push   %r13
0010    5bd90:	41 54                	push   %r12
0012    5bd92:	53                   	push   %rbx
0013    5bd93:	48 83 ec 18          	sub    $0x18,%rsp
0017    5bd97:	49 89 fe             	mov    %rdi,%r14
001a    5bd9a:	e8 00 00 00 00       	call   5bd9f <prepare_msrs+0x1f>	5bd9b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
001f    5bd9f:	4d 8b 2e             	mov    (%r14),%r13
0022    5bda2:	4d 8b 7e 08          	mov    0x8(%r14),%r15
0026    5bda6:	4d 8b 66 10          	mov    0x10(%r14),%r12
002a    5bdaa:	49 8b 56 18          	mov    0x18(%r14),%rdx
002e    5bdae:	41 0f b6 6e 39       	movzbl 0x39(%r14),%ebp
0033    5bdb3:	41 0f b6 5e 41       	movzbl 0x41(%r14),%ebx
0038    5bdb8:	49 8b 46 58          	mov    0x58(%r14),%rax
003c    5bdbc:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0041    5bdc1:	89 d6                	mov    %edx,%esi
0043    5bdc3:	48 c1 ea 20          	shr    $0x20,%rdx
0047    5bdc7:	bf 7a 01 00 00       	mov    $0x17a,%edi
004c    5bdcc:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5bdd2 <prepare_msrs+0x52>	5bdce: R_X86_64_PC32	pv_ops+0x4
0052    5bdd2:	48 89 e0             	mov    %rsp,%rax
0055    5bdd5:	4d 89 ee             	mov    %r13,%r14
0058    5bdd8:	49 c1 ee 20          	shr    $0x20,%r14
005c    5bddc:	48 0f ba 25 00 00 00 00 23 	btq    $0x23,0x0(%rip)        # 5bde5 <prepare_msrs+0x65>	5bde0: R_X86_64_PC32	boot_cpu_data+0x63
0065    5bde5:	72 51                	jb     5be38 <prepare_msrs+0xb8>
0067    5bde7:	48 89 c5             	mov    %rax,%rbp
006a    5bdea:	e8 00 00 00 00       	call   5bdef <prepare_msrs+0x6f>	5bdeb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
006f    5bdef:	8d 3c 9d 01 04 00 00 	lea    0x401(,%rbx,4),%edi
0076    5bdf6:	44 89 ee             	mov    %r13d,%esi
0079    5bdf9:	4c 89 f2             	mov    %r14,%rdx
007c    5bdfc:	48 89 ec             	mov    %rbp,%rsp
007f    5bdff:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5be05 <prepare_msrs+0x85>	5be01: R_X86_64_PC32	pv_ops+0x4
0085    5be05:	8d 3c 9d 02 04 00 00 	lea    0x402(,%rbx,4),%edi
008c    5be0c:	4c 89 e2             	mov    %r12,%rdx
008f    5be0f:	48 c1 ea 20          	shr    $0x20,%rdx
0093    5be13:	44 89 e6             	mov    %r12d,%esi
0096    5be16:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5be1c <prepare_msrs+0x9c>	5be18: R_X86_64_PC32	pv_ops+0x4
009c    5be1c:	8d 3c 9d 03 04 00 00 	lea    0x403(,%rbx,4),%edi
00a3    5be23:	4c 89 fa             	mov    %r15,%rdx
00a6    5be26:	48 c1 ea 20          	shr    $0x20,%rdx
00aa    5be2a:	44 89 fe             	mov    %r15d,%esi
00ad    5be2d:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5be33 <prepare_msrs+0xb3>	5be2f: R_X86_64_PC32	pv_ops+0x4
00b3    5be33:	e9 c6 00 00 00       	jmp    5befe <prepare_msrs+0x17e>
00b8    5be38:	48 89 04 24          	mov    %rax,(%rsp)
00bc    5be3c:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
00c1    5be41:	48 c1 e3 04          	shl    $0x4,%rbx
00c5    5be45:	4d 89 e7             	mov    %r12,%r15
00c8    5be48:	49 c1 ef 20          	shr    $0x20,%r15
00cc    5be4c:	45 89 ed             	mov    %r13d,%r13d
00cf    5be4f:	45 89 e4             	mov    %r12d,%r12d
00d2    5be52:	40 80 fd 02          	cmp    $0x2,%bpl
00d6    5be56:	75 36                	jne    5be8e <prepare_msrs+0x10e>
00d8    5be58:	e8 00 00 00 00       	call   5be5d <prepare_msrs+0xdd>	5be59: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00dd    5be5d:	b8 08 20 00 c0       	mov    $0xc0002008,%eax
00e2    5be62:	48 89 df             	mov    %rbx,%rdi
00e5    5be65:	48 09 c7             	or     %rax,%rdi
00e8    5be68:	4c 89 ee             	mov    %r13,%rsi
00eb    5be6b:	4c 89 f2             	mov    %r14,%rdx
00ee    5be6e:	48 8b 24 24          	mov    (%rsp),%rsp
00f2    5be72:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5be78 <prepare_msrs+0xf8>	5be74: R_X86_64_PC32	pv_ops+0x4
00f8    5be78:	89 df                	mov    %ebx,%edi
00fa    5be7a:	81 cf 09 20 00 c0    	or     $0xc0002009,%edi
0100    5be80:	4c 89 e6             	mov    %r12,%rsi
0103    5be83:	4c 89 fa             	mov    %r15,%rdx
0106    5be86:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5be8c <prepare_msrs+0x10c>	5be88: R_X86_64_PC32	pv_ops+0x4
010c    5be8c:	eb 31                	jmp    5bebf <prepare_msrs+0x13f>
010e    5be8e:	e8 00 00 00 00       	call   5be93 <prepare_msrs+0x113>	5be8f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0113    5be93:	89 df                	mov    %ebx,%edi
0115    5be95:	81 cf 01 20 00 c0    	or     $0xc0002001,%edi
011b    5be9b:	4c 89 ee             	mov    %r13,%rsi
011e    5be9e:	4c 89 f2             	mov    %r14,%rdx
0121    5bea1:	48 8b 24 24          	mov    (%rsp),%rsp
0125    5bea5:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5beab <prepare_msrs+0x12b>	5bea7: R_X86_64_PC32	pv_ops+0x4
012b    5beab:	89 df                	mov    %ebx,%edi
012d    5bead:	81 cf 02 20 00 c0    	or     $0xc0002002,%edi
0133    5beb3:	4c 89 e6             	mov    %r12,%rsi
0136    5beb6:	4c 89 fa             	mov    %r15,%rdx
0139    5beb9:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5bebf <prepare_msrs+0x13f>	5bebb: R_X86_64_PC32	pv_ops+0x4
013f    5bebf:	48 89 e0             	mov    %rsp,%rax
0142    5bec2:	48 89 c4             	mov    %rax,%rsp
0145    5bec5:	89 df                	mov    %ebx,%edi
0147    5bec7:	81 cf 03 20 00 c0    	or     $0xc0002003,%edi
014d    5becd:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
0152    5bed2:	48 89 c2             	mov    %rax,%rdx
0155    5bed5:	48 c1 ea 20          	shr    $0x20,%rdx
0159    5bed9:	89 c6                	mov    %eax,%esi
015b    5bedb:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5bee1 <prepare_msrs+0x161>	5bedd: R_X86_64_PC32	pv_ops+0x4
0161    5bee1:	81 cb 06 20 00 c0    	or     $0xc0002006,%ebx
0167    5bee7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
016c    5beec:	48 89 c2             	mov    %rax,%rdx
016f    5beef:	48 c1 ea 20          	shr    $0x20,%rdx
0173    5bef3:	89 c6                	mov    %eax,%esi
0175    5bef5:	48 89 df             	mov    %rbx,%rdi
0178    5bef8:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 5befe <prepare_msrs+0x17e>	5befa: R_X86_64_PC32	pv_ops+0x4
017e    5befe:	48 89 e0             	mov    %rsp,%rax
0181    5bf01:	48 89 c4             	mov    %rax,%rsp
0184    5bf04:	48 83 c4 18          	add    $0x18,%rsp
0188    5bf08:	5b                   	pop    %rbx
0189    5bf09:	41 5c                	pop    %r12
018b    5bf0b:	41 5d                	pop    %r13
018d    5bf0d:	41 5e                	pop    %r14
018f    5bf0f:	41 5f                	pop    %r15
0191    5bf11:	5d                   	pop    %rbp
0192    5bf12:	c3                   	ret
0193    5bf13:	66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
