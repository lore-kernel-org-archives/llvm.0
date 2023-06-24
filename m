Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668F53B4;
	Sat, 24 Jun 2023 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687616050; x=1719152050;
  h=date:from:cc:subject:message-id:mime-version;
  bh=8UOHq4X79R5oO8vUns+alTL8Q/QVxjgsAEdRYqbN8hA=;
  b=ARS6cDuGt0xzP3R/NI2BTQF6z9fOxCMb6CiDE1OgOlwedQ7MGuRAoPZi
   czrFY0H3MzDMKDzU1p7iKJ19BVG0UDwcVvjZcItuedUj+tLN5vW3+pYIJ
   qX/ts/HbQT2hKWDU5HAAQJprLT95+IU6oxRIWUFDRq9Xl+OSpawhorlmd
   gx+7i+RisJq4Y3K7cGBpjdTIwgE8oWrrE7ZI8lhtGrdNs0mmMdAqhIxU+
   eyoZ2rJD52ExBGlJ5UND1pBx0xSxRuSHAb2JoSaOqYBBs7S5QM1oXdhQs
   GATn0HI6zfyoXtywj1iGXQLTMHVC1ppW3z9NKJeRyg7PsW2LCmswDZ9aw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="364392326"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="364392326"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 07:14:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1045951917"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="1045951917"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jun 2023 07:14:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qD41c-000971-17;
	Sat, 24 Jun 2023 14:14:04 +0000
Date: Sat, 24 Jun 2023 22:13:23 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: do_user_addr_fault+0x538: unreachable
 instruction
Message-ID: <202306242247.b2ttubSG-lkp@intel.com>
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

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a92b7d26c743b9dc06d520f863d624e94978a1d9
commit: 443ed4c302fff6a26af980300463343a7adc9ee8 objtool: mem*() are not uaccess safe
date:   4 months ago
config: x86_64-randconfig-r032-20230624 (https://download.01.org/0day-ci/archive/20230624/202306242247.b2ttubSG-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306242247.b2ttubSG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306242247.b2ttubSG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_user_addr_fault+0x538: unreachable instruction


objdump-func vmlinux.o do_user_addr_fault:
0000 00000000000f81c0 <do_user_addr_fault>:
0000    f81c0:	f3 0f 1e fa          	endbr64
0004    f81c4:	55                   	push   %rbp
0005    f81c5:	41 57                	push   %r15
0007    f81c7:	41 56                	push   %r14
0009    f81c9:	41 55                	push   %r13
000b    f81cb:	41 54                	push   %r12
000d    f81cd:	53                   	push   %rbx
000e    f81ce:	48 83 ec 68          	sub    $0x68,%rsp
0012    f81d2:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
0017    f81d7:	49 89 f6             	mov    %rsi,%r14
001a    f81da:	49 89 fc             	mov    %rdi,%r12
001d    f81dd:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
0026    f81e6:	48 89 44 24 60       	mov    %rax,0x60(%rsp)
002b    f81eb:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0035    f81f5:	e8 00 00 00 00       	call   f81fa <do_user_addr_fault+0x3a>	f81f6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
003a    f81fa:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # f8202 <do_user_addr_fault+0x42>	f81fe: R_X86_64_PC32	pcpu_hot-0x4
0042    f8202:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
0047    f8207:	48 8d 98 b8 04 00 00 	lea    0x4b8(%rax),%rbx
004e    f820e:	48 89 d8             	mov    %rbx,%rax
0051    f8211:	48 c1 e8 03          	shr    $0x3,%rax
0055    f8215:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0059    f8219:	74 08                	je     f8223 <do_user_addr_fault+0x63>
005b    f821b:	48 89 df             	mov    %rbx,%rdi
005e    f821e:	e8 00 00 00 00       	call   f8223 <do_user_addr_fault+0x63>	f821f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0063    f8223:	48 8b 03             	mov    (%rbx),%rax
0066    f8226:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
006b    f822b:	44 89 f3             	mov    %r14d,%ebx
006e    f822e:	83 e3 14             	and    $0x14,%ebx
0071    f8231:	bf 10 00 00 00       	mov    $0x10,%edi
0076    f8236:	48 89 de             	mov    %rbx,%rsi
0079    f8239:	e8 00 00 00 00       	call   f823e <do_user_addr_fault+0x7e>	f823a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
007e    f823e:	48 83 fb 10          	cmp    $0x10,%rbx
0082    f8242:	0f 84 8f 03 00 00    	je     f85d7 <do_user_addr_fault+0x417>
0088    f8248:	4d 8d ac 24 88 00 00 00 	lea    0x88(%r12),%r13
0090    f8250:	4c 89 e8             	mov    %r13,%rax
0093    f8253:	48 c1 e8 03          	shr    $0x3,%rax
0097    f8257:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
009c    f825c:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
00a0    f8260:	74 08                	je     f826a <do_user_addr_fault+0xaa>
00a2    f8262:	4c 89 ef             	mov    %r13,%rdi
00a5    f8265:	e8 00 00 00 00       	call   f826a <do_user_addr_fault+0xaa>	f8266: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
00aa    f826a:	49 8b 5d 00          	mov    0x0(%r13),%rbx
00ae    f826e:	48 89 de             	mov    %rbx,%rsi
00b1    f8271:	48 83 e6 03          	and    $0x3,%rsi
00b5    f8275:	31 ff                	xor    %edi,%edi
00b7    f8277:	e8 00 00 00 00       	call   f827c <do_user_addr_fault+0xbc>	f8278: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
00bc    f827c:	48 83 e3 03          	and    $0x3,%rbx
00c0    f8280:	74 0a                	je     f828c <do_user_addr_fault+0xcc>
00c2    f8282:	e8 00 00 00 00       	call   f8287 <do_user_addr_fault+0xc7>	f8283: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00c7    f8287:	e9 c4 00 00 00       	jmp    f8350 <do_user_addr_fault+0x190>
00cc    f828c:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # f8293 <do_user_addr_fault+0xd3>	f828f: R_X86_64_PC32	pcpu_hot+0x4
00d3    f8293:	89 de                	mov    %ebx,%esi
00d5    f8295:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
00db    f829b:	31 ff                	xor    %edi,%edi
00dd    f829d:	e8 00 00 00 00       	call   f82a2 <do_user_addr_fault+0xe2>	f829e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
00e2    f82a2:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
00e8    f82a8:	74 07                	je     f82b1 <do_user_addr_fault+0xf1>
00ea    f82aa:	e8 00 00 00 00       	call   f82af <do_user_addr_fault+0xef>	f82ab: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
00ef    f82af:	eb 4b                	jmp    f82fc <do_user_addr_fault+0x13c>
00f1    f82b1:	9c                   	pushf
00f2    f82b2:	8f 44 24 58          	pop    0x58(%rsp)
00f6    f82b6:	48 8d 44 24 58       	lea    0x58(%rsp),%rax
00fb    f82bb:	48 c1 e8 03          	shr    $0x3,%rax
00ff    f82bf:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0103    f82c3:	74 0a                	je     f82cf <do_user_addr_fault+0x10f>
0105    f82c5:	48 8d 7c 24 58       	lea    0x58(%rsp),%rdi
010a    f82ca:	e8 00 00 00 00       	call   f82cf <do_user_addr_fault+0x10f>	f82cb: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
010f    f82cf:	48 8b 5c 24 58       	mov    0x58(%rsp),%rbx
0114    f82d4:	bd 00 02 00 00       	mov    $0x200,%ebp
0119    f82d9:	be 00 02 00 00       	mov    $0x200,%esi
011e    f82de:	48 21 de             	and    %rbx,%rsi
0121    f82e1:	31 ff                	xor    %edi,%edi
0123    f82e3:	e8 00 00 00 00       	call   f82e8 <do_user_addr_fault+0x128>	f82e4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0128    f82e8:	48 21 dd             	and    %rbx,%rbp
012b    f82eb:	75 54                	jne    f8341 <do_user_addr_fault+0x181>
012d    f82ed:	e8 00 00 00 00       	call   f82f2 <do_user_addr_fault+0x132>	f82ee: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0132    f82f2:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
013c    f82fc:	65 48 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%rbx        # f8304 <do_user_addr_fault+0x144>	f8300: R_X86_64_PC32	current_kprobe-0x4
0144    f8304:	31 ff                	xor    %edi,%edi
0146    f8306:	48 89 de             	mov    %rbx,%rsi
0149    f8309:	e8 00 00 00 00       	call   f830e <do_user_addr_fault+0x14e>	f830a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
014e    f830e:	48 85 db             	test   %rbx,%rbx
0151    f8311:	74 27                	je     f833a <do_user_addr_fault+0x17a>
0153    f8313:	4c 89 e7             	mov    %r12,%rdi
0156    f8316:	be 0e 00 00 00       	mov    $0xe,%esi
015b    f831b:	e8 00 00 00 00       	call   f8320 <do_user_addr_fault+0x160>	f831c: R_X86_64_PLT32	kprobe_fault_handler-0x4
0160    f8320:	89 c3                	mov    %eax,%ebx
0162    f8322:	31 ff                	xor    %edi,%edi
0164    f8324:	89 c6                	mov    %eax,%esi
0166    f8326:	e8 00 00 00 00       	call   f832b <do_user_addr_fault+0x16b>	f8327: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
016b    f832b:	85 db                	test   %ebx,%ebx
016d    f832d:	0f 85 86 03 00 00    	jne    f86b9 <do_user_addr_fault+0x4f9>
0173    f8333:	e8 00 00 00 00       	call   f8338 <do_user_addr_fault+0x178>	f8334: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0178    f8338:	eb 16                	jmp    f8350 <do_user_addr_fault+0x190>
017a    f833a:	e8 00 00 00 00       	call   f833f <do_user_addr_fault+0x17f>	f833b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
017f    f833f:	eb 0f                	jmp    f8350 <do_user_addr_fault+0x190>
0181    f8341:	e8 00 00 00 00       	call   f8346 <do_user_addr_fault+0x186>	f8342: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0186    f8346:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0190    f8350:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0195    f8355:	4c 89 f6             	mov    %r14,%rsi
0198    f8358:	48 83 e6 08          	and    $0x8,%rsi
019c    f835c:	31 ff                	xor    %edi,%edi
019e    f835e:	e8 00 00 00 00       	call   f8363 <do_user_addr_fault+0x1a3>	f835f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01a3    f8363:	4c 89 f0             	mov    %r14,%rax
01a6    f8366:	48 83 e0 08          	and    $0x8,%rax
01aa    f836a:	0f 85 71 02 00 00    	jne    f85e1 <do_user_addr_fault+0x421>
01b0    f8370:	e8 00 00 00 00       	call   f8375 <do_user_addr_fault+0x1b5>	f8371: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01b5    f8375:	e9 00 00 00 00       	jmp    f837a <do_user_addr_fault+0x1ba>	f8376: R_X86_64_PLT32	.altinstr_aux+0xb4e
01ba    f837a:	e8 00 00 00 00       	call   f837f <do_user_addr_fault+0x1bf>	f837b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
01bf    f837f:	4c 89 f6             	mov    %r14,%rsi
01c2    f8382:	48 83 e6 04          	and    $0x4,%rsi
01c6    f8386:	31 ff                	xor    %edi,%edi
01c8    f8388:	e8 00 00 00 00       	call   f838d <do_user_addr_fault+0x1cd>	f8389: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
01cd    f838d:	4c 89 f0             	mov    %r14,%rax
01d0    f8390:	48 83 e0 04          	and    $0x4,%rax
01d4    f8394:	75 53                	jne    f83e9 <do_user_addr_fault+0x229>
01d6    f8396:	49 8d 9c 24 90 00 00 00 	lea    0x90(%r12),%rbx
01de    f839e:	48 89 d8             	mov    %rbx,%rax
01e1    f83a1:	48 c1 e8 03          	shr    $0x3,%rax
01e5    f83a5:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
01e9    f83a9:	74 08                	je     f83b3 <do_user_addr_fault+0x1f3>
01eb    f83ab:	48 89 df             	mov    %rbx,%rdi
01ee    f83ae:	e8 00 00 00 00       	call   f83b3 <do_user_addr_fault+0x1f3>	f83af: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
01f3    f83b3:	48 8b 1b             	mov    (%rbx),%rbx
01f6    f83b6:	bd 00 00 04 00       	mov    $0x40000,%ebp
01fb    f83bb:	be 00 00 04 00       	mov    $0x40000,%esi
0200    f83c0:	48 21 de             	and    %rbx,%rsi
0203    f83c3:	31 ff                	xor    %edi,%edi
0205    f83c5:	e8 00 00 00 00       	call   f83ca <do_user_addr_fault+0x20a>	f83c6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
020a    f83ca:	48 21 dd             	and    %rbx,%rbp
020d    f83cd:	0f 84 94 02 00 00    	je     f8667 <do_user_addr_fault+0x4a7>
0213    f83d3:	e8 00 00 00 00       	call   f83d8 <do_user_addr_fault+0x218>	f83d4: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0218    f83d8:	48 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rbp
0222    f83e2:	48 8b 5c 24 18       	mov    0x18(%rsp),%rbx
0227    f83e7:	eb 05                	jmp    f83ee <do_user_addr_fault+0x22e>
0229    f83e9:	e8 00 00 00 00       	call   f83ee <do_user_addr_fault+0x22e>	f83ea: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
022e    f83ee:	48 81 c3 48 24 00 00 	add    $0x2448,%rbx
0235    f83f5:	48 89 d8             	mov    %rbx,%rax
0238    f83f8:	48 c1 e8 03          	shr    $0x3,%rax
023c    f83fc:	8a 04 28             	mov    (%rax,%rbp,1),%al
023f    f83ff:	84 c0                	test   %al,%al
0241    f8401:	0f 85 d4 02 00 00    	jne    f86db <do_user_addr_fault+0x51b>
0247    f8407:	8b 1b                	mov    (%rbx),%ebx
0249    f8409:	31 ff                	xor    %edi,%edi
024b    f840b:	89 de                	mov    %ebx,%esi
024d    f840d:	e8 00 00 00 00       	call   f8412 <do_user_addr_fault+0x252>	f840e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0252    f8412:	85 db                	test   %ebx,%ebx
0254    f8414:	0f 85 e1 01 00 00    	jne    f85fb <do_user_addr_fault+0x43b>
025a    f841a:	65 8b 1d 00 00 00 00 	mov    %gs:0x0(%rip),%ebx        # f8421 <do_user_addr_fault+0x261>	f841d: R_X86_64_PC32	pcpu_hot+0x4
0261    f8421:	89 de                	mov    %ebx,%esi
0263    f8423:	81 e6 ff ff ff 7f    	and    $0x7fffffff,%esi
0269    f8429:	31 ff                	xor    %edi,%edi
026b    f842b:	e8 00 00 00 00       	call   f8430 <do_user_addr_fault+0x270>	f842c: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0270    f8430:	81 e3 ff ff ff 7f    	and    $0x7fffffff,%ebx
0276    f8436:	0f 85 c6 01 00 00    	jne    f8602 <do_user_addr_fault+0x442>
027c    f843c:	48 83 7c 24 38 00    	cmpq   $0x0,0x38(%rsp)
0282    f8442:	0f 84 ba 01 00 00    	je     f8602 <do_user_addr_fault+0x442>
0288    f8448:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
028d    f844d:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
0291    f8451:	74 08                	je     f845b <do_user_addr_fault+0x29b>
0293    f8453:	4c 89 ef             	mov    %r13,%rdi
0296    f8456:	e8 00 00 00 00       	call   f845b <do_user_addr_fault+0x29b>	f8457: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
029b    f845b:	49 8b 5d 00          	mov    0x0(%r13),%rbx
029f    f845f:	48 89 de             	mov    %rbx,%rsi
02a2    f8462:	48 83 e6 03          	and    $0x3,%rsi
02a6    f8466:	31 ff                	xor    %edi,%edi
02a8    f8468:	e8 00 00 00 00       	call   f846d <do_user_addr_fault+0x2ad>	f8469: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
02ad    f846d:	48 83 e3 03          	and    $0x3,%rbx
02b1    f8471:	74 13                	je     f8486 <do_user_addr_fault+0x2c6>
02b3    f8473:	e8 00 00 00 00       	call   f8478 <do_user_addr_fault+0x2b8>	f8474: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
02b8    f8478:	e8 00 00 00 00       	call   f847d <do_user_addr_fault+0x2bd>	f8479: R_X86_64_PLT32	trace_hardirqs_on-0x4
02bd    f847d:	fb                   	sti
02be    f847e:	41 bf 54 02 00 00    	mov    $0x254,%r15d
02c4    f8484:	eb 51                	jmp    f84d7 <do_user_addr_fault+0x317>
02c6    f8486:	49 8d 9c 24 90 00 00 00 	lea    0x90(%r12),%rbx
02ce    f848e:	48 89 d8             	mov    %rbx,%rax
02d1    f8491:	48 c1 e8 03          	shr    $0x3,%rax
02d5    f8495:	80 3c 28 00          	cmpb   $0x0,(%rax,%rbp,1)
02d9    f8499:	74 08                	je     f84a3 <do_user_addr_fault+0x2e3>
02db    f849b:	48 89 df             	mov    %rbx,%rdi
02de    f849e:	e8 00 00 00 00       	call   f84a3 <do_user_addr_fault+0x2e3>	f849f: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
02e3    f84a3:	48 8b 1b             	mov    (%rbx),%rbx
02e6    f84a6:	bd 00 02 00 00       	mov    $0x200,%ebp
02eb    f84ab:	be 00 02 00 00       	mov    $0x200,%esi
02f0    f84b0:	48 21 de             	and    %rbx,%rsi
02f3    f84b3:	31 ff                	xor    %edi,%edi
02f5    f84b5:	e8 00 00 00 00       	call   f84ba <do_user_addr_fault+0x2fa>	f84b6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
02fa    f84ba:	48 21 dd             	and    %rbx,%rbp
02fd    f84bd:	75 07                	jne    f84c6 <do_user_addr_fault+0x306>
02ff    f84bf:	e8 00 00 00 00       	call   f84c4 <do_user_addr_fault+0x304>	f84c0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0304    f84c4:	eb 0b                	jmp    f84d1 <do_user_addr_fault+0x311>
0306    f84c6:	e8 00 00 00 00       	call   f84cb <do_user_addr_fault+0x30b>	f84c7: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
030b    f84cb:	e8 00 00 00 00       	call   f84d0 <do_user_addr_fault+0x310>	f84cc: R_X86_64_PLT32	trace_hardirqs_on-0x4
0310    f84d0:	fb                   	sti
0311    f84d1:	41 bf 14 02 00 00    	mov    $0x214,%r15d
0317    f84d7:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
031c    f84dc:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0321    f84e1:	e8 00 00 00 00       	call   f84e6 <do_user_addr_fault+0x326>	f84e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0326    f84e6:	44 89 f6             	mov    %r14d,%esi
0329    f84e9:	83 e6 02             	and    $0x2,%esi
032c    f84ec:	31 ff                	xor    %edi,%edi
032e    f84ee:	48 89 74 24 48       	mov    %rsi,0x48(%rsp)
0333    f84f3:	e8 00 00 00 00       	call   f84f8 <do_user_addr_fault+0x338>	f84f4: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0338    f84f8:	48 89 eb             	mov    %rbp,%rbx
033b    f84fb:	48 81 e3 00 f0 ff ff 	and    $0xfffffffffffff000,%rbx
0342    f8502:	48 c7 c7 00 00 60 ff 	mov    $0xffffffffff600000,%rdi
0349    f8509:	48 89 de             	mov    %rbx,%rsi
034c    f850c:	e8 00 00 00 00       	call   f8511 <do_user_addr_fault+0x351>	f850d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0351    f8511:	48 81 fb 00 00 60 ff 	cmp    $0xffffffffff600000,%rbx
0358    f8518:	75 1c                	jne    f8536 <do_user_addr_fault+0x376>
035a    f851a:	4c 89 f7             	mov    %r14,%rdi
035d    f851d:	4c 89 e6             	mov    %r12,%rsi
0360    f8520:	48 89 ea             	mov    %rbp,%rdx
0363    f8523:	e8 00 00 00 00       	call   f8528 <do_user_addr_fault+0x368>	f8524: R_X86_64_PLT32	emulate_vsyscall-0x4
0368    f8528:	84 c0                	test   %al,%al
036a    f852a:	74 1a                	je     f8546 <do_user_addr_fault+0x386>
036c    f852c:	e8 00 00 00 00       	call   f8531 <do_user_addr_fault+0x371>	f852d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0371    f8531:	e9 bb 02 00 00       	jmp    f87f1 <do_user_addr_fault+0x631>
0376    f8536:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
037b    f853b:	4c 89 24 24          	mov    %r12,(%rsp)
037f    f853f:	e8 00 00 00 00       	call   f8544 <do_user_addr_fault+0x384>	f8540: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0384    f8544:	eb 0e                	jmp    f8554 <do_user_addr_fault+0x394>
0386    f8546:	4c 89 6c 24 10       	mov    %r13,0x10(%rsp)
038b    f854b:	4c 89 24 24          	mov    %r12,(%rsp)
038f    f854f:	e8 00 00 00 00       	call   f8554 <do_user_addr_fault+0x394>	f8550: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0394    f8554:	48 8b 5c 24 48       	mov    0x48(%rsp),%rbx
0399    f8559:	48 d1 eb             	shr    %rbx
039c    f855c:	44 89 f5             	mov    %r14d,%ebp
039f    f855f:	83 e5 10             	and    $0x10,%ebp
03a2    f8562:	c1 e5 04             	shl    $0x4,%ebp
03a5    f8565:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
03aa    f856a:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
03af    f856f:	e8 00 00 00 00       	call   f8574 <do_user_addr_fault+0x3b4>	f8570: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03b4    f8574:	09 dd                	or     %ebx,%ebp
03b6    f8576:	49 8d bc 24 e0 00 00 00 	lea    0xe0(%r12),%rdi
03be    f857e:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
03c3    f8583:	e8 00 00 00 00       	call   f8588 <do_user_addr_fault+0x3c8>	f8584: R_X86_64_PLT32	down_read_trylock-0x4
03c8    f8588:	89 c3                	mov    %eax,%ebx
03ca    f858a:	31 ff                	xor    %edi,%edi
03cc    f858c:	89 c6                	mov    %eax,%esi
03ce    f858e:	e8 00 00 00 00       	call   f8593 <do_user_addr_fault+0x3d3>	f858f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
03d3    f8593:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
03d8    f8598:	e8 00 00 00 00       	call   f859d <do_user_addr_fault+0x3dd>	f8599: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03dd    f859d:	44 09 fd             	or     %r15d,%ebp
03e0    f85a0:	89 6c 24 24          	mov    %ebp,0x24(%rsp)
03e4    f85a4:	85 db                	test   %ebx,%ebx
03e6    f85a6:	74 74                	je     f861c <do_user_addr_fault+0x45c>
03e8    f85a8:	e8 00 00 00 00       	call   f85ad <do_user_addr_fault+0x3ed>	f85a9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
03ed    f85ad:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	f85b0: R_X86_64_32S	.rodata+0x3e3e0
03f4    f85b4:	be 6a 05 00 00       	mov    $0x56a,%esi
03f9    f85b9:	e8 00 00 00 00       	call   f85be <do_user_addr_fault+0x3fe>	f85ba: R_X86_64_PLT32	__might_sleep-0x4
03fe    f85be:	e8 00 00 00 00       	call   f85c3 <do_user_addr_fault+0x403>	f85bf: R_X86_64_PLT32	__cond_resched-0x4
0403    f85c3:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
040d    f85cd:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
0412    f85d2:	e9 a3 01 00 00       	jmp    f877a <do_user_addr_fault+0x5ba>
0417    f85d7:	e8 00 00 00 00       	call   f85dc <do_user_addr_fault+0x41c>	f85d8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
041c    f85dc:	e9 8b 00 00 00       	jmp    f866c <do_user_addr_fault+0x4ac>
0421    f85e1:	e8 00 00 00 00       	call   f85e6 <do_user_addr_fault+0x426>	f85e2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0426    f85e6:	4c 89 e7             	mov    %r12,%rdi
0429    f85e9:	4c 89 f6             	mov    %r14,%rsi
042c    f85ec:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0431    f85f1:	e8 4a 23 00 00       	call   fa940 <pgtable_bad>
0436    f85f6:	e9 7a fd ff ff       	jmp    f8375 <do_user_addr_fault+0x1b5>
043b    f85fb:	e8 00 00 00 00       	call   f8600 <do_user_addr_fault+0x440>	f85fc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0440    f8600:	eb 05                	jmp    f8607 <do_user_addr_fault+0x447>
0442    f8602:	e8 00 00 00 00       	call   f8607 <do_user_addr_fault+0x447>	f8603: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0447    f8607:	4c 89 e7             	mov    %r12,%rdi
044a    f860a:	4c 89 f6             	mov    %r14,%rsi
044d    f860d:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
0452    f8612:	e8 69 09 00 00       	call   f8f80 <bad_area_nosemaphore>
0457    f8617:	e9 d5 01 00 00       	jmp    f87f1 <do_user_addr_fault+0x631>
045c    f861c:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0466    f8626:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
046b    f862b:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0470    f8630:	74 0a                	je     f863c <do_user_addr_fault+0x47c>
0472    f8632:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0477    f8637:	e8 00 00 00 00       	call   f863c <do_user_addr_fault+0x47c>	f8638: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
047c    f863c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0481    f8641:	48 8b 18             	mov    (%rax),%rbx
0484    f8644:	48 89 de             	mov    %rbx,%rsi
0487    f8647:	48 83 e6 03          	and    $0x3,%rsi
048b    f864b:	31 ff                	xor    %edi,%edi
048d    f864d:	e8 00 00 00 00       	call   f8652 <do_user_addr_fault+0x492>	f864e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0492    f8652:	48 83 e3 03          	and    $0x3,%rbx
0496    f8656:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
049b    f865b:	74 24                	je     f8681 <do_user_addr_fault+0x4c1>
049d    f865d:	e8 00 00 00 00       	call   f8662 <do_user_addr_fault+0x4a2>	f865e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04a2    f8662:	e9 52 04 00 00       	jmp    f8ab9 <do_user_addr_fault+0x8f9>
04a7    f8667:	e8 00 00 00 00       	call   f866c <do_user_addr_fault+0x4ac>	f8668: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04ac    f866c:	4c 89 e7             	mov    %r12,%rdi
04af    f866f:	4c 89 f6             	mov    %r14,%rsi
04b2    f8672:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
04b7    f8677:	e8 04 12 00 00       	call   f9880 <page_fault_oops>
04bc    f867c:	e9 70 01 00 00       	jmp    f87f1 <do_user_addr_fault+0x631>
04c1    f8681:	48 8b 04 24          	mov    (%rsp),%rax
04c5    f8685:	48 8d 98 80 00 00 00 	lea    0x80(%rax),%rbx
04cc    f868c:	48 89 d8             	mov    %rbx,%rax
04cf    f868f:	48 c1 e8 03          	shr    $0x3,%rax
04d3    f8693:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
04d8    f8698:	74 08                	je     f86a2 <do_user_addr_fault+0x4e2>
04da    f869a:	48 89 df             	mov    %rbx,%rdi
04dd    f869d:	e8 00 00 00 00       	call   f86a2 <do_user_addr_fault+0x4e2>	f869e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
04e2    f86a2:	48 8b 3b             	mov    (%rbx),%rdi
04e5    f86a5:	e8 00 00 00 00       	call   f86aa <do_user_addr_fault+0x4ea>	f86a6: R_X86_64_PLT32	search_exception_tables-0x4
04ea    f86aa:	48 85 c0             	test   %rax,%rax
04ed    f86ad:	74 18                	je     f86c7 <do_user_addr_fault+0x507>
04ef    f86af:	e8 00 00 00 00       	call   f86b4 <do_user_addr_fault+0x4f4>	f86b0: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04f4    f86b4:	e9 00 04 00 00       	jmp    f8ab9 <do_user_addr_fault+0x8f9>
04f9    f86b9:	e8 00 00 00 00       	call   f86be <do_user_addr_fault+0x4fe>	f86ba: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
04fe    f86be:	90                   	nop
04ff    f86bf:	0f 0b                	ud2
0501    f86c1:	90                   	nop
0502    f86c2:	e9 2a 01 00 00       	jmp    f87f1 <do_user_addr_fault+0x631>
0507    f86c7:	e8 00 00 00 00       	call   f86cc <do_user_addr_fault+0x50c>	f86c8: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
050c    f86cc:	48 8b 3c 24          	mov    (%rsp),%rdi
0510    f86d0:	4c 89 f6             	mov    %r14,%rsi
0513    f86d3:	48 89 ea             	mov    %rbp,%rdx
0516    f86d6:	e9 37 ff ff ff       	jmp    f8612 <do_user_addr_fault+0x452>
051b    f86db:	89 d9                	mov    %ebx,%ecx
051d    f86dd:	80 e1 07             	and    $0x7,%cl
0520    f86e0:	80 c1 03             	add    $0x3,%cl
0523    f86e3:	38 c1                	cmp    %al,%cl
0525    f86e5:	0f 8c 1c fd ff ff    	jl     f8407 <do_user_addr_fault+0x247>
052b    f86eb:	48 89 df             	mov    %rbx,%rdi
052e    f86ee:	e8 00 00 00 00       	call   f86f3 <do_user_addr_fault+0x533>	f86ef: R_X86_64_PLT32	__asan_report_load4_noabort-0x4
0533    f86f3:	e9 0f fd ff ff       	jmp    f8407 <do_user_addr_fault+0x247>
0538    f86f8:	f3 0f 1e fa          	endbr64
053c    f86fc:	e8 00 00 00 00       	call   f8701 <do_user_addr_fault+0x541>	f86fd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0541    f8701:	e9 79 fc ff ff       	jmp    f837f <do_user_addr_fault+0x1bf>
0546    f8706:	f3 0f 1e fa          	endbr64
054a    f870a:	e8 00 00 00 00       	call   f870f <do_user_addr_fault+0x54f>	f870b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
054f    f870f:	e9 da fc ff ff       	jmp    f83ee <do_user_addr_fault+0x22e>
0554    f8714:	f3 0f 1e fa          	endbr64
0558    f8718:	e8 00 00 00 00       	call   f871d <do_user_addr_fault+0x55d>	f8719: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
055d    f871d:	be 01 00 00 00       	mov    $0x1,%esi
0562    f8722:	bf 02 00 00 00       	mov    $0x2,%edi
0567    f8727:	4c 89 e2             	mov    %r12,%rdx
056a    f872a:	48 89 e9             	mov    %rbp,%rcx
056d    f872d:	e8 00 00 00 00       	call   f8732 <do_user_addr_fault+0x572>	f872e: R_X86_64_PLT32	__perf_sw_event-0x4
0572    f8732:	e9 af fd ff ff       	jmp    f84e6 <do_user_addr_fault+0x326>
0577    f8737:	f3 0f 1e fa          	endbr64
057b    f873b:	e8 00 00 00 00       	call   f8740 <do_user_addr_fault+0x580>	f873c: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0580    f8740:	4c 89 e7             	mov    %r12,%rdi
0583    f8743:	31 f6                	xor    %esi,%esi
0585    f8745:	e8 00 00 00 00       	call   f874a <do_user_addr_fault+0x58a>	f8746: R_X86_64_PLT32	__mmap_lock_do_trace_start_locking-0x4
058a    f874a:	e9 25 fe ff ff       	jmp    f8574 <do_user_addr_fault+0x3b4>
058f    f874f:	f3 0f 1e fa          	endbr64
0593    f8753:	45 31 e4             	xor    %r12d,%r12d
0596    f8756:	85 db                	test   %ebx,%ebx
0598    f8758:	41 0f 95 c4          	setne  %r12b
059c    f875c:	e8 00 00 00 00       	call   f8761 <do_user_addr_fault+0x5a1>	f875d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
05a1    f8761:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
05a6    f8766:	31 f6                	xor    %esi,%esi
05a8    f8768:	44 89 e2             	mov    %r12d,%edx
05ab    f876b:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
05b0    f8770:	e8 00 00 00 00       	call   f8775 <do_user_addr_fault+0x5b5>	f8771: R_X86_64_PLT32	__mmap_lock_do_trace_acquire_returned-0x4
05b5    f8775:	e9 23 fe ff ff       	jmp    f859d <do_user_addr_fault+0x3dd>
05ba    f877a:	4c 89 e7             	mov    %r12,%rdi
05bd    f877d:	48 89 ee             	mov    %rbp,%rsi
05c0    f8780:	e8 00 00 00 00       	call   f8785 <do_user_addr_fault+0x5c5>	f8781: R_X86_64_PLT32	find_vma-0x4
05c5    f8785:	48 85 c0             	test   %rax,%rax
05c8    f8788:	0f 84 30 04 00 00    	je     f8bbe <do_user_addr_fault+0x9fe>
05ce    f878e:	49 89 c4             	mov    %rax,%r12
05d1    f8791:	48 c1 e8 03          	shr    $0x3,%rax
05d5    f8795:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
05da    f879a:	74 08                	je     f87a4 <do_user_addr_fault+0x5e4>
05dc    f879c:	4c 89 e7             	mov    %r12,%rdi
05df    f879f:	e8 00 00 00 00       	call   f87a4 <do_user_addr_fault+0x5e4>	f87a0: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
05e4    f87a4:	49 8b 1c 24          	mov    (%r12),%rbx
05e8    f87a8:	48 89 df             	mov    %rbx,%rdi
05eb    f87ab:	48 89 ee             	mov    %rbp,%rsi
05ee    f87ae:	e8 00 00 00 00       	call   f87b3 <do_user_addr_fault+0x5f3>	f87af: R_X86_64_PLT32	__sanitizer_cov_trace_cmp8-0x4
05f3    f87b3:	48 39 eb             	cmp    %rbp,%rbx
05f6    f87b6:	0f 87 1b 04 00 00    	ja     f8bd7 <do_user_addr_fault+0xa17>
05fc    f87bc:	e8 00 00 00 00       	call   f87c1 <do_user_addr_fault+0x601>	f87bd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0601    f87c1:	4c 89 f6             	mov    %r14,%rsi
0604    f87c4:	48 81 e6 20 80 00 00 	and    $0x8020,%rsi
060b    f87cb:	31 ff                	xor    %edi,%edi
060d    f87cd:	e8 00 00 00 00       	call   f87d2 <do_user_addr_fault+0x612>	f87ce: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0612    f87d2:	4c 89 f0             	mov    %r14,%rax
0615    f87d5:	48 25 20 80 00 00    	and    $0x8020,%rax
061b    f87db:	74 44                	je     f8821 <do_user_addr_fault+0x661>
061d    f87dd:	e8 00 00 00 00       	call   f87e2 <do_user_addr_fault+0x622>	f87de: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0622    f87e2:	48 8b 3c 24          	mov    (%rsp),%rdi
0626    f87e6:	4c 89 f6             	mov    %r14,%rsi
0629    f87e9:	48 89 ea             	mov    %rbp,%rdx
062c    f87ec:	e8 8f 22 00 00       	call   faa80 <bad_area_access_error>
0631    f87f1:	65 48 8b 04 25 28 00 00 00 	mov    %gs:0x28,%rax
063a    f87fa:	48 3b 44 24 60       	cmp    0x60(%rsp),%rax
063f    f87ff:	0f 85 f1 05 00 00    	jne    f8df6 <do_user_addr_fault+0xc36>
0645    f8805:	48 83 c4 68          	add    $0x68,%rsp
0649    f8809:	5b                   	pop    %rbx
064a    f880a:	41 5c                	pop    %r12
064c    f880c:	41 5d                	pop    %r13
064e    f880e:	41 5e                	pop    %r14
0650    f8810:	41 5f                	pop    %r15
0652    f8812:	5d                   	pop    %rbp
0653    f8813:	31 c0                	xor    %eax,%eax
0655    f8815:	31 c9                	xor    %ecx,%ecx
0657    f8817:	31 ff                	xor    %edi,%edi
0659    f8819:	31 d2                	xor    %edx,%edx
065b    f881b:	31 f6                	xor    %esi,%esi
065d    f881d:	45 31 c0             	xor    %r8d,%r8d
0660    f8820:	c3                   	ret
0661    f8821:	48 83 7c 24 48 00    	cmpq   $0x0,0x48(%rsp)
0667    f8827:	4c 89 74 24 28       	mov    %r14,0x28(%rsp)
066c    f882c:	75 56                	jne    f8884 <do_user_addr_fault+0x6c4>
066e    f882e:	4c 89 f6             	mov    %r14,%rsi
0671    f8831:	48 83 e6 01          	and    $0x1,%rsi
0675    f8835:	31 ff                	xor    %edi,%edi
0677    f8837:	e8 00 00 00 00       	call   f883c <do_user_addr_fault+0x67c>	f8838: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
067c    f883c:	4c 89 f0             	mov    %r14,%rax
067f    f883f:	48 83 e0 01          	and    $0x1,%rax
0683    f8843:	0f 85 2c 04 00 00    	jne    f8c75 <do_user_addr_fault+0xab5>
0689    f8849:	49 89 ee             	mov    %rbp,%r14
068c    f884c:	e8 00 00 00 00       	call   f8851 <do_user_addr_fault+0x691>	f884d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0691    f8851:	4c 89 e3             	mov    %r12,%rbx
0694    f8854:	48 83 c3 20          	add    $0x20,%rbx
0698    f8858:	48 89 d8             	mov    %rbx,%rax
069b    f885b:	48 c1 e8 03          	shr    $0x3,%rax
069f    f885f:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
06a4    f8864:	74 08                	je     f886e <do_user_addr_fault+0x6ae>
06a6    f8866:	48 89 df             	mov    %rbx,%rdi
06a9    f8869:	e8 00 00 00 00       	call   f886e <do_user_addr_fault+0x6ae>	f886a: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06ae    f886e:	48 8b 33             	mov    (%rbx),%rsi
06b1    f8871:	31 ed                	xor    %ebp,%ebp
06b3    f8873:	48 83 e6 07          	and    $0x7,%rsi
06b7    f8877:	40 0f 94 c5          	sete   %bpl
06bb    f887b:	31 ff                	xor    %edi,%edi
06bd    f887d:	e8 00 00 00 00       	call   f8882 <do_user_addr_fault+0x6c2>	f887e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
06c2    f8882:	eb 2e                	jmp    f88b2 <do_user_addr_fault+0x6f2>
06c4    f8884:	49 89 ee             	mov    %rbp,%r14
06c7    f8887:	e8 00 00 00 00       	call   f888c <do_user_addr_fault+0x6cc>	f8888: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
06cc    f888c:	4c 89 e3             	mov    %r12,%rbx
06cf    f888f:	48 83 c3 20          	add    $0x20,%rbx
06d3    f8893:	48 89 d8             	mov    %rbx,%rax
06d6    f8896:	48 c1 e8 03          	shr    $0x3,%rax
06da    f889a:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
06df    f889f:	74 08                	je     f88a9 <do_user_addr_fault+0x6e9>
06e1    f88a1:	48 89 df             	mov    %rbx,%rdi
06e4    f88a4:	e8 00 00 00 00       	call   f88a9 <do_user_addr_fault+0x6e9>	f88a5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
06e9    f88a9:	31 ed                	xor    %ebp,%ebp
06eb    f88ab:	f6 03 02             	testb  $0x2,(%rbx)
06ee    f88ae:	40 0f 94 c5          	sete   %bpl
06f2    f88b2:	8b 5c 24 24          	mov    0x24(%rsp),%ebx
06f6    f88b6:	31 ff                	xor    %edi,%edi
06f8    f88b8:	89 ee                	mov    %ebp,%esi
06fa    f88ba:	e8 00 00 00 00       	call   f88bf <do_user_addr_fault+0x6ff>	f88bb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
06ff    f88bf:	85 ed                	test   %ebp,%ebp
0701    f88c1:	4c 8b 7c 24 18       	mov    0x18(%rsp),%r15
0706    f88c6:	0f 85 7e 03 00 00    	jne    f8c4a <do_user_addr_fault+0xa8a>
070c    f88cc:	4c 89 e7             	mov    %r12,%rdi
070f    f88cf:	4c 89 f6             	mov    %r14,%rsi
0712    f88d2:	89 da                	mov    %ebx,%edx
0714    f88d4:	48 8b 0c 24          	mov    (%rsp),%rcx
0718    f88d8:	e8 00 00 00 00       	call   f88dd <do_user_addr_fault+0x71d>	f88d9: R_X86_64_PLT32	handle_mm_fault-0x4
071d    f88dd:	41 89 c4             	mov    %eax,%r12d
0720    f88e0:	89 c6                	mov    %eax,%esi
0722    f88e2:	81 e6 00 04 00 00    	and    $0x400,%esi
0728    f88e8:	31 ff                	xor    %edi,%edi
072a    f88ea:	e8 00 00 00 00       	call   f88ef <do_user_addr_fault+0x72f>	f88eb: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
072f    f88ef:	44 89 e0             	mov    %r12d,%eax
0732    f88f2:	25 00 04 00 00       	and    $0x400,%eax
0737    f88f7:	0f 84 c9 01 00 00    	je     f8ac6 <do_user_addr_fault+0x906>
073d    f88fd:	44 89 64 24 44       	mov    %r12d,0x44(%rsp)
0742    f8902:	4c 89 f5             	mov    %r14,%rbp
0745    f8905:	4c 89 ff             	mov    %r15,%rdi
0748    f8908:	be 08 00 00 00       	mov    $0x8,%esi
074d    f890d:	e8 00 00 00 00       	call   f8912 <do_user_addr_fault+0x752>	f890e: R_X86_64_PLT32	__kasan_check_read-0x4
0752    f8912:	4d 89 fc             	mov    %r15,%r12
0755    f8915:	49 c1 ec 03          	shr    $0x3,%r12
0759    f8919:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0763    f8923:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
0768    f8928:	74 08                	je     f8932 <do_user_addr_fault+0x772>
076a    f892a:	4c 89 ff             	mov    %r15,%rdi
076d    f892d:	e8 00 00 00 00       	call   f8932 <do_user_addr_fault+0x772>	f892e: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0772    f8932:	49 8b 1f             	mov    (%r15),%rbx
0775    f8935:	48 89 de             	mov    %rbx,%rsi
0778    f8938:	48 83 e6 04          	and    $0x4,%rsi
077c    f893c:	31 ff                	xor    %edi,%edi
077e    f893e:	e8 00 00 00 00       	call   f8943 <do_user_addr_fault+0x783>	f893f: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0783    f8943:	48 83 e3 04          	and    $0x4,%rbx
0787    f8947:	75 07                	jne    f8950 <do_user_addr_fault+0x790>
0789    f8949:	e8 00 00 00 00       	call   f894e <do_user_addr_fault+0x78e>	f894a: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
078e    f894e:	eb 50                	jmp    f89a0 <do_user_addr_fault+0x7e0>
0790    f8950:	4c 89 e9             	mov    %r13,%rcx
0793    f8953:	49 8d 9f 18 08 00 00 	lea    0x818(%r15),%rbx
079a    f895a:	48 89 d8             	mov    %rbx,%rax
079d    f895d:	48 c1 e8 03          	shr    $0x3,%rax
07a1    f8961:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
07a6    f8966:	74 08                	je     f8970 <do_user_addr_fault+0x7b0>
07a8    f8968:	48 89 df             	mov    %rbx,%rdi
07ab    f896b:	e8 00 00 00 00       	call   f8970 <do_user_addr_fault+0x7b0>	f896c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07b0    f8970:	48 8b 1b             	mov    (%rbx),%rbx
07b3    f8973:	41 be 00 01 00 00    	mov    $0x100,%r14d
07b9    f8979:	be 00 01 00 00       	mov    $0x100,%esi
07be    f897e:	48 21 de             	and    %rbx,%rsi
07c1    f8981:	31 ff                	xor    %edi,%edi
07c3    f8983:	e8 00 00 00 00       	call   f8988 <do_user_addr_fault+0x7c8>	f8984: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
07c8    f8988:	49 21 de             	and    %rbx,%r14
07cb    f898b:	0f 85 ab 01 00 00    	jne    f8b3c <do_user_addr_fault+0x97c>
07d1    f8991:	e8 00 00 00 00       	call   f8996 <do_user_addr_fault+0x7d6>	f8992: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
07d6    f8996:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
07e0    f89a0:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
07e5    f89a5:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
07ea    f89aa:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
07ef    f89af:	74 08                	je     f89b9 <do_user_addr_fault+0x7f9>
07f1    f89b1:	48 89 df             	mov    %rbx,%rdi
07f4    f89b4:	e8 00 00 00 00       	call   f89b9 <do_user_addr_fault+0x7f9>	f89b5: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
07f9    f89b9:	48 8b 1b             	mov    (%rbx),%rbx
07fc    f89bc:	48 89 de             	mov    %rbx,%rsi
07ff    f89bf:	48 83 e6 03          	and    $0x3,%rsi
0803    f89c3:	31 ff                	xor    %edi,%edi
0805    f89c5:	e8 00 00 00 00       	call   f89ca <do_user_addr_fault+0x80a>	f89c6: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
080a    f89ca:	48 83 e3 03          	and    $0x3,%rbx
080e    f89ce:	0f 84 b2 00 00 00    	je     f8a86 <do_user_addr_fault+0x8c6>
0814    f89d4:	4c 8b 74 24 18       	mov    0x18(%rsp),%r14
0819    f89d9:	4c 89 f7             	mov    %r14,%rdi
081c    f89dc:	be 08 00 00 00       	mov    $0x8,%esi
0821    f89e1:	e8 00 00 00 00       	call   f89e6 <do_user_addr_fault+0x826>	f89e2: R_X86_64_PLT32	__kasan_check_read-0x4
0826    f89e6:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
082b    f89eb:	74 08                	je     f89f5 <do_user_addr_fault+0x835>
082d    f89ed:	4c 89 f7             	mov    %r14,%rdi
0830    f89f0:	e8 00 00 00 00       	call   f89f5 <do_user_addr_fault+0x835>	f89f1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0835    f89f5:	49 8b 1e             	mov    (%r14),%rbx
0838    f89f8:	bd 00 00 02 00       	mov    $0x20000,%ebp
083d    f89fd:	be 00 00 02 00       	mov    $0x20000,%esi
0842    f8a02:	48 21 de             	and    %rbx,%rsi
0845    f8a05:	31 ff                	xor    %edi,%edi
0847    f8a07:	e8 00 00 00 00       	call   f8a0c <do_user_addr_fault+0x84c>	f8a08: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
084c    f8a0c:	48 21 dd             	and    %rbx,%rbp
084f    f8a0f:	0f 85 47 02 00 00    	jne    f8c5c <do_user_addr_fault+0xa9c>
0855    f8a15:	4c 89 f7             	mov    %r14,%rdi
0858    f8a18:	be 08 00 00 00       	mov    $0x8,%esi
085d    f8a1d:	e8 00 00 00 00       	call   f8a22 <do_user_addr_fault+0x862>	f8a1e: R_X86_64_PLT32	__kasan_check_read-0x4
0862    f8a22:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
086c    f8a2c:	43 80 3c 2c 00       	cmpb   $0x0,(%r12,%r13,1)
0871    f8a31:	74 08                	je     f8a3b <do_user_addr_fault+0x87b>
0873    f8a33:	4c 89 f7             	mov    %r14,%rdi
0876    f8a36:	e8 00 00 00 00       	call   f8a3b <do_user_addr_fault+0x87b>	f8a37: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
087b    f8a3b:	49 8b 1e             	mov    (%r14),%rbx
087e    f8a3e:	48 89 de             	mov    %rbx,%rsi
0881    f8a41:	48 83 e6 04          	and    $0x4,%rsi
0885    f8a45:	31 ff                	xor    %edi,%edi
0887    f8a47:	e8 00 00 00 00       	call   f8a4c <do_user_addr_fault+0x88c>	f8a48: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
088c    f8a4c:	48 83 e3 04          	and    $0x4,%rbx
0890    f8a50:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0895    f8a55:	0f 85 c1 00 00 00    	jne    f8b1c <do_user_addr_fault+0x95c>
089b    f8a5b:	8b 5c 24 44          	mov    0x44(%rsp),%ebx
089f    f8a5f:	89 de                	mov    %ebx,%esi
08a1    f8a61:	81 e6 00 40 00 00    	and    $0x4000,%esi
08a7    f8a67:	31 ff                	xor    %edi,%edi
08a9    f8a69:	e8 00 00 00 00       	call   f8a6e <do_user_addr_fault+0x8ae>	f8a6a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08ae    f8a6e:	81 e3 00 40 00 00    	and    $0x4000,%ebx
08b4    f8a74:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
08b9    f8a79:	0f 85 a9 00 00 00    	jne    f8b28 <do_user_addr_fault+0x968>
08bf    f8a7f:	e8 00 00 00 00       	call   f8a84 <do_user_addr_fault+0x8c4>	f8a80: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08c4    f8a84:	eb 29                	jmp    f8aaf <do_user_addr_fault+0x8ef>
08c6    f8a86:	8b 5c 24 44          	mov    0x44(%rsp),%ebx
08ca    f8a8a:	89 de                	mov    %ebx,%esi
08cc    f8a8c:	81 e6 00 40 00 00    	and    $0x4000,%esi
08d2    f8a92:	31 ff                	xor    %edi,%edi
08d4    f8a94:	e8 00 00 00 00       	call   f8a99 <do_user_addr_fault+0x8d9>	f8a95: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
08d9    f8a99:	81 e3 00 40 00 00    	and    $0x4000,%ebx
08df    f8a9f:	0f 85 0f 01 00 00    	jne    f8bb4 <do_user_addr_fault+0x9f4>
08e5    f8aa5:	e8 00 00 00 00       	call   f8aaa <do_user_addr_fault+0x8ea>	f8aa6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
08ea    f8aaa:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
08ef    f8aaf:	83 4c 24 24 20       	orl    $0x20,0x24(%rsp)
08f4    f8ab4:	4c 8b 64 24 38       	mov    0x38(%rsp),%r12
08f9    f8ab9:	4c 89 e7             	mov    %r12,%rdi
08fc    f8abc:	e8 ff 1e 00 00       	call   fa9c0 <mmap_read_lock>
0901    f8ac1:	e9 b4 fc ff ff       	jmp    f877a <do_user_addr_fault+0x5ba>
0906    f8ac6:	44 89 e6             	mov    %r12d,%esi
0909    f8ac9:	81 e6 00 40 00 00    	and    $0x4000,%esi
090f    f8acf:	31 ff                	xor    %edi,%edi
0911    f8ad1:	e8 00 00 00 00       	call   f8ad6 <do_user_addr_fault+0x916>	f8ad2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0916    f8ad6:	44 89 e0             	mov    %r12d,%eax
0919    f8ad9:	25 00 40 00 00       	and    $0x4000,%eax
091e    f8ade:	75 52                	jne    f8b32 <do_user_addr_fault+0x972>
0920    f8ae0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
0925    f8ae5:	e8 00 00 00 00       	call   f8aea <do_user_addr_fault+0x92a>	f8ae6: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
092a    f8aea:	48 8b 7c 24 50       	mov    0x50(%rsp),%rdi
092f    f8aef:	e8 00 00 00 00       	call   f8af4 <do_user_addr_fault+0x934>	f8af0: R_X86_64_PLT32	up_read-0x4
0934    f8af4:	44 89 e6             	mov    %r12d,%esi
0937    f8af7:	81 e6 73 08 00 00    	and    $0x873,%esi
093d    f8afd:	31 ff                	xor    %edi,%edi
093f    f8aff:	e8 00 00 00 00       	call   f8b04 <do_user_addr_fault+0x944>	f8b00: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0944    f8b04:	44 89 e0             	mov    %r12d,%eax
0947    f8b07:	25 73 08 00 00       	and    $0x873,%eax
094c    f8b0c:	0f 85 6d 01 00 00    	jne    f8c7f <do_user_addr_fault+0xabf>
0952    f8b12:	e8 00 00 00 00       	call   f8b17 <do_user_addr_fault+0x957>	f8b13: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0957    f8b17:	e9 d5 fc ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
095c    f8b1c:	e8 00 00 00 00       	call   f8b21 <do_user_addr_fault+0x961>	f8b1d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0961    f8b21:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
0966    f8b26:	eb 2b                	jmp    f8b53 <do_user_addr_fault+0x993>
0968    f8b28:	e8 00 00 00 00       	call   f8b2d <do_user_addr_fault+0x96d>	f8b29: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
096d    f8b2d:	e9 bf fc ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
0972    f8b32:	e8 00 00 00 00       	call   f8b37 <do_user_addr_fault+0x977>	f8b33: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0977    f8b37:	e9 b5 fc ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
097c    f8b3c:	e8 00 00 00 00       	call   f8b41 <do_user_addr_fault+0x981>	f8b3d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0981    f8b41:	49 89 ef             	mov    %rbp,%r15
0984    f8b44:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0989    f8b49:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0993    f8b53:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
0998    f8b58:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
099d    f8b5d:	48 8b 2c 24          	mov    (%rsp),%rbp
09a1    f8b61:	48 8b 5c 24 10       	mov    0x10(%rsp),%rbx
09a6    f8b66:	74 08                	je     f8b70 <do_user_addr_fault+0x9b0>
09a8    f8b68:	48 89 df             	mov    %rbx,%rdi
09ab    f8b6b:	e8 00 00 00 00       	call   f8b70 <do_user_addr_fault+0x9b0>	f8b6c: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
09b0    f8b70:	48 8b 1b             	mov    (%rbx),%rbx
09b3    f8b73:	48 89 de             	mov    %rbx,%rsi
09b6    f8b76:	48 83 e6 03          	and    $0x3,%rsi
09ba    f8b7a:	31 ff                	xor    %edi,%edi
09bc    f8b7c:	e8 00 00 00 00       	call   f8b81 <do_user_addr_fault+0x9c1>	f8b7d: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
09c1    f8b81:	48 83 e3 03          	and    $0x3,%rbx
09c5    f8b85:	74 0a                	je     f8b91 <do_user_addr_fault+0x9d1>
09c7    f8b87:	e8 00 00 00 00       	call   f8b8c <do_user_addr_fault+0x9cc>	f8b88: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09cc    f8b8c:	e9 60 fc ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
09d1    f8b91:	e8 00 00 00 00       	call   f8b96 <do_user_addr_fault+0x9d6>	f8b92: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09d6    f8b96:	48 89 ef             	mov    %rbp,%rdi
09d9    f8b99:	4c 89 f6             	mov    %r14,%rsi
09dc    f8b9c:	4c 89 fa             	mov    %r15,%rdx
09df    f8b9f:	b9 07 00 00 00       	mov    $0x7,%ecx
09e4    f8ba4:	41 b8 02 00 00 00    	mov    $0x2,%r8d
09ea    f8baa:	e8 51 0a 00 00       	call   f9600 <kernelmode_fixup_or_oops>
09ef    f8baf:	e9 3d fc ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
09f4    f8bb4:	e8 00 00 00 00       	call   f8bb9 <do_user_addr_fault+0x9f9>	f8bb5: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
09f9    f8bb9:	e9 33 fc ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
09fe    f8bbe:	e8 00 00 00 00       	call   f8bc3 <do_user_addr_fault+0xa03>	f8bbf: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a03    f8bc3:	48 8b 3c 24          	mov    (%rsp),%rdi
0a07    f8bc7:	4c 89 f6             	mov    %r14,%rsi
0a0a    f8bca:	48 89 ea             	mov    %rbp,%rdx
0a0d    f8bcd:	e8 6e 1e 00 00       	call   faa40 <bad_area>
0a12    f8bd2:	e9 1a fc ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
0a17    f8bd7:	49 89 ef             	mov    %rbp,%r15
0a1a    f8bda:	49 8d 5c 24 20       	lea    0x20(%r12),%rbx
0a1f    f8bdf:	48 89 d8             	mov    %rbx,%rax
0a22    f8be2:	48 c1 e8 03          	shr    $0x3,%rax
0a26    f8be6:	42 80 3c 28 00       	cmpb   $0x0,(%rax,%r13,1)
0a2b    f8beb:	74 08                	je     f8bf5 <do_user_addr_fault+0xa35>
0a2d    f8bed:	48 89 df             	mov    %rbx,%rdi
0a30    f8bf0:	e8 00 00 00 00       	call   f8bf5 <do_user_addr_fault+0xa35>	f8bf1: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0a35    f8bf5:	48 8b 1b             	mov    (%rbx),%rbx
0a38    f8bf8:	bd 00 01 00 00       	mov    $0x100,%ebp
0a3d    f8bfd:	be 00 01 00 00       	mov    $0x100,%esi
0a42    f8c02:	48 21 de             	and    %rbx,%rsi
0a45    f8c05:	31 ff                	xor    %edi,%edi
0a47    f8c07:	e8 00 00 00 00       	call   f8c0c <do_user_addr_fault+0xa4c>	f8c08: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0a4c    f8c0c:	48 21 dd             	and    %rbx,%rbp
0a4f    f8c0f:	0f 84 c6 01 00 00    	je     f8ddb <do_user_addr_fault+0xc1b>
0a55    f8c15:	4c 89 e7             	mov    %r12,%rdi
0a58    f8c18:	4c 89 fe             	mov    %r15,%rsi
0a5b    f8c1b:	e8 00 00 00 00       	call   f8c20 <do_user_addr_fault+0xa60>	f8c1c: R_X86_64_PLT32	expand_stack-0x4
0a60    f8c20:	89 c3                	mov    %eax,%ebx
0a62    f8c22:	31 ff                	xor    %edi,%edi
0a64    f8c24:	89 c6                	mov    %eax,%esi
0a66    f8c26:	e8 00 00 00 00       	call   f8c2b <do_user_addr_fault+0xa6b>	f8c27: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0a6b    f8c2b:	85 db                	test   %ebx,%ebx
0a6d    f8c2d:	0f 85 af 01 00 00    	jne    f8de2 <do_user_addr_fault+0xc22>
0a73    f8c33:	e8 00 00 00 00       	call   f8c38 <do_user_addr_fault+0xa78>	f8c34: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a78    f8c38:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0a82    f8c42:	4c 89 fd             	mov    %r15,%rbp
0a85    f8c45:	e9 77 fb ff ff       	jmp    f87c1 <do_user_addr_fault+0x601>
0a8a    f8c4a:	e8 00 00 00 00       	call   f8c4f <do_user_addr_fault+0xa8f>	f8c4b: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0a8f    f8c4f:	4c 89 f5             	mov    %r14,%rbp
0a92    f8c52:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0a97    f8c57:	e9 86 fb ff ff       	jmp    f87e2 <do_user_addr_fault+0x622>
0a9c    f8c5c:	e8 00 00 00 00       	call   f8c61 <do_user_addr_fault+0xaa1>	f8c5d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0aa1    f8c61:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
0aa6    f8c66:	49 bd 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%r13
0ab0    f8c70:	e9 ac fe ff ff       	jmp    f8b21 <do_user_addr_fault+0x961>
0ab5    f8c75:	e8 00 00 00 00       	call   f8c7a <do_user_addr_fault+0xaba>	f8c76: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0aba    f8c7a:	e9 63 fb ff ff       	jmp    f87e2 <do_user_addr_fault+0x622>
0abf    f8c7f:	48 8b 6c 24 28       	mov    0x28(%rsp),%rbp
0ac4    f8c84:	4c 89 ff             	mov    %r15,%rdi
0ac7    f8c87:	e8 34 1e 00 00       	call   faac0 <fatal_signal_pending>
0acc    f8c8c:	89 c3                	mov    %eax,%ebx
0ace    f8c8e:	31 ff                	xor    %edi,%edi
0ad0    f8c90:	89 c6                	mov    %eax,%esi
0ad2    f8c92:	e8 00 00 00 00       	call   f8c97 <do_user_addr_fault+0xad7>	f8c93: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0ad7    f8c97:	85 db                	test   %ebx,%ebx
0ad9    f8c99:	74 46                	je     f8ce1 <do_user_addr_fault+0xb21>
0adb    f8c9b:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0ae5    f8ca5:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
0aea    f8caa:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0aee    f8cae:	74 0a                	je     f8cba <do_user_addr_fault+0xafa>
0af0    f8cb0:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0af5    f8cb5:	e8 00 00 00 00       	call   f8cba <do_user_addr_fault+0xafa>	f8cb6: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0afa    f8cba:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0aff    f8cbf:	48 8b 18             	mov    (%rax),%rbx
0b02    f8cc2:	48 89 de             	mov    %rbx,%rsi
0b05    f8cc5:	48 83 e6 03          	and    $0x3,%rsi
0b09    f8cc9:	31 ff                	xor    %edi,%edi
0b0b    f8ccb:	e8 00 00 00 00       	call   f8cd0 <do_user_addr_fault+0xb10>	f8ccc: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0b10    f8cd0:	48 83 e3 03          	and    $0x3,%rbx
0b14    f8cd4:	0f 84 a2 00 00 00    	je     f8d7c <do_user_addr_fault+0xbbc>
0b1a    f8cda:	e8 00 00 00 00       	call   f8cdf <do_user_addr_fault+0xb1f>	f8cdb: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b1f    f8cdf:	eb 05                	jmp    f8ce6 <do_user_addr_fault+0xb26>
0b21    f8ce1:	e8 00 00 00 00       	call   f8ce6 <do_user_addr_fault+0xb26>	f8ce2: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b26    f8ce6:	44 89 e3             	mov    %r12d,%ebx
0b29    f8ce9:	44 89 e6             	mov    %r12d,%esi
0b2c    f8cec:	83 e6 01             	and    $0x1,%esi
0b2f    f8cef:	31 ff                	xor    %edi,%edi
0b31    f8cf1:	e8 00 00 00 00       	call   f8cf6 <do_user_addr_fault+0xb36>	f8cf2: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b36    f8cf6:	44 89 e0             	mov    %r12d,%eax
0b39    f8cf9:	83 e0 01             	and    $0x1,%eax
0b3c    f8cfc:	75 34                	jne    f8d32 <do_user_addr_fault+0xb72>
0b3e    f8cfe:	44 89 e3             	mov    %r12d,%ebx
0b41    f8d01:	44 89 e6             	mov    %r12d,%esi
0b44    f8d04:	83 e6 32             	and    $0x32,%esi
0b47    f8d07:	31 ff                	xor    %edi,%edi
0b49    f8d09:	e8 00 00 00 00       	call   f8d0e <do_user_addr_fault+0xb4e>	f8d0a: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0b4e    f8d0e:	44 89 e0             	mov    %r12d,%eax
0b51    f8d11:	83 e0 32             	and    $0x32,%eax
0b54    f8d14:	74 7f                	je     f8d95 <do_user_addr_fault+0xbd5>
0b56    f8d16:	e8 00 00 00 00       	call   f8d1b <do_user_addr_fault+0xb5b>	f8d17: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0b5b    f8d1b:	48 8b 3c 24          	mov    (%rsp),%rdi
0b5f    f8d1f:	48 89 ee             	mov    %rbp,%rsi
0b62    f8d22:	4c 89 f2             	mov    %r14,%rdx
0b65    f8d25:	44 89 e1             	mov    %r12d,%ecx
0b68    f8d28:	e8 53 1e 00 00       	call   fab80 <do_sigbus>
0b6d    f8d2d:	e9 bf fa ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
0b72    f8d32:	48 b8 00 00 00 00 00 fc ff df 	movabs $0xdffffc0000000000,%rax
0b7c    f8d3c:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
0b81    f8d41:	80 3c 01 00          	cmpb   $0x0,(%rcx,%rax,1)
0b85    f8d45:	74 0a                	je     f8d51 <do_user_addr_fault+0xb91>
0b87    f8d47:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
0b8c    f8d4c:	e8 00 00 00 00       	call   f8d51 <do_user_addr_fault+0xb91>	f8d4d: R_X86_64_PLT32	__asan_report_load8_noabort-0x4
0b91    f8d51:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
0b96    f8d56:	48 8b 18             	mov    (%rax),%rbx
0b99    f8d59:	48 89 de             	mov    %rbx,%rsi
0b9c    f8d5c:	48 83 e6 03          	and    $0x3,%rsi
0ba0    f8d60:	31 ff                	xor    %edi,%edi
0ba2    f8d62:	e8 00 00 00 00       	call   f8d67 <do_user_addr_fault+0xba7>	f8d63: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp8-0x4
0ba7    f8d67:	48 83 e3 03          	and    $0x3,%rbx
0bab    f8d6b:	74 4f                	je     f8dbc <do_user_addr_fault+0xbfc>
0bad    f8d6d:	e8 00 00 00 00       	call   f8d72 <do_user_addr_fault+0xbb2>	f8d6e: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bb2    f8d72:	e8 00 00 00 00       	call   f8d77 <do_user_addr_fault+0xbb7>	f8d73: R_X86_64_PLT32	pagefault_out_of_memory-0x4
0bb7    f8d77:	e9 75 fa ff ff       	jmp    f87f1 <do_user_addr_fault+0x631>
0bbc    f8d7c:	e8 00 00 00 00       	call   f8d81 <do_user_addr_fault+0xbc1>	f8d7d: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bc1    f8d81:	48 8b 3c 24          	mov    (%rsp),%rdi
0bc5    f8d85:	48 89 ee             	mov    %rbp,%rsi
0bc8    f8d88:	4c 89 f2             	mov    %r14,%rdx
0bcb    f8d8b:	31 c9                	xor    %ecx,%ecx
0bcd    f8d8d:	45 31 c0             	xor    %r8d,%r8d
0bd0    f8d90:	e9 15 fe ff ff       	jmp    f8baa <do_user_addr_fault+0x9ea>
0bd5    f8d95:	44 89 e6             	mov    %r12d,%esi
0bd8    f8d98:	83 e6 40             	and    $0x40,%esi
0bdb    f8d9b:	31 ff                	xor    %edi,%edi
0bdd    f8d9d:	e8 00 00 00 00       	call   f8da2 <do_user_addr_fault+0xbe2>	f8d9e: R_X86_64_PLT32	__sanitizer_cov_trace_const_cmp4-0x4
0be2    f8da2:	41 83 e4 40          	and    $0x40,%r12d
0be6    f8da6:	74 6d                	je     f8e15 <do_user_addr_fault+0xc55>
0be8    f8da8:	e8 00 00 00 00       	call   f8dad <do_user_addr_fault+0xbed>	f8da9: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0bed    f8dad:	48 8b 3c 24          	mov    (%rsp),%rdi
0bf1    f8db1:	48 89 ee             	mov    %rbp,%rsi
0bf4    f8db4:	4c 89 f2             	mov    %r14,%rdx
0bf7    f8db7:	e9 56 f8 ff ff       	jmp    f8612 <do_user_addr_fault+0x452>
0bfc    f8dbc:	e8 00 00 00 00       	call   f8dc1 <do_user_addr_fault+0xc01>	f8dbd: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c01    f8dc1:	48 8b 3c 24          	mov    (%rsp),%rdi
0c05    f8dc5:	48 89 ee             	mov    %rbp,%rsi
0c08    f8dc8:	4c 89 f2             	mov    %r14,%rdx
0c0b    f8dcb:	b9 0b 00 00 00       	mov    $0xb,%ecx
0c10    f8dd0:	41 b8 01 00 00 00    	mov    $0x1,%r8d
0c16    f8dd6:	e9 cf fd ff ff       	jmp    f8baa <do_user_addr_fault+0x9ea>
0c1b    f8ddb:	e8 00 00 00 00       	call   f8de0 <do_user_addr_fault+0xc20>	f8ddc: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c20    f8de0:	eb 05                	jmp    f8de7 <do_user_addr_fault+0xc27>
0c22    f8de2:	e8 00 00 00 00       	call   f8de7 <do_user_addr_fault+0xc27>	f8de3: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c27    f8de7:	48 8b 3c 24          	mov    (%rsp),%rdi
0c2b    f8deb:	4c 89 f6             	mov    %r14,%rsi
0c2e    f8dee:	4c 89 fa             	mov    %r15,%rdx
0c31    f8df1:	e9 d7 fd ff ff       	jmp    f8bcd <do_user_addr_fault+0xa0d>
0c36    f8df6:	e8 00 00 00 00       	call   f8dfb <do_user_addr_fault+0xc3b>	f8df7: R_X86_64_PLT32	__stack_chk_fail-0x4
0c3b    f8dfb:	f3 0f 1e fa          	endbr64
0c3f    f8dff:	e8 00 00 00 00       	call   f8e04 <do_user_addr_fault+0xc44>	f8e00: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c44    f8e04:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
0c49    f8e09:	31 f6                	xor    %esi,%esi
0c4b    f8e0b:	e8 00 00 00 00       	call   f8e10 <do_user_addr_fault+0xc50>	f8e0c: R_X86_64_PLT32	__mmap_lock_do_trace_released-0x4
0c50    f8e10:	e9 d5 fc ff ff       	jmp    f8aea <do_user_addr_fault+0x92a>
0c55    f8e15:	e8 00 00 00 00       	call   f8e1a <do_user_addr_fault+0xc5a>	f8e16: R_X86_64_PLT32	__sanitizer_cov_trace_pc-0x4
0c5a    f8e1a:	90                   	nop
0c5b    f8e1b:	0f 0b                	ud2
0c5d    f8e1d:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0c6c    f8e2c:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
0c7b    f8e3b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
