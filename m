Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB6E1FC111;
	Sun, 23 Feb 2025 11:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740310292; cv=none; b=GbpHHMmWYTq4/uTSkoCA8wNcTyzbYnr6HnhBHISSA/Jp9oBklvDJ78DWIx1H1z6nm+WKtHNq+lmEKiOTZ6+CjgbVPkZlSalfOEjZ6P3GqxBRPouqskX41DGWQtrsmdtypHXAFnh1lzYXqkP0wtCBwvkqLWaGtI1eopdj/HCAmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740310292; c=relaxed/simple;
	bh=jbrrCgBcgew/fFwbDuAah/uNJvBxeQhHy6iIK7bp8vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAYfQreak9SdVMcQtn7Lsh/Ij34GdnzGAop1pi8OEwMK0nvT2Q0DMHWgPSyrcfQ8PA05p3b+cUluwkKzQTnecQ/W6bQU6DalQCBkGy48zcJeTRY2LXauik89PJTszNHeXH+6V0TCPJ8/WuvPrb2l+KFms0a8TDAC5qh39Z+gUI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBWNv1KO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBWNv1KO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740310291; x=1771846291;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jbrrCgBcgew/fFwbDuAah/uNJvBxeQhHy6iIK7bp8vg=;
  b=ZBWNv1KO/8/a3DGMNgcITr0xBBunLzmcSaOcpKzXbhNae+h3R0xSHhYr
   QYC4uzlxDeGjlYE1hrzXXq2xiKiUvOtBLV/GKNJEf5Ccd3G+KY/Xu5dQy
   FuyaA2hs4GrDhZsc4OqQr0YFI6froOb/L/iEj92eV4FWma6vG2FkLWHvE
   2q1cjSpfmYOOCCIzFS+crbOl6lOjxEyEQqW+1zE1l2YRtEG7kUkfhpd2A
   QPR6w7GveTzcV1aqvIuS9ZPls0g27CqksYv2GqeUo0KkZaBBkc0HVUbAJ
   fOkgBBm6cwXwd8YP9RvhQMDog3OexpHX8Bfgcc/cA92QgK4c08wyRzqQ8
   Q==;
X-CSE-ConnectionGUID: hgzYAj87S9GUKPOpB5IAig==
X-CSE-MsgGUID: KFX/ATyuQqWPCd0IqpEHnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="41197547"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="41197547"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 03:31:30 -0800
X-CSE-ConnectionGUID: Ucp9csbWTV28jvVPJlUwVg==
X-CSE-MsgGUID: apoy/W5ZT0uQlmEdtda93g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115610785"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 23 Feb 2025 03:31:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmACa-0007IR-0C;
	Sun, 23 Feb 2025 11:31:25 +0000
Date: Sun, 23 Feb 2025 19:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/11] x86/preempt: Move preempt count to percpu hot
 section
Message-ID: <202502231946.RXtsMrTp-lkp@intel.com>
References: <20250222190623.262689-3-brgerst@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222190623.262689-3-brgerst@gmail.com>

Hi Brian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 01157ddc58dc2fe428ec17dd5a18cc13f134639f]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/percpu-Introduce-percpu-hot-section/20250223-031046
base:   01157ddc58dc2fe428ec17dd5a18cc13f134639f
patch link:    https://lore.kernel.org/r/20250222190623.262689-3-brgerst%40gmail.com
patch subject: [RFC PATCH 02/11] x86/preempt: Move preempt count to percpu hot section
config: i386-buildonly-randconfig-004-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231946.RXtsMrTp-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231946.RXtsMrTp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231946.RXtsMrTp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
>> include/linux/preempt.h:340:13: warning: declaration of 'struct task_struct' will not be visible outside of this function [-Wvisibility]
     340 |                           struct task_struct *next);
         |                                  ^
   1 warning generated.
--
   In file included from drivers/platform/surface/surface_hotplug.c:16:
   In file included from include/linux/acpi.h:13:
   In file included from include/linux/resource_ext.h:11:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:56:
>> include/linux/preempt.h:340:13: warning: declaration of 'struct task_struct' will not be visible outside of this function [-Wvisibility]
     340 |                           struct task_struct *next);
         |                                  ^
   drivers/platform/surface/surface_hotplug.c:79:39: warning: arithmetic between different enumeration types ('enum shps_dsm_fn' and 'enum shps_irq_type') [-Wenum-enum-conversion]
      79 |         return SHPS_DSM_FN_IRQ_BASE_PRESENCE + type;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~
   2 warnings generated.
--
   In file included from kernel/sched/core.c:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:6:
   In file included from include/linux/wait_bit.h:8:
   In file included from include/linux/wait.h:9:
   In file included from include/linux/spinlock.h:56:
>> include/linux/preempt.h:340:13: warning: declaration of 'struct task_struct' will not be visible outside of this function [-Wvisibility]
     340 |                           struct task_struct *next);
         |                                  ^
   kernel/sched/core.c:4958:38: error: incompatible pointer types passing 'struct task_struct *' to parameter of type 'struct task_struct *' [-Werror,-Wincompatible-pointer-types]
    4958 |                 notifier->ops->sched_out(notifier, next);
         |                                                    ^~~~
   1 warning and 1 error generated.
--
   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:56:
>> include/linux/preempt.h:340:13: warning: declaration of 'struct task_struct' will not be visible outside of this function [-Wvisibility]
     340 |                           struct task_struct *next);
         |                                  ^
   1 warning generated.


vim +340 include/linux/preempt.h

e107be36efb2a23 Avi Kivity 2007-07-26  322  
e107be36efb2a23 Avi Kivity 2007-07-26  323  /**
e107be36efb2a23 Avi Kivity 2007-07-26  324   * preempt_ops - notifiers called when a task is preempted and rescheduled
e107be36efb2a23 Avi Kivity 2007-07-26  325   * @sched_in: we're about to be rescheduled:
e107be36efb2a23 Avi Kivity 2007-07-26  326   *    notifier: struct preempt_notifier for the task being scheduled
e107be36efb2a23 Avi Kivity 2007-07-26  327   *    cpu:  cpu we're scheduled on
e107be36efb2a23 Avi Kivity 2007-07-26  328   * @sched_out: we've just been preempted
e107be36efb2a23 Avi Kivity 2007-07-26  329   *    notifier: struct preempt_notifier for the task being preempted
e107be36efb2a23 Avi Kivity 2007-07-26  330   *    next: the task that's kicking us out
8592e6486a177a0 Tejun Heo  2009-12-02  331   *
8592e6486a177a0 Tejun Heo  2009-12-02  332   * Please note that sched_in and out are called under different
8592e6486a177a0 Tejun Heo  2009-12-02  333   * contexts.  sched_out is called with rq lock held and irq disabled
8592e6486a177a0 Tejun Heo  2009-12-02  334   * while sched_in is called without rq lock and irq enabled.  This
8592e6486a177a0 Tejun Heo  2009-12-02  335   * difference is intentional and depended upon by its users.
e107be36efb2a23 Avi Kivity 2007-07-26  336   */
e107be36efb2a23 Avi Kivity 2007-07-26  337  struct preempt_ops {
e107be36efb2a23 Avi Kivity 2007-07-26  338  	void (*sched_in)(struct preempt_notifier *notifier, int cpu);
e107be36efb2a23 Avi Kivity 2007-07-26  339  	void (*sched_out)(struct preempt_notifier *notifier,
e107be36efb2a23 Avi Kivity 2007-07-26 @340  			  struct task_struct *next);
e107be36efb2a23 Avi Kivity 2007-07-26  341  };
e107be36efb2a23 Avi Kivity 2007-07-26  342  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
