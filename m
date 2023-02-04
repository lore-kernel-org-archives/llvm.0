Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B53E1FC4;
	Sat,  4 Feb 2023 11:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675510246; x=1707046246;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pxG2PMYD9PrmXuRk6KzR4zbAxmr0VBPiSuKznRqqPvY=;
  b=VZHNFNy834q98peJuFfbFx2V4093uz1XU3ia9AoC7eQAdx7lS6CbHqTW
   MEpSuAqeResmhgiTcNXS1VF93/6oYk3464z1H3uo4cYZurU6IFEsWHCqI
   2OfTy4ZJfjUSZGFUjuHuroT4Nsn/JNxs18Sfo94Y3m8mRKb68dWHHJ7BB
   ZcacHHa85AddLpngCFVS9TCqMrwFdtZ2hJ4z9rjDtr+WXN710QSJTWXFf
   31073DGnCxxWm/YDl65d303hk/ssytPcKheQgOHQkCuthIi6KTYeQCV39
   2UHjmOD4cRTXMaOP/YqoKg26Qiuy8oyg+useQexuo3patPO4YhRbzLfp2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="356282936"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="356282936"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 03:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="667926453"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="667926453"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Feb 2023 03:30:42 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOGkj-0001Gi-2u;
	Sat, 04 Feb 2023 11:30:41 +0000
Date: Sat, 4 Feb 2023 19:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
	andersson@kernel.org, agross@kernel.org,
	krzysztof.kozlowski@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	marijn.suijten@somainline.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 02/10] clk: qcom: branch: Add helper functions for
 setting SLEEP/WAKE bits
Message-ID: <202302041929.36wT4EUe-lkp@intel.com>
References: <20230201183626.351211-3-konrad.dybcio@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230201183626.351211-3-konrad.dybcio@linaro.org>

Hi Konrad,

I love your patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on linus/master v6.2-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/clk-qcom-branch-Add-helper-functions-for-setting-SLEEP-WAKE-bits/20230202-033712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230201183626.351211-3-konrad.dybcio%40linaro.org
patch subject: [PATCH v5 02/10] clk: qcom: branch: Add helper functions for setting SLEEP/WAKE bits
config: arm-randconfig-r013-20230204 (https://download.01.org/0day-ci/archive/20230204/202302041929.36wT4EUe-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/abd8a21fce6fafe4998281709f574b94b6c87031
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Konrad-Dybcio/clk-qcom-branch-Add-helper-functions-for-setting-SLEEP-WAKE-bits/20230202-033712
        git checkout abd8a21fce6fafe4998281709f574b94b6c87031
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/clk/qcom/gcc-apq8084.c:24:
>> drivers/clk/qcom/clk-branch.h:71:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                              FIELD_PREP(CBCR_WAKEUP, val));
                              ^
   drivers/clk/qcom/clk-branch.h:77:7: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                              FIELD_PREP(CBCR_SLEEP, val));
                              ^
   2 errors generated.


vim +/FIELD_PREP +71 drivers/clk/qcom/clk-branch.h

    67	
    68	static inline void qcom_branch_set_wakeup(struct regmap *regmap, struct clk_branch clk, u32 val)
    69	{
    70		regmap_update_bits(regmap, clk.halt_reg, CBCR_WAKEUP,
  > 71				   FIELD_PREP(CBCR_WAKEUP, val));
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
