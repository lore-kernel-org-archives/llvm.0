Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27D12F21
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644008573; x=1675544573;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fxyBOfnfV1aLQ6M01O9S+tsl/Qcfaw9GX706f+srkUk=;
  b=Ixtqlwqi4ukzTD6x5DFOfnaXx9xt2RNxPWRqlzr6mqQJfia8GCx0chEj
   3gIStOXAFpbo+P7R3cr+MOstkKRfu6jNhZR4pqzlgqsNtPZdnGzzKW3sy
   Tg30S9Op3cDgbh2QYI5S+677nWuktXutJ5AzS9NdkpB1H1jS7E2cMwwgR
   EGkDzzXyzDRSPPCvkOZOOZX4wviu3ZHcTkGjQ3i6bPmgpD+29uuBj1Fkz
   4F6YPqaer71m5O6a5N+0j4hX+7vYHuRqfPR5X4bEo0pwroqILYqM1gkCM
   0rZrL1m4juV+M1/TJV6Nz/l/B19w3+9GQpQmSwyNBytPAFrfa/uAoPHDc
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10248"; a="248201673"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="248201673"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2022 13:02:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; 
   d="scan'208";a="677205692"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2022 13:02:49 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nG5jE-000YBl-Ki; Fri, 04 Feb 2022 21:02:48 +0000
Date: Sat, 5 Feb 2022 05:02:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Stanimir Varbanov <svarbanov@mm-sol.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <swboyd@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Prasad Malisetty <pmaliset@codeaurora.org>
Subject: Re: [PATCH v2 05/11] clk: qcom: gcc-sm8450: switch PCIe GDSCs to
 pipe_clk_gdsc
Message-ID: <202202050432.j8kshuCH-lkp@intel.com>
References: <20220204144645.3016603-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220204144645.3016603-6-dmitry.baryshkov@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Dmitry,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on clk/clk-next v5.17-rc2 next-20220204]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Dmitry-Baryshkov/PCI-qcom-add-support-for-PCIe-on-SM8450-platform/20220204-224841
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: riscv-randconfig-r036-20220130 (https://download.01.org/0day-ci/archive/20220205/202202050432.j8kshuCH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/5d658c3994422b9324ffa9261c3b5d6288fd1dff
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/PCI-qcom-add-support-for-PCIe-on-SM8450-platform/20220204-224841
        git checkout 5d658c3994422b9324ffa9261c3b5d6288fd1dff
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/qcom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/qcom/gcc-sm8450.c:166:32: warning: unused variable 'gcc_parent_map_6' [-Wunused-const-variable]
   static const struct parent_map gcc_parent_map_6[] = {
                                  ^
>> drivers/clk/qcom/gcc-sm8450.c:171:37: warning: unused variable 'gcc_parent_data_6' [-Wunused-const-variable]
   static const struct clk_parent_data gcc_parent_data_6[] = {
                                       ^
   2 warnings generated.


vim +/gcc_parent_map_6 +166 drivers/clk/qcom/gcc-sm8450.c

db0c944ee92b7df Vinod Koul 2021-12-07  165  
db0c944ee92b7df Vinod Koul 2021-12-07 @166  static const struct parent_map gcc_parent_map_6[] = {
db0c944ee92b7df Vinod Koul 2021-12-07  167  	{ P_PCIE_1_PIPE_CLK, 0 },
db0c944ee92b7df Vinod Koul 2021-12-07  168  	{ P_BI_TCXO, 2 },
db0c944ee92b7df Vinod Koul 2021-12-07  169  };
db0c944ee92b7df Vinod Koul 2021-12-07  170  
db0c944ee92b7df Vinod Koul 2021-12-07 @171  static const struct clk_parent_data gcc_parent_data_6[] = {
db0c944ee92b7df Vinod Koul 2021-12-07  172  	{ .fw_name = "pcie_1_pipe_clk" },
db0c944ee92b7df Vinod Koul 2021-12-07  173  	{ .fw_name = "bi_tcxo" },
db0c944ee92b7df Vinod Koul 2021-12-07  174  };
db0c944ee92b7df Vinod Koul 2021-12-07  175  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
