Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6461847;
	Sun, 16 Jun 2024 22:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718578198; cv=none; b=tsOU7se9pHLlilCs8THOwf6zIri5CjoR6efblOJH+zPxNkXOlsCHLqzAD1/edE6e+wZQeh3akpu9Fc/v90N9rJ5oRV45nvA8vId0Gj6ieV63A4EK/ju2JxCuvSLP3Cnp4LD/H83zq7Ndm/yshGFOZfNX5KWOySRz6T1zcVWORWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718578198; c=relaxed/simple;
	bh=ZA1jWEv8bJUj8Uhy+Gcpuawu0h2sW1esCmXTGYm09XE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJa8g55aKGoIwHTzXHUV+WPjBdR0GqjoR/0v6kJFRU/iPc0w+U3BBersjzsOcRQccjroKa2WWVe2vPx7EwAW/mYS8qe5DQJ1y6D5x0qMylfEJrIK+QVrL31wP2gRiHdizApsxIok4EJ0vgcZ6MH+Xqa49aBB9Xk8B9GlcQ1c0oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dnaYT6w6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dnaYT6w6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718578196; x=1750114196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZA1jWEv8bJUj8Uhy+Gcpuawu0h2sW1esCmXTGYm09XE=;
  b=dnaYT6w6lidFzK6snTBIdgW+hr/JC4AB2Jwah2sk3LL2T8Ir3rQpXv9p
   olBrdurFI38t0hQxQY/RKUtw7WC38xqdhFoiwMSjzpdWxgYWhrs/9rW4k
   8AZKgp84xZbH3BjRNi5/JoRT/ZT5TdcYmEvOSEKTYa0cN+4Uyzyk4sh/e
   zWlUvYFP7di72SBRZlQiYis9cjbMEnZz/ndSrx9r2++8z58BdzsMTBcbG
   uvylmIvsvhY6OARuGhkiyWXRhtQxPctRu0FPcJcz4rfEyljxOU1vCm6Qe
   yHdvcf6ynfVUL85Gqrgafzu0Rm0RhqEucp+l6fZBwzN584LqtkTI27oUR
   g==;
X-CSE-ConnectionGUID: DfARdBT0S7KP2yOGSenBtA==
X-CSE-MsgGUID: CxBJOzYuS7eViGcoKM19tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15522918"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="15522918"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 15:49:56 -0700
X-CSE-ConnectionGUID: 302t+mGSQdeQeYm4r5y5eQ==
X-CSE-MsgGUID: Y0S35OFEQgiqolbSxcGvRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="45956573"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jun 2024 15:49:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIyh6-0003Qn-0s;
	Sun, 16 Jun 2024 22:49:52 +0000
Date: Mon, 17 Jun 2024 06:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:nfsd-testing 18/18] fs/nfsd/blocklayoutxdr.c:166:1: error:
 function definition is not allowed here
Message-ID: <202406170656.QJXrQzOj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   c84c489cded2df7bcd07b5205179cd19b0f0718b
commit: c84c489cded2df7bcd07b5205179cd19b0f0718b [18/18] nfsd/blocklayout: Clean up dprintk's
config: s390-randconfig-001-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170656.QJXrQzOj-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170656.QJXrQzOj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170656.QJXrQzOj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/nfsd/blocklayoutxdr.c:5:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from fs/nfsd/blocklayoutxdr.c:5:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from fs/nfsd/blocklayoutxdr.c:5:
   In file included from include/linux/sunrpc/svc.h:17:
   In file included from include/linux/sunrpc/xdr.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:93:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> fs/nfsd/blocklayoutxdr.c:166:1: error: function definition is not allowed here
     166 | {
         | ^
>> fs/nfsd/blocklayoutxdr.c:201:2: error: expected '}'
     201 | }
         |  ^
   fs/nfsd/blocklayoutxdr.c:115:1: note: to match this '{'
     115 | {
         | ^
   12 warnings and 2 errors generated.


vim +166 fs/nfsd/blocklayoutxdr.c

f99d4fbdae6765 Christoph Hellwig 2016-03-04  162  
f99d4fbdae6765 Christoph Hellwig 2016-03-04  163  int
f99d4fbdae6765 Christoph Hellwig 2016-03-04  164  nfsd4_scsi_decode_layoutupdate(__be32 *p, u32 len, struct iomap **iomapp,
f99d4fbdae6765 Christoph Hellwig 2016-03-04  165  		u32 block_size)
f99d4fbdae6765 Christoph Hellwig 2016-03-04 @166  {
f99d4fbdae6765 Christoph Hellwig 2016-03-04  167  	struct iomap *iomaps;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  168  	u32 nr_iomaps, expected, i;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  169  
c84c489cded2df Chuck Lever       2024-06-16  170  	if (unlikely(len < XDR_UNIT))
f99d4fbdae6765 Christoph Hellwig 2016-03-04  171  		return -EINVAL;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  172  
f99d4fbdae6765 Christoph Hellwig 2016-03-04  173  	nr_iomaps = be32_to_cpup(p++);
c84c489cded2df Chuck Lever       2024-06-16  174  	expected = XDR_UNIT + nr_iomaps * PNFS_SCSI_RANGE_SIZE;
c84c489cded2df Chuck Lever       2024-06-16  175  	if (unlikely(len != expected))
f99d4fbdae6765 Christoph Hellwig 2016-03-04  176  		return -EINVAL;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  177  
f99d4fbdae6765 Christoph Hellwig 2016-03-04  178  	iomaps = kcalloc(nr_iomaps, sizeof(*iomaps), GFP_KERNEL);
c84c489cded2df Chuck Lever       2024-06-16  179  	if (unlikely(!iomaps))
f99d4fbdae6765 Christoph Hellwig 2016-03-04  180  		return -ENOMEM;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  181  
f99d4fbdae6765 Christoph Hellwig 2016-03-04  182  	for (i = 0; i < nr_iomaps; i++) {
f99d4fbdae6765 Christoph Hellwig 2016-03-04  183  		u64 val;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  184  
f99d4fbdae6765 Christoph Hellwig 2016-03-04  185  		p = xdr_decode_hyper(p, &val);
c84c489cded2df Chuck Lever       2024-06-16  186  		if (unlikely(val & (block_size - 1)))
f99d4fbdae6765 Christoph Hellwig 2016-03-04  187  			goto fail;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  188  		iomaps[i].offset = val;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  189  
f99d4fbdae6765 Christoph Hellwig 2016-03-04  190  		p = xdr_decode_hyper(p, &val);
c84c489cded2df Chuck Lever       2024-06-16  191  		if (unlikely(val & (block_size - 1)))
f99d4fbdae6765 Christoph Hellwig 2016-03-04  192  			goto fail;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  193  		iomaps[i].length = val;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  194  	}
f99d4fbdae6765 Christoph Hellwig 2016-03-04  195  
f99d4fbdae6765 Christoph Hellwig 2016-03-04  196  	*iomapp = iomaps;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  197  	return nr_iomaps;
f99d4fbdae6765 Christoph Hellwig 2016-03-04  198  fail:
f99d4fbdae6765 Christoph Hellwig 2016-03-04  199  	kfree(iomaps);
f99d4fbdae6765 Christoph Hellwig 2016-03-04  200  	return -EINVAL;
f99d4fbdae6765 Christoph Hellwig 2016-03-04 @201  }

:::::: The code at line 166 was first introduced by commit
:::::: f99d4fbdae6765d0bb4ed5441f6fa1f036122d59 nfsd: add SCSI layout support

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
