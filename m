Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277F17F
	for <llvm@lists.linux.dev>; Tue,  2 Aug 2022 01:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659403500; x=1690939500;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0vL/EeMYSWk93pRlO4W4EjzTcKKY55m0BcJ9jxfguP8=;
  b=lbExELx6t12oYz9+wdxr0tBIbTPxUovprY7+a9BTq8Rn0R92GnWZ8NyR
   WGqekVLKe1jus7DZToXRa9MS7dTUWtthSC3sP92jBMuvC0ejg35TSbXhs
   dhVEPh6HPqdrkzhLJYBXWyYuJ9DQPBHd4D/g4B1o0pYWBJ+BLVu3r8NE4
   UmncbJqifzCdqhFKJ2L7O0XM7Nfd9zVhFH2dwNw4sX7qmBO2w6wjH5nNC
   E263mAR1iehAJdkwYkdDH38urfqlXXrqHwXHgi9ZwJs6BxO6kvKdN0iRB
   JBCsy7AzVp4xXQHcHD9ZjnowgDdiX4vx14xKrvXNR7dHg7onqPdd+jePU
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10426"; a="290505939"
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="290505939"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 18:24:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,209,1654585200"; 
   d="scan'208";a="630496594"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Aug 2022 18:24:58 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIgeX-000FXz-1E;
	Tue, 02 Aug 2022 01:24:57 +0000
Date: Tue, 2 Aug 2022 09:24:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android12-kiwi-5.10
 6827/9999] fs/reiserfs/lbalance.o: warning: objtool:
 leaf_move_items()+0xf4c: stack state mismatch: cfa1=7+160 cfa2=7+152
Message-ID: <202208020923.LtQMhQx8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android12-kiwi-5.10
head:   edf4da79d443f97049926ace891b5d6d235f7539
commit: fca16257ca2966b34ef1689ef101170bf932e835 [6827/9999] UPSTREAM: ubsan: remove UBSAN_MISC in favor of individual options
config: x86_64-randconfig-r033-20220801 (https://download.01.org/0day-ci/archive/20220802/202208020923.LtQMhQx8-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/fca16257ca2966b34ef1689ef101170bf932e835
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android12-kiwi-5.10
        git checkout fca16257ca2966b34ef1689ef101170bf932e835
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/reiserfs/lbalance.o: warning: objtool: leaf_move_items()+0xf4c: stack state mismatch: cfa1=7+160 cfa2=7+152
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_cut_from_buffer()+0x1f97: stack state mismatch: cfa1=7+232 cfa2=7+216
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_boundary_item()+0x369c: stack state mismatch: cfa1=7+240 cfa2=7+232
>> fs/reiserfs/lbalance.o: warning: objtool: leaf_copy_items_entirely()+0xd26: stack state mismatch: cfa1=7+256 cfa2=7+248
--
   fs/reiserfs/ibalance.o: warning: objtool: balance_internal()+0x55d7: stack state mismatch: cfa1=7+328 cfa2=7+336
>> fs/reiserfs/ibalance.o: warning: objtool: internal_move_pointers_items()+0x7da: stack state mismatch: cfa1=7+216 cfa2=7+208


objdump-func vmlinux.o leaf_move_items:
0000 0000000000646470 <leaf_move_items>:
0000   646470:	55                   	push   %rbp
0001   646471:	41 57                	push   %r15
0003   646473:	41 56                	push   %r14
0005   646475:	41 55                	push   %r13
0007   646477:	41 54                	push   %r12
0009   646479:	53                   	push   %rbx
000a   64647a:	48 83 ec 60          	sub    $0x60,%rsp
000e   64647e:	4d 89 c5             	mov    %r8,%r13
0011   646481:	41 89 cc             	mov    %ecx,%r12d
0014   646484:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
0019   646489:	49 89 f6             	mov    %rsi,%r14
001c   64648c:	89 fb                	mov    %edi,%ebx
001e   64648e:	4c 8d 7c 24 20       	lea    0x20(%rsp),%r15
0023   646493:	ba 20 00 00 00       	mov    $0x20,%edx
0028   646498:	4c 89 ff             	mov    %r15,%rdi
002b   64649b:	be aa 00 00 00       	mov    $0xaa,%esi
0030   6464a0:	e8 00 00 00 00       	call   6464a5 <leaf_move_items+0x35>	6464a1: R_X86_64_PLT32	memset-0x4
0035   6464a5:	48 89 e5             	mov    %rsp,%rbp
0038   6464a8:	ba 20 00 00 00       	mov    $0x20,%edx
003d   6464ad:	48 89 ef             	mov    %rbp,%rdi
0040   6464b0:	be aa 00 00 00       	mov    $0xaa,%esi
0045   6464b5:	e8 00 00 00 00       	call   6464ba <leaf_move_items+0x4a>	6464b6: R_X86_64_PLT32	memset-0x4
004a   6464ba:	ba 20 00 00 00       	mov    $0x20,%edx
004f   6464bf:	4c 89 ff             	mov    %r15,%rdi
0052   6464c2:	31 f6                	xor    %esi,%esi
0054   6464c4:	e8 00 00 00 00       	call   6464c9 <leaf_move_items+0x59>	6464c5: R_X86_64_PLT32	memset-0x4
0059   6464c9:	ba 20 00 00 00       	mov    $0x20,%edx
005e   6464ce:	48 89 ef             	mov    %rbp,%rdi
0061   6464d1:	31 f6                	xor    %esi,%esi
0063   6464d3:	e8 00 00 00 00       	call   6464d8 <leaf_move_items+0x68>	6464d4: R_X86_64_PLT32	memset-0x4
0068   6464d8:	83 fb 01             	cmp    $0x1,%ebx
006b   6464db:	48 89 5c 24 58       	mov    %rbx,0x58(%rsp)
0070   6464e0:	0f 8e 3d 02 00 00    	jle    646723 <leaf_move_items+0x2b3>
0076   6464e6:	83 fb 02             	cmp    $0x2,%ebx
0079   6464e9:	0f 84 88 04 00 00    	je     646977 <leaf_move_items+0x507>
007f   6464ef:	83 fb 03             	cmp    $0x3,%ebx
0082   6464f2:	0f 84 cb 05 00 00    	je     646ac3 <leaf_move_items+0x653>
0088   6464f8:	83 fb 04             	cmp    $0x4,%ebx
008b   6464fb:	0f 85 fd 0e 00 00    	jne    6473fe <leaf_move_items+0xf8e>
0091   646501:	4c 89 6c 24 48       	mov    %r13,0x48(%rsp)
0096   646506:	44 89 64 24 44       	mov    %r12d,0x44(%rsp)
009b   64650b:	48 c1 ed 03          	shr    $0x3,%rbp
009f   64650f:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
00a9   646519:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
00ae   64651e:	48 89 c5             	mov    %rax,%rbp
00b1   646521:	74 08                	je     64652b <leaf_move_items+0xbb>
00b3   646523:	48 89 e7             	mov    %rsp,%rdi
00b6   646526:	e8 00 00 00 00       	call   64652b <leaf_move_items+0xbb>	646527: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
00bb   64652b:	4c 89 34 24          	mov    %r14,(%rsp)
00bf   64652f:	4d 8d 66 18          	lea    0x18(%r14),%r12
00c3   646533:	4d 89 e5             	mov    %r12,%r13
00c6   646536:	49 c1 ed 03          	shr    $0x3,%r13
00ca   64653a:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
00d0   646540:	74 08                	je     64654a <leaf_move_items+0xda>
00d2   646542:	4c 89 e7             	mov    %r12,%rdi
00d5   646545:	e8 00 00 00 00       	call   64654a <leaf_move_items+0xda>	646546: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00da   64654a:	49 8b 1c 24          	mov    (%r12),%rbx
00de   64654e:	48 89 d8             	mov    %rbx,%rax
00e1   646551:	48 c1 e8 03          	shr    $0x3,%rax
00e5   646555:	8a 04 28             	mov    (%rax,%rbp,1),%al
00e8   646558:	84 c0                	test   %al,%al
00ea   64655a:	0f 85 d2 0b 00 00    	jne    647132 <leaf_move_items+0xcc2>
00f0   646560:	48 63 2b             	movslq (%rbx),%rbp
00f3   646563:	48 83 c3 08          	add    $0x8,%rbx
00f7   646567:	48 83 fd 08          	cmp    $0x8,%rbp
00fb   64656b:	0f 83 51 0e 00 00    	jae    6473c2 <leaf_move_items+0xf52>
0101   646571:	48 c1 e5 04          	shl    $0x4,%rbp
0105   646575:	48 01 eb             	add    %rbp,%rbx
0108   646578:	48 89 d8             	mov    %rbx,%rax
010b   64657b:	48 c1 e8 03          	shr    $0x3,%rax
010f   64657f:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0119   646589:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
011d   64658d:	74 08                	je     646597 <leaf_move_items+0x127>
011f   64658f:	48 89 df             	mov    %rbx,%rdi
0122   646592:	e8 00 00 00 00       	call   646597 <leaf_move_items+0x127>	646593: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0127   646597:	48 8b 1b             	mov    (%rbx),%rbx
012a   64659a:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
012f   64659f:	48 89 f8             	mov    %rdi,%rax
0132   6465a2:	48 c1 e8 03          	shr    $0x3,%rax
0136   6465a6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
013a   6465aa:	74 05                	je     6465b1 <leaf_move_items+0x141>
013c   6465ac:	e8 00 00 00 00       	call   6465b1 <leaf_move_items+0x141>	6465ad: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0141   6465b1:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0146   6465b6:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
014c   6465bc:	74 08                	je     6465c6 <leaf_move_items+0x156>
014e   6465be:	4c 89 e7             	mov    %r12,%rdi
0151   6465c1:	e8 00 00 00 00       	call   6465c6 <leaf_move_items+0x156>	6465c2: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0156   6465c6:	49 8b 1c 24          	mov    (%r12),%rbx
015a   6465ca:	48 89 d8             	mov    %rbx,%rax
015d   6465cd:	48 c1 e8 03          	shr    $0x3,%rax
0161   6465d1:	8a 04 28             	mov    (%rax,%rbp,1),%al
0164   6465d4:	84 c0                	test   %al,%al
0166   6465d6:	0f 85 73 0b 00 00    	jne    64714f <leaf_move_items+0xcdf>
016c   6465dc:	8b 03                	mov    (%rbx),%eax
016e   6465de:	48 83 c3 08          	add    $0x8,%rbx
0172   6465e2:	ff c8                	dec    %eax
0174   6465e4:	48 63 e8             	movslq %eax,%rbp
0177   6465e7:	83 fd 08             	cmp    $0x8,%ebp
017a   6465ea:	0f 83 e6 0d 00 00    	jae    6473d6 <leaf_move_items+0xf66>
0180   6465f0:	48 c1 e5 04          	shl    $0x4,%rbp
0184   6465f4:	48 01 eb             	add    %rbp,%rbx
0187   6465f7:	48 89 d8             	mov    %rbx,%rax
018a   6465fa:	48 c1 e8 03          	shr    $0x3,%rax
018e   6465fe:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0198   646608:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
019c   64660c:	74 08                	je     646616 <leaf_move_items+0x1a6>
019e   64660e:	48 89 df             	mov    %rbx,%rdi
01a1   646611:	e8 00 00 00 00       	call   646616 <leaf_move_items+0x1a6>	646612: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01a6   646616:	48 8b 1b             	mov    (%rbx),%rbx
01a9   646619:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
01ae   64661e:	48 89 f8             	mov    %rdi,%rax
01b1   646621:	48 c1 e8 03          	shr    $0x3,%rax
01b5   646625:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
01b9   646629:	74 05                	je     646630 <leaf_move_items+0x1c0>
01bb   64662b:	e8 00 00 00 00       	call   646630 <leaf_move_items+0x1c0>	64662c: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
01c0   646630:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
01c5   646635:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
01cb   64663b:	74 08                	je     646645 <leaf_move_items+0x1d5>
01cd   64663d:	4c 89 e7             	mov    %r12,%rdi
01d0   646640:	e8 00 00 00 00       	call   646645 <leaf_move_items+0x1d5>	646641: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01d5   646645:	49 8b 1c 24          	mov    (%r12),%rbx
01d9   646649:	48 89 d8             	mov    %rbx,%rax
01dc   64664c:	48 c1 e8 03          	shr    $0x3,%rax
01e0   646650:	8a 04 28             	mov    (%rax,%rbp,1),%al
01e3   646653:	84 c0                	test   %al,%al
01e5   646655:	44 8b 64 24 44       	mov    0x44(%rsp),%r12d
01ea   64665a:	4c 8b 6c 24 48       	mov    0x48(%rsp),%r13
01ef   64665f:	0f 85 07 0b 00 00    	jne    64716c <leaf_move_items+0xcfc>
01f5   646665:	8b 03                	mov    (%rbx),%eax
01f7   646667:	48 83 c3 08          	add    $0x8,%rbx
01fb   64666b:	ff c8                	dec    %eax
01fd   64666d:	48 63 e8             	movslq %eax,%rbp
0200   646670:	83 fd 08             	cmp    $0x8,%ebp
0203   646673:	0f 83 71 0d 00 00    	jae    6473ea <leaf_move_items+0xf7a>
0209   646679:	48 c1 e5 04          	shl    $0x4,%rbp
020d   64667d:	48 01 eb             	add    %rbp,%rbx
0210   646680:	48 83 c3 08          	add    $0x8,%rbx
0214   646684:	48 89 d8             	mov    %rbx,%rax
0217   646687:	48 c1 e8 03          	shr    $0x3,%rax
021b   64668b:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0225   646695:	8a 04 28             	mov    (%rax,%rbp,1),%al
0228   646698:	84 c0                	test   %al,%al
022a   64669a:	0f 85 e9 0a 00 00    	jne    647189 <leaf_move_items+0xd19>
0230   6466a0:	8b 1b                	mov    (%rbx),%ebx
0232   6466a2:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
0237   6466a7:	48 89 f8             	mov    %rdi,%rax
023a   6466aa:	48 c1 e8 03          	shr    $0x3,%rax
023e   6466ae:	8a 04 28             	mov    (%rax,%rbp,1),%al
0241   6466b1:	84 c0                	test   %al,%al
0243   6466b3:	0f 85 ed 0a 00 00    	jne    6471a6 <leaf_move_items+0xd36>
0249   6466b9:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
024d   6466bd:	49 c1 ef 03          	shr    $0x3,%r15
0251   6466c1:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
0256   6466c6:	74 0a                	je     6466d2 <leaf_move_items+0x262>
0258   6466c8:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
025d   6466cd:	e8 00 00 00 00       	call   6466d2 <leaf_move_items+0x262>	6466ce: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0262   6466d2:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0267   6466d7:	4c 89 77 f8          	mov    %r14,-0x8(%rdi)
026b   6466db:	48 89 f8             	mov    %rdi,%rax
026e   6466de:	48 c1 e8 03          	shr    $0x3,%rax
0272   6466e2:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0276   6466e6:	74 05                	je     6466ed <leaf_move_items+0x27d>
0278   6466e8:	e8 00 00 00 00       	call   6466ed <leaf_move_items+0x27d>	6466e9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
027d   6466ed:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0282   6466f2:	4c 89 6f f8          	mov    %r13,-0x8(%rdi)
0286   6466f6:	48 89 f8             	mov    %rdi,%rax
0289   6466f9:	48 c1 e8 03          	shr    $0x3,%rax
028d   6466fd:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0291   646701:	74 05                	je     646708 <leaf_move_items+0x298>
0293   646703:	e8 00 00 00 00       	call   646708 <leaf_move_items+0x298>	646704: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0298   646708:	48 c7 44 24 30 00 00 00 00 	movq   $0x0,0x30(%rsp)
02a1   646711:	c7 44 24 48 01 00 00 00 	movl   $0x1,0x48(%rsp)
02a9   646719:	31 db                	xor    %ebx,%ebx
02ab   64671b:	45 31 ed             	xor    %r13d,%r13d
02ae   64671e:	e9 52 07 00 00       	jmp    646e75 <leaf_move_items+0xa05>
02b3   646723:	85 db                	test   %ebx,%ebx
02b5   646725:	44 89 64 24 44       	mov    %r12d,0x44(%rsp)
02ba   64672a:	0f 84 f7 04 00 00    	je     646c27 <leaf_move_items+0x7b7>
02c0   646730:	83 fb 01             	cmp    $0x1,%ebx
02c3   646733:	0f 85 c5 0c 00 00    	jne    6473fe <leaf_move_items+0xf8e>
02c9   646739:	48 c1 ed 03          	shr    $0x3,%rbp
02cd   64673d:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
02d7   646747:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
02dc   64674c:	48 89 c5             	mov    %rax,%rbp
02df   64674f:	74 08                	je     646759 <leaf_move_items+0x2e9>
02e1   646751:	48 89 e7             	mov    %rsp,%rdi
02e4   646754:	e8 00 00 00 00       	call   646759 <leaf_move_items+0x2e9>	646755: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
02e9   646759:	4c 89 34 24          	mov    %r14,(%rsp)
02ed   64675d:	4d 8d 66 18          	lea    0x18(%r14),%r12
02f1   646761:	4d 89 e5             	mov    %r12,%r13
02f4   646764:	49 c1 ed 03          	shr    $0x3,%r13
02f8   646768:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
02fe   64676e:	74 08                	je     646778 <leaf_move_items+0x308>
0300   646770:	4c 89 e7             	mov    %r12,%rdi
0303   646773:	e8 00 00 00 00       	call   646778 <leaf_move_items+0x308>	646774: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0308   646778:	49 8b 1c 24          	mov    (%r12),%rbx
030c   64677c:	48 89 d8             	mov    %rbx,%rax
030f   64677f:	48 c1 e8 03          	shr    $0x3,%rax
0313   646783:	8a 04 28             	mov    (%rax,%rbp,1),%al
0316   646786:	84 c0                	test   %al,%al
0318   646788:	0f 85 32 0a 00 00    	jne    6471c0 <leaf_move_items+0xd50>
031e   64678e:	48 63 2b             	movslq (%rbx),%rbp
0321   646791:	48 83 c3 08          	add    $0x8,%rbx
0325   646795:	48 83 fd 08          	cmp    $0x8,%rbp
0329   646799:	0f 83 8f 0c 00 00    	jae    64742e <leaf_move_items+0xfbe>
032f   64679f:	48 c1 e5 04          	shl    $0x4,%rbp
0333   6467a3:	48 01 eb             	add    %rbp,%rbx
0336   6467a6:	48 89 d8             	mov    %rbx,%rax
0339   6467a9:	48 c1 e8 03          	shr    $0x3,%rax
033d   6467ad:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0347   6467b7:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
034b   6467bb:	74 08                	je     6467c5 <leaf_move_items+0x355>
034d   6467bd:	48 89 df             	mov    %rbx,%rdi
0350   6467c0:	e8 00 00 00 00       	call   6467c5 <leaf_move_items+0x355>	6467c1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0355   6467c5:	48 8b 1b             	mov    (%rbx),%rbx
0358   6467c8:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
035d   6467cd:	48 89 f8             	mov    %rdi,%rax
0360   6467d0:	48 c1 e8 03          	shr    $0x3,%rax
0364   6467d4:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0368   6467d8:	74 05                	je     6467df <leaf_move_items+0x36f>
036a   6467da:	e8 00 00 00 00       	call   6467df <leaf_move_items+0x36f>	6467db: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
036f   6467df:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0374   6467e4:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
037a   6467ea:	74 08                	je     6467f4 <leaf_move_items+0x384>
037c   6467ec:	4c 89 e7             	mov    %r12,%rdi
037f   6467ef:	e8 00 00 00 00       	call   6467f4 <leaf_move_items+0x384>	6467f0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0384   6467f4:	49 8b 1c 24          	mov    (%r12),%rbx
0388   6467f8:	48 89 d8             	mov    %rbx,%rax
038b   6467fb:	48 c1 e8 03          	shr    $0x3,%rax
038f   6467ff:	8a 04 28             	mov    (%rax,%rbp,1),%al
0392   646802:	84 c0                	test   %al,%al
0394   646804:	0f 85 d3 09 00 00    	jne    6471dd <leaf_move_items+0xd6d>
039a   64680a:	8b 03                	mov    (%rbx),%eax
039c   64680c:	48 83 c3 08          	add    $0x8,%rbx
03a0   646810:	ff c8                	dec    %eax
03a2   646812:	48 63 e8             	movslq %eax,%rbp
03a5   646815:	83 fd 08             	cmp    $0x8,%ebp
03a8   646818:	0f 83 24 0c 00 00    	jae    647442 <leaf_move_items+0xfd2>
03ae   64681e:	48 c1 e5 04          	shl    $0x4,%rbp
03b2   646822:	48 01 eb             	add    %rbp,%rbx
03b5   646825:	48 89 d8             	mov    %rbx,%rax
03b8   646828:	48 c1 e8 03          	shr    $0x3,%rax
03bc   64682c:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
03c6   646836:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
03ca   64683a:	74 08                	je     646844 <leaf_move_items+0x3d4>
03cc   64683c:	48 89 df             	mov    %rbx,%rdi
03cf   64683f:	e8 00 00 00 00       	call   646844 <leaf_move_items+0x3d4>	646840: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
03d4   646844:	48 8b 1b             	mov    (%rbx),%rbx
03d7   646847:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
03dc   64684c:	48 89 f8             	mov    %rdi,%rax
03df   64684f:	48 c1 e8 03          	shr    $0x3,%rax
03e3   646853:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
03e7   646857:	74 05                	je     64685e <leaf_move_items+0x3ee>
03e9   646859:	e8 00 00 00 00       	call   64685e <leaf_move_items+0x3ee>	64685a: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
03ee   64685e:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
03f3   646863:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
03f9   646869:	74 08                	je     646873 <leaf_move_items+0x403>
03fb   64686b:	4c 89 e7             	mov    %r12,%rdi
03fe   64686e:	e8 00 00 00 00       	call   646873 <leaf_move_items+0x403>	64686f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0403   646873:	49 8b 1c 24          	mov    (%r12),%rbx
0407   646877:	48 89 d8             	mov    %rbx,%rax
040a   64687a:	48 c1 e8 03          	shr    $0x3,%rax
040e   64687e:	8a 04 28             	mov    (%rax,%rbp,1),%al
0411   646881:	84 c0                	test   %al,%al
0413   646883:	44 8b 64 24 44       	mov    0x44(%rsp),%r12d
0418   646888:	0f 85 6c 09 00 00    	jne    6471fa <leaf_move_items+0xd8a>
041e   64688e:	8b 03                	mov    (%rbx),%eax
0420   646890:	48 83 c3 08          	add    $0x8,%rbx
0424   646894:	ff c8                	dec    %eax
0426   646896:	48 63 e8             	movslq %eax,%rbp
0429   646899:	83 fd 08             	cmp    $0x8,%ebp
042c   64689c:	0f 83 b4 0b 00 00    	jae    647456 <leaf_move_items+0xfe6>
0432   6468a2:	48 c1 e5 04          	shl    $0x4,%rbp
0436   6468a6:	48 01 eb             	add    %rbp,%rbx
0439   6468a9:	48 83 c3 08          	add    $0x8,%rbx
043d   6468ad:	48 89 d8             	mov    %rbx,%rax
0440   6468b0:	48 c1 e8 03          	shr    $0x3,%rax
0444   6468b4:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
044e   6468be:	8a 04 28             	mov    (%rax,%rbp,1),%al
0451   6468c1:	84 c0                	test   %al,%al
0453   6468c3:	0f 85 4e 09 00 00    	jne    647217 <leaf_move_items+0xda7>
0459   6468c9:	8b 1b                	mov    (%rbx),%ebx
045b   6468cb:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
0460   6468d0:	48 89 f8             	mov    %rdi,%rax
0463   6468d3:	48 c1 e8 03          	shr    $0x3,%rax
0467   6468d7:	8a 04 28             	mov    (%rax,%rbp,1),%al
046a   6468da:	84 c0                	test   %al,%al
046c   6468dc:	0f 85 52 09 00 00    	jne    647234 <leaf_move_items+0xdc4>
0472   6468e2:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
0476   6468e6:	49 c1 ef 03          	shr    $0x3,%r15
047a   6468ea:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
047f   6468ef:	74 0a                	je     6468fb <leaf_move_items+0x48b>
0481   6468f1:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0486   6468f6:	e8 00 00 00 00       	call   6468fb <leaf_move_items+0x48b>	6468f7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
048b   6468fb:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
0490   646900:	49 8d 5e 48          	lea    0x48(%r14),%rbx
0494   646904:	48 89 d8             	mov    %rbx,%rax
0497   646907:	48 c1 e8 03          	shr    $0x3,%rax
049b   64690b:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
049f   64690f:	74 08                	je     646919 <leaf_move_items+0x4a9>
04a1   646911:	48 89 df             	mov    %rbx,%rdi
04a4   646914:	e8 00 00 00 00       	call   646919 <leaf_move_items+0x4a9>	646915: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04a9   646919:	48 8b 1b             	mov    (%rbx),%rbx
04ac   64691c:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
04b1   646921:	48 89 f8             	mov    %rdi,%rax
04b4   646924:	48 c1 e8 03          	shr    $0x3,%rax
04b8   646928:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04bc   64692c:	74 05                	je     646933 <leaf_move_items+0x4c3>
04be   64692e:	e8 00 00 00 00       	call   646933 <leaf_move_items+0x4c3>	64692f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
04c3   646933:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
04c8   646938:	49 8d 9e 98 00 00 00 	lea    0x98(%r14),%rbx
04cf   64693f:	48 89 d8             	mov    %rbx,%rax
04d2   646942:	48 c1 e8 03          	shr    $0x3,%rax
04d6   646946:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04da   64694a:	74 08                	je     646954 <leaf_move_items+0x4e4>
04dc   64694c:	48 89 df             	mov    %rbx,%rdi
04df   64694f:	e8 00 00 00 00       	call   646954 <leaf_move_items+0x4e4>	646950: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04e4   646954:	48 8b 1b             	mov    (%rbx),%rbx
04e7   646957:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
04ec   64695c:	48 89 f8             	mov    %rdi,%rax
04ef   64695f:	48 c1 e8 03          	shr    $0x3,%rax
04f3   646963:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
04f7   646967:	0f 84 99 02 00 00    	je     646c06 <leaf_move_items+0x796>
04fd   64696d:	e8 00 00 00 00       	call   646972 <leaf_move_items+0x502>	64696e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0502   646972:	e9 8f 02 00 00       	jmp    646c06 <leaf_move_items+0x796>
0507   646977:	48 c1 ed 03          	shr    $0x3,%rbp
050b   64697b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0515   646985:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
051a   64698a:	48 89 c5             	mov    %rax,%rbp
051d   64698d:	74 08                	je     646997 <leaf_move_items+0x527>
051f   64698f:	48 89 e7             	mov    %rsp,%rdi
0522   646992:	e8 00 00 00 00       	call   646997 <leaf_move_items+0x527>	646993: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0527   646997:	4c 89 34 24          	mov    %r14,(%rsp)
052b   64699b:	49 8d 5e 48          	lea    0x48(%r14),%rbx
052f   64699f:	48 89 d8             	mov    %rbx,%rax
0532   6469a2:	48 c1 e8 03          	shr    $0x3,%rax
0536   6469a6:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
053a   6469aa:	74 08                	je     6469b4 <leaf_move_items+0x544>
053c   6469ac:	48 89 df             	mov    %rbx,%rdi
053f   6469af:	e8 00 00 00 00       	call   6469b4 <leaf_move_items+0x544>	6469b0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0544   6469b4:	48 8b 1b             	mov    (%rbx),%rbx
0547   6469b7:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
054c   6469bc:	48 89 f8             	mov    %rdi,%rax
054f   6469bf:	48 c1 e8 03          	shr    $0x3,%rax
0553   6469c3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0557   6469c7:	74 05                	je     6469ce <leaf_move_items+0x55e>
0559   6469c9:	e8 00 00 00 00       	call   6469ce <leaf_move_items+0x55e>	6469ca: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
055e   6469ce:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0563   6469d3:	49 8d 9e 98 00 00 00 	lea    0x98(%r14),%rbx
056a   6469da:	48 89 d8             	mov    %rbx,%rax
056d   6469dd:	48 c1 e8 03          	shr    $0x3,%rax
0571   6469e1:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0575   6469e5:	74 08                	je     6469ef <leaf_move_items+0x57f>
0577   6469e7:	48 89 df             	mov    %rbx,%rdi
057a   6469ea:	e8 00 00 00 00       	call   6469ef <leaf_move_items+0x57f>	6469eb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
057f   6469ef:	48 8b 1b             	mov    (%rbx),%rbx
0582   6469f2:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
0587   6469f7:	48 89 f8             	mov    %rdi,%rax
058a   6469fa:	48 c1 e8 03          	shr    $0x3,%rax
058e   6469fe:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0592   646a02:	74 05                	je     646a09 <leaf_move_items+0x599>
0594   646a04:	e8 00 00 00 00       	call   646a09 <leaf_move_items+0x599>	646a05: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0599   646a09:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
059e   646a0e:	4c 89 f7             	mov    %r14,%rdi
05a1   646a11:	31 f6                	xor    %esi,%esi
05a3   646a13:	e8 00 00 00 00       	call   646a18 <leaf_move_items+0x5a8>	646a14: R_X86_64_PLT32	get_right_neighbor_position-0x4
05a8   646a18:	89 c3                	mov    %eax,%ebx
05aa   646a1a:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
05af   646a1f:	48 89 f8             	mov    %rdi,%rax
05b2   646a22:	48 c1 e8 03          	shr    $0x3,%rax
05b6   646a26:	8a 04 28             	mov    (%rax,%rbp,1),%al
05b9   646a29:	84 c0                	test   %al,%al
05bb   646a2b:	0f 85 1d 08 00 00    	jne    64724e <leaf_move_items+0xdde>
05c1   646a31:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
05c5   646a35:	49 c1 ef 03          	shr    $0x3,%r15
05c9   646a39:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
05ce   646a3e:	74 0a                	je     646a4a <leaf_move_items+0x5da>
05d0   646a40:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
05d5   646a45:	e8 00 00 00 00       	call   646a4a <leaf_move_items+0x5da>	646a46: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
05da   646a4a:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
05df   646a4f:	49 8d 5e 20          	lea    0x20(%r14),%rbx
05e3   646a53:	48 89 d8             	mov    %rbx,%rax
05e6   646a56:	48 c1 e8 03          	shr    $0x3,%rax
05ea   646a5a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
05ee   646a5e:	74 08                	je     646a68 <leaf_move_items+0x5f8>
05f0   646a60:	48 89 df             	mov    %rbx,%rdi
05f3   646a63:	e8 00 00 00 00       	call   646a68 <leaf_move_items+0x5f8>	646a64: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05f8   646a68:	48 8b 1b             	mov    (%rbx),%rbx
05fb   646a6b:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0600   646a70:	48 89 f8             	mov    %rdi,%rax
0603   646a73:	48 c1 e8 03          	shr    $0x3,%rax
0607   646a77:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
060b   646a7b:	74 05                	je     646a82 <leaf_move_items+0x612>
060d   646a7d:	e8 00 00 00 00       	call   646a82 <leaf_move_items+0x612>	646a7e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0612   646a82:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0617   646a87:	49 8d 5e 70          	lea    0x70(%r14),%rbx
061b   646a8b:	48 89 d8             	mov    %rbx,%rax
061e   646a8e:	48 c1 e8 03          	shr    $0x3,%rax
0622   646a92:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0626   646a96:	74 08                	je     646aa0 <leaf_move_items+0x630>
0628   646a98:	48 89 df             	mov    %rbx,%rdi
062b   646a9b:	e8 00 00 00 00       	call   646aa0 <leaf_move_items+0x630>	646a9c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0630   646aa0:	48 8b 1b             	mov    (%rbx),%rbx
0633   646aa3:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0638   646aa8:	48 89 f8             	mov    %rdi,%rax
063b   646aab:	48 c1 e8 03          	shr    $0x3,%rax
063f   646aaf:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0643   646ab3:	0f 84 a0 03 00 00    	je     646e59 <leaf_move_items+0x9e9>
0649   646ab9:	e8 00 00 00 00       	call   646abe <leaf_move_items+0x64e>	646aba: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
064e   646abe:	e9 96 03 00 00       	jmp    646e59 <leaf_move_items+0x9e9>
0653   646ac3:	48 c1 ed 03          	shr    $0x3,%rbp
0657   646ac7:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0661   646ad1:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
0666   646ad6:	48 89 c5             	mov    %rax,%rbp
0669   646ad9:	74 08                	je     646ae3 <leaf_move_items+0x673>
066b   646adb:	48 89 e7             	mov    %rsp,%rdi
066e   646ade:	e8 00 00 00 00       	call   646ae3 <leaf_move_items+0x673>	646adf: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0673   646ae3:	4c 89 34 24          	mov    %r14,(%rsp)
0677   646ae7:	49 8d 5e 20          	lea    0x20(%r14),%rbx
067b   646aeb:	48 89 d8             	mov    %rbx,%rax
067e   646aee:	48 c1 e8 03          	shr    $0x3,%rax
0682   646af2:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0686   646af6:	74 08                	je     646b00 <leaf_move_items+0x690>
0688   646af8:	48 89 df             	mov    %rbx,%rdi
068b   646afb:	e8 00 00 00 00       	call   646b00 <leaf_move_items+0x690>	646afc: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0690   646b00:	48 8b 1b             	mov    (%rbx),%rbx
0693   646b03:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0698   646b08:	48 89 f8             	mov    %rdi,%rax
069b   646b0b:	48 c1 e8 03          	shr    $0x3,%rax
069f   646b0f:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06a3   646b13:	74 05                	je     646b1a <leaf_move_items+0x6aa>
06a5   646b15:	e8 00 00 00 00       	call   646b1a <leaf_move_items+0x6aa>	646b16: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06aa   646b1a:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
06af   646b1f:	49 8d 5e 70          	lea    0x70(%r14),%rbx
06b3   646b23:	48 89 d8             	mov    %rbx,%rax
06b6   646b26:	48 c1 e8 03          	shr    $0x3,%rax
06ba   646b2a:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06be   646b2e:	74 08                	je     646b38 <leaf_move_items+0x6c8>
06c0   646b30:	48 89 df             	mov    %rbx,%rdi
06c3   646b33:	e8 00 00 00 00       	call   646b38 <leaf_move_items+0x6c8>	646b34: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06c8   646b38:	48 8b 1b             	mov    (%rbx),%rbx
06cb   646b3b:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
06d0   646b40:	48 89 f8             	mov    %rdi,%rax
06d3   646b43:	48 c1 e8 03          	shr    $0x3,%rax
06d7   646b47:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
06db   646b4b:	74 05                	je     646b52 <leaf_move_items+0x6e2>
06dd   646b4d:	e8 00 00 00 00       	call   646b52 <leaf_move_items+0x6e2>	646b4e: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
06e2   646b52:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
06e7   646b57:	4c 89 f7             	mov    %r14,%rdi
06ea   646b5a:	31 f6                	xor    %esi,%esi
06ec   646b5c:	e8 00 00 00 00       	call   646b61 <leaf_move_items+0x6f1>	646b5d: R_X86_64_PLT32	get_left_neighbor_position-0x4
06f1   646b61:	89 c3                	mov    %eax,%ebx
06f3   646b63:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
06f8   646b68:	48 89 f8             	mov    %rdi,%rax
06fb   646b6b:	48 c1 e8 03          	shr    $0x3,%rax
06ff   646b6f:	8a 04 28             	mov    (%rax,%rbp,1),%al
0702   646b72:	84 c0                	test   %al,%al
0704   646b74:	0f 85 ee 06 00 00    	jne    647268 <leaf_move_items+0xdf8>
070a   646b7a:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
070e   646b7e:	49 c1 ef 03          	shr    $0x3,%r15
0712   646b82:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
0717   646b87:	74 0a                	je     646b93 <leaf_move_items+0x723>
0719   646b89:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
071e   646b8e:	e8 00 00 00 00       	call   646b93 <leaf_move_items+0x723>	646b8f: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0723   646b93:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
0728   646b98:	49 8d 5e 48          	lea    0x48(%r14),%rbx
072c   646b9c:	48 89 d8             	mov    %rbx,%rax
072f   646b9f:	48 c1 e8 03          	shr    $0x3,%rax
0733   646ba3:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0737   646ba7:	74 08                	je     646bb1 <leaf_move_items+0x741>
0739   646ba9:	48 89 df             	mov    %rbx,%rdi
073c   646bac:	e8 00 00 00 00       	call   646bb1 <leaf_move_items+0x741>	646bad: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0741   646bb1:	48 8b 1b             	mov    (%rbx),%rbx
0744   646bb4:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0749   646bb9:	48 89 f8             	mov    %rdi,%rax
074c   646bbc:	48 c1 e8 03          	shr    $0x3,%rax
0750   646bc0:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0754   646bc4:	74 05                	je     646bcb <leaf_move_items+0x75b>
0756   646bc6:	e8 00 00 00 00       	call   646bcb <leaf_move_items+0x75b>	646bc7: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
075b   646bcb:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
0760   646bd0:	49 8d 9e 98 00 00 00 	lea    0x98(%r14),%rbx
0767   646bd7:	48 89 d8             	mov    %rbx,%rax
076a   646bda:	48 c1 e8 03          	shr    $0x3,%rax
076e   646bde:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0772   646be2:	74 08                	je     646bec <leaf_move_items+0x77c>
0774   646be4:	48 89 df             	mov    %rbx,%rdi
0777   646be7:	e8 00 00 00 00       	call   646bec <leaf_move_items+0x77c>	646be8: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
077c   646bec:	48 8b 1b             	mov    (%rbx),%rbx
077f   646bef:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
0784   646bf4:	48 89 f8             	mov    %rdi,%rax
0787   646bf7:	48 c1 e8 03          	shr    $0x3,%rax
078b   646bfb:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
078f   646bff:	74 05                	je     646c06 <leaf_move_items+0x796>
0791   646c01:	e8 00 00 00 00       	call   646c06 <leaf_move_items+0x796>	646c02: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0796   646c06:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
079b   646c0b:	45 31 ed             	xor    %r13d,%r13d
079e   646c0e:	4c 89 f7             	mov    %r14,%rdi
07a1   646c11:	31 f6                	xor    %esi,%esi
07a3   646c13:	e8 00 00 00 00       	call   646c18 <leaf_move_items+0x7a8>	646c14: R_X86_64_PLT32	get_right_neighbor_position-0x4
07a8   646c18:	89 c3                	mov    %eax,%ebx
07aa   646c1a:	c7 44 24 48 01 00 00 00 	movl   $0x1,0x48(%rsp)
07b2   646c22:	e9 4e 02 00 00       	jmp    646e75 <leaf_move_items+0xa05>
07b7   646c27:	48 c1 ed 03          	shr    $0x3,%rbp
07bb   646c2b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
07c5   646c35:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
07ca   646c3a:	48 89 c5             	mov    %rax,%rbp
07cd   646c3d:	74 08                	je     646c47 <leaf_move_items+0x7d7>
07cf   646c3f:	48 89 e7             	mov    %rsp,%rdi
07d2   646c42:	e8 00 00 00 00       	call   646c47 <leaf_move_items+0x7d7>	646c43: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
07d7   646c47:	4c 89 34 24          	mov    %r14,(%rsp)
07db   646c4b:	4d 8d 66 18          	lea    0x18(%r14),%r12
07df   646c4f:	4d 89 e5             	mov    %r12,%r13
07e2   646c52:	49 c1 ed 03          	shr    $0x3,%r13
07e6   646c56:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
07ec   646c5c:	74 08                	je     646c66 <leaf_move_items+0x7f6>
07ee   646c5e:	4c 89 e7             	mov    %r12,%rdi
07f1   646c61:	e8 00 00 00 00       	call   646c66 <leaf_move_items+0x7f6>	646c62: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07f6   646c66:	49 8b 1c 24          	mov    (%r12),%rbx
07fa   646c6a:	48 89 d8             	mov    %rbx,%rax
07fd   646c6d:	48 c1 e8 03          	shr    $0x3,%rax
0801   646c71:	8a 04 28             	mov    (%rax,%rbp,1),%al
0804   646c74:	84 c0                	test   %al,%al
0806   646c76:	0f 85 06 06 00 00    	jne    647282 <leaf_move_items+0xe12>
080c   646c7c:	48 63 2b             	movslq (%rbx),%rbp
080f   646c7f:	48 83 c3 08          	add    $0x8,%rbx
0813   646c83:	48 83 fd 08          	cmp    $0x8,%rbp
0817   646c87:	0f 83 dd 07 00 00    	jae    64746a <leaf_move_items+0xffa>
081d   646c8d:	48 c1 e5 04          	shl    $0x4,%rbp
0821   646c91:	48 01 eb             	add    %rbp,%rbx
0824   646c94:	48 89 d8             	mov    %rbx,%rax
0827   646c97:	48 c1 e8 03          	shr    $0x3,%rax
082b   646c9b:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0835   646ca5:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0839   646ca9:	74 08                	je     646cb3 <leaf_move_items+0x843>
083b   646cab:	48 89 df             	mov    %rbx,%rdi
083e   646cae:	e8 00 00 00 00       	call   646cb3 <leaf_move_items+0x843>	646caf: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0843   646cb3:	48 8b 1b             	mov    (%rbx),%rbx
0846   646cb6:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
084b   646cbb:	48 89 f8             	mov    %rdi,%rax
084e   646cbe:	48 c1 e8 03          	shr    $0x3,%rax
0852   646cc2:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0856   646cc6:	74 05                	je     646ccd <leaf_move_items+0x85d>
0858   646cc8:	e8 00 00 00 00       	call   646ccd <leaf_move_items+0x85d>	646cc9: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
085d   646ccd:	48 89 5c 24 08       	mov    %rbx,0x8(%rsp)
0862   646cd2:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
0868   646cd8:	74 08                	je     646ce2 <leaf_move_items+0x872>
086a   646cda:	4c 89 e7             	mov    %r12,%rdi
086d   646cdd:	e8 00 00 00 00       	call   646ce2 <leaf_move_items+0x872>	646cde: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0872   646ce2:	49 8b 1c 24          	mov    (%r12),%rbx
0876   646ce6:	48 89 d8             	mov    %rbx,%rax
0879   646ce9:	48 c1 e8 03          	shr    $0x3,%rax
087d   646ced:	8a 04 28             	mov    (%rax,%rbp,1),%al
0880   646cf0:	84 c0                	test   %al,%al
0882   646cf2:	0f 85 a7 05 00 00    	jne    64729f <leaf_move_items+0xe2f>
0888   646cf8:	8b 03                	mov    (%rbx),%eax
088a   646cfa:	48 83 c3 08          	add    $0x8,%rbx
088e   646cfe:	ff c8                	dec    %eax
0890   646d00:	48 63 e8             	movslq %eax,%rbp
0893   646d03:	83 fd 08             	cmp    $0x8,%ebp
0896   646d06:	0f 83 72 07 00 00    	jae    64747e <leaf_move_items+0x100e>
089c   646d0c:	48 c1 e5 04          	shl    $0x4,%rbp
08a0   646d10:	48 01 eb             	add    %rbp,%rbx
08a3   646d13:	48 89 d8             	mov    %rbx,%rax
08a6   646d16:	48 c1 e8 03          	shr    $0x3,%rax
08aa   646d1a:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
08b4   646d24:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
08b8   646d28:	74 08                	je     646d32 <leaf_move_items+0x8c2>
08ba   646d2a:	48 89 df             	mov    %rbx,%rdi
08bd   646d2d:	e8 00 00 00 00       	call   646d32 <leaf_move_items+0x8c2>	646d2e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08c2   646d32:	48 8b 1b             	mov    (%rbx),%rbx
08c5   646d35:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
08ca   646d3a:	48 89 f8             	mov    %rdi,%rax
08cd   646d3d:	48 c1 e8 03          	shr    $0x3,%rax
08d1   646d41:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
08d5   646d45:	74 05                	je     646d4c <leaf_move_items+0x8dc>
08d7   646d47:	e8 00 00 00 00       	call   646d4c <leaf_move_items+0x8dc>	646d48: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
08dc   646d4c:	48 89 5c 24 10       	mov    %rbx,0x10(%rsp)
08e1   646d51:	41 80 7c 2d 00 00    	cmpb   $0x0,0x0(%r13,%rbp,1)
08e7   646d57:	74 08                	je     646d61 <leaf_move_items+0x8f1>
08e9   646d59:	4c 89 e7             	mov    %r12,%rdi
08ec   646d5c:	e8 00 00 00 00       	call   646d61 <leaf_move_items+0x8f1>	646d5d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
08f1   646d61:	49 8b 1c 24          	mov    (%r12),%rbx
08f5   646d65:	48 89 d8             	mov    %rbx,%rax
08f8   646d68:	48 c1 e8 03          	shr    $0x3,%rax
08fc   646d6c:	8a 04 28             	mov    (%rax,%rbp,1),%al
08ff   646d6f:	84 c0                	test   %al,%al
0901   646d71:	44 8b 64 24 44       	mov    0x44(%rsp),%r12d
0906   646d76:	0f 85 40 05 00 00    	jne    6472bc <leaf_move_items+0xe4c>
090c   646d7c:	8b 03                	mov    (%rbx),%eax
090e   646d7e:	48 83 c3 08          	add    $0x8,%rbx
0912   646d82:	ff c8                	dec    %eax
0914   646d84:	48 63 e8             	movslq %eax,%rbp
0917   646d87:	83 fd 08             	cmp    $0x8,%ebp
091a   646d8a:	0f 83 02 07 00 00    	jae    647492 <leaf_move_items+0x1022>
0920   646d90:	48 c1 e5 04          	shl    $0x4,%rbp
0924   646d94:	48 01 eb             	add    %rbp,%rbx
0927   646d97:	48 83 c3 08          	add    $0x8,%rbx
092b   646d9b:	48 89 d8             	mov    %rbx,%rax
092e   646d9e:	48 c1 e8 03          	shr    $0x3,%rax
0932   646da2:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
093c   646dac:	8a 04 28             	mov    (%rax,%rbp,1),%al
093f   646daf:	84 c0                	test   %al,%al
0941   646db1:	0f 85 22 05 00 00    	jne    6472d9 <leaf_move_items+0xe69>
0947   646db7:	8b 1b                	mov    (%rbx),%ebx
0949   646db9:	48 8d 7c 24 18       	lea    0x18(%rsp),%rdi
094e   646dbe:	48 89 f8             	mov    %rdi,%rax
0951   646dc1:	48 c1 e8 03          	shr    $0x3,%rax
0955   646dc5:	8a 04 28             	mov    (%rax,%rbp,1),%al
0958   646dc8:	84 c0                	test   %al,%al
095a   646dca:	0f 85 26 05 00 00    	jne    6472f6 <leaf_move_items+0xe86>
0960   646dd0:	89 5c 24 18          	mov    %ebx,0x18(%rsp)
0964   646dd4:	49 c1 ef 03          	shr    $0x3,%r15
0968   646dd8:	41 80 3c 2f 00       	cmpb   $0x0,(%r15,%rbp,1)
096d   646ddd:	74 0a                	je     646de9 <leaf_move_items+0x979>
096f   646ddf:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0974   646de4:	e8 00 00 00 00       	call   646de9 <leaf_move_items+0x979>	646de5: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
0979   646de9:	4c 89 74 24 20       	mov    %r14,0x20(%rsp)
097e   646dee:	49 8d 5e 20          	lea    0x20(%r14),%rbx
0982   646df2:	48 89 d8             	mov    %rbx,%rax
0985   646df5:	48 c1 e8 03          	shr    $0x3,%rax
0989   646df9:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
098d   646dfd:	74 08                	je     646e07 <leaf_move_items+0x997>
098f   646dff:	48 89 df             	mov    %rbx,%rdi
0992   646e02:	e8 00 00 00 00       	call   646e07 <leaf_move_items+0x997>	646e03: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0997   646e07:	48 8b 1b             	mov    (%rbx),%rbx
099a   646e0a:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
099f   646e0f:	48 89 f8             	mov    %rdi,%rax
09a2   646e12:	48 c1 e8 03          	shr    $0x3,%rax
09a6   646e16:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
09aa   646e1a:	74 05                	je     646e21 <leaf_move_items+0x9b1>
09ac   646e1c:	e8 00 00 00 00       	call   646e21 <leaf_move_items+0x9b1>	646e1d: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
09b1   646e21:	48 89 5c 24 28       	mov    %rbx,0x28(%rsp)
09b6   646e26:	49 8d 5e 70          	lea    0x70(%r14),%rbx
09ba   646e2a:	48 89 d8             	mov    %rbx,%rax
09bd   646e2d:	48 c1 e8 03          	shr    $0x3,%rax
09c1   646e31:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
09c5   646e35:	74 08                	je     646e3f <leaf_move_items+0x9cf>
09c7   646e37:	48 89 df             	mov    %rbx,%rdi
09ca   646e3a:	e8 00 00 00 00       	call   646e3f <leaf_move_items+0x9cf>	646e3b: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09cf   646e3f:	48 8b 1b             	mov    (%rbx),%rbx
09d2   646e42:	48 8d 7c 24 30       	lea    0x30(%rsp),%rdi
09d7   646e47:	48 89 f8             	mov    %rdi,%rax
09da   646e4a:	48 c1 e8 03          	shr    $0x3,%rax
09de   646e4e:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
09e2   646e52:	74 05                	je     646e59 <leaf_move_items+0x9e9>
09e4   646e54:	e8 00 00 00 00       	call   646e59 <leaf_move_items+0x9e9>	646e55: R_X86_64_PLT32	__asan_report_store8_noabort-0x4
09e9   646e59:	48 89 5c 24 30       	mov    %rbx,0x30(%rsp)
09ee   646e5e:	c7 44 24 48 00 00 00 00 	movl   $0x0,0x48(%rsp)
09f6   646e66:	4c 89 f7             	mov    %r14,%rdi
09f9   646e69:	31 f6                	xor    %esi,%esi
09fb   646e6b:	e8 00 00 00 00       	call   646e70 <leaf_move_items+0xa00>	646e6c: R_X86_64_PLT32	get_left_neighbor_position-0x4
0a00   646e70:	89 c3                	mov    %eax,%ebx
0a02   646e72:	41 b5 01             	mov    $0x1,%r13b
0a05   646e75:	48 8d 7c 24 38       	lea    0x38(%rsp),%rdi
0a0a   646e7a:	48 89 f8             	mov    %rdi,%rax
0a0d   646e7d:	48 c1 e8 03          	shr    $0x3,%rax
0a11   646e81:	8a 04 28             	mov    (%rax,%rbp,1),%al
0a14   646e84:	84 c0                	test   %al,%al
0a16   646e86:	0f 85 5b 02 00 00    	jne    6470e7 <leaf_move_items+0xc77>
0a1c   646e8c:	89 5c 24 38          	mov    %ebx,0x38(%rsp)
0a20   646e90:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0a25   646e95:	49 89 fe             	mov    %rdi,%r14
0a28   646e98:	49 c1 ee 03          	shr    $0x3,%r14
0a2c   646e9c:	41 80 3c 2e 00       	cmpb   $0x0,(%r14,%rbp,1)
0a31   646ea1:	74 05                	je     646ea8 <leaf_move_items+0xa38>
0a33   646ea3:	e8 00 00 00 00       	call   646ea8 <leaf_move_items+0xa38>	646ea4: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a38   646ea8:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
0a3d   646ead:	4d 85 ff             	test   %r15,%r15
0a40   646eb0:	0f 84 5a 04 00 00    	je     647310 <leaf_move_items+0xea0>
0a46   646eb6:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0a4b   646ebb:	48 89 f8             	mov    %rdi,%rax
0a4e   646ebe:	48 c1 e8 03          	shr    $0x3,%rax
0a52   646ec2:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0a56   646ec6:	74 05                	je     646ecd <leaf_move_items+0xa5d>
0a58   646ec8:	e8 00 00 00 00       	call   646ecd <leaf_move_items+0xa5d>	646ec9: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a5d   646ecd:	48 83 7c 24 28 00    	cmpq   $0x0,0x28(%rsp)
0a63   646ed3:	0f 84 37 04 00 00    	je     647310 <leaf_move_items+0xea0>
0a69   646ed9:	49 8d 5f 28          	lea    0x28(%r15),%rbx
0a6d   646edd:	48 89 d8             	mov    %rbx,%rax
0a70   646ee0:	48 c1 e8 03          	shr    $0x3,%rax
0a74   646ee4:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0a78   646ee8:	74 08                	je     646ef2 <leaf_move_items+0xa82>
0a7a   646eea:	48 89 df             	mov    %rbx,%rdi
0a7d   646eed:	e8 00 00 00 00       	call   646ef2 <leaf_move_items+0xa82>	646eee: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a82   646ef2:	48 8b 1b             	mov    (%rbx),%rbx
0a85   646ef5:	48 83 c3 02          	add    $0x2,%rbx
0a89   646ef9:	48 89 d8             	mov    %rbx,%rax
0a8c   646efc:	48 c1 e8 03          	shr    $0x3,%rax
0a90   646f00:	8a 04 28             	mov    (%rax,%rbp,1),%al
0a93   646f03:	84 c0                	test   %al,%al
0a95   646f05:	0f 85 f6 01 00 00    	jne    647101 <leaf_move_items+0xc91>
0a9b   646f0b:	0f b7 1b             	movzwl (%rbx),%ebx
0a9e   646f0e:	89 dd                	mov    %ebx,%ebp
0aa0   646f10:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0aa5   646f15:	29 c5                	sub    %eax,%ebp
0aa7   646f17:	0f 8c 44 04 00 00    	jl     647361 <leaf_move_items+0xef1>
0aad   646f1d:	85 c0                	test   %eax,%eax
0aaf   646f1f:	0f 88 6b 04 00 00    	js     647390 <leaf_move_items+0xf20>
0ab5   646f25:	0f 84 8e 00 00 00    	je     646fb9 <leaf_move_items+0xb49>
0abb   646f2b:	83 f8 01             	cmp    $0x1,%eax
0abe   646f2e:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
0ac3   646f33:	44 89 e2             	mov    %r12d,%edx
0ac6   646f36:	41 0f 44 cc          	cmove  %r12d,%ecx
0aca   646f3a:	45 84 ed             	test   %r13b,%r13b
0acd   646f3d:	49 89 c5             	mov    %rax,%r13
0ad0   646f40:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0ad5   646f45:	0f 84 83 00 00 00    	je     646fce <leaf_move_items+0xb5e>
0adb   646f4b:	31 ed                	xor    %ebp,%ebp
0add   646f4d:	4c 89 fe             	mov    %r15,%rsi
0ae0   646f50:	31 d2                	xor    %edx,%edx
0ae2   646f52:	e8 e5 66 00 00       	call   64d63c <leaf_copy_boundary_item>
0ae7   646f57:	41 89 c6             	mov    %eax,%r14d
0aea   646f5a:	45 89 e8             	mov    %r13d,%r8d
0aed   646f5d:	44 89 eb             	mov    %r13d,%ebx
0af0   646f60:	41 29 c0             	sub    %eax,%r8d
0af3   646f63:	4c 89 e8             	mov    %r13,%rax
0af6   646f66:	0f 84 57 01 00 00    	je     6470c3 <leaf_move_items+0xc53>
0afc   646f6c:	41 83 fc ff          	cmp    $0xffffffff,%r12d
0b00   646f70:	0f 84 aa 00 00 00    	je     647020 <leaf_move_items+0xbb0>
0b06   646f76:	41 ff c8             	dec    %r8d
0b09   646f79:	45 89 e5             	mov    %r12d,%r13d
0b0c   646f7c:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
0b11   646f81:	31 ed                	xor    %ebp,%ebp
0b13   646f83:	4c 89 e7             	mov    %r12,%rdi
0b16   646f86:	4c 89 fe             	mov    %r15,%rsi
0b19   646f89:	31 d2                	xor    %edx,%edx
0b1b   646f8b:	44 89 f1             	mov    %r14d,%ecx
0b1e   646f8e:	e8 ab 9e 00 00       	call   650e3e <leaf_copy_items_entirely>
0b23   646f93:	48 8b 5c 24 50       	mov    0x50(%rsp),%rbx
0b28   646f98:	8d 4b ff             	lea    -0x1(%rbx),%ecx
0b2b   646f9b:	4c 89 e7             	mov    %r12,%rdi
0b2e   646f9e:	45 89 ec             	mov    %r13d,%r12d
0b31   646fa1:	4c 89 fe             	mov    %r15,%rsi
0b34   646fa4:	31 d2                	xor    %edx,%edx
0b36   646fa6:	45 89 e8             	mov    %r13d,%r8d
0b39   646fa9:	e8 bc ab 00 00       	call   651b6a <leaf_item_bottle>
0b3e   646fae:	48 89 d8             	mov    %rbx,%rax
0b41   646fb1:	44 89 f3             	mov    %r14d,%ebx
0b44   646fb4:	e9 0a 01 00 00       	jmp    6470c3 <leaf_move_items+0xc53>
0b49   646fb9:	31 db                	xor    %ebx,%ebx
0b4b   646fbb:	bd 00 00 00 00       	mov    $0x0,%ebp
0b50   646fc0:	45 84 ed             	test   %r13b,%r13b
0b53   646fc3:	0f 84 8c 00 00 00    	je     647055 <leaf_move_items+0xbe5>
0b59   646fc9:	e9 f5 00 00 00       	jmp    6470c3 <leaf_move_items+0xc53>
0b5e   646fce:	4c 89 fe             	mov    %r15,%rsi
0b61   646fd1:	ba 01 00 00 00       	mov    $0x1,%edx
0b66   646fd6:	e8 61 66 00 00       	call   64d63c <leaf_copy_boundary_item>
0b6b   646fdb:	45 89 e8             	mov    %r13d,%r8d
0b6e   646fde:	44 89 eb             	mov    %r13d,%ebx
0b71   646fe1:	41 29 c0             	sub    %eax,%r8d
0b74   646fe4:	74 6f                	je     647055 <leaf_move_items+0xbe5>
0b76   646fe6:	89 c3                	mov    %eax,%ebx
0b78   646fe8:	41 83 fc ff          	cmp    $0xffffffff,%r12d
0b7c   646fec:	74 53                	je     647041 <leaf_move_items+0xbd1>
0b7e   646fee:	8d 4d 01             	lea    0x1(%rbp),%ecx
0b81   646ff1:	41 ff c8             	dec    %r8d
0b84   646ff4:	4c 8d 6c 24 20       	lea    0x20(%rsp),%r13
0b89   646ff9:	4c 89 ef             	mov    %r13,%rdi
0b8c   646ffc:	4c 89 fe             	mov    %r15,%rsi
0b8f   646fff:	ba 01 00 00 00       	mov    $0x1,%edx
0b94   647004:	e8 35 9e 00 00       	call   650e3e <leaf_copy_items_entirely>
0b99   647009:	4c 89 ef             	mov    %r13,%rdi
0b9c   64700c:	4c 89 fe             	mov    %r15,%rsi
0b9f   64700f:	ba 01 00 00 00       	mov    $0x1,%edx
0ba4   647014:	89 e9                	mov    %ebp,%ecx
0ba6   647016:	45 89 e0             	mov    %r12d,%r8d
0ba9   647019:	e8 4c ab 00 00       	call   651b6a <leaf_item_bottle>
0bae   64701e:	eb 35                	jmp    647055 <leaf_move_items+0xbe5>
0bb0   647020:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0bb5   647025:	31 ed                	xor    %ebp,%ebp
0bb7   647027:	4c 89 fe             	mov    %r15,%rsi
0bba   64702a:	31 d2                	xor    %edx,%edx
0bbc   64702c:	44 89 f1             	mov    %r14d,%ecx
0bbf   64702f:	e8 0a 9e 00 00       	call   650e3e <leaf_copy_items_entirely>
0bc4   647034:	44 89 f3             	mov    %r14d,%ebx
0bc7   647037:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0bcc   64703c:	e9 82 00 00 00       	jmp    6470c3 <leaf_move_items+0xc53>
0bd1   647041:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
0bd6   647046:	4c 89 fe             	mov    %r15,%rsi
0bd9   647049:	ba 01 00 00 00       	mov    $0x1,%edx
0bde   64704e:	89 e9                	mov    %ebp,%ecx
0be0   647050:	e8 e9 9d 00 00       	call   650e3e <leaf_copy_items_entirely>
0be5   647055:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0bef   64705f:	41 80 3c 06 00       	cmpb   $0x0,(%r14,%rax,1)
0bf4   647064:	74 0a                	je     647070 <leaf_move_items+0xc00>
0bf6   647066:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
0bfb   64706b:	e8 00 00 00 00       	call   647070 <leaf_move_items+0xc00>	64706c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c00   647070:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
0c05   647075:	48 83 c5 28          	add    $0x28,%rbp
0c09   647079:	48 89 e8             	mov    %rbp,%rax
0c0c   64707c:	48 c1 e8 03          	shr    $0x3,%rax
0c10   647080:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0c1a   64708a:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
0c1e   64708e:	74 08                	je     647098 <leaf_move_items+0xc28>
0c20   647090:	48 89 ef             	mov    %rbp,%rdi
0c23   647093:	e8 00 00 00 00       	call   647098 <leaf_move_items+0xc28>	647094: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0c28   647098:	48 8b 6d 00          	mov    0x0(%rbp),%rbp
0c2c   64709c:	48 83 c5 02          	add    $0x2,%rbp
0c30   6470a0:	48 89 e8             	mov    %rbp,%rax
0c33   6470a3:	48 c1 e8 03          	shr    $0x3,%rax
0c37   6470a7:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
0c41   6470b1:	8a 04 08             	mov    (%rax,%rcx,1),%al
0c44   6470b4:	84 c0                	test   %al,%al
0c46   6470b6:	75 65                	jne    64711d <leaf_move_items+0xcad>
0c48   6470b8:	0f b7 6d 00          	movzwl 0x0(%rbp),%ebp
0c4c   6470bc:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
0c51   6470c1:	29 c5                	sub    %eax,%ebp
0c53   6470c3:	48 89 e7             	mov    %rsp,%rdi
0c56   6470c6:	8b 74 24 48          	mov    0x48(%rsp),%esi
0c5a   6470ca:	89 ea                	mov    %ebp,%edx
0c5c   6470cc:	89 c1                	mov    %eax,%ecx
0c5e   6470ce:	45 89 e0             	mov    %r12d,%r8d
0c61   6470d1:	e8 00 00 00 00       	call   6470d6 <leaf_move_items+0xc66>	6470d2: R_X86_64_PLT32	leaf_delete_items-0x4
0c66   6470d6:	89 d8                	mov    %ebx,%eax
0c68   6470d8:	48 83 c4 60          	add    $0x60,%rsp
0c6c   6470dc:	5b                   	pop    %rbx
0c6d   6470dd:	41 5c                	pop    %r12
0c6f   6470df:	41 5d                	pop    %r13
0c71   6470e1:	41 5e                	pop    %r14
0c73   6470e3:	41 5f                	pop    %r15
0c75   6470e5:	5d                   	pop    %rbp
0c76   6470e6:	c3                   	ret    
0c77   6470e7:	89 f9                	mov    %edi,%ecx
0c79   6470e9:	80 e1 07             	and    $0x7,%cl
0c7c   6470ec:	80 c1 03             	add    $0x3,%cl
0c7f   6470ef:	38 c1                	cmp    %al,%cl
0c81   6470f1:	0f 8c 95 fd ff ff    	jl     646e8c <leaf_move_items+0xa1c>
0c87   6470f7:	e8 00 00 00 00       	call   6470fc <leaf_move_items+0xc8c>	6470f8: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0c8c   6470fc:	e9 8b fd ff ff       	jmp    646e8c <leaf_move_items+0xa1c>
0c91   647101:	89 d9                	mov    %ebx,%ecx
0c93   647103:	80 e1 07             	and    $0x7,%cl
0c96   647106:	fe c1                	inc    %cl
0c98   647108:	38 c1                	cmp    %al,%cl
0c9a   64710a:	0f 8c fb fd ff ff    	jl     646f0b <leaf_move_items+0xa9b>
0ca0   647110:	48 89 df             	mov    %rbx,%rdi
0ca3   647113:	e8 00 00 00 00       	call   647118 <leaf_move_items+0xca8>	647114: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0ca8   647118:	e9 ee fd ff ff       	jmp    646f0b <leaf_move_items+0xa9b>
0cad   64711d:	89 e9                	mov    %ebp,%ecx
0caf   64711f:	80 e1 07             	and    $0x7,%cl
0cb2   647122:	fe c1                	inc    %cl
0cb4   647124:	38 c1                	cmp    %al,%cl
0cb6   647126:	7c 90                	jl     6470b8 <leaf_move_items+0xc48>
0cb8   647128:	48 89 ef             	mov    %rbp,%rdi
0cbb   64712b:	e8 00 00 00 00       	call   647130 <leaf_move_items+0xcc0>	64712c: R_X86_64_PLT32	__asan_report_load2_noabort-0x4
0cc0   647130:	eb 86                	jmp    6470b8 <leaf_move_items+0xc48>
0cc2   647132:	89 d9                	mov    %ebx,%ecx
0cc4   647134:	80 e1 07             	and    $0x7,%cl
0cc7   647137:	80 c1 03             	add    $0x3,%cl
0cca   64713a:	38 c1                	cmp    %al,%cl
0ccc   64713c:	0f 8c 1e f4 ff ff    	jl     646560 <leaf_move_items+0xf0>
0cd2   647142:	48 89 df             	mov    %rbx,%rdi
0cd5   647145:	e8 00 00 00 00       	call   64714a <leaf_move_items+0xcda>	647146: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cda   64714a:	e9 11 f4 ff ff       	jmp    646560 <leaf_move_items+0xf0>
0cdf   64714f:	89 d9                	mov    %ebx,%ecx
0ce1   647151:	80 e1 07             	and    $0x7,%cl
0ce4   647154:	80 c1 03             	add    $0x3,%cl
0ce7   647157:	38 c1                	cmp    %al,%cl
0ce9   647159:	0f 8c 7d f4 ff ff    	jl     6465dc <leaf_move_items+0x16c>
0cef   64715f:	48 89 df             	mov    %rbx,%rdi
0cf2   647162:	e8 00 00 00 00       	call   647167 <leaf_move_items+0xcf7>	647163: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0cf7   647167:	e9 70 f4 ff ff       	jmp    6465dc <leaf_move_items+0x16c>
0cfc   64716c:	89 d9                	mov    %ebx,%ecx
0cfe   64716e:	80 e1 07             	and    $0x7,%cl
0d01   647171:	80 c1 03             	add    $0x3,%cl
0d04   647174:	38 c1                	cmp    %al,%cl
0d06   647176:	0f 8c e9 f4 ff ff    	jl     646665 <leaf_move_items+0x1f5>
0d0c   64717c:	48 89 df             	mov    %rbx,%rdi
0d0f   64717f:	e8 00 00 00 00       	call   647184 <leaf_move_items+0xd14>	647180: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d14   647184:	e9 dc f4 ff ff       	jmp    646665 <leaf_move_items+0x1f5>
0d19   647189:	89 d9                	mov    %ebx,%ecx
0d1b   64718b:	80 e1 07             	and    $0x7,%cl
0d1e   64718e:	80 c1 03             	add    $0x3,%cl
0d21   647191:	38 c1                	cmp    %al,%cl
0d23   647193:	0f 8c 07 f5 ff ff    	jl     6466a0 <leaf_move_items+0x230>
0d29   647199:	48 89 df             	mov    %rbx,%rdi
0d2c   64719c:	e8 00 00 00 00       	call   6471a1 <leaf_move_items+0xd31>	64719d: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d31   6471a1:	e9 fa f4 ff ff       	jmp    6466a0 <leaf_move_items+0x230>
0d36   6471a6:	89 f9                	mov    %edi,%ecx
0d38   6471a8:	80 e1 07             	and    $0x7,%cl
0d3b   6471ab:	80 c1 03             	add    $0x3,%cl
0d3e   6471ae:	38 c1                	cmp    %al,%cl
0d40   6471b0:	0f 8c 03 f5 ff ff    	jl     6466b9 <leaf_move_items+0x249>
0d46   6471b6:	e8 00 00 00 00       	call   6471bb <leaf_move_items+0xd4b>	6471b7: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0d4b   6471bb:	e9 f9 f4 ff ff       	jmp    6466b9 <leaf_move_items+0x249>
0d50   6471c0:	89 d9                	mov    %ebx,%ecx
0d52   6471c2:	80 e1 07             	and    $0x7,%cl
0d55   6471c5:	80 c1 03             	add    $0x3,%cl
0d58   6471c8:	38 c1                	cmp    %al,%cl
0d5a   6471ca:	0f 8c be f5 ff ff    	jl     64678e <leaf_move_items+0x31e>
0d60   6471d0:	48 89 df             	mov    %rbx,%rdi
0d63   6471d3:	e8 00 00 00 00       	call   6471d8 <leaf_move_items+0xd68>	6471d4: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d68   6471d8:	e9 b1 f5 ff ff       	jmp    64678e <leaf_move_items+0x31e>
0d6d   6471dd:	89 d9                	mov    %ebx,%ecx
0d6f   6471df:	80 e1 07             	and    $0x7,%cl
0d72   6471e2:	80 c1 03             	add    $0x3,%cl
0d75   6471e5:	38 c1                	cmp    %al,%cl
0d77   6471e7:	0f 8c 1d f6 ff ff    	jl     64680a <leaf_move_items+0x39a>
0d7d   6471ed:	48 89 df             	mov    %rbx,%rdi
0d80   6471f0:	e8 00 00 00 00       	call   6471f5 <leaf_move_items+0xd85>	6471f1: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0d85   6471f5:	e9 10 f6 ff ff       	jmp    64680a <leaf_move_items+0x39a>
0d8a   6471fa:	89 d9                	mov    %ebx,%ecx
0d8c   6471fc:	80 e1 07             	and    $0x7,%cl
0d8f   6471ff:	80 c1 03             	add    $0x3,%cl
0d92   647202:	38 c1                	cmp    %al,%cl
0d94   647204:	0f 8c 84 f6 ff ff    	jl     64688e <leaf_move_items+0x41e>
0d9a   64720a:	48 89 df             	mov    %rbx,%rdi
0d9d   64720d:	e8 00 00 00 00       	call   647212 <leaf_move_items+0xda2>	64720e: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0da2   647212:	e9 77 f6 ff ff       	jmp    64688e <leaf_move_items+0x41e>
0da7   647217:	89 d9                	mov    %ebx,%ecx
0da9   647219:	80 e1 07             	and    $0x7,%cl
0dac   64721c:	80 c1 03             	add    $0x3,%cl
0daf   64721f:	38 c1                	cmp    %al,%cl
0db1   647221:	0f 8c a2 f6 ff ff    	jl     6468c9 <leaf_move_items+0x459>
0db7   647227:	48 89 df             	mov    %rbx,%rdi
0dba   64722a:	e8 00 00 00 00       	call   64722f <leaf_move_items+0xdbf>	64722b: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0dbf   64722f:	e9 95 f6 ff ff       	jmp    6468c9 <leaf_move_items+0x459>
0dc4   647234:	89 f9                	mov    %edi,%ecx
0dc6   647236:	80 e1 07             	and    $0x7,%cl
0dc9   647239:	80 c1 03             	add    $0x3,%cl
0dcc   64723c:	38 c1                	cmp    %al,%cl
0dce   64723e:	0f 8c 9e f6 ff ff    	jl     6468e2 <leaf_move_items+0x472>
0dd4   647244:	e8 00 00 00 00       	call   647249 <leaf_move_items+0xdd9>	647245: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0dd9   647249:	e9 94 f6 ff ff       	jmp    6468e2 <leaf_move_items+0x472>
0dde   64724e:	89 f9                	mov    %edi,%ecx
0de0   647250:	80 e1 07             	and    $0x7,%cl
0de3   647253:	80 c1 03             	add    $0x3,%cl
0de6   647256:	38 c1                	cmp    %al,%cl
0de8   647258:	0f 8c d3 f7 ff ff    	jl     646a31 <leaf_move_items+0x5c1>
0dee   64725e:	e8 00 00 00 00       	call   647263 <leaf_move_items+0xdf3>	64725f: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0df3   647263:	e9 c9 f7 ff ff       	jmp    646a31 <leaf_move_items+0x5c1>
0df8   647268:	89 f9                	mov    %edi,%ecx
0dfa   64726a:	80 e1 07             	and    $0x7,%cl
0dfd   64726d:	80 c1 03             	add    $0x3,%cl
0e00   647270:	38 c1                	cmp    %al,%cl
0e02   647272:	0f 8c 02 f9 ff ff    	jl     646b7a <leaf_move_items+0x70a>
0e08   647278:	e8 00 00 00 00       	call   64727d <leaf_move_items+0xe0d>	647279: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e0d   64727d:	e9 f8 f8 ff ff       	jmp    646b7a <leaf_move_items+0x70a>
0e12   647282:	89 d9                	mov    %ebx,%ecx
0e14   647284:	80 e1 07             	and    $0x7,%cl
0e17   647287:	80 c1 03             	add    $0x3,%cl
0e1a   64728a:	38 c1                	cmp    %al,%cl
0e1c   64728c:	0f 8c ea f9 ff ff    	jl     646c7c <leaf_move_items+0x80c>
0e22   647292:	48 89 df             	mov    %rbx,%rdi
0e25   647295:	e8 00 00 00 00       	call   64729a <leaf_move_items+0xe2a>	647296: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e2a   64729a:	e9 dd f9 ff ff       	jmp    646c7c <leaf_move_items+0x80c>
0e2f   64729f:	89 d9                	mov    %ebx,%ecx
0e31   6472a1:	80 e1 07             	and    $0x7,%cl
0e34   6472a4:	80 c1 03             	add    $0x3,%cl
0e37   6472a7:	38 c1                	cmp    %al,%cl
0e39   6472a9:	0f 8c 49 fa ff ff    	jl     646cf8 <leaf_move_items+0x888>
0e3f   6472af:	48 89 df             	mov    %rbx,%rdi
0e42   6472b2:	e8 00 00 00 00       	call   6472b7 <leaf_move_items+0xe47>	6472b3: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e47   6472b7:	e9 3c fa ff ff       	jmp    646cf8 <leaf_move_items+0x888>
0e4c   6472bc:	89 d9                	mov    %ebx,%ecx
0e4e   6472be:	80 e1 07             	and    $0x7,%cl
0e51   6472c1:	80 c1 03             	add    $0x3,%cl
0e54   6472c4:	38 c1                	cmp    %al,%cl
0e56   6472c6:	0f 8c b0 fa ff ff    	jl     646d7c <leaf_move_items+0x90c>
0e5c   6472cc:	48 89 df             	mov    %rbx,%rdi
0e5f   6472cf:	e8 00 00 00 00       	call   6472d4 <leaf_move_items+0xe64>	6472d0: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e64   6472d4:	e9 a3 fa ff ff       	jmp    646d7c <leaf_move_items+0x90c>
0e69   6472d9:	89 d9                	mov    %ebx,%ecx
0e6b   6472db:	80 e1 07             	and    $0x7,%cl
0e6e   6472de:	80 c1 03             	add    $0x3,%cl
0e71   6472e1:	38 c1                	cmp    %al,%cl
0e73   6472e3:	0f 8c ce fa ff ff    	jl     646db7 <leaf_move_items+0x947>
0e79   6472e9:	48 89 df             	mov    %rbx,%rdi
0e7c   6472ec:	e8 00 00 00 00       	call   6472f1 <leaf_move_items+0xe81>	6472ed: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0e81   6472f1:	e9 c1 fa ff ff       	jmp    646db7 <leaf_move_items+0x947>
0e86   6472f6:	89 f9                	mov    %edi,%ecx
0e88   6472f8:	80 e1 07             	and    $0x7,%cl
0e8b   6472fb:	80 c1 03             	add    $0x3,%cl
0e8e   6472fe:	38 c1                	cmp    %al,%cl
0e90   647300:	0f 8c ca fa ff ff    	jl     646dd0 <leaf_move_items+0x960>
0e96   647306:	e8 00 00 00 00       	call   64730b <leaf_move_items+0xe9b>	647307: R_X86_64_PLT32	__asan_report_store4_noabort-0x4
0e9b   64730b:	e9 c0 fa ff ff       	jmp    646dd0 <leaf_move_items+0x960>
0ea0   647310:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
0ea5   647315:	48 89 f8             	mov    %rdi,%rax
0ea8   647318:	48 c1 e8 03          	shr    $0x3,%rax
0eac   64731c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0eb0   647320:	74 05                	je     647327 <leaf_move_items+0xeb7>
0eb2   647322:	e8 00 00 00 00       	call   647327 <leaf_move_items+0xeb7>	647323: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0eb7   647327:	48 8b 5c 24 28       	mov    0x28(%rsp),%rbx
0ebc   64732c:	e8 00 00 00 00       	call   647331 <leaf_move_items+0xec1>	64732d: R_X86_64_PLT32	__asan_handle_no_return-0x4
0ec1   647331:	31 ff                	xor    %edi,%edi
0ec3   647333:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	647336: R_X86_64_32S	.rodata+0xedee0
0eca   64733a:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	64733d: R_X86_64_32S	.rodata.str1.1+0x52979
0ed1   647341:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	647344: R_X86_64_32S	.rodata+0xeec80
0ed8   647348:	41 b8 c4 02 00 00    	mov    $0x2c4,%r8d
0ede   64734e:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	647351: R_X86_64_32S	.rodata.str1.1+0x52979
0ee5   647355:	53                   	push   %rbx
0ee6   647356:	41 57                	push   %r15
0ee8   647358:	ff 74 24 68          	push   0x68(%rsp)
0eec   64735c:	e8 00 00 00 00       	call   647361 <leaf_move_items+0xef1>	64735d: R_X86_64_PLT32	__reiserfs_panic-0x4
0ef1   647361:	48 89 c5             	mov    %rax,%rbp
0ef4   647364:	e8 00 00 00 00       	call   647369 <leaf_move_items+0xef9>	647365: R_X86_64_PLT32	__asan_handle_no_return-0x4
0ef9   647369:	31 ff                	xor    %edi,%edi
0efb   64736b:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	64736e: R_X86_64_32S	.rodata+0xedee0
0f02   647372:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	647375: R_X86_64_32S	.rodata.str1.1+0x58d19
0f09   647379:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	64737c: R_X86_64_32S	.rodata+0xeed40
0f10   647380:	41 b8 15 02 00 00    	mov    $0x215,%r8d
0f16   647386:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	647389: R_X86_64_32S	.rodata.str1.1+0x58d19
0f1d   64738d:	55                   	push   %rbp
0f1e   64738e:	eb 2c                	jmp    6473bc <leaf_move_items+0xf4c>
0f20   647390:	48 89 c3             	mov    %rax,%rbx
0f23   647393:	e8 00 00 00 00       	call   647398 <leaf_move_items+0xf28>	647394: R_X86_64_PLT32	__asan_handle_no_return-0x4
0f28   647398:	31 ff                	xor    %edi,%edi
0f2a   64739a:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	64739d: R_X86_64_32S	.rodata+0xedee0
0f31   6473a1:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	6473a4: R_X86_64_32S	.rodata.str1.1+0x58d19
0f38   6473a8:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6473ab: R_X86_64_32S	.rodata+0xeee20
0f3f   6473af:	41 b8 16 02 00 00    	mov    $0x216,%r8d
0f45   6473b5:	49 c7 c1 00 00 00 00 	mov    $0x0,%r9	6473b8: R_X86_64_32S	.rodata.str1.1+0x58d19
0f4c   6473bc:	53                   	push   %rbx
0f4d   6473bd:	e8 00 00 00 00       	call   6473c2 <leaf_move_items+0xf52>	6473be: R_X86_64_PLT32	__reiserfs_panic-0x4
0f52   6473c2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6473c5: R_X86_64_32S	.data+0x767500
0f59   6473c9:	48 89 ee             	mov    %rbp,%rsi
0f5c   6473cc:	e8 00 00 00 00       	call   6473d1 <leaf_move_items+0xf61>	6473cd: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0f61   6473d1:	e9 9b f1 ff ff       	jmp    646571 <leaf_move_items+0x101>
0f66   6473d6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6473d9: R_X86_64_32S	.data+0x767520
0f6d   6473dd:	48 89 ee             	mov    %rbp,%rsi
0f70   6473e0:	e8 00 00 00 00       	call   6473e5 <leaf_move_items+0xf75>	6473e1: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0f75   6473e5:	e9 06 f2 ff ff       	jmp    6465f0 <leaf_move_items+0x180>
0f7a   6473ea:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	6473ed: R_X86_64_32S	.data+0x767540
0f81   6473f1:	48 89 ee             	mov    %rbp,%rsi
0f84   6473f4:	e8 00 00 00 00       	call   6473f9 <leaf_move_items+0xf89>	6473f5: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0f89   6473f9:	e9 7b f2 ff ff       	jmp    646679 <leaf_move_items+0x209>
0f8e   6473fe:	49 89 de             	mov    %rbx,%r14
0f91   647401:	48 c1 ed 03          	shr    $0x3,%rbp
0f95   647405:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0f9f   64740f:	80 7c 05 00 00       	cmpb   $0x0,0x0(%rbp,%rax,1)
0fa4   647414:	74 08                	je     64741e <leaf_move_items+0xfae>
0fa6   647416:	48 89 e7             	mov    %rsp,%rdi
0fa9   647419:	e8 00 00 00 00       	call   64741e <leaf_move_items+0xfae>	64741a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0fae   64741e:	48 8b 1c 24          	mov    (%rsp),%rbx
0fb2   647422:	48 85 db             	test   %rbx,%rbx
0fb5   647425:	75 7f                	jne    6474a6 <leaf_move_items+0x1036>
0fb7   647427:	31 db                	xor    %ebx,%ebx
0fb9   647429:	e9 9e 00 00 00       	jmp    6474cc <leaf_move_items+0x105c>
0fbe   64742e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	647431: R_X86_64_32S	.data+0x7674a0
0fc5   647435:	48 89 ee             	mov    %rbp,%rsi
0fc8   647438:	e8 00 00 00 00       	call   64743d <leaf_move_items+0xfcd>	647439: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0fcd   64743d:	e9 5d f3 ff ff       	jmp    64679f <leaf_move_items+0x32f>
0fd2   647442:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	647445: R_X86_64_32S	.data+0x7674c0
0fd9   647449:	48 89 ee             	mov    %rbp,%rsi
0fdc   64744c:	e8 00 00 00 00       	call   647451 <leaf_move_items+0xfe1>	64744d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0fe1   647451:	e9 c8 f3 ff ff       	jmp    64681e <leaf_move_items+0x3ae>
0fe6   647456:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	647459: R_X86_64_32S	.data+0x7674e0
0fed   64745d:	48 89 ee             	mov    %rbp,%rsi
0ff0   647460:	e8 00 00 00 00       	call   647465 <leaf_move_items+0xff5>	647461: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0ff5   647465:	e9 38 f4 ff ff       	jmp    6468a2 <leaf_move_items+0x432>
0ffa   64746a:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	64746d: R_X86_64_32S	.data+0x767440
1001   647471:	48 89 ee             	mov    %rbp,%rsi
1004   647474:	e8 00 00 00 00       	call   647479 <leaf_move_items+0x1009>	647475: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1009   647479:	e9 0f f8 ff ff       	jmp    646c8d <leaf_move_items+0x81d>
100e   64747e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	647481: R_X86_64_32S	.data+0x767460
1015   647485:	48 89 ee             	mov    %rbp,%rsi
1018   647488:	e8 00 00 00 00       	call   64748d <leaf_move_items+0x101d>	647489: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
101d   64748d:	e9 7a f8 ff ff       	jmp    646d0c <leaf_move_items+0x89c>
1022   647492:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	647495: R_X86_64_32S	.data+0x767480
1029   647499:	48 89 ee             	mov    %rbp,%rsi
102c   64749c:	e8 00 00 00 00       	call   6474a1 <leaf_move_items+0x1031>	64749d: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
1031   6474a1:	e9 ea f8 ff ff       	jmp    646d90 <leaf_move_items+0x920>
1036   6474a6:	48 83 c3 08          	add    $0x8,%rbx
103a   6474aa:	48 89 d8             	mov    %rbx,%rax
103d   6474ad:	48 c1 e8 03          	shr    $0x3,%rax
1041   6474b1:	48 b9 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rcx
104b   6474bb:	80 3c 08 00          	cmpb   $0x0,(%rax,%rcx,1)
104f   6474bf:	74 08                	je     6474c9 <leaf_move_items+0x1059>
1051   6474c1:	48 89 df             	mov    %rbx,%rdi
1054   6474c4:	e8 00 00 00 00       	call   6474c9 <leaf_move_items+0x1059>	6474c5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
1059   6474c9:	48 8b 1b             	mov    (%rbx),%rbx
105c   6474cc:	e8 00 00 00 00       	call   6474d1 <leaf_move_items+0x1061>	6474cd: R_X86_64_PLT32	__asan_handle_no_return-0x4
1061   6474d1:	48 89 df             	mov    %rbx,%rdi
1064   6474d4:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi	6474d7: R_X86_64_32S	.rodata+0xeebc0
106b   6474db:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx	6474de: R_X86_64_32S	.rodata.str1.1+0x52979
1072   6474e2:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx	6474e5: R_X86_64_32S	.rodata+0xeec40
1079   6474e9:	45 89 f0             	mov    %r14d,%r8d
107c   6474ec:	e8 00 00 00 00       	call   6474f1 <leaf_delete_items>	6474ed: R_X86_64_PLT32	__reiserfs_panic-0x4

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
