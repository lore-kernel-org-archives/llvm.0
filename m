Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF173D9DC1;
	Sun, 18 Oct 2026 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792324496; cv=none; b=Abgz45Qq+BMhWzRHZufBwj/zqcqZttt2kC14d+FitoWcgMEGZ5gnhziJQHPvC3Z37hDxfL9kyTzGgRh1in2AZDdj8uWzSmQd17TNMIkpnhXbt46epoGX0OaCm30JHKZSCLirkRgprpNAZ7V4A1b8Hm5Vz/o9oAbQohkxlu4lfZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792324496; c=relaxed/simple;
	bh=YnvxIZ4dny4TS9NBxFDoDh8R1JruP1tWaG3vNqB4uAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLCA24xDU56T/02hceRXKp9PtgyTdKLlQ6wQLqqXxvpIMwBrMZQdhIoVkCPH7zd+332AcTi7W42Cdt8M4MgqEjeiymRGmsd1GI77H1pu6jpDQEpZ0/Jk/RPUPdKO+jTftbnjbe3jyWwdS4+wiJSo8Cd6Z3d7hTYV5AlJ4DJ13Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmHkDBBd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmHkDBBd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792324493; x=1823860493;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YnvxIZ4dny4TS9NBxFDoDh8R1JruP1tWaG3vNqB4uAI=;
  b=TmHkDBBdGMBzdBkr/vLPcjCKkhA90/FLg/EWfwC5raBmSGoriedFIeqm
   J4YYW0KhxVH45mkx1vOKhFlSdrVJsgPjBr7aCE4meoZ2Ixq7BcxDd/haJ
   VZ8ftvPgUB3t1HoS2x8AWOfWxOpof7Cz+rPg3s4+jEODuYg1/96/gsu61
   slfR3g+acekEY8e4KX/bvdQ0kSaclz+PIM8tqe2bja+kScGpOZlGdUQAB
   mKN31jXQqmUZZhMYSAVT9ufUf3AjdBulF3wjMoo81m4QPaaVCG8NP7YHy
   HGj4AS0Vl5+0GaXRhr34cCf5glalkb/WX8BRL0SGJrYAnwWb6z/y/zS1d
   Q==;
X-CSE-ConnectionGUID: PYR3ioZbQl6KOwW+KqC43w==
X-CSE-MsgGUID: JplNiMrdRFGwOA/fqIu8cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="915134"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="915134"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 04:54:53 -0700
X-CSE-ConnectionGUID: rpEhrxUVSs2oHtLdfPU/BA==
X-CSE-MsgGUID: IqhnZXQgSJi4EyFiiHKcRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2778715"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Oct 2026 04:54:52 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIPTV-00000000KNm-2zsd;
	Sun, 18 Oct 2026 11:54:49 +0000
Date: Sun, 18 Oct 2026 19:54:08 +0800
From: kernel test robot <lkp@intel.com>
To: Fred Griffoul <griffoul@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 06/11] iommufd: Map memory provider files
Message-ID: <202610181912.BkBXHn1M-lkp@intel.com>
References: <20261014093733.90312-7-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014093733.90312-7-griffoul@gmail.com>

Hi Fred,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53]

url:    https://github.com/intel-lab-lkp/linux/commits/Fred-Griffoul/KVM-guest_memfd-Introduce-guest-memory-ops-and-route-native-gmem-through-them/20261014-093723
base:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
patch link:    https://lore.kernel.org/r/20261014093733.90312-7-griffoul%40gmail.com
patch subject: [RFC PATCH v2 06/11] iommufd: Map memory provider files
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261018/202610181912.BkBXHn1M-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610181912.BkBXHn1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610181912.BkBXHn1M-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "get_mem_cgroup_from_current" [drivers/iommu/iommufd/iommufd.ko] undefined!
>> ERROR: modpost: "iommu_map_nosync" [drivers/iommu/iommufd/iommufd.ko] undefined!
>> ERROR: modpost: "iommu_sync_map" [drivers/iommu/iommufd/iommufd.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
