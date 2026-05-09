Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157A127FB2A;
	Sat,  9 May 2026 16:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778343035; cv=none; b=q3djf0LKSREYqPx3R6G9q5rqFFYRCGCilEhw8Of1UALSl4EZN/wQNO14wD0EuKjRiOHTHpCJsGIR+TK8xlrGnbRtXuzLl7RpzdRB+EP5lWqJf6VV/SkC2abt1HrtO7erd9UN5MJ9vMjnpHuhPViBSxpPcOztAU+3b2DHZJzwlzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778343035; c=relaxed/simple;
	bh=7ykDl0+4fiAY6WTSr0hUE4KyGAFP3sQvY6fest7t98w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p/WS1SvchYi+1z16Gu7lIv0dKqyG0GOd8P89CL12VUV4dbi8KmI/In3BnwvOuYr+ZgF+BlWIpC20OSDFO06I9YBfDAujwkFoO4xFHHYzPNBAwwtZp1587/12fbMzt7CjB/CaAjCSuV5gtHggz+PU6dfK2Yf7la1UcW7UK0BS6Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEJmJVex; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEJmJVex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778343032; x=1809879032;
  h=date:from:to:cc:subject:message-id;
  bh=7ykDl0+4fiAY6WTSr0hUE4KyGAFP3sQvY6fest7t98w=;
  b=MEJmJVexRT/uflrqkLcMQvuNxXu1YApEauttfcb40784QbuMfVAFj+bz
   14rKqHa83JRypCkb5s9aanifh5apoI1Qlyzde9g4n/dMg3F5IsN1FSJXp
   HqCYNCOf8mRV0z/Q+Gb6IGS/1BgwAqFDZHi7yPerbImI7BU6W1lutdedA
   FAyhnpm+Zg7lbN7A77Nwcdh1Qg4UXs4SO1EBveskIAAES/1tB6V/gg+y/
   ZPlPWBg6YRDjebHQCRChBawPSyCEmo0ToInCDFH9AEIZTTP+dn/PNAL2W
   3WH99dkf/eV+Rx7aJjhzi2/Qh8TcWchvzisxhEBJCpWmIXIJ285tGabAf
   A==;
X-CSE-ConnectionGUID: wJAO4WfOSsecRCV42Kdukg==
X-CSE-MsgGUID: x9qb5kV6SrGQwAYrJsFhFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="79480036"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="79480036"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 09:10:31 -0700
X-CSE-ConnectionGUID: nEttVf01RJ6UAT6AMcivYw==
X-CSE-MsgGUID: j3nWUsaZSu2Or8uvTW06rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="234379278"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 09 May 2026 09:10:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLkG2-000000007VN-4AjH;
	Sat, 09 May 2026 16:10:27 +0000
Date: Sat, 09 May 2026 18:09:56 +0200
From: kernel test robot <lkp@intel.com>
To: Tony Luck <tony.luck@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: fs/resctrl/rdtgroup.c:2883:3: error: call to undeclared
 function 'mon_put_kn_priv'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202605091825.z9aVXL5P-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tony-Luck/fs-resctrl-Free-mon_data-structures-on-rdt_get_tree-failure/20260509-184342
head:   2724c4d60ac0a492fbc45a40cdd58801960e074a
commit: 2724c4d60ac0a492fbc45a40cdd58801960e074a fs/resctrl: Free mon_data structures on rdt_get_tree() failure
date:   5 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260509/202605091825.z9aVXL5P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091825.z9aVXL5P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605091825.z9aVXL5P-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/resctrl/rdtgroup.c:2883:3: error: call to undeclared function 'mon_put_kn_priv'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2883 |                 mon_put_kn_priv();
         |                 ^
>> fs/resctrl/rdtgroup.c:3144:13: error: conflicting types for 'mon_put_kn_priv'
    3144 | static void mon_put_kn_priv(void)
         |             ^
   fs/resctrl/rdtgroup.c:2883:3: note: previous implicit declaration is here
    2883 |                 mon_put_kn_priv();
         |                 ^
   2 errors generated.


vim +/mon_put_kn_priv +2883 fs/resctrl/rdtgroup.c

  2784	
  2785	static int rdt_get_tree(struct fs_context *fc)
  2786	{
  2787		struct rdt_fs_context *ctx = rdt_fc2context(fc);
  2788		unsigned long flags = RFTYPE_CTRL_BASE;
  2789		struct rdt_l3_mon_domain *dom;
  2790		struct rdt_resource *r;
  2791		int ret;
  2792	
  2793		DO_ONCE_SLEEPABLE(resctrl_arch_pre_mount);
  2794	
  2795		cpus_read_lock();
  2796		mutex_lock(&rdtgroup_mutex);
  2797		/*
  2798		 * resctrl file system can only be mounted once.
  2799		 */
  2800		if (resctrl_mounted) {
  2801			ret = -EBUSY;
  2802			goto out;
  2803		}
  2804	
  2805		ret = setup_rmid_lru_list();
  2806		if (ret)
  2807			goto out;
  2808	
  2809		ret = rdtgroup_setup_root(ctx);
  2810		if (ret)
  2811			goto out;
  2812	
  2813		ret = rdt_enable_ctx(ctx);
  2814		if (ret)
  2815			goto out_root;
  2816	
  2817		ret = schemata_list_create();
  2818		if (ret)
  2819			goto out_schemata_free;
  2820	
  2821		ret = closid_init();
  2822		if (ret)
  2823			goto out_schemata_free;
  2824	
  2825		if (resctrl_arch_mon_capable())
  2826			flags |= RFTYPE_MON;
  2827	
  2828		ret = rdtgroup_add_files(rdtgroup_default.kn, flags);
  2829		if (ret)
  2830			goto out_closid_exit;
  2831	
  2832		kernfs_activate(rdtgroup_default.kn);
  2833	
  2834		ret = rdtgroup_create_info_dir(rdtgroup_default.kn);
  2835		if (ret < 0)
  2836			goto out_closid_exit;
  2837	
  2838		if (resctrl_arch_mon_capable()) {
  2839			ret = mongroup_create_dir(rdtgroup_default.kn,
  2840						  &rdtgroup_default, "mon_groups",
  2841						  &kn_mongrp);
  2842			if (ret < 0)
  2843				goto out_info;
  2844	
  2845			rdtgroup_assign_cntrs(&rdtgroup_default);
  2846	
  2847			ret = mkdir_mondata_all(rdtgroup_default.kn,
  2848						&rdtgroup_default, &kn_mondata);
  2849			if (ret < 0)
  2850				goto out_mongrp;
  2851			rdtgroup_default.mon.mon_data_kn = kn_mondata;
  2852		}
  2853	
  2854		ret = rdt_pseudo_lock_init();
  2855		if (ret)
  2856			goto out_mondata;
  2857	
  2858		ret = kernfs_get_tree(fc);
  2859		if (ret < 0)
  2860			goto out_psl;
  2861	
  2862		if (resctrl_arch_alloc_capable())
  2863			resctrl_arch_enable_alloc();
  2864		if (resctrl_arch_mon_capable())
  2865			resctrl_arch_enable_mon();
  2866	
  2867		if (resctrl_arch_alloc_capable() || resctrl_arch_mon_capable())
  2868			resctrl_mounted = true;
  2869	
  2870		if (resctrl_is_mbm_enabled()) {
  2871			r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
  2872			list_for_each_entry(dom, &r->mon_domains, hdr.list)
  2873				mbm_setup_overflow_handler(dom, MBM_OVERFLOW_INTERVAL,
  2874							   RESCTRL_PICK_ANY_CPU);
  2875		}
  2876	
  2877		goto out;
  2878	
  2879	out_psl:
  2880		rdt_pseudo_lock_release();
  2881	out_mondata:
  2882		if (resctrl_arch_mon_capable()) {
> 2883			mon_put_kn_priv();
  2884			kernfs_remove(kn_mondata);
  2885		}
  2886	out_mongrp:
  2887		if (resctrl_arch_mon_capable()) {
  2888			rdtgroup_unassign_cntrs(&rdtgroup_default);
  2889			kernfs_remove(kn_mongrp);
  2890		}
  2891	out_info:
  2892		kernfs_remove(kn_info);
  2893	out_closid_exit:
  2894		closid_exit();
  2895	out_schemata_free:
  2896		schemata_list_destroy();
  2897		rdt_disable_ctx();
  2898	out_root:
  2899		rdtgroup_destroy_root();
  2900	out:
  2901		rdt_last_cmd_clear();
  2902		mutex_unlock(&rdtgroup_mutex);
  2903		cpus_read_unlock();
  2904		return ret;
  2905	}
  2906	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
