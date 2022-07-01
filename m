Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E49110F1
	for <llvm@lists.linux.dev>; Fri,  1 Jul 2022 08:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656664836; x=1688200836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yNbLeOU8ZncDWv6Jreaj3wNMxmSS4ObZi6ZL7+WXThM=;
  b=bQGShEpdDbGK2UxrVYkUhwAVgR7I8fRAsetHCz4bhH5ReODtkrSmlHXx
   LTx2RBCiSKz5EIrJZzgWoVZ+bzbgrQk8IUObtfXrMP0FpyyX3nGrQ+sL6
   rAV/KNNvs2Sh+bxXWF5X9S6lKKlnuYJYb5bL/b7daapMSbnDDBd/u3/Kn
   wTvnPAwVqZcSUlsdFfhxLWb+pLMXLCaqWJcbvBNc9k1E6Tuxz2kBDsy5D
   FbxLOAo/ZyY0Jv5ZnwuPGxL69I3oGqGWiM5rZUS1koCvvv+HE4QWK86sP
   4M2j43i3xWAXKO9FQ9iy74s7NXZT8D9Bkvsa14ZGlAxZZYMQHBkwWqkYJ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="280141974"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="280141974"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2022 01:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; 
   d="scan'208";a="694429019"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Jul 2022 01:40:34 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o7CCX-000Dkk-Q1;
	Fri, 01 Jul 2022 08:40:33 +0000
Date: Fri, 1 Jul 2022 16:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [asahilinux:bits/050-nvme 8/10] drivers/soc/apple/rtkit.c:665:9:
 error: call to undeclared function 'mbox_client_poll_data'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202207011600.x6cjbQ0z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hector,

FYI, the error/warning still remains.

tree:   https://github.com/AsahiLinux/linux bits/050-nvme
head:   5b3910635863df45900af347c932d5468e7541fc
commit: ecb1172a9cbf4c3ad18fa5c259380a116c2f00e6 [8/10] soc: apple: rtkit: Add apple_rtkit_poll
config: arm64-randconfig-r001-20220629 (https://download.01.org/0day-ci/archive/20220701/202207011600.x6cjbQ0z-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a9119143a2d1f4d0d0bc1fe0d819e5351b4e0deb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/AsahiLinux/linux/commit/ecb1172a9cbf4c3ad18fa5c259380a116c2f00e6
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/050-nvme
        git checkout ecb1172a9cbf4c3ad18fa5c259380a116c2f00e6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/soc/apple/rtkit.c:665:9: error: call to undeclared function 'mbox_client_poll_data'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return mbox_client_poll_data(rtk->mbox_chan);
                  ^
   drivers/soc/apple/rtkit.c:665:9: note: did you mean 'mbox_client_peek_data'?
   include/linux/mailbox_client.h:46:6: note: 'mbox_client_peek_data' declared here
   bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
        ^
   1 error generated.


vim +/mbox_client_poll_data +665 drivers/soc/apple/rtkit.c

   662	
   663	int apple_rtkit_poll(struct apple_rtkit *rtk)
   664	{
 > 665		return mbox_client_poll_data(rtk->mbox_chan);
   666	}
   667	EXPORT_SYMBOL_GPL(apple_rtkit_poll);
   668	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
