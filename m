Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997481891B9;
	Tue,  3 Sep 2024 15:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378438; cv=none; b=uYeYmXDbNnfDVvr0t/+jsphXU7yr1VPDlUmBKvgBiIoV3/55QM9iK4NJq2zcIhUuCpQA55SZdovIHcI/NYFu/q9QOOULERc0AQ7B1w84EY4mJq2TImERWwsnpooO2Vq1Bhl8E51MxzKUu8u63fawr5E8BhW7Ljq1eC3i8tBdVSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378438; c=relaxed/simple;
	bh=MlL2ekpNBHWtNe30G+6JiHx0CcJvvFtMGonOwXzVqPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DJi1vbLCzRauQOcbtVzYCbDJudbGihe5/xvjlow6QhCwYcL0iczPkHlY4gcvBebGRYsXzAUtcW0ceHGt9BL7EM7LRfDwtJVABrsKaAG6m2DXz21t1RVxZA/2kiIb4EVM9roH95KDV/BLQtbubc+NWt/vUY4JC/auFJ2t5zxin6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lys3dDUz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lys3dDUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725378437; x=1756914437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MlL2ekpNBHWtNe30G+6JiHx0CcJvvFtMGonOwXzVqPM=;
  b=Lys3dDUzW3daMZACwdCi7FONKvM0fSDQZU9aMYeSRJyRJeHkfTk3oK/h
   R8c7KPa2D3egnbt5CJylHNzvymNP8vd4cANXRE2ws42Faog8bIptfdV+r
   qhzuemZM5eE+h8kkatb9px+up3ED6T6HP0cfpExthzZV2xd8ZQ71D3Vnj
   /mts7IkcC5z0XAeRp3wC7rRsahY0yK+P84TmSCf1zFA6SdP0lM2/cl21V
   4kR6JCVexL7iW8vsfYKD0IRvVdsHwuPfxU2uJ/obvlQerDNP7uoG/JNS7
   Hb2Afcz02j1BRwON63rVREDCdzVxA8+6Z1t1wHHrL2VLo5rpY9PE3qwGo
   g==;
X-CSE-ConnectionGUID: K6asfALxQrGpEXPAQYFpGQ==
X-CSE-MsgGUID: T73FkqaQQ8iQzr77pz11wA==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="24176663"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="24176663"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 08:47:16 -0700
X-CSE-ConnectionGUID: 4/SH70pWSlKtdRm9+Cg7hA==
X-CSE-MsgGUID: u8jqcSDER2mouJk2ghCjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="88202643"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2024 08:47:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slVkO-0006r2-1T;
	Tue, 03 Sep 2024 15:47:12 +0000
Date: Tue, 3 Sep 2024 23:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-crypt 37/37] fs/netfs/crypto.c:305:38: warning:
 format specifies type 'size_t' (aka 'unsigned int') but the argument has
 type 'unsigned long'
Message-ID: <202409032337.cSEMj0gq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   3962f4beba4e7ffa6cfab018df8a612902a1d2c8
commit: 3962f4beba4e7ffa6cfab018df8a612902a1d2c8 [37/37] netfs: Support decryption on ubuffered/DIO read
config: i386-buildonly-randconfig-003-20240903 (https://download.01.org/0day-ci/archive/20240903/202409032337.cSEMj0gq-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240903/202409032337.cSEMj0gq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409032337.cSEMj0gq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/netfs/crypto.c:305:38: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     304 |         kdebug("type=%u nr=%zu type=%u nr=%zu",
         |                            ~~~
         |                            %lu
     305 |                rreq->bounce.iter.iter_type, rreq->bounce.iter.nr_segs,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/internal.h:443:43: note: expanded from macro 'kdebug'
     443 | #define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
         |                                    ~~~    ^~~~~~~~~~~
   fs/netfs/internal.h:439:46: note: expanded from macro 'dbgprintk'
     439 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                           ~~~                       ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   fs/netfs/crypto.c:306:38: warning: format specifies type 'size_t' (aka 'unsigned int') but the argument has type 'unsigned long' [-Wformat]
     304 |         kdebug("type=%u nr=%zu type=%u nr=%zu",
         |                                           ~~~
         |                                           %lu
     305 |                rreq->bounce.iter.iter_type, rreq->bounce.iter.nr_segs,
     306 |                rreq->buffer.iter.iter_type, rreq->buffer.iter.nr_segs);
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/netfs/internal.h:443:43: note: expanded from macro 'kdebug'
     443 | #define kdebug(FMT, ...) dbgprintk(FMT, ##__VA_ARGS__)
         |                                    ~~~    ^~~~~~~~~~~
   fs/netfs/internal.h:439:46: note: expanded from macro 'dbgprintk'
     439 |         printk("[%-6.6s] "FMT"\n", current->comm, ##__VA_ARGS__)
         |                           ~~~                       ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> fs/netfs/crypto.c:283:29: warning: variable 'skip' set but not used [-Wunused-but-set-variable]
     283 |         size_t len, processed = 0, skip, bsize = 1UL << ctx->crypto_bshift;
         |                                    ^
   3 warnings generated.


vim +305 fs/netfs/crypto.c

   273	
   274	/*
   275	 * Decrypt the result of a DIO read request.
   276	 */
   277	void netfs_decrypt_dio(struct netfs_io_request *rreq)
   278	{
   279		struct netfs_inode *ctx = netfs_inode(rreq->inode);
   280		struct scatterlist source_sg[16], dest_sg[16];
   281		unsigned long long start;
   282		unsigned int n_source;
 > 283		size_t len, processed = 0, skip, bsize = 1UL << ctx->crypto_bshift;
   284		int ret;
   285	
   286		trace_netfs_rreq(rreq, netfs_rreq_trace_decrypt);
   287		if (rreq->start >= rreq->i_size)
   288			return;
   289	
   290		start = round_down(rreq->start, bsize);
   291		skip = rreq->start - start;
   292		len = round_down(rreq->transferred, bsize);
   293	
   294		if (rreq->buffer.iter.count < rreq->len)
   295			iov_iter_revert(&rreq->buffer.iter, rreq->len - rreq->buffer.iter.count);
   296		if (rreq->bounce.iter.count < len)
   297			iov_iter_revert(&rreq->bounce.iter, len - rreq->bounce.iter.count);
   298	
   299		kdebug("DECRYPT %llx-%llx f=%lx %zx/%zx %zx/%llx",
   300		       start, start + len - 1, rreq->flags,
   301		       rreq->bounce.iter.count, len,
   302		       rreq->buffer.iter.count, rreq->len);
   303	
   304		kdebug("type=%u nr=%zu type=%u nr=%zu",
 > 305		       rreq->bounce.iter.iter_type, rreq->bounce.iter.nr_segs,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
