Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033C215491;
	Wed, 25 Oct 2023 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+yrvdlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698231127; x=1729767127;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G8oFL5f5KsRqksPekZ1YDNregib8p4oR2OSee4LCYSY=;
  b=Z+yrvdlQBc0u0/ghI1dfYqGJIYHLDNd85CYTXZ8fLVaYKT1AXlRY15f+
   rE1mvefCfmsy8p6W8nPrtHOeHK74lZon6TsKBtp7PctqSh4VAcAubU8qX
   1vJ5vhxDNTaKW+FnpFxZoq0c9MEk8XKBK6rLf4LnDs+LF92SZ+MgAtDy9
   Cz3fe6xT7d77YNyf2LFrLCgYA9JGRCkXH2Me+n6FCLiVKjD18mcsC6zzz
   x8q2jljF372HiHmvKRS7GvuTxpIdCffP3AQS3N8tdpDrfA03IMEXT9Mrw
   RGbf+D31Uufr8uNP8PufaWeHMnAaoDJj4jXwyep6I8Bpc83KQOIbBNksZ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="37438"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="37438"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 03:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="1005974355"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="1005974355"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Oct 2023 03:52:03 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvbUX-0008pl-0A;
	Wed, 25 Oct 2023 10:52:01 +0000
Date: Wed, 25 Oct 2023 18:51:52 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	almasrymina@google.com, hawk@kernel.org,
	ilias.apalodimas@linaro.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 09/15] net: page_pool: implement GET in the
 netlink API
Message-ID: <202310251843.xbPDgsrV-lkp@intel.com>
References: <20231024160220.3973311-10-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024160220.3973311-10-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-page_pool-split-the-page_pool_params-into-fast-and-slow/20231025-023128
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231024160220.3973311-10-kuba%40kernel.org
patch subject: [PATCH net-next 09/15] net: page_pool: implement GET in the netlink API
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231025/202310251843.xbPDgsrV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251843.xbPDgsrV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251843.xbPDgsrV-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: init/main.o: warning: relocation in read-only section `.ref.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
>> /usr/bin/ld: net/core/netdev-genl-gen.o:(.rodata+0x98): undefined reference to `netdev_nl_page_pool_get_doit'
>> /usr/bin/ld: net/core/netdev-genl-gen.o:(.rodata+0xc0): undefined reference to `netdev_nl_page_pool_get_dumpit'
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
