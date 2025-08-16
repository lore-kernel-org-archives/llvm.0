Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4342243370;
	Sat, 16 Aug 2025 23:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755386469; cv=none; b=XKRVpydEDgy8mbo9YT8RENFUyhpQSY0QwgQy3xN28lk+qamTAj0e7+fiC8+J44Ve20joCHcplxeXPxwQtF7+YChg+N6ljq8Zpn7UQOUT6HTfD7rUJi6Z8lDiifoyZV4tUH/1l4ebQBi1GnokrIcLLyU6I2+sKS9UR3nrdH/WKWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755386469; c=relaxed/simple;
	bh=DU2j/wqwniXJo+tFk1WY/PI+bO2fLqK+tuOtYEl8Bd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VeogzmH88D8YR+NvnSwXXku0ApFfASlxu+54gPbSloEJ9cgkLbyN/woyB3Es0G0tcOV57CKH2N4VF5ZLUFzO536K4eoiLeyio3ww5FtnoHADZ6/oV4EDu/RoSU6lrQe9DIj44EMkZ2pJemgGI5QlKfs4LVgabLkC0ouVgp2rwpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HSDKXgmZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HSDKXgmZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755386466; x=1786922466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DU2j/wqwniXJo+tFk1WY/PI+bO2fLqK+tuOtYEl8Bd8=;
  b=HSDKXgmZGtSl+rAfj7owZysFWixMvRO5OIK2QZlt7XZ+OX5RN5GqO0eX
   IlfoQmb/TXzf1164mXZ4OT0vthnwrSAqs5tVconQ2ZPSdA3Qg2KowZGQx
   Sk6lyMpRVk9Z5ZZbUcFHzD/p/gOS+j3zW4uYwYamPi5WKNsOG9xWo6leA
   +o5fywx9686LMIdmlWckGiXtgapYHc95Bxof/LDR98tmUBgEIbbwpiNFy
   UahyCdfF2QsaedeZzf+nRWyM5wBoxbEX2d8wIs4wSBut2/zSugVptg44Z
   I0AYKrl0mWWWiX41VunsQa+A4CP6PEIWqVHvuZzmA37Z1C31rojsAcoh3
   g==;
X-CSE-ConnectionGUID: MAIb8+y9SDeuCr7F9gfb1A==
X-CSE-MsgGUID: lEWS/GGrTxGW99FX9UAPiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="80239197"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="80239197"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 16:21:05 -0700
X-CSE-ConnectionGUID: bK+l1/lpQNCtgImcYn8wTw==
X-CSE-MsgGUID: ALcV1ipHTfKX9J0E+jAdbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172491159"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2025 16:21:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unQCh-000DGH-1x;
	Sat, 16 Aug 2025 23:20:55 +0000
Date: Sun, 17 Aug 2025 07:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: Clint George <clintbgeorge@gmail.com>, skhan@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Clint George <clintbgeorge@gmail.com>
Subject: Re: [PATCH] Fixed Spelling in cpufreq module in kselftests. Earlier
 it used to be "loops", now i made it "loop(s)"
Message-ID: <202508170740.9el3nJS7-lkp@intel.com>
References: <20250816124036.5786-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816124036.5786-1-clintbgeorge@gmail.com>

Hi Clint,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Clint-George/Fixed-Spelling-in-cpufreq-module-in-kselftests-Earlier-it-used-to-be-loops-now-i-made-it-loop-s/20250816-204247
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250816124036.5786-1-clintbgeorge%40gmail.com
patch subject: [PATCH] Fixed Spelling in cpufreq module in kselftests. Earlier it used to be "loops", now i made it "loop(s)"
config: arm-randconfig-002-20250817 (https://download.01.org/0day-ci/archive/20250817/202508170740.9el3nJS7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508170740.9el3nJS7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508170740.9el3nJS7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> tools/testing/selftests/cpufreq/cpufreq_selftest.txt: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
