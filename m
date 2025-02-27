Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9025B2356C9;
	Thu, 27 Feb 2025 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740666827; cv=none; b=IdO/0M85mxhkbyG/KDU1aRUMqEpG0pKvWc4AWnk4snhCOneJGVihYmSIl2oKWsLRJameJIkll+RmHO1kUDrzLApTpIKzwariUd9ZAybbtm0OicX0FC507kywb08B0Z+OyoNBr8kIlpL3R7HjUncw1Y6ir3IlQC7DPKBc460t9cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740666827; c=relaxed/simple;
	bh=ix+N2Wxtfqde7gfW+kSRYjbGZltIvKj4UMMv7v9T3nk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RocjYN1ML2VRfEG3dWJFp3ANhOmYl+NzIGv3BWJUFgOZYZeP2Lfq+3Cwnc93ak2dg5BxS9JNLbG0+5iBVIij4bskbRPQMeeBIFlhC/fbEwlpk7YrkTxGHBQ1iNEFnnO7ZzEaPvhDOAQJzPqYpCI6KHyNDZtMLIvBPI8CLhWYCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YBr5FY4e; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YBr5FY4e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740666825; x=1772202825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ix+N2Wxtfqde7gfW+kSRYjbGZltIvKj4UMMv7v9T3nk=;
  b=YBr5FY4e3tZRiVc4GRtSrEMsGNHIB3LtKQFeNf8HKLwk6p+xCX+cwXBn
   n4rQsDtGWMpNuglUfOhLHemv0DYarB0ufYeKkqOfe+fNL5jxfHeqEEenB
   sa+tybMorVmZGh/VAVsdtcOBSGsA7h7DDpa3K+qrCm3mgu5GG4MFLrs4/
   3q15vjE/AnoCEbT9jUVrpUoeniQi3IMwX86LJOhsWm6ziuW2dz+vk3h10
   b+yNPh9qSikKircPhg9rXqnxbGcOThmYd8tXfdHRTj5/mqeFg20cnOLZt
   RUkdQHSGdh7ED3HTjaSwj2UMtxRbXFybOlac2au6vWzrhhfMEQCkbla0c
   g==;
X-CSE-ConnectionGUID: 8W7bIdvYT9uLZvnznSgz6w==
X-CSE-MsgGUID: m6htzhyCQWKoE+6yNjCmSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52198679"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="52198679"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:33:45 -0800
X-CSE-ConnectionGUID: TAV0VCpRQ++2o6hVM5p10w==
X-CSE-MsgGUID: sfbU298BSEqcygfd779uvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="122162601"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2025 06:33:28 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnex3-000DUe-2l;
	Thu, 27 Feb 2025 14:33:25 +0000
Date: Thu, 27 Feb 2025 22:31:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/sev_cache_opts 3/8] drivers/gpu/drm/drm_cache.c:96:2:
 error: statement requires expression of scalar type ('void' invalid)
Message-ID: <202502272232.xwSh2xAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/sev_cache_opts
head:   0abca5ad72cf2bc8ebbb6b93be9a5c768f463d48
commit: b22d24de1a0c63c93b5f8d0b2971fe73a2c7a7de [3/8] x86, lib: Drop the unused return value from wbinvd_on_all_cpus()
config: i386-buildonly-randconfig-003-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272232.xwSh2xAq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272232.xwSh2xAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272232.xwSh2xAq-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_cache.c:32:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/drm_cache.c:96:2: error: statement requires expression of scalar type ('void' invalid)
      96 |         if (wbinvd_on_all_cpus())
         |         ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_cache.c:142:2: error: statement requires expression of scalar type ('void' invalid)
     142 |         if (wbinvd_on_all_cpus())
         |         ^   ~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_cache.c:175:2: error: statement requires expression of scalar type ('void' invalid)
     175 |         if (wbinvd_on_all_cpus())
         |         ^   ~~~~~~~~~~~~~~~~~~~~
   2 warnings and 3 errors generated.


vim +96 drivers/gpu/drm/drm_cache.c

c9c97b8c750198 Dave Airlie     2009-08-27  89  
c9c97b8c750198 Dave Airlie     2009-08-27  90  #if defined(CONFIG_X86)
906bf7fda2c9cf Borislav Petkov 2016-03-29  91  	if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
c9c97b8c750198 Dave Airlie     2009-08-27  92  		drm_cache_flush_clflush(pages, num_pages);
673a394b1e3b69 Eric Anholt     2008-07-30  93  		return;
673a394b1e3b69 Eric Anholt     2008-07-30  94  	}
673a394b1e3b69 Eric Anholt     2008-07-30  95  
b04d4a38c0691e Ben Widawsky    2014-12-15 @96  	if (wbinvd_on_all_cpus())
499447db0ebf43 Joe Perches     2017-02-28  97  		pr_err("Timed out waiting for cache flush\n");
c9c97b8c750198 Dave Airlie     2009-08-27  98  

:::::: The code at line 96 was first introduced by commit
:::::: b04d4a38c0691e4467fa2988b6fe481bf759daaf drm/cache: Use wbinvd helpers

:::::: TO: Ben Widawsky <ben@bwidawsk.net>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
