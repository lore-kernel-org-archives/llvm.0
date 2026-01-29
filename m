Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B7221F03;
	Thu, 29 Jan 2026 15:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769700726; cv=none; b=X4nWgKhUG9lb2F6gHLNVCx9R6H4QI2KxEOtTJe7PCcPY3rJ2jTEltEjFQPx/TuGk+YnVPbARq/Vp4WtEPql7g88xy7roktw63kVECCc2gOGArfjvrUhxs+Dg3/NNieddSZL8ZN8NpsVgcFd8BWLjB47nt+WJpd292Dr4tiAGhSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769700726; c=relaxed/simple;
	bh=tx1a6hVDs2C+zBF0dX1DYfUz0Cwwn2GhrdGkkynbK1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTTRBPepkO4m5Mr/5xyvNz3qV93Mp3Laf36g9kAxsnqwEK60IFfyeaO5/NTl3KDm4aj72YaCG4ELXLbCq9eIJQeienyOpo+1jtAtUmAvdxLXhaUhtLpQoQ9w3J0dK9+Xu8K6fmSRLIPglI4YBTutQzBtZn/uR1w8/vxVZIIQYIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1BU7386; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1BU7386"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769700725; x=1801236725;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tx1a6hVDs2C+zBF0dX1DYfUz0Cwwn2GhrdGkkynbK1k=;
  b=k1BU7386G2TzfvD2KyHyAT8Hp6VYsA0REzTFOxUki1iIhHrYOzUegLTJ
   4GOXh/NKWxXnR1HxdirW/iTUCxVn5CJVmfxH+nBJyykDArGYUjayBAHyr
   Mrq866Tp2Q7uFiA5tCWsKJjQ/pBKnRlwB4Qr6Q0sWB3xn7rnHxmJDnvhl
   BB0wa0qsfTXfBZ1goHkAoVFL/SjjaEtvkN+BJ6mNQGdaVQ825iUZuHCUd
   vg0bevlpwtf57xuVvVIJUL2pAByykz6CSMZABzKSQK/4OTAYMFWRs/jFC
   odc2qXsua7dQyZiaefthXbMjtg+Iiy/PtT7l45rXuMMkohmH+/cKBRAU2
   A==;
X-CSE-ConnectionGUID: BiQAdjFtTZ6xs1aCZBp+Zw==
X-CSE-MsgGUID: xiuyXY8uTQu7Zsj3LbwUFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71030329"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="71030329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 07:32:04 -0800
X-CSE-ConnectionGUID: I3WjL3VmQmiwttOUhHl1nA==
X-CSE-MsgGUID: QmPSDuctTo6D8z0D9/DTGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; 
   d="scan'208";a="239854587"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2026 07:32:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlTzx-00000000bae-2VDm;
	Thu, 29 Jan 2026 15:31:57 +0000
Date: Thu, 29 Jan 2026 23:31:09 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Subject: Re: [PATCH v6 06/31] drm/sched: Add some scheduling quality unit
 tests
Message-ID: <202601292335.YI2PBzhs-lkp@intel.com>
References: <20260128110806.38350-7-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128110806.38350-7-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-drm-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes drm-tip/drm-tip linus/master v6.19-rc7 next-20260128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-amdgpu-Reject-impossible-entities-early/20260128-191117
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260128110806.38350-7-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v6 06/31] drm/sched: Add some scheduling quality unit tests
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260129/202601292335.YI2PBzhs-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260129/202601292335.YI2PBzhs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601292335.YI2PBzhs-lkp@intel.com/

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
