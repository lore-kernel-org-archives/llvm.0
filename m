Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159DE19BAE;
	Thu, 31 Aug 2023 18:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693508347; x=1725044347;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hw/rd6FoCHjZIhuNO4XCT055yJHiFRQXBT0cMZMrJ68=;
  b=f5/GAkJa3ptLFPc0qbAEm+Y+oJ+Zq29GRjq18aOpIX3yJMyBaOqj0rcp
   Rjz6HpWT7rte2uU9WV7u3u9foSNU4CxPrLRt18ahzrcxirFhmtT01M0z+
   Z0dw/XnqFl6aSye1KT9EX9Hyzwvw1AppQh9BcVqUYCIjZ5iANIJ9MB9qB
   hlA2/9sM7SksGSisyXEegHQf0KFsQBQJyNPpw05wzpLxhmU8bm3wa6uEh
   j+fh5fGsIAVmuZhf/MMQemDyix9axRLYfwagiltTqowvmt995RkvT+HRD
   B3yprrwrOxMJdvRY/nddAQmNnTcfn0ymJL4oWohXYMu8APts+HB0XLIoX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="366264383"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="366264383"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2023 11:59:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="768909202"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; 
   d="scan'208";a="768909202"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 31 Aug 2023 11:59:03 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbmse-0000Sd-2w;
	Thu, 31 Aug 2023 18:59:00 +0000
Date: Fri, 1 Sep 2023 02:58:27 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:x86/shstk 1/1] vmlinux.o: warning: objtool:
 do_user_addr_fault+0xa2c: unreachable instruction
Message-ID: <202309010218.DFLUAnRz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/shstk
head:   1fe428d3692fb10a0e8d85fafe719b154e43ad4e
commit: c6cfcbd8ca43766851a8c952e3b570727147020f [1/1] x86/ibt: Convert IBT selftest to asm
config: x86_64-randconfig-r016-20230831 (https://download.01.org/0day-ci/archive/20230901/202309010218.DFLUAnRz-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309010218.DFLUAnRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309010218.DFLUAnRz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_user_addr_fault+0xa2c: unreachable instruction


objdump-func vmlinux.o do_user_addr_fault:
0000 0000000000102cb0 <do_user_addr_fault>:
0000   102cb0:	f3 0f 1e fa          	endbr64
0004   102cb4:	55                   	push   %rbp
0005   102cb5:	48 89 e5             	mov    %rsp,%rbp
0008   102cb8:	41 57                	push   %r15
000a   102cba:	41 56                	push   %r14
000c   102cbc:	41 55                	push   %r13
000e   102cbe:	41 54                	push   %r12
0010   102cc0:	53                   	push   %rbx
0011   102cc1:	48 83 ec 50          	sub    $0x50,%rsp
0015   102cc5:	49 89 d7             	mov    %rdx,%r15
0018   102cc8:	49 89 f4             	mov    %rsi,%r12
001b   102ccb:	49 89 fe             	mov    %rdi,%r14
001e   102cce:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0028   102cd8:	e8 00 00 00 00       	call   102cdd <do_user_addr_fault+0x2d>	102cd9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002d   102cdd:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 102ce4 <do_user_addr_fault+0x34>	102ce0: R_X86_64_PC32	pcpu_hot-0x4
0034   102ce4:	48 89 45 98          	mov    %rax,-0x68(%rbp)
0038   102ce8:	48 8d 98 80 02 00 00 	lea    0x280(%rax),%rbx
003f   102cef:	48 89 d8             	mov    %rbx,%rax
0042   102cf2:	48 c1 e8 03          	shr    $0x3,%rax
0046   102cf6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
004b   102cfb:	74 08                	je     102d05 <do_user_addr_fault+0x55>
004d   102cfd:	48 89 df             	mov    %rbx,%rdi
0050   102d00:	e8 00 00 00 00       	call   102d05 <do_user_addr_fault+0x55>	102d01: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0055   102d05:	48 8b 03             	mov    (%rbx),%rax
0058   102d08:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
005c   102d0c:	44 89 e3             	mov    %r12d,%ebx
005f   102d0f:	83 e3 14             	and    $0x14,%ebx
0062   102d12:	bf 10 00 00 00       	mov    $0x10,%edi
0067   102d17:	48 89 de             	mov    %rbx,%rsi
006a   102d1a:	e8 00 00 00 00       	call   102d1f <do_user_addr_fault+0x6f>	102d1b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
006f   102d1f:	48 83 fb 10          	cmp    $0x10,%rbx
0073   102d23:	0f 84 8e 07 00 00    	je     1034b7 <do_user_addr_fault+0x807>
0079   102d29:	49 8d 9e 88 00 00 00 	lea    0x88(%r14),%rbx
0080   102d30:	48 89 d8             	mov    %rbx,%rax
0083   102d33:	48 c1 e8 03          	shr    $0x3,%rax
0087   102d37:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
008b   102d3b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0090   102d40:	74 08                	je     102d4a <do_user_addr_fault+0x9a>
0092   102d42:	48 89 df             	mov    %rbx,%rdi
0095   102d45:	e8 00 00 00 00       	call   102d4a <do_user_addr_fault+0x9a>	102d46: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
009a   102d4a:	48 89 5d b0          	mov    %rbx,-0x50(%rbp)
009e   102d4e:	48 8b 1b             	mov    (%rbx),%rbx
00a1   102d51:	48 89 de             	mov    %rbx,%rsi
00a4   102d54:	48 83 e6 03          	and    $0x3,%rsi
00a8   102d58:	31 ff                	xor    %edi,%edi
00aa   102d5a:	e8 00 00 00 00       	call   102d5f <do_user_addr_fault+0xaf>	102d5b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00af   102d5f:	48 83 e3 03          	and    $0x3,%rbx
00b3   102d63:	74 0a                	je     102d6f <do_user_addr_fault+0xbf>
00b5   102d65:	e8 00 00 00 00       	call   102d6a <do_user_addr_fault+0xba>	102d66: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ba   102d6a:	e9 cd 00 00 00       	jmp    102e3c <do_user_addr_fault+0x18c>
00bf   102d6f:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 102d75 <do_user_addr_fault+0xc5>	102d71: R_X86_64_PC32	pcpu_hot+0x4
00c5   102d75:	89 de                	mov    %ebx,%esi
00c7   102d77:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
00cd   102d7d:	31 ff                	xor    %edi,%edi
00cf   102d7f:	e8 00 00 00 00       	call   102d84 <do_user_addr_fault+0xd4>	102d80: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00d4   102d84:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
00da   102d8a:	74 07                	je     102d93 <do_user_addr_fault+0xe3>
00dc   102d8c:	e8 00 00 00 00       	call   102d91 <do_user_addr_fault+0xe1>	102d8d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00e1   102d91:	eb 54                	jmp    102de7 <do_user_addr_fault+0x137>
00e3   102d93:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	102d96: R_X86_64_32S	pv_ops+0xe0
00ea   102d9a:	48 c1 e8 03          	shr    $0x3,%rax
00ee   102d9e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
00f3   102da3:	74 0c                	je     102db1 <do_user_addr_fault+0x101>
00f5   102da5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	102da8: R_X86_64_32S	pv_ops+0xe0
00fc   102dac:	e8 00 00 00 00       	call   102db1 <do_user_addr_fault+0x101>	102dad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0101   102db1:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 102db9 <do_user_addr_fault+0x109>	102db4: R_X86_64_PC32	pv_ops+0xdb
0109   102db9:	0f 84 6a 09 00 00    	je     103729 <do_user_addr_fault+0xa79>
010f   102dbf:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 102dc5 <do_user_addr_fault+0x115>	102dc1: R_X86_64_PC32	pv_ops+0xdc
0115   102dc5:	48 89 c3             	mov    %rax,%rbx
0118   102dc8:	48 89 c6             	mov    %rax,%rsi
011b   102dcb:	48 81 e6 00 02 00 00 	and    $0x200,%rsi
0122   102dd2:	31 ff                	xor    %edi,%edi
0124   102dd4:	e8 00 00 00 00       	call   102dd9 <do_user_addr_fault+0x129>	102dd5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0129   102dd9:	48 81 e3 00 02 00 00 	and    $0x200,%rbx
0130   102de0:	75 55                	jne    102e37 <do_user_addr_fault+0x187>
0132   102de2:	e8 00 00 00 00       	call   102de7 <do_user_addr_fault+0x137>	102de3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0137   102de7:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	102dea: R_X86_64_32S	.rodata+0x3c2a0
013e   102dee:	e8 00 00 00 00       	call   102df3 <do_user_addr_fault+0x143>	102def: R_X86_64_PLT32	__this_cpu_preempt_check-0x4
0143   102df3:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 102dfa <do_user_addr_fault+0x14a>	102df6: R_X86_64_PC32	current_kprobe-0x4
014a   102dfa:	31 ff                	xor    %edi,%edi
014c   102dfc:	48 89 de             	mov    %rbx,%rsi
014f   102dff:	e8 00 00 00 00       	call   102e04 <do_user_addr_fault+0x154>	102e00: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0154   102e04:	48 85 db             	test   %rbx,%rbx
0157   102e07:	74 27                	je     102e30 <do_user_addr_fault+0x180>
0159   102e09:	4c 89 f7             	mov    %r14,%rdi
015c   102e0c:	be 0e 00 00 00       	mov    $0xe,%esi
0161   102e11:	e8 00 00 00 00       	call   102e16 <do_user_addr_fault+0x166>	102e12: R_X86_64_PLT32	kprobe_fault_handler-0x4
0166   102e16:	89 c3                	mov    %eax,%ebx
0168   102e18:	31 ff                	xor    %edi,%edi
016a   102e1a:	89 c6                	mov    %eax,%esi
016c   102e1c:	e8 00 00 00 00       	call   102e21 <do_user_addr_fault+0x171>	102e1d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0171   102e21:	85 db                	test   %ebx,%ebx
0173   102e23:	0f 85 35 07 00 00    	jne    10355e <do_user_addr_fault+0x8ae>
0179   102e29:	e8 00 00 00 00       	call   102e2e <do_user_addr_fault+0x17e>	102e2a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
017e   102e2e:	eb 0c                	jmp    102e3c <do_user_addr_fault+0x18c>
0180   102e30:	e8 00 00 00 00       	call   102e35 <do_user_addr_fault+0x185>	102e31: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0185   102e35:	eb 05                	jmp    102e3c <do_user_addr_fault+0x18c>
0187   102e37:	e8 00 00 00 00       	call   102e3c <do_user_addr_fault+0x18c>	102e38: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
018c   102e3c:	4c 89 e6             	mov    %r12,%rsi
018f   102e3f:	48 83 e6 08          	and    $0x8,%rsi
0193   102e43:	31 ff                	xor    %edi,%edi
0195   102e45:	e8 00 00 00 00       	call   102e4a <do_user_addr_fault+0x19a>	102e46: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
019a   102e4a:	4c 89 e0             	mov    %r12,%rax
019d   102e4d:	48 83 e0 08          	and    $0x8,%rax
01a1   102e51:	0f 85 84 06 00 00    	jne    1034db <do_user_addr_fault+0x82b>
01a7   102e57:	e8 00 00 00 00       	call   102e5c <do_user_addr_fault+0x1ac>	102e58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ac   102e5c:	4c 89 75 d0          	mov    %r14,-0x30(%rbp)
01b0   102e60:	e9 00 00 00 00       	jmp    102e65 <do_user_addr_fault+0x1b5>	102e61: R_X86_64_PLT32	.altinstr_aux+0x10a6
01b5   102e65:	e8 00 00 00 00       	call   102e6a <do_user_addr_fault+0x1ba>	102e66: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ba   102e6a:	4c 89 e6             	mov    %r12,%rsi
01bd   102e6d:	48 83 e6 04          	and    $0x4,%rsi
01c1   102e71:	31 ff                	xor    %edi,%edi
01c3   102e73:	e8 00 00 00 00       	call   102e78 <do_user_addr_fault+0x1c8>	102e74: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01c8   102e78:	4c 89 e0             	mov    %r12,%rax
01cb   102e7b:	48 83 e0 04          	and    $0x4,%rax
01cf   102e7f:	75 49                	jne    102eca <do_user_addr_fault+0x21a>
01d1   102e81:	49 8d 9e 90 00 00 00 	lea    0x90(%r14),%rbx
01d8   102e88:	48 89 d8             	mov    %rbx,%rax
01db   102e8b:	48 c1 e8 03          	shr    $0x3,%rax
01df   102e8f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
01e4   102e94:	74 08                	je     102e9e <do_user_addr_fault+0x1ee>
01e6   102e96:	48 89 df             	mov    %rbx,%rdi
01e9   102e99:	e8 00 00 00 00       	call   102e9e <do_user_addr_fault+0x1ee>	102e9a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01ee   102e9e:	48 8b 1b             	mov    (%rbx),%rbx
01f1   102ea1:	41 be 00 00 04 00    	mov    $0x40000,%r14d
01f7   102ea7:	be 00 00 04 00       	mov    $0x40000,%esi
01fc   102eac:	48 21 de             	and    %rbx,%rsi
01ff   102eaf:	31 ff                	xor    %edi,%edi
0201   102eb1:	e8 00 00 00 00       	call   102eb6 <do_user_addr_fault+0x206>	102eb2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0206   102eb6:	49 21 de             	and    %rbx,%r14
0209   102eb9:	0f 84 56 06 00 00    	je     103515 <do_user_addr_fault+0x865>
020f   102ebf:	e8 00 00 00 00       	call   102ec4 <do_user_addr_fault+0x214>	102ec0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0214   102ec4:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
0218   102ec8:	eb 05                	jmp    102ecf <do_user_addr_fault+0x21f>
021a   102eca:	e8 00 00 00 00       	call   102ecf <do_user_addr_fault+0x21f>	102ecb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
021f   102ecf:	48 8b 45 98          	mov    -0x68(%rbp),%rax
0223   102ed3:	48 8d 98 94 10 00 00 	lea    0x1094(%rax),%rbx
022a   102eda:	48 89 d8             	mov    %rbx,%rax
022d   102edd:	48 c1 e8 03          	shr    $0x3,%rax
0231   102ee1:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0235   102ee5:	84 c0                	test   %al,%al
0237   102ee7:	0f 85 87 06 00 00    	jne    103574 <do_user_addr_fault+0x8c4>
023d   102eed:	8b 1b                	mov    (%rbx),%ebx
023f   102eef:	31 ff                	xor    %edi,%edi
0241   102ef1:	89 de                	mov    %ebx,%esi
0243   102ef3:	e8 00 00 00 00       	call   102ef8 <do_user_addr_fault+0x248>	102ef4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0248   102ef8:	85 db                	test   %ebx,%ebx
024a   102efa:	0f 85 f3 05 00 00    	jne    1034f3 <do_user_addr_fault+0x843>
0250   102f00:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 102f06 <do_user_addr_fault+0x256>	102f02: R_X86_64_PC32	pcpu_hot+0x4
0256   102f06:	89 de                	mov    %ebx,%esi
0258   102f08:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
025e   102f0e:	31 ff                	xor    %edi,%edi
0260   102f10:	e8 00 00 00 00       	call   102f15 <do_user_addr_fault+0x265>	102f11: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0265   102f15:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
026b   102f1b:	0f 85 d9 05 00 00    	jne    1034fa <do_user_addr_fault+0x84a>
0271   102f21:	48 83 7d a0 00       	cmpq   $0x0,-0x60(%rbp)
0276   102f26:	0f 84 ce 05 00 00    	je     1034fa <do_user_addr_fault+0x84a>
027c   102f2c:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
0280   102f30:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0285   102f35:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
0289   102f39:	74 08                	je     102f43 <do_user_addr_fault+0x293>
028b   102f3b:	48 89 df             	mov    %rbx,%rdi
028e   102f3e:	e8 00 00 00 00       	call   102f43 <do_user_addr_fault+0x293>	102f3f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0293   102f43:	48 8b 1b             	mov    (%rbx),%rbx
0296   102f46:	48 89 de             	mov    %rbx,%rsi
0299   102f49:	48 83 e6 03          	and    $0x3,%rsi
029d   102f4d:	31 ff                	xor    %edi,%edi
029f   102f4f:	e8 00 00 00 00       	call   102f54 <do_user_addr_fault+0x2a4>	102f50: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
02a4   102f54:	48 83 e3 03          	and    $0x3,%rbx
02a8   102f58:	74 4b                	je     102fa5 <do_user_addr_fault+0x2f5>
02aa   102f5a:	e8 00 00 00 00       	call   102f5f <do_user_addr_fault+0x2af>	102f5b: R_X86_64_PLT32	trace_hardirqs_on-0x4
02af   102f5f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	102f62: R_X86_64_32S	pv_ops+0xf0
02b6   102f66:	48 c1 e8 03          	shr    $0x3,%rax
02ba   102f6a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
02bf   102f6f:	74 0c                	je     102f7d <do_user_addr_fault+0x2cd>
02c1   102f71:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	102f74: R_X86_64_32S	pv_ops+0xf0
02c8   102f78:	e8 00 00 00 00       	call   102f7d <do_user_addr_fault+0x2cd>	102f79: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02cd   102f7d:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 102f85 <do_user_addr_fault+0x2d5>	102f80: R_X86_64_PC32	pv_ops+0xeb
02d5   102f85:	0f 84 90 07 00 00    	je     10371b <do_user_addr_fault+0xa6b>
02db   102f8b:	e8 00 00 00 00       	call   102f90 <do_user_addr_fault+0x2e0>	102f8c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02e0   102f90:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 102f96 <do_user_addr_fault+0x2e6>	102f92: R_X86_64_PC32	pv_ops+0xec
02e6   102f96:	48 89 e0             	mov    %rsp,%rax
02e9   102f99:	c7 45 c8 54 02 00 00 	movl   $0x254,-0x38(%rbp)
02f0   102fa0:	e9 96 00 00 00       	jmp    10303b <do_user_addr_fault+0x38b>
02f5   102fa5:	49 8d 9e 90 00 00 00 	lea    0x90(%r14),%rbx
02fc   102fac:	48 89 d8             	mov    %rbx,%rax
02ff   102faf:	48 c1 e8 03          	shr    $0x3,%rax
0303   102fb3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0308   102fb8:	74 08                	je     102fc2 <do_user_addr_fault+0x312>
030a   102fba:	48 89 df             	mov    %rbx,%rdi
030d   102fbd:	e8 00 00 00 00       	call   102fc2 <do_user_addr_fault+0x312>	102fbe: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0312   102fc2:	48 8b 1b             	mov    (%rbx),%rbx
0315   102fc5:	41 be 00 02 00 00    	mov    $0x200,%r14d
031b   102fcb:	be 00 02 00 00       	mov    $0x200,%esi
0320   102fd0:	48 21 de             	and    %rbx,%rsi
0323   102fd3:	31 ff                	xor    %edi,%edi
0325   102fd5:	e8 00 00 00 00       	call   102fda <do_user_addr_fault+0x32a>	102fd6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
032a   102fda:	49 21 de             	and    %rbx,%r14
032d   102fdd:	75 12                	jne    102ff1 <do_user_addr_fault+0x341>
032f   102fdf:	e8 00 00 00 00       	call   102fe4 <do_user_addr_fault+0x334>	102fe0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0334   102fe4:	c7 45 c8 14 02 00 00 	movl   $0x214,-0x38(%rbp)
033b   102feb:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
033f   102fef:	eb 4d                	jmp    10303e <do_user_addr_fault+0x38e>
0341   102ff1:	e8 00 00 00 00       	call   102ff6 <do_user_addr_fault+0x346>	102ff2: R_X86_64_PLT32	trace_hardirqs_on-0x4
0346   102ff6:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	102ff9: R_X86_64_32S	pv_ops+0xf0
034d   102ffd:	48 c1 e8 03          	shr    $0x3,%rax
0351   103001:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0356   103006:	74 0c                	je     103014 <do_user_addr_fault+0x364>
0358   103008:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10300b: R_X86_64_32S	pv_ops+0xf0
035f   10300f:	e8 00 00 00 00       	call   103014 <do_user_addr_fault+0x364>	103010: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0364   103014:	48 83 3d 00 00 00 00 00 	cmpq   $0x0,0x0(%rip)        # 10301c <do_user_addr_fault+0x36c>	103017: R_X86_64_PC32	pv_ops+0xeb
036c   10301c:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
0370   103020:	0f 84 fc 06 00 00    	je     103722 <do_user_addr_fault+0xa72>
0376   103026:	e8 00 00 00 00       	call   10302b <do_user_addr_fault+0x37b>	103027: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
037b   10302b:	ff 15 00 00 00 00    	call   *0x0(%rip)        # 103031 <do_user_addr_fault+0x381>	10302d: R_X86_64_PC32	pv_ops+0xec
0381   103031:	48 89 e0             	mov    %rsp,%rax
0384   103034:	c7 45 c8 14 02 00 00 	movl   $0x214,-0x38(%rbp)
038b   10303b:	48 89 c4             	mov    %rax,%rsp
038e   10303e:	4c 89 7d b8          	mov    %r15,-0x48(%rbp)
0392   103042:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0397   103047:	e8 00 00 00 00       	call   10304c <do_user_addr_fault+0x39c>	103048: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
039c   10304c:	44 89 e6             	mov    %r12d,%esi
039f   10304f:	83 e6 02             	and    $0x2,%esi
03a2   103052:	31 ff                	xor    %edi,%edi
03a4   103054:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
03a8   103058:	e8 00 00 00 00       	call   10305d <do_user_addr_fault+0x3ad>	103059: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03ad   10305d:	4c 89 e6             	mov    %r12,%rsi
03b0   103060:	48 83 e6 42          	and    $0x42,%rsi
03b4   103064:	41 0f 95 c7          	setne  %r15b
03b8   103068:	31 ff                	xor    %edi,%edi
03ba   10306a:	e8 00 00 00 00       	call   10306f <do_user_addr_fault+0x3bf>	10306b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03bf   10306f:	4c 8b 6d b8          	mov    -0x48(%rbp),%r13
03c3   103073:	4c 89 eb             	mov    %r13,%rbx
03c6   103076:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
03cd   10307d:	48 c7 c7 00 00 60 ff 	mov    $0xffffffffff600000,%rdi
03d4   103084:	48 89 de             	mov    %rbx,%rsi
03d7   103087:	e8 00 00 00 00       	call   10308c <do_user_addr_fault+0x3dc>	103088: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03dc   10308c:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
03e3   103093:	4c 89 65 c0          	mov    %r12,-0x40(%rbp)
03e7   103097:	75 1c                	jne    1030b5 <do_user_addr_fault+0x405>
03e9   103099:	4c 89 e7             	mov    %r12,%rdi
03ec   10309c:	4c 89 f6             	mov    %r14,%rsi
03ef   10309f:	4c 89 ea             	mov    %r13,%rdx
03f2   1030a2:	e8 00 00 00 00       	call   1030a7 <do_user_addr_fault+0x3f7>	1030a3: R_X86_64_PLT32	emulate_vsyscall-0x4
03f7   1030a7:	84 c0                	test   %al,%al
03f9   1030a9:	74 11                	je     1030bc <do_user_addr_fault+0x40c>
03fb   1030ab:	e8 00 00 00 00       	call   1030b0 <do_user_addr_fault+0x400>	1030ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0400   1030b0:	e9 09 03 00 00       	jmp    1033be <do_user_addr_fault+0x70e>
0405   1030b5:	e8 00 00 00 00       	call   1030ba <do_user_addr_fault+0x40a>	1030b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
040a   1030ba:	eb 05                	jmp    1030c1 <do_user_addr_fault+0x411>
040c   1030bc:	e8 00 00 00 00       	call   1030c1 <do_user_addr_fault+0x411>	1030bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0411   1030c1:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
0415   1030c5:	48 8b 75 b8          	mov    -0x48(%rbp),%rsi
0419   1030c9:	4c 89 f2             	mov    %r14,%rdx
041c   1030cc:	e8 00 00 00 00       	call   1030d1 <do_user_addr_fault+0x421>	1030cd: R_X86_64_PLT32	lock_mm_and_find_vma-0x4
0421   1030d1:	48 85 c0             	test   %rax,%rax
0424   1030d4:	0f 84 30 04 00 00    	je     10350a <do_user_addr_fault+0x85a>
042a   1030da:	48 89 c3             	mov    %rax,%rbx
042d   1030dd:	31 c0                	xor    %eax,%eax
042f   1030df:	44 88 f8             	mov    %r15b,%al
0432   1030e2:	4c 8b 75 c0          	mov    -0x40(%rbp),%r14
0436   1030e6:	45 89 f7             	mov    %r14d,%r15d
0439   1030e9:	41 83 e7 10          	and    $0x10,%r15d
043d   1030ed:	41 c1 e7 04          	shl    $0x4,%r15d
0441   1030f1:	41 09 c7             	or     %eax,%r15d
0444   1030f4:	44 0b 7d c8          	or     -0x38(%rbp),%r15d
0448   1030f8:	45 31 e4             	xor    %r12d,%r12d
044b   1030fb:	48 83 7d 90 00       	cmpq   $0x0,-0x70(%rbp)
0450   103100:	41 0f 94 c4          	sete   %r12b
0454   103104:	4c 89 f6             	mov    %r14,%rsi
0457   103107:	48 81 e6 60 80 00 00 	and    $0x8060,%rsi
045e   10310e:	41 0f 95 c5          	setne  %r13b
0462   103112:	31 ff                	xor    %edi,%edi
0464   103114:	e8 00 00 00 00       	call   103119 <do_user_addr_fault+0x469>	103115: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0469   103119:	48 8b 45 98          	mov    -0x68(%rbp),%rax
046d   10311d:	48 05 18 05 00 00    	add    $0x518,%rax
0473   103123:	48 89 45 90          	mov    %rax,-0x70(%rbp)
0477   103127:	44 89 f8             	mov    %r15d,%eax
047a   10312a:	83 c8 20             	or     $0x20,%eax
047d   10312d:	89 45 c8             	mov    %eax,-0x38(%rbp)
0480   103130:	41 83 e6 03          	and    $0x3,%r14d
0484   103134:	bf 01 00 00 00       	mov    $0x1,%edi
0489   103139:	4c 89 f6             	mov    %r14,%rsi
048c   10313c:	e8 00 00 00 00       	call   103141 <do_user_addr_fault+0x491>	10313d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0491   103141:	49 83 fe 01          	cmp    $0x1,%r14
0495   103145:	0f 94 c0             	sete   %al
0498   103148:	4b 8d 0c a4          	lea    (%r12,%r12,4),%rcx
049c   10314c:	48 83 c1 02          	add    $0x2,%rcx
04a0   103150:	44 08 e8             	or     %r13b,%al
04a3   103153:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
04a7   103157:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
04b1   103161:	84 c0                	test   %al,%al
04b3   103163:	0f 85 40 02 00 00    	jne    1033a9 <do_user_addr_fault+0x6f9>
04b9   103169:	4c 89 ea             	mov    %r13,%rdx
04bc   10316c:	4d 89 e5             	mov    %r12,%r13
04bf   10316f:	48 89 4d 88          	mov    %rcx,-0x78(%rbp)
04c3   103173:	88 45 cf             	mov    %al,-0x31(%rbp)
04c6   103176:	4c 8d 73 20          	lea    0x20(%rbx),%r14
04ca   10317a:	4c 89 f0             	mov    %r14,%rax
04cd   10317d:	48 c1 e8 03          	shr    $0x3,%rax
04d1   103181:	80 3c 10 00          	cmpb   $0x0,(%rax,%rdx,1)
04d5   103185:	74 08                	je     10318f <do_user_addr_fault+0x4df>
04d7   103187:	4c 89 f7             	mov    %r14,%rdi
04da   10318a:	e8 00 00 00 00       	call   10318f <do_user_addr_fault+0x4df>	10318b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04df   10318f:	4d 8b 36             	mov    (%r14),%r14
04e2   103192:	4c 8b 65 88          	mov    -0x78(%rbp),%r12
04e6   103196:	4c 89 e6             	mov    %r12,%rsi
04e9   103199:	4c 21 f6             	and    %r14,%rsi
04ec   10319c:	31 ff                	xor    %edi,%edi
04ee   10319e:	e8 00 00 00 00       	call   1031a3 <do_user_addr_fault+0x4f3>	10319f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04f3   1031a3:	4d 21 e6             	and    %r12,%r14
04f6   1031a6:	0f 84 8c 03 00 00    	je     103538 <do_user_addr_fault+0x888>
04fc   1031ac:	48 89 df             	mov    %rbx,%rdi
04ff   1031af:	4d 89 ec             	mov    %r13,%r12
0502   1031b2:	4c 89 ee             	mov    %r13,%rsi
0505   1031b5:	44 89 fa             	mov    %r15d,%edx
0508   1031b8:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
050c   1031bc:	e8 00 00 00 00       	call   1031c1 <do_user_addr_fault+0x511>	1031bd: R_X86_64_PLT32	handle_mm_fault-0x4
0511   1031c1:	89 c3                	mov    %eax,%ebx
0513   1031c3:	89 c6                	mov    %eax,%esi
0515   1031c5:	81 e6 00 04 00 00    	and    $0x400,%esi
051b   1031cb:	31 ff                	xor    %edi,%edi
051d   1031cd:	e8 00 00 00 00       	call   1031d2 <do_user_addr_fault+0x522>	1031ce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0522   1031d2:	89 d8                	mov    %ebx,%eax
0524   1031d4:	25 00 04 00 00       	and    $0x400,%eax
0529   1031d9:	0f 84 ee 01 00 00    	je     1033cd <do_user_addr_fault+0x71d>
052f   1031df:	4c 8b 7d 98          	mov    -0x68(%rbp),%r15
0533   1031e3:	4c 89 ff             	mov    %r15,%rdi
0536   1031e6:	be 08 00 00 00       	mov    $0x8,%esi
053b   1031eb:	e8 00 00 00 00       	call   1031f0 <do_user_addr_fault+0x540>	1031ec: R_X86_64_PLT32	__kasan_check_read-0x4
0540   1031f0:	4d 89 fe             	mov    %r15,%r14
0543   1031f3:	49 c1 ee 03          	shr    $0x3,%r14
0547   1031f7:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0551   103201:	43 80 3c 2e 00       	cmpb   $0x0,(%r14,%r13,1)
0556   103206:	74 08                	je     103210 <do_user_addr_fault+0x560>
0558   103208:	4c 89 ff             	mov    %r15,%rdi
055b   10320b:	e8 00 00 00 00       	call   103210 <do_user_addr_fault+0x560>	10320c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0560   103210:	4d 8b 3f             	mov    (%r15),%r15
0563   103213:	4c 89 fe             	mov    %r15,%rsi
0566   103216:	48 83 e6 04          	and    $0x4,%rsi
056a   10321a:	31 ff                	xor    %edi,%edi
056c   10321c:	e8 00 00 00 00       	call   103221 <do_user_addr_fault+0x571>	10321d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0571   103221:	49 83 e7 04          	and    $0x4,%r15
0575   103225:	75 07                	jne    10322e <do_user_addr_fault+0x57e>
0577   103227:	e8 00 00 00 00       	call   10322c <do_user_addr_fault+0x57c>	103228: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
057c   10322c:	eb 3f                	jmp    10326d <do_user_addr_fault+0x5bd>
057e   10322e:	4c 8b 7d 90          	mov    -0x70(%rbp),%r15
0582   103232:	4c 89 f8             	mov    %r15,%rax
0585   103235:	48 c1 e8 03          	shr    $0x3,%rax
0589   103239:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
058e   10323e:	74 08                	je     103248 <do_user_addr_fault+0x598>
0590   103240:	4c 89 ff             	mov    %r15,%rdi
0593   103243:	e8 00 00 00 00       	call   103248 <do_user_addr_fault+0x598>	103244: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0598   103248:	4d 8b 3f             	mov    (%r15),%r15
059b   10324b:	be 00 01 00 00       	mov    $0x100,%esi
05a0   103250:	4c 21 fe             	and    %r15,%rsi
05a3   103253:	31 ff                	xor    %edi,%edi
05a5   103255:	e8 00 00 00 00       	call   10325a <do_user_addr_fault+0x5aa>	103256: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
05aa   10325a:	b8 00 01 00 00       	mov    $0x100,%eax
05af   10325f:	49 21 c7             	and    %rax,%r15
05b2   103262:	0f 85 e0 01 00 00    	jne    103448 <do_user_addr_fault+0x798>
05b8   103268:	e8 00 00 00 00       	call   10326d <do_user_addr_fault+0x5bd>	103269: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05bd   10326d:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
05c1   103271:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
05c6   103276:	4c 8b 7d b0          	mov    -0x50(%rbp),%r15
05ca   10327a:	74 08                	je     103284 <do_user_addr_fault+0x5d4>
05cc   10327c:	4c 89 ff             	mov    %r15,%rdi
05cf   10327f:	e8 00 00 00 00       	call   103284 <do_user_addr_fault+0x5d4>	103280: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05d4   103284:	4d 8b 3f             	mov    (%r15),%r15
05d7   103287:	4c 89 fe             	mov    %r15,%rsi
05da   10328a:	48 83 e6 03          	and    $0x3,%rsi
05de   10328e:	31 ff                	xor    %edi,%edi
05e0   103290:	e8 00 00 00 00       	call   103295 <do_user_addr_fault+0x5e5>	103291: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
05e5   103295:	49 83 e7 03          	and    $0x3,%r15
05e9   103299:	0f 84 b6 00 00 00    	je     103355 <do_user_addr_fault+0x6a5>
05ef   10329f:	4d 89 ef             	mov    %r13,%r15
05f2   1032a2:	4c 8b 6d 98          	mov    -0x68(%rbp),%r13
05f6   1032a6:	4c 89 ef             	mov    %r13,%rdi
05f9   1032a9:	be 08 00 00 00       	mov    $0x8,%esi
05fe   1032ae:	e8 00 00 00 00       	call   1032b3 <do_user_addr_fault+0x603>	1032af: R_X86_64_PLT32	__kasan_check_read-0x4
0603   1032b3:	43 80 3c 3e 00       	cmpb   $0x0,(%r14,%r15,1)
0608   1032b8:	74 08                	je     1032c2 <do_user_addr_fault+0x612>
060a   1032ba:	4c 89 ef             	mov    %r13,%rdi
060d   1032bd:	e8 00 00 00 00       	call   1032c2 <do_user_addr_fault+0x612>	1032be: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0612   1032c2:	4d 8b 7d 00          	mov    0x0(%r13),%r15
0616   1032c6:	be 00 00 02 00       	mov    $0x20000,%esi
061b   1032cb:	4c 21 fe             	and    %r15,%rsi
061e   1032ce:	31 ff                	xor    %edi,%edi
0620   1032d0:	e8 00 00 00 00       	call   1032d5 <do_user_addr_fault+0x625>	1032d1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0625   1032d5:	b8 00 00 02 00       	mov    $0x20000,%eax
062a   1032da:	49 21 c7             	and    %rax,%r15
062d   1032dd:	0f 85 87 02 00 00    	jne    10356a <do_user_addr_fault+0x8ba>
0633   1032e3:	4c 89 ef             	mov    %r13,%rdi
0636   1032e6:	be 08 00 00 00       	mov    $0x8,%esi
063b   1032eb:	e8 00 00 00 00       	call   1032f0 <do_user_addr_fault+0x640>	1032ec: R_X86_64_PLT32	__kasan_check_read-0x4
0640   1032f0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
064a   1032fa:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
064f   1032ff:	74 08                	je     103309 <do_user_addr_fault+0x659>
0651   103301:	4c 89 ef             	mov    %r13,%rdi
0654   103304:	e8 00 00 00 00       	call   103309 <do_user_addr_fault+0x659>	103305: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0659   103309:	4d 8b 75 00          	mov    0x0(%r13),%r14
065d   10330d:	4c 89 f6             	mov    %r14,%rsi
0660   103310:	48 83 e6 04          	and    $0x4,%rsi
0664   103314:	31 ff                	xor    %edi,%edi
0666   103316:	e8 00 00 00 00       	call   10331b <do_user_addr_fault+0x66b>	103317: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
066b   10331b:	49 83 e6 04          	and    $0x4,%r14
066f   10331f:	0f 85 fd 00 00 00    	jne    103422 <do_user_addr_fault+0x772>
0675   103325:	89 de                	mov    %ebx,%esi
0677   103327:	81 e6 00 40 00 00    	and    $0x4000,%esi
067d   10332d:	31 ff                	xor    %edi,%edi
067f   10332f:	e8 00 00 00 00       	call   103334 <do_user_addr_fault+0x684>	103330: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0684   103334:	81 e3 00 40 00 00    	and    $0x4000,%ebx
068a   10333a:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
068e   10333e:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0698   103348:	0f 85 e9 00 00 00    	jne    103437 <do_user_addr_fault+0x787>
069e   10334e:	e8 00 00 00 00       	call   103353 <do_user_addr_fault+0x6a3>	10334f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06a3   103353:	eb 24                	jmp    103379 <do_user_addr_fault+0x6c9>
06a5   103355:	89 de                	mov    %ebx,%esi
06a7   103357:	81 e6 00 40 00 00    	and    $0x4000,%esi
06ad   10335d:	31 ff                	xor    %edi,%edi
06af   10335f:	e8 00 00 00 00       	call   103364 <do_user_addr_fault+0x6b4>	103360: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06b4   103364:	81 e3 00 40 00 00    	and    $0x4000,%ebx
06ba   10336a:	0f 85 3d 01 00 00    	jne    1034ad <do_user_addr_fault+0x7fd>
06c0   103370:	e8 00 00 00 00       	call   103375 <do_user_addr_fault+0x6c5>	103371: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06c5   103375:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
06c9   103379:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
06cd   10337d:	4c 89 e6             	mov    %r12,%rsi
06d0   103380:	4c 89 f2             	mov    %r14,%rdx
06d3   103383:	e8 00 00 00 00       	call   103388 <do_user_addr_fault+0x6d8>	103384: R_X86_64_PLT32	lock_mm_and_find_vma-0x4
06d8   103388:	48 85 c0             	test   %rax,%rax
06db   10338b:	0f 84 b4 01 00 00    	je     103545 <do_user_addr_fault+0x895>
06e1   103391:	48 89 c3             	mov    %rax,%rbx
06e4   103394:	e8 00 00 00 00       	call   103399 <do_user_addr_fault+0x6e9>	103395: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06e9   103399:	44 8b 7d c8          	mov    -0x38(%rbp),%r15d
06ed   10339d:	8a 45 cf             	mov    -0x31(%rbp),%al
06f0   1033a0:	48 8b 4d 88          	mov    -0x78(%rbp),%rcx
06f4   1033a4:	e9 b8 fd ff ff       	jmp    103161 <do_user_addr_fault+0x4b1>
06f9   1033a9:	e8 00 00 00 00       	call   1033ae <do_user_addr_fault+0x6fe>	1033aa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06fe   1033ae:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
0702   1033b2:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
0706   1033b6:	4c 89 e2             	mov    %r12,%rdx
0709   1033b9:	e8 32 2f 00 00       	call   1062f0 <bad_area_access_error>
070e   1033be:	48 83 c4 50          	add    $0x50,%rsp
0712   1033c2:	5b                   	pop    %rbx
0713   1033c3:	41 5c                	pop    %r12
0715   1033c5:	41 5d                	pop    %r13
0717   1033c7:	41 5e                	pop    %r14
0719   1033c9:	41 5f                	pop    %r15
071b   1033cb:	5d                   	pop    %rbp
071c   1033cc:	c3                   	ret
071d   1033cd:	89 de                	mov    %ebx,%esi
071f   1033cf:	81 e6 00 40 00 00    	and    $0x4000,%esi
0725   1033d5:	31 ff                	xor    %edi,%edi
0727   1033d7:	e8 00 00 00 00       	call   1033dc <do_user_addr_fault+0x72c>	1033d8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
072c   1033dc:	89 d8                	mov    %ebx,%eax
072e   1033de:	25 00 40 00 00       	and    $0x4000,%eax
0733   1033e3:	75 59                	jne    10343e <do_user_addr_fault+0x78e>
0735   1033e5:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
073a   1033ea:	e8 00 00 00 00       	call   1033ef <do_user_addr_fault+0x73f>	1033eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
073f   1033ef:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
0743   1033f3:	48 81 c7 e8 00 00 00 	add    $0xe8,%rdi
074a   1033fa:	e8 00 00 00 00       	call   1033ff <do_user_addr_fault+0x74f>	1033fb: R_X86_64_PLT32	up_read-0x4
074f   1033ff:	89 de                	mov    %ebx,%esi
0751   103401:	81 e6 73 08 00 00    	and    $0x873,%esi
0757   103407:	31 ff                	xor    %edi,%edi
0759   103409:	e8 00 00 00 00       	call   10340e <do_user_addr_fault+0x75e>	10340a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
075e   10340e:	89 d8                	mov    %ebx,%eax
0760   103410:	25 73 08 00 00       	and    $0x873,%eax
0765   103415:	0f 85 76 01 00 00    	jne    103591 <do_user_addr_fault+0x8e1>
076b   10341b:	e8 00 00 00 00       	call   103420 <do_user_addr_fault+0x770>	10341c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0770   103420:	eb 9c                	jmp    1033be <do_user_addr_fault+0x70e>
0772   103422:	e8 00 00 00 00       	call   103427 <do_user_addr_fault+0x777>	103423: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0777   103427:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
077b   10342b:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0785   103435:	eb 1a                	jmp    103451 <do_user_addr_fault+0x7a1>
0787   103437:	e8 00 00 00 00       	call   10343c <do_user_addr_fault+0x78c>	103438: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
078c   10343c:	eb 80                	jmp    1033be <do_user_addr_fault+0x70e>
078e   10343e:	e8 00 00 00 00       	call   103443 <do_user_addr_fault+0x793>	10343f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0793   103443:	e9 76 ff ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
0798   103448:	e8 00 00 00 00       	call   10344d <do_user_addr_fault+0x79d>	103449: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
079d   10344d:	4c 8b 75 d0          	mov    -0x30(%rbp),%r14
07a1   103451:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
07a5   103455:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
07aa   10345a:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
07ae   10345e:	74 08                	je     103468 <do_user_addr_fault+0x7b8>
07b0   103460:	48 89 df             	mov    %rbx,%rdi
07b3   103463:	e8 00 00 00 00       	call   103468 <do_user_addr_fault+0x7b8>	103464: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07b8   103468:	48 8b 1b             	mov    (%rbx),%rbx
07bb   10346b:	48 89 de             	mov    %rbx,%rsi
07be   10346e:	48 83 e6 03          	and    $0x3,%rsi
07c2   103472:	31 ff                	xor    %edi,%edi
07c4   103474:	e8 00 00 00 00       	call   103479 <do_user_addr_fault+0x7c9>	103475: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
07c9   103479:	48 83 e3 03          	and    $0x3,%rbx
07cd   10347d:	74 0a                	je     103489 <do_user_addr_fault+0x7d9>
07cf   10347f:	e8 00 00 00 00       	call   103484 <do_user_addr_fault+0x7d4>	103480: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07d4   103484:	e9 35 ff ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
07d9   103489:	e8 00 00 00 00       	call   10348e <do_user_addr_fault+0x7de>	10348a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07de   10348e:	4c 89 f7             	mov    %r14,%rdi
07e1   103491:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
07e5   103495:	4c 89 e2             	mov    %r12,%rdx
07e8   103498:	b9 07 00 00 00       	mov    $0x7,%ecx
07ed   10349d:	41 b8 02 00 00 00    	mov    $0x2,%r8d
07f3   1034a3:	e8 28 0d 00 00       	call   1041d0 <kernelmode_fixup_or_oops>
07f8   1034a8:	e9 11 ff ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
07fd   1034ad:	e8 00 00 00 00       	call   1034b2 <do_user_addr_fault+0x802>	1034ae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0802   1034b2:	e9 07 ff ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
0807   1034b7:	4c 89 f7             	mov    %r14,%rdi
080a   1034ba:	4c 89 fe             	mov    %r15,%rsi
080d   1034bd:	e8 5e 2b 00 00       	call   106020 <is_errata93>
0812   1034c2:	89 c3                	mov    %eax,%ebx
0814   1034c4:	31 ff                	xor    %edi,%edi
0816   1034c6:	89 c6                	mov    %eax,%esi
0818   1034c8:	e8 00 00 00 00       	call   1034cd <do_user_addr_fault+0x81d>	1034c9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
081d   1034cd:	85 db                	test   %ebx,%ebx
081f   1034cf:	74 4f                	je     103520 <do_user_addr_fault+0x870>
0821   1034d1:	e8 00 00 00 00       	call   1034d6 <do_user_addr_fault+0x826>	1034d2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0826   1034d6:	e9 e3 fe ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
082b   1034db:	e8 00 00 00 00       	call   1034e0 <do_user_addr_fault+0x830>	1034dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0830   1034e0:	4c 89 f7             	mov    %r14,%rdi
0833   1034e3:	4c 89 e6             	mov    %r12,%rsi
0836   1034e6:	4c 89 fa             	mov    %r15,%rdx
0839   1034e9:	e8 72 2d 00 00       	call   106260 <pgtable_bad>
083e   1034ee:	e9 69 f9 ff ff       	jmp    102e5c <do_user_addr_fault+0x1ac>
0843   1034f3:	e8 00 00 00 00       	call   1034f8 <do_user_addr_fault+0x848>	1034f4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0848   1034f8:	eb 05                	jmp    1034ff <do_user_addr_fault+0x84f>
084a   1034fa:	e8 00 00 00 00       	call   1034ff <do_user_addr_fault+0x84f>	1034fb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
084f   1034ff:	4c 89 f7             	mov    %r14,%rdi
0852   103502:	4c 89 e6             	mov    %r12,%rsi
0855   103505:	4c 89 fa             	mov    %r15,%rdx
0858   103508:	eb 4a                	jmp    103554 <do_user_addr_fault+0x8a4>
085a   10350a:	e8 00 00 00 00       	call   10350f <do_user_addr_fault+0x85f>	10350b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
085f   10350f:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
0863   103513:	eb 35                	jmp    10354a <do_user_addr_fault+0x89a>
0865   103515:	e8 00 00 00 00       	call   10351a <do_user_addr_fault+0x86a>	103516: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
086a   10351a:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
086e   10351e:	eb 08                	jmp    103528 <do_user_addr_fault+0x878>
0870   103520:	e8 00 00 00 00       	call   103525 <do_user_addr_fault+0x875>	103521: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0875   103525:	4c 89 f7             	mov    %r14,%rdi
0878   103528:	4c 89 e6             	mov    %r12,%rsi
087b   10352b:	4c 89 fa             	mov    %r15,%rdx
087e   10352e:	e8 ed 0e 00 00       	call   104420 <page_fault_oops>
0883   103533:	e9 86 fe ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
0888   103538:	e8 00 00 00 00       	call   10353d <do_user_addr_fault+0x88d>	103539: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
088d   10353d:	4d 89 ec             	mov    %r13,%r12
0890   103540:	e9 69 fe ff ff       	jmp    1033ae <do_user_addr_fault+0x6fe>
0895   103545:	e8 00 00 00 00       	call   10354a <do_user_addr_fault+0x89a>	103546: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
089a   10354a:	4c 89 f7             	mov    %r14,%rdi
089d   10354d:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
08a1   103551:	4c 89 e2             	mov    %r12,%rdx
08a4   103554:	e8 97 06 00 00       	call   103bf0 <bad_area_nosemaphore>
08a9   103559:	e9 60 fe ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
08ae   10355e:	e8 00 00 00 00       	call   103563 <do_user_addr_fault+0x8b3>	10355f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08b3   103563:	0f 0b                	ud2
08b5   103565:	e9 54 fe ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
08ba   10356a:	e8 00 00 00 00       	call   10356f <do_user_addr_fault+0x8bf>	10356b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08bf   10356f:	e9 b3 fe ff ff       	jmp    103427 <do_user_addr_fault+0x777>
08c4   103574:	89 d9                	mov    %ebx,%ecx
08c6   103576:	80 e1 07             	and    $0x7,%cl
08c9   103579:	80 c1 03             	add    $0x3,%cl
08cc   10357c:	38 c1                	cmp    %al,%cl
08ce   10357e:	0f 8c 69 f9 ff ff    	jl     102eed <do_user_addr_fault+0x23d>
08d4   103584:	48 89 df             	mov    %rbx,%rdi
08d7   103587:	e8 00 00 00 00       	call   10358c <do_user_addr_fault+0x8dc>	103588: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
08dc   10358c:	e9 5c f9 ff ff       	jmp    102eed <do_user_addr_fault+0x23d>
08e1   103591:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
08eb   10359b:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
08ef   10359f:	e8 ec 2d 00 00       	call   106390 <fatal_signal_pending>
08f4   1035a4:	41 89 c6             	mov    %eax,%r14d
08f7   1035a7:	31 ff                	xor    %edi,%edi
08f9   1035a9:	89 c6                	mov    %eax,%esi
08fb   1035ab:	e8 00 00 00 00       	call   1035b0 <do_user_addr_fault+0x900>	1035ac: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0900   1035b0:	45 85 f6             	test   %r14d,%r14d
0903   1035b3:	74 3a                	je     1035ef <do_user_addr_fault+0x93f>
0905   1035b5:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
0909   1035b9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
090e   1035be:	74 09                	je     1035c9 <do_user_addr_fault+0x919>
0910   1035c0:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
0914   1035c4:	e8 00 00 00 00       	call   1035c9 <do_user_addr_fault+0x919>	1035c5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0919   1035c9:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
091d   1035cd:	4c 8b 30             	mov    (%rax),%r14
0920   1035d0:	4c 89 f6             	mov    %r14,%rsi
0923   1035d3:	48 83 e6 03          	and    $0x3,%rsi
0927   1035d7:	31 ff                	xor    %edi,%edi
0929   1035d9:	e8 00 00 00 00       	call   1035de <do_user_addr_fault+0x92e>	1035da: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
092e   1035de:	49 83 e6 03          	and    $0x3,%r14
0932   1035e2:	0f 84 8d 00 00 00    	je     103675 <do_user_addr_fault+0x9c5>
0938   1035e8:	e8 00 00 00 00       	call   1035ed <do_user_addr_fault+0x93d>	1035e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
093d   1035ed:	eb 05                	jmp    1035f4 <do_user_addr_fault+0x944>
093f   1035ef:	e8 00 00 00 00       	call   1035f4 <do_user_addr_fault+0x944>	1035f0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0944   1035f4:	89 de                	mov    %ebx,%esi
0946   1035f6:	83 e6 01             	and    $0x1,%esi
0949   1035f9:	31 ff                	xor    %edi,%edi
094b   1035fb:	e8 00 00 00 00       	call   103600 <do_user_addr_fault+0x950>	1035fc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0950   103600:	89 d8                	mov    %ebx,%eax
0952   103602:	83 e0 01             	and    $0x1,%eax
0955   103605:	75 30                	jne    103637 <do_user_addr_fault+0x987>
0957   103607:	89 de                	mov    %ebx,%esi
0959   103609:	83 e6 32             	and    $0x32,%esi
095c   10360c:	31 ff                	xor    %edi,%edi
095e   10360e:	e8 00 00 00 00       	call   103613 <do_user_addr_fault+0x963>	10360f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0963   103613:	89 d8                	mov    %ebx,%eax
0965   103615:	83 e0 32             	and    $0x32,%eax
0968   103618:	74 76                	je     103690 <do_user_addr_fault+0x9e0>
096a   10361a:	e8 00 00 00 00       	call   10361f <do_user_addr_fault+0x96f>	10361b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
096f   10361f:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
0973   103623:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
0977   103627:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
097b   10362b:	89 d9                	mov    %ebx,%ecx
097d   10362d:	e8 fe 2d 00 00       	call   106430 <do_sigbus>
0982   103632:	e9 87 fd ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
0987   103637:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
098b   10363b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0990   103640:	74 09                	je     10364b <do_user_addr_fault+0x99b>
0992   103642:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
0996   103646:	e8 00 00 00 00       	call   10364b <do_user_addr_fault+0x99b>	103647: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
099b   10364b:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
099f   10364f:	48 8b 18             	mov    (%rax),%rbx
09a2   103652:	48 89 de             	mov    %rbx,%rsi
09a5   103655:	48 83 e6 03          	and    $0x3,%rsi
09a9   103659:	31 ff                	xor    %edi,%edi
09ab   10365b:	e8 00 00 00 00       	call   103660 <do_user_addr_fault+0x9b0>	10365c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09b0   103660:	48 83 e3 03          	and    $0x3,%rbx
09b4   103664:	74 55                	je     1036bb <do_user_addr_fault+0xa0b>
09b6   103666:	e8 00 00 00 00       	call   10366b <do_user_addr_fault+0x9bb>	103667: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09bb   10366b:	e8 00 00 00 00       	call   103670 <do_user_addr_fault+0x9c0>	10366c: R_X86_64_PLT32	pagefault_out_of_memory-0x4
09c0   103670:	e9 49 fd ff ff       	jmp    1033be <do_user_addr_fault+0x70e>
09c5   103675:	e8 00 00 00 00       	call   10367a <do_user_addr_fault+0x9ca>	103676: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09ca   10367a:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
09ce   10367e:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
09d2   103682:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
09d6   103686:	31 c9                	xor    %ecx,%ecx
09d8   103688:	45 31 c0             	xor    %r8d,%r8d
09db   10368b:	e9 13 fe ff ff       	jmp    1034a3 <do_user_addr_fault+0x7f3>
09e0   103690:	89 de                	mov    %ebx,%esi
09e2   103692:	83 e6 40             	and    $0x40,%esi
09e5   103695:	31 ff                	xor    %edi,%edi
09e7   103697:	e8 00 00 00 00       	call   10369c <do_user_addr_fault+0x9ec>	103698: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09ec   10369c:	83 e3 40             	and    $0x40,%ebx
09ef   10369f:	0f 84 a4 00 00 00    	je     103749 <do_user_addr_fault+0xa99>
09f5   1036a5:	e8 00 00 00 00       	call   1036aa <do_user_addr_fault+0x9fa>	1036a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09fa   1036aa:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
09fe   1036ae:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
0a02   1036b2:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
0a06   1036b6:	e9 99 fe ff ff       	jmp    103554 <do_user_addr_fault+0x8a4>
0a0b   1036bb:	e8 00 00 00 00       	call   1036c0 <do_user_addr_fault+0xa10>	1036bc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a10   1036c0:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
0a14   1036c4:	48 8b 75 c0          	mov    -0x40(%rbp),%rsi
0a18   1036c8:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
0a1c   1036cc:	b9 0b 00 00 00       	mov    $0xb,%ecx
0a21   1036d1:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0a27   1036d7:	e9 c7 fd ff ff       	jmp    1034a3 <do_user_addr_fault+0x7f3>
0a2c   1036dc:	f3 0f 1e fa          	endbr64
0a30   1036e0:	e8 00 00 00 00       	call   1036e5 <do_user_addr_fault+0xa35>	1036e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a35   1036e5:	e9 80 f7 ff ff       	jmp    102e6a <do_user_addr_fault+0x1ba>
0a3a   1036ea:	f3 0f 1e fa          	endbr64
0a3e   1036ee:	e8 00 00 00 00       	call   1036f3 <do_user_addr_fault+0xa43>	1036ef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a43   1036f3:	e9 d7 f7 ff ff       	jmp    102ecf <do_user_addr_fault+0x21f>
0a48   1036f8:	f3 0f 1e fa          	endbr64
0a4c   1036fc:	e8 00 00 00 00       	call   103701 <do_user_addr_fault+0xa51>	1036fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a51   103701:	be 01 00 00 00       	mov    $0x1,%esi
0a56   103706:	bf 02 00 00 00       	mov    $0x2,%edi
0a5b   10370b:	4c 89 f2             	mov    %r14,%rdx
0a5e   10370e:	4c 89 f9             	mov    %r15,%rcx
0a61   103711:	e8 00 00 00 00       	call   103716 <do_user_addr_fault+0xa66>	103712: R_X86_64_PLT32	__perf_sw_event-0x4
0a66   103716:	e9 31 f9 ff ff       	jmp    10304c <do_user_addr_fault+0x39c>
0a6b   10371b:	e8 00 00 00 00       	call   103720 <do_user_addr_fault+0xa70>	10371c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a70   103720:	0f 0b                	ud2
0a72   103722:	e8 00 00 00 00       	call   103727 <do_user_addr_fault+0xa77>	103723: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a77   103727:	0f 0b                	ud2
0a79   103729:	e8 00 00 00 00       	call   10372e <do_user_addr_fault+0xa7e>	10372a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a7e   10372e:	0f 0b                	ud2
0a80   103730:	f3 0f 1e fa          	endbr64
0a84   103734:	e8 00 00 00 00       	call   103739 <do_user_addr_fault+0xa89>	103735: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a89   103739:	48 8b 7d a0          	mov    -0x60(%rbp),%rdi
0a8d   10373d:	31 f6                	xor    %esi,%esi
0a8f   10373f:	e8 00 00 00 00       	call   103744 <do_user_addr_fault+0xa94>	103740: R_X86_64_PLT32	__mmap_lock_do_trace_released-0x4
0a94   103744:	e9 a6 fc ff ff       	jmp    1033ef <do_user_addr_fault+0x73f>
0a99   103749:	e8 00 00 00 00       	call   10374e <do_user_addr_fault+0xa9e>	10374a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a9e   10374e:	0f 0b                	ud2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
