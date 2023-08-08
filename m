Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F8114A9C;
	Tue,  8 Aug 2023 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691515329; x=1723051329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=adWg76Mr4lPVEpd1LAibq0Tl3US8HUL9ildgmJit+f4=;
  b=bIJJJoyJshtPUCZ7JVGRy+fkOdhKdcfDO/FfzklMSuTUwZ5OtLRgWnCw
   tkLvo+rK0pqmbO/QUehgJy9cRK4s/yfctShkCgALmstYMt2K6/FbUrg57
   mgQsjbt+lhOB+GoE8h906V6pdY3XVcrE+Ul9yfHZfl4vs7WAdDhqi3GDg
   un9FFZ+03rBAjPlkf+oP9ZEmg6NeDGAu9Ir7Z42DxsdZSPEepqNy13T7T
   jQPdOIqT9fI77cVaheMX//Mn6vZHQdWLS1EXPXXPkTmtAtWOJs6gflrLo
   LUSEmwlE1INkR15+Vquu9VyBdZBlWMUX90m+XhvZkeM48sBJqkc/Vv3LM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="369794371"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="369794371"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 10:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="708347296"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="708347296"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Aug 2023 10:22:06 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTQPF-0005Us-25;
	Tue, 08 Aug 2023 17:22:05 +0000
Date: Wed, 9 Aug 2023 01:21:28 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-mm@kvack.org
Subject: [vbabka:slub-percpu-caches-v1 5/5] ld.lld: error: undefined symbol:
 kmem_cache_prefill_percpu_array
Message-ID: <202308090149.185HaDfg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v1
head:   23793c9cd4b2fc31144dba68dd67554b8e4308e9
commit: 23793c9cd4b2fc31144dba68dd67554b8e4308e9 [5/5] maple_tree: replace preallocation with slub percpu array prefill
config: hexagon-randconfig-r026-20230808 (https://download.01.org/0day-ci/archive/20230809/202308090149.185HaDfg-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308090149.185HaDfg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308090149.185HaDfg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kmem_cache_prefill_percpu_array
   >>> referenced by maple_tree.c:5561 (lib/maple_tree.c:5561)
   >>>               maple_tree.o:(mas_preallocate) in archive lib/lib.a
   >>> referenced by maple_tree.c:5561 (lib/maple_tree.c:5561)
   >>>               maple_tree.o:(mas_preallocate) in archive lib/lib.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
