Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7413539656D;
	Fri, 11 Sep 2026 13:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789132044; cv=none; b=FkqclnbwD38medjq5F1tu1mTLkCVwrPmA3hrwapzQ+YmRimpSCHEGBVgfpn2AZ068RlXaw4sHls3uN/L7qn6aQwmK4akWXrXTofWf8vtUSInE5UjzkATl5BjuofgvxFxaYJQIgyZDvAXFLeFBUUgk48wFISx8AwpDItCJHLNvGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789132044; c=relaxed/simple;
	bh=1J461Yc00JccHeFUbxXHGWkDGhvzpLc8v1nRYjanw70=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DSVbLGNpi6vpL0c8ZHqIr5lCCqk3u/HY1WLMtfMzSJVGSjiKg+I1TQbCJASi1oIqMPvgFaOTSqvh+CXR22K+2f4YMOCAP6Fleru7T7zxFHgG/ATAPPCujo7OhAZps7L/EjYl7eouOHPouLNRbggd/KDK9SnhcqPg6WRMMdXXIWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DpkqIQv8; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DpkqIQv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789132044; x=1820668044;
  h=date:from:to:cc:subject:message-id;
  bh=1J461Yc00JccHeFUbxXHGWkDGhvzpLc8v1nRYjanw70=;
  b=DpkqIQv8cdjISdl/vCjTJK240ktsP7k4lqg9PTck3IeETcjCtH0DX3k9
   f63GUDNqSyrFpj58jAdZQ/m52YLWhQ5b//BOas6KG2F6CeJBH3cp3daV1
   YO/vOUtSt0D7I2ru1DMt2Kod+FvmOnPFXGjxiURiyFrDTWW9oHr5ppVKJ
   yjuL/8jwO98fofFk/nSCk2yNd+O22bvZ/8IFjPPNnuwJJGwMN1OcjPXAU
   rgCvqebijoEUMWj9vzCuBhABoXyiBfU99yGwtxjyexEIJGecI70CgzIMe
   QY9IFda2RY/qLOX3BUTnsmR8RNprJZ7kqHSBjaDBqVWInDNrKci2Dpa5B
   g==;
X-CSE-ConnectionGUID: e6nhx8wwSzyR7XqTmuJraw==
X-CSE-MsgGUID: ANtI7iuxSaii3hSHKc9Qow==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="93460917"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="93460917"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 06:07:23 -0700
X-CSE-ConnectionGUID: surz1bwwSIib+Olyt/+t1w==
X-CSE-MsgGUID: 1mIFfnVhQ/isq/MeusCwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="295402410"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 11 Sep 2026 06:07:21 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50y4-000000001ZZ-2aNX;
	Fri, 11 Sep 2026 13:07:15 +0000
Date: Fri, 11 Sep 2026 21:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mukul Joshi <mukul.joshi@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Felix Kuehling <felix.kuehling@amd.com>
Subject: [agd5f:drm-next 602/670] error[E0063]: missing field
 `handle_free` in initializer of `drm_gem_object_funcs`
Message-ID: <202609112008.LquUrcGx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   9f725dd80ae781ac046420e0e53ffe5b3bcfa44b
commit: b67d2d039f645f266af8ec87e9af112ed6ef9140 [602/670] drm/gem: Add callback for when handle count goes to 0
config: arm64-randconfig-003-20260911 (https://download.01.org/0day-ci/archive/20260911/202609112008.LquUrcGx-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 96295a1412f9afbee9d4a3c2701e83f5a529a9cc)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609112008.LquUrcGx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609112008.LquUrcGx-lkp@intel.com/

Note: the agd5f/drm-next HEAD 9f725dd80ae781ac046420e0e53ffe5b3bcfa44b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> error[E0063]: missing field `handle_free` in initializer of `drm_gem_object_funcs`
   --> rust/kernel/drm/gem/mod.rs:265:58
   |
   265 |     const OBJECT_FUNCS: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
   |                                                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
