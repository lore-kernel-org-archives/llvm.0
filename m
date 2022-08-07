Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C0B1C20
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 05:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659850413; x=1691386413;
  h=date:from:cc:subject:message-id:mime-version;
  bh=56I0rRrEnYvsGR1cBvESklwqrLEmA4pjAXziy55HIy0=;
  b=XgJ0m7W+rwLTurfgLuuh5YdTkxjQ4g+lzkjT5dCeYq5/KPhEqP3GztJ0
   SiQxXni7fvmYkXvEmc3j3Dj4+hcX6xP7AiWqhTO6TVUSNKOFiCwh+zWEZ
   CVoQOPewgzC/OKmHJIcV5Fn2xUIKlehHahmGk9KkbBFrAErI+G/HanaG4
   MYVxHOSUd0V3UDSP6YEy9gVuT3r1YGyAmWU6gqn7VQ1eoxseVpwF6t9Et
   9UjxcpspPcQvbSfiauda+rkZhe3C2Zce4GD3aGlikkvn3fZD+Ch+AmDg1
   ifFyShlOHJmgzlgbJAVHESr+aTtPdKpQTzvGmXaQZqyUESAaxLepaTTBt
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="290420909"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="290420909"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 22:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="632476497"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 06 Aug 2022 22:33:22 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKYuf-000L13-2p;
	Sun, 07 Aug 2022 05:33:21 +0000
Date: Sun, 7 Aug 2022 13:32:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:tglx/devel/depthtracking 57/59]
 arch/x86/kernel/ftrace_64.o: warning: objtool: .altinstr_replacement+0x0:
 unsupported relocation in alternatives section
Message-ID: <202208071359.IcZLf8pD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/depthtracking
head:   b518e558c49324fa002255761d2a7324ba31f7b5
commit: cb5c190267562764025e25c3e726ae511003b0a0 [57/59] x86/ftrace: Make it call depth tracking aware
config: x86_64-randconfig-a005-20220801 (https://download.01.org/0day-ci/archive/20220807/202208071359.IcZLf8pD-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/cb5c190267562764025e25c3e726ae511003b0a0
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tglx/devel/depthtracking
        git checkout cb5c190267562764025e25c3e726ae511003b0a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/ftrace_64.o: warning: objtool: .altinstr_replacement+0x0: unsupported relocation in alternatives section


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000        0:	e8 00 00 00 00       	call   5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	clear_page_rep-0x4
0005        5:	e8 00 00 00 00       	call   a <.altinstr_replacement+0xa>	6: R_X86_64_PLT32	clear_page_erms-0x4
000a        a:	48 0f ba ec 3f       	bts    $0x3f,%rsp
000f        f:	e8 00 00 00 00       	call   14 <.altinstr_replacement+0x14>	10: R_X86_64_PLT32	zen_untrain_ret-0x4
0014       14:	e8 00 00 00 00       	call   19 <.altinstr_replacement+0x19>	15: R_X86_64_PLT32	entry_ibpb-0x4
0019       19:	48 c7 c0 80 00 00 00 	mov    $0x80,%rax
0020       20:	48 c1 e0 38          	shl    $0x38,%rax
0024       24:	48 89 04 25 00 00 00 00 	mov    %rax,0x0	28: R_X86_64_32S	pcpu_hot+0x10
002c       2c:	e9 00 00 00 00       	jmp    31 <.altinstr_replacement+0x31>	2d: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0031       31:	48 c1 e1 07          	shl    $0x7,%rcx
0035       35:	48 c1 f9 07          	sar    $0x7,%rcx
0039       39:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	3d: R_X86_64_32S	pcpu_hot+0x10
0042       42:	e8 00 00 00 00       	call   47 <.altinstr_replacement+0x47>	43: R_X86_64_PLT32	__x86_indirect_thunk_rbx-0x4
0047       47:	0f ae e8             	lfence 
004a       4a:	ff d3                	call   *%rbx
004c       4c:	e8 00 00 00 00       	call   51 <.altinstr_replacement+0x51>	4d: R_X86_64_PLT32	zen_untrain_ret-0x4
0051       51:	e8 00 00 00 00       	call   56 <.altinstr_replacement+0x56>	52: R_X86_64_PLT32	entry_ibpb-0x4
0056       56:	48 c7 c0 fc 00 00 00 	mov    $0xfc,%rax
005d       5d:	48 c1 e0 38          	shl    $0x38,%rax
0061       61:	48 89 04 25 00 00 00 00 	mov    %rax,0x0	65: R_X86_64_32S	pcpu_hot+0x10
0069       69:	0f 01 ca             	clac   
006c       6c:	e8 00 00 00 00       	call   71 <.altinstr_replacement+0x71>	6d: R_X86_64_PLT32	xen_error_entry-0x4
0071       71:	0f 01 ca             	clac   
0074       74:	e8 00 00 00 00       	call   79 <.altinstr_replacement+0x79>	75: R_X86_64_PLT32	xen_error_entry-0x4
0079       79:	0f 01 ca             	clac   
007c       7c:	e8 00 00 00 00       	call   81 <.altinstr_replacement+0x81>	7d: R_X86_64_PLT32	xen_error_entry-0x4
0081       81:	0f 01 ca             	clac   
0084       84:	e8 00 00 00 00       	call   89 <.altinstr_replacement+0x89>	85: R_X86_64_PLT32	xen_error_entry-0x4
0089       89:	0f 01 ca             	clac   
008c       8c:	e8 00 00 00 00       	call   91 <.altinstr_replacement+0x91>	8d: R_X86_64_PLT32	xen_error_entry-0x4
0091       91:	0f 01 ca             	clac   
0094       94:	e8 00 00 00 00       	call   99 <.altinstr_replacement+0x99>	95: R_X86_64_PLT32	xen_error_entry-0x4
0099       99:	0f 01 ca             	clac   
009c       9c:	e8 00 00 00 00       	call   a1 <.altinstr_replacement+0xa1>	9d: R_X86_64_PLT32	xen_error_entry-0x4
00a1       a1:	0f 01 ca             	clac   
00a4       a4:	e8 00 00 00 00       	call   a9 <.altinstr_replacement+0xa9>	a5: R_X86_64_PLT32	xen_error_entry-0x4
00a9       a9:	0f 01 ca             	clac   
00ac       ac:	e8 00 00 00 00       	call   b1 <.altinstr_replacement+0xb1>	ad: R_X86_64_PLT32	xen_error_entry-0x4
00b1       b1:	0f 01 ca             	clac   
00b4       b4:	e8 00 00 00 00       	call   b9 <.altinstr_replacement+0xb9>	b5: R_X86_64_PLT32	xen_error_entry-0x4
00b9       b9:	0f 01 ca             	clac   
00bc       bc:	e8 00 00 00 00       	call   c1 <.altinstr_replacement+0xc1>	bd: R_X86_64_PLT32	xen_error_entry-0x4
00c1       c1:	0f 01 ca             	clac   
00c4       c4:	e8 00 00 00 00       	call   c9 <.altinstr_replacement+0xc9>	c5: R_X86_64_PLT32	xen_error_entry-0x4
00c9       c9:	0f 01 ca             	clac   
00cc       cc:	e8 00 00 00 00       	call   d1 <.altinstr_replacement+0xd1>	cd: R_X86_64_PLT32	xen_error_entry-0x4
00d1       d1:	0f 01 ca             	clac   
00d4       d4:	e8 00 00 00 00       	call   d9 <.altinstr_replacement+0xd9>	d5: R_X86_64_PLT32	xen_error_entry-0x4
00d9       d9:	0f 01 ca             	clac   
00dc       dc:	e8 00 00 00 00       	call   e1 <.altinstr_replacement+0xe1>	dd: R_X86_64_PLT32	xen_error_entry-0x4
00e1       e1:	0f 01 ca             	clac   
00e4       e4:	e8 00 00 00 00       	call   e9 <.altinstr_replacement+0xe9>	e5: R_X86_64_PLT32	xen_error_entry-0x4
00e9       e9:	0f 01 ca             	clac   
00ec       ec:	e8 00 00 00 00       	call   f1 <.altinstr_replacement+0xf1>	ed: R_X86_64_PLT32	xen_error_entry-0x4
00f1       f1:	0f 01 ca             	clac   
00f4       f4:	e8 00 00 00 00       	call   f9 <.altinstr_replacement+0xf9>	f5: R_X86_64_PLT32	xen_error_entry-0x4
00f9       f9:	0f 01 ca             	clac   
00fc       fc:	0f 01 ca             	clac   
00ff       ff:	e8 00 00 00 00       	call   104 <.altinstr_replacement+0x104>	100: R_X86_64_PLT32	xen_error_entry-0x4
0104      104:	0f 01 ca             	clac   
0107      107:	e8 00 00 00 00       	call   10c <.altinstr_replacement+0x10c>	108: R_X86_64_PLT32	xen_error_entry-0x4
010c      10c:	0f 01 ca             	clac   
010f      10f:	e8 00 00 00 00       	call   114 <.altinstr_replacement+0x114>	110: R_X86_64_PLT32	xen_error_entry-0x4
0114      114:	0f 01 ca             	clac   
0117      117:	e8 00 00 00 00       	call   11c <.altinstr_replacement+0x11c>	118: R_X86_64_PLT32	xen_error_entry-0x4
011c      11c:	0f 01 ca             	clac   
011f      11f:	e8 00 00 00 00       	call   124 <.altinstr_replacement+0x124>	120: R_X86_64_PLT32	xen_error_entry-0x4
0124      124:	0f 01 ca             	clac   
0127      127:	e8 00 00 00 00       	call   12c <.altinstr_replacement+0x12c>	128: R_X86_64_PLT32	xen_error_entry-0x4
012c      12c:	0f 01 ca             	clac   
012f      12f:	e8 00 00 00 00       	call   134 <.altinstr_replacement+0x134>	130: R_X86_64_PLT32	xen_error_entry-0x4
0134      134:	0f 01 ca             	clac   
0137      137:	e8 00 00 00 00       	call   13c <.altinstr_replacement+0x13c>	138: R_X86_64_PLT32	xen_error_entry-0x4
013c      13c:	0f 01 ca             	clac   
013f      13f:	e8 00 00 00 00       	call   144 <.altinstr_replacement+0x144>	140: R_X86_64_PLT32	xen_error_entry-0x4
0144      144:	0f 01 ca             	clac   
0147      147:	e8 00 00 00 00       	call   14c <.altinstr_replacement+0x14c>	148: R_X86_64_PLT32	xen_error_entry-0x4
014c      14c:	0f 01 ca             	clac   
014f      14f:	e8 00 00 00 00       	call   154 <.altinstr_replacement+0x154>	150: R_X86_64_PLT32	xen_error_entry-0x4
0154      154:	0f 01 ca             	clac   
0157      157:	e8 00 00 00 00       	call   15c <.altinstr_replacement+0x15c>	158: R_X86_64_PLT32	xen_error_entry-0x4
015c      15c:	0f 01 ca             	clac   
015f      15f:	e8 00 00 00 00       	call   164 <.altinstr_replacement+0x164>	160: R_X86_64_PLT32	xen_error_entry-0x4
0164      164:	48 0f ba ef 3f       	bts    $0x3f,%rdi
0169      169:	0f ae f0             	mfence 
016c      16c:	b8 2b 00 00 00       	mov    $0x2b,%eax
0171      171:	8e e8                	mov    %eax,%gs
0173      173:	48 0f ba e8 3f       	bts    $0x3f,%rax
0178      178:	0f ae e8             	lfence 
017b      17b:	e8 00 00 00 00       	call   180 <.altinstr_replacement+0x180>	17c: R_X86_64_PLT32	zen_untrain_ret-0x4
0180      180:	e8 00 00 00 00       	call   185 <.altinstr_replacement+0x185>	181: R_X86_64_PLT32	entry_ibpb-0x4
0185      185:	48 c7 c0 fc 00 00 00 	mov    $0xfc,%rax
018c      18c:	48 c1 e0 38          	shl    $0x38,%rax
0190      190:	48 89 04 25 00 00 00 00 	mov    %rax,0x0	194: R_X86_64_32S	pcpu_hot+0x10
0198      198:	0f ae e8             	lfence 
019b      19b:	48 0f ba e8 3f       	bts    $0x3f,%rax
01a0      1a0:	e8 00 00 00 00       	call   1a5 <.altinstr_replacement+0x1a5>	1a1: R_X86_64_PLT32	zen_untrain_ret-0x4
01a5      1a5:	e8 00 00 00 00       	call   1aa <.altinstr_replacement+0x1aa>	1a6: R_X86_64_PLT32	entry_ibpb-0x4
01aa      1aa:	48 c7 c0 fc 00 00 00 	mov    $0xfc,%rax
01b1      1b1:	48 c1 e0 38          	shl    $0x38,%rax
01b5      1b5:	48 89 04 25 00 00 00 00 	mov    %rax,0x0	1b9: R_X86_64_32S	pcpu_hot+0x10
01bd      1bd:	0f ae e8             	lfence 
01c0      1c0:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	1c4: R_X86_64_32S	pcpu_hot+0x10
01c9      1c9:	0f ae e8             	lfence 
01cc      1cc:	48 0f ba e8 3f       	bts    $0x3f,%rax
01d1      1d1:	e8 00 00 00 00       	call   1d6 <.altinstr_replacement+0x1d6>	1d2: R_X86_64_PLT32	zen_untrain_ret-0x4
01d6      1d6:	e8 00 00 00 00       	call   1db <.altinstr_replacement+0x1db>	1d7: R_X86_64_PLT32	entry_ibpb-0x4
01db      1db:	48 c7 c0 fc 00 00 00 	mov    $0xfc,%rax
01e2      1e2:	48 c1 e0 38          	shl    $0x38,%rax
01e6      1e6:	48 89 04 25 00 00 00 00 	mov    %rax,0x0	1ea: R_X86_64_32S	pcpu_hot+0x10
01ee      1ee:	0f 01 ca             	clac   
01f1      1f1:	0f ae e8             	lfence 
01f4      1f4:	48 0f ba ea 3f       	bts    $0x3f,%rdx
01f9      1f9:	e8 00 00 00 00       	call   1fe <.altinstr_replacement+0x1fe>	1fa: R_X86_64_PLT32	zen_untrain_ret-0x4
01fe      1fe:	e8 00 00 00 00       	call   203 <.altinstr_replacement+0x203>	1ff: R_X86_64_PLT32	entry_ibpb-0x4
0203      203:	48 c7 c0 80 00 00 00 	mov    $0x80,%rax
020a      20a:	48 c1 e0 38          	shl    $0x38,%rax
020e      20e:	48 89 04 25 00 00 00 00 	mov    %rax,0x0	212: R_X86_64_32S	pcpu_hot+0x10
0216      216:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0220      220:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
022a      22a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0234      234:	e9 00 00 00 00       	jmp    239 <.altinstr_replacement+0x239>	235: R_X86_64_PLT32	.init.text+0x7189
0239      239:	e9 00 00 00 00       	jmp    23e <.altinstr_replacement+0x23e>	23a: R_X86_64_PLT32	.init.text+0x722c
023e      23e:	e9 00 00 00 00       	jmp    243 <.altinstr_replacement+0x243>	23f: R_X86_64_PLT32	.init.text+0x7443
0243      243:	e9 00 00 00 00       	jmp    248 <.altinstr_replacement+0x248>	244: R_X86_64_PLT32	.init.text+0x7469
0248      248:	f3 48 0f b8 c7       	popcnt %rdi,%rax
024d      24d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0252      252:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
025c      25c:	f3 0f b8 c7          	popcnt %edi,%eax
0260      260:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0265      265:	f3 48 0f b8 c7       	popcnt %rdi,%rax
026a      26a:	0f ae e8             	lfence 
026d      26d:	0f 31                	rdtsc  
026f      26f:	0f 01 f9             	rdtscp 
0272      272:	0f ae e8             	lfence 
0275      275:	0f 31                	rdtsc  
0277      277:	0f 01 f9             	rdtscp 
027a      27a:	0f ae e8             	lfence 
027d      27d:	0f 31                	rdtsc  
027f      27f:	0f 01 f9             	rdtscp 
0282      282:	e9 00 00 00 00       	jmp    287 <.altinstr_replacement+0x287>	283: R_X86_64_PLT32	.init.text+0xdbbb
0287      287:	f3 48 0f b8 c7       	popcnt %rdi,%rax
028c      28c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0291      291:	e9 00 00 00 00       	jmp    296 <.altinstr_replacement+0x296>	292: R_X86_64_PLT32	.text+0x2f9ea
0296      296:	e9 00 00 00 00       	jmp    29b <.altinstr_replacement+0x29b>	297: R_X86_64_PLT32	.text+0x30b42
029b      29b:	e9 00 00 00 00       	jmp    2a0 <.altinstr_replacement+0x2a0>	29c: R_X86_64_PLT32	.text+0x30b4b
02a0      2a0:	e9 00 00 00 00       	jmp    2a5 <.altinstr_replacement+0x2a5>	2a1: R_X86_64_PLT32	.text+0x30b54
02a5      2a5:	e9 00 00 00 00       	jmp    2aa <.altinstr_replacement+0x2aa>	2a6: R_X86_64_PLT32	.text+0x30b5d
02aa      2aa:	e9 00 00 00 00       	jmp    2af <.altinstr_replacement+0x2af>	2ab: R_X86_64_PLT32	.text+0x3132d
02af      2af:	e9 00 00 00 00       	jmp    2b4 <.altinstr_replacement+0x2b4>	2b0: R_X86_64_PLT32	.text+0x3133f
02b4      2b4:	e9 00 00 00 00       	jmp    2b9 <.altinstr_replacement+0x2b9>	2b5: R_X86_64_PLT32	.text+0x3136c
02b9      2b9:	e9 00 00 00 00       	jmp    2be <.altinstr_replacement+0x2be>	2ba: R_X86_64_PLT32	.text+0x31375
02be      2be:	e9 00 00 00 00       	jmp    2c3 <.altinstr_replacement+0x2c3>	2bf: R_X86_64_PLT32	.text+0x313c7
02c3      2c3:	e9 00 00 00 00       	jmp    2c8 <.altinstr_replacement+0x2c8>	2c4: R_X86_64_PLT32	.text+0x30e0f
02c8      2c8:	e9 00 00 00 00       	jmp    2cd <.altinstr_replacement+0x2cd>	2c9: R_X86_64_PLT32	.text+0x31336
02cd      2cd:	e9 00 00 00 00       	jmp    2d2 <.altinstr_replacement+0x2d2>	2ce: R_X86_64_PLT32	.text+0x31348
02d2      2d2:	e9 00 00 00 00       	jmp    2d7 <.altinstr_replacement+0x2d7>	2d3: R_X86_64_PLT32	.text+0x31351
02d7      2d7:	e9 00 00 00 00       	jmp    2dc <.altinstr_replacement+0x2dc>	2d8: R_X86_64_PLT32	.text+0x30fd7
02dc      2dc:	e9 00 00 00 00       	jmp    2e1 <.altinstr_replacement+0x2e1>	2dd: R_X86_64_PLT32	.text+0x3135a
02e1      2e1:	e9 00 00 00 00       	jmp    2e6 <.altinstr_replacement+0x2e6>	2e2: R_X86_64_PLT32	.text+0x31363
02e6      2e6:	e9 00 00 00 00       	jmp    2eb <.altinstr_replacement+0x2eb>	2e7: R_X86_64_PLT32	.text+0x318d7
02eb      2eb:	e9 00 00 00 00       	jmp    2f0 <.altinstr_replacement+0x2f0>	2ec: R_X86_64_PLT32	.text+0x318e0
02f0      2f0:	e9 00 00 00 00       	jmp    2f5 <.altinstr_replacement+0x2f5>	2f1: R_X86_64_PLT32	.text+0x319fd
02f5      2f5:	e9 00 00 00 00       	jmp    2fa <.altinstr_replacement+0x2fa>	2f6: R_X86_64_PLT32	.text+0x31abf
02fa      2fa:	e9 00 00 00 00       	jmp    2ff <.altinstr_replacement+0x2ff>	2fb: R_X86_64_PLT32	.text+0x31e60
02ff      2ff:	e9 00 00 00 00       	jmp    304 <.altinstr_replacement+0x304>	300: R_X86_64_PLT32	.text+0x3205e
0304      304:	e9 00 00 00 00       	jmp    309 <.altinstr_replacement+0x309>	305: R_X86_64_PLT32	.text+0x320d1
0309      309:	e9 00 00 00 00       	jmp    30e <.altinstr_replacement+0x30e>	30a: R_X86_64_PLT32	.text+0x31fbe
030e      30e:	e9 00 00 00 00       	jmp    313 <.altinstr_replacement+0x313>	30f: R_X86_64_PLT32	.text+0x32009
0313      313:	e9 00 00 00 00       	jmp    318 <.altinstr_replacement+0x318>	314: R_X86_64_PLT32	.text+0x321be
0318      318:	e9 00 00 00 00       	jmp    31d <.altinstr_replacement+0x31d>	319: R_X86_64_PLT32	.text+0x330c5
031d      31d:	e9 00 00 00 00       	jmp    322 <.altinstr_replacement+0x322>	31e: R_X86_64_PLT32	.text+0x33d96
0322      322:	e9 00 00 00 00       	jmp    327 <.altinstr_replacement+0x327>	323: R_X86_64_PLT32	.text+0x33efe
0327      327:	e9 00 00 00 00       	jmp    32c <.altinstr_replacement+0x32c>	328: R_X86_64_PLT32	.text+0x34312
032c      32c:	f3 0f b8 c7          	popcnt %edi,%eax
0330      330:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0335      335:	e9 00 00 00 00       	jmp    33a <.altinstr_replacement+0x33a>	336: R_X86_64_PLT32	.text+0x5ff5a
033a      33a:	e9 00 00 00 00       	jmp    33f <.altinstr_replacement+0x33f>	33b: R_X86_64_PLT32	.noinstr.text+0x16c
033f      33f:	e9 00 00 00 00       	jmp    344 <.altinstr_replacement+0x344>	340: R_X86_64_PLT32	.noinstr.text+0x205
0344      344:	e9 00 00 00 00       	jmp    349 <.altinstr_replacement+0x349>	345: R_X86_64_PLT32	.text+0x60a82
0349      349:	e9 00 00 00 00       	jmp    34e <.altinstr_replacement+0x34e>	34a: R_X86_64_PLT32	.text+0x61584
034e      34e:	e9 00 00 00 00       	jmp    353 <.altinstr_replacement+0x353>	34f: R_X86_64_PLT32	.text+0x61646
0353      353:	e9 00 00 00 00       	jmp    358 <.altinstr_replacement+0x358>	354: R_X86_64_PLT32	.text+0x6128c
0358      358:	e9 00 00 00 00       	jmp    35d <.altinstr_replacement+0x35d>	359: R_X86_64_PLT32	.text+0x61325
035d      35d:	e9 00 00 00 00       	jmp    362 <.altinstr_replacement+0x362>	35e: R_X86_64_PLT32	.text+0x61ba7
0362      362:	e9 00 00 00 00       	jmp    367 <.altinstr_replacement+0x367>	363: R_X86_64_PLT32	.text+0x61be5
0367      367:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
0371      371:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
037b      37b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0385      385:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
038f      38f:	0f 01 cb             	stac   
0392      392:	0f ae e8             	lfence 
0395      395:	0f 01 ca             	clac   
0398      398:	0f 01 ca             	clac   
039b      39b:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
03a5      3a5:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
03af      3af:	e9 00 00 00 00       	jmp    3b4 <.altinstr_replacement+0x3b4>	3b0: R_X86_64_PLT32	.noinstr.text+0xb3b
03b4      3b4:	e9 00 00 00 00       	jmp    3b9 <.altinstr_replacement+0x3b9>	3b5: R_X86_64_PLT32	.noinstr.text+0xe34
03b9      3b9:	e9 00 00 00 00       	jmp    3be <.altinstr_replacement+0x3be>	3ba: R_X86_64_PLT32	.noinstr.text+0xe5b
03be      3be:	e9 00 00 00 00       	jmp    3c3 <.altinstr_replacement+0x3c3>	3bf: R_X86_64_PLT32	.noinstr.text+0x112d
03c3      3c3:	e9 00 00 00 00       	jmp    3c8 <.altinstr_replacement+0x3c8>	3c4: R_X86_64_PLT32	.noinstr.text+0x15b5
03c8      3c8:	e9 00 00 00 00       	jmp    3cd <.altinstr_replacement+0x3cd>	3c9: R_X86_64_PLT32	.init.text+0x14257
03cd      3cd:	e9 00 00 00 00       	jmp    3d2 <.altinstr_replacement+0x3d2>	3ce: R_X86_64_PLT32	.noinstr.text+0x1c4d
03d2      3d2:	e9 00 00 00 00       	jmp    3d7 <.altinstr_replacement+0x3d7>	3d3: R_X86_64_PLT32	.text+0x6e259
03d7      3d7:	e9 00 00 00 00       	jmp    3dc <.altinstr_replacement+0x3dc>	3d8: R_X86_64_PLT32	.text+0x6f1e4
03dc      3dc:	e9 00 00 00 00       	jmp    3e1 <.altinstr_replacement+0x3e1>	3dd: R_X86_64_PLT32	.init.text+0x144c7
03e1      3e1:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
03eb      3eb:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
03f5      3f5:	e9 00 00 00 00       	jmp    3fa <.altinstr_replacement+0x3fa>	3f6: R_X86_64_PLT32	.init.text+0x1701e
03fa      3fa:	e9 00 00 00 00       	jmp    3ff <.altinstr_replacement+0x3ff>	3fb: R_X86_64_PLT32	.init.text+0x16e9c
03ff      3ff:	e9 00 00 00 00       	jmp    404 <.altinstr_replacement+0x404>	400: R_X86_64_PLT32	.init.text+0x17035
0404      404:	e9 00 00 00 00       	jmp    409 <.altinstr_replacement+0x409>	405: R_X86_64_PLT32	.init.text+0x16f7d
0409      409:	e9 00 00 00 00       	jmp    40e <.altinstr_replacement+0x40e>	40a: R_X86_64_PLT32	.init.text+0x1705b
040e      40e:	e9 00 00 00 00       	jmp    413 <.altinstr_replacement+0x413>	40f: R_X86_64_PLT32	.init.text+0x1beaa
0413      413:	e9 00 00 00 00       	jmp    418 <.altinstr_replacement+0x418>	414: R_X86_64_PLT32	.init.text+0x1beeb
0418      418:	e9 00 00 00 00       	jmp    41d <.altinstr_replacement+0x41d>	419: R_X86_64_PLT32	.text+0x77da9
041d      41d:	e9 00 00 00 00       	jmp    422 <.altinstr_replacement+0x422>	41e: R_X86_64_PLT32	.text+0x77ef8
0422      422:	e9 00 00 00 00       	jmp    427 <.altinstr_replacement+0x427>	423: R_X86_64_PLT32	.text+0x785a0
0427      427:	e9 00 00 00 00       	jmp    42c <.altinstr_replacement+0x42c>	428: R_X86_64_PLT32	.text+0x78efd
042c      42c:	e9 00 00 00 00       	jmp    431 <.altinstr_replacement+0x431>	42d: R_X86_64_PLT32	.text+0x7869e
0431      431:	e9 00 00 00 00       	jmp    436 <.altinstr_replacement+0x436>	432: R_X86_64_PLT32	.text+0x79020
0436      436:	e9 00 00 00 00       	jmp    43b <.altinstr_replacement+0x43b>	437: R_X86_64_PLT32	.text+0x7834e
043b      43b:	e9 00 00 00 00       	jmp    440 <.altinstr_replacement+0x440>	43c: R_X86_64_PLT32	.text+0x79b90
0440      440:	e9 00 00 00 00       	jmp    445 <.altinstr_replacement+0x445>	441: R_X86_64_PLT32	.text+0x79bb9
0445      445:	e9 00 00 00 00       	jmp    44a <.altinstr_replacement+0x44a>	446: R_X86_64_PLT32	.text+0x79fbd
044a      44a:	e9 00 00 00 00       	jmp    44f <.altinstr_replacement+0x44f>	44b: R_X86_64_PLT32	.text+0x7adce
044f      44f:	e9 00 00 00 00       	jmp    454 <.altinstr_replacement+0x454>	450: R_X86_64_PLT32	.ref.text+0x629
0454      454:	e9 00 00 00 00       	jmp    459 <.altinstr_replacement+0x459>	455: R_X86_64_PLT32	.ref.text+0x7eb
0459      459:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0463      463:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
046d      46d:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0477      477:	0f ae e8             	lfence 
047a      47a:	0f 31                	rdtsc  
047c      47c:	0f 01 f9             	rdtscp 
047f      47f:	e9 00 00 00 00       	jmp    484 <.altinstr_replacement+0x484>	480: R_X86_64_PLT32	.ref.text+0xa99
0484      484:	e9 00 00 00 00       	jmp    489 <.altinstr_replacement+0x489>	485: R_X86_64_PLT32	.text+0x815ef
0489      489:	e9 00 00 00 00       	jmp    48e <.altinstr_replacement+0x48e>	48a: R_X86_64_PLT32	.text+0x81687
048e      48e:	e9 00 00 00 00       	jmp    493 <.altinstr_replacement+0x493>	48f: R_X86_64_PLT32	.text+0x8168e
0493      493:	e9 00 00 00 00       	jmp    498 <.altinstr_replacement+0x498>	494: R_X86_64_PLT32	.text+0x815a9
0498      498:	e9 00 00 00 00       	jmp    49d <.altinstr_replacement+0x49d>	499: R_X86_64_PLT32	.text+0x8211d
049d      49d:	e9 00 00 00 00       	jmp    4a2 <.altinstr_replacement+0x4a2>	49e: R_X86_64_PLT32	.text+0x82199
04a2      4a2:	e9 00 00 00 00       	jmp    4a7 <.altinstr_replacement+0x4a7>	4a3: R_X86_64_PLT32	.text+0x8226e
04a7      4a7:	e9 00 00 00 00       	jmp    4ac <.altinstr_replacement+0x4ac>	4a8: R_X86_64_PLT32	.text+0x82293
04ac      4ac:	e9 00 00 00 00       	jmp    4b1 <.altinstr_replacement+0x4b1>	4ad: R_X86_64_PLT32	.text+0x82275
04b1      4b1:	e9 00 00 00 00       	jmp    4b6 <.altinstr_replacement+0x4b6>	4b2: R_X86_64_PLT32	.text+0x820c2
04b6      4b6:	e9 00 00 00 00       	jmp    4bb <.altinstr_replacement+0x4bb>	4b7: R_X86_64_PLT32	.text+0x8229a
04bb      4bb:	e9 00 00 00 00       	jmp    4c0 <.altinstr_replacement+0x4c0>	4bc: R_X86_64_PLT32	.text+0x820c2
04c0      4c0:	e9 00 00 00 00       	jmp    4c5 <.altinstr_replacement+0x4c5>	4c1: R_X86_64_PLT32	.text+0x83d31
04c5      4c5:	48 0f ae 37          	xsaveopt64 (%rdi)
04c9      4c9:	48 0f c7 27          	xsavec64 (%rdi)
04cd      4cd:	48 0f c7 2f          	xsaves64 (%rdi)
04d1      4d1:	e9 00 00 00 00       	jmp    4d6 <.altinstr_replacement+0x4d6>	4d2: R_X86_64_PLT32	.text+0x83e61
04d6      4d6:	e9 00 00 00 00       	jmp    4db <.altinstr_replacement+0x4db>	4d7: R_X86_64_PLT32	.text+0x83e75
04db      4db:	48 0f c7 1f          	xrstors64 (%rdi)
04df      4df:	e9 00 00 00 00       	jmp    4e4 <.altinstr_replacement+0x4e4>	4e0: R_X86_64_PLT32	.text+0x84175
04e4      4e4:	48 0f ae 37          	xsaveopt64 (%rdi)
04e8      4e8:	48 0f c7 27          	xsavec64 (%rdi)
04ec      4ec:	48 0f c7 2f          	xsaves64 (%rdi)
04f0      4f0:	e9 00 00 00 00       	jmp    4f5 <.altinstr_replacement+0x4f5>	4f1: R_X86_64_PLT32	.text+0x844ef
04f5      4f5:	48 0f ae 37          	xsaveopt64 (%rdi)
04f9      4f9:	48 0f c7 27          	xsavec64 (%rdi)
04fd      4fd:	48 0f c7 2f          	xsaves64 (%rdi)
0501      501:	e9 00 00 00 00       	jmp    506 <.altinstr_replacement+0x506>	502: R_X86_64_PLT32	.text+0x845c4
0506      506:	e9 00 00 00 00       	jmp    50b <.altinstr_replacement+0x50b>	507: R_X86_64_PLT32	.text+0x84d3b
050b      50b:	e9 00 00 00 00       	jmp    510 <.altinstr_replacement+0x510>	50c: R_X86_64_PLT32	.text+0x84d5e
0510      510:	48 0f ae 37          	xsaveopt64 (%rdi)
0514      514:	48 0f c7 27          	xsavec64 (%rdi)
0518      518:	48 0f c7 2f          	xsaves64 (%rdi)
051c      51c:	e9 00 00 00 00       	jmp    521 <.altinstr_replacement+0x521>	51d: R_X86_64_PLT32	.text+0x84bea
0521      521:	48 0f c7 1f          	xrstors64 (%rdi)
0525      525:	e9 00 00 00 00       	jmp    52a <.altinstr_replacement+0x52a>	526: R_X86_64_PLT32	.text+0x854a2
052a      52a:	48 0f c7 1f          	xrstors64 (%rdi)
052e      52e:	e9 00 00 00 00       	jmp    533 <.altinstr_replacement+0x533>	52f: R_X86_64_PLT32	.text+0x85804
0533      533:	e9 00 00 00 00       	jmp    538 <.altinstr_replacement+0x538>	534: R_X86_64_PLT32	.text+0x85d2f
0538      538:	e9 00 00 00 00       	jmp    53d <.altinstr_replacement+0x53d>	539: R_X86_64_PLT32	.text+0x85ff5
053d      53d:	e8 00 00 00 00       	call   542 <.altinstr_replacement+0x542>	53e: R_X86_64_PLT32	copy_user_generic_string-0x4
0542      542:	e8 00 00 00 00       	call   547 <.altinstr_replacement+0x547>	543: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0547      547:	e9 00 00 00 00       	jmp    54c <.altinstr_replacement+0x54c>	548: R_X86_64_PLT32	.text+0x860c6
054c      54c:	e9 00 00 00 00       	jmp    551 <.altinstr_replacement+0x551>	54d: R_X86_64_PLT32	.text+0x861a8
0551      551:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
055b      55b:	e9 00 00 00 00       	jmp    560 <.altinstr_replacement+0x560>	55c: R_X86_64_PLT32	.text+0x86431
0560      560:	e9 00 00 00 00       	jmp    565 <.altinstr_replacement+0x565>	561: R_X86_64_PLT32	.text+0x867e2
0565      565:	0f 01 cb             	stac   
0568      568:	0f 01 ca             	clac   
056b      56b:	0f 01 cb             	stac   
056e      56e:	0f 01 ca             	clac   
0571      571:	e8 00 00 00 00       	call   576 <.altinstr_replacement+0x576>	572: R_X86_64_PLT32	copy_user_generic_string-0x4
0576      576:	e8 00 00 00 00       	call   57b <.altinstr_replacement+0x57b>	577: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
057b      57b:	e9 00 00 00 00       	jmp    580 <.altinstr_replacement+0x580>	57c: R_X86_64_PLT32	.text+0x86a50
0580      580:	e9 00 00 00 00       	jmp    585 <.altinstr_replacement+0x585>	581: R_X86_64_PLT32	.text+0x86bc3
0585      585:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
058f      58f:	e9 00 00 00 00       	jmp    594 <.altinstr_replacement+0x594>	590: R_X86_64_PLT32	.text+0x8741b
0594      594:	e8 00 00 00 00       	call   599 <.altinstr_replacement+0x599>	595: R_X86_64_PLT32	copy_user_generic_string-0x4
0599      599:	e8 00 00 00 00       	call   59e <.altinstr_replacement+0x59e>	59a: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
059e      59e:	e9 00 00 00 00       	jmp    5a3 <.altinstr_replacement+0x5a3>	59f: R_X86_64_PLT32	.text+0x871a7
05a3      5a3:	0f 01 cb             	stac   
05a6      5a6:	0f 01 ca             	clac   
05a9      5a9:	0f 01 cb             	stac   
05ac      5ac:	0f 01 ca             	clac   
05af      5af:	48 0f c7 1f          	xrstors64 (%rdi)
05b3      5b3:	0f 01 cb             	stac   
05b6      5b6:	0f 01 ca             	clac   
05b9      5b9:	48 0f c7 1f          	xrstors64 (%rdi)
05bd      5bd:	e9 00 00 00 00       	jmp    5c2 <.altinstr_replacement+0x5c2>	5be: R_X86_64_PLT32	.text+0x875b8
05c2      5c2:	e9 00 00 00 00       	jmp    5c7 <.altinstr_replacement+0x5c7>	5c3: R_X86_64_PLT32	.init.text+0x1fe9c
05c7      5c7:	e9 00 00 00 00       	jmp    5cc <.altinstr_replacement+0x5cc>	5c8: R_X86_64_PLT32	.text+0x878de
05cc      5cc:	e9 00 00 00 00       	jmp    5d1 <.altinstr_replacement+0x5d1>	5cd: R_X86_64_PLT32	.text+0x87971
05d1      5d1:	e9 00 00 00 00       	jmp    5d6 <.altinstr_replacement+0x5d6>	5d2: R_X86_64_PLT32	.init.text+0x20389
05d6      5d6:	e9 00 00 00 00       	jmp    5db <.altinstr_replacement+0x5db>	5d7: R_X86_64_PLT32	.init.text+0x200a9
05db      5db:	e9 00 00 00 00       	jmp    5e0 <.altinstr_replacement+0x5e0>	5dc: R_X86_64_PLT32	.init.text+0x203b3
05e0      5e0:	e9 00 00 00 00       	jmp    5e5 <.altinstr_replacement+0x5e5>	5e1: R_X86_64_PLT32	.init.text+0x201c0
05e5      5e5:	e9 00 00 00 00       	jmp    5ea <.altinstr_replacement+0x5ea>	5e6: R_X86_64_PLT32	.init.text+0x20a7b
05ea      5ea:	e9 00 00 00 00       	jmp    5ef <.altinstr_replacement+0x5ef>	5eb: R_X86_64_PLT32	.init.text+0x20b47
05ef      5ef:	e9 00 00 00 00       	jmp    5f4 <.altinstr_replacement+0x5f4>	5f0: R_X86_64_PLT32	.text+0x87ab3
05f4      5f4:	e9 00 00 00 00       	jmp    5f9 <.altinstr_replacement+0x5f9>	5f5: R_X86_64_PLT32	.text+0x87b06
05f9      5f9:	e9 00 00 00 00       	jmp    5fe <.altinstr_replacement+0x5fe>	5fa: R_X86_64_PLT32	.text+0x87af8
05fe      5fe:	e9 00 00 00 00       	jmp    603 <.altinstr_replacement+0x603>	5ff: R_X86_64_PLT32	.text+0x87e20
0603      603:	e9 00 00 00 00       	jmp    608 <.altinstr_replacement+0x608>	604: R_X86_64_PLT32	.text+0x88e74
0608      608:	e9 00 00 00 00       	jmp    60d <.altinstr_replacement+0x60d>	609: R_X86_64_PLT32	.text+0x88de3
060d      60d:	e9 00 00 00 00       	jmp    612 <.altinstr_replacement+0x612>	60e: R_X86_64_PLT32	.text+0x88f44
0612      612:	e9 00 00 00 00       	jmp    617 <.altinstr_replacement+0x617>	613: R_X86_64_PLT32	.text+0x88eb3
0617      617:	e9 00 00 00 00       	jmp    61c <.altinstr_replacement+0x61c>	618: R_X86_64_PLT32	.text+0x895c7
061c      61c:	e9 00 00 00 00       	jmp    621 <.altinstr_replacement+0x621>	61d: R_X86_64_PLT32	.text+0x89708
0621      621:	e9 00 00 00 00       	jmp    626 <.altinstr_replacement+0x626>	622: R_X86_64_PLT32	.text+0x8a410
0626      626:	e9 00 00 00 00       	jmp    62b <.altinstr_replacement+0x62b>	627: R_X86_64_PLT32	.text+0x8a4f5
062b      62b:	e9 00 00 00 00       	jmp    630 <.altinstr_replacement+0x630>	62c: R_X86_64_PLT32	.init.text+0x21049
0630      630:	e9 00 00 00 00       	jmp    635 <.altinstr_replacement+0x635>	631: R_X86_64_PLT32	.init.text+0x213bb
0635      635:	e9 00 00 00 00       	jmp    63a <.altinstr_replacement+0x63a>	636: R_X86_64_PLT32	.init.text+0x213c3
063a      63a:	e9 00 00 00 00       	jmp    63f <.altinstr_replacement+0x63f>	63b: R_X86_64_PLT32	.text+0x8a64e
063f      63f:	e9 00 00 00 00       	jmp    644 <.altinstr_replacement+0x644>	640: R_X86_64_PLT32	.init.text+0x21e3c
0644      644:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
064e      64e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0658      658:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0662      662:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
066c      66c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0676      676:	e9 00 00 00 00       	jmp    67b <.altinstr_replacement+0x67b>	677: R_X86_64_PLT32	.text+0x91a6e
067b      67b:	e9 00 00 00 00       	jmp    680 <.altinstr_replacement+0x680>	67c: R_X86_64_PLT32	.text+0x93dfd
0680      680:	e9 00 00 00 00       	jmp    685 <.altinstr_replacement+0x685>	681: R_X86_64_PLT32	.text+0x9811c
0685      685:	e9 00 00 00 00       	jmp    68a <.altinstr_replacement+0x68a>	686: R_X86_64_PLT32	.text+0x981c9
068a      68a:	e9 00 00 00 00       	jmp    68f <.altinstr_replacement+0x68f>	68b: R_X86_64_PLT32	.text+0x981fd
068f      68f:	e9 00 00 00 00       	jmp    694 <.altinstr_replacement+0x694>	690: R_X86_64_PLT32	.text+0x98204
0694      694:	e9 00 00 00 00       	jmp    699 <.altinstr_replacement+0x699>	695: R_X86_64_PLT32	.text+0x981e0
0699      699:	e9 00 00 00 00       	jmp    69e <.altinstr_replacement+0x69e>	69a: R_X86_64_PLT32	.init.text+0x25a05
069e      69e:	e9 00 00 00 00       	jmp    6a3 <.altinstr_replacement+0x6a3>	69f: R_X86_64_PLT32	.init.text+0x25a0c
06a3      6a3:	e9 00 00 00 00       	jmp    6a8 <.altinstr_replacement+0x6a8>	6a4: R_X86_64_PLT32	.text+0x99ffc
06a8      6a8:	e9 00 00 00 00       	jmp    6ad <.altinstr_replacement+0x6ad>	6a9: R_X86_64_PLT32	.text+0x9a1f5
06ad      6ad:	e9 00 00 00 00       	jmp    6b2 <.altinstr_replacement+0x6b2>	6ae: R_X86_64_PLT32	.init.text+0x25bcd
06b2      6b2:	e9 00 00 00 00       	jmp    6b7 <.altinstr_replacement+0x6b7>	6b3: R_X86_64_PLT32	.text+0x9a2fd
06b7      6b7:	e9 00 00 00 00       	jmp    6bc <.altinstr_replacement+0x6bc>	6b8: R_X86_64_PLT32	.text+0x9c155
06bc      6bc:	e9 00 00 00 00       	jmp    6c1 <.altinstr_replacement+0x6c1>	6bd: R_X86_64_PLT32	.text+0xa0508
06c1      6c1:	e9 00 00 00 00       	jmp    6c6 <.altinstr_replacement+0x6c6>	6c2: R_X86_64_PLT32	.text+0xa66bb
06c6      6c6:	e9 00 00 00 00       	jmp    6cb <.altinstr_replacement+0x6cb>	6c7: R_X86_64_PLT32	.noinstr.text+0x2e95
06cb      6cb:	e9 00 00 00 00       	jmp    6d0 <.altinstr_replacement+0x6d0>	6cc: R_X86_64_PLT32	.noinstr.text+0x2f52
06d0      6d0:	e9 00 00 00 00       	jmp    6d5 <.altinstr_replacement+0x6d5>	6d1: R_X86_64_PLT32	.init.text+0x26cd2
06d5      6d5:	e9 00 00 00 00       	jmp    6da <.altinstr_replacement+0x6da>	6d6: R_X86_64_PLT32	.text+0xadbae
06da      6da:	e9 00 00 00 00       	jmp    6df <.altinstr_replacement+0x6df>	6db: R_X86_64_PLT32	.text+0xadd07
06df      6df:	0f ae e8             	lfence 
06e2      6e2:	0f 31                	rdtsc  
06e4      6e4:	0f 01 f9             	rdtscp 
06e7      6e7:	e9 00 00 00 00       	jmp    6ec <.altinstr_replacement+0x6ec>	6e8: R_X86_64_PLT32	.text+0xb454f
06ec      6ec:	e9 00 00 00 00       	jmp    6f1 <.altinstr_replacement+0x6f1>	6ed: R_X86_64_PLT32	.text+0xb45a5
06f1      6f1:	0f 01 c1             	vmcall 
06f4      6f4:	0f 01 d9             	vmmcall 
06f7      6f7:	0f 01 c1             	vmcall 
06fa      6fa:	0f 01 d9             	vmmcall 
06fd      6fd:	0f 01 c1             	vmcall 
0700      700:	0f 01 d9             	vmmcall 
0703      703:	e9 00 00 00 00       	jmp    708 <.altinstr_replacement+0x708>	704: R_X86_64_PLT32	.cpuidle.text+0x36e
0708      708:	e9 00 00 00 00       	jmp    70d <.altinstr_replacement+0x70d>	709: R_X86_64_PLT32	.cpuidle.text+0x206
070d      70d:	e9 00 00 00 00       	jmp    712 <.altinstr_replacement+0x712>	70e: R_X86_64_PLT32	.init.text+0x306eb
0712      712:	87 2c 25 00 d3 5f ff 	xchg   %ebp,0xffffffffff5fd300
0719      719:	44 87 3c 25 10 d3 5f ff 	xchg   %r15d,0xffffffffff5fd310
0721      721:	87 1c 25 00 d3 5f ff 	xchg   %ebx,0xffffffffff5fd300
0728      728:	87 2c 25 10 d3 5f ff 	xchg   %ebp,0xffffffffff5fd310
072f      72f:	44 87 24 25 00 d3 5f ff 	xchg   %r12d,0xffffffffff5fd300
0737      737:	87 2c 25 10 d3 5f ff 	xchg   %ebp,0xffffffffff5fd310
073e      73e:	44 87 24 25 00 d3 5f ff 	xchg   %r12d,0xffffffffff5fd300
0746      746:	87 1c 25 00 d3 5f ff 	xchg   %ebx,0xffffffffff5fd300
074d      74d:	87 1c 25 00 d3 5f ff 	xchg   %ebx,0xffffffffff5fd300
0754      754:	87 1c 25 00 d3 5f ff 	xchg   %ebx,0xffffffffff5fd300
075b      75b:	87 b0 00 d0 5f ff    	xchg   %esi,-0xa03000(%rax)
0761      761:	e9 00 00 00 00       	jmp    766 <.altinstr_replacement+0x766>	762: R_X86_64_PLT32	.text+0xd026f
0766      766:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	76a: R_X86_64_32S	pcpu_hot+0x10
076f      76f:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	773: R_X86_64_32S	pcpu_hot+0x10
0778      778:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	77c: R_X86_64_32S	pcpu_hot+0x10
0781      781:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	785: R_X86_64_32S	pcpu_hot+0x10
078a      78a:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	78e: R_X86_64_32S	pcpu_hot+0x10
0793      793:	c3                   	ret    
0794      794:	cc                   	int3   
0795      795:	0f ae e8             	lfence 
0798      798:	0f 31                	rdtsc  
079a      79a:	0f 01 f9             	rdtscp 
079d      79d:	e9 00 00 00 00       	jmp    7a2 <.altinstr_replacement+0x7a2>	79e: R_X86_64_PLT32	.text+0xd11d2
07a2      7a2:	e8 00 00 00 00       	call   7a7 <.altinstr_replacement+0x7a7>	7a3: R_X86_64_PLT32	clear_page_rep-0x4
07a7      7a7:	e8 00 00 00 00       	call   7ac <.altinstr_replacement+0x7ac>	7a8: R_X86_64_PLT32	clear_page_erms-0x4
07ac      7ac:	e9 00 00 00 00       	jmp    7b1 <.altinstr_replacement+0x7b1>	7ad: R_X86_64_PLT32	.text+0xd190b
07b1      7b1:	e9 00 00 00 00       	jmp    7b6 <.altinstr_replacement+0x7b6>	7b2: R_X86_64_PLT32	.text+0xd18c7
07b6      7b6:	e9 00 00 00 00       	jmp    7bb <.altinstr_replacement+0x7bb>	7b7: R_X86_64_PLT32	.text+0xd1998
07bb      7bb:	e9 00 00 00 00       	jmp    7c0 <.altinstr_replacement+0x7c0>	7bc: R_X86_64_PLT32	.text+0xd20fd
07c0      7c0:	e9 00 00 00 00       	jmp    7c5 <.altinstr_replacement+0x7c5>	7c1: R_X86_64_PLT32	.text+0xd212f
07c5      7c5:	e8 00 00 00 00       	call   7ca <.altinstr_replacement+0x7ca>	7c6: R_X86_64_PLT32	clear_page_rep-0x4
07ca      7ca:	e8 00 00 00 00       	call   7cf <.altinstr_replacement+0x7cf>	7cb: R_X86_64_PLT32	clear_page_erms-0x4
07cf      7cf:	e9 00 00 00 00       	jmp    7d4 <.altinstr_replacement+0x7d4>	7d0: R_X86_64_PLT32	.init.text+0x3caf7
07d4      7d4:	0f ae e8             	lfence 
07d7      7d7:	0f 31                	rdtsc  
07d9      7d9:	0f 01 f9             	rdtscp 
07dc      7dc:	e9 00 00 00 00       	jmp    7e1 <.altinstr_replacement+0x7e1>	7dd: R_X86_64_PLT32	.init.text+0x3f133
07e1      7e1:	e8 00 00 00 00       	call   7e6 <.altinstr_replacement+0x7e6>	7e2: R_X86_64_PLT32	clear_page_rep-0x4
07e6      7e6:	e8 00 00 00 00       	call   7eb <.altinstr_replacement+0x7eb>	7e7: R_X86_64_PLT32	clear_page_erms-0x4
07eb      7eb:	e9 00 00 00 00       	jmp    7f0 <.altinstr_replacement+0x7f0>	7ec: R_X86_64_PLT32	.init.text+0x3fa49
07f0      7f0:	e9 00 00 00 00       	jmp    7f5 <.altinstr_replacement+0x7f5>	7f1: R_X86_64_PLT32	.text+0xe01e8
07f5      7f5:	e9 00 00 00 00       	jmp    7fa <.altinstr_replacement+0x7fa>	7f6: R_X86_64_PLT32	.ref.text+0x124e
07fa      7fa:	e9 00 00 00 00       	jmp    7ff <.altinstr_replacement+0x7ff>	7fb: R_X86_64_PLT32	.text+0xe0702
07ff      7ff:	e9 00 00 00 00       	jmp    804 <.altinstr_replacement+0x804>	800: R_X86_64_PLT32	.text+0xe08d2
0804      804:	e9 00 00 00 00       	jmp    809 <.altinstr_replacement+0x809>	805: R_X86_64_PLT32	.text+0xe074b
0809      809:	e9 00 00 00 00       	jmp    80e <.altinstr_replacement+0x80e>	80a: R_X86_64_PLT32	.text+0xe07d0
080e      80e:	e9 00 00 00 00       	jmp    813 <.altinstr_replacement+0x813>	80f: R_X86_64_PLT32	.text+0xe09ab
0813      813:	e9 00 00 00 00       	jmp    818 <.altinstr_replacement+0x818>	814: R_X86_64_PLT32	.text+0xe0dc4
0818      818:	e9 00 00 00 00       	jmp    81d <.altinstr_replacement+0x81d>	819: R_X86_64_PLT32	.text+0xe0dec
081d      81d:	e9 00 00 00 00       	jmp    822 <.altinstr_replacement+0x822>	81e: R_X86_64_PLT32	.text+0xe1102
0822      822:	e9 00 00 00 00       	jmp    827 <.altinstr_replacement+0x827>	823: R_X86_64_PLT32	.text+0xe1132
0827      827:	e9 00 00 00 00       	jmp    82c <.altinstr_replacement+0x82c>	828: R_X86_64_PLT32	.text+0xe1671
082c      82c:	e9 00 00 00 00       	jmp    831 <.altinstr_replacement+0x831>	82d: R_X86_64_PLT32	.text+0xe16bb
0831      831:	e9 00 00 00 00       	jmp    836 <.altinstr_replacement+0x836>	832: R_X86_64_PLT32	.init.text+0x40a8b
0836      836:	e9 00 00 00 00       	jmp    83b <.altinstr_replacement+0x83b>	837: R_X86_64_PLT32	.init.text+0x40a2b
083b      83b:	e9 00 00 00 00       	jmp    840 <.altinstr_replacement+0x840>	83c: R_X86_64_PLT32	.init.text+0x409e6
0840      840:	e9 00 00 00 00       	jmp    845 <.altinstr_replacement+0x845>	841: R_X86_64_PLT32	.init.text+0x40a82
0845      845:	e9 00 00 00 00       	jmp    84a <.altinstr_replacement+0x84a>	846: R_X86_64_PLT32	.init.text+0x40b08
084a      84a:	e9 00 00 00 00       	jmp    84f <.altinstr_replacement+0x84f>	84b: R_X86_64_PLT32	.init.text+0x40d1b
084f      84f:	e9 00 00 00 00       	jmp    854 <.altinstr_replacement+0x854>	850: R_X86_64_PLT32	.init.text+0x41208
0854      854:	e9 00 00 00 00       	jmp    859 <.altinstr_replacement+0x859>	855: R_X86_64_PLT32	.init.text+0x411d9
0859      859:	e9 00 00 00 00       	jmp    85e <.altinstr_replacement+0x85e>	85a: R_X86_64_PLT32	.init.text+0x4128a
085e      85e:	e9 00 00 00 00       	jmp    863 <.altinstr_replacement+0x863>	85f: R_X86_64_PLT32	.init.text+0x415ef
0863      863:	e9 00 00 00 00       	jmp    868 <.altinstr_replacement+0x868>	864: R_X86_64_PLT32	.init.text+0x4161a
0868      868:	e9 00 00 00 00       	jmp    86d <.altinstr_replacement+0x86d>	869: R_X86_64_PLT32	.meminit.text+0xca2
086d      86d:	e9 00 00 00 00       	jmp    872 <.altinstr_replacement+0x872>	86e: R_X86_64_PLT32	.meminit.text+0xbb6
0872      872:	e9 00 00 00 00       	jmp    877 <.altinstr_replacement+0x877>	873: R_X86_64_PLT32	.meminit.text+0x985
0877      877:	e9 00 00 00 00       	jmp    87c <.altinstr_replacement+0x87c>	878: R_X86_64_PLT32	.meminit.text+0xbb6
087c      87c:	e9 00 00 00 00       	jmp    881 <.altinstr_replacement+0x881>	87d: R_X86_64_PLT32	.meminit.text+0xa15
0881      881:	e9 00 00 00 00       	jmp    886 <.altinstr_replacement+0x886>	882: R_X86_64_PLT32	.meminit.text+0xb6f
0886      886:	e9 00 00 00 00       	jmp    88b <.altinstr_replacement+0x88b>	887: R_X86_64_PLT32	.meminit.text+0xd2d
088b      88b:	e9 00 00 00 00       	jmp    890 <.altinstr_replacement+0x890>	88c: R_X86_64_PLT32	.meminit.text+0xf54
0890      890:	e9 00 00 00 00       	jmp    895 <.altinstr_replacement+0x895>	891: R_X86_64_PLT32	.meminit.text+0xf9f
0895      895:	e9 00 00 00 00       	jmp    89a <.altinstr_replacement+0x89a>	896: R_X86_64_PLT32	.init.text+0x41a15
089a      89a:	e9 00 00 00 00       	jmp    89f <.altinstr_replacement+0x89f>	89b: R_X86_64_PLT32	.init.text+0x41c4b
089f      89f:	e9 00 00 00 00       	jmp    8a4 <.altinstr_replacement+0x8a4>	8a0: R_X86_64_PLT32	.init.text+0x41b31
08a4      8a4:	e9 00 00 00 00       	jmp    8a9 <.altinstr_replacement+0x8a9>	8a5: R_X86_64_PLT32	.init.text+0x41c62
08a9      8a9:	e9 00 00 00 00       	jmp    8ae <.altinstr_replacement+0x8ae>	8aa: R_X86_64_PLT32	.text+0xe1bed
08ae      8ae:	e9 00 00 00 00       	jmp    8b3 <.altinstr_replacement+0x8b3>	8af: R_X86_64_PLT32	.text+0xe1c91
08b3      8b3:	e9 00 00 00 00       	jmp    8b8 <.altinstr_replacement+0x8b8>	8b4: R_X86_64_PLT32	.text+0xe1d08
08b8      8b8:	e9 00 00 00 00       	jmp    8bd <.altinstr_replacement+0x8bd>	8b9: R_X86_64_PLT32	.text+0xe201c
08bd      8bd:	e9 00 00 00 00       	jmp    8c2 <.altinstr_replacement+0x8c2>	8be: R_X86_64_PLT32	.text+0xe2037
08c2      8c2:	e9 00 00 00 00       	jmp    8c7 <.altinstr_replacement+0x8c7>	8c3: R_X86_64_PLT32	.text+0xe20af
08c7      8c7:	e9 00 00 00 00       	jmp    8cc <.altinstr_replacement+0x8cc>	8c8: R_X86_64_PLT32	.text+0xe20ce
08cc      8cc:	e9 00 00 00 00       	jmp    8d1 <.altinstr_replacement+0x8d1>	8cd: R_X86_64_PLT32	.text+0xe28a6
08d1      8d1:	e9 00 00 00 00       	jmp    8d6 <.altinstr_replacement+0x8d6>	8d2: R_X86_64_PLT32	.text+0xe248c
08d6      8d6:	e9 00 00 00 00       	jmp    8db <.altinstr_replacement+0x8db>	8d7: R_X86_64_PLT32	.text+0xe25b7
08db      8db:	e9 00 00 00 00       	jmp    8e0 <.altinstr_replacement+0x8e0>	8dc: R_X86_64_PLT32	.text+0xe25e4
08e0      8e0:	e9 00 00 00 00       	jmp    8e5 <.altinstr_replacement+0x8e5>	8e1: R_X86_64_PLT32	.text+0xe26ef
08e5      8e5:	e9 00 00 00 00       	jmp    8ea <.altinstr_replacement+0x8ea>	8e6: R_X86_64_PLT32	.text+0xe26aa
08ea      8ea:	e9 00 00 00 00       	jmp    8ef <.altinstr_replacement+0x8ef>	8eb: R_X86_64_PLT32	.text+0xe2f2e
08ef      8ef:	e9 00 00 00 00       	jmp    8f4 <.altinstr_replacement+0x8f4>	8f0: R_X86_64_PLT32	.text+0xe2a50
08f4      8f4:	e9 00 00 00 00       	jmp    8f9 <.altinstr_replacement+0x8f9>	8f5: R_X86_64_PLT32	.text+0xe2bce
08f9      8f9:	e9 00 00 00 00       	jmp    8fe <.altinstr_replacement+0x8fe>	8fa: R_X86_64_PLT32	.text+0xe2d97
08fe      8fe:	e9 00 00 00 00       	jmp    903 <.altinstr_replacement+0x903>	8ff: R_X86_64_PLT32	.text+0xe2dc5
0903      903:	e9 00 00 00 00       	jmp    908 <.altinstr_replacement+0x908>	904: R_X86_64_PLT32	.text+0xe30bc
0908      908:	e9 00 00 00 00       	jmp    90d <.altinstr_replacement+0x90d>	909: R_X86_64_PLT32	.text+0xe3185
090d      90d:	e9 00 00 00 00       	jmp    912 <.altinstr_replacement+0x912>	90e: R_X86_64_PLT32	.meminit.text+0x1b29
0912      912:	e9 00 00 00 00       	jmp    917 <.altinstr_replacement+0x917>	913: R_X86_64_PLT32	.meminit.text+0x1a37
0917      917:	e9 00 00 00 00       	jmp    91c <.altinstr_replacement+0x91c>	918: R_X86_64_PLT32	.meminit.text+0x1a9a
091c      91c:	e9 00 00 00 00       	jmp    921 <.altinstr_replacement+0x921>	91d: R_X86_64_PLT32	.meminit.text+0x1a62
0921      921:	e9 00 00 00 00       	jmp    926 <.altinstr_replacement+0x926>	922: R_X86_64_PLT32	.meminit.text+0x1ac5
0926      926:	e9 00 00 00 00       	jmp    92b <.altinstr_replacement+0x92b>	927: R_X86_64_PLT32	.text+0xe3d84
092b      92b:	e9 00 00 00 00       	jmp    930 <.altinstr_replacement+0x930>	92c: R_X86_64_PLT32	.text+0xe3de7
0930      930:	e9 00 00 00 00       	jmp    935 <.altinstr_replacement+0x935>	931: R_X86_64_PLT32	.text+0xe3dab
0935      935:	e9 00 00 00 00       	jmp    93a <.altinstr_replacement+0x93a>	936: R_X86_64_PLT32	.text+0xe3e0e
093a      93a:	e9 00 00 00 00       	jmp    93f <.altinstr_replacement+0x93f>	93b: R_X86_64_PLT32	.meminit.text+0x31a1
093f      93f:	e9 00 00 00 00       	jmp    944 <.altinstr_replacement+0x944>	940: R_X86_64_PLT32	.meminit.text+0x35f2
0944      944:	e9 00 00 00 00       	jmp    949 <.altinstr_replacement+0x949>	945: R_X86_64_PLT32	.meminit.text+0x3618
0949      949:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0953      953:	0f 0d 88 a8 00 00 00 	prefetchw 0xa8(%rax)
095a      95a:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
0964      964:	e9 00 00 00 00       	jmp    969 <.altinstr_replacement+0x969>	965: R_X86_64_PLT32	.noinstr.text+0x3b12
0969      969:	e9 00 00 00 00       	jmp    96e <.altinstr_replacement+0x96e>	96a: R_X86_64_PLT32	.text+0xe4754
096e      96e:	e9 00 00 00 00       	jmp    973 <.altinstr_replacement+0x973>	96f: R_X86_64_PLT32	.text+0xe47cc
0973      973:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
097d      97d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0987      987:	e9 00 00 00 00       	jmp    98c <.altinstr_replacement+0x98c>	988: R_X86_64_PLT32	.text+0xe642a
098c      98c:	e9 00 00 00 00       	jmp    991 <.altinstr_replacement+0x991>	98d: R_X86_64_PLT32	.text+0xe64a5
0991      991:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
099b      99b:	e9 00 00 00 00       	jmp    9a0 <.altinstr_replacement+0x9a0>	99c: R_X86_64_PLT32	.init.text+0x42103
09a0      9a0:	e9 00 00 00 00       	jmp    9a5 <.altinstr_replacement+0x9a5>	9a1: R_X86_64_PLT32	.text+0xe7775
09a5      9a5:	e9 00 00 00 00       	jmp    9aa <.altinstr_replacement+0x9aa>	9a6: R_X86_64_PLT32	.text+0xe7792
09aa      9aa:	e9 00 00 00 00       	jmp    9af <.altinstr_replacement+0x9af>	9ab: R_X86_64_PLT32	.text+0xe7cfa
09af      9af:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
09b9      9b9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
09c3      9c3:	e9 00 00 00 00       	jmp    9c8 <.altinstr_replacement+0x9c8>	9c4: R_X86_64_PLT32	.text+0xe95e8
09c8      9c8:	e9 00 00 00 00       	jmp    9cd <.altinstr_replacement+0x9cd>	9c9: R_X86_64_PLT32	.text+0xe9607
09cd      9cd:	e9 00 00 00 00       	jmp    9d2 <.altinstr_replacement+0x9d2>	9ce: R_X86_64_PLT32	.text+0xea005
09d2      9d2:	e9 00 00 00 00       	jmp    9d7 <.altinstr_replacement+0x9d7>	9d3: R_X86_64_PLT32	.text+0xea2b3
09d7      9d7:	e9 00 00 00 00       	jmp    9dc <.altinstr_replacement+0x9dc>	9d8: R_X86_64_PLT32	.text+0xeb80d
09dc      9dc:	e9 00 00 00 00       	jmp    9e1 <.altinstr_replacement+0x9e1>	9dd: R_X86_64_PLT32	.text+0xeb82b
09e1      9e1:	0f 30                	wrmsr  
09e3      9e3:	e9 00 00 00 00       	jmp    9e8 <.altinstr_replacement+0x9e8>	9e4: R_X86_64_PLT32	.text+0xec12c
09e8      9e8:	e9 00 00 00 00       	jmp    9ed <.altinstr_replacement+0x9ed>	9e9: R_X86_64_PLT32	.text+0xec568
09ed      9ed:	0f 30                	wrmsr  
09ef      9ef:	e9 00 00 00 00       	jmp    9f4 <.altinstr_replacement+0x9f4>	9f0: R_X86_64_PLT32	.text+0xec88d
09f4      9f4:	e9 00 00 00 00       	jmp    9f9 <.altinstr_replacement+0x9f9>	9f5: R_X86_64_PLT32	.text+0xedad1
09f9      9f9:	e9 00 00 00 00       	jmp    9fe <.altinstr_replacement+0x9fe>	9fa: R_X86_64_PLT32	.text+0xedc43
09fe      9fe:	e9 00 00 00 00       	jmp    a03 <.altinstr_replacement+0xa03>	9ff: R_X86_64_PLT32	.text+0xedd95
0a03      a03:	e9 00 00 00 00       	jmp    a08 <.altinstr_replacement+0xa08>	a04: R_X86_64_PLT32	.text+0xede6b
0a08      a08:	e9 00 00 00 00       	jmp    a0d <.altinstr_replacement+0xa0d>	a09: R_X86_64_PLT32	.text+0xede6b
0a0d      a0d:	e9 00 00 00 00       	jmp    a12 <.altinstr_replacement+0xa12>	a0e: R_X86_64_PLT32	.text+0xedec5
0a12      a12:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a1c      a1c:	66 0f ae 39          	clflushopt (%rcx)
0a20      a20:	66 0f ae 39          	clflushopt (%rcx)
0a24      a24:	e9 00 00 00 00       	jmp    a29 <.altinstr_replacement+0xa29>	a25: R_X86_64_PLT32	.text+0xeec32
0a29      a29:	e9 00 00 00 00       	jmp    a2e <.altinstr_replacement+0xa2e>	a2a: R_X86_64_PLT32	.text+0xeecad
0a2e      a2e:	e9 00 00 00 00       	jmp    a33 <.altinstr_replacement+0xa33>	a2f: R_X86_64_PLT32	.text+0xef11e
0a33      a33:	e9 00 00 00 00       	jmp    a38 <.altinstr_replacement+0xa38>	a34: R_X86_64_PLT32	.text+0xef19c
0a38      a38:	e9 00 00 00 00       	jmp    a3d <.altinstr_replacement+0xa3d>	a39: R_X86_64_PLT32	.text+0xf0057
0a3d      a3d:	66 0f ae 39          	clflushopt (%rcx)
0a41      a41:	e9 00 00 00 00       	jmp    a46 <.altinstr_replacement+0xa46>	a42: R_X86_64_PLT32	.text+0xf4080
0a46      a46:	e9 00 00 00 00       	jmp    a4b <.altinstr_replacement+0xa4b>	a47: R_X86_64_PLT32	.text+0xf404f
0a4b      a4b:	e9 00 00 00 00       	jmp    a50 <.altinstr_replacement+0xa50>	a4c: R_X86_64_PLT32	.text+0xf4106
0a50      a50:	e9 00 00 00 00       	jmp    a55 <.altinstr_replacement+0xa55>	a51: R_X86_64_PLT32	.text+0xf4d1e
0a55      a55:	e9 00 00 00 00       	jmp    a5a <.altinstr_replacement+0xa5a>	a56: R_X86_64_PLT32	.text+0xf4d45
0a5a      a5a:	e9 00 00 00 00       	jmp    a5f <.altinstr_replacement+0xa5f>	a5b: R_X86_64_PLT32	.init.text+0x4333a
0a5f      a5f:	e9 00 00 00 00       	jmp    a64 <.altinstr_replacement+0xa64>	a60: R_X86_64_PLT32	.init.text+0x436f7
0a64      a64:	e9 00 00 00 00       	jmp    a69 <.altinstr_replacement+0xa69>	a65: R_X86_64_PLT32	.init.text+0x4370a
0a69      a69:	e9 00 00 00 00       	jmp    a6e <.altinstr_replacement+0xa6e>	a6a: R_X86_64_PLT32	.init.text+0x437f9
0a6e      a6e:	e9 00 00 00 00       	jmp    a73 <.altinstr_replacement+0xa73>	a6f: R_X86_64_PLT32	.init.text+0x439bb
0a73      a73:	e9 00 00 00 00       	jmp    a78 <.altinstr_replacement+0xa78>	a74: R_X86_64_PLT32	.init.text+0x43bef
0a78      a78:	e9 00 00 00 00       	jmp    a7d <.altinstr_replacement+0xa7d>	a79: R_X86_64_PLT32	.init.text+0x43cca
0a7d      a7d:	e9 00 00 00 00       	jmp    a82 <.altinstr_replacement+0xa82>	a7e: R_X86_64_PLT32	.init.text+0x43ef0
0a82      a82:	e9 00 00 00 00       	jmp    a87 <.altinstr_replacement+0xa87>	a83: R_X86_64_PLT32	.init.text+0x44033
0a87      a87:	e9 00 00 00 00       	jmp    a8c <.altinstr_replacement+0xa8c>	a88: R_X86_64_PLT32	.init.text+0x4415e
0a8c      a8c:	e9 00 00 00 00       	jmp    a91 <.altinstr_replacement+0xa91>	a8d: R_X86_64_PLT32	.text+0xfc062
0a91      a91:	e9 00 00 00 00       	jmp    a96 <.altinstr_replacement+0xa96>	a92: R_X86_64_PLT32	.init.text+0x44e76
0a96      a96:	e9 00 00 00 00       	jmp    a9b <.altinstr_replacement+0xa9b>	a97: R_X86_64_PLT32	.text+0xfc62e
0a9b      a9b:	e9 00 00 00 00       	jmp    aa0 <.altinstr_replacement+0xaa0>	a9c: R_X86_64_PLT32	.text+0xfc5fd
0aa0      aa0:	e9 00 00 00 00       	jmp    aa5 <.altinstr_replacement+0xaa5>	aa1: R_X86_64_PLT32	.text+0xfc6a3
0aa5      aa5:	e9 00 00 00 00       	jmp    aaa <.altinstr_replacement+0xaaa>	aa6: R_X86_64_PLT32	.text+0xfcafc
0aaa      aaa:	e9 00 00 00 00       	jmp    aaf <.altinstr_replacement+0xaaf>	aab: R_X86_64_PLT32	.text+0xfcb81
0aaf      aaf:	e9 00 00 00 00       	jmp    ab4 <.altinstr_replacement+0xab4>	ab0: R_X86_64_PLT32	.text+0xfcd28
0ab4      ab4:	e9 00 00 00 00       	jmp    ab9 <.altinstr_replacement+0xab9>	ab5: R_X86_64_PLT32	.text+0xfcddb
0ab9      ab9:	e9 00 00 00 00       	jmp    abe <.altinstr_replacement+0xabe>	aba: R_X86_64_PLT32	__x86_indirect_thunk_rdi-0x4
0abe      abe:	0f ae e8             	lfence 
0ac1      ac1:	ff e7                	jmp    *%rdi
0ac3      ac3:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0acd      acd:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ad7      ad7:	0f 01 cb             	stac   
0ada      ada:	0f ae e8             	lfence 
0add      add:	0f 01 ca             	clac   
0ae0      ae0:	0f 01 ca             	clac   
0ae3      ae3:	e9 00 00 00 00       	jmp    ae8 <.altinstr_replacement+0xae8>	ae4: R_X86_64_PLT32	.text+0x1f728b
0ae8      ae8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0af2      af2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0afc      afc:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b06      b06:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
0b10      b10:	e9 00 00 00 00       	jmp    b15 <.altinstr_replacement+0xb15>	b11: R_X86_64_PLT32	.text+0x263d3b
0b15      b15:	e9 00 00 00 00       	jmp    b1a <.altinstr_replacement+0xb1a>	b16: R_X86_64_PLT32	.text+0x263d7b
0b1a      b1a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b24      b24:	e9 00 00 00 00       	jmp    b29 <.altinstr_replacement+0xb29>	b25: R_X86_64_PLT32	.text+0x294ffb
0b29      b29:	e9 00 00 00 00       	jmp    b2e <.altinstr_replacement+0xb2e>	b2a: R_X86_64_PLT32	.text+0x295008
0b2e      b2e:	e9 00 00 00 00       	jmp    b33 <.altinstr_replacement+0xb33>	b2f: R_X86_64_PLT32	.text+0x2c2a27
0b33      b33:	e9 00 00 00 00       	jmp    b38 <.altinstr_replacement+0xb38>	b34: R_X86_64_PLT32	.text+0x2c2a42
0b38      b38:	e9 00 00 00 00       	jmp    b3d <.altinstr_replacement+0xb3d>	b39: R_X86_64_PLT32	.text+0x2c34ab
0b3d      b3d:	e9 00 00 00 00       	jmp    b42 <.altinstr_replacement+0xb42>	b3e: R_X86_64_PLT32	.text+0x2c34c8
0b42      b42:	e8 00 00 00 00       	call   b47 <.altinstr_replacement+0xb47>	b43: R_X86_64_PLT32	clear_page_rep-0x4
0b47      b47:	e8 00 00 00 00       	call   b4c <.altinstr_replacement+0xb4c>	b48: R_X86_64_PLT32	clear_page_erms-0x4
0b4c      b4c:	e9 00 00 00 00       	jmp    b51 <.altinstr_replacement+0xb51>	b4d: R_X86_64_PLT32	.text+0x2c37dd
0b51      b51:	e9 00 00 00 00       	jmp    b56 <.altinstr_replacement+0xb56>	b52: R_X86_64_PLT32	.text+0x2c37fe
0b56      b56:	e8 00 00 00 00       	call   b5b <.altinstr_replacement+0xb5b>	b57: R_X86_64_PLT32	clear_page_rep-0x4
0b5b      b5b:	e8 00 00 00 00       	call   b60 <.altinstr_replacement+0xb60>	b5c: R_X86_64_PLT32	clear_page_erms-0x4
0b60      b60:	e9 00 00 00 00       	jmp    b65 <.altinstr_replacement+0xb65>	b61: R_X86_64_PLT32	.text+0x2c4cca
0b65      b65:	e9 00 00 00 00       	jmp    b6a <.altinstr_replacement+0xb6a>	b66: R_X86_64_PLT32	.text+0x2c4ce9
0b6a      b6a:	e9 00 00 00 00       	jmp    b6f <.altinstr_replacement+0xb6f>	b6b: R_X86_64_PLT32	.text+0x2c5b08
0b6f      b6f:	e9 00 00 00 00       	jmp    b74 <.altinstr_replacement+0xb74>	b70: R_X86_64_PLT32	.text+0x2c5b29
0b74      b74:	e8 00 00 00 00       	call   b79 <.altinstr_replacement+0xb79>	b75: R_X86_64_PLT32	clear_page_rep-0x4
0b79      b79:	e8 00 00 00 00       	call   b7e <.altinstr_replacement+0xb7e>	b7a: R_X86_64_PLT32	clear_page_erms-0x4
0b7e      b7e:	e8 00 00 00 00       	call   b83 <.altinstr_replacement+0xb83>	b7f: R_X86_64_PLT32	clear_page_rep-0x4
0b83      b83:	e8 00 00 00 00       	call   b88 <.altinstr_replacement+0xb88>	b84: R_X86_64_PLT32	clear_page_erms-0x4
0b88      b88:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0b92      b92:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0b9c      b9c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ba6      ba6:	e9 00 00 00 00       	jmp    bab <.altinstr_replacement+0xbab>	ba7: R_X86_64_PLT32	.text+0x319ca3
0bab      bab:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bb5      bb5:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bbf      bbf:	0f 01 cb             	stac   
0bc2      bc2:	0f ae e8             	lfence 
0bc5      bc5:	0f 01 ca             	clac   
0bc8      bc8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bd2      bd2:	0f 01 cb             	stac   
0bd5      bd5:	0f ae e8             	lfence 
0bd8      bd8:	0f 01 ca             	clac   
0bdb      bdb:	0f 01 ca             	clac   
0bde      bde:	0f 01 ca             	clac   
0be1      be1:	e9 00 00 00 00       	jmp    be6 <.altinstr_replacement+0xbe6>	be2: R_X86_64_PLT32	.init.text+0x4f984
0be6      be6:	e9 00 00 00 00       	jmp    beb <.altinstr_replacement+0xbeb>	be7: R_X86_64_PLT32	.init.text+0x4f9f7
0beb      beb:	e9 00 00 00 00       	jmp    bf0 <.altinstr_replacement+0xbf0>	bec: R_X86_64_PLT32	.text+0x3744d0
0bf0      bf0:	e9 00 00 00 00       	jmp    bf5 <.altinstr_replacement+0xbf5>	bf1: R_X86_64_PLT32	.text+0x37538d
0bf5      bf5:	e9 00 00 00 00       	jmp    bfa <.altinstr_replacement+0xbfa>	bf6: R_X86_64_PLT32	.text+0x375685
0bfa      bfa:	e8 00 00 00 00       	call   bff <.altinstr_replacement+0xbff>	bfb: R_X86_64_PLT32	clear_page_rep-0x4
0bff      bff:	e8 00 00 00 00       	call   c04 <.altinstr_replacement+0xc04>	c00: R_X86_64_PLT32	clear_page_erms-0x4
0c04      c04:	e8 00 00 00 00       	call   c09 <.altinstr_replacement+0xc09>	c05: R_X86_64_PLT32	clear_page_rep-0x4
0c09      c09:	e8 00 00 00 00       	call   c0e <.altinstr_replacement+0xc0e>	c0a: R_X86_64_PLT32	clear_page_erms-0x4
0c0e      c0e:	e9 00 00 00 00       	jmp    c13 <.altinstr_replacement+0xc13>	c0f: R_X86_64_PLT32	.text+0x378802
0c13      c13:	e8 00 00 00 00       	call   c18 <.altinstr_replacement+0xc18>	c14: R_X86_64_PLT32	copy_user_generic_string-0x4
0c18      c18:	e8 00 00 00 00       	call   c1d <.altinstr_replacement+0xc1d>	c19: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0c1d      c1d:	e8 00 00 00 00       	call   c22 <.altinstr_replacement+0xc22>	c1e: R_X86_64_PLT32	copy_user_generic_string-0x4
0c22      c22:	e8 00 00 00 00       	call   c27 <.altinstr_replacement+0xc27>	c23: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0c27      c27:	9c                   	pushf  
0c28      c28:	8f 44 24 08          	pop    0x8(%rsp)
0c2c      c2c:	0f 01 ca             	clac   
0c2f      c2f:	ff 74 24 50          	push   0x50(%rsp)
0c33      c33:	9d                   	popf   
0c34      c34:	0f ae e8             	lfence 
0c37      c37:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c3c      c3c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c46      c46:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c50      c50:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c55      c55:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c5f      c5f:	e9 00 00 00 00       	jmp    c64 <.altinstr_replacement+0xc64>	c60: R_X86_64_PLT32	.text+0x4759f4
0c64      c64:	e9 00 00 00 00       	jmp    c69 <.altinstr_replacement+0xc69>	c65: R_X86_64_PLT32	.text+0x47669c
0c69      c69:	e9 00 00 00 00       	jmp    c6e <.altinstr_replacement+0xc6e>	c6a: R_X86_64_PLT32	.text+0x47671f
0c6e      c6e:	e9 00 00 00 00       	jmp    c73 <.altinstr_replacement+0xc73>	c6f: R_X86_64_PLT32	.text+0x4ab4c7
0c73      c73:	e9 00 00 00 00       	jmp    c78 <.altinstr_replacement+0xc78>	c74: R_X86_64_PLT32	.text+0x4ab4ef
0c78      c78:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c82      c82:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c8c      c8c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c96      c96:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ca0      ca0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0caa      caa:	0f 01 cb             	stac   
0cad      cad:	0f ae e8             	lfence 
0cb0      cb0:	0f 01 ca             	clac   
0cb3      cb3:	0f 01 ca             	clac   
0cb6      cb6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0cc0      cc0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0cca      cca:	e8 00 00 00 00       	call   ccf <.altinstr_replacement+0xccf>	ccb: R_X86_64_PLT32	copy_user_generic_string-0x4
0ccf      ccf:	e8 00 00 00 00       	call   cd4 <.altinstr_replacement+0xcd4>	cd0: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0cd4      cd4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0cde      cde:	e8 00 00 00 00       	call   ce3 <.altinstr_replacement+0xce3>	cdf: R_X86_64_PLT32	copy_user_generic_string-0x4
0ce3      ce3:	e8 00 00 00 00       	call   ce8 <.altinstr_replacement+0xce8>	ce4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0ce8      ce8:	0f 0d 48 f8          	prefetchw -0x8(%rax)
0cec      cec:	e8 00 00 00 00       	call   cf1 <.altinstr_replacement+0xcf1>	ced: R_X86_64_PLT32	clear_page_rep-0x4
0cf1      cf1:	e8 00 00 00 00       	call   cf6 <.altinstr_replacement+0xcf6>	cf2: R_X86_64_PLT32	clear_page_erms-0x4
0cf6      cf6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d00      d00:	e8 00 00 00 00       	call   d05 <.altinstr_replacement+0xd05>	d01: R_X86_64_PLT32	clear_page_rep-0x4
0d05      d05:	e8 00 00 00 00       	call   d0a <.altinstr_replacement+0xd0a>	d06: R_X86_64_PLT32	clear_page_erms-0x4
0d0a      d0a:	e9 00 00 00 00       	jmp    d0f <.altinstr_replacement+0xd0f>	d0b: R_X86_64_PLT32	.text+0x51c7a7
0d0f      d0f:	e9 00 00 00 00       	jmp    d14 <.altinstr_replacement+0xd14>	d10: R_X86_64_PLT32	.init.text+0x57f1d
0d14      d14:	e9 00 00 00 00       	jmp    d19 <.altinstr_replacement+0xd19>	d15: R_X86_64_PLT32	.text+0x54195f
0d19      d19:	e9 00 00 00 00       	jmp    d1e <.altinstr_replacement+0xd1e>	d1a: R_X86_64_PLT32	.text+0x541a7e
0d1e      d1e:	e9 00 00 00 00       	jmp    d23 <.altinstr_replacement+0xd23>	d1f: R_X86_64_PLT32	.text+0x541b19
0d23      d23:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d2d      d2d:	e9 00 00 00 00       	jmp    d32 <.altinstr_replacement+0xd32>	d2e: R_X86_64_PLT32	.text+0x5434b4
0d32      d32:	e9 00 00 00 00       	jmp    d37 <.altinstr_replacement+0xd37>	d33: R_X86_64_PLT32	.text+0x543524
0d37      d37:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d41      d41:	0f 01 cb             	stac   
0d44      d44:	0f ae e8             	lfence 
0d47      d47:	0f 01 ca             	clac   
0d4a      d4a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d54      d54:	0f 01 cb             	stac   
0d57      d57:	0f ae e8             	lfence 
0d5a      d5a:	0f 01 ca             	clac   
0d5d      d5d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d67      d67:	e9 00 00 00 00       	jmp    d6c <.altinstr_replacement+0xd6c>	d68: R_X86_64_PLT32	.text+0x546b34
0d6c      d6c:	e9 00 00 00 00       	jmp    d71 <.altinstr_replacement+0xd71>	d6d: R_X86_64_PLT32	.text+0x546eda
0d71      d71:	e9 00 00 00 00       	jmp    d76 <.altinstr_replacement+0xd76>	d72: R_X86_64_PLT32	.text+0x546fb8
0d76      d76:	e9 00 00 00 00       	jmp    d7b <.altinstr_replacement+0xd7b>	d77: R_X86_64_PLT32	.text+0x5479db
0d7b      d7b:	e9 00 00 00 00       	jmp    d80 <.altinstr_replacement+0xd80>	d7c: R_X86_64_PLT32	.text+0x5479f6
0d80      d80:	e9 00 00 00 00       	jmp    d85 <.altinstr_replacement+0xd85>	d81: R_X86_64_PLT32	.text+0x54ade1
0d85      d85:	e9 00 00 00 00       	jmp    d8a <.altinstr_replacement+0xd8a>	d86: R_X86_64_PLT32	.text+0x54bb29
0d8a      d8a:	e9 00 00 00 00       	jmp    d8f <.altinstr_replacement+0xd8f>	d8b: R_X86_64_PLT32	.text+0x54c9aa
0d8f      d8f:	e9 00 00 00 00       	jmp    d94 <.altinstr_replacement+0xd94>	d90: R_X86_64_PLT32	.text+0x54bc10
0d94      d94:	e9 00 00 00 00       	jmp    d99 <.altinstr_replacement+0xd99>	d95: R_X86_64_PLT32	.text+0x54c550
0d99      d99:	e9 00 00 00 00       	jmp    d9e <.altinstr_replacement+0xd9e>	d9a: R_X86_64_PLT32	.text+0x54c57c
0d9e      d9e:	e9 00 00 00 00       	jmp    da3 <.altinstr_replacement+0xda3>	d9f: R_X86_64_PLT32	.text+0x54c70b
0da3      da3:	e9 00 00 00 00       	jmp    da8 <.altinstr_replacement+0xda8>	da4: R_X86_64_PLT32	.text+0x54c76f
0da8      da8:	e9 00 00 00 00       	jmp    dad <.altinstr_replacement+0xdad>	da9: R_X86_64_PLT32	.text+0x54c724
0dad      dad:	e9 00 00 00 00       	jmp    db2 <.altinstr_replacement+0xdb2>	dae: R_X86_64_PLT32	.text+0x54ba6a
0db2      db2:	e9 00 00 00 00       	jmp    db7 <.altinstr_replacement+0xdb7>	db3: R_X86_64_PLT32	.text+0x54d54f
0db7      db7:	e9 00 00 00 00       	jmp    dbc <.altinstr_replacement+0xdbc>	db8: R_X86_64_PLT32	.text+0x54de6b
0dbc      dbc:	e9 00 00 00 00       	jmp    dc1 <.altinstr_replacement+0xdc1>	dbd: R_X86_64_PLT32	.text+0x550169
0dc1      dc1:	e9 00 00 00 00       	jmp    dc6 <.altinstr_replacement+0xdc6>	dc2: R_X86_64_PLT32	.text+0x550180
0dc6      dc6:	e9 00 00 00 00       	jmp    dcb <.altinstr_replacement+0xdcb>	dc7: R_X86_64_PLT32	.text+0x54dfaf
0dcb      dcb:	e9 00 00 00 00       	jmp    dd0 <.altinstr_replacement+0xdd0>	dcc: R_X86_64_PLT32	.text+0x54e045
0dd0      dd0:	e9 00 00 00 00       	jmp    dd5 <.altinstr_replacement+0xdd5>	dd1: R_X86_64_PLT32	.text+0x55075d
0dd5      dd5:	e9 00 00 00 00       	jmp    dda <.altinstr_replacement+0xdda>	dd6: R_X86_64_PLT32	.text+0x551f89
0dda      dda:	e9 00 00 00 00       	jmp    ddf <.altinstr_replacement+0xddf>	ddb: R_X86_64_PLT32	.text+0x55086f
0ddf      ddf:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
0de9      de9:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
0df3      df3:	e9 00 00 00 00       	jmp    df8 <.altinstr_replacement+0xdf8>	df4: R_X86_64_PLT32	.text+0x552f75
0df8      df8:	e9 00 00 00 00       	jmp    dfd <.altinstr_replacement+0xdfd>	df9: R_X86_64_PLT32	.text+0x552d60
0dfd      dfd:	e9 00 00 00 00       	jmp    e02 <.altinstr_replacement+0xe02>	dfe: R_X86_64_PLT32	.text+0x553d48
0e02      e02:	e9 00 00 00 00       	jmp    e07 <.altinstr_replacement+0xe07>	e03: R_X86_64_PLT32	.text+0x553d67
0e07      e07:	e9 00 00 00 00       	jmp    e0c <.altinstr_replacement+0xe0c>	e08: R_X86_64_PLT32	.text+0x555012
0e0c      e0c:	e9 00 00 00 00       	jmp    e11 <.altinstr_replacement+0xe11>	e0d: R_X86_64_PLT32	.text+0x554a1d
0e11      e11:	e9 00 00 00 00       	jmp    e16 <.altinstr_replacement+0xe16>	e12: R_X86_64_PLT32	.text+0x55559f
0e16      e16:	e9 00 00 00 00       	jmp    e1b <.altinstr_replacement+0xe1b>	e17: R_X86_64_PLT32	.text+0x5555f3
0e1b      e1b:	e9 00 00 00 00       	jmp    e20 <.altinstr_replacement+0xe20>	e1c: R_X86_64_PLT32	.text+0x555630
0e20      e20:	e9 00 00 00 00       	jmp    e25 <.altinstr_replacement+0xe25>	e21: R_X86_64_PLT32	.text+0x5562ed
0e25      e25:	e9 00 00 00 00       	jmp    e2a <.altinstr_replacement+0xe2a>	e26: R_X86_64_PLT32	.text+0x55576b
0e2a      e2a:	e9 00 00 00 00       	jmp    e2f <.altinstr_replacement+0xe2f>	e2b: R_X86_64_PLT32	.text+0x555807
0e2f      e2f:	e9 00 00 00 00       	jmp    e34 <.altinstr_replacement+0xe34>	e30: R_X86_64_PLT32	.text+0x55e663
0e34      e34:	e9 00 00 00 00       	jmp    e39 <.altinstr_replacement+0xe39>	e35: R_X86_64_PLT32	.text+0x55c00c
0e39      e39:	e9 00 00 00 00       	jmp    e3e <.altinstr_replacement+0xe3e>	e3a: R_X86_64_PLT32	.text+0x55e7ef
0e3e      e3e:	e9 00 00 00 00       	jmp    e43 <.altinstr_replacement+0xe43>	e3f: R_X86_64_PLT32	.text+0x55e8a4
0e43      e43:	e9 00 00 00 00       	jmp    e48 <.altinstr_replacement+0xe48>	e44: R_X86_64_PLT32	.text+0x55e8a4
0e48      e48:	e9 00 00 00 00       	jmp    e4d <.altinstr_replacement+0xe4d>	e49: R_X86_64_PLT32	.text+0x55e873
0e4d      e4d:	e9 00 00 00 00       	jmp    e52 <.altinstr_replacement+0xe52>	e4e: R_X86_64_PLT32	.text+0x55ea6e
0e52      e52:	e9 00 00 00 00       	jmp    e57 <.altinstr_replacement+0xe57>	e53: R_X86_64_PLT32	.text+0x55ea94
0e57      e57:	e9 00 00 00 00       	jmp    e5c <.altinstr_replacement+0xe5c>	e58: R_X86_64_PLT32	.text+0x55f0e7
0e5c      e5c:	e9 00 00 00 00       	jmp    e61 <.altinstr_replacement+0xe61>	e5d: R_X86_64_PLT32	.text+0x55f50f
0e61      e61:	e9 00 00 00 00       	jmp    e66 <.altinstr_replacement+0xe66>	e62: R_X86_64_PLT32	.text+0x55f1b9
0e66      e66:	e8 00 00 00 00       	call   e6b <.altinstr_replacement+0xe6b>	e67: R_X86_64_PLT32	copy_user_generic_string-0x4
0e6b      e6b:	e8 00 00 00 00       	call   e70 <.altinstr_replacement+0xe70>	e6c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0e70      e70:	e8 00 00 00 00       	call   e75 <.altinstr_replacement+0xe75>	e71: R_X86_64_PLT32	copy_user_generic_string-0x4
0e75      e75:	e8 00 00 00 00       	call   e7a <.altinstr_replacement+0xe7a>	e76: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0e7a      e7a:	e8 00 00 00 00       	call   e7f <.altinstr_replacement+0xe7f>	e7b: R_X86_64_PLT32	clear_page_rep-0x4
0e7f      e7f:	e8 00 00 00 00       	call   e84 <.altinstr_replacement+0xe84>	e80: R_X86_64_PLT32	clear_page_erms-0x4
0e84      e84:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0e8e      e8e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0e98      e98:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0ea2      ea2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0eac      eac:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0eb6      eb6:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
0ec0      ec0:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
0eca      eca:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ed4      ed4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ede      ede:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
0ee8      ee8:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
0ef2      ef2:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
0efc      efc:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
0f06      f06:	e9 00 00 00 00       	jmp    f0b <.altinstr_replacement+0xf0b>	f07: R_X86_64_PLT32	.text+0x57d0fd
0f0b      f0b:	e9 00 00 00 00       	jmp    f10 <.altinstr_replacement+0xf10>	f0c: R_X86_64_PLT32	.text+0x57b854
0f10      f10:	e9 00 00 00 00       	jmp    f15 <.altinstr_replacement+0xf15>	f11: R_X86_64_PLT32	.text+0x57b8b8
0f15      f15:	e9 00 00 00 00       	jmp    f1a <.altinstr_replacement+0xf1a>	f16: R_X86_64_PLT32	.text+0x57d0e6
0f1a      f1a:	e9 00 00 00 00       	jmp    f1f <.altinstr_replacement+0xf1f>	f1b: R_X86_64_PLT32	.text+0x57b99d
0f1f      f1f:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
0f29      f29:	e9 00 00 00 00       	jmp    f2e <.altinstr_replacement+0xf2e>	f2a: R_X86_64_PLT32	.text+0x57ecc9
0f2e      f2e:	e9 00 00 00 00       	jmp    f33 <.altinstr_replacement+0xf33>	f2f: R_X86_64_PLT32	.text+0x57ed5d
0f33      f33:	e9 00 00 00 00       	jmp    f38 <.altinstr_replacement+0xf38>	f34: R_X86_64_PLT32	.text+0x57edea
0f38      f38:	e9 00 00 00 00       	jmp    f3d <.altinstr_replacement+0xf3d>	f39: R_X86_64_PLT32	.text+0x57f1a8
0f3d      f3d:	e9 00 00 00 00       	jmp    f42 <.altinstr_replacement+0xf42>	f3e: R_X86_64_PLT32	.text+0x57f073
0f42      f42:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f4c      f4c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0f56      f56:	e9 00 00 00 00       	jmp    f5b <.altinstr_replacement+0xf5b>	f57: R_X86_64_PLT32	.text+0x581c88
0f5b      f5b:	e9 00 00 00 00       	jmp    f60 <.altinstr_replacement+0xf60>	f5c: R_X86_64_PLT32	.text+0x581d0c
0f60      f60:	e9 00 00 00 00       	jmp    f65 <.altinstr_replacement+0xf65>	f61: R_X86_64_PLT32	.text+0x5830c6
0f65      f65:	e9 00 00 00 00       	jmp    f6a <.altinstr_replacement+0xf6a>	f66: R_X86_64_PLT32	.text+0x5831f4
0f6a      f6a:	e9 00 00 00 00       	jmp    f6f <.altinstr_replacement+0xf6f>	f6b: R_X86_64_PLT32	.text+0x5833b0
0f6f      f6f:	e9 00 00 00 00       	jmp    f74 <.altinstr_replacement+0xf74>	f70: R_X86_64_PLT32	.text+0x584b04
0f74      f74:	e9 00 00 00 00       	jmp    f79 <.altinstr_replacement+0xf79>	f75: R_X86_64_PLT32	.text+0x584ad4
0f79      f79:	e9 00 00 00 00       	jmp    f7e <.altinstr_replacement+0xf7e>	f7a: R_X86_64_PLT32	.text+0x584bdb
0f7e      f7e:	e9 00 00 00 00       	jmp    f83 <.altinstr_replacement+0xf83>	f7f: R_X86_64_PLT32	.text+0x584c01
0f83      f83:	e9 00 00 00 00       	jmp    f88 <.altinstr_replacement+0xf88>	f84: R_X86_64_PLT32	.text+0x5886e8
0f88      f88:	e9 00 00 00 00       	jmp    f8d <.altinstr_replacement+0xf8d>	f89: R_X86_64_PLT32	.text+0x588766
0f8d      f8d:	e9 00 00 00 00       	jmp    f92 <.altinstr_replacement+0xf92>	f8e: R_X86_64_PLT32	.text+0x590439
0f92      f92:	e9 00 00 00 00       	jmp    f97 <.altinstr_replacement+0xf97>	f93: R_X86_64_PLT32	.text+0x590ef6
0f97      f97:	e9 00 00 00 00       	jmp    f9c <.altinstr_replacement+0xf9c>	f98: R_X86_64_PLT32	.text+0x590724
0f9c      f9c:	e9 00 00 00 00       	jmp    fa1 <.altinstr_replacement+0xfa1>	f9d: R_X86_64_PLT32	.text+0x59112a
0fa1      fa1:	e9 00 00 00 00       	jmp    fa6 <.altinstr_replacement+0xfa6>	fa2: R_X86_64_PLT32	.text+0x591161
0fa6      fa6:	e9 00 00 00 00       	jmp    fab <.altinstr_replacement+0xfab>	fa7: R_X86_64_PLT32	.text+0x591826
0fab      fab:	e9 00 00 00 00       	jmp    fb0 <.altinstr_replacement+0xfb0>	fac: R_X86_64_PLT32	.text+0x59124c
0fb0      fb0:	e9 00 00 00 00       	jmp    fb5 <.altinstr_replacement+0xfb5>	fb1: R_X86_64_PLT32	.text+0x591afd
0fb5      fb5:	e9 00 00 00 00       	jmp    fba <.altinstr_replacement+0xfba>	fb6: R_X86_64_PLT32	.text+0x5923e0
0fba      fba:	e9 00 00 00 00       	jmp    fbf <.altinstr_replacement+0xfbf>	fbb: R_X86_64_PLT32	.text+0x591bc3
0fbf      fbf:	e9 00 00 00 00       	jmp    fc4 <.altinstr_replacement+0xfc4>	fc0: R_X86_64_PLT32	.text+0x592071
0fc4      fc4:	e9 00 00 00 00       	jmp    fc9 <.altinstr_replacement+0xfc9>	fc5: R_X86_64_PLT32	.text+0x59209a
0fc9      fc9:	e9 00 00 00 00       	jmp    fce <.altinstr_replacement+0xfce>	fca: R_X86_64_PLT32	.text+0x592740
0fce      fce:	e9 00 00 00 00       	jmp    fd3 <.altinstr_replacement+0xfd3>	fcf: R_X86_64_PLT32	.text+0x592815
0fd3      fd3:	e9 00 00 00 00       	jmp    fd8 <.altinstr_replacement+0xfd8>	fd4: R_X86_64_PLT32	.text+0x592871
0fd8      fd8:	e9 00 00 00 00       	jmp    fdd <.altinstr_replacement+0xfdd>	fd9: R_X86_64_PLT32	.text+0x592924
0fdd      fdd:	e9 00 00 00 00       	jmp    fe2 <.altinstr_replacement+0xfe2>	fde: R_X86_64_PLT32	.text+0x5932d3
0fe2      fe2:	e9 00 00 00 00       	jmp    fe7 <.altinstr_replacement+0xfe7>	fe3: R_X86_64_PLT32	.text+0x593b1b
0fe7      fe7:	e9 00 00 00 00       	jmp    fec <.altinstr_replacement+0xfec>	fe8: R_X86_64_PLT32	.text+0x593d1f
0fec      fec:	e9 00 00 00 00       	jmp    ff1 <.altinstr_replacement+0xff1>	fed: R_X86_64_PLT32	.init.text+0x5b06d
0ff1      ff1:	e9 00 00 00 00       	jmp    ff6 <.altinstr_replacement+0xff6>	ff2: R_X86_64_PLT32	.text+0x5960c1
0ff6      ff6:	e9 00 00 00 00       	jmp    ffb <.altinstr_replacement+0xffb>	ff7: R_X86_64_PLT32	.text+0x596166
0ffb      ffb:	e9 00 00 00 00       	jmp    1000 <.altinstr_replacement+0x1000>	ffc: R_X86_64_PLT32	.text+0x597090
1000     1000:	e9 00 00 00 00       	jmp    1005 <.altinstr_replacement+0x1005>	1001: R_X86_64_PLT32	.text+0x59768a
1005     1005:	e9 00 00 00 00       	jmp    100a <.altinstr_replacement+0x100a>	1006: R_X86_64_PLT32	.text+0x5982f9
100a     100a:	e9 00 00 00 00       	jmp    100f <.altinstr_replacement+0x100f>	100b: R_X86_64_PLT32	.text+0x5983d9
100f     100f:	e9 00 00 00 00       	jmp    1014 <.altinstr_replacement+0x1014>	1010: R_X86_64_PLT32	.text+0x5984b5
1014     1014:	e9 00 00 00 00       	jmp    1019 <.altinstr_replacement+0x1019>	1015: R_X86_64_PLT32	.text+0x598597
1019     1019:	e9 00 00 00 00       	jmp    101e <.altinstr_replacement+0x101e>	101a: R_X86_64_PLT32	.text+0x598675
101e     101e:	e9 00 00 00 00       	jmp    1023 <.altinstr_replacement+0x1023>	101f: R_X86_64_PLT32	.text+0x598753
1023     1023:	e9 00 00 00 00       	jmp    1028 <.altinstr_replacement+0x1028>	1024: R_X86_64_PLT32	.text+0x598828
1028     1028:	e9 00 00 00 00       	jmp    102d <.altinstr_replacement+0x102d>	1029: R_X86_64_PLT32	.text+0x598908
102d     102d:	e9 00 00 00 00       	jmp    1032 <.altinstr_replacement+0x1032>	102e: R_X86_64_PLT32	.text+0x5989e5
1032     1032:	e9 00 00 00 00       	jmp    1037 <.altinstr_replacement+0x1037>	1033: R_X86_64_PLT32	.text+0x598ac3
1037     1037:	e9 00 00 00 00       	jmp    103c <.altinstr_replacement+0x103c>	1038: R_X86_64_PLT32	.text+0x59ae66
103c     103c:	e9 00 00 00 00       	jmp    1041 <.altinstr_replacement+0x1041>	103d: R_X86_64_PLT32	.text+0x59e055
1041     1041:	e9 00 00 00 00       	jmp    1046 <.altinstr_replacement+0x1046>	1042: R_X86_64_PLT32	.text+0x59e4a0
1046     1046:	e9 00 00 00 00       	jmp    104b <.altinstr_replacement+0x104b>	1047: R_X86_64_PLT32	.text+0x59e5ee
104b     104b:	e9 00 00 00 00       	jmp    1050 <.altinstr_replacement+0x1050>	104c: R_X86_64_PLT32	.text+0x59f073
1050     1050:	e9 00 00 00 00       	jmp    1055 <.altinstr_replacement+0x1055>	1051: R_X86_64_PLT32	.text+0x59f2e5
1055     1055:	e9 00 00 00 00       	jmp    105a <.altinstr_replacement+0x105a>	1056: R_X86_64_PLT32	.meminit.text+0x4519
105a     105a:	e9 00 00 00 00       	jmp    105f <.altinstr_replacement+0x105f>	105b: R_X86_64_PLT32	.meminit.text+0x4538
105f     105f:	41 0f 0d 0c 24       	prefetchw (%r12)
1064     1064:	41 0f 0d 4c 24 40    	prefetchw 0x40(%r12)
106a     106a:	e9 00 00 00 00       	jmp    106f <.altinstr_replacement+0x106f>	106b: R_X86_64_PLT32	.text+0x5a11e5
106f     106f:	e9 00 00 00 00       	jmp    1074 <.altinstr_replacement+0x1074>	1070: R_X86_64_PLT32	.text+0x5a13a9
1074     1074:	e8 00 00 00 00       	call   1079 <.altinstr_replacement+0x1079>	1075: R_X86_64_PLT32	clear_page_rep-0x4
1079     1079:	e8 00 00 00 00       	call   107e <.altinstr_replacement+0x107e>	107a: R_X86_64_PLT32	clear_page_erms-0x4
107e     107e:	e9 00 00 00 00       	jmp    1083 <.altinstr_replacement+0x1083>	107f: R_X86_64_PLT32	.text+0x5a1848
1083     1083:	e9 00 00 00 00       	jmp    1088 <.altinstr_replacement+0x1088>	1084: R_X86_64_PLT32	.text+0x5a186d
1088     1088:	e9 00 00 00 00       	jmp    108d <.altinstr_replacement+0x108d>	1089: R_X86_64_PLT32	.text+0x5a19a9
108d     108d:	e9 00 00 00 00       	jmp    1092 <.altinstr_replacement+0x1092>	108e: R_X86_64_PLT32	.text+0x5a19ca
1092     1092:	e8 00 00 00 00       	call   1097 <.altinstr_replacement+0x1097>	1093: R_X86_64_PLT32	clear_page_rep-0x4
1097     1097:	e8 00 00 00 00       	call   109c <.altinstr_replacement+0x109c>	1098: R_X86_64_PLT32	clear_page_erms-0x4
109c     109c:	e9 00 00 00 00       	jmp    10a1 <.altinstr_replacement+0x10a1>	109d: R_X86_64_PLT32	.text+0x5a34f4
10a1     10a1:	e9 00 00 00 00       	jmp    10a6 <.altinstr_replacement+0x10a6>	10a2: R_X86_64_PLT32	.text+0x5a3515
10a6     10a6:	e9 00 00 00 00       	jmp    10ab <.altinstr_replacement+0x10ab>	10a7: R_X86_64_PLT32	.text+0x5a43f6
10ab     10ab:	e8 00 00 00 00       	call   10b0 <.altinstr_replacement+0x10b0>	10ac: R_X86_64_PLT32	clear_page_rep-0x4
10b0     10b0:	e8 00 00 00 00       	call   10b5 <.altinstr_replacement+0x10b5>	10b1: R_X86_64_PLT32	clear_page_erms-0x4
10b5     10b5:	e9 00 00 00 00       	jmp    10ba <.altinstr_replacement+0x10ba>	10b6: R_X86_64_PLT32	.text+0x5a48d8
10ba     10ba:	e9 00 00 00 00       	jmp    10bf <.altinstr_replacement+0x10bf>	10bb: R_X86_64_PLT32	.text+0x5a5e77
10bf     10bf:	e9 00 00 00 00       	jmp    10c4 <.altinstr_replacement+0x10c4>	10c0: R_X86_64_PLT32	.text+0x5a608c
10c4     10c4:	e9 00 00 00 00       	jmp    10c9 <.altinstr_replacement+0x10c9>	10c5: R_X86_64_PLT32	.text+0x5a930d
10c9     10c9:	e9 00 00 00 00       	jmp    10ce <.altinstr_replacement+0x10ce>	10ca: R_X86_64_PLT32	.text+0x5adc25
10ce     10ce:	e9 00 00 00 00       	jmp    10d3 <.altinstr_replacement+0x10d3>	10cf: R_X86_64_PLT32	.text+0x5af72b
10d3     10d3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10d8     10d8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10dd     10dd:	e9 00 00 00 00       	jmp    10e2 <.altinstr_replacement+0x10e2>	10de: R_X86_64_PLT32	.text+0x5b73cd
10e2     10e2:	e9 00 00 00 00       	jmp    10e7 <.altinstr_replacement+0x10e7>	10e3: R_X86_64_PLT32	.text+0x5b7ee4
10e7     10e7:	e9 00 00 00 00       	jmp    10ec <.altinstr_replacement+0x10ec>	10e8: R_X86_64_PLT32	.init.text+0x5f611
10ec     10ec:	e9 00 00 00 00       	jmp    10f1 <.altinstr_replacement+0x10f1>	10ed: R_X86_64_PLT32	.init.text+0x5f630
10f1     10f1:	e9 00 00 00 00       	jmp    10f6 <.altinstr_replacement+0x10f6>	10f2: R_X86_64_PLT32	.text+0x5ba314
10f6     10f6:	e9 00 00 00 00       	jmp    10fb <.altinstr_replacement+0x10fb>	10f7: R_X86_64_PLT32	.text+0x5ba333
10fb     10fb:	e9 00 00 00 00       	jmp    1100 <.altinstr_replacement+0x1100>	10fc: R_X86_64_PLT32	.ref.text+0x28c2
1100     1100:	e9 00 00 00 00       	jmp    1105 <.altinstr_replacement+0x1105>	1101: R_X86_64_PLT32	.text+0x5ba5d7
1105     1105:	e9 00 00 00 00       	jmp    110a <.altinstr_replacement+0x110a>	1106: R_X86_64_PLT32	.text+0x5ba74f
110a     110a:	e9 00 00 00 00       	jmp    110f <.altinstr_replacement+0x110f>	110b: R_X86_64_PLT32	.text+0x5ba91e
110f     110f:	e9 00 00 00 00       	jmp    1114 <.altinstr_replacement+0x1114>	1110: R_X86_64_PLT32	.ref.text+0x34bc
1114     1114:	e9 00 00 00 00       	jmp    1119 <.altinstr_replacement+0x1119>	1115: R_X86_64_PLT32	.ref.text+0x35a4
1119     1119:	e9 00 00 00 00       	jmp    111e <.altinstr_replacement+0x111e>	111a: R_X86_64_PLT32	.text+0x5bb3da
111e     111e:	e9 00 00 00 00       	jmp    1123 <.altinstr_replacement+0x1123>	111f: R_X86_64_PLT32	.text+0x5bba1b
1123     1123:	e9 00 00 00 00       	jmp    1128 <.altinstr_replacement+0x1128>	1124: R_X86_64_PLT32	.text+0x5bbceb
1128     1128:	e9 00 00 00 00       	jmp    112d <.altinstr_replacement+0x112d>	1129: R_X86_64_PLT32	.ref.text+0x45fb
112d     112d:	e9 00 00 00 00       	jmp    1132 <.altinstr_replacement+0x1132>	112e: R_X86_64_PLT32	.ref.text+0x4616
1132     1132:	e9 00 00 00 00       	jmp    1137 <.altinstr_replacement+0x1137>	1133: R_X86_64_PLT32	.ref.text+0x4a29
1137     1137:	e9 00 00 00 00       	jmp    113c <.altinstr_replacement+0x113c>	1138: R_X86_64_PLT32	.ref.text+0x4a47
113c     113c:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
1146     1146:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
1150     1150:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
115a     115a:	e9 00 00 00 00       	jmp    115f <.altinstr_replacement+0x115f>	115b: R_X86_64_PLT32	.text+0x5d1056
115f     115f:	e9 00 00 00 00       	jmp    1164 <.altinstr_replacement+0x1164>	1160: R_X86_64_PLT32	.text+0x5d2821
1164     1164:	e9 00 00 00 00       	jmp    1169 <.altinstr_replacement+0x1169>	1165: R_X86_64_PLT32	.text+0x5d1130
1169     1169:	e9 00 00 00 00       	jmp    116e <.altinstr_replacement+0x116e>	116a: R_X86_64_PLT32	.init.text+0x614c0
116e     116e:	e9 00 00 00 00       	jmp    1173 <.altinstr_replacement+0x1173>	116f: R_X86_64_PLT32	.text+0x5dd15e
1173     1173:	e9 00 00 00 00       	jmp    1178 <.altinstr_replacement+0x1178>	1174: R_X86_64_PLT32	.init.text+0x615ee
1178     1178:	e9 00 00 00 00       	jmp    117d <.altinstr_replacement+0x117d>	1179: R_X86_64_PLT32	.init.text+0x616a3
117d     117d:	e9 00 00 00 00       	jmp    1182 <.altinstr_replacement+0x1182>	117e: R_X86_64_PLT32	.init.text+0x6176d
1182     1182:	e9 00 00 00 00       	jmp    1187 <.altinstr_replacement+0x1187>	1183: R_X86_64_PLT32	.init.text+0x61841
1187     1187:	e9 00 00 00 00       	jmp    118c <.altinstr_replacement+0x118c>	1188: R_X86_64_PLT32	.init.text+0x61901
118c     118c:	e9 00 00 00 00       	jmp    1191 <.altinstr_replacement+0x1191>	118d: R_X86_64_PLT32	.init.text+0x61d08
1191     1191:	e9 00 00 00 00       	jmp    1196 <.altinstr_replacement+0x1196>	1192: R_X86_64_PLT32	.init.text+0x61dd0
1196     1196:	e9 00 00 00 00       	jmp    119b <.altinstr_replacement+0x119b>	1197: R_X86_64_PLT32	.init.text+0x61e88
119b     119b:	e9 00 00 00 00       	jmp    11a0 <.altinstr_replacement+0x11a0>	119c: R_X86_64_PLT32	.init.text+0x61f2a
11a0     11a0:	e9 00 00 00 00       	jmp    11a5 <.altinstr_replacement+0x11a5>	11a1: R_X86_64_PLT32	.init.text+0x62030
11a5     11a5:	e9 00 00 00 00       	jmp    11aa <.altinstr_replacement+0x11aa>	11a6: R_X86_64_PLT32	.init.text+0x620c0
11aa     11aa:	e9 00 00 00 00       	jmp    11af <.altinstr_replacement+0x11af>	11ab: R_X86_64_PLT32	.text+0x5dd29d
11af     11af:	e9 00 00 00 00       	jmp    11b4 <.altinstr_replacement+0x11b4>	11b0: R_X86_64_PLT32	.text+0x5dd36f
11b4     11b4:	e9 00 00 00 00       	jmp    11b9 <.altinstr_replacement+0x11b9>	11b5: R_X86_64_PLT32	.text+0x5dd47d
11b9     11b9:	e9 00 00 00 00       	jmp    11be <.altinstr_replacement+0x11be>	11ba: R_X86_64_PLT32	.text+0x5dd54f
11be     11be:	e9 00 00 00 00       	jmp    11c3 <.altinstr_replacement+0x11c3>	11bf: R_X86_64_PLT32	.meminit.text+0x9eaa
11c3     11c3:	e9 00 00 00 00       	jmp    11c8 <.altinstr_replacement+0x11c8>	11c4: R_X86_64_PLT32	.meminit.text+0x9ff2
11c8     11c8:	e9 00 00 00 00       	jmp    11cd <.altinstr_replacement+0x11cd>	11c9: R_X86_64_PLT32	.text+0x5dd657
11cd     11cd:	e9 00 00 00 00       	jmp    11d2 <.altinstr_replacement+0x11d2>	11ce: R_X86_64_PLT32	.text+0x5dd73a
11d2     11d2:	e9 00 00 00 00       	jmp    11d7 <.altinstr_replacement+0x11d7>	11d3: R_X86_64_PLT32	.init.text+0x62221
11d7     11d7:	e9 00 00 00 00       	jmp    11dc <.altinstr_replacement+0x11dc>	11d8: R_X86_64_PLT32	.init.text+0x6234b
11dc     11dc:	e9 00 00 00 00       	jmp    11e1 <.altinstr_replacement+0x11e1>	11dd: R_X86_64_PLT32	.meminit.text+0xa385
11e1     11e1:	e9 00 00 00 00       	jmp    11e6 <.altinstr_replacement+0x11e6>	11e2: R_X86_64_PLT32	.init.text+0x626af
11e6     11e6:	e9 00 00 00 00       	jmp    11eb <.altinstr_replacement+0x11eb>	11e7: R_X86_64_PLT32	.init.text+0x626c0
11eb     11eb:	e9 00 00 00 00       	jmp    11f0 <.altinstr_replacement+0x11f0>	11ec: R_X86_64_PLT32	.init.text+0x627d5
11f0     11f0:	e9 00 00 00 00       	jmp    11f5 <.altinstr_replacement+0x11f5>	11f1: R_X86_64_PLT32	.meminit.text+0xb302
11f5     11f5:	e9 00 00 00 00       	jmp    11fa <.altinstr_replacement+0x11fa>	11f6: R_X86_64_PLT32	.meminit.text+0xb426
11fa     11fa:	e9 00 00 00 00       	jmp    11ff <.altinstr_replacement+0x11ff>	11fb: R_X86_64_PLT32	.meminit.text+0xb44c
11ff     11ff:	e9 00 00 00 00       	jmp    1204 <.altinstr_replacement+0x1204>	1200: R_X86_64_PLT32	.meminit.text+0xb53a
1204     1204:	e9 00 00 00 00       	jmp    1209 <.altinstr_replacement+0x1209>	1205: R_X86_64_PLT32	.meminit.text+0xb53a
1209     1209:	e9 00 00 00 00       	jmp    120e <.altinstr_replacement+0x120e>	120a: R_X86_64_PLT32	.meminit.text+0xb5e2
120e     120e:	e9 00 00 00 00       	jmp    1213 <.altinstr_replacement+0x1213>	120f: R_X86_64_PLT32	.meminit.text+0xbdd1
1213     1213:	48 0f c7 0f          	cmpxchg16b (%rdi)
1217     1217:	0f 94 c0             	sete   %al
121a     121a:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
121e     121e:	48 0f c7 0f          	cmpxchg16b (%rdi)
1222     1222:	0f 94 c0             	sete   %al
1225     1225:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1229     1229:	48 0f c7 0f          	cmpxchg16b (%rdi)
122d     122d:	0f 94 c0             	sete   %al
1230     1230:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1234     1234:	48 0f c7 0f          	cmpxchg16b (%rdi)
1238     1238:	0f 94 c0             	sete   %al
123b     123b:	48 0f c7 0f          	cmpxchg16b (%rdi)
123f     123f:	0f 94 c0             	sete   %al
1242     1242:	48 0f c7 0f          	cmpxchg16b (%rdi)
1246     1246:	0f 94 c0             	sete   %al
1249     1249:	48 0f c7 0f          	cmpxchg16b (%rdi)
124d     124d:	0f 94 c0             	sete   %al
1250     1250:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1254     1254:	48 0f c7 0f          	cmpxchg16b (%rdi)
1258     1258:	0f 94 c0             	sete   %al
125b     125b:	48 0f c7 0f          	cmpxchg16b (%rdi)
125f     125f:	0f 94 c0             	sete   %al
1262     1262:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1266     1266:	e9 00 00 00 00       	jmp    126b <.altinstr_replacement+0x126b>	1267: R_X86_64_PLT32	.text+0x5ea77b
126b     126b:	e9 00 00 00 00       	jmp    1270 <.altinstr_replacement+0x1270>	126c: R_X86_64_PLT32	.text+0x5ea7a0
1270     1270:	9c                   	pushf  
1271     1271:	8f 04 24             	pop    (%rsp)
1274     1274:	0f 01 ca             	clac   
1277     1277:	ff 74 24 30          	push   0x30(%rsp)
127b     127b:	9d                   	popf   
127c     127c:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1286     1286:	e9 00 00 00 00       	jmp    128b <.altinstr_replacement+0x128b>	1287: R_X86_64_PLT32	.ref.text+0x5e5a
128b     128b:	e9 00 00 00 00       	jmp    1290 <.altinstr_replacement+0x1290>	128c: R_X86_64_PLT32	.ref.text+0x5d33
1290     1290:	e9 00 00 00 00       	jmp    1295 <.altinstr_replacement+0x1295>	1291: R_X86_64_PLT32	.ref.text+0x5dec
1295     1295:	e9 00 00 00 00       	jmp    129a <.altinstr_replacement+0x129a>	1296: R_X86_64_PLT32	.ref.text+0x5e16
129a     129a:	e9 00 00 00 00       	jmp    129f <.altinstr_replacement+0x129f>	129b: R_X86_64_PLT32	.ref.text+0x5e4f
129f     129f:	e9 00 00 00 00       	jmp    12a4 <.altinstr_replacement+0x12a4>	12a0: R_X86_64_PLT32	.ref.text+0x601e
12a4     12a4:	e9 00 00 00 00       	jmp    12a9 <.altinstr_replacement+0x12a9>	12a5: R_X86_64_PLT32	.ref.text+0x602d
12a9     12a9:	e9 00 00 00 00       	jmp    12ae <.altinstr_replacement+0x12ae>	12aa: R_X86_64_PLT32	.ref.text+0x5d33
12ae     12ae:	e9 00 00 00 00       	jmp    12b3 <.altinstr_replacement+0x12b3>	12af: R_X86_64_PLT32	.ref.text+0x5ff2
12b3     12b3:	e9 00 00 00 00       	jmp    12b8 <.altinstr_replacement+0x12b8>	12b4: R_X86_64_PLT32	.ref.text+0x603d
12b8     12b8:	e9 00 00 00 00       	jmp    12bd <.altinstr_replacement+0x12bd>	12b9: R_X86_64_PLT32	.ref.text+0x60c4
12bd     12bd:	e9 00 00 00 00       	jmp    12c2 <.altinstr_replacement+0x12c2>	12be: R_X86_64_PLT32	.ref.text+0x6337
12c2     12c2:	e9 00 00 00 00       	jmp    12c7 <.altinstr_replacement+0x12c7>	12c3: R_X86_64_PLT32	.ref.text+0x6356
12c7     12c7:	e9 00 00 00 00       	jmp    12cc <.altinstr_replacement+0x12cc>	12c8: R_X86_64_PLT32	.ref.text+0x6347
12cc     12cc:	e9 00 00 00 00       	jmp    12d1 <.altinstr_replacement+0x12d1>	12cd: R_X86_64_PLT32	.ref.text+0x6366
12d1     12d1:	e9 00 00 00 00       	jmp    12d6 <.altinstr_replacement+0x12d6>	12d2: R_X86_64_PLT32	.text+0x5eb0f2
12d6     12d6:	e9 00 00 00 00       	jmp    12db <.altinstr_replacement+0x12db>	12d7: R_X86_64_PLT32	.text+0x5eb09e
12db     12db:	e9 00 00 00 00       	jmp    12e0 <.altinstr_replacement+0x12e0>	12dc: R_X86_64_PLT32	.text+0x5eb18e
12e0     12e0:	e9 00 00 00 00       	jmp    12e5 <.altinstr_replacement+0x12e5>	12e1: R_X86_64_PLT32	.text+0x5eb1dc
12e5     12e5:	e9 00 00 00 00       	jmp    12ea <.altinstr_replacement+0x12ea>	12e6: R_X86_64_PLT32	.text+0x5eb8f3
12ea     12ea:	e9 00 00 00 00       	jmp    12ef <.altinstr_replacement+0x12ef>	12eb: R_X86_64_PLT32	.text+0x5eb945
12ef     12ef:	e9 00 00 00 00       	jmp    12f4 <.altinstr_replacement+0x12f4>	12f0: R_X86_64_PLT32	.text+0x5eb906
12f4     12f4:	e9 00 00 00 00       	jmp    12f9 <.altinstr_replacement+0x12f9>	12f5: R_X86_64_PLT32	.text+0x5eb958
12f9     12f9:	e9 00 00 00 00       	jmp    12fe <.altinstr_replacement+0x12fe>	12fa: R_X86_64_PLT32	.text+0x5eb9a2
12fe     12fe:	e9 00 00 00 00       	jmp    1303 <.altinstr_replacement+0x1303>	12ff: R_X86_64_PLT32	.text+0x5eba1d
1303     1303:	e9 00 00 00 00       	jmp    1308 <.altinstr_replacement+0x1308>	1304: R_X86_64_PLT32	.text+0x5eb09e
1308     1308:	e9 00 00 00 00       	jmp    130d <.altinstr_replacement+0x130d>	1309: R_X86_64_PLT32	.text+0x5eb07f
130d     130d:	e9 00 00 00 00       	jmp    1312 <.altinstr_replacement+0x1312>	130e: R_X86_64_PLT32	.text+0x5ebb42
1312     1312:	e9 00 00 00 00       	jmp    1317 <.altinstr_replacement+0x1317>	1313: R_X86_64_PLT32	.text+0x5ebf1f
1317     1317:	e9 00 00 00 00       	jmp    131c <.altinstr_replacement+0x131c>	1318: R_X86_64_PLT32	.text+0x5ebf9f
131c     131c:	e9 00 00 00 00       	jmp    1321 <.altinstr_replacement+0x1321>	131d: R_X86_64_PLT32	.text+0x5ec01f
1321     1321:	e9 00 00 00 00       	jmp    1326 <.altinstr_replacement+0x1326>	1322: R_X86_64_PLT32	.text+0x5ec0cf
1326     1326:	e9 00 00 00 00       	jmp    132b <.altinstr_replacement+0x132b>	1327: R_X86_64_PLT32	.text+0x5ec183
132b     132b:	e9 00 00 00 00       	jmp    1330 <.altinstr_replacement+0x1330>	132c: R_X86_64_PLT32	.text+0x5ec233
1330     1330:	e9 00 00 00 00       	jmp    1335 <.altinstr_replacement+0x1335>	1331: R_X86_64_PLT32	.text+0x5ec2f3
1335     1335:	e9 00 00 00 00       	jmp    133a <.altinstr_replacement+0x133a>	1336: R_X86_64_PLT32	.text+0x5ec3a3
133a     133a:	e9 00 00 00 00       	jmp    133f <.altinstr_replacement+0x133f>	133b: R_X86_64_PLT32	.text+0x5ec45f
133f     133f:	e9 00 00 00 00       	jmp    1344 <.altinstr_replacement+0x1344>	1340: R_X86_64_PLT32	.text+0x5ec4ff
1344     1344:	e9 00 00 00 00       	jmp    1349 <.altinstr_replacement+0x1349>	1345: R_X86_64_PLT32	.text+0x5ec908
1349     1349:	e9 00 00 00 00       	jmp    134e <.altinstr_replacement+0x134e>	134a: R_X86_64_PLT32	.text+0x5ec9a1
134e     134e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1358     1358:	e9 00 00 00 00       	jmp    135d <.altinstr_replacement+0x135d>	1359: R_X86_64_PLT32	.meminit.text+0xbfb8
135d     135d:	e9 00 00 00 00       	jmp    1362 <.altinstr_replacement+0x1362>	135e: R_X86_64_PLT32	.meminit.text+0xbfe9
1362     1362:	e9 00 00 00 00       	jmp    1367 <.altinstr_replacement+0x1367>	1363: R_X86_64_PLT32	.text+0x5f7ba8
1367     1367:	e9 00 00 00 00       	jmp    136c <.altinstr_replacement+0x136c>	1368: R_X86_64_PLT32	.text+0x5f6fa5
136c     136c:	e9 00 00 00 00       	jmp    1371 <.altinstr_replacement+0x1371>	136d: R_X86_64_PLT32	.init.text+0x6379e
1371     1371:	e9 00 00 00 00       	jmp    1376 <.altinstr_replacement+0x1376>	1372: R_X86_64_PLT32	.init.text+0x637bd
1376     1376:	e9 00 00 00 00       	jmp    137b <.altinstr_replacement+0x137b>	1377: R_X86_64_PLT32	.text+0x6168fb
137b     137b:	e9 00 00 00 00       	jmp    1380 <.altinstr_replacement+0x1380>	137c: R_X86_64_PLT32	.text+0x61691b
1380     1380:	e9 00 00 00 00       	jmp    1385 <.altinstr_replacement+0x1385>	1381: R_X86_64_PLT32	.text+0x616bc6
1385     1385:	e9 00 00 00 00       	jmp    138a <.altinstr_replacement+0x138a>	1386: R_X86_64_PLT32	.text+0x616bea
138a     138a:	e9 00 00 00 00       	jmp    138f <.altinstr_replacement+0x138f>	138b: R_X86_64_PLT32	.init.text+0x6549e
138f     138f:	e9 00 00 00 00       	jmp    1394 <.altinstr_replacement+0x1394>	1390: R_X86_64_PLT32	.init.text+0x654bd
1394     1394:	e9 00 00 00 00       	jmp    1399 <.altinstr_replacement+0x1399>	1395: R_X86_64_PLT32	.init.text+0x65737
1399     1399:	e9 00 00 00 00       	jmp    139e <.altinstr_replacement+0x139e>	139a: R_X86_64_PLT32	.init.text+0x65756
139e     139e:	e9 00 00 00 00       	jmp    13a3 <.altinstr_replacement+0x13a3>	139f: R_X86_64_PLT32	.text+0x61cd2e
13a3     13a3:	e9 00 00 00 00       	jmp    13a8 <.altinstr_replacement+0x13a8>	13a4: R_X86_64_PLT32	.init.text+0x65e9c
13a8     13a8:	e9 00 00 00 00       	jmp    13ad <.altinstr_replacement+0x13ad>	13a9: R_X86_64_PLT32	.init.text+0x65ebb
13ad     13ad:	e9 00 00 00 00       	jmp    13b2 <.altinstr_replacement+0x13b2>	13ae: R_X86_64_PLT32	.meminit.text+0xc17e
13b2     13b2:	e9 00 00 00 00       	jmp    13b7 <.altinstr_replacement+0x13b7>	13b3: R_X86_64_PLT32	.text+0x61ce2f
13b7     13b7:	e9 00 00 00 00       	jmp    13bc <.altinstr_replacement+0x13bc>	13b8: R_X86_64_PLT32	.init.text+0x661ca
13bc     13bc:	e9 00 00 00 00       	jmp    13c1 <.altinstr_replacement+0x13c1>	13bd: R_X86_64_PLT32	.init.text+0x661e9
13c1     13c1:	e9 00 00 00 00       	jmp    13c6 <.altinstr_replacement+0x13c6>	13c2: R_X86_64_PLT32	.init.text+0x66379
13c6     13c6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
13d0     13d0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
13da     13da:	49 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r13
13e4     13e4:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
13ee     13ee:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
13f8     13f8:	0f 01 cb             	stac   
13fb     13fb:	0f ae e8             	lfence 
13fe     13fe:	0f 01 ca             	clac   
1401     1401:	0f 01 ca             	clac   
1404     1404:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
140e     140e:	0f 01 cb             	stac   
1411     1411:	0f ae e8             	lfence 
1414     1414:	0f 01 ca             	clac   
1417     1417:	0f 01 ca             	clac   
141a     141a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1424     1424:	0f 01 cb             	stac   
1427     1427:	0f ae e8             	lfence 
142a     142a:	0f 01 ca             	clac   
142d     142d:	0f 01 ca             	clac   
1430     1430:	e8 00 00 00 00       	call   1435 <.altinstr_replacement+0x1435>	1431: R_X86_64_PLT32	copy_user_generic_string-0x4
1435     1435:	e8 00 00 00 00       	call   143a <.altinstr_replacement+0x143a>	1436: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
143a     143a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1444     1444:	0f 01 cb             	stac   
1447     1447:	0f ae e8             	lfence 
144a     144a:	0f 01 ca             	clac   
144d     144d:	0f 01 ca             	clac   
1450     1450:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
145a     145a:	0f 01 cb             	stac   
145d     145d:	0f ae e8             	lfence 
1460     1460:	0f 01 ca             	clac   
1463     1463:	0f 01 ca             	clac   
1466     1466:	0f 0d 8f 98 09 00 00 	prefetchw 0x998(%rdi)
146d     146d:	f3 0f b8 c7          	popcnt %edi,%eax
1471     1471:	41 0f 0d 0c 24       	prefetchw (%r12)
1476     1476:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1480     1480:	f3 0f b8 c7          	popcnt %edi,%eax
1484     1484:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
148e     148e:	f3 0f b8 c7          	popcnt %edi,%eax
1492     1492:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
149c     149c:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
14a6     14a6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14b0     14b0:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
14ba     14ba:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
14c4     14c4:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
14ce     14ce:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
14d8     14d8:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
14e2     14e2:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
14ec     14ec:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
14f6     14f6:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
1500     1500:	e9 00 00 00 00       	jmp    1505 <.altinstr_replacement+0x1505>	1501: R_X86_64_PLT32	.text+0x7fc6d7
1505     1505:	e9 00 00 00 00       	jmp    150a <.altinstr_replacement+0x150a>	1506: R_X86_64_PLT32	.init.text+0x6996a
150a     150a:	e9 00 00 00 00       	jmp    150f <.altinstr_replacement+0x150f>	150b: R_X86_64_PLT32	.init.text+0x69b58
150f     150f:	e9 00 00 00 00       	jmp    1514 <.altinstr_replacement+0x1514>	1510: R_X86_64_PLT32	.text+0x808787
1514     1514:	e9 00 00 00 00       	jmp    1519 <.altinstr_replacement+0x1519>	1515: R_X86_64_PLT32	.text+0x808c59
1519     1519:	e9 00 00 00 00       	jmp    151e <.altinstr_replacement+0x151e>	151a: R_X86_64_PLT32	.text+0x809256
151e     151e:	e9 00 00 00 00       	jmp    1523 <.altinstr_replacement+0x1523>	151f: R_X86_64_PLT32	.text+0x809601
1523     1523:	e9 00 00 00 00       	jmp    1528 <.altinstr_replacement+0x1528>	1524: R_X86_64_PLT32	.text+0x80a57e
1528     1528:	e9 00 00 00 00       	jmp    152d <.altinstr_replacement+0x152d>	1529: R_X86_64_PLT32	.text+0x80a5a2
152d     152d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1532     1532:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1537     1537:	41 0f 0d 0c 24       	prefetchw (%r12)
153c     153c:	e8 00 00 00 00       	call   1541 <.altinstr_replacement+0x1541>	153d: R_X86_64_PLT32	clear_page_rep-0x4
1541     1541:	e8 00 00 00 00       	call   1546 <.altinstr_replacement+0x1546>	1542: R_X86_64_PLT32	clear_page_erms-0x4
1546     1546:	e8 00 00 00 00       	call   154b <.altinstr_replacement+0x154b>	1547: R_X86_64_PLT32	clear_page_rep-0x4
154b     154b:	e8 00 00 00 00       	call   1550 <.altinstr_replacement+0x1550>	154c: R_X86_64_PLT32	clear_page_erms-0x4
1550     1550:	e8 00 00 00 00       	call   1555 <.altinstr_replacement+0x1555>	1551: R_X86_64_PLT32	clear_page_rep-0x4
1555     1555:	e8 00 00 00 00       	call   155a <.altinstr_replacement+0x155a>	1556: R_X86_64_PLT32	clear_page_erms-0x4
155a     155a:	e8 00 00 00 00       	call   155f <.altinstr_replacement+0x155f>	155b: R_X86_64_PLT32	clear_page_rep-0x4
155f     155f:	e8 00 00 00 00       	call   1564 <.altinstr_replacement+0x1564>	1560: R_X86_64_PLT32	clear_page_erms-0x4
1564     1564:	e8 00 00 00 00       	call   1569 <.altinstr_replacement+0x1569>	1565: R_X86_64_PLT32	clear_page_rep-0x4
1569     1569:	e8 00 00 00 00       	call   156e <.altinstr_replacement+0x156e>	156a: R_X86_64_PLT32	clear_page_erms-0x4
156e     156e:	e8 00 00 00 00       	call   1573 <.altinstr_replacement+0x1573>	156f: R_X86_64_PLT32	clear_page_rep-0x4
1573     1573:	e8 00 00 00 00       	call   1578 <.altinstr_replacement+0x1578>	1574: R_X86_64_PLT32	clear_page_erms-0x4
1578     1578:	41 0f 0d 0e          	prefetchw (%r14)
157c     157c:	f3 0f b8 c7          	popcnt %edi,%eax
1580     1580:	f3 0f b8 c7          	popcnt %edi,%eax
1584     1584:	f3 0f b8 c7          	popcnt %edi,%eax
1588     1588:	f3 0f b8 c7          	popcnt %edi,%eax
158c     158c:	f3 0f b8 c7          	popcnt %edi,%eax
1590     1590:	f3 0f b8 c7          	popcnt %edi,%eax
1594     1594:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1599     1599:	f3 48 0f b8 c7       	popcnt %rdi,%rax
159e     159e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15a3     15a3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15a8     15a8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15ad     15ad:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15b2     15b2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15b7     15b7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15bc     15bc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15c1     15c1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
15c6     15c6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15d0     15d0:	e8 00 00 00 00       	call   15d5 <.altinstr_replacement+0x15d5>	15d1: R_X86_64_PLT32	copy_user_generic_string-0x4
15d5     15d5:	e8 00 00 00 00       	call   15da <.altinstr_replacement+0x15da>	15d6: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
15da     15da:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15e4     15e4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15ee     15ee:	e8 00 00 00 00       	call   15f3 <.altinstr_replacement+0x15f3>	15ef: R_X86_64_PLT32	copy_user_generic_string-0x4
15f3     15f3:	e8 00 00 00 00       	call   15f8 <.altinstr_replacement+0x15f8>	15f4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
15f8     15f8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1602     1602:	0f 01 cb             	stac   
1605     1605:	0f ae e8             	lfence 
1608     1608:	0f 01 ca             	clac   
160b     160b:	0f 01 ca             	clac   
160e     160e:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1618     1618:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1622     1622:	f3 0f b8 c7          	popcnt %edi,%eax
1626     1626:	f3 0f b8 c7          	popcnt %edi,%eax
162a     162a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1634     1634:	e8 00 00 00 00       	call   1639 <.altinstr_replacement+0x1639>	1635: R_X86_64_PLT32	copy_user_generic_string-0x4
1639     1639:	e8 00 00 00 00       	call   163e <.altinstr_replacement+0x163e>	163a: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
163e     163e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1648     1648:	e8 00 00 00 00       	call   164d <.altinstr_replacement+0x164d>	1649: R_X86_64_PLT32	copy_user_generic_string-0x4
164d     164d:	e8 00 00 00 00       	call   1652 <.altinstr_replacement+0x1652>	164e: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1652     1652:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
165c     165c:	0f 01 cb             	stac   
165f     165f:	0f ae e8             	lfence 
1662     1662:	0f 01 ca             	clac   
1665     1665:	0f 01 ca             	clac   
1668     1668:	49 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r14
1672     1672:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
167c     167c:	0f 01 cb             	stac   
167f     167f:	0f ae e8             	lfence 
1682     1682:	0f 01 ca             	clac   
1685     1685:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
168f     168f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1699     1699:	0f 01 cb             	stac   
169c     169c:	0f ae e8             	lfence 
169f     169f:	0f 01 ca             	clac   
16a2     16a2:	0f 01 ca             	clac   
16a5     16a5:	9c                   	pushf  
16a6     16a6:	8f 04 24             	pop    (%rsp)
16a9     16a9:	0f 01 ca             	clac   
16ac     16ac:	ff 74 24 08          	push   0x8(%rsp)
16b0     16b0:	9d                   	popf   
16b1     16b1:	9c                   	pushf  
16b2     16b2:	8f 44 24 20          	pop    0x20(%rsp)
16b6     16b6:	0f 01 ca             	clac   
16b9     16b9:	ff 74 24 28          	push   0x28(%rsp)
16bd     16bd:	9d                   	popf   
16be     16be:	e9 00 00 00 00       	jmp    16c3 <.altinstr_replacement+0x16c3>	16bf: R_X86_64_PLT32	.text+0x12997e2
16c3     16c3:	e9 00 00 00 00       	jmp    16c8 <.altinstr_replacement+0x16c8>	16c4: R_X86_64_PLT32	.text+0x1299838
16c8     16c8:	0f 01 cb             	stac   
16cb     16cb:	0f 01 ca             	clac   
16ce     16ce:	0f 01 cb             	stac   
16d1     16d1:	0f 01 ca             	clac   
16d4     16d4:	e8 00 00 00 00       	call   16d9 <.altinstr_replacement+0x16d9>	16d5: R_X86_64_PLT32	copy_user_generic_string-0x4
16d9     16d9:	e8 00 00 00 00       	call   16de <.altinstr_replacement+0x16de>	16da: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
16de     16de:	0f 01 cb             	stac   
16e1     16e1:	0f 01 cb             	stac   
16e4     16e4:	0f 01 ca             	clac   
16e7     16e7:	0f 01 cb             	stac   
16ea     16ea:	0f 01 ca             	clac   
16ed     16ed:	0f 01 ca             	clac   
16f0     16f0:	0f 01 ca             	clac   
16f3     16f3:	0f 01 ca             	clac   
16f6     16f6:	0f 01 cb             	stac   
16f9     16f9:	0f 01 ca             	clac   
16fc     16fc:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1706     1706:	0f 01 cb             	stac   
1709     1709:	0f ae e8             	lfence 
170c     170c:	0f 01 ca             	clac   
170f     170f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1719     1719:	0f 01 cb             	stac   
171c     171c:	0f ae e8             	lfence 
171f     171f:	0f 01 ca             	clac   
1722     1722:	0f ae e8             	lfence 
1725     1725:	0f 31                	rdtsc  
1727     1727:	0f 01 f9             	rdtscp 
172a     172a:	0f ae e8             	lfence 
172d     172d:	0f 31                	rdtsc  
172f     172f:	0f 01 f9             	rdtscp 
1732     1732:	0f ae e8             	lfence 
1735     1735:	0f 31                	rdtsc  
1737     1737:	0f 01 f9             	rdtscp 
173a     173a:	0f ae e8             	lfence 
173d     173d:	0f 31                	rdtsc  
173f     173f:	0f 01 f9             	rdtscp 
1742     1742:	0f ae e8             	lfence 
1745     1745:	0f 31                	rdtsc  
1747     1747:	0f 01 f9             	rdtscp 
174a     174a:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1754     1754:	0f 01 cb             	stac   
1757     1757:	0f 01 ca             	clac   
175a     175a:	48 ba ff ef ff ff ff ff ff 00 	movabs $0xffffffffffefff,%rdx
1764     1764:	0f 01 cb             	stac   
1767     1767:	0f 01 ca             	clac   
176a     176a:	48 ba fd ef ff ff ff ff ff 00 	movabs $0xffffffffffeffd,%rdx
1774     1774:	0f 01 cb             	stac   
1777     1777:	0f 01 ca             	clac   
177a     177a:	48 ba f9 ef ff ff ff ff ff 00 	movabs $0xffffffffffeff9,%rdx
1784     1784:	0f 01 cb             	stac   
1787     1787:	0f 01 ca             	clac   
178a     178a:	0f 01 cb             	stac   
178d     178d:	0f ae e8             	lfence 
1790     1790:	0f 01 ca             	clac   
1793     1793:	0f 01 cb             	stac   
1796     1796:	0f ae e8             	lfence 
1799     1799:	0f 01 ca             	clac   
179c     179c:	0f 01 cb             	stac   
179f     179f:	0f ae e8             	lfence 
17a2     17a2:	0f 01 ca             	clac   
17a5     17a5:	0f 01 cb             	stac   
17a8     17a8:	0f ae e8             	lfence 
17ab     17ab:	0f 01 ca             	clac   
17ae     17ae:	0f 01 ca             	clac   
17b1     17b1:	e8 00 00 00 00       	call   17b6 <.altinstr_replacement+0x17b6>	17b2: R_X86_64_PLT32	copy_user_generic_string-0x4
17b6     17b6:	e8 00 00 00 00       	call   17bb <.altinstr_replacement+0x17bb>	17b7: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
17bb     17bb:	e9 00 00 00 00       	jmp    17c0 <.altinstr_replacement+0x17c0>	17bc: R_X86_64_PLT32	.noinstr.text+0x516c
17c0     17c0:	e9 00 00 00 00       	jmp    17c5 <.altinstr_replacement+0x17c5>	17c1: R_X86_64_PLT32	.text+0x12a4fa9
17c5     17c5:	e9 00 00 00 00       	jmp    17ca <.altinstr_replacement+0x17ca>	17c6: R_X86_64_PLT32	.text+0x12a501c
17ca     17ca:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
17d4     17d4:	0f 01 cb             	stac   
17d7     17d7:	0f 01 ca             	clac   
17da     17da:	0f 01 cb             	stac   
17dd     17dd:	0f 01 ca             	clac   
17e0     17e0:	48 bb ff ef ff ff ff ff ff 00 	movabs $0xffffffffffefff,%rbx
17ea     17ea:	0f 01 cb             	stac   
17ed     17ed:	0f 01 ca             	clac   
17f0     17f0:	0f 01 cb             	stac   
17f3     17f3:	0f 01 ca             	clac   
17f6     17f6:	48 bb fd ef ff ff ff ff ff 00 	movabs $0xffffffffffeffd,%rbx
1800     1800:	0f 01 cb             	stac   
1803     1803:	0f 01 ca             	clac   
1806     1806:	0f 01 cb             	stac   
1809     1809:	0f 01 ca             	clac   
180c     180c:	48 bb f9 ef ff ff ff ff ff 00 	movabs $0xffffffffffeff9,%rbx
1816     1816:	0f 01 cb             	stac   
1819     1819:	0f 01 ca             	clac   
181c     181c:	0f 01 cb             	stac   
181f     181f:	0f 01 ca             	clac   
1822     1822:	0f 01 ca             	clac   
1825     1825:	0f ae e8             	lfence 
1828     1828:	ff e0                	jmp    *%rax
182a     182a:	cc                   	int3   
182b     182b:	ff e0                	jmp    *%rax
182d     182d:	0f ae e8             	lfence 
1830     1830:	ff e1                	jmp    *%rcx
1832     1832:	cc                   	int3   
1833     1833:	ff e1                	jmp    *%rcx
1835     1835:	0f ae e8             	lfence 
1838     1838:	ff e2                	jmp    *%rdx
183a     183a:	cc                   	int3   
183b     183b:	ff e2                	jmp    *%rdx
183d     183d:	0f ae e8             	lfence 
1840     1840:	ff e3                	jmp    *%rbx
1842     1842:	cc                   	int3   
1843     1843:	ff e3                	jmp    *%rbx
1845     1845:	0f ae e8             	lfence 
1848     1848:	ff e4                	jmp    *%rsp
184a     184a:	cc                   	int3   
184b     184b:	ff e4                	jmp    *%rsp
184d     184d:	0f ae e8             	lfence 
1850     1850:	ff e5                	jmp    *%rbp
1852     1852:	cc                   	int3   
1853     1853:	ff e5                	jmp    *%rbp
1855     1855:	0f ae e8             	lfence 
1858     1858:	ff e6                	jmp    *%rsi
185a     185a:	cc                   	int3   
185b     185b:	ff e6                	jmp    *%rsi
185d     185d:	0f ae e8             	lfence 
1860     1860:	ff e7                	jmp    *%rdi
1862     1862:	cc                   	int3   
1863     1863:	ff e7                	jmp    *%rdi
1865     1865:	0f ae e8             	lfence 
1868     1868:	41 ff e0             	jmp    *%r8
186b     186b:	cc                   	int3   
186c     186c:	41 ff e0             	jmp    *%r8
186f     186f:	0f ae e8             	lfence 
1872     1872:	41 ff e1             	jmp    *%r9
1875     1875:	cc                   	int3   
1876     1876:	41 ff e1             	jmp    *%r9
1879     1879:	0f ae e8             	lfence 
187c     187c:	41 ff e2             	jmp    *%r10
187f     187f:	cc                   	int3   
1880     1880:	41 ff e2             	jmp    *%r10
1883     1883:	0f ae e8             	lfence 
1886     1886:	41 ff e3             	jmp    *%r11
1889     1889:	cc                   	int3   
188a     188a:	41 ff e3             	jmp    *%r11
188d     188d:	0f ae e8             	lfence 
1890     1890:	41 ff e4             	jmp    *%r12
1893     1893:	cc                   	int3   
1894     1894:	41 ff e4             	jmp    *%r12
1897     1897:	0f ae e8             	lfence 
189a     189a:	41 ff e5             	jmp    *%r13
189d     189d:	cc                   	int3   
189e     189e:	41 ff e5             	jmp    *%r13
18a1     18a1:	0f ae e8             	lfence 
18a4     18a4:	41 ff e6             	jmp    *%r14
18a7     18a7:	cc                   	int3   
18a8     18a8:	41 ff e6             	jmp    *%r14
18ab     18ab:	0f ae e8             	lfence 
18ae     18ae:	41 ff e7             	jmp    *%r15
18b1     18b1:	cc                   	int3   
18b2     18b2:	41 ff e7             	jmp    *%r15
18b5     18b5:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18b9: R_X86_64_32S	pcpu_hot+0x10
18be     18be:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18c2: R_X86_64_32S	pcpu_hot+0x10
18c7     18c7:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18cb: R_X86_64_32S	pcpu_hot+0x10
18d0     18d0:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18d4: R_X86_64_32S	pcpu_hot+0x10
18d9     18d9:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18dd: R_X86_64_32S	pcpu_hot+0x10
18e2     18e2:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18e6: R_X86_64_32S	pcpu_hot+0x10
18eb     18eb:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18ef: R_X86_64_32S	pcpu_hot+0x10
18f4     18f4:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	18f8: R_X86_64_32S	pcpu_hot+0x10
18fd     18fd:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	1901: R_X86_64_32S	pcpu_hot+0x10
1906     1906:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	190a: R_X86_64_32S	pcpu_hot+0x10
190f     190f:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	1913: R_X86_64_32S	pcpu_hot+0x10
1918     1918:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	191c: R_X86_64_32S	pcpu_hot+0x10
1921     1921:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	1925: R_X86_64_32S	pcpu_hot+0x10
192a     192a:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	192e: R_X86_64_32S	pcpu_hot+0x10
1933     1933:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	1937: R_X86_64_32S	pcpu_hot+0x10
193c     193c:	48 c1 3c 25 00 00 00 00 05 	sarq   $0x5,0x0	1940: R_X86_64_32S	pcpu_hot+0x10
1945     1945:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
194f     194f:	e8 00 00 00 00       	call   1954 <.altinstr_replacement+0x1954>	1950: R_X86_64_PLT32	copy_user_generic_string-0x4
1954     1954:	e8 00 00 00 00       	call   1959 <.altinstr_replacement+0x1959>	1955: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1959     1959:	0f 01 cb             	stac   
195c     195c:	0f 01 ca             	clac   
195f     195f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1969     1969:	0f 01 cb             	stac   
196c     196c:	0f 01 ca             	clac   
196f     196f:	66 0f ae 38          	clflushopt (%rax)
1973     1973:	66 0f ae 30          	clwb   (%rax)
1977     1977:	66 0f ae 38          	clflushopt (%rax)
197b     197b:	66 0f ae 30          	clwb   (%rax)
197f     197f:	66 0f ae 38          	clflushopt (%rax)
1983     1983:	66 0f ae 30          	clwb   (%rax)
1987     1987:	66 0f ae 38          	clflushopt (%rax)
198b     198b:	66 0f ae 30          	clwb   (%rax)
198f     198f:	66 0f ae 38          	clflushopt (%rax)
1993     1993:	66 0f ae 30          	clwb   (%rax)
1997     1997:	66 0f ae 38          	clflushopt (%rax)
199b     199b:	66 0f ae 30          	clwb   (%rax)
199f     199f:	f3 0f b8 c7          	popcnt %edi,%eax
19a3     19a3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19a8     19a8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19ad     19ad:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
19b7     19b7:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
19c1     19c1:	e9 00 00 00 00       	jmp    19c6 <.altinstr_replacement+0x19c6>	19c2: R_X86_64_PLT32	.text+0x1445b6b
19c6     19c6:	e9 00 00 00 00       	jmp    19cb <.altinstr_replacement+0x19cb>	19c7: R_X86_64_PLT32	.text+0x14492fe
19cb     19cb:	e9 00 00 00 00       	jmp    19d0 <.altinstr_replacement+0x19d0>	19cc: R_X86_64_PLT32	.text+0x148f4e4
19d0     19d0:	e9 00 00 00 00       	jmp    19d5 <.altinstr_replacement+0x19d5>	19d1: R_X86_64_PLT32	.text+0x148f6a4
19d5     19d5:	e9 00 00 00 00       	jmp    19da <.altinstr_replacement+0x19da>	19d6: R_X86_64_PLT32	.text+0x148f87b
19da     19da:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
19e4     19e4:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
19ee     19ee:	e9 00 00 00 00       	jmp    19f3 <.altinstr_replacement+0x19f3>	19ef: R_X86_64_PLT32	.init.text+0x91256
19f3     19f3:	e9 00 00 00 00       	jmp    19f8 <.altinstr_replacement+0x19f8>	19f4: R_X86_64_PLT32	.init.text+0x91345
19f8     19f8:	e9 00 00 00 00       	jmp    19fd <.altinstr_replacement+0x19fd>	19f9: R_X86_64_PLT32	.text+0x162807d
19fd     19fd:	e9 00 00 00 00       	jmp    1a02 <.altinstr_replacement+0x1a02>	19fe: R_X86_64_PLT32	.text+0x16280ba
1a02     1a02:	e9 00 00 00 00       	jmp    1a07 <.altinstr_replacement+0x1a07>	1a03: R_X86_64_PLT32	.text+0x1628110
1a07     1a07:	e9 00 00 00 00       	jmp    1a0c <.altinstr_replacement+0x1a0c>	1a08: R_X86_64_PLT32	.text+0x162814b
1a0c     1a0c:	e9 00 00 00 00       	jmp    1a11 <.altinstr_replacement+0x1a11>	1a0d: R_X86_64_PLT32	.text+0x16281a2
1a11     1a11:	e9 00 00 00 00       	jmp    1a16 <.altinstr_replacement+0x1a16>	1a12: R_X86_64_PLT32	.text+0x16281dd
1a16     1a16:	e9 00 00 00 00       	jmp    1a1b <.altinstr_replacement+0x1a1b>	1a17: R_X86_64_PLT32	.text+0x1628234
1a1b     1a1b:	e9 00 00 00 00       	jmp    1a20 <.altinstr_replacement+0x1a20>	1a1c: R_X86_64_PLT32	.text+0x162826f
1a20     1a20:	e9 00 00 00 00       	jmp    1a25 <.altinstr_replacement+0x1a25>	1a21: R_X86_64_PLT32	.text+0x16a1a90
1a25     1a25:	66 41 0f ae 3c 0e    	clflushopt (%r14,%rcx,1)
1a2b     1a2b:	e9 00 00 00 00       	jmp    1a30 <.altinstr_replacement+0x1a30>	1a2c: R_X86_64_PLT32	.text+0x16a1d70
1a30     1a30:	66 41 0f ae 3c 0f    	clflushopt (%r15,%rcx,1)
1a36     1a36:	e9 00 00 00 00       	jmp    1a3b <.altinstr_replacement+0x1a3b>	1a37: R_X86_64_PLT32	.text+0x16a1e11
1a3b     1a3b:	66 0f ae 39          	clflushopt (%rcx)
1a3f     1a3f:	66 0f ae 7b ff       	clflushopt -0x1(%rbx)
1a44     1a44:	e9 00 00 00 00       	jmp    1a49 <.altinstr_replacement+0x1a49>	1a45: R_X86_64_PLT32	.text+0x16a2407
1a49     1a49:	f3 0f b8 c7          	popcnt %edi,%eax
1a4d     1a4d:	f3 0f b8 c7          	popcnt %edi,%eax
1a51     1a51:	f3 0f b8 c7          	popcnt %edi,%eax
1a55     1a55:	f3 0f b8 c7          	popcnt %edi,%eax
1a59     1a59:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1a5e     1a5e:	f3 0f b8 c7          	popcnt %edi,%eax
1a62     1a62:	f3 0f b8 c7          	popcnt %edi,%eax
1a66     1a66:	f3 0f b8 c7          	popcnt %edi,%eax
1a6a     1a6a:	f3 0f b8 c7          	popcnt %edi,%eax
1a6e     1a6e:	f3 0f b8 c7          	popcnt %edi,%eax
1a72     1a72:	f3 0f b8 c7          	popcnt %edi,%eax
1a76     1a76:	f3 0f b8 c7          	popcnt %edi,%eax
1a7a     1a7a:	f3 0f b8 c7          	popcnt %edi,%eax
1a7e     1a7e:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1a88     1a88:	e9 00 00 00 00       	jmp    1a8d <.altinstr_replacement+0x1a8d>	1a89: R_X86_64_PLT32	.init.text+0x9697a
1a8d     1a8d:	f3 0f b8 c7          	popcnt %edi,%eax
1a91     1a91:	f3 0f b8 c7          	popcnt %edi,%eax
1a95     1a95:	f3 0f b8 c7          	popcnt %edi,%eax
1a99     1a99:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1a9e     1a9e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1aa3     1aa3:	e8 00 00 00 00       	call   1aa8 <.altinstr_replacement+0x1aa8>	1aa4: R_X86_64_PLT32	clear_page_rep-0x4
1aa8     1aa8:	e8 00 00 00 00       	call   1aad <.altinstr_replacement+0x1aad>	1aa9: R_X86_64_PLT32	clear_page_erms-0x4
1aad     1aad:	e8 00 00 00 00       	call   1ab2 <.altinstr_replacement+0x1ab2>	1aae: R_X86_64_PLT32	clear_page_rep-0x4
1ab2     1ab2:	e8 00 00 00 00       	call   1ab7 <.altinstr_replacement+0x1ab7>	1ab3: R_X86_64_PLT32	clear_page_erms-0x4
1ab7     1ab7:	e8 00 00 00 00       	call   1abc <.altinstr_replacement+0x1abc>	1ab8: R_X86_64_PLT32	clear_page_rep-0x4
1abc     1abc:	e8 00 00 00 00       	call   1ac1 <.altinstr_replacement+0x1ac1>	1abd: R_X86_64_PLT32	clear_page_erms-0x4
1ac1     1ac1:	f3 0f b8 c7          	popcnt %edi,%eax
1ac5     1ac5:	f3 0f b8 c7          	popcnt %edi,%eax
1ac9     1ac9:	f3 0f b8 c7          	popcnt %edi,%eax
1acd     1acd:	f3 0f b8 c7          	popcnt %edi,%eax
1ad1     1ad1:	f3 0f b8 c7          	popcnt %edi,%eax
1ad5     1ad5:	f3 0f b8 c7          	popcnt %edi,%eax
1ad9     1ad9:	f3 0f b8 c7          	popcnt %edi,%eax
1add     1add:	f3 0f b8 c7          	popcnt %edi,%eax
1ae1     1ae1:	f3 0f b8 c7          	popcnt %edi,%eax
1ae5     1ae5:	f3 0f b8 c7          	popcnt %edi,%eax
1ae9     1ae9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1aee     1aee:	f3 0f b8 c7          	popcnt %edi,%eax
1af2     1af2:	f3 0f b8 c7          	popcnt %edi,%eax
1af6     1af6:	f3 0f b8 c7          	popcnt %edi,%eax
1afa     1afa:	f3 0f b8 c7          	popcnt %edi,%eax
1afe     1afe:	f3 0f b8 c7          	popcnt %edi,%eax
1b02     1b02:	f3 0f b8 c7          	popcnt %edi,%eax
1b06     1b06:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1b0b     1b0b:	f3 0f b8 c7          	popcnt %edi,%eax
1b0f     1b0f:	0f 01 d9             	vmmcall 
1b12     1b12:	0f 01 d9             	vmmcall 
1b15     1b15:	0f 01 d9             	vmmcall 
1b18     1b18:	f3 0f b8 c7          	popcnt %edi,%eax
1b1c     1b1c:	f3 0f b8 c7          	popcnt %edi,%eax
1b20     1b20:	f3 0f b8 c7          	popcnt %edi,%eax
1b24     1b24:	f3 0f b8 c7          	popcnt %edi,%eax
1b28     1b28:	e9 00 00 00 00       	jmp    1b2d <.altinstr_replacement+0x1b2d>	1b29: R_X86_64_PLT32	.text+0x2154974
1b2d     1b2d:	e8 00 00 00 00       	call   1b32 <.altinstr_replacement+0x1b32>	1b2e: R_X86_64_PLT32	clear_page_rep-0x4
1b32     1b32:	e8 00 00 00 00       	call   1b37 <.altinstr_replacement+0x1b37>	1b33: R_X86_64_PLT32	clear_page_erms-0x4
1b37     1b37:	e8 00 00 00 00       	call   1b3c <.altinstr_replacement+0x1b3c>	1b38: R_X86_64_PLT32	clear_page_rep-0x4
1b3c     1b3c:	e8 00 00 00 00       	call   1b41 <.altinstr_replacement+0x1b41>	1b3d: R_X86_64_PLT32	clear_page_erms-0x4
1b41     1b41:	e8 00 00 00 00       	call   1b46 <.altinstr_replacement+0x1b46>	1b42: R_X86_64_PLT32	clear_page_rep-0x4
1b46     1b46:	e8 00 00 00 00       	call   1b4b <.altinstr_replacement+0x1b4b>	1b47: R_X86_64_PLT32	clear_page_erms-0x4
1b4b     1b4b:	e8 00 00 00 00       	call   1b50 <.altinstr_replacement+0x1b50>	1b4c: R_X86_64_PLT32	clear_page_rep-0x4
1b50     1b50:	e8 00 00 00 00       	call   1b55 <.altinstr_replacement+0x1b55>	1b51: R_X86_64_PLT32	clear_page_erms-0x4
1b55     1b55:	f3 0f b8 c7          	popcnt %edi,%eax
1b59     1b59:	e9 00 00 00 00       	jmp    1b5e <.altinstr_replacement+0x1b5e>	1b5a: R_X86_64_PLT32	.text+0x22deb25
1b5e     1b5e:	e9 00 00 00 00       	jmp    1b63 <.altinstr_replacement+0x1b63>	1b5f: R_X86_64_PLT32	.text+0x22df6ec
1b63     1b63:	e9 00 00 00 00       	jmp    1b68 <.altinstr_replacement+0x1b68>	1b64: R_X86_64_PLT32	.init.text+0xbae79
1b68     1b68:	e9 00 00 00 00       	jmp    1b6d <.altinstr_replacement+0x1b6d>	1b69: R_X86_64_PLT32	.init.text+0xbaed3
1b6d     1b6d:	e9 00 00 00 00       	jmp    1b72 <.altinstr_replacement+0x1b72>	1b6e: R_X86_64_PLT32	.init.text+0xbaf49
1b72     1b72:	e9 00 00 00 00       	jmp    1b77 <.altinstr_replacement+0x1b77>	1b73: R_X86_64_PLT32	.init.text+0xbaf9d
1b77     1b77:	f3 0f b8 c7          	popcnt %edi,%eax
1b7b     1b7b:	f3 0f b8 c7          	popcnt %edi,%eax
1b7f     1b7f:	e8 00 00 00 00       	call   1b84 <.altinstr_replacement+0x1b84>	1b80: R_X86_64_PLT32	clear_page_rep-0x4
1b84     1b84:	e8 00 00 00 00       	call   1b89 <.altinstr_replacement+0x1b89>	1b85: R_X86_64_PLT32	clear_page_erms-0x4
1b89     1b89:	e8 00 00 00 00       	call   1b8e <.altinstr_replacement+0x1b8e>	1b8a: R_X86_64_PLT32	clear_page_rep-0x4
1b8e     1b8e:	e8 00 00 00 00       	call   1b93 <.altinstr_replacement+0x1b93>	1b8f: R_X86_64_PLT32	clear_page_erms-0x4
1b93     1b93:	e8 00 00 00 00       	call   1b98 <.altinstr_replacement+0x1b98>	1b94: R_X86_64_PLT32	clear_page_rep-0x4
1b98     1b98:	e8 00 00 00 00       	call   1b9d <.altinstr_replacement+0x1b9d>	1b99: R_X86_64_PLT32	clear_page_erms-0x4
1b9d     1b9d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1ba7     1ba7:	f3 0f b8 c7          	popcnt %edi,%eax
1bab     1bab:	f3 0f b8 c7          	popcnt %edi,%eax
1baf     1baf:	f3 0f b8 c7          	popcnt %edi,%eax
1bb3     1bb3:	f3 0f b8 c7          	popcnt %edi,%eax
1bb7     1bb7:	f3 0f b8 c7          	popcnt %edi,%eax
1bbb     1bbb:	f3 0f b8 c7          	popcnt %edi,%eax
1bbf     1bbf:	f3 0f b8 c7          	popcnt %edi,%eax
1bc3     1bc3:	f3 0f b8 c7          	popcnt %edi,%eax
1bc7     1bc7:	f3 0f b8 c7          	popcnt %edi,%eax
1bcb     1bcb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1bd0     1bd0:	f3 0f b8 c7          	popcnt %edi,%eax
1bd4     1bd4:	f3 0f b8 c7          	popcnt %edi,%eax
1bd8     1bd8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1be2     1be2:	41 0f 0d 4d 00       	prefetchw 0x0(%r13)
1be7     1be7:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
1beb     1beb:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1bf5     1bf5:	0f 01 cb             	stac   
1bf8     1bf8:	0f ae e8             	lfence 
1bfb     1bfb:	0f 01 ca             	clac   
1bfe     1bfe:	0f 01 ca             	clac   
1c01     1c01:	f3 0f b8 c7          	popcnt %edi,%eax
1c05     1c05:	f3 0f b8 c7          	popcnt %edi,%eax
1c09     1c09:	f3 0f b8 c7          	popcnt %edi,%eax
1c0d     1c0d:	f3 0f b8 c7          	popcnt %edi,%eax
1c11     1c11:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1c16     1c16:	41 0f 0d 0e          	prefetchw (%r14)
1c1a     1c1a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1c1f     1c1f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1c24     1c24:	e9 00 00 00 00       	jmp    1c29 <.altinstr_replacement+0x1c29>	1c25: R_X86_64_PLT32	.text+0x2e0e858
1c29     1c29:	e9 00 00 00 00       	jmp    1c2e <.altinstr_replacement+0x1c2e>	1c2a: R_X86_64_PLT32	.text+0x2e0efd4
1c2e     1c2e:	e9 00 00 00 00       	jmp    1c33 <.altinstr_replacement+0x1c33>	1c2f: R_X86_64_PLT32	.text+0x2e0ec5c
1c33     1c33:	e9 00 00 00 00       	jmp    1c38 <.altinstr_replacement+0x1c38>	1c34: R_X86_64_PLT32	.text+0x2e0ed41
1c38     1c38:	e9 00 00 00 00       	jmp    1c3d <.altinstr_replacement+0x1c3d>	1c39: R_X86_64_PLT32	.text+0x2e0effa
1c3d     1c3d:	e9 00 00 00 00       	jmp    1c42 <__SCT__tp_func_ufshcd_auto_bkops_state+0x2>	1c3e: R_X86_64_PLT32	.text+0x2e1069c

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
