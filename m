Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488617E8;
	Sat, 25 Feb 2023 05:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677304221; x=1708840221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q7tBLccX+qQK4jHB0qPhIT8yYC8hwIOrbRW7IZTRBY4=;
  b=dySOvzyb975JU76vZe+9k9NHjar8OtPcySU0hkJbg3UeFra+w+M1fA5M
   7R6PHLiGg7YmGEcyzwtHKTbLVMcURrB4Pjkx/YuENIbSKXc3jDp2XQ+kz
   fr5Oyxd53O/DLtRsAFOjU1pgsC0FgjqPZJyZKqnKeRduscCW/NRQ9Jme8
   71OHkOVKkK9l5u3CYrroBf15Oq6n3Pd8YgWIwHMkYk6rBY21UrGr3bJcY
   G2lr9qHcHSpkU9hzF2FdDpX7j1kNStM5rpu1HTMKJalFEwajiHPbSwMb6
   ITxO9bWSyYMFOZynq4GKonDoLBPs81BnKoQmMHlyWluvpjNN4pN91TOdE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="361145404"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="361145404"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 21:50:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="762021271"
X-IronPort-AV: E=Sophos;i="5.97,327,1669104000"; 
   d="scan'208";a="762021271"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Feb 2023 21:50:19 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVnRr-0002xv-07;
	Sat, 25 Feb 2023 05:50:19 +0000
Date: Sat, 25 Feb 2023 13:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>
Subject: [intel-tdx:kvm-upstream 68/190] <stdin>:1565:2: warning: syscall
 memfd_restricted not implemented
Message-ID: <202302251316.e0neHQzy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream
head:   6a57a45197c90b4d3fade588d2c49ab13ced5957
commit: b296c9b5826f652e55e263fb4ffa147ae32b07c0 [68/190] mm: Introduce memfd_restricted system call to create restricted user memory
config: arm-randconfig-r036-20230222 (https://download.01.org/0day-ci/archive/20230225/202302251316.e0neHQzy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel/tdx/commit/b296c9b5826f652e55e263fb4ffa147ae32b07c0
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream
        git checkout b296c9b5826f652e55e263fb4ffa147ae32b07c0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302251316.e0neHQzy-lkp@intel.com/

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
