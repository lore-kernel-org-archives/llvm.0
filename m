Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4976D2F4A
	for <llvm@lists.linux.dev>; Sat, 11 Jun 2022 23:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654990431; x=1686526431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nF7e6Cf/H1wfL+kyIdf69sd4cPW+AFvUSZNg89AI+8k=;
  b=b8WF2v2nuhi7GX+smtX61gfPMBeMw8kPnLnaaxIAXSZVnLQuWephYFnM
   px2EW3Qdc1my8YpGlWEonzeHiUrykEDp06UP0wlVdGkcwxX8p2qDs8NZI
   +KAaFAWSqzNmzDMP7uId3rXMQAAJnytGncIFwl84+xefidXMKqCxMKkES
   yrab+lBOmxqAN2eIQAKgEgXSmXL8YT7mWI/pqRiSajLStpGGlPuLun1TW
   XE2cKMcLX+C5QlwPxoSf1RA4wJQjkl1yG1U9knZKrMufdQq6PaFOYtEV7
   2n35h1F9re+rFNbPef3hroDyG1rjqX2f07ak1LPyuBl1X4XkEa1a9aXrr
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10375"; a="364282937"
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="364282937"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2022 16:33:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,294,1647327600"; 
   d="scan'208";a="711450386"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Jun 2022 16:33:48 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0Abz-000JPl-To;
	Sat, 11 Jun 2022 23:33:47 +0000
Date: Sun, 12 Jun 2022 07:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chanho Park <chanho61.park@samsung.com>,
	Bharat Uppal <bharat.uppal@samsung.com>
Subject: [mkp-scsi:for-next 31/41] drivers/phy/samsung/phy-fsd-ufs.c:50:3:
 error: field designator 'cfgs' does not refer to any field in type 'const
 struct samsung_ufs_phy_drvdata'; did you mean 'cfg'?
Message-ID: <202206120755.03gKC0ne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   b9f50e3cfd13687279f2170ff6ef5d71f6c7db11
commit: f678ce49991950e4964cd82d3f3a8adfb63a9a70 [31/41] scsi: phy: samsung-ufs: Add support for FSD UFS PHY driver
config: hexagon-randconfig-r045-20220612 (https://download.01.org/0day-ci/archive/20220612/202206120755.03gKC0ne-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ff4abe755279a3a47cc416ef80dbc900d9a98a19)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/commit/?id=f678ce49991950e4964cd82d3f3a8adfb63a9a70
        git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git
        git fetch --no-tags mkp-scsi for-next
        git checkout f678ce49991950e4964cd82d3f3a8adfb63a9a70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/phy/samsung/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/phy/samsung/phy-fsd-ufs.c:50:3: error: field designator 'cfgs' does not refer to any field in type 'const struct samsung_ufs_phy_drvdata'; did you mean 'cfg'?
           .cfgs = fsd_ufs_phy_cfgs,
            ^~~~
            cfg
   drivers/phy/samsung/phy-samsung-ufs.h:104:37: note: 'cfg' declared here
           const struct samsung_ufs_phy_cfg **cfg;
                                              ^
   1 error generated.


vim +50 drivers/phy/samsung/phy-fsd-ufs.c

    48	
    49	const struct samsung_ufs_phy_drvdata fsd_ufs_phy = {
  > 50		.cfgs = fsd_ufs_phy_cfgs,

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
