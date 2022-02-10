Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124932F28
	for <llvm@lists.linux.dev>; Thu, 10 Feb 2022 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644488621; x=1676024621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vFJllaBx0w+b010hGAXYLWjK57pdQU2AtPFApK87vI=;
  b=CR5PMCZPs4gq/luesomcX6rWATa9ZT+zRql3gizgug8mPlyF9bE/ZYQ4
   M61+ZSB1VsLJy6r+vegyqRK+qiKszz/G7IZoqQD65+YSeSs2WGcxs0fHO
   Mahekfi4aJVZKdf15rWN+L1fPr+EgNGGDCn/9CQnK7m3mHZkEEe/HjjdH
   7YN5F8BqvCHMJoKRm9S0OcVsFPi5i6wL164UzFysUft2waktXs8TycHUt
   SYgpyvlFE5QHbIB5R08stekP4/yBuCvTkdzukn6DBN5qIaLuOfbSTQJpG
   qn22ASnWBGM/wh7e4EuMus5OVi3g9lsKq8mkC4jHdNjHaHEToEA64G8ql
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="229428357"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="229428357"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2022 02:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; 
   d="scan'208";a="771683519"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Feb 2022 02:23:39 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nI6by-00035q-Il; Thu, 10 Feb 2022 10:23:38 +0000
Date: Thu, 10 Feb 2022 18:22:54 +0800
From: kernel test robot <lkp@intel.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2750/4901] ld.lld: error: undefined symbol:
 ptp_clock_index
Message-ID: <202202101833.UDN2d73E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   395a61741f7ea29e1f4a0d6e160197fe8e377572
commit: 966f2e1a4a340ef17fef4e35ddbff3f2043ce8d7 [2750/4901] net: lan966x: Implement get_ts_info
config: arm64-buildonly-randconfig-r005-20220209 (https://download.01.org/0day-ci/archive/20220210/202202101833.UDN2d73E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=966f2e1a4a340ef17fef4e35ddbff3f2043ce8d7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 966f2e1a4a340ef17fef4e35ddbff3f2043ce8d7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ptp_clock_index
   >>> referenced by lan966x_ethtool.c
   >>> net/ethernet/microchip/lan966x/lan966x_ethtool.o:(lan966x_get_ts_info) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
