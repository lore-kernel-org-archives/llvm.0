Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D42158203;
	Wed, 18 Sep 2024 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726654576; cv=none; b=thapvOOPfk49a5Nl0xDojgNXis8+loSNeL6JYhbk0Fym4r2iIcyHlDxKYfl5gfcrmotg95fxZfivFm6S6G01fiuZM8FmbN/OlnTkzgOb1FPEAxhzIkBl6CuwxdXyMMUUrhKlXYo2xVvaR3gRrN9CXI8EIxWiMAB8cslYBVa6L7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726654576; c=relaxed/simple;
	bh=Zzh21aWTkQrckWR0J3gbD8A+nATbw+RRsVmc4vLITN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jS5Nw15ibV2RWOWgsDJiGLaoXbVdQjtCWrZAo/QDgMVXeLC8veLvik+9IKZibDqSXfYKuql9dmaPRKXyq+ljIPoCZAlR4rtATWEEAvWbKsL7f67cZb3ce0/Rhs3j+2l2v8NGDJLRKkZFZOVRrj8A42Af2QayO981TULW6YpgQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed4ukG1V; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed4ukG1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726654575; x=1758190575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zzh21aWTkQrckWR0J3gbD8A+nATbw+RRsVmc4vLITN4=;
  b=ed4ukG1VgkNlK7ymJEfVP+X5G8Ypb/z6CtsdsRFWsTiF4LJ7VbidG7hQ
   JuWuYWOi2vlf/I0y6ZuHWNWVSW7ljbZuzTcb5iKK7sQX7dyagqaLNWt12
   520yaxB5+g4a3SIblO9n6rFvHIQCwLPyhkZ/2F9d9QoOiBj4B9+/3bEfk
   D3svdGnG5vc3xApmhy1/06UUfnVRvl2tqxDXHm2l8HdXHqPivXPcmHyJ7
   CwsGmR5pgUNauOfwIE000r9/xCwd3vkYGAUtx9mt4948ElN/PdxNKKGuf
   aFI9a8rWStw+T1DXAUGVdQX7irH5/M9c1awDeeTx7MX8Oe87lRTVH/Cgd
   g==;
X-CSE-ConnectionGUID: KrhBI5O5RmahjvdJk+JBTA==
X-CSE-MsgGUID: 8FJz3wIzTa21/a/XRjNo0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="43078999"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="43078999"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 03:16:14 -0700
X-CSE-ConnectionGUID: +4I79fuGR5iDvghu38OMaA==
X-CSE-MsgGUID: UDWLp7YtSGyGTkzIPRbQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; 
   d="scan'208";a="69487212"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Sep 2024 03:16:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqrjG-000CAA-2o;
	Wed, 18 Sep 2024 10:16:10 +0000
Date: Wed, 18 Sep 2024 18:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:net-next-pp-inflight-fix 2/2]
 net/core/page_pool_priv.h:47:1: warning: non-void function does not return a
 value
Message-ID: <202409181807.vDJMIpsz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git net-next-pp-inflight-fix
head:   585c4413fc2f6385d74132e13b42cba3e4123eee
commit: 585c4413fc2f6385d74132e13b42cba3e4123eee [2/2] page_pool: fix IOMMU crash when driver has already unbound
config: i386-defconfig (https://download.01.org/0day-ci/archive/20240918/202409181807.vDJMIpsz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409181807.vDJMIpsz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409181807.vDJMIpsz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/core/netdev_rx_queue.c:7:
>> net/core/page_pool_priv.h:47:1: warning: non-void function does not return a value [-Wreturn-type]
      47 | }
         | ^
   1 warning generated.


vim +47 net/core/page_pool_priv.h

8ab79ed50cf10f Mina Almasry 2024-09-10  37  
0f921404689398 Mina Almasry 2024-09-10  38  #if defined(CONFIG_PAGE_POOL)
585c4413fc2f63 Yunsheng Lin 2024-09-12  39  bool page_pool_set_pp_info(struct page_pool *pool, netmem_ref netmem);
585c4413fc2f63 Yunsheng Lin 2024-09-12  40  void page_pool_clear_pp_info(struct page_pool *pool, netmem_ref netmem);
0f921404689398 Mina Almasry 2024-09-10  41  int page_pool_check_memory_provider(struct net_device *dev,
0f921404689398 Mina Almasry 2024-09-10  42  				    struct netdev_rx_queue *rxq);
0f921404689398 Mina Almasry 2024-09-10  43  #else
585c4413fc2f63 Yunsheng Lin 2024-09-12  44  static inline bool page_pool_set_pp_info(struct page_pool *pool,
0f921404689398 Mina Almasry 2024-09-10  45  					 netmem_ref netmem)
0f921404689398 Mina Almasry 2024-09-10  46  {
0f921404689398 Mina Almasry 2024-09-10 @47  }
585c4413fc2f63 Yunsheng Lin 2024-09-12  48  static inline void page_pool_clear_pp_info(struct page_pool *pool,
585c4413fc2f63 Yunsheng Lin 2024-09-12  49  					   netmem_ref netmem)
0f921404689398 Mina Almasry 2024-09-10  50  {
0f921404689398 Mina Almasry 2024-09-10  51  }
0f921404689398 Mina Almasry 2024-09-10  52  static inline int page_pool_check_memory_provider(struct net_device *dev,
0f921404689398 Mina Almasry 2024-09-10  53  						  struct netdev_rx_queue *rxq)
0f921404689398 Mina Almasry 2024-09-10  54  {
0f921404689398 Mina Almasry 2024-09-10  55  	return 0;
0f921404689398 Mina Almasry 2024-09-10  56  }
0f921404689398 Mina Almasry 2024-09-10  57  #endif
0f921404689398 Mina Almasry 2024-09-10  58  

:::::: The code at line 47 was first introduced by commit
:::::: 0f921404689398943257793f7240db239a23b609 memory-provider: dmabuf devmem memory provider

:::::: TO: Mina Almasry <almasrymina@google.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
