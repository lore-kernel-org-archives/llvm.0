Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCF1EC9;
	Sat, 15 Jul 2023 05:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689397562; x=1720933562;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ZtHNm8f2B0hOPyKMVeztLVfSeOoPDGjP34ftWlmqekk=;
  b=SR+2Qz0ARhA/zvxpMPxLTQSzsfOhkhdOm5olksV9I38PIatatV8XD0Ni
   LKfbZH1l+6lZTsRygkfbGtF6pqiU7+ZdNsucjpbVm1b6GJVKj+SnoTSLN
   Wdr8luT5k92dKYjqYtOyhzKIdn0iVxeA3oCJ83Lk1/IWykQIgnYT/H8S6
   W+nHie8TMs90FFEXfH6IFgSJTh102TqF4lZUII60+uPAaPqXrolZ/2Hgk
   xlrDZ+1xNroB5OCQEnlVXChU1dOv0l48yR8I9tjkTxstBVlGob0+fytvi
   W6E5xgZl/Te4faUpCwC1jFoNEawAlRGrzOZAUsG+aB3BYgFHxPAVnMuRC
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="369183203"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="369183203"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 22:05:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="788056212"
X-IronPort-AV: E=Sophos;i="6.01,207,1684825200"; 
   d="scan'208";a="788056212"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 22:05:52 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKXTb-0007wb-0F;
	Sat, 15 Jul 2023 05:05:51 +0000
Date: Sat, 15 Jul 2023 13:04:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: acpi_idle_do_entry+0xa: call to
 perf_lopwr_cb() leaves .noinstr.text section
Message-ID: <202307151342.oBLeqlrT-lkp@intel.com>
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
CC: Ingo Molnar <mingo@kernel.org>

Hi Peter,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6e6cc1f78c772e952495b7416c9ac9029f9390c
commit: 2b5a0e425e6e319b1978db1e9564f6af4228a567 objtool/idle: Validate __cpuidle code as noinstr
date:   6 months ago
config: x86_64-buildonly-randconfig-r003-20230715 (https://download.01.org/0day-ci/archive/20230715/202307151342.oBLeqlrT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151342.oBLeqlrT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307151342.oBLeqlrT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: handle_bug+0x10: call to kmsan_unpoison_entry_regs() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x30: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0xc: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x2e: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter+0x37: call to lockdep_hardirqs_off() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit+0x5a: call to lockdep_hardirqs_on() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x56: call to lockdep_hardirqs_off() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x25: call to lockdep_hardirqs_on() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x5: call to current_set_polling_and_test() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x4e0: call to __kcsan_check_access() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpu_idle_poll+0x4d: call to test_ti_thread_flag() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x41: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x52: call to __this_cpu_preempt_check() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: acpi_idle_do_entry+0xa: call to perf_lopwr_cb() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_safe_halt+0x13: call to test_ti_thread_flag() leaves .noinstr.text section
   vmlinux.o: warning: objtool: io_idle+0x7: call to __inb() leaves .noinstr.text section


objdump-func vmlinux.o acpi_idle_do_entry:
0000 0000000000001040 <acpi_idle_do_entry>:
0000     1040:	55                   	push   %rbp
0001     1041:	48 89 e5             	mov    %rsp,%rbp
0004     1044:	41 56                	push   %r14
0006     1046:	53                   	push   %rbx
0007     1047:	49 89 fe             	mov    %rdi,%r14
000a     104a:	e8 00 00 00 00       	call   104f <acpi_idle_do_entry+0xf>	104b: R_X86_64_PLT32	.text+0x22d6e7c
000f     104f:	41 f6 c6 03          	test   $0x3,%r14b
0013     1053:	75 56                	jne    10ab <acpi_idle_do_entry+0x6b>
0015     1055:	49 8d 5e 08          	lea    0x8(%r14),%rbx
0019     1059:	f6 c3 03             	test   $0x3,%bl
001c     105c:	75 5e                	jne    10bc <acpi_idle_do_entry+0x7c>
001e     105e:	80 3b 01             	cmpb   $0x1,(%rbx)
0021     1061:	75 0a                	jne    106d <acpi_idle_do_entry+0x2d>
0023     1063:	4c 89 f7             	mov    %r14,%rdi
0026     1066:	e8 00 00 00 00       	call   106b <acpi_idle_do_entry+0x2b>	1067: R_X86_64_PLT32	acpi_processor_ffh_cstate_enter-0x4
002b     106b:	eb 2f                	jmp    109c <acpi_idle_do_entry+0x5c>
002d     106d:	41 f6 c6 03          	test   $0x3,%r14b
0031     1071:	75 5a                	jne    10cd <acpi_idle_do_entry+0x8d>
0033     1073:	f6 c3 03             	test   $0x3,%bl
0036     1076:	75 66                	jne    10de <acpi_idle_do_entry+0x9e>
0038     1078:	80 3b 02             	cmpb   $0x2,(%rbx)
003b     107b:	75 07                	jne    1084 <acpi_idle_do_entry+0x44>
003d     107d:	e8 be 00 00 00       	call   1140 <acpi_safe_halt>
0042     1082:	eb 18                	jmp    109c <acpi_idle_do_entry+0x5c>
0044     1084:	41 f6 c6 03          	test   $0x3,%r14b
0048     1088:	75 65                	jne    10ef <acpi_idle_do_entry+0xaf>
004a     108a:	49 83 c6 04          	add    $0x4,%r14
004e     108e:	41 f6 c6 03          	test   $0x3,%r14b
0052     1092:	75 6c                	jne    1100 <acpi_idle_do_entry+0xc0>
0054     1094:	41 8b 3e             	mov    (%r14),%edi
0057     1097:	e8 24 01 00 00       	call   11c0 <io_idle>
005c     109c:	e8 00 00 00 00       	call   10a1 <acpi_idle_do_entry+0x61>	109d: R_X86_64_PLT32	.text+0x22d6e7c
0061     10a1:	5b                   	pop    %rbx
0062     10a2:	41 5e                	pop    %r14
0064     10a4:	5d                   	pop    %rbp
0065     10a5:	31 ff                	xor    %edi,%edi
0067     10a7:	31 f6                	xor    %esi,%esi
0069     10a9:	c3                   	ret
006a     10aa:	cc                   	int3
006b     10ab:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10ae: R_X86_64_32S	.data+0xdb55f0
0072     10b2:	4c 89 f6             	mov    %r14,%rsi
0075     10b5:	e8 00 00 00 00       	call   10ba <acpi_idle_do_entry+0x7a>	10b6: R_X86_64_PLT32	__ubsan_handle_type_mismatch_v1-0x4
007a     10ba:	eb 99                	jmp    1055 <acpi_idle_do_entry+0x15>
007c     10bc:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10bf: R_X86_64_32S	.data+0xdb5610
0083     10c3:	48 89 de             	mov    %rbx,%rsi
0086     10c6:	e8 00 00 00 00       	call   10cb <acpi_idle_do_entry+0x8b>	10c7: R_X86_64_PLT32	__ubsan_handle_type_mismatch_v1-0x4
008b     10cb:	eb 91                	jmp    105e <acpi_idle_do_entry+0x1e>
008d     10cd:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10d0: R_X86_64_32S	.data+0xdb5630
0094     10d4:	4c 89 f6             	mov    %r14,%rsi
0097     10d7:	e8 00 00 00 00       	call   10dc <acpi_idle_do_entry+0x9c>	10d8: R_X86_64_PLT32	__ubsan_handle_type_mismatch_v1-0x4
009c     10dc:	eb 95                	jmp    1073 <acpi_idle_do_entry+0x33>
009e     10de:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10e1: R_X86_64_32S	.data+0xdb5650
00a5     10e5:	48 89 de             	mov    %rbx,%rsi
00a8     10e8:	e8 00 00 00 00       	call   10ed <acpi_idle_do_entry+0xad>	10e9: R_X86_64_PLT32	__ubsan_handle_type_mismatch_v1-0x4
00ad     10ed:	eb 89                	jmp    1078 <acpi_idle_do_entry+0x38>
00af     10ef:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	10f2: R_X86_64_32S	.data+0xdb5670
00b6     10f6:	4c 89 f6             	mov    %r14,%rsi
00b9     10f9:	e8 00 00 00 00       	call   10fe <acpi_idle_do_entry+0xbe>	10fa: R_X86_64_PLT32	__ubsan_handle_type_mismatch_v1-0x4
00be     10fe:	eb 8a                	jmp    108a <acpi_idle_do_entry+0x4a>
00c0     1100:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	1103: R_X86_64_32S	.data+0xdb5690
00c7     1107:	4c 89 f6             	mov    %r14,%rsi
00ca     110a:	e8 00 00 00 00       	call   110f <acpi_idle_do_entry+0xcf>	110b: R_X86_64_PLT32	__ubsan_handle_type_mismatch_v1-0x4
00cf     110f:	eb 83                	jmp    1094 <acpi_idle_do_entry+0x54>
00d1     1111:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00e0     1120:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00ef     112f:	66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00 	data16 data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
00fe     113e:	66 90                	xchg   %ax,%ax

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
