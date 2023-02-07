Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4EA747F;
	Tue,  7 Feb 2023 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675800695; x=1707336695;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bHaI5d2opW94uilH5bv90PanfSXSIZg7cuUJsj438G8=;
  b=Z5m3PAcPgqpPRFm9ULj++QNBwaNM9878TWPoMbrh3tmff9Xju+QfUKY4
   RihZUkO2FGnxXmhKMQsZvQEQrgvBEflz9AwcJZQDfB5Kmg+ov4LBI9Jm0
   5Ggfb3mZHiTzS6AtYENAyiEl7yeeB4KC3SKbCGVw1ufoQuQfrbqysWVRV
   NN7xlOYCugsPL46wqA/jPIsvEbNr2BbxD48JyBiucmWvNqov3gXHf7l0B
   stHsxOY7uP3Jh2tV5bibFUnCIcdUCZsXgDT4VkfFTuXpiCHrvDbkjr6cC
   pMyrm5Chewle4aIHNoK6pblU8okeUBO8P73wqrzwF9L8tWnMqjxdP03QN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="415835078"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="415835078"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 12:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="809666691"
X-IronPort-AV: E=Sophos;i="5.97,279,1669104000"; 
   d="scan'208";a="809666691"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Feb 2023 12:11:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPUJO-0003rC-25;
	Tue, 07 Feb 2023 20:11:30 +0000
Date: Wed, 8 Feb 2023 04:11:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:objtool/core 7/8] vmlinux.o: warning: objtool:
 .altinstr_replacement+0x21: stack layout conflict in alternatives
Message-ID: <202302080447.RU6l6jVu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git objtool/core
head:   fff5d41447f9480e757c7fb39611041afad1d4cf
commit: 5d577128831ca5312b8feb36ee943bd0bcf86e95 [7/8] objtool: Fix overlapping alternatives
config: x86_64-randconfig-a003-20230206 (https://download.01.org/0day-ci/archive/20230208/202302080447.RU6l6jVu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=5d577128831ca5312b8feb36ee943bd0bcf86e95
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue objtool/core
        git checkout 5d577128831ca5312b8feb36ee943bd0bcf86e95
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .altinstr_replacement+0x21: stack layout conflict in alternatives


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000    0:	e8 00 00 00 00       	call   5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	clear_page_rep-0x4
0005    5:	e8 00 00 00 00       	call   a <.altinstr_replacement+0xa>	6: R_X86_64_PLT32	clear_page_erms-0x4
000a    a:	48 0f ba ec 3f       	bts    $0x3f,%rsp
000f    f:	e9 00 00 00 00       	jmp    14 <.altinstr_replacement+0x14>	10: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0014   14:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
001b   1b:	e8 01 00 00 00       	call   21 <.altinstr_replacement+0x21>
0020   20:	cc                   	int3
0021   21:	e8 01 00 00 00       	call   27 <.altinstr_replacement+0x27>
0026   26:	cc                   	int3
0027   27:	48 83 c4 10          	add    $0x10,%rsp
002b   2b:	49 ff cc             	dec    %r12
002e   2e:	75 eb                	jne    1b <.altinstr_replacement+0x1b>
0030   30:	0f ae e8             	lfence
0033   33:	e8 01 00 00 00       	call   39 <.altinstr_replacement+0x39>
0038   38:	cc                   	int3
0039   39:	48 83 c4 08          	add    $0x8,%rsp
003d   3d:	0f ae e8             	lfence
0040   40:	0f 01 ca             	clac
0043   43:	e8 00 00 00 00       	call   48 <.altinstr_replacement+0x48>	44: R_X86_64_PLT32	xen_error_entry-0x4
0048   48:	0f 01 ca             	clac
004b   4b:	e8 00 00 00 00       	call   50 <.altinstr_replacement+0x50>	4c: R_X86_64_PLT32	xen_error_entry-0x4
0050   50:	0f 01 ca             	clac
0053   53:	e8 00 00 00 00       	call   58 <.altinstr_replacement+0x58>	54: R_X86_64_PLT32	xen_error_entry-0x4
0058   58:	0f 01 ca             	clac
005b   5b:	e8 00 00 00 00       	call   60 <.altinstr_replacement+0x60>	5c: R_X86_64_PLT32	xen_error_entry-0x4
0060   60:	0f 01 ca             	clac
0063   63:	e8 00 00 00 00       	call   68 <.altinstr_replacement+0x68>	64: R_X86_64_PLT32	xen_error_entry-0x4
0068   68:	0f 01 ca             	clac
006b   6b:	e8 00 00 00 00       	call   70 <.altinstr_replacement+0x70>	6c: R_X86_64_PLT32	xen_error_entry-0x4
0070   70:	0f 01 ca             	clac
0073   73:	e8 00 00 00 00       	call   78 <.altinstr_replacement+0x78>	74: R_X86_64_PLT32	xen_error_entry-0x4
0078   78:	0f 01 ca             	clac
007b   7b:	e8 00 00 00 00       	call   80 <.altinstr_replacement+0x80>	7c: R_X86_64_PLT32	xen_error_entry-0x4
0080   80:	0f 01 ca             	clac
0083   83:	e8 00 00 00 00       	call   88 <.altinstr_replacement+0x88>	84: R_X86_64_PLT32	xen_error_entry-0x4
0088   88:	0f 01 ca             	clac
008b   8b:	e8 00 00 00 00       	call   90 <.altinstr_replacement+0x90>	8c: R_X86_64_PLT32	xen_error_entry-0x4
0090   90:	0f 01 ca             	clac
0093   93:	e8 00 00 00 00       	call   98 <.altinstr_replacement+0x98>	94: R_X86_64_PLT32	xen_error_entry-0x4
0098   98:	0f 01 ca             	clac
009b   9b:	e8 00 00 00 00       	call   a0 <.altinstr_replacement+0xa0>	9c: R_X86_64_PLT32	xen_error_entry-0x4
00a0   a0:	0f 01 ca             	clac
00a3   a3:	e8 00 00 00 00       	call   a8 <.altinstr_replacement+0xa8>	a4: R_X86_64_PLT32	xen_error_entry-0x4
00a8   a8:	0f 01 ca             	clac
00ab   ab:	e8 00 00 00 00       	call   b0 <.altinstr_replacement+0xb0>	ac: R_X86_64_PLT32	xen_error_entry-0x4
00b0   b0:	0f 01 ca             	clac
00b3   b3:	e8 00 00 00 00       	call   b8 <.altinstr_replacement+0xb8>	b4: R_X86_64_PLT32	xen_error_entry-0x4
00b8   b8:	0f 01 ca             	clac
00bb   bb:	e8 00 00 00 00       	call   c0 <.altinstr_replacement+0xc0>	bc: R_X86_64_PLT32	xen_error_entry-0x4
00c0   c0:	0f 01 ca             	clac
00c3   c3:	e8 00 00 00 00       	call   c8 <.altinstr_replacement+0xc8>	c4: R_X86_64_PLT32	xen_error_entry-0x4
00c8   c8:	0f 01 ca             	clac
00cb   cb:	0f 01 ca             	clac
00ce   ce:	e8 00 00 00 00       	call   d3 <.altinstr_replacement+0xd3>	cf: R_X86_64_PLT32	xen_error_entry-0x4
00d3   d3:	0f 01 ca             	clac
00d6   d6:	e8 00 00 00 00       	call   db <.altinstr_replacement+0xdb>	d7: R_X86_64_PLT32	xen_error_entry-0x4
00db   db:	0f 01 ca             	clac
00de   de:	e8 00 00 00 00       	call   e3 <.altinstr_replacement+0xe3>	df: R_X86_64_PLT32	xen_error_entry-0x4
00e3   e3:	0f 01 ca             	clac
00e6   e6:	e8 00 00 00 00       	call   eb <.altinstr_replacement+0xeb>	e7: R_X86_64_PLT32	xen_error_entry-0x4
00eb   eb:	0f 01 ca             	clac
00ee   ee:	e8 00 00 00 00       	call   f3 <.altinstr_replacement+0xf3>	ef: R_X86_64_PLT32	xen_error_entry-0x4
00f3   f3:	0f 01 ca             	clac
00f6   f6:	e8 00 00 00 00       	call   fb <.altinstr_replacement+0xfb>	f7: R_X86_64_PLT32	xen_error_entry-0x4
00fb   fb:	0f 01 ca             	clac
00fe   fe:	e8 00 00 00 00       	call   103 <.altinstr_replacement+0x103>	ff: R_X86_64_PLT32	xen_error_entry-0x4
0103  103:	0f 01 ca             	clac
0106  106:	e8 00 00 00 00       	call   10b <.altinstr_replacement+0x10b>	107: R_X86_64_PLT32	xen_error_entry-0x4
010b  10b:	0f 01 ca             	clac
010e  10e:	e8 00 00 00 00       	call   113 <.altinstr_replacement+0x113>	10f: R_X86_64_PLT32	xen_error_entry-0x4
0113  113:	0f 01 ca             	clac
0116  116:	e8 00 00 00 00       	call   11b <.altinstr_replacement+0x11b>	117: R_X86_64_PLT32	xen_error_entry-0x4
011b  11b:	0f 01 ca             	clac
011e  11e:	e8 00 00 00 00       	call   123 <.altinstr_replacement+0x123>	11f: R_X86_64_PLT32	xen_error_entry-0x4
0123  123:	0f 01 ca             	clac
0126  126:	e8 00 00 00 00       	call   12b <.altinstr_replacement+0x12b>	127: R_X86_64_PLT32	xen_error_entry-0x4
012b  12b:	0f 01 ca             	clac
012e  12e:	e8 00 00 00 00       	call   133 <.altinstr_replacement+0x133>	12f: R_X86_64_PLT32	xen_error_entry-0x4
0133  133:	0f 01 ca             	clac
0136  136:	e8 00 00 00 00       	call   13b <.altinstr_replacement+0x13b>	137: R_X86_64_PLT32	xen_error_entry-0x4
013b  13b:	0f 01 ca             	clac
013e  13e:	e8 00 00 00 00       	call   143 <.altinstr_replacement+0x143>	13f: R_X86_64_PLT32	xen_error_entry-0x4
0143  143:	0f 01 ca             	clac
0146  146:	e8 00 00 00 00       	call   14b <.altinstr_replacement+0x14b>	147: R_X86_64_PLT32	xen_error_entry-0x4
014b  14b:	0f 01 ca             	clac
014e  14e:	e8 00 00 00 00       	call   153 <.altinstr_replacement+0x153>	14f: R_X86_64_PLT32	xen_error_entry-0x4
0153  153:	0f ae f0             	mfence
0156  156:	b8 2b 00 00 00       	mov    $0x2b,%eax
015b  15b:	8e e8                	mov    %eax,%gs
015d  15d:	48 0f ba e8 3f       	bts    $0x3f,%rax
0162  162:	0f ae e8             	lfence
0165  165:	0f ae e8             	lfence
0168  168:	48 0f ba e8 3f       	bts    $0x3f,%rax
016d  16d:	0f ae e8             	lfence
0170  170:	0f ae e8             	lfence
0173  173:	48 0f ba e8 3f       	bts    $0x3f,%rax
0178  178:	0f 01 ca             	clac
017b  17b:	0f ae e8             	lfence
017e  17e:	48 0f ba ea 3f       	bts    $0x3f,%rdx
0183  183:	e9 00 00 00 00       	jmp    188 <.altinstr_replacement+0x188>	184: R_X86_64_PLT32	.init.text+0x4bab
0188  188:	48 0f ba e8 3f       	bts    $0x3f,%rax
018d  18d:	e9 00 00 00 00       	jmp    192 <.altinstr_replacement+0x192>	18e: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0192  192:	48 0f ba ec 3f       	bts    $0x3f,%rsp
0197  197:	e9 00 00 00 00       	jmp    19c <.altinstr_replacement+0x19c>	198: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
019c  19c:	0f 01 ca             	clac
019f  19f:	48 0f ba e8 3f       	bts    $0x3f,%rax
01a4  1a4:	e9 00 00 00 00       	jmp    1a9 <.altinstr_replacement+0x1a9>	1a5: R_X86_64_PLT32	.entry.text+0x1ffe
01a9  1a9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01ae  1ae:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01b3  1b3:	0f ae e8             	lfence
01b6  1b6:	0f 31                	rdtsc
01b8  1b8:	0f 01 f9             	rdtscp
01bb  1bb:	0f ae e8             	lfence
01be  1be:	0f 31                	rdtsc
01c0  1c0:	0f 01 f9             	rdtscp
01c3  1c3:	0f ae e8             	lfence
01c6  1c6:	0f 31                	rdtsc
01c8  1c8:	0f 01 f9             	rdtscp
01cb  1cb:	e8 00 00 00 00       	call   1d0 <.altinstr_replacement+0x1d0>	1cc: R_X86_64_PLT32	copy_user_generic_string-0x4
01d0  1d0:	e8 00 00 00 00       	call   1d5 <.altinstr_replacement+0x1d5>	1d1: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
01d5  1d5:	e8 00 00 00 00       	call   1da <.altinstr_replacement+0x1da>	1d6: R_X86_64_PLT32	copy_user_generic_string-0x4
01da  1da:	e8 00 00 00 00       	call   1df <.altinstr_replacement+0x1df>	1db: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
01df  1df:	e8 00 00 00 00       	call   1e4 <.altinstr_replacement+0x1e4>	1e0: R_X86_64_PLT32	copy_user_generic_string-0x4
01e4  1e4:	e8 00 00 00 00       	call   1e9 <.altinstr_replacement+0x1e9>	1e5: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
01e9  1e9:	e8 00 00 00 00       	call   1ee <.altinstr_replacement+0x1ee>	1ea: R_X86_64_PLT32	copy_user_generic_string-0x4
01ee  1ee:	e8 00 00 00 00       	call   1f3 <.altinstr_replacement+0x1f3>	1ef: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
01f3  1f3:	e8 00 00 00 00       	call   1f8 <.altinstr_replacement+0x1f8>	1f4: R_X86_64_PLT32	copy_user_generic_string-0x4
01f8  1f8:	e8 00 00 00 00       	call   1fd <.altinstr_replacement+0x1fd>	1f9: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
01fd  1fd:	e8 00 00 00 00       	call   202 <.altinstr_replacement+0x202>	1fe: R_X86_64_PLT32	copy_user_generic_string-0x4
0202  202:	e8 00 00 00 00       	call   207 <.altinstr_replacement+0x207>	203: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0207  207:	e8 00 00 00 00       	call   20c <.altinstr_replacement+0x20c>	208: R_X86_64_PLT32	copy_user_generic_string-0x4
020c  20c:	e8 00 00 00 00       	call   211 <.altinstr_replacement+0x211>	20d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0211  211:	e8 00 00 00 00       	call   216 <.altinstr_replacement+0x216>	212: R_X86_64_PLT32	copy_user_generic_string-0x4
0216  216:	e8 00 00 00 00       	call   21b <.altinstr_replacement+0x21b>	217: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
021b  21b:	e8 00 00 00 00       	call   220 <.altinstr_replacement+0x220>	21c: R_X86_64_PLT32	copy_user_generic_string-0x4
0220  220:	e8 00 00 00 00       	call   225 <.altinstr_replacement+0x225>	221: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0225  225:	0f ae e8             	lfence
0228  228:	0f 31                	rdtsc
022a  22a:	0f 01 f9             	rdtscp
022d  22d:	e9 00 00 00 00       	jmp    232 <.altinstr_replacement+0x232>	22e: R_X86_64_PLT32	.text+0x48505
0232  232:	e9 00 00 00 00       	jmp    237 <.altinstr_replacement+0x237>	233: R_X86_64_PLT32	.text+0x48546
0237  237:	0f ae e8             	lfence
023a  23a:	0f 31                	rdtsc
023c  23c:	0f 01 f9             	rdtscp
023f  23f:	e9 00 00 00 00       	jmp    244 <.altinstr_replacement+0x244>	240: R_X86_64_PLT32	.text+0x49bcb
0244  244:	0f 01 cb             	stac
0247  247:	0f ae e8             	lfence
024a  24a:	0f 01 ca             	clac
024d  24d:	0f 01 cb             	stac
0250  250:	0f ae e8             	lfence
0253  253:	0f 01 cb             	stac
0256  256:	0f ae e8             	lfence
0259  259:	0f 01 ca             	clac
025c  25c:	0f 01 cb             	stac
025f  25f:	0f ae e8             	lfence
0262  262:	0f 01 ca             	clac
0265  265:	0f 01 cb             	stac
0268  268:	0f ae e8             	lfence
026b  26b:	0f 01 ca             	clac
026e  26e:	0f 01 cb             	stac
0271  271:	0f ae e8             	lfence
0274  274:	0f 01 ca             	clac
0277  277:	0f 01 cb             	stac
027a  27a:	0f ae e8             	lfence
027d  27d:	0f 01 ca             	clac
0280  280:	f3 0f b8 c7          	popcnt %edi,%eax
0284  284:	f3 0f b8 c7          	popcnt %edi,%eax
0288  288:	f3 0f b8 c7          	popcnt %edi,%eax
028c  28c:	f3 0f b8 c7          	popcnt %edi,%eax
0290  290:	f3 0f b8 c7          	popcnt %edi,%eax
0294  294:	f3 0f b8 c7          	popcnt %edi,%eax
0298  298:	f3 0f b8 c7          	popcnt %edi,%eax
029c  29c:	f3 0f b8 c7          	popcnt %edi,%eax
02a0  2a0:	f3 0f b8 c7          	popcnt %edi,%eax
02a4  2a4:	f3 0f b8 c7          	popcnt %edi,%eax
02a8  2a8:	f3 0f b8 c7          	popcnt %edi,%eax
02ac  2ac:	f3 0f b8 c7          	popcnt %edi,%eax
02b0  2b0:	f3 0f b8 c7          	popcnt %edi,%eax
02b4  2b4:	f3 0f b8 c7          	popcnt %edi,%eax
02b8  2b8:	f3 0f b8 c7          	popcnt %edi,%eax
02bc  2bc:	f3 0f b8 c7          	popcnt %edi,%eax
02c0  2c0:	f3 0f b8 c7          	popcnt %edi,%eax
02c4  2c4:	f3 0f b8 c7          	popcnt %edi,%eax
02c8  2c8:	f3 0f b8 c7          	popcnt %edi,%eax
02cc  2cc:	f3 0f b8 c7          	popcnt %edi,%eax
02d0  2d0:	f3 0f b8 c7          	popcnt %edi,%eax
02d4  2d4:	f3 0f b8 c7          	popcnt %edi,%eax
02d8  2d8:	f3 0f b8 c7          	popcnt %edi,%eax
02dc  2dc:	f3 0f b8 c7          	popcnt %edi,%eax
02e0  2e0:	f3 0f b8 c7          	popcnt %edi,%eax
02e4  2e4:	f3 0f b8 c7          	popcnt %edi,%eax
02e8  2e8:	e9 00 00 00 00       	jmp    2ed <.altinstr_replacement+0x2ed>	2e9: R_X86_64_PLT32	.text+0x6aa63
02ed  2ed:	e9 00 00 00 00       	jmp    2f2 <.altinstr_replacement+0x2f2>	2ee: R_X86_64_PLT32	.text+0x6b350
02f2  2f2:	e9 00 00 00 00       	jmp    2f7 <.altinstr_replacement+0x2f7>	2f3: R_X86_64_PLT32	.text+0x6b361
02f7  2f7:	e9 00 00 00 00       	jmp    2fc <.altinstr_replacement+0x2fc>	2f8: R_X86_64_PLT32	.text+0x6b37d
02fc  2fc:	e9 00 00 00 00       	jmp    301 <.altinstr_replacement+0x301>	2fd: R_X86_64_PLT32	.text+0x6af85
0301  301:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0306  306:	f3 48 0f b8 c7       	popcnt %rdi,%rax
030b  30b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0310  310:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0315  315:	0f 01 cb             	stac
0318  318:	0f ae e8             	lfence
031b  31b:	0f 01 ca             	clac
031e  31e:	0f 01 cb             	stac
0321  321:	0f ae e8             	lfence
0324  324:	0f 01 ca             	clac
0327  327:	0f 01 cb             	stac
032a  32a:	0f ae e8             	lfence
032d  32d:	0f 01 ca             	clac
0330  330:	e9 00 00 00 00       	jmp    335 <.altinstr_replacement+0x335>	331: R_X86_64_PLT32	.text+0x9adc7
0335  335:	e9 00 00 00 00       	jmp    33a <.altinstr_replacement+0x33a>	336: R_X86_64_PLT32	.text+0x9b46f
033a  33a:	e9 00 00 00 00       	jmp    33f <.altinstr_replacement+0x33f>	33b: R_X86_64_PLT32	.text+0x9b96a
033f  33f:	e9 00 00 00 00       	jmp    344 <.altinstr_replacement+0x344>	340: R_X86_64_PLT32	.text+0x9b9d6
0344  344:	e9 00 00 00 00       	jmp    349 <.altinstr_replacement+0x349>	345: R_X86_64_PLT32	.text+0x9b8b5
0349  349:	e9 00 00 00 00       	jmp    34e <.altinstr_replacement+0x34e>	34a: R_X86_64_PLT32	.text+0x9bbfc
034e  34e:	e9 00 00 00 00       	jmp    353 <.altinstr_replacement+0x353>	34f: R_X86_64_PLT32	.text+0x9bc41
0353  353:	0f 01 cb             	stac
0356  356:	0f ae e8             	lfence
0359  359:	0f 01 ca             	clac
035c  35c:	0f 01 ca             	clac
035f  35f:	e9 00 00 00 00       	jmp    364 <.altinstr_replacement+0x364>	360: R_X86_64_PLT32	.noinstr.text+0x697
0364  364:	e9 00 00 00 00       	jmp    369 <.altinstr_replacement+0x369>	365: R_X86_64_PLT32	.noinstr.text+0xd20
0369  369:	e9 00 00 00 00       	jmp    36e <.altinstr_replacement+0x36e>	36a: R_X86_64_PLT32	.noinstr.text+0x137a
036e  36e:	e9 00 00 00 00       	jmp    373 <.altinstr_replacement+0x373>	36f: R_X86_64_PLT32	.text+0x9d69d
0373  373:	e9 00 00 00 00       	jmp    378 <.altinstr_replacement+0x378>	374: R_X86_64_PLT32	.init.text+0x6425
0378  378:	e9 00 00 00 00       	jmp    37d <.altinstr_replacement+0x37d>	379: R_X86_64_PLT32	.noinstr.text+0x1d5d
037d  37d:	0f 01 cb             	stac
0380  380:	0f ae e8             	lfence
0383  383:	0f 01 ca             	clac
0386  386:	0f 01 ca             	clac
0389  389:	0f 01 cb             	stac
038c  38c:	0f ae e8             	lfence
038f  38f:	0f 01 ca             	clac
0392  392:	0f 01 ca             	clac
0395  395:	0f 01 cb             	stac
0398  398:	0f ae e8             	lfence
039b  39b:	e9 00 00 00 00       	jmp    3a0 <.altinstr_replacement+0x3a0>	39c: R_X86_64_PLT32	.text+0xa50d8
03a0  3a0:	0f 01 ca             	clac
03a3  3a3:	0f 01 ca             	clac
03a6  3a6:	e9 00 00 00 00       	jmp    3ab <.altinstr_replacement+0x3ab>	3a7: R_X86_64_PLT32	.text+0xa766c
03ab  3ab:	e9 00 00 00 00       	jmp    3b0 <.altinstr_replacement+0x3b0>	3ac: R_X86_64_PLT32	.text+0xa7759
03b0  3b0:	e9 00 00 00 00       	jmp    3b5 <.altinstr_replacement+0x3b5>	3b1: R_X86_64_PLT32	.text+0xa7d21
03b5  3b5:	e9 00 00 00 00       	jmp    3ba <.altinstr_replacement+0x3ba>	3b6: R_X86_64_PLT32	.text+0xa847f
03ba  3ba:	e9 00 00 00 00       	jmp    3bf <.altinstr_replacement+0x3bf>	3bb: R_X86_64_PLT32	.text+0xa8d4d
03bf  3bf:	0f ae e8             	lfence
03c2  3c2:	0f 31                	rdtsc
03c4  3c4:	0f 01 f9             	rdtscp
03c7  3c7:	e9 00 00 00 00       	jmp    3cc <.altinstr_replacement+0x3cc>	3c8: R_X86_64_PLT32	.text+0xac76d
03cc  3cc:	e9 00 00 00 00       	jmp    3d1 <.altinstr_replacement+0x3d1>	3cd: R_X86_64_PLT32	.text+0xac871
03d1  3d1:	e9 00 00 00 00       	jmp    3d6 <.altinstr_replacement+0x3d6>	3d2: R_X86_64_PLT32	.text+0xac8c3
03d6  3d6:	e9 00 00 00 00       	jmp    3db <.altinstr_replacement+0x3db>	3d7: R_X86_64_PLT32	.text+0xac87c
03db  3db:	e9 00 00 00 00       	jmp    3e0 <.altinstr_replacement+0x3e0>	3dc: R_X86_64_PLT32	.text+0xac73f
03e0  3e0:	e9 00 00 00 00       	jmp    3e5 <.altinstr_replacement+0x3e5>	3e1: R_X86_64_PLT32	.text+0xad1f4
03e5  3e5:	e9 00 00 00 00       	jmp    3ea <.altinstr_replacement+0x3ea>	3e6: R_X86_64_PLT32	.text+0xad29b
03ea  3ea:	e9 00 00 00 00       	jmp    3ef <.altinstr_replacement+0x3ef>	3eb: R_X86_64_PLT32	.text+0xad40f
03ef  3ef:	e9 00 00 00 00       	jmp    3f4 <.altinstr_replacement+0x3f4>	3f0: R_X86_64_PLT32	.text+0xad4ce
03f4  3f4:	e9 00 00 00 00       	jmp    3f9 <.altinstr_replacement+0x3f9>	3f5: R_X86_64_PLT32	.text+0xad445
03f9  3f9:	e9 00 00 00 00       	jmp    3fe <.altinstr_replacement+0x3fe>	3fa: R_X86_64_PLT32	.text+0xad486
03fe  3fe:	e9 00 00 00 00       	jmp    403 <.altinstr_replacement+0x403>	3ff: R_X86_64_PLT32	.text+0xad41a
0403  403:	e9 00 00 00 00       	jmp    408 <.altinstr_replacement+0x408>	404: R_X86_64_PLT32	.text+0xad11f
0408  408:	e9 00 00 00 00       	jmp    40d <.altinstr_replacement+0x40d>	409: R_X86_64_PLT32	.text+0xad450
040d  40d:	e9 00 00 00 00       	jmp    412 <.altinstr_replacement+0x412>	40e: R_X86_64_PLT32	.text+0xad1b9
0412  412:	e9 00 00 00 00       	jmp    417 <.altinstr_replacement+0x417>	413: R_X86_64_PLT32	.text+0xae396
0417  417:	48 0f ae 37          	xsaveopt64 (%rdi)
041b  41b:	48 0f c7 27          	xsavec64 (%rdi)
041f  41f:	48 0f c7 2f          	xsaves64 (%rdi)
0423  423:	e9 00 00 00 00       	jmp    428 <.altinstr_replacement+0x428>	424: R_X86_64_PLT32	.text+0xae48e
0428  428:	e9 00 00 00 00       	jmp    42d <.altinstr_replacement+0x42d>	429: R_X86_64_PLT32	.text+0xae4a9
042d  42d:	48 0f c7 1f          	xrstors64 (%rdi)
0431  431:	e9 00 00 00 00       	jmp    436 <.altinstr_replacement+0x436>	432: R_X86_64_PLT32	.text+0xae571
0436  436:	e9 00 00 00 00       	jmp    43b <.altinstr_replacement+0x43b>	437: R_X86_64_PLT32	.text+0xae6a1
043b  43b:	e9 00 00 00 00       	jmp    440 <.altinstr_replacement+0x440>	43c: R_X86_64_PLT32	.text+0xaeb29
0440  440:	e9 00 00 00 00       	jmp    445 <.altinstr_replacement+0x445>	441: R_X86_64_PLT32	.text+0xaec0c
0445  445:	e9 00 00 00 00       	jmp    44a <.altinstr_replacement+0x44a>	446: R_X86_64_PLT32	.text+0xaf4ef
044a  44a:	e9 00 00 00 00       	jmp    44f <.altinstr_replacement+0x44f>	44b: R_X86_64_PLT32	.text+0xaf30f
044f  44f:	48 0f c7 1f          	xrstors64 (%rdi)
0453  453:	e9 00 00 00 00       	jmp    458 <.altinstr_replacement+0x458>	454: R_X86_64_PLT32	.text+0xaf964
0458  458:	48 0f c7 1f          	xrstors64 (%rdi)
045c  45c:	e9 00 00 00 00       	jmp    461 <.altinstr_replacement+0x461>	45d: R_X86_64_PLT32	.text+0xafaea
0461  461:	e9 00 00 00 00       	jmp    466 <.altinstr_replacement+0x466>	462: R_X86_64_PLT32	.text+0xafd72
0466  466:	e9 00 00 00 00       	jmp    46b <.altinstr_replacement+0x46b>	467: R_X86_64_PLT32	.text+0xaff58
046b  46b:	e9 00 00 00 00       	jmp    470 <.altinstr_replacement+0x470>	46c: R_X86_64_PLT32	.text+0xb0226
0470  470:	e8 00 00 00 00       	call   475 <.altinstr_replacement+0x475>	471: R_X86_64_PLT32	copy_user_generic_string-0x4
0475  475:	e8 00 00 00 00       	call   47a <.altinstr_replacement+0x47a>	476: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
047a  47a:	e9 00 00 00 00       	jmp    47f <.altinstr_replacement+0x47f>	47b: R_X86_64_PLT32	.text+0xb038b
047f  47f:	e9 00 00 00 00       	jmp    484 <.altinstr_replacement+0x484>	480: R_X86_64_PLT32	.text+0xb0471
0484  484:	e9 00 00 00 00       	jmp    489 <.altinstr_replacement+0x489>	485: R_X86_64_PLT32	.text+0xb0943
0489  489:	e9 00 00 00 00       	jmp    48e <.altinstr_replacement+0x48e>	48a: R_X86_64_PLT32	.text+0xb0aa5
048e  48e:	e9 00 00 00 00       	jmp    493 <.altinstr_replacement+0x493>	48f: R_X86_64_PLT32	.text+0xb0bd7
0493  493:	0f 01 cb             	stac
0496  496:	e8 00 00 00 00       	call   49b <.altinstr_replacement+0x49b>	497: R_X86_64_PLT32	clear_user_erms-0x4
049b  49b:	e8 00 00 00 00       	call   4a0 <.altinstr_replacement+0x4a0>	49c: R_X86_64_PLT32	clear_user_rep_good-0x4
04a0  4a0:	e8 00 00 00 00       	call   4a5 <.altinstr_replacement+0x4a5>	4a1: R_X86_64_PLT32	clear_user_original-0x4
04a5  4a5:	0f 01 ca             	clac
04a8  4a8:	e9 00 00 00 00       	jmp    4ad <.altinstr_replacement+0x4ad>	4a9: R_X86_64_PLT32	.text+0xb0e30
04ad  4ad:	0f 01 cb             	stac
04b0  4b0:	0f 01 ca             	clac
04b3  4b3:	0f 01 cb             	stac
04b6  4b6:	e8 00 00 00 00       	call   4bb <.altinstr_replacement+0x4bb>	4b7: R_X86_64_PLT32	clear_user_erms-0x4
04bb  4bb:	e8 00 00 00 00       	call   4c0 <.altinstr_replacement+0x4c0>	4bc: R_X86_64_PLT32	clear_user_rep_good-0x4
04c0  4c0:	e8 00 00 00 00       	call   4c5 <.altinstr_replacement+0x4c5>	4c1: R_X86_64_PLT32	clear_user_original-0x4
04c5  4c5:	0f 01 ca             	clac
04c8  4c8:	0f 01 cb             	stac
04cb  4cb:	0f 01 ca             	clac
04ce  4ce:	e8 00 00 00 00       	call   4d3 <.altinstr_replacement+0x4d3>	4cf: R_X86_64_PLT32	copy_user_generic_string-0x4
04d3  4d3:	e8 00 00 00 00       	call   4d8 <.altinstr_replacement+0x4d8>	4d4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04d8  4d8:	e8 00 00 00 00       	call   4dd <.altinstr_replacement+0x4dd>	4d9: R_X86_64_PLT32	copy_user_generic_string-0x4
04dd  4dd:	e8 00 00 00 00       	call   4e2 <.altinstr_replacement+0x4e2>	4de: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04e2  4e2:	e9 00 00 00 00       	jmp    4e7 <.altinstr_replacement+0x4e7>	4e3: R_X86_64_PLT32	.text+0xb1012
04e7  4e7:	e9 00 00 00 00       	jmp    4ec <.altinstr_replacement+0x4ec>	4e8: R_X86_64_PLT32	.text+0xb1095
04ec  4ec:	e9 00 00 00 00       	jmp    4f1 <.altinstr_replacement+0x4f1>	4ed: R_X86_64_PLT32	.text+0xb17c4
04f1  4f1:	e8 00 00 00 00       	call   4f6 <.altinstr_replacement+0x4f6>	4f2: R_X86_64_PLT32	copy_user_generic_string-0x4
04f6  4f6:	e8 00 00 00 00       	call   4fb <.altinstr_replacement+0x4fb>	4f7: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04fb  4fb:	e8 00 00 00 00       	call   500 <.altinstr_replacement+0x500>	4fc: R_X86_64_PLT32	copy_user_generic_string-0x4
0500  500:	e8 00 00 00 00       	call   505 <.altinstr_replacement+0x505>	501: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0505  505:	48 0f ae 37          	xsaveopt64 (%rdi)
0509  509:	48 0f c7 27          	xsavec64 (%rdi)
050d  50d:	48 0f c7 2f          	xsaves64 (%rdi)
0511  511:	e9 00 00 00 00       	jmp    516 <.altinstr_replacement+0x516>	512: R_X86_64_PLT32	.text+0xb150f
0516  516:	e8 00 00 00 00       	call   51b <.altinstr_replacement+0x51b>	517: R_X86_64_PLT32	copy_user_generic_string-0x4
051b  51b:	e8 00 00 00 00       	call   520 <.altinstr_replacement+0x520>	51c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0520  520:	e9 00 00 00 00       	jmp    525 <.altinstr_replacement+0x525>	521: R_X86_64_PLT32	.text+0xb174d
0525  525:	48 0f c7 1f          	xrstors64 (%rdi)
0529  529:	e9 00 00 00 00       	jmp    52e <.altinstr_replacement+0x52e>	52a: R_X86_64_PLT32	.text+0xb17e7
052e  52e:	e9 00 00 00 00       	jmp    533 <.altinstr_replacement+0x533>	52f: R_X86_64_PLT32	.text+0xb181b
0533  533:	e9 00 00 00 00       	jmp    538 <.altinstr_replacement+0x538>	534: R_X86_64_PLT32	.init.text+0xbd4f
0538  538:	e9 00 00 00 00       	jmp    53d <.altinstr_replacement+0x53d>	539: R_X86_64_PLT32	.text+0xb197f
053d  53d:	e9 00 00 00 00       	jmp    542 <.altinstr_replacement+0x542>	53e: R_X86_64_PLT32	.text+0xb1ab7
0542  542:	0f 01 cb             	stac
0545  545:	0f 01 ca             	clac
0548  548:	0f 01 cb             	stac
054b  54b:	0f 01 ca             	clac
054e  54e:	48 0f c7 1f          	xrstors64 (%rdi)
0552  552:	0f 01 cb             	stac
0555  555:	0f 01 ca             	clac
0558  558:	e9 00 00 00 00       	jmp    55d <.altinstr_replacement+0x55d>	559: R_X86_64_PLT32	.text+0xb1c58
055d  55d:	e9 00 00 00 00       	jmp    562 <.altinstr_replacement+0x562>	55e: R_X86_64_PLT32	.text+0xb1cbd
0562  562:	e9 00 00 00 00       	jmp    567 <.altinstr_replacement+0x567>	563: R_X86_64_PLT32	.init.text+0xbfd1
0567  567:	e9 00 00 00 00       	jmp    56c <.altinstr_replacement+0x56c>	568: R_X86_64_PLT32	.init.text+0xbfea
056c  56c:	e9 00 00 00 00       	jmp    571 <.altinstr_replacement+0x571>	56d: R_X86_64_PLT32	.init.text+0xbff8
0571  571:	e9 00 00 00 00       	jmp    576 <.altinstr_replacement+0x576>	572: R_X86_64_PLT32	.init.text+0xbee9
0576  576:	e9 00 00 00 00       	jmp    57b <.altinstr_replacement+0x57b>	577: R_X86_64_PLT32	.init.text+0xc341
057b  57b:	e9 00 00 00 00       	jmp    580 <.altinstr_replacement+0x580>	57c: R_X86_64_PLT32	.init.text+0xc3ab
0580  580:	e9 00 00 00 00       	jmp    585 <.altinstr_replacement+0x585>	581: R_X86_64_PLT32	.text+0xb1d9c
0585  585:	e9 00 00 00 00       	jmp    58a <.altinstr_replacement+0x58a>	586: R_X86_64_PLT32	.text+0xb1de8
058a  58a:	e9 00 00 00 00       	jmp    58f <.altinstr_replacement+0x58f>	58b: R_X86_64_PLT32	.text+0xb1e30
058f  58f:	e9 00 00 00 00       	jmp    594 <.altinstr_replacement+0x594>	590: R_X86_64_PLT32	.text+0xb1fef
0594  594:	e9 00 00 00 00       	jmp    599 <.altinstr_replacement+0x599>	595: R_X86_64_PLT32	.text+0xb2bfd
0599  599:	e9 00 00 00 00       	jmp    59e <.altinstr_replacement+0x59e>	59a: R_X86_64_PLT32	.text+0xb2c08
059e  59e:	e9 00 00 00 00       	jmp    5a3 <.altinstr_replacement+0x5a3>	59f: R_X86_64_PLT32	.text+0xb31fd
05a3  5a3:	e9 00 00 00 00       	jmp    5a8 <.altinstr_replacement+0x5a8>	5a4: R_X86_64_PLT32	.text+0xb35e0
05a8  5a8:	e9 00 00 00 00       	jmp    5ad <.altinstr_replacement+0x5ad>	5a9: R_X86_64_PLT32	.init.text+0xc6f6
05ad  5ad:	e9 00 00 00 00       	jmp    5b2 <.altinstr_replacement+0x5b2>	5ae: R_X86_64_PLT32	.init.text+0xc999
05b2  5b2:	e9 00 00 00 00       	jmp    5b7 <.altinstr_replacement+0x5b7>	5b3: R_X86_64_PLT32	.init.text+0xc9a4
05b7  5b7:	e9 00 00 00 00       	jmp    5bc <.altinstr_replacement+0x5bc>	5b8: R_X86_64_PLT32	.text+0xb379e
05bc  5bc:	e9 00 00 00 00       	jmp    5c1 <.altinstr_replacement+0x5c1>	5bd: R_X86_64_PLT32	.init.text+0xd497
05c1  5c1:	e9 00 00 00 00       	jmp    5c6 <.altinstr_replacement+0x5c6>	5c2: R_X86_64_PLT32	.text+0xb3c5f
05c6  5c6:	e8 00 00 00 00       	call   5cb <.altinstr_replacement+0x5cb>	5c7: R_X86_64_PLT32	copy_user_generic_string-0x4
05cb  5cb:	e8 00 00 00 00       	call   5d0 <.altinstr_replacement+0x5d0>	5cc: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
05d0  5d0:	e9 00 00 00 00       	jmp    5d5 <.altinstr_replacement+0x5d5>	5d1: R_X86_64_PLT32	.text+0xb831f
05d5  5d5:	e9 00 00 00 00       	jmp    5da <.altinstr_replacement+0x5da>	5d6: R_X86_64_PLT32	.text+0xb8303
05da  5da:	e9 00 00 00 00       	jmp    5df <.altinstr_replacement+0x5df>	5db: R_X86_64_PLT32	.text+0xb8327
05df  5df:	e9 00 00 00 00       	jmp    5e4 <.altinstr_replacement+0x5e4>	5e0: R_X86_64_PLT32	.text+0xb832d
05e4  5e4:	e9 00 00 00 00       	jmp    5e9 <.altinstr_replacement+0x5e9>	5e5: R_X86_64_PLT32	.text+0xb8382
05e9  5e9:	e9 00 00 00 00       	jmp    5ee <.altinstr_replacement+0x5ee>	5ea: R_X86_64_PLT32	.text+0xb8372
05ee  5ee:	e9 00 00 00 00       	jmp    5f3 <.altinstr_replacement+0x5f3>	5ef: R_X86_64_PLT32	.text+0xb84cb
05f3  5f3:	e9 00 00 00 00       	jmp    5f8 <.altinstr_replacement+0x5f8>	5f4: R_X86_64_PLT32	.text+0xb84a7
05f8  5f8:	e9 00 00 00 00       	jmp    5fd <.altinstr_replacement+0x5fd>	5f9: R_X86_64_PLT32	.text+0xb8e9e
05fd  5fd:	e9 00 00 00 00       	jmp    602 <.altinstr_replacement+0x602>	5fe: R_X86_64_PLT32	.text+0xb8f2d
0602  602:	e9 00 00 00 00       	jmp    607 <.altinstr_replacement+0x607>	603: R_X86_64_PLT32	.text+0xb8f67
0607  607:	e9 00 00 00 00       	jmp    60c <.altinstr_replacement+0x60c>	608: R_X86_64_PLT32	.init.text+0xd9a1
060c  60c:	e9 00 00 00 00       	jmp    611 <.altinstr_replacement+0x611>	60d: R_X86_64_PLT32	.text+0xb9d9c
0611  611:	e9 00 00 00 00       	jmp    616 <.altinstr_replacement+0x616>	612: R_X86_64_PLT32	.text+0xbb0e2
0616  616:	e9 00 00 00 00       	jmp    61b <.altinstr_replacement+0x61b>	617: R_X86_64_PLT32	.text+0xbb1c0
061b  61b:	e9 00 00 00 00       	jmp    620 <.altinstr_replacement+0x620>	61c: R_X86_64_PLT32	.text+0xbb1cb
0620  620:	e9 00 00 00 00       	jmp    625 <.altinstr_replacement+0x625>	621: R_X86_64_PLT32	.text+0xbb1a8
0625  625:	e9 00 00 00 00       	jmp    62a <.altinstr_replacement+0x62a>	626: R_X86_64_PLT32	.init.text+0xf7fc
062a  62a:	e9 00 00 00 00       	jmp    62f <.altinstr_replacement+0x62f>	62b: R_X86_64_PLT32	.init.text+0xf807
062f  62f:	e9 00 00 00 00       	jmp    634 <.altinstr_replacement+0x634>	630: R_X86_64_PLT32	.text+0xbc7b8
0634  634:	e9 00 00 00 00       	jmp    639 <.altinstr_replacement+0x639>	635: R_X86_64_PLT32	.text+0xbc8c6
0639  639:	e9 00 00 00 00       	jmp    63e <.altinstr_replacement+0x63e>	63a: R_X86_64_PLT32	.init.text+0xf9b3
063e  63e:	e9 00 00 00 00       	jmp    643 <.altinstr_replacement+0x643>	63f: R_X86_64_PLT32	.text+0xbc9ae
0643  643:	0f 01 c1             	vmcall
0646  646:	0f 01 d9             	vmmcall
0649  649:	0f 01 c1             	vmcall
064c  64c:	0f 01 d9             	vmmcall
064f  64f:	0f 01 c1             	vmcall
0652  652:	0f 01 d9             	vmmcall
0655  655:	0f 01 c1             	vmcall
0658  658:	0f 01 d9             	vmmcall
065b  65b:	e9 00 00 00 00       	jmp    660 <.altinstr_replacement+0x660>	65c: R_X86_64_PLT32	.text+0xbebb5
0660  660:	e9 00 00 00 00       	jmp    665 <.altinstr_replacement+0x665>	661: R_X86_64_PLT32	.text+0xbeb2f
0665  665:	f3 48 0f b8 c7       	popcnt %rdi,%rax
066a  66a:	e9 00 00 00 00       	jmp    66f <.altinstr_replacement+0x66f>	66b: R_X86_64_PLT32	.init.text+0x14266
066f  66f:	e9 00 00 00 00       	jmp    674 <.altinstr_replacement+0x674>	670: R_X86_64_PLT32	.init.text+0x145d4
0674  674:	0f ae e8             	lfence
0677  677:	0f 31                	rdtsc
0679  679:	0f 01 f9             	rdtscp
067c  67c:	0f ae e8             	lfence
067f  67f:	0f 31                	rdtsc
0681  681:	0f 01 f9             	rdtscp
0684  684:	87 2c 25 00 c3 5f ff 	xchg   %ebp,0xffffffffff5fc300
068b  68b:	87 2c 25 10 c3 5f ff 	xchg   %ebp,0xffffffffff5fc310
0692  692:	87 1c 25 00 c3 5f ff 	xchg   %ebx,0xffffffffff5fc300
0699  699:	87 2c 25 10 c3 5f ff 	xchg   %ebp,0xffffffffff5fc310
06a0  6a0:	87 1c 25 00 c3 5f ff 	xchg   %ebx,0xffffffffff5fc300
06a7  6a7:	87 1c 25 10 c3 5f ff 	xchg   %ebx,0xffffffffff5fc310
06ae  6ae:	87 04 25 00 c3 5f ff 	xchg   %eax,0xffffffffff5fc300
06b5  6b5:	87 1c 25 10 c3 5f ff 	xchg   %ebx,0xffffffffff5fc310
06bc  6bc:	87 04 25 00 c3 5f ff 	xchg   %eax,0xffffffffff5fc300
06c3  6c3:	87 1c 25 00 c3 5f ff 	xchg   %ebx,0xffffffffff5fc300
06ca  6ca:	87 1c 25 00 c3 5f ff 	xchg   %ebx,0xffffffffff5fc300
06d1  6d1:	87 1c 25 00 c3 5f ff 	xchg   %ebx,0xffffffffff5fc300
06d8  6d8:	87 b0 00 c0 5f ff    	xchg   %esi,-0xa04000(%rax)
06de  6de:	0f ae e8             	lfence
06e1  6e1:	0f 31                	rdtsc
06e3  6e3:	0f 01 f9             	rdtscp
06e6  6e6:	e8 00 00 00 00       	call   6eb <.altinstr_replacement+0x6eb>	6e7: R_X86_64_PLT32	clear_page_rep-0x4
06eb  6eb:	e8 00 00 00 00       	call   6f0 <.altinstr_replacement+0x6f0>	6ec: R_X86_64_PLT32	clear_page_erms-0x4
06f0  6f0:	e8 00 00 00 00       	call   6f5 <.altinstr_replacement+0x6f5>	6f1: R_X86_64_PLT32	clear_page_rep-0x4
06f5  6f5:	e8 00 00 00 00       	call   6fa <.altinstr_replacement+0x6fa>	6f6: R_X86_64_PLT32	clear_page_erms-0x4
06fa  6fa:	e9 00 00 00 00       	jmp    6ff <.altinstr_replacement+0x6ff>	6fb: R_X86_64_PLT32	.text+0xcf698
06ff  6ff:	e9 00 00 00 00       	jmp    704 <.altinstr_replacement+0x704>	700: R_X86_64_PLT32	.init.text+0x1af78
0704  704:	0f 01 d9             	vmmcall
0707  707:	0f 01 d9             	vmmcall
070a  70a:	0f ae e8             	lfence
070d  70d:	0f 31                	rdtsc
070f  70f:	0f 01 f9             	rdtscp
0712  712:	e8 00 00 00 00       	call   717 <.altinstr_replacement+0x717>	713: R_X86_64_PLT32	clear_page_rep-0x4
0717  717:	e8 00 00 00 00       	call   71c <.altinstr_replacement+0x71c>	718: R_X86_64_PLT32	clear_page_erms-0x4
071c  71c:	e9 00 00 00 00       	jmp    721 <.altinstr_replacement+0x721>	71d: R_X86_64_PLT32	.init.text+0x1cdca
0721  721:	e9 00 00 00 00       	jmp    726 <.altinstr_replacement+0x726>	722: R_X86_64_PLT32	.text+0xda7ab
0726  726:	e9 00 00 00 00       	jmp    72b <.altinstr_replacement+0x72b>	727: R_X86_64_PLT32	.ref.text+0xa51
072b  72b:	e9 00 00 00 00       	jmp    730 <.altinstr_replacement+0x730>	72c: R_X86_64_PLT32	.text+0xdaa38
0730  730:	e9 00 00 00 00       	jmp    735 <.altinstr_replacement+0x735>	731: R_X86_64_PLT32	.text+0xdaaf7
0735  735:	e9 00 00 00 00       	jmp    73a <.altinstr_replacement+0x73a>	736: R_X86_64_PLT32	.text+0xdabef
073a  73a:	e9 00 00 00 00       	jmp    73f <.altinstr_replacement+0x73f>	73b: R_X86_64_PLT32	.init.text+0x1d7fa
073f  73f:	e9 00 00 00 00       	jmp    744 <.altinstr_replacement+0x744>	740: R_X86_64_PLT32	.text+0xdb743
0744  744:	e9 00 00 00 00       	jmp    749 <.altinstr_replacement+0x749>	745: R_X86_64_PLT32	.text+0xdb775
0749  749:	e9 00 00 00 00       	jmp    74e <.altinstr_replacement+0x74e>	74a: R_X86_64_PLT32	.text+0xdb86a
074e  74e:	e9 00 00 00 00       	jmp    753 <.altinstr_replacement+0x753>	74f: R_X86_64_PLT32	.text+0xdc207
0753  753:	0f 0d 88 f8 00 00 00 	prefetchw 0xf8(%rax)
075a  75a:	e9 00 00 00 00       	jmp    75f <.altinstr_replacement+0x75f>	75b: R_X86_64_PLT32	.text+0xde341
075f  75f:	e9 00 00 00 00       	jmp    764 <.altinstr_replacement+0x764>	760: R_X86_64_PLT32	.text+0xdfbc5
0764  764:	0f 30                	wrmsr
0766  766:	e9 00 00 00 00       	jmp    76b <.altinstr_replacement+0x76b>	767: R_X86_64_PLT32	.text+0xe0152
076b  76b:	e9 00 00 00 00       	jmp    770 <.altinstr_replacement+0x770>	76c: R_X86_64_PLT32	.text+0xe0152
0770  770:	e9 00 00 00 00       	jmp    775 <.altinstr_replacement+0x775>	771: R_X86_64_PLT32	.text+0xe039f
0775  775:	0f 30                	wrmsr
0777  777:	e9 00 00 00 00       	jmp    77c <.altinstr_replacement+0x77c>	778: R_X86_64_PLT32	.text+0xe0577
077c  77c:	e9 00 00 00 00       	jmp    781 <.altinstr_replacement+0x781>	77d: R_X86_64_PLT32	.text+0xe0889
0781  781:	e9 00 00 00 00       	jmp    786 <.altinstr_replacement+0x786>	782: R_X86_64_PLT32	.text+0xe0fea
0786  786:	e9 00 00 00 00       	jmp    78b <.altinstr_replacement+0x78b>	787: R_X86_64_PLT32	.text+0xe1090
078b  78b:	e9 00 00 00 00       	jmp    790 <.altinstr_replacement+0x790>	78c: R_X86_64_PLT32	.text+0xe1117
0790  790:	e9 00 00 00 00       	jmp    795 <.altinstr_replacement+0x795>	791: R_X86_64_PLT32	.text+0xe11f3
0795  795:	e9 00 00 00 00       	jmp    79a <.altinstr_replacement+0x79a>	796: R_X86_64_PLT32	.text+0xe11f3
079a  79a:	e9 00 00 00 00       	jmp    79f <.altinstr_replacement+0x79f>	79b: R_X86_64_PLT32	.text+0xe11f3
079f  79f:	e9 00 00 00 00       	jmp    7a4 <.altinstr_replacement+0x7a4>	7a0: R_X86_64_PLT32	.text+0xe1232
07a4  7a4:	e9 00 00 00 00       	jmp    7a9 <.altinstr_replacement+0x7a9>	7a5: R_X86_64_PLT32	.text+0xe130f
07a9  7a9:	e9 00 00 00 00       	jmp    7ae <.altinstr_replacement+0x7ae>	7aa: R_X86_64_PLT32	.text+0xe130f
07ae  7ae:	e9 00 00 00 00       	jmp    7b3 <.altinstr_replacement+0x7b3>	7af: R_X86_64_PLT32	.text+0xe1729
07b3  7b3:	66 0f ae 39          	clflushopt (%rcx)
07b7  7b7:	66 0f ae 39          	clflushopt (%rcx)
07bb  7bb:	e9 00 00 00 00       	jmp    7c0 <.altinstr_replacement+0x7c0>	7bc: R_X86_64_PLT32	.text+0xe1c0a
07c0  7c0:	e9 00 00 00 00       	jmp    7c5 <.altinstr_replacement+0x7c5>	7c1: R_X86_64_PLT32	.text+0xe1cac
07c5  7c5:	e9 00 00 00 00       	jmp    7ca <.altinstr_replacement+0x7ca>	7c6: R_X86_64_PLT32	.text+0xe461c
07ca  7ca:	66 0f ae 39          	clflushopt (%rcx)
07ce  7ce:	e9 00 00 00 00       	jmp    7d3 <.altinstr_replacement+0x7d3>	7cf: R_X86_64_PLT32	.text+0xe4dc4
07d3  7d3:	e9 00 00 00 00       	jmp    7d8 <.altinstr_replacement+0x7d8>	7d4: R_X86_64_PLT32	.init.text+0x1e9ee
07d8  7d8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07dd  7dd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07e2  7e2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07e7  7e7:	e9 00 00 00 00       	jmp    7ec <.altinstr_replacement+0x7ec>	7e8: R_X86_64_PLT32	.text+0xe7e06
07ec  7ec:	e9 00 00 00 00       	jmp    7f1 <.altinstr_replacement+0x7f1>	7ed: R_X86_64_PLT32	.text+0xe822e
07f1  7f1:	0f 01 cb             	stac
07f4  7f4:	0f ae e8             	lfence
07f7  7f7:	0f 01 ca             	clac
07fa  7fa:	0f 01 ca             	clac
07fd  7fd:	0f 01 cb             	stac
0800  800:	0f ae e8             	lfence
0803  803:	0f 01 ca             	clac
0806  806:	0f 01 ca             	clac
0809  809:	0f 01 cb             	stac
080c  80c:	e8 00 00 00 00       	call   811 <.altinstr_replacement+0x811>	80d: R_X86_64_PLT32	clear_user_erms-0x4
0811  811:	e8 00 00 00 00       	call   816 <.altinstr_replacement+0x816>	812: R_X86_64_PLT32	clear_user_rep_good-0x4
0816  816:	e8 00 00 00 00       	call   81b <.altinstr_replacement+0x81b>	817: R_X86_64_PLT32	clear_user_original-0x4
081b  81b:	0f 01 ca             	clac
081e  81e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0823  823:	e9 00 00 00 00       	jmp    828 <.altinstr_replacement+0x828>	824: R_X86_64_PLT32	.text+0x1f601e
0828  828:	e9 00 00 00 00       	jmp    82d <.altinstr_replacement+0x82d>	829: R_X86_64_PLT32	.text+0x1f6037
082d  82d:	e9 00 00 00 00       	jmp    832 <.altinstr_replacement+0x832>	82e: R_X86_64_PLT32	.text+0x23c650
0832  832:	e9 00 00 00 00       	jmp    837 <.altinstr_replacement+0x837>	833: R_X86_64_PLT32	.text+0x23c661
0837  837:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
083b  83b:	0f 01 cb             	stac
083e  83e:	0f ae e8             	lfence
0841  841:	0f 01 ca             	clac
0844  844:	0f 01 cb             	stac
0847  847:	0f ae e8             	lfence
084a  84a:	0f 01 ca             	clac
084d  84d:	0f 01 ca             	clac
0850  850:	0f 01 ca             	clac
0853  853:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0858  858:	e8 00 00 00 00       	call   85d <.altinstr_replacement+0x85d>	859: R_X86_64_PLT32	clear_page_rep-0x4
085d  85d:	e8 00 00 00 00       	call   862 <.altinstr_replacement+0x862>	85e: R_X86_64_PLT32	clear_page_erms-0x4
0862  862:	e8 00 00 00 00       	call   867 <.altinstr_replacement+0x867>	863: R_X86_64_PLT32	clear_page_rep-0x4
0867  867:	e8 00 00 00 00       	call   86c <.altinstr_replacement+0x86c>	868: R_X86_64_PLT32	clear_page_erms-0x4
086c  86c:	0f 01 cb             	stac
086f  86f:	0f ae e8             	lfence
0872  872:	0f 01 ca             	clac
0875  875:	0f 01 ca             	clac
0878  878:	0f 01 cb             	stac
087b  87b:	0f ae e8             	lfence
087e  87e:	0f 01 ca             	clac
0881  881:	0f 01 ca             	clac
0884  884:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0889  889:	f3 48 0f b8 c7       	popcnt %rdi,%rax
088e  88e:	e8 00 00 00 00       	call   893 <.altinstr_replacement+0x893>	88f: R_X86_64_PLT32	copy_user_generic_string-0x4
0893  893:	e8 00 00 00 00       	call   898 <.altinstr_replacement+0x898>	894: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0898  898:	e8 00 00 00 00       	call   89d <.altinstr_replacement+0x89d>	899: R_X86_64_PLT32	copy_user_generic_string-0x4
089d  89d:	e8 00 00 00 00       	call   8a2 <.altinstr_replacement+0x8a2>	89e: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08a2  8a2:	9c                   	pushf
08a3  8a3:	8f 04 24             	pop    (%rsp)
08a6  8a6:	0f 01 ca             	clac
08a9  8a9:	ff 74 24 38          	push   0x38(%rsp)
08ad  8ad:	9d                   	popf
08ae  8ae:	0f ae e8             	lfence
08b1  8b1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08b6  8b6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08bb  8bb:	0f 01 cb             	stac
08be  8be:	0f ae e8             	lfence
08c1  8c1:	0f 01 ca             	clac
08c4  8c4:	0f 01 ca             	clac
08c7  8c7:	e8 00 00 00 00       	call   8cc <.altinstr_replacement+0x8cc>	8c8: R_X86_64_PLT32	copy_user_generic_string-0x4
08cc  8cc:	e8 00 00 00 00       	call   8d1 <.altinstr_replacement+0x8d1>	8cd: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08d1  8d1:	e8 00 00 00 00       	call   8d6 <.altinstr_replacement+0x8d6>	8d2: R_X86_64_PLT32	copy_user_generic_string-0x4
08d6  8d6:	e8 00 00 00 00       	call   8db <.altinstr_replacement+0x8db>	8d7: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
08db  8db:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08e0  8e0:	0f 0d 48 f8          	prefetchw -0x8(%rax)
08e4  8e4:	e8 00 00 00 00       	call   8e9 <.altinstr_replacement+0x8e9>	8e5: R_X86_64_PLT32	clear_page_rep-0x4
08e9  8e9:	e8 00 00 00 00       	call   8ee <.altinstr_replacement+0x8ee>	8ea: R_X86_64_PLT32	clear_page_erms-0x4
08ee  8ee:	e8 00 00 00 00       	call   8f3 <.altinstr_replacement+0x8f3>	8ef: R_X86_64_PLT32	clear_page_rep-0x4
08f3  8f3:	e8 00 00 00 00       	call   8f8 <.altinstr_replacement+0x8f8>	8f4: R_X86_64_PLT32	clear_page_erms-0x4
08f8  8f8:	e9 00 00 00 00       	jmp    8fd <.altinstr_replacement+0x8fd>	8f9: R_X86_64_PLT32	.init.text+0x37ad9
08fd  8fd:	0f 01 cb             	stac
0900  900:	0f ae e8             	lfence
0903  903:	0f 01 ca             	clac
0906  906:	0f 01 cb             	stac
0909  909:	0f ae e8             	lfence
090c  90c:	0f 01 ca             	clac
090f  90f:	e9 00 00 00 00       	jmp    914 <.altinstr_replacement+0x914>	910: R_X86_64_PLT32	.text+0x41230f
0914  914:	e9 00 00 00 00       	jmp    919 <.altinstr_replacement+0x919>	915: R_X86_64_PLT32	.text+0x413536
0919  919:	e8 00 00 00 00       	call   91e <.altinstr_replacement+0x91e>	91a: R_X86_64_PLT32	copy_user_generic_string-0x4
091e  91e:	e8 00 00 00 00       	call   923 <.altinstr_replacement+0x923>	91f: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0923  923:	e8 00 00 00 00       	call   928 <.altinstr_replacement+0x928>	924: R_X86_64_PLT32	copy_user_generic_string-0x4
0928  928:	e8 00 00 00 00       	call   92d <.altinstr_replacement+0x92d>	929: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
092d  92d:	e8 00 00 00 00       	call   932 <.altinstr_replacement+0x932>	92e: R_X86_64_PLT32	clear_page_rep-0x4
0932  932:	e8 00 00 00 00       	call   937 <.altinstr_replacement+0x937>	933: R_X86_64_PLT32	clear_page_erms-0x4
0937  937:	f3 48 0f b8 c7       	popcnt %rdi,%rax
093c  93c:	41 0f 0d 0f          	prefetchw (%r15)
0940  940:	0f 0d 0b             	prefetchw (%rbx)
0943  943:	e8 00 00 00 00       	call   948 <.altinstr_replacement+0x948>	944: R_X86_64_PLT32	clear_page_rep-0x4
0948  948:	e8 00 00 00 00       	call   94d <.altinstr_replacement+0x94d>	949: R_X86_64_PLT32	clear_page_erms-0x4
094d  94d:	e8 00 00 00 00       	call   952 <.altinstr_replacement+0x952>	94e: R_X86_64_PLT32	clear_page_rep-0x4
0952  952:	e8 00 00 00 00       	call   957 <.altinstr_replacement+0x957>	953: R_X86_64_PLT32	clear_page_erms-0x4
0957  957:	e8 00 00 00 00       	call   95c <.altinstr_replacement+0x95c>	958: R_X86_64_PLT32	clear_page_rep-0x4
095c  95c:	e8 00 00 00 00       	call   961 <.altinstr_replacement+0x961>	95d: R_X86_64_PLT32	clear_page_erms-0x4
0961  961:	e8 00 00 00 00       	call   966 <.altinstr_replacement+0x966>	962: R_X86_64_PLT32	clear_page_rep-0x4
0966  966:	e8 00 00 00 00       	call   96b <.altinstr_replacement+0x96b>	967: R_X86_64_PLT32	clear_page_erms-0x4
096b  96b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0970  970:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0975  975:	f3 48 0f b8 c7       	popcnt %rdi,%rax
097a  97a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
097f  97f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0984  984:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0989  989:	f3 48 0f b8 c7       	popcnt %rdi,%rax
098e  98e:	0f 01 cb             	stac
0991  991:	e8 00 00 00 00       	call   996 <.altinstr_replacement+0x996>	992: R_X86_64_PLT32	clear_user_erms-0x4
0996  996:	e8 00 00 00 00       	call   99b <.altinstr_replacement+0x99b>	997: R_X86_64_PLT32	clear_user_rep_good-0x4
099b  99b:	e8 00 00 00 00       	call   9a0 <.altinstr_replacement+0x9a0>	99c: R_X86_64_PLT32	clear_user_original-0x4
09a0  9a0:	0f 01 ca             	clac
09a3  9a3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09a8  9a8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09ad  9ad:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09b2  9b2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09b7  9b7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09bc  9bc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09c1  9c1:	e9 00 00 00 00       	jmp    9c6 <.altinstr_replacement+0x9c6>	9c2: R_X86_64_PLT32	.text+0x44ba3f
09c6  9c6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09cb  9cb:	0f 01 cb             	stac
09ce  9ce:	0f ae e8             	lfence
09d1  9d1:	0f 01 ca             	clac
09d4  9d4:	0f 01 ca             	clac
09d7  9d7:	0f 01 cb             	stac
09da  9da:	0f ae e8             	lfence
09dd  9dd:	0f 01 ca             	clac
09e0  9e0:	0f 01 ca             	clac
09e3  9e3:	0f 01 cb             	stac
09e6  9e6:	0f ae e8             	lfence
09e9  9e9:	0f 01 ca             	clac
09ec  9ec:	0f 01 ca             	clac
09ef  9ef:	0f 01 cb             	stac
09f2  9f2:	0f ae e8             	lfence
09f5  9f5:	0f 01 ca             	clac
09f8  9f8:	0f 01 ca             	clac
09fb  9fb:	0f 01 cb             	stac
09fe  9fe:	0f ae e8             	lfence
0a01  a01:	0f 01 ca             	clac
0a04  a04:	0f 01 ca             	clac
0a07  a07:	e8 00 00 00 00       	call   a0c <.altinstr_replacement+0xa0c>	a08: R_X86_64_PLT32	copy_user_generic_string-0x4
0a0c  a0c:	e8 00 00 00 00       	call   a11 <.altinstr_replacement+0xa11>	a0d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0a11  a11:	0f 01 cb             	stac
0a14  a14:	0f ae e8             	lfence
0a17  a17:	0f 01 ca             	clac
0a1a  a1a:	0f 01 ca             	clac
0a1d  a1d:	0f 01 cb             	stac
0a20  a20:	0f ae e8             	lfence
0a23  a23:	0f 01 ca             	clac
0a26  a26:	0f 01 ca             	clac
0a29  a29:	0f 01 cb             	stac
0a2c  a2c:	0f ae e8             	lfence
0a2f  a2f:	0f 01 ca             	clac
0a32  a32:	0f 01 ca             	clac
0a35  a35:	0f 0d 8f 80 09 00 00 	prefetchw 0x980(%rdi)
0a3c  a3c:	f3 0f b8 c7          	popcnt %edi,%eax
0a40  a40:	0f 01 cb             	stac
0a43  a43:	e8 00 00 00 00       	call   a48 <.altinstr_replacement+0xa48>	a44: R_X86_64_PLT32	clear_user_erms-0x4
0a48  a48:	e8 00 00 00 00       	call   a4d <.altinstr_replacement+0xa4d>	a49: R_X86_64_PLT32	clear_user_rep_good-0x4
0a4d  a4d:	e8 00 00 00 00       	call   a52 <.altinstr_replacement+0xa52>	a4e: R_X86_64_PLT32	clear_user_original-0x4
0a52  a52:	0f 01 ca             	clac
0a55  a55:	0f 01 cb             	stac
0a58  a58:	e8 00 00 00 00       	call   a5d <.altinstr_replacement+0xa5d>	a59: R_X86_64_PLT32	clear_user_erms-0x4
0a5d  a5d:	e8 00 00 00 00       	call   a62 <.altinstr_replacement+0xa62>	a5e: R_X86_64_PLT32	clear_user_rep_good-0x4
0a62  a62:	e8 00 00 00 00       	call   a67 <.altinstr_replacement+0xa67>	a63: R_X86_64_PLT32	clear_user_original-0x4
0a67  a67:	0f 01 ca             	clac
0a6a  a6a:	0f 01 cb             	stac
0a6d  a6d:	e8 00 00 00 00       	call   a72 <.altinstr_replacement+0xa72>	a6e: R_X86_64_PLT32	clear_user_erms-0x4
0a72  a72:	e8 00 00 00 00       	call   a77 <.altinstr_replacement+0xa77>	a73: R_X86_64_PLT32	clear_user_rep_good-0x4
0a77  a77:	e8 00 00 00 00       	call   a7c <.altinstr_replacement+0xa7c>	a78: R_X86_64_PLT32	clear_user_original-0x4
0a7c  a7c:	0f 01 ca             	clac
0a7f  a7f:	0f 01 cb             	stac
0a82  a82:	e8 00 00 00 00       	call   a87 <.altinstr_replacement+0xa87>	a83: R_X86_64_PLT32	clear_user_erms-0x4
0a87  a87:	e8 00 00 00 00       	call   a8c <.altinstr_replacement+0xa8c>	a88: R_X86_64_PLT32	clear_user_rep_good-0x4
0a8c  a8c:	e8 00 00 00 00       	call   a91 <.altinstr_replacement+0xa91>	a8d: R_X86_64_PLT32	clear_user_original-0x4
0a91  a91:	0f 01 ca             	clac
0a94  a94:	0f 01 cb             	stac
0a97  a97:	e8 00 00 00 00       	call   a9c <.altinstr_replacement+0xa9c>	a98: R_X86_64_PLT32	clear_user_erms-0x4
0a9c  a9c:	e8 00 00 00 00       	call   aa1 <.altinstr_replacement+0xaa1>	a9d: R_X86_64_PLT32	clear_user_rep_good-0x4
0aa1  aa1:	e8 00 00 00 00       	call   aa6 <.altinstr_replacement+0xaa6>	aa2: R_X86_64_PLT32	clear_user_original-0x4
0aa6  aa6:	0f 01 ca             	clac
0aa9  aa9:	0f 01 cb             	stac
0aac  aac:	e8 00 00 00 00       	call   ab1 <.altinstr_replacement+0xab1>	aad: R_X86_64_PLT32	clear_user_erms-0x4
0ab1  ab1:	e8 00 00 00 00       	call   ab6 <.altinstr_replacement+0xab6>	ab2: R_X86_64_PLT32	clear_user_rep_good-0x4
0ab6  ab6:	e8 00 00 00 00       	call   abb <.altinstr_replacement+0xabb>	ab7: R_X86_64_PLT32	clear_user_original-0x4
0abb  abb:	0f 01 ca             	clac
0abe  abe:	0f 01 cb             	stac
0ac1  ac1:	e8 00 00 00 00       	call   ac6 <.altinstr_replacement+0xac6>	ac2: R_X86_64_PLT32	clear_user_erms-0x4
0ac6  ac6:	e8 00 00 00 00       	call   acb <.altinstr_replacement+0xacb>	ac7: R_X86_64_PLT32	clear_user_rep_good-0x4
0acb  acb:	e8 00 00 00 00       	call   ad0 <.altinstr_replacement+0xad0>	acc: R_X86_64_PLT32	clear_user_original-0x4
0ad0  ad0:	0f 01 ca             	clac
0ad3  ad3:	0f 01 cb             	stac
0ad6  ad6:	e8 00 00 00 00       	call   adb <.altinstr_replacement+0xadb>	ad7: R_X86_64_PLT32	clear_user_erms-0x4
0adb  adb:	e8 00 00 00 00       	call   ae0 <.altinstr_replacement+0xae0>	adc: R_X86_64_PLT32	clear_user_rep_good-0x4
0ae0  ae0:	e8 00 00 00 00       	call   ae5 <.altinstr_replacement+0xae5>	ae1: R_X86_64_PLT32	clear_user_original-0x4
0ae5  ae5:	0f 01 ca             	clac
0ae8  ae8:	0f 01 cb             	stac
0aeb  aeb:	e8 00 00 00 00       	call   af0 <.altinstr_replacement+0xaf0>	aec: R_X86_64_PLT32	clear_user_erms-0x4
0af0  af0:	e8 00 00 00 00       	call   af5 <.altinstr_replacement+0xaf5>	af1: R_X86_64_PLT32	clear_user_rep_good-0x4
0af5  af5:	e8 00 00 00 00       	call   afa <.altinstr_replacement+0xafa>	af6: R_X86_64_PLT32	clear_user_original-0x4
0afa  afa:	0f 01 ca             	clac
0afd  afd:	e8 00 00 00 00       	call   b02 <.altinstr_replacement+0xb02>	afe: R_X86_64_PLT32	clear_page_rep-0x4
0b02  b02:	e8 00 00 00 00       	call   b07 <.altinstr_replacement+0xb07>	b03: R_X86_64_PLT32	clear_page_erms-0x4
0b07  b07:	e8 00 00 00 00       	call   b0c <.altinstr_replacement+0xb0c>	b08: R_X86_64_PLT32	clear_page_rep-0x4
0b0c  b0c:	e8 00 00 00 00       	call   b11 <.altinstr_replacement+0xb11>	b0d: R_X86_64_PLT32	clear_page_erms-0x4
0b11  b11:	0f 01 cb             	stac
0b14  b14:	e8 00 00 00 00       	call   b19 <.altinstr_replacement+0xb19>	b15: R_X86_64_PLT32	clear_user_erms-0x4
0b19  b19:	e8 00 00 00 00       	call   b1e <.altinstr_replacement+0xb1e>	b1a: R_X86_64_PLT32	clear_user_rep_good-0x4
0b1e  b1e:	e8 00 00 00 00       	call   b23 <.altinstr_replacement+0xb23>	b1f: R_X86_64_PLT32	clear_user_original-0x4
0b23  b23:	0f 01 ca             	clac
0b26  b26:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b2b  b2b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b30  b30:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b35  b35:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b3a  b3a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b3f  b3f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b44  b44:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b49  b49:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b4e  b4e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b53  b53:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b58  b58:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b5d  b5d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b62  b62:	e8 00 00 00 00       	call   b67 <.altinstr_replacement+0xb67>	b63: R_X86_64_PLT32	copy_user_generic_string-0x4
0b67  b67:	e8 00 00 00 00       	call   b6c <.altinstr_replacement+0xb6c>	b68: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b6c  b6c:	e8 00 00 00 00       	call   b71 <.altinstr_replacement+0xb71>	b6d: R_X86_64_PLT32	copy_user_generic_string-0x4
0b71  b71:	e8 00 00 00 00       	call   b76 <.altinstr_replacement+0xb76>	b72: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b76  b76:	0f 01 cb             	stac
0b79  b79:	e8 00 00 00 00       	call   b7e <.altinstr_replacement+0xb7e>	b7a: R_X86_64_PLT32	clear_user_erms-0x4
0b7e  b7e:	e8 00 00 00 00       	call   b83 <.altinstr_replacement+0xb83>	b7f: R_X86_64_PLT32	clear_user_rep_good-0x4
0b83  b83:	e8 00 00 00 00       	call   b88 <.altinstr_replacement+0xb88>	b84: R_X86_64_PLT32	clear_user_original-0x4
0b88  b88:	0f 01 ca             	clac
0b8b  b8b:	0f 01 cb             	stac
0b8e  b8e:	e8 00 00 00 00       	call   b93 <.altinstr_replacement+0xb93>	b8f: R_X86_64_PLT32	clear_user_erms-0x4
0b93  b93:	e8 00 00 00 00       	call   b98 <.altinstr_replacement+0xb98>	b94: R_X86_64_PLT32	clear_user_rep_good-0x4
0b98  b98:	e8 00 00 00 00       	call   b9d <.altinstr_replacement+0xb9d>	b99: R_X86_64_PLT32	clear_user_original-0x4
0b9d  b9d:	0f 01 ca             	clac
0ba0  ba0:	0f 01 cb             	stac
0ba3  ba3:	0f ae e8             	lfence
0ba6  ba6:	0f 01 ca             	clac
0ba9  ba9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bae  bae:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bb3  bb3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bb8  bb8:	f3 0f b8 c7          	popcnt %edi,%eax
0bbc  bbc:	f3 0f b8 c7          	popcnt %edi,%eax
0bc0  bc0:	e8 00 00 00 00       	call   bc5 <.altinstr_replacement+0xbc5>	bc1: R_X86_64_PLT32	copy_user_generic_string-0x4
0bc5  bc5:	e8 00 00 00 00       	call   bca <.altinstr_replacement+0xbca>	bc6: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0bca  bca:	e8 00 00 00 00       	call   bcf <.altinstr_replacement+0xbcf>	bcb: R_X86_64_PLT32	copy_user_generic_string-0x4
0bcf  bcf:	e8 00 00 00 00       	call   bd4 <.altinstr_replacement+0xbd4>	bd0: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0bd4  bd4:	0f 01 cb             	stac
0bd7  bd7:	0f ae e8             	lfence
0bda  bda:	0f 01 ca             	clac
0bdd  bdd:	0f 01 ca             	clac
0be0  be0:	0f 01 cb             	stac
0be3  be3:	0f ae e8             	lfence
0be6  be6:	0f 01 ca             	clac
0be9  be9:	0f 01 cb             	stac
0bec  bec:	0f ae e8             	lfence
0bef  bef:	0f 01 ca             	clac
0bf2  bf2:	9c                   	pushf
0bf3  bf3:	8f 04 24             	pop    (%rsp)
0bf6  bf6:	0f 01 ca             	clac
0bf9  bf9:	ff 74 24 08          	push   0x8(%rsp)
0bfd  bfd:	9d                   	popf
0bfe  bfe:	9c                   	pushf
0bff  bff:	8f 44 24 20          	pop    0x20(%rsp)
0c03  c03:	0f 01 ca             	clac
0c06  c06:	ff 74 24 28          	push   0x28(%rsp)
0c0a  c0a:	9d                   	popf
0c0b  c0b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c10  c10:	e9 00 00 00 00       	jmp    c15 <.altinstr_replacement+0xc15>	c11: R_X86_64_PLT32	.text+0x80144b
0c15  c15:	e9 00 00 00 00       	jmp    c1a <.altinstr_replacement+0xc1a>	c16: R_X86_64_PLT32	.text+0x802913
0c1a  c1a:	e9 00 00 00 00       	jmp    c1f <.altinstr_replacement+0xc1f>	c1b: R_X86_64_PLT32	.cpuidle.text+0x43d
0c1f  c1f:	e9 00 00 00 00       	jmp    c24 <.altinstr_replacement+0xc24>	c20: R_X86_64_PLT32	.text+0x81b38b
0c24  c24:	e9 00 00 00 00       	jmp    c29 <.altinstr_replacement+0xc29>	c25: R_X86_64_PLT32	.cpuidle.text+0x553
0c29  c29:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c2e  c2e:	f3 0f b8 c7          	popcnt %edi,%eax
0c32  c32:	f3 0f b8 c7          	popcnt %edi,%eax
0c36  c36:	0f 01 cb             	stac
0c39  c39:	e8 00 00 00 00       	call   c3e <.altinstr_replacement+0xc3e>	c3a: R_X86_64_PLT32	clear_user_erms-0x4
0c3e  c3e:	e8 00 00 00 00       	call   c43 <.altinstr_replacement+0xc43>	c3f: R_X86_64_PLT32	clear_user_rep_good-0x4
0c43  c43:	e8 00 00 00 00       	call   c48 <.altinstr_replacement+0xc48>	c44: R_X86_64_PLT32	clear_user_original-0x4
0c48  c48:	0f 01 ca             	clac
0c4b  c4b:	e9 00 00 00 00       	jmp    c50 <.altinstr_replacement+0xc50>	c4c: R_X86_64_PLT32	.init.text+0x5806a
0c50  c50:	e9 00 00 00 00       	jmp    c55 <.altinstr_replacement+0xc55>	c51: R_X86_64_PLT32	.init.text+0x58098
0c55  c55:	e9 00 00 00 00       	jmp    c5a <.altinstr_replacement+0xc5a>	c56: R_X86_64_PLT32	.text+0x89a687
0c5a  c5a:	e9 00 00 00 00       	jmp    c5f <.altinstr_replacement+0xc5f>	c5b: R_X86_64_PLT32	.text+0x89a6b7
0c5f  c5f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c64  c64:	f3 0f b8 c7          	popcnt %edi,%eax
0c68  c68:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c6d  c6d:	f3 0f b8 c7          	popcnt %edi,%eax
0c71  c71:	f3 0f b8 c7          	popcnt %edi,%eax
0c75  c75:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c7a  c7a:	f3 0f b8 c7          	popcnt %edi,%eax
0c7e  c7e:	f3 0f b8 c7          	popcnt %edi,%eax
0c82  c82:	f3 0f b8 c7          	popcnt %edi,%eax
0c86  c86:	0f 0d 0c 0f          	prefetchw (%rdi,%rcx,1)
0c8a  c8a:	41 0f 0d 0c 04       	prefetchw (%r12,%rax,1)
0c8f  c8f:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
0c93  c93:	0f 0d 4c 05 00       	prefetchw 0x0(%rbp,%rax,1)
0c98  c98:	41 0f 0d 4c 2d 00    	prefetchw 0x0(%r13,%rbp,1)
0c9e  c9e:	f3 0f b8 c7          	popcnt %edi,%eax
0ca2  ca2:	f3 0f b8 c7          	popcnt %edi,%eax
0ca6  ca6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cab  cab:	0f 01 cb             	stac
0cae  cae:	e8 00 00 00 00       	call   cb3 <.altinstr_replacement+0xcb3>	caf: R_X86_64_PLT32	clear_user_erms-0x4
0cb3  cb3:	e8 00 00 00 00       	call   cb8 <.altinstr_replacement+0xcb8>	cb4: R_X86_64_PLT32	clear_user_rep_good-0x4
0cb8  cb8:	e8 00 00 00 00       	call   cbd <.altinstr_replacement+0xcbd>	cb9: R_X86_64_PLT32	clear_user_original-0x4
0cbd  cbd:	0f 01 ca             	clac
0cc0  cc0:	f3 0f b8 c7          	popcnt %edi,%eax
0cc4  cc4:	f3 0f b8 c7          	popcnt %edi,%eax
0cc8  cc8:	f3 0f b8 c7          	popcnt %edi,%eax
0ccc  ccc:	f3 0f b8 c7          	popcnt %edi,%eax
0cd0  cd0:	f3 0f b8 c7          	popcnt %edi,%eax
0cd4  cd4:	f3 0f b8 c7          	popcnt %edi,%eax
0cd8  cd8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cdd  cdd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ce2  ce2:	f3 0f b8 c7          	popcnt %edi,%eax
0ce6  ce6:	0f 01 d9             	vmmcall
0ce9  ce9:	0f 01 d9             	vmmcall
0cec  cec:	0f 01 d9             	vmmcall
0cef  cef:	f3 0f b8 c7          	popcnt %edi,%eax
0cf3  cf3:	f3 0f b8 c7          	popcnt %edi,%eax
0cf7  cf7:	f3 0f b8 c7          	popcnt %edi,%eax
0cfb  cfb:	f3 0f b8 c7          	popcnt %edi,%eax
0cff  cff:	f3 0f b8 c7          	popcnt %edi,%eax
0d03  d03:	f3 0f b8 c7          	popcnt %edi,%eax
0d07  d07:	f3 0f b8 c7          	popcnt %edi,%eax
0d0b  d0b:	f3 0f b8 c7          	popcnt %edi,%eax
0d0f  d0f:	f3 0f b8 c7          	popcnt %edi,%eax
0d13  d13:	f3 0f b8 c7          	popcnt %edi,%eax
0d17  d17:	f3 0f b8 c7          	popcnt %edi,%eax
0d1b  d1b:	f3 0f b8 c7          	popcnt %edi,%eax
0d1f  d1f:	f3 0f b8 c7          	popcnt %edi,%eax
0d23  d23:	f3 0f b8 c7          	popcnt %edi,%eax
0d27  d27:	f3 0f b8 c7          	popcnt %edi,%eax
0d2b  d2b:	f3 0f b8 c7          	popcnt %edi,%eax
0d2f  d2f:	f3 0f b8 c7          	popcnt %edi,%eax
0d33  d33:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d38  d38:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d3d  d3d:	f3 0f b8 c7          	popcnt %edi,%eax
0d41  d41:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d46  d46:	e9 00 00 00 00       	jmp    d4b <.altinstr_replacement+0xd4b>	d47: R_X86_64_PLT32	.init.text+0x7ad99
0d4b  d4b:	f3 0f b8 c7          	popcnt %edi,%eax
0d4f  d4f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d54  d54:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d59  d59:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d5e  d5e:	f3 0f b8 c7          	popcnt %edi,%eax
0d62  d62:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d67  d67:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d6c  d6c:	0f 01 cb             	stac
0d6f  d6f:	e8 00 00 00 00       	call   d74 <.altinstr_replacement+0xd74>	d70: R_X86_64_PLT32	clear_user_erms-0x4
0d74  d74:	e8 00 00 00 00       	call   d79 <.altinstr_replacement+0xd79>	d75: R_X86_64_PLT32	clear_user_rep_good-0x4
0d79  d79:	e8 00 00 00 00       	call   d7e <.altinstr_replacement+0xd7e>	d7a: R_X86_64_PLT32	clear_user_original-0x4
0d7e  d7e:	0f 01 ca             	clac
0d81  d81:	f3 0f b8 c7          	popcnt %edi,%eax
0d85  d85:	f3 0f b8 c7          	popcnt %edi,%eax
0d89  d89:	f3 0f b8 c7          	popcnt %edi,%eax
0d8d  d8d:	f3 0f b8 c7          	popcnt %edi,%eax
0d91  d91:	f3 0f b8 c7          	popcnt %edi,%eax
0d95  d95:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d9a  d9a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d9f  d9f:	0f 0d 0b             	prefetchw (%rbx)
0da2  da2:	41 0f 0d 0c 06       	prefetchw (%r14,%rax,1)
0da7  da7:	0f 01 cb             	stac
0daa  daa:	0f ae e8             	lfence
0dad  dad:	0f 01 ca             	clac
0db0  db0:	0f 01 ca             	clac
0db3  db3:	f3 0f b8 c7          	popcnt %edi,%eax
0db7  db7:	f3 0f b8 c7          	popcnt %edi,%eax
0dbb  dbb:	f3 0f b8 c7          	popcnt %edi,%eax
0dbf  dbf:	f3 0f b8 c7          	popcnt %edi,%eax
0dc3  dc3:	f3 0f b8 c7          	popcnt %edi,%eax
0dc7  dc7:	f3 0f b8 c7          	popcnt %edi,%eax
0dcb  dcb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0dd0  dd0:	0f 0d 0b             	prefetchw (%rbx)
0dd3  dd3:	e9 00 00 00 00       	jmp    dd8 <.altinstr_replacement+0xdd8>	dd4: R_X86_64_PLT32	.text+0x148a9a4
0dd8  dd8:	e9 00 00 00 00       	jmp    ddd <.altinstr_replacement+0xddd>	dd9: R_X86_64_PLT32	.text+0x148aa55
0ddd  ddd:	0f 01 cb             	stac
0de0  de0:	0f 01 ca             	clac
0de3  de3:	e8 00 00 00 00       	call   de8 <.altinstr_replacement+0xde8>	de4: R_X86_64_PLT32	copy_user_generic_string-0x4
0de8  de8:	e8 00 00 00 00       	call   ded <.altinstr_replacement+0xded>	de9: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0ded  ded:	0f 01 cb             	stac
0df0  df0:	0f 01 cb             	stac
0df3  df3:	0f 01 ca             	clac
0df6  df6:	0f 01 cb             	stac
0df9  df9:	0f 01 ca             	clac
0dfc  dfc:	0f 01 ca             	clac
0dff  dff:	0f 01 ca             	clac
0e02  e02:	0f 01 ca             	clac
0e05  e05:	0f 01 cb             	stac
0e08  e08:	0f 01 ca             	clac
0e0b  e0b:	0f 01 cb             	stac
0e0e  e0e:	0f ae e8             	lfence
0e11  e11:	0f 01 ca             	clac
0e14  e14:	0f 01 cb             	stac
0e17  e17:	0f ae e8             	lfence
0e1a  e1a:	0f 01 ca             	clac
0e1d  e1d:	0f ae e8             	lfence
0e20  e20:	0f 31                	rdtsc
0e22  e22:	0f 01 f9             	rdtscp
0e25  e25:	0f ae e8             	lfence
0e28  e28:	0f 31                	rdtsc
0e2a  e2a:	0f 01 f9             	rdtscp
0e2d  e2d:	0f ae e8             	lfence
0e30  e30:	0f 31                	rdtsc
0e32  e32:	0f 01 f9             	rdtscp
0e35  e35:	0f ae e8             	lfence
0e38  e38:	0f 31                	rdtsc
0e3a  e3a:	0f 01 f9             	rdtscp
0e3d  e3d:	0f ae e8             	lfence
0e40  e40:	0f 31                	rdtsc
0e42  e42:	0f 01 f9             	rdtscp
0e45  e45:	0f ae e8             	lfence
0e48  e48:	0f 31                	rdtsc
0e4a  e4a:	0f 01 f9             	rdtscp
0e4d  e4d:	0f 01 cb             	stac
0e50  e50:	0f 01 ca             	clac
0e53  e53:	0f 01 cb             	stac
0e56  e56:	0f 01 ca             	clac
0e59  e59:	0f 01 cb             	stac
0e5c  e5c:	0f 01 ca             	clac
0e5f  e5f:	0f 01 cb             	stac
0e62  e62:	0f 01 ca             	clac
0e65  e65:	0f 01 cb             	stac
0e68  e68:	0f ae e8             	lfence
0e6b  e6b:	0f 01 ca             	clac
0e6e  e6e:	0f 01 cb             	stac
0e71  e71:	0f ae e8             	lfence
0e74  e74:	0f 01 ca             	clac
0e77  e77:	0f 01 cb             	stac
0e7a  e7a:	0f ae e8             	lfence
0e7d  e7d:	0f 01 ca             	clac
0e80  e80:	0f 01 cb             	stac
0e83  e83:	0f ae e8             	lfence
0e86  e86:	0f 01 ca             	clac
0e89  e89:	0f 01 ca             	clac
0e8c  e8c:	e8 00 00 00 00       	call   e91 <.altinstr_replacement+0xe91>	e8d: R_X86_64_PLT32	copy_user_generic_string-0x4
0e91  e91:	e8 00 00 00 00       	call   e96 <.altinstr_replacement+0xe96>	e92: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0e96  e96:	e9 00 00 00 00       	jmp    e9b <.altinstr_replacement+0xe9b>	e97: R_X86_64_PLT32	.noinstr.text+0x4a3c
0e9b  e9b:	e9 00 00 00 00       	jmp    ea0 <.altinstr_replacement+0xea0>	e9c: R_X86_64_PLT32	.text+0x148eea5
0ea0  ea0:	e9 00 00 00 00       	jmp    ea5 <.altinstr_replacement+0xea5>	ea1: R_X86_64_PLT32	.text+0x148eefc
0ea5  ea5:	0f 01 cb             	stac
0ea8  ea8:	0f 01 ca             	clac
0eab  eab:	0f 01 cb             	stac
0eae  eae:	0f 01 ca             	clac
0eb1  eb1:	0f 01 cb             	stac
0eb4  eb4:	0f 01 ca             	clac
0eb7  eb7:	0f 01 cb             	stac
0eba  eba:	0f 01 ca             	clac
0ebd  ebd:	0f 01 cb             	stac
0ec0  ec0:	0f 01 ca             	clac
0ec3  ec3:	0f 01 cb             	stac
0ec6  ec6:	0f 01 ca             	clac
0ec9  ec9:	0f 01 cb             	stac
0ecc  ecc:	0f 01 ca             	clac
0ecf  ecf:	0f 01 cb             	stac
0ed2  ed2:	0f 01 ca             	clac
0ed5  ed5:	0f 01 ca             	clac
0ed8  ed8:	e8 00 00 00 00       	call   edd <.altinstr_replacement+0xedd>	ed9: R_X86_64_PLT32	copy_user_generic_string-0x4
0edd  edd:	e8 00 00 00 00       	call   ee2 <.altinstr_replacement+0xee2>	ede: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0ee2  ee2:	66 0f ae 38          	clflushopt (%rax)
0ee6  ee6:	66 0f ae 30          	clwb   (%rax)
0eea  eea:	66 0f ae 38          	clflushopt (%rax)
0eee  eee:	66 0f ae 30          	clwb   (%rax)
0ef2  ef2:	66 0f ae 38          	clflushopt (%rax)
0ef6  ef6:	66 0f ae 30          	clwb   (%rax)
0efa  efa:	66 0f ae 38          	clflushopt (%rax)
0efe  efe:	66 0f ae 30          	clwb   (%rax)
0f02  f02:	66 0f ae 38          	clflushopt (%rax)
0f06  f06:	66 0f ae 30          	clwb   (%rax)
0f0a  f0a:	66 0f ae 38          	clflushopt (%rax)
0f0e  f0e:	66 0f ae 30          	clwb   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
