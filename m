Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772E9814;
	Sun, 27 Aug 2023 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693121405; x=1724657405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VeDjewXNBqpv9EbwNn/IMJ27QSBdEHGEFSDZOCb8yvo=;
  b=SoZ0959AEeAKZKF3QMPagUzTNyK4U0UAbFPnHhaZmfEh6ebN+l6NYCSA
   XHnckuvhKVg3KgSfYhvw9hsw/d3LoxT4QqvqaBhbjGQH5jqszJpXXN4q9
   vZfeMVU3PVvVZUnkZWyGaPaiX6JP3ry4FOY0zsJlh5fDZkdC/2A1a+orr
   v6q5zXNuoft1+B+/KUxbi0mMwTgWxJuUmoHG/qpfuGjKlc3JODmv3wYCj
   h5H2R/myNYK6qG4JXDIGbHiY1P5+kAflaE2YHSuaos22dgoFcL6we/sxc
   MuMBpx78ieePTmrEfD25EfkOPIAvIUBKVLxb/NlOKUxY20oZxxQJVwqle
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="441271561"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="441271561"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 00:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="737919356"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="737919356"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 27 Aug 2023 00:30:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaADi-0005WL-2j;
	Sun, 27 Aug 2023 07:30:02 +0000
Date: Sun, 27 Aug 2023 15:29:59 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 40/48]
 drivers/misc/esp32-ipc.c:221:34: warning: unused variable 'esp32_ipc_match'
Message-ID: <202308271537.Wy57zSor-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   37fd9d9c4f957906efc14a9849942100af4f99e2
commit: 422f7405a1d5afa30398c9b6a9b6bc1b50a83be1 [40/48] esp_wifi: shmem: use esp_ipc driver
config: i386-randconfig-r003-20230827 (https://download.01.org/0day-ci/archive/20230827/202308271537.Wy57zSor-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271537.Wy57zSor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271537.Wy57zSor-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/esp32-ipc.c:221:34: warning: unused variable 'esp32_ipc_match' [-Wunused-const-variable]
   static const struct of_device_id esp32_ipc_match[] = {
                                    ^
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ESP32_IPC
   Depends on [n]: OF [=n] && HAS_IOMEM [=y]
   Selected by [y]:
   - ESP32_WIFI_SHMEM [=y] && NETDEVICES [=y] && WLAN [=y] && WLAN_VENDOR_ESPRESSIF [=y]


vim +/esp32_ipc_match +221 drivers/misc/esp32-ipc.c

8c1fb47acdb23c Max Filippov 2023-08-11  220  
8c1fb47acdb23c Max Filippov 2023-08-11 @221  static const struct of_device_id esp32_ipc_match[] = {
8c1fb47acdb23c Max Filippov 2023-08-11  222  	{
8c1fb47acdb23c Max Filippov 2023-08-11  223  		.compatible = "esp,esp32-ipc",
8c1fb47acdb23c Max Filippov 2023-08-11  224  	}, {},
8c1fb47acdb23c Max Filippov 2023-08-11  225  };
8c1fb47acdb23c Max Filippov 2023-08-11  226  MODULE_DEVICE_TABLE(of, esp32_ipc_match);
8c1fb47acdb23c Max Filippov 2023-08-11  227  

:::::: The code at line 221 was first introduced by commit
:::::: 8c1fb47acdb23c156acdf7b6f286db404d2c508f misc/esp32-ipc: introduce generic IPC for ESP32

:::::: TO: Max Filippov <jcmvbkbc@gmail.com>
:::::: CC: Max Filippov <jcmvbkbc@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
