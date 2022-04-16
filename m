Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C1C7E
	for <llvm@lists.linux.dev>; Sat, 16 Apr 2022 06:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650090774; x=1681626774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ocjQ3/eXentpzqQ+97CV2S3KCa4NtUBOQ49mGpfDFnM=;
  b=gyo+czqz2ur1j/FseD5r+KX85bDtpWOLTYcCCmh4BV1mtC4SbPs8c+rn
   4qivy8wx3jTwc0fXTMYKOZTu3MHJWGqH0yF55pAYCZjJHTSd/cKxyG1+2
   qb/aVBcwHRHTb67lVqYtrKMwXZjJqJyY/WOUnghvgyYvJpBMFEzSbw6tE
   pD6oTDbSvuh5ZqTK8xPpnvD406/hO4A87L76H068t+KIpxy2cQuUHIzt0
   wli9fzt0kMYW4P6KT1AC29Jo856nkD5hE6pncj9ErnuMKVoZEQILaTCoZ
   l141VlM7tKSv7Kf642K/2GSfDBAvvdxOwfZD2R4GCiTSUEGeavUxPmTl5
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="349722967"
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="349722967"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 23:32:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,264,1643702400"; 
   d="scan'208";a="646292565"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2022 23:32:52 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfbzI-0002rV-1F;
	Sat, 16 Apr 2022 06:32:52 +0000
Date: Sat, 16 Apr 2022 14:32:08 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [bvanassche:scsi-gap-zone 8/8] ERROR: modpost: "__aeabi_uldivmod"
 [drivers/scsi/scsi_debug.ko] undefined!
Message-ID: <202204161429.sPIXKI3Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/bvanassche/linux scsi-gap-zone
head:   5531f96720bc0e475e669eb56b7094401c53f928
commit: 5531f96720bc0e475e669eb56b7094401c53f928 [8/8] scsi_debug: Add gap zone support
config: arm-randconfig-r035-20220414 (https://download.01.org/0day-ci/archive/20220416/202204161429.sPIXKI3Z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8e43cbab33765c476337571e5ed11b005199dd0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/bvanassche/linux/commit/5531f96720bc0e475e669eb56b7094401c53f928
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche scsi-gap-zone
        git checkout 5531f96720bc0e475e669eb56b7094401c53f928
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__aeabi_uldivmod" [drivers/scsi/scsi_debug.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
