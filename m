Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001681EF39E;
	Mon,  4 Aug 2025 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754309230; cv=none; b=P4sEYsAsBSOyG/HmVjCj+/tSYNmJ7BGLj8E+td+u94aBCv92JILhmbXK0bJXsJk0mTCoIOfiL4mUpnFjSX7BUbWUyuuyphjC97u8dsto6kmNJHh73q87FOI2762/jTmLWu+xupnyXtAQNZJPi5bj5fD2hvLT4+bgpMX+1OEuk0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754309230; c=relaxed/simple;
	bh=DOFUdWIrLDJdkVYv5s0szBCINaXIc4Pbo+DOEi82Mb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSAYeWTC9+FdH04qrO7pCWazRBu6TPJMb1sN1WqkI1XCAdUyT1A2a5NkXLZCmEQEAGugDUj8fJJ+l3UWTmrU5zmOtlv1Nzuk+f+yNKY2I6pFyIFDJ7VJJMUg1wn0cIZkpfdb9OETpSwFQZtabZyF6ILB0YPPeGuzftB0d4XXkqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fD2RhiTh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fD2RhiTh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754309229; x=1785845229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DOFUdWIrLDJdkVYv5s0szBCINaXIc4Pbo+DOEi82Mb8=;
  b=fD2RhiThL07SQEkUsp3BtKeuFILH4UkoOPIeOJSYb4XuXQmIv43juZIj
   2V9lvEOTju5aW/Go84J9JMIwkQVDZEIO8OmCLB56kko4ESGNVdq1hgwlb
   SUgme1Dc2PF0qJPKHXyYRrqm1771SngI7l0O8mRRxttPvACTZ5D9zX4dJ
   i/EigYFlBUIS1WhhYcLeTo7GUL/7uH7P/rcJXWnnRTToC2s4fcI7AU+Si
   22xTRrI7hpp9+BPAN+2eWksrOpoKXb+iDwA5lSvZmqswMjYKt/4KBAKCy
   57TsdZqppVf0xK2VsVKwPwQZDhPIrnKvP3fpKB7AHiK1EohkZYAH0x5DI
   Q==;
X-CSE-ConnectionGUID: zjoozd4lRgOdlDwiHaU0IA==
X-CSE-MsgGUID: LMv+sig5QC6W01+xTqUvIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="74156576"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="74156576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 05:07:08 -0700
X-CSE-ConnectionGUID: 6upE90rySxaC0JNUWZ4mfw==
X-CSE-MsgGUID: B4SvMW9xR0OXAlOkXOw1OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="169447976"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Aug 2025 05:07:07 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uity5-00072Q-0o;
	Mon, 04 Aug 2025 12:07:05 +0000
Date: Mon, 4 Aug 2025 20:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-libcrypto-conversions 29/32] ld.lld: error: undefined
 symbol: hmac_md5_init_usingrawkey
Message-ID: <202508041913.a4aVqxlT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-libcrypto-conversions
head:   e34392e8cebe5f0e190ff1425650c593cd77b930
commit: b8eea1ff5f8a4c0efc11d66782a6684ff16baf2b [29/32] smb: server: Use HMAC-MD5 library instead of crypto_shash
config: arm64-randconfig-004-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041913.a4aVqxlT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 8f09b03aebb71c154f3bbe725c29e3f47d37c26e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250804/202508041913.a4aVqxlT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508041913.a4aVqxlT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: hmac_md5_init_usingrawkey
   >>> referenced by auth.c
   >>>               fs/smb/server/auth.o:(ksmbd_auth_ntlmv2) in archive vmlinux.a
   >>> referenced by auth.c
   >>>               fs/smb/server/auth.o:(ksmbd_auth_ntlmv2) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: hmac_md5_usingrawkey
   >>> referenced by auth.c
   >>>               fs/smb/server/auth.o:(ksmbd_auth_ntlmv2) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
