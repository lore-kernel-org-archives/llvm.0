Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CDB33E5;
	Tue, 25 Apr 2023 21:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682456591; x=1713992591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jw66GbpVDrNQLpIB5E1F9gDZmk+UiU7wloECDprBEi0=;
  b=MSVqW8v/GxrOAZrOeIHEx6WDWrfB4XBbSojjiVd4K2133n/Ty2TlEFQZ
   zZkF7LZ72kdSykjTyNExKdnSZC0CWz3lKxfwOUmF7OO8sL18n+iIZc2Zn
   MaXNHLoOjCl+QzF/bI4PnMVsgb7Tfv3muTEBbfeqh5T4AZ2Druvl6FIJ0
   dBsAF3dpjtbNqG6Twzh6pt4sXkMUfotLgyXfv4Tj30/07LZZZyp9+3JV7
   CuHJC/xLQ3h4LsOQzwurY/ja7TmAqkapa2d0tb/y3EL1hs7uQeqKBM9c2
   CFZFYWKfgcKvMJnD6DFEEb3hfYWfe4LFFxau7SZh4cAmF4dIjbocL5ANX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="346926800"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="346926800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2023 14:03:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10691"; a="724151023"
X-IronPort-AV: E=Sophos;i="5.99,226,1677571200"; 
   d="scan'208";a="724151023"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 25 Apr 2023 14:03:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prPoR-000jm0-2X;
	Tue, 25 Apr 2023 21:02:59 +0000
Date: Wed, 26 Apr 2023 05:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: hildawu@realtek.com, marcel@holtmann.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	johan.hedberg@gmail.com, luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	mmandlik@google.com, apusaka@chromium.org, yinghsu@chromium.org,
	alex_lu@realsil.com.cn, max.chou@realtek.com, kidman@realtek.com
Subject: Re: [PATCH v3] Bluetooth: btrtl: Add Realtek devcoredump support
Message-ID: <202304260422.XHBgACOW-lkp@intel.com>
References: <20230420105343.2014-1-hildawu@realtek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230420105343.2014-1-hildawu@realtek.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on next-20230425]
[cannot apply to bluetooth/master linus/master v6.3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/hildawu-realtek-com/Bluetooth-btrtl-Add-Realtek-devcoredump-support/20230420-185852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20230420105343.2014-1-hildawu%40realtek.com
patch subject: [PATCH v3] Bluetooth: btrtl: Add Realtek devcoredump support
config: arm-randconfig-r013-20230424 (https://download.01.org/0day-ci/archive/20230426/202304260422.XHBgACOW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/dd7adb785f34ba9037f5c73dac879071302c636a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review hildawu-realtek-com/Bluetooth-btrtl-Add-Realtek-devcoredump-support/20230420-185852
        git checkout dd7adb785f34ba9037f5c73dac879071302c636a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304260422.XHBgACOW-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/bluetooth/btusb.c:27:
>> drivers/bluetooth/btrtl.h:188:2: error: void function 'btrtl_set_driver_name' should not return a value [-Wreturn-type]
           return -EOPNOTSUPP;
           ^      ~~~~~~~~~~~
   1 error generated.


vim +/btrtl_set_driver_name +188 drivers/bluetooth/btrtl.h

   185	
   186	static inline void btrtl_set_driver_name(struct hci_dev *hdev, const char *driver_name)
   187	{
 > 188		return -EOPNOTSUPP;
   189	}
   190	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
