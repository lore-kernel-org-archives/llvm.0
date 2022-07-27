Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D47EE
	for <llvm@lists.linux.dev>; Wed, 27 Jul 2022 01:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658884535; x=1690420535;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1pONrbfH11A9pU1/wlWLG7QoOU+rsJyx4mPlHJnr7E0=;
  b=kUs0ut4zXS44oT5mNKlT12KIA3s8wVIKuse8HeDvCVNVnWG047ZPsL9N
   e59MNJEk1tPeDI2bp8ZO/2a2kkg87KZGHIZnJay1k4+JyE7ZmIJwhKs5E
   TVBp2hjT6z7kXj2JQsEBXbNPpgr1u2FeGpFHQ39wgS3/PIuoeSMcfidU6
   HhaBVG8VR9hhEbkIC+HfLcb1FHSBOi/BsDMG/qIfD9C0VGW1htvGOUfMT
   1FsDXdkTJcCMxxcAfVC2K3BrC4esznGy65JLrmNWo4V/GD+ltBOzvh/8M
   r1MCb65QyfyqszXdEDl7btnGM7xS6JePngBIWjJnxdes8FsENSkQowyS4
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10420"; a="349817345"
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="349817345"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2022 18:15:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,194,1654585200"; 
   d="scan'208";a="927588085"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Jul 2022 18:15:33 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGVe8-00088m-1i;
	Wed, 27 Jul 2022 01:15:32 +0000
Date: Wed, 27 Jul 2022 09:14:55 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [peterz-queue:sched/idle 18/37] vmlinux.o: warning: objtool:
 intel_idle_ibrs+0x24: call to spec_ctrl_current() leaves .noinstr.text
 section
Message-ID: <202207270904.46UQZRh1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/idle
head:   84fd27c4b216dc4083d0a62c61d4c48205ad0a28
commit: 2f33657142b2ba7f7193734e5de4fc37c409b6f6 [18/37] objtool/idle: Validate __cpuidle code as noinstr
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220727/202207270904.46UQZRh1-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=2f33657142b2ba7f7193734e5de4fc37c409b6f6
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/idle
        git checkout 2f33657142b2ba7f7193734e5de4fc37c409b6f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_bad_iret+0x1e: call to memset() leaves .noinstr.text section
   vmlinux.o: warning: objtool: in_entry_stack+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x8: call to sev_es_nmi_complete() leaves .noinstr.text section
   vmlinux.o: warning: objtool: default_do_nmi+0x10: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_read_and_reset_apf_flags+0x1: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_on+0xa6: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: lockdep_hardirqs_off+0xa3: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x63: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x32: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter+0x43: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0x3d: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x1: call to current_set_polling_and_test() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0x9: call to __this_cpu_preempt_check() leaves .noinstr.text section
   vmlinux.o: warning: objtool: cpu_idle_poll+0x88: call to test_ti_thread_flag() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: intel_idle_ibrs+0x24: call to spec_ctrl_current() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_idle_do_entry+0x4: call to perf_lopwr_cb() leaves .noinstr.text section
   vmlinux.o: warning: objtool: acpi_safe_halt+0xf: call to test_ti_thread_flag() leaves .noinstr.text section
   vmlinux.o: warning: objtool: io_idle+0x3: call to __inb() leaves .noinstr.text section


objdump-func vmlinux.o intel_idle_ibrs:
0000 0000000000000fc0 <intel_idle_ibrs>:
0000      fc0:	55                   	push   %rbp
0001      fc1:	41 57                	push   %r15
0003      fc3:	41 56                	push   %r14
0005      fc5:	53                   	push   %rbx
0006      fc6:	89 d5                	mov    %edx,%ebp
0008      fc8:	48 89 f3             	mov    %rsi,%rbx
000b      fcb:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # fd2 <intel_idle_ibrs+0x12>	fce: R_X86_64_PC32	.bss+0xf29444
0012      fd2:	e9 42 02 00 00       	jmp    1219 <intel_idle_ibrs+0x259>
0017      fd7:	41 b7 01             	mov    $0x1,%r15b
001a      fda:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	fdd: R_X86_64_32S	.bss+0xf28e58
0021      fe1:	48 ff 00             	incq   (%rax)
0024      fe4:	e8 00 00 00 00       	call   fe9 <intel_idle_ibrs+0x29>	fe5: R_X86_64_PLT32	spec_ctrl_current-0x4
0029      fe9:	49 89 c6             	mov    %rax,%r14
002c      fec:	45 84 ff             	test   %r15b,%r15b
002f      fef:	74 0c                	je     ffd <intel_idle_ibrs+0x3d>
0031      ff1:	bf 48 00 00 00       	mov    $0x48,%edi
0036      ff6:	31 f6                	xor    %esi,%esi
0038      ff8:	e8 00 00 00 00       	call   ffd <intel_idle_ibrs+0x3d>	ff9: R_X86_64_PLT32	.text+0xd15cfc
003d      ffd:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1004 <intel_idle_ibrs+0x44>	1000: R_X86_64_PC32	.bss+0xf28ccc
0044     1004:	83 fd 0b             	cmp    $0xb,%ebp
0047     1007:	0f 83 f2 01 00 00    	jae    11ff <intel_idle_ibrs+0x23f>
004d     100d:	48 63 c5             	movslq %ebp,%rax
0050     1010:	48 6b c0 68          	imul   $0x68,%rax,%rax
0054     1014:	0f b6 74 03 5b       	movzbl 0x5b(%rbx,%rax,1),%esi
0059     1019:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1020 <intel_idle_ibrs+0x60>	101c: R_X86_64_PC32	.bss+0xf28cec
0060     1020:	e9 00 00 00 00       	jmp    1025 <intel_idle_ibrs+0x65>	1021: R_X86_64_PLT32	.altinstr_aux+0xd8e
0065     1025:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 102c <intel_idle_ibrs+0x6c>	1028: R_X86_64_PC32	.bss+0xf28d4c
006c     102c:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1033 <intel_idle_ibrs+0x73>	102f: R_X86_64_PC32	.bss+0xf28d54
0073     1033:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 103a <intel_idle_ibrs+0x7a>	1036: R_X86_64_PC32	.bss+0xf28d0c
007a     103a:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	103d: R_X86_64_32S	.bss+0xf28d60
0081     1041:	e9 00 00 00 00       	jmp    1046 <intel_idle_ibrs+0x86>	1042: R_X86_64_PLT32	.altinstr_aux+0xda0
0086     1046:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 104d <intel_idle_ibrs+0x8d>	1049: R_X86_64_PC32	.bss+0xf28d4c
008d     104d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1054 <intel_idle_ibrs+0x94>	1050: R_X86_64_PC32	.bss+0xf28d54
0094     1054:	0f ae f0             	mfence 
0097     1057:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 105e <intel_idle_ibrs+0x9e>	105a: R_X86_64_PC32	.bss+0xf28d74
009e     105e:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1065 <intel_idle_ibrs+0xa5>	1061: R_X86_64_PC32	.bss+0xf28d6c
00a5     1065:	65 48 8b 05 00 00 00 00 	mov    %gs:0x0(%rip),%rax        # 106d <intel_idle_ibrs+0xad>	1069: R_X86_64_PC32	current_task-0x4
00ad     106d:	0f ae 38             	clflush (%rax)
00b0     1070:	0f ae f0             	mfence 
00b3     1073:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	1076: R_X86_64_32S	.bss+0xf28d30
00ba     107a:	48 ff 00             	incq   (%rax)
00bd     107d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1084 <intel_idle_ibrs+0xc4>	1080: R_X86_64_PC32	.bss+0xf28d74
00c4     1084:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 108b <intel_idle_ibrs+0xcb>	1087: R_X86_64_PC32	.bss+0xf28d7c
00cb     108b:	65 48 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%rdi        # 1093 <intel_idle_ibrs+0xd3>	108f: R_X86_64_PC32	current_task-0x4
00d3     1093:	48 89 f8             	mov    %rdi,%rax
00d6     1096:	31 c9                	xor    %ecx,%ecx
00d8     1098:	31 d2                	xor    %edx,%edx
00da     109a:	0f 01 c8             	monitor %rax,%ecx,%edx
00dd     109d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10a4 <intel_idle_ibrs+0xe4>	10a0: R_X86_64_PC32	.bss+0xf28d84
00e4     10a4:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10ab <intel_idle_ibrs+0xeb>	10a7: R_X86_64_PC32	.bss+0xf28dac
00eb     10ab:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 10b2 <intel_idle_ibrs+0xf2>	10ae: R_X86_64_PC32	.bss+0xf28d74
00f2     10b2:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10b9 <intel_idle_ibrs+0xf9>	10b5: R_X86_64_PC32	.bss+0xf28e2c
00f9     10b9:	48 ff c0             	inc    %rax
00fc     10bc:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10c3 <intel_idle_ibrs+0x103>	10bf: R_X86_64_PC32	.bss+0xf28e3c
0103     10c3:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 10ca <intel_idle_ibrs+0x10a>	10c6: R_X86_64_PC32	.bss+0xf28d74
010a     10ca:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10d1 <intel_idle_ibrs+0x111>	10cd: R_X86_64_PC32	.bss+0xf28e1c
0111     10d1:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 10d8 <intel_idle_ibrs+0x118>	10d4: R_X86_64_PC32	.bss+0xf28e14
0118     10d8:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10df <intel_idle_ibrs+0x11f>	10db: R_X86_64_PC32	.bss+0xf28bbc
011f     10df:	48 ff c1             	inc    %rcx
0122     10e2:	48 89 0d 00 00 00 00 	mov    %rcx,0x0(%rip)        # 10e9 <intel_idle_ibrs+0x129>	10e5: R_X86_64_PC32	.bss+0xf28e14
0129     10e9:	48 f7 07 08 00 00 00 	testq  $0x8,(%rdi)
0130     10f0:	75 4f                	jne    1141 <intel_idle_ibrs+0x181>
0132     10f2:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 10f9 <intel_idle_ibrs+0x139>	10f5: R_X86_64_PC32	.bss+0xf28d34
0139     10f9:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1100 <intel_idle_ibrs+0x140>	10fc: R_X86_64_PC32	.bss+0xf28d8c
0140     1100:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1107 <intel_idle_ibrs+0x147>	1103: R_X86_64_PC32	.bss+0xf28e44
0147     1107:	e9 c6 01 00 00       	jmp    12d2 <intel_idle_ibrs+0x312>
014c     110c:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1113 <intel_idle_ibrs+0x153>	110f: R_X86_64_PC32	.bss+0xf28e54
0153     1113:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 111a <intel_idle_ibrs+0x15a>	1116: R_X86_64_PC32	.bss+0xf28e4c
015a     111a:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1121 <intel_idle_ibrs+0x161>	111d: R_X86_64_PC32	.bss+0xf28e64
0161     1121:	0f 00 2d 00 00 00 00 	verw   0x0(%rip)        # 1128 <intel_idle_ibrs+0x168>	1124: R_X86_64_PC32	.rodata+0x6eb760
0168     1128:	b9 01 00 00 00       	mov    $0x1,%ecx
016d     112d:	48 89 f0             	mov    %rsi,%rax
0170     1130:	0f 01 c9             	mwait  %eax,%ecx
0173     1133:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 113a <intel_idle_ibrs+0x17a>	1136: R_X86_64_PC32	.bss+0xf28d74
017a     113a:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 1141 <intel_idle_ibrs+0x181>	113d: R_X86_64_PC32	.bss+0xf28e14
0181     1141:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1148 <intel_idle_ibrs+0x188>	1144: R_X86_64_PC32	.bss+0xf28e6c
0188     1148:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 114f <intel_idle_ibrs+0x18f>	114b: R_X86_64_PC32	.bss+0xf28e7c
018f     114f:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1156 <intel_idle_ibrs+0x196>	1152: R_X86_64_PC32	.bss+0xf28e84
0196     1156:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 115d <intel_idle_ibrs+0x19d>	1159: R_X86_64_PC32	.bss+0xf28dcc
019d     115d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1164 <intel_idle_ibrs+0x1a4>	1160: R_X86_64_PC32	.bss+0xf28e0c
01a4     1164:	48 ff c0             	inc    %rax
01a7     1167:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 116e <intel_idle_ibrs+0x1ae>	116a: R_X86_64_PC32	.bss+0xf28d74
01ae     116e:	48 ff c1             	inc    %rcx
01b1     1171:	48 89 0d 00 00 00 00 	mov    %rcx,0x0(%rip)        # 1178 <intel_idle_ibrs+0x1b8>	1174: R_X86_64_PC32	.bss+0xf28e14
01b8     1178:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 117f <intel_idle_ibrs+0x1bf>	117b: R_X86_64_PC32	.bss+0xf28e8c
01bf     117f:	f0 80 67 02 df       	lock andb $0xdf,0x2(%rdi)
01c4     1184:	f0 83 44 24 fc 00    	lock addl $0x0,-0x4(%rsp)
01ca     118a:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1191 <intel_idle_ibrs+0x1d1>	118d: R_X86_64_PC32	.bss+0xf28d94
01d1     1191:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1198 <intel_idle_ibrs+0x1d8>	1194: R_X86_64_PC32	.bss+0xf28d74
01d8     1198:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 119f <intel_idle_ibrs+0x1df>	119b: R_X86_64_PC32	.bss+0xf28dac
01df     119f:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 11a6 <intel_idle_ibrs+0x1e6>	11a2: R_X86_64_PC32	.bss+0xf28e2c
01e6     11a6:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 11ad <intel_idle_ibrs+0x1ed>	11a9: R_X86_64_PC32	.bss+0xf28e3c
01ed     11ad:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 11b4 <intel_idle_ibrs+0x1f4>	11b0: R_X86_64_PC32	.bss+0xf28e14
01f4     11b4:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 11bb <intel_idle_ibrs+0x1fb>	11b7: R_X86_64_PC32	.bss+0xf28e1c
01fb     11bb:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 11c2 <intel_idle_ibrs+0x202>	11be: R_X86_64_PC32	.bss+0xf28bbc
0202     11c2:	48 f7 07 08 00 00 00 	testq  $0x8,(%rdi)
0209     11c9:	74 19                	je     11e4 <intel_idle_ibrs+0x224>
020b     11cb:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 11d2 <intel_idle_ibrs+0x212>	11ce: R_X86_64_PC32	.bss+0xf28d9c
0212     11d2:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 11d9 <intel_idle_ibrs+0x219>	11d5: R_X86_64_PC32	.bss+0xf28e74
0219     11d9:	65 81 25 00 00 00 00 ff ff ff 7f 	andl   $0x7fffffff,%gs:0x0(%rip)        # 11e4 <intel_idle_ibrs+0x224>	11dc: R_X86_64_PC32	__preempt_count-0x8
0224     11e4:	45 84 ff             	test   %r15b,%r15b
0227     11e7:	74 0d                	je     11f6 <intel_idle_ibrs+0x236>
0229     11e9:	bf 48 00 00 00       	mov    $0x48,%edi
022e     11ee:	4c 89 f6             	mov    %r14,%rsi
0231     11f1:	e8 00 00 00 00       	call   11f6 <intel_idle_ibrs+0x236>	11f2: R_X86_64_PLT32	.text+0xd15cfc
0236     11f6:	89 e8                	mov    %ebp,%eax
0238     11f8:	5b                   	pop    %rbx
0239     11f9:	41 5e                	pop    %r14
023b     11fb:	41 5f                	pop    %r15
023d     11fd:	5d                   	pop    %rbp
023e     11fe:	c3                   	ret    
023f     11ff:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1206 <intel_idle_ibrs+0x246>	1202: R_X86_64_PC32	.bss+0xf28cd4
0246     1206:	89 ee                	mov    %ebp,%esi
0248     1208:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi	120b: R_X86_64_32S	.data+0x5282b0
024f     120f:	e8 00 00 00 00       	call   1214 <intel_idle_ibrs+0x254>	1210: R_X86_64_PLT32	__ubsan_handle_out_of_bounds-0x4
0254     1214:	e9 f4 fd ff ff       	jmp    100d <intel_idle_ibrs+0x4d>
0259     1219:	48 c7 c0 00 00 00 00 	mov    $0x0,%rax	121c: R_X86_64_32S	.bss+0xf28e60
0260     1220:	45 31 ff             	xor    %r15d,%r15d
0263     1223:	e9 b9 fd ff ff       	jmp    fe1 <intel_idle_ibrs+0x21>
0268     1228:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 122f <intel_idle_ibrs+0x26f>	122b: R_X86_64_PC32	.bss+0xf28d5c
026f     122f:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1236 <intel_idle_ibrs+0x276>	1232: R_X86_64_PC32	.bss+0xf28da4
0276     1236:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 123d <intel_idle_ibrs+0x27d>	1239: R_X86_64_PC32	.bss+0xf28d74
027d     123d:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1244 <intel_idle_ibrs+0x284>	1240: R_X86_64_PC32	.bss+0xf28db4
0284     1244:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 124b <intel_idle_ibrs+0x28b>	1247: R_X86_64_PC32	.bss+0xf28dbc
028b     124b:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1252 <intel_idle_ibrs+0x292>	124e: R_X86_64_PC32	.bss+0xf28dcc
0292     1252:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1259 <intel_idle_ibrs+0x299>	1255: R_X86_64_PC32	.bss+0xf28e0c
0299     1259:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1260 <intel_idle_ibrs+0x2a0>	125c: R_X86_64_PC32	.bss+0xf28e14
02a0     1260:	65 48 8b 3d 00 00 00 00 	mov    %gs:0x0(%rip),%rdi        # 1268 <intel_idle_ibrs+0x2a8>	1264: R_X86_64_PC32	current_task-0x4
02a8     1268:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 126f <intel_idle_ibrs+0x2af>	126b: R_X86_64_PC32	.bss+0xf28dec
02af     126f:	f0 80 4f 02 20       	lock orb $0x20,0x2(%rdi)
02b4     1274:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 127b <intel_idle_ibrs+0x2bb>	1277: R_X86_64_PC32	.bss+0xf28d64
02bb     127b:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1282 <intel_idle_ibrs+0x2c2>	127e: R_X86_64_PC32	.bss+0xf28dac
02c2     1282:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 1289 <intel_idle_ibrs+0x2c9>	1285: R_X86_64_PC32	.bss+0xf28d74
02c9     1289:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 1290 <intel_idle_ibrs+0x2d0>	128c: R_X86_64_PC32	.bss+0xf28e2c
02d0     1290:	48 ff c0             	inc    %rax
02d3     1293:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 129a <intel_idle_ibrs+0x2da>	1296: R_X86_64_PC32	.bss+0xf28e3c
02da     129a:	48 89 05 00 00 00 00 	mov    %rax,0x0(%rip)        # 12a1 <intel_idle_ibrs+0x2e1>	129d: R_X86_64_PC32	.bss+0xf28d74
02e1     12a1:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 12a8 <intel_idle_ibrs+0x2e8>	12a4: R_X86_64_PC32	.bss+0xf28e1c
02e8     12a8:	48 8b 0d 00 00 00 00 	mov    0x0(%rip),%rcx        # 12af <intel_idle_ibrs+0x2ef>	12ab: R_X86_64_PC32	.bss+0xf28e14
02ef     12af:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 12b6 <intel_idle_ibrs+0x2f6>	12b2: R_X86_64_PC32	.bss+0xf28bbc
02f6     12b6:	48 ff c1             	inc    %rcx
02f9     12b9:	48 89 0d 00 00 00 00 	mov    %rcx,0x0(%rip)        # 12c0 <intel_idle_ibrs+0x300>	12bc: R_X86_64_PC32	.bss+0xf28e14
0300     12c0:	48 f7 07 08 00 00 00 	testq  $0x8,(%rdi)
0307     12c7:	0f 84 66 fd ff ff    	je     1033 <intel_idle_ibrs+0x73>
030d     12cd:	e9 6f fe ff ff       	jmp    1141 <intel_idle_ibrs+0x181>
0312     12d2:	48 ff 05 00 00 00 00 	incq   0x0(%rip)        # 12d9 <intel_idle_ibrs+0x319>	12d5: R_X86_64_PC32	.bss+0xf28e5c
0319     12d9:	e9 4a fe ff ff       	jmp    1128 <intel_idle_ibrs+0x168>
031e     12de:	cc                   	int3   
031f     12df:	cc                   	int3   
0320     12e0:	cc                   	int3   
0321     12e1:	cc                   	int3   
0322     12e2:	cc                   	int3   
0323     12e3:	cc                   	int3   
0324     12e4:	cc                   	int3   
0325     12e5:	cc                   	int3   
0326     12e6:	cc                   	int3   
0327     12e7:	cc                   	int3   
0328     12e8:	cc                   	int3   
0329     12e9:	cc                   	int3   
032a     12ea:	cc                   	int3   
032b     12eb:	cc                   	int3   
032c     12ec:	cc                   	int3   
032d     12ed:	cc                   	int3   
032e     12ee:	cc                   	int3   
032f     12ef:	cc                   	int3   
0330     12f0:	cc                   	int3   
0331     12f1:	cc                   	int3   
0332     12f2:	cc                   	int3   
0333     12f3:	cc                   	int3   
0334     12f4:	cc                   	int3   
0335     12f5:	cc                   	int3   
0336     12f6:	cc                   	int3   
0337     12f7:	cc                   	int3   
0338     12f8:	cc                   	int3   
0339     12f9:	cc                   	int3   
033a     12fa:	cc                   	int3   
033b     12fb:	cc                   	int3   
033c     12fc:	cc                   	int3   
033d     12fd:	cc                   	int3   
033e     12fe:	cc                   	int3   
033f     12ff:	cc                   	int3   

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
