Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0732063FB;
	Fri, 10 Jan 2025 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492233; cv=none; b=mJnrLQtyjoLX71UwDUIGP5ehdxjYZUCcJs5/4+1/nxPQIgybSulzbT9vVGRTiBlGPGBl/OHBx9p5lgR86ZaaKAbi7DQ3NtuasX5BZRoJHoxWA2g6yfyJfbr3WukVSuZ8fX2mYea+YXOL+cda75CFy0L4yD7S3fTRaSSZl2HsRyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492233; c=relaxed/simple;
	bh=k4zDuPnc9OH1cqK/hhlgs6Jp6fcSGAbJ/18qLE2YJ98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J04tJrrpTx7KTeprK9vcD7lMWgmAED4G0FSBtjajXMU+/vUpWBHnGFgdEe8AyxDOM5GMEQC//vLEPBUS/Noond9DpVp6mXfGQp9bm+kaQ8aDSpDCEujMMj40WOFPZUKJ5xCZsnvM561SgTcGebEog72KS5olv8SAPTM68+F6qnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4yfdRUX; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4yfdRUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736492232; x=1768028232;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k4zDuPnc9OH1cqK/hhlgs6Jp6fcSGAbJ/18qLE2YJ98=;
  b=Z4yfdRUXsTBzWa0fRUwYnsyYooWHXEJ+VlKmr66m8ywzybyEC0HuZ8Ui
   HSTUx5HLH9G52SoPXPfV4KUQscRghPi5x95r71+Szcw6xhr91AAEf3Tx3
   I46wMQd3uAcITBbCHWXhI8C6xN3LbDu4hCmMxKnqbstZLs/EiSxGIrN5a
   d6ZVN+pJFeME5uKilxmiqjhWjYvqLNCwOVE3Rx6zM5NVzGo948q8VjoLo
   18JA2vimwzxnDlHgR4ysFPa43pe0fQUCl9V7N/Ricjp+6GO1UN3uBfNtP
   hIq/32Up0OiRdzST+0WyGOwHam0ynYTNDdcZEGA8/ZqnrXCnAoNioWhtb
   Q==;
X-CSE-ConnectionGUID: ZyjYZTJ7RWS+NbRRYCPTfA==
X-CSE-MsgGUID: kbpvLUIuSzmbCDwRIrAUOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40543296"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="40543296"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:57:10 -0800
X-CSE-ConnectionGUID: GcQAEqhmQIygdQNmb7PLsQ==
X-CSE-MsgGUID: QLxLCGKhRL6VzYhyYNuHyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="104174767"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2025 22:57:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW8x7-000IhJ-0l;
	Fri, 10 Jan 2025 06:57:05 +0000
Date: Fri, 10 Jan 2025 14:56:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:crypto-krb5 2/8] crypto/krb5/kdf.c:218:10: warning:
 variable 'mode' is uninitialized when used here
Message-ID: <202501101409.ZJObEJoe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git crypto-krb5
head:   ad756dd9570d147bf6f5b832ac77ae6da3efd9ac
commit: 092f7b11e95df4c84e0628b022e4d59f2b6d5dac [2/8] crypto/krb5: Provide Kerberos 5 crypto through AEAD API
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501101409.ZJObEJoe-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101409.ZJObEJoe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101409.ZJObEJoe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/krb5/kdf.c:14:
   In file included from crypto/krb5/internal.h:8:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> crypto/krb5/kdf.c:218:10: warning: variable 'mode' is uninitialized when used here [-Wuninitialized]
     218 |         switch (mode) {
         |                 ^~~~
   crypto/krb5/kdf.c:208:2: note: variable 'mode' is declared here
     208 |         enum krb5_crypto_mode mode;
         |         ^
   4 warnings generated.


vim +/mode +218 crypto/krb5/kdf.c

   182	
   183	/**
   184	 * krb5_setkey - Use the key material to derive keys
   185	 * @aead: The crypto algorithm context to configure
   186	 * @key: Compound of the key material and config parameters
   187	 * @keylen: Length of @key buffer
   188	 *
   189	 * Use the key material and configuration parameters to derive the appropriate
   190	 * keys for encrypting and/or checksumming.  The key material must be in one of
   191	 * the following formats:
   192	 *
   193	 * Checksummed mode:
   194	 *
   195	 *	KRB5_CHECKSUM_MODE (__be32) || usage (__be32) || transport key data (TK)
   196	 *	KRB5_CHECKSUM_MODE_KC (__be32) || usage (__be32) || Kc
   197	 *
   198	 * Full encryption mode:
   199	 *
   200	 *	KRB5_ENCRYPT_MODE (__be32) || usage (__be32) || transport key data (TK)
   201	 *	KRB5_ENCRYPT_MODE_KEKI (__be32) || usage (__be32) || Ke || Ki
   202	 */
   203	int krb5_setkey(struct crypto_aead *aead, const u8 *key, unsigned int keylen)
   204	{
   205		const struct krb5_enctype *krb5 = crypto_krb5_enctype(aead);
   206		struct krb5_buffer TK, keybuf = {}, Kn;
   207		struct krb5_ctx *ctx = crypto_krb5_ctx(aead);
   208		enum krb5_crypto_mode mode;
   209		gfp_t gfp = GFP_NOFS; // TODO: The crypto API should provide this.
   210		u32 usage;
   211		int ret;
   212	
   213		pr_debug("setkey %x %*phN\n", keylen, keylen, key);
   214	
   215		if (keylen < 12)
   216			return -EINVAL;
   217	
 > 218		switch (mode) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
