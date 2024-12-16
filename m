Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E324414;
	Mon, 16 Dec 2024 00:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734308446; cv=none; b=nGobkQ5s1uNvaID0t3peCdrTxg7/eQ0Ll7KEjWKEHqd8sA56fi4Gzdjm6WeCAYyMzRMbrMxKA8teMyoq5Gy/3V2WTFkeFqB3HhWsAjUQhlvxYdcSOeqTdI/RZk9rjyJd/TzW+iGP3rECKSM51BxzkF/xAx/yn7VTJW4+0aUw8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734308446; c=relaxed/simple;
	bh=qc8sI1l/6cVUfDOKysNR7JWIPjGQ4BmYdQiJJHvCcfE=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kL2PxMo5CkbWtuQda7QerbqmUDosX1awLrdA7oxcEemsc9Sm3m6d/h0cbqq9/E75brEYdSZk7KXXOnodzjj3LIJLjIh1m8RHch78I8JQzC9CkWXaNAFKKeW7/RL0MX6RCI7uNlyzif2iBDWRYn8Vt38hHW+8gS1jLYBvU7B3htE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EliW7lxW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EliW7lxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734308444; x=1765844444;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qc8sI1l/6cVUfDOKysNR7JWIPjGQ4BmYdQiJJHvCcfE=;
  b=EliW7lxWj6Z9/EFxRihPC6EASjF48y/uk1JaNd8C4LxPcgxLAJ2923oT
   6k9q0pE2DVWZvoJgN0ofRvqjgrYLvZfMvp3vgnDR1PcR7CvwZ9MAQsA/c
   Qhhss/s8r/BeQjSrMoHGTQXxgA3+trWr8TkK+PKZs/eNanE0Gp3PbQqcW
   MpyMO9dJ6uG+IVAfJhQfCXw3rXRAhx0t2sNChL69FTU6ZiMObJ34Tlaos
   dpEECToo/1bFYOvOMnIrjC1LmJ/2nHWKsSzojolBhg6pEswijuuDPR+37
   /5rzySMQfbML7XBJJSwWi6AXVHMsqmfxs5GgTVNU3qPGjkcy4dkDRKVC9
   Q==;
X-CSE-ConnectionGUID: pc6LgavKR8u+kVP08kHIlw==
X-CSE-MsgGUID: k7OgkF4OROaDo9hzVsvXdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="60071317"
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="60071317"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2024 16:20:44 -0800
X-CSE-ConnectionGUID: Arl8sBLRT8mStzKstn4SLg==
X-CSE-MsgGUID: I/QMqb9eR8OplyNTkuV34g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,237,1728975600"; 
   d="scan'208";a="97589068"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Dec 2024 16:20:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMyqm-000DuU-1n;
	Mon, 16 Dec 2024 00:20:40 +0000
Date: Mon, 16 Dec 2024 08:20:03 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [jpoimboe:static-key-noinstr 3/3] vmlinux.o: warning: objtool:
 vmx_update_host_rsp+0x27: __kvm_is_using_evmcs: non-RO static key usage in
 noinstr
Message-ID: <202412160853.H0ep2D3A-lkp@intel.com>
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
head:   59b1dc64303468b5c81a6197d9865b6e08046c94
commit: 59b1dc64303468b5c81a6197d9865b6e08046c94 [3/3] objtool: Add noinstr validation for static branches/calls
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241216/202412160853.H0ep2D3A-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241216/202412160853.H0ep2D3A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412160853.H0ep2D3A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: nvmet_ctrl_state_show() falls through to next function __cfi_nvmet_ctrl_host_traddr_open()
   vmlinux.o: warning: objtool: tw28_set_ctrl_val() falls through to next function __cfi_tw28_get_ctrl_val()
>> vmlinux.o: warning: objtool: vmx_update_host_rsp+0x27: __kvm_is_using_evmcs: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: vmx_vcpu_enter_exit+0x18a: __kvm_is_using_evmcs: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: vmx_l1d_flush+0x7: vmx_l1d_flush_cond: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: exc_nmi+0x2b6: microcode_nmi_handler_enable: non-RO static key usage in noinstr
>> vmlinux.o: warning: objtool: fred_exc_nmi+0x89: microcode_nmi_handler_enable: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: sched_clock_noinstr+0x4: pv_sched_clock: non-RO static call usage in noinstr
>> vmlinux.o: warning: objtool: pv_native_safe_halt+0x4: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: local_clock_noinstr+0x5: __sched_clock_stable: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: arch_cpu_idle+0x4: x86_idle: non-RO static call usage in noinstr
   vmlinux.o: warning: objtool: mwait_idle+0x45: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: acpi_processor_ffh_cstate_enter+0xc0: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: intel_idle+0x62: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: intel_idle_s2idle+0x73: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: intel_idle_xstate+0x6b: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: intel_idle_ibrs+0x9c: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: intel_idle_irq+0x62: mds_idle_clear: non-RO static key usage in noinstr
   vmlinux.o: warning: objtool: acpi_idle_do_entry+0x9: perf_lopwr_cb: non-RO static call usage in noinstr

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
