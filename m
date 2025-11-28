Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74EA233704;
	Fri, 28 Nov 2025 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764371803; cv=none; b=NfAnY7xWTPPkYtypcEny4gCB8TetGhfVdH9mmz6oxn4oy6rscEizO58pyofzbKjbMhV42cC+bty+JotYOnp7o7RhYI7s22Xf5OKQEIqGdwl+iLYQp2jV9vMxEB08CKYHT10UO/7wlMaCmT1X+6hMGGNotEDTN+WSKAv2vGNXC5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764371803; c=relaxed/simple;
	bh=AqhBVW3lgRemMSCL+tohgla3BAsL0f4Ptn+KWmAn6e0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nkd24+mXyuxPZifWmNhLvTmjuPlTCcYGZYKLPHq2POPonk+NuSgLQoe1IagpO1E3wxoC1cCxYwicOLXaVIjKjO8f/0Kxf70QlBXOyxtpX7jqd3jF0TXaoiAQE1UjU/JiDrMiojGO3zGyQygH6C/MaUHkdTo+cE6Pay6LceqFb1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ohw5/Psh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ohw5/Psh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764371802; x=1795907802;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AqhBVW3lgRemMSCL+tohgla3BAsL0f4Ptn+KWmAn6e0=;
  b=Ohw5/PshdmbhnN9DTw8GwNQzIaQHExLFWGPDWRZOex1rHFkoSAEhRzOt
   YjSpTQNpMQiWeR0udxuex/Q865FRT09D7QqBNCvZZBDT+E3bTFjYN9OfH
   z5RNt2RUIL7g2DVzhX8Zk+Sos/HAUneIuSx08SgI5Omn+TEVGukitruMY
   HeFfVFH7zf23bbxKQCJA0a05g920m3GbBS4F468bSp88bVU6nkylkTv0a
   YQq5FWNu19knZH3vOSUsc8r3rDq5rdnvyGOQUwGnFd1kO9mdElzUzFv8a
   PtB2IfK/drREDmD6jYBLoLVIEwV0cOLwmwhuB/suLG6uHFP/GTTYZNCWf
   g==;
X-CSE-ConnectionGUID: 8+h+RaByShy8Nm+qluFDSQ==
X-CSE-MsgGUID: +GOtN97TQ/eR9jVmLPkm/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77501568"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="77501568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 15:16:41 -0800
X-CSE-ConnectionGUID: 7kTYFjoQQU6nzzdBsfCmIA==
X-CSE-MsgGUID: LhZTLccITYy2rB7PGxC4cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="193983152"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2025 15:16:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP7hd-000000006o5-3oSO;
	Fri, 28 Nov 2025 23:16:37 +0000
Date: Sat, 29 Nov 2025 07:15:56 +0800
From: kernel test robot <lkp@intel.com>
To: Li Tian <litian@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC] crypto/hkdf: Fix salt length short issue in FIPS mode
Message-ID: <202511290734.V82ilOWk-lkp@intel.com>
References: <20251126134222.22083-1-litian@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126134222.22083-1-litian@redhat.com>

Hi Li,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v6.18-rc7 next-20251128]
[cannot apply to brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Li-Tian/crypto-hkdf-Fix-salt-length-short-issue-in-FIPS-mode/20251126-214458
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20251126134222.22083-1-litian%40redhat.com
patch subject: [PATCH RFC] crypto/hkdf: Fix salt length short issue in FIPS mode
config: arm-randconfig-001-20251129 (https://download.01.org/0day-ci/archive/20251129/202511290734.V82ilOWk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290734.V82ilOWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290734.V82ilOWk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/crypto/hkdf.c:40:31: error: use of undeclared identifier 'HKDF_HASHLEN'
      40 |         static const u8 default_salt[HKDF_HASHLEN];
         |                                      ^
   fs/crypto/hkdf.c:41:9: error: use of undeclared identifier 'HKDF_HASHLEN'
      41 |         u8 prk[HKDF_HASHLEN];
         |                ^
   fs/crypto/hkdf.c:65:9: error: use of undeclared identifier 'HKDF_HASHLEN'
      65 |         u8 tmp[HKDF_HASHLEN];
         |                ^
   fs/crypto/hkdf.c:67:30: error: use of undeclared identifier 'HKDF_HASHLEN'
      67 |         WARN_ON_ONCE(okmlen > 255 * HKDF_HASHLEN);
         |                                     ^
   fs/crypto/hkdf.c:69:44: error: use of undeclared identifier 'HKDF_HASHLEN'
      69 |         for (unsigned int i = 0; i < okmlen; i += HKDF_HASHLEN) {
         |                                                   ^
   fs/crypto/hkdf.c:72:38: error: use of undeclared identifier 'HKDF_HASHLEN'
      72 |                         hmac_sha512_update(&ctx, &okm[i - HKDF_HASHLEN],
         |                                                           ^
   fs/crypto/hkdf.c:73:9: error: use of undeclared identifier 'HKDF_HASHLEN'
      73 |                                            HKDF_HASHLEN);
         |                                            ^
   fs/crypto/hkdf.c:78:20: error: use of undeclared identifier 'HKDF_HASHLEN'
      78 |                 if (okmlen - i < HKDF_HASHLEN) {
         |                                  ^
   8 errors generated.


vim +/HKDF_HASHLEN +40 fs/crypto/hkdf.c

c1144c9b8ad94d8 Eric Biggers    2019-08-04  15  
c1144c9b8ad94d8 Eric Biggers    2019-08-04  16  /*
c1144c9b8ad94d8 Eric Biggers    2019-08-04  17   * HKDF consists of two steps:
c1144c9b8ad94d8 Eric Biggers    2019-08-04  18   *
c1144c9b8ad94d8 Eric Biggers    2019-08-04  19   * 1. HKDF-Extract: extract a pseudorandom key of length HKDF_HASHLEN bytes from
c1144c9b8ad94d8 Eric Biggers    2019-08-04  20   *    the input keying material and optional salt.
c1144c9b8ad94d8 Eric Biggers    2019-08-04  21   * 2. HKDF-Expand: expand the pseudorandom key into output keying material of
c1144c9b8ad94d8 Eric Biggers    2019-08-04  22   *    any length, parameterized by an application-specific info string.
c1144c9b8ad94d8 Eric Biggers    2019-08-04  23   *
c1144c9b8ad94d8 Eric Biggers    2019-08-04  24   * HKDF-Extract can be skipped if the input is already a pseudorandom key of
c1144c9b8ad94d8 Eric Biggers    2019-08-04  25   * length HKDF_HASHLEN bytes.  However, cipher modes other than AES-256-XTS take
c1144c9b8ad94d8 Eric Biggers    2019-08-04  26   * shorter keys, and we don't want to force users of those modes to provide
c1144c9b8ad94d8 Eric Biggers    2019-08-04  27   * unnecessarily long master keys.  Thus fscrypt still does HKDF-Extract.  No
c1144c9b8ad94d8 Eric Biggers    2019-08-04  28   * salt is used, since fscrypt master keys should already be pseudorandom and
c1144c9b8ad94d8 Eric Biggers    2019-08-04  29   * there's no way to persist a random salt per master key from kernel mode.
c1144c9b8ad94d8 Eric Biggers    2019-08-04  30   */
c1144c9b8ad94d8 Eric Biggers    2019-08-04  31  
c1144c9b8ad94d8 Eric Biggers    2019-08-04  32  /*
19591f7e781fd1e Eric Biggers    2025-09-05  33   * Compute HKDF-Extract using 'master_key' as the input keying material, and
19591f7e781fd1e Eric Biggers    2025-09-05  34   * prepare the resulting HMAC key in 'hkdf'.  Afterwards, 'hkdf' can be used for
19591f7e781fd1e Eric Biggers    2025-09-05  35   * HKDF-Expand many times without having to recompute HKDF-Extract each time.
c1144c9b8ad94d8 Eric Biggers    2019-08-04  36   */
19591f7e781fd1e Eric Biggers    2025-09-05  37  void fscrypt_init_hkdf(struct hmac_sha512_key *hkdf, const u8 *master_key,
c1144c9b8ad94d8 Eric Biggers    2019-08-04  38  		       unsigned int master_key_size)
c1144c9b8ad94d8 Eric Biggers    2019-08-04  39  {
3241cd0c6c17919 Hannes Reinecke 2025-02-24 @40  	static const u8 default_salt[HKDF_HASHLEN];
c1144c9b8ad94d8 Eric Biggers    2019-08-04  41  	u8 prk[HKDF_HASHLEN];
c1144c9b8ad94d8 Eric Biggers    2019-08-04  42  
19591f7e781fd1e Eric Biggers    2025-09-05  43  	hmac_sha512_usingrawkey(default_salt, sizeof(default_salt),
19591f7e781fd1e Eric Biggers    2025-09-05  44  				master_key, master_key_size, prk);
19591f7e781fd1e Eric Biggers    2025-09-05  45  	hmac_sha512_preparekey(hkdf, prk, sizeof(prk));
c1144c9b8ad94d8 Eric Biggers    2019-08-04  46  	memzero_explicit(prk, sizeof(prk));
c1144c9b8ad94d8 Eric Biggers    2019-08-04  47  }
c1144c9b8ad94d8 Eric Biggers    2019-08-04  48  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
