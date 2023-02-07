Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D54E7470;
	Tue,  7 Feb 2023 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675794509; x=1707330509;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qEXfHk7ivaEEdkkeDF+xLfBW+MXKA+UAiw5nsI1E654=;
  b=Bcb62507jftZph3NckY65VvgThXzV+X76dn+jUlVUvJSOWG80oz1uLtm
   AiXibOFPWIOXdzqubZ3QHW2QQkjvA3fvrxLd+tJf+D6pGIMUYb1K3HHz6
   vWq7JUhhW5iXKwKVuqmwyCrc0r7E7fChmrp62lCCeuwAi1YGpUgom54W0
   u9s/1MZwALjd1DK1nhCzW4H/4T6orv/s/qLELLqK0refZVK5D9CuwYYSc
   866M7jddrGkNWQtuD6Fa4t74bL1+m+ZN5eI1BMzsn7shSkZNYvTWtGuQI
   2HkEUU3i6kS4NnyIq98SeOOBZnmxky0BRTAIpH2B61+vXQ1lgQnOOvo17
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="309929261"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="309929261"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 10:28:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="697379926"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="697379926"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 07 Feb 2023 10:28:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPShe-0003ly-16;
	Tue, 07 Feb 2023 18:28:26 +0000
Date: Wed, 8 Feb 2023 02:28:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: btrfs_unfreeze+0x352: unreachable
 instruction
Message-ID: <202302080248.ajsVoUi3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

Hi Josef,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05ecb680708a1dbe6554d6fc17e5d9a8a7cb5e6a
commit: 083bd7e54e8e2c1d169f21236873272cdf6f409a btrfs: move the printk and assert helpers to messages.c
date:   9 weeks ago
config: x86_64-randconfig-r005-20230206 (https://download.01.org/0day-ci/archive/20230208/202302080248.ajsVoUi3-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=083bd7e54e8e2c1d169f21236873272cdf6f409a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 083bd7e54e8e2c1d169f21236873272cdf6f409a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: btrfs_unfreeze+0x352: unreachable instruction


objdump-func vmlinux.o btrfs_unfreeze:
0000 0000000000bdf8c0 <btrfs_unfreeze>:
0000   bdf8c0:	f3 0f 1e fa          	endbr64
0004   bdf8c4:	e8 00 00 00 00       	call   bdf8c9 <btrfs_unfreeze+0x9>	bdf8c5: R_X86_64_PLT32	__fentry__-0x4
0009   bdf8c9:	55                   	push   %rbp
000a   bdf8ca:	41 57                	push   %r15
000c   bdf8cc:	41 56                	push   %r14
000e   bdf8ce:	41 55                	push   %r13
0010   bdf8d0:	41 54                	push   %r12
0012   bdf8d2:	53                   	push   %rbx
0013   bdf8d3:	48 83 ec 28          	sub    $0x28,%rsp
0017   bdf8d7:	48 89 fd             	mov    %rdi,%rbp
001a   bdf8da:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
0024   bdf8e4:	48 81 c5 58 06 00 00 	add    $0x658,%rbp
002b   bdf8eb:	48 89 e8             	mov    %rbp,%rax
002e   bdf8ee:	48 c1 e8 03          	shr    $0x3,%rax
0032   bdf8f2:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0037   bdf8f7:	74 08                	je     bdf901 <btrfs_unfreeze+0x41>
0039   bdf8f9:	48 89 ef             	mov    %rbp,%rdi
003c   bdf8fc:	e8 00 00 00 00       	call   bdf901 <btrfs_unfreeze+0x41>	bdf8fd: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0041   bdf901:	48 8b 45 00          	mov    0x0(%rbp),%rax
0045   bdf905:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
004a   bdf90a:	4c 8d a8 a8 0f 00 00 	lea    0xfa8(%rax),%r13
0051   bdf911:	4c 89 e8             	mov    %r13,%rax
0054   bdf914:	48 c1 e8 03          	shr    $0x3,%rax
0058   bdf918:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
005d   bdf91d:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0062   bdf922:	74 08                	je     bdf92c <btrfs_unfreeze+0x6c>
0064   bdf924:	4c 89 ef             	mov    %r13,%rdi
0067   bdf927:	e8 00 00 00 00       	call   bdf92c <btrfs_unfreeze+0x6c>	bdf928: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
006c   bdf92c:	4d 8b 75 00          	mov    0x0(%r13),%r14
0070   bdf930:	49 8d ae 00 01 00 00 	lea    0x100(%r14),%rbp
0077   bdf937:	48 89 e8             	mov    %rbp,%rax
007a   bdf93a:	48 c1 e8 03          	shr    $0x3,%rax
007e   bdf93e:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0083   bdf943:	74 08                	je     bdf94d <btrfs_unfreeze+0x8d>
0085   bdf945:	48 89 ef             	mov    %rbp,%rdi
0088   bdf948:	e8 00 00 00 00       	call   bdf94d <btrfs_unfreeze+0x8d>	bdf949: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
008d   bdf94d:	4d 8b a6 00 01 00 00 	mov    0x100(%r14),%r12
0094   bdf954:	49 39 ec             	cmp    %rbp,%r12
0097   bdf957:	0f 84 b6 03 00 00    	je     bdfd13 <btrfs_unfreeze+0x453>
009d   bdf95d:	4c 89 6c 24 18       	mov    %r13,0x18(%rsp)
00a2   bdf962:	eb 15                	jmp    bdf979 <btrfs_unfreeze+0xb9>
00a4   bdf964:	49 8b 45 00          	mov    0x0(%r13),%rax
00a8   bdf968:	b9 00 01 00 00       	mov    $0x100,%ecx
00ad   bdf96d:	48 01 c8             	add    %rcx,%rax
00b0   bdf970:	49 39 c4             	cmp    %rax,%r12
00b3   bdf973:	0f 84 9a 03 00 00    	je     bdfd13 <btrfs_unfreeze+0x453>
00b9   bdf979:	49 8d 6c 24 38       	lea    0x38(%r12),%rbp
00be   bdf97e:	48 89 e8             	mov    %rbp,%rax
00c1   bdf981:	48 c1 e8 03          	shr    $0x3,%rax
00c5   bdf985:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00ca   bdf98a:	74 08                	je     bdf994 <btrfs_unfreeze+0xd4>
00cc   bdf98c:	48 89 ef             	mov    %rbp,%rdi
00cf   bdf98f:	e8 00 00 00 00       	call   bdf994 <btrfs_unfreeze+0xd4>	bdf990: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00d4   bdf994:	48 8b 5d 00          	mov    0x0(%rbp),%rbx
00d8   bdf998:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
00dc   bdf99c:	48 89 ef             	mov    %rbp,%rdi
00df   bdf99f:	be 08 00 00 00       	mov    $0x8,%esi
00e4   bdf9a4:	e8 00 00 00 00       	call   bdf9a9 <btrfs_unfreeze+0xe9>	bdf9a5: R_X86_64_PLT32	__kasan_check_read-0x4
00e9   bdf9a9:	48 89 e8             	mov    %rbp,%rax
00ec   bdf9ac:	48 c1 e8 03          	shr    $0x3,%rax
00f0   bdf9b0:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
00f5   bdf9b5:	74 08                	je     bdf9bf <btrfs_unfreeze+0xff>
00f7   bdf9b7:	48 89 ef             	mov    %rbp,%rdi
00fa   bdf9ba:	e8 00 00 00 00       	call   bdf9bf <btrfs_unfreeze+0xff>	bdf9bb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00ff   bdf9bf:	48 f7 45 00 00 08 00 00 	testq  $0x800,0x0(%rbp)
0107   bdf9c7:	0f 84 2d 02 00 00    	je     bdfbfa <btrfs_unfreeze+0x33a>
010d   bdf9cd:	49 8d 6c 24 50       	lea    0x50(%r12),%rbp
0112   bdf9d2:	48 89 e8             	mov    %rbp,%rax
0115   bdf9d5:	48 c1 e8 03          	shr    $0x3,%rax
0119   bdf9d9:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
011e   bdf9de:	74 08                	je     bdf9e8 <btrfs_unfreeze+0x128>
0120   bdf9e0:	48 89 ef             	mov    %rbp,%rdi
0123   bdf9e3:	e8 00 00 00 00       	call   bdf9e8 <btrfs_unfreeze+0x128>	bdf9e4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0128   bdf9e8:	48 8b 7d 00          	mov    0x0(%rbp),%rdi
012c   bdf9ec:	48 85 ff             	test   %rdi,%rdi
012f   bdf9ef:	0f 84 ce 01 00 00    	je     bdfbc3 <btrfs_unfreeze+0x303>
0135   bdf9f5:	31 f6                	xor    %esi,%esi
0137   bdf9f7:	ba 01 00 00 00       	mov    $0x1,%edx
013c   bdf9fc:	e8 00 00 00 00       	call   bdfa01 <btrfs_unfreeze+0x141>	bdf9fd: R_X86_64_PLT32	btrfs_read_dev_one_super-0x4
0141   bdfa01:	48 3d 01 f0 ff ff    	cmp    $0xfffffffffffff001,%rax
0147   bdfa07:	72 08                	jb     bdfa11 <btrfs_unfreeze+0x151>
0149   bdfa09:	41 89 c6             	mov    %eax,%r14d
014c   bdfa0c:	e9 a9 01 00 00       	jmp    bdfbba <btrfs_unfreeze+0x2fa>
0151   bdfa11:	48 89 1c 24          	mov    %rbx,(%rsp)
0155   bdfa15:	48 8d a8 c4 00 00 00 	lea    0xc4(%rax),%rbp
015c   bdfa1c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
0161   bdfa21:	4c 8d b0 c5 00 00 00 	lea    0xc5(%rax),%r14
0168   bdfa28:	48 89 e8             	mov    %rbp,%rax
016b   bdfa2b:	48 c1 e8 03          	shr    $0x3,%rax
016f   bdfa2f:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
0174   bdfa34:	84 c0                	test   %al,%al
0176   bdfa36:	0f 85 db 01 00 00    	jne    bdfc17 <btrfs_unfreeze+0x357>
017c   bdfa3c:	4c 89 f0             	mov    %r14,%rax
017f   bdfa3f:	48 c1 e8 03          	shr    $0x3,%rax
0183   bdfa43:	42 0f b6 04 38       	movzbl (%rax,%r15,1),%eax
0188   bdfa48:	84 c0                	test   %al,%al
018a   bdfa4a:	0f 85 e6 01 00 00    	jne    bdfc36 <btrfs_unfreeze+0x376>
0190   bdfa50:	44 0f b7 6d 00       	movzwl 0x0(%rbp),%r13d
0195   bdfa55:	48 8b 04 24          	mov    (%rsp),%rax
0199   bdfa59:	48 8d a8 a8 06 00 00 	lea    0x6a8(%rax),%rbp
01a0   bdfa60:	48 89 e8             	mov    %rbp,%rax
01a3   bdfa63:	48 c1 e8 03          	shr    $0x3,%rax
01a7   bdfa67:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
01ac   bdfa6c:	74 08                	je     bdfa76 <btrfs_unfreeze+0x1b6>
01ae   bdfa6e:	48 89 ef             	mov    %rbp,%rdi
01b1   bdfa71:	e8 00 00 00 00       	call   bdfa76 <btrfs_unfreeze+0x1b6>	bdfa72: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01b6   bdfa76:	4c 8b 7d 00          	mov    0x0(%rbp),%r15
01ba   bdfa7a:	4d 8d b7 c4 00 00 00 	lea    0xc4(%r15),%r14
01c1   bdfa81:	49 81 c7 c5 00 00 00 	add    $0xc5,%r15
01c8   bdfa88:	4c 89 f0             	mov    %r14,%rax
01cb   bdfa8b:	48 c1 e8 03          	shr    $0x3,%rax
01cf   bdfa8f:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
01d9   bdfa99:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
01dd   bdfa9d:	84 c0                	test   %al,%al
01df   bdfa9f:	0f 85 b1 01 00 00    	jne    bdfc56 <btrfs_unfreeze+0x396>
01e5   bdfaa5:	4c 89 f8             	mov    %r15,%rax
01e8   bdfaa8:	48 c1 e8 03          	shr    $0x3,%rax
01ec   bdfaac:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
01f0   bdfab0:	84 c0                	test   %al,%al
01f2   bdfab2:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
01f7   bdfab7:	0f 85 b9 01 00 00    	jne    bdfc76 <btrfs_unfreeze+0x3b6>
01fd   bdfabd:	41 0f b7 0e          	movzwl (%r14),%ecx
0201   bdfac1:	66 41 39 cd          	cmp    %cx,%r13w
0205   bdfac5:	0f 85 b1 00 00 00    	jne    bdfb7c <btrfs_unfreeze+0x2bc>
020b   bdfacb:	48 8b 1c 24          	mov    (%rsp),%rbx
020f   bdfacf:	48 89 df             	mov    %rbx,%rdi
0212   bdfad2:	48 89 ee             	mov    %rbp,%rsi
0215   bdfad5:	e8 00 00 00 00       	call   bdfada <btrfs_unfreeze+0x21a>	bdfad6: R_X86_64_PLT32	btrfs_check_super_csum-0x4
021a   bdfada:	48 89 df             	mov    %rbx,%rdi
021d   bdfadd:	85 c0                	test   %eax,%eax
021f   bdfadf:	0f 85 ac 00 00 00    	jne    bdfb91 <btrfs_unfreeze+0x2d1>
0225   bdfae5:	48 89 ee             	mov    %rbp,%rsi
0228   bdfae8:	31 d2                	xor    %edx,%edx
022a   bdfaea:	e8 00 00 00 00       	call   bdfaef <btrfs_unfreeze+0x22f>	bdfaeb: R_X86_64_PLT32	btrfs_validate_super-0x4
022f   bdfaef:	41 89 c6             	mov    %eax,%r14d
0232   bdfaf2:	85 c0                	test   %eax,%eax
0234   bdfaf4:	0f 88 a9 00 00 00    	js     bdfba3 <btrfs_unfreeze+0x2e3>
023a   bdfafa:	49 89 ef             	mov    %rbp,%r15
023d   bdfafd:	48 83 c5 48          	add    $0x48,%rbp
0241   bdfb01:	49 83 c7 4f          	add    $0x4f,%r15
0245   bdfb05:	48 89 e8             	mov    %rbp,%rax
0248   bdfb08:	48 c1 e8 03          	shr    $0x3,%rax
024c   bdfb0c:	48 bb 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbx
0256   bdfb16:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
025a   bdfb1a:	84 c0                	test   %al,%al
025c   bdfb1c:	0f 85 74 01 00 00    	jne    bdfc96 <btrfs_unfreeze+0x3d6>
0262   bdfb22:	4c 89 f8             	mov    %r15,%rax
0265   bdfb25:	48 c1 e8 03          	shr    $0x3,%rax
0269   bdfb29:	0f b6 04 18          	movzbl (%rax,%rbx,1),%eax
026d   bdfb2d:	84 c0                	test   %al,%al
026f   bdfb2f:	0f 85 80 01 00 00    	jne    bdfcb5 <btrfs_unfreeze+0x3f5>
0275   bdfb35:	4c 8b 7d 00          	mov    0x0(%rbp),%r15
0279   bdfb39:	48 8b 04 24          	mov    (%rsp),%rax
027d   bdfb3d:	48 8d a8 e0 04 00 00 	lea    0x4e0(%rax),%rbp
0284   bdfb44:	48 89 e8             	mov    %rbp,%rax
0287   bdfb47:	48 c1 e8 03          	shr    $0x3,%rax
028b   bdfb4b:	80 3c 18 00          	cmpb   $0x0,(%rax,%rbx,1)
028f   bdfb4f:	74 08                	je     bdfb59 <btrfs_unfreeze+0x299>
0291   bdfb51:	48 89 ef             	mov    %rbp,%rdi
0294   bdfb54:	e8 00 00 00 00       	call   bdfb59 <btrfs_unfreeze+0x299>	bdfb55: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0299   bdfb59:	48 8b 4d 00          	mov    0x0(%rbp),%rcx
029d   bdfb5d:	49 39 cf             	cmp    %rcx,%r15
02a0   bdfb60:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
02a5   bdfb65:	74 3c                	je     bdfba3 <btrfs_unfreeze+0x2e3>
02a7   bdfb67:	48 8b 3c 24          	mov    (%rsp),%rdi
02ab   bdfb6b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	bdfb6e: R_X86_64_32S	.rodata+0x5c9b20
02b2   bdfb72:	4c 89 fa             	mov    %r15,%rdx
02b5   bdfb75:	e8 00 00 00 00       	call   bdfb7a <btrfs_unfreeze+0x2ba>	bdfb76: R_X86_64_PLT32	_btrfs_printk-0x4
02ba   bdfb7a:	eb 21                	jmp    bdfb9d <btrfs_unfreeze+0x2dd>
02bc   bdfb7c:	48 8b 3c 24          	mov    (%rsp),%rdi
02c0   bdfb80:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	bdfb83: R_X86_64_32S	.rodata+0x5c9a60
02c7   bdfb87:	44 89 ea             	mov    %r13d,%edx
02ca   bdfb8a:	e8 00 00 00 00       	call   bdfb8f <btrfs_unfreeze+0x2cf>	bdfb8b: R_X86_64_PLT32	_btrfs_printk-0x4
02cf   bdfb8f:	eb 0c                	jmp    bdfb9d <btrfs_unfreeze+0x2dd>
02d1   bdfb91:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	bdfb94: R_X86_64_32S	.rodata+0x5c9ac0
02d8   bdfb98:	e8 00 00 00 00       	call   bdfb9d <btrfs_unfreeze+0x2dd>	bdfb99: R_X86_64_PLT32	_btrfs_printk-0x4
02dd   bdfb9d:	41 be 8b ff ff ff    	mov    $0xffffff8b,%r14d
02e3   bdfba3:	48 89 ef             	mov    %rbp,%rdi
02e6   bdfba6:	e8 00 00 00 00       	call   bdfbab <btrfs_unfreeze+0x2eb>	bdfba7: R_X86_64_PLT32	btrfs_release_disk_super-0x4
02eb   bdfbab:	49 bf 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r15
02f5   bdfbb5:	4c 8b 6c 24 18       	mov    0x18(%rsp),%r13
02fa   bdfbba:	45 85 f6             	test   %r14d,%r14d
02fd   bdfbbd:	0f 88 12 01 00 00    	js     bdfcd5 <btrfs_unfreeze+0x415>
0303   bdfbc3:	4c 89 e0             	mov    %r12,%rax
0306   bdfbc6:	48 c1 e8 03          	shr    $0x3,%rax
030a   bdfbca:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
030f   bdfbcf:	74 08                	je     bdfbd9 <btrfs_unfreeze+0x319>
0311   bdfbd1:	4c 89 e7             	mov    %r12,%rdi
0314   bdfbd4:	e8 00 00 00 00       	call   bdfbd9 <btrfs_unfreeze+0x319>	bdfbd5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0319   bdfbd9:	4d 8b 24 24          	mov    (%r12),%r12
031d   bdfbdd:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
0322   bdfbe2:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0327   bdfbe7:	0f 84 77 fd ff ff    	je     bdf964 <btrfs_unfreeze+0xa4>
032d   bdfbed:	4c 89 ef             	mov    %r13,%rdi
0330   bdfbf0:	e8 00 00 00 00       	call   bdfbf5 <btrfs_unfreeze+0x335>	bdfbf1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0335   bdfbf5:	e9 6a fd ff ff       	jmp    bdf964 <btrfs_unfreeze+0xa4>
033a   bdfbfa:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	bdfbfd: R_X86_64_32S	.rodata+0x5c9a00
0341   bdfc01:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	bdfc04: R_X86_64_32S	.rodata+0x5c1440
0348   bdfc08:	ba c7 08 00 00       	mov    $0x8c7,%edx
034d   bdfc0d:	e8 00 00 00 00       	call   bdfc12 <btrfs_unfreeze+0x352>	bdfc0e: R_X86_64_PLT32	btrfs_assertfail-0x4
0352   bdfc12:	e9 b6 fd ff ff       	jmp    bdf9cd <btrfs_unfreeze+0x10d>
0357   bdfc17:	89 e9                	mov    %ebp,%ecx
0359   bdfc19:	80 e1 07             	and    $0x7,%cl
035c   bdfc1c:	38 c1                	cmp    %al,%cl
035e   bdfc1e:	0f 8c 18 fe ff ff    	jl     bdfa3c <btrfs_unfreeze+0x17c>
0364   bdfc24:	be 02 00 00 00       	mov    $0x2,%esi
0369   bdfc29:	48 89 ef             	mov    %rbp,%rdi
036c   bdfc2c:	e8 00 00 00 00       	call   bdfc31 <btrfs_unfreeze+0x371>	bdfc2d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0371   bdfc31:	e9 06 fe ff ff       	jmp    bdfa3c <btrfs_unfreeze+0x17c>
0376   bdfc36:	44 89 f1             	mov    %r14d,%ecx
0379   bdfc39:	80 e1 07             	and    $0x7,%cl
037c   bdfc3c:	38 c1                	cmp    %al,%cl
037e   bdfc3e:	0f 8c 0c fe ff ff    	jl     bdfa50 <btrfs_unfreeze+0x190>
0384   bdfc44:	be 02 00 00 00       	mov    $0x2,%esi
0389   bdfc49:	4c 89 f7             	mov    %r14,%rdi
038c   bdfc4c:	e8 00 00 00 00       	call   bdfc51 <btrfs_unfreeze+0x391>	bdfc4d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0391   bdfc51:	e9 fa fd ff ff       	jmp    bdfa50 <btrfs_unfreeze+0x190>
0396   bdfc56:	44 89 f1             	mov    %r14d,%ecx
0399   bdfc59:	80 e1 07             	and    $0x7,%cl
039c   bdfc5c:	38 c1                	cmp    %al,%cl
039e   bdfc5e:	0f 8c 41 fe ff ff    	jl     bdfaa5 <btrfs_unfreeze+0x1e5>
03a4   bdfc64:	be 02 00 00 00       	mov    $0x2,%esi
03a9   bdfc69:	4c 89 f7             	mov    %r14,%rdi
03ac   bdfc6c:	e8 00 00 00 00       	call   bdfc71 <btrfs_unfreeze+0x3b1>	bdfc6d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
03b1   bdfc71:	e9 2f fe ff ff       	jmp    bdfaa5 <btrfs_unfreeze+0x1e5>
03b6   bdfc76:	44 89 f9             	mov    %r15d,%ecx
03b9   bdfc79:	80 e1 07             	and    $0x7,%cl
03bc   bdfc7c:	38 c1                	cmp    %al,%cl
03be   bdfc7e:	0f 8c 39 fe ff ff    	jl     bdfabd <btrfs_unfreeze+0x1fd>
03c4   bdfc84:	be 02 00 00 00       	mov    $0x2,%esi
03c9   bdfc89:	4c 89 ff             	mov    %r15,%rdi
03cc   bdfc8c:	e8 00 00 00 00       	call   bdfc91 <btrfs_unfreeze+0x3d1>	bdfc8d: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
03d1   bdfc91:	e9 27 fe ff ff       	jmp    bdfabd <btrfs_unfreeze+0x1fd>
03d6   bdfc96:	89 e9                	mov    %ebp,%ecx
03d8   bdfc98:	80 e1 07             	and    $0x7,%cl
03db   bdfc9b:	38 c1                	cmp    %al,%cl
03dd   bdfc9d:	0f 8c 7f fe ff ff    	jl     bdfb22 <btrfs_unfreeze+0x262>
03e3   bdfca3:	be 08 00 00 00       	mov    $0x8,%esi
03e8   bdfca8:	48 89 ef             	mov    %rbp,%rdi
03eb   bdfcab:	e8 00 00 00 00       	call   bdfcb0 <btrfs_unfreeze+0x3f0>	bdfcac: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
03f0   bdfcb0:	e9 6d fe ff ff       	jmp    bdfb22 <btrfs_unfreeze+0x262>
03f5   bdfcb5:	44 89 f9             	mov    %r15d,%ecx
03f8   bdfcb8:	80 e1 07             	and    $0x7,%cl
03fb   bdfcbb:	38 c1                	cmp    %al,%cl
03fd   bdfcbd:	0f 8c 72 fe ff ff    	jl     bdfb35 <btrfs_unfreeze+0x275>
0403   bdfcc3:	be 08 00 00 00       	mov    $0x8,%esi
0408   bdfcc8:	4c 89 ff             	mov    %r15,%rdi
040b   bdfccb:	e8 00 00 00 00       	call   bdfcd0 <btrfs_unfreeze+0x410>	bdfccc: R_X86_64_PLT32	__asan_report_load_n_noabort-0x4
0410   bdfcd0:	e9 60 fe ff ff       	jmp    bdfb35 <btrfs_unfreeze+0x275>
0415   bdfcd5:	49 83 c4 78          	add    $0x78,%r12
0419   bdfcd9:	4c 89 e0             	mov    %r12,%rax
041c   bdfcdc:	48 c1 e8 03          	shr    $0x3,%rax
0420   bdfce0:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
0425   bdfce5:	74 08                	je     bdfcef <btrfs_unfreeze+0x42f>
0427   bdfce7:	4c 89 e7             	mov    %r12,%rdi
042a   bdfcea:	e8 00 00 00 00       	call   bdfcef <btrfs_unfreeze+0x42f>	bdfceb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
042f   bdfcef:	4d 8b 0c 24          	mov    (%r12),%r9
0433   bdfcf3:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
0438   bdfcf8:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	bdfcfb: R_X86_64_32S	.rodata.str1.1+0x5ed51
043f   bdfcff:	ba 05 09 00 00       	mov    $0x905,%edx
0444   bdfd04:	44 89 f1             	mov    %r14d,%ecx
0447   bdfd07:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8	bdfd0a: R_X86_64_32S	.rodata+0x5c99a0
044e   bdfd0e:	e8 00 00 00 00       	call   bdfd13 <btrfs_unfreeze+0x453>	bdfd0f: R_X86_64_PLT32	__btrfs_handle_fs_error-0x4
0453   bdfd13:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
0458   bdfd18:	48 8d 7b 10          	lea    0x10(%rbx),%rdi
045c   bdfd1c:	be 08 00 00 00       	mov    $0x8,%esi
0461   bdfd21:	e8 00 00 00 00       	call   bdfd26 <btrfs_unfreeze+0x466>	bdfd22: R_X86_64_PLT32	__kasan_check_write-0x4
0466   bdfd26:	80 63 11 f7          	andb   $0xf7,0x11(%rbx)
046a   bdfd2a:	31 c0                	xor    %eax,%eax
046c   bdfd2c:	48 83 c4 28          	add    $0x28,%rsp
0470   bdfd30:	5b                   	pop    %rbx
0471   bdfd31:	41 5c                	pop    %r12
0473   bdfd33:	41 5d                	pop    %r13
0475   bdfd35:	41 5e                	pop    %r14
0477   bdfd37:	41 5f                	pop    %r15
0479   bdfd39:	5d                   	pop    %rbp
047a   bdfd3a:	c3                   	ret
047b   bdfd3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
