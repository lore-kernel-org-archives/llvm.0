Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5C41207;
	Thu, 11 Apr 2024 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712878501; cv=none; b=qKY+5/YtlHYdb8hMT6ZakHCOZAeoOdNnougiLY5p8qUg/8wqVLpST3fXNjlWV7j+2jvWWjDVtQ4oFcizC5PWfnJQ86CUArTmSXpSo8aw84b8eZt8PlVyRlIPUNefoh2MIUDByfhV8gZ9/oaaDUsLHdiYMAhWBCEF5xatikFJCro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712878501; c=relaxed/simple;
	bh=huIfZxXK+yKtIqiaqpaMT/UeejnG38jFvbyTKcBP1/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhVUYrgSloqt8fT05S2OEvGiT6Ud7NGMEJTPuGZtiw7gnxqf8wJW/dLqzt/XmOMIw3X9u6073cQyyUyJ/xzyKUNpGJIm881Cc+R2R5RqQL8i7ukA5kPhVFx+K4UBw4E3oB7Zr1Sal+lVRe0+Dr1Et1YpVyPnBVv87q513L8nihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qx+rktzi; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qx+rktzi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712878500; x=1744414500;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huIfZxXK+yKtIqiaqpaMT/UeejnG38jFvbyTKcBP1/s=;
  b=Qx+rktzi1gLvvlppk7C5DBWZ3Fzdw2RI2LMBdCpWGJ77Vv+cRgEF3XgP
   ZFYP6p0dyT+K3Vv/lL1OVnXA33P8a89VhNX96EGOMvzDubF0ZMrD58odZ
   /uyCClC4owVFcY6uuatc4fQoC2FskmKjErJ9l2vEDft4uCu5reIae+hVC
   dOM4fae9E3II3/2hNci/OYSujdrV1ARYPkWA9VzTY2QERQHtk16ViePbc
   Xbz303twZ1v9KB0b8xp95B2lDExokupW2Jw7y4NeP6VQ3iry+w87UIZfm
   laJoKKLNbDV7vBkGJH49lVCpt4AiOsxocCbVt5nnnMhRFgsWRdXIcuIH6
   Q==;
X-CSE-ConnectionGUID: ThimWCcfSwmQeDswzU+okQ==
X-CSE-MsgGUID: ZE4bk2CfRsyQbrXGCQIs0g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18928209"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="18928209"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 16:34:59 -0700
X-CSE-ConnectionGUID: DXMQC6YXTU+UqXgDA+zwNw==
X-CSE-MsgGUID: spw3FfgBSdiGUKR814AGdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21492088"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Apr 2024 16:34:58 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rv3wV-00096T-27;
	Thu, 11 Apr 2024 23:34:55 +0000
Date: Fri, 12 Apr 2024 07:34:07 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 06/10] fs/dax: Add dax_page_free callback
Message-ID: <202404120710.6fzwGtNz-lkp@intel.com>
References: <d3b9699a56edefe16b695ac09ed659c13391a0d5.1712796818.git-series.apopple@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3b9699a56edefe16b695ac09ed659c13391a0d5.1712796818.git-series.apopple@nvidia.com>

Hi Alistair,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on ffc253263a1375a65fa6c9f62a893e9767fbebfa]

url:    https://github.com/intel-lab-lkp/linux/commits/Alistair-Popple/mm-gup-c-Remove-redundant-check-for-PCI-P2PDMA-page/20240411-085933
base:   ffc253263a1375a65fa6c9f62a893e9767fbebfa
patch link:    https://lore.kernel.org/r/d3b9699a56edefe16b695ac09ed659c13391a0d5.1712796818.git-series.apopple%40nvidia.com
patch subject: [RFC 06/10] fs/dax: Add dax_page_free callback
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240412/202404120710.6fzwGtNz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8b3b4a92adee40483c27f26c478a384cd69c6f05)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240412/202404120710.6fzwGtNz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404120710.6fzwGtNz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dax_page_free
   >>> referenced by pmem.c
   >>>               drivers/nvdimm/pmem.o:(fsdax_pagemap_ops) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
