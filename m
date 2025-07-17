Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399C622370C;
	Thu, 17 Jul 2025 22:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752792826; cv=none; b=ZKJQ/esueGIUQA9iz3BrgUdfsEXgIT60oPZvEH+raqYS85A5vbU+zijkbAwMR4qqgYqLl1+fY2RQw+cSU/4sAismryvThhtoB8A7fwzjQ5u4uVs5UuTuxkz9nduFtcwkmL1rgdWrrqWJcjAvZNj9r8Uiv9GbBY/b+XPwVUnUgRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752792826; c=relaxed/simple;
	bh=+i/arNQ0Jga/+PJfNX7UaogYiRd2Lj9E8jimLfxuh5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MWnjm4ShB7/waEU1TBUhedeZAPF6JEdS1J1m+NG7Fktq8HM2ZOdERLsMQb2oyLCRBb+agzgs8VEuYfOrzv2H3+sCtEuhmGka9iMNrw+ekJW5BefmBEUdoiYN7antjNflcentHrzTDtZQGItJbUpmp63Pep7VwbCe2IbQH1qEn48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAdXQzl/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAdXQzl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752792826; x=1784328826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+i/arNQ0Jga/+PJfNX7UaogYiRd2Lj9E8jimLfxuh5g=;
  b=cAdXQzl/WB8+OZMyQBV20vM7BbvUtGXklfKoHiplWXtxFpC9f5OctHEP
   L1LLVlUXBwvAMDYDmNXvUF/dwQZyRAfiKRvkDVMM7a1JC6MiC96W6j0O9
   ZBnF00xR2E9zbuzLeBZ4renydoY6gVttoFJhGAq6ObKF9aRXrahgTfbxl
   41ZkaNtxMqyVShUqLqBN35YoJEMkt1E5Hzq+kT4BVWUD5AYtoArT6PgyS
   bgyM3mfb9Z1+5nzwrRo3Z99ziTwyEr9Rk81StD5FESdoC+vdrgyCgrODd
   rDbVvcox/sOy8ohNQTjgC2tRkHgBUTh9UQ3yWpK8AEQfNJXbwBBWpq0Yt
   A==;
X-CSE-ConnectionGUID: acztRebpTdK0/vhyOou6Tw==
X-CSE-MsgGUID: prasFIV4QFqSnrAIEiG4TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55229683"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="55229683"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 15:53:45 -0700
X-CSE-ConnectionGUID: IOXYwGXUT9mib6ZgCaQz4g==
X-CSE-MsgGUID: 9SEwx1HbSKy9x6TSPSAJYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="162192155"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Jul 2025 15:53:43 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucXTv-000E5D-2o;
	Thu, 17 Jul 2025 22:53:39 +0000
Date: Fri, 18 Jul 2025 06:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: [linux-next:master 8663/10823] ld.lld: error: undefined symbol:
 devm_spi_offload_rx_stream_request_dma_chan
Message-ID: <202507180620.bPnQTVKp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
commit: 219da3ea842a156e5808176e11db256db9798f6c [8663/10823] iio: adc: ad_sigma_delta: add SPI offload support
config: x86_64-buildonly-randconfig-001-20250718 (https://download.01.org/0day-ci/archive/20250718/202507180620.bPnQTVKp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180620.bPnQTVKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180620.bPnQTVKp-lkp@intel.com/

Note: the linux-next/master HEAD 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_spi_offload_rx_stream_request_dma_chan
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(devm_ad_sd_setup_buffer_and_trigger)
--
>> ld.lld: error: undefined symbol: devm_iio_dmaengine_buffer_setup_with_handle
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(devm_ad_sd_setup_buffer_and_trigger)
--
>> ld.lld: error: undefined symbol: devm_spi_offload_trigger_get
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(devm_ad_sd_setup_buffer_and_trigger)
--
>> ld.lld: error: undefined symbol: devm_spi_offload_get
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(ad_sd_init)
--
>> ld.lld: error: undefined symbol: spi_offload_trigger_enable
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(ad_sd_buffer_postenable)
--
>> ld.lld: error: undefined symbol: spi_offload_trigger_disable
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(ad_sd_buffer_postdisable)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
