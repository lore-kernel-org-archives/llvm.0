Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533A946B3
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 09:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648199028; x=1679735028;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WbskBVThk2A3f0bek82d4zhtf8YdkGCFyymR0cmcN2k=;
  b=E0xe80mAvuASTI2yxsG/4YUOgSRmKHU50uJPDReoqGsbaj/WqZHtaPWa
   p9FRWZMIMcxjgvB4J0SlPhrtocmgOJVgYQclGlkdhu387aoFFp/zNWIf5
   nOrQw6q3ch9pD2yKhXFYJP94MSdh6DB36Dw5vReEH+7soFwD4Uu4GYJFB
   SXBL5tHrFTA/vWx1dN61DNArpq81lmGKJC1dRRuNiAPs/0Ff1BuebyK/q
   fl3OWT1wKD4s6Y/K+XpjnHQ0tFmw/XxfNR/y4FyQ+tc5j9ztTXOtouHlW
   wWF6lqooi/LtyfWYNSUxaVnbRa6puQoD7TEoDNPTUDGGQXQiBG3ZsTgzI
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="321786257"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="321786257"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 02:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; 
   d="scan'208";a="825977531"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 25 Mar 2022 02:03:18 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXfqo-000Lyi-70; Fri, 25 Mar 2022 09:03:18 +0000
Date: Fri, 25 Mar 2022 17:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Howard Chiu <howard_chiu@aspeedtech.com>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>, "andrew@aj.id.au" <andrew@aj.id.au>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Troy Lee <troy_lee@aspeedtech.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: ast2600-evb: Support KVM
Message-ID: <202203251620.taj6u6mo-lkp@intel.com>
References: <HK0PR06MB2307383743B9AE1D714A899BE61A9@HK0PR06MB2307.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB2307383743B9AE1D714A899BE61A9@HK0PR06MB2307.apcprd06.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Howard,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.17]
[cannot apply to joel-aspeed/for-next next-20220324]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Howard-Chiu/ARM-dts-aspeed-ast2600-evb-Support-KVM/20220325-103839
base:    f443e374ae131c168a065ea1748feac6b2e76613
config: arm-aspeed_g4_defconfig (https://download.01.org/0day-ci/archive/20220325/202203251620.taj6u6mo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/9037b86779cd7616b378b3bafd1f32b4c862f0bd
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Howard-Chiu/ARM-dts-aspeed-ast2600-evb-Support-KVM/20220325-103839
        git checkout 9037b86779cd7616b378b3bafd1f32b4c862f0bd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm/boot/dts/aspeed-ast2600-evb.dts:322.1-7 Label or path video not found
>> FATAL ERROR: Syntax error parsing input tree

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
