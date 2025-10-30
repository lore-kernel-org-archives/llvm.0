Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A7832D428;
	Thu, 30 Oct 2025 12:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761826288; cv=none; b=S5j4KvY3EvwyX74LMOqIg2Cn+2qhskwl1ue8GWFumidEkYRYY8hhu3DeSmdiW5uMSRZscY3jiwvRTTxlmPaejOuelULlTRQ5N4ZzstB74KqmcP9yRRu6wLsPzabjZor2xwxtfteQNzvopZAWYiKoVv6h5uLRmBvGzrYjQ8P18/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761826288; c=relaxed/simple;
	bh=Lq26KDx9C94QCr5PyKKitndlRf3b6iaNu8+Ywz4V54U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IvF6GfOn8rI4P/35osLaNeFmR1Q+6WyCoEoGny9yt4ELUYJGMiAWKN9bRaJDoF2VZodzvE+GI6nyyK2SU59YBxrGxLv2SFRYqaUjGMJ3anR5VA/qp2v1tAH7TOyBW8cQFq6weAjvHHyKRLmx/S0PMMqJbIVoKz4ZuBq/9GHCQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eSYaKY6s; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eSYaKY6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761826286; x=1793362286;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Lq26KDx9C94QCr5PyKKitndlRf3b6iaNu8+Ywz4V54U=;
  b=eSYaKY6s2RxWwyiTUpCXTS/A1VOmTXeqbDG5KbSK+pyWy2U9QbeVN2iv
   9DOIjmOyx8Dd4YJ9wt7QUS2JkR6PXfkbKSFPMYRyTN5tPIjG/W6vLXqbH
   1E39jmy5L2+806Zh/10dkuOoLlNffbMwBCOkE/RgWhAv2eoQFP9WaiFg5
   ID/yalmOZ3ISYlP3n6rJdChIdDPyPNA+Eii/Hu3Hi//9DgGHhFGtlqfxE
   Jztl4VjgfMoI3oX9r/OCdl5Q8IJJUZySNioUp6ofu1f1GNMX/QUoAUBhG
   tmo+Zu4f7wliSg4FLZQCTUTreYwSecxLoga2hzpug1U//WHcdHVNC1dJX
   Q==;
X-CSE-ConnectionGUID: XGH8CMlMQnyLyotPK5WZAA==
X-CSE-MsgGUID: yvWLJCFSRam9VxauQTRM+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="67825350"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="67825350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 05:11:25 -0700
X-CSE-ConnectionGUID: 8aRQglDsTuyN2lrGjZHidg==
X-CSE-MsgGUID: ogjMYTrnR6qRV7jh1Ngjvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="190275638"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 30 Oct 2025 05:11:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vERTs-000LxM-0t;
	Thu, 30 Oct 2025 12:10:33 +0000
Date: Thu, 30 Oct 2025 20:09:53 +0800
From: kernel test robot <lkp@intel.com>
To: Stefan Metzmacher <metze@samba.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 091/127] smb: client: make use of smbdirect.ko
Message-ID: <202510301935.G0fFK4yR-lkp@intel.com>
References: <8ae722e2bc80de69e330baa49102011572eb100b.1761742839.git.metze@samba.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ae722e2bc80de69e330baa49102011572eb100b.1761742839.git.metze@samba.org>

Hi Stefan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.18-rc3 next-20251030]
[cannot apply to cifs/for-next brauner-vfs/vfs.all v6.18-rc3 v6.18-rc2 v6.18-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Stefan-Metzmacher/smb-smbdirect-let-smbdirect-h-include-include-linux-types-h/20251030-015100
base:   linus/master
patch link:    https://lore.kernel.org/r/8ae722e2bc80de69e330baa49102011572eb100b.1761742839.git.metze%40samba.org
patch subject: [PATCH v2 091/127] smb: client: make use of smbdirect.ko
config: loongarch-randconfig-001-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301935.G0fFK4yR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510301935.G0fFK4yR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510301935.G0fFK4yR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/smb/common/smbdirect/smbdirect_connection.c:7:
   In file included from fs/smb/common/smbdirect/smbdirect_internal.h:17:
   fs/smb/common/smbdirect/smbdirect_socket.h:191:4: error: unknown type name 'mempool_t'
     191 |                         mempool_t *pool;
         |                         ^
   fs/smb/common/smbdirect/smbdirect_socket.h:246:4: error: unknown type name 'mempool_t'
     246 |                         mempool_t *pool;
         |                         ^
>> fs/smb/common/smbdirect/smbdirect_connection.c:702:25: error: call to undeclared function 'mempool_create_slab_pool'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     702 |         sc->send_io.mem.pool = mempool_create_slab_pool(sp->send_credit_target,
         |                                ^
>> fs/smb/common/smbdirect/smbdirect_connection.c:739:13: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     739 |                 recv_io = mempool_alloc(sc->recv_io.mem.pool,
         |                           ^
>> fs/smb/common/smbdirect/smbdirect_connection.c:761:3: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     761 |                 mempool_free(recv_io, sc->recv_io.mem.pool);
         |                 ^
>> fs/smb/common/smbdirect/smbdirect_connection.c:769:2: error: call to undeclared function 'mempool_destroy'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     769 |         mempool_destroy(sc->recv_io.mem.pool);
         |         ^
   fs/smb/common/smbdirect/smbdirect_connection.c:769:2: note: did you mean 'ib_mr_pool_destroy'?
   include/rdma/mr_pool.h:15:6: note: 'ib_mr_pool_destroy' declared here
      15 | void ib_mr_pool_destroy(struct ib_qp *qp, struct list_head *list);
         |      ^
   fs/smb/common/smbdirect/smbdirect_connection.c:787:8: error: call to undeclared function 'mempool_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     787 |         msg = mempool_alloc(sc->send_io.mem.pool, sc->send_io.mem.gfp_mask);
         |               ^
   fs/smb/common/smbdirect/smbdirect_connection.c:826:2: error: call to undeclared function 'mempool_free'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     826 |         mempool_free(msg, sc->send_io.mem.pool);
         |         ^
   8 errors generated.


vim +/mempool_create_slab_pool +702 fs/smb/common/smbdirect/smbdirect_connection.c

2a871f3e3b060fa Stefan Metzmacher 2025-10-29  675  
bccbc80eff881ac Stefan Metzmacher 2025-10-29  676  __SMBDIRECT_PRIVATE__
bccbc80eff881ac Stefan Metzmacher 2025-10-29  677  int smbdirect_connection_create_mem_pools(struct smbdirect_socket *sc)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  678  {
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  679  	struct smbdirect_socket_parameters *sp = &sc->parameters;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  680  	char name[80];
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  681  	size_t i;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  682  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  683  	/*
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  684  	 * We use sizeof(struct smbdirect_negotiate_resp) for the
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  685  	 * payload size as it is larger as
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  686  	 * sizeof(struct smbdirect_data_transfer).
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  687  	 *
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  688  	 * This will fit client and server usage for now.
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  689  	 */
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  690  	snprintf(name, sizeof(name), "smbdirect_send_io_cache_%p", sc);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  691  	struct kmem_cache_args send_io_args = {
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  692  		.align		= __alignof__(struct smbdirect_send_io),
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  693  	};
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  694  	sc->send_io.mem.cache = kmem_cache_create(name,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  695  						  sizeof(struct smbdirect_send_io) +
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  696  						  sizeof(struct smbdirect_negotiate_resp),
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  697  						  &send_io_args,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  698  						  SLAB_HWCACHE_ALIGN);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  699  	if (!sc->send_io.mem.cache)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  700  		goto err;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  701  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29 @702  	sc->send_io.mem.pool = mempool_create_slab_pool(sp->send_credit_target,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  703  							sc->send_io.mem.cache);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  704  	if (!sc->send_io.mem.pool)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  705  		goto err;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  706  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  707  	/*
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  708  	 * A payload size of sp->max_recv_size should fit
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  709  	 * any message.
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  710  	 *
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  711  	 * For smbdirect_data_transfer messages the whole
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  712  	 * buffer might be exposed to userspace
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  713  	 * (currently on the client side...)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  714  	 * The documentation says data_offset = 0 would be
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  715  	 * strange but valid.
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  716  	 */
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  717  	snprintf(name, sizeof(name), "smbdirect_recv_io_cache_%p", sc);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  718  	struct kmem_cache_args recv_io_args = {
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  719  		.align		= __alignof__(struct smbdirect_recv_io),
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  720  		.useroffset	= sizeof(struct smbdirect_recv_io),
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  721  		.usersize	= sp->max_recv_size,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  722  	};
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  723  	sc->recv_io.mem.cache = kmem_cache_create(name,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  724  						  sizeof(struct smbdirect_recv_io) +
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  725  						  sp->max_recv_size,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  726  						  &recv_io_args,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  727  						  SLAB_HWCACHE_ALIGN);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  728  	if (!sc->recv_io.mem.cache)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  729  		goto err;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  730  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  731  	sc->recv_io.mem.pool = mempool_create_slab_pool(sp->recv_credit_max,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  732  							sc->recv_io.mem.cache);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  733  	if (!sc->recv_io.mem.pool)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  734  		goto err;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  735  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  736  	for (i = 0; i < sp->recv_credit_max; i++) {
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  737  		struct smbdirect_recv_io *recv_io;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  738  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29 @739  		recv_io = mempool_alloc(sc->recv_io.mem.pool,
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  740  					sc->recv_io.mem.gfp_mask);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  741  		if (!recv_io)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  742  			goto err;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  743  		recv_io->socket = sc;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  744  		recv_io->sge.length = 0;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  745  		list_add_tail(&recv_io->list, &sc->recv_io.free.list);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  746  	}
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  747  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  748  	return 0;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  749  err:
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  750  	smbdirect_connection_destroy_mem_pools(sc);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  751  	return -ENOMEM;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  752  }
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  753  
bccbc80eff881ac Stefan Metzmacher 2025-10-29  754  __SMBDIRECT_PRIVATE__
bccbc80eff881ac Stefan Metzmacher 2025-10-29  755  void smbdirect_connection_destroy_mem_pools(struct smbdirect_socket *sc)
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  756  {
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  757  	struct smbdirect_recv_io *recv_io, *next_io;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  758  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  759  	list_for_each_entry_safe(recv_io, next_io, &sc->recv_io.free.list, list) {
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  760  		list_del(&recv_io->list);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29 @761  		mempool_free(recv_io, sc->recv_io.mem.pool);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  762  	}
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  763  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  764  	/*
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  765  	 * Note mempool_destroy() and kmem_cache_destroy()
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  766  	 * work fine with a NULL pointer
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  767  	 */
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  768  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29 @769  	mempool_destroy(sc->recv_io.mem.pool);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  770  	sc->recv_io.mem.pool = NULL;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  771  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  772  	kmem_cache_destroy(sc->recv_io.mem.cache);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  773  	sc->recv_io.mem.cache = NULL;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  774  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  775  	mempool_destroy(sc->send_io.mem.pool);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  776  	sc->send_io.mem.pool = NULL;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  777  
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  778  	kmem_cache_destroy(sc->send_io.mem.cache);
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  779  	sc->send_io.mem.cache = NULL;
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  780  }
632cc85ae7ad30d Stefan Metzmacher 2025-10-29  781  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
