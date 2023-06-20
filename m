Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D7BFC15;
	Tue, 20 Jun 2023 14:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687272143; x=1718808143;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YUP0bSxkKWO5d4BjEp6zuJpWwaITfLZRlRGiDo2fV/Y=;
  b=WXvXMvRN9KovsJP7E9jwWYZPqxxMC4vBK+G0t5HzyQwXadaagsHhI3jw
   tLBFgzDI1M33C9Hs74cIPyhuCBHXI749e2v83/DN+FkrRnui/cmWlpgaP
   j+a+cCKduDMqcvDZ04+UIa6l841gnx8aMwPkM9OavQvycKxCCU19mmS6x
   qC+0CzQh0wW0RaUmCjML4HUbbj1PP8lEmtBa5bTAfBspqRCiRVdWnhjWd
   PLiPR7KEH4EmQKLRNEdnT/tiuJiKaHlwoBOTmWtds1rO7oqrxgyc6lsov
   jJM7JpNMePrVlnZLhMVdTtGZoOaAGsI3Pf1qW8a6QpJU0gu1v00RbBamc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="389143936"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="389143936"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 07:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="714062218"
X-IronPort-AV: E=Sophos;i="6.00,257,1681196400"; 
   d="scan'208";a="714062218"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jun 2023 07:42:18 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBcYj-0005x0-2P;
	Tue, 20 Jun 2023 14:42:17 +0000
Date: Tue, 20 Jun 2023 22:41:36 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [akpm-mm:mm-stable 336/346] vmlinux.o: warning: objtool:
 damon_test_set_attrs() falls through to next function damon_get_folio()
Message-ID: <202306202242.3JHTdVKc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: SeongJae Park <sj@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kefeng Wang <wangkefeng.wang@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   cf01724e2d73a90524450e3dd8798cfb9d7aca05
commit: aa13779be6b7d1ce0e6ba96b400b351de6f1a326 [336/346] mm/damon/core-test: add a test for damon_set_attrs()
config: x86_64-buildonly-randconfig-r002-20230620 (https://download.01.org/0day-ci/archive/20230620/202306202242.3JHTdVKc-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230620/202306202242.3JHTdVKc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306202242.3JHTdVKc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: damon_test_set_attrs() falls through to next function damon_get_folio()
   vmlinux.o: warning: objtool: lkdtm_UNSET_SMEP+0x148: relocation to !ENDBR: native_write_cr4+0x4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
