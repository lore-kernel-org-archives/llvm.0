Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F9C2564;
	Wed, 16 Nov 2022 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668590041; x=1700126041;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Acbkzevfge8lCwbXl7NBqSRWJ/OmPYWcKTI1sDYFExw=;
  b=JpbpnFAji6fkwA17y0IsT0nqqDL7qOrocH9K9xAMfNOFkJ9yzG+O2Mo+
   K4P2GHhC9785rlaj82d3H1KDJnV8obV6V+cEGoXyaCQBl1AKuL/BWsTEB
   VuL+CQtzVAd/N9ove+MIdgvA/7V0vcoTphEIm39rRhyca1W/LxkF9GsdI
   oJ+jg7tDNOwcah2sOur87YvzkCR7rvNNCayCq45hVDyaL/yQkX7EwuBuZ
   GsrtAwPdL8+pciavdkx34YY2WgbDBH1UF7wYyFtW9IKF6BHhsENkAn8IX
   6DghMl3h//N4Ap5IXyZSqwhPT7YiB68dIMGsJUN0gdx7C/nxENkHCe1PX
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="313644770"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="313644770"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2022 01:13:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10532"; a="884323644"
X-IronPort-AV: E=Sophos;i="5.96,167,1665471600"; 
   d="scan'208";a="884323644"
Received: from lkp-server01.sh.intel.com (HELO ebd99836cbe0) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Nov 2022 01:13:56 -0800
Received: from kbuild by ebd99836cbe0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ovEUW-0002CV-0I;
	Wed, 16 Nov 2022 09:13:56 +0000
Date: Wed, 16 Nov 2022 17:13:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: mm/vmscan.o: warning: objtool: shrink_lruvec+0x693d: sibling call
 from callable instruction with modified stack frame
Message-ID: <202211161736.dNgR9672-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="500iYcF3XOHOWim/"
Content-Disposition: inline


--500iYcF3XOHOWim/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Yu Zhao <yuzhao@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   59d0d52c30d4991ac4b329f049cc37118e00f5b0
commit: 354ed597442952fb680c9cafc7e4eb8a76f9514c mm: multi-gen LRU: kill switch
date:   7 weeks ago
config: x86_64-randconfig-r023-20221114
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=354ed597442952fb680c9cafc7e4eb8a76f9514c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 354ed597442952fb680c9cafc7e4eb8a76f9514c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_lruvec+0x693d: sibling call from callable instruction with modified stack frame


objdump-func vmlinux.o shrink_lruvec:
0000 0000000000933b80 <shrink_lruvec>:
0000   933b80:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)	933b81: R_X86_64_NONE	__fentry__-0x4
0005   933b85:	55                   	push   %rbp
0006   933b86:	48 89 e5             	mov    %rsp,%rbp
0009   933b89:	41 57                	push   %r15
000b   933b8b:	41 56                	push   %r14
000d   933b8d:	41 55                	push   %r13
000f   933b8f:	41 54                	push   %r12
0011   933b91:	53                   	push   %rbx
0012   933b92:	48 83 e4 e0          	and    $0xffffffffffffffe0,%rsp
0016   933b96:	48 81 ec 40 05 00 00 	sub    $0x540,%rsp
001d   933b9d:	49 89 f6             	mov    %rsi,%r14
0020   933ba0:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
0025   933ba5:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
002e   933bae:	48 89 84 24 20 05 00 00 	mov    %rax,0x520(%rsp)
0036   933bb6:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0040   933bc0:	4c 8d bc 24 80 04 00 00 	lea    0x480(%rsp),%r15
0048   933bc8:	4c 8d a4 24 d0 04 00 00 	lea    0x4d0(%rsp),%r12
0050   933bd0:	48 c7 84 24 a0 02 00 00 b3 8a b5 41 	movq   $0x41b58ab3,0x2a0(%rsp)
005c   933bdc:	48 c7 84 24 a8 02 00 00 00 00 00 00 	movq   $0x0,0x2a8(%rsp)	933be4: R_X86_64_32S	.rodata.str1.1+0x128fd
0068   933be8:	48 c7 84 24 b0 02 00 00 00 00 00 00 	movq   $0x0,0x2b0(%rsp)	933bf0: R_X86_64_32S	.text+0x933b80
0074   933bf4:	48 8d 9c 24 a0 02 00 00 	lea    0x2a0(%rsp),%rbx
007c   933bfc:	48 c1 eb 03          	shr    $0x3,%rbx
0080   933c00:	48 b8 f1 f1 f1 f1 00 00 f2 f2 	movabs $0xf2f20000f1f1f1f1,%rax
008a   933c0a:	4a 89 04 2b          	mov    %rax,(%rbx,%r13,1)
008e   933c0e:	42 c7 44 2b 09 f2 f2 f2 00 	movl   $0xf2f2f2,0x9(%rbx,%r13,1)
0097   933c17:	48 b8 f2 00 00 f2 f2 00 00 f2 	movabs $0xf20000f2f20000f2,%rax
00a1   933c21:	48 8d 88 12 f1 f2 00 	lea    0xf2f112(%rax),%rcx
00a8   933c28:	4a 89 4c 2b 11       	mov    %rcx,0x11(%rbx,%r13,1)
00ad   933c2d:	4a 89 44 2b 19       	mov    %rax,0x19(%rbx,%r13,1)
00b2   933c32:	48 0d 00 00 f2 00    	or     $0xf20000,%rax
00b8   933c38:	4a 89 44 2b 21       	mov    %rax,0x21(%rbx,%r13,1)
00bd   933c3d:	48 b8 f2 00 00 00 00 00 04 f2 	movabs $0xf2040000000000f2,%rax
00c7   933c47:	4a 89 44 2b 29       	mov    %rax,0x29(%rbx,%r13,1)
00cc   933c4c:	48 b8 f2 f2 f2 00 f2 f2 f2 00 	movabs $0xf2f2f200f2f2f2,%rax
00d6   933c56:	4a 89 44 2b 31       	mov    %rax,0x31(%rbx,%r13,1)
00db   933c5b:	48 b8 f2 f2 00 00 00 00 00 f2 	movabs $0xf20000000000f2f2,%rax
00e5   933c65:	4a 89 44 2b 3a       	mov    %rax,0x3a(%rbx,%r13,1)
00ea   933c6a:	42 c7 44 2b 42 f2 f2 f2 f2 	movl   $0xf2f2f2f2,0x42(%rbx,%r13,1)
00f3   933c73:	42 c7 44 2b 4b f3 f3 f3 f3 	movl   $0xf3f3f3f3,0x4b(%rbx,%r13,1)
00fc   933c7c:	42 c6 44 2b 4f f3    	movb   $0xf3,0x4f(%rbx,%r13,1)
0102   933c82:	e8 00 00 00 00       	call   933c87 <shrink_lruvec+0x107>	933c83: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0107   933c87:	ba 28 00 00 00       	mov    $0x28,%edx
010c   933c8c:	4c 89 ff             	mov    %r15,%rdi
010f   933c8f:	31 f6                	xor    %esi,%esi
0111   933c91:	e8 00 00 00 00       	call   933c96 <shrink_lruvec+0x116>	933c92: R_X86_64_PLT32	memset-0x4
0116   933c96:	ba 28 00 00 00       	mov    $0x28,%edx
011b   933c9b:	4c 89 e7             	mov    %r12,%rdi
011e   933c9e:	31 f6                	xor    %esi,%esi
0120   933ca0:	e8 00 00 00 00       	call   933ca5 <shrink_lruvec+0x125>	933ca1: R_X86_64_PLT32	memset-0x4
0125   933ca5:	4c 89 f0             	mov    %r14,%rax
0128   933ca8:	48 c1 e8 03          	shr    $0x3,%rax
012c   933cac:	48 89 84 24 28 02 00 00 	mov    %rax,0x228(%rsp)
0134   933cb4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0139   933cb9:	4c 89 74 24 58       	mov    %r14,0x58(%rsp)
013e   933cbe:	74 0d                	je     933ccd <shrink_lruvec+0x14d>
0140   933cc0:	4c 89 f7             	mov    %r14,%rdi
0143   933cc3:	e8 00 00 00 00       	call   933cc8 <shrink_lruvec+0x148>	933cc4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0148   933cc8:	4c 8b 74 24 58       	mov    0x58(%rsp),%r14
014d   933ccd:	4c 01 eb             	add    %r13,%rbx
0150   933cd0:	48 89 9c 24 58 01 00 00 	mov    %rbx,0x158(%rsp)
0158   933cd8:	4d 8b 3e             	mov    (%r14),%r15
015b   933cdb:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 933ce1 <shrink_lruvec+0x161>	933cdd: R_X86_64_PC32	lru_gen_caps-0x4
0161   933ce1:	31 ff                	xor    %edi,%edi
0163   933ce3:	89 de                	mov    %ebx,%esi
0165   933ce5:	e8 00 00 00 00       	call   933cea <shrink_lruvec+0x16a>	933ce6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
016a   933cea:	85 db                	test   %ebx,%ebx
016c   933cec:	0f 8e 68 01 00 00    	jle    933e5a <shrink_lruvec+0x2da>
0172   933cf2:	49 8d 46 48          	lea    0x48(%r14),%rax
0176   933cf6:	48 89 c1             	mov    %rax,%rcx
0179   933cf9:	48 c1 e9 03          	shr    $0x3,%rcx
017d   933cfd:	48 89 8c 24 c0 01 00 00 	mov    %rcx,0x1c0(%rsp)
0185   933d05:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
018a   933d0a:	48 89 84 24 d8 00 00 00 	mov    %rax,0xd8(%rsp)
0192   933d12:	74 15                	je     933d29 <shrink_lruvec+0x1a9>
0194   933d14:	48 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%rdi
019c   933d1c:	e8 00 00 00 00       	call   933d21 <shrink_lruvec+0x1a1>	933d1d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01a1   933d21:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
01a9   933d29:	48 8b 00             	mov    (%rax),%rax
01ac   933d2c:	48 89 84 24 60 02 00 00 	mov    %rax,0x260(%rsp)
01b4   933d34:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
01b9   933d39:	48 8d 98 c8 00 00 00 	lea    0xc8(%rax),%rbx
01c0   933d40:	48 89 d8             	mov    %rbx,%rax
01c3   933d43:	48 c1 e8 03          	shr    $0x3,%rax
01c7   933d47:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
01cf   933d4f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
01d4   933d54:	74 08                	je     933d5e <shrink_lruvec+0x1de>
01d6   933d56:	48 89 df             	mov    %rbx,%rdi
01d9   933d59:	e8 00 00 00 00       	call   933d5e <shrink_lruvec+0x1de>	933d5a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01de   933d5e:	48 89 9c 24 e0 00 00 00 	mov    %rbx,0xe0(%rsp)
01e6   933d66:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
01eb   933d6b:	48 8b 83 c8 00 00 00 	mov    0xc8(%rbx),%rax
01f2   933d72:	48 89 84 24 78 02 00 00 	mov    %rax,0x278(%rsp)
01fa   933d7a:	e8 00 00 00 00       	call   933d7f <shrink_lruvec+0x1ff>	933d7b: R_X86_64_PLT32	lru_add_drain-0x4
01ff   933d7f:	48 81 c3 b0 07 00 00 	add    $0x7b0,%rbx
0206   933d86:	48 89 d8             	mov    %rbx,%rax
0209   933d89:	48 c1 e8 03          	shr    $0x3,%rax
020d   933d8d:	48 89 84 24 08 01 00 00 	mov    %rax,0x108(%rsp)
0215   933d95:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
021a   933d9a:	74 08                	je     933da4 <shrink_lruvec+0x224>
021c   933d9c:	48 89 df             	mov    %rbx,%rdi
021f   933d9f:	e8 00 00 00 00       	call   933da4 <shrink_lruvec+0x224>	933da0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0224   933da4:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
0229   933da9:	4c 8b 3b             	mov    (%rbx),%r15
022c   933dac:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	933db1: R_X86_64_32S	current_task
0235   933db5:	48 89 84 24 b8 01 00 00 	mov    %rax,0x1b8(%rsp)
023d   933dbd:	48 8d b8 70 14 00 00 	lea    0x1470(%rax),%rdi
0244   933dc4:	48 89 f8             	mov    %rdi,%rax
0247   933dc7:	48 c1 e8 03          	shr    $0x3,%rax
024b   933dcb:	48 89 84 24 e8 01 00 00 	mov    %rax,0x1e8(%rsp)
0253   933dd3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0258   933dd8:	48 89 bc 24 80 01 00 00 	mov    %rdi,0x180(%rsp)
0260   933de0:	74 0d                	je     933def <shrink_lruvec+0x26f>
0262   933de2:	e8 00 00 00 00       	call   933de7 <shrink_lruvec+0x267>	933de3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0267   933de7:	48 8b bc 24 80 01 00 00 	mov    0x180(%rsp),%rdi
026f   933def:	48 8b 1f             	mov    (%rdi),%rbx
0272   933df2:	48 83 c3 08          	add    $0x8,%rbx
0276   933df6:	48 89 d8             	mov    %rbx,%rax
0279   933df9:	48 c1 e8 03          	shr    $0x3,%rax
027d   933dfd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0282   933e02:	74 08                	je     933e0c <shrink_lruvec+0x28c>
0284   933e04:	48 89 df             	mov    %rbx,%rdi
0287   933e07:	e8 00 00 00 00       	call   933e0c <shrink_lruvec+0x28c>	933e08: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
028c   933e0c:	4c 8b 33             	mov    (%rbx),%r14
028f   933e0f:	4d 85 ff             	test   %r15,%r15
0292   933e12:	0f 84 d5 00 00 00    	je     933eed <shrink_lruvec+0x36d>
0298   933e18:	e8 00 00 00 00       	call   933e1d <shrink_lruvec+0x29d>	933e19: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
029d   933e1d:	48 8b 84 24 b8 01 00 00 	mov    0x1b8(%rsp),%rax
02a5   933e25:	48 8d 58 2c          	lea    0x2c(%rax),%rbx
02a9   933e29:	48 89 d8             	mov    %rbx,%rax
02ac   933e2c:	48 c1 e8 03          	shr    $0x3,%rax
02b0   933e30:	42 8a 04 28          	mov    (%rax,%r13,1),%al
02b4   933e34:	84 c0                	test   %al,%al
02b6   933e36:	0f 85 fa 88 00 00    	jne    93c736 <shrink_lruvec+0x8bb6>
02bc   933e3c:	49 81 c7 40 39 00 00 	add    $0x3940,%r15
02c3   933e43:	be 00 00 02 00       	mov    $0x20000,%esi
02c8   933e48:	23 33                	and    (%rbx),%esi
02ca   933e4a:	4d 0f 45 f7          	cmovne %r15,%r14
02ce   933e4e:	31 ff                	xor    %edi,%edi
02d0   933e50:	e8 00 00 00 00       	call   933e55 <shrink_lruvec+0x2d5>	933e51: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
02d5   933e55:	e9 1e 02 00 00       	jmp    934078 <shrink_lruvec+0x4f8>
02da   933e5a:	4c 89 bc 24 b0 00 00 00 	mov    %r15,0xb0(%rsp)
02e2   933e62:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
02e7   933e67:	48 8d 98 b0 07 00 00 	lea    0x7b0(%rax),%rbx
02ee   933e6e:	48 89 d8             	mov    %rbx,%rax
02f1   933e71:	48 c1 e8 03          	shr    $0x3,%rax
02f5   933e75:	48 89 84 24 08 01 00 00 	mov    %rax,0x108(%rsp)
02fd   933e7d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0302   933e82:	74 08                	je     933e8c <shrink_lruvec+0x30c>
0304   933e84:	48 89 df             	mov    %rbx,%rdi
0307   933e87:	e8 00 00 00 00       	call   933e8c <shrink_lruvec+0x30c>	933e88: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
030c   933e8c:	48 89 5c 24 68       	mov    %rbx,0x68(%rsp)
0311   933e91:	4c 8b 3b             	mov    (%rbx),%r15
0314   933e94:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	933e97: R_X86_64_32S	memory_cgrp_subsys_enabled_key
031b   933e9b:	48 c1 e8 03          	shr    $0x3,%rax
031f   933e9f:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0323   933ea3:	84 c0                	test   %al,%al
0325   933ea5:	0f 85 a8 88 00 00    	jne    93c753 <shrink_lruvec+0x8bd3>
032b   933eab:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 933eb1 <shrink_lruvec+0x331>	933ead: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0331   933eb1:	bf 01 00 00 00       	mov    $0x1,%edi
0336   933eb6:	89 de                	mov    %ebx,%esi
0338   933eb8:	e8 00 00 00 00       	call   933ebd <shrink_lruvec+0x33d>	933eb9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
033d   933ebd:	85 db                	test   %ebx,%ebx
033f   933ebf:	7e 3f                	jle    933f00 <shrink_lruvec+0x380>
0341   933ec1:	e8 00 00 00 00       	call   933ec6 <shrink_lruvec+0x346>	933ec2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0346   933ec6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
034b   933ecb:	48 8d 98 08 0b 00 00 	lea    0xb08(%rax),%rbx
0352   933ed2:	48 89 d8             	mov    %rbx,%rax
0355   933ed5:	48 c1 e8 03          	shr    $0x3,%rax
0359   933ed9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
035e   933ede:	74 08                	je     933ee8 <shrink_lruvec+0x368>
0360   933ee0:	48 89 df             	mov    %rbx,%rdi
0363   933ee3:	e8 00 00 00 00       	call   933ee8 <shrink_lruvec+0x368>	933ee4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0368   933ee8:	48 8b 03             	mov    (%rbx),%rax
036b   933eeb:	eb 1a                	jmp    933f07 <shrink_lruvec+0x387>
036d   933eed:	4d 85 f6             	test   %r14,%r14
0370   933ef0:	0f 84 46 01 00 00    	je     93403c <shrink_lruvec+0x4bc>
0376   933ef6:	e8 00 00 00 00       	call   933efb <shrink_lruvec+0x37b>	933ef7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
037b   933efb:	e9 78 01 00 00       	jmp    934078 <shrink_lruvec+0x4f8>
0380   933f00:	e8 00 00 00 00       	call   933f05 <shrink_lruvec+0x385>	933f01: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0385   933f05:	31 c0                	xor    %eax,%eax
0387   933f07:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
038f   933f0f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	933f12: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
0396   933f16:	48 c1 e8 03          	shr    $0x3,%rax
039a   933f1a:	42 8a 04 28          	mov    (%rax,%r13,1),%al
039e   933f1e:	84 c0                	test   %al,%al
03a0   933f20:	0f 85 53 88 00 00    	jne    93c779 <shrink_lruvec+0x8bf9>
03a6   933f26:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 933f2c <shrink_lruvec+0x3ac>	933f28: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
03ac   933f2c:	31 ff                	xor    %edi,%edi
03ae   933f2e:	89 de                	mov    %ebx,%esi
03b0   933f30:	e8 00 00 00 00       	call   933f35 <shrink_lruvec+0x3b5>	933f31: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
03b5   933f35:	85 db                	test   %ebx,%ebx
03b7   933f37:	0f 8e 55 87 00 00    	jle    93c692 <shrink_lruvec+0x8b12>
03bd   933f3d:	e8 00 00 00 00       	call   933f42 <shrink_lruvec+0x3c2>	933f3e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03c2   933f42:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	933f45: R_X86_64_32S	vm_swappiness
03c9   933f49:	48 8d bc 24 50 03 00 00 	lea    0x350(%rsp),%rdi
03d1   933f51:	48 89 d8             	mov    %rbx,%rax
03d4   933f54:	48 c1 e8 03          	shr    $0x3,%rax
03d8   933f58:	42 8a 04 28          	mov    (%rax,%r13,1),%al
03dc   933f5c:	84 c0                	test   %al,%al
03de   933f5e:	0f 85 3b 88 00 00    	jne    93c79f <shrink_lruvec+0x8c1f>
03e4   933f64:	4c 63 33             	movslq (%rbx),%r14
03e7   933f67:	ba 10 00 00 00       	mov    $0x10,%edx
03ec   933f6c:	31 f6                	xor    %esi,%esi
03ee   933f6e:	e8 00 00 00 00       	call   933f73 <shrink_lruvec+0x3f3>	933f6f: R_X86_64_PLT32	memset-0x4
03f3   933f73:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
03f8   933f78:	48 8d 58 28          	lea    0x28(%rax),%rbx
03fc   933f7c:	48 89 d8             	mov    %rbx,%rax
03ff   933f7f:	48 c1 e8 03          	shr    $0x3,%rax
0403   933f83:	48 89 84 24 f8 00 00 00 	mov    %rax,0xf8(%rsp)
040b   933f8b:	42 8a 04 28          	mov    (%rax,%r13,1),%al
040f   933f8f:	84 c0                	test   %al,%al
0411   933f91:	0f 85 2b 88 00 00    	jne    93c7c2 <shrink_lruvec+0x8c42>
0417   933f97:	48 89 5c 24 70       	mov    %rbx,0x70(%rsp)
041c   933f9c:	44 0f b7 23          	movzwl (%rbx),%r12d
0420   933fa0:	44 89 e6             	mov    %r12d,%esi
0423   933fa3:	83 e6 40             	and    $0x40,%esi
0426   933fa6:	31 ff                	xor    %edi,%edi
0428   933fa8:	e8 00 00 00 00       	call   933fad <shrink_lruvec+0x42d>	933fa9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
042d   933fad:	44 89 e0             	mov    %r12d,%eax
0430   933fb0:	83 e0 40             	and    $0x40,%eax
0433   933fb3:	75 0a                	jne    933fbf <shrink_lruvec+0x43f>
0435   933fb5:	e8 00 00 00 00       	call   933fba <shrink_lruvec+0x43a>	933fb6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
043a   933fba:	e9 20 5f 00 00       	jmp    939edf <shrink_lruvec+0x635f>
043f   933fbf:	49 81 c7 88 2d 00 00 	add    $0x2d88,%r15
0446   933fc6:	4c 89 f8             	mov    %r15,%rax
0449   933fc9:	48 c1 e8 03          	shr    $0x3,%rax
044d   933fcd:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0451   933fd1:	84 c0                	test   %al,%al
0453   933fd3:	0f 85 6e 88 00 00    	jne    93c847 <shrink_lruvec+0x8cc7>
0459   933fd9:	45 8b 3f             	mov    (%r15),%r15d
045c   933fdc:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	933fdf: R_X86_64_32S	numa_demotion_enabled
0463   933fe3:	48 c1 e8 03          	shr    $0x3,%rax
0467   933fe7:	42 8a 04 28          	mov    (%rax,%r13,1),%al
046b   933feb:	84 c0                	test   %al,%al
046d   933fed:	0f 85 72 88 00 00    	jne    93c865 <shrink_lruvec+0x8ce5>
0473   933ff3:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 933ffa <shrink_lruvec+0x47a>	933ff6: R_X86_64_PC32	numa_demotion_enabled-0x4
047a   933ffa:	31 ff                	xor    %edi,%edi
047c   933ffc:	89 de                	mov    %ebx,%esi
047e   933ffe:	e8 00 00 00 00       	call   934003 <shrink_lruvec+0x483>	933fff: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0483   934003:	85 db                	test   %ebx,%ebx
0485   934005:	0f 84 ef 5c 00 00    	je     939cfa <shrink_lruvec+0x617a>
048b   93400b:	41 81 e4 00 40 00 00 	and    $0x4000,%r12d
0492   934012:	31 ff                	xor    %edi,%edi
0494   934014:	44 89 e6             	mov    %r12d,%esi
0497   934017:	e8 00 00 00 00       	call   93401c <shrink_lruvec+0x49c>	934018: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
049c   93401c:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
04a2   934022:	0f 84 f7 5c 00 00    	je     939d1f <shrink_lruvec+0x619f>
04a8   934028:	66 45 85 e4          	test   %r12w,%r12w
04ac   93402c:	0f 84 ed 5c 00 00    	je     939d1f <shrink_lruvec+0x619f>
04b2   934032:	e8 00 00 00 00       	call   934037 <shrink_lruvec+0x4b7>	934033: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04b7   934037:	e9 a3 5e 00 00       	jmp    939edf <shrink_lruvec+0x635f>
04bc   93403c:	e8 00 00 00 00       	call   934041 <shrink_lruvec+0x4c1>	93403d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04c1   934041:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	934044: R_X86_64_32S	kmalloc_caches+0x10
04c8   934048:	48 c1 e8 03          	shr    $0x3,%rax
04cc   93404c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
04d1   934051:	74 0c                	je     93405f <shrink_lruvec+0x4df>
04d3   934053:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	934056: R_X86_64_32S	kmalloc_caches+0x10
04da   93405a:	e8 00 00 00 00       	call   93405f <shrink_lruvec+0x4df>	93405b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04df   93405f:	48 8b 3d 00 00 00 00 	mov    0x0(%rip),%rdi        # 934066 <shrink_lruvec+0x4e6>	934062: R_X86_64_PC32	kmalloc_caches+0xc
04e6   934066:	ba 98 00 00 00       	mov    $0x98,%edx
04eb   93406b:	be 20 21 08 00       	mov    $0x82120,%esi
04f0   934070:	e8 00 00 00 00       	call   934075 <shrink_lruvec+0x4f5>	934071: R_X86_64_PLT32	kmem_cache_alloc_trace-0x4
04f5   934075:	49 89 c6             	mov    %rax,%r14
04f8   934078:	48 8b 84 24 e8 01 00 00 	mov    0x1e8(%rsp),%rax
0500   934080:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0505   934085:	48 8b bc 24 80 01 00 00 	mov    0x180(%rsp),%rdi
050d   93408d:	74 0d                	je     93409c <shrink_lruvec+0x51c>
050f   93408f:	e8 00 00 00 00       	call   934094 <shrink_lruvec+0x514>	934090: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0514   934094:	48 8b bc 24 80 01 00 00 	mov    0x180(%rsp),%rdi
051c   93409c:	4c 8d 84 24 70 03 00 00 	lea    0x370(%rsp),%r8
0524   9340a4:	4c 8d 8c 24 90 03 00 00 	lea    0x390(%rsp),%r9
052c   9340ac:	4c 8d 94 24 d0 03 00 00 	lea    0x3d0(%rsp),%r10
0534   9340b4:	48 8d 94 24 60 04 00 00 	lea    0x460(%rsp),%rdx
053c   9340bc:	48 8b 1f             	mov    (%rdi),%rbx
053f   9340bf:	48 83 c3 08          	add    $0x8,%rbx
0543   9340c3:	48 89 d8             	mov    %rbx,%rax
0546   9340c6:	48 c1 e8 03          	shr    $0x3,%rax
054a   9340ca:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
054f   9340cf:	74 28                	je     9340f9 <shrink_lruvec+0x579>
0551   9340d1:	48 89 df             	mov    %rbx,%rdi
0554   9340d4:	e8 00 00 00 00       	call   9340d9 <shrink_lruvec+0x559>	9340d5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0559   9340d9:	48 8d 94 24 60 04 00 00 	lea    0x460(%rsp),%rdx
0561   9340e1:	4c 8d 94 24 d0 03 00 00 	lea    0x3d0(%rsp),%r10
0569   9340e9:	4c 8d 8c 24 90 03 00 00 	lea    0x390(%rsp),%r9
0571   9340f1:	4c 8d 84 24 70 03 00 00 	lea    0x370(%rsp),%r8
0579   9340f9:	4c 89 33             	mov    %r14,(%rbx)
057c   9340fc:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	9340ff: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0583   934103:	48 c1 e8 03          	shr    $0x3,%rax
0587   934107:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
058f   93410f:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	934112: R_X86_64_32S	numa_demotion_enabled
0596   934116:	48 c1 e8 03          	shr    $0x3,%rax
059a   93411a:	48 89 84 24 18 02 00 00 	mov    %rax,0x218(%rsp)
05a2   934122:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	934125: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
05a9   934129:	48 c1 e8 03          	shr    $0x3,%rax
05ad   93412d:	48 89 84 24 10 02 00 00 	mov    %rax,0x210(%rsp)
05b5   934135:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	934138: R_X86_64_32S	root_mem_cgroup
05bc   93413c:	48 c1 e8 03          	shr    $0x3,%rax
05c0   934140:	48 89 84 24 c8 01 00 00 	mov    %rax,0x1c8(%rsp)
05c8   934148:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93414b: R_X86_64_32S	debug_locks
05cf   93414f:	48 c1 e8 03          	shr    $0x3,%rax
05d3   934153:	48 89 84 24 50 01 00 00 	mov    %rax,0x150(%rsp)
05db   93415b:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93415e: R_X86_64_32S	hugetlb_optimize_vmemmap_key
05e2   934162:	48 c1 e8 03          	shr    $0x3,%rax
05e6   934166:	48 89 84 24 00 01 00 00 	mov    %rax,0x100(%rsp)
05ee   93416e:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	934171: R_X86_64_32S	__tracepoint_page_ref_mod_unless+0x8
05f5   934175:	48 c1 e8 03          	shr    $0x3,%rax
05f9   934179:	48 89 84 24 f8 01 00 00 	mov    %rax,0x1f8(%rsp)
0601   934181:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	934184: R_X86_64_32S	__tracepoint_page_ref_mod_and_test+0x8
0608   934188:	48 c1 e8 03          	shr    $0x3,%rax
060c   93418c:	48 89 84 24 f0 01 00 00 	mov    %rax,0x1f0(%rsp)
0614   934194:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
0619   934199:	48 8d 78 28          	lea    0x28(%rax),%rdi
061d   93419d:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
0622   9341a2:	48 8d b1 08 0b 00 00 	lea    0xb08(%rcx),%rsi
0629   9341a9:	48 89 b4 24 90 00 00 00 	mov    %rsi,0x90(%rsp)
0631   9341b1:	48 8d 70 10          	lea    0x10(%rax),%rsi
0635   9341b5:	48 89 b4 24 88 01 00 00 	mov    %rsi,0x188(%rsp)
063d   9341bd:	48 8d b1 d0 00 00 00 	lea    0xd0(%rcx),%rsi
0644   9341c4:	48 89 b4 24 28 01 00 00 	mov    %rsi,0x128(%rsp)
064c   9341cc:	48 8d 52 08          	lea    0x8(%rdx),%rdx
0650   9341d0:	48 89 94 24 38 02 00 00 	mov    %rdx,0x238(%rsp)
0658   9341d8:	48 8d 99 d8 00 00 00 	lea    0xd8(%rcx),%rbx
065f   9341df:	48 8d 50 39          	lea    0x39(%rax),%rdx
0663   9341e3:	48 89 94 24 20 02 00 00 	mov    %rdx,0x220(%rsp)
066b   9341eb:	48 8b 94 24 b8 01 00 00 	mov    0x1b8(%rsp),%rdx
0673   9341f3:	48 8d 72 2c          	lea    0x2c(%rdx),%rsi
0677   9341f7:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
067c   9341fc:	49 8d 72 08          	lea    0x8(%r10),%rsi
0680   934200:	48 89 b4 24 80 02 00 00 	mov    %rsi,0x280(%rsp)
0688   934208:	48 8d 71 50          	lea    0x50(%rcx),%rsi
068c   93420c:	48 89 b4 24 98 01 00 00 	mov    %rsi,0x198(%rsp)
0694   934214:	48 8d b4 24 b0 03 00 00 	lea    0x3b0(%rsp),%rsi
069c   93421c:	48 8d 76 04          	lea    0x4(%rsi),%rsi
06a0   934220:	48 89 b4 24 e0 01 00 00 	mov    %rsi,0x1e0(%rsp)
06a8   934228:	48 8d b1 20 03 00 00 	lea    0x320(%rcx),%rsi
06af   93422f:	48 89 b4 24 08 02 00 00 	mov    %rsi,0x208(%rsp)
06b7   934237:	48 8d b1 60 03 00 00 	lea    0x360(%rcx),%rsi
06be   93423e:	48 89 b4 24 58 02 00 00 	mov    %rsi,0x258(%rsp)
06c6   934246:	48 8d b1 40 03 00 00 	lea    0x340(%rcx),%rsi
06cd   93424d:	48 89 b4 24 50 02 00 00 	mov    %rsi,0x250(%rsp)
06d5   934255:	48 8d b1 80 03 00 00 	lea    0x380(%rcx),%rsi
06dc   93425c:	48 89 b4 24 48 02 00 00 	mov    %rsi,0x248(%rsp)
06e4   934264:	48 8d 70 3a          	lea    0x3a(%rax),%rsi
06e8   934268:	48 89 b4 24 18 01 00 00 	mov    %rsi,0x118(%rsp)
06f0   934270:	49 8d 71 08          	lea    0x8(%r9),%rsi
06f4   934274:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
06f9   934279:	48 8d 49 68          	lea    0x68(%rcx),%rcx
06fd   93427d:	48 89 8c 24 f0 00 00 00 	mov    %rcx,0xf0(%rsp)
0705   934285:	48 8d 48 3c          	lea    0x3c(%rax),%rcx
0709   934289:	48 89 8c 24 38 01 00 00 	mov    %rcx,0x138(%rsp)
0711   934291:	49 8d 48 08          	lea    0x8(%r8),%rcx
0715   934295:	48 89 8c 24 d0 01 00 00 	mov    %rcx,0x1d0(%rsp)
071d   93429d:	48 83 c0 30          	add    $0x30,%rax
0721   9342a1:	48 89 84 24 70 02 00 00 	mov    %rax,0x270(%rsp)
0729   9342a9:	48 8d 82 28 08 00 00 	lea    0x828(%rdx),%rax
0730   9342b0:	48 89 84 24 68 02 00 00 	mov    %rax,0x268(%rsp)
0738   9342b8:	c7 84 24 90 01 00 00 00 00 00 00 	movl   $0x0,0x190(%rsp)
0743   9342c3:	31 c0                	xor    %eax,%eax
0745   9342c5:	48 89 84 24 40 02 00 00 	mov    %rax,0x240(%rsp)
074d   9342cd:	48 89 bc 24 98 00 00 00 	mov    %rdi,0x98(%rsp)
0755   9342d5:	48 89 9c 24 20 01 00 00 	mov    %rbx,0x120(%rsp)
075d   9342dd:	eb 25                	jmp    934304 <shrink_lruvec+0x784>
075f   9342df:	e8 00 00 00 00       	call   9342e4 <shrink_lruvec+0x764>	9342e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0764   9342e4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9342e7: R_X86_64_32S	.rodata+0x1323c0
076b   9342eb:	be d5 13 00 00       	mov    $0x13d5,%esi
0770   9342f0:	31 d2                	xor    %edx,%edx
0772   9342f2:	e8 00 00 00 00       	call   9342f7 <shrink_lruvec+0x777>	9342f3: R_X86_64_PLT32	__might_resched-0x4
0777   9342f7:	e8 00 00 00 00       	call   9342fc <shrink_lruvec+0x77c>	9342f8: R_X86_64_PLT32	__cond_resched-0x4
077c   9342fc:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
0784   934304:	48 89 f8             	mov    %rdi,%rax
0787   934307:	48 c1 e8 03          	shr    $0x3,%rax
078b   93430b:	48 89 84 24 40 01 00 00 	mov    %rax,0x140(%rsp)
0793   934313:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0797   934317:	84 c0                	test   %al,%al
0799   934319:	0f 85 56 55 00 00    	jne    939875 <shrink_lruvec+0x5cf5>
079f   93431f:	44 0f b7 3f          	movzwl (%rdi),%r15d
07a3   934323:	44 89 fe             	mov    %r15d,%esi
07a6   934326:	83 e6 40             	and    $0x40,%esi
07a9   934329:	31 ff                	xor    %edi,%edi
07ab   93432b:	e8 00 00 00 00       	call   934330 <shrink_lruvec+0x7b0>	93432c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
07b0   934330:	44 89 f8             	mov    %r15d,%eax
07b3   934333:	83 e0 40             	and    $0x40,%eax
07b6   934336:	48 8d 9c 24 40 04 00 00 	lea    0x440(%rsp),%rbx
07be   93433e:	75 3d                	jne    93437d <shrink_lruvec+0x7fd>
07c0   934340:	48 8b 8c 24 88 01 00 00 	mov    0x188(%rsp),%rcx
07c8   934348:	48 89 c8             	mov    %rcx,%rax
07cb   93434b:	48 c1 e8 03          	shr    $0x3,%rax
07cf   93434f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
07d4   934354:	74 15                	je     93436b <shrink_lruvec+0x7eb>
07d6   934356:	48 8b bc 24 88 01 00 00 	mov    0x188(%rsp),%rdi
07de   93435e:	e8 00 00 00 00       	call   934363 <shrink_lruvec+0x7e3>	93435f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07e3   934363:	48 8b 8c 24 88 01 00 00 	mov    0x188(%rsp),%rcx
07eb   93436b:	48 83 39 00          	cmpq   $0x0,(%rcx)
07ef   93436f:	74 74                	je     9343e5 <shrink_lruvec+0x865>
07f1   934371:	e8 00 00 00 00       	call   934376 <shrink_lruvec+0x7f6>	934372: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f6   934376:	31 f6                	xor    %esi,%esi
07f8   934378:	e9 23 03 00 00       	jmp    9346a0 <shrink_lruvec+0xb20>
07fd   93437d:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0805   934385:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0809   934389:	84 c0                	test   %al,%al
080b   93438b:	0f 85 2f 56 00 00    	jne    9399c0 <shrink_lruvec+0x5e40>
0811   934391:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 934397 <shrink_lruvec+0x817>	934393: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0817   934397:	bf 01 00 00 00       	mov    $0x1,%edi
081c   93439c:	89 de                	mov    %ebx,%esi
081e   93439e:	e8 00 00 00 00       	call   9343a3 <shrink_lruvec+0x823>	93439f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0823   9343a3:	85 db                	test   %ebx,%ebx
0825   9343a5:	0f 8e a5 00 00 00    	jle    934450 <shrink_lruvec+0x8d0>
082b   9343ab:	e8 00 00 00 00       	call   9343b0 <shrink_lruvec+0x830>	9343ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0830   9343b0:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
0838   9343b8:	48 89 c8             	mov    %rcx,%rax
083b   9343bb:	48 c1 e8 03          	shr    $0x3,%rax
083f   9343bf:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0844   9343c4:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
0849   9343c9:	74 15                	je     9343e0 <shrink_lruvec+0x860>
084b   9343cb:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
0853   9343d3:	e8 00 00 00 00       	call   9343d8 <shrink_lruvec+0x858>	9343d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0858   9343d8:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
0860   9343e0:	4c 8b 21             	mov    (%rcx),%r12
0863   9343e3:	eb 78                	jmp    93445d <shrink_lruvec+0x8dd>
0865   9343e5:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
086d   9343ed:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0871   9343f1:	84 c0                	test   %al,%al
0873   9343f3:	0f 85 cb 56 00 00    	jne    939ac4 <shrink_lruvec+0x5f44>
0879   9343f9:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 9343ff <shrink_lruvec+0x87f>	9343fb: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
087f   9343ff:	bf 01 00 00 00       	mov    $0x1,%edi
0884   934404:	89 de                	mov    %ebx,%esi
0886   934406:	e8 00 00 00 00       	call   93440b <shrink_lruvec+0x88b>	934407: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
088b   93440b:	85 db                	test   %ebx,%ebx
088d   93440d:	0f 8e 4d 01 00 00    	jle    934560 <shrink_lruvec+0x9e0>
0893   934413:	e8 00 00 00 00       	call   934418 <shrink_lruvec+0x898>	934414: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0898   934418:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
08a0   934420:	48 89 c8             	mov    %rcx,%rax
08a3   934423:	48 c1 e8 03          	shr    $0x3,%rax
08a7   934427:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
08ac   93442c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
08b1   934431:	74 15                	je     934448 <shrink_lruvec+0x8c8>
08b3   934433:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
08bb   93443b:	e8 00 00 00 00       	call   934440 <shrink_lruvec+0x8c0>	93443c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08c0   934440:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
08c8   934448:	4c 8b 21             	mov    (%rcx),%r12
08cb   93444b:	e9 1d 01 00 00       	jmp    93456d <shrink_lruvec+0x9ed>
08d0   934450:	e8 00 00 00 00       	call   934455 <shrink_lruvec+0x8d5>	934451: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08d5   934455:	45 31 e4             	xor    %r12d,%r12d
08d8   934458:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
08dd   93445d:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
08e5   934465:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
08ea   93446a:	74 08                	je     934474 <shrink_lruvec+0x8f4>
08ec   93446c:	48 89 df             	mov    %rbx,%rdi
08ef   93446f:	e8 00 00 00 00       	call   934474 <shrink_lruvec+0x8f4>	934470: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08f4   934474:	48 8b 1b             	mov    (%rbx),%rbx
08f7   934477:	b8 88 2d 00 00       	mov    $0x2d88,%eax
08fc   93447c:	48 01 c3             	add    %rax,%rbx
08ff   93447f:	48 89 d8             	mov    %rbx,%rax
0902   934482:	48 c1 e8 03          	shr    $0x3,%rax
0906   934486:	42 8a 04 28          	mov    (%rax,%r13,1),%al
090a   93448a:	84 c0                	test   %al,%al
090c   93448c:	0f 85 54 55 00 00    	jne    9399e6 <shrink_lruvec+0x5e66>
0912   934492:	44 8b 33             	mov    (%rbx),%r14d
0915   934495:	48 8b 84 24 18 02 00 00 	mov    0x218(%rsp),%rax
091d   93449d:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0921   9344a1:	84 c0                	test   %al,%al
0923   9344a3:	0f 85 5a 55 00 00    	jne    939a03 <shrink_lruvec+0x5e83>
0929   9344a9:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 9344b0 <shrink_lruvec+0x930>	9344ac: R_X86_64_PC32	numa_demotion_enabled-0x4
0930   9344b0:	31 ff                	xor    %edi,%edi
0932   9344b2:	89 de                	mov    %ebx,%esi
0934   9344b4:	e8 00 00 00 00       	call   9344b9 <shrink_lruvec+0x939>	9344b5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0939   9344b9:	85 db                	test   %ebx,%ebx
093b   9344bb:	74 29                	je     9344e6 <shrink_lruvec+0x966>
093d   9344bd:	41 81 e7 00 40 00 00 	and    $0x4000,%r15d
0944   9344c4:	31 ff                	xor    %edi,%edi
0946   9344c6:	44 89 fe             	mov    %r15d,%esi
0949   9344c9:	e8 00 00 00 00       	call   9344ce <shrink_lruvec+0x94e>	9344ca: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
094e   9344ce:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
0954   9344d4:	74 1a                	je     9344f0 <shrink_lruvec+0x970>
0956   9344d6:	66 45 85 ff          	test   %r15w,%r15w
095a   9344da:	74 14                	je     9344f0 <shrink_lruvec+0x970>
095c   9344dc:	e8 00 00 00 00       	call   9344e1 <shrink_lruvec+0x961>	9344dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0961   9344e1:	e9 b0 01 00 00       	jmp    934696 <shrink_lruvec+0xb16>
0966   9344e6:	e8 00 00 00 00       	call   9344eb <shrink_lruvec+0x96b>	9344e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
096b   9344eb:	e9 a6 01 00 00       	jmp    934696 <shrink_lruvec+0xb16>
0970   9344f0:	44 89 f7             	mov    %r14d,%edi
0973   9344f3:	e8 00 00 00 00       	call   9344f8 <shrink_lruvec+0x978>	9344f4: R_X86_64_PLT32	next_demotion_node-0x4
0978   9344f8:	89 c3                	mov    %eax,%ebx
097a   9344fa:	bf ff ff ff ff       	mov    $0xffffffff,%edi
097f   9344ff:	89 c6                	mov    %eax,%esi
0981   934501:	e8 00 00 00 00       	call   934506 <shrink_lruvec+0x986>	934502: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0986   934506:	83 fb ff             	cmp    $0xffffffff,%ebx
0989   934509:	0f 84 f1 00 00 00    	je     934600 <shrink_lruvec+0xa80>
098f   93450f:	48 8b 84 24 10 02 00 00 	mov    0x210(%rsp),%rax
0997   934517:	42 8a 04 28          	mov    (%rax,%r13,1),%al
099b   93451b:	84 c0                	test   %al,%al
099d   93451d:	0f 85 2e 56 00 00    	jne    939b51 <shrink_lruvec+0x5fd1>
09a3   934523:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 934529 <shrink_lruvec+0x9a9>	934525: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
09a9   934529:	31 ff                	xor    %edi,%edi
09ab   93452b:	89 de                	mov    %ebx,%esi
09ad   93452d:	e8 00 00 00 00       	call   934532 <shrink_lruvec+0x9b2>	93452e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09b2   934532:	85 db                	test   %ebx,%ebx
09b4   934534:	0f 8e 33 52 00 00    	jle    93976d <shrink_lruvec+0x5bed>
09ba   93453a:	e8 00 00 00 00       	call   93453f <shrink_lruvec+0x9bf>	93453b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09bf   93453f:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	934542: R_X86_64_32S	vm_swappiness
09c6   934546:	48 89 d8             	mov    %rbx,%rax
09c9   934549:	48 c1 e8 03          	shr    $0x3,%rax
09cd   93454d:	42 8a 04 28          	mov    (%rax,%r13,1),%al
09d1   934551:	84 c0                	test   %al,%al
09d3   934553:	0f 85 1e 56 00 00    	jne    939b77 <shrink_lruvec+0x5ff7>
09d9   934559:	8b 33                	mov    (%rbx),%esi
09db   93455b:	e9 38 01 00 00       	jmp    934698 <shrink_lruvec+0xb18>
09e0   934560:	e8 00 00 00 00       	call   934565 <shrink_lruvec+0x9e5>	934561: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09e5   934565:	45 31 e4             	xor    %r12d,%r12d
09e8   934568:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
09ed   93456d:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
09f5   934575:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
09fa   93457a:	74 08                	je     934584 <shrink_lruvec+0xa04>
09fc   93457c:	48 89 df             	mov    %rbx,%rdi
09ff   93457f:	e8 00 00 00 00       	call   934584 <shrink_lruvec+0xa04>	934580: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a04   934584:	48 8b 1b             	mov    (%rbx),%rbx
0a07   934587:	b8 88 2d 00 00       	mov    $0x2d88,%eax
0a0c   93458c:	48 01 c3             	add    %rax,%rbx
0a0f   93458f:	48 89 d8             	mov    %rbx,%rax
0a12   934592:	48 c1 e8 03          	shr    $0x3,%rax
0a16   934596:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0a1a   93459a:	84 c0                	test   %al,%al
0a1c   93459c:	0f 85 48 55 00 00    	jne    939aea <shrink_lruvec+0x5f6a>
0a22   9345a2:	44 8b 33             	mov    (%rbx),%r14d
0a25   9345a5:	48 8b 84 24 18 02 00 00 	mov    0x218(%rsp),%rax
0a2d   9345ad:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0a31   9345b1:	84 c0                	test   %al,%al
0a33   9345b3:	0f 85 4e 55 00 00    	jne    939b07 <shrink_lruvec+0x5f87>
0a39   9345b9:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 9345c0 <shrink_lruvec+0xa40>	9345bc: R_X86_64_PC32	numa_demotion_enabled-0x4
0a40   9345c0:	31 ff                	xor    %edi,%edi
0a42   9345c2:	89 de                	mov    %ebx,%esi
0a44   9345c4:	e8 00 00 00 00       	call   9345c9 <shrink_lruvec+0xa49>	9345c5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0a49   9345c9:	85 db                	test   %ebx,%ebx
0a4b   9345cb:	74 29                	je     9345f6 <shrink_lruvec+0xa76>
0a4d   9345cd:	41 81 e7 00 40 00 00 	and    $0x4000,%r15d
0a54   9345d4:	31 ff                	xor    %edi,%edi
0a56   9345d6:	44 89 fe             	mov    %r15d,%esi
0a59   9345d9:	e8 00 00 00 00       	call   9345de <shrink_lruvec+0xa5e>	9345da: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0a5e   9345de:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
0a64   9345e4:	74 24                	je     93460a <shrink_lruvec+0xa8a>
0a66   9345e6:	66 45 85 ff          	test   %r15w,%r15w
0a6a   9345ea:	74 1e                	je     93460a <shrink_lruvec+0xa8a>
0a6c   9345ec:	e8 00 00 00 00       	call   9345f1 <shrink_lruvec+0xa71>	9345ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a71   9345f1:	e9 a0 00 00 00       	jmp    934696 <shrink_lruvec+0xb16>
0a76   9345f6:	e8 00 00 00 00       	call   9345fb <shrink_lruvec+0xa7b>	9345f7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a7b   9345fb:	e9 96 00 00 00       	jmp    934696 <shrink_lruvec+0xb16>
0a80   934600:	e8 00 00 00 00       	call   934605 <shrink_lruvec+0xa85>	934601: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a85   934605:	e9 8c 00 00 00       	jmp    934696 <shrink_lruvec+0xb16>
0a8a   93460a:	44 89 f7             	mov    %r14d,%edi
0a8d   93460d:	e8 00 00 00 00       	call   934612 <shrink_lruvec+0xa92>	93460e: R_X86_64_PLT32	next_demotion_node-0x4
0a92   934612:	89 c3                	mov    %eax,%ebx
0a94   934614:	bf ff ff ff ff       	mov    $0xffffffff,%edi
0a99   934619:	89 c6                	mov    %eax,%esi
0a9b   93461b:	e8 00 00 00 00       	call   934620 <shrink_lruvec+0xaa0>	93461c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0aa0   934620:	83 fb ff             	cmp    $0xffffffff,%ebx
0aa3   934623:	74 65                	je     93468a <shrink_lruvec+0xb0a>
0aa5   934625:	48 8b 84 24 10 02 00 00 	mov    0x210(%rsp),%rax
0aad   93462d:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0ab1   934631:	84 c0                	test   %al,%al
0ab3   934633:	0f 85 ee 55 00 00    	jne    939c27 <shrink_lruvec+0x60a7>
0ab9   934639:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93463f <shrink_lruvec+0xabf>	93463b: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
0abf   93463f:	31 ff                	xor    %edi,%edi
0ac1   934641:	89 de                	mov    %ebx,%esi
0ac3   934643:	e8 00 00 00 00       	call   934648 <shrink_lruvec+0xac8>	934644: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0ac8   934648:	85 db                	test   %ebx,%ebx
0aca   93464a:	0f 8e 94 51 00 00    	jle    9397e4 <shrink_lruvec+0x5c64>
0ad0   934650:	e8 00 00 00 00       	call   934655 <shrink_lruvec+0xad5>	934651: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ad5   934655:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	934658: R_X86_64_32S	vm_swappiness
0adc   93465c:	48 89 d8             	mov    %rbx,%rax
0adf   93465f:	48 c1 e8 03          	shr    $0x3,%rax
0ae3   934663:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0ae7   934667:	84 c0                	test   %al,%al
0ae9   934669:	0f 85 de 55 00 00    	jne    939c4d <shrink_lruvec+0x60cd>
0aef   93466f:	8b 1b                	mov    (%rbx),%ebx
0af1   934671:	31 ff                	xor    %edi,%edi
0af3   934673:	89 de                	mov    %ebx,%esi
0af5   934675:	e8 00 00 00 00       	call   93467a <shrink_lruvec+0xafa>	934676: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0afa   93467a:	85 db                	test   %ebx,%ebx
0afc   93467c:	74 13                	je     934691 <shrink_lruvec+0xb11>
0afe   93467e:	e8 00 00 00 00       	call   934683 <shrink_lruvec+0xb03>	93467f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b03   934683:	be 01 00 00 00       	mov    $0x1,%esi
0b08   934688:	eb 0e                	jmp    934698 <shrink_lruvec+0xb18>
0b0a   93468a:	e8 00 00 00 00       	call   93468f <shrink_lruvec+0xb0f>	93468b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b0f   93468f:	eb 05                	jmp    934696 <shrink_lruvec+0xb16>
0b11   934691:	e8 00 00 00 00       	call   934696 <shrink_lruvec+0xb16>	934692: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b16   934696:	31 f6                	xor    %esi,%esi
0b18   934698:	48 8d 9c 24 40 04 00 00 	lea    0x440(%rsp),%rbx
0b20   9346a0:	31 ff                	xor    %edi,%edi
0b22   9346a2:	89 b4 24 b0 00 00 00 	mov    %esi,0xb0(%rsp)
0b29   9346a9:	e8 00 00 00 00       	call   9346ae <shrink_lruvec+0xb2e>	9346aa: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b2e   9346ae:	49 89 de             	mov    %rbx,%r14
0b31   9346b1:	49 c1 ee 03          	shr    $0x3,%r14
0b35   9346b5:	43 80 3c 2e 00       	cmpb   $0x0,(%r14,%r13,1)
0b3a   9346ba:	74 08                	je     9346c4 <shrink_lruvec+0xb44>
0b3c   9346bc:	48 89 df             	mov    %rbx,%rdi
0b3f   9346bf:	e8 00 00 00 00       	call   9346c4 <shrink_lruvec+0xb44>	9346c0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0b44   9346c4:	48 c7 84 24 40 04 00 00 00 00 00 00 	movq   $0x0,0x440(%rsp)
0b50   9346d0:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0b58   9346d8:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0b5c   9346dc:	84 c0                	test   %al,%al
0b5e   9346de:	0f 85 bb 51 00 00    	jne    93989f <shrink_lruvec+0x5d1f>
0b64   9346e4:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 9346ea <shrink_lruvec+0xb6a>	9346e6: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0b6a   9346ea:	bf 01 00 00 00       	mov    $0x1,%edi
0b6f   9346ef:	89 de                	mov    %ebx,%esi
0b71   9346f1:	e8 00 00 00 00       	call   9346f6 <shrink_lruvec+0xb76>	9346f2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b76   9346f6:	85 db                	test   %ebx,%ebx
0b78   9346f8:	7e 35                	jle    93472f <shrink_lruvec+0xbaf>
0b7a   9346fa:	e8 00 00 00 00       	call   9346ff <shrink_lruvec+0xb7f>	9346fb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b7f   9346ff:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
0b87   934707:	48 89 c8             	mov    %rcx,%rax
0b8a   93470a:	48 c1 e8 03          	shr    $0x3,%rax
0b8e   93470e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0b93   934713:	74 15                	je     93472a <shrink_lruvec+0xbaa>
0b95   934715:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
0b9d   93471d:	e8 00 00 00 00       	call   934722 <shrink_lruvec+0xba2>	93471e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0ba2   934722:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
0baa   93472a:	4c 8b 39             	mov    (%rcx),%r15
0bad   93472d:	eb 08                	jmp    934737 <shrink_lruvec+0xbb7>
0baf   93472f:	e8 00 00 00 00       	call   934734 <shrink_lruvec+0xbb4>	934730: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bb4   934734:	45 31 ff             	xor    %r15d,%r15d
0bb7   934737:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
0bbf   93473f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0bc4   934744:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
0bcc   93474c:	74 15                	je     934763 <shrink_lruvec+0xbe3>
0bce   93474e:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
0bd6   934756:	e8 00 00 00 00       	call   93475b <shrink_lruvec+0xbdb>	934757: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0bdb   93475b:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
0be3   934763:	4c 8b 20             	mov    (%rax),%r12
0be6   934766:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
0bee   93476e:	48 89 c1             	mov    %rax,%rcx
0bf1   934771:	48 c1 e9 03          	shr    $0x3,%rcx
0bf5   934775:	48 89 8c 24 d8 01 00 00 	mov    %rcx,0x1d8(%rsp)
0bfd   93477d:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
0c02   934782:	74 15                	je     934799 <shrink_lruvec+0xc19>
0c04   934784:	48 8b bc 24 28 01 00 00 	mov    0x128(%rsp),%rdi
0c0c   93478c:	e8 00 00 00 00       	call   934791 <shrink_lruvec+0xc11>	93478d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c11   934791:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
0c19   934799:	48 8b 18             	mov    (%rax),%rbx
0c1c   93479c:	48 8d bc 24 60 04 00 00 	lea    0x460(%rsp),%rdi
0c24   9347a4:	48 89 f8             	mov    %rdi,%rax
0c27   9347a7:	48 c1 e8 03          	shr    $0x3,%rax
0c2b   9347ab:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0c30   9347b0:	74 05                	je     9347b7 <shrink_lruvec+0xc37>
0c32   9347b2:	e8 00 00 00 00       	call   9347b7 <shrink_lruvec+0xc37>	9347b3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0c37   9347b7:	48 89 9c 24 60 04 00 00 	mov    %rbx,0x460(%rsp)
0c3f   9347bf:	48 8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%rbx
0c47   9347c7:	48 89 d8             	mov    %rbx,%rax
0c4a   9347ca:	48 c1 e8 03          	shr    $0x3,%rax
0c4e   9347ce:	48 89 84 24 60 01 00 00 	mov    %rax,0x160(%rsp)
0c56   9347d6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0c5b   9347db:	74 08                	je     9347e5 <shrink_lruvec+0xc65>
0c5d   9347dd:	48 89 df             	mov    %rbx,%rdi
0c60   9347e0:	e8 00 00 00 00       	call   9347e5 <shrink_lruvec+0xc65>	9347e1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c65   9347e5:	48 8b 1b             	mov    (%rbx),%rbx
0c68   9347e8:	48 8b 84 24 38 02 00 00 	mov    0x238(%rsp),%rax
0c70   9347f0:	48 c1 e8 03          	shr    $0x3,%rax
0c74   9347f4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0c79   9347f9:	74 0d                	je     934808 <shrink_lruvec+0xc88>
0c7b   9347fb:	48 8b bc 24 38 02 00 00 	mov    0x238(%rsp),%rdi
0c83   934803:	e8 00 00 00 00       	call   934808 <shrink_lruvec+0xc88>	934804: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0c88   934808:	48 89 9c 24 68 04 00 00 	mov    %rbx,0x468(%rsp)
0c90   934810:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0c98   934818:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0c9c   93481c:	84 c0                	test   %al,%al
0c9e   93481e:	0f 85 a1 50 00 00    	jne    9398c5 <shrink_lruvec+0x5d45>
0ca4   934824:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93482a <shrink_lruvec+0xcaa>	934826: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0caa   93482a:	bf 01 00 00 00       	mov    $0x1,%edi
0caf   93482f:	89 de                	mov    %ebx,%esi
0cb1   934831:	e8 00 00 00 00       	call   934836 <shrink_lruvec+0xcb6>	934832: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0cb6   934836:	85 db                	test   %ebx,%ebx
0cb8   934838:	0f 8e b6 00 00 00    	jle    9348f4 <shrink_lruvec+0xd74>
0cbe   93483e:	48 8b 84 24 c8 01 00 00 	mov    0x1c8(%rsp),%rax
0cc6   934846:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0ccb   93484b:	74 0c                	je     934859 <shrink_lruvec+0xcd9>
0ccd   93484d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	934850: R_X86_64_32S	root_mem_cgroup
0cd4   934854:	e8 00 00 00 00       	call   934859 <shrink_lruvec+0xcd9>	934855: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0cd9   934859:	4c 39 3d 00 00 00 00 	cmp    %r15,0x0(%rip)        # 934860 <shrink_lruvec+0xce0>	93485c: R_X86_64_PC32	root_mem_cgroup-0x4
0ce0   934860:	0f 84 95 00 00 00    	je     9348fb <shrink_lruvec+0xd7b>
0ce6   934866:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
0ceb   93486b:	4d 89 e6             	mov    %r12,%r14
0cee   93486e:	4c 89 e9             	mov    %r13,%rcx
0cf1   934871:	4d 8d af 40 01 00 00 	lea    0x140(%r15),%r13
0cf8   934878:	49 8d 9f 80 01 00 00 	lea    0x180(%r15),%rbx
0cff   93487f:	48 89 d8             	mov    %rbx,%rax
0d02   934882:	48 c1 e8 03          	shr    $0x3,%rax
0d06   934886:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0d0a   93488a:	74 08                	je     934894 <shrink_lruvec+0xd14>
0d0c   93488c:	48 89 df             	mov    %rbx,%rdi
0d0f   93488f:	e8 00 00 00 00       	call   934894 <shrink_lruvec+0xd14>	934890: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d14   934894:	4c 8b 23             	mov    (%rbx),%r12
0d17   934897:	4c 89 ef             	mov    %r13,%rdi
0d1a   93489a:	be 08 00 00 00       	mov    $0x8,%esi
0d1f   93489f:	e8 00 00 00 00       	call   9348a4 <shrink_lruvec+0xd24>	9348a0: R_X86_64_PLT32	__kasan_check_read-0x4
0d24   9348a4:	4c 89 e8             	mov    %r13,%rax
0d27   9348a7:	48 c1 e8 03          	shr    $0x3,%rax
0d2b   9348ab:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0d35   9348b5:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0d39   9348b9:	74 08                	je     9348c3 <shrink_lruvec+0xd43>
0d3b   9348bb:	4c 89 ef             	mov    %r13,%rdi
0d3e   9348be:	e8 00 00 00 00       	call   9348c3 <shrink_lruvec+0xd43>	9348bf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d43   9348c3:	49 8b 5d 00          	mov    0x0(%r13),%rbx
0d47   9348c7:	4c 89 e7             	mov    %r12,%rdi
0d4a   9348ca:	48 89 de             	mov    %rbx,%rsi
0d4d   9348cd:	e8 00 00 00 00       	call   9348d2 <shrink_lruvec+0xd52>	9348ce: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0d52   9348d2:	49 39 dc             	cmp    %rbx,%r12
0d55   9348d5:	0f 83 e1 55 00 00    	jae    939ebc <shrink_lruvec+0x633c>
0d5b   9348db:	e8 00 00 00 00       	call   9348e0 <shrink_lruvec+0xd60>	9348dc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d60   9348e0:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0d6a   9348ea:	4d 89 f4             	mov    %r14,%r12
0d6d   9348ed:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
0d72   9348f2:	eb 0c                	jmp    934900 <shrink_lruvec+0xd80>
0d74   9348f4:	e8 00 00 00 00       	call   9348f9 <shrink_lruvec+0xd79>	9348f5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d79   9348f9:	eb 05                	jmp    934900 <shrink_lruvec+0xd80>
0d7b   9348fb:	e8 00 00 00 00       	call   934900 <shrink_lruvec+0xd80>	9348fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d80   934900:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0d88   934908:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0d8c   93490c:	84 c0                	test   %al,%al
0d8e   93490e:	0f 85 d7 4f 00 00    	jne    9398eb <shrink_lruvec+0x5d6b>
0d94   934914:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93491a <shrink_lruvec+0xd9a>	934916: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0d9a   93491a:	bf 01 00 00 00       	mov    $0x1,%edi
0d9f   93491f:	89 de                	mov    %ebx,%esi
0da1   934921:	e8 00 00 00 00       	call   934926 <shrink_lruvec+0xda6>	934922: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0da6   934926:	85 db                	test   %ebx,%ebx
0da8   934928:	0f 8e 88 00 00 00    	jle    9349b6 <shrink_lruvec+0xe36>
0dae   93492e:	48 8b 84 24 c8 01 00 00 	mov    0x1c8(%rsp),%rax
0db6   934936:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0dbb   93493b:	74 0c                	je     934949 <shrink_lruvec+0xdc9>
0dbd   93493d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	934940: R_X86_64_32S	root_mem_cgroup
0dc4   934944:	e8 00 00 00 00       	call   934949 <shrink_lruvec+0xdc9>	934945: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0dc9   934949:	4c 39 3d 00 00 00 00 	cmp    %r15,0x0(%rip)        # 934950 <shrink_lruvec+0xdd0>	93494c: R_X86_64_PC32	root_mem_cgroup-0x4
0dd0   934950:	74 6b                	je     9349bd <shrink_lruvec+0xe3d>
0dd2   934952:	49 8d 9f 40 01 00 00 	lea    0x140(%r15),%rbx
0dd9   934959:	49 81 c7 98 01 00 00 	add    $0x198,%r15
0de0   934960:	4c 89 f8             	mov    %r15,%rax
0de3   934963:	48 c1 e8 03          	shr    $0x3,%rax
0de7   934967:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0dec   93496c:	74 08                	je     934976 <shrink_lruvec+0xdf6>
0dee   93496e:	4c 89 ff             	mov    %r15,%rdi
0df1   934971:	e8 00 00 00 00       	call   934976 <shrink_lruvec+0xdf6>	934972: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0df6   934976:	4d 8b 3f             	mov    (%r15),%r15
0df9   934979:	48 89 df             	mov    %rbx,%rdi
0dfc   93497c:	be 08 00 00 00       	mov    $0x8,%esi
0e01   934981:	e8 00 00 00 00       	call   934986 <shrink_lruvec+0xe06>	934982: R_X86_64_PLT32	__kasan_check_read-0x4
0e06   934986:	48 89 d8             	mov    %rbx,%rax
0e09   934989:	48 c1 e8 03          	shr    $0x3,%rax
0e0d   93498d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0e12   934992:	74 08                	je     93499c <shrink_lruvec+0xe1c>
0e14   934994:	48 89 df             	mov    %rbx,%rdi
0e17   934997:	e8 00 00 00 00       	call   93499c <shrink_lruvec+0xe1c>	934998: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0e1c   93499c:	48 8b 1b             	mov    (%rbx),%rbx
0e1f   93499f:	4c 89 ff             	mov    %r15,%rdi
0e22   9349a2:	48 89 de             	mov    %rbx,%rsi
0e25   9349a5:	e8 00 00 00 00       	call   9349aa <shrink_lruvec+0xe2a>	9349a6: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0e2a   9349aa:	49 39 df             	cmp    %rbx,%r15
0e2d   9349ad:	73 15                	jae    9349c4 <shrink_lruvec+0xe44>
0e2f   9349af:	e8 00 00 00 00       	call   9349b4 <shrink_lruvec+0xe34>	9349b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e34   9349b4:	eb 4d                	jmp    934a03 <shrink_lruvec+0xe83>
0e36   9349b6:	e8 00 00 00 00       	call   9349bb <shrink_lruvec+0xe3b>	9349b7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e3b   9349bb:	eb 46                	jmp    934a03 <shrink_lruvec+0xe83>
0e3d   9349bd:	e8 00 00 00 00       	call   9349c2 <shrink_lruvec+0xe42>	9349be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e42   9349c2:	eb 3f                	jmp    934a03 <shrink_lruvec+0xe83>
0e44   9349c4:	48 8b 84 24 40 01 00 00 	mov    0x140(%rsp),%rax
0e4c   9349cc:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0e50   9349d0:	84 c0                	test   %al,%al
0e52   9349d2:	0f 85 c4 50 00 00    	jne    939a9c <shrink_lruvec+0x5f1c>
0e58   9349d8:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
0e60   9349e0:	0f b7 18             	movzwl (%rax),%ebx
0e63   9349e3:	89 de                	mov    %ebx,%esi
0e65   9349e5:	81 e6 00 01 00 00    	and    $0x100,%esi
0e6b   9349eb:	31 ff                	xor    %edi,%edi
0e6d   9349ed:	e8 00 00 00 00       	call   9349f2 <shrink_lruvec+0xe72>	9349ee: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0e72   9349f2:	81 e3 00 01 00 00    	and    $0x100,%ebx
0e78   9349f8:	0f 84 f0 7a 00 00    	je     93c4ee <shrink_lruvec+0x896e>
0e7e   9349fe:	e8 00 00 00 00       	call   934a03 <shrink_lruvec+0xe83>	9349ff: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e83   934a03:	45 31 c0             	xor    %r8d,%r8d
0e86   934a06:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
0e8e   934a0e:	41 0f 95 c0          	setne  %r8b
0e92   934a12:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
0e97   934a17:	4c 89 e6             	mov    %r12,%rsi
0e9a   934a1a:	48 8d 94 24 60 04 00 00 	lea    0x460(%rsp),%rdx
0ea2   934a22:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
0ea7   934a27:	48 8d 9c 24 40 04 00 00 	lea    0x440(%rsp),%rbx
0eaf   934a2f:	49 89 d9             	mov    %rbx,%r9
0eb2   934a32:	e8 89 69 01 00       	call   94b3c0 <should_run_aging>
0eb7   934a37:	84 c0                	test   %al,%al
0eb9   934a39:	74 3d                	je     934a78 <shrink_lruvec+0xef8>
0ebb   934a3b:	48 8b 9c 24 20 02 00 00 	mov    0x220(%rsp),%rbx
0ec3   934a43:	48 89 d8             	mov    %rbx,%rax
0ec6   934a46:	48 c1 e8 03          	shr    $0x3,%rax
0eca   934a4a:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0ece   934a4e:	84 c0                	test   %al,%al
0ed0   934a50:	0f 85 d0 4f 00 00    	jne    939a26 <shrink_lruvec+0x5ea6>
0ed6   934a56:	0f b6 1b             	movzbl (%rbx),%ebx
0ed9   934a59:	bf 0c 00 00 00       	mov    $0xc,%edi
0ede   934a5e:	89 de                	mov    %ebx,%esi
0ee0   934a60:	e8 00 00 00 00       	call   934a65 <shrink_lruvec+0xee5>	934a61: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0ee5   934a65:	83 fb 0c             	cmp    $0xc,%ebx
0ee8   934a68:	0f 85 42 02 00 00    	jne    934cb0 <shrink_lruvec+0x1130>
0eee   934a6e:	e8 00 00 00 00       	call   934a73 <shrink_lruvec+0xef3>	934a6f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ef3   934a73:	e9 9c 02 00 00       	jmp    934d14 <shrink_lruvec+0x1194>
0ef8   934a78:	e8 00 00 00 00       	call   934a7d <shrink_lruvec+0xefd>	934a79: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0efd   934a7d:	b0 01                	mov    $0x1,%al
0eff   934a7f:	89 84 24 7c 01 00 00 	mov    %eax,0x17c(%rsp)
0f06   934a86:	43 80 3c 2e 00       	cmpb   $0x0,(%r14,%r13,1)
0f0b   934a8b:	74 08                	je     934a95 <shrink_lruvec+0xf15>
0f0d   934a8d:	48 89 df             	mov    %rbx,%rdi
0f10   934a90:	e8 00 00 00 00       	call   934a95 <shrink_lruvec+0xf15>	934a91: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f15   934a95:	48 8b 9c 24 40 04 00 00 	mov    0x440(%rsp),%rbx
0f1d   934a9d:	31 ff                	xor    %edi,%edi
0f1f   934a9f:	48 89 de             	mov    %rbx,%rsi
0f22   934aa2:	e8 00 00 00 00       	call   934aa7 <shrink_lruvec+0xf27>	934aa3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0f27   934aa7:	48 85 db             	test   %rbx,%rbx
0f2a   934aaa:	0f 84 54 52 00 00    	je     939d04 <shrink_lruvec+0x6184>
0f30   934ab0:	48 8d bc 24 d0 03 00 00 	lea    0x3d0(%rsp),%rdi
0f38   934ab8:	48 89 f8             	mov    %rdi,%rax
0f3b   934abb:	48 c1 e8 03          	shr    $0x3,%rax
0f3f   934abf:	48 89 84 24 68 01 00 00 	mov    %rax,0x168(%rsp)
0f47   934ac7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0f4c   934acc:	74 0d                	je     934adb <shrink_lruvec+0xf5b>
0f4e   934ace:	e8 00 00 00 00       	call   934ad3 <shrink_lruvec+0xf53>	934acf: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f53   934ad3:	48 8d bc 24 d0 03 00 00 	lea    0x3d0(%rsp),%rdi
0f5b   934adb:	48 89 bc 24 d0 03 00 00 	mov    %rdi,0x3d0(%rsp)
0f63   934ae3:	48 8b 8c 24 80 02 00 00 	mov    0x280(%rsp),%rcx
0f6b   934aeb:	48 89 c8             	mov    %rcx,%rax
0f6e   934aee:	48 c1 e8 03          	shr    $0x3,%rax
0f72   934af2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0f77   934af7:	74 10                	je     934b09 <shrink_lruvec+0xf89>
0f79   934af9:	48 89 cf             	mov    %rcx,%rdi
0f7c   934afc:	e8 00 00 00 00       	call   934b01 <shrink_lruvec+0xf81>	934afd: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0f81   934b01:	48 8d bc 24 d0 03 00 00 	lea    0x3d0(%rsp),%rdi
0f89   934b09:	48 89 9c 24 90 02 00 00 	mov    %rbx,0x290(%rsp)
0f91   934b11:	48 89 bc 24 d8 03 00 00 	mov    %rdi,0x3d8(%rsp)
0f99   934b19:	ba 2c 00 00 00       	mov    $0x2c,%edx
0f9e   934b1e:	48 8d bc 24 f0 03 00 00 	lea    0x3f0(%rsp),%rdi
0fa6   934b26:	31 f6                	xor    %esi,%esi
0fa8   934b28:	e8 00 00 00 00       	call   934b2d <shrink_lruvec+0xfad>	934b29: R_X86_64_PLT32	memset-0x4
0fad   934b2d:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0fb5   934b35:	42 8a 04 28          	mov    (%rax,%r13,1),%al
0fb9   934b39:	84 c0                	test   %al,%al
0fbb   934b3b:	0f 85 d0 4d 00 00    	jne    939911 <shrink_lruvec+0x5d91>
0fc1   934b41:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 934b47 <shrink_lruvec+0xfc7>	934b43: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0fc7   934b47:	bf 01 00 00 00       	mov    $0x1,%edi
0fcc   934b4c:	89 de                	mov    %ebx,%esi
0fce   934b4e:	e8 00 00 00 00       	call   934b53 <shrink_lruvec+0xfd3>	934b4f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0fd3   934b53:	85 db                	test   %ebx,%ebx
0fd5   934b55:	7e 42                	jle    934b99 <shrink_lruvec+0x1019>
0fd7   934b57:	e8 00 00 00 00       	call   934b5c <shrink_lruvec+0xfdc>	934b58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0fdc   934b5c:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
0fe4   934b64:	48 89 c8             	mov    %rcx,%rax
0fe7   934b67:	48 c1 e8 03          	shr    $0x3,%rax
0feb   934b6b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0ff0   934b70:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
0ff5   934b75:	74 15                	je     934b8c <shrink_lruvec+0x100c>
0ff7   934b77:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
0fff   934b7f:	e8 00 00 00 00       	call   934b84 <shrink_lruvec+0x1004>	934b80: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1004   934b84:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
100c   934b8c:	48 8b 01             	mov    (%rcx),%rax
100f   934b8f:	48 89 84 24 30 02 00 00 	mov    %rax,0x230(%rsp)
1017   934b97:	eb 14                	jmp    934bad <shrink_lruvec+0x102d>
1019   934b99:	e8 00 00 00 00       	call   934b9e <shrink_lruvec+0x101e>	934b9a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
101e   934b9e:	31 c0                	xor    %eax,%eax
1020   934ba0:	48 89 84 24 30 02 00 00 	mov    %rax,0x230(%rsp)
1028   934ba8:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
102d   934bad:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
1035   934bb5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
103a   934bba:	74 08                	je     934bc4 <shrink_lruvec+0x1044>
103c   934bbc:	48 89 df             	mov    %rbx,%rdi
103f   934bbf:	e8 00 00 00 00       	call   934bc4 <shrink_lruvec+0x1044>	934bc0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1044   934bc4:	48 8b 03             	mov    (%rbx),%rax
1047   934bc7:	48 89 84 24 88 02 00 00 	mov    %rax,0x288(%rsp)
104f   934bcf:	48 8b bc 24 98 01 00 00 	mov    0x198(%rsp),%rdi
1057   934bd7:	e8 00 00 00 00       	call   934bdc <shrink_lruvec+0x105c>	934bd8: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
105c   934bdc:	48 8b 84 24 d8 01 00 00 	mov    0x1d8(%rsp),%rax
1064   934be4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1069   934be9:	48 8b 9c 24 28 01 00 00 	mov    0x128(%rsp),%rbx
1071   934bf1:	74 08                	je     934bfb <shrink_lruvec+0x107b>
1073   934bf3:	48 89 df             	mov    %rbx,%rdi
1076   934bf6:	e8 00 00 00 00       	call   934bfb <shrink_lruvec+0x107b>	934bf7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
107b   934bfb:	4c 8b 3b             	mov    (%rbx),%r15
107e   934bfe:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
1086   934c06:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
108b   934c0b:	48 8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%rbx
1093   934c13:	74 08                	je     934c1d <shrink_lruvec+0x109d>
1095   934c15:	48 89 df             	mov    %rbx,%rdi
1098   934c18:	e8 00 00 00 00       	call   934c1d <shrink_lruvec+0x109d>	934c19: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
109d   934c1d:	4c 8b 33             	mov    (%rbx),%r14
10a0   934c20:	31 ff                	xor    %edi,%edi
10a2   934c22:	8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%ebx
10a9   934c29:	89 de                	mov    %ebx,%esi
10ab   934c2b:	e8 00 00 00 00       	call   934c30 <shrink_lruvec+0x10b0>	934c2c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
10b0   934c30:	85 db                	test   %ebx,%ebx
10b2   934c32:	74 22                	je     934c56 <shrink_lruvec+0x10d6>
10b4   934c34:	4c 89 ff             	mov    %r15,%rdi
10b7   934c37:	4c 89 f6             	mov    %r14,%rsi
10ba   934c3a:	e8 00 00 00 00       	call   934c3f <shrink_lruvec+0x10bf>	934c3b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
10bf   934c3f:	4d 39 f7             	cmp    %r14,%r15
10c2   934c42:	73 27                	jae    934c6b <shrink_lruvec+0x10eb>
10c4   934c44:	e8 00 00 00 00       	call   934c49 <shrink_lruvec+0x10c9>	934c45: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10c9   934c49:	31 db                	xor    %ebx,%ebx
10cb   934c4b:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
10d1   934c51:	e9 a1 0a 00 00       	jmp    9356f7 <shrink_lruvec+0x1b77>
10d6   934c56:	e8 00 00 00 00       	call   934c5b <shrink_lruvec+0x10db>	934c57: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
10db   934c5b:	bb 01 00 00 00       	mov    $0x1,%ebx
10e0   934c60:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
10e6   934c66:	e9 8c 0a 00 00       	jmp    9356f7 <shrink_lruvec+0x1b77>
10eb   934c6b:	8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%ebx
10f2   934c72:	89 df                	mov    %ebx,%edi
10f4   934c74:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	934c77: R_X86_64_32S	.data+0x58fc10
10fb   934c7b:	e8 00 00 00 00       	call   934c80 <shrink_lruvec+0x1100>	934c7c: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
1100   934c80:	81 fb c8 00 00 00    	cmp    $0xc8,%ebx
1106   934c86:	0f 84 fa 00 00 00    	je     934d86 <shrink_lruvec+0x1206>
110c   934c8c:	89 da                	mov    %ebx,%edx
110e   934c8e:	83 fb 01             	cmp    $0x1,%ebx
1111   934c91:	0f 85 08 01 00 00    	jne    934d9f <shrink_lruvec+0x121f>
1117   934c97:	e8 00 00 00 00       	call   934c9c <shrink_lruvec+0x111c>	934c98: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
111c   934c9c:	8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%eax
1123   934ca3:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
1129   934ca9:	89 c3                	mov    %eax,%ebx
112b   934cab:	e9 4e 0a 00 00       	jmp    9356fe <shrink_lruvec+0x1b7e>
1130   934cb0:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
1135   934cb5:	48 89 d0             	mov    %rdx,%rax
1138   934cb8:	48 c1 e8 03          	shr    $0x3,%rax
113c   934cbc:	42 8a 04 28          	mov    (%rax,%r13,1),%al
1140   934cc0:	84 c0                	test   %al,%al
1142   934cc2:	0f 85 b0 4d 00 00    	jne    939a78 <shrink_lruvec+0x5ef8>
1148   934cc8:	8b 1a                	mov    (%rdx),%ebx
114a   934cca:	be 00 00 02 00       	mov    $0x20000,%esi
114f   934ccf:	21 de                	and    %ebx,%esi
1151   934cd1:	31 ff                	xor    %edi,%edi
1153   934cd3:	e8 00 00 00 00       	call   934cd8 <shrink_lruvec+0x1158>	934cd4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1158   934cd8:	b8 00 00 02 00       	mov    $0x20000,%eax
115d   934cdd:	21 c3                	and    %eax,%ebx
115f   934cdf:	0f 85 f5 77 00 00    	jne    93c4da <shrink_lruvec+0x895a>
1165   934ce5:	31 c9                	xor    %ecx,%ecx
1167   934ce7:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
116f   934cef:	0f 95 c1             	setne  %cl
1172   934cf2:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
1177   934cf7:	4c 89 e6             	mov    %r12,%rsi
117a   934cfa:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
117f   934cff:	e8 7c 6d 01 00       	call   94ba80 <try_to_inc_max_seq>
1184   934d04:	84 c0                	test   %al,%al
1186   934d06:	74 07                	je     934d0f <shrink_lruvec+0x118f>
1188   934d08:	e8 00 00 00 00       	call   934d0d <shrink_lruvec+0x118d>	934d09: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
118d   934d0d:	eb 54                	jmp    934d63 <shrink_lruvec+0x11e3>
118f   934d0f:	e8 00 00 00 00       	call   934d14 <shrink_lruvec+0x1194>	934d10: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1194   934d14:	31 c0                	xor    %eax,%eax
1196   934d16:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
119e   934d1e:	0f 94 c0             	sete   %al
11a1   934d21:	48 8d 8c 24 60 04 00 00 	lea    0x460(%rsp),%rcx
11a9   934d29:	48 8d 1c c1          	lea    (%rcx,%rax,8),%rbx
11ad   934d2d:	48 89 d8             	mov    %rbx,%rax
11b0   934d30:	48 c1 e8 03          	shr    $0x3,%rax
11b4   934d34:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
11b9   934d39:	74 08                	je     934d43 <shrink_lruvec+0x11c3>
11bb   934d3b:	48 89 df             	mov    %rbx,%rdi
11be   934d3e:	e8 00 00 00 00       	call   934d43 <shrink_lruvec+0x11c3>	934d3f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
11c3   934d43:	48 8b 1b             	mov    (%rbx),%rbx
11c6   934d46:	48 83 c3 02          	add    $0x2,%rbx
11ca   934d4a:	48 89 df             	mov    %rbx,%rdi
11cd   934d4d:	4c 89 e6             	mov    %r12,%rsi
11d0   934d50:	e8 00 00 00 00       	call   934d55 <shrink_lruvec+0x11d5>	934d51: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
11d5   934d55:	4c 39 e3             	cmp    %r12,%rbx
11d8   934d58:	0f 87 72 51 00 00    	ja     939ed0 <shrink_lruvec+0x6350>
11de   934d5e:	e8 00 00 00 00       	call   934d63 <shrink_lruvec+0x11e3>	934d5f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
11e3   934d63:	c7 84 24 7c 01 00 00 00 00 00 00 	movl   $0x0,0x17c(%rsp)
11ee   934d6e:	48 8d 9c 24 40 04 00 00 	lea    0x440(%rsp),%rbx
11f6   934d76:	43 80 3c 2e 00       	cmpb   $0x0,(%r14,%r13,1)
11fb   934d7b:	0f 85 0c fd ff ff    	jne    934a8d <shrink_lruvec+0xf0d>
1201   934d81:	e9 0f fd ff ff       	jmp    934a95 <shrink_lruvec+0xf15>
1206   934d86:	e8 00 00 00 00       	call   934d8b <shrink_lruvec+0x120b>	934d87: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
120b   934d8b:	8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%eax
1212   934d92:	31 db                	xor    %ebx,%ebx
1214   934d94:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
121a   934d9a:	e9 5f 09 00 00       	jmp    9356fe <shrink_lruvec+0x1b7e>
121f   934d9f:	48 8d 84 24 b0 03 00 00 	lea    0x3b0(%rsp),%rax
1227   934da7:	48 c1 e8 03          	shr    $0x3,%rax
122b   934dab:	42 8a 04 28          	mov    (%rax,%r13,1),%al
122f   934daf:	84 c0                	test   %al,%al
1231   934db1:	0f 85 dd 4d 00 00    	jne    939b94 <shrink_lruvec+0x6014>
1237   934db7:	89 94 24 b0 03 00 00 	mov    %edx,0x3b0(%rsp)
123e   934dbe:	41 bc c8 00 00 00    	mov    $0xc8,%r12d
1244   934dc4:	41 29 d4             	sub    %edx,%r12d
1247   934dc7:	48 8b 84 24 e0 01 00 00 	mov    0x1e0(%rsp),%rax
124f   934dcf:	48 c1 e8 03          	shr    $0x3,%rax
1253   934dd3:	42 8a 04 28          	mov    (%rax,%r13,1),%al
1257   934dd7:	84 c0                	test   %al,%al
1259   934dd9:	48 8b bc 24 08 02 00 00 	mov    0x208(%rsp),%rdi
1261   934de1:	0f 85 dc 4d 00 00    	jne    939bc3 <shrink_lruvec+0x6043>
1267   934de7:	44 89 a4 24 b4 03 00 00 	mov    %r12d,0x3b4(%rsp)
126f   934def:	41 83 e7 03          	and    $0x3,%r15d
1273   934df3:	48 89 f8             	mov    %rdi,%rax
1276   934df6:	48 c1 e8 03          	shr    $0x3,%rax
127a   934dfa:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
127f   934dff:	74 05                	je     934e06 <shrink_lruvec+0x1286>
1281   934e01:	e8 00 00 00 00       	call   934e06 <shrink_lruvec+0x1286>	934e02: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1286   934e06:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
128b   934e0b:	48 8b 88 20 03 00 00 	mov    0x320(%rax),%rcx
1292   934e12:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
1297   934e17:	49 c1 e7 06          	shl    $0x6,%r15
129b   934e1b:	4e 8d 34 38          	lea    (%rax,%r15,1),%r14
129f   934e1f:	49 81 c6 60 05 00 00 	add    $0x560,%r14
12a6   934e26:	4c 89 f7             	mov    %r14,%rdi
12a9   934e29:	be 08 00 00 00       	mov    $0x8,%esi
12ae   934e2e:	e8 00 00 00 00       	call   934e33 <shrink_lruvec+0x12b3>	934e2f: R_X86_64_PLT32	__kasan_check_read-0x4
12b3   934e33:	4c 89 f0             	mov    %r14,%rax
12b6   934e36:	48 c1 e8 03          	shr    $0x3,%rax
12ba   934e3a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
12bf   934e3f:	74 08                	je     934e49 <shrink_lruvec+0x12c9>
12c1   934e41:	4c 89 f7             	mov    %r14,%rdi
12c4   934e44:	e8 00 00 00 00       	call   934e49 <shrink_lruvec+0x12c9>	934e45: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12c9   934e49:	49 8b 06             	mov    (%r14),%rax
12cc   934e4c:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
12d1   934e51:	48 8b bc 24 58 02 00 00 	mov    0x258(%rsp),%rdi
12d9   934e59:	48 89 f8             	mov    %rdi,%rax
12dc   934e5c:	48 c1 e8 03          	shr    $0x3,%rax
12e0   934e60:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
12e5   934e65:	74 05                	je     934e6c <shrink_lruvec+0x12ec>
12e7   934e67:	e8 00 00 00 00       	call   934e6c <shrink_lruvec+0x12ec>	934e68: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12ec   934e6c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
12f1   934e71:	48 8b 88 60 03 00 00 	mov    0x360(%rax),%rcx
12f8   934e78:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
12fd   934e7d:	4a 8d 1c 38          	lea    (%rax,%r15,1),%rbx
1301   934e81:	48 81 c3 60 04 00 00 	add    $0x460,%rbx
1308   934e88:	48 89 df             	mov    %rbx,%rdi
130b   934e8b:	be 08 00 00 00       	mov    $0x8,%esi
1310   934e90:	e8 00 00 00 00       	call   934e95 <shrink_lruvec+0x1315>	934e91: R_X86_64_PLT32	__kasan_check_read-0x4
1315   934e95:	48 89 d8             	mov    %rbx,%rax
1318   934e98:	48 c1 e8 03          	shr    $0x3,%rax
131c   934e9c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1321   934ea1:	74 08                	je     934eab <shrink_lruvec+0x132b>
1323   934ea3:	48 89 df             	mov    %rbx,%rdi
1326   934ea6:	e8 00 00 00 00       	call   934eab <shrink_lruvec+0x132b>	934ea7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
132b   934eab:	48 8b 03             	mov    (%rbx),%rax
132e   934eae:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
1333   934eb3:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
133b   934ebb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1340   934ec0:	48 8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%rbx
1348   934ec8:	74 08                	je     934ed2 <shrink_lruvec+0x1352>
134a   934eca:	48 89 df             	mov    %rbx,%rdi
134d   934ecd:	e8 00 00 00 00       	call   934ed2 <shrink_lruvec+0x1352>	934ece: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1352   934ed2:	4c 8b 2b             	mov    (%rbx),%r13
1355   934ed5:	41 83 e5 03          	and    $0x3,%r13d
1359   934ed9:	48 8b bc 24 50 02 00 00 	mov    0x250(%rsp),%rdi
1361   934ee1:	48 89 f8             	mov    %rdi,%rax
1364   934ee4:	48 c1 e8 03          	shr    $0x3,%rax
1368   934ee8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1372   934ef2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1376   934ef6:	74 05                	je     934efd <shrink_lruvec+0x137d>
1378   934ef8:	e8 00 00 00 00       	call   934efd <shrink_lruvec+0x137d>	934ef9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
137d   934efd:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1382   934f02:	4c 8b b0 40 03 00 00 	mov    0x340(%rax),%r14
1389   934f09:	49 c1 e5 06          	shl    $0x6,%r13
138d   934f0d:	4a 8d 1c 28          	lea    (%rax,%r13,1),%rbx
1391   934f11:	48 81 c3 80 05 00 00 	add    $0x580,%rbx
1398   934f18:	48 89 df             	mov    %rbx,%rdi
139b   934f1b:	be 08 00 00 00       	mov    $0x8,%esi
13a0   934f20:	e8 00 00 00 00       	call   934f25 <shrink_lruvec+0x13a5>	934f21: R_X86_64_PLT32	__kasan_check_read-0x4
13a5   934f25:	48 89 d8             	mov    %rbx,%rax
13a8   934f28:	48 c1 e8 03          	shr    $0x3,%rax
13ac   934f2c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
13b6   934f36:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
13ba   934f3a:	74 08                	je     934f44 <shrink_lruvec+0x13c4>
13bc   934f3c:	48 89 df             	mov    %rbx,%rdi
13bf   934f3f:	e8 00 00 00 00       	call   934f44 <shrink_lruvec+0x13c4>	934f40: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13c4   934f44:	48 8b bc 24 48 02 00 00 	mov    0x248(%rsp),%rdi
13cc   934f4c:	48 89 f8             	mov    %rdi,%rax
13cf   934f4f:	48 c1 e8 03          	shr    $0x3,%rax
13d3   934f53:	4c 03 33             	add    (%rbx),%r14
13d6   934f56:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
13e0   934f60:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
13e4   934f64:	74 05                	je     934f6b <shrink_lruvec+0x13eb>
13e6   934f66:	e8 00 00 00 00       	call   934f6b <shrink_lruvec+0x13eb>	934f67: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13eb   934f6b:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
13f0   934f70:	4c 8b b8 80 03 00 00 	mov    0x380(%rax),%r15
13f7   934f77:	4a 8d 1c 28          	lea    (%rax,%r13,1),%rbx
13fb   934f7b:	48 81 c3 80 04 00 00 	add    $0x480,%rbx
1402   934f82:	48 89 df             	mov    %rbx,%rdi
1405   934f85:	be 08 00 00 00       	mov    $0x8,%esi
140a   934f8a:	e8 00 00 00 00       	call   934f8f <shrink_lruvec+0x140f>	934f8b: R_X86_64_PLT32	__kasan_check_read-0x4
140f   934f8f:	48 89 d8             	mov    %rbx,%rax
1412   934f92:	48 c1 e8 03          	shr    $0x3,%rax
1416   934f96:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1420   934fa0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1424   934fa4:	74 08                	je     934fae <shrink_lruvec+0x142e>
1426   934fa6:	48 89 df             	mov    %rbx,%rdi
1429   934fa9:	e8 00 00 00 00       	call   934fae <shrink_lruvec+0x142e>	934faa: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
142e   934fae:	4c 8b 2b             	mov    (%rbx),%r13
1431   934fb1:	bf 40 00 00 00       	mov    $0x40,%edi
1436   934fb6:	4c 89 f6             	mov    %r14,%rsi
1439   934fb9:	e8 00 00 00 00       	call   934fbe <shrink_lruvec+0x143e>	934fba: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
143e   934fbe:	49 83 fe 3f          	cmp    $0x3f,%r14
1442   934fc2:	77 0a                	ja     934fce <shrink_lruvec+0x144e>
1444   934fc4:	e8 00 00 00 00       	call   934fc9 <shrink_lruvec+0x1449>	934fc5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1449   934fc9:	41 b6 01             	mov    $0x1,%r14b
144c   934fcc:	eb 57                	jmp    935025 <shrink_lruvec+0x14a5>
144e   934fce:	e8 00 00 00 00       	call   934fd3 <shrink_lruvec+0x1453>	934fcf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1453   934fd3:	4d 01 fd             	add    %r15,%r13
1456   934fd6:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
145b   934fdb:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
1460   934fe0:	48 01 c8             	add    %rcx,%rax
1463   934fe3:	48 83 c0 40          	add    $0x40,%rax
1467   934fe7:	4c 63 bc 24 b0 00 00 00 	movslq 0xb0(%rsp),%r15
146f   934fef:	4c 0f af f8          	imul   %rax,%r15
1473   934ff3:	4d 0f af fe          	imul   %r14,%r15
1477   934ff7:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
147c   934ffc:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
1481   935001:	48 01 c8             	add    %rcx,%rax
1484   935004:	48 83 c0 01          	add    $0x1,%rax
1488   935008:	49 63 dc             	movslq %r12d,%rbx
148b   93500b:	48 0f af d8          	imul   %rax,%rbx
148f   93500f:	49 0f af dd          	imul   %r13,%rbx
1493   935013:	4c 89 ff             	mov    %r15,%rdi
1496   935016:	48 89 de             	mov    %rbx,%rsi
1499   935019:	e8 00 00 00 00       	call   93501e <shrink_lruvec+0x149e>	93501a: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
149e   93501e:	49 39 df             	cmp    %rbx,%r15
14a1   935021:	41 0f 96 c6          	setbe  %r14b
14a5   935025:	44 89 f0             	mov    %r14d,%eax
14a8   935028:	34 01                	xor    $0x1,%al
14aa   93502a:	44 0f b6 f8          	movzbl %al,%r15d
14ae   93502e:	48 8d 84 24 b0 03 00 00 	lea    0x3b0(%rsp),%rax
14b6   935036:	4a 8d 3c b8          	lea    (%rax,%r15,4),%rdi
14ba   93503a:	48 89 f8             	mov    %rdi,%rax
14bd   93503d:	48 c1 e8 03          	shr    $0x3,%rax
14c1   935041:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
14cb   93504b:	42 8a 04 28          	mov    (%rax,%r13,1),%al
14cf   93504f:	84 c0                	test   %al,%al
14d1   935051:	0f 85 9c 4b 00 00    	jne    939bf3 <shrink_lruvec+0x6073>
14d7   935057:	4a 63 84 bc b0 03 00 00 	movslq 0x3b0(%rsp,%r15,4),%rax
14df   93505f:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
14e4   935064:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
14e9   935069:	4a 8d 3c f8          	lea    (%rax,%r15,8),%rdi
14ed   93506d:	48 81 c7 d0 00 00 00 	add    $0xd0,%rdi
14f4   935074:	48 89 f8             	mov    %rdi,%rax
14f7   935077:	48 c1 e8 03          	shr    $0x3,%rax
14fb   93507b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1500   935080:	74 05                	je     935087 <shrink_lruvec+0x1507>
1502   935082:	e8 00 00 00 00       	call   935087 <shrink_lruvec+0x1507>	935083: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1507   935087:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
150c   93508c:	4a 8b 9c f8 d0 00 00 00 	mov    0xd0(%rax,%r15,8),%rbx
1514   935094:	83 e3 03             	and    $0x3,%ebx
1517   935097:	49 c1 e7 05          	shl    $0x5,%r15
151b   93509b:	4e 8d 24 38          	lea    (%rax,%r15,1),%r12
151f   93509f:	49 81 c4 20 03 00 00 	add    $0x320,%r12
1526   9350a6:	4c 89 e0             	mov    %r12,%rax
1529   9350a9:	48 c1 e8 03          	shr    $0x3,%rax
152d   9350ad:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1532   9350b2:	74 08                	je     9350bc <shrink_lruvec+0x153c>
1534   9350b4:	4c 89 e7             	mov    %r12,%rdi
1537   9350b7:	e8 00 00 00 00       	call   9350bc <shrink_lruvec+0x153c>	9350b8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
153c   9350bc:	49 8b 04 24          	mov    (%r12),%rax
1540   9350c0:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
1545   9350c5:	48 c1 e3 06          	shl    $0x6,%rbx
1549   9350c9:	48 03 5c 24 18       	add    0x18(%rsp),%rbx
154e   9350ce:	4d 8d 24 1f          	lea    (%r15,%rbx,1),%r12
1552   9350d2:	49 81 c4 60 05 00 00 	add    $0x560,%r12
1559   9350d9:	4c 89 e7             	mov    %r12,%rdi
155c   9350dc:	be 08 00 00 00       	mov    $0x8,%esi
1561   9350e1:	e8 00 00 00 00       	call   9350e6 <shrink_lruvec+0x1566>	9350e2: R_X86_64_PLT32	__kasan_check_read-0x4
1566   9350e6:	4c 89 e0             	mov    %r12,%rax
1569   9350e9:	48 c1 e8 03          	shr    $0x3,%rax
156d   9350ed:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1572   9350f2:	74 08                	je     9350fc <shrink_lruvec+0x157c>
1574   9350f4:	4c 89 e7             	mov    %r12,%rdi
1577   9350f7:	e8 00 00 00 00       	call   9350fc <shrink_lruvec+0x157c>	9350f8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
157c   9350fc:	49 8b 04 24          	mov    (%r12),%rax
1580   935100:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
1585   935105:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
158a   93510a:	4e 8d 24 38          	lea    (%rax,%r15,1),%r12
158e   93510e:	49 81 c4 60 03 00 00 	add    $0x360,%r12
1595   935115:	4c 89 e0             	mov    %r12,%rax
1598   935118:	48 c1 e8 03          	shr    $0x3,%rax
159c   93511c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
15a1   935121:	74 08                	je     93512b <shrink_lruvec+0x15ab>
15a3   935123:	4c 89 e7             	mov    %r12,%rdi
15a6   935126:	e8 00 00 00 00       	call   93512b <shrink_lruvec+0x15ab>	935127: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15ab   93512b:	49 8b 04 24          	mov    (%r12),%rax
15af   93512f:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
15b7   935137:	4c 01 fb             	add    %r15,%rbx
15ba   93513a:	48 81 c3 60 04 00 00 	add    $0x460,%rbx
15c1   935141:	48 89 df             	mov    %rbx,%rdi
15c4   935144:	be 08 00 00 00       	mov    $0x8,%esi
15c9   935149:	e8 00 00 00 00       	call   93514e <shrink_lruvec+0x15ce>	93514a: R_X86_64_PLT32	__kasan_check_read-0x4
15ce   93514e:	48 89 d8             	mov    %rbx,%rax
15d1   935151:	48 c1 e8 03          	shr    $0x3,%rax
15d5   935155:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
15da   93515a:	74 08                	je     935164 <shrink_lruvec+0x15e4>
15dc   93515c:	48 89 df             	mov    %rbx,%rdi
15df   93515f:	e8 00 00 00 00       	call   935164 <shrink_lruvec+0x15e4>	935160: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15e4   935164:	48 8b 03             	mov    (%rbx),%rax
15e7   935167:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
15ef   93516f:	41 0f b6 de          	movzbl %r14b,%ebx
15f3   935173:	48 8d 84 24 b0 03 00 00 	lea    0x3b0(%rsp),%rax
15fb   93517b:	48 8d 3c 98          	lea    (%rax,%rbx,4),%rdi
15ff   93517f:	48 89 f8             	mov    %rdi,%rax
1602   935182:	48 c1 e8 03          	shr    $0x3,%rax
1606   935186:	42 8a 04 28          	mov    (%rax,%r13,1),%al
160a   93518a:	84 c0                	test   %al,%al
160c   93518c:	0f 85 7b 4a 00 00    	jne    939c0d <shrink_lruvec+0x608d>
1612   935192:	48 63 84 9c b0 03 00 00 	movslq 0x3b0(%rsp,%rbx,4),%rax
161a   93519a:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
1622   9351a2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1627   9351a7:	4c 8d 34 d8          	lea    (%rax,%rbx,8),%r14
162b   9351ab:	49 81 c6 d0 00 00 00 	add    $0xd0,%r14
1632   9351b2:	4c 89 f0             	mov    %r14,%rax
1635   9351b5:	48 c1 e8 03          	shr    $0x3,%rax
1639   9351b9:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
163e   9351be:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1643   9351c3:	74 08                	je     9351cd <shrink_lruvec+0x164d>
1645   9351c5:	4c 89 f7             	mov    %r14,%rdi
1648   9351c8:	e8 00 00 00 00       	call   9351cd <shrink_lruvec+0x164d>	9351c9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
164d   9351cd:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
1652   9351d2:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1657   9351d7:	4c 8b ac d8 d0 00 00 00 	mov    0xd0(%rax,%rbx,8),%r13
165f   9351df:	41 83 e5 03          	and    $0x3,%r13d
1663   9351e3:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
1668   9351e8:	48 c1 e3 05          	shl    $0x5,%rbx
166c   9351ec:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
1671   9351f1:	48 01 c3             	add    %rax,%rbx
1674   9351f4:	48 81 c3 28 03 00 00 	add    $0x328,%rbx
167b   9351fb:	48 89 d8             	mov    %rbx,%rax
167e   9351fe:	48 c1 e8 03          	shr    $0x3,%rax
1682   935202:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
168c   93520c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1690   935210:	74 08                	je     93521a <shrink_lruvec+0x169a>
1692   935212:	48 89 df             	mov    %rbx,%rdi
1695   935215:	e8 00 00 00 00       	call   93521a <shrink_lruvec+0x169a>	935216: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
169a   93521a:	4c 8b 3b             	mov    (%rbx),%r15
169d   93521d:	4d 89 ee             	mov    %r13,%r14
16a0   935220:	49 c1 e6 06          	shl    $0x6,%r14
16a4   935224:	4c 03 74 24 18       	add    0x18(%rsp),%r14
16a9   935229:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
16ae   93522e:	4a 8d 1c 30          	lea    (%rax,%r14,1),%rbx
16b2   935232:	48 81 c3 68 05 00 00 	add    $0x568,%rbx
16b9   935239:	48 89 df             	mov    %rbx,%rdi
16bc   93523c:	be 08 00 00 00       	mov    $0x8,%esi
16c1   935241:	e8 00 00 00 00       	call   935246 <shrink_lruvec+0x16c6>	935242: R_X86_64_PLT32	__kasan_check_read-0x4
16c6   935246:	48 89 d8             	mov    %rbx,%rax
16c9   935249:	48 c1 e8 03          	shr    $0x3,%rax
16cd   93524d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
16d7   935257:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
16db   93525b:	74 08                	je     935265 <shrink_lruvec+0x16e5>
16dd   93525d:	48 89 df             	mov    %rbx,%rdi
16e0   935260:	e8 00 00 00 00       	call   935265 <shrink_lruvec+0x16e5>	935261: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
16e5   935265:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
16ea   93526a:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
16ef   93526f:	4c 8d 24 08          	lea    (%rax,%rcx,1),%r12
16f3   935273:	49 81 c4 68 03 00 00 	add    $0x368,%r12
16fa   93527a:	4c 89 e0             	mov    %r12,%rax
16fd   93527d:	48 c1 e8 03          	shr    $0x3,%rax
1701   935281:	4c 03 3b             	add    (%rbx),%r15
1704   935284:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
170e   93528e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1712   935292:	74 08                	je     93529c <shrink_lruvec+0x171c>
1714   935294:	4c 89 e7             	mov    %r12,%rdi
1717   935297:	e8 00 00 00 00       	call   93529c <shrink_lruvec+0x171c>	935298: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
171c   93529c:	4d 8b 24 24          	mov    (%r12),%r12
1720   9352a0:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
1725   9352a5:	4a 8d 1c 30          	lea    (%rax,%r14,1),%rbx
1729   9352a9:	48 81 c3 68 04 00 00 	add    $0x468,%rbx
1730   9352b0:	48 89 df             	mov    %rbx,%rdi
1733   9352b3:	be 08 00 00 00       	mov    $0x8,%esi
1738   9352b8:	e8 00 00 00 00       	call   9352bd <shrink_lruvec+0x173d>	9352b9: R_X86_64_PLT32	__kasan_check_read-0x4
173d   9352bd:	48 89 d8             	mov    %rbx,%rax
1740   9352c0:	48 c1 e8 03          	shr    $0x3,%rax
1744   9352c4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
174e   9352ce:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1752   9352d2:	74 08                	je     9352dc <shrink_lruvec+0x175c>
1754   9352d4:	48 89 df             	mov    %rbx,%rdi
1757   9352d7:	e8 00 00 00 00       	call   9352dc <shrink_lruvec+0x175c>	9352d8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
175c   9352dc:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
1764   9352e4:	48 8b 8c 24 88 00 00 00 	mov    0x88(%rsp),%rcx
176c   9352ec:	48 01 c8             	add    %rcx,%rax
176f   9352ef:	48 83 c0 40          	add    $0x40,%rax
1773   9352f3:	48 0f af 44 24 28    	imul   0x28(%rsp),%rax
1779   9352f9:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
177e   9352fe:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
1783   935303:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
1788   935308:	48 01 c8             	add    %rcx,%rax
178b   93530b:	48 83 c0 01          	add    $0x1,%rax
178f   93530f:	48 0f af 84 24 80 00 00 00 	imul   0x80(%rsp),%rax
1798   935318:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
179d   93531d:	48 8b 1b             	mov    (%rbx),%rbx
17a0   935320:	bf 40 00 00 00       	mov    $0x40,%edi
17a5   935325:	4c 89 fe             	mov    %r15,%rsi
17a8   935328:	e8 00 00 00 00       	call   93532d <shrink_lruvec+0x17ad>	935329: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
17ad   93532d:	49 83 ff 3f          	cmp    $0x3f,%r15
17b1   935331:	77 11                	ja     935344 <shrink_lruvec+0x17c4>
17b3   935333:	e8 00 00 00 00       	call   935338 <shrink_lruvec+0x17b8>	935334: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17b8   935338:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
17c2   935342:	eb 7d                	jmp    9353c1 <shrink_lruvec+0x1841>
17c4   935344:	4c 01 e3             	add    %r12,%rbx
17c7   935347:	4a 8d 04 6d 00 00 00 00 	lea    0x0(,%r13,2),%rax
17cf   93534f:	4c 01 e8             	add    %r13,%rax
17d2   935352:	48 c1 e0 04          	shl    $0x4,%rax
17d6   935356:	48 03 44 24 18       	add    0x18(%rsp),%rax
17db   93535b:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
17e0   935360:	48 8d 0c 49          	lea    (%rcx,%rcx,2),%rcx
17e4   935364:	4c 8d 24 c8          	lea    (%rax,%rcx,8),%r12
17e8   935368:	49 81 c4 a0 03 00 00 	add    $0x3a0,%r12
17ef   93536f:	4c 89 e0             	mov    %r12,%rax
17f2   935372:	48 c1 e8 03          	shr    $0x3,%rax
17f6   935376:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
1800   935380:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1805   935385:	74 08                	je     93538f <shrink_lruvec+0x180f>
1807   935387:	4c 89 e7             	mov    %r12,%rdi
180a   93538a:	e8 00 00 00 00       	call   93538f <shrink_lruvec+0x180f>	93538b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
180f   93538f:	49 03 1c 24          	add    (%r12),%rbx
1813   935393:	4c 0f af 7c 24 28    	imul   0x28(%rsp),%r15
1819   935399:	48 0f af 5c 24 38    	imul   0x38(%rsp),%rbx
181f   93539f:	4c 89 ff             	mov    %r15,%rdi
1822   9353a2:	48 89 de             	mov    %rbx,%rsi
1825   9353a5:	e8 00 00 00 00       	call   9353aa <shrink_lruvec+0x182a>	9353a6: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
182a   9353aa:	49 39 df             	cmp    %rbx,%r15
182d   9353ad:	76 0d                	jbe    9353bc <shrink_lruvec+0x183c>
182f   9353af:	e8 00 00 00 00       	call   9353b4 <shrink_lruvec+0x1834>	9353b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1834   9353b4:	45 31 f6             	xor    %r14d,%r14d
1837   9353b7:	e9 36 03 00 00       	jmp    9356f2 <shrink_lruvec+0x1b72>
183c   9353bc:	e8 00 00 00 00       	call   9353c1 <shrink_lruvec+0x1841>	9353bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1841   9353c1:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
1846   9353c6:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
184b   9353cb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1850   9353d0:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
1855   9353d5:	74 05                	je     9353dc <shrink_lruvec+0x185c>
1857   9353d7:	e8 00 00 00 00       	call   9353dc <shrink_lruvec+0x185c>	9353d8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
185c   9353dc:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1861   9353e1:	4c 8b b4 d8 d0 00 00 00 	mov    0xd0(%rax,%rbx,8),%r14
1869   9353e9:	41 83 e6 03          	and    $0x3,%r14d
186d   9353ed:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
1872   9353f2:	48 8d 1c 08          	lea    (%rax,%rcx,1),%rbx
1876   9353f6:	48 81 c3 30 03 00 00 	add    $0x330,%rbx
187d   9353fd:	48 89 d8             	mov    %rbx,%rax
1880   935400:	48 c1 e8 03          	shr    $0x3,%rax
1884   935404:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1889   935409:	74 08                	je     935413 <shrink_lruvec+0x1893>
188b   93540b:	48 89 df             	mov    %rbx,%rdi
188e   93540e:	e8 00 00 00 00       	call   935413 <shrink_lruvec+0x1893>	93540f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1893   935413:	4c 8b 3b             	mov    (%rbx),%r15
1896   935416:	4c 89 f3             	mov    %r14,%rbx
1899   935419:	48 c1 e3 06          	shl    $0x6,%rbx
189d   93541d:	48 03 5c 24 18       	add    0x18(%rsp),%rbx
18a2   935422:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
18a7   935427:	4c 8d 2c 18          	lea    (%rax,%rbx,1),%r13
18ab   93542b:	49 81 c5 70 05 00 00 	add    $0x570,%r13
18b2   935432:	4c 89 ef             	mov    %r13,%rdi
18b5   935435:	be 08 00 00 00       	mov    $0x8,%esi
18ba   93543a:	e8 00 00 00 00       	call   93543f <shrink_lruvec+0x18bf>	93543b: R_X86_64_PLT32	__kasan_check_read-0x4
18bf   93543f:	4c 89 e8             	mov    %r13,%rax
18c2   935442:	48 c1 e8 03          	shr    $0x3,%rax
18c6   935446:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
18d0   935450:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
18d4   935454:	74 08                	je     93545e <shrink_lruvec+0x18de>
18d6   935456:	4c 89 ef             	mov    %r13,%rdi
18d9   935459:	e8 00 00 00 00       	call   93545e <shrink_lruvec+0x18de>	93545a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
18de   93545e:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
18e3   935463:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
18e8   935468:	4c 8d 24 08          	lea    (%rax,%rcx,1),%r12
18ec   93546c:	49 81 c4 70 03 00 00 	add    $0x370,%r12
18f3   935473:	4c 89 e0             	mov    %r12,%rax
18f6   935476:	48 c1 e8 03          	shr    $0x3,%rax
18fa   93547a:	4d 03 7d 00          	add    0x0(%r13),%r15
18fe   93547e:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
1908   935488:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
190d   93548d:	74 08                	je     935497 <shrink_lruvec+0x1917>
190f   93548f:	4c 89 e7             	mov    %r12,%rdi
1912   935492:	e8 00 00 00 00       	call   935497 <shrink_lruvec+0x1917>	935493: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1917   935497:	4d 8b 24 24          	mov    (%r12),%r12
191b   93549b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
1920   9354a0:	48 01 c3             	add    %rax,%rbx
1923   9354a3:	48 81 c3 70 04 00 00 	add    $0x470,%rbx
192a   9354aa:	48 89 df             	mov    %rbx,%rdi
192d   9354ad:	be 08 00 00 00       	mov    $0x8,%esi
1932   9354b2:	e8 00 00 00 00       	call   9354b7 <shrink_lruvec+0x1937>	9354b3: R_X86_64_PLT32	__kasan_check_read-0x4
1937   9354b7:	48 89 d8             	mov    %rbx,%rax
193a   9354ba:	48 c1 e8 03          	shr    $0x3,%rax
193e   9354be:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1943   9354c3:	74 08                	je     9354cd <shrink_lruvec+0x194d>
1945   9354c5:	48 89 df             	mov    %rbx,%rdi
1948   9354c8:	e8 00 00 00 00       	call   9354cd <shrink_lruvec+0x194d>	9354c9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
194d   9354cd:	48 8b 1b             	mov    (%rbx),%rbx
1950   9354d0:	bf 40 00 00 00       	mov    $0x40,%edi
1955   9354d5:	4c 89 fe             	mov    %r15,%rsi
1958   9354d8:	e8 00 00 00 00       	call   9354dd <shrink_lruvec+0x195d>	9354d9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
195d   9354dd:	49 83 ff 3f          	cmp    $0x3f,%r15
1961   9354e1:	77 07                	ja     9354ea <shrink_lruvec+0x196a>
1963   9354e3:	e8 00 00 00 00       	call   9354e8 <shrink_lruvec+0x1968>	9354e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1968   9354e8:	eb 6f                	jmp    935559 <shrink_lruvec+0x19d9>
196a   9354ea:	4c 01 e3             	add    %r12,%rbx
196d   9354ed:	4b 8d 04 76          	lea    (%r14,%r14,2),%rax
1971   9354f1:	48 c1 e0 04          	shl    $0x4,%rax
1975   9354f5:	48 03 44 24 18       	add    0x18(%rsp),%rax
197a   9354fa:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
197f   9354ff:	48 8d 0c 49          	lea    (%rcx,%rcx,2),%rcx
1983   935503:	4c 8d 24 c8          	lea    (%rax,%rcx,8),%r12
1987   935507:	49 81 c4 a8 03 00 00 	add    $0x3a8,%r12
198e   93550e:	4c 89 e0             	mov    %r12,%rax
1991   935511:	48 c1 e8 03          	shr    $0x3,%rax
1995   935515:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
199a   93551a:	74 08                	je     935524 <shrink_lruvec+0x19a4>
199c   93551c:	4c 89 e7             	mov    %r12,%rdi
199f   93551f:	e8 00 00 00 00       	call   935524 <shrink_lruvec+0x19a4>	935520: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19a4   935524:	49 03 1c 24          	add    (%r12),%rbx
19a8   935528:	4c 0f af 7c 24 28    	imul   0x28(%rsp),%r15
19ae   93552e:	48 0f af 5c 24 38    	imul   0x38(%rsp),%rbx
19b4   935534:	4c 89 ff             	mov    %r15,%rdi
19b7   935537:	48 89 de             	mov    %rbx,%rsi
19ba   93553a:	e8 00 00 00 00       	call   93553f <shrink_lruvec+0x19bf>	93553b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
19bf   93553f:	49 39 df             	cmp    %rbx,%r15
19c2   935542:	76 10                	jbe    935554 <shrink_lruvec+0x19d4>
19c4   935544:	e8 00 00 00 00       	call   935549 <shrink_lruvec+0x19c9>	935545: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19c9   935549:	41 be 01 00 00 00    	mov    $0x1,%r14d
19cf   93554f:	e9 9e 01 00 00       	jmp    9356f2 <shrink_lruvec+0x1b72>
19d4   935554:	e8 00 00 00 00       	call   935559 <shrink_lruvec+0x19d9>	935555: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
19d9   935559:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
19de   93555e:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
19e3   935563:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
19e8   935568:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
19ed   93556d:	74 05                	je     935574 <shrink_lruvec+0x19f4>
19ef   93556f:	e8 00 00 00 00       	call   935574 <shrink_lruvec+0x19f4>	935570: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
19f4   935574:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
19f9   935579:	4c 8b a4 d8 d0 00 00 00 	mov    0xd0(%rax,%rbx,8),%r12
1a01   935581:	41 83 e4 03          	and    $0x3,%r12d
1a05   935585:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
1a0a   93558a:	48 8d 1c 08          	lea    (%rax,%rcx,1),%rbx
1a0e   93558e:	48 81 c3 38 03 00 00 	add    $0x338,%rbx
1a15   935595:	48 89 d8             	mov    %rbx,%rax
1a18   935598:	48 c1 e8 03          	shr    $0x3,%rax
1a1c   93559c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1a21   9355a1:	74 08                	je     9355ab <shrink_lruvec+0x1a2b>
1a23   9355a3:	48 89 df             	mov    %rbx,%rdi
1a26   9355a6:	e8 00 00 00 00       	call   9355ab <shrink_lruvec+0x1a2b>	9355a7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1a2b   9355ab:	4c 8b 33             	mov    (%rbx),%r14
1a2e   9355ae:	4c 89 e3             	mov    %r12,%rbx
1a31   9355b1:	48 c1 e3 06          	shl    $0x6,%rbx
1a35   9355b5:	48 03 5c 24 18       	add    0x18(%rsp),%rbx
1a3a   9355ba:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
1a3f   9355bf:	4c 8d 2c 18          	lea    (%rax,%rbx,1),%r13
1a43   9355c3:	49 81 c5 78 05 00 00 	add    $0x578,%r13
1a4a   9355ca:	4c 89 ef             	mov    %r13,%rdi
1a4d   9355cd:	be 08 00 00 00       	mov    $0x8,%esi
1a52   9355d2:	e8 00 00 00 00       	call   9355d7 <shrink_lruvec+0x1a57>	9355d3: R_X86_64_PLT32	__kasan_check_read-0x4
1a57   9355d7:	4c 89 e8             	mov    %r13,%rax
1a5a   9355da:	48 c1 e8 03          	shr    $0x3,%rax
1a5e   9355de:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1a68   9355e8:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1a6c   9355ec:	74 08                	je     9355f6 <shrink_lruvec+0x1a76>
1a6e   9355ee:	4c 89 ef             	mov    %r13,%rdi
1a71   9355f1:	e8 00 00 00 00       	call   9355f6 <shrink_lruvec+0x1a76>	9355f2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1a76   9355f6:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1a7b   9355fb:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
1a80   935600:	4c 8d 3c 08          	lea    (%rax,%rcx,1),%r15
1a84   935604:	49 81 c7 78 03 00 00 	add    $0x378,%r15
1a8b   93560b:	4c 89 f8             	mov    %r15,%rax
1a8e   93560e:	48 c1 e8 03          	shr    $0x3,%rax
1a92   935612:	4d 03 75 00          	add    0x0(%r13),%r14
1a96   935616:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
1aa0   935620:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1aa5   935625:	74 08                	je     93562f <shrink_lruvec+0x1aaf>
1aa7   935627:	4c 89 ff             	mov    %r15,%rdi
1aaa   93562a:	e8 00 00 00 00       	call   93562f <shrink_lruvec+0x1aaf>	93562b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1aaf   93562f:	4d 8b 3f             	mov    (%r15),%r15
1ab2   935632:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
1ab7   935637:	48 01 c3             	add    %rax,%rbx
1aba   93563a:	48 81 c3 78 04 00 00 	add    $0x478,%rbx
1ac1   935641:	48 89 df             	mov    %rbx,%rdi
1ac4   935644:	be 08 00 00 00       	mov    $0x8,%esi
1ac9   935649:	e8 00 00 00 00       	call   93564e <shrink_lruvec+0x1ace>	93564a: R_X86_64_PLT32	__kasan_check_read-0x4
1ace   93564e:	48 89 d8             	mov    %rbx,%rax
1ad1   935651:	48 c1 e8 03          	shr    $0x3,%rax
1ad5   935655:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1ada   93565a:	74 08                	je     935664 <shrink_lruvec+0x1ae4>
1adc   93565c:	48 89 df             	mov    %rbx,%rdi
1adf   93565f:	e8 00 00 00 00       	call   935664 <shrink_lruvec+0x1ae4>	935660: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1ae4   935664:	48 8b 1b             	mov    (%rbx),%rbx
1ae7   935667:	bf 40 00 00 00       	mov    $0x40,%edi
1aec   93566c:	4c 89 f6             	mov    %r14,%rsi
1aef   93566f:	e8 00 00 00 00       	call   935674 <shrink_lruvec+0x1af4>	935670: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1af4   935674:	49 83 fe 3f          	cmp    $0x3f,%r14
1af8   935678:	77 07                	ja     935681 <shrink_lruvec+0x1b01>
1afa   93567a:	e8 00 00 00 00       	call   93567f <shrink_lruvec+0x1aff>	93567b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1aff   93567f:	eb 6b                	jmp    9356ec <shrink_lruvec+0x1b6c>
1b01   935681:	4c 01 fb             	add    %r15,%rbx
1b04   935684:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
1b08   935688:	48 c1 e0 04          	shl    $0x4,%rax
1b0c   93568c:	48 03 44 24 18       	add    0x18(%rsp),%rax
1b11   935691:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
1b16   935696:	48 8d 0c 49          	lea    (%rcx,%rcx,2),%rcx
1b1a   93569a:	4c 8d 3c c8          	lea    (%rax,%rcx,8),%r15
1b1e   93569e:	49 81 c7 b0 03 00 00 	add    $0x3b0,%r15
1b25   9356a5:	4c 89 f8             	mov    %r15,%rax
1b28   9356a8:	48 c1 e8 03          	shr    $0x3,%rax
1b2c   9356ac:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1b31   9356b1:	74 08                	je     9356bb <shrink_lruvec+0x1b3b>
1b33   9356b3:	4c 89 ff             	mov    %r15,%rdi
1b36   9356b6:	e8 00 00 00 00       	call   9356bb <shrink_lruvec+0x1b3b>	9356b7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1b3b   9356bb:	49 03 1f             	add    (%r15),%rbx
1b3e   9356be:	4c 0f af 74 24 28    	imul   0x28(%rsp),%r14
1b44   9356c4:	48 0f af 5c 24 38    	imul   0x38(%rsp),%rbx
1b4a   9356ca:	4c 89 f7             	mov    %r14,%rdi
1b4d   9356cd:	48 89 de             	mov    %rbx,%rsi
1b50   9356d0:	e8 00 00 00 00       	call   9356d5 <shrink_lruvec+0x1b55>	9356d1: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1b55   9356d5:	49 39 de             	cmp    %rbx,%r14
1b58   9356d8:	76 0d                	jbe    9356e7 <shrink_lruvec+0x1b67>
1b5a   9356da:	e8 00 00 00 00       	call   9356df <shrink_lruvec+0x1b5f>	9356db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b5f   9356df:	41 be 02 00 00 00    	mov    $0x2,%r14d
1b65   9356e5:	eb 0b                	jmp    9356f2 <shrink_lruvec+0x1b72>
1b67   9356e7:	e8 00 00 00 00       	call   9356ec <shrink_lruvec+0x1b6c>	9356e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b6c   9356ec:	41 be 03 00 00 00    	mov    $0x3,%r14d
1b72   9356f2:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
1b77   9356f7:	8b 84 24 b0 00 00 00 	mov    0xb0(%rsp),%eax
1b7e   9356fe:	31 c9                	xor    %ecx,%ecx
1b80   935700:	85 c0                	test   %eax,%eax
1b82   935702:	0f 94 c1             	sete   %cl
1b85   935705:	89 8c 24 04 02 00 00 	mov    %ecx,0x204(%rsp)
1b8c   93570c:	89 8c 24 a8 01 00 00 	mov    %ecx,0x1a8(%rsp)
1b93   935713:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
1b98   935718:	31 ff                	xor    %edi,%edi
1b9a   93571a:	44 89 f6             	mov    %r14d,%esi
1b9d   93571d:	e8 00 00 00 00       	call   935722 <shrink_lruvec+0x1ba2>	93571e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1ba2   935722:	44 89 f0             	mov    %r14d,%eax
1ba5   935725:	41 89 de             	mov    %ebx,%r14d
1ba8   935728:	89 84 24 a0 00 00 00 	mov    %eax,0xa0(%rsp)
1baf   93572f:	85 c0                	test   %eax,%eax
1bb1   935731:	4c 89 b4 24 b8 00 00 00 	mov    %r14,0xb8(%rsp)
1bb9   935739:	78 0a                	js     935745 <shrink_lruvec+0x1bc5>
1bbb   93573b:	e8 00 00 00 00       	call   935740 <shrink_lruvec+0x1bc0>	93573c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bc0   935740:	e9 4d 06 00 00       	jmp    935d92 <shrink_lruvec+0x2212>
1bc5   935745:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1bca   93574a:	4e 8d 3c f0          	lea    (%rax,%r14,8),%r15
1bce   93574e:	49 81 c7 d0 00 00 00 	add    $0xd0,%r15
1bd5   935755:	4c 89 f8             	mov    %r15,%rax
1bd8   935758:	48 c1 e8 03          	shr    $0x3,%rax
1bdc   93575c:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
1be1   935761:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1be6   935766:	74 08                	je     935770 <shrink_lruvec+0x1bf0>
1be8   935768:	4c 89 ff             	mov    %r15,%rdi
1beb   93576b:	e8 00 00 00 00       	call   935770 <shrink_lruvec+0x1bf0>	93576c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1bf0   935770:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1bf5   935775:	4a 8b 9c f0 d0 00 00 00 	mov    0xd0(%rax,%r14,8),%rbx
1bfd   93577d:	83 e3 03             	and    $0x3,%ebx
1c00   935780:	4d 89 f4             	mov    %r14,%r12
1c03   935783:	49 c1 e4 05          	shl    $0x5,%r12
1c07   935787:	4e 8d 34 20          	lea    (%rax,%r12,1),%r14
1c0b   93578b:	49 81 c6 20 03 00 00 	add    $0x320,%r14
1c12   935792:	4c 89 f0             	mov    %r14,%rax
1c15   935795:	48 c1 e8 03          	shr    $0x3,%rax
1c19   935799:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1c1e   93579e:	74 08                	je     9357a8 <shrink_lruvec+0x1c28>
1c20   9357a0:	4c 89 f7             	mov    %r14,%rdi
1c23   9357a3:	e8 00 00 00 00       	call   9357a8 <shrink_lruvec+0x1c28>	9357a4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1c28   9357a8:	49 8b 06             	mov    (%r14),%rax
1c2b   9357ab:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
1c30   9357b0:	48 c1 e3 06          	shl    $0x6,%rbx
1c34   9357b4:	48 03 5c 24 18       	add    0x18(%rsp),%rbx
1c39   9357b9:	4d 8d 34 1c          	lea    (%r12,%rbx,1),%r14
1c3d   9357bd:	49 81 c6 60 05 00 00 	add    $0x560,%r14
1c44   9357c4:	4c 89 f7             	mov    %r14,%rdi
1c47   9357c7:	be 08 00 00 00       	mov    $0x8,%esi
1c4c   9357cc:	e8 00 00 00 00       	call   9357d1 <shrink_lruvec+0x1c51>	9357cd: R_X86_64_PLT32	__kasan_check_read-0x4
1c51   9357d1:	4c 89 f0             	mov    %r14,%rax
1c54   9357d4:	48 c1 e8 03          	shr    $0x3,%rax
1c58   9357d8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1c5d   9357dd:	74 08                	je     9357e7 <shrink_lruvec+0x1c67>
1c5f   9357df:	4c 89 f7             	mov    %r14,%rdi
1c62   9357e2:	e8 00 00 00 00       	call   9357e7 <shrink_lruvec+0x1c67>	9357e3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1c67   9357e7:	49 8b 06             	mov    (%r14),%rax
1c6a   9357ea:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
1c6f   9357ef:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1c74   9357f4:	4e 8d 34 20          	lea    (%rax,%r12,1),%r14
1c78   9357f8:	49 81 c6 60 03 00 00 	add    $0x360,%r14
1c7f   9357ff:	4c 89 f0             	mov    %r14,%rax
1c82   935802:	48 c1 e8 03          	shr    $0x3,%rax
1c86   935806:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1c8b   93580b:	74 08                	je     935815 <shrink_lruvec+0x1c95>
1c8d   93580d:	4c 89 f7             	mov    %r14,%rdi
1c90   935810:	e8 00 00 00 00       	call   935815 <shrink_lruvec+0x1c95>	935811: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1c95   935815:	49 8b 06             	mov    (%r14),%rax
1c98   935818:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
1c9d   93581d:	4c 01 e3             	add    %r12,%rbx
1ca0   935820:	48 81 c3 60 04 00 00 	add    $0x460,%rbx
1ca7   935827:	48 89 df             	mov    %rbx,%rdi
1caa   93582a:	be 08 00 00 00       	mov    $0x8,%esi
1caf   93582f:	e8 00 00 00 00       	call   935834 <shrink_lruvec+0x1cb4>	935830: R_X86_64_PLT32	__kasan_check_read-0x4
1cb4   935834:	48 89 d8             	mov    %rbx,%rax
1cb7   935837:	48 c1 e8 03          	shr    $0x3,%rax
1cbb   93583b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1cc0   935840:	74 08                	je     93584a <shrink_lruvec+0x1cca>
1cc2   935842:	48 89 df             	mov    %rbx,%rdi
1cc5   935845:	e8 00 00 00 00       	call   93584a <shrink_lruvec+0x1cca>	935846: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1cca   93584a:	48 8b 03             	mov    (%rbx),%rax
1ccd   93584d:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
1cd5   935855:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1cda   93585a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1cdf   93585f:	48 8b 9c 24 b8 00 00 00 	mov    0xb8(%rsp),%rbx
1ce7   935867:	74 08                	je     935871 <shrink_lruvec+0x1cf1>
1ce9   935869:	4c 89 ff             	mov    %r15,%rdi
1cec   93586c:	e8 00 00 00 00       	call   935871 <shrink_lruvec+0x1cf1>	93586d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1cf1   935871:	4c 89 7c 24 28       	mov    %r15,0x28(%rsp)
1cf6   935876:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1cfb   93587b:	4c 8b ac d8 d0 00 00 00 	mov    0xd0(%rax,%rbx,8),%r13
1d03   935883:	41 83 e5 03          	and    $0x3,%r13d
1d07   935887:	4a 8d 1c 20          	lea    (%rax,%r12,1),%rbx
1d0b   93588b:	48 81 c3 28 03 00 00 	add    $0x328,%rbx
1d12   935892:	48 89 d8             	mov    %rbx,%rax
1d15   935895:	48 c1 e8 03          	shr    $0x3,%rax
1d19   935899:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d23   9358a3:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1d27   9358a7:	74 08                	je     9358b1 <shrink_lruvec+0x1d31>
1d29   9358a9:	48 89 df             	mov    %rbx,%rdi
1d2c   9358ac:	e8 00 00 00 00       	call   9358b1 <shrink_lruvec+0x1d31>	9358ad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d31   9358b1:	4c 8b 3b             	mov    (%rbx),%r15
1d34   9358b4:	4d 89 ee             	mov    %r13,%r14
1d37   9358b7:	49 c1 e6 06          	shl    $0x6,%r14
1d3b   9358bb:	4c 03 74 24 18       	add    0x18(%rsp),%r14
1d40   9358c0:	4b 8d 1c 34          	lea    (%r12,%r14,1),%rbx
1d44   9358c4:	48 81 c3 68 05 00 00 	add    $0x568,%rbx
1d4b   9358cb:	48 89 df             	mov    %rbx,%rdi
1d4e   9358ce:	be 08 00 00 00       	mov    $0x8,%esi
1d53   9358d3:	e8 00 00 00 00       	call   9358d8 <shrink_lruvec+0x1d58>	9358d4: R_X86_64_PLT32	__kasan_check_read-0x4
1d58   9358d8:	48 89 d8             	mov    %rbx,%rax
1d5b   9358db:	48 c1 e8 03          	shr    $0x3,%rax
1d5f   9358df:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d69   9358e9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1d6d   9358ed:	74 08                	je     9358f7 <shrink_lruvec+0x1d77>
1d6f   9358ef:	48 89 df             	mov    %rbx,%rdi
1d72   9358f2:	e8 00 00 00 00       	call   9358f7 <shrink_lruvec+0x1d77>	9358f3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d77   9358f7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1d7c   9358fc:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
1d81   935901:	49 01 c4             	add    %rax,%r12
1d84   935904:	49 81 c4 68 03 00 00 	add    $0x368,%r12
1d8b   93590b:	4c 89 e0             	mov    %r12,%rax
1d8e   93590e:	48 c1 e8 03          	shr    $0x3,%rax
1d92   935912:	4c 03 3b             	add    (%rbx),%r15
1d95   935915:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1d9f   93591f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1da3   935923:	74 08                	je     93592d <shrink_lruvec+0x1dad>
1da5   935925:	4c 89 e7             	mov    %r12,%rdi
1da8   935928:	e8 00 00 00 00       	call   93592d <shrink_lruvec+0x1dad>	935929: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1dad   93592d:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
1db2   935932:	48 01 44 24 30       	add    %rax,0x30(%rsp)
1db7   935937:	4d 8b 24 24          	mov    (%r12),%r12
1dbb   93593b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
1dc0   935940:	4a 8d 1c 30          	lea    (%rax,%r14,1),%rbx
1dc4   935944:	48 81 c3 68 04 00 00 	add    $0x468,%rbx
1dcb   93594b:	48 89 df             	mov    %rbx,%rdi
1dce   93594e:	be 08 00 00 00       	mov    $0x8,%esi
1dd3   935953:	e8 00 00 00 00       	call   935958 <shrink_lruvec+0x1dd8>	935954: R_X86_64_PLT32	__kasan_check_read-0x4
1dd8   935958:	48 89 d8             	mov    %rbx,%rax
1ddb   93595b:	48 c1 e8 03          	shr    $0x3,%rax
1ddf   93595f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1de9   935969:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1ded   93596d:	74 08                	je     935977 <shrink_lruvec+0x1df7>
1def   93596f:	48 89 df             	mov    %rbx,%rdi
1df2   935972:	e8 00 00 00 00       	call   935977 <shrink_lruvec+0x1df7>	935973: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1df7   935977:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
1dfc   93597c:	48 8b 8c 24 a8 00 00 00 	mov    0xa8(%rsp),%rcx
1e04   935984:	48 01 c8             	add    %rcx,%rax
1e07   935987:	48 83 c0 40          	add    $0x40,%rax
1e0b   93598b:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
1e10   935990:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
1e15   935995:	48 8d 44 00 02       	lea    0x2(%rax,%rax,1),%rax
1e1a   93599a:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
1e1f   93599f:	48 8b 1b             	mov    (%rbx),%rbx
1e22   9359a2:	bf 40 00 00 00       	mov    $0x40,%edi
1e27   9359a7:	4c 89 fe             	mov    %r15,%rsi
1e2a   9359aa:	e8 00 00 00 00       	call   9359af <shrink_lruvec+0x1e2f>	9359ab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1e2f   9359af:	49 83 ff 3f          	cmp    $0x3f,%r15
1e33   9359b3:	4c 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%r14
1e3b   9359bb:	77 14                	ja     9359d1 <shrink_lruvec+0x1e51>
1e3d   9359bd:	e8 00 00 00 00       	call   9359c2 <shrink_lruvec+0x1e42>	9359be: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1e42   9359c2:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
1e4c   9359cc:	e9 80 00 00 00       	jmp    935a51 <shrink_lruvec+0x1ed1>
1e51   9359d1:	4c 01 e3             	add    %r12,%rbx
1e54   9359d4:	4a 8d 04 6d 00 00 00 00 	lea    0x0(,%r13,2),%rax
1e5c   9359dc:	4c 01 e8             	add    %r13,%rax
1e5f   9359df:	48 c1 e0 04          	shl    $0x4,%rax
1e63   9359e3:	48 03 44 24 18       	add    0x18(%rsp),%rax
1e68   9359e8:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
1e6c   9359ec:	4c 8d 24 c8          	lea    (%rax,%rcx,8),%r12
1e70   9359f0:	49 81 c4 a0 03 00 00 	add    $0x3a0,%r12
1e77   9359f7:	4c 89 e0             	mov    %r12,%rax
1e7a   9359fa:	48 c1 e8 03          	shr    $0x3,%rax
1e7e   9359fe:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
1e88   935a08:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1e8d   935a0d:	74 08                	je     935a17 <shrink_lruvec+0x1e97>
1e8f   935a0f:	4c 89 e7             	mov    %r12,%rdi
1e92   935a12:	e8 00 00 00 00       	call   935a17 <shrink_lruvec+0x1e97>	935a13: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e97   935a17:	49 03 1c 24          	add    (%r12),%rbx
1e9b   935a1b:	4c 0f af 7c 24 38    	imul   0x38(%rsp),%r15
1ea1   935a21:	48 0f af 5c 24 30    	imul   0x30(%rsp),%rbx
1ea7   935a27:	4c 89 ff             	mov    %r15,%rdi
1eaa   935a2a:	48 89 de             	mov    %rbx,%rsi
1ead   935a2d:	e8 00 00 00 00       	call   935a32 <shrink_lruvec+0x1eb2>	935a2e: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1eb2   935a32:	49 39 df             	cmp    %rbx,%r15
1eb5   935a35:	76 15                	jbe    935a4c <shrink_lruvec+0x1ecc>
1eb7   935a37:	e8 00 00 00 00       	call   935a3c <shrink_lruvec+0x1ebc>	935a38: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ebc   935a3c:	c7 84 24 a0 00 00 00 00 00 00 00 	movl   $0x0,0xa0(%rsp)
1ec7   935a47:	e9 46 03 00 00       	jmp    935d92 <shrink_lruvec+0x2212>
1ecc   935a4c:	e8 00 00 00 00       	call   935a51 <shrink_lruvec+0x1ed1>	935a4d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ed1   935a51:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
1ed6   935a56:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1edb   935a5b:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
1ee0   935a60:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
1ee5   935a65:	74 05                	je     935a6c <shrink_lruvec+0x1eec>
1ee7   935a67:	e8 00 00 00 00       	call   935a6c <shrink_lruvec+0x1eec>	935a68: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1eec   935a6c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1ef1   935a71:	4e 8b b4 f0 d0 00 00 00 	mov    0xd0(%rax,%r14,8),%r14
1ef9   935a79:	41 83 e6 03          	and    $0x3,%r14d
1efd   935a7d:	4a 8d 1c 20          	lea    (%rax,%r12,1),%rbx
1f01   935a81:	48 81 c3 30 03 00 00 	add    $0x330,%rbx
1f08   935a88:	48 89 d8             	mov    %rbx,%rax
1f0b   935a8b:	48 c1 e8 03          	shr    $0x3,%rax
1f0f   935a8f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1f14   935a94:	74 08                	je     935a9e <shrink_lruvec+0x1f1e>
1f16   935a96:	48 89 df             	mov    %rbx,%rdi
1f19   935a99:	e8 00 00 00 00       	call   935a9e <shrink_lruvec+0x1f1e>	935a9a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f1e   935a9e:	4c 8b 3b             	mov    (%rbx),%r15
1f21   935aa1:	4c 89 f3             	mov    %r14,%rbx
1f24   935aa4:	48 c1 e3 06          	shl    $0x6,%rbx
1f28   935aa8:	48 03 5c 24 18       	add    0x18(%rsp),%rbx
1f2d   935aad:	4d 8d 2c 1c          	lea    (%r12,%rbx,1),%r13
1f31   935ab1:	49 81 c5 70 05 00 00 	add    $0x570,%r13
1f38   935ab8:	4c 89 ef             	mov    %r13,%rdi
1f3b   935abb:	be 08 00 00 00       	mov    $0x8,%esi
1f40   935ac0:	e8 00 00 00 00       	call   935ac5 <shrink_lruvec+0x1f45>	935ac1: R_X86_64_PLT32	__kasan_check_read-0x4
1f45   935ac5:	4c 89 e8             	mov    %r13,%rax
1f48   935ac8:	48 c1 e8 03          	shr    $0x3,%rax
1f4c   935acc:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
1f56   935ad6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
1f5a   935ada:	74 08                	je     935ae4 <shrink_lruvec+0x1f64>
1f5c   935adc:	4c 89 ef             	mov    %r13,%rdi
1f5f   935adf:	e8 00 00 00 00       	call   935ae4 <shrink_lruvec+0x1f64>	935ae0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f64   935ae4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
1f69   935ae9:	49 01 c4             	add    %rax,%r12
1f6c   935aec:	49 81 c4 70 03 00 00 	add    $0x370,%r12
1f73   935af3:	4c 89 e0             	mov    %r12,%rax
1f76   935af6:	48 c1 e8 03          	shr    $0x3,%rax
1f7a   935afa:	4d 03 7d 00          	add    0x0(%r13),%r15
1f7e   935afe:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
1f88   935b08:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1f8d   935b0d:	74 08                	je     935b17 <shrink_lruvec+0x1f97>
1f8f   935b0f:	4c 89 e7             	mov    %r12,%rdi
1f92   935b12:	e8 00 00 00 00       	call   935b17 <shrink_lruvec+0x1f97>	935b13: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1f97   935b17:	4d 8b 24 24          	mov    (%r12),%r12
1f9b   935b1b:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
1fa0   935b20:	48 01 c3             	add    %rax,%rbx
1fa3   935b23:	48 81 c3 70 04 00 00 	add    $0x470,%rbx
1faa   935b2a:	48 89 df             	mov    %rbx,%rdi
1fad   935b2d:	be 08 00 00 00       	mov    $0x8,%esi
1fb2   935b32:	e8 00 00 00 00       	call   935b37 <shrink_lruvec+0x1fb7>	935b33: R_X86_64_PLT32	__kasan_check_read-0x4
1fb7   935b37:	48 89 d8             	mov    %rbx,%rax
1fba   935b3a:	48 c1 e8 03          	shr    $0x3,%rax
1fbe   935b3e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
1fc3   935b43:	74 08                	je     935b4d <shrink_lruvec+0x1fcd>
1fc5   935b45:	48 89 df             	mov    %rbx,%rdi
1fc8   935b48:	e8 00 00 00 00       	call   935b4d <shrink_lruvec+0x1fcd>	935b49: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1fcd   935b4d:	48 8b 1b             	mov    (%rbx),%rbx
1fd0   935b50:	bf 40 00 00 00       	mov    $0x40,%edi
1fd5   935b55:	4c 89 fe             	mov    %r15,%rsi
1fd8   935b58:	e8 00 00 00 00       	call   935b5d <shrink_lruvec+0x1fdd>	935b59: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1fdd   935b5d:	49 83 ff 3f          	cmp    $0x3f,%r15
1fe1   935b61:	77 0f                	ja     935b72 <shrink_lruvec+0x1ff2>
1fe3   935b63:	e8 00 00 00 00       	call   935b68 <shrink_lruvec+0x1fe8>	935b64: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1fe8   935b68:	4c 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%r14
1ff0   935b70:	eb 77                	jmp    935be9 <shrink_lruvec+0x2069>
1ff2   935b72:	4c 01 e3             	add    %r12,%rbx
1ff5   935b75:	4b 8d 04 76          	lea    (%r14,%r14,2),%rax
1ff9   935b79:	48 c1 e0 04          	shl    $0x4,%rax
1ffd   935b7d:	48 03 44 24 18       	add    0x18(%rsp),%rax
2002   935b82:	4c 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%r14
200a   935b8a:	4b 8d 0c 76          	lea    (%r14,%r14,2),%rcx
200e   935b8e:	4c 8d 24 c8          	lea    (%rax,%rcx,8),%r12
2012   935b92:	49 81 c4 a8 03 00 00 	add    $0x3a8,%r12
2019   935b99:	4c 89 e0             	mov    %r12,%rax
201c   935b9c:	48 c1 e8 03          	shr    $0x3,%rax
2020   935ba0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2025   935ba5:	74 08                	je     935baf <shrink_lruvec+0x202f>
2027   935ba7:	4c 89 e7             	mov    %r12,%rdi
202a   935baa:	e8 00 00 00 00       	call   935baf <shrink_lruvec+0x202f>	935bab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
202f   935baf:	49 03 1c 24          	add    (%r12),%rbx
2033   935bb3:	4c 0f af 7c 24 38    	imul   0x38(%rsp),%r15
2039   935bb9:	48 0f af 5c 24 30    	imul   0x30(%rsp),%rbx
203f   935bbf:	4c 89 ff             	mov    %r15,%rdi
2042   935bc2:	48 89 de             	mov    %rbx,%rsi
2045   935bc5:	e8 00 00 00 00       	call   935bca <shrink_lruvec+0x204a>	935bc6: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
204a   935bca:	49 39 df             	cmp    %rbx,%r15
204d   935bcd:	76 15                	jbe    935be4 <shrink_lruvec+0x2064>
204f   935bcf:	e8 00 00 00 00       	call   935bd4 <shrink_lruvec+0x2054>	935bd0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2054   935bd4:	c7 84 24 a0 00 00 00 01 00 00 00 	movl   $0x1,0xa0(%rsp)
205f   935bdf:	e9 ae 01 00 00       	jmp    935d92 <shrink_lruvec+0x2212>
2064   935be4:	e8 00 00 00 00       	call   935be9 <shrink_lruvec+0x2069>	935be5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2069   935be9:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
206e   935bee:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2073   935bf3:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
2078   935bf8:	74 05                	je     935bff <shrink_lruvec+0x207f>
207a   935bfa:	e8 00 00 00 00       	call   935bff <shrink_lruvec+0x207f>	935bfb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
207f   935bff:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
2084   935c04:	4e 8b a4 f0 d0 00 00 00 	mov    0xd0(%rax,%r14,8),%r12
208c   935c0c:	41 83 e4 03          	and    $0x3,%r12d
2090   935c10:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
2095   935c15:	48 8d 1c 08          	lea    (%rax,%rcx,1),%rbx
2099   935c19:	48 81 c3 38 03 00 00 	add    $0x338,%rbx
20a0   935c20:	48 89 d8             	mov    %rbx,%rax
20a3   935c23:	48 c1 e8 03          	shr    $0x3,%rax
20a7   935c27:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
20ac   935c2c:	74 08                	je     935c36 <shrink_lruvec+0x20b6>
20ae   935c2e:	48 89 df             	mov    %rbx,%rdi
20b1   935c31:	e8 00 00 00 00       	call   935c36 <shrink_lruvec+0x20b6>	935c32: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
20b6   935c36:	4c 8b 33             	mov    (%rbx),%r14
20b9   935c39:	4c 89 e3             	mov    %r12,%rbx
20bc   935c3c:	48 c1 e3 06          	shl    $0x6,%rbx
20c0   935c40:	48 03 5c 24 18       	add    0x18(%rsp),%rbx
20c5   935c45:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
20ca   935c4a:	4c 8d 2c 18          	lea    (%rax,%rbx,1),%r13
20ce   935c4e:	49 81 c5 78 05 00 00 	add    $0x578,%r13
20d5   935c55:	4c 89 ef             	mov    %r13,%rdi
20d8   935c58:	be 08 00 00 00       	mov    $0x8,%esi
20dd   935c5d:	e8 00 00 00 00       	call   935c62 <shrink_lruvec+0x20e2>	935c5e: R_X86_64_PLT32	__kasan_check_read-0x4
20e2   935c62:	4c 89 e8             	mov    %r13,%rax
20e5   935c65:	48 c1 e8 03          	shr    $0x3,%rax
20e9   935c69:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
20f3   935c73:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
20f7   935c77:	74 08                	je     935c81 <shrink_lruvec+0x2101>
20f9   935c79:	4c 89 ef             	mov    %r13,%rdi
20fc   935c7c:	e8 00 00 00 00       	call   935c81 <shrink_lruvec+0x2101>	935c7d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2101   935c81:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
2106   935c86:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
210b   935c8b:	4c 8d 3c 08          	lea    (%rax,%rcx,1),%r15
210f   935c8f:	49 81 c7 78 03 00 00 	add    $0x378,%r15
2116   935c96:	4c 89 f8             	mov    %r15,%rax
2119   935c99:	48 c1 e8 03          	shr    $0x3,%rax
211d   935c9d:	4d 03 75 00          	add    0x0(%r13),%r14
2121   935ca1:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
212b   935cab:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2130   935cb0:	74 08                	je     935cba <shrink_lruvec+0x213a>
2132   935cb2:	4c 89 ff             	mov    %r15,%rdi
2135   935cb5:	e8 00 00 00 00       	call   935cba <shrink_lruvec+0x213a>	935cb6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
213a   935cba:	4d 8b 3f             	mov    (%r15),%r15
213d   935cbd:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
2142   935cc2:	48 01 c3             	add    %rax,%rbx
2145   935cc5:	48 81 c3 78 04 00 00 	add    $0x478,%rbx
214c   935ccc:	48 89 df             	mov    %rbx,%rdi
214f   935ccf:	be 08 00 00 00       	mov    $0x8,%esi
2154   935cd4:	e8 00 00 00 00       	call   935cd9 <shrink_lruvec+0x2159>	935cd5: R_X86_64_PLT32	__kasan_check_read-0x4
2159   935cd9:	48 89 d8             	mov    %rbx,%rax
215c   935cdc:	48 c1 e8 03          	shr    $0x3,%rax
2160   935ce0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2165   935ce5:	74 08                	je     935cef <shrink_lruvec+0x216f>
2167   935ce7:	48 89 df             	mov    %rbx,%rdi
216a   935cea:	e8 00 00 00 00       	call   935cef <shrink_lruvec+0x216f>	935ceb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
216f   935cef:	48 8b 1b             	mov    (%rbx),%rbx
2172   935cf2:	bf 40 00 00 00       	mov    $0x40,%edi
2177   935cf7:	4c 89 f6             	mov    %r14,%rsi
217a   935cfa:	e8 00 00 00 00       	call   935cff <shrink_lruvec+0x217f>	935cfb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
217f   935cff:	49 83 fe 3f          	cmp    $0x3f,%r14
2183   935d03:	77 07                	ja     935d0c <shrink_lruvec+0x218c>
2185   935d05:	e8 00 00 00 00       	call   935d0a <shrink_lruvec+0x218a>	935d06: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
218a   935d0a:	eb 73                	jmp    935d7f <shrink_lruvec+0x21ff>
218c   935d0c:	4c 01 fb             	add    %r15,%rbx
218f   935d0f:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
2193   935d13:	48 c1 e0 04          	shl    $0x4,%rax
2197   935d17:	48 03 44 24 18       	add    0x18(%rsp),%rax
219c   935d1c:	48 8b 8c 24 b8 00 00 00 	mov    0xb8(%rsp),%rcx
21a4   935d24:	48 8d 0c 49          	lea    (%rcx,%rcx,2),%rcx
21a8   935d28:	4c 8d 3c c8          	lea    (%rax,%rcx,8),%r15
21ac   935d2c:	49 81 c7 b0 03 00 00 	add    $0x3b0,%r15
21b3   935d33:	4c 89 f8             	mov    %r15,%rax
21b6   935d36:	48 c1 e8 03          	shr    $0x3,%rax
21ba   935d3a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
21bf   935d3f:	74 08                	je     935d49 <shrink_lruvec+0x21c9>
21c1   935d41:	4c 89 ff             	mov    %r15,%rdi
21c4   935d44:	e8 00 00 00 00       	call   935d49 <shrink_lruvec+0x21c9>	935d45: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
21c9   935d49:	49 03 1f             	add    (%r15),%rbx
21cc   935d4c:	4c 0f af 74 24 38    	imul   0x38(%rsp),%r14
21d2   935d52:	48 0f af 5c 24 30    	imul   0x30(%rsp),%rbx
21d8   935d58:	4c 89 f7             	mov    %r14,%rdi
21db   935d5b:	48 89 de             	mov    %rbx,%rsi
21de   935d5e:	e8 00 00 00 00       	call   935d63 <shrink_lruvec+0x21e3>	935d5f: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
21e3   935d63:	49 39 de             	cmp    %rbx,%r14
21e6   935d66:	76 12                	jbe    935d7a <shrink_lruvec+0x21fa>
21e8   935d68:	e8 00 00 00 00       	call   935d6d <shrink_lruvec+0x21ed>	935d69: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
21ed   935d6d:	c7 84 24 a0 00 00 00 02 00 00 00 	movl   $0x2,0xa0(%rsp)
21f8   935d78:	eb 10                	jmp    935d8a <shrink_lruvec+0x220a>
21fa   935d7a:	e8 00 00 00 00       	call   935d7f <shrink_lruvec+0x21ff>	935d7b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
21ff   935d7f:	c7 84 24 a0 00 00 00 03 00 00 00 	movl   $0x3,0xa0(%rsp)
220a   935d8a:	4c 8b b4 24 b8 00 00 00 	mov    0xb8(%rsp),%r14
2212   935d92:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
221a   935d9a:	42 8a 04 28          	mov    (%rax,%r13,1),%al
221e   935d9e:	84 c0                	test   %al,%al
2220   935da0:	0f 85 39 29 00 00    	jne    9386df <shrink_lruvec+0x4b5f>
2226   935da6:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 935dac <shrink_lruvec+0x222c>	935da8: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
222c   935dac:	bf 01 00 00 00       	mov    $0x1,%edi
2231   935db1:	89 de                	mov    %ebx,%esi
2233   935db3:	e8 00 00 00 00       	call   935db8 <shrink_lruvec+0x2238>	935db4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2238   935db8:	85 db                	test   %ebx,%ebx
223a   935dba:	7e 35                	jle    935df1 <shrink_lruvec+0x2271>
223c   935dbc:	e8 00 00 00 00       	call   935dc1 <shrink_lruvec+0x2241>	935dbd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2241   935dc1:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
2249   935dc9:	48 89 c8             	mov    %rcx,%rax
224c   935dcc:	48 c1 e8 03          	shr    $0x3,%rax
2250   935dd0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2255   935dd5:	74 15                	je     935dec <shrink_lruvec+0x226c>
2257   935dd7:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
225f   935ddf:	e8 00 00 00 00       	call   935de4 <shrink_lruvec+0x2264>	935de0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2264   935de4:	48 8b 8c 24 90 00 00 00 	mov    0x90(%rsp),%rcx
226c   935dec:	48 8b 01             	mov    (%rcx),%rax
226f   935def:	eb 07                	jmp    935df8 <shrink_lruvec+0x2278>
2271   935df1:	e8 00 00 00 00       	call   935df6 <shrink_lruvec+0x2276>	935df2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2276   935df6:	31 c0                	xor    %eax,%eax
2278   935df8:	48 89 84 24 a0 01 00 00 	mov    %rax,0x1a0(%rsp)
2280   935e00:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
2288   935e08:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
228d   935e0d:	74 0d                	je     935e1c <shrink_lruvec+0x229c>
228f   935e0f:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
2297   935e17:	e8 00 00 00 00       	call   935e1c <shrink_lruvec+0x229c>	935e18: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
229c   935e1c:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
22a1   935e21:	48 8b 98 c8 00 00 00 	mov    0xc8(%rax),%rbx
22a8   935e28:	4e 8d 34 f0          	lea    (%rax,%r14,8),%r14
22ac   935e2c:	49 81 c6 d0 00 00 00 	add    $0xd0,%r14
22b3   935e33:	4c 89 f0             	mov    %r14,%rax
22b6   935e36:	48 c1 e8 03          	shr    $0x3,%rax
22ba   935e3a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
22bf   935e3f:	74 08                	je     935e49 <shrink_lruvec+0x22c9>
22c1   935e41:	4c 89 f7             	mov    %r14,%rdi
22c4   935e44:	e8 00 00 00 00       	call   935e49 <shrink_lruvec+0x22c9>	935e45: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
22c9   935e49:	49 8b 0e             	mov    (%r14),%rcx
22cc   935e4c:	48 89 8c 24 70 01 00 00 	mov    %rcx,0x170(%rsp)
22d4   935e54:	29 cb                	sub    %ecx,%ebx
22d6   935e56:	bf 01 00 00 00       	mov    $0x1,%edi
22db   935e5b:	89 de                	mov    %ebx,%esi
22dd   935e5d:	e8 00 00 00 00       	call   935e62 <shrink_lruvec+0x22e2>	935e5e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
22e2   935e62:	83 fb 01             	cmp    $0x1,%ebx
22e5   935e65:	75 0a                	jne    935e71 <shrink_lruvec+0x22f1>
22e7   935e67:	e8 00 00 00 00       	call   935e6c <shrink_lruvec+0x22ec>	935e68: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
22ec   935e6c:	e9 2d 28 00 00       	jmp    93869e <shrink_lruvec+0x4b1e>
22f1   935e71:	48 8b 94 24 18 01 00 00 	mov    0x118(%rsp),%rdx
22f9   935e79:	48 89 d0             	mov    %rdx,%rax
22fc   935e7c:	48 c1 e8 03          	shr    $0x3,%rax
2300   935e80:	42 8a 04 28          	mov    (%rax,%r13,1),%al
2304   935e84:	84 c0                	test   %al,%al
2306   935e86:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
230b   935e8b:	0f 85 74 28 00 00    	jne    938705 <shrink_lruvec+0x4b85>
2311   935e91:	0f b6 1a             	movzbl (%rdx),%ebx
2314   935e94:	bf ff 00 00 00       	mov    $0xff,%edi
2319   935e99:	89 de                	mov    %ebx,%esi
231b   935e9b:	e8 00 00 00 00       	call   935ea0 <shrink_lruvec+0x2320>	935e9c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
2320   935ea0:	48 89 9c 24 f8 00 00 00 	mov    %rbx,0xf8(%rsp)
2328   935ea8:	84 db                	test   %bl,%bl
232a   935eaa:	0f 88 1e 27 00 00    	js     9385ce <shrink_lruvec+0x4a4e>
2330   935eb0:	48 8b 84 24 70 01 00 00 	mov    0x170(%rsp),%rax
2338   935eb8:	83 e0 03             	and    $0x3,%eax
233b   935ebb:	48 89 84 24 70 01 00 00 	mov    %rax,0x170(%rsp)
2343   935ec3:	c7 44 24 40 00 00 00 00 	movl   $0x0,0x40(%rsp)
234b   935ecb:	b8 00 10 00 00       	mov    $0x1000,%eax
2350   935ed0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
2355   935ed5:	c7 84 24 d0 00 00 00 00 00 00 00 	movl   $0x0,0xd0(%rsp)
2360   935ee0:	c7 44 24 78 00 00 00 00 	movl   $0x0,0x78(%rsp)
2368   935ee8:	48 8d bc 24 90 03 00 00 	lea    0x390(%rsp),%rdi
2370   935ef0:	48 89 f8             	mov    %rdi,%rax
2373   935ef3:	48 c1 e8 03          	shr    $0x3,%rax
2377   935ef7:	48 89 84 24 b0 01 00 00 	mov    %rax,0x1b0(%rsp)
237f   935eff:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2384   935f04:	74 0d                	je     935f13 <shrink_lruvec+0x2393>
2386   935f06:	e8 00 00 00 00       	call   935f0b <shrink_lruvec+0x238b>	935f07: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
238b   935f0b:	48 8d bc 24 90 03 00 00 	lea    0x390(%rsp),%rdi
2393   935f13:	48 89 bc 24 90 03 00 00 	mov    %rdi,0x390(%rsp)
239b   935f1b:	4c 89 f0             	mov    %r14,%rax
239e   935f1e:	48 c1 e8 03          	shr    $0x3,%rax
23a2   935f22:	48 89 84 24 48 01 00 00 	mov    %rax,0x148(%rsp)
23aa   935f2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
23af   935f2f:	74 10                	je     935f41 <shrink_lruvec+0x23c1>
23b1   935f31:	4c 89 f7             	mov    %r14,%rdi
23b4   935f34:	e8 00 00 00 00       	call   935f39 <shrink_lruvec+0x23b9>	935f35: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
23b9   935f39:	48 8d bc 24 90 03 00 00 	lea    0x390(%rsp),%rdi
23c1   935f41:	48 89 bc 24 98 03 00 00 	mov    %rdi,0x398(%rsp)
23c9   935f49:	bf 04 00 00 00       	mov    $0x4,%edi
23ce   935f4e:	48 8b 9c 24 f8 00 00 00 	mov    0xf8(%rsp),%rbx
23d6   935f56:	48 89 de             	mov    %rbx,%rsi
23d9   935f59:	e8 00 00 00 00       	call   935f5e <shrink_lruvec+0x23de>	935f5a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
23de   935f5e:	48 83 fb 03          	cmp    $0x3,%rbx
23e2   935f62:	0f 87 41 26 00 00    	ja     9385a9 <shrink_lruvec+0x4a29>
23e8   935f68:	e8 00 00 00 00       	call   935f6d <shrink_lruvec+0x23ed>	935f69: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23ed   935f6d:	48 8b 84 24 70 01 00 00 	mov    0x170(%rsp),%rax
23f5   935f75:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
23f9   935f79:	48 c1 e0 05          	shl    $0x5,%rax
23fd   935f7d:	48 03 44 24 18       	add    0x18(%rsp),%rax
2402   935f82:	48 8b 8c 24 b8 00 00 00 	mov    0xb8(%rsp),%rcx
240a   935f8a:	48 8d 0c 49          	lea    (%rcx,%rcx,2),%rcx
240e   935f8e:	48 c1 e1 04          	shl    $0x4,%rcx
2412   935f92:	48 01 c1             	add    %rax,%rcx
2415   935f95:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
241d   935f9d:	48 c1 e0 04          	shl    $0x4,%rax
2421   935fa1:	48 8d 1c 08          	lea    (%rax,%rcx,1),%rbx
2425   935fa5:	48 81 c3 e0 00 00 00 	add    $0xe0,%rbx
242c   935fac:	4c 8d 24 08          	lea    (%rax,%rcx,1),%r12
2430   935fb0:	49 81 c4 e8 00 00 00 	add    $0xe8,%r12
2437   935fb7:	c7 44 24 38 00 00 00 00 	movl   $0x0,0x38(%rsp)
243f   935fbf:	48 89 9c 24 80 00 00 00 	mov    %rbx,0x80(%rsp)
2447   935fc7:	4c 89 a4 24 10 01 00 00 	mov    %r12,0x110(%rsp)
244f   935fcf:	49 89 df             	mov    %rbx,%r15
2452   935fd2:	49 c1 ef 03          	shr    $0x3,%r15
2456   935fd6:	43 80 3c 2f 00       	cmpb   $0x0,(%r15,%r13,1)
245b   935fdb:	74 08                	je     935fe5 <shrink_lruvec+0x2465>
245d   935fdd:	48 89 df             	mov    %rbx,%rdi
2460   935fe0:	e8 00 00 00 00       	call   935fe5 <shrink_lruvec+0x2465>	935fe1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2465   935fe5:	48 8b 03             	mov    (%rbx),%rax
2468   935fe8:	48 39 d8             	cmp    %rbx,%rax
246b   935feb:	4c 89 bc 24 88 00 00 00 	mov    %r15,0x88(%rsp)
2473   935ff3:	0f 84 39 24 00 00    	je     938432 <shrink_lruvec+0x48b2>
2479   935ff9:	4c 89 e0             	mov    %r12,%rax
247c   935ffc:	48 c1 e8 03          	shr    $0x3,%rax
2480   936000:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2485   936005:	74 08                	je     93600f <shrink_lruvec+0x248f>
2487   936007:	4c 89 e7             	mov    %r12,%rdi
248a   93600a:	e8 00 00 00 00       	call   93600f <shrink_lruvec+0x248f>	93600b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
248f   93600f:	4d 8b 34 24          	mov    (%r12),%r14
2493   936013:	4d 8d 7e f8          	lea    -0x8(%r14),%r15
2497   936017:	4c 89 ff             	mov    %r15,%rdi
249a   93601a:	be 08 00 00 00       	mov    $0x8,%esi
249f   93601f:	e8 00 00 00 00       	call   936024 <shrink_lruvec+0x24a4>	936020: R_X86_64_PLT32	__kasan_check_read-0x4
24a4   936024:	4d 89 fc             	mov    %r15,%r12
24a7   936027:	49 c1 ec 03          	shr    $0x3,%r12
24ab   93602b:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
24b0   936030:	74 08                	je     93603a <shrink_lruvec+0x24ba>
24b2   936032:	4c 89 ff             	mov    %r15,%rdi
24b5   936035:	e8 00 00 00 00       	call   93603a <shrink_lruvec+0x24ba>	936036: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
24ba   93603a:	49 8b 1f             	mov    (%r15),%rbx
24bd   93603d:	be 00 00 01 00       	mov    $0x10000,%esi
24c2   936042:	48 21 de             	and    %rbx,%rsi
24c5   936045:	31 ff                	xor    %edi,%edi
24c7   936047:	e8 00 00 00 00       	call   93604c <shrink_lruvec+0x24cc>	936048: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
24cc   93604c:	b8 00 00 01 00       	mov    $0x10000,%eax
24d1   936051:	48 21 c3             	and    %rax,%rbx
24d4   936054:	0f 85 9e 00 00 00    	jne    9360f8 <shrink_lruvec+0x2578>
24da   93605a:	e8 00 00 00 00       	call   93605f <shrink_lruvec+0x24df>	93605b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
24df   93605f:	c7 44 24 28 01 00 00 00 	movl   $0x1,0x28(%rsp)
24e7   936067:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
24ec   93606c:	74 08                	je     936076 <shrink_lruvec+0x24f6>
24ee   93606e:	4c 89 ff             	mov    %r15,%rdi
24f1   936071:	e8 00 00 00 00       	call   936076 <shrink_lruvec+0x24f6>	936072: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
24f6   936076:	4d 8b 2f             	mov    (%r15),%r13
24f9   936079:	4c 89 ff             	mov    %r15,%rdi
24fc   93607c:	be 08 00 00 00       	mov    $0x8,%esi
2501   936081:	e8 00 00 00 00       	call   936086 <shrink_lruvec+0x2506>	936082: R_X86_64_PLT32	__kasan_check_read-0x4
2506   936086:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2510   936090:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
2515   936095:	74 08                	je     93609f <shrink_lruvec+0x251f>
2517   936097:	4c 89 ff             	mov    %r15,%rdi
251a   93609a:	e8 00 00 00 00       	call   93609f <shrink_lruvec+0x251f>	93609b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
251f   93609f:	49 8b 07             	mov    (%r15),%rax
2522   9360a2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
2527   9360a7:	4c 89 ff             	mov    %r15,%rdi
252a   9360aa:	be 08 00 00 00       	mov    $0x8,%esi
252f   9360af:	e8 00 00 00 00       	call   9360b4 <shrink_lruvec+0x2534>	9360b0: R_X86_64_PLT32	__kasan_check_read-0x4
2534   9360b4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
253e   9360be:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
2543   9360c3:	74 08                	je     9360cd <shrink_lruvec+0x254d>
2545   9360c5:	4c 89 ff             	mov    %r15,%rdi
2548   9360c8:	e8 00 00 00 00       	call   9360cd <shrink_lruvec+0x254d>	9360c9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
254d   9360cd:	49 8b 1f             	mov    (%r15),%rbx
2550   9360d0:	be 00 00 01 00       	mov    $0x10000,%esi
2555   9360d5:	48 21 de             	and    %rbx,%rsi
2558   9360d8:	31 ff                	xor    %edi,%edi
255a   9360da:	e8 00 00 00 00       	call   9360df <shrink_lruvec+0x255f>	9360db: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
255f   9360df:	b8 00 00 01 00       	mov    $0x10000,%eax
2564   9360e4:	48 21 c3             	and    %rax,%rbx
2567   9360e7:	75 6c                	jne    936155 <shrink_lruvec+0x25d5>
2569   9360e9:	e8 00 00 00 00       	call   9360ee <shrink_lruvec+0x256e>	9360ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
256e   9360ee:	b8 01 00 00 00       	mov    $0x1,%eax
2573   9360f3:	e9 b8 00 00 00       	jmp    9361b0 <shrink_lruvec+0x2630>
2578   9360f8:	48 8b 84 24 00 01 00 00 	mov    0x100(%rsp),%rax
2580   936100:	42 8a 04 28          	mov    (%rax,%r13,1),%al
2584   936104:	84 c0                	test   %al,%al
2586   936106:	0f 85 46 1f 00 00    	jne    938052 <shrink_lruvec+0x44d2>
258c   93610c:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 936112 <shrink_lruvec+0x2592>	93610e: R_X86_64_PC32	hugetlb_optimize_vmemmap_key-0x4
2592   936112:	31 ff                	xor    %edi,%edi
2594   936114:	89 de                	mov    %ebx,%esi
2596   936116:	e8 00 00 00 00       	call   93611b <shrink_lruvec+0x259b>	936117: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
259b   93611b:	85 db                	test   %ebx,%ebx
259d   93611d:	0f 8f 6e 1c 00 00    	jg     937d91 <shrink_lruvec+0x4211>
25a3   936123:	e8 00 00 00 00       	call   936128 <shrink_lruvec+0x25a8>	936124: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
25a8   936128:	49 8d 5e 54          	lea    0x54(%r14),%rbx
25ac   93612c:	48 89 d8             	mov    %rbx,%rax
25af   93612f:	48 c1 e8 03          	shr    $0x3,%rax
25b3   936133:	42 8a 04 28          	mov    (%rax,%r13,1),%al
25b7   936137:	84 c0                	test   %al,%al
25b9   936139:	0f 85 5f 1f 00 00    	jne    93809e <shrink_lruvec+0x451e>
25bf   93613f:	8b 03                	mov    (%rbx),%eax
25c1   936141:	89 44 24 28          	mov    %eax,0x28(%rsp)
25c5   936145:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
25ca   93614a:	0f 85 1e ff ff ff    	jne    93606e <shrink_lruvec+0x24ee>
25d0   936150:	e9 21 ff ff ff       	jmp    936076 <shrink_lruvec+0x24f6>
25d5   936155:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
25df   93615f:	48 8b 8c 24 00 01 00 00 	mov    0x100(%rsp),%rcx
25e7   936167:	8a 04 01             	mov    (%rcx,%rax,1),%al
25ea   93616a:	84 c0                	test   %al,%al
25ec   93616c:	0f 85 06 1f 00 00    	jne    938078 <shrink_lruvec+0x44f8>
25f2   936172:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 936178 <shrink_lruvec+0x25f8>	936174: R_X86_64_PC32	hugetlb_optimize_vmemmap_key-0x4
25f8   936178:	31 ff                	xor    %edi,%edi
25fa   93617a:	89 de                	mov    %ebx,%esi
25fc   93617c:	e8 00 00 00 00       	call   936181 <shrink_lruvec+0x2601>	93617d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2601   936181:	85 db                	test   %ebx,%ebx
2603   936183:	0f 8f 2e 1c 00 00    	jg     937db7 <shrink_lruvec+0x4237>
2609   936189:	e8 00 00 00 00       	call   93618e <shrink_lruvec+0x260e>	93618a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
260e   93618e:	49 8d 5e 54          	lea    0x54(%r14),%rbx
2612   936192:	48 89 d8             	mov    %rbx,%rax
2615   936195:	48 c1 e8 03          	shr    $0x3,%rax
2619   936199:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2623   9361a3:	8a 04 08             	mov    (%rax,%rcx,1),%al
2626   9361a6:	84 c0                	test   %al,%al
2628   9361a8:	0f 85 0d 1f 00 00    	jne    9380bb <shrink_lruvec+0x453b>
262e   9361ae:	8b 03                	mov    (%rbx),%eax
2630   9361b0:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
2638   9361b8:	4c 89 74 24 10       	mov    %r14,0x10(%rsp)
263d   9361bd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2647   9361c7:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
264c   9361cc:	74 08                	je     9361d6 <shrink_lruvec+0x2656>
264e   9361ce:	4c 89 ff             	mov    %r15,%rdi
2651   9361d1:	e8 00 00 00 00       	call   9361d6 <shrink_lruvec+0x2656>	9361d2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2656   9361d6:	49 8b 1f             	mov    (%r15),%rbx
2659   9361d9:	49 89 de             	mov    %rbx,%r14
265c   9361dc:	49 c1 ee 25          	shr    $0x25,%r14
2660   9361e0:	41 83 e6 03          	and    $0x3,%r14d
2664   9361e4:	c1 eb 06             	shr    $0x6,%ebx
2667   9361e7:	83 e3 01             	and    $0x1,%ebx
266a   9361ea:	49 8d 34 1e          	lea    (%r14,%rbx,1),%rsi
266e   9361ee:	31 ff                	xor    %edi,%edi
2670   9361f0:	e8 00 00 00 00       	call   9361f5 <shrink_lruvec+0x2675>	9361f1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2675   9361f5:	49 01 de             	add    %rbx,%r14
2678   9361f8:	74 22                	je     93621c <shrink_lruvec+0x269c>
267a   9361fa:	e8 00 00 00 00       	call   9361ff <shrink_lruvec+0x267f>	9361fb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
267f   9361ff:	4c 89 b4 24 98 02 00 00 	mov    %r14,0x298(%rsp)
2687   936207:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
268d   93620d:	4c 0f bd b4 24 98 02 00 00 	bsr    0x298(%rsp),%r14
2696   936216:	41 83 c6 01          	add    $0x1,%r14d
269a   93621a:	eb 08                	jmp    936224 <shrink_lruvec+0x26a4>
269c   93621c:	e8 00 00 00 00       	call   936221 <shrink_lruvec+0x26a1>	93621d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
26a1   936221:	45 31 f6             	xor    %r14d,%r14d
26a4   936224:	4c 89 ff             	mov    %r15,%rdi
26a7   936227:	e8 d4 b8 00 00       	call   941b00 <folio_evictable>
26ac   93622c:	84 c0                	test   %al,%al
26ae   93622e:	74 70                	je     9362a0 <shrink_lruvec+0x2720>
26b0   936230:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
26b5   936235:	89 c3                	mov    %eax,%ebx
26b7   936237:	c1 eb 13             	shr    $0x13,%ebx
26ba   93623a:	83 e3 01             	and    $0x1,%ebx
26bd   93623d:	31 ff                	xor    %edi,%edi
26bf   93623f:	89 de                	mov    %ebx,%esi
26c1   936241:	e8 00 00 00 00       	call   936246 <shrink_lruvec+0x26c6>	936242: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
26c6   936246:	85 db                	test   %ebx,%ebx
26c8   936248:	89 5c 24 70          	mov    %ebx,0x70(%rsp)
26cc   93624c:	0f 85 9c 01 00 00    	jne    9363ee <shrink_lruvec+0x286e>
26d2   936252:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
26d7   936257:	48 8d 58 10          	lea    0x10(%rax),%rbx
26db   93625b:	48 89 d8             	mov    %rbx,%rax
26de   93625e:	48 c1 e8 03          	shr    $0x3,%rax
26e2   936262:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
26ec   93626c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
26f0   936270:	74 08                	je     93627a <shrink_lruvec+0x26fa>
26f2   936272:	48 89 df             	mov    %rbx,%rdi
26f5   936275:	e8 00 00 00 00       	call   93627a <shrink_lruvec+0x26fa>	936276: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
26fa   93627a:	48 8b 1b             	mov    (%rbx),%rbx
26fd   93627d:	89 de                	mov    %ebx,%esi
26ff   93627f:	83 e6 01             	and    $0x1,%esi
2702   936282:	31 ff                	xor    %edi,%edi
2704   936284:	e8 00 00 00 00       	call   936289 <shrink_lruvec+0x2709>	936285: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2709   936289:	f6 c3 01             	test   $0x1,%bl
270c   93628c:	0f 85 b5 05 00 00    	jne    936847 <shrink_lruvec+0x2cc7>
2712   936292:	e8 00 00 00 00       	call   936297 <shrink_lruvec+0x2717>	936293: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2717   936297:	8b 5c 24 70          	mov    0x70(%rsp),%ebx
271b   93629b:	e9 53 01 00 00       	jmp    9363f3 <shrink_lruvec+0x2873>
2720   9362a0:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
272a   9362aa:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
272f   9362af:	74 08                	je     9362b9 <shrink_lruvec+0x2739>
2731   9362b1:	4c 89 ff             	mov    %r15,%rdi
2734   9362b4:	e8 00 00 00 00       	call   9362b9 <shrink_lruvec+0x2739>	9362b5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2739   9362b9:	49 8b 1f             	mov    (%r15),%rbx
273c   9362bc:	49 be 00 00 00 00 80 03 00 00 	movabs $0x38000000000,%r14
2746   9362c6:	4c 89 f6             	mov    %r14,%rsi
2749   9362c9:	48 21 de             	and    %rbx,%rsi
274c   9362cc:	31 ff                	xor    %edi,%edi
274e   9362ce:	e8 00 00 00 00       	call   9362d3 <shrink_lruvec+0x2753>	9362cf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2753   9362d3:	4c 21 f3             	and    %r14,%rbx
2756   9362d6:	0f 84 c6 03 00 00    	je     9366a2 <shrink_lruvec+0x2b22>
275c   9362dc:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2761   9362e1:	74 08                	je     9362eb <shrink_lruvec+0x276b>
2763   9362e3:	4c 89 ff             	mov    %r15,%rdi
2766   9362e6:	e8 00 00 00 00       	call   9362eb <shrink_lruvec+0x276b>	9362e7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
276b   9362eb:	49 8b 1f             	mov    (%r15),%rbx
276e   9362ee:	49 89 de             	mov    %rbx,%r14
2771   9362f1:	48 b8 ff ff ff ff 7f fc ff ff 	movabs $0xfffffc7fffffffff,%rax
277b   9362fb:	49 21 c6             	and    %rax,%r14
277e   9362fe:	4c 89 ff             	mov    %r15,%rdi
2781   936301:	be 08 00 00 00       	mov    $0x8,%esi
2786   936306:	e8 00 00 00 00       	call   93630b <shrink_lruvec+0x278b>	936307: R_X86_64_PLT32	__kasan_check_write-0x4
278b   93630b:	48 89 d8             	mov    %rbx,%rax
278e   93630e:	f0 4d 0f b1 37       	lock cmpxchg %r14,(%r15)
2793   936313:	48 39 d8             	cmp    %rbx,%rax
2796   936316:	74 0e                	je     936326 <shrink_lruvec+0x27a6>
2798   936318:	e8 00 00 00 00       	call   93631d <shrink_lruvec+0x279d>	936319: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
279d   93631d:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
27a2   936322:	75 bf                	jne    9362e3 <shrink_lruvec+0x2763>
27a4   936324:	eb c5                	jmp    9362eb <shrink_lruvec+0x276b>
27a6   936326:	48 c1 eb 27          	shr    $0x27,%rbx
27aa   93632a:	83 e3 07             	and    $0x7,%ebx
27ad   93632d:	83 c3 ff             	add    $0xffffffff,%ebx
27b0   936330:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
27b5   936335:	4c 89 fe             	mov    %r15,%rsi
27b8   936338:	89 da                	mov    %ebx,%edx
27ba   93633a:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
27bf   93633f:	e8 7c 90 ff ff       	call   92f3c0 <lru_gen_update_size>
27c4   936344:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
27c9   936349:	48 89 df             	mov    %rbx,%rdi
27cc   93634c:	e8 00 00 00 00       	call   936351 <shrink_lruvec+0x27d1>	93634d: R_X86_64_PLT32	__list_del_entry_valid-0x4
27d1   936351:	84 c0                	test   %al,%al
27d3   936353:	0f 84 55 03 00 00    	je     9366ae <shrink_lruvec+0x2b2e>
27d9   936359:	e8 00 00 00 00       	call   93635e <shrink_lruvec+0x27de>	93635a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
27de   93635e:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
27e2   936362:	48 89 f8             	mov    %rdi,%rax
27e5   936365:	48 c1 e8 03          	shr    $0x3,%rax
27e9   936369:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
27ee   93636e:	74 05                	je     936375 <shrink_lruvec+0x27f5>
27f0   936370:	e8 00 00 00 00       	call   936375 <shrink_lruvec+0x27f5>	936371: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
27f5   936375:	4c 8b 73 08          	mov    0x8(%rbx),%r14
27f9   936379:	48 89 d8             	mov    %rbx,%rax
27fc   93637c:	48 c1 e8 03          	shr    $0x3,%rax
2800   936380:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2805   936385:	74 08                	je     93638f <shrink_lruvec+0x280f>
2807   936387:	48 89 df             	mov    %rbx,%rdi
280a   93638a:	e8 00 00 00 00       	call   93638f <shrink_lruvec+0x280f>	93638b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
280f   93638f:	4c 8b 2b             	mov    (%rbx),%r13
2812   936392:	49 8d 5d 08          	lea    0x8(%r13),%rbx
2816   936396:	48 89 d8             	mov    %rbx,%rax
2819   936399:	48 c1 e8 03          	shr    $0x3,%rax
281d   93639d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2827   9363a7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
282b   9363ab:	74 08                	je     9363b5 <shrink_lruvec+0x2835>
282d   9363ad:	48 89 df             	mov    %rbx,%rdi
2830   9363b0:	e8 00 00 00 00       	call   9363b5 <shrink_lruvec+0x2835>	9363b1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2835   9363b5:	4c 89 33             	mov    %r14,(%rbx)
2838   9363b8:	4c 89 f0             	mov    %r14,%rax
283b   9363bb:	48 c1 e8 03          	shr    $0x3,%rax
283f   9363bf:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2849   9363c9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
284d   9363cd:	74 08                	je     9363d7 <shrink_lruvec+0x2857>
284f   9363cf:	4c 89 f7             	mov    %r14,%rdi
2852   9363d2:	e8 00 00 00 00       	call   9363d7 <shrink_lruvec+0x2857>	9363d3: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2857   9363d7:	4d 89 2e             	mov    %r13,(%r14)
285a   9363da:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
2864   9363e4:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
2869   9363e9:	e9 c5 02 00 00       	jmp    9366b3 <shrink_lruvec+0x2b33>
286e   9363ee:	e8 00 00 00 00       	call   9363f3 <shrink_lruvec+0x2873>	9363ef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2873   9363f3:	49 c1 ed 27          	shr    $0x27,%r13
2877   9363f7:	41 83 e5 07          	and    $0x7,%r13d
287b   9363fb:	48 c1 6c 24 20 38    	shrq   $0x38,0x20(%rsp)
2881   936401:	41 83 c5 ff          	add    $0xffffffff,%r13d
2885   936405:	83 f3 01             	xor    $0x1,%ebx
2888   936408:	89 d9                	mov    %ebx,%ecx
288a   93640a:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
288f   93640f:	48 89 8c 24 c0 00 00 00 	mov    %rcx,0xc0(%rsp)
2897   936417:	48 8d 1c c8          	lea    (%rax,%rcx,8),%rbx
289b   93641b:	48 81 c3 d0 00 00 00 	add    $0xd0,%rbx
28a2   936422:	48 89 d8             	mov    %rbx,%rax
28a5   936425:	48 c1 e8 03          	shr    $0x3,%rax
28a9   936429:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
28b3   936433:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
28b7   936437:	74 08                	je     936441 <shrink_lruvec+0x28c1>
28b9   936439:	48 89 df             	mov    %rbx,%rdi
28bc   93643c:	e8 00 00 00 00       	call   936441 <shrink_lruvec+0x28c1>	93643d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
28c1   936441:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
28c6   936446:	83 e0 03             	and    $0x3,%eax
28c9   936449:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
28ce   93644e:	8b 1b                	mov    (%rbx),%ebx
28d0   936450:	83 e3 03             	and    $0x3,%ebx
28d3   936453:	44 89 ef             	mov    %r13d,%edi
28d6   936456:	89 de                	mov    %ebx,%esi
28d8   936458:	e8 00 00 00 00       	call   93645d <shrink_lruvec+0x28dd>	936459: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
28dd   93645d:	41 39 dd             	cmp    %ebx,%r13d
28e0   936460:	0f 85 42 01 00 00    	jne    9365a8 <shrink_lruvec+0x2a28>
28e6   936466:	44 89 f7             	mov    %r14d,%edi
28e9   936469:	8b 9c 24 a0 00 00 00 	mov    0xa0(%rsp),%ebx
28f0   936470:	89 de                	mov    %ebx,%esi
28f2   936472:	e8 00 00 00 00       	call   936477 <shrink_lruvec+0x28f7>	936473: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
28f7   936477:	41 39 de             	cmp    %ebx,%r14d
28fa   93647a:	0f 8e ec 04 00 00    	jle    93696c <shrink_lruvec+0x2dec>
2900   936480:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2905   936485:	4c 89 fe             	mov    %r15,%rsi
2908   936488:	31 d2                	xor    %edx,%edx
290a   93648a:	e8 31 ce 01 00       	call   9532c0 <folio_inc_gen>
290f   93648f:	89 c3                	mov    %eax,%ebx
2911   936491:	bf 04 00 00 00       	mov    $0x4,%edi
2916   936496:	89 c6                	mov    %eax,%esi
2918   936498:	e8 00 00 00 00       	call   93649d <shrink_lruvec+0x291d>	936499: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
291d   93649d:	83 fb 03             	cmp    $0x3,%ebx
2920   9364a0:	0f 87 21 1e 00 00    	ja     9382c7 <shrink_lruvec+0x4747>
2926   9364a6:	e8 00 00 00 00       	call   9364ab <shrink_lruvec+0x292b>	9364a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
292b   9364ab:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
2933   9364b3:	48 63 c3             	movslq %ebx,%rax
2936   9364b6:	8b 54 24 20          	mov    0x20(%rsp),%edx
293a   9364ba:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
293e   9364be:	48 c1 e0 05          	shl    $0x5,%rax
2942   9364c2:	48 03 44 24 18       	add    0x18(%rsp),%rax
2947   9364c7:	48 8d 1c 49          	lea    (%rcx,%rcx,2),%rbx
294b   9364cb:	49 89 dc             	mov    %rbx,%r12
294e   9364ce:	49 c1 e4 04          	shl    $0x4,%r12
2952   9364d2:	49 01 c4             	add    %rax,%r12
2955   9364d5:	48 c1 e2 04          	shl    $0x4,%rdx
2959   9364d9:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
295e   9364de:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
2963   9364e3:	4c 89 ff             	mov    %r15,%rdi
2966   9364e6:	e8 00 00 00 00       	call   9364eb <shrink_lruvec+0x296b>	9364e7: R_X86_64_PLT32	__list_del_entry_valid-0x4
296b   9364eb:	84 c0                	test   %al,%al
296d   9364ed:	48 89 9c 24 c0 00 00 00 	mov    %rbx,0xc0(%rsp)
2975   9364f5:	0f 84 34 08 00 00    	je     936d2f <shrink_lruvec+0x31af>
297b   9364fb:	e8 00 00 00 00       	call   936500 <shrink_lruvec+0x2980>	9364fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2980   936500:	49 8d 7f 08          	lea    0x8(%r15),%rdi
2984   936504:	48 89 f8             	mov    %rdi,%rax
2987   936507:	48 c1 e8 03          	shr    $0x3,%rax
298b   93650b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2995   936515:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2999   936519:	74 05                	je     936520 <shrink_lruvec+0x29a0>
299b   93651b:	e8 00 00 00 00       	call   936520 <shrink_lruvec+0x29a0>	93651c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
29a0   936520:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
29a5   936525:	4c 8b 7b 08          	mov    0x8(%rbx),%r15
29a9   936529:	48 89 d8             	mov    %rbx,%rax
29ac   93652c:	48 c1 e8 03          	shr    $0x3,%rax
29b0   936530:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
29ba   93653a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
29be   93653e:	74 08                	je     936548 <shrink_lruvec+0x29c8>
29c0   936540:	48 89 df             	mov    %rbx,%rdi
29c3   936543:	e8 00 00 00 00       	call   936548 <shrink_lruvec+0x29c8>	936544: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
29c8   936548:	48 8b 03             	mov    (%rbx),%rax
29cb   93654b:	48 89 84 24 c8 00 00 00 	mov    %rax,0xc8(%rsp)
29d3   936553:	48 8d 58 08          	lea    0x8(%rax),%rbx
29d7   936557:	48 89 d8             	mov    %rbx,%rax
29da   93655a:	48 c1 e8 03          	shr    $0x3,%rax
29de   93655e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
29e8   936568:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
29ec   93656c:	74 08                	je     936576 <shrink_lruvec+0x29f6>
29ee   93656e:	48 89 df             	mov    %rbx,%rdi
29f1   936571:	e8 00 00 00 00       	call   936576 <shrink_lruvec+0x29f6>	936572: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
29f6   936576:	4c 89 3b             	mov    %r15,(%rbx)
29f9   936579:	4c 89 f8             	mov    %r15,%rax
29fc   93657c:	48 c1 e8 03          	shr    $0x3,%rax
2a00   936580:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2a0a   93658a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2a0e   93658e:	74 08                	je     936598 <shrink_lruvec+0x2a18>
2a10   936590:	4c 89 ff             	mov    %r15,%rdi
2a13   936593:	e8 00 00 00 00       	call   936598 <shrink_lruvec+0x2a18>	936594: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2a18   936598:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
2a20   9365a0:	49 89 07             	mov    %rax,(%r15)
2a23   9365a3:	e9 8c 07 00 00       	jmp    936d34 <shrink_lruvec+0x31b4>
2a28   9365a8:	bf 04 00 00 00       	mov    $0x4,%edi
2a2d   9365ad:	44 89 ee             	mov    %r13d,%esi
2a30   9365b0:	e8 00 00 00 00       	call   9365b5 <shrink_lruvec+0x2a35>	9365b1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2a35   9365b5:	41 83 fd 03          	cmp    $0x3,%r13d
2a39   9365b9:	0f 87 58 1c 00 00    	ja     938217 <shrink_lruvec+0x4697>
2a3f   9365bf:	e8 00 00 00 00       	call   9365c4 <shrink_lruvec+0x2a44>	9365c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a44   9365c4:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2a49   9365c9:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
2a51   9365d1:	49 63 c5             	movslq %r13d,%rax
2a54   9365d4:	8b 5c 24 20          	mov    0x20(%rsp),%ebx
2a58   9365d8:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
2a5c   9365dc:	48 c1 e0 05          	shl    $0x5,%rax
2a60   9365e0:	48 03 44 24 18       	add    0x18(%rsp),%rax
2a65   9365e5:	4c 8d 3c 49          	lea    (%rcx,%rcx,2),%r15
2a69   9365e9:	49 c1 e7 04          	shl    $0x4,%r15
2a6d   9365ed:	49 01 c7             	add    %rax,%r15
2a70   9365f0:	48 c1 e3 04          	shl    $0x4,%rbx
2a74   9365f4:	4c 89 f7             	mov    %r14,%rdi
2a77   9365f7:	e8 00 00 00 00       	call   9365fc <shrink_lruvec+0x2a7c>	9365f8: R_X86_64_PLT32	__list_del_entry_valid-0x4
2a7c   9365fc:	84 c0                	test   %al,%al
2a7e   9365fe:	0f 84 36 04 00 00    	je     936a3a <shrink_lruvec+0x2eba>
2a84   936604:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
2a89   936609:	e8 00 00 00 00       	call   93660e <shrink_lruvec+0x2a8e>	93660a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2a8e   93660e:	49 8d 7e 08          	lea    0x8(%r14),%rdi
2a92   936612:	48 89 f8             	mov    %rdi,%rax
2a95   936615:	48 c1 e8 03          	shr    $0x3,%rax
2a99   936619:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
2aa3   936623:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
2aa8   936628:	74 05                	je     93662f <shrink_lruvec+0x2aaf>
2aaa   93662a:	e8 00 00 00 00       	call   93662f <shrink_lruvec+0x2aaf>	93662b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2aaf   93662f:	4c 89 f3             	mov    %r14,%rbx
2ab2   936632:	4d 8b 76 08          	mov    0x8(%r14),%r14
2ab6   936636:	48 89 d8             	mov    %rbx,%rax
2ab9   936639:	48 c1 e8 03          	shr    $0x3,%rax
2abd   93663d:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
2ac2   936642:	74 08                	je     93664c <shrink_lruvec+0x2acc>
2ac4   936644:	48 89 df             	mov    %rbx,%rdi
2ac7   936647:	e8 00 00 00 00       	call   93664c <shrink_lruvec+0x2acc>	936648: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2acc   93664c:	4c 8b 2b             	mov    (%rbx),%r13
2acf   93664f:	4d 8d 65 08          	lea    0x8(%r13),%r12
2ad3   936653:	4c 89 e0             	mov    %r12,%rax
2ad6   936656:	48 c1 e8 03          	shr    $0x3,%rax
2ada   93665a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2ae4   936664:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2ae8   936668:	74 08                	je     936672 <shrink_lruvec+0x2af2>
2aea   93666a:	4c 89 e7             	mov    %r12,%rdi
2aed   93666d:	e8 00 00 00 00       	call   936672 <shrink_lruvec+0x2af2>	93666e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2af2   936672:	4d 89 34 24          	mov    %r14,(%r12)
2af6   936676:	4c 89 f0             	mov    %r14,%rax
2af9   936679:	48 c1 e8 03          	shr    $0x3,%rax
2afd   93667d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2b07   936687:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2b0b   93668b:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
2b10   936690:	74 08                	je     93669a <shrink_lruvec+0x2b1a>
2b12   936692:	4c 89 f7             	mov    %r14,%rdi
2b15   936695:	e8 00 00 00 00       	call   93669a <shrink_lruvec+0x2b1a>	936696: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2b1a   93669a:	4d 89 2e             	mov    %r13,(%r14)
2b1d   93669d:	e9 9d 03 00 00       	jmp    936a3f <shrink_lruvec+0x2ebf>
2b22   9366a2:	e8 00 00 00 00       	call   9366a7 <shrink_lruvec+0x2b27>	9366a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b27   9366a7:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
2b2c   9366ac:	eb 53                	jmp    936701 <shrink_lruvec+0x2b81>
2b2e   9366ae:	e8 00 00 00 00       	call   9366b3 <shrink_lruvec+0x2b33>	9366af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2b33   9366b3:	48 89 d8             	mov    %rbx,%rax
2b36   9366b6:	48 c1 e8 03          	shr    $0x3,%rax
2b3a   9366ba:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2b3f   9366bf:	74 08                	je     9366c9 <shrink_lruvec+0x2b49>
2b41   9366c1:	48 89 df             	mov    %rbx,%rdi
2b44   9366c4:	e8 00 00 00 00       	call   9366c9 <shrink_lruvec+0x2b49>	9366c5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2b49   9366c9:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
2b53   9366d3:	48 89 03             	mov    %rax,(%rbx)
2b56   9366d6:	4c 8d 73 08          	lea    0x8(%rbx),%r14
2b5a   9366da:	4c 89 f0             	mov    %r14,%rax
2b5d   9366dd:	48 c1 e8 03          	shr    $0x3,%rax
2b61   9366e1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2b66   9366e6:	74 08                	je     9366f0 <shrink_lruvec+0x2b70>
2b68   9366e8:	4c 89 f7             	mov    %r14,%rdi
2b6b   9366eb:	e8 00 00 00 00       	call   9366f0 <shrink_lruvec+0x2b70>	9366ec: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2b70   9366f0:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
2b7a   9366fa:	48 83 c0 22          	add    $0x22,%rax
2b7e   9366fe:	49 89 06             	mov    %rax,(%r14)
2b81   936701:	4c 89 ff             	mov    %r15,%rdi
2b84   936704:	be 08 00 00 00       	mov    $0x8,%esi
2b89   936709:	e8 00 00 00 00       	call   93670e <shrink_lruvec+0x2b8e>	93670a: R_X86_64_PLT32	__kasan_check_write-0x4
2b8e   93670e:	f0 80 4b fa 10       	lock orb $0x10,-0x6(%rbx)
2b93   936713:	4c 89 ff             	mov    %r15,%rdi
2b96   936716:	be 08 00 00 00       	mov    $0x8,%esi
2b9b   93671b:	e8 00 00 00 00       	call   936720 <shrink_lruvec+0x2ba0>	93671c: R_X86_64_PLT32	__kasan_check_read-0x4
2ba0   936720:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2ba5   936725:	74 08                	je     93672f <shrink_lruvec+0x2baf>
2ba7   936727:	4c 89 ff             	mov    %r15,%rdi
2baa   93672a:	e8 00 00 00 00       	call   93672f <shrink_lruvec+0x2baf>	93672b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2baf   93672f:	49 8b 1f             	mov    (%r15),%rbx
2bb2   936732:	be 00 00 10 00       	mov    $0x100000,%esi
2bb7   936737:	48 21 de             	and    %rbx,%rsi
2bba   93673a:	31 ff                	xor    %edi,%edi
2bbc   93673c:	e8 00 00 00 00       	call   936741 <shrink_lruvec+0x2bc1>	93673d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2bc1   936741:	b8 00 00 10 00       	mov    $0x100000,%eax
2bc6   936746:	48 21 c3             	and    %rax,%rbx
2bc9   936749:	75 5a                	jne    9367a5 <shrink_lruvec+0x2c25>
2bcb   93674b:	e8 00 00 00 00       	call   936750 <shrink_lruvec+0x2bd0>	93674c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2bd0   936750:	4c 89 ff             	mov    %r15,%rdi
2bd3   936753:	be 08 00 00 00       	mov    $0x8,%esi
2bd8   936758:	e8 00 00 00 00       	call   93675d <shrink_lruvec+0x2bdd>	936759: R_X86_64_PLT32	__kasan_check_read-0x4
2bdd   93675d:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2be2   936762:	74 08                	je     93676c <shrink_lruvec+0x2bec>
2be4   936764:	4c 89 ff             	mov    %r15,%rdi
2be7   936767:	e8 00 00 00 00       	call   93676c <shrink_lruvec+0x2bec>	936768: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2bec   93676c:	49 8b 1f             	mov    (%r15),%rbx
2bef   93676f:	c1 eb 12             	shr    $0x12,%ebx
2bf2   936772:	83 e3 02             	and    $0x2,%ebx
2bf5   936775:	4c 89 ff             	mov    %r15,%rdi
2bf8   936778:	be 08 00 00 00       	mov    $0x8,%esi
2bfd   93677d:	e8 00 00 00 00       	call   936782 <shrink_lruvec+0x2c02>	93677e: R_X86_64_PLT32	__kasan_check_read-0x4
2c02   936782:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2c07   936787:	74 08                	je     936791 <shrink_lruvec+0x2c11>
2c09   936789:	4c 89 ff             	mov    %r15,%rdi
2c0c   93678c:	e8 00 00 00 00       	call   936791 <shrink_lruvec+0x2c11>	93678d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2c11   936791:	4d 8b 37             	mov    (%r15),%r14
2c14   936794:	41 c1 ee 05          	shr    $0x5,%r14d
2c18   936798:	41 83 e6 01          	and    $0x1,%r14d
2c1c   93679c:	41 09 de             	or     %ebx,%r14d
2c1f   93679f:	41 83 f6 02          	xor    $0x2,%r14d
2c23   9367a3:	eb 0b                	jmp    9367b0 <shrink_lruvec+0x2c30>
2c25   9367a5:	e8 00 00 00 00       	call   9367aa <shrink_lruvec+0x2c2a>	9367a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c2a   9367aa:	41 be 04 00 00 00    	mov    $0x4,%r14d
2c30   9367b0:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
2c35   9367b5:	4c 89 fe             	mov    %r15,%rsi
2c38   9367b8:	31 d2                	xor    %edx,%edx
2c3a   9367ba:	e8 01 07 01 00       	call   946ec0 <lru_gen_add_folio>
2c3f   9367bf:	84 c0                	test   %al,%al
2c41   9367c1:	74 17                	je     9367da <shrink_lruvec+0x2c5a>
2c43   9367c3:	e8 00 00 00 00       	call   9367c8 <shrink_lruvec+0x2c48>	9367c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2c48   9367c8:	8b 44 24 28          	mov    0x28(%rsp),%eax
2c4c   9367cc:	01 44 24 78          	add    %eax,0x78(%rsp)
2c50   9367d0:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
2c55   9367d5:	e9 ec 09 00 00       	jmp    9371c6 <shrink_lruvec+0x3646>
2c5a   9367da:	4c 89 e8             	mov    %r13,%rax
2c5d   9367dd:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2c62   9367e2:	74 08                	je     9367ec <shrink_lruvec+0x2c6c>
2c64   9367e4:	4c 89 ff             	mov    %r15,%rdi
2c67   9367e7:	e8 00 00 00 00       	call   9367ec <shrink_lruvec+0x2c6c>	9367e8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2c6c   9367ec:	41 0f b6 47 07       	movzbl 0x7(%r15),%eax
2c71   9367f1:	89 44 24 20          	mov    %eax,0x20(%rsp)
2c75   9367f5:	4c 89 ff             	mov    %r15,%rdi
2c78   9367f8:	be 08 00 00 00       	mov    $0x8,%esi
2c7d   9367fd:	e8 00 00 00 00       	call   936802 <shrink_lruvec+0x2c82>	9367fe: R_X86_64_PLT32	__kasan_check_read-0x4
2c82   936802:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2c87   936807:	74 08                	je     936811 <shrink_lruvec+0x2c91>
2c89   936809:	4c 89 ff             	mov    %r15,%rdi
2c8c   93680c:	e8 00 00 00 00       	call   936811 <shrink_lruvec+0x2c91>	93680d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2c91   936811:	49 8b 1f             	mov    (%r15),%rbx
2c94   936814:	be 00 00 01 00       	mov    $0x10000,%esi
2c99   936819:	48 21 de             	and    %rbx,%rsi
2c9c   93681c:	31 ff                	xor    %edi,%edi
2c9e   93681e:	e8 00 00 00 00       	call   936823 <shrink_lruvec+0x2ca3>	93681f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2ca3   936823:	b8 00 00 01 00       	mov    $0x10000,%eax
2ca8   936828:	48 21 c3             	and    %rax,%rbx
2cab   93682b:	75 69                	jne    936896 <shrink_lruvec+0x2d16>
2cad   93682d:	e8 00 00 00 00       	call   936832 <shrink_lruvec+0x2cb2>	93682e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2cb2   936832:	41 bf 01 00 00 00    	mov    $0x1,%r15d
2cb8   936838:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
2cbd   93683d:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
2cc2   936842:	e9 a8 00 00 00       	jmp    9368ef <shrink_lruvec+0x2d6f>
2cc7   936847:	4c 89 ff             	mov    %r15,%rdi
2cca   93684a:	be 08 00 00 00       	mov    $0x8,%esi
2ccf   93684f:	e8 00 00 00 00       	call   936854 <shrink_lruvec+0x2cd4>	936850: R_X86_64_PLT32	__kasan_check_read-0x4
2cd4   936854:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2cde   93685e:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
2ce3   936863:	74 08                	je     93686d <shrink_lruvec+0x2ced>
2ce5   936865:	4c 89 ff             	mov    %r15,%rdi
2ce8   936868:	e8 00 00 00 00       	call   93686d <shrink_lruvec+0x2ced>	936869: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2ced   93686d:	49 8b 1f             	mov    (%r15),%rbx
2cf0   936870:	48 89 de             	mov    %rbx,%rsi
2cf3   936873:	48 83 e6 08          	and    $0x8,%rsi
2cf7   936877:	31 ff                	xor    %edi,%edi
2cf9   936879:	e8 00 00 00 00       	call   93687e <shrink_lruvec+0x2cfe>	93687a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2cfe   93687e:	48 83 e3 08          	and    $0x8,%rbx
2d02   936882:	0f 85 13 04 00 00    	jne    936c9b <shrink_lruvec+0x311b>
2d08   936888:	e8 00 00 00 00       	call   93688d <shrink_lruvec+0x2d0d>	936889: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d0d   93688d:	8b 5c 24 70          	mov    0x70(%rsp),%ebx
2d11   936891:	e9 5d fb ff ff       	jmp    9363f3 <shrink_lruvec+0x2873>
2d16   936896:	48 8b 84 24 00 01 00 00 	mov    0x100(%rsp),%rax
2d1e   93689e:	42 8a 04 28          	mov    (%rax,%r13,1),%al
2d22   9368a2:	84 c0                	test   %al,%al
2d24   9368a4:	0f 85 fa 18 00 00    	jne    9381a4 <shrink_lruvec+0x4624>
2d2a   9368aa:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 9368b0 <shrink_lruvec+0x2d30>	9368ac: R_X86_64_PC32	hugetlb_optimize_vmemmap_key-0x4
2d30   9368b0:	31 ff                	xor    %edi,%edi
2d32   9368b2:	89 de                	mov    %ebx,%esi
2d34   9368b4:	e8 00 00 00 00       	call   9368b9 <shrink_lruvec+0x2d39>	9368b5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2d39   9368b9:	85 db                	test   %ebx,%ebx
2d3b   9368bb:	0f 8f ce 15 00 00    	jg     937e8f <shrink_lruvec+0x430f>
2d41   9368c1:	e8 00 00 00 00       	call   9368c6 <shrink_lruvec+0x2d46>	9368c2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2d46   9368c6:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
2d4b   9368cb:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
2d50   9368d0:	48 8d 58 54          	lea    0x54(%rax),%rbx
2d54   9368d4:	48 89 d8             	mov    %rbx,%rax
2d57   9368d7:	48 c1 e8 03          	shr    $0x3,%rax
2d5b   9368db:	42 8a 04 28          	mov    (%rax,%r13,1),%al
2d5f   9368df:	84 c0                	test   %al,%al
2d61   9368e1:	0f 85 e3 18 00 00    	jne    9381ca <shrink_lruvec+0x464a>
2d67   9368e7:	44 8b 3b             	mov    (%rbx),%r15d
2d6a   9368ea:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
2d6f   9368ef:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
2d77   9368f7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
2d7c   9368fc:	74 08                	je     936906 <shrink_lruvec+0x2d86>
2d7e   9368fe:	48 89 df             	mov    %rbx,%rdi
2d81   936901:	e8 00 00 00 00       	call   936906 <shrink_lruvec+0x2d86>	936902: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2d86   936906:	4c 8b 2b             	mov    (%rbx),%r13
2d89   936909:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2d93   936913:	48 8b 8c 24 50 01 00 00 	mov    0x150(%rsp),%rcx
2d9b   93691b:	8a 04 01             	mov    (%rcx,%rax,1),%al
2d9e   93691e:	84 c0                	test   %al,%al
2da0   936920:	0f 85 06 18 00 00    	jne    93812c <shrink_lruvec+0x45ac>
2da6   936926:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93692c <shrink_lruvec+0x2dac>	936928: R_X86_64_PC32	debug_locks-0x4
2dac   93692c:	31 ff                	xor    %edi,%edi
2dae   93692e:	89 de                	mov    %ebx,%esi
2db0   936930:	e8 00 00 00 00       	call   936935 <shrink_lruvec+0x2db5>	936931: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2db5   936935:	85 db                	test   %ebx,%ebx
2db7   936937:	0f 84 ed 01 00 00    	je     936b2a <shrink_lruvec+0x2faa>
2dbd   93693d:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
2dc5   936945:	be ff ff ff ff       	mov    $0xffffffff,%esi
2dca   93694a:	e8 00 00 00 00       	call   93694f <shrink_lruvec+0x2dcf>	93694b: R_X86_64_PLT32	lock_is_held_type-0x4
2dcf   93694f:	89 c3                	mov    %eax,%ebx
2dd1   936951:	31 ff                	xor    %edi,%edi
2dd3   936953:	89 c6                	mov    %eax,%esi
2dd5   936955:	e8 00 00 00 00       	call   93695a <shrink_lruvec+0x2dda>	936956: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2dda   93695a:	85 db                	test   %ebx,%ebx
2ddc   93695c:	0f 84 1f 15 00 00    	je     937e81 <shrink_lruvec+0x4301>
2de2   936962:	e8 00 00 00 00       	call   936967 <shrink_lruvec+0x2de7>	936963: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2de7   936967:	e9 c3 01 00 00       	jmp    936b2f <shrink_lruvec+0x2faf>
2dec   93696c:	4c 89 ff             	mov    %r15,%rdi
2def   93696f:	be 08 00 00 00       	mov    $0x8,%esi
2df4   936974:	e8 00 00 00 00       	call   936979 <shrink_lruvec+0x2df9>	936975: R_X86_64_PLT32	__kasan_check_read-0x4
2df9   936979:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
2e03   936983:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2e08   936988:	74 08                	je     936992 <shrink_lruvec+0x2e12>
2e0a   93698a:	4c 89 ff             	mov    %r15,%rdi
2e0d   93698d:	e8 00 00 00 00       	call   936992 <shrink_lruvec+0x2e12>	93698e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2e12   936992:	49 8b 1f             	mov    (%r15),%rbx
2e15   936995:	48 89 de             	mov    %rbx,%rsi
2e18   936998:	48 83 e6 01          	and    $0x1,%rsi
2e1c   93699c:	31 ff                	xor    %edi,%edi
2e1e   93699e:	e8 00 00 00 00       	call   9369a3 <shrink_lruvec+0x2e23>	93699f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2e23   9369a3:	48 83 e3 01          	and    $0x1,%rbx
2e27   9369a7:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
2e2c   9369ac:	0f 85 82 04 00 00    	jne    936e34 <shrink_lruvec+0x32b4>
2e32   9369b2:	4c 89 ff             	mov    %r15,%rdi
2e35   9369b5:	be 08 00 00 00       	mov    $0x8,%esi
2e3a   9369ba:	e8 00 00 00 00       	call   9369bf <shrink_lruvec+0x2e3f>	9369bb: R_X86_64_PLT32	__kasan_check_read-0x4
2e3f   9369bf:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2e44   9369c4:	74 08                	je     9369ce <shrink_lruvec+0x2e4e>
2e46   9369c6:	4c 89 ff             	mov    %r15,%rdi
2e49   9369c9:	e8 00 00 00 00       	call   9369ce <shrink_lruvec+0x2e4e>	9369ca: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2e4e   9369ce:	49 8b 1f             	mov    (%r15),%rbx
2e51   9369d1:	be 00 80 00 00       	mov    $0x8000,%esi
2e56   9369d6:	48 21 de             	and    %rbx,%rsi
2e59   9369d9:	31 ff                	xor    %edi,%edi
2e5b   9369db:	e8 00 00 00 00       	call   9369e0 <shrink_lruvec+0x2e60>	9369dc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2e60   9369e0:	b8 00 80 00 00       	mov    $0x8000,%eax
2e65   9369e5:	48 21 c3             	and    %rax,%rbx
2e68   9369e8:	0f 85 d2 05 00 00    	jne    936fc0 <shrink_lruvec+0x3440>
2e6e   9369ee:	83 7c 24 70 00       	cmpl   $0x0,0x70(%rsp)
2e73   9369f3:	0f 85 a0 0a 00 00    	jne    937499 <shrink_lruvec+0x3919>
2e79   9369f9:	4c 89 ff             	mov    %r15,%rdi
2e7c   9369fc:	be 08 00 00 00       	mov    $0x8,%esi
2e81   936a01:	e8 00 00 00 00       	call   936a06 <shrink_lruvec+0x2e86>	936a02: R_X86_64_PLT32	__kasan_check_read-0x4
2e86   936a06:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
2e8b   936a0b:	74 08                	je     936a15 <shrink_lruvec+0x2e95>
2e8d   936a0d:	4c 89 ff             	mov    %r15,%rdi
2e90   936a10:	e8 00 00 00 00       	call   936a15 <shrink_lruvec+0x2e95>	936a11: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2e95   936a15:	49 8b 1f             	mov    (%r15),%rbx
2e98   936a18:	48 89 de             	mov    %rbx,%rsi
2e9b   936a1b:	48 83 e6 08          	and    $0x8,%rsi
2e9f   936a1f:	31 ff                	xor    %edi,%edi
2ea1   936a21:	e8 00 00 00 00       	call   936a26 <shrink_lruvec+0x2ea6>	936a22: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2ea6   936a26:	48 83 e3 08          	and    $0x8,%rbx
2eaa   936a2a:	0f 85 fc 0b 00 00    	jne    93762c <shrink_lruvec+0x3aac>
2eb0   936a30:	e8 00 00 00 00       	call   936a35 <shrink_lruvec+0x2eb5>	936a31: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2eb5   936a35:	e9 64 0a 00 00       	jmp    93749e <shrink_lruvec+0x391e>
2eba   936a3a:	e8 00 00 00 00       	call   936a3f <shrink_lruvec+0x2ebf>	936a3b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2ebf   936a3f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2ec9   936a49:	4e 8d 2c 3b          	lea    (%rbx,%r15,1),%r13
2ecd   936a4d:	49 81 c5 e0 00 00 00 	add    $0xe0,%r13
2ed4   936a54:	4d 89 ec             	mov    %r13,%r12
2ed7   936a57:	49 c1 ec 03          	shr    $0x3,%r12
2edb   936a5b:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
2ee0   936a60:	74 08                	je     936a6a <shrink_lruvec+0x2eea>
2ee2   936a62:	4c 89 ef             	mov    %r13,%rdi
2ee5   936a65:	e8 00 00 00 00       	call   936a6a <shrink_lruvec+0x2eea>	936a66: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2eea   936a6a:	4d 8b 75 00          	mov    0x0(%r13),%r14
2eee   936a6e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
2ef3   936a73:	4c 89 ee             	mov    %r13,%rsi
2ef6   936a76:	4c 89 f2             	mov    %r14,%rdx
2ef9   936a79:	e8 00 00 00 00       	call   936a7e <shrink_lruvec+0x2efe>	936a7a: R_X86_64_PLT32	__list_add_valid-0x4
2efe   936a7e:	84 c0                	test   %al,%al
2f00   936a80:	0f 84 9a 00 00 00    	je     936b20 <shrink_lruvec+0x2fa0>
2f06   936a86:	e8 00 00 00 00       	call   936a8b <shrink_lruvec+0x2f0b>	936a87: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2f0b   936a8b:	4d 8d 7e 08          	lea    0x8(%r14),%r15
2f0f   936a8f:	4c 89 f8             	mov    %r15,%rax
2f12   936a92:	48 c1 e8 03          	shr    $0x3,%rax
2f16   936a96:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2f20   936aa0:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2f24   936aa4:	74 08                	je     936aae <shrink_lruvec+0x2f2e>
2f26   936aa6:	4c 89 ff             	mov    %r15,%rdi
2f29   936aa9:	e8 00 00 00 00       	call   936aae <shrink_lruvec+0x2f2e>	936aaa: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2f2e   936aae:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
2f33   936ab3:	49 89 1f             	mov    %rbx,(%r15)
2f36   936ab6:	48 89 d8             	mov    %rbx,%rax
2f39   936ab9:	48 c1 e8 03          	shr    $0x3,%rax
2f3d   936abd:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2f47   936ac7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2f4b   936acb:	74 08                	je     936ad5 <shrink_lruvec+0x2f55>
2f4d   936acd:	48 89 df             	mov    %rbx,%rdi
2f50   936ad0:	e8 00 00 00 00       	call   936ad5 <shrink_lruvec+0x2f55>	936ad1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2f55   936ad5:	4c 89 33             	mov    %r14,(%rbx)
2f58   936ad8:	4c 8d 73 08          	lea    0x8(%rbx),%r14
2f5c   936adc:	4c 89 f0             	mov    %r14,%rax
2f5f   936adf:	48 c1 e8 03          	shr    $0x3,%rax
2f63   936ae3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2f6d   936aed:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2f71   936af1:	74 08                	je     936afb <shrink_lruvec+0x2f7b>
2f73   936af3:	4c 89 f7             	mov    %r14,%rdi
2f76   936af6:	e8 00 00 00 00       	call   936afb <shrink_lruvec+0x2f7b>	936af7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2f7b   936afb:	4d 89 2e             	mov    %r13,(%r14)
2f7e   936afe:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2f88   936b08:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
2f8d   936b0d:	0f 84 8c 06 00 00    	je     93719f <shrink_lruvec+0x361f>
2f93   936b13:	4c 89 ef             	mov    %r13,%rdi
2f96   936b16:	e8 00 00 00 00       	call   936b1b <shrink_lruvec+0x2f9b>	936b17: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2f9b   936b1b:	e9 7f 06 00 00       	jmp    93719f <shrink_lruvec+0x361f>
2fa0   936b20:	e8 00 00 00 00       	call   936b25 <shrink_lruvec+0x2fa5>	936b21: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2fa5   936b25:	e9 85 06 00 00       	jmp    9371af <shrink_lruvec+0x362f>
2faa   936b2a:	e8 00 00 00 00       	call   936b2f <shrink_lruvec+0x2faf>	936b2b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2faf   936b2f:	41 83 e4 03          	and    $0x3,%r12d
2fb3   936b33:	bf 00 00 00 80       	mov    $0x80000000,%edi
2fb8   936b38:	4c 89 fe             	mov    %r15,%rsi
2fbb   936b3b:	e8 00 00 00 00       	call   936b40 <shrink_lruvec+0x2fc0>	936b3c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2fc0   936b40:	b8 00 00 00 80       	mov    $0x80000000,%eax
2fc5   936b45:	49 39 c7             	cmp    %rax,%r15
2fc8   936b48:	0f 83 8f 12 00 00    	jae    937ddd <shrink_lruvec+0x425d>
2fce   936b4e:	e8 00 00 00 00       	call   936b53 <shrink_lruvec+0x2fd3>	936b4f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2fd3   936b53:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
2fd8   936b58:	48 89 df             	mov    %rbx,%rdi
2fdb   936b5b:	44 89 f6             	mov    %r14d,%esi
2fde   936b5e:	44 89 fa             	mov    %r15d,%edx
2fe1   936b61:	e8 00 00 00 00       	call   936b66 <shrink_lruvec+0x2fe6>	936b62: R_X86_64_PLT32	__mod_lruvec_state-0x4
2fe6   936b66:	44 89 e0             	mov    %r12d,%eax
2fe9   936b69:	48 69 c0 00 07 00 00 	imul   $0x700,%rax,%rax
2ff0   936b70:	49 01 c5             	add    %rax,%r13
2ff3   936b73:	41 8d 76 01          	lea    0x1(%r14),%esi
2ff7   936b77:	4c 89 ef             	mov    %r13,%rdi
2ffa   936b7a:	4c 89 fa             	mov    %r15,%rdx
2ffd   936b7d:	e8 00 00 00 00       	call   936b82 <shrink_lruvec+0x3002>	936b7e: R_X86_64_PLT32	__mod_zone_page_state-0x4
3002   936b82:	48 89 df             	mov    %rbx,%rdi
3005   936b85:	44 89 f6             	mov    %r14d,%esi
3008   936b88:	44 89 e2             	mov    %r12d,%edx
300b   936b8b:	44 89 f9             	mov    %r15d,%ecx
300e   936b8e:	e8 00 00 00 00       	call   936b93 <shrink_lruvec+0x3013>	936b8f: R_X86_64_PLT32	mem_cgroup_update_lru_size-0x4
3013   936b93:	bf 04 00 00 00       	mov    $0x4,%edi
3018   936b98:	44 89 f6             	mov    %r14d,%esi
301b   936b9b:	e8 00 00 00 00       	call   936ba0 <shrink_lruvec+0x3020>	936b9c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3020   936ba0:	41 83 fe 04          	cmp    $0x4,%r14d
3024   936ba4:	75 21                	jne    936bc7 <shrink_lruvec+0x3047>
3026   936ba6:	e8 00 00 00 00       	call   936bab <shrink_lruvec+0x302b>	936ba7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
302b   936bab:	8b 44 24 28          	mov    0x28(%rsp),%eax
302f   936baf:	01 44 24 78          	add    %eax,0x78(%rsp)
3033   936bb3:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
303d   936bbd:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
3042   936bc2:	e9 ff 05 00 00       	jmp    9371c6 <shrink_lruvec+0x3646>
3047   936bc7:	45 89 f4             	mov    %r14d,%r12d
304a   936bca:	49 c1 e4 04          	shl    $0x4,%r12
304e   936bce:	49 01 dc             	add    %rbx,%r12
3051   936bd1:	4c 89 e3             	mov    %r12,%rbx
3054   936bd4:	48 c1 eb 03          	shr    $0x3,%rbx
3058   936bd8:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
3062   936be2:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
3067   936be7:	74 08                	je     936bf1 <shrink_lruvec+0x3071>
3069   936be9:	4c 89 e7             	mov    %r12,%rdi
306c   936bec:	e8 00 00 00 00       	call   936bf1 <shrink_lruvec+0x3071>	936bed: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3071   936bf1:	4d 8b 34 24          	mov    (%r12),%r14
3075   936bf5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
307a   936bfa:	4c 89 e6             	mov    %r12,%rsi
307d   936bfd:	4c 89 f2             	mov    %r14,%rdx
3080   936c00:	e8 00 00 00 00       	call   936c05 <shrink_lruvec+0x3085>	936c01: R_X86_64_PLT32	__list_add_valid-0x4
3085   936c05:	84 c0                	test   %al,%al
3087   936c07:	0f 84 18 01 00 00    	je     936d25 <shrink_lruvec+0x31a5>
308d   936c0d:	e8 00 00 00 00       	call   936c12 <shrink_lruvec+0x3092>	936c0e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3092   936c12:	4d 8d 7e 08          	lea    0x8(%r14),%r15
3096   936c16:	4c 89 f8             	mov    %r15,%rax
3099   936c19:	48 c1 e8 03          	shr    $0x3,%rax
309d   936c1d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
30a2   936c22:	74 08                	je     936c2c <shrink_lruvec+0x30ac>
30a4   936c24:	4c 89 ff             	mov    %r15,%rdi
30a7   936c27:	e8 00 00 00 00       	call   936c2c <shrink_lruvec+0x30ac>	936c28: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
30ac   936c2c:	4c 8b 6c 24 10       	mov    0x10(%rsp),%r13
30b1   936c31:	4d 89 2f             	mov    %r13,(%r15)
30b4   936c34:	4c 89 e8             	mov    %r13,%rax
30b7   936c37:	48 c1 e8 03          	shr    $0x3,%rax
30bb   936c3b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
30c5   936c45:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
30c9   936c49:	74 08                	je     936c53 <shrink_lruvec+0x30d3>
30cb   936c4b:	4c 89 ef             	mov    %r13,%rdi
30ce   936c4e:	e8 00 00 00 00       	call   936c53 <shrink_lruvec+0x30d3>	936c4f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
30d3   936c53:	4d 89 75 00          	mov    %r14,0x0(%r13)
30d7   936c57:	4d 8d 75 08          	lea    0x8(%r13),%r14
30db   936c5b:	4c 89 f0             	mov    %r14,%rax
30de   936c5e:	48 c1 e8 03          	shr    $0x3,%rax
30e2   936c62:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
30ec   936c6c:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
30f1   936c71:	74 08                	je     936c7b <shrink_lruvec+0x30fb>
30f3   936c73:	4c 89 f7             	mov    %r14,%rdi
30f6   936c76:	e8 00 00 00 00       	call   936c7b <shrink_lruvec+0x30fb>	936c77: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
30fb   936c7b:	4d 89 26             	mov    %r12,(%r14)
30fe   936c7e:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
3103   936c83:	74 08                	je     936c8d <shrink_lruvec+0x310d>
3105   936c85:	4c 89 e7             	mov    %r12,%rdi
3108   936c88:	e8 00 00 00 00       	call   936c8d <shrink_lruvec+0x310d>	936c89: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
310d   936c8d:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3112   936c92:	49 89 04 24          	mov    %rax,(%r12)
3116   936c96:	e9 2d fb ff ff       	jmp    9367c8 <shrink_lruvec+0x2c48>
311b   936c9b:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
3125   936ca5:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
312a   936caa:	74 08                	je     936cb4 <shrink_lruvec+0x3134>
312c   936cac:	4c 89 ff             	mov    %r15,%rdi
312f   936caf:	e8 00 00 00 00       	call   936cb4 <shrink_lruvec+0x3134>	936cb0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3134   936cb4:	49 8b 1f             	mov    (%r15),%rbx
3137   936cb7:	49 be 00 00 00 00 80 03 00 00 	movabs $0x38000000000,%r14
3141   936cc1:	4c 89 f6             	mov    %r14,%rsi
3144   936cc4:	48 21 de             	and    %rbx,%rsi
3147   936cc7:	31 ff                	xor    %edi,%edi
3149   936cc9:	e8 00 00 00 00       	call   936cce <shrink_lruvec+0x314e>	936cca: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
314e   936cce:	4c 21 f3             	and    %r14,%rbx
3151   936cd1:	0f 84 5e 05 00 00    	je     937235 <shrink_lruvec+0x36b5>
3157   936cd7:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
315c   936cdc:	74 08                	je     936ce6 <shrink_lruvec+0x3166>
315e   936cde:	4c 89 ff             	mov    %r15,%rdi
3161   936ce1:	e8 00 00 00 00       	call   936ce6 <shrink_lruvec+0x3166>	936ce2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3166   936ce6:	49 8b 1f             	mov    (%r15),%rbx
3169   936ce9:	49 89 de             	mov    %rbx,%r14
316c   936cec:	48 b8 ff ff ff ff 7f fc ff ff 	movabs $0xfffffc7fffffffff,%rax
3176   936cf6:	49 21 c6             	and    %rax,%r14
3179   936cf9:	4c 89 ff             	mov    %r15,%rdi
317c   936cfc:	be 08 00 00 00       	mov    $0x8,%esi
3181   936d01:	e8 00 00 00 00       	call   936d06 <shrink_lruvec+0x3186>	936d02: R_X86_64_PLT32	__kasan_check_write-0x4
3186   936d06:	48 89 d8             	mov    %rbx,%rax
3189   936d09:	f0 4d 0f b1 37       	lock cmpxchg %r14,(%r15)
318e   936d0e:	48 39 d8             	cmp    %rbx,%rax
3191   936d11:	0f 84 e1 01 00 00    	je     936ef8 <shrink_lruvec+0x3378>
3197   936d17:	e8 00 00 00 00       	call   936d1c <shrink_lruvec+0x319c>	936d18: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
319c   936d1c:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
31a1   936d21:	75 bb                	jne    936cde <shrink_lruvec+0x315e>
31a3   936d23:	eb c1                	jmp    936ce6 <shrink_lruvec+0x3166>
31a5   936d25:	e8 00 00 00 00       	call   936d2a <shrink_lruvec+0x31aa>	936d26: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
31aa   936d2a:	e9 99 fa ff ff       	jmp    9367c8 <shrink_lruvec+0x2c48>
31af   936d2f:	e8 00 00 00 00       	call   936d34 <shrink_lruvec+0x31b4>	936d30: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
31b4   936d34:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
31b9   936d39:	4e 8d 3c 20          	lea    (%rax,%r12,1),%r15
31bd   936d3d:	49 81 c7 e8 00 00 00 	add    $0xe8,%r15
31c4   936d44:	4c 89 fb             	mov    %r15,%rbx
31c7   936d47:	48 c1 eb 03          	shr    $0x3,%rbx
31cb   936d4b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
31d5   936d55:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
31d9   936d59:	74 08                	je     936d63 <shrink_lruvec+0x31e3>
31db   936d5b:	4c 89 ff             	mov    %r15,%rdi
31de   936d5e:	e8 00 00 00 00       	call   936d63 <shrink_lruvec+0x31e3>	936d5f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
31e3   936d63:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
31e8   936d68:	4a 8d 14 20          	lea    (%rax,%r12,1),%rdx
31ec   936d6c:	48 81 c2 e0 00 00 00 	add    $0xe0,%rdx
31f3   936d73:	4d 8b 27             	mov    (%r15),%r12
31f6   936d76:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
31fb   936d7b:	4c 89 e6             	mov    %r12,%rsi
31fe   936d7e:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
3203   936d83:	e8 00 00 00 00       	call   936d88 <shrink_lruvec+0x3208>	936d84: R_X86_64_PLT32	__list_add_valid-0x4
3208   936d88:	84 c0                	test   %al,%al
320a   936d8a:	0f 84 ae 00 00 00    	je     936e3e <shrink_lruvec+0x32be>
3210   936d90:	e8 00 00 00 00       	call   936d95 <shrink_lruvec+0x3215>	936d91: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3215   936d95:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
321f   936d9f:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
3223   936da3:	74 08                	je     936dad <shrink_lruvec+0x322d>
3225   936da5:	4c 89 ff             	mov    %r15,%rdi
3228   936da8:	e8 00 00 00 00       	call   936dad <shrink_lruvec+0x322d>	936da9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
322d   936dad:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
3232   936db2:	49 89 1f             	mov    %rbx,(%r15)
3235   936db5:	48 89 d8             	mov    %rbx,%rax
3238   936db8:	48 c1 e8 03          	shr    $0x3,%rax
323c   936dbc:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3246   936dc6:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
324a   936dca:	74 08                	je     936dd4 <shrink_lruvec+0x3254>
324c   936dcc:	48 89 df             	mov    %rbx,%rdi
324f   936dcf:	e8 00 00 00 00       	call   936dd4 <shrink_lruvec+0x3254>	936dd0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3254   936dd4:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
3259   936dd9:	48 89 03             	mov    %rax,(%rbx)
325c   936ddc:	48 83 c3 08          	add    $0x8,%rbx
3260   936de0:	48 89 d8             	mov    %rbx,%rax
3263   936de3:	48 c1 e8 03          	shr    $0x3,%rax
3267   936de7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3271   936df1:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3275   936df5:	4c 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%r15
327d   936dfd:	74 08                	je     936e07 <shrink_lruvec+0x3287>
327f   936dff:	48 89 df             	mov    %rbx,%rdi
3282   936e02:	e8 00 00 00 00       	call   936e07 <shrink_lruvec+0x3287>	936e03: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3287   936e07:	4c 89 23             	mov    %r12,(%rbx)
328a   936e0a:	4c 89 e0             	mov    %r12,%rax
328d   936e0d:	48 c1 e8 03          	shr    $0x3,%rax
3291   936e11:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
329b   936e1b:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
329f   936e1f:	74 08                	je     936e29 <shrink_lruvec+0x32a9>
32a1   936e21:	4c 89 e7             	mov    %r12,%rdi
32a4   936e24:	e8 00 00 00 00       	call   936e29 <shrink_lruvec+0x32a9>	936e25: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
32a9   936e29:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
32ae   936e2e:	49 89 04 24          	mov    %rax,(%r12)
32b2   936e32:	eb 17                	jmp    936e4b <shrink_lruvec+0x32cb>
32b4   936e34:	e8 00 00 00 00       	call   936e39 <shrink_lruvec+0x32b9>	936e35: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32b9   936e39:	e9 87 01 00 00       	jmp    936fc5 <shrink_lruvec+0x3445>
32be   936e3e:	e8 00 00 00 00       	call   936e43 <shrink_lruvec+0x32c3>	936e3f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32c3   936e43:	4c 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%r15
32cb   936e4b:	45 89 ec             	mov    %r13d,%r12d
32ce   936e4e:	41 83 c6 ff          	add    $0xffffffff,%r14d
32d2   936e52:	49 63 de             	movslq %r14d,%rbx
32d5   936e55:	bf 03 00 00 00       	mov    $0x3,%edi
32da   936e5a:	89 de                	mov    %ebx,%esi
32dc   936e5c:	e8 00 00 00 00       	call   936e61 <shrink_lruvec+0x32e1>	936e5d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
32e1   936e61:	83 fb 02             	cmp    $0x2,%ebx
32e4   936e64:	0f 87 75 14 00 00    	ja     9382df <shrink_lruvec+0x475f>
32ea   936e6a:	e8 00 00 00 00       	call   936e6f <shrink_lruvec+0x32ef>	936e6b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
32ef   936e6f:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
32f3   936e73:	48 c1 e0 04          	shl    $0x4,%rax
32f7   936e77:	48 03 44 24 18       	add    0x18(%rsp),%rax
32fc   936e7c:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
3304   936e84:	48 8d 04 c8          	lea    (%rax,%rcx,8),%rax
3308   936e88:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
330c   936e8c:	48 81 c3 a0 03 00 00 	add    $0x3a0,%rbx
3313   936e93:	48 89 d8             	mov    %rbx,%rax
3316   936e96:	48 c1 e8 03          	shr    $0x3,%rax
331a   936e9a:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
3324   936ea4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3329   936ea9:	74 08                	je     936eb3 <shrink_lruvec+0x3333>
332b   936eab:	48 89 df             	mov    %rbx,%rdi
332e   936eae:	e8 00 00 00 00       	call   936eb3 <shrink_lruvec+0x3333>	936eaf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3333   936eb3:	4d 63 e7             	movslq %r15d,%r12
3336   936eb6:	4c 03 23             	add    (%rbx),%r12
3339   936eb9:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
333e   936ebe:	48 89 d8             	mov    %rbx,%rax
3341   936ec1:	48 c1 e8 03          	shr    $0x3,%rax
3345   936ec5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
334a   936eca:	74 08                	je     936ed4 <shrink_lruvec+0x3354>
334c   936ecc:	48 89 df             	mov    %rbx,%rdi
334f   936ecf:	e8 00 00 00 00       	call   936ed4 <shrink_lruvec+0x3354>	936ed0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3354   936ed4:	4c 89 23             	mov    %r12,(%rbx)
3357   936ed7:	8b 74 24 70          	mov    0x70(%rsp),%esi
335b   936edb:	83 f6 0d             	xor    $0xd,%esi
335e   936ede:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
3363   936ee3:	44 89 fa             	mov    %r15d,%edx
3366   936ee6:	e8 00 00 00 00       	call   936eeb <shrink_lruvec+0x336b>	936ee7: R_X86_64_PLT32	__mod_lruvec_state-0x4
336b   936eeb:	8b 44 24 28          	mov    0x28(%rsp),%eax
336f   936eef:	01 44 24 78          	add    %eax,0x78(%rsp)
3373   936ef3:	e9 ce 02 00 00       	jmp    9371c6 <shrink_lruvec+0x3646>
3378   936ef8:	48 c1 eb 27          	shr    $0x27,%rbx
337c   936efc:	83 e3 07             	and    $0x7,%ebx
337f   936eff:	83 c3 ff             	add    $0xffffffff,%ebx
3382   936f02:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
3387   936f07:	4c 89 fe             	mov    %r15,%rsi
338a   936f0a:	89 da                	mov    %ebx,%edx
338c   936f0c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
3391   936f11:	e8 aa 84 ff ff       	call   92f3c0 <lru_gen_update_size>
3396   936f16:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
339b   936f1b:	48 89 df             	mov    %rbx,%rdi
339e   936f1e:	e8 00 00 00 00       	call   936f23 <shrink_lruvec+0x33a3>	936f1f: R_X86_64_PLT32	__list_del_entry_valid-0x4
33a3   936f23:	84 c0                	test   %al,%al
33a5   936f25:	0f 84 16 03 00 00    	je     937241 <shrink_lruvec+0x36c1>
33ab   936f2b:	e8 00 00 00 00       	call   936f30 <shrink_lruvec+0x33b0>	936f2c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
33b0   936f30:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
33b4   936f34:	48 89 f8             	mov    %rdi,%rax
33b7   936f37:	48 c1 e8 03          	shr    $0x3,%rax
33bb   936f3b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
33c0   936f40:	74 05                	je     936f47 <shrink_lruvec+0x33c7>
33c2   936f42:	e8 00 00 00 00       	call   936f47 <shrink_lruvec+0x33c7>	936f43: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
33c7   936f47:	4c 8b 73 08          	mov    0x8(%rbx),%r14
33cb   936f4b:	48 89 d8             	mov    %rbx,%rax
33ce   936f4e:	48 c1 e8 03          	shr    $0x3,%rax
33d2   936f52:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
33d7   936f57:	74 08                	je     936f61 <shrink_lruvec+0x33e1>
33d9   936f59:	48 89 df             	mov    %rbx,%rdi
33dc   936f5c:	e8 00 00 00 00       	call   936f61 <shrink_lruvec+0x33e1>	936f5d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
33e1   936f61:	4c 8b 2b             	mov    (%rbx),%r13
33e4   936f64:	49 8d 5d 08          	lea    0x8(%r13),%rbx
33e8   936f68:	48 89 d8             	mov    %rbx,%rax
33eb   936f6b:	48 c1 e8 03          	shr    $0x3,%rax
33ef   936f6f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
33f9   936f79:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
33fd   936f7d:	74 08                	je     936f87 <shrink_lruvec+0x3407>
33ff   936f7f:	48 89 df             	mov    %rbx,%rdi
3402   936f82:	e8 00 00 00 00       	call   936f87 <shrink_lruvec+0x3407>	936f83: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3407   936f87:	4c 89 33             	mov    %r14,(%rbx)
340a   936f8a:	4c 89 f0             	mov    %r14,%rax
340d   936f8d:	48 c1 e8 03          	shr    $0x3,%rax
3411   936f91:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
341b   936f9b:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
341f   936f9f:	74 08                	je     936fa9 <shrink_lruvec+0x3429>
3421   936fa1:	4c 89 f7             	mov    %r14,%rdi
3424   936fa4:	e8 00 00 00 00       	call   936fa9 <shrink_lruvec+0x3429>	936fa5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3429   936fa9:	4d 89 2e             	mov    %r13,(%r14)
342c   936fac:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
3436   936fb6:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
343b   936fbb:	e9 86 02 00 00       	jmp    937246 <shrink_lruvec+0x36c6>
3440   936fc0:	e8 00 00 00 00       	call   936fc5 <shrink_lruvec+0x3445>	936fc1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3445   936fc5:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
344a   936fca:	4c 89 fe             	mov    %r15,%rsi
344d   936fcd:	ba 01 00 00 00       	mov    $0x1,%edx
3452   936fd2:	e8 e9 c2 01 00       	call   9532c0 <folio_inc_gen>
3457   936fd7:	89 c3                	mov    %eax,%ebx
3459   936fd9:	bf 04 00 00 00       	mov    $0x4,%edi
345e   936fde:	89 c6                	mov    %eax,%esi
3460   936fe0:	e8 00 00 00 00       	call   936fe5 <shrink_lruvec+0x3465>	936fe1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3465   936fe5:	83 fb 03             	cmp    $0x3,%ebx
3468   936fe8:	0f 87 80 13 00 00    	ja     93836e <shrink_lruvec+0x47ee>
346e   936fee:	e8 00 00 00 00       	call   936ff3 <shrink_lruvec+0x3473>	936fef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3473   936ff3:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
347b   936ffb:	48 63 c3             	movslq %ebx,%rax
347e   936ffe:	8b 5c 24 20          	mov    0x20(%rsp),%ebx
3482   937002:	48 8d 04 40          	lea    (%rax,%rax,2),%rax
3486   937006:	48 c1 e0 05          	shl    $0x5,%rax
348a   93700a:	48 03 44 24 18       	add    0x18(%rsp),%rax
348f   93700f:	4c 8d 3c 49          	lea    (%rcx,%rcx,2),%r15
3493   937013:	49 c1 e7 04          	shl    $0x4,%r15
3497   937017:	49 01 c7             	add    %rax,%r15
349a   93701a:	48 c1 e3 04          	shl    $0x4,%rbx
349e   93701e:	4c 89 f7             	mov    %r14,%rdi
34a1   937021:	e8 00 00 00 00       	call   937026 <shrink_lruvec+0x34a6>	937022: R_X86_64_PLT32	__list_del_entry_valid-0x4
34a6   937026:	84 c0                	test   %al,%al
34a8   937028:	0f 84 9b 00 00 00    	je     9370c9 <shrink_lruvec+0x3549>
34ae   93702e:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
34b3   937033:	e8 00 00 00 00       	call   937038 <shrink_lruvec+0x34b8>	937034: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
34b8   937038:	49 8d 7e 08          	lea    0x8(%r14),%rdi
34bc   93703c:	48 89 f8             	mov    %rdi,%rax
34bf   93703f:	48 c1 e8 03          	shr    $0x3,%rax
34c3   937043:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
34c8   937048:	74 05                	je     93704f <shrink_lruvec+0x34cf>
34ca   93704a:	e8 00 00 00 00       	call   93704f <shrink_lruvec+0x34cf>	93704b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
34cf   93704f:	4c 89 f3             	mov    %r14,%rbx
34d2   937052:	4d 8b 76 08          	mov    0x8(%r14),%r14
34d6   937056:	48 89 d8             	mov    %rbx,%rax
34d9   937059:	48 c1 e8 03          	shr    $0x3,%rax
34dd   93705d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
34e2   937062:	74 08                	je     93706c <shrink_lruvec+0x34ec>
34e4   937064:	48 89 df             	mov    %rbx,%rdi
34e7   937067:	e8 00 00 00 00       	call   93706c <shrink_lruvec+0x34ec>	937068: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
34ec   93706c:	4c 8b 2b             	mov    (%rbx),%r13
34ef   93706f:	4d 8d 65 08          	lea    0x8(%r13),%r12
34f3   937073:	4c 89 e0             	mov    %r12,%rax
34f6   937076:	48 c1 e8 03          	shr    $0x3,%rax
34fa   93707a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3504   937084:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
3508   937088:	74 08                	je     937092 <shrink_lruvec+0x3512>
350a   93708a:	4c 89 e7             	mov    %r12,%rdi
350d   93708d:	e8 00 00 00 00       	call   937092 <shrink_lruvec+0x3512>	93708e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3512   937092:	4d 89 34 24          	mov    %r14,(%r12)
3516   937096:	4c 89 f0             	mov    %r14,%rax
3519   937099:	48 c1 e8 03          	shr    $0x3,%rax
351d   93709d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
3527   9370a7:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
352b   9370ab:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
3530   9370b0:	74 08                	je     9370ba <shrink_lruvec+0x353a>
3532   9370b2:	4c 89 f7             	mov    %r14,%rdi
3535   9370b5:	e8 00 00 00 00       	call   9370ba <shrink_lruvec+0x353a>	9370b6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
353a   9370ba:	4d 89 2e             	mov    %r13,(%r14)
353d   9370bd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3547   9370c7:	eb 08                	jmp    9370d1 <shrink_lruvec+0x3551>
3549   9370c9:	e8 00 00 00 00       	call   9370ce <shrink_lruvec+0x354e>	9370ca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
354e   9370ce:	4c 89 e8             	mov    %r13,%rax
3551   9370d1:	4e 8d 2c 3b          	lea    (%rbx,%r15,1),%r13
3555   9370d5:	49 81 c5 e0 00 00 00 	add    $0xe0,%r13
355c   9370dc:	4d 89 ec             	mov    %r13,%r12
355f   9370df:	49 c1 ec 03          	shr    $0x3,%r12
3563   9370e3:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
3568   9370e8:	74 08                	je     9370f2 <shrink_lruvec+0x3572>
356a   9370ea:	4c 89 ef             	mov    %r13,%rdi
356d   9370ed:	e8 00 00 00 00       	call   9370f2 <shrink_lruvec+0x3572>	9370ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3572   9370f2:	4d 8b 75 00          	mov    0x0(%r13),%r14
3576   9370f6:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
357b   9370fb:	4c 89 ee             	mov    %r13,%rsi
357e   9370fe:	4c 89 f2             	mov    %r14,%rdx
3581   937101:	e8 00 00 00 00       	call   937106 <shrink_lruvec+0x3586>	937102: R_X86_64_PLT32	__list_add_valid-0x4
3586   937106:	84 c0                	test   %al,%al
3588   937108:	0f 84 9c 00 00 00    	je     9371aa <shrink_lruvec+0x362a>
358e   93710e:	e8 00 00 00 00       	call   937113 <shrink_lruvec+0x3593>	93710f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3593   937113:	4d 8d 7e 08          	lea    0x8(%r14),%r15
3597   937117:	4c 89 f8             	mov    %r15,%rax
359a   93711a:	48 c1 e8 03          	shr    $0x3,%rax
359e   93711e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
35a8   937128:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
35ac   93712c:	74 08                	je     937136 <shrink_lruvec+0x35b6>
35ae   93712e:	4c 89 ff             	mov    %r15,%rdi
35b1   937131:	e8 00 00 00 00       	call   937136 <shrink_lruvec+0x35b6>	937132: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
35b6   937136:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
35bb   93713b:	49 89 1f             	mov    %rbx,(%r15)
35be   93713e:	48 89 d8             	mov    %rbx,%rax
35c1   937141:	48 c1 e8 03          	shr    $0x3,%rax
35c5   937145:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
35cf   93714f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
35d3   937153:	74 08                	je     93715d <shrink_lruvec+0x35dd>
35d5   937155:	48 89 df             	mov    %rbx,%rdi
35d8   937158:	e8 00 00 00 00       	call   93715d <shrink_lruvec+0x35dd>	937159: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
35dd   93715d:	4c 89 33             	mov    %r14,(%rbx)
35e0   937160:	4c 8d 73 08          	lea    0x8(%rbx),%r14
35e4   937164:	4c 89 f0             	mov    %r14,%rax
35e7   937167:	48 c1 e8 03          	shr    $0x3,%rax
35eb   93716b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
35f5   937175:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
35f9   937179:	74 08                	je     937183 <shrink_lruvec+0x3603>
35fb   93717b:	4c 89 f7             	mov    %r14,%rdi
35fe   93717e:	e8 00 00 00 00       	call   937183 <shrink_lruvec+0x3603>	93717f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3603   937183:	4d 89 2e             	mov    %r13,(%r14)
3606   937186:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3610   937190:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
3615   937195:	74 08                	je     93719f <shrink_lruvec+0x361f>
3617   937197:	4c 89 ef             	mov    %r13,%rdi
361a   93719a:	e8 00 00 00 00       	call   93719f <shrink_lruvec+0x361f>	93719b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
361f   93719f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3624   9371a4:	49 89 45 00          	mov    %rax,0x0(%r13)
3628   9371a8:	eb 05                	jmp    9371af <shrink_lruvec+0x362f>
362a   9371aa:	e8 00 00 00 00       	call   9371af <shrink_lruvec+0x362f>	9371ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
362f   9371af:	8b 44 24 28          	mov    0x28(%rsp),%eax
3633   9371b3:	01 44 24 78          	add    %eax,0x78(%rsp)
3637   9371b7:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
363c   9371bc:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
3646   9371c6:	01 84 24 d0 00 00 00 	add    %eax,0xd0(%rsp)
364d   9371cd:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
3652   9371d2:	41 8d 77 ff          	lea    -0x1(%r15),%esi
3656   9371d6:	31 ff                	xor    %edi,%edi
3658   9371d8:	e8 00 00 00 00       	call   9371dd <shrink_lruvec+0x365d>	9371d9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
365d   9371dd:	44 8b 64 24 40       	mov    0x40(%rsp),%r12d
3662   9371e2:	44 89 e7             	mov    %r12d,%edi
3665   9371e5:	8b 5c 24 38          	mov    0x38(%rsp),%ebx
3669   9371e9:	89 de                	mov    %ebx,%esi
366b   9371eb:	e8 00 00 00 00       	call   9371f0 <shrink_lruvec+0x3670>	9371ec: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
3670   9371f0:	41 39 dc             	cmp    %ebx,%r12d
3673   9371f3:	41 0f 4f dc          	cmovg  %r12d,%ebx
3677   9371f7:	bf 40 00 00 00       	mov    $0x40,%edi
367c   9371fc:	89 de                	mov    %ebx,%esi
367e   9371fe:	e8 00 00 00 00       	call   937203 <shrink_lruvec+0x3683>	9371ff: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3683   937203:	41 83 c7 ff          	add    $0xffffffff,%r15d
3687   937207:	4c 89 7c 24 30       	mov    %r15,0x30(%rsp)
368c   93720c:	0f 84 27 12 00 00    	je     938439 <shrink_lruvec+0x48b9>
3692   937212:	83 fb 40             	cmp    $0x40,%ebx
3695   937215:	0f 8d 1e 12 00 00    	jge    938439 <shrink_lruvec+0x48b9>
369b   93721b:	e8 00 00 00 00       	call   937220 <shrink_lruvec+0x36a0>	93721c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
36a0   937220:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
36a8   937228:	4c 8b a4 24 10 01 00 00 	mov    0x110(%rsp),%r12
36b0   937230:	e9 9a ed ff ff       	jmp    935fcf <shrink_lruvec+0x244f>
36b5   937235:	e8 00 00 00 00       	call   93723a <shrink_lruvec+0x36ba>	937236: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
36ba   93723a:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
36bf   93723f:	eb 53                	jmp    937294 <shrink_lruvec+0x3714>
36c1   937241:	e8 00 00 00 00       	call   937246 <shrink_lruvec+0x36c6>	937242: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
36c6   937246:	48 89 d8             	mov    %rbx,%rax
36c9   937249:	48 c1 e8 03          	shr    $0x3,%rax
36cd   93724d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
36d2   937252:	74 08                	je     93725c <shrink_lruvec+0x36dc>
36d4   937254:	48 89 df             	mov    %rbx,%rdi
36d7   937257:	e8 00 00 00 00       	call   93725c <shrink_lruvec+0x36dc>	937258: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
36dc   93725c:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
36e6   937266:	48 89 03             	mov    %rax,(%rbx)
36e9   937269:	4c 8d 73 08          	lea    0x8(%rbx),%r14
36ed   93726d:	4c 89 f0             	mov    %r14,%rax
36f0   937270:	48 c1 e8 03          	shr    $0x3,%rax
36f4   937274:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
36f9   937279:	74 08                	je     937283 <shrink_lruvec+0x3703>
36fb   93727b:	4c 89 f7             	mov    %r14,%rdi
36fe   93727e:	e8 00 00 00 00       	call   937283 <shrink_lruvec+0x3703>	93727f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3703   937283:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
370d   93728d:	48 83 c0 22          	add    $0x22,%rax
3711   937291:	49 89 06             	mov    %rax,(%r14)
3714   937294:	4c 89 ff             	mov    %r15,%rdi
3717   937297:	be 08 00 00 00       	mov    $0x8,%esi
371c   93729c:	e8 00 00 00 00       	call   9372a1 <shrink_lruvec+0x3721>	93729d: R_X86_64_PLT32	__kasan_check_write-0x4
3721   9372a1:	f0 80 4b fa 08       	lock orb $0x8,-0x6(%rbx)
3726   9372a6:	4c 89 ff             	mov    %r15,%rdi
3729   9372a9:	be 08 00 00 00       	mov    $0x8,%esi
372e   9372ae:	e8 00 00 00 00       	call   9372b3 <shrink_lruvec+0x3733>	9372af: R_X86_64_PLT32	__kasan_check_read-0x4
3733   9372b3:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3738   9372b8:	74 08                	je     9372c2 <shrink_lruvec+0x3742>
373a   9372ba:	4c 89 ff             	mov    %r15,%rdi
373d   9372bd:	e8 00 00 00 00       	call   9372c2 <shrink_lruvec+0x3742>	9372be: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3742   9372c2:	49 8b 1f             	mov    (%r15),%rbx
3745   9372c5:	be 00 00 10 00       	mov    $0x100000,%esi
374a   9372ca:	48 21 de             	and    %rbx,%rsi
374d   9372cd:	31 ff                	xor    %edi,%edi
374f   9372cf:	e8 00 00 00 00       	call   9372d4 <shrink_lruvec+0x3754>	9372d0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3754   9372d4:	b8 00 00 10 00       	mov    $0x100000,%eax
3759   9372d9:	48 21 c3             	and    %rax,%rbx
375c   9372dc:	75 5a                	jne    937338 <shrink_lruvec+0x37b8>
375e   9372de:	e8 00 00 00 00       	call   9372e3 <shrink_lruvec+0x3763>	9372df: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3763   9372e3:	4c 89 ff             	mov    %r15,%rdi
3766   9372e6:	be 08 00 00 00       	mov    $0x8,%esi
376b   9372eb:	e8 00 00 00 00       	call   9372f0 <shrink_lruvec+0x3770>	9372ec: R_X86_64_PLT32	__kasan_check_read-0x4
3770   9372f0:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3775   9372f5:	74 08                	je     9372ff <shrink_lruvec+0x377f>
3777   9372f7:	4c 89 ff             	mov    %r15,%rdi
377a   9372fa:	e8 00 00 00 00       	call   9372ff <shrink_lruvec+0x377f>	9372fb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
377f   9372ff:	49 8b 1f             	mov    (%r15),%rbx
3782   937302:	c1 eb 12             	shr    $0x12,%ebx
3785   937305:	83 e3 02             	and    $0x2,%ebx
3788   937308:	4c 89 ff             	mov    %r15,%rdi
378b   93730b:	be 08 00 00 00       	mov    $0x8,%esi
3790   937310:	e8 00 00 00 00       	call   937315 <shrink_lruvec+0x3795>	937311: R_X86_64_PLT32	__kasan_check_read-0x4
3795   937315:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
379a   93731a:	74 08                	je     937324 <shrink_lruvec+0x37a4>
379c   93731c:	4c 89 ff             	mov    %r15,%rdi
379f   93731f:	e8 00 00 00 00       	call   937324 <shrink_lruvec+0x37a4>	937320: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
37a4   937324:	4d 8b 37             	mov    (%r15),%r14
37a7   937327:	41 c1 ee 05          	shr    $0x5,%r14d
37ab   93732b:	41 83 e6 01          	and    $0x1,%r14d
37af   93732f:	41 09 de             	or     %ebx,%r14d
37b2   937332:	41 83 f6 02          	xor    $0x2,%r14d
37b6   937336:	eb 0b                	jmp    937343 <shrink_lruvec+0x37c3>
37b8   937338:	e8 00 00 00 00       	call   93733d <shrink_lruvec+0x37bd>	937339: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
37bd   93733d:	41 be 04 00 00 00    	mov    $0x4,%r14d
37c3   937343:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
37c8   937348:	4c 89 fe             	mov    %r15,%rsi
37cb   93734b:	ba 01 00 00 00       	mov    $0x1,%edx
37d0   937350:	e8 6b fb 00 00       	call   946ec0 <lru_gen_add_folio>
37d5   937355:	84 c0                	test   %al,%al
37d7   937357:	74 0a                	je     937363 <shrink_lruvec+0x37e3>
37d9   937359:	e8 00 00 00 00       	call   93735e <shrink_lruvec+0x37de>	93735a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
37de   93735e:	e9 65 f4 ff ff       	jmp    9367c8 <shrink_lruvec+0x2c48>
37e3   937363:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
37e8   937368:	74 08                	je     937372 <shrink_lruvec+0x37f2>
37ea   93736a:	4c 89 ff             	mov    %r15,%rdi
37ed   93736d:	e8 00 00 00 00       	call   937372 <shrink_lruvec+0x37f2>	93736e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
37f2   937372:	41 0f b6 47 07       	movzbl 0x7(%r15),%eax
37f7   937377:	89 44 24 20          	mov    %eax,0x20(%rsp)
37fb   93737b:	4c 89 ff             	mov    %r15,%rdi
37fe   93737e:	be 08 00 00 00       	mov    $0x8,%esi
3803   937383:	e8 00 00 00 00       	call   937388 <shrink_lruvec+0x3808>	937384: R_X86_64_PLT32	__kasan_check_read-0x4
3808   937388:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
380d   93738d:	74 08                	je     937397 <shrink_lruvec+0x3817>
380f   93738f:	4c 89 ff             	mov    %r15,%rdi
3812   937392:	e8 00 00 00 00       	call   937397 <shrink_lruvec+0x3817>	937393: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3817   937397:	49 8b 1f             	mov    (%r15),%rbx
381a   93739a:	be 00 00 01 00       	mov    $0x10000,%esi
381f   93739f:	48 21 de             	and    %rbx,%rsi
3822   9373a2:	31 ff                	xor    %edi,%edi
3824   9373a4:	e8 00 00 00 00       	call   9373a9 <shrink_lruvec+0x3829>	9373a5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3829   9373a9:	b8 00 00 01 00       	mov    $0x10000,%eax
382e   9373ae:	48 21 c3             	and    %rax,%rbx
3831   9373b1:	75 17                	jne    9373ca <shrink_lruvec+0x384a>
3833   9373b3:	e8 00 00 00 00       	call   9373b8 <shrink_lruvec+0x3838>	9373b4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3838   9373b8:	41 bf 01 00 00 00    	mov    $0x1,%r15d
383e   9373be:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
3843   9373c3:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
3848   9373c8:	eb 59                	jmp    937423 <shrink_lruvec+0x38a3>
384a   9373ca:	48 8b 84 24 00 01 00 00 	mov    0x100(%rsp),%rax
3852   9373d2:	42 8a 04 28          	mov    (%rax,%r13,1),%al
3856   9373d6:	84 c0                	test   %al,%al
3858   9373d8:	0f 85 7c 0e 00 00    	jne    93825a <shrink_lruvec+0x46da>
385e   9373de:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 9373e4 <shrink_lruvec+0x3864>	9373e0: R_X86_64_PC32	hugetlb_optimize_vmemmap_key-0x4
3864   9373e4:	31 ff                	xor    %edi,%edi
3866   9373e6:	89 de                	mov    %ebx,%esi
3868   9373e8:	e8 00 00 00 00       	call   9373ed <shrink_lruvec+0x386d>	9373e9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
386d   9373ed:	85 db                	test   %ebx,%ebx
386f   9373ef:	0f 8f 29 0c 00 00    	jg     93801e <shrink_lruvec+0x449e>
3875   9373f5:	e8 00 00 00 00       	call   9373fa <shrink_lruvec+0x387a>	9373f6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
387a   9373fa:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
387f   9373ff:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3884   937404:	48 8d 58 54          	lea    0x54(%rax),%rbx
3888   937408:	48 89 d8             	mov    %rbx,%rax
388b   93740b:	48 c1 e8 03          	shr    $0x3,%rax
388f   93740f:	42 8a 04 28          	mov    (%rax,%r13,1),%al
3893   937413:	84 c0                	test   %al,%al
3895   937415:	0f 85 65 0e 00 00    	jne    938280 <shrink_lruvec+0x4700>
389b   93741b:	44 8b 3b             	mov    (%rbx),%r15d
389e   93741e:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
38a3   937423:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
38ab   93742b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
38b0   937430:	74 08                	je     93743a <shrink_lruvec+0x38ba>
38b2   937432:	48 89 df             	mov    %rbx,%rdi
38b5   937435:	e8 00 00 00 00       	call   93743a <shrink_lruvec+0x38ba>	937436: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
38ba   93743a:	4c 8b 2b             	mov    (%rbx),%r13
38bd   93743d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
38c7   937447:	48 8b 8c 24 50 01 00 00 	mov    0x150(%rsp),%rcx
38cf   93744f:	8a 04 01             	mov    (%rcx,%rax,1),%al
38d2   937452:	84 c0                	test   %al,%al
38d4   937454:	0f 85 97 0d 00 00    	jne    9381f1 <shrink_lruvec+0x4671>
38da   93745a:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 937460 <shrink_lruvec+0x38e0>	93745c: R_X86_64_PC32	debug_locks-0x4
38e0   937460:	31 ff                	xor    %edi,%edi
38e2   937462:	89 de                	mov    %ebx,%esi
38e4   937464:	e8 00 00 00 00       	call   937469 <shrink_lruvec+0x38e9>	937465: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
38e9   937469:	85 db                	test   %ebx,%ebx
38eb   93746b:	74 7f                	je     9374ec <shrink_lruvec+0x396c>
38ed   93746d:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
38f5   937475:	be ff ff ff ff       	mov    $0xffffffff,%esi
38fa   93747a:	e8 00 00 00 00       	call   93747f <shrink_lruvec+0x38ff>	93747b: R_X86_64_PLT32	lock_is_held_type-0x4
38ff   93747f:	89 c3                	mov    %eax,%ebx
3901   937481:	31 ff                	xor    %edi,%edi
3903   937483:	89 c6                	mov    %eax,%esi
3905   937485:	e8 00 00 00 00       	call   93748a <shrink_lruvec+0x390a>	937486: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
390a   93748a:	85 db                	test   %ebx,%ebx
390c   93748c:	0f 84 7e 0b 00 00    	je     938010 <shrink_lruvec+0x4490>
3912   937492:	e8 00 00 00 00       	call   937497 <shrink_lruvec+0x3917>	937493: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3917   937497:	eb 58                	jmp    9374f1 <shrink_lruvec+0x3971>
3919   937499:	e8 00 00 00 00       	call   93749e <shrink_lruvec+0x391e>	93749a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
391e   93749e:	48 8b 84 24 40 01 00 00 	mov    0x140(%rsp),%rax
3926   9374a6:	42 8a 04 28          	mov    (%rax,%r13,1),%al
392a   9374aa:	84 c0                	test   %al,%al
392c   9374ac:	48 8b 94 24 98 00 00 00 	mov    0x98(%rsp),%rdx
3934   9374b4:	0f 85 76 0d 00 00    	jne    938230 <shrink_lruvec+0x46b0>
393a   9374ba:	0f b7 1a             	movzwl (%rdx),%ebx
393d   9374bd:	89 de                	mov    %ebx,%esi
393f   9374bf:	83 e6 20             	and    $0x20,%esi
3942   9374c2:	31 ff                	xor    %edi,%edi
3944   9374c4:	e8 00 00 00 00       	call   9374c9 <shrink_lruvec+0x3949>	9374c5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
3949   9374c9:	83 e3 20             	and    $0x20,%ebx
394c   9374cc:	0f 85 53 01 00 00    	jne    937625 <shrink_lruvec+0x3aa5>
3952   9374d2:	4c 89 ff             	mov    %r15,%rdi
3955   9374d5:	e8 00 00 00 00       	call   9374da <shrink_lruvec+0x395a>	9374d6: R_X86_64_PLT32	folio_mapped-0x4
395a   9374da:	84 c0                	test   %al,%al
395c   9374dc:	0f 84 54 01 00 00    	je     937636 <shrink_lruvec+0x3ab6>
3962   9374e2:	e8 00 00 00 00       	call   9374e7 <shrink_lruvec+0x3967>	9374e3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3967   9374e7:	e9 eb 05 00 00       	jmp    937ad7 <shrink_lruvec+0x3f57>
396c   9374ec:	e8 00 00 00 00       	call   9374f1 <shrink_lruvec+0x3971>	9374ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3971   9374f1:	41 83 e4 03          	and    $0x3,%r12d
3975   9374f5:	bf 00 00 00 80       	mov    $0x80000000,%edi
397a   9374fa:	4c 89 fe             	mov    %r15,%rsi
397d   9374fd:	e8 00 00 00 00       	call   937502 <shrink_lruvec+0x3982>	9374fe: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3982   937502:	b8 00 00 00 80       	mov    $0x80000000,%eax
3987   937507:	49 39 c7             	cmp    %rax,%r15
398a   93750a:	0f 83 a0 0a 00 00    	jae    937fb0 <shrink_lruvec+0x4430>
3990   937510:	e8 00 00 00 00       	call   937515 <shrink_lruvec+0x3995>	937511: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3995   937515:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
399a   93751a:	48 89 df             	mov    %rbx,%rdi
399d   93751d:	44 89 f6             	mov    %r14d,%esi
39a0   937520:	44 89 fa             	mov    %r15d,%edx
39a3   937523:	e8 00 00 00 00       	call   937528 <shrink_lruvec+0x39a8>	937524: R_X86_64_PLT32	__mod_lruvec_state-0x4
39a8   937528:	44 89 e0             	mov    %r12d,%eax
39ab   93752b:	48 69 c0 00 07 00 00 	imul   $0x700,%rax,%rax
39b2   937532:	49 01 c5             	add    %rax,%r13
39b5   937535:	41 8d 76 01          	lea    0x1(%r14),%esi
39b9   937539:	4c 89 ef             	mov    %r13,%rdi
39bc   93753c:	4c 89 fa             	mov    %r15,%rdx
39bf   93753f:	e8 00 00 00 00       	call   937544 <shrink_lruvec+0x39c4>	937540: R_X86_64_PLT32	__mod_zone_page_state-0x4
39c4   937544:	48 89 df             	mov    %rbx,%rdi
39c7   937547:	44 89 f6             	mov    %r14d,%esi
39ca   93754a:	44 89 e2             	mov    %r12d,%edx
39cd   93754d:	44 89 f9             	mov    %r15d,%ecx
39d0   937550:	e8 00 00 00 00       	call   937555 <shrink_lruvec+0x39d5>	937551: R_X86_64_PLT32	mem_cgroup_update_lru_size-0x4
39d5   937555:	44 89 f0             	mov    %r14d,%eax
39d8   937558:	48 c1 e0 04          	shl    $0x4,%rax
39dc   93755c:	4c 8d 34 03          	lea    (%rbx,%rax,1),%r14
39e0   937560:	4c 8d 24 03          	lea    (%rbx,%rax,1),%r12
39e4   937564:	49 83 c4 08          	add    $0x8,%r12
39e8   937568:	4c 89 e3             	mov    %r12,%rbx
39eb   93756b:	48 c1 eb 03          	shr    $0x3,%rbx
39ef   93756f:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
39f9   937579:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
39fe   93757e:	74 08                	je     937588 <shrink_lruvec+0x3a08>
3a00   937580:	4c 89 e7             	mov    %r12,%rdi
3a03   937583:	e8 00 00 00 00       	call   937588 <shrink_lruvec+0x3a08>	937584: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3a08   937588:	4d 8b 3c 24          	mov    (%r12),%r15
3a0c   93758c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
3a11   937591:	4c 89 fe             	mov    %r15,%rsi
3a14   937594:	4c 89 f2             	mov    %r14,%rdx
3a17   937597:	e8 00 00 00 00       	call   93759c <shrink_lruvec+0x3a1c>	937598: R_X86_64_PLT32	__list_add_valid-0x4
3a1c   93759c:	84 c0                	test   %al,%al
3a1e   93759e:	74 7b                	je     93761b <shrink_lruvec+0x3a9b>
3a20   9375a0:	e8 00 00 00 00       	call   9375a5 <shrink_lruvec+0x3a25>	9375a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3a25   9375a5:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
3a2a   9375aa:	74 08                	je     9375b4 <shrink_lruvec+0x3a34>
3a2c   9375ac:	4c 89 e7             	mov    %r12,%rdi
3a2f   9375af:	e8 00 00 00 00       	call   9375b4 <shrink_lruvec+0x3a34>	9375b0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3a34   9375b4:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
3a39   9375b9:	49 89 1c 24          	mov    %rbx,(%r12)
3a3d   9375bd:	48 89 d8             	mov    %rbx,%rax
3a40   9375c0:	48 c1 e8 03          	shr    $0x3,%rax
3a44   9375c4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3a49   9375c9:	74 08                	je     9375d3 <shrink_lruvec+0x3a53>
3a4b   9375cb:	48 89 df             	mov    %rbx,%rdi
3a4e   9375ce:	e8 00 00 00 00       	call   9375d3 <shrink_lruvec+0x3a53>	9375cf: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3a53   9375d3:	4c 89 33             	mov    %r14,(%rbx)
3a56   9375d6:	48 83 c3 08          	add    $0x8,%rbx
3a5a   9375da:	48 89 d8             	mov    %rbx,%rax
3a5d   9375dd:	48 c1 e8 03          	shr    $0x3,%rax
3a61   9375e1:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3a66   9375e6:	74 08                	je     9375f0 <shrink_lruvec+0x3a70>
3a68   9375e8:	48 89 df             	mov    %rbx,%rdi
3a6b   9375eb:	e8 00 00 00 00       	call   9375f0 <shrink_lruvec+0x3a70>	9375ec: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3a70   9375f0:	4c 89 3b             	mov    %r15,(%rbx)
3a73   9375f3:	4c 89 f8             	mov    %r15,%rax
3a76   9375f6:	48 c1 e8 03          	shr    $0x3,%rax
3a7a   9375fa:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3a7f   9375ff:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
3a84   937604:	74 08                	je     93760e <shrink_lruvec+0x3a8e>
3a86   937606:	4c 89 ff             	mov    %r15,%rdi
3a89   937609:	e8 00 00 00 00       	call   93760e <shrink_lruvec+0x3a8e>	93760a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3a8e   93760e:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
3a93   937613:	49 89 07             	mov    %rax,(%r15)
3a96   937616:	e9 d0 f8 ff ff       	jmp    936eeb <shrink_lruvec+0x336b>
3a9b   93761b:	e8 00 00 00 00       	call   937620 <shrink_lruvec+0x3aa0>	93761c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3aa0   937620:	e9 a3 f1 ff ff       	jmp    9367c8 <shrink_lruvec+0x2c48>
3aa5   937625:	e8 00 00 00 00       	call   93762a <shrink_lruvec+0x3aaa>	937626: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3aaa   93762a:	eb 0f                	jmp    93763b <shrink_lruvec+0x3abb>
3aac   93762c:	e8 00 00 00 00       	call   937631 <shrink_lruvec+0x3ab1>	93762d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3ab1   937631:	e9 8f f9 ff ff       	jmp    936fc5 <shrink_lruvec+0x3445>
3ab6   937636:	e8 00 00 00 00       	call   93763b <shrink_lruvec+0x3abb>	937637: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3abb   93763b:	48 8b 84 24 40 01 00 00 	mov    0x140(%rsp),%rax
3ac3   937643:	42 8a 04 28          	mov    (%rax,%r13,1),%al
3ac7   937647:	84 c0                	test   %al,%al
3ac9   937649:	48 8b 94 24 98 00 00 00 	mov    0x98(%rsp),%rdx
3ad1   937651:	0f 85 46 0c 00 00    	jne    93829d <shrink_lruvec+0x471d>
3ad7   937657:	0f b7 1a             	movzwl (%rdx),%ebx
3ada   93765a:	89 de                	mov    %ebx,%esi
3adc   93765c:	83 e6 10             	and    $0x10,%esi
3adf   93765f:	31 ff                	xor    %edi,%edi
3ae1   937661:	e8 00 00 00 00       	call   937666 <shrink_lruvec+0x3ae6>	937662: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
3ae6   937666:	83 e3 10             	and    $0x10,%ebx
3ae9   937669:	75 07                	jne    937672 <shrink_lruvec+0x3af2>
3aeb   93766b:	e8 00 00 00 00       	call   937670 <shrink_lruvec+0x3af0>	93766c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3af0   937670:	eb 33                	jmp    9376a5 <shrink_lruvec+0x3b25>
3af2   937672:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
3afa   93767a:	48 89 d8             	mov    %rbx,%rax
3afd   93767d:	48 c1 e8 03          	shr    $0x3,%rax
3b01   937681:	42 8a 04 28          	mov    (%rax,%r13,1),%al
3b05   937685:	84 c0                	test   %al,%al
3b07   937687:	0f 85 f9 0c 00 00    	jne    938386 <shrink_lruvec+0x4806>
3b0d   93768d:	8b 1b                	mov    (%rbx),%ebx
3b0f   93768f:	89 de                	mov    %ebx,%esi
3b11   937691:	83 e6 40             	and    $0x40,%esi
3b14   937694:	31 ff                	xor    %edi,%edi
3b16   937696:	e8 00 00 00 00       	call   93769b <shrink_lruvec+0x3b1b>	937697: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3b1b   93769b:	83 e3 40             	and    $0x40,%ebx
3b1e   93769e:	75 7e                	jne    93771e <shrink_lruvec+0x3b9e>
3b20   9376a0:	e8 00 00 00 00       	call   9376a5 <shrink_lruvec+0x3b25>	9376a1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3b25   9376a5:	4c 89 ff             	mov    %r15,%rdi
3b28   9376a8:	be 08 00 00 00       	mov    $0x8,%esi
3b2d   9376ad:	e8 00 00 00 00       	call   9376b2 <shrink_lruvec+0x3b32>	9376ae: R_X86_64_PLT32	__kasan_check_read-0x4
3b32   9376b2:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3b37   9376b7:	74 08                	je     9376c1 <shrink_lruvec+0x3b41>
3b39   9376b9:	4c 89 ff             	mov    %r15,%rdi
3b3c   9376bc:	e8 00 00 00 00       	call   9376c1 <shrink_lruvec+0x3b41>	9376bd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3b41   9376c1:	49 8b 1f             	mov    (%r15),%rbx
3b44   9376c4:	48 89 de             	mov    %rbx,%rsi
3b47   9376c7:	48 83 e6 08          	and    $0x8,%rsi
3b4b   9376cb:	31 ff                	xor    %edi,%edi
3b4d   9376cd:	e8 00 00 00 00       	call   9376d2 <shrink_lruvec+0x3b52>	9376ce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3b52   9376d2:	48 83 e3 08          	and    $0x8,%rbx
3b56   9376d6:	75 3c                	jne    937714 <shrink_lruvec+0x3b94>
3b58   9376d8:	49 8d 5e 10          	lea    0x10(%r14),%rbx
3b5c   9376dc:	48 89 d8             	mov    %rbx,%rax
3b5f   9376df:	48 c1 e8 03          	shr    $0x3,%rax
3b63   9376e3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3b68   9376e8:	74 08                	je     9376f2 <shrink_lruvec+0x3b72>
3b6a   9376ea:	48 89 df             	mov    %rbx,%rdi
3b6d   9376ed:	e8 00 00 00 00       	call   9376f2 <shrink_lruvec+0x3b72>	9376ee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3b72   9376f2:	48 8b 1b             	mov    (%rbx),%rbx
3b75   9376f5:	48 89 de             	mov    %rbx,%rsi
3b78   9376f8:	48 83 e6 01          	and    $0x1,%rsi
3b7c   9376fc:	31 ff                	xor    %edi,%edi
3b7e   9376fe:	e8 00 00 00 00       	call   937703 <shrink_lruvec+0x3b83>	9376ff: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3b83   937703:	48 83 e3 01          	and    $0x1,%rbx
3b87   937707:	0f 85 95 01 00 00    	jne    9378a2 <shrink_lruvec+0x3d22>
3b8d   93770d:	e8 00 00 00 00       	call   937712 <shrink_lruvec+0x3b92>	93770e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3b92   937712:	eb 0f                	jmp    937723 <shrink_lruvec+0x3ba3>
3b94   937714:	e8 00 00 00 00       	call   937719 <shrink_lruvec+0x3b99>	937715: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3b99   937719:	e9 b9 03 00 00       	jmp    937ad7 <shrink_lruvec+0x3f57>
3b9e   93771e:	e8 00 00 00 00       	call   937723 <shrink_lruvec+0x3ba3>	93771f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3ba3   937723:	49 8d 5e 2c          	lea    0x2c(%r14),%rbx
3ba7   937727:	48 89 df             	mov    %rbx,%rdi
3baa   93772a:	be 04 00 00 00       	mov    $0x4,%esi
3baf   93772f:	e8 00 00 00 00       	call   937734 <shrink_lruvec+0x3bb4>	937730: R_X86_64_PLT32	__kasan_check_write-0x4
3bb4   937734:	48 89 d8             	mov    %rbx,%rax
3bb7   937737:	48 c1 e8 03          	shr    $0x3,%rax
3bbb   93773b:	42 8a 04 28          	mov    (%rax,%r13,1),%al
3bbf   93773f:	84 c0                	test   %al,%al
3bc1   937741:	0f 85 5c 0c 00 00    	jne    9383a3 <shrink_lruvec+0x4823>
3bc7   937747:	44 8b 2b             	mov    (%rbx),%r13d
3bca   93774a:	31 ff                	xor    %edi,%edi
3bcc   93774c:	44 89 ee             	mov    %r13d,%esi
3bcf   93774f:	e8 00 00 00 00       	call   937754 <shrink_lruvec+0x3bd4>	937750: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3bd4   937754:	45 85 ed             	test   %r13d,%r13d
3bd7   937757:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
3bdc   93775c:	0f 84 76 09 00 00    	je     9380d8 <shrink_lruvec+0x4558>
3be2   937762:	41 8d 4d 01          	lea    0x1(%r13),%ecx
3be6   937766:	31 f6                	xor    %esi,%esi
3be8   937768:	44 89 e8             	mov    %r13d,%eax
3beb   93776b:	f0 0f b1 0b          	lock cmpxchg %ecx,(%rbx)
3bef   93776f:	89 c3                	mov    %eax,%ebx
3bf1   937771:	41 0f 95 c6          	setne  %r14b
3bf5   937775:	40 0f 94 c6          	sete   %sil
3bf9   937779:	31 ff                	xor    %edi,%edi
3bfb   93777b:	e8 00 00 00 00       	call   937780 <shrink_lruvec+0x3c00>	93777c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
3c00   937780:	45 84 f6             	test   %r14b,%r14b
3c03   937783:	74 17                	je     93779c <shrink_lruvec+0x3c1c>
3c05   937785:	85 db                	test   %ebx,%ebx
3c07   937787:	0f 84 7f 0c 00 00    	je     93840c <shrink_lruvec+0x488c>
3c0d   93778d:	e8 00 00 00 00       	call   937792 <shrink_lruvec+0x3c12>	93778e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c12   937792:	41 89 dd             	mov    %ebx,%r13d
3c15   937795:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
3c1a   93779a:	eb c6                	jmp    937762 <shrink_lruvec+0x3be2>
3c1c   93779c:	e8 00 00 00 00       	call   9377a1 <shrink_lruvec+0x3c21>	93779d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c21   9377a1:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3c26   9377a6:	31 ff                	xor    %edi,%edi
3c28   9377a8:	44 89 ee             	mov    %r13d,%esi
3c2b   9377ab:	e8 00 00 00 00       	call   9377b0 <shrink_lruvec+0x3c30>	9377ac: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3c30   9377b0:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
3c3a   9377ba:	48 8b 8c 24 f8 01 00 00 	mov    0x1f8(%rsp),%rcx
3c42   9377c2:	8a 04 01             	mov    (%rcx,%rax,1),%al
3c45   9377c5:	84 c0                	test   %al,%al
3c47   9377c7:	0f 85 f3 0b 00 00    	jne    9383c0 <shrink_lruvec+0x4840>
3c4d   9377cd:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 9377d3 <shrink_lruvec+0x3c53>	9377cf: R_X86_64_PC32	__tracepoint_page_ref_mod_unless+0x4
3c53   9377d3:	31 ff                	xor    %edi,%edi
3c55   9377d5:	89 de                	mov    %ebx,%esi
3c57   9377d7:	e8 00 00 00 00       	call   9377dc <shrink_lruvec+0x3c5c>	9377d8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3c5c   9377dc:	85 db                	test   %ebx,%ebx
3c5e   9377de:	0f 8e c8 00 00 00    	jle    9378ac <shrink_lruvec+0x3d2c>
3c64   9377e4:	31 db                	xor    %ebx,%ebx
3c66   9377e6:	45 85 ed             	test   %r13d,%r13d
3c69   9377e9:	0f 95 c3             	setne  %bl
3c6c   9377ec:	e8 00 00 00 00       	call   9377f1 <shrink_lruvec+0x3c71>	9377ed: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3c71   9377f1:	4c 89 ff             	mov    %r15,%rdi
3c74   9377f4:	be 01 00 00 00       	mov    $0x1,%esi
3c79   9377f9:	89 da                	mov    %ebx,%edx
3c7b   9377fb:	e8 00 00 00 00       	call   937800 <shrink_lruvec+0x3c80>	9377fc: R_X86_64_PLT32	__page_ref_mod_unless-0x4
3c80   937800:	45 85 ed             	test   %r13d,%r13d
3c83   937803:	0f 84 b1 00 00 00    	je     9378ba <shrink_lruvec+0x3d3a>
3c89   937809:	4c 89 ff             	mov    %r15,%rdi
3c8c   93780c:	be 08 00 00 00       	mov    $0x8,%esi
3c91   937811:	e8 00 00 00 00       	call   937816 <shrink_lruvec+0x3c96>	937812: R_X86_64_PLT32	__kasan_check_write-0x4
3c96   937816:	31 f6                	xor    %esi,%esi
3c98   937818:	f0 49 0f ba 37 04    	lock btrq $0x4,(%r15)
3c9e   93781e:	0f 92 c3             	setb   %bl
3ca1   937821:	40 0f 92 c6          	setb   %sil
3ca5   937825:	31 ff                	xor    %edi,%edi
3ca7   937827:	e8 00 00 00 00       	call   93782c <shrink_lruvec+0x3cac>	937828: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
3cac   93782c:	84 db                	test   %bl,%bl
3cae   93782e:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
3cb8   937838:	0f 85 90 00 00 00    	jne    9378ce <shrink_lruvec+0x3d4e>
3cbe   93783e:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
3cc3   937843:	48 89 df             	mov    %rbx,%rdi
3cc6   937846:	be 04 00 00 00       	mov    $0x4,%esi
3ccb   93784b:	e8 00 00 00 00       	call   937850 <shrink_lruvec+0x3cd0>	93784c: R_X86_64_PLT32	__kasan_check_write-0x4
3cd0   937850:	45 31 e4             	xor    %r12d,%r12d
3cd3   937853:	f0 ff 0b             	lock decl (%rbx)
3cd6   937856:	41 0f 94 c6          	sete   %r14b
3cda   93785a:	48 8b 84 24 f0 01 00 00 	mov    0x1f0(%rsp),%rax
3ce2   937862:	42 8a 04 28          	mov    (%rax,%r13,1),%al
3ce6   937866:	84 c0                	test   %al,%al
3ce8   937868:	0f 85 78 0b 00 00    	jne    9383e6 <shrink_lruvec+0x4866>
3cee   93786e:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 937874 <shrink_lruvec+0x3cf4>	937870: R_X86_64_PC32	__tracepoint_page_ref_mod_and_test+0x4
3cf4   937874:	31 ff                	xor    %edi,%edi
3cf6   937876:	89 de                	mov    %ebx,%esi
3cf8   937878:	e8 00 00 00 00       	call   93787d <shrink_lruvec+0x3cfd>	937879: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
3cfd   93787d:	45 88 f4             	mov    %r14b,%r12b
3d00   937880:	85 db                	test   %ebx,%ebx
3d02   937882:	0f 8e 22 02 00 00    	jle    937aaa <shrink_lruvec+0x3f2a>
3d08   937888:	e8 00 00 00 00       	call   93788d <shrink_lruvec+0x3d0d>	937889: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d0d   93788d:	4c 89 ff             	mov    %r15,%rdi
3d10   937890:	be ff ff ff ff       	mov    $0xffffffff,%esi
3d15   937895:	44 89 e2             	mov    %r12d,%edx
3d18   937898:	e8 00 00 00 00       	call   93789d <shrink_lruvec+0x3d1d>	937899: R_X86_64_PLT32	__page_ref_mod_and_test-0x4
3d1d   93789d:	e9 0d 02 00 00       	jmp    937aaf <shrink_lruvec+0x3f2f>
3d22   9378a2:	e8 00 00 00 00       	call   9378a7 <shrink_lruvec+0x3d27>	9378a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d27   9378a7:	e9 2b 02 00 00       	jmp    937ad7 <shrink_lruvec+0x3f57>
3d2c   9378ac:	e8 00 00 00 00       	call   9378b1 <shrink_lruvec+0x3d31>	9378ad: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d31   9378b1:	45 85 ed             	test   %r13d,%r13d
3d34   9378b4:	0f 85 4f ff ff ff    	jne    937809 <shrink_lruvec+0x3c89>
3d3a   9378ba:	e8 00 00 00 00       	call   9378bf <shrink_lruvec+0x3d3f>	9378bb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3d3f   9378bf:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
3d49   9378c9:	e9 09 02 00 00       	jmp    937ad7 <shrink_lruvec+0x3f57>
3d4e   9378ce:	4c 89 ff             	mov    %r15,%rdi
3d51   9378d1:	be 08 00 00 00       	mov    $0x8,%esi
3d56   9378d6:	e8 00 00 00 00       	call   9378db <shrink_lruvec+0x3d5b>	9378d7: R_X86_64_PLT32	__kasan_check_read-0x4
3d5b   9378db:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3d60   9378e0:	74 08                	je     9378ea <shrink_lruvec+0x3d6a>
3d62   9378e2:	4c 89 ff             	mov    %r15,%rdi
3d65   9378e5:	e8 00 00 00 00       	call   9378ea <shrink_lruvec+0x3d6a>	9378e6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3d6a   9378ea:	49 8b 1f             	mov    (%r15),%rbx
3d6d   9378ed:	48 89 de             	mov    %rbx,%rsi
3d70   9378f0:	48 83 e6 02          	and    $0x2,%rsi
3d74   9378f4:	31 ff                	xor    %edi,%edi
3d76   9378f6:	e8 00 00 00 00       	call   9378fb <shrink_lruvec+0x3d7b>	9378f7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3d7b   9378fb:	48 83 e3 02          	and    $0x2,%rbx
3d7f   9378ff:	75 4a                	jne    93794b <shrink_lruvec+0x3dcb>
3d81   937901:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3d86   937906:	74 08                	je     937910 <shrink_lruvec+0x3d90>
3d88   937908:	4c 89 ff             	mov    %r15,%rdi
3d8b   93790b:	e8 00 00 00 00       	call   937910 <shrink_lruvec+0x3d90>	93790c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3d90   937910:	4d 8b 37             	mov    (%r15),%r14
3d93   937913:	4c 89 f3             	mov    %r14,%rbx
3d96   937916:	48 b8 bd ff ff ff 9f ff ff ff 	movabs $0xffffff9fffffffbd,%rax
3da0   937920:	48 21 c3             	and    %rax,%rbx
3da3   937923:	4c 89 ff             	mov    %r15,%rdi
3da6   937926:	be 08 00 00 00       	mov    $0x8,%esi
3dab   93792b:	e8 00 00 00 00       	call   937930 <shrink_lruvec+0x3db0>	93792c: R_X86_64_PLT32	__kasan_check_write-0x4
3db0   937930:	4c 89 f0             	mov    %r14,%rax
3db3   937933:	f0 49 0f b1 1f       	lock cmpxchg %rbx,(%r15)
3db8   937938:	4c 39 f0             	cmp    %r14,%rax
3dbb   93793b:	74 15                	je     937952 <shrink_lruvec+0x3dd2>
3dbd   93793d:	e8 00 00 00 00       	call   937942 <shrink_lruvec+0x3dc2>	93793e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3dc2   937942:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3dc7   937947:	75 bf                	jne    937908 <shrink_lruvec+0x3d88>
3dc9   937949:	eb c5                	jmp    937910 <shrink_lruvec+0x3d90>
3dcb   93794b:	e8 00 00 00 00       	call   937950 <shrink_lruvec+0x3dd0>	93794c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3dd0   937950:	eb 0a                	jmp    93795c <shrink_lruvec+0x3ddc>
3dd2   937952:	e8 00 00 00 00       	call   937957 <shrink_lruvec+0x3dd7>	937953: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3dd7   937957:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3ddc   93795c:	4c 89 ff             	mov    %r15,%rdi
3ddf   93795f:	be 08 00 00 00       	mov    $0x8,%esi
3de4   937964:	e8 00 00 00 00       	call   937969 <shrink_lruvec+0x3de9>	937965: R_X86_64_PLT32	__kasan_check_write-0x4
3de9   937969:	f0 41 80 66 fa fb    	lock andb $0xfb,-0x6(%r14)
3def   93796f:	4c 89 ff             	mov    %r15,%rdi
3df2   937972:	be 08 00 00 00       	mov    $0x8,%esi
3df7   937977:	e8 00 00 00 00       	call   93797c <shrink_lruvec+0x3dfc>	937978: R_X86_64_PLT32	__kasan_check_write-0x4
3dfc   93797c:	f0 41 80 66 f8 fd    	lock andb $0xfd,-0x8(%r14)
3e02   937982:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3e07   937987:	74 08                	je     937991 <shrink_lruvec+0x3e11>
3e09   937989:	4c 89 ff             	mov    %r15,%rdi
3e0c   93798c:	e8 00 00 00 00       	call   937991 <shrink_lruvec+0x3e11>	93798d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e11   937991:	49 8b 1f             	mov    (%r15),%rbx
3e14   937994:	49 be 00 00 00 00 80 03 00 00 	movabs $0x38000000000,%r14
3e1e   93799e:	4c 89 f6             	mov    %r14,%rsi
3e21   9379a1:	48 21 de             	and    %rbx,%rsi
3e24   9379a4:	31 ff                	xor    %edi,%edi
3e26   9379a6:	e8 00 00 00 00       	call   9379ab <shrink_lruvec+0x3e2b>	9379a7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
3e2b   9379ab:	4c 21 f3             	and    %r14,%rbx
3e2e   9379ae:	0f 84 90 02 00 00    	je     937c44 <shrink_lruvec+0x40c4>
3e34   9379b4:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3e39   9379b9:	74 08                	je     9379c3 <shrink_lruvec+0x3e43>
3e3b   9379bb:	4c 89 ff             	mov    %r15,%rdi
3e3e   9379be:	e8 00 00 00 00       	call   9379c3 <shrink_lruvec+0x3e43>	9379bf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3e43   9379c3:	49 8b 1f             	mov    (%r15),%rbx
3e46   9379c6:	49 89 de             	mov    %rbx,%r14
3e49   9379c9:	48 b8 ff ff ff ff 7f fc ff ff 	movabs $0xfffffc7fffffffff,%rax
3e53   9379d3:	49 21 c6             	and    %rax,%r14
3e56   9379d6:	4c 89 ff             	mov    %r15,%rdi
3e59   9379d9:	be 08 00 00 00       	mov    $0x8,%esi
3e5e   9379de:	e8 00 00 00 00       	call   9379e3 <shrink_lruvec+0x3e63>	9379df: R_X86_64_PLT32	__kasan_check_write-0x4
3e63   9379e3:	48 89 d8             	mov    %rbx,%rax
3e66   9379e6:	f0 4d 0f b1 37       	lock cmpxchg %r14,(%r15)
3e6b   9379eb:	48 39 d8             	cmp    %rbx,%rax
3e6e   9379ee:	74 0e                	je     9379fe <shrink_lruvec+0x3e7e>
3e70   9379f0:	e8 00 00 00 00       	call   9379f5 <shrink_lruvec+0x3e75>	9379f1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3e75   9379f5:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
3e7a   9379fa:	75 bf                	jne    9379bb <shrink_lruvec+0x3e3b>
3e7c   9379fc:	eb c5                	jmp    9379c3 <shrink_lruvec+0x3e43>
3e7e   9379fe:	48 c1 eb 27          	shr    $0x27,%rbx
3e82   937a02:	83 e3 07             	and    $0x7,%ebx
3e85   937a05:	83 c3 ff             	add    $0xffffffff,%ebx
3e88   937a08:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
3e8d   937a0d:	4c 89 fe             	mov    %r15,%rsi
3e90   937a10:	89 da                	mov    %ebx,%edx
3e92   937a12:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
3e97   937a17:	e8 a4 79 ff ff       	call   92f3c0 <lru_gen_update_size>
3e9c   937a1c:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
3ea1   937a21:	48 89 df             	mov    %rbx,%rdi
3ea4   937a24:	e8 00 00 00 00       	call   937a29 <shrink_lruvec+0x3ea9>	937a25: R_X86_64_PLT32	__list_del_entry_valid-0x4
3ea9   937a29:	84 c0                	test   %al,%al
3eab   937a2b:	0f 84 1a 02 00 00    	je     937c4b <shrink_lruvec+0x40cb>
3eb1   937a31:	e8 00 00 00 00       	call   937a36 <shrink_lruvec+0x3eb6>	937a32: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3eb6   937a36:	48 8d 7b 08          	lea    0x8(%rbx),%rdi
3eba   937a3a:	48 89 f8             	mov    %rdi,%rax
3ebd   937a3d:	48 c1 e8 03          	shr    $0x3,%rax
3ec1   937a41:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3ec6   937a46:	74 05                	je     937a4d <shrink_lruvec+0x3ecd>
3ec8   937a48:	e8 00 00 00 00       	call   937a4d <shrink_lruvec+0x3ecd>	937a49: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ecd   937a4d:	4c 8b 73 08          	mov    0x8(%rbx),%r14
3ed1   937a51:	48 89 d8             	mov    %rbx,%rax
3ed4   937a54:	48 c1 e8 03          	shr    $0x3,%rax
3ed8   937a58:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3edd   937a5d:	74 08                	je     937a67 <shrink_lruvec+0x3ee7>
3edf   937a5f:	48 89 df             	mov    %rbx,%rdi
3ee2   937a62:	e8 00 00 00 00       	call   937a67 <shrink_lruvec+0x3ee7>	937a63: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ee7   937a67:	4c 8b 3b             	mov    (%rbx),%r15
3eea   937a6a:	49 8d 5f 08          	lea    0x8(%r15),%rbx
3eee   937a6e:	48 89 d8             	mov    %rbx,%rax
3ef1   937a71:	48 c1 e8 03          	shr    $0x3,%rax
3ef5   937a75:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3efa   937a7a:	74 08                	je     937a84 <shrink_lruvec+0x3f04>
3efc   937a7c:	48 89 df             	mov    %rbx,%rdi
3eff   937a7f:	e8 00 00 00 00       	call   937a84 <shrink_lruvec+0x3f04>	937a80: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3f04   937a84:	4c 89 33             	mov    %r14,(%rbx)
3f07   937a87:	4c 89 f0             	mov    %r14,%rax
3f0a   937a8a:	48 c1 e8 03          	shr    $0x3,%rax
3f0e   937a8e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f13   937a93:	74 08                	je     937a9d <shrink_lruvec+0x3f1d>
3f15   937a95:	4c 89 f7             	mov    %r14,%rdi
3f18   937a98:	e8 00 00 00 00       	call   937a9d <shrink_lruvec+0x3f1d>	937a99: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3f1d   937a9d:	4d 89 3e             	mov    %r15,(%r14)
3f20   937aa0:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
3f25   937aa5:	e9 a6 01 00 00       	jmp    937c50 <shrink_lruvec+0x40d0>
3f2a   937aaa:	e8 00 00 00 00       	call   937aaf <shrink_lruvec+0x3f2f>	937aab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3f2f   937aaf:	4c 8b 74 24 10       	mov    0x10(%rsp),%r14
3f34   937ab4:	31 ff                	xor    %edi,%edi
3f36   937ab6:	44 89 e6             	mov    %r12d,%esi
3f39   937ab9:	e8 00 00 00 00       	call   937abe <shrink_lruvec+0x3f3e>	937aba: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
3f3e   937abe:	45 84 e4             	test   %r12b,%r12b
3f41   937ac1:	75 07                	jne    937aca <shrink_lruvec+0x3f4a>
3f43   937ac3:	e8 00 00 00 00       	call   937ac8 <shrink_lruvec+0x3f48>	937ac4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3f48   937ac8:	eb 0d                	jmp    937ad7 <shrink_lruvec+0x3f57>
3f4a   937aca:	e8 00 00 00 00       	call   937acf <shrink_lruvec+0x3f4f>	937acb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3f4f   937acf:	4c 89 ff             	mov    %r15,%rdi
3f52   937ad2:	e8 00 00 00 00       	call   937ad7 <shrink_lruvec+0x3f57>	937ad3: R_X86_64_PLT32	__folio_put-0x4
3f57   937ad7:	4c 89 f7             	mov    %r14,%rdi
3f5a   937ada:	e8 00 00 00 00       	call   937adf <shrink_lruvec+0x3f5f>	937adb: R_X86_64_PLT32	__list_del_entry_valid-0x4
3f5f   937adf:	84 c0                	test   %al,%al
3f61   937ae1:	74 74                	je     937b57 <shrink_lruvec+0x3fd7>
3f63   937ae3:	e8 00 00 00 00       	call   937ae8 <shrink_lruvec+0x3f68>	937ae4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3f68   937ae8:	49 8d 7e 08          	lea    0x8(%r14),%rdi
3f6c   937aec:	48 89 f8             	mov    %rdi,%rax
3f6f   937aef:	48 c1 e8 03          	shr    $0x3,%rax
3f73   937af3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f78   937af8:	74 05                	je     937aff <shrink_lruvec+0x3f7f>
3f7a   937afa:	e8 00 00 00 00       	call   937aff <shrink_lruvec+0x3f7f>	937afb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3f7f   937aff:	4c 89 f3             	mov    %r14,%rbx
3f82   937b02:	4d 8b 76 08          	mov    0x8(%r14),%r14
3f86   937b06:	48 89 d8             	mov    %rbx,%rax
3f89   937b09:	48 c1 e8 03          	shr    $0x3,%rax
3f8d   937b0d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3f92   937b12:	74 08                	je     937b1c <shrink_lruvec+0x3f9c>
3f94   937b14:	48 89 df             	mov    %rbx,%rdi
3f97   937b17:	e8 00 00 00 00       	call   937b1c <shrink_lruvec+0x3f9c>	937b18: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3f9c   937b1c:	4c 8b 3b             	mov    (%rbx),%r15
3f9f   937b1f:	49 8d 5f 08          	lea    0x8(%r15),%rbx
3fa3   937b23:	48 89 d8             	mov    %rbx,%rax
3fa6   937b26:	48 c1 e8 03          	shr    $0x3,%rax
3faa   937b2a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3faf   937b2f:	74 08                	je     937b39 <shrink_lruvec+0x3fb9>
3fb1   937b31:	48 89 df             	mov    %rbx,%rdi
3fb4   937b34:	e8 00 00 00 00       	call   937b39 <shrink_lruvec+0x3fb9>	937b35: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3fb9   937b39:	4c 89 33             	mov    %r14,(%rbx)
3fbc   937b3c:	4c 89 f0             	mov    %r14,%rax
3fbf   937b3f:	48 c1 e8 03          	shr    $0x3,%rax
3fc3   937b43:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3fc8   937b48:	74 08                	je     937b52 <shrink_lruvec+0x3fd2>
3fca   937b4a:	4c 89 f7             	mov    %r14,%rdi
3fcd   937b4d:	e8 00 00 00 00       	call   937b52 <shrink_lruvec+0x3fd2>	937b4e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
3fd2   937b52:	4d 89 3e             	mov    %r15,(%r14)
3fd5   937b55:	eb 05                	jmp    937b5c <shrink_lruvec+0x3fdc>
3fd7   937b57:	e8 00 00 00 00       	call   937b5c <shrink_lruvec+0x3fdc>	937b58: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
3fdc   937b5c:	48 8b 84 24 b0 01 00 00 	mov    0x1b0(%rsp),%rax
3fe4   937b64:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
3fe9   937b69:	48 8d b4 24 90 03 00 00 	lea    0x390(%rsp),%rsi
3ff1   937b71:	74 10                	je     937b83 <shrink_lruvec+0x4003>
3ff3   937b73:	48 89 f7             	mov    %rsi,%rdi
3ff6   937b76:	e8 00 00 00 00       	call   937b7b <shrink_lruvec+0x3ffb>	937b77: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
3ffb   937b7b:	48 8d b4 24 90 03 00 00 	lea    0x390(%rsp),%rsi
4003   937b83:	4c 8b b4 24 90 03 00 00 	mov    0x390(%rsp),%r14
400b   937b8b:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
4010   937b90:	4c 89 f2             	mov    %r14,%rdx
4013   937b93:	e8 00 00 00 00       	call   937b98 <shrink_lruvec+0x4018>	937b94: R_X86_64_PLT32	__list_add_valid-0x4
4018   937b98:	84 c0                	test   %al,%al
401a   937b9a:	0f 84 8d 00 00 00    	je     937c2d <shrink_lruvec+0x40ad>
4020   937ba0:	e8 00 00 00 00       	call   937ba5 <shrink_lruvec+0x4025>	937ba1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4025   937ba5:	4d 8d 7e 08          	lea    0x8(%r14),%r15
4029   937ba9:	4c 89 f8             	mov    %r15,%rax
402c   937bac:	48 c1 e8 03          	shr    $0x3,%rax
4030   937bb0:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4035   937bb5:	74 08                	je     937bbf <shrink_lruvec+0x403f>
4037   937bb7:	4c 89 ff             	mov    %r15,%rdi
403a   937bba:	e8 00 00 00 00       	call   937bbf <shrink_lruvec+0x403f>	937bbb: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
403f   937bbf:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
4044   937bc4:	49 89 1f             	mov    %rbx,(%r15)
4047   937bc7:	48 89 d8             	mov    %rbx,%rax
404a   937bca:	48 c1 e8 03          	shr    $0x3,%rax
404e   937bce:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4053   937bd3:	74 08                	je     937bdd <shrink_lruvec+0x405d>
4055   937bd5:	48 89 df             	mov    %rbx,%rdi
4058   937bd8:	e8 00 00 00 00       	call   937bdd <shrink_lruvec+0x405d>	937bd9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
405d   937bdd:	4c 89 33             	mov    %r14,(%rbx)
4060   937be0:	48 83 c3 08          	add    $0x8,%rbx
4064   937be4:	48 89 d8             	mov    %rbx,%rax
4067   937be7:	48 c1 e8 03          	shr    $0x3,%rax
406b   937beb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4070   937bf0:	74 08                	je     937bfa <shrink_lruvec+0x407a>
4072   937bf2:	48 89 df             	mov    %rbx,%rdi
4075   937bf5:	e8 00 00 00 00       	call   937bfa <shrink_lruvec+0x407a>	937bf6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
407a   937bfa:	48 8d bc 24 90 03 00 00 	lea    0x390(%rsp),%rdi
4082   937c02:	48 89 3b             	mov    %rdi,(%rbx)
4085   937c05:	48 8b 84 24 b0 01 00 00 	mov    0x1b0(%rsp),%rax
408d   937c0d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4092   937c12:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
4097   937c17:	74 05                	je     937c1e <shrink_lruvec+0x409e>
4099   937c19:	e8 00 00 00 00       	call   937c1e <shrink_lruvec+0x409e>	937c1a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
409e   937c1e:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
40a3   937c23:	48 89 84 24 90 03 00 00 	mov    %rax,0x390(%rsp)
40ab   937c2b:	eb 0a                	jmp    937c37 <shrink_lruvec+0x40b7>
40ad   937c2d:	e8 00 00 00 00       	call   937c32 <shrink_lruvec+0x40b2>	937c2e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40b2   937c32:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
40b7   937c37:	8b 44 24 28          	mov    0x28(%rsp),%eax
40bb   937c3b:	01 44 24 38          	add    %eax,0x38(%rsp)
40bf   937c3f:	e9 82 f5 ff ff       	jmp    9371c6 <shrink_lruvec+0x3646>
40c4   937c44:	e8 00 00 00 00       	call   937c49 <shrink_lruvec+0x40c9>	937c45: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40c9   937c49:	eb 53                	jmp    937c9e <shrink_lruvec+0x411e>
40cb   937c4b:	e8 00 00 00 00       	call   937c50 <shrink_lruvec+0x40d0>	937c4c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
40d0   937c50:	48 89 d8             	mov    %rbx,%rax
40d3   937c53:	48 c1 e8 03          	shr    $0x3,%rax
40d7   937c57:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
40dc   937c5c:	74 08                	je     937c66 <shrink_lruvec+0x40e6>
40de   937c5e:	48 89 df             	mov    %rbx,%rdi
40e1   937c61:	e8 00 00 00 00       	call   937c66 <shrink_lruvec+0x40e6>	937c62: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
40e6   937c66:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
40f0   937c70:	48 89 03             	mov    %rax,(%rbx)
40f3   937c73:	48 83 c3 08          	add    $0x8,%rbx
40f7   937c77:	48 89 d8             	mov    %rbx,%rax
40fa   937c7a:	48 c1 e8 03          	shr    $0x3,%rax
40fe   937c7e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4103   937c83:	74 08                	je     937c8d <shrink_lruvec+0x410d>
4105   937c85:	48 89 df             	mov    %rbx,%rdi
4108   937c88:	e8 00 00 00 00       	call   937c8d <shrink_lruvec+0x410d>	937c89: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
410d   937c8d:	48 b8 00 01 00 00 00 00 ad de 	movabs $0xdead000000000100,%rax
4117   937c97:	48 83 c0 22          	add    $0x22,%rax
411b   937c9b:	48 89 03             	mov    %rax,(%rbx)
411e   937c9e:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
4126   937ca6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
412b   937cab:	48 8d b4 24 d0 03 00 00 	lea    0x3d0(%rsp),%rsi
4133   937cb3:	74 10                	je     937cc5 <shrink_lruvec+0x4145>
4135   937cb5:	48 89 f7             	mov    %rsi,%rdi
4138   937cb8:	e8 00 00 00 00       	call   937cbd <shrink_lruvec+0x413d>	937cb9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
413d   937cbd:	48 8d b4 24 d0 03 00 00 	lea    0x3d0(%rsp),%rsi
4145   937cc5:	4c 8b b4 24 d0 03 00 00 	mov    0x3d0(%rsp),%r14
414d   937ccd:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
4152   937cd2:	4c 89 f2             	mov    %r14,%rdx
4155   937cd5:	e8 00 00 00 00       	call   937cda <shrink_lruvec+0x415a>	937cd6: R_X86_64_PLT32	__list_add_valid-0x4
415a   937cda:	84 c0                	test   %al,%al
415c   937cdc:	0f 84 98 00 00 00    	je     937d7a <shrink_lruvec+0x41fa>
4162   937ce2:	e8 00 00 00 00       	call   937ce7 <shrink_lruvec+0x4167>	937ce3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4167   937ce7:	4d 8d 7e 08          	lea    0x8(%r14),%r15
416b   937ceb:	4c 89 f8             	mov    %r15,%rax
416e   937cee:	48 c1 e8 03          	shr    $0x3,%rax
4172   937cf2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4177   937cf7:	74 08                	je     937d01 <shrink_lruvec+0x4181>
4179   937cf9:	4c 89 ff             	mov    %r15,%rdi
417c   937cfc:	e8 00 00 00 00       	call   937d01 <shrink_lruvec+0x4181>	937cfd: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4181   937d01:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
4186   937d06:	49 89 1f             	mov    %rbx,(%r15)
4189   937d09:	48 89 d8             	mov    %rbx,%rax
418c   937d0c:	48 c1 e8 03          	shr    $0x3,%rax
4190   937d10:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4195   937d15:	74 08                	je     937d1f <shrink_lruvec+0x419f>
4197   937d17:	48 89 df             	mov    %rbx,%rdi
419a   937d1a:	e8 00 00 00 00       	call   937d1f <shrink_lruvec+0x419f>	937d1b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
419f   937d1f:	4c 89 33             	mov    %r14,(%rbx)
41a2   937d22:	48 83 c3 08          	add    $0x8,%rbx
41a6   937d26:	48 89 d8             	mov    %rbx,%rax
41a9   937d29:	48 c1 e8 03          	shr    $0x3,%rax
41ad   937d2d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
41b2   937d32:	74 08                	je     937d3c <shrink_lruvec+0x41bc>
41b4   937d34:	48 89 df             	mov    %rbx,%rdi
41b7   937d37:	e8 00 00 00 00       	call   937d3c <shrink_lruvec+0x41bc>	937d38: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
41bc   937d3c:	48 8d bc 24 d0 03 00 00 	lea    0x3d0(%rsp),%rdi
41c4   937d44:	48 89 3b             	mov    %rdi,(%rbx)
41c7   937d47:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
41cf   937d4f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
41d4   937d54:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
41d9   937d59:	74 05                	je     937d60 <shrink_lruvec+0x41e0>
41db   937d5b:	e8 00 00 00 00       	call   937d60 <shrink_lruvec+0x41e0>	937d5c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
41e0   937d60:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
41e5   937d65:	48 89 84 24 d0 03 00 00 	mov    %rax,0x3d0(%rsp)
41ed   937d6d:	8b 44 24 28          	mov    0x28(%rsp),%eax
41f1   937d71:	01 44 24 40          	add    %eax,0x40(%rsp)
41f5   937d75:	e9 4c f4 ff ff       	jmp    9371c6 <shrink_lruvec+0x3646>
41fa   937d7a:	e8 00 00 00 00       	call   937d7f <shrink_lruvec+0x41ff>	937d7b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
41ff   937d7f:	8b 44 24 28          	mov    0x28(%rsp),%eax
4203   937d83:	01 44 24 40          	add    %eax,0x40(%rsp)
4207   937d87:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
420c   937d8c:	e9 35 f4 ff ff       	jmp    9371c6 <shrink_lruvec+0x3646>
4211   937d91:	4c 89 fe             	mov    %r15,%rsi
4214   937d94:	48 81 e6 ff 0f 00 00 	and    $0xfff,%rsi
421b   937d9b:	31 ff                	xor    %edi,%edi
421d   937d9d:	e8 00 00 00 00       	call   937da2 <shrink_lruvec+0x4222>	937d9e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4222   937da2:	4c 89 f8             	mov    %r15,%rax
4225   937da5:	48 25 ff 0f 00 00    	and    $0xfff,%rax
422b   937dab:	74 3e                	je     937deb <shrink_lruvec+0x426b>
422d   937dad:	e8 00 00 00 00       	call   937db2 <shrink_lruvec+0x4232>	937dae: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4232   937db2:	e9 71 e3 ff ff       	jmp    936128 <shrink_lruvec+0x25a8>
4237   937db7:	4c 89 fe             	mov    %r15,%rsi
423a   937dba:	48 81 e6 ff 0f 00 00 	and    $0xfff,%rsi
4241   937dc1:	31 ff                	xor    %edi,%edi
4243   937dc3:	e8 00 00 00 00       	call   937dc8 <shrink_lruvec+0x4248>	937dc4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4248   937dc8:	4c 89 f8             	mov    %r15,%rax
424b   937dcb:	48 25 ff 0f 00 00    	and    $0xfff,%rax
4251   937dd1:	74 5e                	je     937e31 <shrink_lruvec+0x42b1>
4253   937dd3:	e8 00 00 00 00       	call   937dd8 <shrink_lruvec+0x4258>	937dd4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4258   937dd8:	e9 b1 e3 ff ff       	jmp    93618e <shrink_lruvec+0x260e>
425d   937ddd:	e8 00 00 00 00       	call   937de2 <shrink_lruvec+0x4262>	937dde: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4262   937de2:	90                   	nop
4263   937de3:	0f 0b                	ud2
4265   937de5:	90                   	nop
4266   937de6:	e9 68 ed ff ff       	jmp    936b53 <shrink_lruvec+0x2fd3>
426b   937deb:	4c 89 ff             	mov    %r15,%rdi
426e   937dee:	be 08 00 00 00       	mov    $0x8,%esi
4273   937df3:	e8 00 00 00 00       	call   937df8 <shrink_lruvec+0x4278>	937df4: R_X86_64_PLT32	__kasan_check_read-0x4
4278   937df8:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
427d   937dfd:	74 08                	je     937e07 <shrink_lruvec+0x4287>
427f   937dff:	4c 89 ff             	mov    %r15,%rdi
4282   937e02:	e8 00 00 00 00       	call   937e07 <shrink_lruvec+0x4287>	937e03: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4287   937e07:	49 8b 1f             	mov    (%r15),%rbx
428a   937e0a:	be 00 00 01 00       	mov    $0x10000,%esi
428f   937e0f:	48 21 de             	and    %rbx,%rsi
4292   937e12:	31 ff                	xor    %edi,%edi
4294   937e14:	e8 00 00 00 00       	call   937e19 <shrink_lruvec+0x4299>	937e15: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4299   937e19:	b8 00 00 01 00       	mov    $0x10000,%eax
429e   937e1e:	48 21 c3             	and    %rax,%rbx
42a1   937e21:	0f 85 92 00 00 00    	jne    937eb9 <shrink_lruvec+0x4339>
42a7   937e27:	e8 00 00 00 00       	call   937e2c <shrink_lruvec+0x42ac>	937e28: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
42ac   937e2c:	e9 f7 e2 ff ff       	jmp    936128 <shrink_lruvec+0x25a8>
42b1   937e31:	4c 89 ff             	mov    %r15,%rdi
42b4   937e34:	be 08 00 00 00       	mov    $0x8,%esi
42b9   937e39:	e8 00 00 00 00       	call   937e3e <shrink_lruvec+0x42be>	937e3a: R_X86_64_PLT32	__kasan_check_read-0x4
42be   937e3e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
42c8   937e48:	41 80 3c 04 00       	cmpb   $0x0,(%r12,%rax,1)
42cd   937e4d:	74 08                	je     937e57 <shrink_lruvec+0x42d7>
42cf   937e4f:	4c 89 ff             	mov    %r15,%rdi
42d2   937e52:	e8 00 00 00 00       	call   937e57 <shrink_lruvec+0x42d7>	937e53: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
42d7   937e57:	49 8b 1f             	mov    (%r15),%rbx
42da   937e5a:	be 00 00 01 00       	mov    $0x10000,%esi
42df   937e5f:	48 21 de             	and    %rbx,%rsi
42e2   937e62:	31 ff                	xor    %edi,%edi
42e4   937e64:	e8 00 00 00 00       	call   937e69 <shrink_lruvec+0x42e9>	937e65: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
42e9   937e69:	b8 00 00 01 00       	mov    $0x10000,%eax
42ee   937e6e:	48 21 c3             	and    %rax,%rbx
42f1   937e71:	0f 85 89 00 00 00    	jne    937f00 <shrink_lruvec+0x4380>
42f7   937e77:	e8 00 00 00 00       	call   937e7c <shrink_lruvec+0x42fc>	937e78: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
42fc   937e7c:	e9 0d e3 ff ff       	jmp    93618e <shrink_lruvec+0x260e>
4301   937e81:	e8 00 00 00 00       	call   937e86 <shrink_lruvec+0x4306>	937e82: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4306   937e86:	90                   	nop
4307   937e87:	0f 0b                	ud2
4309   937e89:	90                   	nop
430a   937e8a:	e9 a0 ec ff ff       	jmp    936b2f <shrink_lruvec+0x2faf>
430f   937e8f:	4c 89 fe             	mov    %r15,%rsi
4312   937e92:	48 81 e6 ff 0f 00 00 	and    $0xfff,%rsi
4319   937e99:	31 ff                	xor    %edi,%edi
431b   937e9b:	e8 00 00 00 00       	call   937ea0 <shrink_lruvec+0x4320>	937e9c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4320   937ea0:	4c 89 f8             	mov    %r15,%rax
4323   937ea3:	48 25 ff 0f 00 00    	and    $0xfff,%rax
4329   937ea9:	0f 84 ba 00 00 00    	je     937f69 <shrink_lruvec+0x43e9>
432f   937eaf:	e8 00 00 00 00       	call   937eb4 <shrink_lruvec+0x4334>	937eb0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4334   937eb4:	e9 0d ea ff ff       	jmp    9368c6 <shrink_lruvec+0x2d46>
4339   937eb9:	49 8d 5e 40          	lea    0x40(%r14),%rbx
433d   937ebd:	48 89 d8             	mov    %rbx,%rax
4340   937ec0:	48 c1 e8 03          	shr    $0x3,%rax
4344   937ec4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4349   937ec9:	74 08                	je     937ed3 <shrink_lruvec+0x4353>
434b   937ecb:	48 89 df             	mov    %rbx,%rdi
434e   937ece:	e8 00 00 00 00       	call   937ed3 <shrink_lruvec+0x4353>	937ecf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4353   937ed3:	48 8b 1b             	mov    (%rbx),%rbx
4356   937ed6:	48 89 de             	mov    %rbx,%rsi
4359   937ed9:	48 83 e6 01          	and    $0x1,%rsi
435d   937edd:	31 ff                	xor    %edi,%edi
435f   937edf:	e8 00 00 00 00       	call   937ee4 <shrink_lruvec+0x4364>	937ee0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4364   937ee4:	48 89 d8             	mov    %rbx,%rax
4367   937ee7:	48 83 e0 01          	and    $0x1,%rax
436b   937eeb:	74 68                	je     937f55 <shrink_lruvec+0x43d5>
436d   937eed:	48 83 c3 ff          	add    $0xffffffffffffffff,%rbx
4371   937ef1:	4c 39 fb             	cmp    %r15,%rbx
4374   937ef4:	74 5f                	je     937f55 <shrink_lruvec+0x43d5>
4376   937ef6:	e8 00 00 00 00       	call   937efb <shrink_lruvec+0x437b>	937ef7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
437b   937efb:	e9 5f e1 ff ff       	jmp    93605f <shrink_lruvec+0x24df>
4380   937f00:	49 8d 5e 40          	lea    0x40(%r14),%rbx
4384   937f04:	48 89 d8             	mov    %rbx,%rax
4387   937f07:	48 c1 e8 03          	shr    $0x3,%rax
438b   937f0b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4395   937f15:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4399   937f19:	74 08                	je     937f23 <shrink_lruvec+0x43a3>
439b   937f1b:	48 89 df             	mov    %rbx,%rdi
439e   937f1e:	e8 00 00 00 00       	call   937f23 <shrink_lruvec+0x43a3>	937f1f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
43a3   937f23:	48 8b 1b             	mov    (%rbx),%rbx
43a6   937f26:	48 89 de             	mov    %rbx,%rsi
43a9   937f29:	48 83 e6 01          	and    $0x1,%rsi
43ad   937f2d:	31 ff                	xor    %edi,%edi
43af   937f2f:	e8 00 00 00 00       	call   937f34 <shrink_lruvec+0x43b4>	937f30: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
43b4   937f34:	48 89 d8             	mov    %rbx,%rax
43b7   937f37:	48 83 e0 01          	and    $0x1,%rax
43bb   937f3b:	74 22                	je     937f5f <shrink_lruvec+0x43df>
43bd   937f3d:	48 83 c3 ff          	add    $0xffffffffffffffff,%rbx
43c1   937f41:	4c 39 fb             	cmp    %r15,%rbx
43c4   937f44:	74 19                	je     937f5f <shrink_lruvec+0x43df>
43c6   937f46:	e8 00 00 00 00       	call   937f4b <shrink_lruvec+0x43cb>	937f47: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
43cb   937f4b:	b8 01 00 00 00       	mov    $0x1,%eax
43d0   937f50:	e9 5b e2 ff ff       	jmp    9361b0 <shrink_lruvec+0x2630>
43d5   937f55:	e8 00 00 00 00       	call   937f5a <shrink_lruvec+0x43da>	937f56: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
43da   937f5a:	e9 c9 e1 ff ff       	jmp    936128 <shrink_lruvec+0x25a8>
43df   937f5f:	e8 00 00 00 00       	call   937f64 <shrink_lruvec+0x43e4>	937f60: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
43e4   937f64:	e9 25 e2 ff ff       	jmp    93618e <shrink_lruvec+0x260e>
43e9   937f69:	4c 89 ff             	mov    %r15,%rdi
43ec   937f6c:	be 08 00 00 00       	mov    $0x8,%esi
43f1   937f71:	e8 00 00 00 00       	call   937f76 <shrink_lruvec+0x43f6>	937f72: R_X86_64_PLT32	__kasan_check_read-0x4
43f6   937f76:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
43fb   937f7b:	74 08                	je     937f85 <shrink_lruvec+0x4405>
43fd   937f7d:	4c 89 ff             	mov    %r15,%rdi
4400   937f80:	e8 00 00 00 00       	call   937f85 <shrink_lruvec+0x4405>	937f81: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4405   937f85:	49 8b 1f             	mov    (%r15),%rbx
4408   937f88:	be 00 00 01 00       	mov    $0x10000,%esi
440d   937f8d:	48 21 de             	and    %rbx,%rsi
4410   937f90:	31 ff                	xor    %edi,%edi
4412   937f92:	e8 00 00 00 00       	call   937f97 <shrink_lruvec+0x4417>	937f93: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4417   937f97:	b8 00 00 01 00       	mov    $0x10000,%eax
441c   937f9c:	48 21 c3             	and    %rax,%rbx
441f   937f9f:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
4424   937fa4:	75 18                	jne    937fbe <shrink_lruvec+0x443e>
4426   937fa6:	e8 00 00 00 00       	call   937fab <shrink_lruvec+0x442b>	937fa7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
442b   937fab:	e9 1b e9 ff ff       	jmp    9368cb <shrink_lruvec+0x2d4b>
4430   937fb0:	e8 00 00 00 00       	call   937fb5 <shrink_lruvec+0x4435>	937fb1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4435   937fb5:	90                   	nop
4436   937fb6:	0f 0b                	ud2
4438   937fb8:	90                   	nop
4439   937fb9:	e9 57 f5 ff ff       	jmp    937515 <shrink_lruvec+0x3995>
443e   937fbe:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
4443   937fc3:	48 8d 58 40          	lea    0x40(%rax),%rbx
4447   937fc7:	48 89 d8             	mov    %rbx,%rax
444a   937fca:	48 c1 e8 03          	shr    $0x3,%rax
444e   937fce:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4453   937fd3:	74 08                	je     937fdd <shrink_lruvec+0x445d>
4455   937fd5:	48 89 df             	mov    %rbx,%rdi
4458   937fd8:	e8 00 00 00 00       	call   937fdd <shrink_lruvec+0x445d>	937fd9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
445d   937fdd:	48 8b 1b             	mov    (%rbx),%rbx
4460   937fe0:	48 89 de             	mov    %rbx,%rsi
4463   937fe3:	48 83 e6 01          	and    $0x1,%rsi
4467   937fe7:	31 ff                	xor    %edi,%edi
4469   937fe9:	e8 00 00 00 00       	call   937fee <shrink_lruvec+0x446e>	937fea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
446e   937fee:	48 89 d8             	mov    %rbx,%rax
4471   937ff1:	48 83 e0 01          	and    $0x1,%rax
4475   937ff5:	74 51                	je     938048 <shrink_lruvec+0x44c8>
4477   937ff7:	48 83 c3 ff          	add    $0xffffffffffffffff,%rbx
447b   937ffb:	4c 39 fb             	cmp    %r15,%rbx
447e   937ffe:	74 48                	je     938048 <shrink_lruvec+0x44c8>
4480   938000:	e8 00 00 00 00       	call   938005 <shrink_lruvec+0x4485>	938001: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4485   938005:	41 bf 01 00 00 00    	mov    $0x1,%r15d
448b   93800b:	e9 da e8 ff ff       	jmp    9368ea <shrink_lruvec+0x2d6a>
4490   938010:	e8 00 00 00 00       	call   938015 <shrink_lruvec+0x4495>	938011: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4495   938015:	90                   	nop
4496   938016:	0f 0b                	ud2
4498   938018:	90                   	nop
4499   938019:	e9 d3 f4 ff ff       	jmp    9374f1 <shrink_lruvec+0x3971>
449e   93801e:	4c 89 fe             	mov    %r15,%rsi
44a1   938021:	48 81 e6 ff 0f 00 00 	and    $0xfff,%rsi
44a8   938028:	31 ff                	xor    %edi,%edi
44aa   93802a:	e8 00 00 00 00       	call   93802f <shrink_lruvec+0x44af>	93802b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
44af   93802f:	4c 89 f8             	mov    %r15,%rax
44b2   938032:	48 25 ff 0f 00 00    	and    $0xfff,%rax
44b8   938038:	0f 84 a7 00 00 00    	je     9380e5 <shrink_lruvec+0x4565>
44be   93803e:	e8 00 00 00 00       	call   938043 <shrink_lruvec+0x44c3>	93803f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
44c3   938043:	e9 b2 f3 ff ff       	jmp    9373fa <shrink_lruvec+0x387a>
44c8   938048:	e8 00 00 00 00       	call   93804d <shrink_lruvec+0x44cd>	938049: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
44cd   93804d:	e9 79 e8 ff ff       	jmp    9368cb <shrink_lruvec+0x2d4b>
44d2   938052:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	938055: R_X86_64_32S	hugetlb_optimize_vmemmap_key
44d9   938059:	80 e1 07             	and    $0x7,%cl
44dc   93805c:	80 c1 03             	add    $0x3,%cl
44df   93805f:	38 c1                	cmp    %al,%cl
44e1   938061:	0f 8c a5 e0 ff ff    	jl     93610c <shrink_lruvec+0x258c>
44e7   938067:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93806a: R_X86_64_32S	hugetlb_optimize_vmemmap_key
44ee   93806e:	e8 00 00 00 00       	call   938073 <shrink_lruvec+0x44f3>	93806f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
44f3   938073:	e9 94 e0 ff ff       	jmp    93610c <shrink_lruvec+0x258c>
44f8   938078:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93807b: R_X86_64_32S	hugetlb_optimize_vmemmap_key
44ff   93807f:	80 e1 07             	and    $0x7,%cl
4502   938082:	80 c1 03             	add    $0x3,%cl
4505   938085:	38 c1                	cmp    %al,%cl
4507   938087:	0f 8c e5 e0 ff ff    	jl     936172 <shrink_lruvec+0x25f2>
450d   93808d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	938090: R_X86_64_32S	hugetlb_optimize_vmemmap_key
4514   938094:	e8 00 00 00 00       	call   938099 <shrink_lruvec+0x4519>	938095: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4519   938099:	e9 d4 e0 ff ff       	jmp    936172 <shrink_lruvec+0x25f2>
451e   93809e:	89 d9                	mov    %ebx,%ecx
4520   9380a0:	80 e1 07             	and    $0x7,%cl
4523   9380a3:	80 c1 03             	add    $0x3,%cl
4526   9380a6:	38 c1                	cmp    %al,%cl
4528   9380a8:	0f 8c 91 e0 ff ff    	jl     93613f <shrink_lruvec+0x25bf>
452e   9380ae:	48 89 df             	mov    %rbx,%rdi
4531   9380b1:	e8 00 00 00 00       	call   9380b6 <shrink_lruvec+0x4536>	9380b2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4536   9380b6:	e9 84 e0 ff ff       	jmp    93613f <shrink_lruvec+0x25bf>
453b   9380bb:	89 d9                	mov    %ebx,%ecx
453d   9380bd:	80 e1 07             	and    $0x7,%cl
4540   9380c0:	80 c1 03             	add    $0x3,%cl
4543   9380c3:	38 c1                	cmp    %al,%cl
4545   9380c5:	0f 8c e3 e0 ff ff    	jl     9361ae <shrink_lruvec+0x262e>
454b   9380cb:	48 89 df             	mov    %rbx,%rdi
454e   9380ce:	e8 00 00 00 00       	call   9380d3 <shrink_lruvec+0x4553>	9380cf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4553   9380d3:	e9 d6 e0 ff ff       	jmp    9361ae <shrink_lruvec+0x262e>
4558   9380d8:	e8 00 00 00 00       	call   9380dd <shrink_lruvec+0x455d>	9380d9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
455d   9380dd:	45 31 ed             	xor    %r13d,%r13d
4560   9380e0:	e9 c1 f6 ff ff       	jmp    9377a6 <shrink_lruvec+0x3c26>
4565   9380e5:	4c 89 ff             	mov    %r15,%rdi
4568   9380e8:	be 08 00 00 00       	mov    $0x8,%esi
456d   9380ed:	e8 00 00 00 00       	call   9380f2 <shrink_lruvec+0x4572>	9380ee: R_X86_64_PLT32	__kasan_check_read-0x4
4572   9380f2:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
4577   9380f7:	74 08                	je     938101 <shrink_lruvec+0x4581>
4579   9380f9:	4c 89 ff             	mov    %r15,%rdi
457c   9380fc:	e8 00 00 00 00       	call   938101 <shrink_lruvec+0x4581>	9380fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4581   938101:	49 8b 1f             	mov    (%r15),%rbx
4584   938104:	be 00 00 01 00       	mov    $0x10000,%esi
4589   938109:	48 21 de             	and    %rbx,%rsi
458c   93810c:	31 ff                	xor    %edi,%edi
458e   93810e:	e8 00 00 00 00       	call   938113 <shrink_lruvec+0x4593>	93810f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4593   938113:	b8 00 00 01 00       	mov    $0x10000,%eax
4598   938118:	48 21 c3             	and    %rax,%rbx
459b   93811b:	44 8b 64 24 20       	mov    0x20(%rsp),%r12d
45a0   938120:	75 30                	jne    938152 <shrink_lruvec+0x45d2>
45a2   938122:	e8 00 00 00 00       	call   938127 <shrink_lruvec+0x45a7>	938123: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
45a7   938127:	e9 d3 f2 ff ff       	jmp    9373ff <shrink_lruvec+0x387f>
45ac   93812c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93812f: R_X86_64_32S	debug_locks
45b3   938133:	80 e1 07             	and    $0x7,%cl
45b6   938136:	80 c1 03             	add    $0x3,%cl
45b9   938139:	38 c1                	cmp    %al,%cl
45bb   93813b:	0f 8c e5 e7 ff ff    	jl     936926 <shrink_lruvec+0x2da6>
45c1   938141:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	938144: R_X86_64_32S	debug_locks
45c8   938148:	e8 00 00 00 00       	call   93814d <shrink_lruvec+0x45cd>	938149: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
45cd   93814d:	e9 d4 e7 ff ff       	jmp    936926 <shrink_lruvec+0x2da6>
45d2   938152:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
45d7   938157:	48 8d 58 40          	lea    0x40(%rax),%rbx
45db   93815b:	48 89 d8             	mov    %rbx,%rax
45de   93815e:	48 c1 e8 03          	shr    $0x3,%rax
45e2   938162:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
45e7   938167:	74 08                	je     938171 <shrink_lruvec+0x45f1>
45e9   938169:	48 89 df             	mov    %rbx,%rdi
45ec   93816c:	e8 00 00 00 00       	call   938171 <shrink_lruvec+0x45f1>	93816d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
45f1   938171:	48 8b 1b             	mov    (%rbx),%rbx
45f4   938174:	48 89 de             	mov    %rbx,%rsi
45f7   938177:	48 83 e6 01          	and    $0x1,%rsi
45fb   93817b:	31 ff                	xor    %edi,%edi
45fd   93817d:	e8 00 00 00 00       	call   938182 <shrink_lruvec+0x4602>	93817e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4602   938182:	48 89 d8             	mov    %rbx,%rax
4605   938185:	48 83 e0 01          	and    $0x1,%rax
4609   938189:	74 5c                	je     9381e7 <shrink_lruvec+0x4667>
460b   93818b:	48 83 c3 ff          	add    $0xffffffffffffffff,%rbx
460f   93818f:	4c 39 fb             	cmp    %r15,%rbx
4612   938192:	74 53                	je     9381e7 <shrink_lruvec+0x4667>
4614   938194:	e8 00 00 00 00       	call   938199 <shrink_lruvec+0x4619>	938195: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4619   938199:	41 bf 01 00 00 00    	mov    $0x1,%r15d
461f   93819f:	e9 7a f2 ff ff       	jmp    93741e <shrink_lruvec+0x389e>
4624   9381a4:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9381a7: R_X86_64_32S	hugetlb_optimize_vmemmap_key
462b   9381ab:	80 e1 07             	and    $0x7,%cl
462e   9381ae:	80 c1 03             	add    $0x3,%cl
4631   9381b1:	38 c1                	cmp    %al,%cl
4633   9381b3:	0f 8c f1 e6 ff ff    	jl     9368aa <shrink_lruvec+0x2d2a>
4639   9381b9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9381bc: R_X86_64_32S	hugetlb_optimize_vmemmap_key
4640   9381c0:	e8 00 00 00 00       	call   9381c5 <shrink_lruvec+0x4645>	9381c1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4645   9381c5:	e9 e0 e6 ff ff       	jmp    9368aa <shrink_lruvec+0x2d2a>
464a   9381ca:	89 d9                	mov    %ebx,%ecx
464c   9381cc:	80 e1 07             	and    $0x7,%cl
464f   9381cf:	80 c1 03             	add    $0x3,%cl
4652   9381d2:	38 c1                	cmp    %al,%cl
4654   9381d4:	0f 8c 0d e7 ff ff    	jl     9368e7 <shrink_lruvec+0x2d67>
465a   9381da:	48 89 df             	mov    %rbx,%rdi
465d   9381dd:	e8 00 00 00 00       	call   9381e2 <shrink_lruvec+0x4662>	9381de: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4662   9381e2:	e9 00 e7 ff ff       	jmp    9368e7 <shrink_lruvec+0x2d67>
4667   9381e7:	e8 00 00 00 00       	call   9381ec <shrink_lruvec+0x466c>	9381e8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
466c   9381ec:	e9 0e f2 ff ff       	jmp    9373ff <shrink_lruvec+0x387f>
4671   9381f1:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9381f4: R_X86_64_32S	debug_locks
4678   9381f8:	80 e1 07             	and    $0x7,%cl
467b   9381fb:	80 c1 03             	add    $0x3,%cl
467e   9381fe:	38 c1                	cmp    %al,%cl
4680   938200:	0f 8c 54 f2 ff ff    	jl     93745a <shrink_lruvec+0x38da>
4686   938206:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	938209: R_X86_64_32S	debug_locks
468d   93820d:	e8 00 00 00 00       	call   938212 <shrink_lruvec+0x4692>	93820e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4692   938212:	e9 43 f2 ff ff       	jmp    93745a <shrink_lruvec+0x38da>
4697   938217:	e8 00 00 00 00       	call   93821c <shrink_lruvec+0x469c>	938218: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
469c   93821c:	44 89 ee             	mov    %r13d,%esi
469f   93821f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	938222: R_X86_64_32S	.data+0x58f8e0
46a6   938226:	e8 00 00 00 00       	call   93822b <shrink_lruvec+0x46ab>	938227: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
46ab   93822b:	e9 94 e3 ff ff       	jmp    9365c4 <shrink_lruvec+0x2a44>
46b0   938230:	89 d1                	mov    %edx,%ecx
46b2   938232:	80 e1 07             	and    $0x7,%cl
46b5   938235:	80 c1 01             	add    $0x1,%cl
46b8   938238:	38 c1                	cmp    %al,%cl
46ba   93823a:	0f 8c 7a f2 ff ff    	jl     9374ba <shrink_lruvec+0x393a>
46c0   938240:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
46c8   938248:	e8 00 00 00 00       	call   93824d <shrink_lruvec+0x46cd>	938249: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
46cd   93824d:	48 8b 94 24 98 00 00 00 	mov    0x98(%rsp),%rdx
46d5   938255:	e9 60 f2 ff ff       	jmp    9374ba <shrink_lruvec+0x393a>
46da   93825a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93825d: R_X86_64_32S	hugetlb_optimize_vmemmap_key
46e1   938261:	80 e1 07             	and    $0x7,%cl
46e4   938264:	80 c1 03             	add    $0x3,%cl
46e7   938267:	38 c1                	cmp    %al,%cl
46e9   938269:	0f 8c 6f f1 ff ff    	jl     9373de <shrink_lruvec+0x385e>
46ef   93826f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	938272: R_X86_64_32S	hugetlb_optimize_vmemmap_key
46f6   938276:	e8 00 00 00 00       	call   93827b <shrink_lruvec+0x46fb>	938277: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
46fb   93827b:	e9 5e f1 ff ff       	jmp    9373de <shrink_lruvec+0x385e>
4700   938280:	89 d9                	mov    %ebx,%ecx
4702   938282:	80 e1 07             	and    $0x7,%cl
4705   938285:	80 c1 03             	add    $0x3,%cl
4708   938288:	38 c1                	cmp    %al,%cl
470a   93828a:	0f 8c 8b f1 ff ff    	jl     93741b <shrink_lruvec+0x389b>
4710   938290:	48 89 df             	mov    %rbx,%rdi
4713   938293:	e8 00 00 00 00       	call   938298 <shrink_lruvec+0x4718>	938294: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4718   938298:	e9 7e f1 ff ff       	jmp    93741b <shrink_lruvec+0x389b>
471d   93829d:	89 d1                	mov    %edx,%ecx
471f   93829f:	80 e1 07             	and    $0x7,%cl
4722   9382a2:	80 c1 01             	add    $0x1,%cl
4725   9382a5:	38 c1                	cmp    %al,%cl
4727   9382a7:	0f 8c aa f3 ff ff    	jl     937657 <shrink_lruvec+0x3ad7>
472d   9382ad:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
4735   9382b5:	e8 00 00 00 00       	call   9382ba <shrink_lruvec+0x473a>	9382b6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
473a   9382ba:	48 8b 94 24 98 00 00 00 	mov    0x98(%rsp),%rdx
4742   9382c2:	e9 90 f3 ff ff       	jmp    937657 <shrink_lruvec+0x3ad7>
4747   9382c7:	e8 00 00 00 00       	call   9382cc <shrink_lruvec+0x474c>	9382c8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
474c   9382cc:	89 de                	mov    %ebx,%esi
474e   9382ce:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9382d1: R_X86_64_32S	.data+0x58f900
4755   9382d5:	e8 00 00 00 00       	call   9382da <shrink_lruvec+0x475a>	9382d6: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
475a   9382da:	e9 cc e1 ff ff       	jmp    9364ab <shrink_lruvec+0x292b>
475f   9382df:	45 89 f7             	mov    %r14d,%r15d
4762   9382e2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9382e5: R_X86_64_32S	.data+0x58f920
4769   9382e9:	4c 89 fe             	mov    %r15,%rsi
476c   9382ec:	e8 00 00 00 00       	call   9382f1 <shrink_lruvec+0x4771>	9382ed: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
4771   9382f1:	4b 8d 04 64          	lea    (%r12,%r12,2),%rax
4775   9382f5:	48 c1 e0 04          	shl    $0x4,%rax
4779   9382f9:	48 03 44 24 18       	add    0x18(%rsp),%rax
477e   9382fe:	48 8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%rcx
4786   938306:	48 8d 04 c8          	lea    (%rax,%rcx,8),%rax
478a   93830a:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
478e   93830e:	48 81 c3 a0 03 00 00 	add    $0x3a0,%rbx
4795   938315:	48 89 d8             	mov    %rbx,%rax
4798   938318:	48 c1 e8 03          	shr    $0x3,%rax
479c   93831c:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
47a6   938326:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
47ab   93832b:	74 08                	je     938335 <shrink_lruvec+0x47b5>
47ad   93832d:	48 89 df             	mov    %rbx,%rdi
47b0   938330:	e8 00 00 00 00       	call   938335 <shrink_lruvec+0x47b5>	938331: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
47b5   938335:	4c 63 a4 24 a8 00 00 00 	movslq 0xa8(%rsp),%r12
47bd   93833d:	4c 03 23             	add    (%rbx),%r12
47c0   938340:	bf 03 00 00 00       	mov    $0x3,%edi
47c5   938345:	44 89 f6             	mov    %r14d,%esi
47c8   938348:	e8 00 00 00 00       	call   93834d <shrink_lruvec+0x47cd>	938349: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
47cd   93834d:	41 83 fe 03          	cmp    $0x3,%r14d
47d1   938351:	0f 85 c2 00 00 00    	jne    938419 <shrink_lruvec+0x4899>
47d7   938357:	e8 00 00 00 00       	call   93835c <shrink_lruvec+0x47dc>	938358: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
47dc   93835c:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
47e1   938361:	4c 8b bc 24 a8 00 00 00 	mov    0xa8(%rsp),%r15
47e9   938369:	e9 50 eb ff ff       	jmp    936ebe <shrink_lruvec+0x333e>
47ee   93836e:	e8 00 00 00 00       	call   938373 <shrink_lruvec+0x47f3>	93836f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
47f3   938373:	89 de                	mov    %ebx,%esi
47f5   938375:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	938378: R_X86_64_32S	.data+0x58f960
47fc   93837c:	e8 00 00 00 00       	call   938381 <shrink_lruvec+0x4801>	93837d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
4801   938381:	e9 6d ec ff ff       	jmp    936ff3 <shrink_lruvec+0x3473>
4806   938386:	89 d9                	mov    %ebx,%ecx
4808   938388:	80 e1 07             	and    $0x7,%cl
480b   93838b:	80 c1 03             	add    $0x3,%cl
480e   93838e:	38 c1                	cmp    %al,%cl
4810   938390:	0f 8c f7 f2 ff ff    	jl     93768d <shrink_lruvec+0x3b0d>
4816   938396:	48 89 df             	mov    %rbx,%rdi
4819   938399:	e8 00 00 00 00       	call   93839e <shrink_lruvec+0x481e>	93839a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
481e   93839e:	e9 ea f2 ff ff       	jmp    93768d <shrink_lruvec+0x3b0d>
4823   9383a3:	89 d9                	mov    %ebx,%ecx
4825   9383a5:	80 e1 07             	and    $0x7,%cl
4828   9383a8:	80 c1 03             	add    $0x3,%cl
482b   9383ab:	38 c1                	cmp    %al,%cl
482d   9383ad:	0f 8c 94 f3 ff ff    	jl     937747 <shrink_lruvec+0x3bc7>
4833   9383b3:	48 89 df             	mov    %rbx,%rdi
4836   9383b6:	e8 00 00 00 00       	call   9383bb <shrink_lruvec+0x483b>	9383b7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
483b   9383bb:	e9 87 f3 ff ff       	jmp    937747 <shrink_lruvec+0x3bc7>
4840   9383c0:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9383c3: R_X86_64_32S	__tracepoint_page_ref_mod_unless+0x8
4847   9383c7:	80 e1 07             	and    $0x7,%cl
484a   9383ca:	80 c1 03             	add    $0x3,%cl
484d   9383cd:	38 c1                	cmp    %al,%cl
484f   9383cf:	0f 8c f8 f3 ff ff    	jl     9377cd <shrink_lruvec+0x3c4d>
4855   9383d5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9383d8: R_X86_64_32S	__tracepoint_page_ref_mod_unless+0x8
485c   9383dc:	e8 00 00 00 00       	call   9383e1 <shrink_lruvec+0x4861>	9383dd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4861   9383e1:	e9 e7 f3 ff ff       	jmp    9377cd <shrink_lruvec+0x3c4d>
4866   9383e6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9383e9: R_X86_64_32S	__tracepoint_page_ref_mod_and_test+0x8
486d   9383ed:	80 e1 07             	and    $0x7,%cl
4870   9383f0:	80 c1 03             	add    $0x3,%cl
4873   9383f3:	38 c1                	cmp    %al,%cl
4875   9383f5:	0f 8c 73 f4 ff ff    	jl     93786e <shrink_lruvec+0x3cee>
487b   9383fb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9383fe: R_X86_64_32S	__tracepoint_page_ref_mod_and_test+0x8
4882   938402:	e8 00 00 00 00       	call   938407 <shrink_lruvec+0x4887>	938403: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4887   938407:	e9 62 f4 ff ff       	jmp    93786e <shrink_lruvec+0x3cee>
488c   93840c:	e8 00 00 00 00       	call   938411 <shrink_lruvec+0x4891>	93840d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4891   938411:	45 31 ed             	xor    %r13d,%r13d
4894   938414:	e9 88 f3 ff ff       	jmp    9377a1 <shrink_lruvec+0x3c21>
4899   938419:	e8 00 00 00 00       	call   93841e <shrink_lruvec+0x489e>	93841a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
489e   93841e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	938421: R_X86_64_32S	.data+0x58f940
48a5   938425:	4c 89 fe             	mov    %r15,%rsi
48a8   938428:	e8 00 00 00 00       	call   93842d <shrink_lruvec+0x48ad>	938429: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
48ad   93842d:	e9 2a ff ff ff       	jmp    93835c <shrink_lruvec+0x47dc>
48b2   938432:	e8 00 00 00 00       	call   938437 <shrink_lruvec+0x48b7>	938433: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
48b7   938437:	eb 0d                	jmp    938446 <shrink_lruvec+0x48c6>
48b9   938439:	e8 00 00 00 00       	call   93843e <shrink_lruvec+0x48be>	93843a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
48be   93843e:	4c 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%r15
48c6   938446:	31 ff                	xor    %edi,%edi
48c8   938448:	8b 5c 24 38          	mov    0x38(%rsp),%ebx
48cc   93844c:	89 de                	mov    %ebx,%esi
48ce   93844e:	e8 00 00 00 00       	call   938453 <shrink_lruvec+0x48d3>	93844f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
48d3   938453:	85 db                	test   %ebx,%ebx
48d5   938455:	0f 84 ee 00 00 00    	je     938549 <shrink_lruvec+0x49c9>
48db   93845b:	48 8b 84 24 b0 01 00 00 	mov    0x1b0(%rsp),%rax
48e3   938463:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
48e8   938468:	48 8d 9c 24 90 03 00 00 	lea    0x390(%rsp),%rbx
48f0   938470:	74 08                	je     93847a <shrink_lruvec+0x48fa>
48f2   938472:	48 89 df             	mov    %rbx,%rdi
48f5   938475:	e8 00 00 00 00       	call   93847a <shrink_lruvec+0x48fa>	938476: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
48fa   93847a:	4c 8b a4 24 90 03 00 00 	mov    0x390(%rsp),%r12
4902   938482:	49 39 dc             	cmp    %rbx,%r12
4905   938485:	0f 84 c5 00 00 00    	je     938550 <shrink_lruvec+0x49d0>
490b   93848b:	e8 00 00 00 00       	call   938490 <shrink_lruvec+0x4910>	93848c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4910   938490:	43 80 3c 2f 00       	cmpb   $0x0,(%r15,%r13,1)
4915   938495:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
491d   93849d:	74 08                	je     9384a7 <shrink_lruvec+0x4927>
491f   93849f:	48 89 df             	mov    %rbx,%rdi
4922   9384a2:	e8 00 00 00 00       	call   9384a7 <shrink_lruvec+0x4927>	9384a3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4927   9384a7:	4c 8b 3b             	mov    (%rbx),%r15
492a   9384aa:	48 8b 84 24 48 01 00 00 	mov    0x148(%rsp),%rax
4932   9384b2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4937   9384b7:	74 08                	je     9384c1 <shrink_lruvec+0x4941>
4939   9384b9:	4c 89 f7             	mov    %r14,%rdi
493c   9384bc:	e8 00 00 00 00       	call   9384c1 <shrink_lruvec+0x4941>	9384bd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4941   9384c1:	4c 8b b4 24 98 03 00 00 	mov    0x398(%rsp),%r14
4949   9384c9:	49 8d 5c 24 08       	lea    0x8(%r12),%rbx
494e   9384ce:	48 89 d8             	mov    %rbx,%rax
4951   9384d1:	48 c1 e8 03          	shr    $0x3,%rax
4955   9384d5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
495a   9384da:	74 08                	je     9384e4 <shrink_lruvec+0x4964>
495c   9384dc:	48 89 df             	mov    %rbx,%rdi
495f   9384df:	e8 00 00 00 00       	call   9384e4 <shrink_lruvec+0x4964>	9384e0: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4964   9384e4:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
496c   9384ec:	48 89 03             	mov    %rax,(%rbx)
496f   9384ef:	48 89 c3             	mov    %rax,%rbx
4972   9384f2:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
497a   9384fa:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
497f   9384ff:	74 08                	je     938509 <shrink_lruvec+0x4989>
4981   938501:	48 89 df             	mov    %rbx,%rdi
4984   938504:	e8 00 00 00 00       	call   938509 <shrink_lruvec+0x4989>	938505: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4989   938509:	4c 89 23             	mov    %r12,(%rbx)
498c   93850c:	4c 89 f0             	mov    %r14,%rax
498f   93850f:	48 c1 e8 03          	shr    $0x3,%rax
4993   938513:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4998   938518:	74 08                	je     938522 <shrink_lruvec+0x49a2>
499a   93851a:	4c 89 f7             	mov    %r14,%rdi
499d   93851d:	e8 00 00 00 00       	call   938522 <shrink_lruvec+0x49a2>	93851e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
49a2   938522:	4d 89 3e             	mov    %r15,(%r14)
49a5   938525:	49 83 c7 08          	add    $0x8,%r15
49a9   938529:	4c 89 f8             	mov    %r15,%rax
49ac   93852c:	48 c1 e8 03          	shr    $0x3,%rax
49b0   938530:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
49b5   938535:	74 08                	je     93853f <shrink_lruvec+0x49bf>
49b7   938537:	4c 89 ff             	mov    %r15,%rdi
49ba   93853a:	e8 00 00 00 00       	call   93853f <shrink_lruvec+0x49bf>	93853b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
49bf   93853f:	4d 89 37             	mov    %r14,(%r15)
49c2   938542:	4c 8b 74 24 48       	mov    0x48(%rsp),%r14
49c7   938547:	eb 0c                	jmp    938555 <shrink_lruvec+0x49d5>
49c9   938549:	e8 00 00 00 00       	call   93854e <shrink_lruvec+0x49ce>	93854a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
49ce   93854e:	eb 05                	jmp    938555 <shrink_lruvec+0x49d5>
49d0   938550:	e8 00 00 00 00       	call   938555 <shrink_lruvec+0x49d5>	938551: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
49d5   938555:	31 ff                	xor    %edi,%edi
49d7   938557:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
49dc   93855c:	89 de                	mov    %ebx,%esi
49de   93855e:	e8 00 00 00 00       	call   938563 <shrink_lruvec+0x49e3>	93855f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
49e3   938563:	bf 40 00 00 00       	mov    $0x40,%edi
49e8   938568:	8b 74 24 40          	mov    0x40(%rsp),%esi
49ec   93856c:	e8 00 00 00 00       	call   938571 <shrink_lruvec+0x49f1>	93856d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
49f1   938571:	31 ff                	xor    %edi,%edi
49f3   938573:	48 8b b4 24 f8 00 00 00 	mov    0xf8(%rsp),%rsi
49fb   93857b:	e8 00 00 00 00       	call   938580 <shrink_lruvec+0x4a00>	93857c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
4a00   938580:	85 db                	test   %ebx,%ebx
4a02   938582:	74 43                	je     9385c7 <shrink_lruvec+0x4a47>
4a04   938584:	83 7c 24 40 3f       	cmpl   $0x3f,0x40(%rsp)
4a09   938589:	7f 3c                	jg     9385c7 <shrink_lruvec+0x4a47>
4a0b   93858b:	48 83 bc 24 f8 00 00 00 00 	cmpq   $0x0,0xf8(%rsp)
4a14   938594:	7e 31                	jle    9385c7 <shrink_lruvec+0x4a47>
4a16   938596:	48 83 84 24 f8 00 00 00 ff 	addq   $0xffffffffffffffff,0xf8(%rsp)
4a1f   93859f:	e8 00 00 00 00       	call   9385a4 <shrink_lruvec+0x4a24>	9385a0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a24   9385a4:	e9 3f d9 ff ff       	jmp    935ee8 <shrink_lruvec+0x2368>
4a29   9385a9:	e8 00 00 00 00       	call   9385ae <shrink_lruvec+0x4a2e>	9385aa: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a2e   9385ae:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9385b1: R_X86_64_32S	.data+0x58f8c0
4a35   9385b5:	48 8b b4 24 f8 00 00 00 	mov    0xf8(%rsp),%rsi
4a3d   9385bd:	e8 00 00 00 00       	call   9385c2 <shrink_lruvec+0x4a42>	9385be: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
4a42   9385c2:	e9 a6 d9 ff ff       	jmp    935f6d <shrink_lruvec+0x23ed>
4a47   9385c7:	e8 00 00 00 00       	call   9385cc <shrink_lruvec+0x4a4c>	9385c8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a4c   9385cc:	eb 2a                	jmp    9385f8 <shrink_lruvec+0x4a78>
4a4e   9385ce:	e8 00 00 00 00       	call   9385d3 <shrink_lruvec+0x4a53>	9385cf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4a53   9385d3:	b8 00 10 00 00       	mov    $0x1000,%eax
4a58   9385d8:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
4a5d   9385dd:	c7 44 24 78 00 00 00 00 	movl   $0x0,0x78(%rsp)
4a65   9385e5:	c7 84 24 d0 00 00 00 00 00 00 00 	movl   $0x0,0xd0(%rsp)
4a70   9385f0:	c7 44 24 40 00 00 00 00 	movl   $0x0,0x40(%rsp)
4a78   9385f8:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
4a7d   9385fd:	48 89 d0             	mov    %rdx,%rax
4a80   938600:	48 c1 e8 03          	shr    $0x3,%rax
4a84   938604:	42 8a 04 28          	mov    (%rax,%r13,1),%al
4a88   938608:	84 c0                	test   %al,%al
4a8a   93860a:	0f 85 1c 01 00 00    	jne    93872c <shrink_lruvec+0x4bac>
4a90   938610:	31 db                	xor    %ebx,%ebx
4a92   938612:	8b 32                	mov    (%rdx),%esi
4a94   938614:	b8 00 00 02 00       	mov    $0x20000,%eax
4a99   938619:	21 c6                	and    %eax,%esi
4a9b   93861b:	0f 94 c3             	sete   %bl
4a9e   93861e:	31 ff                	xor    %edi,%edi
4aa0   938620:	e8 00 00 00 00       	call   938625 <shrink_lruvec+0x4aa5>	938621: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4aa5   938625:	83 cb 1a             	or     $0x1a,%ebx
4aa8   938628:	4c 63 74 24 40       	movslq 0x40(%rsp),%r14
4aad   93862d:	4c 8b bc 24 a0 01 00 00 	mov    0x1a0(%rsp),%r15
4ab5   938635:	4c 89 ff             	mov    %r15,%rdi
4ab8   938638:	89 de                	mov    %ebx,%esi
4aba   93863a:	4c 89 f2             	mov    %r14,%rdx
4abd   93863d:	e8 00 00 00 00       	call   938642 <shrink_lruvec+0x4ac2>	93863e: R_X86_64_PLT32	__count_memcg_events-0x4
4ac2   938642:	48 63 54 24 78       	movslq 0x78(%rsp),%rdx
4ac7   938647:	4c 89 ff             	mov    %r15,%rdi
4aca   93864a:	be 14 00 00 00       	mov    $0x14,%esi
4acf   93864f:	e8 00 00 00 00       	call   938654 <shrink_lruvec+0x4ad4>	938650: R_X86_64_PLT32	__count_memcg_events-0x4
4ad4   938654:	31 ff                	xor    %edi,%edi
4ad6   938656:	44 89 f6             	mov    %r14d,%esi
4ad9   938659:	e8 00 00 00 00       	call   93865e <shrink_lruvec+0x4ade>	93865a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4ade   93865e:	45 85 f6             	test   %r14d,%r14d
4ae1   938661:	41 0f 94 c6          	sete   %r14b
4ae5   938665:	31 ff                	xor    %edi,%edi
4ae7   938667:	48 8b 5c 24 30       	mov    0x30(%rsp),%rbx
4aec   93866c:	89 de                	mov    %ebx,%esi
4aee   93866e:	e8 00 00 00 00       	call   938673 <shrink_lruvec+0x4af3>	93866f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4af3   938673:	85 db                	test   %ebx,%ebx
4af5   938675:	41 0f 95 c7          	setne  %r15b
4af9   938679:	31 ff                	xor    %edi,%edi
4afb   93867b:	8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%ebx
4b02   938682:	89 de                	mov    %ebx,%esi
4b04   938684:	e8 00 00 00 00       	call   938689 <shrink_lruvec+0x4b09>	938685: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4b09   938689:	45 84 fe             	test   %r15b,%r14b
4b0c   93868c:	75 0b                	jne    938699 <shrink_lruvec+0x4b19>
4b0e   93868e:	41 89 de             	mov    %ebx,%r14d
4b11   938691:	85 db                	test   %ebx,%ebx
4b13   938693:	0f 85 c1 00 00 00    	jne    93875a <shrink_lruvec+0x4bda>
4b19   938699:	e8 00 00 00 00       	call   93869e <shrink_lruvec+0x4b1e>	93869a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4b1e   93869e:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
4b23   9386a3:	31 ff                	xor    %edi,%edi
4b25   9386a5:	89 de                	mov    %ebx,%esi
4b27   9386a7:	e8 00 00 00 00       	call   9386ac <shrink_lruvec+0x4b2c>	9386a8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
4b2c   9386ac:	85 db                	test   %ebx,%ebx
4b2e   9386ae:	0f 94 c0             	sete   %al
4b31   9386b1:	31 db                	xor    %ebx,%ebx
4b33   9386b3:	88 c3                	mov    %al,%bl
4b35   9386b5:	8b 84 24 a8 01 00 00 	mov    0x1a8(%rsp),%eax
4b3c   9386bc:	83 c0 01             	add    $0x1,%eax
4b3f   9386bf:	83 f8 02             	cmp    $0x2,%eax
4b42   9386c2:	0f 84 88 00 00 00    	je     938750 <shrink_lruvec+0x4bd0>
4b48   9386c8:	89 84 24 a8 01 00 00 	mov    %eax,0x1a8(%rsp)
4b4f   9386cf:	e8 00 00 00 00       	call   9386d4 <shrink_lruvec+0x4b54>	9386d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4b54   9386d4:	41 be ff ff ff ff    	mov    $0xffffffff,%r14d
4b5a   9386da:	e9 34 d0 ff ff       	jmp    935713 <shrink_lruvec+0x1b93>
4b5f   9386df:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9386e2: R_X86_64_32S	memory_cgrp_subsys_enabled_key
4b66   9386e6:	80 e1 07             	and    $0x7,%cl
4b69   9386e9:	80 c1 03             	add    $0x3,%cl
4b6c   9386ec:	38 c1                	cmp    %al,%cl
4b6e   9386ee:	0f 8c b2 d6 ff ff    	jl     935da6 <shrink_lruvec+0x2226>
4b74   9386f4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9386f7: R_X86_64_32S	memory_cgrp_subsys_enabled_key
4b7b   9386fb:	e8 00 00 00 00       	call   938700 <shrink_lruvec+0x4b80>	9386fc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4b80   938700:	e9 a1 d6 ff ff       	jmp    935da6 <shrink_lruvec+0x2226>
4b85   938705:	89 d1                	mov    %edx,%ecx
4b87   938707:	80 e1 07             	and    $0x7,%cl
4b8a   93870a:	38 c1                	cmp    %al,%cl
4b8c   93870c:	0f 8c 7f d7 ff ff    	jl     935e91 <shrink_lruvec+0x2311>
4b92   938712:	48 8b bc 24 18 01 00 00 	mov    0x118(%rsp),%rdi
4b9a   93871a:	e8 00 00 00 00       	call   93871f <shrink_lruvec+0x4b9f>	93871b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
4b9f   93871f:	48 8b 94 24 18 01 00 00 	mov    0x118(%rsp),%rdx
4ba7   938727:	e9 65 d7 ff ff       	jmp    935e91 <shrink_lruvec+0x2311>
4bac   93872c:	89 d1                	mov    %edx,%ecx
4bae   93872e:	80 e1 07             	and    $0x7,%cl
4bb1   938731:	80 c1 03             	add    $0x3,%cl
4bb4   938734:	38 c1                	cmp    %al,%cl
4bb6   938736:	0f 8c d4 fe ff ff    	jl     938610 <shrink_lruvec+0x4a90>
4bbc   93873c:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
4bc1   938741:	e8 00 00 00 00       	call   938746 <shrink_lruvec+0x4bc6>	938742: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
4bc6   938746:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
4bcb   93874b:	e9 c0 fe ff ff       	jmp    938610 <shrink_lruvec+0x4a90>
4bd0   938750:	e8 00 00 00 00       	call   938755 <shrink_lruvec+0x4bd5>	938751: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4bd5   938755:	45 31 f6             	xor    %r14d,%r14d
4bd8   938758:	eb 0a                	jmp    938764 <shrink_lruvec+0x4be4>
4bda   93875a:	e8 00 00 00 00       	call   93875f <shrink_lruvec+0x4bdf>	93875b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4bdf   93875f:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
4be4   938764:	48 89 5c 24 60       	mov    %rbx,0x60(%rsp)
4be9   938769:	48 8b 84 24 d8 01 00 00 	mov    0x1d8(%rsp),%rax
4bf1   938771:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4bf6   938776:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
4bfe   93877e:	74 15                	je     938795 <shrink_lruvec+0x4c15>
4c00   938780:	48 8b bc 24 28 01 00 00 	mov    0x128(%rsp),%rdi
4c08   938788:	e8 00 00 00 00       	call   93878d <shrink_lruvec+0x4c0d>	938789: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4c0d   93878d:	48 8b 84 24 28 01 00 00 	mov    0x128(%rsp),%rax
4c15   938795:	4c 8b 38             	mov    (%rax),%r15
4c18   938798:	48 8d bc 24 70 03 00 00 	lea    0x370(%rsp),%rdi
4c20   9387a0:	48 89 fb             	mov    %rdi,%rbx
4c23   9387a3:	48 c1 eb 03          	shr    $0x3,%rbx
4c27   9387a7:	42 80 3c 2b 00       	cmpb   $0x0,(%rbx,%r13,1)
4c2c   9387ac:	74 0d                	je     9387bb <shrink_lruvec+0x4c3b>
4c2e   9387ae:	e8 00 00 00 00       	call   9387b3 <shrink_lruvec+0x4c33>	9387af: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4c33   9387b3:	48 8d bc 24 70 03 00 00 	lea    0x370(%rsp),%rdi
4c3b   9387bb:	48 89 9c 24 a8 00 00 00 	mov    %rbx,0xa8(%rsp)
4c43   9387c3:	4c 89 bc 24 70 03 00 00 	mov    %r15,0x370(%rsp)
4c4b   9387cb:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
4c53   9387d3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4c58   9387d8:	48 8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%rbx
4c60   9387e0:	74 10                	je     9387f2 <shrink_lruvec+0x4c72>
4c62   9387e2:	48 89 df             	mov    %rbx,%rdi
4c65   9387e5:	e8 00 00 00 00       	call   9387ea <shrink_lruvec+0x4c6a>	9387e6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4c6a   9387ea:	48 8d bc 24 70 03 00 00 	lea    0x370(%rsp),%rdi
4c72   9387f2:	44 89 b4 24 d0 00 00 00 	mov    %r14d,0xd0(%rsp)
4c7a   9387fa:	4c 8b 3b             	mov    (%rbx),%r15
4c7d   9387fd:	48 8b 84 24 d0 01 00 00 	mov    0x1d0(%rsp),%rax
4c85   938805:	48 89 c1             	mov    %rax,%rcx
4c88   938808:	48 c1 e9 03          	shr    $0x3,%rcx
4c8c   93880c:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
4c91   938811:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
4c96   938816:	74 10                	je     938828 <shrink_lruvec+0x4ca8>
4c98   938818:	48 89 c7             	mov    %rax,%rdi
4c9b   93881b:	e8 00 00 00 00       	call   938820 <shrink_lruvec+0x4ca0>	93881c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4ca0   938820:	48 8d bc 24 70 03 00 00 	lea    0x370(%rsp),%rdi
4ca8   938828:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
4cb0   938830:	41 0f 94 c6          	sete   %r14b
4cb4   938834:	4c 89 bc 24 78 03 00 00 	mov    %r15,0x378(%rsp)
4cbc   93883c:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
4cc4   938844:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4cc9   938849:	48 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%rbx
4cd1   938851:	74 10                	je     938863 <shrink_lruvec+0x4ce3>
4cd3   938853:	48 89 df             	mov    %rbx,%rdi
4cd6   938856:	e8 00 00 00 00       	call   93885b <shrink_lruvec+0x4cdb>	938857: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4cdb   93885b:	48 8d bc 24 70 03 00 00 	lea    0x370(%rsp),%rdi
4ce3   938863:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
4ce8   938868:	31 c0                	xor    %eax,%eax
4cea   93886a:	44 88 f0             	mov    %r14b,%al
4ced   93886d:	48 8b 0b             	mov    (%rbx),%rcx
4cf0   938870:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
4cf5   938875:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
4cfa   93887a:	48 8d 1c c7          	lea    (%rdi,%rax,8),%rbx
4cfe   93887e:	48 89 d8             	mov    %rbx,%rax
4d01   938881:	48 c1 e8 03          	shr    $0x3,%rax
4d05   938885:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
4d0a   93888a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4d0f   93888f:	74 08                	je     938899 <shrink_lruvec+0x4d19>
4d11   938891:	48 89 df             	mov    %rbx,%rdi
4d14   938894:	e8 00 00 00 00       	call   938899 <shrink_lruvec+0x4d19>	938895: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4d19   938899:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
4d1e   93889e:	4c 8b 23             	mov    (%rbx),%r12
4d21   9388a1:	4d 8d 74 24 02       	lea    0x2(%r12),%r14
4d26   9388a6:	4c 89 f7             	mov    %r14,%rdi
4d29   9388a9:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
4d2e   9388ae:	48 89 de             	mov    %rbx,%rsi
4d31   9388b1:	e8 00 00 00 00       	call   9388b6 <shrink_lruvec+0x4d36>	9388b2: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
4d36   9388b6:	49 39 de             	cmp    %rbx,%r14
4d39   9388b9:	76 0a                	jbe    9388c5 <shrink_lruvec+0x4d45>
4d3b   9388bb:	e8 00 00 00 00       	call   9388c0 <shrink_lruvec+0x4d40>	9388bc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4d40   9388c0:	e9 d3 00 00 00       	jmp    938998 <shrink_lruvec+0x4e18>
4d45   9388c5:	44 89 e0             	mov    %r12d,%eax
4d48   9388c8:	83 e0 03             	and    $0x3,%eax
4d4b   9388cb:	4c 8d 34 40          	lea    (%rax,%rax,2),%r14
4d4f   9388cf:	49 c1 e6 05          	shl    $0x5,%r14
4d53   9388d3:	4c 03 74 24 18       	add    0x18(%rsp),%r14
4d58   9388d8:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
4d5d   9388dd:	4c 8d 3c 40          	lea    (%rax,%rax,2),%r15
4d61   9388e1:	49 c1 e7 04          	shl    $0x4,%r15
4d65   9388e5:	4b 8d 1c 37          	lea    (%r15,%r14,1),%rbx
4d69   9388e9:	48 81 c3 e0 00 00 00 	add    $0xe0,%rbx
4d70   9388f0:	48 89 d8             	mov    %rbx,%rax
4d73   9388f3:	48 c1 e8 03          	shr    $0x3,%rax
4d77   9388f7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4d7c   9388fc:	74 08                	je     938906 <shrink_lruvec+0x4d86>
4d7e   9388fe:	48 89 df             	mov    %rbx,%rdi
4d81   938901:	e8 00 00 00 00       	call   938906 <shrink_lruvec+0x4d86>	938902: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4d86   938906:	48 8b 03             	mov    (%rbx),%rax
4d89   938909:	48 39 d8             	cmp    %rbx,%rax
4d8c   93890c:	75 6c                	jne    93897a <shrink_lruvec+0x4dfa>
4d8e   93890e:	4b 8d 1c 37          	lea    (%r15,%r14,1),%rbx
4d92   938912:	48 81 c3 f0 00 00 00 	add    $0xf0,%rbx
4d99   938919:	48 89 d8             	mov    %rbx,%rax
4d9c   93891c:	48 c1 e8 03          	shr    $0x3,%rax
4da0   938920:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4da5   938925:	74 08                	je     93892f <shrink_lruvec+0x4daf>
4da7   938927:	48 89 df             	mov    %rbx,%rdi
4daa   93892a:	e8 00 00 00 00       	call   93892f <shrink_lruvec+0x4daf>	93892b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4daf   93892f:	48 8b 03             	mov    (%rbx),%rax
4db2   938932:	48 39 d8             	cmp    %rbx,%rax
4db5   938935:	75 4a                	jne    938981 <shrink_lruvec+0x4e01>
4db7   938937:	4b 8d 1c 37          	lea    (%r15,%r14,1),%rbx
4dbb   93893b:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
4dc2   938942:	48 89 d8             	mov    %rbx,%rax
4dc5   938945:	48 c1 e8 03          	shr    $0x3,%rax
4dc9   938949:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4dce   93894e:	74 08                	je     938958 <shrink_lruvec+0x4dd8>
4dd0   938950:	48 89 df             	mov    %rbx,%rdi
4dd3   938953:	e8 00 00 00 00       	call   938958 <shrink_lruvec+0x4dd8>	938954: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4dd8   938958:	48 8b 03             	mov    (%rbx),%rax
4ddb   93895b:	48 39 d8             	cmp    %rbx,%rax
4dde   93895e:	75 28                	jne    938988 <shrink_lruvec+0x4e08>
4de0   938960:	49 8d 44 24 03       	lea    0x3(%r12),%rax
4de5   938965:	48 3b 44 24 10       	cmp    0x10(%rsp),%rax
4dea   93896a:	77 23                	ja     93898f <shrink_lruvec+0x4e0f>
4dec   93896c:	e8 00 00 00 00       	call   938971 <shrink_lruvec+0x4df1>	93896d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4df1   938971:	49 83 c4 01          	add    $0x1,%r12
4df5   938975:	e9 4b ff ff ff       	jmp    9388c5 <shrink_lruvec+0x4d45>
4dfa   93897a:	e8 00 00 00 00       	call   93897f <shrink_lruvec+0x4dff>	93897b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4dff   93897f:	eb 17                	jmp    938998 <shrink_lruvec+0x4e18>
4e01   938981:	e8 00 00 00 00       	call   938986 <shrink_lruvec+0x4e06>	938982: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4e06   938986:	eb 10                	jmp    938998 <shrink_lruvec+0x4e18>
4e08   938988:	e8 00 00 00 00       	call   93898d <shrink_lruvec+0x4e0d>	938989: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4e0d   93898d:	eb 09                	jmp    938998 <shrink_lruvec+0x4e18>
4e0f   93898f:	e8 00 00 00 00       	call   938994 <shrink_lruvec+0x4e14>	938990: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4e14   938994:	49 83 c4 01          	add    $0x1,%r12
4e18   938998:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
4e1d   93899d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4e22   9389a2:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
4e27   9389a7:	74 08                	je     9389b1 <shrink_lruvec+0x4e31>
4e29   9389a9:	48 89 df             	mov    %rbx,%rdi
4e2c   9389ac:	e8 00 00 00 00       	call   9389b1 <shrink_lruvec+0x4e31>	9389ad: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4e31   9389b1:	45 31 f6             	xor    %r14d,%r14d
4e34   9389b4:	4c 89 23             	mov    %r12,(%rbx)
4e37   9389b7:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
4e3f   9389bf:	0f 94 c0             	sete   %al
4e42   9389c2:	0f 84 2e 01 00 00    	je     938af6 <shrink_lruvec+0x4f76>
4e48   9389c8:	41 88 c6             	mov    %al,%r14b
4e4b   9389cb:	49 83 c6 01          	add    $0x1,%r14
4e4f   9389cf:	48 8d 84 24 70 03 00 00 	lea    0x370(%rsp),%rax
4e57   9389d7:	4a 8d 1c f0          	lea    (%rax,%r14,8),%rbx
4e5b   9389db:	48 89 d8             	mov    %rbx,%rax
4e5e   9389de:	48 c1 e8 03          	shr    $0x3,%rax
4e62   9389e2:	48 89 84 24 80 00 00 00 	mov    %rax,0x80(%rsp)
4e6a   9389ea:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4e6f   9389ef:	74 08                	je     9389f9 <shrink_lruvec+0x4e79>
4e71   9389f1:	48 89 df             	mov    %rbx,%rdi
4e74   9389f4:	e8 00 00 00 00       	call   9389f9 <shrink_lruvec+0x4e79>	9389f5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4e79   9389f9:	48 89 9c 24 88 00 00 00 	mov    %rbx,0x88(%rsp)
4e81   938a01:	4c 8b 3b             	mov    (%rbx),%r15
4e84   938a04:	4d 8d 67 02          	lea    0x2(%r15),%r12
4e88   938a08:	4c 89 e7             	mov    %r12,%rdi
4e8b   938a0b:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
4e90   938a10:	48 89 de             	mov    %rbx,%rsi
4e93   938a13:	e8 00 00 00 00       	call   938a18 <shrink_lruvec+0x4e98>	938a14: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
4e98   938a18:	49 39 dc             	cmp    %rbx,%r12
4e9b   938a1b:	76 0a                	jbe    938a27 <shrink_lruvec+0x4ea7>
4e9d   938a1d:	e8 00 00 00 00       	call   938a22 <shrink_lruvec+0x4ea2>	938a1e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ea2   938a22:	e9 0b 01 00 00       	jmp    938b32 <shrink_lruvec+0x4fb2>
4ea7   938a27:	44 89 f8             	mov    %r15d,%eax
4eaa   938a2a:	83 e0 03             	and    $0x3,%eax
4ead   938a2d:	4c 8d 24 40          	lea    (%rax,%rax,2),%r12
4eb1   938a31:	49 c1 e4 05          	shl    $0x5,%r12
4eb5   938a35:	4c 03 64 24 18       	add    0x18(%rsp),%r12
4eba   938a3a:	4f 8d 2c 76          	lea    (%r14,%r14,2),%r13
4ebe   938a3e:	49 c1 e5 04          	shl    $0x4,%r13
4ec2   938a42:	4b 8d 1c 2c          	lea    (%r12,%r13,1),%rbx
4ec6   938a46:	48 81 c3 e0 00 00 00 	add    $0xe0,%rbx
4ecd   938a4d:	48 89 d8             	mov    %rbx,%rax
4ed0   938a50:	48 c1 e8 03          	shr    $0x3,%rax
4ed4   938a54:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4ede   938a5e:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4ee2   938a62:	74 08                	je     938a6c <shrink_lruvec+0x4eec>
4ee4   938a64:	48 89 df             	mov    %rbx,%rdi
4ee7   938a67:	e8 00 00 00 00       	call   938a6c <shrink_lruvec+0x4eec>	938a68: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4eec   938a6c:	48 8b 03             	mov    (%rbx),%rax
4eef   938a6f:	48 39 d8             	cmp    %rbx,%rax
4ef2   938a72:	0f 85 88 00 00 00    	jne    938b00 <shrink_lruvec+0x4f80>
4ef8   938a78:	4b 8d 1c 2c          	lea    (%r12,%r13,1),%rbx
4efc   938a7c:	48 81 c3 f0 00 00 00 	add    $0xf0,%rbx
4f03   938a83:	48 89 d8             	mov    %rbx,%rax
4f06   938a86:	48 c1 e8 03          	shr    $0x3,%rax
4f0a   938a8a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
4f14   938a94:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
4f18   938a98:	74 08                	je     938aa2 <shrink_lruvec+0x4f22>
4f1a   938a9a:	48 89 df             	mov    %rbx,%rdi
4f1d   938a9d:	e8 00 00 00 00       	call   938aa2 <shrink_lruvec+0x4f22>	938a9e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4f22   938aa2:	48 8b 03             	mov    (%rbx),%rax
4f25   938aa5:	48 39 d8             	cmp    %rbx,%rax
4f28   938aa8:	75 67                	jne    938b11 <shrink_lruvec+0x4f91>
4f2a   938aaa:	4b 8d 1c 2c          	lea    (%r12,%r13,1),%rbx
4f2e   938aae:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
4f35   938ab5:	48 89 d8             	mov    %rbx,%rax
4f38   938ab8:	48 c1 e8 03          	shr    $0x3,%rax
4f3c   938abc:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
4f46   938ac6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4f4b   938acb:	74 08                	je     938ad5 <shrink_lruvec+0x4f55>
4f4d   938acd:	48 89 df             	mov    %rbx,%rdi
4f50   938ad0:	e8 00 00 00 00       	call   938ad5 <shrink_lruvec+0x4f55>	938ad1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
4f55   938ad5:	48 8b 03             	mov    (%rbx),%rax
4f58   938ad8:	48 39 d8             	cmp    %rbx,%rax
4f5b   938adb:	75 45                	jne    938b22 <shrink_lruvec+0x4fa2>
4f5d   938add:	49 8d 47 03          	lea    0x3(%r15),%rax
4f61   938ae1:	48 3b 44 24 10       	cmp    0x10(%rsp),%rax
4f66   938ae6:	77 41                	ja     938b29 <shrink_lruvec+0x4fa9>
4f68   938ae8:	e8 00 00 00 00       	call   938aed <shrink_lruvec+0x4f6d>	938ae9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f6d   938aed:	49 83 c7 01          	add    $0x1,%r15
4f71   938af1:	e9 31 ff ff ff       	jmp    938a27 <shrink_lruvec+0x4ea7>
4f76   938af6:	e8 00 00 00 00       	call   938afb <shrink_lruvec+0x4f7b>	938af7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f7b   938afb:	e9 24 01 00 00       	jmp    938c24 <shrink_lruvec+0x50a4>
4f80   938b00:	e8 00 00 00 00       	call   938b05 <shrink_lruvec+0x4f85>	938b01: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f85   938b05:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
4f8f   938b0f:	eb 21                	jmp    938b32 <shrink_lruvec+0x4fb2>
4f91   938b11:	e8 00 00 00 00       	call   938b16 <shrink_lruvec+0x4f96>	938b12: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4f96   938b16:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
4fa0   938b20:	eb 10                	jmp    938b32 <shrink_lruvec+0x4fb2>
4fa2   938b22:	e8 00 00 00 00       	call   938b27 <shrink_lruvec+0x4fa7>	938b23: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4fa7   938b27:	eb 09                	jmp    938b32 <shrink_lruvec+0x4fb2>
4fa9   938b29:	e8 00 00 00 00       	call   938b2e <shrink_lruvec+0x4fae>	938b2a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4fae   938b2e:	49 83 c7 01          	add    $0x1,%r15
4fb2   938b32:	48 8b 84 24 80 00 00 00 	mov    0x80(%rsp),%rax
4fba   938b3a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
4fbf   938b3f:	4c 8b b4 24 d0 01 00 00 	mov    0x1d0(%rsp),%r14
4fc7   938b47:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
4fcf   938b4f:	74 08                	je     938b59 <shrink_lruvec+0x4fd9>
4fd1   938b51:	48 89 df             	mov    %rbx,%rdi
4fd4   938b54:	e8 00 00 00 00       	call   938b59 <shrink_lruvec+0x4fd9>	938b55: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
4fd9   938b59:	4c 89 3b             	mov    %r15,(%rbx)
4fdc   938b5c:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
4fe4   938b64:	0f 84 b0 00 00 00    	je     938c1a <shrink_lruvec+0x509a>
4fea   938b6a:	4c 89 f3             	mov    %r14,%rbx
4fed   938b6d:	e8 00 00 00 00       	call   938b72 <shrink_lruvec+0x4ff2>	938b6e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
4ff2   938b72:	4c 8b b4 24 a8 00 00 00 	mov    0xa8(%rsp),%r14
4ffa   938b7a:	43 80 3c 2e 00       	cmpb   $0x0,(%r14,%r13,1)
4fff   938b7f:	74 0d                	je     938b8e <shrink_lruvec+0x500e>
5001   938b81:	48 8d bc 24 70 03 00 00 	lea    0x370(%rsp),%rdi
5009   938b89:	e8 00 00 00 00       	call   938b8e <shrink_lruvec+0x500e>	938b8a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
500e   938b8e:	4c 8b a4 24 70 03 00 00 	mov    0x370(%rsp),%r12
5016   938b96:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
501b   938b9b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5020   938ba0:	74 08                	je     938baa <shrink_lruvec+0x502a>
5022   938ba2:	48 89 df             	mov    %rbx,%rdi
5025   938ba5:	e8 00 00 00 00       	call   938baa <shrink_lruvec+0x502a>	938ba6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
502a   938baa:	48 8b 9c 24 78 03 00 00 	mov    0x378(%rsp),%rbx
5032   938bb2:	4c 89 e7             	mov    %r12,%rdi
5035   938bb5:	48 89 de             	mov    %rbx,%rsi
5038   938bb8:	e8 00 00 00 00       	call   938bbd <shrink_lruvec+0x503d>	938bb9: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
503d   938bbd:	49 39 dc             	cmp    %rbx,%r12
5040   938bc0:	49 0f 42 dc          	cmovb  %r12,%rbx
5044   938bc4:	43 80 3c 2e 00       	cmpb   $0x0,(%r14,%r13,1)
5049   938bc9:	74 0d                	je     938bd8 <shrink_lruvec+0x5058>
504b   938bcb:	48 8d bc 24 70 03 00 00 	lea    0x370(%rsp),%rdi
5053   938bd3:	e8 00 00 00 00       	call   938bd8 <shrink_lruvec+0x5058>	938bd4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5058   938bd8:	48 89 9c 24 70 03 00 00 	mov    %rbx,0x370(%rsp)
5060   938be0:	48 89 df             	mov    %rbx,%rdi
5063   938be3:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
5068   938be8:	4c 89 f6             	mov    %r14,%rsi
506b   938beb:	e8 00 00 00 00       	call   938bf0 <shrink_lruvec+0x5070>	938bec: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
5070   938bf0:	4c 39 f3             	cmp    %r14,%rbx
5073   938bf3:	4c 0f 47 f3          	cmova  %rbx,%r14
5077   938bf7:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
507c   938bfc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5081   938c01:	48 8b bc 24 d0 01 00 00 	mov    0x1d0(%rsp),%rdi
5089   938c09:	74 05                	je     938c10 <shrink_lruvec+0x5090>
508b   938c0b:	e8 00 00 00 00       	call   938c10 <shrink_lruvec+0x5090>	938c0c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
5090   938c10:	4c 89 b4 24 78 03 00 00 	mov    %r14,0x378(%rsp)
5098   938c18:	eb 05                	jmp    938c1f <shrink_lruvec+0x509f>
509a   938c1a:	e8 00 00 00 00       	call   938c1f <shrink_lruvec+0x509f>	938c1b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
509f   938c1f:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
50a4   938c24:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
50a9   938c29:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
50ae   938c2e:	74 08                	je     938c38 <shrink_lruvec+0x50b8>
50b0   938c30:	48 89 df             	mov    %rbx,%rdi
50b3   938c33:	e8 00 00 00 00       	call   938c38 <shrink_lruvec+0x50b8>	938c34: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
50b8   938c38:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
50bd   938c3d:	4c 8b bc cc 70 03 00 00 	mov    0x370(%rsp,%rcx,8),%r15
50c5   938c45:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
50ca   938c4a:	4c 8d 34 c8          	lea    (%rax,%rcx,8),%r14
50ce   938c4e:	49 81 c6 d0 00 00 00 	add    $0xd0,%r14
50d5   938c55:	4d 89 f4             	mov    %r14,%r12
50d8   938c58:	49 c1 ec 03          	shr    $0x3,%r12
50dc   938c5c:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
50e1   938c61:	74 08                	je     938c6b <shrink_lruvec+0x50eb>
50e3   938c63:	4c 89 f7             	mov    %r14,%rdi
50e6   938c66:	e8 00 00 00 00       	call   938c6b <shrink_lruvec+0x50eb>	938c67: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
50eb   938c6b:	49 8b 1e             	mov    (%r14),%rbx
50ee   938c6e:	4c 89 ff             	mov    %r15,%rdi
50f1   938c71:	48 89 de             	mov    %rbx,%rsi
50f4   938c74:	e8 00 00 00 00       	call   938c79 <shrink_lruvec+0x50f9>	938c75: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
50f9   938c79:	49 39 df             	cmp    %rbx,%r15
50fc   938c7c:	75 78                	jne    938cf6 <shrink_lruvec+0x5176>
50fe   938c7e:	e8 00 00 00 00       	call   938c83 <shrink_lruvec+0x5103>	938c7f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5103   938c83:	c7 44 24 10 00 00 00 00 	movl   $0x0,0x10(%rsp)
510b   938c8b:	48 8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%rbx
5113   938c93:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
511b   938c9b:	0f 84 9e 00 00 00    	je     938d3f <shrink_lruvec+0x51bf>
5121   938ca1:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
5126   938ca6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
512b   938cab:	74 0d                	je     938cba <shrink_lruvec+0x513a>
512d   938cad:	48 8b bc 24 d0 01 00 00 	mov    0x1d0(%rsp),%rdi
5135   938cb5:	e8 00 00 00 00       	call   938cba <shrink_lruvec+0x513a>	938cb6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
513a   938cba:	4c 8b bc 24 78 03 00 00 	mov    0x378(%rsp),%r15
5142   938cc2:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
514a   938cca:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
514f   938ccf:	74 08                	je     938cd9 <shrink_lruvec+0x5159>
5151   938cd1:	48 89 df             	mov    %rbx,%rdi
5154   938cd4:	e8 00 00 00 00       	call   938cd9 <shrink_lruvec+0x5159>	938cd5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5159   938cd9:	48 8b 1b             	mov    (%rbx),%rbx
515c   938cdc:	4c 89 ff             	mov    %r15,%rdi
515f   938cdf:	48 89 de             	mov    %rbx,%rsi
5162   938ce2:	e8 00 00 00 00       	call   938ce7 <shrink_lruvec+0x5167>	938ce3: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
5167   938ce7:	49 39 df             	cmp    %rbx,%r15
516a   938cea:	75 5a                	jne    938d46 <shrink_lruvec+0x51c6>
516c   938cec:	e8 00 00 00 00       	call   938cf1 <shrink_lruvec+0x5171>	938ced: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5171   938cf1:	e9 91 00 00 00       	jmp    938d87 <shrink_lruvec+0x5207>
5176   938cf6:	e8 00 00 00 00       	call   938cfb <shrink_lruvec+0x517b>	938cf7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
517b   938cfb:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
5180   938d00:	8b b4 24 04 02 00 00 	mov    0x204(%rsp),%esi
5187   938d07:	ba 01 00 00 00       	mov    $0x1,%edx
518c   938d0c:	e8 6f 8d 01 00       	call   951a80 <reset_ctrl_pos>
5191   938d11:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
5196   938d16:	48 8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%rbx
519e   938d1e:	74 08                	je     938d28 <shrink_lruvec+0x51a8>
51a0   938d20:	4c 89 f7             	mov    %r14,%rdi
51a3   938d23:	e8 00 00 00 00       	call   938d28 <shrink_lruvec+0x51a8>	938d24: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
51a8   938d28:	4d 89 3e             	mov    %r15,(%r14)
51ab   938d2b:	b0 01                	mov    $0x1,%al
51ad   938d2d:	89 44 24 10          	mov    %eax,0x10(%rsp)
51b1   938d31:	83 bc 24 b0 00 00 00 00 	cmpl   $0x0,0xb0(%rsp)
51b9   938d39:	0f 85 62 ff ff ff    	jne    938ca1 <shrink_lruvec+0x5121>
51bf   938d3f:	e8 00 00 00 00       	call   938d44 <shrink_lruvec+0x51c4>	938d40: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
51c4   938d44:	eb 41                	jmp    938d87 <shrink_lruvec+0x5207>
51c6   938d46:	e8 00 00 00 00       	call   938d4b <shrink_lruvec+0x51cb>	938d47: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
51cb   938d4b:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
51d0   938d50:	be 01 00 00 00       	mov    $0x1,%esi
51d5   938d55:	ba 01 00 00 00       	mov    $0x1,%edx
51da   938d5a:	e8 21 8d 01 00       	call   951a80 <reset_ctrl_pos>
51df   938d5f:	48 8b 84 24 60 01 00 00 	mov    0x160(%rsp),%rax
51e7   938d67:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
51ec   938d6c:	48 8b 9c 24 20 01 00 00 	mov    0x120(%rsp),%rbx
51f4   938d74:	74 08                	je     938d7e <shrink_lruvec+0x51fe>
51f6   938d76:	48 89 df             	mov    %rbx,%rdi
51f9   938d79:	e8 00 00 00 00       	call   938d7e <shrink_lruvec+0x51fe>	938d7a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
51fe   938d7e:	4c 89 3b             	mov    %r15,(%rbx)
5201   938d81:	b0 01                	mov    $0x1,%al
5203   938d83:	89 44 24 10          	mov    %eax,0x10(%rsp)
5207   938d87:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
520f   938d8f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5214   938d94:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
521c   938d9c:	74 15                	je     938db3 <shrink_lruvec+0x5233>
521e   938d9e:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
5226   938da6:	e8 00 00 00 00       	call   938dab <shrink_lruvec+0x522b>	938da7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
522b   938dab:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
5233   938db3:	48 8b 00             	mov    (%rax),%rax
5236   938db6:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
523b   938dbb:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
5240   938dc0:	74 08                	je     938dca <shrink_lruvec+0x524a>
5242   938dc2:	4c 89 f7             	mov    %r14,%rdi
5245   938dc5:	e8 00 00 00 00       	call   938dca <shrink_lruvec+0x524a>	938dc6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
524a   938dca:	4d 8b 36             	mov    (%r14),%r14
524d   938dcd:	48 8b bc 24 98 01 00 00 	mov    0x198(%rsp),%rdi
5255   938dd5:	e8 00 00 00 00       	call   938dda <shrink_lruvec+0x525a>	938dd6: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
525a   938dda:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
5262   938de2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5267   938de7:	48 8d 9c 24 d0 03 00 00 	lea    0x3d0(%rsp),%rbx
526f   938def:	74 08                	je     938df9 <shrink_lruvec+0x5279>
5271   938df1:	48 89 df             	mov    %rbx,%rdi
5274   938df4:	e8 00 00 00 00       	call   938df9 <shrink_lruvec+0x5279>	938df5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5279   938df9:	48 8b 84 24 d0 03 00 00 	mov    0x3d0(%rsp),%rax
5281   938e01:	48 39 d8             	cmp    %rbx,%rax
5284   938e04:	48 89 df             	mov    %rbx,%rdi
5287   938e07:	8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%ebx
528e   938e0e:	4c 89 74 24 30       	mov    %r14,0x30(%rsp)
5293   938e13:	0f 84 be 02 00 00    	je     9390d7 <shrink_lruvec+0x5557>
5299   938e19:	48 8b b4 24 88 02 00 00 	mov    0x288(%rsp),%rsi
52a1   938e21:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
52a6   938e26:	48 8d 8c 24 f0 03 00 00 	lea    0x3f0(%rsp),%rcx
52ae   938e2e:	45 31 c0             	xor    %r8d,%r8d
52b1   938e31:	48 89 fb             	mov    %rdi,%rbx
52b4   938e34:	e8 87 df fe ff       	call   926dc0 <shrink_page_list>
52b9   938e39:	89 44 24 28          	mov    %eax,0x28(%rsp)
52bd   938e3d:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
52c5   938e45:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
52ca   938e4a:	74 08                	je     938e54 <shrink_lruvec+0x52d4>
52cc   938e4c:	48 89 df             	mov    %rbx,%rdi
52cf   938e4f:	e8 00 00 00 00       	call   938e54 <shrink_lruvec+0x52d4>	938e50: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
52d4   938e54:	4c 8b a4 24 d0 03 00 00 	mov    0x3d0(%rsp),%r12
52dc   938e5c:	4c 39 e3             	cmp    %r12,%rbx
52df   938e5f:	75 1e                	jne    938e7f <shrink_lruvec+0x52ff>
52e1   938e61:	e8 00 00 00 00       	call   938e66 <shrink_lruvec+0x52e6>	938e62: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
52e6   938e66:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
52f0   938e70:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
52f5   938e75:	e9 b6 01 00 00       	jmp    939030 <shrink_lruvec+0x54b0>
52fa   938e7a:	e8 00 00 00 00       	call   938e7f <shrink_lruvec+0x52ff>	938e7b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
52ff   938e7f:	4d 8d 6c 24 f8       	lea    -0x8(%r12),%r13
5304   938e84:	4c 89 ef             	mov    %r13,%rdi
5307   938e87:	be 08 00 00 00       	mov    $0x8,%esi
530c   938e8c:	e8 00 00 00 00       	call   938e91 <shrink_lruvec+0x5311>	938e8d: R_X86_64_PLT32	__kasan_check_read-0x4
5311   938e91:	4d 89 ef             	mov    %r13,%r15
5314   938e94:	49 c1 ef 03          	shr    $0x3,%r15
5318   938e98:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5322   938ea2:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
5327   938ea7:	74 08                	je     938eb1 <shrink_lruvec+0x5331>
5329   938ea9:	4c 89 ef             	mov    %r13,%rdi
532c   938eac:	e8 00 00 00 00       	call   938eb1 <shrink_lruvec+0x5331>	938ead: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5331   938eb1:	4d 8b 75 00          	mov    0x0(%r13),%r14
5335   938eb5:	4c 89 f6             	mov    %r14,%rsi
5338   938eb8:	48 83 e6 40          	and    $0x40,%rsi
533c   938ebc:	31 ff                	xor    %edi,%edi
533e   938ebe:	e8 00 00 00 00       	call   938ec3 <shrink_lruvec+0x5343>	938ebf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5343   938ec3:	49 83 e6 40          	and    $0x40,%r14
5347   938ec7:	75 07                	jne    938ed0 <shrink_lruvec+0x5350>
5349   938ec9:	e8 00 00 00 00       	call   938ece <shrink_lruvec+0x534e>	938eca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
534e   938ece:	eb 18                	jmp    938ee8 <shrink_lruvec+0x5368>
5350   938ed0:	e8 00 00 00 00       	call   938ed5 <shrink_lruvec+0x5355>	938ed1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5355   938ed5:	4c 89 ef             	mov    %r13,%rdi
5358   938ed8:	be 08 00 00 00       	mov    $0x8,%esi
535d   938edd:	e8 00 00 00 00       	call   938ee2 <shrink_lruvec+0x5362>	938ede: R_X86_64_PLT32	__kasan_check_write-0x4
5362   938ee2:	f0 41 80 4d 00 02    	lock orb $0x2,0x0(%r13)
5368   938ee8:	4c 89 ef             	mov    %r13,%rdi
536b   938eeb:	be 08 00 00 00       	mov    $0x8,%esi
5370   938ef0:	e8 00 00 00 00       	call   938ef5 <shrink_lruvec+0x5375>	938ef1: R_X86_64_PLT32	__kasan_check_read-0x4
5375   938ef5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
537f   938eff:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
5384   938f04:	74 08                	je     938f0e <shrink_lruvec+0x538e>
5386   938f06:	4c 89 ef             	mov    %r13,%rdi
5389   938f09:	e8 00 00 00 00       	call   938f0e <shrink_lruvec+0x538e>	938f0a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
538e   938f0e:	49 8b 5d 00          	mov    0x0(%r13),%rbx
5392   938f12:	be 00 00 04 00       	mov    $0x40000,%esi
5397   938f17:	48 21 de             	and    %rbx,%rsi
539a   938f1a:	31 ff                	xor    %edi,%edi
539c   938f1c:	e8 00 00 00 00       	call   938f21 <shrink_lruvec+0x53a1>	938f1d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
53a1   938f21:	b8 00 00 04 00       	mov    $0x40000,%eax
53a6   938f26:	48 21 c3             	and    %rax,%rbx
53a9   938f29:	75 1d                	jne    938f48 <shrink_lruvec+0x53c8>
53ab   938f2b:	e8 00 00 00 00       	call   938f30 <shrink_lruvec+0x53b0>	938f2c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
53b0   938f30:	4c 89 ef             	mov    %r13,%rdi
53b3   938f33:	be 08 00 00 00       	mov    $0x8,%esi
53b8   938f38:	e8 00 00 00 00       	call   938f3d <shrink_lruvec+0x53bd>	938f39: R_X86_64_PLT32	__kasan_check_write-0x4
53bd   938f3d:	f0 41 80 4d 00 20    	lock orb $0x20,0x0(%r13)
53c3   938f43:	e9 aa 00 00 00       	jmp    938ff2 <shrink_lruvec+0x5472>
53c8   938f48:	4c 89 ef             	mov    %r13,%rdi
53cb   938f4b:	be 08 00 00 00       	mov    $0x8,%esi
53d0   938f50:	e8 00 00 00 00       	call   938f55 <shrink_lruvec+0x53d5>	938f51: R_X86_64_PLT32	__kasan_check_read-0x4
53d5   938f55:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
53df   938f5f:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
53e4   938f64:	74 08                	je     938f6e <shrink_lruvec+0x53ee>
53e6   938f66:	4c 89 ef             	mov    %r13,%rdi
53e9   938f69:	e8 00 00 00 00       	call   938f6e <shrink_lruvec+0x53ee>	938f6a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
53ee   938f6e:	49 8b 5d 00          	mov    0x0(%r13),%rbx
53f2   938f72:	48 89 de             	mov    %rbx,%rsi
53f5   938f75:	48 83 e6 08          	and    $0x8,%rsi
53f9   938f79:	31 ff                	xor    %edi,%edi
53fb   938f7b:	e8 00 00 00 00       	call   938f80 <shrink_lruvec+0x5400>	938f7c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5400   938f80:	48 83 e3 08          	and    $0x8,%rbx
5404   938f84:	75 4d                	jne    938fd3 <shrink_lruvec+0x5453>
5406   938f86:	4c 89 ef             	mov    %r13,%rdi
5409   938f89:	be 08 00 00 00       	mov    $0x8,%esi
540e   938f8e:	e8 00 00 00 00       	call   938f93 <shrink_lruvec+0x5413>	938f8f: R_X86_64_PLT32	__kasan_check_read-0x4
5413   938f93:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
541d   938f9d:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
5422   938fa2:	74 08                	je     938fac <shrink_lruvec+0x542c>
5424   938fa4:	4c 89 ef             	mov    %r13,%rdi
5427   938fa7:	e8 00 00 00 00       	call   938fac <shrink_lruvec+0x542c>	938fa8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
542c   938fac:	49 8b 5d 00          	mov    0x0(%r13),%rbx
5430   938fb0:	be 00 80 00 00       	mov    $0x8000,%esi
5435   938fb5:	48 21 de             	and    %rbx,%rsi
5438   938fb8:	31 ff                	xor    %edi,%edi
543a   938fba:	e8 00 00 00 00       	call   938fbf <shrink_lruvec+0x543f>	938fbb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
543f   938fbf:	b8 00 80 00 00       	mov    $0x8000,%eax
5444   938fc4:	48 21 c3             	and    %rax,%rbx
5447   938fc7:	75 11                	jne    938fda <shrink_lruvec+0x545a>
5449   938fc9:	e8 00 00 00 00       	call   938fce <shrink_lruvec+0x544e>	938fca: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
544e   938fce:	e9 5d ff ff ff       	jmp    938f30 <shrink_lruvec+0x53b0>
5453   938fd3:	e8 00 00 00 00       	call   938fd8 <shrink_lruvec+0x5458>	938fd4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5458   938fd8:	eb 05                	jmp    938fdf <shrink_lruvec+0x545f>
545a   938fda:	e8 00 00 00 00       	call   938fdf <shrink_lruvec+0x545f>	938fdb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
545f   938fdf:	4c 89 ef             	mov    %r13,%rdi
5462   938fe2:	be 08 00 00 00       	mov    $0x8,%esi
5467   938fe7:	e8 00 00 00 00       	call   938fec <shrink_lruvec+0x546c>	938fe8: R_X86_64_PLT32	__kasan_check_write-0x4
546c   938fec:	f0 41 80 65 00 df    	lock andb $0xdf,0x0(%r13)
5472   938ff2:	4c 89 e0             	mov    %r12,%rax
5475   938ff5:	48 c1 e8 03          	shr    $0x3,%rax
5479   938ff9:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
5483   939003:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
5487   939007:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
548c   93900c:	74 08                	je     939016 <shrink_lruvec+0x5496>
548e   93900e:	4c 89 e7             	mov    %r12,%rdi
5491   939011:	e8 00 00 00 00       	call   939016 <shrink_lruvec+0x5496>	939012: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5496   939016:	4d 8b 24 24          	mov    (%r12),%r12
549a   93901a:	48 8d 84 24 d0 03 00 00 	lea    0x3d0(%rsp),%rax
54a2   939022:	4c 39 e0             	cmp    %r12,%rax
54a5   939025:	0f 85 4f fe ff ff    	jne    938e7a <shrink_lruvec+0x52fa>
54ab   93902b:	e8 00 00 00 00       	call   939030 <shrink_lruvec+0x54b0>	93902c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
54b0   939030:	48 8b bc 24 98 01 00 00 	mov    0x198(%rsp),%rdi
54b8   939038:	e8 00 00 00 00       	call   93903d <shrink_lruvec+0x54bd>	939039: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
54bd   93903d:	4c 89 f7             	mov    %r14,%rdi
54c0   939040:	48 8d b4 24 d0 03 00 00 	lea    0x3d0(%rsp),%rsi
54c8   939048:	e8 33 94 01 00       	call   952480 <move_pages_to_lru>
54cd   93904d:	48 8b 84 24 e8 01 00 00 	mov    0x1e8(%rsp),%rax
54d5   939055:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
54d9   939059:	4c 8b b4 24 80 01 00 00 	mov    0x180(%rsp),%r14
54e1   939061:	74 08                	je     93906b <shrink_lruvec+0x54eb>
54e3   939063:	4c 89 f7             	mov    %r14,%rdi
54e6   939066:	e8 00 00 00 00       	call   93906b <shrink_lruvec+0x54eb>	939067: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
54eb   93906b:	4d 8b 36             	mov    (%r14),%r14
54ee   93906e:	49 83 c6 08          	add    $0x8,%r14
54f2   939072:	4c 89 f0             	mov    %r14,%rax
54f5   939075:	48 c1 e8 03          	shr    $0x3,%rax
54f9   939079:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
54fd   93907d:	74 08                	je     939087 <shrink_lruvec+0x5507>
54ff   93907f:	4c 89 f7             	mov    %r14,%rdi
5502   939082:	e8 00 00 00 00       	call   939087 <shrink_lruvec+0x5507>	939083: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5507   939087:	4d 8b 2e             	mov    (%r14),%r13
550a   93908a:	4d 85 ed             	test   %r13,%r13
550d   93908d:	74 52                	je     9390e1 <shrink_lruvec+0x5561>
550f   93908f:	4d 8d a5 90 00 00 00 	lea    0x90(%r13),%r12
5516   939096:	4c 89 e0             	mov    %r12,%rax
5519   939099:	48 c1 e8 03          	shr    $0x3,%rax
551d   93909d:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5527   9390a7:	8a 04 08             	mov    (%rax,%rcx,1),%al
552a   9390aa:	84 c0                	test   %al,%al
552c   9390ac:	0f 85 a8 09 00 00    	jne    939a5a <shrink_lruvec+0x5eda>
5532   9390b2:	41 8b 1c 24          	mov    (%r12),%ebx
5536   9390b6:	31 ff                	xor    %edi,%edi
5538   9390b8:	89 de                	mov    %ebx,%esi
553a   9390ba:	e8 00 00 00 00       	call   9390bf <shrink_lruvec+0x553f>	9390bb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
553f   9390bf:	85 db                	test   %ebx,%ebx
5541   9390c1:	74 25                	je     9390e8 <shrink_lruvec+0x5568>
5543   9390c3:	e8 00 00 00 00       	call   9390c8 <shrink_lruvec+0x5548>	9390c4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5548   9390c8:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
554d   9390cd:	4c 89 ee             	mov    %r13,%rsi
5550   9390d0:	e8 eb 73 01 00       	call   9504c0 <reset_batch_size>
5555   9390d5:	eb 16                	jmp    9390ed <shrink_lruvec+0x556d>
5557   9390d7:	e8 00 00 00 00       	call   9390dc <shrink_lruvec+0x555c>	9390d8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
555c   9390dc:	e9 12 01 00 00       	jmp    9391f3 <shrink_lruvec+0x5673>
5561   9390e1:	e8 00 00 00 00       	call   9390e6 <shrink_lruvec+0x5566>	9390e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5566   9390e6:	eb 05                	jmp    9390ed <shrink_lruvec+0x556d>
5568   9390e8:	e8 00 00 00 00       	call   9390ed <shrink_lruvec+0x556d>	9390e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
556d   9390ed:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
5572   9390f2:	48 89 d0             	mov    %rdx,%rax
5575   9390f5:	48 c1 e8 03          	shr    $0x3,%rax
5579   9390f9:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
5583   939103:	42 8a 04 28          	mov    (%rax,%r13,1),%al
5587   939107:	84 c0                	test   %al,%al
5589   939109:	0f 85 67 08 00 00    	jne    939976 <shrink_lruvec+0x5df6>
558f   93910f:	31 db                	xor    %ebx,%ebx
5591   939111:	8b 32                	mov    (%rdx),%esi
5593   939113:	b8 00 00 02 00       	mov    $0x20000,%eax
5598   939118:	21 c6                	and    %eax,%esi
559a   93911a:	0f 94 c3             	sete   %bl
559d   93911d:	31 ff                	xor    %edi,%edi
559f   93911f:	e8 00 00 00 00       	call   939124 <shrink_lruvec+0x55a4>	939120: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
55a4   939124:	83 cb 16             	or     $0x16,%ebx
55a7   939127:	4c 63 74 24 28       	movslq 0x28(%rsp),%r14
55ac   93912c:	48 8b bc 24 30 02 00 00 	mov    0x230(%rsp),%rdi
55b4   939134:	89 de                	mov    %ebx,%esi
55b6   939136:	4c 89 f2             	mov    %r14,%rdx
55b9   939139:	e8 00 00 00 00       	call   93913e <shrink_lruvec+0x55be>	93913a: R_X86_64_PLT32	__count_memcg_events-0x4
55be   93913e:	48 8b bc 24 98 01 00 00 	mov    0x198(%rsp),%rdi
55c6   939146:	e8 00 00 00 00       	call   93914b <shrink_lruvec+0x55cb>	939147: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
55cb   93914b:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
55d3   939153:	42 8a 04 28          	mov    (%rax,%r13,1),%al
55d7   939157:	84 c0                	test   %al,%al
55d9   939159:	0f 85 3b 08 00 00    	jne    93999a <shrink_lruvec+0x5e1a>
55df   93915f:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 939165 <shrink_lruvec+0x55e5>	939161: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
55e5   939165:	bf 01 00 00 00       	mov    $0x1,%edi
55ea   93916a:	89 de                	mov    %ebx,%esi
55ec   93916c:	e8 00 00 00 00       	call   939171 <shrink_lruvec+0x55f1>	93916d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
55f1   939171:	85 db                	test   %ebx,%ebx
55f3   939173:	7e 17                	jle    93918c <shrink_lruvec+0x560c>
55f5   939175:	e8 00 00 00 00       	call   93917a <shrink_lruvec+0x55fa>	939176: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
55fa   93917a:	48 8d 9c 24 d0 03 00 00 	lea    0x3d0(%rsp),%rbx
5602   939182:	48 89 df             	mov    %rbx,%rdi
5605   939185:	e8 00 00 00 00       	call   93918a <shrink_lruvec+0x560a>	939186: R_X86_64_PLT32	__mem_cgroup_uncharge_list-0x4
560a   93918a:	eb 0d                	jmp    939199 <shrink_lruvec+0x5619>
560c   93918c:	e8 00 00 00 00       	call   939191 <shrink_lruvec+0x5611>	93918d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5611   939191:	48 8d 9c 24 d0 03 00 00 	lea    0x3d0(%rsp),%rbx
5619   939199:	48 89 df             	mov    %rbx,%rdi
561c   93919c:	e8 00 00 00 00       	call   9391a1 <shrink_lruvec+0x5621>	93919d: R_X86_64_PLT32	free_unref_page_list-0x4
5621   9391a1:	48 8b 84 24 c0 01 00 00 	mov    0x1c0(%rsp),%rax
5629   9391a9:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
562e   9391ae:	48 8b 9c 24 d8 00 00 00 	mov    0xd8(%rsp),%rbx
5636   9391b6:	74 08                	je     9391c0 <shrink_lruvec+0x5640>
5638   9391b8:	48 89 df             	mov    %rbx,%rdi
563b   9391bb:	e8 00 00 00 00       	call   9391c0 <shrink_lruvec+0x5640>	9391bc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5640   9391c0:	4c 01 33             	add    %r14,(%rbx)
5643   9391c3:	31 ff                	xor    %edi,%edi
5645   9391c5:	48 8b 5c 24 60       	mov    0x60(%rsp),%rbx
564a   9391ca:	89 de                	mov    %ebx,%esi
564c   9391cc:	e8 00 00 00 00       	call   9391d1 <shrink_lruvec+0x5651>	9391cd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5651   9391d1:	85 db                	test   %ebx,%ebx
5653   9391d3:	8b 8c 24 90 01 00 00 	mov    0x190(%rsp),%ecx
565a   9391da:	0f b6 c9             	movzbl %cl,%ecx
565d   9391dd:	b8 01 00 00 00       	mov    $0x1,%eax
5662   9391e2:	0f 44 c8             	cmove  %eax,%ecx
5665   9391e5:	89 8c 24 90 01 00 00 	mov    %ecx,0x190(%rsp)
566c   9391ec:	8b 9c 24 d0 00 00 00 	mov    0xd0(%rsp),%ebx
5673   9391f3:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
5678   9391f8:	44 2b 74 24 30       	sub    0x30(%rsp),%r14d
567d   9391fd:	bf 01 00 00 00       	mov    $0x1,%edi
5682   939202:	44 89 f6             	mov    %r14d,%esi
5685   939205:	e8 00 00 00 00       	call   93920a <shrink_lruvec+0x568a>	939206: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
568a   93920a:	0f b6 44 24 10       	movzbl 0x10(%rsp),%eax
568f   93920f:	01 c3                	add    %eax,%ebx
5691   939211:	31 ff                	xor    %edi,%edi
5693   939213:	89 de                	mov    %ebx,%esi
5695   939215:	e8 00 00 00 00       	call   93921a <shrink_lruvec+0x569a>	939216: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
569a   93921a:	41 83 fe 01          	cmp    $0x1,%r14d
569e   93921e:	0f 84 ea 0a 00 00    	je     939d0e <shrink_lruvec+0x618e>
56a4   939224:	85 db                	test   %ebx,%ebx
56a6   939226:	0f 84 e2 0a 00 00    	je     939d0e <shrink_lruvec+0x618e>
56ac   93922c:	48 63 c3             	movslq %ebx,%rax
56af   93922f:	48 8b 9c 24 40 02 00 00 	mov    0x240(%rsp),%rbx
56b7   939237:	48 01 c3             	add    %rax,%rbx
56ba   93923a:	48 89 df             	mov    %rbx,%rdi
56bd   93923d:	4c 8b b4 24 90 02 00 00 	mov    0x290(%rsp),%r14
56c5   939245:	4c 89 f6             	mov    %r14,%rsi
56c8   939248:	e8 00 00 00 00       	call   93924d <shrink_lruvec+0x56cd>	939249: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
56cd   93924d:	48 89 d8             	mov    %rbx,%rax
56d0   939250:	48 89 9c 24 40 02 00 00 	mov    %rbx,0x240(%rsp)
56d8   939258:	4c 39 f3             	cmp    %r14,%rbx
56db   93925b:	0f 83 b7 0a 00 00    	jae    939d18 <shrink_lruvec+0x6198>
56e1   939261:	0f b6 b4 24 90 01 00 00 	movzbl 0x190(%rsp),%esi
56e9   939269:	31 ff                	xor    %edi,%edi
56eb   93926b:	e8 00 00 00 00       	call   939270 <shrink_lruvec+0x56f0>	93926c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
56f0   939270:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
56f8   939278:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
56fd   93927d:	48 8b 9c 24 e0 00 00 00 	mov    0xe0(%rsp),%rbx
5705   939285:	74 08                	je     93928f <shrink_lruvec+0x570f>
5707   939287:	48 89 df             	mov    %rbx,%rdi
570a   93928a:	e8 00 00 00 00       	call   93928f <shrink_lruvec+0x570f>	93928b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
570f   93928f:	4c 8b 33             	mov    (%rbx),%r14
5712   939292:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
5717   939297:	48 89 d0             	mov    %rdx,%rax
571a   93929a:	48 c1 e8 03          	shr    $0x3,%rax
571e   93929e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
5723   9392a3:	42 8a 04 28          	mov    (%rax,%r13,1),%al
5727   9392a7:	84 c0                	test   %al,%al
5729   9392a9:	0f 85 88 06 00 00    	jne    939937 <shrink_lruvec+0x5db7>
572f   9392af:	8b 1a                	mov    (%rdx),%ebx
5731   9392b1:	be 00 00 02 00       	mov    $0x20000,%esi
5736   9392b6:	21 de                	and    %ebx,%esi
5738   9392b8:	31 ff                	xor    %edi,%edi
573a   9392ba:	e8 00 00 00 00       	call   9392bf <shrink_lruvec+0x573f>	9392bb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
573f   9392bf:	b8 00 00 02 00       	mov    $0x20000,%eax
5744   9392c4:	21 c3                	and    %eax,%ebx
5746   9392c6:	0f 85 db 00 00 00    	jne    9393a7 <shrink_lruvec+0x5827>
574c   9392cc:	4c 2b b4 24 78 02 00 00 	sub    0x278(%rsp),%r14
5754   9392d4:	bf 01 00 00 00       	mov    $0x1,%edi
5759   9392d9:	4c 89 f6             	mov    %r14,%rsi
575c   9392dc:	e8 00 00 00 00       	call   9392e1 <shrink_lruvec+0x5761>	9392dd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5761   9392e1:	49 83 fe 02          	cmp    $0x2,%r14
5765   9392e5:	0f 83 9b 0a 00 00    	jae    939d86 <shrink_lruvec+0x6206>
576b   9392eb:	48 8b 84 24 c0 01 00 00 	mov    0x1c0(%rsp),%rax
5773   9392f3:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5778   9392f8:	74 0d                	je     939307 <shrink_lruvec+0x5787>
577a   9392fa:	48 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%rdi
5782   939302:	e8 00 00 00 00       	call   939307 <shrink_lruvec+0x5787>	939303: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5787   939307:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
578c   93930c:	4c 8b 77 48          	mov    0x48(%rdi),%r14
5790   939310:	48 8b 84 24 28 02 00 00 	mov    0x228(%rsp),%rax
5798   939318:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
579d   93931d:	74 0a                	je     939329 <shrink_lruvec+0x57a9>
579f   93931f:	e8 00 00 00 00       	call   939324 <shrink_lruvec+0x57a4>	939320: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
57a4   939324:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
57a9   939329:	48 8b 1f             	mov    (%rdi),%rbx
57ac   93932c:	4c 89 f7             	mov    %r14,%rdi
57af   93932f:	48 89 de             	mov    %rbx,%rsi
57b2   939332:	e8 00 00 00 00       	call   939337 <shrink_lruvec+0x57b7>	939333: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
57b7   939337:	80 bc 24 90 01 00 00 00 	cmpb   $0x0,0x190(%rsp)
57bf   93933f:	74 09                	je     93934a <shrink_lruvec+0x57ca>
57c1   939341:	49 39 de             	cmp    %rbx,%r14
57c4   939344:	0f 83 43 0a 00 00    	jae    939d8d <shrink_lruvec+0x620d>
57ca   93934a:	48 8b 9c 24 b8 01 00 00 	mov    0x1b8(%rsp),%rbx
57d2   939352:	48 89 df             	mov    %rbx,%rdi
57d5   939355:	be 08 00 00 00       	mov    $0x8,%esi
57da   93935a:	e8 00 00 00 00       	call   93935f <shrink_lruvec+0x57df>	93935b: R_X86_64_PLT32	__kasan_check_read-0x4
57df   93935f:	48 89 d8             	mov    %rbx,%rax
57e2   939362:	48 c1 e8 03          	shr    $0x3,%rax
57e6   939366:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
57eb   93936b:	74 15                	je     939382 <shrink_lruvec+0x5802>
57ed   93936d:	48 8b bc 24 b8 01 00 00 	mov    0x1b8(%rsp),%rdi
57f5   939375:	e8 00 00 00 00       	call   93937a <shrink_lruvec+0x57fa>	939376: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
57fa   93937a:	48 8b 9c 24 b8 01 00 00 	mov    0x1b8(%rsp),%rbx
5802   939382:	48 8b 1b             	mov    (%rbx),%rbx
5805   939385:	48 89 de             	mov    %rbx,%rsi
5808   939388:	48 83 e6 04          	and    $0x4,%rsi
580c   93938c:	31 ff                	xor    %edi,%edi
580e   93938e:	e8 00 00 00 00       	call   939393 <shrink_lruvec+0x5813>	93938f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5813   939393:	48 83 e3 04          	and    $0x4,%rbx
5817   939397:	0f 85 8a 00 00 00    	jne    939427 <shrink_lruvec+0x58a7>
581d   93939d:	e8 00 00 00 00       	call   9393a2 <shrink_lruvec+0x5822>	93939e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5822   9393a2:	e9 c3 00 00 00       	jmp    93946a <shrink_lruvec+0x58ea>
5827   9393a7:	48 8b 84 24 c0 01 00 00 	mov    0x1c0(%rsp),%rax
582f   9393af:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5834   9393b4:	48 8b 9c 24 d8 00 00 00 	mov    0xd8(%rsp),%rbx
583c   9393bc:	74 08                	je     9393c6 <shrink_lruvec+0x5846>
583e   9393be:	48 89 df             	mov    %rbx,%rdi
5841   9393c1:	e8 00 00 00 00       	call   9393c6 <shrink_lruvec+0x5846>	9393c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5846   9393c6:	4c 8b 33             	mov    (%rbx),%r14
5849   9393c9:	48 8b bc 24 70 02 00 00 	mov    0x270(%rsp),%rdi
5851   9393d1:	48 89 f8             	mov    %rdi,%rax
5854   9393d4:	48 c1 e8 03          	shr    $0x3,%rax
5858   9393d8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
585d   9393dd:	74 05                	je     9393e4 <shrink_lruvec+0x5864>
585f   9393df:	e8 00 00 00 00       	call   9393e4 <shrink_lruvec+0x5864>	9393e0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5864   9393e4:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
5869   9393e9:	4c 2b 77 30          	sub    0x30(%rdi),%r14
586d   9393ed:	48 8b 84 24 28 02 00 00 	mov    0x228(%rsp),%rax
5875   9393f5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
587a   9393fa:	74 0a                	je     939406 <shrink_lruvec+0x5886>
587c   9393fc:	e8 00 00 00 00       	call   939401 <shrink_lruvec+0x5881>	9393fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5881   939401:	48 8b 7c 24 58       	mov    0x58(%rsp),%rdi
5886   939406:	48 8b 1f             	mov    (%rdi),%rbx
5889   939409:	4c 89 f7             	mov    %r14,%rdi
588c   93940c:	48 89 de             	mov    %rbx,%rsi
588f   93940f:	e8 00 00 00 00       	call   939414 <shrink_lruvec+0x5894>	939410: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
5894   939414:	49 39 de             	cmp    %rbx,%r14
5897   939417:	0f 82 c2 ae ff ff    	jb     9342df <shrink_lruvec+0x75f>
589d   93941d:	e8 00 00 00 00       	call   939422 <shrink_lruvec+0x58a2>	93941e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
58a2   939422:	e9 83 00 00 00       	jmp    9394aa <shrink_lruvec+0x592a>
58a7   939427:	48 8b 9c 24 68 02 00 00 	mov    0x268(%rsp),%rbx
58af   93942f:	48 89 d8             	mov    %rbx,%rax
58b2   939432:	48 c1 e8 03          	shr    $0x3,%rax
58b6   939436:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
58bb   93943b:	74 08                	je     939445 <shrink_lruvec+0x58c5>
58bd   93943d:	48 89 df             	mov    %rbx,%rdi
58c0   939440:	e8 00 00 00 00       	call   939445 <shrink_lruvec+0x58c5>	939441: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
58c5   939445:	48 8b 1b             	mov    (%rbx),%rbx
58c8   939448:	be 00 01 00 00       	mov    $0x100,%esi
58cd   93944d:	48 21 de             	and    %rbx,%rsi
58d0   939450:	31 ff                	xor    %edi,%edi
58d2   939452:	e8 00 00 00 00       	call   939457 <shrink_lruvec+0x58d7>	939453: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
58d7   939457:	b8 00 01 00 00       	mov    $0x100,%eax
58dc   93945c:	48 21 c3             	and    %rax,%rbx
58df   93945f:	0f 85 7f 30 00 00    	jne    93c4e4 <shrink_lruvec+0x8964>
58e5   939465:	e8 00 00 00 00       	call   93946a <shrink_lruvec+0x58ea>	939466: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
58ea   93946a:	48 8b 8c 24 88 01 00 00 	mov    0x188(%rsp),%rcx
58f2   939472:	48 89 c8             	mov    %rcx,%rax
58f5   939475:	48 c1 e8 03          	shr    $0x3,%rax
58f9   939479:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
58fe   93947e:	74 15                	je     939495 <shrink_lruvec+0x5915>
5900   939480:	48 8b bc 24 88 01 00 00 	mov    0x188(%rsp),%rdi
5908   939488:	e8 00 00 00 00       	call   93948d <shrink_lruvec+0x590d>	939489: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
590d   93948d:	48 8b 8c 24 88 01 00 00 	mov    0x188(%rsp),%rcx
5915   939495:	48 83 39 00          	cmpq   $0x0,(%rcx)
5919   939499:	74 0a                	je     9394a5 <shrink_lruvec+0x5925>
591b   93949b:	e8 00 00 00 00       	call   9394a0 <shrink_lruvec+0x5920>	93949c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5920   9394a0:	e9 3f ae ff ff       	jmp    9342e4 <shrink_lruvec+0x764>
5925   9394a5:	e8 00 00 00 00       	call   9394aa <shrink_lruvec+0x592a>	9394a6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
592a   9394aa:	48 8b 9c 24 20 02 00 00 	mov    0x220(%rsp),%rbx
5932   9394b2:	48 89 d8             	mov    %rbx,%rax
5935   9394b5:	48 c1 e8 03          	shr    $0x3,%rax
5939   9394b9:	42 8a 04 28          	mov    (%rax,%r13,1),%al
593d   9394bd:	84 c0                	test   %al,%al
593f   9394bf:	0f 85 7b 05 00 00    	jne    939a40 <shrink_lruvec+0x5ec0>
5945   9394c5:	0f b6 1b             	movzbl (%rbx),%ebx
5948   9394c8:	bf 0a 00 00 00       	mov    $0xa,%edi
594d   9394cd:	89 de                	mov    %ebx,%esi
594f   9394cf:	e8 00 00 00 00       	call   9394d4 <shrink_lruvec+0x5954>	9394d0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
5954   9394d4:	80 fb 0b             	cmp    $0xb,%bl
5957   9394d7:	7c 0a                	jl     9394e3 <shrink_lruvec+0x5963>
5959   9394d9:	e8 00 00 00 00       	call   9394de <shrink_lruvec+0x595e>	9394da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
595e   9394de:	e9 01 ae ff ff       	jmp    9342e4 <shrink_lruvec+0x764>
5963   9394e3:	48 8b 94 24 18 01 00 00 	mov    0x118(%rsp),%rdx
596b   9394eb:	48 89 d0             	mov    %rdx,%rax
596e   9394ee:	48 c1 e8 03          	shr    $0x3,%rax
5972   9394f2:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
5977   9394f7:	42 8a 04 28          	mov    (%rax,%r13,1),%al
597b   9394fb:	84 c0                	test   %al,%al
597d   9394fd:	0f 85 27 06 00 00    	jne    939b2a <shrink_lruvec+0x5faa>
5983   939503:	0f b6 1a             	movzbl (%rdx),%ebx
5986   939506:	31 ff                	xor    %edi,%edi
5988   939508:	89 de                	mov    %ebx,%esi
598a   93950a:	e8 00 00 00 00       	call   93950f <shrink_lruvec+0x598f>	93950b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
598f   93950f:	84 db                	test   %bl,%bl
5991   939511:	0f 88 e1 2f 00 00    	js     93c4f8 <shrink_lruvec+0x8978>
5997   939517:	41 bd 80 06 00 00    	mov    $0x680,%r13d
599d   93951d:	45 31 ff             	xor    %r15d,%r15d
59a0   939520:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
59a5   939525:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
59af   93952f:	48 8b 8c 24 08 01 00 00 	mov    0x108(%rsp),%rcx
59b7   939537:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
59bb   93953b:	74 08                	je     939545 <shrink_lruvec+0x59c5>
59bd   93953d:	48 89 df             	mov    %rbx,%rdi
59c0   939540:	e8 00 00 00 00       	call   939545 <shrink_lruvec+0x59c5>	939541: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
59c5   939545:	4c 8b 33             	mov    (%rbx),%r14
59c8   939548:	bf 04 00 00 00       	mov    $0x4,%edi
59cd   93954d:	4c 89 fe             	mov    %r15,%rsi
59d0   939550:	e8 00 00 00 00       	call   939555 <shrink_lruvec+0x59d5>	939551: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
59d5   939555:	49 83 ff 03          	cmp    $0x3,%r15
59d9   939559:	0f 87 e1 01 00 00    	ja     939740 <shrink_lruvec+0x5bc0>
59df   93955f:	e8 00 00 00 00       	call   939564 <shrink_lruvec+0x59e4>	939560: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
59e4   939564:	4b 8d 1c 2e          	lea    (%r14,%r13,1),%rbx
59e8   939568:	48 81 c3 f8 f9 ff ff 	add    $0xfffffffffffff9f8,%rbx
59ef   93956f:	48 89 df             	mov    %rbx,%rdi
59f2   939572:	be 08 00 00 00       	mov    $0x8,%esi
59f7   939577:	e8 00 00 00 00       	call   93957c <shrink_lruvec+0x59fc>	939578: R_X86_64_PLT32	__kasan_check_read-0x4
59fc   93957c:	48 89 d8             	mov    %rbx,%rax
59ff   93957f:	48 c1 e8 03          	shr    $0x3,%rax
5a03   939583:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5a0d   93958d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5a11   939591:	74 08                	je     93959b <shrink_lruvec+0x5a1b>
5a13   939593:	48 89 df             	mov    %rbx,%rdi
5a16   939596:	e8 00 00 00 00       	call   93959b <shrink_lruvec+0x5a1b>	939597: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a1b   93959b:	4b 8b 9c 2e f8 f9 ff ff 	mov    -0x608(%r14,%r13,1),%rbx
5a23   9395a3:	31 ff                	xor    %edi,%edi
5a25   9395a5:	48 89 de             	mov    %rbx,%rsi
5a28   9395a8:	e8 00 00 00 00       	call   9395ad <shrink_lruvec+0x5a2d>	9395a9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5a2d   9395ad:	48 85 db             	test   %rbx,%rbx
5a30   9395b0:	0f 84 fd 00 00 00    	je     9396b3 <shrink_lruvec+0x5b33>
5a36   9395b6:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
5a3b   9395bb:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
5a45   9395c5:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
5a4a   9395ca:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
5a4f   9395cf:	84 c0                	test   %al,%al
5a51   9395d1:	0f 85 47 01 00 00    	jne    93971e <shrink_lruvec+0x5b9e>
5a57   9395d7:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
5a5c   9395dc:	8b 18                	mov    (%rax),%ebx
5a5e   9395de:	b8 00 00 02 00       	mov    $0x20000,%eax
5a63   9395e3:	21 c3                	and    %eax,%ebx
5a65   9395e5:	31 ff                	xor    %edi,%edi
5a67   9395e7:	89 de                	mov    %ebx,%esi
5a69   9395e9:	e8 00 00 00 00       	call   9395ee <shrink_lruvec+0x5a6e>	9395ea: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5a6e   9395ee:	c1 eb 11             	shr    $0x11,%ebx
5a71   9395f1:	4f 8d 3c 2e          	lea    (%r14,%r13,1),%r15
5a75   9395f5:	49 8d 1c df          	lea    (%r15,%rbx,8),%rbx
5a79   9395f9:	48 81 c3 88 f9 ff ff 	add    $0xfffffffffffff988,%rbx
5a80   939600:	48 89 d8             	mov    %rbx,%rax
5a83   939603:	48 c1 e8 03          	shr    $0x3,%rax
5a87   939607:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
5a8c   93960c:	74 08                	je     939616 <shrink_lruvec+0x5a96>
5a8e   93960e:	48 89 df             	mov    %rbx,%rdi
5a91   939611:	e8 00 00 00 00       	call   939616 <shrink_lruvec+0x5a96>	939612: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5a96   939616:	4c 8b 23             	mov    (%rbx),%r12
5a99   939619:	4b 8d 3c 2e          	lea    (%r14,%r13,1),%rdi
5a9d   93961d:	48 81 c7 a0 f9 ff ff 	add    $0xfffffffffffff9a0,%rdi
5aa4   939624:	48 89 f8             	mov    %rdi,%rax
5aa7   939627:	48 c1 e8 03          	shr    $0x3,%rax
5aab   93962b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5ab5   939635:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5ab9   939639:	74 05                	je     939640 <shrink_lruvec+0x5ac0>
5abb   93963b:	e8 00 00 00 00       	call   939640 <shrink_lruvec+0x5ac0>	93963c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5ac0   939640:	4f 03 a4 2e a0 f9 ff ff 	add    -0x660(%r14,%r13,1),%r12
5ac8   939648:	4c 89 ff             	mov    %r15,%rdi
5acb   93964b:	be 08 00 00 00       	mov    $0x8,%esi
5ad0   939650:	e8 00 00 00 00       	call   939655 <shrink_lruvec+0x5ad5>	939651: R_X86_64_PLT32	__kasan_check_read-0x4
5ad5   939655:	4c 89 f8             	mov    %r15,%rax
5ad8   939658:	48 c1 e8 03          	shr    $0x3,%rax
5adc   93965c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
5ae6   939666:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
5aea   93966a:	74 08                	je     939674 <shrink_lruvec+0x5af4>
5aec   93966c:	4c 89 ff             	mov    %r15,%rdi
5aef   93966f:	e8 00 00 00 00       	call   939674 <shrink_lruvec+0x5af4>	939670: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5af4   939674:	4b 8b 1c 2e          	mov    (%r14,%r13,1),%rbx
5af8   939678:	31 ff                	xor    %edi,%edi
5afa   93967a:	48 89 de             	mov    %rbx,%rsi
5afd   93967d:	e8 00 00 00 00       	call   939682 <shrink_lruvec+0x5b02>	93967e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
5b02   939682:	48 85 db             	test   %rbx,%rbx
5b05   939685:	b8 00 00 00 00       	mov    $0x0,%eax
5b0a   93968a:	48 0f 48 d8          	cmovs  %rax,%rbx
5b0e   93968e:	4c 89 e7             	mov    %r12,%rdi
5b11   939691:	48 89 de             	mov    %rbx,%rsi
5b14   939694:	e8 00 00 00 00       	call   939699 <shrink_lruvec+0x5b19>	939695: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
5b19   939699:	49 39 dc             	cmp    %rbx,%r12
5b1c   93969c:	0f 87 b7 00 00 00    	ja     939759 <shrink_lruvec+0x5bd9>
5b22   9396a2:	e8 00 00 00 00       	call   9396a7 <shrink_lruvec+0x5b27>	9396a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5b27   9396a7:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
5b2c   9396ac:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
5b31   9396b1:	eb 0a                	jmp    9396bd <shrink_lruvec+0x5b3d>
5b33   9396b3:	e8 00 00 00 00       	call   9396b8 <shrink_lruvec+0x5b38>	9396b4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5b38   9396b8:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
5b3d   9396bd:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5b47   9396c7:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
5b4c   9396cc:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
5b50   9396d0:	84 c0                	test   %al,%al
5b52   9396d2:	48 8b 94 24 18 01 00 00 	mov    0x118(%rsp),%rdx
5b5a   9396da:	75 22                	jne    9396fe <shrink_lruvec+0x5b7e>
5b5c   9396dc:	48 0f be 02          	movsbq (%rdx),%rax
5b60   9396e0:	49 39 c7             	cmp    %rax,%r15
5b63   9396e3:	0f 8d cd 05 00 00    	jge    939cb6 <shrink_lruvec+0x6136>
5b69   9396e9:	e8 00 00 00 00       	call   9396ee <shrink_lruvec+0x5b6e>	9396ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5b6e   9396ee:	49 81 c5 00 07 00 00 	add    $0x700,%r13
5b75   9396f5:	49 83 c7 01          	add    $0x1,%r15
5b79   9396f9:	e9 27 fe ff ff       	jmp    939525 <shrink_lruvec+0x59a5>
5b7e   9396fe:	89 d1                	mov    %edx,%ecx
5b80   939700:	80 e1 07             	and    $0x7,%cl
5b83   939703:	38 c1                	cmp    %al,%cl
5b85   939705:	7c d5                	jl     9396dc <shrink_lruvec+0x5b5c>
5b87   939707:	48 8b bc 24 18 01 00 00 	mov    0x118(%rsp),%rdi
5b8f   93970f:	e8 00 00 00 00       	call   939714 <shrink_lruvec+0x5b94>	939710: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5b94   939714:	48 8b 94 24 18 01 00 00 	mov    0x118(%rsp),%rdx
5b9c   93971c:	eb be                	jmp    9396dc <shrink_lruvec+0x5b5c>
5b9e   93971e:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
5ba3   939723:	80 e1 07             	and    $0x7,%cl
5ba6   939726:	80 c1 03             	add    $0x3,%cl
5ba9   939729:	38 c1                	cmp    %al,%cl
5bab   93972b:	0f 8c a6 fe ff ff    	jl     9395d7 <shrink_lruvec+0x5a57>
5bb1   939731:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5bb6   939736:	e8 00 00 00 00       	call   93973b <shrink_lruvec+0x5bbb>	939737: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5bbb   93973b:	e9 97 fe ff ff       	jmp    9395d7 <shrink_lruvec+0x5a57>
5bc0   939740:	e8 00 00 00 00       	call   939745 <shrink_lruvec+0x5bc5>	939741: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5bc5   939745:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939748: R_X86_64_32S	.data+0x58f980
5bcc   93974c:	4c 89 fe             	mov    %r15,%rsi
5bcf   93974f:	e8 00 00 00 00       	call   939754 <shrink_lruvec+0x5bd4>	939750: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
5bd4   939754:	e9 0b fe ff ff       	jmp    939564 <shrink_lruvec+0x59e4>
5bd9   939759:	e8 00 00 00 00       	call   93975e <shrink_lruvec+0x5bde>	93975a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5bde   93975e:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
5be8   939768:	e9 77 ab ff ff       	jmp    9342e4 <shrink_lruvec+0x764>
5bed   93976d:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
5bf5   939775:	42 8a 04 28          	mov    (%rax,%r13,1),%al
5bf9   939779:	84 c0                	test   %al,%al
5bfb   93977b:	0f 85 e9 04 00 00    	jne    939c6a <shrink_lruvec+0x60ea>
5c01   939781:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 939787 <shrink_lruvec+0x5c07>	939783: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
5c07   939787:	bf 01 00 00 00       	mov    $0x1,%edi
5c0c   93978c:	89 de                	mov    %ebx,%esi
5c0e   93978e:	e8 00 00 00 00       	call   939793 <shrink_lruvec+0x5c13>	93978f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5c13   939793:	85 db                	test   %ebx,%ebx
5c15   939795:	0f 8e bf 00 00 00    	jle    93985a <shrink_lruvec+0x5cda>
5c1b   93979b:	e8 00 00 00 00       	call   9397a0 <shrink_lruvec+0x5c20>	93979c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c20   9397a0:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
5c2a   9397aa:	48 8b 84 24 c8 01 00 00 	mov    0x1c8(%rsp),%rax
5c32   9397b2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
5c37   9397b7:	74 0c                	je     9397c5 <shrink_lruvec+0x5c45>
5c39   9397b9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9397bc: R_X86_64_32S	root_mem_cgroup
5c40   9397c0:	e8 00 00 00 00       	call   9397c5 <shrink_lruvec+0x5c45>	9397c1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5c45   9397c5:	49 8d 9c 24 08 06 00 00 	lea    0x608(%r12),%rbx
5c4d   9397cd:	4c 39 25 00 00 00 00 	cmp    %r12,0x0(%rip)        # 9397d4 <shrink_lruvec+0x5c54>	9397d0: R_X86_64_PC32	root_mem_cgroup-0x4
5c54   9397d4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	9397d7: R_X86_64_32S	vm_swappiness
5c5b   9397db:	48 0f 44 d8          	cmove  %rax,%rbx
5c5f   9397df:	e9 62 ad ff ff       	jmp    934546 <shrink_lruvec+0x9c6>
5c64   9397e4:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
5c6c   9397ec:	42 8a 04 28          	mov    (%rax,%r13,1),%al
5c70   9397f0:	84 c0                	test   %al,%al
5c72   9397f2:	0f 85 98 04 00 00    	jne    939c90 <shrink_lruvec+0x6110>
5c78   9397f8:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 9397fe <shrink_lruvec+0x5c7e>	9397fa: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
5c7e   9397fe:	bf 01 00 00 00       	mov    $0x1,%edi
5c83   939803:	89 de                	mov    %ebx,%esi
5c85   939805:	e8 00 00 00 00       	call   93980a <shrink_lruvec+0x5c8a>	939806: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
5c8a   93980a:	85 db                	test   %ebx,%ebx
5c8c   93980c:	0f 8e 49 01 00 00    	jle    93995b <shrink_lruvec+0x5ddb>
5c92   939812:	e8 00 00 00 00       	call   939817 <shrink_lruvec+0x5c97>	939813: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5c97   939817:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
5ca1   939821:	48 8b 8c 24 c8 01 00 00 	mov    0x1c8(%rsp),%rcx
5ca9   939829:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
5cad   93982d:	74 0c                	je     93983b <shrink_lruvec+0x5cbb>
5caf   93982f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939832: R_X86_64_32S	root_mem_cgroup
5cb6   939836:	e8 00 00 00 00       	call   93983b <shrink_lruvec+0x5cbb>	939837: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
5cbb   93983b:	49 8d 9c 24 08 06 00 00 	lea    0x608(%r12),%rbx
5cc3   939843:	4c 39 25 00 00 00 00 	cmp    %r12,0x0(%rip)        # 93984a <shrink_lruvec+0x5cca>	939846: R_X86_64_PC32	root_mem_cgroup-0x4
5cca   93984a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93984d: R_X86_64_32S	vm_swappiness
5cd1   939851:	48 0f 44 d8          	cmove  %rax,%rbx
5cd5   939855:	e9 0d 01 00 00       	jmp    939967 <shrink_lruvec+0x5de7>
5cda   93985a:	e8 00 00 00 00       	call   93985f <shrink_lruvec+0x5cdf>	93985b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5cdf   93985f:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	939862: R_X86_64_32S	vm_swappiness
5ce6   939866:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
5cf0   939870:	e9 d1 ac ff ff       	jmp    934546 <shrink_lruvec+0x9c6>
5cf5   939875:	89 f9                	mov    %edi,%ecx
5cf7   939877:	80 e1 07             	and    $0x7,%cl
5cfa   93987a:	80 c1 01             	add    $0x1,%cl
5cfd   93987d:	38 c1                	cmp    %al,%cl
5cff   93987f:	0f 8c 9a aa ff ff    	jl     93431f <shrink_lruvec+0x79f>
5d05   939885:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
5d0d   93988d:	e8 00 00 00 00       	call   939892 <shrink_lruvec+0x5d12>	93988e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5d12   939892:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
5d1a   93989a:	e9 80 aa ff ff       	jmp    93431f <shrink_lruvec+0x79f>
5d1f   93989f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9398a2: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5d26   9398a6:	80 e1 07             	and    $0x7,%cl
5d29   9398a9:	80 c1 03             	add    $0x3,%cl
5d2c   9398ac:	38 c1                	cmp    %al,%cl
5d2e   9398ae:	0f 8c 30 ae ff ff    	jl     9346e4 <shrink_lruvec+0xb64>
5d34   9398b4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9398b7: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5d3b   9398bb:	e8 00 00 00 00       	call   9398c0 <shrink_lruvec+0x5d40>	9398bc: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d40   9398c0:	e9 1f ae ff ff       	jmp    9346e4 <shrink_lruvec+0xb64>
5d45   9398c5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9398c8: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5d4c   9398cc:	80 e1 07             	and    $0x7,%cl
5d4f   9398cf:	80 c1 03             	add    $0x3,%cl
5d52   9398d2:	38 c1                	cmp    %al,%cl
5d54   9398d4:	0f 8c 4a af ff ff    	jl     934824 <shrink_lruvec+0xca4>
5d5a   9398da:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9398dd: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5d61   9398e1:	e8 00 00 00 00       	call   9398e6 <shrink_lruvec+0x5d66>	9398e2: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d66   9398e6:	e9 39 af ff ff       	jmp    934824 <shrink_lruvec+0xca4>
5d6b   9398eb:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9398ee: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5d72   9398f2:	80 e1 07             	and    $0x7,%cl
5d75   9398f5:	80 c1 03             	add    $0x3,%cl
5d78   9398f8:	38 c1                	cmp    %al,%cl
5d7a   9398fa:	0f 8c 14 b0 ff ff    	jl     934914 <shrink_lruvec+0xd94>
5d80   939900:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939903: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5d87   939907:	e8 00 00 00 00       	call   93990c <shrink_lruvec+0x5d8c>	939908: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5d8c   93990c:	e9 03 b0 ff ff       	jmp    934914 <shrink_lruvec+0xd94>
5d91   939911:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939914: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5d98   939918:	80 e1 07             	and    $0x7,%cl
5d9b   93991b:	80 c1 03             	add    $0x3,%cl
5d9e   93991e:	38 c1                	cmp    %al,%cl
5da0   939920:	0f 8c 1b b2 ff ff    	jl     934b41 <shrink_lruvec+0xfc1>
5da6   939926:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939929: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5dad   93992d:	e8 00 00 00 00       	call   939932 <shrink_lruvec+0x5db2>	93992e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5db2   939932:	e9 0a b2 ff ff       	jmp    934b41 <shrink_lruvec+0xfc1>
5db7   939937:	89 d1                	mov    %edx,%ecx
5db9   939939:	80 e1 07             	and    $0x7,%cl
5dbc   93993c:	80 c1 03             	add    $0x3,%cl
5dbf   93993f:	38 c1                	cmp    %al,%cl
5dc1   939941:	0f 8c 68 f9 ff ff    	jl     9392af <shrink_lruvec+0x572f>
5dc7   939947:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5dcc   93994c:	e8 00 00 00 00       	call   939951 <shrink_lruvec+0x5dd1>	93994d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5dd1   939951:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
5dd6   939956:	e9 54 f9 ff ff       	jmp    9392af <shrink_lruvec+0x572f>
5ddb   93995b:	e8 00 00 00 00       	call   939960 <shrink_lruvec+0x5de0>	93995c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
5de0   939960:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	939963: R_X86_64_32S	vm_swappiness
5de7   939967:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
5df1   939971:	e9 e6 ac ff ff       	jmp    93465c <shrink_lruvec+0xadc>
5df6   939976:	89 d1                	mov    %edx,%ecx
5df8   939978:	80 e1 07             	and    $0x7,%cl
5dfb   93997b:	80 c1 03             	add    $0x3,%cl
5dfe   93997e:	38 c1                	cmp    %al,%cl
5e00   939980:	0f 8c 89 f7 ff ff    	jl     93910f <shrink_lruvec+0x558f>
5e06   939986:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5e0b   93998b:	e8 00 00 00 00       	call   939990 <shrink_lruvec+0x5e10>	93998c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e10   939990:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
5e15   939995:	e9 75 f7 ff ff       	jmp    93910f <shrink_lruvec+0x558f>
5e1a   93999a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93999d: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5e21   9399a1:	80 e1 07             	and    $0x7,%cl
5e24   9399a4:	80 c1 03             	add    $0x3,%cl
5e27   9399a7:	38 c1                	cmp    %al,%cl
5e29   9399a9:	0f 8c b0 f7 ff ff    	jl     93915f <shrink_lruvec+0x55df>
5e2f   9399af:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9399b2: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5e36   9399b6:	e8 00 00 00 00       	call   9399bb <shrink_lruvec+0x5e3b>	9399b7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e3b   9399bb:	e9 9f f7 ff ff       	jmp    93915f <shrink_lruvec+0x55df>
5e40   9399c0:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	9399c3: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5e47   9399c7:	80 e1 07             	and    $0x7,%cl
5e4a   9399ca:	80 c1 03             	add    $0x3,%cl
5e4d   9399cd:	38 c1                	cmp    %al,%cl
5e4f   9399cf:	0f 8c bc a9 ff ff    	jl     934391 <shrink_lruvec+0x811>
5e55   9399d5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	9399d8: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5e5c   9399dc:	e8 00 00 00 00       	call   9399e1 <shrink_lruvec+0x5e61>	9399dd: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e61   9399e1:	e9 ab a9 ff ff       	jmp    934391 <shrink_lruvec+0x811>
5e66   9399e6:	89 d9                	mov    %ebx,%ecx
5e68   9399e8:	80 e1 07             	and    $0x7,%cl
5e6b   9399eb:	80 c1 03             	add    $0x3,%cl
5e6e   9399ee:	38 c1                	cmp    %al,%cl
5e70   9399f0:	0f 8c 9c aa ff ff    	jl     934492 <shrink_lruvec+0x912>
5e76   9399f6:	48 89 df             	mov    %rbx,%rdi
5e79   9399f9:	e8 00 00 00 00       	call   9399fe <shrink_lruvec+0x5e7e>	9399fa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5e7e   9399fe:	e9 8f aa ff ff       	jmp    934492 <shrink_lruvec+0x912>
5e83   939a03:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939a06: R_X86_64_32S	numa_demotion_enabled
5e8a   939a0a:	80 e1 07             	and    $0x7,%cl
5e8d   939a0d:	38 c1                	cmp    %al,%cl
5e8f   939a0f:	0f 8c 94 aa ff ff    	jl     9344a9 <shrink_lruvec+0x929>
5e95   939a15:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939a18: R_X86_64_32S	numa_demotion_enabled
5e9c   939a1c:	e8 00 00 00 00       	call   939a21 <shrink_lruvec+0x5ea1>	939a1d: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5ea1   939a21:	e9 83 aa ff ff       	jmp    9344a9 <shrink_lruvec+0x929>
5ea6   939a26:	89 d9                	mov    %ebx,%ecx
5ea8   939a28:	80 e1 07             	and    $0x7,%cl
5eab   939a2b:	38 c1                	cmp    %al,%cl
5ead   939a2d:	0f 8c 23 b0 ff ff    	jl     934a56 <shrink_lruvec+0xed6>
5eb3   939a33:	48 89 df             	mov    %rbx,%rdi
5eb6   939a36:	e8 00 00 00 00       	call   939a3b <shrink_lruvec+0x5ebb>	939a37: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5ebb   939a3b:	e9 16 b0 ff ff       	jmp    934a56 <shrink_lruvec+0xed6>
5ec0   939a40:	89 d9                	mov    %ebx,%ecx
5ec2   939a42:	80 e1 07             	and    $0x7,%cl
5ec5   939a45:	38 c1                	cmp    %al,%cl
5ec7   939a47:	0f 8c 78 fa ff ff    	jl     9394c5 <shrink_lruvec+0x5945>
5ecd   939a4d:	48 89 df             	mov    %rbx,%rdi
5ed0   939a50:	e8 00 00 00 00       	call   939a55 <shrink_lruvec+0x5ed5>	939a51: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5ed5   939a55:	e9 6b fa ff ff       	jmp    9394c5 <shrink_lruvec+0x5945>
5eda   939a5a:	44 89 e1             	mov    %r12d,%ecx
5edd   939a5d:	80 e1 07             	and    $0x7,%cl
5ee0   939a60:	80 c1 03             	add    $0x3,%cl
5ee3   939a63:	38 c1                	cmp    %al,%cl
5ee5   939a65:	0f 8c 47 f6 ff ff    	jl     9390b2 <shrink_lruvec+0x5532>
5eeb   939a6b:	4c 89 e7             	mov    %r12,%rdi
5eee   939a6e:	e8 00 00 00 00       	call   939a73 <shrink_lruvec+0x5ef3>	939a6f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ef3   939a73:	e9 3a f6 ff ff       	jmp    9390b2 <shrink_lruvec+0x5532>
5ef8   939a78:	89 d1                	mov    %edx,%ecx
5efa   939a7a:	80 e1 07             	and    $0x7,%cl
5efd   939a7d:	80 c1 03             	add    $0x3,%cl
5f00   939a80:	38 c1                	cmp    %al,%cl
5f02   939a82:	0f 8c 40 b2 ff ff    	jl     934cc8 <shrink_lruvec+0x1148>
5f08   939a88:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
5f0d   939a8d:	e8 00 00 00 00       	call   939a92 <shrink_lruvec+0x5f12>	939a8e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5f12   939a92:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
5f17   939a97:	e9 2c b2 ff ff       	jmp    934cc8 <shrink_lruvec+0x1148>
5f1c   939a9c:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
5f24   939aa4:	80 e1 07             	and    $0x7,%cl
5f27   939aa7:	80 c1 01             	add    $0x1,%cl
5f2a   939aaa:	38 c1                	cmp    %al,%cl
5f2c   939aac:	0f 8c 26 af ff ff    	jl     9349d8 <shrink_lruvec+0xe58>
5f32   939ab2:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
5f3a   939aba:	e8 00 00 00 00       	call   939abf <shrink_lruvec+0x5f3f>	939abb: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
5f3f   939abf:	e9 14 af ff ff       	jmp    9349d8 <shrink_lruvec+0xe58>
5f44   939ac4:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939ac7: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5f4b   939acb:	80 e1 07             	and    $0x7,%cl
5f4e   939ace:	80 c1 03             	add    $0x3,%cl
5f51   939ad1:	38 c1                	cmp    %al,%cl
5f53   939ad3:	0f 8c 20 a9 ff ff    	jl     9343f9 <shrink_lruvec+0x879>
5f59   939ad9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939adc: R_X86_64_32S	memory_cgrp_subsys_enabled_key
5f60   939ae0:	e8 00 00 00 00       	call   939ae5 <shrink_lruvec+0x5f65>	939ae1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5f65   939ae5:	e9 0f a9 ff ff       	jmp    9343f9 <shrink_lruvec+0x879>
5f6a   939aea:	89 d9                	mov    %ebx,%ecx
5f6c   939aec:	80 e1 07             	and    $0x7,%cl
5f6f   939aef:	80 c1 03             	add    $0x3,%cl
5f72   939af2:	38 c1                	cmp    %al,%cl
5f74   939af4:	0f 8c a8 aa ff ff    	jl     9345a2 <shrink_lruvec+0xa22>
5f7a   939afa:	48 89 df             	mov    %rbx,%rdi
5f7d   939afd:	e8 00 00 00 00       	call   939b02 <shrink_lruvec+0x5f82>	939afe: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5f82   939b02:	e9 9b aa ff ff       	jmp    9345a2 <shrink_lruvec+0xa22>
5f87   939b07:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939b0a: R_X86_64_32S	numa_demotion_enabled
5f8e   939b0e:	80 e1 07             	and    $0x7,%cl
5f91   939b11:	38 c1                	cmp    %al,%cl
5f93   939b13:	0f 8c a0 aa ff ff    	jl     9345b9 <shrink_lruvec+0xa39>
5f99   939b19:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939b1c: R_X86_64_32S	numa_demotion_enabled
5fa0   939b20:	e8 00 00 00 00       	call   939b25 <shrink_lruvec+0x5fa5>	939b21: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5fa5   939b25:	e9 8f aa ff ff       	jmp    9345b9 <shrink_lruvec+0xa39>
5faa   939b2a:	89 d1                	mov    %edx,%ecx
5fac   939b2c:	80 e1 07             	and    $0x7,%cl
5faf   939b2f:	38 c1                	cmp    %al,%cl
5fb1   939b31:	0f 8c cc f9 ff ff    	jl     939503 <shrink_lruvec+0x5983>
5fb7   939b37:	48 8b bc 24 18 01 00 00 	mov    0x118(%rsp),%rdi
5fbf   939b3f:	e8 00 00 00 00       	call   939b44 <shrink_lruvec+0x5fc4>	939b40: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
5fc4   939b44:	48 8b 94 24 18 01 00 00 	mov    0x118(%rsp),%rdx
5fcc   939b4c:	e9 b2 f9 ff ff       	jmp    939503 <shrink_lruvec+0x5983>
5fd1   939b51:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939b54: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
5fd8   939b58:	80 e1 07             	and    $0x7,%cl
5fdb   939b5b:	80 c1 03             	add    $0x3,%cl
5fde   939b5e:	38 c1                	cmp    %al,%cl
5fe0   939b60:	0f 8c bd a9 ff ff    	jl     934523 <shrink_lruvec+0x9a3>
5fe6   939b66:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939b69: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
5fed   939b6d:	e8 00 00 00 00       	call   939b72 <shrink_lruvec+0x5ff2>	939b6e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
5ff2   939b72:	e9 ac a9 ff ff       	jmp    934523 <shrink_lruvec+0x9a3>
5ff7   939b77:	89 d9                	mov    %ebx,%ecx
5ff9   939b79:	80 e1 07             	and    $0x7,%cl
5ffc   939b7c:	80 c1 03             	add    $0x3,%cl
5fff   939b7f:	38 c1                	cmp    %al,%cl
6001   939b81:	0f 8c d2 a9 ff ff    	jl     934559 <shrink_lruvec+0x9d9>
6007   939b87:	48 89 df             	mov    %rbx,%rdi
600a   939b8a:	e8 00 00 00 00       	call   939b8f <shrink_lruvec+0x600f>	939b8b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
600f   939b8f:	e9 c5 a9 ff ff       	jmp    934559 <shrink_lruvec+0x9d9>
6014   939b94:	48 8d 8c 24 b0 03 00 00 	lea    0x3b0(%rsp),%rcx
601c   939b9c:	80 e1 07             	and    $0x7,%cl
601f   939b9f:	80 c1 03             	add    $0x3,%cl
6022   939ba2:	38 c1                	cmp    %al,%cl
6024   939ba4:	0f 8c 0d b2 ff ff    	jl     934db7 <shrink_lruvec+0x1237>
602a   939baa:	48 8d bc 24 b0 03 00 00 	lea    0x3b0(%rsp),%rdi
6032   939bb2:	e8 00 00 00 00       	call   939bb7 <shrink_lruvec+0x6037>	939bb3: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
6037   939bb7:	8b 94 24 b0 00 00 00 	mov    0xb0(%rsp),%edx
603e   939bbe:	e9 f4 b1 ff ff       	jmp    934db7 <shrink_lruvec+0x1237>
6043   939bc3:	48 8b 8c 24 e0 01 00 00 	mov    0x1e0(%rsp),%rcx
604b   939bcb:	80 e1 07             	and    $0x7,%cl
604e   939bce:	80 c1 03             	add    $0x3,%cl
6051   939bd1:	38 c1                	cmp    %al,%cl
6053   939bd3:	0f 8c 0e b2 ff ff    	jl     934de7 <shrink_lruvec+0x1267>
6059   939bd9:	48 8b bc 24 e0 01 00 00 	mov    0x1e0(%rsp),%rdi
6061   939be1:	e8 00 00 00 00       	call   939be6 <shrink_lruvec+0x6066>	939be2: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
6066   939be6:	48 8b bc 24 08 02 00 00 	mov    0x208(%rsp),%rdi
606e   939bee:	e9 f4 b1 ff ff       	jmp    934de7 <shrink_lruvec+0x1267>
6073   939bf3:	89 f9                	mov    %edi,%ecx
6075   939bf5:	80 e1 07             	and    $0x7,%cl
6078   939bf8:	80 c1 03             	add    $0x3,%cl
607b   939bfb:	38 c1                	cmp    %al,%cl
607d   939bfd:	0f 8c 54 b4 ff ff    	jl     935057 <shrink_lruvec+0x14d7>
6083   939c03:	e8 00 00 00 00       	call   939c08 <shrink_lruvec+0x6088>	939c04: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6088   939c08:	e9 4a b4 ff ff       	jmp    935057 <shrink_lruvec+0x14d7>
608d   939c0d:	89 f9                	mov    %edi,%ecx
608f   939c0f:	80 e1 07             	and    $0x7,%cl
6092   939c12:	80 c1 03             	add    $0x3,%cl
6095   939c15:	38 c1                	cmp    %al,%cl
6097   939c17:	0f 8c 75 b5 ff ff    	jl     935192 <shrink_lruvec+0x1612>
609d   939c1d:	e8 00 00 00 00       	call   939c22 <shrink_lruvec+0x60a2>	939c1e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60a2   939c22:	e9 6b b5 ff ff       	jmp    935192 <shrink_lruvec+0x1612>
60a7   939c27:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939c2a: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
60ae   939c2e:	80 e1 07             	and    $0x7,%cl
60b1   939c31:	80 c1 03             	add    $0x3,%cl
60b4   939c34:	38 c1                	cmp    %al,%cl
60b6   939c36:	0f 8c fd a9 ff ff    	jl     934639 <shrink_lruvec+0xab9>
60bc   939c3c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939c3f: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
60c3   939c43:	e8 00 00 00 00       	call   939c48 <shrink_lruvec+0x60c8>	939c44: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60c8   939c48:	e9 ec a9 ff ff       	jmp    934639 <shrink_lruvec+0xab9>
60cd   939c4d:	89 d9                	mov    %ebx,%ecx
60cf   939c4f:	80 e1 07             	and    $0x7,%cl
60d2   939c52:	80 c1 03             	add    $0x3,%cl
60d5   939c55:	38 c1                	cmp    %al,%cl
60d7   939c57:	0f 8c 12 aa ff ff    	jl     93466f <shrink_lruvec+0xaef>
60dd   939c5d:	48 89 df             	mov    %rbx,%rdi
60e0   939c60:	e8 00 00 00 00       	call   939c65 <shrink_lruvec+0x60e5>	939c61: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
60e5   939c65:	e9 05 aa ff ff       	jmp    93466f <shrink_lruvec+0xaef>
60ea   939c6a:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939c6d: R_X86_64_32S	memory_cgrp_subsys_enabled_key
60f1   939c71:	80 e1 07             	and    $0x7,%cl
60f4   939c74:	80 c1 03             	add    $0x3,%cl
60f7   939c77:	38 c1                	cmp    %al,%cl
60f9   939c79:	0f 8c 02 fb ff ff    	jl     939781 <shrink_lruvec+0x5c01>
60ff   939c7f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939c82: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6106   939c86:	e8 00 00 00 00       	call   939c8b <shrink_lruvec+0x610b>	939c87: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
610b   939c8b:	e9 f1 fa ff ff       	jmp    939781 <shrink_lruvec+0x5c01>
6110   939c90:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939c93: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6117   939c97:	80 e1 07             	and    $0x7,%cl
611a   939c9a:	80 c1 03             	add    $0x3,%cl
611d   939c9d:	38 c1                	cmp    %al,%cl
611f   939c9f:	0f 8c 53 fb ff ff    	jl     9397f8 <shrink_lruvec+0x5c78>
6125   939ca5:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	939ca8: R_X86_64_32S	memory_cgrp_subsys_enabled_key
612c   939cac:	e8 00 00 00 00       	call   939cb1 <shrink_lruvec+0x6131>	939cad: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6131   939cb1:	e9 42 fb ff ff       	jmp    9397f8 <shrink_lruvec+0x5c78>
6136   939cb6:	e8 00 00 00 00       	call   939cbb <shrink_lruvec+0x613b>	939cb7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
613b   939cbb:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
6145   939cc5:	48 8b 84 24 c0 01 00 00 	mov    0x1c0(%rsp),%rax
614d   939ccd:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6152   939cd2:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
615a   939cda:	74 15                	je     939cf1 <shrink_lruvec+0x6171>
615c   939cdc:	48 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%rdi
6164   939ce4:	e8 00 00 00 00       	call   939ce9 <shrink_lruvec+0x6169>	939ce5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6169   939ce9:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
6171   939cf1:	48 83 00 40          	addq   $0x40,(%rax)
6175   939cf5:	e9 a0 00 00 00       	jmp    939d9a <shrink_lruvec+0x621a>
617a   939cfa:	e8 00 00 00 00       	call   939cff <shrink_lruvec+0x617f>	939cfb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
617f   939cff:	e9 db 01 00 00       	jmp    939edf <shrink_lruvec+0x635f>
6184   939d04:	e8 00 00 00 00       	call   939d09 <shrink_lruvec+0x6189>	939d05: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6189   939d09:	e9 04 01 00 00       	jmp    939e12 <shrink_lruvec+0x6292>
618e   939d0e:	e8 00 00 00 00       	call   939d13 <shrink_lruvec+0x6193>	939d0f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6193   939d13:	e9 fa 00 00 00       	jmp    939e12 <shrink_lruvec+0x6292>
6198   939d18:	e8 00 00 00 00       	call   939d1d <shrink_lruvec+0x619d>	939d19: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
619d   939d1d:	eb 73                	jmp    939d92 <shrink_lruvec+0x6212>
619f   939d1f:	44 89 ff             	mov    %r15d,%edi
61a2   939d22:	e8 00 00 00 00       	call   939d27 <shrink_lruvec+0x61a7>	939d23: R_X86_64_PLT32	next_demotion_node-0x4
61a7   939d27:	89 c3                	mov    %eax,%ebx
61a9   939d29:	bf ff ff ff ff       	mov    $0xffffffff,%edi
61ae   939d2e:	89 c6                	mov    %eax,%esi
61b0   939d30:	e8 00 00 00 00       	call   939d35 <shrink_lruvec+0x61b5>	939d31: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
61b5   939d35:	83 fb ff             	cmp    $0xffffffff,%ebx
61b8   939d38:	0f 84 9c 01 00 00    	je     939eda <shrink_lruvec+0x635a>
61be   939d3e:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
61c3   939d43:	48 8d 58 10          	lea    0x10(%rax),%rbx
61c7   939d47:	48 89 d8             	mov    %rbx,%rax
61ca   939d4a:	48 c1 e8 03          	shr    $0x3,%rax
61ce   939d4e:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
61d3   939d53:	74 08                	je     939d5d <shrink_lruvec+0x61dd>
61d5   939d55:	48 89 df             	mov    %rbx,%rdi
61d8   939d58:	e8 00 00 00 00       	call   939d5d <shrink_lruvec+0x61dd>	939d59: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
61dd   939d5d:	48 8b 1b             	mov    (%rbx),%rbx
61e0   939d60:	31 ff                	xor    %edi,%edi
61e2   939d62:	44 89 f6             	mov    %r14d,%esi
61e5   939d65:	e8 00 00 00 00       	call   939d6a <shrink_lruvec+0x61ea>	939d66: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
61ea   939d6a:	48 85 db             	test   %rbx,%rbx
61ed   939d6d:	0f 84 1d 27 00 00    	je     93c490 <shrink_lruvec+0x8910>
61f3   939d73:	45 85 f6             	test   %r14d,%r14d
61f6   939d76:	0f 85 14 27 00 00    	jne    93c490 <shrink_lruvec+0x8910>
61fc   939d7c:	e8 00 00 00 00       	call   939d81 <shrink_lruvec+0x6201>	939d7d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6201   939d81:	e9 59 01 00 00       	jmp    939edf <shrink_lruvec+0x635f>
6206   939d86:	e8 00 00 00 00       	call   939d8b <shrink_lruvec+0x620b>	939d87: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
620b   939d8b:	eb 05                	jmp    939d92 <shrink_lruvec+0x6212>
620d   939d8d:	e8 00 00 00 00       	call   939d92 <shrink_lruvec+0x6212>	939d8e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6212   939d92:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
621a   939d9a:	48 8b 8c 24 c0 01 00 00 	mov    0x1c0(%rsp),%rcx
6222   939da2:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
6227   939da7:	74 15                	je     939dbe <shrink_lruvec+0x623e>
6229   939da9:	48 8b bc 24 d8 00 00 00 	mov    0xd8(%rsp),%rdi
6231   939db1:	e8 00 00 00 00       	call   939db6 <shrink_lruvec+0x6236>	939db2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6236   939db6:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
623e   939dbe:	48 8b 18             	mov    (%rax),%rbx
6241   939dc1:	48 2b 9c 24 60 02 00 00 	sub    0x260(%rsp),%rbx
6249   939dc9:	bf 3f 00 00 00       	mov    $0x3f,%edi
624e   939dce:	48 89 de             	mov    %rbx,%rsi
6251   939dd1:	e8 00 00 00 00       	call   939dd6 <shrink_lruvec+0x6256>	939dd2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6256   939dd6:	48 83 fb 40          	cmp    $0x40,%rbx
625a   939dda:	0f 93 c0             	setae  %al
625d   939ddd:	84 84 24 7c 01 00 00 	test   %al,0x17c(%rsp)
6264   939de4:	74 27                	je     939e0d <shrink_lruvec+0x628d>
6266   939de6:	e8 00 00 00 00       	call   939deb <shrink_lruvec+0x626b>	939de7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
626b   939deb:	48 8b 84 24 40 01 00 00 	mov    0x140(%rsp),%rax
6273   939df3:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6277   939df7:	84 c0                	test   %al,%al
6279   939df9:	0f 85 20 2a 00 00    	jne    93c81f <shrink_lruvec+0x8c9f>
627f   939dff:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
6287   939e07:	80 60 01 7f          	andb   $0x7f,0x1(%rax)
628b   939e0b:	eb 05                	jmp    939e12 <shrink_lruvec+0x6292>
628d   939e0d:	e8 00 00 00 00       	call   939e12 <shrink_lruvec+0x6292>	939e0e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6292   939e12:	48 8b 84 24 e8 01 00 00 	mov    0x1e8(%rsp),%rax
629a   939e1a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
629f   939e1f:	48 8b bc 24 80 01 00 00 	mov    0x180(%rsp),%rdi
62a7   939e27:	74 0d                	je     939e36 <shrink_lruvec+0x62b6>
62a9   939e29:	e8 00 00 00 00       	call   939e2e <shrink_lruvec+0x62ae>	939e2a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
62ae   939e2e:	48 8b bc 24 80 01 00 00 	mov    0x180(%rsp),%rdi
62b6   939e36:	48 8b 1f             	mov    (%rdi),%rbx
62b9   939e39:	48 83 c3 08          	add    $0x8,%rbx
62bd   939e3d:	49 89 df             	mov    %rbx,%r15
62c0   939e40:	49 c1 ef 03          	shr    $0x3,%r15
62c4   939e44:	43 80 3c 2f 00       	cmpb   $0x0,(%r15,%r13,1)
62c9   939e49:	74 08                	je     939e53 <shrink_lruvec+0x62d3>
62cb   939e4b:	48 89 df             	mov    %rbx,%rdi
62ce   939e4e:	e8 00 00 00 00       	call   939e53 <shrink_lruvec+0x62d3>	939e4f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
62d3   939e53:	4c 8b 33             	mov    (%rbx),%r14
62d6   939e56:	43 80 3c 2f 00       	cmpb   $0x0,(%r15,%r13,1)
62db   939e5b:	74 08                	je     939e65 <shrink_lruvec+0x62e5>
62dd   939e5d:	48 89 df             	mov    %rbx,%rdi
62e0   939e60:	e8 00 00 00 00       	call   939e65 <shrink_lruvec+0x62e5>	939e61: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
62e5   939e65:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
62ec   939e6c:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
62f1   939e71:	48 89 d0             	mov    %rdx,%rax
62f4   939e74:	48 c1 e8 03          	shr    $0x3,%rax
62f8   939e78:	42 8a 04 28          	mov    (%rax,%r13,1),%al
62fc   939e7c:	84 c0                	test   %al,%al
62fe   939e7e:	0f 85 8e 28 00 00    	jne    93c712 <shrink_lruvec+0x8b92>
6304   939e84:	44 8b 3a             	mov    (%rdx),%r15d
6307   939e87:	bb 00 00 02 00       	mov    $0x20000,%ebx
630c   939e8c:	be 00 00 02 00       	mov    $0x20000,%esi
6311   939e91:	44 21 fe             	and    %r15d,%esi
6314   939e94:	31 ff                	xor    %edi,%edi
6316   939e96:	e8 00 00 00 00       	call   939e9b <shrink_lruvec+0x631b>	939e97: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
631b   939e9b:	44 21 fb             	and    %r15d,%ebx
631e   939e9e:	75 12                	jne    939eb2 <shrink_lruvec+0x6332>
6320   939ea0:	e8 00 00 00 00       	call   939ea5 <shrink_lruvec+0x6325>	939ea1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6325   939ea5:	4c 89 f7             	mov    %r14,%rdi
6328   939ea8:	e8 00 00 00 00       	call   939ead <shrink_lruvec+0x632d>	939ea9: R_X86_64_PLT32	kfree-0x4
632d   939ead:	e9 54 25 00 00       	jmp    93c406 <shrink_lruvec+0x8886>
6332   939eb2:	e8 00 00 00 00       	call   939eb7 <shrink_lruvec+0x6337>	939eb3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6337   939eb7:	e9 4a 25 00 00       	jmp    93c406 <shrink_lruvec+0x8886>
633c   939ebc:	e8 00 00 00 00       	call   939ec1 <shrink_lruvec+0x6341>	939ebd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6341   939ec1:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
634b   939ecb:	e9 42 ff ff ff       	jmp    939e12 <shrink_lruvec+0x6292>
6350   939ed0:	e8 00 00 00 00       	call   939ed5 <shrink_lruvec+0x6355>	939ed1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6355   939ed5:	e9 38 ff ff ff       	jmp    939e12 <shrink_lruvec+0x6292>
635a   939eda:	e8 00 00 00 00       	call   939edf <shrink_lruvec+0x635f>	939edb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
635f   939edf:	b8 03 00 00 00       	mov    $0x3,%eax
6364   939ee4:	b9 01 00 00 00       	mov    $0x1,%ecx
6369   939ee9:	48 89 8c 24 a0 00 00 00 	mov    %rcx,0xa0(%rsp)
6371   939ef1:	45 31 ff             	xor    %r15d,%r15d
6374   939ef4:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
6379   939ef9:	48 8d 71 3a          	lea    0x3a(%rcx),%rsi
637d   939efd:	48 8d 51 10          	lea    0x10(%rcx),%rdx
6381   939f01:	48 89 94 24 38 01 00 00 	mov    %rdx,0x138(%rsp)
6389   939f09:	48 8b 94 24 88 00 00 00 	mov    0x88(%rsp),%rdx
6391   939f11:	48 8d ba 80 01 00 00 	lea    0x180(%rdx),%rdi
6398   939f18:	48 89 bc 24 10 01 00 00 	mov    %rdi,0x110(%rsp)
63a0   939f20:	48 8d ba 98 01 00 00 	lea    0x198(%rdx),%rdi
63a7   939f27:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
63ac   939f2c:	48 83 c1 39          	add    $0x39,%rcx
63b0   939f30:	48 89 8c 24 f0 00 00 00 	mov    %rcx,0xf0(%rsp)
63b8   939f38:	48 8d 4a 54          	lea    0x54(%rdx),%rcx
63bc   939f3c:	48 89 8c 24 c8 00 00 00 	mov    %rcx,0xc8(%rsp)
63c4   939f44:	4c 89 bc 24 48 01 00 00 	mov    %r15,0x148(%rsp)
63cc   939f4c:	49 8d 4f ff          	lea    -0x1(%r15),%rcx
63d0   939f50:	48 89 8c 24 b8 00 00 00 	mov    %rcx,0xb8(%rsp)
63d8   939f58:	48 89 f1             	mov    %rsi,%rcx
63db   939f5b:	48 89 b4 24 d0 00 00 00 	mov    %rsi,0xd0(%rsp)
63e3   939f63:	48 c1 ee 03          	shr    $0x3,%rsi
63e7   939f67:	48 89 74 24 78       	mov    %rsi,0x78(%rsp)
63ec   939f6c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	939f6f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
63f3   939f73:	48 c1 e9 03          	shr    $0x3,%rcx
63f7   939f77:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
63fc   939f7c:	89 c0                	mov    %eax,%eax
63fe   939f7e:	b9 88 06 00 00       	mov    $0x688,%ecx
6403   939f83:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
6408   939f88:	48 89 84 24 c0 00 00 00 	mov    %rax,0xc0(%rsp)
6410   939f90:	48 8b 04 c5 00 00 00 00 	mov    0x0(,%rax,8),%rax	939f94: R_X86_64_32S	.rodata+0x131f00
6418   939f98:	48 89 84 24 50 01 00 00 	mov    %rax,0x150(%rsp)
6420   939fa0:	45 31 ff             	xor    %r15d,%r15d
6423   939fa3:	44 89 fb             	mov    %r15d,%ebx
6426   939fa6:	83 e3 fe             	and    $0xfffffffe,%ebx
6429   939fa9:	bf 02 00 00 00       	mov    $0x2,%edi
642e   939fae:	48 89 de             	mov    %rbx,%rsi
6431   939fb1:	e8 00 00 00 00       	call   939fb6 <shrink_lruvec+0x6436>	939fb2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6436   939fb6:	48 89 9c 24 80 00 00 00 	mov    %rbx,0x80(%rsp)
643e   939fbe:	48 83 fb 02          	cmp    $0x2,%rbx
6442   939fc2:	0f 94 84 24 a8 00 00 00 	sete   0xa8(%rsp)
644a   939fca:	48 8b 44 24 78       	mov    0x78(%rsp),%rax
644f   939fcf:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6453   939fd3:	84 c0                	test   %al,%al
6455   939fd5:	0f 85 15 07 00 00    	jne    93a6f0 <shrink_lruvec+0x6b70>
645b   939fdb:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
6463   939fe3:	0f b6 18             	movzbl (%rax),%ebx
6466   939fe6:	31 ff                	xor    %edi,%edi
6468   939fe8:	89 de                	mov    %ebx,%esi
646a   939fea:	e8 00 00 00 00       	call   939fef <shrink_lruvec+0x646f>	939feb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
646f   939fef:	84 db                	test   %bl,%bl
6471   939ff1:	4c 89 7c 24 40       	mov    %r15,0x40(%rsp)
6476   939ff6:	0f 88 54 02 00 00    	js     93a250 <shrink_lruvec+0x66d0>
647c   939ffc:	48 69 c3 00 07 00 00 	imul   $0x700,%rbx,%rax
6483   93a003:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
6488   93a008:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
648d   93a00d:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
6492   93a012:	4c 89 64 24 20       	mov    %r12,0x20(%rsp)
6497   93a017:	45 31 ff             	xor    %r15d,%r15d
649a   93a01a:	45 31 f6             	xor    %r14d,%r14d
649d   93a01d:	45 31 e4             	xor    %r12d,%r12d
64a0   93a020:	eb 36                	jmp    93a058 <shrink_lruvec+0x64d8>
64a2   93a022:	e8 00 00 00 00       	call   93a027 <shrink_lruvec+0x64a7>	93a023: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
64a7   93a027:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
64b1   93a031:	4c 39 7c 24 28       	cmp    %r15,0x28(%rsp)
64b6   93a036:	0f 84 08 02 00 00    	je     93a244 <shrink_lruvec+0x66c4>
64bc   93a03c:	e8 00 00 00 00       	call   93a041 <shrink_lruvec+0x64c1>	93a03d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
64c1   93a041:	49 81 c7 00 07 00 00 	add    $0x700,%r15
64c8   93a048:	48 83 44 24 20 28    	addq   $0x28,0x20(%rsp)
64ce   93a04e:	48 83 44 24 10 28    	addq   $0x28,0x10(%rsp)
64d4   93a054:	49 83 c6 01          	add    $0x1,%r14
64d8   93a058:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
64e0   93a060:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
64e5   93a065:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
64ea   93a06a:	74 08                	je     93a074 <shrink_lruvec+0x64f4>
64ec   93a06c:	48 89 df             	mov    %rbx,%rdi
64ef   93a06f:	e8 00 00 00 00       	call   93a074 <shrink_lruvec+0x64f4>	93a070: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
64f4   93a074:	4c 8b 2b             	mov    (%rbx),%r13
64f7   93a077:	bf 04 00 00 00       	mov    $0x4,%edi
64fc   93a07c:	4c 89 f6             	mov    %r14,%rsi
64ff   93a07f:	e8 00 00 00 00       	call   93a084 <shrink_lruvec+0x6504>	93a080: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6504   93a084:	49 83 fe 03          	cmp    $0x3,%r14
6508   93a088:	0f 87 84 01 00 00    	ja     93a212 <shrink_lruvec+0x6692>
650e   93a08e:	e8 00 00 00 00       	call   93a093 <shrink_lruvec+0x6513>	93a08f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6513   93a093:	4b 8d 1c 2f          	lea    (%r15,%r13,1),%rbx
6517   93a097:	48 83 c3 78          	add    $0x78,%rbx
651b   93a09b:	48 89 df             	mov    %rbx,%rdi
651e   93a09e:	be 08 00 00 00       	mov    $0x8,%esi
6523   93a0a3:	e8 00 00 00 00       	call   93a0a8 <shrink_lruvec+0x6528>	93a0a4: R_X86_64_PLT32	__kasan_check_read-0x4
6528   93a0a8:	48 89 d8             	mov    %rbx,%rax
652b   93a0ab:	48 c1 e8 03          	shr    $0x3,%rax
652f   93a0af:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
6539   93a0b9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
653d   93a0bd:	74 08                	je     93a0c7 <shrink_lruvec+0x6547>
653f   93a0bf:	48 89 df             	mov    %rbx,%rdi
6542   93a0c2:	e8 00 00 00 00       	call   93a0c7 <shrink_lruvec+0x6547>	93a0c3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6547   93a0c7:	4b 8b 5c 3d 78       	mov    0x78(%r13,%r15,1),%rbx
654c   93a0cc:	31 ff                	xor    %edi,%edi
654e   93a0ce:	48 89 de             	mov    %rbx,%rsi
6551   93a0d1:	e8 00 00 00 00       	call   93a0d6 <shrink_lruvec+0x6556>	93a0d2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6556   93a0d6:	48 85 db             	test   %rbx,%rbx
6559   93a0d9:	0f 84 43 ff ff ff    	je     93a022 <shrink_lruvec+0x64a2>
655f   93a0df:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
6569   93a0e9:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
656e   93a0ee:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
6572   93a0f2:	84 c0                	test   %al,%al
6574   93a0f4:	0f 85 f2 00 00 00    	jne    93a1ec <shrink_lruvec+0x666c>
657a   93a0fa:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93a100 <shrink_lruvec+0x6580>	93a0fc: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
6580   93a100:	bf 01 00 00 00       	mov    $0x1,%edi
6585   93a105:	89 de                	mov    %ebx,%esi
6587   93a107:	e8 00 00 00 00       	call   93a10c <shrink_lruvec+0x658c>	93a108: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
658c   93a10c:	85 db                	test   %ebx,%ebx
658e   93a10e:	7e 62                	jle    93a172 <shrink_lruvec+0x65f2>
6590   93a110:	bf 03 00 00 00       	mov    $0x3,%edi
6595   93a115:	4c 89 f6             	mov    %r14,%rsi
6598   93a118:	e8 00 00 00 00       	call   93a11d <shrink_lruvec+0x659d>	93a119: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
659d   93a11d:	49 83 fe 02          	cmp    $0x2,%r14
65a1   93a121:	0f 87 04 01 00 00    	ja     93a22b <shrink_lruvec+0x66ab>
65a7   93a127:	e8 00 00 00 00       	call   93a12c <shrink_lruvec+0x65ac>	93a128: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
65ac   93a12c:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
65b6   93a136:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
65bb   93a13b:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
65c0   93a140:	48 8d 3c 08          	lea    (%rax,%rcx,1),%rdi
65c4   93a144:	48 81 c7 c8 03 00 00 	add    $0x3c8,%rdi
65cb   93a14b:	48 89 f8             	mov    %rdi,%rax
65ce   93a14e:	48 c1 e8 03          	shr    $0x3,%rax
65d2   93a152:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
65d7   93a157:	74 05                	je     93a15e <shrink_lruvec+0x65de>
65d9   93a159:	e8 00 00 00 00       	call   93a15e <shrink_lruvec+0x65de>	93a15a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
65de   93a15e:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
65e3   93a163:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
65e8   93a168:	48 8b 9c 01 c8 03 00 00 	mov    0x3c8(%rcx,%rax,1),%rbx
65f0   93a170:	eb 6a                	jmp    93a1dc <shrink_lruvec+0x665c>
65f2   93a172:	4c 89 a4 24 00 01 00 00 	mov    %r12,0x100(%rsp)
65fa   93a17a:	e8 00 00 00 00       	call   93a17f <shrink_lruvec+0x65ff>	93a17b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
65ff   93a17f:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
6604   93a184:	4b 8d 1c 2c          	lea    (%r12,%r13,1),%rbx
6608   93a188:	4a 8d 3c 3b          	lea    (%rbx,%r15,1),%rdi
660c   93a18c:	be 08 00 00 00       	mov    $0x8,%esi
6611   93a191:	e8 00 00 00 00       	call   93a196 <shrink_lruvec+0x6616>	93a192: R_X86_64_PLT32	__kasan_check_read-0x4
6616   93a196:	4b 8d 3c 3c          	lea    (%r12,%r15,1),%rdi
661a   93a19a:	4c 01 ef             	add    %r13,%rdi
661d   93a19d:	48 89 f8             	mov    %rdi,%rax
6620   93a1a0:	48 c1 e8 03          	shr    $0x3,%rax
6624   93a1a4:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
662e   93a1ae:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6633   93a1b3:	74 05                	je     93a1ba <shrink_lruvec+0x663a>
6635   93a1b5:	e8 00 00 00 00       	call   93a1ba <shrink_lruvec+0x663a>	93a1b6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
663a   93a1ba:	4a 8b 1c 3b          	mov    (%rbx,%r15,1),%rbx
663e   93a1be:	31 ff                	xor    %edi,%edi
6640   93a1c0:	48 89 de             	mov    %rbx,%rsi
6643   93a1c3:	e8 00 00 00 00       	call   93a1c8 <shrink_lruvec+0x6648>	93a1c4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6648   93a1c8:	48 85 db             	test   %rbx,%rbx
664b   93a1cb:	b8 00 00 00 00       	mov    $0x0,%eax
6650   93a1d0:	48 0f 48 d8          	cmovs  %rax,%rbx
6654   93a1d4:	4c 8b a4 24 00 01 00 00 	mov    0x100(%rsp),%r12
665c   93a1dc:	49 01 dc             	add    %rbx,%r12
665f   93a1df:	4c 39 7c 24 28       	cmp    %r15,0x28(%rsp)
6664   93a1e4:	0f 85 52 fe ff ff    	jne    93a03c <shrink_lruvec+0x64bc>
666a   93a1ea:	eb 58                	jmp    93a244 <shrink_lruvec+0x66c4>
666c   93a1ec:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93a1ef: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6673   93a1f3:	80 e1 07             	and    $0x7,%cl
6676   93a1f6:	80 c1 03             	add    $0x3,%cl
6679   93a1f9:	38 c1                	cmp    %al,%cl
667b   93a1fb:	0f 8c f9 fe ff ff    	jl     93a0fa <shrink_lruvec+0x657a>
6681   93a201:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a204: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6688   93a208:	e8 00 00 00 00       	call   93a20d <shrink_lruvec+0x668d>	93a209: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
668d   93a20d:	e9 e8 fe ff ff       	jmp    93a0fa <shrink_lruvec+0x657a>
6692   93a212:	e8 00 00 00 00       	call   93a217 <shrink_lruvec+0x6697>	93a213: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6697   93a217:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a21a: R_X86_64_32S	.data+0x58f9c0
669e   93a21e:	4c 89 f6             	mov    %r14,%rsi
66a1   93a221:	e8 00 00 00 00       	call   93a226 <shrink_lruvec+0x66a6>	93a222: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
66a6   93a226:	e9 68 fe ff ff       	jmp    93a093 <shrink_lruvec+0x6513>
66ab   93a22b:	e8 00 00 00 00       	call   93a230 <shrink_lruvec+0x66b0>	93a22c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
66b0   93a230:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a233: R_X86_64_32S	.data+0x58f9e0
66b7   93a237:	4c 89 f6             	mov    %r14,%rsi
66ba   93a23a:	e8 00 00 00 00       	call   93a23f <shrink_lruvec+0x66bf>	93a23b: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
66bf   93a23f:	e9 e8 fe ff ff       	jmp    93a12c <shrink_lruvec+0x65ac>
66c4   93a244:	e8 00 00 00 00       	call   93a249 <shrink_lruvec+0x66c9>	93a245: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
66c9   93a249:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
66ce   93a24e:	eb 08                	jmp    93a258 <shrink_lruvec+0x66d8>
66d0   93a250:	e8 00 00 00 00       	call   93a255 <shrink_lruvec+0x66d5>	93a251: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
66d5   93a255:	45 31 e4             	xor    %r12d,%r12d
66d8   93a258:	48 8b 84 24 38 01 00 00 	mov    0x138(%rsp),%rax
66e0   93a260:	48 89 c1             	mov    %rax,%rcx
66e3   93a263:	48 c1 e9 03          	shr    $0x3,%rcx
66e7   93a267:	48 89 8c 24 30 01 00 00 	mov    %rcx,0x130(%rsp)
66ef   93a26f:	42 80 3c 29 00       	cmpb   $0x0,(%rcx,%r13,1)
66f4   93a274:	74 15                	je     93a28b <shrink_lruvec+0x670b>
66f6   93a276:	48 8b bc 24 38 01 00 00 	mov    0x138(%rsp),%rdi
66fe   93a27e:	e8 00 00 00 00       	call   93a283 <shrink_lruvec+0x6703>	93a27f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6703   93a283:	48 8b 84 24 38 01 00 00 	mov    0x138(%rsp),%rax
670b   93a28b:	4c 8b 30             	mov    (%rax),%r14
670e   93a28e:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
6713   93a293:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6717   93a297:	84 c0                	test   %al,%al
6719   93a299:	0f 85 76 04 00 00    	jne    93a715 <shrink_lruvec+0x6b95>
671f   93a29f:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93a2a5 <shrink_lruvec+0x6725>	93a2a1: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
6725   93a2a5:	bf 01 00 00 00       	mov    $0x1,%edi
672a   93a2aa:	89 de                	mov    %ebx,%esi
672c   93a2ac:	e8 00 00 00 00       	call   93a2b1 <shrink_lruvec+0x6731>	93a2ad: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
6731   93a2b1:	4c 3b b4 24 88 00 00 00 	cmp    0x88(%rsp),%r14
6739   93a2b9:	0f 84 89 00 00 00    	je     93a348 <shrink_lruvec+0x67c8>
673f   93a2bf:	85 db                	test   %ebx,%ebx
6741   93a2c1:	0f 8e 81 00 00 00    	jle    93a348 <shrink_lruvec+0x67c8>
6747   93a2c7:	48 8b 8c 24 10 01 00 00 	mov    0x110(%rsp),%rcx
674f   93a2cf:	48 89 c8             	mov    %rcx,%rax
6752   93a2d2:	48 c1 e8 03          	shr    $0x3,%rax
6756   93a2d6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
675b   93a2db:	74 15                	je     93a2f2 <shrink_lruvec+0x6772>
675d   93a2dd:	48 8b bc 24 10 01 00 00 	mov    0x110(%rsp),%rdi
6765   93a2e5:	e8 00 00 00 00       	call   93a2ea <shrink_lruvec+0x676a>	93a2e6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
676a   93a2ea:	48 8b 8c 24 10 01 00 00 	mov    0x110(%rsp),%rcx
6772   93a2f2:	4c 8b 39             	mov    (%rcx),%r15
6775   93a2f5:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
677a   93a2fa:	48 89 c8             	mov    %rcx,%rax
677d   93a2fd:	48 c1 e8 03          	shr    $0x3,%rax
6781   93a301:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6786   93a306:	74 0f                	je     93a317 <shrink_lruvec+0x6797>
6788   93a308:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
678d   93a30d:	e8 00 00 00 00       	call   93a312 <shrink_lruvec+0x6792>	93a30e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6792   93a312:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
6797   93a317:	48 8b 19             	mov    (%rcx),%rbx
679a   93a31a:	31 ff                	xor    %edi,%edi
679c   93a31c:	4c 89 fe             	mov    %r15,%rsi
679f   93a31f:	e8 00 00 00 00       	call   93a324 <shrink_lruvec+0x67a4>	93a320: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
67a4   93a324:	31 ff                	xor    %edi,%edi
67a6   93a326:	48 89 de             	mov    %rbx,%rsi
67a9   93a329:	e8 00 00 00 00       	call   93a32e <shrink_lruvec+0x67ae>	93a32a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
67ae   93a32e:	4c 89 f8             	mov    %r15,%rax
67b1   93a331:	48 09 d8             	or     %rbx,%rax
67b4   93a334:	75 1f                	jne    93a355 <shrink_lruvec+0x67d5>
67b6   93a336:	e8 00 00 00 00       	call   93a33b <shrink_lruvec+0x67bb>	93a337: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
67bb   93a33b:	4d 89 e6             	mov    %r12,%r14
67be   93a33e:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
67c3   93a343:	e9 03 01 00 00       	jmp    93a44b <shrink_lruvec+0x68cb>
67c8   93a348:	e8 00 00 00 00       	call   93a34d <shrink_lruvec+0x67cd>	93a349: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
67cd   93a34d:	4d 89 e6             	mov    %r12,%r14
67d0   93a350:	e9 f6 00 00 00       	jmp    93a44b <shrink_lruvec+0x68cb>
67d5   93a355:	4c 89 a4 24 00 01 00 00 	mov    %r12,0x100(%rsp)
67dd   93a35d:	48 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%rdi
67e5   93a365:	e8 00 00 00 00       	call   93a36a <shrink_lruvec+0x67ea>	93a366: R_X86_64_PLT32	mem_cgroup_size-0x4
67ea   93a36a:	49 89 c6             	mov    %rax,%r14
67ed   93a36d:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
67f5   93a375:	42 8a 04 28          	mov    (%rax,%r13,1),%al
67f9   93a379:	84 c0                	test   %al,%al
67fb   93a37b:	0f 85 07 04 00 00    	jne    93a788 <shrink_lruvec+0x6c08>
6801   93a381:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
6806   93a386:	44 0f b7 20          	movzwl (%rax),%r12d
680a   93a38a:	44 89 e6             	mov    %r12d,%esi
680d   93a38d:	81 e6 00 01 00 00    	and    $0x100,%esi
6813   93a393:	31 ff                	xor    %edi,%edi
6815   93a395:	e8 00 00 00 00       	call   93a39a <shrink_lruvec+0x681a>	93a396: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
681a   93a39a:	48 89 df             	mov    %rbx,%rdi
681d   93a39d:	4c 89 fe             	mov    %r15,%rsi
6820   93a3a0:	e8 00 00 00 00       	call   93a3a5 <shrink_lruvec+0x6825>	93a3a1: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
6825   93a3a5:	44 89 e0             	mov    %r12d,%eax
6828   93a3a8:	25 00 01 00 00       	and    $0x100,%eax
682d   93a3ad:	75 30                	jne    93a3df <shrink_lruvec+0x685f>
682f   93a3af:	4c 39 fb             	cmp    %r15,%rbx
6832   93a3b2:	76 2b                	jbe    93a3df <shrink_lruvec+0x685f>
6834   93a3b4:	e8 00 00 00 00       	call   93a3b9 <shrink_lruvec+0x6839>	93a3b5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6839   93a3b9:	41 81 cc 00 02 00 00 	or     $0x200,%r12d
6840   93a3c0:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
6848   93a3c8:	42 8a 04 28          	mov    (%rax,%r13,1),%al
684c   93a3cc:	84 c0                	test   %al,%al
684e   93a3ce:	0f 85 50 04 00 00    	jne    93a824 <shrink_lruvec+0x6ca4>
6854   93a3d4:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
6859   93a3d9:	66 44 89 20          	mov    %r12w,(%rax)
685d   93a3dd:	eb 08                	jmp    93a3e7 <shrink_lruvec+0x6867>
685f   93a3df:	e8 00 00 00 00       	call   93a3e4 <shrink_lruvec+0x6864>	93a3e0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6864   93a3e4:	4c 89 fb             	mov    %r15,%rbx
6867   93a3e7:	4c 8b 7c 24 40       	mov    0x40(%rsp),%r15
686c   93a3ec:	4c 89 f7             	mov    %r14,%rdi
686f   93a3ef:	48 89 de             	mov    %rbx,%rsi
6872   93a3f2:	e8 00 00 00 00       	call   93a3f7 <shrink_lruvec+0x6877>	93a3f3: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
6877   93a3f7:	49 39 de             	cmp    %rbx,%r14
687a   93a3fa:	4c 0f 46 f3          	cmovbe %rbx,%r14
687e   93a3fe:	4c 8b a4 24 00 01 00 00 	mov    0x100(%rsp),%r12
6886   93a406:	49 0f af dc          	imul   %r12,%rbx
688a   93a40a:	49 83 c6 01          	add    $0x1,%r14
688e   93a40e:	48 89 d8             	mov    %rbx,%rax
6891   93a411:	4c 09 f0             	or     %r14,%rax
6894   93a414:	48 c1 e8 20          	shr    $0x20,%rax
6898   93a418:	74 0a                	je     93a424 <shrink_lruvec+0x68a4>
689a   93a41a:	48 89 d8             	mov    %rbx,%rax
689d   93a41d:	31 d2                	xor    %edx,%edx
689f   93a41f:	49 f7 f6             	div    %r14
68a2   93a422:	eb 07                	jmp    93a42b <shrink_lruvec+0x68ab>
68a4   93a424:	89 d8                	mov    %ebx,%eax
68a6   93a426:	31 d2                	xor    %edx,%edx
68a8   93a428:	41 f7 f6             	div    %r14d
68ab   93a42b:	4d 89 e6             	mov    %r12,%r14
68ae   93a42e:	49 29 c6             	sub    %rax,%r14
68b1   93a431:	bf 20 00 00 00       	mov    $0x20,%edi
68b6   93a436:	4c 89 f6             	mov    %r14,%rsi
68b9   93a439:	e8 00 00 00 00       	call   93a43e <shrink_lruvec+0x68be>	93a43a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
68be   93a43e:	49 83 fe 21          	cmp    $0x21,%r14
68c2   93a442:	b8 20 00 00 00       	mov    $0x20,%eax
68c7   93a447:	4c 0f 42 f0          	cmovb  %rax,%r14
68cb   93a44b:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
68d3   93a453:	48 89 d0             	mov    %rdx,%rax
68d6   93a456:	48 c1 e8 03          	shr    $0x3,%rax
68da   93a45a:	48 89 84 24 b0 01 00 00 	mov    %rax,0x1b0(%rsp)
68e2   93a462:	42 8a 04 28          	mov    (%rax,%r13,1),%al
68e6   93a466:	84 c0                	test   %al,%al
68e8   93a468:	0f 85 cd 02 00 00    	jne    93a73b <shrink_lruvec+0x6bbb>
68ee   93a46e:	48 0f be 02          	movsbq (%rdx),%rax
68f2   93a472:	89 c3                	mov    %eax,%ebx
68f4   93a474:	bf 40 00 00 00       	mov    $0x40,%edi
68f9   93a479:	48 89 de             	mov    %rbx,%rsi
68fc   93a47c:	e8 00 00 00 00       	call   93a481 <shrink_lruvec+0x6901>	93a47d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6901   93a481:	48 83 fb 3f          	cmp    $0x3f,%rbx
6905   93a485:	0f 87 bb 03 00 00    	ja     93a846 <shrink_lruvec+0x6cc6>
690b   93a48b:	e8 00 00 00 00       	call   93a490 <shrink_lruvec+0x6910>	93a48c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6910   93a490:	89 d9                	mov    %ebx,%ecx
6912   93a492:	49 d3 ee             	shr    %cl,%r14
6915   93a495:	31 ff                	xor    %edi,%edi
6917   93a497:	4c 89 f6             	mov    %r14,%rsi
691a   93a49a:	e8 00 00 00 00       	call   93a49f <shrink_lruvec+0x691f>	93a49b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
691f   93a49f:	4d 85 f6             	test   %r14,%r14
6922   93a4a2:	74 2a                	je     93a4ce <shrink_lruvec+0x694e>
6924   93a4a4:	e8 00 00 00 00       	call   93a4a9 <shrink_lruvec+0x6929>	93a4a5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6929   93a4a9:	48 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%rdi
6931   93a4b1:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	93a4b4: R_X86_64_32S	.data+0x58fc30
6938   93a4b8:	e8 00 00 00 00       	call   93a4bd <shrink_lruvec+0x693d>	93a4b9: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
693d   93a4bd:	ff a4 24 50 01 00 00 	jmp    *0x150(%rsp)
6944   93a4c4:	e8 00 00 00 00       	call   93a4c9 <shrink_lruvec+0x6949>	93a4c5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6949   93a4c9:	e9 dd 01 00 00       	jmp    93a6ab <shrink_lruvec+0x6b2b>
694e   93a4ce:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
6953   93a4d3:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6957   93a4d7:	84 c0                	test   %al,%al
6959   93a4d9:	0f 85 83 02 00 00    	jne    93a762 <shrink_lruvec+0x6be2>
695f   93a4df:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93a4e5 <shrink_lruvec+0x6965>	93a4e1: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
6965   93a4e5:	bf 01 00 00 00       	mov    $0x1,%edi
696a   93a4ea:	89 de                	mov    %ebx,%esi
696c   93a4ec:	e8 00 00 00 00       	call   93a4f1 <shrink_lruvec+0x6971>	93a4ed: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
6971   93a4f1:	85 db                	test   %ebx,%ebx
6973   93a4f3:	0f 8e 2e 01 00 00    	jle    93a627 <shrink_lruvec+0x6aa7>
6979   93a4f9:	48 8b 94 24 c8 00 00 00 	mov    0xc8(%rsp),%rdx
6981   93a501:	48 89 d0             	mov    %rdx,%rax
6984   93a504:	48 c1 e8 03          	shr    $0x3,%rax
6988   93a508:	42 8a 04 28          	mov    (%rax,%r13,1),%al
698c   93a50c:	84 c0                	test   %al,%al
698e   93a50e:	0f 85 bc 02 00 00    	jne    93a7d0 <shrink_lruvec+0x6c50>
6994   93a514:	8b 1a                	mov    (%rdx),%ebx
6996   93a516:	89 de                	mov    %ebx,%esi
6998   93a518:	83 e6 02             	and    $0x2,%esi
699b   93a51b:	31 ff                	xor    %edi,%edi
699d   93a51d:	e8 00 00 00 00       	call   93a522 <shrink_lruvec+0x69a2>	93a51e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
69a2   93a522:	83 e3 02             	and    $0x2,%ebx
69a5   93a525:	0f 85 09 01 00 00    	jne    93a634 <shrink_lruvec+0x6ab4>
69ab   93a52b:	e8 00 00 00 00       	call   93a530 <shrink_lruvec+0x69b0>	93a52c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69b0   93a530:	bf 20 00 00 00       	mov    $0x20,%edi
69b5   93a535:	4c 89 e6             	mov    %r12,%rsi
69b8   93a538:	e8 00 00 00 00       	call   93a53d <shrink_lruvec+0x69bd>	93a539: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
69bd   93a53d:	49 83 fc 20          	cmp    $0x20,%r12
69c1   93a541:	b8 20 00 00 00       	mov    $0x20,%eax
69c6   93a546:	4c 0f 43 e0          	cmovae %rax,%r12
69ca   93a54a:	4d 89 e6             	mov    %r12,%r14
69cd   93a54d:	e9 57 ff ff ff       	jmp    93a4a9 <shrink_lruvec+0x6929>
69d2   93a552:	e8 00 00 00 00       	call   93a557 <shrink_lruvec+0x69d7>	93a553: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69d7   93a557:	eb 05                	jmp    93a55e <shrink_lruvec+0x69de>
69d9   93a559:	e8 00 00 00 00       	call   93a55e <shrink_lruvec+0x69de>	93a55a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
69de   93a55e:	31 db                	xor    %ebx,%ebx
69e0   93a560:	8a 84 24 a8 00 00 00 	mov    0xa8(%rsp),%al
69e7   93a567:	88 c3                	mov    %al,%bl
69e9   93a569:	4c 8b a4 24 a0 00 00 00 	mov    0xa0(%rsp),%r12
69f1   93a571:	44 89 e7             	mov    %r12d,%edi
69f4   93a574:	89 de                	mov    %ebx,%esi
69f6   93a576:	e8 00 00 00 00       	call   93a57b <shrink_lruvec+0x69fb>	93a577: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
69fb   93a57b:	41 39 dc             	cmp    %ebx,%r12d
69fe   93a57e:	b8 00 00 00 00       	mov    $0x0,%eax
6a03   93a583:	4c 0f 45 f0          	cmovne %rax,%r14
6a07   93a587:	e9 1f 01 00 00       	jmp    93a6ab <shrink_lruvec+0x6b2b>
6a0c   93a58c:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
6a11   93a591:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6a15   93a595:	84 c0                	test   %al,%al
6a17   93a597:	0f 85 0d 02 00 00    	jne    93a7aa <shrink_lruvec+0x6c2a>
6a1d   93a59d:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93a5a3 <shrink_lruvec+0x6a23>	93a59f: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
6a23   93a5a3:	bf 01 00 00 00       	mov    $0x1,%edi
6a28   93a5a8:	89 de                	mov    %ebx,%esi
6a2a   93a5aa:	e8 00 00 00 00       	call   93a5af <shrink_lruvec+0x6a2f>	93a5ab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
6a2f   93a5af:	85 db                	test   %ebx,%ebx
6a31   93a5b1:	0f 8e 8a 00 00 00    	jle    93a641 <shrink_lruvec+0x6ac1>
6a37   93a5b7:	48 8b 94 24 c8 00 00 00 	mov    0xc8(%rsp),%rdx
6a3f   93a5bf:	48 89 d0             	mov    %rdx,%rax
6a42   93a5c2:	48 c1 e8 03          	shr    $0x3,%rax
6a46   93a5c6:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6a4a   93a5ca:	84 c0                	test   %al,%al
6a4c   93a5cc:	0f 85 28 02 00 00    	jne    93a7fa <shrink_lruvec+0x6c7a>
6a52   93a5d2:	8b 1a                	mov    (%rdx),%ebx
6a54   93a5d4:	89 de                	mov    %ebx,%esi
6a56   93a5d6:	83 e6 02             	and    $0x2,%esi
6a59   93a5d9:	31 ff                	xor    %edi,%edi
6a5b   93a5db:	e8 00 00 00 00       	call   93a5e0 <shrink_lruvec+0x6a60>	93a5dc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
6a60   93a5e0:	83 e3 02             	and    $0x2,%ebx
6a63   93a5e3:	75 63                	jne    93a648 <shrink_lruvec+0x6ac8>
6a65   93a5e5:	31 db                	xor    %ebx,%ebx
6a67   93a5e7:	83 bc 24 80 00 00 00 02 	cmpl   $0x2,0x80(%rsp)
6a6f   93a5ef:	0f 94 c3             	sete   %bl
6a72   93a5f2:	e8 00 00 00 00       	call   93a5f7 <shrink_lruvec+0x6a77>	93a5f3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6a77   93a5f7:	48 8d 84 24 50 03 00 00 	lea    0x350(%rsp),%rax
6a7f   93a5ff:	48 8d 1c d8          	lea    (%rax,%rbx,8),%rbx
6a83   93a603:	48 89 d8             	mov    %rbx,%rax
6a86   93a606:	48 c1 e8 03          	shr    $0x3,%rax
6a8a   93a60a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6a8f   93a60f:	74 08                	je     93a619 <shrink_lruvec+0x6a99>
6a91   93a611:	48 89 df             	mov    %rbx,%rdi
6a94   93a614:	e8 00 00 00 00       	call   93a619 <shrink_lruvec+0x6a99>	93a615: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6a99   93a619:	4c 0f af 33          	imul   (%rbx),%r14
6a9d   93a61d:	4c 03 b4 24 b8 00 00 00 	add    0xb8(%rsp),%r14
6aa5   93a625:	eb 59                	jmp    93a680 <shrink_lruvec+0x6b00>
6aa7   93a627:	e8 00 00 00 00       	call   93a62c <shrink_lruvec+0x6aac>	93a628: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6aac   93a62c:	45 31 f6             	xor    %r14d,%r14d
6aaf   93a62f:	e9 75 fe ff ff       	jmp    93a4a9 <shrink_lruvec+0x6929>
6ab4   93a634:	e8 00 00 00 00       	call   93a639 <shrink_lruvec+0x6ab9>	93a635: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6ab9   93a639:	45 31 f6             	xor    %r14d,%r14d
6abc   93a63c:	e9 68 fe ff ff       	jmp    93a4a9 <shrink_lruvec+0x6929>
6ac1   93a641:	e8 00 00 00 00       	call   93a646 <shrink_lruvec+0x6ac6>	93a642: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6ac6   93a646:	eb 05                	jmp    93a64d <shrink_lruvec+0x6acd>
6ac8   93a648:	e8 00 00 00 00       	call   93a64d <shrink_lruvec+0x6acd>	93a649: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6acd   93a64d:	31 c0                	xor    %eax,%eax
6acf   93a64f:	83 bc 24 80 00 00 00 02 	cmpl   $0x2,0x80(%rsp)
6ad7   93a657:	0f 94 c0             	sete   %al
6ada   93a65a:	48 8d 8c 24 50 03 00 00 	lea    0x350(%rsp),%rcx
6ae2   93a662:	48 8d 1c c1          	lea    (%rcx,%rax,8),%rbx
6ae6   93a666:	48 89 d8             	mov    %rbx,%rax
6ae9   93a669:	48 c1 e8 03          	shr    $0x3,%rax
6aed   93a66d:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6af2   93a672:	74 08                	je     93a67c <shrink_lruvec+0x6afc>
6af4   93a674:	48 89 df             	mov    %rbx,%rdi
6af7   93a677:	e8 00 00 00 00       	call   93a67c <shrink_lruvec+0x6afc>	93a678: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6afc   93a67c:	4c 0f af 33          	imul   (%rbx),%r14
6b00   93a680:	4c 89 f0             	mov    %r14,%rax
6b03   93a683:	48 8b 8c 24 48 01 00 00 	mov    0x148(%rsp),%rcx
6b0b   93a68b:	48 09 c8             	or     %rcx,%rax
6b0e   93a68e:	48 c1 e8 20          	shr    $0x20,%rax
6b12   93a692:	74 0d                	je     93a6a1 <shrink_lruvec+0x6b21>
6b14   93a694:	4c 89 f0             	mov    %r14,%rax
6b17   93a697:	31 d2                	xor    %edx,%edx
6b19   93a699:	48 f7 f1             	div    %rcx
6b1c   93a69c:	49 89 c6             	mov    %rax,%r14
6b1f   93a69f:	eb 0a                	jmp    93a6ab <shrink_lruvec+0x6b2b>
6b21   93a6a1:	44 89 f0             	mov    %r14d,%eax
6b24   93a6a4:	31 d2                	xor    %edx,%edx
6b26   93a6a6:	f7 f1                	div    %ecx
6b28   93a6a8:	41 89 c6             	mov    %eax,%r14d
6b2b   93a6ab:	48 8d 84 24 80 04 00 00 	lea    0x480(%rsp),%rax
6b33   93a6b3:	4a 8d 3c f8          	lea    (%rax,%r15,8),%rdi
6b37   93a6b7:	48 89 f8             	mov    %rdi,%rax
6b3a   93a6ba:	48 c1 e8 03          	shr    $0x3,%rax
6b3e   93a6be:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6b43   93a6c3:	74 05                	je     93a6ca <shrink_lruvec+0x6b4a>
6b45   93a6c5:	e8 00 00 00 00       	call   93a6ca <shrink_lruvec+0x6b4a>	93a6c6: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
6b4a   93a6ca:	4e 89 b4 fc 80 04 00 00 	mov    %r14,0x480(%rsp,%r15,8)
6b52   93a6d2:	49 83 c7 01          	add    $0x1,%r15
6b56   93a6d6:	49 83 ff 04          	cmp    $0x4,%r15
6b5a   93a6da:	0f 84 82 01 00 00    	je     93a862 <shrink_lruvec+0x6ce2>
6b60   93a6e0:	e8 00 00 00 00       	call   93a6e5 <shrink_lruvec+0x6b65>	93a6e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6b65   93a6e5:	48 83 44 24 30 08    	addq   $0x8,0x30(%rsp)
6b6b   93a6eb:	e9 b3 f8 ff ff       	jmp    939fa3 <shrink_lruvec+0x6423>
6b70   93a6f0:	48 8b 8c 24 d0 00 00 00 	mov    0xd0(%rsp),%rcx
6b78   93a6f8:	80 e1 07             	and    $0x7,%cl
6b7b   93a6fb:	38 c1                	cmp    %al,%cl
6b7d   93a6fd:	0f 8c d8 f8 ff ff    	jl     939fdb <shrink_lruvec+0x645b>
6b83   93a703:	48 8b bc 24 d0 00 00 00 	mov    0xd0(%rsp),%rdi
6b8b   93a70b:	e8 00 00 00 00       	call   93a710 <shrink_lruvec+0x6b90>	93a70c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6b90   93a710:	e9 c6 f8 ff ff       	jmp    939fdb <shrink_lruvec+0x645b>
6b95   93a715:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93a718: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6b9c   93a71c:	80 e1 07             	and    $0x7,%cl
6b9f   93a71f:	80 c1 03             	add    $0x3,%cl
6ba2   93a722:	38 c1                	cmp    %al,%cl
6ba4   93a724:	0f 8c 75 fb ff ff    	jl     93a29f <shrink_lruvec+0x671f>
6baa   93a72a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a72d: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6bb1   93a731:	e8 00 00 00 00       	call   93a736 <shrink_lruvec+0x6bb6>	93a732: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6bb6   93a736:	e9 64 fb ff ff       	jmp    93a29f <shrink_lruvec+0x671f>
6bbb   93a73b:	89 d1                	mov    %edx,%ecx
6bbd   93a73d:	80 e1 07             	and    $0x7,%cl
6bc0   93a740:	38 c1                	cmp    %al,%cl
6bc2   93a742:	0f 8c 26 fd ff ff    	jl     93a46e <shrink_lruvec+0x68ee>
6bc8   93a748:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
6bd0   93a750:	e8 00 00 00 00       	call   93a755 <shrink_lruvec+0x6bd5>	93a751: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
6bd5   93a755:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
6bdd   93a75d:	e9 0c fd ff ff       	jmp    93a46e <shrink_lruvec+0x68ee>
6be2   93a762:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93a765: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6be9   93a769:	80 e1 07             	and    $0x7,%cl
6bec   93a76c:	80 c1 03             	add    $0x3,%cl
6bef   93a76f:	38 c1                	cmp    %al,%cl
6bf1   93a771:	0f 8c 68 fd ff ff    	jl     93a4df <shrink_lruvec+0x695f>
6bf7   93a777:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a77a: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6bfe   93a77e:	e8 00 00 00 00       	call   93a783 <shrink_lruvec+0x6c03>	93a77f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c03   93a783:	e9 57 fd ff ff       	jmp    93a4df <shrink_lruvec+0x695f>
6c08   93a788:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
6c0d   93a78d:	80 e1 07             	and    $0x7,%cl
6c10   93a790:	80 c1 01             	add    $0x1,%cl
6c13   93a793:	38 c1                	cmp    %al,%cl
6c15   93a795:	0f 8c e6 fb ff ff    	jl     93a381 <shrink_lruvec+0x6801>
6c1b   93a79b:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
6c20   93a7a0:	e8 00 00 00 00       	call   93a7a5 <shrink_lruvec+0x6c25>	93a7a1: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
6c25   93a7a5:	e9 d7 fb ff ff       	jmp    93a381 <shrink_lruvec+0x6801>
6c2a   93a7aa:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93a7ad: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6c31   93a7b1:	80 e1 07             	and    $0x7,%cl
6c34   93a7b4:	80 c1 03             	add    $0x3,%cl
6c37   93a7b7:	38 c1                	cmp    %al,%cl
6c39   93a7b9:	0f 8c de fd ff ff    	jl     93a59d <shrink_lruvec+0x6a1d>
6c3f   93a7bf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a7c2: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6c46   93a7c6:	e8 00 00 00 00       	call   93a7cb <shrink_lruvec+0x6c4b>	93a7c7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c4b   93a7cb:	e9 cd fd ff ff       	jmp    93a59d <shrink_lruvec+0x6a1d>
6c50   93a7d0:	89 d1                	mov    %edx,%ecx
6c52   93a7d2:	80 e1 07             	and    $0x7,%cl
6c55   93a7d5:	80 c1 03             	add    $0x3,%cl
6c58   93a7d8:	38 c1                	cmp    %al,%cl
6c5a   93a7da:	0f 8c 34 fd ff ff    	jl     93a514 <shrink_lruvec+0x6994>
6c60   93a7e0:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
6c68   93a7e8:	e8 00 00 00 00       	call   93a7ed <shrink_lruvec+0x6c6d>	93a7e9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c6d   93a7ed:	48 8b 94 24 c8 00 00 00 	mov    0xc8(%rsp),%rdx
6c75   93a7f5:	e9 1a fd ff ff       	jmp    93a514 <shrink_lruvec+0x6994>
6c7a   93a7fa:	89 d1                	mov    %edx,%ecx
6c7c   93a7fc:	80 e1 07             	and    $0x7,%cl
6c7f   93a7ff:	80 c1 03             	add    $0x3,%cl
6c82   93a802:	38 c1                	cmp    %al,%cl
6c84   93a804:	0f 8c c8 fd ff ff    	jl     93a5d2 <shrink_lruvec+0x6a52>
6c8a   93a80a:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
6c92   93a812:	e8 00 00 00 00       	call   93a817 <shrink_lruvec+0x6c97>	93a813: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
6c97   93a817:	48 8b 94 24 c8 00 00 00 	mov    0xc8(%rsp),%rdx
6c9f   93a81f:	e9 ae fd ff ff       	jmp    93a5d2 <shrink_lruvec+0x6a52>
6ca4   93a824:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
6ca9   93a829:	80 e1 07             	and    $0x7,%cl
6cac   93a82c:	80 c1 01             	add    $0x1,%cl
6caf   93a82f:	38 c1                	cmp    %al,%cl
6cb1   93a831:	0f 8c 9d fb ff ff    	jl     93a3d4 <shrink_lruvec+0x6854>
6cb7   93a837:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
6cbc   93a83c:	e8 00 00 00 00       	call   93a841 <shrink_lruvec+0x6cc1>	93a83d: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
6cc1   93a841:	e9 8e fb ff ff       	jmp    93a3d4 <shrink_lruvec+0x6854>
6cc6   93a846:	e8 00 00 00 00       	call   93a84b <shrink_lruvec+0x6ccb>	93a847: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6ccb   93a84b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a84e: R_X86_64_32S	.data+0x58f9a0
6cd2   93a852:	4c 89 f6             	mov    %r14,%rsi
6cd5   93a855:	48 89 da             	mov    %rbx,%rdx
6cd8   93a858:	e8 00 00 00 00       	call   93a85d <shrink_lruvec+0x6cdd>	93a859: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
6cdd   93a85d:	e9 2e fc ff ff       	jmp    93a490 <shrink_lruvec+0x6910>
6ce2   93a862:	ba 28 00 00 00       	mov    $0x28,%edx
6ce7   93a867:	48 8d bc 24 d0 04 00 00 	lea    0x4d0(%rsp),%rdi
6cef   93a86f:	48 8d b4 24 80 04 00 00 	lea    0x480(%rsp),%rsi
6cf7   93a877:	e8 00 00 00 00       	call   93a87c <shrink_lruvec+0x6cfc>	93a878: R_X86_64_PLT32	memcpy-0x4
6cfc   93a87c:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
6d04   93a884:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6d09   93a889:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
6d11   93a891:	74 08                	je     93a89b <shrink_lruvec+0x6d1b>
6d13   93a893:	48 89 df             	mov    %rbx,%rdi
6d16   93a896:	e8 00 00 00 00       	call   93a89b <shrink_lruvec+0x6d1b>	93a897: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6d1b   93a89b:	48 83 3b 00          	cmpq   $0x0,(%rbx)
6d1f   93a89f:	74 07                	je     93a8a8 <shrink_lruvec+0x6d28>
6d21   93a8a1:	e8 00 00 00 00       	call   93a8a6 <shrink_lruvec+0x6d26>	93a8a2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6d26   93a8a6:	eb 77                	jmp    93a91f <shrink_lruvec+0x6d9f>
6d28   93a8a8:	65 48 8b 1c 25 00 00 00 00 	mov    %gs:0x0,%rbx	93a8ad: R_X86_64_32S	current_task
6d31   93a8b1:	48 83 c3 2c          	add    $0x2c,%rbx
6d35   93a8b5:	48 89 d8             	mov    %rbx,%rax
6d38   93a8b8:	48 c1 e8 03          	shr    $0x3,%rax
6d3c   93a8bc:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6d40   93a8c0:	84 c0                	test   %al,%al
6d42   93a8c2:	0f 85 e2 1f 00 00    	jne    93c8aa <shrink_lruvec+0x8d2a>
6d48   93a8c8:	44 8b 33             	mov    (%rbx),%r14d
6d4b   93a8cb:	bb 00 00 02 00       	mov    $0x20000,%ebx
6d50   93a8d0:	be 00 00 02 00       	mov    $0x20000,%esi
6d55   93a8d5:	44 21 f6             	and    %r14d,%esi
6d58   93a8d8:	31 ff                	xor    %edi,%edi
6d5a   93a8da:	e8 00 00 00 00       	call   93a8df <shrink_lruvec+0x6d5f>	93a8db: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
6d5f   93a8df:	44 21 f3             	and    %r14d,%ebx
6d62   93a8e2:	75 36                	jne    93a91a <shrink_lruvec+0x6d9a>
6d64   93a8e4:	e8 00 00 00 00       	call   93a8e9 <shrink_lruvec+0x6d69>	93a8e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6d69   93a8e9:	48 8b 84 24 b0 01 00 00 	mov    0x1b0(%rsp),%rax
6d71   93a8f1:	42 8a 04 28          	mov    (%rax,%r13,1),%al
6d75   93a8f5:	84 c0                	test   %al,%al
6d77   93a8f7:	0f 85 16 20 00 00    	jne    93c913 <shrink_lruvec+0x8d93>
6d7d   93a8fd:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
6d85   93a905:	0f b6 30             	movzbl (%rax),%esi
6d88   93a908:	83 fe 0c             	cmp    $0xc,%esi
6d8b   93a90b:	0f 94 c3             	sete   %bl
6d8e   93a90e:	bf 0c 00 00 00       	mov    $0xc,%edi
6d93   93a913:	e8 00 00 00 00       	call   93a918 <shrink_lruvec+0x6d98>	93a914: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
6d98   93a918:	eb 07                	jmp    93a921 <shrink_lruvec+0x6da1>
6d9a   93a91a:	e8 00 00 00 00       	call   93a91f <shrink_lruvec+0x6d9f>	93a91b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6d9f   93a91f:	31 db                	xor    %ebx,%ebx
6da1   93a921:	48 8d 94 24 80 04 00 00 	lea    0x480(%rsp),%rdx
6da9   93a929:	48 8d 42 10          	lea    0x10(%rdx),%rax
6dad   93a92d:	48 89 84 24 20 01 00 00 	mov    %rax,0x120(%rsp)
6db5   93a935:	48 8d 42 18          	lea    0x18(%rdx),%rax
6db9   93a939:	48 89 84 24 28 01 00 00 	mov    %rax,0x128(%rsp)
6dc1   93a941:	48 8d 84 24 c0 02 00 00 	lea    0x2c0(%rsp),%rax
6dc9   93a949:	4c 8d 60 08          	lea    0x8(%rax),%r12
6dcd   93a94d:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
6dd2   93a952:	48 8d 48 3c          	lea    0x3c(%rax),%rcx
6dd6   93a956:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
6ddb   93a95b:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
6de0   93a960:	48 8d 71 50          	lea    0x50(%rcx),%rsi
6de4   93a964:	48 89 b4 24 88 00 00 00 	mov    %rsi,0x88(%rsp)
6dec   93a96c:	48 8d 89 08 0b 00 00 	lea    0xb08(%rcx),%rcx
6df3   93a973:	48 89 8c 24 10 01 00 00 	mov    %rcx,0x110(%rsp)
6dfb   93a97b:	48 8d 8c 24 00 03 00 00 	lea    0x300(%rsp),%rcx
6e03   93a983:	48 8d 71 14          	lea    0x14(%rcx),%rsi
6e07   93a987:	48 89 b4 24 48 01 00 00 	mov    %rsi,0x148(%rsp)
6e0f   93a98f:	48 8d 71 04          	lea    0x4(%rcx),%rsi
6e13   93a993:	48 89 b4 24 c8 00 00 00 	mov    %rsi,0xc8(%rsp)
6e1b   93a99b:	48 8d 70 50          	lea    0x50(%rax),%rsi
6e1f   93a99f:	48 89 b4 24 b8 00 00 00 	mov    %rsi,0xb8(%rsp)
6e27   93a9a7:	48 8d 71 08          	lea    0x8(%rcx),%rsi
6e2b   93a9ab:	48 89 b4 24 70 01 00 00 	mov    %rsi,0x170(%rsp)
6e33   93a9b3:	48 89 d6             	mov    %rdx,%rsi
6e36   93a9b6:	48 c1 ee 03          	shr    $0x3,%rsi
6e3a   93a9ba:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a9bd: R_X86_64_32S	memory_cgrp_subsys_enabled_key
6e41   93a9c1:	48 c1 ef 03          	shr    $0x3,%rdi
6e45   93a9c5:	48 89 7c 24 48       	mov    %rdi,0x48(%rsp)
6e4a   93a9ca:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93a9cd: R_X86_64_32S	nr_cpu_ids
6e51   93a9d1:	48 c1 ef 03          	shr    $0x3,%rdi
6e55   93a9d5:	48 89 bc 24 a0 00 00 00 	mov    %rdi,0xa0(%rsp)
6e5d   93a9dd:	48 8d 78 58          	lea    0x58(%rax),%rdi
6e61   93a9e1:	48 89 bc 24 e8 00 00 00 	mov    %rdi,0xe8(%rsp)
6e69   93a9e9:	48 8d 78 54          	lea    0x54(%rax),%rdi
6e6d   93a9ed:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
6e72   93a9f2:	48 8d 79 0c          	lea    0xc(%rcx),%rdi
6e76   93a9f6:	48 89 bc 24 98 00 00 00 	mov    %rdi,0x98(%rsp)
6e7e   93a9fe:	48 8d 78 5c          	lea    0x5c(%rax),%rdi
6e82   93aa02:	48 89 bc 24 a8 01 00 00 	mov    %rdi,0x1a8(%rsp)
6e8a   93aa0a:	48 83 c1 10          	add    $0x10,%rcx
6e8e   93aa0e:	48 89 8c 24 40 01 00 00 	mov    %rcx,0x140(%rsp)
6e96   93aa16:	48 8d 48 60          	lea    0x60(%rax),%rcx
6e9a   93aa1a:	48 89 8c 24 90 00 00 00 	mov    %rcx,0x90(%rsp)
6ea2   93aa22:	48 8d 48 68          	lea    0x68(%rax),%rcx
6ea6   93aa26:	48 89 8c 24 a0 01 00 00 	mov    %rcx,0x1a0(%rsp)
6eae   93aa2e:	48 8d 40 64          	lea    0x64(%rax),%rax
6eb2   93aa32:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
6eba   93aa3a:	48 8d 42 08          	lea    0x8(%rdx),%rax
6ebe   93aa3e:	48 89 84 24 60 01 00 00 	mov    %rax,0x160(%rsp)
6ec6   93aa46:	48 8d 84 24 d0 04 00 00 	lea    0x4d0(%rsp),%rax
6ece   93aa4e:	48 8d 48 10          	lea    0x10(%rax),%rcx
6ed2   93aa52:	48 89 8c 24 98 01 00 00 	mov    %rcx,0x198(%rsp)
6eda   93aa5a:	48 8d 48 18          	lea    0x18(%rax),%rcx
6ede   93aa5e:	48 89 8c 24 d8 01 00 00 	mov    %rcx,0x1d8(%rsp)
6ee6   93aa66:	48 83 c0 08          	add    $0x8,%rax
6eea   93aa6a:	48 89 84 24 90 01 00 00 	mov    %rax,0x190(%rsp)
6ef2   93aa72:	48 89 b4 24 68 01 00 00 	mov    %rsi,0x168(%rsp)
6efa   93aa7a:	4a 8d 04 2e          	lea    (%rsi,%r13,1),%rax
6efe   93aa7e:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
6f03   93aa83:	31 c0                	xor    %eax,%eax
6f05   93aa85:	48 89 84 24 d0 00 00 00 	mov    %rax,0xd0(%rsp)
6f0d   93aa8d:	4c 89 a4 24 80 00 00 00 	mov    %r12,0x80(%rsp)
6f15   93aa95:	eb 0d                	jmp    93aaa4 <shrink_lruvec+0x6f24>
6f17   93aa97:	49 89 1e             	mov    %rbx,(%r14)
6f1a   93aa9a:	b3 01                	mov    $0x1,%bl
6f1c   93aa9c:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
6f24   93aaa4:	80 e3 01             	and    $0x1,%bl
6f27   93aaa7:	89 9c 24 f0 01 00 00 	mov    %ebx,0x1f0(%rsp)
6f2e   93aaae:	0f b6 f3             	movzbl %bl,%esi
6f31   93aab1:	31 ff                	xor    %edi,%edi
6f33   93aab3:	e8 00 00 00 00       	call   93aab8 <shrink_lruvec+0x6f38>	93aab4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
6f38   93aab8:	eb 05                	jmp    93aabf <shrink_lruvec+0x6f3f>
6f3a   93aaba:	e8 00 00 00 00       	call   93aabf <shrink_lruvec+0x6f3f>	93aabb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6f3f   93aabf:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
6f47   93aac7:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6f4c   93aacc:	74 0d                	je     93aadb <shrink_lruvec+0x6f5b>
6f4e   93aace:	48 8d bc 24 80 04 00 00 	lea    0x480(%rsp),%rdi
6f56   93aad6:	e8 00 00 00 00       	call   93aadb <shrink_lruvec+0x6f5b>	93aad7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f5b   93aadb:	48 8b 9c 24 80 04 00 00 	mov    0x480(%rsp),%rbx
6f63   93aae3:	31 ff                	xor    %edi,%edi
6f65   93aae5:	48 89 de             	mov    %rbx,%rsi
6f68   93aae8:	e8 00 00 00 00       	call   93aaed <shrink_lruvec+0x6f6d>	93aae9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6f6d   93aaed:	48 85 db             	test   %rbx,%rbx
6f70   93aaf0:	74 07                	je     93aaf9 <shrink_lruvec+0x6f79>
6f72   93aaf2:	e8 00 00 00 00       	call   93aaf7 <shrink_lruvec+0x6f77>	93aaf3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6f77   93aaf7:	eb 74                	jmp    93ab6d <shrink_lruvec+0x6fed>
6f79   93aaf9:	48 8b bc 24 28 01 00 00 	mov    0x128(%rsp),%rdi
6f81   93ab01:	48 89 f8             	mov    %rdi,%rax
6f84   93ab04:	48 c1 e8 03          	shr    $0x3,%rax
6f88   93ab08:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6f8d   93ab0d:	74 05                	je     93ab14 <shrink_lruvec+0x6f94>
6f8f   93ab0f:	e8 00 00 00 00       	call   93ab14 <shrink_lruvec+0x6f94>	93ab10: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6f94   93ab14:	48 8b 9c 24 98 04 00 00 	mov    0x498(%rsp),%rbx
6f9c   93ab1c:	31 ff                	xor    %edi,%edi
6f9e   93ab1e:	48 89 de             	mov    %rbx,%rsi
6fa1   93ab21:	e8 00 00 00 00       	call   93ab26 <shrink_lruvec+0x6fa6>	93ab22: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6fa6   93ab26:	48 85 db             	test   %rbx,%rbx
6fa9   93ab29:	74 07                	je     93ab32 <shrink_lruvec+0x6fb2>
6fab   93ab2b:	e8 00 00 00 00       	call   93ab30 <shrink_lruvec+0x6fb0>	93ab2c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6fb0   93ab30:	eb 3b                	jmp    93ab6d <shrink_lruvec+0x6fed>
6fb2   93ab32:	48 8b bc 24 20 01 00 00 	mov    0x120(%rsp),%rdi
6fba   93ab3a:	48 89 f8             	mov    %rdi,%rax
6fbd   93ab3d:	48 c1 e8 03          	shr    $0x3,%rax
6fc1   93ab41:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
6fc6   93ab46:	74 05                	je     93ab4d <shrink_lruvec+0x6fcd>
6fc8   93ab48:	e8 00 00 00 00       	call   93ab4d <shrink_lruvec+0x6fcd>	93ab49: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
6fcd   93ab4d:	48 8b 9c 24 90 04 00 00 	mov    0x490(%rsp),%rbx
6fd5   93ab55:	31 ff                	xor    %edi,%edi
6fd7   93ab57:	48 89 de             	mov    %rbx,%rsi
6fda   93ab5a:	e8 00 00 00 00       	call   93ab5f <shrink_lruvec+0x6fdf>	93ab5b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
6fdf   93ab5f:	48 85 db             	test   %rbx,%rbx
6fe2   93ab62:	0f 84 c4 15 00 00    	je     93c12c <shrink_lruvec+0x85ac>
6fe8   93ab68:	e8 00 00 00 00       	call   93ab6d <shrink_lruvec+0x6fed>	93ab69: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6fed   93ab6d:	4c 8d b4 24 80 04 00 00 	lea    0x480(%rsp),%r14
6ff5   93ab75:	45 31 ff             	xor    %r15d,%r15d
6ff8   93ab78:	eb 1c                	jmp    93ab96 <shrink_lruvec+0x7016>
6ffa   93ab7a:	e8 00 00 00 00       	call   93ab7f <shrink_lruvec+0x6fff>	93ab7b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
6fff   93ab7f:	49 83 ff 03          	cmp    $0x3,%r15
7003   93ab83:	0f 84 d3 11 00 00    	je     93bd5c <shrink_lruvec+0x81dc>
7009   93ab89:	e8 00 00 00 00       	call   93ab8e <shrink_lruvec+0x700e>	93ab8a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
700e   93ab8e:	49 83 c6 08          	add    $0x8,%r14
7012   93ab92:	49 83 c7 01          	add    $0x1,%r15
7016   93ab96:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
701b   93ab9b:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
7020   93aba0:	74 08                	je     93abaa <shrink_lruvec+0x702a>
7022   93aba2:	4c 89 f7             	mov    %r14,%rdi
7025   93aba5:	e8 00 00 00 00       	call   93abaa <shrink_lruvec+0x702a>	93aba6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
702a   93abaa:	4a 8b 9c fc 80 04 00 00 	mov    0x480(%rsp,%r15,8),%rbx
7032   93abb2:	31 ff                	xor    %edi,%edi
7034   93abb4:	48 89 de             	mov    %rbx,%rsi
7037   93abb7:	e8 00 00 00 00       	call   93abbc <shrink_lruvec+0x703c>	93abb8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
703c   93abbc:	48 85 db             	test   %rbx,%rbx
703f   93abbf:	74 b9                	je     93ab7a <shrink_lruvec+0x6ffa>
7041   93abc1:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
7046   93abc6:	bf 20 00 00 00       	mov    $0x20,%edi
704b   93abcb:	48 89 de             	mov    %rbx,%rsi
704e   93abce:	e8 00 00 00 00       	call   93abd3 <shrink_lruvec+0x7053>	93abcf: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
7053   93abd3:	48 83 fb 20          	cmp    $0x20,%rbx
7057   93abd7:	41 be 20 00 00 00    	mov    $0x20,%r14d
705d   93abdd:	4c 0f 42 f3          	cmovb  %rbx,%r14
7061   93abe1:	4c 29 f3             	sub    %r14,%rbx
7064   93abe4:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
7069   93abe9:	4c 89 7c 24 10       	mov    %r15,0x10(%rsp)
706e   93abee:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
7073   93abf3:	74 0a                	je     93abff <shrink_lruvec+0x707f>
7075   93abf5:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
707a   93abfa:	e8 00 00 00 00       	call   93abff <shrink_lruvec+0x707f>	93abfb: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
707f   93abff:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
7084   93ac04:	48 89 9c c4 80 04 00 00 	mov    %rbx,0x480(%rsp,%rax,8)
708c   93ac0c:	89 c3                	mov    %eax,%ebx
708e   93ac0e:	81 e3 fd ff ff 7f    	and    $0x7ffffffd,%ebx
7094   93ac14:	bf 01 00 00 00       	mov    $0x1,%edi
7099   93ac19:	89 de                	mov    %ebx,%esi
709b   93ac1b:	e8 00 00 00 00       	call   93ac20 <shrink_lruvec+0x70a0>	93ac1c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
70a0   93ac20:	83 fb 01             	cmp    $0x1,%ebx
70a3   93ac23:	75 79                	jne    93ac9e <shrink_lruvec+0x711e>
70a5   93ac25:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
70ad   93ac2d:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
70b2   93ac32:	84 c0                	test   %al,%al
70b4   93ac34:	0f 85 c8 0c 00 00    	jne    93b902 <shrink_lruvec+0x7d82>
70ba   93ac3a:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
70bf   93ac3f:	44 0f b7 20          	movzwl (%rax),%r12d
70c3   93ac43:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
70c8   93ac48:	44 89 fb             	mov    %r15d,%ebx
70cb   93ac4b:	81 e3 fe ff ff 7f    	and    $0x7ffffffe,%ebx
70d1   93ac51:	bf 02 00 00 00       	mov    $0x2,%edi
70d6   93ac56:	89 de                	mov    %ebx,%esi
70d8   93ac58:	e8 00 00 00 00       	call   93ac5d <shrink_lruvec+0x70dd>	93ac59: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
70dd   93ac5d:	83 fb 02             	cmp    $0x2,%ebx
70e0   93ac60:	0f 94 c1             	sete   %cl
70e3   93ac63:	bb 01 00 00 00       	mov    $0x1,%ebx
70e8   93ac68:	d3 e3                	shl    %cl,%ebx
70ea   93ac6a:	44 89 e6             	mov    %r12d,%esi
70ed   93ac6d:	21 de                	and    %ebx,%esi
70ef   93ac6f:	31 ff                	xor    %edi,%edi
70f1   93ac71:	e8 00 00 00 00       	call   93ac76 <shrink_lruvec+0x70f6>	93ac72: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
70f6   93ac76:	44 21 e3             	and    %r12d,%ebx
70f9   93ac79:	0f 84 81 02 00 00    	je     93af00 <shrink_lruvec+0x7380>
70ff   93ac7f:	e8 00 00 00 00       	call   93ac84 <shrink_lruvec+0x7104>	93ac80: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7104   93ac84:	4c 89 f7             	mov    %r14,%rdi
7107   93ac87:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
710c   93ac8c:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
7111   93ac91:	44 89 f9             	mov    %r15d,%ecx
7114   93ac94:	e8 67 f4 00 00       	call   94a100 <shrink_active_list>
7119   93ac99:	e9 23 04 00 00       	jmp    93b0c1 <shrink_lruvec+0x7541>
711e   93ac9e:	48 8d 9c 24 c0 02 00 00 	lea    0x2c0(%rsp),%rbx
7126   93aca6:	48 89 d8             	mov    %rbx,%rax
7129   93aca9:	48 c1 e8 03          	shr    $0x3,%rax
712d   93acad:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
7132   93acb2:	74 08                	je     93acbc <shrink_lruvec+0x713c>
7134   93acb4:	48 89 df             	mov    %rbx,%rdi
7137   93acb7:	e8 00 00 00 00       	call   93acbc <shrink_lruvec+0x713c>	93acb8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
713c   93acbc:	48 89 9c 24 c0 02 00 00 	mov    %rbx,0x2c0(%rsp)
7144   93acc4:	4c 89 e0             	mov    %r12,%rax
7147   93acc7:	48 c1 e8 03          	shr    $0x3,%rax
714b   93accb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
7150   93acd0:	4c 8d bc 24 e0 02 00 00 	lea    0x2e0(%rsp),%r15
7158   93acd8:	74 08                	je     93ace2 <shrink_lruvec+0x7162>
715a   93acda:	4c 89 e7             	mov    %r12,%rdi
715d   93acdd:	e8 00 00 00 00       	call   93ace2 <shrink_lruvec+0x7162>	93acde: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7162   93ace2:	48 89 9c 24 c8 02 00 00 	mov    %rbx,0x2c8(%rsp)
716a   93acea:	4c 89 f8             	mov    %r15,%rax
716d   93aced:	48 c1 e8 03          	shr    $0x3,%rax
7171   93acf1:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
7176   93acf6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
717b   93acfb:	74 08                	je     93ad05 <shrink_lruvec+0x7185>
717d   93acfd:	4c 89 ff             	mov    %r15,%rdi
7180   93ad00:	e8 00 00 00 00       	call   93ad05 <shrink_lruvec+0x7185>	93ad01: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
7185   93ad05:	48 c7 84 24 e0 02 00 00 00 00 00 00 	movq   $0x0,0x2e0(%rsp)
7191   93ad11:	ba 2c 00 00 00       	mov    $0x2c,%edx
7196   93ad16:	48 8d bc 24 00 03 00 00 	lea    0x300(%rsp),%rdi
719e   93ad1e:	31 f6                	xor    %esi,%esi
71a0   93ad20:	e8 00 00 00 00       	call   93ad25 <shrink_lruvec+0x71a5>	93ad21: R_X86_64_PLT32	memset-0x4
71a5   93ad25:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
71aa   93ad2a:	89 c6                	mov    %eax,%esi
71ac   93ad2c:	81 e6 fe ff ff 7f    	and    $0x7ffffffe,%esi
71b2   93ad32:	bf 02 00 00 00       	mov    $0x2,%edi
71b7   93ad37:	89 74 24 28          	mov    %esi,0x28(%rsp)
71bb   93ad3b:	e8 00 00 00 00       	call   93ad40 <shrink_lruvec+0x71c0>	93ad3c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
71c0   93ad40:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
71c8   93ad48:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
71cd   93ad4d:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
71d2   93ad52:	74 08                	je     93ad5c <shrink_lruvec+0x71dc>
71d4   93ad54:	4c 89 ff             	mov    %r15,%rdi
71d7   93ad57:	e8 00 00 00 00       	call   93ad5c <shrink_lruvec+0x71dc>	93ad58: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
71dc   93ad5c:	45 31 e4             	xor    %r12d,%r12d
71df   93ad5f:	83 7c 24 28 02       	cmpl   $0x2,0x28(%rsp)
71e4   93ad64:	0f 94 c3             	sete   %bl
71e7   93ad67:	4d 8b 3f             	mov    (%r15),%r15
71ea   93ad6a:	65 48 8b 04 25 00 00 00 00 	mov    %gs:0x0,%rax	93ad6f: R_X86_64_32S	current_task
71f3   93ad73:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
71f8   93ad78:	48 8d 50 2c          	lea    0x2c(%rax),%rdx
71fc   93ad7c:	48 89 d0             	mov    %rdx,%rax
71ff   93ad7f:	48 c1 e8 03          	shr    $0x3,%rax
7203   93ad83:	48 89 84 24 a8 00 00 00 	mov    %rax,0xa8(%rsp)
720b   93ad8b:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
7210   93ad90:	84 c0                	test   %al,%al
7212   93ad92:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
7217   93ad97:	0f 85 87 0b 00 00    	jne    93b924 <shrink_lruvec+0x7da4>
721d   93ad9d:	41 88 dc             	mov    %bl,%r12b
7220   93ada0:	41 8d 44 24 07       	lea    0x7(%r12),%eax
7225   93ada5:	89 84 24 00 01 00 00 	mov    %eax,0x100(%rsp)
722c   93adac:	8b 1a                	mov    (%rdx),%ebx
722e   93adae:	be 00 00 02 00       	mov    $0x20000,%esi
7233   93adb3:	21 de                	and    %ebx,%esi
7235   93adb5:	31 ff                	xor    %edi,%edi
7237   93adb7:	e8 00 00 00 00       	call   93adbc <shrink_lruvec+0x723c>	93adb8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
723c   93adbc:	b8 00 00 02 00       	mov    $0x20000,%eax
7241   93adc1:	21 c3                	and    %eax,%ebx
7243   93adc3:	4c 89 bc 24 c0 00 00 00 	mov    %r15,0xc0(%rsp)
724b   93adcb:	75 30                	jne    93adfd <shrink_lruvec+0x727d>
724d   93adcd:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
7255   93add5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
725a   93adda:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
7262   93ade2:	74 08                	je     93adec <shrink_lruvec+0x726c>
7264   93ade4:	48 89 df             	mov    %rbx,%rdi
7267   93ade7:	e8 00 00 00 00       	call   93adec <shrink_lruvec+0x726c>	93ade8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
726c   93adec:	48 83 3b 00          	cmpq   $0x0,(%rbx)
7270   93adf0:	0f 84 e1 06 00 00    	je     93b4d7 <shrink_lruvec+0x7957>
7276   93adf6:	e8 00 00 00 00       	call   93adfb <shrink_lruvec+0x727b>	93adf7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
727b   93adfb:	eb 05                	jmp    93ae02 <shrink_lruvec+0x7282>
727d   93adfd:	e8 00 00 00 00       	call   93ae02 <shrink_lruvec+0x7282>	93adfe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7282   93ae02:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
728a   93ae0a:	83 7c 24 28 02       	cmpl   $0x2,0x28(%rsp)
728f   93ae0f:	0f 94 84 24 50 01 00 00 	sete   0x150(%rsp)
7297   93ae17:	e8 00 00 00 00       	call   93ae1c <shrink_lruvec+0x729c>	93ae18: R_X86_64_PLT32	lru_add_drain-0x4
729c   93ae1c:	48 89 df             	mov    %rbx,%rdi
729f   93ae1f:	e8 00 00 00 00       	call   93ae24 <shrink_lruvec+0x72a4>	93ae20: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
72a4   93ae24:	4c 89 f7             	mov    %r14,%rdi
72a7   93ae27:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
72ac   93ae2c:	48 8d 94 24 c0 02 00 00 	lea    0x2c0(%rsp),%rdx
72b4   93ae34:	48 8d 8c 24 e0 02 00 00 	lea    0x2e0(%rsp),%rcx
72bc   93ae3c:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
72c1   93ae41:	4c 8b 4c 24 10       	mov    0x10(%rsp),%r9
72c6   93ae46:	e8 75 87 01 00       	call   9535c0 <isolate_lru_pages>
72cb   93ae4b:	4c 89 ff             	mov    %r15,%rdi
72ce   93ae4e:	8b b4 24 00 01 00 00 	mov    0x100(%rsp),%esi
72d5   93ae55:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
72da   93ae5a:	48 89 c2             	mov    %rax,%rdx
72dd   93ae5d:	e8 00 00 00 00       	call   93ae62 <shrink_lruvec+0x72e2>	93ae5e: R_X86_64_PLT32	__mod_node_page_state-0x4
72e2   93ae62:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
72ea   93ae6a:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
72ef   93ae6f:	84 c0                	test   %al,%al
72f1   93ae71:	4c 89 eb             	mov    %r13,%rbx
72f4   93ae74:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
72f9   93ae79:	0f 85 c9 0a 00 00    	jne    93b948 <shrink_lruvec+0x7dc8>
72ff   93ae7f:	45 31 ed             	xor    %r13d,%r13d
7302   93ae82:	8b 32                	mov    (%rdx),%esi
7304   93ae84:	b8 00 00 02 00       	mov    $0x20000,%eax
7309   93ae89:	21 c6                	and    %eax,%esi
730b   93ae8b:	41 0f 94 c4          	sete   %r12b
730f   93ae8f:	31 ff                	xor    %edi,%edi
7311   93ae91:	e8 00 00 00 00       	call   93ae96 <shrink_lruvec+0x7316>	93ae92: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7316   93ae96:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
731b   93ae9b:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
731f   93ae9f:	84 c0                	test   %al,%al
7321   93aea1:	0f 85 c5 0a 00 00    	jne    93b96c <shrink_lruvec+0x7dec>
7327   93aea7:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93aead <shrink_lruvec+0x732d>	93aea9: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
732d   93aead:	bf 01 00 00 00       	mov    $0x1,%edi
7332   93aeb2:	89 de                	mov    %ebx,%esi
7334   93aeb4:	e8 00 00 00 00       	call   93aeb9 <shrink_lruvec+0x7339>	93aeb5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7339   93aeb9:	85 db                	test   %ebx,%ebx
733b   93aebb:	7e 7a                	jle    93af37 <shrink_lruvec+0x73b7>
733d   93aebd:	e8 00 00 00 00       	call   93aec2 <shrink_lruvec+0x7342>	93aebe: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7342   93aec2:	48 8b 94 24 10 01 00 00 	mov    0x110(%rsp),%rdx
734a   93aeca:	48 89 d0             	mov    %rdx,%rax
734d   93aecd:	48 c1 e8 03          	shr    $0x3,%rax
7351   93aed1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
735b   93aedb:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
735f   93aedf:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
7364   93aee4:	74 15                	je     93aefb <shrink_lruvec+0x737b>
7366   93aee6:	48 8b bc 24 10 01 00 00 	mov    0x110(%rsp),%rdi
736e   93aeee:	e8 00 00 00 00       	call   93aef3 <shrink_lruvec+0x7373>	93aeef: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7373   93aef3:	48 8b 94 24 10 01 00 00 	mov    0x110(%rsp),%rdx
737b   93aefb:	4c 8b 32             	mov    (%rdx),%r14
737e   93aefe:	eb 44                	jmp    93af44 <shrink_lruvec+0x73c4>
7380   93af00:	e8 00 00 00 00       	call   93af05 <shrink_lruvec+0x7385>	93af01: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7385   93af05:	41 83 cc 08          	or     $0x8,%r12d
7389   93af09:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
7391   93af11:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
7396   93af16:	84 c0                	test   %al,%al
7398   93af18:	48 8b 5c 24 70       	mov    0x70(%rsp),%rbx
739d   93af1d:	0f 85 86 0d 00 00    	jne    93bca9 <shrink_lruvec+0x8129>
73a3   93af23:	66 44 89 23          	mov    %r12w,(%rbx)
73a7   93af27:	45 31 ed             	xor    %r13d,%r13d
73aa   93af2a:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
73b2   93af32:	e9 90 07 00 00       	jmp    93b6c7 <shrink_lruvec+0x7b47>
73b7   93af37:	e8 00 00 00 00       	call   93af3c <shrink_lruvec+0x73bc>	93af38: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
73bc   93af3c:	45 31 f6             	xor    %r14d,%r14d
73bf   93af3f:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
73c4   93af44:	45 88 e5             	mov    %r12b,%r13b
73c7   93af47:	41 83 cd 1a          	or     $0x1a,%r13d
73cb   93af4b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
73d5   93af55:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
73da   93af5a:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
73de   93af5e:	74 0d                	je     93af6d <shrink_lruvec+0x73ed>
73e0   93af60:	48 8d bc 24 e0 02 00 00 	lea    0x2e0(%rsp),%rdi
73e8   93af68:	e8 00 00 00 00       	call   93af6d <shrink_lruvec+0x73ed>	93af69: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
73ed   93af6d:	48 8b 9c 24 e0 02 00 00 	mov    0x2e0(%rsp),%rbx
73f5   93af75:	4c 89 f7             	mov    %r14,%rdi
73f8   93af78:	44 89 ee             	mov    %r13d,%esi
73fb   93af7b:	48 89 da             	mov    %rbx,%rdx
73fe   93af7e:	e8 00 00 00 00       	call   93af83 <shrink_lruvec+0x7403>	93af7f: R_X86_64_PLT32	__count_memcg_events-0x4
7403   93af83:	4c 8b b4 24 88 00 00 00 	mov    0x88(%rsp),%r14
740b   93af8b:	4c 89 f7             	mov    %r14,%rdi
740e   93af8e:	e8 00 00 00 00       	call   93af93 <shrink_lruvec+0x7413>	93af8f: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
7413   93af93:	31 ff                	xor    %edi,%edi
7415   93af95:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
741a   93af9a:	4c 89 e6             	mov    %r12,%rsi
741d   93af9d:	e8 00 00 00 00       	call   93afa2 <shrink_lruvec+0x7422>	93af9e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
7422   93afa2:	4d 85 e4             	test   %r12,%r12
7425   93afa5:	0f 84 11 01 00 00    	je     93b0bc <shrink_lruvec+0x753c>
742b   93afab:	48 89 5c 24 78       	mov    %rbx,0x78(%rsp)
7430   93afb0:	48 8d 9c 24 c0 02 00 00 	lea    0x2c0(%rsp),%rbx
7438   93afb8:	48 89 df             	mov    %rbx,%rdi
743b   93afbb:	4c 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%r15
7443   93afc3:	4c 89 fe             	mov    %r15,%rsi
7446   93afc6:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
744b   93afcb:	48 8d 8c 24 00 03 00 00 	lea    0x300(%rsp),%rcx
7453   93afd3:	45 31 c0             	xor    %r8d,%r8d
7456   93afd6:	e8 e5 bd fe ff       	call   926dc0 <shrink_page_list>
745b   93afdb:	41 89 c5             	mov    %eax,%r13d
745e   93afde:	4c 89 f7             	mov    %r14,%rdi
7461   93afe1:	e8 00 00 00 00       	call   93afe6 <shrink_lruvec+0x7466>	93afe2: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
7466   93afe6:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
746b   93afeb:	48 89 de             	mov    %rbx,%rsi
746e   93afee:	e8 8d 74 01 00       	call   952480 <move_pages_to_lru>
7473   93aff3:	49 f7 dc             	neg    %r12
7476   93aff6:	4c 89 ff             	mov    %r15,%rdi
7479   93aff9:	8b b4 24 00 01 00 00 	mov    0x100(%rsp),%esi
7480   93b000:	4c 89 e2             	mov    %r12,%rdx
7483   93b003:	e8 00 00 00 00       	call   93b008 <shrink_lruvec+0x7488>	93b004: R_X86_64_PLT32	__mod_node_page_state-0x4
7488   93b008:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
7492   93b012:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
749a   93b01a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
749f   93b01f:	84 c0                	test   %al,%al
74a1   93b021:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
74a6   93b026:	0f 85 66 09 00 00    	jne    93b992 <shrink_lruvec+0x7e12>
74ac   93b02c:	45 31 f6             	xor    %r14d,%r14d
74af   93b02f:	8b 32                	mov    (%rdx),%esi
74b1   93b031:	b8 00 00 02 00       	mov    $0x20000,%eax
74b6   93b036:	21 c6                	and    %eax,%esi
74b8   93b038:	0f 94 c3             	sete   %bl
74bb   93b03b:	31 ff                	xor    %edi,%edi
74bd   93b03d:	e8 00 00 00 00       	call   93b042 <shrink_lruvec+0x74c2>	93b03e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
74c2   93b042:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
74c7   93b047:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
74cc   93b04c:	84 c0                	test   %al,%al
74ce   93b04e:	0f 85 62 09 00 00    	jne    93b9b6 <shrink_lruvec+0x7e36>
74d4   93b054:	41 88 de             	mov    %bl,%r14b
74d7   93b057:	41 83 ce 16          	or     $0x16,%r14d
74db   93b05b:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93b061 <shrink_lruvec+0x74e1>	93b05d: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
74e1   93b061:	bf 01 00 00 00       	mov    $0x1,%edi
74e6   93b066:	89 de                	mov    %ebx,%esi
74e8   93b068:	e8 00 00 00 00       	call   93b06d <shrink_lruvec+0x74ed>	93b069: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
74ed   93b06d:	85 db                	test   %ebx,%ebx
74ef   93b06f:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
74f7   93b077:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
74fc   93b07c:	7e 58                	jle    93b0d6 <shrink_lruvec+0x7556>
74fe   93b07e:	e8 00 00 00 00       	call   93b083 <shrink_lruvec+0x7503>	93b07f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7503   93b083:	48 8b 94 24 10 01 00 00 	mov    0x110(%rsp),%rdx
750b   93b08b:	48 89 d0             	mov    %rdx,%rax
750e   93b08e:	48 c1 e8 03          	shr    $0x3,%rax
7512   93b092:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
751c   93b09c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
7520   93b0a0:	74 15                	je     93b0b7 <shrink_lruvec+0x7537>
7522   93b0a2:	48 8b bc 24 10 01 00 00 	mov    0x110(%rsp),%rdi
752a   93b0aa:	e8 00 00 00 00       	call   93b0af <shrink_lruvec+0x752f>	93b0ab: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
752f   93b0af:	48 8b 94 24 10 01 00 00 	mov    0x110(%rsp),%rdx
7537   93b0b7:	48 8b 3a             	mov    (%rdx),%rdi
753a   93b0ba:	eb 21                	jmp    93b0dd <shrink_lruvec+0x755d>
753c   93b0bc:	e8 00 00 00 00       	call   93b0c1 <shrink_lruvec+0x7541>	93b0bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7541   93b0c1:	45 31 ed             	xor    %r13d,%r13d
7544   93b0c4:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
754c   93b0cc:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
7551   93b0d1:	e9 35 06 00 00       	jmp    93b70b <shrink_lruvec+0x7b8b>
7556   93b0d6:	e8 00 00 00 00       	call   93b0db <shrink_lruvec+0x755b>	93b0d7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
755b   93b0db:	31 ff                	xor    %edi,%edi
755d   93b0dd:	45 89 ed             	mov    %r13d,%r13d
7560   93b0e0:	44 89 f6             	mov    %r14d,%esi
7563   93b0e3:	4c 89 ea             	mov    %r13,%rdx
7566   93b0e6:	e8 00 00 00 00       	call   93b0eb <shrink_lruvec+0x756b>	93b0e7: R_X86_64_PLT32	__count_memcg_events-0x4
756b   93b0eb:	48 89 df             	mov    %rbx,%rdi
756e   93b0ee:	e8 00 00 00 00       	call   93b0f3 <shrink_lruvec+0x7573>	93b0ef: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
7573   93b0f3:	48 8b 84 24 48 01 00 00 	mov    0x148(%rsp),%rax
757b   93b0fb:	48 c1 e8 03          	shr    $0x3,%rax
757f   93b0ff:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
7589   93b109:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
758d   93b10d:	84 c0                	test   %al,%al
758f   93b10f:	0f 85 c7 08 00 00    	jne    93b9dc <shrink_lruvec+0x7e5c>
7595   93b115:	31 f6                	xor    %esi,%esi
7597   93b117:	83 7c 24 28 02       	cmpl   $0x2,0x28(%rsp)
759c   93b11c:	40 0f 94 c6          	sete   %sil
75a0   93b120:	8b 94 24 14 03 00 00 	mov    0x314(%rsp),%edx
75a7   93b127:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
75ac   93b12c:	e8 00 00 00 00       	call   93b131 <shrink_lruvec+0x75b1>	93b12d: R_X86_64_PLT32	lru_note_cost-0x4
75b1   93b131:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
75b6   93b136:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
75ba   93b13a:	84 c0                	test   %al,%al
75bc   93b13c:	0f 85 c2 08 00 00    	jne    93ba04 <shrink_lruvec+0x7e84>
75c2   93b142:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93b148 <shrink_lruvec+0x75c8>	93b144: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
75c8   93b148:	bf 01 00 00 00       	mov    $0x1,%edi
75cd   93b14d:	89 de                	mov    %ebx,%esi
75cf   93b14f:	e8 00 00 00 00       	call   93b154 <shrink_lruvec+0x75d4>	93b150: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
75d4   93b154:	85 db                	test   %ebx,%ebx
75d6   93b156:	7e 17                	jle    93b16f <shrink_lruvec+0x75ef>
75d8   93b158:	e8 00 00 00 00       	call   93b15d <shrink_lruvec+0x75dd>	93b159: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
75dd   93b15d:	48 8d 9c 24 c0 02 00 00 	lea    0x2c0(%rsp),%rbx
75e5   93b165:	48 89 df             	mov    %rbx,%rdi
75e8   93b168:	e8 00 00 00 00       	call   93b16d <shrink_lruvec+0x75ed>	93b169: R_X86_64_PLT32	__mem_cgroup_uncharge_list-0x4
75ed   93b16d:	eb 0d                	jmp    93b17c <shrink_lruvec+0x75fc>
75ef   93b16f:	e8 00 00 00 00       	call   93b174 <shrink_lruvec+0x75f4>	93b170: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
75f4   93b174:	48 8d 9c 24 c0 02 00 00 	lea    0x2c0(%rsp),%rbx
75fc   93b17c:	48 89 df             	mov    %rbx,%rdi
75ff   93b17f:	e8 00 00 00 00       	call   93b184 <shrink_lruvec+0x7604>	93b180: R_X86_64_PLT32	free_unref_page_list-0x4
7604   93b184:	4c 8b b4 24 c8 00 00 00 	mov    0xc8(%rsp),%r14
760c   93b18c:	49 c1 ee 03          	shr    $0x3,%r14
7610   93b190:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
761a   93b19a:	41 0f b6 04 06       	movzbl (%r14,%rax,1),%eax
761f   93b19f:	84 c0                	test   %al,%al
7621   93b1a1:	0f 85 83 08 00 00    	jne    93ba2a <shrink_lruvec+0x7eaa>
7627   93b1a7:	8b 9c 24 04 03 00 00 	mov    0x304(%rsp),%ebx
762e   93b1ae:	4c 89 e7             	mov    %r12,%rdi
7631   93b1b1:	48 89 de             	mov    %rbx,%rsi
7634   93b1b4:	e8 00 00 00 00       	call   93b1b9 <shrink_lruvec+0x7639>	93b1b5: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
7639   93b1b9:	49 39 dc             	cmp    %rbx,%r12
763c   93b1bc:	75 11                	jne    93b1cf <shrink_lruvec+0x764f>
763e   93b1be:	e8 00 00 00 00       	call   93b1c3 <shrink_lruvec+0x7643>	93b1bf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7643   93b1c3:	bf 01 00 00 00       	mov    $0x1,%edi
7648   93b1c8:	e8 00 00 00 00       	call   93b1cd <shrink_lruvec+0x764d>	93b1c9: R_X86_64_PLT32	wakeup_flusher_threads-0x4
764d   93b1cd:	eb 05                	jmp    93b1d4 <shrink_lruvec+0x7654>
764f   93b1cf:	e8 00 00 00 00       	call   93b1d4 <shrink_lruvec+0x7654>	93b1d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7654   93b1d4:	48 8d 84 24 00 03 00 00 	lea    0x300(%rsp),%rax
765c   93b1dc:	48 c1 e8 03          	shr    $0x3,%rax
7660   93b1e0:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
766a   93b1ea:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
766f   93b1ef:	84 c0                	test   %al,%al
7671   93b1f1:	48 8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%rdx
7679   93b1f9:	0f 85 53 08 00 00    	jne    93ba52 <shrink_lruvec+0x7ed2>
767f   93b1ff:	8b 9c 24 00 03 00 00 	mov    0x300(%rsp),%ebx
7686   93b206:	48 89 d0             	mov    %rdx,%rax
7689   93b209:	48 c1 e8 03          	shr    $0x3,%rax
768d   93b20d:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
7692   93b212:	84 c0                	test   %al,%al
7694   93b214:	0f 85 68 08 00 00    	jne    93ba82 <shrink_lruvec+0x7f02>
769a   93b21a:	01 1a                	add    %ebx,(%rdx)
769c   93b21c:	48 8b 84 24 70 01 00 00 	mov    0x170(%rsp),%rax
76a4   93b224:	48 c1 e8 03          	shr    $0x3,%rax
76a8   93b228:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
76ad   93b22d:	84 c0                	test   %al,%al
76af   93b22f:	0f 85 77 08 00 00    	jne    93baac <shrink_lruvec+0x7f2c>
76b5   93b235:	8b 9c 24 08 03 00 00 	mov    0x308(%rsp),%ebx
76bc   93b23c:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
76c4   93b244:	48 89 f8             	mov    %rdi,%rax
76c7   93b247:	48 c1 e8 03          	shr    $0x3,%rax
76cb   93b24b:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
76d0   93b250:	84 c0                	test   %al,%al
76d2   93b252:	0f 85 7c 08 00 00    	jne    93bad4 <shrink_lruvec+0x7f54>
76d8   93b258:	01 1f                	add    %ebx,(%rdi)
76da   93b25a:	43 0f b6 04 26       	movzbl (%r14,%r12,1),%eax
76df   93b25f:	84 c0                	test   %al,%al
76e1   93b261:	0f 85 8f 08 00 00    	jne    93baf6 <shrink_lruvec+0x7f76>
76e7   93b267:	8b 9c 24 04 03 00 00 	mov    0x304(%rsp),%ebx
76ee   93b26e:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
76f3   93b273:	48 89 d0             	mov    %rdx,%rax
76f6   93b276:	48 c1 e8 03          	shr    $0x3,%rax
76fa   93b27a:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
76ff   93b27f:	84 c0                	test   %al,%al
7701   93b281:	0f 85 97 08 00 00    	jne    93bb1e <shrink_lruvec+0x7f9e>
7707   93b287:	01 1a                	add    %ebx,(%rdx)
7709   93b289:	48 8b 84 24 98 00 00 00 	mov    0x98(%rsp),%rax
7711   93b291:	48 c1 e8 03          	shr    $0x3,%rax
7715   93b295:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
771a   93b29a:	84 c0                	test   %al,%al
771c   93b29c:	0f 85 a0 08 00 00    	jne    93bb42 <shrink_lruvec+0x7fc2>
7722   93b2a2:	8b 9c 24 0c 03 00 00 	mov    0x30c(%rsp),%ebx
7729   93b2a9:	48 8b 94 24 a8 01 00 00 	mov    0x1a8(%rsp),%rdx
7731   93b2b1:	48 89 d0             	mov    %rdx,%rax
7734   93b2b4:	48 c1 e8 03          	shr    $0x3,%rax
7738   93b2b8:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
773d   93b2bd:	84 c0                	test   %al,%al
773f   93b2bf:	0f 85 a5 08 00 00    	jne    93bb6a <shrink_lruvec+0x7fea>
7745   93b2c5:	01 1a                	add    %ebx,(%rdx)
7747   93b2c7:	48 8b 84 24 40 01 00 00 	mov    0x140(%rsp),%rax
774f   93b2cf:	48 c1 e8 03          	shr    $0x3,%rax
7753   93b2d3:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
7758   93b2d8:	84 c0                	test   %al,%al
775a   93b2da:	0f 85 b4 08 00 00    	jne    93bb94 <shrink_lruvec+0x8014>
7760   93b2e0:	8b 9c 24 10 03 00 00 	mov    0x310(%rsp),%ebx
7767   93b2e7:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
776f   93b2ef:	48 89 d0             	mov    %rdx,%rax
7772   93b2f2:	48 c1 e8 03          	shr    $0x3,%rax
7776   93b2f6:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
777b   93b2fb:	84 c0                	test   %al,%al
777d   93b2fd:	0f 85 b9 08 00 00    	jne    93bbbc <shrink_lruvec+0x803c>
7783   93b303:	01 1a                	add    %ebx,(%rdx)
7785   93b305:	48 8b 94 24 a0 01 00 00 	mov    0x1a0(%rsp),%rdx
778d   93b30d:	48 89 d0             	mov    %rdx,%rax
7790   93b310:	48 c1 e8 03          	shr    $0x3,%rax
7794   93b314:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
7799   93b319:	84 c0                	test   %al,%al
779b   93b31b:	0f 85 c5 08 00 00    	jne    93bbe6 <shrink_lruvec+0x8066>
77a1   93b321:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
77a6   93b326:	01 02                	add    %eax,(%rdx)
77a8   93b328:	83 7c 24 28 02       	cmpl   $0x2,0x28(%rsp)
77ad   93b32d:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
77b5   93b335:	75 33                	jne    93b36a <shrink_lruvec+0x77ea>
77b7   93b337:	e8 00 00 00 00       	call   93b33c <shrink_lruvec+0x77bc>	93b338: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
77bc   93b33c:	48 8b 94 24 e0 00 00 00 	mov    0xe0(%rsp),%rdx
77c4   93b344:	48 89 d0             	mov    %rdx,%rax
77c7   93b347:	48 c1 e8 03          	shr    $0x3,%rax
77cb   93b34b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
77d5   93b355:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
77d9   93b359:	84 c0                	test   %al,%al
77db   93b35b:	0f 85 65 09 00 00    	jne    93bcc6 <shrink_lruvec+0x8146>
77e1   93b361:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
77e6   93b366:	01 02                	add    %eax,(%rdx)
77e8   93b368:	eb 05                	jmp    93b36f <shrink_lruvec+0x77ef>
77ea   93b36a:	e8 00 00 00 00       	call   93b36f <shrink_lruvec+0x77ef>	93b36b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
77ef   93b36f:	49 81 c7 88 2d 00 00 	add    $0x2d88,%r15
77f6   93b376:	4c 89 f8             	mov    %r15,%rax
77f9   93b379:	48 c1 e8 03          	shr    $0x3,%rax
77fd   93b37d:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
7807   93b387:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
780b   93b38b:	84 c0                	test   %al,%al
780d   93b38d:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
7815   93b395:	0f 85 75 08 00 00    	jne    93bc10 <shrink_lruvec+0x8090>
781b   93b39b:	45 8b 3f             	mov    (%r15),%r15d
781e   93b39e:	48 8b 84 24 b0 01 00 00 	mov    0x1b0(%rsp),%rax
7826   93b3a6:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
782a   93b3aa:	84 c0                	test   %al,%al
782c   93b3ac:	0f 85 84 08 00 00    	jne    93bc36 <shrink_lruvec+0x80b6>
7832   93b3b2:	44 0f be 32          	movsbl (%rdx),%r14d
7836   93b3b6:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93b3bc <shrink_lruvec+0x783c>	93b3b8: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x4
783c   93b3bc:	31 ff                	xor    %edi,%edi
783e   93b3be:	89 de                	mov    %ebx,%esi
7840   93b3c0:	e8 00 00 00 00       	call   93b3c5 <shrink_lruvec+0x7845>	93b3c1: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7845   93b3c5:	85 db                	test   %ebx,%ebx
7847   93b3c7:	0f 8e 8d 00 00 00    	jle    93b45a <shrink_lruvec+0x78da>
784d   93b3cd:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 93b3d4 <shrink_lruvec+0x7854>	93b3d0: R_X86_64_PC32	cpu_number-0x4
7854   93b3d4:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
785e   93b3de:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
7866   93b3e6:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
786a   93b3ea:	84 c0                	test   %al,%al
786c   93b3ec:	0f 85 91 08 00 00    	jne    93bc83 <shrink_lruvec+0x8103>
7872   93b3f2:	44 8b 25 00 00 00 00 	mov    0x0(%rip),%r12d        # 93b3f9 <shrink_lruvec+0x7879>	93b3f5: R_X86_64_PC32	nr_cpu_ids-0x4
7879   93b3f9:	44 89 e7             	mov    %r12d,%edi
787c   93b3fc:	89 de                	mov    %ebx,%esi
787e   93b3fe:	e8 00 00 00 00       	call   93b403 <shrink_lruvec+0x7883>	93b3ff: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
7883   93b403:	41 39 dc             	cmp    %ebx,%r12d
7886   93b406:	0f 86 e8 04 00 00    	jbe    93b8f4 <shrink_lruvec+0x7d74>
788c   93b40c:	e8 00 00 00 00       	call   93b411 <shrink_lruvec+0x7891>	93b40d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7891   93b411:	4c 8b a4 24 80 00 00 00 	mov    0x80(%rsp),%r12
7899   93b419:	89 db                	mov    %ebx,%ebx
789b   93b41b:	48 89 d8             	mov    %rbx,%rax
789e   93b41e:	48 c1 e8 06          	shr    $0x6,%rax
78a2   93b422:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	93b426: R_X86_64_32S	__cpu_online_mask
78aa   93b42a:	be 08 00 00 00       	mov    $0x8,%esi
78af   93b42f:	e8 00 00 00 00       	call   93b434 <shrink_lruvec+0x78b4>	93b430: R_X86_64_PLT32	__kasan_check_read-0x4
78b4   93b434:	31 f6                	xor    %esi,%esi
78b6   93b436:	48 0f a3 1d 00 00 00 00 	bt     %rbx,0x0(%rip)        # 93b43e <shrink_lruvec+0x78be>	93b43a: R_X86_64_PC32	__cpu_online_mask-0x4
78be   93b43e:	0f 92 c3             	setb   %bl
78c1   93b441:	40 0f 92 c6          	setb   %sil
78c5   93b445:	31 ff                	xor    %edi,%edi
78c7   93b447:	e8 00 00 00 00       	call   93b44c <shrink_lruvec+0x78cc>	93b448: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
78cc   93b44c:	84 db                	test   %bl,%bl
78ce   93b44e:	75 14                	jne    93b464 <shrink_lruvec+0x78e4>
78d0   93b450:	e8 00 00 00 00       	call   93b455 <shrink_lruvec+0x78d5>	93b451: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
78d5   93b455:	e9 6d 02 00 00       	jmp    93b6c7 <shrink_lruvec+0x7b47>
78da   93b45a:	e8 00 00 00 00       	call   93b45f <shrink_lruvec+0x78df>	93b45b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
78df   93b45f:	e9 e2 01 00 00       	jmp    93b646 <shrink_lruvec+0x7ac6>
78e4   93b464:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 93b46b <shrink_lruvec+0x78eb>	93b467: R_X86_64_PC32	__preempt_count-0x4
78eb   93b46b:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 93b472 <shrink_lruvec+0x78f2>	93b46e: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
78f2   93b472:	48 85 db             	test   %rbx,%rbx
78f5   93b475:	0f 84 bf 01 00 00    	je     93b63a <shrink_lruvec+0x7aba>
78fb   93b47b:	e8 00 00 00 00       	call   93b480 <shrink_lruvec+0x7900>	93b47c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7900   93b480:	48 83 c3 08          	add    $0x8,%rbx
7904   93b484:	48 89 d8             	mov    %rbx,%rax
7907   93b487:	48 c1 e8 03          	shr    $0x3,%rax
790b   93b48b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
7915   93b495:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
7919   93b499:	74 08                	je     93b4a3 <shrink_lruvec+0x7923>
791b   93b49b:	48 89 df             	mov    %rbx,%rdi
791e   93b49e:	e8 00 00 00 00       	call   93b4a3 <shrink_lruvec+0x7923>	93b49f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7923   93b4a3:	31 c0                	xor    %eax,%eax
7925   93b4a5:	0f b6 8c 24 50 01 00 00 	movzbl 0x150(%rsp),%ecx
792d   93b4ad:	88 c8                	mov    %cl,%al
792f   93b4af:	48 8b 3b             	mov    (%rbx),%rdi
7932   93b4b2:	44 89 fe             	mov    %r15d,%esi
7935   93b4b5:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
793a   93b4ba:	4c 89 e9             	mov    %r13,%rcx
793d   93b4bd:	4c 8d 84 24 00 03 00 00 	lea    0x300(%rsp),%r8
7945   93b4c5:	45 89 f1             	mov    %r14d,%r9d
7948   93b4c8:	50                   	push   %rax
7949   93b4c9:	e8 00 00 00 00       	call   93b4ce <shrink_lruvec+0x794e>	93b4ca: R_X86_64_PLT32	__SCT__tp_func_mm_vmscan_lru_shrink_inactive-0x4
794e   93b4ce:	48 83 c4 08          	add    $0x8,%rsp
7952   93b4d2:	e9 68 01 00 00       	jmp    93b63f <shrink_lruvec+0x7abf>
7957   93b4d7:	45 01 e4             	add    %r12d,%r12d
795a   93b4da:	4c 89 ff             	mov    %r15,%rdi
795d   93b4dd:	44 89 e6             	mov    %r12d,%esi
7960   93b4e0:	e8 00 00 00 00       	call   93b4e5 <shrink_lruvec+0x7965>	93b4e1: R_X86_64_PLT32	node_page_state-0x4
7965   93b4e5:	48 89 84 24 f8 01 00 00 	mov    %rax,0x1f8(%rsp)
796d   93b4ed:	4c 89 ff             	mov    %r15,%rdi
7970   93b4f0:	8b b4 24 00 01 00 00 	mov    0x100(%rsp),%esi
7977   93b4f7:	e8 00 00 00 00       	call   93b4fc <shrink_lruvec+0x797c>	93b4f8: R_X86_64_PLT32	node_page_state-0x4
797c   93b4fc:	48 89 84 24 50 01 00 00 	mov    %rax,0x150(%rsp)
7984   93b504:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
7989   93b509:	48 89 d0             	mov    %rdx,%rax
798c   93b50c:	48 c1 e8 03          	shr    $0x3,%rax
7990   93b510:	48 89 84 24 18 01 00 00 	mov    %rax,0x118(%rsp)
7998   93b518:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
799d   93b51d:	84 c0                	test   %al,%al
799f   93b51f:	0f 85 cb 07 00 00    	jne    93bcf0 <shrink_lruvec+0x8170>
79a5   93b525:	8b 1a                	mov    (%rdx),%ebx
79a7   93b527:	b8 c0 00 00 00       	mov    $0xc0,%eax
79ac   93b52c:	21 c3                	and    %eax,%ebx
79ae   93b52e:	bf c0 00 00 00       	mov    $0xc0,%edi
79b3   93b533:	89 de                	mov    %ebx,%esi
79b5   93b535:	e8 00 00 00 00       	call   93b53a <shrink_lruvec+0x79ba>	93b536: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
79ba   93b53a:	48 8b 84 24 f8 01 00 00 	mov    0x1f8(%rsp),%rax
79c2   93b542:	49 89 c5             	mov    %rax,%r13
79c5   93b545:	49 c1 ed 03          	shr    $0x3,%r13
79c9   93b549:	81 fb c0 00 00 00    	cmp    $0xc0,%ebx
79cf   93b54f:	4c 0f 45 e8          	cmovne %rax,%r13
79d3   93b553:	48 8b 9c 24 50 01 00 00 	mov    0x150(%rsp),%rbx
79db   93b55b:	48 89 df             	mov    %rbx,%rdi
79de   93b55e:	4c 89 ee             	mov    %r13,%rsi
79e1   93b561:	e8 00 00 00 00       	call   93b566 <shrink_lruvec+0x79e6>	93b562: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
79e6   93b566:	4c 39 eb             	cmp    %r13,%rbx
79e9   93b569:	76 6c                	jbe    93b5d7 <shrink_lruvec+0x7a57>
79eb   93b56b:	4c 89 ff             	mov    %r15,%rdi
79ee   93b56e:	be 01 00 00 00       	mov    $0x1,%esi
79f3   93b573:	e8 00 00 00 00       	call   93b578 <shrink_lruvec+0x79f8>	93b574: R_X86_64_PLT32	reclaim_throttle-0x4
79f8   93b578:	4c 8b 7c 24 38       	mov    0x38(%rsp),%r15
79fd   93b57d:	4c 89 ff             	mov    %r15,%rdi
7a00   93b580:	be 08 00 00 00       	mov    $0x8,%esi
7a05   93b585:	e8 00 00 00 00       	call   93b58a <shrink_lruvec+0x7a0a>	93b586: R_X86_64_PLT32	__kasan_check_read-0x4
7a0a   93b58a:	4c 89 f8             	mov    %r15,%rax
7a0d   93b58d:	48 c1 e8 03          	shr    $0x3,%rax
7a11   93b591:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
7a1b   93b59b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
7a20   93b5a0:	74 08                	je     93b5aa <shrink_lruvec+0x7a2a>
7a22   93b5a2:	4c 89 ff             	mov    %r15,%rdi
7a25   93b5a5:	e8 00 00 00 00       	call   93b5aa <shrink_lruvec+0x7a2a>	93b5a6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7a2a   93b5aa:	49 8b 1f             	mov    (%r15),%rbx
7a2d   93b5ad:	48 89 de             	mov    %rbx,%rsi
7a30   93b5b0:	48 83 e6 04          	and    $0x4,%rsi
7a34   93b5b4:	31 ff                	xor    %edi,%edi
7a36   93b5b6:	e8 00 00 00 00       	call   93b5bb <shrink_lruvec+0x7a3b>	93b5b7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
7a3b   93b5bb:	48 83 e3 04          	and    $0x4,%rbx
7a3f   93b5bf:	0f 85 98 01 00 00    	jne    93b75d <shrink_lruvec+0x7bdd>
7a45   93b5c5:	e8 00 00 00 00       	call   93b5ca <shrink_lruvec+0x7a4a>	93b5c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a4a   93b5ca:	4c 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%r15
7a52   93b5d2:	e9 d0 01 00 00       	jmp    93b7a7 <shrink_lruvec+0x7c27>
7a57   93b5d7:	e8 00 00 00 00       	call   93b5dc <shrink_lruvec+0x7a5c>	93b5d8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a5c   93b5dc:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
7a66   93b5e6:	4d 8d a7 e0 2e 00 00 	lea    0x2ee0(%r15),%r12
7a6d   93b5ed:	4c 89 e0             	mov    %r12,%rax
7a70   93b5f0:	48 c1 e8 03          	shr    $0x3,%rax
7a74   93b5f4:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
7a79   93b5f9:	48 8b 9c 24 88 00 00 00 	mov    0x88(%rsp),%rbx
7a81   93b601:	74 08                	je     93b60b <shrink_lruvec+0x7a8b>
7a83   93b603:	4c 89 e7             	mov    %r12,%rdi
7a86   93b606:	e8 00 00 00 00       	call   93b60b <shrink_lruvec+0x7a8b>	93b607: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7a8b   93b60b:	49 8b 04 24          	mov    (%r12),%rax
7a8f   93b60f:	4c 39 e0             	cmp    %r12,%rax
7a92   93b612:	0f 84 f1 01 00 00    	je     93b809 <shrink_lruvec+0x7c89>
7a98   93b618:	e8 00 00 00 00       	call   93b61d <shrink_lruvec+0x7a9d>	93b619: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7a9d   93b61d:	49 8d bf 98 2e 00 00 	lea    0x2e98(%r15),%rdi
7aa4   93b624:	be 03 00 00 00       	mov    $0x3,%esi
7aa9   93b629:	ba 01 00 00 00       	mov    $0x1,%edx
7aae   93b62e:	31 c9                	xor    %ecx,%ecx
7ab0   93b630:	e8 00 00 00 00       	call   93b635 <shrink_lruvec+0x7ab5>	93b631: R_X86_64_PLT32	__wake_up-0x4
7ab5   93b635:	e9 d0 f7 ff ff       	jmp    93ae0a <shrink_lruvec+0x728a>
7aba   93b63a:	e8 00 00 00 00       	call   93b63f <shrink_lruvec+0x7abf>	93b63b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7abf   93b63f:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 93b646 <shrink_lruvec+0x7ac6>	93b642: R_X86_64_PC32	__preempt_count-0x4
7ac6   93b646:	65 44 8b 35 00 00 00 00 	mov    %gs:0x0(%rip),%r14d        # 93b64e <shrink_lruvec+0x7ace>	93b64a: R_X86_64_PC32	cpu_number-0x4
7ace   93b64e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
7ad8   93b658:	48 8b 8c 24 a0 00 00 00 	mov    0xa0(%rsp),%rcx
7ae0   93b660:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
7ae4   93b664:	84 c0                	test   %al,%al
7ae6   93b666:	0f 85 f1 05 00 00    	jne    93bc5d <shrink_lruvec+0x80dd>
7aec   93b66c:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93b672 <shrink_lruvec+0x7af2>	93b66e: R_X86_64_PC32	nr_cpu_ids-0x4
7af2   93b672:	89 df                	mov    %ebx,%edi
7af4   93b674:	44 89 f6             	mov    %r14d,%esi
7af7   93b677:	e8 00 00 00 00       	call   93b67c <shrink_lruvec+0x7afc>	93b678: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
7afc   93b67c:	44 39 f3             	cmp    %r14d,%ebx
7aff   93b67f:	0f 86 61 02 00 00    	jbe    93b8e6 <shrink_lruvec+0x7d66>
7b05   93b685:	e8 00 00 00 00       	call   93b68a <shrink_lruvec+0x7b0a>	93b686: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7b0a   93b68a:	44 89 f3             	mov    %r14d,%ebx
7b0d   93b68d:	48 89 d8             	mov    %rbx,%rax
7b10   93b690:	48 c1 e8 06          	shr    $0x6,%rax
7b14   93b694:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	93b698: R_X86_64_32S	__cpu_online_mask
7b1c   93b69c:	be 08 00 00 00       	mov    $0x8,%esi
7b21   93b6a1:	e8 00 00 00 00       	call   93b6a6 <shrink_lruvec+0x7b26>	93b6a2: R_X86_64_PLT32	__kasan_check_read-0x4
7b26   93b6a6:	31 f6                	xor    %esi,%esi
7b28   93b6a8:	48 0f a3 1d 00 00 00 00 	bt     %rbx,0x0(%rip)        # 93b6b0 <shrink_lruvec+0x7b30>	93b6ac: R_X86_64_PC32	__cpu_online_mask-0x4
7b30   93b6b0:	0f 92 c3             	setb   %bl
7b33   93b6b3:	40 0f 92 c6          	setb   %sil
7b37   93b6b7:	31 ff                	xor    %edi,%edi
7b39   93b6b9:	e8 00 00 00 00       	call   93b6be <shrink_lruvec+0x7b3e>	93b6ba: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
7b3e   93b6be:	84 db                	test   %bl,%bl
7b40   93b6c0:	75 11                	jne    93b6d3 <shrink_lruvec+0x7b53>
7b42   93b6c2:	e8 00 00 00 00       	call   93b6c7 <shrink_lruvec+0x7b47>	93b6c3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7b47   93b6c7:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
7b4c   93b6cc:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
7b51   93b6d1:	eb 38                	jmp    93b70b <shrink_lruvec+0x7b8b>
7b53   93b6d3:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 93b6da <shrink_lruvec+0x7b5a>	93b6d6: R_X86_64_PC32	__preempt_count-0x4
7b5a   93b6da:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 93b6e1 <shrink_lruvec+0x7b61>	93b6dd: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
7b61   93b6e1:	e8 00 00 00 00       	call   93b6e6 <shrink_lruvec+0x7b66>	93b6e2: R_X86_64_PLT32	rcu_read_lock_sched_held-0x4
7b66   93b6e6:	89 c3                	mov    %eax,%ebx
7b68   93b6e8:	31 ff                	xor    %edi,%edi
7b6a   93b6ea:	89 c6                	mov    %eax,%esi
7b6c   93b6ec:	e8 00 00 00 00       	call   93b6f1 <shrink_lruvec+0x7b71>	93b6ed: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7b71   93b6f1:	85 db                	test   %ebx,%ebx
7b73   93b6f3:	4c 8b 74 24 20       	mov    0x20(%rsp),%r14
7b78   93b6f8:	74 32                	je     93b72c <shrink_lruvec+0x7bac>
7b7a   93b6fa:	e8 00 00 00 00       	call   93b6ff <shrink_lruvec+0x7b7f>	93b6fb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7b7f   93b6ff:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
7b84   93b704:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 93b70b <shrink_lruvec+0x7b8b>	93b707: R_X86_64_PC32	__preempt_count-0x4
7b8b   93b70b:	4c 01 ac 24 d0 00 00 00 	add    %r13,0xd0(%rsp)
7b93   93b713:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
7b9d   93b71d:	49 83 ff 03          	cmp    $0x3,%r15
7ba1   93b721:	0f 85 62 f4 ff ff    	jne    93ab89 <shrink_lruvec+0x7009>
7ba7   93b727:	e9 30 06 00 00       	jmp    93bd5c <shrink_lruvec+0x81dc>
7bac   93b72c:	e8 00 00 00 00       	call   93b731 <shrink_lruvec+0x7bb1>	93b72d: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
7bb1   93b731:	89 c3                	mov    %eax,%ebx
7bb3   93b733:	31 ff                	xor    %edi,%edi
7bb5   93b735:	89 c6                	mov    %eax,%esi
7bb7   93b737:	e8 00 00 00 00       	call   93b73c <shrink_lruvec+0x7bbc>	93b738: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7bbc   93b73c:	85 db                	test   %ebx,%ebx
7bbe   93b73e:	0f 84 d9 00 00 00    	je     93b81d <shrink_lruvec+0x7c9d>
7bc4   93b744:	80 3d 00 00 00 00 01 	cmpb   $0x1,0x0(%rip)        # 93b74b <shrink_lruvec+0x7bcb>	93b746: R_X86_64_PC32	.data.unlikely+0x2f2
7bcb   93b74b:	4c 8b 7c 24 10       	mov    0x10(%rsp),%r15
7bd0   93b750:	0f 85 d1 00 00 00    	jne    93b827 <shrink_lruvec+0x7ca7>
7bd6   93b756:	e8 00 00 00 00       	call   93b75b <shrink_lruvec+0x7bdb>	93b757: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7bdb   93b75b:	eb a7                	jmp    93b704 <shrink_lruvec+0x7b84>
7bdd   93b75d:	49 81 c7 28 08 00 00 	add    $0x828,%r15
7be4   93b764:	4c 89 f8             	mov    %r15,%rax
7be7   93b767:	48 c1 e8 03          	shr    $0x3,%rax
7beb   93b76b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
7bf0   93b770:	74 08                	je     93b77a <shrink_lruvec+0x7bfa>
7bf2   93b772:	4c 89 ff             	mov    %r15,%rdi
7bf5   93b775:	e8 00 00 00 00       	call   93b77a <shrink_lruvec+0x7bfa>	93b776: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7bfa   93b77a:	49 8b 1f             	mov    (%r15),%rbx
7bfd   93b77d:	be 00 01 00 00       	mov    $0x100,%esi
7c02   93b782:	48 21 de             	and    %rbx,%rsi
7c05   93b785:	31 ff                	xor    %edi,%edi
7c07   93b787:	e8 00 00 00 00       	call   93b78c <shrink_lruvec+0x7c0c>	93b788: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
7c0c   93b78c:	b8 00 01 00 00       	mov    $0x100,%eax
7c11   93b791:	48 21 c3             	and    %rax,%rbx
7c14   93b794:	4c 8b bc 24 c0 00 00 00 	mov    0xc0(%rsp),%r15
7c1c   93b79c:	0f 85 ae 00 00 00    	jne    93b850 <shrink_lruvec+0x7cd0>
7c22   93b7a2:	e8 00 00 00 00       	call   93b7a7 <shrink_lruvec+0x7c27>	93b7a3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c27   93b7a7:	48 8b 84 24 a8 00 00 00 	mov    0xa8(%rsp),%rax
7c2f   93b7af:	42 0f b6 04 28       	movzbl (%rax,%r13,1),%eax
7c34   93b7b4:	84 c0                	test   %al,%al
7c36   93b7b6:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
7c3b   93b7bb:	0f 85 53 05 00 00    	jne    93bd14 <shrink_lruvec+0x8194>
7c41   93b7c1:	8b 1a                	mov    (%rdx),%ebx
7c43   93b7c3:	be 00 00 02 00       	mov    $0x20000,%esi
7c48   93b7c8:	21 de                	and    %ebx,%esi
7c4a   93b7ca:	31 ff                	xor    %edi,%edi
7c4c   93b7cc:	e8 00 00 00 00       	call   93b7d1 <shrink_lruvec+0x7c51>	93b7cd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7c51   93b7d1:	b8 00 00 02 00       	mov    $0x20000,%eax
7c56   93b7d6:	21 c3                	and    %eax,%ebx
7c58   93b7d8:	75 39                	jne    93b813 <shrink_lruvec+0x7c93>
7c5a   93b7da:	48 8b 84 24 30 01 00 00 	mov    0x130(%rsp),%rax
7c62   93b7e2:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
7c67   93b7e7:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
7c6f   93b7ef:	74 08                	je     93b7f9 <shrink_lruvec+0x7c79>
7c71   93b7f1:	48 89 df             	mov    %rbx,%rdi
7c74   93b7f4:	e8 00 00 00 00       	call   93b7f9 <shrink_lruvec+0x7c79>	93b7f5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
7c79   93b7f9:	48 83 3b 00          	cmpq   $0x0,(%rbx)
7c7d   93b7fd:	74 61                	je     93b860 <shrink_lruvec+0x7ce0>
7c7f   93b7ff:	e8 00 00 00 00       	call   93b804 <shrink_lruvec+0x7c84>	93b800: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c84   93b804:	e9 f9 f5 ff ff       	jmp    93ae02 <shrink_lruvec+0x7282>
7c89   93b809:	e8 00 00 00 00       	call   93b80e <shrink_lruvec+0x7c8e>	93b80a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c8e   93b80e:	e9 f7 f5 ff ff       	jmp    93ae0a <shrink_lruvec+0x728a>
7c93   93b813:	e8 00 00 00 00       	call   93b818 <shrink_lruvec+0x7c98>	93b814: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7c98   93b818:	e9 e5 f5 ff ff       	jmp    93ae02 <shrink_lruvec+0x7282>
7c9d   93b81d:	e8 00 00 00 00       	call   93b822 <shrink_lruvec+0x7ca2>	93b81e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7ca2   93b822:	e9 d8 fe ff ff       	jmp    93b6ff <shrink_lruvec+0x7b7f>
7ca7   93b827:	e8 00 00 00 00       	call   93b82c <shrink_lruvec+0x7cac>	93b828: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7cac   93b82c:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 93b833 <shrink_lruvec+0x7cb3>	93b82e: R_X86_64_PC32	.data.unlikely+0x2f2
7cb3   93b833:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93b836: R_X86_64_32S	.rodata+0x134a80
7cba   93b83a:	be 92 01 00 00       	mov    $0x192,%esi
7cbf   93b83f:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	93b842: R_X86_64_32S	.rodata+0x1323e0
7cc6   93b846:	e8 00 00 00 00       	call   93b84b <shrink_lruvec+0x7ccb>	93b847: R_X86_64_PLT32	lockdep_rcu_suspicious-0x4
7ccb   93b84b:	e9 b4 fe ff ff       	jmp    93b704 <shrink_lruvec+0x7b84>
7cd0   93b850:	e8 00 00 00 00       	call   93b855 <shrink_lruvec+0x7cd5>	93b851: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7cd5   93b855:	41 bd 20 00 00 00    	mov    $0x20,%r13d
7cdb   93b85b:	e9 ca f6 ff ff       	jmp    93af2a <shrink_lruvec+0x73aa>
7ce0   93b860:	4c 89 ff             	mov    %r15,%rdi
7ce3   93b863:	44 89 e6             	mov    %r12d,%esi
7ce6   93b866:	e8 00 00 00 00       	call   93b86b <shrink_lruvec+0x7ceb>	93b867: R_X86_64_PLT32	node_page_state-0x4
7ceb   93b86b:	49 89 c4             	mov    %rax,%r12
7cee   93b86e:	4c 89 ff             	mov    %r15,%rdi
7cf1   93b871:	8b b4 24 00 01 00 00 	mov    0x100(%rsp),%esi
7cf8   93b878:	e8 00 00 00 00       	call   93b87d <shrink_lruvec+0x7cfd>	93b879: R_X86_64_PLT32	node_page_state-0x4
7cfd   93b87d:	4c 89 e9             	mov    %r13,%rcx
7d00   93b880:	49 89 c5             	mov    %rax,%r13
7d03   93b883:	48 8b 84 24 18 01 00 00 	mov    0x118(%rsp),%rax
7d0b   93b88b:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax
7d0f   93b88f:	84 c0                	test   %al,%al
7d11   93b891:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
7d16   93b896:	0f 85 9c 04 00 00    	jne    93bd38 <shrink_lruvec+0x81b8>
7d1c   93b89c:	8b 1a                	mov    (%rdx),%ebx
7d1e   93b89e:	b8 c0 00 00 00       	mov    $0xc0,%eax
7d23   93b8a3:	21 c3                	and    %eax,%ebx
7d25   93b8a5:	bf c0 00 00 00       	mov    $0xc0,%edi
7d2a   93b8aa:	89 de                	mov    %ebx,%esi
7d2c   93b8ac:	e8 00 00 00 00       	call   93b8b1 <shrink_lruvec+0x7d31>	93b8ad: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
7d31   93b8b1:	4c 89 e0             	mov    %r12,%rax
7d34   93b8b4:	49 c1 ec 03          	shr    $0x3,%r12
7d38   93b8b8:	81 fb c0 00 00 00    	cmp    $0xc0,%ebx
7d3e   93b8be:	4c 0f 45 e0          	cmovne %rax,%r12
7d42   93b8c2:	4c 89 ef             	mov    %r13,%rdi
7d45   93b8c5:	4c 89 e6             	mov    %r12,%rsi
7d48   93b8c8:	e8 00 00 00 00       	call   93b8cd <shrink_lruvec+0x7d4d>	93b8c9: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
7d4d   93b8cd:	4d 39 e5             	cmp    %r12,%r13
7d50   93b8d0:	76 0a                	jbe    93b8dc <shrink_lruvec+0x7d5c>
7d52   93b8d2:	e8 00 00 00 00       	call   93b8d7 <shrink_lruvec+0x7d57>	93b8d3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7d57   93b8d7:	e9 4b f6 ff ff       	jmp    93af27 <shrink_lruvec+0x73a7>
7d5c   93b8dc:	e8 00 00 00 00       	call   93b8e1 <shrink_lruvec+0x7d61>	93b8dd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7d61   93b8e1:	e9 f6 fc ff ff       	jmp    93b5dc <shrink_lruvec+0x7a5c>
7d66   93b8e6:	e8 00 00 00 00       	call   93b8eb <shrink_lruvec+0x7d6b>	93b8e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7d6b   93b8eb:	90                   	nop
7d6c   93b8ec:	0f 0b                	ud2
7d6e   93b8ee:	90                   	nop
7d6f   93b8ef:	e9 96 fd ff ff       	jmp    93b68a <shrink_lruvec+0x7b0a>
7d74   93b8f4:	e8 00 00 00 00       	call   93b8f9 <shrink_lruvec+0x7d79>	93b8f5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
7d79   93b8f9:	90                   	nop
7d7a   93b8fa:	0f 0b                	ud2
7d7c   93b8fc:	90                   	nop
7d7d   93b8fd:	e9 0f fb ff ff       	jmp    93b411 <shrink_lruvec+0x7891>
7d82   93b902:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
7d87   93b907:	80 e1 07             	and    $0x7,%cl
7d8a   93b90a:	80 c1 01             	add    $0x1,%cl
7d8d   93b90d:	38 c1                	cmp    %al,%cl
7d8f   93b90f:	0f 8c 25 f3 ff ff    	jl     93ac3a <shrink_lruvec+0x70ba>
7d95   93b915:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
7d9a   93b91a:	e8 00 00 00 00       	call   93b91f <shrink_lruvec+0x7d9f>	93b91b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
7d9f   93b91f:	e9 16 f3 ff ff       	jmp    93ac3a <shrink_lruvec+0x70ba>
7da4   93b924:	89 d1                	mov    %edx,%ecx
7da6   93b926:	80 e1 07             	and    $0x7,%cl
7da9   93b929:	80 c1 03             	add    $0x3,%cl
7dac   93b92c:	38 c1                	cmp    %al,%cl
7dae   93b92e:	0f 8c 69 f4 ff ff    	jl     93ad9d <shrink_lruvec+0x721d>
7db4   93b934:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
7db9   93b939:	e8 00 00 00 00       	call   93b93e <shrink_lruvec+0x7dbe>	93b93a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7dbe   93b93e:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
7dc3   93b943:	e9 55 f4 ff ff       	jmp    93ad9d <shrink_lruvec+0x721d>
7dc8   93b948:	89 d1                	mov    %edx,%ecx
7dca   93b94a:	80 e1 07             	and    $0x7,%cl
7dcd   93b94d:	80 c1 03             	add    $0x3,%cl
7dd0   93b950:	38 c1                	cmp    %al,%cl
7dd2   93b952:	0f 8c 27 f5 ff ff    	jl     93ae7f <shrink_lruvec+0x72ff>
7dd8   93b958:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
7ddd   93b95d:	e8 00 00 00 00       	call   93b962 <shrink_lruvec+0x7de2>	93b95e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7de2   93b962:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
7de7   93b967:	e9 13 f5 ff ff       	jmp    93ae7f <shrink_lruvec+0x72ff>
7dec   93b96c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93b96f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
7df3   93b973:	80 e1 07             	and    $0x7,%cl
7df6   93b976:	80 c1 03             	add    $0x3,%cl
7df9   93b979:	38 c1                	cmp    %al,%cl
7dfb   93b97b:	0f 8c 26 f5 ff ff    	jl     93aea7 <shrink_lruvec+0x7327>
7e01   93b981:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93b984: R_X86_64_32S	memory_cgrp_subsys_enabled_key
7e08   93b988:	e8 00 00 00 00       	call   93b98d <shrink_lruvec+0x7e0d>	93b989: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7e0d   93b98d:	e9 15 f5 ff ff       	jmp    93aea7 <shrink_lruvec+0x7327>
7e12   93b992:	89 d1                	mov    %edx,%ecx
7e14   93b994:	80 e1 07             	and    $0x7,%cl
7e17   93b997:	80 c1 03             	add    $0x3,%cl
7e1a   93b99a:	38 c1                	cmp    %al,%cl
7e1c   93b99c:	0f 8c 8a f6 ff ff    	jl     93b02c <shrink_lruvec+0x74ac>
7e22   93b9a2:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
7e27   93b9a7:	e8 00 00 00 00       	call   93b9ac <shrink_lruvec+0x7e2c>	93b9a8: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7e2c   93b9ac:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
7e31   93b9b1:	e9 76 f6 ff ff       	jmp    93b02c <shrink_lruvec+0x74ac>
7e36   93b9b6:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93b9b9: R_X86_64_32S	memory_cgrp_subsys_enabled_key
7e3d   93b9bd:	80 e1 07             	and    $0x7,%cl
7e40   93b9c0:	80 c1 03             	add    $0x3,%cl
7e43   93b9c3:	38 c1                	cmp    %al,%cl
7e45   93b9c5:	0f 8c 89 f6 ff ff    	jl     93b054 <shrink_lruvec+0x74d4>
7e4b   93b9cb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93b9ce: R_X86_64_32S	memory_cgrp_subsys_enabled_key
7e52   93b9d2:	e8 00 00 00 00       	call   93b9d7 <shrink_lruvec+0x7e57>	93b9d3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7e57   93b9d7:	e9 78 f6 ff ff       	jmp    93b054 <shrink_lruvec+0x74d4>
7e5c   93b9dc:	48 8b 8c 24 48 01 00 00 	mov    0x148(%rsp),%rcx
7e64   93b9e4:	80 e1 07             	and    $0x7,%cl
7e67   93b9e7:	80 c1 03             	add    $0x3,%cl
7e6a   93b9ea:	38 c1                	cmp    %al,%cl
7e6c   93b9ec:	0f 8c 23 f7 ff ff    	jl     93b115 <shrink_lruvec+0x7595>
7e72   93b9f2:	48 8b bc 24 48 01 00 00 	mov    0x148(%rsp),%rdi
7e7a   93b9fa:	e8 00 00 00 00       	call   93b9ff <shrink_lruvec+0x7e7f>	93b9fb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7e7f   93b9ff:	e9 11 f7 ff ff       	jmp    93b115 <shrink_lruvec+0x7595>
7e84   93ba04:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93ba07: R_X86_64_32S	memory_cgrp_subsys_enabled_key
7e8b   93ba0b:	80 e1 07             	and    $0x7,%cl
7e8e   93ba0e:	80 c1 03             	add    $0x3,%cl
7e91   93ba11:	38 c1                	cmp    %al,%cl
7e93   93ba13:	0f 8c 29 f7 ff ff    	jl     93b142 <shrink_lruvec+0x75c2>
7e99   93ba19:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93ba1c: R_X86_64_32S	memory_cgrp_subsys_enabled_key
7ea0   93ba20:	e8 00 00 00 00       	call   93ba25 <shrink_lruvec+0x7ea5>	93ba21: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7ea5   93ba25:	e9 18 f7 ff ff       	jmp    93b142 <shrink_lruvec+0x75c2>
7eaa   93ba2a:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
7eb2   93ba32:	80 e1 07             	and    $0x7,%cl
7eb5   93ba35:	80 c1 03             	add    $0x3,%cl
7eb8   93ba38:	38 c1                	cmp    %al,%cl
7eba   93ba3a:	0f 8c 67 f7 ff ff    	jl     93b1a7 <shrink_lruvec+0x7627>
7ec0   93ba40:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
7ec8   93ba48:	e8 00 00 00 00       	call   93ba4d <shrink_lruvec+0x7ecd>	93ba49: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7ecd   93ba4d:	e9 55 f7 ff ff       	jmp    93b1a7 <shrink_lruvec+0x7627>
7ed2   93ba52:	48 8d 8c 24 00 03 00 00 	lea    0x300(%rsp),%rcx
7eda   93ba5a:	80 e1 07             	and    $0x7,%cl
7edd   93ba5d:	80 c1 03             	add    $0x3,%cl
7ee0   93ba60:	38 c1                	cmp    %al,%cl
7ee2   93ba62:	0f 8c 97 f7 ff ff    	jl     93b1ff <shrink_lruvec+0x767f>
7ee8   93ba68:	48 8d bc 24 00 03 00 00 	lea    0x300(%rsp),%rdi
7ef0   93ba70:	e8 00 00 00 00       	call   93ba75 <shrink_lruvec+0x7ef5>	93ba71: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7ef5   93ba75:	48 8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%rdx
7efd   93ba7d:	e9 7d f7 ff ff       	jmp    93b1ff <shrink_lruvec+0x767f>
7f02   93ba82:	89 d1                	mov    %edx,%ecx
7f04   93ba84:	80 e1 07             	and    $0x7,%cl
7f07   93ba87:	80 c1 03             	add    $0x3,%cl
7f0a   93ba8a:	38 c1                	cmp    %al,%cl
7f0c   93ba8c:	0f 8c 88 f7 ff ff    	jl     93b21a <shrink_lruvec+0x769a>
7f12   93ba92:	48 8b bc 24 b8 00 00 00 	mov    0xb8(%rsp),%rdi
7f1a   93ba9a:	e8 00 00 00 00       	call   93ba9f <shrink_lruvec+0x7f1f>	93ba9b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7f1f   93ba9f:	48 8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%rdx
7f27   93baa7:	e9 6e f7 ff ff       	jmp    93b21a <shrink_lruvec+0x769a>
7f2c   93baac:	48 8b 8c 24 70 01 00 00 	mov    0x170(%rsp),%rcx
7f34   93bab4:	80 e1 07             	and    $0x7,%cl
7f37   93bab7:	80 c1 03             	add    $0x3,%cl
7f3a   93baba:	38 c1                	cmp    %al,%cl
7f3c   93babc:	0f 8c 73 f7 ff ff    	jl     93b235 <shrink_lruvec+0x76b5>
7f42   93bac2:	48 8b bc 24 70 01 00 00 	mov    0x170(%rsp),%rdi
7f4a   93baca:	e8 00 00 00 00       	call   93bacf <shrink_lruvec+0x7f4f>	93bacb: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7f4f   93bacf:	e9 61 f7 ff ff       	jmp    93b235 <shrink_lruvec+0x76b5>
7f54   93bad4:	89 f9                	mov    %edi,%ecx
7f56   93bad6:	80 e1 07             	and    $0x7,%cl
7f59   93bad9:	80 c1 03             	add    $0x3,%cl
7f5c   93badc:	38 c1                	cmp    %al,%cl
7f5e   93bade:	0f 8c 74 f7 ff ff    	jl     93b258 <shrink_lruvec+0x76d8>
7f64   93bae4:	e8 00 00 00 00       	call   93bae9 <shrink_lruvec+0x7f69>	93bae5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7f69   93bae9:	48 8b bc 24 e8 00 00 00 	mov    0xe8(%rsp),%rdi
7f71   93baf1:	e9 62 f7 ff ff       	jmp    93b258 <shrink_lruvec+0x76d8>
7f76   93baf6:	48 8b 8c 24 c8 00 00 00 	mov    0xc8(%rsp),%rcx
7f7e   93bafe:	80 e1 07             	and    $0x7,%cl
7f81   93bb01:	80 c1 03             	add    $0x3,%cl
7f84   93bb04:	38 c1                	cmp    %al,%cl
7f86   93bb06:	0f 8c 5b f7 ff ff    	jl     93b267 <shrink_lruvec+0x76e7>
7f8c   93bb0c:	48 8b bc 24 c8 00 00 00 	mov    0xc8(%rsp),%rdi
7f94   93bb14:	e8 00 00 00 00       	call   93bb19 <shrink_lruvec+0x7f99>	93bb15: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7f99   93bb19:	e9 49 f7 ff ff       	jmp    93b267 <shrink_lruvec+0x76e7>
7f9e   93bb1e:	89 d1                	mov    %edx,%ecx
7fa0   93bb20:	80 e1 07             	and    $0x7,%cl
7fa3   93bb23:	80 c1 03             	add    $0x3,%cl
7fa6   93bb26:	38 c1                	cmp    %al,%cl
7fa8   93bb28:	0f 8c 59 f7 ff ff    	jl     93b287 <shrink_lruvec+0x7707>
7fae   93bb2e:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
7fb3   93bb33:	e8 00 00 00 00       	call   93bb38 <shrink_lruvec+0x7fb8>	93bb34: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7fb8   93bb38:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
7fbd   93bb3d:	e9 45 f7 ff ff       	jmp    93b287 <shrink_lruvec+0x7707>
7fc2   93bb42:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
7fca   93bb4a:	80 e1 07             	and    $0x7,%cl
7fcd   93bb4d:	80 c1 03             	add    $0x3,%cl
7fd0   93bb50:	38 c1                	cmp    %al,%cl
7fd2   93bb52:	0f 8c 4a f7 ff ff    	jl     93b2a2 <shrink_lruvec+0x7722>
7fd8   93bb58:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
7fe0   93bb60:	e8 00 00 00 00       	call   93bb65 <shrink_lruvec+0x7fe5>	93bb61: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
7fe5   93bb65:	e9 38 f7 ff ff       	jmp    93b2a2 <shrink_lruvec+0x7722>
7fea   93bb6a:	89 d1                	mov    %edx,%ecx
7fec   93bb6c:	80 e1 07             	and    $0x7,%cl
7fef   93bb6f:	80 c1 03             	add    $0x3,%cl
7ff2   93bb72:	38 c1                	cmp    %al,%cl
7ff4   93bb74:	0f 8c 4b f7 ff ff    	jl     93b2c5 <shrink_lruvec+0x7745>
7ffa   93bb7a:	48 8b bc 24 a8 01 00 00 	mov    0x1a8(%rsp),%rdi
8002   93bb82:	e8 00 00 00 00       	call   93bb87 <shrink_lruvec+0x8007>	93bb83: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8007   93bb87:	48 8b 94 24 a8 01 00 00 	mov    0x1a8(%rsp),%rdx
800f   93bb8f:	e9 31 f7 ff ff       	jmp    93b2c5 <shrink_lruvec+0x7745>
8014   93bb94:	48 8b 8c 24 40 01 00 00 	mov    0x140(%rsp),%rcx
801c   93bb9c:	80 e1 07             	and    $0x7,%cl
801f   93bb9f:	80 c1 03             	add    $0x3,%cl
8022   93bba2:	38 c1                	cmp    %al,%cl
8024   93bba4:	0f 8c 36 f7 ff ff    	jl     93b2e0 <shrink_lruvec+0x7760>
802a   93bbaa:	48 8b bc 24 40 01 00 00 	mov    0x140(%rsp),%rdi
8032   93bbb2:	e8 00 00 00 00       	call   93bbb7 <shrink_lruvec+0x8037>	93bbb3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8037   93bbb7:	e9 24 f7 ff ff       	jmp    93b2e0 <shrink_lruvec+0x7760>
803c   93bbbc:	89 d1                	mov    %edx,%ecx
803e   93bbbe:	80 e1 07             	and    $0x7,%cl
8041   93bbc1:	80 c1 03             	add    $0x3,%cl
8044   93bbc4:	38 c1                	cmp    %al,%cl
8046   93bbc6:	0f 8c 37 f7 ff ff    	jl     93b303 <shrink_lruvec+0x7783>
804c   93bbcc:	48 8b bc 24 90 00 00 00 	mov    0x90(%rsp),%rdi
8054   93bbd4:	e8 00 00 00 00       	call   93bbd9 <shrink_lruvec+0x8059>	93bbd5: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8059   93bbd9:	48 8b 94 24 90 00 00 00 	mov    0x90(%rsp),%rdx
8061   93bbe1:	e9 1d f7 ff ff       	jmp    93b303 <shrink_lruvec+0x7783>
8066   93bbe6:	89 d1                	mov    %edx,%ecx
8068   93bbe8:	80 e1 07             	and    $0x7,%cl
806b   93bbeb:	80 c1 03             	add    $0x3,%cl
806e   93bbee:	38 c1                	cmp    %al,%cl
8070   93bbf0:	0f 8c 2b f7 ff ff    	jl     93b321 <shrink_lruvec+0x77a1>
8076   93bbf6:	48 8b bc 24 a0 01 00 00 	mov    0x1a0(%rsp),%rdi
807e   93bbfe:	e8 00 00 00 00       	call   93bc03 <shrink_lruvec+0x8083>	93bbff: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8083   93bc03:	48 8b 94 24 a0 01 00 00 	mov    0x1a0(%rsp),%rdx
808b   93bc0b:	e9 11 f7 ff ff       	jmp    93b321 <shrink_lruvec+0x77a1>
8090   93bc10:	44 89 f9             	mov    %r15d,%ecx
8093   93bc13:	80 e1 07             	and    $0x7,%cl
8096   93bc16:	80 c1 03             	add    $0x3,%cl
8099   93bc19:	38 c1                	cmp    %al,%cl
809b   93bc1b:	0f 8c 7a f7 ff ff    	jl     93b39b <shrink_lruvec+0x781b>
80a1   93bc21:	4c 89 ff             	mov    %r15,%rdi
80a4   93bc24:	e8 00 00 00 00       	call   93bc29 <shrink_lruvec+0x80a9>	93bc25: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
80a9   93bc29:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
80b1   93bc31:	e9 65 f7 ff ff       	jmp    93b39b <shrink_lruvec+0x781b>
80b6   93bc36:	89 d1                	mov    %edx,%ecx
80b8   93bc38:	80 e1 07             	and    $0x7,%cl
80bb   93bc3b:	38 c1                	cmp    %al,%cl
80bd   93bc3d:	0f 8c 6f f7 ff ff    	jl     93b3b2 <shrink_lruvec+0x7832>
80c3   93bc43:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
80cb   93bc4b:	e8 00 00 00 00       	call   93bc50 <shrink_lruvec+0x80d0>	93bc4c: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
80d0   93bc50:	48 8b 94 24 f0 00 00 00 	mov    0xf0(%rsp),%rdx
80d8   93bc58:	e9 55 f7 ff ff       	jmp    93b3b2 <shrink_lruvec+0x7832>
80dd   93bc5d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93bc60: R_X86_64_32S	nr_cpu_ids
80e4   93bc64:	80 e1 07             	and    $0x7,%cl
80e7   93bc67:	80 c1 03             	add    $0x3,%cl
80ea   93bc6a:	38 c1                	cmp    %al,%cl
80ec   93bc6c:	0f 8c fa f9 ff ff    	jl     93b66c <shrink_lruvec+0x7aec>
80f2   93bc72:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93bc75: R_X86_64_32S	nr_cpu_ids
80f9   93bc79:	e8 00 00 00 00       	call   93bc7e <shrink_lruvec+0x80fe>	93bc7a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
80fe   93bc7e:	e9 e9 f9 ff ff       	jmp    93b66c <shrink_lruvec+0x7aec>
8103   93bc83:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93bc86: R_X86_64_32S	nr_cpu_ids
810a   93bc8a:	80 e1 07             	and    $0x7,%cl
810d   93bc8d:	80 c1 03             	add    $0x3,%cl
8110   93bc90:	38 c1                	cmp    %al,%cl
8112   93bc92:	0f 8c 5a f7 ff ff    	jl     93b3f2 <shrink_lruvec+0x7872>
8118   93bc98:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93bc9b: R_X86_64_32S	nr_cpu_ids
811f   93bc9f:	e8 00 00 00 00       	call   93bca4 <shrink_lruvec+0x8124>	93bca0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8124   93bca4:	e9 49 f7 ff ff       	jmp    93b3f2 <shrink_lruvec+0x7872>
8129   93bca9:	89 d9                	mov    %ebx,%ecx
812b   93bcab:	80 e1 07             	and    $0x7,%cl
812e   93bcae:	80 c1 01             	add    $0x1,%cl
8131   93bcb1:	38 c1                	cmp    %al,%cl
8133   93bcb3:	0f 8c 6a f2 ff ff    	jl     93af23 <shrink_lruvec+0x73a3>
8139   93bcb9:	48 89 df             	mov    %rbx,%rdi
813c   93bcbc:	e8 00 00 00 00       	call   93bcc1 <shrink_lruvec+0x8141>	93bcbd: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
8141   93bcc1:	e9 5d f2 ff ff       	jmp    93af23 <shrink_lruvec+0x73a3>
8146   93bcc6:	89 d1                	mov    %edx,%ecx
8148   93bcc8:	80 e1 07             	and    $0x7,%cl
814b   93bccb:	80 c1 03             	add    $0x3,%cl
814e   93bcce:	38 c1                	cmp    %al,%cl
8150   93bcd0:	0f 8c 8b f6 ff ff    	jl     93b361 <shrink_lruvec+0x77e1>
8156   93bcd6:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
815e   93bcde:	e8 00 00 00 00       	call   93bce3 <shrink_lruvec+0x8163>	93bcdf: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8163   93bce3:	48 8b 94 24 e0 00 00 00 	mov    0xe0(%rsp),%rdx
816b   93bceb:	e9 71 f6 ff ff       	jmp    93b361 <shrink_lruvec+0x77e1>
8170   93bcf0:	89 d1                	mov    %edx,%ecx
8172   93bcf2:	80 e1 07             	and    $0x7,%cl
8175   93bcf5:	80 c1 03             	add    $0x3,%cl
8178   93bcf8:	38 c1                	cmp    %al,%cl
817a   93bcfa:	0f 8c 25 f8 ff ff    	jl     93b525 <shrink_lruvec+0x79a5>
8180   93bd00:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
8185   93bd05:	e8 00 00 00 00       	call   93bd0a <shrink_lruvec+0x818a>	93bd06: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
818a   93bd0a:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
818f   93bd0f:	e9 11 f8 ff ff       	jmp    93b525 <shrink_lruvec+0x79a5>
8194   93bd14:	89 d1                	mov    %edx,%ecx
8196   93bd16:	80 e1 07             	and    $0x7,%cl
8199   93bd19:	80 c1 03             	add    $0x3,%cl
819c   93bd1c:	38 c1                	cmp    %al,%cl
819e   93bd1e:	0f 8c 9d fa ff ff    	jl     93b7c1 <shrink_lruvec+0x7c41>
81a4   93bd24:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
81a9   93bd29:	e8 00 00 00 00       	call   93bd2e <shrink_lruvec+0x81ae>	93bd2a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
81ae   93bd2e:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
81b3   93bd33:	e9 89 fa ff ff       	jmp    93b7c1 <shrink_lruvec+0x7c41>
81b8   93bd38:	89 d1                	mov    %edx,%ecx
81ba   93bd3a:	80 e1 07             	and    $0x7,%cl
81bd   93bd3d:	80 c1 03             	add    $0x3,%cl
81c0   93bd40:	38 c1                	cmp    %al,%cl
81c2   93bd42:	0f 8c 54 fb ff ff    	jl     93b89c <shrink_lruvec+0x7d1c>
81c8   93bd48:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
81cd   93bd4d:	e8 00 00 00 00       	call   93bd52 <shrink_lruvec+0x81d2>	93bd4e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
81d2   93bd52:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
81d7   93bd57:	e9 40 fb ff ff       	jmp    93b89c <shrink_lruvec+0x7d1c>
81dc   93bd5c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93bd5f: R_X86_64_32S	.rodata+0x1323c0
81e3   93bd63:	be 23 15 00 00       	mov    $0x1523,%esi
81e8   93bd68:	31 d2                	xor    %edx,%edx
81ea   93bd6a:	e8 00 00 00 00       	call   93bd6f <shrink_lruvec+0x81ef>	93bd6b: R_X86_64_PLT32	__might_resched-0x4
81ef   93bd6f:	e8 00 00 00 00       	call   93bd74 <shrink_lruvec+0x81f4>	93bd70: R_X86_64_PLT32	__cond_resched-0x4
81f4   93bd74:	4c 8b b4 24 d0 00 00 00 	mov    0xd0(%rsp),%r14
81fc   93bd7c:	4c 89 f7             	mov    %r14,%rdi
81ff   93bd7f:	48 8b 9c 24 b0 00 00 00 	mov    0xb0(%rsp),%rbx
8207   93bd87:	48 89 de             	mov    %rbx,%rsi
820a   93bd8a:	e8 00 00 00 00       	call   93bd8f <shrink_lruvec+0x820f>	93bd8b: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
820f   93bd8f:	49 39 de             	cmp    %rbx,%r14
8212   93bd92:	0f 82 22 ed ff ff    	jb     93aaba <shrink_lruvec+0x6f3a>
8218   93bd98:	80 bc 24 f0 01 00 00 00 	cmpb   $0x0,0x1f0(%rsp)
8220   93bda0:	0f 85 14 ed ff ff    	jne    93aaba <shrink_lruvec+0x6f3a>
8226   93bda6:	48 8b bc 24 20 01 00 00 	mov    0x120(%rsp),%rdi
822e   93bdae:	48 89 f8             	mov    %rdi,%rax
8231   93bdb1:	48 c1 e8 03          	shr    $0x3,%rax
8235   93bdb5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
823a   93bdba:	74 05                	je     93bdc1 <shrink_lruvec+0x8241>
823c   93bdbc:	e8 00 00 00 00       	call   93bdc1 <shrink_lruvec+0x8241>	93bdbd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8241   93bdc1:	4c 8b b4 24 90 04 00 00 	mov    0x490(%rsp),%r14
8249   93bdc9:	48 8b bc 24 28 01 00 00 	mov    0x128(%rsp),%rdi
8251   93bdd1:	48 89 f8             	mov    %rdi,%rax
8254   93bdd4:	48 c1 e8 03          	shr    $0x3,%rax
8258   93bdd8:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
825d   93bddd:	4c 8b bc 24 60 01 00 00 	mov    0x160(%rsp),%r15
8265   93bde5:	74 05                	je     93bdec <shrink_lruvec+0x826c>
8267   93bde7:	e8 00 00 00 00       	call   93bdec <shrink_lruvec+0x826c>	93bde8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
826c   93bdec:	4c 03 b4 24 98 04 00 00 	add    0x498(%rsp),%r14
8274   93bdf4:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
827c   93bdfc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8281   93be01:	74 0d                	je     93be10 <shrink_lruvec+0x8290>
8283   93be03:	48 8d bc 24 80 04 00 00 	lea    0x480(%rsp),%rdi
828b   93be0b:	e8 00 00 00 00       	call   93be10 <shrink_lruvec+0x8290>	93be0c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8290   93be10:	48 8b 9c 24 80 04 00 00 	mov    0x480(%rsp),%rbx
8298   93be18:	4c 89 f8             	mov    %r15,%rax
829b   93be1b:	48 c1 e8 03          	shr    $0x3,%rax
829f   93be1f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
82a4   93be24:	74 08                	je     93be2e <shrink_lruvec+0x82ae>
82a6   93be26:	4c 89 ff             	mov    %r15,%rdi
82a9   93be29:	e8 00 00 00 00       	call   93be2e <shrink_lruvec+0x82ae>	93be2a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
82ae   93be2e:	48 03 9c 24 88 04 00 00 	add    0x488(%rsp),%rbx
82b6   93be36:	31 ff                	xor    %edi,%edi
82b8   93be38:	4c 89 f6             	mov    %r14,%rsi
82bb   93be3b:	e8 00 00 00 00       	call   93be40 <shrink_lruvec+0x82c0>	93be3c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
82c0   93be40:	31 ff                	xor    %edi,%edi
82c2   93be42:	48 89 de             	mov    %rbx,%rsi
82c5   93be45:	e8 00 00 00 00       	call   93be4a <shrink_lruvec+0x82ca>	93be46: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
82ca   93be4a:	4d 85 f6             	test   %r14,%r14
82cd   93be4d:	0f 84 58 04 00 00    	je     93c2ab <shrink_lruvec+0x872b>
82d3   93be53:	48 85 db             	test   %rbx,%rbx
82d6   93be56:	0f 84 4f 04 00 00    	je     93c2ab <shrink_lruvec+0x872b>
82dc   93be5c:	4c 89 f7             	mov    %r14,%rdi
82df   93be5f:	48 89 de             	mov    %rbx,%rsi
82e2   93be62:	e8 00 00 00 00       	call   93be67 <shrink_lruvec+0x82e7>	93be63: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
82e7   93be67:	49 39 de             	cmp    %rbx,%r14
82ea   93be6a:	76 4b                	jbe    93beb7 <shrink_lruvec+0x8337>
82ec   93be6c:	e8 00 00 00 00       	call   93be71 <shrink_lruvec+0x82f1>	93be6d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
82f1   93be71:	48 8d b4 24 d0 04 00 00 	lea    0x4d0(%rsp),%rsi
82f9   93be79:	48 89 f0             	mov    %rsi,%rax
82fc   93be7c:	48 c1 e8 03          	shr    $0x3,%rax
8300   93be80:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8305   93be85:	74 15                	je     93be9c <shrink_lruvec+0x831c>
8307   93be87:	48 8d bc 24 d0 04 00 00 	lea    0x4d0(%rsp),%rdi
830f   93be8f:	e8 00 00 00 00       	call   93be94 <shrink_lruvec+0x8314>	93be90: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8314   93be94:	48 8d b4 24 d0 04 00 00 	lea    0x4d0(%rsp),%rsi
831c   93be9c:	45 31 e4             	xor    %r12d,%r12d
831f   93be9f:	41 bd 02 00 00 00    	mov    $0x2,%r13d
8325   93bea5:	4c 8b b4 24 d0 04 00 00 	mov    0x4d0(%rsp),%r14
832d   93bead:	4c 8b bc 24 90 01 00 00 	mov    0x190(%rsp),%r15
8335   93beb5:	eb 47                	jmp    93befe <shrink_lruvec+0x837e>
8337   93beb7:	e8 00 00 00 00       	call   93bebc <shrink_lruvec+0x833c>	93beb8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
833c   93bebc:	48 8b bc 24 98 01 00 00 	mov    0x198(%rsp),%rdi
8344   93bec4:	48 89 f8             	mov    %rdi,%rax
8347   93bec7:	48 c1 e8 03          	shr    $0x3,%rax
834b   93becb:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8350   93bed0:	74 05                	je     93bed7 <shrink_lruvec+0x8357>
8352   93bed2:	e8 00 00 00 00       	call   93bed7 <shrink_lruvec+0x8357>	93bed3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8357   93bed7:	41 bc 02 00 00 00    	mov    $0x2,%r12d
835d   93bedd:	45 31 ed             	xor    %r13d,%r13d
8360   93bee0:	48 8b 84 24 e0 04 00 00 	mov    0x4e0(%rsp),%rax
8368   93bee8:	4c 8b bc 24 d8 01 00 00 	mov    0x1d8(%rsp),%r15
8370   93bef0:	4c 89 f3             	mov    %r14,%rbx
8373   93bef3:	49 89 c6             	mov    %rax,%r14
8376   93bef6:	48 8d b4 24 d0 04 00 00 	lea    0x4d0(%rsp),%rsi
837e   93befe:	4c 89 f8             	mov    %r15,%rax
8381   93bf01:	48 c1 e8 03          	shr    $0x3,%rax
8385   93bf05:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
838f   93bf0f:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
8393   93bf13:	74 10                	je     93bf25 <shrink_lruvec+0x83a5>
8395   93bf15:	4c 89 ff             	mov    %r15,%rdi
8398   93bf18:	e8 00 00 00 00       	call   93bf1d <shrink_lruvec+0x839d>	93bf19: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
839d   93bf1d:	48 8d b4 24 d0 04 00 00 	lea    0x4d0(%rsp),%rsi
83a5   93bf25:	49 8b 07             	mov    (%r15),%rax
83a8   93bf28:	49 8d 0c 06          	lea    (%r14,%rax,1),%rcx
83ac   93bf2c:	48 83 c1 01          	add    $0x1,%rcx
83b0   93bf30:	48 6b c3 64          	imul   $0x64,%rbx,%rax
83b4   93bf34:	48 89 c2             	mov    %rax,%rdx
83b7   93bf37:	48 09 ca             	or     %rcx,%rdx
83ba   93bf3a:	48 c1 ea 20          	shr    $0x20,%rdx
83be   93bf3e:	74 07                	je     93bf47 <shrink_lruvec+0x83c7>
83c0   93bf40:	31 d2                	xor    %edx,%edx
83c2   93bf42:	48 f7 f1             	div    %rcx
83c5   93bf45:	eb 04                	jmp    93bf4b <shrink_lruvec+0x83cb>
83c7   93bf47:	31 d2                	xor    %edx,%edx
83c9   93bf49:	f7 f1                	div    %ecx
83cb   93bf4b:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
83d0   93bf50:	44 89 e0             	mov    %r12d,%eax
83d3   93bf53:	48 8d 8c 24 80 04 00 00 	lea    0x480(%rsp),%rcx
83db   93bf5b:	48 8d 1c c1          	lea    (%rcx,%rax,8),%rbx
83df   93bf5f:	48 89 d8             	mov    %rbx,%rax
83e2   93bf62:	48 c1 e8 03          	shr    $0x3,%rax
83e6   93bf66:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
83f0   93bf70:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
83f4   93bf74:	74 10                	je     93bf86 <shrink_lruvec+0x8406>
83f6   93bf76:	48 89 df             	mov    %rbx,%rdi
83f9   93bf79:	e8 00 00 00 00       	call   93bf7e <shrink_lruvec+0x83fe>	93bf7a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
83fe   93bf7e:	48 8d b4 24 d0 04 00 00 	lea    0x4d0(%rsp),%rsi
8406   93bf86:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
840d   93bf8d:	41 83 cc 01          	or     $0x1,%r12d
8411   93bf91:	48 8d 84 24 80 04 00 00 	lea    0x480(%rsp),%rax
8419   93bf99:	4a 8d 1c e0          	lea    (%rax,%r12,8),%rbx
841d   93bf9d:	48 89 d8             	mov    %rbx,%rax
8420   93bfa0:	48 c1 e8 03          	shr    $0x3,%rax
8424   93bfa4:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
842e   93bfae:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
8432   93bfb2:	74 10                	je     93bfc4 <shrink_lruvec+0x8444>
8434   93bfb4:	48 89 df             	mov    %rbx,%rdi
8437   93bfb7:	e8 00 00 00 00       	call   93bfbc <shrink_lruvec+0x843c>	93bfb8: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
843c   93bfbc:	48 8d b4 24 d0 04 00 00 	lea    0x4d0(%rsp),%rsi
8444   93bfc4:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
844b   93bfcb:	45 89 ee             	mov    %r13d,%r14d
844e   93bfce:	4a 8d 3c f6          	lea    (%rsi,%r14,8),%rdi
8452   93bfd2:	48 89 f8             	mov    %rdi,%rax
8455   93bfd5:	48 c1 e8 03          	shr    $0x3,%rax
8459   93bfd9:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
8463   93bfe3:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
8467   93bfe7:	74 05                	je     93bfee <shrink_lruvec+0x846e>
8469   93bfe9:	e8 00 00 00 00       	call   93bfee <shrink_lruvec+0x846e>	93bfea: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
846e   93bfee:	4a 8b 9c f4 d0 04 00 00 	mov    0x4d0(%rsp,%r14,8),%rbx
8476   93bff6:	48 8d 84 24 80 04 00 00 	lea    0x480(%rsp),%rax
847e   93bffe:	4e 8d 34 f0          	lea    (%rax,%r14,8),%r14
8482   93c002:	4d 89 f7             	mov    %r14,%r15
8485   93c005:	49 c1 ef 03          	shr    $0x3,%r15
8489   93c009:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8493   93c013:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
8498   93c018:	74 08                	je     93c022 <shrink_lruvec+0x84a2>
849a   93c01a:	4c 89 f7             	mov    %r14,%rdi
849d   93c01d:	e8 00 00 00 00       	call   93c022 <shrink_lruvec+0x84a2>	93c01e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
84a2   93c022:	48 89 d9             	mov    %rbx,%rcx
84a5   93c025:	49 2b 0e             	sub    (%r14),%rcx
84a8   93c028:	41 bc 64 00 00 00    	mov    $0x64,%r12d
84ae   93c02e:	4c 2b 64 24 10       	sub    0x10(%rsp),%r12
84b3   93c033:	49 0f af dc          	imul   %r12,%rbx
84b7   93c037:	48 c1 eb 02          	shr    $0x2,%rbx
84bb   93c03b:	48 89 d8             	mov    %rbx,%rax
84be   93c03e:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
84c8   93c048:	48 f7 e2             	mul    %rdx
84cb   93c04b:	48 c1 ea 02          	shr    $0x2,%rdx
84cf   93c04f:	48 29 ca             	sub    %rcx,%rdx
84d2   93c052:	bb 00 00 00 00       	mov    $0x0,%ebx
84d7   93c057:	48 0f 43 da          	cmovae %rdx,%rbx
84db   93c05b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
84e5   93c065:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
84ea   93c06a:	74 08                	je     93c074 <shrink_lruvec+0x84f4>
84ec   93c06c:	4c 89 f7             	mov    %r14,%rdi
84ef   93c06f:	e8 00 00 00 00       	call   93c074 <shrink_lruvec+0x84f4>	93c070: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
84f4   93c074:	49 89 1e             	mov    %rbx,(%r14)
84f7   93c077:	41 83 cd 01          	or     $0x1,%r13d
84fb   93c07b:	48 8d 84 24 d0 04 00 00 	lea    0x4d0(%rsp),%rax
8503   93c083:	4a 8d 3c e8          	lea    (%rax,%r13,8),%rdi
8507   93c087:	48 89 f8             	mov    %rdi,%rax
850a   93c08a:	48 c1 e8 03          	shr    $0x3,%rax
850e   93c08e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
8518   93c098:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
851c   93c09c:	74 05                	je     93c0a3 <shrink_lruvec+0x8523>
851e   93c09e:	e8 00 00 00 00       	call   93c0a3 <shrink_lruvec+0x8523>	93c09f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8523   93c0a3:	4e 8b bc ec d0 04 00 00 	mov    0x4d0(%rsp,%r13,8),%r15
852b   93c0ab:	48 8d 84 24 80 04 00 00 	lea    0x480(%rsp),%rax
8533   93c0b3:	4e 8d 34 e8          	lea    (%rax,%r13,8),%r14
8537   93c0b7:	4d 89 f5             	mov    %r14,%r13
853a   93c0ba:	49 c1 ed 03          	shr    $0x3,%r13
853e   93c0be:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8548   93c0c8:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
854e   93c0ce:	74 08                	je     93c0d8 <shrink_lruvec+0x8558>
8550   93c0d0:	4c 89 f7             	mov    %r14,%rdi
8553   93c0d3:	e8 00 00 00 00       	call   93c0d8 <shrink_lruvec+0x8558>	93c0d4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8558   93c0d8:	4c 89 f9             	mov    %r15,%rcx
855b   93c0db:	49 2b 0e             	sub    (%r14),%rcx
855e   93c0de:	4d 0f af e7          	imul   %r15,%r12
8562   93c0e2:	49 c1 ec 02          	shr    $0x2,%r12
8566   93c0e6:	4c 89 e0             	mov    %r12,%rax
8569   93c0e9:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
8573   93c0f3:	48 f7 e2             	mul    %rdx
8576   93c0f6:	48 c1 ea 02          	shr    $0x2,%rdx
857a   93c0fa:	48 29 ca             	sub    %rcx,%rdx
857d   93c0fd:	bb 00 00 00 00       	mov    $0x0,%ebx
8582   93c102:	48 0f 43 da          	cmovae %rdx,%rbx
8586   93c106:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
8590   93c110:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
8596   93c116:	49 89 c5             	mov    %rax,%r13
8599   93c119:	0f 84 78 e9 ff ff    	je     93aa97 <shrink_lruvec+0x6f17>
859f   93c11f:	4c 89 f7             	mov    %r14,%rdi
85a2   93c122:	e8 00 00 00 00       	call   93c127 <shrink_lruvec+0x85a7>	93c123: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
85a7   93c127:	e9 6b e9 ff ff       	jmp    93aa97 <shrink_lruvec+0x6f17>
85ac   93c12c:	e8 00 00 00 00       	call   93c131 <shrink_lruvec+0x85b1>	93c12d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
85b1   93c131:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
85b6   93c136:	48 8d 58 48          	lea    0x48(%rax),%rbx
85ba   93c13a:	48 89 d8             	mov    %rbx,%rax
85bd   93c13d:	48 c1 e8 03          	shr    $0x3,%rax
85c1   93c141:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
85c6   93c146:	74 08                	je     93c150 <shrink_lruvec+0x85d0>
85c8   93c148:	48 89 df             	mov    %rbx,%rdi
85cb   93c14b:	e8 00 00 00 00       	call   93c150 <shrink_lruvec+0x85d0>	93c14c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
85d0   93c150:	48 8b 84 24 d0 00 00 00 	mov    0xd0(%rsp),%rax
85d8   93c158:	48 01 03             	add    %rax,(%rbx)
85db   93c15b:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
85e3   93c163:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
85e8   93c168:	4c 8b 74 24 68       	mov    0x68(%rsp),%r14
85ed   93c16d:	74 08                	je     93c177 <shrink_lruvec+0x85f7>
85ef   93c16f:	4c 89 f7             	mov    %r14,%rdi
85f2   93c172:	e8 00 00 00 00       	call   93c177 <shrink_lruvec+0x85f7>	93c173: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
85f7   93c177:	bb 88 2d 00 00       	mov    $0x2d88,%ebx
85fc   93c17c:	49 03 1e             	add    (%r14),%rbx
85ff   93c17f:	48 89 d8             	mov    %rbx,%rax
8602   93c182:	48 c1 e8 03          	shr    $0x3,%rax
8606   93c186:	42 8a 04 28          	mov    (%rax,%r13,1),%al
860a   93c18a:	84 c0                	test   %al,%al
860c   93c18c:	0f 85 4d 06 00 00    	jne    93c7df <shrink_lruvec+0x8c5f>
8612   93c192:	44 8b 33             	mov    (%rbx),%r14d
8615   93c195:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93c198: R_X86_64_32S	numa_demotion_enabled
861c   93c19c:	48 c1 e8 03          	shr    $0x3,%rax
8620   93c1a0:	42 8a 04 28          	mov    (%rax,%r13,1),%al
8624   93c1a4:	84 c0                	test   %al,%al
8626   93c1a6:	0f 85 50 06 00 00    	jne    93c7fc <shrink_lruvec+0x8c7c>
862c   93c1ac:	0f b6 1d 00 00 00 00 	movzbl 0x0(%rip),%ebx        # 93c1b3 <shrink_lruvec+0x8633>	93c1af: R_X86_64_PC32	numa_demotion_enabled-0x4
8633   93c1b3:	31 ff                	xor    %edi,%edi
8635   93c1b5:	89 de                	mov    %ebx,%esi
8637   93c1b7:	e8 00 00 00 00       	call   93c1bc <shrink_lruvec+0x863c>	93c1b8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
863c   93c1bc:	85 db                	test   %ebx,%ebx
863e   93c1be:	74 46                	je     93c206 <shrink_lruvec+0x8686>
8640   93c1c0:	48 83 7c 24 58 00    	cmpq   $0x0,0x58(%rsp)
8646   93c1c6:	74 48                	je     93c210 <shrink_lruvec+0x8690>
8648   93c1c8:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
8650   93c1d0:	42 8a 04 28          	mov    (%rax,%r13,1),%al
8654   93c1d4:	84 c0                	test   %al,%al
8656   93c1d6:	0f 85 ac 06 00 00    	jne    93c888 <shrink_lruvec+0x8d08>
865c   93c1dc:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
8661   93c1e1:	0f b7 18             	movzwl (%rax),%ebx
8664   93c1e4:	89 de                	mov    %ebx,%esi
8666   93c1e6:	81 e6 00 40 00 00    	and    $0x4000,%esi
866c   93c1ec:	31 ff                	xor    %edi,%edi
866e   93c1ee:	e8 00 00 00 00       	call   93c1f3 <shrink_lruvec+0x8673>	93c1ef: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
8673   93c1f3:	81 e3 00 40 00 00    	and    $0x4000,%ebx
8679   93c1f9:	0f 85 a2 00 00 00    	jne    93c2a1 <shrink_lruvec+0x8721>
867f   93c1ff:	e8 00 00 00 00       	call   93c204 <shrink_lruvec+0x8684>	93c200: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8684   93c204:	eb 0f                	jmp    93c215 <shrink_lruvec+0x8695>
8686   93c206:	e8 00 00 00 00       	call   93c20b <shrink_lruvec+0x868b>	93c207: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
868b   93c20b:	e9 f6 01 00 00       	jmp    93c406 <shrink_lruvec+0x8886>
8690   93c210:	e8 00 00 00 00       	call   93c215 <shrink_lruvec+0x8695>	93c211: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8695   93c215:	44 89 f7             	mov    %r14d,%edi
8698   93c218:	e8 00 00 00 00       	call   93c21d <shrink_lruvec+0x869d>	93c219: R_X86_64_PLT32	next_demotion_node-0x4
869d   93c21d:	89 c3                	mov    %eax,%ebx
869f   93c21f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
86a4   93c224:	89 c6                	mov    %eax,%esi
86a6   93c226:	e8 00 00 00 00       	call   93c22b <shrink_lruvec+0x86ab>	93c227: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
86ab   93c22b:	83 fb ff             	cmp    $0xffffffff,%ebx
86ae   93c22e:	0f 84 81 00 00 00    	je     93c2b5 <shrink_lruvec+0x8735>
86b4   93c234:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93c237: R_X86_64_32S	memory_cgrp_subsys_enabled_key
86bb   93c23b:	48 c1 e8 03          	shr    $0x3,%rax
86bf   93c23f:	42 8a 04 28          	mov    (%rax,%r13,1),%al
86c3   93c243:	84 c0                	test   %al,%al
86c5   93c245:	0f 85 7c 06 00 00    	jne    93c8c7 <shrink_lruvec+0x8d47>
86cb   93c24b:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93c251 <shrink_lruvec+0x86d1>	93c24d: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
86d1   93c251:	bf 01 00 00 00       	mov    $0x1,%edi
86d6   93c256:	89 de                	mov    %ebx,%esi
86d8   93c258:	e8 00 00 00 00       	call   93c25d <shrink_lruvec+0x86dd>	93c259: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
86dd   93c25d:	85 db                	test   %ebx,%ebx
86df   93c25f:	7e 5e                	jle    93c2bf <shrink_lruvec+0x873f>
86e1   93c261:	e8 00 00 00 00       	call   93c266 <shrink_lruvec+0x86e6>	93c262: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
86e6   93c266:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
86eb   93c26b:	48 8d 98 c0 07 00 00 	lea    0x7c0(%rax),%rbx
86f2   93c272:	48 89 d8             	mov    %rbx,%rax
86f5   93c275:	48 c1 e8 03          	shr    $0x3,%rax
86f9   93c279:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
86fe   93c27e:	74 08                	je     93c288 <shrink_lruvec+0x8708>
8700   93c280:	48 89 df             	mov    %rbx,%rdi
8703   93c283:	e8 00 00 00 00       	call   93c288 <shrink_lruvec+0x8708>	93c284: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8708   93c288:	48 8b 1b             	mov    (%rbx),%rbx
870b   93c28b:	45 31 f6             	xor    %r14d,%r14d
870e   93c28e:	31 ff                	xor    %edi,%edi
8710   93c290:	48 89 de             	mov    %rbx,%rsi
8713   93c293:	e8 00 00 00 00       	call   93c298 <shrink_lruvec+0x8718>	93c294: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
8718   93c298:	48 85 db             	test   %rbx,%rbx
871b   93c29b:	4c 0f 49 f3          	cmovns %rbx,%r14
871f   93c29f:	eb 4c                	jmp    93c2ed <shrink_lruvec+0x876d>
8721   93c2a1:	e8 00 00 00 00       	call   93c2a6 <shrink_lruvec+0x8726>	93c2a2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8726   93c2a6:	e9 5b 01 00 00       	jmp    93c406 <shrink_lruvec+0x8886>
872b   93c2ab:	e8 00 00 00 00       	call   93c2b0 <shrink_lruvec+0x8730>	93c2ac: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8730   93c2b0:	e9 7c fe ff ff       	jmp    93c131 <shrink_lruvec+0x85b1>
8735   93c2b5:	e8 00 00 00 00       	call   93c2ba <shrink_lruvec+0x873a>	93c2b6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
873a   93c2ba:	e9 47 01 00 00       	jmp    93c406 <shrink_lruvec+0x8886>
873f   93c2bf:	e8 00 00 00 00       	call   93c2c4 <shrink_lruvec+0x8744>	93c2c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8744   93c2c4:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
874c   93c2cc:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8751   93c2d1:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
8756   93c2d6:	74 08                	je     93c2e0 <shrink_lruvec+0x8760>
8758   93c2d8:	48 89 df             	mov    %rbx,%rdi
875b   93c2db:	e8 00 00 00 00       	call   93c2e0 <shrink_lruvec+0x8760>	93c2dc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8760   93c2e0:	48 8b 3b             	mov    (%rbx),%rdi
8763   93c2e3:	31 f6                	xor    %esi,%esi
8765   93c2e5:	e8 00 00 00 00       	call   93c2ea <shrink_lruvec+0x876a>	93c2e6: R_X86_64_PLT32	node_page_state-0x4
876a   93c2ea:	49 89 c6             	mov    %rax,%r14
876d   93c2ed:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93c2f0: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8774   93c2f4:	48 c1 e8 03          	shr    $0x3,%rax
8778   93c2f8:	42 8a 04 28          	mov    (%rax,%r13,1),%al
877c   93c2fc:	84 c0                	test   %al,%al
877e   93c2fe:	0f 85 e9 05 00 00    	jne    93c8ed <shrink_lruvec+0x8d6d>
8784   93c304:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93c30a <shrink_lruvec+0x878a>	93c306: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
878a   93c30a:	bf 01 00 00 00       	mov    $0x1,%edi
878f   93c30f:	89 de                	mov    %ebx,%esi
8791   93c311:	e8 00 00 00 00       	call   93c316 <shrink_lruvec+0x8796>	93c312: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
8796   93c316:	85 db                	test   %ebx,%ebx
8798   93c318:	7e 40                	jle    93c35a <shrink_lruvec+0x87da>
879a   93c31a:	e8 00 00 00 00       	call   93c31f <shrink_lruvec+0x879f>	93c31b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
879f   93c31f:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
87a4   93c324:	48 8d 98 c8 07 00 00 	lea    0x7c8(%rax),%rbx
87ab   93c32b:	48 89 d8             	mov    %rbx,%rax
87ae   93c32e:	48 c1 e8 03          	shr    $0x3,%rax
87b2   93c332:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
87b7   93c337:	74 08                	je     93c341 <shrink_lruvec+0x87c1>
87b9   93c339:	48 89 df             	mov    %rbx,%rdi
87bc   93c33c:	e8 00 00 00 00       	call   93c341 <shrink_lruvec+0x87c1>	93c33d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
87c1   93c341:	48 8b 1b             	mov    (%rbx),%rbx
87c4   93c344:	45 31 ff             	xor    %r15d,%r15d
87c7   93c347:	31 ff                	xor    %edi,%edi
87c9   93c349:	48 89 de             	mov    %rbx,%rsi
87cc   93c34c:	e8 00 00 00 00       	call   93c351 <shrink_lruvec+0x87d1>	93c34d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
87d1   93c351:	48 85 db             	test   %rbx,%rbx
87d4   93c354:	4c 0f 49 fb          	cmovns %rbx,%r15
87d8   93c358:	eb 31                	jmp    93c38b <shrink_lruvec+0x880b>
87da   93c35a:	e8 00 00 00 00       	call   93c35f <shrink_lruvec+0x87df>	93c35b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
87df   93c35f:	48 8b 84 24 08 01 00 00 	mov    0x108(%rsp),%rax
87e7   93c367:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
87ec   93c36c:	48 8b 5c 24 68       	mov    0x68(%rsp),%rbx
87f1   93c371:	74 08                	je     93c37b <shrink_lruvec+0x87fb>
87f3   93c373:	48 89 df             	mov    %rbx,%rdi
87f6   93c376:	e8 00 00 00 00       	call   93c37b <shrink_lruvec+0x87fb>	93c377: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
87fb   93c37b:	48 8b 3b             	mov    (%rbx),%rdi
87fe   93c37e:	be 01 00 00 00       	mov    $0x1,%esi
8803   93c383:	e8 00 00 00 00       	call   93c388 <shrink_lruvec+0x8808>	93c384: R_X86_64_PLT32	node_page_state-0x4
8808   93c388:	49 89 c7             	mov    %rax,%r15
880b   93c38b:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
8810   93c390:	4b 8d 1c 37          	lea    (%r15,%r14,1),%rbx
8814   93c394:	bf 00 00 04 00       	mov    $0x40000,%edi
8819   93c399:	48 89 de             	mov    %rbx,%rsi
881c   93c39c:	e8 00 00 00 00       	call   93c3a1 <shrink_lruvec+0x8821>	93c39d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
8821   93c3a1:	48 81 fb ff ff 03 00 	cmp    $0x3ffff,%rbx
8828   93c3a8:	77 0c                	ja     93c3b6 <shrink_lruvec+0x8836>
882a   93c3aa:	e8 00 00 00 00       	call   93c3af <shrink_lruvec+0x882f>	93c3ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
882f   93c3af:	bb 01 00 00 00       	mov    $0x1,%ebx
8834   93c3b4:	eb 19                	jmp    93c3cf <shrink_lruvec+0x884f>
8836   93c3b6:	e8 00 00 00 00       	call   93c3bb <shrink_lruvec+0x883b>	93c3b7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
883b   93c3bb:	48 c1 eb 11          	shr    $0x11,%rbx
883f   93c3bf:	48 83 e3 fe          	and    $0xfffffffffffffffe,%rbx
8843   93c3c3:	48 8d 3c 9b          	lea    (%rbx,%rbx,4),%rdi
8847   93c3c7:	e8 00 00 00 00       	call   93c3cc <shrink_lruvec+0x884c>	93c3c8: R_X86_64_PLT32	int_sqrt-0x4
884c   93c3cc:	48 89 c3             	mov    %rax,%rbx
884f   93c3cf:	49 0f af de          	imul   %r14,%rbx
8853   93c3d3:	48 89 df             	mov    %rbx,%rdi
8856   93c3d6:	4c 89 fe             	mov    %r15,%rsi
8859   93c3d9:	e8 00 00 00 00       	call   93c3de <shrink_lruvec+0x885e>	93c3da: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
885e   93c3de:	4c 39 fb             	cmp    %r15,%rbx
8861   93c3e1:	73 1e                	jae    93c401 <shrink_lruvec+0x8881>
8863   93c3e3:	e8 00 00 00 00       	call   93c3e8 <shrink_lruvec+0x8868>	93c3e4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8868   93c3e8:	bf 20 00 00 00       	mov    $0x20,%edi
886d   93c3ed:	4c 89 e6             	mov    %r12,%rsi
8870   93c3f0:	48 8b 54 24 58       	mov    0x58(%rsp),%rdx
8875   93c3f5:	b9 01 00 00 00       	mov    $0x1,%ecx
887a   93c3fa:	e8 01 dd 00 00       	call   94a100 <shrink_active_list>
887f   93c3ff:	eb 05                	jmp    93c406 <shrink_lruvec+0x8886>
8881   93c401:	e8 00 00 00 00       	call   93c406 <shrink_lruvec+0x8886>	93c402: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8886   93c406:	48 8b 84 24 58 01 00 00 	mov    0x158(%rsp),%rax
888e   93c40e:	48 c7 84 24 a0 02 00 00 0e 36 e0 45 	movq   $0x45e0360e,0x2a0(%rsp)
889a   93c41a:	48 c7 00 00 00 00 00 	movq   $0x0,(%rax)
88a1   93c421:	c7 40 09 00 00 00 00 	movl   $0x0,0x9(%rax)
88a8   93c428:	48 c7 40 11 00 00 00 00 	movq   $0x0,0x11(%rax)
88b0   93c430:	48 c7 40 19 00 00 00 00 	movq   $0x0,0x19(%rax)
88b8   93c438:	48 c7 40 21 00 00 00 00 	movq   $0x0,0x21(%rax)
88c0   93c440:	48 c7 40 29 00 00 00 00 	movq   $0x0,0x29(%rax)
88c8   93c448:	48 c7 40 31 00 00 00 00 	movq   $0x0,0x31(%rax)
88d0   93c450:	48 c7 40 3a 00 00 00 00 	movq   $0x0,0x3a(%rax)
88d8   93c458:	c7 40 42 00 00 00 00 	movl   $0x0,0x42(%rax)
88df   93c45f:	c7 40 4b 00 00 00 00 	movl   $0x0,0x4b(%rax)
88e6   93c466:	c6 40 4f 00          	movb   $0x0,0x4f(%rax)
88ea   93c46a:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
88f3   93c473:	48 3b 84 24 20 05 00 00 	cmp    0x520(%rsp),%rax
88fb   93c47b:	0f 85 19 05 00 00    	jne    93c99a <shrink_lruvec+0x8e1a>
8901   93c481:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
8905   93c485:	5b                   	pop    %rbx
8906   93c486:	41 5c                	pop    %r12
8908   93c488:	41 5d                	pop    %r13
890a   93c48a:	41 5e                	pop    %r14
890c   93c48c:	41 5f                	pop    %r15
890e   93c48e:	5d                   	pop    %rbp
890f   93c48f:	c3                   	ret
8910   93c490:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
8915   93c495:	48 8d 58 39          	lea    0x39(%rax),%rbx
8919   93c499:	48 89 d8             	mov    %rbx,%rax
891c   93c49c:	48 c1 e8 03          	shr    $0x3,%rax
8920   93c4a0:	42 8a 04 28          	mov    (%rax,%r13,1),%al
8924   93c4a4:	84 c0                	test   %al,%al
8926   93c4a6:	0f 85 8c 04 00 00    	jne    93c938 <shrink_lruvec+0x8db8>
892c   93c4ac:	0f b6 1b             	movzbl (%rbx),%ebx
892f   93c4af:	31 ff                	xor    %edi,%edi
8931   93c4b1:	89 de                	mov    %ebx,%esi
8933   93c4b3:	e8 00 00 00 00       	call   93c4b8 <shrink_lruvec+0x8938>	93c4b4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
8938   93c4b8:	85 db                	test   %ebx,%ebx
893a   93c4ba:	75 46                	jne    93c502 <shrink_lruvec+0x8982>
893c   93c4bc:	45 85 f6             	test   %r14d,%r14d
893f   93c4bf:	74 41                	je     93c502 <shrink_lruvec+0x8982>
8941   93c4c1:	e8 00 00 00 00       	call   93c4c6 <shrink_lruvec+0x8946>	93c4c2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8946   93c4c6:	45 31 ff             	xor    %r15d,%r15d
8949   93c4c9:	31 c0                	xor    %eax,%eax
894b   93c4cb:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
8953   93c4d3:	31 c0                	xor    %eax,%eax
8955   93c4d5:	e9 1a da ff ff       	jmp    939ef4 <shrink_lruvec+0x6374>
895a   93c4da:	e8 00 00 00 00       	call   93c4df <shrink_lruvec+0x895f>	93c4db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
895f   93c4df:	e9 2e d9 ff ff       	jmp    939e12 <shrink_lruvec+0x6292>
8964   93c4e4:	e8 00 00 00 00       	call   93c4e9 <shrink_lruvec+0x8969>	93c4e5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8969   93c4e9:	e9 d7 d7 ff ff       	jmp    939cc5 <shrink_lruvec+0x6145>
896e   93c4ee:	e8 00 00 00 00       	call   93c4f3 <shrink_lruvec+0x8973>	93c4ef: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8973   93c4f3:	e9 1a d9 ff ff       	jmp    939e12 <shrink_lruvec+0x6292>
8978   93c4f8:	e8 00 00 00 00       	call   93c4fd <shrink_lruvec+0x897d>	93c4f9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
897d   93c4fd:	e9 c3 d7 ff ff       	jmp    939cc5 <shrink_lruvec+0x6145>
8982   93c502:	48 8b 84 24 f8 00 00 00 	mov    0xf8(%rsp),%rax
898a   93c50a:	42 8a 04 28          	mov    (%rax,%r13,1),%al
898e   93c50e:	84 c0                	test   %al,%al
8990   93c510:	0f 85 3c 04 00 00    	jne    93c952 <shrink_lruvec+0x8dd2>
8996   93c516:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
899b   93c51b:	0f b7 18             	movzwl (%rax),%ebx
899e   93c51e:	89 de                	mov    %ebx,%esi
89a0   93c520:	81 e6 00 20 00 00    	and    $0x2000,%esi
89a6   93c526:	31 c0                	xor    %eax,%eax
89a8   93c528:	48 89 84 24 a0 00 00 00 	mov    %rax,0xa0(%rsp)
89b0   93c530:	31 ff                	xor    %edi,%edi
89b2   93c532:	e8 00 00 00 00       	call   93c537 <shrink_lruvec+0x89b7>	93c533: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
89b7   93c537:	89 d8                	mov    %ebx,%eax
89b9   93c539:	25 00 20 00 00       	and    $0x2000,%eax
89be   93c53e:	0f 85 96 00 00 00    	jne    93c5da <shrink_lruvec+0x8a5a>
89c4   93c544:	81 e3 00 10 00 00    	and    $0x1000,%ebx
89ca   93c54a:	31 ff                	xor    %edi,%edi
89cc   93c54c:	89 de                	mov    %ebx,%esi
89ce   93c54e:	e8 00 00 00 00       	call   93c553 <shrink_lruvec+0x89d3>	93c54f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
89d3   93c553:	85 db                	test   %ebx,%ebx
89d5   93c555:	0f 85 8e 00 00 00    	jne    93c5e9 <shrink_lruvec+0x8a69>
89db   93c55b:	e8 00 00 00 00       	call   93c560 <shrink_lruvec+0x89e0>	93c55c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
89e0   93c560:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
89e5   93c565:	48 8d 78 18          	lea    0x18(%rax),%rdi
89e9   93c569:	48 89 f8             	mov    %rdi,%rax
89ec   93c56c:	48 c1 e8 03          	shr    $0x3,%rax
89f0   93c570:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
89f5   93c575:	74 05                	je     93c57c <shrink_lruvec+0x89fc>
89f7   93c577:	e8 00 00 00 00       	call   93c57c <shrink_lruvec+0x89fc>	93c578: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
89fc   93c57c:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
8a01   93c581:	4c 8b 78 18          	mov    0x18(%rax),%r15
8a05   93c585:	48 8d 58 20          	lea    0x20(%rax),%rbx
8a09   93c589:	48 89 d8             	mov    %rbx,%rax
8a0c   93c58c:	48 c1 e8 03          	shr    $0x3,%rax
8a10   93c590:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8a15   93c595:	74 08                	je     93c59f <shrink_lruvec+0x8a1f>
8a17   93c597:	48 89 df             	mov    %rbx,%rdi
8a1a   93c59a:	e8 00 00 00 00       	call   93c59f <shrink_lruvec+0x8a1f>	93c59b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8a1f   93c59f:	48 8b 03             	mov    (%rbx),%rax
8a22   93c5a2:	4a 8d 14 38          	lea    (%rax,%r15,1),%rdx
8a26   93c5a6:	4a 8d 0c 3a          	lea    (%rdx,%r15,1),%rcx
8a2a   93c5aa:	48 8d 34 10          	lea    (%rax,%rdx,1),%rsi
8a2e   93c5ae:	48 83 c6 01          	add    $0x1,%rsi
8a32   93c5b2:	48 01 f1             	add    %rsi,%rcx
8a35   93c5b5:	48 89 c8             	mov    %rcx,%rax
8a38   93c5b8:	49 0f af c6          	imul   %r14,%rax
8a3c   93c5bc:	49 8d 3c 17          	lea    (%r15,%rdx,1),%rdi
8a40   93c5c0:	48 83 c7 01          	add    $0x1,%rdi
8a44   93c5c4:	48 89 c2             	mov    %rax,%rdx
8a47   93c5c7:	48 09 fa             	or     %rdi,%rdx
8a4a   93c5ca:	48 c1 ea 20          	shr    $0x20,%rdx
8a4e   93c5ce:	74 23                	je     93c5f3 <shrink_lruvec+0x8a73>
8a50   93c5d0:	31 d2                	xor    %edx,%edx
8a52   93c5d2:	48 f7 f7             	div    %rdi
8a55   93c5d5:	49 89 c7             	mov    %rax,%r15
8a58   93c5d8:	eb 20                	jmp    93c5fa <shrink_lruvec+0x8a7a>
8a5a   93c5da:	e8 00 00 00 00       	call   93c5df <shrink_lruvec+0x8a5f>	93c5db: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8a5f   93c5df:	b8 02 00 00 00       	mov    $0x2,%eax
8a64   93c5e4:	e9 08 d9 ff ff       	jmp    939ef1 <shrink_lruvec+0x6371>
8a69   93c5e9:	e8 00 00 00 00       	call   93c5ee <shrink_lruvec+0x8a6e>	93c5ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8a6e   93c5ee:	e9 ec d8 ff ff       	jmp    939edf <shrink_lruvec+0x635f>
8a73   93c5f3:	31 d2                	xor    %edx,%edx
8a75   93c5f5:	f7 f7                	div    %edi
8a77   93c5f7:	41 89 c7             	mov    %eax,%r15d
8a7a   93c5fa:	b8 c8 00 00 00       	mov    $0xc8,%eax
8a7f   93c5ff:	44 29 f0             	sub    %r14d,%eax
8a82   93c602:	48 98                	cltq
8a84   93c604:	48 0f af c8          	imul   %rax,%rcx
8a88   93c608:	48 89 c8             	mov    %rcx,%rax
8a8b   93c60b:	48 09 f0             	or     %rsi,%rax
8a8e   93c60e:	48 c1 e8 20          	shr    $0x20,%rax
8a92   93c612:	48 8d bc 24 50 03 00 00 	lea    0x350(%rsp),%rdi
8a9a   93c61a:	74 0d                	je     93c629 <shrink_lruvec+0x8aa9>
8a9c   93c61c:	48 89 c8             	mov    %rcx,%rax
8a9f   93c61f:	31 d2                	xor    %edx,%edx
8aa1   93c621:	48 f7 f6             	div    %rsi
8aa4   93c624:	48 89 c3             	mov    %rax,%rbx
8aa7   93c627:	eb 08                	jmp    93c631 <shrink_lruvec+0x8ab1>
8aa9   93c629:	89 c8                	mov    %ecx,%eax
8aab   93c62b:	31 d2                	xor    %edx,%edx
8aad   93c62d:	f7 f6                	div    %esi
8aaf   93c62f:	89 c3                	mov    %eax,%ebx
8ab1   93c631:	48 89 f8             	mov    %rdi,%rax
8ab4   93c634:	48 c1 e8 03          	shr    $0x3,%rax
8ab8   93c638:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8abd   93c63d:	74 15                	je     93c654 <shrink_lruvec+0x8ad4>
8abf   93c63f:	48 8d bc 24 50 03 00 00 	lea    0x350(%rsp),%rdi
8ac7   93c647:	e8 00 00 00 00       	call   93c64c <shrink_lruvec+0x8acc>	93c648: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
8acc   93c64c:	48 8d bc 24 50 03 00 00 	lea    0x350(%rsp),%rdi
8ad4   93c654:	4c 89 bc 24 50 03 00 00 	mov    %r15,0x350(%rsp)
8adc   93c65c:	48 83 c7 08          	add    $0x8,%rdi
8ae0   93c660:	48 89 f8             	mov    %rdi,%rax
8ae3   93c663:	48 c1 e8 03          	shr    $0x3,%rax
8ae7   93c667:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8aec   93c66c:	74 05                	je     93c673 <shrink_lruvec+0x8af3>
8aee   93c66e:	e8 00 00 00 00       	call   93c673 <shrink_lruvec+0x8af3>	93c66f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
8af3   93c673:	48 89 9c 24 58 03 00 00 	mov    %rbx,0x358(%rsp)
8afb   93c67b:	49 01 df             	add    %rbx,%r15
8afe   93c67e:	b8 01 00 00 00       	mov    $0x1,%eax
8b03   93c683:	31 c9                	xor    %ecx,%ecx
8b05   93c685:	48 89 8c 24 a0 00 00 00 	mov    %rcx,0xa0(%rsp)
8b0d   93c68d:	e9 62 d8 ff ff       	jmp    939ef4 <shrink_lruvec+0x6374>
8b12   93c692:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93c695: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8b19   93c699:	48 c1 e8 03          	shr    $0x3,%rax
8b1d   93c69d:	42 8a 04 28          	mov    (%rax,%r13,1),%al
8b21   93c6a1:	84 c0                	test   %al,%al
8b23   93c6a3:	0f 85 cb 02 00 00    	jne    93c974 <shrink_lruvec+0x8df4>
8b29   93c6a9:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 93c6af <shrink_lruvec+0x8b2f>	93c6ab: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
8b2f   93c6af:	bf 01 00 00 00       	mov    $0x1,%edi
8b34   93c6b4:	89 de                	mov    %ebx,%esi
8b36   93c6b6:	e8 00 00 00 00       	call   93c6bb <shrink_lruvec+0x8b3b>	93c6b7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
8b3b   93c6bb:	85 db                	test   %ebx,%ebx
8b3d   93c6bd:	7e 49                	jle    93c708 <shrink_lruvec+0x8b88>
8b3f   93c6bf:	e8 00 00 00 00       	call   93c6c4 <shrink_lruvec+0x8b44>	93c6c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8b44   93c6c4:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	93c6c7: R_X86_64_32S	root_mem_cgroup
8b4b   93c6cb:	48 c1 e8 03          	shr    $0x3,%rax
8b4f   93c6cf:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
8b54   93c6d4:	74 0c                	je     93c6e2 <shrink_lruvec+0x8b62>
8b56   93c6d6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c6d9: R_X86_64_32S	root_mem_cgroup
8b5d   93c6dd:	e8 00 00 00 00       	call   93c6e2 <shrink_lruvec+0x8b62>	93c6de: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
8b62   93c6e2:	48 8b 84 24 88 00 00 00 	mov    0x88(%rsp),%rax
8b6a   93c6ea:	48 39 05 00 00 00 00 	cmp    %rax,0x0(%rip)        # 93c6f1 <shrink_lruvec+0x8b71>	93c6ed: R_X86_64_PC32	root_mem_cgroup-0x4
8b71   93c6f1:	48 8d 80 08 06 00 00 	lea    0x608(%rax),%rax
8b78   93c6f8:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	93c6fb: R_X86_64_32S	vm_swappiness
8b7f   93c6ff:	48 0f 45 d8          	cmovne %rax,%rbx
8b83   93c703:	e9 41 78 ff ff       	jmp    933f49 <shrink_lruvec+0x3c9>
8b88   93c708:	e8 00 00 00 00       	call   93c70d <shrink_lruvec+0x8b8d>	93c709: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
8b8d   93c70d:	e9 30 78 ff ff       	jmp    933f42 <shrink_lruvec+0x3c2>
8b92   93c712:	89 d1                	mov    %edx,%ecx
8b94   93c714:	80 e1 07             	and    $0x7,%cl
8b97   93c717:	80 c1 03             	add    $0x3,%cl
8b9a   93c71a:	38 c1                	cmp    %al,%cl
8b9c   93c71c:	0f 8c 62 d7 ff ff    	jl     939e84 <shrink_lruvec+0x6304>
8ba2   93c722:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
8ba7   93c727:	e8 00 00 00 00       	call   93c72c <shrink_lruvec+0x8bac>	93c728: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8bac   93c72c:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
8bb1   93c731:	e9 4e d7 ff ff       	jmp    939e84 <shrink_lruvec+0x6304>
8bb6   93c736:	89 d9                	mov    %ebx,%ecx
8bb8   93c738:	80 e1 07             	and    $0x7,%cl
8bbb   93c73b:	80 c1 03             	add    $0x3,%cl
8bbe   93c73e:	38 c1                	cmp    %al,%cl
8bc0   93c740:	0f 8c f6 76 ff ff    	jl     933e3c <shrink_lruvec+0x2bc>
8bc6   93c746:	48 89 df             	mov    %rbx,%rdi
8bc9   93c749:	e8 00 00 00 00       	call   93c74e <shrink_lruvec+0x8bce>	93c74a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8bce   93c74e:	e9 e9 76 ff ff       	jmp    933e3c <shrink_lruvec+0x2bc>
8bd3   93c753:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93c756: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8bda   93c75a:	80 e1 07             	and    $0x7,%cl
8bdd   93c75d:	80 c1 03             	add    $0x3,%cl
8be0   93c760:	38 c1                	cmp    %al,%cl
8be2   93c762:	0f 8c 43 77 ff ff    	jl     933eab <shrink_lruvec+0x32b>
8be8   93c768:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c76b: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8bef   93c76f:	e8 00 00 00 00       	call   93c774 <shrink_lruvec+0x8bf4>	93c770: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8bf4   93c774:	e9 32 77 ff ff       	jmp    933eab <shrink_lruvec+0x32b>
8bf9   93c779:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93c77c: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
8c00   93c780:	80 e1 07             	and    $0x7,%cl
8c03   93c783:	80 c1 03             	add    $0x3,%cl
8c06   93c786:	38 c1                	cmp    %al,%cl
8c08   93c788:	0f 8c 98 77 ff ff    	jl     933f26 <shrink_lruvec+0x3a6>
8c0e   93c78e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c791: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
8c15   93c795:	e8 00 00 00 00       	call   93c79a <shrink_lruvec+0x8c1a>	93c796: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8c1a   93c79a:	e9 87 77 ff ff       	jmp    933f26 <shrink_lruvec+0x3a6>
8c1f   93c79f:	89 d9                	mov    %ebx,%ecx
8c21   93c7a1:	80 e1 07             	and    $0x7,%cl
8c24   93c7a4:	80 c1 03             	add    $0x3,%cl
8c27   93c7a7:	38 c1                	cmp    %al,%cl
8c29   93c7a9:	0f 8c b5 77 ff ff    	jl     933f64 <shrink_lruvec+0x3e4>
8c2f   93c7af:	49 89 fe             	mov    %rdi,%r14
8c32   93c7b2:	48 89 df             	mov    %rbx,%rdi
8c35   93c7b5:	e8 00 00 00 00       	call   93c7ba <shrink_lruvec+0x8c3a>	93c7b6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8c3a   93c7ba:	4c 89 f7             	mov    %r14,%rdi
8c3d   93c7bd:	e9 a2 77 ff ff       	jmp    933f64 <shrink_lruvec+0x3e4>
8c42   93c7c2:	89 d9                	mov    %ebx,%ecx
8c44   93c7c4:	80 e1 07             	and    $0x7,%cl
8c47   93c7c7:	80 c1 01             	add    $0x1,%cl
8c4a   93c7ca:	38 c1                	cmp    %al,%cl
8c4c   93c7cc:	0f 8c c5 77 ff ff    	jl     933f97 <shrink_lruvec+0x417>
8c52   93c7d2:	48 89 df             	mov    %rbx,%rdi
8c55   93c7d5:	e8 00 00 00 00       	call   93c7da <shrink_lruvec+0x8c5a>	93c7d6: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
8c5a   93c7da:	e9 b8 77 ff ff       	jmp    933f97 <shrink_lruvec+0x417>
8c5f   93c7df:	89 d9                	mov    %ebx,%ecx
8c61   93c7e1:	80 e1 07             	and    $0x7,%cl
8c64   93c7e4:	80 c1 03             	add    $0x3,%cl
8c67   93c7e7:	38 c1                	cmp    %al,%cl
8c69   93c7e9:	0f 8c a3 f9 ff ff    	jl     93c192 <shrink_lruvec+0x8612>
8c6f   93c7ef:	48 89 df             	mov    %rbx,%rdi
8c72   93c7f2:	e8 00 00 00 00       	call   93c7f7 <shrink_lruvec+0x8c77>	93c7f3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8c77   93c7f7:	e9 96 f9 ff ff       	jmp    93c192 <shrink_lruvec+0x8612>
8c7c   93c7fc:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93c7ff: R_X86_64_32S	numa_demotion_enabled
8c83   93c803:	80 e1 07             	and    $0x7,%cl
8c86   93c806:	38 c1                	cmp    %al,%cl
8c88   93c808:	0f 8c 9e f9 ff ff    	jl     93c1ac <shrink_lruvec+0x862c>
8c8e   93c80e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c811: R_X86_64_32S	numa_demotion_enabled
8c95   93c815:	e8 00 00 00 00       	call   93c81a <shrink_lruvec+0x8c9a>	93c816: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
8c9a   93c81a:	e9 8d f9 ff ff       	jmp    93c1ac <shrink_lruvec+0x862c>
8c9f   93c81f:	48 8b 8c 24 98 00 00 00 	mov    0x98(%rsp),%rcx
8ca7   93c827:	80 e1 07             	and    $0x7,%cl
8caa   93c82a:	80 c1 01             	add    $0x1,%cl
8cad   93c82d:	38 c1                	cmp    %al,%cl
8caf   93c82f:	0f 8c ca d5 ff ff    	jl     939dff <shrink_lruvec+0x627f>
8cb5   93c835:	48 8b bc 24 98 00 00 00 	mov    0x98(%rsp),%rdi
8cbd   93c83d:	e8 00 00 00 00       	call   93c842 <shrink_lruvec+0x8cc2>	93c83e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
8cc2   93c842:	e9 b8 d5 ff ff       	jmp    939dff <shrink_lruvec+0x627f>
8cc7   93c847:	44 89 f9             	mov    %r15d,%ecx
8cca   93c84a:	80 e1 07             	and    $0x7,%cl
8ccd   93c84d:	80 c1 03             	add    $0x3,%cl
8cd0   93c850:	38 c1                	cmp    %al,%cl
8cd2   93c852:	0f 8c 81 77 ff ff    	jl     933fd9 <shrink_lruvec+0x459>
8cd8   93c858:	4c 89 ff             	mov    %r15,%rdi
8cdb   93c85b:	e8 00 00 00 00       	call   93c860 <shrink_lruvec+0x8ce0>	93c85c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8ce0   93c860:	e9 74 77 ff ff       	jmp    933fd9 <shrink_lruvec+0x459>
8ce5   93c865:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93c868: R_X86_64_32S	numa_demotion_enabled
8cec   93c86c:	80 e1 07             	and    $0x7,%cl
8cef   93c86f:	38 c1                	cmp    %al,%cl
8cf1   93c871:	0f 8c 7c 77 ff ff    	jl     933ff3 <shrink_lruvec+0x473>
8cf7   93c877:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c87a: R_X86_64_32S	numa_demotion_enabled
8cfe   93c87e:	e8 00 00 00 00       	call   93c883 <shrink_lruvec+0x8d03>	93c87f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
8d03   93c883:	e9 6b 77 ff ff       	jmp    933ff3 <shrink_lruvec+0x473>
8d08   93c888:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
8d0d   93c88d:	80 e1 07             	and    $0x7,%cl
8d10   93c890:	80 c1 01             	add    $0x1,%cl
8d13   93c893:	38 c1                	cmp    %al,%cl
8d15   93c895:	0f 8c 41 f9 ff ff    	jl     93c1dc <shrink_lruvec+0x865c>
8d1b   93c89b:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
8d20   93c8a0:	e8 00 00 00 00       	call   93c8a5 <shrink_lruvec+0x8d25>	93c8a1: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
8d25   93c8a5:	e9 32 f9 ff ff       	jmp    93c1dc <shrink_lruvec+0x865c>
8d2a   93c8aa:	89 d9                	mov    %ebx,%ecx
8d2c   93c8ac:	80 e1 07             	and    $0x7,%cl
8d2f   93c8af:	80 c1 03             	add    $0x3,%cl
8d32   93c8b2:	38 c1                	cmp    %al,%cl
8d34   93c8b4:	0f 8c 0e e0 ff ff    	jl     93a8c8 <shrink_lruvec+0x6d48>
8d3a   93c8ba:	48 89 df             	mov    %rbx,%rdi
8d3d   93c8bd:	e8 00 00 00 00       	call   93c8c2 <shrink_lruvec+0x8d42>	93c8be: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8d42   93c8c2:	e9 01 e0 ff ff       	jmp    93a8c8 <shrink_lruvec+0x6d48>
8d47   93c8c7:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93c8ca: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8d4e   93c8ce:	80 e1 07             	and    $0x7,%cl
8d51   93c8d1:	80 c1 03             	add    $0x3,%cl
8d54   93c8d4:	38 c1                	cmp    %al,%cl
8d56   93c8d6:	0f 8c 6f f9 ff ff    	jl     93c24b <shrink_lruvec+0x86cb>
8d5c   93c8dc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c8df: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8d63   93c8e3:	e8 00 00 00 00       	call   93c8e8 <shrink_lruvec+0x8d68>	93c8e4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8d68   93c8e8:	e9 5e f9 ff ff       	jmp    93c24b <shrink_lruvec+0x86cb>
8d6d   93c8ed:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93c8f0: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8d74   93c8f4:	80 e1 07             	and    $0x7,%cl
8d77   93c8f7:	80 c1 03             	add    $0x3,%cl
8d7a   93c8fa:	38 c1                	cmp    %al,%cl
8d7c   93c8fc:	0f 8c 02 fa ff ff    	jl     93c304 <shrink_lruvec+0x8784>
8d82   93c902:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c905: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8d89   93c909:	e8 00 00 00 00       	call   93c90e <shrink_lruvec+0x8d8e>	93c90a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8d8e   93c90e:	e9 f1 f9 ff ff       	jmp    93c304 <shrink_lruvec+0x8784>
8d93   93c913:	48 8b 8c 24 f0 00 00 00 	mov    0xf0(%rsp),%rcx
8d9b   93c91b:	80 e1 07             	and    $0x7,%cl
8d9e   93c91e:	38 c1                	cmp    %al,%cl
8da0   93c920:	0f 8c d7 df ff ff    	jl     93a8fd <shrink_lruvec+0x6d7d>
8da6   93c926:	48 8b bc 24 f0 00 00 00 	mov    0xf0(%rsp),%rdi
8dae   93c92e:	e8 00 00 00 00       	call   93c933 <shrink_lruvec+0x8db3>	93c92f: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
8db3   93c933:	e9 c5 df ff ff       	jmp    93a8fd <shrink_lruvec+0x6d7d>
8db8   93c938:	89 d9                	mov    %ebx,%ecx
8dba   93c93a:	80 e1 07             	and    $0x7,%cl
8dbd   93c93d:	38 c1                	cmp    %al,%cl
8dbf   93c93f:	0f 8c 67 fb ff ff    	jl     93c4ac <shrink_lruvec+0x892c>
8dc5   93c945:	48 89 df             	mov    %rbx,%rdi
8dc8   93c948:	e8 00 00 00 00       	call   93c94d <shrink_lruvec+0x8dcd>	93c949: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
8dcd   93c94d:	e9 5a fb ff ff       	jmp    93c4ac <shrink_lruvec+0x892c>
8dd2   93c952:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
8dd7   93c957:	80 e1 07             	and    $0x7,%cl
8dda   93c95a:	80 c1 01             	add    $0x1,%cl
8ddd   93c95d:	38 c1                	cmp    %al,%cl
8ddf   93c95f:	0f 8c b1 fb ff ff    	jl     93c516 <shrink_lruvec+0x8996>
8de5   93c965:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
8dea   93c96a:	e8 00 00 00 00       	call   93c96f <shrink_lruvec+0x8def>	93c96b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
8def   93c96f:	e9 a2 fb ff ff       	jmp    93c516 <shrink_lruvec+0x8996>
8df4   93c974:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	93c977: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8dfb   93c97b:	80 e1 07             	and    $0x7,%cl
8dfe   93c97e:	80 c1 03             	add    $0x3,%cl
8e01   93c981:	38 c1                	cmp    %al,%cl
8e03   93c983:	0f 8c 20 fd ff ff    	jl     93c6a9 <shrink_lruvec+0x8b29>
8e09   93c989:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	93c98c: R_X86_64_32S	memory_cgrp_subsys_enabled_key
8e10   93c990:	e8 00 00 00 00       	call   93c995 <shrink_lruvec+0x8e15>	93c991: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
8e15   93c995:	e9 0f fd ff ff       	jmp    93c6a9 <shrink_lruvec+0x8b29>
8e1a   93c99a:	e8 00 00 00 00       	call   93c99f <shrink_lruvec+0x8e1f>	93c99b: R_X86_64_PLT32	__stack_chk_fail-0x4
8e1f   93c99f:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
8e29   93c9a9:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
8e33   93c9b3:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
8e3d   93c9bd:	0f 1f 00             	nopl   (%rax)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--500iYcF3XOHOWim/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/x86_64 6.0.0-rc3 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="clang version 14.0.6 (git://gitmirror/llvm_project f28c006a5895fc0e329fe15fead81e37457cb1d1)"
CONFIG_GCC_VERSION=0
CONFIG_CC_IS_CLANG=y
CONFIG_CLANG_VERSION=140006
CONFIG_AS_IS_LLVM=y
CONFIG_AS_VERSION=140006
CONFIG_LD_VERSION=0
CONFIG_LD_IS_LLD=y
CONFIG_LLD_VERSION=140006
CONFIG_CC_CAN_LINK=y
CONFIG_CC_CAN_LINK_STATIC=y
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_TOOLS_SUPPORT_RELR=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y
CONFIG_THREAD_INFO_IN_TASK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
# CONFIG_COMPILE_TEST is not set
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_LOCALVERSION_AUTO=y
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_BZIP2=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_HAVE_KERNEL_XZ=y
CONFIG_HAVE_KERNEL_LZO=y
CONFIG_HAVE_KERNEL_LZ4=y
CONFIG_HAVE_KERNEL_ZSTD=y
# CONFIG_KERNEL_GZIP is not set
# CONFIG_KERNEL_BZIP2 is not set
# CONFIG_KERNEL_LZMA is not set
# CONFIG_KERNEL_XZ is not set
# CONFIG_KERNEL_LZO is not set
CONFIG_KERNEL_LZ4=y
# CONFIG_KERNEL_ZSTD is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
# CONFIG_USELIB is not set
CONFIG_AUDIT=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y
CONFIG_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_PROBE=y
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_MIGRATION=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_HARDIRQS_SW_RESEND=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_GENERIC_MSI_IRQ_DOMAIN=y
CONFIG_IRQ_MSI_IOMMU=y
CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=y
CONFIG_GENERIC_IRQ_RESERVATION_MODE=y
CONFIG_IRQ_FORCED_THREADING=y
CONFIG_SPARSE_IRQ=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_CLOCKSOURCE_WATCHDOG=y
CONFIG_ARCH_CLOCKSOURCE_INIT=y
CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=y
CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=y
CONFIG_GENERIC_CMOS_UPDATE=y
CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_POSIX_CPU_TIMERS_TASK_WORK=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y
CONFIG_CONTEXT_TRACKING_USER=y
# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
# CONFIG_NO_HZ is not set
# CONFIG_HIGH_RES_TIMERS is not set
CONFIG_CLOCKSOURCE_WATCHDOG_MAX_SKEW_US=100
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y
CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_JIT_ALWAYS_ON=y
CONFIG_BPF_JIT_DEFAULT_ON=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
CONFIG_USERMODE_DRIVER=y
CONFIG_BPF_PRELOAD=y
CONFIG_BPF_PRELOAD_UMD=m
# CONFIG_BPF_LSM is not set
# end of BPF subsystem

CONFIG_PREEMPT_VOLUNTARY_BUILD=y
# CONFIG_PREEMPT_NONE is not set
CONFIG_PREEMPT_VOLUNTARY=y
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y
# CONFIG_PREEMPT_DYNAMIC is not set
# CONFIG_SCHED_CORE is not set

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
CONFIG_RCU_FANOUT=64
CONFIG_RCU_FANOUT_LEAF=16
CONFIG_RCU_NOCB_CPU=y
CONFIG_RCU_NOCB_CPU_DEFAULT_ALL=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m
CONFIG_LOG_BUF_SHIFT=20
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=y

#
# Scheduler features
#
# CONFIG_UCLAMP_TASK is not set
# end of Scheduler features

CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=y
CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=y
CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_ARCH_SUPPORTS_INT128=y
CONFIG_NUMA_BALANCING=y
CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
CONFIG_MEMCG=y
CONFIG_MEMCG_KMEM=y
# CONFIG_CGROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
CONFIG_CGROUP_HUGETLB=y
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
# CONFIG_CGROUP_PERF is not set
# CONFIG_CGROUP_BPF is not set
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_NAMESPACES is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
CONFIG_RD_GZIP=y
CONFIG_RD_BZIP2=y
CONFIG_RD_LZMA=y
# CONFIG_RD_XZ is not set
CONFIG_RD_LZO=y
# CONFIG_RD_LZ4 is not set
# CONFIG_RD_ZSTD is not set
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_EMBED is not set
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_LD_ORPHAN_WARN=y
CONFIG_SYSCTL=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_HAVE_PCSPKR_PLATFORM=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
# CONFIG_SYSFS_SYSCALL is not set
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_PCSPKR_PLATFORM=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
# CONFIG_IO_URING is not set
CONFIG_ADVISE_SYSCALLS=y
CONFIG_MEMBARRIER=y
CONFIG_KALLSYMS=y
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
CONFIG_KCMP=y
CONFIG_RSEQ=y
CONFIG_DEBUG_RSEQ=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_GUEST_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
# CONFIG_PROFILING is not set
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_X86_64=y
CONFIG_X86=y
CONFIG_INSTRUCTION_DECODER=y
CONFIG_OUTPUT_FORMAT="elf64-x86-64"
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_MMU=y
CONFIG_ARCH_MMAP_RND_BITS_MIN=28
CONFIG_ARCH_MMAP_RND_BITS_MAX=32
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=8
CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=16
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_BUG_RELATIVE_POINTERS=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_HAS_CPU_RELAX=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_ARCH_NR_GPIO=1024
CONFIG_ARCH_SUSPEND_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
CONFIG_HAVE_INTEL_TXT=y
CONFIG_X86_64_SMP=y
CONFIG_ARCH_SUPPORTS_UPROBES=y
CONFIG_FIX_EARLYCON_MEM=y
CONFIG_DYNAMIC_PHYSICAL_MASK=y
CONFIG_PGTABLE_LEVELS=5
CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

#
# Processor type and features
#
CONFIG_SMP=y
CONFIG_X86_FEATURE_NAMES=y
CONFIG_X86_X2APIC=y
# CONFIG_X86_MPPARSE is not set
# CONFIG_GOLDFISH is not set
CONFIG_X86_CPU_RESCTRL=y
# CONFIG_X86_EXTENDED_PLATFORM is not set
# CONFIG_X86_INTEL_LPSS is not set
# CONFIG_X86_AMD_PLATFORM_DEVICE is not set
CONFIG_IOSF_MBI=y
# CONFIG_IOSF_MBI_DEBUG is not set
CONFIG_X86_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_SCHED_OMIT_FRAME_POINTER is not set
CONFIG_HYPERVISOR_GUEST=y
CONFIG_PARAVIRT=y
CONFIG_PARAVIRT_XXL=y
CONFIG_PARAVIRT_DEBUG=y
CONFIG_PARAVIRT_SPINLOCKS=y
CONFIG_X86_HV_CALLBACK_VECTOR=y
CONFIG_XEN=y
CONFIG_XEN_PV=y
# CONFIG_XEN_512GB is not set
CONFIG_XEN_PV_SMP=y
CONFIG_XEN_PV_DOM0=y
CONFIG_XEN_PVHVM=y
CONFIG_XEN_PVHVM_SMP=y
# CONFIG_XEN_PVHVM_GUEST is not set
CONFIG_XEN_SAVE_RESTORE=y
CONFIG_XEN_DEBUG_FS=y
CONFIG_XEN_PVH=y
CONFIG_XEN_DOM0=y
CONFIG_KVM_GUEST=y
CONFIG_ARCH_CPUIDLE_HALTPOLL=y
CONFIG_PVH=y
CONFIG_PARAVIRT_TIME_ACCOUNTING=y
CONFIG_PARAVIRT_CLOCK=y
# CONFIG_JAILHOUSE_GUEST is not set
# CONFIG_ACRN_GUEST is not set
CONFIG_INTEL_TDX_GUEST=y
# CONFIG_MK8 is not set
# CONFIG_MPSC is not set
# CONFIG_MCORE2 is not set
# CONFIG_MATOM is not set
CONFIG_GENERIC_CPU=y
CONFIG_X86_INTERNODE_CACHE_SHIFT=6
CONFIG_X86_L1_CACHE_SHIFT=6
CONFIG_X86_TSC=y
CONFIG_X86_CMPXCHG64=y
CONFIG_X86_CMOV=y
CONFIG_X86_MINIMUM_CPU_FAMILY=64
CONFIG_X86_DEBUGCTLMSR=y
CONFIG_IA32_FEAT_CTL=y
CONFIG_X86_VMX_FEATURE_NAMES=y
CONFIG_PROCESSOR_SELECT=y
CONFIG_CPU_SUP_INTEL=y
# CONFIG_CPU_SUP_AMD is not set
# CONFIG_CPU_SUP_HYGON is not set
# CONFIG_CPU_SUP_CENTAUR is not set
# CONFIG_CPU_SUP_ZHAOXIN is not set
CONFIG_HPET_TIMER=y
# CONFIG_DMI is not set
# CONFIG_MAXSMP is not set
CONFIG_NR_CPUS_RANGE_BEGIN=2
CONFIG_NR_CPUS_RANGE_END=8192
CONFIG_NR_CPUS_DEFAULT=64
CONFIG_NR_CPUS=64
CONFIG_SCHED_CLUSTER=y
CONFIG_SCHED_SMT=y
CONFIG_SCHED_MC=y
CONFIG_SCHED_MC_PRIO=y
CONFIG_X86_LOCAL_APIC=y
CONFIG_X86_IO_APIC=y
# CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS is not set
CONFIG_X86_MCE=y
# CONFIG_X86_MCELOG_LEGACY is not set
CONFIG_X86_MCE_INTEL=y
CONFIG_X86_MCE_THRESHOLD=y
# CONFIG_X86_MCE_INJECT is not set

#
# Performance monitoring
#
# CONFIG_PERF_EVENTS_INTEL_UNCORE is not set
CONFIG_PERF_EVENTS_INTEL_RAPL=m
CONFIG_PERF_EVENTS_INTEL_CSTATE=m
# end of Performance monitoring

CONFIG_X86_VSYSCALL_EMULATION=y
CONFIG_X86_IOPL_IOPERM=y
# CONFIG_MICROCODE is not set
# CONFIG_X86_MSR is not set
CONFIG_X86_CPUID=m
CONFIG_X86_5LEVEL=y
CONFIG_X86_DIRECT_GBPAGES=y
# CONFIG_X86_CPA_STATISTICS is not set
CONFIG_X86_MEM_ENCRYPT=y
CONFIG_NUMA=y
# CONFIG_AMD_NUMA is not set
# CONFIG_X86_64_ACPI_NUMA is not set
# CONFIG_NUMA_EMU is not set
CONFIG_NODES_SHIFT=6
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_MEMORY_PROBE=y
CONFIG_ILLEGAL_POINTER_VALUE=0xdead000000000000
CONFIG_X86_CHECK_BIOS_CORRUPTION=y
CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
CONFIG_MTRR=y
# CONFIG_MTRR_SANITIZER is not set
# CONFIG_X86_PAT is not set
CONFIG_X86_UMIP=y
CONFIG_CC_HAS_IBT=y
# CONFIG_X86_KERNEL_IBT is not set
# CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS is not set
CONFIG_X86_INTEL_TSX_MODE_OFF=y
# CONFIG_X86_INTEL_TSX_MODE_ON is not set
# CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
CONFIG_X86_SGX=y
CONFIG_EFI=y
CONFIG_EFI_STUB=y
CONFIG_EFI_MIXED=y
# CONFIG_HZ_100 is not set
# CONFIG_HZ_250 is not set
CONFIG_HZ_300=y
# CONFIG_HZ_1000 is not set
CONFIG_HZ=300
# CONFIG_KEXEC is not set
# CONFIG_KEXEC_FILE is not set
# CONFIG_CRASH_DUMP is not set
CONFIG_PHYSICAL_START=0x1000000
CONFIG_RELOCATABLE=y
# CONFIG_RANDOMIZE_BASE is not set
CONFIG_PHYSICAL_ALIGN=0x200000
CONFIG_DYNAMIC_MEMORY_LAYOUT=y
CONFIG_HOTPLUG_CPU=y
# CONFIG_BOOTPARAM_HOTPLUG_CPU0 is not set
# CONFIG_DEBUG_HOTPLUG_CPU0 is not set
CONFIG_LEGACY_VSYSCALL_XONLY=y
# CONFIG_LEGACY_VSYSCALL_NONE is not set
# CONFIG_CMDLINE_BOOL is not set
# CONFIG_MODIFY_LDT_SYSCALL is not set
CONFIG_STRICT_SIGALTSTACK_SIZE=y
CONFIG_HAVE_LIVEPATCH=y
# end of Processor type and features

CONFIG_SPECULATION_MITIGATIONS=y
# CONFIG_PAGE_TABLE_ISOLATION is not set
# CONFIG_RETPOLINE is not set
# CONFIG_CPU_IBRS_ENTRY is not set
CONFIG_ARCH_HAS_ADD_PAGES=y
CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=y

#
# Power management and ACPI options
#
# CONFIG_SUSPEND is not set
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_PM_SLEEP=y
CONFIG_PM_SLEEP_SMP=y
# CONFIG_PM_AUTOSLEEP is not set
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
CONFIG_PM_SLEEP_DEBUG=y
CONFIG_DPM_WATCHDOG=y
CONFIG_DPM_WATCHDOG_TIMEOUT=120
# CONFIG_PM_TRACE_RTC is not set
CONFIG_PM_CLK=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_ENERGY_MODEL=y
CONFIG_ARCH_SUPPORTS_ACPI=y
CONFIG_ACPI=y
CONFIG_ACPI_LEGACY_TABLES_LOOKUP=y
CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=y
CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=y
CONFIG_ACPI_DEBUGGER=y
CONFIG_ACPI_DEBUGGER_USER=m
# CONFIG_ACPI_SPCR_TABLE is not set
CONFIG_ACPI_FPDT=y
CONFIG_ACPI_LPIT=y
CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=y
# CONFIG_ACPI_EC_DEBUGFS is not set
# CONFIG_ACPI_AC is not set
# CONFIG_ACPI_BATTERY is not set
# CONFIG_ACPI_BUTTON is not set
# CONFIG_ACPI_TINY_POWER_BUTTON is not set
CONFIG_ACPI_VIDEO=m
CONFIG_ACPI_FAN=y
CONFIG_ACPI_TAD=m
# CONFIG_ACPI_DOCK is not set
CONFIG_ACPI_CPU_FREQ_PSS=y
CONFIG_ACPI_PROCESSOR_CSTATE=y
CONFIG_ACPI_PROCESSOR_IDLE=y
CONFIG_ACPI_CPPC_LIB=y
CONFIG_ACPI_PROCESSOR=y
# CONFIG_ACPI_IPMI is not set
CONFIG_ACPI_HOTPLUG_CPU=y
CONFIG_ACPI_PROCESSOR_AGGREGATOR=y
# CONFIG_ACPI_THERMAL is not set
CONFIG_ACPI_PLATFORM_PROFILE=m
CONFIG_ACPI_CUSTOM_DSDT_FILE=""
CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_TABLE_UPGRADE=y
CONFIG_ACPI_DEBUG=y
# CONFIG_ACPI_PCI_SLOT is not set
CONFIG_ACPI_CONTAINER=y
CONFIG_ACPI_HOTPLUG_MEMORY=y
CONFIG_ACPI_HOTPLUG_IOAPIC=y
# CONFIG_ACPI_SBS is not set
# CONFIG_ACPI_HED is not set
# CONFIG_ACPI_CUSTOM_METHOD is not set
CONFIG_ACPI_BGRT=y
# CONFIG_ACPI_REDUCED_HARDWARE_ONLY is not set
# CONFIG_ACPI_NUMA is not set
CONFIG_HAVE_ACPI_APEI=y
CONFIG_HAVE_ACPI_APEI_NMI=y
# CONFIG_ACPI_APEI is not set
CONFIG_ACPI_DPTF=y
# CONFIG_DPTF_POWER is not set
CONFIG_DPTF_PCH_FIVR=m
CONFIG_ACPI_WATCHDOG=y
# CONFIG_ACPI_EXTLOG is not set
CONFIG_ACPI_CONFIGFS=m
CONFIG_ACPI_PFRUT=y
# CONFIG_ACPI_PCC is not set
CONFIG_PMIC_OPREGION=y
CONFIG_TPS68470_PMIC_OPREGION=y
CONFIG_ACPI_PRMT=y
CONFIG_X86_PM_TIMER=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
CONFIG_CPU_FREQ_STAT=y
CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
# CONFIG_CPU_FREQ_GOV_POWERSAVE is not set
CONFIG_CPU_FREQ_GOV_USERSPACE=m
CONFIG_CPU_FREQ_GOV_ONDEMAND=y
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y
CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y

#
# CPU frequency scaling drivers
#
CONFIG_X86_INTEL_PSTATE=y
CONFIG_X86_PCC_CPUFREQ=m
# CONFIG_X86_AMD_PSTATE is not set
# CONFIG_X86_ACPI_CPUFREQ is not set
# CONFIG_X86_SPEEDSTEP_CENTRINO is not set
# CONFIG_X86_P4_CLOCKMOD is not set

#
# shared options
#
# end of CPU Frequency scaling

#
# CPU Idle
#
CONFIG_CPU_IDLE=y
CONFIG_CPU_IDLE_GOV_LADDER=y
# CONFIG_CPU_IDLE_GOV_MENU is not set
CONFIG_CPU_IDLE_GOV_TEO=y
# CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
CONFIG_HALTPOLL_CPUIDLE=y
# end of CPU Idle

CONFIG_INTEL_IDLE=y
# end of Power management and ACPI options

#
# Bus options (PCI etc.)
#
CONFIG_PCI_DIRECT=y
CONFIG_PCI_MMCONFIG=y
CONFIG_PCI_XEN=y
CONFIG_MMCONF_FAM10H=y
# CONFIG_PCI_CNB20LE_QUIRK is not set
# CONFIG_ISA_BUS is not set
# CONFIG_ISA_DMA_API is not set
# end of Bus options (PCI etc.)

#
# Binary Emulations
#
# CONFIG_IA32_EMULATION is not set
# end of Binary Emulations

CONFIG_HAVE_KVM=y
CONFIG_VIRTUALIZATION=y
CONFIG_AS_AVX512=y
CONFIG_AS_SHA1_NI=y
CONFIG_AS_SHA256_NI=y
CONFIG_AS_TPAUSE=y

#
# General architecture-dependent options
#
CONFIG_HOTPLUG_SMT=y
CONFIG_GENERIC_ENTRY=y
CONFIG_KPROBES=y
# CONFIG_JUMP_LABEL is not set
# CONFIG_STATIC_CALL_SELFTEST is not set
CONFIG_OPTPROBES=y
CONFIG_KPROBES_ON_FTRACE=y
CONFIG_UPROBES=y
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_USE_BUILTIN_BSWAP=y
CONFIG_KRETPROBES=y
CONFIG_KRETPROBE_ON_RETHOOK=y
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_OPTPROBES=y
CONFIG_HAVE_KPROBES_ON_FTRACE=y
CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=y
CONFIG_HAVE_FUNCTION_ERROR_INJECTION=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_HAVE_DMA_CONTIGUOUS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAS_FORTIFY_SOURCE=y
CONFIG_ARCH_HAS_SET_MEMORY=y
CONFIG_ARCH_HAS_SET_DIRECT_MAP=y
CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=y
CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=y
CONFIG_ARCH_WANTS_NO_INSTR=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_RSEQ=y
CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=y
CONFIG_HAVE_HW_BREAKPOINT=y
CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=y
CONFIG_HAVE_USER_RETURN_NOTIFIER=y
CONFIG_HAVE_PERF_EVENTS_NMI=y
CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=y
CONFIG_HAVE_PERF_REGS=y
CONFIG_HAVE_PERF_USER_STACK_DUMP=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=y
CONFIG_MMU_GATHER_TABLE_FREE=y
CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_ALIGNED_STRUCT_PAGE=y
CONFIG_HAVE_CMPXCHG_LOCAL=y
CONFIG_HAVE_CMPXCHG_DOUBLE=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_HAVE_ARCH_SECCOMP_FILTER=y
CONFIG_SECCOMP=y
CONFIG_SECCOMP_FILTER=y
# CONFIG_SECCOMP_CACHE_DEBUG is not set
CONFIG_HAVE_ARCH_STACKLEAK=y
CONFIG_HAVE_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR=y
CONFIG_STACKPROTECTOR_STRONG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG=y
CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_CONTEXT_TRACKING_USER_OFFSTACK=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_MOVE_PUD=y
CONFIG_HAVE_MOVE_PMD=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=y
CONFIG_HAVE_ARCH_HUGE_VMAP=y
CONFIG_HAVE_ARCH_HUGE_VMALLOC=y
CONFIG_ARCH_WANT_HUGE_PMD_SHARE=y
CONFIG_HAVE_ARCH_SOFT_DIRTY=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ARCH_HAS_ELF_RANDOMIZE=y
CONFIG_HAVE_ARCH_MMAP_RND_BITS=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_ARCH_MMAP_RND_BITS=28
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_HAVE_OBJTOOL=y
CONFIG_HAVE_JUMP_LABEL_HACK=y
CONFIG_HAVE_NOINSTR_HACK=y
CONFIG_HAVE_NOINSTR_VALIDATION=y
CONFIG_HAVE_UACCESS_VALIDATION=y
CONFIG_HAVE_STACK_VALIDATION=y
CONFIG_HAVE_RELIABLE_STACKTRACE=y
CONFIG_ISA_BUS_API=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_HAVE_ARCH_VMAP_STACK=y
CONFIG_VMAP_STACK=y
CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=y
CONFIG_RANDOMIZE_KSTACK_OFFSET=y
# CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=y
CONFIG_STRICT_KERNEL_RWX=y
CONFIG_ARCH_HAS_STRICT_MODULE_RWX=y
CONFIG_STRICT_MODULE_RWX=y
CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=y
CONFIG_ARCH_USE_MEMREMAP_PROT=y
# CONFIG_LOCK_EVENT_COUNTS is not set
CONFIG_ARCH_HAS_MEM_ENCRYPT=y
CONFIG_ARCH_HAS_CC_PLATFORM=y
CONFIG_HAVE_STATIC_CALL=y
CONFIG_HAVE_STATIC_CALL_INLINE=y
CONFIG_HAVE_PREEMPT_DYNAMIC=y
CONFIG_HAVE_PREEMPT_DYNAMIC_CALL=y
CONFIG_ARCH_WANT_LD_ORPHAN_WARN=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y
CONFIG_ARCH_SUPPORTS_PAGE_TABLE_CHECK=y
CONFIG_ARCH_HAS_ELFCORE_COMPAT=y
CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=y
CONFIG_DYNAMIC_SIGFRAME=y
CONFIG_HAVE_ARCH_NODE_DEV_GROUP=y
CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
# end of GCOV-based kernel profiling

CONFIG_HAVE_GCC_PLUGINS=y
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODULE_UNLOAD_TAINT_TRACKING is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_TRIM_UNUSED_KSYMS=y
CONFIG_UNUSED_KSYMS_WHITELIST=""
CONFIG_MODULES_TREE_LOOKUP=y
# CONFIG_BLOCK is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_QUEUED_RWLOCKS=y
CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=y
CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=y
CONFIG_ARCH_HAS_SYSCALL_WRAPPER=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB is not set
CONFIG_SLAB_MERGE_DEFAULT=y
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# CONFIG_SLUB_STATS is not set
CONFIG_SLUB_CPU_PARTIAL=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
CONFIG_SPARSEMEM_VMEMMAP=y
CONFIG_HAVE_FAST_GUP=y
CONFIG_NUMA_KEEP_MEMINFO=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=y
CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=y
CONFIG_MEMORY_HOTPLUG=y
# CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
# CONFIG_MEMORY_HOTREMOVE is not set
CONFIG_MHP_MEMMAP_ON_MEMORY=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=y
CONFIG_MEMORY_BALLOON=y
# CONFIG_BALLOON_COMPACTION is not set
CONFIG_COMPACTION=y
CONFIG_PAGE_REPORTING=y
CONFIG_MIGRATION=y
CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=y
CONFIG_ARCH_ENABLE_THP_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_MMU_NOTIFIER=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=y
# CONFIG_MEMORY_FAILURE is not set
CONFIG_ARCH_WANT_GENERAL_HUGETLB=y
CONFIG_ARCH_WANTS_THP_SWAP=y
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_READ_ONLY_THP_FOR_FS=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_USE_PERCPU_NUMA_NODE_ID=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=19
CONFIG_GENERIC_EARLY_IOREMAP=y
# CONFIG_DEFERRED_STRUCT_PAGE_INIT is not set
CONFIG_PAGE_IDLE_FLAG=y
CONFIG_IDLE_PAGE_TRACKING=y
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ARCH_HAS_PTE_DEVMAP=y
CONFIG_ARCH_HAS_ZONE_DMA_SET=y
# CONFIG_ZONE_DMA is not set
CONFIG_ZONE_DMA32=y
CONFIG_GET_FREE_REGION=y
CONFIG_VMAP_PFN=y
# CONFIG_VM_EVENT_COUNTERS is not set
CONFIG_PERCPU_STATS=y
# CONFIG_GUP_TEST is not set
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_MAPPING_DIRTY_HELPERS=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_HAVE_ARCH_USERFAULTFD_WP=y
CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y
# CONFIG_PTE_MARKER_UFFD_WP is not set
CONFIG_LRU_GEN=y
# CONFIG_LRU_GEN_ENABLED is not set
CONFIG_LRU_GEN_STATS=y

#
# Data Access Monitoring
#
CONFIG_DAMON=y
CONFIG_DAMON_VADDR=y
CONFIG_DAMON_PADDR=y
CONFIG_DAMON_SYSFS=y
CONFIG_DAMON_DBGFS=y
CONFIG_DAMON_RECLAIM=y
CONFIG_DAMON_LRU_SORT=y
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_TLS is not set
CONFIG_XFRM=y
CONFIG_XFRM_ALGO=m
# CONFIG_XFRM_USER is not set
CONFIG_XFRM_INTERFACE=m
# CONFIG_XFRM_SUB_POLICY is not set
# CONFIG_XFRM_MIGRATE is not set
# CONFIG_XFRM_STATISTICS is not set
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=m
# CONFIG_NET_KEY is not set
CONFIG_XFRM_ESPINTCP=y
CONFIG_SMC=m
CONFIG_SMC_DIAG=m
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=m
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
# CONFIG_IP_ADVANCED_ROUTER is not set
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
# CONFIG_IP_PNP_RARP is not set
CONFIG_NET_IPIP=y
CONFIG_NET_IPGRE_DEMUX=m
CONFIG_NET_IP_TUNNEL=y
# CONFIG_NET_IPGRE is not set
CONFIG_IP_MROUTE_COMMON=y
# CONFIG_IP_MROUTE is not set
# CONFIG_SYN_COOKIES is not set
# CONFIG_NET_IPVTI is not set
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=y
CONFIG_NET_FOU_IP_TUNNELS=y
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
CONFIG_INET_IPCOMP=m
CONFIG_INET_XFRM_TUNNEL=m
CONFIG_INET_TUNNEL=y
CONFIG_INET_DIAG=m
CONFIG_INET_TCP_DIAG=m
CONFIG_INET_UDP_DIAG=m
CONFIG_INET_RAW_DIAG=m
# CONFIG_INET_DIAG_DESTROY is not set
CONFIG_TCP_CONG_ADVANCED=y
# CONFIG_TCP_CONG_BIC is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_TCP_CONG_WESTWOOD=m
# CONFIG_TCP_CONG_HTCP is not set
CONFIG_TCP_CONG_HSTCP=m
# CONFIG_TCP_CONG_HYBLA is not set
CONFIG_TCP_CONG_VEGAS=y
# CONFIG_TCP_CONG_NV is not set
CONFIG_TCP_CONG_SCALABLE=m
# CONFIG_TCP_CONG_LP is not set
CONFIG_TCP_CONG_VENO=y
CONFIG_TCP_CONG_YEAH=y
CONFIG_TCP_CONG_ILLINOIS=y
CONFIG_TCP_CONG_DCTCP=m
# CONFIG_TCP_CONG_CDG is not set
# CONFIG_TCP_CONG_BBR is not set
# CONFIG_DEFAULT_CUBIC is not set
CONFIG_DEFAULT_VEGAS=y
# CONFIG_DEFAULT_VENO is not set
# CONFIG_DEFAULT_RENO is not set
CONFIG_DEFAULT_TCP_CONG="vegas"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=m
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_IPV6_ROUTE_INFO=y
# CONFIG_IPV6_OPTIMISTIC_DAD is not set
# CONFIG_INET6_AH is not set
CONFIG_INET6_ESP=m
# CONFIG_INET6_ESP_OFFLOAD is not set
CONFIG_INET6_ESPINTCP=y
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_MIP6=m
CONFIG_INET6_XFRM_TUNNEL=m
CONFIG_INET6_TUNNEL=m
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=m
CONFIG_IPV6_GRE=m
CONFIG_IPV6_FOU=m
CONFIG_IPV6_FOU_TUNNEL=m
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
CONFIG_IPV6_MROUTE=y
CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=y
# CONFIG_IPV6_PIMSM_V2 is not set
CONFIG_IPV6_SEG6_LWTUNNEL=y
CONFIG_IPV6_SEG6_HMAC=y
# CONFIG_IPV6_RPL_LWTUNNEL is not set
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
CONFIG_NETLABEL=y
CONFIG_MPTCP=y
CONFIG_INET_MPTCP_DIAG=m
CONFIG_NETWORK_SECMARK=y
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
# CONFIG_NETFILTER is not set
CONFIG_BPFILTER=y
# CONFIG_BPFILTER_UMH is not set
CONFIG_IP_DCCP=y
CONFIG_INET_DCCP_DIAG=m

#
# DCCP CCIDs Configuration
#
# CONFIG_IP_DCCP_CCID2_DEBUG is not set
CONFIG_IP_DCCP_CCID3=y
CONFIG_IP_DCCP_CCID3_DEBUG=y
CONFIG_IP_DCCP_TFRC_LIB=y
CONFIG_IP_DCCP_TFRC_DEBUG=y
# end of DCCP CCIDs Configuration

#
# DCCP Kernel Hacking
#
CONFIG_IP_DCCP_DEBUG=y
# end of DCCP Kernel Hacking

CONFIG_IP_SCTP=m
# CONFIG_SCTP_DBG_OBJCNT is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
CONFIG_SCTP_COOKIE_HMAC_MD5=y
CONFIG_SCTP_COOKIE_HMAC_SHA1=y
CONFIG_INET_SCTP_DIAG=m
# CONFIG_RDS is not set
CONFIG_TIPC=m
CONFIG_TIPC_MEDIA_UDP=y
CONFIG_TIPC_CRYPTO=y
CONFIG_TIPC_DIAG=m
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
CONFIG_ATM_CLIP_NO_ICMP=y
CONFIG_ATM_LANE=m
CONFIG_ATM_MPOA=m
# CONFIG_ATM_BR2684 is not set
CONFIG_L2TP=m
CONFIG_L2TP_DEBUGFS=m
CONFIG_L2TP_V3=y
# CONFIG_L2TP_IP is not set
# CONFIG_L2TP_ETH is not set
CONFIG_STP=m
CONFIG_MRP=y
CONFIG_BRIDGE=m
CONFIG_BRIDGE_IGMP_SNOOPING=y
# CONFIG_BRIDGE_VLAN_FILTERING is not set
CONFIG_BRIDGE_MRP=y
# CONFIG_BRIDGE_CFM is not set
# CONFIG_NET_DSA is not set
CONFIG_VLAN_8021Q=y
# CONFIG_VLAN_8021Q_GVRP is not set
CONFIG_VLAN_8021Q_MVRP=y
# CONFIG_DECNET is not set
CONFIG_LLC=m
CONFIG_LLC2=m
CONFIG_ATALK=m
CONFIG_DEV_APPLETALK=m
CONFIG_IPDDP=m
# CONFIG_IPDDP_ENCAP is not set
CONFIG_X25=y
CONFIG_LAPB=y
# CONFIG_PHONET is not set
# CONFIG_6LOWPAN is not set
CONFIG_IEEE802154=y
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
# CONFIG_IEEE802154_SOCKET is not set
CONFIG_MAC802154=m
CONFIG_NET_SCHED=y

#
# Queueing/Scheduling
#
CONFIG_NET_SCH_CBQ=m
# CONFIG_NET_SCH_HTB is not set
# CONFIG_NET_SCH_HFSC is not set
# CONFIG_NET_SCH_ATM is not set
# CONFIG_NET_SCH_PRIO is not set
CONFIG_NET_SCH_MULTIQ=y
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFB=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=y
# CONFIG_NET_SCH_TBF is not set
CONFIG_NET_SCH_CBS=m
# CONFIG_NET_SCH_ETF is not set
# CONFIG_NET_SCH_TAPRIO is not set
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=y
CONFIG_NET_SCH_NETEM=y
# CONFIG_NET_SCH_DRR is not set
CONFIG_NET_SCH_MQPRIO=y
# CONFIG_NET_SCH_SKBPRIO is not set
CONFIG_NET_SCH_CHOKE=y
CONFIG_NET_SCH_QFQ=m
# CONFIG_NET_SCH_CODEL is not set
CONFIG_NET_SCH_FQ_CODEL=y
CONFIG_NET_SCH_CAKE=y
CONFIG_NET_SCH_FQ=y
CONFIG_NET_SCH_HHF=y
CONFIG_NET_SCH_PIE=y
CONFIG_NET_SCH_FQ_PIE=y
# CONFIG_NET_SCH_INGRESS is not set
CONFIG_NET_SCH_PLUG=y
# CONFIG_NET_SCH_ETS is not set
# CONFIG_NET_SCH_DEFAULT is not set

#
# Classification
#
CONFIG_NET_CLS=y
# CONFIG_NET_CLS_BASIC is not set
CONFIG_NET_CLS_TCINDEX=y
# CONFIG_NET_CLS_ROUTE4 is not set
CONFIG_NET_CLS_FW=m
# CONFIG_NET_CLS_U32 is not set
# CONFIG_NET_CLS_RSVP is not set
CONFIG_NET_CLS_RSVP6=y
CONFIG_NET_CLS_FLOW=y
# CONFIG_NET_CLS_CGROUP is not set
# CONFIG_NET_CLS_BPF is not set
CONFIG_NET_CLS_FLOWER=m
CONFIG_NET_CLS_MATCHALL=y
# CONFIG_NET_EMATCH is not set
CONFIG_NET_CLS_ACT=y
# CONFIG_NET_ACT_POLICE is not set
CONFIG_NET_ACT_GACT=y
CONFIG_GACT_PROB=y
CONFIG_NET_ACT_MIRRED=m
# CONFIG_NET_ACT_SAMPLE is not set
CONFIG_NET_ACT_NAT=y
# CONFIG_NET_ACT_PEDIT is not set
CONFIG_NET_ACT_SIMP=y
CONFIG_NET_ACT_SKBEDIT=m
# CONFIG_NET_ACT_CSUM is not set
CONFIG_NET_ACT_MPLS=y
CONFIG_NET_ACT_VLAN=m
CONFIG_NET_ACT_BPF=m
CONFIG_NET_ACT_SKBMOD=m
# CONFIG_NET_ACT_IFE is not set
CONFIG_NET_ACT_TUNNEL_KEY=y
CONFIG_NET_ACT_GATE=y
CONFIG_NET_TC_SKB_EXT=y
CONFIG_NET_SCH_FIFO=y
CONFIG_DCB=y
CONFIG_DNS_RESOLVER=m
CONFIG_BATMAN_ADV=m
CONFIG_BATMAN_ADV_BATMAN_V=y
CONFIG_BATMAN_ADV_BLA=y
# CONFIG_BATMAN_ADV_DAT is not set
# CONFIG_BATMAN_ADV_NC is not set
CONFIG_BATMAN_ADV_MCAST=y
CONFIG_BATMAN_ADV_DEBUG=y
# CONFIG_BATMAN_ADV_TRACING is not set
CONFIG_OPENVSWITCH=m
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=m
CONFIG_VSOCKETS_LOOPBACK=y
CONFIG_VMWARE_VMCI_VSOCKETS=y
# CONFIG_VIRTIO_VSOCKETS is not set
CONFIG_VIRTIO_VSOCKETS_COMMON=y
# CONFIG_HYPERV_VSOCKETS is not set
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=m
# CONFIG_MPLS_ROUTING is not set
CONFIG_NET_NSH=m
# CONFIG_HSR is not set
# CONFIG_NET_SWITCHDEV is not set
CONFIG_NET_L3_MASTER_DEV=y
CONFIG_QRTR=y
CONFIG_QRTR_TUN=y
CONFIG_NET_NCSI=y
CONFIG_NCSI_OEM_CMD_GET_MAC=y
CONFIG_NCSI_OEM_CMD_KEEP_PHY=y
# CONFIG_PCPU_DEV_REFCNT is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_SOCK_RX_QUEUE_MAPPING=y
CONFIG_XPS=y
# CONFIG_CGROUP_NET_PRIO is not set
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
CONFIG_NET_DROP_MONITOR=m
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_RFCOMM_TTY=y
CONFIG_BT_BNEP=y
CONFIG_BT_BNEP_MC_FILTER=y
CONFIG_BT_BNEP_PROTO_FILTER=y
# CONFIG_BT_HIDP is not set
CONFIG_BT_HS=y
# CONFIG_BT_LE is not set
CONFIG_BT_LEDS=y
CONFIG_BT_MSFTEXT=y
CONFIG_BT_AOSPEXT=y
CONFIG_BT_DEBUGFS=y
# CONFIG_BT_SELFTEST is not set

#
# Bluetooth device drivers
#
CONFIG_BT_RTL=m
CONFIG_BT_MTK=m
CONFIG_BT_HCIUART=m
CONFIG_BT_HCIUART_SERDEV=y
CONFIG_BT_HCIUART_H4=y
# CONFIG_BT_HCIUART_NOKIA is not set
# CONFIG_BT_HCIUART_BCSP is not set
CONFIG_BT_HCIUART_ATH3K=y
# CONFIG_BT_HCIUART_LL is not set
CONFIG_BT_HCIUART_3WIRE=y
# CONFIG_BT_HCIUART_INTEL is not set
CONFIG_BT_HCIUART_RTL=y
# CONFIG_BT_HCIUART_QCA is not set
# CONFIG_BT_HCIUART_AG6XX is not set
CONFIG_BT_HCIUART_MRVL=y
# CONFIG_BT_HCIDTL1 is not set
CONFIG_BT_HCIBT3C=m
# CONFIG_BT_HCIBLUECARD is not set
CONFIG_BT_HCIVHCI=m
CONFIG_BT_MRVL=m
CONFIG_BT_MTKUART=m
CONFIG_BT_VIRTIO=m
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
CONFIG_AF_RXRPC_DEBUG=y
# CONFIG_RXKAD is not set
CONFIG_AF_KCM=m
CONFIG_STREAM_PARSER=y
# CONFIG_MCTP is not set
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
# CONFIG_CFG80211 is not set

#
# CFG80211 needs to be enabled for MAC80211
#
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
# CONFIG_RFKILL is not set
CONFIG_NET_9P=y
CONFIG_NET_9P_FD=m
CONFIG_NET_9P_VIRTIO=y
CONFIG_NET_9P_XEN=m
# CONFIG_NET_9P_RDMA is not set
CONFIG_NET_9P_DEBUG=y
CONFIG_CAIF=m
CONFIG_CAIF_DEBUG=y
# CONFIG_CAIF_NETDEV is not set
CONFIG_CAIF_USB=m
CONFIG_CEPH_LIB=m
CONFIG_CEPH_LIB_PRETTYDEBUG=y
CONFIG_CEPH_LIB_USE_DNS_RESOLVER=y
# CONFIG_NFC is not set
CONFIG_PSAMPLE=m
CONFIG_NET_IFE=y
CONFIG_LWTUNNEL=y
CONFIG_LWTUNNEL_BPF=y
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=m
CONFIG_ETHTOOL_NETLINK=y

#
# Device Drivers
#
CONFIG_HAVE_EISA=y
CONFIG_EISA=y
CONFIG_EISA_VLB_PRIMING=y
# CONFIG_EISA_PCI_EISA is not set
CONFIG_EISA_VIRTUAL_ROOT=y
CONFIG_EISA_NAMES=y
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
# CONFIG_PCIEPORTBUS is not set
# CONFIG_PCIEASPM is not set
# CONFIG_PCIE_PTM is not set
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_IRQ_DOMAIN=y
CONFIG_PCI_QUIRKS=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_STUB is not set
# CONFIG_XEN_PCIDEV_FRONTEND is not set
CONFIG_PCI_ATS=y
CONFIG_PCI_DOE=y
CONFIG_PCI_LOCKLESS_CONFIG=y
# CONFIG_PCI_IOV is not set
CONFIG_PCI_PRI=y
CONFIG_PCI_PASID=y
CONFIG_PCI_LABEL=y
CONFIG_PCI_HYPERV=m
CONFIG_PCIE_BUS_TUNE_OFF=y
# CONFIG_PCIE_BUS_DEFAULT is not set
# CONFIG_PCIE_BUS_SAFE is not set
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
# CONFIG_VGA_ARB is not set
# CONFIG_HOTPLUG_PCI is not set

#
# PCI controller drivers
#
CONFIG_VMD=y
CONFIG_PCI_HYPERV_INTERFACE=m

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
# CONFIG_PCIE_DW_PLAT_HOST is not set
# CONFIG_PCIE_DW_PLAT_EP is not set
CONFIG_PCI_MESON=y
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
CONFIG_PCI_ENDPOINT=y
# CONFIG_PCI_ENDPOINT_CONFIGFS is not set
# CONFIG_PCI_EPF_TEST is not set
CONFIG_PCI_EPF_NTB=y
CONFIG_PCI_EPF_VNTB=m
# end of PCI Endpoint

#
# PCI switch controller drivers
#
CONFIG_PCI_SW_SWITCHTEC=y
# end of PCI switch controller drivers

CONFIG_CXL_BUS=m
# CONFIG_CXL_PCI is not set
# CONFIG_CXL_ACPI is not set
CONFIG_CXL_PORT=m
CONFIG_CXL_REGION=y
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y
# CONFIG_CARDBUS is not set

#
# PC-card bridges
#
# CONFIG_YENTA is not set
# CONFIG_PD6729 is not set
# CONFIG_I82092 is not set
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
# CONFIG_RAPIDIO_DEBUG is not set
CONFIG_RAPIDIO_ENUM_BASIC=m
CONFIG_RAPIDIO_CHMAN=m
# CONFIG_RAPIDIO_MPORT_CDEV is not set

#
# RapidIO Switch drivers
#
CONFIG_RAPIDIO_CPS_XX=y
# CONFIG_RAPIDIO_CPS_GEN2 is not set
# CONFIG_RAPIDIO_RXS_GEN3 is not set
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
# CONFIG_DEVTMPFS_SAFE is not set
# CONFIG_STANDALONE is not set
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_CACHE=y
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_GENERIC_CPU_AUTOPROBE=y
CONFIG_GENERIC_CPU_VULNERABILITIES=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=m
CONFIG_REGMAP_SPMI=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_REGMAP_SOUNDWIRE=m
CONFIG_REGMAP_SOUNDWIRE_MBQ=m
CONFIG_REGMAP_SCCB=m
CONFIG_REGMAP_I3C=m
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_MHI_BUS is not set
CONFIG_MHI_BUS_EP=y
# end of Bus devices

# CONFIG_CONNECTOR is not set

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# end of ARM System Control and Management Interface Protocol

# CONFIG_EDD is not set
CONFIG_FIRMWARE_MEMMAP=y
CONFIG_FW_CFG_SYSFS=m
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
# CONFIG_SYSFB_SIMPLEFB is not set
CONFIG_CS_DSP=m
CONFIG_GOOGLE_FIRMWARE=y
CONFIG_GOOGLE_COREBOOT_TABLE=m
CONFIG_GOOGLE_MEMCONSOLE=m
CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=m
CONFIG_GOOGLE_VPD=m

#
# EFI (Extensible Firmware Interface) Support
#
CONFIG_EFI_ESRT=y
CONFIG_EFI_VARS_PSTORE=y
CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=y
CONFIG_EFI_FAKE_MEMMAP=y
CONFIG_EFI_MAX_FAKE_MEM=8
# CONFIG_EFI_DXE_MEM_ATTRIBUTES is not set
CONFIG_EFI_RUNTIME_WRAPPERS=y
CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=y
CONFIG_EFI_BOOTLOADER_CONTROL=m
CONFIG_EFI_CAPSULE_LOADER=y
# CONFIG_EFI_TEST is not set
CONFIG_EFI_DEV_PATH_PARSER=y
CONFIG_APPLE_PROPERTIES=y
CONFIG_RESET_ATTACK_MITIGATION=y
# CONFIG_EFI_RCI2_TABLE is not set
CONFIG_EFI_DISABLE_PCI_DMA=y
CONFIG_EFI_EARLYCON=y
CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=y
# CONFIG_EFI_DISABLE_RUNTIME is not set
CONFIG_EFI_COCO_SECRET=y
# end of EFI (Extensible Firmware Interface) Support

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
CONFIG_GNSS_UBX_SERIAL=m
# CONFIG_MTD is not set
# CONFIG_OF is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
# CONFIG_PARPORT_PC is not set
CONFIG_PARPORT_AX88796=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_PNP=y
# CONFIG_PNP_DEBUG_MESSAGES is not set

#
# Protocols
#
CONFIG_PNPACPI=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=m
CONFIG_AD525X_DPOT=m
CONFIG_AD525X_DPOT_I2C=m
CONFIG_DUMMY_IRQ=m
CONFIG_IBM_ASM=y
# CONFIG_PHANTOM is not set
# CONFIG_TIFM_CORE is not set
CONFIG_ICS932S401=m
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_HP_ILO=m
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=m
CONFIG_ISL29020=m
CONFIG_SENSORS_TSL2550=m
# CONFIG_SENSORS_BH1770 is not set
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=m
# CONFIG_DS1682 is not set
CONFIG_VMWARE_BALLOON=y
# CONFIG_SRAM is not set
CONFIG_DW_XDATA_PCIE=y
# CONFIG_PCI_ENDPOINT_TEST is not set
CONFIG_XILINX_SDFEC=m
CONFIG_MISC_RTSX=y
CONFIG_C2PORT=m
# CONFIG_C2PORT_DURAMAR_2150 is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_LEGACY=m
CONFIG_EEPROM_MAX6875=m
CONFIG_EEPROM_93CX6=y
CONFIG_EEPROM_IDT_89HPESX=m
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
CONFIG_TI_ST=y
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set

#
# Altera FPGA firmware download module (requires I2C)
#
# CONFIG_ALTERA_STAPL is not set
CONFIG_INTEL_MEI=y
CONFIG_INTEL_MEI_ME=y
CONFIG_INTEL_MEI_TXE=y
CONFIG_VMWARE_VMCI=y
CONFIG_GENWQE=m
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
# CONFIG_ECHO is not set
CONFIG_BCM_VK=m
CONFIG_BCM_VK_TTY=y
CONFIG_MISC_ALCOR_PCI=m
CONFIG_MISC_RTSX_PCI=y
CONFIG_HABANA_AI=y
# CONFIG_UACCE is not set
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# end of SCSI device support

# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

# CONFIG_MACINTOSH_DRIVERS is not set
CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_WIREGUARD is not set
# CONFIG_EQUALIZER is not set
# CONFIG_IFB is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_IPVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
# CONFIG_BAREUDP is not set
# CONFIG_GTP is not set
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_RIONET is not set
# CONFIG_TUN is not set
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set
CONFIG_ATM_DRIVERS=y
# CONFIG_ATM_DUMMY is not set
# CONFIG_ATM_TCP is not set
# CONFIG_ATM_LANAI is not set
# CONFIG_ATM_ENI is not set
# CONFIG_ATM_NICSTAR is not set
# CONFIG_ATM_IDT77252 is not set
# CONFIG_ATM_IA is not set
# CONFIG_ATM_FORE200E is not set
# CONFIG_ATM_HE is not set
# CONFIG_ATM_SOLOS is not set
# CONFIG_CAIF_DRIVERS is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
# CONFIG_EL3 is not set
# CONFIG_PCMCIA_3C574 is not set
# CONFIG_PCMCIA_3C589 is not set
# CONFIG_VORTEX is not set
# CONFIG_TYPHOON is not set
CONFIG_NET_VENDOR_ADAPTEC=y
# CONFIG_ADAPTEC_STARFIRE is not set
CONFIG_NET_VENDOR_AGERE=y
# CONFIG_ET131X is not set
CONFIG_NET_VENDOR_ALACRITECH=y
# CONFIG_SLICOSS is not set
CONFIG_NET_VENDOR_ALTEON=y
# CONFIG_ACENIC is not set
# CONFIG_ALTERA_TSE is not set
CONFIG_NET_VENDOR_AMAZON=y
# CONFIG_ENA_ETHERNET is not set
# CONFIG_NET_VENDOR_AMD is not set
CONFIG_NET_VENDOR_AQUANTIA=y
# CONFIG_AQTION is not set
CONFIG_NET_VENDOR_ARC=y
CONFIG_NET_VENDOR_ASIX=y
CONFIG_NET_VENDOR_ATHEROS=y
# CONFIG_ATL2 is not set
# CONFIG_ATL1 is not set
# CONFIG_ATL1E is not set
# CONFIG_ATL1C is not set
# CONFIG_ALX is not set
# CONFIG_CX_ECAT is not set
CONFIG_NET_VENDOR_BROADCOM=y
# CONFIG_B44 is not set
# CONFIG_BCMGENET is not set
# CONFIG_BNX2 is not set
# CONFIG_CNIC is not set
# CONFIG_TIGON3 is not set
# CONFIG_BNX2X is not set
# CONFIG_SYSTEMPORT is not set
# CONFIG_BNXT is not set
CONFIG_NET_VENDOR_CADENCE=y
# CONFIG_MACB is not set
CONFIG_NET_VENDOR_CAVIUM=y
# CONFIG_THUNDER_NIC_PF is not set
# CONFIG_THUNDER_NIC_VF is not set
# CONFIG_THUNDER_NIC_BGX is not set
# CONFIG_THUNDER_NIC_RGX is not set
# CONFIG_CAVIUM_PTP is not set
# CONFIG_LIQUIDIO is not set
# CONFIG_LIQUIDIO_VF is not set
CONFIG_NET_VENDOR_CHELSIO=y
# CONFIG_CHELSIO_T1 is not set
# CONFIG_CHELSIO_T3 is not set
# CONFIG_CHELSIO_T4 is not set
# CONFIG_CHELSIO_T4VF is not set
CONFIG_NET_VENDOR_CIRRUS=y
CONFIG_NET_VENDOR_CISCO=y
# CONFIG_ENIC is not set
CONFIG_NET_VENDOR_CORTINA=y
CONFIG_NET_VENDOR_DAVICOM=y
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
# CONFIG_NET_TULIP is not set
CONFIG_NET_VENDOR_DLINK=y
# CONFIG_DL2K is not set
# CONFIG_SUNDANCE is not set
CONFIG_NET_VENDOR_EMULEX=y
# CONFIG_BE2NET is not set
CONFIG_NET_VENDOR_ENGLEDER=y
# CONFIG_TSNEP is not set
CONFIG_NET_VENDOR_EZCHIP=y
CONFIG_NET_VENDOR_FUJITSU=y
# CONFIG_PCMCIA_FMVJ18X is not set
CONFIG_NET_VENDOR_FUNGIBLE=y
# CONFIG_FUN_ETH is not set
CONFIG_NET_VENDOR_GOOGLE=y
# CONFIG_GVE is not set
CONFIG_NET_VENDOR_HUAWEI=y
# CONFIG_HINIC is not set
CONFIG_NET_VENDOR_I825XX=y
CONFIG_NET_VENDOR_INTEL=y
# CONFIG_E100 is not set
CONFIG_E1000=y
# CONFIG_E1000E is not set
# CONFIG_IGB is not set
# CONFIG_IGBVF is not set
# CONFIG_IXGB is not set
# CONFIG_IXGBE is not set
# CONFIG_IXGBEVF is not set
# CONFIG_I40E is not set
# CONFIG_I40EVF is not set
# CONFIG_ICE is not set
# CONFIG_FM10K is not set
# CONFIG_IGC is not set
CONFIG_NET_VENDOR_WANGXUN=y
# CONFIG_TXGBE is not set
# CONFIG_JME is not set
CONFIG_NET_VENDOR_LITEX=y
CONFIG_NET_VENDOR_MARVELL=y
# CONFIG_MVMDIO is not set
# CONFIG_SKGE is not set
# CONFIG_SKY2 is not set
# CONFIG_OCTEON_EP is not set
CONFIG_NET_VENDOR_MELLANOX=y
# CONFIG_MLX4_EN is not set
# CONFIG_MLX5_CORE is not set
# CONFIG_MLXSW_CORE is not set
# CONFIG_MLXFW is not set
CONFIG_NET_VENDOR_MICREL=y
# CONFIG_KS8851_MLL is not set
# CONFIG_KSZ884X_PCI is not set
CONFIG_NET_VENDOR_MICROCHIP=y
# CONFIG_LAN743X is not set
CONFIG_NET_VENDOR_MICROSEMI=y
CONFIG_NET_VENDOR_MICROSOFT=y
# CONFIG_MICROSOFT_MANA is not set
CONFIG_NET_VENDOR_MYRI=y
# CONFIG_MYRI10GE is not set
# CONFIG_FEALNX is not set
CONFIG_NET_VENDOR_NI=y
# CONFIG_NI_XGE_MANAGEMENT_ENET is not set
CONFIG_NET_VENDOR_NATSEMI=y
# CONFIG_NATSEMI is not set
# CONFIG_NS83820 is not set
CONFIG_NET_VENDOR_NETERION=y
# CONFIG_S2IO is not set
CONFIG_NET_VENDOR_NETRONOME=y
# CONFIG_NFP is not set
CONFIG_NET_VENDOR_8390=y
# CONFIG_PCMCIA_AXNET is not set
# CONFIG_NE2K_PCI is not set
# CONFIG_PCMCIA_PCNET is not set
CONFIG_NET_VENDOR_NVIDIA=y
# CONFIG_FORCEDETH is not set
CONFIG_NET_VENDOR_OKI=y
# CONFIG_ETHOC is not set
CONFIG_NET_VENDOR_PACKET_ENGINES=y
# CONFIG_HAMACHI is not set
# CONFIG_YELLOWFIN is not set
CONFIG_NET_VENDOR_PENSANDO=y
# CONFIG_IONIC is not set
CONFIG_NET_VENDOR_QLOGIC=y
# CONFIG_QLA3XXX is not set
# CONFIG_QLCNIC is not set
# CONFIG_NETXEN_NIC is not set
# CONFIG_QED is not set
CONFIG_NET_VENDOR_BROCADE=y
# CONFIG_BNA is not set
CONFIG_NET_VENDOR_QUALCOMM=y
# CONFIG_QCOM_EMAC is not set
# CONFIG_RMNET is not set
CONFIG_NET_VENDOR_RDC=y
# CONFIG_R6040 is not set
CONFIG_NET_VENDOR_REALTEK=y
# CONFIG_ATP is not set
# CONFIG_8139CP is not set
# CONFIG_8139TOO is not set
# CONFIG_R8169 is not set
CONFIG_NET_VENDOR_RENESAS=y
CONFIG_NET_VENDOR_ROCKER=y
CONFIG_NET_VENDOR_SAMSUNG=y
# CONFIG_SXGBE_ETH is not set
CONFIG_NET_VENDOR_SEEQ=y
CONFIG_NET_VENDOR_SILAN=y
# CONFIG_SC92031 is not set
CONFIG_NET_VENDOR_SIS=y
# CONFIG_SIS900 is not set
# CONFIG_SIS190 is not set
CONFIG_NET_VENDOR_SOLARFLARE=y
# CONFIG_SFC is not set
# CONFIG_SFC_FALCON is not set
# CONFIG_SFC_SIENA is not set
CONFIG_NET_VENDOR_SMSC=y
# CONFIG_PCMCIA_SMC91C92 is not set
# CONFIG_EPIC100 is not set
# CONFIG_SMSC911X is not set
# CONFIG_SMSC9420 is not set
CONFIG_NET_VENDOR_SOCIONEXT=y
CONFIG_NET_VENDOR_STMICRO=y
# CONFIG_STMMAC_ETH is not set
CONFIG_NET_VENDOR_SUN=y
# CONFIG_HAPPYMEAL is not set
# CONFIG_SUNGEM is not set
# CONFIG_CASSINI is not set
# CONFIG_NIU is not set
CONFIG_NET_VENDOR_SYNOPSYS=y
# CONFIG_DWC_XLGMAC is not set
CONFIG_NET_VENDOR_TEHUTI=y
# CONFIG_TEHUTI is not set
CONFIG_NET_VENDOR_TI=y
# CONFIG_TI_CPSW_PHY_SEL is not set
# CONFIG_TLAN is not set
CONFIG_NET_VENDOR_VERTEXCOM=y
CONFIG_NET_VENDOR_VIA=y
# CONFIG_VIA_RHINE is not set
# CONFIG_VIA_VELOCITY is not set
CONFIG_NET_VENDOR_WIZNET=y
# CONFIG_WIZNET_W5100 is not set
# CONFIG_WIZNET_W5300 is not set
CONFIG_NET_VENDOR_XILINX=y
# CONFIG_XILINX_EMACLITE is not set
# CONFIG_XILINX_AXI_EMAC is not set
# CONFIG_XILINX_LL_TEMAC is not set
CONFIG_NET_VENDOR_XIRCOM=y
# CONFIG_PCMCIA_XIRC2PS is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_NET_SB1000 is not set
# CONFIG_PHYLIB is not set
# CONFIG_MDIO_DEVICE is not set

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
CONFIG_WLAN_VENDOR_ATH=y
# CONFIG_ATH_DEBUG is not set
# CONFIG_ATH5K_PCI is not set
CONFIG_WLAN_VENDOR_ATMEL=y
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_WLAN_VENDOR_CISCO=y
CONFIG_WLAN_VENDOR_INTEL=y
CONFIG_WLAN_VENDOR_INTERSIL=y
# CONFIG_HOSTAP is not set
CONFIG_WLAN_VENDOR_MARVELL=y
CONFIG_WLAN_VENDOR_MEDIATEK=y
CONFIG_WLAN_VENDOR_MICROCHIP=y
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_WLAN_VENDOR_REALTEK=y
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WLAN_VENDOR_ST=y
CONFIG_WLAN_VENDOR_TI=y
CONFIG_WLAN_VENDOR_ZYDAS=y
CONFIG_WLAN_VENDOR_QUANTENNA=y
# CONFIG_PCMCIA_RAYCS is not set
# CONFIG_WAN is not set
CONFIG_IEEE802154_DRIVERS=y
# CONFIG_IEEE802154_FAKELB is not set
# CONFIG_IEEE802154_HWSIM is not set

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

CONFIG_XEN_NETDEV_FRONTEND=y
# CONFIG_VMXNET3 is not set
# CONFIG_FUJITSU_ES is not set
# CONFIG_HYPERV_NET is not set
# CONFIG_NETDEVSIM is not set
CONFIG_NET_FAILOVER=m
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_LEDS=m
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=m
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=m
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=m
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=y
CONFIG_KEYBOARD_QT1050=m
CONFIG_KEYBOARD_QT1070=m
CONFIG_KEYBOARD_QT2160=m
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=y
CONFIG_KEYBOARD_GPIO=m
CONFIG_KEYBOARD_GPIO_POLLED=y
# CONFIG_KEYBOARD_TCA6416 is not set
CONFIG_KEYBOARD_TCA8418=m
CONFIG_KEYBOARD_MATRIX=m
# CONFIG_KEYBOARD_LM8323 is not set
CONFIG_KEYBOARD_LM8333=m
CONFIG_KEYBOARD_MAX7359=m
CONFIG_KEYBOARD_MCS=m
CONFIG_KEYBOARD_MPR121=m
# CONFIG_KEYBOARD_NEWTON is not set
CONFIG_KEYBOARD_OPENCORES=m
CONFIG_KEYBOARD_SAMSUNG=m
CONFIG_KEYBOARD_STOWAWAY=y
CONFIG_KEYBOARD_SUNKBD=y
# CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
CONFIG_KEYBOARD_XTKBD=m
CONFIG_KEYBOARD_MTK_PMIC=m
# CONFIG_KEYBOARD_CYPRESS_SF is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=y
CONFIG_MOUSE_PS2_ALPS=y
# CONFIG_MOUSE_PS2_BYD is not set
# CONFIG_MOUSE_PS2_LOGIPS2PP is not set
CONFIG_MOUSE_PS2_SYNAPTICS=y
CONFIG_MOUSE_PS2_CYPRESS=y
# CONFIG_MOUSE_PS2_TRACKPOINT is not set
# CONFIG_MOUSE_PS2_ELANTECH is not set
CONFIG_MOUSE_PS2_SENTELIC=y
CONFIG_MOUSE_PS2_TOUCHKIT=y
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_VMMOUSE=y
CONFIG_MOUSE_SERIAL=m
# CONFIG_MOUSE_APPLETOUCH is not set
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=m
# CONFIG_MOUSE_ELAN_I2C is not set
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=y
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_MOUSE_SYNAPTICS_USB is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_I2C is not set
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
# CONFIG_RMI4_F11 is not set
# CONFIG_RMI4_F12 is not set
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F54=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
CONFIG_SERIO_SERPORT=y
CONFIG_SERIO_CT82C710=m
CONFIG_SERIO_PARKBD=m
CONFIG_SERIO_PCIPS2=y
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
CONFIG_SERIO_ALTERA_PS2=m
# CONFIG_SERIO_PS2MULT is not set
CONFIG_SERIO_ARC_PS2=m
# CONFIG_HYPERV_KEYBOARD is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=m
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=m
CONFIG_GAMEPORT_EMU10K1=m
CONFIG_GAMEPORT_FM801=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
# CONFIG_LDISC_AUTOLOAD is not set

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_PNP=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
# CONFIG_SERIAL_8250_EXAR is not set
CONFIG_SERIAL_8250_CS=m
CONFIG_SERIAL_8250_MEN_MCB=m
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
CONFIG_SERIAL_8250_DWLIB=y
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_RT288X is not set
CONFIG_SERIAL_8250_LPSS=m
CONFIG_SERIAL_8250_MID=m
CONFIG_SERIAL_8250_PERICOM=y

#
# Non-8250 serial port support
#
CONFIG_SERIAL_UARTLITE=m
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
CONFIG_SERIAL_JSM=m
CONFIG_SERIAL_LANTIQ=m
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
# CONFIG_SERIAL_SC16IS7XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE=y
CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE_BYPASS=y
# CONFIG_SERIAL_ALTERA_UART is not set
CONFIG_SERIAL_ARC=y
CONFIG_SERIAL_ARC_CONSOLE=y
CONFIG_SERIAL_ARC_NR_PORTS=1
CONFIG_SERIAL_RP2=y
CONFIG_SERIAL_RP2_NR_UARTS=32
CONFIG_SERIAL_FSL_LPUART=y
# CONFIG_SERIAL_FSL_LPUART_CONSOLE is not set
# CONFIG_SERIAL_FSL_LINFLEXUART is not set
CONFIG_SERIAL_MEN_Z135=m
# CONFIG_SERIAL_SPRD is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_N_GSM is not set
# CONFIG_NOZOMI is not set
CONFIG_NULL_TTY=m
CONFIG_HVC_DRIVER=y
CONFIG_HVC_IRQ=y
CONFIG_HVC_XEN=y
# CONFIG_HVC_XEN_FRONTEND is not set
CONFIG_SERIAL_DEV_BUS=m
# CONFIG_TTY_PRINTK is not set
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=m
CONFIG_VIRTIO_CONSOLE=y
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
# CONFIG_IPMI_PANIC_EVENT is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=m
# CONFIG_IPMI_WATCHDOG is not set
CONFIG_IPMI_POWEROFF=m
CONFIG_IPMB_DEVICE_INTERFACE=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_INTEL=m
# CONFIG_HW_RANDOM_AMD is not set
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_VIA=y
CONFIG_HW_RANDOM_VIRTIO=m
CONFIG_HW_RANDOM_XIPHERA=m
CONFIG_APPLICOM=y

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=m
CONFIG_CARDMAN_4000=m
# CONFIG_CARDMAN_4040 is not set
# CONFIG_SCR24X is not set
# CONFIG_IPWIRELESS is not set
# end of PCMCIA character devices

CONFIG_MWAVE=y
CONFIG_DEVMEM=y
CONFIG_NVRAM=y
CONFIG_DEVPORT=y
# CONFIG_HPET is not set
# CONFIG_HANGCHECK_TIMER is not set
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
# CONFIG_TCG_TIS_I2C is not set
# CONFIG_TCG_TIS_I2C_CR50 is not set
CONFIG_TCG_TIS_I2C_ATMEL=m
CONFIG_TCG_TIS_I2C_INFINEON=m
CONFIG_TCG_TIS_I2C_NUVOTON=m
CONFIG_TCG_NSC=m
# CONFIG_TCG_ATMEL is not set
CONFIG_TCG_INFINEON=m
CONFIG_TCG_XEN=y
CONFIG_TCG_CRB=y
CONFIG_TCG_VTPM_PROXY=m
CONFIG_TCG_TIS_ST33ZP24=m
CONFIG_TCG_TIS_ST33ZP24_I2C=m
# CONFIG_TELCLOCK is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_PCIE=y
# CONFIG_RANDOM_TRUST_CPU is not set
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=m
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=m
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
# CONFIG_I2C_MUX_GPIO is not set
CONFIG_I2C_MUX_LTC4306=m
CONFIG_I2C_MUX_PCA9541=m
CONFIG_I2C_MUX_PCA954x=m
CONFIG_I2C_MUX_REG=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=m

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=m
# CONFIG_I2C_ALGOPCF is not set
CONFIG_I2C_ALGOPCA=m
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_ALI1535=m
CONFIG_I2C_ALI1563=m
CONFIG_I2C_ALI15X3=m
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_AMD_MP2 is not set
CONFIG_I2C_I801=m
# CONFIG_I2C_ISCH is not set
CONFIG_I2C_ISMT=m
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_NVIDIA_GPU is not set
CONFIG_I2C_SIS5595=m
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
# CONFIG_I2C_VIA is not set
CONFIG_I2C_VIAPRO=m

#
# ACPI drivers
#
CONFIG_I2C_SCMI=m

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DESIGNWARE_CORE=m
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=m
# CONFIG_I2C_DESIGNWARE_BAYTRAIL is not set
# CONFIG_I2C_DESIGNWARE_PCI is not set
CONFIG_I2C_EMEV2=m
CONFIG_I2C_GPIO=m
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
CONFIG_I2C_KEMPLD=m
# CONFIG_I2C_OCORES is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_SIMTEC=m
CONFIG_I2C_XILINX=m

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_PARPORT=m
CONFIG_I2C_TAOS_EVM=m

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=m
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

CONFIG_I3C=m
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=m
CONFIG_SVC_I3C_MASTER=m
# CONFIG_MIPI_I3C_HCI is not set
# CONFIG_SPI is not set
CONFIG_SPMI=m
CONFIG_SPMI_HISI3670=m
# CONFIG_HSI is not set
CONFIG_PPS=m
# CONFIG_PPS_DEBUG is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
# CONFIG_PPS_CLIENT_LDISC is not set
CONFIG_PPS_CLIENT_PARPORT=m
# CONFIG_PPS_CLIENT_GPIO is not set

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=m
CONFIG_PTP_1588_CLOCK_OPTIONAL=m

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_PTP_1588_CLOCK_KVM=m
# CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
CONFIG_PTP_1588_CLOCK_IDTCM=m
# CONFIG_PTP_1588_CLOCK_VMW is not set
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_DA9062 is not set
# CONFIG_PINCTRL_MCP23S08 is not set

#
# Intel pinctrl drivers
#
CONFIG_PINCTRL_BAYTRAIL=y
CONFIG_PINCTRL_CHERRYVIEW=m
CONFIG_PINCTRL_LYNXPOINT=y
CONFIG_PINCTRL_INTEL=y
CONFIG_PINCTRL_ALDERLAKE=m
# CONFIG_PINCTRL_BROXTON is not set
CONFIG_PINCTRL_CANNONLAKE=m
# CONFIG_PINCTRL_CEDARFORK is not set
# CONFIG_PINCTRL_DENVERTON is not set
# CONFIG_PINCTRL_ELKHARTLAKE is not set
CONFIG_PINCTRL_EMMITSBURG=y
CONFIG_PINCTRL_GEMINILAKE=y
CONFIG_PINCTRL_ICELAKE=m
CONFIG_PINCTRL_JASPERLAKE=y
CONFIG_PINCTRL_LAKEFIELD=y
# CONFIG_PINCTRL_LEWISBURG is not set
# CONFIG_PINCTRL_METEORLAKE is not set
CONFIG_PINCTRL_SUNRISEPOINT=y
CONFIG_PINCTRL_TIGERLAKE=y
# end of Intel pinctrl drivers

#
# Renesas pinctrl drivers
#
# end of Renesas pinctrl drivers

CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIO_ACPI=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
# CONFIG_GPIO_SYSFS is not set
# CONFIG_GPIO_CDEV is not set
CONFIG_GPIO_GENERIC=m

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_AMDPT is not set
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_GENERIC_PLATFORM=m
CONFIG_GPIO_ICH=m
CONFIG_GPIO_MB86S7X=m
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_VX855=m
CONFIG_GPIO_AMD_FCH=m
# end of Memory mapped GPIO drivers

#
# Port-mapped I/O GPIO drivers
#
# CONFIG_GPIO_F7188X is not set
CONFIG_GPIO_IT87=m
# CONFIG_GPIO_SCH is not set
CONFIG_GPIO_SCH311X=y
CONFIG_GPIO_WINBOND=m
CONFIG_GPIO_WS16C48=m
# end of Port-mapped I/O GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_ADP5588 is not set
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=m
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=m
CONFIG_GPIO_TPIC2810=m
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_LP873X=m
CONFIG_GPIO_TPS65086=m
CONFIG_GPIO_TPS68470=m
CONFIG_GPIO_UCB1400=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
# CONFIG_GPIO_AMD8111 is not set
CONFIG_GPIO_BT8XX=m
CONFIG_GPIO_ML_IOH=y
CONFIG_GPIO_PCI_IDIO_16=m
CONFIG_GPIO_PCIE_IDIO_24=m
CONFIG_GPIO_RDC321X=m
# end of PCI GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=m
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
CONFIG_GPIO_SIM=m
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_MATROX is not set
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_DS1WM is not set
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
# CONFIG_W1_SLAVE_DS2423 is not set
CONFIG_W1_SLAVE_DS2805=m
CONFIG_W1_SLAVE_DS2430=m
CONFIG_W1_SLAVE_DS2431=m
CONFIG_W1_SLAVE_DS2433=m
CONFIG_W1_SLAVE_DS2433_CRC=y
CONFIG_W1_SLAVE_DS2438=y
# CONFIG_W1_SLAVE_DS250X is not set
# CONFIG_W1_SLAVE_DS2780 is not set
CONFIG_W1_SLAVE_DS2781=y
# CONFIG_W1_SLAVE_DS28E04 is not set
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

# CONFIG_POWER_RESET is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_POWER_SUPPLY_HWMON is not set
CONFIG_PDA_POWER=y
# CONFIG_GENERIC_ADC_BATTERY is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_TEST_POWER is not set
CONFIG_CHARGER_ADP5061=m
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
CONFIG_BATTERY_DS2782=m
CONFIG_BATTERY_SAMSUNG_SDI=y
# CONFIG_BATTERY_SBS is not set
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=m
CONFIG_BATTERY_BQ27XXX_I2C=m
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM=y
CONFIG_CHARGER_DA9150=m
CONFIG_BATTERY_DA9150=m
CONFIG_BATTERY_MAX17040=m
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=m
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=m
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=m
CONFIG_CHARGER_MAX77976=m
CONFIG_CHARGER_MP2629=m
CONFIG_CHARGER_MT6360=m
# CONFIG_CHARGER_BQ2415X is not set
CONFIG_CHARGER_BQ24190=m
# CONFIG_CHARGER_BQ24257 is not set
CONFIG_CHARGER_BQ24735=m
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=m
CONFIG_CHARGER_BQ25980=m
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=m
CONFIG_BATTERY_GAUGE_LTC2941=m
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=m
# CONFIG_CHARGER_RT9455 is not set
CONFIG_CHARGER_BD99954=m
CONFIG_BATTERY_UG3105=m
CONFIG_HWMON=y
CONFIG_HWMON_VID=y
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
# CONFIG_SENSORS_ADM1025 is not set
# CONFIG_SENSORS_ADM1026 is not set
CONFIG_SENSORS_ADM1029=m
# CONFIG_SENSORS_ADM1031 is not set
CONFIG_SENSORS_ADM1177=m
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
CONFIG_SENSORS_ADT7462=m
# CONFIG_SENSORS_ADT7470 is not set
# CONFIG_SENSORS_ADT7475 is not set
# CONFIG_SENSORS_AHT10 is not set
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_AXI_FAN_CONTROL=y
# CONFIG_SENSORS_K8TEMP is not set
CONFIG_SENSORS_APPLESMC=m
# CONFIG_SENSORS_ASB100 is not set
# CONFIG_SENSORS_ASPEED is not set
CONFIG_SENSORS_ATXP1=m
CONFIG_SENSORS_CORSAIR_CPRO=y
CONFIG_SENSORS_CORSAIR_PSU=m
CONFIG_SENSORS_DS620=m
CONFIG_SENSORS_DS1621=m
# CONFIG_SENSORS_DELL_SMM is not set
# CONFIG_SENSORS_I5K_AMB is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=y
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_FTSTEUTATES=m
# CONFIG_SENSORS_GL518SM is not set
# CONFIG_SENSORS_GL520SM is not set
CONFIG_SENSORS_G760A=m
# CONFIG_SENSORS_G762 is not set
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
# CONFIG_SENSORS_IBMPEX is not set
CONFIG_SENSORS_IIO_HWMON=m
# CONFIG_SENSORS_I5500 is not set
CONFIG_SENSORS_CORETEMP=m
# CONFIG_SENSORS_IT87 is not set
# CONFIG_SENSORS_JC42 is not set
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LINEAGE=m
CONFIG_SENSORS_LTC2945=m
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
# CONFIG_SENSORS_LTC2990 is not set
CONFIG_SENSORS_LTC2992=m
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
CONFIG_SENSORS_LTC4245=m
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX127=m
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=y
# CONFIG_SENSORS_MAX31730 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
# CONFIG_SENSORS_MAX6639 is not set
CONFIG_SENSORS_MAX6650=m
# CONFIG_SENSORS_MAX6697 is not set
# CONFIG_SENSORS_MAX31790 is not set
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_MLXREG_FAN=y
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MR75203=y
# CONFIG_SENSORS_LM63 is not set
# CONFIG_SENSORS_LM73 is not set
CONFIG_SENSORS_LM75=m
CONFIG_SENSORS_LM77=m
CONFIG_SENSORS_LM78=m
CONFIG_SENSORS_LM80=m
# CONFIG_SENSORS_LM83 is not set
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
# CONFIG_SENSORS_LM92 is not set
# CONFIG_SENSORS_LM93 is not set
# CONFIG_SENSORS_LM95234 is not set
CONFIG_SENSORS_LM95241=m
# CONFIG_SENSORS_LM95245 is not set
CONFIG_SENSORS_PC87360=y
CONFIG_SENSORS_PC87427=m
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
CONFIG_SENSORS_NCT6775_I2C=m
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
# CONFIG_SENSORS_NPCM7XX is not set
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1266 is not set
CONFIG_SENSORS_ADM1275=m
# CONFIG_SENSORS_BEL_PFE is not set
CONFIG_SENSORS_BPA_RS600=m
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
CONFIG_SENSORS_FSP_3Y=m
CONFIG_SENSORS_IBM_CFFPS=m
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
# CONFIG_SENSORS_IR38064_REGULATOR is not set
CONFIG_SENSORS_IRPS5401=m
# CONFIG_SENSORS_ISL68137 is not set
CONFIG_SENSORS_LM25066=m
# CONFIG_SENSORS_LM25066_REGULATOR is not set
CONFIG_SENSORS_LT7182S=m
CONFIG_SENSORS_LTC2978=m
# CONFIG_SENSORS_LTC2978_REGULATOR is not set
CONFIG_SENSORS_LTC3815=m
CONFIG_SENSORS_MAX15301=m
CONFIG_SENSORS_MAX16064=m
CONFIG_SENSORS_MAX16601=m
CONFIG_SENSORS_MAX20730=m
# CONFIG_SENSORS_MAX20751 is not set
CONFIG_SENSORS_MAX31785=m
# CONFIG_SENSORS_MAX34440 is not set
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
CONFIG_SENSORS_MP2975=m
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_PIM4328=m
CONFIG_SENSORS_PLI1209BC=m
CONFIG_SENSORS_PLI1209BC_REGULATOR=y
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
CONFIG_SENSORS_TPS40422=m
# CONFIG_SENSORS_TPS53679 is not set
CONFIG_SENSORS_UCD9000=m
# CONFIG_SENSORS_UCD9200 is not set
CONFIG_SENSORS_XDPE152=m
CONFIG_SENSORS_XDPE122=m
# CONFIG_SENSORS_XDPE122_REGULATOR is not set
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
# CONFIG_SENSORS_SHT4x is not set
CONFIG_SENSORS_SHTC1=m
# CONFIG_SENSORS_SIS5595 is not set
# CONFIG_SENSORS_SY7636A is not set
# CONFIG_SENSORS_DME1737 is not set
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=y
# CONFIG_SENSORS_SMSC47M192 is not set
# CONFIG_SENSORS_SMSC47B397 is not set
CONFIG_SENSORS_SCH56XX_COMMON=y
CONFIG_SENSORS_SCH5627=m
CONFIG_SENSORS_SCH5636=y
CONFIG_SENSORS_STTS751=m
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=m
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_AMC6821 is not set
# CONFIG_SENSORS_INA209 is not set
# CONFIG_SENSORS_INA2XX is not set
CONFIG_SENSORS_INA238=m
CONFIG_SENSORS_INA3221=m
CONFIG_SENSORS_TC74=m
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
CONFIG_SENSORS_TMP108=m
# CONFIG_SENSORS_TMP401 is not set
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_VIA_CPUTEMP=m
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
CONFIG_SENSORS_VT8231=y
CONFIG_SENSORS_W83773G=m
# CONFIG_SENSORS_W83781D is not set
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
# CONFIG_SENSORS_W83L786NG is not set
CONFIG_SENSORS_W83627HF=y
# CONFIG_SENSORS_W83627EHF is not set
# CONFIG_SENSORS_XGENE is not set

#
# ACPI drivers
#
CONFIG_SENSORS_ACPI_POWER=m
# CONFIG_SENSORS_ATK0110 is not set
CONFIG_SENSORS_ASUS_WMI=m
CONFIG_SENSORS_ASUS_EC=m
CONFIG_THERMAL=y
CONFIG_THERMAL_NETLINK=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_HWMON is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
CONFIG_THERMAL_GOV_FAIR_SHARE=y
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
CONFIG_THERMAL_GOV_USER_SPACE=y
# CONFIG_THERMAL_GOV_POWER_ALLOCATOR is not set
# CONFIG_THERMAL_EMULATION is not set

#
# Intel thermal drivers
#
CONFIG_INTEL_POWERCLAMP=m
CONFIG_X86_THERMAL_VECTOR=y
# CONFIG_X86_PKG_TEMP_THERMAL is not set
CONFIG_INTEL_SOC_DTS_IOSF_CORE=y
CONFIG_INTEL_SOC_DTS_THERMAL=y

#
# ACPI INT340X thermal drivers
#
CONFIG_INT340X_THERMAL=y
CONFIG_ACPI_THERMAL_REL=y
CONFIG_INT3406_THERMAL=m
# end of ACPI INT340X thermal drivers

# CONFIG_INTEL_PCH_THERMAL is not set
CONFIG_INTEL_TCC_COOLING=m
# CONFIG_INTEL_HFI_THERMAL is not set
# end of Intel thermal drivers

# CONFIG_GENERIC_ADC_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
CONFIG_WATCHDOG_NOWAYOUT=y
# CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED is not set
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
# CONFIG_WATCHDOG_SYSFS is not set
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
CONFIG_SOFT_WATCHDOG=m
CONFIG_DA9063_WATCHDOG=m
CONFIG_DA9062_WATCHDOG=m
# CONFIG_MENZ069_WATCHDOG is not set
CONFIG_WDAT_WDT=m
CONFIG_XILINX_WATCHDOG=y
CONFIG_ZIIRAVE_WATCHDOG=m
CONFIG_RAVE_SP_WATCHDOG=m
# CONFIG_MLX_WDT is not set
CONFIG_CADENCE_WATCHDOG=y
# CONFIG_DW_WATCHDOG is not set
CONFIG_MAX63XX_WATCHDOG=y
CONFIG_RETU_WATCHDOG=m
# CONFIG_ACQUIRE_WDT is not set
CONFIG_ADVANTECH_WDT=m
CONFIG_ALIM1535_WDT=m
CONFIG_ALIM7101_WDT=m
# CONFIG_EBC_C384_WDT is not set
CONFIG_F71808E_WDT=y
# CONFIG_SP5100_TCO is not set
CONFIG_SBC_FITPC2_WATCHDOG=m
# CONFIG_EUROTECH_WDT is not set
# CONFIG_IB700_WDT is not set
CONFIG_IBMASR=y
CONFIG_WAFER_WDT=y
CONFIG_I6300ESB_WDT=m
CONFIG_IE6XX_WDT=m
CONFIG_ITCO_WDT=m
CONFIG_ITCO_VENDOR_SUPPORT=y
CONFIG_IT8712F_WDT=m
# CONFIG_IT87_WDT is not set
# CONFIG_HP_WATCHDOG is not set
# CONFIG_KEMPLD_WDT is not set
# CONFIG_SC1200_WDT is not set
# CONFIG_PC87413_WDT is not set
CONFIG_NV_TCO=m
CONFIG_60XX_WDT=m
# CONFIG_CPU5_WDT is not set
# CONFIG_SMSC_SCH311X_WDT is not set
CONFIG_SMSC37B787_WDT=m
CONFIG_TQMX86_WDT=y
CONFIG_VIA_WDT=y
# CONFIG_W83627HF_WDT is not set
CONFIG_W83877F_WDT=m
# CONFIG_W83977F_WDT is not set
CONFIG_MACHZ_WDT=y
CONFIG_SBC_EPX_C3_WATCHDOG=y
CONFIG_INTEL_MEI_WDT=y
CONFIG_NI903X_WDT=y
# CONFIG_NIC7018_WDT is not set
CONFIG_SIEMENS_SIMATIC_IPC_WDT=m
CONFIG_MEN_A21_WDT=m
CONFIG_XEN_WDT=y

#
# PCI-based Watchdog Cards
#
CONFIG_PCIPCWATCHDOG=y
CONFIG_WDTPCI=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
CONFIG_SSB_PCIHOST=y
CONFIG_SSB_DRIVER_PCICORE_POSSIBLE=y
# CONFIG_SSB_DRIVER_PCICORE is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
# CONFIG_BCMA_HOST_SOC is not set
# CONFIG_BCMA_DRIVER_PCI is not set
CONFIG_BCMA_DRIVER_GMAC_CMN=y
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_BCM590XX=m
# CONFIG_MFD_BD9571MWV is not set
# CONFIG_MFD_AXP20X_I2C is not set
# CONFIG_MFD_MADERA is not set
CONFIG_MFD_DA9062=m
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=m
# CONFIG_MFD_MC13XXX_I2C is not set
CONFIG_MFD_MP2629=m
CONFIG_HTC_PASIC3=y
CONFIG_MFD_INTEL_QUARK_I2C_GPIO=m
CONFIG_LPC_ICH=m
CONFIG_LPC_SCH=m
# CONFIG_INTEL_SOC_PMIC_BXTWC is not set
CONFIG_INTEL_SOC_PMIC_MRFLD=m
# CONFIG_MFD_INTEL_LPSS_ACPI is not set
# CONFIG_MFD_INTEL_LPSS_PCI is not set
CONFIG_MFD_INTEL_PMC_BXT=y
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_JANZ_CMODIO is not set
CONFIG_MFD_KEMPLD=m
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=m
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX8907=m
CONFIG_MFD_MT6360=m
CONFIG_MFD_MT6397=m
# CONFIG_MFD_MENF21BMC is not set
CONFIG_MFD_RETU=m
# CONFIG_MFD_PCF50633 is not set
CONFIG_UCB1400_CORE=m
CONFIG_MFD_RDC321X=y
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=m
CONFIG_MFD_SI476X_CORE=m
# CONFIG_MFD_SIMPLE_MFD_I2C is not set
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
CONFIG_MFD_SKY81452=m
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=m
CONFIG_MFD_TI_LMU=m
# CONFIG_TPS6105X is not set
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=m
CONFIG_MFD_TI_LP873X=m
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_VX855=y
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_ATC260X_I2C is not set
CONFIG_RAVE_SP_CORE=m
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
CONFIG_REGULATOR_88PG86X=m
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_BCM590XX=m
CONFIG_REGULATOR_DA9062=m
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=m
CONFIG_REGULATOR_FAN53555=m
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=m
CONFIG_REGULATOR_ISL6271A=m
CONFIG_REGULATOR_LM363X=m
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
# CONFIG_REGULATOR_LP872X is not set
CONFIG_REGULATOR_LP8755=m
CONFIG_REGULATOR_LTC3589=m
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX14577=m
CONFIG_REGULATOR_MAX1586=m
CONFIG_REGULATOR_MAX8649=m
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8893=m
# CONFIG_REGULATOR_MAX8907 is not set
CONFIG_REGULATOR_MAX8952=m
CONFIG_REGULATOR_MAX20086=m
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MP8859=m
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6315 is not set
CONFIG_REGULATOR_MT6323=m
# CONFIG_REGULATOR_MT6358 is not set
# CONFIG_REGULATOR_MT6359 is not set
CONFIG_REGULATOR_MT6360=m
CONFIG_REGULATOR_MT6397=m
CONFIG_REGULATOR_PCA9450=m
# CONFIG_REGULATOR_PV88060 is not set
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_PWM is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=m
# CONFIG_REGULATOR_RT4801 is not set
CONFIG_REGULATOR_RT5033=m
# CONFIG_REGULATOR_RT5190A is not set
CONFIG_REGULATOR_RT5759=m
CONFIG_REGULATOR_RT6160=m
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=m
CONFIG_REGULATOR_RTMV20=m
CONFIG_REGULATOR_RTQ6752=m
CONFIG_REGULATOR_SKY81452=m
CONFIG_REGULATOR_SLG51000=m
# CONFIG_REGULATOR_SY7636A is not set
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS62360=m
CONFIG_REGULATOR_TPS65023=m
CONFIG_REGULATOR_TPS6507X=m
CONFIG_REGULATOR_TPS65086=m
CONFIG_REGULATOR_TPS65132=m
CONFIG_REGULATOR_TPS68470=m
CONFIG_REGULATOR_QCOM_LABIBB=m
CONFIG_RC_CORE=m
CONFIG_LIRC=y
CONFIG_RC_MAP=m
CONFIG_RC_DECODERS=y
CONFIG_IR_IMON_DECODER=m
CONFIG_IR_JVC_DECODER=m
CONFIG_IR_MCE_KBD_DECODER=m
CONFIG_IR_NEC_DECODER=m
# CONFIG_IR_RC5_DECODER is not set
CONFIG_IR_RC6_DECODER=m
CONFIG_IR_RCMM_DECODER=m
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=m
# CONFIG_IR_SONY_DECODER is not set
CONFIG_IR_XMP_DECODER=m
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
CONFIG_IR_ITE_CIR=m
# CONFIG_IR_NUVOTON is not set
# CONFIG_IR_SERIAL is not set
CONFIG_IR_WINBOND_CIR=m
CONFIG_RC_LOOPBACK=m
CONFIG_CEC_CORE=m
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
CONFIG_MEDIA_CEC_RC=y
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

CONFIG_MEDIA_SUPPORT=m
# CONFIG_MEDIA_SUPPORT_FILTER is not set
# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
CONFIG_VIDEO_DEV=m
CONFIG_MEDIA_CONTROLLER=y
CONFIG_DVB_CORE=m
# end of Media core support

#
# Video4Linux options
#
CONFIG_VIDEO_V4L2_I2C=y
CONFIG_VIDEO_V4L2_SUBDEV_API=y
# CONFIG_VIDEO_ADV_DEBUG is not set
CONFIG_VIDEO_FIXED_MINOR_RANGES=y
CONFIG_V4L2_MEM2MEM_DEV=m
CONFIG_V4L2_FWNODE=m
CONFIG_V4L2_ASYNC=m
# end of Video4Linux options

#
# Media controller options
#
# CONFIG_MEDIA_CONTROLLER_DVB is not set
# end of Media controller options

#
# Digital TV options
#
# CONFIG_DVB_MMAP is not set
CONFIG_DVB_NET=y
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
CONFIG_DVB_DEMUX_SECTION_LOSS_LOG=y
CONFIG_DVB_ULE_DEBUG=y
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_PCI_SUPPORT is not set
CONFIG_RADIO_ADAPTERS=m
CONFIG_RADIO_MAXIRADIO=m
# CONFIG_RADIO_SAA7706H is not set
CONFIG_RADIO_SI4713=m
CONFIG_RADIO_SI476X=m
CONFIG_RADIO_TEA575X=m
CONFIG_RADIO_TEA5764=m
# CONFIG_RADIO_TEF6862 is not set
CONFIG_RADIO_WL1273=m
# CONFIG_RADIO_SI470X is not set
CONFIG_PLATFORM_SI4713=m
CONFIG_I2C_SI4713=m
CONFIG_MEDIA_PLATFORM_DRIVERS=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set
CONFIG_DVB_PLATFORM_DRIVERS=y
CONFIG_V4L_MEM2MEM_DRIVERS=y
CONFIG_VIDEO_MEM2MEM_DEINTERLACE=m

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#
# CONFIG_VIDEO_CADENCE_CSI2RX is not set
CONFIG_VIDEO_CADENCE_CSI2TX=m

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#
# CONFIG_V4L_TEST_DRIVERS is not set
# CONFIG_DVB_TEST_DRIVERS is not set
CONFIG_VIDEOBUF2_CORE=m
CONFIG_VIDEOBUF2_V4L2=m
CONFIG_VIDEOBUF2_MEMOPS=m
CONFIG_VIDEOBUF2_DMA_CONTIG=m
CONFIG_VIDEOBUF2_VMALLOC=m
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_ATTACH=y
# CONFIG_VIDEO_IR_I2C is not set

#
# Camera sensor devices
#
CONFIG_VIDEO_CCS_PLL=m
# CONFIG_VIDEO_AR0521 is not set
CONFIG_VIDEO_HI556=m
CONFIG_VIDEO_HI846=m
# CONFIG_VIDEO_HI847 is not set
CONFIG_VIDEO_IMX208=m
CONFIG_VIDEO_IMX214=m
CONFIG_VIDEO_IMX219=m
CONFIG_VIDEO_IMX258=m
# CONFIG_VIDEO_IMX274 is not set
CONFIG_VIDEO_IMX290=m
CONFIG_VIDEO_IMX319=m
CONFIG_VIDEO_IMX355=m
CONFIG_VIDEO_MAX9271_LIB=m
CONFIG_VIDEO_MT9M001=m
# CONFIG_VIDEO_MT9M032 is not set
CONFIG_VIDEO_MT9M111=m
# CONFIG_VIDEO_MT9P031 is not set
# CONFIG_VIDEO_MT9T001 is not set
CONFIG_VIDEO_MT9T112=m
# CONFIG_VIDEO_MT9V011 is not set
CONFIG_VIDEO_MT9V032=m
CONFIG_VIDEO_MT9V111=m
CONFIG_VIDEO_NOON010PC30=m
# CONFIG_VIDEO_OG01A1B is not set
# CONFIG_VIDEO_OV02A10 is not set
# CONFIG_VIDEO_OV08D10 is not set
CONFIG_VIDEO_OV13858=m
CONFIG_VIDEO_OV13B10=m
CONFIG_VIDEO_OV2640=m
# CONFIG_VIDEO_OV2659 is not set
CONFIG_VIDEO_OV2680=m
CONFIG_VIDEO_OV2685=m
# CONFIG_VIDEO_OV2740 is not set
CONFIG_VIDEO_OV5647=m
# CONFIG_VIDEO_OV5648 is not set
CONFIG_VIDEO_OV5670=m
# CONFIG_VIDEO_OV5675 is not set
CONFIG_VIDEO_OV5693=m
CONFIG_VIDEO_OV5695=m
CONFIG_VIDEO_OV6650=m
CONFIG_VIDEO_OV7251=m
CONFIG_VIDEO_OV7640=m
# CONFIG_VIDEO_OV7670 is not set
CONFIG_VIDEO_OV772X=m
# CONFIG_VIDEO_OV7740 is not set
# CONFIG_VIDEO_OV8856 is not set
# CONFIG_VIDEO_OV8865 is not set
CONFIG_VIDEO_OV9640=m
# CONFIG_VIDEO_OV9650 is not set
CONFIG_VIDEO_OV9734=m
CONFIG_VIDEO_RDACM20=m
CONFIG_VIDEO_RDACM21=m
# CONFIG_VIDEO_RJ54N1 is not set
# CONFIG_VIDEO_S5K4ECGX is not set
CONFIG_VIDEO_S5K5BAF=m
# CONFIG_VIDEO_S5K6A3 is not set
# CONFIG_VIDEO_S5K6AA is not set
CONFIG_VIDEO_SR030PC30=m
CONFIG_VIDEO_VS6624=m
CONFIG_VIDEO_CCS=m
# CONFIG_VIDEO_ET8EK8 is not set
# CONFIG_VIDEO_M5MOLS is not set
# end of Camera sensor devices

#
# Lens drivers
#
CONFIG_VIDEO_AD5820=m
CONFIG_VIDEO_AK7375=m
CONFIG_VIDEO_DW9714=m
CONFIG_VIDEO_DW9768=m
CONFIG_VIDEO_DW9807_VCM=m
# end of Lens drivers

#
# Flash devices
#
CONFIG_VIDEO_ADP1653=m
CONFIG_VIDEO_LM3560=m
CONFIG_VIDEO_LM3646=m
# end of Flash devices

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_CS3308=m
CONFIG_VIDEO_CS5345=m
# CONFIG_VIDEO_CS53L32A is not set
CONFIG_VIDEO_MSP3400=m
# CONFIG_VIDEO_SONY_BTF_MPX is not set
CONFIG_VIDEO_TDA1997X=m
CONFIG_VIDEO_TDA7432=m
# CONFIG_VIDEO_TDA9840 is not set
CONFIG_VIDEO_TEA6415C=m
CONFIG_VIDEO_TEA6420=m
# CONFIG_VIDEO_TLV320AIC23B is not set
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_UDA1342=m
CONFIG_VIDEO_VP27SMPX=m
CONFIG_VIDEO_WM8739=m
CONFIG_VIDEO_WM8775=m
# end of Audio decoders, processors and mixers

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m
# end of RDS decoders

#
# Video decoders
#
CONFIG_VIDEO_ADV7180=m
CONFIG_VIDEO_ADV7183=m
CONFIG_VIDEO_ADV7604=m
# CONFIG_VIDEO_ADV7604_CEC is not set
CONFIG_VIDEO_ADV7842=m
# CONFIG_VIDEO_ADV7842_CEC is not set
CONFIG_VIDEO_BT819=m
# CONFIG_VIDEO_BT856 is not set
CONFIG_VIDEO_BT866=m
# CONFIG_VIDEO_KS0127 is not set
CONFIG_VIDEO_ML86V7667=m
# CONFIG_VIDEO_SAA7110 is not set
# CONFIG_VIDEO_SAA711X is not set
CONFIG_VIDEO_TC358743=m
CONFIG_VIDEO_TC358743_CEC=y
# CONFIG_VIDEO_TVP514X is not set
CONFIG_VIDEO_TVP5150=m
CONFIG_VIDEO_TVP7002=m
# CONFIG_VIDEO_TW2804 is not set
CONFIG_VIDEO_TW9903=m
CONFIG_VIDEO_TW9906=m
# CONFIG_VIDEO_TW9910 is not set
CONFIG_VIDEO_VPX3220=m

#
# Video and audio decoders
#
CONFIG_VIDEO_SAA717X=m
CONFIG_VIDEO_CX25840=m
# end of Video decoders

#
# Video encoders
#
# CONFIG_VIDEO_AD9389B is not set
CONFIG_VIDEO_ADV7170=m
# CONFIG_VIDEO_ADV7175 is not set
# CONFIG_VIDEO_ADV7343 is not set
CONFIG_VIDEO_ADV7393=m
CONFIG_VIDEO_ADV7511=m
CONFIG_VIDEO_ADV7511_CEC=y
CONFIG_VIDEO_AK881X=m
# CONFIG_VIDEO_SAA7127 is not set
CONFIG_VIDEO_SAA7185=m
# CONFIG_VIDEO_THS8200 is not set
# end of Video encoders

#
# Video improvement chips
#
# CONFIG_VIDEO_UPD64031A is not set
CONFIG_VIDEO_UPD64083=m
# end of Video improvement chips

#
# Audio/Video compression chips
#
CONFIG_VIDEO_SAA6752HS=m
# end of Audio/Video compression chips

#
# SDR tuner chips
#
CONFIG_SDR_MAX2175=m
# end of SDR tuner chips

#
# Miscellaneous helper chips
#
# CONFIG_VIDEO_I2C is not set
CONFIG_VIDEO_M52790=m
CONFIG_VIDEO_ST_MIPID02=m
CONFIG_VIDEO_THS7303=m
# end of Miscellaneous helper chips

CONFIG_MEDIA_TUNER=m

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_E4000=m
# CONFIG_MEDIA_TUNER_FC0011 is not set
CONFIG_MEDIA_TUNER_FC0012=m
# CONFIG_MEDIA_TUNER_FC0013 is not set
# CONFIG_MEDIA_TUNER_FC2580 is not set
CONFIG_MEDIA_TUNER_IT913X=m
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
CONFIG_MEDIA_TUNER_MAX2165=m
CONFIG_MEDIA_TUNER_MC44S803=m
CONFIG_MEDIA_TUNER_MT2060=m
CONFIG_MEDIA_TUNER_MT2063=m
CONFIG_MEDIA_TUNER_MT20XX=m
CONFIG_MEDIA_TUNER_MT2131=m
# CONFIG_MEDIA_TUNER_MT2266 is not set
CONFIG_MEDIA_TUNER_MXL301RF=m
CONFIG_MEDIA_TUNER_MXL5005S=m
# CONFIG_MEDIA_TUNER_MXL5007T is not set
CONFIG_MEDIA_TUNER_QM1D1B0004=m
CONFIG_MEDIA_TUNER_QM1D1C0042=m
CONFIG_MEDIA_TUNER_QT1010=m
CONFIG_MEDIA_TUNER_R820T=m
CONFIG_MEDIA_TUNER_SI2157=m
CONFIG_MEDIA_TUNER_SIMPLE=m
# CONFIG_MEDIA_TUNER_TDA18212 is not set
CONFIG_MEDIA_TUNER_TDA18218=m
CONFIG_MEDIA_TUNER_TDA18250=m
CONFIG_MEDIA_TUNER_TDA18271=m
CONFIG_MEDIA_TUNER_TDA827X=m
CONFIG_MEDIA_TUNER_TDA8290=m
CONFIG_MEDIA_TUNER_TDA9887=m
CONFIG_MEDIA_TUNER_TEA5761=m
CONFIG_MEDIA_TUNER_TEA5767=m
CONFIG_MEDIA_TUNER_TUA9001=m
# CONFIG_MEDIA_TUNER_XC2028 is not set
# CONFIG_MEDIA_TUNER_XC4000 is not set
CONFIG_MEDIA_TUNER_XC5000=m
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
# CONFIG_DVB_M88DS3103 is not set
CONFIG_DVB_MXL5XX=m
CONFIG_DVB_STB0899=m
# CONFIG_DVB_STB6100 is not set
# CONFIG_DVB_STV090x is not set
CONFIG_DVB_STV0910=m
CONFIG_DVB_STV6110x=m
# CONFIG_DVB_STV6111 is not set

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=m
# CONFIG_DVB_MN88472 is not set
CONFIG_DVB_MN88473=m
CONFIG_DVB_SI2165=m
# CONFIG_DVB_TDA18271C2DD is not set

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=m
CONFIG_DVB_CX24116=m
CONFIG_DVB_CX24117=m
CONFIG_DVB_CX24120=m
# CONFIG_DVB_CX24123 is not set
# CONFIG_DVB_DS3000 is not set
# CONFIG_DVB_MB86A16 is not set
# CONFIG_DVB_MT312 is not set
# CONFIG_DVB_S5H1420 is not set
# CONFIG_DVB_SI21XX is not set
CONFIG_DVB_STB6000=m
# CONFIG_DVB_STV0288 is not set
CONFIG_DVB_STV0299=m
CONFIG_DVB_STV0900=m
CONFIG_DVB_STV6110=m
CONFIG_DVB_TDA10071=m
CONFIG_DVB_TDA10086=m
# CONFIG_DVB_TDA8083 is not set
CONFIG_DVB_TDA8261=m
# CONFIG_DVB_TDA826X is not set
CONFIG_DVB_TS2020=m
CONFIG_DVB_TUA6100=m
CONFIG_DVB_TUNER_CX24113=m
CONFIG_DVB_TUNER_ITD1000=m
CONFIG_DVB_VES1X93=m
CONFIG_DVB_ZL10036=m
CONFIG_DVB_ZL10039=m

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=m
CONFIG_DVB_CX22700=m
CONFIG_DVB_CX22702=m
CONFIG_DVB_CXD2820R=m
CONFIG_DVB_CXD2841ER=m
CONFIG_DVB_DIB3000MB=m
CONFIG_DVB_DIB3000MC=m
CONFIG_DVB_DIB7000M=m
CONFIG_DVB_DIB7000P=m
CONFIG_DVB_DIB9000=m
CONFIG_DVB_DRXD=m
# CONFIG_DVB_EC100 is not set
CONFIG_DVB_L64781=m
CONFIG_DVB_MT352=m
CONFIG_DVB_NXT6000=m
CONFIG_DVB_RTL2830=m
CONFIG_DVB_RTL2832=m
CONFIG_DVB_S5H1432=m
CONFIG_DVB_SI2168=m
# CONFIG_DVB_SP887X is not set
CONFIG_DVB_STV0367=m
# CONFIG_DVB_TDA10048 is not set
CONFIG_DVB_TDA1004X=m
# CONFIG_DVB_ZD1301_DEMOD is not set
CONFIG_DVB_ZL10353=m

#
# DVB-C (cable) frontends
#
# CONFIG_DVB_STV0297 is not set
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=m
CONFIG_DVB_VES1820=m

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=m
CONFIG_DVB_AU8522_DTV=m
CONFIG_DVB_AU8522_V4L=m
CONFIG_DVB_BCM3510=m
# CONFIG_DVB_LG2160 is not set
# CONFIG_DVB_LGDT3305 is not set
CONFIG_DVB_LGDT3306A=m
CONFIG_DVB_LGDT330X=m
# CONFIG_DVB_MXL692 is not set
# CONFIG_DVB_NXT200X is not set
# CONFIG_DVB_OR51132 is not set
CONFIG_DVB_OR51211=m
# CONFIG_DVB_S5H1409 is not set
# CONFIG_DVB_S5H1411 is not set

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_DIB8000 is not set
CONFIG_DVB_MB86A20S=m
CONFIG_DVB_S921=m

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_MN88443X is not set
# CONFIG_DVB_TC90522 is not set

#
# Digital terrestrial only tuners/PLL
#
# CONFIG_DVB_PLL is not set
# CONFIG_DVB_TUNER_DIB0070 is not set
# CONFIG_DVB_TUNER_DIB0090 is not set

#
# SEC control devices for DVB-S
#
CONFIG_DVB_A8293=m
CONFIG_DVB_AF9033=m
CONFIG_DVB_ASCOT2E=m
# CONFIG_DVB_ATBM8830 is not set
CONFIG_DVB_HELENE=m
# CONFIG_DVB_HORUS3A is not set
CONFIG_DVB_ISL6405=m
# CONFIG_DVB_ISL6421 is not set
CONFIG_DVB_ISL6423=m
CONFIG_DVB_IX2505V=m
CONFIG_DVB_LGS8GL5=m
# CONFIG_DVB_LGS8GXX is not set
# CONFIG_DVB_LNBH25 is not set
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=m
CONFIG_DVB_LNBP22=m
CONFIG_DVB_M88RS2000=m
CONFIG_DVB_TDA665x=m
CONFIG_DVB_DRX39XYJ=m

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
CONFIG_DVB_SP2=m
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
CONFIG_DVB_DUMMY_FE=m
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_AGP is not set
# CONFIG_VGA_SWITCHEROO is not set
CONFIG_DRM=m
# CONFIG_DRM_DEBUG_SELFTEST is not set
CONFIG_DRM_KMS_HELPER=m
CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=y
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
# CONFIG_DRM_FBDEV_EMULATION is not set
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
CONFIG_DRM_DP_CEC=y
CONFIG_DRM_TTM=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
# CONFIG_DRM_I2C_SIL164 is not set
CONFIG_DRM_I2C_NXP_TDA998X=m
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_RADEON is not set
# CONFIG_DRM_AMDGPU is not set
# CONFIG_DRM_NOUVEAU is not set
# CONFIG_DRM_I915 is not set
CONFIG_DRM_VGEM=m
# CONFIG_DRM_VKMS is not set
CONFIG_DRM_VMWGFX=m
# CONFIG_DRM_VMWGFX_MKSSTATS is not set
CONFIG_DRM_GMA500=m
CONFIG_DRM_AST=m
CONFIG_DRM_MGAG200=m
CONFIG_DRM_QXL=m
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_ANALOGIX_ANX78XX=m
CONFIG_DRM_ANALOGIX_DP=m
# end of Display Interface Bridges

CONFIG_DRM_ETNAVIV=m
CONFIG_DRM_ETNAVIV_THERMAL=y
CONFIG_DRM_BOCHS=m
# CONFIG_DRM_CIRRUS_QEMU is not set
# CONFIG_DRM_SIMPLEDRM is not set
CONFIG_DRM_XEN=y
CONFIG_DRM_XEN_FRONTEND=m
# CONFIG_DRM_VBOXVIDEO is not set
CONFIG_DRM_SSD130X=m
# CONFIG_DRM_SSD130X_I2C is not set
CONFIG_DRM_HYPERV=m
CONFIG_DRM_LEGACY=y
# CONFIG_DRM_TDFX is not set
# CONFIG_DRM_R128 is not set
CONFIG_DRM_MGA=m
# CONFIG_DRM_VIA is not set
CONFIG_DRM_SAVAGE=m
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
# CONFIG_FIRMWARE_EDID is not set
CONFIG_FB_DDC=m
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
CONFIG_FB_FOREIGN_ENDIAN=y
# CONFIG_FB_BOTH_ENDIAN is not set
CONFIG_FB_BIG_ENDIAN=y
# CONFIG_FB_LITTLE_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_HECUBA=y
CONFIG_FB_SVGALIB=y
CONFIG_FB_BACKLIGHT=m
CONFIG_FB_MODE_HELPERS=y
CONFIG_FB_TILEBLITTING=y

#
# Frame buffer hardware drivers
#
CONFIG_FB_CIRRUS=m
CONFIG_FB_PM2=y
# CONFIG_FB_PM2_FIFO_DISCONNECT is not set
CONFIG_FB_CYBER2000=m
CONFIG_FB_CYBER2000_DDC=y
CONFIG_FB_ARC=y
CONFIG_FB_ASILIANT=y
# CONFIG_FB_IMSTT is not set
# CONFIG_FB_VGA16 is not set
# CONFIG_FB_VESA is not set
# CONFIG_FB_EFI is not set
CONFIG_FB_N411=y
# CONFIG_FB_HGA is not set
# CONFIG_FB_OPENCORES is not set
CONFIG_FB_S1D13XXX=y
CONFIG_FB_NVIDIA=m
# CONFIG_FB_NVIDIA_I2C is not set
# CONFIG_FB_NVIDIA_DEBUG is not set
CONFIG_FB_NVIDIA_BACKLIGHT=y
# CONFIG_FB_RIVA is not set
CONFIG_FB_I740=m
# CONFIG_FB_LE80578 is not set
CONFIG_FB_MATROX=y
# CONFIG_FB_MATROX_MILLENIUM is not set
# CONFIG_FB_MATROX_MYSTIQUE is not set
CONFIG_FB_MATROX_G=y
# CONFIG_FB_MATROX_I2C is not set
# CONFIG_FB_RADEON is not set
CONFIG_FB_ATY128=m
CONFIG_FB_ATY128_BACKLIGHT=y
CONFIG_FB_ATY=m
CONFIG_FB_ATY_CT=y
# CONFIG_FB_ATY_GENERIC_LCD is not set
# CONFIG_FB_ATY_GX is not set
CONFIG_FB_ATY_BACKLIGHT=y
CONFIG_FB_S3=y
# CONFIG_FB_S3_DDC is not set
CONFIG_FB_SAVAGE=m
CONFIG_FB_SAVAGE_I2C=y
# CONFIG_FB_SAVAGE_ACCEL is not set
# CONFIG_FB_SIS is not set
# CONFIG_FB_VIA is not set
CONFIG_FB_NEOMAGIC=m
CONFIG_FB_KYRO=y
CONFIG_FB_3DFX=y
CONFIG_FB_3DFX_ACCEL=y
# CONFIG_FB_3DFX_I2C is not set
CONFIG_FB_VOODOO1=y
CONFIG_FB_VT8623=m
# CONFIG_FB_TRIDENT is not set
CONFIG_FB_ARK=m
CONFIG_FB_PM3=m
CONFIG_FB_CARMINE=y
# CONFIG_FB_CARMINE_DRAM_EVAL is not set
CONFIG_CARMINE_DRAM_CUSTOM=y
# CONFIG_FB_SM501 is not set
CONFIG_FB_IBM_GXT4500=m
CONFIG_FB_VIRTUAL=y
CONFIG_XEN_FBDEV_FRONTEND=y
CONFIG_FB_METRONOME=m
CONFIG_FB_MB862XX=m
CONFIG_FB_MB862XX_PCI_GDC=y
# CONFIG_FB_MB862XX_I2C is not set
CONFIG_FB_HYPERV=m
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=m
CONFIG_FB_SM712=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=y
# CONFIG_BACKLIGHT_LM3533 is not set
CONFIG_BACKLIGHT_PWM=m
CONFIG_BACKLIGHT_APPLE=m
CONFIG_BACKLIGHT_QCOM_WLED=m
# CONFIG_BACKLIGHT_SAHARA is not set
CONFIG_BACKLIGHT_ADP8860=m
# CONFIG_BACKLIGHT_ADP8870 is not set
CONFIG_BACKLIGHT_LM3630A=m
CONFIG_BACKLIGHT_LM3639=m
# CONFIG_BACKLIGHT_LP855X is not set
CONFIG_BACKLIGHT_SKY81452=m
CONFIG_BACKLIGHT_GPIO=y
# CONFIG_BACKLIGHT_LV5207LP is not set
# CONFIG_BACKLIGHT_BD6107 is not set
CONFIG_BACKLIGHT_ARCXCNN=m
CONFIG_BACKLIGHT_RAVE_SP=m
# end of Backlight & LCD device support

CONFIG_VGASTATE=y
CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
CONFIG_LOGO=y
CONFIG_LOGO_LINUX_MONO=y
# CONFIG_LOGO_LINUX_VGA16 is not set
# CONFIG_LOGO_LINUX_CLUT224 is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SND=m
CONFIG_SND_TIMER=m
CONFIG_SND_PCM=m
CONFIG_SND_PCM_ELD=y
CONFIG_SND_PCM_IEC958=y
CONFIG_SND_DMAENGINE_PCM=m
CONFIG_SND_SEQ_DEVICE=m
CONFIG_SND_RAWMIDI=m
CONFIG_SND_COMPRESS_OFFLOAD=m
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
# CONFIG_SND_PCM_TIMER is not set
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_PROC_FS=y
CONFIG_SND_VERBOSE_PROCFS=y
CONFIG_SND_VERBOSE_PRINTK=y
# CONFIG_SND_CTL_FAST_LOOKUP is not set
# CONFIG_SND_DEBUG is not set
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_VMASTER=y
CONFIG_SND_DMA_SGBUF=y
CONFIG_SND_CTL_LED=m
CONFIG_SND_SEQUENCER=m
CONFIG_SND_SEQ_DUMMY=m
CONFIG_SND_SEQ_MIDI_EVENT=m
CONFIG_SND_SEQ_MIDI=m
CONFIG_SND_SEQ_VIRMIDI=m
CONFIG_SND_MPU401_UART=m
CONFIG_SND_AC97_CODEC=m
CONFIG_SND_DRIVERS=y
# CONFIG_SND_DUMMY is not set
# CONFIG_SND_ALOOP is not set
CONFIG_SND_VIRMIDI=m
CONFIG_SND_MTPAV=m
CONFIG_SND_MTS64=m
CONFIG_SND_SERIAL_U16550=m
CONFIG_SND_MPU401=m
CONFIG_SND_PORTMAN2X4=m
CONFIG_SND_AC97_POWER_SAVE=y
CONFIG_SND_AC97_POWER_SAVE_DEFAULT=0
# CONFIG_SND_PCI is not set

#
# HD-Audio
#
CONFIG_SND_HDA=m
CONFIG_SND_HDA_GENERIC_LEDS=y
# CONFIG_SND_HDA_HWDEP is not set
CONFIG_SND_HDA_RECONFIG=y
# CONFIG_SND_HDA_INPUT_BEEP is not set
# CONFIG_SND_HDA_PATCH_LOADER is not set
# CONFIG_SND_HDA_SCODEC_CS35L41_I2C is not set
CONFIG_SND_HDA_CODEC_REALTEK=m
CONFIG_SND_HDA_CODEC_ANALOG=m
# CONFIG_SND_HDA_CODEC_SIGMATEL is not set
CONFIG_SND_HDA_CODEC_VIA=m
CONFIG_SND_HDA_CODEC_HDMI=m
# CONFIG_SND_HDA_CODEC_CIRRUS is not set
# CONFIG_SND_HDA_CODEC_CS8409 is not set
CONFIG_SND_HDA_CODEC_CONEXANT=m
# CONFIG_SND_HDA_CODEC_CA0110 is not set
CONFIG_SND_HDA_CODEC_CA0132=m
# CONFIG_SND_HDA_CODEC_CA0132_DSP is not set
# CONFIG_SND_HDA_CODEC_CMEDIA is not set
CONFIG_SND_HDA_CODEC_SI3054=m
CONFIG_SND_HDA_GENERIC=m
CONFIG_SND_HDA_POWER_SAVE_DEFAULT=0
# end of HD-Audio

CONFIG_SND_HDA_CORE=m
CONFIG_SND_HDA_DSP_LOADER=y
CONFIG_SND_HDA_EXT_CORE=m
CONFIG_SND_HDA_PREALLOC_SIZE=0
CONFIG_SND_INTEL_NHLT=y
CONFIG_SND_INTEL_DSP_CONFIG=m
CONFIG_SND_INTEL_SOUNDWIRE_ACPI=m
CONFIG_SND_INTEL_BYT_PREFER_SOF=y
# CONFIG_SND_PCMCIA is not set
CONFIG_SND_SOC=m
CONFIG_SND_SOC_AC97_BUS=y
CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM=y
CONFIG_SND_SOC_COMPRESS=y
CONFIG_SND_SOC_TOPOLOGY=y
CONFIG_SND_SOC_ACPI=m
# CONFIG_SND_SOC_ADI is not set
# CONFIG_SND_SOC_AMD_ACP is not set
# CONFIG_SND_SOC_AMD_ACP3x is not set
# CONFIG_SND_SOC_AMD_RENOIR is not set
CONFIG_SND_SOC_AMD_ACP5x=m
# CONFIG_SND_SOC_AMD_ACP6x is not set
# CONFIG_SND_AMD_ACP_CONFIG is not set
# CONFIG_SND_SOC_AMD_ACP_COMMON is not set
# CONFIG_SND_SOC_AMD_RPL_ACP6x is not set
# CONFIG_SND_ATMEL_SOC is not set
# CONFIG_SND_BCM63XX_I2S_WHISTLER is not set
# CONFIG_SND_DESIGNWARE_I2S is not set

#
# SoC Audio for Freescale CPUs
#

#
# Common SoC Audio options for Freescale CPUs:
#
# CONFIG_SND_SOC_FSL_ASRC is not set
CONFIG_SND_SOC_FSL_SAI=m
# CONFIG_SND_SOC_FSL_MQS is not set
# CONFIG_SND_SOC_FSL_AUDMIX is not set
CONFIG_SND_SOC_FSL_SSI=m
CONFIG_SND_SOC_FSL_SPDIF=m
# CONFIG_SND_SOC_FSL_ESAI is not set
CONFIG_SND_SOC_FSL_MICFIL=m
# CONFIG_SND_SOC_FSL_XCVR is not set
CONFIG_SND_SOC_FSL_UTILS=m
CONFIG_SND_SOC_IMX_AUDMUX=m
# end of SoC Audio for Freescale CPUs

CONFIG_SND_I2S_HI6210_I2S=m
CONFIG_SND_SOC_IMG=y
CONFIG_SND_SOC_IMG_I2S_IN=m
# CONFIG_SND_SOC_IMG_I2S_OUT is not set
CONFIG_SND_SOC_IMG_PARALLEL_OUT=m
CONFIG_SND_SOC_IMG_SPDIF_IN=m
# CONFIG_SND_SOC_IMG_SPDIF_OUT is not set
CONFIG_SND_SOC_IMG_PISTACHIO_INTERNAL_DAC=m
CONFIG_SND_SOC_INTEL_SST_TOPLEVEL=y
CONFIG_SND_SOC_INTEL_SST=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI=m
CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI=m
# CONFIG_SND_SOC_INTEL_SKYLAKE is not set
CONFIG_SND_SOC_INTEL_SKL=m
CONFIG_SND_SOC_INTEL_APL=m
CONFIG_SND_SOC_INTEL_KBL=m
CONFIG_SND_SOC_INTEL_GLK=m
# CONFIG_SND_SOC_INTEL_CNL is not set
# CONFIG_SND_SOC_INTEL_CFL is not set
CONFIG_SND_SOC_INTEL_CML_H=m
CONFIG_SND_SOC_INTEL_CML_LP=m
CONFIG_SND_SOC_INTEL_SKYLAKE_FAMILY=m
CONFIG_SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC=y
CONFIG_SND_SOC_INTEL_SKYLAKE_COMMON=m
CONFIG_SND_SOC_ACPI_INTEL_MATCH=m
CONFIG_SND_SOC_INTEL_AVS=m

#
# Intel AVS Machine drivers
#

#
# Available DSP configurations
#
CONFIG_SND_SOC_INTEL_AVS_MACH_DMIC=m
CONFIG_SND_SOC_INTEL_AVS_MACH_HDAUDIO=m
# CONFIG_SND_SOC_INTEL_AVS_MACH_I2S_TEST is not set
# end of Intel AVS Machine drivers

CONFIG_SND_SOC_INTEL_MACH=y
CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES=y
# CONFIG_SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH is not set
# CONFIG_SND_SOC_MTK_BTCVSD is not set
CONFIG_SND_SOC_SOF_TOPLEVEL=y
# CONFIG_SND_SOC_SOF_PCI is not set
CONFIG_SND_SOC_SOF_ACPI=m
CONFIG_SND_SOC_SOF_ACPI_DEV=m
CONFIG_SND_SOC_SOF_DEVELOPER_SUPPORT=y
CONFIG_SND_SOC_SOF_FORCE_PROBE_WORKQUEUE=y
CONFIG_SND_SOC_SOF_NOCODEC=m
CONFIG_SND_SOC_SOF_NOCODEC_SUPPORT=y
CONFIG_SND_SOC_SOF_STRICT_ABI_CHECKS=y
# CONFIG_SND_SOC_SOF_DEBUG is not set
CONFIG_SND_SOC_SOF=m
CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE=y
CONFIG_SND_SOC_SOF_IPC3=y
# CONFIG_SND_SOC_SOF_AMD_TOPLEVEL is not set
CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL=y
CONFIG_SND_SOC_SOF_INTEL_HIFI_EP_IPC=m
CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP=m
CONFIG_SND_SOC_SOF_INTEL_COMMON=m
CONFIG_SND_SOC_SOF_BAYTRAIL=m
# CONFIG_SND_SOC_SOF_BROADWELL is not set
CONFIG_SND_SOC_SOF_XTENSA=m

#
# STMicroelectronics STM32 SOC audio support
#
# end of STMicroelectronics STM32 SOC audio support

# CONFIG_SND_SOC_XILINX_I2S is not set
CONFIG_SND_SOC_XILINX_AUDIO_FORMATTER=m
CONFIG_SND_SOC_XILINX_SPDIF=m
CONFIG_SND_SOC_XTFPGA_I2S=m
CONFIG_SND_SOC_I2C_AND_SPI=m

#
# CODEC drivers
#
CONFIG_SND_SOC_WM_ADSP=m
CONFIG_SND_SOC_AC97_CODEC=m
CONFIG_SND_SOC_ADAU_UTILS=m
CONFIG_SND_SOC_ADAU1372=m
CONFIG_SND_SOC_ADAU1372_I2C=m
CONFIG_SND_SOC_ADAU1701=m
CONFIG_SND_SOC_ADAU17X1=m
CONFIG_SND_SOC_ADAU1761=m
CONFIG_SND_SOC_ADAU1761_I2C=m
# CONFIG_SND_SOC_ADAU7002 is not set
CONFIG_SND_SOC_ADAU7118=m
CONFIG_SND_SOC_ADAU7118_HW=m
CONFIG_SND_SOC_ADAU7118_I2C=m
CONFIG_SND_SOC_AK4118=m
CONFIG_SND_SOC_AK4375=m
CONFIG_SND_SOC_AK4458=m
CONFIG_SND_SOC_AK4554=m
CONFIG_SND_SOC_AK4613=m
# CONFIG_SND_SOC_AK4642 is not set
CONFIG_SND_SOC_AK5386=m
CONFIG_SND_SOC_AK5558=m
# CONFIG_SND_SOC_ALC5623 is not set
CONFIG_SND_SOC_AW8738=m
CONFIG_SND_SOC_BD28623=m
CONFIG_SND_SOC_BT_SCO=m
CONFIG_SND_SOC_CS35L32=m
CONFIG_SND_SOC_CS35L33=m
CONFIG_SND_SOC_CS35L34=m
CONFIG_SND_SOC_CS35L35=m
# CONFIG_SND_SOC_CS35L36 is not set
CONFIG_SND_SOC_CS35L41_LIB=m
CONFIG_SND_SOC_CS35L41=m
CONFIG_SND_SOC_CS35L41_I2C=m
# CONFIG_SND_SOC_CS35L45_I2C is not set
# CONFIG_SND_SOC_CS42L42 is not set
CONFIG_SND_SOC_CS42L51=m
CONFIG_SND_SOC_CS42L51_I2C=m
CONFIG_SND_SOC_CS42L52=m
CONFIG_SND_SOC_CS42L56=m
# CONFIG_SND_SOC_CS42L73 is not set
# CONFIG_SND_SOC_CS4234 is not set
# CONFIG_SND_SOC_CS4265 is not set
# CONFIG_SND_SOC_CS4270 is not set
CONFIG_SND_SOC_CS4271=m
CONFIG_SND_SOC_CS4271_I2C=m
CONFIG_SND_SOC_CS42XX8=m
CONFIG_SND_SOC_CS42XX8_I2C=m
CONFIG_SND_SOC_CS43130=m
CONFIG_SND_SOC_CS4341=m
# CONFIG_SND_SOC_CS4349 is not set
CONFIG_SND_SOC_CS53L30=m
CONFIG_SND_SOC_CX2072X=m
# CONFIG_SND_SOC_DA7213 is not set
CONFIG_SND_SOC_DMIC=m
CONFIG_SND_SOC_HDMI_CODEC=m
# CONFIG_SND_SOC_ES7134 is not set
CONFIG_SND_SOC_ES7241=m
CONFIG_SND_SOC_ES8316=m
CONFIG_SND_SOC_ES8328=m
CONFIG_SND_SOC_ES8328_I2C=m
CONFIG_SND_SOC_GTM601=m
CONFIG_SND_SOC_HDAC_HDA=m
CONFIG_SND_SOC_HDA=m
CONFIG_SND_SOC_ICS43432=m
CONFIG_SND_SOC_INNO_RK3036=m
CONFIG_SND_SOC_MAX98088=m
CONFIG_SND_SOC_MAX98357A=m
# CONFIG_SND_SOC_MAX98504 is not set
CONFIG_SND_SOC_MAX9867=m
CONFIG_SND_SOC_MAX98927=m
# CONFIG_SND_SOC_MAX98520 is not set
CONFIG_SND_SOC_MAX98373=m
# CONFIG_SND_SOC_MAX98373_I2C is not set
CONFIG_SND_SOC_MAX98373_SDW=m
CONFIG_SND_SOC_MAX98390=m
CONFIG_SND_SOC_MAX98396=m
CONFIG_SND_SOC_MAX9860=m
CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
# CONFIG_SND_SOC_PCM1681 is not set
# CONFIG_SND_SOC_PCM1789_I2C is not set
CONFIG_SND_SOC_PCM179X=m
CONFIG_SND_SOC_PCM179X_I2C=m
CONFIG_SND_SOC_PCM186X=m
CONFIG_SND_SOC_PCM186X_I2C=m
CONFIG_SND_SOC_PCM3060=m
CONFIG_SND_SOC_PCM3060_I2C=m
# CONFIG_SND_SOC_PCM3168A_I2C is not set
# CONFIG_SND_SOC_PCM5102A is not set
CONFIG_SND_SOC_PCM512x=m
CONFIG_SND_SOC_PCM512x_I2C=m
CONFIG_SND_SOC_RK3328=m
CONFIG_SND_SOC_RL6231=m
CONFIG_SND_SOC_RT1308_SDW=m
CONFIG_SND_SOC_RT1316_SDW=m
# CONFIG_SND_SOC_RT5616 is not set
# CONFIG_SND_SOC_RT5631 is not set
CONFIG_SND_SOC_RT5640=m
CONFIG_SND_SOC_RT5659=m
CONFIG_SND_SOC_RT5682=m
CONFIG_SND_SOC_RT5682_SDW=m
# CONFIG_SND_SOC_RT700_SDW is not set
CONFIG_SND_SOC_RT711=m
CONFIG_SND_SOC_RT711_SDW=m
CONFIG_SND_SOC_RT711_SDCA_SDW=m
CONFIG_SND_SOC_RT715=m
CONFIG_SND_SOC_RT715_SDW=m
CONFIG_SND_SOC_RT715_SDCA_SDW=m
CONFIG_SND_SOC_RT9120=m
CONFIG_SND_SOC_SDW_MOCKUP=m
CONFIG_SND_SOC_SGTL5000=m
CONFIG_SND_SOC_SI476X=m
CONFIG_SND_SOC_SIGMADSP=m
CONFIG_SND_SOC_SIGMADSP_I2C=m
CONFIG_SND_SOC_SIGMADSP_REGMAP=m
CONFIG_SND_SOC_SIMPLE_AMPLIFIER=m
# CONFIG_SND_SOC_SIMPLE_MUX is not set
CONFIG_SND_SOC_SPDIF=m
# CONFIG_SND_SOC_SSM2305 is not set
CONFIG_SND_SOC_SSM2518=m
# CONFIG_SND_SOC_SSM2602_I2C is not set
CONFIG_SND_SOC_SSM4567=m
CONFIG_SND_SOC_STA32X=m
# CONFIG_SND_SOC_STA350 is not set
CONFIG_SND_SOC_STI_SAS=m
CONFIG_SND_SOC_TAS2552=m
# CONFIG_SND_SOC_TAS2562 is not set
# CONFIG_SND_SOC_TAS2764 is not set
CONFIG_SND_SOC_TAS2770=m
# CONFIG_SND_SOC_TAS2780 is not set
CONFIG_SND_SOC_TAS5086=m
CONFIG_SND_SOC_TAS571X=m
CONFIG_SND_SOC_TAS5720=m
CONFIG_SND_SOC_TAS5805M=m
CONFIG_SND_SOC_TAS6424=m
# CONFIG_SND_SOC_TDA7419 is not set
# CONFIG_SND_SOC_TFA9879 is not set
CONFIG_SND_SOC_TFA989X=m
# CONFIG_SND_SOC_TLV320ADC3XXX is not set
# CONFIG_SND_SOC_TLV320AIC23_I2C is not set
CONFIG_SND_SOC_TLV320AIC31XX=m
CONFIG_SND_SOC_TLV320AIC32X4=m
CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
CONFIG_SND_SOC_TLV320AIC3X=m
CONFIG_SND_SOC_TLV320AIC3X_I2C=m
# CONFIG_SND_SOC_TLV320ADCX140 is not set
CONFIG_SND_SOC_TS3A227E=m
# CONFIG_SND_SOC_TSCS42XX is not set
CONFIG_SND_SOC_TSCS454=m
# CONFIG_SND_SOC_UDA1334 is not set
# CONFIG_SND_SOC_WCD938X_SDW is not set
# CONFIG_SND_SOC_WM8510 is not set
CONFIG_SND_SOC_WM8523=m
CONFIG_SND_SOC_WM8524=m
CONFIG_SND_SOC_WM8580=m
CONFIG_SND_SOC_WM8711=m
CONFIG_SND_SOC_WM8728=m
# CONFIG_SND_SOC_WM8731_I2C is not set
CONFIG_SND_SOC_WM8737=m
CONFIG_SND_SOC_WM8741=m
CONFIG_SND_SOC_WM8750=m
CONFIG_SND_SOC_WM8753=m
CONFIG_SND_SOC_WM8776=m
CONFIG_SND_SOC_WM8782=m
# CONFIG_SND_SOC_WM8804_I2C is not set
CONFIG_SND_SOC_WM8903=m
# CONFIG_SND_SOC_WM8904 is not set
CONFIG_SND_SOC_WM8940=m
# CONFIG_SND_SOC_WM8960 is not set
CONFIG_SND_SOC_WM8962=m
CONFIG_SND_SOC_WM8974=m
CONFIG_SND_SOC_WM8978=m
CONFIG_SND_SOC_WM8985=m
CONFIG_SND_SOC_WSA881X=m
CONFIG_SND_SOC_WSA883X=m
CONFIG_SND_SOC_MAX9759=m
CONFIG_SND_SOC_MT6351=m
CONFIG_SND_SOC_MT6358=m
CONFIG_SND_SOC_MT6660=m
CONFIG_SND_SOC_NAU8315=m
# CONFIG_SND_SOC_NAU8540 is not set
CONFIG_SND_SOC_NAU8810=m
# CONFIG_SND_SOC_NAU8821 is not set
# CONFIG_SND_SOC_NAU8822 is not set
CONFIG_SND_SOC_NAU8824=m
# CONFIG_SND_SOC_TPA6130A2 is not set
CONFIG_SND_SOC_LPASS_MACRO_COMMON=m
CONFIG_SND_SOC_LPASS_WSA_MACRO=m
# CONFIG_SND_SOC_LPASS_VA_MACRO is not set
CONFIG_SND_SOC_LPASS_RX_MACRO=m
CONFIG_SND_SOC_LPASS_TX_MACRO=m
# end of CODEC drivers

CONFIG_SND_SIMPLE_CARD_UTILS=m
CONFIG_SND_SIMPLE_CARD=m
# CONFIG_SND_X86 is not set
CONFIG_SND_XEN_FRONTEND=m
CONFIG_SND_VIRTIO=m
CONFIG_AC97_BUS=m

#
# HID support
#
CONFIG_HID=y
# CONFIG_HID_BATTERY_STRENGTH is not set
# CONFIG_HIDRAW is not set
CONFIG_UHID=y
CONFIG_HID_GENERIC=y

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACRUX=m
# CONFIG_HID_ACRUX_FF is not set
CONFIG_HID_APPLE=y
# CONFIG_HID_AUREAL is not set
# CONFIG_HID_BELKIN is not set
# CONFIG_HID_CHERRY is not set
CONFIG_HID_COUGAR=y
# CONFIG_HID_MACALLY is not set
# CONFIG_HID_CMEDIA is not set
CONFIG_HID_CYPRESS=y
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELECOM=m
# CONFIG_HID_EZKEY is not set
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=y
# CONFIG_HID_GLORIOUS is not set
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_VIVALDI=m
CONFIG_HID_KEYTOUCH=y
CONFIG_HID_KYE=m
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=y
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=m
CONFIG_HID_ITE=m
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=y
CONFIG_HID_KENSINGTON=y
CONFIG_HID_LCPOWER=y
CONFIG_HID_LED=y
# CONFIG_HID_LENOVO is not set
# CONFIG_HID_MAGICMOUSE is not set
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=m
CONFIG_HID_REDRAGON=m
# CONFIG_HID_MICROSOFT is not set
# CONFIG_HID_MONTEREY is not set
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NINTENDO is not set
CONFIG_HID_NTI=y
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
# CONFIG_PANTHERLORD_FF is not set
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=m
CONFIG_HID_PICOLCD_FB=y
# CONFIG_HID_PICOLCD_BACKLIGHT is not set
# CONFIG_HID_PICOLCD_LEDS is not set
# CONFIG_HID_PICOLCD_CIR is not set
CONFIG_HID_PLANTRONICS=m
CONFIG_HID_PLAYSTATION=y
CONFIG_PLAYSTATION_FF=y
CONFIG_HID_RAZER=y
# CONFIG_HID_PRIMAX is not set
CONFIG_HID_SAITEK=y
# CONFIG_HID_SEMITEK is not set
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=y
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=m
CONFIG_GREENASIA_FF=y
CONFIG_HID_HYPERV_MOUSE=m
CONFIG_HID_SMARTJOYPLUS=y
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=m
# CONFIG_HID_THINGM is not set
CONFIG_HID_UDRAW_PS3=m
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=m
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=m
CONFIG_HID_ALPS=m
# end of Special HID drivers

#
# I2C HID support
#
# CONFIG_I2C_HID_ACPI is not set
# end of I2C HID support

#
# Intel ISH HID support
#
CONFIG_INTEL_ISH_HID=y
CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER=y
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
# CONFIG_AMD_SFH_HID is not set
# end of AMD SFH HID Support

#
# Surface System Aggregator Module HID support
#
CONFIG_SURFACE_KBD=m
# end of Surface System Aggregator Module HID support

CONFIG_SURFACE_HID_CORE=m
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
# CONFIG_USB_ULPI_BUS is not set
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
# CONFIG_USB is not set
CONFIG_USB_PCI=y

#
# USB port drivers
#

#
# USB Physical Layer drivers
#
# CONFIG_NOP_USB_XCEIV is not set
# CONFIG_USB_GPIO_VBUS is not set
# CONFIG_TAHVO_USB is not set
# end of USB Physical Layer drivers

# CONFIG_USB_GADGET is not set
# CONFIG_TYPEC is not set
# CONFIG_USB_ROLE_SWITCH is not set
# CONFIG_MMC is not set
CONFIG_MEMSTICK=m
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
# CONFIG_MEMSTICK_JMICRON_38X is not set
CONFIG_MEMSTICK_R592=m
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
# CONFIG_LEDS_CLASS_FLASH is not set
CONFIG_LEDS_CLASS_MULTICOLOR=y
CONFIG_LEDS_BRIGHTNESS_HW_CHANGED=y

#
# LED drivers
#
CONFIG_LEDS_LM3530=m
CONFIG_LEDS_LM3532=m
CONFIG_LEDS_LM3533=m
CONFIG_LEDS_LM3642=m
# CONFIG_LEDS_MT6323 is not set
CONFIG_LEDS_PCA9532=m
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=m
CONFIG_LEDS_LP3944=m
# CONFIG_LEDS_LP3952 is not set
CONFIG_LEDS_LP50XX=m
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=m
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
CONFIG_LEDS_BD2802=m
CONFIG_LEDS_LT3593=y
CONFIG_LEDS_TCA6507=m
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_LM355x=m
CONFIG_LEDS_IS31FL319X=m

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=m
CONFIG_LEDS_MLXREG=m
CONFIG_LEDS_USER=m
# CONFIG_LEDS_NIC78BX is not set
CONFIG_LEDS_TI_LMU_COMMON=m
CONFIG_LEDS_LM36274=m

#
# Flash and Torch LED drivers
#

#
# RGB LED drivers
#
CONFIG_LEDS_PWM_MULTICOLOR=y

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=m
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
CONFIG_LEDS_TRIGGER_BACKLIGHT=m
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=m
CONFIG_LEDS_TRIGGER_GPIO=m
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
CONFIG_LEDS_TRIGGER_CAMERA=m
# CONFIG_LEDS_TRIGGER_PANIC is not set
CONFIG_LEDS_TRIGGER_NETDEV=m
# CONFIG_LEDS_TRIGGER_PATTERN is not set
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
# CONFIG_LEDS_SIEMENS_SIMATIC_IPC is not set
# CONFIG_ACCESSIBILITY is not set
CONFIG_INFINIBAND=m
CONFIG_INFINIBAND_USER_MAD=m
# CONFIG_INFINIBAND_USER_ACCESS is not set
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_VIRT_DMA=y
CONFIG_INFINIBAND_HFI1=m
# CONFIG_HFI1_DEBUG_SDMA_ORDER is not set
# CONFIG_SDMA_VERBOSITY is not set
# CONFIG_MLX4_INFINIBAND is not set
# CONFIG_INFINIBAND_MTHCA is not set
# CONFIG_INFINIBAND_OCRDMA is not set
CONFIG_INFINIBAND_QIB=m
CONFIG_INFINIBAND_RDMAVT=m
CONFIG_RDMA_RXE=m
CONFIG_RDMA_SIW=m
# CONFIG_INFINIBAND_IPOIB is not set
CONFIG_INFINIBAND_RTRS=m
CONFIG_INFINIBAND_RTRS_CLIENT=m
# CONFIG_INFINIBAND_RTRS_SERVER is not set
CONFIG_INFINIBAND_OPA_VNIC=m
CONFIG_EDAC_ATOMIC_SCRUB=y
CONFIG_EDAC_SUPPORT=y
CONFIG_EDAC=m
CONFIG_EDAC_LEGACY_SYSFS=y
# CONFIG_EDAC_DEBUG is not set
CONFIG_EDAC_E752X=m
CONFIG_EDAC_I82975X=m
CONFIG_EDAC_I3000=m
# CONFIG_EDAC_I3200 is not set
CONFIG_EDAC_IE31200=m
# CONFIG_EDAC_X38 is not set
# CONFIG_EDAC_I5400 is not set
# CONFIG_EDAC_I7CORE is not set
CONFIG_EDAC_I5000=m
CONFIG_EDAC_I5100=m
CONFIG_EDAC_I7300=m
# CONFIG_EDAC_SBRIDGE is not set
# CONFIG_EDAC_SKX is not set
# CONFIG_EDAC_I10NM is not set
# CONFIG_EDAC_PND2 is not set
# CONFIG_EDAC_IGEN6 is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
# CONFIG_RTC_CLASS is not set
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
# CONFIG_DMABUF_SELFTESTS is not set
# CONFIG_DMABUF_HEAPS is not set
CONFIG_DMABUF_SYSFS_STATS=y
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=m
CONFIG_HD44780_COMMON=y
# CONFIG_HD44780 is not set
CONFIG_IMG_ASCII_LCD=m
# CONFIG_HT16K33 is not set
CONFIG_LCD2S=m
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
# CONFIG_CHARLCD_BL_OFF is not set
# CONFIG_CHARLCD_BL_ON is not set
CONFIG_CHARLCD_BL_FLASH=y
CONFIG_PANEL=m
CONFIG_UIO=m
CONFIG_UIO_CIF=m
CONFIG_UIO_PDRV_GENIRQ=m
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_AEC=m
CONFIG_UIO_SERCOS3=m
CONFIG_UIO_PCI_GENERIC=m
# CONFIG_UIO_NETX is not set
# CONFIG_UIO_PRUSS is not set
CONFIG_UIO_MF624=m
# CONFIG_UIO_HV_GENERIC is not set
CONFIG_UIO_DFL=m
# CONFIG_VFIO is not set
CONFIG_VIRT_DRIVERS=y
CONFIG_VMGENID=y
CONFIG_VBOXGUEST=m
CONFIG_NITRO_ENCLAVES=y
# CONFIG_EFI_SECRET is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
# CONFIG_VDPA is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
CONFIG_HYPERV=m
CONFIG_HYPERV_TIMER=y
CONFIG_HYPERV_BALLOON=m
# end of Microsoft Hyper-V guest support

#
# Xen driver support
#
CONFIG_XEN_BALLOON=y
# CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is not set
CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=512
# CONFIG_XEN_SCRUB_PAGES_DEFAULT is not set
CONFIG_XEN_DEV_EVTCHN=y
# CONFIG_XEN_BACKEND is not set
CONFIG_XENFS=m
CONFIG_XEN_COMPAT_XENFS=y
# CONFIG_XEN_SYS_HYPERVISOR is not set
CONFIG_XEN_XENBUS_FRONTEND=y
CONFIG_XEN_GNTDEV=m
CONFIG_XEN_GRANT_DEV_ALLOC=y
# CONFIG_XEN_GRANT_DMA_ALLOC is not set
CONFIG_SWIOTLB_XEN=y
CONFIG_XEN_PVCALLS_FRONTEND=y
CONFIG_XEN_PRIVCMD=m
CONFIG_XEN_ACPI_PROCESSOR=m
# CONFIG_XEN_MCE_LOG is not set
CONFIG_XEN_HAVE_PVMMU=y
CONFIG_XEN_EFI=y
CONFIG_XEN_AUTO_XLATE=y
CONFIG_XEN_ACPI=y
# CONFIG_XEN_SYMS is not set
CONFIG_XEN_HAVE_VPMU=y
CONFIG_XEN_FRONT_PGDIR_SHBUF=m
# CONFIG_XEN_VIRTIO is not set
# end of Xen driver support

CONFIG_GREYBUS=y
# CONFIG_COMEDI is not set
CONFIG_STAGING=y
# CONFIG_RTLLIB is not set

#
# IIO staging drivers
#

#
# Accelerometers
#
# end of Accelerometers

#
# Analog to digital converters
#
# end of Analog to digital converters

#
# Analog digital bi-direction converters
#
CONFIG_ADT7316=m
# CONFIG_ADT7316_I2C is not set
# end of Analog digital bi-direction converters

#
# Capacitance to digital converters
#
CONFIG_AD7746=m
# end of Capacitance to digital converters

#
# Direct Digital Synthesis
#
# end of Direct Digital Synthesis

#
# Network Analyzer, Impedance Converters
#
CONFIG_AD5933=m
# end of Network Analyzer, Impedance Converters

#
# Active energy metering IC
#
CONFIG_ADE7854=m
CONFIG_ADE7854_I2C=m
# end of Active energy metering IC

#
# Resolver to digital converters
#
# end of Resolver to digital converters
# end of IIO staging drivers

# CONFIG_FB_SM750 is not set
# CONFIG_STAGING_MEDIA is not set
CONFIG_MOST_COMPONENTS=y
CONFIG_MOST_NET=m
CONFIG_MOST_VIDEO=m
CONFIG_MOST_I2C=m
# CONFIG_GREYBUS_AUDIO is not set
CONFIG_GREYBUS_BOOTROM=m
CONFIG_GREYBUS_HID=m
# CONFIG_GREYBUS_LIGHT is not set
CONFIG_GREYBUS_LOG=m
CONFIG_GREYBUS_LOOPBACK=m
CONFIG_GREYBUS_POWER=m
# CONFIG_GREYBUS_RAW is not set
CONFIG_GREYBUS_VIBRATOR=m
# CONFIG_GREYBUS_BRIDGED_PHY is not set
# CONFIG_FIELDBUS_DEV is not set
# CONFIG_QLGE is not set
# CONFIG_VME_BUS is not set
CONFIG_CHROME_PLATFORMS=y
# CONFIG_CHROMEOS_ACPI is not set
CONFIG_CHROMEOS_PSTORE=y
# CONFIG_CHROMEOS_TBMC is not set
# CONFIG_CROS_EC is not set
# CONFIG_CROS_KBD_LED_BACKLIGHT is not set
# CONFIG_CHROMEOS_PRIVACY_SCREEN is not set
CONFIG_MELLANOX_PLATFORM=y
CONFIG_MLXREG_HOTPLUG=m
CONFIG_MLXREG_IO=m
CONFIG_MLXREG_LC=m
CONFIG_NVSW_SN2201=m
CONFIG_SURFACE_PLATFORMS=y
CONFIG_SURFACE_3_POWER_OPREGION=m
CONFIG_SURFACE_ACPI_NOTIFY=m
CONFIG_SURFACE_AGGREGATOR_CDEV=m
CONFIG_SURFACE_DTX=m
CONFIG_SURFACE_HOTPLUG=y
CONFIG_SURFACE_PRO3_BUTTON=m
CONFIG_SURFACE_AGGREGATOR=m
# CONFIG_SURFACE_AGGREGATOR_BUS is not set
CONFIG_SURFACE_AGGREGATOR_ERROR_INJECTION=y
CONFIG_X86_PLATFORM_DEVICES=y
CONFIG_ACPI_WMI=m
CONFIG_WMI_BMOF=m
# CONFIG_MXM_WMI is not set
CONFIG_PEAQ_WMI=m
# CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
# CONFIG_XIAOMI_WMI is not set
CONFIG_GIGABYTE_WMI=m
# CONFIG_YOGABOOK_WMI is not set
CONFIG_ACERHDF=y
# CONFIG_ACER_WIRELESS is not set
CONFIG_ACER_WMI=m
CONFIG_ADV_SWBUTTON=m
CONFIG_APPLE_GMUX=m
CONFIG_ASUS_LAPTOP=m
# CONFIG_ASUS_WIRELESS is not set
# CONFIG_ASUS_TF103C_DOCK is not set
# CONFIG_MERAKI_MX100 is not set
CONFIG_X86_PLATFORM_DRIVERS_DELL=y
# CONFIG_ALIENWARE_WMI is not set
# CONFIG_DCDBAS is not set
# CONFIG_DELL_RBU is not set
# CONFIG_DELL_SMBIOS is not set
CONFIG_DELL_SMO8800=m
CONFIG_DELL_WMI_AIO=m
CONFIG_DELL_WMI_LED=m
CONFIG_FUJITSU_LAPTOP=m
CONFIG_FUJITSU_TABLET=y
CONFIG_GPD_POCKET_FAN=m
CONFIG_HP_ACCEL=m
# CONFIG_WIRELESS_HOTKEY is not set
CONFIG_HP_WMI=m
CONFIG_IBM_RTL=m
CONFIG_SENSORS_HDAPS=m
# CONFIG_THINKPAD_LMI is not set
CONFIG_INTEL_ATOMISP2_PDX86=y
CONFIG_INTEL_ATOMISP2_LED=m
CONFIG_INTEL_ATOMISP2_PM=m
CONFIG_INTEL_SAR_INT1092=m
CONFIG_INTEL_SKL_INT3472=m
CONFIG_INTEL_PMC_CORE=m
CONFIG_INTEL_PMT_CLASS=m
# CONFIG_INTEL_PMT_TELEMETRY is not set
CONFIG_INTEL_PMT_CRASHLOG=m

#
# Intel Speed Select Technology interface support
#
CONFIG_INTEL_SPEED_SELECT_INTERFACE=y
# end of Intel Speed Select Technology interface support

CONFIG_INTEL_TELEMETRY=m
CONFIG_INTEL_WMI=y
# CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
CONFIG_INTEL_WMI_THUNDERBOLT=m

#
# Intel Uncore Frequency Control
#
# CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
# end of Intel Uncore Frequency Control

CONFIG_INTEL_HID_EVENT=m
CONFIG_INTEL_VBTN=m
CONFIG_INTEL_INT0002_VGPIO=m
CONFIG_INTEL_ISHTP_ECLITE=y
# CONFIG_INTEL_MRFLD_PWRBTN is not set
CONFIG_INTEL_PUNIT_IPC=m
CONFIG_INTEL_RST=m
CONFIG_INTEL_SDSI=m
# CONFIG_INTEL_SMARTCONNECT is not set
# CONFIG_INTEL_TURBO_MAX_3 is not set
CONFIG_INTEL_VSEC=m
# CONFIG_MSI_WMI is not set
CONFIG_PCENGINES_APU2=m
# CONFIG_BARCO_P50_GPIO is not set
CONFIG_SAMSUNG_LAPTOP=m
CONFIG_SAMSUNG_Q10=m
# CONFIG_ACPI_TOSHIBA is not set
CONFIG_TOSHIBA_BT_RFKILL=m
CONFIG_TOSHIBA_HAPS=y
CONFIG_TOSHIBA_WMI=m
CONFIG_ACPI_CMPC=y
CONFIG_PANASONIC_LAPTOP=m
CONFIG_TOPSTAR_LAPTOP=y
CONFIG_MLX_PLATFORM=m
# CONFIG_INTEL_IPS is not set
CONFIG_INTEL_SCU_IPC=y
CONFIG_INTEL_SCU=y
# CONFIG_INTEL_SCU_PCI is not set
CONFIG_INTEL_SCU_PLATFORM=m
# CONFIG_INTEL_SCU_IPC_UTIL is not set
CONFIG_SIEMENS_SIMATIC_IPC=m
# CONFIG_WINMATE_FM07_KEYS is not set
CONFIG_P2SB=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y
# CONFIG_COMMON_CLK_MAX9485 is not set
# CONFIG_COMMON_CLK_SI5341 is not set
# CONFIG_COMMON_CLK_SI5351 is not set
CONFIG_COMMON_CLK_SI544=m
# CONFIG_COMMON_CLK_CDCE706 is not set
CONFIG_COMMON_CLK_TPS68470=m
# CONFIG_COMMON_CLK_CS2000_CP is not set
CONFIG_COMMON_CLK_PWM=m
CONFIG_XILINX_VCU=m
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_CLKEVT_I8253=y
CONFIG_I8253_LOCK=y
CONFIG_CLKBLD_I8253=y
# end of Clock Source drivers

CONFIG_MAILBOX=y
CONFIG_PCC=y
CONFIG_ALTERA_MBOX=m
CONFIG_IOMMU_IOVA=y
CONFIG_IOASID=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
# CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
CONFIG_IOMMU_DEFAULT_PASSTHROUGH=y
CONFIG_IOMMU_DMA=y
CONFIG_IOMMU_SVA=y
# CONFIG_AMD_IOMMU is not set
CONFIG_DMAR_TABLE=y
CONFIG_INTEL_IOMMU=y
CONFIG_INTEL_IOMMU_SVM=y
# CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
CONFIG_INTEL_IOMMU_FLOPPY_WA=y
CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=y
# CONFIG_IRQ_REMAP is not set
CONFIG_HYPERV_IOMMU=y
# CONFIG_VIRTIO_IOMMU is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
# CONFIG_RPMSG_QCOM_GLINK_RPM is not set
# CONFIG_RPMSG_VIRTIO is not set
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=m

#
# SoundWire Devices
#
# CONFIG_SOUNDWIRE_INTEL is not set
CONFIG_SOUNDWIRE_QCOM=m

#
# SOC (System On Chip) specific Drivers
#

#
# Amlogic SoC drivers
#
# end of Amlogic SoC drivers

#
# Broadcom SoC drivers
#
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# end of i.MX SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# end of Enable LiteX SoC Builder specific drivers

#
# Qualcomm SoC drivers
#
# end of Qualcomm SoC drivers

# CONFIG_SOC_TI is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=m

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=m
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
CONFIG_EXTCON_INTEL_INT3496=m
# CONFIG_EXTCON_INTEL_MRFLD is not set
CONFIG_EXTCON_MAX14577=m
CONFIG_EXTCON_MAX3355=m
CONFIG_EXTCON_PTN5150=m
# CONFIG_EXTCON_RT8973A is not set
CONFIG_EXTCON_SM5502=m
CONFIG_EXTCON_USB_GPIO=m
# CONFIG_EXTCON_USBC_TUSB320 is not set
CONFIG_MEMORY=y
CONFIG_FPGA_DFL_EMIF=m
CONFIG_IIO=m
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=m
CONFIG_IIO_BUFFER_DMAENGINE=m
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=m
CONFIG_IIO_TRIGGERED_BUFFER=m
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
# CONFIG_ADXL313_I2C is not set
# CONFIG_ADXL345_I2C is not set
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=m
CONFIG_ADXL372_I2C=m
CONFIG_BMA180=m
CONFIG_BMA400=m
CONFIG_BMA400_I2C=m
CONFIG_BMC150_ACCEL=m
CONFIG_BMC150_ACCEL_I2C=m
CONFIG_DA280=m
# CONFIG_DA311 is not set
CONFIG_DMARD06=m
CONFIG_DMARD09=m
CONFIG_DMARD10=m
CONFIG_FXLS8962AF=m
CONFIG_FXLS8962AF_I2C=m
CONFIG_HID_SENSOR_ACCEL_3D=m
CONFIG_IIO_ST_ACCEL_3AXIS=m
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_KXSD9=m
# CONFIG_KXSD9_I2C is not set
# CONFIG_KXCJK1013 is not set
# CONFIG_MC3230 is not set
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
CONFIG_MMA7660=m
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=m
CONFIG_MMA9551=m
# CONFIG_MMA9553 is not set
# CONFIG_MXC4005 is not set
# CONFIG_MXC6255 is not set
# CONFIG_STK8312 is not set
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
# CONFIG_AD7091R5 is not set
# CONFIG_AD7291 is not set
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD799X=m
CONFIG_CC10001_ADC=m
CONFIG_DA9150_GPADC=m
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_HX711=m
CONFIG_INA2XX_ADC=m
CONFIG_INTEL_MRFLD_ADC=m
CONFIG_LTC2471=m
CONFIG_LTC2485=m
# CONFIG_LTC2497 is not set
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
# CONFIG_MCP3422 is not set
CONFIG_MEDIATEK_MT6360_ADC=m
CONFIG_MEN_Z188_ADC=m
CONFIG_MP2629_ADC=m
CONFIG_NAU7802=m
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_SPMI_IADC=m
CONFIG_QCOM_SPMI_VADC=m
# CONFIG_QCOM_SPMI_ADC5 is not set
CONFIG_SD_ADC_MODULATOR=m
# CONFIG_TI_ADC081C is not set
# CONFIG_TI_ADS1015 is not set
CONFIG_VF610_ADC=m
# CONFIG_XILINX_XADC is not set
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
# CONFIG_ATLAS_EZO_SENSOR is not set
# CONFIG_BME680 is not set
# CONFIG_CCS811 is not set
CONFIG_IAQCORE=m
CONFIG_PMS7003=m
# CONFIG_SCD30_CORE is not set
CONFIG_SCD4X=m
CONFIG_SENSIRION_SGP30=m
CONFIG_SENSIRION_SGP40=m
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
CONFIG_SPS30_SERIAL=m
CONFIG_SENSEAIR_SUNRISE_CO2=m
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=m
CONFIG_HID_SENSOR_IIO_TRIGGER=m
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=m

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD5064=m
CONFIG_AD5380=m
CONFIG_AD5446=m
CONFIG_AD5592R_BASE=m
CONFIG_AD5593R=m
CONFIG_AD5686=m
CONFIG_AD5696_I2C=m
# CONFIG_DPOT_DAC is not set
# CONFIG_DS4424 is not set
CONFIG_M62332=m
CONFIG_MAX517=m
CONFIG_MAX5821=m
CONFIG_MCP4725=m
CONFIG_TI_DAC5571=m
# CONFIG_VF610_DAC is not set
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
CONFIG_IIO_SIMPLE_DUMMY_BUFFER=y
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=m
CONFIG_FXAS21002C_I2C=m
CONFIG_HID_SENSOR_GYRO_3D=m
CONFIG_MPU3050=m
CONFIG_MPU3050_I2C=m
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=m
CONFIG_MAX30100=m
# CONFIG_MAX30102 is not set
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
CONFIG_DHT11=m
# CONFIG_HDC100X is not set
# CONFIG_HDC2010 is not set
CONFIG_HID_SENSOR_HUMIDITY=m
CONFIG_HTS221=m
CONFIG_HTS221_I2C=m
CONFIG_HTU21=m
CONFIG_SI7005=m
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=m
CONFIG_BMI160_I2C=m
CONFIG_FXOS8700=m
CONFIG_FXOS8700_I2C=m
# CONFIG_KMX61 is not set
CONFIG_INV_ICM42600=m
CONFIG_INV_ICM42600_I2C=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
CONFIG_IIO_ST_LSM6DSX=m
CONFIG_IIO_ST_LSM6DSX_I2C=m
CONFIG_IIO_ST_LSM6DSX_I3C=m
CONFIG_IIO_ST_LSM9DS0=m
CONFIG_IIO_ST_LSM9DS0_I2C=m
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ACPI_ALS=m
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=m
CONFIG_AL3010=m
CONFIG_AL3320A=m
CONFIG_APDS9300=m
CONFIG_APDS9960=m
# CONFIG_AS73211 is not set
# CONFIG_BH1750 is not set
CONFIG_BH1780=m
CONFIG_CM32181=m
CONFIG_CM3232=m
CONFIG_CM3323=m
# CONFIG_CM3605 is not set
CONFIG_CM36651=m
CONFIG_GP2AP002=m
# CONFIG_GP2AP020A00F is not set
CONFIG_SENSORS_ISL29018=m
# CONFIG_SENSORS_ISL29028 is not set
# CONFIG_ISL29125 is not set
CONFIG_HID_SENSOR_ALS=m
CONFIG_HID_SENSOR_PROX=m
CONFIG_JSA1212=m
CONFIG_RPR0521=m
CONFIG_SENSORS_LM3533=m
# CONFIG_LTR501 is not set
CONFIG_LV0104CS=m
CONFIG_MAX44000=m
CONFIG_MAX44009=m
CONFIG_NOA1305=m
CONFIG_OPT3001=m
CONFIG_PA12203001=m
CONFIG_SI1133=m
CONFIG_SI1145=m
CONFIG_STK3310=m
# CONFIG_ST_UVIS25 is not set
CONFIG_TCS3414=m
CONFIG_TCS3472=m
# CONFIG_SENSORS_TSL2563 is not set
CONFIG_TSL2583=m
CONFIG_TSL2591=m
CONFIG_TSL2772=m
CONFIG_TSL4531=m
CONFIG_US5182D=m
CONFIG_VCNL4000=m
CONFIG_VCNL4035=m
CONFIG_VEML6030=m
CONFIG_VEML6070=m
# CONFIG_VL6180 is not set
CONFIG_ZOPT2201=m
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
# CONFIG_AK8975 is not set
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=m
CONFIG_BMC150_MAGN_I2C=m
CONFIG_MAG3110=m
CONFIG_HID_SENSOR_MAGNETOMETER_3D=m
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=m
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
CONFIG_SENSORS_HMC5843=m
CONFIG_SENSORS_HMC5843_I2C=m
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=m
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
# CONFIG_IIO_INTERRUPT_TRIGGER is not set
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
# CONFIG_AD5110 is not set
CONFIG_AD5272=m
# CONFIG_DS1803 is not set
CONFIG_MAX5432=m
# CONFIG_MCP4018 is not set
CONFIG_MCP4531=m
CONFIG_TPL0102=m
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_DLHL60D=m
CONFIG_DPS310=m
CONFIG_HID_SENSOR_PRESS=m
# CONFIG_HP03 is not set
CONFIG_ICP10100=m
CONFIG_MPL115=m
CONFIG_MPL115_I2C=m
CONFIG_MPL3115=m
# CONFIG_MS5611 is not set
CONFIG_MS5637=m
CONFIG_IIO_ST_PRESS=m
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_T5403=m
CONFIG_HP206C=m
# CONFIG_ZPA2326 is not set
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
# CONFIG_ISL29501 is not set
CONFIG_LIDAR_LITE_V2=m
# CONFIG_MB1232 is not set
CONFIG_PING=m
# CONFIG_RFD77402 is not set
# CONFIG_SRF04 is not set
CONFIG_SX_COMMON=m
CONFIG_SX9310=m
# CONFIG_SX9324 is not set
CONFIG_SX9360=m
# CONFIG_SX9500 is not set
# CONFIG_SRF08 is not set
CONFIG_VCNL3020=m
CONFIG_VL53L0X_I2C=m
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_HID_SENSOR_TEMP=m
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=m
CONFIG_TMP006=m
# CONFIG_TMP007 is not set
CONFIG_TMP117=m
# CONFIG_TSYS01 is not set
CONFIG_TSYS02D=m
# end of Temperature sensors

CONFIG_NTB=m
CONFIG_NTB_MSI=y
# CONFIG_NTB_AMD is not set
# CONFIG_NTB_IDT is not set
# CONFIG_NTB_INTEL is not set
CONFIG_NTB_EPF=m
# CONFIG_NTB_SWITCHTEC is not set
# CONFIG_NTB_PINGPONG is not set
CONFIG_NTB_TOOL=m
# CONFIG_NTB_PERF is not set
# CONFIG_NTB_MSI_TEST is not set
# CONFIG_NTB_TRANSPORT is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
# CONFIG_PWM_DEBUG is not set
CONFIG_PWM_CLK=m
CONFIG_PWM_DWC=m
CONFIG_PWM_LP3943=m
CONFIG_PWM_LPSS=y
CONFIG_PWM_LPSS_PCI=y
CONFIG_PWM_LPSS_PLATFORM=y
# CONFIG_PWM_PCA9685 is not set

#
# IRQ chip support
#
# end of IRQ chip support

CONFIG_IPACK_BUS=m
CONFIG_BOARD_TPCI200=m
CONFIG_SERIAL_IPOCTAL=m
# CONFIG_RESET_CONTROLLER is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=m

#
# PHY drivers for Broadcom platforms
#
# CONFIG_BCM_KONA_USB2_PHY is not set
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
# CONFIG_PHY_CPCAP_USB is not set
CONFIG_PHY_INTEL_LGM_EMMC=m
# end of PHY Subsystem

# CONFIG_POWERCAP is not set
CONFIG_MCB=y
# CONFIG_MCB_PCI is not set
# CONFIG_MCB_LPC is not set

#
# Performance monitor support
#
# end of Performance monitor support

CONFIG_RAS=y
# CONFIG_USB4 is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=y
# CONFIG_DEV_DAX is not set
# CONFIG_NVMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
CONFIG_STM_PROTO_BASIC=m
CONFIG_STM_PROTO_SYS_T=m
# CONFIG_STM_DUMMY is not set
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=m
# CONFIG_STM_SOURCE_FTRACE is not set
# CONFIG_INTEL_TH is not set
# end of HW tracing support

CONFIG_FPGA=m
# CONFIG_ALTERA_PR_IP_CORE is not set
CONFIG_FPGA_MGR_ALTERA_CVP=m
CONFIG_FPGA_BRIDGE=m
CONFIG_ALTERA_FREEZE_BRIDGE=m
CONFIG_XILINX_PR_DECOUPLER=m
CONFIG_FPGA_REGION=m
CONFIG_FPGA_DFL=m
CONFIG_FPGA_DFL_FME=m
# CONFIG_FPGA_DFL_FME_MGR is not set
CONFIG_FPGA_DFL_FME_BRIDGE=m
CONFIG_FPGA_DFL_FME_REGION=m
# CONFIG_FPGA_DFL_AFU is not set
CONFIG_FPGA_DFL_NIOS_INTEL_PAC_N3000=m
CONFIG_FPGA_DFL_PCI=m
CONFIG_MULTIPLEXER=m

#
# Multiplexer drivers
#
# CONFIG_MUX_ADG792A is not set
CONFIG_MUX_GPIO=m
# end of Multiplexer drivers

# CONFIG_SIOX is not set
# CONFIG_SLIMBUS is not set
# CONFIG_INTERCONNECT is not set
# CONFIG_COUNTER is not set
CONFIG_MOST=y
CONFIG_MOST_CDEV=y
CONFIG_MOST_SND=m
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_DCACHE_WORD_ACCESS=y
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
CONFIG_FS_VERITY_BUILTIN_SIGNATURES=y
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
CONFIG_FANOTIFY_ACCESS_PERMISSIONS=y
# CONFIG_QUOTA is not set
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
# CONFIG_OVERLAY_FS is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
# CONFIG_NETFS_STATS is not set
CONFIG_FSCACHE=m
# CONFIG_FSCACHE_STATS is not set
CONFIG_FSCACHE_DEBUG=y
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
# CONFIG_PROC_KCORE is not set
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_PROC_PID_ARCH_STATUS=y
CONFIG_PROC_CPU_RESCTRL=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP=y
# CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON is not set
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
CONFIG_EFIVAR_FS=m
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
CONFIG_ORANGEFS_FS=m
CONFIG_ECRYPT_FS=m
CONFIG_ECRYPT_FS_MESSAGING=y
CONFIG_CRAMFS=m
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
CONFIG_PSTORE_LZO_COMPRESS=m
CONFIG_PSTORE_LZ4_COMPRESS=y
CONFIG_PSTORE_LZ4HC_COMPRESS=m
CONFIG_PSTORE_842_COMPRESS=y
CONFIG_PSTORE_ZSTD_COMPRESS=y
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZO_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_ZSTD_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lzo"
CONFIG_PSTORE_CONSOLE=y
# CONFIG_PSTORE_PMSG is not set
# CONFIG_PSTORE_FTRACE is not set
# CONFIG_PSTORE_RAM is not set
CONFIG_VBOXSF_FS=m
CONFIG_NETWORK_FILESYSTEMS=y
CONFIG_NFS_FS=y
CONFIG_NFS_V2=y
CONFIG_NFS_V3=y
# CONFIG_NFS_V3_ACL is not set
CONFIG_NFS_V4=m
# CONFIG_NFS_V4_1 is not set
# CONFIG_ROOT_NFS is not set
# CONFIG_NFS_USE_LEGACY_DNS is not set
CONFIG_NFS_USE_KERNEL_DNS=y
CONFIG_NFS_DISABLE_UDP_SUPPORT=y
# CONFIG_NFSD is not set
CONFIG_GRACE_PERIOD=y
CONFIG_LOCKD=y
CONFIG_LOCKD_V4=y
CONFIG_NFS_COMMON=y
CONFIG_SUNRPC=y
CONFIG_SUNRPC_GSS=m
CONFIG_RPCSEC_GSS_KRB5=m
# CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
# CONFIG_SUNRPC_DEBUG is not set
CONFIG_SUNRPC_XPRT_RDMA=m
CONFIG_CEPH_FS=m
CONFIG_CEPH_FSCACHE=y
CONFIG_CEPH_FS_POSIX_ACL=y
# CONFIG_CEPH_FS_SECURITY_LABEL is not set
CONFIG_CIFS=m
# CONFIG_CIFS_STATS2 is not set
CONFIG_CIFS_ALLOW_INSECURE_LEGACY=y
# CONFIG_CIFS_UPCALL is not set
# CONFIG_CIFS_XATTR is not set
CONFIG_CIFS_DEBUG=y
CONFIG_CIFS_DEBUG2=y
CONFIG_CIFS_DEBUG_DUMP_KEYS=y
# CONFIG_CIFS_DFS_UPCALL is not set
CONFIG_CIFS_SWN_UPCALL=y
# CONFIG_CIFS_SMB_DIRECT is not set
CONFIG_CIFS_FSCACHE=y
# CONFIG_SMB_SERVER is not set
CONFIG_SMBFS_COMMON=m
CONFIG_CODA_FS=m
CONFIG_AFS_FS=m
CONFIG_AFS_DEBUG=y
CONFIG_AFS_FSCACHE=y
CONFIG_AFS_DEBUG_CURSOR=y
CONFIG_9P_FS=m
# CONFIG_9P_FSCACHE is not set
CONFIG_9P_FS_POSIX_ACL=y
CONFIG_9P_FS_SECURITY=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
CONFIG_NLS_CODEPAGE_737=y
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=m
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=y
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
# CONFIG_NLS_ISO8859_8 is not set
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=y
# CONFIG_NLS_ISO8859_1 is not set
CONFIG_NLS_ISO8859_2=m
# CONFIG_NLS_ISO8859_3 is not set
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=m
# CONFIG_NLS_ISO8859_6 is not set
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=m
CONFIG_NLS_MAC_GREEK=m
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
CONFIG_NLS_MAC_ROMANIAN=y
CONFIG_NLS_MAC_TURKISH=m
# CONFIG_NLS_UTF8 is not set
CONFIG_DLM=m
# CONFIG_DLM_DEPRECATED_API is not set
# CONFIG_DLM_DEBUG is not set
CONFIG_UNICODE=m
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
CONFIG_TRUSTED_KEYS=m
# CONFIG_TRUSTED_KEYS_TPM is not set

#
# No trust source selected!
#
CONFIG_ENCRYPTED_KEYS=m
CONFIG_USER_DECRYPTED_DATA=y
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
CONFIG_SECURITYFS=y
CONFIG_SECURITY_NETWORK=y
CONFIG_SECURITY_INFINIBAND=y
# CONFIG_SECURITY_NETWORK_XFRM is not set
CONFIG_SECURITY_PATH=y
# CONFIG_INTEL_TXT is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_SELINUX is not set
# CONFIG_SECURITY_SMACK is not set
# CONFIG_SECURITY_TOMOYO is not set
# CONFIG_SECURITY_APPARMOR is not set
CONFIG_SECURITY_YAMA=y
CONFIG_SECURITY_SAFESETID=y
# CONFIG_SECURITY_LOCKDOWN_LSM is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
# CONFIG_INTEGRITY_SIGNATURE is not set
CONFIG_INTEGRITY_AUDIT=y
CONFIG_IMA=y
CONFIG_IMA_MEASURE_PCR_IDX=10
# CONFIG_IMA_NG_TEMPLATE is not set
CONFIG_IMA_SIG_TEMPLATE=y
CONFIG_IMA_DEFAULT_TEMPLATE="ima-sig"
# CONFIG_IMA_DEFAULT_HASH_SHA1 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
# CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
CONFIG_IMA_DEFAULT_HASH_SM3=y
CONFIG_IMA_DEFAULT_HASH="sm3"
CONFIG_IMA_WRITE_POLICY=y
CONFIG_IMA_READ_POLICY=y
CONFIG_IMA_APPRAISE=y
# CONFIG_IMA_APPRAISE_BOOTPARAM is not set
CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=y
CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=y
# CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
# CONFIG_IMA_DISABLE_HTABLE is not set
# CONFIG_EVM is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=y
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_USER=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=m
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
# CONFIG_CRYPTO_TEST is not set
CONFIG_CRYPTO_SIMD=y

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=m
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=y
# CONFIG_CRYPTO_CURVE25519_X86 is not set

#
# Authenticated Encryption with Associated Data
#
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=m
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
CONFIG_CRYPTO_SEQIV=m
CONFIG_CRYPTO_ECHAINIV=y

#
# Block modes
#
CONFIG_CRYPTO_CBC=m
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=m
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=m
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_NHPOLY1305=y
CONFIG_CRYPTO_NHPOLY1305_SSE2=y
CONFIG_CRYPTO_NHPOLY1305_AVX2=m
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_HCTR2=m
CONFIG_CRYPTO_ESSIV=y

#
# Hash modes
#
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32C_INTEL=m
CONFIG_CRYPTO_CRC32=y
# CONFIG_CRYPTO_CRC32_PCLMUL is not set
# CONFIG_CRYPTO_XXHASH is not set
CONFIG_CRYPTO_BLAKE2B=y
CONFIG_CRYPTO_BLAKE2S_X86=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRCT10DIF_PCLMUL=m
CONFIG_CRYPTO_CRC64_ROCKSOFT=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLYVAL_CLMUL_NI=y
# CONFIG_CRYPTO_POLY1305 is not set
# CONFIG_CRYPTO_POLY1305_X86_64 is not set
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA1_SSSE3=y
CONFIG_CRYPTO_SHA256_SSSE3=m
# CONFIG_CRYPTO_SHA512_SSSE3 is not set
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=m
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=m
# CONFIG_CRYPTO_SM3_AVX_X86_64 is not set
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=m

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_AES_NI_INTEL=y
# CONFIG_CRYPTO_ANUBIS is not set
CONFIG_CRYPTO_ARC4=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_BLOWFISH_X86_64=m
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAMELLIA_X86_64=y
CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=y
# CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
# CONFIG_CRYPTO_CAST5_AVX_X86_64 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_CAST6_AVX_X86_64=y
CONFIG_CRYPTO_DES=m
CONFIG_CRYPTO_DES3_EDE_X86_64=m
CONFIG_CRYPTO_FCRYPT=m
CONFIG_CRYPTO_KHAZAD=m
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CHACHA20_X86_64=m
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_ARIA=m
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SERPENT_SSE2_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX_X86_64=y
CONFIG_CRYPTO_SERPENT_AVX2_X86_64=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
# CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
# CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_TWOFISH_COMMON=y
CONFIG_CRYPTO_TWOFISH_X86_64=y
CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=y
# CONFIG_CRYPTO_TWOFISH_AVX_X86_64 is not set

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=m
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=m
CONFIG_CRYPTO_ZSTD=y

#
# Random Number Generation
#
CONFIG_CRYPTO_ANSI_CPRNG=y
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
CONFIG_CRYPTO_DRBG_HASH=y
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_USER_API=y
# CONFIG_CRYPTO_USER_API_HASH is not set
CONFIG_CRYPTO_USER_API_SKCIPHER=y
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=m
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
CONFIG_CRYPTO_STATS=y
CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
CONFIG_PKCS7_MESSAGE_PARSER=y
# CONFIG_PKCS7_TEST_KEY is not set
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
# CONFIG_FIPS_SIGNATURE_SELFTEST is not set

#
# Certificates for signature checking
#
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
CONFIG_SYSTEM_EXTRA_CERTIFICATE=y
CONFIG_SYSTEM_EXTRA_CERTIFICATE_SIZE=4096
CONFIG_SECONDARY_TRUSTED_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
# CONFIG_SYSTEM_REVOCATION_LIST is not set
CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE=y
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_BLAKE2S=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=m
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=m
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=11
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_LIB_MEMNEQ=y
CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=m
CONFIG_CRC_ITU_T=m
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=m
CONFIG_CRC4=m
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=m
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=m
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
# CONFIG_XZ_DEC is not set
CONFIG_DECOMPRESS_GZIP=y
CONFIG_DECOMPRESS_BZIP2=y
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_LZO=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_INTERVAL_TREE=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=y
CONFIG_SWIOTLB=y
CONFIG_DMA_CMA=y
# CONFIG_DMA_PERNUMA_CMA is not set

#
# Default contiguous memory area size:
#
CONFIG_CMA_SIZE_MBYTES=0
CONFIG_CMA_SIZE_SEL_MBYTES=y
# CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
# CONFIG_CMA_SIZE_SEL_MIN is not set
# CONFIG_CMA_SIZE_SEL_MAX is not set
CONFIG_CMA_ALIGNMENT=8
# CONFIG_DMA_API_DEBUG is not set
CONFIG_DMA_MAP_BENCHMARK=y
CONFIG_SGL_ALLOC=y
CONFIG_CPUMASK_OFFSTACK=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_NLATTR=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UCS2_STRING=y
CONFIG_HAVE_GENERIC_VDSO=y
CONFIG_GENERIC_GETTIMEOFDAY=y
CONFIG_GENERIC_VDSO_TIME_NS=y
CONFIG_FONT_SUPPORT=y
CONFIG_FONT_8x16=y
CONFIG_FONT_AUTOSELECT=y
CONFIG_SG_POOL=y
CONFIG_ARCH_HAS_PMEM_API=y
CONFIG_MEMREGION=y
CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=y
CONFIG_ARCH_HAS_COPY_MC=y
CONFIG_ARCH_STACKWALK=y
CONFIG_STACKDEPOT=y
CONFIG_STACKDEPOT_ALWAYS_INIT=y
CONFIG_REF_TRACKER=y
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
# CONFIG_STACKTRACE_BUILD_ID is not set
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
# CONFIG_SYMBOLIC_ERRNAME is not set
CONFIG_DEBUG_BUGVERBOSE=y
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
CONFIG_DEBUG_INFO_DWARF4=y
# CONFIG_DEBUG_INFO_DWARF5 is not set
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_PAHOLE_HAS_BTF_TAG=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
# CONFIG_MODULE_ALLOW_BTF_MISMATCH is not set
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=8192
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_HEADERS_INSTALL is not set
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B=y
CONFIG_FRAME_POINTER=y
CONFIG_OBJTOOL=y
CONFIG_STACK_VALIDATION=y
CONFIG_NOINSTR_VALIDATION=y
CONFIG_VMLINUX_MAP=y
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
CONFIG_DEBUG_FS_ALLOW_ALL=y
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
# CONFIG_KGDB is not set
CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=y
CONFIG_UBSAN=y
# CONFIG_UBSAN_TRAP is not set
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ARRAY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set
# CONFIG_UBSAN_ALIGNMENT is not set
CONFIG_UBSAN_SANITIZE_ALL=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_ARCH_KCSAN=y
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
CONFIG_NET_DEV_REFCNT_TRACKER=y
CONFIG_NET_NS_REFCNT_TRACKER=y
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
CONFIG_SLUB_DEBUG=y
# CONFIG_SLUB_DEBUG_ON is not set
CONFIG_PAGE_OWNER=y
# CONFIG_PAGE_TABLE_CHECK is not set
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_RODATA_TEST is not set
CONFIG_ARCH_HAS_DEBUG_WX=y
# CONFIG_DEBUG_WX is not set
CONFIG_GENERIC_PTDUMP=y
# CONFIG_PTDUMP_DEBUGFS is not set
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SHRINKER_DEBUG=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_VM_PGTABLE is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP=y
# CONFIG_DEBUG_KMAP_LOCAL_FORCE_MAP is not set
CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_VMALLOC=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_KASAN_SW_TAGS=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
CONFIG_KASAN=y
CONFIG_KASAN_GENERIC=y
# CONFIG_KASAN_OUTLINE is not set
CONFIG_KASAN_INLINE=y
CONFIG_KASAN_STACK=y
CONFIG_KASAN_VMALLOC=y
# CONFIG_KASAN_MODULE_TEST is not set
CONFIG_HAVE_ARCH_KFENCE=y
# CONFIG_KFENCE is not set
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=y
# CONFIG_HARDLOCKUP_DETECTOR is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=480
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
# CONFIG_TEST_LOCKUP is not set
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
CONFIG_SCHED_DEBUG=y
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_BITS=15
CONFIG_LOCKDEP_CHAINS_BITS=16
CONFIG_LOCKDEP_STACK_TRACE_BITS=19
CONFIG_LOCKDEP_STACK_TRACE_HASH_BITS=14
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=m
# CONFIG_WW_MUTEX_SELFTEST is not set
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
CONFIG_TRACE_IRQFLAGS_NMI=y
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
# CONFIG_DEBUG_KOBJECT is not set

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
# CONFIG_PROVE_RCU_LIST is not set
CONFIG_TORTURE_TEST=m
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
# CONFIG_RCU_REF_SCALE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
CONFIG_LATENCYTOP=y
CONFIG_USER_STACKTRACE_SUPPORT=y
CONFIG_NOP_TRACER=y
CONFIG_HAVE_RETHOOK=y
CONFIG_RETHOOK=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_FENTRY=y
CONFIG_HAVE_OBJTOOL_MCOUNT=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_HAVE_BUILDTIME_MCOUNT_SORT=y
CONFIG_BUILDTIME_MCOUNT_SORT=y
CONFIG_TRACER_MAX_TRACE=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_GENERIC_TRACER=y
CONFIG_TRACING_SUPPORT=y
CONFIG_FTRACE=y
CONFIG_BOOTTIME_TRACING=y
CONFIG_FUNCTION_TRACER=y
# CONFIG_FUNCTION_GRAPH_TRACER is not set
CONFIG_DYNAMIC_FTRACE=y
CONFIG_DYNAMIC_FTRACE_WITH_REGS=y
CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=y
CONFIG_DYNAMIC_FTRACE_WITH_ARGS=y
# CONFIG_FPROBE is not set
# CONFIG_FUNCTION_PROFILER is not set
CONFIG_STACK_TRACER=y
# CONFIG_IRQSOFF_TRACER is not set
CONFIG_SCHED_TRACER=y
CONFIG_HWLAT_TRACER=y
CONFIG_OSNOISE_TRACER=y
CONFIG_TIMERLAT_TRACER=y
# CONFIG_MMIOTRACE is not set
# CONFIG_FTRACE_SYSCALLS is not set
CONFIG_TRACER_SNAPSHOT=y
# CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
CONFIG_BRANCH_PROFILE_NONE=y
# CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
CONFIG_KPROBE_EVENTS=y
# CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
CONFIG_UPROBE_EVENTS=y
CONFIG_BPF_EVENTS=y
CONFIG_DYNAMIC_EVENTS=y
CONFIG_PROBE_EVENTS=y
CONFIG_BPF_KPROBE_OVERRIDE=y
CONFIG_FTRACE_MCOUNT_RECORD=y
CONFIG_FTRACE_MCOUNT_USE_OBJTOOL=y
CONFIG_TRACING_MAP=y
CONFIG_SYNTH_EVENTS=y
CONFIG_HIST_TRIGGERS=y
CONFIG_TRACE_EVENT_INJECT=y
# CONFIG_TRACEPOINT_BENCHMARK is not set
CONFIG_RING_BUFFER_BENCHMARK=m
# CONFIG_TRACE_EVAL_MAP_FILE is not set
# CONFIG_FTRACE_RECORD_RECURSION is not set
# CONFIG_FTRACE_STARTUP_TEST is not set
# CONFIG_FTRACE_SORT_STARTUP_TEST is not set
# CONFIG_RING_BUFFER_STARTUP_TEST is not set
CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS=y
# CONFIG_PREEMPTIRQ_DELAY_TEST is not set
# CONFIG_SYNTH_EVENT_GEN_TEST is not set
# CONFIG_KPROBE_EVENT_GEN_TEST is not set
CONFIG_HIST_TRIGGERS_DEBUG=y
# CONFIG_RV is not set
# CONFIG_PROVIDE_OHCI1394_DMA_INIT is not set
# CONFIG_SAMPLES is not set
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=y
CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=y
CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=y
# CONFIG_STRICT_DEVMEM is not set

#
# x86 Debugging
#
CONFIG_EARLY_PRINTK_USB=y
CONFIG_X86_VERBOSE_BOOTUP=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_PRINTK_DBGP=y
CONFIG_EARLY_PRINTK_USB_XDBC=y
# CONFIG_EFI_PGT_DUMP is not set
CONFIG_DEBUG_TLBFLUSH=y
CONFIG_HAVE_MMIOTRACE_SUPPORT=y
# CONFIG_X86_DECODER_SELFTEST is not set
# CONFIG_IO_DELAY_0X80 is not set
# CONFIG_IO_DELAY_0XED is not set
CONFIG_IO_DELAY_UDELAY=y
# CONFIG_IO_DELAY_NONE is not set
CONFIG_DEBUG_BOOT_PARAMS=y
# CONFIG_CPA_DEBUG is not set
CONFIG_DEBUG_ENTRY=y
# CONFIG_DEBUG_NMI_SELFTEST is not set
CONFIG_X86_DEBUG_FPU=y
CONFIG_PUNIT_ATOM_DEBUG=y
# CONFIG_UNWINDER_ORC is not set
CONFIG_UNWINDER_FRAME_POINTER=y
# end of x86 Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
CONFIG_FUNCTION_ERROR_INJECTION=y
# CONFIG_FAULT_INJECTION is not set
CONFIG_ARCH_HAS_KCOV=y
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_KCOV=y
CONFIG_KCOV_ENABLE_COMPARISONS=y
CONFIG_KCOV_INSTRUMENT_ALL=y
CONFIG_KCOV_IRQ_AREA_SIZE=0x40000
# CONFIG_RUNTIME_TESTING_MENU is not set
CONFIG_ARCH_USE_MEMTEST=y
# CONFIG_MEMTEST is not set
CONFIG_HYPERV_TESTING=y
# end of Kernel Testing and Coverage
# end of Kernel hacking

--500iYcF3XOHOWim/--
