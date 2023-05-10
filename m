Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C62B1E515;
	Wed, 10 May 2023 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683757910; x=1715293910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ksL9PmF3UpHvK3YfXNaIxMcf806SPkR6S3TXTShZ/pE=;
  b=oG+BGBKJ/IoZgoA66BgiFSwBXNVe3fRyuzPcvD9Wj8b1znoRaT4Eg6SB
   iTAddVd5mLi8u3/RWC7GbBYo/fQi9wJwrGWj6PPXzP14FI0lBAbXbFWPK
   fRlyaJIwQW4v6wS6Gisat9SVxRS3jWjUWRf89ZH3Jpp/3vX5EpkPf75Gw
   FTl2edFvGhZmKDEIlD3EpEpfTOsIb8sAghHvE8ZaRQbNU9lTwiXf7s8lf
   hP1o9mHi1o8em7z5+0tP4S/SISLbRmDZ4KoH9yjke72eC2Q6sOwSCth0A
   hUNsrrth/xm5ulIuXzTQwnJ0I7tqTZRLoDVMd1ENA+WbTv3pgC2XmjWRa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436662080"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="436662080"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 15:31:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="945879850"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="945879850"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 May 2023 15:31:47 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwsLb-0003d6-33;
	Wed, 10 May 2023 22:31:47 +0000
Date: Thu, 11 May 2023 06:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@kernel.org>
Subject: [niks:has_ioport_v4 36/41] drivers/usb/host/pci-quirks.c:289:5:
 warning: no previous prototype for function
 'usb_hcd_amd_remote_wakeup_quirk'
Message-ID: <202305110634.RGuHbrxM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   b873f53aa1a6487f4a450747bd5ee38afad6dfe4
commit: 216a01adc35d677e5b2db113a4df427faae01e75 [36/41] usb: pci-quirks: handle HAS_IOPORT dependencies
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230511/202305110634.RGuHbrxM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=216a01adc35d677e5b2db113a4df427faae01e75
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 216a01adc35d677e5b2db113a4df427faae01e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305110634.RGuHbrxM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/host/pci-quirks.c:289:5: warning: no previous prototype for function 'usb_hcd_amd_remote_wakeup_quirk' [-Wmissing-prototypes]
   int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
       ^
   drivers/usb/host/pci-quirks.c:289:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
   ^
   static 
   1 warning generated.


vim +/usb_hcd_amd_remote_wakeup_quirk +289 drivers/usb/host/pci-quirks.c

ad93562bdeecdde Andiry Xu     2011-03-01  288  
7868943db1668fb Huang Rui     2013-09-16 @289  int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev)
7868943db1668fb Huang Rui     2013-09-16  290  {
7868943db1668fb Huang Rui     2013-09-16  291  	/* Make sure amd chipset type has already been initialized */
7868943db1668fb Huang Rui     2013-09-16  292  	usb_amd_find_chipset_info();
e788787ef4f9c24 Sandeep Singh 2017-08-04  293  	if (amd_chipset.sb_type.gen == AMD_CHIPSET_YANGTZE ||
e788787ef4f9c24 Sandeep Singh 2017-08-04  294  	    amd_chipset.sb_type.gen == AMD_CHIPSET_TAISHAN) {
7868943db1668fb Huang Rui     2013-09-16  295  		dev_dbg(&pdev->dev, "QUIRK: Enable AMD remote wakeup fix\n");
7868943db1668fb Huang Rui     2013-09-16  296  		return 1;
7868943db1668fb Huang Rui     2013-09-16  297  	}
e788787ef4f9c24 Sandeep Singh 2017-08-04  298  	return 0;
e788787ef4f9c24 Sandeep Singh 2017-08-04  299  }
7868943db1668fb Huang Rui     2013-09-16  300  EXPORT_SYMBOL_GPL(usb_hcd_amd_remote_wakeup_quirk);
7868943db1668fb Huang Rui     2013-09-16  301  

:::::: The code at line 289 was first introduced by commit
:::::: 7868943db1668fba898cf71bed1506c19d6958aa usb: core: implement AMD remote wakeup quirk

:::::: TO: Huang Rui <ray.huang@amd.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
