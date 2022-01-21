Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16EE2C82
	for <llvm@lists.linux.dev>; Fri, 21 Jan 2022 20:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642797787; x=1674333787;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zi42iAFJZUfwAkLlr/dUNgF2Eg3r9qS0RQ6ZF0BDqXE=;
  b=Hj5HEtvZgTS3DPN76ERbDUDMvnJ0GdLwJDgPfr9a1fFKzU/qnHVmyXMq
   tTwDaB6E+9XqtgKVvMyvOe84DWjoiXezg9TAO/QhxbJnI+Dexm3dyv06x
   ykjfJZMRHkpgLamf0AKhrESy6fQrSj+zIJBvG1dhGDDJT+VD1/qxwjqM+
   HeEAKKRmhMJs9J9ZkkF5IZP7JDZQHZh3/GH9wQ41AiJCVvgY/aNCAOFEM
   a1vqSBli/4bHzfg7dY8AGzQHdpDT/hfZqmHYhQKVeNJfKmqVrSqJSR70b
   bsXoSu+449r8HYB7L2NuGwWyHp9OctF5MhsjjiFflDlCEKVzcrOp76E94
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10234"; a="245960438"
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="245960438"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 12:43:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,306,1635231600"; 
   d="scan'208";a="616627685"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2022 12:43:04 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nB0kR-000FeT-EY; Fri, 21 Jan 2022 20:43:03 +0000
Date: Sat, 22 Jan 2022 04:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add ufs power-domain entries
Message-ID: <202201220442.bMRI74m1-lkp@intel.com>
References: <20220120082803.15535-1-bhupesh.sharma@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220120082803.15535-1-bhupesh.sharma@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bhupesh,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on robh/for-next]
[also build test ERROR on v5.16 next-20220121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bhupesh-Sharma/arm64-dts-qcom-sm8150-Add-ufs-power-domain-entries/20220120-162925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
config: arm64-randconfig-r011-20220120 (https://download.01.org/0day-ci/archive/20220122/202201220442.bMRI74m1-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/e9cea3a4d3c4706f9cef18f55b07d3bc389a051a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bhupesh-Sharma/arm64-dts-qcom-sm8150-Add-ufs-power-domain-entries/20220120-162925
        git checkout e9cea3a4d3c4706f9cef18f55b07d3bc389a051a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/qcom/sm8150.dtsi:1641.26-27 syntax error
   FATAL ERROR: Unable to parse input tree

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
