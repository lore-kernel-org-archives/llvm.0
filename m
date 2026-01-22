Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04D536B067;
	Thu, 22 Jan 2026 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080803; cv=none; b=ljMm7k+B28LKZs4WD1TRbqrulrnSMpABhfNs6doq39HARNzOCATv5sMV4hwljh1qikoerH1A2eW+hLV87eXc5dDHR64ok9Q5oizzxLznvlxfXOl2GRJrGBpIWyeRaJmSxeapiYDA7/j1n53Mcg1vdGk69CO9IK61rxKrRrubU5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080803; c=relaxed/simple;
	bh=sYYtJbpHq/Rs2GJAp4tp5M1NqdoxZFcLHWJApTGkNOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nba+83EeiH4GguSirUgzE6fp4wzoA5C2NAI0mvB+yxg1w4Th15RwzhX20GSyZmdOFljW7zep8gaLQwMsMKmywabumRd92fSYXB6qlfcIA/p1fZSVCsie94W/WtiU6X4R2YSMlkh4U/3sfNVYmAMPaOpmXYZHSTG5iLfzL7JlyIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MGObk5sn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MGObk5sn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769080802; x=1800616802;
  h=date:from:to:cc:subject:message-id;
  bh=sYYtJbpHq/Rs2GJAp4tp5M1NqdoxZFcLHWJApTGkNOM=;
  b=MGObk5sn21G20rGHmy4/F0hOvnOgG/4aRBAOrS2V28y/z0HR03c3xrvt
   yM+X74TZ1l9zT0KW/EKRanIWqHRcYme0fGGixk/1eAP/9DNiiGjUpqnbr
   Ordtba1dF2VhS7T3o0HH2uDpZ5I6PeSdtpjHLN+roE3eU1SCpd3HYpE/R
   N7KKVcZzgXoNPs9TGJ7Bb1ag6oVAslEamHE1ATWa19kgdsf3EbCXfiBPJ
   IciUbCXQeCI75jpRZXr0Hg66QlX+1WIBBfpAbvFJeNWDuzpa54nPIij1/
   6c8XviwuITHd4VLj79g3OWhmqHc2VQEMMFgytTs5tQ4jYix0h2iF7Giau
   A==;
X-CSE-ConnectionGUID: c+4D4iRtQ2yqfQEMPwzO/A==
X-CSE-MsgGUID: jLX9Vr+OTEu5cWrxO6cGfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80945457"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="80945457"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:19:59 -0800
X-CSE-ConnectionGUID: DgblU50cRey1s4NpJSGxbQ==
X-CSE-MsgGUID: 2vWx+TN+TzO6r7FrGo2/Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206316021"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jan 2026 03:19:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visjD-00000000Slr-1xiC;
	Thu, 22 Jan 2026 11:19:55 +0000
Date: Thu, 22 Jan 2026 19:19:37 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-6.20 19/20] ERROR: modpost: module
 snd-soc-cs35l56-test uses symbol cs35l56_set_fw_suffix from namespace
 EXPORTED_FOR_KUNIT_TESTING, but does not import it.
Message-ID: <202601221906.q8RWEtZF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-6.20
head:   be9d8d966447aeb8f0f8047503195bdd128ecd31
commit: d0ab89951197f0fc509a0cd732d830880e79c2d4 [19/20] ASoC: cs35l56: Add KUnit testing of cs35l56_set_fw_suffix()
config: hexagon-randconfig-002-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221906.q8RWEtZF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221906.q8RWEtZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221906.q8RWEtZF-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: module snd-soc-cs35l56-test uses symbol cs35l56_set_fw_suffix from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
