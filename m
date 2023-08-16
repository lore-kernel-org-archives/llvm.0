Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE732F23;
	Thu, 17 Aug 2023 00:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692230437; x=1723766437;
  h=date:from:cc:subject:message-id:mime-version;
  bh=/CmL5Dn3yIoMVpVpPjRt3MbixJUqhMvLOAgKHx1krjE=;
  b=PvnbbRo+DssEUKWj0zGvkefnT6r9j9H4znUGqP6NfnutflVvGbpia8ix
   aItN+HOcEc2rUWJoFM8aZthVbsvj14GUFaTdoRyWjfhM7qlI0u9qzHbF6
   GSkeO9aFIyONC1M3I84Z55PZydCFQjGbtNTeAH3NvayEvQLEK+CdakuzD
   9jsg8Y8T/t0ACAoUqMbaRdvZPdBkYhlpI4+Yl331nLb1F3u065uLX/Imo
   0rX7MASnYjaQl85vk0XnJKlyR/qQCjndhI/4i0joP2ei425poNshN81kN
   uV51vRoCFyC6r3NLr3fkduXiNvsJfUxdg+mVbVTl16xUNz89Bi50RzsQD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371570041"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="371570041"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 17:00:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="848679212"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="848679212"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2023 17:00:35 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWQRG-0000f7-10;
	Thu, 17 Aug 2023 00:00:34 +0000
Date: Thu, 17 Aug 2023 07:59:51 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/netfilter/ipvs/ip_vs.o: warning: objtool: .init.text: unexpected
 end of section
Message-ID: <202308170728.054gl33Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4853c74bd7ab7fdb83f319bd9ace8a08c031e9b6
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   3 months ago
config: x86_64-randconfig-r025-20230816 (https://download.01.org/0day-ci/archive/20230817/202308170728.054gl33Z-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170728.054gl33Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170728.054gl33Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs.o: warning: objtool: .init.text: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
