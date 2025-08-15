Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63701DFE0B;
	Fri, 15 Aug 2025 16:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755275335; cv=none; b=aBZ26C+Bz/Gch+Np3vbKGwySyMtAkwLE6WXKEKtmbQ2x3g434hLIliLTDv3B/t5q2DPSSNW+ZG2Ur870FrcO5rVGSNYbs+fdN+B8jD+Mypoxl3zEke2+DjBxiXlWPzvr81hwj7x5UCwDBdAdTVCYcbNY9RfythQfeZHiymf5O2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755275335; c=relaxed/simple;
	bh=j3856BigBgLUANAmyzUYbpW2sqlTdCYRbnaDKaDtuZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KrHuZrrw71z2q5hlh9P5XFTQLSwJ8B5ugPDD6MXUSTsUemzJvvtwadrXGtgL/8r1gtJ/ZwER3NkPWE0+3LskOviXfWe/99Y5zOMqi0DgfoaRv5AE/WMY83WLrAQAbJSXxx7KumK+FZOhhJsH5Zis3p3v+3gvFlnl9d+fZnUZMiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AHy4kDBc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AHy4kDBc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755275334; x=1786811334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j3856BigBgLUANAmyzUYbpW2sqlTdCYRbnaDKaDtuZE=;
  b=AHy4kDBcjngjtZRU3qSTuaCu056bTmEMy7NT8Jm5Boq128nAUvCbxYbE
   TSGyoCUtNSRCBkifSBa8dXlrgmwn3HmZrEP0teSaJHIqUngyICKvG/n1o
   xvUDnVSadnBEn9rB9piQ9S3aZe1WOyi9wSNW3BVqYNF4S/pTA7TzkBBIn
   Qa6yxj471LxX64cCTBSlVBJaC2iF29nDROweJupkOgRRC6A2ML9Rvc+u7
   fY9sgQ2ahRnATC2ceRytg/vbWaoYqI7eTOkig4GB+sT4Lrs2dsj5VDgOE
   qSD4ddCi4pK3TbN2iCasRWhNOemFoYatjooT7JGcoGlpvCW9+BsdodPeK
   Q==;
X-CSE-ConnectionGUID: Miilr1BbS2Cz2XUALyGWAQ==
X-CSE-MsgGUID: aKK/lIsMSTSS/tzaD5lTUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57508220"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57508220"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 09:28:53 -0700
X-CSE-ConnectionGUID: XxoD0pLJR6KHBjNY1tr6MQ==
X-CSE-MsgGUID: X9NPm4lnQQ6lNmH2dg31xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="204225110"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Aug 2025 09:28:52 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umxIO-000C7U-2A;
	Fri, 15 Aug 2025 16:28:48 +0000
Date: Sat, 16 Aug 2025 00:28:00 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>
Subject: [brauner-github:vfs-6.18.iomap 1/1] fs/iomap/direct-io.c:281:29:
 error: call to undeclared function 'largest_zero_folio'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202508160053.vMCqzF47-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs-6.18.iomap
head:   5589673e8d8d31ff2cec82181676c510e5afdb8d
commit: 5589673e8d8d31ff2cec82181676c510e5afdb8d [1/1] iomap: use largest_zero_folio() in iomap_dio_zero()
config: hexagon-randconfig-001-20250815 (https://download.01.org/0day-ci/archive/20250816/202508160053.vMCqzF47-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508160053.vMCqzF47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508160053.vMCqzF47-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/iomap/direct-io.c:281:29: error: call to undeclared function 'largest_zero_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     281 |         struct folio *zero_folio = largest_zero_folio();
         |                                    ^
   fs/iomap/direct-io.c:281:29: note: did you mean 'is_zero_folio'?
   include/linux/mm.h:1926:20: note: 'is_zero_folio' declared here
    1926 | static inline bool is_zero_folio(const struct folio *folio)
         |                    ^
>> fs/iomap/direct-io.c:281:16: error: incompatible integer to pointer conversion initializing 'struct folio *' with an expression of type 'int' [-Wint-conversion]
     281 |         struct folio *zero_folio = largest_zero_folio();
         |                       ^            ~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/largest_zero_folio +281 fs/iomap/direct-io.c

   275	
   276	static int iomap_dio_zero(const struct iomap_iter *iter, struct iomap_dio *dio,
   277			loff_t pos, unsigned len)
   278	{
   279		struct inode *inode = file_inode(dio->iocb->ki_filp);
   280		struct bio *bio;
 > 281		struct folio *zero_folio = largest_zero_folio();
   282		int nr_vecs = max(1, i_blocksize(inode) / folio_size(zero_folio));
   283	
   284		if (!len)
   285			return 0;
   286	
   287		/*
   288		 * This limit shall never be reached as most filesystems have a
   289		 * maximum blocksize of 64k.
   290		 */
   291		if (WARN_ON_ONCE(nr_vecs > BIO_MAX_VECS))
   292			return -EINVAL;
   293	
   294		bio = iomap_dio_alloc_bio(iter, dio, nr_vecs,
   295					  REQ_OP_WRITE | REQ_SYNC | REQ_IDLE);
   296		fscrypt_set_bio_crypt_ctx(bio, inode, pos >> inode->i_blkbits,
   297					  GFP_KERNEL);
   298		bio->bi_iter.bi_sector = iomap_sector(&iter->iomap, pos);
   299		bio->bi_private = dio;
   300		bio->bi_end_io = iomap_dio_bio_end_io;
   301	
   302		while (len > 0) {
   303			unsigned int io_len = min(len, folio_size(zero_folio));
   304	
   305			bio_add_folio_nofail(bio, zero_folio, io_len, 0);
   306			len -= io_len;
   307		}
   308		iomap_dio_submit_bio(iter, dio, bio, pos);
   309	
   310		return 0;
   311	}
   312	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
