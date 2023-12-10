Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4794A28E3;
	Sun, 10 Dec 2023 17:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GTJKt20A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702229521; x=1733765521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBggNkyXIzDkcXC+MK27g9trZDn0JQmfE2MeFgDNJqs=;
  b=GTJKt20Am0nMfjneSGkvSjjL3gieuXhiSvy8Z2a2Da4EiqCL41K2W9DE
   HcGMs+YrwdPUoCHeREQcZzyL6JYZO7F/B8ARC3K0EeC2VSG7le7Lr8QSB
   QO7WHTfz+tR8E1QEKl9XYKsfcgcEOHcVIJoL7EYdxktjPySHpzhNUnsC8
   ds7YQPvSKHUi4CFykp+xcCx7dhBsZ1DEGvmGTrCcNL1FG1x0A3OpdCazo
   TiK9+KZlirKU8dob9Bq8s9kIAHyOFGezBu+onkzTOUb+VMBFThYanP/Zg
   7SKOoxRFmGKq0DG8h3Hwatl++FHzzskC+bUIJ0OpUeAg2H12e5McxLwKt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1664722"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1664722"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 09:32:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="946017695"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="946017695"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Dec 2023 09:31:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCNem-000H6Q-2A;
	Sun, 10 Dec 2023 17:31:56 +0000
Date: Mon, 11 Dec 2023 01:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx-pp-provider 19/31] io_uring/zc_rx.h:31:2: warning:
 void function 'io_unregister_zc_rx_ifq' should not return a value
Message-ID: <202312110113.8edLMeAh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider
head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
commit: a637a9b59d1de6a86ea926ae416dd7bc1f4b6da1 [19/31] io_uring: add interface queue
config: i386-randconfig-012-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110113.8edLMeAh-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110113.8edLMeAh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110113.8edLMeAh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:98:
>> io_uring/zc_rx.h:31:2: warning: void function 'io_unregister_zc_rx_ifq' should not return a value [-Wreturn-type]
           return -EOPNOTSUPP;
           ^      ~~~~~~~~~~~
   io_uring/io_uring.c:2923:2: error: call to undeclared function 'io_unregister_zc_rx_ifqs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           io_unregister_zc_rx_ifqs(ctx);
           ^
   io_uring/io_uring.c:2923:2: note: did you mean 'io_unregister_zc_rx_ifq'?
   io_uring/zc_rx.h:29:20: note: 'io_unregister_zc_rx_ifq' declared here
   static inline void io_unregister_zc_rx_ifq(struct io_ring_ctx *ctx)
                      ^
   io_uring/io_uring.c:3116:4: error: call to undeclared function 'io_shut_zc_rx_ifqs'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           io_shut_zc_rx_ifqs(ctx);
                           ^
   1 warning and 2 errors generated.
--
   In file included from io_uring/zc_rx.c:12:
>> io_uring/zc_rx.h:31:2: warning: void function 'io_unregister_zc_rx_ifq' should not return a value [-Wreturn-type]
           return -EOPNOTSUPP;
           ^      ~~~~~~~~~~~
>> io_uring/zc_rx.c:14:5: warning: no previous prototype for function 'io_allocate_rbuf_ring' [-Wmissing-prototypes]
   int io_allocate_rbuf_ring(struct io_zc_rx_ifq *ifq,
       ^
   io_uring/zc_rx.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int io_allocate_rbuf_ring(struct io_zc_rx_ifq *ifq,
   ^
   static 
>> io_uring/zc_rx.c:34:6: warning: no previous prototype for function 'io_free_rbuf_ring' [-Wmissing-prototypes]
   void io_free_rbuf_ring(struct io_zc_rx_ifq *ifq)
        ^
   io_uring/zc_rx.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void io_free_rbuf_ring(struct io_zc_rx_ifq *ifq)
   ^
   static 
   io_uring/zc_rx.c:59:5: error: redefinition of 'io_register_zc_rx_ifq'
   int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
       ^
   io_uring/zc_rx.h:24:19: note: previous definition is here
   static inline int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
                     ^
>> io_uring/zc_rx.c:98:6: warning: no previous prototype for function 'io_unregister_zc_rx_ifqs' [-Wmissing-prototypes]
   void io_unregister_zc_rx_ifqs(struct io_ring_ctx *ctx)
        ^
   io_uring/zc_rx.c:98:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void io_unregister_zc_rx_ifqs(struct io_ring_ctx *ctx)
   ^
   static 
>> io_uring/zc_rx.c:111:6: warning: no previous prototype for function 'io_shut_zc_rx_ifqs' [-Wmissing-prototypes]
   void io_shut_zc_rx_ifqs(struct io_ring_ctx *ctx)
        ^
   io_uring/zc_rx.c:111:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void io_shut_zc_rx_ifqs(struct io_ring_ctx *ctx)
   ^
   static 
   5 warnings and 1 error generated.


vim +/io_unregister_zc_rx_ifq +31 io_uring/zc_rx.h

    17	
    18	#if defined(CONFIG_PAGE_POOL)
    19	int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
    20				  struct io_uring_zc_rx_ifq_reg __user *arg);
    21	void io_unregister_zc_rx_ifqs(struct io_ring_ctx *ctx);
    22	void io_shut_zc_rx_ifqs(struct io_ring_ctx *ctx);
    23	#else
    24	static inline int io_register_zc_rx_ifq(struct io_ring_ctx *ctx,
    25				  struct io_uring_zc_rx_ifq_reg __user *arg)
    26	{
    27		return -EOPNOTSUPP;
    28	}
    29	static inline void io_unregister_zc_rx_ifq(struct io_ring_ctx *ctx)
    30	{
  > 31		return -EOPNOTSUPP;
    32	}
    33	#endif
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
