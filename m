Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A03C176238;
	Thu, 25 Jun 2026 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782357693; cv=none; b=bme8dq1TeT1rdAcvOTOkYeBdKGnQcZFChBhQt/gYRq8JWfeAO+eqsz1Gq5KPk2qEnE4Akl2yOnMn0Cq4lPhyf7vN8wAIqh1glzmAKv4+OQWugOEj5JPossGr5LbBFHfDuxsxNNFkrHd1WT5RBACoU8wwPdFpRUK5rlayGHUA1J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782357693; c=relaxed/simple;
	bh=Au/MB3GSnty0bszZlDZKb5a1tQpViosek4c1WXQmnDY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kofMb1KEvFpkqIoeai/Nq0eZHRKSwAd5d/UqTxE4o5pSgnm+gOoJLzath1Vrj9ymetfogU3eqco9GcJl7svjWU9zmfqc0Lr+xeGaxwl74qcgWSDy2dk+/xT4YQvIbU1I5mHadoTaSw2kpWvB0/Vag4yL59s0WPrrGYZMfsHhvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PIDV5OOE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PIDV5OOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782357692; x=1813893692;
  h=date:from:to:cc:subject:message-id;
  bh=Au/MB3GSnty0bszZlDZKb5a1tQpViosek4c1WXQmnDY=;
  b=PIDV5OOEoocWq4yfRwWgO+Eb32NG/QnOLkJ3jDkW+mIVjwOO/1vNmR0d
   uEVba2Q19EqgEESPYyWgbtiZ1Tp0P4oAOc2FvpX3aF4pSf/P9hahiHshp
   y1Q/6Vj23efTxcw2KoVi4uzyv4EFlM9nBdWkaI2ecHi75xvPbsdbXjOVX
   ++fqWeM5aE2gH5j32Ss3Wj5K5brk7na+8VDIpUMmfHUR+ZifyyN6WLUg1
   v9I4EtSF01fliw97sZau4vVUhf2CpLuTWIi2K9/AG4E8wv66tVgNgpb1z
   YUiG/y/f5MyKxNmKNRCoV7W8g9ipN/mKJcIYn76TfF9EOSUiGIIwTC2I3
   A==;
X-CSE-ConnectionGUID: 66V5x8NjTNiX3qxmig4wPg==
X-CSE-MsgGUID: XUDuvJaJQ7+ZsB5bJ2DuPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="82113349"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="82113349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 20:21:31 -0700
X-CSE-ConnectionGUID: r7wIQXAmQgq1/2+oqPkUog==
X-CSE-MsgGUID: IzfozItMQg65gItS80l7VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="249301944"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Jun 2026 20:21:30 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcaeY-000000003rt-3U0m;
	Thu, 25 Jun 2026 03:21:24 +0000
Date: Thu, 25 Jun 2026 11:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/managed_nodes/rfc5 35/75]
 Warning: mm/memory_hotplug.c:1753 function parameter 'online_type' not
 described in 'add_private_memory_driver_managed'
Message-ID: <202606251132.CwJrC2Pu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/managed_nodes/rfc5
head:   6364a01f13504174506859b97ff65579cc875919
commit: 928908d2d294d8615cea6bfcdf848b254485ebf6 [35/75] mm/memory_hotplug: support N_MEMORY_PRIVATE node hotplug
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260625/202606251132.CwJrC2Pu-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606251132.CwJrC2Pu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606251132.CwJrC2Pu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: mm/memory_hotplug.c:1753 function parameter 'online_type' not described in 'add_private_memory_driver_managed'
>> Warning: mm/memory_hotplug.c:1753 expecting prototype for add_memory_driver_managed(). Prototype was for add_private_memory_driver_managed() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
