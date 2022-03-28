Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815077C
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 21:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648503357; x=1680039357;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Go8oxxC6Pe7H7dirXGB5IDnB7EGjXVoNw/QrYHUiyLg=;
  b=VASrmGdGXbyGYImUy41ZdduEZvIKb10pXXXtq1ch8Gp1/xwSDOu4vwX7
   9Q0tsqM6QULCzPDYBJ3SZ2lzJFuJWsjsHn4f9jQmjcmB+6mF5InuIgvJb
   8zH1AbuW7x+PPOwGTrP1D6PEyj95EJadDWkS9q9KZHiNJpR3ZShfdGAAQ
   0ahEOH3MzWfLy7Oo7l9OT9M04w0i1qeNmkNlHlXKdf5791E4Lx/hj6gm3
   wd2jwBF4j8TOR58zIr8bdlJMBhJM3s7MUjit4Qzlxrnhd2tnwQ1275F1K
   nWt17rFc4ps/bXTPkSBb8hIfZaw8vsF+J5e8SDyaWnPfrmtjSyfmxxlBY
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="258822661"
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="258822661"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 14:35:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,218,1643702400"; 
   d="scan'208";a="564024528"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 28 Mar 2022 14:35:51 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYx1j-0002Kz-6r; Mon, 28 Mar 2022 21:35:51 +0000
Date: Tue, 29 Mar 2022 05:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@ti.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
	Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
	Frank Li <Frank.Li@nxp.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] PCI: dwc: Add unroll iATU space support to the
 regions disable method
Message-ID: <202203290533.uObikFCd-lkp@intel.com>
References: <20220324012524.16784-4-Sergey.Semin@baikalelectronics.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324012524.16784-4-Sergey.Semin@baikalelectronics.ru>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Serge,

I love your patch! Perhaps something to improve:

[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on v5.17 next-20220328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Serge-Semin/PCI-dwc-Various-fixes-and-cleanups/20220328-231112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: arm64-buildonly-randconfig-r004-20220327 (https://download.01.org/0day-ci/archive/20220329/202203290533.uObikFCd-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/fb5c4386b8af12124d1e7b48bd7f538c12d85100
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Serge-Semin/PCI-dwc-Various-fixes-and-cleanups/20220328-231112
        git checkout fb5c4386b8af12124d1e7b48bd7f538c12d85100
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pci/controller/dwc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-designware.c:508:14: warning: result of comparison of constant 2147483648 with expression of type 'int' is always false [-Wtautological-constant-out-of-range-compare]
                   if (region == PCIE_ATU_REGION_INBOUND) {
                       ~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/int +508 drivers/pci/controller/dwc/pcie-designware.c

   490	
   491	void dw_pcie_disable_atu(struct dw_pcie *pci, int index,
   492				 enum dw_pcie_region_type type)
   493	{
   494		int region;
   495	
   496		switch (type) {
   497		case DW_PCIE_REGION_INBOUND:
   498			region = PCIE_ATU_REGION_INBOUND;
   499			break;
   500		case DW_PCIE_REGION_OUTBOUND:
   501			region = PCIE_ATU_REGION_OUTBOUND;
   502			break;
   503		default:
   504			return;
   505		}
   506	
   507		if (pci->iatu_unroll_enabled) {
 > 508			if (region == PCIE_ATU_REGION_INBOUND) {
   509				dw_pcie_writel_ib_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
   510							 ~(u32)PCIE_ATU_ENABLE);
   511			} else {
   512				dw_pcie_writel_ob_unroll(pci, index, PCIE_ATU_UNR_REGION_CTRL2,
   513							 ~(u32)PCIE_ATU_ENABLE);
   514			}
   515		} else {
   516			dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, region | index);
   517			dw_pcie_writel_dbi(pci, PCIE_ATU_CR2, ~(u32)PCIE_ATU_ENABLE);
   518		}
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
