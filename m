Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62B635963;
	Sun, 29 Jun 2025 02:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751165087; cv=none; b=pzjXEjkadyE1YcgR4adqLUNhM9Qtyx+byHev+LOpA/QrMawz+PEOZKgi2Ec7YKtPMviKGtQXRBjldZf9S+NEQXE9KJWtPFzVN5XcEaZXv8yCkPIgtKGqy+gWs4O/Z8Dl2eBcSr9fmJC8v2NGcHlnP8OjYuo5MkWDIWoHMIKQG6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751165087; c=relaxed/simple;
	bh=KGWwDtDBj04G8tisS60auApggIYJU3BgPxJSTQhkky0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=orYFgpFfR9jpbL4eu3hF45pT0Uaw4i+LS1aLpRrpduGjXJlpBwfq64PMDh4EHPixR2lS7FI5wCI1VrmWwvMIb2hWzkZlgNBFJvax7FrDw/QTTzdfMDsv6/9QDotB2SM7pQ6pMDBGXK+6pFaJ4e6UaQ0YP8ZfVJgjmhcQVOov+JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TI1yo65U; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TI1yo65U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751165087; x=1782701087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KGWwDtDBj04G8tisS60auApggIYJU3BgPxJSTQhkky0=;
  b=TI1yo65ULL56NHlVUIzz9hP9RNsaUvtHn/X8POvDErEjDRLKmy/LpYX+
   uv75qJp9CpHGnmb/eKQeczYLqr3Sr7Y+Fz1Z4AP3ucZZxgMH0XR2Yc/4O
   hmvfOp2GoNx6xNIHm9f4XYcfeEajXs3w3bhGddxBFOvWgLiN01vQqRR38
   v5K4fuUH2O9eGf8Hy2CQjmthE0KnQwltbJSG4kKQ5yixrEBosmLIPXi6n
   377R7dQz59prZLT01pl53uSCgTzCXVWew8eDF3XSXcyEQNNTyyUNhxHZn
   NOhzZHwxXGAwlwb22gSGVMjELX+WVSwzAeePCEOSqVdKHpbHP3uckfRjr
   Q==;
X-CSE-ConnectionGUID: p/f0APw0T2KT9uWYrfZdtA==
X-CSE-MsgGUID: 16VE99UTT7G2Pq/yguo3UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53295398"
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="53295398"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 19:44:46 -0700
X-CSE-ConnectionGUID: nzq6ns8QRSiRIz/HPXqAGg==
X-CSE-MsgGUID: LXUnskVlSOCSs742Kv9zUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,274,1744095600"; 
   d="scan'208";a="153308851"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 28 Jun 2025 19:44:44 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVi25-0000qh-07;
	Sun, 29 Jun 2025 02:44:41 +0000
Date: Sun, 29 Jun 2025 04:44:10 +0200
From: kernel test robot <lkp@intel.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <dev@lankhorst.se>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [drm-i915:for-linux-next 5/11] Warning:
 drivers/gpu/drm/ttm/ttm_bo_util.c:384 Cannot find identifier on line:
Message-ID: <202506290453.NeTXAb7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/i915/kernel for-linux-next
head:   05f3af5905d5dbb758db9dae0a103b22b441ad67
commit: 718370ff283284f191155a5eb9d4f376aaf93bb8 [5/11] drm/ttm: Add ttm_bo_kmap_try_from_panic()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250629/202506290453.NeTXAb7S-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506290453.NeTXAb7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290453.NeTXAb7S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/ttm/ttm_bo_util.c:384 Cannot find identifier on line:
    *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
