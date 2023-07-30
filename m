Received: from mgamail.intel.com (unknown [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE2363;
	Sun, 30 Jul 2023 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690725222; x=1722261222;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a0aijfoBWxtmeKJNmkd2KTpV2MqSuSWja3e1qop/JrA=;
  b=MDIX3+IV0kTyTAi88hibepvQYuJfJTzMU4OPEaUiUMYqtYl6lke/9oJU
   l847xtghqhbbIdEYqFuPL9Xw15kh7yNRL7tzbn9IpvhaCDZPEJZJUL1FY
   FHWUnJNPwEjDWuOhneTJ0NVOeyD1AiJajkSjwsm+n8iROGhfuAD5fdZdX
   cOP3R50wOx0SzUR2gwAVVhksHGdrBUT4drEaUE7Q6gm3OkmEhXPxQwl4/
   ClTdWlE/lsmYSHVEkizGvi2vhLeHSLM+2bdu3uLkyq+QPKDQFZqtmoKZL
   soKgEA0WTW+O+H0iLmSbJrd3ystSTem0ou7SWnGxQkWPpF+Sw6kTnqFPk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="455213832"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="455213832"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 06:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="851754452"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="851754452"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jul 2023 06:53:38 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ6ra-0004bj-37;
	Sun, 30 Jul 2023 13:53:38 +0000
Date: Sun, 30 Jul 2023 21:53:38 +0800
From: kernel test robot <lkp@intel.com>
To: Tomas Winkler <tomas.winkler@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [char-misc:char-misc-testing 5/9] drivers/misc/mei/gsc-me.c:315:58:
 error: expected ';' after top level declarator
Message-ID: <202307302110.ed7OdJyc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   94e4fbf7c8756d824c51c04be3b58588d67411a4
commit: c8de1d2815aa6669b319d2d71401f35b68bb9aa9 [5/9] mei: gsc: add module description
config: x86_64-buildonly-randconfig-r002-20230730 (https://download.01.org/0day-ci/archive/20230730/202307302110.ed7OdJyc-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307302110.ed7OdJyc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307302110.ed7OdJyc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/mei/gsc-me.c:315:58: error: expected ';' after top level declarator
   MODULE_DESCRIPTION("Intel(R) Graphics System Controller")
                                                            ^
                                                            ;
   1 error generated.


vim +315 drivers/misc/mei/gsc-me.c

   311	
   312	MODULE_AUTHOR("Intel Corporation");
   313	MODULE_ALIAS("auxiliary:i915.mei-gsc");
   314	MODULE_ALIAS("auxiliary:i915.mei-gscfi");
 > 315	MODULE_DESCRIPTION("Intel(R) Graphics System Controller")

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
