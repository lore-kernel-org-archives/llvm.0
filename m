Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3D4C951;
	Tue,  4 Apr 2023 18:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680631343; x=1712167343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tg/22cCtXZi7LMFOOorcG1s2zDE8W8Ws9IZHGMkDjBg=;
  b=MwVXeMMEtjYdAlD6EezYTdFQK75UBVAOAEBJ6v8M42oxXWEBvlYovfde
   sxj6LdLl7Gn3v2368zQTdq+vVkQ+KiFvYOvAMK+NIgP2gj9W/MEzCx114
   AJ7chJuCsAiHyN7qN3KuKX6gmCSBOMF5DRook42T5p+VhrHcDc1lDosTT
   JQRs497g2jIy/YtGffCo031TsSq0eqAgIew/8k7BINJEIWz7ATL+MsmWs
   IXqmV+FDiqBpkMbiFlOHjaCXdofq/BiI4f9/n90dYf1N5C5w3BbTgp6Gq
   XO4p8qMQhydgDgRiAqwk+T061bYSE/5jwigu/RT7f2PIDWcwbxF4i45ZB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="428547949"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="428547949"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2023 11:01:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="636617349"
X-IronPort-AV: E=Sophos;i="5.98,318,1673942400"; 
   d="scan'208";a="636617349"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 04 Apr 2023 11:01:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjkyQ-000Py4-27;
	Tue, 04 Apr 2023 18:01:38 +0000
Date: Wed, 5 Apr 2023 02:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-rpc-with-tls-upcall 3/19] ERROR: modpost:
 "handshake_req_hash_lookup" [net/handshake/kunit-test.ko] undefined!
Message-ID: <202304050102.Ux7TQge0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-rpc-with-tls-upcall
head:   6de0228981b3b408d3e4a3c69a3afa65b2c86112
commit: 99109f219c5fa71dab2d5412d78d90487ffbcdeb [3/19] net/handshake: Add Kunit tests for the handshake consumer API
config: x86_64-randconfig-a004-20230403 (https://download.01.org/0day-ci/archive/20230405/202304050102.Ux7TQge0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=99109f219c5fa71dab2d5412d78d90487ffbcdeb
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-rpc-with-tls-upcall
        git checkout 99109f219c5fa71dab2d5412d78d90487ffbcdeb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304050102.Ux7TQge0-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: vmlinux.o: section mismatch in reference: handshake_exit (section: .exit.text) -> handshake_genl_net_ops (section: .init.data)
>> ERROR: modpost: "handshake_req_hash_lookup" [net/handshake/kunit-test.ko] undefined!
>> ERROR: modpost: "handshake_pernet" [net/handshake/kunit-test.ko] undefined!
>> ERROR: modpost: "handshake_req_next" [net/handshake/kunit-test.ko] undefined!
>> ERROR: modpost: "handshake_complete" [net/handshake/kunit-test.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
