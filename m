Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D6B35B130;
	Thu, 23 Oct 2025 23:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761263146; cv=none; b=T6BdXYGRmJ4/pqP3D+D1jRoTMZKSd4VuYcFwEuI5MWEeP95W3NxOhlWP7T+JotdiUHlJTa3aD7dJdIVMqc95OUhG6R2FTbGpsPXTRqZFyR4/XmSJDt13tNijbcM8Akml3QOrr157QUY9dtBBBx1Uod29kGvxlvGrMTxcFtk+qWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761263146; c=relaxed/simple;
	bh=UN9o9S2vOXaFPu2d8jQ4pHsSzun2EI2pxvSUBqqwLFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LU5+R0Q3RZmObPHVTqGeVyMPWaPUX+Y8U/w26Veps3BQSE7ltuNEN3KbaWCjfen+x8I/NW5fwrasObcknkH/59wf7/JRJEVUxY+B/Z0iS4zBrr/hi/H9iDhNNFzeUFNp1GXmaOjp5cMfqL1xmkBNiKgqSJLideBUC7HKetkP13U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MbJDqGHB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbJDqGHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761263145; x=1792799145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UN9o9S2vOXaFPu2d8jQ4pHsSzun2EI2pxvSUBqqwLFA=;
  b=MbJDqGHBgQ3owVGLDbzMwQ5qycTagGKxwcpONaiiRHm7hxSvO6nnBhN5
   rVj+CUKsiI5Q1tgOhA8UuPEcfAWwVSw7YeSGHbEVoyJ6w8zKEF+jAQ24C
   rrpcSFgtYV3UuaKAhTiJzpxl0kpIyu1dOZsznZ6NKU2lpMZhVwQwErS+t
   oMGJRmxzhqKjdQvdvOVzL+2L2VUyYQPWu0Z4IIcj/GrLpuwOvrYL7pjT8
   DKiTkORO/lprPrIkKWoCc972yodzaeO9xwF7O5Tj86+jIapYxDNSEupQ+
   BKmfrEf4UnDReAw7kvaLtyi3QR2af1wFMhas4fhvKkdV4v0gxsV1ZNi3S
   A==;
X-CSE-ConnectionGUID: Qq7ahQPFSv6wiXg47OrL6Q==
X-CSE-MsgGUID: 4QMMHzzhQgi1os4LPg/Ufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74790918"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="74790918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 16:45:44 -0700
X-CSE-ConnectionGUID: F70XhnZXQlecmKVXiCoWEg==
X-CSE-MsgGUID: 5uTiptLKTZ2sfWRZydmpYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; 
   d="scan'208";a="185064452"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Oct 2025 16:45:43 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vC4zv-000DzN-1N;
	Thu, 23 Oct 2025 23:45:36 +0000
Date: Fri, 24 Oct 2025 07:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [akpm-mm:mm-nonmm-unstable 40/49] ld.lld: error: undefined symbol:
 hw_nmi_get_sample_period
Message-ID: <202510240701.eB6r97V3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   b0165d26ed76a1d8825e54ddc5c0b62db5113f13
commit: 5ec1304ad3434337b407db8e6e3bf6e2964c045f [40/49] watchdog: move arm64 watchdog_hld into common code
config: arm64-randconfig-002-20251024 (https://download.01.org/0day-ci/archive/20251024/202510240701.eB6r97V3-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251024/202510240701.eB6r97V3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510240701.eB6r97V3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hw_nmi_get_sample_period
   >>> referenced by watchdog_perf.c
   >>>               kernel/watchdog_perf.o:(hardlockup_detector_event_create) in archive vmlinux.a
   >>> referenced by watchdog_perf.c
   >>>               kernel/watchdog_perf.o:(hardlockup_detector_event_create) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
