Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502AEC0
	for <llvm@lists.linux.dev>; Sat, 10 Sep 2022 12:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662812225; x=1694348225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y/xyvexqIizCI4cAn5kCM2C0CxGp+bRPzooVG+sSF2g=;
  b=ibjfver0syfxA/PnhPmMLzvcblKFMSz0ptH7f8X/cGbnCDl3MRVhgyL3
   4dU1a8kqBsmKYj5nVDKyzhfZ8kM66EknwapXGAB3jPBLGEnjCY41ENhoR
   AmgK310bEV0VWlpeB4IjjcOK+/m42+KCS5bHqaNE2vQUPwnft+ecAlFSf
   1jIfnpltevohASrQo8zoAn+LYuEQ3ZGk9cL2RNUEp+YKyN9sh86EP6vhW
   Tbgyv7O0Zl3AlZAIaDEA1Mj5eXWpXUCI98uHLXSZmCiq7elcyVb0VOv/T
   FDsyyzQgp6NyFVkk30jUoMX9syiDtUptxzVHdzBOKXFBARYDfnNSta+Bu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10466"; a="278031198"
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="278031198"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2022 05:17:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,305,1654585200"; 
   d="scan'208";a="683936062"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Sep 2022 05:17:03 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWzPz-00005v-13;
	Sat, 10 Sep 2022 12:17:03 +0000
Date: Sat, 10 Sep 2022 20:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC][PATCH] iov_iter: Add extraction functions
Message-ID: <202209102009.ie6X2mlj-lkp@intel.com>
References: <3750754.1662765490@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3750754.1662765490@warthog.procyon.org.uk>

Hi David,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v6.0-rc4 next-20220909]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Howells/iov_iter-Add-extraction-functions/20220910-072102
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ce888220d5c7a805e0e155302a318d5d23e62950
config: s390-randconfig-r044-20220907 (https://download.01.org/0day-ci/archive/20220910/202209102009.ie6X2mlj-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a8df8a897880379087a0a9fc4f6fc1391e352217
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review David-Howells/iov_iter-Add-extraction-functions/20220910-072102
        git checkout a8df8a897880379087a0a9fc4f6fc1391e352217
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from lib/iov_iter_extract.c:16:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from lib/iov_iter_extract.c:16:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from lib/iov_iter_extract.c:16:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> lib/iov_iter_extract.c:348:3: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                   ret += len;
                   ^~~
   lib/iov_iter_extract.c:329:13: note: initialize the variable 'ret' to silence this warning
           ssize_t ret;
                      ^
                       = 0
   13 warnings generated.


vim +/ret +348 lib/iov_iter_extract.c

   314	
   315	/*
   316	 * Extract the pages from an XARRAY-class iterator and add them to the
   317	 * destination buffer.  The pages are not pinned.
   318	 */
   319	static ssize_t iov_iter_extract_xarray(struct iov_iter *iter,
   320					       void *array, unsigned int array_max,
   321					       ssize_t maxsize,
   322					       enum iter_extract_dest dest)
   323	{
   324		struct xarray *xa = iter->xarray;
   325		struct folio *folio;
   326		unsigned int ix;
   327		loff_t start = iter->xarray_start + iter->iov_offset;
   328		pgoff_t index = start / PAGE_SIZE;
   329		ssize_t ret;
   330		size_t offset, len;
   331		XA_STATE(xas, xa, index);
   332	
   333		rcu_read_lock();
   334		xas_for_each(&xas, folio, ULONG_MAX) {
   335			if (xas_retry(&xas, folio))
   336				continue;
   337			if (WARN_ON(xa_is_value(folio)))
   338				break;
   339			if (WARN_ON(folio_test_hugetlb(folio)))
   340				break;
   341	
   342			offset = offset_in_folio(folio, start);
   343			len = min_t(size_t, maxsize, folio_size(folio) - offset);
   344	
   345			ix = extract_contig_pages(array, folio_page(folio, 0),
   346						  offset, len, dest);
   347			maxsize -= len;
 > 348			ret += len;
   349			if (ix >= array_max) {
   350				WARN_ON_ONCE(ix > array_max);
   351				break;
   352			}
   353	
   354			if (maxsize <= 0)
   355				break;
   356		}
   357	
   358		rcu_read_unlock();
   359		terminate_array(array, dest);
   360		return ret;
   361	}
   362	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
