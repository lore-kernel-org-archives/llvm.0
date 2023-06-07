Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13666118;
	Wed,  7 Jun 2023 19:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686165402; x=1717701402;
  h=date:from:cc:subject:message-id:mime-version;
  bh=DGBvZ+CBE8PYbX7c/nSNCey1IyYFwlvakqZ0cxV79PQ=;
  b=eTNI076s6tFl/qvLUnibg7RAkf8x/xY+vziyDG1NUrUpoMntXjDl3ulm
   +GhXKIGBqxzJCJ41s5uSlCBFpewzzxQpncYuwT5dQjMDSjKNQo4WSoe38
   n/VEr9/PJob+DY/UtRXsRx+8yDFkzKZPzChM7BGCD3vCVYPZHB6f6TK/b
   dmb1DDrWwfY0uPU3BC3OhlRM+lBgmAhRrjTe5q45zh4u9vsqUUWWcI8IP
   2FmhCjxzJ8HGpjcRVIGRIGpaijvFP+3OCyR7i7oyRg8T55eiAsMJ+Z5lc
   hNJQcPZoUcC6vVSHNg5Er8JErXbQji+ONuP5sVyecEf1OE10BAJVJFvnv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="385416213"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="385416213"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 12:16:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="712799779"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; 
   d="scan'208";a="712799779"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2023 12:16:39 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6ye6-0006r5-12;
	Wed, 07 Jun 2023 19:16:38 +0000
Date: Thu, 8 Jun 2023 03:16:19 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: do_user_addr_fault+0x56d: unreachable
 instruction
Message-ID: <202306080352.xxIY8lLe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a27648c742104a833a01c54becc24429898d85bf
commit: 443ed4c302fff6a26af980300463343a7adc9ee8 objtool: mem*() are not uaccess safe
date:   4 months ago
config: x86_64-randconfig-a002-20230607 (https://download.01.org/0day-ci/archive/20230608/202306080352.xxIY8lLe-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=443ed4c302fff6a26af980300463343a7adc9ee8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 443ed4c302fff6a26af980300463343a7adc9ee8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306080352.xxIY8lLe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_user_addr_fault+0x56d: unreachable instruction


objdump-func vmlinux.o do_user_addr_fault:
0000 00000000000a58c0 <do_user_addr_fault>:
0000    a58c0:	f3 0f 1e fa          	endbr64
0004    a58c4:	55                   	push   %rbp
0005    a58c5:	41 57                	push   %r15
0007    a58c7:	41 56                	push   %r14
0009    a58c9:	41 55                	push   %r13
000b    a58cb:	41 54                	push   %r12
000d    a58cd:	53                   	push   %rbx
000e    a58ce:	48 83 ec 60          	sub    $0x60,%rsp
0012    a58d2:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0017    a58d7:	49 89 f6             	mov    %rsi,%r14
001a    a58da:	49 89 fc             	mov    %rdi,%r12
001d    a58dd:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0027    a58e7:	e8 00 00 00 00       	call   a58ec <do_user_addr_fault+0x2c>	a58e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002c    a58ec:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # a58f4 <do_user_addr_fault+0x34>	a58f0: R_X86_64_PC32	pcpu_hot-0x4
0034    a58f4:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0039    a58f9:	48 8d 98 98 04 00 00 	lea    0x498(%rax),%rbx
0040    a5900:	48 89 d8             	mov    %rbx,%rax
0043    a5903:	48 c1 e8 03          	shr    $0x3,%rax
0047    a5907:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
004b    a590b:	74 08                	je     a5915 <do_user_addr_fault+0x55>
004d    a590d:	48 89 df             	mov    %rbx,%rdi
0050    a5910:	e8 00 00 00 00       	call   a5915 <do_user_addr_fault+0x55>	a5911: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0055    a5915:	48 8b 03             	mov    (%rbx),%rax
0058    a5918:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
005d    a591d:	44 89 f3             	mov    %r14d,%ebx
0060    a5920:	83 e3 14             	and    $0x14,%ebx
0063    a5923:	bf 10 00 00 00       	mov    $0x10,%edi
0068    a5928:	48 89 de             	mov    %rbx,%rsi
006b    a592b:	e8 00 00 00 00       	call   a5930 <do_user_addr_fault+0x70>	a592c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0070    a5930:	48 83 fb 10          	cmp    $0x10,%rbx
0074    a5934:	0f 84 b2 03 00 00    	je     a5cec <do_user_addr_fault+0x42c>
007a    a593a:	4d 8d ac 24 88 00 00 00 	lea    0x88(%r12),%r13
0082    a5942:	4c 89 e8             	mov    %r13,%rax
0085    a5945:	48 c1 e8 03          	shr    $0x3,%rax
0089    a5949:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
008e    a594e:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0092    a5952:	74 08                	je     a595c <do_user_addr_fault+0x9c>
0094    a5954:	4c 89 ef             	mov    %r13,%rdi
0097    a5957:	e8 00 00 00 00       	call   a595c <do_user_addr_fault+0x9c>	a5958: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
009c    a595c:	49 8b 5d 00          	mov    0x0(%r13),%rbx
00a0    a5960:	48 89 de             	mov    %rbx,%rsi
00a3    a5963:	48 83 e6 03          	and    $0x3,%rsi
00a7    a5967:	31 ff                	xor    %edi,%edi
00a9    a5969:	e8 00 00 00 00       	call   a596e <do_user_addr_fault+0xae>	a596a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00ae    a596e:	48 83 e3 03          	and    $0x3,%rbx
00b2    a5972:	74 0a                	je     a597e <do_user_addr_fault+0xbe>
00b4    a5974:	e8 00 00 00 00       	call   a5979 <do_user_addr_fault+0xb9>	a5975: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00b9    a5979:	e9 e3 00 00 00       	jmp    a5a61 <do_user_addr_fault+0x1a1>
00be    a597e:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # a5985 <do_user_addr_fault+0xc5>	a5981: R_X86_64_PC32	pcpu_hot+0x4
00c5    a5985:	89 de                	mov    %ebx,%esi
00c7    a5987:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
00cd    a598d:	31 ff                	xor    %edi,%edi
00cf    a598f:	e8 00 00 00 00       	call   a5994 <do_user_addr_fault+0xd4>	a5990: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00d4    a5994:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
00da    a599a:	74 07                	je     a59a3 <do_user_addr_fault+0xe3>
00dc    a599c:	e8 00 00 00 00       	call   a59a1 <do_user_addr_fault+0xe1>	a599d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00e1    a59a1:	eb 6a                	jmp    a5a0d <do_user_addr_fault+0x14d>
00e3    a59a3:	48 8d 5c 24 40       	lea    0x40(%rsp),%rbx
00e8    a59a8:	48 c1 eb 03          	shr    $0x3,%rbx
00ec    a59ac:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
00f0    a59b0:	74 0a                	je     a59bc <do_user_addr_fault+0xfc>
00f2    a59b2:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
00f7    a59b7:	e8 00 00 00 00       	call   a59bc <do_user_addr_fault+0xfc>	a59b8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
00fc    a59bc:	48 b8 aa aa aa aa aa aa aa aa 	movabs $0xaaaaaaaaaaaaaaaa,%rax
0106    a59c6:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
010b    a59cb:	9c                   	pushf
010c    a59cc:	8f 44 24 40          	pop    0x40(%rsp)
0110    a59d0:	80 3c 2b 00          	cmpb   $0x0,(%rbx,%rbp,1)
0114    a59d4:	74 0a                	je     a59e0 <do_user_addr_fault+0x120>
0116    a59d6:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
011b    a59db:	e8 00 00 00 00       	call   a59e0 <do_user_addr_fault+0x120>	a59dc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0120    a59e0:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
0125    a59e5:	bd 00 02 00 00       	mov    $0x200,%ebp
012a    a59ea:	be 00 02 00 00       	mov    $0x200,%esi
012f    a59ef:	48 21 de             	and    %rbx,%rsi
0132    a59f2:	31 ff                	xor    %edi,%edi
0134    a59f4:	e8 00 00 00 00       	call   a59f9 <do_user_addr_fault+0x139>	a59f5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0139    a59f9:	48 21 dd             	and    %rbx,%rbp
013c    a59fc:	75 54                	jne    a5a52 <do_user_addr_fault+0x192>
013e    a59fe:	e8 00 00 00 00       	call   a5a03 <do_user_addr_fault+0x143>	a59ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0143    a5a03:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
014d    a5a0d:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # a5a15 <do_user_addr_fault+0x155>	a5a11: R_X86_64_PC32	current_kprobe-0x4
0155    a5a15:	31 ff                	xor    %edi,%edi
0157    a5a17:	48 89 de             	mov    %rbx,%rsi
015a    a5a1a:	e8 00 00 00 00       	call   a5a1f <do_user_addr_fault+0x15f>	a5a1b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
015f    a5a1f:	48 85 db             	test   %rbx,%rbx
0162    a5a22:	74 27                	je     a5a4b <do_user_addr_fault+0x18b>
0164    a5a24:	4c 89 e7             	mov    %r12,%rdi
0167    a5a27:	be 0e 00 00 00       	mov    $0xe,%esi
016c    a5a2c:	e8 00 00 00 00       	call   a5a31 <do_user_addr_fault+0x171>	a5a2d: R_X86_64_PLT32	kprobe_fault_handler-0x4
0171    a5a31:	89 c3                	mov    %eax,%ebx
0173    a5a33:	31 ff                	xor    %edi,%edi
0175    a5a35:	89 c6                	mov    %eax,%esi
0177    a5a37:	e8 00 00 00 00       	call   a5a3c <do_user_addr_fault+0x17c>	a5a38: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
017c    a5a3c:	85 db                	test   %ebx,%ebx
017e    a5a3e:	0f 85 aa 03 00 00    	jne    a5dee <do_user_addr_fault+0x52e>
0184    a5a44:	e8 00 00 00 00       	call   a5a49 <do_user_addr_fault+0x189>	a5a45: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0189    a5a49:	eb 16                	jmp    a5a61 <do_user_addr_fault+0x1a1>
018b    a5a4b:	e8 00 00 00 00       	call   a5a50 <do_user_addr_fault+0x190>	a5a4c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0190    a5a50:	eb 0f                	jmp    a5a61 <do_user_addr_fault+0x1a1>
0192    a5a52:	e8 00 00 00 00       	call   a5a57 <do_user_addr_fault+0x197>	a5a53: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0197    a5a57:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
01a1    a5a61:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
01a6    a5a66:	4c 89 f6             	mov    %r14,%rsi
01a9    a5a69:	48 83 e6 08          	and    $0x8,%rsi
01ad    a5a6d:	31 ff                	xor    %edi,%edi
01af    a5a6f:	e8 00 00 00 00       	call   a5a74 <do_user_addr_fault+0x1b4>	a5a70: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01b4    a5a74:	4c 89 f0             	mov    %r14,%rax
01b7    a5a77:	48 83 e0 08          	and    $0x8,%rax
01bb    a5a7b:	0f 85 95 02 00 00    	jne    a5d16 <do_user_addr_fault+0x456>
01c1    a5a81:	e8 00 00 00 00       	call   a5a86 <do_user_addr_fault+0x1c6>	a5a82: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01c6    a5a86:	e9 00 00 00 00       	jmp    a5a8b <do_user_addr_fault+0x1cb>	a5a87: R_X86_64_PLT32	.altinstr_aux+0x9b0
01cb    a5a8b:	e8 00 00 00 00       	call   a5a90 <do_user_addr_fault+0x1d0>	a5a8c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01d0    a5a90:	4c 89 f6             	mov    %r14,%rsi
01d3    a5a93:	48 83 e6 04          	and    $0x4,%rsi
01d7    a5a97:	31 ff                	xor    %edi,%edi
01d9    a5a99:	e8 00 00 00 00       	call   a5a9e <do_user_addr_fault+0x1de>	a5a9a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01de    a5a9e:	4c 89 f0             	mov    %r14,%rax
01e1    a5aa1:	48 83 e0 04          	and    $0x4,%rax
01e5    a5aa5:	75 53                	jne    a5afa <do_user_addr_fault+0x23a>
01e7    a5aa7:	49 8d 9c 24 90 00 00 00 	lea    0x90(%r12),%rbx
01ef    a5aaf:	48 89 d8             	mov    %rbx,%rax
01f2    a5ab2:	48 c1 e8 03          	shr    $0x3,%rax
01f6    a5ab6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
01fa    a5aba:	74 08                	je     a5ac4 <do_user_addr_fault+0x204>
01fc    a5abc:	48 89 df             	mov    %rbx,%rdi
01ff    a5abf:	e8 00 00 00 00       	call   a5ac4 <do_user_addr_fault+0x204>	a5ac0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0204    a5ac4:	48 8b 1b             	mov    (%rbx),%rbx
0207    a5ac7:	bd 00 00 04 00       	mov    $0x40000,%ebp
020c    a5acc:	be 00 00 04 00       	mov    $0x40000,%esi
0211    a5ad1:	48 21 de             	and    %rbx,%rsi
0214    a5ad4:	31 ff                	xor    %edi,%edi
0216    a5ad6:	e8 00 00 00 00       	call   a5adb <do_user_addr_fault+0x21b>	a5ad7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
021b    a5adb:	48 21 dd             	and    %rbx,%rbp
021e    a5ade:	0f 84 b8 02 00 00    	je     a5d9c <do_user_addr_fault+0x4dc>
0224    a5ae4:	e8 00 00 00 00       	call   a5ae9 <do_user_addr_fault+0x229>	a5ae5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0229    a5ae9:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0233    a5af3:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0238    a5af8:	eb 05                	jmp    a5aff <do_user_addr_fault+0x23f>
023a    a5afa:	e8 00 00 00 00       	call   a5aff <do_user_addr_fault+0x23f>	a5afb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
023f    a5aff:	48 81 c3 e0 22 00 00 	add    $0x22e0,%rbx
0246    a5b06:	48 89 d8             	mov    %rbx,%rax
0249    a5b09:	48 c1 e8 03          	shr    $0x3,%rax
024d    a5b0d:	8a 04 28             	mov    (%rax,%rbp,1),%al
0250    a5b10:	84 c0                	test   %al,%al
0252    a5b12:	0f 85 f8 02 00 00    	jne    a5e10 <do_user_addr_fault+0x550>
0258    a5b18:	8b 1b                	mov    (%rbx),%ebx
025a    a5b1a:	31 ff                	xor    %edi,%edi
025c    a5b1c:	89 de                	mov    %ebx,%esi
025e    a5b1e:	e8 00 00 00 00       	call   a5b23 <do_user_addr_fault+0x263>	a5b1f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0263    a5b23:	85 db                	test   %ebx,%ebx
0265    a5b25:	0f 85 05 02 00 00    	jne    a5d30 <do_user_addr_fault+0x470>
026b    a5b2b:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # a5b32 <do_user_addr_fault+0x272>	a5b2e: R_X86_64_PC32	pcpu_hot+0x4
0272    a5b32:	89 de                	mov    %ebx,%esi
0274    a5b34:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
027a    a5b3a:	31 ff                	xor    %edi,%edi
027c    a5b3c:	e8 00 00 00 00       	call   a5b41 <do_user_addr_fault+0x281>	a5b3d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0281    a5b41:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
0287    a5b47:	0f 85 ea 01 00 00    	jne    a5d37 <do_user_addr_fault+0x477>
028d    a5b4d:	48 83 7c 24 38 00    	cmpq   $0x0,0x38(%rsp)
0293    a5b53:	0f 84 de 01 00 00    	je     a5d37 <do_user_addr_fault+0x477>
0299    a5b59:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
029e    a5b5e:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
02a2    a5b62:	74 08                	je     a5b6c <do_user_addr_fault+0x2ac>
02a4    a5b64:	4c 89 ef             	mov    %r13,%rdi
02a7    a5b67:	e8 00 00 00 00       	call   a5b6c <do_user_addr_fault+0x2ac>	a5b68: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02ac    a5b6c:	49 8b 5d 00          	mov    0x0(%r13),%rbx
02b0    a5b70:	48 89 de             	mov    %rbx,%rsi
02b3    a5b73:	48 83 e6 03          	and    $0x3,%rsi
02b7    a5b77:	31 ff                	xor    %edi,%edi
02b9    a5b79:	e8 00 00 00 00       	call   a5b7e <do_user_addr_fault+0x2be>	a5b7a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
02be    a5b7e:	48 83 e3 03          	and    $0x3,%rbx
02c2    a5b82:	74 13                	je     a5b97 <do_user_addr_fault+0x2d7>
02c4    a5b84:	e8 00 00 00 00       	call   a5b89 <do_user_addr_fault+0x2c9>	a5b85: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02c9    a5b89:	e8 00 00 00 00       	call   a5b8e <do_user_addr_fault+0x2ce>	a5b8a: R_X86_64_PLT32	trace_hardirqs_on-0x4
02ce    a5b8e:	fb                   	sti
02cf    a5b8f:	41 bf 54 02 00 00    	mov    $0x254,%r15d
02d5    a5b95:	eb 51                	jmp    a5be8 <do_user_addr_fault+0x328>
02d7    a5b97:	49 8d 9c 24 90 00 00 00 	lea    0x90(%r12),%rbx
02df    a5b9f:	48 89 d8             	mov    %rbx,%rax
02e2    a5ba2:	48 c1 e8 03          	shr    $0x3,%rax
02e6    a5ba6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
02ea    a5baa:	74 08                	je     a5bb4 <do_user_addr_fault+0x2f4>
02ec    a5bac:	48 89 df             	mov    %rbx,%rdi
02ef    a5baf:	e8 00 00 00 00       	call   a5bb4 <do_user_addr_fault+0x2f4>	a5bb0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02f4    a5bb4:	48 8b 1b             	mov    (%rbx),%rbx
02f7    a5bb7:	bd 00 02 00 00       	mov    $0x200,%ebp
02fc    a5bbc:	be 00 02 00 00       	mov    $0x200,%esi
0301    a5bc1:	48 21 de             	and    %rbx,%rsi
0304    a5bc4:	31 ff                	xor    %edi,%edi
0306    a5bc6:	e8 00 00 00 00       	call   a5bcb <do_user_addr_fault+0x30b>	a5bc7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
030b    a5bcb:	48 21 dd             	and    %rbx,%rbp
030e    a5bce:	75 07                	jne    a5bd7 <do_user_addr_fault+0x317>
0310    a5bd0:	e8 00 00 00 00       	call   a5bd5 <do_user_addr_fault+0x315>	a5bd1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0315    a5bd5:	eb 0b                	jmp    a5be2 <do_user_addr_fault+0x322>
0317    a5bd7:	e8 00 00 00 00       	call   a5bdc <do_user_addr_fault+0x31c>	a5bd8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
031c    a5bdc:	e8 00 00 00 00       	call   a5be1 <do_user_addr_fault+0x321>	a5bdd: R_X86_64_PLT32	trace_hardirqs_on-0x4
0321    a5be1:	fb                   	sti
0322    a5be2:	41 bf 14 02 00 00    	mov    $0x214,%r15d
0328    a5be8:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
032d    a5bed:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0332    a5bf2:	e8 00 00 00 00       	call   a5bf7 <do_user_addr_fault+0x337>	a5bf3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0337    a5bf7:	44 89 f6             	mov    %r14d,%esi
033a    a5bfa:	83 e6 02             	and    $0x2,%esi
033d    a5bfd:	31 ff                	xor    %edi,%edi
033f    a5bff:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
0344    a5c04:	e8 00 00 00 00       	call   a5c09 <do_user_addr_fault+0x349>	a5c05: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0349    a5c09:	48 89 eb             	mov    %rbp,%rbx
034c    a5c0c:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
0353    a5c13:	48 c7 c7 00 00 60 ff 	mov    $0xffffffffff600000,%rdi
035a    a5c1a:	48 89 de             	mov    %rbx,%rsi
035d    a5c1d:	e8 00 00 00 00       	call   a5c22 <do_user_addr_fault+0x362>	a5c1e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0362    a5c22:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
0369    a5c29:	75 1c                	jne    a5c47 <do_user_addr_fault+0x387>
036b    a5c2b:	4c 89 f7             	mov    %r14,%rdi
036e    a5c2e:	4c 89 e6             	mov    %r12,%rsi
0371    a5c31:	48 89 ea             	mov    %rbp,%rdx
0374    a5c34:	e8 00 00 00 00       	call   a5c39 <do_user_addr_fault+0x379>	a5c35: R_X86_64_PLT32	emulate_vsyscall-0x4
0379    a5c39:	84 c0                	test   %al,%al
037b    a5c3b:	74 1a                	je     a5c57 <do_user_addr_fault+0x397>
037d    a5c3d:	e8 00 00 00 00       	call   a5c42 <do_user_addr_fault+0x382>	a5c3e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0382    a5c42:	e9 df 02 00 00       	jmp    a5f26 <do_user_addr_fault+0x666>
0387    a5c47:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
038c    a5c4c:	4c 89 24 24          	mov    %r12,(%rsp)
0390    a5c50:	e8 00 00 00 00       	call   a5c55 <do_user_addr_fault+0x395>	a5c51: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0395    a5c55:	eb 0e                	jmp    a5c65 <do_user_addr_fault+0x3a5>
0397    a5c57:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
039c    a5c5c:	4c 89 24 24          	mov    %r12,(%rsp)
03a0    a5c60:	e8 00 00 00 00       	call   a5c65 <do_user_addr_fault+0x3a5>	a5c61: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03a5    a5c65:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
03aa    a5c6a:	48 d1 eb             	shr    %rbx
03ad    a5c6d:	44 89 f5             	mov    %r14d,%ebp
03b0    a5c70:	83 e5 10             	and    $0x10,%ebp
03b3    a5c73:	c1 e5 04             	shl    $0x4,%ebp
03b6    a5c76:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
03bb    a5c7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
03c0    a5c80:	e8 00 00 00 00       	call   a5c85 <do_user_addr_fault+0x3c5>	a5c81: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03c5    a5c85:	09 dd                	or     %ebx,%ebp
03c7    a5c87:	49 8d bc 24 28 01 00 00 	lea    0x128(%r12),%rdi
03cf    a5c8f:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
03d4    a5c94:	e8 00 00 00 00       	call   a5c99 <do_user_addr_fault+0x3d9>	a5c95: R_X86_64_PLT32	down_read_trylock-0x4
03d9    a5c99:	89 c3                	mov    %eax,%ebx
03db    a5c9b:	31 ff                	xor    %edi,%edi
03dd    a5c9d:	89 c6                	mov    %eax,%esi
03df    a5c9f:	e8 00 00 00 00       	call   a5ca4 <do_user_addr_fault+0x3e4>	a5ca0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
03e4    a5ca4:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
03e9    a5ca9:	e8 00 00 00 00       	call   a5cae <do_user_addr_fault+0x3ee>	a5caa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03ee    a5cae:	44 09 fd             	or     %r15d,%ebp
03f1    a5cb1:	89 6c 24 24          	mov    %ebp,0x24(%rsp)
03f5    a5cb5:	85 db                	test   %ebx,%ebx
03f7    a5cb7:	0f 84 94 00 00 00    	je     a5d51 <do_user_addr_fault+0x491>
03fd    a5cbd:	e8 00 00 00 00       	call   a5cc2 <do_user_addr_fault+0x402>	a5cbe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0402    a5cc2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	a5cc5: R_X86_64_32S	.rodata+0x2d1a0
0409    a5cc9:	be 6a 05 00 00       	mov    $0x56a,%esi
040e    a5cce:	e8 00 00 00 00       	call   a5cd3 <do_user_addr_fault+0x413>	a5ccf: R_X86_64_PLT32	__might_sleep-0x4
0413    a5cd3:	e8 00 00 00 00       	call   a5cd8 <do_user_addr_fault+0x418>	a5cd4: R_X86_64_PLT32	__SCT__might_resched-0x4
0418    a5cd8:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0422    a5ce2:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
0427    a5ce7:	e9 c3 01 00 00       	jmp    a5eaf <do_user_addr_fault+0x5ef>
042c    a5cec:	e8 00 00 00 00       	call   a5cf1 <do_user_addr_fault+0x431>	a5ced: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0431    a5cf1:	4c 89 e7             	mov    %r12,%rdi
0434    a5cf4:	4c 89 f6             	mov    %r14,%rsi
0437    a5cf7:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
043c    a5cfc:	48 83 c4 60          	add    $0x60,%rsp
0440    a5d00:	5b                   	pop    %rbx
0441    a5d01:	41 5c                	pop    %r12
0443    a5d03:	41 5d                	pop    %r13
0445    a5d05:	41 5e                	pop    %r14
0447    a5d07:	41 5f                	pop    %r15
0449    a5d09:	5d                   	pop    %rbp
044a    a5d0a:	31 c0                	xor    %eax,%eax
044c    a5d0c:	31 c9                	xor    %ecx,%ecx
044e    a5d0e:	45 31 c0             	xor    %r8d,%r8d
0451    a5d11:	e9 6a 12 00 00       	jmp    a6f80 <page_fault_oops>
0456    a5d16:	e8 00 00 00 00       	call   a5d1b <do_user_addr_fault+0x45b>	a5d17: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
045b    a5d1b:	4c 89 e7             	mov    %r12,%rdi
045e    a5d1e:	4c 89 f6             	mov    %r14,%rsi
0461    a5d21:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0466    a5d26:	e8 15 25 00 00       	call   a8240 <pgtable_bad>
046b    a5d2b:	e9 56 fd ff ff       	jmp    a5a86 <do_user_addr_fault+0x1c6>
0470    a5d30:	e8 00 00 00 00       	call   a5d35 <do_user_addr_fault+0x475>	a5d31: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0475    a5d35:	eb 05                	jmp    a5d3c <do_user_addr_fault+0x47c>
0477    a5d37:	e8 00 00 00 00       	call   a5d3c <do_user_addr_fault+0x47c>	a5d38: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
047c    a5d3c:	4c 89 e7             	mov    %r12,%rdi
047f    a5d3f:	4c 89 f6             	mov    %r14,%rsi
0482    a5d42:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0487    a5d47:	e8 34 09 00 00       	call   a6680 <bad_area_nosemaphore>
048c    a5d4c:	e9 d5 01 00 00       	jmp    a5f26 <do_user_addr_fault+0x666>
0491    a5d51:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
049b    a5d5b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
04a0    a5d60:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
04a5    a5d65:	74 0a                	je     a5d71 <do_user_addr_fault+0x4b1>
04a7    a5d67:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
04ac    a5d6c:	e8 00 00 00 00       	call   a5d71 <do_user_addr_fault+0x4b1>	a5d6d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04b1    a5d71:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
04b6    a5d76:	48 8b 18             	mov    (%rax),%rbx
04b9    a5d79:	48 89 de             	mov    %rbx,%rsi
04bc    a5d7c:	48 83 e6 03          	and    $0x3,%rsi
04c0    a5d80:	31 ff                	xor    %edi,%edi
04c2    a5d82:	e8 00 00 00 00       	call   a5d87 <do_user_addr_fault+0x4c7>	a5d83: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04c7    a5d87:	48 83 e3 03          	and    $0x3,%rbx
04cb    a5d8b:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
04d0    a5d90:	74 24                	je     a5db6 <do_user_addr_fault+0x4f6>
04d2    a5d92:	e8 00 00 00 00       	call   a5d97 <do_user_addr_fault+0x4d7>	a5d93: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04d7    a5d97:	e9 39 04 00 00       	jmp    a61d5 <do_user_addr_fault+0x915>
04dc    a5d9c:	e8 00 00 00 00       	call   a5da1 <do_user_addr_fault+0x4e1>	a5d9d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04e1    a5da1:	4c 89 e7             	mov    %r12,%rdi
04e4    a5da4:	4c 89 f6             	mov    %r14,%rsi
04e7    a5da7:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
04ec    a5dac:	e8 cf 11 00 00       	call   a6f80 <page_fault_oops>
04f1    a5db1:	e9 70 01 00 00       	jmp    a5f26 <do_user_addr_fault+0x666>
04f6    a5db6:	48 8b 04 24          	mov    (%rsp),%rax
04fa    a5dba:	48 8d 98 80 00 00 00 	lea    0x80(%rax),%rbx
0501    a5dc1:	48 89 d8             	mov    %rbx,%rax
0504    a5dc4:	48 c1 e8 03          	shr    $0x3,%rax
0508    a5dc8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
050d    a5dcd:	74 08                	je     a5dd7 <do_user_addr_fault+0x517>
050f    a5dcf:	48 89 df             	mov    %rbx,%rdi
0512    a5dd2:	e8 00 00 00 00       	call   a5dd7 <do_user_addr_fault+0x517>	a5dd3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0517    a5dd7:	48 8b 3b             	mov    (%rbx),%rdi
051a    a5dda:	e8 00 00 00 00       	call   a5ddf <do_user_addr_fault+0x51f>	a5ddb: R_X86_64_PLT32	search_exception_tables-0x4
051f    a5ddf:	48 85 c0             	test   %rax,%rax
0522    a5de2:	74 18                	je     a5dfc <do_user_addr_fault+0x53c>
0524    a5de4:	e8 00 00 00 00       	call   a5de9 <do_user_addr_fault+0x529>	a5de5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0529    a5de9:	e9 e7 03 00 00       	jmp    a61d5 <do_user_addr_fault+0x915>
052e    a5dee:	e8 00 00 00 00       	call   a5df3 <do_user_addr_fault+0x533>	a5def: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0533    a5df3:	90                   	nop
0534    a5df4:	0f 0b                	ud2
0536    a5df6:	90                   	nop
0537    a5df7:	e9 2a 01 00 00       	jmp    a5f26 <do_user_addr_fault+0x666>
053c    a5dfc:	e8 00 00 00 00       	call   a5e01 <do_user_addr_fault+0x541>	a5dfd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0541    a5e01:	48 8b 3c 24          	mov    (%rsp),%rdi
0545    a5e05:	4c 89 f6             	mov    %r14,%rsi
0548    a5e08:	48 89 ea             	mov    %rbp,%rdx
054b    a5e0b:	e9 37 ff ff ff       	jmp    a5d47 <do_user_addr_fault+0x487>
0550    a5e10:	89 d9                	mov    %ebx,%ecx
0552    a5e12:	80 e1 07             	and    $0x7,%cl
0555    a5e15:	80 c1 03             	add    $0x3,%cl
0558    a5e18:	38 c1                	cmp    %al,%cl
055a    a5e1a:	0f 8c f8 fc ff ff    	jl     a5b18 <do_user_addr_fault+0x258>
0560    a5e20:	48 89 df             	mov    %rbx,%rdi
0563    a5e23:	e8 00 00 00 00       	call   a5e28 <do_user_addr_fault+0x568>	a5e24: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0568    a5e28:	e9 eb fc ff ff       	jmp    a5b18 <do_user_addr_fault+0x258>
056d    a5e2d:	f3 0f 1e fa          	endbr64
0571    a5e31:	e8 00 00 00 00       	call   a5e36 <do_user_addr_fault+0x576>	a5e32: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0576    a5e36:	e9 55 fc ff ff       	jmp    a5a90 <do_user_addr_fault+0x1d0>
057b    a5e3b:	f3 0f 1e fa          	endbr64
057f    a5e3f:	e8 00 00 00 00       	call   a5e44 <do_user_addr_fault+0x584>	a5e40: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0584    a5e44:	e9 b6 fc ff ff       	jmp    a5aff <do_user_addr_fault+0x23f>
0589    a5e49:	f3 0f 1e fa          	endbr64
058d    a5e4d:	e8 00 00 00 00       	call   a5e52 <do_user_addr_fault+0x592>	a5e4e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0592    a5e52:	be 01 00 00 00       	mov    $0x1,%esi
0597    a5e57:	bf 02 00 00 00       	mov    $0x2,%edi
059c    a5e5c:	4c 89 e2             	mov    %r12,%rdx
059f    a5e5f:	48 89 e9             	mov    %rbp,%rcx
05a2    a5e62:	e8 00 00 00 00       	call   a5e67 <do_user_addr_fault+0x5a7>	a5e63: R_X86_64_PLT32	__perf_sw_event-0x4
05a7    a5e67:	e9 8b fd ff ff       	jmp    a5bf7 <do_user_addr_fault+0x337>
05ac    a5e6c:	f3 0f 1e fa          	endbr64
05b0    a5e70:	e8 00 00 00 00       	call   a5e75 <do_user_addr_fault+0x5b5>	a5e71: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05b5    a5e75:	4c 89 e7             	mov    %r12,%rdi
05b8    a5e78:	31 f6                	xor    %esi,%esi
05ba    a5e7a:	e8 00 00 00 00       	call   a5e7f <do_user_addr_fault+0x5bf>	a5e7b: R_X86_64_PLT32	__mmap_lock_do_trace_start_locking-0x4
05bf    a5e7f:	e9 01 fe ff ff       	jmp    a5c85 <do_user_addr_fault+0x3c5>
05c4    a5e84:	f3 0f 1e fa          	endbr64
05c8    a5e88:	45 31 e4             	xor    %r12d,%r12d
05cb    a5e8b:	85 db                	test   %ebx,%ebx
05cd    a5e8d:	41 0f 95 c4          	setne  %r12b
05d1    a5e91:	e8 00 00 00 00       	call   a5e96 <do_user_addr_fault+0x5d6>	a5e92: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05d6    a5e96:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
05db    a5e9b:	31 f6                	xor    %esi,%esi
05dd    a5e9d:	44 89 e2             	mov    %r12d,%edx
05e0    a5ea0:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
05e5    a5ea5:	e8 00 00 00 00       	call   a5eaa <do_user_addr_fault+0x5ea>	a5ea6: R_X86_64_PLT32	__mmap_lock_do_trace_acquire_returned-0x4
05ea    a5eaa:	e9 ff fd ff ff       	jmp    a5cae <do_user_addr_fault+0x3ee>
05ef    a5eaf:	4c 89 e7             	mov    %r12,%rdi
05f2    a5eb2:	48 89 ee             	mov    %rbp,%rsi
05f5    a5eb5:	e8 00 00 00 00       	call   a5eba <do_user_addr_fault+0x5fa>	a5eb6: R_X86_64_PLT32	find_vma-0x4
05fa    a5eba:	48 85 c0             	test   %rax,%rax
05fd    a5ebd:	0f 84 13 04 00 00    	je     a62d6 <do_user_addr_fault+0xa16>
0603    a5ec3:	49 89 c4             	mov    %rax,%r12
0606    a5ec6:	48 c1 e8 03          	shr    $0x3,%rax
060a    a5eca:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
060f    a5ecf:	74 08                	je     a5ed9 <do_user_addr_fault+0x619>
0611    a5ed1:	4c 89 e7             	mov    %r12,%rdi
0614    a5ed4:	e8 00 00 00 00       	call   a5ed9 <do_user_addr_fault+0x619>	a5ed5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0619    a5ed9:	49 8b 1c 24          	mov    (%r12),%rbx
061d    a5edd:	48 89 df             	mov    %rbx,%rdi
0620    a5ee0:	48 89 ee             	mov    %rbp,%rsi
0623    a5ee3:	e8 00 00 00 00       	call   a5ee8 <do_user_addr_fault+0x628>	a5ee4: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0628    a5ee8:	48 39 eb             	cmp    %rbp,%rbx
062b    a5eeb:	0f 87 fe 03 00 00    	ja     a62ef <do_user_addr_fault+0xa2f>
0631    a5ef1:	e8 00 00 00 00       	call   a5ef6 <do_user_addr_fault+0x636>	a5ef2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0636    a5ef6:	4c 89 f6             	mov    %r14,%rsi
0639    a5ef9:	48 81 e6 20 80 00 00 	and    $0x8020,%rsi
0640    a5f00:	31 ff                	xor    %edi,%edi
0642    a5f02:	e8 00 00 00 00       	call   a5f07 <do_user_addr_fault+0x647>	a5f03: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0647    a5f07:	4c 89 f0             	mov    %r14,%rax
064a    a5f0a:	48 25 20 80 00 00    	and    $0x8020,%rax
0650    a5f10:	74 2e                	je     a5f40 <do_user_addr_fault+0x680>
0652    a5f12:	e8 00 00 00 00       	call   a5f17 <do_user_addr_fault+0x657>	a5f13: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0657    a5f17:	48 8b 3c 24          	mov    (%rsp),%rdi
065b    a5f1b:	4c 89 f6             	mov    %r14,%rsi
065e    a5f1e:	48 89 ea             	mov    %rbp,%rdx
0661    a5f21:	e8 5a 24 00 00       	call   a8380 <bad_area_access_error>
0666    a5f26:	48 83 c4 60          	add    $0x60,%rsp
066a    a5f2a:	5b                   	pop    %rbx
066b    a5f2b:	41 5c                	pop    %r12
066d    a5f2d:	41 5d                	pop    %r13
066f    a5f2f:	41 5e                	pop    %r14
0671    a5f31:	41 5f                	pop    %r15
0673    a5f33:	5d                   	pop    %rbp
0674    a5f34:	31 c0                	xor    %eax,%eax
0676    a5f36:	31 c9                	xor    %ecx,%ecx
0678    a5f38:	45 31 c0             	xor    %r8d,%r8d
067b    a5f3b:	e9 00 00 00 00       	jmp    a5f40 <do_user_addr_fault+0x680>	a5f3c: R_X86_64_PLT32	__x86_return_thunk-0x4
0680    a5f40:	48 83 7c 24 50 00    	cmpq   $0x0,0x50(%rsp)
0686    a5f46:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
068b    a5f4b:	75 56                	jne    a5fa3 <do_user_addr_fault+0x6e3>
068d    a5f4d:	4c 89 f6             	mov    %r14,%rsi
0690    a5f50:	48 83 e6 01          	and    $0x1,%rsi
0694    a5f54:	31 ff                	xor    %edi,%edi
0696    a5f56:	e8 00 00 00 00       	call   a5f5b <do_user_addr_fault+0x69b>	a5f57: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
069b    a5f5b:	4c 89 f0             	mov    %r14,%rax
069e    a5f5e:	48 83 e0 01          	and    $0x1,%rax
06a2    a5f62:	0f 85 25 04 00 00    	jne    a638d <do_user_addr_fault+0xacd>
06a8    a5f68:	49 89 ee             	mov    %rbp,%r14
06ab    a5f6b:	e8 00 00 00 00       	call   a5f70 <do_user_addr_fault+0x6b0>	a5f6c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06b0    a5f70:	4c 89 e3             	mov    %r12,%rbx
06b3    a5f73:	48 83 c3 20          	add    $0x20,%rbx
06b7    a5f77:	48 89 d8             	mov    %rbx,%rax
06ba    a5f7a:	48 c1 e8 03          	shr    $0x3,%rax
06be    a5f7e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
06c3    a5f83:	74 08                	je     a5f8d <do_user_addr_fault+0x6cd>
06c5    a5f85:	48 89 df             	mov    %rbx,%rdi
06c8    a5f88:	e8 00 00 00 00       	call   a5f8d <do_user_addr_fault+0x6cd>	a5f89: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06cd    a5f8d:	48 8b 33             	mov    (%rbx),%rsi
06d0    a5f90:	31 ed                	xor    %ebp,%ebp
06d2    a5f92:	48 83 e6 07          	and    $0x7,%rsi
06d6    a5f96:	40 0f 94 c5          	sete   %bpl
06da    a5f9a:	31 ff                	xor    %edi,%edi
06dc    a5f9c:	e8 00 00 00 00       	call   a5fa1 <do_user_addr_fault+0x6e1>	a5f9d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
06e1    a5fa1:	eb 2e                	jmp    a5fd1 <do_user_addr_fault+0x711>
06e3    a5fa3:	49 89 ee             	mov    %rbp,%r14
06e6    a5fa6:	e8 00 00 00 00       	call   a5fab <do_user_addr_fault+0x6eb>	a5fa7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06eb    a5fab:	4c 89 e3             	mov    %r12,%rbx
06ee    a5fae:	48 83 c3 20          	add    $0x20,%rbx
06f2    a5fb2:	48 89 d8             	mov    %rbx,%rax
06f5    a5fb5:	48 c1 e8 03          	shr    $0x3,%rax
06f9    a5fb9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
06fe    a5fbe:	74 08                	je     a5fc8 <do_user_addr_fault+0x708>
0700    a5fc0:	48 89 df             	mov    %rbx,%rdi
0703    a5fc3:	e8 00 00 00 00       	call   a5fc8 <do_user_addr_fault+0x708>	a5fc4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0708    a5fc8:	31 ed                	xor    %ebp,%ebp
070a    a5fca:	f6 03 02             	testb  $0x2,(%rbx)
070d    a5fcd:	40 0f 94 c5          	sete   %bpl
0711    a5fd1:	8b 5c 24 24          	mov    0x24(%rsp),%ebx
0715    a5fd5:	31 ff                	xor    %edi,%edi
0717    a5fd7:	89 ee                	mov    %ebp,%esi
0719    a5fd9:	e8 00 00 00 00       	call   a5fde <do_user_addr_fault+0x71e>	a5fda: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
071e    a5fde:	85 ed                	test   %ebp,%ebp
0720    a5fe0:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
0725    a5fe5:	0f 85 77 03 00 00    	jne    a6362 <do_user_addr_fault+0xaa2>
072b    a5feb:	4c 89 e7             	mov    %r12,%rdi
072e    a5fee:	4c 89 f6             	mov    %r14,%rsi
0731    a5ff1:	89 da                	mov    %ebx,%edx
0733    a5ff3:	48 8b 0c 24          	mov    (%rsp),%rcx
0737    a5ff7:	e8 00 00 00 00       	call   a5ffc <do_user_addr_fault+0x73c>	a5ff8: R_X86_64_PLT32	handle_mm_fault-0x4
073c    a5ffc:	89 c3                	mov    %eax,%ebx
073e    a5ffe:	89 c6                	mov    %eax,%esi
0740    a6000:	81 e6 00 04 00 00    	and    $0x400,%esi
0746    a6006:	31 ff                	xor    %edi,%edi
0748    a6008:	e8 00 00 00 00       	call   a600d <do_user_addr_fault+0x74d>	a6009: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
074d    a600d:	89 d8                	mov    %ebx,%eax
074f    a600f:	25 00 04 00 00       	and    $0x400,%eax
0754    a6014:	0f 84 c8 01 00 00    	je     a61e2 <do_user_addr_fault+0x922>
075a    a601a:	89 5c 24 4c          	mov    %ebx,0x4c(%rsp)
075e    a601e:	4c 89 f5             	mov    %r14,%rbp
0761    a6021:	4c 89 ff             	mov    %r15,%rdi
0764    a6024:	be 08 00 00 00       	mov    $0x8,%esi
0769    a6029:	e8 00 00 00 00       	call   a602e <do_user_addr_fault+0x76e>	a602a: R_X86_64_PLT32	__kasan_check_read-0x4
076e    a602e:	4d 89 fc             	mov    %r15,%r12
0771    a6031:	49 c1 ec 03          	shr    $0x3,%r12
0775    a6035:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
077f    a603f:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
0784    a6044:	74 08                	je     a604e <do_user_addr_fault+0x78e>
0786    a6046:	4c 89 ff             	mov    %r15,%rdi
0789    a6049:	e8 00 00 00 00       	call   a604e <do_user_addr_fault+0x78e>	a604a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
078e    a604e:	49 8b 1f             	mov    (%r15),%rbx
0791    a6051:	48 89 de             	mov    %rbx,%rsi
0794    a6054:	48 83 e6 04          	and    $0x4,%rsi
0798    a6058:	31 ff                	xor    %edi,%edi
079a    a605a:	e8 00 00 00 00       	call   a605f <do_user_addr_fault+0x79f>	a605b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
079f    a605f:	48 83 e3 04          	and    $0x4,%rbx
07a3    a6063:	75 07                	jne    a606c <do_user_addr_fault+0x7ac>
07a5    a6065:	e8 00 00 00 00       	call   a606a <do_user_addr_fault+0x7aa>	a6066: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07aa    a606a:	eb 50                	jmp    a60bc <do_user_addr_fault+0x7fc>
07ac    a606c:	4c 89 e9             	mov    %r13,%rcx
07af    a606f:	49 8d 9f e8 07 00 00 	lea    0x7e8(%r15),%rbx
07b6    a6076:	48 89 d8             	mov    %rbx,%rax
07b9    a6079:	48 c1 e8 03          	shr    $0x3,%rax
07bd    a607d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
07c2    a6082:	74 08                	je     a608c <do_user_addr_fault+0x7cc>
07c4    a6084:	48 89 df             	mov    %rbx,%rdi
07c7    a6087:	e8 00 00 00 00       	call   a608c <do_user_addr_fault+0x7cc>	a6088: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07cc    a608c:	48 8b 1b             	mov    (%rbx),%rbx
07cf    a608f:	41 be 00 01 00 00    	mov    $0x100,%r14d
07d5    a6095:	be 00 01 00 00       	mov    $0x100,%esi
07da    a609a:	48 21 de             	and    %rbx,%rsi
07dd    a609d:	31 ff                	xor    %edi,%edi
07df    a609f:	e8 00 00 00 00       	call   a60a4 <do_user_addr_fault+0x7e4>	a60a0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
07e4    a60a4:	49 21 de             	and    %rbx,%r14
07e7    a60a7:	0f 85 a7 01 00 00    	jne    a6254 <do_user_addr_fault+0x994>
07ed    a60ad:	e8 00 00 00 00       	call   a60b2 <do_user_addr_fault+0x7f2>	a60ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f2    a60b2:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
07fc    a60bc:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0801    a60c1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0806    a60c6:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
080b    a60cb:	74 08                	je     a60d5 <do_user_addr_fault+0x815>
080d    a60cd:	48 89 df             	mov    %rbx,%rdi
0810    a60d0:	e8 00 00 00 00       	call   a60d5 <do_user_addr_fault+0x815>	a60d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0815    a60d5:	48 8b 1b             	mov    (%rbx),%rbx
0818    a60d8:	48 89 de             	mov    %rbx,%rsi
081b    a60db:	48 83 e6 03          	and    $0x3,%rsi
081f    a60df:	31 ff                	xor    %edi,%edi
0821    a60e1:	e8 00 00 00 00       	call   a60e6 <do_user_addr_fault+0x826>	a60e2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0826    a60e6:	48 83 e3 03          	and    $0x3,%rbx
082a    a60ea:	0f 84 b2 00 00 00    	je     a61a2 <do_user_addr_fault+0x8e2>
0830    a60f0:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0835    a60f5:	4c 89 f7             	mov    %r14,%rdi
0838    a60f8:	be 08 00 00 00       	mov    $0x8,%esi
083d    a60fd:	e8 00 00 00 00       	call   a6102 <do_user_addr_fault+0x842>	a60fe: R_X86_64_PLT32	__kasan_check_read-0x4
0842    a6102:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
0847    a6107:	74 08                	je     a6111 <do_user_addr_fault+0x851>
0849    a6109:	4c 89 f7             	mov    %r14,%rdi
084c    a610c:	e8 00 00 00 00       	call   a6111 <do_user_addr_fault+0x851>	a610d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0851    a6111:	49 8b 1e             	mov    (%r14),%rbx
0854    a6114:	bd 00 00 02 00       	mov    $0x20000,%ebp
0859    a6119:	be 00 00 02 00       	mov    $0x20000,%esi
085e    a611e:	48 21 de             	and    %rbx,%rsi
0861    a6121:	31 ff                	xor    %edi,%edi
0863    a6123:	e8 00 00 00 00       	call   a6128 <do_user_addr_fault+0x868>	a6124: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0868    a6128:	48 21 dd             	and    %rbx,%rbp
086b    a612b:	0f 85 43 02 00 00    	jne    a6374 <do_user_addr_fault+0xab4>
0871    a6131:	4c 89 f7             	mov    %r14,%rdi
0874    a6134:	be 08 00 00 00       	mov    $0x8,%esi
0879    a6139:	e8 00 00 00 00       	call   a613e <do_user_addr_fault+0x87e>	a613a: R_X86_64_PLT32	__kasan_check_read-0x4
087e    a613e:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0888    a6148:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
088d    a614d:	74 08                	je     a6157 <do_user_addr_fault+0x897>
088f    a614f:	4c 89 f7             	mov    %r14,%rdi
0892    a6152:	e8 00 00 00 00       	call   a6157 <do_user_addr_fault+0x897>	a6153: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0897    a6157:	49 8b 1e             	mov    (%r14),%rbx
089a    a615a:	48 89 de             	mov    %rbx,%rsi
089d    a615d:	48 83 e6 04          	and    $0x4,%rsi
08a1    a6161:	31 ff                	xor    %edi,%edi
08a3    a6163:	e8 00 00 00 00       	call   a6168 <do_user_addr_fault+0x8a8>	a6164: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
08a8    a6168:	48 83 e3 04          	and    $0x4,%rbx
08ac    a616c:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
08b1    a6171:	0f 85 bd 00 00 00    	jne    a6234 <do_user_addr_fault+0x974>
08b7    a6177:	8b 5c 24 4c          	mov    0x4c(%rsp),%ebx
08bb    a617b:	89 de                	mov    %ebx,%esi
08bd    a617d:	81 e6 00 40 00 00    	and    $0x4000,%esi
08c3    a6183:	31 ff                	xor    %edi,%edi
08c5    a6185:	e8 00 00 00 00       	call   a618a <do_user_addr_fault+0x8ca>	a6186: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08ca    a618a:	81 e3 00 40 00 00    	and    $0x4000,%ebx
08d0    a6190:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
08d5    a6195:	0f 85 a5 00 00 00    	jne    a6240 <do_user_addr_fault+0x980>
08db    a619b:	e8 00 00 00 00       	call   a61a0 <do_user_addr_fault+0x8e0>	a619c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08e0    a61a0:	eb 29                	jmp    a61cb <do_user_addr_fault+0x90b>
08e2    a61a2:	8b 5c 24 4c          	mov    0x4c(%rsp),%ebx
08e6    a61a6:	89 de                	mov    %ebx,%esi
08e8    a61a8:	81 e6 00 40 00 00    	and    $0x4000,%esi
08ee    a61ae:	31 ff                	xor    %edi,%edi
08f0    a61b0:	e8 00 00 00 00       	call   a61b5 <do_user_addr_fault+0x8f5>	a61b1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08f5    a61b5:	81 e3 00 40 00 00    	and    $0x4000,%ebx
08fb    a61bb:	0f 85 0b 01 00 00    	jne    a62cc <do_user_addr_fault+0xa0c>
0901    a61c1:	e8 00 00 00 00       	call   a61c6 <do_user_addr_fault+0x906>	a61c2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0906    a61c6:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
090b    a61cb:	83 4c 24 24 20       	orl    $0x20,0x24(%rsp)
0910    a61d0:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
0915    a61d5:	4c 89 e7             	mov    %r12,%rdi
0918    a61d8:	e8 e3 20 00 00       	call   a82c0 <mmap_read_lock>
091d    a61dd:	e9 cd fc ff ff       	jmp    a5eaf <do_user_addr_fault+0x5ef>
0922    a61e2:	89 de                	mov    %ebx,%esi
0924    a61e4:	81 e6 00 40 00 00    	and    $0x4000,%esi
092a    a61ea:	31 ff                	xor    %edi,%edi
092c    a61ec:	e8 00 00 00 00       	call   a61f1 <do_user_addr_fault+0x931>	a61ed: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0931    a61f1:	89 d8                	mov    %ebx,%eax
0933    a61f3:	25 00 40 00 00       	and    $0x4000,%eax
0938    a61f8:	75 50                	jne    a624a <do_user_addr_fault+0x98a>
093a    a61fa:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
093f    a61ff:	e8 00 00 00 00       	call   a6204 <do_user_addr_fault+0x944>	a6200: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0944    a6204:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
0949    a6209:	e8 00 00 00 00       	call   a620e <do_user_addr_fault+0x94e>	a620a: R_X86_64_PLT32	up_read-0x4
094e    a620e:	89 de                	mov    %ebx,%esi
0950    a6210:	81 e6 73 08 00 00    	and    $0x873,%esi
0956    a6216:	31 ff                	xor    %edi,%edi
0958    a6218:	e8 00 00 00 00       	call   a621d <do_user_addr_fault+0x95d>	a6219: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
095d    a621d:	89 d8                	mov    %ebx,%eax
095f    a621f:	25 73 08 00 00       	and    $0x873,%eax
0964    a6224:	0f 85 6d 01 00 00    	jne    a6397 <do_user_addr_fault+0xad7>
096a    a622a:	e8 00 00 00 00       	call   a622f <do_user_addr_fault+0x96f>	a622b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
096f    a622f:	e9 f2 fc ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
0974    a6234:	e8 00 00 00 00       	call   a6239 <do_user_addr_fault+0x979>	a6235: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0979    a6239:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
097e    a623e:	eb 2b                	jmp    a626b <do_user_addr_fault+0x9ab>
0980    a6240:	e8 00 00 00 00       	call   a6245 <do_user_addr_fault+0x985>	a6241: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0985    a6245:	e9 dc fc ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
098a    a624a:	e8 00 00 00 00       	call   a624f <do_user_addr_fault+0x98f>	a624b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
098f    a624f:	e9 d2 fc ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
0994    a6254:	e8 00 00 00 00       	call   a6259 <do_user_addr_fault+0x999>	a6255: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0999    a6259:	49 89 ef             	mov    %rbp,%r15
099c    a625c:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
09a1    a6261:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
09ab    a626b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
09b0    a6270:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
09b5    a6275:	48 8b 2c 24          	mov    (%rsp),%rbp
09b9    a6279:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
09be    a627e:	74 08                	je     a6288 <do_user_addr_fault+0x9c8>
09c0    a6280:	48 89 df             	mov    %rbx,%rdi
09c3    a6283:	e8 00 00 00 00       	call   a6288 <do_user_addr_fault+0x9c8>	a6284: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09c8    a6288:	48 8b 1b             	mov    (%rbx),%rbx
09cb    a628b:	48 89 de             	mov    %rbx,%rsi
09ce    a628e:	48 83 e6 03          	and    $0x3,%rsi
09d2    a6292:	31 ff                	xor    %edi,%edi
09d4    a6294:	e8 00 00 00 00       	call   a6299 <do_user_addr_fault+0x9d9>	a6295: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09d9    a6299:	48 83 e3 03          	and    $0x3,%rbx
09dd    a629d:	74 0a                	je     a62a9 <do_user_addr_fault+0x9e9>
09df    a629f:	e8 00 00 00 00       	call   a62a4 <do_user_addr_fault+0x9e4>	a62a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09e4    a62a4:	e9 7d fc ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
09e9    a62a9:	e8 00 00 00 00       	call   a62ae <do_user_addr_fault+0x9ee>	a62aa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ee    a62ae:	48 89 ef             	mov    %rbp,%rdi
09f1    a62b1:	4c 89 f6             	mov    %r14,%rsi
09f4    a62b4:	4c 89 fa             	mov    %r15,%rdx
09f7    a62b7:	b9 07 00 00 00       	mov    $0x7,%ecx
09fc    a62bc:	41 b8 02 00 00 00    	mov    $0x2,%r8d
0a02    a62c2:	e8 39 0a 00 00       	call   a6d00 <kernelmode_fixup_or_oops>
0a07    a62c7:	e9 5a fc ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
0a0c    a62cc:	e8 00 00 00 00       	call   a62d1 <do_user_addr_fault+0xa11>	a62cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a11    a62d1:	e9 50 fc ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
0a16    a62d6:	e8 00 00 00 00       	call   a62db <do_user_addr_fault+0xa1b>	a62d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a1b    a62db:	48 8b 3c 24          	mov    (%rsp),%rdi
0a1f    a62df:	4c 89 f6             	mov    %r14,%rsi
0a22    a62e2:	48 89 ea             	mov    %rbp,%rdx
0a25    a62e5:	e8 56 20 00 00       	call   a8340 <bad_area>
0a2a    a62ea:	e9 37 fc ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
0a2f    a62ef:	49 89 ef             	mov    %rbp,%r15
0a32    a62f2:	49 8d 5c 24 20       	lea    0x20(%r12),%rbx
0a37    a62f7:	48 89 d8             	mov    %rbx,%rax
0a3a    a62fa:	48 c1 e8 03          	shr    $0x3,%rax
0a3e    a62fe:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0a43    a6303:	74 08                	je     a630d <do_user_addr_fault+0xa4d>
0a45    a6305:	48 89 df             	mov    %rbx,%rdi
0a48    a6308:	e8 00 00 00 00       	call   a630d <do_user_addr_fault+0xa4d>	a6309: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a4d    a630d:	48 8b 1b             	mov    (%rbx),%rbx
0a50    a6310:	bd 00 01 00 00       	mov    $0x100,%ebp
0a55    a6315:	be 00 01 00 00       	mov    $0x100,%esi
0a5a    a631a:	48 21 de             	and    %rbx,%rsi
0a5d    a631d:	31 ff                	xor    %edi,%edi
0a5f    a631f:	e8 00 00 00 00       	call   a6324 <do_user_addr_fault+0xa64>	a6320: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0a64    a6324:	48 21 dd             	and    %rbx,%rbp
0a67    a6327:	0f 84 c8 01 00 00    	je     a64f5 <do_user_addr_fault+0xc35>
0a6d    a632d:	4c 89 e7             	mov    %r12,%rdi
0a70    a6330:	4c 89 fe             	mov    %r15,%rsi
0a73    a6333:	e8 00 00 00 00       	call   a6338 <do_user_addr_fault+0xa78>	a6334: R_X86_64_PLT32	expand_stack-0x4
0a78    a6338:	89 c3                	mov    %eax,%ebx
0a7a    a633a:	31 ff                	xor    %edi,%edi
0a7c    a633c:	89 c6                	mov    %eax,%esi
0a7e    a633e:	e8 00 00 00 00       	call   a6343 <do_user_addr_fault+0xa83>	a633f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a83    a6343:	85 db                	test   %ebx,%ebx
0a85    a6345:	0f 85 b1 01 00 00    	jne    a64fc <do_user_addr_fault+0xc3c>
0a8b    a634b:	e8 00 00 00 00       	call   a6350 <do_user_addr_fault+0xa90>	a634c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a90    a6350:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0a9a    a635a:	4c 89 fd             	mov    %r15,%rbp
0a9d    a635d:	e9 94 fb ff ff       	jmp    a5ef6 <do_user_addr_fault+0x636>
0aa2    a6362:	e8 00 00 00 00       	call   a6367 <do_user_addr_fault+0xaa7>	a6363: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0aa7    a6367:	4c 89 f5             	mov    %r14,%rbp
0aaa    a636a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0aaf    a636f:	e9 a3 fb ff ff       	jmp    a5f17 <do_user_addr_fault+0x657>
0ab4    a6374:	e8 00 00 00 00       	call   a6379 <do_user_addr_fault+0xab9>	a6375: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ab9    a6379:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0abe    a637e:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0ac8    a6388:	e9 ac fe ff ff       	jmp    a6239 <do_user_addr_fault+0x979>
0acd    a638d:	e8 00 00 00 00       	call   a6392 <do_user_addr_fault+0xad2>	a638e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ad2    a6392:	e9 80 fb ff ff       	jmp    a5f17 <do_user_addr_fault+0x657>
0ad7    a6397:	41 89 dc             	mov    %ebx,%r12d
0ada    a639a:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0adf    a639f:	4c 89 ff             	mov    %r15,%rdi
0ae2    a63a2:	e8 19 20 00 00       	call   a83c0 <fatal_signal_pending>
0ae7    a63a7:	89 c3                	mov    %eax,%ebx
0ae9    a63a9:	31 ff                	xor    %edi,%edi
0aeb    a63ab:	89 c6                	mov    %eax,%esi
0aed    a63ad:	e8 00 00 00 00       	call   a63b2 <do_user_addr_fault+0xaf2>	a63ae: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0af2    a63b2:	85 db                	test   %ebx,%ebx
0af4    a63b4:	74 46                	je     a63fc <do_user_addr_fault+0xb3c>
0af6    a63b6:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b00    a63c0:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
0b05    a63c5:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0b09    a63c9:	74 0a                	je     a63d5 <do_user_addr_fault+0xb15>
0b0b    a63cb:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0b10    a63d0:	e8 00 00 00 00       	call   a63d5 <do_user_addr_fault+0xb15>	a63d1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b15    a63d5:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0b1a    a63da:	48 8b 18             	mov    (%rax),%rbx
0b1d    a63dd:	48 89 de             	mov    %rbx,%rsi
0b20    a63e0:	48 83 e6 03          	and    $0x3,%rsi
0b24    a63e4:	31 ff                	xor    %edi,%edi
0b26    a63e6:	e8 00 00 00 00       	call   a63eb <do_user_addr_fault+0xb2b>	a63e7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0b2b    a63eb:	48 83 e3 03          	and    $0x3,%rbx
0b2f    a63ef:	0f 84 9f 00 00 00    	je     a6494 <do_user_addr_fault+0xbd4>
0b35    a63f5:	e8 00 00 00 00       	call   a63fa <do_user_addr_fault+0xb3a>	a63f6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b3a    a63fa:	eb 05                	jmp    a6401 <do_user_addr_fault+0xb41>
0b3c    a63fc:	e8 00 00 00 00       	call   a6401 <do_user_addr_fault+0xb41>	a63fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b41    a6401:	44 89 e3             	mov    %r12d,%ebx
0b44    a6404:	44 89 e6             	mov    %r12d,%esi
0b47    a6407:	83 e6 01             	and    $0x1,%esi
0b4a    a640a:	31 ff                	xor    %edi,%edi
0b4c    a640c:	e8 00 00 00 00       	call   a6411 <do_user_addr_fault+0xb51>	a640d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b51    a6411:	44 89 e0             	mov    %r12d,%eax
0b54    a6414:	83 e0 01             	and    $0x1,%eax
0b57    a6417:	75 31                	jne    a644a <do_user_addr_fault+0xb8a>
0b59    a6419:	44 89 e3             	mov    %r12d,%ebx
0b5c    a641c:	44 89 e6             	mov    %r12d,%esi
0b5f    a641f:	83 e6 32             	and    $0x32,%esi
0b62    a6422:	31 ff                	xor    %edi,%edi
0b64    a6424:	e8 00 00 00 00       	call   a6429 <do_user_addr_fault+0xb69>	a6425: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b69    a6429:	44 89 e0             	mov    %r12d,%eax
0b6c    a642c:	83 e0 32             	and    $0x32,%eax
0b6f    a642f:	74 7c                	je     a64ad <do_user_addr_fault+0xbed>
0b71    a6431:	e8 00 00 00 00       	call   a6436 <do_user_addr_fault+0xb76>	a6432: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b76    a6436:	48 8b 3c 24          	mov    (%rsp),%rdi
0b7a    a643a:	48 89 ee             	mov    %rbp,%rsi
0b7d    a643d:	4c 89 f2             	mov    %r14,%rdx
0b80    a6440:	e8 3b 20 00 00       	call   a8480 <do_sigbus>
0b85    a6445:	e9 dc fa ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
0b8a    a644a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b94    a6454:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
0b99    a6459:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0b9d    a645d:	74 0a                	je     a6469 <do_user_addr_fault+0xba9>
0b9f    a645f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0ba4    a6464:	e8 00 00 00 00       	call   a6469 <do_user_addr_fault+0xba9>	a6465: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ba9    a6469:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0bae    a646e:	48 8b 18             	mov    (%rax),%rbx
0bb1    a6471:	48 89 de             	mov    %rbx,%rsi
0bb4    a6474:	48 83 e6 03          	and    $0x3,%rsi
0bb8    a6478:	31 ff                	xor    %edi,%edi
0bba    a647a:	e8 00 00 00 00       	call   a647f <do_user_addr_fault+0xbbf>	a647b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0bbf    a647f:	48 83 e3 03          	and    $0x3,%rbx
0bc3    a6483:	74 51                	je     a64d6 <do_user_addr_fault+0xc16>
0bc5    a6485:	e8 00 00 00 00       	call   a648a <do_user_addr_fault+0xbca>	a6486: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bca    a648a:	e8 00 00 00 00       	call   a648f <do_user_addr_fault+0xbcf>	a648b: R_X86_64_PLT32	pagefault_out_of_memory-0x4
0bcf    a648f:	e9 92 fa ff ff       	jmp    a5f26 <do_user_addr_fault+0x666>
0bd4    a6494:	e8 00 00 00 00       	call   a6499 <do_user_addr_fault+0xbd9>	a6495: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bd9    a6499:	48 8b 3c 24          	mov    (%rsp),%rdi
0bdd    a649d:	48 89 ee             	mov    %rbp,%rsi
0be0    a64a0:	4c 89 f2             	mov    %r14,%rdx
0be3    a64a3:	31 c9                	xor    %ecx,%ecx
0be5    a64a5:	45 31 c0             	xor    %r8d,%r8d
0be8    a64a8:	e9 15 fe ff ff       	jmp    a62c2 <do_user_addr_fault+0xa02>
0bed    a64ad:	44 89 e3             	mov    %r12d,%ebx
0bf0    a64b0:	44 89 e6             	mov    %r12d,%esi
0bf3    a64b3:	83 e6 40             	and    $0x40,%esi
0bf6    a64b6:	31 ff                	xor    %edi,%edi
0bf8    a64b8:	e8 00 00 00 00       	call   a64bd <do_user_addr_fault+0xbfd>	a64b9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0bfd    a64bd:	83 e3 40             	and    $0x40,%ebx
0c00    a64c0:	74 68                	je     a652a <do_user_addr_fault+0xc6a>
0c02    a64c2:	e8 00 00 00 00       	call   a64c7 <do_user_addr_fault+0xc07>	a64c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c07    a64c7:	48 8b 3c 24          	mov    (%rsp),%rdi
0c0b    a64cb:	48 89 ee             	mov    %rbp,%rsi
0c0e    a64ce:	4c 89 f2             	mov    %r14,%rdx
0c11    a64d1:	e9 71 f8 ff ff       	jmp    a5d47 <do_user_addr_fault+0x487>
0c16    a64d6:	e8 00 00 00 00       	call   a64db <do_user_addr_fault+0xc1b>	a64d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c1b    a64db:	48 8b 3c 24          	mov    (%rsp),%rdi
0c1f    a64df:	48 89 ee             	mov    %rbp,%rsi
0c22    a64e2:	4c 89 f2             	mov    %r14,%rdx
0c25    a64e5:	b9 0b 00 00 00       	mov    $0xb,%ecx
0c2a    a64ea:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0c30    a64f0:	e9 cd fd ff ff       	jmp    a62c2 <do_user_addr_fault+0xa02>
0c35    a64f5:	e8 00 00 00 00       	call   a64fa <do_user_addr_fault+0xc3a>	a64f6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c3a    a64fa:	eb 05                	jmp    a6501 <do_user_addr_fault+0xc41>
0c3c    a64fc:	e8 00 00 00 00       	call   a6501 <do_user_addr_fault+0xc41>	a64fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c41    a6501:	48 8b 3c 24          	mov    (%rsp),%rdi
0c45    a6505:	4c 89 f6             	mov    %r14,%rsi
0c48    a6508:	4c 89 fa             	mov    %r15,%rdx
0c4b    a650b:	e9 d5 fd ff ff       	jmp    a62e5 <do_user_addr_fault+0xa25>
0c50    a6510:	f3 0f 1e fa          	endbr64
0c54    a6514:	e8 00 00 00 00       	call   a6519 <do_user_addr_fault+0xc59>	a6515: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c59    a6519:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
0c5e    a651e:	31 f6                	xor    %esi,%esi
0c60    a6520:	e8 00 00 00 00       	call   a6525 <do_user_addr_fault+0xc65>	a6521: R_X86_64_PLT32	__mmap_lock_do_trace_released-0x4
0c65    a6525:	e9 da fc ff ff       	jmp    a6204 <do_user_addr_fault+0x944>
0c6a    a652a:	e8 00 00 00 00       	call   a652f <do_user_addr_fault+0xc6f>	a652b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c6f    a652f:	90                   	nop
0c70    a6530:	0f 0b                	ud2
0c72    a6532:	66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
