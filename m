Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F3520E8
	for <llvm@lists.linux.dev>; Wed,  4 May 2022 02:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651632876; x=1683168876;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TTK/nw4JGd0DgfC3qaTPpWApZeu31vUgT5+PhlW7+/0=;
  b=VgqFczC9gthwFlSPqwsD2onMISj+zv6VLnqbUlpLfxQQIq8vZaMWBlN4
   2YtijSHh4vlTSKcQ1pDntuM6ny0zfEu3y8FoYSegb3QxyDil11nGAdCBw
   t5Ps69bSyeTpMr3ZTWW6y7FCjOhPPyX9ZUdaNTimg0scnn+089Ry72K56
   e9I1LF8xjVv0QZR+bQzRknbklVu6qNs4e0uRVEtKuSnN914F7AJqUVpnS
   kkv9XG8B+21ynITWjCd8jo1ASmDL/ICloWHTL9OPKGxIx6ro8138EpKJp
   FrJSy6pMrvu6DQuSyDbdAbv4JKcyGsVyHGETuXBkjURi9Y5h4+H9oJ4Cv
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="330634562"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="330634562"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2022 19:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; 
   d="scan'208";a="734200291"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 May 2022 19:54:35 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nm59u-000AzV-Fz;
	Wed, 04 May 2022 02:54:34 +0000
Date: Wed, 4 May 2022 10:53:47 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] mm/damon/sysfs: fix pid leak under fvaddr ops use case
Message-ID: <202205041011.jv6vuDe4-lkp@intel.com>
References: <20220503220531.45913-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503220531.45913-1-sj@kernel.org>

Hi SeongJae,

I love your patch! Yet something to improve:

[auto build test ERROR on hnaz-mm/master]

url:    https://github.com/intel-lab-lkp/linux/commits/SeongJae-Park/mm-damon-sysfs-fix-pid-leak-under-fvaddr-ops-use-case/20220504-060657
base:   https://github.com/hnaz/linux-mm master
config: hexagon-randconfig-r045-20220501 (https://download.01.org/0day-ci/archive/20220504/202205041011.jv6vuDe4-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 363b3a645a1e30011cc8da624f13dac5fd915628)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/60cfe4571b04ef4ca2e34793fbad737bb43dc0c6
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review SeongJae-Park/mm-damon-sysfs-fix-pid-leak-under-fvaddr-ops-use-case/20220504-060657
        git checkout 60cfe4571b04ef4ca2e34793fbad737bb43dc0c6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash mm/damon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/damon/sysfs.c:2089:20: error: use of undeclared identifier 'DAMON_OPS_FVADDR'; did you mean 'DAMON_OPS_VADDR'?
                                   ctx->ops.id == DAMON_OPS_FVADDR)
                                                  ^~~~~~~~~~~~~~~~
                                                  DAMON_OPS_VADDR
   include/linux/damon.h:267:2: note: 'DAMON_OPS_VADDR' declared here
           DAMON_OPS_VADDR,
           ^
   mm/damon/sysfs.c:2206:55: error: use of undeclared identifier 'DAMON_OPS_FVADDR'; did you mean 'DAMON_OPS_VADDR'?
           if (ctx->ops.id != DAMON_OPS_VADDR && ctx->ops.id != DAMON_OPS_FVADDR)
                                                                ^~~~~~~~~~~~~~~~
                                                                DAMON_OPS_VADDR
   include/linux/damon.h:267:2: note: 'DAMON_OPS_VADDR' declared here
           DAMON_OPS_VADDR,
           ^
   2 errors generated.


vim +2089 mm/damon/sysfs.c

  2082	
  2083	static void damon_sysfs_destroy_targets(struct damon_ctx *ctx)
  2084	{
  2085		struct damon_target *t, *next;
  2086	
  2087		damon_for_each_target_safe(t, next, ctx) {
  2088			if (ctx->ops.id == DAMON_OPS_VADDR ||
> 2089					ctx->ops.id == DAMON_OPS_FVADDR)
  2090				put_pid(t->pid);
  2091			damon_destroy_target(t);
  2092		}
  2093	}
  2094	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
