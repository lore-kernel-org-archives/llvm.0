Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4E01376
	for <llvm@lists.linux.dev>; Mon, 13 Jun 2022 14:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655130533; x=1686666533;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yo6oWuP1uRTaNxH2baN81HXr0Uua9EFGTDjlZt3dMu8=;
  b=WXhvSEC0oaXO0wXV/2JoBJTyN7upbxSN9MxgAvrE2wUF5E8zd3QGFGcj
   9ItxOL1vfkZ0d/H10TUTaA0xSEQvcgN/pkViCgGMzq9XZwmmfEsyuxDUp
   XTXFT5PJG6kNjZlKHKS3LqDredEFdGg7haPHWmLM+o+EEE38KaaG0s3gf
   ZvHdoC8RIG4cpDb6yIJpLYxCVhFfpZgUb0chUEXudMdszo6owB7U+R0T+
   5giiW8VT8ODVuwA/7JT4wiuElYO0G1yItFEzLHJ2nlYSeY43+Fog73op5
   5QuYXNNClE3qOelB+2y2bHHOyuxZxMDNW26oNztE516ZRRq7J+qNj/eHv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="339969157"
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="339969157"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 07:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,297,1647327600"; 
   d="scan'208";a="611801842"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 13 Jun 2022 07:28:49 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0l3g-000Ks1-MG;
	Mon, 13 Jun 2022 14:28:48 +0000
Date: Mon, 13 Jun 2022 22:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: Ansuel Smith <ansuelsmth@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ansuel Smith <ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 1/3] mtd: nand: raw: qcom_nandc: add support for
 unprotected spare data pages
Message-ID: <202206132205.G3tGFPx7-lkp@intel.com>
References: <20220608001030.18813-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608001030.18813-2-ansuelsmth@gmail.com>

Hi Ansuel,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mtd/nand/next]
[also build test WARNING on mtd/mtd/next mtd/mtd/fixes robh/for-next v5.19-rc2 next-20220610]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Ansuel-Smith/Add-support-for-unprotected-spare-data-page/20220608-104834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next
config: hexagon-randconfig-r041-20220613 (https://download.01.org/0day-ci/archive/20220613/202206132205.G3tGFPx7-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d378268ead93c85803c270277f0243737b536ae7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/5f9263b88e99a6cae44be5e737cb0928ee420e87
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ansuel-Smith/Add-support-for-unprotected-spare-data-page/20220608-104834
        git checkout 5f9263b88e99a6cae44be5e737cb0928ee420e87
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/mtd/nand/raw/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mtd/nand/raw/qcom_nandc.c:3020:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   return ret;
                          ^~~
   drivers/mtd/nand/raw/qcom_nandc.c:3009:33: note: initialize the variable 'ret' to silence this warning
           int partitions_count, i, j, ret;
                                          ^
                                           = 0
   1 warning generated.


vim +/ret +3020 drivers/mtd/nand/raw/qcom_nandc.c

  3000	
  3001	static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nandc,
  3002							struct qcom_nand_host *host,
  3003							struct device_node *dn)
  3004	{
  3005		struct nand_chip *chip = &host->chip;
  3006		struct mtd_info *mtd = nand_to_mtd(chip);
  3007		struct qcom_nand_boot_partition *boot_partition;
  3008		struct device *dev = nandc->dev;
  3009		int partitions_count, i, j, ret;
  3010	
  3011		if (!nandc->props->use_codeword_fixup)
  3012			return 0;
  3013	
  3014		if (!of_find_property(dn, "qcom,boot-partitions", NULL))
  3015			return 0;
  3016	
  3017		partitions_count = of_property_count_u32_elems(dn, "qcom,boot-partitions");
  3018		if (partitions_count < 0) {
  3019			dev_err(dev, "Error parsing boot partition.");
> 3020			return ret;
  3021		}
  3022	
  3023		host->nr_boot_partitions = partitions_count / 2;
  3024		host->boot_partitions = devm_kcalloc(dev, host->nr_boot_partitions,
  3025						     sizeof(*host->boot_partitions), GFP_KERNEL);
  3026		if (!host->boot_partitions)
  3027			return -ENOMEM;
  3028	
  3029		for (i = 0, j = 0; i < host->nr_boot_partitions; i++, j += 2) {
  3030			boot_partition = &host->boot_partitions[i];
  3031	
  3032			ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j,
  3033							 &boot_partition->page_offset);
  3034			if (ret) {
  3035				dev_err(dev, "Error parsing boot partition offset at index %d", i);
  3036				return ret;
  3037			}
  3038	
  3039			if (boot_partition->page_offset % mtd->writesize) {
  3040				dev_err(dev, "Boot partition offset not multiple of writesize at index %i",
  3041					i);
  3042				return -EINVAL;
  3043			}
  3044			/* Convert offset to nand pages */
  3045			boot_partition->page_offset /= mtd->writesize;
  3046	
  3047			ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j + 1,
  3048							 &boot_partition->page_size);
  3049			if (ret) {
  3050				dev_err(dev, "Error parsing boot partition size at index %d", i);
  3051				return ret;
  3052			}
  3053	
  3054			if (boot_partition->page_size % mtd->writesize) {
  3055				dev_err(dev, "Boot partition size not multiple of writesize at index %i",
  3056					i);
  3057				return -EINVAL;
  3058			}
  3059			/* Convert size to nand pages */
  3060			boot_partition->page_size /= mtd->writesize;
  3061		}
  3062	
  3063		return 0;
  3064	}
  3065	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
