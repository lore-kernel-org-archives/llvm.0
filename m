Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C062566;
	Sat,  6 May 2023 19:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683402265; x=1714938265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k6dpgsUDtmeOHkKZAVjmplptRtdE0YW6bOGtqRj/IxU=;
  b=ivG6J9dVVQVxXQs8WbI4VC44NRcrjdlroYKwi+y79mRNNgmtp9EZxZFX
   ycjDqkE3KH4LZV38HdqaR4aFWoNWwEarhIud2adkCeigoyUuSF1nCnytn
   UO9fpVm3CqX0/PKOuX15WBbqXj1plVXSYSVWnGScYs5Dx0kdjbUu9kCt3
   C7YFmiY8fn2yqTprrguzj9m9JhdyhaPY/WpHjlRudQ0YITcB5TFpX+db/
   AYCwsPWOsSkM03DD9eqGxXeaKZ56SUiWz41TOVT6YaqigGY7zS54iLpXa
   gae0c09e2O+4yVNbw/0cfnSfdFuakIrviGcLiLYKrP6Dh7EqhvoANn5F7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="351565949"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="351565949"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 12:44:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="944343274"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="944343274"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 May 2023 12:44:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvNpO-0000Sr-1O;
	Sat, 06 May 2023 19:44:22 +0000
Date: Sun, 7 May 2023 03:43:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Hutchings <bwh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Salvatore Bonaccorso <carnil@debian.org>
Subject: [stable:linux-5.4.y 691/8186] ld.lld: error:
 drivers/usb/common/debug.o: contains a compressed section, but zlib is not
 available
Message-ID: <202305070315.ZDRcUF3G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ben,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   ea7862c507eca54ea6caad9dcfc8bba5e749fbde
commit: 7c2392f03f3b3644482383d65a834f05225dc400 [691/8186] Partially revert "usb: Kconfig: using select for USB_COMMON dependency"
config: x86_64-randconfig-r026-20230501 (https://download.01.org/0day-ci/archive/20230507/202305070315.ZDRcUF3G-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=7c2392f03f3b3644482383d65a834f05225dc400
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 7c2392f03f3b3644482383d65a834f05225dc400
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305070315.ZDRcUF3G-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/usb/common/common.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/common.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/common.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/common.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/common.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/common.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/common.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/common/debug.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/common/debug.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/common/debug.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/common/debug.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/common/debug.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/common/debug.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/common/debug.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/led.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/led.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/led.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/led.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/led.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/common/led.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
