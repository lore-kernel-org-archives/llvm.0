Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482A43C3B;
	Tue,  7 Feb 2023 18:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675795770; x=1707331770;
  h=date:from:cc:subject:message-id:mime-version;
  bh=4xtpOYM7IwBjUQURQTAPFn8i2kvf0Hll/PbPIROhuls=;
  b=SMbo8yojxQFJk/mojJhQp9gTzQ1X0wrmbC3bEmTBFsAgeM4nDZtCepuT
   Oxj974/rfQaHXDDqEmZOkKO/du51GQyL7HP9N2i95Qd4blNCFX50vLzFZ
   z86H8Z3tXbo9apjLSQCiSGGNu22+hV6imguJwGAk67Ty9pofsp0CwwuFz
   Uu5L9a8pwg919Bjw9HaTQPUeDePXHK1fvLoXKBYxc0wWeK9M324SxGxP9
   DBu3Q+kxZ2vpJjA0bv14lgmhFq3pkh1nxERgRAPWjEK2FcvnluCncv5Gc
   Cx6sUlMxKxRGVJKBIsTrtRa5Rd1MP7VtCLNIwzTtDZhybCNxtKaqVWWxM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="356971631"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="356971631"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 10:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="735645534"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="735645534"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Feb 2023 10:49:27 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPT1z-0003mw-0u;
	Tue, 07 Feb 2023 18:49:27 +0000
Date: Wed, 8 Feb 2023 02:48:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:objtool/core 7/8] arch/x86/entry/entry_64.o: warning:
 objtool: .altinstr_replacement+0x1a: stack layout conflict in alternatives
Message-ID: <202302080216.5jWluIni-lkp@intel.com>
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
config: x86_64-randconfig-a001-20230206 (https://download.01.org/0day-ci/archive/20230208/202302080216.5jWluIni-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/entry/entry_64.o: warning: objtool: .altinstr_replacement+0x1a: stack layout conflict in alternatives


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000        0:	e8 00 00 00 00       	call   5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	clear_page_rep-0x4
0005        5:	e8 00 00 00 00       	call   a <.altinstr_replacement+0xa>	6: R_X86_64_PLT32	clear_page_erms-0x4
000a        a:	e9 00 00 00 00       	jmp    f <.altinstr_replacement+0xf>	b: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
000f        f:	48 c1 e1 07          	shl    $0x7,%rcx
0013       13:	48 c1 f9 07          	sar    $0x7,%rcx
0017       17:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
001e       1e:	e8 01 00 00 00       	call   24 <.altinstr_replacement+0x24>
0023       23:	cc                   	int3
0024       24:	e8 01 00 00 00       	call   2a <.altinstr_replacement+0x2a>
0029       29:	cc                   	int3
002a       2a:	48 83 c4 10          	add    $0x10,%rsp
002e       2e:	49 ff cc             	dec    %r12
0031       31:	75 eb                	jne    1e <.altinstr_replacement+0x1e>
0033       33:	0f ae e8             	lfence
0036       36:	e8 01 00 00 00       	call   3c <.altinstr_replacement+0x3c>
003b       3b:	cc                   	int3
003c       3c:	48 83 c4 08          	add    $0x8,%rsp
0040       40:	0f ae e8             	lfence
0043       43:	0f 01 ca             	clac
0046       46:	e8 00 00 00 00       	call   4b <.altinstr_replacement+0x4b>	47: R_X86_64_PLT32	xen_error_entry-0x4
004b       4b:	0f 01 ca             	clac
004e       4e:	e8 00 00 00 00       	call   53 <.altinstr_replacement+0x53>	4f: R_X86_64_PLT32	xen_error_entry-0x4
0053       53:	0f 01 ca             	clac
0056       56:	e8 00 00 00 00       	call   5b <.altinstr_replacement+0x5b>	57: R_X86_64_PLT32	xen_error_entry-0x4
005b       5b:	0f 01 ca             	clac
005e       5e:	e8 00 00 00 00       	call   63 <.altinstr_replacement+0x63>	5f: R_X86_64_PLT32	xen_error_entry-0x4
0063       63:	0f 01 ca             	clac
0066       66:	e8 00 00 00 00       	call   6b <.altinstr_replacement+0x6b>	67: R_X86_64_PLT32	xen_error_entry-0x4
006b       6b:	0f 01 ca             	clac
006e       6e:	e8 00 00 00 00       	call   73 <.altinstr_replacement+0x73>	6f: R_X86_64_PLT32	xen_error_entry-0x4
0073       73:	0f 01 ca             	clac
0076       76:	e8 00 00 00 00       	call   7b <.altinstr_replacement+0x7b>	77: R_X86_64_PLT32	xen_error_entry-0x4
007b       7b:	0f 01 ca             	clac
007e       7e:	e8 00 00 00 00       	call   83 <.altinstr_replacement+0x83>	7f: R_X86_64_PLT32	xen_error_entry-0x4
0083       83:	0f 01 ca             	clac
0086       86:	e8 00 00 00 00       	call   8b <.altinstr_replacement+0x8b>	87: R_X86_64_PLT32	xen_error_entry-0x4
008b       8b:	0f 01 ca             	clac
008e       8e:	e8 00 00 00 00       	call   93 <.altinstr_replacement+0x93>	8f: R_X86_64_PLT32	xen_error_entry-0x4
0093       93:	0f 01 ca             	clac
0096       96:	e8 00 00 00 00       	call   9b <.altinstr_replacement+0x9b>	97: R_X86_64_PLT32	xen_error_entry-0x4
009b       9b:	0f 01 ca             	clac
009e       9e:	e8 00 00 00 00       	call   a3 <.altinstr_replacement+0xa3>	9f: R_X86_64_PLT32	xen_error_entry-0x4
00a3       a3:	0f 01 ca             	clac
00a6       a6:	e8 00 00 00 00       	call   ab <.altinstr_replacement+0xab>	a7: R_X86_64_PLT32	xen_error_entry-0x4
00ab       ab:	0f 01 ca             	clac
00ae       ae:	e8 00 00 00 00       	call   b3 <.altinstr_replacement+0xb3>	af: R_X86_64_PLT32	xen_error_entry-0x4
00b3       b3:	0f 01 ca             	clac
00b6       b6:	e8 00 00 00 00       	call   bb <.altinstr_replacement+0xbb>	b7: R_X86_64_PLT32	xen_error_entry-0x4
00bb       bb:	0f 01 ca             	clac
00be       be:	e8 00 00 00 00       	call   c3 <.altinstr_replacement+0xc3>	bf: R_X86_64_PLT32	xen_error_entry-0x4
00c3       c3:	0f 01 ca             	clac
00c6       c6:	e8 00 00 00 00       	call   cb <.altinstr_replacement+0xcb>	c7: R_X86_64_PLT32	xen_error_entry-0x4
00cb       cb:	0f 01 ca             	clac
00ce       ce:	e8 00 00 00 00       	call   d3 <.altinstr_replacement+0xd3>	cf: R_X86_64_PLT32	xen_error_entry-0x4
00d3       d3:	0f 01 ca             	clac
00d6       d6:	0f 01 ca             	clac
00d9       d9:	e8 00 00 00 00       	call   de <.altinstr_replacement+0xde>	da: R_X86_64_PLT32	xen_error_entry-0x4
00de       de:	0f 01 ca             	clac
00e1       e1:	e8 00 00 00 00       	call   e6 <.altinstr_replacement+0xe6>	e2: R_X86_64_PLT32	xen_error_entry-0x4
00e6       e6:	0f 01 ca             	clac
00e9       e9:	e8 00 00 00 00       	call   ee <.altinstr_replacement+0xee>	ea: R_X86_64_PLT32	xen_error_entry-0x4
00ee       ee:	0f 01 ca             	clac
00f1       f1:	e8 00 00 00 00       	call   f6 <.altinstr_replacement+0xf6>	f2: R_X86_64_PLT32	xen_error_entry-0x4
00f6       f6:	0f 01 ca             	clac
00f9       f9:	e8 00 00 00 00       	call   fe <.altinstr_replacement+0xfe>	fa: R_X86_64_PLT32	xen_error_entry-0x4
00fe       fe:	0f 01 ca             	clac
0101      101:	e8 00 00 00 00       	call   106 <.altinstr_replacement+0x106>	102: R_X86_64_PLT32	xen_error_entry-0x4
0106      106:	0f 01 ca             	clac
0109      109:	e8 00 00 00 00       	call   10e <.altinstr_replacement+0x10e>	10a: R_X86_64_PLT32	xen_error_entry-0x4
010e      10e:	0f 01 ca             	clac
0111      111:	e8 00 00 00 00       	call   116 <.altinstr_replacement+0x116>	112: R_X86_64_PLT32	xen_error_entry-0x4
0116      116:	0f 01 ca             	clac
0119      119:	e8 00 00 00 00       	call   11e <.altinstr_replacement+0x11e>	11a: R_X86_64_PLT32	xen_error_entry-0x4
011e      11e:	0f 01 ca             	clac
0121      121:	e8 00 00 00 00       	call   126 <.altinstr_replacement+0x126>	122: R_X86_64_PLT32	xen_error_entry-0x4
0126      126:	0f 01 ca             	clac
0129      129:	e8 00 00 00 00       	call   12e <.altinstr_replacement+0x12e>	12a: R_X86_64_PLT32	xen_error_entry-0x4
012e      12e:	0f 01 ca             	clac
0131      131:	e8 00 00 00 00       	call   136 <.altinstr_replacement+0x136>	132: R_X86_64_PLT32	xen_error_entry-0x4
0136      136:	0f 01 ca             	clac
0139      139:	e8 00 00 00 00       	call   13e <.altinstr_replacement+0x13e>	13a: R_X86_64_PLT32	xen_error_entry-0x4
013e      13e:	0f 01 ca             	clac
0141      141:	e8 00 00 00 00       	call   146 <.altinstr_replacement+0x146>	142: R_X86_64_PLT32	xen_error_entry-0x4
0146      146:	0f 01 ca             	clac
0149      149:	e8 00 00 00 00       	call   14e <.altinstr_replacement+0x14e>	14a: R_X86_64_PLT32	xen_error_entry-0x4
014e      14e:	0f ae f0             	mfence
0151      151:	b8 2b 00 00 00       	mov    $0x2b,%eax
0156      156:	8e e8                	mov    %eax,%gs
0158      158:	0f ae e8             	lfence
015b      15b:	0f ae e8             	lfence
015e      15e:	0f ae e8             	lfence
0161      161:	0f ae e8             	lfence
0164      164:	0f 01 ca             	clac
0167      167:	0f ae e8             	lfence
016a      16a:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0174      174:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
017e      17e:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
0188      188:	e9 00 00 00 00       	jmp    18d <.altinstr_replacement+0x18d>	189: R_X86_64_PLT32	.init.text+0x3ee0
018d      18d:	e9 00 00 00 00       	jmp    192 <.altinstr_replacement+0x192>	18e: R_X86_64_PLT32	.init.text+0x3ee5
0192      192:	e9 00 00 00 00       	jmp    197 <.altinstr_replacement+0x197>	193: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0197      197:	e9 00 00 00 00       	jmp    19c <.altinstr_replacement+0x19c>	198: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
019c      19c:	0f 01 ca             	clac
019f      19f:	e9 00 00 00 00       	jmp    1a4 <.altinstr_replacement+0x1a4>	1a0: R_X86_64_PLT32	.entry.text+0x1286
01a4      1a4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01a9      1a9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01ae      1ae:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
01b8      1b8:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
01c2      1c2:	f3 0f b8 c7          	popcnt %edi,%eax
01c6      1c6:	0f ae e8             	lfence
01c9      1c9:	0f 31                	rdtsc
01cb      1cb:	0f 01 f9             	rdtscp
01ce      1ce:	0f ae e8             	lfence
01d1      1d1:	0f 31                	rdtsc
01d3      1d3:	0f 01 f9             	rdtscp
01d6      1d6:	e9 00 00 00 00       	jmp    1db <.altinstr_replacement+0x1db>	1d7: R_X86_64_PLT32	.init.text+0x6219
01db      1db:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01e0      1e0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01e5      1e5:	e9 00 00 00 00       	jmp    1ea <.altinstr_replacement+0x1ea>	1e6: R_X86_64_PLT32	.text+0xff9d
01ea      1ea:	e9 00 00 00 00       	jmp    1ef <.altinstr_replacement+0x1ef>	1eb: R_X86_64_PLT32	.text+0x10567
01ef      1ef:	e9 00 00 00 00       	jmp    1f4 <.altinstr_replacement+0x1f4>	1f0: R_X86_64_PLT32	.text+0x10572
01f4      1f4:	e9 00 00 00 00       	jmp    1f9 <.altinstr_replacement+0x1f9>	1f5: R_X86_64_PLT32	.text+0x1057a
01f9      1f9:	e9 00 00 00 00       	jmp    1fe <.altinstr_replacement+0x1fe>	1fa: R_X86_64_PLT32	.text+0x10582
01fe      1fe:	e9 00 00 00 00       	jmp    203 <.altinstr_replacement+0x203>	1ff: R_X86_64_PLT32	.text+0x10657
0203      203:	e9 00 00 00 00       	jmp    208 <.altinstr_replacement+0x208>	204: R_X86_64_PLT32	.text+0x10668
0208      208:	e9 00 00 00 00       	jmp    20d <.altinstr_replacement+0x20d>	209: R_X86_64_PLT32	.text+0x10683
020d      20d:	e9 00 00 00 00       	jmp    212 <.altinstr_replacement+0x212>	20e: R_X86_64_PLT32	.text+0x1068c
0212      212:	e9 00 00 00 00       	jmp    217 <.altinstr_replacement+0x217>	213: R_X86_64_PLT32	.text+0x106a7
0217      217:	e9 00 00 00 00       	jmp    21c <.altinstr_replacement+0x21c>	218: R_X86_64_PLT32	.text+0x106a7
021c      21c:	e9 00 00 00 00       	jmp    221 <.altinstr_replacement+0x221>	21d: R_X86_64_PLT32	.text+0x10749
0221      221:	e9 00 00 00 00       	jmp    226 <.altinstr_replacement+0x226>	222: R_X86_64_PLT32	.text+0x10754
0226      226:	e9 00 00 00 00       	jmp    22b <.altinstr_replacement+0x22b>	227: R_X86_64_PLT32	.text+0x1075c
022b      22b:	e9 00 00 00 00       	jmp    230 <.altinstr_replacement+0x230>	22c: R_X86_64_PLT32	.text+0x10762
0230      230:	e9 00 00 00 00       	jmp    235 <.altinstr_replacement+0x235>	231: R_X86_64_PLT32	.text+0x10810
0235      235:	e9 00 00 00 00       	jmp    23a <.altinstr_replacement+0x23a>	236: R_X86_64_PLT32	.text+0x10855
023a      23a:	e9 00 00 00 00       	jmp    23f <.altinstr_replacement+0x23f>	23b: R_X86_64_PLT32	.text+0x10896
023f      23f:	e9 00 00 00 00       	jmp    244 <.altinstr_replacement+0x244>	240: R_X86_64_PLT32	.text+0x1092a
0244      244:	e9 00 00 00 00       	jmp    249 <.altinstr_replacement+0x249>	245: R_X86_64_PLT32	.text+0x10a11
0249      249:	e9 00 00 00 00       	jmp    24e <.altinstr_replacement+0x24e>	24a: R_X86_64_PLT32	.text+0x10a6e
024e      24e:	e9 00 00 00 00       	jmp    253 <.altinstr_replacement+0x253>	24f: R_X86_64_PLT32	.text+0x10a7a
0253      253:	e9 00 00 00 00       	jmp    258 <.altinstr_replacement+0x258>	254: R_X86_64_PLT32	.text+0x10a0d
0258      258:	e9 00 00 00 00       	jmp    25d <.altinstr_replacement+0x25d>	259: R_X86_64_PLT32	.text+0x10aea
025d      25d:	e9 00 00 00 00       	jmp    262 <.altinstr_replacement+0x262>	25e: R_X86_64_PLT32	.text+0x11058
0262      262:	e9 00 00 00 00       	jmp    267 <.altinstr_replacement+0x267>	263: R_X86_64_PLT32	.text+0x1149a
0267      267:	e9 00 00 00 00       	jmp    26c <.altinstr_replacement+0x26c>	268: R_X86_64_PLT32	.text+0x11511
026c      26c:	e9 00 00 00 00       	jmp    271 <.altinstr_replacement+0x271>	26d: R_X86_64_PLT32	.text+0x116a3
0271      271:	f3 0f b8 c7          	popcnt %edi,%eax
0275      275:	f3 48 0f b8 c7       	popcnt %rdi,%rax
027a      27a:	e9 00 00 00 00       	jmp    27f <.altinstr_replacement+0x27f>	27b: R_X86_64_PLT32	.text+0x1ee61
027f      27f:	e9 00 00 00 00       	jmp    284 <.altinstr_replacement+0x284>	280: R_X86_64_PLT32	.text+0x1f205
0284      284:	e9 00 00 00 00       	jmp    289 <.altinstr_replacement+0x289>	285: R_X86_64_PLT32	.text+0x1f4b1
0289      289:	e9 00 00 00 00       	jmp    28e <.altinstr_replacement+0x28e>	28a: R_X86_64_PLT32	.text+0x1f4d6
028e      28e:	e9 00 00 00 00       	jmp    293 <.altinstr_replacement+0x293>	28f: R_X86_64_PLT32	.text+0x1f420
0293      293:	e9 00 00 00 00       	jmp    298 <.altinstr_replacement+0x298>	294: R_X86_64_PLT32	.text+0x1f710
0298      298:	e9 00 00 00 00       	jmp    29d <.altinstr_replacement+0x29d>	299: R_X86_64_PLT32	.text+0x1f72c
029d      29d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
02a7      2a7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
02b1      2b1:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
02bb      2bb:	0f 01 cb             	stac
02be      2be:	0f ae e8             	lfence
02c1      2c1:	0f 01 ca             	clac
02c4      2c4:	0f 01 ca             	clac
02c7      2c7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
02d1      2d1:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
02db      2db:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
02e5      2e5:	e9 00 00 00 00       	jmp    2ea <.altinstr_replacement+0x2ea>	2e6: R_X86_64_PLT32	.noinstr.text+0x76c
02ea      2ea:	e9 00 00 00 00       	jmp    2ef <.altinstr_replacement+0x2ef>	2eb: R_X86_64_PLT32	.noinstr.text+0xa1d
02ef      2ef:	e9 00 00 00 00       	jmp    2f4 <.altinstr_replacement+0x2f4>	2f0: R_X86_64_PLT32	.text+0x20aa2
02f4      2f4:	e9 00 00 00 00       	jmp    2f9 <.altinstr_replacement+0x2f9>	2f5: R_X86_64_PLT32	.text+0x20ab0
02f9      2f9:	e9 00 00 00 00       	jmp    2fe <.altinstr_replacement+0x2fe>	2fa: R_X86_64_PLT32	.text+0x20c8b
02fe      2fe:	e9 00 00 00 00       	jmp    303 <.altinstr_replacement+0x303>	2ff: R_X86_64_PLT32	.init.text+0x8292
0303      303:	e9 00 00 00 00       	jmp    308 <.altinstr_replacement+0x308>	304: R_X86_64_PLT32	.noinstr.text+0x1334
0308      308:	e9 00 00 00 00       	jmp    30d <.altinstr_replacement+0x30d>	309: R_X86_64_PLT32	.init.text+0x88c1
030d      30d:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0317      317:	0f 01 cb             	stac
031a      31a:	0f ae e8             	lfence
031d      31d:	0f 01 ca             	clac
0320      320:	0f 01 ca             	clac
0323      323:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
032d      32d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0337      337:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0341      341:	0f 01 cb             	stac
0344      344:	0f ae e8             	lfence
0347      347:	0f 01 ca             	clac
034a      34a:	0f 01 ca             	clac
034d      34d:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0357      357:	0f 01 cb             	stac
035a      35a:	0f ae e8             	lfence
035d      35d:	e9 00 00 00 00       	jmp    362 <.altinstr_replacement+0x362>	35e: R_X86_64_PLT32	.text+0x256c5
0362      362:	0f 01 ca             	clac
0365      365:	0f 01 ca             	clac
0368      368:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0372      372:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
037c      37c:	e9 00 00 00 00       	jmp    381 <.altinstr_replacement+0x381>	37d: R_X86_64_PLT32	.init.text+0xae12
0381      381:	e9 00 00 00 00       	jmp    386 <.altinstr_replacement+0x386>	382: R_X86_64_PLT32	.init.text+0xaef0
0386      386:	e9 00 00 00 00       	jmp    38b <.altinstr_replacement+0x38b>	387: R_X86_64_PLT32	.text+0x27008
038b      38b:	e9 00 00 00 00       	jmp    390 <.altinstr_replacement+0x390>	38c: R_X86_64_PLT32	.text+0x27aaa
0390      390:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
039a      39a:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
03a4      3a4:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
03ae      3ae:	0f ae e8             	lfence
03b1      3b1:	0f 31                	rdtsc
03b3      3b3:	0f 01 f9             	rdtscp
03b6      3b6:	e9 00 00 00 00       	jmp    3bb <.altinstr_replacement+0x3bb>	3b7: R_X86_64_PLT32	.text+0x2a0ce
03bb      3bb:	e9 00 00 00 00       	jmp    3c0 <.altinstr_replacement+0x3c0>	3bc: R_X86_64_PLT32	.text+0x2a122
03c0      3c0:	e9 00 00 00 00       	jmp    3c5 <.altinstr_replacement+0x3c5>	3c1: R_X86_64_PLT32	.text+0x2a129
03c5      3c5:	e9 00 00 00 00       	jmp    3ca <.altinstr_replacement+0x3ca>	3c6: R_X86_64_PLT32	.text+0x2a09a
03ca      3ca:	e9 00 00 00 00       	jmp    3cf <.altinstr_replacement+0x3cf>	3cb: R_X86_64_PLT32	.text+0x2a319
03cf      3cf:	e9 00 00 00 00       	jmp    3d4 <.altinstr_replacement+0x3d4>	3d0: R_X86_64_PLT32	.text+0x2a398
03d4      3d4:	e9 00 00 00 00       	jmp    3d9 <.altinstr_replacement+0x3d9>	3d5: R_X86_64_PLT32	.text+0x2a3d2
03d9      3d9:	e9 00 00 00 00       	jmp    3de <.altinstr_replacement+0x3de>	3da: R_X86_64_PLT32	.text+0x2a3f4
03de      3de:	e9 00 00 00 00       	jmp    3e3 <.altinstr_replacement+0x3e3>	3df: R_X86_64_PLT32	.text+0x2a3d9
03e3      3e3:	e9 00 00 00 00       	jmp    3e8 <.altinstr_replacement+0x3e8>	3e4: R_X86_64_PLT32	.text+0x2a2a9
03e8      3e8:	e9 00 00 00 00       	jmp    3ed <.altinstr_replacement+0x3ed>	3e9: R_X86_64_PLT32	.text+0x2a3fb
03ed      3ed:	e9 00 00 00 00       	jmp    3f2 <.altinstr_replacement+0x3f2>	3ee: R_X86_64_PLT32	.text+0x2a2a9
03f2      3f2:	e9 00 00 00 00       	jmp    3f7 <.altinstr_replacement+0x3f7>	3f3: R_X86_64_PLT32	.text+0x2a592
03f7      3f7:	e9 00 00 00 00       	jmp    3fc <.altinstr_replacement+0x3fc>	3f8: R_X86_64_PLT32	.text+0x2ad75
03fc      3fc:	48 0f ae 37          	xsaveopt64 (%rdi)
0400      400:	48 0f c7 27          	xsavec64 (%rdi)
0404      404:	48 0f c7 2f          	xsaves64 (%rdi)
0408      408:	e9 00 00 00 00       	jmp    40d <.altinstr_replacement+0x40d>	409: R_X86_64_PLT32	.text+0x2adaa
040d      40d:	e9 00 00 00 00       	jmp    412 <.altinstr_replacement+0x412>	40e: R_X86_64_PLT32	.text+0x2adee
0412      412:	48 0f c7 1f          	xrstors64 (%rdi)
0416      416:	e9 00 00 00 00       	jmp    41b <.altinstr_replacement+0x41b>	417: R_X86_64_PLT32	.text+0x2b086
041b      41b:	e9 00 00 00 00       	jmp    420 <.altinstr_replacement+0x420>	41c: R_X86_64_PLT32	.text+0x2b2f9
0420      420:	e9 00 00 00 00       	jmp    425 <.altinstr_replacement+0x425>	421: R_X86_64_PLT32	.text+0x2b234
0425      425:	48 0f c7 1f          	xrstors64 (%rdi)
0429      429:	e9 00 00 00 00       	jmp    42e <.altinstr_replacement+0x42e>	42a: R_X86_64_PLT32	.text+0x2b68e
042e      42e:	48 0f c7 1f          	xrstors64 (%rdi)
0432      432:	e9 00 00 00 00       	jmp    437 <.altinstr_replacement+0x437>	433: R_X86_64_PLT32	.text+0x2b844
0437      437:	e9 00 00 00 00       	jmp    43c <.altinstr_replacement+0x43c>	438: R_X86_64_PLT32	.text+0x2b952
043c      43c:	e9 00 00 00 00       	jmp    441 <.altinstr_replacement+0x441>	43d: R_X86_64_PLT32	.text+0x2babc
0441      441:	e9 00 00 00 00       	jmp    446 <.altinstr_replacement+0x446>	442: R_X86_64_PLT32	.text+0x2bc09
0446      446:	e8 00 00 00 00       	call   44b <.altinstr_replacement+0x44b>	447: R_X86_64_PLT32	copy_user_generic_string-0x4
044b      44b:	e8 00 00 00 00       	call   450 <.altinstr_replacement+0x450>	44c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0450      450:	e9 00 00 00 00       	jmp    455 <.altinstr_replacement+0x455>	451: R_X86_64_PLT32	.text+0x2bc77
0455      455:	e9 00 00 00 00       	jmp    45a <.altinstr_replacement+0x45a>	456: R_X86_64_PLT32	.text+0x2bd08
045a      45a:	e9 00 00 00 00       	jmp    45f <.altinstr_replacement+0x45f>	45b: R_X86_64_PLT32	.text+0x2bfdb
045f      45f:	e9 00 00 00 00       	jmp    464 <.altinstr_replacement+0x464>	460: R_X86_64_PLT32	.text+0x2c0bf
0464      464:	e8 00 00 00 00       	call   469 <.altinstr_replacement+0x469>	465: R_X86_64_PLT32	copy_user_generic_string-0x4
0469      469:	e8 00 00 00 00       	call   46e <.altinstr_replacement+0x46e>	46a: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
046e      46e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0478      478:	e9 00 00 00 00       	jmp    47d <.altinstr_replacement+0x47d>	479: R_X86_64_PLT32	.text+0x2c194
047d      47d:	0f 01 cb             	stac
0480      480:	e8 00 00 00 00       	call   485 <.altinstr_replacement+0x485>	481: R_X86_64_PLT32	clear_user_erms-0x4
0485      485:	e8 00 00 00 00       	call   48a <.altinstr_replacement+0x48a>	486: R_X86_64_PLT32	clear_user_rep_good-0x4
048a      48a:	e8 00 00 00 00       	call   48f <.altinstr_replacement+0x48f>	48b: R_X86_64_PLT32	clear_user_original-0x4
048f      48f:	0f 01 ca             	clac
0492      492:	e9 00 00 00 00       	jmp    497 <.altinstr_replacement+0x497>	493: R_X86_64_PLT32	.text+0x2c235
0497      497:	0f 01 cb             	stac
049a      49a:	0f 01 ca             	clac
049d      49d:	0f 01 cb             	stac
04a0      4a0:	e8 00 00 00 00       	call   4a5 <.altinstr_replacement+0x4a5>	4a1: R_X86_64_PLT32	clear_user_erms-0x4
04a5      4a5:	e8 00 00 00 00       	call   4aa <.altinstr_replacement+0x4aa>	4a6: R_X86_64_PLT32	clear_user_rep_good-0x4
04aa      4aa:	e8 00 00 00 00       	call   4af <.altinstr_replacement+0x4af>	4ab: R_X86_64_PLT32	clear_user_original-0x4
04af      4af:	0f 01 ca             	clac
04b2      4b2:	0f 01 cb             	stac
04b5      4b5:	0f 01 ca             	clac
04b8      4b8:	e8 00 00 00 00       	call   4bd <.altinstr_replacement+0x4bd>	4b9: R_X86_64_PLT32	copy_user_generic_string-0x4
04bd      4bd:	e8 00 00 00 00       	call   4c2 <.altinstr_replacement+0x4c2>	4be: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04c2      4c2:	e8 00 00 00 00       	call   4c7 <.altinstr_replacement+0x4c7>	4c3: R_X86_64_PLT32	copy_user_generic_string-0x4
04c7      4c7:	e8 00 00 00 00       	call   4cc <.altinstr_replacement+0x4cc>	4c8: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04cc      4cc:	e9 00 00 00 00       	jmp    4d1 <.altinstr_replacement+0x4d1>	4cd: R_X86_64_PLT32	.text+0x2c3b3
04d1      4d1:	e9 00 00 00 00       	jmp    4d6 <.altinstr_replacement+0x4d6>	4d2: R_X86_64_PLT32	.text+0x2c4d2
04d6      4d6:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
04e0      4e0:	e9 00 00 00 00       	jmp    4e5 <.altinstr_replacement+0x4e5>	4e1: R_X86_64_PLT32	.text+0x2c6f6
04e5      4e5:	e8 00 00 00 00       	call   4ea <.altinstr_replacement+0x4ea>	4e6: R_X86_64_PLT32	copy_user_generic_string-0x4
04ea      4ea:	e8 00 00 00 00       	call   4ef <.altinstr_replacement+0x4ef>	4eb: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04ef      4ef:	e9 00 00 00 00       	jmp    4f4 <.altinstr_replacement+0x4f4>	4f0: R_X86_64_PLT32	.text+0x2c64c
04f4      4f4:	e8 00 00 00 00       	call   4f9 <.altinstr_replacement+0x4f9>	4f5: R_X86_64_PLT32	copy_user_generic_string-0x4
04f9      4f9:	e8 00 00 00 00       	call   4fe <.altinstr_replacement+0x4fe>	4fa: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
04fe      4fe:	e9 00 00 00 00       	jmp    503 <.altinstr_replacement+0x503>	4ff: R_X86_64_PLT32	.text+0x2c6a7
0503      503:	e9 00 00 00 00       	jmp    508 <.altinstr_replacement+0x508>	504: R_X86_64_PLT32	.text+0x2c70e
0508      508:	e9 00 00 00 00       	jmp    50d <.altinstr_replacement+0x50d>	509: R_X86_64_PLT32	.text+0x2c73b
050d      50d:	e9 00 00 00 00       	jmp    512 <.altinstr_replacement+0x512>	50e: R_X86_64_PLT32	.init.text+0xc730
0512      512:	e8 00 00 00 00       	call   517 <.altinstr_replacement+0x517>	513: R_X86_64_PLT32	copy_user_generic_string-0x4
0517      517:	e8 00 00 00 00       	call   51c <.altinstr_replacement+0x51c>	518: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
051c      51c:	48 0f c7 1f          	xrstors64 (%rdi)
0520      520:	48 0f ae 37          	xsaveopt64 (%rdi)
0524      524:	48 0f c7 27          	xsavec64 (%rdi)
0528      528:	48 0f c7 2f          	xsaves64 (%rdi)
052c      52c:	e9 00 00 00 00       	jmp    531 <.altinstr_replacement+0x531>	52d: R_X86_64_PLT32	.text+0x2cabe
0531      531:	e9 00 00 00 00       	jmp    536 <.altinstr_replacement+0x536>	532: R_X86_64_PLT32	.text+0x2cba6
0536      536:	0f 01 cb             	stac
0539      539:	0f 01 ca             	clac
053c      53c:	0f 01 cb             	stac
053f      53f:	0f 01 ca             	clac
0542      542:	48 0f c7 1f          	xrstors64 (%rdi)
0546      546:	0f 01 cb             	stac
0549      549:	0f 01 ca             	clac
054c      54c:	e9 00 00 00 00       	jmp    551 <.altinstr_replacement+0x551>	54d: R_X86_64_PLT32	.text+0x2ccd3
0551      551:	e9 00 00 00 00       	jmp    556 <.altinstr_replacement+0x556>	552: R_X86_64_PLT32	.text+0x2cd36
0556      556:	e9 00 00 00 00       	jmp    55b <.altinstr_replacement+0x55b>	557: R_X86_64_PLT32	.init.text+0xc956
055b      55b:	e9 00 00 00 00       	jmp    560 <.altinstr_replacement+0x560>	55c: R_X86_64_PLT32	.init.text+0xc967
0560      560:	e9 00 00 00 00       	jmp    565 <.altinstr_replacement+0x565>	561: R_X86_64_PLT32	.init.text+0xc971
0565      565:	e9 00 00 00 00       	jmp    56a <.altinstr_replacement+0x56a>	566: R_X86_64_PLT32	.init.text+0xc873
056a      56a:	e9 00 00 00 00       	jmp    56f <.altinstr_replacement+0x56f>	56b: R_X86_64_PLT32	.init.text+0xcbb2
056f      56f:	e9 00 00 00 00       	jmp    574 <.altinstr_replacement+0x574>	570: R_X86_64_PLT32	.init.text+0xcbfc
0574      574:	e9 00 00 00 00       	jmp    579 <.altinstr_replacement+0x579>	575: R_X86_64_PLT32	.text+0x2cd99
0579      579:	e9 00 00 00 00       	jmp    57e <.altinstr_replacement+0x57e>	57a: R_X86_64_PLT32	.text+0x2cdc3
057e      57e:	e9 00 00 00 00       	jmp    583 <.altinstr_replacement+0x583>	57f: R_X86_64_PLT32	.text+0x2cdfa
0583      583:	e9 00 00 00 00       	jmp    588 <.altinstr_replacement+0x588>	584: R_X86_64_PLT32	.text+0x2cf16
0588      588:	e9 00 00 00 00       	jmp    58d <.altinstr_replacement+0x58d>	589: R_X86_64_PLT32	.text+0x2d704
058d      58d:	e9 00 00 00 00       	jmp    592 <.altinstr_replacement+0x592>	58e: R_X86_64_PLT32	.text+0x2d70b
0592      592:	e9 00 00 00 00       	jmp    597 <.altinstr_replacement+0x597>	593: R_X86_64_PLT32	.text+0x2d99b
0597      597:	e9 00 00 00 00       	jmp    59c <.altinstr_replacement+0x59c>	598: R_X86_64_PLT32	.text+0x2dc6d
059c      59c:	e9 00 00 00 00       	jmp    5a1 <.altinstr_replacement+0x5a1>	59d: R_X86_64_PLT32	.init.text+0xcdeb
05a1      5a1:	e9 00 00 00 00       	jmp    5a6 <.altinstr_replacement+0x5a6>	5a2: R_X86_64_PLT32	.init.text+0xcf68
05a6      5a6:	e9 00 00 00 00       	jmp    5ab <.altinstr_replacement+0x5ab>	5a7: R_X86_64_PLT32	.init.text+0xcf70
05ab      5ab:	e9 00 00 00 00       	jmp    5b0 <.altinstr_replacement+0x5b0>	5ac: R_X86_64_PLT32	.text+0x2ddbf
05b0      5b0:	e9 00 00 00 00       	jmp    5b5 <.altinstr_replacement+0x5b5>	5b1: R_X86_64_PLT32	.init.text+0xd45a
05b5      5b5:	e9 00 00 00 00       	jmp    5ba <.altinstr_replacement+0x5ba>	5b6: R_X86_64_PLT32	.text+0x2e0be
05ba      5ba:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
05c4      5c4:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
05ce      5ce:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
05d8      5d8:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
05e2      5e2:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
05ec      5ec:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
05f6      5f6:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0600      600:	e8 00 00 00 00       	call   605 <.altinstr_replacement+0x605>	601: R_X86_64_PLT32	copy_user_generic_string-0x4
0605      605:	e8 00 00 00 00       	call   60a <.altinstr_replacement+0x60a>	606: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
060a      60a:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0614      614:	e9 00 00 00 00       	jmp    619 <.altinstr_replacement+0x619>	615: R_X86_64_PLT32	.text+0x30ea1
0619      619:	e9 00 00 00 00       	jmp    61e <.altinstr_replacement+0x61e>	61a: R_X86_64_PLT32	.text+0x30e8c
061e      61e:	e9 00 00 00 00       	jmp    623 <.altinstr_replacement+0x623>	61f: R_X86_64_PLT32	.text+0x30e9b
0623      623:	e9 00 00 00 00       	jmp    628 <.altinstr_replacement+0x628>	624: R_X86_64_PLT32	.text+0x30ea5
0628      628:	e9 00 00 00 00       	jmp    62d <.altinstr_replacement+0x62d>	629: R_X86_64_PLT32	.text+0x30ec0
062d      62d:	e9 00 00 00 00       	jmp    632 <.altinstr_replacement+0x632>	62e: R_X86_64_PLT32	.text+0x30ee0
0632      632:	e9 00 00 00 00       	jmp    637 <.altinstr_replacement+0x637>	633: R_X86_64_PLT32	.text+0x312ce
0637      637:	e9 00 00 00 00       	jmp    63c <.altinstr_replacement+0x63c>	638: R_X86_64_PLT32	.text+0x31aa9
063c      63c:	e9 00 00 00 00       	jmp    641 <.altinstr_replacement+0x641>	63d: R_X86_64_PLT32	.text+0x3275d
0641      641:	e9 00 00 00 00       	jmp    646 <.altinstr_replacement+0x646>	642: R_X86_64_PLT32	.text+0x327d4
0646      646:	e9 00 00 00 00       	jmp    64b <.altinstr_replacement+0x64b>	647: R_X86_64_PLT32	.text+0x327db
064b      64b:	e9 00 00 00 00       	jmp    650 <.altinstr_replacement+0x650>	64c: R_X86_64_PLT32	.text+0x327c0
0650      650:	e9 00 00 00 00       	jmp    655 <.altinstr_replacement+0x655>	651: R_X86_64_PLT32	.init.text+0xf170
0655      655:	e9 00 00 00 00       	jmp    65a <.altinstr_replacement+0x65a>	656: R_X86_64_PLT32	.init.text+0xf177
065a      65a:	e9 00 00 00 00       	jmp    65f <.altinstr_replacement+0x65f>	65b: R_X86_64_PLT32	.text+0x33209
065f      65f:	e9 00 00 00 00       	jmp    664 <.altinstr_replacement+0x664>	660: R_X86_64_PLT32	.text+0x33289
0664      664:	e9 00 00 00 00       	jmp    669 <.altinstr_replacement+0x669>	665: R_X86_64_PLT32	.init.text+0xf29b
0669      669:	e9 00 00 00 00       	jmp    66e <.altinstr_replacement+0x66e>	66a: R_X86_64_PLT32	.text+0x332b8
066e      66e:	e9 00 00 00 00       	jmp    673 <.altinstr_replacement+0x673>	66f: R_X86_64_PLT32	.text+0x342d5
0673      673:	e9 00 00 00 00       	jmp    678 <.altinstr_replacement+0x678>	674: R_X86_64_PLT32	.text+0x3565b
0678      678:	e9 00 00 00 00       	jmp    67d <.altinstr_replacement+0x67d>	679: R_X86_64_PLT32	.text+0x3565b
067d      67d:	e9 00 00 00 00       	jmp    682 <.altinstr_replacement+0x682>	67e: R_X86_64_PLT32	.text+0x3570c
0682      682:	e9 00 00 00 00       	jmp    687 <.altinstr_replacement+0x687>	683: R_X86_64_PLT32	.text+0x35c40
0687      687:	e9 00 00 00 00       	jmp    68c <.altinstr_replacement+0x68c>	688: R_X86_64_PLT32	.text+0x35c4c
068c      68c:	e9 00 00 00 00       	jmp    691 <.altinstr_replacement+0x691>	68d: R_X86_64_PLT32	.text+0x35c58
0691      691:	e9 00 00 00 00       	jmp    696 <.altinstr_replacement+0x696>	692: R_X86_64_PLT32	.text+0x35efd
0696      696:	e9 00 00 00 00       	jmp    69b <.altinstr_replacement+0x69b>	697: R_X86_64_PLT32	.text+0x35f0c
069b      69b:	e9 00 00 00 00       	jmp    6a0 <.altinstr_replacement+0x6a0>	69c: R_X86_64_PLT32	.text+0x35f3c
06a0      6a0:	e9 00 00 00 00       	jmp    6a5 <.altinstr_replacement+0x6a5>	6a1: R_X86_64_PLT32	.noinstr.text+0x1836
06a5      6a5:	e9 00 00 00 00       	jmp    6aa <.altinstr_replacement+0x6aa>	6a6: R_X86_64_PLT32	.noinstr.text+0x1845
06aa      6aa:	e9 00 00 00 00       	jmp    6af <.altinstr_replacement+0x6af>	6ab: R_X86_64_PLT32	.noinstr.text+0x1a0f
06af      6af:	e9 00 00 00 00       	jmp    6b4 <.altinstr_replacement+0x6b4>	6b0: R_X86_64_PLT32	.noinstr.text+0x1bdc
06b4      6b4:	e9 00 00 00 00       	jmp    6b9 <.altinstr_replacement+0x6b9>	6b5: R_X86_64_PLT32	.noinstr.text+0x1d52
06b9      6b9:	e9 00 00 00 00       	jmp    6be <.altinstr_replacement+0x6be>	6ba: R_X86_64_PLT32	.text+0x360e0
06be      6be:	e9 00 00 00 00       	jmp    6c3 <.altinstr_replacement+0x6c3>	6bf: R_X86_64_PLT32	.noinstr.text+0x21d3
06c3      6c3:	e9 00 00 00 00       	jmp    6c8 <.altinstr_replacement+0x6c8>	6c4: R_X86_64_PLT32	.noinstr.text+0x2252
06c8      6c8:	e9 00 00 00 00       	jmp    6cd <.altinstr_replacement+0x6cd>	6c9: R_X86_64_PLT32	.text+0x36818
06cd      6cd:	e9 00 00 00 00       	jmp    6d2 <.altinstr_replacement+0x6d2>	6ce: R_X86_64_PLT32	.text+0x36830
06d2      6d2:	e9 00 00 00 00       	jmp    6d7 <.altinstr_replacement+0x6d7>	6d3: R_X86_64_PLT32	.text+0x368c0
06d7      6d7:	e9 00 00 00 00       	jmp    6dc <.altinstr_replacement+0x6dc>	6d8: R_X86_64_PLT32	.init.text+0xfc48
06dc      6dc:	e9 00 00 00 00       	jmp    6e1 <.altinstr_replacement+0x6e1>	6dd: R_X86_64_PLT32	.text+0x37561
06e1      6e1:	e9 00 00 00 00       	jmp    6e6 <.altinstr_replacement+0x6e6>	6e2: R_X86_64_PLT32	.text+0x3785b
06e6      6e6:	e9 00 00 00 00       	jmp    6eb <.altinstr_replacement+0x6eb>	6e7: R_X86_64_PLT32	.text+0x38b03
06eb      6eb:	e9 00 00 00 00       	jmp    6f0 <.altinstr_replacement+0x6f0>	6ec: R_X86_64_PLT32	.text+0x38b9e
06f0      6f0:	0f ae e8             	lfence
06f3      6f3:	0f 31                	rdtsc
06f5      6f5:	0f 01 f9             	rdtscp
06f8      6f8:	e9 00 00 00 00       	jmp    6fd <.altinstr_replacement+0x6fd>	6f9: R_X86_64_PLT32	.text+0x39299
06fd      6fd:	e9 00 00 00 00       	jmp    702 <.altinstr_replacement+0x702>	6fe: R_X86_64_PLT32	.text+0x392b9
0702      702:	e9 00 00 00 00       	jmp    707 <.altinstr_replacement+0x707>	703: R_X86_64_PLT32	.text+0x392da
0707      707:	0f 01 c1             	vmcall
070a      70a:	0f 01 d9             	vmmcall
070d      70d:	0f 01 c1             	vmcall
0710      710:	0f 01 d9             	vmmcall
0713      713:	0f 01 c1             	vmcall
0716      716:	0f 01 d9             	vmmcall
0719      719:	e9 00 00 00 00       	jmp    71e <.altinstr_replacement+0x71e>	71a: R_X86_64_PLT32	.cpuidle.text+0x1ab
071e      71e:	e9 00 00 00 00       	jmp    723 <.altinstr_replacement+0x723>	71f: R_X86_64_PLT32	.cpuidle.text+0x12f
0723      723:	e9 00 00 00 00       	jmp    728 <.altinstr_replacement+0x728>	724: R_X86_64_PLT32	.init.text+0x14281
0728      728:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
072f      72f:	87 2c 25 10 d3 5f ff 	xchg   %ebp,0xffffffffff5fd310
0736      736:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
073d      73d:	87 b0 00 d0 5f ff    	xchg   %esi,-0xa03000(%rax)
0743      743:	c3                   	ret
0744      744:	cc                   	int3
0745      745:	c3                   	ret
0746      746:	cc                   	int3
0747      747:	0f ae e8             	lfence
074a      74a:	0f 31                	rdtsc
074c      74c:	0f 01 f9             	rdtscp
074f      74f:	e9 00 00 00 00       	jmp    754 <.altinstr_replacement+0x754>	750: R_X86_64_PLT32	.text+0x4650b
0754      754:	e8 00 00 00 00       	call   759 <.altinstr_replacement+0x759>	755: R_X86_64_PLT32	clear_page_rep-0x4
0759      759:	e8 00 00 00 00       	call   75e <.altinstr_replacement+0x75e>	75a: R_X86_64_PLT32	clear_page_erms-0x4
075e      75e:	e8 00 00 00 00       	call   763 <.altinstr_replacement+0x763>	75f: R_X86_64_PLT32	clear_page_rep-0x4
0763      763:	e8 00 00 00 00       	call   768 <.altinstr_replacement+0x768>	764: R_X86_64_PLT32	clear_page_erms-0x4
0768      768:	e9 00 00 00 00       	jmp    76d <.altinstr_replacement+0x76d>	769: R_X86_64_PLT32	.text+0x46e45
076d      76d:	e9 00 00 00 00       	jmp    772 <.altinstr_replacement+0x772>	76e: R_X86_64_PLT32	.text+0x470f6
0772      772:	e9 00 00 00 00       	jmp    777 <.altinstr_replacement+0x777>	773: R_X86_64_PLT32	.text+0x470fb
0777      777:	e9 00 00 00 00       	jmp    77c <.altinstr_replacement+0x77c>	778: R_X86_64_PLT32	.text+0x48f87
077c      77c:	e9 00 00 00 00       	jmp    781 <.altinstr_replacement+0x781>	77d: R_X86_64_PLT32	.init.text+0x19529
0781      781:	0f ae e8             	lfence
0784      784:	0f 31                	rdtsc
0786      786:	0f 01 f9             	rdtscp
0789      789:	e8 00 00 00 00       	call   78e <.altinstr_replacement+0x78e>	78a: R_X86_64_PLT32	clear_page_rep-0x4
078e      78e:	e8 00 00 00 00       	call   793 <.altinstr_replacement+0x793>	78f: R_X86_64_PLT32	clear_page_erms-0x4
0793      793:	e9 00 00 00 00       	jmp    798 <.altinstr_replacement+0x798>	794: R_X86_64_PLT32	.text+0x4fcc7
0798      798:	e9 00 00 00 00       	jmp    79d <.altinstr_replacement+0x79d>	799: R_X86_64_PLT32	.text+0x4fd95
079d      79d:	e9 00 00 00 00       	jmp    7a2 <.altinstr_replacement+0x7a2>	79e: R_X86_64_PLT32	.text+0x4fd9a
07a2      7a2:	e9 00 00 00 00       	jmp    7a7 <.altinstr_replacement+0x7a7>	7a3: R_X86_64_PLT32	.text+0x4ff11
07a7      7a7:	e9 00 00 00 00       	jmp    7ac <.altinstr_replacement+0x7ac>	7a8: R_X86_64_PLT32	.text+0x50013
07ac      7ac:	e9 00 00 00 00       	jmp    7b1 <.altinstr_replacement+0x7b1>	7ad: R_X86_64_PLT32	.text+0x500c4
07b1      7b1:	e9 00 00 00 00       	jmp    7b6 <.altinstr_replacement+0x7b6>	7b2: R_X86_64_PLT32	.text+0x5015a
07b6      7b6:	e9 00 00 00 00       	jmp    7bb <.altinstr_replacement+0x7bb>	7b7: R_X86_64_PLT32	.text+0x501c7
07bb      7bb:	e9 00 00 00 00       	jmp    7c0 <.altinstr_replacement+0x7c0>	7bc: R_X86_64_PLT32	.text+0x501a6
07c0      7c0:	e9 00 00 00 00       	jmp    7c5 <.altinstr_replacement+0x7c5>	7c1: R_X86_64_PLT32	.text+0x50233
07c5      7c5:	e9 00 00 00 00       	jmp    7ca <.altinstr_replacement+0x7ca>	7c6: R_X86_64_PLT32	.text+0x50231
07ca      7ca:	e9 00 00 00 00       	jmp    7cf <.altinstr_replacement+0x7cf>	7cb: R_X86_64_PLT32	.text+0x50238
07cf      7cf:	e9 00 00 00 00       	jmp    7d4 <.altinstr_replacement+0x7d4>	7d0: R_X86_64_PLT32	.init.text+0x1b02c
07d4      7d4:	e9 00 00 00 00       	jmp    7d9 <.altinstr_replacement+0x7d9>	7d5: R_X86_64_PLT32	.init.text+0x1b190
07d9      7d9:	e9 00 00 00 00       	jmp    7de <.altinstr_replacement+0x7de>	7da: R_X86_64_PLT32	.init.text+0x1b195
07de      7de:	e9 00 00 00 00       	jmp    7e3 <.altinstr_replacement+0x7e3>	7df: R_X86_64_PLT32	.meminit.text+0x42c
07e3      7e3:	e9 00 00 00 00       	jmp    7e8 <.altinstr_replacement+0x7e8>	7e4: R_X86_64_PLT32	.meminit.text+0x516
07e8      7e8:	e9 00 00 00 00       	jmp    7ed <.altinstr_replacement+0x7ed>	7e9: R_X86_64_PLT32	.meminit.text+0x51b
07ed      7ed:	e9 00 00 00 00       	jmp    7f2 <.altinstr_replacement+0x7f2>	7ee: R_X86_64_PLT32	.meminit.text+0x51d
07f2      7f2:	e9 00 00 00 00       	jmp    7f7 <.altinstr_replacement+0x7f7>	7f3: R_X86_64_PLT32	.meminit.text+0x606
07f7      7f7:	e9 00 00 00 00       	jmp    7fc <.altinstr_replacement+0x7fc>	7f8: R_X86_64_PLT32	.meminit.text+0x6c8
07fc      7fc:	e9 00 00 00 00       	jmp    801 <.altinstr_replacement+0x801>	7fd: R_X86_64_PLT32	.init.text+0x1b42a
0801      801:	e9 00 00 00 00       	jmp    806 <.altinstr_replacement+0x806>	802: R_X86_64_PLT32	.init.text+0x1b347
0806      806:	e9 00 00 00 00       	jmp    80b <.altinstr_replacement+0x80b>	807: R_X86_64_PLT32	.init.text+0x1b432
080b      80b:	e9 00 00 00 00       	jmp    810 <.altinstr_replacement+0x810>	80c: R_X86_64_PLT32	.init.text+0x1b437
0810      810:	e9 00 00 00 00       	jmp    815 <.altinstr_replacement+0x815>	811: R_X86_64_PLT32	.text+0x5061b
0815      815:	e9 00 00 00 00       	jmp    81a <.altinstr_replacement+0x81a>	816: R_X86_64_PLT32	.text+0x506a3
081a      81a:	e9 00 00 00 00       	jmp    81f <.altinstr_replacement+0x81f>	81b: R_X86_64_PLT32	.text+0x508aa
081f      81f:	e9 00 00 00 00       	jmp    824 <.altinstr_replacement+0x824>	820: R_X86_64_PLT32	.meminit.text+0xcf8
0824      824:	e9 00 00 00 00       	jmp    829 <.altinstr_replacement+0x829>	825: R_X86_64_PLT32	.meminit.text+0xb7c
0829      829:	e9 00 00 00 00       	jmp    82e <.altinstr_replacement+0x82e>	82a: R_X86_64_PLT32	.meminit.text+0xcd8
082e      82e:	e9 00 00 00 00       	jmp    833 <.altinstr_replacement+0x833>	82f: R_X86_64_PLT32	.meminit.text+0xcd3
0833      833:	e9 00 00 00 00       	jmp    838 <.altinstr_replacement+0x838>	834: R_X86_64_PLT32	.meminit.text+0xcdd
0838      838:	e9 00 00 00 00       	jmp    83d <.altinstr_replacement+0x83d>	839: R_X86_64_PLT32	.text+0x50ad1
083d      83d:	e9 00 00 00 00       	jmp    842 <.altinstr_replacement+0x842>	83e: R_X86_64_PLT32	.text+0x50a83
0842      842:	e9 00 00 00 00       	jmp    847 <.altinstr_replacement+0x847>	843: R_X86_64_PLT32	.text+0x50ad1
0847      847:	e9 00 00 00 00       	jmp    84c <.altinstr_replacement+0x84c>	848: R_X86_64_PLT32	.meminit.text+0x1764
084c      84c:	e9 00 00 00 00       	jmp    851 <.altinstr_replacement+0x851>	84d: R_X86_64_PLT32	.meminit.text+0x19bf
0851      851:	e9 00 00 00 00       	jmp    856 <.altinstr_replacement+0x856>	852: R_X86_64_PLT32	.text+0x50b71
0856      856:	e9 00 00 00 00       	jmp    85b <.altinstr_replacement+0x85b>	857: R_X86_64_PLT32	.text+0x50c18
085b      85b:	e9 00 00 00 00       	jmp    860 <.altinstr_replacement+0x860>	85c: R_X86_64_PLT32	.text+0x50c30
0860      860:	e9 00 00 00 00       	jmp    865 <.altinstr_replacement+0x865>	861: R_X86_64_PLT32	.text+0x50c6d
0865      865:	e9 00 00 00 00       	jmp    86a <.altinstr_replacement+0x86a>	866: R_X86_64_PLT32	.text+0x50def
086a      86a:	e9 00 00 00 00       	jmp    86f <.altinstr_replacement+0x86f>	86b: R_X86_64_PLT32	.text+0x51016
086f      86f:	e9 00 00 00 00       	jmp    874 <.altinstr_replacement+0x874>	870: R_X86_64_PLT32	.text+0x50f89
0874      874:	e9 00 00 00 00       	jmp    879 <.altinstr_replacement+0x879>	875: R_X86_64_PLT32	.text+0x50f8e
0879      879:	e9 00 00 00 00       	jmp    87e <.altinstr_replacement+0x87e>	87a: R_X86_64_PLT32	.text+0x5128e
087e      87e:	e9 00 00 00 00       	jmp    883 <.altinstr_replacement+0x883>	87f: R_X86_64_PLT32	.text+0x51476
0883      883:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
088d      88d:	e9 00 00 00 00       	jmp    892 <.altinstr_replacement+0x892>	88e: R_X86_64_PLT32	.text+0x515d7
0892      892:	0f 0d 88 f8 00 00 00 	prefetchw 0xf8(%rax)
0899      899:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
08a3      8a3:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
08ad      8ad:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
08b7      8b7:	e9 00 00 00 00       	jmp    8bc <.altinstr_replacement+0x8bc>	8b8: R_X86_64_PLT32	.text+0x52103
08bc      8bc:	e9 00 00 00 00       	jmp    8c1 <.altinstr_replacement+0x8c1>	8bd: R_X86_64_PLT32	.text+0x522dd
08c1      8c1:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
08cb      8cb:	e9 00 00 00 00       	jmp    8d0 <.altinstr_replacement+0x8d0>	8cc: R_X86_64_PLT32	.init.text+0x1b6f8
08d0      8d0:	e9 00 00 00 00       	jmp    8d5 <.altinstr_replacement+0x8d5>	8d1: R_X86_64_PLT32	.text+0x52b29
08d5      8d5:	e9 00 00 00 00       	jmp    8da <.altinstr_replacement+0x8da>	8d6: R_X86_64_PLT32	.text+0x52b33
08da      8da:	e9 00 00 00 00       	jmp    8df <.altinstr_replacement+0x8df>	8db: R_X86_64_PLT32	.text+0x52f2c
08df      8df:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
08e9      8e9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
08f3      8f3:	e9 00 00 00 00       	jmp    8f8 <.altinstr_replacement+0x8f8>	8f4: R_X86_64_PLT32	.text+0x5357d
08f8      8f8:	e9 00 00 00 00       	jmp    8fd <.altinstr_replacement+0x8fd>	8f9: R_X86_64_PLT32	.text+0x53587
08fd      8fd:	e9 00 00 00 00       	jmp    902 <.altinstr_replacement+0x902>	8fe: R_X86_64_PLT32	.text+0x5421b
0902      902:	e9 00 00 00 00       	jmp    907 <.altinstr_replacement+0x907>	903: R_X86_64_PLT32	.text+0x54225
0907      907:	e9 00 00 00 00       	jmp    90c <.altinstr_replacement+0x90c>	908: R_X86_64_PLT32	.text+0x546d0
090c      90c:	0f 30                	wrmsr
090e      90e:	0f 30                	wrmsr
0910      910:	e9 00 00 00 00       	jmp    915 <.altinstr_replacement+0x915>	911: R_X86_64_PLT32	.text+0x548ff
0915      915:	e9 00 00 00 00       	jmp    91a <.altinstr_replacement+0x91a>	916: R_X86_64_PLT32	.text+0x54988
091a      91a:	e9 00 00 00 00       	jmp    91f <.altinstr_replacement+0x91f>	91b: R_X86_64_PLT32	.text+0x54a8d
091f      91f:	e9 00 00 00 00       	jmp    924 <.altinstr_replacement+0x924>	920: R_X86_64_PLT32	.text+0x55240
0924      924:	e9 00 00 00 00       	jmp    929 <.altinstr_replacement+0x929>	925: R_X86_64_PLT32	.text+0x55273
0929      929:	e9 00 00 00 00       	jmp    92e <.altinstr_replacement+0x92e>	92a: R_X86_64_PLT32	.text+0x552d3
092e      92e:	e9 00 00 00 00       	jmp    933 <.altinstr_replacement+0x933>	92f: R_X86_64_PLT32	.text+0x5531b
0933      933:	e9 00 00 00 00       	jmp    938 <.altinstr_replacement+0x938>	934: R_X86_64_PLT32	.text+0x555ac
0938      938:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0942      942:	66 0f ae 39          	clflushopt (%rcx)
0946      946:	66 0f ae 39          	clflushopt (%rcx)
094a      94a:	e9 00 00 00 00       	jmp    94f <.altinstr_replacement+0x94f>	94b: R_X86_64_PLT32	.text+0x559eb
094f      94f:	e9 00 00 00 00       	jmp    954 <.altinstr_replacement+0x954>	950: R_X86_64_PLT32	.text+0x55a10
0954      954:	e9 00 00 00 00       	jmp    959 <.altinstr_replacement+0x959>	955: R_X86_64_PLT32	.text+0x55a38
0959      959:	e9 00 00 00 00       	jmp    95e <.altinstr_replacement+0x95e>	95a: R_X86_64_PLT32	.text+0x55b75
095e      95e:	e9 00 00 00 00       	jmp    963 <.altinstr_replacement+0x963>	95f: R_X86_64_PLT32	.text+0x55c22
0963      963:	e9 00 00 00 00       	jmp    968 <.altinstr_replacement+0x968>	964: R_X86_64_PLT32	.text+0x55cf5
0968      968:	e9 00 00 00 00       	jmp    96d <.altinstr_replacement+0x96d>	969: R_X86_64_PLT32	.text+0x579bd
096d      96d:	66 0f ae 39          	clflushopt (%rcx)
0971      971:	e9 00 00 00 00       	jmp    976 <.altinstr_replacement+0x976>	972: R_X86_64_PLT32	.text+0x57e04
0976      976:	e9 00 00 00 00       	jmp    97b <.altinstr_replacement+0x97b>	977: R_X86_64_PLT32	.text+0x58334
097b      97b:	e9 00 00 00 00       	jmp    980 <.altinstr_replacement+0x980>	97c: R_X86_64_PLT32	.text+0x58339
0980      980:	e9 00 00 00 00       	jmp    985 <.altinstr_replacement+0x985>	981: R_X86_64_PLT32	.init.text+0x1bcff
0985      985:	e9 00 00 00 00       	jmp    98a <.altinstr_replacement+0x98a>	986: R_X86_64_PLT32	.init.text+0x1bd49
098a      98a:	e9 00 00 00 00       	jmp    98f <.altinstr_replacement+0x98f>	98b: R_X86_64_PLT32	.text+0x5acee
098f      98f:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0999      999:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
09a3      9a3:	0f 01 cb             	stac
09a6      9a6:	0f ae e8             	lfence
09a9      9a9:	0f 01 ca             	clac
09ac      9ac:	0f 01 ca             	clac
09af      9af:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
09b9      9b9:	0f 01 cb             	stac
09bc      9bc:	0f ae e8             	lfence
09bf      9bf:	0f 01 ca             	clac
09c2      9c2:	0f 01 ca             	clac
09c5      9c5:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
09cf      9cf:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
09d9      9d9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
09e3      9e3:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
09ed      9ed:	0f 01 cb             	stac
09f0      9f0:	e8 00 00 00 00       	call   9f5 <.altinstr_replacement+0x9f5>	9f1: R_X86_64_PLT32	clear_user_erms-0x4
09f5      9f5:	e8 00 00 00 00       	call   9fa <.altinstr_replacement+0x9fa>	9f6: R_X86_64_PLT32	clear_user_rep_good-0x4
09fa      9fa:	e8 00 00 00 00       	call   9ff <.altinstr_replacement+0x9ff>	9fb: R_X86_64_PLT32	clear_user_original-0x4
09ff      9ff:	0f 01 ca             	clac
0a02      a02:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a0c      a0c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a16      a16:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a20      a20:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a2a      a2a:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0a34      a34:	e9 00 00 00 00       	jmp    a39 <.altinstr_replacement+0xa39>	a35: R_X86_64_PLT32	.text+0x1364b7
0a39      a39:	e9 00 00 00 00       	jmp    a3e <.altinstr_replacement+0xa3e>	a3a: R_X86_64_PLT32	.text+0x1364c1
0a3e      a3e:	e9 00 00 00 00       	jmp    a43 <.altinstr_replacement+0xa43>	a3f: R_X86_64_PLT32	.text+0x148d07
0a43      a43:	e9 00 00 00 00       	jmp    a48 <.altinstr_replacement+0xa48>	a44: R_X86_64_PLT32	.text+0x148d10
0a48      a48:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a52      a52:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0a5c      a5c:	e9 00 00 00 00       	jmp    a61 <.altinstr_replacement+0xa61>	a5d: R_X86_64_PLT32	.noinstr.text+0x3120
0a61      a61:	e9 00 00 00 00       	jmp    a66 <.altinstr_replacement+0xa66>	a62: R_X86_64_PLT32	.noinstr.text+0x32c5
0a66      a66:	e9 00 00 00 00       	jmp    a6b <.altinstr_replacement+0xa6b>	a67: R_X86_64_PLT32	.noinstr.text+0x3378
0a6b      a6b:	e9 00 00 00 00       	jmp    a70 <.altinstr_replacement+0xa70>	a6c: R_X86_64_PLT32	.noinstr.text+0x34c0
0a70      a70:	49 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r8
0a7a      a7a:	e9 00 00 00 00       	jmp    a7f <.altinstr_replacement+0xa7f>	a7b: R_X86_64_PLT32	.text+0x1732cb
0a7f      a7f:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0a89      a89:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0a93      a93:	0f 01 cb             	stac
0a96      a96:	0f ae e8             	lfence
0a99      a99:	0f 01 ca             	clac
0a9c      a9c:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
0aa6      aa6:	0f 01 cb             	stac
0aa9      aa9:	0f ae e8             	lfence
0aac      aac:	0f 01 ca             	clac
0aaf      aaf:	0f 01 ca             	clac
0ab2      ab2:	0f 01 ca             	clac
0ab5      ab5:	e9 00 00 00 00       	jmp    aba <.altinstr_replacement+0xaba>	ab6: R_X86_64_PLT32	.init.text+0x21964
0aba      aba:	e9 00 00 00 00       	jmp    abf <.altinstr_replacement+0xabf>	abb: R_X86_64_PLT32	.init.text+0x2196e
0abf      abf:	e9 00 00 00 00       	jmp    ac4 <.altinstr_replacement+0xac4>	ac0: R_X86_64_PLT32	.text+0x192d96
0ac4      ac4:	e9 00 00 00 00       	jmp    ac9 <.altinstr_replacement+0xac9>	ac5: R_X86_64_PLT32	.text+0x193463
0ac9      ac9:	e9 00 00 00 00       	jmp    ace <.altinstr_replacement+0xace>	aca: R_X86_64_PLT32	.text+0x19362a
0ace      ace:	e8 00 00 00 00       	call   ad3 <.altinstr_replacement+0xad3>	acf: R_X86_64_PLT32	clear_page_rep-0x4
0ad3      ad3:	e8 00 00 00 00       	call   ad8 <.altinstr_replacement+0xad8>	ad4: R_X86_64_PLT32	clear_page_erms-0x4
0ad8      ad8:	e8 00 00 00 00       	call   add <.altinstr_replacement+0xadd>	ad9: R_X86_64_PLT32	clear_page_rep-0x4
0add      add:	e8 00 00 00 00       	call   ae2 <.altinstr_replacement+0xae2>	ade: R_X86_64_PLT32	clear_page_erms-0x4
0ae2      ae2:	e9 00 00 00 00       	jmp    ae7 <.altinstr_replacement+0xae7>	ae3: R_X86_64_PLT32	.text+0x1944ff
0ae7      ae7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0af1      af1:	49 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r8
0afb      afb:	0f 01 cb             	stac
0afe      afe:	0f ae e8             	lfence
0b01      b01:	0f 01 ca             	clac
0b04      b04:	0f 01 ca             	clac
0b07      b07:	49 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r8
0b11      b11:	0f 01 cb             	stac
0b14      b14:	0f ae e8             	lfence
0b17      b17:	0f 01 ca             	clac
0b1a      b1a:	0f 01 ca             	clac
0b1d      b1d:	e8 00 00 00 00       	call   b22 <.altinstr_replacement+0xb22>	b1e: R_X86_64_PLT32	copy_user_generic_string-0x4
0b22      b22:	e8 00 00 00 00       	call   b27 <.altinstr_replacement+0xb27>	b23: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b27      b27:	e8 00 00 00 00       	call   b2c <.altinstr_replacement+0xb2c>	b28: R_X86_64_PLT32	copy_user_generic_string-0x4
0b2c      b2c:	e8 00 00 00 00       	call   b31 <.altinstr_replacement+0xb31>	b2d: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0b31      b31:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b3b      b3b:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b45      b45:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b4f      b4f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b59      b59:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b63      b63:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b6d      b6d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b77      b77:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b81      b81:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0b8b      b8b:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0b95      b95:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0b9f      b9f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ba9      ba9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bb3      bb3:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bbd      bbd:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bc7      bc7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bd1      bd1:	0f ae e8             	lfence
0bd4      bd4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bd9      bd9:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
0be3      be3:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
0bed      bed:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bf2      bf2:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0bfc      bfc:	e9 00 00 00 00       	jmp    c01 <.altinstr_replacement+0xc01>	bfd: R_X86_64_PLT32	.text+0x247c3a
0c01      c01:	e9 00 00 00 00       	jmp    c06 <.altinstr_replacement+0xc06>	c02: R_X86_64_PLT32	.text+0x250193
0c06      c06:	e9 00 00 00 00       	jmp    c0b <.altinstr_replacement+0xc0b>	c07: R_X86_64_PLT32	.text+0x2502c7
0c0b      c0b:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0c15      c15:	e9 00 00 00 00       	jmp    c1a <.altinstr_replacement+0xc1a>	c16: R_X86_64_PLT32	.text+0x25cd21
0c1a      c1a:	e9 00 00 00 00       	jmp    c1f <.altinstr_replacement+0xc1f>	c1b: R_X86_64_PLT32	.text+0x25cd28
0c1f      c1f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0c29      c29:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0c33      c33:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0c3d      c3d:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0c47      c47:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0c51      c51:	0f 01 cb             	stac
0c54      c54:	0f ae e8             	lfence
0c57      c57:	0f 01 ca             	clac
0c5a      c5a:	0f 01 ca             	clac
0c5d      c5d:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0c67      c67:	e9 00 00 00 00       	jmp    c6c <.altinstr_replacement+0xc6c>	c68: R_X86_64_PLT32	.text+0x260d33
0c6c      c6c:	e9 00 00 00 00       	jmp    c71 <.altinstr_replacement+0xc71>	c6d: R_X86_64_PLT32	.text+0x260d3b
0c71      c71:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0c7b      c7b:	e8 00 00 00 00       	call   c80 <.altinstr_replacement+0xc80>	c7c: R_X86_64_PLT32	copy_user_generic_string-0x4
0c80      c80:	e8 00 00 00 00       	call   c85 <.altinstr_replacement+0xc85>	c81: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0c85      c85:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0c8f      c8f:	e8 00 00 00 00       	call   c94 <.altinstr_replacement+0xc94>	c90: R_X86_64_PLT32	copy_user_generic_string-0x4
0c94      c94:	e8 00 00 00 00       	call   c99 <.altinstr_replacement+0xc99>	c95: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0c99      c99:	0f 0d 48 f8          	prefetchw -0x8(%rax)
0c9d      c9d:	e8 00 00 00 00       	call   ca2 <.altinstr_replacement+0xca2>	c9e: R_X86_64_PLT32	clear_page_rep-0x4
0ca2      ca2:	e8 00 00 00 00       	call   ca7 <.altinstr_replacement+0xca7>	ca3: R_X86_64_PLT32	clear_page_erms-0x4
0ca7      ca7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0cb1      cb1:	e8 00 00 00 00       	call   cb6 <.altinstr_replacement+0xcb6>	cb2: R_X86_64_PLT32	clear_page_rep-0x4
0cb6      cb6:	e8 00 00 00 00       	call   cbb <.altinstr_replacement+0xcbb>	cb7: R_X86_64_PLT32	clear_page_erms-0x4
0cbb      cbb:	e9 00 00 00 00       	jmp    cc0 <.altinstr_replacement+0xcc0>	cbc: R_X86_64_PLT32	.text+0x27a8d0
0cc0      cc0:	e9 00 00 00 00       	jmp    cc5 <.altinstr_replacement+0xcc5>	cc1: R_X86_64_PLT32	.text+0x27d92c
0cc5      cc5:	e9 00 00 00 00       	jmp    cca <.altinstr_replacement+0xcca>	cc6: R_X86_64_PLT32	.text+0x28b0df
0cca      cca:	e9 00 00 00 00       	jmp    ccf <.altinstr_replacement+0xccf>	ccb: R_X86_64_PLT32	.text+0x28b0e9
0ccf      ccf:	e9 00 00 00 00       	jmp    cd4 <.altinstr_replacement+0xcd4>	cd0: R_X86_64_PLT32	.text+0x28d73e
0cd4      cd4:	e9 00 00 00 00       	jmp    cd9 <.altinstr_replacement+0xcd9>	cd5: R_X86_64_PLT32	.text+0x28d764
0cd9      cd9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0ce3      ce3:	0f 01 cb             	stac
0ce6      ce6:	0f ae e8             	lfence
0ce9      ce9:	0f 01 ca             	clac
0cec      cec:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0cf6      cf6:	0f 01 cb             	stac
0cf9      cf9:	0f ae e8             	lfence
0cfc      cfc:	0f 01 ca             	clac
0cff      cff:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0d09      d09:	e9 00 00 00 00       	jmp    d0e <.altinstr_replacement+0xd0e>	d0a: R_X86_64_PLT32	.text+0x28fb56
0d0e      d0e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0d18      d18:	e9 00 00 00 00       	jmp    d1d <.altinstr_replacement+0xd1d>	d19: R_X86_64_PLT32	.text+0x28fd3f
0d1d      d1d:	e9 00 00 00 00       	jmp    d22 <.altinstr_replacement+0xd22>	d1e: R_X86_64_PLT32	.text+0x28feee
0d22      d22:	e9 00 00 00 00       	jmp    d27 <.altinstr_replacement+0xd27>	d23: R_X86_64_PLT32	.text+0x290081
0d27      d27:	e9 00 00 00 00       	jmp    d2c <.altinstr_replacement+0xd2c>	d28: R_X86_64_PLT32	.text+0x290141
0d2c      d2c:	e9 00 00 00 00       	jmp    d31 <.altinstr_replacement+0xd31>	d2d: R_X86_64_PLT32	.text+0x2903dd
0d31      d31:	e9 00 00 00 00       	jmp    d36 <.altinstr_replacement+0xd36>	d32: R_X86_64_PLT32	.text+0x290744
0d36      d36:	e9 00 00 00 00       	jmp    d3b <.altinstr_replacement+0xd3b>	d37: R_X86_64_PLT32	.text+0x29074e
0d3b      d3b:	e9 00 00 00 00       	jmp    d40 <.altinstr_replacement+0xd40>	d3c: R_X86_64_PLT32	.text+0x29132c
0d40      d40:	e9 00 00 00 00       	jmp    d45 <.altinstr_replacement+0xd45>	d41: R_X86_64_PLT32	.text+0x291743
0d45      d45:	e9 00 00 00 00       	jmp    d4a <.altinstr_replacement+0xd4a>	d46: R_X86_64_PLT32	.text+0x29176a
0d4a      d4a:	e9 00 00 00 00       	jmp    d4f <.altinstr_replacement+0xd4f>	d4b: R_X86_64_PLT32	.text+0x291a21
0d4f      d4f:	e9 00 00 00 00       	jmp    d54 <.altinstr_replacement+0xd54>	d50: R_X86_64_PLT32	.text+0x291a29
0d54      d54:	e9 00 00 00 00       	jmp    d59 <.altinstr_replacement+0xd59>	d55: R_X86_64_PLT32	.text+0x2919a6
0d59      d59:	e9 00 00 00 00       	jmp    d5e <.altinstr_replacement+0xd5e>	d5a: R_X86_64_PLT32	.text+0x29194b
0d5e      d5e:	e9 00 00 00 00       	jmp    d63 <.altinstr_replacement+0xd63>	d5f: R_X86_64_PLT32	.text+0x292016
0d63      d63:	e9 00 00 00 00       	jmp    d68 <.altinstr_replacement+0xd68>	d64: R_X86_64_PLT32	.text+0x292167
0d68      d68:	e9 00 00 00 00       	jmp    d6d <.altinstr_replacement+0xd6d>	d69: R_X86_64_PLT32	.text+0x292191
0d6d      d6d:	e9 00 00 00 00       	jmp    d72 <.altinstr_replacement+0xd72>	d6e: R_X86_64_PLT32	.text+0x29233c
0d72      d72:	e9 00 00 00 00       	jmp    d77 <.altinstr_replacement+0xd77>	d73: R_X86_64_PLT32	.text+0x292b3e
0d77      d77:	e9 00 00 00 00       	jmp    d7c <.altinstr_replacement+0xd7c>	d78: R_X86_64_PLT32	.text+0x292b43
0d7c      d7c:	e9 00 00 00 00       	jmp    d81 <.altinstr_replacement+0xd81>	d7d: R_X86_64_PLT32	.text+0x292c44
0d81      d81:	e9 00 00 00 00       	jmp    d86 <.altinstr_replacement+0xd86>	d82: R_X86_64_PLT32	.text+0x292c6b
0d86      d86:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0d90      d90:	e9 00 00 00 00       	jmp    d95 <.altinstr_replacement+0xd95>	d91: R_X86_64_PLT32	.text+0x29309b
0d95      d95:	e9 00 00 00 00       	jmp    d9a <.altinstr_replacement+0xd9a>	d96: R_X86_64_PLT32	.text+0x293497
0d9a      d9a:	e9 00 00 00 00       	jmp    d9f <.altinstr_replacement+0xd9f>	d9b: R_X86_64_PLT32	.text+0x2935b9
0d9f      d9f:	e9 00 00 00 00       	jmp    da4 <.altinstr_replacement+0xda4>	da0: R_X86_64_PLT32	.text+0x293bba
0da4      da4:	e9 00 00 00 00       	jmp    da9 <.altinstr_replacement+0xda9>	da5: R_X86_64_PLT32	.text+0x293bc4
0da9      da9:	e9 00 00 00 00       	jmp    dae <.altinstr_replacement+0xdae>	daa: R_X86_64_PLT32	.text+0x29412c
0dae      dae:	e9 00 00 00 00       	jmp    db3 <.altinstr_replacement+0xdb3>	daf: R_X86_64_PLT32	.text+0x294370
0db3      db3:	e9 00 00 00 00       	jmp    db8 <.altinstr_replacement+0xdb8>	db4: R_X86_64_PLT32	.text+0x294560
0db8      db8:	e9 00 00 00 00       	jmp    dbd <.altinstr_replacement+0xdbd>	db9: R_X86_64_PLT32	.text+0x294580
0dbd      dbd:	e9 00 00 00 00       	jmp    dc2 <.altinstr_replacement+0xdc2>	dbe: R_X86_64_PLT32	.text+0x2945b0
0dc2      dc2:	e9 00 00 00 00       	jmp    dc7 <.altinstr_replacement+0xdc7>	dc3: R_X86_64_PLT32	.text+0x294b40
0dc7      dc7:	e9 00 00 00 00       	jmp    dcc <.altinstr_replacement+0xdcc>	dc8: R_X86_64_PLT32	.text+0x294b45
0dcc      dcc:	e9 00 00 00 00       	jmp    dd1 <.altinstr_replacement+0xdd1>	dcd: R_X86_64_PLT32	.text+0x29521f
0dd1      dd1:	e9 00 00 00 00       	jmp    dd6 <.altinstr_replacement+0xdd6>	dd2: R_X86_64_PLT32	.text+0x2957f0
0dd6      dd6:	e9 00 00 00 00       	jmp    ddb <.altinstr_replacement+0xddb>	dd7: R_X86_64_PLT32	.text+0x2958cb
0ddb      ddb:	e9 00 00 00 00       	jmp    de0 <.altinstr_replacement+0xde0>	ddc: R_X86_64_PLT32	.text+0x2958e2
0de0      de0:	e9 00 00 00 00       	jmp    de5 <.altinstr_replacement+0xde5>	de1: R_X86_64_PLT32	.text+0x2958e2
0de5      de5:	e9 00 00 00 00       	jmp    dea <.altinstr_replacement+0xdea>	de6: R_X86_64_PLT32	.text+0x2959ac
0dea      dea:	e9 00 00 00 00       	jmp    def <.altinstr_replacement+0xdef>	deb: R_X86_64_PLT32	.text+0x295bc0
0def      def:	e9 00 00 00 00       	jmp    df4 <.altinstr_replacement+0xdf4>	df0: R_X86_64_PLT32	.text+0x295bea
0df4      df4:	e9 00 00 00 00       	jmp    df9 <.altinstr_replacement+0xdf9>	df5: R_X86_64_PLT32	.text+0x295d74
0df9      df9:	e9 00 00 00 00       	jmp    dfe <.altinstr_replacement+0xdfe>	dfa: R_X86_64_PLT32	.text+0x29680d
0dfe      dfe:	e9 00 00 00 00       	jmp    e03 <.altinstr_replacement+0xe03>	dff: R_X86_64_PLT32	.text+0x2977ca
0e03      e03:	e9 00 00 00 00       	jmp    e08 <.altinstr_replacement+0xe08>	e04: R_X86_64_PLT32	.text+0x2977cf
0e08      e08:	e9 00 00 00 00       	jmp    e0d <.altinstr_replacement+0xe0d>	e09: R_X86_64_PLT32	.text+0x2977d4
0e0d      e0d:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0e17      e17:	e9 00 00 00 00       	jmp    e1c <.altinstr_replacement+0xe1c>	e18: R_X86_64_PLT32	.text+0x297f3b
0e1c      e1c:	e9 00 00 00 00       	jmp    e21 <.altinstr_replacement+0xe21>	e1d: R_X86_64_PLT32	.text+0x29854f
0e21      e21:	e9 00 00 00 00       	jmp    e26 <.altinstr_replacement+0xe26>	e22: R_X86_64_PLT32	.text+0x298554
0e26      e26:	e8 00 00 00 00       	call   e2b <.altinstr_replacement+0xe2b>	e27: R_X86_64_PLT32	copy_user_generic_string-0x4
0e2b      e2b:	e8 00 00 00 00       	call   e30 <.altinstr_replacement+0xe30>	e2c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0e30      e30:	e8 00 00 00 00       	call   e35 <.altinstr_replacement+0xe35>	e31: R_X86_64_PLT32	copy_user_generic_string-0x4
0e35      e35:	e8 00 00 00 00       	call   e3a <.altinstr_replacement+0xe3a>	e36: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
0e3a      e3a:	e8 00 00 00 00       	call   e3f <.altinstr_replacement+0xe3f>	e3b: R_X86_64_PLT32	clear_page_rep-0x4
0e3f      e3f:	e8 00 00 00 00       	call   e44 <.altinstr_replacement+0xe44>	e40: R_X86_64_PLT32	clear_page_erms-0x4
0e44      e44:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0e4e      e4e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0e58      e58:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
0e62      e62:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0e6c      e6c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
0e76      e76:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
0e80      e80:	49 bc 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r12
0e8a      e8a:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0e94      e94:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
0e9e      e9e:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0ea8      ea8:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0eb2      eb2:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0ebc      ebc:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0ec6      ec6:	e9 00 00 00 00       	jmp    ecb <.altinstr_replacement+0xecb>	ec7: R_X86_64_PLT32	.text+0x2a28ab
0ecb      ecb:	e9 00 00 00 00       	jmp    ed0 <.altinstr_replacement+0xed0>	ecc: R_X86_64_PLT32	.text+0x2a28d5
0ed0      ed0:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0eda      eda:	e9 00 00 00 00       	jmp    edf <.altinstr_replacement+0xedf>	edb: R_X86_64_PLT32	.text+0x2a2e32
0edf      edf:	e9 00 00 00 00       	jmp    ee4 <.altinstr_replacement+0xee4>	ee0: R_X86_64_PLT32	.text+0x2a2e7b
0ee4      ee4:	e9 00 00 00 00       	jmp    ee9 <.altinstr_replacement+0xee9>	ee5: R_X86_64_PLT32	.text+0x2a3251
0ee9      ee9:	e9 00 00 00 00       	jmp    eee <.altinstr_replacement+0xeee>	eea: R_X86_64_PLT32	.text+0x2a38cb
0eee      eee:	e9 00 00 00 00       	jmp    ef3 <.altinstr_replacement+0xef3>	eef: R_X86_64_PLT32	.text+0x2a38d0
0ef3      ef3:	e9 00 00 00 00       	jmp    ef8 <.altinstr_replacement+0xef8>	ef4: R_X86_64_PLT32	.text+0x2a4052
0ef8      ef8:	e9 00 00 00 00       	jmp    efd <.altinstr_replacement+0xefd>	ef9: R_X86_64_PLT32	.text+0x2a407c
0efd      efd:	e9 00 00 00 00       	jmp    f02 <.altinstr_replacement+0xf02>	efe: R_X86_64_PLT32	.text+0x2a4163
0f02      f02:	e9 00 00 00 00       	jmp    f07 <.altinstr_replacement+0xf07>	f03: R_X86_64_PLT32	.text+0x2a41b3
0f07      f07:	e9 00 00 00 00       	jmp    f0c <.altinstr_replacement+0xf0c>	f08: R_X86_64_PLT32	.text+0x2a4268
0f0c      f0c:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0f16      f16:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
0f20      f20:	e9 00 00 00 00       	jmp    f25 <.altinstr_replacement+0xf25>	f21: R_X86_64_PLT32	.text+0x2a57ca
0f25      f25:	e9 00 00 00 00       	jmp    f2a <.altinstr_replacement+0xf2a>	f26: R_X86_64_PLT32	.text+0x2a578a
0f2a      f2a:	e9 00 00 00 00       	jmp    f2f <.altinstr_replacement+0xf2f>	f2b: R_X86_64_PLT32	.text+0x2a5a99
0f2f      f2f:	e9 00 00 00 00       	jmp    f34 <.altinstr_replacement+0xf34>	f30: R_X86_64_PLT32	.text+0x2a5a9b
0f34      f34:	e9 00 00 00 00       	jmp    f39 <.altinstr_replacement+0xf39>	f35: R_X86_64_PLT32	.text+0x2a5f25
0f39      f39:	e9 00 00 00 00       	jmp    f3e <.altinstr_replacement+0xf3e>	f3a: R_X86_64_PLT32	.text+0x2a5f4c
0f3e      f3e:	e9 00 00 00 00       	jmp    f43 <.altinstr_replacement+0xf43>	f3f: R_X86_64_PLT32	.text+0x2a682a
0f43      f43:	e9 00 00 00 00       	jmp    f48 <.altinstr_replacement+0xf48>	f44: R_X86_64_PLT32	.text+0x2a6878
0f48      f48:	e9 00 00 00 00       	jmp    f4d <.altinstr_replacement+0xf4d>	f49: R_X86_64_PLT32	.text+0x2a68ce
0f4d      f4d:	e9 00 00 00 00       	jmp    f52 <.altinstr_replacement+0xf52>	f4e: R_X86_64_PLT32	.text+0x2a7bce
0f52      f52:	e9 00 00 00 00       	jmp    f57 <.altinstr_replacement+0xf57>	f53: R_X86_64_PLT32	.text+0x2a7c89
0f57      f57:	e9 00 00 00 00       	jmp    f5c <.altinstr_replacement+0xf5c>	f58: R_X86_64_PLT32	.text+0x2aa1bc
0f5c      f5c:	e9 00 00 00 00       	jmp    f61 <.altinstr_replacement+0xf61>	f5d: R_X86_64_PLT32	.text+0x2aa42d
0f61      f61:	e9 00 00 00 00       	jmp    f66 <.altinstr_replacement+0xf66>	f62: R_X86_64_PLT32	.text+0x2aa444
0f66      f66:	e9 00 00 00 00       	jmp    f6b <.altinstr_replacement+0xf6b>	f67: R_X86_64_PLT32	.text+0x2aa46b
0f6b      f6b:	e9 00 00 00 00       	jmp    f70 <.altinstr_replacement+0xf70>	f6c: R_X86_64_PLT32	.text+0x2aa817
0f70      f70:	e9 00 00 00 00       	jmp    f75 <.altinstr_replacement+0xf75>	f71: R_X86_64_PLT32	.text+0x2aaac8
0f75      f75:	e9 00 00 00 00       	jmp    f7a <.altinstr_replacement+0xf7a>	f76: R_X86_64_PLT32	.text+0x2aabd5
0f7a      f7a:	e9 00 00 00 00       	jmp    f7f <.altinstr_replacement+0xf7f>	f7b: R_X86_64_PLT32	.text+0x2aac47
0f7f      f7f:	e9 00 00 00 00       	jmp    f84 <.altinstr_replacement+0xf84>	f80: R_X86_64_PLT32	.text+0x2aac71
0f84      f84:	e9 00 00 00 00       	jmp    f89 <.altinstr_replacement+0xf89>	f85: R_X86_64_PLT32	.text+0x2aae69
0f89      f89:	e9 00 00 00 00       	jmp    f8e <.altinstr_replacement+0xf8e>	f8a: R_X86_64_PLT32	.text+0x2ab28b
0f8e      f8e:	e9 00 00 00 00       	jmp    f93 <.altinstr_replacement+0xf93>	f8f: R_X86_64_PLT32	.text+0x2ab53e
0f93      f93:	e9 00 00 00 00       	jmp    f98 <.altinstr_replacement+0xf98>	f94: R_X86_64_PLT32	.init.text+0x28575
0f98      f98:	e9 00 00 00 00       	jmp    f9d <.altinstr_replacement+0xf9d>	f99: R_X86_64_PLT32	.text+0x2ac02f
0f9d      f9d:	e9 00 00 00 00       	jmp    fa2 <.altinstr_replacement+0xfa2>	f9e: R_X86_64_PLT32	.text+0x2ac080
0fa2      fa2:	e9 00 00 00 00       	jmp    fa7 <.altinstr_replacement+0xfa7>	fa3: R_X86_64_PLT32	.text+0x2acc36
0fa7      fa7:	e9 00 00 00 00       	jmp    fac <.altinstr_replacement+0xfac>	fa8: R_X86_64_PLT32	.text+0x2accdb
0fac      fac:	e9 00 00 00 00       	jmp    fb1 <.altinstr_replacement+0xfb1>	fad: R_X86_64_PLT32	.text+0x2acd5b
0fb1      fb1:	e9 00 00 00 00       	jmp    fb6 <.altinstr_replacement+0xfb6>	fb2: R_X86_64_PLT32	.text+0x2ace1b
0fb6      fb6:	e9 00 00 00 00       	jmp    fbb <.altinstr_replacement+0xfbb>	fb7: R_X86_64_PLT32	.text+0x2ad3c6
0fbb      fbb:	e9 00 00 00 00       	jmp    fc0 <.altinstr_replacement+0xfc0>	fbc: R_X86_64_PLT32	.text+0x2ad777
0fc0      fc0:	e9 00 00 00 00       	jmp    fc5 <.altinstr_replacement+0xfc5>	fc1: R_X86_64_PLT32	.text+0x2ada48
0fc5      fc5:	e9 00 00 00 00       	jmp    fca <.altinstr_replacement+0xfca>	fc6: R_X86_64_PLT32	.text+0x2adca6
0fca      fca:	e9 00 00 00 00       	jmp    fcf <.altinstr_replacement+0xfcf>	fcb: R_X86_64_PLT32	.text+0x2adee7
0fcf      fcf:	e9 00 00 00 00       	jmp    fd4 <.altinstr_replacement+0xfd4>	fd0: R_X86_64_PLT32	.text+0x2adef1
0fd4      fd4:	e9 00 00 00 00       	jmp    fd9 <.altinstr_replacement+0xfd9>	fd5: R_X86_64_PLT32	.text+0x2af36d
0fd9      fd9:	e9 00 00 00 00       	jmp    fde <.altinstr_replacement+0xfde>	fda: R_X86_64_PLT32	.text+0x2af7ca
0fde      fde:	e9 00 00 00 00       	jmp    fe3 <.altinstr_replacement+0xfe3>	fdf: R_X86_64_PLT32	.text+0x2af892
0fe3      fe3:	e9 00 00 00 00       	jmp    fe8 <.altinstr_replacement+0xfe8>	fe4: R_X86_64_PLT32	.text+0x2af96c
0fe8      fe8:	e9 00 00 00 00       	jmp    fed <.altinstr_replacement+0xfed>	fe9: R_X86_64_PLT32	.text+0x2afdc2
0fed      fed:	e9 00 00 00 00       	jmp    ff2 <.altinstr_replacement+0xff2>	fee: R_X86_64_PLT32	.meminit.text+0x2154
0ff2      ff2:	e9 00 00 00 00       	jmp    ff7 <.altinstr_replacement+0xff7>	ff3: R_X86_64_PLT32	.meminit.text+0x215e
0ff7      ff7:	0f 0d 0b             	prefetchw (%rbx)
0ffa      ffa:	0f 0d 48 38          	prefetchw 0x38(%rax)
0ffe      ffe:	e9 00 00 00 00       	jmp    1003 <.altinstr_replacement+0x1003>	fff: R_X86_64_PLT32	.text+0x2b0a42
1003     1003:	e9 00 00 00 00       	jmp    1008 <.altinstr_replacement+0x1008>	1004: R_X86_64_PLT32	.text+0x2b0a5e
1008     1008:	e9 00 00 00 00       	jmp    100d <.altinstr_replacement+0x100d>	1009: R_X86_64_PLT32	.text+0x2b0bec
100d     100d:	e9 00 00 00 00       	jmp    1012 <.altinstr_replacement+0x1012>	100e: R_X86_64_PLT32	.text+0x2b0bf6
1012     1012:	e9 00 00 00 00       	jmp    1017 <.altinstr_replacement+0x1017>	1013: R_X86_64_PLT32	.text+0x2b0c00
1017     1017:	e9 00 00 00 00       	jmp    101c <.altinstr_replacement+0x101c>	1018: R_X86_64_PLT32	.text+0x2b0c0a
101c     101c:	e8 00 00 00 00       	call   1021 <.altinstr_replacement+0x1021>	101d: R_X86_64_PLT32	clear_page_rep-0x4
1021     1021:	e8 00 00 00 00       	call   1026 <.altinstr_replacement+0x1026>	1022: R_X86_64_PLT32	clear_page_erms-0x4
1026     1026:	e9 00 00 00 00       	jmp    102b <.altinstr_replacement+0x102b>	1027: R_X86_64_PLT32	.text+0x2b16ed
102b     102b:	e9 00 00 00 00       	jmp    1030 <.altinstr_replacement+0x1030>	102c: R_X86_64_PLT32	.text+0x2b17d8
1030     1030:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1035     1035:	f3 48 0f b8 c7       	popcnt %rdi,%rax
103a     103a:	e9 00 00 00 00       	jmp    103f <.altinstr_replacement+0x103f>	103b: R_X86_64_PLT32	.init.text+0x2a340
103f     103f:	e9 00 00 00 00       	jmp    1044 <.altinstr_replacement+0x1044>	1040: R_X86_64_PLT32	.init.text+0x2a34a
1044     1044:	e9 00 00 00 00       	jmp    1049 <.altinstr_replacement+0x1049>	1045: R_X86_64_PLT32	.text+0x2b870d
1049     1049:	e9 00 00 00 00       	jmp    104e <.altinstr_replacement+0x104e>	104a: R_X86_64_PLT32	.text+0x2b8717
104e     104e:	e9 00 00 00 00       	jmp    1053 <.altinstr_replacement+0x1053>	104f: R_X86_64_PLT32	.text+0x2b88aa
1053     1053:	e9 00 00 00 00       	jmp    1058 <.altinstr_replacement+0x1058>	1054: R_X86_64_PLT32	.text+0x2b8a32
1058     1058:	e9 00 00 00 00       	jmp    105d <.altinstr_replacement+0x105d>	1059: R_X86_64_PLT32	.text+0x2b8e02
105d     105d:	e9 00 00 00 00       	jmp    1062 <.altinstr_replacement+0x1062>	105e: R_X86_64_PLT32	.text+0x2b92a8
1062     1062:	e9 00 00 00 00       	jmp    1067 <.altinstr_replacement+0x1067>	1063: R_X86_64_PLT32	.text+0x2b9415
1067     1067:	e9 00 00 00 00       	jmp    106c <.altinstr_replacement+0x106c>	1068: R_X86_64_PLT32	.text+0x2b9420
106c     106c:	e9 00 00 00 00       	jmp    1071 <.altinstr_replacement+0x1071>	106d: R_X86_64_PLT32	.text+0x2b96d9
1071     1071:	e9 00 00 00 00       	jmp    1076 <.altinstr_replacement+0x1076>	1072: R_X86_64_PLT32	.text+0x2b96e3
1076     1076:	e9 00 00 00 00       	jmp    107b <.altinstr_replacement+0x107b>	1077: R_X86_64_PLT32	.init.text+0x2b07c
107b     107b:	e9 00 00 00 00       	jmp    1080 <.altinstr_replacement+0x1080>	107c: R_X86_64_PLT32	.text+0x2ba585
1080     1080:	e9 00 00 00 00       	jmp    1085 <.altinstr_replacement+0x1085>	1081: R_X86_64_PLT32	.init.text+0x2b129
1085     1085:	e9 00 00 00 00       	jmp    108a <.altinstr_replacement+0x108a>	1086: R_X86_64_PLT32	.init.text+0x2b31d
108a     108a:	e9 00 00 00 00       	jmp    108f <.altinstr_replacement+0x108f>	108b: R_X86_64_PLT32	.init.text+0x2b1e6
108f     108f:	e9 00 00 00 00       	jmp    1094 <.altinstr_replacement+0x1094>	1090: R_X86_64_PLT32	.init.text+0x2b2ec
1094     1094:	e9 00 00 00 00       	jmp    1099 <.altinstr_replacement+0x1099>	1095: R_X86_64_PLT32	.init.text+0x2b2af
1099     1099:	e9 00 00 00 00       	jmp    109e <.altinstr_replacement+0x109e>	109a: R_X86_64_PLT32	.init.text+0x2b45a
109e     109e:	e9 00 00 00 00       	jmp    10a3 <.altinstr_replacement+0x10a3>	109f: R_X86_64_PLT32	.init.text+0x2b4cc
10a3     10a3:	e9 00 00 00 00       	jmp    10a8 <.altinstr_replacement+0x10a8>	10a4: R_X86_64_PLT32	.init.text+0x2b586
10a8     10a8:	e9 00 00 00 00       	jmp    10ad <.altinstr_replacement+0x10ad>	10a9: R_X86_64_PLT32	.init.text+0x2b57f
10ad     10ad:	e9 00 00 00 00       	jmp    10b2 <.altinstr_replacement+0x10b2>	10ae: R_X86_64_PLT32	.init.text+0x2b69d
10b2     10b2:	e9 00 00 00 00       	jmp    10b7 <.altinstr_replacement+0x10b7>	10b3: R_X86_64_PLT32	.init.text+0x2b696
10b7     10b7:	e9 00 00 00 00       	jmp    10bc <.altinstr_replacement+0x10bc>	10b8: R_X86_64_PLT32	.text+0x2ba64f
10bc     10bc:	e9 00 00 00 00       	jmp    10c1 <.altinstr_replacement+0x10c1>	10bd: R_X86_64_PLT32	.text+0x2ba656
10c1     10c1:	e9 00 00 00 00       	jmp    10c6 <.altinstr_replacement+0x10c6>	10c2: R_X86_64_PLT32	.text+0x2ba6ff
10c6     10c6:	e9 00 00 00 00       	jmp    10cb <.altinstr_replacement+0x10cb>	10c7: R_X86_64_PLT32	.text+0x2ba706
10cb     10cb:	e9 00 00 00 00       	jmp    10d0 <.altinstr_replacement+0x10d0>	10cc: R_X86_64_PLT32	.meminit.text+0x3eff
10d0     10d0:	e9 00 00 00 00       	jmp    10d5 <.altinstr_replacement+0x10d5>	10d1: R_X86_64_PLT32	.text+0x2ba878
10d5     10d5:	e9 00 00 00 00       	jmp    10da <.altinstr_replacement+0x10da>	10d6: R_X86_64_PLT32	.init.text+0x2b7ee
10da     10da:	e9 00 00 00 00       	jmp    10df <.altinstr_replacement+0x10df>	10db: R_X86_64_PLT32	.init.text+0x2b84f
10df     10df:	e9 00 00 00 00       	jmp    10e4 <.altinstr_replacement+0x10e4>	10e0: R_X86_64_PLT32	.meminit.text+0x3f66
10e4     10e4:	e9 00 00 00 00       	jmp    10e9 <.altinstr_replacement+0x10e9>	10e5: R_X86_64_PLT32	.init.text+0x2ba48
10e9     10e9:	e9 00 00 00 00       	jmp    10ee <.altinstr_replacement+0x10ee>	10ea: R_X86_64_PLT32	.init.text+0x2ba52
10ee     10ee:	e9 00 00 00 00       	jmp    10f3 <.altinstr_replacement+0x10f3>	10ef: R_X86_64_PLT32	.init.text+0x2ba5c
10f3     10f3:	e9 00 00 00 00       	jmp    10f8 <.altinstr_replacement+0x10f8>	10f4: R_X86_64_PLT32	.text+0x2ba940
10f8     10f8:	e9 00 00 00 00       	jmp    10fd <.altinstr_replacement+0x10fd>	10f9: R_X86_64_PLT32	.text+0x2baa12
10fd     10fd:	e9 00 00 00 00       	jmp    1102 <.altinstr_replacement+0x1102>	10fe: R_X86_64_PLT32	.meminit.text+0x4568
1102     1102:	e9 00 00 00 00       	jmp    1107 <.altinstr_replacement+0x1107>	1103: R_X86_64_PLT32	.text+0x2baa92
1107     1107:	e9 00 00 00 00       	jmp    110c <.altinstr_replacement+0x110c>	1108: R_X86_64_PLT32	.meminit.text+0x45ae
110c     110c:	e9 00 00 00 00       	jmp    1111 <.altinstr_replacement+0x1111>	110d: R_X86_64_PLT32	.meminit.text+0x45ae
1111     1111:	e9 00 00 00 00       	jmp    1116 <.altinstr_replacement+0x1116>	1112: R_X86_64_PLT32	.text+0x2bfecb
1116     1116:	e9 00 00 00 00       	jmp    111b <.altinstr_replacement+0x111b>	1117: R_X86_64_PLT32	.text+0x2c0317
111b     111b:	e9 00 00 00 00       	jmp    1120 <.altinstr_replacement+0x1120>	111c: R_X86_64_PLT32	.init.text+0x2c091
1120     1120:	e9 00 00 00 00       	jmp    1125 <.altinstr_replacement+0x1125>	1121: R_X86_64_PLT32	.init.text+0x2c4ba
1125     1125:	e9 00 00 00 00       	jmp    112a <.altinstr_replacement+0x112a>	1126: R_X86_64_PLT32	.init.text+0x2c4bf
112a     112a:	e9 00 00 00 00       	jmp    112f <.altinstr_replacement+0x112f>	112b: R_X86_64_PLT32	.init.text+0x2c4c4
112f     112f:	e9 00 00 00 00       	jmp    1134 <.altinstr_replacement+0x1134>	1130: R_X86_64_PLT32	.init.text+0x2c4ce
1134     1134:	e9 00 00 00 00       	jmp    1139 <.altinstr_replacement+0x1139>	1135: R_X86_64_PLT32	.init.text+0x2d3d4
1139     1139:	e9 00 00 00 00       	jmp    113e <.altinstr_replacement+0x113e>	113a: R_X86_64_PLT32	.init.text+0x2d443
113e     113e:	e9 00 00 00 00       	jmp    1143 <.altinstr_replacement+0x1143>	113f: R_X86_64_PLT32	.init.text+0x2d42e
1143     1143:	e9 00 00 00 00       	jmp    1148 <.altinstr_replacement+0x1148>	1144: R_X86_64_PLT32	.init.text+0x2d449
1148     1148:	e9 00 00 00 00       	jmp    114d <.altinstr_replacement+0x114d>	1149: R_X86_64_PLT32	.init.text+0x2d527
114d     114d:	e9 00 00 00 00       	jmp    1152 <.altinstr_replacement+0x1152>	114e: R_X86_64_PLT32	.init.text+0x2d52c
1152     1152:	e9 00 00 00 00       	jmp    1157 <.altinstr_replacement+0x1157>	1153: R_X86_64_PLT32	.init.text+0x2d5de
1157     1157:	e9 00 00 00 00       	jmp    115c <.altinstr_replacement+0x115c>	1158: R_X86_64_PLT32	.init.text+0x2d60d
115c     115c:	e9 00 00 00 00       	jmp    1161 <.altinstr_replacement+0x1161>	115d: R_X86_64_PLT32	.init.text+0x2d584
1161     1161:	e9 00 00 00 00       	jmp    1166 <.altinstr_replacement+0x1166>	1162: R_X86_64_PLT32	.init.text+0x2d5b0
1166     1166:	e9 00 00 00 00       	jmp    116b <.altinstr_replacement+0x116b>	1167: R_X86_64_PLT32	.init.text+0x2d5de
116b     116b:	e9 00 00 00 00       	jmp    1170 <.altinstr_replacement+0x1170>	116c: R_X86_64_PLT32	.init.text+0x2d785
1170     1170:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
117a     117a:	e9 00 00 00 00       	jmp    117f <.altinstr_replacement+0x117f>	117b: R_X86_64_PLT32	.text+0x2c0efb
117f     117f:	e9 00 00 00 00       	jmp    1184 <.altinstr_replacement+0x1184>	1180: R_X86_64_PLT32	.text+0x2c0f05
1184     1184:	e9 00 00 00 00       	jmp    1189 <.altinstr_replacement+0x1189>	1185: R_X86_64_PLT32	.text+0x2c10b5
1189     1189:	e9 00 00 00 00       	jmp    118e <.altinstr_replacement+0x118e>	118a: R_X86_64_PLT32	.text+0x2c10bf
118e     118e:	e9 00 00 00 00       	jmp    1193 <.altinstr_replacement+0x1193>	118f: R_X86_64_PLT32	.text+0x2c1257
1193     1193:	e9 00 00 00 00       	jmp    1198 <.altinstr_replacement+0x1198>	1194: R_X86_64_PLT32	.text+0x2c1261
1198     1198:	e9 00 00 00 00       	jmp    119d <.altinstr_replacement+0x119d>	1199: R_X86_64_PLT32	.text+0x2c563f
119d     119d:	e9 00 00 00 00       	jmp    11a2 <.altinstr_replacement+0x11a2>	119e: R_X86_64_PLT32	.init.text+0x2df4f
11a2     11a2:	e9 00 00 00 00       	jmp    11a7 <.altinstr_replacement+0x11a7>	11a3: R_X86_64_PLT32	.init.text+0x2df59
11a7     11a7:	e9 00 00 00 00       	jmp    11ac <.altinstr_replacement+0x11ac>	11a8: R_X86_64_PLT32	.meminit.text+0x4996
11ac     11ac:	e9 00 00 00 00       	jmp    11b1 <.altinstr_replacement+0x11b1>	11ad: R_X86_64_PLT32	.text+0x2c57a0
11b1     11b1:	e9 00 00 00 00       	jmp    11b6 <.altinstr_replacement+0x11b6>	11b2: R_X86_64_PLT32	.text+0x2c5817
11b6     11b6:	e9 00 00 00 00       	jmp    11bb <.altinstr_replacement+0x11bb>	11b7: R_X86_64_PLT32	.text+0x2c5a14
11bb     11bb:	e9 00 00 00 00       	jmp    11c0 <.altinstr_replacement+0x11c0>	11bc: R_X86_64_PLT32	.text+0x2c5a21
11c0     11c0:	e9 00 00 00 00       	jmp    11c5 <.altinstr_replacement+0x11c5>	11c1: R_X86_64_PLT32	.text+0x2c5c71
11c5     11c5:	e9 00 00 00 00       	jmp    11ca <.altinstr_replacement+0x11ca>	11c6: R_X86_64_PLT32	.text+0x2c5c7e
11ca     11ca:	e9 00 00 00 00       	jmp    11cf <.altinstr_replacement+0x11cf>	11cb: R_X86_64_PLT32	.text+0x2c7747
11cf     11cf:	e9 00 00 00 00       	jmp    11d4 <.altinstr_replacement+0x11d4>	11d0: R_X86_64_PLT32	.text+0x2c7872
11d4     11d4:	e9 00 00 00 00       	jmp    11d9 <.altinstr_replacement+0x11d9>	11d5: R_X86_64_PLT32	.init.text+0x2e2a8
11d9     11d9:	e9 00 00 00 00       	jmp    11de <.altinstr_replacement+0x11de>	11da: R_X86_64_PLT32	.init.text+0x2e2b2
11de     11de:	e9 00 00 00 00       	jmp    11e3 <.altinstr_replacement+0x11e3>	11df: R_X86_64_PLT32	.init.text+0x2e38e
11e3     11e3:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
11ed     11ed:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
11f7     11f7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1201     1201:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
120b     120b:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
1215     1215:	0f 01 cb             	stac
1218     1218:	0f ae e8             	lfence
121b     121b:	0f 01 ca             	clac
121e     121e:	0f 01 ca             	clac
1221     1221:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
122b     122b:	0f 01 cb             	stac
122e     122e:	0f ae e8             	lfence
1231     1231:	0f 01 ca             	clac
1234     1234:	0f 01 ca             	clac
1237     1237:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
1241     1241:	0f 01 cb             	stac
1244     1244:	0f ae e8             	lfence
1247     1247:	0f 01 ca             	clac
124a     124a:	0f 01 ca             	clac
124d     124d:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
1257     1257:	0f 01 cb             	stac
125a     125a:	0f ae e8             	lfence
125d     125d:	0f 01 ca             	clac
1260     1260:	0f 01 ca             	clac
1263     1263:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
126d     126d:	0f 01 cb             	stac
1270     1270:	0f ae e8             	lfence
1273     1273:	0f 01 ca             	clac
1276     1276:	0f 01 ca             	clac
1279     1279:	e8 00 00 00 00       	call   127e <.altinstr_replacement+0x127e>	127a: R_X86_64_PLT32	copy_user_generic_string-0x4
127e     127e:	e8 00 00 00 00       	call   1283 <.altinstr_replacement+0x1283>	127f: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1283     1283:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
128d     128d:	0f 01 cb             	stac
1290     1290:	0f ae e8             	lfence
1293     1293:	0f 01 ca             	clac
1296     1296:	0f 01 ca             	clac
1299     1299:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
12a3     12a3:	0f 01 cb             	stac
12a6     12a6:	0f ae e8             	lfence
12a9     12a9:	0f 01 ca             	clac
12ac     12ac:	0f 01 ca             	clac
12af     12af:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
12b9     12b9:	0f 01 cb             	stac
12bc     12bc:	0f ae e8             	lfence
12bf     12bf:	0f 01 ca             	clac
12c2     12c2:	0f 01 ca             	clac
12c5     12c5:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
12cf     12cf:	0f 01 cb             	stac
12d2     12d2:	0f ae e8             	lfence
12d5     12d5:	0f 01 ca             	clac
12d8     12d8:	0f 01 ca             	clac
12db     12db:	0f 0d 8f 68 09 00 00 	prefetchw 0x968(%rdi)
12e2     12e2:	f3 0f b8 c7          	popcnt %edi,%eax
12e6     12e6:	0f 0d 0b             	prefetchw (%rbx)
12e9     12e9:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
12f3     12f3:	0f 01 cb             	stac
12f6     12f6:	e8 00 00 00 00       	call   12fb <.altinstr_replacement+0x12fb>	12f7: R_X86_64_PLT32	clear_user_erms-0x4
12fb     12fb:	e8 00 00 00 00       	call   1300 <.altinstr_replacement+0x1300>	12fc: R_X86_64_PLT32	clear_user_rep_good-0x4
1300     1300:	e8 00 00 00 00       	call   1305 <.altinstr_replacement+0x1305>	1301: R_X86_64_PLT32	clear_user_original-0x4
1305     1305:	0f 01 ca             	clac
1308     1308:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1312     1312:	e9 00 00 00 00       	jmp    1317 <.altinstr_replacement+0x1317>	1313: R_X86_64_PLT32	.text+0x32062c
1317     1317:	e9 00 00 00 00       	jmp    131c <.altinstr_replacement+0x131c>	1318: R_X86_64_PLT32	.text+0x320786
131c     131c:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1326     1326:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1330     1330:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
133a     133a:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1344     1344:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
134e     134e:	0f 01 cb             	stac
1351     1351:	e8 00 00 00 00       	call   1356 <.altinstr_replacement+0x1356>	1352: R_X86_64_PLT32	clear_user_erms-0x4
1356     1356:	e8 00 00 00 00       	call   135b <.altinstr_replacement+0x135b>	1357: R_X86_64_PLT32	clear_user_rep_good-0x4
135b     135b:	e8 00 00 00 00       	call   1360 <.altinstr_replacement+0x1360>	135c: R_X86_64_PLT32	clear_user_original-0x4
1360     1360:	0f 01 ca             	clac
1363     1363:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
136d     136d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1377     1377:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1381     1381:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
138b     138b:	0f 01 cb             	stac
138e     138e:	e8 00 00 00 00       	call   1393 <.altinstr_replacement+0x1393>	138f: R_X86_64_PLT32	clear_user_erms-0x4
1393     1393:	e8 00 00 00 00       	call   1398 <.altinstr_replacement+0x1398>	1394: R_X86_64_PLT32	clear_user_rep_good-0x4
1398     1398:	e8 00 00 00 00       	call   139d <.altinstr_replacement+0x139d>	1399: R_X86_64_PLT32	clear_user_original-0x4
139d     139d:	0f 01 ca             	clac
13a0     13a0:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
13aa     13aa:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
13b4     13b4:	48 bd 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbp
13be     13be:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
13c8     13c8:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
13d2     13d2:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
13dc     13dc:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
13e6     13e6:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
13f0     13f0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
13fa     13fa:	0f 01 cb             	stac
13fd     13fd:	e8 00 00 00 00       	call   1402 <.altinstr_replacement+0x1402>	13fe: R_X86_64_PLT32	clear_user_erms-0x4
1402     1402:	e8 00 00 00 00       	call   1407 <.altinstr_replacement+0x1407>	1403: R_X86_64_PLT32	clear_user_rep_good-0x4
1407     1407:	e8 00 00 00 00       	call   140c <.altinstr_replacement+0x140c>	1408: R_X86_64_PLT32	clear_user_original-0x4
140c     140c:	0f 01 ca             	clac
140f     140f:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1419     1419:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1423     1423:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
142d     142d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1437     1437:	0f 01 cb             	stac
143a     143a:	e8 00 00 00 00       	call   143f <.altinstr_replacement+0x143f>	143b: R_X86_64_PLT32	clear_user_erms-0x4
143f     143f:	e8 00 00 00 00       	call   1444 <.altinstr_replacement+0x1444>	1440: R_X86_64_PLT32	clear_user_rep_good-0x4
1444     1444:	e8 00 00 00 00       	call   1449 <.altinstr_replacement+0x1449>	1445: R_X86_64_PLT32	clear_user_original-0x4
1449     1449:	0f 01 ca             	clac
144c     144c:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1456     1456:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1460     1460:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
146a     146a:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1474     1474:	e9 00 00 00 00       	jmp    1479 <.altinstr_replacement+0x1479>	1475: R_X86_64_PLT32	.text+0x34dd66
1479     1479:	e9 00 00 00 00       	jmp    147e <.altinstr_replacement+0x147e>	147a: R_X86_64_PLT32	.text+0x34dd9e
147e     147e:	e9 00 00 00 00       	jmp    1483 <.altinstr_replacement+0x1483>	147f: R_X86_64_PLT32	.text+0x34dda3
1483     1483:	e9 00 00 00 00       	jmp    1488 <.altinstr_replacement+0x1488>	1484: R_X86_64_PLT32	.text+0x34e8a6
1488     1488:	e9 00 00 00 00       	jmp    148d <.altinstr_replacement+0x148d>	1489: R_X86_64_PLT32	.text+0x34e8ca
148d     148d:	e9 00 00 00 00       	jmp    1492 <.altinstr_replacement+0x1492>	148e: R_X86_64_PLT32	.text+0x34e8cf
1492     1492:	e9 00 00 00 00       	jmp    1497 <.altinstr_replacement+0x1497>	1493: R_X86_64_PLT32	.text+0x34e8a1
1497     1497:	e9 00 00 00 00       	jmp    149c <.altinstr_replacement+0x149c>	1498: R_X86_64_PLT32	.text+0x34e8ab
149c     149c:	e9 00 00 00 00       	jmp    14a1 <.altinstr_replacement+0x14a1>	149d: R_X86_64_PLT32	.text+0x34e8b0
14a1     14a1:	e9 00 00 00 00       	jmp    14a6 <.altinstr_replacement+0x14a6>	14a2: R_X86_64_PLT32	.text+0x358dcc
14a6     14a6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
14ab     14ab:	41 0f 0d 0c 24       	prefetchw (%r12)
14b0     14b0:	f3 0f b8 c7          	popcnt %edi,%eax
14b4     14b4:	e8 00 00 00 00       	call   14b9 <.altinstr_replacement+0x14b9>	14b5: R_X86_64_PLT32	clear_page_rep-0x4
14b9     14b9:	e8 00 00 00 00       	call   14be <.altinstr_replacement+0x14be>	14ba: R_X86_64_PLT32	clear_page_erms-0x4
14be     14be:	e8 00 00 00 00       	call   14c3 <.altinstr_replacement+0x14c3>	14bf: R_X86_64_PLT32	clear_page_rep-0x4
14c3     14c3:	e8 00 00 00 00       	call   14c8 <.altinstr_replacement+0x14c8>	14c4: R_X86_64_PLT32	clear_page_erms-0x4
14c8     14c8:	e8 00 00 00 00       	call   14cd <.altinstr_replacement+0x14cd>	14c9: R_X86_64_PLT32	clear_page_rep-0x4
14cd     14cd:	e8 00 00 00 00       	call   14d2 <.altinstr_replacement+0x14d2>	14ce: R_X86_64_PLT32	clear_page_erms-0x4
14d2     14d2:	e8 00 00 00 00       	call   14d7 <.altinstr_replacement+0x14d7>	14d3: R_X86_64_PLT32	clear_page_rep-0x4
14d7     14d7:	e8 00 00 00 00       	call   14dc <.altinstr_replacement+0x14dc>	14d8: R_X86_64_PLT32	clear_page_erms-0x4
14dc     14dc:	e8 00 00 00 00       	call   14e1 <.altinstr_replacement+0x14e1>	14dd: R_X86_64_PLT32	clear_page_rep-0x4
14e1     14e1:	e8 00 00 00 00       	call   14e6 <.altinstr_replacement+0x14e6>	14e2: R_X86_64_PLT32	clear_page_erms-0x4
14e6     14e6:	e8 00 00 00 00       	call   14eb <.altinstr_replacement+0x14eb>	14e7: R_X86_64_PLT32	clear_page_rep-0x4
14eb     14eb:	e8 00 00 00 00       	call   14f0 <.altinstr_replacement+0x14f0>	14ec: R_X86_64_PLT32	clear_page_erms-0x4
14f0     14f0:	e8 00 00 00 00       	call   14f5 <.altinstr_replacement+0x14f5>	14f1: R_X86_64_PLT32	clear_page_rep-0x4
14f5     14f5:	e8 00 00 00 00       	call   14fa <.altinstr_replacement+0x14fa>	14f6: R_X86_64_PLT32	clear_page_erms-0x4
14fa     14fa:	e8 00 00 00 00       	call   14ff <.altinstr_replacement+0x14ff>	14fb: R_X86_64_PLT32	clear_page_rep-0x4
14ff     14ff:	e8 00 00 00 00       	call   1504 <.altinstr_replacement+0x1504>	1500: R_X86_64_PLT32	clear_page_erms-0x4
1504     1504:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
150e     150e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1518     1518:	0f 01 cb             	stac
151b     151b:	e8 00 00 00 00       	call   1520 <.altinstr_replacement+0x1520>	151c: R_X86_64_PLT32	clear_user_erms-0x4
1520     1520:	e8 00 00 00 00       	call   1525 <.altinstr_replacement+0x1525>	1521: R_X86_64_PLT32	clear_user_rep_good-0x4
1525     1525:	e8 00 00 00 00       	call   152a <.altinstr_replacement+0x152a>	1526: R_X86_64_PLT32	clear_user_original-0x4
152a     152a:	0f 01 ca             	clac
152d     152d:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1537     1537:	0f 01 cb             	stac
153a     153a:	e8 00 00 00 00       	call   153f <.altinstr_replacement+0x153f>	153b: R_X86_64_PLT32	clear_user_erms-0x4
153f     153f:	e8 00 00 00 00       	call   1544 <.altinstr_replacement+0x1544>	1540: R_X86_64_PLT32	clear_user_rep_good-0x4
1544     1544:	e8 00 00 00 00       	call   1549 <.altinstr_replacement+0x1549>	1545: R_X86_64_PLT32	clear_user_original-0x4
1549     1549:	0f 01 ca             	clac
154c     154c:	f3 0f b8 c7          	popcnt %edi,%eax
1550     1550:	f3 0f b8 c7          	popcnt %edi,%eax
1554     1554:	f3 0f b8 c7          	popcnt %edi,%eax
1558     1558:	f3 0f b8 c7          	popcnt %edi,%eax
155c     155c:	f3 0f b8 c7          	popcnt %edi,%eax
1560     1560:	f3 0f b8 c7          	popcnt %edi,%eax
1564     1564:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
156e     156e:	f3 0f b8 c7          	popcnt %edi,%eax
1572     1572:	f3 0f b8 c7          	popcnt %edi,%eax
1576     1576:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1580     1580:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
158a     158a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
158f     158f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1594     1594:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1599     1599:	f3 48 0f b8 c7       	popcnt %rdi,%rax
159e     159e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15a8     15a8:	e8 00 00 00 00       	call   15ad <.altinstr_replacement+0x15ad>	15a9: R_X86_64_PLT32	copy_user_generic_string-0x4
15ad     15ad:	e8 00 00 00 00       	call   15b2 <.altinstr_replacement+0x15b2>	15ae: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
15b2     15b2:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
15bc     15bc:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15c6     15c6:	e8 00 00 00 00       	call   15cb <.altinstr_replacement+0x15cb>	15c7: R_X86_64_PLT32	copy_user_generic_string-0x4
15cb     15cb:	e8 00 00 00 00       	call   15d0 <.altinstr_replacement+0x15d0>	15cc: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
15d0     15d0:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15da     15da:	0f 01 cb             	stac
15dd     15dd:	e8 00 00 00 00       	call   15e2 <.altinstr_replacement+0x15e2>	15de: R_X86_64_PLT32	clear_user_erms-0x4
15e2     15e2:	e8 00 00 00 00       	call   15e7 <.altinstr_replacement+0x15e7>	15e3: R_X86_64_PLT32	clear_user_rep_good-0x4
15e7     15e7:	e8 00 00 00 00       	call   15ec <.altinstr_replacement+0x15ec>	15e8: R_X86_64_PLT32	clear_user_original-0x4
15ec     15ec:	0f 01 ca             	clac
15ef     15ef:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
15f9     15f9:	0f 01 cb             	stac
15fc     15fc:	e8 00 00 00 00       	call   1601 <.altinstr_replacement+0x1601>	15fd: R_X86_64_PLT32	clear_user_erms-0x4
1601     1601:	e8 00 00 00 00       	call   1606 <.altinstr_replacement+0x1606>	1602: R_X86_64_PLT32	clear_user_rep_good-0x4
1606     1606:	e8 00 00 00 00       	call   160b <.altinstr_replacement+0x160b>	1607: R_X86_64_PLT32	clear_user_original-0x4
160b     160b:	0f 01 ca             	clac
160e     160e:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1618     1618:	0f 01 cb             	stac
161b     161b:	0f ae e8             	lfence
161e     161e:	0f 01 ca             	clac
1621     1621:	48 bf 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdi
162b     162b:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1635     1635:	f3 48 0f b8 c7       	popcnt %rdi,%rax
163a     163a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
163f     163f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1644     1644:	f3 0f b8 c7          	popcnt %edi,%eax
1648     1648:	f3 0f b8 c7          	popcnt %edi,%eax
164c     164c:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1656     1656:	e8 00 00 00 00       	call   165b <.altinstr_replacement+0x165b>	1657: R_X86_64_PLT32	copy_user_generic_string-0x4
165b     165b:	e8 00 00 00 00       	call   1660 <.altinstr_replacement+0x1660>	165c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1660     1660:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
166a     166a:	e8 00 00 00 00       	call   166f <.altinstr_replacement+0x166f>	166b: R_X86_64_PLT32	copy_user_generic_string-0x4
166f     166f:	e8 00 00 00 00       	call   1674 <.altinstr_replacement+0x1674>	1670: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1674     1674:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
167e     167e:	0f 01 cb             	stac
1681     1681:	0f ae e8             	lfence
1684     1684:	0f 01 ca             	clac
1687     1687:	0f 01 ca             	clac
168a     168a:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1694     1694:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
169e     169e:	0f 01 cb             	stac
16a1     16a1:	0f ae e8             	lfence
16a4     16a4:	0f 01 ca             	clac
16a7     16a7:	49 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r9
16b1     16b1:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
16bb     16bb:	0f 01 cb             	stac
16be     16be:	0f ae e8             	lfence
16c1     16c1:	0f 01 ca             	clac
16c4     16c4:	9c                   	pushf
16c5     16c5:	8f 44 24 08          	pop    0x8(%rsp)
16c9     16c9:	0f 01 ca             	clac
16cc     16cc:	ff 34 24             	push   (%rsp)
16cf     16cf:	9d                   	popf
16d0     16d0:	9c                   	pushf
16d1     16d1:	8f 44 24 10          	pop    0x10(%rsp)
16d5     16d5:	0f 01 ca             	clac
16d8     16d8:	ff 74 24 08          	push   0x8(%rsp)
16dc     16dc:	9d                   	popf
16dd     16dd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
16e2     16e2:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
16ec     16ec:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
16f6     16f6:	e9 00 00 00 00       	jmp    16fb <.altinstr_replacement+0x16fb>	16f7: R_X86_64_PLT32	.cpuidle.text+0x51a
16fb     16fb:	e9 00 00 00 00       	jmp    1700 <.altinstr_replacement+0x1700>	16fc: R_X86_64_PLT32	.cpuidle.text+0x4b4
1700     1700:	e9 00 00 00 00       	jmp    1705 <.altinstr_replacement+0x1705>	1701: R_X86_64_PLT32	.cpuidle.text+0x5ed
1705     1705:	e9 00 00 00 00       	jmp    170a <.altinstr_replacement+0x170a>	1706: R_X86_64_PLT32	.cpuidle.text+0x586
170a     170a:	e9 00 00 00 00       	jmp    170f <.altinstr_replacement+0x170f>	170b: R_X86_64_PLT32	.init.text+0x3d33b
170f     170f:	e9 00 00 00 00       	jmp    1714 <.altinstr_replacement+0x1714>	1710: R_X86_64_PLT32	.cpuidle.text+0x6c7
1714     1714:	e9 00 00 00 00       	jmp    1719 <.altinstr_replacement+0x1719>	1715: R_X86_64_PLT32	.cpuidle.text+0x64a
1719     1719:	e9 00 00 00 00       	jmp    171e <.altinstr_replacement+0x171e>	171a: R_X86_64_PLT32	.cpuidle.text+0x78f
171e     171e:	e9 00 00 00 00       	jmp    1723 <.altinstr_replacement+0x1723>	171f: R_X86_64_PLT32	.cpuidle.text+0x729
1723     1723:	e9 00 00 00 00       	jmp    1728 <.altinstr_replacement+0x1728>	1724: R_X86_64_PLT32	.cpuidle.text+0x84f
1728     1728:	e9 00 00 00 00       	jmp    172d <.altinstr_replacement+0x172d>	1729: R_X86_64_PLT32	.cpuidle.text+0x7e9
172d     172d:	e9 00 00 00 00       	jmp    1732 <.altinstr_replacement+0x1732>	172e: R_X86_64_PLT32	.text+0x7bf8da
1732     1732:	e9 00 00 00 00       	jmp    1737 <.altinstr_replacement+0x1737>	1733: R_X86_64_PLT32	.text+0x7c0a70
1737     1737:	e9 00 00 00 00       	jmp    173c <.altinstr_replacement+0x173c>	1738: R_X86_64_PLT32	.cpuidle.text+0x8db
173c     173c:	e9 00 00 00 00       	jmp    1741 <.altinstr_replacement+0x1741>	173d: R_X86_64_PLT32	.text+0x7d7160
1741     1741:	e9 00 00 00 00       	jmp    1746 <.altinstr_replacement+0x1746>	1742: R_X86_64_PLT32	.cpuidle.text+0x965
1746     1746:	f3 0f b8 c7          	popcnt %edi,%eax
174a     174a:	f3 0f b8 c7          	popcnt %edi,%eax
174e     174e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1758     1758:	0f 01 cb             	stac
175b     175b:	e8 00 00 00 00       	call   1760 <.altinstr_replacement+0x1760>	175c: R_X86_64_PLT32	clear_user_erms-0x4
1760     1760:	e8 00 00 00 00       	call   1765 <.altinstr_replacement+0x1765>	1761: R_X86_64_PLT32	clear_user_rep_good-0x4
1765     1765:	e8 00 00 00 00       	call   176a <.altinstr_replacement+0x176a>	1766: R_X86_64_PLT32	clear_user_original-0x4
176a     176a:	0f 01 ca             	clac
176d     176d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1772     1772:	e9 00 00 00 00       	jmp    1777 <.altinstr_replacement+0x1777>	1773: R_X86_64_PLT32	.init.text+0x44ea6
1777     1777:	e9 00 00 00 00       	jmp    177c <.altinstr_replacement+0x177c>	1778: R_X86_64_PLT32	.init.text+0x44ecc
177c     177c:	e9 00 00 00 00       	jmp    1781 <.altinstr_replacement+0x1781>	177d: R_X86_64_PLT32	.text+0x82e406
1781     1781:	e9 00 00 00 00       	jmp    1786 <.altinstr_replacement+0x1786>	1782: R_X86_64_PLT32	.text+0x82e432
1786     1786:	f3 0f b8 c7          	popcnt %edi,%eax
178a     178a:	e9 00 00 00 00       	jmp    178f <.altinstr_replacement+0x178f>	178b: R_X86_64_PLT32	.text+0x84cf55
178f     178f:	e9 00 00 00 00       	jmp    1794 <.altinstr_replacement+0x1794>	1790: R_X86_64_PLT32	.text+0x84cfc7
1794     1794:	66 0f ae 3c 3a       	clflushopt (%rdx,%rdi,1)
1799     1799:	e9 00 00 00 00       	jmp    179e <.altinstr_replacement+0x179e>	179a: R_X86_64_PLT32	.text+0x84d076
179e     179e:	66 0f ae 39          	clflushopt (%rcx)
17a2     17a2:	66 0f ae 7e ff       	clflushopt -0x1(%rsi)
17a7     17a7:	e9 00 00 00 00       	jmp    17ac <.altinstr_replacement+0x17ac>	17a8: R_X86_64_PLT32	.text+0x84d31f
17ac     17ac:	f3 0f b8 c7          	popcnt %edi,%eax
17b0     17b0:	f3 0f b8 c7          	popcnt %edi,%eax
17b4     17b4:	f3 0f b8 c7          	popcnt %edi,%eax
17b8     17b8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
17bd     17bd:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
17c7     17c7:	0f 01 cb             	stac
17ca     17ca:	e8 00 00 00 00       	call   17cf <.altinstr_replacement+0x17cf>	17cb: R_X86_64_PLT32	clear_user_erms-0x4
17cf     17cf:	e8 00 00 00 00       	call   17d4 <.altinstr_replacement+0x17d4>	17d0: R_X86_64_PLT32	clear_user_rep_good-0x4
17d4     17d4:	e8 00 00 00 00       	call   17d9 <.altinstr_replacement+0x17d9>	17d5: R_X86_64_PLT32	clear_user_original-0x4
17d9     17d9:	0f 01 ca             	clac
17dc     17dc:	f3 0f b8 c7          	popcnt %edi,%eax
17e0     17e0:	f3 0f b8 c7          	popcnt %edi,%eax
17e4     17e4:	f3 0f b8 c7          	popcnt %edi,%eax
17e8     17e8:	e8 00 00 00 00       	call   17ed <.altinstr_replacement+0x17ed>	17e9: R_X86_64_PLT32	clear_page_rep-0x4
17ed     17ed:	e8 00 00 00 00       	call   17f2 <.altinstr_replacement+0x17f2>	17ee: R_X86_64_PLT32	clear_page_erms-0x4
17f2     17f2:	0f 01 c1             	vmcall
17f5     17f5:	0f 01 d9             	vmmcall
17f8     17f8:	0f 01 c1             	vmcall
17fb     17fb:	0f 01 d9             	vmmcall
17fe     17fe:	0f 01 c1             	vmcall
1801     1801:	0f 01 d9             	vmmcall
1804     1804:	0f 01 c1             	vmcall
1807     1807:	0f 01 d9             	vmmcall
180a     180a:	0f 01 c1             	vmcall
180d     180d:	0f 01 d9             	vmmcall
1810     1810:	0f 01 c1             	vmcall
1813     1813:	0f 01 d9             	vmmcall
1816     1816:	0f 01 c1             	vmcall
1819     1819:	0f 01 d9             	vmmcall
181c     181c:	0f 01 c1             	vmcall
181f     181f:	0f 01 d9             	vmmcall
1822     1822:	0f 01 c1             	vmcall
1825     1825:	0f 01 d9             	vmmcall
1828     1828:	0f 01 c1             	vmcall
182b     182b:	0f 01 d9             	vmmcall
182e     182e:	0f 01 c1             	vmcall
1831     1831:	0f 01 d9             	vmmcall
1834     1834:	0f 01 c1             	vmcall
1837     1837:	0f 01 d9             	vmmcall
183a     183a:	0f 01 c1             	vmcall
183d     183d:	0f 01 d9             	vmmcall
1840     1840:	0f 01 c1             	vmcall
1843     1843:	0f 01 d9             	vmmcall
1846     1846:	0f 01 c1             	vmcall
1849     1849:	0f 01 d9             	vmmcall
184c     184c:	0f 01 c1             	vmcall
184f     184f:	0f 01 d9             	vmmcall
1852     1852:	0f 01 c1             	vmcall
1855     1855:	0f 01 d9             	vmmcall
1858     1858:	0f 01 c1             	vmcall
185b     185b:	0f 01 d9             	vmmcall
185e     185e:	0f 01 c1             	vmcall
1861     1861:	0f 01 d9             	vmmcall
1864     1864:	e8 00 00 00 00       	call   1869 <.altinstr_replacement+0x1869>	1865: R_X86_64_PLT32	clear_page_rep-0x4
1869     1869:	e8 00 00 00 00       	call   186e <.altinstr_replacement+0x186e>	186a: R_X86_64_PLT32	clear_page_erms-0x4
186e     186e:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1878     1878:	e9 00 00 00 00       	jmp    187d <.altinstr_replacement+0x187d>	1879: R_X86_64_PLT32	.init.text+0x4787a
187d     187d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1882     1882:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
188c     188c:	0f 01 cb             	stac
188f     188f:	e8 00 00 00 00       	call   1894 <.altinstr_replacement+0x1894>	1890: R_X86_64_PLT32	clear_user_erms-0x4
1894     1894:	e8 00 00 00 00       	call   1899 <.altinstr_replacement+0x1899>	1895: R_X86_64_PLT32	clear_user_rep_good-0x4
1899     1899:	e8 00 00 00 00       	call   189e <.altinstr_replacement+0x189e>	189a: R_X86_64_PLT32	clear_user_original-0x4
189e     189e:	0f 01 ca             	clac
18a1     18a1:	f3 0f b8 c7          	popcnt %edi,%eax
18a5     18a5:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
18af     18af:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
18b9     18b9:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
18c3     18c3:	f3 0f b8 c7          	popcnt %edi,%eax
18c7     18c7:	f3 0f b8 c7          	popcnt %edi,%eax
18cb     18cb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18d0     18d0:	f3 0f b8 c7          	popcnt %edi,%eax
18d4     18d4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18d9     18d9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18de     18de:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18e3     18e3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18e8     18e8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18ed     18ed:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18f2     18f2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18f7     18f7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
18fc     18fc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1901     1901:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1906     1906:	f3 48 0f b8 c7       	popcnt %rdi,%rax
190b     190b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1910     1910:	f3 0f b8 c7          	popcnt %edi,%eax
1914     1914:	e8 00 00 00 00       	call   1919 <.altinstr_replacement+0x1919>	1915: R_X86_64_PLT32	clear_page_rep-0x4
1919     1919:	e8 00 00 00 00       	call   191e <.altinstr_replacement+0x191e>	191a: R_X86_64_PLT32	clear_page_erms-0x4
191e     191e:	e8 00 00 00 00       	call   1923 <.altinstr_replacement+0x1923>	191f: R_X86_64_PLT32	clear_page_rep-0x4
1923     1923:	e8 00 00 00 00       	call   1928 <.altinstr_replacement+0x1928>	1924: R_X86_64_PLT32	clear_page_erms-0x4
1928     1928:	e8 00 00 00 00       	call   192d <.altinstr_replacement+0x192d>	1929: R_X86_64_PLT32	clear_page_rep-0x4
192d     192d:	e8 00 00 00 00       	call   1932 <.altinstr_replacement+0x1932>	192e: R_X86_64_PLT32	clear_page_erms-0x4
1932     1932:	f3 0f b8 c7          	popcnt %edi,%eax
1936     1936:	f3 48 0f b8 c7       	popcnt %rdi,%rax
193b     193b:	f3 0f b8 c7          	popcnt %edi,%eax
193f     193f:	f3 0f b8 c7          	popcnt %edi,%eax
1943     1943:	f3 0f b8 c7          	popcnt %edi,%eax
1947     1947:	f3 0f b8 c7          	popcnt %edi,%eax
194b     194b:	f3 0f b8 c7          	popcnt %edi,%eax
194f     194f:	f3 0f b8 c7          	popcnt %edi,%eax
1953     1953:	f3 0f b8 c7          	popcnt %edi,%eax
1957     1957:	f3 48 0f b8 c7       	popcnt %rdi,%rax
195c     195c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1961     1961:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1966     1966:	f3 48 0f b8 c7       	popcnt %rdi,%rax
196b     196b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1970     1970:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1975     1975:	f3 48 0f b8 c7       	popcnt %rdi,%rax
197a     197a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
197f     197f:	0f 0d 08             	prefetchw (%rax)
1982     1982:	0f 0d 08             	prefetchw (%rax)
1985     1985:	0f 0d 08             	prefetchw (%rax)
1988     1988:	0f 0d 08             	prefetchw (%rax)
198b     198b:	f3 0f b8 c7          	popcnt %edi,%eax
198f     198f:	f3 0f b8 c7          	popcnt %edi,%eax
1993     1993:	f3 0f b8 c7          	popcnt %edi,%eax
1997     1997:	f3 48 0f b8 c7       	popcnt %rdi,%rax
199c     199c:	0f 0d 08             	prefetchw (%rax)
199f     199f:	0f 0d 8c 08 dc 00 00 00 	prefetchw 0xdc(%rax,%rcx,1)
19a7     19a7:	0f 0d 88 d4 00 00 00 	prefetchw 0xd4(%rax)
19ae     19ae:	0f 0d 8c 08 d0 00 00 00 	prefetchw 0xd0(%rax,%rcx,1)
19b6     19b6:	f3 0f b8 c7          	popcnt %edi,%eax
19ba     19ba:	f3 0f b8 c7          	popcnt %edi,%eax
19be     19be:	f3 0f b8 c7          	popcnt %edi,%eax
19c2     19c2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19c7     19c7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19cc     19cc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19d1     19d1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19d6     19d6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19db     19db:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19e0     19e0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19e5     19e5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
19ea     19ea:	0f 0d 08             	prefetchw (%rax)
19ed     19ed:	f3 0f b8 c7          	popcnt %edi,%eax
19f1     19f1:	f3 0f b8 c7          	popcnt %edi,%eax
19f5     19f5:	f3 0f b8 c7          	popcnt %edi,%eax
19f9     19f9:	f3 0f b8 c7          	popcnt %edi,%eax
19fd     19fd:	f3 0f b8 c7          	popcnt %edi,%eax
1a01     1a01:	f3 0f b8 c7          	popcnt %edi,%eax
1a05     1a05:	f3 0f b8 c7          	popcnt %edi,%eax
1a09     1a09:	f3 0f b8 c7          	popcnt %edi,%eax
1a0d     1a0d:	f3 0f b8 c7          	popcnt %edi,%eax
1a11     1a11:	f3 0f b8 c7          	popcnt %edi,%eax
1a15     1a15:	f3 0f b8 c7          	popcnt %edi,%eax
1a19     1a19:	f3 0f b8 c7          	popcnt %edi,%eax
1a1d     1a1d:	f3 0f b8 c7          	popcnt %edi,%eax
1a21     1a21:	f3 0f b8 c7          	popcnt %edi,%eax
1a25     1a25:	f3 0f b8 c7          	popcnt %edi,%eax
1a29     1a29:	f3 0f b8 c7          	popcnt %edi,%eax
1a2d     1a2d:	f3 0f b8 c7          	popcnt %edi,%eax
1a31     1a31:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1a36     1a36:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1a3b     1a3b:	f3 0f b8 c7          	popcnt %edi,%eax
1a3f     1a3f:	f3 0f b8 c7          	popcnt %edi,%eax
1a43     1a43:	f3 0f b8 c7          	popcnt %edi,%eax
1a47     1a47:	f3 0f b8 c7          	popcnt %edi,%eax
1a4b     1a4b:	f3 0f b8 c7          	popcnt %edi,%eax
1a4f     1a4f:	f3 0f b8 c7          	popcnt %edi,%eax
1a53     1a53:	f3 0f b8 c7          	popcnt %edi,%eax
1a57     1a57:	f3 0f b8 c7          	popcnt %edi,%eax
1a5b     1a5b:	f3 0f b8 c7          	popcnt %edi,%eax
1a5f     1a5f:	f3 0f b8 c7          	popcnt %edi,%eax
1a63     1a63:	f3 0f b8 c7          	popcnt %edi,%eax
1a67     1a67:	f3 0f b8 c7          	popcnt %edi,%eax
1a6b     1a6b:	f3 0f b8 c7          	popcnt %edi,%eax
1a6f     1a6f:	f3 0f b8 c7          	popcnt %edi,%eax
1a73     1a73:	f3 0f b8 c7          	popcnt %edi,%eax
1a77     1a77:	f3 0f b8 c7          	popcnt %edi,%eax
1a7b     1a7b:	f3 0f b8 c7          	popcnt %edi,%eax
1a7f     1a7f:	f3 0f b8 c7          	popcnt %edi,%eax
1a83     1a83:	f3 0f b8 c7          	popcnt %edi,%eax
1a87     1a87:	f3 0f b8 c7          	popcnt %edi,%eax
1a8b     1a8b:	f3 0f b8 c7          	popcnt %edi,%eax
1a8f     1a8f:	f3 0f b8 c7          	popcnt %edi,%eax
1a93     1a93:	f3 0f b8 c7          	popcnt %edi,%eax
1a97     1a97:	f3 0f b8 c7          	popcnt %edi,%eax
1a9b     1a9b:	f3 0f b8 c7          	popcnt %edi,%eax
1a9f     1a9f:	f3 0f b8 c7          	popcnt %edi,%eax
1aa3     1aa3:	f3 0f b8 c7          	popcnt %edi,%eax
1aa7     1aa7:	f3 0f b8 c7          	popcnt %edi,%eax
1aab     1aab:	f3 0f b8 c7          	popcnt %edi,%eax
1aaf     1aaf:	f3 0f b8 c7          	popcnt %edi,%eax
1ab3     1ab3:	f3 0f b8 c7          	popcnt %edi,%eax
1ab7     1ab7:	f3 0f b8 c7          	popcnt %edi,%eax
1abb     1abb:	f3 0f b8 c7          	popcnt %edi,%eax
1abf     1abf:	f3 0f b8 c7          	popcnt %edi,%eax
1ac3     1ac3:	f3 0f b8 c7          	popcnt %edi,%eax
1ac7     1ac7:	f3 0f b8 c7          	popcnt %edi,%eax
1acb     1acb:	f3 0f b8 c7          	popcnt %edi,%eax
1acf     1acf:	f3 0f b8 c7          	popcnt %edi,%eax
1ad3     1ad3:	f3 0f b8 c7          	popcnt %edi,%eax
1ad7     1ad7:	f3 0f b8 c7          	popcnt %edi,%eax
1adb     1adb:	f3 0f b8 c7          	popcnt %edi,%eax
1adf     1adf:	f3 0f b8 c7          	popcnt %edi,%eax
1ae3     1ae3:	f3 0f b8 c7          	popcnt %edi,%eax
1ae7     1ae7:	f3 0f b8 c7          	popcnt %edi,%eax
1aeb     1aeb:	f3 0f b8 c7          	popcnt %edi,%eax
1aef     1aef:	f3 0f b8 c7          	popcnt %edi,%eax
1af3     1af3:	f3 0f b8 c7          	popcnt %edi,%eax
1af7     1af7:	f3 0f b8 c7          	popcnt %edi,%eax
1afb     1afb:	f3 0f b8 c7          	popcnt %edi,%eax
1aff     1aff:	f3 0f b8 c7          	popcnt %edi,%eax
1b03     1b03:	f3 0f b8 c7          	popcnt %edi,%eax
1b07     1b07:	f3 0f b8 c7          	popcnt %edi,%eax
1b0b     1b0b:	f3 0f b8 c7          	popcnt %edi,%eax
1b0f     1b0f:	f3 0f b8 c7          	popcnt %edi,%eax
1b13     1b13:	f3 0f b8 c7          	popcnt %edi,%eax
1b17     1b17:	f3 0f b8 c7          	popcnt %edi,%eax
1b1b     1b1b:	f3 0f b8 c7          	popcnt %edi,%eax
1b1f     1b1f:	f3 0f b8 c7          	popcnt %edi,%eax
1b23     1b23:	f3 0f b8 c7          	popcnt %edi,%eax
1b27     1b27:	f3 0f b8 c7          	popcnt %edi,%eax
1b2b     1b2b:	f3 0f b8 c7          	popcnt %edi,%eax
1b2f     1b2f:	f3 0f b8 c7          	popcnt %edi,%eax
1b33     1b33:	f3 0f b8 c7          	popcnt %edi,%eax
1b37     1b37:	f3 0f b8 c7          	popcnt %edi,%eax
1b3b     1b3b:	f3 0f b8 c7          	popcnt %edi,%eax
1b3f     1b3f:	f3 0f b8 c7          	popcnt %edi,%eax
1b43     1b43:	f3 0f b8 c7          	popcnt %edi,%eax
1b47     1b47:	f3 0f b8 c7          	popcnt %edi,%eax
1b4b     1b4b:	f3 0f b8 c7          	popcnt %edi,%eax
1b4f     1b4f:	f3 0f b8 c7          	popcnt %edi,%eax
1b53     1b53:	f3 0f b8 c7          	popcnt %edi,%eax
1b57     1b57:	f3 0f b8 c7          	popcnt %edi,%eax
1b5b     1b5b:	f3 0f b8 c7          	popcnt %edi,%eax
1b5f     1b5f:	f3 0f b8 c7          	popcnt %edi,%eax
1b63     1b63:	f3 0f b8 c7          	popcnt %edi,%eax
1b67     1b67:	f3 0f b8 c7          	popcnt %edi,%eax
1b6b     1b6b:	f3 0f b8 c7          	popcnt %edi,%eax
1b6f     1b6f:	f3 0f b8 c7          	popcnt %edi,%eax
1b73     1b73:	f3 0f b8 c7          	popcnt %edi,%eax
1b77     1b77:	f3 0f b8 c7          	popcnt %edi,%eax
1b7b     1b7b:	f3 0f b8 c7          	popcnt %edi,%eax
1b7f     1b7f:	f3 0f b8 c7          	popcnt %edi,%eax
1b83     1b83:	f3 0f b8 c7          	popcnt %edi,%eax
1b87     1b87:	f3 0f b8 c7          	popcnt %edi,%eax
1b8b     1b8b:	f3 0f b8 c7          	popcnt %edi,%eax
1b8f     1b8f:	f3 0f b8 c7          	popcnt %edi,%eax
1b93     1b93:	f3 0f b8 c7          	popcnt %edi,%eax
1b97     1b97:	f3 0f b8 c7          	popcnt %edi,%eax
1b9b     1b9b:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1ba5     1ba5:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1baf     1baf:	e9 00 00 00 00       	jmp    1bb4 <.altinstr_replacement+0x1bb4>	1bb0: R_X86_64_PLT32	.text+0x110a045
1bb4     1bb4:	e9 00 00 00 00       	jmp    1bb9 <.altinstr_replacement+0x1bb9>	1bb5: R_X86_64_PLT32	.text+0x110a04f
1bb9     1bb9:	f3 0f b8 c7          	popcnt %edi,%eax
1bbd     1bbd:	f3 0f b8 c7          	popcnt %edi,%eax
1bc1     1bc1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1bc6     1bc6:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1bd0     1bd0:	0f 01 cb             	stac
1bd3     1bd3:	e8 00 00 00 00       	call   1bd8 <.altinstr_replacement+0x1bd8>	1bd4: R_X86_64_PLT32	clear_user_erms-0x4
1bd8     1bd8:	e8 00 00 00 00       	call   1bdd <.altinstr_replacement+0x1bdd>	1bd9: R_X86_64_PLT32	clear_user_rep_good-0x4
1bdd     1bdd:	e8 00 00 00 00       	call   1be2 <.altinstr_replacement+0x1be2>	1bde: R_X86_64_PLT32	clear_user_original-0x4
1be2     1be2:	0f 01 ca             	clac
1be5     1be5:	f3 0f b8 c7          	popcnt %edi,%eax
1be9     1be9:	e9 00 00 00 00       	jmp    1bee <.altinstr_replacement+0x1bee>	1bea: R_X86_64_PLT32	.text+0x11b42ac
1bee     1bee:	0f 01 d9             	vmmcall
1bf1     1bf1:	e9 00 00 00 00       	jmp    1bf6 <.altinstr_replacement+0x1bf6>	1bf2: R_X86_64_PLT32	.text+0x11b4338
1bf6     1bf6:	0f 01 d9             	vmmcall
1bf9     1bf9:	e9 00 00 00 00       	jmp    1bfe <.altinstr_replacement+0x1bfe>	1bfa: R_X86_64_PLT32	.text+0x11b4447
1bfe     1bfe:	0f 01 d9             	vmmcall
1c01     1c01:	f3 0f b8 c7          	popcnt %edi,%eax
1c05     1c05:	f3 0f b8 c7          	popcnt %edi,%eax
1c09     1c09:	f3 0f b8 c7          	popcnt %edi,%eax
1c0d     1c0d:	f3 0f b8 c7          	popcnt %edi,%eax
1c11     1c11:	f3 0f b8 c7          	popcnt %edi,%eax
1c15     1c15:	f3 0f b8 c7          	popcnt %edi,%eax
1c19     1c19:	f3 0f b8 c7          	popcnt %edi,%eax
1c1d     1c1d:	f3 0f b8 c7          	popcnt %edi,%eax
1c21     1c21:	e9 00 00 00 00       	jmp    1c26 <.altinstr_replacement+0x1c26>	1c22: R_X86_64_PLT32	.text+0x124f79e
1c26     1c26:	e8 00 00 00 00       	call   1c2b <.altinstr_replacement+0x1c2b>	1c27: R_X86_64_PLT32	clear_page_rep-0x4
1c2b     1c2b:	e8 00 00 00 00       	call   1c30 <.altinstr_replacement+0x1c30>	1c2c: R_X86_64_PLT32	clear_page_erms-0x4
1c30     1c30:	f3 0f b8 c7          	popcnt %edi,%eax
1c34     1c34:	f3 0f b8 c7          	popcnt %edi,%eax
1c38     1c38:	f3 0f b8 c7          	popcnt %edi,%eax
1c3c     1c3c:	f3 0f b8 c7          	popcnt %edi,%eax
1c40     1c40:	f3 0f b8 c7          	popcnt %edi,%eax
1c44     1c44:	f3 0f b8 c7          	popcnt %edi,%eax
1c48     1c48:	f3 0f b8 c7          	popcnt %edi,%eax
1c4c     1c4c:	f3 0f b8 c7          	popcnt %edi,%eax
1c50     1c50:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
1c5a     1c5a:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1c64     1c64:	49 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r10
1c6e     1c6e:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1c78     1c78:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1c82     1c82:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1c8c     1c8c:	e8 00 00 00 00       	call   1c91 <.altinstr_replacement+0x1c91>	1c8d: R_X86_64_PLT32	copy_user_generic_string-0x4
1c91     1c91:	e8 00 00 00 00       	call   1c96 <.altinstr_replacement+0x1c96>	1c92: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1c96     1c96:	e8 00 00 00 00       	call   1c9b <.altinstr_replacement+0x1c9b>	1c97: R_X86_64_PLT32	copy_user_generic_string-0x4
1c9b     1c9b:	e8 00 00 00 00       	call   1ca0 <.altinstr_replacement+0x1ca0>	1c9c: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1ca0     1ca0:	48 be 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rsi
1caa     1caa:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1cb4     1cb4:	e8 00 00 00 00       	call   1cb9 <.altinstr_replacement+0x1cb9>	1cb5: R_X86_64_PLT32	copy_user_generic_string-0x4
1cb9     1cb9:	e8 00 00 00 00       	call   1cbe <.altinstr_replacement+0x1cbe>	1cba: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1cbe     1cbe:	e8 00 00 00 00       	call   1cc3 <.altinstr_replacement+0x1cc3>	1cbf: R_X86_64_PLT32	copy_user_generic_string-0x4
1cc3     1cc3:	e8 00 00 00 00       	call   1cc8 <.altinstr_replacement+0x1cc8>	1cc4: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1cc8     1cc8:	e9 00 00 00 00       	jmp    1ccd <.altinstr_replacement+0x1ccd>	1cc9: R_X86_64_PLT32	.init.text+0x6b822
1ccd     1ccd:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1cd7     1cd7:	f3 0f b8 c7          	popcnt %edi,%eax
1cdb     1cdb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ce0     1ce0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1ce5     1ce5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1cea     1cea:	f3 0f b8 c7          	popcnt %edi,%eax
1cee     1cee:	f3 0f b8 c7          	popcnt %edi,%eax
1cf2     1cf2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1cf7     1cf7:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1d01     1d01:	0f 0d 0b             	prefetchw (%rbx)
1d04     1d04:	0f 0d 4c 05 00       	prefetchw 0x0(%rbp,%rax,1)
1d09     1d09:	49 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%r9
1d13     1d13:	0f 01 cb             	stac
1d16     1d16:	0f ae e8             	lfence
1d19     1d19:	0f 01 ca             	clac
1d1c     1d1c:	0f 01 ca             	clac
1d1f     1d1f:	f3 0f b8 c7          	popcnt %edi,%eax
1d23     1d23:	f3 0f b8 c7          	popcnt %edi,%eax
1d27     1d27:	0f 0d 08             	prefetchw (%rax)
1d2a     1d2a:	f3 0f b8 c7          	popcnt %edi,%eax
1d2e     1d2e:	f3 0f b8 c7          	popcnt %edi,%eax
1d32     1d32:	f3 0f b8 c7          	popcnt %edi,%eax
1d36     1d36:	f3 0f b8 c7          	popcnt %edi,%eax
1d3a     1d3a:	f3 0f b8 c7          	popcnt %edi,%eax
1d3e     1d3e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1d43     1d43:	0f 0d 0b             	prefetchw (%rbx)
1d46     1d46:	f3 0f b8 c7          	popcnt %edi,%eax
1d4a     1d4a:	f3 0f b8 c7          	popcnt %edi,%eax
1d4e     1d4e:	f3 0f b8 c7          	popcnt %edi,%eax
1d52     1d52:	f3 0f b8 c7          	popcnt %edi,%eax
1d56     1d56:	f3 0f b8 c7          	popcnt %edi,%eax
1d5a     1d5a:	f3 0f b8 c7          	popcnt %edi,%eax
1d5e     1d5e:	f3 0f b8 c7          	popcnt %edi,%eax
1d62     1d62:	f3 0f b8 c7          	popcnt %edi,%eax
1d66     1d66:	f3 0f b8 c7          	popcnt %edi,%eax
1d6a     1d6a:	f3 0f b8 c7          	popcnt %edi,%eax
1d6e     1d6e:	f3 0f b8 c7          	popcnt %edi,%eax
1d72     1d72:	f3 0f b8 c7          	popcnt %edi,%eax
1d76     1d76:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1d7b     1d7b:	f3 0f b8 c7          	popcnt %edi,%eax
1d7f     1d7f:	f3 0f b8 c7          	popcnt %edi,%eax
1d83     1d83:	f3 0f b8 c7          	popcnt %edi,%eax
1d87     1d87:	f3 0f b8 c7          	popcnt %edi,%eax
1d8b     1d8b:	f3 0f b8 c7          	popcnt %edi,%eax
1d8f     1d8f:	f3 0f b8 c7          	popcnt %edi,%eax
1d93     1d93:	f3 0f b8 c7          	popcnt %edi,%eax
1d97     1d97:	f3 0f b8 c7          	popcnt %edi,%eax
1d9b     1d9b:	f3 0f b8 c7          	popcnt %edi,%eax
1d9f     1d9f:	f3 0f b8 c7          	popcnt %edi,%eax
1da3     1da3:	f3 0f b8 c7          	popcnt %edi,%eax
1da7     1da7:	f3 0f b8 c7          	popcnt %edi,%eax
1dab     1dab:	f3 0f b8 c7          	popcnt %edi,%eax
1daf     1daf:	f3 0f b8 c7          	popcnt %edi,%eax
1db3     1db3:	f3 0f b8 c7          	popcnt %edi,%eax
1db7     1db7:	f3 0f b8 c7          	popcnt %edi,%eax
1dbb     1dbb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1dc0     1dc0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1dc5     1dc5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1dca     1dca:	f3 0f b8 c7          	popcnt %edi,%eax
1dce     1dce:	e9 00 00 00 00       	jmp    1dd3 <.altinstr_replacement+0x1dd3>	1dcf: R_X86_64_PLT32	.text+0x17c26c2
1dd3     1dd3:	e9 00 00 00 00       	jmp    1dd8 <.altinstr_replacement+0x1dd8>	1dd4: R_X86_64_PLT32	.text+0x17c26f0
1dd8     1dd8:	0f 01 cb             	stac
1ddb     1ddb:	0f 01 ca             	clac
1dde     1dde:	0f 01 cb             	stac
1de1     1de1:	0f 01 ca             	clac
1de4     1de4:	e8 00 00 00 00       	call   1de9 <.altinstr_replacement+0x1de9>	1de5: R_X86_64_PLT32	copy_user_generic_string-0x4
1de9     1de9:	e8 00 00 00 00       	call   1dee <.altinstr_replacement+0x1dee>	1dea: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1dee     1dee:	0f 01 cb             	stac
1df1     1df1:	0f 01 cb             	stac
1df4     1df4:	0f 01 ca             	clac
1df7     1df7:	0f 01 cb             	stac
1dfa     1dfa:	0f 01 ca             	clac
1dfd     1dfd:	0f 01 ca             	clac
1e00     1e00:	0f 01 ca             	clac
1e03     1e03:	0f 01 ca             	clac
1e06     1e06:	0f 01 cb             	stac
1e09     1e09:	0f 01 ca             	clac
1e0c     1e0c:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1e16     1e16:	0f 01 cb             	stac
1e19     1e19:	0f ae e8             	lfence
1e1c     1e1c:	0f 01 ca             	clac
1e1f     1e1f:	48 b9 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rcx
1e29     1e29:	0f 01 cb             	stac
1e2c     1e2c:	0f ae e8             	lfence
1e2f     1e2f:	0f 01 ca             	clac
1e32     1e32:	0f ae e8             	lfence
1e35     1e35:	0f 31                	rdtsc
1e37     1e37:	0f 01 f9             	rdtscp
1e3a     1e3a:	0f ae e8             	lfence
1e3d     1e3d:	0f 31                	rdtsc
1e3f     1e3f:	0f 01 f9             	rdtscp
1e42     1e42:	0f ae e8             	lfence
1e45     1e45:	0f 31                	rdtsc
1e47     1e47:	0f 01 f9             	rdtscp
1e4a     1e4a:	0f ae e8             	lfence
1e4d     1e4d:	0f 31                	rdtsc
1e4f     1e4f:	0f 01 f9             	rdtscp
1e52     1e52:	0f ae e8             	lfence
1e55     1e55:	0f 31                	rdtsc
1e57     1e57:	0f 01 f9             	rdtscp
1e5a     1e5a:	48 ba 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rdx
1e64     1e64:	0f 01 cb             	stac
1e67     1e67:	0f 01 ca             	clac
1e6a     1e6a:	48 ba ff ef ff ff ff ff ff 00 	movabs $0xffffffffffefff,%rdx
1e74     1e74:	0f 01 cb             	stac
1e77     1e77:	0f 01 ca             	clac
1e7a     1e7a:	48 ba fd ef ff ff ff ff ff 00 	movabs $0xffffffffffeffd,%rdx
1e84     1e84:	0f 01 cb             	stac
1e87     1e87:	0f 01 ca             	clac
1e8a     1e8a:	48 ba f9 ef ff ff ff ff ff 00 	movabs $0xffffffffffeff9,%rdx
1e94     1e94:	0f 01 cb             	stac
1e97     1e97:	0f 01 ca             	clac
1e9a     1e9a:	0f 01 cb             	stac
1e9d     1e9d:	0f ae e8             	lfence
1ea0     1ea0:	0f 01 ca             	clac
1ea3     1ea3:	0f 01 cb             	stac
1ea6     1ea6:	0f ae e8             	lfence
1ea9     1ea9:	0f 01 ca             	clac
1eac     1eac:	0f 01 cb             	stac
1eaf     1eaf:	0f ae e8             	lfence
1eb2     1eb2:	0f 01 ca             	clac
1eb5     1eb5:	0f 01 cb             	stac
1eb8     1eb8:	0f ae e8             	lfence
1ebb     1ebb:	0f 01 ca             	clac
1ebe     1ebe:	0f 01 ca             	clac
1ec1     1ec1:	e8 00 00 00 00       	call   1ec6 <.altinstr_replacement+0x1ec6>	1ec2: R_X86_64_PLT32	copy_user_generic_string-0x4
1ec6     1ec6:	e8 00 00 00 00       	call   1ecb <.altinstr_replacement+0x1ecb>	1ec7: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1ecb     1ecb:	e9 00 00 00 00       	jmp    1ed0 <.altinstr_replacement+0x1ed0>	1ecc: R_X86_64_PLT32	.noinstr.text+0x368c
1ed0     1ed0:	e9 00 00 00 00       	jmp    1ed5 <.altinstr_replacement+0x1ed5>	1ed1: R_X86_64_PLT32	.text+0x17c50e5
1ed5     1ed5:	e9 00 00 00 00       	jmp    1eda <.altinstr_replacement+0x1eda>	1ed6: R_X86_64_PLT32	.text+0x17c511c
1eda     1eda:	48 bb 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rbx
1ee4     1ee4:	0f 01 cb             	stac
1ee7     1ee7:	0f 01 ca             	clac
1eea     1eea:	0f 01 cb             	stac
1eed     1eed:	0f 01 ca             	clac
1ef0     1ef0:	48 bb ff ef ff ff ff ff ff 00 	movabs $0xffffffffffefff,%rbx
1efa     1efa:	0f 01 cb             	stac
1efd     1efd:	0f 01 ca             	clac
1f00     1f00:	0f 01 cb             	stac
1f03     1f03:	0f 01 ca             	clac
1f06     1f06:	48 bb fd ef ff ff ff ff ff 00 	movabs $0xffffffffffeffd,%rbx
1f10     1f10:	0f 01 cb             	stac
1f13     1f13:	0f 01 ca             	clac
1f16     1f16:	0f 01 cb             	stac
1f19     1f19:	0f 01 ca             	clac
1f1c     1f1c:	48 bb f9 ef ff ff ff ff ff 00 	movabs $0xffffffffffeff9,%rbx
1f26     1f26:	0f 01 cb             	stac
1f29     1f29:	0f 01 ca             	clac
1f2c     1f2c:	0f 01 cb             	stac
1f2f     1f2f:	0f 01 ca             	clac
1f32     1f32:	0f 01 ca             	clac
1f35     1f35:	48 b8 00 f0 ff ff ff ff ff 00 	movabs $0xfffffffffff000,%rax
1f3f     1f3f:	e8 00 00 00 00       	call   1f44 <.altinstr_replacement+0x1f44>	1f40: R_X86_64_PLT32	copy_user_generic_string-0x4
1f44     1f44:	e8 00 00 00 00       	call   1f49 <.altinstr_replacement+0x1f49>	1f45: R_X86_64_PLT32	copy_user_enhanced_fast_string-0x4
1f49     1f49:	66 0f ae 38          	clflushopt (%rax)
1f4d     1f4d:	66 0f ae 30          	clwb   (%rax)
1f51     1f51:	66 0f ae 38          	clflushopt (%rax)
1f55     1f55:	66 0f ae 30          	clwb   (%rax)
1f59     1f59:	66 0f ae 38          	clflushopt (%rax)
1f5d     1f5d:	66 0f ae 30          	clwb   (%rax)
1f61     1f61:	66 0f ae 38          	clflushopt (%rax)
1f65     1f65:	66 0f ae 30          	clwb   (%rax)
1f69     1f69:	66 0f ae 38          	clflushopt (%rax)
1f6d     1f6d:	66 0f ae 30          	clwb   (%rax)
1f71     1f71:	66 0f ae 38          	clflushopt (%rax)
1f75     1f75:	66 0f ae 30          	clwb   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
