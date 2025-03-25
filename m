Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCD123A563;
	Tue, 25 Mar 2025 23:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742946955; cv=none; b=npFQnqsP/s22sYBD8RR2tgdrNLhsWYSuV2Z90xAaZIQJJwm3HbK1XO23B6aOg2TCb+3yQxVW/MPLLuk8SiiAgV5t1yxDSL3aQGVkAyh4XcWgHZ3EvLYGWW0L2FXu6B3PJWOHRzZNf3nAO2smz1b4LQbPnRPGV3jTlE+z5ovDA70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742946955; c=relaxed/simple;
	bh=z7HoTnhGW1pjczak6MKNvrbSCSHoUahswbUyv5Okgcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1ACGEyJyBmgIFg/Q9J+GHLz9QTauILi9Y3mToXlB8feR3CL72McF+SAaRc910Gfwo/nsA8PN2gCkqLrZkjO8E+0VJPRtGWbSEy9POB9lSLWLJGfssZ3rI5wknvVH52UiQ7wnUMVB0HziJ1mMqqB515ty3g0oR5fM+6tdU06PMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMahqHHq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMahqHHq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742946954; x=1774482954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z7HoTnhGW1pjczak6MKNvrbSCSHoUahswbUyv5Okgcw=;
  b=LMahqHHqG6jEmur90y9g1NJwzDhRR2GjpM7CmszQTXt+ek+RhWgMJSed
   vg6dLnaW1aeXQelYMjlTA55dFwEE8rh+pcxdsdqFPiza/CNzxHzYjXMCd
   hXtiXGsnhqdHJNfJJF+KzMHtPFN6+bT8et6v5d2SXYBF/fcevEQcWYqqQ
   OksxaK5tlkOVQIvU20vx6gwJZT5ybyotaz1ZqJtqzM/PgziIBXdwiHeNB
   6aKmfVnSj0Dc7KwRtv04h8DGADICcan70Enui8cWci2/uA9nE16l1QZjT
   BU0m8Nu2XFGMUtXRGn/5qUCEOYqZJllp6iafa0Gt8WKpNkCTkkOBg1TPP
   w==;
X-CSE-ConnectionGUID: 5Q5VR1gSRxG8tZawEFKc2w==
X-CSE-MsgGUID: HBMWza7HRKi0GDp5H4ZQaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55583785"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="55583785"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 16:55:53 -0700
X-CSE-ConnectionGUID: 7krFlAy+T/Sl0X1oxSfumA==
X-CSE-MsgGUID: U4u9R2dCSYaJwhNpgeZfZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="124334105"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2025 16:55:51 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txE7Y-0005Jb-2k;
	Tue, 25 Mar 2025 23:55:48 +0000
Date: Wed, 26 Mar 2025 07:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/2] wcslen() prototype in string.h
Message-ID: <202503260611.MDurOUhF-lkp@intel.com>
References: <20250325-string-add-wcslen-for-llvm-opt-v1-2-b8f1e2c17888@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-string-add-wcslen-for-llvm-opt-v1-2-b8f1e2c17888@kernel.org>

Hi Nathan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 78ab93c78fb31c5dfe207318aa2b7bd4e41f8dba]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Chancellor/lib-string-c-Add-wcslen/20250325-234847
base:   78ab93c78fb31c5dfe207318aa2b7bd4e41f8dba
patch link:    https://lore.kernel.org/r/20250325-string-add-wcslen-for-llvm-opt-v1-2-b8f1e2c17888%40kernel.org
patch subject: [PATCH RFC 2/2] wcslen() prototype in string.h
config: s390-randconfig-001-20250326 (https://download.01.org/0day-ci/archive/20250326/202503260611.MDurOUhF-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503260611.MDurOUhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503260611.MDurOUhF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/boot/ipl_data.c:3:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:10:
>> include/linux/nls.h:101:34: warning: passing 'char[6]' to parameter of type 'unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
           charlen = codepage->uni2char(0, tmp, NLS_MAX_CHARSET_SIZE);
                                           ^~~
   1 warning generated.
--
   In file included from arch/s390/boot/decompressor.c:11:
   In file included from include/linux/string.h:10:
>> include/linux/nls.h:101:34: warning: passing 'char[6]' to parameter of type 'unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
           charlen = codepage->uni2char(0, tmp, NLS_MAX_CHARSET_SIZE);
                                           ^~~
   In file included from arch/s390/boot/decompressor.c:48:
   arch/s390/include/uapi/../../../../lib/decompress_unlz4.c:160:29: warning: passing 'u8 *' (aka 'unsigned char *') to parameter of type 'const char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
                   ret = LZ4_decompress_fast(inp, outp, dest_len);
                                             ^~~
   arch/s390/include/uapi/../../../../lib/lz4/lz4_decompress.c:477:37: note: passing argument to parameter 'source' here
   int LZ4_decompress_fast(const char *source, char *dest, int originalSize)
                                       ^
   In file included from arch/s390/boot/decompressor.c:48:
   arch/s390/include/uapi/../../../../lib/decompress_unlz4.c:160:34: warning: passing 'u8 *' (aka 'unsigned char *') to parameter of type 'char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
                   ret = LZ4_decompress_fast(inp, outp, dest_len);
                                                  ^~~~
   arch/s390/include/uapi/../../../../lib/lz4/lz4_decompress.c:477:51: note: passing argument to parameter 'dest' here
   int LZ4_decompress_fast(const char *source, char *dest, int originalSize)
                                                     ^
   3 warnings generated.


vim +101 include/linux/nls.h

^1da177e4c3f41 Linus Torvalds 2005-04-16   86  
d37dc42ab6f040 Jeff Layton    2009-04-30   87  /*
d37dc42ab6f040 Jeff Layton    2009-04-30   88   * nls_nullsize - return length of null character for codepage
d37dc42ab6f040 Jeff Layton    2009-04-30   89   * @codepage - codepage for which to return length of NULL terminator
d37dc42ab6f040 Jeff Layton    2009-04-30   90   *
d37dc42ab6f040 Jeff Layton    2009-04-30   91   * Since we can't guarantee that the null terminator will be a particular
d37dc42ab6f040 Jeff Layton    2009-04-30   92   * length, we have to check against the codepage. If there's a problem
d37dc42ab6f040 Jeff Layton    2009-04-30   93   * determining it, assume a single-byte NULL terminator.
d37dc42ab6f040 Jeff Layton    2009-04-30   94   */
d37dc42ab6f040 Jeff Layton    2009-04-30   95  static inline int
d37dc42ab6f040 Jeff Layton    2009-04-30   96  nls_nullsize(const struct nls_table *codepage)
d37dc42ab6f040 Jeff Layton    2009-04-30   97  {
d37dc42ab6f040 Jeff Layton    2009-04-30   98  	int charlen;
d37dc42ab6f040 Jeff Layton    2009-04-30   99  	char tmp[NLS_MAX_CHARSET_SIZE];
d37dc42ab6f040 Jeff Layton    2009-04-30  100  
d37dc42ab6f040 Jeff Layton    2009-04-30 @101  	charlen = codepage->uni2char(0, tmp, NLS_MAX_CHARSET_SIZE);
d37dc42ab6f040 Jeff Layton    2009-04-30  102  
d37dc42ab6f040 Jeff Layton    2009-04-30  103  	return charlen > 0 ? charlen : 1;
d37dc42ab6f040 Jeff Layton    2009-04-30  104  }
d37dc42ab6f040 Jeff Layton    2009-04-30  105  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
