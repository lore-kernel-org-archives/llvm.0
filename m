Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239D41D5CFB;
	Sun,  8 Mar 2026 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772964669; cv=none; b=Khoj3HTllKD121eKPDgcVNJgZKGP0oaj2Jr/fhnFzd9qmS2S/5BoHwXf0ZncnpoTwLv3AQ1Kxmgyx+IR9t84Qh+QJkjHvL13SBb9QL5npJlqvTa+Jv9uepUi9oRYOTBvZ+eOf+Un3JkpEB+AqBnHYno/XdQCyLp5Y6WRGT6UItk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772964669; c=relaxed/simple;
	bh=e7VQSTQMtLAY116kGpVCvwpkviv2oXrPqJ9NjU7r+sg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpuEquwQGBLVXOQx2jbbXlgP1+uih8YJ6kgFmChwZIB/4rTPKWLbchI5AIus7e9YlgqRa7JjS8a5p8hT5ohld6LDU+htXD8Jn7pGdF2GIQb28Z/y/1XIk59c3Lf7F8BEtG2yBb+QPSx6Xuv4khiZEE9JZ6+RkaqmyAetaKYulik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ftSQ9k8C; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ftSQ9k8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772964666; x=1804500666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e7VQSTQMtLAY116kGpVCvwpkviv2oXrPqJ9NjU7r+sg=;
  b=ftSQ9k8Cb9U0qMIg+TqtXYZopgosrR+FHyqyvpe8kT++33XlnA4ddLT3
   +w55d7uL4YLbOzAuXKJyBXKMQcm4bT6Gnz+N5HqZ3X5Nk4pFEPSXT5qS/
   CHbAwxqxOx7KYp4XWy+WIdt7mqV85dp2W7ihd80fZVDe99fBA7qVbdDMi
   VGY0Ly7hmSnMA5APc6Hn/EeH6FK8c1rQKqBlK8qUAI/aWknpaK5WDzX0o
   WlY1YA0IXFvySbMGWl3RAmij99Wmgp1nbIC73Zt79DIdq4feZYZiUTLVo
   rqZpEgNIAHfsINmN76rdLpO0HoisDuaivw4ZhZM/CNbt6o0nuVh1GFSzl
   w==;
X-CSE-ConnectionGUID: nfAdJyGUQ2S/aXTVE9GdRA==
X-CSE-MsgGUID: 3NzF5ZX2S2+aLVTO1ezFZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="74086087"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="74086087"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 03:11:05 -0700
X-CSE-ConnectionGUID: KcTc1s/DREKLcWZRphkk/A==
X-CSE-MsgGUID: poFTVjzPQcyjufj83ZmODA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="223572702"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 08 Mar 2026 03:11:02 -0700
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzB6A-0000000031R-3zWf;
	Sun, 08 Mar 2026 10:10:58 +0000
Date: Sun, 8 Mar 2026 18:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel-dev@igalia.com, intel-xe@lists.freedesktop.org,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Stanner <phasta@kernel.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v7 04/29] drm/sched: Add some scheduling quality unit
 tests
Message-ID: <202603081744.gNhsEN20-lkp@intel.com>
References: <20260306163445.97243-5-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306163445.97243-5-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v7.0-rc2 next-20260306]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Disallow-initializing-entities-with-no-schedulers/20260307-012142
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260306163445.97243-5-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v7 04/29] drm/sched: Add some scheduling quality unit tests
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260308/202603081744.gNhsEN20-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081744.gNhsEN20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081744.gNhsEN20-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/scheduler/tests/tests_scheduler.c:676:10: error: initializer element is not a compile-time constant
                                 drm_sched_scheduler_two_clients_attr),
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:224:13: note: expanded from macro 'KUNIT_CASE_PARAM_ATTR'
                     .attr = attributes, .module_name = KBUILD_MODNAME}
                             ^~~~~~~~~~
   1 error generated.


vim +676 drivers/gpu/drm/scheduler/tests/tests_scheduler.c

   672	
   673	static struct kunit_case drm_sched_scheduler_two_clients_tests[] = {
   674		KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_test,
   675				      drm_sched_scheduler_two_clients_gen_params,
 > 676				      drm_sched_scheduler_two_clients_attr),
   677		{}
   678	};
   679	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
