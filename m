Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBB130FC0F;
	Fri, 13 Mar 2026 00:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773362774; cv=none; b=FzgAuiXkjoa2tjmriujZwpsp+z2sOwFrCFYK9j/4J1/ro1glDWXomGaqfTgOlQme8Rp9KmyZ9OXubO67ht+73U3pjj7n9JQXnnrbJLso9sFQmnvcynDMz79aEJGwbT+BNRRV60ddlyV339GFK2Tut/BVdtYLHybNi4Da9e11k1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773362774; c=relaxed/simple;
	bh=b20M/stSy6HfezqXBYd4X5XImDl1hQ4wOHhQl+t6R6g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LU9mrw6ue6SVmg21bYvkUgQGxAkLrnsTpxUU+eoi/fcdlmUDm2tAqEBmZrGewf+RUM7U93BLzdTGJhrNSBrX9Ug2yBXTRg1VpPFPmVKcQxJdoCqNojGWMwVgRYKeX90kPgEp/ihNw6Nk7txINOXhxssURKbqOYSOd/O8zfG96D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPPZzVDq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPPZzVDq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773362772; x=1804898772;
  h=date:from:to:cc:subject:message-id;
  bh=b20M/stSy6HfezqXBYd4X5XImDl1hQ4wOHhQl+t6R6g=;
  b=MPPZzVDqca0GRArsfPFIxXdo96xECg/9CS0wZaGpFrNGM0UNAps3ZJE0
   PVOgzseh1cxVy53U+DhsBqUPsg+DQbMM61phSH2wpPp98RH4TOsOIcV1n
   EvyIZum/MK5Gv56YbXDf9UkbgWmvrOtajtAjFkoM6mKSwAggV+6+CH7d2
   8UGqeMhDemGMkwEHEz3VvfUhS2jZTwkQwIizog+I1r+P5Q511P/862HZb
   U8lJXBADohYOptz+8m9X20umE5Wn+qYBuFuDB4enb1iC32hBuw8cslvCl
   XLXK3maqt00FOLiQLOUIEhuzAVO/RApOQKiadHPnixRCfmtgWH7nKBGoS
   Q==;
X-CSE-ConnectionGUID: NU+9kg/yRQuR/5TqI1LjvA==
X-CSE-MsgGUID: 7ucCqldXQ7ma18DD2tUbHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85553054"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85553054"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 17:46:12 -0700
X-CSE-ConnectionGUID: zGgjH312TM+lxxb0uTrQtw==
X-CSE-MsgGUID: ESTowuF5TGC8MSo9tkq+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="220093634"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 12 Mar 2026 17:46:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0qfH-000000003bd-16uz;
	Fri, 13 Mar 2026 00:46:07 +0000
Date: Fri, 13 Mar 2026 01:45:08 +0100
From: kernel test robot <lkp@intel.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 devel@driverdev.osuosl.org,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: [driver-core:driver-core-testing 3/16] Warning:
 fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in
 'kernfs_drain'
Message-ID: <202603130112.2FcCzv1g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   e7ccc9e054beb4c366228d24786f67c738206605
commit: eea5d2bb34ba11dccd9c53f392dc50cf060150a9 [3/16] kernfs: Send IN_DELETE_SELF and IN_IGNORED
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260313/202603130112.2FcCzv1g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130112.2FcCzv1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130112.2FcCzv1g-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'
>> Warning: fs/kernfs/dir.c:491 function parameter 'drop_supers' not described in 'kernfs_drain'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
