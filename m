Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00D5188007;
	Mon, 12 Aug 2024 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723483816; cv=none; b=GMLZzWH3TwrCJQ1scuj2wf5Pre/oKHfw3D5FUPWWSNPv+NsJ/hW6DkoAsLov3rZHH2G8lJP/JtmPHCKWbsnmVZWvwmtT4anJsT3uEHTzH6xnYJvb8ppoEhYcyMhn6BIVSfUj7Y0FlaYmGs/Is/0bFpmxCW2tzoYxbUfvwyqCCqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723483816; c=relaxed/simple;
	bh=990jIGQyzSzKVrquXn3eNDJSz3fT5Gr1ClflYGFzr/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bY+v62KK5ZEcFB+zg/PGdBUjBOpQtUGvMxa5VgffXTNdRVmn6Ky5+DFtR2M8Uq/cQs6tmkg4Cih2q++uc3kmkYXqocQ1Jo85PnsLOPuq2Qcv5b4mFJPKK0wPA3chBwUF1qLHO+9FG1PDi3pHINIS9of4kz78WzOIMfjXoIOji2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chXbMFbn; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chXbMFbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723483815; x=1755019815;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=990jIGQyzSzKVrquXn3eNDJSz3fT5Gr1ClflYGFzr/A=;
  b=chXbMFbnhLkkIVY0wMYRzUWEkKotQQDopcbud/BAFurZCUW1MlMgbXcV
   qm+GpDDJsCXXI9/s2J3jwjgbbVzgeetW5cbBLsjOV2Kgo79nsigYa+jtI
   RHHjw/Fy0H+6rj5JqSGo50yFbTAkEO/BaIbeThfLNVPyGuiBjqSD3bQSi
   uYIGRcNl3y8Zfk5ih09Y3rLFCazB4EkU45DwqtO4iudJ/GerLnZ7fxQBH
   uizR48MJ+RcMfgRdpBzTJ+vHijQiLjYFRYo6IzbOZd6FnlPJaGiWJ6aau
   7DHL9dAM5jHakib0RrluvWmZ3YbR+siCVW6vIT/VE9eWIO1nUxno5QrE1
   A==;
X-CSE-ConnectionGUID: vscZ50N4TK6v4Grf7RhT8Q==
X-CSE-MsgGUID: /19jq+KdRAq5f0I6m+eiYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21742002"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21742002"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 10:30:01 -0700
X-CSE-ConnectionGUID: N5rzp/W3Sy6pDgWE1jBysw==
X-CSE-MsgGUID: DF+lsauUTn6XMFCbcAy6dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63193208"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2024 10:30:01 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdYrj-000C11-33;
	Mon, 12 Aug 2024 17:29:56 +0000
Date: Tue, 13 Aug 2024 01:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jens-wiklander-tee:testing/tuxbuild 3/4]
 drivers/mmc/core/block.c:212: warning: Function parameter or struct member
 'rdev' not described in 'mmc_rpmb_data'
Message-ID: <202408130133.WeRnnzCd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   http://git.linaro.org/people/jens.wiklander/linux-tee testing/tuxbuild
head:   1eeef6f8f4da434303136dbb1f5aee3e7fd20703
commit: d5fda642a1c63784e90a28fe4c66017bf6ec1994 [3/4] tee: add tee_device_set_dev_groups()
config: x86_64-buildonly-randconfig-002-20240812 (https://download.01.org/0day-ci/archive/20240813/202408130133.WeRnnzCd-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130133.WeRnnzCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408130133.WeRnnzCd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/core/block.c:212: warning: Function parameter or struct member 'rdev' not described in 'mmc_rpmb_data'


vim +212 drivers/mmc/core/block.c

97548575bef38a Linus Walleij  2017-09-20  194  
97548575bef38a Linus Walleij  2017-09-20  195  /**
97548575bef38a Linus Walleij  2017-09-20  196   * struct mmc_rpmb_data - special RPMB device type for these areas
97548575bef38a Linus Walleij  2017-09-20  197   * @dev: the device for the RPMB area
97548575bef38a Linus Walleij  2017-09-20  198   * @chrdev: character device for the RPMB area
97548575bef38a Linus Walleij  2017-09-20  199   * @id: unique device ID number
97548575bef38a Linus Walleij  2017-09-20  200   * @part_index: partition index (0 on first)
97548575bef38a Linus Walleij  2017-09-20  201   * @md: parent MMC block device
97548575bef38a Linus Walleij  2017-09-20  202   * @node: list item, so we can put this device on a list
97548575bef38a Linus Walleij  2017-09-20  203   */
97548575bef38a Linus Walleij  2017-09-20  204  struct mmc_rpmb_data {
97548575bef38a Linus Walleij  2017-09-20  205  	struct device dev;
97548575bef38a Linus Walleij  2017-09-20  206  	struct cdev chrdev;
97548575bef38a Linus Walleij  2017-09-20  207  	int id;
97548575bef38a Linus Walleij  2017-09-20  208  	unsigned int part_index;
97548575bef38a Linus Walleij  2017-09-20  209  	struct mmc_blk_data *md;
6f4804800b4e1d Jens Wiklander 2024-01-18  210  	struct rpmb_dev *rdev;
97548575bef38a Linus Walleij  2017-09-20  211  	struct list_head node;
97548575bef38a Linus Walleij  2017-09-20 @212  };
97548575bef38a Linus Walleij  2017-09-20  213  

:::::: The code at line 212 was first introduced by commit
:::::: 97548575bef38abd06690a5a6f6816200c7e77f7 mmc: block: Convert RPMB to a character device

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
