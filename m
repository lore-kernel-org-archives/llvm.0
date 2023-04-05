Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A831E7FC;
	Wed,  5 Apr 2023 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680682869; x=1712218869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V92pNr3Kx0TvyE1KK/dNKvtNO9YsicCIPZ9uU89MXRE=;
  b=j984ka/urjj6d/n/xFae9QvmLnAa9hX1aIINspHIUR0cw8GZYz+DeWV7
   OmqHz9yZUc1Ig/6XSKEiLQ3F8U4vQXj2TWZeE3DWivcIUDV9FUEenHCdN
   5A3Z2hchz/VmcVjh2EMKrNpC/UCneR8xNw7IrL7Z0167Kd4NZJ1mH8BxB
   us1wFXMbD9+1YlXFrCdL2NNc3kjtD5owiH3bLZb9dRxF0fqQbaXbbgU88
   uYyvscHxPI2t3I+wxljPCfonbZxa2LVEXY2B3cGfXRMm1hmbfX3Gb9LgV
   M+ge90ujXmOxsfTd0CLYSppUDoZR4MSZEZztMqqVySyFifqM2m5nmUWQa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428682974"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="428682974"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 01:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="830280170"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="830280170"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2023 01:21:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjyO8-000QPm-1i;
	Wed, 05 Apr 2023 08:21:04 +0000
Date: Wed, 5 Apr 2023 16:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/fsfa3 22/22]
 ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field
 'target' with variable sized type 'struct ebt_entry_target' not at the end
 of a struct or class is a GNU extension
Message-ID: <202304051623.Cvewnzo2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/fsfa3
head:   91ba9bf02e0d11bbe0b6fe49f40fb90818f2a06d
commit: 91ba9bf02e0d11bbe0b6fe49f40fb90818f2a06d [22/22] uapi: netfilter: ebtables: Replace zero-length array with flexible-array  member
config: x86_64-randconfig-a001-20230403 (https://download.01.org/0day-ci/archive/20230405/202304051623.Cvewnzo2-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git/commit/?id=91ba9bf02e0d11bbe0b6fe49f40fb90818f2a06d
        git remote add gustavoars https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git
        git fetch --no-tags gustavoars testing/fsfa3
        git checkout 91ba9bf02e0d11bbe0b6fe49f40fb90818f2a06d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304051623.Cvewnzo2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/netfilter_bridge/ebtables.h:163:26: warning: field 'target' with variable sized type 'struct ebt_entry_target' not at the end of a struct or class is a GNU extension [-Wgnu-variable-sized-type-not-at-end]
           struct ebt_entry_target target;
                                   ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
