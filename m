Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D1A8B38
	for <llvm@lists.linux.dev>; Fri, 23 Sep 2022 05:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663912477; x=1695448477;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=os529bABlBN1DPv4hdu+aGyIl/MufDs/f+1+kdb4zOE=;
  b=KmCjFPqg82TukYgd8xfLVMOr4EECO/HSyUJsIHpTMIbfoEvj5p2bCCJ8
   AzDY1ZkV+POmUCysCHl55udYw+AubDFuORaQxkNTdATrQBPykKLWu7DfV
   nsk3dJqxJEbn9GIhuVauTy9tSJ/l8K7a46taVlFnRjqgwtmNN2eQ45bD/
   1XsaWaM3g431DoiESHQA5LYurYq0vX5OW5VytJQBKdObh0qnCGjJGpDXM
   ujzcdYKr88TeFv1OxUXi6qj+8HKmRib+wr7D9TbJYAjDULSR5rLcWirr0
   XLUSrNdkSttz6IL3PKOB+1b/Vrd41tWnyoLfFZhp5aB6xK1DEJPVkZ4Uf
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="298117581"
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="298117581"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 22:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,337,1654585200"; 
   d="scan'208";a="597753257"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Sep 2022 22:54:35 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1obbdy-0005MW-2V;
	Fri, 23 Sep 2022 05:54:34 +0000
Date: Fri, 23 Sep 2022 13:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] PM: clk: Avoid lockdep warning between prepare lock
 and &psd->lock
Message-ID: <202209231304.p14ZsMhw-lkp@intel.com>
References: <20220922084941.RFC.1.I206ec946a190e3de9fd13be806498821e9a6612d@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922084941.RFC.1.I206ec946a190e3de9fd13be806498821e9a6612d@changeid>

Hi Douglas,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on clk/clk-next pavel-leds/for-next linus/master v6.0-rc6 next-20220921]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Douglas-Anderson/PM-clk-Avoid-lockdep-warning-between-prepare-lock-and-psd-lock/20220922-235116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
config: hexagon-randconfig-r045-20220922 (https://download.01.org/0day-ci/archive/20220923/202209231304.p14ZsMhw-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ca0a9a41d27b3cabb3a7f6f4300011844aea2a68
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Douglas-Anderson/PM-clk-Avoid-lockdep-warning-between-prepare-lock-and-psd-lock/20220922-235116
        git checkout ca0a9a41d27b3cabb3a7f6f4300011844aea2a68
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/clk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/clk/clk.c:153:6: warning: no previous prototype for function '__clk_prepare_lock' [-Wmissing-prototypes]
   void __clk_prepare_lock(void)
        ^
   drivers/clk/clk.c:153:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __clk_prepare_lock(void)
   ^
   static 
>> drivers/clk/clk.c:159:6: warning: no previous prototype for function '__clk_prepare_unlock' [-Wmissing-prototypes]
   void __clk_prepare_unlock(void)
        ^
   drivers/clk/clk.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __clk_prepare_unlock(void)
   ^
   static 
   2 warnings generated.


vim +/__clk_prepare_lock +153 drivers/clk/clk.c

   151	
   152	/* Non-static wrapper of lock function for drivers/base/power/clock_ops.c */
 > 153	void __clk_prepare_lock(void)
   154	{
   155		clk_prepare_lock();
   156	}
   157	
   158	/* Non-static wrapper of unlock function for drivers/base/power/clock_ops.c */
 > 159	void __clk_prepare_unlock(void)
   160	{
   161		clk_prepare_unlock();
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
