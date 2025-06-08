Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28848CA5A;
	Sun,  8 Jun 2025 03:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749355100; cv=none; b=pfSuufCF1oiKzpB6C33eYLbuGwF+75Xa5Or2iC8UwMEu8WVjs3nYG90xapny3+11t0OcZX8pAm5R+v6VwmWpmy3mxZIle6HRqkpa9EXRvAie0GNlMX7R4tKMdU+fZY4h0UobMnDk3SC7B4kcnvJfPmRsZHYCT0KjiK5ch8naTE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749355100; c=relaxed/simple;
	bh=PInxxN2Up7nqTaB6cQMm0LVMwOpZMHT2Hv7BlPX7VCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCs4Cn0WXr0snL87CEs03A+X6AHnUeKay6+OGtKkTi3DMb2VdhDstLgEW0tzoO0N2+Rz0cfD5D6T36CyDfn+7JLz255z3RwnphDsTSoOV9/i3tAKAIpEud/p7mukJAlroh/VNbOiqLFh0RNhC5Cn9ZBwrtL4AsNbfZKL82s8MCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PitN+Xno; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PitN+Xno"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749355098; x=1780891098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PInxxN2Up7nqTaB6cQMm0LVMwOpZMHT2Hv7BlPX7VCA=;
  b=PitN+Xnogns9z+p3U6R30Rm/0FQrcd/V8F3uZKgAy8+W7OI1A6E9pKmk
   7TnygCY517fXPxbzoS2gR+Hrd5BEqO1/Hl5Wqz+rn7BnBpew0HJyQJBQQ
   Y2N4XZO2IZwEMZkyROXGcv7vTk0dEmBhODDRAbJG+T+k5TInRBueA9m5P
   RMLTBWAiXoBNPRc5HSDvDBtSRqk/1VlhM9W5Eaue3J0akJs04caDaMr1+
   bI0LgYXrv+2NuxcBoLvubXEa/hI1ySgJrwYo9i4q0SQfHwNpD3wGxajy3
   nK4fjzazEdXaOgXC4L1679hHD4BPmv0xFPUbPsoMHd5ajKJNNbdC3GseN
   A==;
X-CSE-ConnectionGUID: y1RbdfLgR+i0Nl9Ip7EHyA==
X-CSE-MsgGUID: IFFXZdC6SeCWrvF4bwysCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="54093946"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="54093946"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 20:58:15 -0700
X-CSE-ConnectionGUID: c2sj0iqtQP2I911SyGH+JQ==
X-CSE-MsgGUID: at918i/GT9Sx+f3ushhWtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="146113495"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Jun 2025 20:58:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO7Ai-0006BP-1E;
	Sun, 08 Jun 2025 03:58:12 +0000
Date: Sun, 8 Jun 2025 11:57:36 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [trace:sorttable/core 2/3] warning: tracepoint 'pelt_hw_tp' is
 unused.
Message-ID: <202506081104.qw9HfZkV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace sorttable/core
head:   6ff69a9fcc809b9fe23a55e798f1d8fa96cd618c
commit: 2c3b6203399993766be7756222c812e1b63e84f2 [2/3] tracing: sorttable: Add a tracepoint verification check at build time
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250608/202506081104.qw9HfZkV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081104.qw9HfZkV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506081104.qw9HfZkV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: tracepoint 'pelt_hw_tp' is unused.
>> warning: tracepoint 'pelt_irq_tp' is unused.
>> warning: tracepoint 'ipi_raise' is unused.
>> warning: tracepoint 'ipi_entry' is unused.
>> warning: tracepoint 'ipi_exit' is unused.
>> warning: tracepoint 'alarmtimer_suspend' is unused.
>> warning: tracepoint 'ftrace_test_filter' is unused.
>> warning: tracepoint 'cpu_idle_miss' is unused.
>> warning: tracepoint 'psci_domain_idle_enter' is unused.
>> warning: tracepoint 'psci_domain_idle_exit' is unused.
>> warning: tracepoint 'powernv_throttle' is unused.
>> warning: tracepoint 'pstate_sample' is unused.
>> warning: tracepoint 'cpu_frequency' is unused.
>> warning: tracepoint 'cpu_frequency_limits' is unused.
>> warning: tracepoint 'device_pm_callback_start' is unused.
>> warning: tracepoint 'device_pm_callback_end' is unused.
>> warning: tracepoint 'wakeup_source_activate' is unused.
>> warning: tracepoint 'wakeup_source_deactivate' is unused.
>> warning: tracepoint 'clock_enable' is unused.
>> warning: tracepoint 'clock_disable' is unused.
   warning: tracepoint 'clock_set_rate' is unused.
   warning: tracepoint 'power_domain_target' is unused.
   warning: tracepoint 'pm_qos_add_request' is unused.
   warning: tracepoint 'pm_qos_update_request' is unused.
   warning: tracepoint 'pm_qos_remove_request' is unused.
   warning: tracepoint 'dev_pm_qos_add_request' is unused.
   warning: tracepoint 'dev_pm_qos_update_request' is unused.
   warning: tracepoint 'dev_pm_qos_remove_request' is unused.
   warning: tracepoint 'guest_halt_poll_ns' is unused.
   warning: tracepoint 'xdp_bulk_tx' is unused.
   warning: tracepoint 'xdp_redirect_map' is unused.
   warning: tracepoint 'xdp_redirect_map_err' is unused.
   warning: tracepoint 'vma_mas_szero' is unused.
   warning: tracepoint 'vma_store' is unused.
   warning: tracepoint 'tlb_flush' is unused.
   warning: tracepoint 'hugepage_set_pmd' is unused.
   warning: tracepoint 'hugepage_set_pud' is unused.
   warning: tracepoint 'hugepage_update_pmd' is unused.
   warning: tracepoint 'hugepage_update_pud' is unused.
   warning: tracepoint 'set_migration_pmd' is unused.
   warning: tracepoint 'remove_migration_pmd' is unused.
   warning: tracepoint 'block_rq_remap' is unused.
   warning: tracepoint 'dma_fence_emit' is unused.
   warning: tracepoint 'thermal_power_cpu_get_power_simple' is unused.
   warning: tracepoint 'thermal_power_cpu_limit' is unused.
   warning: tracepoint 'mc_event' is unused.
   warning: tracepoint 'binder_lock' is unused.
   warning: tracepoint 'binder_locked' is unused.
   warning: tracepoint 'binder_unlock' is unused.
   warning: tracepoint 'tcp_ao_wrong_maclen' is unused.
   warning: tracepoint 'tcp_ao_mismatch' is unused.
   warning: tracepoint 'tcp_ao_key_not_found' is unused.
   warning: tracepoint 'tcp_ao_rnext_request' is unused.
   warning: tracepoint 'tcp_ao_synack_no_key' is unused.
   warning: tracepoint 'tcp_ao_snd_sne_update' is unused.
   warning: tracepoint 'tcp_ao_rcv_sne_update' is unused.
   warning: tracepoint 'br_fdb_add' is unused.
   warning: tracepoint 'br_fdb_external_learn_add' is unused.
   warning: tracepoint 'fdb_delete' is unused.
   warning: tracepoint 'br_fdb_update' is unused.
   warning: tracepoint 'br_mdb_full' is unused.
   warning: tracepoint 'devlink_hwmsg' is unused.
   warning: tracepoint 'devlink_hwerr' is unused.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
