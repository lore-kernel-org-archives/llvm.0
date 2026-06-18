Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891C5281503;
	Thu, 18 Jun 2026 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792185; cv=none; b=h2rQ/9tLbA2R60aqRiBMauyCd+jdcoY71L3dtth/ZzNyZMc9KY+R2N6koGQN83osLKAyR4LxoxKnpc81jFlEeV7zQg/Ovqm9ML5E9rdRo20ipJ4uYHy/r2NHyzOxaBNtdt9coiU7KWelfoN9EMoGcRETvh1Dfxlxwmk4LSY4qqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792185; c=relaxed/simple;
	bh=Nrf+TCIYqU4QQRG2clM80kXtnrGxhZyrzDPenxD1Wxo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n+gndADrHU0qmVXjI8kUJgchSyio62+w6TMo1BAtVdcRQgZJFKWK5WWeHDP/CqVoMVtjBoVw2bB6DGBqZBtFfFdtc2b4FuoaLtmhmpMurGQYZQQwYnaCsBrdvo0uZInUZNeZMTA4INiE5M9dfrkzIc3OcDHquXPbpsp8jnW1rsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HDeTMc5D; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HDeTMc5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781792183; x=1813328183;
  h=date:from:to:cc:subject:message-id;
  bh=Nrf+TCIYqU4QQRG2clM80kXtnrGxhZyrzDPenxD1Wxo=;
  b=HDeTMc5D06DSARdlO9iLrHH2ORDb9s0TRFBQSe7oknPymukg2CH0HTTe
   dAK+jaMrkaNyXySwgcetoNo10aaQ6A6ZMqzv/u6l1mNyNaebPl5owoCNZ
   7io1Ra1bQPTle122clv2BrProC8/+oZjGrmPFkFG3dipMIvzU5BB4RLus
   +y8CgVW16yJ7as+uL3vwKLGMPQDc7ZFXN/7iumSm0JwUnGT/JQsI8EvnM
   3SHMAHjW/V9ET9lcRzLeMucZN8GIAd3qPkEu0Nz5GyLM64JpnhVkWvNd4
   PL7aWvK4agnH4DCjmLB8BnwoQNnSZGABg1ydeVtGF+6/efbOkFk1naigm
   w==;
X-CSE-ConnectionGUID: E/OZ25OyQniC4jzaTe8ggw==
X-CSE-MsgGUID: r89J7GAvRHKcasMj8ADyCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="105429463"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="105429463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:16:23 -0700
X-CSE-ConnectionGUID: zw9HKaF7Sk6I3r6pQnO51A==
X-CSE-MsgGUID: 8opIsg68ThGZVb9W9pKGBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="248457444"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2026 07:16:22 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1waDXX-000000005WX-2ccY;
	Thu, 18 Jun 2026 14:16:19 +0000
Date: Thu, 18 Jun 2026 16:15:39 +0200
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-7.1.y 64/64] .gitmodules: warning: ignored
 by one of the .gitignore files
Message-ID: <202606181615.RpIJtU29-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.1.y
head:   dbb4f6bd9fe8a1786673783249095632aff93442
commit: dbb4f6bd9fe8a1786673783249095632aff93442 [64/64] ODROID-COMMON: net/wireless: add Realtek Wifi drivers
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260618/202606181615.RpIJtU29-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181615.RpIJtU29-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181615.RpIJtU29-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> .gitmodules: warning: ignored by one of the .gitignore files
   Documentation/.renames.txt: warning: ignored by one of the .gitignore files

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
