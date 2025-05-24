Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EC27262D;
	Sat, 24 May 2025 19:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748116113; cv=none; b=h3jZ59tZdtTWl1EDxy/Y+tO0BkfiVvdCDVlX0zwQdlZOFZ7uXaGkbamwSK+GJR2P07fRykQZXUF6u9pjUGM/XKIOnQXq+ss942Oyz5z5TZYUlW6JDkl8dfzdQtSLxhyRx65R5U5ylGNhOE+Os/EtiCeC8bzSsiNlrY5awqZoKFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748116113; c=relaxed/simple;
	bh=90b1cueZOzqWA9EVgf0Vp27c+lqYEoVgA9jQdlDJkPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNz+6CPzacCS3k1vqoFugL34xb3GK4Xg3ccCE0O2qtvepsZgPNBCE41Uh7bLcmCKna7yCRQIFFFkpke/HKzfrEk/VaIp0brY7d+B/rFbfLU5GYdi2Z1+0p31J94otGeemFpJIDQX6BaDUui275vC3DKIFOtj6clXyA/JYulR3Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdY+2D2p; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdY+2D2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748116111; x=1779652111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=90b1cueZOzqWA9EVgf0Vp27c+lqYEoVgA9jQdlDJkPM=;
  b=kdY+2D2pk4J1EUMW18JLCA6l/x1YC4vVfhGJQogftQmn0xfwi2A7nHng
   hM/60UeV77OS9PkcnKLMYOW6LXb9qfhHH2OeU4aaIkhYRP5mJ8y4nUimw
   SD5HyeLHPxq+RoOhtktn0KiJ7EVpDl2qLPQSPDVPAwYV1009fHzrZLM+Z
   DRxsJ0KdtiIdjWZZ9i9mdugfTYw1b2uEOFtwZO2CcjeSjQQtM3P/WmvtF
   woJda0Ox4J9vlrqVTiCMGUidUouIHPNors8Bb+jNkJtHZtsMdCtH8e0vy
   68wqT7oBh/cvlmbJutS2i7qLSbnt7A5VVnFHd3Os8HP/zq1K94qaBfKwd
   w==;
X-CSE-ConnectionGUID: TLU8RXHJSm+H6jwQudUjGg==
X-CSE-MsgGUID: XPzpaZ2PR/+pqMtkx76FIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50063020"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50063020"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 12:48:31 -0700
X-CSE-ConnectionGUID: azVvQDVZQ5GRPY9dbW26zw==
X-CSE-MsgGUID: wkjIO87CQgW/hLTZsWckbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="172611592"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 24 May 2025 12:48:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIur6-000RQy-0A;
	Sat, 24 May 2025 19:48:28 +0000
Date: Sun, 25 May 2025 03:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:container 12/15] ld.lld: error: undefined symbol:
 key_del_intercept
Message-ID: <202505250300.PB51dAVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git container
head:   e934156b00c64a64a048108513ab445a232c2120
commit: 1b61c8044bc4e4388e4eb1236a1564ed278dd0ba [12/15] containers: Allow a daemon to intercept request_key upcalls in a container
config: arm-spear3xx_defconfig (https://download.01.org/0day-ci/archive/20250525/202505250300.PB51dAVI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250300.PB51dAVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250300.PB51dAVI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: key_del_intercept
   >>> referenced by container.c:58 (kernel/container.c:58)
   >>>               kernel/container.o:(put_container) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
