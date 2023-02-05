Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EB82F43;
	Sun,  5 Feb 2023 13:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675603944; x=1707139944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=i8HaGGvuY6H4sopUJT+GVMzHzQckmWd6mcIVw+lCb3c=;
  b=Cpjq3Js5PY4C9N3u7GQjhcfM8xphUEJaQhioHwCdDczz6VJunnq+GDc+
   ubFcdi+qA6/ONKOoC5ZC8yCMdg0N3Dt/Ks89Gx99WGtMa+mOOcsHXT7j8
   EHiZK8M5XO0kud2N/kIyVl68wkV0oAEZuWW1XNCe+oaRXBU4BQxnWtjBn
   nyiEdrKZR41qth+O9k3r5/G737Brd5L/J6A+79FY5Mo0HEwTfGX4oD2Rj
   Zkkz5ylwD7WNmNcxpEnJ8e5BhWQxq5Hv3cwsfiyiDqxE79dBtr7Z3n5dl
   XvI+1/uT7rXxmYf8cPY/qW1phqjbnbByN1e/UGxIuHoQung9rFkEDI6zS
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309380472"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="309380472"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 05:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698598286"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698598286"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 05:32:20 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOf80-00021s-0a;
	Sun, 05 Feb 2023 13:32:20 +0000
Date: Sun, 5 Feb 2023 21:32:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH net-next 06/13] rtnetlink: bridge: mcast: Move MDB
 handlers out of bridge driver
Message-ID: <202302052112.2bMZwXRS-lkp@intel.com>
References: <20230204170801.3897900-7-idosch@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230204170801.3897900-7-idosch@nvidia.com>

Hi Ido,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Ido-Schimmel/bridge-mcast-Use-correct-define-in-MDB-dump/20230205-011545
patch link:    https://lore.kernel.org/r/20230204170801.3897900-7-idosch%40nvidia.com
patch subject: [RFC PATCH net-next 06/13] rtnetlink: bridge: mcast: Move MDB handlers out of bridge driver
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230205/202302052112.2bMZwXRS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dd1f784995f3efdbf26e2b2694a0cd1ca181d35e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Ido-Schimmel/bridge-mcast-Use-correct-define-in-MDB-dump/20230205-011545
        git checkout dd1f784995f3efdbf26e2b2694a0cd1ca181d35e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __compiletime_assert_661 marked "dontcall-error": BUILD_BUG_ON failed: sizeof(*ctx) != sizeof(cb->ctx)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
