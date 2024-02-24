Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59A814005;
	Sat, 24 Feb 2024 03:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708746636; cv=none; b=r2FvbEePQLTChloTemjE5mRFKJzI7c/IHRnLEy8f5AVL1cX9vATlQ8RuY4KiZv+b0vhmKYg+XVgF+AWc/8szWsgj/QyyUi2Q6BFNDMtB0Dk1LzWRnAxw8vCG2nFzcVLko5fGlrdDg04ffP+h1z8NdFJu7eu5ECwWRkIyuzN0cEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708746636; c=relaxed/simple;
	bh=/pLQwgxwxtbHTw4HGuJPEviOWTbtgE1ay7TmfAMJkSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sGzd/GDJKECHV7AcbmTr0jDbTev3eg20xpUHjUS1WXGmEiimnB2ibhmm32l7SVl+abC91+CidV7say3liF/IoM6IpXRaBbxEaXSOJuzxebfSfr3LLBohtz7l7bancGTZBILCq+UHygFJJX440mAI1t1lNg8pQzY1U/F5vb9jsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=csR2DxBX; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="csR2DxBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708746634; x=1740282634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/pLQwgxwxtbHTw4HGuJPEviOWTbtgE1ay7TmfAMJkSM=;
  b=csR2DxBXlWq7hPALwMwt+rVdsplVoBB6GHKFh12Tl+1lPR4Dw4o4O8ZW
   eRnM/f3Kw2zvdMyIGsPP82lYH63dnWCDWIIaefgs6shDHPPf8laN9O7t3
   xMjN/8pwIQa71P4/QOycfgtlblYtKN+Bt1pJ3ZAwM/noxObIYuBwkkjQv
   6sr9pzmfMbWi8BC+Wp+umCQ4fRUv/21luwMvVoCZf+KZ6e6oolAEIIdKf
   /xfQPRsqGGcvVkySIoKn8djFsFJpvyw6bxsg5UolLtWiO8DFiE6z8TnCF
   m76rYlguoQNasLPvkHBB5qPjcoN1J1KN4J8iYRH4hXdWP3m0A7bMbOBhB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="14219962"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="14219962"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 19:50:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="6090136"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 23 Feb 2024 19:50:31 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdj3U-0008Bg-2q;
	Sat, 24 Feb 2024 03:50:28 +0000
Date: Sat, 24 Feb 2024 11:49:12 +0800
From: kernel test robot <lkp@intel.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [linux-next:master 6213/9575] igc_leds.c:undefined reference to
 `devm_led_classdev_register_ext'
Message-ID: <202402241123.p7RgyuiU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33e1d31873f87d119e5120b88cd350efa68ef276
commit: ea578703b03d5d651b091c39f717dc829155b520 [6213/9575] igc: Add support for LEDs on i225/i226
config: um-randconfig-001-20240223 (https://download.01.org/0day-ci/archive/20240224/202402241123.p7RgyuiU-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240224/202402241123.p7RgyuiU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402241123.p7RgyuiU-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: drivers/net/ethernet/intel/igc/igc_leds.o: in function `igc_led_setup':
>> igc_leds.c:(.text+0x173): undefined reference to `devm_led_classdev_register_ext'
   clang-16: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
