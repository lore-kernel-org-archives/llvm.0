Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3C979F2;
	Sun,  3 Nov 2024 00:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730595428; cv=none; b=tksdpP+rYult401Y97rra3KA8L2ofFjadkSVaavvlf0prbUXsqwqezLRBsDAeH8Tq+doUMjrh1LZadxj3g5khxSAaxeeNrZVveeSPZrdJT+gX4erAlqrrpjBYpr6rbSOAB0uW+z03e/q4e3wcBkvBeuHq1xZD1WMjaN87kNvnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730595428; c=relaxed/simple;
	bh=m3czOQamkfWtBqcSINNWA4L2k1BneVoUt3ks3i+MJH4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+SHNQj5PoHDrIGGoNc9EJ7QqyQ8Hta5ZQyF9T+3zWG+faBhN3sZHI8Ij6WFCyABHl+x119esT3jc+XedIKyr3RnSBtI6yfCr9fQ0iqz2EgUjp1LUaRsQM/YvipVQ4ucDgayBbXLjDOZS3LDAjiXDg7SQqdxgdJzzMgwbiObCps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNp4QNpz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNp4QNpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730595427; x=1762131427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3czOQamkfWtBqcSINNWA4L2k1BneVoUt3ks3i+MJH4=;
  b=GNp4QNpzbEGfB64EaAp9bNu6tsyIngwUAui8yQOZn0Oarnn21iB21aCh
   5mmwxOA5UCgysigSX+XvOyCpyKrSsXjC2BBaqLBnOKXfdq3UEFYMlBiKb
   PF7CyeS3VkZlTxY96tbef+YGuBeDXmchH0emtcJY8ExbY8a1k+CJola6+
   ke9ZH1RJXjUjkWXQqzdslsVAUyC8ehuB3ghVPdvkFIyirIH3lU4XXXpR3
   u/hVhK5BmhS0vKmERvP2Gc8ouFxbpX8cfruSdQP3Y4qrxtCwlDlfdp2LE
   Frg9kIEriLsRRYrT+j8QwsvIkrxs1xV2NqhIs9c6h1J99Joo9gooNdN2W
   g==;
X-CSE-ConnectionGUID: CfWrU4HmQ9i5RFq2+qx2rA==
X-CSE-MsgGUID: JrL1p7U9R3Oj4yn0GH/LBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="30434665"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="30434665"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 17:57:06 -0700
X-CSE-ConnectionGUID: OOgjJW02Tg+bN94NwPlMYw==
X-CSE-MsgGUID: oNOqWdNpSX6QrmVn2Vt8MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="83411876"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Nov 2024 17:57:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7OvO-000jWT-0y;
	Sun, 03 Nov 2024 00:57:02 +0000
Date: Sun, 3 Nov 2024 08:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Angelo Dureghello <adureghello@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>
Subject: [jic23-iio:testing 104/148] ad3552r-hs.c:undefined reference to
 `devm_iio_backend_get'
Message-ID: <202411030816.f1p0T0j0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   861c99a3cdaf02d836648c896a9db63cf9e93f8c
commit: 4d5792b6681845344d7c1194312895c1a6135f4d [104/148] iio: dac: ad3552r: add high-speed platform driver
config: um-randconfig-001-20241103 (https://download.01.org/0day-ci/archive/20241103/202411030816.f1p0T0j0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030816.f1p0T0j0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411030816.f1p0T0j0-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/iio/dac/ad3552r-hs.o: in function `ad3552r_hs_probe':
>> ad3552r-hs.c:(.text+0x43): undefined reference to `devm_iio_backend_get'
>> /usr/bin/ld: ad3552r-hs.c:(.text+0x8b): undefined reference to `devm_iio_backend_enable'
>> /usr/bin/ld: ad3552r-hs.c:(.text+0x10b): undefined reference to `devm_iio_backend_request_buffer'
   /usr/bin/ld: drivers/iio/dac/ad3552r-hs.o: in function `ad3552r_hs_setup':
>> ad3552r-hs.c:(.text+0x1fa): undefined reference to `iio_backend_ddr_disable'
>> /usr/bin/ld: ad3552r-hs.c:(.text+0x4ab): undefined reference to `iio_backend_data_source_set'
   /usr/bin/ld: ad3552r-hs.c:(.text+0x4fb): undefined reference to `iio_backend_data_source_set'
   /usr/bin/ld: drivers/iio/dac/ad3552r-hs.o: in function `ad3552r_hs_buffer_postenable':
>> ad3552r-hs.c:(.text+0x935): undefined reference to `iio_backend_ddr_enable'
>> /usr/bin/ld: ad3552r-hs.c:(.text+0x962): undefined reference to `iio_backend_data_transfer_addr'
>> /usr/bin/ld: ad3552r-hs.c:(.text+0x994): undefined reference to `iio_backend_data_format_set'
>> /usr/bin/ld: ad3552r-hs.c:(.text+0x9c0): undefined reference to `iio_backend_data_stream_enable'
>> /usr/bin/ld: ad3552r-hs.c:(.text+0xa16): undefined reference to `iio_backend_ddr_disable'
   /usr/bin/ld: drivers/iio/dac/ad3552r-hs.o: in function `ad3552r_hs_buffer_predisable':
>> ad3552r-hs.c:(.text+0xa4c): undefined reference to `iio_backend_data_stream_disable'
   /usr/bin/ld: ad3552r-hs.c:(.text+0xaab): undefined reference to `iio_backend_ddr_disable'
   clang-14: error: linker command failed with exit code 1 (use -v to see invocation)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
