Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8390213E67;
	Tue, 29 Apr 2025 18:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952000; cv=none; b=YbnJsZNPnPU/Ppjol4NHC+Gy2xi0ZpeB7wfGUMZqYqx7g4qBv8ojJea4QYsW1C7zwl5lXPOyy73z0XZ2jMfRB8P4Dkp9QXgrMgjNcQYetKQdFg3s0epCYA9ktiS5e/7jO755vtI9dS9SrlTtAjnOCPfaeBZoKKk/bFGKLxeX0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952000; c=relaxed/simple;
	bh=4qy4I7VGvEmCy9gD5Fr0IDep138BqAEDPnMyr1tHWL8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IBKdix+52Z+BXnLu0JDsTDHaLLhl7GR50R3r/uAh3T5pBtej87OzFU5dKCD1+P5/+b76zNAXZU1s+LgdoaWk8/m0Lko/NgMnWZolh7X6SdlHz2vHBdSgryeEqc4zf0l0qt5JwfdvzOfuDse+cR+52sAeC02bh7JHHfuoOS9Ns9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhPyzVMA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhPyzVMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745951998; x=1777487998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4qy4I7VGvEmCy9gD5Fr0IDep138BqAEDPnMyr1tHWL8=;
  b=KhPyzVMAm+Fccho4i655W/BOSf2CAAsCNrD1HgSnumtdIFVZyfm+yBbl
   B7y8VcWEd06MqPlyxrtyZdm08eCrT8iKswKswOQL9AQravRJrExaidICv
   iaXxGajGy267y+SMm/zoLi5wOPi5DRpwZEYG/ApHGHyG7epoNlmTw68WW
   jYEyy6KnjL94tnOYGbF+YJT7VV6uUPSnS3HGWWuUR+yx/FTIY8kToU7em
   F2fNuXcTJJJ29Tyh4yxlr2PtmRg9PVcjhGEht4QCxzlDRFLwmPl0la4C9
   UuXvDXmsALAgndvwBJD4wct6l3xf9DEwb2MHEvUZQ/sikWC+s2ZGgebbK
   w==;
X-CSE-ConnectionGUID: tCVXIct9SuChG2go8gLJEw==
X-CSE-MsgGUID: oX5shtebQmafxWajP8nAJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47501335"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47501335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 11:39:45 -0700
X-CSE-ConnectionGUID: yTkuV3n/RpuLmdTLj65vvw==
X-CSE-MsgGUID: 2PY4/xmkRJ+A1vcr7bN3sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134227559"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2025 11:39:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9prq-0002qh-36;
	Tue, 29 Apr 2025 18:39:42 +0000
Date: Wed, 30 Apr 2025 02:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot/v6.15-rc3 100/110]
 include/linux/debugfs.h:419:2: warning: void function
 'debugfs_create_cpumask' should not return a value
Message-ID: <202504300247.bnFT3fxj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.15-rc3
head:   2cc3eff27207d40f181a59f04660a1e8e9746ff8
commit: 482d40a25255bb2c3df8cebda0f06cd2af2d4b95 [100/110] debugfs: Add stub to fix the build when debugfs is not enabled
config: arm-randconfig-003-20250430 (https://download.01.org/0day-ci/archive/20250430/202504300247.bnFT3fxj-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300247.bnFT3fxj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300247.bnFT3fxj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from block/blk-sysfs.c:12:
>> include/linux/debugfs.h:419:2: warning: void function 'debugfs_create_cpumask' should not return a value [-Wreturn-mismatch]
     419 |         return ERR_PTR(-ENODEV);
         |         ^      ~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/debugfs_create_cpumask +419 include/linux/debugfs.h

   415	
   416	static inline void debugfs_create_cpumask(const char *name, umode_t mode,
   417						  struct dentry *parent, struct cpumask *value)
   418	{
 > 419		return ERR_PTR(-ENODEV);
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
