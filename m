Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2421BA3E;
	Tue,  4 Apr 2023 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680620254; x=1712156254;
  h=date:from:cc:subject:message-id:mime-version;
  bh=yWrLYoCuJ43aMRQd3KgsKtuwElIijy9lTlo6yPYvl+8=;
  b=eqbf6sOIE3rh7hoDrgKoAyPo2JMJJiPc2s+TvQuMVlNgLmSEmazEHa4A
   Uh32AnePhoBC8ro2c9tL31NdQuR54moTUOaSzBU662fY4ntp659jcceC8
   nzzDotnOljka0LSKb/eWgXVvUss0ecDsCTpTa29JMFIdtm4sX/qzZR1P0
   qbHGLVGrAnSi1vrHtaXQM/mvonzmTl7Z3F7gfNooyjsgbS1krwFT350Og
   /MrjQvtylsfgLIuvYNdSRTCznWxByxbe9iisSoHgFCP7UTg6ZEwjlGuBD
   /WV27FblUW7PF4hpLMXMI84PLMTziWYEQP4Kf48gHcfYlqApXEOvQT6FV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428492300"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="428492300"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 07:57:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="860627186"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="860627186"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 04 Apr 2023 07:57:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pji6E-000PoA-1K;
	Tue, 04 Apr 2023 14:57:30 +0000
Date: Tue, 4 Apr 2023 22:56:31 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 3241/9999] mm/vmscan.o: warning: objtool:
 shrink_lruvec()+0xa4b: sibling call from callable instruction with modified
 stack frame
Message-ID: <202304042248.8600c0vw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Borislav Petkov <bp@suse.de>
CC: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   c957cbb8731536ddc9a01e4c1cd51eab6558aa14
commit: cc3011cdbe5f834b0e9873b841d1be02be9a1524 [3241/9999] x86/retbleed: Add fine grained Kconfig knobs
config: x86_64-buildonly-randconfig-r005-20230403 (https://download.01.org/0day-ci/archive/20230404/202304042248.8600c0vw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=cc3011cdbe5f834b0e9873b841d1be02be9a1524
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout cc3011cdbe5f834b0e9873b841d1be02be9a1524
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304042248.8600c0vw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_lruvec()+0xa4b: sibling call from callable instruction with modified stack frame


objdump-func vmlinux.o shrink_lruvec:
0000 00000000004058cf <shrink_lruvec>:
0000   4058cf:	e8 00 00 00 00       	call   4058d4 <shrink_lruvec+0x5>	4058d0: R_X86_64_PLT32	__fentry__-0x4
0005   4058d4:	55                   	push   %rbp
0006   4058d5:	48 89 e5             	mov    %rsp,%rbp
0009   4058d8:	41 57                	push   %r15
000b   4058da:	41 56                	push   %r14
000d   4058dc:	41 55                	push   %r13
000f   4058de:	41 54                	push   %r12
0011   4058e0:	53                   	push   %rbx
0012   4058e1:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0016   4058e5:	48 81 ec e0 01 00 00 	sub    $0x1e0,%rsp
001d   4058ec:	48 89 f3             	mov    %rsi,%rbx
0020   4058ef:	49 89 fd             	mov    %rdi,%r13
0023   4058f2:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
002c   4058fb:	48 89 84 24 d0 01 00 00 	mov    %rax,0x1d0(%rsp)
0034   405903:	e8 00 00 00 00       	call   405908 <shrink_lruvec+0x39>	405904: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0039   405908:	48 8d bc 24 70 01 00 00 	lea    0x170(%rsp),%rdi
0041   405910:	ba 28 00 00 00       	mov    $0x28,%edx
0046   405915:	31 f6                	xor    %esi,%esi
0048   405917:	e8 00 00 00 00       	call   40591c <shrink_lruvec+0x4d>	405918: R_X86_64_PLT32	memset-0x4
004d   40591c:	48 8d bc 24 40 01 00 00 	lea    0x140(%rsp),%rdi
0055   405924:	ba 28 00 00 00       	mov    $0x28,%edx
005a   405929:	31 f6                	xor    %esi,%esi
005c   40592b:	e8 00 00 00 00       	call   405930 <shrink_lruvec+0x61>	40592c: R_X86_64_PLT32	memset-0x4
0061   405930:	48 89 df             	mov    %rbx,%rdi
0064   405933:	e8 00 00 00 00       	call   405938 <shrink_lruvec+0x69>	405934: R_X86_64_PLT32	__tsan_read8-0x4
0069   405938:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
006e   40593d:	48 8b 03             	mov    (%rbx),%rax
0071   405940:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
0079   405948:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
0081   405950:	ba 28 00 00 00       	mov    $0x28,%edx
0086   405955:	31 f6                	xor    %esi,%esi
0088   405957:	e8 00 00 00 00       	call   40595c <shrink_lruvec+0x8d>	405958: R_X86_64_PLT32	memset-0x4
008d   40595c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40595f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0094   405963:	e8 00 00 00 00       	call   405968 <shrink_lruvec+0x99>	405964: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0099   405968:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 40596e <shrink_lruvec+0x9f>	40596a: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
009f   40596e:	bf 01 00 00 00       	mov    $0x1,%edi
00a4   405973:	89 de                	mov    %ebx,%esi
00a6   405975:	e8 00 00 00 00       	call   40597a <shrink_lruvec+0xab>	405976: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00ab   40597a:	85 db                	test   %ebx,%ebx
00ad   40597c:	7e 37                	jle    4059b5 <shrink_lruvec+0xe6>
00af   40597e:	e8 00 00 00 00       	call   405983 <shrink_lruvec+0xb4>	40597f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b4   405983:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40598a <shrink_lruvec+0xbb>	405986: R_X86_64_PC32	_ftrace_branch+0x549ac
00bb   40598a:	48 ff c3             	inc    %rbx
00be   40598d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405990: R_X86_64_32S	_ftrace_branch+0x549b0
00c5   405994:	e8 00 00 00 00       	call   405999 <shrink_lruvec+0xca>	405995: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
00ca   405999:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4059a0 <shrink_lruvec+0xd1>	40599c: R_X86_64_PC32	_ftrace_branch+0x549ac
00d1   4059a0:	49 8d bd 00 04 00 00 	lea    0x400(%r13),%rdi
00d8   4059a7:	e8 00 00 00 00       	call   4059ac <shrink_lruvec+0xdd>	4059a8: R_X86_64_PLT32	__tsan_read8-0x4
00dd   4059ac:	4d 8b a5 00 04 00 00 	mov    0x400(%r13),%r12
00e4   4059b3:	eb 25                	jmp    4059da <shrink_lruvec+0x10b>
00e6   4059b5:	e8 00 00 00 00       	call   4059ba <shrink_lruvec+0xeb>	4059b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00eb   4059ba:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4059c1 <shrink_lruvec+0xf2>	4059bd: R_X86_64_PC32	_ftrace_branch+0x549b4
00f2   4059c1:	48 ff c3             	inc    %rbx
00f5   4059c4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4059c7: R_X86_64_32S	_ftrace_branch+0x549b8
00fc   4059cb:	e8 00 00 00 00       	call   4059d0 <shrink_lruvec+0x101>	4059cc: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0101   4059d0:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4059d7 <shrink_lruvec+0x108>	4059d3: R_X86_64_PC32	_ftrace_branch+0x549b4
0108   4059d7:	45 31 e4             	xor    %r12d,%r12d
010b   4059da:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4059dd: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
0112   4059e1:	e8 00 00 00 00       	call   4059e6 <shrink_lruvec+0x117>	4059e2: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0117   4059e6:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 4059ec <shrink_lruvec+0x11d>	4059e8: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
011d   4059ec:	31 ff                	xor    %edi,%edi
011f   4059ee:	89 de                	mov    %ebx,%esi
0121   4059f0:	e8 00 00 00 00       	call   4059f5 <shrink_lruvec+0x126>	4059f1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0126   4059f5:	85 db                	test   %ebx,%ebx
0128   4059f7:	0f 8e 97 1f 00 00    	jle    407994 <shrink_lruvec+0x20c5>
012e   4059fd:	e8 00 00 00 00       	call   405a02 <shrink_lruvec+0x133>	4059fe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0133   405a02:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405a09 <shrink_lruvec+0x13a>	405a05: R_X86_64_PC32	_ftrace_branch+0x549c4
013a   405a09:	48 ff c3             	inc    %rbx
013d   405a0c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405a0f: R_X86_64_32S	_ftrace_branch+0x549c8
0144   405a13:	e8 00 00 00 00       	call   405a18 <shrink_lruvec+0x149>	405a14: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0149   405a18:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405a1f <shrink_lruvec+0x150>	405a1b: R_X86_64_PC32	_ftrace_branch+0x549c4
0150   405a1f:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	405a22: R_X86_64_32S	vm_swappiness
0157   405a26:	48 89 df             	mov    %rbx,%rdi
015a   405a29:	e8 00 00 00 00       	call   405a2e <shrink_lruvec+0x15f>	405a2a: R_X86_64_PLT32	__tsan_read4-0x4
015f   405a2e:	4c 63 33             	movslq (%rbx),%r14
0162   405a31:	48 8d bc 24 a0 01 00 00 	lea    0x1a0(%rsp),%rdi
016a   405a39:	ba 10 00 00 00       	mov    $0x10,%edx
016f   405a3e:	31 f6                	xor    %esi,%esi
0171   405a40:	e8 00 00 00 00       	call   405a45 <shrink_lruvec+0x176>	405a41: R_X86_64_PLT32	memset-0x4
0176   405a45:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
017b   405a4a:	48 8d 7b 28          	lea    0x28(%rbx),%rdi
017f   405a4e:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
0184   405a53:	e8 00 00 00 00       	call   405a58 <shrink_lruvec+0x189>	405a54: R_X86_64_PLT32	__tsan_read2-0x4
0189   405a58:	0f b7 5b 28          	movzwl 0x28(%rbx),%ebx
018d   405a5c:	89 de                	mov    %ebx,%esi
018f   405a5e:	83 e6 40             	and    $0x40,%esi
0192   405a61:	31 ff                	xor    %edi,%edi
0194   405a63:	e8 00 00 00 00       	call   405a68 <shrink_lruvec+0x199>	405a64: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0199   405a68:	83 e3 40             	and    $0x40,%ebx
019c   405a6b:	4c 89 64 24 30       	mov    %r12,0x30(%rsp)
01a1   405a70:	75 0a                	jne    405a7c <shrink_lruvec+0x1ad>
01a3   405a72:	e8 00 00 00 00       	call   405a77 <shrink_lruvec+0x1a8>	405a73: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01a8   405a77:	e9 f0 02 00 00       	jmp    405d6c <shrink_lruvec+0x49d>
01ad   405a7c:	4d 85 e4             	test   %r12,%r12
01b0   405a7f:	74 68                	je     405ae9 <shrink_lruvec+0x21a>
01b2   405a81:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405a88 <shrink_lruvec+0x1b9>	405a84: R_X86_64_PC32	_ftrace_branch+0x539b4
01b9   405a88:	48 ff c3             	inc    %rbx
01bc   405a8b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405a8e: R_X86_64_32S	_ftrace_branch+0x539b8
01c3   405a92:	e8 00 00 00 00       	call   405a97 <shrink_lruvec+0x1c8>	405a93: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
01c8   405a97:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405a9e <shrink_lruvec+0x1cf>	405a9a: R_X86_64_PC32	_ftrace_branch+0x539b4
01cf   405a9e:	4c 89 e7             	mov    %r12,%rdi
01d2   405aa1:	e8 00 00 00 00       	call   405aa6 <shrink_lruvec+0x1d7>	405aa2: R_X86_64_PLT32	mem_cgroup_get_nr_swap_pages-0x4
01d7   405aa6:	49 89 c7             	mov    %rax,%r15
01da   405aa9:	31 ff                	xor    %edi,%edi
01dc   405aab:	48 89 c6             	mov    %rax,%rsi
01df   405aae:	e8 00 00 00 00       	call   405ab3 <shrink_lruvec+0x1e4>	405aaf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01e4   405ab3:	4d 85 ff             	test   %r15,%r15
01e7   405ab6:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	405ab9: R_X86_64_32S	_ftrace_branch+0x539e0
01ee   405abd:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	405ac0: R_X86_64_32S	_ftrace_branch+0x539d8
01f5   405ac4:	48 0f 4f d8          	cmovg  %rax,%rbx
01f9   405ac8:	4c 8b 23             	mov    (%rbx),%r12
01fc   405acb:	49 ff c4             	inc    %r12
01ff   405ace:	48 89 df             	mov    %rbx,%rdi
0202   405ad1:	e8 00 00 00 00       	call   405ad6 <shrink_lruvec+0x207>	405ad2: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0207   405ad6:	4c 89 23             	mov    %r12,(%rbx)
020a   405ad9:	4d 85 ff             	test   %r15,%r15
020d   405adc:	0f 8e 5a 01 00 00    	jle    405c3c <shrink_lruvec+0x36d>
0213   405ae2:	e8 00 00 00 00       	call   405ae7 <shrink_lruvec+0x218>	405ae3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0218   405ae7:	eb 6e                	jmp    405b57 <shrink_lruvec+0x288>
021a   405ae9:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405af0 <shrink_lruvec+0x221>	405aec: R_X86_64_PC32	_ftrace_branch+0x539bc
0221   405af0:	48 ff c3             	inc    %rbx
0224   405af3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405af6: R_X86_64_32S	_ftrace_branch+0x539c0
022b   405afa:	e8 00 00 00 00       	call   405aff <shrink_lruvec+0x230>	405afb: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0230   405aff:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405b06 <shrink_lruvec+0x237>	405b02: R_X86_64_PC32	_ftrace_branch+0x539bc
0237   405b06:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405b09: R_X86_64_32S	nr_swap_pages
023e   405b0d:	e8 00 00 00 00       	call   405b12 <shrink_lruvec+0x243>	405b0e: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0243   405b12:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 405b19 <shrink_lruvec+0x24a>	405b15: R_X86_64_PC32	nr_swap_pages-0x4
024a   405b19:	31 ff                	xor    %edi,%edi
024c   405b1b:	4c 89 fe             	mov    %r15,%rsi
024f   405b1e:	e8 00 00 00 00       	call   405b23 <shrink_lruvec+0x254>	405b1f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0254   405b23:	4d 85 ff             	test   %r15,%r15
0257   405b26:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	405b29: R_X86_64_32S	_ftrace_branch+0x539d0
025e   405b2d:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	405b30: R_X86_64_32S	_ftrace_branch+0x539c8
0265   405b34:	48 0f 4f d8          	cmovg  %rax,%rbx
0269   405b38:	4c 8b 23             	mov    (%rbx),%r12
026c   405b3b:	49 ff c4             	inc    %r12
026f   405b3e:	48 89 df             	mov    %rbx,%rdi
0272   405b41:	e8 00 00 00 00       	call   405b46 <shrink_lruvec+0x277>	405b42: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0277   405b46:	4c 89 23             	mov    %r12,(%rbx)
027a   405b49:	4d 85 ff             	test   %r15,%r15
027d   405b4c:	0f 8e 10 02 00 00    	jle    405d62 <shrink_lruvec+0x493>
0283   405b52:	e8 00 00 00 00       	call   405b57 <shrink_lruvec+0x288>	405b53: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0288   405b57:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
028d   405b5c:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
0292   405b61:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405b68 <shrink_lruvec+0x299>	405b64: R_X86_64_PC32	_ftrace_branch+0x5491c
0299   405b68:	48 ff c3             	inc    %rbx
029c   405b6b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405b6e: R_X86_64_32S	_ftrace_branch+0x54920
02a3   405b72:	e8 00 00 00 00       	call   405b77 <shrink_lruvec+0x2a8>	405b73: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
02a8   405b77:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405b7e <shrink_lruvec+0x2af>	405b7a: R_X86_64_PC32	_ftrace_branch+0x5491c
02af   405b7e:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
02b4   405b83:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
02b8   405b87:	e8 00 00 00 00       	call   405b8c <shrink_lruvec+0x2bd>	405b88: R_X86_64_PLT32	__tsan_read8-0x4
02bd   405b8c:	48 8b 5b 10          	mov    0x10(%rbx),%rbx
02c1   405b90:	31 ff                	xor    %edi,%edi
02c3   405b92:	44 89 f6             	mov    %r14d,%esi
02c6   405b95:	e8 00 00 00 00       	call   405b9a <shrink_lruvec+0x2cb>	405b96: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
02cb   405b9a:	48 85 db             	test   %rbx,%rbx
02ce   405b9d:	74 2c                	je     405bcb <shrink_lruvec+0x2fc>
02d0   405b9f:	45 85 f6             	test   %r14d,%r14d
02d3   405ba2:	75 27                	jne    405bcb <shrink_lruvec+0x2fc>
02d5   405ba4:	e8 00 00 00 00       	call   405ba9 <shrink_lruvec+0x2da>	405ba5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02da   405ba9:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405bb0 <shrink_lruvec+0x2e1>	405bac: R_X86_64_PC32	_ftrace_branch+0x54934
02e1   405bb0:	48 ff c3             	inc    %rbx
02e4   405bb3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405bb6: R_X86_64_32S	_ftrace_branch+0x54938
02eb   405bba:	e8 00 00 00 00       	call   405bbf <shrink_lruvec+0x2f0>	405bbb: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
02f0   405bbf:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405bc6 <shrink_lruvec+0x2f7>	405bc2: R_X86_64_PC32	_ftrace_branch+0x54934
02f7   405bc6:	e9 be 01 00 00       	jmp    405d89 <shrink_lruvec+0x4ba>
02fc   405bcb:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405bd2 <shrink_lruvec+0x303>	405bce: R_X86_64_PC32	_ftrace_branch+0x5492c
0303   405bd2:	48 ff c3             	inc    %rbx
0306   405bd5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405bd8: R_X86_64_32S	_ftrace_branch+0x54930
030d   405bdc:	e8 00 00 00 00       	call   405be1 <shrink_lruvec+0x312>	405bdd: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0312   405be1:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405be8 <shrink_lruvec+0x319>	405be4: R_X86_64_PC32	_ftrace_branch+0x5492c
0319   405be8:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
031e   405bed:	48 8d 7b 2b          	lea    0x2b(%rbx),%rdi
0322   405bf1:	e8 00 00 00 00       	call   405bf6 <shrink_lruvec+0x327>	405bf2: R_X86_64_PLT32	__tsan_read1-0x4
0327   405bf6:	0f b6 5b 2b          	movzbl 0x2b(%rbx),%ebx
032b   405bfa:	31 ff                	xor    %edi,%edi
032d   405bfc:	89 de                	mov    %ebx,%esi
032f   405bfe:	e8 00 00 00 00       	call   405c03 <shrink_lruvec+0x334>	405bff: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0334   405c03:	85 db                	test   %ebx,%ebx
0336   405c05:	75 3f                	jne    405c46 <shrink_lruvec+0x377>
0338   405c07:	45 85 f6             	test   %r14d,%r14d
033b   405c0a:	74 3a                	je     405c46 <shrink_lruvec+0x377>
033d   405c0c:	e8 00 00 00 00       	call   405c11 <shrink_lruvec+0x342>	405c0d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0342   405c11:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405c18 <shrink_lruvec+0x349>	405c14: R_X86_64_PC32	_ftrace_branch+0x54944
0349   405c18:	48 ff c3             	inc    %rbx
034c   405c1b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405c1e: R_X86_64_32S	_ftrace_branch+0x54948
0353   405c22:	e8 00 00 00 00       	call   405c27 <shrink_lruvec+0x358>	405c23: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0358   405c27:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405c2e <shrink_lruvec+0x35f>	405c2a: R_X86_64_PC32	_ftrace_branch+0x54944
035f   405c2e:	31 c0                	xor    %eax,%eax
0361   405c30:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0366   405c35:	31 f6                	xor    %esi,%esi
0368   405c37:	e9 5c 01 00 00       	jmp    405d98 <shrink_lruvec+0x4c9>
036d   405c3c:	e8 00 00 00 00       	call   405c41 <shrink_lruvec+0x372>	405c3d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0372   405c41:	e9 21 01 00 00       	jmp    405d67 <shrink_lruvec+0x498>
0377   405c46:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405c4d <shrink_lruvec+0x37e>	405c49: R_X86_64_PC32	_ftrace_branch+0x5493c
037e   405c4d:	48 ff c3             	inc    %rbx
0381   405c50:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405c53: R_X86_64_32S	_ftrace_branch+0x54940
0388   405c57:	e8 00 00 00 00       	call   405c5c <shrink_lruvec+0x38d>	405c58: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
038d   405c5c:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405c63 <shrink_lruvec+0x394>	405c5f: R_X86_64_PC32	_ftrace_branch+0x5493c
0394   405c63:	4c 89 ff             	mov    %r15,%rdi
0397   405c66:	e8 00 00 00 00       	call   405c6b <shrink_lruvec+0x39c>	405c67: R_X86_64_PLT32	__tsan_read2-0x4
039c   405c6b:	41 0f b7 1f          	movzwl (%r15),%ebx
03a0   405c6f:	89 de                	mov    %ebx,%esi
03a2   405c71:	81 e6 00 10 00 00    	and    $0x1000,%esi
03a8   405c77:	31 c0                	xor    %eax,%eax
03aa   405c79:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
03af   405c7e:	31 ff                	xor    %edi,%edi
03b1   405c80:	e8 00 00 00 00       	call   405c85 <shrink_lruvec+0x3b6>	405c81: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
03b6   405c85:	89 d8                	mov    %ebx,%eax
03b8   405c87:	25 00 10 00 00       	and    $0x1000,%eax
03bd   405c8c:	0f 85 af 1c 00 00    	jne    407941 <shrink_lruvec+0x2072>
03c3   405c92:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 405c99 <shrink_lruvec+0x3ca>	405c95: R_X86_64_PC32	_ftrace_branch+0x5494c
03ca   405c99:	49 ff c7             	inc    %r15
03cd   405c9c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405c9f: R_X86_64_32S	_ftrace_branch+0x54950
03d4   405ca3:	e8 00 00 00 00       	call   405ca8 <shrink_lruvec+0x3d9>	405ca4: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
03d9   405ca8:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 405caf <shrink_lruvec+0x3e0>	405cab: R_X86_64_PC32	_ftrace_branch+0x5494c
03e0   405caf:	81 e3 00 08 00 00    	and    $0x800,%ebx
03e6   405cb5:	31 c0                	xor    %eax,%eax
03e8   405cb7:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
03ed   405cbc:	31 ff                	xor    %edi,%edi
03ef   405cbe:	89 de                	mov    %ebx,%esi
03f1   405cc0:	e8 00 00 00 00       	call   405cc5 <shrink_lruvec+0x3f6>	405cc1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
03f6   405cc5:	85 db                	test   %ebx,%ebx
03f8   405cc7:	0f 85 a0 1c 00 00    	jne    40796d <shrink_lruvec+0x209e>
03fe   405ccd:	e8 00 00 00 00       	call   405cd2 <shrink_lruvec+0x403>	405cce: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0403   405cd2:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405cd9 <shrink_lruvec+0x40a>	405cd5: R_X86_64_PC32	_ftrace_branch+0x5495c
040a   405cd9:	48 ff c3             	inc    %rbx
040d   405cdc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405cdf: R_X86_64_32S	_ftrace_branch+0x54960
0414   405ce3:	e8 00 00 00 00       	call   405ce8 <shrink_lruvec+0x419>	405ce4: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0419   405ce8:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405cef <shrink_lruvec+0x420>	405ceb: R_X86_64_PC32	_ftrace_branch+0x5495c
0420   405cef:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0425   405cf4:	48 8d 7b 18          	lea    0x18(%rbx),%rdi
0429   405cf8:	e8 00 00 00 00       	call   405cfd <shrink_lruvec+0x42e>	405cf9: R_X86_64_PLT32	__tsan_read8-0x4
042e   405cfd:	4c 8b 7b 18          	mov    0x18(%rbx),%r15
0432   405d01:	48 8d 7b 20          	lea    0x20(%rbx),%rdi
0436   405d05:	e8 00 00 00 00       	call   405d0a <shrink_lruvec+0x43b>	405d06: R_X86_64_PLT32	__tsan_read8-0x4
043b   405d0a:	48 8b 43 20          	mov    0x20(%rbx),%rax
043f   405d0e:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
0443   405d12:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
0447   405d16:	48 8d 3c 08          	lea    (%rax,%rcx,1),%rdi
044b   405d1a:	48 ff c7             	inc    %rdi
044e   405d1d:	48 01 fe             	add    %rdi,%rsi
0451   405d20:	4c 89 f0             	mov    %r14,%rax
0454   405d23:	48 0f af c6          	imul   %rsi,%rax
0458   405d27:	4c 01 f9             	add    %r15,%rcx
045b   405d2a:	48 ff c1             	inc    %rcx
045e   405d2d:	31 d2                	xor    %edx,%edx
0460   405d2f:	48 f7 f1             	div    %rcx
0463   405d32:	48 89 c1             	mov    %rax,%rcx
0466   405d35:	b8 c8 00 00 00       	mov    $0xc8,%eax
046b   405d3a:	44 29 f0             	sub    %r14d,%eax
046e   405d3d:	48 98                	cltq
0470   405d3f:	48 0f af c6          	imul   %rsi,%rax
0474   405d43:	31 d2                	xor    %edx,%edx
0476   405d45:	48 f7 f7             	div    %rdi
0479   405d48:	48 89 8c 24 a0 01 00 00 	mov    %rcx,0x1a0(%rsp)
0481   405d50:	48 89 84 24 a8 01 00 00 	mov    %rax,0x1a8(%rsp)
0489   405d58:	48 01 c8             	add    %rcx,%rax
048c   405d5b:	be 01 00 00 00       	mov    $0x1,%esi
0491   405d60:	eb 38                	jmp    405d9a <shrink_lruvec+0x4cb>
0493   405d62:	e8 00 00 00 00       	call   405d67 <shrink_lruvec+0x498>	405d63: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0498   405d67:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
049d   405d6c:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 405d73 <shrink_lruvec+0x4a4>	405d6f: R_X86_64_PC32	_ftrace_branch+0x54924
04a4   405d73:	48 ff c3             	inc    %rbx
04a7   405d76:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405d79: R_X86_64_32S	_ftrace_branch+0x54928
04ae   405d7d:	e8 00 00 00 00       	call   405d82 <shrink_lruvec+0x4b3>	405d7e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
04b3   405d82:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405d89 <shrink_lruvec+0x4ba>	405d85: R_X86_64_PC32	_ftrace_branch+0x54924
04ba   405d89:	be 03 00 00 00       	mov    $0x3,%esi
04bf   405d8e:	b9 01 00 00 00       	mov    $0x1,%ecx
04c4   405d93:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
04c9   405d98:	31 c0                	xor    %eax,%eax
04cb   405d9a:	49 8d 8d c8 00 00 00 	lea    0xc8(%r13),%rcx
04d2   405da1:	48 89 8c 24 d8 00 00 00 	mov    %rcx,0xd8(%rsp)
04da   405da9:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
04df   405dae:	48 8d 51 2c          	lea    0x2c(%rcx),%rdx
04e3   405db2:	48 89 94 24 b8 00 00 00 	mov    %rdx,0xb8(%rsp)
04eb   405dba:	48 8d 51 10          	lea    0x10(%rcx),%rdx
04ef   405dbe:	48 89 94 24 80 00 00 00 	mov    %rdx,0x80(%rsp)
04f7   405dc6:	49 8d 95 48 03 00 00 	lea    0x348(%r13),%rdx
04fe   405dcd:	48 89 94 24 c0 00 00 00 	mov    %rdx,0xc0(%rsp)
0506   405dd5:	49 8d 94 24 58 01 00 00 	lea    0x158(%r12),%rdx
050e   405ddd:	48 89 94 24 98 00 00 00 	mov    %rdx,0x98(%rsp)
0516   405de5:	49 8d 94 24 70 01 00 00 	lea    0x170(%r12),%rdx
051e   405ded:	48 89 94 24 b0 00 00 00 	mov    %rdx,0xb0(%rsp)
0526   405df5:	48 83 c1 2b          	add    $0x2b,%rcx
052a   405df9:	48 89 8c 24 d0 00 00 00 	mov    %rcx,0xd0(%rsp)
0532   405e01:	49 8d 4c 24 54       	lea    0x54(%r12),%rcx
0537   405e06:	48 89 8c 24 90 00 00 00 	mov    %rcx,0x90(%rsp)
053f   405e0e:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
0547   405e16:	48 ff c8             	dec    %rax
054a   405e19:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
0552   405e21:	b8 01 00 00 00       	mov    $0x1,%eax
0557   405e26:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
055f   405e2e:	31 c0                	xor    %eax,%eax
0561   405e30:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0566   405e35:	89 f0                	mov    %esi,%eax
0568   405e37:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
056d   405e3c:	48 8b 04 c5 00 00 00 00 	mov    0x0(,%rax,8),%rax	405e40: R_X86_64_32S	.rodata+0x23850
0575   405e44:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
057a   405e49:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
057f   405e4e:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0584   405e53:	89 c3                	mov    %eax,%ebx
0586   405e55:	83 e3 fe             	and    $0xfffffffe,%ebx
0589   405e58:	bf 02 00 00 00       	mov    $0x2,%edi
058e   405e5d:	48 89 de             	mov    %rbx,%rsi
0591   405e60:	e8 00 00 00 00       	call   405e65 <shrink_lruvec+0x596>	405e61: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0596   405e65:	48 89 5c 24 48       	mov    %rbx,0x48(%rsp)
059b   405e6a:	48 83 fb 02          	cmp    $0x2,%rbx
059f   405e6e:	0f 94 44 24 50       	sete   0x50(%rsp)
05a4   405e73:	48 8b 9c 24 b8 00 00 00 	mov    0xb8(%rsp),%rbx
05ac   405e7b:	48 89 df             	mov    %rbx,%rdi
05af   405e7e:	e8 00 00 00 00       	call   405e83 <shrink_lruvec+0x5b4>	405e7f: R_X86_64_PLT32	__tsan_read1-0x4
05b4   405e83:	8a 03                	mov    (%rbx),%al
05b6   405e85:	0f b6 d8             	movzbl %al,%ebx
05b9   405e88:	bf ff 00 00 00       	mov    $0xff,%edi
05be   405e8d:	89 de                	mov    %ebx,%esi
05c0   405e8f:	e8 00 00 00 00       	call   405e94 <shrink_lruvec+0x5c5>	405e90: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
05c5   405e94:	84 db                	test   %bl,%bl
05c7   405e96:	0f 88 d7 01 00 00    	js     406073 <shrink_lruvec+0x7a4>
05cd   405e9c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405e9f: R_X86_64_32S	_ftrace_branch+0x549e8
05d4   405ea3:	e8 00 00 00 00       	call   405ea8 <shrink_lruvec+0x5d9>	405ea4: R_X86_64_PLT32	__tsan_unaligned_read8-0x4
05d9   405ea8:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 405eaf <shrink_lruvec+0x5e0>	405eab: R_X86_64_PC32	_ftrace_branch+0x549e4
05e0   405eaf:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
05e5   405eb4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405eb7: R_X86_64_32S	_ftrace_branch+0x549f0
05ec   405ebb:	e8 00 00 00 00       	call   405ec0 <shrink_lruvec+0x5f1>	405ebc: R_X86_64_PLT32	__tsan_unaligned_read8-0x4
05f1   405ec0:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 405ec7 <shrink_lruvec+0x5f8>	405ec3: R_X86_64_PC32	_ftrace_branch+0x549ec
05f8   405ec7:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
05fd   405ecc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405ecf: R_X86_64_32S	_ftrace_branch+0x549f8
0604   405ed3:	e8 00 00 00 00       	call   405ed8 <shrink_lruvec+0x609>	405ed4: R_X86_64_PLT32	__tsan_unaligned_read8-0x4
0609   405ed8:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 405edf <shrink_lruvec+0x610>	405edb: R_X86_64_PC32	_ftrace_branch+0x549f4
0610   405edf:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
0615   405ee4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405ee7: R_X86_64_32S	_ftrace_branch+0x549e0
061c   405eeb:	e8 00 00 00 00       	call   405ef0 <shrink_lruvec+0x621>	405eec: R_X86_64_PLT32	__tsan_unaligned_read8-0x4
0621   405ef0:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 405ef7 <shrink_lruvec+0x628>	405ef3: R_X86_64_PC32	_ftrace_branch+0x549dc
0628   405ef7:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
062d   405efc:	4c 8b b4 24 d8 00 00 00 	mov    0xd8(%rsp),%r14
0635   405f04:	4c 89 f7             	mov    %r14,%rdi
0638   405f07:	e8 00 00 00 00       	call   405f0c <shrink_lruvec+0x63d>	405f08: R_X86_64_PLT32	__tsan_read8-0x4
063d   405f0c:	4d 8b 2e             	mov    (%r14),%r13
0640   405f0f:	80 fb 02             	cmp    $0x2,%bl
0643   405f12:	b8 02 00 00 00       	mov    $0x2,%eax
0648   405f17:	0f 43 d8             	cmovae %eax,%ebx
064b   405f1a:	44 0f b6 e3          	movzbl %bl,%r12d
064f   405f1e:	48 8b 84 24 a0 00 00 00 	mov    0xa0(%rsp),%rax
0657   405f26:	4c 8d 3c c5 38 04 00 00 	lea    0x438(,%rax,8),%r15
065f   405f2e:	4d 01 ef             	add    %r13,%r15
0662   405f31:	49 83 c5 68          	add    $0x68,%r13
0666   405f35:	45 31 f6             	xor    %r14d,%r14d
0669   405f38:	31 c0                	xor    %eax,%eax
066b   405f3a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0670   405f3f:	4c 89 ef             	mov    %r13,%rdi
0673   405f42:	e8 00 00 00 00       	call   405f47 <shrink_lruvec+0x678>	405f43: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0678   405f47:	49 8b 5d 00          	mov    0x0(%r13),%rbx
067c   405f4b:	31 ff                	xor    %edi,%edi
067e   405f4d:	48 89 de             	mov    %rbx,%rsi
0681   405f50:	e8 00 00 00 00       	call   405f55 <shrink_lruvec+0x686>	405f51: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0686   405f55:	48 85 db             	test   %rbx,%rbx
0689   405f58:	0f 84 82 00 00 00    	je     405fe0 <shrink_lruvec+0x711>
068f   405f5e:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
0694   405f63:	48 ff c3             	inc    %rbx
0697   405f66:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405f69: R_X86_64_32S	_ftrace_branch+0x549e0
069e   405f6d:	e8 00 00 00 00       	call   405f72 <shrink_lruvec+0x6a3>	405f6e: R_X86_64_PLT32	__tsan_unaligned_write8-0x4
06a3   405f72:	48 89 5c 24 38       	mov    %rbx,0x38(%rsp)
06a8   405f77:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405f7e <shrink_lruvec+0x6af>	405f7a: R_X86_64_PC32	_ftrace_branch+0x549dc
06af   405f7e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405f81: R_X86_64_32S	memory_cgrp_subsys_enabled_key
06b6   405f85:	e8 00 00 00 00       	call   405f8a <shrink_lruvec+0x6bb>	405f86: R_X86_64_PLT32	__tsan_volatile_read4-0x4
06bb   405f8a:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 405f90 <shrink_lruvec+0x6c1>	405f8c: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
06c1   405f90:	bf 01 00 00 00       	mov    $0x1,%edi
06c6   405f95:	89 de                	mov    %ebx,%esi
06c8   405f97:	e8 00 00 00 00       	call   405f9c <shrink_lruvec+0x6cd>	405f98: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06cd   405f9c:	85 db                	test   %ebx,%ebx
06cf   405f9e:	7e 67                	jle    406007 <shrink_lruvec+0x738>
06d1   405fa0:	e8 00 00 00 00       	call   405fa5 <shrink_lruvec+0x6d6>	405fa1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06d6   405fa5:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
06db   405faa:	48 ff c3             	inc    %rbx
06de   405fad:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405fb0: R_X86_64_32S	_ftrace_branch+0x549f8
06e5   405fb4:	e8 00 00 00 00       	call   405fb9 <shrink_lruvec+0x6ea>	405fb5: R_X86_64_PLT32	__tsan_unaligned_write8-0x4
06ea   405fb9:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
06ef   405fbe:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 405fc5 <shrink_lruvec+0x6f6>	405fc1: R_X86_64_PC32	_ftrace_branch+0x549f4
06f6   405fc5:	4b 8d 04 b6          	lea    (%r14,%r14,4),%rax
06fa   405fc9:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
0702   405fd1:	48 8d 04 c1          	lea    (%rcx,%rax,8),%rax
0706   405fd5:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
070b   405fda:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
070f   405fde:	eb 4f                	jmp    40602f <shrink_lruvec+0x760>
0711   405fe0:	e8 00 00 00 00       	call   405fe5 <shrink_lruvec+0x716>	405fe1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0716   405fe5:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
071b   405fea:	48 ff c3             	inc    %rbx
071e   405fed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	405ff0: R_X86_64_32S	_ftrace_branch+0x549e8
0725   405ff4:	e8 00 00 00 00       	call   405ff9 <shrink_lruvec+0x72a>	405ff5: R_X86_64_PLT32	__tsan_unaligned_write8-0x4
072a   405ff9:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
072f   405ffe:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406005 <shrink_lruvec+0x736>	406001: R_X86_64_PC32	_ftrace_branch+0x549e4
0736   406005:	eb 3d                	jmp    406044 <shrink_lruvec+0x775>
0738   406007:	e8 00 00 00 00       	call   40600c <shrink_lruvec+0x73d>	406008: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
073d   40600c:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
0742   406011:	48 ff c3             	inc    %rbx
0745   406014:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406017: R_X86_64_32S	_ftrace_branch+0x549f0
074c   40601b:	e8 00 00 00 00       	call   406020 <shrink_lruvec+0x751>	40601c: R_X86_64_PLT32	__tsan_unaligned_write8-0x4
0751   406020:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
0756   406025:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40602c <shrink_lruvec+0x75d>	406028: R_X86_64_PC32	_ftrace_branch+0x549ec
075d   40602c:	4c 89 fb             	mov    %r15,%rbx
0760   40602f:	48 89 df             	mov    %rbx,%rdi
0763   406032:	e8 00 00 00 00       	call   406037 <shrink_lruvec+0x768>	406033: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0768   406037:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
076d   40603c:	48 03 03             	add    (%rbx),%rax
0770   40603f:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
0775   406044:	49 83 ec 01          	sub    $0x1,%r12
0779   406048:	72 18                	jb     406062 <shrink_lruvec+0x793>
077b   40604a:	e8 00 00 00 00       	call   40604f <shrink_lruvec+0x780>	40604b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0780   40604f:	b8 90 04 00 00       	mov    $0x490,%eax
0785   406054:	49 01 c7             	add    %rax,%r15
0788   406057:	49 01 c5             	add    %rax,%r13
078b   40605a:	49 ff c6             	inc    %r14
078e   40605d:	e9 dd fe ff ff       	jmp    405f3f <shrink_lruvec+0x670>
0793   406062:	e8 00 00 00 00       	call   406067 <shrink_lruvec+0x798>	406063: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0798   406067:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
079d   40606c:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
07a2   406071:	eb 0c                	jmp    40607f <shrink_lruvec+0x7b0>
07a4   406073:	e8 00 00 00 00       	call   406078 <shrink_lruvec+0x7a9>	406074: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07a9   406078:	31 c0                	xor    %eax,%eax
07ab   40607a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
07b0   40607f:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
07b8   406087:	48 89 df             	mov    %rbx,%rdi
07bb   40608a:	e8 00 00 00 00       	call   40608f <shrink_lruvec+0x7c0>	40608b: R_X86_64_PLT32	__tsan_read8-0x4
07c0   40608f:	4c 8b 33             	mov    (%rbx),%r14
07c3   406092:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406095: R_X86_64_32S	memory_cgrp_subsys_enabled_key
07ca   406099:	e8 00 00 00 00       	call   40609e <shrink_lruvec+0x7cf>	40609a: R_X86_64_PLT32	__tsan_volatile_read4-0x4
07cf   40609e:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 4060a4 <shrink_lruvec+0x7d5>	4060a0: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
07d5   4060a4:	bf 01 00 00 00       	mov    $0x1,%edi
07da   4060a9:	89 de                	mov    %ebx,%esi
07dc   4060ab:	e8 00 00 00 00       	call   4060b0 <shrink_lruvec+0x7e1>	4060ac: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
07e1   4060b0:	85 db                	test   %ebx,%ebx
07e3   4060b2:	0f 8e 82 00 00 00    	jle    40613a <shrink_lruvec+0x86b>
07e9   4060b8:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4060bf <shrink_lruvec+0x7f0>	4060bb: R_X86_64_PC32	_ftrace_branch+0x549fc
07f0   4060bf:	48 ff c3             	inc    %rbx
07f3   4060c2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4060c5: R_X86_64_32S	_ftrace_branch+0x54a00
07fa   4060c9:	e8 00 00 00 00       	call   4060ce <shrink_lruvec+0x7ff>	4060ca: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
07ff   4060ce:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4060d5 <shrink_lruvec+0x806>	4060d1: R_X86_64_PC32	_ftrace_branch+0x549fc
0806   4060d5:	4d 39 e6             	cmp    %r12,%r14
0809   4060d8:	74 6e                	je     406148 <shrink_lruvec+0x879>
080b   4060da:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4060e1 <shrink_lruvec+0x812>	4060dd: R_X86_64_PC32	_ftrace_branch+0x54a0c
0812   4060e1:	48 ff c3             	inc    %rbx
0815   4060e4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4060e7: R_X86_64_32S	_ftrace_branch+0x54a10
081c   4060eb:	e8 00 00 00 00       	call   4060f0 <shrink_lruvec+0x821>	4060ec: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0821   4060f0:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4060f7 <shrink_lruvec+0x828>	4060f3: R_X86_64_PC32	_ftrace_branch+0x54a0c
0828   4060f7:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
0830   4060ff:	48 89 df             	mov    %rbx,%rdi
0833   406102:	e8 00 00 00 00       	call   406107 <shrink_lruvec+0x838>	406103: R_X86_64_PLT32	__tsan_volatile_read8-0x4
0838   406107:	4c 8b 23             	mov    (%rbx),%r12
083b   40610a:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
0843   406112:	48 89 df             	mov    %rbx,%rdi
0846   406115:	e8 00 00 00 00       	call   40611a <shrink_lruvec+0x84b>	406116: R_X86_64_PLT32	__tsan_volatile_read8-0x4
084b   40611a:	4c 8b 3b             	mov    (%rbx),%r15
084e   40611d:	31 ff                	xor    %edi,%edi
0850   40611f:	4c 89 e6             	mov    %r12,%rsi
0853   406122:	e8 00 00 00 00       	call   406127 <shrink_lruvec+0x858>	406123: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0858   406127:	4d 85 e4             	test   %r12,%r12
085b   40612a:	0f 84 c4 03 00 00    	je     4064f4 <shrink_lruvec+0xc25>
0861   406130:	e8 00 00 00 00       	call   406135 <shrink_lruvec+0x866>	406131: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0866   406135:	45 31 f6             	xor    %r14d,%r14d
0869   406138:	eb 34                	jmp    40616e <shrink_lruvec+0x89f>
086b   40613a:	e8 00 00 00 00       	call   40613f <shrink_lruvec+0x870>	40613b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0870   40613f:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	406142: R_X86_64_32S	_ftrace_branch+0x54a08
0877   406146:	eb 0c                	jmp    406154 <shrink_lruvec+0x885>
0879   406148:	e8 00 00 00 00       	call   40614d <shrink_lruvec+0x87e>	406149: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
087e   40614d:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	406150: R_X86_64_32S	_ftrace_branch+0x54a18
0885   406154:	49 8b 1e             	mov    (%r14),%rbx
0888   406157:	48 ff c3             	inc    %rbx
088b   40615a:	4c 89 f7             	mov    %r14,%rdi
088e   40615d:	e8 00 00 00 00       	call   406162 <shrink_lruvec+0x893>	40615e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0893   406162:	49 89 1e             	mov    %rbx,(%r14)
0896   406165:	41 b6 01             	mov    $0x1,%r14b
0899   406168:	45 31 e4             	xor    %r12d,%r12d
089c   40616b:	45 31 ff             	xor    %r15d,%r15d
089f   40616e:	31 ff                	xor    %edi,%edi
08a1   406170:	4c 89 fe             	mov    %r15,%rsi
08a4   406173:	e8 00 00 00 00       	call   406178 <shrink_lruvec+0x8a9>	406174: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
08a9   406178:	45 84 f6             	test   %r14b,%r14b
08ac   40617b:	74 31                	je     4061ae <shrink_lruvec+0x8df>
08ae   40617d:	4d 85 ff             	test   %r15,%r15
08b1   406180:	75 2c                	jne    4061ae <shrink_lruvec+0x8df>
08b3   406182:	e8 00 00 00 00       	call   406187 <shrink_lruvec+0x8b8>	406183: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08b8   406187:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40618e <shrink_lruvec+0x8bf>	40618a: R_X86_64_PC32	_ftrace_branch+0x5496c
08bf   40618e:	48 ff c3             	inc    %rbx
08c2   406191:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406194: R_X86_64_32S	_ftrace_branch+0x54970
08c9   406198:	e8 00 00 00 00       	call   40619d <shrink_lruvec+0x8ce>	406199: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
08ce   40619d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4061a4 <shrink_lruvec+0x8d5>	4061a0: R_X86_64_PC32	_ftrace_branch+0x5496c
08d5   4061a4:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
08da   4061a9:	e9 11 01 00 00       	jmp    4062bf <shrink_lruvec+0x9f0>
08df   4061ae:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4061b5 <shrink_lruvec+0x8e6>	4061b1: R_X86_64_PC32	_ftrace_branch+0x54974
08e6   4061b5:	48 ff c3             	inc    %rbx
08e9   4061b8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4061bb: R_X86_64_32S	_ftrace_branch+0x54978
08f0   4061bf:	e8 00 00 00 00       	call   4061c4 <shrink_lruvec+0x8f5>	4061c0: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
08f5   4061c4:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4061cb <shrink_lruvec+0x8fc>	4061c7: R_X86_64_PC32	_ftrace_branch+0x54974
08fc   4061cb:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
0901   4061d0:	e8 00 00 00 00       	call   4061d5 <shrink_lruvec+0x906>	4061d1: R_X86_64_PLT32	mem_cgroup_size-0x4
0906   4061d5:	49 89 c5             	mov    %rax,%r13
0909   4061d8:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
090e   4061dd:	48 89 df             	mov    %rbx,%rdi
0911   4061e0:	e8 00 00 00 00       	call   4061e5 <shrink_lruvec+0x916>	4061e1: R_X86_64_PLT32	__tsan_read2-0x4
0916   4061e5:	44 0f b7 33          	movzwl (%rbx),%r14d
091a   4061e9:	44 89 f6             	mov    %r14d,%esi
091d   4061ec:	81 e6 80 00 00 00    	and    $0x80,%esi
0923   4061f2:	31 ff                	xor    %edi,%edi
0925   4061f4:	e8 00 00 00 00       	call   4061f9 <shrink_lruvec+0x92a>	4061f5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
092a   4061f9:	4c 89 ff             	mov    %r15,%rdi
092d   4061fc:	4c 89 e6             	mov    %r12,%rsi
0930   4061ff:	e8 00 00 00 00       	call   406204 <shrink_lruvec+0x935>	406200: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0935   406204:	44 89 f0             	mov    %r14d,%eax
0938   406207:	25 80 00 00 00       	and    $0x80,%eax
093d   40620c:	75 44                	jne    406252 <shrink_lruvec+0x983>
093f   40620e:	4d 39 e7             	cmp    %r12,%r15
0942   406211:	76 3f                	jbe    406252 <shrink_lruvec+0x983>
0944   406213:	e8 00 00 00 00       	call   406218 <shrink_lruvec+0x949>	406214: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0949   406218:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40621f <shrink_lruvec+0x950>	40621b: R_X86_64_PC32	_ftrace_branch+0x54984
0950   40621f:	48 ff c3             	inc    %rbx
0953   406222:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406225: R_X86_64_32S	_ftrace_branch+0x54988
095a   406229:	e8 00 00 00 00       	call   40622e <shrink_lruvec+0x95f>	40622a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
095f   40622e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406235 <shrink_lruvec+0x966>	406231: R_X86_64_PC32	_ftrace_branch+0x54984
0966   406235:	41 81 ce 00 01 00 00 	or     $0x100,%r14d
096d   40623c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
0972   406241:	48 89 df             	mov    %rbx,%rdi
0975   406244:	e8 00 00 00 00       	call   406249 <shrink_lruvec+0x97a>	406245: R_X86_64_PLT32	__tsan_write2-0x4
097a   406249:	66 44 89 33          	mov    %r14w,(%rbx)
097e   40624d:	4d 89 fc             	mov    %r15,%r12
0981   406250:	eb 22                	jmp    406274 <shrink_lruvec+0x9a5>
0983   406252:	e8 00 00 00 00       	call   406257 <shrink_lruvec+0x988>	406253: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0988   406257:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40625e <shrink_lruvec+0x98f>	40625a: R_X86_64_PC32	_ftrace_branch+0x5497c
098f   40625e:	48 ff c3             	inc    %rbx
0992   406261:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406264: R_X86_64_32S	_ftrace_branch+0x54980
0999   406268:	e8 00 00 00 00       	call   40626d <shrink_lruvec+0x99e>	406269: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
099e   40626d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406274 <shrink_lruvec+0x9a5>	406270: R_X86_64_PC32	_ftrace_branch+0x5497c
09a5   406274:	4c 89 ef             	mov    %r13,%rdi
09a8   406277:	4c 89 e6             	mov    %r12,%rsi
09ab   40627a:	e8 00 00 00 00       	call   40627f <shrink_lruvec+0x9b0>	40627b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
09b0   40627f:	4d 39 e5             	cmp    %r12,%r13
09b3   406282:	4d 0f 46 ec          	cmovbe %r12,%r13
09b7   406286:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
09bc   40628b:	4c 0f af e1          	imul   %rcx,%r12
09c0   40628f:	49 ff c5             	inc    %r13
09c3   406292:	4c 89 e0             	mov    %r12,%rax
09c6   406295:	31 d2                	xor    %edx,%edx
09c8   406297:	49 f7 f5             	div    %r13
09cb   40629a:	49 89 cc             	mov    %rcx,%r12
09ce   40629d:	49 29 c4             	sub    %rax,%r12
09d1   4062a0:	bf 20 00 00 00       	mov    $0x20,%edi
09d6   4062a5:	4c 89 e6             	mov    %r12,%rsi
09d9   4062a8:	e8 00 00 00 00       	call   4062ad <shrink_lruvec+0x9de>	4062a9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09de   4062ad:	49 83 fc 21          	cmp    $0x21,%r12
09e2   4062b1:	b8 20 00 00 00       	mov    $0x20,%eax
09e7   4062b6:	4c 0f 42 e0          	cmovb  %rax,%r12
09eb   4062ba:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
09f0   4062bf:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
09f8   4062c7:	48 89 df             	mov    %rbx,%rdi
09fb   4062ca:	e8 00 00 00 00       	call   4062cf <shrink_lruvec+0xa00>	4062cb: R_X86_64_PLT32	__tsan_read1-0x4
0a00   4062cf:	44 8a 3b             	mov    (%rbx),%r15b
0a03   4062d2:	44 89 f9             	mov    %r15d,%ecx
0a06   4062d5:	49 d3 ec             	shr    %cl,%r12
0a09   4062d8:	31 ff                	xor    %edi,%edi
0a0b   4062da:	4c 89 e6             	mov    %r12,%rsi
0a0e   4062dd:	e8 00 00 00 00       	call   4062e2 <shrink_lruvec+0xa13>	4062de: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0a13   4062e2:	4d 85 e4             	test   %r12,%r12
0a16   4062e5:	74 41                	je     406328 <shrink_lruvec+0xa59>
0a18   4062e7:	e8 00 00 00 00       	call   4062ec <shrink_lruvec+0xa1d>	4062e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a1d   4062ec:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4062f3 <shrink_lruvec+0xa24>	4062ef: R_X86_64_PC32	_ftrace_branch+0x5498c
0a24   4062f3:	48 ff c3             	inc    %rbx
0a27   4062f6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4062f9: R_X86_64_32S	_ftrace_branch+0x54990
0a2e   4062fd:	e8 00 00 00 00       	call   406302 <shrink_lruvec+0xa33>	4062fe: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0a33   406302:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406309 <shrink_lruvec+0xa3a>	406305: R_X86_64_PC32	_ftrace_branch+0x5498c
0a3a   406309:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
0a3f   40630e:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	406311: R_X86_64_32S	.data+0x2b2040
0a46   406315:	e8 00 00 00 00       	call   40631a <shrink_lruvec+0xa4b>	406316: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
0a4b   40631a:	ff 64 24 70          	jmp    *0x70(%rsp)
0a4f   40631e:	e8 00 00 00 00       	call   406323 <shrink_lruvec+0xa54>	40631f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a54   406323:	e9 69 02 00 00       	jmp    406591 <shrink_lruvec+0xcc2>
0a59   406328:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40632b: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0a60   40632f:	e8 00 00 00 00       	call   406334 <shrink_lruvec+0xa65>	406330: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0a65   406334:	44 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13d        # 40633b <shrink_lruvec+0xa6c>	406337: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0a6c   40633b:	bf 01 00 00 00       	mov    $0x1,%edi
0a71   406340:	44 89 ee             	mov    %r13d,%esi
0a74   406343:	e8 00 00 00 00       	call   406348 <shrink_lruvec+0xa79>	406344: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a79   406348:	45 85 ed             	test   %r13d,%r13d
0a7c   40634b:	0f 8e b3 01 00 00    	jle    406504 <shrink_lruvec+0xc35>
0a82   406351:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 406358 <shrink_lruvec+0xa89>	406354: R_X86_64_PC32	_ftrace_branch+0x53ba4
0a89   406358:	49 ff c6             	inc    %r14
0a8c   40635b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40635e: R_X86_64_32S	_ftrace_branch+0x53ba8
0a93   406362:	e8 00 00 00 00       	call   406367 <shrink_lruvec+0xa98>	406363: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0a98   406367:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 40636e <shrink_lruvec+0xa9f>	40636a: R_X86_64_PC32	_ftrace_branch+0x53ba4
0a9f   40636e:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
0aa7   406376:	48 89 df             	mov    %rbx,%rdi
0aaa   406379:	e8 00 00 00 00       	call   40637e <shrink_lruvec+0xaaf>	40637a: R_X86_64_PLT32	__tsan_read4-0x4
0aaf   40637e:	44 8b 33             	mov    (%rbx),%r14d
0ab2   406381:	44 89 f6             	mov    %r14d,%esi
0ab5   406384:	83 e6 02             	and    $0x2,%esi
0ab8   406387:	31 ff                	xor    %edi,%edi
0aba   406389:	e8 00 00 00 00       	call   40638e <shrink_lruvec+0xabf>	40638a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0abf   40638e:	41 83 e6 02          	and    $0x2,%r14d
0ac3   406392:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
0ac8   406397:	0f 85 93 01 00 00    	jne    406530 <shrink_lruvec+0xc61>
0ace   40639d:	e8 00 00 00 00       	call   4063a2 <shrink_lruvec+0xad3>	40639e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ad3   4063a2:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4063a9 <shrink_lruvec+0xada>	4063a5: R_X86_64_PC32	_ftrace_branch+0x54994
0ada   4063a9:	48 ff c3             	inc    %rbx
0add   4063ac:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4063af: R_X86_64_32S	_ftrace_branch+0x54998
0ae4   4063b3:	e8 00 00 00 00       	call   4063b8 <shrink_lruvec+0xae9>	4063b4: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0ae9   4063b8:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4063bf <shrink_lruvec+0xaf0>	4063bb: R_X86_64_PC32	_ftrace_branch+0x54994
0af0   4063bf:	bf 20 00 00 00       	mov    $0x20,%edi
0af5   4063c4:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
0afa   4063c9:	4c 89 e6             	mov    %r12,%rsi
0afd   4063cc:	e8 00 00 00 00       	call   4063d1 <shrink_lruvec+0xb02>	4063cd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0b02   4063d1:	49 83 fc 20          	cmp    $0x20,%r12
0b06   4063d5:	b8 20 00 00 00       	mov    $0x20,%eax
0b0b   4063da:	4c 0f 43 e0          	cmovae %rax,%r12
0b0f   4063de:	e9 26 ff ff ff       	jmp    406309 <shrink_lruvec+0xa3a>
0b14   4063e3:	e8 00 00 00 00       	call   4063e8 <shrink_lruvec+0xb19>	4063e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b19   4063e8:	eb 05                	jmp    4063ef <shrink_lruvec+0xb20>
0b1b   4063ea:	e8 00 00 00 00       	call   4063ef <shrink_lruvec+0xb20>	4063eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b20   4063ef:	31 db                	xor    %ebx,%ebx
0b22   4063f1:	8a 44 24 50          	mov    0x50(%rsp),%al
0b26   4063f5:	88 c3                	mov    %al,%bl
0b28   4063f7:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
0b2d   4063fc:	44 89 f7             	mov    %r14d,%edi
0b30   4063ff:	89 de                	mov    %ebx,%esi
0b32   406401:	e8 00 00 00 00       	call   406406 <shrink_lruvec+0xb37>	406402: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0b37   406406:	41 39 de             	cmp    %ebx,%r14d
0b3a   406409:	75 27                	jne    406432 <shrink_lruvec+0xb63>
0b3c   40640b:	e8 00 00 00 00       	call   406410 <shrink_lruvec+0xb41>	40640c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b41   406410:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406417 <shrink_lruvec+0xb48>	406413: R_X86_64_PC32	_ftrace_branch+0x5499c
0b48   406417:	48 ff c3             	inc    %rbx
0b4b   40641a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40641d: R_X86_64_32S	_ftrace_branch+0x549a0
0b52   406421:	e8 00 00 00 00       	call   406426 <shrink_lruvec+0xb57>	406422: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0b57   406426:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40642d <shrink_lruvec+0xb5e>	406429: R_X86_64_PC32	_ftrace_branch+0x5499c
0b5e   40642d:	e9 5f 01 00 00       	jmp    406591 <shrink_lruvec+0xcc2>
0b63   406432:	e8 00 00 00 00       	call   406437 <shrink_lruvec+0xb68>	406433: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b68   406437:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40643e <shrink_lruvec+0xb6f>	40643a: R_X86_64_PC32	_ftrace_branch+0x549a4
0b6f   40643e:	48 ff c3             	inc    %rbx
0b72   406441:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406444: R_X86_64_32S	_ftrace_branch+0x549a8
0b79   406448:	e8 00 00 00 00       	call   40644d <shrink_lruvec+0xb7e>	406449: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0b7e   40644d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406454 <shrink_lruvec+0xb85>	406450: R_X86_64_PC32	_ftrace_branch+0x549a4
0b85   406454:	45 31 e4             	xor    %r12d,%r12d
0b88   406457:	e9 35 01 00 00       	jmp    406591 <shrink_lruvec+0xcc2>
0b8d   40645c:	45 89 fe             	mov    %r15d,%r14d
0b90   40645f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406462: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0b97   406466:	e8 00 00 00 00       	call   40646b <shrink_lruvec+0xb9c>	406467: R_X86_64_PLT32	__tsan_volatile_read4-0x4
0b9c   40646b:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 406472 <shrink_lruvec+0xba3>	40646e: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0ba3   406472:	bf 01 00 00 00       	mov    $0x1,%edi
0ba8   406477:	44 89 fe             	mov    %r15d,%esi
0bab   40647a:	e8 00 00 00 00       	call   40647f <shrink_lruvec+0xbb0>	40647b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0bb0   40647f:	45 85 ff             	test   %r15d,%r15d
0bb3   406482:	0f 8e b2 00 00 00    	jle    40653a <shrink_lruvec+0xc6b>
0bb9   406488:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40648f <shrink_lruvec+0xbc0>	40648b: R_X86_64_PC32	_ftrace_branch+0x53ba4
0bc0   40648f:	48 ff c3             	inc    %rbx
0bc3   406492:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406495: R_X86_64_32S	_ftrace_branch+0x53ba8
0bca   406499:	e8 00 00 00 00       	call   40649e <shrink_lruvec+0xbcf>	40649a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0bcf   40649e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4064a5 <shrink_lruvec+0xbd6>	4064a1: R_X86_64_PC32	_ftrace_branch+0x53ba4
0bd6   4064a5:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
0bde   4064ad:	48 89 df             	mov    %rbx,%rdi
0be1   4064b0:	e8 00 00 00 00       	call   4064b5 <shrink_lruvec+0xbe6>	4064b1: R_X86_64_PLT32	__tsan_read4-0x4
0be6   4064b5:	8b 1b                	mov    (%rbx),%ebx
0be8   4064b7:	89 de                	mov    %ebx,%esi
0bea   4064b9:	83 e6 02             	and    $0x2,%esi
0bed   4064bc:	31 ff                	xor    %edi,%edi
0bef   4064be:	e8 00 00 00 00       	call   4064c3 <shrink_lruvec+0xbf4>	4064bf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0bf4   4064c3:	83 e3 02             	and    $0x2,%ebx
0bf7   4064c6:	45 89 f7             	mov    %r14d,%r15d
0bfa   4064c9:	0f 85 97 00 00 00    	jne    406566 <shrink_lruvec+0xc97>
0c00   4064cf:	31 db                	xor    %ebx,%ebx
0c02   4064d1:	83 7c 24 48 02       	cmpl   $0x2,0x48(%rsp)
0c07   4064d6:	0f 94 c3             	sete   %bl
0c0a   4064d9:	e8 00 00 00 00       	call   4064de <shrink_lruvec+0xc0f>	4064da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c0f   4064de:	4c 0f af a4 dc a0 01 00 00 	imul   0x1a0(%rsp,%rbx,8),%r12
0c18   4064e7:	4c 03 a4 24 a8 00 00 00 	add    0xa8(%rsp),%r12
0c20   4064ef:	e9 8d 00 00 00       	jmp    406581 <shrink_lruvec+0xcb2>
0c25   4064f4:	e8 00 00 00 00       	call   4064f9 <shrink_lruvec+0xc2a>	4064f5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c2a   4064f9:	41 b6 01             	mov    $0x1,%r14b
0c2d   4064fc:	45 31 e4             	xor    %r12d,%r12d
0c30   4064ff:	e9 6a fc ff ff       	jmp    40616e <shrink_lruvec+0x89f>
0c35   406504:	e8 00 00 00 00       	call   406509 <shrink_lruvec+0xc3a>	406505: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c3a   406509:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 406510 <shrink_lruvec+0xc41>	40650c: R_X86_64_PC32	_ftrace_branch+0x53bac
0c41   406510:	49 ff c6             	inc    %r14
0c44   406513:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406516: R_X86_64_32S	_ftrace_branch+0x53bb0
0c4b   40651a:	e8 00 00 00 00       	call   40651f <shrink_lruvec+0xc50>	40651b: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0c50   40651f:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 406526 <shrink_lruvec+0xc57>	406522: R_X86_64_PC32	_ftrace_branch+0x53bac
0c57   406526:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
0c5c   40652b:	e9 bc fd ff ff       	jmp    4062ec <shrink_lruvec+0xa1d>
0c61   406530:	e8 00 00 00 00       	call   406535 <shrink_lruvec+0xc66>	406531: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c66   406535:	e9 b2 fd ff ff       	jmp    4062ec <shrink_lruvec+0xa1d>
0c6b   40653a:	e8 00 00 00 00       	call   40653f <shrink_lruvec+0xc70>	40653b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c70   40653f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406546 <shrink_lruvec+0xc77>	406542: R_X86_64_PC32	_ftrace_branch+0x53bac
0c77   406546:	48 ff c3             	inc    %rbx
0c7a   406549:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40654c: R_X86_64_32S	_ftrace_branch+0x53bb0
0c81   406550:	e8 00 00 00 00       	call   406555 <shrink_lruvec+0xc86>	406551: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0c86   406555:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40655c <shrink_lruvec+0xc8d>	406558: R_X86_64_PC32	_ftrace_branch+0x53bac
0c8d   40655c:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
0c92   406561:	45 89 f7             	mov    %r14d,%r15d
0c95   406564:	eb 0a                	jmp    406570 <shrink_lruvec+0xca1>
0c97   406566:	e8 00 00 00 00       	call   40656b <shrink_lruvec+0xc9c>	406567: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c9c   40656b:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
0ca1   406570:	31 c0                	xor    %eax,%eax
0ca3   406572:	83 f9 02             	cmp    $0x2,%ecx
0ca6   406575:	0f 94 c0             	sete   %al
0ca9   406578:	4c 0f af a4 c4 a0 01 00 00 	imul   0x1a0(%rsp,%rax,8),%r12
0cb2   406581:	4c 89 e0             	mov    %r12,%rax
0cb5   406584:	31 d2                	xor    %edx,%edx
0cb7   406586:	48 f7 b4 24 88 00 00 00 	divq   0x88(%rsp)
0cbf   40658e:	49 89 c4             	mov    %rax,%r12
0cc2   406591:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0cc7   406596:	4c 89 a4 c4 70 01 00 00 	mov    %r12,0x170(%rsp,%rax,8)
0ccf   40659e:	48 ff c0             	inc    %rax
0cd2   4065a1:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
0cd7   4065a6:	48 83 f8 04          	cmp    $0x4,%rax
0cdb   4065aa:	74 17                	je     4065c3 <shrink_lruvec+0xcf4>
0cdd   4065ac:	e8 00 00 00 00       	call   4065b1 <shrink_lruvec+0xce2>	4065ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ce2   4065b1:	48 ff 84 24 a0 00 00 00 	incq   0xa0(%rsp)
0cea   4065b9:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
0cef   4065be:	e9 8b f8 ff ff       	jmp    405e4e <shrink_lruvec+0x57f>
0cf4   4065c3:	48 8d bc 24 40 01 00 00 	lea    0x140(%rsp),%rdi
0cfc   4065cb:	48 8d b4 24 70 01 00 00 	lea    0x170(%rsp),%rsi
0d04   4065d3:	ba 28 00 00 00       	mov    $0x28,%edx
0d09   4065d8:	e8 00 00 00 00       	call   4065dd <shrink_lruvec+0xd0e>	4065d9: R_X86_64_PLT32	memcpy-0x4
0d0e   4065dd:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
0d16   4065e5:	48 89 df             	mov    %rbx,%rdi
0d19   4065e8:	e8 00 00 00 00       	call   4065ed <shrink_lruvec+0xd1e>	4065e9: R_X86_64_PLT32	__tsan_read8-0x4
0d1e   4065ed:	48 83 3b 00          	cmpq   $0x0,(%rbx)
0d22   4065f1:	74 09                	je     4065fc <shrink_lruvec+0xd2d>
0d24   4065f3:	e8 00 00 00 00       	call   4065f8 <shrink_lruvec+0xd29>	4065f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d29   4065f8:	31 db                	xor    %ebx,%ebx
0d2b   4065fa:	eb 41                	jmp    40663d <shrink_lruvec+0xd6e>
0d2d   4065fc:	e8 00 00 00 00       	call   406601 <shrink_lruvec+0xd32>	4065fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d32   406601:	48 8b 1c 25 00 00 00 00 	mov    0x0,%rbx	406605: R_X86_64_32S	current_task
0d3a   406609:	48 8d 7b 2c          	lea    0x2c(%rbx),%rdi
0d3e   40660d:	e8 00 00 00 00       	call   406612 <shrink_lruvec+0xd43>	40660e: R_X86_64_PLT32	__tsan_read4-0x4
0d43   406612:	be 00 00 02 00       	mov    $0x20000,%esi
0d48   406617:	23 73 2c             	and    0x2c(%rbx),%esi
0d4b   40661a:	0f 94 c3             	sete   %bl
0d4e   40661d:	31 ff                	xor    %edi,%edi
0d50   40661f:	e8 00 00 00 00       	call   406624 <shrink_lruvec+0xd55>	406620: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0d55   406624:	41 0f b6 f7          	movzbl %r15b,%esi
0d59   406628:	bf 0c 00 00 00       	mov    $0xc,%edi
0d5e   40662d:	e8 00 00 00 00       	call   406632 <shrink_lruvec+0xd63>	40662e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0d63   406632:	41 80 ff 0c          	cmp    $0xc,%r15b
0d67   406636:	0f 94 c0             	sete   %al
0d6a   406639:	20 d8                	and    %bl,%al
0d6c   40663b:	89 c3                	mov    %eax,%ebx
0d6e   40663d:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
0d76   406645:	e8 00 00 00 00       	call   40664a <shrink_lruvec+0xd7b>	406646: R_X86_64_PLT32	blk_start_plug-0x4
0d7b   40664a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
0d80   40664f:	48 8d 48 30          	lea    0x30(%rax),%rcx
0d84   406653:	48 89 8c 24 a0 00 00 00 	mov    %rcx,0xa0(%rsp)
0d8c   40665b:	49 8d 4d 50          	lea    0x50(%r13),%rcx
0d90   40665f:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
0d95   406664:	49 8d 8d 00 04 00 00 	lea    0x400(%r13),%rcx
0d9c   40666b:	48 89 8c 24 98 00 00 00 	mov    %rcx,0x98(%rsp)
0da4   406673:	48 8d 48 48          	lea    0x48(%rax),%rcx
0da8   406677:	48 89 8c 24 b0 00 00 00 	mov    %rcx,0xb0(%rsp)
0db0   40667f:	48 8d 48 50          	lea    0x50(%rax),%rcx
0db4   406683:	48 89 8c 24 90 00 00 00 	mov    %rcx,0x90(%rsp)
0dbc   40668b:	48 8d 48 4c          	lea    0x4c(%rax),%rcx
0dc0   40668f:	48 89 8c 24 88 00 00 00 	mov    %rcx,0x88(%rsp)
0dc8   406697:	48 8d 48 54          	lea    0x54(%rax),%rcx
0dcc   40669b:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
0dd4   4066a3:	48 8d 48 58          	lea    0x58(%rax),%rcx
0dd8   4066a7:	48 89 8c 24 f8 00 00 00 	mov    %rcx,0xf8(%rsp)
0de0   4066af:	48 8d 48 60          	lea    0x60(%rax),%rcx
0de4   4066b3:	48 89 8c 24 f0 00 00 00 	mov    %rcx,0xf0(%rsp)
0dec   4066bb:	48 83 c0 5c          	add    $0x5c,%rax
0df0   4066bf:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
0df8   4066c7:	31 c0                	xor    %eax,%eax
0dfa   4066c9:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0dff   4066ce:	80 e3 01             	and    $0x1,%bl
0e02   4066d1:	89 9c 24 cc 00 00 00 	mov    %ebx,0xcc(%rsp)
0e09   4066d8:	0f b6 f3             	movzbl %bl,%esi
0e0c   4066db:	31 ff                	xor    %edi,%edi
0e0e   4066dd:	e8 00 00 00 00       	call   4066e2 <shrink_lruvec+0xe13>	4066de: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0e13   4066e2:	4c 8b bc 24 70 01 00 00 	mov    0x170(%rsp),%r15
0e1b   4066ea:	31 ff                	xor    %edi,%edi
0e1d   4066ec:	4c 89 fe             	mov    %r15,%rsi
0e20   4066ef:	e8 00 00 00 00       	call   4066f4 <shrink_lruvec+0xe25>	4066f0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e25   4066f4:	4d 85 ff             	test   %r15,%r15
0e28   4066f7:	74 07                	je     406700 <shrink_lruvec+0xe31>
0e2a   4066f9:	e8 00 00 00 00       	call   4066fe <shrink_lruvec+0xe2f>	4066fa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e2f   4066fe:	eb 3e                	jmp    40673e <shrink_lruvec+0xe6f>
0e31   406700:	4c 8b b4 24 88 01 00 00 	mov    0x188(%rsp),%r14
0e39   406708:	31 ff                	xor    %edi,%edi
0e3b   40670a:	4c 89 f6             	mov    %r14,%rsi
0e3e   40670d:	e8 00 00 00 00       	call   406712 <shrink_lruvec+0xe43>	40670e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e43   406712:	4d 85 f6             	test   %r14,%r14
0e46   406715:	74 07                	je     40671e <shrink_lruvec+0xe4f>
0e48   406717:	e8 00 00 00 00       	call   40671c <shrink_lruvec+0xe4d>	406718: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e4d   40671c:	eb 20                	jmp    40673e <shrink_lruvec+0xe6f>
0e4f   40671e:	4c 8b b4 24 80 01 00 00 	mov    0x180(%rsp),%r14
0e57   406726:	31 ff                	xor    %edi,%edi
0e59   406728:	4c 89 f6             	mov    %r14,%rsi
0e5c   40672b:	e8 00 00 00 00       	call   406730 <shrink_lruvec+0xe61>	40672c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e61   406730:	4d 85 f6             	test   %r14,%r14
0e64   406733:	0f 84 c0 10 00 00    	je     4077f9 <shrink_lruvec+0x1f2a>
0e6a   406739:	e8 00 00 00 00       	call   40673e <shrink_lruvec+0xe6f>	40673a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e6f   40673e:	45 31 e4             	xor    %r12d,%r12d
0e72   406741:	31 ff                	xor    %edi,%edi
0e74   406743:	4c 89 fe             	mov    %r15,%rsi
0e77   406746:	e8 00 00 00 00       	call   40674b <shrink_lruvec+0xe7c>	406747: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e7c   40674b:	4d 85 ff             	test   %r15,%r15
0e7f   40674e:	0f 84 00 01 00 00    	je     406854 <shrink_lruvec+0xf85>
0e85   406754:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40675b <shrink_lruvec+0xe8c>	406757: R_X86_64_PC32	_ftrace_branch+0x548d4
0e8c   40675b:	48 ff c3             	inc    %rbx
0e8f   40675e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406761: R_X86_64_32S	_ftrace_branch+0x548d8
0e96   406765:	e8 00 00 00 00       	call   40676a <shrink_lruvec+0xe9b>	406766: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0e9b   40676a:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406771 <shrink_lruvec+0xea2>	40676d: R_X86_64_PC32	_ftrace_branch+0x548d4
0ea2   406771:	bf 20 00 00 00       	mov    $0x20,%edi
0ea7   406776:	4c 89 fe             	mov    %r15,%rsi
0eaa   406779:	e8 00 00 00 00       	call   40677e <shrink_lruvec+0xeaf>	40677a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0eaf   40677e:	49 83 ff 20          	cmp    $0x20,%r15
0eb3   406782:	b8 20 00 00 00       	mov    $0x20,%eax
0eb8   406787:	49 0f 42 c7          	cmovb  %r15,%rax
0ebc   40678b:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
0ec1   406790:	49 29 c7             	sub    %rax,%r15
0ec4   406793:	4e 89 bc e4 70 01 00 00 	mov    %r15,0x170(%rsp,%r12,8)
0ecc   40679b:	44 89 e3             	mov    %r12d,%ebx
0ecf   40679e:	83 e3 fd             	and    $0xfffffffd,%ebx
0ed2   4067a1:	bf 01 00 00 00       	mov    $0x1,%edi
0ed7   4067a6:	89 de                	mov    %ebx,%esi
0ed9   4067a8:	e8 00 00 00 00       	call   4067ad <shrink_lruvec+0xede>	4067a9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0ede   4067ad:	83 fb 01             	cmp    $0x1,%ebx
0ee1   4067b0:	0f 85 c5 00 00 00    	jne    40687b <shrink_lruvec+0xfac>
0ee7   4067b6:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4067bd <shrink_lruvec+0xeee>	4067b9: R_X86_64_PC32	_ftrace_branch+0x54a24
0eee   4067bd:	48 ff c3             	inc    %rbx
0ef1   4067c0:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4067c3: R_X86_64_32S	_ftrace_branch+0x54a28
0ef8   4067c7:	e8 00 00 00 00       	call   4067cc <shrink_lruvec+0xefd>	4067c8: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0efd   4067cc:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4067d3 <shrink_lruvec+0xf04>	4067cf: R_X86_64_PC32	_ftrace_branch+0x54a24
0f04   4067d3:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
0f09   4067d8:	4c 89 ff             	mov    %r15,%rdi
0f0c   4067db:	e8 00 00 00 00       	call   4067e0 <shrink_lruvec+0xf11>	4067dc: R_X86_64_PLT32	__tsan_read2-0x4
0f11   4067e0:	45 0f b7 37          	movzwl (%r15),%r14d
0f15   4067e4:	44 89 e3             	mov    %r12d,%ebx
0f18   4067e7:	83 e3 fe             	and    $0xfffffffe,%ebx
0f1b   4067ea:	bf 02 00 00 00       	mov    $0x2,%edi
0f20   4067ef:	89 de                	mov    %ebx,%esi
0f22   4067f1:	e8 00 00 00 00       	call   4067f6 <shrink_lruvec+0xf27>	4067f2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0f27   4067f6:	83 fb 02             	cmp    $0x2,%ebx
0f2a   4067f9:	0f 94 c1             	sete   %cl
0f2d   4067fc:	bb 01 00 00 00       	mov    $0x1,%ebx
0f32   406801:	d3 e3                	shl    %cl,%ebx
0f34   406803:	44 89 f6             	mov    %r14d,%esi
0f37   406806:	21 de                	and    %ebx,%esi
0f39   406808:	31 ff                	xor    %edi,%edi
0f3b   40680a:	e8 00 00 00 00       	call   40680f <shrink_lruvec+0xf40>	40680b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0f40   40680f:	44 21 f3             	and    %r14d,%ebx
0f43   406812:	0f 84 87 05 00 00    	je     406d9f <shrink_lruvec+0x14d0>
0f49   406818:	e8 00 00 00 00       	call   40681d <shrink_lruvec+0xf4e>	406819: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f4e   40681d:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406824 <shrink_lruvec+0xf55>	406820: R_X86_64_PC32	_ftrace_branch+0x54a34
0f55   406824:	48 ff c3             	inc    %rbx
0f58   406827:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40682a: R_X86_64_32S	_ftrace_branch+0x54a38
0f5f   40682e:	e8 00 00 00 00       	call   406833 <shrink_lruvec+0xf64>	40682f: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0f64   406833:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40683a <shrink_lruvec+0xf6b>	406836: R_X86_64_PC32	_ftrace_branch+0x54a34
0f6b   40683a:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
0f70   40683f:	4c 89 ee             	mov    %r13,%rsi
0f73   406842:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
0f78   406847:	44 89 e1             	mov    %r12d,%ecx
0f7b   40684a:	e8 4a 7b 00 00       	call   40e399 <shrink_active_list>
0f80   40684f:	e9 7d 05 00 00       	jmp    406dd1 <shrink_lruvec+0x1502>
0f85   406854:	e8 00 00 00 00       	call   406859 <shrink_lruvec+0xf8a>	406855: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f8a   406859:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406860 <shrink_lruvec+0xf91>	40685c: R_X86_64_PC32	_ftrace_branch+0x548cc
0f91   406860:	48 ff c3             	inc    %rbx
0f94   406863:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406866: R_X86_64_32S	_ftrace_branch+0x548d0
0f9b   40686a:	e8 00 00 00 00       	call   40686f <shrink_lruvec+0xfa0>	40686b: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0fa0   40686f:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406876 <shrink_lruvec+0xfa7>	406872: R_X86_64_PC32	_ftrace_branch+0x548cc
0fa7   406876:	e9 dd 0c 00 00       	jmp    407558 <shrink_lruvec+0x1c89>
0fac   40687b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406882 <shrink_lruvec+0xfb3>	40687e: R_X86_64_PC32	_ftrace_branch+0x54a1c
0fb3   406882:	48 ff c3             	inc    %rbx
0fb6   406885:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406888: R_X86_64_32S	_ftrace_branch+0x54a20
0fbd   40688c:	e8 00 00 00 00       	call   406891 <shrink_lruvec+0xfc2>	40688d: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
0fc2   406891:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406898 <shrink_lruvec+0xfc9>	406894: R_X86_64_PC32	_ftrace_branch+0x54a1c
0fc9   406898:	48 8d 84 24 30 01 00 00 	lea    0x130(%rsp),%rax
0fd1   4068a0:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
0fd9   4068a8:	48 89 84 24 38 01 00 00 	mov    %rax,0x138(%rsp)
0fe1   4068b0:	48 c7 84 24 28 01 00 00 00 00 00 00 	movq   $0x0,0x128(%rsp)
0fed   4068bc:	ba 2c 00 00 00       	mov    $0x2c,%edx
0ff2   4068c1:	48 8d bc 24 a0 01 00 00 	lea    0x1a0(%rsp),%rdi
0ffa   4068c9:	31 f6                	xor    %esi,%esi
0ffc   4068cb:	e8 00 00 00 00       	call   4068d0 <shrink_lruvec+0x1001>	4068cc: R_X86_64_PLT32	memset-0x4
1001   4068d0:	45 89 e7             	mov    %r12d,%r15d
1004   4068d3:	41 83 e7 fe          	and    $0xfffffffe,%r15d
1008   4068d7:	bf 02 00 00 00       	mov    $0x2,%edi
100d   4068dc:	44 89 fe             	mov    %r15d,%esi
1010   4068df:	e8 00 00 00 00       	call   4068e4 <shrink_lruvec+0x1015>	4068e0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1015   4068e4:	41 83 ff 02          	cmp    $0x2,%r15d
1019   4068e8:	0f 94 44 24 40       	sete   0x40(%rsp)
101e   4068ed:	48 8b 9c 24 d8 00 00 00 	mov    0xd8(%rsp),%rbx
1026   4068f5:	48 89 df             	mov    %rbx,%rdi
1029   4068f8:	e8 00 00 00 00       	call   4068fd <shrink_lruvec+0x102e>	4068f9: R_X86_64_PLT32	__tsan_read8-0x4
102e   4068fd:	48 8b 03             	mov    (%rbx),%rax
1031   406900:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
1036   406905:	4c 8b 34 25 00 00 00 00 	mov    0x0,%r14	406909: R_X86_64_32S	current_task
103e   40690d:	49 8d 7e 2c          	lea    0x2c(%r14),%rdi
1042   406911:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
1047   406916:	e8 00 00 00 00       	call   40691b <shrink_lruvec+0x104c>	406917: R_X86_64_PLT32	__tsan_read4-0x4
104c   40691b:	41 8b 5e 2c          	mov    0x2c(%r14),%ebx
1050   40691f:	be 00 00 02 00       	mov    $0x20000,%esi
1055   406924:	21 de                	and    %ebx,%esi
1057   406926:	31 ff                	xor    %edi,%edi
1059   406928:	e8 00 00 00 00       	call   40692d <shrink_lruvec+0x105e>	406929: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
105e   40692d:	b8 00 00 02 00       	mov    $0x20000,%eax
1063   406932:	21 c3                	and    %eax,%ebx
1065   406934:	4c 89 64 24 28       	mov    %r12,0x28(%rsp)
106a   406939:	44 89 7c 24 38       	mov    %r15d,0x38(%rsp)
106f   40693e:	0f 85 41 03 00 00    	jne    406c85 <shrink_lruvec+0x13b6>
1075   406944:	4c 89 f0             	mov    %r14,%rax
1078   406947:	48 05 98 06 00 00    	add    $0x698,%rax
107e   40694d:	48 89 84 24 b8 00 00 00 	mov    %rax,0xb8(%rsp)
1086   406955:	31 c0                	xor    %eax,%eax
1088   406957:	41 83 ff 02          	cmp    $0x2,%r15d
108c   40695b:	0f 94 c0             	sete   %al
108f   40695e:	49 c7 c5 00 00 00 00 	mov    $0x0,%r13	406961: R_X86_64_32S	_ftrace_branch+0x54ad0
1096   406965:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	406968: R_X86_64_32S	_ftrace_branch+0x54ad8
109d   40696c:	4c 0f 44 e9          	cmove  %rcx,%r13
10a1   406970:	48 8d 04 c5 38 00 00 00 	lea    0x38(,%rax,8),%rax
10a9   406978:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
10ae   40697d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	406980: R_X86_64_32S	vm_node_stat+0x38
10b5   406984:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	406987: R_X86_64_32S	vm_node_stat+0x40
10bc   40698b:	48 0f 44 c8          	cmove  %rax,%rcx
10c0   40698f:	48 89 8c 24 c0 00 00 00 	mov    %rcx,0xc0(%rsp)
10c8   406997:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	40699a: R_X86_64_32S	vm_node_stat
10cf   40699e:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	4069a1: R_X86_64_32S	vm_node_stat+0x10
10d6   4069a5:	48 0f 44 c8          	cmove  %rax,%rcx
10da   4069a9:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
10df   4069ae:	c7 44 24 08 00 00 00 00 	movl   $0x0,0x8(%rsp)
10e7   4069b6:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
10ec   4069bb:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4069c2 <shrink_lruvec+0x10f3>	4069be: R_X86_64_PC32	_ftrace_branch+0x54aac
10f3   4069c2:	48 ff c3             	inc    %rbx
10f6   4069c5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4069c8: R_X86_64_32S	_ftrace_branch+0x54ab0
10fd   4069cc:	e8 00 00 00 00       	call   4069d1 <shrink_lruvec+0x1102>	4069cd: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1102   4069d1:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4069d8 <shrink_lruvec+0x1109>	4069d4: R_X86_64_PC32	_ftrace_branch+0x54aac
1109   4069d8:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
1111   4069e0:	48 89 df             	mov    %rbx,%rdi
1114   4069e3:	e8 00 00 00 00       	call   4069e8 <shrink_lruvec+0x1119>	4069e4: R_X86_64_PLT32	__tsan_read8-0x4
1119   4069e8:	48 83 3b 00          	cmpq   $0x0,(%rbx)
111d   4069ec:	74 70                	je     406a5e <shrink_lruvec+0x118f>
111f   4069ee:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4069f5 <shrink_lruvec+0x1126>	4069f1: R_X86_64_PC32	_ftrace_branch+0x5405c
1126   4069f5:	48 ff c3             	inc    %rbx
1129   4069f8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4069fb: R_X86_64_32S	_ftrace_branch+0x54060
1130   4069ff:	e8 00 00 00 00       	call   406a04 <shrink_lruvec+0x1135>	406a00: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1135   406a04:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406a0b <shrink_lruvec+0x113c>	406a07: R_X86_64_PC32	_ftrace_branch+0x5405c
113c   406a0b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406a0e: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
1143   406a12:	e8 00 00 00 00       	call   406a17 <shrink_lruvec+0x1148>	406a13: R_X86_64_PLT32	__tsan_volatile_read4-0x4
1148   406a17:	44 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15d        # 406a1e <shrink_lruvec+0x114f>	406a1a: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
114f   406a1e:	31 ff                	xor    %edi,%edi
1151   406a20:	44 89 fe             	mov    %r15d,%esi
1154   406a23:	e8 00 00 00 00       	call   406a28 <shrink_lruvec+0x1159>	406a24: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1159   406a28:	45 85 ff             	test   %r15d,%r15d
115c   406a2b:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	406a2e: R_X86_64_32S	_ftrace_branch+0x54070
1163   406a32:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	406a35: R_X86_64_32S	_ftrace_branch+0x54078
116a   406a39:	48 0f 4f d8          	cmovg  %rax,%rbx
116e   406a3d:	4c 8b 23             	mov    (%rbx),%r12
1171   406a40:	49 ff c4             	inc    %r12
1174   406a43:	48 89 df             	mov    %rbx,%rdi
1177   406a46:	e8 00 00 00 00       	call   406a4b <shrink_lruvec+0x117c>	406a47: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
117c   406a4b:	4c 89 23             	mov    %r12,(%rbx)
117f   406a4e:	45 85 ff             	test   %r15d,%r15d
1182   406a51:	0f 8e 26 0b 00 00    	jle    40757d <shrink_lruvec+0x1cae>
1188   406a57:	e8 00 00 00 00       	call   406a5c <shrink_lruvec+0x118d>	406a58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
118d   406a5c:	eb 22                	jmp    406a80 <shrink_lruvec+0x11b1>
118f   406a5e:	e8 00 00 00 00       	call   406a63 <shrink_lruvec+0x1194>	406a5f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1194   406a63:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406a6a <shrink_lruvec+0x119b>	406a66: R_X86_64_PC32	_ftrace_branch+0x54064
119b   406a6a:	48 ff c3             	inc    %rbx
119e   406a6d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406a70: R_X86_64_32S	_ftrace_branch+0x54068
11a5   406a74:	e8 00 00 00 00       	call   406a79 <shrink_lruvec+0x11aa>	406a75: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
11aa   406a79:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406a80 <shrink_lruvec+0x11b1>	406a7c: R_X86_64_PC32	_ftrace_branch+0x54064
11b1   406a80:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406a87 <shrink_lruvec+0x11b8>	406a83: R_X86_64_PC32	_ftrace_branch+0x54abc
11b8   406a87:	48 ff c3             	inc    %rbx
11bb   406a8a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406a8d: R_X86_64_32S	_ftrace_branch+0x54ac0
11c2   406a91:	e8 00 00 00 00       	call   406a96 <shrink_lruvec+0x11c7>	406a92: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
11c7   406a96:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406a9d <shrink_lruvec+0x11ce>	406a99: R_X86_64_PC32	_ftrace_branch+0x54abc
11ce   406a9d:	49 8b 5d 00          	mov    0x0(%r13),%rbx
11d2   406aa1:	48 ff c3             	inc    %rbx
11d5   406aa4:	4c 89 ef             	mov    %r13,%rdi
11d8   406aa7:	e8 00 00 00 00       	call   406aac <shrink_lruvec+0x11dd>	406aa8: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
11dd   406aac:	49 89 5d 00          	mov    %rbx,0x0(%r13)
11e1   406ab0:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
11e6   406ab5:	48 89 df             	mov    %rbx,%rdi
11e9   406ab8:	e8 00 00 00 00       	call   406abd <shrink_lruvec+0x11ee>	406ab9: R_X86_64_PLT32	__tsan_volatile_read8-0x4
11ee   406abd:	4c 8b 3b             	mov    (%rbx),%r15
11f1   406ac0:	48 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%rdi
11f9   406ac8:	e8 00 00 00 00       	call   406acd <shrink_lruvec+0x11fe>	406ac9: R_X86_64_PLT32	__tsan_volatile_read8-0x4
11fe   406acd:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
1203   406ad2:	4c 8b a0 00 00 00 00 	mov    0x0(%rax),%r12	406ad5: R_X86_64_32S	vm_node_stat
120a   406ad9:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
1212   406ae1:	48 89 df             	mov    %rbx,%rdi
1215   406ae4:	e8 00 00 00 00       	call   406ae9 <shrink_lruvec+0x121a>	406ae5: R_X86_64_PLT32	__tsan_read4-0x4
121a   406ae9:	8b 1b                	mov    (%rbx),%ebx
121c   406aeb:	41 be c0 00 00 00    	mov    $0xc0,%r14d
1222   406af1:	44 21 f3             	and    %r14d,%ebx
1225   406af4:	bf c0 00 00 00       	mov    $0xc0,%edi
122a   406af9:	89 de                	mov    %ebx,%esi
122c   406afb:	e8 00 00 00 00       	call   406b00 <shrink_lruvec+0x1231>	406afc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1231   406b00:	44 39 f3             	cmp    %r14d,%ebx
1234   406b03:	75 28                	jne    406b2d <shrink_lruvec+0x125e>
1236   406b05:	e8 00 00 00 00       	call   406b0a <shrink_lruvec+0x123b>	406b06: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
123b   406b0a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406b11 <shrink_lruvec+0x1242>	406b0d: R_X86_64_PC32	_ftrace_branch+0x54ae4
1242   406b11:	48 ff c3             	inc    %rbx
1245   406b14:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406b17: R_X86_64_32S	_ftrace_branch+0x54ae8
124c   406b1b:	e8 00 00 00 00       	call   406b20 <shrink_lruvec+0x1251>	406b1c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1251   406b20:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406b27 <shrink_lruvec+0x1258>	406b23: R_X86_64_PC32	_ftrace_branch+0x54ae4
1258   406b27:	49 c1 ef 03          	shr    $0x3,%r15
125c   406b2b:	eb 22                	jmp    406b4f <shrink_lruvec+0x1280>
125e   406b2d:	e8 00 00 00 00       	call   406b32 <shrink_lruvec+0x1263>	406b2e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1263   406b32:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406b39 <shrink_lruvec+0x126a>	406b35: R_X86_64_PC32	_ftrace_branch+0x54adc
126a   406b39:	48 ff c3             	inc    %rbx
126d   406b3c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406b3f: R_X86_64_32S	_ftrace_branch+0x54ae0
1274   406b43:	e8 00 00 00 00       	call   406b48 <shrink_lruvec+0x1279>	406b44: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1279   406b48:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406b4f <shrink_lruvec+0x1280>	406b4b: R_X86_64_PC32	_ftrace_branch+0x54adc
1280   406b4f:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
1285   406b54:	4c 89 e7             	mov    %r12,%rdi
1288   406b57:	4c 89 fe             	mov    %r15,%rsi
128b   406b5a:	e8 00 00 00 00       	call   406b5f <shrink_lruvec+0x1290>	406b5b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1290   406b5f:	31 f6                	xor    %esi,%esi
1292   406b61:	4d 39 fc             	cmp    %r15,%r12
1295   406b64:	40 0f 97 c6          	seta   %sil
1299   406b68:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406b6b: R_X86_64_32S	_ftrace_annotated_branch+0x3a920
12a0   406b6f:	31 d2                	xor    %edx,%edx
12a2   406b71:	31 c9                	xor    %ecx,%ecx
12a4   406b73:	e8 00 00 00 00       	call   406b78 <shrink_lruvec+0x12a9>	406b74: R_X86_64_PLT32	ftrace_likely_update-0x4
12a9   406b78:	4d 39 fc             	cmp    %r15,%r12
12ac   406b7b:	0f 86 1f 09 00 00    	jbe    4074a0 <shrink_lruvec+0x1bd1>
12b2   406b81:	f6 44 24 08 01       	testb  $0x1,0x8(%rsp)
12b7   406b86:	44 8b 7c 24 38       	mov    0x38(%rsp),%r15d
12bc   406b8b:	0f 85 23 09 00 00    	jne    4074b4 <shrink_lruvec+0x1be5>
12c2   406b91:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406b98 <shrink_lruvec+0x12c9>	406b94: R_X86_64_PC32	_ftrace_branch+0x54a3c
12c9   406b98:	48 ff c3             	inc    %rbx
12cc   406b9b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406b9e: R_X86_64_32S	_ftrace_branch+0x54a40
12d3   406ba2:	e8 00 00 00 00       	call   406ba7 <shrink_lruvec+0x12d8>	406ba3: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
12d8   406ba7:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406bae <shrink_lruvec+0x12df>	406baa: R_X86_64_PC32	_ftrace_branch+0x54a3c
12df   406bae:	bf 64 00 00 00       	mov    $0x64,%edi
12e4   406bb3:	e8 00 00 00 00       	call   406bb8 <shrink_lruvec+0x12e9>	406bb4: R_X86_64_PLT32	msleep-0x4
12e9   406bb8:	4c 89 f7             	mov    %r14,%rdi
12ec   406bbb:	e8 00 00 00 00       	call   406bc0 <shrink_lruvec+0x12f1>	406bbc: R_X86_64_PLT32	__tsan_volatile_read8-0x4
12f1   406bc0:	4d 8b 36             	mov    (%r14),%r14
12f4   406bc3:	44 89 f3             	mov    %r14d,%ebx
12f7   406bc6:	c1 eb 02             	shr    $0x2,%ebx
12fa   406bc9:	83 e3 01             	and    $0x1,%ebx
12fd   406bcc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406bcf: R_X86_64_32S	_ftrace_annotated_branch+0x3a290
1304   406bd3:	89 de                	mov    %ebx,%esi
1306   406bd5:	31 d2                	xor    %edx,%edx
1308   406bd7:	31 c9                	xor    %ecx,%ecx
130a   406bd9:	e8 00 00 00 00       	call   406bde <shrink_lruvec+0x130f>	406bda: R_X86_64_PLT32	ftrace_likely_update-0x4
130f   406bde:	31 ff                	xor    %edi,%edi
1311   406be0:	89 de                	mov    %ebx,%esi
1313   406be2:	e8 00 00 00 00       	call   406be7 <shrink_lruvec+0x1318>	406be3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1318   406be7:	41 0f ba e6 02       	bt     $0x2,%r14d
131d   406bec:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
1322   406bf1:	72 07                	jb     406bfa <shrink_lruvec+0x132b>
1324   406bf3:	e8 00 00 00 00       	call   406bf8 <shrink_lruvec+0x1329>	406bf4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1329   406bf8:	eb 47                	jmp    406c41 <shrink_lruvec+0x1372>
132b   406bfa:	48 8b 9c 24 b8 00 00 00 	mov    0xb8(%rsp),%rbx
1333   406c02:	48 89 df             	mov    %rbx,%rdi
1336   406c05:	e8 00 00 00 00       	call   406c0a <shrink_lruvec+0x133b>	406c06: R_X86_64_PLT32	__tsan_read8-0x4
133b   406c0a:	44 8b 33             	mov    (%rbx),%r14d
133e   406c0d:	44 89 f3             	mov    %r14d,%ebx
1341   406c10:	c1 eb 08             	shr    $0x8,%ebx
1344   406c13:	83 e3 01             	and    $0x1,%ebx
1347   406c16:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406c19: R_X86_64_32S	_ftrace_annotated_branch+0x3a2c0
134e   406c1d:	89 de                	mov    %ebx,%esi
1350   406c1f:	31 d2                	xor    %edx,%edx
1352   406c21:	31 c9                	xor    %ecx,%ecx
1354   406c23:	e8 00 00 00 00       	call   406c28 <shrink_lruvec+0x1359>	406c24: R_X86_64_PLT32	ftrace_likely_update-0x4
1359   406c28:	31 ff                	xor    %edi,%edi
135b   406c2a:	89 de                	mov    %ebx,%esi
135d   406c2c:	e8 00 00 00 00       	call   406c31 <shrink_lruvec+0x1362>	406c2d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1362   406c31:	41 0f ba e6 08       	bt     $0x8,%r14d
1367   406c36:	0f 82 57 09 00 00    	jb     407593 <shrink_lruvec+0x1cc4>
136d   406c3c:	e8 00 00 00 00       	call   406c41 <shrink_lruvec+0x1372>	406c3d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1372   406c41:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406c48 <shrink_lruvec+0x1379>	406c44: R_X86_64_PC32	_ftrace_branch+0x54a4c
1379   406c48:	48 ff c3             	inc    %rbx
137c   406c4b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406c4e: R_X86_64_32S	_ftrace_branch+0x54a50
1383   406c52:	e8 00 00 00 00       	call   406c57 <shrink_lruvec+0x1388>	406c53: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1388   406c57:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406c5e <shrink_lruvec+0x138f>	406c5a: R_X86_64_PC32	_ftrace_branch+0x54a4c
138f   406c5e:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
1394   406c63:	48 89 df             	mov    %rbx,%rdi
1397   406c66:	e8 00 00 00 00       	call   406c6b <shrink_lruvec+0x139c>	406c67: R_X86_64_PLT32	__tsan_read4-0x4
139c   406c6b:	f6 43 02 02          	testb  $0x2,0x2(%rbx)
13a0   406c6f:	0f 85 fe 08 00 00    	jne    407573 <shrink_lruvec+0x1ca4>
13a6   406c75:	e8 00 00 00 00       	call   406c7a <shrink_lruvec+0x13ab>	406c76: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
13ab   406c7a:	b0 01                	mov    $0x1,%al
13ad   406c7c:	89 44 24 08          	mov    %eax,0x8(%rsp)
13b1   406c80:	e9 36 fd ff ff       	jmp    4069bb <shrink_lruvec+0x10ec>
13b6   406c85:	e8 00 00 00 00       	call   406c8a <shrink_lruvec+0x13bb>	406c86: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
13bb   406c8a:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	406c8d: R_X86_64_32S	_ftrace_branch+0x54ab8
13c2   406c91:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
13c7   406c96:	49 8b 1e             	mov    (%r14),%rbx
13ca   406c99:	48 ff c3             	inc    %rbx
13cd   406c9c:	4c 89 f7             	mov    %r14,%rdi
13d0   406c9f:	e8 00 00 00 00       	call   406ca4 <shrink_lruvec+0x13d5>	406ca0: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
13d5   406ca4:	49 89 1e             	mov    %rbx,(%r14)
13d8   406ca7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406caa: R_X86_64_32S	_ftrace_annotated_branch+0x3a920
13df   406cae:	31 f6                	xor    %esi,%esi
13e1   406cb0:	31 d2                	xor    %edx,%edx
13e3   406cb2:	31 c9                	xor    %ecx,%ecx
13e5   406cb4:	e8 00 00 00 00       	call   406cb9 <shrink_lruvec+0x13ea>	406cb5: R_X86_64_PLT32	ftrace_likely_update-0x4
13ea   406cb9:	45 31 e4             	xor    %r12d,%r12d
13ed   406cbc:	41 83 ff 02          	cmp    $0x2,%r15d
13f1   406cc0:	41 0f 94 c4          	sete   %r12b
13f5   406cc4:	e8 00 00 00 00       	call   406cc9 <shrink_lruvec+0x13fa>	406cc5: R_X86_64_PLT32	lru_add_drain-0x4
13fa   406cc9:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
13ff   406cce:	e8 00 00 00 00       	call   406cd3 <shrink_lruvec+0x1404>	406ccf: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
1404   406cd3:	4c 89 ef             	mov    %r13,%rdi
1407   406cd6:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
140c   406cdb:	48 8d 94 24 30 01 00 00 	lea    0x130(%rsp),%rdx
1414   406ce3:	48 8d 8c 24 28 01 00 00 	lea    0x128(%rsp),%rcx
141c   406ceb:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
1421   406cf0:	4d 89 e8             	mov    %r13,%r8
1424   406cf3:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
1429   406cf8:	e8 9d 84 00 00       	call   40f19a <isolate_lru_pages>
142e   406cfd:	49 89 c6             	mov    %rax,%r14
1431   406d00:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406d07 <shrink_lruvec+0x1438>	406d03: R_X86_64_PC32	_ftrace_branch+0x54314
1438   406d07:	48 ff c3             	inc    %rbx
143b   406d0a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406d0d: R_X86_64_32S	_ftrace_branch+0x54318
1442   406d11:	e8 00 00 00 00       	call   406d16 <shrink_lruvec+0x1447>	406d12: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1447   406d16:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406d1d <shrink_lruvec+0x144e>	406d19: R_X86_64_PC32	_ftrace_branch+0x54314
144e   406d1d:	4c 89 74 24 08       	mov    %r14,0x8(%rsp)
1453   406d22:	49 63 c6             	movslq %r14d,%rax
1456   406d25:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
145b   406d2a:	4a 01 84 e1 70 10 00 00 	add    %rax,0x1070(%rcx,%r12,8)
1463   406d32:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
1468   406d37:	4a 01 04 e5 00 00 00 00 	add    %rax,0x0(,%r12,8)	406d3b: R_X86_64_32S	vm_node_stat+0x38
1470   406d3f:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
1475   406d44:	48 89 df             	mov    %rbx,%rdi
1478   406d47:	e8 00 00 00 00       	call   406d4c <shrink_lruvec+0x147d>	406d48: R_X86_64_PLT32	__tsan_read4-0x4
147d   406d4c:	45 31 ff             	xor    %r15d,%r15d
1480   406d4f:	8b 33                	mov    (%rbx),%esi
1482   406d51:	b8 00 00 02 00       	mov    $0x20000,%eax
1487   406d56:	21 c6                	and    %eax,%esi
1489   406d58:	41 0f 94 c7          	sete   %r15b
148d   406d5c:	31 ff                	xor    %edi,%edi
148f   406d5e:	e8 00 00 00 00       	call   406d63 <shrink_lruvec+0x1494>	406d5f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1494   406d63:	41 83 cf 1a          	or     $0x1a,%r15d
1498   406d67:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
14a0   406d6f:	e8 00 00 00 00       	call   406d74 <shrink_lruvec+0x14a5>	406d70: R_X86_64_PLT32	__tsan_read8-0x4
14a5   406d74:	49 83 7d 10 00       	cmpq   $0x0,0x10(%r13)
14aa   406d79:	74 5e                	je     406dd9 <shrink_lruvec+0x150a>
14ac   406d7b:	e8 00 00 00 00       	call   406d80 <shrink_lruvec+0x14b1>	406d7c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14b1   406d80:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406d87 <shrink_lruvec+0x14b8>	406d83: R_X86_64_PC32	_ftrace_branch+0x54a5c
14b8   406d87:	48 ff c3             	inc    %rbx
14bb   406d8a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406d8d: R_X86_64_32S	_ftrace_branch+0x54a60
14c2   406d91:	e8 00 00 00 00       	call   406d96 <shrink_lruvec+0x14c7>	406d92: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
14c7   406d96:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406d9d <shrink_lruvec+0x14ce>	406d99: R_X86_64_PC32	_ftrace_branch+0x54a5c
14ce   406d9d:	eb 6f                	jmp    406e0e <shrink_lruvec+0x153f>
14d0   406d9f:	e8 00 00 00 00       	call   406da4 <shrink_lruvec+0x14d5>	406da0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
14d5   406da4:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406dab <shrink_lruvec+0x14dc>	406da7: R_X86_64_PC32	_ftrace_branch+0x54a2c
14dc   406dab:	48 ff c3             	inc    %rbx
14df   406dae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406db1: R_X86_64_32S	_ftrace_branch+0x54a30
14e6   406db5:	e8 00 00 00 00       	call   406dba <shrink_lruvec+0x14eb>	406db6: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
14eb   406dba:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406dc1 <shrink_lruvec+0x14f2>	406dbd: R_X86_64_PC32	_ftrace_branch+0x54a2c
14f2   406dc1:	41 83 ce 08          	or     $0x8,%r14d
14f6   406dc5:	4c 89 ff             	mov    %r15,%rdi
14f9   406dc8:	e8 00 00 00 00       	call   406dcd <shrink_lruvec+0x14fe>	406dc9: R_X86_64_PLT32	__tsan_write2-0x4
14fe   406dcd:	66 45 89 37          	mov    %r14w,(%r15)
1502   406dd1:	45 31 ff             	xor    %r15d,%r15d
1505   406dd4:	e9 7a 07 00 00       	jmp    407553 <shrink_lruvec+0x1c84>
150a   406dd9:	e8 00 00 00 00       	call   406dde <shrink_lruvec+0x150f>	406dda: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
150f   406dde:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406de5 <shrink_lruvec+0x1516>	406de1: R_X86_64_PC32	_ftrace_branch+0x54a64
1516   406de5:	48 ff c3             	inc    %rbx
1519   406de8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406deb: R_X86_64_32S	_ftrace_branch+0x54a68
1520   406def:	e8 00 00 00 00       	call   406df4 <shrink_lruvec+0x1525>	406df0: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1525   406df4:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406dfb <shrink_lruvec+0x152c>	406df7: R_X86_64_PC32	_ftrace_branch+0x54a64
152c   406dfb:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
1534   406e03:	44 89 f9             	mov    %r15d,%ecx
1537   406e06:	48 01 04 cd 00 00 00 00 	add    %rax,0x0(,%rcx,8)	406e0a: R_X86_64_32S	vm_event_states
153f   406e0e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406e11: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1546   406e15:	e8 00 00 00 00       	call   406e1a <shrink_lruvec+0x154b>	406e16: R_X86_64_PLT32	__tsan_volatile_read4-0x4
154b   406e1a:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 406e20 <shrink_lruvec+0x1551>	406e1c: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
1551   406e20:	bf 01 00 00 00       	mov    $0x1,%edi
1556   406e25:	89 de                	mov    %ebx,%esi
1558   406e27:	e8 00 00 00 00       	call   406e2c <shrink_lruvec+0x155d>	406e28: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
155d   406e2c:	85 db                	test   %ebx,%ebx
155f   406e2e:	4c 8b 6c 24 78       	mov    0x78(%rsp),%r13
1564   406e33:	7e 37                	jle    406e6c <shrink_lruvec+0x159d>
1566   406e35:	e8 00 00 00 00       	call   406e3a <shrink_lruvec+0x156b>	406e36: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
156b   406e3a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406e41 <shrink_lruvec+0x1572>	406e3d: R_X86_64_PC32	_ftrace_branch+0x549ac
1572   406e41:	48 ff c3             	inc    %rbx
1575   406e44:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406e47: R_X86_64_32S	_ftrace_branch+0x549b0
157c   406e4b:	e8 00 00 00 00       	call   406e50 <shrink_lruvec+0x1581>	406e4c: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1581   406e50:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406e57 <shrink_lruvec+0x1588>	406e53: R_X86_64_PC32	_ftrace_branch+0x549ac
1588   406e57:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
1590   406e5f:	48 89 df             	mov    %rbx,%rdi
1593   406e62:	e8 00 00 00 00       	call   406e67 <shrink_lruvec+0x1598>	406e63: R_X86_64_PLT32	__tsan_read8-0x4
1598   406e67:	48 8b 3b             	mov    (%rbx),%rdi
159b   406e6a:	eb 24                	jmp    406e90 <shrink_lruvec+0x15c1>
159d   406e6c:	e8 00 00 00 00       	call   406e71 <shrink_lruvec+0x15a2>	406e6d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15a2   406e71:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406e78 <shrink_lruvec+0x15a9>	406e74: R_X86_64_PC32	_ftrace_branch+0x549b4
15a9   406e78:	48 ff c3             	inc    %rbx
15ac   406e7b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406e7e: R_X86_64_32S	_ftrace_branch+0x549b8
15b3   406e82:	e8 00 00 00 00       	call   406e87 <shrink_lruvec+0x15b8>	406e83: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
15b8   406e87:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406e8e <shrink_lruvec+0x15bf>	406e8a: R_X86_64_PC32	_ftrace_branch+0x549b4
15bf   406e8e:	31 ff                	xor    %edi,%edi
15c1   406e90:	31 db                	xor    %ebx,%ebx
15c3   406e92:	83 7c 24 38 02       	cmpl   $0x2,0x38(%rsp)
15c8   406e97:	0f 94 c3             	sete   %bl
15cb   406e9a:	4c 8b b4 24 28 01 00 00 	mov    0x128(%rsp),%r14
15d3   406ea2:	44 89 fe             	mov    %r15d,%esi
15d6   406ea5:	4c 89 f2             	mov    %r14,%rdx
15d9   406ea8:	e8 00 00 00 00       	call   406ead <shrink_lruvec+0x15de>	406ea9: R_X86_64_PLT32	__count_memcg_events-0x4
15de   406ead:	4c 01 34 dd 00 00 00 00 	add    %r14,0x0(,%rbx,8)	406eb1: R_X86_64_32S	vm_event_states+0xe8
15e6   406eb5:	4c 89 ef             	mov    %r13,%rdi
15e9   406eb8:	e8 00 00 00 00       	call   406ebd <shrink_lruvec+0x15ee>	406eb9: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
15ee   406ebd:	31 ff                	xor    %edi,%edi
15f0   406ebf:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
15f5   406ec4:	4c 89 e6             	mov    %r12,%rsi
15f8   406ec7:	e8 00 00 00 00       	call   406ecc <shrink_lruvec+0x15fd>	406ec8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
15fd   406ecc:	4d 85 e4             	test   %r12,%r12
1600   406ecf:	0f 84 0e 01 00 00    	je     406fe3 <shrink_lruvec+0x1714>
1606   406ed5:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
160b   406eda:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
1610   406edf:	49 83 c6 07          	add    $0x7,%r14
1614   406ee3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406eea <shrink_lruvec+0x161b>	406ee6: R_X86_64_PC32	_ftrace_branch+0x54a6c
161b   406eea:	48 ff c3             	inc    %rbx
161e   406eed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406ef0: R_X86_64_32S	_ftrace_branch+0x54a70
1625   406ef4:	e8 00 00 00 00       	call   406ef9 <shrink_lruvec+0x162a>	406ef5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
162a   406ef9:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406f00 <shrink_lruvec+0x1631>	406efc: R_X86_64_PC32	_ftrace_branch+0x54a6c
1631   406f00:	48 8d 9c 24 30 01 00 00 	lea    0x130(%rsp),%rbx
1639   406f08:	48 89 df             	mov    %rbx,%rdi
163c   406f0b:	4c 8b 7c 24 48       	mov    0x48(%rsp),%r15
1641   406f10:	4c 89 fe             	mov    %r15,%rsi
1644   406f13:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
1649   406f18:	48 8d 8c 24 a0 01 00 00 	lea    0x1a0(%rsp),%rcx
1651   406f20:	45 31 c0             	xor    %r8d,%r8d
1654   406f23:	e8 ff 6f ff ff       	call   3fdf27 <shrink_page_list>
1659   406f28:	89 44 24 20          	mov    %eax,0x20(%rsp)
165d   406f2c:	4c 89 ef             	mov    %r13,%rdi
1660   406f2f:	e8 00 00 00 00       	call   406f34 <shrink_lruvec+0x1665>	406f30: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
1665   406f34:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
166a   406f39:	48 89 de             	mov    %rbx,%rsi
166d   406f3c:	e8 ba 92 00 00       	call   4101fb <move_pages_to_lru>
1672   406f41:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406f48 <shrink_lruvec+0x1679>	406f44: R_X86_64_PC32	_ftrace_branch+0x54314
1679   406f48:	48 ff c3             	inc    %rbx
167c   406f4b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406f4e: R_X86_64_32S	_ftrace_branch+0x54318
1683   406f52:	e8 00 00 00 00       	call   406f57 <shrink_lruvec+0x1688>	406f53: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1688   406f57:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406f5e <shrink_lruvec+0x168f>	406f5a: R_X86_64_PC32	_ftrace_branch+0x54314
168f   406f5e:	49 c1 e4 20          	shl    $0x20,%r12
1693   406f62:	49 f7 dc             	neg    %r12
1696   406f65:	49 c1 fc 20          	sar    $0x20,%r12
169a   406f69:	4f 01 a4 f7 38 10 00 00 	add    %r12,0x1038(%r15,%r14,8)
16a2   406f71:	4e 01 24 f5 00 00 00 00 	add    %r12,0x0(,%r14,8)	406f75: R_X86_64_32S	vm_node_stat
16aa   406f79:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
16af   406f7e:	48 89 df             	mov    %rbx,%rdi
16b2   406f81:	e8 00 00 00 00       	call   406f86 <shrink_lruvec+0x16b7>	406f82: R_X86_64_PLT32	__tsan_read4-0x4
16b7   406f86:	45 31 e4             	xor    %r12d,%r12d
16ba   406f89:	8b 33                	mov    (%rbx),%esi
16bc   406f8b:	b8 00 00 02 00       	mov    $0x20000,%eax
16c1   406f90:	21 c6                	and    %eax,%esi
16c3   406f92:	41 0f 94 c4          	sete   %r12b
16c7   406f96:	31 ff                	xor    %edi,%edi
16c9   406f98:	e8 00 00 00 00       	call   406f9d <shrink_lruvec+0x16ce>	406f99: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
16ce   406f9d:	41 83 cc 16          	or     $0x16,%r12d
16d2   406fa1:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
16da   406fa9:	e8 00 00 00 00       	call   406fae <shrink_lruvec+0x16df>	406faa: R_X86_64_PLT32	__tsan_read8-0x4
16df   406fae:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
16e4   406fb3:	48 83 78 10 00       	cmpq   $0x0,0x10(%rax)
16e9   406fb8:	44 8b 7c 24 20       	mov    0x20(%rsp),%r15d
16ee   406fbd:	74 4b                	je     40700a <shrink_lruvec+0x173b>
16f0   406fbf:	e8 00 00 00 00       	call   406fc4 <shrink_lruvec+0x16f5>	406fc0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
16f5   406fc4:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406fcb <shrink_lruvec+0x16fc>	406fc7: R_X86_64_PC32	_ftrace_branch+0x54a7c
16fc   406fcb:	48 ff c3             	inc    %rbx
16ff   406fce:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406fd1: R_X86_64_32S	_ftrace_branch+0x54a80
1706   406fd5:	e8 00 00 00 00       	call   406fda <shrink_lruvec+0x170b>	406fd6: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
170b   406fda:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 406fe1 <shrink_lruvec+0x1712>	406fdd: R_X86_64_PC32	_ftrace_branch+0x54a7c
1712   406fe1:	eb 54                	jmp    407037 <shrink_lruvec+0x1768>
1714   406fe3:	e8 00 00 00 00       	call   406fe8 <shrink_lruvec+0x1719>	406fe4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1719   406fe8:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 406fef <shrink_lruvec+0x1720>	406feb: R_X86_64_PC32	_ftrace_branch+0x54a74
1720   406fef:	48 ff c3             	inc    %rbx
1723   406ff2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	406ff5: R_X86_64_32S	_ftrace_branch+0x54a78
172a   406ff9:	e8 00 00 00 00       	call   406ffe <shrink_lruvec+0x172f>	406ffa: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
172f   406ffe:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407005 <shrink_lruvec+0x1736>	407001: R_X86_64_PC32	_ftrace_branch+0x54a74
1736   407005:	e9 cc 04 00 00       	jmp    4074d6 <shrink_lruvec+0x1c07>
173b   40700a:	e8 00 00 00 00       	call   40700f <shrink_lruvec+0x1740>	40700b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1740   40700f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407016 <shrink_lruvec+0x1747>	407012: R_X86_64_PC32	_ftrace_branch+0x54a84
1747   407016:	48 ff c3             	inc    %rbx
174a   407019:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40701c: R_X86_64_32S	_ftrace_branch+0x54a88
1751   407020:	e8 00 00 00 00       	call   407025 <shrink_lruvec+0x1756>	407021: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1756   407025:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40702c <shrink_lruvec+0x175d>	407028: R_X86_64_PC32	_ftrace_branch+0x54a84
175d   40702c:	44 89 e0             	mov    %r12d,%eax
1760   40702f:	4c 01 3c c5 00 00 00 00 	add    %r15,0x0(,%rax,8)	407033: R_X86_64_32S	vm_event_states
1768   407037:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40703a: R_X86_64_32S	memory_cgrp_subsys_enabled_key
176f   40703e:	e8 00 00 00 00       	call   407043 <shrink_lruvec+0x1774>	40703f: R_X86_64_PLT32	__tsan_volatile_read4-0x4
1774   407043:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 407049 <shrink_lruvec+0x177a>	407045: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
177a   407049:	bf 01 00 00 00       	mov    $0x1,%edi
177f   40704e:	89 de                	mov    %ebx,%esi
1781   407050:	e8 00 00 00 00       	call   407055 <shrink_lruvec+0x1786>	407051: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1786   407055:	85 db                	test   %ebx,%ebx
1788   407057:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
178d   40705c:	7e 37                	jle    407095 <shrink_lruvec+0x17c6>
178f   40705e:	e8 00 00 00 00       	call   407063 <shrink_lruvec+0x1794>	40705f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1794   407063:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40706a <shrink_lruvec+0x179b>	407066: R_X86_64_PC32	_ftrace_branch+0x549ac
179b   40706a:	48 ff c3             	inc    %rbx
179e   40706d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407070: R_X86_64_32S	_ftrace_branch+0x549b0
17a5   407074:	e8 00 00 00 00       	call   407079 <shrink_lruvec+0x17aa>	407075: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
17aa   407079:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407080 <shrink_lruvec+0x17b1>	40707c: R_X86_64_PC32	_ftrace_branch+0x549ac
17b1   407080:	48 8b 9c 24 98 00 00 00 	mov    0x98(%rsp),%rbx
17b9   407088:	48 89 df             	mov    %rbx,%rdi
17bc   40708b:	e8 00 00 00 00       	call   407090 <shrink_lruvec+0x17c1>	40708c: R_X86_64_PLT32	__tsan_read8-0x4
17c1   407090:	48 8b 3b             	mov    (%rbx),%rdi
17c4   407093:	eb 24                	jmp    4070b9 <shrink_lruvec+0x17ea>
17c6   407095:	e8 00 00 00 00       	call   40709a <shrink_lruvec+0x17cb>	407096: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17cb   40709a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4070a1 <shrink_lruvec+0x17d2>	40709d: R_X86_64_PC32	_ftrace_branch+0x549b4
17d2   4070a1:	48 ff c3             	inc    %rbx
17d5   4070a4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4070a7: R_X86_64_32S	_ftrace_branch+0x549b8
17dc   4070ab:	e8 00 00 00 00       	call   4070b0 <shrink_lruvec+0x17e1>	4070ac: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
17e1   4070b0:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4070b7 <shrink_lruvec+0x17e8>	4070b3: R_X86_64_PC32	_ftrace_branch+0x549b4
17e8   4070b7:	31 ff                	xor    %edi,%edi
17ea   4070b9:	31 db                	xor    %ebx,%ebx
17ec   4070bb:	83 7c 24 38 02       	cmpl   $0x2,0x38(%rsp)
17f1   4070c0:	0f 94 c3             	sete   %bl
17f4   4070c3:	44 89 e6             	mov    %r12d,%esi
17f7   4070c6:	4c 89 fa             	mov    %r15,%rdx
17fa   4070c9:	e8 00 00 00 00       	call   4070ce <shrink_lruvec+0x17ff>	4070ca: R_X86_64_PLT32	__count_memcg_events-0x4
17ff   4070ce:	4c 01 3c dd 00 00 00 00 	add    %r15,0x0(,%rbx,8)	4070d2: R_X86_64_32S	vm_event_states+0xf8
1807   4070d6:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
180c   4070db:	e8 00 00 00 00       	call   4070e0 <shrink_lruvec+0x1811>	4070dc: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
1811   4070e0:	8b 94 24 b4 01 00 00 	mov    0x1b4(%rsp),%edx
1818   4070e7:	4c 89 ef             	mov    %r13,%rdi
181b   4070ea:	89 de                	mov    %ebx,%esi
181d   4070ec:	e8 00 00 00 00       	call   4070f1 <shrink_lruvec+0x1822>	4070ed: R_X86_64_PLT32	lru_note_cost-0x4
1822   4070f1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4070f4: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1829   4070f8:	e8 00 00 00 00       	call   4070fd <shrink_lruvec+0x182e>	4070f9: R_X86_64_PLT32	__tsan_volatile_read4-0x4
182e   4070fd:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 407103 <shrink_lruvec+0x1834>	4070ff: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
1834   407103:	bf 01 00 00 00       	mov    $0x1,%edi
1839   407108:	89 de                	mov    %ebx,%esi
183b   40710a:	e8 00 00 00 00       	call   40710f <shrink_lruvec+0x1840>	40710b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1840   40710f:	85 db                	test   %ebx,%ebx
1842   407111:	7e 34                	jle    407147 <shrink_lruvec+0x1878>
1844   407113:	e8 00 00 00 00       	call   407118 <shrink_lruvec+0x1849>	407114: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1849   407118:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40711f <shrink_lruvec+0x1850>	40711b: R_X86_64_PC32	_ftrace_branch+0x542f4
1850   40711f:	48 ff c3             	inc    %rbx
1853   407122:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407125: R_X86_64_32S	_ftrace_branch+0x542f8
185a   407129:	e8 00 00 00 00       	call   40712e <shrink_lruvec+0x185f>	40712a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
185f   40712e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407135 <shrink_lruvec+0x1866>	407131: R_X86_64_PC32	_ftrace_branch+0x542f4
1866   407135:	48 8d 9c 24 30 01 00 00 	lea    0x130(%rsp),%rbx
186e   40713d:	48 89 df             	mov    %rbx,%rdi
1871   407140:	e8 00 00 00 00       	call   407145 <shrink_lruvec+0x1876>	407141: R_X86_64_PLT32	__mem_cgroup_uncharge_list-0x4
1876   407145:	eb 2a                	jmp    407171 <shrink_lruvec+0x18a2>
1878   407147:	e8 00 00 00 00       	call   40714c <shrink_lruvec+0x187d>	407148: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
187d   40714c:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407153 <shrink_lruvec+0x1884>	40714f: R_X86_64_PC32	_ftrace_branch+0x542fc
1884   407153:	48 ff c3             	inc    %rbx
1887   407156:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407159: R_X86_64_32S	_ftrace_branch+0x54300
188e   40715d:	e8 00 00 00 00       	call   407162 <shrink_lruvec+0x1893>	40715e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1893   407162:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407169 <shrink_lruvec+0x189a>	407165: R_X86_64_PC32	_ftrace_branch+0x542fc
189a   407169:	48 8d 9c 24 30 01 00 00 	lea    0x130(%rsp),%rbx
18a2   407171:	4c 8b 74 24 08       	mov    0x8(%rsp),%r14
18a7   407176:	48 89 df             	mov    %rbx,%rdi
18aa   407179:	e8 00 00 00 00       	call   40717e <shrink_lruvec+0x18af>	40717a: R_X86_64_PLT32	free_unref_page_list-0x4
18af   40717e:	44 8b ac 24 a4 01 00 00 	mov    0x1a4(%rsp),%r13d
18b7   407186:	4c 89 f7             	mov    %r14,%rdi
18ba   407189:	4c 89 ee             	mov    %r13,%rsi
18bd   40718c:	e8 00 00 00 00       	call   407191 <shrink_lruvec+0x18c2>	40718d: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
18c2   407191:	4d 39 ee             	cmp    %r13,%r14
18c5   407194:	75 2e                	jne    4071c4 <shrink_lruvec+0x18f5>
18c7   407196:	e8 00 00 00 00       	call   40719b <shrink_lruvec+0x18cc>	407197: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18cc   40719b:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 4071a2 <shrink_lruvec+0x18d3>	40719e: R_X86_64_PC32	_ftrace_branch+0x54a94
18d3   4071a2:	49 ff c4             	inc    %r12
18d6   4071a5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4071a8: R_X86_64_32S	_ftrace_branch+0x54a98
18dd   4071ac:	e8 00 00 00 00       	call   4071b1 <shrink_lruvec+0x18e2>	4071ad: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
18e2   4071b1:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 4071b8 <shrink_lruvec+0x18e9>	4071b4: R_X86_64_PC32	_ftrace_branch+0x54a94
18e9   4071b8:	bf 01 00 00 00       	mov    $0x1,%edi
18ee   4071bd:	e8 00 00 00 00       	call   4071c2 <shrink_lruvec+0x18f3>	4071be: R_X86_64_PLT32	wakeup_flusher_threads-0x4
18f3   4071c2:	eb 22                	jmp    4071e6 <shrink_lruvec+0x1917>
18f5   4071c4:	e8 00 00 00 00       	call   4071c9 <shrink_lruvec+0x18fa>	4071c5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18fa   4071c9:	4c 8b 25 00 00 00 00 	mov    0x0(%rip),%r12        # 4071d0 <shrink_lruvec+0x1901>	4071cc: R_X86_64_PC32	_ftrace_branch+0x54a8c
1901   4071d0:	49 ff c4             	inc    %r12
1904   4071d3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4071d6: R_X86_64_32S	_ftrace_branch+0x54a90
190b   4071da:	e8 00 00 00 00       	call   4071df <shrink_lruvec+0x1910>	4071db: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1910   4071df:	4c 89 25 00 00 00 00 	mov    %r12,0x0(%rip)        # 4071e6 <shrink_lruvec+0x1917>	4071e2: R_X86_64_PC32	_ftrace_branch+0x54a8c
1917   4071e6:	4c 8b b4 24 b0 00 00 00 	mov    0xb0(%rsp),%r14
191f   4071ee:	41 8b 1e             	mov    (%r14),%ebx
1922   4071f1:	03 9c 24 a0 01 00 00 	add    0x1a0(%rsp),%ebx
1929   4071f8:	4c 89 f7             	mov    %r14,%rdi
192c   4071fb:	e8 00 00 00 00       	call   407200 <shrink_lruvec+0x1931>	4071fc: R_X86_64_PLT32	__tsan_read_write4-0x4
1931   407200:	41 89 1e             	mov    %ebx,(%r14)
1934   407203:	4c 8b b4 24 90 00 00 00 	mov    0x90(%rsp),%r14
193c   40720b:	41 8b 1e             	mov    (%r14),%ebx
193f   40720e:	03 9c 24 a8 01 00 00 	add    0x1a8(%rsp),%ebx
1946   407215:	4c 89 f7             	mov    %r14,%rdi
1949   407218:	e8 00 00 00 00       	call   40721d <shrink_lruvec+0x194e>	407219: R_X86_64_PLT32	__tsan_read_write4-0x4
194e   40721d:	41 89 1e             	mov    %ebx,(%r14)
1951   407220:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
1959   407228:	44 03 2b             	add    (%rbx),%r13d
195c   40722b:	48 89 df             	mov    %rbx,%rdi
195f   40722e:	e8 00 00 00 00       	call   407233 <shrink_lruvec+0x1964>	40722f: R_X86_64_PLT32	__tsan_read_write4-0x4
1964   407233:	44 89 2b             	mov    %r13d,(%rbx)
1967   407236:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
196f   40723e:	41 8b 1e             	mov    (%r14),%ebx
1972   407241:	03 9c 24 ac 01 00 00 	add    0x1ac(%rsp),%ebx
1979   407248:	4c 89 f7             	mov    %r14,%rdi
197c   40724b:	e8 00 00 00 00       	call   407250 <shrink_lruvec+0x1981>	40724c: R_X86_64_PLT32	__tsan_read_write4-0x4
1981   407250:	41 89 1e             	mov    %ebx,(%r14)
1984   407253:	4c 8b b4 24 f8 00 00 00 	mov    0xf8(%rsp),%r14
198c   40725b:	41 8b 1e             	mov    (%r14),%ebx
198f   40725e:	03 9c 24 b0 01 00 00 	add    0x1b0(%rsp),%ebx
1996   407265:	4c 89 f7             	mov    %r14,%rdi
1999   407268:	e8 00 00 00 00       	call   40726d <shrink_lruvec+0x199e>	407269: R_X86_64_PLT32	__tsan_read_write4-0x4
199e   40726d:	41 89 1e             	mov    %ebx,(%r14)
19a1   407270:	4c 8b b4 24 f0 00 00 00 	mov    0xf0(%rsp),%r14
19a9   407278:	41 8b 1e             	mov    (%r14),%ebx
19ac   40727b:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
19b1   407280:	44 01 e3             	add    %r12d,%ebx
19b4   407283:	4c 89 f7             	mov    %r14,%rdi
19b7   407286:	e8 00 00 00 00       	call   40728b <shrink_lruvec+0x19bc>	407287: R_X86_64_PLT32	__tsan_read_write4-0x4
19bc   40728b:	41 89 1e             	mov    %ebx,(%r14)
19bf   40728e:	83 7c 24 38 02       	cmpl   $0x2,0x38(%rsp)
19c4   407293:	75 3d                	jne    4072d2 <shrink_lruvec+0x1a03>
19c6   407295:	e8 00 00 00 00       	call   40729a <shrink_lruvec+0x19cb>	407296: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19cb   40729a:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4072a1 <shrink_lruvec+0x19d2>	40729d: R_X86_64_PC32	_ftrace_branch+0x54aa4
19d2   4072a1:	48 ff c3             	inc    %rbx
19d5   4072a4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4072a7: R_X86_64_32S	_ftrace_branch+0x54aa8
19dc   4072ab:	e8 00 00 00 00       	call   4072b0 <shrink_lruvec+0x19e1>	4072ac: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
19e1   4072b0:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4072b7 <shrink_lruvec+0x19e8>	4072b3: R_X86_64_PC32	_ftrace_branch+0x54aa4
19e8   4072b7:	4c 8b b4 24 e8 00 00 00 	mov    0xe8(%rsp),%r14
19f0   4072bf:	41 8b 1e             	mov    (%r14),%ebx
19f3   4072c2:	44 01 e3             	add    %r12d,%ebx
19f6   4072c5:	4c 89 f7             	mov    %r14,%rdi
19f9   4072c8:	e8 00 00 00 00       	call   4072cd <shrink_lruvec+0x19fe>	4072c9: R_X86_64_PLT32	__tsan_read_write4-0x4
19fe   4072cd:	41 89 1e             	mov    %ebx,(%r14)
1a01   4072d0:	eb 22                	jmp    4072f4 <shrink_lruvec+0x1a25>
1a03   4072d2:	e8 00 00 00 00       	call   4072d7 <shrink_lruvec+0x1a08>	4072d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a08   4072d7:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4072de <shrink_lruvec+0x1a0f>	4072da: R_X86_64_PC32	_ftrace_branch+0x54a9c
1a0f   4072de:	48 ff c3             	inc    %rbx
1a12   4072e1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4072e4: R_X86_64_32S	_ftrace_branch+0x54aa0
1a19   4072e8:	e8 00 00 00 00       	call   4072ed <shrink_lruvec+0x1a1e>	4072e9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1a1e   4072ed:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4072f4 <shrink_lruvec+0x1a25>	4072f0: R_X86_64_PC32	_ftrace_branch+0x54a9c
1a25   4072f4:	48 8b 5c 24 48       	mov    0x48(%rsp),%rbx
1a2a   4072f9:	48 8d bb 10 0e 00 00 	lea    0xe10(%rbx),%rdi
1a31   407300:	e8 00 00 00 00       	call   407305 <shrink_lruvec+0x1a36>	407301: R_X86_64_PLT32	__tsan_read4-0x4
1a36   407305:	8b 83 10 0e 00 00    	mov    0xe10(%rbx),%eax
1a3c   40730b:	89 44 24 08          	mov    %eax,0x8(%rsp)
1a40   40730f:	48 8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%rbx
1a48   407317:	48 89 df             	mov    %rbx,%rdi
1a4b   40731a:	e8 00 00 00 00       	call   40731f <shrink_lruvec+0x1a50>	40731b: R_X86_64_PLT32	__tsan_read1-0x4
1a50   40731f:	44 0f be 23          	movsbl (%rbx),%r12d
1a54   407323:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407326: R_X86_64_32S	__tracepoint_mm_vmscan_lru_shrink_inactive+0x8
1a5b   40732a:	e8 00 00 00 00       	call   40732f <shrink_lruvec+0x1a60>	40732b: R_X86_64_PLT32	__tsan_volatile_read4-0x4
1a60   40732f:	44 8b 2d 00 00 00 00 	mov    0x0(%rip),%r13d        # 407336 <shrink_lruvec+0x1a67>	407332: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x4
1a67   407336:	31 ff                	xor    %edi,%edi
1a69   407338:	44 89 ee             	mov    %r13d,%esi
1a6c   40733b:	e8 00 00 00 00       	call   407340 <shrink_lruvec+0x1a71>	40733c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1a71   407340:	45 85 ed             	test   %r13d,%r13d
1a74   407343:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	407346: R_X86_64_32S	_ftrace_branch+0x53c40
1a7b   40734a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	40734d: R_X86_64_32S	_ftrace_branch+0x53c48
1a82   407351:	48 0f 4f d8          	cmovg  %rax,%rbx
1a86   407355:	4c 8b 33             	mov    (%rbx),%r14
1a89   407358:	49 ff c6             	inc    %r14
1a8c   40735b:	48 89 df             	mov    %rbx,%rdi
1a8f   40735e:	e8 00 00 00 00       	call   407363 <shrink_lruvec+0x1a94>	40735f: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1a94   407363:	4c 89 33             	mov    %r14,(%rbx)
1a97   407366:	45 85 ed             	test   %r13d,%r13d
1a9a   407369:	0f 8e 03 01 00 00    	jle    407472 <shrink_lruvec+0x1ba3>
1aa0   40736f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407376 <shrink_lruvec+0x1aa7>	407372: R_X86_64_PC32	_ftrace_branch+0x54c2c
1aa7   407376:	48 ff c3             	inc    %rbx
1aaa   407379:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40737c: R_X86_64_32S	_ftrace_branch+0x54c30
1ab1   407380:	e8 00 00 00 00       	call   407385 <shrink_lruvec+0x1ab6>	407381: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1ab6   407385:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40738c <shrink_lruvec+0x1abd>	407388: R_X86_64_PC32	_ftrace_branch+0x54c2c
1abd   40738c:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407393 <shrink_lruvec+0x1ac4>	40738f: R_X86_64_PC32	_ftrace_branch+0x54c34
1ac4   407393:	48 ff c3             	inc    %rbx
1ac7   407396:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407399: R_X86_64_32S	_ftrace_branch+0x54c38
1ace   40739d:	e8 00 00 00 00       	call   4073a2 <shrink_lruvec+0x1ad3>	40739e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1ad3   4073a2:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4073a9 <shrink_lruvec+0x1ada>	4073a5: R_X86_64_PC32	_ftrace_branch+0x54c34
1ada   4073a9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4073ac: R_X86_64_32S	_ftrace_annotated_branch+0x3ab00
1ae1   4073b0:	31 f6                	xor    %esi,%esi
1ae3   4073b2:	31 d2                	xor    %edx,%edx
1ae5   4073b4:	b9 01 00 00 00       	mov    $0x1,%ecx
1aea   4073b9:	e8 00 00 00 00       	call   4073be <shrink_lruvec+0x1aef>	4073ba: R_X86_64_PLT32	ftrace_likely_update-0x4
1aef   4073be:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4073c5 <shrink_lruvec+0x1af6>	4073c1: R_X86_64_PC32	_ftrace_branch+0x54c3c
1af6   4073c5:	48 ff c3             	inc    %rbx
1af9   4073c8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4073cb: R_X86_64_32S	_ftrace_branch+0x54c40
1b00   4073cf:	e8 00 00 00 00       	call   4073d4 <shrink_lruvec+0x1b05>	4073d0: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1b05   4073d4:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4073db <shrink_lruvec+0x1b0c>	4073d7: R_X86_64_PC32	_ftrace_branch+0x54c3c
1b0c   4073db:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4073de: R_X86_64_32S	_ftrace_annotated_branch+0x3ab30
1b13   4073e2:	31 f6                	xor    %esi,%esi
1b15   4073e4:	31 d2                	xor    %edx,%edx
1b17   4073e6:	b9 01 00 00 00       	mov    $0x1,%ecx
1b1c   4073eb:	e8 00 00 00 00       	call   4073f0 <shrink_lruvec+0x1b21>	4073ec: R_X86_64_PLT32	ftrace_likely_update-0x4
1b21   4073f0:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 4073f6 <shrink_lruvec+0x1b27>	4073f2: R_X86_64_PC32	__preempt_count-0x4
1b27   4073f6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4073f9: R_X86_64_32S	__tracepoint_mm_vmscan_lru_shrink_inactive+0x38
1b2e   4073fd:	e8 00 00 00 00       	call   407402 <shrink_lruvec+0x1b33>	4073fe: R_X86_64_PLT32	__tsan_volatile_read8-0x4
1b33   407402:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 407409 <shrink_lruvec+0x1b3a>	407405: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
1b3a   407409:	4d 85 f6             	test   %r14,%r14
1b3d   40740c:	0f 84 d3 00 00 00    	je     4074e5 <shrink_lruvec+0x1c16>
1b43   407412:	45 31 ed             	xor    %r13d,%r13d
1b46   407415:	8a 44 24 40          	mov    0x40(%rsp),%al
1b4a   407419:	41 88 c5             	mov    %al,%r13b
1b4d   40741c:	e8 00 00 00 00       	call   407421 <shrink_lruvec+0x1b52>	40741d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b52   407421:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407428 <shrink_lruvec+0x1b59>	407424: R_X86_64_PC32	_ftrace_branch+0x54c4c
1b59   407428:	48 ff c3             	inc    %rbx
1b5c   40742b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40742e: R_X86_64_32S	_ftrace_branch+0x54c50
1b63   407432:	e8 00 00 00 00       	call   407437 <shrink_lruvec+0x1b68>	407433: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1b68   407437:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40743e <shrink_lruvec+0x1b6f>	40743a: R_X86_64_PC32	_ftrace_branch+0x54c4c
1b6f   40743e:	49 8d 7e 08          	lea    0x8(%r14),%rdi
1b73   407442:	e8 00 00 00 00       	call   407447 <shrink_lruvec+0x1b78>	407443: R_X86_64_PLT32	__tsan_read8-0x4
1b78   407447:	49 8b 7e 08          	mov    0x8(%r14),%rdi
1b7c   40744b:	8b 74 24 08          	mov    0x8(%rsp),%esi
1b80   40744f:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
1b85   407454:	4c 89 f9             	mov    %r15,%rcx
1b88   407457:	4c 8d 84 24 a0 01 00 00 	lea    0x1a0(%rsp),%r8
1b90   40745f:	45 89 e1             	mov    %r12d,%r9d
1b93   407462:	41 55                	push   %r13
1b95   407464:	e8 00 00 00 00       	call   407469 <shrink_lruvec+0x1b9a>	407465: R_X86_64_PLT32	__SCT__tp_func_mm_vmscan_lru_shrink_inactive-0x4
1b9a   407469:	48 83 c4 08          	add    $0x8,%rsp
1b9e   40746d:	e9 95 00 00 00       	jmp    407507 <shrink_lruvec+0x1c38>
1ba3   407472:	e8 00 00 00 00       	call   407477 <shrink_lruvec+0x1ba8>	407473: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ba8   407477:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40747e <shrink_lruvec+0x1baf>	40747a: R_X86_64_PC32	_ftrace_branch+0x54c24
1baf   40747e:	48 ff c3             	inc    %rbx
1bb2   407481:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407484: R_X86_64_32S	_ftrace_branch+0x54c28
1bb9   407488:	e8 00 00 00 00       	call   40748d <shrink_lruvec+0x1bbe>	407489: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1bbe   40748d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407494 <shrink_lruvec+0x1bc5>	407490: R_X86_64_PC32	_ftrace_branch+0x54c24
1bc5   407494:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
1bca   407499:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
1bcf   40749e:	eb 77                	jmp    407517 <shrink_lruvec+0x1c48>
1bd1   4074a0:	e8 00 00 00 00       	call   4074a5 <shrink_lruvec+0x1bd6>	4074a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bd6   4074a5:	44 8b 7c 24 38       	mov    0x38(%rsp),%r15d
1bdb   4074aa:	4c 8b 6c 24 50       	mov    0x50(%rsp),%r13
1be0   4074af:	e9 05 f8 ff ff       	jmp    406cb9 <shrink_lruvec+0x13ea>
1be5   4074b4:	e8 00 00 00 00       	call   4074b9 <shrink_lruvec+0x1bea>	4074b5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bea   4074b9:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4074c0 <shrink_lruvec+0x1bf1>	4074bc: R_X86_64_PC32	_ftrace_branch+0x54a44
1bf1   4074c0:	48 ff c3             	inc    %rbx
1bf4   4074c3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4074c6: R_X86_64_32S	_ftrace_branch+0x54a48
1bfb   4074ca:	e8 00 00 00 00       	call   4074cf <shrink_lruvec+0x1c00>	4074cb: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1c00   4074cf:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4074d6 <shrink_lruvec+0x1c07>	4074d2: R_X86_64_PC32	_ftrace_branch+0x54a44
1c07   4074d6:	45 31 ff             	xor    %r15d,%r15d
1c0a   4074d9:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
1c0f   4074de:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
1c14   4074e3:	eb 6e                	jmp    407553 <shrink_lruvec+0x1c84>
1c16   4074e5:	e8 00 00 00 00       	call   4074ea <shrink_lruvec+0x1c1b>	4074e6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c1b   4074ea:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4074f1 <shrink_lruvec+0x1c22>	4074ed: R_X86_64_PC32	_ftrace_branch+0x54c44
1c22   4074f1:	48 ff c3             	inc    %rbx
1c25   4074f4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4074f7: R_X86_64_32S	_ftrace_branch+0x54c48
1c2c   4074fb:	e8 00 00 00 00       	call   407500 <shrink_lruvec+0x1c31>	4074fc: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1c31   407500:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407507 <shrink_lruvec+0x1c38>	407503: R_X86_64_PC32	_ftrace_branch+0x54c44
1c38   407507:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
1c3d   40750c:	4c 8b 64 24 28       	mov    0x28(%rsp),%r12
1c42   407511:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 407517 <shrink_lruvec+0x1c48>	407513: R_X86_64_PC32	__preempt_count-0x4
1c48   407517:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40751e <shrink_lruvec+0x1c4f>	40751a: R_X86_64_PC32	_ftrace_branch+0x54c54
1c4f   40751e:	48 ff c3             	inc    %rbx
1c52   407521:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407524: R_X86_64_32S	_ftrace_branch+0x54c58
1c59   407528:	e8 00 00 00 00       	call   40752d <shrink_lruvec+0x1c5e>	407529: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1c5e   40752d:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407534 <shrink_lruvec+0x1c65>	407530: R_X86_64_PC32	_ftrace_branch+0x54c54
1c65   407534:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 40753a <shrink_lruvec+0x1c6b>	407536: R_X86_64_PC32	__preempt_count-0x4
1c6b   40753a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40753d: R_X86_64_32S	__tracepoint_mm_vmscan_lru_shrink_inactive+0x38
1c72   407541:	e8 00 00 00 00       	call   407546 <shrink_lruvec+0x1c77>	407542: R_X86_64_PLT32	__tsan_volatile_read8-0x4
1c77   407546:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 40754d <shrink_lruvec+0x1c7e>	407549: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
1c7e   40754d:	ff 0d 00 00 00 00    	decl   0x0(%rip)        # 407553 <shrink_lruvec+0x1c84>	40754f: R_X86_64_PC32	__preempt_count-0x4
1c84   407553:	4c 01 7c 24 70       	add    %r15,0x70(%rsp)
1c89   407558:	49 ff c4             	inc    %r12
1c8c   40755b:	49 83 fc 04          	cmp    $0x4,%r12
1c90   40755f:	74 61                	je     4075c2 <shrink_lruvec+0x1cf3>
1c92   407561:	e8 00 00 00 00       	call   407566 <shrink_lruvec+0x1c97>	407562: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c97   407566:	4e 8b bc e4 70 01 00 00 	mov    0x170(%rsp,%r12,8),%r15
1c9f   40756e:	e9 ce f1 ff ff       	jmp    406741 <shrink_lruvec+0xe72>
1ca4   407573:	e8 00 00 00 00       	call   407578 <shrink_lruvec+0x1ca9>	407574: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ca9   407578:	e9 0d f7 ff ff       	jmp    406c8a <shrink_lruvec+0x13bb>
1cae   40757d:	e8 00 00 00 00       	call   407582 <shrink_lruvec+0x1cb3>	40757e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1cb3   407582:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14	407585: R_X86_64_32S	_ftrace_branch+0x54ac8
1cba   407589:	44 8b 7c 24 38       	mov    0x38(%rsp),%r15d
1cbf   40758e:	e9 fe f6 ff ff       	jmp    406c91 <shrink_lruvec+0x13c2>
1cc4   407593:	e8 00 00 00 00       	call   407598 <shrink_lruvec+0x1cc9>	407594: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1cc9   407598:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40759f <shrink_lruvec+0x1cd0>	40759b: R_X86_64_PC32	_ftrace_branch+0x54a54
1cd0   40759f:	48 ff c3             	inc    %rbx
1cd3   4075a2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4075a5: R_X86_64_32S	_ftrace_branch+0x54a58
1cda   4075a9:	e8 00 00 00 00       	call   4075ae <shrink_lruvec+0x1cdf>	4075aa: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1cdf   4075ae:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4075b5 <shrink_lruvec+0x1ce6>	4075b1: R_X86_64_PC32	_ftrace_branch+0x54a54
1ce6   4075b5:	41 bf 20 00 00 00    	mov    $0x20,%r15d
1cec   4075bb:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
1cf1   4075c0:	eb 91                	jmp    407553 <shrink_lruvec+0x1c84>
1cf3   4075c2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4075c5: R_X86_64_32S	.rodata.str1.1+0xbbc61
1cfa   4075c9:	be 10 0b 00 00       	mov    $0xb10,%esi
1cff   4075ce:	31 d2                	xor    %edx,%edx
1d01   4075d0:	e8 00 00 00 00       	call   4075d5 <shrink_lruvec+0x1d06>	4075d1: R_X86_64_PLT32	___might_sleep-0x4
1d06   4075d5:	e8 00 00 00 00       	call   4075da <shrink_lruvec+0x1d0b>	4075d6: R_X86_64_PLT32	__cond_resched-0x4
1d0b   4075da:	4c 8b 74 24 70       	mov    0x70(%rsp),%r14
1d10   4075df:	4c 89 f7             	mov    %r14,%rdi
1d13   4075e2:	48 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%rbx
1d1b   4075ea:	48 89 de             	mov    %rbx,%rsi
1d1e   4075ed:	e8 00 00 00 00       	call   4075f2 <shrink_lruvec+0x1d23>	4075ee: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1d23   4075f2:	49 39 de             	cmp    %rbx,%r14
1d26   4075f5:	72 0a                	jb     407601 <shrink_lruvec+0x1d32>
1d28   4075f7:	80 bc 24 cc 00 00 00 00 	cmpb   $0x0,0xcc(%rsp)
1d30   4075ff:	74 27                	je     407628 <shrink_lruvec+0x1d59>
1d32   407601:	e8 00 00 00 00       	call   407606 <shrink_lruvec+0x1d37>	407602: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d37   407606:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40760d <shrink_lruvec+0x1d3e>	407609: R_X86_64_PC32	_ftrace_branch+0x548e4
1d3e   40760d:	48 ff c3             	inc    %rbx
1d41   407610:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407613: R_X86_64_32S	_ftrace_branch+0x548e8
1d48   407617:	e8 00 00 00 00       	call   40761c <shrink_lruvec+0x1d4d>	407618: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1d4d   40761c:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407623 <shrink_lruvec+0x1d54>	40761f: R_X86_64_PC32	_ftrace_branch+0x548e4
1d54   407623:	e9 ba f0 ff ff       	jmp    4066e2 <shrink_lruvec+0xe13>
1d59   407628:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40762f <shrink_lruvec+0x1d60>	40762b: R_X86_64_PC32	_ftrace_branch+0x548dc
1d60   40762f:	48 ff c3             	inc    %rbx
1d63   407632:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407635: R_X86_64_32S	_ftrace_branch+0x548e0
1d6a   407639:	e8 00 00 00 00       	call   40763e <shrink_lruvec+0x1d6f>	40763a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1d6f   40763e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407645 <shrink_lruvec+0x1d76>	407641: R_X86_64_PC32	_ftrace_branch+0x548dc
1d76   407645:	4c 8b b4 24 78 01 00 00 	mov    0x178(%rsp),%r14
1d7e   40764d:	48 8b 9c 24 88 01 00 00 	mov    0x188(%rsp),%rbx
1d86   407655:	4c 03 b4 24 70 01 00 00 	add    0x170(%rsp),%r14
1d8e   40765d:	4c 8b bc 24 80 01 00 00 	mov    0x180(%rsp),%r15
1d96   407665:	4a 8d 34 3b          	lea    (%rbx,%r15,1),%rsi
1d9a   407669:	31 ff                	xor    %edi,%edi
1d9c   40766b:	e8 00 00 00 00       	call   407670 <shrink_lruvec+0x1da1>	40766c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1da1   407670:	31 ff                	xor    %edi,%edi
1da3   407672:	4c 89 f6             	mov    %r14,%rsi
1da6   407675:	e8 00 00 00 00       	call   40767a <shrink_lruvec+0x1dab>	407676: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1dab   40767a:	4c 01 fb             	add    %r15,%rbx
1dae   40767d:	0f 84 97 02 00 00    	je     40791a <shrink_lruvec+0x204b>
1db4   407683:	4d 85 f6             	test   %r14,%r14
1db7   407686:	0f 84 8e 02 00 00    	je     40791a <shrink_lruvec+0x204b>
1dbd   40768c:	4c 8b 3d 00 00 00 00 	mov    0x0(%rip),%r15        # 407693 <shrink_lruvec+0x1dc4>	40768f: R_X86_64_PC32	_ftrace_branch+0x548ec
1dc4   407693:	49 ff c7             	inc    %r15
1dc7   407696:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407699: R_X86_64_32S	_ftrace_branch+0x548f0
1dce   40769d:	e8 00 00 00 00       	call   4076a2 <shrink_lruvec+0x1dd3>	40769e: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1dd3   4076a2:	4c 89 3d 00 00 00 00 	mov    %r15,0x0(%rip)        # 4076a9 <shrink_lruvec+0x1dda>	4076a5: R_X86_64_PC32	_ftrace_branch+0x548ec
1dda   4076a9:	48 89 df             	mov    %rbx,%rdi
1ddd   4076ac:	4c 89 f6             	mov    %r14,%rsi
1de0   4076af:	e8 00 00 00 00       	call   4076b4 <shrink_lruvec+0x1de5>	4076b0: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1de5   4076b4:	4c 39 f3             	cmp    %r14,%rbx
1de8   4076b7:	76 3d                	jbe    4076f6 <shrink_lruvec+0x1e27>
1dea   4076b9:	e8 00 00 00 00       	call   4076be <shrink_lruvec+0x1def>	4076ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1def   4076be:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4076c5 <shrink_lruvec+0x1df6>	4076c1: R_X86_64_PC32	_ftrace_branch+0x54904
1df6   4076c5:	48 ff c3             	inc    %rbx
1df9   4076c8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4076cb: R_X86_64_32S	_ftrace_branch+0x54908
1e00   4076cf:	e8 00 00 00 00       	call   4076d4 <shrink_lruvec+0x1e05>	4076d0: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1e05   4076d4:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4076db <shrink_lruvec+0x1e0c>	4076d7: R_X86_64_PC32	_ftrace_branch+0x54904
1e0c   4076db:	45 31 ed             	xor    %r13d,%r13d
1e0f   4076de:	41 bc 02 00 00 00    	mov    $0x2,%r12d
1e15   4076e4:	48 8b 9c 24 40 01 00 00 	mov    0x140(%rsp),%rbx
1e1d   4076ec:	4c 8d bc 24 48 01 00 00 	lea    0x148(%rsp),%r15
1e25   4076f4:	eb 41                	jmp    407737 <shrink_lruvec+0x1e68>
1e27   4076f6:	e8 00 00 00 00       	call   4076fb <shrink_lruvec+0x1e2c>	4076f7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e2c   4076fb:	4c 8b 35 00 00 00 00 	mov    0x0(%rip),%r14        # 407702 <shrink_lruvec+0x1e33>	4076fe: R_X86_64_PC32	_ftrace_branch+0x548fc
1e33   407702:	49 ff c6             	inc    %r14
1e36   407705:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407708: R_X86_64_32S	_ftrace_branch+0x54900
1e3d   40770c:	e8 00 00 00 00       	call   407711 <shrink_lruvec+0x1e42>	40770d: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1e42   407711:	4c 89 35 00 00 00 00 	mov    %r14,0x0(%rip)        # 407718 <shrink_lruvec+0x1e49>	407714: R_X86_64_PC32	_ftrace_branch+0x548fc
1e49   407718:	41 bd 02 00 00 00    	mov    $0x2,%r13d
1e4f   40771e:	45 31 e4             	xor    %r12d,%r12d
1e52   407721:	48 8b 84 24 50 01 00 00 	mov    0x150(%rsp),%rax
1e5a   407729:	4c 8d bc 24 58 01 00 00 	lea    0x158(%rsp),%r15
1e62   407731:	49 89 de             	mov    %rbx,%r14
1e65   407734:	48 89 c3             	mov    %rax,%rbx
1e68   407737:	4c 89 ff             	mov    %r15,%rdi
1e6b   40773a:	e8 00 00 00 00       	call   40773f <shrink_lruvec+0x1e70>	40773b: R_X86_64_PLT32	__tsan_read8-0x4
1e70   40773f:	49 8b 07             	mov    (%r15),%rax
1e73   407742:	48 8d 0c 03          	lea    (%rbx,%rax,1),%rcx
1e77   407746:	48 ff c1             	inc    %rcx
1e7a   407749:	49 6b c6 64          	imul   $0x64,%r14,%rax
1e7e   40774d:	31 d2                	xor    %edx,%edx
1e80   40774f:	48 f7 f1             	div    %rcx
1e83   407752:	44 89 e9             	mov    %r13d,%ecx
1e86   407755:	45 31 c0             	xor    %r8d,%r8d
1e89   407758:	4c 89 84 cc 70 01 00 00 	mov    %r8,0x170(%rsp,%rcx,8)
1e91   407760:	41 83 cd 01          	or     $0x1,%r13d
1e95   407764:	4e 89 84 ec 70 01 00 00 	mov    %r8,0x170(%rsp,%r13,8)
1e9d   40776c:	44 89 e7             	mov    %r12d,%edi
1ea0   40776f:	48 8b 8c fc 40 01 00 00 	mov    0x140(%rsp,%rdi,8),%rcx
1ea8   407777:	48 89 cb             	mov    %rcx,%rbx
1eab   40777a:	48 2b 9c fc 70 01 00 00 	sub    0x170(%rsp,%rdi,8),%rbx
1eb3   407782:	be 64 00 00 00       	mov    $0x64,%esi
1eb8   407787:	48 29 c6             	sub    %rax,%rsi
1ebb   40778a:	48 0f af ce          	imul   %rsi,%rcx
1ebf   40778e:	48 c1 e9 02          	shr    $0x2,%rcx
1ec3   407792:	48 89 c8             	mov    %rcx,%rax
1ec6   407795:	49 b9 c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%r9
1ed0   40779f:	49 f7 e1             	mul    %r9
1ed3   4077a2:	48 c1 ea 02          	shr    $0x2,%rdx
1ed7   4077a6:	48 29 da             	sub    %rbx,%rdx
1eda   4077a9:	49 0f 42 d0          	cmovb  %r8,%rdx
1ede   4077ad:	48 89 94 fc 70 01 00 00 	mov    %rdx,0x170(%rsp,%rdi,8)
1ee6   4077b5:	41 83 cc 01          	or     $0x1,%r12d
1eea   4077b9:	4a 8b 84 e4 40 01 00 00 	mov    0x140(%rsp,%r12,8),%rax
1ef2   4077c1:	48 0f af f0          	imul   %rax,%rsi
1ef6   4077c5:	48 89 c1             	mov    %rax,%rcx
1ef9   4077c8:	4a 2b 8c e4 70 01 00 00 	sub    0x170(%rsp,%r12,8),%rcx
1f01   4077d0:	48 c1 ee 02          	shr    $0x2,%rsi
1f05   4077d4:	48 89 f0             	mov    %rsi,%rax
1f08   4077d7:	49 f7 e1             	mul    %r9
1f0b   4077da:	48 c1 ea 02          	shr    $0x2,%rdx
1f0f   4077de:	48 29 ca             	sub    %rcx,%rdx
1f12   4077e1:	49 0f 42 d0          	cmovb  %r8,%rdx
1f16   4077e5:	4a 89 94 e4 70 01 00 00 	mov    %rdx,0x170(%rsp,%r12,8)
1f1e   4077ed:	b3 01                	mov    $0x1,%bl
1f20   4077ef:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
1f25   4077f4:	e9 d5 ee ff ff       	jmp    4066ce <shrink_lruvec+0xdff>
1f2a   4077f9:	e8 00 00 00 00       	call   4077fe <shrink_lruvec+0x1f2f>	4077fa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f2f   4077fe:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
1f37   407806:	e8 00 00 00 00       	call   40780b <shrink_lruvec+0x1f3c>	407807: R_X86_64_PLT32	blk_finish_plug-0x4
1f3c   40780b:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
1f41   407810:	49 8d 7e 40          	lea    0x40(%r14),%rdi
1f45   407814:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
1f4a   407819:	49 03 5e 40          	add    0x40(%r14),%rbx
1f4e   40781d:	e8 00 00 00 00       	call   407822 <shrink_lruvec+0x1f53>	40781e: R_X86_64_PLT32	__tsan_read_write8-0x4
1f53   407822:	49 89 5e 40          	mov    %rbx,0x40(%r14)
1f57   407826:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407829: R_X86_64_32S	total_swap_pages
1f5e   40782d:	e8 00 00 00 00       	call   407832 <shrink_lruvec+0x1f63>	40782e: R_X86_64_PLT32	__tsan_read8-0x4
1f63   407832:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407839 <shrink_lruvec+0x1f6a>	407835: R_X86_64_PC32	total_swap_pages-0x4
1f6a   407839:	31 ff                	xor    %edi,%edi
1f6c   40783b:	48 89 de             	mov    %rbx,%rsi
1f6f   40783e:	e8 00 00 00 00       	call   407843 <shrink_lruvec+0x1f74>	40783f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1f74   407843:	48 85 db             	test   %rbx,%rbx
1f77   407846:	7e 66                	jle    4078ae <shrink_lruvec+0x1fdf>
1f79   407848:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40784f <shrink_lruvec+0x1f80>	40784b: R_X86_64_PC32	_ftrace_branch+0x54c64
1f80   40784f:	48 ff c3             	inc    %rbx
1f83   407852:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407855: R_X86_64_32S	_ftrace_branch+0x54c68
1f8a   407859:	e8 00 00 00 00       	call   40785e <shrink_lruvec+0x1f8f>	40785a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1f8f   40785e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407865 <shrink_lruvec+0x1f96>	407861: R_X86_64_PC32	_ftrace_branch+0x54c64
1f96   407865:	4c 89 ef             	mov    %r13,%rdi
1f99   407868:	31 f6                	xor    %esi,%esi
1f9b   40786a:	e8 6a 69 00 00       	call   40e1d9 <inactive_is_low>
1fa0   40786f:	84 c0                	test   %al,%al
1fa2   407871:	74 5f                	je     4078d2 <shrink_lruvec+0x2003>
1fa4   407873:	e8 00 00 00 00       	call   407878 <shrink_lruvec+0x1fa9>	407874: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fa9   407878:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40787f <shrink_lruvec+0x1fb0>	40787b: R_X86_64_PC32	_ftrace_branch+0x54914
1fb0   40787f:	48 ff c3             	inc    %rbx
1fb3   407882:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407885: R_X86_64_32S	_ftrace_branch+0x54918
1fba   407889:	e8 00 00 00 00       	call   40788e <shrink_lruvec+0x1fbf>	40788a: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1fbf   40788e:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407895 <shrink_lruvec+0x1fc6>	407891: R_X86_64_PC32	_ftrace_branch+0x54914
1fc6   407895:	bf 20 00 00 00       	mov    $0x20,%edi
1fcb   40789a:	4c 89 ee             	mov    %r13,%rsi
1fce   40789d:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
1fd3   4078a2:	b9 01 00 00 00       	mov    $0x1,%ecx
1fd8   4078a7:	e8 ed 6a 00 00       	call   40e399 <shrink_active_list>
1fdd   4078ac:	eb 46                	jmp    4078f4 <shrink_lruvec+0x2025>
1fdf   4078ae:	e8 00 00 00 00       	call   4078b3 <shrink_lruvec+0x1fe4>	4078af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fe4   4078b3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4078ba <shrink_lruvec+0x1feb>	4078b6: R_X86_64_PC32	_ftrace_branch+0x54c5c
1feb   4078ba:	48 ff c3             	inc    %rbx
1fee   4078bd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4078c0: R_X86_64_32S	_ftrace_branch+0x54c60
1ff5   4078c4:	e8 00 00 00 00       	call   4078c9 <shrink_lruvec+0x1ffa>	4078c5: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
1ffa   4078c9:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4078d0 <shrink_lruvec+0x2001>	4078cc: R_X86_64_PC32	_ftrace_branch+0x54c5c
2001   4078d0:	eb 05                	jmp    4078d7 <shrink_lruvec+0x2008>
2003   4078d2:	e8 00 00 00 00       	call   4078d7 <shrink_lruvec+0x2008>	4078d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2008   4078d7:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4078de <shrink_lruvec+0x200f>	4078da: R_X86_64_PC32	_ftrace_branch+0x5490c
200f   4078de:	48 ff c3             	inc    %rbx
2012   4078e1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4078e4: R_X86_64_32S	_ftrace_branch+0x54910
2019   4078e8:	e8 00 00 00 00       	call   4078ed <shrink_lruvec+0x201e>	4078e9: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
201e   4078ed:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4078f4 <shrink_lruvec+0x2025>	4078f0: R_X86_64_PC32	_ftrace_branch+0x5490c
2025   4078f4:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
202e   4078fd:	48 3b 84 24 d0 01 00 00 	cmp    0x1d0(%rsp),%rax
2036   407905:	0f 85 3a 01 00 00    	jne    407a45 <shrink_lruvec+0x2176>
203c   40790b:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
2040   40790f:	5b                   	pop    %rbx
2041   407910:	41 5c                	pop    %r12
2043   407912:	41 5d                	pop    %r13
2045   407914:	41 5e                	pop    %r14
2047   407916:	41 5f                	pop    %r15
2049   407918:	5d                   	pop    %rbp
204a   407919:	c3                   	ret
204b   40791a:	e8 00 00 00 00       	call   40791f <shrink_lruvec+0x2050>	40791b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2050   40791f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407926 <shrink_lruvec+0x2057>	407922: R_X86_64_PC32	_ftrace_branch+0x548f4
2057   407926:	48 ff c3             	inc    %rbx
205a   407929:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40792c: R_X86_64_32S	_ftrace_branch+0x548f8
2061   407930:	e8 00 00 00 00       	call   407935 <shrink_lruvec+0x2066>	407931: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2066   407935:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40793c <shrink_lruvec+0x206d>	407938: R_X86_64_PC32	_ftrace_branch+0x548f4
206d   40793c:	e9 bd fe ff ff       	jmp    4077fe <shrink_lruvec+0x1f2f>
2072   407941:	e8 00 00 00 00       	call   407946 <shrink_lruvec+0x2077>	407942: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2077   407946:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40794d <shrink_lruvec+0x207e>	407949: R_X86_64_PC32	_ftrace_branch+0x54954
207e   40794d:	48 ff c3             	inc    %rbx
2081   407950:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407953: R_X86_64_32S	_ftrace_branch+0x54958
2088   407957:	e8 00 00 00 00       	call   40795c <shrink_lruvec+0x208d>	407958: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
208d   40795c:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407963 <shrink_lruvec+0x2094>	40795f: R_X86_64_PC32	_ftrace_branch+0x54954
2094   407963:	be 02 00 00 00       	mov    $0x2,%esi
2099   407968:	e9 2b e4 ff ff       	jmp    405d98 <shrink_lruvec+0x4c9>
209e   40796d:	e8 00 00 00 00       	call   407972 <shrink_lruvec+0x20a3>	40796e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
20a3   407972:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407979 <shrink_lruvec+0x20aa>	407975: R_X86_64_PC32	_ftrace_branch+0x54964
20aa   407979:	48 ff c3             	inc    %rbx
20ad   40797c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	40797f: R_X86_64_32S	_ftrace_branch+0x54968
20b4   407983:	e8 00 00 00 00       	call   407988 <shrink_lruvec+0x20b9>	407984: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
20b9   407988:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 40798f <shrink_lruvec+0x20c0>	40798b: R_X86_64_PC32	_ftrace_branch+0x54964
20c0   40798f:	e9 f5 e3 ff ff       	jmp    405d89 <shrink_lruvec+0x4ba>
20c5   407994:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 40799b <shrink_lruvec+0x20cc>	407997: R_X86_64_PC32	_ftrace_branch+0x549bc
20cc   40799b:	48 ff c3             	inc    %rbx
20cf   40799e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4079a1: R_X86_64_32S	_ftrace_branch+0x549c0
20d6   4079a5:	e8 00 00 00 00       	call   4079aa <shrink_lruvec+0x20db>	4079a6: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
20db   4079aa:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 4079b1 <shrink_lruvec+0x20e2>	4079ad: R_X86_64_PC32	_ftrace_branch+0x549bc
20e2   4079b1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4079b4: R_X86_64_32S	memory_cgrp_subsys_enabled_key
20e9   4079b8:	e8 00 00 00 00       	call   4079bd <shrink_lruvec+0x20ee>	4079b9: R_X86_64_PLT32	__tsan_volatile_read4-0x4
20ee   4079bd:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 4079c3 <shrink_lruvec+0x20f4>	4079bf: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
20f4   4079c3:	bf 01 00 00 00       	mov    $0x1,%edi
20f9   4079c8:	89 de                	mov    %ebx,%esi
20fb   4079ca:	e8 00 00 00 00       	call   4079cf <shrink_lruvec+0x2100>	4079cb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2100   4079cf:	85 db                	test   %ebx,%ebx
2102   4079d1:	7e 44                	jle    407a17 <shrink_lruvec+0x2148>
2104   4079d3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4079d6: R_X86_64_32S	root_mem_cgroup
210b   4079da:	e8 00 00 00 00       	call   4079df <shrink_lruvec+0x2110>	4079db: R_X86_64_PLT32	__tsan_read8-0x4
2110   4079df:	4c 39 25 00 00 00 00 	cmp    %r12,0x0(%rip)        # 4079e6 <shrink_lruvec+0x2117>	4079e2: R_X86_64_PC32	root_mem_cgroup-0x4
2117   4079e6:	74 36                	je     407a1e <shrink_lruvec+0x214f>
2119   4079e8:	e8 00 00 00 00       	call   4079ed <shrink_lruvec+0x211e>	4079e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
211e   4079ed:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 4079f4 <shrink_lruvec+0x2125>	4079f0: R_X86_64_PC32	_ftrace_branch+0x549cc
2125   4079f4:	48 ff c3             	inc    %rbx
2128   4079f7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	4079fa: R_X86_64_32S	_ftrace_branch+0x549d0
212f   4079fe:	e8 00 00 00 00       	call   407a03 <shrink_lruvec+0x2134>	4079ff: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
2134   407a03:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407a0a <shrink_lruvec+0x213b>	407a06: R_X86_64_PC32	_ftrace_branch+0x549cc
213b   407a0a:	49 8d 9c 24 b0 04 00 00 	lea    0x4b0(%r12),%rbx
2143   407a12:	e9 0f e0 ff ff       	jmp    405a26 <shrink_lruvec+0x157>
2148   407a17:	e8 00 00 00 00       	call   407a1c <shrink_lruvec+0x214d>	407a18: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
214d   407a1c:	eb 05                	jmp    407a23 <shrink_lruvec+0x2154>
214f   407a1e:	e8 00 00 00 00       	call   407a23 <shrink_lruvec+0x2154>	407a1f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2154   407a23:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 407a2a <shrink_lruvec+0x215b>	407a26: R_X86_64_PC32	_ftrace_branch+0x549d4
215b   407a2a:	48 ff c3             	inc    %rbx
215e   407a2d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	407a30: R_X86_64_32S	_ftrace_branch+0x549d8
2165   407a34:	e8 00 00 00 00       	call   407a39 <shrink_lruvec+0x216a>	407a35: R_X86_64_PLT32	__tsan_unaligned_read_write8-0x4
216a   407a39:	48 89 1d 00 00 00 00 	mov    %rbx,0x0(%rip)        # 407a40 <shrink_lruvec+0x2171>	407a3c: R_X86_64_PC32	_ftrace_branch+0x549d4
2171   407a40:	e9 da df ff ff       	jmp    405a1f <shrink_lruvec+0x150>
2176   407a45:	e8 00 00 00 00       	call   407a4a <try_to_free_mem_cgroup_pages>	407a46: R_X86_64_PLT32	__stack_chk_fail-0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
