Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A1F7F
	for <llvm@lists.linux.dev>; Mon,  1 Aug 2022 03:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659326058; x=1690862058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LIL0NXbRqabhEVprRkXveEeGK6nwA3ua/cchDuHt71s=;
  b=GCsTTL2uVJ4OKCv5Mk9wxCPMcNyuP6xKaQfbZelaKdQ5TMuuVzBKzvTX
   PCk3EKSVryI3qjAk7/HAp/fzY4wwaCvSkfAfs9gAf9zIFLdE+q53AULRs
   wq6cYcQ3rKM52gAUAuc262ya3QThQLN2UnSs86385v/XJQ9xg5ajdYWlK
   kW/sdG9e+VNuaNm/OyZiGcVVT4IKh+RIi1YM4OlIXnmZFVeKfriJtQ/l3
   7ZPLB6O4oaRKlqxH1vRiN0MFO7i3e2vc3ESyAgUTEcRKiyefZ9+eS6MtK
   MwW0+ZoedrwyAI9Rvis2/TVCCbZURutypz7j2+BYKpw0EwVCksKmhsqgf
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="287813017"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="287813017"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2022 20:54:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="691322796"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Jul 2022 20:54:13 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oIMVQ-000Elh-2s;
	Mon, 01 Aug 2022 03:54:12 +0000
Date: Mon, 1 Aug 2022 11:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Iskren Chernev <iskren.chernev@gmail.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Iskren Chernev <iskren.chernev@gmail.com>,
	Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH v3 05/13] regulator: qcom_spmi: Add support for new
 regulator types
Message-ID: <202208011110.Bms4zAP4-lkp@intel.com>
References: <20220731223736.1036286-6-iskren.chernev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220731223736.1036286-6-iskren.chernev@gmail.com>

Hi Iskren,

I love your patch! Yet something to improve:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on next-20220728]
[cannot apply to krzk-dt/for-next linus/master v5.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Iskren-Chernev/PM6125-regulator-support/20220801-064059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
config: arm64-buildonly-randconfig-r005-20220731 (https://download.01.org/0day-ci/archive/20220801/202208011110.Bms4zAP4-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/3758c84ef9cec75fc09a3463506782d3179fe480
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Iskren-Chernev/PM6125-regulator-support/20220801-064059
        git checkout 3758c84ef9cec75fc09a3463506782d3179fe480
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/regulator/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/regulator/qcom_spmi-regulator.c:1565:15: error: incompatible function pointer types initializing 'unsigned int (*)(struct regulator_dev *)' with an expression of type 'int (struct regulator_dev *, unsigned int)' [-Werror,-Wincompatible-function-pointer-types]
           .get_mode               = spmi_regulator_ftsmps3_get_mode,
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +1565 drivers/regulator/qcom_spmi-regulator.c

  1554	
  1555	static const struct regulator_ops spmi_ftsmps3_ops = {
  1556		.enable			= regulator_enable_regmap,
  1557		.disable		= regulator_disable_regmap,
  1558		.is_enabled		= regulator_is_enabled_regmap,
  1559		.set_voltage_sel	= spmi_regulator_ftsmps426_set_voltage,
  1560		.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel,
  1561		.get_voltage_sel	= spmi_regulator_ftsmps426_get_voltage,
  1562		.map_voltage		= spmi_regulator_single_map_voltage,
  1563		.list_voltage		= spmi_regulator_common_list_voltage,
  1564		.set_mode		= spmi_regulator_ftsmps3_set_mode,
> 1565		.get_mode		= spmi_regulator_ftsmps3_get_mode,
  1566		.set_load		= spmi_regulator_common_set_load,
  1567		.set_pull_down		= spmi_regulator_common_set_pull_down,
  1568	};
  1569	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
