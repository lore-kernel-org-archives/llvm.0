Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2236F656;
	Thu, 17 Aug 2023 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692248662; x=1723784662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5dhWl5qXCUgw8JIFcszIgg9/xA0Rh8V8APygb2G7YLU=;
  b=GIUmEvaFwZFaQn9e7NSG+08KwW65SJQHrnuxsKLVNmsv/udI1XoKrdPD
   a+FCCV5WY8fVbqDHZxJrBxOfn+FsLhIsyay7A8uWUYbcHZLxIXCN9+q95
   akYR+vdUOGNwlQyPps2Lzw8vzw0MlAxLbksbLRw/SW9z386hCaUF5BqK9
   nHVDwtwf+ECsw2q4ToNpIcBKiJO/ViaNgd5cVyqw5Sucqi+NFAdeJDGH5
   cCQPvytASo1iVHlk90mNi+QZBVaNYjNIkzvo/XC3AftaYYssDB9K5fCVH
   aCCb2U4QwnlpeXIE4K+pJRix5HB0BShbsNEfl7aOQrpHY912uHtTSUaGo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375478314"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="375478314"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 22:04:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848747891"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; 
   d="scan'208";a="848747891"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2023 22:04:17 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWVBB-0000o9-0H;
	Thu, 17 Aug 2023 05:04:17 +0000
Date: Thu, 17 Aug 2023 13:03:20 +0800
From: kernel test robot <lkp@intel.com>
To: "GONG, Ruiqi" <gongruiqi1@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Florian Westphal <fw@strlen.de>, Kees Cook <keescook@chromium.org>
Subject: [netfilter-nf-next:testing 2/9]
 ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field
 'target' with variable sized type 'struct ebt_entry_target' not at the end
 of a struct or class is a GNU extension
Message-ID: <202308171249.g1ywxhII-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git testing
head:   015e2d9101d3713c7bee16dccad171df04a3bbd5
commit: 61b9e6bd48a6317c0a44ee4f3fecdec9de5baa9e [2/9] netfilter: ebtables: replace zero-length array members
config: i386-buildonly-randconfig-r004-20230817 (https://download.01.org/0day-ci/archive/20230817/202308171249.g1ywxhII-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308171249.g1ywxhII-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308171249.g1ywxhII-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field 'target' with variable sized type 'struct ebt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ebt_entry_target target;
                                   ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
