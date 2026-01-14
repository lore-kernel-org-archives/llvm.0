Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8661634404E;
	Wed, 14 Jan 2026 05:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768366943; cv=none; b=Q4bh5t18I9J3JJSQoSljtp+ipCKod2oOwH8yTytUjdiOUeGU9T5v8cQYlGcetA1YpTN2gNBY2gRHvt7+pk/U7yhxpcTCCRYS7eC72VfkVIhAyhOeULM8WFer8up3JRjhuTimE2zjiFC4hNwBgIyAQ//4rd92lWQDnqzxJYMtGCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768366943; c=relaxed/simple;
	bh=wgfnafQvL9z6VnBmrRhDiO+cw43adcX73RKvY63uMGI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MLGps32vK5fOSHtiyk/izaf7u0cKCL/ocpyIKd8Xr+EojPkmYfk1Lp3YOmGapr9t/j+FNXTQCfaiE016ubzFaM4hKGZViaP0Fa0NBskHpHP8ggmIrxNH+EI5bbzSt2/X/fmE+gtNfMvurVR3MMhNP+0H/0K/Eml8jqEq45cnnLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gV7t9cxR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gV7t9cxR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768366938; x=1799902938;
  h=date:from:to:cc:subject:message-id;
  bh=wgfnafQvL9z6VnBmrRhDiO+cw43adcX73RKvY63uMGI=;
  b=gV7t9cxRFYzhquFN2jqPjhPVjsn4MppRyOCEc6DEA2/yxlVq+bJeUX03
   j8ri+BJGpt3hKFoe5ObjoRUaliV4HfGVOmjpsloh5MqTA1EuEtAxm0q4X
   XYFQyfcodGDEtgP+QL65wuqgXzN8v1QuNQ+Rpmxf2FBW7ObC0bGrm4aDo
   pjVR6Vh4jTo38yYbIssdOLW6RnKTJNKJf2u1B/6N3w6tCkIk6x+tbBF4/
   BRX1kAsYdrSY6PaoDcAdRTpIzajL2q0ugrauNbq7JSlrO0PS5aSXVzbJH
   jdAz1e1bHKkNomKzmIMzGIgz31ka5q4BLuz02vpx9j2LeNw9TzI0gF91M
   w==;
X-CSE-ConnectionGUID: uXB99NfRTjeemkH/ZHySnA==
X-CSE-MsgGUID: mNmATYH5QmGsD98Subcp4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69580785"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69580785"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 21:02:13 -0800
X-CSE-ConnectionGUID: gEZhW+5HSNmBs9zv/mqYBw==
X-CSE-MsgGUID: l1MipLaiRVGjrQBVNShLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="205143464"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Jan 2026 21:02:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vft1E-00000000Fob-27oo;
	Wed, 14 Jan 2026 05:02:08 +0000
Date: Wed, 14 Jan 2026 13:01:27 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 7/14] ERROR: modpost:
 "tick_nohz_enabled" [drivers/cpufreq/cpufreq_ondemand.ko] undefined!
Message-ID: <202601141320.obOvjHTd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   8c562e5c98799c4f2ed88dfc1c3266a4d4e2e7a8
commit: 00bc1c67eb910e957c531c2ca30d49e0fcb34ca0 [7/14] cpufreq: ondemand: Simplify idle cputime granularity test
config: x86_64-buildonly-randconfig-001-20260114 (https://download.01.org/0day-ci/archive/20260114/202601141320.obOvjHTd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601141320.obOvjHTd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601141320.obOvjHTd-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "tick_nohz_enabled" [drivers/cpufreq/cpufreq_ondemand.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
