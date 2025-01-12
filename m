Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1DCA41;
	Sun, 12 Jan 2025 03:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736654324; cv=none; b=HyJUWLKFz1Y6jxT2BvIpQEYTVE0NIgik+b5GC+PFewH5nWsnjmkk2VqZ7NY9J01+5rHq7F48oXGg5gEY3v1XPH3xBiEX++bAFOSrha6YvilS/6+UioktKLjtxQ9RBtO18giJ8y38TueiBfgD+twTfC+xWjtutY9f479u8f4Imqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736654324; c=relaxed/simple;
	bh=yRtSHR5ikPqwnpRlqXQpXe4Ph+gt9b0jfyDRqRdKI9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VgnTopVsX1sIpUg2jrXMUYhcy2StOw4pJb//cLS3P1stAPEdcHujhcWKyX/9G40q6CGKWPbgSkag+w0VYBVuBp8mV9NWokySkkPCuYA7VNvLYTnuyw7MiJgkd6e53mHRFTkGs/7y675tk5u0tJH9stFaiEzq+kzlBZz35CQDpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCBazJc0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCBazJc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736654323; x=1768190323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yRtSHR5ikPqwnpRlqXQpXe4Ph+gt9b0jfyDRqRdKI9U=;
  b=SCBazJc0asQNjBeqrjuD9EIV5ZtR4Rb9jd0hrUTGJQkwgQhS4qt6R+L7
   I3QcAsYqzGRf5GlmOipaprSknT3ZKZXM+XCfugbRAcCojmyAGsIdzB7hC
   pdepuc8G3htACidhV8vuHXk76U5hTrOAut+9m4ljckstweesO0OdQ72PC
   veW1yRaROX0lU0mNyqvTOspTYIxI9lpNgZ2x1sn5hdvH0UxgVSLJ5skOr
   UmJGIiNaVbWEg0liLXy89gtLoRpUivjn+tz2+Cgmpkp8TC2rx0juYbU0h
   ms3KYTQcoOHDd6wQRbePj0K3z6YBSTslwvXgH6Ner0ZrVXDtHZ40SdMSZ
   g==;
X-CSE-ConnectionGUID: JOIh9cXiS26dO7ZI2LeIPg==
X-CSE-MsgGUID: 7hRyjTnbRtyjM8UjwI6rWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11312"; a="36123569"
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="36123569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 19:58:42 -0800
X-CSE-ConnectionGUID: sYu/AdrpR76DghNnyBPB6Q==
X-CSE-MsgGUID: I7EEJwnDSP62Ej5xe4brYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,308,1728975600"; 
   d="scan'208";a="104039852"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jan 2025 19:58:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWp7W-000LYR-0W;
	Sun, 12 Jan 2025 03:58:38 +0000
Date: Sun, 12 Jan 2025 11:58:38 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [driver-core:driver-core-next 16/68] rust/helpers/io.c:12:10: error:
 passing 'volatile void *' to parameter of type 'void *' discards qualifiers
Message-ID: <202501121150.MkxnT13y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git driver-core-next
head:   8ff656643d3075154419680470dbfdbd6092e31f
commit: ce30d94e6855a4f6dc687f658e63c225fcc1d690 [16/68] rust: add `io::{Io, IoRaw}` base types
config: um-randconfig-001-20250112 (https://download.01.org/0day-ci/archive/20250112/202501121150.MkxnT13y-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250112/202501121150.MkxnT13y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501121150.MkxnT13y-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 20.0.0
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/um/include/asm/cacheflush.h:4:
   In file included from arch/um/include/asm/tlbflush.h:9:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from rust/helpers/helpers.c:17:
>> rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
      12 |         iounmap(addr);
         |                 ^~~~
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
      19 | static inline void iounmap(void __iomem *addr)
         |                                          ^
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:194: rust/helpers/helpers.o] Error 1 shuffle=1529487087
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>> rust/helpers/io.c:12:10: error: passing 'volatile void *' to parameter of type 'void *' discards qualifiers [-Wincompatible-pointer-types-discards-qualifiers]
   arch/um/include/asm/io.h:19:42: note: passing argument to parameter 'addr' here
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   make[3]: *** [rust/Makefile:330: rust/bindings/bindings_helpers_generated.rs] Error 101 shuffle=1529487087
   make[3]: *** Deleting file 'rust/bindings/bindings_helpers_generated.rs'
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1269: prepare] Error 2 shuffle=1529487087
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1529487087
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1529487087
   make: Target 'prepare' not remade because of errors.


vim +12 rust/helpers/io.c

     9	
    10	void rust_helper_iounmap(volatile void __iomem *addr)
    11	{
  > 12		iounmap(addr);
    13	}
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
