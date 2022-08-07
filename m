Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CB47A
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 06:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659854734; x=1691390734;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D973tT9ARFoTQuMbyYCIYiHvXSN6FVCn0aUlmTL7OL0=;
  b=YAqx0CFowuNg+DrhJOrDfQCb0M58XOo7JuFlSqoCYQVNrRZaWeI+OHFM
   WFNFkVzcPc8vWCHKHGuq3PT2D1za63IZjydPafhCvBwWsP7OjCr+DTvJq
   TPZnwDJbfyg3Pj6SOdrKWHygKkCyCYdiaETF3bb77kKttdPDo7OIsgwN0
   Fw3TCuL4e2lsR/ddT05BR6OoZvIiXDA0U33XP+HYZ9t+tq0wTW/BnA39F
   F3G7V7F+DQygOUGXIyNjH048xegl0sCovss5mx4Ivf7JcXR7OqRseRCaq
   rDA9BYXQyDwgEn1tnoNACeIQjMuhRDMbbSSlt2OeucATVkBqFI3D6LEV6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="352140949"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="352140949"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 23:45:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="554560263"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Aug 2022 23:45:23 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKa2N-000L49-0t;
	Sun, 07 Aug 2022 06:45:23 +0000
Date: Sun, 7 Aug 2022 14:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: alexlzhu@fb.com, linux-mm@kvack.org, kernel-team@fb.com,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Alexander Zhu <alexlzhu@fb.com>
Subject: Re: [PATCH v3] mm: add thp_utilization metrics to
 /proc/thp_utilization
Message-ID: <202208071442.EIrjgLbV-lkp@intel.com>
References: <20220805184016.2926168-1-alexlzhu@fb.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805184016.2926168-1-alexlzhu@fb.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19]
[cannot apply to akpm-mm/mm-everything next-20220805]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/alexlzhu-fb-com/mm-add-thp_utilization-metrics-to-proc-thp_utilization/20220806-024150
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 9e2f40233670c70c25e0681cb66d50d1e2742829
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220807/202208071442.EIrjgLbV-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5f1c7e2cc5a3c07cbc2412e851a7283c1841f520)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/c3896ed4c7d2319ac0880860a6bfc98e6eed3d66
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review alexlzhu-fb-com/mm-add-thp_utilization-metrics-to-proc-thp_utilization/20220806-024150
        git checkout c3896ed4c7d2319ac0880860a6bfc98e6eed3d66
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/huge_memory.c:601:6: warning: no previous prototype for function 'is_anon_transparent_hugepage' [-Wmissing-prototypes]
   bool is_anon_transparent_hugepage(struct page *page)
        ^
   mm/huge_memory.c:601:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool is_anon_transparent_hugepage(struct page *page)
   ^
   static 
   mm/huge_memory.c:3300:22: warning: variable 'head' set but not used [-Wunused-but-set-variable]
           struct page *page, *head = NULL;
                               ^
   2 warnings generated.


vim +/is_anon_transparent_hugepage +601 mm/huge_memory.c

   600	
 > 601	bool is_anon_transparent_hugepage(struct page *page)
   602	{
   603		return PageAnon(page) && is_transparent_hugepage(page);
   604	}
   605	EXPORT_SYMBOL_GPL(is_anon_transparent_hugepage);
   606	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
