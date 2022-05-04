Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E1B33C9
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651685060; x=1683221060;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v851XFF7wlJdKL8425wlGESczY3BpKet3O8VZ3I0eCU=;
  b=eHQtO5I7AggOkI8P8fDoCv4w6LPCN5uN+wAoSlRvboSn3cF3V3+d6Y8b
   iCaiOBmXB03DKZz6JYKTNrEzlhD5xXSdVJijJRKGSE+OZSEjHWVtSvLpH
   L//gWfh2tWwLLMM2mxJeuuHH7MiLpjIc+wWTJU8Kp3QkDxBU2OFpDhR4B
   gFTTeB+fqyabQ6e2nFByxBRqtaVBOaDIrvBQYCnXrKmKNJ+S/cIuuibI9
   JY4onhYMyuMe8ESJLrTcA75DEWPgQ8KrIq3GmVZzT1pq0KnXQ7lEqAQHp
   rFi5Mx56y53eJojlzEImPjmtde2OmacWjOsVrVvVf54qDOfReVqCN05du
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="328375718"
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="328375718"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 10:24:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,198,1647327600"; 
   d="scan'208";a="620898536"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 May 2022 10:24:17 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nmIjY-000Bej-PN;
	Wed, 04 May 2022 17:24:16 +0000
Date: Thu, 5 May 2022 01:23:50 +0800
From: kernel test robot <lkp@intel.com>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, jic23@kernel.org,
	lars@metafoo.de, robh+dt@kernel.org, tomas.melin@vaisala.com,
	andy.shevchenko@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-iio@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH V3 5/5] iio: accel: sca3300: Add inclination channels
Message-ID: <202205050139.AiGvfpnI-lkp@intel.com>
References: <20220504133612.604304-6-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504133612.604304-6-Qing-wu.Li@leica-geosystems.com.cn>

Hi LI,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on v5.18-rc5 next-20220504]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/LI-Qingwu/iio-accel-sca3300-add-compitible-for-scl3300/20220504-213941
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220505/202205050139.AiGvfpnI-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7d890b741d98d981843f66de413c1420e3fa27d3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review LI-Qingwu/iio-accel-sca3300-add-compitible-for-scl3300/20220504-213941
        git checkout 7d890b741d98d981843f66de413c1420e3fa27d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/sca3300.c:152:28: warning: unused variable 'scl3300_scan_masks' [-Wunused-const-variable]
   static const unsigned long scl3300_scan_masks[] = {
                              ^
   1 warning generated.


vim +/scl3300_scan_masks +152 drivers/iio/accel/sca3300.c

   151	
 > 152	static const unsigned long scl3300_scan_masks[] = {
   153		BIT(SCA3300_ACC_X) | BIT(SCA3300_ACC_Y) | BIT(SCA3300_ACC_Z) |
   154		BIT(SCA3300_TEMP) |
   155		BIT(SCA3300_INCLI_X) | BIT(SCA3300_INCLI_Y) | BIT(SCA3300_INCLI_Z),
   156		0
   157	};
   158	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
