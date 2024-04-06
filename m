Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53F6E555;
	Sat,  6 Apr 2024 02:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712370379; cv=none; b=M3tqnQoGt109fcNZVvbcTdCByazVQHg2W/CsVkhgAghppzrnUFuBYuD8GT3z7LHvXx5zJtYMAEc99oa3rlIwfc4o8fSic3HZb0yAochc2Y1SxSYWMoOkQ/hnjXO9m8p7yt6CBL4JXSmkvAJSd4YR4qlMhAJYGzZPrHRI0f+hx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712370379; c=relaxed/simple;
	bh=ABA92r0TrbimY9lfC+tfN7yY7jGTLZ/wOVSuRyN7BSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qeO2g+RQhjrwtGobya0okG3FO/dsjlqvdj/jz6TmKVuaUmuv0h8c/xGY00c+Z9eaksc2dujMuRs4O6hCeMDKl3jLde0IcpSY5SSeSMuGH/Qti/7CnaudTaEfTgLPz1XMfSDwXdeZ3JSgx6wirB2ywI05v68kP98FGPhNE9ll3Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3KvEewL; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3KvEewL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712370377; x=1743906377;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ABA92r0TrbimY9lfC+tfN7yY7jGTLZ/wOVSuRyN7BSg=;
  b=n3KvEewLrIu5p1HQbiANOMvvI9sBB8YmICHDkQcMKC3TDFi8ixmHfWlx
   V8GVpgmHe5d4x4uwM/n0R3YsgblRuifmDuROdSUUp2Vv8rYQrhDM/RH5G
   fzTlvbc4t9k/YKfR6TopR8jMcfoLAqjLk00Fz/axB7QVoUgsZxKvVvze4
   h0hsPTpjR2vTFflKbT7vWnjrJ6qGk582w/mLR7HdDBPc6TSxOU0sLgIPj
   f/5eZ6nRlKNnPDreAmwFfzVgNmMgKCulFN4DTSjuDmMc3d8T1ZxDSadHk
   HZClFmY+Y1hLa837FtOycNIwV5HrDPqRgYTNDRZGkuSIKD+gtv+5cfKsZ
   Q==;
X-CSE-ConnectionGUID: p2dHSI8ERgilV0hhqXvvuw==
X-CSE-MsgGUID: BYVLTKImRyW2+zx/MXx95g==
X-IronPort-AV: E=McAfee;i="6600,9927,11035"; a="10689711"
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="10689711"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 19:26:16 -0700
X-CSE-ConnectionGUID: 6eSMGUG6TImPHQPTFC/f9A==
X-CSE-MsgGUID: UUk4A7N5TsKf82NCzO66vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,182,1708416000"; 
   d="scan'208";a="24086772"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Apr 2024 19:26:15 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsvky-00030C-15;
	Sat, 06 Apr 2024 02:26:12 +0000
Date: Sat, 6 Apr 2024 10:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:rw_iter 76/93] drivers/misc/lkdtm/core.c:300:17: error:
 call to undeclared function 'iov_iter_count'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202404061033.dughXBKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   222e1965f038cbce873a9392d6b9e0df82837498
commit: 5f44157c2a3b1257016bb0bd4257c96d1a126723 [76/93] misc: lkdtm: convert to read/write iterators
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240406/202404061033.dughXBKl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 546dc2245ffc4cccd0b05b58b7a5955e355a3b27)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240406/202404061033.dughXBKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404061033.dughXBKl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/lkdtm/core.c:23:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/misc/lkdtm/core.c:23:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/misc/lkdtm/core.c:23:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/misc/lkdtm/core.c:23:
   In file included from include/linux/buffer_head.h:12:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
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
>> drivers/misc/lkdtm/core.c:300:17: error: call to undeclared function 'iov_iter_count'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     300 |         size_t count = iov_iter_count(from);
         |                        ^
>> drivers/misc/lkdtm/core.c:312:7: error: call to undeclared function 'copy_from_iter_full'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     312 |         if (!copy_from_iter_full(buf, count, from)) {
         |              ^
   drivers/misc/lkdtm/core.c:312:7: note: did you mean 'copy_from_user_nofault'?
   include/linux/uaccess.h:377:6: note: 'copy_from_user_nofault' declared here
     377 | long copy_from_user_nofault(void *dst, const void __user *src, size_t size);
         |      ^
   7 warnings and 2 errors generated.


vim +/iov_iter_count +300 drivers/misc/lkdtm/core.c

   295	
   296	/* Special entry to just crash directly. Available without KPROBEs */
   297	static ssize_t direct_entry(struct kiocb *iocb, struct iov_iter *from)
   298	{
   299		const struct crashtype *crashtype;
 > 300		size_t count = iov_iter_count(from);
   301		char *buf;
   302		int err;
   303	
   304		if (count >= PAGE_SIZE)
   305			return -EINVAL;
   306		if (count < 1)
   307			return -EINVAL;
   308	
   309		buf = (char *)__get_free_page(GFP_KERNEL);
   310		if (!buf)
   311			return -ENOMEM;
 > 312		if (!copy_from_iter_full(buf, count, from)) {
   313			free_page((unsigned long) buf);
   314			return -EFAULT;
   315		}
   316		/* NULL-terminate and remove enter */
   317		buf[count] = '\0';
   318		strim(buf);
   319	
   320		crashtype = find_crashtype(buf);
   321		free_page((unsigned long) buf);
   322		if (!crashtype)
   323			return -EINVAL;
   324	
   325		pr_info("Performing direct entry %s\n", crashtype->name);
   326		err = lkdtm_do_action(crashtype);
   327		iocb->ki_pos += count;
   328	
   329		if (err)
   330			return err;
   331		return count;
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
