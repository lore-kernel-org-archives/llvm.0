Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1327E1FBE;
	Sat,  6 May 2023 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683361450; x=1714897450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qHtoQ8f88xfiDScpCeePJyKEYCE+foPeXQGNZedey7M=;
  b=H5uQlhIqLt9wcgs8MVeT60H6TGuRPGiUPmX4MDm3Hv6aHTCTxV9CWzNb
   gxuHy769McQhNVOY8ghCFkM0x/NyaOUZp+8LsVOsV8NBi29E4274nqZ3j
   NeP0NNT+w0mfeCq1CuXXzxVQyAUrKI1+OCvOAeaVj80BZjb7YNSP9+6EF
   rHqd+MKTVYW8+KClrggbnUv34Ufai5InHQj4B2ZDRAeIpZZPX1+EIQsmn
   S6pTtCV5fqMSgu9C3xUD4vHSklyI6zAl7NcSCWlGu9/UemU73Iv3JI4ya
   eh29bDwC+mliCZR2zVSG/9rtOGHyKI/1zMamX2g8huCHNcc3KH89ZhBUJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="435679908"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="435679908"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 01:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="700774937"
X-IronPort-AV: E=Sophos;i="5.99,254,1677571200"; 
   d="scan'208";a="700774937"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 May 2023 01:24:06 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvDD3-00003N-1c;
	Sat, 06 May 2023 08:24:05 +0000
Date: Sat, 6 May 2023 16:24:00 +0800
From: kernel test robot <lkp@intel.com>
To: Cathy Zhang <cathy.zhang@intel.com>, edumazet@google.com,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	jesse.brandeburg@intel.com, suresh.srinivas@intel.com,
	tim.c.chen@intel.com, lizhen.you@intel.com, cathy.zhang@intel.com,
	eric.dumazet@gmail.com, netdev@vger.kernel.org
Subject: Re: [PATCH 2/2] net: Add sysctl_reclaim_threshold
Message-ID: <202305061623.xkekJbaH-lkp@intel.com>
References: <20230506042958.15051-3-cathy.zhang@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230506042958.15051-3-cathy.zhang@intel.com>

Hi Cathy,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]
[also build test ERROR on net/main horms-ipvs/master linus/master v6.3 next-20230505]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cathy-Zhang/net-Keep-sk-sk_forward_alloc-as-a-proper-size/20230506-123121
base:   net-next/main
patch link:    https://lore.kernel.org/r/20230506042958.15051-3-cathy.zhang%40intel.com
patch subject: [PATCH 2/2] net: Add sysctl_reclaim_threshold
config: s390-randconfig-r034-20230504 (https://download.01.org/0day-ci/archive/20230506/202305061623.xkekJbaH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/24beb0b9f6d299a34b853699e5bcaa28a74cad5f
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Cathy-Zhang/net-Keep-sk-sk_forward_alloc-as-a-proper-size/20230506-123121
        git checkout 24beb0b9f6d299a34b853699e5bcaa28a74cad5f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305061623.xkekJbaH-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: __next_mem_range (section: .text) -> memblock (section: .meminit.data)
WARNING: modpost: vmlinux.o: section mismatch in reference: __next_mem_range (section: .text) -> memblock (section: .meminit.data)
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
>> ERROR: modpost: "sysctl_reclaim_threshold" [net/sctp/sctp.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
