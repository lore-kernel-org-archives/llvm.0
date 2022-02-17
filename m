Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A763B4E
	for <llvm@lists.linux.dev>; Thu, 17 Feb 2022 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645082826; x=1676618826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYRBuw5HsK9HF1K5n9Z3Vf4OSxxcpndsyK0hbjom6hM=;
  b=JaYPTLxaMwV+y3Ihpdf1vA/ytrOtuXsHvN43Q6ayCV9pW/8VWlcxC5Og
   AgwHocIXnpGWli0+5BUwUzCBcuYWgMN7DIZ/tIAG4muwKkz40Qaqx7NJI
   Tob2P+fKsigcJ/jNq8QrNr4PRTys7VY3/+M0vS/R6F5Pw7zZrlksHBTnp
   TTI46JQVS6Vc9Aka7OdJRPx3RrwD8TAB02ze9yI+12WwDlJm2eirWElGc
   t5u0v9fPS9jjq1k1X9WekjTmdjoTDwN7Okx89fEtcF/0qCAqssqyXwuW3
   vFns4/6MwYnE0CZ5+eAjcghu6OBO2p+bx7JJ6ODv+Y9I3G6eftRgSQkOc
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="234343874"
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="234343874"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 23:27:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,375,1635231600"; 
   d="scan'208";a="681841992"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 16 Feb 2022 23:27:04 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKbBv-000BZH-E2; Thu, 17 Feb 2022 07:27:03 +0000
Date: Thu, 17 Feb 2022 15:26:31 +0800
From: kernel test robot <lkp@intel.com>
To: yipechai <YiPeng.Chai@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>
Subject: [agd5f:drm-next 17/66]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2416:7: warning: variable 'ras_obj'
 is used uninitialized whenever '||' condition is true
Message-ID: <202202171534.A4Lb31Xv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   5bbebaae14913a4180ff0cc7ddccfa177dba9705
commit: 563285c85ecaa1fcecf304dabf87cbeee1ddbc3f [17/66] drm/amdgpu: Merge amdgpu_ras_late_init/amdgpu_ras_late_fini to amdgpu_ras_block_late_init/amdgpu_ras_block_late_fini
config: s390-randconfig-r003-20220216 (https://download.01.org/0day-ci/archive/20220217/202202171534.A4Lb31Xv-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0bad7cb56526f2572c74449fcf97c1fcda42b41d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add agd5f https://gitlab.freedesktop.org/agd5f/linux.git
        git fetch --no-tags agd5f drm-next
        git checkout 563285c85ecaa1fcecf304dabf87cbeee1ddbc3f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:32:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2416:7: warning: variable 'ras_obj' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
                   if (adev->in_suspend || amdgpu_in_reset(adev)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2453:6: note: uninitialized use occurs here
           if (ras_obj->ras_cb)
               ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2416:3: note: remove the 'if' if its condition is always false
                   if (adev->in_suspend || amdgpu_in_reset(adev)) {
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2416:7: warning: variable 'ras_obj' is used uninitialized whenever '||' condition is true [-Wsometimes-uninitialized]
                   if (adev->in_suspend || amdgpu_in_reset(adev)) {
                       ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2453:6: note: uninitialized use occurs here
           if (ras_obj->ras_cb)
               ^~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2416:7: note: remove the '||' if its condition is always false
                   if (adev->in_suspend || amdgpu_in_reset(adev)) {
                       ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:2403:41: note: initialize the variable 'ras_obj' to silence this warning
           struct amdgpu_ras_block_object *ras_obj;
                                                  ^
                                                   = NULL
   14 warnings generated.


vim +2416 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c

e43488493cbb46 Tao Zhou      2021-09-17  2398  
b293e891b05701 Hawking Zhang 2019-08-30  2399  /* helper function to handle common stuff in ip late init phase */
563285c85ecaa1 yipechai      2022-02-09  2400  int amdgpu_ras_block_late_init(struct amdgpu_device *adev,
563285c85ecaa1 yipechai      2022-02-09  2401  			 struct ras_common_if *ras_block)
b293e891b05701 Hawking Zhang 2019-08-30  2402  {
563285c85ecaa1 yipechai      2022-02-09  2403  	struct amdgpu_ras_block_object *ras_obj;
05adfd80cc52e0 Luben Tuikov  2021-05-21  2404  	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
05adfd80cc52e0 Luben Tuikov  2021-05-21  2405  	unsigned long ue_count, ce_count;
b293e891b05701 Hawking Zhang 2019-08-30  2406  	int r;
b293e891b05701 Hawking Zhang 2019-08-30  2407  
b293e891b05701 Hawking Zhang 2019-08-30  2408  	/* disable RAS feature per IP block if it is not supported */
b293e891b05701 Hawking Zhang 2019-08-30  2409  	if (!amdgpu_ras_is_supported(adev, ras_block->block)) {
b293e891b05701 Hawking Zhang 2019-08-30  2410  		amdgpu_ras_feature_enable_on_boot(adev, ras_block, 0);
b293e891b05701 Hawking Zhang 2019-08-30  2411  		return 0;
b293e891b05701 Hawking Zhang 2019-08-30  2412  	}
b293e891b05701 Hawking Zhang 2019-08-30  2413  
b293e891b05701 Hawking Zhang 2019-08-30  2414  	r = amdgpu_ras_feature_enable_on_boot(adev, ras_block, 1);
b293e891b05701 Hawking Zhang 2019-08-30  2415  	if (r) {
9080a18fc554ce Candice Li    2021-09-15 @2416  		if (adev->in_suspend || amdgpu_in_reset(adev)) {
b293e891b05701 Hawking Zhang 2019-08-30  2417  			/* in resume phase, if fail to enable ras,
b293e891b05701 Hawking Zhang 2019-08-30  2418  			 * clean up all ras fs nodes, and disable ras */
b293e891b05701 Hawking Zhang 2019-08-30  2419  			goto cleanup;
b293e891b05701 Hawking Zhang 2019-08-30  2420  		} else
b293e891b05701 Hawking Zhang 2019-08-30  2421  			return r;
b293e891b05701 Hawking Zhang 2019-08-30  2422  	}
b293e891b05701 Hawking Zhang 2019-08-30  2423  
134d16d50f0948 John Clements 2021-03-25  2424  	/* check for errors on warm reset edc persisant supported ASIC */
134d16d50f0948 John Clements 2021-03-25  2425  	amdgpu_persistent_edc_harvesting(adev, ras_block);
134d16d50f0948 John Clements 2021-03-25  2426  
b293e891b05701 Hawking Zhang 2019-08-30  2427  	/* in resume phase, no need to create ras fs node */
53b3f8f40e6cff Dennis Li     2020-08-19  2428  	if (adev->in_suspend || amdgpu_in_reset(adev))
b293e891b05701 Hawking Zhang 2019-08-30  2429  		return 0;
b293e891b05701 Hawking Zhang 2019-08-30  2430  
563285c85ecaa1 yipechai      2022-02-09  2431  	ras_obj = container_of(ras_block, struct amdgpu_ras_block_object, ras_comm);
563285c85ecaa1 yipechai      2022-02-09  2432  	if (ras_obj->ras_cb) {
9252d33df597a6 yipechai      2022-02-09  2433  		r = amdgpu_ras_interrupt_add_handler(adev, ras_block);
b293e891b05701 Hawking Zhang 2019-08-30  2434  		if (r)
b293e891b05701 Hawking Zhang 2019-08-30  2435  			goto interrupt;
b293e891b05701 Hawking Zhang 2019-08-30  2436  	}
b293e891b05701 Hawking Zhang 2019-08-30  2437  
9252d33df597a6 yipechai      2022-02-09  2438  	r = amdgpu_ras_sysfs_create(adev, ras_block);
b293e891b05701 Hawking Zhang 2019-08-30  2439  	if (r)
b293e891b05701 Hawking Zhang 2019-08-30  2440  		goto sysfs;
b293e891b05701 Hawking Zhang 2019-08-30  2441  
05adfd80cc52e0 Luben Tuikov  2021-05-21  2442  	/* Those are the cached values at init.
05adfd80cc52e0 Luben Tuikov  2021-05-21  2443  	 */
4d9f771e111ee0 Luben Tuikov  2021-07-02  2444  	if (amdgpu_ras_query_error_count(adev, &ce_count, &ue_count) == 0) {
05adfd80cc52e0 Luben Tuikov  2021-05-21  2445  		atomic_set(&con->ras_ce_count, ce_count);
05adfd80cc52e0 Luben Tuikov  2021-05-21  2446  		atomic_set(&con->ras_ue_count, ue_count);
4d9f771e111ee0 Luben Tuikov  2021-07-02  2447  	}
05adfd80cc52e0 Luben Tuikov  2021-05-21  2448  
b293e891b05701 Hawking Zhang 2019-08-30  2449  	return 0;
b293e891b05701 Hawking Zhang 2019-08-30  2450  cleanup:
b293e891b05701 Hawking Zhang 2019-08-30  2451  	amdgpu_ras_sysfs_remove(adev, ras_block);
b293e891b05701 Hawking Zhang 2019-08-30  2452  sysfs:
563285c85ecaa1 yipechai      2022-02-09  2453  	if (ras_obj->ras_cb)
9252d33df597a6 yipechai      2022-02-09  2454  		amdgpu_ras_interrupt_remove_handler(adev, ras_block);
b293e891b05701 Hawking Zhang 2019-08-30  2455  interrupt:
b293e891b05701 Hawking Zhang 2019-08-30  2456  	amdgpu_ras_feature_enable(adev, ras_block, 0);
b293e891b05701 Hawking Zhang 2019-08-30  2457  	return r;
b293e891b05701 Hawking Zhang 2019-08-30  2458  }
b293e891b05701 Hawking Zhang 2019-08-30  2459  

:::::: The code at line 2416 was first introduced by commit
:::::: 9080a18fc554cea0858fae6692a7003c5f0365fc drm/amdgpu: Remove all code paths under the EAGAIN path in RAS late init

:::::: TO: Candice Li <candice.li@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
