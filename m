Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B313017742;
	Tue, 11 Jul 2023 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689066194; x=1720602194;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uLCNOJFx5Fn3ot4utw30UIs+duKR+DjC3izTt/wMNVI=;
  b=Qc5Pcmp0cFDYYwULS9Rr6oBMZqvyDVOVblqwnBmxkE7NvSCn4iEjeQUq
   v4qgx7GbcH1+sQGxsLSOYbG6h2WLc5MCfgfzIiBzDe5rFvTyiTa5bjnw3
   8vVTCTsAUZrNhMdbOqKo8aDNoZKiPIdk4jqJe9IMIOCzbLC+ZqadaeQ2F
   GDUIap76Z61BMY+TNBXwNHIinAzF5ikZyrBRqRLwuzwKv1KneAkcGElll
   fT2RBSoRT4/KH9JDC68PhC56HMLuQUgfz8n26S89OYiNO2xVw9ivTyxkh
   vvPd8rpQq985tZlZtPP83ZOf+WH6Pt/Asah3IqEOZ3WdJx2RAl6Qz4GPY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450929051"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="450929051"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 02:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750681346"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="750681346"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Jul 2023 02:02:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ9Go-0004f1-1d;
	Tue, 11 Jul 2023 09:02:54 +0000
Date: Tue, 11 Jul 2023 17:02:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [axboe-block:io_uring-waitid 17/17] io_uring/waitid.o: warning:
 objtool: .altinstr_replacement+0x6: redundant UACCESS disable
Message-ID: <202307111621.jK5J75kR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-waitid
head:   f800a6a1294ea7f9e1e54e88ce0e17aef68b77ce
commit: f800a6a1294ea7f9e1e54e88ce0e17aef68b77ce [17/17] io_uring: add IORING_OP_WAITID support
config: x86_64-randconfig-r015-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111621.jK5J75kR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111621.jK5J75kR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111621.jK5J75kR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/waitid.o: warning: objtool: .altinstr_replacement+0x6: redundant UACCESS disable


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
0156      156:	0f ae f0             	mfence
0159      159:	b8 2b 00 00 00       	mov    $0x2b,%eax
015e      15e:	8e e8                	mov    %eax,%gs
0160      160:	0f ae e8             	lfence
0163      163:	0f ae e8             	lfence
0166      166:	0f ae e8             	lfence
0169      169:	0f ae e8             	lfence
016c      16c:	0f 01 ca             	clac
016f      16f:	0f ae e8             	lfence
0172      172:	e9 00 00 00 00       	jmp    177 <.altinstr_replacement+0x177>	173: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
0177      177:	e9 00 00 00 00       	jmp    17c <.altinstr_replacement+0x17c>	178: R_X86_64_PLT32	swapgs_restore_regs_and_return_to_usermode-0x4
017c      17c:	0f 01 ca             	clac
017f      17f:	e9 00 00 00 00       	jmp    184 <.altinstr_replacement+0x184>	180: R_X86_64_PLT32	.entry.text+0x18e7
0184      184:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0189      189:	f3 48 0f b8 c7       	popcnt %rdi,%rax
018e      18e:	e9 00 00 00 00       	jmp    193 <.altinstr_replacement+0x193>	18f: R_X86_64_PLT32	.text+0xc85f
0193      193:	0f ae e8             	lfence
0196      196:	0f 31                	rdtsc
0198      198:	0f 01 f9             	rdtscp
019b      19b:	0f ae e8             	lfence
019e      19e:	0f 31                	rdtsc
01a0      1a0:	0f 01 f9             	rdtscp
01a3      1a3:	e9 00 00 00 00       	jmp    1a8 <.altinstr_replacement+0x1a8>	1a4: R_X86_64_PLT32	.init.text+0xb30f
01a8      1a8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01ad      1ad:	f3 48 0f b8 c7       	popcnt %rdi,%rax
01b2      1b2:	e9 00 00 00 00       	jmp    1b7 <.altinstr_replacement+0x1b7>	1b3: R_X86_64_PLT32	.text+0x2b423
01b7      1b7:	e9 00 00 00 00       	jmp    1bc <.altinstr_replacement+0x1bc>	1b8: R_X86_64_PLT32	.text+0x2c850
01bc      1bc:	e9 00 00 00 00       	jmp    1c1 <.altinstr_replacement+0x1c1>	1bd: R_X86_64_PLT32	.text+0x2c859
01c1      1c1:	e9 00 00 00 00       	jmp    1c6 <.altinstr_replacement+0x1c6>	1c2: R_X86_64_PLT32	.text+0x2c862
01c6      1c6:	e9 00 00 00 00       	jmp    1cb <.altinstr_replacement+0x1cb>	1c7: R_X86_64_PLT32	.text+0x2c86b
01cb      1cb:	e9 00 00 00 00       	jmp    1d0 <.altinstr_replacement+0x1d0>	1cc: R_X86_64_PLT32	.text+0x2cd87
01d0      1d0:	e9 00 00 00 00       	jmp    1d5 <.altinstr_replacement+0x1d5>	1d1: R_X86_64_PLT32	.text+0x2cd99
01d5      1d5:	e9 00 00 00 00       	jmp    1da <.altinstr_replacement+0x1da>	1d6: R_X86_64_PLT32	.text+0x2cdbd
01da      1da:	e9 00 00 00 00       	jmp    1df <.altinstr_replacement+0x1df>	1db: R_X86_64_PLT32	.text+0x2cdc6
01df      1df:	e9 00 00 00 00       	jmp    1e4 <.altinstr_replacement+0x1e4>	1e0: R_X86_64_PLT32	.text+0x2cebe
01e4      1e4:	e9 00 00 00 00       	jmp    1e9 <.altinstr_replacement+0x1e9>	1e5: R_X86_64_PLT32	.text+0x2cd90
01e9      1e9:	e9 00 00 00 00       	jmp    1ee <.altinstr_replacement+0x1ee>	1ea: R_X86_64_PLT32	.text+0x2cda2
01ee      1ee:	e9 00 00 00 00       	jmp    1f3 <.altinstr_replacement+0x1f3>	1ef: R_X86_64_PLT32	.text+0x2cdab
01f3      1f3:	e9 00 00 00 00       	jmp    1f8 <.altinstr_replacement+0x1f8>	1f4: R_X86_64_PLT32	.text+0x2cdb4
01f8      1f8:	e9 00 00 00 00       	jmp    1fd <.altinstr_replacement+0x1fd>	1f9: R_X86_64_PLT32	.text+0x2ceb8
01fd      1fd:	e9 00 00 00 00       	jmp    202 <.altinstr_replacement+0x202>	1fe: R_X86_64_PLT32	.text+0x2d292
0202      202:	e9 00 00 00 00       	jmp    207 <.altinstr_replacement+0x207>	203: R_X86_64_PLT32	.text+0x2d3d5
0207      207:	e9 00 00 00 00       	jmp    20c <.altinstr_replacement+0x20c>	208: R_X86_64_PLT32	.text+0x2d51b
020c      20c:	e9 00 00 00 00       	jmp    211 <.altinstr_replacement+0x211>	20d: R_X86_64_PLT32	.text+0x2d82b
0211      211:	e9 00 00 00 00       	jmp    216 <.altinstr_replacement+0x216>	212: R_X86_64_PLT32	.text+0x2db2f
0216      216:	e9 00 00 00 00       	jmp    21b <.altinstr_replacement+0x21b>	217: R_X86_64_PLT32	.text+0x2db97
021b      21b:	e9 00 00 00 00       	jmp    220 <.altinstr_replacement+0x220>	21c: R_X86_64_PLT32	.text+0x2d9c3
0220      220:	e9 00 00 00 00       	jmp    225 <.altinstr_replacement+0x225>	221: R_X86_64_PLT32	.text+0x2da6e
0225      225:	e9 00 00 00 00       	jmp    22a <.altinstr_replacement+0x22a>	226: R_X86_64_PLT32	.text+0x2dcf3
022a      22a:	e9 00 00 00 00       	jmp    22f <.altinstr_replacement+0x22f>	22b: R_X86_64_PLT32	.text+0x2ee4e
022f      22f:	e9 00 00 00 00       	jmp    234 <.altinstr_replacement+0x234>	230: R_X86_64_PLT32	.text+0x2f60a
0234      234:	e9 00 00 00 00       	jmp    239 <.altinstr_replacement+0x239>	235: R_X86_64_PLT32	.text+0x2f777
0239      239:	e9 00 00 00 00       	jmp    23e <.altinstr_replacement+0x23e>	23a: R_X86_64_PLT32	.text+0x2fc43
023e      23e:	e8 00 00 00 00       	call   243 <.altinstr_replacement+0x243>	23f: R_X86_64_PLT32	clear_page_rep-0x4
0243      243:	e8 00 00 00 00       	call   248 <.altinstr_replacement+0x248>	244: R_X86_64_PLT32	clear_page_erms-0x4
0248      248:	e9 00 00 00 00       	jmp    24d <.altinstr_replacement+0x24d>	249: R_X86_64_PLT32	.text+0x39a24
024d      24d:	e9 00 00 00 00       	jmp    252 <.altinstr_replacement+0x252>	24e: R_X86_64_PLT32	.text+0x39cad
0252      252:	e9 00 00 00 00       	jmp    257 <.altinstr_replacement+0x257>	253: R_X86_64_PLT32	.text+0x39fca
0257      257:	e9 00 00 00 00       	jmp    25c <.altinstr_replacement+0x25c>	258: R_X86_64_PLT32	.text+0x3ab30
025c      25c:	e9 00 00 00 00       	jmp    261 <.altinstr_replacement+0x261>	25d: R_X86_64_PLT32	.text+0x3ac10
0261      261:	e9 00 00 00 00       	jmp    266 <.altinstr_replacement+0x266>	262: R_X86_64_PLT32	.text+0x3ac65
0266      266:	e9 00 00 00 00       	jmp    26b <.altinstr_replacement+0x26b>	267: R_X86_64_PLT32	.text+0x3b964
026b      26b:	e9 00 00 00 00       	jmp    270 <.altinstr_replacement+0x270>	26c: R_X86_64_PLT32	.text+0x3b9ac
0270      270:	e9 00 00 00 00       	jmp    275 <.altinstr_replacement+0x275>	271: R_X86_64_PLT32	.text+0x3b2a2
0275      275:	e9 00 00 00 00       	jmp    27a <.altinstr_replacement+0x27a>	276: R_X86_64_PLT32	.text+0x3b36b
027a      27a:	e9 00 00 00 00       	jmp    27f <.altinstr_replacement+0x27f>	27b: R_X86_64_PLT32	.text+0x3bbdb
027f      27f:	e9 00 00 00 00       	jmp    284 <.altinstr_replacement+0x284>	280: R_X86_64_PLT32	.text+0x3bde6
0284      284:	e9 00 00 00 00       	jmp    289 <.altinstr_replacement+0x289>	285: R_X86_64_PLT32	.text+0x3be05
0289      289:	e9 00 00 00 00       	jmp    28e <.altinstr_replacement+0x28e>	28a: R_X86_64_PLT32	.text+0x3be5b
028e      28e:	e9 00 00 00 00       	jmp    293 <.altinstr_replacement+0x293>	28f: R_X86_64_PLT32	.text+0x3be89
0293      293:	e9 00 00 00 00       	jmp    298 <.altinstr_replacement+0x298>	294: R_X86_64_PLT32	.text+0x3bede
0298      298:	e9 00 00 00 00       	jmp    29d <.altinstr_replacement+0x29d>	299: R_X86_64_PLT32	.text+0x3bf33
029d      29d:	e9 00 00 00 00       	jmp    2a2 <.altinstr_replacement+0x2a2>	29e: R_X86_64_PLT32	.text+0x3bfe4
02a2      2a2:	e9 00 00 00 00       	jmp    2a7 <.altinstr_replacement+0x2a7>	2a3: R_X86_64_PLT32	.text+0x3c712
02a7      2a7:	0f 01 cb             	stac
02aa      2aa:	0f ae e8             	lfence
02ad      2ad:	0f 01 ca             	clac
02b0      2b0:	0f 01 ca             	clac
02b3      2b3:	e9 00 00 00 00       	jmp    2b8 <.altinstr_replacement+0x2b8>	2b4: R_X86_64_PLT32	.noinstr.text+0xa2a
02b8      2b8:	e9 00 00 00 00       	jmp    2bd <.altinstr_replacement+0x2bd>	2b9: R_X86_64_PLT32	.noinstr.text+0xe6e
02bd      2bd:	e9 00 00 00 00       	jmp    2c2 <.altinstr_replacement+0x2c2>	2be: R_X86_64_PLT32	.noinstr.text+0x1297
02c2      2c2:	e9 00 00 00 00       	jmp    2c7 <.altinstr_replacement+0x2c7>	2c3: R_X86_64_PLT32	.init.text+0x10540
02c7      2c7:	c6 07 00             	movb   $0x0,(%rdi)
02ca      2ca:	e9 00 00 00 00       	jmp    2cf <.altinstr_replacement+0x2cf>	2cb: R_X86_64_PLT32	.noinstr.text+0x18af
02cf      2cf:	0f 01 cb             	stac
02d2      2d2:	0f ae e8             	lfence
02d5      2d5:	0f 01 ca             	clac
02d8      2d8:	0f 01 ca             	clac
02db      2db:	0f 01 cb             	stac
02de      2de:	0f ae e8             	lfence
02e1      2e1:	0f 01 ca             	clac
02e4      2e4:	0f 01 ca             	clac
02e7      2e7:	0f 01 cb             	stac
02ea      2ea:	0f ae e8             	lfence
02ed      2ed:	e9 00 00 00 00       	jmp    2f2 <.altinstr_replacement+0x2f2>	2ee: R_X86_64_PLT32	.text+0x4e33c
02f2      2f2:	0f 01 ca             	clac
02f5      2f5:	0f 01 ca             	clac
02f8      2f8:	e9 00 00 00 00       	jmp    2fd <.altinstr_replacement+0x2fd>	2f9: R_X86_64_PLT32	.text+0x4e998
02fd      2fd:	e9 00 00 00 00       	jmp    302 <.altinstr_replacement+0x302>	2fe: R_X86_64_PLT32	.text+0x53ee9
0302      302:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0307      307:	f3 48 0f b8 c7       	popcnt %rdi,%rax
030c      30c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0311      311:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0316      316:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 31d <.altinstr_replacement+0x31d>	319: R_X86_64_PC32	.init.data+0x4eec4
031d      31d:	e8 00 00 00 00       	call   322 <.altinstr_replacement+0x322>	31e: R_X86_64_PLT32	__alt_reloc_selftest-0x4
0322      322:	e9 00 00 00 00       	jmp    327 <.altinstr_replacement+0x327>	323: R_X86_64_PLT32	.text+0x559c6
0327      327:	f3 48 0f b8 c7       	popcnt %rdi,%rax
032c      32c:	e9 00 00 00 00       	jmp    331 <.altinstr_replacement+0x331>	32d: R_X86_64_PLT32	.init.text+0x1b045
0331      331:	0f ae e8             	lfence
0334      334:	0f 31                	rdtsc
0336      336:	0f 01 f9             	rdtscp
0339      339:	e9 00 00 00 00       	jmp    33e <.altinstr_replacement+0x33e>	33a: R_X86_64_PLT32	.text+0x5be98
033e      33e:	e9 00 00 00 00       	jmp    343 <.altinstr_replacement+0x343>	33f: R_X86_64_PLT32	.text+0x5c356
0343      343:	e9 00 00 00 00       	jmp    348 <.altinstr_replacement+0x348>	344: R_X86_64_PLT32	.text+0x5c9d1
0348      348:	e9 00 00 00 00       	jmp    34d <.altinstr_replacement+0x34d>	349: R_X86_64_PLT32	.text+0x5cd1b
034d      34d:	e9 00 00 00 00       	jmp    352 <.altinstr_replacement+0x352>	34e: R_X86_64_PLT32	.text+0x5cd8a
0352      352:	e9 00 00 00 00       	jmp    357 <.altinstr_replacement+0x357>	353: R_X86_64_PLT32	.text+0x5cd22
0357      357:	e9 00 00 00 00       	jmp    35c <.altinstr_replacement+0x35c>	358: R_X86_64_PLT32	.text+0x5c8d5
035c      35c:	e9 00 00 00 00       	jmp    361 <.altinstr_replacement+0x361>	35d: R_X86_64_PLT32	.text+0x5d665
0361      361:	e9 00 00 00 00       	jmp    366 <.altinstr_replacement+0x366>	362: R_X86_64_PLT32	.text+0x5d936
0366      366:	e9 00 00 00 00       	jmp    36b <.altinstr_replacement+0x36b>	367: R_X86_64_PLT32	.text+0x5dd59
036b      36b:	e9 00 00 00 00       	jmp    370 <.altinstr_replacement+0x370>	36c: R_X86_64_PLT32	.text+0x5ddab
0370      370:	e9 00 00 00 00       	jmp    375 <.altinstr_replacement+0x375>	371: R_X86_64_PLT32	.text+0x5ddbd
0375      375:	e9 00 00 00 00       	jmp    37a <.altinstr_replacement+0x37a>	376: R_X86_64_PLT32	.text+0x5de2c
037a      37a:	e9 00 00 00 00       	jmp    37f <.altinstr_replacement+0x37f>	37b: R_X86_64_PLT32	.text+0x5dd60
037f      37f:	e9 00 00 00 00       	jmp    384 <.altinstr_replacement+0x384>	380: R_X86_64_PLT32	.text+0x5d3aa
0384      384:	e9 00 00 00 00       	jmp    389 <.altinstr_replacement+0x389>	385: R_X86_64_PLT32	.text+0x5ddc4
0389      389:	e9 00 00 00 00       	jmp    38e <.altinstr_replacement+0x38e>	38a: R_X86_64_PLT32	.text+0x5d4cc
038e      38e:	e9 00 00 00 00       	jmp    393 <.altinstr_replacement+0x393>	38f: R_X86_64_PLT32	.text+0x5fdf4
0393      393:	48 0f ae 37          	xsaveopt64 (%rdi)
0397      397:	48 0f c7 27          	xsavec64 (%rdi)
039b      39b:	48 0f c7 2f          	xsaves64 (%rdi)
039f      39f:	e9 00 00 00 00       	jmp    3a4 <.altinstr_replacement+0x3a4>	3a0: R_X86_64_PLT32	.text+0x5fe7d
03a4      3a4:	e9 00 00 00 00       	jmp    3a9 <.altinstr_replacement+0x3a9>	3a5: R_X86_64_PLT32	.text+0x5ff7d
03a9      3a9:	48 0f c7 1f          	xrstors64 (%rdi)
03ad      3ad:	e9 00 00 00 00       	jmp    3b2 <.altinstr_replacement+0x3b2>	3ae: R_X86_64_PLT32	.text+0x60457
03b2      3b2:	e9 00 00 00 00       	jmp    3b7 <.altinstr_replacement+0x3b7>	3b3: R_X86_64_PLT32	.text+0x60dde
03b7      3b7:	e9 00 00 00 00       	jmp    3bc <.altinstr_replacement+0x3bc>	3b8: R_X86_64_PLT32	.text+0x60b2c
03bc      3bc:	48 0f c7 1f          	xrstors64 (%rdi)
03c0      3c0:	e9 00 00 00 00       	jmp    3c5 <.altinstr_replacement+0x3c5>	3c1: R_X86_64_PLT32	.text+0x611b2
03c5      3c5:	48 0f c7 1f          	xrstors64 (%rdi)
03c9      3c9:	e9 00 00 00 00       	jmp    3ce <.altinstr_replacement+0x3ce>	3ca: R_X86_64_PLT32	.text+0x61161
03ce      3ce:	e9 00 00 00 00       	jmp    3d3 <.altinstr_replacement+0x3d3>	3cf: R_X86_64_PLT32	.text+0x614dd
03d3      3d3:	e9 00 00 00 00       	jmp    3d8 <.altinstr_replacement+0x3d8>	3d4: R_X86_64_PLT32	.noinstr.text+0x1e21
03d8      3d8:	e9 00 00 00 00       	jmp    3dd <.altinstr_replacement+0x3dd>	3d9: R_X86_64_PLT32	.text+0x61bc8
03dd      3dd:	e9 00 00 00 00       	jmp    3e2 <.altinstr_replacement+0x3e2>	3de: R_X86_64_PLT32	.text+0x61ed3
03e2      3e2:	0f 01 cb             	stac
03e5      3e5:	e8 00 00 00 00       	call   3ea <.altinstr_replacement+0x3ea>	3e6: R_X86_64_PLT32	rep_movs_alternative-0x4
03ea      3ea:	0f 01 ca             	clac
03ed      3ed:	e9 00 00 00 00       	jmp    3f2 <.altinstr_replacement+0x3f2>	3ee: R_X86_64_PLT32	.text+0x61fc2
03f2      3f2:	e9 00 00 00 00       	jmp    3f7 <.altinstr_replacement+0x3f7>	3f3: R_X86_64_PLT32	.text+0x620d0
03f7      3f7:	e9 00 00 00 00       	jmp    3fc <.altinstr_replacement+0x3fc>	3f8: R_X86_64_PLT32	.text+0x62c7b
03fc      3fc:	e9 00 00 00 00       	jmp    401 <.altinstr_replacement+0x401>	3fd: R_X86_64_PLT32	.text+0x62e94
0401      401:	0f 01 cb             	stac
0404      404:	e8 00 00 00 00       	call   409 <.altinstr_replacement+0x409>	405: R_X86_64_PLT32	rep_movs_alternative-0x4
0409      409:	0f 01 ca             	clac
040c      40c:	e9 00 00 00 00       	jmp    411 <.altinstr_replacement+0x411>	40d: R_X86_64_PLT32	.text+0x62fc4
0411      411:	0f 01 cb             	stac
0414      414:	e8 00 00 00 00       	call   419 <.altinstr_replacement+0x419>	415: R_X86_64_PLT32	rep_stos_alternative-0x4
0419      419:	0f 01 ca             	clac
041c      41c:	e9 00 00 00 00       	jmp    421 <.altinstr_replacement+0x421>	41d: R_X86_64_PLT32	.text+0x634b5
0421      421:	0f 01 cb             	stac
0424      424:	0f 01 ca             	clac
0427      427:	0f 01 cb             	stac
042a      42a:	e8 00 00 00 00       	call   42f <.altinstr_replacement+0x42f>	42b: R_X86_64_PLT32	rep_stos_alternative-0x4
042f      42f:	0f 01 ca             	clac
0432      432:	0f 01 cb             	stac
0435      435:	0f 01 ca             	clac
0438      438:	0f 01 cb             	stac
043b      43b:	e8 00 00 00 00       	call   440 <.altinstr_replacement+0x440>	43c: R_X86_64_PLT32	rep_movs_alternative-0x4
0440      440:	0f 01 ca             	clac
0443      443:	0f 01 cb             	stac
0446      446:	e8 00 00 00 00       	call   44b <.altinstr_replacement+0x44b>	447: R_X86_64_PLT32	rep_movs_alternative-0x4
044b      44b:	0f 01 ca             	clac
044e      44e:	e9 00 00 00 00       	jmp    453 <.altinstr_replacement+0x453>	44f: R_X86_64_PLT32	.text+0x637e9
0453      453:	e9 00 00 00 00       	jmp    458 <.altinstr_replacement+0x458>	454: R_X86_64_PLT32	.text+0x63981
0458      458:	e9 00 00 00 00       	jmp    45d <.altinstr_replacement+0x45d>	459: R_X86_64_PLT32	.text+0x64533
045d      45d:	0f 01 cb             	stac
0460      460:	e8 00 00 00 00       	call   465 <.altinstr_replacement+0x465>	461: R_X86_64_PLT32	rep_movs_alternative-0x4
0465      465:	0f 01 ca             	clac
0468      468:	e9 00 00 00 00       	jmp    46d <.altinstr_replacement+0x46d>	469: R_X86_64_PLT32	.text+0x64043
046d      46d:	0f 01 cb             	stac
0470      470:	0f 01 ca             	clac
0473      473:	0f 01 cb             	stac
0476      476:	0f 01 ca             	clac
0479      479:	48 0f c7 1f          	xrstors64 (%rdi)
047d      47d:	0f 01 cb             	stac
0480      480:	0f 01 ca             	clac
0483      483:	48 0f c7 1f          	xrstors64 (%rdi)
0487      487:	0f 01 cb             	stac
048a      48a:	e8 00 00 00 00       	call   48f <.altinstr_replacement+0x48f>	48b: R_X86_64_PLT32	rep_movs_alternative-0x4
048f      48f:	0f 01 ca             	clac
0492      492:	e9 00 00 00 00       	jmp    497 <.altinstr_replacement+0x497>	493: R_X86_64_PLT32	.text+0x6426f
0497      497:	0f 01 cb             	stac
049a      49a:	e8 00 00 00 00       	call   49f <.altinstr_replacement+0x49f>	49b: R_X86_64_PLT32	rep_movs_alternative-0x4
049f      49f:	0f 01 ca             	clac
04a2      4a2:	e9 00 00 00 00       	jmp    4a7 <.altinstr_replacement+0x4a7>	4a3: R_X86_64_PLT32	.text+0x64386
04a7      4a7:	e9 00 00 00 00       	jmp    4ac <.altinstr_replacement+0x4ac>	4a8: R_X86_64_PLT32	.text+0x6460f
04ac      4ac:	e9 00 00 00 00       	jmp    4b1 <.altinstr_replacement+0x4b1>	4ad: R_X86_64_PLT32	.text+0x646a3
04b1      4b1:	e9 00 00 00 00       	jmp    4b6 <.altinstr_replacement+0x4b6>	4b2: R_X86_64_PLT32	.init.text+0x1c067
04b6      4b6:	48 0f ae 37          	xsaveopt64 (%rdi)
04ba      4ba:	48 0f c7 27          	xsavec64 (%rdi)
04be      4be:	48 0f c7 2f          	xsaves64 (%rdi)
04c2      4c2:	e9 00 00 00 00       	jmp    4c7 <.altinstr_replacement+0x4c7>	4c3: R_X86_64_PLT32	.text+0x64994
04c7      4c7:	e9 00 00 00 00       	jmp    4cc <.altinstr_replacement+0x4cc>	4c8: R_X86_64_PLT32	.text+0x64c32
04cc      4cc:	e9 00 00 00 00       	jmp    4d1 <.altinstr_replacement+0x4d1>	4cd: R_X86_64_PLT32	.text+0x64cc4
04d1      4d1:	e9 00 00 00 00       	jmp    4d6 <.altinstr_replacement+0x4d6>	4d2: R_X86_64_PLT32	.init.text+0x1c652
04d6      4d6:	e9 00 00 00 00       	jmp    4db <.altinstr_replacement+0x4db>	4d7: R_X86_64_PLT32	.init.text+0x1c293
04db      4db:	e9 00 00 00 00       	jmp    4e0 <.altinstr_replacement+0x4e0>	4dc: R_X86_64_PLT32	.init.text+0x1c67c
04e0      4e0:	e9 00 00 00 00       	jmp    4e5 <.altinstr_replacement+0x4e5>	4e1: R_X86_64_PLT32	.init.text+0x1c3ac
04e5      4e5:	e9 00 00 00 00       	jmp    4ea <.altinstr_replacement+0x4ea>	4e6: R_X86_64_PLT32	.init.text+0x1cc55
04ea      4ea:	e9 00 00 00 00       	jmp    4ef <.altinstr_replacement+0x4ef>	4eb: R_X86_64_PLT32	.init.text+0x1cd0f
04ef      4ef:	e9 00 00 00 00       	jmp    4f4 <.altinstr_replacement+0x4f4>	4f0: R_X86_64_PLT32	.text+0x64dfe
04f4      4f4:	e9 00 00 00 00       	jmp    4f9 <.altinstr_replacement+0x4f9>	4f5: R_X86_64_PLT32	.text+0x64e80
04f9      4f9:	e9 00 00 00 00       	jmp    4fe <.altinstr_replacement+0x4fe>	4fa: R_X86_64_PLT32	.text+0x64e43
04fe      4fe:	e9 00 00 00 00       	jmp    503 <.altinstr_replacement+0x503>	4ff: R_X86_64_PLT32	.text+0x65182
0503      503:	e9 00 00 00 00       	jmp    508 <.altinstr_replacement+0x508>	504: R_X86_64_PLT32	.text+0x65272
0508      508:	e9 00 00 00 00       	jmp    50d <.altinstr_replacement+0x50d>	509: R_X86_64_PLT32	.text+0x6521e
050d      50d:	e9 00 00 00 00       	jmp    512 <.altinstr_replacement+0x512>	50e: R_X86_64_PLT32	.text+0x65240
0512      512:	e9 00 00 00 00       	jmp    517 <.altinstr_replacement+0x517>	513: R_X86_64_PLT32	.text+0x65272
0517      517:	e9 00 00 00 00       	jmp    51c <.altinstr_replacement+0x51c>	518: R_X86_64_PLT32	.text+0x663b5
051c      51c:	e9 00 00 00 00       	jmp    521 <.altinstr_replacement+0x521>	51d: R_X86_64_PLT32	.text+0x66394
0521      521:	e9 00 00 00 00       	jmp    526 <.altinstr_replacement+0x526>	522: R_X86_64_PLT32	.text+0x66b03
0526      526:	e9 00 00 00 00       	jmp    52b <.altinstr_replacement+0x52b>	527: R_X86_64_PLT32	.text+0x66c40
052b      52b:	e9 00 00 00 00       	jmp    530 <.altinstr_replacement+0x530>	52c: R_X86_64_PLT32	.text+0x6765e
0530      530:	e9 00 00 00 00       	jmp    535 <.altinstr_replacement+0x535>	531: R_X86_64_PLT32	.text+0x67720
0535      535:	e9 00 00 00 00       	jmp    53a <.altinstr_replacement+0x53a>	536: R_X86_64_PLT32	.init.text+0x1d3b5
053a      53a:	e9 00 00 00 00       	jmp    53f <.altinstr_replacement+0x53f>	53b: R_X86_64_PLT32	.init.text+0x1d5e5
053f      53f:	e9 00 00 00 00       	jmp    544 <.altinstr_replacement+0x544>	540: R_X86_64_PLT32	.init.text+0x1d5ed
0544      544:	e9 00 00 00 00       	jmp    549 <.altinstr_replacement+0x549>	545: R_X86_64_PLT32	.text+0x67858
0549      549:	e9 00 00 00 00       	jmp    54e <.altinstr_replacement+0x54e>	54a: R_X86_64_PLT32	.init.text+0x1dacc
054e      54e:	e9 00 00 00 00       	jmp    553 <.altinstr_replacement+0x553>	54f: R_X86_64_PLT32	.text+0x6b362
0553      553:	0f 01 cb             	stac
0556      556:	e8 00 00 00 00       	call   55b <.altinstr_replacement+0x55b>	557: R_X86_64_PLT32	rep_movs_alternative-0x4
055b      55b:	0f 01 ca             	clac
055e      55e:	e9 00 00 00 00       	jmp    563 <.altinstr_replacement+0x563>	55f: R_X86_64_PLT32	.text+0x6f64d
0563      563:	e9 00 00 00 00       	jmp    568 <.altinstr_replacement+0x568>	564: R_X86_64_PLT32	.text+0x6f637
0568      568:	e9 00 00 00 00       	jmp    56d <.altinstr_replacement+0x56d>	569: R_X86_64_PLT32	.text+0x6f646
056d      56d:	e9 00 00 00 00       	jmp    572 <.altinstr_replacement+0x572>	56e: R_X86_64_PLT32	.text+0x6f651
0572      572:	e9 00 00 00 00       	jmp    577 <.altinstr_replacement+0x577>	573: R_X86_64_PLT32	.text+0x6f68b
0577      577:	e9 00 00 00 00       	jmp    57c <.altinstr_replacement+0x57c>	578: R_X86_64_PLT32	.text+0x6f6ab
057c      57c:	e9 00 00 00 00       	jmp    581 <.altinstr_replacement+0x581>	57d: R_X86_64_PLT32	.text+0x708ff
0581      581:	e9 00 00 00 00       	jmp    586 <.altinstr_replacement+0x586>	582: R_X86_64_PLT32	.text+0x72eb2
0586      586:	e9 00 00 00 00       	jmp    58b <.altinstr_replacement+0x58b>	587: R_X86_64_PLT32	.text+0x73329
058b      58b:	e9 00 00 00 00       	jmp    590 <.altinstr_replacement+0x590>	58c: R_X86_64_PLT32	.text+0x73329
0590      590:	e9 00 00 00 00       	jmp    595 <.altinstr_replacement+0x595>	591: R_X86_64_PLT32	.text+0x73329
0595      595:	e9 00 00 00 00       	jmp    59a <.altinstr_replacement+0x59a>	596: R_X86_64_PLT32	.text+0x7681d
059a      59a:	e9 00 00 00 00       	jmp    59f <.altinstr_replacement+0x59f>	59b: R_X86_64_PLT32	.init.text+0x1f497
059f      59f:	e9 00 00 00 00       	jmp    5a4 <.altinstr_replacement+0x5a4>	5a0: R_X86_64_PLT32	.text+0x768fe
05a4      5a4:	e9 00 00 00 00       	jmp    5a9 <.altinstr_replacement+0x5a9>	5a5: R_X86_64_PLT32	.text+0x76905
05a9      5a9:	e9 00 00 00 00       	jmp    5ae <.altinstr_replacement+0x5ae>	5aa: R_X86_64_PLT32	.text+0x768e4
05ae      5ae:	0f 30                	wrmsr
05b0      5b0:	e9 00 00 00 00       	jmp    5b5 <.altinstr_replacement+0x5b5>	5b1: R_X86_64_PLT32	.init.text+0x2204b
05b5      5b5:	e9 00 00 00 00       	jmp    5ba <.altinstr_replacement+0x5ba>	5b6: R_X86_64_PLT32	.init.text+0x22052
05ba      5ba:	e9 00 00 00 00       	jmp    5bf <.altinstr_replacement+0x5bf>	5bb: R_X86_64_PLT32	.text+0x78e0c
05bf      5bf:	e9 00 00 00 00       	jmp    5c4 <.altinstr_replacement+0x5c4>	5c0: R_X86_64_PLT32	.text+0x7909f
05c4      5c4:	e9 00 00 00 00       	jmp    5c9 <.altinstr_replacement+0x5c9>	5c5: R_X86_64_PLT32	.init.text+0x2220b
05c9      5c9:	e9 00 00 00 00       	jmp    5ce <.altinstr_replacement+0x5ce>	5ca: R_X86_64_PLT32	.text+0x79183
05ce      5ce:	f3 48 0f b8 c7       	popcnt %rdi,%rax
05d3      5d3:	e9 00 00 00 00       	jmp    5d8 <.altinstr_replacement+0x5d8>	5d4: R_X86_64_PLT32	.text+0x7c0d0
05d8      5d8:	e9 00 00 00 00       	jmp    5dd <.altinstr_replacement+0x5dd>	5d9: R_X86_64_PLT32	.text+0x8027f
05dd      5dd:	e9 00 00 00 00       	jmp    5e2 <.altinstr_replacement+0x5e2>	5de: R_X86_64_PLT32	.text+0x8027f
05e2      5e2:	e9 00 00 00 00       	jmp    5e7 <.altinstr_replacement+0x5e7>	5e3: R_X86_64_PLT32	.text+0x8047d
05e7      5e7:	e9 00 00 00 00       	jmp    5ec <.altinstr_replacement+0x5ec>	5e8: R_X86_64_PLT32	.text+0x822fd
05ec      5ec:	e9 00 00 00 00       	jmp    5f1 <.altinstr_replacement+0x5f1>	5ed: R_X86_64_PLT32	.text+0x82309
05f1      5f1:	e9 00 00 00 00       	jmp    5f6 <.altinstr_replacement+0x5f6>	5f2: R_X86_64_PLT32	.text+0x82315
05f6      5f6:	e9 00 00 00 00       	jmp    5fb <.altinstr_replacement+0x5fb>	5f7: R_X86_64_PLT32	.text+0x82903
05fb      5fb:	e9 00 00 00 00       	jmp    600 <.altinstr_replacement+0x600>	5fc: R_X86_64_PLT32	.text+0x82912
0600      600:	e9 00 00 00 00       	jmp    605 <.altinstr_replacement+0x605>	601: R_X86_64_PLT32	.text+0x8294a
0605      605:	e9 00 00 00 00       	jmp    60a <.altinstr_replacement+0x60a>	606: R_X86_64_PLT32	.noinstr.text+0x203b
060a      60a:	e9 00 00 00 00       	jmp    60f <.altinstr_replacement+0x60f>	60b: R_X86_64_PLT32	.noinstr.text+0x204a
060f      60f:	e9 00 00 00 00       	jmp    614 <.altinstr_replacement+0x614>	610: R_X86_64_PLT32	.noinstr.text+0x2251
0614      614:	e9 00 00 00 00       	jmp    619 <.altinstr_replacement+0x619>	615: R_X86_64_PLT32	.noinstr.text+0x242e
0619      619:	e9 00 00 00 00       	jmp    61e <.altinstr_replacement+0x61e>	61a: R_X86_64_PLT32	.noinstr.text+0x25b7
061e      61e:	e9 00 00 00 00       	jmp    623 <.altinstr_replacement+0x623>	61f: R_X86_64_PLT32	.noinstr.text+0x2bd4
0623      623:	e9 00 00 00 00       	jmp    628 <.altinstr_replacement+0x628>	624: R_X86_64_PLT32	.noinstr.text+0x2c53
0628      628:	e9 00 00 00 00       	jmp    62d <.altinstr_replacement+0x62d>	629: R_X86_64_PLT32	.text+0x839c8
062d      62d:	e9 00 00 00 00       	jmp    632 <.altinstr_replacement+0x632>	62e: R_X86_64_PLT32	.text+0x84299
0632      632:	e9 00 00 00 00       	jmp    637 <.altinstr_replacement+0x637>	633: R_X86_64_PLT32	.text+0x842a8
0637      637:	e9 00 00 00 00       	jmp    63c <.altinstr_replacement+0x63c>	638: R_X86_64_PLT32	.text+0x85be4
063c      63c:	e9 00 00 00 00       	jmp    641 <.altinstr_replacement+0x641>	63d: R_X86_64_PLT32	.text+0x87047
0641      641:	e9 00 00 00 00       	jmp    646 <.altinstr_replacement+0x646>	642: R_X86_64_PLT32	.init.text+0x243c9
0646      646:	e9 00 00 00 00       	jmp    64b <.altinstr_replacement+0x64b>	647: R_X86_64_PLT32	.text+0x8ce4a
064b      64b:	e9 00 00 00 00       	jmp    650 <.altinstr_replacement+0x650>	64c: R_X86_64_PLT32	.init.text+0x264d9
0650      650:	0f ae e8             	lfence
0653      653:	0f 31                	rdtsc
0655      655:	0f 01 f9             	rdtscp
0658      658:	0f ae e8             	lfence
065b      65b:	0f 31                	rdtsc
065d      65d:	0f 01 f9             	rdtscp
0660      660:	0f ae e8             	lfence
0663      663:	0f 31                	rdtsc
0665      665:	0f 01 f9             	rdtscp
0668      668:	e9 00 00 00 00       	jmp    66d <.altinstr_replacement+0x66d>	669: R_X86_64_PLT32	.init.text+0x298a6
066d      66d:	e9 00 00 00 00       	jmp    672 <.altinstr_replacement+0x672>	66e: R_X86_64_PLT32	.init.text+0x2988d
0672      672:	e9 00 00 00 00       	jmp    677 <.altinstr_replacement+0x677>	673: R_X86_64_PLT32	.text+0xaafeb
0677      677:	e9 00 00 00 00       	jmp    67c <.altinstr_replacement+0x67c>	678: R_X86_64_PLT32	.text+0xb1d4b
067c      67c:	e9 00 00 00 00       	jmp    681 <.altinstr_replacement+0x681>	67d: R_X86_64_PLT32	.init.text+0x298de
0681      681:	0f 01 c1             	vmcall
0684      684:	0f 01 d9             	vmmcall
0687      687:	0f 01 c1             	vmcall
068a      68a:	0f 01 d9             	vmmcall
068d      68d:	0f 01 c1             	vmcall
0690      690:	0f 01 d9             	vmmcall
0693      693:	0f 01 c1             	vmcall
0696      696:	0f 01 d9             	vmmcall
0699      699:	e9 00 00 00 00       	jmp    69e <.altinstr_replacement+0x69e>	69a: R_X86_64_PLT32	.cpuidle.text+0x1f1
069e      69e:	e9 00 00 00 00       	jmp    6a3 <.altinstr_replacement+0x6a3>	69f: R_X86_64_PLT32	.cpuidle.text+0x15c
06a3      6a3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06a8      6a8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06ad      6ad:	e9 00 00 00 00       	jmp    6b2 <.altinstr_replacement+0x6b2>	6ae: R_X86_64_PLT32	.init.text+0x319b7
06b2      6b2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06b7      6b7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06bc      6bc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06c1      6c1:	e9 00 00 00 00       	jmp    6c6 <.altinstr_replacement+0x6c6>	6c2: R_X86_64_PLT32	.init.text+0x32146
06c6      6c6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06cb      6cb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06d0      6d0:	0f ae e8             	lfence
06d3      6d3:	0f 31                	rdtsc
06d5      6d5:	0f 01 f9             	rdtscp
06d8      6d8:	0f ae e8             	lfence
06db      6db:	0f 31                	rdtsc
06dd      6dd:	0f 01 f9             	rdtscp
06e0      6e0:	c6 07 00             	movb   $0x0,(%rdi)
06e3      6e3:	c6 07 00             	movb   $0x0,(%rdi)
06e6      6e6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06eb      6eb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
06f0      6f0:	87 2c 25 00 c3 5f ff 	xchg   %ebp,0xffffffffff5fc300
06f7      6f7:	44 87 3c 25 10 c3 5f ff 	xchg   %r15d,0xffffffffff5fc310
06ff      6ff:	87 1c 25 00 c3 5f ff 	xchg   %ebx,0xffffffffff5fc300
0706      706:	87 b0 00 c0 5f ff    	xchg   %esi,-0xa04000(%rax)
070c      70c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0711      711:	0f ae e8             	lfence
0714      714:	0f 31                	rdtsc
0716      716:	0f 01 f9             	rdtscp
0719      719:	e8 00 00 00 00       	call   71e <.altinstr_replacement+0x71e>	71a: R_X86_64_PLT32	clear_page_rep-0x4
071e      71e:	e8 00 00 00 00       	call   723 <.altinstr_replacement+0x723>	71f: R_X86_64_PLT32	clear_page_erms-0x4
0723      723:	e8 00 00 00 00       	call   728 <.altinstr_replacement+0x728>	724: R_X86_64_PLT32	clear_page_rep-0x4
0728      728:	e8 00 00 00 00       	call   72d <.altinstr_replacement+0x72d>	729: R_X86_64_PLT32	clear_page_erms-0x4
072d      72d:	e9 00 00 00 00       	jmp    732 <.altinstr_replacement+0x732>	72e: R_X86_64_PLT32	.init.text+0x3f2a2
0732      732:	c6 07 00             	movb   $0x0,(%rdi)
0735      735:	f3 48 0f b8 c7       	popcnt %rdi,%rax
073a      73a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
073f      73f:	0f 01 d9             	vmmcall
0742      742:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0747      747:	f3 48 0f b8 c7       	popcnt %rdi,%rax
074c      74c:	0f 01 d9             	vmmcall
074f      74f:	0f 01 d9             	vmmcall
0752      752:	48 31 c0             	xor    %rax,%rax
0755      755:	0f 01 d9             	vmmcall
0758      758:	f3 48 0f b8 c7       	popcnt %rdi,%rax
075d      75d:	0f ae e8             	lfence
0760      760:	0f 31                	rdtsc
0762      762:	0f 01 f9             	rdtscp
0765      765:	0f ae e8             	lfence
0768      768:	0f 31                	rdtsc
076a      76a:	0f 01 f9             	rdtscp
076d      76d:	e8 00 00 00 00       	call   772 <.altinstr_replacement+0x772>	76e: R_X86_64_PLT32	clear_page_rep-0x4
0772      772:	e8 00 00 00 00       	call   777 <.altinstr_replacement+0x777>	773: R_X86_64_PLT32	clear_page_erms-0x4
0777      777:	f3 48 0f b8 c7       	popcnt %rdi,%rax
077c      77c:	e9 00 00 00 00       	jmp    781 <.altinstr_replacement+0x781>	77d: R_X86_64_PLT32	.text+0xf1365
0781      781:	e9 00 00 00 00       	jmp    786 <.altinstr_replacement+0x786>	782: R_X86_64_PLT32	.text+0xf15f9
0786      786:	e9 00 00 00 00       	jmp    78b <.altinstr_replacement+0x78b>	787: R_X86_64_PLT32	.text+0xf1916
078b      78b:	0f 0d 88 40 01 00 00 	prefetchw 0x140(%rax)
0792      792:	e9 00 00 00 00       	jmp    797 <.altinstr_replacement+0x797>	793: R_X86_64_PLT32	.text+0xf3785
0797      797:	e9 00 00 00 00       	jmp    79c <.altinstr_replacement+0x79c>	798: R_X86_64_PLT32	.text+0xf37ca
079c      79c:	e9 00 00 00 00       	jmp    7a1 <.altinstr_replacement+0x7a1>	79d: R_X86_64_PLT32	.text+0xf51eb
07a1      7a1:	0f 30                	wrmsr
07a3      7a3:	e9 00 00 00 00       	jmp    7a8 <.altinstr_replacement+0x7a8>	7a4: R_X86_64_PLT32	.text+0xf8e34
07a8      7a8:	e9 00 00 00 00       	jmp    7ad <.altinstr_replacement+0x7ad>	7a9: R_X86_64_PLT32	.text+0xf93f1
07ad      7ad:	e9 00 00 00 00       	jmp    7b2 <.altinstr_replacement+0x7b2>	7ae: R_X86_64_PLT32	.text+0xf8fb8
07b2      7b2:	e9 00 00 00 00       	jmp    7b7 <.altinstr_replacement+0x7b7>	7b3: R_X86_64_PLT32	.text+0xf9012
07b7      7b7:	0f 30                	wrmsr
07b9      7b9:	e9 00 00 00 00       	jmp    7be <.altinstr_replacement+0x7be>	7ba: R_X86_64_PLT32	.text+0xf98b1
07be      7be:	e9 00 00 00 00       	jmp    7c3 <.altinstr_replacement+0x7c3>	7bf: R_X86_64_PLT32	.text+0xfa38f
07c3      7c3:	e9 00 00 00 00       	jmp    7c8 <.altinstr_replacement+0x7c8>	7c4: R_X86_64_PLT32	.text+0xfa5dd
07c8      7c8:	e9 00 00 00 00       	jmp    7cd <.altinstr_replacement+0x7cd>	7c9: R_X86_64_PLT32	.text+0xfa6f1
07cd      7cd:	e9 00 00 00 00       	jmp    7d2 <.altinstr_replacement+0x7d2>	7ce: R_X86_64_PLT32	.text+0xfa70f
07d2      7d2:	e9 00 00 00 00       	jmp    7d7 <.altinstr_replacement+0x7d7>	7d3: R_X86_64_PLT32	.text+0xfa7fb
07d7      7d7:	e9 00 00 00 00       	jmp    7dc <.altinstr_replacement+0x7dc>	7d8: R_X86_64_PLT32	.text+0xfa877
07dc      7dc:	e9 00 00 00 00       	jmp    7e1 <.altinstr_replacement+0x7e1>	7dd: R_X86_64_PLT32	.text+0xfaa0f
07e1      7e1:	66 0f ae 39          	clflushopt (%rcx)
07e5      7e5:	66 0f ae 39          	clflushopt (%rcx)
07e9      7e9:	e9 00 00 00 00       	jmp    7ee <.altinstr_replacement+0x7ee>	7ea: R_X86_64_PLT32	.text+0xfb5c7
07ee      7ee:	e9 00 00 00 00       	jmp    7f3 <.altinstr_replacement+0x7f3>	7ef: R_X86_64_PLT32	.text+0xfb60a
07f3      7f3:	e9 00 00 00 00       	jmp    7f8 <.altinstr_replacement+0x7f8>	7f4: R_X86_64_PLT32	.text+0xfc44e
07f8      7f8:	66 0f ae 39          	clflushopt (%rcx)
07fc      7fc:	e9 00 00 00 00       	jmp    801 <.altinstr_replacement+0x801>	7fd: R_X86_64_PLT32	.init.text+0x45b75
0801      801:	e9 00 00 00 00       	jmp    806 <.altinstr_replacement+0x806>	802: R_X86_64_PLT32	.text+0x10610d
0806      806:	e9 00 00 00 00       	jmp    80b <.altinstr_replacement+0x80b>	807: R_X86_64_PLT32	.text+0x10613a
080b      80b:	e9 00 00 00 00       	jmp    810 <.altinstr_replacement+0x810>	80c: R_X86_64_PLT32	.text+0x106480
0810      810:	e9 00 00 00 00       	jmp    815 <.altinstr_replacement+0x815>	811: R_X86_64_PLT32	.init.text+0x46cc9
0815      815:	e9 00 00 00 00       	jmp    81a <.altinstr_replacement+0x81a>	816: R_X86_64_PLT32	.text+0x1e8e12
081a      81a:	e9 00 00 00 00       	jmp    81f <.altinstr_replacement+0x81f>	81b: R_X86_64_PLT32	.text+0x1ea2d4
081f      81f:	e9 00 00 00 00       	jmp    824 <.altinstr_replacement+0x824>	820: R_X86_64_PLT32	.text+0x1efcc4
0824      824:	0f 01 cb             	stac
0827      827:	0f ae e8             	lfence
082a      82a:	0f 01 ca             	clac
082d      82d:	0f 01 ca             	clac
0830      830:	0f 01 cb             	stac
0833      833:	0f ae e8             	lfence
0836      836:	0f 01 ca             	clac
0839      839:	0f 01 ca             	clac
083c      83c:	0f 01 cb             	stac
083f      83f:	e8 00 00 00 00       	call   844 <.altinstr_replacement+0x844>	840: R_X86_64_PLT32	rep_stos_alternative-0x4
0844      844:	0f 01 ca             	clac
0847      847:	f3 48 0f b8 c7       	popcnt %rdi,%rax
084c      84c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0851      851:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0856      856:	f3 48 0f b8 c7       	popcnt %rdi,%rax
085b      85b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0860      860:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0865      865:	f3 48 0f b8 c7       	popcnt %rdi,%rax
086a      86a:	e9 00 00 00 00       	jmp    86f <.altinstr_replacement+0x86f>	86b: R_X86_64_PLT32	.text+0x28b1d0
086f      86f:	e9 00 00 00 00       	jmp    874 <.altinstr_replacement+0x874>	870: R_X86_64_PLT32	.text+0x28b33b
0874      874:	48 31 c0             	xor    %rax,%rax
0877      877:	f3 48 0f b8 c7       	popcnt %rdi,%rax
087c      87c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0881      881:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0886      886:	f3 48 0f b8 c7       	popcnt %rdi,%rax
088b      88b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0890      890:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0895      895:	f3 48 0f b8 c7       	popcnt %rdi,%rax
089a      89a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
089f      89f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08a4      8a4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08a9      8a9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08ae      8ae:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08b3      8b3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08b8      8b8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08bd      8bd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08c2      8c2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08c7      8c7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08cc      8cc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08d1      8d1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08d6      8d6:	e9 00 00 00 00       	jmp    8db <.altinstr_replacement+0x8db>	8d7: R_X86_64_PLT32	.text+0x2feb09
08db      8db:	e9 00 00 00 00       	jmp    8e0 <.altinstr_replacement+0x8e0>	8dc: R_X86_64_PLT32	.text+0x2feb13
08e0      8e0:	48 31 c0             	xor    %rax,%rax
08e3      8e3:	48 31 c0             	xor    %rax,%rax
08e6      8e6:	48 31 c0             	xor    %rax,%rax
08e9      8e9:	48 31 c0             	xor    %rax,%rax
08ec      8ec:	c6 07 00             	movb   $0x0,(%rdi)
08ef      8ef:	48 31 c0             	xor    %rax,%rax
08f2      8f2:	0f 0d 08             	prefetchw (%rax)
08f5      8f5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
08fa      8fa:	0f 0d 08             	prefetchw (%rax)
08fd      8fd:	48 31 c0             	xor    %rax,%rax
0900      900:	c6 07 00             	movb   $0x0,(%rdi)
0903      903:	c6 07 00             	movb   $0x0,(%rdi)
0906      906:	c6 07 00             	movb   $0x0,(%rdi)
0909      909:	f3 48 0f b8 c7       	popcnt %rdi,%rax
090e      90e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0913      913:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0918      918:	f3 48 0f b8 c7       	popcnt %rdi,%rax
091d      91d:	c6 07 00             	movb   $0x0,(%rdi)
0920      920:	c6 07 00             	movb   $0x0,(%rdi)
0923      923:	c6 07 00             	movb   $0x0,(%rdi)
0926      926:	c6 07 00             	movb   $0x0,(%rdi)
0929      929:	f3 48 0f b8 c7       	popcnt %rdi,%rax
092e      92e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0933      933:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0938      938:	f3 48 0f b8 c7       	popcnt %rdi,%rax
093d      93d:	0f 01 cb             	stac
0940      940:	0f ae e8             	lfence
0943      943:	0f 01 ca             	clac
0946      946:	f3 48 0f b8 c7       	popcnt %rdi,%rax
094b      94b:	0f 01 cb             	stac
094e      94e:	0f ae e8             	lfence
0951      951:	0f 01 ca             	clac
0954      954:	0f 01 ca             	clac
0957      957:	0f 01 ca             	clac
095a      95a:	e8 00 00 00 00       	call   95f <.altinstr_replacement+0x95f>	95b: R_X86_64_PLT32	clear_page_rep-0x4
095f      95f:	e8 00 00 00 00       	call   964 <.altinstr_replacement+0x964>	960: R_X86_64_PLT32	clear_page_erms-0x4
0964      964:	e8 00 00 00 00       	call   969 <.altinstr_replacement+0x969>	965: R_X86_64_PLT32	clear_page_rep-0x4
0969      969:	e8 00 00 00 00       	call   96e <.altinstr_replacement+0x96e>	96a: R_X86_64_PLT32	clear_page_erms-0x4
096e      96e:	0f 01 cb             	stac
0971      971:	0f ae e8             	lfence
0974      974:	0f 01 ca             	clac
0977      977:	0f 01 ca             	clac
097a      97a:	0f 01 cb             	stac
097d      97d:	0f ae e8             	lfence
0980      980:	0f 01 ca             	clac
0983      983:	0f 01 ca             	clac
0986      986:	f3 48 0f b8 c7       	popcnt %rdi,%rax
098b      98b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0990      990:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0995      995:	f3 48 0f b8 c7       	popcnt %rdi,%rax
099a      99a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
099f      99f:	c6 07 00             	movb   $0x0,(%rdi)
09a2      9a2:	c6 07 00             	movb   $0x0,(%rdi)
09a5      9a5:	c6 07 00             	movb   $0x0,(%rdi)
09a8      9a8:	c6 07 00             	movb   $0x0,(%rdi)
09ab      9ab:	c6 07 00             	movb   $0x0,(%rdi)
09ae      9ae:	c6 07 00             	movb   $0x0,(%rdi)
09b1      9b1:	c6 07 00             	movb   $0x0,(%rdi)
09b4      9b4:	c6 07 00             	movb   $0x0,(%rdi)
09b7      9b7:	c6 07 00             	movb   $0x0,(%rdi)
09ba      9ba:	c6 07 00             	movb   $0x0,(%rdi)
09bd      9bd:	c6 07 00             	movb   $0x0,(%rdi)
09c0      9c0:	0f 01 cb             	stac
09c3      9c3:	e8 00 00 00 00       	call   9c8 <.altinstr_replacement+0x9c8>	9c4: R_X86_64_PLT32	rep_movs_alternative-0x4
09c8      9c8:	0f 01 ca             	clac
09cb      9cb:	0f 01 cb             	stac
09ce      9ce:	e8 00 00 00 00       	call   9d3 <.altinstr_replacement+0x9d3>	9cf: R_X86_64_PLT32	rep_movs_alternative-0x4
09d3      9d3:	0f 01 ca             	clac
09d6      9d6:	c6 07 00             	movb   $0x0,(%rdi)
09d9      9d9:	c6 07 00             	movb   $0x0,(%rdi)
09dc      9dc:	c6 07 00             	movb   $0x0,(%rdi)
09df      9df:	0f ae e8             	lfence
09e2      9e2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09e7      9e7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09ec      9ec:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09f1      9f1:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09f6      9f6:	f3 48 0f b8 c7       	popcnt %rdi,%rax
09fb      9fb:	c6 07 00             	movb   $0x0,(%rdi)
09fe      9fe:	c6 07 00             	movb   $0x0,(%rdi)
0a01      a01:	c6 07 00             	movb   $0x0,(%rdi)
0a04      a04:	c6 07 00             	movb   $0x0,(%rdi)
0a07      a07:	c6 07 00             	movb   $0x0,(%rdi)
0a0a      a0a:	c6 07 00             	movb   $0x0,(%rdi)
0a0d      a0d:	c6 07 00             	movb   $0x0,(%rdi)
0a10      a10:	c6 07 00             	movb   $0x0,(%rdi)
0a13      a13:	c6 07 00             	movb   $0x0,(%rdi)
0a16      a16:	c6 07 00             	movb   $0x0,(%rdi)
0a19      a19:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a1e      a1e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a23      a23:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a28      a28:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a2d      a2d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a32      a32:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a37      a37:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a3c      a3c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a41      a41:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a46      a46:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a4b      a4b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a50      a50:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a55      a55:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a5a      a5a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a5f      a5f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a64      a64:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a69      a69:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a6e      a6e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a73      a73:	41 0f 0d 0c 1e       	prefetchw (%r14,%rbx,1)
0a78      a78:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a7d      a7d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a82      a82:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a87      a87:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a8c      a8c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0a91      a91:	0f 01 cb             	stac
0a94      a94:	0f ae e8             	lfence
0a97      a97:	0f 01 ca             	clac
0a9a      a9a:	0f 01 ca             	clac
0a9d      a9d:	0f 01 cb             	stac
0aa0      aa0:	e8 00 00 00 00       	call   aa5 <.altinstr_replacement+0xaa5>	aa1: R_X86_64_PLT32	rep_movs_alternative-0x4
0aa5      aa5:	0f 01 ca             	clac
0aa8      aa8:	0f 01 cb             	stac
0aab      aab:	e8 00 00 00 00       	call   ab0 <.altinstr_replacement+0xab0>	aac: R_X86_64_PLT32	rep_movs_alternative-0x4
0ab0      ab0:	0f 01 ca             	clac
0ab3      ab3:	0f 0d 48 f8          	prefetchw -0x8(%rax)
0ab7      ab7:	e8 00 00 00 00       	call   abc <.altinstr_replacement+0xabc>	ab8: R_X86_64_PLT32	clear_page_rep-0x4
0abc      abc:	e8 00 00 00 00       	call   ac1 <.altinstr_replacement+0xac1>	abd: R_X86_64_PLT32	clear_page_erms-0x4
0ac1      ac1:	e8 00 00 00 00       	call   ac6 <.altinstr_replacement+0xac6>	ac2: R_X86_64_PLT32	clear_page_rep-0x4
0ac6      ac6:	e8 00 00 00 00       	call   acb <.altinstr_replacement+0xacb>	ac7: R_X86_64_PLT32	clear_page_erms-0x4
0acb      acb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ad0      ad0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ad5      ad5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ada      ada:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0adf      adf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ae4      ae4:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ae9      ae9:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0aee      aee:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0af3      af3:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0af8      af8:	e9 00 00 00 00       	jmp    afd <.altinstr_replacement+0xafd>	af9: R_X86_64_PLT32	.text+0x6bd858
0afd      afd:	e9 00 00 00 00       	jmp    b02 <.altinstr_replacement+0xb02>	afe: R_X86_64_PLT32	.text+0x6bec52
0b02      b02:	0f 01 cb             	stac
0b05      b05:	0f ae e8             	lfence
0b08      b08:	0f 01 ca             	clac
0b0b      b0b:	0f 01 cb             	stac
0b0e      b0e:	0f ae e8             	lfence
0b11      b11:	0f 01 ca             	clac
0b14      b14:	e9 00 00 00 00       	jmp    b19 <.altinstr_replacement+0xb19>	b15: R_X86_64_PLT32	.text+0x6c199d
0b19      b19:	e9 00 00 00 00       	jmp    b1e <.altinstr_replacement+0xb1e>	b1a: R_X86_64_PLT32	.text+0x6c1df9
0b1e      b1e:	e9 00 00 00 00       	jmp    b23 <.altinstr_replacement+0xb23>	b1f: R_X86_64_PLT32	.text+0x6c2310
0b23      b23:	0f 01 cb             	stac
0b26      b26:	e8 00 00 00 00       	call   b2b <.altinstr_replacement+0xb2b>	b27: R_X86_64_PLT32	rep_movs_alternative-0x4
0b2b      b2b:	0f 01 ca             	clac
0b2e      b2e:	0f 01 cb             	stac
0b31      b31:	e8 00 00 00 00       	call   b36 <.altinstr_replacement+0xb36>	b32: R_X86_64_PLT32	rep_movs_alternative-0x4
0b36      b36:	0f 01 ca             	clac
0b39      b39:	e8 00 00 00 00       	call   b3e <.altinstr_replacement+0xb3e>	b3a: R_X86_64_PLT32	clear_page_rep-0x4
0b3e      b3e:	e8 00 00 00 00       	call   b43 <.altinstr_replacement+0xb43>	b3f: R_X86_64_PLT32	clear_page_erms-0x4
0b43      b43:	e9 00 00 00 00       	jmp    b48 <.altinstr_replacement+0xb48>	b44: R_X86_64_PLT32	.text+0x6d75cc
0b48      b48:	e8 00 00 00 00       	call   b4d <.altinstr_replacement+0xb4d>	b49: R_X86_64_PLT32	clear_page_rep-0x4
0b4d      b4d:	e8 00 00 00 00       	call   b52 <.altinstr_replacement+0xb52>	b4e: R_X86_64_PLT32	clear_page_erms-0x4
0b52      b52:	e8 00 00 00 00       	call   b57 <.altinstr_replacement+0xb57>	b53: R_X86_64_PLT32	clear_page_rep-0x4
0b57      b57:	e8 00 00 00 00       	call   b5c <.altinstr_replacement+0xb5c>	b58: R_X86_64_PLT32	clear_page_erms-0x4
0b5c      b5c:	e9 00 00 00 00       	jmp    b61 <.altinstr_replacement+0xb61>	b5d: R_X86_64_PLT32	.text+0x6ea83c
0b61      b61:	e9 00 00 00 00       	jmp    b66 <.altinstr_replacement+0xb66>	b62: R_X86_64_PLT32	.text+0x6fa8ed
0b66      b66:	e9 00 00 00 00       	jmp    b6b <.altinstr_replacement+0xb6b>	b67: R_X86_64_PLT32	.text+0x6fa9a8
0b6b      b6b:	e9 00 00 00 00       	jmp    b70 <.altinstr_replacement+0xb70>	b6c: R_X86_64_PLT32	.text+0x6fae99
0b70      b70:	e9 00 00 00 00       	jmp    b75 <.altinstr_replacement+0xb75>	b71: R_X86_64_PLT32	.text+0x6fb735
0b75      b75:	e9 00 00 00 00       	jmp    b7a <.altinstr_replacement+0xb7a>	b76: R_X86_64_PLT32	.text+0x6fba6f
0b7a      b7a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b7f      b7f:	41 0f 0d 0f          	prefetchw (%r15)
0b83      b83:	0f 0d 4b 0c          	prefetchw 0xc(%rbx)
0b87      b87:	e8 00 00 00 00       	call   b8c <.altinstr_replacement+0xb8c>	b88: R_X86_64_PLT32	clear_page_rep-0x4
0b8c      b8c:	e8 00 00 00 00       	call   b91 <.altinstr_replacement+0xb91>	b8d: R_X86_64_PLT32	clear_page_erms-0x4
0b91      b91:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b96      b96:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0b9b      b9b:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ba0      ba0:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ba5      ba5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0baa      baa:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0baf      baf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bb4      bb4:	65 49 0f c7 09       	cmpxchg16b %gs:(%r9)
0bb9      bb9:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0bbd      bbd:	65 49 0f c7 09       	cmpxchg16b %gs:(%r9)
0bc2      bc2:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0bc6      bc6:	65 49 0f c7 09       	cmpxchg16b %gs:(%r9)
0bcb      bcb:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0bcf      bcf:	65 49 0f c7 09       	cmpxchg16b %gs:(%r9)
0bd4      bd4:	0f 0d 0c 03          	prefetchw (%rbx,%rax,1)
0bd8      bd8:	65 49 0f c7 0e       	cmpxchg16b %gs:(%r14)
0bdd      bdd:	65 49 0f c7 09       	cmpxchg16b %gs:(%r9)
0be2      be2:	65 48 0f c7 4d 00    	cmpxchg16b %gs:0x0(%rbp)
0be8      be8:	65 49 0f c7 0a       	cmpxchg16b %gs:(%r10)
0bed      bed:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0bf2      bf2:	9c                   	pushf
0bf3      bf3:	8f 44 24 10          	pop    0x10(%rsp)
0bf7      bf7:	0f 01 ca             	clac
0bfa      bfa:	ff 74 24 08          	push   0x8(%rsp)
0bfe      bfe:	9d                   	popf
0bff      bff:	e8 00 00 00 00       	call   c04 <.altinstr_replacement+0xc04>	c00: R_X86_64_PLT32	clear_page_rep-0x4
0c04      c04:	e8 00 00 00 00       	call   c09 <.altinstr_replacement+0xc09>	c05: R_X86_64_PLT32	clear_page_erms-0x4
0c09      c09:	e8 00 00 00 00       	call   c0e <.altinstr_replacement+0xc0e>	c0a: R_X86_64_PLT32	clear_page_rep-0x4
0c0e      c0e:	e8 00 00 00 00       	call   c13 <.altinstr_replacement+0xc13>	c0f: R_X86_64_PLT32	clear_page_erms-0x4
0c13      c13:	e8 00 00 00 00       	call   c18 <.altinstr_replacement+0xc18>	c14: R_X86_64_PLT32	clear_page_rep-0x4
0c18      c18:	e8 00 00 00 00       	call   c1d <.altinstr_replacement+0xc1d>	c19: R_X86_64_PLT32	clear_page_erms-0x4
0c1d      c1d:	0f 01 cb             	stac
0c20      c20:	0f ae e8             	lfence
0c23      c23:	0f 01 ca             	clac
0c26      c26:	0f 01 ca             	clac
0c29      c29:	0f 01 cb             	stac
0c2c      c2c:	0f ae e8             	lfence
0c2f      c2f:	0f 01 ca             	clac
0c32      c32:	0f 01 ca             	clac
0c35      c35:	0f 01 cb             	stac
0c38      c38:	0f ae e8             	lfence
0c3b      c3b:	0f 01 ca             	clac
0c3e      c3e:	0f 01 ca             	clac
0c41      c41:	0f 01 cb             	stac
0c44      c44:	0f ae e8             	lfence
0c47      c47:	0f 01 ca             	clac
0c4a      c4a:	0f 01 ca             	clac
0c4d      c4d:	0f 01 cb             	stac
0c50      c50:	0f ae e8             	lfence
0c53      c53:	0f 01 ca             	clac
0c56      c56:	0f 01 ca             	clac
0c59      c59:	0f 01 cb             	stac
0c5c      c5c:	e8 00 00 00 00       	call   c61 <.altinstr_replacement+0xc61>	c5d: R_X86_64_PLT32	rep_movs_alternative-0x4
0c61      c61:	0f 01 ca             	clac
0c64      c64:	0f 01 cb             	stac
0c67      c67:	0f ae e8             	lfence
0c6a      c6a:	0f 01 ca             	clac
0c6d      c6d:	0f 01 ca             	clac
0c70      c70:	0f 01 cb             	stac
0c73      c73:	0f ae e8             	lfence
0c76      c76:	0f 01 ca             	clac
0c79      c79:	0f 01 ca             	clac
0c7c      c7c:	0f 01 cb             	stac
0c7f      c7f:	0f ae e8             	lfence
0c82      c82:	0f 01 ca             	clac
0c85      c85:	0f 01 ca             	clac
0c88      c88:	0f 01 cb             	stac
0c8b      c8b:	0f ae e8             	lfence
0c8e      c8e:	0f 01 ca             	clac
0c91      c91:	0f 01 ca             	clac
0c94      c94:	0f 0d 8f 40 09 00 00 	prefetchw 0x940(%rdi)
0c9b      c9b:	f3 0f b8 c7          	popcnt %edi,%eax
0c9f      c9f:	0f 0d 4d 00          	prefetchw 0x0(%rbp)
0ca3      ca3:	0f 01 cb             	stac
0ca6      ca6:	e8 00 00 00 00       	call   cab <.altinstr_replacement+0xcab>	ca7: R_X86_64_PLT32	rep_stos_alternative-0x4
0cab      cab:	0f 01 ca             	clac
0cae      cae:	0f 01 cb             	stac
0cb1      cb1:	e8 00 00 00 00       	call   cb6 <.altinstr_replacement+0xcb6>	cb2: R_X86_64_PLT32	rep_stos_alternative-0x4
0cb6      cb6:	0f 01 ca             	clac
0cb9      cb9:	0f 01 cb             	stac
0cbc      cbc:	e8 00 00 00 00       	call   cc1 <.altinstr_replacement+0xcc1>	cbd: R_X86_64_PLT32	rep_stos_alternative-0x4
0cc1      cc1:	0f 01 ca             	clac
0cc4      cc4:	0f 01 cb             	stac
0cc7      cc7:	e8 00 00 00 00       	call   ccc <.altinstr_replacement+0xccc>	cc8: R_X86_64_PLT32	rep_stos_alternative-0x4
0ccc      ccc:	0f 01 ca             	clac
0ccf      ccf:	0f 01 cb             	stac
0cd2      cd2:	e8 00 00 00 00       	call   cd7 <.altinstr_replacement+0xcd7>	cd3: R_X86_64_PLT32	rep_stos_alternative-0x4
0cd7      cd7:	0f 01 ca             	clac
0cda      cda:	e9 00 00 00 00       	jmp    cdf <.altinstr_replacement+0xcdf>	cdb: R_X86_64_PLT32	.text+0x91db86
0cdf      cdf:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ce4      ce4:	e8 00 00 00 00       	call   ce9 <.altinstr_replacement+0xce9>	ce5: R_X86_64_PLT32	clear_page_rep-0x4
0ce9      ce9:	e8 00 00 00 00       	call   cee <.altinstr_replacement+0xcee>	cea: R_X86_64_PLT32	clear_page_erms-0x4
0cee      cee:	e8 00 00 00 00       	call   cf3 <.altinstr_replacement+0xcf3>	cef: R_X86_64_PLT32	clear_page_rep-0x4
0cf3      cf3:	e8 00 00 00 00       	call   cf8 <.altinstr_replacement+0xcf8>	cf4: R_X86_64_PLT32	clear_page_erms-0x4
0cf8      cf8:	e8 00 00 00 00       	call   cfd <.altinstr_replacement+0xcfd>	cf9: R_X86_64_PLT32	clear_page_rep-0x4
0cfd      cfd:	e8 00 00 00 00       	call   d02 <.altinstr_replacement+0xd02>	cfe: R_X86_64_PLT32	clear_page_erms-0x4
0d02      d02:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d07      d07:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d0c      d0c:	e8 00 00 00 00       	call   d11 <.altinstr_replacement+0xd11>	d0d: R_X86_64_PLT32	clear_page_rep-0x4
0d11      d11:	e8 00 00 00 00       	call   d16 <.altinstr_replacement+0xd16>	d12: R_X86_64_PLT32	clear_page_erms-0x4
0d16      d16:	e8 00 00 00 00       	call   d1b <.altinstr_replacement+0xd1b>	d17: R_X86_64_PLT32	clear_page_rep-0x4
0d1b      d1b:	e8 00 00 00 00       	call   d20 <.altinstr_replacement+0xd20>	d1c: R_X86_64_PLT32	clear_page_erms-0x4
0d20      d20:	f3 0f b8 c7          	popcnt %edi,%eax
0d24      d24:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d29      d29:	f3 0f b8 c7          	popcnt %edi,%eax
0d2d      d2d:	f3 0f b8 c7          	popcnt %edi,%eax
0d31      d31:	f3 0f b8 c7          	popcnt %edi,%eax
0d35      d35:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d3a      d3a:	e8 00 00 00 00       	call   d3f <.altinstr_replacement+0xd3f>	d3b: R_X86_64_PLT32	clear_page_rep-0x4
0d3f      d3f:	e8 00 00 00 00       	call   d44 <.altinstr_replacement+0xd44>	d40: R_X86_64_PLT32	clear_page_erms-0x4
0d44      d44:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d49      d49:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d4e      d4e:	e8 00 00 00 00       	call   d53 <.altinstr_replacement+0xd53>	d4f: R_X86_64_PLT32	clear_page_rep-0x4
0d53      d53:	e8 00 00 00 00       	call   d58 <.altinstr_replacement+0xd58>	d54: R_X86_64_PLT32	clear_page_erms-0x4
0d58      d58:	e8 00 00 00 00       	call   d5d <.altinstr_replacement+0xd5d>	d59: R_X86_64_PLT32	clear_page_rep-0x4
0d5d      d5d:	e8 00 00 00 00       	call   d62 <.altinstr_replacement+0xd62>	d5e: R_X86_64_PLT32	clear_page_erms-0x4
0d62      d62:	e8 00 00 00 00       	call   d67 <.altinstr_replacement+0xd67>	d63: R_X86_64_PLT32	clear_page_rep-0x4
0d67      d67:	e8 00 00 00 00       	call   d6c <.altinstr_replacement+0xd6c>	d68: R_X86_64_PLT32	clear_page_erms-0x4
0d6c      d6c:	41 0f 0d 0c 24       	prefetchw (%r12)
0d71      d71:	0f 01 cb             	stac
0d74      d74:	e8 00 00 00 00       	call   d79 <.altinstr_replacement+0xd79>	d75: R_X86_64_PLT32	rep_stos_alternative-0x4
0d79      d79:	0f 01 ca             	clac
0d7c      d7c:	0f 01 cb             	stac
0d7f      d7f:	e8 00 00 00 00       	call   d84 <.altinstr_replacement+0xd84>	d80: R_X86_64_PLT32	rep_stos_alternative-0x4
0d84      d84:	0f 01 ca             	clac
0d87      d87:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0d8c      d8c:	f3 0f b8 c7          	popcnt %edi,%eax
0d90      d90:	f3 0f b8 c7          	popcnt %edi,%eax
0d94      d94:	0f 01 cb             	stac
0d97      d97:	0f ae e8             	lfence
0d9a      d9a:	0f 01 ca             	clac
0d9d      d9d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0da2      da2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0da7      da7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0dac      dac:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0db1      db1:	0f 01 cb             	stac
0db4      db4:	e8 00 00 00 00       	call   db9 <.altinstr_replacement+0xdb9>	db5: R_X86_64_PLT32	rep_movs_alternative-0x4
0db9      db9:	0f 01 ca             	clac
0dbc      dbc:	0f 01 cb             	stac
0dbf      dbf:	e8 00 00 00 00       	call   dc4 <.altinstr_replacement+0xdc4>	dc0: R_X86_64_PLT32	rep_movs_alternative-0x4
0dc4      dc4:	0f 01 ca             	clac
0dc7      dc7:	0f 01 cb             	stac
0dca      dca:	0f 01 ca             	clac
0dcd      dcd:	0f 01 cb             	stac
0dd0      dd0:	0f 01 ca             	clac
0dd3      dd3:	0f 01 cb             	stac
0dd6      dd6:	e8 00 00 00 00       	call   ddb <.altinstr_replacement+0xddb>	dd7: R_X86_64_PLT32	rep_stos_alternative-0x4
0ddb      ddb:	0f 01 ca             	clac
0dde      dde:	0f 01 cb             	stac
0de1      de1:	e8 00 00 00 00       	call   de6 <.altinstr_replacement+0xde6>	de2: R_X86_64_PLT32	rep_stos_alternative-0x4
0de6      de6:	0f 01 ca             	clac
0de9      de9:	0f 01 cb             	stac
0dec      dec:	0f ae e8             	lfence
0def      def:	0f 01 ca             	clac
0df2      df2:	0f 01 cb             	stac
0df5      df5:	0f ae e8             	lfence
0df8      df8:	0f 01 ca             	clac
0dfb      dfb:	0f 01 cb             	stac
0dfe      dfe:	0f ae e8             	lfence
0e01      e01:	0f 01 ca             	clac
0e04      e04:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e09      e09:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e0e      e0e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e13      e13:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e18      e18:	f3 0f b8 c7          	popcnt %edi,%eax
0e1c      e1c:	f3 0f b8 c7          	popcnt %edi,%eax
0e20      e20:	0f ae e8             	lfence
0e23      e23:	0f 01 cb             	stac
0e26      e26:	e8 00 00 00 00       	call   e2b <.altinstr_replacement+0xe2b>	e27: R_X86_64_PLT32	rep_movs_alternative-0x4
0e2b      e2b:	0f 01 ca             	clac
0e2e      e2e:	0f 01 cb             	stac
0e31      e31:	e8 00 00 00 00       	call   e36 <.altinstr_replacement+0xe36>	e32: R_X86_64_PLT32	rep_movs_alternative-0x4
0e36      e36:	0f 01 ca             	clac
0e39      e39:	0f 01 cb             	stac
0e3c      e3c:	0f ae e8             	lfence
0e3f      e3f:	0f 01 ca             	clac
0e42      e42:	0f 01 ca             	clac
0e45      e45:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e4a      e4a:	0f 01 cb             	stac
0e4d      e4d:	0f ae e8             	lfence
0e50      e50:	0f 01 ca             	clac
0e53      e53:	0f 01 cb             	stac
0e56      e56:	0f ae e8             	lfence
0e59      e59:	0f 01 ca             	clac
0e5c      e5c:	9c                   	pushf
0e5d      e5d:	8f 04 24             	pop    (%rsp)
0e60      e60:	0f 01 ca             	clac
0e63      e63:	ff 74 24 08          	push   0x8(%rsp)
0e67      e67:	9d                   	popf
0e68      e68:	9c                   	pushf
0e69      e69:	8f 04 24             	pop    (%rsp)
0e6c      e6c:	0f 01 ca             	clac
0e6f      e6f:	ff 74 24 08          	push   0x8(%rsp)
0e73      e73:	9d                   	popf
0e74      e74:	9c                   	pushf
0e75      e75:	8f 04 24             	pop    (%rsp)
0e78      e78:	0f 01 ca             	clac
0e7b      e7b:	ff 74 24 08          	push   0x8(%rsp)
0e7f      e7f:	9d                   	popf
0e80      e80:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e85      e85:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0e8a      e8a:	e9 00 00 00 00       	jmp    e8f <.altinstr_replacement+0xe8f>	e8b: R_X86_64_PLT32	.text+0x1b84bff
0e8f      e8f:	e9 00 00 00 00       	jmp    e94 <.altinstr_replacement+0xe94>	e90: R_X86_64_PLT32	.text+0x1b88316
0e94      e94:	e9 00 00 00 00       	jmp    e99 <.altinstr_replacement+0xe99>	e95: R_X86_64_PLT32	.cpuidle.text+0x4d6
0e99      e99:	e9 00 00 00 00       	jmp    e9e <.altinstr_replacement+0xe9e>	e9a: R_X86_64_PLT32	.text+0x1bcebd6
0e9e      e9e:	e9 00 00 00 00       	jmp    ea3 <.altinstr_replacement+0xea3>	e9f: R_X86_64_PLT32	.cpuidle.text+0x59e
0ea3      ea3:	f3 0f b8 c7          	popcnt %edi,%eax
0ea7      ea7:	0f 01 cb             	stac
0eaa      eaa:	e8 00 00 00 00       	call   eaf <.altinstr_replacement+0xeaf>	eab: R_X86_64_PLT32	rep_stos_alternative-0x4
0eaf      eaf:	0f 01 ca             	clac
0eb2      eb2:	0f 01 cb             	stac
0eb5      eb5:	e8 00 00 00 00       	call   eba <.altinstr_replacement+0xeba>	eb6: R_X86_64_PLT32	rep_stos_alternative-0x4
0eba      eba:	0f 01 ca             	clac
0ebd      ebd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ec2      ec2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ec7      ec7:	e9 00 00 00 00       	jmp    ecc <.altinstr_replacement+0xecc>	ec8: R_X86_64_PLT32	.init.text+0x9dbae
0ecc      ecc:	e9 00 00 00 00       	jmp    ed1 <.altinstr_replacement+0xed1>	ecd: R_X86_64_PLT32	.init.text+0x9dc1f
0ed1      ed1:	e9 00 00 00 00       	jmp    ed6 <.altinstr_replacement+0xed6>	ed2: R_X86_64_PLT32	.text+0x1d4adaf
0ed6      ed6:	e9 00 00 00 00       	jmp    edb <.altinstr_replacement+0xedb>	ed7: R_X86_64_PLT32	.text+0x1d4adf7
0edb      edb:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0ee0      ee0:	f3 0f b8 c7          	popcnt %edi,%eax
0ee4      ee4:	f3 0f b8 c7          	popcnt %edi,%eax
0ee8      ee8:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0eed      eed:	f3 0f b8 c7          	popcnt %edi,%eax
0ef1      ef1:	f3 0f b8 c7          	popcnt %edi,%eax
0ef5      ef5:	e8 00 00 00 00       	call   efa <.altinstr_replacement+0xefa>	ef6: R_X86_64_PLT32	clear_page_rep-0x4
0efa      efa:	e8 00 00 00 00       	call   eff <.altinstr_replacement+0xeff>	efb: R_X86_64_PLT32	clear_page_erms-0x4
0eff      eff:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f04      f04:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f09      f09:	f3 0f b8 c7          	popcnt %edi,%eax
0f0d      f0d:	f3 0f b8 c7          	popcnt %edi,%eax
0f11      f11:	f3 0f b8 c7          	popcnt %edi,%eax
0f15      f15:	f3 0f b8 c7          	popcnt %edi,%eax
0f19      f19:	f3 0f b8 c7          	popcnt %edi,%eax
0f1d      f1d:	f3 0f b8 c7          	popcnt %edi,%eax
0f21      f21:	f3 0f b8 c7          	popcnt %edi,%eax
0f25      f25:	f3 0f b8 c7          	popcnt %edi,%eax
0f29      f29:	f3 0f b8 c7          	popcnt %edi,%eax
0f2d      f2d:	f3 0f b8 c7          	popcnt %edi,%eax
0f31      f31:	f3 0f b8 c7          	popcnt %edi,%eax
0f35      f35:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f3a      f3a:	f3 0f b8 c7          	popcnt %edi,%eax
0f3e      f3e:	f3 0f b8 c7          	popcnt %edi,%eax
0f42      f42:	f3 0f b8 c7          	popcnt %edi,%eax
0f46      f46:	f3 0f b8 c7          	popcnt %edi,%eax
0f4a      f4a:	f3 0f b8 c7          	popcnt %edi,%eax
0f4e      f4e:	f3 0f b8 c7          	popcnt %edi,%eax
0f52      f52:	f3 0f b8 c7          	popcnt %edi,%eax
0f56      f56:	f3 0f b8 c7          	popcnt %edi,%eax
0f5a      f5a:	f3 0f b8 c7          	popcnt %edi,%eax
0f5e      f5e:	f3 0f b8 c7          	popcnt %edi,%eax
0f62      f62:	f3 0f b8 c7          	popcnt %edi,%eax
0f66      f66:	f3 0f b8 c7          	popcnt %edi,%eax
0f6a      f6a:	f3 0f b8 c7          	popcnt %edi,%eax
0f6e      f6e:	0f 0d 0c 06          	prefetchw (%rsi,%rax,1)
0f72      f72:	f3 0f b8 c7          	popcnt %edi,%eax
0f76      f76:	f3 0f b8 c7          	popcnt %edi,%eax
0f7a      f7a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
0f7f      f7f:	0f 01 cb             	stac
0f82      f82:	e8 00 00 00 00       	call   f87 <.altinstr_replacement+0xf87>	f83: R_X86_64_PLT32	rep_stos_alternative-0x4
0f87      f87:	0f 01 ca             	clac
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
0fb2      fb2:	f3 0f b8 c7          	popcnt %edi,%eax
0fb6      fb6:	e9 00 00 00 00       	jmp    fbb <.altinstr_replacement+0xfbb>	fb7: R_X86_64_PLT32	.text+0x2d295cb
0fbb      fbb:	e8 00 00 00 00       	call   fc0 <.altinstr_replacement+0xfc0>	fbc: R_X86_64_PLT32	clear_page_rep-0x4
0fc0      fc0:	e8 00 00 00 00       	call   fc5 <.altinstr_replacement+0xfc5>	fc1: R_X86_64_PLT32	clear_page_erms-0x4
0fc5      fc5:	e8 00 00 00 00       	call   fca <.altinstr_replacement+0xfca>	fc6: R_X86_64_PLT32	clear_page_rep-0x4
0fca      fca:	e8 00 00 00 00       	call   fcf <.altinstr_replacement+0xfcf>	fcb: R_X86_64_PLT32	clear_page_erms-0x4
0fcf      fcf:	e8 00 00 00 00       	call   fd4 <.altinstr_replacement+0xfd4>	fd0: R_X86_64_PLT32	clear_page_rep-0x4
0fd4      fd4:	e8 00 00 00 00       	call   fd9 <.altinstr_replacement+0xfd9>	fd5: R_X86_64_PLT32	clear_page_erms-0x4
0fd9      fd9:	e8 00 00 00 00       	call   fde <.altinstr_replacement+0xfde>	fda: R_X86_64_PLT32	clear_page_rep-0x4
0fde      fde:	e8 00 00 00 00       	call   fe3 <.altinstr_replacement+0xfe3>	fdf: R_X86_64_PLT32	clear_page_erms-0x4
0fe3      fe3:	f3 0f b8 c7          	popcnt %edi,%eax
0fe7      fe7:	0f 01 cb             	stac
0fea      fea:	e8 00 00 00 00       	call   fef <.altinstr_replacement+0xfef>	feb: R_X86_64_PLT32	rep_stos_alternative-0x4
0fef      fef:	0f 01 ca             	clac
0ff2      ff2:	0f 01 cb             	stac
0ff5      ff5:	e8 00 00 00 00       	call   ffa <.altinstr_replacement+0xffa>	ff6: R_X86_64_PLT32	rep_stos_alternative-0x4
0ffa      ffa:	0f 01 ca             	clac
0ffd      ffd:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1002     1002:	f3 0f b8 c7          	popcnt %edi,%eax
1006     1006:	f3 0f b8 c7          	popcnt %edi,%eax
100a     100a:	f3 48 0f b8 c7       	popcnt %rdi,%rax
100f     100f:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1014     1014:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1019     1019:	f3 48 0f b8 c7       	popcnt %rdi,%rax
101e     101e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1023     1023:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1028     1028:	f3 48 0f b8 c7       	popcnt %rdi,%rax
102d     102d:	f3 0f b8 c7          	popcnt %edi,%eax
1031     1031:	f3 0f b8 c7          	popcnt %edi,%eax
1035     1035:	f3 0f b8 c7          	popcnt %edi,%eax
1039     1039:	f3 0f b8 c7          	popcnt %edi,%eax
103d     103d:	f3 0f b8 c7          	popcnt %edi,%eax
1041     1041:	f3 0f b8 c7          	popcnt %edi,%eax
1045     1045:	f3 0f b8 c7          	popcnt %edi,%eax
1049     1049:	0f 01 cb             	stac
104c     104c:	e8 00 00 00 00       	call   1051 <.altinstr_replacement+0x1051>	104d: R_X86_64_PLT32	rep_stos_alternative-0x4
1051     1051:	0f 01 ca             	clac
1054     1054:	f3 0f b8 c7          	popcnt %edi,%eax
1058     1058:	f3 0f b8 c7          	popcnt %edi,%eax
105c     105c:	f3 0f b8 c7          	popcnt %edi,%eax
1060     1060:	f3 0f b8 c7          	popcnt %edi,%eax
1064     1064:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1069     1069:	f3 48 0f b8 c7       	popcnt %rdi,%rax
106e     106e:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1073     1073:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1078     1078:	f3 48 0f b8 c7       	popcnt %rdi,%rax
107d     107d:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1082     1082:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1087     1087:	f3 48 0f b8 c7       	popcnt %rdi,%rax
108c     108c:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1091     1091:	f3 48 0f b8 c7       	popcnt %rdi,%rax
1096     1096:	f3 48 0f b8 c7       	popcnt %rdi,%rax
109b     109b:	41 0f 0d 4d 00       	prefetchw 0x0(%r13)
10a0     10a0:	42 0f 0d 8c 33 c0 fe ff ff 	prefetchw -0x140(%rbx,%r14,1)
10a9     10a9:	0f 01 cb             	stac
10ac     10ac:	0f ae e8             	lfence
10af     10af:	0f 01 ca             	clac
10b2     10b2:	0f 01 ca             	clac
10b5     10b5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10ba     10ba:	f3 0f b8 c7          	popcnt %edi,%eax
10be     10be:	f3 0f b8 c7          	popcnt %edi,%eax
10c2     10c2:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10c7     10c7:	f3 0f b8 c7          	popcnt %edi,%eax
10cb     10cb:	f3 0f b8 c7          	popcnt %edi,%eax
10cf     10cf:	f3 0f b8 c7          	popcnt %edi,%eax
10d3     10d3:	f3 0f b8 c7          	popcnt %edi,%eax
10d7     10d7:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10dc     10dc:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10e1     10e1:	41 0f 0d 0e          	prefetchw (%r14)
10e5     10e5:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10ea     10ea:	f3 48 0f b8 c7       	popcnt %rdi,%rax
10ef     10ef:	e9 00 00 00 00       	jmp    10f4 <.altinstr_replacement+0x10f4>	10f0: R_X86_64_PLT32	.text+0x3c0b965
10f4     10f4:	e9 00 00 00 00       	jmp    10f9 <.altinstr_replacement+0x10f9>	10f5: R_X86_64_PLT32	.text+0x3c6f253
10f9     10f9:	e9 00 00 00 00       	jmp    10fe <.altinstr_replacement+0x10fe>	10fa: R_X86_64_PLT32	.text+0x3c6f2a4
10fe     10fe:	0f 01 cb             	stac
1101     1101:	0f 01 ca             	clac
1104     1104:	0f 01 cb             	stac
1107     1107:	0f 01 ca             	clac
110a     110a:	0f 01 cb             	stac
110d     110d:	e8 00 00 00 00       	call   1112 <.altinstr_replacement+0x1112>	110e: R_X86_64_PLT32	rep_movs_alternative-0x4
1112     1112:	0f 01 ca             	clac
1115     1115:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
1117     1117:	0f ae e8             	lfence
111a     111a:	0f 31                	rdtsc
111c     111c:	0f 01 f9             	rdtscp
111f     111f:	0f ae e8             	lfence
1122     1122:	0f 31                	rdtsc
1124     1124:	0f 01 f9             	rdtscp
1127     1127:	0f ae e8             	lfence
112a     112a:	0f 31                	rdtsc
112c     112c:	0f 01 f9             	rdtscp
112f     112f:	0f ae e8             	lfence
1132     1132:	0f 31                	rdtsc
1134     1134:	0f 01 f9             	rdtscp
1137     1137:	0f ae e8             	lfence
113a     113a:	0f 31                	rdtsc
113c     113c:	0f 01 f9             	rdtscp
113f     113f:	0f ae e8             	lfence
1142     1142:	0f 31                	rdtsc
1144     1144:	0f 01 f9             	rdtscp
1147     1147:	0f 01 cb             	stac
114a     114a:	0f 01 ca             	clac
114d     114d:	0f 01 cb             	stac
1150     1150:	0f 01 ca             	clac
1153     1153:	0f 01 cb             	stac
1156     1156:	0f 01 ca             	clac
1159     1159:	0f 01 cb             	stac
115c     115c:	0f 01 ca             	clac
115f     115f:	0f 01 cb             	stac
1162     1162:	0f ae e8             	lfence
1165     1165:	0f 01 ca             	clac
1168     1168:	0f 01 cb             	stac
116b     116b:	0f ae e8             	lfence
116e     116e:	0f 01 ca             	clac
1171     1171:	0f 01 cb             	stac
1174     1174:	0f ae e8             	lfence
1177     1177:	0f 01 ca             	clac
117a     117a:	0f 01 cb             	stac
117d     117d:	0f ae e8             	lfence
1180     1180:	0f 01 ca             	clac
1183     1183:	0f 01 ca             	clac
1186     1186:	0f 01 cb             	stac
1189     1189:	e8 00 00 00 00       	call   118e <.altinstr_replacement+0x118e>	118a: R_X86_64_PLT32	rep_movs_alternative-0x4
118e     118e:	0f 01 ca             	clac
1191     1191:	48 83 fa 20          	cmp    $0x20,%rdx
1195     1195:	0f 82 00 00 00 00    	jb     119b <.altinstr_replacement+0x119b>	1197: R_X86_64_PLT32	.noinstr.text+0x5a92
119b     119b:	48 89 d1             	mov    %rdx,%rcx
119e     119e:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
11a0     11a0:	c3                   	ret
11a1     11a1:	cc                   	int3
11a2     11a2:	48 89 d1             	mov    %rdx,%rcx
11a5     11a5:	f3 a4                	rep movsb %ds:(%rsi),%es:(%rdi)
11a7     11a7:	c3                   	ret
11a8     11a8:	cc                   	int3
11a9     11a9:	0f 01 cb             	stac
11ac     11ac:	0f 01 ca             	clac
11af     11af:	0f 01 cb             	stac
11b2     11b2:	0f 01 ca             	clac
11b5     11b5:	0f 01 cb             	stac
11b8     11b8:	0f 01 ca             	clac
11bb     11bb:	0f 01 cb             	stac
11be     11be:	0f 01 ca             	clac
11c1     11c1:	0f 01 cb             	stac
11c4     11c4:	0f 01 ca             	clac
11c7     11c7:	0f 01 cb             	stac
11ca     11ca:	0f 01 ca             	clac
11cd     11cd:	0f 01 cb             	stac
11d0     11d0:	0f 01 ca             	clac
11d3     11d3:	0f 01 cb             	stac
11d6     11d6:	0f 01 ca             	clac
11d9     11d9:	0f 01 ca             	clac
11dc     11dc:	0f 01 cb             	stac
11df     11df:	e8 00 00 00 00       	call   11e4 <.altinstr_replacement+0x11e4>	11e0: R_X86_64_PLT32	rep_movs_alternative-0x4
11e4     11e4:	0f 01 ca             	clac
11e7     11e7:	66 0f ae 38          	clflushopt (%rax)
11eb     11eb:	66 0f ae 30          	clwb   (%rax)
11ef     11ef:	0f 01 cb             	stac
11f2     11f2:	0f 01 ca             	clac
11f5     11f5:	66 0f ae 38          	clflushopt (%rax)
11f9     11f9:	66 0f ae 30          	clwb   (%rax)
11fd     11fd:	66 0f ae 38          	clflushopt (%rax)
1201     1201:	66 0f ae 30          	clwb   (%rax)
1205     1205:	66 0f ae 38          	clflushopt (%rax)
1209     1209:	66 0f ae 30          	clwb   (%rax)
120d     120d:	66 0f ae 38          	clflushopt (%rax)
1211     1211:	66 0f ae 30          	clwb   (%rax)
1215     1215:	66 0f ae 38          	clflushopt (%rax)
1219     1219:	66 0f ae 30          	clwb   (%rax)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
