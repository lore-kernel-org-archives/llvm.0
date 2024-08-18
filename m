Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387F4944F;
	Sun, 18 Aug 2024 05:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723957805; cv=none; b=mq519zALsZprUOxObw80VULWNJlbhv85uqogIuoeptB7lTRzVRWvCSsa1tWqtY1+PmropEUyze9n5TnDB0rsxMsOoyNdZedz3erbq30Ks5oE7L3eNMRCDB0Gp5MEceSlBtn37THNCbi/785hvX4+AJTvxbLTkjlgzmeSSzf7UkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723957805; c=relaxed/simple;
	bh=0VUsSMuvct4Vgg2CDgQmNLiCJnxpuH6p1LTNIjI9Ef0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHFpEuVjPR/yFtiM88/HnQK71IBIgDTdfz697KXLRZsYArMQJZvk3mHqzmFEDN4mglvu8zarjNIdkvV9+8K7d1ph6CkeYPnWKvm8gjn6usFsHl2jMGYRz/iowRIbhtBVyVN02vBrsWT5PkXc1NwkggBifVX7DLzvRDZqQxq1D/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4AhguuB; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4AhguuB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723957803; x=1755493803;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0VUsSMuvct4Vgg2CDgQmNLiCJnxpuH6p1LTNIjI9Ef0=;
  b=U4AhguuBZp8Z2Em+eheu9Eu7o89c4DlI8vYf78JZJWgwBWc4z6Sx/I1q
   1cDbWf1K6zPXQuVsfKR6uc0eK1+zxK99y9Q23IoxQcew3GgWdr8snFam5
   kexj44UJaXBM0+PjUHVilz/si7Ol7dIhBy6L3J4WU9Pjg5NixV2bQ+Ehb
   +BobC5iln7xZuJe/6W+Ae2eklKPYRON79cegHqt2+HlB3CSH8pg1k80tA
   bVrzHyH5P0BkubeETl40B5DbeBqxHUj+r80Vpvbf+493GOGfLafajNRDi
   wHB0iQKQhgwck/oB0rL1wEw52BVL/wNDfoMSEuM6YfXf99qFtjhNx26NP
   w==;
X-CSE-ConnectionGUID: sDj7N686RY2YJfivGbU4jA==
X-CSE-MsgGUID: R/rVZ62yTL6c+L17Tmkj0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="13074937"
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="13074937"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 22:10:03 -0700
X-CSE-ConnectionGUID: Hi3ke6+KSmqXKmvTStzwsw==
X-CSE-MsgGUID: ZfnZSCBGQZSIEwR3eh3L7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,156,1719903600"; 
   d="scan'208";a="90796538"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Aug 2024 22:10:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfYAw-00081y-22;
	Sun, 18 Aug 2024 05:09:58 +0000
Date: Sun, 18 Aug 2024 13:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 09/11] drm/i915/gt: Isolate single sysfs engine
 file creation
Message-ID: <202408181214.RVdNLhTm-lkp@intel.com>
References: <20240817210026.310645-10-andi.shyti@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817210026.310645-10-andi.shyti@linux.intel.com>

Hi Andi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip drm/drm-next drm-exynos/exynos-drm-next drm-misc/drm-misc-next linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Shyti/drm-i915-gt-Move-the-CCS-mode-variable-to-a-global-position/20240818-050310
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240817210026.310645-10-andi.shyti%40linux.intel.com
patch subject: [RFC PATCH v2 09/11] drm/i915/gt: Isolate single sysfs engine file creation
config: i386-buildonly-randconfig-004-20240818 (https://download.01.org/0day-ci/archive/20240818/202408181214.RVdNLhTm-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408181214.RVdNLhTm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408181214.RVdNLhTm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/sysfs_engines.c:509:7: warning: variable 'err' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     509 |                 if (!kobj)
         |                     ^~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:541:9: note: uninitialized use occurs here
     541 |         return err;
         |                ^~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:509:3: note: remove the 'if' if its condition is always false
     509 |                 if (!kobj)
         |                 ^~~~~~~~~~
     510 |                         goto err_engine;
         |                         ~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/gt/sysfs_engines.c:505:9: note: initialize the variable 'err' to silence this warning
     505 |         int err;
         |                ^
         |                 = 0
   1 warning generated.


vim +509 drivers/gpu/drm/i915/gt/sysfs_engines.c

7a0ba6b43bc0b00 Chris Wilson 2020-05-14  486  
54b2887ff521b0c Andi Shyti   2024-08-17  487  int intel_engine_add_single_sysfs(struct intel_engine_cs *engine)
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  488  {
d2a9692ad4295e2 Jani Nikula  2023-03-09  489  	static const struct attribute * const files[] = {
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  490  		&name_attr.attr,
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  491  		&class_attr.attr,
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  492  		&inst_attr.attr,
6e57cc39420c1d1 Chris Wilson 2020-02-28  493  		&mmio_attr.attr,
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  494  		&caps_attr.attr,
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  495  		&all_caps_attr.attr,
062444bbc6859db Chris Wilson 2020-02-28  496  		&max_spin_attr.attr,
72338a1f5ef8a48 Chris Wilson 2020-02-28  497  		&stop_timeout_attr.attr,
9a40bddd47ca4aa Chris Wilson 2020-02-28  498  #if CONFIG_DRM_I915_HEARTBEAT_INTERVAL
9a40bddd47ca4aa Chris Wilson 2020-02-28  499  		&heartbeat_interval_attr.attr,
9a40bddd47ca4aa Chris Wilson 2020-02-28  500  #endif
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  501  		NULL
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  502  	};
54b2887ff521b0c Andi Shyti   2024-08-17  503  	struct kobject *dir = engine->i915->sysfs_engine;
54b2887ff521b0c Andi Shyti   2024-08-17  504  	struct kobject *kobj = engine->kobj;
54b2887ff521b0c Andi Shyti   2024-08-17  505  	int err;
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  506  
54b2887ff521b0c Andi Shyti   2024-08-17  507  	if (!kobj) {
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  508  		kobj = kobj_engine(dir, engine);
4ec76dbeb62b5f8 Chris Wilson 2020-02-28 @509  		if (!kobj)
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  510  			goto err_engine;
54b2887ff521b0c Andi Shyti   2024-08-17  511  	}
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  512  
54b2887ff521b0c Andi Shyti   2024-08-17  513  	err = sysfs_create_files(kobj, files);
54b2887ff521b0c Andi Shyti   2024-08-17  514  	if (err)
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  515  		goto err_object;
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  516  
54b2887ff521b0c Andi Shyti   2024-08-17  517  	if (intel_engine_has_timeslices(engine)) {
54b2887ff521b0c Andi Shyti   2024-08-17  518  		err = sysfs_create_file(kobj, &timeslice_duration_attr.attr);
54b2887ff521b0c Andi Shyti   2024-08-17  519  		if (err)
54b2887ff521b0c Andi Shyti   2024-08-17  520  			goto err_object;
54b2887ff521b0c Andi Shyti   2024-08-17  521  	}
1a2695a7465971f Chris Wilson 2020-02-28  522  
54b2887ff521b0c Andi Shyti   2024-08-17  523  	if (intel_engine_has_preempt_reset(engine)) {
54b2887ff521b0c Andi Shyti   2024-08-17  524  		err = sysfs_create_file(kobj, &preempt_timeout_attr.attr);
54b2887ff521b0c Andi Shyti   2024-08-17  525  		if (err)
54b2887ff521b0c Andi Shyti   2024-08-17  526  			goto err_object;
54b2887ff521b0c Andi Shyti   2024-08-17  527  	}
db3d8338bacbfc7 Chris Wilson 2020-02-28  528  
7a0ba6b43bc0b00 Chris Wilson 2020-05-14  529  	add_defaults(container_of(kobj, struct kobj_engine, base));
7a0ba6b43bc0b00 Chris Wilson 2020-05-14  530  
99884adbcf06963 Andi Shyti   2024-08-17  531  	engine->kobj = kobj;
99884adbcf06963 Andi Shyti   2024-08-17  532  
54b2887ff521b0c Andi Shyti   2024-08-17  533  	return 0;
54b2887ff521b0c Andi Shyti   2024-08-17  534  
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  535  err_object:
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  536  	kobject_put(kobj);
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  537  err_engine:
54b2887ff521b0c Andi Shyti   2024-08-17  538  	gt_err(engine->gt, "Failed to add sysfs engine '%s'\n",
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  539  		engine->name);
54b2887ff521b0c Andi Shyti   2024-08-17  540  
54b2887ff521b0c Andi Shyti   2024-08-17  541  	return err;
4ec76dbeb62b5f8 Chris Wilson 2020-02-28  542  }
54b2887ff521b0c Andi Shyti   2024-08-17  543  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
