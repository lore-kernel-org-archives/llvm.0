Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 684812C9D
	for <llvm@lists.linux.dev>; Wed,  5 Jan 2022 11:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641382421; x=1672918421;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3Hd28/OpKDRgp94Vv+FZ+25YO7a/P3QdXcK7L/1o/sE=;
  b=KKzeHaUumOT4HgKaGGCsad+pa+8zXXF/zwRXm+cBmUgpAXrUqxtxr7AM
   goEc/zr7UgdosWAKfuqDf4o0DcpSZx/JzT5XJphrEf+mQxk7lkhL3DqUL
   Fn1iJdjT5TAAzeEYNAzaPLiw+lkn3EwnTgiNrIQnlifLosza1lozUfFhh
   20r71VWH7cdRtXTDSJOcvRk238WbXn4SoSkPO0cq97sIKhvZ3KnsPDsyt
   60qGvhuYRT90fsxPfu6+ZbGUX3iSDdul8IeR7bUFxTvtIysZvr9CU0/ip
   68i3TVsO94rU4axMUUFgraIox7UoAyh0pAifrDdOXzgPtRkOBzMqYq9Us
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242628971"
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; 
   d="scan'208";a="242628971"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 03:33:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,263,1635231600"; 
   d="scan'208";a="470534337"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Jan 2022 03:33:37 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n54Xx-000GYM-7n; Wed, 05 Jan 2022 11:33:37 +0000
Date: Wed, 5 Jan 2022 19:33:28 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 3/3] nvmem: add driver handling U-Boot environment
 variables
Message-ID: <202201051949.ZpWQfrvi-lkp@intel.com>
References: <20211230090449.11808-3-zajec5@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211230090449.11808-3-zajec5@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Rafał,

I love your patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on mtd/mtd/next mtd/mtd/fixes linus/master v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Rafa-Mi-ecki/mtd-core-call-devm_of_platform_populate-for-MTD-devices/20211230-170531
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: hexagon-randconfig-r013-20220105 (https://download.01.org/0day-ci/archive/20220105/202201051949.ZpWQfrvi-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project d5b6e30ed3acad794dd0aec400e617daffc6cc3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/52f6be4712d04b927cd356dd95940bd76f1f5b97
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Rafa-Mi-ecki/mtd-core-call-devm_of_platform_populate-for-MTD-devices/20211230-170531
        git checkout 52f6be4712d04b927cd356dd95940bd76f1f5b97
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mtd_read" [drivers/nvmem/nvmem_u-boot-env.ko] undefined!
>> ERROR: modpost: "get_mtd_device_nm" [drivers/nvmem/nvmem_u-boot-env.ko] undefined!
ERROR: modpost: "__raw_readsl" [drivers/i3c/master/svc-i3c-master.ko] undefined!
ERROR: modpost: "__raw_writesl" [drivers/i3c/master/dw-i3c-master.ko] undefined!
ERROR: modpost: "__raw_readsl" [drivers/i3c/master/dw-i3c-master.ko] undefined!
ERROR: modpost: "__raw_writesl" [drivers/i3c/master/i3c-master-cdns.ko] undefined!
ERROR: modpost: "__raw_readsl" [drivers/i3c/master/i3c-master-cdns.ko] undefined!

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
