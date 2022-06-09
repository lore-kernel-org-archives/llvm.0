Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5995F2CA2
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654786600; x=1686322600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AhOKgRD6dzPhGcbP+FED4Ce5jeuzBr0fCvK3sx/IZr4=;
  b=JHQOHcffWnIp5pODoZh2Ith1Idb8nWRGLO6m+vN84JXN3txXzoor5Mly
   7pfOINVViR4xUBektMUZ8KkgCmhtOItcihZ6/CMLThTpl/8jlvSrMcu/v
   yucx5R9YOz2MksHW5PAKcsrwERmKyqBMrdkWlael3kzDSG9/do1JuWj45
   ZAcKPAR57EuGc/QV7RSn62eOKi+H/cSjiAhRt6qC05tzkP8W/0RqVt178
   PzM4GxSTGEPTxQfFYjxxOpQQAYAaHzO10vMFOc3riNHoXn3f8Y3EENmgs
   uBWJAT+v7VfPeEOhMAyaebt9t7belswWryGv8r08fEz5ObaXapooAak3t
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="363633675"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="363633675"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 07:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="610286885"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Jun 2022 07:56:36 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzJaO-000G55-3C;
	Thu, 09 Jun 2022 14:56:36 +0000
Date: Thu, 9 Jun 2022 22:56:33 +0800
From: kernel test robot <lkp@intel.com>
To: Aswath Govindraju <a-govindraju@ti.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip/ti-sci-intr: Add support for system
 suspend/resume PM
Message-ID: <202206092226.YcJ2jTZb-lkp@intel.com>
References: <20220607061912.12222-1-a-govindraju@ti.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607061912.12222-1-a-govindraju@ti.com>

Hi Aswath,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/irq/core]
[also build test WARNING on v5.19-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Aswath-Govindraju/irqchip-ti-sci-intr-Add-support-for-system-suspend-resume-PM/20220607-142656
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git cdb4913293897dde0df522ed5789ba016f3b9157
config: arm64-randconfig-r020-20220607 (https://download.01.org/0day-ci/archive/20220609/202206092226.YcJ2jTZb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c41c5fa0992f5a0a3298d6933ed84349f1f48b58
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Aswath-Govindraju/irqchip-ti-sci-intr-Add-support-for-system-suspend-resume-PM/20220607-142656
        git checkout c41c5fa0992f5a0a3298d6933ed84349f1f48b58
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/irqchip/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-ti-sci-intr.c:270: warning: expecting prototype for ti_sci_intr_initialize_mappingg(). Prototype was for ti_sci_intr_initialize_mapping() instead


vim +270 drivers/irqchip/irq-ti-sci-intr.c

   264	
   265	/**
   266	 * ti_sci_intr_initialize_mappingg - Initialize the out_irq <-> hwirq mapping table
   267	 * @intr:	IRQ domain corresponding to Interrupt Router
   268	 */
   269	static int ti_sci_intr_initialize_mapping(struct ti_sci_intr_irq_domain *intr)
 > 270	{
   271		int i;
   272		int mapping_len = intr->out_irqs->desc->num + intr->out_irqs->desc->num_sec;
   273	
   274		intr->mapping = devm_kzalloc(intr->dev, mapping_len * sizeof(u32), GFP_KERNEL);
   275		if (!intr->mapping)
   276			return -ENOMEM;
   277	
   278		/* Set all the elements in the array to max value of u32 */
   279		for (i = 0; i < mapping_len; i++)
   280			intr->mapping[i] = 0xFFFFFFFF;
   281	
   282		return 0;
   283	}
   284	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
