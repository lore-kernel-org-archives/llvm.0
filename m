Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AF315AF;
	Thu,  7 Sep 2023 08:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694074796; x=1725610796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6xfcYc3m7uxT3N5X0sc3GtT4sgpqUv1hPqm7Ew2kiHU=;
  b=GpzkWBFq+VXOUheJ/ttp/01htZWtlf9a/J3hSt8cX7dRU5TlaEiy3NP0
   ApnKaDtBZqCByt2lrBItYH4THP4SH0f7r8XKWZz1mfLz+v05FVkL3GVFq
   e2iVYEah0mw09WMFz9eJIPRl2CJ6rE5hRoxRVjWEXLkXNHvvgtW1kXuob
   hnNiYEWNf4KXcy7UWBIuhFosY3VC+6gIdPl4AD1OOQ9X/4VSIIqb2hjJ3
   QCoVpZATsSeCpjKqRz6tJMgBS71jxoqqcZn0hUuwWshx1YOvaZOCD1Ryr
   nzB66npVvTOeYTfbC7j5xM4E2UkvlMWVV7j0fGdsHx/oq5JL4RbwTz63c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="377206459"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="377206459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 01:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="915636989"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; 
   d="scan'208";a="915636989"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Sep 2023 01:19:54 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeAEy-000127-2E;
	Thu, 07 Sep 2023 08:19:52 +0000
Date: Thu, 7 Sep 2023 16:18:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lukasz Majewski <lukma@denx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 RFC 2/4] net: dsa: Extend ksz9477 TAG setup to support
 HSR frames duplication
Message-ID: <202309071548.IH5VPHAf-lkp@intel.com>
References: <20230904120209.741207-3-lukma@denx.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904120209.741207-3-lukma@denx.de>

Hi Lukasz,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v6.5]
[also build test ERROR on next-20230907]
[cannot apply to net-next/main net/main linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Majewski/net-dsa-Extend-the-ksz_device-structure-to-hold-info-about-HSR-ports/20230904-200547
base:   v6.5
patch link:    https://lore.kernel.org/r/20230904120209.741207-3-lukma%40denx.de
patch subject: [PATCH v3 RFC 2/4] net: dsa: Extend ksz9477 TAG setup to support HSR frames duplication
config: i386-randconfig-011-20230906 (https://download.01.org/0day-ci/archive/20230907/202309071548.IH5VPHAf-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230907/202309071548.IH5VPHAf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309071548.IH5VPHAf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: ksz_hsr_get_ports
   >>> referenced by tag_ksz.c:298 (net/dsa/tag_ksz.c:298)
   >>>               vmlinux.o:(ksz9477_xmit)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
