Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F047173
	for <llvm@lists.linux.dev>; Thu, 13 Jan 2022 21:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642110186; x=1673646186;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xDNP87kk9yoCT9fDhtBeDKFlx6wvHUEmsp+ES7KTSFM=;
  b=BYJo4WSt40flJEz8IBY1T0i4M+V7vwNz6Eq+tY3UINbOANtLrI8fMqvK
   OUzShlmJMSb65voLo9wNZkeoxYkZOdpeDpCjYjESDkNcOLuUO1uO/N31F
   Cmq8WUuJNtt6xcBeKts3eY+iFEvQR4Fiw4Fmmj1K3SY/3AhWxoz1ZYIJS
   OcCA7h0LkDL9/Ps8sHlbH7sVu4U5yZ0uLz3sstJ31FbW9zGZ21Y4ahCdH
   AnVW3ySWt+EXt5eY+lJXKMB89tm49+R5/ws6f/pN+ZFOl8sO1A2Zw0bvD
   xu9E+kFuBqziSunBp7D8zEcwlTRi8pmMuUZPZzuctjGVAYDj6ZmJHdUHf
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10226"; a="224807994"
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="224807994"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2022 13:43:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,286,1635231600"; 
   d="scan'208";a="475502858"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2022 13:43:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n87s7-0007fY-EJ; Thu, 13 Jan 2022 21:43:03 +0000
Date: Fri, 14 Jan 2022 05:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jami Kettunen <jami.kettunen@somainline.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 2/3] drm/msm/dpu1: Add MSM8998 to hw catalog
Message-ID: <202201140501.XVy5Bpjg-lkp@intel.com>
References: <20220113145111.29984-3-jami.kettunen@somainline.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113145111.29984-3-jami.kettunen@somainline.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jami,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on next-20220113]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jami-Kettunen/drm-msm-dpu1-Add-DMA2-DMA3-clock-control-to-enum/20220113-235237
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: hexagon-randconfig-r013-20220113 (https://download.01.org/0day-ci/archive/20220114/202201140501.XVy5Bpjg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d1021978b8e7e35dcc30201ca1731d64b5a602a8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/413561c584134b5ae119218d5bb7276ab4e34daf
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jami-Kettunen/drm-msm-dpu1-Add-DMA2-DMA3-clock-control-to-enum/20220113-235237
        git checkout 413561c584134b5ae119218d5bb7276ab4e34daf
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:855:34: warning: unused variable 'msm8998_dspp' [-Wunused-const-variable]
   static const struct dpu_dspp_cfg msm8998_dspp[] = {
                                    ^
   1 warning generated.


vim +/msm8998_dspp +855 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

   846	
   847	#define DSPP_BLK(_name, _id, _base, _mask, _sblk) \
   848			{\
   849			.name = _name, .id = _id, \
   850			.base = _base, .len = 0x1800, \
   851			.features = _mask, \
   852			.sblk = _sblk \
   853			}
   854	
 > 855	static const struct dpu_dspp_cfg msm8998_dspp[] = {
   856		DSPP_BLK("dspp_0", DSPP_0, 0x54000, DSPP_MSM8998_MASK,
   857			 &msm8998_dspp_sblk),
   858		DSPP_BLK("dspp_1", DSPP_1, 0x56000, DSPP_MSM8998_MASK,
   859			 &msm8998_dspp_sblk),
   860	};
   861	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
