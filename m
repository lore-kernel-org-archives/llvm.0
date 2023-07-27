Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7156442E;
	Thu, 27 Jul 2023 22:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690498711; x=1722034711;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qSj3/vAlyUamv7eyyU/l2cTJtIEQyVQP6IFQclyBzDE=;
  b=WqYORl7fqAPG0ML76O+MwtcBvZWULRxELHPBFIJHAijgct8yFvvizfhr
   0nRpurANhsWm7e3J0gXE+Lb/TyRUZaVLAvjDtiIs48t38BYYBeZEnlPTW
   74QrXg/cH/2CW9oZ39fPMUQhHFvdzNuQSmk9u/7YmA2B7FEV+pLYFga1P
   i3HLPqWLVMfEKhda8APWb8DixpK0lDWtg+Sxf38MEsifNYHshjrCipFjj
   cjdYw9UCFoKNol833CfpDfZOAUtBSFv4xlweZGPYbSMy6MKOY5pTd8rb4
   ySg3uLgnp3UrP7K9ebf2JBLwMo8wMWfLIorgUwatkFT6fu7TKndW+jomG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="372076285"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="372076285"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 15:58:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="677302644"
X-IronPort-AV: E=Sophos;i="6.01,236,1684825200"; 
   d="scan'208";a="677302644"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 27 Jul 2023 15:58:30 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP9wD-0002gL-15;
	Thu, 27 Jul 2023 22:58:29 +0000
Date: Fri, 28 Jul 2023 06:57:34 +0800
From: kernel test robot <lkp@intel.com>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 07/11] iio: adc: stm32-dfsdm: add scaling support to
 dfsdm
Message-ID: <202307280630.WdzqZfZN-lkp@intel.com>
References: <20230727150324.1157933-8-olivier.moysan@foss.st.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727150324.1157933-8-olivier.moysan@foss.st.com>

Hi Olivier,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on atorgue-stm32/stm32-next robh/for-next linus/master v6.5-rc3 next-20230727]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Olivier-Moysan/iio-introduce-iio-backend-device/20230727-231112
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20230727150324.1157933-8-olivier.moysan%40foss.st.com
patch subject: [RFC v2 07/11] iio: adc: stm32-dfsdm: add scaling support to dfsdm
config: arm-randconfig-r025-20230727 (https://download.01.org/0day-ci/archive/20230728/202307280630.WdzqZfZN-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230728/202307280630.WdzqZfZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307280630.WdzqZfZN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fwnode_iio_backend_get
   >>> referenced by stm32-dfsdm-adc.c
   >>>               drivers/iio/adc/stm32-dfsdm-adc.o:(stm32_dfsdm_generic_chan_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
