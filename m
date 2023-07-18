Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A3D17AA9;
	Tue, 18 Jul 2023 23:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689722198; x=1721258198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nyb39Ms9qc56k+1zBWRG1bQ4RfbBkNBiI5V8uhSqvFY=;
  b=K+KNAYJruAhqwhAOWDk1V4AV2puebone0YvtD3YsW5jRf8koCNlXA/W/
   Sa5kys4AGtwBeSF2m+ODglDwJa/YXiafxt77unHCHyTqVj0ZmWHKL1Uck
   lA18JhFRsJiT5y4Ie4NiGCecsOGnntyWq6/QtTyTd/8RvU+tRXm5hEHIP
   0321cz4kb/27wGoRaTNYs9C2G5xw6qIR0cYhUp6YZywahxe7h+lUAkSaH
   sRs/qZBoqq3DRq+XayNvb8HqfxmWzA5/TwlFvFCu3UQEBJ5w/04CE9zBh
   1PjpFyI+tp+EJMDp5n4Pg8kGEhH9XiOVtcg7c+1ewC2KBHkS6Gep7CAO2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430095154"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="430095154"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 16:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="674089524"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="674089524"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 18 Jul 2023 16:16:36 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLtvn-0003wX-1x;
	Tue, 18 Jul 2023 23:16:35 +0000
Date: Wed, 19 Jul 2023 07:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/4] cxl/pci: Add support for stand alone CXL
 Switch mailbox CCI
Message-ID: <202307190713.s4zVJZMV-lkp@intel.com>
References: <20230717162557.8625-5-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717162557.8625-5-Jonathan.Cameron@huawei.com>

Hi Jonathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on pci/next pci/for-linus linus/master v6.5-rc2 next-20230718]
[cannot apply to cxl/pending]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cameron/cxl-mbox-Preparatory-move-of-functions-to-core-mbox-c/20230718-181730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20230717162557.8625-5-Jonathan.Cameron%40huawei.com
patch subject: [RFC PATCH v3 4/4] cxl/pci: Add support for stand alone CXL Switch mailbox CCI
config: arm64-randconfig-r014-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190713.s4zVJZMV-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190713.s4zVJZMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190713.s4zVJZMV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/cxl/core/switch-cci.o', needed by 'drivers/cxl/core/built-in.a'.
   make[5]: Target 'drivers/cxl/core/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
