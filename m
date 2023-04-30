Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3072F5F;
	Sun, 30 Apr 2023 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682877224; x=1714413224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sKWu2WV9aQCaJ/IIGp/6UiAM0mrYzGxbp4Z/NCJnDLM=;
  b=iwE/M3TdHlhGIh4sDufWxnz0c9rszVPLkhHQKGSb0gtsE4QeYew1x42A
   kce87JCTaCT/eWVusgY2rsc9Z+H7mGg5bADgKeeiU+sQkCOsgcfe8eFDY
   AQtXNCuYhTnaal9ImwLk6WMzkJasXErS1bPnTHsy6e+6fz/0aZVeBCxSq
   S+QeqIBuTHFx30SDyUtyH16rxmrm2Eu7LNm+Ik0zUmF/roB3sdbFPz4ck
   86cDagcEQUkW7QmndY54JDMesMnRgQeffUh7P4IYVsXeBKXdfqHPqetcU
   rUvVeSDn973A9cBoslnABmyYikOhnGhC+mUT60nCk96dni/acqJGBWu/C
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="350990537"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="350990537"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 10:53:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="807183152"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="807183152"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2023 10:53:42 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptBEz-00004j-1r;
	Sun, 30 Apr 2023 17:53:41 +0000
Date: Mon, 1 May 2023 01:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 21/21] Inconsistent kallsyms data
Message-ID: <202305010135.GAFfzfJN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   69f9e1f06c6701ac7b333901d20f6b4b1d46e0a9
commit: 69f9e1f06c6701ac7b333901d20f6b4b1d46e0a9 [21/21] HID: magicmouse: Handle touch controller resets on SPI devices
config: arm-randconfig-r033-20230430 (https://download.01.org/0day-ci/archive/20230501/202305010135.GAFfzfJN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b1465cd49efcbc114a75220b153f5a055ce7911f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/AsahiLinux/linux/commit/69f9e1f06c6701ac7b333901d20f6b4b1d46e0a9
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/090-spi-hid
        git checkout 69f9e1f06c6701ac7b333901d20f6b4b1d46e0a9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010135.GAFfzfJN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Inconsistent kallsyms data
   Try make KALLSYMS_EXTRA_PASS=1 as a workaround

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
