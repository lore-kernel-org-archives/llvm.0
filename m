Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162D011CB7;
	Tue, 15 Aug 2023 15:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692114520; x=1723650520;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sMqwy9G/HltimeX87tKOTEF4evIeRyeOvFxxudBhWG4=;
  b=he8qZmmCqlo+NhkBhy+7c94nsTELAli6C58aaiYiHLMPxrXZ5DXB02sL
   eS+t0x+o9do9VAXWQaL8LZb8c48xgNkMEuzBDPwOvTTgFXZsQKItWSYaC
   ajK7VJhjlWnRX8GB/EBAucCkvL2Rc0NJsGZRGis0MK7mR1EzWP2Gw2Cjg
   J3hGCmBA79NrVXkJ6vghShGwTwaRfo/7Us2OvExUi/19hjiIvUzAzdkIf
   YIDG/5urrsiL4zYEXJ8mZPfmqI6+hW//dlON2BH9cwt5B2yHFDTYkGNHy
   3ExvOiwHSTRqdruu27saAwc61CZ80jy6ey/r4jhmfv+GqNWxoXdNmuN2q
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="351898534"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="351898534"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2023 08:48:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="727408114"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; 
   d="scan'208";a="727408114"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 15 Aug 2023 08:48:35 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVwHX-00013b-1q;
	Tue, 15 Aug 2023 15:48:32 +0000
Date: Tue, 15 Aug 2023 23:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jinjiang Tu <tujinjiang@huawei.com>, linux-mm@kvack.org,
	akpm@linux-foundation.org, wangkefeng.wang@huawei.com,
	sunnanyong@huawei.com, liushixin2@huawei.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	tujinjiang@huawei.com
Subject: Re: [PATCH 2/6] mm/page_owner: show modules allocating pages when
 oom occurred
Message-ID: <202308152353.TqoJfjIk-lkp@intel.com>
References: <20230815125251.2865852-3-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815125251.2865852-3-tujinjiang@huawei.com>

Hi Jinjiang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on mcgrof/modules-next linus/master v6.5-rc6 next-20230815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjiang-Tu/mm-page_owner-support-identifying-pages-allocated-by-modules/20230815-195940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230815125251.2865852-3-tujinjiang%40huawei.com
patch subject: [PATCH 2/6] mm/page_owner: show modules allocating pages when oom occurred
config: x86_64-randconfig-x073-20230815 (https://download.01.org/0day-ci/archive/20230815/202308152353.TqoJfjIk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308152353.TqoJfjIk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308152353.TqoJfjIk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/page_owner.c:34:6: warning: no previous prototype for function 'po_register_oom_notifier' [-Wmissing-prototypes]
   void po_register_oom_notifier(void)
        ^
   kernel/module/page_owner.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void po_register_oom_notifier(void)
   ^
   static 
   1 warning generated.


vim +/po_register_oom_notifier +34 kernel/module/page_owner.c

    33	
  > 34	void po_register_oom_notifier(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
