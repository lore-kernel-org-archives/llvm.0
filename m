Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEE143C7D;
	Sat, 17 Aug 2024 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723892740; cv=none; b=HycpVrUH9dR9H3j0ratSfDf8q4UyXnn2cCfMwq06LsDTXHKXQGZWIYKg+MWB6LSHbMAWz/1eipzH7UnZ1Vi5uuWcmBXivUmUfinlqBaNlyJ5qUREwqykwTL2Jrp3MkaFUbTM+TZ27Uu5wvGUHBcAgjoWRdjUvc/GbUt58U9LFRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723892740; c=relaxed/simple;
	bh=jCIQl7z6One45ioeIFFg+pc9bQuJXJMDNpaOFuqu5pk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YrL7DtH783si+f3dILRe5spbzYjHqOygRLAMbJrmCER0zTB6dmN9ATOzvmO9NRd8rJtgKVY9QeDT3q8caz0QCQmpGTu+3z6+eOqNMe2lo6O5Q3xNiOs6521is9I9pqNbxEMNR4rbjJpVB7jM6ioDHLXiafEtyQYUTr74kw5KKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TWD9E6xn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TWD9E6xn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723892738; x=1755428738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jCIQl7z6One45ioeIFFg+pc9bQuJXJMDNpaOFuqu5pk=;
  b=TWD9E6xnF/qWmEduYkdy9NpMm2zL5/T4DJ+Sfm2syKAsSYxv3nik1o1e
   JDy206Q1owcfOlwJmNTZnleUK1enHYhUnbWXQyMNhbv0gXd1wAXBEjTWi
   wvVaTkPsUkZHC+h9ixS6QhxsrUO3RSMNrEcXX6B0rDSJwBbP0/RqqA2xz
   cJMxDbxTxpdi7E0KLLP7XXKsPSkOPBT463Rmyga82WZoFR2cflQ5pbEDy
   WvhOsrtnZBmx9u9cwTojf9Q++5vRr6j1juqLMR/LU7Yvm6K/rAAwkUJpJ
   wQtTz1WilKeFmcZQlaWW1STteGWHOdP7RhzZITJJnnoaNP209jttPh3NZ
   Q==;
X-CSE-ConnectionGUID: lbYxvUfnRo+nAHodOdi/bA==
X-CSE-MsgGUID: qegVUeIqQdyHbv4b0Nqwww==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21812054"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="21812054"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 04:05:35 -0700
X-CSE-ConnectionGUID: bSbdqXn4QoqFSeniGQb40g==
X-CSE-MsgGUID: f796qZZxTtquCGcv1+cpgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; 
   d="scan'208";a="60692197"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Aug 2024 04:05:34 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfHFT-0007Na-1Z;
	Sat, 17 Aug 2024 11:05:31 +0000
Date: Sat, 17 Aug 2024 19:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Roberto Sassu <roberto.sassu@huawei.com>
Subject: [dhowells-fs:pgplib 8/14]
 crypto/asymmetric_keys/pgp_signature.c:26:3: warning: unused variable
 'pgp_pubkey_hash'
Message-ID: <202408171901.P92A9eD1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git pgplib
head:   f5bc37208146cc7ce38c4ad5a403e00904c0b6d2
commit: 4687723ce751ddc2429ed0cbfb2bf1e56658ace5 [8/14] KEYS: PGP-based public key signature verification
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240817/202408171901.P92A9eD1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408171901.P92A9eD1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408171901.P92A9eD1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/pgp_signature.c:26:3: warning: unused variable 'pgp_pubkey_hash' [-Wunused-const-variable]
      26 | } pgp_pubkey_hash[PGP_HASH__LAST] = {
         |   ^~~~~~~~~~~~~~~
   1 warning generated.


vim +/pgp_pubkey_hash +26 crypto/asymmetric_keys/pgp_signature.c

    23	
    24	static const struct {
    25		enum hash_algo algo : 8;
  > 26	} pgp_pubkey_hash[PGP_HASH__LAST] = {
    27		[PGP_HASH_MD5].algo		= HASH_ALGO_MD5,
    28		[PGP_HASH_SHA1].algo		= HASH_ALGO_SHA1,
    29		[PGP_HASH_RIPE_MD_160].algo	= HASH_ALGO_RIPE_MD_160,
    30		[PGP_HASH_SHA256].algo		= HASH_ALGO_SHA256,
    31		[PGP_HASH_SHA384].algo		= HASH_ALGO_SHA384,
    32		[PGP_HASH_SHA512].algo		= HASH_ALGO_SHA512,
    33		[PGP_HASH_SHA224].algo		= HASH_ALGO_SHA224,
    34	};
    35	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
