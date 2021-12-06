Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D212C80
	for <llvm@lists.linux.dev>; Mon,  6 Dec 2021 22:57:43 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="300809720"
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="300809720"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2021 14:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,292,1631602800"; 
   d="scan'208";a="514969605"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 06 Dec 2021 14:57:22 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1muMvB-000Lq5-UY; Mon, 06 Dec 2021 22:57:21 +0000
Date: Tue, 7 Dec 2021 06:56:54 +0800
From: kernel test robot <lkp@intel.com>
To: Petko Manolov <petko.manolov@konsulko.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 5/5] adds i2c/ explicitly to Makefile
Message-ID: <202112070634.8UMBEkLw-lkp@intel.com>
References: <20211203221247.46324-6-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211203221247.46324-6-petko.manolov@konsulko.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Petko,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on v5.16-rc3]
[also build test WARNING on next-20211206]
[cannot apply to media-tree/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Petko-Manolov/omv6211-linux-kernel-driver/20211204-061436
base:    d58071a8a76d779eedab38033ae4c821c30295a5
config: arm64-randconfig-r032-20211204 (https://download.01.org/0day-ci/archive/20211207/202112070634.8UMBEkLw-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/e3654b0a5fdd1f9b3488b69bf8cc1a2613788f83
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Petko-Manolov/omv6211-linux-kernel-driver/20211204-061436
        git checkout e3654b0a5fdd1f9b3488b69bf8cc1a2613788f83
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/staging/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/staging/media/i2c/ovm6211.c:652:5: warning: no previous prototype for function 'ovm6211_set_pix_clk' [-Wmissing-prototypes]
   u32 ovm6211_set_pix_clk(struct ovm6211_dev *sensor, const struct ovm6211_mode_info *nm)
       ^
   drivers/staging/media/i2c/ovm6211.c:652:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   u32 ovm6211_set_pix_clk(struct ovm6211_dev *sensor, const struct ovm6211_mode_info *nm)
   ^
   static 
   1 warning generated.


vim +/ovm6211_set_pix_clk +652 drivers/staging/media/i2c/ovm6211.c

a3407db075daa0 Petko Manolov 2021-12-04  651  
a3407db075daa0 Petko Manolov 2021-12-04 @652  u32 ovm6211_set_pix_clk(struct ovm6211_dev *sensor, const struct ovm6211_mode_info *nm)
a3407db075daa0 Petko Manolov 2021-12-04  653  {
a3407db075daa0 Petko Manolov 2021-12-04  654  	u32 s, fmt, fps, ret;
a3407db075daa0 Petko Manolov 2021-12-04  655  
a3407db075daa0 Petko Manolov 2021-12-04  656  	/* x * y * [1|2] * y8/y10 * fps */
a3407db075daa0 Petko Manolov 2021-12-04  657  	s = nm->width * nm->height;
a3407db075daa0 Petko Manolov 2021-12-04  658  	fmt = 1;
a3407db075daa0 Petko Manolov 2021-12-04  659  	fps = ovm6211_framerates[sensor->cur_fr_id];
a3407db075daa0 Petko Manolov 2021-12-04  660  	ret = s * fmt * fps * 2;
a3407db075daa0 Petko Manolov 2021-12-04  661  
a3407db075daa0 Petko Manolov 2021-12-04  662  	return ret;
a3407db075daa0 Petko Manolov 2021-12-04  663  }
a3407db075daa0 Petko Manolov 2021-12-04  664  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
