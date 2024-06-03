Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217BA12B83;
	Mon,  3 Jun 2024 05:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717390981; cv=none; b=Ny2R+zDeB8DPl02t0gNBqjqLPUT+Vtul7KXx/AUiujwsg+pfZpUKP0Ytx3EjNpeAQZP9fUxM9oJnTlMTEtAJO4z9XX3BOa8rjLMfuVdEYfKo9LVk2KP+L8Af0oTj2EK8Zb1Gfl+22HFR8yxVIfkE+dDbR6uCttt02fbVqikSW+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717390981; c=relaxed/simple;
	bh=iTklQgMJScrjnQARr2lJPht09uZlutMwmCs4a/grV5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c9JlNY18w9NsJ44FC2VoQB8SC2QrdGCg+EcEKiNCjVG+z3WCZOIQ1MhHFbZCYfNuU75A0PPuw4tDPcYoRX8szMTwKzF2bvs91YgWPsaGTP0BRh9KP65w3uKBintTseqfXH9HSclS18WFjrgpNKPWKdCiCupPPD0L8cX23KYLNEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjqgKJ4r; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjqgKJ4r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717390979; x=1748926979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iTklQgMJScrjnQARr2lJPht09uZlutMwmCs4a/grV5c=;
  b=WjqgKJ4regZQTTFnangESjYl/NKLlhrXe9r/Dm9TbGPi/wOX8ONw5qjd
   bKPhw/pdT+XSYQBJ/zUXnQIxo0Q/QSbn08ll/F/v7GCxpVYCdnpE2agda
   Ok796Cpo4dDEBlZ7Il8XODvXBFx5bRWKc0UnDdg5pIHWD6fgDp0kdmZ/O
   wvGUJ6teliLPmjxkR/o0148UsIK/Dvu/P+MEJyL29dKD9pZ9XKb+bRufR
   mVmi4eaETz12SdzIcdDVfaEKtPZk7DCWfWPiiuV9HZc4Lugk2G2Csy2n6
   Av7mz6iCAo9bYcSFU9MA7fkvptny0X6EaK944C2HZtIUtdyvqGQj5O6ox
   A==;
X-CSE-ConnectionGUID: iG7NsNttSEKyI0cu+rD/3Q==
X-CSE-MsgGUID: lCe3WJzkTzWwQf+OwX/yzw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="24444842"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="24444842"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2024 22:02:59 -0700
X-CSE-ConnectionGUID: QNaKz4dGRuqb2uNZLPCOtA==
X-CSE-MsgGUID: N4fwfj4jSOufIp3aT1wI8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="36666820"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Jun 2024 22:02:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDzqR-000L2k-1b;
	Mon, 03 Jun 2024 05:02:55 +0000
Date: Mon, 3 Jun 2024 13:01:31 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kent Overstreet <kent.overstreet@linux.dev>
Subject: [bcachefs:bcachefs-testing 60/60] fs/bcachefs/error.c:121:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202406031346.mFOD4vkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   567b09eb98ef6d174e26c491b35ac086f133fa2f
commit: 567b09eb98ef6d174e26c491b35ac086f133fa2f [60/60] bcachefs: Unlock trans when waiting for user input in fsck
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240603/202406031346.mFOD4vkX-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240603/202406031346.mFOD4vkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406031346.mFOD4vkX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/bcachefs/error.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from fs/bcachefs/error.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
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
   In file included from fs/bcachefs/error.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
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
   In file included from fs/bcachefs/error.c:2:
   In file included from fs/bcachefs/bcachefs.h:188:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
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
>> fs/bcachefs/error.c:121:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     121 |                 unsigned long t = unlock_long_at
         |                 ^
   8 warnings generated.


vim +121 fs/bcachefs/error.c

    99	
   100	#ifdef __KERNEL__
   101	static enum ask_yn bch2_fsck_ask_yn(struct bch_fs *c, struct btree_trans *trans)
   102	{
   103		struct stdio_redirect *stdio = c->stdio;
   104	
   105		if (c->stdio_filter && c->stdio_filter != current)
   106			stdio = NULL;
   107	
   108		if (!stdio)
   109			return YN_NO;
   110	
   111		if (trans)
   112			bch2_trans_unlock(trans);
   113	
   114		unsigned long unlock_long_at = trans ? jiffies + HZ * 2 : 0;
   115		darray_char line = {};
   116		int ret;
   117	
   118		do {
   119			bch2_print(c, " (y,n, or Y,N for all errors of this type) ");
   120	rewait:
 > 121			unsigned long t = unlock_long_at
   122				? max_t(long, unlock_long_at - jiffies, 0)
   123				: MAX_SCHEDULE_TIMEOUT;
   124	
   125			int r = bch2_stdio_redirect_readline_timeout(stdio, &line, t);
   126			if (r == -ETIME) {
   127				bch2_trans_unlock_long(trans);
   128				unlock_long_at = 0;
   129				goto rewait;
   130			}
   131	
   132			if (r < 0) {
   133				ret = YN_NO;
   134				break;
   135			}
   136	
   137			darray_last(line) = '\0';
   138		} while ((ret = parse_yn_response(line.data)) < 0);
   139	
   140		darray_exit(&line);
   141		return ret;
   142	}
   143	#else
   144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
