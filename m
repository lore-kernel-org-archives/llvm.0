Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A96EDA;
	Wed,  1 Feb 2023 10:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675248143; x=1706784143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DDyjh9ni0JcrhKwGHINeoMZe+Iu7ncIw8lJqTLpGyw8=;
  b=b5Uuj5t/snRB25uCvbwXR8XuFlXQrkIz6DIkHoVWKrNc0WDVjz5Ywz1o
   jKJYldmTNC2TmopR4eQCcGsAZi5Twndu6wBCiCjq9Vwhfjs/fS27NLWSI
   yrJJdA1m8+rsTCHxCR3PW96uvcEhl+9o9c9a+lHWyhlVfUTkogbF7QYc8
   4Dt5k0y46eAx62wZf2zu9GwuoAu+PhIJZftz5J+6w/aGrniTUR/XIflAt
   WNhWi0DFIwclNdKLzt16AZrls6mTaKB7ouzPa7uNDOzIHGxCp1YoEvXS4
   PKaapv7T+qmAUELDTD41bcMIxWmJA79WTbnQpC7v/shvthklCoGDbp27P
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="392685472"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="392685472"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 02:42:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="664847311"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="664847311"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Feb 2023 02:42:21 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNAZI-0005MU-30;
	Wed, 01 Feb 2023 10:42:20 +0000
Date: Wed, 1 Feb 2023 18:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 35/58] ld.lld: error: undefined symbol:
 rzv2m_usb3drd_reset
Message-ID: <202302011806.QrzYCatO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   45bf39f8df7f05efb83b302c65ae3b9bc92b7065
commit: c52c9acc415eb6ff54f658492f8c53da0fc3528a [35/58] xhci: host: Add Renesas RZ/V2M SoC support
config: arm64-randconfig-r015-20230201 (https://download.01.org/0day-ci/archive/20230201/202302011806.QrzYCatO-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=c52c9acc415eb6ff54f658492f8c53da0fc3528a
        git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
        git fetch --no-tags usb usb-next
        git checkout c52c9acc415eb6ff54f658492f8c53da0fc3528a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rzv2m_usb3drd_reset
   >>> referenced by xhci-rzv2m.c
   >>>               drivers/usb/host/xhci-rzv2m.o:(xhci_rzv2m_init_quirk) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_RZV2M_USB3DRD
   Depends on [n]: USB_SUPPORT [=y] && USB_GADGET [=n] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])
   Selected by [y]:
   - USB_XHCI_RZV2M [=y] && USB_SUPPORT [=y] && USB [=y] && USB_XHCI_HCD [=y] && USB_XHCI_PLATFORM [=y] && (ARCH_R9A09G011 [=n] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
