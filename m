Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61071DA58;
	Fri, 10 Nov 2023 16:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m5bbJOCA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699632774; x=1731168774;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2FiCiaCEIwYAaJU4ujZ1sI+d9HiqkjfYakXKQithpxA=;
  b=m5bbJOCA1dOTdfH1nUrBcO/0ZbyBHaLknewtql4Ux07xtn8576O+KoxC
   0bgC5tx7u4fy6eG+LbA5/luMqB8Ze4wj3djLlQn5flKkCgOS/xogmtBWM
   03FM8uqmopFAPe95StEurA9ZtNmW4gJVU5nzYn2fjBf9CbMc9K52ECIbX
   L4s7I896kSIL6NY6o0Kma0noxg7kvEpjldKevE/bzycGad2+A+KD3D0AL
   L0ypcHusNbBBGTTL7wNf0XDM9sG8pYbw3aYJChT0E5DC9wIkF7whotHW0
   ZmN0bKZpbZj9gfrCAmFYiV0OSMoC5wxpuTi3SkCXhOebKl3NmUqJSRFK/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="369533656"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="369533656"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 08:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="713671676"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="713671676"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 10 Nov 2023 08:12:51 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1U7l-0009iW-19;
	Fri, 10 Nov 2023 16:12:49 +0000
Date: Sat, 11 Nov 2023 00:12:04 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: amd_spi_host_transfer() falls through
 to next function amd_spi_max_transfer_size()
Message-ID: <202311110005.jFzk03aZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Yang Yingliang <yangyingliang@huawei.com>
CC: Mark Brown <broonie@kernel.org>

Hi Yang,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89cdf9d556016a54ff6ddd62324aa5ec790c05cc
commit: e9759d403baaeda9ea4d61d64c3151e214561217 spi: amd: switch to use modern name
date:   3 months ago
config: x86_64-randconfig-011-20230912 (https://download.01.org/0day-ci/archive/20231111/202311110005.jFzk03aZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110005.jFzk03aZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110005.jFzk03aZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: ibt_selftest+0xf: sibling call from callable instruction with modified stack frame
>> vmlinux.o: warning: objtool: amd_spi_host_transfer() falls through to next function amd_spi_max_transfer_size()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
