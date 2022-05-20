Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6917E
	for <llvm@lists.linux.dev>; Fri, 20 May 2022 22:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653086720; x=1684622720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o4eShQuICh2oAKhTgshSB57nIilqqHc+OOg2MrHtP5s=;
  b=MzFFLRem/KIqp/VW2bkhSN7p7tkh5inwtpiQjkEuT4oSJAEfP/dRsPr9
   //KgqLEGohVPjvV6DbYOt/WUpIQhYAnwXrg9ZSqZvekW09IDPjkx0oJM7
   9VAYDjFe2sSZmLpyps/poPzbKVWIx3cAVhaCEPfckYCeEUrSP3KeDn/Nc
   ZlHbDI/FCkQdtCu7/IpQyQGNsoYgf54MmcQTr5IwPxmxslfW20aiS416k
   YCEZYK6HJpPxfZiU0TjU/zx8oIw6agwEP3mnZQS67rTHruc8UH9s/cuAJ
   iyFIJGuTI1YHK/9NcYyi0kaELGkthlxBGjM8IPggpezuWaxkR4XpIy/Aq
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10353"; a="254813517"
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; 
   d="scan'208";a="254813517"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2022 15:45:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,240,1647327600"; 
   d="scan'208";a="743707025"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 May 2022 15:45:17 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nsBMz-0005Zi-Cs;
	Fri, 20 May 2022 22:45:17 +0000
Date: Sat, 21 May 2022 06:44:47 +0800
From: kernel test robot <lkp@intel.com>
To: Eli Cohen <elic@nvidia.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>
Subject: [linux-next:master 12360/13468] ld.lld: error: duplicate symbol:
 mlx5_lag_mpesw_init
Message-ID: <202205210606.9cfByU2R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18ecd30af1a8402c162cca1bd58771c0e5be7815
commit: 94db3317781922ba52722c58061e0e8517d4d80d [12360/13468] net/mlx5: Support multiport eswitch mode
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20220521/202205210606.9cfByU2R-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e00cbbec06c08dc616a0d52a20f678b8fbd4e304)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=94db3317781922ba52722c58061e0e8517d4d80d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 94db3317781922ba52722c58061e0e8517d4d80d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD 18ecd30af1a8402c162cca1bd58771c0e5be7815 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: mlx5_lag_mpesw_init
   >>> defined at mpesw.h:22 (drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:22)
   >>> net/ethernet/mellanox/mlx5/core/lag/debugfs.o:(mlx5_lag_mpesw_init) in archive drivers/built-in.a
   >>> defined at mpesw.h:22 (drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:22)
   >>> net/ethernet/mellanox/mlx5/core/lag/lag.o:(.text+0x0) in archive drivers/built-in.a
--
>> ld.lld: error: duplicate symbol: mlx5_lag_mpesw_cleanup
   >>> defined at mpesw.h:23 (drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:23)
   >>> net/ethernet/mellanox/mlx5/core/lag/debugfs.o:(mlx5_lag_mpesw_cleanup) in archive drivers/built-in.a
   >>> defined at mpesw.h:23 (drivers/net/ethernet/mellanox/mlx5/core/lag/mpesw.h:23)
   >>> net/ethernet/mellanox/mlx5/core/lag/lag.o:(.text+0x5) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
