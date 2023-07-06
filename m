Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0987F;
	Thu,  6 Jul 2023 02:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688610074; x=1720146074;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rnKXrVi9Fq+bOfKC6lFQiOFizRdsslRYAnjQy5KaJBo=;
  b=lNX0vT7qI0rLA3BBVX6e7f4Te22GEYHDTr0CbBflcydDsh8QQKLdvXIj
   CkklrSt6SMKmyLIH62K7rtUKDdUiDPzj95HvtVTd6pA3YQcnbJoSTF92Q
   6nJAVjLwPEvma93fPVlBUXUfN3Ua0xZyj1QMCIrKv2JS6OPXnNzn0vC9J
   VO7KjXgrXaDWlJYVJLM/jDWzhEYxkT2xrmLiajQxMK2ouPtfEtU2gzkoU
   6fq2yjWB49LR2pjjOjfvzwSFbEfYGdNeMadcFFbia5sYHB+8+lY3aevps
   cgi+wb7hWtOMUc72MXHUGfskdUz0zC0fAoNFl2DqHQy0Hog0tHekp8r5A
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="449847464"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="449847464"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 19:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="1049922999"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="1049922999"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Jul 2023 19:21:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHEcJ-0000z2-37;
	Thu, 06 Jul 2023 02:21:11 +0000
Date: Thu, 6 Jul 2023 10:20:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 1673/9999]
 drivers/infiniband/hw/qib/qib_iba7322.o: warning: objtool:
 write_7322_initregs() falls through to next function set_vl_weights()
Message-ID: <202307061039.qIhL59Rs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Tadeusz Struk <tadeusz.struk@linaro.org>

Hi Kees,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   381518b4a9165cd793599c1668c82079fcbcbe1f
commit: 58823a9b097cf36dd59c4d463396e15a5ec4efb7 [1673/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: x86_64-randconfig-x011-20230706 (https://download.01.org/0day-ci/archive/20230706/202307061039.qIhL59Rs-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061039.qIhL59Rs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061039.qIhL59Rs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/qib/qib_iba7322.o: warning: objtool: write_7322_initregs() falls through to next function set_vl_weights()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
