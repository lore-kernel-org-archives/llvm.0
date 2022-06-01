Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8CE366
	for <llvm@lists.linux.dev>; Wed,  1 Jun 2022 12:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654086847; x=1685622847;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RpGBVNkwcymhjFqeyT1aZ+dE1vCc/c11uRHbrc5eBGs=;
  b=jluV06NL/5VDi0Sd2EzVncVrDqM4UTGBG4PvkVMb1Ia2FF6JT4D6fPXs
   8hmnBM0XzX5IUPFxukgO8cm99u0haL15yK6FZxScEs0a8qmzrcwFccgpV
   5+at+FO1rT7QwzyaMTBZNXaujissZlWR+v8KRsmpQ2sjmvqsSbTMlkf8U
   +I5tWTQYzunKeLcmYs5+jPWanu90bcj+LXTrjDEZlYN7T84SmYCvBzYqT
   k6vU7+ljlGkZV88YaS+4hLDR74PUdMF1Xocc6rEo7mIviAuijvVL8RDSb
   k9uCZ6ZD9cr5GdthAnN2x26HAw3aJLpY9YwOGiGaqksG4rT4UUuJZ7aza
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="361946928"
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="361946928"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 05:34:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="562777292"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Jun 2022 05:34:01 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwNY0-0003xg-Ds;
	Wed, 01 Jun 2022 12:34:00 +0000
Date: Wed, 1 Jun 2022 20:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, djakov@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	abel.vesa@nxp.com, abailon@baylibre.com, l.stach@pengutronix.de,
	laurent.pinchart@ideasonboard.com, marex@denx.de,
	paul.elder@ideasonboard.com, Markus.Niebel@ew.tq-group.com,
	aford173@gmail.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, kernel@pengutronix.de,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-imx@nxp.com, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 2/8] interconnect: add device managed bulk API
Message-ID: <202206012000.wFYpOdWH-lkp@intel.com>
References: <20220601094156.3388454-3-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601094156.3388454-3-peng.fan@oss.nxp.com>

Hi "Peng,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next linus/master v5.18 next-20220601]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/interconnect-support-i-MX8MP/20220601-174431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
config: hexagon-randconfig-r041-20220531 (https://download.01.org/0day-ci/archive/20220601/202206012000.wFYpOdWH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/23ecbba75b21962f25975cb014cf981a0420dae1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peng-Fan-OSS/interconnect-support-i-MX8MP/20220601-174431
        git checkout 23ecbba75b21962f25975cb014cf981a0420dae1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/opp/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/opp/core.c:22:
   In file included from drivers/opp/opp.h:15:
>> include/linux/interconnect.h:120:5: warning: no previous prototype for function 'devm_of_icc_bulk_get' [-Wmissing-prototypes]
   int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths)
       ^
   include/linux/interconnect.h:120:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths)
   ^
   static 
   1 warning generated.


vim +/devm_of_icc_bulk_get +120 include/linux/interconnect.h

   119	
 > 120	int devm_of_icc_bulk_get(struct device *dev, int num_paths, struct icc_bulk_data *paths)
   121	{
   122		return 0;
   123	}
   124	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
