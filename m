Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531A5136353;
	Sat,  5 Oct 2024 08:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728116288; cv=none; b=odSUKxq9kVpEO2CL/IqMA/pcN22v28WdcUXN0lSQbMQMiSlVE0ZTDnDMNrjmATrLH0z6WgC1zZlSTtxfXMzdEYARZ7SgTfrkmcH+bB5IShQ4tNTpEwc5LivdmCdd/1zTez54fThk6CKzhi62QHmQS1rsExeFM5Fqv4JpdJuCDEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728116288; c=relaxed/simple;
	bh=YfZ0286o32DXky0jO8OMeZwyw2akky4WR9yMjuiUX2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VxBB4bDNj2JTvNAD+VrDZPi6rBsbQVtSCwdMzpHsh/idtkUbDWXTrZERCGxZf8qRuLsybBB79i5JDrpzT6Ur7giPWIMLXT6dFmzUUtIj2eFwdGA8DxQSZlFj6je484xVPkv7Cdjq0bN2mPuJGjPkhwrN6XS1NTK3HQKlJbZNEeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l6VRuh6T; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l6VRuh6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728116286; x=1759652286;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YfZ0286o32DXky0jO8OMeZwyw2akky4WR9yMjuiUX2I=;
  b=l6VRuh6ToEcoleAz9/ROXa1tIMM25QOHb1Gv2eC0Nf7e7Zbs2xS9tq9Z
   pbZk4KRZyJF5ucAI8xIte/4+0Pbbh6wVbsdooxBmcsDn5aeOCY9h97zVf
   ph0XxFDmAKS+PUPqIQ4GNiTIiwaqDJ8rLX8eQ8x2WP8vtcH++WnhJRuyz
   fGApCa8KlsLxxS9t0Cqfd8Uv+q5FGbIeCY7TXLjOK9KjmLrrJJSyIKUHX
   0yvbEf3NL4n+6LnESI1tx4wJMKqobCA6ZYksZ8s56uWhAs9J1F1r5CXi3
   HMViUAfQzAPm41TIBDRx28n67yqb7SKy6ItCm1cBfpkciBJI0hqXQZQLo
   Q==;
X-CSE-ConnectionGUID: BmW/ugWSQ72IepQW+DYKow==
X-CSE-MsgGUID: N/NyftzYQs63OHYUaPeYGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="27468900"
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="27468900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 01:18:03 -0700
X-CSE-ConnectionGUID: JjK56iyMSAqcLbKFOKCouw==
X-CSE-MsgGUID: 4Yv0GmYDReKFxi1NxIiSwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,179,1725346800"; 
   d="scan'208";a="74516902"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Oct 2024 01:18:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swzzE-0002lO-1Q;
	Sat, 05 Oct 2024 08:18:00 +0000
Date: Sat, 5 Oct 2024 16:17:46 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Price <gourry@gourry.net>
Subject: [gourryinverse:memblock_align 1/4]
 drivers/base/memory_block.c:18:15: error: use of undeclared identifier
 'SECTION_SIZE_BITS'
Message-ID: <202410051647.3Y1iEA6I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gourryinverse/linux memblock_align
head:   186c299e51bc86b2d72d6928ef11b62b7e567136
commit: 500121cbe94cc2fd5b7cdb338fc12ff3b70f9d7b [1/4] memory: extern memory_block_size_bytes correctly.
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241005/202410051647.3Y1iEA6I-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410051647.3Y1iEA6I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410051647.3Y1iEA6I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/memory_block.c:18:15: error: use of undeclared identifier 'SECTION_SIZE_BITS'
      18 |        return MIN_MEMORY_BLOCK_SIZE;
         |               ^
   include/linux/memory.h:23:43: note: expanded from macro 'MIN_MEMORY_BLOCK_SIZE'
      23 | #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
         |                                           ^
   1 error generated.


vim +/SECTION_SIZE_BITS +18 drivers/base/memory_block.c

    15	
    16	unsigned long __weak memory_block_size_bytes(void)
    17	{
  > 18	       return MIN_MEMORY_BLOCK_SIZE;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
