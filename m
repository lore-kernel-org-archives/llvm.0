Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8420E1A6806;
	Fri, 31 Jul 2026 03:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785469793; cv=none; b=HD4y576aKpHl7bfYIs7JpcDkPEq3Q7/jBxVYRM3HiMpjYo1V+fJjTlqqXWxzFk3kC5BqCWAedjTSMajYINOxhagvwwQCY9VKFD0SFepyFfHGG/7EDOD2QrOWITSPRPUMJrLn+hQks78bZ1ERCmxhjSshrsKerMoHwEimhUIv/18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785469793; c=relaxed/simple;
	bh=uippYRmKy/4zf9WNQHzDj/QFbVZUMpc/o2JFNHno6Ts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q1ezB62UfdxuJ1hJeVD6irULBoMDOa7fGGC/+BaN3ygq37CnyTk2clmd4HTOUF3R+Z4IVvA33MdcYCTBXJ2+YwnZgX/1OvJLhOqnF17tkNVykEN7o3GziiHmsuJQgjcUfM+9qeD8QTCqJKjnuA8qie4zX20GTIS2+3ktfEUaId4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ArZ/NpGS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ArZ/NpGS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785469791; x=1817005791;
  h=date:from:to:cc:subject:message-id;
  bh=uippYRmKy/4zf9WNQHzDj/QFbVZUMpc/o2JFNHno6Ts=;
  b=ArZ/NpGSSpriSIvLAyAUyFOB4EQ9gcRZTttk47+V6sTrK57+g6tlSQt8
   u7wvmiMLn/UytFdV7z+HBYb4Bj9MheLuZw7gYyPRkuQvCFZLVr7NXpdNx
   rZM/RxUuhzm/UZKS4VXJHPkNhZY/M1yT1OyEhLniJjlEgNyGioNdkNL2L
   FOEeLs5HCy/zFVAy7IANm6DbqIXMSEYF3jrF9Hlib4370T9YX+2aoituB
   qNmZ9VpJeMmrTeLhUlgh9b/e+ZKHmkfMmnHGHl8/cwnNVAG8wZepyf00k
   NmXyY33K5jzoWk4qo/CY7cgTaKMiEqOtWVyGXDiPZiKQhw6QD/1TWnuda
   Q==;
X-CSE-ConnectionGUID: ZGUyoDsVQdiuEhyFLLl1gA==
X-CSE-MsgGUID: SLb7ZrLZREyHGblX6BTJyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="103632722"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="103632722"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 20:49:50 -0700
X-CSE-ConnectionGUID: tQoIKTaXSqGxeuKn2YoXJg==
X-CSE-MsgGUID: 7tvJfOuHSRSlBhDBefjM7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="258683703"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 30 Jul 2026 20:49:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpeFl-0000000003L-2uh0;
	Fri, 31 Jul 2026 03:49:45 +0000
Date: Fri, 31 Jul 2026 11:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Lucero <alucerop@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dave Jiang <dave.jiang@intel.com>, Dan Williams <djbw@kernel.org>
Subject: [linux-next:master 1678/10862] ld.lld: error: undefined
 symbol: devm_cxl_probe_mem
Message-ID: <202607311106.yYURvDZ6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Alejandro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95d6a9ccef99117115e41e9adb271243bd5e985b
commit: 0418860ef2ca8ab4e696ce3913fd76660c881c0e [1678/10862] sfc: obtain and map cxl range using devm_cxl_probe_mem
config: arm-randconfig-001-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311106.yYURvDZ6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311106.yYURvDZ6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311106.yYURvDZ6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_cxl_probe_mem
   >>> referenced by efx_cxl.c:77 (drivers/net/ethernet/sfc/efx_cxl.c:77)
   >>>               drivers/net/ethernet/sfc/efx_cxl.o:(efx_cxl_init) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
