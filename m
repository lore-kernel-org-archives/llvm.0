Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9BB15ACF;
	Wed, 22 Nov 2023 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GfsNtrP+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700664548; x=1732200548;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZW0MmWCCDuSTQ75wbVdcD66ugRg9igV72fW6yqcVCyI=;
  b=GfsNtrP+tYWgxpVI4TU0GBV1jqiw6Q3tjmc6aeZTyUHKCQvUX9TPjhHg
   YJ4pCp7nNsDorCrIc4Y9cIpMIN40CUIJelqk0oYyv0wU3rZAo267ZUwrJ
   nHt/lC2XLjLuPG0jT/RObcmyqlJyyY5Fr89A5hZabPOmILhHlgf2rya70
   OrZqPSo4l9OGfSQbugciHsHhLF3C9YBbQo28pe2EZBY7rROuvGCHkCJUM
   oS3aoUm+DlYqG4zbvw4oOazXTr89TtTSvLN4d2qHOYxZElEn+Zl9K8aNZ
   2p733s39Zq24oQEuXq0WOnpbskJI4gKsPNDPvNRe0E2wbNVEDBFmJszE+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="478269616"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="478269616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 06:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="15284537"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2023 06:49:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5oXG-0000ZU-0X;
	Wed, 22 Nov 2023 14:49:02 +0000
Date: Wed, 22 Nov 2023 22:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.7-rc1 5/5] ld.lld: error:
 undefined symbol: kernel_sec_end
Message-ID: <202311221930.mvISUu5k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.7-rc1
head:   5c1e67778bd34494bdd0eb10ad26e3db1378c43a
commit: 5c1e67778bd34494bdd0eb10ad26e3db1378c43a [5/5] hack to print highmem and vmalloc start
config: arm-randconfig-002-20231122 (https://download.01.org/0day-ci/archive/20231122/202311221930.mvISUu5k-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221930.mvISUu5k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221930.mvISUu5k-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kernel_sec_end
   >>> referenced by setup.c
   >>>               arch/arm/kernel/setup.o:(setup_arch) in archive vmlinux.a
   >>> referenced by setup.c
   >>>               arch/arm/kernel/setup.o:(setup_arch) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: kernel_sec_start
   >>> referenced by setup.c
   >>>               arch/arm/kernel/setup.o:(setup_arch) in archive vmlinux.a
   >>> referenced by setup.c
   >>>               arch/arm/kernel/setup.o:(setup_arch) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
