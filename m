Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DF2210D
	for <llvm@lists.linux.dev>; Fri, 16 Sep 2022 05:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663305218; x=1694841218;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v2DbxWnLeamIthrmgFcpcDIYCNGIvZop8O0b8O4IUhs=;
  b=eoXlVDTWvWL5YT1l1qjMToTLK/lOZ2CVbIvmHuL0kb9d7mkIbnW4mLVu
   2PcQEzFc6h51rO3CUHfD05WV2bcIQkT/q7VM5PXCJ8vxIxHpPrP/oGhyY
   gZIPiu0a5Jk6jL4KWgmhUBoZ0aGKQ4XArIHzyE6Yd+iJjxHYiArCpgWim
   JdVGBCatVAy48wMZb2nPwXtnAQ/4a+CwBoPEWMG03vN2rKLDBDqIrGxg0
   amJ8uLh4s95Ju0phV3lVodnl472/SHJiJ0rYt/8U/0ywY0Ru22Ckn9avt
   Zdu85IerFfPjtitnMT+3GoN6B4Fq/jG3r++nqKHNf3oROQWknpKwyEnGy
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="385204212"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="385204212"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2022 22:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; 
   d="scan'208";a="568710641"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Sep 2022 22:13:36 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZ3fT-0001Sq-24;
	Fri, 16 Sep 2022 05:13:35 +0000
Date: Fri, 16 Sep 2022 13:13:02 +0800
From: kernel test robot <lkp@intel.com>
To: alison.schofield@intel.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v3 2/3] cxl/acpi: Support CXL XOR Interleave Math (CXIMS)
Message-ID: <202209161334.7i460KDI-lkp@intel.com>
References: <6cbe113e3aebc732d10cb77a316f547b581f22fa.1663291370.git.alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cbe113e3aebc732d10cb77a316f547b581f22fa.1663291370.git.alison.schofield@intel.com>

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 1cd8a2537eb07751d405ab7e2223f20338a90506]

url:    https://github.com/intel-lab-lkp/linux/commits/alison-schofield-intel-com/CXL-XOR-Interleave-Arithmetic/20220916-093308
base:   1cd8a2537eb07751d405ab7e2223f20338a90506
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220916/202209161334.7i460KDI-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/52526703ddd3faa831e99eb2d778d5692aac43ee
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alison-schofield-intel-com/CXL-XOR-Interleave-Arithmetic/20220916-093308
        git checkout 52526703ddd3faa831e99eb2d778d5692aac43ee
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/cxl/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/cxl/acpi.c:56:10: warning: shift count is negative [-Wshift-count-negative]
                   mask = GENMASK(51, eiw + ig);
                          ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:38:31: note: expanded from macro 'GENMASK'
           (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                                        ^~~~~~~~~~~~~~~
   include/linux/bits.h:36:11: note: expanded from macro '__GENMASK'
            (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
                    ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +56 drivers/cxl/acpi.c

    16	
    17	/*
    18	 * Find a targets entry (n) in the host bridge interleave list.
    19	 * CXL Specfication 3.0 Table 9-22
    20	 */
    21	static struct cxl_dport *cxl_hb_xor(struct cxl_root_decoder *cxlrd, int pos)
    22	{
    23		struct cxl_switch_decoder *cxlsd = &cxlrd->cxlsd;
    24		struct cxims_data *cximsd = cxlrd->platform_data;
    25		struct cxl_decoder *cxld = &cxlsd->cxld;
    26		int ig = cxld->interleave_granularity;
    27		int iw = cxld->interleave_ways;
    28		int i, eiw, n = 0;
    29		u64 hpa, mask;
    30	
    31		if (dev_WARN_ONCE(&cxld->dev,
    32				  cxld->interleave_ways != cxlsd->nr_targets,
    33				  "misconfigured root decoder\n"))
    34			return NULL;
    35	
    36		if (iw == 1)
    37			/* Entry is always 0 for no interleave */
    38			return cxlrd->cxlsd.target[0];
    39	
    40		hpa = cxlrd->res->start + pos * ig;
    41	
    42		if (iw == 3) {
    43			/* Initialize 'i' for the modulo calc */
    44			i = 0;
    45			goto no_map;
    46		}
    47	
    48		/* IW: 2,4,6,8,12,16 begin building 'n' using xormaps */
    49		for (i = 0; i < cximsd->nr_maps; i++)
    50			n |= (hweight64(hpa & cximsd->xormaps[i]) & 1) << i;
    51	
    52	no_map:
    53		/* IW: 3,6,12 add a modulo calculation to 'n' */
    54		if (!is_power_of_2(iw)) {
    55			eiw = ilog2(iw / 3) + 8;
  > 56			mask = GENMASK(51, eiw + ig);
    57			n |= (hpa & mask) % 3 << i;
    58		}
    59	
    60		return cxlrd->cxlsd.target[n];
    61	}
    62	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
