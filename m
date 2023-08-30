Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED051847;
	Wed, 30 Aug 2023 07:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693381276; x=1724917276;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5QX2utJhe//XqFa+InE4SbM4WETASb0Mj1a/b7o6gis=;
  b=g/HkUmRytdD9/JZTy2avFs/XCQk2uB/2R4lSNdw8sTNtuYsPnHr9aavO
   KW5mnClBdTImQ9K1qySs2f+npQ5xoceiKVgimRcO//HrVhcH8Q5zW5m5R
   zrDZX+dfcdb6cylcZrhfIE6po8UdcCnSuyEVrNkK6xd62aY2D4NtZI6eh
   UxID4bvobqs8izXFhNUL0D5oBnFB2q3t3qk3lq27cBdKKutsdoKkH3CQO
   tftw7dyRrabO7Uv+dliEV/+W+8HehJ0BDxDWOIa7eYkjx3ld2KuCTaz2t
   m8FUGLy6f7+fwhoucqLJgCIlVhMbxrLtV56dzNgYkuaAX9w3LLNIGV++z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="374479609"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="374479609"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 00:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="1069745573"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="1069745573"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Aug 2023 00:40:37 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbFoa-0009Zd-0z;
	Wed, 30 Aug 2023 07:40:36 +0000
Date: Wed, 30 Aug 2023 15:40:04 +0800
From: kernel test robot <lkp@intel.com>
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, william.gray@linaro.org,
	lee@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alexandre.torgue@foss.st.com, fabrice.gasnier@foss.st.com,
	linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] counter: stm32-timer-cnt: add support for events
Message-ID: <202308301541.ZqWpJdto-lkp@intel.com>
References: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230829134029.2402868-9-fabrice.gasnier@foss.st.com>

Hi Fabrice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.5 next-20230830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrice-Gasnier/counter-chrdev-fix-getting-array-extensions/20230829-230111
base:   linus/master
patch link:    https://lore.kernel.org/r/20230829134029.2402868-9-fabrice.gasnier%40foss.st.com
patch subject: [PATCH 8/8] counter: stm32-timer-cnt: add support for events
config: arm-randconfig-001-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301541.ZqWpJdto-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301541.ZqWpJdto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301541.ZqWpJdto-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/counter/stm32-timer-cnt.c:528:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^
   drivers/counter/stm32-timer-cnt.c:528:2: note: insert '__attribute__((fallthrough));' to silence this warning
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/counter/stm32-timer-cnt.c:528:2: note: insert 'break;' to avoid fall-through
     528 |         case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
         |         ^
         |         break; 
   1 warning generated.


vim +528 drivers/counter/stm32-timer-cnt.c

   516	
   517	static int stm32_count_watch_validate(struct counter_device *counter,
   518					      const struct counter_watch *watch)
   519	{
   520		struct stm32_timer_cnt *const priv = counter_priv(counter);
   521	
   522		switch (watch->event) {
   523		case COUNTER_EVENT_CAPTURE:
   524			if (watch->channel >= priv->nchannels) {
   525				dev_err(counter->parent, "Invalid channel %d\n", watch->channel);
   526				return -EINVAL;
   527			}
 > 528		case COUNTER_EVENT_OVERFLOW_UNDERFLOW:
   529			return 0;
   530		default:
   531			return -EINVAL;
   532		}
   533	}
   534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
