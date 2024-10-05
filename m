Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5BD15380A;
	Sat,  5 Oct 2024 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728135554; cv=none; b=hLZ1gSIysphKc7OI0UHRxdZBpT09dUloB9JHZraesAebq2N0fsm3wXBXQpByC9GI8v55xUmpYeKNmF0k7vHH5Zcg7fUJG7+xVcfuSd9b0d1ijz4AtnMGHX7MDumF+dqd82cgy3KpgV8hC54s+YM0+4mm8ZTAEHnTUSBOZ1WXmE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728135554; c=relaxed/simple;
	bh=wvBYdbAv4JCMJXqjZLVYuGsJ4QBjOMkizB4xZ3jVYeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JPvl4283tnczeO/Crzn3enjMMJdCydom9OZVy0K2BOJZPndzShAdxg6iRYoxPEzfBjphUGvf+EZqodSQUAzIXSdd6goz62U8vzZFwcXkVzOsNGWe9Mhhh1UV278PrvpyQJXof+MmAvz8eQi0QLirpmqt3Np3cTepbb8/O2fvjRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RG91HPiX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RG91HPiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728135552; x=1759671552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wvBYdbAv4JCMJXqjZLVYuGsJ4QBjOMkizB4xZ3jVYeM=;
  b=RG91HPiXuWMuf0A1uGLCU6u6/EO8WcjTrWuc7gT2u6AFLxobQkKzwy5R
   +xeHrak0UqPRlrWxX9hRdxZAMwyXGba+fTiVGjRy7MFYWR1t8X0Y7cphS
   ydye8uztrkM8sljjgL20dVRHJPD+AO8BHj8wt5P1egh0f+BQ2yMqC2Aa+
   HNVEGwoaWCgfrq4jGfNX5bgddwrb1KZc8NwxPIAPqKZ88h5zS5HZo0DGM
   U+gYM+v6rKW1JqG8XO/Ea0ZE0L268N3u/qP5vCxZOUqrIK93OsGMxIlyq
   om5BmDH6jgcQ9YzEdT+Bi1MPG1AYLn7t2IruO2pmgPcPRlSo2o5FQWLUm
   Q==;
X-CSE-ConnectionGUID: 8/JSqaS/RYqMhsoe3iEhNQ==
X-CSE-MsgGUID: cUHtkrgdQamUoUxm+UXRug==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="38474232"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="38474232"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 06:39:12 -0700
X-CSE-ConnectionGUID: tgm2V/FvRLeatBTxlvo1HA==
X-CSE-MsgGUID: Uw72Oe2qSpGC6/KKYC2uXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="112456154"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Oct 2024 06:39:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx4zz-0002yu-2w;
	Sat, 05 Oct 2024 13:39:07 +0000
Date: Sat, 5 Oct 2024 21:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Ryabinin <arbn@yandex-team.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the
 kstate's migration stream
Message-ID: <202410052140.hHx7eFfO-lkp@intel.com>
References: <20241002160722.20025-3-arbn@yandex-team.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002160722.20025-3-arbn@yandex-team.com>

Hi Andrey,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/core]
[also build test ERROR on akpm-mm/mm-everything akpm-mm/mm-nonmm-unstable linus/master v6.12-rc1 next-20241004]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrey-Ryabinin/kstate-Add-kstate-a-mechanism-to-migrate-some-kernel-state-across-kexec/20241003-001223
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20241002160722.20025-3-arbn%40yandex-team.com
patch subject: [RFC PATCH 2/7] kexec: Hack and abuse crashkernel for the kstate's migration stream
config: i386-buildonly-randconfig-004-20241005 (https://download.01.org/0day-ci/archive/20241005/202410052140.hHx7eFfO-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410052140.hHx7eFfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052140.hHx7eFfO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kexec_core.c:1051:3: error: call to undeclared function 'arch_kexec_unprotect_crashkres'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1051 |                 arch_kexec_unprotect_crashkres();
         |                 ^
   1 error generated.


vim +/arch_kexec_unprotect_crashkres +1051 kernel/kexec_core.c

   990	
   991	/*
   992	 * Move into place and start executing a preloaded standalone
   993	 * executable.  If nothing was preloaded return an error.
   994	 */
   995	int kernel_kexec(void)
   996	{
   997		int error = 0;
   998	
   999		if (!kexec_trylock())
  1000			return -EBUSY;
  1001		if (!kexec_image) {
  1002			error = -EINVAL;
  1003			goto Unlock;
  1004		}
  1005	
  1006	#ifdef CONFIG_KEXEC_JUMP
  1007		if (kexec_image->preserve_context) {
  1008			pm_prepare_console();
  1009			error = freeze_processes();
  1010			if (error) {
  1011				error = -EBUSY;
  1012				goto Restore_console;
  1013			}
  1014			suspend_console();
  1015			error = dpm_suspend_start(PMSG_FREEZE);
  1016			if (error)
  1017				goto Resume_console;
  1018			/* At this point, dpm_suspend_start() has been called,
  1019			 * but *not* dpm_suspend_end(). We *must* call
  1020			 * dpm_suspend_end() now.  Otherwise, drivers for
  1021			 * some devices (e.g. interrupt controllers) become
  1022			 * desynchronized with the actual state of the
  1023			 * hardware at resume time, and evil weirdness ensues.
  1024			 */
  1025			error = dpm_suspend_end(PMSG_FREEZE);
  1026			if (error)
  1027				goto Resume_devices;
  1028			error = suspend_disable_secondary_cpus();
  1029			if (error)
  1030				goto Enable_cpus;
  1031			local_irq_disable();
  1032			error = syscore_suspend();
  1033			if (error)
  1034				goto Enable_irqs;
  1035		} else
  1036	#endif
  1037		{
  1038			kexec_in_progress = true;
  1039			kernel_restart_prepare("kexec reboot");
  1040			migrate_to_reboot_cpu();
  1041			syscore_shutdown();
  1042	
  1043			/*
  1044			 * migrate_to_reboot_cpu() disables CPU hotplug assuming that
  1045			 * no further code needs to use CPU hotplug (which is true in
  1046			 * the reboot case). However, the kexec path depends on using
  1047			 * CPU hotplug again; so re-enable it here.
  1048			 */
  1049			cpu_hotplug_enable();
  1050			pr_notice("Starting new kernel\n");
> 1051			arch_kexec_unprotect_crashkres();
  1052			machine_shutdown();
  1053		}
  1054	
  1055		if (kexec_image->type & KEXEC_TYPE_MIGRATE)
  1056			save_migrate_state(kexec_image->mig_stream);
  1057	
  1058		kmsg_dump(KMSG_DUMP_SHUTDOWN);
  1059		machine_kexec(kexec_image);
  1060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
