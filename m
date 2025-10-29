Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D29B793;
	Wed, 29 Oct 2025 14:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749091; cv=none; b=LSE650l4F8ApeIpHBGbyB6UPXn7VUBNJMs9MiDAZUALm9t02VBLdBbTa3a6prhsVsIHj8lBlBTlNTHuZz4HDRboCcsAzASJSmampaWRS99oNTnpciomQNiCXVCrznww8IcxvkcTFYd7cI2k2BnRhZ31Dp/uSUJujIYdtAvaXtCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749091; c=relaxed/simple;
	bh=Y/8tSMzJotPKrgTYDmA3ScVT+XxCk2MM0nxqditg4Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KObLWCmuniSPpbXZ3uq8u66VrPVEaAL8bPbA4N7DiUsRSt8w3Eeyjrx+qzWSs2M5VaCkPv4XcpsFjXo1oiUAXk2duwp+jwRZclG780rS9qNjMltdA2rSjhN1u7WKesvFCprsA8PaK8Wy2ICCtZQToIMyfhn3sxqJCJIxpKWqPd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F/Umbwl+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F/Umbwl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761749089; x=1793285089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y/8tSMzJotPKrgTYDmA3ScVT+XxCk2MM0nxqditg4Q0=;
  b=F/Umbwl+hwvRqRIIf3G6mbgjHXlhZmekLdCV9uJNbT6tFL2QlQsNGLHx
   uby1PcVw3Xr77LXAM3XY04QMdaq4DfgVCxEgxgMJk8zQoKfneFmBBbBq2
   rbouHJQXkGOHuma36UKeyBKet/XqWnrnbYSTuHFOlrKOCV9NDo875jbCl
   fcNSz94Eqa5MAAQrvRVUFvOEghhqfwZXCbYqn5qhLE40xTBUku+troKpy
   SwMBX1MCa/LcjKhskCg3mJHrl+MDcEkvpezQ3Vodub8NhQFYloP7aVOh3
   90UmEmKpNAv/6OPD+OEKQszTWCAhkd9QB3qpkex9OpG7wnZlHeUvd4L4p
   Q==;
X-CSE-ConnectionGUID: MqGrqXUxSVSxggTxmYeJaA==
X-CSE-MsgGUID: KW/plzEeRLe9wnOm2Y2t4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63776553"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63776553"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 07:44:49 -0700
X-CSE-ConnectionGUID: /MilIQYuRj2DAjqcHr+HfA==
X-CSE-MsgGUID: oWublN4cRg26+YBrfxf8kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="222901835"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2025 07:44:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE7Pp-000KhT-0p;
	Wed, 29 Oct 2025 14:44:45 +0000
Date: Wed, 29 Oct 2025 22:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:dmabuf_map_type 32/37] ld.lld: error: undefined symbol:
 dma_buf_mapping_sgt_type
Message-ID: <202510292233.n9y5mJGF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux dmabuf_map_type
head:   58578cc9d13b9d9bd6ddd6e96b0fd98f013f887a
commit: 1b84f78eb028daf067d226068f670547bf95662e [32/37] dma-buf: Add dma_buf_mapping_attach()
config: hexagon-randconfig-001-20251029 (https://download.01.org/0day-ci/archive/20251029/202510292233.n9y5mJGF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510292233.n9y5mJGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510292233.n9y5mJGF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dma_buf_mapping_sgt_type
   >>> referenced by dma-buf.c
   >>>               drivers/dma-buf/dma-buf.o:(dma_buf_mapping_attach) in archive vmlinux.a
   >>> referenced by dma-buf.c
   >>>               drivers/dma-buf/dma-buf.o:(dma_buf_mapping_attach) in archive vmlinux.a
   >>> referenced by dma-buf.c
   >>>               drivers/dma-buf/dma-buf.o:(dma_buf_mapping_attach) in archive vmlinux.a
   >>> referenced 5 more times
--
>> ld.lld: error: undefined symbol: dma_buf_match_mapping
   >>> referenced by dma-buf.c
   >>>               drivers/dma-buf/dma-buf.o:(dma_buf_mapping_attach) in archive vmlinux.a
   >>> referenced by dma-buf.c
   >>>               drivers/dma-buf/dma-buf.o:(dma_buf_mapping_attach) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
