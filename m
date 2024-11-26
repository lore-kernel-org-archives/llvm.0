Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB21D45EF;
	Tue, 26 Nov 2024 18:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732646921; cv=none; b=ulJL4+/oVscn9dqrA1gAe0hUmbJyvmPCHj2ZQO5Yr+TiS838SEiu0EPQ9IrHDD7JzZ2G9IbubA94QMGLD+Td0zzbKyT+Go1XZov51XKBcehk3IDQrck+vWi/cqv0ExccxBMW3oXmSGcJKDQ+DHIax9fGDyq5fQqI3EiqrW5gDK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732646921; c=relaxed/simple;
	bh=pxtmZOZjtzSpuJm10lhPkElxKWG2fPJTKQDHSAiz+fg=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usv4JtLA4ufWjVdadVWzzR0li2OUJXLxhU8353hao6Ile6P+i9mXUrZhP3CjxG1x6nOHqQi0VlnOyRB1lqgavefd+DeeKi9Akva0SzXVEBH9IIGFTrpDmMAva4jMQYSWeB1h0QlB/5xaDJIc9hKPsIBqaBch6WtYNBBBdSa3cQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TX2RT/Z4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TX2RT/Z4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732646920; x=1764182920;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pxtmZOZjtzSpuJm10lhPkElxKWG2fPJTKQDHSAiz+fg=;
  b=TX2RT/Z4m1op5xLeFMbGa/5nbaba/Yh2etDbqCrAVGjcOJq8WLu8g9Yi
   U0x74Gba2asqcX2JkuHSnXSlJC5kjB3b1YZbiqfKYjlKUYHGbO0zwHmSO
   3BAwDjvtw1N/MW8TpCnDUXhDCcrvk6K59SqudQ3273GyAj9r1+wvw8Tq7
   twwX1Ys3mh3QGgSD24ZAsFWmTVmyZ3TN9TPRpnWujX+1INoifSrV5Tr2H
   qyYlbckU0Y1T6cCs02F5XN8H9xvxl3Tzvguh+19YRcM42hl2RfCNLv+Td
   pmSMmivr99mM3ZLUW2j7jJqRBFdf+BJ7SzfG95GicBIPkwikgZ2cgi2zn
   g==;
X-CSE-ConnectionGUID: p2V+R+q0RSiXpVJ0+8s5ag==
X-CSE-MsgGUID: bvGbPDj7QWW97p1x+7ys6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="32983782"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="32983782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 10:48:39 -0800
X-CSE-ConnectionGUID: +9BOkOZeTZeS0BTKqGWB9g==
X-CSE-MsgGUID: fITg8B3hSlqAnp3ZbDyWbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="114976239"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 10:48:38 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tG0bz-0007U3-2S;
	Tue, 26 Nov 2024 18:48:35 +0000
Date: Wed, 27 Nov 2024 02:48:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:static-key-noinstr 7/7] vmlinux.o: warning: objtool:
 pv_native_safe_halt+0x4: non-RO static key usage for 'mds_idle_clear' in
 noinstr
Message-ID: <202411270204.wdRRUi7n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-key-noinstr
head:   fac7e09eefcc90f2cb34afeb1d0c52bfd1f25857
commit: fac7e09eefcc90f2cb34afeb1d0c52bfd1f25857 [7/7] objtool: Add noinstr validation for static branches/calls
config: x86_64-randconfig-002-20241126 (https://download.01.org/0day-ci/archive/20241127/202411270204.wdRRUi7n-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411270204.wdRRUi7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411270204.wdRRUi7n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: adis16260_write_raw() falls through to next function __cfi_adxrs290_probe()
   vmlinux.o: warning: objtool: bmi160_setup_irq() falls through to next function __cfi_bmi160_data_rdy_trigger_set_state()
   vmlinux.o: warning: objtool: do_syscall_64+0x86: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_int80_emulation+0x3c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_fast_syscall_32+0x82: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __rdgsbase_inactive+0x39: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: __wrgsbase_inactive+0x40: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x92: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_kernel+0x1e8: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_debug+0x2b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x37: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x4b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x42: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x72: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: sched_clock_noinstr+0x8: non-RO static call usage for 'pv_sched_clock' in noinstr
   vmlinux.o: warning: objtool: do_machine_check+0x5b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_start+0x6b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0xc7: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: noist_exc_machine_check+0xd8: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x2e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: wait_for_cpus+0x33: call to ftrace_likely_update() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pv_native_safe_halt+0x4: non-RO static key usage for 'mds_idle_clear' in noinstr
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x91: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_page_fault+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0xf: non-RO static key usage for '__sched_clock_stable' in noinstr
   /bin/bash: line 1: 3655934 Segmentation fault      ./tools/objtool/objtool --hacks=jump_label --hacks=noinstr --ibt --cfi --mcount --mnop --retpoline --rethunk --stackval --static-call --uaccess --noinstr --link vmlinux.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
