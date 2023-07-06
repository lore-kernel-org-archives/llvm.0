Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C04A3B;
	Thu,  6 Jul 2023 10:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688637686; x=1720173686;
  h=date:from:cc:subject:message-id:mime-version;
  bh=+zFu8GSD0kfYAK/n5rBVIoLb4HJLdTsmKF7TRg4nATM=;
  b=HEhLKnq2fkICyGLFHRPftfChxILnn7nhWKDQF1xumxxM8+Src6Kkq/mV
   uGS5q1RK/WxhZnWnH8dbKOdyoD/EU4+TwG1al9nVcqlhFiUBhp2OwDuXc
   ynHELfVX5x4b2ggl2NvV3wyC0Kz8fGygcMym1qomLLL18wL6kNpZgmVTB
   Um8zMzCmtmiRqTwGkFtEzq7QuKR+L1LcyAIg/fR3JNUDSh4WX7amwMESL
   ORsBEgzwm/CJ/BTast0Z/K/EKksX2Z+9H98oufXf4lsMmVJCTJN383vLq
   2yU4hN7xnDfM9js/mMkPXRr438j0TsYR2qNjIH/G/NP6LxPxf2ChXvEtp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="363593402"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="363593402"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 03:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="722744538"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="722744538"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Jul 2023 03:01:22 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHLnd-0001Ep-2B;
	Thu, 06 Jul 2023 10:01:21 +0000
Date: Thu, 6 Jul 2023 18:00:39 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: mm/vmscan.o: warning: objtool: shrink_lruvec+0x901: sibling call
 from callable instruction with modified stack frame
Message-ID: <202307061709.7DE9dQyc-lkp@intel.com>
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
CC: Borislav Petkov <bp@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c17414a273b81fe4e34e11d69fc30cc8b1431614
commit: f43b9876e857c739d407bc56df288b0ebe1a9164 x86/retbleed: Add fine grained Kconfig knobs
date:   1 year ago
config: x86_64-randconfig-r031-20230706 (https://download.01.org/0day-ci/archive/20230706/202307061709.7DE9dQyc-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061709.7DE9dQyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061709.7DE9dQyc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_lruvec+0x901: sibling call from callable instruction with modified stack frame


objdump-func vmlinux.o shrink_lruvec:
0000 000000000085dd4b <shrink_lruvec>:
0000   85dd4b:	55                   	push   %rbp
0001   85dd4c:	48 89 e5             	mov    %rsp,%rbp
0004   85dd4f:	41 57                	push   %r15
0006   85dd51:	41 56                	push   %r14
0008   85dd53:	41 55                	push   %r13
000a   85dd55:	41 54                	push   %r12
000c   85dd57:	53                   	push   %rbx
000d   85dd58:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0011   85dd5c:	48 81 ec f0 01 00 00 	sub    $0x1f0,%rsp
0018   85dd63:	48 89 f3             	mov    %rsi,%rbx
001b   85dd66:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
0020   85dd6b:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
002a   85dd75:	e8 00 00 00 00       	call   85dd7a <shrink_lruvec+0x2f>	85dd76: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002f   85dd7a:	48 8d bc 24 e0 00 00 00 	lea    0xe0(%rsp),%rdi
0037   85dd82:	ba 28 00 00 00       	mov    $0x28,%edx
003c   85dd87:	31 f6                	xor    %esi,%esi
003e   85dd89:	e8 00 00 00 00       	call   85dd8e <shrink_lruvec+0x43>	85dd8a: R_X86_64_PLT32	memset-0x4
0043   85dd8e:	48 8d bc 24 90 01 00 00 	lea    0x190(%rsp),%rdi
004b   85dd96:	ba 28 00 00 00       	mov    $0x28,%edx
0050   85dd9b:	31 f6                	xor    %esi,%esi
0052   85dd9d:	e8 00 00 00 00       	call   85dda2 <shrink_lruvec+0x57>	85dd9e: R_X86_64_PLT32	memset-0x4
0057   85dda2:	48 89 d8             	mov    %rbx,%rax
005a   85dda5:	48 c1 e8 03          	shr    $0x3,%rax
005e   85dda9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0063   85ddae:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
0068   85ddb3:	74 0f                	je     85ddc4 <shrink_lruvec+0x79>
006a   85ddb5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
006f   85ddba:	e8 00 00 00 00       	call   85ddbf <shrink_lruvec+0x74>	85ddbb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0074   85ddbf:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
0079   85ddc4:	48 8b 03             	mov    (%rbx),%rax
007c   85ddc7:	48 89 84 24 c0 01 00 00 	mov    %rax,0x1c0(%rsp)
0084   85ddcf:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
0089   85ddd4:	4c 8d b0 c0 00 00 00 	lea    0xc0(%rax),%r14
0090   85dddb:	4c 89 f0             	mov    %r14,%rax
0093   85ddde:	48 c1 e8 03          	shr    $0x3,%rax
0097   85dde2:	48 89 84 24 60 01 00 00 	mov    %rax,0x160(%rsp)
009f   85ddea:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00a4   85ddef:	74 08                	je     85ddf9 <shrink_lruvec+0xae>
00a6   85ddf1:	4c 89 f7             	mov    %r14,%rdi
00a9   85ddf4:	e8 00 00 00 00       	call   85ddf9 <shrink_lruvec+0xae>	85ddf5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ae   85ddf9:	4d 8b 3e             	mov    (%r14),%r15
00b1   85ddfc:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	85ddff: R_X86_64_32S	memory_cgrp_subsys_enabled_key
00b8   85de03:	48 c1 e8 03          	shr    $0x3,%rax
00bc   85de07:	42 8a 04 20          	mov    (%rax,%r12,1),%al
00c0   85de0b:	84 c0                	test   %al,%al
00c2   85de0d:	0f 85 0e 24 00 00    	jne    860221 <shrink_lruvec+0x24d6>
00c8   85de13:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85de19 <shrink_lruvec+0xce>	85de15: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
00ce   85de19:	bf 01 00 00 00       	mov    $0x1,%edi
00d3   85de1e:	89 de                	mov    %ebx,%esi
00d5   85de20:	e8 00 00 00 00       	call   85de25 <shrink_lruvec+0xda>	85de21: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00da   85de25:	85 db                	test   %ebx,%ebx
00dc   85de27:	7e 2c                	jle    85de55 <shrink_lruvec+0x10a>
00de   85de29:	e8 00 00 00 00       	call   85de2e <shrink_lruvec+0xe3>	85de2a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00e3   85de2e:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
00e8   85de33:	48 8d 98 30 04 00 00 	lea    0x430(%rax),%rbx
00ef   85de3a:	48 89 d8             	mov    %rbx,%rax
00f2   85de3d:	48 c1 e8 03          	shr    $0x3,%rax
00f6   85de41:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
00fb   85de46:	74 08                	je     85de50 <shrink_lruvec+0x105>
00fd   85de48:	48 89 df             	mov    %rbx,%rdi
0100   85de4b:	e8 00 00 00 00       	call   85de50 <shrink_lruvec+0x105>	85de4c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0105   85de50:	48 8b 03             	mov    (%rbx),%rax
0108   85de53:	eb 07                	jmp    85de5c <shrink_lruvec+0x111>
010a   85de55:	e8 00 00 00 00       	call   85de5a <shrink_lruvec+0x10f>	85de56: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
010f   85de5a:	31 c0                	xor    %eax,%eax
0111   85de5c:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
0116   85de61:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	85de64: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
011d   85de68:	48 c1 e8 03          	shr    $0x3,%rax
0121   85de6c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0125   85de70:	84 c0                	test   %al,%al
0127   85de72:	0f 85 cf 23 00 00    	jne    860247 <shrink_lruvec+0x24fc>
012d   85de78:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85de7e <shrink_lruvec+0x133>	85de7a: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
0133   85de7e:	31 ff                	xor    %edi,%edi
0135   85de80:	89 de                	mov    %ebx,%esi
0137   85de82:	e8 00 00 00 00       	call   85de87 <shrink_lruvec+0x13c>	85de83: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
013c   85de87:	85 db                	test   %ebx,%ebx
013e   85de89:	0f 8e 15 23 00 00    	jle    8601a4 <shrink_lruvec+0x2459>
0144   85de8f:	e8 00 00 00 00       	call   85de94 <shrink_lruvec+0x149>	85de90: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0149   85de94:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	85de97: R_X86_64_32S	vm_swappiness
0150   85de9b:	4c 89 74 24 50       	mov    %r14,0x50(%rsp)
0155   85dea0:	48 89 d8             	mov    %rbx,%rax
0158   85dea3:	48 c1 e8 03          	shr    $0x3,%rax
015c   85dea7:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0160   85deab:	84 c0                	test   %al,%al
0162   85dead:	0f 85 ba 23 00 00    	jne    86026d <shrink_lruvec+0x2522>
0168   85deb3:	4c 63 33             	movslq (%rbx),%r14
016b   85deb6:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
0173   85debe:	ba 10 00 00 00       	mov    $0x10,%edx
0178   85dec3:	31 f6                	xor    %esi,%esi
017a   85dec5:	e8 00 00 00 00       	call   85deca <shrink_lruvec+0x17f>	85dec6: R_X86_64_PLT32	memset-0x4
017f   85deca:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0184   85decf:	48 8d 50 28          	lea    0x28(%rax),%rdx
0188   85ded3:	48 89 d0             	mov    %rdx,%rax
018b   85ded6:	48 c1 e8 03          	shr    $0x3,%rax
018f   85deda:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
0197   85dee2:	42 8a 04 20          	mov    (%rax,%r12,1),%al
019b   85dee6:	84 c0                	test   %al,%al
019d   85dee8:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
01a2   85deed:	0f 85 97 23 00 00    	jne    86028a <shrink_lruvec+0x253f>
01a8   85def3:	44 0f b7 22          	movzwl (%rdx),%r12d
01ac   85def7:	44 89 e6             	mov    %r12d,%esi
01af   85defa:	83 e6 40             	and    $0x40,%esi
01b2   85defd:	31 ff                	xor    %edi,%edi
01b4   85deff:	e8 00 00 00 00       	call   85df04 <shrink_lruvec+0x1b9>	85df00: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
01b9   85df04:	44 89 e0             	mov    %r12d,%eax
01bc   85df07:	83 e0 40             	and    $0x40,%eax
01bf   85df0a:	75 0a                	jne    85df16 <shrink_lruvec+0x1cb>
01c1   85df0c:	e8 00 00 00 00       	call   85df11 <shrink_lruvec+0x1c6>	85df0d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01c6   85df11:	e9 04 01 00 00       	jmp    85e01a <shrink_lruvec+0x2cf>
01cb   85df16:	49 81 c7 80 1b 02 00 	add    $0x21b80,%r15
01d2   85df1d:	4c 89 f8             	mov    %r15,%rax
01d5   85df20:	48 c1 e8 03          	shr    $0x3,%rax
01d9   85df24:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
01e3   85df2e:	8a 04 18             	mov    (%rax,%rbx,1),%al
01e6   85df31:	84 c0                	test   %al,%al
01e8   85df33:	0f 85 74 23 00 00    	jne    8602ad <shrink_lruvec+0x2562>
01ee   85df39:	45 8b 3f             	mov    (%r15),%r15d
01f1   85df3c:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	85df3f: R_X86_64_32S	numa_demotion_enabled
01f8   85df43:	48 c1 e8 03          	shr    $0x3,%rax
01fc   85df47:	8a 04 18             	mov    (%rax,%rbx,1),%al
01ff   85df4a:	84 c0                	test   %al,%al
0201   85df4c:	0f 85 79 23 00 00    	jne    8602cb <shrink_lruvec+0x2580>
0207   85df52:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 85df59 <shrink_lruvec+0x20e>	85df55: R_X86_64_PC32	numa_demotion_enabled-0x4
020e   85df59:	31 ff                	xor    %edi,%edi
0210   85df5b:	89 de                	mov    %ebx,%esi
0212   85df5d:	e8 00 00 00 00       	call   85df62 <shrink_lruvec+0x217>	85df5e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0217   85df62:	85 db                	test   %ebx,%ebx
0219   85df64:	74 29                	je     85df8f <shrink_lruvec+0x244>
021b   85df66:	41 81 e4 00 20 00 00 	and    $0x2000,%r12d
0222   85df6d:	31 ff                	xor    %edi,%edi
0224   85df6f:	44 89 e6             	mov    %r12d,%esi
0227   85df72:	e8 00 00 00 00       	call   85df77 <shrink_lruvec+0x22c>	85df73: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
022c   85df77:	48 83 7c 24 10 00    	cmpq   $0x0,0x10(%rsp)
0232   85df7d:	74 1a                	je     85df99 <shrink_lruvec+0x24e>
0234   85df7f:	66 45 85 e4          	test   %r12w,%r12w
0238   85df83:	74 14                	je     85df99 <shrink_lruvec+0x24e>
023a   85df85:	e8 00 00 00 00       	call   85df8a <shrink_lruvec+0x23f>	85df86: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
023f   85df8a:	e9 8b 00 00 00       	jmp    85e01a <shrink_lruvec+0x2cf>
0244   85df8f:	e8 00 00 00 00       	call   85df94 <shrink_lruvec+0x249>	85df90: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0249   85df94:	e9 81 00 00 00       	jmp    85e01a <shrink_lruvec+0x2cf>
024e   85df99:	44 89 ff             	mov    %r15d,%edi
0251   85df9c:	e8 00 00 00 00       	call   85dfa1 <shrink_lruvec+0x256>	85df9d: R_X86_64_PLT32	next_demotion_node-0x4
0256   85dfa1:	89 c3                	mov    %eax,%ebx
0258   85dfa3:	bf ff ff ff ff       	mov    $0xffffffff,%edi
025d   85dfa8:	89 c6                	mov    %eax,%esi
025f   85dfaa:	e8 00 00 00 00       	call   85dfaf <shrink_lruvec+0x264>	85dfab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0264   85dfaf:	83 fb ff             	cmp    $0xffffffff,%ebx
0267   85dfb2:	74 61                	je     85e015 <shrink_lruvec+0x2ca>
0269   85dfb4:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
026e   85dfb9:	48 8d 58 10          	lea    0x10(%rax),%rbx
0272   85dfbd:	48 89 d8             	mov    %rbx,%rax
0275   85dfc0:	48 c1 e8 03          	shr    $0x3,%rax
0279   85dfc4:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
0283   85dfce:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0288   85dfd3:	74 08                	je     85dfdd <shrink_lruvec+0x292>
028a   85dfd5:	48 89 df             	mov    %rbx,%rdi
028d   85dfd8:	e8 00 00 00 00       	call   85dfdd <shrink_lruvec+0x292>	85dfd9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0292   85dfdd:	48 8b 1b             	mov    (%rbx),%rbx
0295   85dfe0:	31 ff                	xor    %edi,%edi
0297   85dfe2:	44 89 f6             	mov    %r14d,%esi
029a   85dfe5:	e8 00 00 00 00       	call   85dfea <shrink_lruvec+0x29f>	85dfe6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
029f   85dfea:	48 85 db             	test   %rbx,%rbx
02a2   85dfed:	0f 84 1c 20 00 00    	je     86000f <shrink_lruvec+0x22c4>
02a8   85dff3:	45 85 f6             	test   %r14d,%r14d
02ab   85dff6:	0f 85 13 20 00 00    	jne    86000f <shrink_lruvec+0x22c4>
02b1   85dffc:	e8 00 00 00 00       	call   85e001 <shrink_lruvec+0x2b6>	85dffd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02b6   85e001:	b8 03 00 00 00       	mov    $0x3,%eax
02bb   85e006:	b9 01 00 00 00       	mov    $0x1,%ecx
02c0   85e00b:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
02c5   85e010:	45 31 f6             	xor    %r14d,%r14d
02c8   85e013:	eb 21                	jmp    85e036 <shrink_lruvec+0x2eb>
02ca   85e015:	e8 00 00 00 00       	call   85e01a <shrink_lruvec+0x2cf>	85e016: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02cf   85e01a:	b8 03 00 00 00       	mov    $0x3,%eax
02d4   85e01f:	b9 01 00 00 00       	mov    $0x1,%ecx
02d9   85e024:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
02de   85e029:	45 31 f6             	xor    %r14d,%r14d
02e1   85e02c:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
02eb   85e036:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
02f0   85e03b:	48 8d 71 2c          	lea    0x2c(%rcx),%rsi
02f4   85e03f:	4c 8d 69 10          	lea    0x10(%rcx),%r13
02f8   85e043:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
02fd   85e048:	48 8d ba 48 01 00 00 	lea    0x148(%rdx),%rdi
0304   85e04f:	48 89 bc 24 80 00 00 00 	mov    %rdi,0x80(%rsp)
030c   85e057:	48 8d ba 60 01 00 00 	lea    0x160(%rdx),%rdi
0313   85e05e:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
0318   85e063:	48 83 c1 2b          	add    $0x2b,%rcx
031c   85e067:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
0321   85e06c:	48 8d 4a 54          	lea    0x54(%rdx),%rcx
0325   85e070:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
032a   85e075:	4c 89 b4 24 10 01 00 00 	mov    %r14,0x110(%rsp)
0332   85e07d:	49 8d 4e ff          	lea    -0x1(%r14),%rcx
0336   85e081:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
033e   85e089:	b9 48 06 00 00       	mov    $0x648,%ecx
0343   85e08e:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
0348   85e093:	48 89 f1             	mov    %rsi,%rcx
034b   85e096:	48 89 b4 24 98 00 00 00 	mov    %rsi,0x98(%rsp)
0353   85e09e:	48 c1 ee 03          	shr    $0x3,%rsi
0357   85e0a2:	48 89 b4 24 90 00 00 00 	mov    %rsi,0x90(%rsp)
035f   85e0aa:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85e0ad: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0366   85e0b1:	48 c1 e9 03          	shr    $0x3,%rcx
036a   85e0b5:	48 89 8c 24 88 00 00 00 	mov    %rcx,0x88(%rsp)
0372   85e0bd:	89 c0                	mov    %eax,%eax
0374   85e0bf:	48 89 84 24 50 01 00 00 	mov    %rax,0x150(%rsp)
037c   85e0c7:	48 8b 04 c5 00 00 00 00 	mov    0x0(,%rax,8),%rax	85e0cb: R_X86_64_32S	.rodata+0x4efd60
0384   85e0cf:	48 89 84 24 20 01 00 00 	mov    %rax,0x120(%rsp)
038c   85e0d7:	31 db                	xor    %ebx,%ebx
038e   85e0d9:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
0393   85e0de:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
0398   85e0e3:	83 e3 fe             	and    $0xfffffffe,%ebx
039b   85e0e6:	bf 02 00 00 00       	mov    $0x2,%edi
03a0   85e0eb:	48 89 de             	mov    %rbx,%rsi
03a3   85e0ee:	e8 00 00 00 00       	call   85e0f3 <shrink_lruvec+0x3a8>	85e0ef: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
03a8   85e0f3:	48 89 9c 24 a0 00 00 00 	mov    %rbx,0xa0(%rsp)
03b0   85e0fb:	48 83 fb 02          	cmp    $0x2,%rbx
03b4   85e0ff:	0f 94 84 24 28 01 00 00 	sete   0x128(%rsp)
03bc   85e107:	48 8b 84 24 90 00 00 00 	mov    0x90(%rsp),%rax
03c4   85e10f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
03c8   85e113:	84 c0                	test   %al,%al
03ca   85e115:	0f 85 cf 06 00 00    	jne    85e7ea <shrink_lruvec+0xa9f>
03d0   85e11b:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
03d8   85e123:	0f b6 18             	movzbl (%rax),%ebx
03db   85e126:	31 ff                	xor    %edi,%edi
03dd   85e128:	89 de                	mov    %ebx,%esi
03df   85e12a:	e8 00 00 00 00       	call   85e12f <shrink_lruvec+0x3e4>	85e12b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
03e4   85e12f:	84 db                	test   %bl,%bl
03e6   85e131:	0f 88 62 02 00 00    	js     85e399 <shrink_lruvec+0x64e>
03ec   85e137:	48 69 c3 c0 06 00 00 	imul   $0x6c0,%rbx,%rax
03f3   85e13e:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
03fb   85e146:	4c 8b 64 24 68       	mov    0x68(%rsp),%r12
0400   85e14b:	4c 89 e3             	mov    %r12,%rbx
0403   85e14e:	4c 89 64 24 38       	mov    %r12,0x38(%rsp)
0408   85e153:	45 31 f6             	xor    %r14d,%r14d
040b   85e156:	45 31 ff             	xor    %r15d,%r15d
040e   85e159:	31 c0                	xor    %eax,%eax
0410   85e15b:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
0415   85e160:	4c 8b a4 24 88 00 00 00 	mov    0x88(%rsp),%r12
041d   85e168:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
0422   85e16d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
042c   85e177:	48 8b 8c 24 60 01 00 00 	mov    0x160(%rsp),%rcx
0434   85e17f:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0438   85e183:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
043d   85e188:	74 08                	je     85e192 <shrink_lruvec+0x447>
043f   85e18a:	48 89 df             	mov    %rbx,%rdi
0442   85e18d:	e8 00 00 00 00       	call   85e192 <shrink_lruvec+0x447>	85e18e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0447   85e192:	4c 8b 2b             	mov    (%rbx),%r13
044a   85e195:	bf 05 00 00 00       	mov    $0x5,%edi
044f   85e19a:	4c 89 fe             	mov    %r15,%rsi
0452   85e19d:	e8 00 00 00 00       	call   85e1a2 <shrink_lruvec+0x457>	85e19e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0457   85e1a2:	49 83 ff 04          	cmp    $0x4,%r15
045b   85e1a6:	0f 87 aa 01 00 00    	ja     85e356 <shrink_lruvec+0x60b>
0461   85e1ac:	e8 00 00 00 00       	call   85e1b1 <shrink_lruvec+0x466>	85e1ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0466   85e1b1:	4b 8d 1c 2e          	lea    (%r14,%r13,1),%rbx
046a   85e1b5:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
0471   85e1bc:	48 89 df             	mov    %rbx,%rdi
0474   85e1bf:	be 08 00 00 00       	mov    $0x8,%esi
0479   85e1c4:	e8 00 00 00 00       	call   85e1c9 <shrink_lruvec+0x47e>	85e1c5: R_X86_64_PLT32	__kasan_check_read-0x4
047e   85e1c9:	48 89 d8             	mov    %rbx,%rax
0481   85e1cc:	48 c1 e8 03          	shr    $0x3,%rax
0485   85e1d0:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
048f   85e1da:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0493   85e1de:	74 08                	je     85e1e8 <shrink_lruvec+0x49d>
0495   85e1e0:	48 89 df             	mov    %rbx,%rdi
0498   85e1e3:	e8 00 00 00 00       	call   85e1e8 <shrink_lruvec+0x49d>	85e1e4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
049d   85e1e8:	48 8b 1b             	mov    (%rbx),%rbx
04a0   85e1eb:	31 ff                	xor    %edi,%edi
04a2   85e1ed:	48 89 de             	mov    %rbx,%rsi
04a5   85e1f0:	e8 00 00 00 00       	call   85e1f5 <shrink_lruvec+0x4aa>	85e1f1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04aa   85e1f5:	48 85 db             	test   %rbx,%rbx
04ad   85e1f8:	0f 84 92 00 00 00    	je     85e290 <shrink_lruvec+0x545>
04b3   85e1fe:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
04bd   85e208:	41 8a 04 04          	mov    (%r12,%rax,1),%al
04c1   85e20c:	84 c0                	test   %al,%al
04c3   85e20e:	0f 85 1c 01 00 00    	jne    85e330 <shrink_lruvec+0x5e5>
04c9   85e214:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85e21a <shrink_lruvec+0x4cf>	85e216: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
04cf   85e21a:	bf 01 00 00 00       	mov    $0x1,%edi
04d4   85e21f:	89 de                	mov    %ebx,%esi
04d6   85e221:	e8 00 00 00 00       	call   85e226 <shrink_lruvec+0x4db>	85e222: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
04db   85e226:	85 db                	test   %ebx,%ebx
04dd   85e228:	7e 77                	jle    85e2a1 <shrink_lruvec+0x556>
04df   85e22a:	bf 04 00 00 00       	mov    $0x4,%edi
04e4   85e22f:	4c 89 fe             	mov    %r15,%rsi
04e7   85e232:	e8 00 00 00 00       	call   85e237 <shrink_lruvec+0x4ec>	85e233: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04ec   85e237:	49 83 ff 03          	cmp    $0x3,%r15
04f0   85e23b:	0f 87 2e 01 00 00    	ja     85e36f <shrink_lruvec+0x624>
04f6   85e241:	e8 00 00 00 00       	call   85e246 <shrink_lruvec+0x4fb>	85e242: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04fb   85e246:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0500   85e24b:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0505   85e250:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
050a   85e255:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
050f   85e25a:	48 8d 3c 08          	lea    (%rax,%rcx,1),%rdi
0513   85e25e:	48 81 c7 08 fd ff ff 	add    $0xfffffffffffffd08,%rdi
051a   85e265:	48 89 f8             	mov    %rdi,%rax
051d   85e268:	48 c1 e8 03          	shr    $0x3,%rax
0521   85e26c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
052b   85e276:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
052f   85e27a:	74 05                	je     85e281 <shrink_lruvec+0x536>
0531   85e27c:	e8 00 00 00 00       	call   85e281 <shrink_lruvec+0x536>	85e27d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0536   85e281:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
053b   85e286:	48 8b 84 03 08 fd ff ff 	mov    -0x2f8(%rbx,%rax,1),%rax
0543   85e28e:	eb 73                	jmp    85e303 <shrink_lruvec+0x5b8>
0545   85e290:	e8 00 00 00 00       	call   85e295 <shrink_lruvec+0x54a>	85e291: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
054a   85e295:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
054f   85e29a:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0554   85e29f:	eb 67                	jmp    85e308 <shrink_lruvec+0x5bd>
0556   85e2a1:	e8 00 00 00 00       	call   85e2a6 <shrink_lruvec+0x55b>	85e2a2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
055b   85e2a6:	4c 8b 64 24 48       	mov    0x48(%rsp),%r12
0560   85e2ab:	4b 8d 1c 2c          	lea    (%r12,%r13,1),%rbx
0564   85e2af:	4c 01 f3             	add    %r14,%rbx
0567   85e2b2:	48 89 df             	mov    %rbx,%rdi
056a   85e2b5:	be 08 00 00 00       	mov    $0x8,%esi
056f   85e2ba:	e8 00 00 00 00       	call   85e2bf <shrink_lruvec+0x574>	85e2bb: R_X86_64_PLT32	__kasan_check_read-0x4
0574   85e2bf:	4b 8d 3c 34          	lea    (%r12,%r14,1),%rdi
0578   85e2c3:	4c 01 ef             	add    %r13,%rdi
057b   85e2c6:	48 89 f8             	mov    %rdi,%rax
057e   85e2c9:	48 c1 e8 03          	shr    $0x3,%rax
0582   85e2cd:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
058c   85e2d7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0590   85e2db:	74 05                	je     85e2e2 <shrink_lruvec+0x597>
0592   85e2dd:	e8 00 00 00 00       	call   85e2e2 <shrink_lruvec+0x597>	85e2de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0597   85e2e2:	48 8b 03             	mov    (%rbx),%rax
059a   85e2e5:	48 85 c0             	test   %rax,%rax
059d   85e2e8:	b9 00 00 00 00       	mov    $0x0,%ecx
05a2   85e2ed:	48 0f 4e c1          	cmovle %rcx,%rax
05a6   85e2f1:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
05ab   85e2f6:	4c 8b a4 24 88 00 00 00 	mov    0x88(%rsp),%r12
05b3   85e2fe:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
05b8   85e303:	48 01 44 24 30       	add    %rax,0x30(%rsp)
05bd   85e308:	4c 39 b4 24 30 01 00 00 	cmp    %r14,0x130(%rsp)
05c5   85e310:	74 76                	je     85e388 <shrink_lruvec+0x63d>
05c7   85e312:	e8 00 00 00 00       	call   85e317 <shrink_lruvec+0x5cc>	85e313: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05cc   85e317:	49 81 c6 c0 06 00 00 	add    $0x6c0,%r14
05d3   85e31e:	48 83 44 24 38 28    	addq   $0x28,0x38(%rsp)
05d9   85e324:	48 83 c3 28          	add    $0x28,%rbx
05dd   85e328:	49 ff c7             	inc    %r15
05e0   85e32b:	e9 38 fe ff ff       	jmp    85e168 <shrink_lruvec+0x41d>
05e5   85e330:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85e333: R_X86_64_32S	memory_cgrp_subsys_enabled_key
05ec   85e337:	80 e1 07             	and    $0x7,%cl
05ef   85e33a:	80 c1 03             	add    $0x3,%cl
05f2   85e33d:	38 c1                	cmp    %al,%cl
05f4   85e33f:	0f 8c cf fe ff ff    	jl     85e214 <shrink_lruvec+0x4c9>
05fa   85e345:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85e348: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0601   85e34c:	e8 00 00 00 00       	call   85e351 <shrink_lruvec+0x606>	85e34d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0606   85e351:	e9 be fe ff ff       	jmp    85e214 <shrink_lruvec+0x4c9>
060b   85e356:	e8 00 00 00 00       	call   85e35b <shrink_lruvec+0x610>	85e357: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0610   85e35b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85e35e: R_X86_64_32S	.data+0x68c160
0617   85e362:	4c 89 fe             	mov    %r15,%rsi
061a   85e365:	e8 00 00 00 00       	call   85e36a <shrink_lruvec+0x61f>	85e366: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
061f   85e36a:	e9 42 fe ff ff       	jmp    85e1b1 <shrink_lruvec+0x466>
0624   85e36f:	e8 00 00 00 00       	call   85e374 <shrink_lruvec+0x629>	85e370: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0629   85e374:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85e377: R_X86_64_32S	.data+0x68c180
0630   85e37b:	4c 89 fe             	mov    %r15,%rsi
0633   85e37e:	e8 00 00 00 00       	call   85e383 <shrink_lruvec+0x638>	85e37f: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0638   85e383:	e9 be fe ff ff       	jmp    85e246 <shrink_lruvec+0x4fb>
063d   85e388:	e8 00 00 00 00       	call   85e38d <shrink_lruvec+0x642>	85e389: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0642   85e38d:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
064c   85e397:	eb 11                	jmp    85e3aa <shrink_lruvec+0x65f>
064e   85e399:	e8 00 00 00 00       	call   85e39e <shrink_lruvec+0x653>	85e39a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0653   85e39e:	31 c0                	xor    %eax,%eax
0655   85e3a0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
065a   85e3a5:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
065f   85e3aa:	4c 89 e8             	mov    %r13,%rax
0662   85e3ad:	48 c1 e8 03          	shr    $0x3,%rax
0666   85e3b1:	48 89 84 24 88 01 00 00 	mov    %rax,0x188(%rsp)
066e   85e3b9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0673   85e3be:	74 08                	je     85e3c8 <shrink_lruvec+0x67d>
0675   85e3c0:	4c 89 ef             	mov    %r13,%rdi
0678   85e3c3:	e8 00 00 00 00       	call   85e3c8 <shrink_lruvec+0x67d>	85e3c4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
067d   85e3c8:	4d 8b 75 00          	mov    0x0(%r13),%r14
0681   85e3cc:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
0689   85e3d4:	42 8a 04 20          	mov    (%rax,%r12,1),%al
068d   85e3d8:	84 c0                	test   %al,%al
068f   85e3da:	0f 85 2f 04 00 00    	jne    85e80f <shrink_lruvec+0xac4>
0695   85e3e0:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85e3e6 <shrink_lruvec+0x69b>	85e3e2: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
069b   85e3e6:	bf 01 00 00 00       	mov    $0x1,%edi
06a0   85e3eb:	89 de                	mov    %ebx,%esi
06a2   85e3ed:	e8 00 00 00 00       	call   85e3f2 <shrink_lruvec+0x6a7>	85e3ee: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06a7   85e3f2:	4c 3b 74 24 78       	cmp    0x78(%rsp),%r14
06ac   85e3f7:	0f 84 88 00 00 00    	je     85e485 <shrink_lruvec+0x73a>
06b2   85e3fd:	85 db                	test   %ebx,%ebx
06b4   85e3ff:	0f 8e 80 00 00 00    	jle    85e485 <shrink_lruvec+0x73a>
06ba   85e405:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
06c2   85e40d:	48 89 c8             	mov    %rcx,%rax
06c5   85e410:	48 c1 e8 03          	shr    $0x3,%rax
06c9   85e414:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
06ce   85e419:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
06d3   85e41e:	74 15                	je     85e435 <shrink_lruvec+0x6ea>
06d5   85e420:	48 8b bc 24 80 00 00 00 	mov    0x80(%rsp),%rdi
06dd   85e428:	e8 00 00 00 00       	call   85e42d <shrink_lruvec+0x6e2>	85e429: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06e2   85e42d:	48 8b 8c 24 80 00 00 00 	mov    0x80(%rsp),%rcx
06ea   85e435:	4c 8b 39             	mov    (%rcx),%r15
06ed   85e438:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
06f2   85e43d:	48 89 c8             	mov    %rcx,%rax
06f5   85e440:	48 c1 e8 03          	shr    $0x3,%rax
06f9   85e444:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
06fe   85e449:	74 0f                	je     85e45a <shrink_lruvec+0x70f>
0700   85e44b:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
0705   85e450:	e8 00 00 00 00       	call   85e455 <shrink_lruvec+0x70a>	85e451: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
070a   85e455:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
070f   85e45a:	48 8b 19             	mov    (%rcx),%rbx
0712   85e45d:	31 ff                	xor    %edi,%edi
0714   85e45f:	4c 89 fe             	mov    %r15,%rsi
0717   85e462:	e8 00 00 00 00       	call   85e467 <shrink_lruvec+0x71c>	85e463: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
071c   85e467:	31 ff                	xor    %edi,%edi
071e   85e469:	48 89 de             	mov    %rbx,%rsi
0721   85e46c:	e8 00 00 00 00       	call   85e471 <shrink_lruvec+0x726>	85e46d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0726   85e471:	4c 89 f8             	mov    %r15,%rax
0729   85e474:	48 09 d8             	or     %rbx,%rax
072c   85e477:	75 25                	jne    85e49e <shrink_lruvec+0x753>
072e   85e479:	e8 00 00 00 00       	call   85e47e <shrink_lruvec+0x733>	85e47a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0733   85e47e:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
0738   85e483:	eb 0f                	jmp    85e494 <shrink_lruvec+0x749>
073a   85e485:	e8 00 00 00 00       	call   85e48a <shrink_lruvec+0x73f>	85e486: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
073f   85e48a:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
0744   85e48f:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
0749   85e494:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
074e   85e499:	e9 bc 00 00 00       	jmp    85e55a <shrink_lruvec+0x80f>
0753   85e49e:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
0758   85e4a3:	e8 00 00 00 00       	call   85e4a8 <shrink_lruvec+0x75d>	85e4a4: R_X86_64_PLT32	mem_cgroup_size-0x4
075d   85e4a8:	49 89 c5             	mov    %rax,%r13
0760   85e4ab:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
0768   85e4b3:	42 8a 04 20          	mov    (%rax,%r12,1),%al
076c   85e4b7:	84 c0                	test   %al,%al
076e   85e4b9:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0773   85e4be:	0f 85 b8 03 00 00    	jne    85e87c <shrink_lruvec+0xb31>
0779   85e4c4:	44 0f b7 32          	movzwl (%rdx),%r14d
077d   85e4c8:	44 89 f6             	mov    %r14d,%esi
0780   85e4cb:	81 e6 80 00 00 00    	and    $0x80,%esi
0786   85e4d1:	31 ff                	xor    %edi,%edi
0788   85e4d3:	e8 00 00 00 00       	call   85e4d8 <shrink_lruvec+0x78d>	85e4d4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
078d   85e4d8:	48 89 df             	mov    %rbx,%rdi
0790   85e4db:	4c 89 fe             	mov    %r15,%rsi
0793   85e4de:	e8 00 00 00 00       	call   85e4e3 <shrink_lruvec+0x798>	85e4df: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0798   85e4e3:	44 89 f0             	mov    %r14d,%eax
079b   85e4e6:	25 80 00 00 00       	and    $0x80,%eax
07a0   85e4eb:	75 30                	jne    85e51d <shrink_lruvec+0x7d2>
07a2   85e4ed:	4c 39 fb             	cmp    %r15,%rbx
07a5   85e4f0:	76 2b                	jbe    85e51d <shrink_lruvec+0x7d2>
07a7   85e4f2:	e8 00 00 00 00       	call   85e4f7 <shrink_lruvec+0x7ac>	85e4f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07ac   85e4f7:	41 81 ce 00 01 00 00 	or     $0x100,%r14d
07b3   85e4fe:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
07bb   85e506:	42 8a 04 20          	mov    (%rax,%r12,1),%al
07bf   85e50a:	84 c0                	test   %al,%al
07c1   85e50c:	0f 85 fb 03 00 00    	jne    85e90d <shrink_lruvec+0xbc2>
07c7   85e512:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
07cc   85e517:	66 44 89 30          	mov    %r14w,(%rax)
07d0   85e51b:	eb 08                	jmp    85e525 <shrink_lruvec+0x7da>
07d2   85e51d:	e8 00 00 00 00       	call   85e522 <shrink_lruvec+0x7d7>	85e51e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07d7   85e522:	4c 89 fb             	mov    %r15,%rbx
07da   85e525:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
07df   85e52a:	49 39 dd             	cmp    %rbx,%r13
07e2   85e52d:	4c 0f 46 eb          	cmovbe %rbx,%r13
07e6   85e531:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
07eb   85e536:	49 0f af df          	imul   %r15,%rbx
07ef   85e53a:	49 ff c5             	inc    %r13
07f2   85e53d:	48 89 d8             	mov    %rbx,%rax
07f5   85e540:	31 d2                	xor    %edx,%edx
07f7   85e542:	49 f7 f5             	div    %r13
07fa   85e545:	49 29 c7             	sub    %rax,%r15
07fd   85e548:	49 83 ff 21          	cmp    $0x21,%r15
0801   85e54c:	b8 20 00 00 00       	mov    $0x20,%eax
0806   85e551:	4c 0f 42 f8          	cmovb  %rax,%r15
080a   85e555:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
080f   85e55a:	48 89 f0             	mov    %rsi,%rax
0812   85e55d:	48 c1 e8 03          	shr    $0x3,%rax
0816   85e561:	48 89 84 24 80 01 00 00 	mov    %rax,0x180(%rsp)
081e   85e569:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0822   85e56d:	84 c0                	test   %al,%al
0824   85e56f:	0f 85 c0 02 00 00    	jne    85e835 <shrink_lruvec+0xaea>
082a   85e575:	48 0f be 06          	movsbq (%rsi),%rax
082e   85e579:	89 c3                	mov    %eax,%ebx
0830   85e57b:	bf 40 00 00 00       	mov    $0x40,%edi
0835   85e580:	48 89 de             	mov    %rbx,%rsi
0838   85e583:	e8 00 00 00 00       	call   85e588 <shrink_lruvec+0x83d>	85e584: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
083d   85e588:	48 83 fb 3f          	cmp    $0x3f,%rbx
0841   85e58c:	0f 87 9c 03 00 00    	ja     85e92e <shrink_lruvec+0xbe3>
0847   85e592:	e8 00 00 00 00       	call   85e597 <shrink_lruvec+0x84c>	85e593: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
084c   85e597:	89 d9                	mov    %ebx,%ecx
084e   85e599:	49 d3 ef             	shr    %cl,%r15
0851   85e59c:	31 ff                	xor    %edi,%edi
0853   85e59e:	4c 89 fe             	mov    %r15,%rsi
0856   85e5a1:	e8 00 00 00 00       	call   85e5a6 <shrink_lruvec+0x85b>	85e5a2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
085b   85e5a6:	4d 85 ff             	test   %r15,%r15
085e   85e5a9:	74 11                	je     85e5bc <shrink_lruvec+0x871>
0860   85e5ab:	e8 00 00 00 00       	call   85e5b0 <shrink_lruvec+0x865>	85e5ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0865   85e5b0:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
086a   85e5b5:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
086f   85e5ba:	eb 7c                	jmp    85e638 <shrink_lruvec+0x8ed>
0871   85e5bc:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
0879   85e5c4:	42 8a 04 20          	mov    (%rax,%r12,1),%al
087d   85e5c8:	84 c0                	test   %al,%al
087f   85e5ca:	0f 85 86 02 00 00    	jne    85e856 <shrink_lruvec+0xb0b>
0885   85e5d0:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85e5d6 <shrink_lruvec+0x88b>	85e5d2: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
088b   85e5d6:	bf 01 00 00 00       	mov    $0x1,%edi
0890   85e5db:	89 de                	mov    %ebx,%esi
0892   85e5dd:	e8 00 00 00 00       	call   85e5e2 <shrink_lruvec+0x897>	85e5de: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0897   85e5e2:	85 db                	test   %ebx,%ebx
0899   85e5e4:	0f 8e 55 01 00 00    	jle    85e73f <shrink_lruvec+0x9f4>
089f   85e5ea:	e8 00 00 00 00       	call   85e5ef <shrink_lruvec+0x8a4>	85e5eb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08a4   85e5ef:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
08a9   85e5f4:	48 89 d0             	mov    %rdx,%rax
08ac   85e5f7:	48 c1 e8 03          	shr    $0x3,%rax
08b0   85e5fb:	42 8a 04 20          	mov    (%rax,%r12,1),%al
08b4   85e5ff:	84 c0                	test   %al,%al
08b6   85e601:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
08bb   85e606:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
08c0   85e60b:	0f 85 b4 02 00 00    	jne    85e8c5 <shrink_lruvec+0xb7a>
08c6   85e611:	8b 32                	mov    (%rdx),%esi
08c8   85e613:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
08cd   85e618:	49 83 ff 20          	cmp    $0x20,%r15
08d1   85e61c:	b8 20 00 00 00       	mov    $0x20,%eax
08d6   85e621:	4c 0f 43 f8          	cmovae %rax,%r15
08da   85e625:	83 e6 02             	and    $0x2,%esi
08dd   85e628:	b8 00 00 00 00       	mov    $0x0,%eax
08e2   85e62d:	4c 0f 45 f8          	cmovne %rax,%r15
08e6   85e631:	31 ff                	xor    %edi,%edi
08e8   85e633:	e8 00 00 00 00       	call   85e638 <shrink_lruvec+0x8ed>	85e634: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08ed   85e638:	48 8b bc 24 50 01 00 00 	mov    0x150(%rsp),%rdi
08f5   85e640:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	85e643: R_X86_64_32S	.data+0x68c350
08fc   85e647:	e8 00 00 00 00       	call   85e64c <shrink_lruvec+0x901>	85e648: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
0901   85e64c:	ff a4 24 20 01 00 00 	jmp    *0x120(%rsp)
0908   85e653:	e8 00 00 00 00       	call   85e658 <shrink_lruvec+0x90d>	85e654: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
090d   85e658:	e9 4a 01 00 00       	jmp    85e7a7 <shrink_lruvec+0xa5c>
0912   85e65d:	4d 89 f5             	mov    %r14,%r13
0915   85e660:	e8 00 00 00 00       	call   85e665 <shrink_lruvec+0x91a>	85e661: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
091a   85e665:	eb 08                	jmp    85e66f <shrink_lruvec+0x924>
091c   85e667:	4d 89 f5             	mov    %r14,%r13
091f   85e66a:	e8 00 00 00 00       	call   85e66f <shrink_lruvec+0x924>	85e66b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0924   85e66f:	45 31 f6             	xor    %r14d,%r14d
0927   85e672:	8a 84 24 28 01 00 00 	mov    0x128(%rsp),%al
092e   85e679:	41 88 c6             	mov    %al,%r14b
0931   85e67c:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
0936   85e681:	89 df                	mov    %ebx,%edi
0938   85e683:	44 89 f6             	mov    %r14d,%esi
093b   85e686:	e8 00 00 00 00       	call   85e68b <shrink_lruvec+0x940>	85e687: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0940   85e68b:	44 39 f3             	cmp    %r14d,%ebx
0943   85e68e:	b8 00 00 00 00       	mov    $0x0,%eax
0948   85e693:	4c 0f 45 f8          	cmovne %rax,%r15
094c   85e697:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
0951   85e69c:	4d 89 ee             	mov    %r13,%r14
0954   85e69f:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0959   85e6a4:	e9 fe 00 00 00       	jmp    85e7a7 <shrink_lruvec+0xa5c>
095e   85e6a9:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
0966   85e6b1:	42 8a 04 20          	mov    (%rax,%r12,1),%al
096a   85e6b5:	84 c0                	test   %al,%al
096c   85e6b7:	0f 85 e2 01 00 00    	jne    85e89f <shrink_lruvec+0xb54>
0972   85e6bd:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85e6c3 <shrink_lruvec+0x978>	85e6bf: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0978   85e6c3:	bf 01 00 00 00       	mov    $0x1,%edi
097d   85e6c8:	89 de                	mov    %ebx,%esi
097f   85e6ca:	e8 00 00 00 00       	call   85e6cf <shrink_lruvec+0x984>	85e6cb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0984   85e6cf:	85 db                	test   %ebx,%ebx
0986   85e6d1:	7e 79                	jle    85e74c <shrink_lruvec+0xa01>
0988   85e6d3:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
098d   85e6d8:	48 89 d0             	mov    %rdx,%rax
0990   85e6db:	48 c1 e8 03          	shr    $0x3,%rax
0994   85e6df:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0998   85e6e3:	84 c0                	test   %al,%al
099a   85e6e5:	0f 85 fe 01 00 00    	jne    85e8e9 <shrink_lruvec+0xb9e>
09a0   85e6eb:	8b 1a                	mov    (%rdx),%ebx
09a2   85e6ed:	89 de                	mov    %ebx,%esi
09a4   85e6ef:	83 e6 02             	and    $0x2,%esi
09a7   85e6f2:	31 ff                	xor    %edi,%edi
09a9   85e6f4:	e8 00 00 00 00       	call   85e6f9 <shrink_lruvec+0x9ae>	85e6f5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09ae   85e6f9:	83 e3 02             	and    $0x2,%ebx
09b1   85e6fc:	75 55                	jne    85e753 <shrink_lruvec+0xa08>
09b3   85e6fe:	31 db                	xor    %ebx,%ebx
09b5   85e700:	83 bc 24 a0 00 00 00 02 	cmpl   $0x2,0xa0(%rsp)
09bd   85e708:	0f 94 c3             	sete   %bl
09c0   85e70b:	e8 00 00 00 00       	call   85e710 <shrink_lruvec+0x9c5>	85e70c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09c5   85e710:	48 8d 1c dc          	lea    (%rsp,%rbx,8),%rbx
09c9   85e714:	48 81 c3 b0 00 00 00 	add    $0xb0,%rbx
09d0   85e71b:	48 89 d8             	mov    %rbx,%rax
09d3   85e71e:	48 c1 e8 03          	shr    $0x3,%rax
09d7   85e722:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
09dc   85e727:	74 08                	je     85e731 <shrink_lruvec+0x9e6>
09de   85e729:	48 89 df             	mov    %rbx,%rdi
09e1   85e72c:	e8 00 00 00 00       	call   85e731 <shrink_lruvec+0x9e6>	85e72d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09e6   85e731:	4c 0f af 3b          	imul   (%rbx),%r15
09ea   85e735:	4c 03 bc 24 a8 00 00 00 	add    0xa8(%rsp),%r15
09f2   85e73d:	eb 4e                	jmp    85e78d <shrink_lruvec+0xa42>
09f4   85e73f:	e8 00 00 00 00       	call   85e744 <shrink_lruvec+0x9f9>	85e740: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09f9   85e744:	45 31 ff             	xor    %r15d,%r15d
09fc   85e747:	e9 64 fe ff ff       	jmp    85e5b0 <shrink_lruvec+0x865>
0a01   85e74c:	e8 00 00 00 00       	call   85e751 <shrink_lruvec+0xa06>	85e74d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a06   85e751:	eb 05                	jmp    85e758 <shrink_lruvec+0xa0d>
0a08   85e753:	e8 00 00 00 00       	call   85e758 <shrink_lruvec+0xa0d>	85e754: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a0d   85e758:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
0a15   85e760:	31 c0                	xor    %eax,%eax
0a17   85e762:	83 f9 02             	cmp    $0x2,%ecx
0a1a   85e765:	0f 94 c0             	sete   %al
0a1d   85e768:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
0a21   85e76c:	48 81 c3 b0 00 00 00 	add    $0xb0,%rbx
0a28   85e773:	48 89 d8             	mov    %rbx,%rax
0a2b   85e776:	48 c1 e8 03          	shr    $0x3,%rax
0a2f   85e77a:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0a34   85e77f:	74 08                	je     85e789 <shrink_lruvec+0xa3e>
0a36   85e781:	48 89 df             	mov    %rbx,%rdi
0a39   85e784:	e8 00 00 00 00       	call   85e789 <shrink_lruvec+0xa3e>	85e785: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a3e   85e789:	4c 0f af 3b          	imul   (%rbx),%r15
0a42   85e78d:	4c 89 f8             	mov    %r15,%rax
0a45   85e790:	31 d2                	xor    %edx,%edx
0a47   85e792:	48 f7 b4 24 10 01 00 00 	divq   0x110(%rsp)
0a4f   85e79a:	49 89 c7             	mov    %rax,%r15
0a52   85e79d:	4c 8b 6c 24 28       	mov    0x28(%rsp),%r13
0a57   85e7a2:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
0a5c   85e7a7:	48 8d 3c dc          	lea    (%rsp,%rbx,8),%rdi
0a60   85e7ab:	48 81 c7 e0 00 00 00 	add    $0xe0,%rdi
0a67   85e7b2:	48 89 f8             	mov    %rdi,%rax
0a6a   85e7b5:	48 c1 e8 03          	shr    $0x3,%rax
0a6e   85e7b9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0a73   85e7be:	74 05                	je     85e7c5 <shrink_lruvec+0xa7a>
0a75   85e7c0:	e8 00 00 00 00       	call   85e7c5 <shrink_lruvec+0xa7a>	85e7c1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0a7a   85e7c5:	4c 89 bc dc e0 00 00 00 	mov    %r15,0xe0(%rsp,%rbx,8)
0a82   85e7cd:	48 ff c3             	inc    %rbx
0a85   85e7d0:	48 83 fb 04          	cmp    $0x4,%rbx
0a89   85e7d4:	0f 84 70 01 00 00    	je     85e94a <shrink_lruvec+0xbff>
0a8f   85e7da:	e8 00 00 00 00       	call   85e7df <shrink_lruvec+0xa94>	85e7db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a94   85e7df:	48 83 44 24 48 08    	addq   $0x8,0x48(%rsp)
0a9a   85e7e5:	e9 f4 f8 ff ff       	jmp    85e0de <shrink_lruvec+0x393>
0a9f   85e7ea:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
0aa7   85e7f2:	80 e1 07             	and    $0x7,%cl
0aaa   85e7f5:	38 c1                	cmp    %al,%cl
0aac   85e7f7:	0f 8c 1e f9 ff ff    	jl     85e11b <shrink_lruvec+0x3d0>
0ab2   85e7fd:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
0aba   85e805:	e8 00 00 00 00       	call   85e80a <shrink_lruvec+0xabf>	85e806: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0abf   85e80a:	e9 0c f9 ff ff       	jmp    85e11b <shrink_lruvec+0x3d0>
0ac4   85e80f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85e812: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0acb   85e816:	80 e1 07             	and    $0x7,%cl
0ace   85e819:	80 c1 03             	add    $0x3,%cl
0ad1   85e81c:	38 c1                	cmp    %al,%cl
0ad3   85e81e:	0f 8c bc fb ff ff    	jl     85e3e0 <shrink_lruvec+0x695>
0ad9   85e824:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85e827: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0ae0   85e82b:	e8 00 00 00 00       	call   85e830 <shrink_lruvec+0xae5>	85e82c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0ae5   85e830:	e9 ab fb ff ff       	jmp    85e3e0 <shrink_lruvec+0x695>
0aea   85e835:	89 f1                	mov    %esi,%ecx
0aec   85e837:	80 e1 07             	and    $0x7,%cl
0aef   85e83a:	38 c1                	cmp    %al,%cl
0af1   85e83c:	0f 8c 33 fd ff ff    	jl     85e575 <shrink_lruvec+0x82a>
0af7   85e842:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0afc   85e847:	e8 00 00 00 00       	call   85e84c <shrink_lruvec+0xb01>	85e848: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0b01   85e84c:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
0b06   85e851:	e9 1f fd ff ff       	jmp    85e575 <shrink_lruvec+0x82a>
0b0b   85e856:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85e859: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0b12   85e85d:	80 e1 07             	and    $0x7,%cl
0b15   85e860:	80 c1 03             	add    $0x3,%cl
0b18   85e863:	38 c1                	cmp    %al,%cl
0b1a   85e865:	0f 8c 65 fd ff ff    	jl     85e5d0 <shrink_lruvec+0x885>
0b20   85e86b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85e86e: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0b27   85e872:	e8 00 00 00 00       	call   85e877 <shrink_lruvec+0xb2c>	85e873: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b2c   85e877:	e9 54 fd ff ff       	jmp    85e5d0 <shrink_lruvec+0x885>
0b31   85e87c:	89 d1                	mov    %edx,%ecx
0b33   85e87e:	80 e1 07             	and    $0x7,%cl
0b36   85e881:	fe c1                	inc    %cl
0b38   85e883:	38 c1                	cmp    %al,%cl
0b3a   85e885:	0f 8c 39 fc ff ff    	jl     85e4c4 <shrink_lruvec+0x779>
0b40   85e88b:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0b45   85e890:	e8 00 00 00 00       	call   85e895 <shrink_lruvec+0xb4a>	85e891: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0b4a   85e895:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0b4f   85e89a:	e9 25 fc ff ff       	jmp    85e4c4 <shrink_lruvec+0x779>
0b54   85e89f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85e8a2: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0b5b   85e8a6:	80 e1 07             	and    $0x7,%cl
0b5e   85e8a9:	80 c1 03             	add    $0x3,%cl
0b61   85e8ac:	38 c1                	cmp    %al,%cl
0b63   85e8ae:	0f 8c 09 fe ff ff    	jl     85e6bd <shrink_lruvec+0x972>
0b69   85e8b4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85e8b7: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0b70   85e8bb:	e8 00 00 00 00       	call   85e8c0 <shrink_lruvec+0xb75>	85e8bc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b75   85e8c0:	e9 f8 fd ff ff       	jmp    85e6bd <shrink_lruvec+0x972>
0b7a   85e8c5:	89 d1                	mov    %edx,%ecx
0b7c   85e8c7:	80 e1 07             	and    $0x7,%cl
0b7f   85e8ca:	80 c1 03             	add    $0x3,%cl
0b82   85e8cd:	38 c1                	cmp    %al,%cl
0b84   85e8cf:	0f 8c 3c fd ff ff    	jl     85e611 <shrink_lruvec+0x8c6>
0b8a   85e8d5:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
0b8f   85e8da:	e8 00 00 00 00       	call   85e8df <shrink_lruvec+0xb94>	85e8db: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0b94   85e8df:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
0b99   85e8e4:	e9 28 fd ff ff       	jmp    85e611 <shrink_lruvec+0x8c6>
0b9e   85e8e9:	89 d1                	mov    %edx,%ecx
0ba0   85e8eb:	80 e1 07             	and    $0x7,%cl
0ba3   85e8ee:	80 c1 03             	add    $0x3,%cl
0ba6   85e8f1:	38 c1                	cmp    %al,%cl
0ba8   85e8f3:	0f 8c f2 fd ff ff    	jl     85e6eb <shrink_lruvec+0x9a0>
0bae   85e8f9:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
0bb3   85e8fe:	e8 00 00 00 00       	call   85e903 <shrink_lruvec+0xbb8>	85e8ff: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0bb8   85e903:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
0bbd   85e908:	e9 de fd ff ff       	jmp    85e6eb <shrink_lruvec+0x9a0>
0bc2   85e90d:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
0bc7   85e912:	80 e1 07             	and    $0x7,%cl
0bca   85e915:	fe c1                	inc    %cl
0bcc   85e917:	38 c1                	cmp    %al,%cl
0bce   85e919:	0f 8c f3 fb ff ff    	jl     85e512 <shrink_lruvec+0x7c7>
0bd4   85e91f:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0bd9   85e924:	e8 00 00 00 00       	call   85e929 <shrink_lruvec+0xbde>	85e925: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0bde   85e929:	e9 e4 fb ff ff       	jmp    85e512 <shrink_lruvec+0x7c7>
0be3   85e92e:	e8 00 00 00 00       	call   85e933 <shrink_lruvec+0xbe8>	85e92f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0be8   85e933:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85e936: R_X86_64_32S	.data+0x68c140
0bef   85e93a:	4c 89 fe             	mov    %r15,%rsi
0bf2   85e93d:	48 89 da             	mov    %rbx,%rdx
0bf5   85e940:	e8 00 00 00 00       	call   85e945 <shrink_lruvec+0xbfa>	85e941: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0bfa   85e945:	e9 4d fc ff ff       	jmp    85e597 <shrink_lruvec+0x84c>
0bff   85e94a:	48 8d bc 24 90 01 00 00 	lea    0x190(%rsp),%rdi
0c07   85e952:	48 8d b4 24 e0 00 00 00 	lea    0xe0(%rsp),%rsi
0c0f   85e95a:	ba 28 00 00 00       	mov    $0x28,%edx
0c14   85e95f:	e8 00 00 00 00       	call   85e964 <shrink_lruvec+0xc19>	85e960: R_X86_64_PLT32	memcpy-0x4
0c19   85e964:	48 8b 84 24 88 01 00 00 	mov    0x188(%rsp),%rax
0c21   85e96c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0c26   85e971:	74 08                	je     85e97b <shrink_lruvec+0xc30>
0c28   85e973:	4c 89 ef             	mov    %r13,%rdi
0c2b   85e976:	e8 00 00 00 00       	call   85e97b <shrink_lruvec+0xc30>	85e977: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c30   85e97b:	49 83 7d 00 00       	cmpq   $0x0,0x0(%r13)
0c35   85e980:	74 0c                	je     85e98e <shrink_lruvec+0xc43>
0c37   85e982:	e8 00 00 00 00       	call   85e987 <shrink_lruvec+0xc3c>	85e983: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c3c   85e987:	31 f6                	xor    %esi,%esi
0c3e   85e989:	e9 81 00 00 00       	jmp    85ea0f <shrink_lruvec+0xcc4>
0c43   85e98e:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # 85e996 <shrink_lruvec+0xc4b>	85e992: R_X86_64_PC32	current_task-0x4
0c4b   85e996:	48 83 c3 2c          	add    $0x2c,%rbx
0c4f   85e99a:	48 89 d8             	mov    %rbx,%rax
0c52   85e99d:	48 c1 e8 03          	shr    $0x3,%rax
0c56   85e9a1:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0c5a   85e9a5:	84 c0                	test   %al,%al
0c5c   85e9a7:	0f 85 41 19 00 00    	jne    8602ee <shrink_lruvec+0x25a3>
0c62   85e9ad:	44 8b 33             	mov    (%rbx),%r14d
0c65   85e9b0:	bb 00 00 02 00       	mov    $0x20000,%ebx
0c6a   85e9b5:	be 00 00 02 00       	mov    $0x20000,%esi
0c6f   85e9ba:	44 21 f6             	and    %r14d,%esi
0c72   85e9bd:	31 ff                	xor    %edi,%edi
0c74   85e9bf:	e8 00 00 00 00       	call   85e9c4 <shrink_lruvec+0xc79>	85e9c0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0c79   85e9c4:	44 21 f3             	and    %r14d,%ebx
0c7c   85e9c7:	75 3a                	jne    85ea03 <shrink_lruvec+0xcb8>
0c7e   85e9c9:	e8 00 00 00 00       	call   85e9ce <shrink_lruvec+0xc83>	85e9ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c83   85e9ce:	48 8b 84 24 80 01 00 00 	mov    0x180(%rsp),%rax
0c8b   85e9d6:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0c8f   85e9da:	84 c0                	test   %al,%al
0c91   85e9dc:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
0c96   85e9e1:	0f 85 24 19 00 00    	jne    86030b <shrink_lruvec+0x25c0>
0c9c   85e9e7:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0ca1   85e9ec:	0f b6 30             	movzbl (%rax),%esi
0ca4   85e9ef:	83 fe 0c             	cmp    $0xc,%esi
0ca7   85e9f2:	0f 94 c3             	sete   %bl
0caa   85e9f5:	bf 0c 00 00 00       	mov    $0xc,%edi
0caf   85e9fa:	e8 00 00 00 00       	call   85e9ff <shrink_lruvec+0xcb4>	85e9fb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0cb4   85e9ff:	89 de                	mov    %ebx,%esi
0cb6   85ea01:	eb 0c                	jmp    85ea0f <shrink_lruvec+0xcc4>
0cb8   85ea03:	e8 00 00 00 00       	call   85ea08 <shrink_lruvec+0xcbd>	85ea04: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0cbd   85ea08:	31 f6                	xor    %esi,%esi
0cbf   85ea0a:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
0cc4   85ea0f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0cc9   85ea14:	48 8d 48 30          	lea    0x30(%rax),%rcx
0ccd   85ea18:	48 89 4c 24 78       	mov    %rcx,0x78(%rsp)
0cd2   85ea1d:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
0cd7   85ea22:	48 8d 51 50          	lea    0x50(%rcx),%rdx
0cdb   85ea26:	48 89 94 24 90 00 00 00 	mov    %rdx,0x90(%rsp)
0ce3   85ea2e:	48 8d 94 24 e0 00 00 00 	lea    0xe0(%rsp),%rdx
0ceb   85ea36:	48 c1 ea 03          	shr    $0x3,%rdx
0cef   85ea3a:	48 89 94 24 70 01 00 00 	mov    %rdx,0x170(%rsp)
0cf7   85ea42:	48 8d 94 24 90 01 00 00 	lea    0x190(%rsp),%rdx
0cff   85ea4a:	48 c1 ea 03          	shr    $0x3,%rdx
0d03   85ea4e:	48 89 94 24 b8 01 00 00 	mov    %rdx,0x1b8(%rsp)
0d0b   85ea56:	48 8d 94 24 40 01 00 00 	lea    0x140(%rsp),%rdx
0d13   85ea5e:	48 c1 ea 03          	shr    $0x3,%rdx
0d17   85ea62:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
0d1c   85ea67:	48 8d 94 24 38 01 00 00 	lea    0x138(%rsp),%rdx
0d24   85ea6f:	48 c1 ea 03          	shr    $0x3,%rdx
0d28   85ea73:	48 89 94 24 50 01 00 00 	mov    %rdx,0x150(%rsp)
0d30   85ea7b:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	85ea7e: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0d37   85ea82:	48 c1 ea 03          	shr    $0x3,%rdx
0d3b   85ea86:	48 89 94 24 20 01 00 00 	mov    %rdx,0x120(%rsp)
0d43   85ea8e:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	85ea91: R_X86_64_32S	nr_cpu_ids
0d4a   85ea95:	48 c1 ea 03          	shr    $0x3,%rdx
0d4e   85ea99:	48 89 94 24 10 01 00 00 	mov    %rdx,0x110(%rsp)
0d56   85eaa1:	48 81 c1 30 04 00 00 	add    $0x430,%rcx
0d5d   85eaa8:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
0d62   85eaad:	48 8d 48 48          	lea    0x48(%rax),%rcx
0d66   85eab1:	48 89 8c 24 a8 00 00 00 	mov    %rcx,0xa8(%rsp)
0d6e   85eab9:	48 8d 48 50          	lea    0x50(%rax),%rcx
0d72   85eabd:	48 89 8c 24 78 01 00 00 	mov    %rcx,0x178(%rsp)
0d7a   85eac5:	48 8d 48 4c          	lea    0x4c(%rax),%rcx
0d7e   85eac9:	48 89 8c 24 e0 01 00 00 	mov    %rcx,0x1e0(%rsp)
0d86   85ead1:	48 8d 48 54          	lea    0x54(%rax),%rcx
0d8a   85ead5:	48 89 8c 24 d8 01 00 00 	mov    %rcx,0x1d8(%rsp)
0d92   85eadd:	48 8d 48 58          	lea    0x58(%rax),%rcx
0d96   85eae1:	48 89 8c 24 d0 01 00 00 	mov    %rcx,0x1d0(%rsp)
0d9e   85eae9:	48 8d 48 60          	lea    0x60(%rax),%rcx
0da2   85eaed:	48 89 8c 24 c8 01 00 00 	mov    %rcx,0x1c8(%rsp)
0daa   85eaf5:	48 83 c0 5c          	add    $0x5c,%rax
0dae   85eaf9:	48 89 84 24 58 01 00 00 	mov    %rax,0x158(%rsp)
0db6   85eb01:	4c 8d ac 24 e8 00 00 00 	lea    0xe8(%rsp),%r13
0dbe   85eb09:	31 c0                	xor    %eax,%eax
0dc0   85eb0b:	48 89 84 24 98 00 00 00 	mov    %rax,0x98(%rsp)
0dc8   85eb13:	40 80 e6 01          	and    $0x1,%sil
0dcc   85eb17:	89 b4 24 6c 01 00 00 	mov    %esi,0x16c(%rsp)
0dd3   85eb1e:	40 0f b6 f6          	movzbl %sil,%esi
0dd7   85eb22:	31 ff                	xor    %edi,%edi
0dd9   85eb24:	e8 00 00 00 00       	call   85eb29 <shrink_lruvec+0xdde>	85eb25: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0dde   85eb29:	48 8b 84 24 70 01 00 00 	mov    0x170(%rsp),%rax
0de6   85eb31:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0deb   85eb36:	74 0d                	je     85eb45 <shrink_lruvec+0xdfa>
0ded   85eb38:	48 8d bc 24 e0 00 00 00 	lea    0xe0(%rsp),%rdi
0df5   85eb40:	e8 00 00 00 00       	call   85eb45 <shrink_lruvec+0xdfa>	85eb41: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0dfa   85eb45:	48 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%rbx
0e02   85eb4d:	31 ff                	xor    %edi,%edi
0e04   85eb4f:	48 89 de             	mov    %rbx,%rsi
0e07   85eb52:	e8 00 00 00 00       	call   85eb57 <shrink_lruvec+0xe0c>	85eb53: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e0c   85eb57:	48 85 db             	test   %rbx,%rbx
0e0f   85eb5a:	74 07                	je     85eb63 <shrink_lruvec+0xe18>
0e11   85eb5c:	e8 00 00 00 00       	call   85eb61 <shrink_lruvec+0xe16>	85eb5d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e16   85eb61:	eb 74                	jmp    85ebd7 <shrink_lruvec+0xe8c>
0e18   85eb63:	48 8d bc 24 f8 00 00 00 	lea    0xf8(%rsp),%rdi
0e20   85eb6b:	48 89 f8             	mov    %rdi,%rax
0e23   85eb6e:	48 c1 e8 03          	shr    $0x3,%rax
0e27   85eb72:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0e2c   85eb77:	74 05                	je     85eb7e <shrink_lruvec+0xe33>
0e2e   85eb79:	e8 00 00 00 00       	call   85eb7e <shrink_lruvec+0xe33>	85eb7a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e33   85eb7e:	48 8b 9c 24 f8 00 00 00 	mov    0xf8(%rsp),%rbx
0e3b   85eb86:	31 ff                	xor    %edi,%edi
0e3d   85eb88:	48 89 de             	mov    %rbx,%rsi
0e40   85eb8b:	e8 00 00 00 00       	call   85eb90 <shrink_lruvec+0xe45>	85eb8c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e45   85eb90:	48 85 db             	test   %rbx,%rbx
0e48   85eb93:	74 07                	je     85eb9c <shrink_lruvec+0xe51>
0e4a   85eb95:	e8 00 00 00 00       	call   85eb9a <shrink_lruvec+0xe4f>	85eb96: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e4f   85eb9a:	eb 3b                	jmp    85ebd7 <shrink_lruvec+0xe8c>
0e51   85eb9c:	48 8d bc 24 f0 00 00 00 	lea    0xf0(%rsp),%rdi
0e59   85eba4:	48 89 f8             	mov    %rdi,%rax
0e5c   85eba7:	48 c1 e8 03          	shr    $0x3,%rax
0e60   85ebab:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0e65   85ebb0:	74 05                	je     85ebb7 <shrink_lruvec+0xe6c>
0e67   85ebb2:	e8 00 00 00 00       	call   85ebb7 <shrink_lruvec+0xe6c>	85ebb3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e6c   85ebb7:	48 8b 9c 24 f0 00 00 00 	mov    0xf0(%rsp),%rbx
0e74   85ebbf:	31 ff                	xor    %edi,%edi
0e76   85ebc1:	48 89 de             	mov    %rbx,%rsi
0e79   85ebc4:	e8 00 00 00 00       	call   85ebc9 <shrink_lruvec+0xe7e>	85ebc5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0e7e   85ebc9:	48 85 db             	test   %rbx,%rbx
0e81   85ebcc:	0f 84 8b 13 00 00    	je     85ff5d <shrink_lruvec+0x2212>
0e87   85ebd2:	e8 00 00 00 00       	call   85ebd7 <shrink_lruvec+0xe8c>	85ebd3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e8c   85ebd7:	45 31 ff             	xor    %r15d,%r15d
0e8f   85ebda:	4c 89 7c 24 18       	mov    %r15,0x18(%rsp)
0e94   85ebdf:	4e 8d 34 fc          	lea    (%rsp,%r15,8),%r14
0e98   85ebe3:	49 81 c6 e0 00 00 00 	add    $0xe0,%r14
0e9f   85ebea:	4d 89 f7             	mov    %r14,%r15
0ea2   85ebed:	49 c1 ef 03          	shr    $0x3,%r15
0ea6   85ebf1:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
0eab   85ebf6:	74 08                	je     85ec00 <shrink_lruvec+0xeb5>
0ead   85ebf8:	4c 89 f7             	mov    %r14,%rdi
0eb0   85ebfb:	e8 00 00 00 00       	call   85ec00 <shrink_lruvec+0xeb5>	85ebfc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0eb5   85ec00:	49 8b 1e             	mov    (%r14),%rbx
0eb8   85ec03:	31 ff                	xor    %edi,%edi
0eba   85ec05:	48 89 de             	mov    %rbx,%rsi
0ebd   85ec08:	e8 00 00 00 00       	call   85ec0d <shrink_lruvec+0xec2>	85ec09: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0ec2   85ec0d:	48 85 db             	test   %rbx,%rbx
0ec5   85ec10:	0f 84 be 00 00 00    	je     85ecd4 <shrink_lruvec+0xf89>
0ecb   85ec16:	48 83 fb 20          	cmp    $0x20,%rbx
0ecf   85ec1a:	b8 20 00 00 00       	mov    $0x20,%eax
0ed4   85ec1f:	48 0f 42 c3          	cmovb  %rbx,%rax
0ed8   85ec23:	48 89 44 24 70       	mov    %rax,0x70(%rsp)
0edd   85ec28:	48 29 c3             	sub    %rax,%rbx
0ee0   85ec2b:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
0ee5   85ec30:	74 08                	je     85ec3a <shrink_lruvec+0xeef>
0ee7   85ec32:	4c 89 f7             	mov    %r14,%rdi
0eea   85ec35:	e8 00 00 00 00       	call   85ec3a <shrink_lruvec+0xeef>	85ec36: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0eef   85ec3a:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
0ef4   85ec3f:	4a 89 9c fc e0 00 00 00 	mov    %rbx,0xe0(%rsp,%r15,8)
0efc   85ec47:	44 89 fb             	mov    %r15d,%ebx
0eff   85ec4a:	83 e3 fd             	and    $0xfffffffd,%ebx
0f02   85ec4d:	bf 01 00 00 00       	mov    $0x1,%edi
0f07   85ec52:	89 de                	mov    %ebx,%esi
0f09   85ec54:	e8 00 00 00 00       	call   85ec59 <shrink_lruvec+0xf0e>	85ec55: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0f0e   85ec59:	83 fb 01             	cmp    $0x1,%ebx
0f11   85ec5c:	0f 85 81 00 00 00    	jne    85ece3 <shrink_lruvec+0xf98>
0f17   85ec62:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
0f1f   85ec6a:	42 8a 04 20          	mov    (%rax,%r12,1),%al
0f23   85ec6e:	84 c0                	test   %al,%al
0f25   85ec70:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0f2a   85ec75:	0f 85 d4 0b 00 00    	jne    85f84f <shrink_lruvec+0x1b04>
0f30   85ec7b:	44 0f b7 32          	movzwl (%rdx),%r14d
0f34   85ec7f:	44 89 fb             	mov    %r15d,%ebx
0f37   85ec82:	83 e3 fe             	and    $0xfffffffe,%ebx
0f3a   85ec85:	bf 02 00 00 00       	mov    $0x2,%edi
0f3f   85ec8a:	89 de                	mov    %ebx,%esi
0f41   85ec8c:	e8 00 00 00 00       	call   85ec91 <shrink_lruvec+0xf46>	85ec8d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0f46   85ec91:	83 fb 02             	cmp    $0x2,%ebx
0f49   85ec94:	0f 94 c1             	sete   %cl
0f4c   85ec97:	bb 01 00 00 00       	mov    $0x1,%ebx
0f51   85ec9c:	d3 e3                	shl    %cl,%ebx
0f53   85ec9e:	44 89 f6             	mov    %r14d,%esi
0f56   85eca1:	21 de                	and    %ebx,%esi
0f58   85eca3:	31 ff                	xor    %edi,%edi
0f5a   85eca5:	e8 00 00 00 00       	call   85ecaa <shrink_lruvec+0xf5f>	85eca6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0f5f   85ecaa:	44 21 f3             	and    %r14d,%ebx
0f62   85ecad:	0f 84 2f 03 00 00    	je     85efe2 <shrink_lruvec+0x1297>
0f68   85ecb3:	e8 00 00 00 00       	call   85ecb8 <shrink_lruvec+0xf6d>	85ecb4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f6d   85ecb8:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
0f72   85ecbd:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
0f77   85ecc2:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0f7c   85ecc7:	44 89 f9             	mov    %r15d,%ecx
0f7f   85ecca:	e8 cb bb 00 00       	call   86a89a <shrink_active_list>
0f84   85eccf:	e9 bc 03 00 00       	jmp    85f090 <shrink_lruvec+0x1345>
0f89   85ecd4:	e8 00 00 00 00       	call   85ecd9 <shrink_lruvec+0xf8e>	85ecd5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f8e   85ecd9:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
0f93   85ecde:	e9 b7 03 00 00       	jmp    85f09a <shrink_lruvec+0x134f>
0f98   85ece3:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
0f9d   85ece8:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0fa2   85eced:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
0fa7   85ecf2:	4c 8d b4 24 48 01 00 00 	lea    0x148(%rsp),%r14
0faf   85ecfa:	48 8d 8c 24 40 01 00 00 	lea    0x140(%rsp),%rcx
0fb7   85ed02:	74 15                	je     85ed19 <shrink_lruvec+0xfce>
0fb9   85ed04:	48 8d bc 24 40 01 00 00 	lea    0x140(%rsp),%rdi
0fc1   85ed0c:	e8 00 00 00 00       	call   85ed11 <shrink_lruvec+0xfc6>	85ed0d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0fc6   85ed11:	48 8d 8c 24 40 01 00 00 	lea    0x140(%rsp),%rcx
0fce   85ed19:	48 89 8c 24 40 01 00 00 	mov    %rcx,0x140(%rsp)
0fd6   85ed21:	4c 89 f0             	mov    %r14,%rax
0fd9   85ed24:	48 c1 e8 03          	shr    $0x3,%rax
0fdd   85ed28:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
0fe2   85ed2d:	74 10                	je     85ed3f <shrink_lruvec+0xff4>
0fe4   85ed2f:	4c 89 f7             	mov    %r14,%rdi
0fe7   85ed32:	e8 00 00 00 00       	call   85ed37 <shrink_lruvec+0xfec>	85ed33: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0fec   85ed37:	48 8d 8c 24 40 01 00 00 	lea    0x140(%rsp),%rcx
0ff4   85ed3f:	48 89 8c 24 48 01 00 00 	mov    %rcx,0x148(%rsp)
0ffc   85ed47:	48 8b 84 24 50 01 00 00 	mov    0x150(%rsp),%rax
1004   85ed4f:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1009   85ed54:	74 0d                	je     85ed63 <shrink_lruvec+0x1018>
100b   85ed56:	48 8d bc 24 38 01 00 00 	lea    0x138(%rsp),%rdi
1013   85ed5e:	e8 00 00 00 00       	call   85ed63 <shrink_lruvec+0x1018>	85ed5f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
1018   85ed63:	48 c7 84 24 38 01 00 00 00 00 00 00 	movq   $0x0,0x138(%rsp)
1024   85ed6f:	ba 2c 00 00 00       	mov    $0x2c,%edx
1029   85ed74:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
1031   85ed7c:	31 f6                	xor    %esi,%esi
1033   85ed7e:	e8 00 00 00 00       	call   85ed83 <shrink_lruvec+0x1038>	85ed7f: R_X86_64_PLT32	memset-0x4
1038   85ed83:	44 89 fe             	mov    %r15d,%esi
103b   85ed86:	83 e6 fe             	and    $0xfffffffe,%esi
103e   85ed89:	bf 02 00 00 00       	mov    $0x2,%edi
1043   85ed8e:	89 b4 24 80 00 00 00 	mov    %esi,0x80(%rsp)
104a   85ed95:	e8 00 00 00 00       	call   85ed9a <shrink_lruvec+0x104f>	85ed96: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
104f   85ed9a:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
1057   85eda2:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
105c   85eda7:	74 08                	je     85edb1 <shrink_lruvec+0x1066>
105e   85eda9:	48 89 df             	mov    %rbx,%rdi
1061   85edac:	e8 00 00 00 00       	call   85edb1 <shrink_lruvec+0x1066>	85edad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1066   85edb1:	31 c0                	xor    %eax,%eax
1068   85edb3:	83 bc 24 80 00 00 00 02 	cmpl   $0x2,0x80(%rsp)
1070   85edbb:	0f 94 c0             	sete   %al
1073   85edbe:	4c 8b 33             	mov    (%rbx),%r14
1076   85edc1:	65 48 8b 0d 00 00 00 00 	mov    %gs:0x0(%rip),%rcx        # 85edc9 <shrink_lruvec+0x107e>	85edc5: R_X86_64_PC32	current_task-0x4
107e   85edc9:	48 8d 59 2c          	lea    0x2c(%rcx),%rbx
1082   85edcd:	8d 14 00             	lea    (%rax,%rax,1),%edx
1085   85edd0:	89 54 24 58          	mov    %edx,0x58(%rsp)
1089   85edd4:	83 c0 07             	add    $0x7,%eax
108c   85edd7:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
1094   85eddf:	48 89 8c 24 28 01 00 00 	mov    %rcx,0x128(%rsp)
109c   85ede7:	48 8d 81 90 0c 00 00 	lea    0xc90(%rcx),%rax
10a3   85edee:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
10ab   85edf6:	45 31 ed             	xor    %r13d,%r13d
10ae   85edf9:	4c 89 74 24 48       	mov    %r14,0x48(%rsp)
10b3   85edfe:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
10b8   85ee03:	48 89 d8             	mov    %rbx,%rax
10bb   85ee06:	48 c1 e8 03          	shr    $0x3,%rax
10bf   85ee0a:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
10c7   85ee12:	42 8a 04 20          	mov    (%rax,%r12,1),%al
10cb   85ee16:	84 c0                	test   %al,%al
10cd   85ee18:	0f 85 83 01 00 00    	jne    85efa1 <shrink_lruvec+0x1256>
10d3   85ee1e:	8b 1b                	mov    (%rbx),%ebx
10d5   85ee20:	be 00 00 02 00       	mov    $0x20000,%esi
10da   85ee25:	21 de                	and    %ebx,%esi
10dc   85ee27:	31 ff                	xor    %edi,%edi
10de   85ee29:	e8 00 00 00 00       	call   85ee2e <shrink_lruvec+0x10e3>	85ee2a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
10e3   85ee2e:	b8 00 00 02 00       	mov    $0x20000,%eax
10e8   85ee33:	21 c3                	and    %eax,%ebx
10ea   85ee35:	0f 85 d2 01 00 00    	jne    85f00d <shrink_lruvec+0x12c2>
10f0   85ee3b:	48 8b 84 24 88 01 00 00 	mov    0x188(%rsp),%rax
10f8   85ee43:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
10fd   85ee48:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
1102   85ee4d:	74 08                	je     85ee57 <shrink_lruvec+0x110c>
1104   85ee4f:	48 89 df             	mov    %rbx,%rdi
1107   85ee52:	e8 00 00 00 00       	call   85ee57 <shrink_lruvec+0x110c>	85ee53: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
110c   85ee57:	48 83 3b 00          	cmpq   $0x0,(%rbx)
1110   85ee5b:	0f 85 b3 01 00 00    	jne    85f014 <shrink_lruvec+0x12c9>
1116   85ee61:	44 89 6c 24 38       	mov    %r13d,0x38(%rsp)
111b   85ee66:	4c 89 f7             	mov    %r14,%rdi
111e   85ee69:	8b 74 24 58          	mov    0x58(%rsp),%esi
1122   85ee6d:	e8 00 00 00 00       	call   85ee72 <shrink_lruvec+0x1127>	85ee6e: R_X86_64_PLT32	node_page_state-0x4
1127   85ee72:	48 89 c3             	mov    %rax,%rbx
112a   85ee75:	4c 89 f7             	mov    %r14,%rdi
112d   85ee78:	48 8b b4 24 30 01 00 00 	mov    0x130(%rsp),%rsi
1135   85ee80:	e8 00 00 00 00       	call   85ee85 <shrink_lruvec+0x113a>	85ee81: R_X86_64_PLT32	node_page_state-0x4
113a   85ee85:	4c 89 e1             	mov    %r12,%rcx
113d   85ee88:	49 89 c4             	mov    %rax,%r12
1140   85ee8b:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
1145   85ee90:	48 89 d0             	mov    %rdx,%rax
1148   85ee93:	48 c1 e8 03          	shr    $0x3,%rax
114c   85ee97:	8a 04 08             	mov    (%rax,%rcx,1),%al
114f   85ee9a:	84 c0                	test   %al,%al
1151   85ee9c:	0f 85 1c 01 00 00    	jne    85efbe <shrink_lruvec+0x1273>
1157   85eea2:	44 8b 3a             	mov    (%rdx),%r15d
115a   85eea5:	41 be c0 00 00 00    	mov    $0xc0,%r14d
1160   85eeab:	45 21 f7             	and    %r14d,%r15d
1163   85eeae:	bf c0 00 00 00       	mov    $0xc0,%edi
1168   85eeb3:	44 89 fe             	mov    %r15d,%esi
116b   85eeb6:	e8 00 00 00 00       	call   85eebb <shrink_lruvec+0x1170>	85eeb7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1170   85eebb:	49 89 dd             	mov    %rbx,%r13
1173   85eebe:	49 c1 ed 03          	shr    $0x3,%r13
1177   85eec2:	45 39 f7             	cmp    %r14d,%r15d
117a   85eec5:	4c 0f 45 eb          	cmovne %rbx,%r13
117e   85eec9:	4c 89 e7             	mov    %r12,%rdi
1181   85eecc:	4c 89 ee             	mov    %r13,%rsi
1184   85eecf:	e8 00 00 00 00       	call   85eed4 <shrink_lruvec+0x1189>	85eed0: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1189   85eed4:	4d 39 ec             	cmp    %r13,%r12
118c   85eed7:	0f 86 49 01 00 00    	jbe    85f026 <shrink_lruvec+0x12db>
1192   85eedd:	f6 44 24 38 01       	testb  $0x1,0x38(%rsp)
1197   85eee2:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
11a1   85eeec:	4c 8d ac 24 e8 00 00 00 	lea    0xe8(%rsp),%r13
11a9   85eef4:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
11ae   85eef9:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
11b3   85eefe:	0f 85 87 01 00 00    	jne    85f08b <shrink_lruvec+0x1340>
11b9   85ef04:	4c 89 f7             	mov    %r14,%rdi
11bc   85ef07:	be 01 00 00 00       	mov    $0x1,%esi
11c1   85ef0c:	e8 00 00 00 00       	call   85ef11 <shrink_lruvec+0x11c6>	85ef0d: R_X86_64_PLT32	reclaim_throttle-0x4
11c6   85ef11:	48 8b 9c 24 28 01 00 00 	mov    0x128(%rsp),%rbx
11ce   85ef19:	48 89 df             	mov    %rbx,%rdi
11d1   85ef1c:	be 08 00 00 00       	mov    $0x8,%esi
11d6   85ef21:	e8 00 00 00 00       	call   85ef26 <shrink_lruvec+0x11db>	85ef22: R_X86_64_PLT32	__kasan_check_read-0x4
11db   85ef26:	48 89 d8             	mov    %rbx,%rax
11de   85ef29:	48 c1 e8 03          	shr    $0x3,%rax
11e2   85ef2d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
11e7   85ef32:	74 08                	je     85ef3c <shrink_lruvec+0x11f1>
11e9   85ef34:	48 89 df             	mov    %rbx,%rdi
11ec   85ef37:	e8 00 00 00 00       	call   85ef3c <shrink_lruvec+0x11f1>	85ef38: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
11f1   85ef3c:	48 8b 1b             	mov    (%rbx),%rbx
11f4   85ef3f:	48 89 de             	mov    %rbx,%rsi
11f7   85ef42:	48 83 e6 04          	and    $0x4,%rsi
11fb   85ef46:	31 ff                	xor    %edi,%edi
11fd   85ef48:	e8 00 00 00 00       	call   85ef4d <shrink_lruvec+0x1202>	85ef49: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1202   85ef4d:	48 83 e3 04          	and    $0x4,%rbx
1206   85ef51:	75 09                	jne    85ef5c <shrink_lruvec+0x1211>
1208   85ef53:	e8 00 00 00 00       	call   85ef58 <shrink_lruvec+0x120d>	85ef54: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
120d   85ef58:	31 c0                	xor    %eax,%eax
120f   85ef5a:	eb 2b                	jmp    85ef87 <shrink_lruvec+0x123c>
1211   85ef5c:	e8 00 00 00 00       	call   85ef61 <shrink_lruvec+0x1216>	85ef5d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1216   85ef61:	48 8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%rbx
121e   85ef69:	48 89 d8             	mov    %rbx,%rax
1221   85ef6c:	48 c1 e8 03          	shr    $0x3,%rax
1225   85ef70:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
122a   85ef75:	74 08                	je     85ef7f <shrink_lruvec+0x1234>
122c   85ef77:	48 89 df             	mov    %rbx,%rdi
122f   85ef7a:	e8 00 00 00 00       	call   85ef7f <shrink_lruvec+0x1234>	85ef7b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1234   85ef7f:	8b 03                	mov    (%rbx),%eax
1236   85ef81:	c1 e8 08             	shr    $0x8,%eax
1239   85ef84:	83 e0 01             	and    $0x1,%eax
123c   85ef87:	85 c0                	test   %eax,%eax
123e   85ef89:	0f 85 22 01 00 00    	jne    85f0b1 <shrink_lruvec+0x1366>
1244   85ef8f:	e8 00 00 00 00       	call   85ef94 <shrink_lruvec+0x1249>	85ef90: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1249   85ef94:	41 b5 01             	mov    $0x1,%r13b
124c   85ef97:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
1251   85ef9c:	e9 62 fe ff ff       	jmp    85ee03 <shrink_lruvec+0x10b8>
1256   85efa1:	89 d9                	mov    %ebx,%ecx
1258   85efa3:	80 e1 07             	and    $0x7,%cl
125b   85efa6:	80 c1 03             	add    $0x3,%cl
125e   85efa9:	38 c1                	cmp    %al,%cl
1260   85efab:	0f 8c 6d fe ff ff    	jl     85ee1e <shrink_lruvec+0x10d3>
1266   85efb1:	48 89 df             	mov    %rbx,%rdi
1269   85efb4:	e8 00 00 00 00       	call   85efb9 <shrink_lruvec+0x126e>	85efb5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
126e   85efb9:	e9 60 fe ff ff       	jmp    85ee1e <shrink_lruvec+0x10d3>
1273   85efbe:	89 d1                	mov    %edx,%ecx
1275   85efc0:	80 e1 07             	and    $0x7,%cl
1278   85efc3:	80 c1 03             	add    $0x3,%cl
127b   85efc6:	38 c1                	cmp    %al,%cl
127d   85efc8:	0f 8c d4 fe ff ff    	jl     85eea2 <shrink_lruvec+0x1157>
1283   85efce:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
1288   85efd3:	e8 00 00 00 00       	call   85efd8 <shrink_lruvec+0x128d>	85efd4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
128d   85efd8:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
1292   85efdd:	e9 c0 fe ff ff       	jmp    85eea2 <shrink_lruvec+0x1157>
1297   85efe2:	e8 00 00 00 00       	call   85efe7 <shrink_lruvec+0x129c>	85efe3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
129c   85efe7:	41 83 ce 08          	or     $0x8,%r14d
12a0   85efeb:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
12a8   85eff3:	42 8a 04 20          	mov    (%rax,%r12,1),%al
12ac   85eff7:	84 c0                	test   %al,%al
12ae   85eff9:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
12b3   85effe:	0f 85 34 0b 00 00    	jne    85fb38 <shrink_lruvec+0x1ded>
12b9   85f004:	66 44 89 32          	mov    %r14w,(%rdx)
12bd   85f008:	e9 83 00 00 00       	jmp    85f090 <shrink_lruvec+0x1345>
12c2   85f00d:	e8 00 00 00 00       	call   85f012 <shrink_lruvec+0x12c7>	85f00e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12c7   85f012:	eb 05                	jmp    85f019 <shrink_lruvec+0x12ce>
12c9   85f014:	e8 00 00 00 00       	call   85f019 <shrink_lruvec+0x12ce>	85f015: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
12ce   85f019:	4c 8b b4 24 90 00 00 00 	mov    0x90(%rsp),%r14
12d6   85f021:	e9 9c 00 00 00       	jmp    85f0c2 <shrink_lruvec+0x1377>
12db   85f026:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
12e0   85f02b:	48 8d 98 b8 1c 02 00 	lea    0x21cb8(%rax),%rbx
12e7   85f032:	48 89 d8             	mov    %rbx,%rax
12ea   85f035:	48 c1 e8 03          	shr    $0x3,%rax
12ee   85f039:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
12f8   85f043:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
12fd   85f048:	4c 8b b4 24 90 00 00 00 	mov    0x90(%rsp),%r14
1305   85f050:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
130a   85f055:	74 08                	je     85f05f <shrink_lruvec+0x1314>
130c   85f057:	48 89 df             	mov    %rbx,%rdi
130f   85f05a:	e8 00 00 00 00       	call   85f05f <shrink_lruvec+0x1314>	85f05b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1314   85f05f:	48 8b 03             	mov    (%rbx),%rax
1317   85f062:	48 39 d8             	cmp    %rbx,%rax
131a   85f065:	74 56                	je     85f0bd <shrink_lruvec+0x1372>
131c   85f067:	e8 00 00 00 00       	call   85f06c <shrink_lruvec+0x1321>	85f068: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1321   85f06c:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
1326   85f071:	48 8d b8 78 1c 02 00 	lea    0x21c78(%rax),%rdi
132d   85f078:	be 03 00 00 00       	mov    $0x3,%esi
1332   85f07d:	ba 01 00 00 00       	mov    $0x1,%edx
1337   85f082:	31 c9                	xor    %ecx,%ecx
1339   85f084:	e8 00 00 00 00       	call   85f089 <shrink_lruvec+0x133e>	85f085: R_X86_64_PLT32	__wake_up-0x4
133e   85f089:	eb 37                	jmp    85f0c2 <shrink_lruvec+0x1377>
1340   85f08b:	e8 00 00 00 00       	call   85f090 <shrink_lruvec+0x1345>	85f08c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1345   85f090:	31 db                	xor    %ebx,%ebx
1347   85f092:	48 01 9c 24 98 00 00 00 	add    %rbx,0x98(%rsp)
134f   85f09a:	49 ff c7             	inc    %r15
1352   85f09d:	49 83 ff 04          	cmp    $0x4,%r15
1356   85f0a1:	0f 84 2a 0b 00 00    	je     85fbd1 <shrink_lruvec+0x1e86>
135c   85f0a7:	e8 00 00 00 00       	call   85f0ac <shrink_lruvec+0x1361>	85f0a8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1361   85f0ac:	e9 29 fb ff ff       	jmp    85ebda <shrink_lruvec+0xe8f>
1366   85f0b1:	e8 00 00 00 00       	call   85f0b6 <shrink_lruvec+0x136b>	85f0b2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
136b   85f0b6:	bb 20 00 00 00       	mov    $0x20,%ebx
1370   85f0bb:	eb d5                	jmp    85f092 <shrink_lruvec+0x1347>
1372   85f0bd:	e8 00 00 00 00       	call   85f0c2 <shrink_lruvec+0x1377>	85f0be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1377   85f0c2:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
137c   85f0c7:	83 bc 24 80 00 00 00 02 	cmpl   $0x2,0x80(%rsp)
1384   85f0cf:	0f 94 84 24 28 01 00 00 	sete   0x128(%rsp)
138c   85f0d7:	e8 00 00 00 00       	call   85f0dc <shrink_lruvec+0x1391>	85f0d8: R_X86_64_PLT32	lru_add_drain-0x4
1391   85f0dc:	4c 89 f7             	mov    %r14,%rdi
1394   85f0df:	e8 00 00 00 00       	call   85f0e4 <shrink_lruvec+0x1399>	85f0e0: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
1399   85f0e4:	48 89 df             	mov    %rbx,%rdi
139c   85f0e7:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
13a1   85f0ec:	48 8d 94 24 40 01 00 00 	lea    0x140(%rsp),%rdx
13a9   85f0f4:	48 8d 8c 24 38 01 00 00 	lea    0x138(%rsp),%rcx
13b1   85f0fc:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
13b6   85f101:	45 89 f9             	mov    %r15d,%r9d
13b9   85f104:	e8 c9 ca 00 00       	call   86bbd2 <isolate_lru_pages>
13be   85f109:	49 89 c5             	mov    %rax,%r13
13c1   85f10c:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
13c6   85f111:	48 8b b4 24 30 01 00 00 	mov    0x130(%rsp),%rsi
13ce   85f119:	48 89 c2             	mov    %rax,%rdx
13d1   85f11c:	e8 00 00 00 00       	call   85f121 <shrink_lruvec+0x13d6>	85f11d: R_X86_64_PLT32	__mod_node_page_state-0x4
13d6   85f121:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
13de   85f129:	42 8a 04 20          	mov    (%rax,%r12,1),%al
13e2   85f12d:	84 c0                	test   %al,%al
13e4   85f12f:	4c 89 e3             	mov    %r12,%rbx
13e7   85f132:	0f 85 3a 07 00 00    	jne    85f872 <shrink_lruvec+0x1b27>
13ed   85f138:	45 31 ff             	xor    %r15d,%r15d
13f0   85f13b:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
13f5   85f140:	8b 30                	mov    (%rax),%esi
13f7   85f142:	b8 00 00 02 00       	mov    $0x20000,%eax
13fc   85f147:	21 c6                	and    %eax,%esi
13fe   85f149:	41 0f 94 c4          	sete   %r12b
1402   85f14d:	31 ff                	xor    %edi,%edi
1404   85f14f:	e8 00 00 00 00       	call   85f154 <shrink_lruvec+0x1409>	85f150: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1409   85f154:	48 8b 84 24 20 01 00 00 	mov    0x120(%rsp),%rax
1411   85f15c:	8a 04 18             	mov    (%rax,%rbx,1),%al
1414   85f15f:	84 c0                	test   %al,%al
1416   85f161:	0f 85 2d 07 00 00    	jne    85f894 <shrink_lruvec+0x1b49>
141c   85f167:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85f16d <shrink_lruvec+0x1422>	85f169: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
1422   85f16d:	bf 01 00 00 00       	mov    $0x1,%edi
1427   85f172:	89 de                	mov    %ebx,%esi
1429   85f174:	e8 00 00 00 00       	call   85f179 <shrink_lruvec+0x142e>	85f175: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
142e   85f179:	85 db                	test   %ebx,%ebx
1430   85f17b:	7e 2e                	jle    85f1ab <shrink_lruvec+0x1460>
1432   85f17d:	e8 00 00 00 00       	call   85f182 <shrink_lruvec+0x1437>	85f17e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1437   85f182:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
143c   85f187:	48 89 d8             	mov    %rbx,%rax
143f   85f18a:	48 c1 e8 03          	shr    $0x3,%rax
1443   85f18e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
144d   85f198:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1451   85f19c:	74 08                	je     85f1a6 <shrink_lruvec+0x145b>
1453   85f19e:	48 89 df             	mov    %rbx,%rdi
1456   85f1a1:	e8 00 00 00 00       	call   85f1a6 <shrink_lruvec+0x145b>	85f1a2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
145b   85f1a6:	4c 8b 33             	mov    (%rbx),%r14
145e   85f1a9:	eb 08                	jmp    85f1b3 <shrink_lruvec+0x1468>
1460   85f1ab:	e8 00 00 00 00       	call   85f1b0 <shrink_lruvec+0x1465>	85f1ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1465   85f1b0:	45 31 f6             	xor    %r14d,%r14d
1468   85f1b3:	45 88 e7             	mov    %r12b,%r15b
146b   85f1b6:	41 83 cf 1a          	or     $0x1a,%r15d
146f   85f1ba:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1479   85f1c4:	48 8b 84 24 50 01 00 00 	mov    0x150(%rsp),%rax
1481   85f1cc:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1486   85f1d1:	74 0d                	je     85f1e0 <shrink_lruvec+0x1495>
1488   85f1d3:	48 8d bc 24 38 01 00 00 	lea    0x138(%rsp),%rdi
1490   85f1db:	e8 00 00 00 00       	call   85f1e0 <shrink_lruvec+0x1495>	85f1dc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1495   85f1e0:	48 8b 94 24 38 01 00 00 	mov    0x138(%rsp),%rdx
149d   85f1e8:	4c 89 f7             	mov    %r14,%rdi
14a0   85f1eb:	44 89 fe             	mov    %r15d,%esi
14a3   85f1ee:	48 89 94 24 a0 00 00 00 	mov    %rdx,0xa0(%rsp)
14ab   85f1f6:	e8 00 00 00 00       	call   85f1fb <shrink_lruvec+0x14b0>	85f1f7: R_X86_64_PLT32	__count_memcg_events-0x4
14b0   85f1fb:	48 8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%rbx
14b8   85f203:	48 89 df             	mov    %rbx,%rdi
14bb   85f206:	e8 00 00 00 00       	call   85f20b <shrink_lruvec+0x14c0>	85f207: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
14c0   85f20b:	31 ff                	xor    %edi,%edi
14c2   85f20d:	4c 89 ee             	mov    %r13,%rsi
14c5   85f210:	e8 00 00 00 00       	call   85f215 <shrink_lruvec+0x14ca>	85f211: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
14ca   85f215:	4d 85 ed             	test   %r13,%r13
14cd   85f218:	0f 84 e6 00 00 00    	je     85f304 <shrink_lruvec+0x15b9>
14d3   85f21e:	4c 8d bc 24 40 01 00 00 	lea    0x140(%rsp),%r15
14db   85f226:	4c 89 ff             	mov    %r15,%rdi
14de   85f229:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
14e3   85f22e:	4c 89 f6             	mov    %r14,%rsi
14e6   85f231:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
14eb   85f236:	48 8d 8c 24 b0 00 00 00 	lea    0xb0(%rsp),%rcx
14f3   85f23e:	45 31 c0             	xor    %r8d,%r8d
14f6   85f241:	e8 b6 73 ff ff       	call   8565fc <shrink_page_list>
14fb   85f246:	89 44 24 38          	mov    %eax,0x38(%rsp)
14ff   85f24a:	48 89 df             	mov    %rbx,%rdi
1502   85f24d:	e8 00 00 00 00       	call   85f252 <shrink_lruvec+0x1507>	85f24e: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
1507   85f252:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
150c   85f257:	4c 89 fe             	mov    %r15,%rsi
150f   85f25a:	e8 71 de 00 00       	call   86d0d0 <move_pages_to_lru>
1514   85f25f:	4c 89 6c 24 58       	mov    %r13,0x58(%rsp)
1519   85f264:	49 f7 dd             	neg    %r13
151c   85f267:	4c 89 f7             	mov    %r14,%rdi
151f   85f26a:	48 8b b4 24 30 01 00 00 	mov    0x130(%rsp),%rsi
1527   85f272:	4c 89 ea             	mov    %r13,%rdx
152a   85f275:	e8 00 00 00 00       	call   85f27a <shrink_lruvec+0x152f>	85f276: R_X86_64_PLT32	__mod_node_page_state-0x4
152f   85f27a:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
1537   85f282:	42 8a 04 20          	mov    (%rax,%r12,1),%al
153b   85f286:	84 c0                	test   %al,%al
153d   85f288:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
1542   85f28d:	0f 85 27 06 00 00    	jne    85f8ba <shrink_lruvec+0x1b6f>
1548   85f293:	45 31 ff             	xor    %r15d,%r15d
154b   85f296:	8b 33                	mov    (%rbx),%esi
154d   85f298:	b8 00 00 02 00       	mov    $0x20000,%eax
1552   85f29d:	21 c6                	and    %eax,%esi
1554   85f29f:	0f 94 c3             	sete   %bl
1557   85f2a2:	31 ff                	xor    %edi,%edi
1559   85f2a4:	e8 00 00 00 00       	call   85f2a9 <shrink_lruvec+0x155e>	85f2a5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
155e   85f2a9:	48 8b 84 24 20 01 00 00 	mov    0x120(%rsp),%rax
1566   85f2b1:	42 8a 04 20          	mov    (%rax,%r12,1),%al
156a   85f2b5:	84 c0                	test   %al,%al
156c   85f2b7:	0f 85 1a 06 00 00    	jne    85f8d7 <shrink_lruvec+0x1b8c>
1572   85f2bd:	41 88 df             	mov    %bl,%r15b
1575   85f2c0:	41 83 cf 16          	or     $0x16,%r15d
1579   85f2c4:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85f2ca <shrink_lruvec+0x157f>	85f2c6: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
157f   85f2ca:	bf 01 00 00 00       	mov    $0x1,%edi
1584   85f2cf:	89 de                	mov    %ebx,%esi
1586   85f2d1:	e8 00 00 00 00       	call   85f2d6 <shrink_lruvec+0x158b>	85f2d2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
158b   85f2d6:	85 db                	test   %ebx,%ebx
158d   85f2d8:	4c 8b 6c 24 58       	mov    0x58(%rsp),%r13
1592   85f2dd:	7e 3e                	jle    85f31d <shrink_lruvec+0x15d2>
1594   85f2df:	e8 00 00 00 00       	call   85f2e4 <shrink_lruvec+0x1599>	85f2e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1599   85f2e4:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
159e   85f2e9:	48 89 d8             	mov    %rbx,%rax
15a1   85f2ec:	48 c1 e8 03          	shr    $0x3,%rax
15a5   85f2f0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
15aa   85f2f5:	74 08                	je     85f2ff <shrink_lruvec+0x15b4>
15ac   85f2f7:	48 89 df             	mov    %rbx,%rdi
15af   85f2fa:	e8 00 00 00 00       	call   85f2ff <shrink_lruvec+0x15b4>	85f2fb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15b4   85f2ff:	48 8b 3b             	mov    (%rbx),%rdi
15b7   85f302:	eb 20                	jmp    85f324 <shrink_lruvec+0x15d9>
15b9   85f304:	e8 00 00 00 00       	call   85f309 <shrink_lruvec+0x15be>	85f305: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15be   85f309:	31 db                	xor    %ebx,%ebx
15c0   85f30b:	4c 8d ac 24 e8 00 00 00 	lea    0xe8(%rsp),%r13
15c8   85f313:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
15cd   85f318:	e9 75 fd ff ff       	jmp    85f092 <shrink_lruvec+0x1347>
15d2   85f31d:	e8 00 00 00 00       	call   85f322 <shrink_lruvec+0x15d7>	85f31e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15d7   85f322:	31 ff                	xor    %edi,%edi
15d9   85f324:	44 8b 74 24 38       	mov    0x38(%rsp),%r14d
15de   85f329:	44 89 fe             	mov    %r15d,%esi
15e1   85f32c:	4c 89 f2             	mov    %r14,%rdx
15e4   85f32f:	e8 00 00 00 00       	call   85f334 <shrink_lruvec+0x15e9>	85f330: R_X86_64_PLT32	__count_memcg_events-0x4
15e9   85f334:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
15f1   85f33c:	e8 00 00 00 00       	call   85f341 <shrink_lruvec+0x15f6>	85f33d: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
15f6   85f341:	48 8d 84 24 c4 00 00 00 	lea    0xc4(%rsp),%rax
15fe   85f349:	48 c1 e8 03          	shr    $0x3,%rax
1602   85f34d:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1606   85f351:	84 c0                	test   %al,%al
1608   85f353:	0f 85 a4 05 00 00    	jne    85f8fd <shrink_lruvec+0x1bb2>
160e   85f359:	31 f6                	xor    %esi,%esi
1610   85f35b:	83 bc 24 80 00 00 00 02 	cmpl   $0x2,0x80(%rsp)
1618   85f363:	40 0f 94 c6          	sete   %sil
161c   85f367:	8b 94 24 c4 00 00 00 	mov    0xc4(%rsp),%edx
1623   85f36e:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
1628   85f373:	e8 00 00 00 00       	call   85f378 <shrink_lruvec+0x162d>	85f374: R_X86_64_PLT32	lru_note_cost-0x4
162d   85f378:	48 8b 84 24 20 01 00 00 	mov    0x120(%rsp),%rax
1635   85f380:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1639   85f384:	84 c0                	test   %al,%al
163b   85f386:	0f 85 99 05 00 00    	jne    85f925 <shrink_lruvec+0x1bda>
1641   85f38c:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85f392 <shrink_lruvec+0x1647>	85f38e: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
1647   85f392:	bf 01 00 00 00       	mov    $0x1,%edi
164c   85f397:	89 de                	mov    %ebx,%esi
164e   85f399:	e8 00 00 00 00       	call   85f39e <shrink_lruvec+0x1653>	85f39a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1653   85f39e:	85 db                	test   %ebx,%ebx
1655   85f3a0:	4c 89 74 24 38       	mov    %r14,0x38(%rsp)
165a   85f3a5:	7e 17                	jle    85f3be <shrink_lruvec+0x1673>
165c   85f3a7:	e8 00 00 00 00       	call   85f3ac <shrink_lruvec+0x1661>	85f3a8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1661   85f3ac:	48 8d 9c 24 40 01 00 00 	lea    0x140(%rsp),%rbx
1669   85f3b4:	48 89 df             	mov    %rbx,%rdi
166c   85f3b7:	e8 00 00 00 00       	call   85f3bc <shrink_lruvec+0x1671>	85f3b8: R_X86_64_PLT32	__mem_cgroup_uncharge_list-0x4
1671   85f3bc:	eb 0d                	jmp    85f3cb <shrink_lruvec+0x1680>
1673   85f3be:	e8 00 00 00 00       	call   85f3c3 <shrink_lruvec+0x1678>	85f3bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1678   85f3c3:	48 8d 9c 24 40 01 00 00 	lea    0x140(%rsp),%rbx
1680   85f3cb:	48 89 df             	mov    %rbx,%rdi
1683   85f3ce:	e8 00 00 00 00       	call   85f3d3 <shrink_lruvec+0x1688>	85f3cf: R_X86_64_PLT32	free_unref_page_list-0x4
1688   85f3d3:	4c 8d b4 24 b4 00 00 00 	lea    0xb4(%rsp),%r14
1690   85f3db:	49 c1 ee 03          	shr    $0x3,%r14
1694   85f3df:	43 8a 04 26          	mov    (%r14,%r12,1),%al
1698   85f3e3:	84 c0                	test   %al,%al
169a   85f3e5:	0f 85 60 05 00 00    	jne    85f94b <shrink_lruvec+0x1c00>
16a0   85f3eb:	8b 9c 24 b4 00 00 00 	mov    0xb4(%rsp),%ebx
16a7   85f3f2:	4c 89 ef             	mov    %r13,%rdi
16aa   85f3f5:	48 89 de             	mov    %rbx,%rsi
16ad   85f3f8:	e8 00 00 00 00       	call   85f3fd <shrink_lruvec+0x16b2>	85f3f9: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
16b2   85f3fd:	49 39 dd             	cmp    %rbx,%r13
16b5   85f400:	75 11                	jne    85f413 <shrink_lruvec+0x16c8>
16b7   85f402:	e8 00 00 00 00       	call   85f407 <shrink_lruvec+0x16bc>	85f403: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
16bc   85f407:	bf 01 00 00 00       	mov    $0x1,%edi
16c1   85f40c:	e8 00 00 00 00       	call   85f411 <shrink_lruvec+0x16c6>	85f40d: R_X86_64_PLT32	wakeup_flusher_threads-0x4
16c6   85f411:	eb 05                	jmp    85f418 <shrink_lruvec+0x16cd>
16c8   85f413:	e8 00 00 00 00       	call   85f418 <shrink_lruvec+0x16cd>	85f414: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
16cd   85f418:	48 8d 84 24 b0 00 00 00 	lea    0xb0(%rsp),%rax
16d5   85f420:	48 c1 e8 03          	shr    $0x3,%rax
16d9   85f424:	42 8a 04 20          	mov    (%rax,%r12,1),%al
16dd   85f428:	84 c0                	test   %al,%al
16df   85f42a:	48 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%rdx
16e7   85f432:	0f 85 3b 05 00 00    	jne    85f973 <shrink_lruvec+0x1c28>
16ed   85f438:	8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%ebx
16f4   85f43f:	48 89 d0             	mov    %rdx,%rax
16f7   85f442:	48 c1 e8 03          	shr    $0x3,%rax
16fb   85f446:	42 8a 04 20          	mov    (%rax,%r12,1),%al
16ff   85f44a:	84 c0                	test   %al,%al
1701   85f44c:	0f 85 43 05 00 00    	jne    85f995 <shrink_lruvec+0x1c4a>
1707   85f452:	01 1a                	add    %ebx,(%rdx)
1709   85f454:	48 8d 84 24 b8 00 00 00 	lea    0xb8(%rsp),%rax
1711   85f45c:	48 c1 e8 03          	shr    $0x3,%rax
1715   85f460:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1719   85f464:	84 c0                	test   %al,%al
171b   85f466:	0f 85 53 05 00 00    	jne    85f9bf <shrink_lruvec+0x1c74>
1721   85f46c:	8b 9c 24 b8 00 00 00 	mov    0xb8(%rsp),%ebx
1728   85f473:	48 8b bc 24 78 01 00 00 	mov    0x178(%rsp),%rdi
1730   85f47b:	48 89 f8             	mov    %rdi,%rax
1733   85f47e:	48 c1 e8 03          	shr    $0x3,%rax
1737   85f482:	42 8a 04 20          	mov    (%rax,%r12,1),%al
173b   85f486:	84 c0                	test   %al,%al
173d   85f488:	0f 85 59 05 00 00    	jne    85f9e7 <shrink_lruvec+0x1c9c>
1743   85f48e:	01 1f                	add    %ebx,(%rdi)
1745   85f490:	43 8a 04 26          	mov    (%r14,%r12,1),%al
1749   85f494:	84 c0                	test   %al,%al
174b   85f496:	0f 85 6d 05 00 00    	jne    85fa09 <shrink_lruvec+0x1cbe>
1751   85f49c:	44 8b b4 24 b4 00 00 00 	mov    0xb4(%rsp),%r14d
1759   85f4a4:	48 8b 9c 24 e0 01 00 00 	mov    0x1e0(%rsp),%rbx
1761   85f4ac:	48 89 d8             	mov    %rbx,%rax
1764   85f4af:	48 c1 e8 03          	shr    $0x3,%rax
1768   85f4b3:	42 8a 04 20          	mov    (%rax,%r12,1),%al
176c   85f4b7:	84 c0                	test   %al,%al
176e   85f4b9:	0f 85 72 05 00 00    	jne    85fa31 <shrink_lruvec+0x1ce6>
1774   85f4bf:	44 01 33             	add    %r14d,(%rbx)
1777   85f4c2:	48 8d 84 24 bc 00 00 00 	lea    0xbc(%rsp),%rax
177f   85f4ca:	48 c1 e8 03          	shr    $0x3,%rax
1783   85f4ce:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1787   85f4d2:	84 c0                	test   %al,%al
1789   85f4d4:	0f 85 74 05 00 00    	jne    85fa4e <shrink_lruvec+0x1d03>
178f   85f4da:	44 8b b4 24 bc 00 00 00 	mov    0xbc(%rsp),%r14d
1797   85f4e2:	48 8b 9c 24 d8 01 00 00 	mov    0x1d8(%rsp),%rbx
179f   85f4ea:	48 89 d8             	mov    %rbx,%rax
17a2   85f4ed:	48 c1 e8 03          	shr    $0x3,%rax
17a6   85f4f1:	42 8a 04 20          	mov    (%rax,%r12,1),%al
17aa   85f4f5:	84 c0                	test   %al,%al
17ac   85f4f7:	0f 85 79 05 00 00    	jne    85fa76 <shrink_lruvec+0x1d2b>
17b2   85f4fd:	44 01 33             	add    %r14d,(%rbx)
17b5   85f500:	48 8d 84 24 c0 00 00 00 	lea    0xc0(%rsp),%rax
17bd   85f508:	48 c1 e8 03          	shr    $0x3,%rax
17c1   85f50c:	42 8a 04 20          	mov    (%rax,%r12,1),%al
17c5   85f510:	84 c0                	test   %al,%al
17c7   85f512:	0f 85 7b 05 00 00    	jne    85fa93 <shrink_lruvec+0x1d48>
17cd   85f518:	44 8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%r14d
17d5   85f520:	48 8b 9c 24 d0 01 00 00 	mov    0x1d0(%rsp),%rbx
17dd   85f528:	48 89 d8             	mov    %rbx,%rax
17e0   85f52b:	48 c1 e8 03          	shr    $0x3,%rax
17e4   85f52f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
17e8   85f533:	84 c0                	test   %al,%al
17ea   85f535:	0f 85 80 05 00 00    	jne    85fabb <shrink_lruvec+0x1d70>
17f0   85f53b:	44 01 33             	add    %r14d,(%rbx)
17f3   85f53e:	48 8b 9c 24 c8 01 00 00 	mov    0x1c8(%rsp),%rbx
17fb   85f546:	48 89 d8             	mov    %rbx,%rax
17fe   85f549:	48 c1 e8 03          	shr    $0x3,%rax
1802   85f54d:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1806   85f551:	84 c0                	test   %al,%al
1808   85f553:	0f 85 7f 05 00 00    	jne    85fad8 <shrink_lruvec+0x1d8d>
180e   85f559:	44 01 2b             	add    %r13d,(%rbx)
1811   85f55c:	83 bc 24 80 00 00 00 02 	cmpl   $0x2,0x80(%rsp)
1819   85f564:	48 8b 5c 24 48       	mov    0x48(%rsp),%rbx
181e   85f569:	75 25                	jne    85f590 <shrink_lruvec+0x1845>
1820   85f56b:	e8 00 00 00 00       	call   85f570 <shrink_lruvec+0x1825>	85f56c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1825   85f570:	48 8b 94 24 58 01 00 00 	mov    0x158(%rsp),%rdx
182d   85f578:	48 89 d0             	mov    %rdx,%rax
1830   85f57b:	48 c1 e8 03          	shr    $0x3,%rax
1834   85f57f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1838   85f583:	84 c0                	test   %al,%al
183a   85f585:	0f 85 1c 06 00 00    	jne    85fba7 <shrink_lruvec+0x1e5c>
1840   85f58b:	44 01 2a             	add    %r13d,(%rdx)
1843   85f58e:	eb 05                	jmp    85f595 <shrink_lruvec+0x184a>
1845   85f590:	e8 00 00 00 00       	call   85f595 <shrink_lruvec+0x184a>	85f591: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
184a   85f595:	48 81 c3 80 1b 02 00 	add    $0x21b80,%rbx
1851   85f59c:	48 89 d8             	mov    %rbx,%rax
1854   85f59f:	48 c1 e8 03          	shr    $0x3,%rax
1858   85f5a3:	42 8a 04 20          	mov    (%rax,%r12,1),%al
185c   85f5a7:	84 c0                	test   %al,%al
185e   85f5a9:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1863   85f5ae:	0f 85 41 05 00 00    	jne    85faf5 <shrink_lruvec+0x1daa>
1869   85f5b4:	44 8b 33             	mov    (%rbx),%r14d
186c   85f5b7:	48 8b 84 24 80 01 00 00 	mov    0x180(%rsp),%rax
1874   85f5bf:	42 8a 04 20          	mov    (%rax,%r12,1),%al
1878   85f5c3:	84 c0                	test   %al,%al
187a   85f5c5:	0f 85 4c 05 00 00    	jne    85fb17 <shrink_lruvec+0x1dcc>
1880   85f5cb:	44 0f be 3a          	movsbl (%rdx),%r15d
1884   85f5cf:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85f5d5 <shrink_lruvec+0x188a>	85f5d1: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x4
188a   85f5d5:	31 ff                	xor    %edi,%edi
188c   85f5d7:	89 de                	mov    %ebx,%esi
188e   85f5d9:	e8 00 00 00 00       	call   85f5de <shrink_lruvec+0x1893>	85f5da: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1893   85f5de:	85 db                	test   %ebx,%ebx
1895   85f5e0:	0f 8e f3 00 00 00    	jle    85f6d9 <shrink_lruvec+0x198e>
189b   85f5e6:	4c 89 e0             	mov    %r12,%rax
189e   85f5e9:	65 44 8b 25 00 00 00 00 	mov    %gs:0x0(%rip),%r12d        # 85f5f1 <shrink_lruvec+0x18a6>	85f5ed: R_X86_64_PC32	cpu_number-0x4
18a6   85f5f1:	48 8b 8c 24 10 01 00 00 	mov    0x110(%rsp),%rcx
18ae   85f5f9:	8a 04 01             	mov    (%rcx,%rax,1),%al
18b1   85f5fc:	84 c0                	test   %al,%al
18b3   85f5fe:	0f 85 7d 05 00 00    	jne    85fb81 <shrink_lruvec+0x1e36>
18b9   85f604:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85f60a <shrink_lruvec+0x18bf>	85f606: R_X86_64_PC32	nr_cpu_ids-0x4
18bf   85f60a:	89 df                	mov    %ebx,%edi
18c1   85f60c:	44 89 e6             	mov    %r12d,%esi
18c4   85f60f:	e8 00 00 00 00       	call   85f614 <shrink_lruvec+0x18c9>	85f610: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
18c9   85f614:	44 39 e3             	cmp    %r12d,%ebx
18cc   85f617:	0f 86 26 02 00 00    	jbe    85f843 <shrink_lruvec+0x1af8>
18d2   85f61d:	e8 00 00 00 00       	call   85f622 <shrink_lruvec+0x18d7>	85f61e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18d7   85f622:	44 89 e0             	mov    %r12d,%eax
18da   85f625:	c1 e8 06             	shr    $0x6,%eax
18dd   85f628:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	85f62c: R_X86_64_32S	__cpu_online_mask
18e5   85f630:	be 08 00 00 00       	mov    $0x8,%esi
18ea   85f635:	e8 00 00 00 00       	call   85f63a <shrink_lruvec+0x18ef>	85f636: R_X86_64_PLT32	__kasan_check_read-0x4
18ef   85f63a:	44 89 e0             	mov    %r12d,%eax
18f2   85f63d:	31 db                	xor    %ebx,%ebx
18f4   85f63f:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 85f647 <shrink_lruvec+0x18fc>	85f643: R_X86_64_PC32	__cpu_online_mask-0x4
18fc   85f647:	41 0f 92 c4          	setb   %r12b
1900   85f64b:	0f 92 c3             	setb   %bl
1903   85f64e:	bf 02 00 00 00       	mov    $0x2,%edi
1908   85f653:	89 de                	mov    %ebx,%esi
190a   85f655:	e8 00 00 00 00       	call   85f65a <shrink_lruvec+0x190f>	85f656: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
190f   85f65a:	31 ff                	xor    %edi,%edi
1911   85f65c:	89 de                	mov    %ebx,%esi
1913   85f65e:	e8 00 00 00 00       	call   85f663 <shrink_lruvec+0x1918>	85f65f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1918   85f663:	45 84 e4             	test   %r12b,%r12b
191b   85f666:	74 78                	je     85f6e0 <shrink_lruvec+0x1995>
191d   85f668:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 85f66f <shrink_lruvec+0x1924>	85f66b: R_X86_64_PC32	__preempt_count-0x4
1924   85f66f:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 85f676 <shrink_lruvec+0x192b>	85f672: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
192b   85f676:	48 85 db             	test   %rbx,%rbx
192e   85f679:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
1938   85f683:	74 7c                	je     85f701 <shrink_lruvec+0x19b6>
193a   85f685:	e8 00 00 00 00       	call   85f68a <shrink_lruvec+0x193f>	85f686: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
193f   85f68a:	48 83 c3 08          	add    $0x8,%rbx
1943   85f68e:	48 89 d8             	mov    %rbx,%rax
1946   85f691:	48 c1 e8 03          	shr    $0x3,%rax
194a   85f695:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
194f   85f69a:	74 08                	je     85f6a4 <shrink_lruvec+0x1959>
1951   85f69c:	48 89 df             	mov    %rbx,%rdi
1954   85f69f:	e8 00 00 00 00       	call   85f6a4 <shrink_lruvec+0x1959>	85f6a0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1959   85f6a4:	31 c0                	xor    %eax,%eax
195b   85f6a6:	8a 8c 24 28 01 00 00 	mov    0x128(%rsp),%cl
1962   85f6ad:	88 c8                	mov    %cl,%al
1964   85f6af:	48 8b 3b             	mov    (%rbx),%rdi
1967   85f6b2:	44 89 f6             	mov    %r14d,%esi
196a   85f6b5:	48 8b 94 24 a0 00 00 00 	mov    0xa0(%rsp),%rdx
1972   85f6bd:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
1977   85f6c2:	4c 8d 84 24 b0 00 00 00 	lea    0xb0(%rsp),%r8
197f   85f6ca:	45 89 f9             	mov    %r15d,%r9d
1982   85f6cd:	50                   	push   %rax
1983   85f6ce:	e8 00 00 00 00       	call   85f6d3 <shrink_lruvec+0x1988>	85f6cf: R_X86_64_PLT32	__SCT__tp_func_mm_vmscan_lru_shrink_inactive-0x4
1988   85f6d3:	48 83 c4 08          	add    $0x8,%rsp
198c   85f6d7:	eb 2d                	jmp    85f706 <shrink_lruvec+0x19bb>
198e   85f6d9:	e8 00 00 00 00       	call   85f6de <shrink_lruvec+0x1993>	85f6da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1993   85f6de:	eb 2d                	jmp    85f70d <shrink_lruvec+0x19c2>
1995   85f6e0:	e8 00 00 00 00       	call   85f6e5 <shrink_lruvec+0x199a>	85f6e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
199a   85f6e5:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
19a4   85f6ef:	4c 8d ac 24 e8 00 00 00 	lea    0xe8(%rsp),%r13
19ac   85f6f7:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
19b1   85f6fc:	e9 d6 00 00 00       	jmp    85f7d7 <shrink_lruvec+0x1a8c>
19b6   85f701:	e8 00 00 00 00       	call   85f706 <shrink_lruvec+0x19bb>	85f702: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19bb   85f706:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 85f70d <shrink_lruvec+0x19c2>	85f709: R_X86_64_PC32	__preempt_count-0x4
19c2   85f70d:	4c 8d ac 24 e8 00 00 00 	lea    0xe8(%rsp),%r13
19ca   85f715:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
19cf   85f71a:	65 44 8b 35 00 00 00 00 	mov    %gs:0x0(%rip),%r14d        # 85f722 <shrink_lruvec+0x19d7>	85f71e: R_X86_64_PC32	cpu_number-0x4
19d7   85f722:	48 8b 84 24 10 01 00 00 	mov    0x110(%rsp),%rax
19df   85f72a:	42 8a 04 20          	mov    (%rax,%r12,1),%al
19e3   85f72e:	84 c0                	test   %al,%al
19e5   85f730:	0f 85 25 04 00 00    	jne    85fb5b <shrink_lruvec+0x1e10>
19eb   85f736:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 85f73c <shrink_lruvec+0x19f1>	85f738: R_X86_64_PC32	nr_cpu_ids-0x4
19f1   85f73c:	89 df                	mov    %ebx,%edi
19f3   85f73e:	44 89 f6             	mov    %r14d,%esi
19f6   85f741:	e8 00 00 00 00       	call   85f746 <shrink_lruvec+0x19fb>	85f742: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
19fb   85f746:	44 39 f3             	cmp    %r14d,%ebx
19fe   85f749:	0f 86 e8 00 00 00    	jbe    85f837 <shrink_lruvec+0x1aec>
1a04   85f74f:	e8 00 00 00 00       	call   85f754 <shrink_lruvec+0x1a09>	85f750: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a09   85f754:	44 89 f0             	mov    %r14d,%eax
1a0c   85f757:	c1 e8 06             	shr    $0x6,%eax
1a0f   85f75a:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	85f75e: R_X86_64_32S	__cpu_online_mask
1a17   85f762:	be 08 00 00 00       	mov    $0x8,%esi
1a1c   85f767:	e8 00 00 00 00       	call   85f76c <shrink_lruvec+0x1a21>	85f768: R_X86_64_PLT32	__kasan_check_read-0x4
1a21   85f76c:	44 89 f0             	mov    %r14d,%eax
1a24   85f76f:	31 db                	xor    %ebx,%ebx
1a26   85f771:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 85f779 <shrink_lruvec+0x1a2e>	85f775: R_X86_64_PC32	__cpu_online_mask-0x4
1a2e   85f779:	41 0f 92 c6          	setb   %r14b
1a32   85f77d:	0f 92 c3             	setb   %bl
1a35   85f780:	bf 02 00 00 00       	mov    $0x2,%edi
1a3a   85f785:	89 de                	mov    %ebx,%esi
1a3c   85f787:	e8 00 00 00 00       	call   85f78c <shrink_lruvec+0x1a41>	85f788: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1a41   85f78c:	31 ff                	xor    %edi,%edi
1a43   85f78e:	89 de                	mov    %ebx,%esi
1a45   85f790:	e8 00 00 00 00       	call   85f795 <shrink_lruvec+0x1a4a>	85f791: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1a4a   85f795:	45 84 f6             	test   %r14b,%r14b
1a4d   85f798:	74 38                	je     85f7d2 <shrink_lruvec+0x1a87>
1a4f   85f79a:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 85f7a1 <shrink_lruvec+0x1a56>	85f79d: R_X86_64_PC32	__preempt_count-0x4
1a56   85f7a1:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 85f7a8 <shrink_lruvec+0x1a5d>	85f7a4: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
1a5d   85f7a8:	e8 00 00 00 00       	call   85f7ad <shrink_lruvec+0x1a62>	85f7a9: R_X86_64_PLT32	rcu_read_lock_sched_held-0x4
1a62   85f7ad:	89 c3                	mov    %eax,%ebx
1a64   85f7af:	31 ff                	xor    %edi,%edi
1a66   85f7b1:	89 c6                	mov    %eax,%esi
1a68   85f7b3:	e8 00 00 00 00       	call   85f7b8 <shrink_lruvec+0x1a6d>	85f7b4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1a6d   85f7b8:	85 db                	test   %ebx,%ebx
1a6f   85f7ba:	74 25                	je     85f7e1 <shrink_lruvec+0x1a96>
1a71   85f7bc:	e8 00 00 00 00       	call   85f7c1 <shrink_lruvec+0x1a76>	85f7bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a76   85f7c1:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
1a7b   85f7c6:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 85f7cd <shrink_lruvec+0x1a82>	85f7c9: R_X86_64_PC32	__preempt_count-0x4
1a82   85f7cd:	e9 c0 f8 ff ff       	jmp    85f092 <shrink_lruvec+0x1347>
1a87   85f7d2:	e8 00 00 00 00       	call   85f7d7 <shrink_lruvec+0x1a8c>	85f7d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a8c   85f7d7:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
1a91   85f7dc:	e9 b1 f8 ff ff       	jmp    85f092 <shrink_lruvec+0x1347>
1a96   85f7e1:	e8 00 00 00 00       	call   85f7e6 <shrink_lruvec+0x1a9b>	85f7e2: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
1a9b   85f7e6:	89 c3                	mov    %eax,%ebx
1a9d   85f7e8:	31 ff                	xor    %edi,%edi
1a9f   85f7ea:	89 c6                	mov    %eax,%esi
1aa1   85f7ec:	e8 00 00 00 00       	call   85f7f1 <shrink_lruvec+0x1aa6>	85f7ed: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1aa6   85f7f1:	85 db                	test   %ebx,%ebx
1aa8   85f7f3:	48 8b 5c 24 38       	mov    0x38(%rsp),%rbx
1aad   85f7f8:	74 10                	je     85f80a <shrink_lruvec+0x1abf>
1aaf   85f7fa:	80 3d 00 00 00 00 01 	cmpb   $0x1,0x0(%rip)        # 85f801 <shrink_lruvec+0x1ab6>	85f7fc: R_X86_64_PC32	.data.unlikely+0x30b
1ab6   85f801:	75 0e                	jne    85f811 <shrink_lruvec+0x1ac6>
1ab8   85f803:	e8 00 00 00 00       	call   85f808 <shrink_lruvec+0x1abd>	85f804: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1abd   85f808:	eb bc                	jmp    85f7c6 <shrink_lruvec+0x1a7b>
1abf   85f80a:	e8 00 00 00 00       	call   85f80f <shrink_lruvec+0x1ac4>	85f80b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ac4   85f80f:	eb b5                	jmp    85f7c6 <shrink_lruvec+0x1a7b>
1ac6   85f811:	e8 00 00 00 00       	call   85f816 <shrink_lruvec+0x1acb>	85f812: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1acb   85f816:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 85f81d <shrink_lruvec+0x1ad2>	85f818: R_X86_64_PC32	.data.unlikely+0x30b
1ad2   85f81d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85f820: R_X86_64_32S	.rodata+0x4f2860
1ad9   85f824:	be 92 01 00 00       	mov    $0x192,%esi
1ade   85f829:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	85f82c: R_X86_64_32S	.rodata+0x4f0200
1ae5   85f830:	e8 00 00 00 00       	call   85f835 <shrink_lruvec+0x1aea>	85f831: R_X86_64_PLT32	lockdep_rcu_suspicious-0x4
1aea   85f835:	eb 8f                	jmp    85f7c6 <shrink_lruvec+0x1a7b>
1aec   85f837:	e8 00 00 00 00       	call   85f83c <shrink_lruvec+0x1af1>	85f838: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1af1   85f83c:	0f 0b                	ud2
1af3   85f83e:	e9 11 ff ff ff       	jmp    85f754 <shrink_lruvec+0x1a09>
1af8   85f843:	e8 00 00 00 00       	call   85f848 <shrink_lruvec+0x1afd>	85f844: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1afd   85f848:	0f 0b                	ud2
1aff   85f84a:	e9 d3 fd ff ff       	jmp    85f622 <shrink_lruvec+0x18d7>
1b04   85f84f:	89 d1                	mov    %edx,%ecx
1b06   85f851:	80 e1 07             	and    $0x7,%cl
1b09   85f854:	fe c1                	inc    %cl
1b0b   85f856:	38 c1                	cmp    %al,%cl
1b0d   85f858:	0f 8c 1d f4 ff ff    	jl     85ec7b <shrink_lruvec+0xf30>
1b13   85f85e:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
1b18   85f863:	e8 00 00 00 00       	call   85f868 <shrink_lruvec+0x1b1d>	85f864: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1b1d   85f868:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1b22   85f86d:	e9 09 f4 ff ff       	jmp    85ec7b <shrink_lruvec+0xf30>
1b27   85f872:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
1b2c   85f877:	80 e1 07             	and    $0x7,%cl
1b2f   85f87a:	80 c1 03             	add    $0x3,%cl
1b32   85f87d:	38 c1                	cmp    %al,%cl
1b34   85f87f:	0f 8c b3 f8 ff ff    	jl     85f138 <shrink_lruvec+0x13ed>
1b3a   85f885:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
1b3f   85f88a:	e8 00 00 00 00       	call   85f88f <shrink_lruvec+0x1b44>	85f88b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1b44   85f88f:	e9 a4 f8 ff ff       	jmp    85f138 <shrink_lruvec+0x13ed>
1b49   85f894:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85f897: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1b50   85f89b:	80 e1 07             	and    $0x7,%cl
1b53   85f89e:	80 c1 03             	add    $0x3,%cl
1b56   85f8a1:	38 c1                	cmp    %al,%cl
1b58   85f8a3:	0f 8c be f8 ff ff    	jl     85f167 <shrink_lruvec+0x141c>
1b5e   85f8a9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85f8ac: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1b65   85f8b0:	e8 00 00 00 00       	call   85f8b5 <shrink_lruvec+0x1b6a>	85f8b1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1b6a   85f8b5:	e9 ad f8 ff ff       	jmp    85f167 <shrink_lruvec+0x141c>
1b6f   85f8ba:	89 d9                	mov    %ebx,%ecx
1b71   85f8bc:	80 e1 07             	and    $0x7,%cl
1b74   85f8bf:	80 c1 03             	add    $0x3,%cl
1b77   85f8c2:	38 c1                	cmp    %al,%cl
1b79   85f8c4:	0f 8c c9 f9 ff ff    	jl     85f293 <shrink_lruvec+0x1548>
1b7f   85f8ca:	48 89 df             	mov    %rbx,%rdi
1b82   85f8cd:	e8 00 00 00 00       	call   85f8d2 <shrink_lruvec+0x1b87>	85f8ce: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1b87   85f8d2:	e9 bc f9 ff ff       	jmp    85f293 <shrink_lruvec+0x1548>
1b8c   85f8d7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85f8da: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1b93   85f8de:	80 e1 07             	and    $0x7,%cl
1b96   85f8e1:	80 c1 03             	add    $0x3,%cl
1b99   85f8e4:	38 c1                	cmp    %al,%cl
1b9b   85f8e6:	0f 8c d1 f9 ff ff    	jl     85f2bd <shrink_lruvec+0x1572>
1ba1   85f8ec:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85f8ef: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1ba8   85f8f3:	e8 00 00 00 00       	call   85f8f8 <shrink_lruvec+0x1bad>	85f8f4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1bad   85f8f8:	e9 c0 f9 ff ff       	jmp    85f2bd <shrink_lruvec+0x1572>
1bb2   85f8fd:	48 8d 8c 24 c4 00 00 00 	lea    0xc4(%rsp),%rcx
1bba   85f905:	80 e1 07             	and    $0x7,%cl
1bbd   85f908:	80 c1 03             	add    $0x3,%cl
1bc0   85f90b:	38 c1                	cmp    %al,%cl
1bc2   85f90d:	0f 8c 46 fa ff ff    	jl     85f359 <shrink_lruvec+0x160e>
1bc8   85f913:	48 8d bc 24 c4 00 00 00 	lea    0xc4(%rsp),%rdi
1bd0   85f91b:	e8 00 00 00 00       	call   85f920 <shrink_lruvec+0x1bd5>	85f91c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1bd5   85f920:	e9 34 fa ff ff       	jmp    85f359 <shrink_lruvec+0x160e>
1bda   85f925:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85f928: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1be1   85f92c:	80 e1 07             	and    $0x7,%cl
1be4   85f92f:	80 c1 03             	add    $0x3,%cl
1be7   85f932:	38 c1                	cmp    %al,%cl
1be9   85f934:	0f 8c 52 fa ff ff    	jl     85f38c <shrink_lruvec+0x1641>
1bef   85f93a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85f93d: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1bf6   85f941:	e8 00 00 00 00       	call   85f946 <shrink_lruvec+0x1bfb>	85f942: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1bfb   85f946:	e9 41 fa ff ff       	jmp    85f38c <shrink_lruvec+0x1641>
1c00   85f94b:	48 8d 8c 24 b4 00 00 00 	lea    0xb4(%rsp),%rcx
1c08   85f953:	80 e1 07             	and    $0x7,%cl
1c0b   85f956:	80 c1 03             	add    $0x3,%cl
1c0e   85f959:	38 c1                	cmp    %al,%cl
1c10   85f95b:	0f 8c 8a fa ff ff    	jl     85f3eb <shrink_lruvec+0x16a0>
1c16   85f961:	48 8d bc 24 b4 00 00 00 	lea    0xb4(%rsp),%rdi
1c1e   85f969:	e8 00 00 00 00       	call   85f96e <shrink_lruvec+0x1c23>	85f96a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c23   85f96e:	e9 78 fa ff ff       	jmp    85f3eb <shrink_lruvec+0x16a0>
1c28   85f973:	3c 03                	cmp    $0x3,%al
1c2a   85f975:	0f 8f bd fa ff ff    	jg     85f438 <shrink_lruvec+0x16ed>
1c30   85f97b:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
1c38   85f983:	e8 00 00 00 00       	call   85f988 <shrink_lruvec+0x1c3d>	85f984: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c3d   85f988:	48 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%rdx
1c45   85f990:	e9 a3 fa ff ff       	jmp    85f438 <shrink_lruvec+0x16ed>
1c4a   85f995:	89 d1                	mov    %edx,%ecx
1c4c   85f997:	80 e1 07             	and    $0x7,%cl
1c4f   85f99a:	80 c1 03             	add    $0x3,%cl
1c52   85f99d:	38 c1                	cmp    %al,%cl
1c54   85f99f:	0f 8c ad fa ff ff    	jl     85f452 <shrink_lruvec+0x1707>
1c5a   85f9a5:	48 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%rdi
1c62   85f9ad:	e8 00 00 00 00       	call   85f9b2 <shrink_lruvec+0x1c67>	85f9ae: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c67   85f9b2:	48 8b 94 24 a8 00 00 00 	mov    0xa8(%rsp),%rdx
1c6f   85f9ba:	e9 93 fa ff ff       	jmp    85f452 <shrink_lruvec+0x1707>
1c74   85f9bf:	48 8d 8c 24 b8 00 00 00 	lea    0xb8(%rsp),%rcx
1c7c   85f9c7:	80 e1 07             	and    $0x7,%cl
1c7f   85f9ca:	80 c1 03             	add    $0x3,%cl
1c82   85f9cd:	38 c1                	cmp    %al,%cl
1c84   85f9cf:	0f 8c 97 fa ff ff    	jl     85f46c <shrink_lruvec+0x1721>
1c8a   85f9d5:	48 8d bc 24 b8 00 00 00 	lea    0xb8(%rsp),%rdi
1c92   85f9dd:	e8 00 00 00 00       	call   85f9e2 <shrink_lruvec+0x1c97>	85f9de: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1c97   85f9e2:	e9 85 fa ff ff       	jmp    85f46c <shrink_lruvec+0x1721>
1c9c   85f9e7:	89 f9                	mov    %edi,%ecx
1c9e   85f9e9:	80 e1 07             	and    $0x7,%cl
1ca1   85f9ec:	80 c1 03             	add    $0x3,%cl
1ca4   85f9ef:	38 c1                	cmp    %al,%cl
1ca6   85f9f1:	0f 8c 97 fa ff ff    	jl     85f48e <shrink_lruvec+0x1743>
1cac   85f9f7:	e8 00 00 00 00       	call   85f9fc <shrink_lruvec+0x1cb1>	85f9f8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1cb1   85f9fc:	48 8b bc 24 78 01 00 00 	mov    0x178(%rsp),%rdi
1cb9   85fa04:	e9 85 fa ff ff       	jmp    85f48e <shrink_lruvec+0x1743>
1cbe   85fa09:	48 8d 8c 24 b4 00 00 00 	lea    0xb4(%rsp),%rcx
1cc6   85fa11:	80 e1 07             	and    $0x7,%cl
1cc9   85fa14:	80 c1 03             	add    $0x3,%cl
1ccc   85fa17:	38 c1                	cmp    %al,%cl
1cce   85fa19:	0f 8c 7d fa ff ff    	jl     85f49c <shrink_lruvec+0x1751>
1cd4   85fa1f:	48 8d bc 24 b4 00 00 00 	lea    0xb4(%rsp),%rdi
1cdc   85fa27:	e8 00 00 00 00       	call   85fa2c <shrink_lruvec+0x1ce1>	85fa28: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1ce1   85fa2c:	e9 6b fa ff ff       	jmp    85f49c <shrink_lruvec+0x1751>
1ce6   85fa31:	89 d9                	mov    %ebx,%ecx
1ce8   85fa33:	80 e1 07             	and    $0x7,%cl
1ceb   85fa36:	80 c1 03             	add    $0x3,%cl
1cee   85fa39:	38 c1                	cmp    %al,%cl
1cf0   85fa3b:	0f 8c 7e fa ff ff    	jl     85f4bf <shrink_lruvec+0x1774>
1cf6   85fa41:	48 89 df             	mov    %rbx,%rdi
1cf9   85fa44:	e8 00 00 00 00       	call   85fa49 <shrink_lruvec+0x1cfe>	85fa45: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1cfe   85fa49:	e9 71 fa ff ff       	jmp    85f4bf <shrink_lruvec+0x1774>
1d03   85fa4e:	48 8d 8c 24 bc 00 00 00 	lea    0xbc(%rsp),%rcx
1d0b   85fa56:	80 e1 07             	and    $0x7,%cl
1d0e   85fa59:	80 c1 03             	add    $0x3,%cl
1d11   85fa5c:	38 c1                	cmp    %al,%cl
1d13   85fa5e:	0f 8c 76 fa ff ff    	jl     85f4da <shrink_lruvec+0x178f>
1d19   85fa64:	48 8d bc 24 bc 00 00 00 	lea    0xbc(%rsp),%rdi
1d21   85fa6c:	e8 00 00 00 00       	call   85fa71 <shrink_lruvec+0x1d26>	85fa6d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1d26   85fa71:	e9 64 fa ff ff       	jmp    85f4da <shrink_lruvec+0x178f>
1d2b   85fa76:	89 d9                	mov    %ebx,%ecx
1d2d   85fa78:	80 e1 07             	and    $0x7,%cl
1d30   85fa7b:	80 c1 03             	add    $0x3,%cl
1d33   85fa7e:	38 c1                	cmp    %al,%cl
1d35   85fa80:	0f 8c 77 fa ff ff    	jl     85f4fd <shrink_lruvec+0x17b2>
1d3b   85fa86:	48 89 df             	mov    %rbx,%rdi
1d3e   85fa89:	e8 00 00 00 00       	call   85fa8e <shrink_lruvec+0x1d43>	85fa8a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1d43   85fa8e:	e9 6a fa ff ff       	jmp    85f4fd <shrink_lruvec+0x17b2>
1d48   85fa93:	48 8d 8c 24 c0 00 00 00 	lea    0xc0(%rsp),%rcx
1d50   85fa9b:	80 e1 07             	and    $0x7,%cl
1d53   85fa9e:	80 c1 03             	add    $0x3,%cl
1d56   85faa1:	38 c1                	cmp    %al,%cl
1d58   85faa3:	0f 8c 6f fa ff ff    	jl     85f518 <shrink_lruvec+0x17cd>
1d5e   85faa9:	48 8d bc 24 c0 00 00 00 	lea    0xc0(%rsp),%rdi
1d66   85fab1:	e8 00 00 00 00       	call   85fab6 <shrink_lruvec+0x1d6b>	85fab2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1d6b   85fab6:	e9 5d fa ff ff       	jmp    85f518 <shrink_lruvec+0x17cd>
1d70   85fabb:	89 d9                	mov    %ebx,%ecx
1d72   85fabd:	80 e1 07             	and    $0x7,%cl
1d75   85fac0:	80 c1 03             	add    $0x3,%cl
1d78   85fac3:	38 c1                	cmp    %al,%cl
1d7a   85fac5:	0f 8c 70 fa ff ff    	jl     85f53b <shrink_lruvec+0x17f0>
1d80   85facb:	48 89 df             	mov    %rbx,%rdi
1d83   85face:	e8 00 00 00 00       	call   85fad3 <shrink_lruvec+0x1d88>	85facf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1d88   85fad3:	e9 63 fa ff ff       	jmp    85f53b <shrink_lruvec+0x17f0>
1d8d   85fad8:	89 d9                	mov    %ebx,%ecx
1d8f   85fada:	80 e1 07             	and    $0x7,%cl
1d92   85fadd:	80 c1 03             	add    $0x3,%cl
1d95   85fae0:	38 c1                	cmp    %al,%cl
1d97   85fae2:	0f 8c 71 fa ff ff    	jl     85f559 <shrink_lruvec+0x180e>
1d9d   85fae8:	48 89 df             	mov    %rbx,%rdi
1da0   85faeb:	e8 00 00 00 00       	call   85faf0 <shrink_lruvec+0x1da5>	85faec: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1da5   85faf0:	e9 64 fa ff ff       	jmp    85f559 <shrink_lruvec+0x180e>
1daa   85faf5:	89 d9                	mov    %ebx,%ecx
1dac   85faf7:	80 e1 07             	and    $0x7,%cl
1daf   85fafa:	80 c1 03             	add    $0x3,%cl
1db2   85fafd:	38 c1                	cmp    %al,%cl
1db4   85faff:	0f 8c af fa ff ff    	jl     85f5b4 <shrink_lruvec+0x1869>
1dba   85fb05:	48 89 df             	mov    %rbx,%rdi
1dbd   85fb08:	e8 00 00 00 00       	call   85fb0d <shrink_lruvec+0x1dc2>	85fb09: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1dc2   85fb0d:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1dc7   85fb12:	e9 9d fa ff ff       	jmp    85f5b4 <shrink_lruvec+0x1869>
1dcc   85fb17:	89 d1                	mov    %edx,%ecx
1dce   85fb19:	80 e1 07             	and    $0x7,%cl
1dd1   85fb1c:	38 c1                	cmp    %al,%cl
1dd3   85fb1e:	0f 8c a7 fa ff ff    	jl     85f5cb <shrink_lruvec+0x1880>
1dd9   85fb24:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1dde   85fb29:	e8 00 00 00 00       	call   85fb2e <shrink_lruvec+0x1de3>	85fb2a: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
1de3   85fb2e:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
1de8   85fb33:	e9 93 fa ff ff       	jmp    85f5cb <shrink_lruvec+0x1880>
1ded   85fb38:	89 d1                	mov    %edx,%ecx
1def   85fb3a:	80 e1 07             	and    $0x7,%cl
1df2   85fb3d:	fe c1                	inc    %cl
1df4   85fb3f:	38 c1                	cmp    %al,%cl
1df6   85fb41:	0f 8c bd f4 ff ff    	jl     85f004 <shrink_lruvec+0x12b9>
1dfc   85fb47:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
1e01   85fb4c:	e8 00 00 00 00       	call   85fb51 <shrink_lruvec+0x1e06>	85fb4d: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
1e06   85fb51:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
1e0b   85fb56:	e9 a9 f4 ff ff       	jmp    85f004 <shrink_lruvec+0x12b9>
1e10   85fb5b:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85fb5e: R_X86_64_32S	nr_cpu_ids
1e17   85fb62:	80 e1 07             	and    $0x7,%cl
1e1a   85fb65:	80 c1 03             	add    $0x3,%cl
1e1d   85fb68:	38 c1                	cmp    %al,%cl
1e1f   85fb6a:	0f 8c c6 fb ff ff    	jl     85f736 <shrink_lruvec+0x19eb>
1e25   85fb70:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85fb73: R_X86_64_32S	nr_cpu_ids
1e2c   85fb77:	e8 00 00 00 00       	call   85fb7c <shrink_lruvec+0x1e31>	85fb78: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1e31   85fb7c:	e9 b5 fb ff ff       	jmp    85f736 <shrink_lruvec+0x19eb>
1e36   85fb81:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	85fb84: R_X86_64_32S	nr_cpu_ids
1e3d   85fb88:	80 e1 07             	and    $0x7,%cl
1e40   85fb8b:	80 c1 03             	add    $0x3,%cl
1e43   85fb8e:	38 c1                	cmp    %al,%cl
1e45   85fb90:	0f 8c 6e fa ff ff    	jl     85f604 <shrink_lruvec+0x18b9>
1e4b   85fb96:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85fb99: R_X86_64_32S	nr_cpu_ids
1e52   85fb9d:	e8 00 00 00 00       	call   85fba2 <shrink_lruvec+0x1e57>	85fb9e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1e57   85fba2:	e9 5d fa ff ff       	jmp    85f604 <shrink_lruvec+0x18b9>
1e5c   85fba7:	89 d1                	mov    %edx,%ecx
1e5e   85fba9:	80 e1 07             	and    $0x7,%cl
1e61   85fbac:	80 c1 03             	add    $0x3,%cl
1e64   85fbaf:	38 c1                	cmp    %al,%cl
1e66   85fbb1:	0f 8c d4 f9 ff ff    	jl     85f58b <shrink_lruvec+0x1840>
1e6c   85fbb7:	48 8b bc 24 58 01 00 00 	mov    0x158(%rsp),%rdi
1e74   85fbbf:	e8 00 00 00 00       	call   85fbc4 <shrink_lruvec+0x1e79>	85fbc0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1e79   85fbc4:	48 8b 94 24 58 01 00 00 	mov    0x158(%rsp),%rdx
1e81   85fbcc:	e9 ba f9 ff ff       	jmp    85f58b <shrink_lruvec+0x1840>
1e86   85fbd1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	85fbd4: R_X86_64_32S	.rodata+0x4f01e0
1e8d   85fbd8:	be 7a 0b 00 00       	mov    $0xb7a,%esi
1e92   85fbdd:	31 d2                	xor    %edx,%edx
1e94   85fbdf:	e8 00 00 00 00       	call   85fbe4 <shrink_lruvec+0x1e99>	85fbe0: R_X86_64_PLT32	__might_resched-0x4
1e99   85fbe4:	e8 00 00 00 00       	call   85fbe9 <shrink_lruvec+0x1e9e>	85fbe5: R_X86_64_PLT32	__cond_resched-0x4
1e9e   85fbe9:	4c 8b b4 24 98 00 00 00 	mov    0x98(%rsp),%r14
1ea6   85fbf1:	4c 89 f7             	mov    %r14,%rdi
1ea9   85fbf4:	48 8b 9c 24 c0 01 00 00 	mov    0x1c0(%rsp),%rbx
1eb1   85fbfc:	48 89 de             	mov    %rbx,%rsi
1eb4   85fbff:	e8 00 00 00 00       	call   85fc04 <shrink_lruvec+0x1eb9>	85fc00: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1eb9   85fc04:	49 39 de             	cmp    %rbx,%r14
1ebc   85fc07:	72 0a                	jb     85fc13 <shrink_lruvec+0x1ec8>
1ebe   85fc09:	80 bc 24 6c 01 00 00 00 	cmpb   $0x0,0x16c(%rsp)
1ec6   85fc11:	74 0f                	je     85fc22 <shrink_lruvec+0x1ed7>
1ec8   85fc13:	e8 00 00 00 00       	call   85fc18 <shrink_lruvec+0x1ecd>	85fc14: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ecd   85fc18:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
1ed2   85fc1d:	e9 07 ef ff ff       	jmp    85eb29 <shrink_lruvec+0xdde>
1ed7   85fc22:	48 8d bc 24 f0 00 00 00 	lea    0xf0(%rsp),%rdi
1edf   85fc2a:	48 89 f8             	mov    %rdi,%rax
1ee2   85fc2d:	48 c1 e8 03          	shr    $0x3,%rax
1ee6   85fc31:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1eeb   85fc36:	48 8d 9c 24 f8 00 00 00 	lea    0xf8(%rsp),%rbx
1ef3   85fc3e:	74 05                	je     85fc45 <shrink_lruvec+0x1efa>
1ef5   85fc40:	e8 00 00 00 00       	call   85fc45 <shrink_lruvec+0x1efa>	85fc41: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1efa   85fc45:	4c 8b b4 24 f0 00 00 00 	mov    0xf0(%rsp),%r14
1f02   85fc4d:	48 89 d8             	mov    %rbx,%rax
1f05   85fc50:	48 c1 e8 03          	shr    $0x3,%rax
1f09   85fc54:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1f0e   85fc59:	74 08                	je     85fc63 <shrink_lruvec+0x1f18>
1f10   85fc5b:	48 89 df             	mov    %rbx,%rdi
1f13   85fc5e:	e8 00 00 00 00       	call   85fc63 <shrink_lruvec+0x1f18>	85fc5f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f18   85fc63:	4c 03 b4 24 f8 00 00 00 	add    0xf8(%rsp),%r14
1f20   85fc6b:	48 8b 84 24 70 01 00 00 	mov    0x170(%rsp),%rax
1f28   85fc73:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1f2d   85fc78:	74 0d                	je     85fc87 <shrink_lruvec+0x1f3c>
1f2f   85fc7a:	48 8d bc 24 e0 00 00 00 	lea    0xe0(%rsp),%rdi
1f37   85fc82:	e8 00 00 00 00       	call   85fc87 <shrink_lruvec+0x1f3c>	85fc83: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f3c   85fc87:	48 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%rbx
1f44   85fc8f:	4c 89 e8             	mov    %r13,%rax
1f47   85fc92:	48 c1 e8 03          	shr    $0x3,%rax
1f4b   85fc96:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1f50   85fc9b:	74 08                	je     85fca5 <shrink_lruvec+0x1f5a>
1f52   85fc9d:	4c 89 ef             	mov    %r13,%rdi
1f55   85fca0:	e8 00 00 00 00       	call   85fca5 <shrink_lruvec+0x1f5a>	85fca1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f5a   85fca5:	48 03 9c 24 e8 00 00 00 	add    0xe8(%rsp),%rbx
1f62   85fcad:	31 ff                	xor    %edi,%edi
1f64   85fcaf:	4c 89 f6             	mov    %r14,%rsi
1f67   85fcb2:	e8 00 00 00 00       	call   85fcb7 <shrink_lruvec+0x1f6c>	85fcb3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1f6c   85fcb7:	31 ff                	xor    %edi,%edi
1f6e   85fcb9:	48 89 de             	mov    %rbx,%rsi
1f71   85fcbc:	e8 00 00 00 00       	call   85fcc1 <shrink_lruvec+0x1f76>	85fcbd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1f76   85fcc1:	4d 85 f6             	test   %r14,%r14
1f79   85fcc4:	0f 84 36 03 00 00    	je     860000 <shrink_lruvec+0x22b5>
1f7f   85fcca:	48 85 db             	test   %rbx,%rbx
1f82   85fccd:	0f 84 2d 03 00 00    	je     860000 <shrink_lruvec+0x22b5>
1f88   85fcd3:	4c 89 f7             	mov    %r14,%rdi
1f8b   85fcd6:	48 89 de             	mov    %rbx,%rsi
1f8e   85fcd9:	e8 00 00 00 00       	call   85fcde <shrink_lruvec+0x1f93>	85fcda: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1f93   85fcde:	49 39 de             	cmp    %rbx,%r14
1f96   85fce1:	76 3c                	jbe    85fd1f <shrink_lruvec+0x1fd4>
1f98   85fce3:	e8 00 00 00 00       	call   85fce8 <shrink_lruvec+0x1f9d>	85fce4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1f9d   85fce8:	48 8b 84 24 b8 01 00 00 	mov    0x1b8(%rsp),%rax
1fa5   85fcf0:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1faa   85fcf5:	74 0d                	je     85fd04 <shrink_lruvec+0x1fb9>
1fac   85fcf7:	48 8d bc 24 90 01 00 00 	lea    0x190(%rsp),%rdi
1fb4   85fcff:	e8 00 00 00 00       	call   85fd04 <shrink_lruvec+0x1fb9>	85fd00: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1fb9   85fd04:	45 31 e4             	xor    %r12d,%r12d
1fbc   85fd07:	41 bd 02 00 00 00    	mov    $0x2,%r13d
1fc2   85fd0d:	4c 8b b4 24 90 01 00 00 	mov    0x190(%rsp),%r14
1fca   85fd15:	4c 8d bc 24 98 01 00 00 	lea    0x198(%rsp),%r15
1fd2   85fd1d:	eb 3f                	jmp    85fd5e <shrink_lruvec+0x2013>
1fd4   85fd1f:	e8 00 00 00 00       	call   85fd24 <shrink_lruvec+0x1fd9>	85fd20: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fd9   85fd24:	48 8d bc 24 a0 01 00 00 	lea    0x1a0(%rsp),%rdi
1fe1   85fd2c:	48 89 f8             	mov    %rdi,%rax
1fe4   85fd2f:	48 c1 e8 03          	shr    $0x3,%rax
1fe8   85fd33:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1fed   85fd38:	74 05                	je     85fd3f <shrink_lruvec+0x1ff4>
1fef   85fd3a:	e8 00 00 00 00       	call   85fd3f <shrink_lruvec+0x1ff4>	85fd3b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1ff4   85fd3f:	41 bc 02 00 00 00    	mov    $0x2,%r12d
1ffa   85fd45:	45 31 ed             	xor    %r13d,%r13d
1ffd   85fd48:	48 8b 84 24 a0 01 00 00 	mov    0x1a0(%rsp),%rax
2005   85fd50:	4c 8d bc 24 a8 01 00 00 	lea    0x1a8(%rsp),%r15
200d   85fd58:	4c 89 f3             	mov    %r14,%rbx
2010   85fd5b:	49 89 c6             	mov    %rax,%r14
2013   85fd5e:	4c 89 f8             	mov    %r15,%rax
2016   85fd61:	48 c1 e8 03          	shr    $0x3,%rax
201a   85fd65:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2024   85fd6f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2028   85fd73:	74 08                	je     85fd7d <shrink_lruvec+0x2032>
202a   85fd75:	4c 89 ff             	mov    %r15,%rdi
202d   85fd78:	e8 00 00 00 00       	call   85fd7d <shrink_lruvec+0x2032>	85fd79: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2032   85fd7d:	49 8b 07             	mov    (%r15),%rax
2035   85fd80:	49 8d 0c 06          	lea    (%r14,%rax,1),%rcx
2039   85fd84:	48 ff c1             	inc    %rcx
203c   85fd87:	48 6b c3 64          	imul   $0x64,%rbx,%rax
2040   85fd8b:	31 d2                	xor    %edx,%edx
2042   85fd8d:	48 f7 f1             	div    %rcx
2045   85fd90:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
204a   85fd95:	44 89 e0             	mov    %r12d,%eax
204d   85fd98:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
2051   85fd9c:	48 81 c3 e0 00 00 00 	add    $0xe0,%rbx
2058   85fda3:	48 89 d8             	mov    %rbx,%rax
205b   85fda6:	48 c1 e8 03          	shr    $0x3,%rax
205f   85fdaa:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2069   85fdb4:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
206d   85fdb8:	74 08                	je     85fdc2 <shrink_lruvec+0x2077>
206f   85fdba:	48 89 df             	mov    %rbx,%rdi
2072   85fdbd:	e8 00 00 00 00       	call   85fdc2 <shrink_lruvec+0x2077>	85fdbe: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2077   85fdc2:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
207e   85fdc9:	41 83 cc 01          	or     $0x1,%r12d
2082   85fdcd:	4a 8d 1c e4          	lea    (%rsp,%r12,8),%rbx
2086   85fdd1:	48 81 c3 e0 00 00 00 	add    $0xe0,%rbx
208d   85fdd8:	48 89 d8             	mov    %rbx,%rax
2090   85fddb:	48 c1 e8 03          	shr    $0x3,%rax
2094   85fddf:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
209e   85fde9:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
20a3   85fdee:	74 08                	je     85fdf8 <shrink_lruvec+0x20ad>
20a5   85fdf0:	48 89 df             	mov    %rbx,%rdi
20a8   85fdf3:	e8 00 00 00 00       	call   85fdf8 <shrink_lruvec+0x20ad>	85fdf4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
20ad   85fdf8:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
20b4   85fdff:	45 89 ee             	mov    %r13d,%r14d
20b7   85fe02:	4a 8d 3c f4          	lea    (%rsp,%r14,8),%rdi
20bb   85fe06:	48 81 c7 90 01 00 00 	add    $0x190,%rdi
20c2   85fe0d:	48 89 f8             	mov    %rdi,%rax
20c5   85fe10:	48 c1 e8 03          	shr    $0x3,%rax
20c9   85fe14:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
20ce   85fe19:	74 05                	je     85fe20 <shrink_lruvec+0x20d5>
20d0   85fe1b:	e8 00 00 00 00       	call   85fe20 <shrink_lruvec+0x20d5>	85fe1c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
20d5   85fe20:	4a 8b 9c f4 90 01 00 00 	mov    0x190(%rsp,%r14,8),%rbx
20dd   85fe28:	4e 8d 34 f4          	lea    (%rsp,%r14,8),%r14
20e1   85fe2c:	49 81 c6 e0 00 00 00 	add    $0xe0,%r14
20e8   85fe33:	4d 89 f7             	mov    %r14,%r15
20eb   85fe36:	49 c1 ef 03          	shr    $0x3,%r15
20ef   85fe3a:	43 80 3c 27 00       	cmpb   $0x0,(%r15,%r12,1)
20f4   85fe3f:	74 08                	je     85fe49 <shrink_lruvec+0x20fe>
20f6   85fe41:	4c 89 f7             	mov    %r14,%rdi
20f9   85fe44:	e8 00 00 00 00       	call   85fe49 <shrink_lruvec+0x20fe>	85fe45: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
20fe   85fe49:	48 89 d9             	mov    %rbx,%rcx
2101   85fe4c:	49 2b 0e             	sub    (%r14),%rcx
2104   85fe4f:	41 bc 64 00 00 00    	mov    $0x64,%r12d
210a   85fe55:	4c 2b 64 24 18       	sub    0x18(%rsp),%r12
210f   85fe5a:	49 0f af dc          	imul   %r12,%rbx
2113   85fe5e:	48 c1 eb 02          	shr    $0x2,%rbx
2117   85fe62:	48 89 d8             	mov    %rbx,%rax
211a   85fe65:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
2124   85fe6f:	48 f7 e2             	mul    %rdx
2127   85fe72:	48 c1 ea 02          	shr    $0x2,%rdx
212b   85fe76:	48 29 ca             	sub    %rcx,%rdx
212e   85fe79:	bb 00 00 00 00       	mov    $0x0,%ebx
2133   85fe7e:	48 0f 43 da          	cmovae %rdx,%rbx
2137   85fe82:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2141   85fe8c:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
2146   85fe91:	74 08                	je     85fe9b <shrink_lruvec+0x2150>
2148   85fe93:	4c 89 f7             	mov    %r14,%rdi
214b   85fe96:	e8 00 00 00 00       	call   85fe9b <shrink_lruvec+0x2150>	85fe97: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2150   85fe9b:	49 89 1e             	mov    %rbx,(%r14)
2153   85fe9e:	41 83 cd 01          	or     $0x1,%r13d
2157   85fea2:	4a 8d 3c ec          	lea    (%rsp,%r13,8),%rdi
215b   85fea6:	48 81 c7 90 01 00 00 	add    $0x190,%rdi
2162   85fead:	48 89 f8             	mov    %rdi,%rax
2165   85feb0:	48 c1 e8 03          	shr    $0x3,%rax
2169   85feb4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2173   85febe:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2177   85fec2:	74 05                	je     85fec9 <shrink_lruvec+0x217e>
2179   85fec4:	e8 00 00 00 00       	call   85fec9 <shrink_lruvec+0x217e>	85fec5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
217e   85fec9:	4e 8b bc ec 90 01 00 00 	mov    0x190(%rsp,%r13,8),%r15
2186   85fed1:	4e 8d 34 ec          	lea    (%rsp,%r13,8),%r14
218a   85fed5:	49 81 c6 e0 00 00 00 	add    $0xe0,%r14
2191   85fedc:	4d 89 f5             	mov    %r14,%r13
2194   85fedf:	49 c1 ed 03          	shr    $0x3,%r13
2198   85fee3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
21a2   85feed:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
21a8   85fef3:	74 08                	je     85fefd <shrink_lruvec+0x21b2>
21aa   85fef5:	4c 89 f7             	mov    %r14,%rdi
21ad   85fef8:	e8 00 00 00 00       	call   85fefd <shrink_lruvec+0x21b2>	85fef9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
21b2   85fefd:	4c 89 f9             	mov    %r15,%rcx
21b5   85ff00:	49 2b 0e             	sub    (%r14),%rcx
21b8   85ff03:	4d 0f af e7          	imul   %r15,%r12
21bc   85ff07:	49 c1 ec 02          	shr    $0x2,%r12
21c0   85ff0b:	4c 89 e0             	mov    %r12,%rax
21c3   85ff0e:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
21cd   85ff18:	48 f7 e2             	mul    %rdx
21d0   85ff1b:	48 c1 ea 02          	shr    $0x2,%rdx
21d4   85ff1f:	48 29 ca             	sub    %rcx,%rdx
21d7   85ff22:	bb 00 00 00 00       	mov    $0x0,%ebx
21dc   85ff27:	48 0f 43 da          	cmovae %rdx,%rbx
21e0   85ff2b:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
21ea   85ff35:	43 80 7c 25 00 00    	cmpb   $0x0,0x0(%r13,%r12,1)
21f0   85ff3b:	74 08                	je     85ff45 <shrink_lruvec+0x21fa>
21f2   85ff3d:	4c 89 f7             	mov    %r14,%rdi
21f5   85ff40:	e8 00 00 00 00       	call   85ff45 <shrink_lruvec+0x21fa>	85ff41: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
21fa   85ff45:	49 89 1e             	mov    %rbx,(%r14)
21fd   85ff48:	40 b6 01             	mov    $0x1,%sil
2200   85ff4b:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
2205   85ff50:	4c 8d ac 24 e8 00 00 00 	lea    0xe8(%rsp),%r13
220d   85ff58:	e9 b6 eb ff ff       	jmp    85eb13 <shrink_lruvec+0xdc8>
2212   85ff5d:	e8 00 00 00 00       	call   85ff62 <shrink_lruvec+0x2217>	85ff5e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2217   85ff62:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
221c   85ff67:	48 8d 58 40          	lea    0x40(%rax),%rbx
2220   85ff6b:	48 89 d8             	mov    %rbx,%rax
2223   85ff6e:	48 c1 e8 03          	shr    $0x3,%rax
2227   85ff72:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
222c   85ff77:	74 08                	je     85ff81 <shrink_lruvec+0x2236>
222e   85ff79:	48 89 df             	mov    %rbx,%rdi
2231   85ff7c:	e8 00 00 00 00       	call   85ff81 <shrink_lruvec+0x2236>	85ff7d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2236   85ff81:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
223e   85ff89:	48 01 03             	add    %rax,(%rbx)
2241   85ff8c:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
2249   85ff94:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
224e   85ff99:	74 08                	je     85ffa3 <shrink_lruvec+0x2258>
2250   85ff9b:	4c 89 f7             	mov    %r14,%rdi
2253   85ff9e:	e8 00 00 00 00       	call   85ffa3 <shrink_lruvec+0x2258>	85ff9f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2258   85ffa3:	49 8b 3e             	mov    (%r14),%rdi
225b   85ffa6:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
2260   85ffab:	e8 b5 a7 00 00       	call   86a765 <can_age_anon_pages>
2265   85ffb0:	84 c0                	test   %al,%al
2267   85ffb2:	74 31                	je     85ffe5 <shrink_lruvec+0x229a>
2269   85ffb4:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
226e   85ffb9:	48 89 df             	mov    %rbx,%rdi
2271   85ffbc:	31 f6                	xor    %esi,%esi
2273   85ffbe:	e8 c9 a5 00 00       	call   86a58c <inactive_is_low>
2278   85ffc3:	84 c0                	test   %al,%al
227a   85ffc5:	74 25                	je     85ffec <shrink_lruvec+0x22a1>
227c   85ffc7:	e8 00 00 00 00       	call   85ffcc <shrink_lruvec+0x2281>	85ffc8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2281   85ffcc:	bf 20 00 00 00       	mov    $0x20,%edi
2286   85ffd1:	48 89 de             	mov    %rbx,%rsi
2289   85ffd4:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
228e   85ffd9:	b9 01 00 00 00       	mov    $0x1,%ecx
2293   85ffde:	e8 b7 a8 00 00       	call   86a89a <shrink_active_list>
2298   85ffe3:	eb 0c                	jmp    85fff1 <shrink_lruvec+0x22a6>
229a   85ffe5:	e8 00 00 00 00       	call   85ffea <shrink_lruvec+0x229f>	85ffe6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
229f   85ffea:	eb 05                	jmp    85fff1 <shrink_lruvec+0x22a6>
22a1   85ffec:	e8 00 00 00 00       	call   85fff1 <shrink_lruvec+0x22a6>	85ffed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
22a6   85fff1:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
22aa   85fff5:	5b                   	pop    %rbx
22ab   85fff6:	41 5c                	pop    %r12
22ad   85fff8:	41 5d                	pop    %r13
22af   85fffa:	41 5e                	pop    %r14
22b1   85fffc:	41 5f                	pop    %r15
22b3   85fffe:	5d                   	pop    %rbp
22b4   85ffff:	c3                   	ret
22b5   860000:	e8 00 00 00 00       	call   860005 <shrink_lruvec+0x22ba>	860001: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
22ba   860005:	4c 8b 74 24 50       	mov    0x50(%rsp),%r14
22bf   86000a:	e9 53 ff ff ff       	jmp    85ff62 <shrink_lruvec+0x2217>
22c4   86000f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
22c9   860014:	48 8d 58 2b          	lea    0x2b(%rax),%rbx
22cd   860018:	48 89 d8             	mov    %rbx,%rax
22d0   86001b:	48 c1 e8 03          	shr    $0x3,%rax
22d4   86001f:	42 8a 04 20          	mov    (%rax,%r12,1),%al
22d8   860023:	84 c0                	test   %al,%al
22da   860025:	0f 85 ff 02 00 00    	jne    86032a <shrink_lruvec+0x25df>
22e0   86002b:	0f b6 1b             	movzbl (%rbx),%ebx
22e3   86002e:	31 ff                	xor    %edi,%edi
22e5   860030:	89 de                	mov    %ebx,%esi
22e7   860032:	e8 00 00 00 00       	call   860037 <shrink_lruvec+0x22ec>	860033: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
22ec   860037:	85 db                	test   %ebx,%ebx
22ee   860039:	75 1b                	jne    860056 <shrink_lruvec+0x230b>
22f0   86003b:	45 85 f6             	test   %r14d,%r14d
22f3   86003e:	74 16                	je     860056 <shrink_lruvec+0x230b>
22f5   860040:	e8 00 00 00 00       	call   860045 <shrink_lruvec+0x22fa>	860041: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
22fa   860045:	45 31 f6             	xor    %r14d,%r14d
22fd   860048:	31 c0                	xor    %eax,%eax
22ff   86004a:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
2304   86004f:	31 c0                	xor    %eax,%eax
2306   860051:	e9 e0 df ff ff       	jmp    85e036 <shrink_lruvec+0x2eb>
230b   860056:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
2313   86005e:	42 8a 04 20          	mov    (%rax,%r12,1),%al
2317   860062:	84 c0                	test   %al,%al
2319   860064:	0f 85 da 02 00 00    	jne    860344 <shrink_lruvec+0x25f9>
231f   86006a:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
2324   86006f:	0f b7 18             	movzwl (%rax),%ebx
2327   860072:	89 de                	mov    %ebx,%esi
2329   860074:	81 e6 00 10 00 00    	and    $0x1000,%esi
232f   86007a:	31 c0                	xor    %eax,%eax
2331   86007c:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
2336   860081:	31 ff                	xor    %edi,%edi
2338   860083:	e8 00 00 00 00       	call   860088 <shrink_lruvec+0x233d>	860084: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
233d   860088:	89 d8                	mov    %ebx,%eax
233f   86008a:	25 00 10 00 00       	and    $0x1000,%eax
2344   86008f:	0f 85 f6 00 00 00    	jne    86018b <shrink_lruvec+0x2440>
234a   860095:	81 e3 00 08 00 00    	and    $0x800,%ebx
2350   86009b:	31 ff                	xor    %edi,%edi
2352   86009d:	89 de                	mov    %ebx,%esi
2354   86009f:	e8 00 00 00 00       	call   8600a4 <shrink_lruvec+0x2359>	8600a0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
2359   8600a4:	85 db                	test   %ebx,%ebx
235b   8600a6:	0f 85 ee 00 00 00    	jne    86019a <shrink_lruvec+0x244f>
2361   8600ac:	e8 00 00 00 00       	call   8600b1 <shrink_lruvec+0x2366>	8600ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2366   8600b1:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
236b   8600b6:	48 8d 78 18          	lea    0x18(%rax),%rdi
236f   8600ba:	48 89 f8             	mov    %rdi,%rax
2372   8600bd:	48 c1 e8 03          	shr    $0x3,%rax
2376   8600c1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
237b   8600c6:	74 05                	je     8600cd <shrink_lruvec+0x2382>
237d   8600c8:	e8 00 00 00 00       	call   8600cd <shrink_lruvec+0x2382>	8600c9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2382   8600cd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
2387   8600d2:	4c 8b 78 18          	mov    0x18(%rax),%r15
238b   8600d6:	48 8d 58 20          	lea    0x20(%rax),%rbx
238f   8600da:	48 89 d8             	mov    %rbx,%rax
2392   8600dd:	48 c1 e8 03          	shr    $0x3,%rax
2396   8600e1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
239b   8600e6:	74 08                	je     8600f0 <shrink_lruvec+0x23a5>
239d   8600e8:	48 89 df             	mov    %rbx,%rdi
23a0   8600eb:	e8 00 00 00 00       	call   8600f0 <shrink_lruvec+0x23a5>	8600ec: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
23a5   8600f0:	48 8b 03             	mov    (%rbx),%rax
23a8   8600f3:	4a 8d 0c 38          	lea    (%rax,%r15,1),%rcx
23ac   8600f7:	4a 8d 34 39          	lea    (%rcx,%r15,1),%rsi
23b0   8600fb:	48 8d 3c 08          	lea    (%rax,%rcx,1),%rdi
23b4   8600ff:	48 ff c7             	inc    %rdi
23b7   860102:	48 01 fe             	add    %rdi,%rsi
23ba   860105:	4c 89 f0             	mov    %r14,%rax
23bd   860108:	48 0f af c6          	imul   %rsi,%rax
23c1   86010c:	4c 01 f9             	add    %r15,%rcx
23c4   86010f:	48 ff c1             	inc    %rcx
23c7   860112:	31 d2                	xor    %edx,%edx
23c9   860114:	48 f7 f1             	div    %rcx
23cc   860117:	48 89 c3             	mov    %rax,%rbx
23cf   86011a:	b8 c8 00 00 00       	mov    $0xc8,%eax
23d4   86011f:	44 29 f0             	sub    %r14d,%eax
23d7   860122:	48 98                	cltq
23d9   860124:	48 0f af c6          	imul   %rsi,%rax
23dd   860128:	31 d2                	xor    %edx,%edx
23df   86012a:	48 f7 f7             	div    %rdi
23e2   86012d:	49 89 c6             	mov    %rax,%r14
23e5   860130:	48 8d 84 24 b0 00 00 00 	lea    0xb0(%rsp),%rax
23ed   860138:	48 c1 e8 03          	shr    $0x3,%rax
23f1   86013c:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
23f6   860141:	74 0d                	je     860150 <shrink_lruvec+0x2405>
23f8   860143:	48 8d bc 24 b0 00 00 00 	lea    0xb0(%rsp),%rdi
2400   86014b:	e8 00 00 00 00       	call   860150 <shrink_lruvec+0x2405>	86014c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2405   860150:	48 8d bc 24 b8 00 00 00 	lea    0xb8(%rsp),%rdi
240d   860158:	48 89 5f f8          	mov    %rbx,-0x8(%rdi)
2411   86015c:	48 89 f8             	mov    %rdi,%rax
2414   86015f:	48 c1 e8 03          	shr    $0x3,%rax
2418   860163:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
241d   860168:	74 05                	je     86016f <shrink_lruvec+0x2424>
241f   86016a:	e8 00 00 00 00       	call   86016f <shrink_lruvec+0x2424>	86016b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2424   86016f:	4c 89 b4 24 b8 00 00 00 	mov    %r14,0xb8(%rsp)
242c   860177:	49 01 de             	add    %rbx,%r14
242f   86017a:	b8 01 00 00 00       	mov    $0x1,%eax
2434   86017f:	31 c9                	xor    %ecx,%ecx
2436   860181:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
243b   860186:	e9 ab de ff ff       	jmp    85e036 <shrink_lruvec+0x2eb>
2440   86018b:	e8 00 00 00 00       	call   860190 <shrink_lruvec+0x2445>	86018c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2445   860190:	b8 02 00 00 00       	mov    $0x2,%eax
244a   860195:	e9 76 de ff ff       	jmp    85e010 <shrink_lruvec+0x2c5>
244f   86019a:	e8 00 00 00 00       	call   86019f <shrink_lruvec+0x2454>	86019b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2454   86019f:	e9 5d de ff ff       	jmp    85e001 <shrink_lruvec+0x2b6>
2459   8601a4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	8601a7: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2460   8601ab:	48 c1 e8 03          	shr    $0x3,%rax
2464   8601af:	42 8a 04 20          	mov    (%rax,%r12,1),%al
2468   8601b3:	84 c0                	test   %al,%al
246a   8601b5:	0f 85 aa 01 00 00    	jne    860365 <shrink_lruvec+0x261a>
2470   8601bb:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 8601c1 <shrink_lruvec+0x2476>	8601bd: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
2476   8601c1:	bf 01 00 00 00       	mov    $0x1,%edi
247b   8601c6:	89 de                	mov    %ebx,%esi
247d   8601c8:	e8 00 00 00 00       	call   8601cd <shrink_lruvec+0x2482>	8601c9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2482   8601cd:	85 db                	test   %ebx,%ebx
2484   8601cf:	7e 46                	jle    860217 <shrink_lruvec+0x24cc>
2486   8601d1:	e8 00 00 00 00       	call   8601d6 <shrink_lruvec+0x248b>	8601d2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
248b   8601d6:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	8601d9: R_X86_64_32S	root_mem_cgroup
2492   8601dd:	48 c1 e8 03          	shr    $0x3,%rax
2496   8601e1:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
249b   8601e6:	74 0c                	je     8601f4 <shrink_lruvec+0x24a9>
249d   8601e8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8601eb: R_X86_64_32S	root_mem_cgroup
24a4   8601ef:	e8 00 00 00 00       	call   8601f4 <shrink_lruvec+0x24a9>	8601f0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
24a9   8601f4:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
24ae   8601f9:	48 39 05 00 00 00 00 	cmp    %rax,0x0(%rip)        # 860200 <shrink_lruvec+0x24b5>	8601fc: R_X86_64_PC32	root_mem_cgroup-0x4
24b5   860200:	48 8d 80 80 04 00 00 	lea    0x480(%rax),%rax
24bc   860207:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	86020a: R_X86_64_32S	vm_swappiness
24c3   86020e:	48 0f 45 d8          	cmovne %rax,%rbx
24c7   860212:	e9 84 dc ff ff       	jmp    85de9b <shrink_lruvec+0x150>
24cc   860217:	e8 00 00 00 00       	call   86021c <shrink_lruvec+0x24d1>	860218: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
24d1   86021c:	e9 73 dc ff ff       	jmp    85de94 <shrink_lruvec+0x149>
24d6   860221:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	860224: R_X86_64_32S	memory_cgrp_subsys_enabled_key
24dd   860228:	80 e1 07             	and    $0x7,%cl
24e0   86022b:	80 c1 03             	add    $0x3,%cl
24e3   86022e:	38 c1                	cmp    %al,%cl
24e5   860230:	0f 8c dd db ff ff    	jl     85de13 <shrink_lruvec+0xc8>
24eb   860236:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	860239: R_X86_64_32S	memory_cgrp_subsys_enabled_key
24f2   86023d:	e8 00 00 00 00       	call   860242 <shrink_lruvec+0x24f7>	86023e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
24f7   860242:	e9 cc db ff ff       	jmp    85de13 <shrink_lruvec+0xc8>
24fc   860247:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	86024a: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
2503   86024e:	80 e1 07             	and    $0x7,%cl
2506   860251:	80 c1 03             	add    $0x3,%cl
2509   860254:	38 c1                	cmp    %al,%cl
250b   860256:	0f 8c 1c dc ff ff    	jl     85de78 <shrink_lruvec+0x12d>
2511   86025c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	86025f: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
2518   860263:	e8 00 00 00 00       	call   860268 <shrink_lruvec+0x251d>	860264: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
251d   860268:	e9 0b dc ff ff       	jmp    85de78 <shrink_lruvec+0x12d>
2522   86026d:	89 d9                	mov    %ebx,%ecx
2524   86026f:	80 e1 07             	and    $0x7,%cl
2527   860272:	80 c1 03             	add    $0x3,%cl
252a   860275:	38 c1                	cmp    %al,%cl
252c   860277:	0f 8c 36 dc ff ff    	jl     85deb3 <shrink_lruvec+0x168>
2532   86027d:	48 89 df             	mov    %rbx,%rdi
2535   860280:	e8 00 00 00 00       	call   860285 <shrink_lruvec+0x253a>	860281: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
253a   860285:	e9 29 dc ff ff       	jmp    85deb3 <shrink_lruvec+0x168>
253f   86028a:	89 d1                	mov    %edx,%ecx
2541   86028c:	80 e1 07             	and    $0x7,%cl
2544   86028f:	fe c1                	inc    %cl
2546   860291:	38 c1                	cmp    %al,%cl
2548   860293:	0f 8c 5a dc ff ff    	jl     85def3 <shrink_lruvec+0x1a8>
254e   860299:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
2553   86029e:	e8 00 00 00 00       	call   8602a3 <shrink_lruvec+0x2558>	86029f: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
2558   8602a3:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
255d   8602a8:	e9 46 dc ff ff       	jmp    85def3 <shrink_lruvec+0x1a8>
2562   8602ad:	44 89 f9             	mov    %r15d,%ecx
2565   8602b0:	80 e1 07             	and    $0x7,%cl
2568   8602b3:	80 c1 03             	add    $0x3,%cl
256b   8602b6:	38 c1                	cmp    %al,%cl
256d   8602b8:	0f 8c 7b dc ff ff    	jl     85df39 <shrink_lruvec+0x1ee>
2573   8602be:	4c 89 ff             	mov    %r15,%rdi
2576   8602c1:	e8 00 00 00 00       	call   8602c6 <shrink_lruvec+0x257b>	8602c2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
257b   8602c6:	e9 6e dc ff ff       	jmp    85df39 <shrink_lruvec+0x1ee>
2580   8602cb:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	8602ce: R_X86_64_32S	numa_demotion_enabled
2587   8602d2:	80 e1 07             	and    $0x7,%cl
258a   8602d5:	38 c1                	cmp    %al,%cl
258c   8602d7:	0f 8c 75 dc ff ff    	jl     85df52 <shrink_lruvec+0x207>
2592   8602dd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	8602e0: R_X86_64_32S	numa_demotion_enabled
2599   8602e4:	e8 00 00 00 00       	call   8602e9 <shrink_lruvec+0x259e>	8602e5: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
259e   8602e9:	e9 64 dc ff ff       	jmp    85df52 <shrink_lruvec+0x207>
25a3   8602ee:	89 d9                	mov    %ebx,%ecx
25a5   8602f0:	80 e1 07             	and    $0x7,%cl
25a8   8602f3:	80 c1 03             	add    $0x3,%cl
25ab   8602f6:	38 c1                	cmp    %al,%cl
25ad   8602f8:	0f 8c af e6 ff ff    	jl     85e9ad <shrink_lruvec+0xc62>
25b3   8602fe:	48 89 df             	mov    %rbx,%rdi
25b6   860301:	e8 00 00 00 00       	call   860306 <shrink_lruvec+0x25bb>	860302: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
25bb   860306:	e9 a2 e6 ff ff       	jmp    85e9ad <shrink_lruvec+0xc62>
25c0   86030b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
25c5   860310:	80 e1 07             	and    $0x7,%cl
25c8   860313:	38 c1                	cmp    %al,%cl
25ca   860315:	0f 8c cc e6 ff ff    	jl     85e9e7 <shrink_lruvec+0xc9c>
25d0   86031b:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
25d5   860320:	e8 00 00 00 00       	call   860325 <shrink_lruvec+0x25da>	860321: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
25da   860325:	e9 bd e6 ff ff       	jmp    85e9e7 <shrink_lruvec+0xc9c>
25df   86032a:	89 d9                	mov    %ebx,%ecx
25e1   86032c:	80 e1 07             	and    $0x7,%cl
25e4   86032f:	38 c1                	cmp    %al,%cl
25e6   860331:	0f 8c f4 fc ff ff    	jl     86002b <shrink_lruvec+0x22e0>
25ec   860337:	48 89 df             	mov    %rbx,%rdi
25ef   86033a:	e8 00 00 00 00       	call   86033f <shrink_lruvec+0x25f4>	86033b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
25f4   86033f:	e9 e7 fc ff ff       	jmp    86002b <shrink_lruvec+0x22e0>
25f9   860344:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
25fe   860349:	80 e1 07             	and    $0x7,%cl
2601   86034c:	fe c1                	inc    %cl
2603   86034e:	38 c1                	cmp    %al,%cl
2605   860350:	0f 8c 14 fd ff ff    	jl     86006a <shrink_lruvec+0x231f>
260b   860356:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
2610   86035b:	e8 00 00 00 00       	call   860360 <shrink_lruvec+0x2615>	86035c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
2615   860360:	e9 05 fd ff ff       	jmp    86006a <shrink_lruvec+0x231f>
261a   860365:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	860368: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2621   86036c:	80 e1 07             	and    $0x7,%cl
2624   86036f:	80 c1 03             	add    $0x3,%cl
2627   860372:	38 c1                	cmp    %al,%cl
2629   860374:	0f 8c 41 fe ff ff    	jl     8601bb <shrink_lruvec+0x2470>
262f   86037a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	86037d: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2636   860381:	e8 00 00 00 00       	call   860386 <shrink_lruvec+0x263b>	860382: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
263b   860386:	e9 30 fe ff ff       	jmp    8601bb <shrink_lruvec+0x2470>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
