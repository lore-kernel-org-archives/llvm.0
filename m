Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721E1E492;
	Mon, 28 Jul 2025 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753673150; cv=none; b=bCgr9T2yAZm52cYmHV+u8UYkk00FX5I/zgB+qbSxMQp9YfpbKHQRgeqUKNc64Ayxxk0QXctwfXvwaVlAUzcFHIMVp7toCG8jODcavW2I4A66phn/E5+2jw7UDPj+l5OWc7J8Fq8q8NWs1od9rqie1ZMz4AwBLnUCrhOfE2/BaSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753673150; c=relaxed/simple;
	bh=LzgrEov8CSNa3SuW5cKo1jXscg8fIHoPiTUNmncJ84k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UMqc5dcR5El9dUPxqNvBeqyNbZ/nVaItJGcs7oS0SS2RCZWRmsIi1iqGeYII4Y93lwGtOWFOEs9KGPVCoWnDLp680Wfz+di+dEsTKwT225pdcqpSEVYTUS6wOyfJFQJM0/tzpLAN5ZG271WbKPxAXGlbfVBlH96YOsdrH57eNVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qz9r6TmJ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qz9r6TmJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753673149; x=1785209149;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzgrEov8CSNa3SuW5cKo1jXscg8fIHoPiTUNmncJ84k=;
  b=Qz9r6TmJ/yhgDb9b6r3zsCnxPTrtO3eKtBGU2i36bXzs4KtjFPQ8/cCH
   zhi9Uwg+GlkS69yH7nJwjG7wxGRg9NDnkPSTYZmj7vuKpckFOZTPI13Hm
   EyP5Ycg9LYQAvDUJqOTYA0WGIUOEgoczfxSXKYVUsdo8ZCN7Yv+yKkOLW
   0kFCsL2xh3ifaErXk3tcypQS6+2qFocXrNEcYsvvWcynAnHKrBtrrFqA0
   kokvlcPqh0xLdDW7weVPIzZHQX5DMcXFYX6Y6rf2lA6SaHuOCHMf2xZ6M
   n/dOA8iewl8VmmCNOKLIPzKlbybxDv6oqkGyPp3rLHk/rm8y+l7IWN/Sk
   g==;
X-CSE-ConnectionGUID: efiLPdRVT4aa2bssIY7ejg==
X-CSE-MsgGUID: POaDW8wFQXy/GHmtq8tLyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="67264694"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="67264694"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2025 20:25:48 -0700
X-CSE-ConnectionGUID: JW92bUTmQECAg1iapQ7bQg==
X-CSE-MsgGUID: mHq75zdqTRGHr5mToXtQEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162177815"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 27 Jul 2025 20:25:47 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugEUi-0000U7-2K;
	Mon, 28 Jul 2025 03:25:44 +0000
Date: Mon, 28 Jul 2025 05:25:27 +0200
From: kernel test robot <lkp@intel.com>
To: David Lechner <dlechner@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Subject: [linux-next:master 8316/12319] ld.lld: error: undefined symbol:
 devm_iio_dmaengine_buffer_setup_with_handle
Message-ID: <202507280508.NTndvTIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: 219da3ea842a156e5808176e11db256db9798f6c [8316/12319] iio: adc: ad_sigma_delta: add SPI offload support
config: i386-buildonly-randconfig-2001-20250728 (https://download.01.org/0day-ci/archive/20250728/202507280508.NTndvTIT-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250728/202507280508.NTndvTIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507280508.NTndvTIT-lkp@intel.com/

Note: the linux-next/master HEAD d7af19298454ed155f5cf67201a70f5cf836c842 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_iio_dmaengine_buffer_setup_with_handle
   >>> referenced by ad_sigma_delta.c:820 (drivers/iio/adc/ad_sigma_delta.c:820)
   >>>               drivers/iio/adc/ad_sigma_delta.o:(devm_ad_sd_setup_buffer_and_trigger) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
