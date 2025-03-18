Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2721DF743;
	Tue, 18 Mar 2025 22:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742337975; cv=none; b=lw2CUdtdj+NX+LfgOvt/4RUe96Cq9wz/VuV1qiEBpCzBsCxqTnVfhCTqdOd8IWNJuhRUQXfFWTxiCu8IBd4WeV3zpKHo+l187hYIq1jPlD0ut4vvjT9cz8ZM8lbcQM+iOFHotXT98aM3TRyduAi633AUYLGjp98Nl0zRSB/tJEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742337975; c=relaxed/simple;
	bh=/ZB048TTxFjGbfSmdaWd7vdz2Zt3EkISdjO8KGqJOk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CB/ID122gb7UHLF1413vHFmAQV66Esp0QUFyEpSd8+Qqp0rYg1CZOoLFStuTj7AFuNd92lw/KH9TNpxt5ZWkJNUGMLHrHM0d643bPRcItG34hq1nqRN0OaIGB2SEWG3n7jZ1NqmLO0uHzbG2fKmUUFPn9TZQrxtngW1Awr3VbS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OgCkbOBz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OgCkbOBz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742337974; x=1773873974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ZB048TTxFjGbfSmdaWd7vdz2Zt3EkISdjO8KGqJOk0=;
  b=OgCkbOBzzmHl2q9T+viGi/7DrW+nfo0pQPVcdw3m7HRkFsHpuCsLS+xJ
   HhchgJO4zszfyLC0nWGuA2oM8e0QpljaokGCmZB4+EKSoZ1glulljsScb
   cQBGy8Dnj2wY8vcPQZAE7dp9WyYK+tRPLrlDzNNxEUTq2uMPlidOItnWL
   CEcmaZXHMq3uDqb0OWCSKHQlMSvyks5HEvxZEfTG/KS4F6KN8I1I9d8jF
   h7HnBM0sxdDjk9iqJ1GYtmhkdVIkD54PMhPrLXDfjcwKmaBlJV/UTCI3A
   N+lYEANgY/u92hF2U9JOedr/4gMPSaoEp0YYs3suUsZ7fbrPONe9yadve
   g==;
X-CSE-ConnectionGUID: ZQfZulRFRHa+NHgBxDTTUg==
X-CSE-MsgGUID: oZdHfYE/Q7OFciabEem3+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="47391813"
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="47391813"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2025 15:46:14 -0700
X-CSE-ConnectionGUID: 1fp5lZqDSGqiwiEtY3UZ2g==
X-CSE-MsgGUID: vT6+gysNQAWzyhONbTBcfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,258,1736841600"; 
   d="scan'208";a="127509613"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 18 Mar 2025 15:46:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tufhK-000EDe-0v;
	Tue, 18 Mar 2025 22:46:10 +0000
Date: Wed, 19 Mar 2025 06:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:b4/plat2faux_dev 4/9]
 drivers/char/hw_random/arm_smccc_trng.c:113:56: error: use of undeclared
 identifier 'smccc_trng_available'; did you mean 'smccc_trng_probe'?
Message-ID: <202503190825.mKnUVJbM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git b4/plat2faux_dev
head:   14159d6574e30c1adeaa3460bd0abfae968987b2
commit: 870bdacafb24f3de9a81a35fc434862313f99ec8 [4/9] hwrng: arm-smccc-trng - transition to the faux device interface
config: arm-randconfig-002-20250319 (https://download.01.org/0day-ci/archive/20250319/202503190825.mKnUVJbM-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250319/202503190825.mKnUVJbM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503190825.mKnUVJbM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/hw_random/arm_smccc_trng.c:113:56: error: use of undeclared identifier 'smccc_trng_available'; did you mean 'smccc_trng_probe'?
     113 | module_faux_driver(smccc_trng, smccc_trng_probe, NULL, smccc_trng_available);
         |                                                        ^~~~~~~~~~~~~~~~~~~~
         |                                                        smccc_trng_probe
   include/linux/device/faux.h:116:49: note: expanded from macro 'module_faux_driver'
     116 |                       faux_device_unregister, __faux_devname, __init_condition)
         |                                                               ^
   include/linux/device/driver.h:260:36: note: expanded from macro 'module_driver'
     260 |         return __register(&(__driver) , ##__VA_ARGS__); \
         |                                           ^
   include/linux/device/faux.h:99:32: note: expanded from macro 'faux_device_register'
      99 |                                &faux_devname##_ops, init_condition)
         |                                                     ^
   drivers/char/hw_random/arm_smccc_trng.c:99:12: note: 'smccc_trng_probe' declared here
      99 | static int smccc_trng_probe(struct faux_device *fdev)
         |            ^
   1 error generated.


vim +113 drivers/char/hw_random/arm_smccc_trng.c

   112	
 > 113	module_faux_driver(smccc_trng, smccc_trng_probe, NULL, smccc_trng_available);
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
