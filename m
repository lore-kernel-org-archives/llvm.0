Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6709D7C
	for <llvm@lists.linux.dev>; Mon,  8 Aug 2022 05:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659937226; x=1691473226;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L0AEyjOdy+rECcp7lQwc01b4Y++VmDWGY8GDnPBcItw=;
  b=UpbtGXJcChXlu59A5Fy9ciy2lzFlmIaZaFCMkoh9cyjBiZSELDtWazMO
   kA82amiwtWbK94gPtVTzQn9ysCf4De+vECvYyyNvr//ppKEf1LAGymlJ9
   PPca/jZKBLcg4yk0/FYWwPuL3su8HKUT7RGcZONbgDqNlWQpN6VZ3eWIb
   hzOjFDaH3MkPf4P26xGnMFLRgW0d29Vu/V0Fv4/NeDyKPPUkPC6ubX9Q6
   DFxYU6EzRcMY+epCMEPnvkO+0MFbvwVEwa5jq65+f7xuoYLSNmEic6AKZ
   Qqp2mZ4NxZVpkz1+s2javoq2Rvi/POsA+ynlcqfVG9av25rjTrl+nFoWp
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10432"; a="273555803"
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="273555803"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2022 22:40:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,221,1654585200"; 
   d="scan'208";a="637165336"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 07 Aug 2022 22:40:09 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKvUm-000Lwf-1R;
	Mon, 08 Aug 2022 05:40:08 +0000
Date: Mon, 8 Aug 2022 13:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jakob Hauser <jahau@rocketmail.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Jakob Hauser <jahau@rocketmail.com>
Subject: Re: [PATCH v5 09/14] iio: magnetometer: yas530: Introduce
 "chip_info" structure
Message-ID: <202208081346.EWHUWCSa-lkp@intel.com>
References: <8f5f58c9bf0f4006fabd01b5564af071d20f2a2d.1659909060.git.jahau@rocketmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f5f58c9bf0f4006fabd01b5564af071d20f2a2d.1659909060.git.jahau@rocketmail.com>

Hi Jakob,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19]
[also build test ERROR on next-20220805]
[cannot apply to jic23-iio/togreg linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakob-Hauser/iio-magnetometer-yas530-Change-data-type-of-hard_offsets-to-signed/20220808-080209
base:    3d7cb6b04c3f3115719235cc6866b10326de34cd
config: hexagon-randconfig-r045-20220807 (https://download.01.org/0day-ci/archive/20220808/202208081346.EWHUWCSa-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2e5a660a127b0fa7ca71e3e30356dc2254ec13eb
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jakob-Hauser/iio-magnetometer-yas530-Change-data-type-of-hard_offsets-to-signed/20220808-080209
        git checkout 2e5a660a127b0fa7ca71e3e30356dc2254ec13eb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/magnetometer/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iio/magnetometer/yamaha-yas530.c:933:19: error: initializer element is not a compile-time constant
                   .product_name = yas5xx_product_name[yas530],
                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +933 drivers/iio/magnetometer/yamaha-yas530.c

   929	
   930	static const struct yas5xx_chip_info yas5xx_chip_info_tbl[] = {
   931		[yas530] = {
   932			.devid = YAS530_DEVICE_ID,
 > 933			.product_name = yas5xx_product_name[yas530],
   934			.version_name = yas5xx_version_names[yas530],
   935		},
   936		[yas532] = {
   937			.devid = YAS532_DEVICE_ID,
   938			.product_name = yas5xx_product_name[yas532],
   939			.version_name = yas5xx_version_names[yas532],
   940		},
   941		[yas533] = {
   942			.devid = YAS532_DEVICE_ID,
   943			.product_name = yas5xx_product_name[yas533],
   944			.version_name = yas5xx_version_names[yas533],
   945		},
   946	};
   947	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
