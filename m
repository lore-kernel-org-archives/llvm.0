Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6995A1F
	for <llvm@lists.linux.dev>; Thu, 10 Mar 2022 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646944205; x=1678480205;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=65CFBLijZ/FB15HrsV6IEEFOdZ7SGmfks2NDjFixxx0=;
  b=bwBQyIMtc8u4mbnZM1obAIjJwzfz/XZhjFK3wdUUEmhMkm0nd/O/INFh
   b05PRxkpeOlZu4S69UgYVWo1Dj8ai2EPot6aZJYKNn0qSyS9O+kYV9z/g
   Eu7RBGzDeXi8tOXlaEyq9BfCHj8/TBNPLT4qkSbu7YtxRWgtVNpE3XtW/
   hGfTIPmnjR9WP+VxybLYXgz6Oj6LTJhT8tQJ5L8p/GdiqmYnLMAIcEthh
   28SNOBRLQuXD/q6yYauliWzYPYv4N6ELJyRibnLB20wOPN/1DQmTp5kHe
   NPkxdergBwU5Dh7FSw/VLYR3Mk+SviXzSQIJYtKCO8KKFpGMXTEKbii4s
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="318597423"
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="318597423"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2022 12:30:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,171,1643702400"; 
   d="scan'208";a="781603606"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2022 12:30:01 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSPQ9-0005Mm-2i; Thu, 10 Mar 2022 20:30:01 +0000
Date: Fri, 11 Mar 2022 04:29:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jacopo Mondi <jacopo@jmondi.org>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Jacopo Mondi <jacopo@jmondi.org>,
	jeanmichel.hautbois@ideasonboard.com,
	laurent.pinchart@ideasonboard.com, paul.kocialkowski@bootlin.com,
	sakari.ailus@iki.fi, paul.elder@ideasonboard.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: [PATCH 2/6] media: i2c: ov5670: Allow probing with OF
Message-ID: <202203110433.anTyFE5N-lkp@intel.com>
References: <20220310130829.96001-3-jacopo@jmondi.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310130829.96001-3-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Jacopo,

I love your patch! Yet something to improve:

[auto build test ERROR on media-tree/master]
[also build test ERROR on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220310-211143
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220311/202203110433.anTyFE5N-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f5425877ffa93005c9f71ce9ce4185a787db66eb
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jacopo-Mondi/media-i2c-ov5670-OF-support-runtime_pm-regulators/20220310-211143
        git checkout f5425877ffa93005c9f71ce9ce4185a787db66eb
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov5670.c:2601:34: error: use of undeclared identifier 'ov5670_of_ids'
                   .of_match_table = of_match_ptr(ov5670_of_ids),
                                                  ^
   1 error generated.


vim +/ov5670_of_ids +2601 drivers/media/i2c/ov5670.c

  2595	
  2596	static struct i2c_driver ov5670_i2c_driver = {
  2597		.driver = {
  2598			.name = "ov5670",
  2599			.pm = &ov5670_pm_ops,
  2600			.acpi_match_table = ACPI_PTR(ov5670_acpi_ids),
> 2601			.of_match_table = of_match_ptr(ov5670_of_ids),
  2602		},
  2603		.probe_new = ov5670_probe,
  2604		.remove = ov5670_remove,
  2605		.flags = I2C_DRV_ACPI_WAIVE_D0_PROBE,
  2606	};
  2607	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
