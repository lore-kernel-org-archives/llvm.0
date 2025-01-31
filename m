Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F697081F;
	Fri, 31 Jan 2025 21:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359625; cv=none; b=XGEQEOkuaUO1lPpKpdBQeQen7cuXQ+TzEIrT1A5POla8AwhCCnkhZlRY6x2fHmjT2FIjFrCmt3KrJ6dnb9C9wJlUCbS+8HPsTS4Kc1YzaozuXCxvQRriD/sHpo1yIfSVjTnCLCMuu1wrldO4JGJWg79AAHVlUF8DkHdVGkaVjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359625; c=relaxed/simple;
	bh=9vYqqpZzm0LVzazmvzqC2RYIYydepZeqFB82Og+c4NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kwm+jgUwZwLSAKUXZBqF6SGAyKDpznwMMy1dleFA7HPplmVtBFXA8nxzLHLmw8AbADaZHbqt2/uZnZO+UTmB4R3VMoMiTiizfEKXn4zdAuj2BF3ksaKCRRgwDp+ay70+ysAs1YOr8V3sN6j0SkGu255ETYN05CVCyS4QCM/VRUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Saru8n+N; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Saru8n+N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738359623; x=1769895623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9vYqqpZzm0LVzazmvzqC2RYIYydepZeqFB82Og+c4NQ=;
  b=Saru8n+NCoGOSnv86CipraqmD7j5iRA1ht09/9xwsMHOKD1D6/fkLNdM
   NvpTZ6uksFhLdEZSF6rjRd4fZditW0iNWR2s4Q56xaTcSlFZvXx6GRAHW
   NvV1+jX8N+IjDC1QQYjGDke71mnObnAjw6/IvcO2t3i2HZGIsX739k88L
   c6tWW9HDMNyFBA2p8Uqk6qefxC9sm2Cm7Z4pQgdCDbaAqxryhOiINRSBX
   R39ouBXpn3CkBlby6MTRfhAPLcdLLMbEm3beGFSfbO8yRP74vXK0/bk6Y
   +/hVV7Czif+mJraj5ETs8ntlfiKUm6bwyvfYPcIbguP/dCnkVTxiRPZIu
   A==;
X-CSE-ConnectionGUID: YXe/Ga0ZTMmsmZYc2ppxtg==
X-CSE-MsgGUID: wtJF6axBQzeZHOWc4PmcDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="39094996"
X-IronPort-AV: E=Sophos;i="6.13,249,1732608000"; 
   d="scan'208";a="39094996"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 13:40:22 -0800
X-CSE-ConnectionGUID: PH3uJuM4RZqjqK/3NpLt2w==
X-CSE-MsgGUID: 5N9CkR5qRSuOpRSEpSlQRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109576766"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 31 Jan 2025 13:40:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdykM-000nFx-2u;
	Fri, 31 Jan 2025 21:40:18 +0000
Date: Sat, 1 Feb 2025 05:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 33/33] ld.lld: error: undefined symbol:
 rxgk_kernel_respond_to_challenge
Message-ID: <202502010542.hW3K2y57-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   3108d67c535aa3ea00a95b1daf8efdc15bb074b4
commit: 3108d67c535aa3ea00a95b1daf8efdc15bb074b4 [33/33] afs: Use rxgk RESPONSE to pass token for callback channel
config: x86_64-buildonly-randconfig-005-20250131 (https://download.01.org/0day-ci/archive/20250201/202502010542.hW3K2y57-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502010542.hW3K2y57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502010542.hW3K2y57-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rxgk_kernel_respond_to_challenge
   >>> referenced by cm_security.c:57 (fs/afs/cm_security.c:57)
   >>>               vmlinux.o:(afs_respond_to_challenge)
--
>> ld.lld: error: undefined symbol: crypto_krb5_find_enctype
   >>> referenced by cm_security.c:87 (fs/afs/cm_security.c:87)
   >>>               vmlinux.o:(afs_create_token_key)
   >>> referenced by cm_security.c:139 (fs/afs/cm_security.c:139)
   >>>               vmlinux.o:(afs_create_cm_token)
--
>> ld.lld: error: undefined symbol: crypto_krb5_how_much_buffer
   >>> referenced by cm_security.c:173 (fs/afs/cm_security.c:173)
   >>>               vmlinux.o:(afs_create_cm_token)
--
>> ld.lld: error: undefined symbol: crypto_krb5_prepare_encryption
   >>> referenced by cm_security.c:255 (fs/afs/cm_security.c:255)
   >>>               vmlinux.o:(afs_create_cm_token)
--
>> ld.lld: error: undefined symbol: crypto_krb5_encrypt
   >>> referenced by cm_security.c:263 (fs/afs/cm_security.c:263)
   >>>               vmlinux.o:(afs_create_cm_token)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
