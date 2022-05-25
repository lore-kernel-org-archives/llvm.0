Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644F72569
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 22:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653516741; x=1685052741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Wo76B/Eqk9nONCDhyVIm2GFOyBcbcBMDqB65FrTTl0=;
  b=Rln8DlXB47iQtKonNUyOXHfj0O67yUMdFqqoA74MhDE5U3UaVqfUbFqf
   obQm+r/LzfolS3V6O+Nd8SkNHd+pMcmZ3YJq4iNnVO/LkWJDWcTUSHcJp
   9xPKzS3Zbknp5ufUur42WUG4LeHUabl8j8p7v2MUR+2kECxcRRtzTM5T0
   E7Lv8kAuqOUuWxh9xMr7DEmvFtwExHDb3KCiRjo6yhThVIwa7eRodbeKz
   W7f0zAA9BRP6PWv46jJIZ3tddTVn+qJ9cLu/1B0ocOa0wLF2Nn2Mvn+wS
   HS9IdYtNwq5s1ww7cB0E/I9RByutpNXqZZZF8ENWurj+3Z19hnczL4dWf
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="253818851"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="253818851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2022 15:12:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; 
   d="scan'208";a="602502105"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 May 2022 15:12:19 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntzEo-0003Lx-GK;
	Wed, 25 May 2022 22:12:18 +0000
Date: Thu, 26 May 2022 06:11:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [asahilinux:bits/050-nvme 8/9] drivers/soc/apple/rtkit.c:665:9:
 error: call to undeclared function 'mbox_client_poll_data'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202205260646.kktYCjXu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/050-nvme
head:   54dfe8ce63a23f4a11e9aa0481a09a6ec2267b2f
commit: ecb1172a9cbf4c3ad18fa5c259380a116c2f00e6 [8/9] soc: apple: rtkit: Add apple_rtkit_poll
config: arm64-buildonly-randconfig-r005-20220524 (https://download.01.org/0day-ci/archive/20220526/202205260646.kktYCjXu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d52a6e75b0c402c7f3b42a2b1b2873f151220947)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/soc/apple/

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
