Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D49BA31;
	Mon, 13 Feb 2023 23:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676332002; x=1707868002;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F0qj7f1msyi5nKRrJ/BDVZVo6JFDn7sVzbSyd0NsjAs=;
  b=leNzUiN6VZZ3kVEtbwmL6zZCE8zGK82KHlpLAB9nLRda/b9oFPDoSawG
   BpYYcLHmfgk2eJt66BO+MryY6LKAKS6hWmcF6RcKaBSNz9MBd6zlViGhE
   RR0kSry/I7XOnCiTekNGPec097lTlks2HHAWc5H1qgxkUecaZVEcaQxDa
   RK40leL5+UXLHtWWRQTebG2SNuB0LfLJJhSTIwvRUYmps+js2IMLeVpRz
   o8z85ERICxV+5u0i0YJciqNkMKapIvh2NB7DhNABAFfhYS1gxRjggbDvZ
   3kMWgVtugN9PkkjgmLrgmdOoWPPYjSQt1poWjWJL7Ab7wY8UjnUVuBAEO
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="311389563"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="311389563"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 15:46:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701455986"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="701455986"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 15:46:39 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRiWs-00084n-2N;
	Mon, 13 Feb 2023 23:46:38 +0000
Date: Tue, 14 Feb 2023 07:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.4.y 3529/7282] ld.lld: error: net/nfc/af_nfc.o:
 contains a compressed section, but zlib is not available
Message-ID: <202302140737.cfJ9BKI5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Duoming,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   59342376e8f0c704299dc7a2c14fed07ffb962e2
commit: 85aecdef77f9c5b5c0d8988db6681960f0d46ab3 [3529/7282] nfc: replace improper check device_is_registered() in netlink related functions
config: x86_64-randconfig-a003-20230213 (https://download.01.org/0day-ci/archive/20230214/202302140737.cfJ9BKI5-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=85aecdef77f9c5b5c0d8988db6681960f0d46ab3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 85aecdef77f9c5b5c0d8988db6681960f0d46ab3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140737.cfJ9BKI5-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
>> ld.lld: error: net/nfc/af_nfc.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
