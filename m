Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A92C4437A;
	Thu,  6 Jun 2024 06:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717656390; cv=none; b=VFgkV9wOgnokkDBnJIrp8uhoCDDJr64Ul7L6zaGKPAYFsyLxiNT09NsvlxgGvh4qxBoMLJzX3DpyopoBzG/YIUggXo315vKUWWvV1glOOuI1GeXgYAQ/5r2bhQRcwXLq1BUNwYm6ZHY40RbZAgOftXvZE+t3cfM5nHd6TPnVhlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717656390; c=relaxed/simple;
	bh=9QN/XN3mHQmAKvJddYnjCjkOjnzQeADRYsi7D9Vn6AI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sIkIqMxlLPibLs+xFyRNG1xZGEXkAsXg7GKg5XUevGPL/CFYi28CXiizgaYe8SAua1I1rpb7RRFCnN8mHbp9NSNrbFaSU07ew1zNyvQbf05dHNfWQg5ubvN3LwWco0IRaFnwo6jtj2aPOO5rdER5hDakPqr8OA4AAAxIJbCgjDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9uU7XNI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9uU7XNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717656388; x=1749192388;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9QN/XN3mHQmAKvJddYnjCjkOjnzQeADRYsi7D9Vn6AI=;
  b=i9uU7XNIfWher0Znq/g8xokdE4yc1xpmCfEXqRxpzI5A495dzzy877VT
   Iz7XhCImV7LpJeVjGDfhW4lIgCE96e94MN6hRNx3WD589uzbi3bORKHQH
   K3ZTCxQhM4oBiYh+MT40HcWGBMjtVmlrLRG11uWm9qCWBpdV6TbhGF2Qg
   M1mmB0lYYf8aZNX5EZdOo9R+z6dkbVCGPGc7Ft6WpOcIVQiELHunx3TBW
   4JTMTvPr5QJRhzlw9poGk9oz/UAcD2ClT6qEgXQvRY+LSWJ9Yq90+lbWl
   mIiQqjGUp0QOSaQeuSJNiYxWMZ+fzMJt82BG4qcIhxcS+f5hS0NrNa5UB
   A==;
X-CSE-ConnectionGUID: KVPs18LdSSaXgxOcoc9p6w==
X-CSE-MsgGUID: CryYAs2KQEqhl5lqV5P0+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="31803229"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="31803229"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 23:46:28 -0700
X-CSE-ConnectionGUID: 01PgUdIvQYiGMOJyudxCcw==
X-CSE-MsgGUID: gvPZ27X8SleFZr3VRUxVWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37957125"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Jun 2024 23:46:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF6tC-0002lg-0f;
	Thu, 06 Jun 2024 06:46:22 +0000
Date: Thu, 6 Jun 2024 14:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: Weston Andros Adamson <dros@primarydata.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Snitzer <snitzer@kernel.org>,
	Jeff Layton <jeff.layton@primarydata.com>,
	Peng Tao <tao.peng@primarydata.com>,
	Lance Shelton <lance.shelton@hammerspace.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [snitzer:nfs-localio-for-6.11 10/29] fs/nfs/localio.c:289:6:
 warning: variable 'flags' set but not used
Message-ID: <202406061403.xiHdI6Ty-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git nfs-localio-for-6.11
head:   252b0c685ae2eafa0ced0682a496e9eecf23d1ff
commit: 1db309e3046ff4d7bc50071001f56700fec36d46 [10/29] nfs/nfsd: add "local io" support
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406061403.xiHdI6Ty-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061403.xiHdI6Ty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061403.xiHdI6Ty-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/nfs/localio.c:12:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/nfs/localio.c:12:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/nfs/localio.c:12:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/nfs/localio.c:12:
   In file included from include/linux/inet.h:42:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> fs/nfs/localio.c:289:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
     289 |         int flags = O_LARGEFILE;
         |             ^
   8 warnings generated.


vim +/flags +289 fs/nfs/localio.c

   277	
   278	/*
   279	 * nfs_local_open_fh - open a local filehandle
   280	 *
   281	 * Returns a pointer to a struct file or an ERR_PTR
   282	 */
   283	struct file *
   284	nfs_local_open_fh(struct nfs_client *clp, const struct cred *cred,
   285			  struct nfs_fh *fh, const fmode_t mode)
   286	{
   287		struct nfs_local_open_ctx *ctx = &__local_open_ctx;
   288		struct file *filp;
 > 289		int flags = O_LARGEFILE;
   290		int status;
   291	
   292		switch (mode & (FMODE_READ | FMODE_WRITE)) {
   293		case FMODE_READ | FMODE_WRITE:
   294			flags |= O_RDWR;
   295			break;
   296		case FMODE_READ:
   297			flags |= O_RDONLY;
   298			break;
   299		case FMODE_WRITE:
   300			flags |= O_WRONLY;
   301			break;
   302		default:
   303			return ERR_PTR(-EINVAL);
   304		}
   305	
   306		status = ctx->open_f(clp->cl_rpcclient, cred, fh, mode, &filp);
   307		if (status < 0) {
   308			dprintk("%s: open local file failed error=%d\n",
   309					__func__, status);
   310			trace_nfs_local_open_fh(fh, mode, status);
   311			switch (status) {
   312			case -ENXIO:
   313				nfs_local_disable(clp);
   314				fallthrough;
   315			case -ETIMEDOUT:
   316				status = -EAGAIN;
   317			}
   318			filp = ERR_PTR(status);
   319		}
   320		return filp;
   321	}
   322	EXPORT_SYMBOL_GPL(nfs_local_open_fh);
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
