Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248AC2C69B;
	Sat, 27 Jul 2024 06:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722062601; cv=none; b=ttKf9LD7cdQxGEPnetN60b/Wg6u7xb69ibkni6cxU/UuSAfMrsvgeASRN7vPA88I5jEnhxyQ1NxmNFh8c5Gk7+cd3W92fygMOoEmh4PpQZJoPjtTj+oLCwtlUDq9zM4UWSHmNPjS/zFcjynfsHxPxKRXaN5CxXBSUd+ixnB9Kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722062601; c=relaxed/simple;
	bh=mRX3vFgM36haz1/5h8NqysPeV5YtUlnTp6U6aDUHEZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUS1TV81P6JvjP3zE+JXwnbBiFPsl59IA8dExfOX81dZpUuaLAsC28EQZhYStH2xf2e9/24PcsuGy4SCVXWyNnCSRwhFlVbleThofW+q2JUtAcS2gE4hW42K3Vs65uzwHGn1BFtdfdtC3uFmaa/7zIbSkwmLVyvPIJZxqdDj9nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DnIRVowE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnIRVowE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722062599; x=1753598599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mRX3vFgM36haz1/5h8NqysPeV5YtUlnTp6U6aDUHEZM=;
  b=DnIRVowEwxq4QLMCt7yAlKYPZe6VfAlH+rSkf6tHTGAAFCTsHsKrCB9H
   8dLCpj2e1z8nIrz3yKjOilZL8/3C+RtL6LdU3BMR5Eklmh+qV7Ry6jg70
   lfH6vbAUR39uCdBBTbmCpsnaZTLdP2WmMil7n0ZhnNMtL+uvdQBncXfeC
   tVwv7l5lLfiLGI4A28RJ7YmEV5lc/lRHLkiNhxq2aKE/VHoFZvd4F0IeR
   bKtKhg/9ViQqNxjOyNFjUDnaz1w4KZzPkA2minSvYqgNwQ559NECKk8j/
   zl6xMmkF4Ekr+YN1vqX3YKvzQr9RMSy1hbWflade0p/I9IIT7WKszIeeD
   w==;
X-CSE-ConnectionGUID: e4U1QRTsRYe1rdQ8o2zt2w==
X-CSE-MsgGUID: T2yT5wu6Sq6/P6y7vz7htQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="31252698"
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="31252698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 23:43:18 -0700
X-CSE-ConnectionGUID: e57EoUm1Soiny51GSzd2ng==
X-CSE-MsgGUID: ViyQpaisTzWYmqnKa8i7hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,240,1716274800"; 
   d="scan'208";a="58569780"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jul 2024 23:43:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sXb99-000pgC-0J;
	Sat, 27 Jul 2024 06:43:15 +0000
Date: Sat, 27 Jul 2024 14:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-writeback 21/22] fs/afs/dir.c:312:9: warning:
 explicitly assigning value of variable of type 'ssize_t' (aka 'int') to
 itself
Message-ID: <202407271449.H34eCaAJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-writeback
head:   6b24fc77cd5428445a25435f8cf7c56e55d600a6
commit: b2fd6d9020b74d49f3d0f7585cce82396b4a608e [21/22] afs: Use netfslib instead of ITER_XARRAY for directories
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240727/202407271449.H34eCaAJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240727/202407271449.H34eCaAJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407271449.H34eCaAJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/afs/dir.c:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/afs/dir.c:11:
   In file included from include/linux/pagemap.h:11:
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
   In file included from fs/afs/dir.c:11:
   In file included from include/linux/pagemap.h:11:
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
   In file included from fs/afs/dir.c:11:
   In file included from include/linux/pagemap.h:11:
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
>> fs/afs/dir.c:312:9: warning: explicitly assigning value of variable of type 'ssize_t' (aka 'int') to itself [-Wself-assign]
     312 |                                 ret = ret;
         |                                 ~~~ ^ ~~~
   8 warnings generated.


vim +312 fs/afs/dir.c

   251	
   252	/*
   253	 * Perform a read of the directory.
   254	 */
   255	static ssize_t afs_do_read_dir(struct afs_vnode *dvnode, struct file *file,
   256				       struct folio_batch *fbatch)
   257	{
   258		struct address_space *mapping = dvnode->netfs.inode.i_mapping;
   259		DEFINE_READAHEAD(ractl, file, NULL, mapping, 0);
   260		struct folio *folio;
   261		ssize_t ret = 0;
   262		size_t pos = 0;
   263		loff_t i_size;
   264	
   265		i_size = i_size_read(&dvnode->netfs.inode);
   266		if (i_size < 2048)
   267			return afs_bad(dvnode, afs_file_error_dir_small);
   268		if (i_size > 2048 * 1024) {
   269			trace_afs_file_error(dvnode, -EFBIG, afs_file_error_dir_big);
   270			return -EFBIG;
   271		}
   272	
   273		/* Lock all the folios in the range we need, filling in any gaps.  We
   274		 * drop the references we get from the VM here analogously with the VM
   275		 * readahead code.
   276		 */
   277		while (pos < i_size) {
   278			folio = filemap_get_folio(mapping, pos / PAGE_SIZE);
   279			if (IS_ERR(folio)) {
   280				fgf_t fgp_flags = FGP_LOCK | FGP_CREAT;
   281	
   282				fgp_flags |= fgf_set_order(i_size - pos);
   283	
   284				folio = __filemap_get_folio(mapping, pos / PAGE_SIZE,
   285							    fgp_flags, mapping->gfp_mask);
   286				if (IS_ERR(folio)) {
   287					ret = PTR_ERR(folio);
   288					goto revert;
   289				}
   290			}
   291	
   292			folio_clear_uptodate(folio);
   293			ractl._nr_pages += folio_nr_pages(folio);
   294			pos += folio_size(folio);
   295		}
   296	
   297		/* AFS requires us to perform the read of a directory synchronously as
   298		 * a single unit to avoid issues with the directory contents being
   299		 * changed between reads.
   300		 */
   301		ret = netfs_read_single(&ractl);
   302		if (ret >= 0) {
   303			i_size = i_size_read(&dvnode->netfs.inode);
   304			if (i_size > ret) {
   305				/* The content has grown, so we need to expand the
   306				 * buffer.
   307				 */
   308				ret = -ESTALE;
   309			} else {
   310				int ret2 = afs_dir_check(dvnode, fbatch);
   311				if (ret2 < 0)
 > 312					ret = ret;
   313			}
   314		}
   315	
   316	revert:
   317		while ((folio = readahead_folio(&ractl)) != NULL) {
   318			folio_get(folio);
   319			filemap_remove_folio(folio);
   320			folio_unlock(folio);
   321			if (!folio_batch_add(fbatch, folio))
   322				folio_batch_release(fbatch);
   323		}
   324		return ret;
   325	}
   326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
