Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C46352009;
	Sat, 12 Sep 2026 06:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789193935; cv=none; b=i+b3O/jxF5Lh+rSL6ppHO+toECpnkV6EjrY6qr2XEr1QK6/b00olqrWGh4dak+ATOk/DSX/STtYFbtYSZI366kDwH62IJJr+AyNuovuzxXsC+iToKFptz48YOwvVusUsslslS+upLVnCrHnLgJ2p3AAk/PU5y37K6sRerRs3Z0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789193935; c=relaxed/simple;
	bh=P1tYDarOcir6PEBPOsOm2RlFjNImIoG9+LDPD6YzKko=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jZpJ/fFw1QbvZ+Jc/b2I0X/K147mtdVzBD59jMyZA7r+JWLl2J6wMU/trMm0UQnTAd5cDzybP6m5zouc6kYcwqvXKd5AhNyBCxLiqXo3XuazxS1Nv20eQvFE7NhOmzATkVYOLX57a9+brdoqRlEFMwU7YsGR7cVjRCe8vatOGyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z0caBn5Y; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z0caBn5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789193934; x=1820729934;
  h=date:from:to:cc:subject:message-id;
  bh=P1tYDarOcir6PEBPOsOm2RlFjNImIoG9+LDPD6YzKko=;
  b=Z0caBn5YGTLPEnhkpY2BNi2YzywtbteqbzZFFJbTw4uqjEXUz9pCTAyT
   XbkiPIOHgC55ucEGFtL5+pZRvzXGHVOgs4EM2ywzV1GNucfxbTDObseDj
   TgyMCNen+3HRJjp6oltYkiK9nHvuWKtDl4vxRzAXzAVuk6FwNgssYSG0s
   cAwVfk611uueEUQqso7D334n6nUn2w4rawEoWN9YimvQLOppEtUEezQaM
   L+pgiVZffgbJ2XCbO0dULaxtkzTGsnN50ATbpJEqX19S6SGvRsIn6zHeU
   fhymwvfN+VXHmqoxtvdWJq1G81BjhVwCZkV4FqBvbhmEPfSiC27oodT7q
   A==;
X-CSE-ConnectionGUID: tBjC3QAwQ5yHKGjw3fxITg==
X-CSE-MsgGUID: qDhaoJGtSKaF39bxQ+hC9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="89676466"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="89676466"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 23:18:50 -0700
X-CSE-ConnectionGUID: zQhYOlR3Qb+gGv9l7vt5tw==
X-CSE-MsgGUID: 96HzOMUkTVKai8KUMoJSqw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Sep 2026 23:18:47 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5H4X-000000002ih-1MBY;
	Sat, 12 Sep 2026 06:18:45 +0000
Date: Sat, 12 Sep 2026 14:18:20 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [clangbuiltlinux:question_mark_operator 1/5]
 fs/smb/server/ndr.c:407:35: error: expected expression
Message-ID: <202609121416.8cSz7Kjw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/ClangBuiltLinux/linux question_mark_operator
head:   532a7ac2d57bb5674f5feffb4ba378f8a32f3bcf
commit: 88621e470e4b70448e9ed374fb028dee3973edd7 [1/5] smb: server: ndr: use try operator ('?') for error propagation
config: i386-buildonly-randconfig-002-20260912 (https://download.01.org/0day-ci/archive/20260912/202609121416.8cSz7Kjw-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609121416.8cSz7Kjw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609121416.8cSz7Kjw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/smb/server/ndr.c:407:35: error: expected expression
     407 |         ndr_write_int16(n, acl->version)?;
         |                                          ^
>> fs/smb/server/ndr.c:407:35: error: expected ':'
     407 |         ndr_write_int16(n, acl->version)?;
         |                                          ^
         |                                          : 
   fs/smb/server/ndr.c:407:34: note: to match this '?'
     407 |         ndr_write_int16(n, acl->version)?;
         |                                         ^
>> fs/smb/server/ndr.c:407:35: error: expected expression
     407 |         ndr_write_int16(n, acl->version)?;
         |                                          ^
   fs/smb/server/ndr.c:408:35: error: expected expression
     408 |         ndr_write_int32(n, acl->version)?;
         |                                          ^
   fs/smb/server/ndr.c:408:35: error: expected ':'
     408 |         ndr_write_int32(n, acl->version)?;
         |                                          ^
         |                                          : 
   fs/smb/server/ndr.c:408:34: note: to match this '?'
     408 |         ndr_write_int32(n, acl->version)?;
         |                                         ^
   fs/smb/server/ndr.c:408:35: error: expected expression
     408 |         ndr_write_int32(n, acl->version)?;
         |                                          ^
   fs/smb/server/ndr.c:409:24: error: expected expression
     409 |         ndr_write_int16(n, 2)?;
         |                               ^
   fs/smb/server/ndr.c:409:24: error: expected ':'
     409 |         ndr_write_int16(n, 2)?;
         |                               ^
         |                               : 
   fs/smb/server/ndr.c:409:23: note: to match this '?'
     409 |         ndr_write_int16(n, 2)?;
         |                              ^
   fs/smb/server/ndr.c:409:24: error: expected expression
     409 |         ndr_write_int16(n, 2)?;
         |                               ^
   fs/smb/server/ndr.c:410:29: error: expected expression
     410 |         ndr_write_int32(n, ref_id)?;
         |                                    ^
   fs/smb/server/ndr.c:410:29: error: expected ':'
     410 |         ndr_write_int32(n, ref_id)?;
         |                                    ^
         |                                    : 
   fs/smb/server/ndr.c:410:28: note: to match this '?'
     410 |         ndr_write_int32(n, ref_id)?;
         |                                   ^
   fs/smb/server/ndr.c:410:29: error: expected expression
     410 |         ndr_write_int32(n, ref_id)?;
         |                                    ^
   fs/smb/server/ndr.c:413:37: error: expected expression
     413 |         ndr_write_int16(n, acl->hash_type)?;
         |                                            ^
   fs/smb/server/ndr.c:413:37: error: expected ':'
     413 |         ndr_write_int16(n, acl->hash_type)?;
         |                                            ^
         |                                            : 
   fs/smb/server/ndr.c:413:36: note: to match this '?'
     413 |         ndr_write_int16(n, acl->hash_type)?;
         |                                           ^
   fs/smb/server/ndr.c:413:37: error: expected expression
     413 |         ndr_write_int16(n, acl->hash_type)?;
         |                                            ^
   fs/smb/server/ndr.c:414:52: error: expected expression
     414 |         ndr_write_bytes(n, acl->hash, XATTR_SD_HASH_SIZE)?;
         |                                                           ^
   fs/smb/server/ndr.c:414:52: error: expected ':'
     414 |         ndr_write_bytes(n, acl->hash, XATTR_SD_HASH_SIZE)?;
         |                                                           ^
         |                                                           : 
   fs/smb/server/ndr.c:414:51: note: to match this '?'
     414 |         ndr_write_bytes(n, acl->hash, XATTR_SD_HASH_SIZE)?;
         |                                                          ^
   fs/smb/server/ndr.c:414:52: error: expected expression
     414 |         ndr_write_bytes(n, acl->hash, XATTR_SD_HASH_SIZE)?;
         |                                                           ^
   fs/smb/server/ndr.c:415:47: error: expected expression
     415 |         ndr_write_bytes(n, acl->desc, acl->desc_len)?;
         |                                                      ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +407 fs/smb/server/ndr.c

   396	
   397	int ndr_encode_v4_ntacl(struct ndr *n, struct xattr_ntacl *acl)
   398	{
   399		unsigned int ref_id = 0x00020004;
   400	
   401		n->offset = 0;
   402		n->length = 2048;
   403		n->data = kzalloc(n->length, KSMBD_DEFAULT_GFP);
   404		if (!n->data)
   405			return -ENOMEM;
   406	
 > 407		ndr_write_int16(n, acl->version)?;
   408		ndr_write_int32(n, acl->version)?;
   409		ndr_write_int16(n, 2)?;
   410		ndr_write_int32(n, ref_id)?;
   411	
   412		/* push hash type and hash 64bytes */
   413		ndr_write_int16(n, acl->hash_type)?;
   414		ndr_write_bytes(n, acl->hash, XATTR_SD_HASH_SIZE)?;
   415		ndr_write_bytes(n, acl->desc, acl->desc_len)?;
   416		ndr_write_int64(n, acl->current_time)?;
   417		ndr_write_bytes(n, acl->posix_acl_hash, XATTR_SD_HASH_SIZE)?;
   418	
   419		/* push ndr for security descriptor */
   420		return ndr_write_bytes(n, acl->sd_buf, acl->sd_size)?;
   421	}
   422	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
