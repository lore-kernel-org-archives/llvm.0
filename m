Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E549B2F2C
	for <llvm@lists.linux.dev>; Tue,  8 Feb 2022 22:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644360015; x=1675896015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zk0H6M+qTcC8xrCsV1lGoyzwJ1os1Hryj6nMq8aZDGM=;
  b=FzwQATfU/P86fXJb/o5KzFhpGKpBuSb61+H67BOTrevg9RfIWNQAZU/O
   KyfN0vm55F0dAwcbTvUBSyBkZRa3SK9lxI2wwR3qg7ihcXG9FWSVShNif
   TAlqLbDIbcpNMsfK6LK4e7Uoy7mm1YAAjPFaALFeWRW0HixWZsCg7fr7V
   Rilua7wfTHU8BGhzo1rcVQf6Gu7MIaBrKqILJswuKvwCJN78fk60DPtjo
   /sdtNi/6/safRs41Ezibho33oKLRrWGiWpEHbKvb85nbtGWUf4ZCMUq5e
   OD7mDBWeDLdTbrxvJFN0sBQI6050vy/XG28//LUrvsnha9BuVBgVn4Ldp
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="248829549"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="248829549"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 14:40:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="482105297"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Feb 2022 14:40:13 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nHZ9g-0000qm-Fq; Tue, 08 Feb 2022 22:40:12 +0000
Date: Wed, 9 Feb 2022 06:39:58 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Barnett <kevin.barnett@microchip.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Mike McGowen <mike.mcgowen@microchip.com>,
	Scott Benesh <scott.benesh@microchip.com>,
	Scott Teel <scott.teel@microchip.com>,
	Don Brace <don.brace@microchip.com>
Subject: [mkp-scsi:for-next 51/53]
 drivers/scsi/smartpqi/smartpqi_init.c:9067:32: warning: unused variable
 'pqi_pm_ops'
Message-ID: <202202090657.bstNLuce-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   62ed6622aaf0ba3c41cc6db6f901cbaa2a7378d1
commit: c66e078ad89e9f171a2474b255284d95c54c4c36 [51/53] scsi: smartpqi: Fix hibernate and suspend
config: arm-randconfig-r003-20220208 (https://download.01.org/0day-ci/archive/20220209/202202090657.bstNLuce-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project e8bff9ae54a55b4dbfeb6ba55f723abbd81bf494)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?id=c66e078ad89e9f171a2474b255284d95c54c4c36
        git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
        git fetch --no-tags mkp-scsi for-next
        git checkout c66e078ad89e9f171a2474b255284d95c54c4c36
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/scsi/smartpqi/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/smartpqi/smartpqi_init.c:9067:32: warning: unused variable 'pqi_pm_ops' [-Wunused-const-variable]
   static const struct dev_pm_ops pqi_pm_ops = {
                                  ^
   1 warning generated.


vim +/pqi_pm_ops +9067 drivers/scsi/smartpqi/smartpqi_init.c

  9066	
> 9067	static const struct dev_pm_ops pqi_pm_ops = {
  9068		.suspend = pqi_suspend,
  9069		.resume = pqi_resume_or_restore,
  9070		.freeze = pqi_freeze,
  9071		.thaw = pqi_thaw,
  9072		.poweroff = pqi_poweroff,
  9073		.restore = pqi_resume_or_restore,
  9074	};
  9075	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
