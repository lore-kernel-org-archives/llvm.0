Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7097EE;
	Sun, 27 Aug 2023 06:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693116457; x=1724652457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rKdzXqJTZLFQaXx4+bUwresuIXhWzS+z/pdVnpYHuwQ=;
  b=Ri4UGnUqyRQW4RX6FcQo9zOjhMqrG8oW+rlQKhWOx+z2LXP8DR34DvPl
   Ph9+7S9o1gs8u/BVQbc6SoVLn774liVoYQJt1r4zS8qq7iM9HAck3wKXm
   0AaccS0bf/UmtxCVKCtigKrixQ85kxD2d5zfl+lJg/VQaQcCMhl2hiXwh
   0utbpm9XRx3vZsJS+zUCeWOoG3+9k9TCLlqJyXHPG29spxag/vjLwooPV
   WDC9rfZxf2Z3nfUynuaeSwNaBH+FOzdLUze41DurvAyPbxJPQSKPpGgeu
   MYEc2P26isTuLt5up7Oyz0JKH1wS8yAt8U15BT/bcV/t0jzCDsh6cIuh6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="372322132"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="372322132"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 23:07:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="861471858"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="861471858"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 26 Aug 2023 23:07:34 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa8vu-0005SB-03;
	Sun, 27 Aug 2023 06:07:34 +0000
Date: Sun, 27 Aug 2023 14:06:41 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/48]
 drivers/net/wireless/espressif/esp_shmem.c:474:34: warning: unused variable
 'esp_wifi_shmem_match'
Message-ID: <202308271454.lm4aYA7S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   37fd9d9c4f957906efc14a9849942100af4f99e2
commit: a35d9035c4d7eacb28bc465097fbbee739fe81fa [25/48] esp_wifi: add shmem transport
config: i386-randconfig-r003-20230827 (https://download.01.org/0day-ci/archive/20230827/202308271454.lm4aYA7S-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271454.lm4aYA7S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271454.lm4aYA7S-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/espressif/esp_shmem.c:474:34: warning: unused variable 'esp_wifi_shmem_match' [-Wunused-const-variable]
   static const struct of_device_id esp_wifi_shmem_match[] = {
                                    ^
   1 warning generated.


vim +/esp_wifi_shmem_match +474 drivers/net/wireless/espressif/esp_shmem.c

   473	
 > 474	static const struct of_device_id esp_wifi_shmem_match[] = {
   475		{
   476			.compatible = "esp,esp-wifi-shmem",
   477		}, {},
   478	};
   479	MODULE_DEVICE_TABLE(of, esp_wifi_shmem_match);
   480	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
