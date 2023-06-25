Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD11A944F;
	Sun, 25 Jun 2023 23:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687734538; x=1719270538;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kgs0DTImXaHGOSXXaXLv7Ytcec8onb+d4GuQhh2bfKI=;
  b=EjAioxAV9SErUFHsbGVaaF0OR4OC3FoTXtJ2XW7h/G9zn800YMfV3egK
   EkWhhRpNn2i9sa0ntXbJbdo2ZTnQnWmmhc8XF+8+EWxa92/MWtlj7bdjs
   rnaJ7hvRSokTwZ1auHVuRNe665hadJJmTHsYDlazCMVG5Nwk+BlAd3BZX
   TIf0KsWFnkAghQRuyisH9C3HXvZfhqiDvWYgVjgWfj6kEFMIfRNENErR/
   obtjWO/zFq3EPbTpvaiqORDyWrGee2gYJX/MdMdBQMotHxaJOksXg2tsM
   AC7/QW6Bpa8ELyM2WPdyAvnXDLLAeozmiENKOAFBpRfoc2PcjtTyxM2sl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="361165400"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="361165400"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 16:08:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10752"; a="840072419"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="840072419"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Jun 2023 16:08:55 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDYqk-000ALB-1w;
	Sun, 25 Jun 2023 23:08:54 +0000
Date: Mon, 26 Jun 2023 07:08:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [tip:x86/alternatives 2/11] vmlinux.o: warning: objtool:
 .altinstr_replacement+0x351: call without frame pointer save/setup
Message-ID: <202306260721.kNw4dhvT-lkp@intel.com>
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
TO: Peter Zijlstra <peterz@infradead.org>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/alternatives
head:   2bd4aa9325821551648cf9738d6aa3a49317d7e5
commit: 270a69c4485d7d07516d058bcc0473c90ee22185 [2/11] x86/alternative: Support relocations in alternatives
config: x86_64-buildonly-randconfig-r003-20230626 (https://download.01.org/0day-ci/archive/20230626/202306260721.kNw4dhvT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230626/202306260721.kNw4dhvT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306260721.kNw4dhvT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0xc: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: .altinstr_replacement+0x351: call without frame pointer save/setup
   vmlinux.o: warning: objtool: ibt_selftest+0x19: return with modified stack frame


objdump-func vmlinux.o .altinstr_replacement:
0000 0000000000000000 <.altinstr_replacement>:
0000        0:	e9 00 00 00 00       	jmp    5 <.altinstr_replacement+0x5>	1: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0005        5:	49 c7 c4 10 00 00 00 	mov    $0x10,%r12
000c        c:	e8 01 00 00 00       	call   12 <.altinstr_replacement+0x12>
0011       11:	cc                   	int3
0012       12:	e8 01 00 00 00       	call   18 <.altinstr_replacement+0x18>
0017       17:	cc                   	int3
0018       18:	48 83 c4 10          	add    $0x10,%rsp
001c       1c:	49 ff cc             	dec    %r12
001f       1f:	75 eb                	jne    c <.altinstr_replacement+0xc>
0021       21:	0f ae e8             	lfence
0024       24:	90                   	nop
0025       25:	90                   	nop
0026       26:	e8 01 00 00 00       	call   2c <.altinstr_replacement+0x2c>
002b       2b:	cc                   	int3
002c       2c:	48 83 c4 08          	add    $0x8,%rsp
0030       30:	0f ae e8             	lfence
0033       33:	0f 01 ca             	clac
0036       36:	e8 00 00 00 00       	call   3b <.altinstr_replacement+0x3b>	37: R_X86_64_PLT32	xen_error_entry-0x4
003b       3b:	0f 01 ca             	clac
003e       3e:	e8 00 00 00 00       	call   43 <.altinstr_replacement+0x43>	3f: R_X86_64_PLT32	xen_error_entry-0x4
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
00c6       c6:	0f 01 ca             	clac
00c9       c9:	e8 00 00 00 00       	call   ce <.altinstr_replacement+0xce>	ca: R_X86_64_PLT32	xen_error_entry-0x4
00ce       ce:	0f 01 ca             	clac
00d1       d1:	e8 00 00 00 00       	call   d6 <.altinstr_replacement+0xd6>	d2: R_X86_64_PLT32	xen_error_entry-0x4
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
014e      14e:	0f 01 ca             	clac
0151      151:	e8 00 00 00 00       	call   156 <.altinstr_replacement+0x156>	152: R_X86_64_PLT32	xen_error_entry-0x4
0156      156:	0f 01 ca             	clac
0159      159:	e8 00 00 00 00       	call   15e <.altinstr_replacement+0x15e>	15a: R_X86_64_PLT32	xen_error_entry-0x4
015e      15e:	0f ae f0             	mfence
0161      161:	b8 2b 00 00 00       	mov    $0x2b,%eax
0166      166:	8e e8                	mov    %eax,%gs
0168      168:	0f ae e8             	lfence
016b      16b:	0f ae e8             	lfence
016e      16e:	0f ae e8             	lfence
0171      171:	0f ae e8             	lfence
0174      174:	0f 01 ca             	clac
0177      177:	0f ae e8             	lfence
017a      17a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
017f      17f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0184      184:	e9 00 00 00 00       	jmp    189 <.altinstr_replacement+0x189>	185: R_X86_64_PLT32	.text+0x557e
0189      189:	f3 48 0f b8 c7       	popcnt %rdi,%rax
018e      18e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0193      193:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0198      198:	0f ae e8             	lfence
019b      19b:	0f 31                	rdtsc
019d      19d:	0f 01 f9             	rdtscp
01a0      1a0:	0f ae e8             	lfence
01a3      1a3:	0f 31                	rdtsc
01a5      1a5:	0f 01 f9             	rdtscp
01a8      1a8:	0f ae e8             	lfence
01ab      1ab:	0f 31                	rdtsc
01ad      1ad:	0f 01 f9             	rdtscp
01b0      1b0:	0f ae e8             	lfence
01b3      1b3:	0f 31                	rdtsc
01b5      1b5:	0f 01 f9             	rdtscp
01b8      1b8:	0f ae e8             	lfence
01bb      1bb:	0f 31                	rdtsc
01bd      1bd:	0f 01 f9             	rdtscp
01c0      1c0:	e9 00 00 00 00       	jmp    1c5 <.altinstr_replacement+0x1c5>	1c1: R_X86_64_PLT32	.init.text+0x7918
01c5      1c5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01ca      1ca:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01cf      1cf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01d4      1d4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01d9      1d9:	e9 00 00 00 00       	jmp    1de <.altinstr_replacement+0x1de>	1da: R_X86_64_PLT32	.text+0x1a702
01de      1de:	e9 00 00 00 00       	jmp    1e3 <.altinstr_replacement+0x1e3>	1df: R_X86_64_PLT32	.text+0x1abcf
01e3      1e3:	e9 00 00 00 00       	jmp    1e8 <.altinstr_replacement+0x1e8>	1e4: R_X86_64_PLT32	.text+0x1abe9
01e8      1e8:	e9 00 00 00 00       	jmp    1ed <.altinstr_replacement+0x1ed>	1e9: R_X86_64_PLT32	.text+0x1ac03
01ed      1ed:	e9 00 00 00 00       	jmp    1f2 <.altinstr_replacement+0x1f2>	1ee: R_X86_64_PLT32	.text+0x1ac1d
01f2      1f2:	e9 00 00 00 00       	jmp    1f7 <.altinstr_replacement+0x1f7>	1f3: R_X86_64_PLT32	.text+0x1ae16
01f7      1f7:	e9 00 00 00 00       	jmp    1fc <.altinstr_replacement+0x1fc>	1f8: R_X86_64_PLT32	.text+0x1ae79
01fc      1fc:	e9 00 00 00 00       	jmp    201 <.altinstr_replacement+0x201>	1fd: R_X86_64_PLT32	.text+0x1ade0
0201      201:	e9 00 00 00 00       	jmp    206 <.altinstr_replacement+0x206>	202: R_X86_64_PLT32	.text+0x1ae4f
0206      206:	e9 00 00 00 00       	jmp    20b <.altinstr_replacement+0x20b>	207: R_X86_64_PLT32	.text+0x1af08
020b      20b:	e9 00 00 00 00       	jmp    210 <.altinstr_replacement+0x210>	20c: R_X86_64_PLT32	.text+0x1af28
0210      210:	e9 00 00 00 00       	jmp    215 <.altinstr_replacement+0x215>	211: R_X86_64_PLT32	.text+0x1afaa
0215      215:	e9 00 00 00 00       	jmp    21a <.altinstr_replacement+0x21a>	216: R_X86_64_PLT32	.text+0x1afd4
021a      21a:	e9 00 00 00 00       	jmp    21f <.altinstr_replacement+0x21f>	21b: R_X86_64_PLT32	.text+0x1af8a
021f      21f:	e9 00 00 00 00       	jmp    224 <.altinstr_replacement+0x224>	220: R_X86_64_PLT32	.text+0x1af71
0224      224:	e9 00 00 00 00       	jmp    229 <.altinstr_replacement+0x229>	225: R_X86_64_PLT32	.text+0x1af41
0229      229:	e9 00 00 00 00       	jmp    22e <.altinstr_replacement+0x22e>	22a: R_X86_64_PLT32	.text+0x1b05e
022e      22e:	e9 00 00 00 00       	jmp    233 <.altinstr_replacement+0x233>	22f: R_X86_64_PLT32	.text+0x1b22c
0233      233:	e9 00 00 00 00       	jmp    238 <.altinstr_replacement+0x238>	234: R_X86_64_PLT32	.text+0x1b249
0238      238:	e9 00 00 00 00       	jmp    23d <.altinstr_replacement+0x23d>	239: R_X86_64_PLT32	.text+0x1b35b
023d      23d:	e9 00 00 00 00       	jmp    242 <.altinstr_replacement+0x242>	23e: R_X86_64_PLT32	.text+0x1b445
0242      242:	e9 00 00 00 00       	jmp    247 <.altinstr_replacement+0x247>	243: R_X86_64_PLT32	.text+0x1b59c
0247      247:	e9 00 00 00 00       	jmp    24c <.altinstr_replacement+0x24c>	248: R_X86_64_PLT32	.text+0x1b703
024c      24c:	e9 00 00 00 00       	jmp    251 <.altinstr_replacement+0x251>	24d: R_X86_64_PLT32	.text+0x1b723
0251      251:	e9 00 00 00 00       	jmp    256 <.altinstr_replacement+0x256>	252: R_X86_64_PLT32	.text+0x1b746
0256      256:	e9 00 00 00 00       	jmp    25b <.altinstr_replacement+0x25b>	257: R_X86_64_PLT32	.text+0x1b767
025b      25b:	e9 00 00 00 00       	jmp    260 <.altinstr_replacement+0x260>	25c: R_X86_64_PLT32	.text+0x1b812
0260      260:	e9 00 00 00 00       	jmp    265 <.altinstr_replacement+0x265>	261: R_X86_64_PLT32	.text+0x1be7a
0265      265:	e9 00 00 00 00       	jmp    26a <.altinstr_replacement+0x26a>	266: R_X86_64_PLT32	.text+0x1c189
026a      26a:	e9 00 00 00 00       	jmp    26f <.altinstr_replacement+0x26f>	26b: R_X86_64_PLT32	.text+0x1c258
026f      26f:	e9 00 00 00 00       	jmp    274 <.altinstr_replacement+0x274>	270: R_X86_64_PLT32	.text+0x1c495
0274      274:	e8 00 00 00 00       	call   279 <.altinstr_replacement+0x279>	275: R_X86_64_PLT32	clear_page_rep-0x4
0279      279:	e8 00 00 00 00       	call   27e <.altinstr_replacement+0x27e>	27a: R_X86_64_PLT32	clear_page_erms-0x4
027e      27e:	e9 00 00 00 00       	jmp    283 <.altinstr_replacement+0x283>	27f: R_X86_64_PLT32	.text+0x21a91
0283      283:	e9 00 00 00 00       	jmp    288 <.altinstr_replacement+0x288>	284: R_X86_64_PLT32	.text+0x21bfc
0288      288:	e9 00 00 00 00       	jmp    28d <.altinstr_replacement+0x28d>	289: R_X86_64_PLT32	.text+0x21d06
028d      28d:	e9 00 00 00 00       	jmp    292 <.altinstr_replacement+0x292>	28e: R_X86_64_PLT32	.text+0x22241
0292      292:	e9 00 00 00 00       	jmp    297 <.altinstr_replacement+0x297>	293: R_X86_64_PLT32	.text+0x222b1
0297      297:	e9 00 00 00 00       	jmp    29c <.altinstr_replacement+0x29c>	298: R_X86_64_PLT32	.text+0x222fa
029c      29c:	e9 00 00 00 00       	jmp    2a1 <.altinstr_replacement+0x2a1>	29d: R_X86_64_PLT32	.text+0x225f0
02a1      2a1:	e9 00 00 00 00       	jmp    2a6 <.altinstr_replacement+0x2a6>	2a2: R_X86_64_PLT32	.text+0x22619
02a6      2a6:	e9 00 00 00 00       	jmp    2ab <.altinstr_replacement+0x2ab>	2a7: R_X86_64_PLT32	.text+0x224d8
02ab      2ab:	e9 00 00 00 00       	jmp    2b0 <.altinstr_replacement+0x2b0>	2ac: R_X86_64_PLT32	.text+0x2253a
02b0      2b0:	e9 00 00 00 00       	jmp    2b5 <.altinstr_replacement+0x2b5>	2b1: R_X86_64_PLT32	.text+0x2271a
02b5      2b5:	e9 00 00 00 00       	jmp    2ba <.altinstr_replacement+0x2ba>	2b6: R_X86_64_PLT32	.text+0x227b5
02ba      2ba:	e9 00 00 00 00       	jmp    2bf <.altinstr_replacement+0x2bf>	2bb: R_X86_64_PLT32	.text+0x227d3
02bf      2bf:	e9 00 00 00 00       	jmp    2c4 <.altinstr_replacement+0x2c4>	2c0: R_X86_64_PLT32	.text+0x2282e
02c4      2c4:	e9 00 00 00 00       	jmp    2c9 <.altinstr_replacement+0x2c9>	2c5: R_X86_64_PLT32	.text+0x22856
02c9      2c9:	e9 00 00 00 00       	jmp    2ce <.altinstr_replacement+0x2ce>	2ca: R_X86_64_PLT32	.text+0x228ae
02ce      2ce:	e9 00 00 00 00       	jmp    2d3 <.altinstr_replacement+0x2d3>	2cf: R_X86_64_PLT32	.text+0x22905
02d3      2d3:	e9 00 00 00 00       	jmp    2d8 <.altinstr_replacement+0x2d8>	2d4: R_X86_64_PLT32	.text+0x2295c
02d8      2d8:	e9 00 00 00 00       	jmp    2dd <.altinstr_replacement+0x2dd>	2d9: R_X86_64_PLT32	.text+0x22c0d
02dd      2dd:	0f 01 cb             	stac
02e0      2e0:	0f ae e8             	lfence
02e3      2e3:	0f 01 ca             	clac
02e6      2e6:	0f 01 ca             	clac
02e9      2e9:	e9 00 00 00 00       	jmp    2ee <.altinstr_replacement+0x2ee>	2ea: R_X86_64_PLT32	.noinstr.text+0x303
02ee      2ee:	e9 00 00 00 00       	jmp    2f3 <.altinstr_replacement+0x2f3>	2ef: R_X86_64_PLT32	.noinstr.text+0xa12
02f3      2f3:	e9 00 00 00 00       	jmp    2f8 <.altinstr_replacement+0x2f8>	2f4: R_X86_64_PLT32	.noinstr.text+0xfc6
02f8      2f8:	e9 00 00 00 00       	jmp    2fd <.altinstr_replacement+0x2fd>	2f9: R_X86_64_PLT32	.noinstr.text+0x12f0
02fd      2fd:	e9 00 00 00 00       	jmp    302 <.altinstr_replacement+0x302>	2fe: R_X86_64_PLT32	.init.text+0xa739
0302      302:	e9 00 00 00 00       	jmp    307 <.altinstr_replacement+0x307>	303: R_X86_64_PLT32	.noinstr.text+0x189b
0307      307:	e9 00 00 00 00       	jmp    30c <.altinstr_replacement+0x30c>	308: R_X86_64_PLT32	.text+0x25ffd
030c      30c:	0f 01 cb             	stac
030f      30f:	e8 00 00 00 00       	call   314 <.altinstr_replacement+0x314>	310: R_X86_64_PLT32	rep_stos_alternative-0x4
0314      314:	0f 01 ca             	clac
0317      317:	0f 01 cb             	stac
031a      31a:	e8 00 00 00 00       	call   31f <.altinstr_replacement+0x31f>	31b: R_X86_64_PLT32	rep_stos_alternative-0x4
031f      31f:	0f 01 ca             	clac
0322      322:	e9 00 00 00 00       	jmp    327 <.altinstr_replacement+0x327>	323: R_X86_64_PLT32	.text+0x2688a
0327      327:	e9 00 00 00 00       	jmp    32c <.altinstr_replacement+0x32c>	328: R_X86_64_PLT32	.text+0x293bf
032c      32c:	e9 00 00 00 00       	jmp    331 <.altinstr_replacement+0x331>	32d: R_X86_64_PLT32	.text+0x29c11
0331      331:	e9 00 00 00 00       	jmp    336 <.altinstr_replacement+0x336>	332: R_X86_64_PLT32	.text+0x29e3b
0336      336:	f3 48 0f b8 c7       	popcnt %rdi,%rax
033b      33b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0340      340:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0345      345:	f3 48 0f b8 c7       	popcnt %rdi,%rax
034a      34a:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 351 <.altinstr_replacement+0x351>	34d: R_X86_64_PC32	.init.data+0x4eec4
0351      351:	e8 00 00 00 00       	call   356 <.altinstr_replacement+0x356>	352: R_X86_64_PLT32	__alt_reloc_selftest-0x4
0356      356:	e9 00 00 00 00       	jmp    35b <.altinstr_replacement+0x35b>	357: R_X86_64_PLT32	.text+0x2a954
035b      35b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0360      360:	e9 00 00 00 00       	jmp    365 <.altinstr_replacement+0x365>	361: R_X86_64_PLT32	.init.text+0xe538
0365      365:	0f ae e8             	lfence
0368      368:	0f 31                	rdtsc
036a      36a:	0f 01 f9             	rdtscp
036d      36d:	e9 00 00 00 00       	jmp    372 <.altinstr_replacement+0x372>	36e: R_X86_64_PLT32	.text+0x2d388
0372      372:	e9 00 00 00 00       	jmp    377 <.altinstr_replacement+0x377>	373: R_X86_64_PLT32	.text+0x2d4f1
0377      377:	e9 00 00 00 00       	jmp    37c <.altinstr_replacement+0x37c>	378: R_X86_64_PLT32	.text+0x2d7e7
037c      37c:	e9 00 00 00 00       	jmp    381 <.altinstr_replacement+0x381>	37d: R_X86_64_PLT32	.text+0x2d906
0381      381:	e9 00 00 00 00       	jmp    386 <.altinstr_replacement+0x386>	382: R_X86_64_PLT32	.text+0x2d936
0386      386:	e9 00 00 00 00       	jmp    38b <.altinstr_replacement+0x38b>	387: R_X86_64_PLT32	.text+0x2d911
038b      38b:	e9 00 00 00 00       	jmp    390 <.altinstr_replacement+0x390>	38c: R_X86_64_PLT32	.text+0x2d78f
0390      390:	e9 00 00 00 00       	jmp    395 <.altinstr_replacement+0x395>	391: R_X86_64_PLT32	.text+0x2ddbc
0395      395:	e9 00 00 00 00       	jmp    39a <.altinstr_replacement+0x39a>	396: R_X86_64_PLT32	.text+0x2dec6
039a      39a:	e9 00 00 00 00       	jmp    39f <.altinstr_replacement+0x39f>	39b: R_X86_64_PLT32	.text+0x2dfc1
039f      39f:	e9 00 00 00 00       	jmp    3a4 <.altinstr_replacement+0x3a4>	3a0: R_X86_64_PLT32	.text+0x2dff8
03a4      3a4:	e9 00 00 00 00       	jmp    3a9 <.altinstr_replacement+0x3a9>	3a5: R_X86_64_PLT32	.text+0x2e026
03a9      3a9:	e9 00 00 00 00       	jmp    3ae <.altinstr_replacement+0x3ae>	3aa: R_X86_64_PLT32	.text+0x2e054
03ae      3ae:	e9 00 00 00 00       	jmp    3b3 <.altinstr_replacement+0x3b3>	3af: R_X86_64_PLT32	.text+0x2dfcc
03b3      3b3:	e9 00 00 00 00       	jmp    3b8 <.altinstr_replacement+0x3b8>	3b4: R_X86_64_PLT32	.text+0x2dd47
03b8      3b8:	e9 00 00 00 00       	jmp    3bd <.altinstr_replacement+0x3bd>	3b9: R_X86_64_PLT32	.text+0x2e031
03bd      3bd:	e9 00 00 00 00       	jmp    3c2 <.altinstr_replacement+0x3c2>	3be: R_X86_64_PLT32	.text+0x2ddad
03c2      3c2:	e9 00 00 00 00       	jmp    3c7 <.altinstr_replacement+0x3c7>	3c3: R_X86_64_PLT32	.text+0x2e74a
03c7      3c7:	48 0f ae 37          	xsaveopt64 (%rdi)
03cb      3cb:	48 0f c7 27          	xsavec64 (%rdi)
03cf      3cf:	48 0f c7 2f          	xsaves64 (%rdi)
03d3      3d3:	e9 00 00 00 00       	jmp    3d8 <.altinstr_replacement+0x3d8>	3d4: R_X86_64_PLT32	.text+0x2e7e1
03d8      3d8:	e9 00 00 00 00       	jmp    3dd <.altinstr_replacement+0x3dd>	3d9: R_X86_64_PLT32	.text+0x2e7ec
03dd      3dd:	48 0f c7 1f          	xrstors64 (%rdi)
03e1      3e1:	e9 00 00 00 00       	jmp    3e6 <.altinstr_replacement+0x3e6>	3e2: R_X86_64_PLT32	.text+0x2e8c1
03e6      3e6:	e9 00 00 00 00       	jmp    3eb <.altinstr_replacement+0x3eb>	3e7: R_X86_64_PLT32	.text+0x2e8cc
03eb      3eb:	48 0f c7 1f          	xrstors64 (%rdi)
03ef      3ef:	e9 00 00 00 00       	jmp    3f4 <.altinstr_replacement+0x3f4>	3f0: R_X86_64_PLT32	.text+0x2ea7f
03f4      3f4:	48 0f ae 37          	xsaveopt64 (%rdi)
03f8      3f8:	48 0f c7 27          	xsavec64 (%rdi)
03fc      3fc:	48 0f c7 2f          	xsaves64 (%rdi)
0400      400:	e9 00 00 00 00       	jmp    405 <.altinstr_replacement+0x405>	401: R_X86_64_PLT32	.text+0x2eb72
0405      405:	48 0f ae 37          	xsaveopt64 (%rdi)
0409      409:	48 0f c7 27          	xsavec64 (%rdi)
040d      40d:	48 0f c7 2f          	xsaves64 (%rdi)
0411      411:	e9 00 00 00 00       	jmp    416 <.altinstr_replacement+0x416>	412: R_X86_64_PLT32	.text+0x2ebe4
0416      416:	e9 00 00 00 00       	jmp    41b <.altinstr_replacement+0x41b>	417: R_X86_64_PLT32	.text+0x2ee42
041b      41b:	e9 00 00 00 00       	jmp    420 <.altinstr_replacement+0x420>	41c: R_X86_64_PLT32	.text+0x2ee7e
0420      420:	48 0f ae 37          	xsaveopt64 (%rdi)
0424      424:	48 0f c7 27          	xsavec64 (%rdi)
0428      428:	48 0f c7 2f          	xsaves64 (%rdi)
042c      42c:	e9 00 00 00 00       	jmp    431 <.altinstr_replacement+0x431>	42d: R_X86_64_PLT32	.text+0x2eea6
0431      431:	e9 00 00 00 00       	jmp    436 <.altinstr_replacement+0x436>	432: R_X86_64_PLT32	.text+0x2eff9
0436      436:	e9 00 00 00 00       	jmp    43b <.altinstr_replacement+0x43b>	437: R_X86_64_PLT32	.text+0x2f004
043b      43b:	48 0f c7 1f          	xrstors64 (%rdi)
043f      43f:	48 0f c7 1f          	xrstors64 (%rdi)
0443      443:	e9 00 00 00 00       	jmp    448 <.altinstr_replacement+0x448>	444: R_X86_64_PLT32	.text+0x2f21b
0448      448:	48 0f c7 1f          	xrstors64 (%rdi)
044c      44c:	e9 00 00 00 00       	jmp    451 <.altinstr_replacement+0x451>	44d: R_X86_64_PLT32	.text+0x2f239
0451      451:	e9 00 00 00 00       	jmp    456 <.altinstr_replacement+0x456>	452: R_X86_64_PLT32	.text+0x2f3b1
0456      456:	e9 00 00 00 00       	jmp    45b <.altinstr_replacement+0x45b>	457: R_X86_64_PLT32	.noinstr.text+0x1dad
045b      45b:	e9 00 00 00 00       	jmp    460 <.altinstr_replacement+0x460>	45c: R_X86_64_PLT32	.text+0x2f589
0460      460:	0f 01 cb             	stac
0463      463:	e8 00 00 00 00       	call   468 <.altinstr_replacement+0x468>	464: R_X86_64_PLT32	rep_movs_alternative-0x4
0468      468:	0f 01 ca             	clac
046b      46b:	e9 00 00 00 00       	jmp    470 <.altinstr_replacement+0x470>	46c: R_X86_64_PLT32	.text+0x2f723
0470      470:	e9 00 00 00 00       	jmp    475 <.altinstr_replacement+0x475>	471: R_X86_64_PLT32	.text+0x2f7b5
0475      475:	e9 00 00 00 00       	jmp    47a <.altinstr_replacement+0x47a>	476: R_X86_64_PLT32	.text+0x2f8f3
047a      47a:	e9 00 00 00 00       	jmp    47f <.altinstr_replacement+0x47f>	47b: R_X86_64_PLT32	.text+0x2fbc3
047f      47f:	0f 01 cb             	stac
0482      482:	e8 00 00 00 00       	call   487 <.altinstr_replacement+0x487>	483: R_X86_64_PLT32	rep_stos_alternative-0x4
0487      487:	0f 01 ca             	clac
048a      48a:	e9 00 00 00 00       	jmp    48f <.altinstr_replacement+0x48f>	48b: R_X86_64_PLT32	.text+0x2faa6
048f      48f:	0f 01 cb             	stac
0492      492:	0f 01 ca             	clac
0495      495:	0f 01 cb             	stac
0498      498:	e8 00 00 00 00       	call   49d <.altinstr_replacement+0x49d>	499: R_X86_64_PLT32	rep_stos_alternative-0x4
049d      49d:	0f 01 ca             	clac
04a0      4a0:	0f 01 cb             	stac
04a3      4a3:	0f 01 ca             	clac
04a6      4a6:	0f 01 cb             	stac
04a9      4a9:	e8 00 00 00 00       	call   4ae <.altinstr_replacement+0x4ae>	4aa: R_X86_64_PLT32	rep_movs_alternative-0x4
04ae      4ae:	0f 01 ca             	clac
04b1      4b1:	e9 00 00 00 00       	jmp    4b6 <.altinstr_replacement+0x4b6>	4b2: R_X86_64_PLT32	.text+0x2fbd1
04b6      4b6:	e9 00 00 00 00       	jmp    4bb <.altinstr_replacement+0x4bb>	4b7: R_X86_64_PLT32	.text+0x2ff79
04bb      4bb:	e9 00 00 00 00       	jmp    4c0 <.altinstr_replacement+0x4c0>	4bc: R_X86_64_PLT32	.text+0x2ff95
04c0      4c0:	0f 01 cb             	stac
04c3      4c3:	e8 00 00 00 00       	call   4c8 <.altinstr_replacement+0x4c8>	4c4: R_X86_64_PLT32	rep_movs_alternative-0x4
04c8      4c8:	0f 01 ca             	clac
04cb      4cb:	e9 00 00 00 00       	jmp    4d0 <.altinstr_replacement+0x4d0>	4cc: R_X86_64_PLT32	.text+0x2fe28
04d0      4d0:	0f 01 cb             	stac
04d3      4d3:	0f 01 ca             	clac
04d6      4d6:	0f 01 cb             	stac
04d9      4d9:	0f 01 ca             	clac
04dc      4dc:	48 0f c7 1f          	xrstors64 (%rdi)
04e0      4e0:	0f 01 cb             	stac
04e3      4e3:	0f 01 ca             	clac
04e6      4e6:	48 0f c7 1f          	xrstors64 (%rdi)
04ea      4ea:	e9 00 00 00 00       	jmp    4ef <.altinstr_replacement+0x4ef>	4eb: R_X86_64_PLT32	.text+0x30041
04ef      4ef:	e9 00 00 00 00       	jmp    4f4 <.altinstr_replacement+0x4f4>	4f0: R_X86_64_PLT32	.init.text+0xec7f
04f4      4f4:	e9 00 00 00 00       	jmp    4f9 <.altinstr_replacement+0x4f9>	4f5: R_X86_64_PLT32	.text+0x3021e
04f9      4f9:	e9 00 00 00 00       	jmp    4fe <.altinstr_replacement+0x4fe>	4fa: R_X86_64_PLT32	.text+0x30234
04fe      4fe:	e9 00 00 00 00       	jmp    503 <.altinstr_replacement+0x503>	4ff: R_X86_64_PLT32	.init.text+0xef38
0503      503:	e9 00 00 00 00       	jmp    508 <.altinstr_replacement+0x508>	504: R_X86_64_PLT32	.init.text+0xef5b
0508      508:	e9 00 00 00 00       	jmp    50d <.altinstr_replacement+0x50d>	509: R_X86_64_PLT32	.init.text+0xef7d
050d      50d:	e9 00 00 00 00       	jmp    512 <.altinstr_replacement+0x512>	50e: R_X86_64_PLT32	.init.text+0xef9e
0512      512:	e9 00 00 00 00       	jmp    517 <.altinstr_replacement+0x517>	513: R_X86_64_PLT32	.init.text+0xf19a
0517      517:	e9 00 00 00 00       	jmp    51c <.altinstr_replacement+0x51c>	518: R_X86_64_PLT32	.init.text+0xf219
051c      51c:	e9 00 00 00 00       	jmp    521 <.altinstr_replacement+0x521>	51d: R_X86_64_PLT32	.text+0x30313
0521      521:	e9 00 00 00 00       	jmp    526 <.altinstr_replacement+0x526>	522: R_X86_64_PLT32	.text+0x30329
0526      526:	e9 00 00 00 00       	jmp    52b <.altinstr_replacement+0x52b>	527: R_X86_64_PLT32	.text+0x3033f
052b      52b:	e9 00 00 00 00       	jmp    530 <.altinstr_replacement+0x530>	52c: R_X86_64_PLT32	.text+0x30514
0530      530:	e9 00 00 00 00       	jmp    535 <.altinstr_replacement+0x535>	531: R_X86_64_PLT32	.text+0x30564
0535      535:	e9 00 00 00 00       	jmp    53a <.altinstr_replacement+0x53a>	536: R_X86_64_PLT32	.text+0x30636
053a      53a:	e9 00 00 00 00       	jmp    53f <.altinstr_replacement+0x53f>	53b: R_X86_64_PLT32	.text+0x30655
053f      53f:	e9 00 00 00 00       	jmp    544 <.altinstr_replacement+0x544>	540: R_X86_64_PLT32	.text+0x30689
0544      544:	e9 00 00 00 00       	jmp    549 <.altinstr_replacement+0x549>	545: R_X86_64_PLT32	.text+0x306a8
0549      549:	e9 00 00 00 00       	jmp    54e <.altinstr_replacement+0x54e>	54a: R_X86_64_PLT32	.text+0x31023
054e      54e:	e9 00 00 00 00       	jmp    553 <.altinstr_replacement+0x553>	54f: R_X86_64_PLT32	.text+0x31039
0553      553:	e9 00 00 00 00       	jmp    558 <.altinstr_replacement+0x558>	554: R_X86_64_PLT32	.text+0x310d3
0558      558:	e9 00 00 00 00       	jmp    55d <.altinstr_replacement+0x55d>	559: R_X86_64_PLT32	.text+0x310e9
055d      55d:	e9 00 00 00 00       	jmp    562 <.altinstr_replacement+0x562>	55e: R_X86_64_PLT32	.text+0x31485
0562      562:	e9 00 00 00 00       	jmp    567 <.altinstr_replacement+0x567>	563: R_X86_64_PLT32	.text+0x314a5
0567      567:	e9 00 00 00 00       	jmp    56c <.altinstr_replacement+0x56c>	568: R_X86_64_PLT32	.text+0x318b9
056c      56c:	e9 00 00 00 00       	jmp    571 <.altinstr_replacement+0x571>	56d: R_X86_64_PLT32	.text+0x319fa
0571      571:	e9 00 00 00 00       	jmp    576 <.altinstr_replacement+0x576>	572: R_X86_64_PLT32	.text+0x31aa3
0576      576:	e9 00 00 00 00       	jmp    57b <.altinstr_replacement+0x57b>	577: R_X86_64_PLT32	.init.text+0xf45f
057b      57b:	e9 00 00 00 00       	jmp    580 <.altinstr_replacement+0x580>	57c: R_X86_64_PLT32	.text+0x31beb
0580      580:	e9 00 00 00 00       	jmp    585 <.altinstr_replacement+0x585>	581: R_X86_64_PLT32	.init.text+0xf633
0585      585:	e9 00 00 00 00       	jmp    58a <.altinstr_replacement+0x58a>	586: R_X86_64_PLT32	.init.text+0xf656
058a      58a:	e9 00 00 00 00       	jmp    58f <.altinstr_replacement+0x58f>	58b: R_X86_64_PLT32	.text+0x31ce9
058f      58f:	e9 00 00 00 00       	jmp    594 <.altinstr_replacement+0x594>	590: R_X86_64_PLT32	.init.text+0xfdb0
0594      594:	e9 00 00 00 00       	jmp    599 <.altinstr_replacement+0x599>	595: R_X86_64_PLT32	.text+0x349eb
0599      599:	e9 00 00 00 00       	jmp    59e <.altinstr_replacement+0x59e>	59a: R_X86_64_PLT32	.text+0x34a03
059e      59e:	e9 00 00 00 00       	jmp    5a3 <.altinstr_replacement+0x5a3>	59f: R_X86_64_PLT32	.text+0x34a19
05a3      5a3:	e9 00 00 00 00       	jmp    5a8 <.altinstr_replacement+0x5a8>	5a4: R_X86_64_PLT32	.text+0x34a2f
05a8      5a8:	e9 00 00 00 00       	jmp    5ad <.altinstr_replacement+0x5ad>	5a9: R_X86_64_PLT32	.text+0x34a9d
05ad      5ad:	e9 00 00 00 00       	jmp    5b2 <.altinstr_replacement+0x5b2>	5ae: R_X86_64_PLT32	.text+0x34ab3
05b2      5b2:	e9 00 00 00 00       	jmp    5b7 <.altinstr_replacement+0x5b7>	5b3: R_X86_64_PLT32	.text+0x34c13
05b7      5b7:	e9 00 00 00 00       	jmp    5bc <.altinstr_replacement+0x5bc>	5b8: R_X86_64_PLT32	.text+0x34c2f
05bc      5bc:	e9 00 00 00 00       	jmp    5c1 <.altinstr_replacement+0x5c1>	5bd: R_X86_64_PLT32	.text+0x35ae2
05c1      5c1:	e9 00 00 00 00       	jmp    5c6 <.altinstr_replacement+0x5c6>	5c2: R_X86_64_PLT32	.text+0x35b2c
05c6      5c6:	e9 00 00 00 00       	jmp    5cb <.altinstr_replacement+0x5cb>	5c7: R_X86_64_PLT32	.text+0x35b54
05cb      5cb:	e9 00 00 00 00       	jmp    5d0 <.altinstr_replacement+0x5d0>	5cc: R_X86_64_PLT32	.init.text+0x10285
05d0      5d0:	e9 00 00 00 00       	jmp    5d5 <.altinstr_replacement+0x5d5>	5d1: R_X86_64_PLT32	.text+0x36707
05d5      5d5:	e9 00 00 00 00       	jmp    5da <.altinstr_replacement+0x5da>	5d6: R_X86_64_PLT32	.text+0x3697b
05da      5da:	e9 00 00 00 00       	jmp    5df <.altinstr_replacement+0x5df>	5db: R_X86_64_PLT32	.text+0x3697b
05df      5df:	e9 00 00 00 00       	jmp    5e4 <.altinstr_replacement+0x5e4>	5e0: R_X86_64_PLT32	.text+0x3697b
05e4      5e4:	e9 00 00 00 00       	jmp    5e9 <.altinstr_replacement+0x5e9>	5e5: R_X86_64_PLT32	.text+0x369f2
05e9      5e9:	e9 00 00 00 00       	jmp    5ee <.altinstr_replacement+0x5ee>	5ea: R_X86_64_PLT32	.text+0x379d9
05ee      5ee:	e9 00 00 00 00       	jmp    5f3 <.altinstr_replacement+0x5f3>	5ef: R_X86_64_PLT32	.init.text+0x10970
05f3      5f3:	e9 00 00 00 00       	jmp    5f8 <.altinstr_replacement+0x5f8>	5f4: R_X86_64_PLT32	.text+0x37a68
05f8      5f8:	e9 00 00 00 00       	jmp    5fd <.altinstr_replacement+0x5fd>	5f9: R_X86_64_PLT32	.text+0x37a78
05fd      5fd:	e9 00 00 00 00       	jmp    602 <.altinstr_replacement+0x602>	5fe: R_X86_64_PLT32	.text+0x37ab1
0602      602:	0f 30                	wrmsr
0604      604:	0f 30                	wrmsr
0606      606:	e9 00 00 00 00       	jmp    60b <.altinstr_replacement+0x60b>	607: R_X86_64_PLT32	.init.text+0x12662
060b      60b:	e9 00 00 00 00       	jmp    610 <.altinstr_replacement+0x610>	60c: R_X86_64_PLT32	.init.text+0x12683
0610      610:	e9 00 00 00 00       	jmp    615 <.altinstr_replacement+0x615>	611: R_X86_64_PLT32	.text+0x3922e
0615      615:	e9 00 00 00 00       	jmp    61a <.altinstr_replacement+0x61a>	616: R_X86_64_PLT32	.text+0x39336
061a      61a:	e9 00 00 00 00       	jmp    61f <.altinstr_replacement+0x61f>	61b: R_X86_64_PLT32	.init.text+0x1281c
061f      61f:	e9 00 00 00 00       	jmp    624 <.altinstr_replacement+0x624>	620: R_X86_64_PLT32	.text+0x393a7
0624      624:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0629      629:	e9 00 00 00 00       	jmp    62e <.altinstr_replacement+0x62e>	62a: R_X86_64_PLT32	.text+0x3b050
062e      62e:	e9 00 00 00 00       	jmp    633 <.altinstr_replacement+0x633>	62f: R_X86_64_PLT32	.text+0x3c59e
0633      633:	e9 00 00 00 00       	jmp    638 <.altinstr_replacement+0x638>	634: R_X86_64_PLT32	.text+0x3c5b4
0638      638:	e9 00 00 00 00       	jmp    63d <.altinstr_replacement+0x63d>	639: R_X86_64_PLT32	.text+0x3c64c
063d      63d:	e9 00 00 00 00       	jmp    642 <.altinstr_replacement+0x642>	63e: R_X86_64_PLT32	.text+0x3c7d8
0642      642:	e9 00 00 00 00       	jmp    647 <.altinstr_replacement+0x647>	643: R_X86_64_PLT32	.text+0x3c7f4
0647      647:	e9 00 00 00 00       	jmp    64c <.altinstr_replacement+0x64c>	648: R_X86_64_PLT32	.text+0x3c810
064c      64c:	e9 00 00 00 00       	jmp    651 <.altinstr_replacement+0x651>	64d: R_X86_64_PLT32	.text+0x3cca3
0651      651:	e9 00 00 00 00       	jmp    656 <.altinstr_replacement+0x656>	652: R_X86_64_PLT32	.text+0x3cd1c
0656      656:	e9 00 00 00 00       	jmp    65b <.altinstr_replacement+0x65b>	657: R_X86_64_PLT32	.text+0x3ec6d
065b      65b:	e9 00 00 00 00       	jmp    660 <.altinstr_replacement+0x660>	65c: R_X86_64_PLT32	.text+0x3eca1
0660      660:	e9 00 00 00 00       	jmp    665 <.altinstr_replacement+0x665>	661: R_X86_64_PLT32	.text+0x3ecc7
0665      665:	e9 00 00 00 00       	jmp    66a <.altinstr_replacement+0x66a>	666: R_X86_64_PLT32	.text+0x3f1cf
066a      66a:	e9 00 00 00 00       	jmp    66f <.altinstr_replacement+0x66f>	66b: R_X86_64_PLT32	.text+0x3f1f2
066f      66f:	e9 00 00 00 00       	jmp    674 <.altinstr_replacement+0x674>	670: R_X86_64_PLT32	.text+0x3f252
0674      674:	e9 00 00 00 00       	jmp    679 <.altinstr_replacement+0x679>	675: R_X86_64_PLT32	.noinstr.text+0x1fc3
0679      679:	e9 00 00 00 00       	jmp    67e <.altinstr_replacement+0x67e>	67a: R_X86_64_PLT32	.noinstr.text+0x1fd6
067e      67e:	e9 00 00 00 00       	jmp    683 <.altinstr_replacement+0x683>	67f: R_X86_64_PLT32	.noinstr.text+0x2260
0683      683:	e9 00 00 00 00       	jmp    688 <.altinstr_replacement+0x688>	684: R_X86_64_PLT32	.noinstr.text+0x244f
0688      688:	e9 00 00 00 00       	jmp    68d <.altinstr_replacement+0x68d>	689: R_X86_64_PLT32	.noinstr.text+0x25d3
068d      68d:	e9 00 00 00 00       	jmp    692 <.altinstr_replacement+0x692>	68e: R_X86_64_PLT32	.noinstr.text+0x2ad1
0692      692:	e9 00 00 00 00       	jmp    697 <.altinstr_replacement+0x697>	693: R_X86_64_PLT32	.noinstr.text+0x2b7f
0697      697:	e9 00 00 00 00       	jmp    69c <.altinstr_replacement+0x69c>	698: R_X86_64_PLT32	.text+0x3fb3b
069c      69c:	e9 00 00 00 00       	jmp    6a1 <.altinstr_replacement+0x6a1>	69d: R_X86_64_PLT32	.text+0x3fb5b
06a1      6a1:	e9 00 00 00 00       	jmp    6a6 <.altinstr_replacement+0x6a6>	6a2: R_X86_64_PLT32	.text+0x3fc18
06a6      6a6:	e9 00 00 00 00       	jmp    6ab <.altinstr_replacement+0x6ab>	6a7: R_X86_64_PLT32	.text+0x40cf8
06ab      6ab:	e9 00 00 00 00       	jmp    6b0 <.altinstr_replacement+0x6b0>	6ac: R_X86_64_PLT32	.text+0x41062
06b0      6b0:	e9 00 00 00 00       	jmp    6b5 <.altinstr_replacement+0x6b5>	6b1: R_X86_64_PLT32	.text+0x413f8
06b5      6b5:	e9 00 00 00 00       	jmp    6ba <.altinstr_replacement+0x6ba>	6b6: R_X86_64_PLT32	.text+0x41418
06ba      6ba:	e9 00 00 00 00       	jmp    6bf <.altinstr_replacement+0x6bf>	6bb: R_X86_64_PLT32	.text+0x41b48
06bf      6bf:	e9 00 00 00 00       	jmp    6c4 <.altinstr_replacement+0x6c4>	6c0: R_X86_64_PLT32	.text+0x41c5c
06c4      6c4:	e9 00 00 00 00       	jmp    6c9 <.altinstr_replacement+0x6c9>	6c5: R_X86_64_PLT32	.text+0x41c71
06c9      6c9:	e9 00 00 00 00       	jmp    6ce <.altinstr_replacement+0x6ce>	6ca: R_X86_64_PLT32	.text+0x41d98
06ce      6ce:	e9 00 00 00 00       	jmp    6d3 <.altinstr_replacement+0x6d3>	6cf: R_X86_64_PLT32	.text+0x42d15
06d3      6d3:	e9 00 00 00 00       	jmp    6d8 <.altinstr_replacement+0x6d8>	6d4: R_X86_64_PLT32	.text+0x435bb
06d8      6d8:	e9 00 00 00 00       	jmp    6dd <.altinstr_replacement+0x6dd>	6d9: R_X86_64_PLT32	.text+0x43aa7
06dd      6dd:	e9 00 00 00 00       	jmp    6e2 <.altinstr_replacement+0x6e2>	6de: R_X86_64_PLT32	.text+0x43acd
06e2      6e2:	e9 00 00 00 00       	jmp    6e7 <.altinstr_replacement+0x6e7>	6e3: R_X86_64_PLT32	.text+0x446ee
06e7      6e7:	e9 00 00 00 00       	jmp    6ec <.altinstr_replacement+0x6ec>	6e8: R_X86_64_PLT32	.text+0x44714
06ec      6ec:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06f1      6f1:	0f ae e8             	lfence
06f4      6f4:	0f 31                	rdtsc
06f6      6f6:	0f 01 f9             	rdtscp
06f9      6f9:	0f ae e8             	lfence
06fc      6fc:	0f 31                	rdtsc
06fe      6fe:	0f 01 f9             	rdtscp
0701      701:	0f ae e8             	lfence
0704      704:	0f 31                	rdtsc
0706      706:	0f 01 f9             	rdtscp
0709      709:	e9 00 00 00 00       	jmp    70e <.altinstr_replacement+0x70e>	70a: R_X86_64_PLT32	.text+0x553de
070e      70e:	e9 00 00 00 00       	jmp    713 <.altinstr_replacement+0x713>	70f: R_X86_64_PLT32	.cpuidle.text+0x14e
0713      713:	e9 00 00 00 00       	jmp    718 <.altinstr_replacement+0x718>	714: R_X86_64_PLT32	.cpuidle.text+0xeb
0718      718:	f3 48 0f b8 c7       	popcnt %rdi,%rax
071d      71d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0722      722:	e9 00 00 00 00       	jmp    727 <.altinstr_replacement+0x727>	723: R_X86_64_PLT32	.init.text+0x191f4
0727      727:	f3 48 0f b8 c7       	popcnt %rdi,%rax
072c      72c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0731      731:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0736      736:	e9 00 00 00 00       	jmp    73b <.altinstr_replacement+0x73b>	737: R_X86_64_PLT32	.init.text+0x194ff
073b      73b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0740      740:	0f ae e8             	lfence
0743      743:	0f 31                	rdtsc
0745      745:	0f 01 f9             	rdtscp
0748      748:	0f ae e8             	lfence
074b      74b:	0f 31                	rdtsc
074d      74d:	0f 01 f9             	rdtscp
0750      750:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0755      755:	f3 48 0f b8 c7       	popcnt %rdi,%rax
075a      75a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
075f      75f:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
0766      766:	87 1c 25 10 d3 5f ff 	xchg   %ebx,0xffffffffff5fd310
076d      76d:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
0774      774:	87 1c 25 10 d3 5f ff 	xchg   %ebx,0xffffffffff5fd310
077b      77b:	87 34 25 00 d3 5f ff 	xchg   %esi,0xffffffffff5fd300
0782      782:	44 87 2c 25 10 d3 5f ff 	xchg   %r13d,0xffffffffff5fd310
078a      78a:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
0791      791:	44 87 24 25 10 d3 5f ff 	xchg   %r12d,0xffffffffff5fd310
0799      799:	87 04 25 00 d3 5f ff 	xchg   %eax,0xffffffffff5fd300
07a0      7a0:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
07a7      7a7:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
07ae      7ae:	87 3c 25 00 d3 5f ff 	xchg   %edi,0xffffffffff5fd300
07b5      7b5:	87 b0 00 d0 5f ff    	xchg   %esi,-0xa03000(%rax)
07bb      7bb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07c0      7c0:	0f ae e8             	lfence
07c3      7c3:	0f 31                	rdtsc
07c5      7c5:	0f 01 f9             	rdtscp
07c8      7c8:	e8 00 00 00 00       	call   7cd <.altinstr_replacement+0x7cd>	7c9: R_X86_64_PLT32	clear_page_rep-0x4
07cd      7cd:	e8 00 00 00 00       	call   7d2 <.altinstr_replacement+0x7d2>	7ce: R_X86_64_PLT32	clear_page_erms-0x4
07d2      7d2:	e8 00 00 00 00       	call   7d7 <.altinstr_replacement+0x7d7>	7d3: R_X86_64_PLT32	clear_page_rep-0x4
07d7      7d7:	e8 00 00 00 00       	call   7dc <.altinstr_replacement+0x7dc>	7d8: R_X86_64_PLT32	clear_page_erms-0x4
07dc      7dc:	e9 00 00 00 00       	jmp    7e1 <.altinstr_replacement+0x7e1>	7dd: R_X86_64_PLT32	.init.text+0x1d4cc
07e1      7e1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07e6      7e6:	f3 0f b8 c7          	popcnt %edi,%eax
07ea      7ea:	e8 00 00 00 00       	call   7ef <.altinstr_replacement+0x7ef>	7eb: R_X86_64_PLT32	clear_page_rep-0x4
07ef      7ef:	e8 00 00 00 00       	call   7f4 <.altinstr_replacement+0x7f4>	7f0: R_X86_64_PLT32	clear_page_erms-0x4
07f4      7f4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
07f9      7f9:	0f 0d 48 70          	prefetchw 0x70(%rax)
07fd      7fd:	e9 00 00 00 00       	jmp    802 <.altinstr_replacement+0x802>	7fe: R_X86_64_PLT32	.noinstr.text+0x35dd
0802      802:	e9 00 00 00 00       	jmp    807 <.altinstr_replacement+0x807>	803: R_X86_64_PLT32	.noinstr.text+0x374c
0807      807:	e9 00 00 00 00       	jmp    80c <.altinstr_replacement+0x80c>	808: R_X86_64_PLT32	.noinstr.text+0x39f7
080c      80c:	e9 00 00 00 00       	jmp    811 <.altinstr_replacement+0x811>	80d: R_X86_64_PLT32	.text+0x68eb0
0811      811:	e9 00 00 00 00       	jmp    816 <.altinstr_replacement+0x816>	812: R_X86_64_PLT32	.text+0x68ecc
0816      816:	e9 00 00 00 00       	jmp    81b <.altinstr_replacement+0x81b>	817: R_X86_64_PLT32	.text+0x6a323
081b      81b:	0f 30                	wrmsr
081d      81d:	e9 00 00 00 00       	jmp    822 <.altinstr_replacement+0x822>	81e: R_X86_64_PLT32	.text+0x6bbe5
0822      822:	e9 00 00 00 00       	jmp    827 <.altinstr_replacement+0x827>	823: R_X86_64_PLT32	.text+0x6bd4f
0827      827:	e9 00 00 00 00       	jmp    82c <.altinstr_replacement+0x82c>	828: R_X86_64_PLT32	.text+0x6bc66
082c      82c:	e9 00 00 00 00       	jmp    831 <.altinstr_replacement+0x831>	82d: R_X86_64_PLT32	.text+0x6bc94
0831      831:	0f 30                	wrmsr
0833      833:	e9 00 00 00 00       	jmp    838 <.altinstr_replacement+0x838>	834: R_X86_64_PLT32	.text+0x6beee
0838      838:	e9 00 00 00 00       	jmp    83d <.altinstr_replacement+0x83d>	839: R_X86_64_PLT32	.text+0x6c1f6
083d      83d:	e9 00 00 00 00       	jmp    842 <.altinstr_replacement+0x842>	83e: R_X86_64_PLT32	.text+0x6c41a
0842      842:	e9 00 00 00 00       	jmp    847 <.altinstr_replacement+0x847>	843: R_X86_64_PLT32	.text+0x6c42f
0847      847:	e9 00 00 00 00       	jmp    84c <.altinstr_replacement+0x84c>	848: R_X86_64_PLT32	.text+0x6c4ad
084c      84c:	e9 00 00 00 00       	jmp    851 <.altinstr_replacement+0x851>	84d: R_X86_64_PLT32	.text+0x6c500
0851      851:	e9 00 00 00 00       	jmp    856 <.altinstr_replacement+0x856>	852: R_X86_64_PLT32	.text+0x6c515
0856      856:	e9 00 00 00 00       	jmp    85b <.altinstr_replacement+0x85b>	857: R_X86_64_PLT32	.text+0x6c570
085b      85b:	e9 00 00 00 00       	jmp    860 <.altinstr_replacement+0x860>	85c: R_X86_64_PLT32	.text+0x6c629
0860      860:	e9 00 00 00 00       	jmp    865 <.altinstr_replacement+0x865>	861: R_X86_64_PLT32	.text+0x6c66a
0865      865:	66 0f ae 3b          	clflushopt (%rbx)
0869      869:	66 0f ae 3b          	clflushopt (%rbx)
086d      86d:	e9 00 00 00 00       	jmp    872 <.altinstr_replacement+0x872>	86e: R_X86_64_PLT32	.text+0x6cd52
0872      872:	e9 00 00 00 00       	jmp    877 <.altinstr_replacement+0x877>	873: R_X86_64_PLT32	.text+0x6cd97
0877      877:	e9 00 00 00 00       	jmp    87c <.altinstr_replacement+0x87c>	878: R_X86_64_PLT32	.text+0x6d869
087c      87c:	66 0f ae 3b          	clflushopt (%rbx)
0880      880:	e9 00 00 00 00       	jmp    885 <.altinstr_replacement+0x885>	881: R_X86_64_PLT32	.init.text+0x219f1
0885      885:	e9 00 00 00 00       	jmp    88a <.altinstr_replacement+0x88a>	886: R_X86_64_PLT32	.text+0x74583
088a      88a:	e9 00 00 00 00       	jmp    88f <.altinstr_replacement+0x88f>	88b: R_X86_64_PLT32	.text+0x74593
088f      88f:	e9 00 00 00 00       	jmp    894 <.altinstr_replacement+0x894>	890: R_X86_64_PLT32	.text+0x7475e
0894      894:	e9 00 00 00 00       	jmp    899 <.altinstr_replacement+0x899>	895: R_X86_64_PLT32	.text+0x74777
0899      899:	e9 00 00 00 00       	jmp    89e <.altinstr_replacement+0x89e>	89a: R_X86_64_PLT32	.text+0x74795
089e      89e:	e9 00 00 00 00       	jmp    8a3 <.altinstr_replacement+0x8a3>	89f: R_X86_64_PLT32	.init.text+0x21c5e
08a3      8a3:	e9 00 00 00 00       	jmp    8a8 <.altinstr_replacement+0x8a8>	8a4: R_X86_64_PLT32	.text+0xa63b6
08a8      8a8:	e9 00 00 00 00       	jmp    8ad <.altinstr_replacement+0x8ad>	8a9: R_X86_64_PLT32	.text+0xa6d10
08ad      8ad:	e9 00 00 00 00       	jmp    8b2 <.altinstr_replacement+0x8b2>	8ae: R_X86_64_PLT32	.text+0xa9356
08b2      8b2:	0f 01 cb             	stac
08b5      8b5:	0f ae e8             	lfence
08b8      8b8:	0f 01 ca             	clac
08bb      8bb:	0f 01 ca             	clac
08be      8be:	0f 01 cb             	stac
08c1      8c1:	e8 00 00 00 00       	call   8c6 <.altinstr_replacement+0x8c6>	8c2: R_X86_64_PLT32	rep_stos_alternative-0x4
08c6      8c6:	0f 01 ca             	clac
08c9      8c9:	0f 01 cb             	stac
08cc      8cc:	e8 00 00 00 00       	call   8d1 <.altinstr_replacement+0x8d1>	8cd: R_X86_64_PLT32	rep_stos_alternative-0x4
08d1      8d1:	0f 01 ca             	clac
08d4      8d4:	0f 01 cb             	stac
08d7      8d7:	e8 00 00 00 00       	call   8dc <.altinstr_replacement+0x8dc>	8d8: R_X86_64_PLT32	rep_stos_alternative-0x4
08dc      8dc:	0f 01 ca             	clac
08df      8df:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08e4      8e4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08e9      8e9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08ee      8ee:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08f3      8f3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08f8      8f8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08fd      8fd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0902      902:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0907      907:	e9 00 00 00 00       	jmp    90c <.altinstr_replacement+0x90c>	908: R_X86_64_PLT32	.text+0xe4e07
090c      90c:	e9 00 00 00 00       	jmp    911 <.altinstr_replacement+0x911>	90d: R_X86_64_PLT32	.text+0xe4ec7
0911      911:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0916      916:	f3 48 0f b8 c7       	popcnt %rdi,%rax
091b      91b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0920      920:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0925      925:	f3 48 0f b8 c7       	popcnt %rdi,%rax
092a      92a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
092f      92f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0934      934:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0939      939:	f3 48 0f b8 c7       	popcnt %rdi,%rax
093e      93e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0943      943:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0948      948:	f3 48 0f b8 c7       	popcnt %rdi,%rax
094d      94d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0952      952:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0957      957:	f3 48 0f b8 c7       	popcnt %rdi,%rax
095c      95c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0961      961:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0966      966:	f3 48 0f b8 c7       	popcnt %rdi,%rax
096b      96b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0970      970:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0975      975:	f3 48 0f b8 c7       	popcnt %rdi,%rax
097a      97a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
097f      97f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0984      984:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0989      989:	f3 48 0f b8 c7       	popcnt %rdi,%rax
098e      98e:	e9 00 00 00 00       	jmp    993 <.altinstr_replacement+0x993>	98f: R_X86_64_PLT32	.text+0x106627
0993      993:	e9 00 00 00 00       	jmp    998 <.altinstr_replacement+0x998>	994: R_X86_64_PLT32	.text+0x106639
0998      998:	0f 0d 0e             	prefetchw (%rsi)
099b      99b:	e8 00 00 00 00       	call   9a0 <.altinstr_replacement+0x9a0>	99c: R_X86_64_PLT32	clear_page_rep-0x4
09a0      9a0:	e8 00 00 00 00       	call   9a5 <.altinstr_replacement+0x9a5>	9a1: R_X86_64_PLT32	clear_page_erms-0x4
09a5      9a5:	e8 00 00 00 00       	call   9aa <.altinstr_replacement+0x9aa>	9a6: R_X86_64_PLT32	clear_page_rep-0x4
09aa      9aa:	e8 00 00 00 00       	call   9af <.altinstr_replacement+0x9af>	9ab: R_X86_64_PLT32	clear_page_erms-0x4
09af      9af:	e8 00 00 00 00       	call   9b4 <.altinstr_replacement+0x9b4>	9b0: R_X86_64_PLT32	clear_page_rep-0x4
09b4      9b4:	e8 00 00 00 00       	call   9b9 <.altinstr_replacement+0x9b9>	9b5: R_X86_64_PLT32	clear_page_erms-0x4
09b9      9b9:	e8 00 00 00 00       	call   9be <.altinstr_replacement+0x9be>	9ba: R_X86_64_PLT32	clear_page_rep-0x4
09be      9be:	e8 00 00 00 00       	call   9c3 <.altinstr_replacement+0x9c3>	9bf: R_X86_64_PLT32	clear_page_erms-0x4
09c3      9c3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09c8      9c8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09cd      9cd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09d2      9d2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09d7      9d7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09dc      9dc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09e1      9e1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09e6      9e6:	0f 01 cb             	stac
09e9      9e9:	0f ae e8             	lfence
09ec      9ec:	0f 01 ca             	clac
09ef      9ef:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09f4      9f4:	0f 01 cb             	stac
09f7      9f7:	0f ae e8             	lfence
09fa      9fa:	0f 01 ca             	clac
09fd      9fd:	0f 01 cb             	stac
0a00      a00:	0f ae e8             	lfence
0a03      a03:	0f 01 ca             	clac
0a06      a06:	0f 01 ca             	clac
0a09      a09:	0f 01 ca             	clac
0a0c      a0c:	e8 00 00 00 00       	call   a11 <.altinstr_replacement+0xa11>	a0d: R_X86_64_PLT32	clear_page_rep-0x4
0a11      a11:	e8 00 00 00 00       	call   a16 <.altinstr_replacement+0xa16>	a12: R_X86_64_PLT32	clear_page_erms-0x4
0a16      a16:	e8 00 00 00 00       	call   a1b <.altinstr_replacement+0xa1b>	a17: R_X86_64_PLT32	clear_page_rep-0x4
0a1b      a1b:	e8 00 00 00 00       	call   a20 <.altinstr_replacement+0xa20>	a1c: R_X86_64_PLT32	clear_page_erms-0x4
0a20      a20:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a25      a25:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a2a      a2a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a2f      a2f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a34      a34:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a39      a39:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a3e      a3e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a43      a43:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a48      a48:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a4d      a4d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a52      a52:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a57      a57:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a5c      a5c:	0f 01 cb             	stac
0a5f      a5f:	0f ae e8             	lfence
0a62      a62:	0f 01 ca             	clac
0a65      a65:	0f 01 ca             	clac
0a68      a68:	0f 01 ca             	clac
0a6b      a6b:	0f 01 ca             	clac
0a6e      a6e:	0f 01 ca             	clac
0a71      a71:	0f 01 cb             	stac
0a74      a74:	e8 00 00 00 00       	call   a79 <.altinstr_replacement+0xa79>	a75: R_X86_64_PLT32	rep_movs_alternative-0x4
0a79      a79:	0f 01 ca             	clac
0a7c      a7c:	0f 01 cb             	stac
0a7f      a7f:	e8 00 00 00 00       	call   a84 <.altinstr_replacement+0xa84>	a80: R_X86_64_PLT32	rep_movs_alternative-0x4
0a84      a84:	0f 01 ca             	clac
0a87      a87:	0f 0d 4b f8          	prefetchw -0x8(%rbx)
0a8b      a8b:	e8 00 00 00 00       	call   a90 <.altinstr_replacement+0xa90>	a8c: R_X86_64_PLT32	clear_page_rep-0x4
0a90      a90:	e8 00 00 00 00       	call   a95 <.altinstr_replacement+0xa95>	a91: R_X86_64_PLT32	clear_page_erms-0x4
0a95      a95:	e8 00 00 00 00       	call   a9a <.altinstr_replacement+0xa9a>	a96: R_X86_64_PLT32	clear_page_rep-0x4
0a9a      a9a:	e8 00 00 00 00       	call   a9f <.altinstr_replacement+0xa9f>	a9b: R_X86_64_PLT32	clear_page_erms-0x4
0a9f      a9f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0aa4      aa4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0aa9      aa9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0aae      aae:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ab3      ab3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ab8      ab8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0abd      abd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ac2      ac2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ac7      ac7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0acc      acc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ad1      ad1:	e9 00 00 00 00       	jmp    ad6 <.altinstr_replacement+0xad6>	ad2: R_X86_64_PLT32	.text+0x206695
0ad6      ad6:	e9 00 00 00 00       	jmp    adb <.altinstr_replacement+0xadb>	ad7: R_X86_64_PLT32	.text+0x2071e5
0adb      adb:	0f 01 cb             	stac
0ade      ade:	0f ae e8             	lfence
0ae1      ae1:	0f 01 ca             	clac
0ae4      ae4:	0f 01 cb             	stac
0ae7      ae7:	0f ae e8             	lfence
0aea      aea:	0f 01 ca             	clac
0aed      aed:	0f 01 cb             	stac
0af0      af0:	0f ae e8             	lfence
0af3      af3:	0f 01 ca             	clac
0af6      af6:	e9 00 00 00 00       	jmp    afb <.altinstr_replacement+0xafb>	af7: R_X86_64_PLT32	.text+0x208ded
0afb      afb:	e9 00 00 00 00       	jmp    b00 <.altinstr_replacement+0xb00>	afc: R_X86_64_PLT32	.text+0x2092b5
0b00      b00:	e9 00 00 00 00       	jmp    b05 <.altinstr_replacement+0xb05>	b01: R_X86_64_PLT32	.text+0x2093c3
0b05      b05:	0f 01 cb             	stac
0b08      b08:	e8 00 00 00 00       	call   b0d <.altinstr_replacement+0xb0d>	b09: R_X86_64_PLT32	rep_movs_alternative-0x4
0b0d      b0d:	0f 01 ca             	clac
0b10      b10:	0f 01 cb             	stac
0b13      b13:	e8 00 00 00 00       	call   b18 <.altinstr_replacement+0xb18>	b14: R_X86_64_PLT32	rep_movs_alternative-0x4
0b18      b18:	0f 01 ca             	clac
0b1b      b1b:	e8 00 00 00 00       	call   b20 <.altinstr_replacement+0xb20>	b1c: R_X86_64_PLT32	clear_page_rep-0x4
0b20      b20:	e8 00 00 00 00       	call   b25 <.altinstr_replacement+0xb25>	b21: R_X86_64_PLT32	clear_page_erms-0x4
0b25      b25:	e9 00 00 00 00       	jmp    b2a <.altinstr_replacement+0xb2a>	b26: R_X86_64_PLT32	.text+0x215e49
0b2a      b2a:	e8 00 00 00 00       	call   b2f <.altinstr_replacement+0xb2f>	b2b: R_X86_64_PLT32	clear_page_rep-0x4
0b2f      b2f:	e8 00 00 00 00       	call   b34 <.altinstr_replacement+0xb34>	b30: R_X86_64_PLT32	clear_page_erms-0x4
0b34      b34:	e8 00 00 00 00       	call   b39 <.altinstr_replacement+0xb39>	b35: R_X86_64_PLT32	clear_page_rep-0x4
0b39      b39:	e8 00 00 00 00       	call   b3e <.altinstr_replacement+0xb3e>	b3a: R_X86_64_PLT32	clear_page_erms-0x4
0b3e      b3e:	e8 00 00 00 00       	call   b43 <.altinstr_replacement+0xb43>	b3f: R_X86_64_PLT32	clear_page_rep-0x4
0b43      b43:	e8 00 00 00 00       	call   b48 <.altinstr_replacement+0xb48>	b44: R_X86_64_PLT32	clear_page_erms-0x4
0b48      b48:	e8 00 00 00 00       	call   b4d <.altinstr_replacement+0xb4d>	b49: R_X86_64_PLT32	clear_page_rep-0x4
0b4d      b4d:	e8 00 00 00 00       	call   b52 <.altinstr_replacement+0xb52>	b4e: R_X86_64_PLT32	clear_page_erms-0x4
0b52      b52:	e8 00 00 00 00       	call   b57 <.altinstr_replacement+0xb57>	b53: R_X86_64_PLT32	clear_page_rep-0x4
0b57      b57:	e8 00 00 00 00       	call   b5c <.altinstr_replacement+0xb5c>	b58: R_X86_64_PLT32	clear_page_erms-0x4
0b5c      b5c:	e9 00 00 00 00       	jmp    b61 <.altinstr_replacement+0xb61>	b5d: R_X86_64_PLT32	.text+0x21e367
0b61      b61:	e9 00 00 00 00       	jmp    b66 <.altinstr_replacement+0xb66>	b62: R_X86_64_PLT32	.text+0x225576
0b66      b66:	e9 00 00 00 00       	jmp    b6b <.altinstr_replacement+0xb6b>	b67: R_X86_64_PLT32	.text+0x225597
0b6b      b6b:	e9 00 00 00 00       	jmp    b70 <.altinstr_replacement+0xb70>	b6c: R_X86_64_PLT32	.text+0x22569a
0b70      b70:	e9 00 00 00 00       	jmp    b75 <.altinstr_replacement+0xb75>	b71: R_X86_64_PLT32	.text+0x225e3b
0b75      b75:	e9 00 00 00 00       	jmp    b7a <.altinstr_replacement+0xb7a>	b76: R_X86_64_PLT32	.text+0x225d1c
0b7a      b7a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b7f      b7f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b84      b84:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b89      b89:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b8e      b8e:	0f 0d 0f             	prefetchw (%rdi)
0b91      b91:	0f 0d 09             	prefetchw (%rcx)
0b94      b94:	e8 00 00 00 00       	call   b99 <.altinstr_replacement+0xb99>	b95: R_X86_64_PLT32	clear_page_rep-0x4
0b99      b99:	e8 00 00 00 00       	call   b9e <.altinstr_replacement+0xb9e>	b9a: R_X86_64_PLT32	clear_page_erms-0x4
0b9e      b9e:	e8 00 00 00 00       	call   ba3 <.altinstr_replacement+0xba3>	b9f: R_X86_64_PLT32	clear_page_rep-0x4
0ba3      ba3:	e8 00 00 00 00       	call   ba8 <.altinstr_replacement+0xba8>	ba4: R_X86_64_PLT32	clear_page_erms-0x4
0ba8      ba8:	e8 00 00 00 00       	call   bad <.altinstr_replacement+0xbad>	ba9: R_X86_64_PLT32	clear_page_rep-0x4
0bad      bad:	e8 00 00 00 00       	call   bb2 <.altinstr_replacement+0xbb2>	bae: R_X86_64_PLT32	clear_page_erms-0x4
0bb2      bb2:	e8 00 00 00 00       	call   bb7 <.altinstr_replacement+0xbb7>	bb3: R_X86_64_PLT32	clear_page_rep-0x4
0bb7      bb7:	e8 00 00 00 00       	call   bbc <.altinstr_replacement+0xbbc>	bb8: R_X86_64_PLT32	clear_page_erms-0x4
0bbc      bbc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bc1      bc1:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0bc6      bc6:	0f 94 c0             	sete   %al
0bc9      bc9:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0bcd      bcd:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0bd2      bd2:	0f 94 c0             	sete   %al
0bd5      bd5:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0bd9      bd9:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0bde      bde:	0f 94 c0             	sete   %al
0be1      be1:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0be5      be5:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0bea      bea:	0f 94 c0             	sete   %al
0bed      bed:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0bf1      bf1:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0bf6      bf6:	0f 94 c0             	sete   %al
0bf9      bf9:	65 48 0f c7 0f       	cmpxchg16b %gs:(%rdi)
0bfe      bfe:	0f 94 c0             	sete   %al
0c01      c01:	65 49 0f c7 0a       	cmpxchg16b %gs:(%r10)
0c06      c06:	0f 94 c0             	sete   %al
0c09      c09:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c0e      c0e:	e8 00 00 00 00       	call   c13 <.altinstr_replacement+0xc13>	c0f: R_X86_64_PLT32	clear_page_rep-0x4
0c13      c13:	e8 00 00 00 00       	call   c18 <.altinstr_replacement+0xc18>	c14: R_X86_64_PLT32	clear_page_erms-0x4
0c18      c18:	e8 00 00 00 00       	call   c1d <.altinstr_replacement+0xc1d>	c19: R_X86_64_PLT32	clear_page_rep-0x4
0c1d      c1d:	e8 00 00 00 00       	call   c22 <.altinstr_replacement+0xc22>	c1e: R_X86_64_PLT32	clear_page_erms-0x4
0c22      c22:	e8 00 00 00 00       	call   c27 <.altinstr_replacement+0xc27>	c23: R_X86_64_PLT32	clear_page_rep-0x4
0c27      c27:	e8 00 00 00 00       	call   c2c <.altinstr_replacement+0xc2c>	c28: R_X86_64_PLT32	clear_page_erms-0x4
0c2c      c2c:	0f 01 cb             	stac
0c2f      c2f:	0f ae e8             	lfence
0c32      c32:	0f 01 ca             	clac
0c35      c35:	0f 01 ca             	clac
0c38      c38:	0f 01 cb             	stac
0c3b      c3b:	0f ae e8             	lfence
0c3e      c3e:	0f 01 ca             	clac
0c41      c41:	0f 01 ca             	clac
0c44      c44:	0f 01 cb             	stac
0c47      c47:	0f ae e8             	lfence
0c4a      c4a:	0f 01 ca             	clac
0c4d      c4d:	0f 01 ca             	clac
0c50      c50:	0f 01 cb             	stac
0c53      c53:	e8 00 00 00 00       	call   c58 <.altinstr_replacement+0xc58>	c54: R_X86_64_PLT32	rep_movs_alternative-0x4
0c58      c58:	0f 01 ca             	clac
0c5b      c5b:	0f 01 cb             	stac
0c5e      c5e:	0f ae e8             	lfence
0c61      c61:	0f 01 ca             	clac
0c64      c64:	0f 01 ca             	clac
0c67      c67:	0f 01 cb             	stac
0c6a      c6a:	0f ae e8             	lfence
0c6d      c6d:	0f 01 ca             	clac
0c70      c70:	0f 01 ca             	clac
0c73      c73:	0f 0d 8b 00 05 00 00 	prefetchw 0x500(%rbx)
0c7a      c7a:	f3 0f b8 c7          	popcnt %edi,%eax
0c7e      c7e:	0f 0d 0b             	prefetchw (%rbx)
0c81      c81:	0f 01 cb             	stac
0c84      c84:	e8 00 00 00 00       	call   c89 <.altinstr_replacement+0xc89>	c85: R_X86_64_PLT32	rep_stos_alternative-0x4
0c89      c89:	0f 01 ca             	clac
0c8c      c8c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c91      c91:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0c96      c96:	0f 01 cb             	stac
0c99      c99:	e8 00 00 00 00       	call   c9e <.altinstr_replacement+0xc9e>	c9a: R_X86_64_PLT32	rep_stos_alternative-0x4
0c9e      c9e:	0f 01 ca             	clac
0ca1      ca1:	0f 01 cb             	stac
0ca4      ca4:	e8 00 00 00 00       	call   ca9 <.altinstr_replacement+0xca9>	ca5: R_X86_64_PLT32	rep_stos_alternative-0x4
0ca9      ca9:	0f 01 ca             	clac
0cac      cac:	0f 01 cb             	stac
0caf      caf:	e8 00 00 00 00       	call   cb4 <.altinstr_replacement+0xcb4>	cb0: R_X86_64_PLT32	rep_stos_alternative-0x4
0cb4      cb4:	0f 01 ca             	clac
0cb7      cb7:	e9 00 00 00 00       	jmp    cbc <.altinstr_replacement+0xcbc>	cb8: R_X86_64_PLT32	.text+0x31de54
0cbc      cbc:	41 0f 0d 0e          	prefetchw (%r14)
0cc0      cc0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cc5      cc5:	0f 01 cb             	stac
0cc8      cc8:	e8 00 00 00 00       	call   ccd <.altinstr_replacement+0xccd>	cc9: R_X86_64_PLT32	rep_stos_alternative-0x4
0ccd      ccd:	0f 01 ca             	clac
0cd0      cd0:	0f 01 cb             	stac
0cd3      cd3:	e8 00 00 00 00       	call   cd8 <.altinstr_replacement+0xcd8>	cd4: R_X86_64_PLT32	rep_stos_alternative-0x4
0cd8      cd8:	0f 01 ca             	clac
0cdb      cdb:	0f 01 cb             	stac
0cde      cde:	e8 00 00 00 00       	call   ce3 <.altinstr_replacement+0xce3>	cdf: R_X86_64_PLT32	rep_stos_alternative-0x4
0ce3      ce3:	0f 01 ca             	clac
0ce6      ce6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ceb      ceb:	f3 0f b8 c7          	popcnt %edi,%eax
0cef      cef:	f3 0f b8 c7          	popcnt %edi,%eax
0cf3      cf3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cf8      cf8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0cfd      cfd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d02      d02:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d07      d07:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d0c      d0c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d11      d11:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d16      d16:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d1b      d1b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d20      d20:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d25      d25:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d2a      d2a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d2f      d2f:	0f 01 cb             	stac
0d32      d32:	e8 00 00 00 00       	call   d37 <.altinstr_replacement+0xd37>	d33: R_X86_64_PLT32	rep_movs_alternative-0x4
0d37      d37:	0f 01 ca             	clac
0d3a      d3a:	0f 01 cb             	stac
0d3d      d3d:	e8 00 00 00 00       	call   d42 <.altinstr_replacement+0xd42>	d3e: R_X86_64_PLT32	rep_movs_alternative-0x4
0d42      d42:	0f 01 ca             	clac
0d45      d45:	0f 01 cb             	stac
0d48      d48:	e8 00 00 00 00       	call   d4d <.altinstr_replacement+0xd4d>	d49: R_X86_64_PLT32	rep_movs_alternative-0x4
0d4d      d4d:	0f 01 ca             	clac
0d50      d50:	0f 01 cb             	stac
0d53      d53:	e8 00 00 00 00       	call   d58 <.altinstr_replacement+0xd58>	d54: R_X86_64_PLT32	rep_movs_alternative-0x4
0d58      d58:	0f 01 ca             	clac
0d5b      d5b:	0f 01 cb             	stac
0d5e      d5e:	0f 01 ca             	clac
0d61      d61:	0f 01 cb             	stac
0d64      d64:	0f 01 ca             	clac
0d67      d67:	0f 01 cb             	stac
0d6a      d6a:	e8 00 00 00 00       	call   d6f <.altinstr_replacement+0xd6f>	d6b: R_X86_64_PLT32	rep_stos_alternative-0x4
0d6f      d6f:	0f 01 ca             	clac
0d72      d72:	0f 01 cb             	stac
0d75      d75:	e8 00 00 00 00       	call   d7a <.altinstr_replacement+0xd7a>	d76: R_X86_64_PLT32	rep_stos_alternative-0x4
0d7a      d7a:	0f 01 ca             	clac
0d7d      d7d:	0f 01 cb             	stac
0d80      d80:	e8 00 00 00 00       	call   d85 <.altinstr_replacement+0xd85>	d81: R_X86_64_PLT32	rep_movs_alternative-0x4
0d85      d85:	0f 01 ca             	clac
0d88      d88:	0f 01 cb             	stac
0d8b      d8b:	e8 00 00 00 00       	call   d90 <.altinstr_replacement+0xd90>	d8c: R_X86_64_PLT32	rep_movs_alternative-0x4
0d90      d90:	0f 01 ca             	clac
0d93      d93:	0f 01 cb             	stac
0d96      d96:	0f ae e8             	lfence
0d99      d99:	0f 01 ca             	clac
0d9c      d9c:	0f 01 cb             	stac
0d9f      d9f:	0f ae e8             	lfence
0da2      da2:	0f 01 ca             	clac
0da5      da5:	0f 01 cb             	stac
0da8      da8:	0f ae e8             	lfence
0dab      dab:	0f 01 ca             	clac
0dae      dae:	0f 01 cb             	stac
0db1      db1:	0f ae e8             	lfence
0db4      db4:	0f 01 ca             	clac
0db7      db7:	0f 01 ca             	clac
0dba      dba:	0f 01 ca             	clac
0dbd      dbd:	0f 01 ca             	clac
0dc0      dc0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0dc5      dc5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0dca      dca:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0dcf      dcf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0dd4      dd4:	f3 0f b8 c7          	popcnt %edi,%eax
0dd8      dd8:	f3 0f b8 c7          	popcnt %edi,%eax
0ddc      ddc:	0f ae e8             	lfence
0ddf      ddf:	0f 01 cb             	stac
0de2      de2:	e8 00 00 00 00       	call   de7 <.altinstr_replacement+0xde7>	de3: R_X86_64_PLT32	rep_movs_alternative-0x4
0de7      de7:	0f 01 ca             	clac
0dea      dea:	0f 01 cb             	stac
0ded      ded:	e8 00 00 00 00       	call   df2 <.altinstr_replacement+0xdf2>	dee: R_X86_64_PLT32	rep_movs_alternative-0x4
0df2      df2:	0f 01 ca             	clac
0df5      df5:	0f 01 cb             	stac
0df8      df8:	0f ae e8             	lfence
0dfb      dfb:	0f 01 ca             	clac
0dfe      dfe:	0f 01 ca             	clac
0e01      e01:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e06      e06:	0f 01 cb             	stac
0e09      e09:	0f ae e8             	lfence
0e0c      e0c:	0f 01 ca             	clac
0e0f      e0f:	0f 01 cb             	stac
0e12      e12:	0f ae e8             	lfence
0e15      e15:	0f 01 ca             	clac
0e18      e18:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e1d      e1d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e22      e22:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e27      e27:	e9 00 00 00 00       	jmp    e2c <.altinstr_replacement+0xe2c>	e28: R_X86_64_PLT32	.text+0x737321
0e2c      e2c:	e9 00 00 00 00       	jmp    e31 <.altinstr_replacement+0xe31>	e2d: R_X86_64_PLT32	.text+0x7393d4
0e31      e31:	e9 00 00 00 00       	jmp    e36 <.altinstr_replacement+0xe36>	e32: R_X86_64_PLT32	.cpuidle.text+0x2c9
0e36      e36:	e9 00 00 00 00       	jmp    e3b <.altinstr_replacement+0xe3b>	e37: R_X86_64_PLT32	.text+0x77378f
0e3b      e3b:	e9 00 00 00 00       	jmp    e40 <.altinstr_replacement+0xe40>	e3c: R_X86_64_PLT32	.cpuidle.text+0x355
0e40      e40:	e9 00 00 00 00       	jmp    e45 <.altinstr_replacement+0xe45>	e41: R_X86_64_PLT32	.text+0x77e6fe
0e45      e45:	e9 00 00 00 00       	jmp    e4a <.altinstr_replacement+0xe4a>	e46: R_X86_64_PLT32	.text+0x77e737
0e4a      e4a:	f3 0f b8 c7          	popcnt %edi,%eax
0e4e      e4e:	f3 0f b8 c7          	popcnt %edi,%eax
0e52      e52:	f3 0f b8 c7          	popcnt %edi,%eax
0e56      e56:	0f 01 cb             	stac
0e59      e59:	e8 00 00 00 00       	call   e5e <.altinstr_replacement+0xe5e>	e5a: R_X86_64_PLT32	rep_stos_alternative-0x4
0e5e      e5e:	0f 01 ca             	clac
0e61      e61:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e66      e66:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e6b      e6b:	e9 00 00 00 00       	jmp    e70 <.altinstr_replacement+0xe70>	e6c: R_X86_64_PLT32	.init.text+0x5717c
0e70      e70:	e9 00 00 00 00       	jmp    e75 <.altinstr_replacement+0xe75>	e71: R_X86_64_PLT32	.init.text+0x57198
0e75      e75:	e9 00 00 00 00       	jmp    e7a <.altinstr_replacement+0xe7a>	e76: R_X86_64_PLT32	.text+0x80cf5d
0e7a      e7a:	e9 00 00 00 00       	jmp    e7f <.altinstr_replacement+0xe7f>	e7b: R_X86_64_PLT32	.text+0x80cfcd
0e7f      e7f:	e9 00 00 00 00       	jmp    e84 <.altinstr_replacement+0xe84>	e80: R_X86_64_PLT32	.text+0x80cf79
0e84      e84:	e9 00 00 00 00       	jmp    e89 <.altinstr_replacement+0xe89>	e85: R_X86_64_PLT32	.text+0x80cfe9
0e89      e89:	e9 00 00 00 00       	jmp    e8e <.altinstr_replacement+0xe8e>	e8a: R_X86_64_PLT32	.text+0x80cf95
0e8e      e8e:	e9 00 00 00 00       	jmp    e93 <.altinstr_replacement+0xe93>	e8f: R_X86_64_PLT32	.text+0x80d005
0e93      e93:	e9 00 00 00 00       	jmp    e98 <.altinstr_replacement+0xe98>	e94: R_X86_64_PLT32	.text+0x80cfb1
0e98      e98:	e9 00 00 00 00       	jmp    e9d <.altinstr_replacement+0xe9d>	e99: R_X86_64_PLT32	.text+0x80d021
0e9d      e9d:	f3 0f b8 c7          	popcnt %edi,%eax
0ea1      ea1:	e9 00 00 00 00       	jmp    ea6 <.altinstr_replacement+0xea6>	ea2: R_X86_64_PLT32	.text+0x822ed3
0ea6      ea6:	66 41 0f ae 3c 04    	clflushopt (%r12,%rax,1)
0eac      eac:	e9 00 00 00 00       	jmp    eb1 <.altinstr_replacement+0xeb1>	ead: R_X86_64_PLT32	.text+0x823145
0eb1      eb1:	66 41 0f ae 7c 05 00 	clflushopt 0x0(%r13,%rax,1)
0eb8      eb8:	e9 00 00 00 00       	jmp    ebd <.altinstr_replacement+0xebd>	eb9: R_X86_64_PLT32	.text+0x8231ee
0ebd      ebd:	66 0f ae 3b          	clflushopt (%rbx)
0ec1      ec1:	66 41 0f ae 7f ff    	clflushopt -0x1(%r15)
0ec7      ec7:	e9 00 00 00 00       	jmp    ecc <.altinstr_replacement+0xecc>	ec8: R_X86_64_PLT32	.text+0x8235ca
0ecc      ecc:	f3 0f b8 c7          	popcnt %edi,%eax
0ed0      ed0:	f3 0f b8 c7          	popcnt %edi,%eax
0ed4      ed4:	f3 0f b8 c7          	popcnt %edi,%eax
0ed8      ed8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0edd      edd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ee2      ee2:	f3 0f b8 c7          	popcnt %edi,%eax
0ee6      ee6:	f3 0f b8 c7          	popcnt %edi,%eax
0eea      eea:	f3 0f b8 c7          	popcnt %edi,%eax
0eee      eee:	f3 0f b8 c7          	popcnt %edi,%eax
0ef2      ef2:	e8 00 00 00 00       	call   ef7 <.altinstr_replacement+0xef7>	ef3: R_X86_64_PLT32	clear_page_rep-0x4
0ef7      ef7:	e8 00 00 00 00       	call   efc <.altinstr_replacement+0xefc>	ef8: R_X86_64_PLT32	clear_page_erms-0x4
0efc      efc:	0f 01 cb             	stac
0eff      eff:	e8 00 00 00 00       	call   f04 <.altinstr_replacement+0xf04>	f00: R_X86_64_PLT32	rep_stos_alternative-0x4
0f04      f04:	0f 01 ca             	clac
0f07      f07:	f3 0f b8 c7          	popcnt %edi,%eax
0f0b      f0b:	f3 0f b8 c7          	popcnt %edi,%eax
0f0f      f0f:	f3 0f b8 c7          	popcnt %edi,%eax
0f13      f13:	f3 0f b8 c7          	popcnt %edi,%eax
0f17      f17:	f3 0f b8 c7          	popcnt %edi,%eax
0f1b      f1b:	f3 0f b8 c7          	popcnt %edi,%eax
0f1f      f1f:	f3 0f b8 c7          	popcnt %edi,%eax
0f23      f23:	f3 0f b8 c7          	popcnt %edi,%eax
0f27      f27:	f3 0f b8 c7          	popcnt %edi,%eax
0f2b      f2b:	f3 0f b8 c7          	popcnt %edi,%eax
0f2f      f2f:	f3 0f b8 c7          	popcnt %edi,%eax
0f33      f33:	f3 0f b8 c7          	popcnt %edi,%eax
0f37      f37:	e9 00 00 00 00       	jmp    f3c <.altinstr_replacement+0xf3c>	f38: R_X86_64_PLT32	.text+0x9f032a
0f3c      f3c:	f3 0f b8 c7          	popcnt %edi,%eax
0f40      f40:	f3 0f b8 c7          	popcnt %edi,%eax
0f44      f44:	f3 0f b8 c7          	popcnt %edi,%eax
0f48      f48:	f3 0f b8 c7          	popcnt %edi,%eax
0f4c      f4c:	f3 0f b8 c7          	popcnt %edi,%eax
0f50      f50:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f55      f55:	f3 0f b8 c7          	popcnt %edi,%eax
0f59      f59:	f3 0f b8 c7          	popcnt %edi,%eax
0f5d      f5d:	f3 0f b8 c7          	popcnt %edi,%eax
0f61      f61:	f3 0f b8 c7          	popcnt %edi,%eax
0f65      f65:	f3 0f b8 c7          	popcnt %edi,%eax
0f69      f69:	f3 0f b8 c7          	popcnt %edi,%eax
0f6d      f6d:	f3 0f b8 c7          	popcnt %edi,%eax
0f71      f71:	f3 0f b8 c7          	popcnt %edi,%eax
0f75      f75:	f3 0f b8 c7          	popcnt %edi,%eax
0f79      f79:	f3 0f b8 c7          	popcnt %edi,%eax
0f7d      f7d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f82      f82:	f3 0f b8 c7          	popcnt %edi,%eax
0f86      f86:	f3 0f b8 c7          	popcnt %edi,%eax
0f8a      f8a:	f3 0f b8 c7          	popcnt %edi,%eax
0f8e      f8e:	f3 0f b8 c7          	popcnt %edi,%eax
0f92      f92:	f3 0f b8 c7          	popcnt %edi,%eax
0f96      f96:	f3 0f b8 c7          	popcnt %edi,%eax
0f9a      f9a:	f3 0f b8 c7          	popcnt %edi,%eax
0f9e      f9e:	f3 0f b8 c7          	popcnt %edi,%eax
0fa2      fa2:	f3 0f b8 c7          	popcnt %edi,%eax
0fa6      fa6:	f3 0f b8 c7          	popcnt %edi,%eax
0faa      faa:	f3 0f b8 c7          	popcnt %edi,%eax
0fae      fae:	f3 0f b8 c7          	popcnt %edi,%eax
0fb2      fb2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fb7      fb7:	f3 0f b8 c7          	popcnt %edi,%eax
0fbb      fbb:	f3 0f b8 c7          	popcnt %edi,%eax
0fbf      fbf:	f3 0f b8 c7          	popcnt %edi,%eax
0fc3      fc3:	f3 0f b8 c7          	popcnt %edi,%eax
0fc7      fc7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0fcc      fcc:	f3 0f b8 c7          	popcnt %edi,%eax
0fd0      fd0:	f3 0f b8 c7          	popcnt %edi,%eax
0fd4      fd4:	f3 0f b8 c7          	popcnt %edi,%eax
0fd8      fd8:	f3 0f b8 c7          	popcnt %edi,%eax
0fdc      fdc:	f3 0f b8 c7          	popcnt %edi,%eax
0fe0      fe0:	f3 0f b8 c7          	popcnt %edi,%eax
0fe4      fe4:	f3 0f b8 c7          	popcnt %edi,%eax
0fe8      fe8:	f3 0f b8 c7          	popcnt %edi,%eax
0fec      fec:	f3 0f b8 c7          	popcnt %edi,%eax
0ff0      ff0:	f3 0f b8 c7          	popcnt %edi,%eax
0ff4      ff4:	f3 0f b8 c7          	popcnt %edi,%eax
0ff8      ff8:	f3 0f b8 c7          	popcnt %edi,%eax
0ffc      ffc:	f3 0f b8 c7          	popcnt %edi,%eax
1000     1000:	f3 0f b8 c7          	popcnt %edi,%eax
1004     1004:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1009     1009:	f3 48 0f b8 c7       	popcnt %rdi,%rax
100e     100e:	f3 0f b8 c7          	popcnt %edi,%eax
1012     1012:	f3 0f b8 c7          	popcnt %edi,%eax
1016     1016:	f3 0f b8 c7          	popcnt %edi,%eax
101a     101a:	f3 0f b8 c7          	popcnt %edi,%eax
101e     101e:	f3 0f b8 c7          	popcnt %edi,%eax
1022     1022:	f3 0f b8 c7          	popcnt %edi,%eax
1026     1026:	f3 48 0f b8 c7       	popcnt %rdi,%rax
102b     102b:	f3 0f b8 c7          	popcnt %edi,%eax
102f     102f:	f3 0f b8 c7          	popcnt %edi,%eax
1033     1033:	f3 0f b8 c7          	popcnt %edi,%eax
1037     1037:	f3 0f b8 c7          	popcnt %edi,%eax
103b     103b:	f3 0f b8 c7          	popcnt %edi,%eax
103f     103f:	f3 0f b8 c7          	popcnt %edi,%eax
1043     1043:	f3 0f b8 c7          	popcnt %edi,%eax
1047     1047:	f3 0f b8 c7          	popcnt %edi,%eax
104b     104b:	f3 0f b8 c7          	popcnt %edi,%eax
104f     104f:	f3 0f b8 c7          	popcnt %edi,%eax
1053     1053:	f3 0f b8 c7          	popcnt %edi,%eax
1057     1057:	f3 48 0f b8 c7       	popcnt %rdi,%rax
105c     105c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1061     1061:	f3 0f b8 c7          	popcnt %edi,%eax
1065     1065:	f3 0f b8 c7          	popcnt %edi,%eax
1069     1069:	f3 0f b8 c7          	popcnt %edi,%eax
106d     106d:	f3 0f b8 c7          	popcnt %edi,%eax
1071     1071:	f3 0f b8 c7          	popcnt %edi,%eax
1075     1075:	f3 48 0f b8 c7       	popcnt %rdi,%rax
107a     107a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
107f     107f:	f3 0f b8 c7          	popcnt %edi,%eax
1083     1083:	f3 0f b8 c7          	popcnt %edi,%eax
1087     1087:	f3 0f b8 c7          	popcnt %edi,%eax
108b     108b:	f3 0f b8 c7          	popcnt %edi,%eax
108f     108f:	f3 0f b8 c7          	popcnt %edi,%eax
1093     1093:	f3 0f b8 c7          	popcnt %edi,%eax
1097     1097:	f3 0f b8 c7          	popcnt %edi,%eax
109b     109b:	f3 0f b8 c7          	popcnt %edi,%eax
109f     109f:	f3 0f b8 c7          	popcnt %edi,%eax
10a3     10a3:	f3 0f b8 c7          	popcnt %edi,%eax
10a7     10a7:	f3 0f b8 c7          	popcnt %edi,%eax
10ab     10ab:	f3 0f b8 c7          	popcnt %edi,%eax
10af     10af:	e9 00 00 00 00       	jmp    10b4 <.altinstr_replacement+0x10b4>	10b0: R_X86_64_PLT32	.text+0xa50be8
10b4     10b4:	e9 00 00 00 00       	jmp    10b9 <.altinstr_replacement+0x10b9>	10b5: R_X86_64_PLT32	.text+0xa50d95
10b9     10b9:	0f 01 cb             	stac
10bc     10bc:	0f ae e8             	lfence
10bf     10bf:	0f 01 ca             	clac
10c2     10c2:	0f 01 cb             	stac
10c5     10c5:	e8 00 00 00 00       	call   10ca <.altinstr_replacement+0x10ca>	10c6: R_X86_64_PLT32	rep_movs_alternative-0x4
10ca     10ca:	0f 01 ca             	clac
10cd     10cd:	0f 01 cb             	stac
10d0     10d0:	e8 00 00 00 00       	call   10d5 <.altinstr_replacement+0x10d5>	10d1: R_X86_64_PLT32	rep_movs_alternative-0x4
10d5     10d5:	0f 01 ca             	clac
10d8     10d8:	0f 01 cb             	stac
10db     10db:	e8 00 00 00 00       	call   10e0 <.altinstr_replacement+0x10e0>	10dc: R_X86_64_PLT32	rep_movs_alternative-0x4
10e0     10e0:	0f 01 ca             	clac
10e3     10e3:	0f 01 cb             	stac
10e6     10e6:	e8 00 00 00 00       	call   10eb <.altinstr_replacement+0x10eb>	10e7: R_X86_64_PLT32	rep_movs_alternative-0x4
10eb     10eb:	0f 01 ca             	clac
10ee     10ee:	0f 01 cb             	stac
10f1     10f1:	0f ae e8             	lfence
10f4     10f4:	0f 01 ca             	clac
10f7     10f7:	0f 01 ca             	clac
10fa     10fa:	0f 01 cb             	stac
10fd     10fd:	e8 00 00 00 00       	call   1102 <.altinstr_replacement+0x1102>	10fe: R_X86_64_PLT32	rep_movs_alternative-0x4
1102     1102:	0f 01 ca             	clac
1105     1105:	0f 01 cb             	stac
1108     1108:	e8 00 00 00 00       	call   110d <.altinstr_replacement+0x110d>	1109: R_X86_64_PLT32	rep_movs_alternative-0x4
110d     110d:	0f 01 ca             	clac
1110     1110:	0f 01 cb             	stac
1113     1113:	e8 00 00 00 00       	call   1118 <.altinstr_replacement+0x1118>	1114: R_X86_64_PLT32	rep_movs_alternative-0x4
1118     1118:	0f 01 ca             	clac
111b     111b:	0f 01 cb             	stac
111e     111e:	0f 01 ca             	clac
1121     1121:	0f 01 cb             	stac
1124     1124:	e8 00 00 00 00       	call   1129 <.altinstr_replacement+0x1129>	1125: R_X86_64_PLT32	rep_movs_alternative-0x4
1129     1129:	0f 01 ca             	clac
112c     112c:	0f 01 cb             	stac
112f     112f:	e8 00 00 00 00       	call   1134 <.altinstr_replacement+0x1134>	1130: R_X86_64_PLT32	rep_movs_alternative-0x4
1134     1134:	0f 01 ca             	clac
1137     1137:	0f 01 cb             	stac
113a     113a:	e8 00 00 00 00       	call   113f <.altinstr_replacement+0x113f>	113b: R_X86_64_PLT32	rep_movs_alternative-0x4
113f     113f:	0f 01 ca             	clac
1142     1142:	0f 01 cb             	stac
1145     1145:	0f ae e8             	lfence
1148     1148:	0f 01 ca             	clac
114b     114b:	0f 01 ca             	clac
114e     114e:	f3 0f b8 c7          	popcnt %edi,%eax
1152     1152:	f3 0f b8 c7          	popcnt %edi,%eax
1156     1156:	f3 0f b8 c7          	popcnt %edi,%eax
115a     115a:	f3 0f b8 c7          	popcnt %edi,%eax
115e     115e:	f3 0f b8 c7          	popcnt %edi,%eax
1162     1162:	f3 0f b8 c7          	popcnt %edi,%eax
1166     1166:	f3 0f b8 c7          	popcnt %edi,%eax
116a     116a:	f3 0f b8 c7          	popcnt %edi,%eax
116e     116e:	f3 0f b8 c7          	popcnt %edi,%eax
1172     1172:	f3 0f b8 c7          	popcnt %edi,%eax
1176     1176:	f3 0f b8 c7          	popcnt %edi,%eax
117a     117a:	f3 0f b8 c7          	popcnt %edi,%eax
117e     117e:	f3 0f b8 c7          	popcnt %edi,%eax
1182     1182:	f3 0f b8 c7          	popcnt %edi,%eax
1186     1186:	f3 0f b8 c7          	popcnt %edi,%eax
118a     118a:	f3 0f b8 c7          	popcnt %edi,%eax
118e     118e:	f3 0f b8 c7          	popcnt %edi,%eax
1192     1192:	f3 0f b8 c7          	popcnt %edi,%eax
1196     1196:	f3 0f b8 c7          	popcnt %edi,%eax
119a     119a:	f3 0f b8 c7          	popcnt %edi,%eax
119e     119e:	f3 0f b8 c7          	popcnt %edi,%eax
11a2     11a2:	f3 0f b8 c7          	popcnt %edi,%eax
11a6     11a6:	f3 0f b8 c7          	popcnt %edi,%eax
11aa     11aa:	f3 0f b8 c7          	popcnt %edi,%eax
11ae     11ae:	f3 0f b8 c7          	popcnt %edi,%eax
11b2     11b2:	f3 0f b8 c7          	popcnt %edi,%eax
11b6     11b6:	f3 0f b8 c7          	popcnt %edi,%eax
11ba     11ba:	f3 0f b8 c7          	popcnt %edi,%eax
11be     11be:	f3 0f b8 c7          	popcnt %edi,%eax
11c2     11c2:	f3 0f b8 c7          	popcnt %edi,%eax
11c6     11c6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
11cb     11cb:	f3 0f b8 c7          	popcnt %edi,%eax
11cf     11cf:	f3 0f b8 c7          	popcnt %edi,%eax
11d3     11d3:	f3 0f b8 c7          	popcnt %edi,%eax
11d7     11d7:	f3 0f b8 c7          	popcnt %edi,%eax
11db     11db:	f3 0f b8 c7          	popcnt %edi,%eax
11df     11df:	f3 0f b8 c7          	popcnt %edi,%eax
11e3     11e3:	f3 0f b8 c7          	popcnt %edi,%eax
11e7     11e7:	f3 0f b8 c7          	popcnt %edi,%eax
11eb     11eb:	f3 0f b8 c7          	popcnt %edi,%eax
11ef     11ef:	f3 0f b8 c7          	popcnt %edi,%eax
11f3     11f3:	f3 0f b8 c7          	popcnt %edi,%eax
11f7     11f7:	f3 0f b8 c7          	popcnt %edi,%eax
11fb     11fb:	f3 0f b8 c7          	popcnt %edi,%eax
11ff     11ff:	f3 0f b8 c7          	popcnt %edi,%eax
1203     1203:	f3 0f b8 c7          	popcnt %edi,%eax
1207     1207:	f3 0f b8 c7          	popcnt %edi,%eax
120b     120b:	f3 0f b8 c7          	popcnt %edi,%eax
120f     120f:	f3 0f b8 c7          	popcnt %edi,%eax
1213     1213:	f3 0f b8 c7          	popcnt %edi,%eax
1217     1217:	f3 0f b8 c7          	popcnt %edi,%eax
121b     121b:	f3 0f b8 c7          	popcnt %edi,%eax
121f     121f:	f3 0f b8 c7          	popcnt %edi,%eax
1223     1223:	f3 0f b8 c7          	popcnt %edi,%eax
1227     1227:	f3 0f b8 c7          	popcnt %edi,%eax
122b     122b:	f3 0f b8 c7          	popcnt %edi,%eax
122f     122f:	f3 0f b8 c7          	popcnt %edi,%eax
1233     1233:	f3 0f b8 c7          	popcnt %edi,%eax
1237     1237:	f3 0f b8 c7          	popcnt %edi,%eax
123b     123b:	f3 0f b8 c7          	popcnt %edi,%eax
123f     123f:	f3 0f b8 c7          	popcnt %edi,%eax
1243     1243:	f3 0f b8 c7          	popcnt %edi,%eax
1247     1247:	f3 0f b8 c7          	popcnt %edi,%eax
124b     124b:	f3 0f b8 c7          	popcnt %edi,%eax
124f     124f:	f3 0f b8 c7          	popcnt %edi,%eax
1253     1253:	f3 0f b8 c7          	popcnt %edi,%eax
1257     1257:	f3 0f b8 c7          	popcnt %edi,%eax
125b     125b:	f3 0f b8 c7          	popcnt %edi,%eax
125f     125f:	f3 0f b8 c7          	popcnt %edi,%eax
1263     1263:	f3 0f b8 c7          	popcnt %edi,%eax
1267     1267:	f3 0f b8 c7          	popcnt %edi,%eax
126b     126b:	f3 0f b8 c7          	popcnt %edi,%eax
126f     126f:	f3 0f b8 c7          	popcnt %edi,%eax
1273     1273:	f3 0f b8 c7          	popcnt %edi,%eax
1277     1277:	f3 0f b8 c7          	popcnt %edi,%eax
127b     127b:	f3 0f b8 c7          	popcnt %edi,%eax
127f     127f:	f3 0f b8 c7          	popcnt %edi,%eax
1283     1283:	f3 0f b8 c7          	popcnt %edi,%eax
1287     1287:	f3 0f b8 c7          	popcnt %edi,%eax
128b     128b:	f3 0f b8 c7          	popcnt %edi,%eax
128f     128f:	f3 0f b8 c7          	popcnt %edi,%eax
1293     1293:	f3 0f b8 c7          	popcnt %edi,%eax
1297     1297:	f3 0f b8 c7          	popcnt %edi,%eax
129b     129b:	f3 0f b8 c7          	popcnt %edi,%eax
129f     129f:	f3 0f b8 c7          	popcnt %edi,%eax
12a3     12a3:	f3 0f b8 c7          	popcnt %edi,%eax
12a7     12a7:	f3 0f b8 c7          	popcnt %edi,%eax
12ab     12ab:	f3 0f b8 c7          	popcnt %edi,%eax
12af     12af:	f3 0f b8 c7          	popcnt %edi,%eax
12b3     12b3:	f3 0f b8 c7          	popcnt %edi,%eax
12b7     12b7:	f3 0f b8 c7          	popcnt %edi,%eax
12bb     12bb:	f3 0f b8 c7          	popcnt %edi,%eax
12bf     12bf:	f3 0f b8 c7          	popcnt %edi,%eax
12c3     12c3:	f3 0f b8 c7          	popcnt %edi,%eax
12c7     12c7:	f3 0f b8 c7          	popcnt %edi,%eax
12cb     12cb:	f3 0f b8 c7          	popcnt %edi,%eax
12cf     12cf:	f3 0f b8 c7          	popcnt %edi,%eax
12d3     12d3:	f3 0f b8 c7          	popcnt %edi,%eax
12d7     12d7:	f3 0f b8 c7          	popcnt %edi,%eax
12db     12db:	f3 0f b8 c7          	popcnt %edi,%eax
12df     12df:	f3 48 0f b8 c7       	popcnt %rdi,%rax
12e4     12e4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
12e9     12e9:	f3 0f b8 c7          	popcnt %edi,%eax
12ed     12ed:	f3 0f b8 c7          	popcnt %edi,%eax
12f1     12f1:	f3 0f b8 c7          	popcnt %edi,%eax
12f5     12f5:	e8 00 00 00 00       	call   12fa <.altinstr_replacement+0x12fa>	12f6: R_X86_64_PLT32	clear_page_rep-0x4
12fa     12fa:	e8 00 00 00 00       	call   12ff <.altinstr_replacement+0x12ff>	12fb: R_X86_64_PLT32	clear_page_erms-0x4
12ff     12ff:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1304     1304:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1309     1309:	f3 0f b8 c7          	popcnt %edi,%eax
130d     130d:	f3 0f b8 c7          	popcnt %edi,%eax
1311     1311:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1316     1316:	f3 0f b8 c7          	popcnt %edi,%eax
131a     131a:	f3 0f b8 c7          	popcnt %edi,%eax
131e     131e:	f3 0f b8 c7          	popcnt %edi,%eax
1322     1322:	f3 0f b8 c7          	popcnt %edi,%eax
1326     1326:	f3 0f b8 c7          	popcnt %edi,%eax
132a     132a:	e9 00 00 00 00       	jmp    132f <.altinstr_replacement+0x132f>	132b: R_X86_64_PLT32	.text+0xf79dea
132f     132f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1334     1334:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1339     1339:	f3 48 0f b8 c7       	popcnt %rdi,%rax
133e     133e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1343     1343:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1348     1348:	f3 48 0f b8 c7       	popcnt %rdi,%rax
134d     134d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1352     1352:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1357     1357:	f3 48 0f b8 c7       	popcnt %rdi,%rax
135c     135c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1361     1361:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1366     1366:	f3 48 0f b8 c7       	popcnt %rdi,%rax
136b     136b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1370     1370:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1375     1375:	f3 48 0f b8 c7       	popcnt %rdi,%rax
137a     137a:	f3 0f b8 c7          	popcnt %edi,%eax
137e     137e:	f3 0f b8 c7          	popcnt %edi,%eax
1382     1382:	f3 0f b8 c7          	popcnt %edi,%eax
1386     1386:	f3 0f b8 c7          	popcnt %edi,%eax
138a     138a:	f3 0f b8 c7          	popcnt %edi,%eax
138e     138e:	f3 0f b8 c7          	popcnt %edi,%eax
1392     1392:	f3 0f b8 c7          	popcnt %edi,%eax
1396     1396:	f3 0f b8 c7          	popcnt %edi,%eax
139a     139a:	f3 0f b8 c7          	popcnt %edi,%eax
139e     139e:	f3 0f b8 c7          	popcnt %edi,%eax
13a2     13a2:	f3 0f b8 c7          	popcnt %edi,%eax
13a6     13a6:	f3 0f b8 c7          	popcnt %edi,%eax
13aa     13aa:	f3 0f b8 c7          	popcnt %edi,%eax
13ae     13ae:	f3 0f b8 c7          	popcnt %edi,%eax
13b2     13b2:	f3 0f b8 c7          	popcnt %edi,%eax
13b6     13b6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
13bb     13bb:	f3 0f b8 c7          	popcnt %edi,%eax
13bf     13bf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
13c4     13c4:	e9 00 00 00 00       	jmp    13c9 <.altinstr_replacement+0x13c9>	13c5: R_X86_64_PLT32	.text+0x107a25c
13c9     13c9:	e9 00 00 00 00       	jmp    13ce <.altinstr_replacement+0x13ce>	13ca: R_X86_64_PLT32	.text+0x10af0f2
13ce     13ce:	e9 00 00 00 00       	jmp    13d3 <.altinstr_replacement+0x13d3>	13cf: R_X86_64_PLT32	.text+0x10af190
13d3     13d3:	0f 01 cb             	stac
13d6     13d6:	0f 01 ca             	clac
13d9     13d9:	0f 01 cb             	stac
13dc     13dc:	0f 01 ca             	clac
13df     13df:	0f 01 cb             	stac
13e2     13e2:	e8 00 00 00 00       	call   13e7 <.altinstr_replacement+0x13e7>	13e3: R_X86_64_PLT32	rep_movs_alternative-0x4
13e7     13e7:	0f 01 ca             	clac
13ea     13ea:	0f 01 cb             	stac
13ed     13ed:	0f ae e8             	lfence
13f0     13f0:	0f 01 ca             	clac
13f3     13f3:	0f 01 cb             	stac
13f6     13f6:	0f ae e8             	lfence
13f9     13f9:	0f 01 ca             	clac
13fc     13fc:	0f ae e8             	lfence
13ff     13ff:	0f 31                	rdtsc
1401     1401:	0f 01 f9             	rdtscp
1404     1404:	0f ae e8             	lfence
1407     1407:	0f 31                	rdtsc
1409     1409:	0f 01 f9             	rdtscp
140c     140c:	0f ae e8             	lfence
140f     140f:	0f 31                	rdtsc
1411     1411:	0f 01 f9             	rdtscp
1414     1414:	0f ae e8             	lfence
1417     1417:	0f 31                	rdtsc
1419     1419:	0f 01 f9             	rdtscp
141c     141c:	0f ae e8             	lfence
141f     141f:	0f 31                	rdtsc
1421     1421:	0f 01 f9             	rdtscp
1424     1424:	0f ae e8             	lfence
1427     1427:	0f 31                	rdtsc
1429     1429:	0f 01 f9             	rdtscp
142c     142c:	0f 01 cb             	stac
142f     142f:	0f 01 ca             	clac
1432     1432:	0f 01 cb             	stac
1435     1435:	0f 01 ca             	clac
1438     1438:	0f 01 cb             	stac
143b     143b:	0f 01 ca             	clac
143e     143e:	0f 01 cb             	stac
1441     1441:	0f 01 ca             	clac
1444     1444:	0f 01 cb             	stac
1447     1447:	0f ae e8             	lfence
144a     144a:	0f 01 ca             	clac
144d     144d:	0f 01 cb             	stac
1450     1450:	0f ae e8             	lfence
1453     1453:	0f 01 ca             	clac
1456     1456:	0f 01 cb             	stac
1459     1459:	0f ae e8             	lfence
145c     145c:	0f 01 ca             	clac
145f     145f:	0f 01 cb             	stac
1462     1462:	0f ae e8             	lfence
1465     1465:	0f 01 ca             	clac
1468     1468:	0f 01 ca             	clac
146b     146b:	0f 01 cb             	stac
146e     146e:	e8 00 00 00 00       	call   1473 <.altinstr_replacement+0x1473>	146f: R_X86_64_PLT32	rep_movs_alternative-0x4
1473     1473:	0f 01 ca             	clac
1476     1476:	e9 00 00 00 00       	jmp    147b <.altinstr_replacement+0x147b>	1477: R_X86_64_PLT32	.noinstr.text+0x4b85
147b     147b:	0f 01 cb             	stac
147e     147e:	0f 01 ca             	clac
1481     1481:	0f 01 cb             	stac
1484     1484:	0f 01 ca             	clac
1487     1487:	0f 01 cb             	stac
148a     148a:	0f 01 ca             	clac
148d     148d:	0f 01 cb             	stac
1490     1490:	0f 01 ca             	clac
1493     1493:	0f 01 cb             	stac
1496     1496:	0f 01 ca             	clac
1499     1499:	0f 01 cb             	stac
149c     149c:	0f 01 ca             	clac
149f     149f:	0f 01 cb             	stac
14a2     14a2:	0f 01 ca             	clac
14a5     14a5:	0f 01 cb             	stac
14a8     14a8:	0f 01 ca             	clac
14ab     14ab:	0f 01 ca             	clac
14ae     14ae:	0f 01 cb             	stac
14b1     14b1:	e8 00 00 00 00       	call   14b6 <.altinstr_replacement+0x14b6>	14b2: R_X86_64_PLT32	rep_movs_alternative-0x4
14b6     14b6:	0f 01 ca             	clac
14b9     14b9:	66 0f ae 38          	clflushopt (%rax)
14bd     14bd:	66 0f ae 30          	clwb   (%rax)
14c1     14c1:	0f 01 cb             	stac
14c4     14c4:	0f 01 ca             	clac
14c7     14c7:	66 0f ae 38          	clflushopt (%rax)
14cb     14cb:	66 0f ae 30          	clwb   (%rax)
14cf     14cf:	66 0f ae 38          	clflushopt (%rax)
14d3     14d3:	66 0f ae 30          	clwb   (%rax)
14d7     14d7:	66 0f ae 38          	clflushopt (%rax)
14db     14db:	66 0f ae 30          	clwb   (%rax)
14df     14df:	66 0f ae 38          	clflushopt (%rax)
14e3     14e3:	66 0f ae 30          	clwb   (%rax)
14e7     14e7:	66 0f ae 38          	clflushopt (%rax)
14eb     14eb:	66 0f ae 30          	clwb   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
