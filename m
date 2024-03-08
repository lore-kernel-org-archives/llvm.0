Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C4C23772;
	Fri,  8 Mar 2024 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709908076; cv=none; b=rU6Qg4lGZKm/aHWGAcsAcM1Z+gQ9h+J3r0/AljE5uA40nAzzAKPapgQmdZGoEFI53pqukMiqa0bMPGeGQL+iSe+VbDnLIM8ph5dnpsIm3a5kjCqDonrRhhTa6FjwIN+XJnMQQyQghJAXX99GZB2QH2tR4V410iOwjZVcTiiUj/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709908076; c=relaxed/simple;
	bh=JehrwBSe5jpER7aEjZ7zFG79Kv0Lh6GhsbWnY4NNhEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ORznxrMtYdClpvrxcBP9fNNAxHikE5w7gIJPaDA226WJYP0LpePMbwjCqMQLdmC216agVClIYZDuwX+nEb6VHzfurDRQ/LgYguqtkZNrEETWo0DFVbFTBrWePmRElJONxfspYOETszRTIzssHSqgoRmNaP2BbLdMYpA0R3ga36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnKp1TFH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnKp1TFH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709908074; x=1741444074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JehrwBSe5jpER7aEjZ7zFG79Kv0Lh6GhsbWnY4NNhEQ=;
  b=GnKp1TFHxfS+8NDdv8uBhaPd7QAFQY7RS8pKGB9MABd3pKELkBALuqVK
   DuNZFLp4yKDUaQNGhCMLasxi+AvmGC5LOno+RdIF3ra53D5yAlx6GvNMd
   y0Aef26pPeSgRgaJP0uqjq2/0yPOCvwbZcrAXoccNLIM87f7yI+u9MBkH
   OiLOloXsx/hxsNc5sgGfYJhOTBkWqZrhganKPmNfq0F0betlQaBFKzJyj
   qaej6uw/8z4HQkK5s3ylDs3F7qmm6JOeXKVY8C/q9yk9l2lBhT9847yoH
   BEXlKbhZUVThedy9oFQXKfEMdvmyY/4n3Js7ybDUup62dG3rObhGur3SG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="22153236"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="22153236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 06:27:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="33614703"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Mar 2024 06:27:52 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ribCP-0006RD-2I;
	Fri, 08 Mar 2024 14:27:49 +0000
Date: Fri, 8 Mar 2024 22:27:03 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Richard Weinberger <richard@nod.at>
Subject: [linux-next:master 9129/12944] drivers/mtd/ubi/nvmem.c:34:9: error:
 incompatible pointer types passing 'int *' to parameter of type 'uint64_t *'
 (aka 'unsigned long long *')
Message-ID: <202403082209.vkIG6nqH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
commit: 3ce485803da1b79b2692b6d0c2792829292ad838 [9129/12944] mtd: ubi: provide NVMEM layer over UBI volumes
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240308/202403082209.vkIG6nqH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403082209.vkIG6nqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403082209.vkIG6nqH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mtd/ubi/nvmem.c:7:
   In file included from drivers/mtd/ubi/ubi.h:28:
   In file included from include/linux/mtd/ubi.h:13:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/mtd/ubi/nvmem.c:7:
   In file included from drivers/mtd/ubi/ubi.h:28:
   In file included from include/linux/mtd/ubi.h:13:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/mtd/ubi/nvmem.c:7:
   In file included from drivers/mtd/ubi/ubi.h:28:
   In file included from include/linux/mtd/ubi.h:13:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/mtd/ubi/nvmem.c:7:
   In file included from drivers/mtd/ubi/ubi.h:28:
   In file included from include/linux/mtd/ubi.h:13:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   drivers/mtd/ubi/nvmem.c:34:9: warning: comparison of distinct pointer types ('typeof ((lnum)) *' (aka 'int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
     222 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> drivers/mtd/ubi/nvmem.c:34:9: error: incompatible pointer types passing 'int *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
     238 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:213:38: note: passing argument to parameter 'dividend' here
     213 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   drivers/mtd/ubi/nvmem.c:34:9: warning: shift count >= width of type [-Wshift-count-overflow]
      34 |         offs = do_div(lnum, unv->usable_leb_size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
     234 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   9 warnings and 1 error generated.


vim +34 drivers/mtd/ubi/nvmem.c

    22	
    23	static int ubi_nvmem_reg_read(void *priv, unsigned int from,
    24				      void *val, size_t bytes)
    25	{
    26		int err = 0, lnum = from, offs, bytes_left = bytes, to_read;
    27		struct ubi_nvmem *unv = priv;
    28		struct ubi_volume_desc *desc;
    29	
    30		desc = ubi_open_volume(unv->ubi_num, unv->vol_id, UBI_READONLY);
    31		if (IS_ERR(desc))
    32			return PTR_ERR(desc);
    33	
  > 34		offs = do_div(lnum, unv->usable_leb_size);
    35		while (bytes_left) {
    36			to_read = unv->usable_leb_size - offs;
    37	
    38			if (to_read > bytes_left)
    39				to_read = bytes_left;
    40	
    41			err = ubi_read(desc, lnum, val, offs, to_read);
    42			if (err)
    43				break;
    44	
    45			lnum += 1;
    46			offs = 0;
    47			bytes_left -= to_read;
    48			val += to_read;
    49		}
    50		ubi_close_volume(desc);
    51	
    52		if (err)
    53			return err;
    54	
    55		return bytes_left == 0 ? 0 : -EIO;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
