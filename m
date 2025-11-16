Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE4729CE1;
	Sun, 16 Nov 2025 01:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763257699; cv=none; b=cpcWJMi1PLlLvXrAqe4hPot/ndIqsaaDGJNZL3uppF0zznqnUXXUgI+RI8rnUQVb+B1f6tG25XT1I7vTLIq0sYgJHlrg+ONPanvrElZBu1raJD3UdxwwRGpyQnVEqhMRdGZQ+HyHhpnyY0F+MO5ICWHLeVyHlrG8mxfxvxzLCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763257699; c=relaxed/simple;
	bh=3UEeAR1C0FviiJNAAm40kI+zcmWiQ18t5O8ABNigF2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dgRBUMTtsbfOQ3R6Z0e93U9Wwnzpa0xG0dp7eknwdpvwLYdBYJcAbkqTcH3+r6BtHUH33Ulf71FpoGVjYPGYrJ70VlvVYtUmqckE+3iYvm4QctLPe//bBp8VClToFKUTdH7+zmoXam4fc5KFOn3qdaPukz3mUCm1xfp5IU9cYqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6Wg2bmQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6Wg2bmQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763257698; x=1794793698;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3UEeAR1C0FviiJNAAm40kI+zcmWiQ18t5O8ABNigF2o=;
  b=J6Wg2bmQ3GWlF6QKrqQm4AZfKdHT9a7ZpB8eopId/TGAIahzd6wT/9Yo
   1k58T/p6gQ8aD5r6u/L+EGPwOGL4qaPBnQcedo7pEqFp7Z9qkEDLo7sag
   K0dDhHqQ21G8zqdSq7U0Gth1l4I1FLWENrhoi68e06lEh2uYTPM+3Cnn/
   V0NbdlOrO02j5FIt2+cWr2Buj6YuD4xotEPTwx1DZCv7S5L0gyEnB0E+z
   hMz4P+Nh5n/m6/yDk/chtQQmuc92eDSeyYjQdviHQGwVCBq6Yy0x2e1OM
   vqV4xITtxnYP/U8RGTa0iZavLKoQazR9BCeRDoJjhJyOJeqHRNW6RsjG/
   Q==;
X-CSE-ConnectionGUID: h8IEwuuNRbmUslm5RbJ/+w==
X-CSE-MsgGUID: Dv4dGmnjRCiW6ASp84HPfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11614"; a="52871567"
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="52871567"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2025 17:48:17 -0800
X-CSE-ConnectionGUID: LEUHUGh2TwyHqWba+0XJYQ==
X-CSE-MsgGUID: nh+hnXILRSWwn7dfi9jPYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,308,1754982000"; 
   d="scan'208";a="194449485"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 Nov 2025 17:48:15 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKRsD-0008Pz-29;
	Sun, 16 Nov 2025 01:48:13 +0000
Date: Sun, 16 Nov 2025 09:47:17 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: ld.lld: warning:
 src/consumer/drivers/gpu/drm/panel/panel-samsung-ld9040.c:241:0: stack frame
 size (8344) exceeds limit (8192) in function 'ld9040_prepare'
Message-ID: <202511160915.0YMqUcYM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f824272b6e3fe24950abc527136e8140f67b0b23
commit: 020d7f14489b8bc38c6bd4c5b3c25262e8b6de63 Revert "kbuild: make all file references relative to source root"
date:   6 months ago
config: x86_64-randconfig-122-20251115 (https://download.01.org/0day-ci/archive/20251116/202511160915.0YMqUcYM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251116/202511160915.0YMqUcYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511160915.0YMqUcYM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ld.lld: warning: src/consumer/drivers/gpu/drm/panel/panel-samsung-ld9040.c:241:0: stack frame size (8344) exceeds limit (8192) in function 'ld9040_prepare'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
