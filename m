Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492D374C14;
	Mon,  9 Jun 2025 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749492472; cv=none; b=lhVq+TTssX86wx0a+pP6o59vbfcJphHZR8Bju/9r+jPnGlJN/0KP/Mxsxs2LKu16tYOxiuG56dJzGc6qUYNtdjzyVVjSaL8T0Ma6k3lSP9mYNcMr2mpk/ZiFGrPR8xOlfI9f2O/yVuXkRxDNLWEqOIMa4JisVzUJ2l1ONqCNNyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749492472; c=relaxed/simple;
	bh=lrX1ZS3bclRt+52xKDVpAADZTGgxw5veRGDe1d814SI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gI3sxubMD/DRYnZENXDuw4tXYMpZCLRSWtPR96Rb8v8utVSmxYBvqD5OX3uobW+0qI03CLVztVg5QEc/Q0hH7dMvwxQDS8bgbM7ksZjuuEn9A9dPT3kF6USGdw/gTwplKE+2bi/OMBvNOwzVYn0wbt4r8SsA0ymwFbrSsrzlPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YUoSmjMJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUoSmjMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749492469; x=1781028469;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lrX1ZS3bclRt+52xKDVpAADZTGgxw5veRGDe1d814SI=;
  b=YUoSmjMJNe1vgG2CAdzXI64ysoi9ZllwDXqoqycNumIrL/heisARiXvt
   /FjAr/9AQZ0BLZVq6QnC0GCsvEeaURF0qmyMZAVAZzVUD85zy9iNszeCD
   1F+AgZ6CZGef2/5aw/wKBByerBVHpnMrxbJBZUL3WdEEtZoLOfXx4fyoL
   sP2ueRIhOFFoUxrjtcGj5EF/zfcIMlNunjdabnwdoLu3IxuuXyr544007
   5s1snT43ZHOYNfycfN27ThKYTdX/Jm2T0legosLxguygRrqwb/KRTM0ws
   0Ho3/puLFoVotndVxxqeBNI1UGlx2z8eW8H1rvM774jt9NfOOB3LhbrDW
   w==;
X-CSE-ConnectionGUID: q/a46GxTSjOcuRdwficY7w==
X-CSE-MsgGUID: qtVSyJFDQ6mnbUA4KVosHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55245990"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="55245990"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 11:07:49 -0700
X-CSE-ConnectionGUID: On1ghELASXW357b67SFRIA==
X-CSE-MsgGUID: JlpY7uM9QRm4997aP31JZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="147104170"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jun 2025 11:07:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOguO-0007Iz-2n;
	Mon, 09 Jun 2025 18:07:44 +0000
Date: Tue, 10 Jun 2025 02:06:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Bloch <mbloch@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>, Shay Drory <shayd@nvidia.com>
Subject: [leon-rdma:rdma-next 37/39] drivers/infiniband/sw/rdmavt/vt.c:52:42:
 error: too few arguments to function call, expected 2, have 1
Message-ID: <202506100225.o2xwrZp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   a2207f7d3f7f7b0e4c038ce4b8081f68e76150eb
commit: aac0322485f6d6e2cab122056825450099f62048 [37/39] RDMA/core: Extend RDMA device registration to be net namespace aware
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250610/202506100225.o2xwrZp5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100225.o2xwrZp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100225.o2xwrZp5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/sw/rdmavt/vt.c:52:42: error: too few arguments to function call, expected 2, have 1
      52 |         rdi = container_of(_ib_alloc_device(size), struct rvt_dev_info, ibdev);
         |                            ~~~~~~~~~~~~~~~~     ^
   include/linux/container_of.h:19:26: note: expanded from macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/rdma/ib_verbs.h:2917:19: note: '_ib_alloc_device' declared here
    2917 | struct ib_device *_ib_alloc_device(size_t size, struct net *net);
         |                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/sw/rdmavt/vt.c:52:42: error: too few arguments to function call, expected 2, have 1
      52 |         rdi = container_of(_ib_alloc_device(size), struct rvt_dev_info, ibdev);
         |                            ~~~~~~~~~~~~~~~~     ^
   include/linux/container_of.h:20:30: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                     ^~~
   include/linux/compiler_types.h:503:63: note: expanded from macro '__same_type'
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/rdma/ib_verbs.h:2917:19: note: '_ib_alloc_device' declared here
    2917 | struct ib_device *_ib_alloc_device(size_t size, struct net *net);
         |                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/infiniband/sw/rdmavt/vt.c:52:42: error: too few arguments to function call, expected 2, have 1
      52 |         rdi = container_of(_ib_alloc_device(size), struct rvt_dev_info, ibdev);
         |                            ~~~~~~~~~~~~~~~~     ^
   include/linux/container_of.h:21:23: note: expanded from macro 'container_of'
      21 |                       __same_type(*(ptr), void),                        \
         |                                     ^~~
   include/linux/compiler_types.h:503:63: note: expanded from macro '__same_type'
     503 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/rdma/ib_verbs.h:2917:19: note: '_ib_alloc_device' declared here
    2917 | struct ib_device *_ib_alloc_device(size_t size, struct net *net);
         |                   ^                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +52 drivers/infiniband/sw/rdmavt/vt.c

0194621b225348 Dennis Dalessandro 2016-01-06  34  
90793f7179478d Dennis Dalessandro 2016-02-14  35  /**
90793f7179478d Dennis Dalessandro 2016-02-14  36   * rvt_alloc_device - allocate rdi
90793f7179478d Dennis Dalessandro 2016-02-14  37   * @size: how big of a structure to allocate
90793f7179478d Dennis Dalessandro 2016-02-14  38   * @nports: number of ports to allocate array slots for
90793f7179478d Dennis Dalessandro 2016-02-14  39   *
90793f7179478d Dennis Dalessandro 2016-02-14  40   * Use IB core device alloc to allocate space for the rdi which is assumed to be
90793f7179478d Dennis Dalessandro 2016-02-14  41   * inside of the ib_device. Any extra space that drivers require should be
90793f7179478d Dennis Dalessandro 2016-02-14  42   * included in size.
90793f7179478d Dennis Dalessandro 2016-02-14  43   *
90793f7179478d Dennis Dalessandro 2016-02-14  44   * We also allocate a port array based on the number of ports.
90793f7179478d Dennis Dalessandro 2016-02-14  45   *
90793f7179478d Dennis Dalessandro 2016-02-14  46   * Return: pointer to allocated rdi
90793f7179478d Dennis Dalessandro 2016-02-14  47   */
ff6acd69518e0a Dennis Dalessandro 2016-01-22  48  struct rvt_dev_info *rvt_alloc_device(size_t size, int nports)
ff6acd69518e0a Dennis Dalessandro 2016-01-22  49  {
042932f7a32741 Colin Ian King     2018-03-01  50  	struct rvt_dev_info *rdi;
ff6acd69518e0a Dennis Dalessandro 2016-01-22  51  
459cc69fa4c17c Leon Romanovsky    2019-01-30 @52  	rdi = container_of(_ib_alloc_device(size), struct rvt_dev_info, ibdev);
ff6acd69518e0a Dennis Dalessandro 2016-01-22  53  	if (!rdi)
ff6acd69518e0a Dennis Dalessandro 2016-01-22  54  		return rdi;
ff6acd69518e0a Dennis Dalessandro 2016-01-22  55  
8e71f694e0c819 Colin Ian King     2020-10-08  56  	rdi->ports = kcalloc(nports, sizeof(*rdi->ports), GFP_KERNEL);
ff6acd69518e0a Dennis Dalessandro 2016-01-22  57  	if (!rdi->ports)
ff6acd69518e0a Dennis Dalessandro 2016-01-22  58  		ib_dealloc_device(&rdi->ibdev);
ff6acd69518e0a Dennis Dalessandro 2016-01-22  59  
ff6acd69518e0a Dennis Dalessandro 2016-01-22  60  	return rdi;
ff6acd69518e0a Dennis Dalessandro 2016-01-22  61  }
ff6acd69518e0a Dennis Dalessandro 2016-01-22  62  EXPORT_SYMBOL(rvt_alloc_device);
ff6acd69518e0a Dennis Dalessandro 2016-01-22  63  

:::::: The code at line 52 was first introduced by commit
:::::: 459cc69fa4c17caf21de596693d8a07170820a58 RDMA: Provide safe ib_alloc_device() function

:::::: TO: Leon Romanovsky <leonro@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
