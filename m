Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF564AEF4;
	Wed, 11 Sep 2024 05:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726032094; cv=none; b=R3WAx78ZMYT743e61P7OKKOW4CHMKG0G2sawiohE7k4OH2/uYZqS8XHbqaopoObowseqnNjL2jHoWknKj2ka3HZiDeumw241vnXChbFnti8W3ilwoCfAkUM9JLs96rnhN+PLqSOdiwPcLZTN7EUQGGE5W+oBW7uBKlw+SHspzL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726032094; c=relaxed/simple;
	bh=ITMeY1ZVZEPebSfmbdgTv1zGbVfVzhTNSHjjlspFwws=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BxPIruMCq2YAjCG2Y4PYg9X2FW6vlTr3AEzIYB8t7L8Dh5AjP7UmPZIxTmziRJf+5MjkTnUQerplZ/DiRvgUZhd0f4Ei3xngnEbSEhbBgoufefMsQ7CyPG6rYLgxWsqhpFgSsWoCORimbQPjIaLg534ybeRqDZMePRrQP3Z28pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zug09CE5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zug09CE5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726032093; x=1757568093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITMeY1ZVZEPebSfmbdgTv1zGbVfVzhTNSHjjlspFwws=;
  b=Zug09CE5t1ZZaJpQWn4m+EXpWFpVRDFBMX35LLmnDMJhmEC+q3a62C8B
   FY2ZAXmpwUMpZe3dNyMwmFSlxseqCIgtfs3pH8Lwxgd3ugZSFboFVBNFb
   5N+42qO9sFbNfDs+hM++N1xxjtObHF+4gFQU2NxAww0X3e621VmicqfGC
   fd+vL+dIGlSpFblDYlA6meXhFiON9F6keLluf7kKUf8SHE6XJfFaZpEIT
   sIH5j7+KtEUZS6iqKKRMDN4z57i6m7YtOrilxIrz+Bq8+c/m2yrzBefEk
   lsdWy4c0McUbjijQU7YDSjejgI/dC3uiZ3jNAEwcDGShun07qJBGiTUzI
   Q==;
X-CSE-ConnectionGUID: JZh2a4vmTNyA9w4i9CJaLA==
X-CSE-MsgGUID: JJh2RLmHQceMTMq0UCajMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35403205"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="35403205"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 22:21:32 -0700
X-CSE-ConnectionGUID: /ktZ4KuBTiOroYO5U0UgLw==
X-CSE-MsgGUID: ybwzuiViTHSElnuLQNAfJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="67535412"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Sep 2024 22:21:31 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soFnE-00034c-2m;
	Wed, 11 Sep 2024 05:21:28 +0000
Date: Wed, 11 Sep 2024 13:21:23 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 9/11] crypto/tpm2_key.c:104: warning:
 expecting prototype for tpm_key_decode(). Prototype was for
 tpm2_key_decode() instead
Message-ID: <202409111302.eEdgJjPF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   79e909153c0a5ac21c2c5c0d4eac9229b3408178
commit: 4585d73c32859de02a0112dec20eb8ab527a912c [9/11] crypto: tpm2_key: Introduce a TPM2 key type
config: i386-buildonly-randconfig-001-20240911 (https://download.01.org/0day-ci/archive/20240911/202409111302.eEdgJjPF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111302.eEdgJjPF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111302.eEdgJjPF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/tpm2_key.c:104: warning: expecting prototype for tpm_key_decode(). Prototype was for tpm2_key_decode() instead


vim +104 crypto/tpm2_key.c

    88	
    89	/**
    90	 * tpm_key_decode() - Decode TPM2 ASN.1 key
    91	 * @src:	ASN.1 source.
    92	 * @src_len:	ASN.1 source length.
    93	 *
    94	 * Decodes the TPM2 ASN.1 key and validates that the public key data has all
    95	 * the shared fields of TPMT_PUBLIC. This is full coverage of the memory that
    96	 * can be validated before doing any key type specific validation.
    97	 *
    98	 * Return:
    99	 * - TPM2 ASN.1 key on success.
   100	 * - -EBADMSG when decoding fails.
   101	 * - -ENOMEM when OOM while allocating struct tpm2_key.
   102	 */
   103	struct tpm2_key *tpm2_key_decode(const u8 *src, u32 src_len)
 > 104	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
