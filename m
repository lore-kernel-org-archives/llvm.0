Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9737B24537;
	Wed,  9 Aug 2023 20:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691611975; x=1723147975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fs2CuDabQsngcISk0Gf+yvNpACfpPh+pxFBgVjZD5aY=;
  b=TaPcrdtIqipUGyFqjFEbGvnWfyMj36CU200pcymOG51VV2mqr3hD4EuC
   DR8oHdobWcmOurDNH7Wc3THF8StFtCke5dju35EKDs2Pvw0B5ggV6HMDv
   10nq9o/uIzqfTTrZO19pdLmEFkb1KSDhUnOlpX1XBH+qGG/cYESPHyJT+
   xHtVzksh0ztQN9FBMgKq4TBc5q7Emeg/k/lJrFOBsZDtULgpyUpNFpz+J
   Tovj6IBf8iPIW5b7aESWv7Qo3DCB2fSFz95vAYP7EHGLE5c9yyEg2QZFJ
   ijhPaKckZyxiscKvmcIih3ynkDW81IA7HnPIhxniWDuW+0FlF9WesoJ8R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356186956"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="356186956"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 13:12:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="905782624"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="905782624"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Aug 2023 13:12:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTpXu-0006MP-0a;
	Wed, 09 Aug 2023 20:12:42 +0000
Date: Thu, 10 Aug 2023 04:11:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/srso 11/17] arch/x86/kernel/cpu/bugs.c:2611:7:
 warning: data argument not used by format string
Message-ID: <202308100405.9dZ1Lxqy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/srso
head:   c11a8b2bc1bb3ad76d8d28b283552768d665208c
commit: 11c0071d430e8287450563655600f52ec302d1f0 [11/17] x86/cpu: Remove all SRSO interface nonsense
config: i386-randconfig-r024-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100405.9dZ1Lxqy-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100405.9dZ1Lxqy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100405.9dZ1Lxqy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/bugs.c:680:6: warning: no previous prototype for function 'gds_ucode_mitigated' [-Wmissing-prototypes]
   bool gds_ucode_mitigated(void)
        ^
   arch/x86/kernel/cpu/bugs.c:680:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gds_ucode_mitigated(void)
   ^
   static 
>> arch/x86/kernel/cpu/bugs.c:2611:7: warning: data argument not used by format string [-Wformat-extra-args]
                                     cpu_has_ibpb_brtype_microcode() ? "" : "; no SRSO microcode");
                                     ^
>> arch/x86/kernel/cpu/bugs.c:2742:9: warning: no previous prototype for function 'cpu_show_spec_rstack_overflow' [-Wmissing-prototypes]
   ssize_t cpu_show_spec_rstack_overflow(struct device *dev, struct device_attribute *attr, char *buf)
           ^
   arch/x86/kernel/cpu/bugs.c:2742:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t cpu_show_spec_rstack_overflow(struct device *dev, struct device_attribute *attr, char *buf)
   ^
   static 
   arch/x86/kernel/cpu/bugs.c:2747:9: warning: no previous prototype for function 'cpu_show_gds' [-Wmissing-prototypes]
   ssize_t cpu_show_gds(struct device *dev, struct device_attribute *attr, char *buf)
           ^
   arch/x86/kernel/cpu/bugs.c:2747:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   ssize_t cpu_show_gds(struct device *dev, struct device_attribute *attr, char *buf)
   ^
   static 
   4 warnings generated.


vim +2611 arch/x86/kernel/cpu/bugs.c

  2595	
  2596	static ssize_t retbleed_show_state(char *buf)
  2597	{
  2598		if (retbleed_mitigation == RETBLEED_MITIGATION_UNRET ||
  2599		    retbleed_mitigation == RETBLEED_MITIGATION_UNRET_SRSO ||
  2600		    retbleed_mitigation == RETBLEED_MITIGATION_UNRET_SRSO_ALIAS ||
  2601		    retbleed_mitigation == RETBLEED_MITIGATION_IBPB) {
  2602			if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
  2603			    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
  2604				return sysfs_emit(buf, "Vulnerable: untrained return thunk / IBPB on non-AMD based uarch\n");
  2605	
  2606			return sysfs_emit(buf, "%s; SMT %s\n", retbleed_strings[retbleed_mitigation],
  2607					  !sched_smt_active() ? "disabled" :
  2608					  spectre_v2_user_stibp == SPECTRE_V2_USER_STRICT ||
  2609					  spectre_v2_user_stibp == SPECTRE_V2_USER_STRICT_PREFERRED ?
  2610					  "enabled with STIBP protection" : "vulnerable",
> 2611					  cpu_has_ibpb_brtype_microcode() ? "" : "; no SRSO microcode");
  2612	
  2613		}
  2614	
  2615		return sysfs_emit(buf, "%s%s\n", retbleed_strings[retbleed_mitigation],
  2616				  (boot_cpu_data.x86_vendor != X86_VENDOR_AMD ||
  2617				   cpu_has_ibpb_brtype_microcode()) ? "" : "; no SRSO microcode");
  2618	}
  2619	
  2620	static ssize_t gds_show_state(char *buf)
  2621	{
  2622		return sysfs_emit(buf, "%s\n", gds_strings[gds_mitigation]);
  2623	}
  2624	
  2625	static ssize_t cpu_show_common(struct device *dev, struct device_attribute *attr,
  2626				       char *buf, unsigned int bug)
  2627	{
  2628		if (!boot_cpu_has_bug(bug))
  2629			return sysfs_emit(buf, "Not affected\n");
  2630	
  2631		switch (bug) {
  2632		case X86_BUG_CPU_MELTDOWN:
  2633			if (boot_cpu_has(X86_FEATURE_PTI))
  2634				return sysfs_emit(buf, "Mitigation: PTI\n");
  2635	
  2636			if (hypervisor_is_type(X86_HYPER_XEN_PV))
  2637				return sysfs_emit(buf, "Unknown (XEN PV detected, hypervisor mitigation required)\n");
  2638	
  2639			break;
  2640	
  2641		case X86_BUG_SPECTRE_V1:
  2642			return sysfs_emit(buf, "%s\n", spectre_v1_strings[spectre_v1_mitigation]);
  2643	
  2644		case X86_BUG_SPECTRE_V2:
  2645			return spectre_v2_show_state(buf);
  2646	
  2647		case X86_BUG_SPEC_STORE_BYPASS:
  2648			return sysfs_emit(buf, "%s\n", ssb_strings[ssb_mode]);
  2649	
  2650		case X86_BUG_L1TF:
  2651			if (boot_cpu_has(X86_FEATURE_L1TF_PTEINV))
  2652				return l1tf_show_state(buf);
  2653			break;
  2654	
  2655		case X86_BUG_MDS:
  2656			return mds_show_state(buf);
  2657	
  2658		case X86_BUG_TAA:
  2659			return tsx_async_abort_show_state(buf);
  2660	
  2661		case X86_BUG_ITLB_MULTIHIT:
  2662			return itlb_multihit_show_state(buf);
  2663	
  2664		case X86_BUG_SRBDS:
  2665			return srbds_show_state(buf);
  2666	
  2667		case X86_BUG_MMIO_STALE_DATA:
  2668		case X86_BUG_MMIO_UNKNOWN:
  2669			return mmio_stale_data_show_state(buf);
  2670	
  2671		case X86_BUG_RETBLEED:
  2672			return retbleed_show_state(buf);
  2673	
  2674		case X86_BUG_GDS:
  2675			return gds_show_state(buf);
  2676	
  2677		default:
  2678			break;
  2679		}
  2680	
  2681		return sysfs_emit(buf, "Vulnerable\n");
  2682	}
  2683	
  2684	ssize_t cpu_show_meltdown(struct device *dev, struct device_attribute *attr, char *buf)
  2685	{
  2686		return cpu_show_common(dev, attr, buf, X86_BUG_CPU_MELTDOWN);
  2687	}
  2688	
  2689	ssize_t cpu_show_spectre_v1(struct device *dev, struct device_attribute *attr, char *buf)
  2690	{
  2691		return cpu_show_common(dev, attr, buf, X86_BUG_SPECTRE_V1);
  2692	}
  2693	
  2694	ssize_t cpu_show_spectre_v2(struct device *dev, struct device_attribute *attr, char *buf)
  2695	{
  2696		return cpu_show_common(dev, attr, buf, X86_BUG_SPECTRE_V2);
  2697	}
  2698	
  2699	ssize_t cpu_show_spec_store_bypass(struct device *dev, struct device_attribute *attr, char *buf)
  2700	{
  2701		return cpu_show_common(dev, attr, buf, X86_BUG_SPEC_STORE_BYPASS);
  2702	}
  2703	
  2704	ssize_t cpu_show_l1tf(struct device *dev, struct device_attribute *attr, char *buf)
  2705	{
  2706		return cpu_show_common(dev, attr, buf, X86_BUG_L1TF);
  2707	}
  2708	
  2709	ssize_t cpu_show_mds(struct device *dev, struct device_attribute *attr, char *buf)
  2710	{
  2711		return cpu_show_common(dev, attr, buf, X86_BUG_MDS);
  2712	}
  2713	
  2714	ssize_t cpu_show_tsx_async_abort(struct device *dev, struct device_attribute *attr, char *buf)
  2715	{
  2716		return cpu_show_common(dev, attr, buf, X86_BUG_TAA);
  2717	}
  2718	
  2719	ssize_t cpu_show_itlb_multihit(struct device *dev, struct device_attribute *attr, char *buf)
  2720	{
  2721		return cpu_show_common(dev, attr, buf, X86_BUG_ITLB_MULTIHIT);
  2722	}
  2723	
  2724	ssize_t cpu_show_srbds(struct device *dev, struct device_attribute *attr, char *buf)
  2725	{
  2726		return cpu_show_common(dev, attr, buf, X86_BUG_SRBDS);
  2727	}
  2728	
  2729	ssize_t cpu_show_mmio_stale_data(struct device *dev, struct device_attribute *attr, char *buf)
  2730	{
  2731		if (boot_cpu_has_bug(X86_BUG_MMIO_UNKNOWN))
  2732			return cpu_show_common(dev, attr, buf, X86_BUG_MMIO_UNKNOWN);
  2733		else
  2734			return cpu_show_common(dev, attr, buf, X86_BUG_MMIO_STALE_DATA);
  2735	}
  2736	
  2737	ssize_t cpu_show_retbleed(struct device *dev, struct device_attribute *attr, char *buf)
  2738	{
  2739		return cpu_show_common(dev, attr, buf, X86_BUG_RETBLEED);
  2740	}
  2741	
> 2742	ssize_t cpu_show_spec_rstack_overflow(struct device *dev, struct device_attribute *attr, char *buf)
  2743	{
  2744		return cpu_show_common(dev, attr, buf, X86_BUG_SRSO);
  2745	}
  2746	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
