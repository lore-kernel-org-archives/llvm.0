Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D647B;
	Tue, 25 Apr 2023 04:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682397498; x=1713933498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cidDwuiDbb5qG6rnbV4n4X+1laFfU6ubjZwdeafIlig=;
  b=TTemYq1JSXUwOcYn6jH5x9i5IEwS/M6Q09HSp9NBrXHtg/f2O0MgWqi4
   b7pExWRLZDQIED/oQvYjWpP0wk3MKOgE4q+5hHt8S3CywLiECWVNoSwj1
   1I0NKDQQKT2eWPFCZCie5Wa+wt7oPStucZEJ6xcog1faUUnAJoTBTnfIj
   +qkXQvS4n9noT5QdHUNDE5GbVpLJdOp8m4m6Pxiy1SzrDNh//GGMqwAK3
   RLFuruyTyQQ1/UoE47FYEp4TTmtVemCVkZqLF+IimcfOpxRR/D/6h5eSO
   Hf3LKiAUq9CedQYptsYERN0hA6rZTlNaP4DolmMAVjtObG5Eg5ro8+G2u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="411940259"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="411940259"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2023 21:38:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10690"; a="757958113"
X-IronPort-AV: E=Sophos;i="5.99,224,1677571200"; 
   d="scan'208";a="757958113"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Apr 2023 21:38:16 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prARU-000iyu-05;
	Tue, 25 Apr 2023 04:38:16 +0000
Date: Tue, 25 Apr 2023 12:37:57 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/030-misc 18/23] error[E0405]: cannot find trait
 `Tuple` in module `core::marker`
Message-ID: <202304251216.w6tEaN1b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/030-misc
head:   16a3572beae35a157d394ae3c761feffcc7e55bf
commit: 83bcb09fbbca3c93e3e1200320131f93cc14d23d [18/23] rust: Fixes for 1.67.0
config: x86_64-randconfig-a004-20230424 (https://download.01.org/0day-ci/archive/20230425/202304251216.w6tEaN1b-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/83bcb09fbbca3c93e3e1200320131f93cc14d23d
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux bits/030-misc
        git checkout 83bcb09fbbca3c93e3e1200320131f93cc14d23d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304251216.w6tEaN1b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1872:26
   |
   1872 | impl<Args: core::marker::Tuple, F: FnOnce<Args> + ?Sized, A: Allocator> FnOnce<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1881:26
   |
   1881 | impl<Args: core::marker::Tuple, F: FnMut<Args> + ?Sized, A: Allocator> FnMut<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error[E0405]: cannot find trait `Tuple` in module `core::marker`
   --> rust/alloc/boxed.rs:1888:26
   |
   1888 | impl<Args: core::marker::Tuple, F: Fn<Args> + ?Sized, A: Allocator> Fn<Args> for Box<F, A> {
   |                          ^^^^^ not found in `core::marker`
--
>> error: aborting due to 3 previous errors

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
