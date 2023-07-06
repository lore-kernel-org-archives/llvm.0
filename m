Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0971A8C17;
	Thu,  6 Jul 2023 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688660569; x=1720196569;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=A2nGMFf1p7LMm7ceGrBrg0MJ9N4lP5wXQN0dF60tUXg=;
  b=lpq1IpY6qJBCg9hYQh4QGyPhEBdP90IRypFROrOdFftAK3tKQsKudZL6
   B+s+FSuxdL4RHvfOw15K20Ze+B6n1pDnLJ2tDt/eZc+/aDXp3QZnkInZq
   yki+JaZ9xPpyTNE6DEJPoB5/8J/JRCSAzLfglF9YYJHgvBtuj+Z6NyhRi
   ICF5xu0HU6WRT/sQAx0CsBm7Bl/SvigbYn+sr80kJEN9uYzsqYM/tlOV0
   tyAVHJMqPpnlnIuhP1F3WGfHQj5df9ZTYovwxRL0CZlGkcZJmGHQmDDB9
   fPTAhs+b3x/3cHob1ovJk0XrzwyI6fpGm3CKGqa8XtrLH2m8hdpZVYtPq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394409836"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="394409836"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 09:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="669789947"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="669789947"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jul 2023 09:22:38 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHRkc-0001Rn-0I;
	Thu, 06 Jul 2023 16:22:38 +0000
Date: Fri, 7 Jul 2023 00:21:51 +0800
From: kernel test robot <lkp@intel.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/2] mtd: rawnand: meson: support for 512B ECC
 step size
Message-ID: <202307070032.1IfXtrSq-lkp@intel.com>
References: <20230628092937.538683-3-AVKrasnov@sberdevices.ru>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230628092937.538683-3-AVKrasnov@sberdevices.ru>

Hi Arseniy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on mtd/mtd/next]
[also build test ERROR on mtd/nand/next linus/master next-20230706]
[cannot apply to mtd/mtd/fixes robh/for-next v6.4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arseniy-Krasnov/dt-bindings-nand-meson-support-for-512B-ECC-step-size/20230628-174345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next
patch link:    https://lore.kernel.org/r/20230628092937.538683-3-AVKrasnov%40sberdevices.ru
patch subject: [RFC PATCH v1 2/2] mtd: rawnand: meson: support for 512B ECC step size
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230707/202307070032.1IfXtrSq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070032.1IfXtrSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070032.1IfXtrSq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mtd/nand/raw/meson_nand.c:244:59: error: initializer element is not a compile-time constant
     244 | static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
         |                                                           ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +244 drivers/mtd/nand/raw/meson_nand.c

   243	
 > 244	static const struct nand_ecc_step_info axg_stepinfo[] = { axg_stepinfo_1024, axg_stepinfo_512 };
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
