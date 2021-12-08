Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D9D29CA
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 15:22:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="225106971"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="225106971"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 07:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="461725174"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 08 Dec 2021 07:22:48 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muymN-0000j6-Oj; Wed, 08 Dec 2021 15:22:47 +0000
Date: Wed, 8 Dec 2021 23:22:43 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>, jic23@kernel.org,
	lars@metafoo.de, swboyd@chromium.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	andy.shevchenko@gmail.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH v5 3/5] iio: proximity: Add SX9324 support
Message-ID: <202112082323.CEzDjrR6-lkp@intel.com>
References: <20211208004311.3098571-4-gwendal@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208004311.3098571-4-gwendal@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Gwendal,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.16-rc4 next-20211208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Gwendal-Grignou/Expand-Semtech-SAR-Sensors-support/20211208-084635
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: riscv-randconfig-c006-20211208 (https://download.01.org/0day-ci/archive/20211208/202112082323.CEzDjrR6-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/d02716a5c3a619239e594e6ba6af2ec38fd3de3d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Gwendal-Grignou/Expand-Semtech-SAR-Sensors-support/20211208-084635
        git checkout d02716a5c3a619239e594e6ba6af2ec38fd3de3d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/iio/proximity/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/iio/proximity/sx9324.c:166:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int i, ret, pin_idx;
                  ^
>> drivers/iio/proximity/sx9324.c:871:36: warning: unused variable 'sx9324_acpi_match' [-Wunused-const-variable]
   static const struct acpi_device_id sx9324_acpi_match[] = {
                                      ^
   2 warnings generated.


vim +/sx9324_acpi_match +871 drivers/iio/proximity/sx9324.c

   870	
 > 871	static const struct acpi_device_id sx9324_acpi_match[] = {
   872		{ "STH9324", SX9324_WHOAMI_VALUE},
   873		{ }
   874	};
   875	MODULE_DEVICE_TABLE(acpi, sx9324_acpi_match);
   876	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
