Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90168174CE;
	Tue, 18 Jul 2023 20:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689712160; x=1721248160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mg0hKSyvUEphvxqjSAwzlXL5yxY/9DhprLFklW8t5N0=;
  b=AuBdffoT0qGWY1WwK96BI7wuYhSFLRLcZVdgwHsmg2wqvZZFwHLVRlIO
   4P6+0ekXOVFbY/7cO5vOlxfYyXMEaY4mpJRXH1NdfFupNpUsL3rrSh8dB
   04H7a+bHX7duHHNiLSKMNA84ax+8F3OA8eWmUF4i6s0Hlg3JAyo85NRIz
   ZrFArmSjXTsJJ8xav04Ra/agdg2R63LUa7PxEISNUi6OuDTyfi8SXNyoW
   mFkqTmgmjfuyB3B/6P+lvvBHpprCzsNIdq3CHO8lXwqvok8aKfNz4u/T+
   gn5Yf0oINruA0CuaTk8ZjxFXUa5u8Oqv1uuK2MmKKTH5AO18PzlkgmSoF
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="369864570"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="369864570"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="793755246"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="793755246"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jul 2023 13:29:18 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLrJt-0003sP-2J;
	Tue, 18 Jul 2023 20:29:17 +0000
Date: Wed, 19 Jul 2023 04:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 4/4] cxl/pci: Add support for stand alone CXL
 Switch mailbox CCI
Message-ID: <202307190403.S7poXmCU-lkp@intel.com>
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
config: s390-randconfig-r044-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190403.S7poXmCU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190403.S7poXmCU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190403.S7poXmCU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[5]: *** No rule to make target 'drivers/cxl/core/switch-cci.o', needed by 'drivers/cxl/core/cxl_core.o'.
   make[5]: Target 'drivers/cxl/core/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
