Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254B4BA24;
	Mon, 13 Feb 2023 22:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676326900; x=1707862900;
  h=date:from:cc:subject:message-id:mime-version;
  bh=7d5aGJsFTe3aoi+NAvRrQGLBE3evLVlF3hByEC5OKQU=;
  b=iehuJf7HCLCF53ppsaK0p1OVnfapZFhDzdRxH21MrdRwv9zKrg/sL1oD
   g7eBAzPZSanQ2dFIYaS4ae+0q93u+cJMn3T2ZP/qTHcECW7lweo/mfmfe
   tBhJHNkOfQbKP0J9XozsjDmA2xTmjiBgY5B5vaNlyWg6vHEbDKDPvNXoO
   VCc0klwTR9yQ1G1PW5VnWniLdaaMugE2ODhPKExgKBo67Do4ScsHX0oWL
   tOhWrmeq0g1AjYFCJbcJvbt0xBF/Uwk1rL1t+U3G4hSdlwqCZi9NyR7mY
   fCiqVNMho0s+kgPDxA1nYa4JA7CoKnjJK1+TNrEIFv+TEAn2ET5+DTMZR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="329642912"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="329642912"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 14:21:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701435911"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="701435911"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 14:21:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRhCa-00082l-2N;
	Mon, 13 Feb 2023 22:21:36 +0000
Date: Tue, 14 Feb 2023 06:21:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 8081/9999] mm/vmscan.o: warning: objtool:
 shrink_lruvec()+0x974: sibling call from callable instruction with modified
 stack frame
Message-ID: <202302140601.dtz0tVIG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Johannes Weiner <hannes@cmpxchg.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Rik van Riel <riel@surriel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   85d7786c66b69d3f07cc149ac2f78d8f330c7c11
commit: 7b3c9405b2729ce70ac6826575d1559cb5ac4725 [8081/9999] mm: vmscan: fix extreme overreclaim and swap floods
config: x86_64-randconfig-r005-20230213 (https://download.01.org/0day-ci/archive/20230214/202302140601.dtz0tVIG-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=7b3c9405b2729ce70ac6826575d1559cb5ac4725
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 7b3c9405b2729ce70ac6826575d1559cb5ac4725
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140601.dtz0tVIG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_lruvec()+0x974: sibling call from callable instruction with modified stack frame


objdump-func vmlinux.o shrink_lruvec:
0000 00000000006dff00 <shrink_lruvec>:
0000   6dff00:	55                   	push   %rbp
0001   6dff01:	48 89 e5             	mov    %rsp,%rbp
0004   6dff04:	41 57                	push   %r15
0006   6dff06:	41 56                	push   %r14
0008   6dff08:	41 55                	push   %r13
000a   6dff0a:	41 54                	push   %r12
000c   6dff0c:	53                   	push   %rbx
000d   6dff0d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
0011   6dff11:	48 81 ec 20 02 00 00 	sub    $0x220,%rsp
0018   6dff18:	48 89 f3             	mov    %rsi,%rbx
001b   6dff1b:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
0020   6dff20:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
002a   6dff2a:	e8 00 00 00 00       	call   6dff2f <shrink_lruvec+0x2f>	6dff2b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
002f   6dff2f:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
0037   6dff37:	ba 28 00 00 00       	mov    $0x28,%edx
003c   6dff3c:	31 f6                	xor    %esi,%esi
003e   6dff3e:	e8 00 00 00 00       	call   6dff43 <shrink_lruvec+0x43>	6dff3f: R_X86_64_PLT32	memset-0x4
0043   6dff43:	48 8d bc 24 80 01 00 00 	lea    0x180(%rsp),%rdi
004b   6dff4b:	ba 28 00 00 00       	mov    $0x28,%edx
0050   6dff50:	31 f6                	xor    %esi,%esi
0052   6dff52:	e8 00 00 00 00       	call   6dff57 <shrink_lruvec+0x57>	6dff53: R_X86_64_PLT32	memset-0x4
0057   6dff57:	48 89 d8             	mov    %rbx,%rax
005a   6dff5a:	48 c1 e8 03          	shr    $0x3,%rax
005e   6dff5e:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0063   6dff63:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
0068   6dff68:	74 0d                	je     6dff77 <shrink_lruvec+0x77>
006a   6dff6a:	48 89 df             	mov    %rbx,%rdi
006d   6dff6d:	e8 00 00 00 00       	call   6dff72 <shrink_lruvec+0x72>	6dff6e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0072   6dff72:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
0077   6dff77:	48 8b 03             	mov    (%rbx),%rax
007a   6dff7a:	48 89 84 24 b0 01 00 00 	mov    %rax,0x1b0(%rsp)
0082   6dff82:	48 8d bc 24 f0 01 00 00 	lea    0x1f0(%rsp),%rdi
008a   6dff8a:	ba 28 00 00 00       	mov    $0x28,%edx
008f   6dff8f:	31 f6                	xor    %esi,%esi
0091   6dff91:	e8 00 00 00 00       	call   6dff96 <shrink_lruvec+0x96>	6dff92: R_X86_64_PLT32	memset-0x4
0096   6dff96:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6dff99: R_X86_64_32S	memory_cgrp_subsys_enabled_key
009d   6dff9d:	48 c1 e8 03          	shr    $0x3,%rax
00a1   6dffa1:	42 8a 04 30          	mov    (%rax,%r14,1),%al
00a5   6dffa5:	84 c0                	test   %al,%al
00a7   6dffa7:	0f 85 43 29 00 00    	jne    6e28f0 <shrink_lruvec+0x29f0>
00ad   6dffad:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6dffb3 <shrink_lruvec+0xb3>	6dffaf: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
00b3   6dffb3:	bf 01 00 00 00       	mov    $0x1,%edi
00b8   6dffb8:	89 de                	mov    %ebx,%esi
00ba   6dffba:	e8 00 00 00 00       	call   6dffbf <shrink_lruvec+0xbf>	6dffbb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00bf   6dffbf:	85 db                	test   %ebx,%ebx
00c1   6dffc1:	7e 2c                	jle    6dffef <shrink_lruvec+0xef>
00c3   6dffc3:	e8 00 00 00 00       	call   6dffc8 <shrink_lruvec+0xc8>	6dffc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00c8   6dffc8:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
00cd   6dffcd:	48 8d 98 00 04 00 00 	lea    0x400(%rax),%rbx
00d4   6dffd4:	48 89 d8             	mov    %rbx,%rax
00d7   6dffd7:	48 c1 e8 03          	shr    $0x3,%rax
00db   6dffdb:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
00e0   6dffe0:	74 08                	je     6dffea <shrink_lruvec+0xea>
00e2   6dffe2:	48 89 df             	mov    %rbx,%rdi
00e5   6dffe5:	e8 00 00 00 00       	call   6dffea <shrink_lruvec+0xea>	6dffe6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ea   6dffea:	4c 8b 23             	mov    (%rbx),%r12
00ed   6dffed:	eb 08                	jmp    6dfff7 <shrink_lruvec+0xf7>
00ef   6dffef:	e8 00 00 00 00       	call   6dfff4 <shrink_lruvec+0xf4>	6dfff0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00f4   6dfff4:	45 31 e4             	xor    %r12d,%r12d
00f7   6dfff7:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6dfffa: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
00fe   6dfffe:	48 c1 e8 03          	shr    $0x3,%rax
0102   6e0002:	42 8a 04 30          	mov    (%rax,%r14,1),%al
0106   6e0006:	84 c0                	test   %al,%al
0108   6e0008:	0f 85 08 29 00 00    	jne    6e2916 <shrink_lruvec+0x2a16>
010e   6e000e:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e0014 <shrink_lruvec+0x114>	6e0010: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
0114   6e0014:	31 ff                	xor    %edi,%edi
0116   6e0016:	89 de                	mov    %ebx,%esi
0118   6e0018:	e8 00 00 00 00       	call   6e001d <shrink_lruvec+0x11d>	6e0019: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
011d   6e001d:	85 db                	test   %ebx,%ebx
011f   6e001f:	0f 8e 52 28 00 00    	jle    6e2877 <shrink_lruvec+0x2977>
0125   6e0025:	e8 00 00 00 00       	call   6e002a <shrink_lruvec+0x12a>	6e0026: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
012a   6e002a:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6e002d: R_X86_64_32S	vm_swappiness
0131   6e0031:	48 89 d8             	mov    %rbx,%rax
0134   6e0034:	48 c1 e8 03          	shr    $0x3,%rax
0138   6e0038:	42 8a 04 30          	mov    (%rax,%r14,1),%al
013c   6e003c:	84 c0                	test   %al,%al
013e   6e003e:	4d 89 f7             	mov    %r14,%r15
0141   6e0041:	0f 85 f5 28 00 00    	jne    6e293c <shrink_lruvec+0x2a3c>
0147   6e0047:	4c 63 33             	movslq (%rbx),%r14
014a   6e004a:	48 8d bc 24 90 00 00 00 	lea    0x90(%rsp),%rdi
0152   6e0052:	ba 10 00 00 00       	mov    $0x10,%edx
0157   6e0057:	31 f6                	xor    %esi,%esi
0159   6e0059:	e8 00 00 00 00       	call   6e005e <shrink_lruvec+0x15e>	6e005a: R_X86_64_PLT32	memset-0x4
015e   6e005e:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0163   6e0063:	4c 8d 68 28          	lea    0x28(%rax),%r13
0167   6e0067:	4c 89 e8             	mov    %r13,%rax
016a   6e006a:	48 c1 e8 03          	shr    $0x3,%rax
016e   6e006e:	48 89 84 24 d8 00 00 00 	mov    %rax,0xd8(%rsp)
0176   6e0076:	42 8a 04 38          	mov    (%rax,%r15,1),%al
017a   6e007a:	84 c0                	test   %al,%al
017c   6e007c:	0f 85 d7 28 00 00    	jne    6e2959 <shrink_lruvec+0x2a59>
0182   6e0082:	41 0f b7 5d 00       	movzwl 0x0(%r13),%ebx
0187   6e0087:	89 de                	mov    %ebx,%esi
0189   6e0089:	83 e6 40             	and    $0x40,%esi
018c   6e008c:	31 ff                	xor    %edi,%edi
018e   6e008e:	e8 00 00 00 00       	call   6e0093 <shrink_lruvec+0x193>	6e008f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0193   6e0093:	83 e3 40             	and    $0x40,%ebx
0196   6e0096:	75 0a                	jne    6e00a2 <shrink_lruvec+0x1a2>
0198   6e0098:	e8 00 00 00 00       	call   6e009d <shrink_lruvec+0x19d>	6e0099: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
019d   6e009d:	e9 2f 02 00 00       	jmp    6e02d1 <shrink_lruvec+0x3d1>
01a2   6e00a2:	4d 85 e4             	test   %r12,%r12
01a5   6e00a5:	74 25                	je     6e00cc <shrink_lruvec+0x1cc>
01a7   6e00a7:	4c 89 e7             	mov    %r12,%rdi
01aa   6e00aa:	e8 00 00 00 00       	call   6e00af <shrink_lruvec+0x1af>	6e00ab: R_X86_64_PLT32	mem_cgroup_get_nr_swap_pages-0x4
01af   6e00af:	48 89 c3             	mov    %rax,%rbx
01b2   6e00b2:	31 ff                	xor    %edi,%edi
01b4   6e00b4:	48 89 c6             	mov    %rax,%rsi
01b7   6e00b7:	e8 00 00 00 00       	call   6e00bc <shrink_lruvec+0x1bc>	6e00b8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01bc   6e00bc:	48 85 db             	test   %rbx,%rbx
01bf   6e00bf:	0f 8e f6 00 00 00    	jle    6e01bb <shrink_lruvec+0x2bb>
01c5   6e00c5:	e8 00 00 00 00       	call   6e00ca <shrink_lruvec+0x1ca>	6e00c6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01ca   6e00ca:	eb 57                	jmp    6e0123 <shrink_lruvec+0x223>
01cc   6e00cc:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6e00cf: R_X86_64_32S	nr_swap_pages
01d3   6e00d3:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e00d6: R_X86_64_32S	nr_swap_pages
01da   6e00da:	be 08 00 00 00       	mov    $0x8,%esi
01df   6e00df:	e8 00 00 00 00       	call   6e00e4 <shrink_lruvec+0x1e4>	6e00e0: R_X86_64_PLT32	__kasan_check_read-0x4
01e4   6e00e4:	48 c1 eb 03          	shr    $0x3,%rbx
01e8   6e00e8:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
01f2   6e00f2:	80 3c 03 00          	cmpb   $0x0,(%rbx,%rax,1)
01f6   6e00f6:	74 0c                	je     6e0104 <shrink_lruvec+0x204>
01f8   6e00f8:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e00fb: R_X86_64_32S	nr_swap_pages
01ff   6e00ff:	e8 00 00 00 00       	call   6e0104 <shrink_lruvec+0x204>	6e0100: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0204   6e0104:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 6e010b <shrink_lruvec+0x20b>	6e0107: R_X86_64_PC32	nr_swap_pages-0x4
020b   6e010b:	31 ff                	xor    %edi,%edi
020d   6e010d:	48 89 de             	mov    %rbx,%rsi
0210   6e0110:	e8 00 00 00 00       	call   6e0115 <shrink_lruvec+0x215>	6e0111: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0215   6e0115:	48 85 db             	test   %rbx,%rbx
0218   6e0118:	0f 8e 9b 01 00 00    	jle    6e02b9 <shrink_lruvec+0x3b9>
021e   6e011e:	e8 00 00 00 00       	call   6e0123 <shrink_lruvec+0x223>	6e011f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0223   6e0123:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0228   6e0128:	48 8d 58 10          	lea    0x10(%rax),%rbx
022c   6e012c:	48 89 d8             	mov    %rbx,%rax
022f   6e012f:	48 c1 e8 03          	shr    $0x3,%rax
0233   6e0133:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
023d   6e013d:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0241   6e0141:	74 08                	je     6e014b <shrink_lruvec+0x24b>
0243   6e0143:	48 89 df             	mov    %rbx,%rdi
0246   6e0146:	e8 00 00 00 00       	call   6e014b <shrink_lruvec+0x24b>	6e0147: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
024b   6e014b:	48 8b 1b             	mov    (%rbx),%rbx
024e   6e014e:	31 ff                	xor    %edi,%edi
0250   6e0150:	44 89 f6             	mov    %r14d,%esi
0253   6e0153:	e8 00 00 00 00       	call   6e0158 <shrink_lruvec+0x258>	6e0154: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0258   6e0158:	48 85 db             	test   %rbx,%rbx
025b   6e015b:	74 0f                	je     6e016c <shrink_lruvec+0x26c>
025d   6e015d:	45 85 f6             	test   %r14d,%r14d
0260   6e0160:	75 0a                	jne    6e016c <shrink_lruvec+0x26c>
0262   6e0162:	e8 00 00 00 00       	call   6e0167 <shrink_lruvec+0x267>	6e0163: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0267   6e0167:	e9 65 01 00 00       	jmp    6e02d1 <shrink_lruvec+0x3d1>
026c   6e016c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0271   6e0171:	48 8d 58 2b          	lea    0x2b(%rax),%rbx
0275   6e0175:	48 89 d8             	mov    %rbx,%rax
0278   6e0178:	48 c1 e8 03          	shr    $0x3,%rax
027c   6e017c:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0286   6e0186:	8a 04 08             	mov    (%rax,%rcx,1),%al
0289   6e0189:	84 c0                	test   %al,%al
028b   6e018b:	0f 85 69 28 00 00    	jne    6e29fa <shrink_lruvec+0x2afa>
0291   6e0191:	0f b6 1b             	movzbl (%rbx),%ebx
0294   6e0194:	31 ff                	xor    %edi,%edi
0296   6e0196:	89 de                	mov    %ebx,%esi
0298   6e0198:	e8 00 00 00 00       	call   6e019d <shrink_lruvec+0x29d>	6e0199: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
029d   6e019d:	85 db                	test   %ebx,%ebx
029f   6e019f:	75 24                	jne    6e01c5 <shrink_lruvec+0x2c5>
02a1   6e01a1:	45 85 f6             	test   %r14d,%r14d
02a4   6e01a4:	74 1f                	je     6e01c5 <shrink_lruvec+0x2c5>
02a6   6e01a6:	e8 00 00 00 00       	call   6e01ab <shrink_lruvec+0x2ab>	6e01a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02ab   6e01ab:	31 f6                	xor    %esi,%esi
02ad   6e01ad:	31 c0                	xor    %eax,%eax
02af   6e01af:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
02b4   6e01b4:	31 c0                	xor    %eax,%eax
02b6   6e01b6:	e9 27 01 00 00       	jmp    6e02e2 <shrink_lruvec+0x3e2>
02bb   6e01bb:	e8 00 00 00 00       	call   6e01c0 <shrink_lruvec+0x2c0>	6e01bc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02c0   6e01c0:	e9 0c 01 00 00       	jmp    6e02d1 <shrink_lruvec+0x3d1>
02c5   6e01c5:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02cf   6e01cf:	48 8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%rcx
02d7   6e01d7:	8a 04 01             	mov    (%rcx,%rax,1),%al
02da   6e01da:	84 c0                	test   %al,%al
02dc   6e01dc:	0f 85 32 28 00 00    	jne    6e2a14 <shrink_lruvec+0x2b14>
02e2   6e01e2:	41 0f b7 5d 00       	movzwl 0x0(%r13),%ebx
02e7   6e01e7:	89 de                	mov    %ebx,%esi
02e9   6e01e9:	81 e6 00 10 00 00    	and    $0x1000,%esi
02ef   6e01ef:	31 c0                	xor    %eax,%eax
02f1   6e01f1:	48 89 44 24 28       	mov    %rax,0x28(%rsp)
02f6   6e01f6:	31 ff                	xor    %edi,%edi
02f8   6e01f8:	e8 00 00 00 00       	call   6e01fd <shrink_lruvec+0x2fd>	6e01f9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
02fd   6e01fd:	89 d8                	mov    %ebx,%eax
02ff   6e01ff:	25 00 10 00 00       	and    $0x1000,%eax
0304   6e0204:	0f 85 b6 00 00 00    	jne    6e02c0 <shrink_lruvec+0x3c0>
030a   6e020a:	81 e3 00 08 00 00    	and    $0x800,%ebx
0310   6e0210:	31 ff                	xor    %edi,%edi
0312   6e0212:	89 de                	mov    %ebx,%esi
0314   6e0214:	e8 00 00 00 00       	call   6e0219 <shrink_lruvec+0x319>	6e0215: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
0319   6e0219:	85 db                	test   %ebx,%ebx
031b   6e021b:	0f 85 ab 00 00 00    	jne    6e02cc <shrink_lruvec+0x3cc>
0321   6e0221:	e8 00 00 00 00       	call   6e0226 <shrink_lruvec+0x326>	6e0222: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0326   6e0226:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
032b   6e022b:	48 8d 7a 18          	lea    0x18(%rdx),%rdi
032f   6e022f:	48 89 f8             	mov    %rdi,%rax
0332   6e0232:	48 c1 e8 03          	shr    $0x3,%rax
0336   6e0236:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0340   6e0240:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0344   6e0244:	74 0a                	je     6e0250 <shrink_lruvec+0x350>
0346   6e0246:	e8 00 00 00 00       	call   6e024b <shrink_lruvec+0x34b>	6e0247: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
034b   6e024b:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0350   6e0250:	4c 8b 7a 18          	mov    0x18(%rdx),%r15
0354   6e0254:	48 8d 5a 20          	lea    0x20(%rdx),%rbx
0358   6e0258:	48 89 d8             	mov    %rbx,%rax
035b   6e025b:	48 c1 e8 03          	shr    $0x3,%rax
035f   6e025f:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0369   6e0269:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
036d   6e026d:	74 08                	je     6e0277 <shrink_lruvec+0x377>
036f   6e026f:	48 89 df             	mov    %rbx,%rdi
0372   6e0272:	e8 00 00 00 00       	call   6e0277 <shrink_lruvec+0x377>	6e0273: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0377   6e0277:	48 8b 03             	mov    (%rbx),%rax
037a   6e027a:	4a 8d 14 38          	lea    (%rax,%r15,1),%rdx
037e   6e027e:	4a 8d 0c 3a          	lea    (%rdx,%r15,1),%rcx
0382   6e0282:	48 8d 34 10          	lea    (%rax,%rdx,1),%rsi
0386   6e0286:	48 83 c6 01          	add    $0x1,%rsi
038a   6e028a:	48 01 f1             	add    %rsi,%rcx
038d   6e028d:	48 89 c8             	mov    %rcx,%rax
0390   6e0290:	49 0f af c6          	imul   %r14,%rax
0394   6e0294:	49 8d 3c 17          	lea    (%r15,%rdx,1),%rdi
0398   6e0298:	48 83 c7 01          	add    $0x1,%rdi
039c   6e029c:	48 89 c2             	mov    %rax,%rdx
039f   6e029f:	48 09 fa             	or     %rdi,%rdx
03a2   6e02a2:	48 c1 ea 20          	shr    $0x20,%rdx
03a6   6e02a6:	0f 84 20 25 00 00    	je     6e27cc <shrink_lruvec+0x28cc>
03ac   6e02ac:	31 d2                	xor    %edx,%edx
03ae   6e02ae:	48 f7 f7             	div    %rdi
03b1   6e02b1:	48 89 c7             	mov    %rax,%rdi
03b4   6e02b4:	e9 19 25 00 00       	jmp    6e27d2 <shrink_lruvec+0x28d2>
03b9   6e02b9:	e8 00 00 00 00       	call   6e02be <shrink_lruvec+0x3be>	6e02ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03be   6e02be:	eb 11                	jmp    6e02d1 <shrink_lruvec+0x3d1>
03c0   6e02c0:	e8 00 00 00 00       	call   6e02c5 <shrink_lruvec+0x3c5>	6e02c1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03c5   6e02c5:	b8 02 00 00 00       	mov    $0x2,%eax
03ca   6e02ca:	eb 14                	jmp    6e02e0 <shrink_lruvec+0x3e0>
03cc   6e02cc:	e8 00 00 00 00       	call   6e02d1 <shrink_lruvec+0x3d1>	6e02cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03d1   6e02d1:	b8 03 00 00 00       	mov    $0x3,%eax
03d6   6e02d6:	b9 01 00 00 00       	mov    $0x1,%ecx
03db   6e02db:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
03e0   6e02e0:	31 f6                	xor    %esi,%esi
03e2   6e02e2:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
03ec   6e02ec:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
03f1   6e02f1:	4c 8d b9 c8 00 00 00 	lea    0xc8(%rcx),%r15
03f8   6e02f8:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
03fd   6e02fd:	48 8d 7a 2c          	lea    0x2c(%rdx),%rdi
0401   6e0301:	48 8d 4a 10          	lea    0x10(%rdx),%rcx
0405   6e0305:	48 89 8c 24 80 00 00 00 	mov    %rcx,0x80(%rsp)
040d   6e030d:	49 8d 8c 24 58 01 00 00 	lea    0x158(%r12),%rcx
0415   6e0315:	48 89 8c 24 c8 00 00 00 	mov    %rcx,0xc8(%rsp)
041d   6e031d:	49 8d 8c 24 70 01 00 00 	lea    0x170(%r12),%rcx
0425   6e0325:	48 89 8c 24 30 01 00 00 	mov    %rcx,0x130(%rsp)
042d   6e032d:	48 8d 4a 2b          	lea    0x2b(%rdx),%rcx
0431   6e0331:	48 89 8c 24 c0 00 00 00 	mov    %rcx,0xc0(%rsp)
0439   6e0339:	49 8d 4c 24 54       	lea    0x54(%r12),%rcx
043e   6e033e:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
0443   6e0343:	48 89 b4 24 28 01 00 00 	mov    %rsi,0x128(%rsp)
044b   6e034b:	48 8d 4e ff          	lea    -0x1(%rsi),%rcx
044f   6e034f:	48 89 8c 24 60 01 00 00 	mov    %rcx,0x160(%rsp)
0457   6e0357:	b9 08 06 00 00       	mov    $0x608,%ecx
045c   6e035c:	48 89 4c 24 60       	mov    %rcx,0x60(%rsp)
0461   6e0361:	48 89 f9             	mov    %rdi,%rcx
0464   6e0364:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
0469   6e0369:	48 c1 ef 03          	shr    $0x3,%rdi
046d   6e036d:	48 89 bc 24 f0 00 00 00 	mov    %rdi,0xf0(%rsp)
0475   6e0375:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e0378: R_X86_64_32S	memory_cgrp_subsys_enabled_key
047c   6e037c:	48 c1 e9 03          	shr    $0x3,%rcx
0480   6e0380:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
0485   6e0385:	89 c0                	mov    %eax,%eax
0487   6e0387:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
048f   6e038f:	48 8b 04 c5 00 00 00 00 	mov    0x0(,%rax,8),%rax	6e0393: R_X86_64_32S	.rodata+0x48ff40
0497   6e0397:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
049c   6e039c:	31 db                	xor    %ebx,%ebx
049e   6e039e:	4c 89 6c 24 20       	mov    %r13,0x20(%rsp)
04a3   6e03a3:	4c 89 bc 24 38 01 00 00 	mov    %r15,0x138(%rsp)
04ab   6e03ab:	4c 89 a4 24 d0 00 00 00 	mov    %r12,0xd0(%rsp)
04b3   6e03b3:	48 89 5c 24 18       	mov    %rbx,0x18(%rsp)
04b8   6e03b8:	83 e3 fe             	and    $0xfffffffe,%ebx
04bb   6e03bb:	bf 02 00 00 00       	mov    $0x2,%edi
04c0   6e03c0:	48 89 de             	mov    %rbx,%rsi
04c3   6e03c3:	e8 00 00 00 00       	call   6e03c8 <shrink_lruvec+0x4c8>	6e03c4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
04c8   6e03c8:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
04cd   6e03cd:	48 83 fb 02          	cmp    $0x2,%rbx
04d1   6e03d1:	0f 94 84 24 f8 00 00 00 	sete   0xf8(%rsp)
04d9   6e03d9:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
04e1   6e03e1:	42 8a 04 30          	mov    (%rax,%r14,1),%al
04e5   6e03e5:	84 c0                	test   %al,%al
04e7   6e03e7:	0f 85 00 07 00 00    	jne    6e0aed <shrink_lruvec+0xbed>
04ed   6e03ed:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
04f2   6e03f2:	8a 00                	mov    (%rax),%al
04f4   6e03f4:	0f b6 d8             	movzbl %al,%ebx
04f7   6e03f7:	bf ff 00 00 00       	mov    $0xff,%edi
04fc   6e03fc:	89 de                	mov    %ebx,%esi
04fe   6e03fe:	e8 00 00 00 00       	call   6e0403 <shrink_lruvec+0x503>	6e03ff: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0503   6e0403:	84 db                	test   %bl,%bl
0505   6e0405:	0f 88 f8 01 00 00    	js     6e0603 <shrink_lruvec+0x703>
050b   6e040b:	80 fb 02             	cmp    $0x2,%bl
050e   6e040e:	b8 02 00 00 00       	mov    $0x2,%eax
0513   6e0413:	0f 43 d8             	cmovae %eax,%ebx
0516   6e0416:	80 c3 01             	add    $0x1,%bl
0519   6e0419:	0f b6 c3             	movzbl %bl,%eax
051c   6e041c:	48 69 c0 80 06 00 00 	imul   $0x680,%rax,%rax
0523   6e0423:	48 05 80 f9 ff ff    	add    $0xfffffffffffff980,%rax
0529   6e0429:	48 89 84 24 88 00 00 00 	mov    %rax,0x88(%rsp)
0531   6e0431:	4c 8b 64 24 30       	mov    0x30(%rsp),%r12
0536   6e0436:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
053b   6e043b:	45 31 ff             	xor    %r15d,%r15d
053e   6e043e:	31 c0                	xor    %eax,%eax
0540   6e0440:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
0545   6e0445:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
054d   6e044d:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
0552   6e0452:	48 89 d8             	mov    %rbx,%rax
0555   6e0455:	48 c1 e8 03          	shr    $0x3,%rax
0559   6e0459:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
055e   6e045e:	74 08                	je     6e0468 <shrink_lruvec+0x568>
0560   6e0460:	48 89 df             	mov    %rbx,%rdi
0563   6e0463:	e8 00 00 00 00       	call   6e0468 <shrink_lruvec+0x568>	6e0464: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0568   6e0468:	4c 8b 33             	mov    (%rbx),%r14
056b   6e046b:	4b 8d 1c 3e          	lea    (%r14,%r15,1),%rbx
056f   6e046f:	48 83 c3 68          	add    $0x68,%rbx
0573   6e0473:	48 89 df             	mov    %rbx,%rdi
0576   6e0476:	be 08 00 00 00       	mov    $0x8,%esi
057b   6e047b:	e8 00 00 00 00       	call   6e0480 <shrink_lruvec+0x580>	6e047c: R_X86_64_PLT32	__kasan_check_read-0x4
0580   6e0480:	48 89 d8             	mov    %rbx,%rax
0583   6e0483:	48 c1 e8 03          	shr    $0x3,%rax
0587   6e0487:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0591   6e0491:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0595   6e0495:	74 08                	je     6e049f <shrink_lruvec+0x59f>
0597   6e0497:	48 89 df             	mov    %rbx,%rdi
059a   6e049a:	e8 00 00 00 00       	call   6e049f <shrink_lruvec+0x59f>	6e049b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
059f   6e049f:	4b 8b 5c 3e 68       	mov    0x68(%r14,%r15,1),%rbx
05a4   6e04a4:	31 ff                	xor    %edi,%edi
05a6   6e04a6:	48 89 de             	mov    %rbx,%rsi
05a9   6e04a9:	e8 00 00 00 00       	call   6e04ae <shrink_lruvec+0x5ae>	6e04aa: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
05ae   6e04ae:	48 85 db             	test   %rbx,%rbx
05b1   6e04b1:	74 74                	je     6e0527 <shrink_lruvec+0x627>
05b3   6e04b3:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
05bd   6e04bd:	41 0f b6 44 05 00    	movzbl 0x0(%r13,%rax,1),%eax
05c3   6e04c3:	84 c0                	test   %al,%al
05c5   6e04c5:	0f 85 fe 00 00 00    	jne    6e05c9 <shrink_lruvec+0x6c9>
05cb   6e04cb:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e04d1 <shrink_lruvec+0x5d1>	6e04cd: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
05d1   6e04d1:	bf 01 00 00 00       	mov    $0x1,%edi
05d6   6e04d6:	89 de                	mov    %ebx,%esi
05d8   6e04d8:	e8 00 00 00 00       	call   6e04dd <shrink_lruvec+0x5dd>	6e04d9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
05dd   6e04dd:	85 db                	test   %ebx,%ebx
05df   6e04df:	7e 57                	jle    6e0538 <shrink_lruvec+0x638>
05e1   6e04e1:	e8 00 00 00 00       	call   6e04e6 <shrink_lruvec+0x5e6>	6e04e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05e6   6e04e6:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
05eb   6e04eb:	4a 8d 3c 20          	lea    (%rax,%r12,1),%rdi
05ef   6e04ef:	48 81 c7 40 fd ff ff 	add    $0xfffffffffffffd40,%rdi
05f6   6e04f6:	48 89 f8             	mov    %rdi,%rax
05f9   6e04f9:	48 c1 e8 03          	shr    $0x3,%rax
05fd   6e04fd:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0607   6e0507:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
060c   6e050c:	74 05                	je     6e0513 <shrink_lruvec+0x613>
060e   6e050e:	e8 00 00 00 00       	call   6e0513 <shrink_lruvec+0x613>	6e050f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0613   6e0513:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
0618   6e0518:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
061d   6e051d:	48 8b 9c 01 40 fd ff ff 	mov    -0x2c0(%rcx,%rax,1),%rbx
0625   6e0525:	eb 70                	jmp    6e0597 <shrink_lruvec+0x697>
0627   6e0527:	e8 00 00 00 00       	call   6e052c <shrink_lruvec+0x62c>	6e0528: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
062c   6e052c:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0636   6e0536:	eb 64                	jmp    6e059c <shrink_lruvec+0x69c>
0638   6e0538:	e8 00 00 00 00       	call   6e053d <shrink_lruvec+0x63d>	6e0539: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
063d   6e053d:	4c 8b 6c 24 60       	mov    0x60(%rsp),%r13
0642   6e0542:	4b 8d 1c 2e          	lea    (%r14,%r13,1),%rbx
0646   6e0546:	4a 8d 3c 3b          	lea    (%rbx,%r15,1),%rdi
064a   6e054a:	be 08 00 00 00       	mov    $0x8,%esi
064f   6e054f:	e8 00 00 00 00       	call   6e0554 <shrink_lruvec+0x654>	6e0550: R_X86_64_PLT32	__kasan_check_read-0x4
0654   6e0554:	4b 8d 3c 2f          	lea    (%r15,%r13,1),%rdi
0658   6e0558:	4c 01 f7             	add    %r14,%rdi
065b   6e055b:	48 89 f8             	mov    %rdi,%rax
065e   6e055e:	48 c1 e8 03          	shr    $0x3,%rax
0662   6e0562:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
066c   6e056c:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0671   6e0571:	74 05                	je     6e0578 <shrink_lruvec+0x678>
0673   6e0573:	e8 00 00 00 00       	call   6e0578 <shrink_lruvec+0x678>	6e0574: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0678   6e0578:	4a 8b 1c 3b          	mov    (%rbx,%r15,1),%rbx
067c   6e057c:	31 ff                	xor    %edi,%edi
067e   6e057e:	48 89 de             	mov    %rbx,%rsi
0681   6e0581:	e8 00 00 00 00       	call   6e0586 <shrink_lruvec+0x686>	6e0582: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0686   6e0586:	48 85 db             	test   %rbx,%rbx
0689   6e0589:	b8 00 00 00 00       	mov    $0x0,%eax
068e   6e058e:	48 0f 48 d8          	cmovs  %rax,%rbx
0692   6e0592:	4c 8b 6c 24 38       	mov    0x38(%rsp),%r13
0697   6e0597:	48 01 5c 24 40       	add    %rbx,0x40(%rsp)
069c   6e059c:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
06a4   6e05a4:	4c 39 bc 24 88 00 00 00 	cmp    %r15,0x88(%rsp)
06ac   6e05ac:	74 41                	je     6e05ef <shrink_lruvec+0x6ef>
06ae   6e05ae:	e8 00 00 00 00       	call   6e05b3 <shrink_lruvec+0x6b3>	6e05af: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06b3   6e05b3:	49 81 c7 80 06 00 00 	add    $0x680,%r15
06ba   6e05ba:	49 83 c4 28          	add    $0x28,%r12
06be   6e05be:	48 83 44 24 08 28    	addq   $0x28,0x8(%rsp)
06c4   6e05c4:	e9 89 fe ff ff       	jmp    6e0452 <shrink_lruvec+0x552>
06c9   6e05c9:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e05cc: R_X86_64_32S	memory_cgrp_subsys_enabled_key
06d0   6e05d0:	80 e1 07             	and    $0x7,%cl
06d3   6e05d3:	80 c1 03             	add    $0x3,%cl
06d6   6e05d6:	38 c1                	cmp    %al,%cl
06d8   6e05d8:	0f 8c ed fe ff ff    	jl     6e04cb <shrink_lruvec+0x5cb>
06de   6e05de:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e05e1: R_X86_64_32S	memory_cgrp_subsys_enabled_key
06e5   6e05e5:	e8 00 00 00 00       	call   6e05ea <shrink_lruvec+0x6ea>	6e05e6: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
06ea   6e05ea:	e9 dc fe ff ff       	jmp    6e04cb <shrink_lruvec+0x5cb>
06ef   6e05ef:	e8 00 00 00 00       	call   6e05f4 <shrink_lruvec+0x6f4>	6e05f0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06f4   6e05f4:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
06f9   6e05f9:	4c 8b a4 24 d0 00 00 00 	mov    0xd0(%rsp),%r12
0701   6e0601:	eb 0c                	jmp    6e060f <shrink_lruvec+0x70f>
0703   6e0603:	e8 00 00 00 00       	call   6e0608 <shrink_lruvec+0x708>	6e0604: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0708   6e0608:	31 c0                	xor    %eax,%eax
070a   6e060a:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
070f   6e060f:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
0717   6e0617:	48 89 d8             	mov    %rbx,%rax
071a   6e061a:	48 c1 e8 03          	shr    $0x3,%rax
071e   6e061e:	48 89 84 24 e8 00 00 00 	mov    %rax,0xe8(%rsp)
0726   6e0626:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
072b   6e062b:	74 08                	je     6e0635 <shrink_lruvec+0x735>
072d   6e062d:	48 89 df             	mov    %rbx,%rdi
0730   6e0630:	e8 00 00 00 00       	call   6e0635 <shrink_lruvec+0x735>	6e0631: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0735   6e0635:	4c 8b 33             	mov    (%rbx),%r14
0738   6e0638:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0742   6e0642:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
0747   6e0647:	8a 04 01             	mov    (%rcx,%rax,1),%al
074a   6e064a:	84 c0                	test   %al,%al
074c   6e064c:	0f 85 ba 04 00 00    	jne    6e0b0c <shrink_lruvec+0xc0c>
0752   6e0652:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e0658 <shrink_lruvec+0x758>	6e0654: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0758   6e0658:	bf 01 00 00 00       	mov    $0x1,%edi
075d   6e065d:	89 de                	mov    %ebx,%esi
075f   6e065f:	e8 00 00 00 00       	call   6e0664 <shrink_lruvec+0x764>	6e0660: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0764   6e0664:	4d 39 e6             	cmp    %r12,%r14
0767   6e0667:	0f 84 80 00 00 00    	je     6e06ed <shrink_lruvec+0x7ed>
076d   6e066d:	85 db                	test   %ebx,%ebx
076f   6e066f:	7e 7c                	jle    6e06ed <shrink_lruvec+0x7ed>
0771   6e0671:	4c 8b b4 24 c8 00 00 00 	mov    0xc8(%rsp),%r14
0779   6e0679:	4c 89 f0             	mov    %r14,%rax
077c   6e067c:	48 c1 e8 03          	shr    $0x3,%rax
0780   6e0680:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
078a   6e068a:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
078f   6e068f:	74 08                	je     6e0699 <shrink_lruvec+0x799>
0791   6e0691:	4c 89 f7             	mov    %r14,%rdi
0794   6e0694:	e8 00 00 00 00       	call   6e0699 <shrink_lruvec+0x799>	6e0695: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0799   6e0699:	4d 8b 2e             	mov    (%r14),%r13
079c   6e069c:	48 8b 9c 24 30 01 00 00 	mov    0x130(%rsp),%rbx
07a4   6e06a4:	48 89 d8             	mov    %rbx,%rax
07a7   6e06a7:	48 c1 e8 03          	shr    $0x3,%rax
07ab   6e06ab:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
07b0   6e06b0:	74 08                	je     6e06ba <shrink_lruvec+0x7ba>
07b2   6e06b2:	48 89 df             	mov    %rbx,%rdi
07b5   6e06b5:	e8 00 00 00 00       	call   6e06ba <shrink_lruvec+0x7ba>	6e06b6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07ba   6e06ba:	48 8b 1b             	mov    (%rbx),%rbx
07bd   6e06bd:	31 ff                	xor    %edi,%edi
07bf   6e06bf:	4c 89 ee             	mov    %r13,%rsi
07c2   6e06c2:	e8 00 00 00 00       	call   6e06c7 <shrink_lruvec+0x7c7>	6e06c3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
07c7   6e06c7:	31 ff                	xor    %edi,%edi
07c9   6e06c9:	48 89 de             	mov    %rbx,%rsi
07cc   6e06cc:	e8 00 00 00 00       	call   6e06d1 <shrink_lruvec+0x7d1>	6e06cd: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
07d1   6e06d1:	4c 89 e8             	mov    %r13,%rax
07d4   6e06d4:	48 09 d8             	or     %rbx,%rax
07d7   6e06d7:	75 23                	jne    6e06fc <shrink_lruvec+0x7fc>
07d9   6e06d9:	e8 00 00 00 00       	call   6e06de <shrink_lruvec+0x7de>	6e06da: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07de   6e06de:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
07e3   6e06e3:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
07e8   6e06e8:	e9 07 01 00 00       	jmp    6e07f4 <shrink_lruvec+0x8f4>
07ed   6e06ed:	e8 00 00 00 00       	call   6e06f2 <shrink_lruvec+0x7f2>	6e06ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07f2   6e06f2:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
07f7   6e06f7:	e9 f8 00 00 00       	jmp    6e07f4 <shrink_lruvec+0x8f4>
07fc   6e06fc:	4c 89 e7             	mov    %r12,%rdi
07ff   6e06ff:	e8 00 00 00 00       	call   6e0704 <shrink_lruvec+0x804>	6e0700: R_X86_64_PLT32	mem_cgroup_size-0x4
0804   6e0704:	49 89 c6             	mov    %rax,%r14
0807   6e0707:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0811   6e0711:	48 8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%rcx
0819   6e0719:	8a 04 01             	mov    (%rcx,%rax,1),%al
081c   6e071c:	84 c0                	test   %al,%al
081e   6e071e:	0f 85 4e 04 00 00    	jne    6e0b72 <shrink_lruvec+0xc72>
0824   6e0724:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0829   6e0729:	44 0f b7 38          	movzwl (%rax),%r15d
082d   6e072d:	44 89 fe             	mov    %r15d,%esi
0830   6e0730:	81 e6 80 00 00 00    	and    $0x80,%esi
0836   6e0736:	31 ff                	xor    %edi,%edi
0838   6e0738:	e8 00 00 00 00       	call   6e073d <shrink_lruvec+0x83d>	6e0739: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp2-0x4
083d   6e073d:	48 89 df             	mov    %rbx,%rdi
0840   6e0740:	4c 89 ee             	mov    %r13,%rsi
0843   6e0743:	e8 00 00 00 00       	call   6e0748 <shrink_lruvec+0x848>	6e0744: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
0848   6e0748:	44 89 f8             	mov    %r15d,%eax
084b   6e074b:	25 80 00 00 00       	and    $0x80,%eax
0850   6e0750:	75 3a                	jne    6e078c <shrink_lruvec+0x88c>
0852   6e0752:	4c 39 eb             	cmp    %r13,%rbx
0855   6e0755:	76 35                	jbe    6e078c <shrink_lruvec+0x88c>
0857   6e0757:	e8 00 00 00 00       	call   6e075c <shrink_lruvec+0x85c>	6e0758: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
085c   6e075c:	41 81 cf 00 01 00 00 	or     $0x100,%r15d
0863   6e0763:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
086d   6e076d:	48 8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%rcx
0875   6e0775:	8a 04 01             	mov    (%rcx,%rax,1),%al
0878   6e0778:	84 c0                	test   %al,%al
087a   6e077a:	0f 85 82 04 00 00    	jne    6e0c02 <shrink_lruvec+0xd02>
0880   6e0780:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
0885   6e0785:	66 45 89 7d 00       	mov    %r15w,0x0(%r13)
088a   6e078a:	eb 0d                	jmp    6e0799 <shrink_lruvec+0x899>
088c   6e078c:	e8 00 00 00 00       	call   6e0791 <shrink_lruvec+0x891>	6e078d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0891   6e0791:	4c 89 eb             	mov    %r13,%rbx
0894   6e0794:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
0899   6e0799:	4c 89 f7             	mov    %r14,%rdi
089c   6e079c:	48 89 de             	mov    %rbx,%rsi
089f   6e079f:	e8 00 00 00 00       	call   6e07a4 <shrink_lruvec+0x8a4>	6e07a0: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
08a4   6e07a4:	49 39 de             	cmp    %rbx,%r14
08a7   6e07a7:	4c 0f 46 f3          	cmovbe %rbx,%r14
08ab   6e07ab:	48 0f af 5c 24 40    	imul   0x40(%rsp),%rbx
08b1   6e07b1:	49 83 c6 01          	add    $0x1,%r14
08b5   6e07b5:	48 89 d8             	mov    %rbx,%rax
08b8   6e07b8:	4c 09 f0             	or     %r14,%rax
08bb   6e07bb:	48 c1 e8 20          	shr    $0x20,%rax
08bf   6e07bf:	74 0a                	je     6e07cb <shrink_lruvec+0x8cb>
08c1   6e07c1:	48 89 d8             	mov    %rbx,%rax
08c4   6e07c4:	31 d2                	xor    %edx,%edx
08c6   6e07c6:	49 f7 f6             	div    %r14
08c9   6e07c9:	eb 07                	jmp    6e07d2 <shrink_lruvec+0x8d2>
08cb   6e07cb:	89 d8                	mov    %ebx,%eax
08cd   6e07cd:	31 d2                	xor    %edx,%edx
08cf   6e07cf:	41 f7 f6             	div    %r14d
08d2   6e07d2:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
08d7   6e07d7:	49 29 c6             	sub    %rax,%r14
08da   6e07da:	bf 20 00 00 00       	mov    $0x20,%edi
08df   6e07df:	4c 89 f6             	mov    %r14,%rsi
08e2   6e07e2:	e8 00 00 00 00       	call   6e07e7 <shrink_lruvec+0x8e7>	6e07e3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
08e7   6e07e7:	49 83 fe 21          	cmp    $0x21,%r14
08eb   6e07eb:	b8 20 00 00 00       	mov    $0x20,%eax
08f0   6e07f0:	4c 0f 42 f0          	cmovb  %rax,%r14
08f4   6e07f4:	48 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%rbx
08fc   6e07fc:	48 89 d9             	mov    %rbx,%rcx
08ff   6e07ff:	48 c1 e9 03          	shr    $0x3,%rcx
0903   6e0803:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
090d   6e080d:	48 89 8c 24 78 01 00 00 	mov    %rcx,0x178(%rsp)
0915   6e0815:	8a 04 01             	mov    (%rcx,%rax,1),%al
0918   6e0818:	84 c0                	test   %al,%al
091a   6e081a:	0f 85 12 03 00 00    	jne    6e0b32 <shrink_lruvec+0xc32>
0920   6e0820:	48 0f be 03          	movsbq (%rbx),%rax
0924   6e0824:	89 c3                	mov    %eax,%ebx
0926   6e0826:	bf 40 00 00 00       	mov    $0x40,%edi
092b   6e082b:	48 89 de             	mov    %rbx,%rsi
092e   6e082e:	e8 00 00 00 00       	call   6e0833 <shrink_lruvec+0x933>	6e082f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0933   6e0833:	48 83 fb 3f          	cmp    $0x3f,%rbx
0937   6e0837:	0f 87 e7 03 00 00    	ja     6e0c24 <shrink_lruvec+0xd24>
093d   6e083d:	e8 00 00 00 00       	call   6e0842 <shrink_lruvec+0x942>	6e083e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0942   6e0842:	89 d9                	mov    %ebx,%ecx
0944   6e0844:	49 d3 ee             	shr    %cl,%r14
0947   6e0847:	31 ff                	xor    %edi,%edi
0949   6e0849:	4c 89 f6             	mov    %r14,%rsi
094c   6e084c:	e8 00 00 00 00       	call   6e0851 <shrink_lruvec+0x951>	6e084d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0951   6e0851:	4d 85 f6             	test   %r14,%r14
0954   6e0854:	74 2c                	je     6e0882 <shrink_lruvec+0x982>
0956   6e0856:	e8 00 00 00 00       	call   6e085b <shrink_lruvec+0x95b>	6e0857: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
095b   6e085b:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0960   6e0860:	48 8b bc 24 e0 00 00 00 	mov    0xe0(%rsp),%rdi
0968   6e0868:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	6e086b: R_X86_64_32S	.data+0x60a040
096f   6e086f:	e8 00 00 00 00       	call   6e0874 <shrink_lruvec+0x974>	6e0870: R_X86_64_PLT32	__sanitizer_cov_trace_switch-0x4
0974   6e0874:	ff 64 24 78          	jmp    *0x78(%rsp)
0978   6e0878:	e8 00 00 00 00       	call   6e087d <shrink_lruvec+0x97d>	6e0879: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
097d   6e087d:	e9 14 02 00 00       	jmp    6e0a96 <shrink_lruvec+0xb96>
0982   6e0882:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
098c   6e088c:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
0991   6e0891:	42 8a 04 30          	mov    (%rax,%r14,1),%al
0995   6e0895:	84 c0                	test   %al,%al
0997   6e0897:	0f 85 af 02 00 00    	jne    6e0b4c <shrink_lruvec+0xc4c>
099d   6e089d:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e08a3 <shrink_lruvec+0x9a3>	6e089f: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
09a3   6e08a3:	bf 01 00 00 00       	mov    $0x1,%edi
09a8   6e08a8:	89 de                	mov    %ebx,%esi
09aa   6e08aa:	e8 00 00 00 00       	call   6e08af <shrink_lruvec+0x9af>	6e08ab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09af   6e08af:	85 db                	test   %ebx,%ebx
09b1   6e08b1:	0f 8e 4e 01 00 00    	jle    6e0a05 <shrink_lruvec+0xb05>
09b7   6e08b7:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
09bc   6e08bc:	48 89 d0             	mov    %rdx,%rax
09bf   6e08bf:	48 c1 e8 03          	shr    $0x3,%rax
09c3   6e08c3:	42 8a 04 30          	mov    (%rax,%r14,1),%al
09c7   6e08c7:	84 c0                	test   %al,%al
09c9   6e08c9:	0f 85 eb 02 00 00    	jne    6e0bba <shrink_lruvec+0xcba>
09cf   6e08cf:	8b 1a                	mov    (%rdx),%ebx
09d1   6e08d1:	89 de                	mov    %ebx,%esi
09d3   6e08d3:	83 e6 02             	and    $0x2,%esi
09d6   6e08d6:	31 ff                	xor    %edi,%edi
09d8   6e08d8:	e8 00 00 00 00       	call   6e08dd <shrink_lruvec+0x9dd>	6e08d9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
09dd   6e08dd:	83 e3 02             	and    $0x2,%ebx
09e0   6e08e0:	0f 85 2c 01 00 00    	jne    6e0a12 <shrink_lruvec+0xb12>
09e6   6e08e6:	e8 00 00 00 00       	call   6e08eb <shrink_lruvec+0x9eb>	6e08e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09eb   6e08eb:	bf 20 00 00 00       	mov    $0x20,%edi
09f0   6e08f0:	4c 8b 74 24 40       	mov    0x40(%rsp),%r14
09f5   6e08f5:	4c 89 f6             	mov    %r14,%rsi
09f8   6e08f8:	e8 00 00 00 00       	call   6e08fd <shrink_lruvec+0x9fd>	6e08f9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09fd   6e08fd:	49 83 fe 20          	cmp    $0x20,%r14
0a01   6e0901:	b8 20 00 00 00       	mov    $0x20,%eax
0a06   6e0906:	4c 0f 43 f0          	cmovae %rax,%r14
0a0a   6e090a:	e9 4c ff ff ff       	jmp    6e085b <shrink_lruvec+0x95b>
0a0f   6e090f:	4d 89 e7             	mov    %r12,%r15
0a12   6e0912:	e8 00 00 00 00       	call   6e0917 <shrink_lruvec+0xa17>	6e0913: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a17   6e0917:	eb 08                	jmp    6e0921 <shrink_lruvec+0xa21>
0a19   6e0919:	4d 89 e7             	mov    %r12,%r15
0a1c   6e091c:	e8 00 00 00 00       	call   6e0921 <shrink_lruvec+0xa21>	6e091d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a21   6e0921:	45 31 e4             	xor    %r12d,%r12d
0a24   6e0924:	8a 84 24 f8 00 00 00 	mov    0xf8(%rsp),%al
0a2b   6e092b:	41 88 c4             	mov    %al,%r12b
0a2e   6e092e:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0a33   6e0933:	89 df                	mov    %ebx,%edi
0a35   6e0935:	44 89 e6             	mov    %r12d,%esi
0a38   6e0938:	e8 00 00 00 00       	call   6e093d <shrink_lruvec+0xa3d>	6e0939: R_X86_64_PLT32	__sanitizer_cov_trace_cmp4-0x4
0a3d   6e093d:	44 39 e3             	cmp    %r12d,%ebx
0a40   6e0940:	b8 00 00 00 00       	mov    $0x0,%eax
0a45   6e0945:	4c 0f 45 f0          	cmovne %rax,%r14
0a49   6e0949:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0a4e   6e094e:	4d 89 fc             	mov    %r15,%r12
0a51   6e0951:	e9 40 01 00 00       	jmp    6e0a96 <shrink_lruvec+0xb96>
0a56   6e0956:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0a60   6e0960:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
0a65   6e0965:	8a 04 01             	mov    (%rcx,%rax,1),%al
0a68   6e0968:	84 c0                	test   %al,%al
0a6a   6e096a:	0f 85 24 02 00 00    	jne    6e0b94 <shrink_lruvec+0xc94>
0a70   6e0970:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e0976 <shrink_lruvec+0xa76>	6e0972: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
0a76   6e0976:	bf 01 00 00 00       	mov    $0x1,%edi
0a7b   6e097b:	89 de                	mov    %ebx,%esi
0a7d   6e097d:	e8 00 00 00 00       	call   6e0982 <shrink_lruvec+0xa82>	6e097e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a82   6e0982:	85 db                	test   %ebx,%ebx
0a84   6e0984:	0f 8e 95 00 00 00    	jle    6e0a1f <shrink_lruvec+0xb1f>
0a8a   6e098a:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
0a8f   6e098f:	48 89 d0             	mov    %rdx,%rax
0a92   6e0992:	48 c1 e8 03          	shr    $0x3,%rax
0a96   6e0996:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0aa0   6e09a0:	8a 04 08             	mov    (%rax,%rcx,1),%al
0aa3   6e09a3:	84 c0                	test   %al,%al
0aa5   6e09a5:	0f 85 33 02 00 00    	jne    6e0bde <shrink_lruvec+0xcde>
0aab   6e09ab:	8b 1a                	mov    (%rdx),%ebx
0aad   6e09ad:	89 de                	mov    %ebx,%esi
0aaf   6e09af:	83 e6 02             	and    $0x2,%esi
0ab2   6e09b2:	31 ff                	xor    %edi,%edi
0ab4   6e09b4:	e8 00 00 00 00       	call   6e09b9 <shrink_lruvec+0xab9>	6e09b5: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0ab9   6e09b9:	83 e3 02             	and    $0x2,%ebx
0abc   6e09bc:	75 68                	jne    6e0a26 <shrink_lruvec+0xb26>
0abe   6e09be:	31 db                	xor    %ebx,%ebx
0ac0   6e09c0:	83 7c 24 58 02       	cmpl   $0x2,0x58(%rsp)
0ac5   6e09c5:	0f 94 c3             	sete   %bl
0ac8   6e09c8:	e8 00 00 00 00       	call   6e09cd <shrink_lruvec+0xacd>	6e09c9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0acd   6e09cd:	48 8d 1c dc          	lea    (%rsp,%rbx,8),%rbx
0ad1   6e09d1:	48 81 c3 90 00 00 00 	add    $0x90,%rbx
0ad8   6e09d8:	48 89 d8             	mov    %rbx,%rax
0adb   6e09db:	48 c1 e8 03          	shr    $0x3,%rax
0adf   6e09df:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0ae9   6e09e9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0aed   6e09ed:	74 08                	je     6e09f7 <shrink_lruvec+0xaf7>
0aef   6e09ef:	48 89 df             	mov    %rbx,%rdi
0af2   6e09f2:	e8 00 00 00 00       	call   6e09f7 <shrink_lruvec+0xaf7>	6e09f3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0af7   6e09f7:	4c 0f af 33          	imul   (%rbx),%r14
0afb   6e09fb:	4c 03 b4 24 60 01 00 00 	add    0x160(%rsp),%r14
0b03   6e0a03:	eb 61                	jmp    6e0a66 <shrink_lruvec+0xb66>
0b05   6e0a05:	e8 00 00 00 00       	call   6e0a0a <shrink_lruvec+0xb0a>	6e0a06: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b0a   6e0a0a:	45 31 f6             	xor    %r14d,%r14d
0b0d   6e0a0d:	e9 49 fe ff ff       	jmp    6e085b <shrink_lruvec+0x95b>
0b12   6e0a12:	e8 00 00 00 00       	call   6e0a17 <shrink_lruvec+0xb17>	6e0a13: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b17   6e0a17:	45 31 f6             	xor    %r14d,%r14d
0b1a   6e0a1a:	e9 3c fe ff ff       	jmp    6e085b <shrink_lruvec+0x95b>
0b1f   6e0a1f:	e8 00 00 00 00       	call   6e0a24 <shrink_lruvec+0xb24>	6e0a20: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b24   6e0a24:	eb 05                	jmp    6e0a2b <shrink_lruvec+0xb2b>
0b26   6e0a26:	e8 00 00 00 00       	call   6e0a2b <shrink_lruvec+0xb2b>	6e0a27: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b2b   6e0a2b:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
0b30   6e0a30:	31 c0                	xor    %eax,%eax
0b32   6e0a32:	83 f9 02             	cmp    $0x2,%ecx
0b35   6e0a35:	0f 94 c0             	sete   %al
0b38   6e0a38:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
0b3c   6e0a3c:	48 81 c3 90 00 00 00 	add    $0x90,%rbx
0b43   6e0a43:	48 89 d8             	mov    %rbx,%rax
0b46   6e0a46:	48 c1 e8 03          	shr    $0x3,%rax
0b4a   6e0a4a:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0b54   6e0a54:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0b58   6e0a58:	74 08                	je     6e0a62 <shrink_lruvec+0xb62>
0b5a   6e0a5a:	48 89 df             	mov    %rbx,%rdi
0b5d   6e0a5d:	e8 00 00 00 00       	call   6e0a62 <shrink_lruvec+0xb62>	6e0a5e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b62   6e0a62:	4c 0f af 33          	imul   (%rbx),%r14
0b66   6e0a66:	4c 89 f0             	mov    %r14,%rax
0b69   6e0a69:	48 8b 8c 24 28 01 00 00 	mov    0x128(%rsp),%rcx
0b71   6e0a71:	48 09 c8             	or     %rcx,%rax
0b74   6e0a74:	48 c1 e8 20          	shr    $0x20,%rax
0b78   6e0a78:	74 0d                	je     6e0a87 <shrink_lruvec+0xb87>
0b7a   6e0a7a:	4c 89 f0             	mov    %r14,%rax
0b7d   6e0a7d:	31 d2                	xor    %edx,%edx
0b7f   6e0a7f:	48 f7 f1             	div    %rcx
0b82   6e0a82:	49 89 c6             	mov    %rax,%r14
0b85   6e0a85:	eb 0a                	jmp    6e0a91 <shrink_lruvec+0xb91>
0b87   6e0a87:	44 89 f0             	mov    %r14d,%eax
0b8a   6e0a8a:	31 d2                	xor    %edx,%edx
0b8c   6e0a8c:	f7 f1                	div    %ecx
0b8e   6e0a8e:	41 89 c6             	mov    %eax,%r14d
0b91   6e0a91:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0b96   6e0a96:	48 8d 3c dc          	lea    (%rsp,%rbx,8),%rdi
0b9a   6e0a9a:	48 81 c7 00 01 00 00 	add    $0x100,%rdi
0ba1   6e0aa1:	48 89 f8             	mov    %rdi,%rax
0ba4   6e0aa4:	48 c1 e8 03          	shr    $0x3,%rax
0ba8   6e0aa8:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0bb2   6e0ab2:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0bb6   6e0ab6:	74 05                	je     6e0abd <shrink_lruvec+0xbbd>
0bb8   6e0ab8:	e8 00 00 00 00       	call   6e0abd <shrink_lruvec+0xbbd>	6e0ab9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0bbd   6e0abd:	4c 89 b4 dc 00 01 00 00 	mov    %r14,0x100(%rsp,%rbx,8)
0bc5   6e0ac5:	48 83 c3 01          	add    $0x1,%rbx
0bc9   6e0ac9:	48 83 fb 04          	cmp    $0x4,%rbx
0bcd   6e0acd:	0f 84 6d 01 00 00    	je     6e0c40 <shrink_lruvec+0xd40>
0bd3   6e0ad3:	e8 00 00 00 00       	call   6e0ad8 <shrink_lruvec+0xbd8>	6e0ad4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bd8   6e0ad8:	48 83 44 24 60 08    	addq   $0x8,0x60(%rsp)
0bde   6e0ade:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0be8   6e0ae8:	e9 c6 f8 ff ff       	jmp    6e03b3 <shrink_lruvec+0x4b3>
0bed   6e0aed:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
0bf2   6e0af2:	80 e1 07             	and    $0x7,%cl
0bf5   6e0af5:	38 c1                	cmp    %al,%cl
0bf7   6e0af7:	0f 8c f0 f8 ff ff    	jl     6e03ed <shrink_lruvec+0x4ed>
0bfd   6e0afd:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
0c02   6e0b02:	e8 00 00 00 00       	call   6e0b07 <shrink_lruvec+0xc07>	6e0b03: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0c07   6e0b07:	e9 e1 f8 ff ff       	jmp    6e03ed <shrink_lruvec+0x4ed>
0c0c   6e0b0c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e0b0f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0c13   6e0b13:	80 e1 07             	and    $0x7,%cl
0c16   6e0b16:	80 c1 03             	add    $0x3,%cl
0c19   6e0b19:	38 c1                	cmp    %al,%cl
0c1b   6e0b1b:	0f 8c 31 fb ff ff    	jl     6e0652 <shrink_lruvec+0x752>
0c21   6e0b21:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e0b24: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0c28   6e0b28:	e8 00 00 00 00       	call   6e0b2d <shrink_lruvec+0xc2d>	6e0b29: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c2d   6e0b2d:	e9 20 fb ff ff       	jmp    6e0652 <shrink_lruvec+0x752>
0c32   6e0b32:	89 d9                	mov    %ebx,%ecx
0c34   6e0b34:	80 e1 07             	and    $0x7,%cl
0c37   6e0b37:	38 c1                	cmp    %al,%cl
0c39   6e0b39:	0f 8c e1 fc ff ff    	jl     6e0820 <shrink_lruvec+0x920>
0c3f   6e0b3f:	48 89 df             	mov    %rbx,%rdi
0c42   6e0b42:	e8 00 00 00 00       	call   6e0b47 <shrink_lruvec+0xc47>	6e0b43: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
0c47   6e0b47:	e9 d4 fc ff ff       	jmp    6e0820 <shrink_lruvec+0x920>
0c4c   6e0b4c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e0b4f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0c53   6e0b53:	80 e1 07             	and    $0x7,%cl
0c56   6e0b56:	80 c1 03             	add    $0x3,%cl
0c59   6e0b59:	38 c1                	cmp    %al,%cl
0c5b   6e0b5b:	0f 8c 3c fd ff ff    	jl     6e089d <shrink_lruvec+0x99d>
0c61   6e0b61:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e0b64: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0c68   6e0b68:	e8 00 00 00 00       	call   6e0b6d <shrink_lruvec+0xc6d>	6e0b69: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0c6d   6e0b6d:	e9 2b fd ff ff       	jmp    6e089d <shrink_lruvec+0x99d>
0c72   6e0b72:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0c77   6e0b77:	80 e1 07             	and    $0x7,%cl
0c7a   6e0b7a:	80 c1 01             	add    $0x1,%cl
0c7d   6e0b7d:	38 c1                	cmp    %al,%cl
0c7f   6e0b7f:	0f 8c 9f fb ff ff    	jl     6e0724 <shrink_lruvec+0x824>
0c85   6e0b85:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0c8a   6e0b8a:	e8 00 00 00 00       	call   6e0b8f <shrink_lruvec+0xc8f>	6e0b8b: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0c8f   6e0b8f:	e9 90 fb ff ff       	jmp    6e0724 <shrink_lruvec+0x824>
0c94   6e0b94:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e0b97: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0c9b   6e0b9b:	80 e1 07             	and    $0x7,%cl
0c9e   6e0b9e:	80 c1 03             	add    $0x3,%cl
0ca1   6e0ba1:	38 c1                	cmp    %al,%cl
0ca3   6e0ba3:	0f 8c c7 fd ff ff    	jl     6e0970 <shrink_lruvec+0xa70>
0ca9   6e0ba9:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e0bac: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0cb0   6e0bb0:	e8 00 00 00 00       	call   6e0bb5 <shrink_lruvec+0xcb5>	6e0bb1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cb5   6e0bb5:	e9 b6 fd ff ff       	jmp    6e0970 <shrink_lruvec+0xa70>
0cba   6e0bba:	89 d1                	mov    %edx,%ecx
0cbc   6e0bbc:	80 e1 07             	and    $0x7,%cl
0cbf   6e0bbf:	80 c1 03             	add    $0x3,%cl
0cc2   6e0bc2:	38 c1                	cmp    %al,%cl
0cc4   6e0bc4:	0f 8c 05 fd ff ff    	jl     6e08cf <shrink_lruvec+0x9cf>
0cca   6e0bca:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
0ccf   6e0bcf:	e8 00 00 00 00       	call   6e0bd4 <shrink_lruvec+0xcd4>	6e0bd0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cd4   6e0bd4:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
0cd9   6e0bd9:	e9 f1 fc ff ff       	jmp    6e08cf <shrink_lruvec+0x9cf>
0cde   6e0bde:	89 d1                	mov    %edx,%ecx
0ce0   6e0be0:	80 e1 07             	and    $0x7,%cl
0ce3   6e0be3:	80 c1 03             	add    $0x3,%cl
0ce6   6e0be6:	38 c1                	cmp    %al,%cl
0ce8   6e0be8:	0f 8c bd fd ff ff    	jl     6e09ab <shrink_lruvec+0xaab>
0cee   6e0bee:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
0cf3   6e0bf3:	e8 00 00 00 00       	call   6e0bf8 <shrink_lruvec+0xcf8>	6e0bf4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cf8   6e0bf8:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
0cfd   6e0bfd:	e9 a9 fd ff ff       	jmp    6e09ab <shrink_lruvec+0xaab>
0d02   6e0c02:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
0d07   6e0c07:	80 e1 07             	and    $0x7,%cl
0d0a   6e0c0a:	80 c1 01             	add    $0x1,%cl
0d0d   6e0c0d:	38 c1                	cmp    %al,%cl
0d0f   6e0c0f:	0f 8c 6b fb ff ff    	jl     6e0780 <shrink_lruvec+0x880>
0d15   6e0c15:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
0d1a   6e0c1a:	e8 00 00 00 00       	call   6e0c1f <shrink_lruvec+0xd1f>	6e0c1b: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
0d1f   6e0c1f:	e9 5c fb ff ff       	jmp    6e0780 <shrink_lruvec+0x880>
0d24   6e0c24:	e8 00 00 00 00       	call   6e0c29 <shrink_lruvec+0xd29>	6e0c25: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d29   6e0c29:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e0c2c: R_X86_64_32S	.data+0x609ea0
0d30   6e0c30:	4c 89 f6             	mov    %r14,%rsi
0d33   6e0c33:	48 89 da             	mov    %rbx,%rdx
0d36   6e0c36:	e8 00 00 00 00       	call   6e0c3b <shrink_lruvec+0xd3b>	6e0c37: R_X86_64_PLT32	__ubsan_handle_shift_out_of_bounds-0x4
0d3b   6e0c3b:	e9 02 fc ff ff       	jmp    6e0842 <shrink_lruvec+0x942>
0d40   6e0c40:	48 8d bc 24 80 01 00 00 	lea    0x180(%rsp),%rdi
0d48   6e0c48:	48 8d b4 24 00 01 00 00 	lea    0x100(%rsp),%rsi
0d50   6e0c50:	ba 28 00 00 00       	mov    $0x28,%edx
0d55   6e0c55:	e8 00 00 00 00       	call   6e0c5a <shrink_lruvec+0xd5a>	6e0c56: R_X86_64_PLT32	memcpy-0x4
0d5a   6e0c5a:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0d64   6e0c64:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
0d6c   6e0c6c:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0d71   6e0c71:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
0d79   6e0c79:	74 08                	je     6e0c83 <shrink_lruvec+0xd83>
0d7b   6e0c7b:	48 89 df             	mov    %rbx,%rdi
0d7e   6e0c7e:	e8 00 00 00 00       	call   6e0c83 <shrink_lruvec+0xd83>	6e0c7f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0d83   6e0c83:	48 83 3b 00          	cmpq   $0x0,(%rbx)
0d87   6e0c87:	74 12                	je     6e0c9b <shrink_lruvec+0xd9b>
0d89   6e0c89:	e8 00 00 00 00       	call   6e0c8e <shrink_lruvec+0xd8e>	6e0c8a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0d8e   6e0c8e:	c7 44 24 74 00 00 00 00 	movl   $0x0,0x74(%rsp)
0d96   6e0c96:	e9 97 00 00 00       	jmp    6e0d32 <shrink_lruvec+0xe32>
0d9b   6e0c9b:	65 48 8b 1c 25 00 00 00 00 	mov    %gs:0x0,%rbx	6e0ca0: R_X86_64_32S	current_task
0da4   6e0ca4:	48 83 c3 2c          	add    $0x2c,%rbx
0da8   6e0ca8:	48 89 d8             	mov    %rbx,%rax
0dab   6e0cab:	48 c1 e8 03          	shr    $0x3,%rax
0daf   6e0caf:	42 8a 04 30          	mov    (%rax,%r14,1),%al
0db3   6e0cb3:	84 c0                	test   %al,%al
0db5   6e0cb5:	0f 85 08 1d 00 00    	jne    6e29c3 <shrink_lruvec+0x2ac3>
0dbb   6e0cbb:	44 8b 33             	mov    (%rbx),%r14d
0dbe   6e0cbe:	bb 00 00 02 00       	mov    $0x20000,%ebx
0dc3   6e0cc3:	be 00 00 02 00       	mov    $0x20000,%esi
0dc8   6e0cc8:	44 21 f6             	and    %r14d,%esi
0dcb   6e0ccb:	31 ff                	xor    %edi,%edi
0dcd   6e0ccd:	e8 00 00 00 00       	call   6e0cd2 <shrink_lruvec+0xdd2>	6e0cce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0dd2   6e0cd2:	44 21 f3             	and    %r14d,%ebx
0dd5   6e0cd5:	75 44                	jne    6e0d1b <shrink_lruvec+0xe1b>
0dd7   6e0cd7:	e8 00 00 00 00       	call   6e0cdc <shrink_lruvec+0xddc>	6e0cd8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ddc   6e0cdc:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0de6   6e0ce6:	48 8b 84 24 78 01 00 00 	mov    0x178(%rsp),%rax
0dee   6e0cee:	42 8a 04 30          	mov    (%rax,%r14,1),%al
0df2   6e0cf2:	84 c0                	test   %al,%al
0df4   6e0cf4:	48 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%rbx
0dfc   6e0cfc:	0f 85 de 1c 00 00    	jne    6e29e0 <shrink_lruvec+0x2ae0>
0e02   6e0d02:	0f b6 33             	movzbl (%rbx),%esi
0e05   6e0d05:	83 fe 0c             	cmp    $0xc,%esi
0e08   6e0d08:	0f 94 c0             	sete   %al
0e0b   6e0d0b:	89 44 24 74          	mov    %eax,0x74(%rsp)
0e0f   6e0d0f:	bf 0c 00 00 00       	mov    $0xc,%edi
0e14   6e0d14:	e8 00 00 00 00       	call   6e0d19 <shrink_lruvec+0xe19>	6e0d15: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
0e19   6e0d19:	eb 17                	jmp    6e0d32 <shrink_lruvec+0xe32>
0e1b   6e0d1b:	e8 00 00 00 00       	call   6e0d20 <shrink_lruvec+0xe20>	6e0d1c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0e20   6e0d20:	c7 44 24 74 00 00 00 00 	movl   $0x0,0x74(%rsp)
0e28   6e0d28:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0e32   6e0d32:	48 8d bc 24 f0 01 00 00 	lea    0x1f0(%rsp),%rdi
0e3a   6e0d3a:	e8 00 00 00 00       	call   6e0d3f <shrink_lruvec+0xe3f>	6e0d3b: R_X86_64_PLT32	blk_start_plug-0x4
0e3f   6e0d3f:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
0e44   6e0d44:	48 8d 42 30          	lea    0x30(%rdx),%rax
0e48   6e0d48:	48 89 84 24 58 01 00 00 	mov    %rax,0x158(%rsp)
0e50   6e0d50:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0e55   6e0d55:	48 8d 48 50          	lea    0x50(%rax),%rcx
0e59   6e0d59:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
0e5e   6e0d5e:	48 8d 8c 24 00 01 00 00 	lea    0x100(%rsp),%rcx
0e66   6e0d66:	48 c1 e9 03          	shr    $0x3,%rcx
0e6a   6e0d6a:	48 89 8c 24 68 01 00 00 	mov    %rcx,0x168(%rsp)
0e72   6e0d72:	48 8d 8c 24 80 01 00 00 	lea    0x180(%rsp),%rcx
0e7a   6e0d7a:	48 c1 e9 03          	shr    $0x3,%rcx
0e7e   6e0d7e:	48 89 8c 24 a8 01 00 00 	mov    %rcx,0x1a8(%rsp)
0e86   6e0d86:	48 8d 8c 24 40 01 00 00 	lea    0x140(%rsp),%rcx
0e8e   6e0d8e:	48 c1 e9 03          	shr    $0x3,%rcx
0e92   6e0d92:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
0e97   6e0d97:	48 8d 4c 24 68       	lea    0x68(%rsp),%rcx
0e9c   6e0d9c:	48 c1 e9 03          	shr    $0x3,%rcx
0ea0   6e0da0:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
0ea5   6e0da5:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e0da8: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
0eac   6e0dac:	48 c1 e9 03          	shr    $0x3,%rcx
0eb0   6e0db0:	48 89 8c 24 70 01 00 00 	mov    %rcx,0x170(%rsp)
0eb8   6e0db8:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e0dbb: R_X86_64_32S	memory_cgrp_subsys_enabled_key
0ebf   6e0dbf:	48 c1 e9 03          	shr    $0x3,%rcx
0ec3   6e0dc3:	48 89 8c 24 f0 00 00 00 	mov    %rcx,0xf0(%rsp)
0ecb   6e0dcb:	48 05 00 04 00 00    	add    $0x400,%rax
0ed1   6e0dd1:	48 89 84 24 30 01 00 00 	mov    %rax,0x130(%rsp)
0ed9   6e0dd9:	48 8d 42 48          	lea    0x48(%rdx),%rax
0edd   6e0ddd:	48 89 84 24 28 01 00 00 	mov    %rax,0x128(%rsp)
0ee5   6e0de5:	48 8d 42 50          	lea    0x50(%rdx),%rax
0ee9   6e0de9:	48 89 84 24 60 01 00 00 	mov    %rax,0x160(%rsp)
0ef1   6e0df1:	48 8d 42 4c          	lea    0x4c(%rdx),%rax
0ef5   6e0df5:	48 89 84 24 e8 01 00 00 	mov    %rax,0x1e8(%rsp)
0efd   6e0dfd:	48 8d 42 54          	lea    0x54(%rdx),%rax
0f01   6e0e01:	48 89 84 24 e0 01 00 00 	mov    %rax,0x1e0(%rsp)
0f09   6e0e09:	48 8d 42 58          	lea    0x58(%rdx),%rax
0f0d   6e0e0d:	48 89 84 24 d8 01 00 00 	mov    %rax,0x1d8(%rsp)
0f15   6e0e15:	48 8d 42 60          	lea    0x60(%rdx),%rax
0f19   6e0e19:	48 89 84 24 d0 01 00 00 	mov    %rax,0x1d0(%rsp)
0f21   6e0e21:	48 8d 42 5c          	lea    0x5c(%rdx),%rax
0f25   6e0e25:	48 89 84 24 50 01 00 00 	mov    %rax,0x150(%rsp)
0f2d   6e0e2d:	31 c0                	xor    %eax,%eax
0f2f   6e0e2f:	48 89 84 24 e0 00 00 00 	mov    %rax,0xe0(%rsp)
0f37   6e0e37:	eb 0f                	jmp    6e0e48 <shrink_lruvec+0xf48>
0f39   6e0e39:	e8 00 00 00 00       	call   6e0e3e <shrink_lruvec+0xf3e>	6e0e3a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f3e   6e0e3e:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
0f48   6e0e48:	48 8b 84 24 68 01 00 00 	mov    0x168(%rsp),%rax
0f50   6e0e50:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0f55   6e0e55:	74 0d                	je     6e0e64 <shrink_lruvec+0xf64>
0f57   6e0e57:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
0f5f   6e0e5f:	e8 00 00 00 00       	call   6e0e64 <shrink_lruvec+0xf64>	6e0e60: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f64   6e0e64:	48 8b 9c 24 00 01 00 00 	mov    0x100(%rsp),%rbx
0f6c   6e0e6c:	31 ff                	xor    %edi,%edi
0f6e   6e0e6e:	48 89 de             	mov    %rbx,%rsi
0f71   6e0e71:	e8 00 00 00 00       	call   6e0e76 <shrink_lruvec+0xf76>	6e0e72: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0f76   6e0e76:	48 85 db             	test   %rbx,%rbx
0f79   6e0e79:	74 07                	je     6e0e82 <shrink_lruvec+0xf82>
0f7b   6e0e7b:	e8 00 00 00 00       	call   6e0e80 <shrink_lruvec+0xf80>	6e0e7c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0f80   6e0e80:	eb 74                	jmp    6e0ef6 <shrink_lruvec+0xff6>
0f82   6e0e82:	48 8d bc 24 18 01 00 00 	lea    0x118(%rsp),%rdi
0f8a   6e0e8a:	48 89 f8             	mov    %rdi,%rax
0f8d   6e0e8d:	48 c1 e8 03          	shr    $0x3,%rax
0f91   6e0e91:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0f96   6e0e96:	74 05                	je     6e0e9d <shrink_lruvec+0xf9d>
0f98   6e0e98:	e8 00 00 00 00       	call   6e0e9d <shrink_lruvec+0xf9d>	6e0e99: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0f9d   6e0e9d:	48 8b 9c 24 18 01 00 00 	mov    0x118(%rsp),%rbx
0fa5   6e0ea5:	31 ff                	xor    %edi,%edi
0fa7   6e0ea7:	48 89 de             	mov    %rbx,%rsi
0faa   6e0eaa:	e8 00 00 00 00       	call   6e0eaf <shrink_lruvec+0xfaf>	6e0eab: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0faf   6e0eaf:	48 85 db             	test   %rbx,%rbx
0fb2   6e0eb2:	74 07                	je     6e0ebb <shrink_lruvec+0xfbb>
0fb4   6e0eb4:	e8 00 00 00 00       	call   6e0eb9 <shrink_lruvec+0xfb9>	6e0eb5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0fb9   6e0eb9:	eb 3b                	jmp    6e0ef6 <shrink_lruvec+0xff6>
0fbb   6e0ebb:	48 8d bc 24 10 01 00 00 	lea    0x110(%rsp),%rdi
0fc3   6e0ec3:	48 89 f8             	mov    %rdi,%rax
0fc6   6e0ec6:	48 c1 e8 03          	shr    $0x3,%rax
0fca   6e0eca:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
0fcf   6e0ecf:	74 05                	je     6e0ed6 <shrink_lruvec+0xfd6>
0fd1   6e0ed1:	e8 00 00 00 00       	call   6e0ed6 <shrink_lruvec+0xfd6>	6e0ed2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fd6   6e0ed6:	48 8b 9c 24 10 01 00 00 	mov    0x110(%rsp),%rbx
0fde   6e0ede:	31 ff                	xor    %edi,%edi
0fe0   6e0ee0:	48 89 de             	mov    %rbx,%rsi
0fe3   6e0ee3:	e8 00 00 00 00       	call   6e0ee8 <shrink_lruvec+0xfe8>	6e0ee4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0fe8   6e0ee8:	48 85 db             	test   %rbx,%rbx
0feb   6e0eeb:	0f 84 c6 16 00 00    	je     6e25b7 <shrink_lruvec+0x26b7>
0ff1   6e0ef1:	e8 00 00 00 00       	call   6e0ef6 <shrink_lruvec+0xff6>	6e0ef2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0ff6   6e0ef6:	4c 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%r15
0ffe   6e0efe:	45 31 e4             	xor    %r12d,%r12d
1001   6e0f01:	eb 41                	jmp    6e0f44 <shrink_lruvec+0x1044>
1003   6e0f03:	e8 00 00 00 00       	call   6e0f08 <shrink_lruvec+0x1008>	6e0f04: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1008   6e0f08:	4c 89 ff             	mov    %r15,%rdi
100b   6e0f0b:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
1010   6e0f10:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
1015   6e0f15:	44 89 e1             	mov    %r12d,%ecx
1018   6e0f18:	e8 e3 93 00 00       	call   6ea300 <shrink_active_list>
101d   6e0f1d:	45 31 ff             	xor    %r15d,%r15d
1020   6e0f20:	4c 01 bc 24 e0 00 00 00 	add    %r15,0xe0(%rsp)
1028   6e0f28:	4c 8b 7c 24 60       	mov    0x60(%rsp),%r15
102d   6e0f2d:	49 83 fc 03          	cmp    $0x3,%r12
1031   6e0f31:	0f 84 8b 12 00 00    	je     6e21c2 <shrink_lruvec+0x22c2>
1037   6e0f37:	e8 00 00 00 00       	call   6e0f3c <shrink_lruvec+0x103c>	6e0f38: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
103c   6e0f3c:	49 83 c7 08          	add    $0x8,%r15
1040   6e0f40:	49 83 c4 01          	add    $0x1,%r12
1044   6e0f44:	4d 89 fe             	mov    %r15,%r14
1047   6e0f47:	49 c1 ee 03          	shr    $0x3,%r14
104b   6e0f4b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1055   6e0f55:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
105a   6e0f5a:	74 08                	je     6e0f64 <shrink_lruvec+0x1064>
105c   6e0f5c:	4c 89 ff             	mov    %r15,%rdi
105f   6e0f5f:	e8 00 00 00 00       	call   6e0f64 <shrink_lruvec+0x1064>	6e0f60: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1064   6e0f64:	4c 89 64 24 08       	mov    %r12,0x8(%rsp)
1069   6e0f69:	4a 8b 9c e4 00 01 00 00 	mov    0x100(%rsp,%r12,8),%rbx
1071   6e0f71:	31 ff                	xor    %edi,%edi
1073   6e0f73:	48 89 de             	mov    %rbx,%rsi
1076   6e0f76:	e8 00 00 00 00       	call   6e0f7b <shrink_lruvec+0x107b>	6e0f77: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
107b   6e0f7b:	48 85 db             	test   %rbx,%rbx
107e   6e0f7e:	0f 84 fa 00 00 00    	je     6e107e <shrink_lruvec+0x117e>
1084   6e0f84:	4c 89 7c 24 60       	mov    %r15,0x60(%rsp)
1089   6e0f89:	bf 20 00 00 00       	mov    $0x20,%edi
108e   6e0f8e:	48 89 de             	mov    %rbx,%rsi
1091   6e0f91:	e8 00 00 00 00       	call   6e0f96 <shrink_lruvec+0x1096>	6e0f92: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1096   6e0f96:	48 83 fb 20          	cmp    $0x20,%rbx
109a   6e0f9a:	41 bf 20 00 00 00    	mov    $0x20,%r15d
10a0   6e0fa0:	4c 0f 42 fb          	cmovb  %rbx,%r15
10a4   6e0fa4:	4c 29 fb             	sub    %r15,%rbx
10a7   6e0fa7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
10b1   6e0fb1:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
10b6   6e0fb6:	49 89 c6             	mov    %rax,%r14
10b9   6e0fb9:	74 0a                	je     6e0fc5 <shrink_lruvec+0x10c5>
10bb   6e0fbb:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
10c0   6e0fc0:	e8 00 00 00 00       	call   6e0fc5 <shrink_lruvec+0x10c5>	6e0fc1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
10c5   6e0fc5:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
10ca   6e0fca:	48 89 9c c4 00 01 00 00 	mov    %rbx,0x100(%rsp,%rax,8)
10d2   6e0fd2:	89 c3                	mov    %eax,%ebx
10d4   6e0fd4:	81 e3 fd ff ff 7f    	and    $0x7ffffffd,%ebx
10da   6e0fda:	bf 01 00 00 00       	mov    $0x1,%edi
10df   6e0fdf:	89 de                	mov    %ebx,%esi
10e1   6e0fe1:	e8 00 00 00 00       	call   6e0fe6 <shrink_lruvec+0x10e6>	6e0fe2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
10e6   6e0fe6:	83 fb 01             	cmp    $0x1,%ebx
10e9   6e0fe9:	0f 85 a8 00 00 00    	jne    6e1097 <shrink_lruvec+0x1197>
10ef   6e0fef:	48 8b 84 24 d8 00 00 00 	mov    0xd8(%rsp),%rax
10f7   6e0ff7:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
10fc   6e0ffc:	84 c0                	test   %al,%al
10fe   6e0ffe:	0f 85 f0 0d 00 00    	jne    6e1df4 <shrink_lruvec+0x1ef4>
1104   6e1004:	45 0f b7 75 00       	movzwl 0x0(%r13),%r14d
1109   6e1009:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
110e   6e100e:	44 89 e3             	mov    %r12d,%ebx
1111   6e1011:	81 e3 fe ff ff 7f    	and    $0x7ffffffe,%ebx
1117   6e1017:	bf 02 00 00 00       	mov    $0x2,%edi
111c   6e101c:	89 de                	mov    %ebx,%esi
111e   6e101e:	e8 00 00 00 00       	call   6e1023 <shrink_lruvec+0x1123>	6e101f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1123   6e1023:	83 fb 02             	cmp    $0x2,%ebx
1126   6e1026:	0f 94 c1             	sete   %cl
1129   6e1029:	bb 01 00 00 00       	mov    $0x1,%ebx
112e   6e102e:	d3 e3                	shl    %cl,%ebx
1130   6e1030:	44 89 f6             	mov    %r14d,%esi
1133   6e1033:	21 de                	and    %ebx,%esi
1135   6e1035:	31 ff                	xor    %edi,%edi
1137   6e1037:	e8 00 00 00 00       	call   6e103c <shrink_lruvec+0x113c>	6e1038: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
113c   6e103c:	44 21 f3             	and    %r14d,%ebx
113f   6e103f:	0f 85 be fe ff ff    	jne    6e0f03 <shrink_lruvec+0x1003>
1145   6e1045:	e8 00 00 00 00       	call   6e104a <shrink_lruvec+0x114a>	6e1046: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
114a   6e104a:	41 83 ce 08          	or     $0x8,%r14d
114e   6e104e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1158   6e1058:	48 8b 8c 24 d8 00 00 00 	mov    0xd8(%rsp),%rcx
1160   6e1060:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
1164   6e1064:	84 c0                	test   %al,%al
1166   6e1066:	0f 85 7d 10 00 00    	jne    6e20e9 <shrink_lruvec+0x21e9>
116c   6e106c:	66 45 89 75 00       	mov    %r14w,0x0(%r13)
1171   6e1071:	45 31 ff             	xor    %r15d,%r15d
1174   6e1074:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1179   6e1079:	e9 a2 fe ff ff       	jmp    6e0f20 <shrink_lruvec+0x1020>
117e   6e107e:	e8 00 00 00 00       	call   6e1083 <shrink_lruvec+0x1183>	6e107f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1183   6e1083:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1188   6e1088:	49 83 fc 03          	cmp    $0x3,%r12
118c   6e108c:	0f 85 a5 fe ff ff    	jne    6e0f37 <shrink_lruvec+0x1037>
1192   6e1092:	e9 2b 11 00 00       	jmp    6e21c2 <shrink_lruvec+0x22c2>
1197   6e1097:	4c 89 7c 24 38       	mov    %r15,0x38(%rsp)
119c   6e109c:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
11a1   6e10a1:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
11a6   6e10a6:	48 8b 9c 24 38 01 00 00 	mov    0x138(%rsp),%rbx
11ae   6e10ae:	4c 8d ac 24 40 01 00 00 	lea    0x140(%rsp),%r13
11b6   6e10b6:	74 08                	je     6e10c0 <shrink_lruvec+0x11c0>
11b8   6e10b8:	4c 89 ef             	mov    %r13,%rdi
11bb   6e10bb:	e8 00 00 00 00       	call   6e10c0 <shrink_lruvec+0x11c0>	6e10bc: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
11c0   6e10c0:	4c 89 ac 24 40 01 00 00 	mov    %r13,0x140(%rsp)
11c8   6e10c8:	48 8d bc 24 48 01 00 00 	lea    0x148(%rsp),%rdi
11d0   6e10d0:	48 89 f8             	mov    %rdi,%rax
11d3   6e10d3:	48 c1 e8 03          	shr    $0x3,%rax
11d7   6e10d7:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
11dc   6e10dc:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
11e1   6e10e1:	74 05                	je     6e10e8 <shrink_lruvec+0x11e8>
11e3   6e10e3:	e8 00 00 00 00       	call   6e10e8 <shrink_lruvec+0x11e8>	6e10e4: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
11e8   6e10e8:	48 8d 84 24 40 01 00 00 	lea    0x140(%rsp),%rax
11f0   6e10f0:	48 89 84 24 48 01 00 00 	mov    %rax,0x148(%rsp)
11f8   6e10f8:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
11fd   6e10fd:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1202   6e1102:	74 0a                	je     6e110e <shrink_lruvec+0x120e>
1204   6e1104:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
1209   6e1109:	e8 00 00 00 00       	call   6e110e <shrink_lruvec+0x120e>	6e110a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
120e   6e110e:	48 c7 44 24 68 00 00 00 00 	movq   $0x0,0x68(%rsp)
1217   6e1117:	ba 2c 00 00 00       	mov    $0x2c,%edx
121c   6e111c:	48 8d bc 24 90 00 00 00 	lea    0x90(%rsp),%rdi
1224   6e1124:	31 f6                	xor    %esi,%esi
1226   6e1126:	e8 00 00 00 00       	call   6e112b <shrink_lruvec+0x122b>	6e1127: R_X86_64_PLT32	memset-0x4
122b   6e112b:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
1230   6e1130:	41 89 c4             	mov    %eax,%r12d
1233   6e1133:	41 81 e4 fe ff ff 7f 	and    $0x7ffffffe,%r12d
123a   6e113a:	bf 02 00 00 00       	mov    $0x2,%edi
123f   6e113f:	44 89 e6             	mov    %r12d,%esi
1242   6e1142:	e8 00 00 00 00       	call   6e1147 <shrink_lruvec+0x1247>	6e1143: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1247   6e1147:	48 89 d8             	mov    %rbx,%rax
124a   6e114a:	48 c1 e8 03          	shr    $0x3,%rax
124e   6e114e:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1253   6e1153:	74 08                	je     6e115d <shrink_lruvec+0x125d>
1255   6e1155:	48 89 df             	mov    %rbx,%rdi
1258   6e1158:	e8 00 00 00 00       	call   6e115d <shrink_lruvec+0x125d>	6e1159: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
125d   6e115d:	48 8b 03             	mov    (%rbx),%rax
1260   6e1160:	48 89 44 24 40       	mov    %rax,0x40(%rsp)
1265   6e1165:	65 4c 8b 2c 25 00 00 00 00 	mov    %gs:0x0,%r13	6e116a: R_X86_64_32S	current_task
126e   6e116e:	49 8d 5d 2c          	lea    0x2c(%r13),%rbx
1272   6e1172:	48 89 d8             	mov    %rbx,%rax
1275   6e1175:	48 c1 e8 03          	shr    $0x3,%rax
1279   6e1179:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
127e   6e117e:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1283   6e1183:	84 c0                	test   %al,%al
1285   6e1185:	0f 85 87 0c 00 00    	jne    6e1e12 <shrink_lruvec+0x1f12>
128b   6e118b:	48 89 9c 24 f8 00 00 00 	mov    %rbx,0xf8(%rsp)
1293   6e1193:	8b 1b                	mov    (%rbx),%ebx
1295   6e1195:	be 00 00 02 00       	mov    $0x20000,%esi
129a   6e119a:	21 de                	and    %ebx,%esi
129c   6e119c:	31 ff                	xor    %edi,%edi
129e   6e119e:	e8 00 00 00 00       	call   6e11a3 <shrink_lruvec+0x12a3>	6e119f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
12a3   6e11a3:	b8 00 00 02 00       	mov    $0x20000,%eax
12a8   6e11a8:	21 c3                	and    %eax,%ebx
12aa   6e11aa:	44 89 a4 24 88 00 00 00 	mov    %r12d,0x88(%rsp)
12b2   6e11b2:	75 5d                	jne    6e1211 <shrink_lruvec+0x1311>
12b4   6e11b4:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
12bc   6e11bc:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
12c1   6e11c1:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
12c9   6e11c9:	74 08                	je     6e11d3 <shrink_lruvec+0x12d3>
12cb   6e11cb:	48 89 df             	mov    %rbx,%rdi
12ce   6e11ce:	e8 00 00 00 00       	call   6e11d3 <shrink_lruvec+0x12d3>	6e11cf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
12d3   6e11d3:	48 83 3b 00          	cmpq   $0x0,(%rbx)
12d7   6e11d7:	74 4c                	je     6e1225 <shrink_lruvec+0x1325>
12d9   6e11d9:	48 8b 84 24 70 01 00 00 	mov    0x170(%rsp),%rax
12e1   6e11e1:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
12e6   6e11e6:	84 c0                	test   %al,%al
12e8   6e11e8:	0f 85 19 0f 00 00    	jne    6e2107 <shrink_lruvec+0x2207>
12ee   6e11ee:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e11f4 <shrink_lruvec+0x12f4>	6e11f0: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
12f4   6e11f4:	31 ff                	xor    %edi,%edi
12f6   6e11f6:	89 de                	mov    %ebx,%esi
12f8   6e11f8:	e8 00 00 00 00       	call   6e11fd <shrink_lruvec+0x12fd>	6e11f9: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
12fd   6e11fd:	85 db                	test   %ebx,%ebx
12ff   6e11ff:	0f 8e 8f 08 00 00    	jle    6e1a94 <shrink_lruvec+0x1b94>
1305   6e1205:	4c 89 6c 24 78       	mov    %r13,0x78(%rsp)
130a   6e120a:	e8 00 00 00 00       	call   6e120f <shrink_lruvec+0x130f>	6e120b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
130f   6e120f:	eb 1e                	jmp    6e122f <shrink_lruvec+0x132f>
1311   6e1211:	e8 00 00 00 00       	call   6e1216 <shrink_lruvec+0x1316>	6e1212: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1316   6e1216:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
131b   6e121b:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
1320   6e1220:	e9 73 01 00 00       	jmp    6e1398 <shrink_lruvec+0x1498>
1325   6e1225:	4c 89 6c 24 78       	mov    %r13,0x78(%rsp)
132a   6e122a:	e8 00 00 00 00       	call   6e122f <shrink_lruvec+0x132f>	6e122b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
132f   6e122f:	45 31 ed             	xor    %r13d,%r13d
1332   6e1232:	41 83 fc 02          	cmp    $0x2,%r12d
1336   6e1236:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6e1239: R_X86_64_32S	vm_node_stat
133d   6e123d:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6e1240: R_X86_64_32S	vm_node_stat+0x10
1344   6e1244:	48 0f 44 d8          	cmove  %rax,%rbx
1348   6e1248:	41 0f 94 c7          	sete   %r15b
134c   6e124c:	49 c7 c4 00 00 00 00 	mov    $0x0,%r12	6e124f: R_X86_64_32S	vm_node_stat+0x38
1353   6e1253:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6e1256: R_X86_64_32S	vm_node_stat+0x40
135a   6e125a:	4c 0f 44 e0          	cmove  %rax,%r12
135e   6e125e:	48 89 df             	mov    %rbx,%rdi
1361   6e1261:	be 08 00 00 00       	mov    $0x8,%esi
1366   6e1266:	e8 00 00 00 00       	call   6e126b <shrink_lruvec+0x136b>	6e1267: R_X86_64_PLT32	__kasan_check_read-0x4
136b   6e126b:	48 89 d8             	mov    %rbx,%rax
136e   6e126e:	48 c1 e8 03          	shr    $0x3,%rax
1372   6e1272:	48 89 84 24 c8 00 00 00 	mov    %rax,0xc8(%rsp)
137a   6e127a:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
137f   6e127f:	74 08                	je     6e1289 <shrink_lruvec+0x1389>
1381   6e1281:	48 89 df             	mov    %rbx,%rdi
1384   6e1284:	e8 00 00 00 00       	call   6e1289 <shrink_lruvec+0x1389>	6e1285: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1389   6e1289:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
138e   6e128e:	4c 8b 33             	mov    (%rbx),%r14
1391   6e1291:	31 ff                	xor    %edi,%edi
1393   6e1293:	4c 89 f6             	mov    %r14,%rsi
1396   6e1296:	e8 00 00 00 00       	call   6e129b <shrink_lruvec+0x139b>	6e1297: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
139b   6e129b:	4d 85 f6             	test   %r14,%r14
139e   6e129e:	b8 00 00 00 00       	mov    $0x0,%eax
13a3   6e12a3:	4c 0f 48 f0          	cmovs  %rax,%r14
13a7   6e12a7:	4c 89 e7             	mov    %r12,%rdi
13aa   6e12aa:	be 08 00 00 00       	mov    $0x8,%esi
13af   6e12af:	e8 00 00 00 00       	call   6e12b4 <shrink_lruvec+0x13b4>	6e12b0: R_X86_64_PLT32	__kasan_check_read-0x4
13b4   6e12b4:	4c 89 e1             	mov    %r12,%rcx
13b7   6e12b7:	48 c1 e9 03          	shr    $0x3,%rcx
13bb   6e12bb:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
13c5   6e12c5:	48 89 8c 24 c8 01 00 00 	mov    %rcx,0x1c8(%rsp)
13cd   6e12cd:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
13d1   6e12d1:	74 08                	je     6e12db <shrink_lruvec+0x13db>
13d3   6e12d3:	4c 89 e7             	mov    %r12,%rdi
13d6   6e12d6:	e8 00 00 00 00       	call   6e12db <shrink_lruvec+0x13db>	6e12d7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
13db   6e12db:	4c 89 a4 24 d0 00 00 00 	mov    %r12,0xd0(%rsp)
13e3   6e12e3:	45 88 fd             	mov    %r15b,%r13b
13e6   6e12e6:	4a 8d 04 ed 38 00 00 00 	lea    0x38(,%r13,8),%rax
13ee   6e12ee:	48 89 84 24 c0 01 00 00 	mov    %rax,0x1c0(%rsp)
13f6   6e12f6:	4c 8b a8 00 00 00 00 	mov    0x0(%rax),%r13	6e12f9: R_X86_64_32S	vm_node_stat
13fd   6e12fd:	31 ff                	xor    %edi,%edi
13ff   6e12ff:	4c 89 ee             	mov    %r13,%rsi
1402   6e1302:	e8 00 00 00 00       	call   6e1307 <shrink_lruvec+0x1407>	6e1303: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1407   6e1307:	4d 85 ed             	test   %r13,%r13
140a   6e130a:	b8 00 00 00 00       	mov    $0x0,%eax
140f   6e130f:	4c 0f 48 e8          	cmovs  %rax,%r13
1413   6e1313:	48 8b 9c 24 58 01 00 00 	mov    0x158(%rsp),%rbx
141b   6e131b:	48 89 d9             	mov    %rbx,%rcx
141e   6e131e:	48 c1 e9 03          	shr    $0x3,%rcx
1422   6e1322:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
142c   6e132c:	48 89 8c 24 b8 01 00 00 	mov    %rcx,0x1b8(%rsp)
1434   6e1334:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
1438   6e1338:	84 c0                	test   %al,%al
143a   6e133a:	0f 85 8c 0d 00 00    	jne    6e20cc <shrink_lruvec+0x21cc>
1440   6e1340:	8b 1b                	mov    (%rbx),%ebx
1442   6e1342:	b8 c0 00 00 00       	mov    $0xc0,%eax
1447   6e1347:	21 c3                	and    %eax,%ebx
1449   6e1349:	bf c0 00 00 00       	mov    $0xc0,%edi
144e   6e134e:	89 de                	mov    %ebx,%esi
1450   6e1350:	e8 00 00 00 00       	call   6e1355 <shrink_lruvec+0x1455>	6e1351: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1455   6e1355:	4d 89 f4             	mov    %r14,%r12
1458   6e1358:	49 c1 ec 03          	shr    $0x3,%r12
145c   6e135c:	81 fb c0 00 00 00    	cmp    $0xc0,%ebx
1462   6e1362:	4d 0f 45 e6          	cmovne %r14,%r12
1466   6e1366:	4c 89 ef             	mov    %r13,%rdi
1469   6e1369:	4c 89 e6             	mov    %r12,%rsi
146c   6e136c:	e8 00 00 00 00       	call   6e1371 <shrink_lruvec+0x1471>	6e136d: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1471   6e1371:	4d 39 e5             	cmp    %r12,%r13
1474   6e1374:	0f 87 0e 08 00 00    	ja     6e1b88 <shrink_lruvec+0x1c88>
147a   6e137a:	e8 00 00 00 00       	call   6e137f <shrink_lruvec+0x147f>	6e137b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
147f   6e137f:	4c 8b 64 24 10       	mov    0x10(%rsp),%r12
1484   6e1384:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
148e   6e138e:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
1493   6e1393:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
1498   6e1398:	45 31 ed             	xor    %r13d,%r13d
149b   6e139b:	83 bc 24 88 00 00 00 02 	cmpl   $0x2,0x88(%rsp)
14a3   6e13a3:	41 0f 94 c5          	sete   %r13b
14a7   6e13a7:	e8 00 00 00 00       	call   6e13ac <shrink_lruvec+0x14ac>	6e13a8: R_X86_64_PLT32	lru_add_drain-0x4
14ac   6e13ac:	4c 89 ff             	mov    %r15,%rdi
14af   6e13af:	e8 00 00 00 00       	call   6e13b4 <shrink_lruvec+0x14b4>	6e13b0: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
14b4   6e13b4:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
14b9   6e13b9:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
14be   6e13be:	48 8d 94 24 40 01 00 00 	lea    0x140(%rsp),%rdx
14c6   6e13c6:	48 8d 4c 24 68       	lea    0x68(%rsp),%rcx
14cb   6e13cb:	4d 89 e0             	mov    %r12,%r8
14ce   6e13ce:	41 89 d9             	mov    %ebx,%r9d
14d1   6e13d1:	e8 2a 9e 00 00       	call   6eb200 <isolate_lru_pages>
14d6   6e13d6:	4c 89 6c 24 28       	mov    %r13,0x28(%rsp)
14db   6e13db:	41 8d 75 07          	lea    0x7(%r13),%esi
14df   6e13df:	48 8b 7c 24 40       	mov    0x40(%rsp),%rdi
14e4   6e13e4:	89 74 24 78          	mov    %esi,0x78(%rsp)
14e8   6e13e8:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
14ed   6e13ed:	48 89 c2             	mov    %rax,%rdx
14f0   6e13f0:	e8 00 00 00 00       	call   6e13f5 <shrink_lruvec+0x14f5>	6e13f1: R_X86_64_PLT32	__mod_node_page_state-0x4
14f5   6e13f5:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
14fa   6e13fa:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
14ff   6e13ff:	84 c0                	test   %al,%al
1501   6e1401:	4d 89 f4             	mov    %r14,%r12
1504   6e1404:	48 8b 9c 24 f8 00 00 00 	mov    0xf8(%rsp),%rbx
150c   6e140c:	0f 85 1d 0a 00 00    	jne    6e1e2f <shrink_lruvec+0x1f2f>
1512   6e1412:	45 31 f6             	xor    %r14d,%r14d
1515   6e1415:	8b 33                	mov    (%rbx),%esi
1517   6e1417:	b8 00 00 02 00       	mov    $0x20000,%eax
151c   6e141c:	21 c6                	and    %eax,%esi
151e   6e141e:	41 0f 94 c5          	sete   %r13b
1522   6e1422:	31 ff                	xor    %edi,%edi
1524   6e1424:	e8 00 00 00 00       	call   6e1429 <shrink_lruvec+0x1529>	6e1425: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1529   6e1429:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
1531   6e1431:	42 80 3c 20 00       	cmpb   $0x0,(%rax,%r12,1)
1536   6e1436:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
153e   6e143e:	74 08                	je     6e1448 <shrink_lruvec+0x1548>
1540   6e1440:	48 89 df             	mov    %rbx,%rdi
1543   6e1443:	e8 00 00 00 00       	call   6e1448 <shrink_lruvec+0x1548>	6e1444: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1548   6e1448:	45 88 ee             	mov    %r13b,%r14b
154b   6e144b:	41 83 ce 1a          	or     $0x1a,%r14d
154f   6e144f:	48 83 3b 00          	cmpq   $0x0,(%rbx)
1553   6e1453:	74 0c                	je     6e1461 <shrink_lruvec+0x1561>
1555   6e1455:	e8 00 00 00 00       	call   6e145a <shrink_lruvec+0x155a>	6e1456: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
155a   6e145a:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
155f   6e145f:	eb 3a                	jmp    6e149b <shrink_lruvec+0x159b>
1561   6e1461:	e8 00 00 00 00       	call   6e1466 <shrink_lruvec+0x1566>	6e1462: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1566   6e1466:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1570   6e1470:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
1575   6e1475:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1579   6e1479:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
157e   6e147e:	74 0a                	je     6e148a <shrink_lruvec+0x158a>
1580   6e1480:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
1585   6e1485:	e8 00 00 00 00       	call   6e148a <shrink_lruvec+0x158a>	6e1486: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
158a   6e148a:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
158f   6e148f:	44 89 f1             	mov    %r14d,%ecx
1592   6e1492:	65 48 01 04 cd 00 00 00 00 	add    %rax,%gs:0x0(,%rcx,8)	6e1497: R_X86_64_32S	vm_event_states
159b   6e149b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
15a5   6e14a5:	48 8b 8c 24 f0 00 00 00 	mov    0xf0(%rsp),%rcx
15ad   6e14ad:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
15b1   6e14b1:	84 c0                	test   %al,%al
15b3   6e14b3:	0f 85 93 09 00 00    	jne    6e1e4c <shrink_lruvec+0x1f4c>
15b9   6e14b9:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e14bf <shrink_lruvec+0x15bf>	6e14bb: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
15bf   6e14bf:	bf 01 00 00 00       	mov    $0x1,%edi
15c4   6e14c4:	89 de                	mov    %ebx,%esi
15c6   6e14c6:	e8 00 00 00 00       	call   6e14cb <shrink_lruvec+0x15cb>	6e14c7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
15cb   6e14cb:	85 db                	test   %ebx,%ebx
15cd   6e14cd:	7e 31                	jle    6e1500 <shrink_lruvec+0x1600>
15cf   6e14cf:	e8 00 00 00 00       	call   6e14d4 <shrink_lruvec+0x15d4>	6e14d0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
15d4   6e14d4:	48 8b 9c 24 30 01 00 00 	mov    0x130(%rsp),%rbx
15dc   6e14dc:	48 89 d8             	mov    %rbx,%rax
15df   6e14df:	48 c1 e8 03          	shr    $0x3,%rax
15e3   6e14e3:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
15ed   6e14ed:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
15f1   6e14f1:	74 08                	je     6e14fb <shrink_lruvec+0x15fb>
15f3   6e14f3:	48 89 df             	mov    %rbx,%rdi
15f6   6e14f6:	e8 00 00 00 00       	call   6e14fb <shrink_lruvec+0x15fb>	6e14f7: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
15fb   6e14fb:	4c 8b 23             	mov    (%rbx),%r12
15fe   6e14fe:	eb 08                	jmp    6e1508 <shrink_lruvec+0x1608>
1600   6e1500:	e8 00 00 00 00       	call   6e1505 <shrink_lruvec+0x1605>	6e1501: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1605   6e1505:	45 31 e4             	xor    %r12d,%r12d
1608   6e1508:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1612   6e1512:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
1617   6e1517:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
161b   6e151b:	74 0a                	je     6e1527 <shrink_lruvec+0x1627>
161d   6e151d:	48 8d 7c 24 68       	lea    0x68(%rsp),%rdi
1622   6e1522:	e8 00 00 00 00       	call   6e1527 <shrink_lruvec+0x1627>	6e1523: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1627   6e1527:	31 db                	xor    %ebx,%ebx
1629   6e1529:	83 bc 24 88 00 00 00 02 	cmpl   $0x2,0x88(%rsp)
1631   6e1531:	0f 94 c3             	sete   %bl
1634   6e1534:	4c 8b 7c 24 68       	mov    0x68(%rsp),%r15
1639   6e1539:	4c 89 e7             	mov    %r12,%rdi
163c   6e153c:	44 89 f6             	mov    %r14d,%esi
163f   6e153f:	4c 89 fa             	mov    %r15,%rdx
1642   6e1542:	e8 00 00 00 00       	call   6e1547 <shrink_lruvec+0x1647>	6e1543: R_X86_64_PLT32	__count_memcg_events-0x4
1647   6e1547:	4c 89 bc 24 c8 00 00 00 	mov    %r15,0xc8(%rsp)
164f   6e154f:	65 4c 01 3c dd 00 00 00 00 	add    %r15,%gs:0x0(,%rbx,8)	6e1554: R_X86_64_32S	vm_event_states+0xe8
1658   6e1558:	4c 89 ef             	mov    %r13,%rdi
165b   6e155b:	e8 00 00 00 00       	call   6e1560 <shrink_lruvec+0x1660>	6e155c: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
1660   6e1560:	31 ff                	xor    %edi,%edi
1662   6e1562:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
1667   6e1567:	4c 89 e6             	mov    %r12,%rsi
166a   6e156a:	e8 00 00 00 00       	call   6e156f <shrink_lruvec+0x166f>	6e156b: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
166f   6e156f:	4d 85 e4             	test   %r12,%r12
1672   6e1572:	0f 84 cc 00 00 00    	je     6e1644 <shrink_lruvec+0x1744>
1678   6e1578:	4c 8d b4 24 40 01 00 00 	lea    0x140(%rsp),%r14
1680   6e1580:	4c 89 f7             	mov    %r14,%rdi
1683   6e1583:	48 8b 5c 24 40       	mov    0x40(%rsp),%rbx
1688   6e1588:	48 89 de             	mov    %rbx,%rsi
168b   6e158b:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
1690   6e1590:	48 8d 8c 24 90 00 00 00 	lea    0x90(%rsp),%rcx
1698   6e1598:	45 31 c0             	xor    %r8d,%r8d
169b   6e159b:	e8 60 69 ff ff       	call   6d7f00 <shrink_page_list>
16a0   6e15a0:	89 84 24 d0 00 00 00 	mov    %eax,0xd0(%rsp)
16a7   6e15a7:	4c 89 ef             	mov    %r13,%rdi
16aa   6e15aa:	e8 00 00 00 00       	call   6e15af <shrink_lruvec+0x16af>	6e15ab: R_X86_64_PLT32	_raw_spin_lock_irq-0x4
16af   6e15af:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
16b4   6e15b4:	4c 89 f6             	mov    %r14,%rsi
16b7   6e15b7:	e8 c4 af 00 00       	call   6ec580 <move_pages_to_lru>
16bc   6e15bc:	49 f7 dc             	neg    %r12
16bf   6e15bf:	48 89 df             	mov    %rbx,%rdi
16c2   6e15c2:	8b 74 24 78          	mov    0x78(%rsp),%esi
16c6   6e15c6:	4c 89 e2             	mov    %r12,%rdx
16c9   6e15c9:	e8 00 00 00 00       	call   6e15ce <shrink_lruvec+0x16ce>	6e15ca: R_X86_64_PLT32	__mod_node_page_state-0x4
16ce   6e15ce:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
16d8   6e15d8:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
16dd   6e15dd:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
16e2   6e15e2:	84 c0                	test   %al,%al
16e4   6e15e4:	48 8b 9c 24 f8 00 00 00 	mov    0xf8(%rsp),%rbx
16ec   6e15ec:	0f 85 80 08 00 00    	jne    6e1e72 <shrink_lruvec+0x1f72>
16f2   6e15f2:	45 31 f6             	xor    %r14d,%r14d
16f5   6e15f5:	8b 33                	mov    (%rbx),%esi
16f7   6e15f7:	b8 00 00 02 00       	mov    $0x20000,%eax
16fc   6e15fc:	21 c6                	and    %eax,%esi
16fe   6e15fe:	41 0f 94 c5          	sete   %r13b
1702   6e1602:	31 ff                	xor    %edi,%edi
1704   6e1604:	e8 00 00 00 00       	call   6e1609 <shrink_lruvec+0x1709>	6e1605: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1709   6e1609:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
1711   6e1611:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
1716   6e1616:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
171e   6e161e:	74 08                	je     6e1628 <shrink_lruvec+0x1728>
1720   6e1620:	48 89 df             	mov    %rbx,%rdi
1723   6e1623:	e8 00 00 00 00       	call   6e1628 <shrink_lruvec+0x1728>	6e1624: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1728   6e1628:	45 88 ee             	mov    %r13b,%r14b
172b   6e162b:	41 83 ce 16          	or     $0x16,%r14d
172f   6e162f:	48 83 3b 00          	cmpq   $0x0,(%rbx)
1733   6e1633:	44 8b ac 24 d0 00 00 00 	mov    0xd0(%rsp),%r13d
173b   6e163b:	74 14                	je     6e1651 <shrink_lruvec+0x1751>
173d   6e163d:	e8 00 00 00 00       	call   6e1642 <shrink_lruvec+0x1742>	6e163e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1742   6e1642:	eb 1e                	jmp    6e1662 <shrink_lruvec+0x1762>
1744   6e1644:	e8 00 00 00 00       	call   6e1649 <shrink_lruvec+0x1749>	6e1645: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1749   6e1649:	45 31 ff             	xor    %r15d,%r15d
174c   6e164c:	e9 d0 03 00 00       	jmp    6e1a21 <shrink_lruvec+0x1b21>
1751   6e1651:	e8 00 00 00 00       	call   6e1656 <shrink_lruvec+0x1756>	6e1652: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1756   6e1656:	44 89 f0             	mov    %r14d,%eax
1759   6e1659:	65 4c 01 2c c5 00 00 00 00 	add    %r13,%gs:0x0(,%rax,8)	6e165e: R_X86_64_32S	vm_event_states
1762   6e1662:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
1767   6e1667:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1771   6e1671:	48 8b 8c 24 f0 00 00 00 	mov    0xf0(%rsp),%rcx
1779   6e1679:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
177d   6e167d:	84 c0                	test   %al,%al
177f   6e167f:	0f 85 0a 08 00 00    	jne    6e1e8f <shrink_lruvec+0x1f8f>
1785   6e1685:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e168b <shrink_lruvec+0x178b>	6e1687: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
178b   6e168b:	bf 01 00 00 00       	mov    $0x1,%edi
1790   6e1690:	89 de                	mov    %ebx,%esi
1792   6e1692:	e8 00 00 00 00       	call   6e1697 <shrink_lruvec+0x1797>	6e1693: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1797   6e1697:	85 db                	test   %ebx,%ebx
1799   6e1699:	7e 31                	jle    6e16cc <shrink_lruvec+0x17cc>
179b   6e169b:	e8 00 00 00 00       	call   6e16a0 <shrink_lruvec+0x17a0>	6e169c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17a0   6e16a0:	48 8b 9c 24 30 01 00 00 	mov    0x130(%rsp),%rbx
17a8   6e16a8:	48 89 d8             	mov    %rbx,%rax
17ab   6e16ab:	48 c1 e8 03          	shr    $0x3,%rax
17af   6e16af:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
17b9   6e16b9:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
17bd   6e16bd:	74 08                	je     6e16c7 <shrink_lruvec+0x17c7>
17bf   6e16bf:	48 89 df             	mov    %rbx,%rdi
17c2   6e16c2:	e8 00 00 00 00       	call   6e16c7 <shrink_lruvec+0x17c7>	6e16c3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
17c7   6e16c7:	48 8b 3b             	mov    (%rbx),%rdi
17ca   6e16ca:	eb 07                	jmp    6e16d3 <shrink_lruvec+0x17d3>
17cc   6e16cc:	e8 00 00 00 00       	call   6e16d1 <shrink_lruvec+0x17d1>	6e16cd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
17d1   6e16d1:	31 ff                	xor    %edi,%edi
17d3   6e16d3:	31 db                	xor    %ebx,%ebx
17d5   6e16d5:	44 8b bc 24 88 00 00 00 	mov    0x88(%rsp),%r15d
17dd   6e16dd:	41 83 ff 02          	cmp    $0x2,%r15d
17e1   6e16e1:	0f 94 c3             	sete   %bl
17e4   6e16e4:	44 89 f6             	mov    %r14d,%esi
17e7   6e16e7:	4d 89 ee             	mov    %r13,%r14
17ea   6e16ea:	4c 89 ea             	mov    %r13,%rdx
17ed   6e16ed:	e8 00 00 00 00       	call   6e16f2 <shrink_lruvec+0x17f2>	6e16ee: R_X86_64_PLT32	__count_memcg_events-0x4
17f2   6e16f2:	65 4c 01 2c dd 00 00 00 00 	add    %r13,%gs:0x0(,%rbx,8)	6e16f7: R_X86_64_32S	vm_event_states+0xf8
17fb   6e16fb:	4c 89 e7             	mov    %r12,%rdi
17fe   6e16fe:	e8 00 00 00 00       	call   6e1703 <shrink_lruvec+0x1803>	6e16ff: R_X86_64_PLT32	_raw_spin_unlock_irq-0x4
1803   6e1703:	48 8d 84 24 a4 00 00 00 	lea    0xa4(%rsp),%rax
180b   6e170b:	48 c1 e8 03          	shr    $0x3,%rax
180f   6e170f:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
1819   6e1719:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
181d   6e171d:	84 c0                	test   %al,%al
181f   6e171f:	0f 85 90 07 00 00    	jne    6e1eb5 <shrink_lruvec+0x1fb5>
1825   6e1725:	31 f6                	xor    %esi,%esi
1827   6e1727:	41 83 ff 02          	cmp    $0x2,%r15d
182b   6e172b:	40 0f 94 c6          	sete   %sil
182f   6e172f:	8b 94 24 a4 00 00 00 	mov    0xa4(%rsp),%edx
1836   6e1736:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
183b   6e173b:	e8 00 00 00 00       	call   6e1740 <shrink_lruvec+0x1840>	6e173c: R_X86_64_PLT32	lru_note_cost-0x4
1840   6e1740:	48 8b 84 24 f0 00 00 00 	mov    0xf0(%rsp),%rax
1848   6e1748:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
184c   6e174c:	84 c0                	test   %al,%al
184e   6e174e:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
1853   6e1753:	0f 85 84 07 00 00    	jne    6e1edd <shrink_lruvec+0x1fdd>
1859   6e1759:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e175f <shrink_lruvec+0x185f>	6e175b: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
185f   6e175f:	bf 01 00 00 00       	mov    $0x1,%edi
1864   6e1764:	89 de                	mov    %ebx,%esi
1866   6e1766:	e8 00 00 00 00       	call   6e176b <shrink_lruvec+0x186b>	6e1767: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
186b   6e176b:	85 db                	test   %ebx,%ebx
186d   6e176d:	4d 89 ef             	mov    %r13,%r15
1870   6e1770:	7e 17                	jle    6e1789 <shrink_lruvec+0x1889>
1872   6e1772:	e8 00 00 00 00       	call   6e1777 <shrink_lruvec+0x1877>	6e1773: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1877   6e1777:	48 8d 9c 24 40 01 00 00 	lea    0x140(%rsp),%rbx
187f   6e177f:	48 89 df             	mov    %rbx,%rdi
1882   6e1782:	e8 00 00 00 00       	call   6e1787 <shrink_lruvec+0x1887>	6e1783: R_X86_64_PLT32	__mem_cgroup_uncharge_list-0x4
1887   6e1787:	eb 0d                	jmp    6e1796 <shrink_lruvec+0x1896>
1889   6e1789:	e8 00 00 00 00       	call   6e178e <shrink_lruvec+0x188e>	6e178a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
188e   6e178e:	48 8d 9c 24 40 01 00 00 	lea    0x140(%rsp),%rbx
1896   6e1796:	48 89 df             	mov    %rbx,%rdi
1899   6e1799:	e8 00 00 00 00       	call   6e179e <shrink_lruvec+0x189e>	6e179a: R_X86_64_PLT32	free_unref_page_list-0x4
189e   6e179e:	4c 8d b4 24 94 00 00 00 	lea    0x94(%rsp),%r14
18a6   6e17a6:	49 c1 ee 03          	shr    $0x3,%r14
18aa   6e17aa:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
18b4   6e17b4:	41 0f b6 04 06       	movzbl (%r14,%rax,1),%eax
18b9   6e17b9:	84 c0                	test   %al,%al
18bb   6e17bb:	0f 85 42 07 00 00    	jne    6e1f03 <shrink_lruvec+0x2003>
18c1   6e17c1:	8b 9c 24 94 00 00 00 	mov    0x94(%rsp),%ebx
18c8   6e17c8:	4c 89 e7             	mov    %r12,%rdi
18cb   6e17cb:	48 89 de             	mov    %rbx,%rsi
18ce   6e17ce:	e8 00 00 00 00       	call   6e17d3 <shrink_lruvec+0x18d3>	6e17cf: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
18d3   6e17d3:	49 39 dc             	cmp    %rbx,%r12
18d6   6e17d6:	4c 8b ac 24 28 01 00 00 	mov    0x128(%rsp),%r13
18de   6e17de:	75 11                	jne    6e17f1 <shrink_lruvec+0x18f1>
18e0   6e17e0:	e8 00 00 00 00       	call   6e17e5 <shrink_lruvec+0x18e5>	6e17e1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18e5   6e17e5:	bf 01 00 00 00       	mov    $0x1,%edi
18ea   6e17ea:	e8 00 00 00 00       	call   6e17ef <shrink_lruvec+0x18ef>	6e17eb: R_X86_64_PLT32	wakeup_flusher_threads-0x4
18ef   6e17ef:	eb 05                	jmp    6e17f6 <shrink_lruvec+0x18f6>
18f1   6e17f1:	e8 00 00 00 00       	call   6e17f6 <shrink_lruvec+0x18f6>	6e17f2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
18f6   6e17f6:	48 8d 84 24 90 00 00 00 	lea    0x90(%rsp),%rax
18fe   6e17fe:	48 c1 e8 03          	shr    $0x3,%rax
1902   6e1802:	49 bc 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r12
190c   6e180c:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1911   6e1811:	84 c0                	test   %al,%al
1913   6e1813:	0f 85 12 07 00 00    	jne    6e1f2b <shrink_lruvec+0x202b>
1919   6e1819:	8b 9c 24 90 00 00 00 	mov    0x90(%rsp),%ebx
1920   6e1820:	4c 89 e8             	mov    %r13,%rax
1923   6e1823:	48 c1 e8 03          	shr    $0x3,%rax
1927   6e1827:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
192c   6e182c:	84 c0                	test   %al,%al
192e   6e182e:	0f 85 11 07 00 00    	jne    6e1f45 <shrink_lruvec+0x2045>
1934   6e1834:	41 01 5d 00          	add    %ebx,0x0(%r13)
1938   6e1838:	48 8d 84 24 98 00 00 00 	lea    0x98(%rsp),%rax
1940   6e1840:	48 c1 e8 03          	shr    $0x3,%rax
1944   6e1844:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
1949   6e1849:	84 c0                	test   %al,%al
194b   6e184b:	0f 85 12 07 00 00    	jne    6e1f63 <shrink_lruvec+0x2063>
1951   6e1851:	44 8b ac 24 98 00 00 00 	mov    0x98(%rsp),%r13d
1959   6e1859:	48 8b 9c 24 60 01 00 00 	mov    0x160(%rsp),%rbx
1961   6e1861:	48 89 d8             	mov    %rbx,%rax
1964   6e1864:	48 c1 e8 03          	shr    $0x3,%rax
1968   6e1868:	42 0f b6 04 20       	movzbl (%rax,%r12,1),%eax
196d   6e186d:	84 c0                	test   %al,%al
196f   6e186f:	0f 85 16 07 00 00    	jne    6e1f8b <shrink_lruvec+0x208b>
1975   6e1875:	44 01 2b             	add    %r13d,(%rbx)
1978   6e1878:	43 0f b6 04 26       	movzbl (%r14,%r12,1),%eax
197d   6e187d:	84 c0                	test   %al,%al
197f   6e187f:	4d 89 e6             	mov    %r12,%r14
1982   6e1882:	0f 85 20 07 00 00    	jne    6e1fa8 <shrink_lruvec+0x20a8>
1988   6e1888:	44 8b a4 24 94 00 00 00 	mov    0x94(%rsp),%r12d
1990   6e1890:	48 8b 9c 24 e8 01 00 00 	mov    0x1e8(%rsp),%rbx
1998   6e1898:	48 89 d8             	mov    %rbx,%rax
199b   6e189b:	48 c1 e8 03          	shr    $0x3,%rax
199f   6e189f:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
19a4   6e18a4:	84 c0                	test   %al,%al
19a6   6e18a6:	0f 85 24 07 00 00    	jne    6e1fd0 <shrink_lruvec+0x20d0>
19ac   6e18ac:	44 01 23             	add    %r12d,(%rbx)
19af   6e18af:	48 8d 84 24 9c 00 00 00 	lea    0x9c(%rsp),%rax
19b7   6e18b7:	48 c1 e8 03          	shr    $0x3,%rax
19bb   6e18bb:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
19c0   6e18c0:	84 c0                	test   %al,%al
19c2   6e18c2:	0f 85 25 07 00 00    	jne    6e1fed <shrink_lruvec+0x20ed>
19c8   6e18c8:	44 8b a4 24 9c 00 00 00 	mov    0x9c(%rsp),%r12d
19d0   6e18d0:	48 8b 9c 24 e0 01 00 00 	mov    0x1e0(%rsp),%rbx
19d8   6e18d8:	48 89 d8             	mov    %rbx,%rax
19db   6e18db:	48 c1 e8 03          	shr    $0x3,%rax
19df   6e18df:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
19e4   6e18e4:	84 c0                	test   %al,%al
19e6   6e18e6:	0f 85 29 07 00 00    	jne    6e2015 <shrink_lruvec+0x2115>
19ec   6e18ec:	44 01 23             	add    %r12d,(%rbx)
19ef   6e18ef:	48 8d 84 24 a0 00 00 00 	lea    0xa0(%rsp),%rax
19f7   6e18f7:	48 c1 e8 03          	shr    $0x3,%rax
19fb   6e18fb:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1a00   6e1900:	84 c0                	test   %al,%al
1a02   6e1902:	0f 85 2a 07 00 00    	jne    6e2032 <shrink_lruvec+0x2132>
1a08   6e1908:	44 8b a4 24 a0 00 00 00 	mov    0xa0(%rsp),%r12d
1a10   6e1910:	48 8b 9c 24 d8 01 00 00 	mov    0x1d8(%rsp),%rbx
1a18   6e1918:	48 89 d8             	mov    %rbx,%rax
1a1b   6e191b:	48 c1 e8 03          	shr    $0x3,%rax
1a1f   6e191f:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1a24   6e1924:	84 c0                	test   %al,%al
1a26   6e1926:	0f 85 2e 07 00 00    	jne    6e205a <shrink_lruvec+0x215a>
1a2c   6e192c:	44 01 23             	add    %r12d,(%rbx)
1a2f   6e192f:	48 8b 9c 24 d0 01 00 00 	mov    0x1d0(%rsp),%rbx
1a37   6e1937:	48 89 d8             	mov    %rbx,%rax
1a3a   6e193a:	48 c1 e8 03          	shr    $0x3,%rax
1a3e   6e193e:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1a43   6e1943:	84 c0                	test   %al,%al
1a45   6e1945:	0f 85 2c 07 00 00    	jne    6e2077 <shrink_lruvec+0x2177>
1a4b   6e194b:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
1a50   6e1950:	44 01 23             	add    %r12d,(%rbx)
1a53   6e1953:	83 bc 24 88 00 00 00 02 	cmpl   $0x2,0x88(%rsp)
1a5b   6e195b:	48 8b 9c 24 c0 00 00 00 	mov    0xc0(%rsp),%rbx
1a63   6e1963:	75 26                	jne    6e198b <shrink_lruvec+0x1a8b>
1a65   6e1965:	e8 00 00 00 00       	call   6e196a <shrink_lruvec+0x1a6a>	6e1966: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a6a   6e196a:	48 8b 94 24 50 01 00 00 	mov    0x150(%rsp),%rdx
1a72   6e1972:	48 89 d0             	mov    %rdx,%rax
1a75   6e1975:	48 c1 e8 03          	shr    $0x3,%rax
1a79   6e1979:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1a7e   6e197e:	84 c0                	test   %al,%al
1a80   6e1980:	0f 85 a7 07 00 00    	jne    6e212d <shrink_lruvec+0x222d>
1a86   6e1986:	44 01 22             	add    %r12d,(%rdx)
1a89   6e1989:	eb 05                	jmp    6e1990 <shrink_lruvec+0x1a90>
1a8b   6e198b:	e8 00 00 00 00       	call   6e1990 <shrink_lruvec+0x1a90>	6e198c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1a90   6e1990:	4c 8b 64 24 40       	mov    0x40(%rsp),%r12
1a95   6e1995:	49 81 c4 e0 13 00 00 	add    $0x13e0,%r12
1a9c   6e199c:	4c 89 e0             	mov    %r12,%rax
1a9f   6e199f:	48 c1 e8 03          	shr    $0x3,%rax
1aa3   6e19a3:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1aa8   6e19a8:	84 c0                	test   %al,%al
1aaa   6e19aa:	0f 85 e4 06 00 00    	jne    6e2094 <shrink_lruvec+0x2194>
1ab0   6e19b0:	45 8b 24 24          	mov    (%r12),%r12d
1ab4   6e19b4:	48 8b 84 24 78 01 00 00 	mov    0x178(%rsp),%rax
1abc   6e19bc:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1ac1   6e19c1:	84 c0                	test   %al,%al
1ac3   6e19c3:	0f 85 e9 06 00 00    	jne    6e20b2 <shrink_lruvec+0x21b2>
1ac9   6e19c9:	44 0f be 2b          	movsbl (%rbx),%r13d
1acd   6e19cd:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e19d3 <shrink_lruvec+0x1ad3>	6e19cf: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x4
1ad3   6e19d3:	31 ff                	xor    %edi,%edi
1ad5   6e19d5:	89 de                	mov    %ebx,%esi
1ad7   6e19d7:	e8 00 00 00 00       	call   6e19dc <shrink_lruvec+0x1adc>	6e19d8: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1adc   6e19dc:	85 db                	test   %ebx,%ebx
1ade   6e19de:	7e 50                	jle    6e1a30 <shrink_lruvec+0x1b30>
1ae0   6e19e0:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 6e19e7 <shrink_lruvec+0x1ae7>	6e19e3: R_X86_64_PC32	cpu_number-0x4
1ae7   6e19e7:	89 d8                	mov    %ebx,%eax
1ae9   6e19e9:	c1 e8 06             	shr    $0x6,%eax
1aec   6e19ec:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	6e19f0: R_X86_64_32S	__cpu_online_mask
1af4   6e19f4:	be 08 00 00 00       	mov    $0x8,%esi
1af9   6e19f9:	e8 00 00 00 00       	call   6e19fe <shrink_lruvec+0x1afe>	6e19fa: R_X86_64_PLT32	__kasan_check_read-0x4
1afe   6e19fe:	89 d8                	mov    %ebx,%eax
1b00   6e1a00:	31 f6                	xor    %esi,%esi
1b02   6e1a02:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 6e1a0a <shrink_lruvec+0x1b0a>	6e1a06: R_X86_64_PC32	__cpu_online_mask-0x4
1b0a   6e1a0a:	0f 92 c3             	setb   %bl
1b0d   6e1a0d:	40 0f 92 c6          	setb   %sil
1b11   6e1a11:	31 ff                	xor    %edi,%edi
1b13   6e1a13:	e8 00 00 00 00       	call   6e1a18 <shrink_lruvec+0x1b18>	6e1a14: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1b18   6e1a18:	84 db                	test   %bl,%bl
1b1a   6e1a1a:	75 1b                	jne    6e1a37 <shrink_lruvec+0x1b37>
1b1c   6e1a1c:	e8 00 00 00 00       	call   6e1a21 <shrink_lruvec+0x1b21>	6e1a1d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b21   6e1a21:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
1b26   6e1a26:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1b2b   6e1a2b:	e9 f0 f4 ff ff       	jmp    6e0f20 <shrink_lruvec+0x1020>
1b30   6e1a30:	e8 00 00 00 00       	call   6e1a35 <shrink_lruvec+0x1b35>	6e1a31: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b35   6e1a35:	eb 73                	jmp    6e1aaa <shrink_lruvec+0x1baa>
1b37   6e1a37:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 6e1a3e <shrink_lruvec+0x1b3e>	6e1a3a: R_X86_64_PC32	__preempt_count-0x4
1b3e   6e1a3e:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 6e1a45 <shrink_lruvec+0x1b45>	6e1a41: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
1b45   6e1a45:	48 85 db             	test   %rbx,%rbx
1b48   6e1a48:	74 54                	je     6e1a9e <shrink_lruvec+0x1b9e>
1b4a   6e1a4a:	e8 00 00 00 00       	call   6e1a4f <shrink_lruvec+0x1b4f>	6e1a4b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b4f   6e1a4f:	48 83 c3 08          	add    $0x8,%rbx
1b53   6e1a53:	48 89 d8             	mov    %rbx,%rax
1b56   6e1a56:	48 c1 e8 03          	shr    $0x3,%rax
1b5a   6e1a5a:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1b5f   6e1a5f:	74 08                	je     6e1a69 <shrink_lruvec+0x1b69>
1b61   6e1a61:	48 89 df             	mov    %rbx,%rdi
1b64   6e1a64:	e8 00 00 00 00       	call   6e1a69 <shrink_lruvec+0x1b69>	6e1a65: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1b69   6e1a69:	48 8b 3b             	mov    (%rbx),%rdi
1b6c   6e1a6c:	44 89 e6             	mov    %r12d,%esi
1b6f   6e1a6f:	48 8b 94 24 c8 00 00 00 	mov    0xc8(%rsp),%rdx
1b77   6e1a77:	4c 89 f9             	mov    %r15,%rcx
1b7a   6e1a7a:	4c 8d 84 24 90 00 00 00 	lea    0x90(%rsp),%r8
1b82   6e1a82:	45 89 e9             	mov    %r13d,%r9d
1b85   6e1a85:	ff 74 24 28          	push   0x28(%rsp)
1b89   6e1a89:	e8 00 00 00 00       	call   6e1a8e <shrink_lruvec+0x1b8e>	6e1a8a: R_X86_64_PLT32	__SCT__tp_func_mm_vmscan_lru_shrink_inactive-0x4
1b8e   6e1a8e:	48 83 c4 08          	add    $0x8,%rsp
1b92   6e1a92:	eb 0f                	jmp    6e1aa3 <shrink_lruvec+0x1ba3>
1b94   6e1a94:	e8 00 00 00 00       	call   6e1a99 <shrink_lruvec+0x1b99>	6e1a95: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1b99   6e1a99:	e9 78 f7 ff ff       	jmp    6e1216 <shrink_lruvec+0x1316>
1b9e   6e1a9e:	e8 00 00 00 00       	call   6e1aa3 <shrink_lruvec+0x1ba3>	6e1a9f: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ba3   6e1aa3:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 6e1aaa <shrink_lruvec+0x1baa>	6e1aa6: R_X86_64_PC32	__preempt_count-0x4
1baa   6e1aaa:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
1baf   6e1aaf:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # 6e1ab6 <shrink_lruvec+0x1bb6>	6e1ab2: R_X86_64_PC32	cpu_number-0x4
1bb6   6e1ab6:	89 d8                	mov    %ebx,%eax
1bb8   6e1ab8:	c1 e8 06             	shr    $0x6,%eax
1bbb   6e1abb:	48 8d 3c c5 00 00 00 00 	lea    0x0(,%rax,8),%rdi	6e1abf: R_X86_64_32S	__cpu_online_mask
1bc3   6e1ac3:	be 08 00 00 00       	mov    $0x8,%esi
1bc8   6e1ac8:	e8 00 00 00 00       	call   6e1acd <shrink_lruvec+0x1bcd>	6e1ac9: R_X86_64_PLT32	__kasan_check_read-0x4
1bcd   6e1acd:	89 d8                	mov    %ebx,%eax
1bcf   6e1acf:	31 f6                	xor    %esi,%esi
1bd1   6e1ad1:	48 0f a3 05 00 00 00 00 	bt     %rax,0x0(%rip)        # 6e1ad9 <shrink_lruvec+0x1bd9>	6e1ad5: R_X86_64_PC32	__cpu_online_mask-0x4
1bd9   6e1ad9:	0f 92 c3             	setb   %bl
1bdc   6e1adc:	40 0f 92 c6          	setb   %sil
1be0   6e1ae0:	31 ff                	xor    %edi,%edi
1be2   6e1ae2:	e8 00 00 00 00       	call   6e1ae7 <shrink_lruvec+0x1be7>	6e1ae3: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp1-0x4
1be7   6e1ae7:	84 db                	test   %bl,%bl
1be9   6e1ae9:	75 0f                	jne    6e1afa <shrink_lruvec+0x1bfa>
1beb   6e1aeb:	e8 00 00 00 00       	call   6e1af0 <shrink_lruvec+0x1bf0>	6e1aec: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1bf0   6e1af0:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1bf5   6e1af5:	e9 26 f4 ff ff       	jmp    6e0f20 <shrink_lruvec+0x1020>
1bfa   6e1afa:	65 ff 05 00 00 00 00 	incl   %gs:0x0(%rip)        # 6e1b01 <shrink_lruvec+0x1c01>	6e1afd: R_X86_64_PC32	__preempt_count-0x4
1c01   6e1b01:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 6e1b08 <shrink_lruvec+0x1c08>	6e1b04: R_X86_64_PC32	__tracepoint_mm_vmscan_lru_shrink_inactive+0x34
1c08   6e1b08:	e8 00 00 00 00       	call   6e1b0d <shrink_lruvec+0x1c0d>	6e1b09: R_X86_64_PLT32	rcu_read_lock_sched_held-0x4
1c0d   6e1b0d:	89 c3                	mov    %eax,%ebx
1c0f   6e1b0f:	31 ff                	xor    %edi,%edi
1c11   6e1b11:	89 c6                	mov    %eax,%esi
1c13   6e1b13:	e8 00 00 00 00       	call   6e1b18 <shrink_lruvec+0x1c18>	6e1b14: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1c18   6e1b18:	85 db                	test   %ebx,%ebx
1c1a   6e1b1a:	74 16                	je     6e1b32 <shrink_lruvec+0x1c32>
1c1c   6e1b1c:	e8 00 00 00 00       	call   6e1b21 <shrink_lruvec+0x1c21>	6e1b1d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c21   6e1b21:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1c26   6e1b26:	65 ff 0d 00 00 00 00 	decl   %gs:0x0(%rip)        # 6e1b2d <shrink_lruvec+0x1c2d>	6e1b29: R_X86_64_PC32	__preempt_count-0x4
1c2d   6e1b2d:	e9 ee f3 ff ff       	jmp    6e0f20 <shrink_lruvec+0x1020>
1c32   6e1b32:	e8 00 00 00 00       	call   6e1b37 <shrink_lruvec+0x1c37>	6e1b33: R_X86_64_PLT32	debug_lockdep_rcu_enabled-0x4
1c37   6e1b37:	89 c3                	mov    %eax,%ebx
1c39   6e1b39:	31 ff                	xor    %edi,%edi
1c3b   6e1b3b:	89 c6                	mov    %eax,%esi
1c3d   6e1b3d:	e8 00 00 00 00       	call   6e1b42 <shrink_lruvec+0x1c42>	6e1b3e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1c42   6e1b42:	85 db                	test   %ebx,%ebx
1c44   6e1b44:	74 15                	je     6e1b5b <shrink_lruvec+0x1c5b>
1c46   6e1b46:	80 3d 00 00 00 00 01 	cmpb   $0x1,0x0(%rip)        # 6e1b4d <shrink_lruvec+0x1c4d>	6e1b48: R_X86_64_PC32	.data.unlikely+0x2df
1c4d   6e1b4d:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1c52   6e1b52:	75 0e                	jne    6e1b62 <shrink_lruvec+0x1c62>
1c54   6e1b54:	e8 00 00 00 00       	call   6e1b59 <shrink_lruvec+0x1c59>	6e1b55: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c59   6e1b59:	eb cb                	jmp    6e1b26 <shrink_lruvec+0x1c26>
1c5b   6e1b5b:	e8 00 00 00 00       	call   6e1b60 <shrink_lruvec+0x1c60>	6e1b5c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c60   6e1b60:	eb bf                	jmp    6e1b21 <shrink_lruvec+0x1c21>
1c62   6e1b62:	e8 00 00 00 00       	call   6e1b67 <shrink_lruvec+0x1c67>	6e1b63: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1c67   6e1b67:	c6 05 00 00 00 00 01 	movb   $0x1,0x0(%rip)        # 6e1b6e <shrink_lruvec+0x1c6e>	6e1b69: R_X86_64_PC32	.data.unlikely+0x2df
1c6e   6e1b6e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e1b71: R_X86_64_32S	.rodata+0x492480
1c75   6e1b75:	be 84 01 00 00       	mov    $0x184,%esi
1c7a   6e1b7a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	6e1b7d: R_X86_64_32S	.rodata+0x4900e0
1c81   6e1b81:	e8 00 00 00 00       	call   6e1b86 <shrink_lruvec+0x1c86>	6e1b82: R_X86_64_PLT32	lockdep_rcu_suspicious-0x4
1c86   6e1b86:	eb 9e                	jmp    6e1b26 <shrink_lruvec+0x1c26>
1c88   6e1b88:	bf 64 00 00 00       	mov    $0x64,%edi
1c8d   6e1b8d:	e8 00 00 00 00       	call   6e1b92 <shrink_lruvec+0x1c92>	6e1b8e: R_X86_64_PLT32	msleep-0x4
1c92   6e1b92:	4c 8b 64 24 78       	mov    0x78(%rsp),%r12
1c97   6e1b97:	4c 89 e7             	mov    %r12,%rdi
1c9a   6e1b9a:	be 08 00 00 00       	mov    $0x8,%esi
1c9f   6e1b9f:	e8 00 00 00 00       	call   6e1ba4 <shrink_lruvec+0x1ca4>	6e1ba0: R_X86_64_PLT32	__kasan_check_read-0x4
1ca4   6e1ba4:	4c 89 e0             	mov    %r12,%rax
1ca7   6e1ba7:	48 c1 e8 03          	shr    $0x3,%rax
1cab   6e1bab:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
1cb5   6e1bb5:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1cba   6e1bba:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
1cbf   6e1bbf:	74 08                	je     6e1bc9 <shrink_lruvec+0x1cc9>
1cc1   6e1bc1:	4c 89 e7             	mov    %r12,%rdi
1cc4   6e1bc4:	e8 00 00 00 00       	call   6e1bc9 <shrink_lruvec+0x1cc9>	6e1bc5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1cc9   6e1bc9:	49 8b 1c 24          	mov    (%r12),%rbx
1ccd   6e1bcd:	48 89 de             	mov    %rbx,%rsi
1cd0   6e1bd0:	48 83 e6 04          	and    $0x4,%rsi
1cd4   6e1bd4:	31 ff                	xor    %edi,%edi
1cd6   6e1bd6:	e8 00 00 00 00       	call   6e1bdb <shrink_lruvec+0x1cdb>	6e1bd7: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1cdb   6e1bdb:	48 83 e3 04          	and    $0x4,%rbx
1cdf   6e1bdf:	75 07                	jne    6e1be8 <shrink_lruvec+0x1ce8>
1ce1   6e1be1:	e8 00 00 00 00       	call   6e1be6 <shrink_lruvec+0x1ce6>	6e1be2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ce6   6e1be6:	eb 43                	jmp    6e1c2b <shrink_lruvec+0x1d2b>
1ce8   6e1be8:	49 81 c4 30 0c 00 00 	add    $0xc30,%r12
1cef   6e1bef:	4c 89 e0             	mov    %r12,%rax
1cf2   6e1bf2:	48 c1 e8 03          	shr    $0x3,%rax
1cf6   6e1bf6:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1cfb   6e1bfb:	74 08                	je     6e1c05 <shrink_lruvec+0x1d05>
1cfd   6e1bfd:	4c 89 e7             	mov    %r12,%rdi
1d00   6e1c00:	e8 00 00 00 00       	call   6e1c05 <shrink_lruvec+0x1d05>	6e1c01: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d05   6e1c05:	49 8b 1c 24          	mov    (%r12),%rbx
1d09   6e1c09:	be 00 01 00 00       	mov    $0x100,%esi
1d0e   6e1c0e:	48 21 de             	and    %rbx,%rsi
1d11   6e1c11:	31 ff                	xor    %edi,%edi
1d13   6e1c13:	e8 00 00 00 00       	call   6e1c18 <shrink_lruvec+0x1d18>	6e1c14: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1d18   6e1c18:	b8 00 01 00 00       	mov    $0x100,%eax
1d1d   6e1c1d:	48 21 c3             	and    %rax,%rbx
1d20   6e1c20:	0f 85 a7 00 00 00    	jne    6e1ccd <shrink_lruvec+0x1dcd>
1d26   6e1c26:	e8 00 00 00 00       	call   6e1c2b <shrink_lruvec+0x1d2b>	6e1c27: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1d2b   6e1c2b:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
1d30   6e1c30:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1d35   6e1c35:	84 c0                	test   %al,%al
1d37   6e1c37:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
1d3c   6e1c3c:	48 8b 9c 24 f8 00 00 00 	mov    0xf8(%rsp),%rbx
1d44   6e1c44:	4c 8b a4 24 d0 00 00 00 	mov    0xd0(%rsp),%r12
1d4c   6e1c4c:	0f 85 0f 05 00 00    	jne    6e2161 <shrink_lruvec+0x2261>
1d52   6e1c52:	8b 1b                	mov    (%rbx),%ebx
1d54   6e1c54:	be 00 00 02 00       	mov    $0x20000,%esi
1d59   6e1c59:	21 de                	and    %ebx,%esi
1d5b   6e1c5b:	31 ff                	xor    %edi,%edi
1d5d   6e1c5d:	e8 00 00 00 00       	call   6e1c62 <shrink_lruvec+0x1d62>	6e1c5e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1d62   6e1c62:	b8 00 00 02 00       	mov    $0x20000,%eax
1d67   6e1c67:	21 c3                	and    %eax,%ebx
1d69   6e1c69:	75 58                	jne    6e1cc3 <shrink_lruvec+0x1dc3>
1d6b   6e1c6b:	48 8b 84 24 e8 00 00 00 	mov    0xe8(%rsp),%rax
1d73   6e1c73:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1d78   6e1c78:	48 8b 9c 24 80 00 00 00 	mov    0x80(%rsp),%rbx
1d80   6e1c80:	74 08                	je     6e1c8a <shrink_lruvec+0x1d8a>
1d82   6e1c82:	48 89 df             	mov    %rbx,%rdi
1d85   6e1c85:	e8 00 00 00 00       	call   6e1c8a <shrink_lruvec+0x1d8a>	6e1c86: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1d8a   6e1c8a:	48 83 3b 00          	cmpq   $0x0,(%rbx)
1d8e   6e1c8e:	74 52                	je     6e1ce2 <shrink_lruvec+0x1de2>
1d90   6e1c90:	48 8b 84 24 70 01 00 00 	mov    0x170(%rsp),%rax
1d98   6e1c98:	42 0f b6 04 30       	movzbl (%rax,%r14,1),%eax
1d9d   6e1c9d:	84 c0                	test   %al,%al
1d9f   6e1c9f:	0f 85 f7 04 00 00    	jne    6e219c <shrink_lruvec+0x229c>
1da5   6e1ca5:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e1cab <shrink_lruvec+0x1dab>	6e1ca7: R_X86_64_PC32	memory_cgrp_subsys_on_dfl_key-0x4
1dab   6e1cab:	31 ff                	xor    %edi,%edi
1dad   6e1cad:	89 de                	mov    %ebx,%esi
1daf   6e1caf:	e8 00 00 00 00       	call   6e1cb4 <shrink_lruvec+0x1db4>	6e1cb0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1db4   6e1cb4:	85 db                	test   %ebx,%ebx
1db6   6e1cb6:	0f 8e 2e 01 00 00    	jle    6e1dea <shrink_lruvec+0x1eea>
1dbc   6e1cbc:	e8 00 00 00 00       	call   6e1cc1 <shrink_lruvec+0x1dc1>	6e1cbd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1dc1   6e1cc1:	eb 24                	jmp    6e1ce7 <shrink_lruvec+0x1de7>
1dc3   6e1cc3:	e8 00 00 00 00       	call   6e1cc8 <shrink_lruvec+0x1dc8>	6e1cc4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1dc8   6e1cc8:	e9 49 f5 ff ff       	jmp    6e1216 <shrink_lruvec+0x1316>
1dcd   6e1ccd:	e8 00 00 00 00       	call   6e1cd2 <shrink_lruvec+0x1dd2>	6e1cce: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1dd2   6e1cd2:	41 bf 20 00 00 00    	mov    $0x20,%r15d
1dd8   6e1cd8:	4c 8b 64 24 08       	mov    0x8(%rsp),%r12
1ddd   6e1cdd:	e9 3e f2 ff ff       	jmp    6e0f20 <shrink_lruvec+0x1020>
1de2   6e1ce2:	e8 00 00 00 00       	call   6e1ce7 <shrink_lruvec+0x1de7>	6e1ce3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1de7   6e1ce7:	4c 8b ac 24 58 01 00 00 	mov    0x158(%rsp),%r13
1def   6e1cef:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
1df4   6e1cf4:	48 89 df             	mov    %rbx,%rdi
1df7   6e1cf7:	be 08 00 00 00       	mov    $0x8,%esi
1dfc   6e1cfc:	e8 00 00 00 00       	call   6e1d01 <shrink_lruvec+0x1e01>	6e1cfd: R_X86_64_PLT32	__kasan_check_read-0x4
1e01   6e1d01:	48 8b 84 24 c8 00 00 00 	mov    0xc8(%rsp),%rax
1e09   6e1d09:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
1e0e   6e1d0e:	74 08                	je     6e1d18 <shrink_lruvec+0x1e18>
1e10   6e1d10:	48 89 df             	mov    %rbx,%rdi
1e13   6e1d13:	e8 00 00 00 00       	call   6e1d18 <shrink_lruvec+0x1e18>	6e1d14: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e18   6e1d18:	4c 8b 33             	mov    (%rbx),%r14
1e1b   6e1d1b:	31 ff                	xor    %edi,%edi
1e1d   6e1d1d:	4c 89 f6             	mov    %r14,%rsi
1e20   6e1d20:	e8 00 00 00 00       	call   6e1d25 <shrink_lruvec+0x1e25>	6e1d21: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1e25   6e1d25:	4d 85 f6             	test   %r14,%r14
1e28   6e1d28:	b8 00 00 00 00       	mov    $0x0,%eax
1e2d   6e1d2d:	4c 0f 48 f0          	cmovs  %rax,%r14
1e31   6e1d31:	4c 89 e7             	mov    %r12,%rdi
1e34   6e1d34:	be 08 00 00 00       	mov    $0x8,%esi
1e39   6e1d39:	e8 00 00 00 00       	call   6e1d3e <shrink_lruvec+0x1e3e>	6e1d3a: R_X86_64_PLT32	__kasan_check_read-0x4
1e3e   6e1d3e:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1e48   6e1d48:	48 8b 8c 24 c8 01 00 00 	mov    0x1c8(%rsp),%rcx
1e50   6e1d50:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
1e54   6e1d54:	74 08                	je     6e1d5e <shrink_lruvec+0x1e5e>
1e56   6e1d56:	4c 89 e7             	mov    %r12,%rdi
1e59   6e1d59:	e8 00 00 00 00       	call   6e1d5e <shrink_lruvec+0x1e5e>	6e1d5a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1e5e   6e1d5e:	48 8b 84 24 c0 01 00 00 	mov    0x1c0(%rsp),%rax
1e66   6e1d66:	4c 8b a0 00 00 00 00 	mov    0x0(%rax),%r12	6e1d69: R_X86_64_32S	vm_node_stat
1e6d   6e1d6d:	31 ff                	xor    %edi,%edi
1e6f   6e1d6f:	4c 89 e6             	mov    %r12,%rsi
1e72   6e1d72:	e8 00 00 00 00       	call   6e1d77 <shrink_lruvec+0x1e77>	6e1d73: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
1e77   6e1d77:	4d 85 e4             	test   %r12,%r12
1e7a   6e1d7a:	b8 00 00 00 00       	mov    $0x0,%eax
1e7f   6e1d7f:	4c 0f 48 e0          	cmovs  %rax,%r12
1e83   6e1d83:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
1e8d   6e1d8d:	48 8b 8c 24 b8 01 00 00 	mov    0x1b8(%rsp),%rcx
1e95   6e1d95:	0f b6 04 01          	movzbl (%rcx,%rax,1),%eax
1e99   6e1d99:	84 c0                	test   %al,%al
1e9b   6e1d9b:	0f 85 dd 03 00 00    	jne    6e217e <shrink_lruvec+0x227e>
1ea1   6e1da1:	45 8b 6d 00          	mov    0x0(%r13),%r13d
1ea5   6e1da5:	b8 c0 00 00 00       	mov    $0xc0,%eax
1eaa   6e1daa:	41 21 c5             	and    %eax,%r13d
1ead   6e1dad:	bf c0 00 00 00       	mov    $0xc0,%edi
1eb2   6e1db2:	44 89 ee             	mov    %r13d,%esi
1eb5   6e1db5:	e8 00 00 00 00       	call   6e1dba <shrink_lruvec+0x1eba>	6e1db6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
1eba   6e1dba:	4c 89 f3             	mov    %r14,%rbx
1ebd   6e1dbd:	48 c1 eb 03          	shr    $0x3,%rbx
1ec1   6e1dc1:	41 81 fd c0 00 00 00 	cmp    $0xc0,%r13d
1ec8   6e1dc8:	49 0f 45 de          	cmovne %r14,%rbx
1ecc   6e1dcc:	4c 89 e7             	mov    %r12,%rdi
1ecf   6e1dcf:	48 89 de             	mov    %rbx,%rsi
1ed2   6e1dd2:	e8 00 00 00 00       	call   6e1dd7 <shrink_lruvec+0x1ed7>	6e1dd3: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
1ed7   6e1dd7:	49 39 dc             	cmp    %rbx,%r12
1eda   6e1dda:	0f 87 77 03 00 00    	ja     6e2157 <shrink_lruvec+0x2257>
1ee0   6e1de0:	e8 00 00 00 00       	call   6e1de5 <shrink_lruvec+0x1ee5>	6e1de1: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1ee5   6e1de5:	e9 95 f5 ff ff       	jmp    6e137f <shrink_lruvec+0x147f>
1eea   6e1dea:	e8 00 00 00 00       	call   6e1def <shrink_lruvec+0x1eef>	6e1deb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
1eef   6e1def:	e9 22 f4 ff ff       	jmp    6e1216 <shrink_lruvec+0x1316>
1ef4   6e1df4:	44 89 e9             	mov    %r13d,%ecx
1ef7   6e1df7:	80 e1 07             	and    $0x7,%cl
1efa   6e1dfa:	80 c1 01             	add    $0x1,%cl
1efd   6e1dfd:	38 c1                	cmp    %al,%cl
1eff   6e1dff:	0f 8c ff f1 ff ff    	jl     6e1004 <shrink_lruvec+0x1104>
1f05   6e1e05:	4c 89 ef             	mov    %r13,%rdi
1f08   6e1e08:	e8 00 00 00 00       	call   6e1e0d <shrink_lruvec+0x1f0d>	6e1e09: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
1f0d   6e1e0d:	e9 f2 f1 ff ff       	jmp    6e1004 <shrink_lruvec+0x1104>
1f12   6e1e12:	89 d9                	mov    %ebx,%ecx
1f14   6e1e14:	80 e1 07             	and    $0x7,%cl
1f17   6e1e17:	80 c1 03             	add    $0x3,%cl
1f1a   6e1e1a:	38 c1                	cmp    %al,%cl
1f1c   6e1e1c:	0f 8c 69 f3 ff ff    	jl     6e118b <shrink_lruvec+0x128b>
1f22   6e1e22:	48 89 df             	mov    %rbx,%rdi
1f25   6e1e25:	e8 00 00 00 00       	call   6e1e2a <shrink_lruvec+0x1f2a>	6e1e26: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1f2a   6e1e2a:	e9 5c f3 ff ff       	jmp    6e118b <shrink_lruvec+0x128b>
1f2f   6e1e2f:	89 d9                	mov    %ebx,%ecx
1f31   6e1e31:	80 e1 07             	and    $0x7,%cl
1f34   6e1e34:	80 c1 03             	add    $0x3,%cl
1f37   6e1e37:	38 c1                	cmp    %al,%cl
1f39   6e1e39:	0f 8c d3 f5 ff ff    	jl     6e1412 <shrink_lruvec+0x1512>
1f3f   6e1e3f:	48 89 df             	mov    %rbx,%rdi
1f42   6e1e42:	e8 00 00 00 00       	call   6e1e47 <shrink_lruvec+0x1f47>	6e1e43: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1f47   6e1e47:	e9 c6 f5 ff ff       	jmp    6e1412 <shrink_lruvec+0x1512>
1f4c   6e1e4c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e1e4f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1f53   6e1e53:	80 e1 07             	and    $0x7,%cl
1f56   6e1e56:	80 c1 03             	add    $0x3,%cl
1f59   6e1e59:	38 c1                	cmp    %al,%cl
1f5b   6e1e5b:	0f 8c 58 f6 ff ff    	jl     6e14b9 <shrink_lruvec+0x15b9>
1f61   6e1e61:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e1e64: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1f68   6e1e68:	e8 00 00 00 00       	call   6e1e6d <shrink_lruvec+0x1f6d>	6e1e69: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1f6d   6e1e6d:	e9 47 f6 ff ff       	jmp    6e14b9 <shrink_lruvec+0x15b9>
1f72   6e1e72:	89 d9                	mov    %ebx,%ecx
1f74   6e1e74:	80 e1 07             	and    $0x7,%cl
1f77   6e1e77:	80 c1 03             	add    $0x3,%cl
1f7a   6e1e7a:	38 c1                	cmp    %al,%cl
1f7c   6e1e7c:	0f 8c 70 f7 ff ff    	jl     6e15f2 <shrink_lruvec+0x16f2>
1f82   6e1e82:	48 89 df             	mov    %rbx,%rdi
1f85   6e1e85:	e8 00 00 00 00       	call   6e1e8a <shrink_lruvec+0x1f8a>	6e1e86: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1f8a   6e1e8a:	e9 63 f7 ff ff       	jmp    6e15f2 <shrink_lruvec+0x16f2>
1f8f   6e1e8f:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e1e92: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1f96   6e1e96:	80 e1 07             	and    $0x7,%cl
1f99   6e1e99:	80 c1 03             	add    $0x3,%cl
1f9c   6e1e9c:	38 c1                	cmp    %al,%cl
1f9e   6e1e9e:	0f 8c e1 f7 ff ff    	jl     6e1685 <shrink_lruvec+0x1785>
1fa4   6e1ea4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e1ea7: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1fab   6e1eab:	e8 00 00 00 00       	call   6e1eb0 <shrink_lruvec+0x1fb0>	6e1eac: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1fb0   6e1eb0:	e9 d0 f7 ff ff       	jmp    6e1685 <shrink_lruvec+0x1785>
1fb5   6e1eb5:	48 8d 8c 24 a4 00 00 00 	lea    0xa4(%rsp),%rcx
1fbd   6e1ebd:	80 e1 07             	and    $0x7,%cl
1fc0   6e1ec0:	80 c1 03             	add    $0x3,%cl
1fc3   6e1ec3:	38 c1                	cmp    %al,%cl
1fc5   6e1ec5:	0f 8c 5a f8 ff ff    	jl     6e1725 <shrink_lruvec+0x1825>
1fcb   6e1ecb:	48 8d bc 24 a4 00 00 00 	lea    0xa4(%rsp),%rdi
1fd3   6e1ed3:	e8 00 00 00 00       	call   6e1ed8 <shrink_lruvec+0x1fd8>	6e1ed4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1fd8   6e1ed8:	e9 48 f8 ff ff       	jmp    6e1725 <shrink_lruvec+0x1825>
1fdd   6e1edd:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e1ee0: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1fe4   6e1ee4:	80 e1 07             	and    $0x7,%cl
1fe7   6e1ee7:	80 c1 03             	add    $0x3,%cl
1fea   6e1eea:	38 c1                	cmp    %al,%cl
1fec   6e1eec:	0f 8c 67 f8 ff ff    	jl     6e1759 <shrink_lruvec+0x1859>
1ff2   6e1ef2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e1ef5: R_X86_64_32S	memory_cgrp_subsys_enabled_key
1ff9   6e1ef9:	e8 00 00 00 00       	call   6e1efe <shrink_lruvec+0x1ffe>	6e1efa: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
1ffe   6e1efe:	e9 56 f8 ff ff       	jmp    6e1759 <shrink_lruvec+0x1859>
2003   6e1f03:	48 8d 8c 24 94 00 00 00 	lea    0x94(%rsp),%rcx
200b   6e1f0b:	80 e1 07             	and    $0x7,%cl
200e   6e1f0e:	80 c1 03             	add    $0x3,%cl
2011   6e1f11:	38 c1                	cmp    %al,%cl
2013   6e1f13:	0f 8c a8 f8 ff ff    	jl     6e17c1 <shrink_lruvec+0x18c1>
2019   6e1f19:	48 8d bc 24 94 00 00 00 	lea    0x94(%rsp),%rdi
2021   6e1f21:	e8 00 00 00 00       	call   6e1f26 <shrink_lruvec+0x2026>	6e1f22: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2026   6e1f26:	e9 96 f8 ff ff       	jmp    6e17c1 <shrink_lruvec+0x18c1>
202b   6e1f2b:	3c 03                	cmp    $0x3,%al
202d   6e1f2d:	0f 8f e6 f8 ff ff    	jg     6e1819 <shrink_lruvec+0x1919>
2033   6e1f33:	48 8d bc 24 90 00 00 00 	lea    0x90(%rsp),%rdi
203b   6e1f3b:	e8 00 00 00 00       	call   6e1f40 <shrink_lruvec+0x2040>	6e1f3c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2040   6e1f40:	e9 d4 f8 ff ff       	jmp    6e1819 <shrink_lruvec+0x1919>
2045   6e1f45:	44 89 e9             	mov    %r13d,%ecx
2048   6e1f48:	80 e1 07             	and    $0x7,%cl
204b   6e1f4b:	80 c1 03             	add    $0x3,%cl
204e   6e1f4e:	38 c1                	cmp    %al,%cl
2050   6e1f50:	0f 8c de f8 ff ff    	jl     6e1834 <shrink_lruvec+0x1934>
2056   6e1f56:	4c 89 ef             	mov    %r13,%rdi
2059   6e1f59:	e8 00 00 00 00       	call   6e1f5e <shrink_lruvec+0x205e>	6e1f5a: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
205e   6e1f5e:	e9 d1 f8 ff ff       	jmp    6e1834 <shrink_lruvec+0x1934>
2063   6e1f63:	48 8d 8c 24 98 00 00 00 	lea    0x98(%rsp),%rcx
206b   6e1f6b:	80 e1 07             	and    $0x7,%cl
206e   6e1f6e:	80 c1 03             	add    $0x3,%cl
2071   6e1f71:	38 c1                	cmp    %al,%cl
2073   6e1f73:	0f 8c d8 f8 ff ff    	jl     6e1851 <shrink_lruvec+0x1951>
2079   6e1f79:	48 8d bc 24 98 00 00 00 	lea    0x98(%rsp),%rdi
2081   6e1f81:	e8 00 00 00 00       	call   6e1f86 <shrink_lruvec+0x2086>	6e1f82: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2086   6e1f86:	e9 c6 f8 ff ff       	jmp    6e1851 <shrink_lruvec+0x1951>
208b   6e1f8b:	89 d9                	mov    %ebx,%ecx
208d   6e1f8d:	80 e1 07             	and    $0x7,%cl
2090   6e1f90:	80 c1 03             	add    $0x3,%cl
2093   6e1f93:	38 c1                	cmp    %al,%cl
2095   6e1f95:	0f 8c da f8 ff ff    	jl     6e1875 <shrink_lruvec+0x1975>
209b   6e1f9b:	48 89 df             	mov    %rbx,%rdi
209e   6e1f9e:	e8 00 00 00 00       	call   6e1fa3 <shrink_lruvec+0x20a3>	6e1f9f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
20a3   6e1fa3:	e9 cd f8 ff ff       	jmp    6e1875 <shrink_lruvec+0x1975>
20a8   6e1fa8:	48 8d 8c 24 94 00 00 00 	lea    0x94(%rsp),%rcx
20b0   6e1fb0:	80 e1 07             	and    $0x7,%cl
20b3   6e1fb3:	80 c1 03             	add    $0x3,%cl
20b6   6e1fb6:	38 c1                	cmp    %al,%cl
20b8   6e1fb8:	0f 8c ca f8 ff ff    	jl     6e1888 <shrink_lruvec+0x1988>
20be   6e1fbe:	48 8d bc 24 94 00 00 00 	lea    0x94(%rsp),%rdi
20c6   6e1fc6:	e8 00 00 00 00       	call   6e1fcb <shrink_lruvec+0x20cb>	6e1fc7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
20cb   6e1fcb:	e9 b8 f8 ff ff       	jmp    6e1888 <shrink_lruvec+0x1988>
20d0   6e1fd0:	89 d9                	mov    %ebx,%ecx
20d2   6e1fd2:	80 e1 07             	and    $0x7,%cl
20d5   6e1fd5:	80 c1 03             	add    $0x3,%cl
20d8   6e1fd8:	38 c1                	cmp    %al,%cl
20da   6e1fda:	0f 8c cc f8 ff ff    	jl     6e18ac <shrink_lruvec+0x19ac>
20e0   6e1fe0:	48 89 df             	mov    %rbx,%rdi
20e3   6e1fe3:	e8 00 00 00 00       	call   6e1fe8 <shrink_lruvec+0x20e8>	6e1fe4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
20e8   6e1fe8:	e9 bf f8 ff ff       	jmp    6e18ac <shrink_lruvec+0x19ac>
20ed   6e1fed:	48 8d 8c 24 9c 00 00 00 	lea    0x9c(%rsp),%rcx
20f5   6e1ff5:	80 e1 07             	and    $0x7,%cl
20f8   6e1ff8:	80 c1 03             	add    $0x3,%cl
20fb   6e1ffb:	38 c1                	cmp    %al,%cl
20fd   6e1ffd:	0f 8c c5 f8 ff ff    	jl     6e18c8 <shrink_lruvec+0x19c8>
2103   6e2003:	48 8d bc 24 9c 00 00 00 	lea    0x9c(%rsp),%rdi
210b   6e200b:	e8 00 00 00 00       	call   6e2010 <shrink_lruvec+0x2110>	6e200c: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2110   6e2010:	e9 b3 f8 ff ff       	jmp    6e18c8 <shrink_lruvec+0x19c8>
2115   6e2015:	89 d9                	mov    %ebx,%ecx
2117   6e2017:	80 e1 07             	and    $0x7,%cl
211a   6e201a:	80 c1 03             	add    $0x3,%cl
211d   6e201d:	38 c1                	cmp    %al,%cl
211f   6e201f:	0f 8c c7 f8 ff ff    	jl     6e18ec <shrink_lruvec+0x19ec>
2125   6e2025:	48 89 df             	mov    %rbx,%rdi
2128   6e2028:	e8 00 00 00 00       	call   6e202d <shrink_lruvec+0x212d>	6e2029: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
212d   6e202d:	e9 ba f8 ff ff       	jmp    6e18ec <shrink_lruvec+0x19ec>
2132   6e2032:	48 8d 8c 24 a0 00 00 00 	lea    0xa0(%rsp),%rcx
213a   6e203a:	80 e1 07             	and    $0x7,%cl
213d   6e203d:	80 c1 03             	add    $0x3,%cl
2140   6e2040:	38 c1                	cmp    %al,%cl
2142   6e2042:	0f 8c c0 f8 ff ff    	jl     6e1908 <shrink_lruvec+0x1a08>
2148   6e2048:	48 8d bc 24 a0 00 00 00 	lea    0xa0(%rsp),%rdi
2150   6e2050:	e8 00 00 00 00       	call   6e2055 <shrink_lruvec+0x2155>	6e2051: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2155   6e2055:	e9 ae f8 ff ff       	jmp    6e1908 <shrink_lruvec+0x1a08>
215a   6e205a:	89 d9                	mov    %ebx,%ecx
215c   6e205c:	80 e1 07             	and    $0x7,%cl
215f   6e205f:	80 c1 03             	add    $0x3,%cl
2162   6e2062:	38 c1                	cmp    %al,%cl
2164   6e2064:	0f 8c c2 f8 ff ff    	jl     6e192c <shrink_lruvec+0x1a2c>
216a   6e206a:	48 89 df             	mov    %rbx,%rdi
216d   6e206d:	e8 00 00 00 00       	call   6e2072 <shrink_lruvec+0x2172>	6e206e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2172   6e2072:	e9 b5 f8 ff ff       	jmp    6e192c <shrink_lruvec+0x1a2c>
2177   6e2077:	89 d9                	mov    %ebx,%ecx
2179   6e2079:	80 e1 07             	and    $0x7,%cl
217c   6e207c:	80 c1 03             	add    $0x3,%cl
217f   6e207f:	38 c1                	cmp    %al,%cl
2181   6e2081:	0f 8c c4 f8 ff ff    	jl     6e194b <shrink_lruvec+0x1a4b>
2187   6e2087:	48 89 df             	mov    %rbx,%rdi
218a   6e208a:	e8 00 00 00 00       	call   6e208f <shrink_lruvec+0x218f>	6e208b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
218f   6e208f:	e9 b7 f8 ff ff       	jmp    6e194b <shrink_lruvec+0x1a4b>
2194   6e2094:	44 89 e1             	mov    %r12d,%ecx
2197   6e2097:	80 e1 07             	and    $0x7,%cl
219a   6e209a:	80 c1 03             	add    $0x3,%cl
219d   6e209d:	38 c1                	cmp    %al,%cl
219f   6e209f:	0f 8c 0b f9 ff ff    	jl     6e19b0 <shrink_lruvec+0x1ab0>
21a5   6e20a5:	4c 89 e7             	mov    %r12,%rdi
21a8   6e20a8:	e8 00 00 00 00       	call   6e20ad <shrink_lruvec+0x21ad>	6e20a9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
21ad   6e20ad:	e9 fe f8 ff ff       	jmp    6e19b0 <shrink_lruvec+0x1ab0>
21b2   6e20b2:	89 d9                	mov    %ebx,%ecx
21b4   6e20b4:	80 e1 07             	and    $0x7,%cl
21b7   6e20b7:	38 c1                	cmp    %al,%cl
21b9   6e20b9:	0f 8c 0a f9 ff ff    	jl     6e19c9 <shrink_lruvec+0x1ac9>
21bf   6e20bf:	48 89 df             	mov    %rbx,%rdi
21c2   6e20c2:	e8 00 00 00 00       	call   6e20c7 <shrink_lruvec+0x21c7>	6e20c3: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
21c7   6e20c7:	e9 fd f8 ff ff       	jmp    6e19c9 <shrink_lruvec+0x1ac9>
21cc   6e20cc:	89 d9                	mov    %ebx,%ecx
21ce   6e20ce:	80 e1 07             	and    $0x7,%cl
21d1   6e20d1:	80 c1 03             	add    $0x3,%cl
21d4   6e20d4:	38 c1                	cmp    %al,%cl
21d6   6e20d6:	0f 8c 64 f2 ff ff    	jl     6e1340 <shrink_lruvec+0x1440>
21dc   6e20dc:	48 89 df             	mov    %rbx,%rdi
21df   6e20df:	e8 00 00 00 00       	call   6e20e4 <shrink_lruvec+0x21e4>	6e20e0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
21e4   6e20e4:	e9 57 f2 ff ff       	jmp    6e1340 <shrink_lruvec+0x1440>
21e9   6e20e9:	44 89 e9             	mov    %r13d,%ecx
21ec   6e20ec:	80 e1 07             	and    $0x7,%cl
21ef   6e20ef:	80 c1 01             	add    $0x1,%cl
21f2   6e20f2:	38 c1                	cmp    %al,%cl
21f4   6e20f4:	0f 8c 72 ef ff ff    	jl     6e106c <shrink_lruvec+0x116c>
21fa   6e20fa:	4c 89 ef             	mov    %r13,%rdi
21fd   6e20fd:	e8 00 00 00 00       	call   6e2102 <shrink_lruvec+0x2202>	6e20fe: R_X86_64_PLT32	__asan_report_store2_noabort-0x4
2202   6e2102:	e9 65 ef ff ff       	jmp    6e106c <shrink_lruvec+0x116c>
2207   6e2107:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e210a: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
220e   6e210e:	80 e1 07             	and    $0x7,%cl
2211   6e2111:	80 c1 03             	add    $0x3,%cl
2214   6e2114:	38 c1                	cmp    %al,%cl
2216   6e2116:	0f 8c d2 f0 ff ff    	jl     6e11ee <shrink_lruvec+0x12ee>
221c   6e211c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e211f: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
2223   6e2123:	e8 00 00 00 00       	call   6e2128 <shrink_lruvec+0x2228>	6e2124: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2228   6e2128:	e9 c1 f0 ff ff       	jmp    6e11ee <shrink_lruvec+0x12ee>
222d   6e212d:	89 d1                	mov    %edx,%ecx
222f   6e212f:	80 e1 07             	and    $0x7,%cl
2232   6e2132:	80 c1 03             	add    $0x3,%cl
2235   6e2135:	38 c1                	cmp    %al,%cl
2237   6e2137:	0f 8c 49 f8 ff ff    	jl     6e1986 <shrink_lruvec+0x1a86>
223d   6e213d:	48 8b bc 24 50 01 00 00 	mov    0x150(%rsp),%rdi
2245   6e2145:	e8 00 00 00 00       	call   6e214a <shrink_lruvec+0x224a>	6e2146: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
224a   6e214a:	48 8b 94 24 50 01 00 00 	mov    0x150(%rsp),%rdx
2252   6e2152:	e9 2f f8 ff ff       	jmp    6e1986 <shrink_lruvec+0x1a86>
2257   6e2157:	e8 00 00 00 00       	call   6e215c <shrink_lruvec+0x225c>	6e2158: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
225c   6e215c:	e9 e8 f4 ff ff       	jmp    6e1649 <shrink_lruvec+0x1749>
2261   6e2161:	89 d9                	mov    %ebx,%ecx
2263   6e2163:	80 e1 07             	and    $0x7,%cl
2266   6e2166:	80 c1 03             	add    $0x3,%cl
2269   6e2169:	38 c1                	cmp    %al,%cl
226b   6e216b:	0f 8c e1 fa ff ff    	jl     6e1c52 <shrink_lruvec+0x1d52>
2271   6e2171:	48 89 df             	mov    %rbx,%rdi
2274   6e2174:	e8 00 00 00 00       	call   6e2179 <shrink_lruvec+0x2279>	6e2175: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2279   6e2179:	e9 d4 fa ff ff       	jmp    6e1c52 <shrink_lruvec+0x1d52>
227e   6e217e:	44 89 e9             	mov    %r13d,%ecx
2281   6e2181:	80 e1 07             	and    $0x7,%cl
2284   6e2184:	80 c1 03             	add    $0x3,%cl
2287   6e2187:	38 c1                	cmp    %al,%cl
2289   6e2189:	0f 8c 12 fc ff ff    	jl     6e1da1 <shrink_lruvec+0x1ea1>
228f   6e218f:	4c 89 ef             	mov    %r13,%rdi
2292   6e2192:	e8 00 00 00 00       	call   6e2197 <shrink_lruvec+0x2297>	6e2193: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2297   6e2197:	e9 05 fc ff ff       	jmp    6e1da1 <shrink_lruvec+0x1ea1>
229c   6e219c:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e219f: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
22a3   6e21a3:	80 e1 07             	and    $0x7,%cl
22a6   6e21a6:	80 c1 03             	add    $0x3,%cl
22a9   6e21a9:	38 c1                	cmp    %al,%cl
22ab   6e21ab:	0f 8c f4 fa ff ff    	jl     6e1ca5 <shrink_lruvec+0x1da5>
22b1   6e21b1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e21b4: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
22b8   6e21b8:	e8 00 00 00 00       	call   6e21bd <shrink_lruvec+0x22bd>	6e21b9: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
22bd   6e21bd:	e9 e3 fa ff ff       	jmp    6e1ca5 <shrink_lruvec+0x1da5>
22c2   6e21c2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e21c5: R_X86_64_32S	.rodata+0x4900c0
22c9   6e21c9:	be 10 0b 00 00       	mov    $0xb10,%esi
22ce   6e21ce:	31 d2                	xor    %edx,%edx
22d0   6e21d0:	e8 00 00 00 00       	call   6e21d5 <shrink_lruvec+0x22d5>	6e21d1: R_X86_64_PLT32	___might_sleep-0x4
22d5   6e21d5:	e8 00 00 00 00       	call   6e21da <shrink_lruvec+0x22da>	6e21d6: R_X86_64_PLT32	__cond_resched-0x4
22da   6e21da:	4c 8b b4 24 e0 00 00 00 	mov    0xe0(%rsp),%r14
22e2   6e21e2:	4c 89 f7             	mov    %r14,%rdi
22e5   6e21e5:	48 8b 9c 24 b0 01 00 00 	mov    0x1b0(%rsp),%rbx
22ed   6e21ed:	48 89 de             	mov    %rbx,%rsi
22f0   6e21f0:	e8 00 00 00 00       	call   6e21f5 <shrink_lruvec+0x22f5>	6e21f1: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
22f5   6e21f5:	49 39 de             	cmp    %rbx,%r14
22f8   6e21f8:	0f 92 c0             	setb   %al
22fb   6e21fb:	0a 44 24 74          	or     0x74(%rsp),%al
22ff   6e21ff:	3c 01                	cmp    $0x1,%al
2301   6e2201:	0f 84 32 ec ff ff    	je     6e0e39 <shrink_lruvec+0xf39>
2307   6e2207:	48 8d bc 24 10 01 00 00 	lea    0x110(%rsp),%rdi
230f   6e220f:	48 89 f8             	mov    %rdi,%rax
2312   6e2212:	48 c1 e8 03          	shr    $0x3,%rax
2316   6e2216:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2320   6e2220:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2324   6e2224:	48 8d 9c 24 18 01 00 00 	lea    0x118(%rsp),%rbx
232c   6e222c:	74 05                	je     6e2233 <shrink_lruvec+0x2333>
232e   6e222e:	e8 00 00 00 00       	call   6e2233 <shrink_lruvec+0x2333>	6e222f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2333   6e2233:	4c 8b b4 24 10 01 00 00 	mov    0x110(%rsp),%r14
233b   6e223b:	48 89 d8             	mov    %rbx,%rax
233e   6e223e:	48 c1 e8 03          	shr    $0x3,%rax
2342   6e2242:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
234c   6e224c:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2350   6e2250:	4c 8d bc 24 08 01 00 00 	lea    0x108(%rsp),%r15
2358   6e2258:	74 08                	je     6e2262 <shrink_lruvec+0x2362>
235a   6e225a:	48 89 df             	mov    %rbx,%rdi
235d   6e225d:	e8 00 00 00 00       	call   6e2262 <shrink_lruvec+0x2362>	6e225e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2362   6e2262:	4c 03 b4 24 18 01 00 00 	add    0x118(%rsp),%r14
236a   6e226a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2374   6e2274:	48 8b 8c 24 68 01 00 00 	mov    0x168(%rsp),%rcx
237c   6e227c:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
2380   6e2280:	74 0d                	je     6e228f <shrink_lruvec+0x238f>
2382   6e2282:	48 8d bc 24 00 01 00 00 	lea    0x100(%rsp),%rdi
238a   6e228a:	e8 00 00 00 00       	call   6e228f <shrink_lruvec+0x238f>	6e228b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
238f   6e228f:	48 8b 9c 24 00 01 00 00 	mov    0x100(%rsp),%rbx
2397   6e2297:	4c 89 f8             	mov    %r15,%rax
239a   6e229a:	48 c1 e8 03          	shr    $0x3,%rax
239e   6e229e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
23a8   6e22a8:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
23ac   6e22ac:	74 08                	je     6e22b6 <shrink_lruvec+0x23b6>
23ae   6e22ae:	4c 89 ff             	mov    %r15,%rdi
23b1   6e22b1:	e8 00 00 00 00       	call   6e22b6 <shrink_lruvec+0x23b6>	6e22b2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
23b6   6e22b6:	48 03 9c 24 08 01 00 00 	add    0x108(%rsp),%rbx
23be   6e22be:	31 ff                	xor    %edi,%edi
23c0   6e22c0:	4c 89 f6             	mov    %r14,%rsi
23c3   6e22c3:	e8 00 00 00 00       	call   6e22c8 <shrink_lruvec+0x23c8>	6e22c4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
23c8   6e22c8:	31 ff                	xor    %edi,%edi
23ca   6e22ca:	48 89 de             	mov    %rbx,%rsi
23cd   6e22cd:	e8 00 00 00 00       	call   6e22d2 <shrink_lruvec+0x23d2>	6e22ce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
23d2   6e22d2:	4d 85 f6             	test   %r14,%r14
23d5   6e22d5:	0f 84 cb 02 00 00    	je     6e25a6 <shrink_lruvec+0x26a6>
23db   6e22db:	48 85 db             	test   %rbx,%rbx
23de   6e22de:	0f 84 c2 02 00 00    	je     6e25a6 <shrink_lruvec+0x26a6>
23e4   6e22e4:	4c 89 f7             	mov    %r14,%rdi
23e7   6e22e7:	48 89 de             	mov    %rbx,%rsi
23ea   6e22ea:	e8 00 00 00 00       	call   6e22ef <shrink_lruvec+0x23ef>	6e22eb: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
23ef   6e22ef:	49 39 de             	cmp    %rbx,%r14
23f2   6e22f2:	76 46                	jbe    6e233a <shrink_lruvec+0x243a>
23f4   6e22f4:	e8 00 00 00 00       	call   6e22f9 <shrink_lruvec+0x23f9>	6e22f5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
23f9   6e22f9:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
2403   6e2303:	48 8b 84 24 a8 01 00 00 	mov    0x1a8(%rsp),%rax
240b   6e230b:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2410   6e2310:	74 0d                	je     6e231f <shrink_lruvec+0x241f>
2412   6e2312:	48 8d bc 24 80 01 00 00 	lea    0x180(%rsp),%rdi
241a   6e231a:	e8 00 00 00 00       	call   6e231f <shrink_lruvec+0x241f>	6e231b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
241f   6e231f:	45 31 e4             	xor    %r12d,%r12d
2422   6e2322:	41 bd 02 00 00 00    	mov    $0x2,%r13d
2428   6e2328:	48 8b 8c 24 80 01 00 00 	mov    0x180(%rsp),%rcx
2430   6e2330:	4c 8d bc 24 88 01 00 00 	lea    0x188(%rsp),%r15
2438   6e2338:	eb 4f                	jmp    6e2389 <shrink_lruvec+0x2489>
243a   6e233a:	e8 00 00 00 00       	call   6e233f <shrink_lruvec+0x243f>	6e233b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
243f   6e233f:	48 8d bc 24 90 01 00 00 	lea    0x190(%rsp),%rdi
2447   6e2347:	48 89 f8             	mov    %rdi,%rax
244a   6e234a:	48 c1 e8 03          	shr    $0x3,%rax
244e   6e234e:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2458   6e2358:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
245c   6e235c:	74 05                	je     6e2363 <shrink_lruvec+0x2463>
245e   6e235e:	e8 00 00 00 00       	call   6e2363 <shrink_lruvec+0x2463>	6e235f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2463   6e2363:	41 bc 02 00 00 00    	mov    $0x2,%r12d
2469   6e2369:	45 31 ed             	xor    %r13d,%r13d
246c   6e236c:	48 8b 8c 24 90 01 00 00 	mov    0x190(%rsp),%rcx
2474   6e2374:	4c 8d bc 24 98 01 00 00 	lea    0x198(%rsp),%r15
247c   6e237c:	4c 89 f3             	mov    %r14,%rbx
247f   6e237f:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
2489   6e2389:	4c 89 f8             	mov    %r15,%rax
248c   6e238c:	48 c1 e8 03          	shr    $0x3,%rax
2490   6e2390:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2495   6e2395:	74 1e                	je     6e23b5 <shrink_lruvec+0x24b5>
2497   6e2397:	4c 89 ff             	mov    %r15,%rdi
249a   6e239a:	4d 89 ee             	mov    %r13,%r14
249d   6e239d:	49 89 cd             	mov    %rcx,%r13
24a0   6e23a0:	e8 00 00 00 00       	call   6e23a5 <shrink_lruvec+0x24a5>	6e23a1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
24a5   6e23a5:	4c 89 e9             	mov    %r13,%rcx
24a8   6e23a8:	4d 89 f5             	mov    %r14,%r13
24ab   6e23ab:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
24b5   6e23b5:	49 8b 07             	mov    (%r15),%rax
24b8   6e23b8:	48 01 c1             	add    %rax,%rcx
24bb   6e23bb:	48 83 c1 01          	add    $0x1,%rcx
24bf   6e23bf:	48 6b c3 64          	imul   $0x64,%rbx,%rax
24c3   6e23c3:	48 89 c2             	mov    %rax,%rdx
24c6   6e23c6:	48 09 ca             	or     %rcx,%rdx
24c9   6e23c9:	48 c1 ea 20          	shr    $0x20,%rdx
24cd   6e23cd:	74 07                	je     6e23d6 <shrink_lruvec+0x24d6>
24cf   6e23cf:	31 d2                	xor    %edx,%edx
24d1   6e23d1:	48 f7 f1             	div    %rcx
24d4   6e23d4:	eb 04                	jmp    6e23da <shrink_lruvec+0x24da>
24d6   6e23d6:	31 d2                	xor    %edx,%edx
24d8   6e23d8:	f7 f1                	div    %ecx
24da   6e23da:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
24df   6e23df:	44 89 e0             	mov    %r12d,%eax
24e2   6e23e2:	48 8d 1c c4          	lea    (%rsp,%rax,8),%rbx
24e6   6e23e6:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
24ed   6e23ed:	48 89 d8             	mov    %rbx,%rax
24f0   6e23f0:	48 c1 e8 03          	shr    $0x3,%rax
24f4   6e23f4:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
24f9   6e23f9:	74 08                	je     6e2403 <shrink_lruvec+0x2503>
24fb   6e23fb:	48 89 df             	mov    %rbx,%rdi
24fe   6e23fe:	e8 00 00 00 00       	call   6e2403 <shrink_lruvec+0x2503>	6e23ff: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2503   6e2403:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
250a   6e240a:	41 83 cc 01          	or     $0x1,%r12d
250e   6e240e:	4a 8d 1c e4          	lea    (%rsp,%r12,8),%rbx
2512   6e2412:	48 81 c3 00 01 00 00 	add    $0x100,%rbx
2519   6e2419:	48 89 d8             	mov    %rbx,%rax
251c   6e241c:	48 c1 e8 03          	shr    $0x3,%rax
2520   6e2420:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2525   6e2425:	74 08                	je     6e242f <shrink_lruvec+0x252f>
2527   6e2427:	48 89 df             	mov    %rbx,%rdi
252a   6e242a:	e8 00 00 00 00       	call   6e242f <shrink_lruvec+0x252f>	6e242b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
252f   6e242f:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
2536   6e2436:	45 89 ee             	mov    %r13d,%r14d
2539   6e2439:	4a 8d 3c f4          	lea    (%rsp,%r14,8),%rdi
253d   6e243d:	48 81 c7 80 01 00 00 	add    $0x180,%rdi
2544   6e2444:	48 89 f8             	mov    %rdi,%rax
2547   6e2447:	48 c1 e8 03          	shr    $0x3,%rax
254b   6e244b:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2555   6e2455:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
2559   6e2459:	74 05                	je     6e2460 <shrink_lruvec+0x2560>
255b   6e245b:	e8 00 00 00 00       	call   6e2460 <shrink_lruvec+0x2560>	6e245c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2560   6e2460:	4a 8b 9c f4 80 01 00 00 	mov    0x180(%rsp,%r14,8),%rbx
2568   6e2468:	4e 8d 34 f4          	lea    (%rsp,%r14,8),%r14
256c   6e246c:	49 81 c6 00 01 00 00 	add    $0x100,%r14
2573   6e2473:	4d 89 f7             	mov    %r14,%r15
2576   6e2476:	49 c1 ef 03          	shr    $0x3,%r15
257a   6e247a:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2584   6e2484:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
2589   6e2489:	74 08                	je     6e2493 <shrink_lruvec+0x2593>
258b   6e248b:	4c 89 f7             	mov    %r14,%rdi
258e   6e248e:	e8 00 00 00 00       	call   6e2493 <shrink_lruvec+0x2593>	6e248f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2593   6e2493:	48 89 d9             	mov    %rbx,%rcx
2596   6e2496:	49 2b 0e             	sub    (%r14),%rcx
2599   6e2499:	41 bc 64 00 00 00    	mov    $0x64,%r12d
259f   6e249f:	4c 2b 64 24 08       	sub    0x8(%rsp),%r12
25a4   6e24a4:	49 0f af dc          	imul   %r12,%rbx
25a8   6e24a8:	48 c1 eb 02          	shr    $0x2,%rbx
25ac   6e24ac:	48 89 d8             	mov    %rbx,%rax
25af   6e24af:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
25b9   6e24b9:	48 f7 e2             	mul    %rdx
25bc   6e24bc:	48 c1 ea 02          	shr    $0x2,%rdx
25c0   6e24c0:	48 29 ca             	sub    %rcx,%rdx
25c3   6e24c3:	bb 00 00 00 00       	mov    $0x0,%ebx
25c8   6e24c8:	48 0f 43 da          	cmovae %rdx,%rbx
25cc   6e24cc:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
25d6   6e24d6:	41 80 3c 07 00       	cmpb   $0x0,(%r15,%rax,1)
25db   6e24db:	74 08                	je     6e24e5 <shrink_lruvec+0x25e5>
25dd   6e24dd:	4c 89 f7             	mov    %r14,%rdi
25e0   6e24e0:	e8 00 00 00 00       	call   6e24e5 <shrink_lruvec+0x25e5>	6e24e1: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
25e5   6e24e5:	49 89 1e             	mov    %rbx,(%r14)
25e8   6e24e8:	41 83 cd 01          	or     $0x1,%r13d
25ec   6e24ec:	4a 8d 3c ec          	lea    (%rsp,%r13,8),%rdi
25f0   6e24f0:	48 81 c7 80 01 00 00 	add    $0x180,%rdi
25f7   6e24f7:	48 89 f8             	mov    %rdi,%rax
25fa   6e24fa:	48 c1 e8 03          	shr    $0x3,%rax
25fe   6e24fe:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
2608   6e2508:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
260c   6e250c:	74 05                	je     6e2513 <shrink_lruvec+0x2613>
260e   6e250e:	e8 00 00 00 00       	call   6e2513 <shrink_lruvec+0x2613>	6e250f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2613   6e2513:	4e 8b bc ec 80 01 00 00 	mov    0x180(%rsp,%r13,8),%r15
261b   6e251b:	4e 8d 34 ec          	lea    (%rsp,%r13,8),%r14
261f   6e251f:	49 81 c6 00 01 00 00 	add    $0x100,%r14
2626   6e2526:	4d 89 f5             	mov    %r14,%r13
2629   6e2529:	49 c1 ed 03          	shr    $0x3,%r13
262d   6e252d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
2637   6e2537:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
263d   6e253d:	74 08                	je     6e2547 <shrink_lruvec+0x2647>
263f   6e253f:	4c 89 f7             	mov    %r14,%rdi
2642   6e2542:	e8 00 00 00 00       	call   6e2547 <shrink_lruvec+0x2647>	6e2543: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2647   6e2547:	4c 89 f9             	mov    %r15,%rcx
264a   6e254a:	49 2b 0e             	sub    (%r14),%rcx
264d   6e254d:	4d 0f af e7          	imul   %r15,%r12
2651   6e2551:	49 c1 ec 02          	shr    $0x2,%r12
2655   6e2555:	4c 89 e0             	mov    %r12,%rax
2658   6e2558:	48 ba c3 f5 28 5c 8f c2 f5 28 	movabs $0x28f5c28f5c28f5c3,%rdx
2662   6e2562:	48 f7 e2             	mul    %rdx
2665   6e2565:	48 c1 ea 02          	shr    $0x2,%rdx
2669   6e2569:	48 29 ca             	sub    %rcx,%rdx
266c   6e256c:	bb 00 00 00 00       	mov    $0x0,%ebx
2671   6e2571:	48 0f 43 da          	cmovae %rdx,%rbx
2675   6e2575:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
267f   6e257f:	41 80 7c 05 00 00    	cmpb   $0x0,0x0(%r13,%rax,1)
2685   6e2585:	74 08                	je     6e258f <shrink_lruvec+0x268f>
2687   6e2587:	4c 89 f7             	mov    %r14,%rdi
268a   6e258a:	e8 00 00 00 00       	call   6e258f <shrink_lruvec+0x268f>	6e258b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
268f   6e258f:	49 89 1e             	mov    %rbx,(%r14)
2692   6e2592:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
269c   6e259c:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
26a1   6e25a1:	e9 a2 e8 ff ff       	jmp    6e0e48 <shrink_lruvec+0xf48>
26a6   6e25a6:	e8 00 00 00 00       	call   6e25ab <shrink_lruvec+0x26ab>	6e25a7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
26ab   6e25ab:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
26b5   6e25b5:	eb 05                	jmp    6e25bc <shrink_lruvec+0x26bc>
26b7   6e25b7:	e8 00 00 00 00       	call   6e25bc <shrink_lruvec+0x26bc>	6e25b8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
26bc   6e25bc:	48 8d bc 24 f0 01 00 00 	lea    0x1f0(%rsp),%rdi
26c4   6e25c4:	e8 00 00 00 00       	call   6e25c9 <shrink_lruvec+0x26c9>	6e25c5: R_X86_64_PLT32	blk_finish_plug-0x4
26c9   6e25c9:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
26ce   6e25ce:	48 8d 58 40          	lea    0x40(%rax),%rbx
26d2   6e25d2:	48 89 d8             	mov    %rbx,%rax
26d5   6e25d5:	48 c1 e8 03          	shr    $0x3,%rax
26d9   6e25d9:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
26de   6e25de:	74 08                	je     6e25e8 <shrink_lruvec+0x26e8>
26e0   6e25e0:	48 89 df             	mov    %rbx,%rdi
26e3   6e25e3:	e8 00 00 00 00       	call   6e25e8 <shrink_lruvec+0x26e8>	6e25e4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
26e8   6e25e8:	48 8b 84 24 e0 00 00 00 	mov    0xe0(%rsp),%rax
26f0   6e25f0:	48 01 03             	add    %rax,(%rbx)
26f3   6e25f3:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6e25f6: R_X86_64_32S	total_swap_pages
26fa   6e25fa:	48 c1 e8 03          	shr    $0x3,%rax
26fe   6e25fe:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2703   6e2603:	74 0c                	je     6e2611 <shrink_lruvec+0x2711>
2705   6e2605:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e2608: R_X86_64_32S	total_swap_pages
270c   6e260c:	e8 00 00 00 00       	call   6e2611 <shrink_lruvec+0x2711>	6e260d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
2711   6e2611:	48 8b 1d 00 00 00 00 	mov    0x0(%rip),%rbx        # 6e2618 <shrink_lruvec+0x2718>	6e2614: R_X86_64_PC32	total_swap_pages-0x4
2718   6e2618:	31 ff                	xor    %edi,%edi
271a   6e261a:	48 89 de             	mov    %rbx,%rsi
271d   6e261d:	e8 00 00 00 00       	call   6e2622 <shrink_lruvec+0x2722>	6e261e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2722   6e2622:	48 85 db             	test   %rbx,%rbx
2725   6e2625:	7e 40                	jle    6e2667 <shrink_lruvec+0x2767>
2727   6e2627:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6e262a: R_X86_64_32S	memory_cgrp_subsys_enabled_key
272e   6e262e:	48 c1 e8 03          	shr    $0x3,%rax
2732   6e2632:	42 8a 04 30          	mov    (%rax,%r14,1),%al
2736   6e2636:	84 c0                	test   %al,%al
2738   6e2638:	0f 85 39 03 00 00    	jne    6e2977 <shrink_lruvec+0x2a77>
273e   6e263e:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e2644 <shrink_lruvec+0x2744>	6e2640: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
2744   6e2644:	bf 01 00 00 00       	mov    $0x1,%edi
2749   6e2649:	89 de                	mov    %ebx,%esi
274b   6e264b:	e8 00 00 00 00       	call   6e2650 <shrink_lruvec+0x2750>	6e264c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
2750   6e2650:	85 db                	test   %ebx,%ebx
2752   6e2652:	7e 1d                	jle    6e2671 <shrink_lruvec+0x2771>
2754   6e2654:	e8 00 00 00 00       	call   6e2659 <shrink_lruvec+0x2759>	6e2655: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2759   6e2659:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
275e   6e265e:	48 8d 98 d8 00 00 00 	lea    0xd8(%rax),%rbx
2765   6e2665:	eb 27                	jmp    6e268e <shrink_lruvec+0x278e>
2767   6e2667:	e8 00 00 00 00       	call   6e266c <shrink_lruvec+0x276c>	6e2668: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
276c   6e266c:	e9 4c 01 00 00       	jmp    6e27bd <shrink_lruvec+0x28bd>
2771   6e2671:	e8 00 00 00 00       	call   6e2676 <shrink_lruvec+0x2776>	6e2672: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2776   6e2676:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6e2679: R_X86_64_32S	vm_node_stat
277d   6e267d:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e2680: R_X86_64_32S	vm_node_stat
2784   6e2684:	be 08 00 00 00       	mov    $0x8,%esi
2789   6e2689:	e8 00 00 00 00       	call   6e268e <shrink_lruvec+0x278e>	6e268a: R_X86_64_PLT32	__kasan_check_read-0x4
278e   6e268e:	48 89 d8             	mov    %rbx,%rax
2791   6e2691:	48 c1 e8 03          	shr    $0x3,%rax
2795   6e2695:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
279a   6e269a:	74 08                	je     6e26a4 <shrink_lruvec+0x27a4>
279c   6e269c:	48 89 df             	mov    %rbx,%rdi
279f   6e269f:	e8 00 00 00 00       	call   6e26a4 <shrink_lruvec+0x27a4>	6e26a0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
27a4   6e26a4:	48 8b 1b             	mov    (%rbx),%rbx
27a7   6e26a7:	45 31 ff             	xor    %r15d,%r15d
27aa   6e26aa:	31 ff                	xor    %edi,%edi
27ac   6e26ac:	48 89 de             	mov    %rbx,%rsi
27af   6e26af:	e8 00 00 00 00       	call   6e26b4 <shrink_lruvec+0x27b4>	6e26b0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
27b4   6e26b4:	48 85 db             	test   %rbx,%rbx
27b7   6e26b7:	4c 0f 49 fb          	cmovns %rbx,%r15
27bb   6e26bb:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6e26be: R_X86_64_32S	memory_cgrp_subsys_enabled_key
27c2   6e26c2:	48 c1 e8 03          	shr    $0x3,%rax
27c6   6e26c6:	42 8a 04 30          	mov    (%rax,%r14,1),%al
27ca   6e26ca:	84 c0                	test   %al,%al
27cc   6e26cc:	0f 85 cb 02 00 00    	jne    6e299d <shrink_lruvec+0x2a9d>
27d2   6e26d2:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e26d8 <shrink_lruvec+0x27d8>	6e26d4: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
27d8   6e26d8:	bf 01 00 00 00       	mov    $0x1,%edi
27dd   6e26dd:	89 de                	mov    %ebx,%esi
27df   6e26df:	e8 00 00 00 00       	call   6e26e4 <shrink_lruvec+0x27e4>	6e26e0: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
27e4   6e26e4:	85 db                	test   %ebx,%ebx
27e6   6e26e6:	7e 13                	jle    6e26fb <shrink_lruvec+0x27fb>
27e8   6e26e8:	e8 00 00 00 00       	call   6e26ed <shrink_lruvec+0x27ed>	6e26e9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
27ed   6e26ed:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
27f2   6e26f2:	48 8d 98 e0 00 00 00 	lea    0xe0(%rax),%rbx
27f9   6e26f9:	eb 1d                	jmp    6e2718 <shrink_lruvec+0x2818>
27fb   6e26fb:	e8 00 00 00 00       	call   6e2700 <shrink_lruvec+0x2800>	6e26fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2800   6e2700:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6e2703: R_X86_64_32S	vm_node_stat+0x8
2807   6e2707:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e270a: R_X86_64_32S	vm_node_stat+0x8
280e   6e270e:	be 08 00 00 00       	mov    $0x8,%esi
2813   6e2713:	e8 00 00 00 00       	call   6e2718 <shrink_lruvec+0x2818>	6e2714: R_X86_64_PLT32	__kasan_check_read-0x4
2818   6e2718:	48 89 d8             	mov    %rbx,%rax
281b   6e271b:	48 c1 e8 03          	shr    $0x3,%rax
281f   6e271f:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2824   6e2724:	74 08                	je     6e272e <shrink_lruvec+0x282e>
2826   6e2726:	48 89 df             	mov    %rbx,%rdi
2829   6e2729:	e8 00 00 00 00       	call   6e272e <shrink_lruvec+0x282e>	6e272a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
282e   6e272e:	48 8b 1b             	mov    (%rbx),%rbx
2831   6e2731:	45 31 f6             	xor    %r14d,%r14d
2834   6e2734:	31 ff                	xor    %edi,%edi
2836   6e2736:	48 89 de             	mov    %rbx,%rsi
2839   6e2739:	e8 00 00 00 00       	call   6e273e <shrink_lruvec+0x283e>	6e273a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
283e   6e273e:	48 85 db             	test   %rbx,%rbx
2841   6e2741:	4c 0f 49 f3          	cmovns %rbx,%r14
2845   6e2745:	4b 8d 1c 3e          	lea    (%r14,%r15,1),%rbx
2849   6e2749:	bf 00 00 04 00       	mov    $0x40000,%edi
284e   6e274e:	48 89 de             	mov    %rbx,%rsi
2851   6e2751:	e8 00 00 00 00       	call   6e2756 <shrink_lruvec+0x2856>	6e2752: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
2856   6e2756:	48 81 fb ff ff 03 00 	cmp    $0x3ffff,%rbx
285d   6e275d:	77 0c                	ja     6e276b <shrink_lruvec+0x286b>
285f   6e275f:	e8 00 00 00 00       	call   6e2764 <shrink_lruvec+0x2864>	6e2760: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2864   6e2764:	bb 01 00 00 00       	mov    $0x1,%ebx
2869   6e2769:	eb 19                	jmp    6e2784 <shrink_lruvec+0x2884>
286b   6e276b:	e8 00 00 00 00       	call   6e2770 <shrink_lruvec+0x2870>	6e276c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
2870   6e2770:	48 c1 eb 11          	shr    $0x11,%rbx
2874   6e2774:	48 83 e3 fe          	and    $0xfffffffffffffffe,%rbx
2878   6e2778:	48 8d 3c 9b          	lea    (%rbx,%rbx,4),%rdi
287c   6e277c:	e8 00 00 00 00       	call   6e2781 <shrink_lruvec+0x2881>	6e277d: R_X86_64_PLT32	int_sqrt-0x4
2881   6e2781:	48 89 c3             	mov    %rax,%rbx
2884   6e2784:	49 0f af df          	imul   %r15,%rbx
2888   6e2788:	48 89 df             	mov    %rbx,%rdi
288b   6e278b:	4c 89 f6             	mov    %r14,%rsi
288e   6e278e:	e8 00 00 00 00       	call   6e2793 <shrink_lruvec+0x2893>	6e278f: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
2893   6e2793:	4c 39 f3             	cmp    %r14,%rbx
2896   6e2796:	73 20                	jae    6e27b8 <shrink_lruvec+0x28b8>
2898   6e2798:	e8 00 00 00 00       	call   6e279d <shrink_lruvec+0x289d>	6e2799: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
289d   6e279d:	bf 20 00 00 00       	mov    $0x20,%edi
28a2   6e27a2:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
28a7   6e27a7:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
28ac   6e27ac:	b9 01 00 00 00       	mov    $0x1,%ecx
28b1   6e27b1:	e8 4a 7b 00 00       	call   6ea300 <shrink_active_list>
28b6   6e27b6:	eb 05                	jmp    6e27bd <shrink_lruvec+0x28bd>
28b8   6e27b8:	e8 00 00 00 00       	call   6e27bd <shrink_lruvec+0x28bd>	6e27b9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
28bd   6e27bd:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
28c1   6e27c1:	5b                   	pop    %rbx
28c2   6e27c2:	41 5c                	pop    %r12
28c4   6e27c4:	41 5d                	pop    %r13
28c6   6e27c6:	41 5e                	pop    %r14
28c8   6e27c8:	41 5f                	pop    %r15
28ca   6e27ca:	5d                   	pop    %rbp
28cb   6e27cb:	c3                   	ret
28cc   6e27cc:	31 d2                	xor    %edx,%edx
28ce   6e27ce:	f7 f7                	div    %edi
28d0   6e27d0:	89 c7                	mov    %eax,%edi
28d2   6e27d2:	b8 c8 00 00 00       	mov    $0xc8,%eax
28d7   6e27d7:	44 29 f0             	sub    %r14d,%eax
28da   6e27da:	48 98                	cltq
28dc   6e27dc:	48 0f af c8          	imul   %rax,%rcx
28e0   6e27e0:	48 89 c8             	mov    %rcx,%rax
28e3   6e27e3:	48 09 f0             	or     %rsi,%rax
28e6   6e27e6:	48 c1 e8 20          	shr    $0x20,%rax
28ea   6e27ea:	74 0d                	je     6e27f9 <shrink_lruvec+0x28f9>
28ec   6e27ec:	48 89 c8             	mov    %rcx,%rax
28ef   6e27ef:	31 d2                	xor    %edx,%edx
28f1   6e27f1:	48 f7 f6             	div    %rsi
28f4   6e27f4:	49 89 c7             	mov    %rax,%r15
28f7   6e27f7:	eb 09                	jmp    6e2802 <shrink_lruvec+0x2902>
28f9   6e27f9:	89 c8                	mov    %ecx,%eax
28fb   6e27fb:	31 d2                	xor    %edx,%edx
28fd   6e27fd:	f7 f6                	div    %esi
28ff   6e27ff:	41 89 c7             	mov    %eax,%r15d
2902   6e2802:	49 be 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r14
290c   6e280c:	48 8d 84 24 90 00 00 00 	lea    0x90(%rsp),%rax
2914   6e2814:	48 c1 e8 03          	shr    $0x3,%rax
2918   6e2818:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
291d   6e281d:	74 13                	je     6e2832 <shrink_lruvec+0x2932>
291f   6e281f:	48 89 fb             	mov    %rdi,%rbx
2922   6e2822:	48 8d bc 24 90 00 00 00 	lea    0x90(%rsp),%rdi
292a   6e282a:	e8 00 00 00 00       	call   6e282f <shrink_lruvec+0x292f>	6e282b: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
292f   6e282f:	48 89 df             	mov    %rbx,%rdi
2932   6e2832:	48 89 fb             	mov    %rdi,%rbx
2935   6e2835:	48 89 bc 24 90 00 00 00 	mov    %rdi,0x90(%rsp)
293d   6e283d:	48 8d bc 24 98 00 00 00 	lea    0x98(%rsp),%rdi
2945   6e2845:	48 89 f8             	mov    %rdi,%rax
2948   6e2848:	48 c1 e8 03          	shr    $0x3,%rax
294c   6e284c:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
2951   6e2851:	74 05                	je     6e2858 <shrink_lruvec+0x2958>
2953   6e2853:	e8 00 00 00 00       	call   6e2858 <shrink_lruvec+0x2958>	6e2854: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
2958   6e2858:	4c 89 bc 24 98 00 00 00 	mov    %r15,0x98(%rsp)
2960   6e2860:	48 89 de             	mov    %rbx,%rsi
2963   6e2863:	4c 01 fe             	add    %r15,%rsi
2966   6e2866:	b8 01 00 00 00       	mov    $0x1,%eax
296b   6e286b:	31 c9                	xor    %ecx,%ecx
296d   6e286d:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
2972   6e2872:	e9 75 da ff ff       	jmp    6e02ec <shrink_lruvec+0x3ec>
2977   6e2877:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6e287a: R_X86_64_32S	memory_cgrp_subsys_enabled_key
297e   6e287e:	48 c1 e8 03          	shr    $0x3,%rax
2982   6e2882:	42 8a 04 30          	mov    (%rax,%r14,1),%al
2986   6e2886:	84 c0                	test   %al,%al
2988   6e2888:	0f 85 a4 01 00 00    	jne    6e2a32 <shrink_lruvec+0x2b32>
298e   6e288e:	8b 1d 00 00 00 00    	mov    0x0(%rip),%ebx        # 6e2894 <shrink_lruvec+0x2994>	6e2890: R_X86_64_PC32	memory_cgrp_subsys_enabled_key-0x4
2994   6e2894:	bf 01 00 00 00       	mov    $0x1,%edi
2999   6e2899:	89 de                	mov    %ebx,%esi
299b   6e289b:	e8 00 00 00 00       	call   6e28a0 <shrink_lruvec+0x29a0>	6e289c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
29a0   6e28a0:	85 db                	test   %ebx,%ebx
29a2   6e28a2:	7e 42                	jle    6e28e6 <shrink_lruvec+0x29e6>
29a4   6e28a4:	e8 00 00 00 00       	call   6e28a9 <shrink_lruvec+0x29a9>	6e28a5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
29a9   6e28a9:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	6e28ac: R_X86_64_32S	root_mem_cgroup
29b0   6e28b0:	48 c1 e8 03          	shr    $0x3,%rax
29b4   6e28b4:	42 80 3c 30 00       	cmpb   $0x0,(%rax,%r14,1)
29b9   6e28b9:	74 0c                	je     6e28c7 <shrink_lruvec+0x29c7>
29bb   6e28bb:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e28be: R_X86_64_32S	root_mem_cgroup
29c2   6e28c2:	e8 00 00 00 00       	call   6e28c7 <shrink_lruvec+0x29c7>	6e28c3: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
29c7   6e28c7:	4c 39 25 00 00 00 00 	cmp    %r12,0x0(%rip)        # 6e28ce <shrink_lruvec+0x29ce>	6e28ca: R_X86_64_PC32	root_mem_cgroup-0x4
29ce   6e28ce:	49 8d 84 24 b8 04 00 00 	lea    0x4b8(%r12),%rax
29d6   6e28d6:	48 c7 c3 00 00 00 00 	mov    $0x0,%rbx	6e28d9: R_X86_64_32S	vm_swappiness
29dd   6e28dd:	48 0f 45 d8          	cmovne %rax,%rbx
29e1   6e28e1:	e9 4b d7 ff ff       	jmp    6e0031 <shrink_lruvec+0x131>
29e6   6e28e6:	e8 00 00 00 00       	call   6e28eb <shrink_lruvec+0x29eb>	6e28e7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
29eb   6e28eb:	e9 3a d7 ff ff       	jmp    6e002a <shrink_lruvec+0x12a>
29f0   6e28f0:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e28f3: R_X86_64_32S	memory_cgrp_subsys_enabled_key
29f7   6e28f7:	80 e1 07             	and    $0x7,%cl
29fa   6e28fa:	80 c1 03             	add    $0x3,%cl
29fd   6e28fd:	38 c1                	cmp    %al,%cl
29ff   6e28ff:	0f 8c a8 d6 ff ff    	jl     6dffad <shrink_lruvec+0xad>
2a05   6e2905:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e2908: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2a0c   6e290c:	e8 00 00 00 00       	call   6e2911 <shrink_lruvec+0x2a11>	6e290d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2a11   6e2911:	e9 97 d6 ff ff       	jmp    6dffad <shrink_lruvec+0xad>
2a16   6e2916:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e2919: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
2a1d   6e291d:	80 e1 07             	and    $0x7,%cl
2a20   6e2920:	80 c1 03             	add    $0x3,%cl
2a23   6e2923:	38 c1                	cmp    %al,%cl
2a25   6e2925:	0f 8c e3 d6 ff ff    	jl     6e000e <shrink_lruvec+0x10e>
2a2b   6e292b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e292e: R_X86_64_32S	memory_cgrp_subsys_on_dfl_key
2a32   6e2932:	e8 00 00 00 00       	call   6e2937 <shrink_lruvec+0x2a37>	6e2933: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2a37   6e2937:	e9 d2 d6 ff ff       	jmp    6e000e <shrink_lruvec+0x10e>
2a3c   6e293c:	89 d9                	mov    %ebx,%ecx
2a3e   6e293e:	80 e1 07             	and    $0x7,%cl
2a41   6e2941:	80 c1 03             	add    $0x3,%cl
2a44   6e2944:	38 c1                	cmp    %al,%cl
2a46   6e2946:	0f 8c fb d6 ff ff    	jl     6e0047 <shrink_lruvec+0x147>
2a4c   6e294c:	48 89 df             	mov    %rbx,%rdi
2a4f   6e294f:	e8 00 00 00 00       	call   6e2954 <shrink_lruvec+0x2a54>	6e2950: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2a54   6e2954:	e9 ee d6 ff ff       	jmp    6e0047 <shrink_lruvec+0x147>
2a59   6e2959:	44 89 e9             	mov    %r13d,%ecx
2a5c   6e295c:	80 e1 07             	and    $0x7,%cl
2a5f   6e295f:	80 c1 01             	add    $0x1,%cl
2a62   6e2962:	38 c1                	cmp    %al,%cl
2a64   6e2964:	0f 8c 18 d7 ff ff    	jl     6e0082 <shrink_lruvec+0x182>
2a6a   6e296a:	4c 89 ef             	mov    %r13,%rdi
2a6d   6e296d:	e8 00 00 00 00       	call   6e2972 <shrink_lruvec+0x2a72>	6e296e: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
2a72   6e2972:	e9 0b d7 ff ff       	jmp    6e0082 <shrink_lruvec+0x182>
2a77   6e2977:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e297a: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2a7e   6e297e:	80 e1 07             	and    $0x7,%cl
2a81   6e2981:	80 c1 03             	add    $0x3,%cl
2a84   6e2984:	38 c1                	cmp    %al,%cl
2a86   6e2986:	0f 8c b2 fc ff ff    	jl     6e263e <shrink_lruvec+0x273e>
2a8c   6e298c:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e298f: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2a93   6e2993:	e8 00 00 00 00       	call   6e2998 <shrink_lruvec+0x2a98>	6e2994: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2a98   6e2998:	e9 a1 fc ff ff       	jmp    6e263e <shrink_lruvec+0x273e>
2a9d   6e299d:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e29a0: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2aa4   6e29a4:	80 e1 07             	and    $0x7,%cl
2aa7   6e29a7:	80 c1 03             	add    $0x3,%cl
2aaa   6e29aa:	38 c1                	cmp    %al,%cl
2aac   6e29ac:	0f 8c 20 fd ff ff    	jl     6e26d2 <shrink_lruvec+0x27d2>
2ab2   6e29b2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e29b5: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2ab9   6e29b9:	e8 00 00 00 00       	call   6e29be <shrink_lruvec+0x2abe>	6e29ba: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2abe   6e29be:	e9 0f fd ff ff       	jmp    6e26d2 <shrink_lruvec+0x27d2>
2ac3   6e29c3:	89 d9                	mov    %ebx,%ecx
2ac5   6e29c5:	80 e1 07             	and    $0x7,%cl
2ac8   6e29c8:	80 c1 03             	add    $0x3,%cl
2acb   6e29cb:	38 c1                	cmp    %al,%cl
2acd   6e29cd:	0f 8c e8 e2 ff ff    	jl     6e0cbb <shrink_lruvec+0xdbb>
2ad3   6e29d3:	48 89 df             	mov    %rbx,%rdi
2ad6   6e29d6:	e8 00 00 00 00       	call   6e29db <shrink_lruvec+0x2adb>	6e29d7: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2adb   6e29db:	e9 db e2 ff ff       	jmp    6e0cbb <shrink_lruvec+0xdbb>
2ae0   6e29e0:	89 d9                	mov    %ebx,%ecx
2ae2   6e29e2:	80 e1 07             	and    $0x7,%cl
2ae5   6e29e5:	38 c1                	cmp    %al,%cl
2ae7   6e29e7:	0f 8c 15 e3 ff ff    	jl     6e0d02 <shrink_lruvec+0xe02>
2aed   6e29ed:	48 89 df             	mov    %rbx,%rdi
2af0   6e29f0:	e8 00 00 00 00       	call   6e29f5 <shrink_lruvec+0x2af5>	6e29f1: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2af5   6e29f5:	e9 08 e3 ff ff       	jmp    6e0d02 <shrink_lruvec+0xe02>
2afa   6e29fa:	89 d9                	mov    %ebx,%ecx
2afc   6e29fc:	80 e1 07             	and    $0x7,%cl
2aff   6e29ff:	38 c1                	cmp    %al,%cl
2b01   6e2a01:	0f 8c 8a d7 ff ff    	jl     6e0191 <shrink_lruvec+0x291>
2b07   6e2a07:	48 89 df             	mov    %rbx,%rdi
2b0a   6e2a0a:	e8 00 00 00 00       	call   6e2a0f <shrink_lruvec+0x2b0f>	6e2a0b: R_X86_64_PLT32	__asan_report_load1_noabort-0x4
2b0f   6e2a0f:	e9 7d d7 ff ff       	jmp    6e0191 <shrink_lruvec+0x291>
2b14   6e2a14:	44 89 e9             	mov    %r13d,%ecx
2b17   6e2a17:	80 e1 07             	and    $0x7,%cl
2b1a   6e2a1a:	80 c1 01             	add    $0x1,%cl
2b1d   6e2a1d:	38 c1                	cmp    %al,%cl
2b1f   6e2a1f:	0f 8c bd d7 ff ff    	jl     6e01e2 <shrink_lruvec+0x2e2>
2b25   6e2a25:	4c 89 ef             	mov    %r13,%rdi
2b28   6e2a28:	e8 00 00 00 00       	call   6e2a2d <shrink_lruvec+0x2b2d>	6e2a29: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
2b2d   6e2a2d:	e9 b0 d7 ff ff       	jmp    6e01e2 <shrink_lruvec+0x2e2>
2b32   6e2a32:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6e2a35: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2b39   6e2a39:	80 e1 07             	and    $0x7,%cl
2b3c   6e2a3c:	80 c1 03             	add    $0x3,%cl
2b3f   6e2a3f:	38 c1                	cmp    %al,%cl
2b41   6e2a41:	0f 8c 47 fe ff ff    	jl     6e288e <shrink_lruvec+0x298e>
2b47   6e2a47:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6e2a4a: R_X86_64_32S	memory_cgrp_subsys_enabled_key
2b4e   6e2a4e:	e8 00 00 00 00       	call   6e2a53 <shrink_lruvec+0x2b53>	6e2a4f: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
2b53   6e2a53:	e9 36 fe ff ff       	jmp    6e288e <shrink_lruvec+0x298e>
2b58   6e2a58:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
2b62   6e2a62:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
2b6c   6e2a6c:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)
2b76   6e2a76:	66 2e 0f 1f 84 00 00 00 00 00 	cs nopw 0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
