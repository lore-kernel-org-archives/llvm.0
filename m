Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8874C1BC3C;
	Thu, 27 Mar 2025 05:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743054653; cv=none; b=dSH5WwvVGJzUCUiPtHtJ9QoZy9InSJaSBXrQCRO7fp0UurNcXTxBctEHs2I6JsOBTF+QZ4fzq+fhVih16j3numeDusue4Tz79f3NyjpCBDQdqRhq1WOv1aqwt5gCjZIJnGaLEFZRRuNJp/UOsK+0t6RmdUBwlSUH5Es7Pwo6Bak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743054653; c=relaxed/simple;
	bh=kjxGxePqFK4+jxNMfiIo1rW7Pw9zfVMmHZbBFG8olLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kPYxk4lXyTEQKwrpLheL1vTMkdvkU1WyGBRMG0LvqGAt6r1Mu/xo6VTF0JtU7VZfp4c3iIt96uNIyOTXxy3ECl1gfPMJ6HLHzzSmW42e8lolM5WTiCOs0TevWM601aTlwQCKeqMr7tpBZD4/7EH1SE84bZqQ9yfaPLG89/ClDS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4jpvAS8; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4jpvAS8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743054651; x=1774590651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjxGxePqFK4+jxNMfiIo1rW7Pw9zfVMmHZbBFG8olLs=;
  b=I4jpvAS8PgFYU7eAPjordIuhZ8/uyvHjx3guDdEEz5Cmddt8Yb6LUkFA
   6yDrbe3h/HXDjKhzIfiM9yq8aUQeR7J3VB2lxvG0B/Jdvz49iVfVTbile
   3bV+Yzl+bbFuuE4+V2VEYBTY2+30Z+gjOJdzOIL7pNNEcBRx6pqj4wETr
   4zP0ld3rJR8IqikcNl6FQa0ZL0pK8aI5znH3yMeA4h+AOpBPdv1VlVJuG
   0Kalp36D+f9PvUsHoZ+hGhZKW4nD5tWCZITpGzbWcynBWIedjQPdIi+qE
   y16HQliwmW3vDmLd1ljZaA6eCM6Tub9unjAiIg3calh0HOtT76k6dH9Ys
   A==;
X-CSE-ConnectionGUID: MO6kYyDLTeeYZSrO00nWuw==
X-CSE-MsgGUID: +ClO/zntTBO1z5HRXLbdAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44490516"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="44490516"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 22:50:51 -0700
X-CSE-ConnectionGUID: vGR01uu2RPmHS5IX13JdTA==
X-CSE-MsgGUID: 2ikHRTgvRVGRFcZP00yDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="124800182"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 26 Mar 2025 22:50:50 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txg8d-0006PV-1C;
	Thu, 27 Mar 2025 05:50:47 +0000
Date: Thu, 27 Mar 2025 13:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 15/21] s390x-linux-ld:
 uapi.c:undefined reference to `kunit_fail_assert_format'
Message-ID: <202503271314.y9TiWMiT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   c1f41508dfc38dc5750d2b2c5b29f1f819ae053a
commit: 926e32cf9160e7403dbe68341e15fc5e583c1aae [15/21] kunit: Introduce UAPI testing framework
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250327/202503271314.y9TiWMiT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250327/202503271314.y9TiWMiT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503271314.y9TiWMiT-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-ld: lib/kunit/uapi.o: in function `kunit_uapi_run_kselftest':
   uapi.c:(.text+0x39e): undefined reference to `kunit_log_append'
>> s390x-linux-ld: uapi.c:(.text+0x5be): undefined reference to `kunit_fail_assert_format'
>> s390x-linux-ld: uapi.c:(.text+0x5f2): undefined reference to `__kunit_do_failed_assertion'
   s390x-linux-ld: uapi.c:(.text+0x63c): undefined reference to `kunit_fail_assert_format'
   s390x-linux-ld: uapi.c:(.text+0x670): undefined reference to `__kunit_do_failed_assertion'
   s390x-linux-ld: uapi.c:(.text+0x726): undefined reference to `kunit_fail_assert_format'
   s390x-linux-ld: uapi.c:(.text+0x77a): undefined reference to `kunit_fail_assert_format'
   s390x-linux-ld: uapi.c:(.text+0x7d2): undefined reference to `kunit_fail_assert_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
