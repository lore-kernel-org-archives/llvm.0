Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D5E221739;
	Tue, 24 Jun 2025 08:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753718; cv=none; b=H2Qb2My0HE9rYm6tdGofef1ukJzZSysiSKwpggjmcsP4Pmsbcd5+pJnQQotBf+/NhGg+ufYU6dACLjjc3sxFZtTGj05uHdEi6Js1wKOxPkYPAu8MP56NbG47uJyEVTZlGNS4ul4vgwn/kQaCVSpfoADA1vjYLpIwAZKz0a9s37k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753718; c=relaxed/simple;
	bh=Id5yTpaaqBX6iMI2PirKUiHumztlp7VutX+hbTaQYsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSF7eq2A4yFrUXFClDMtxQcSzIxO4u8TNGgD2+E2pgPQJ45ilHbKHU3tJdZ67jejuLpR4pvdM8PfHDfs74Edb9CeqYWJVUMu68LL7rtrMcQuPpFd4u1aqyQ+lJS33vh/fLTJbgMoYGKPdUpkqLL+4yijyDAagxYSuzIYlr2oOY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bf097zHC; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf097zHC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750753716; x=1782289716;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Id5yTpaaqBX6iMI2PirKUiHumztlp7VutX+hbTaQYsQ=;
  b=Bf097zHCJkzorLOQYW8ToORMEu+lgDlc9oHn64D3bSlAOfpEM5kbfcWT
   Uv+Rry6HIg7VQG636Y6XbAKYYmQBXJ5PjjmILWylbfE/AOWUDHrhvWJn5
   w9La0/QdxOFKObU8dbZzRCowk5l/1kMuJ/xXh22MjJyturwKMPbFatzuM
   4+61oopTtBV5Ot3YtZK/U6daiHZwOHHo8FS/FlMCTOk81KRCOJqjqetJv
   OZzOtkoXRf0PrTxjWKFChHxq1DyZPlmmbA2PM93hOwwTQo3/egtrRWH4M
   DaCLkYiSQqlO8VBel5m13E5TRQRVSpfltyVefP5S4B3vZYElXUd/AF2jP
   g==;
X-CSE-ConnectionGUID: zS8nMAKDRZ23gB7G8RtO9w==
X-CSE-MsgGUID: TaSc1aAaThaQoVxmgBGxEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56789525"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="56789525"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 01:27:53 -0700
X-CSE-ConnectionGUID: zONtlBHsR5eeHXrXUg910w==
X-CSE-MsgGUID: tWuxLp1GRaCEVNGQ957YgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="189049714"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 24 Jun 2025 01:27:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTz0O-000RvC-0m;
	Tue, 24 Jun 2025 08:27:48 +0000
Date: Tue, 24 Jun 2025 16:27:37 +0800
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
Subject: Re: [PATCH v5 01/16] drm/sched: Add some scheduling quality unit
 tests
Message-ID: <202506241624.QXKeEwYU-lkp@intel.com>
References: <20250623122746.46478-2-tvrtko.ursulin@igalia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623122746.46478-2-tvrtko.ursulin@igalia.com>

Hi Tvrtko,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next v6.16-rc3 next-20250623]
[cannot apply to linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Add-some-scheduling-quality-unit-tests/20250623-202942
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20250623122746.46478-2-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v5 01/16] drm/sched: Add some scheduling quality unit tests
config: i386-buildonly-randconfig-001-20250624 (https://download.01.org/0day-ci/archive/20250624/202506241624.QXKeEwYU-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506241624.QXKeEwYU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506241624.QXKeEwYU-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__divdi3" [drivers/gpu/drm/scheduler/tests/drm-sched-tests.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
