Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31A317BD6;
	Sat, 14 Dec 2024 23:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734220240; cv=none; b=jSEajz5QHh/9EUd7iJlYH2PjSJVk8cAxPw18ztWtU4cN39ioUyPN3h9skiaoRLJVVhlLayTt/jT5AfG5j/p6PCfiOjR/qnKEgr/9nRL1tNr2XD6CD48/RXwg2IB50EO3iqg/8PUVldI/sj4vxpo7RdC76ED3HvFtkqIkGUVwlYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734220240; c=relaxed/simple;
	bh=vII1euYZw+KTe0VGAi29QTWdnWnqz5U02OFIF/M/43U=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kfA01bqzaZ53yQnfD/b3g3mY9kDKuvfQlOFxYzvAzIVhOTXXoGUQoPaD2nHaqRYBSq89L4TkbIMe3kBtrteuKlzPVuALKNrKWmPEjXq4Sz7mAn3iNd05Kgu99aJ4HUYCR4JL3Ipf5zWtA9hzx6EB8u++4/ayx73gkyoTPniXrtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQosTETr; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQosTETr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734220238; x=1765756238;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vII1euYZw+KTe0VGAi29QTWdnWnqz5U02OFIF/M/43U=;
  b=jQosTETrqaPop4pwZuEasxV8CpxOCBCuneuAiRy4n5q3Emm+NEXFS23w
   xyIZdC//AwwmKm7e9HBqPxRG0uOhheMLdMG/UNR+D6CmhCwRXby8fXFVI
   UzLsoxxaY6/MimifZk5o2yNEAFomV83DZDQnEXce7IIHJZxXwZt7rpWDV
   i9OAFqiFWHTHctwrt9RN7PKJU0GeSrST9AXrhXESEErowUpjr/z8skM5o
   bA+7t7yvqXxzEEuN0mZHsn/5wnXsTLy6BH2wmbA2MiobB3LjwDRGojD3z
   auCMZn9snRN03NTCdivAi36V03AlqOrxrRThxy1w7ZQfqa2qLMOCYcq8t
   g==;
X-CSE-ConnectionGUID: A2E+SaSgQBin4pIOGvaYfA==
X-CSE-MsgGUID: wVpKtynhQ4qa7/tHVFr/Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11286"; a="38327517"
X-IronPort-AV: E=Sophos;i="6.12,235,1728975600"; 
   d="scan'208";a="38327517"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 15:50:38 -0800
X-CSE-ConnectionGUID: rrUWvhoQQQKNp2QkWfiKSw==
X-CSE-MsgGUID: XpHUpAsdT2aS4FXoCC1DXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96711397"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Dec 2024 15:50:37 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMbu6-000DK6-0t;
	Sat, 14 Dec 2024 23:50:34 +0000
Date: Sun, 15 Dec 2024 07:50:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: .text.amd_set_spi_freq: unexpected end
 of section
Message-ID: <202412150725.0tOrzlKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Raju Rangoju <Raju.Rangoju@amd.com>
CC: Mark Brown <broonie@kernel.org>
CC: Krishnamoorthi M <krishnamoorthi.m@amd.com>
CC: Akshata MukundShetty <akshata.mukundshetty@amd.com>

Hi Raju,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a0e3919a2df29b373b19a8fbd6e4c4c38fc10d87
commit: 6defadbe6cbc3a87dc39c119a6748d19bfba0544 spi: spi_amd: Add support for SPI MEM framework
date:   9 months ago
config: x86_64-randconfig-071-20241214 (https://download.01.org/0day-ci/archive/20241215/202412150725.0tOrzlKf-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241215/202412150725.0tOrzlKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412150725.0tOrzlKf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: .text.jffs2_erase_pending_blocks: unexpected end of section
>> vmlinux.o: warning: objtool: .text.amd_set_spi_freq: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
