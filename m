Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ED2E4DB;
	Thu,  6 Apr 2023 23:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680823225; x=1712359225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ko2OVf78KqObKnfqrXIM8oPsESRl02m6e+0uzyIm0zk=;
  b=ICC3tPCBu0u2hj9+htHfZbw+/vnrgPKgykAhJt57IjwyVYC9ZD/89g4+
   2VcqRlRfqIGuGR7w1hjN6V4d0FRM8K+WQUQW42mR4aCQFO2qIeGxypGYe
   CvJAi/0JdNZoHl82TydDQMKBITEz32O060a73a966gjUOlS5ZJ1Tln6Al
   pX6yfteHMXeF8A7zY9F4GVHr+fk5GmlYCaSFVJMQeGK43+iLht64r3JvR
   H2oChf3rDvgqPFU1zpt+R9JYRvUSRONqEla9PwnoLFz9jAHl/nPQeMT7q
   kYR9UxruuxXMptKYs836Bt2mWUf0DpmxlZp9ivhnD+P/wPhX8NjJH9J3O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="345511153"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="345511153"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 16:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="751823807"
X-IronPort-AV: E=Sophos;i="5.98,324,1673942400"; 
   d="scan'208";a="751823807"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 06 Apr 2023 16:20:23 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkYtt-000Rtq-11;
	Thu, 06 Apr 2023 23:20:17 +0000
Date: Fri, 7 Apr 2023 07:19:32 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>
Subject: [intel-tdx:kvm-upstream-workaround 1/335] <stdin>:1565:2: warning:
 syscall memfd_restricted not implemented
Message-ID: <202304070741.J4ip9UHJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   9b1b005c63f21cbc8dc4f1691b05964c90240385
commit: eda1fd32a67be9ef4d32a4c9928b43db0ef1cde3 [1/335] mm: Introduce memfd_restricted system call to create restricted user memory
config: powerpc-randconfig-r001-20230403 (https://download.01.org/0day-ci/archive/20230407/202304070741.J4ip9UHJ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel/tdx/commit/eda1fd32a67be9ef4d32a4c9928b43db0ef1cde3
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout eda1fd32a67be9ef4d32a4c9928b43db0ef1cde3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304070741.J4ip9UHJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> <stdin>:1565:2: warning: syscall memfd_restricted not implemented [-W#warnings]
   #warning syscall memfd_restricted not implemented
    ^
   1 warning generated.
--
>> <stdin>:1565:2: warning: syscall memfd_restricted not implemented [-W#warnings]
   #warning syscall memfd_restricted not implemented
    ^
   1 warning generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
