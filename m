Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B96287268;
	Thu, 21 May 2026 20:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779396818; cv=none; b=tBylGU11VQPPprAtl6vUv1+sQBLq/PDqa5CzAvab8HFx0kEeIox2S890QpBR7VThqFGzX+7qd1gVaIa+gQGlZlu7YtqWQN+5rFaWfdv56OGk5P7KQut0ts4CouXrMBdbhyiNf6p1v+Cvdwz3dFvHoKb6oWFJMBriixLy7/w5yiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779396818; c=relaxed/simple;
	bh=1xQ7Sk/0Ro4FMZgjFmjpqoJfYYCpw2jhf9aimKCXqL4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KmiumyjDN/KUUrv/oJM6PbUG0Re55z4vPz2kUDOmTCO8FxJZNslqxAtbyKP68OGBQjH3hnZL2p787m+4vDhuX9qJVJmmWmux/PDbrswUJT7NCvKZ635pRb+S8Aq/fEu3D0rzPRnpykISrQdVwrmH80UEru2iQax1Ib8CDevCItc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hduEDFpR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hduEDFpR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779396818; x=1810932818;
  h=date:from:to:cc:subject:message-id;
  bh=1xQ7Sk/0Ro4FMZgjFmjpqoJfYYCpw2jhf9aimKCXqL4=;
  b=hduEDFpR9x4d/XvAle86Aqb3INqrF5sXGh44QbBaLWyke6+w3iJupZAB
   Jun/zfopO6CVw8nIccnpA4o32nYIscWcUI5AvtsbcQk02PdXVuxlmeq5e
   sZujnN1nA6rmqtxTZzOwEO+zmFQfPzJ+Ni6/jAMGm22KC3uZ+67OLgDmd
   Grf2q/5pi0KKK9VLtP/wes0gnlQDEcQela3o2GStTPQTyvv+7Kz1FD95k
   KnZQCZR7KnQty8MzOhDEBH5zhoDJdWwhsC5HRoqecb46nh0Z6lHu4FsJ+
   H+tsRiRsO/ShwCYMwcNpWnYBCpZRRUq7iSgfbreOt6i6roAcPukW2Fz+d
   g==;
X-CSE-ConnectionGUID: on676yqFQUGlWTH0HUb+OA==
X-CSE-MsgGUID: Mftc9EMLSqaBCkBVbuGYRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="90901327"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; 
   d="scan'208";a="90901327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 13:53:35 -0700
X-CSE-ConnectionGUID: YtGiPP6+SgSVKidk1+3dCw==
X-CSE-MsgGUID: 5XEyv+t7QZavehOXo76Fjg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2026 13:53:33 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQAOY-00000000193-1EJl;
	Thu, 21 May 2026 20:53:30 +0000
Date: Fri, 22 May 2026 04:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Weber <kernel@phwe.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:kernel-7.2.misc 3/3] ipc/msgutil.c:43:22:
 warning: variable 'msgseg_buckets' set but not used
Message-ID: <202605220400.nbeQzaOB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git kernel-7.2.misc
head:   6cedbc997a94aa32403323a9e519969bdb3d610e
commit: 6cedbc997a94aa32403323a9e519969bdb3d610e [3/3] ipc/msg: Use dedicated slab buckets for msg_msgseg
config: um-defconfig (https://download.01.org/0day-ci/archive/20260522/202605220400.nbeQzaOB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605220400.nbeQzaOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605220400.nbeQzaOB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ipc/msgutil.c:42:22: warning: variable 'msg_buckets' set but not used [-Wunused-but-set-global]
      42 | static kmem_buckets *msg_buckets __ro_after_init;
         |                      ^
>> ipc/msgutil.c:43:22: warning: variable 'msgseg_buckets' set but not used [-Wunused-but-set-global]
      43 | static kmem_buckets *msgseg_buckets __ro_after_init;
         |                      ^
   2 warnings generated.


vim +/msgseg_buckets +43 ipc/msgutil.c

    41	
    42	static kmem_buckets *msg_buckets __ro_after_init;
  > 43	static kmem_buckets *msgseg_buckets __ro_after_init;
    44	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
