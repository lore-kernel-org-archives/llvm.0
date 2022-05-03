Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DC033C9
	for <llvm@lists.linux.dev>; Tue,  3 May 2022 21:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651613070; x=1683149070;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VquISUrDva1ii+/TThhn+PnxLPxmCUEioQRKIcqao2w=;
  b=dY6TJdcFeGWuJHd5xV5cP+BemL6eEAuR1VUt+tY7lZYEldYZqLU9WGR9
   XSwPetN2eWEWlrWe5JsNH6sz4KmU0u4LsUqwODFFsiLegFWRc9tHsX5sH
   YSJTL55H7jqw9ZoeEZ3a99z1Cvpm+D1FqQwh7LoQDXhglxpEbyltaHphM
   Uy2FgPO/R9tVcWGZqWzSiMbLs5rYGpk7Xo9sfsdrOCHTtGcBuRg5PYmO0
   rUw5cJfvRozchfIqSQeDEe290wppFswsYuTOOZWw43MuWgXPkKnZ92IVn
   bEv3y97WEevqiUuyB29zOTYDxsIlVvW5uziFj4e/5djUjPTfRrmEdtLWR
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="267745902"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="267745902"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 14:24:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="889153341"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 May 2022 14:24:27 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm00Q-000Ao1-CT;
	Tue, 03 May 2022 21:24:26 +0000
Date: Wed, 4 May 2022 05:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: Quentin Schulz <foss+kernel@0leil.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, shawnx.tu@intel.com,
	mchehab@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: Re: [PATCH 2/3] media: ov5675: add device-tree support
Message-ID: <202205040514.C0uKmI1p-lkp@intel.com>
References: <20220503154259.1166203-2-foss+kernel@0leil.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503154259.1166203-2-foss+kernel@0leil.net>

Hi Quentin,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on robh/for-next linus/master v5.18-rc5 next-20220503]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Quentin-Schulz/media-dt-bindings-ov5675-document-YAML-binding/20220503-234500
base:   git://linuxtv.org/media_tree.git master
config: x86_64-randconfig-a011-20220502 (https://download.01.org/0day-ci/archive/20220504/202205040514.C0uKmI1p-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1623110421bc0b9cec990a62a40655076de1e71c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Quentin-Schulz/media-dt-bindings-ov5675-document-YAML-binding/20220503-234500
        git checkout 1623110421bc0b9cec990a62a40655076de1e71c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpio/ drivers/leds/ drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ov5675.c:1383:34: warning: unused variable 'ov5675_of_match' [-Wunused-const-variable]
   static const struct of_device_id ov5675_of_match[] = {
                                    ^
   1 warning generated.


vim +/ov5675_of_match +1383 drivers/media/i2c/ov5675.c

  1382	
> 1383	static const struct of_device_id ov5675_of_match[] = {
  1384		{ .compatible = "ovti,ov5675", },
  1385		{ /* sentinel */ },
  1386	};
  1387	MODULE_DEVICE_TABLE(of, ov5675_of_match);
  1388	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
