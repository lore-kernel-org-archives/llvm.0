Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643E22248A0;
	Sat, 20 Sep 2025 06:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758350964; cv=none; b=KmJHLG+1FY0yNfneywt8n/C6dcFZVslGXf7j5iw83PykbhKLJttk1VCJHIm/WWtfCzJ+VScoUEpMsCsaf+Z4puRimEN0i54L6d/dCWCv9eh6nCRWJVKJCDwv8Nryi3NwJuj4cF9EAVnGrIytURrc7ksvEO+aN8qEQdd03vihm/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758350964; c=relaxed/simple;
	bh=xHGQwHL1bk3L5xRvbz3YwjZKtTfAt3YX/suVsVjWtKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVZMGCMxCyMpmiqFsM1MRke2nDRuSqpvuXS2koG0tQi45W2nvZhJBVAQ65s3EnpzI893DQL0EEcqkOEy7BTjvCmcsjVcfDbHY4TeJm8nGEH4FaG4fKaSJZzqWr81zFewTDPXbllVUsTznEP6WE+0afCJGP2hR1LdUxPm+Tgv4Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MvQK3zKA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MvQK3zKA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758350963; x=1789886963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xHGQwHL1bk3L5xRvbz3YwjZKtTfAt3YX/suVsVjWtKo=;
  b=MvQK3zKASwcgb6hkn0qF4+hHBTGip2DLegL1sYuQPCpyYgGKH2+y3b1l
   DTSZ63I4rbtyyWsmpGEKD2r0qdfv4Ym0ivMKPsRkEEPSGc3FgX8AOTnZx
   iuly54LtvlI/5/GpBG6IeOj343OPKvo5zJYXqmnlWxjsAf32DJIdXJgxn
   Rb38XzeDX04S08gwCuOHo8e6XBSmVS+ziF+goez2iSVIWDVIJJB3xJMY2
   xfwLNGGn28XIRvJ+Yze8F96etUN0fMN38Y+1jDArbL0f98PFeu5EUlmiS
   zyXq7uiuZ4Daspx81ohVEph67LJS2ctBu268MlcpKXxxbN1zA1dHVuSI4
   w==;
X-CSE-ConnectionGUID: tEd2zpojTiyzTg5ywVOcfg==
X-CSE-MsgGUID: Sitoh8mxTtSFWd9zNixOJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="70938364"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="70938364"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 23:49:22 -0700
X-CSE-ConnectionGUID: royPA8BmR16HhLbpu/qKmQ==
X-CSE-MsgGUID: cQ9fJrNaS3axUn908kRHfQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Sep 2025 23:49:20 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzrPK-00056l-12;
	Sat, 20 Sep 2025 06:49:18 +0000
Date: Sat, 20 Sep 2025 14:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC Patch 1/7] kexec: Introduce multikernel support via kexec
Message-ID: <202509201410.Jl6MF9DY-lkp@intel.com>
References: <20250918222607.186488-2-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918222607.186488-2-xiyou.wangcong@gmail.com>

Hi Cong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.17-rc6 next-20250919]
[cannot apply to tip/x86/core powerpc/next powerpc/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cong-Wang/kexec-Introduce-multikernel-support-via-kexec/20250919-062852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250918222607.186488-2-xiyou.wangcong%40gmail.com
patch subject: [RFC Patch 1/7] kexec: Introduce multikernel support via kexec
config: x86_64-buildonly-randconfig-003-20250920 (https://download.01.org/0day-ci/archive/20250920/202509201410.Jl6MF9DY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201410.Jl6MF9DY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509201410.Jl6MF9DY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/reboot.c:736:31: warning: unused variable 'boot_args' [-Wunused-variable]
     736 |         struct multikernel_boot_args boot_args;
         |                                      ^~~~~~~~~
   1 warning generated.


vim +/boot_args +736 kernel/reboot.c

   723	
   724	/*
   725	 * Reboot system call: for obvious reasons only root may call it,
   726	 * and even root needs to set up some magic numbers in the registers
   727	 * so that some mistake won't make this reboot the whole machine.
   728	 * You can also set the meaning of the ctrl-alt-del-key here.
   729	 *
   730	 * reboot doesn't sync: do that yourself before calling this.
   731	 */
   732	SYSCALL_DEFINE4(reboot, int, magic1, int, magic2, unsigned int, cmd,
   733			void __user *, arg)
   734	{
   735		struct pid_namespace *pid_ns = task_active_pid_ns(current);
 > 736		struct multikernel_boot_args boot_args;
   737		char buffer[256];
   738		int ret = 0;
   739	
   740		/* We only trust the superuser with rebooting the system. */
   741		if (!ns_capable(pid_ns->user_ns, CAP_SYS_BOOT))
   742			return -EPERM;
   743	
   744		/* For safety, we require "magic" arguments. */
   745		if (magic1 != LINUX_REBOOT_MAGIC1 ||
   746				(magic2 != LINUX_REBOOT_MAGIC2 &&
   747				magic2 != LINUX_REBOOT_MAGIC2A &&
   748				magic2 != LINUX_REBOOT_MAGIC2B &&
   749				magic2 != LINUX_REBOOT_MAGIC2C))
   750			return -EINVAL;
   751	
   752		/*
   753		 * If pid namespaces are enabled and the current task is in a child
   754		 * pid_namespace, the command is handled by reboot_pid_ns() which will
   755		 * call do_exit().
   756		 */
   757		ret = reboot_pid_ns(pid_ns, cmd);
   758		if (ret)
   759			return ret;
   760	
   761		/* Instead of trying to make the power_off code look like
   762		 * halt when pm_power_off is not set do it the easy way.
   763		 */
   764		if ((cmd == LINUX_REBOOT_CMD_POWER_OFF) && !kernel_can_power_off()) {
   765			poweroff_fallback_to_halt = true;
   766			cmd = LINUX_REBOOT_CMD_HALT;
   767		}
   768	
   769		mutex_lock(&system_transition_mutex);
   770		switch (cmd) {
   771		case LINUX_REBOOT_CMD_RESTART:
   772			kernel_restart(NULL);
   773			break;
   774	
   775		case LINUX_REBOOT_CMD_CAD_ON:
   776			C_A_D = 1;
   777			break;
   778	
   779		case LINUX_REBOOT_CMD_CAD_OFF:
   780			C_A_D = 0;
   781			break;
   782	
   783		case LINUX_REBOOT_CMD_HALT:
   784			kernel_halt();
   785			do_exit(0);
   786	
   787		case LINUX_REBOOT_CMD_POWER_OFF:
   788			kernel_power_off();
   789			do_exit(0);
   790			break;
   791	
   792		case LINUX_REBOOT_CMD_RESTART2:
   793			ret = strncpy_from_user(&buffer[0], arg, sizeof(buffer) - 1);
   794			if (ret < 0) {
   795				ret = -EFAULT;
   796				break;
   797			}
   798			buffer[sizeof(buffer) - 1] = '\0';
   799	
   800			kernel_restart(buffer);
   801			break;
   802	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
