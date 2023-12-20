Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB873E472;
	Wed, 20 Dec 2023 15:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FA8nQ6WM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703084681; x=1734620681;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dzpREOBb7Pvnz/KFbZkd8vVkuL7+cdny50bZm6z9H2s=;
  b=FA8nQ6WMA7FzbaoSIjZJYwnkH0l+Ywi63ndvgZHd3GG6C4RaOF7Zs4Mz
   gMt7nmgwaLllcSMLnj501jqQVFjtFLTxD4LO+fMIkgreBk3IwYT/YH9un
   0v854fS9ZATq8SE8tQohbS8PeAwwtSJ9GpKeyROS99j+1oSxcydEyjcLn
   44D2wdQHOdI7QgSXxhy7041CckM251OIP/9IOH40XZRESXyT/TPf/o+4y
   k4u4OdzwFpuV4CuWX6c8aMV1XeZA4NlLD3dCfmOyOMIb9jCcg+AZUGPh+
   DjOYUCm0Y1lzvwqAacyrDKzVPV1Lj3IKL09XN8Zl79hvf0U5GLonQmZme
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="394707949"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="394707949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2023 07:04:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="842304259"
X-IronPort-AV: E=Sophos;i="6.04,291,1695711600"; 
   d="scan'208";a="842304259"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 20 Dec 2023 07:04:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFy7i-00072j-04;
	Wed, 20 Dec 2023 15:04:38 +0000
Date: Wed, 20 Dec 2023 23:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Changbin Du <changbin.du@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] modules: wait do_free_init correctly
Message-ID: <202312202248.j8Rg4I1g-lkp@intel.com>
References: <20231219141231.2218215-1-changbin.du@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231219141231.2218215-1-changbin.du@huawei.com>

Hi Changbin,

kernel test robot noticed the following build errors:

[auto build test ERROR on mcgrof/modules-next]
[also build test ERROR on linus/master v6.7-rc6 next-20231220]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Changbin-Du/modules-wait-do_free_init-correctly/20231219-221526
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git modules-next
patch link:    https://lore.kernel.org/r/20231219141231.2218215-1-changbin.du%40huawei.com
patch subject: [PATCH] modules: wait do_free_init correctly
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20231220/202312202248.j8Rg4I1g-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231220/202312202248.j8Rg4I1g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312202248.j8Rg4I1g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: flush_module_init_free_work
   >>> referenced by main.c
   >>>               init/main.o:(kernel_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
