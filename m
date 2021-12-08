Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6242C80
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 14:31:49 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="301222195"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="301222195"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 06:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="479917593"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 08 Dec 2021 06:31:46 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muxyz-0000fS-FK; Wed, 08 Dec 2021 14:31:45 +0000
Date: Wed, 8 Dec 2021 22:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gwendal Grignou <gwendal@chromium.org>, jic23@kernel.org,
	lars@metafoo.de, swboyd@chromium.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	andy.shevchenko@gmail.com, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, Gwendal Grignou <gwendal@chromium.org>
Subject: Re: [PATCH v5 3/5] iio: proximity: Add SX9324 support
Message-ID: <202112082214.pv3MKwkH-lkp@intel.com>
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
config: arm-randconfig-c002-20211208 (https://download.01.org/0day-ci/archive/20211208/202112082214.pv3MKwkH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/d02716a5c3a619239e594e6ba6af2ec38fd3de3d
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Gwendal-Grignou/Expand-Semtech-SAR-Sensors-support/20211208-084635
        git checkout d02716a5c3a619239e594e6ba6af2ec38fd3de3d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/iio/proximity/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/proximity/sx9324.c:166:9: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int i, ret, pin_idx;
                  ^
   1 warning generated.


vim +/ret +166 drivers/iio/proximity/sx9324.c

   158	
   159	static ssize_t sx9324_phase_configuration_show(struct iio_dev *indio_dev,
   160						       uintptr_t private,
   161						       const struct iio_chan_spec *chan,
   162						       char *buf)
   163	{
   164		struct sx_common_data *data = iio_priv(indio_dev);
   165		unsigned int val;
 > 166		int i, ret, pin_idx;
   167		size_t len = 0;
   168	
   169		ret = regmap_read(data->regmap, SX9324_REG_AFE_PH0 + chan->channel, &val);
   170	
   171		for (i = 0; i < SX9324_NUM_PINS; i++) {
   172			pin_idx = (val & SX9324_REG_AFE_PH0_PIN_MASK(i)) >> (2 * i);
   173			len += scnprintf(buf + len, PAGE_SIZE - len, "%s,",
   174					 sx9324_cs_pin_usage[pin_idx]);
   175		}
   176		buf[len - 1] = '\n';
   177		return len;
   178	}
   179	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
