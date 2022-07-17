Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC3F65C
	for <llvm@lists.linux.dev>; Sun, 17 Jul 2022 06:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658037798; x=1689573798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXPJT8QLSPWbn/o/EGL9pG1JDGr7yEgqHGS5B5Myonw=;
  b=RUu0o8hkxwVsCcdzUw28+c1SvvcwzhTMd3PRVaL7GDh0Wqz25owfX/ZC
   nXh6a8WalV9hg62PD/10QVpBHIEFPQQaUTMRH8FEngTeemN4ucv4dNQUL
   SyVR4h0gkrE8uhpj7R5lDPOzaDe7lRwAI/igtfTUkXhYjyTefwtY+hFyl
   4naFAmN65Suw+WQaeroOhYzEY16YEoyc+1FqbdX7vdsIAOgA37X/K+yWt
   lE2DNFdsT/YXALVYjX+B5KJ+kNaVLc+ghg+QFsGuxEGRHIRsKQa96qiiC
   6ZHhiNgwDfPETVkF0cpOY7MJHxufaQlRd5LShtt9cDfkYFKAJDr52Yebv
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10410"; a="286768188"
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="286768188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2022 23:03:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,278,1650956400"; 
   d="scan'208";a="629554328"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Jul 2022 23:03:16 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oCxN5-0002pG-Db;
	Sun, 17 Jul 2022 06:03:15 +0000
Date: Sun, 17 Jul 2022 14:02:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andra Paraschiv <andraprs@amazon.com>
Subject: [linux-next:master 9226/10906] ld.lld: error: undefined symbol:
 kunit_kmalloc_array
Message-ID: <202207171447.MI0Zed7N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
commit: fe5be808fa6c8df5cf939ec622514f970573bc88 [9226/10906] nitro_enclaves: test: Use kunit_test_suite() macro
config: arm64-randconfig-r026-20220715 (https://download.01.org/0day-ci/archive/20220717/202207171447.MI0Zed7N-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 2da550140aa98cf6a3e96417c87f1e89e3a26047)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fe5be808fa6c8df5cf939ec622514f970573bc88
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fe5be808fa6c8df5cf939ec622514f970573bc88
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: kunit_kmalloc_array
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: kunit_binary_assert_format
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
   >>> referenced 5 more times
--
>> ld.lld: error: undefined symbol: kunit_do_failed_assertion
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: kunit_kfree
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(ne_misc_dev_test_merge_phys_contig_memory_regions) in archive drivers/built-in.a
--
>> ld.lld: error: undefined symbol: kunit_unary_assert_format
   >>> referenced by ne_misc_dev.c
   >>> virt/nitro_enclaves/ne_misc_dev.o:(.rodata+0x258) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
