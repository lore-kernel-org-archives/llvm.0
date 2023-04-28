Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812CF10E5;
	Fri, 28 Apr 2023 06:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682663845; x=1714199845;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PfvqQ27hqmXNIz4o82YBCQ/XRlU6bMPpIIKHLYpJUqc=;
  b=MiHQ5DzUDMyqMm2lJ/onBXCv5ee/JYFcytaHtWI2aRMRfTsEJ8NfrBoN
   4WrtWxN5EtOsucQLwLZ8s9rX4dw59SUe5DoVZniO7pw2/5wsbFucBKyqW
   xK6T7t4M4IIus5d93bwmOBWvU6SuEfYYllgP43/U/JEbKjz8gbPpM/tXb
   tdv+0FeWpCpaZMoM1AhVQddqLM1yQUVWL0LyyQzu2lE95wRQuV+5UazJq
   cc+V4yHOTpEaQBAnrmzCz2U5a1psvP9IAyAvqd6O93ROG/+EMnkWg4uDx
   AauXvVYRmTYA7NhVYLk0JH8gWq2s+OWcUxCibZNkYTAKqYnur5eWz2Ahg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="327286595"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="327286595"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 23:37:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="672040719"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="672040719"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 27 Apr 2023 23:37:23 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psHjO-0000DJ-0p;
	Fri, 28 Apr 2023 06:37:22 +0000
Date: Fri, 28 Apr 2023 14:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v7 6/8] ptp_ocp: implement DPLL ops
Message-ID: <202304281438.QAdSihGx-lkp@intel.com>
References: <20230428002009.2948020-7-vadfed@meta.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230428002009.2948020-7-vadfed@meta.com>

Hi Vadim,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.3]
[cannot apply to tnguy-next-queue/dev-queue linus/master next-20230427]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230428002009.2948020-7-vadfed%40meta.com
patch subject: [RFC PATCH v7 6/8] ptp_ocp: implement DPLL ops
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230428/202304281438.QAdSihGx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/45d9112b4633e7cea8984cb09cc5f55203a8ec32
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vadim-Fedorenko/dpll-spec-Add-Netlink-spec-in-YAML/20230428-082340
        git checkout 45d9112b4633e7cea8984cb09cc5f55203a8ec32
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/dpll/ drivers/ptp/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304281438.QAdSihGx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dpll/dpll_core.c:296:1: warning: no previous prototype for function 'dpll_xa_ref_dpll_find' [-Wmissing-prototypes]
   dpll_xa_ref_dpll_find(struct xarray *xa_refs, const struct dpll_device *dpll)
   ^
   drivers/dpll/dpll_core.c:295:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct dpll_pin_ref *
   ^
   static 
   1 warning generated.
--
>> drivers/dpll/dpll_netlink.c:969:13: warning: no previous prototype for function 'dpll_netlink_fini' [-Wmissing-prototypes]
   void __exit dpll_netlink_fini(void)
               ^
   drivers/dpll/dpll_netlink.c:969:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __exit dpll_netlink_fini(void)
   ^
   static 
   1 warning generated.
--
>> drivers/ptp/ptp_ocp.c:4314:37: warning: variable 'val' is uninitialized when used here [-Wuninitialized]
                           return ptp_ocp_sma_store_val(bp, val, sma->mode, sma_nr);
                                                            ^~~
   drivers/ptp/ptp_ocp.c:4306:9: note: initialize the variable 'val' to silence this warning
           int val, i;
                  ^
                   = 0
   1 warning generated.


vim +/val +4314 drivers/ptp/ptp_ocp.c

  4295	
  4296	static int ptp_ocp_dpll_frequency_set(const struct dpll_pin *pin,
  4297					      void *pin_priv,
  4298					      const struct dpll_device *dpll,
  4299					      void *dpll_priv, u64 frequency,
  4300					      struct netlink_ext_ack *extack)
  4301	{
  4302		struct ptp_ocp_sma_connector *sma = pin_priv;
  4303		struct ptp_ocp *bp = dpll_priv;
  4304		const struct ocp_selector *tbl;
  4305		int sma_nr = (sma - bp->sma);
  4306		int val, i;
  4307	
  4308		if (sma->fixed_fcn)
  4309			return -EOPNOTSUPP;
  4310	
  4311		tbl = bp->sma_op->tbl[sma->mode];
  4312		for (i = 0; tbl[i].name; i++)
  4313			if (tbl[i].frequency == frequency)
> 4314				return ptp_ocp_sma_store_val(bp, val, sma->mode, sma_nr);
  4315		return -EINVAL;
  4316	}
  4317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
