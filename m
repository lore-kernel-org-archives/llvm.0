Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5699D487BE;
	Sat, 27 Dec 2025 11:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766835604; cv=none; b=PEKY9KZzbIA4IYD932Sns4RIP01+EzxQwDiuVDB/aTeoCZW1uyOYn3LWZGIg2A+hZr6E+45vQWwasyT0vfaxZbBrMHCS9AP+gAkrXR3019G8kCNLjTO4jHhVsx1BYpTBOf+p4QTlhd0EywAlIAb56El5AxmA3IiVmtLTBRPUqHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766835604; c=relaxed/simple;
	bh=Vkc+X5bAG5Bigv4OX5jwbMjunMpUv3klOO04x8pu0jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LcpE2j3jFIwbeMD/i63yWNIrhU7QNPS07o+j5ezF1hQXgm5kwURAtyLZi90wbe5MlqJaQ0LIks11SBdD1K30elx+NLLaTuaYz+X7Z2Pd08Ug6kIF+QBXav/Qh51rukvDVAyRT/7iKwyqScc2nrE0h3cOywYU5tltlwUnRzOoCA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/3UO/VQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/3UO/VQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766835601; x=1798371601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Vkc+X5bAG5Bigv4OX5jwbMjunMpUv3klOO04x8pu0jc=;
  b=n/3UO/VQjuKtniosofqLjC1vMmQUHdSnVCM+QfqZlRM8+sOrgN6YofC+
   I/+b6nJC9E3qejszB4vJvRLgGp53QsMl8fxwOC+Ba7V3eTYkgJoHOA8aq
   JzVZE1Y1n9u0sbtnD9IbYm3VbENwgO6VaMiM28QuzBU/BVSOLZpF9n5/G
   MPOOBiz4Vm639usoO0Cmf5CYuKUZZxk6nPBK1PTb71jxRYYqpelQ4h4gG
   CW2C2meLc2of37yyMT5xuJKwVfvKpq5JpbGsoHkzeHAAUW4iw9lzcmbba
   HeS3tNb3NiUtGZfVvtvVure9W6NLGMQJar3jkuM/Vgs3lt0fdKYdwtVNX
   A==;
X-CSE-ConnectionGUID: kcaqObgiT4yDO76vvpM8Ew==
X-CSE-MsgGUID: 4Qebvi1/TkijdAB8AUzX7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="79174535"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="79174535"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 03:39:59 -0800
X-CSE-ConnectionGUID: 5vIKQ6g5Ttu6JvY3YWR8PA==
X-CSE-MsgGUID: 7tRYIJSQTwqfxFbSUoYh+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="200559133"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2025 03:40:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZSeI-000000005mJ-3ifa;
	Sat, 27 Dec 2025 11:39:55 +0000
Date: Sat, 27 Dec 2025 19:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 7/8] PM: hibernate: Enter s2idle sleep state before
 hibernation
Message-ID: <202512271901.0fiprS0M-lkp@intel.com>
References: <20251226102656.6296-8-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226102656.6296-8-lkml@antheas.dev>

Hi Antheas,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Antheas-Kapenekakis/Documentation-PM-Add-documentation-for-Runtime-Standby-States/20251226-183746
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251226102656.6296-8-lkml%40antheas.dev
patch subject: [RFC v1 7/8] PM: hibernate: Enter s2idle sleep state before hibernation
config: i386-randconfig-002-20251227 (https://download.01.org/0day-ci/archive/20251227/202512271901.0fiprS0M-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271901.0fiprS0M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512271901.0fiprS0M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/power/hibernate.c:823:5: warning: 'CONFIG_SUSPEND' is not defined, evaluates to 0 [-Wundef]
     823 | #if CONFIG_SUSPEND
         |     ^
   kernel/power/hibernate.c:913:5: warning: 'CONFIG_SUSPEND' is not defined, evaluates to 0 [-Wundef]
     913 | #if CONFIG_SUSPEND
         |     ^
>> kernel/power/hibernate.c:794:7: warning: variable 'powered_down' set but not used [-Wunused-but-set-variable]
     794 |         bool powered_down = false;
         |              ^
   3 warnings generated.


vim +/CONFIG_SUSPEND +823 kernel/power/hibernate.c

   784	
   785	/**
   786	 * hibernate - Carry out system hibernation, including saving the image.
   787	 */
   788	int hibernate(void)
   789	{
   790	#ifdef CONFIG_SUSPEND
   791		standby_state_t previous_standby;
   792	#endif
   793		bool snapshot_test = false;
 > 794		bool powered_down = false;
   795		unsigned int sleep_flags;
   796		int error;
   797	
   798		if (!hibernation_available()) {
   799			pm_pr_dbg("Hibernation not available.\n");
   800			return -EPERM;
   801		}
   802	
   803		/*
   804		 * Query for the compression algorithm support if compression is enabled.
   805		 */
   806		if (!nocompress) {
   807			strscpy(hib_comp_algo, hibernate_compressor);
   808			if (!crypto_has_acomp(hib_comp_algo, 0, CRYPTO_ALG_ASYNC)) {
   809				pr_err("%s compression is not available\n", hib_comp_algo);
   810				return -EOPNOTSUPP;
   811			}
   812		}
   813	
   814		sleep_flags = lock_system_sleep();
   815		/* The snapshot device should not be opened while we're running */
   816		if (!hibernate_acquire()) {
   817			error = -EBUSY;
   818			goto Unlock;
   819		}
   820	
   821		pr_info("hibernation entry\n");
   822	
 > 823	#if CONFIG_SUSPEND
   824		/* Enter the standby screen off state in case userspace has not. */
   825		previous_standby = pm_standby_get_state();
   826		pm_standby_transition(PM_STANDBY_INACTIVE);
   827	#endif
   828	
   829		pm_prepare_console();
   830		error = pm_notifier_call_chain_robust(PM_HIBERNATION_PREPARE, PM_POST_HIBERNATION);
   831		if (error)
   832			goto Restore;
   833	
   834		error = pm_sleep_fs_sync();
   835		if (error)
   836			goto Notify;
   837	
   838		filesystems_freeze(filesystem_freeze_enabled);
   839	
   840		error = freeze_processes();
   841		if (error)
   842			goto Exit;
   843	
   844		lock_device_hotplug();
   845		/* Allocate memory management structures */
   846		error = create_basic_memory_bitmaps();
   847		if (error)
   848			goto Thaw;
   849	
   850		error = hibernation_snapshot(hibernation_mode == HIBERNATION_PLATFORM);
   851		if (error || freezer_test_done)
   852			goto Free_bitmaps;
   853	
   854		if (in_suspend) {
   855			unsigned int flags = 0;
   856	
   857			if (hibernation_mode == HIBERNATION_PLATFORM)
   858				flags |= SF_PLATFORM_MODE;
   859			if (nocompress) {
   860				flags |= SF_NOCOMPRESS_MODE;
   861			} else {
   862			        flags |= SF_CRC32_MODE;
   863	
   864				/*
   865				 * By default, LZO compression is enabled. Use SF_COMPRESSION_ALG_LZ4
   866				 * to override this behaviour and use LZ4.
   867				 *
   868				 * Refer kernel/power/power.h for more details
   869				 */
   870	
   871				if (!strcmp(hib_comp_algo, COMPRESSION_ALGO_LZ4))
   872					flags |= SF_COMPRESSION_ALG_LZ4;
   873				else
   874					flags |= SF_COMPRESSION_ALG_LZO;
   875			}
   876	
   877			pm_pr_dbg("Writing hibernation image.\n");
   878			error = swsusp_write(flags);
   879			swsusp_free();
   880			if (!error) {
   881				if (hibernation_mode == HIBERNATION_TEST_RESUME) {
   882					snapshot_test = true;
   883				} else {
   884					powered_down = true;
   885					power_down();
   886				}
   887			}
   888			in_suspend = 0;
   889			pm_restore_gfp_mask();
   890		} else {
   891			pm_pr_dbg("Hibernation image restored successfully.\n");
   892		}
   893	
   894	 Free_bitmaps:
   895		free_basic_memory_bitmaps();
   896	 Thaw:
   897		unlock_device_hotplug();
   898		if (snapshot_test) {
   899			pm_pr_dbg("Checking hibernation image\n");
   900			error = swsusp_check(false);
   901			if (!error)
   902				error = load_image_and_restore();
   903		}
   904		thaw_processes();
   905	
   906		/* Don't bother checking whether freezer_test_done is true */
   907		freezer_test_done = false;
   908	 Exit:
   909		filesystems_thaw();
   910	 Notify:
   911		pm_notifier_call_chain(PM_POST_HIBERNATION);
   912	 Restore:
   913	#if CONFIG_SUSPEND
   914		/*
   915		 * If we resumed from S5, we are in the active standby state. However,
   916		 * the kernel restored a stale value. Sync it. Otherwise, in e.g., the
   917		 * case of a failed hibernation, transition to the previous value.
   918		 */
   919		if (powered_down)
   920			pm_standby_set_state(PM_STANDBY_ACTIVE);
   921		else
   922			pm_standby_transition(previous_standby);
   923	#endif
   924	
   925		pm_restore_console();
   926		hibernate_release();
   927	 Unlock:
   928		unlock_system_sleep(sleep_flags);
   929		pr_info("hibernation exit\n");
   930	
   931		return error;
   932	}
   933	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
