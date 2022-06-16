Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4CF6AA6
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 20:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655409919; x=1686945919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v8nKn3u5HYJV1okOhvCdZ6oJQPkGSyi/IKm0G/s0MXY=;
  b=NvxQGQg0ixTKZFGwdxlc68dKHf9SHtRMakgZbNjx7YSY0k37JrZFp+g/
   GOttam8zjapkrT0R4vO579CUw9utw9In0rgVHI9ol1hdTXRM7mMzdgrvT
   BbR4SeO7UjXwto3FV6mdoGBsN1z8g+93BYAFoqEV5hrnRKvqTn5cEyBP5
   P5L5jqUAXFYHMBQGdo1QoUYTKh2FlzMkGa4t/bJSujSoqh15V+LipDjzN
   u/7PtZuDrFOKBdIVq6pRLylSUlSZ9c4r5PBmkMUmbZ7/Dd1q+jljQSvGc
   IokiD0hJgUErIT/V8SXaspcG2tUT7/SumzSpjulQMJ1QKZO/R8QY3HzIu
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304787466"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="304787466"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 13:05:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="589791945"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jun 2022 13:05:13 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1vjs-000Oj3-Vy;
	Thu, 16 Jun 2022 20:05:12 +0000
Date: Fri, 17 Jun 2022 04:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: Quan Nguyen <quan@os.amperecomputing.com>,
	Corey Minyard <minyard@acm.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Open Source Submission <patches@amperecomputing.com>,
	Phong Vo <phong@os.amperecomputing.com>,
	"Thang Q . Nguyen" <thang@os.amperecomputing.com>
Subject: Re: [PATCH v8 1/3] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <202206170337.0kCTfR63-lkp@intel.com>
References: <20220615090259.1121405-2-quan@os.amperecomputing.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615090259.1121405-2-quan@os.amperecomputing.com>

Hi Quan,

I love your patch! Yet something to improve:

[auto build test ERROR on cminyard-ipmi/for-next]
[also build test ERROR on wsa/i2c/for-next v5.19-rc2 next-20220616]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Quan-Nguyen/Add-SSIF-BMC-driver/20220615-170539
base:   https://github.com/cminyard/linux-ipmi for-next
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20220617/202206170337.0kCTfR63-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0feb5f0351d090633e7522dbec22de419a04b85f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Quan-Nguyen/Add-SSIF-BMC-driver/20220615-170539
        git checkout 0feb5f0351d090633e7522dbec22de419a04b85f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/ipmi_ssif_bmc.h:13:2: error: unknown type name '__u8'
           __u8    payload[IPMI_SSIF_PAYLOAD_MAX];
           ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
