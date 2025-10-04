Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB701C2E0;
	Sat,  4 Oct 2025 04:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759551758; cv=none; b=GCmMsijuv1EU4TWMTmHQMIt0Gik7rkXQbHQcmqpm+gAqsVtm9H9CrKGllpSHJF4J5AyBGh8R8o0zDii172zNQ9iJETsiXlm752pHLDIJW2AzmwrQSJEcnGq1CL9YDG8v8oUtQ3eJxDYxSMb5blTI5R29vWW+DzshwiY0CTP/SI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759551758; c=relaxed/simple;
	bh=9oQzcLpHQ1LMGAFieebjt9F4lLpFUVl/U1vrpjTBleU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKbmc1O9CJm023RUoC5S+HF5h5+rjcdWKljEaK3BHvz6kh5KkK5RiOKoPrv5XkH0ZXYpd1lw6rDad13r4kA9towxF+RB7avx1ieG4ELpaGfldnx5SHR6V8ruQnVCn1ybARgTagfCB6Aam01En6pvppJjmD2ADa5sWh9Ds138Axw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MH1uZJtT; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MH1uZJtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759551757; x=1791087757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9oQzcLpHQ1LMGAFieebjt9F4lLpFUVl/U1vrpjTBleU=;
  b=MH1uZJtT/PpnQ0xoSTwL9X1wB363EsJoGW2Yh3k2EpCKFViveW5ZD/wA
   LRcrCobpJ9KDyZDawDPoaDeNlGjY9pci98a7uESTJqIclr7sqXSOxiYrA
   V40U/bymMgFLy3+iylGwfABD9lWcqm3jt78vw4oxlT0A0meLkxg0Mvbz4
   BpZmUoQICF2gTvCy4zl4hXVLn83n5kqo0VDVDbb4AkqmzB++A9aNKOXdo
   XEGMiEKbqdWqEqObA9UMXpoKng75ERoCSQEhKZY4zc1gpnb51ldDTcsSg
   zHgkcg2J3cZs9pfsHlyEnpfdpzsfZWN81VHBFTxD04cHKwvX7Ivc7R1rP
   A==;
X-CSE-ConnectionGUID: r/5IutobTMegfAx7C1B9vw==
X-CSE-MsgGUID: uwz0XAsVQQGqQbaWuike2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="72075300"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="72075300"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 21:22:36 -0700
X-CSE-ConnectionGUID: hu2Gfj4vS5qYlrvRBuQSuQ==
X-CSE-MsgGUID: Z3//4wumTcKQYWODAZajBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="179367869"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Oct 2025 21:22:34 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4tmy-00054z-1h;
	Sat, 04 Oct 2025 04:22:32 +0000
Date: Sat, 4 Oct 2025 12:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Errabolu <ramesh@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Heiko Carstens <hca@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>
Subject: [linux-next:master 13105/13363] ld.lld: error: undefined symbol:
 zpci_fw_sysfs_init
Message-ID: <202510041229.XuZ9q7Fv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47a8d4b89844f5974f634b4189a39d5ccbacd81c
commit: 198c570d7131cca92eec058c952203c33042f906 [13105/13363] s390/pci: Expose firmware provided UID Checking state in sysfs
config: s390-randconfig-002-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041229.XuZ9q7Fv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510041229.XuZ9q7Fv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510041229.XuZ9q7Fv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: zpci_fw_sysfs_init
   >>> referenced by pci.c:1191 (arch/s390/pci/pci.c:1191)
   >>>               arch/s390/pci/pci.o:(pci_base_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
