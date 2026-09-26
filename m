Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A80C137923;
	Sat, 26 Sep 2026 03:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790392117; cv=none; b=fHpVweXAiRdhwT36zIelD6nXKI/HNzffGtweA3/cKCy6+jtmFMyB9GlQkn9zxCaKZhyeStLQX5ZBbWhKVwR4UyjP7PnI/sJHgnIt/eKVL9Lc/nQt7eycBUL4oh0Xy3Fow1AoehBPhkoM8WaOspSrZ5PU53IttrISkMg/FqNTWLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790392117; c=relaxed/simple;
	bh=3b4Lb2RG/5+PSRbSxAI4S75iie0OhEdBaB+8dLBlJd0=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RwBa2b+Zsk/lRiWgZtPOvquCGDmtvEcQ1ocQ319DBTi7Oy/vXd2PbBzv9hihRdnhyUhojRyOT4tfY56Dm7mnFpHYOrPl32dRT6E1KH3+ZUtrdfzRe1nbwGwZ4ZwUQw4uLggC+7uOVNzb3E0xLB5HixUSXW9BVvM84R1r5m+XNss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmUsJKwV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmUsJKwV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790392116; x=1821928116;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=3b4Lb2RG/5+PSRbSxAI4S75iie0OhEdBaB+8dLBlJd0=;
  b=ZmUsJKwV1u+Tj/1L4AjrZy33WnIWVIajIfaFP0ILmexOgb6ieKVNXnSz
   cIMJnQRomsHj3EY9kp7EukJWZWbmOv3bl66wvYSIXYTTFyUhCwAGf7lv5
   NVJtKpX0lttjBGIsRDiGs0ElvAW7UXTS2y5z+yKOB/ELZtF2TfQ93L5ye
   n+B5obtZf8gLkalPhZVowK22MgVsWwiFYR6BiRPoaJuuqhmbiRcLNsk2w
   GVa2V4V8bevO7LY6nDc4PxQw+m8YwVoTRQ4SNAvb6IZga+4Yui4G9/kOH
   jkGhkezHODWSIE0f2s1GILTA4iSF85W/XaQwOYxU3x8fn8DhWUTL5Qc5v
   Q==;
X-CSE-ConnectionGUID: RNdCMcjqSEWQL8ZRVSvz+Q==
X-CSE-MsgGUID: EJmdMoruTVOeAvt9mbeg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="78739703"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="78739703"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 20:08:35 -0700
X-CSE-ConnectionGUID: /SdyuF8SQ+6L3DxGPe+nbQ==
X-CSE-MsgGUID: 32Cm9iN8Qha/kX8Ey82UFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="273701696"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2026 20:08:34 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAIm8-00000000LSn-1w6X;
	Sat, 26 Sep 2026 03:08:32 +0000
Date: Sat, 26 Sep 2026 11:08:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re:
Message-ID: <202609261019.YS534QjM-lkp@intel.com>
References: <202609261019.YS534QjM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202609261019.YS534QjM-lkp@intel.com>

Hi Uwe,

kernel test robot noticed the following build errors:



url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig/Add-TAINT_DRIVER_OVERRIDE-for-usage-of-driver_override/20260925-202040
base:   
patch link:    https://lore.kernel.org/r/202609261019.YS534QjM-lkp%40intel.com
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20260926/202609261019.YS534QjM-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 78ff5215e53a117851dc6e81e793a106f1a79df8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609261019.YS534QjM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609261019.YS534QjM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/bus.c:516:19: error: use of undeclared identifier 'drv'; did you mean 'dev'?
     516 |         add_taint_module(drv->owner, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
         |                          ^~~
         |                          dev
   drivers/base/bus.c:510:53: note: 'dev' declared here
     510 | static ssize_t driver_override_store(struct device *dev,
         |                                                     ^
>> drivers/base/bus.c:516:24: error: no member named 'owner' in 'struct device'
     516 |         add_taint_module(drv->owner, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
         |                          ~~~  ^
   2 errors generated.


vim +516 drivers/base/bus.c

   509	
   510	static ssize_t driver_override_store(struct device *dev,
   511					     struct device_attribute *attr,
   512					     const char *buf, size_t count)
   513	{
   514		int ret;
   515	
 > 516		add_taint_module(drv->owner, TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
   517		ret = __device_set_driver_override(dev, buf, count);
   518		if (ret)
   519			return ret;
   520	
   521		return count;
   522	}
   523	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
