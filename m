Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B51B2DB7B7;
	Mon, 12 Jan 2026 03:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768189437; cv=none; b=Vonx3J1O8JQ1KDoq3aZyEXZSppFtV7oOuuSeVuKUYi9siJTcHgyUnG7VZwQNZUPmTwSh04owebb5XqQwHGstJM0y3w+kiCtuLUR6D8UsJWKDl3FNasKKhJGcd6ldxLB5BTLjT+4lcqDbkRsbpmrtDFL4QzmZrnymeRYGvyfw3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768189437; c=relaxed/simple;
	bh=mq4EwdJ9gzcmKd7oqjtfIbPGtlwjuHDZPlEXpQnh4nw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qd0I2ly7pBr0/EqtS16hBsSsSbHGkMJMmFtMX9znfMH28HsdHQbwLoOCqjP3LcYvYoxF7DxBGpb3aTn9GgX6fjkqHKab3zA63lUiAu8srHaC6o4hVpr4f+B02ABKffVFHdNbIQIOuBFn7C+PtAMoY1bk3Pa1hk76ZvRlBHng/4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViePBrqv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViePBrqv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768189435; x=1799725435;
  h=date:from:to:cc:subject:message-id;
  bh=mq4EwdJ9gzcmKd7oqjtfIbPGtlwjuHDZPlEXpQnh4nw=;
  b=ViePBrqvYmjq1LmF3p6a2iraKD4Ihc5IvtsxWAPSm7IAoHdZS72dM1qN
   OKZ3056vHmka0LOa/VplRaIKcXHCLxVwNQkl3BmuwryxdkDo+Ht9hG8vJ
   beAawPl9dZFjI1CyqEu3k94nwkpbp+/Oxqqhfgrz4QU12a/UAiYr83AJN
   rBFz6Tf+wuxB3AzX1UqVKQV1zienfb9C6toZ56iy8c/STUHP6TgEJQWWt
   kbtLxiZofbVk1IIyyzchEZtbdhbh3v5/C6yYev9JUp/ZNauarrTf5VIHE
   FTGjjx2Vq+J0yDDH/5Ty5loNdcNUfq/7Miis0SdtTv/O3mqT81cZv6kvE
   g==;
X-CSE-ConnectionGUID: ylywCTWqQsOgNhqO+ymSow==
X-CSE-MsgGUID: dYTxOH1oTlKDTQVR5uIhTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69537740"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69537740"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 19:43:54 -0800
X-CSE-ConnectionGUID: WMdQcbUDTmuM+xKFrMlhzA==
X-CSE-MsgGUID: p9q4Ya2hR6Svdl0EZNrIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203889274"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jan 2026 19:43:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf8qM-00000000CxQ-1kR6;
	Mon, 12 Jan 2026 03:43:50 +0000
Date: Mon, 12 Jan 2026 11:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 2334/5095] ld.lld: error: undefined
 symbol: drm_connector_hdmi_audio_plugged_notify
Message-ID: <202601121128.HxqF2PMP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: c08c123d4cd6ec3ee482d607e29388d0db2d3f1d [2334/5095] drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers
config: i386-randconfig-017-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121128.HxqF2PMP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121128.HxqF2PMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121128.HxqF2PMP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_connector_hdmi_audio_plugged_notify
   >>> referenced by lontium-lt9611uxc.c:438 (drivers/gpu/drm/bridge/lontium-lt9611uxc.c:438)
   >>>               drivers/gpu/drm/bridge/lontium-lt9611uxc.o:(lt9611uxc_bridge_hpd_notify) in archive vmlinux.a
   >>> referenced by lontium-lt9611uxc.c:448 (drivers/gpu/drm/bridge/lontium-lt9611uxc.c:448)
   >>>               drivers/gpu/drm/bridge/lontium-lt9611uxc.o:(lt9611uxc_bridge_hpd_notify) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
