Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C5F1B68
	for <llvm@lists.linux.dev>; Mon, 14 Mar 2022 14:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647267882; x=1678803882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Fn/rtdY6z3i+splslh2Ush124x6+MmeaRJF5pJJ5tw=;
  b=VXM4EDREDdB3bQ78tqH9ox6S7SwI2exlJZTqh9Je/UUvhDpf/zaCVOE3
   Wi66gHa7mvePkmG5ondlEgjUrqp5RKwo/4KrTMGXllreUq/QoxFt/L01i
   zgxJCGs3K0d0/EJFP412Cp8huv27yI54x+iA+oSQVHJmF/JM7k2Hk5ddu
   3OJdN88EApCkvAL0Q9nbyvrQLmok/WhLrGStRyKXt1ZkjSzIF12RiLxsy
   mKENl7BmeYJuF5CjqqJTPWgnogvtJCuzXqjCCGiYXjKOoQ6lWko1hXcxp
   0jZhplO53IpG5WvzkqcfqE7mJ4Aw6ReicMFH/ZvjBWMzhc80Lvx3CA/yF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10285"; a="254869432"
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="254869432"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 07:24:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,181,1643702400"; 
   d="scan'208";a="497628506"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2022 07:24:39 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nTlcl-0009va-7H; Mon, 14 Mar 2022 14:24:39 +0000
Date: Mon, 14 Mar 2022 22:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chaitanya Kulkarni <kch@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-nvme@lists.infradead.org, Christoph Hellwig <hch@lst.de>
Subject: [linux-nvme:nvme-5.18 11/12] ld.lld: error: undefined symbol:
 nvmet_get_feat_async_event
Message-ID: <202203142235.GRM0KrZ4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.infradead.org/nvme.git nvme-5.18
head:   0ad57fcd030f0bda79a3b6c2fb8fc29b871d9538
commit: 7d36f577e5a3f73768327ca237f444e59140e261 [11/12] nvmet: open code nvmet_get_feat_async_event()
config: i386-randconfig-a016-20220314 (https://download.01.org/0day-ci/archive/20220314/202203142235.GRM0KrZ4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 3e4950d7fa78ac83f33bbf1658e2f49a73719236)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme nvme-5.18
        git checkout 7d36f577e5a3f73768327ca237f444e59140e261
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: nvmet_get_feat_async_event
   >>> referenced by discovery.c:343 (drivers/nvme/target/discovery.c:343)
   >>>               vmlinux.o:(nvmet_execute_disc_get_features)
   >>> did you mean: nvmet_set_feat_async_event
   >>> defined in: vmlinux.o

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
