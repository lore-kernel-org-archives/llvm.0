Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B3B15B547;
	Mon,  9 Dec 2024 04:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719166; cv=none; b=Coirzybf+MXrj44LlCXk+rcmeSGUGhAyFZuB7QQ6QnC1heLZpfsC1/p61ZR3RwHDb4xR1uDNVkN4fccvKRd7jml+WkLmnxoJteUSQ8xzGghVlUsxcEZK23k+a/u9BFY4oFq/QfpLRFogHCUF1cxqISpzidl1N7n1QKvJk75dSn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719166; c=relaxed/simple;
	bh=u9uFMSGKz6v4FiB2/Gc0kugu2qngY/1NXPUGh60TrOY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bZXb5BCIy0xgzbXXinikCXK5rDL846mJfeJa4Yoa6pSpnnt+jgz1BicPiUQsPyl7dn4LpgOIbGcVCKUdWRF4C4GwNVnme8VuN3Gxyfwybf0eoJNnotjU2wQJgm5aWYeV4rbRmH2dciv7+T0oHX5SZYakvbiV7Lo7aOLAmiLRMHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aajmMX8D; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aajmMX8D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719165; x=1765255165;
  h=date:from:cc:subject:message-id:mime-version;
  bh=u9uFMSGKz6v4FiB2/Gc0kugu2qngY/1NXPUGh60TrOY=;
  b=aajmMX8Dn3hvZAUTFeYBNYMy2CrQ/ikhjE/114ezU8SXTr7SHelr8CZG
   MNA2Lng4Xl54+1jodtu1vCuW8emT2niS/Hhd2OB/hSbLzttYvdtI7zWDp
   io8YgJDt9xpRAWpWOeAdwwlUmR5uCmxn080tejU7nyZhMBSyN5dwzkoHo
   6JfR12HQzWl/ZLKh39spMgL4HChaKBnu4aoaQF9+Fact6bqolE1oLuVt0
   PND23UrPTTIo10EXtIOJlgPEyZqKV0t/7wVrF1JHnE1jiuLZ2a8hS8vX0
   3NxNtBb+1qF3ediEFIQE1vxNnbqlMfomQO0tFW6DE9bI062G+uBgio7ER
   A==;
X-CSE-ConnectionGUID: COjXbrKkTX2Q/ii9tdw7Cw==
X-CSE-MsgGUID: vfJeNwYER9yLHBTObIM8yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37931422"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37931422"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:39:24 -0800
X-CSE-ConnectionGUID: iGcNUY2EQeeljzwZHkMYUA==
X-CSE-MsgGUID: +JZgYKLIRcSiCv5o8VyLTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95751894"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Dec 2024 20:39:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVYH-0003tJ-0U;
	Mon, 09 Dec 2024 04:39:21 +0000
Date: Mon, 9 Dec 2024 12:38:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: do_cpuid_func+0x1c24: undefined stack
 state
Message-ID: <202412081047.pC57MmBr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7503345ac5f5e82fd9a36d6e6b447c016376403a
commit: 9ee62c33c0fe017ee02501a877f6f562363122fa KVM: x86: Break CONFIG_KVM_X86's direct dependency on KVM_INTEL || KVM_AMD
date:   3 weeks ago
config: x86_64-buildonly-randconfig-005-20241208 (https://download.01.org/0day-ci/archive/20241208/202412081047.pC57MmBr-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412081047.pC57MmBr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412081047.pC57MmBr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: do_cpuid_func+0x1c24: undefined stack state
   vmlinux.o: warning: objtool: ___bpf_prog_run+0x1ac: sibling call from callable instruction with modified stack frame
   vmlinux.o: warning: objtool: do_syscall_64+0x3f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: kvm_spurious_fault+0x1c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: fixup_bad_iret+0x7c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_debug_user+0x2a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_nmi+0x1a: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: poke_int3_handler+0x3b: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: native_sched_clock+0x68: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check+0x4c: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: exc_machine_check+0x66: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mce_check_crashing_cpu+0x10: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: pvclock_clocksource_read_nowd+0x76: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: local_clock_noinstr+0x5f: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x32: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x3e: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x29: call to ftrace_likely_update() leaves .noinstr.text section
   vmlinux.o: warning: objtool: mwait_idle+0x2b: call to ftrace_likely_update() leaves .noinstr.text section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
