Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06880FBE1;
	Mon,  3 Jul 2023 15:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688396417; x=1719932417;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/SC299MI8hD9SblfQRCs0VfwFMe1NbrckktWFQkiWMQ=;
  b=VOF02uVe5eDsjqGdALOLg/z0ZJsd4qagUWYU+iEOZEbwMTnqOuvmN+qv
   fIiVYs13L8EPIDF57GxAC08uqhcIPQHtKa0UFr3eT5QmmLtbvkLXcflYH
   gAgyf/9CnxdLKjwRgOXp4rQOPEUNlapBNSp1UlEGO9q6SUS04LEvaYp0o
   emJwnAGdbdGhGYCzqLH5Bv5QW8/uFie1oa4z8ZMh7+2e90r1h1S8f8Q37
   hezoYsenl7vY4xmCte8WbTjjSEDibjwCkmVBtikxRLMaBspTwUcI8P7g+
   PvKy+1/xZNdz84qkHRO/O4K6D57XPzouRyLt6iPAef2ZzoFpMAZA8k9PD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343235543"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="343235543"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 08:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="965206484"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="965206484"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Jul 2023 08:00:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGL2C-000HQj-1g;
	Mon, 03 Jul 2023 15:00:12 +0000
Date: Mon, 3 Jul 2023 22:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Mengqi <guomengqi3@huawei.com>, tony@atomide.com,
	haojian.zhuang@linaro.org, linus.walleij@linaro.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	guomengqi3@huawei.com
Subject: Re: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
Message-ID: <202307032226.op2VP7X5-lkp@intel.com>
References: <20230703081716.15810-1-guomengqi3@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703081716.15810-1-guomengqi3@huawei.com>

Hi Guo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Mengqi/pinctrl-single-Fix-memleak-in-pcs_dt_node_to_map/20230703-162502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230703081716.15810-1-guomengqi3%40huawei.com
patch subject: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
config: i386-randconfig-i011-20230703 (https://download.01.org/0day-ci/archive/20230703/202307032226.op2VP7X5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307032226.op2VP7X5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307032226.op2VP7X5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pinmux_func_name_to_selector" [drivers/pinctrl/pinctrl-single.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
