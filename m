Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CAF28DA5;
	Wed, 25 Oct 2023 13:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JRNcTu0W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698241872; x=1729777872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j8cuJ52ozDWtJXOpXOMk2uzxHHZBTh6Dz4DSt+FBXFA=;
  b=JRNcTu0WEbBtjhae8SUDETOqMjbmzGhkxTLg94C+FC3YIy0fA7gvmIjA
   VLvEBh917GdLDYCPYK8uoDekHFLv5kJphr2HTkPYpwlVkXEB4fWfHgDxR
   E0CtfDCO6si2jNlSVRkO5YfPGP7jnbrlRrqSmd1ROJ27tpmtLJtALu1sd
   NLv6oSeB7RnBbgAbGT7QTwdaR6zYbS/LDWmA7JxrkSoEbobexQMhI69qI
   lsyateCxaj7B17r3jGCN5+iX8yMKmjDSjSmgWQb61knj6mHzctxUA+RDm
   BeQae0QhC8l9NIoJhIQg8MlxZUGkQFQ+JPQdYS//CU7i4dSiHkrC9Q1wF
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="387128058"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="387128058"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 06:51:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="849530606"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="849530606"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Oct 2023 06:51:08 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qveHq-0008uz-1a;
	Wed, 25 Oct 2023 13:51:06 +0000
Date: Wed, 25 Oct 2023 21:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	almasrymina@google.com, hawk@kernel.org,
	ilias.apalodimas@linaro.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net-next 13/15] net: page_pool: expose page pool stats
 via netlink
Message-ID: <202310252138.dGM2gwCZ-lkp@intel.com>
References: <20231024160220.3973311-14-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024160220.3973311-14-kuba@kernel.org>

Hi Jakub,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Kicinski/net-page_pool-split-the-page_pool_params-into-fast-and-slow/20231025-023128
base:   net-next/main
patch link:    https://lore.kernel.org/r/20231024160220.3973311-14-kuba%40kernel.org
patch subject: [PATCH net-next 13/15] net: page_pool: expose page pool stats via netlink
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231025/202310252138.dGM2gwCZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310252138.dGM2gwCZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310252138.dGM2gwCZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: init/main.o: warning: relocation in read-only section `.ref.text'
   /usr/bin/ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   /usr/bin/ld: net/core/netdev-genl-gen.o:(.rodata+0xf8): undefined reference to `netdev_nl_page_pool_get_doit'
   /usr/bin/ld: net/core/netdev-genl-gen.o:(.rodata+0x120): undefined reference to `netdev_nl_page_pool_get_dumpit'
>> /usr/bin/ld: net/core/netdev-genl-gen.o:(.rodata+0x148): undefined reference to `netdev_nl_page_pool_stats_get_doit'
>> /usr/bin/ld: net/core/netdev-genl-gen.o:(.rodata+0x170): undefined reference to `netdev_nl_page_pool_stats_get_dumpit'
   /usr/bin/ld: warning: creating DT_TEXTREL in a PIE
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
