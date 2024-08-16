Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870881BE238;
	Fri, 16 Aug 2024 16:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723826592; cv=none; b=iAX18w1hO5B3s9QWrR42Pd2cI1FCmCKUVya541Eqdw4Ov+CZuNQpMyFh7ddBlULg9YuCQ6vF46Fw/+8s7di03e9GFM3ParUqvq3Rp13KHk2KA4ihQXDZ7Y+Nzt8mDR1nQMe62s6k0vCMlk7UxV6WGAb+YUQfVmKEmnGj4AYF+eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723826592; c=relaxed/simple;
	bh=s+RQV6PGC3uVHE7m6vUGArXaA2d1pLNwa8KRwlQhtxg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HBCfIhQO5ulUD53fxYqW+QC56ewNz9ntzkLtZZ27nm1vlJYzc4HqxGOBPwjqa5yv4Unz9Jk+Zta7ajjpyVYIp1N4tCz6GbZ8/8DMMw2277LWh6Wh1/Pa/J9YRhZ8Y57cq0oaT3eldUz+QxPL+83qyMq/Z5/S+xQmpkjpfl8eEo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CALPdqph; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CALPdqph"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723826591; x=1755362591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s+RQV6PGC3uVHE7m6vUGArXaA2d1pLNwa8KRwlQhtxg=;
  b=CALPdqphx7i1cwO7e9MpLs880WUgxaBoUyXaZm2J0SpO3iJqBO/dvG0E
   7Tlx0fomXdHtew8g4qRRp8j/MYaD1YzqHjsKDTh+YiZi8giFtgVkdjHYS
   hTFpI5xoBBwG38S6XdeDUQGWXiBtdBBhi4n0IMbn+Qc7iYrVRwQ8YDJB5
   ix+gyt73p/crkWNSernrlhxQsF2XuCZZAcb21zegPScBEYfMMJjSU6meJ
   6Iw8LlFgpH0+78j0tzh4eBwWshw9nbCzFkwIrfRfIJEmlHhd+a3Z9GtQI
   BvJRJX5WUSBVb0DDLgMOKhLRcSoUy6hhuNV5MRuHimyhHJZonedm5oisk
   A==;
X-CSE-ConnectionGUID: psxChjIeQBCUj8pzGJMnBA==
X-CSE-MsgGUID: /KQwoOFaQpiZ7ztsYUOolw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22275352"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22275352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 09:43:06 -0700
X-CSE-ConnectionGUID: DACMLw01TR2IEgF6vZ9iMg==
X-CSE-MsgGUID: r5nXrdmxR42MnH/wvDMqEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59745117"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2024 09:43:05 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf02Y-0006eY-2T;
	Fri, 16 Aug 2024 16:43:02 +0000
Date: Sat, 17 Aug 2024 00:42:40 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Philipp Stanner <pstanner@redhat.com>
Subject: [drm-misc:topic/rust-drm 9/19] error[E0425]: cannot find function
 `iounmap` in crate `bindings`
Message-ID: <202408170035.K8VPd6FK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc topic/rust-drm
head:   ac3b90930f007514defbf06ec63a07122b02ba8a
commit: 41bf8ed78cc51e13c60dbc7ff755a74ca968b91f [9/19] rust: add `io::Io` base type
config: um-randconfig-001-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170035.K8VPd6FK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170035.K8VPd6FK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170035.K8VPd6FK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `iounmap` in crate `bindings`
   --> rust/doctests_kernel_generated.rs:2439:28
   |
   2439 |         unsafe { bindings::iounmap(self.0.base_addr() as _); };
   |                            ^^^^^^^ not found in `bindings`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
