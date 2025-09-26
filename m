Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4412D17BA6;
	Fri, 26 Sep 2025 21:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758922821; cv=none; b=bK9Xmvd8HiExrtwNu6O+eIZSULNs0yPeUjgMe5qNghXO++ZjTWEi1PAqdAD6HoSaUvjZWBNfdvf9pgcVnBKa5gQMG836N1i7oHdRoN2++F2h8ZVxrPO621leoLMNIETBOpbdvzV2TZfqnaEVCxjgHN7PTYGyTIJd9QSn9d5dcK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758922821; c=relaxed/simple;
	bh=HTMrFfbdexGGFOIPDz8kMWhvTPiwWRPFIiygeGvtT70=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V1Ngf89H6OGWtc3gGH+qXdFi5heY9XXDnqbTknopZPkrkcx3FosKBBgvvojlfa4k8SeWy+7HILjKZ9bokO3LPdz/C22MCZZWs/USEr1KXGtp+e+6KfBawRAwV6YMAH0BLYm75YES/V36wFbU0GTPq9+OiMma2uFJMbOJ3lFIpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ira3mNt4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ira3mNt4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758922820; x=1790458820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HTMrFfbdexGGFOIPDz8kMWhvTPiwWRPFIiygeGvtT70=;
  b=Ira3mNt4b6aXZ5pHoknAZyDe1R0THNLOwFp7gjlR1tGEIPUjbon5okBj
   Vz7xDCuhg4KnYkgaXh6RS0O+XfGdNBPeADlYdJkE6ovvtLfHo510jyqtN
   nj6ROnUKulKY0NUc2cpXGaoYqjlUDUJrcJvNVNbX6hRbNDCDqxVz7hmJb
   YE9HMm7o9+Aki2YpCnPNBW9hUT57kKMByx6uY+0dq4nDsMzpD60OYLGNa
   fNfhcqz97XqF5+ILzAu0EQ3BaXH2SxagxAZE4WIYVGZV0otPVe0uUvJs/
   as/Dmqkvii7ZUDI50hBoxZm46lOr5CcwjFD7bP7mbKNSHgQl1GZRAjmqW
   Q==;
X-CSE-ConnectionGUID: cSuWVsijTNGFM0dtBjyj9g==
X-CSE-MsgGUID: uwANuiUTSOSp4Pp1m5v0dQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11565"; a="64893451"
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="64893451"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 14:40:08 -0700
X-CSE-ConnectionGUID: eMo+ZZ61RXua3v+7gH+zFQ==
X-CSE-MsgGUID: dkD0ysR7SqC14W3oEcEg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,296,1751266800"; 
   d="scan'208";a="178121829"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2025 14:40:06 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2GAe-0006d5-0t;
	Fri, 26 Sep 2025 21:40:04 +0000
Date: Sat, 27 Sep 2025 05:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/8] arch/arm64/crypto/sha3-ce-glue.c:55:32:
 error: no member named 'state' in 'struct sha3_ctx'
Message-ID: <202509270506.x3F9O4sW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e623bce62b0197fce10bf035258ffa2692c4dfb0
commit: 72d12953ba5b3ba350c186fd4682087828b0316f [6/8] crypto/sha3: Use lib/crypto/sha3
config: arm64-randconfig-003-20250927 (https://download.01.org/0day-ci/archive/20250927/202509270506.x3F9O4sW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project cafc064fc7a96b3979a023ddae1da2b499d6c954)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509270506.x3F9O4sW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509270506.x3F9O4sW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/crypto/sha3-ce-glue.c:55:32: error: no member named 'state' in 'struct sha3_ctx'
      55 |                 rem = sha3_ce_transform(ctx->state.st, data, blocks, ds);
         |                                         ~~~  ^
>> arch/arm64/crypto/sha3-ce-glue.c:82:20: error: use of undeclared identifier 'sctx'; did you mean 'ctx'?
      82 |         sha3_ce_transform(sctx->state.st, block, 1, ds);
         |                           ^~~~
         |                           ctx
   arch/arm64/crypto/sha3-ce-glue.c:66:19: note: 'ctx' declared here
      66 |         struct sha3_ctx *ctx = crypto_sha3_desc(desc);
         |                          ^
   arch/arm64/crypto/sha3-ce-glue.c:82:26: error: no member named 'state' in 'struct sha3_ctx'
      82 |         sha3_ce_transform(sctx->state.st, block, 1, ds);
         |                           ~~~~  ^
   arch/arm64/crypto/sha3-ce-glue.c:87:22: error: use of undeclared identifier 'sctx'; did you mean 'ctx'?
      87 |                 put_unaligned_le64(sctx->state.st[i], digest++);
         |                                    ^~~~
         |                                    ctx
   arch/arm64/crypto/sha3-ce-glue.c:66:19: note: 'ctx' declared here
      66 |         struct sha3_ctx *ctx = crypto_sha3_desc(desc);
         |                          ^
   arch/arm64/crypto/sha3-ce-glue.c:87:28: error: no member named 'state' in 'struct sha3_ctx'
      87 |                 put_unaligned_le64(sctx->state.st[i], digest++);
         |                                    ~~~~  ^
   arch/arm64/crypto/sha3-ce-glue.c:90:22: error: use of undeclared identifier 'sctx'; did you mean 'ctx'?
      90 |                 put_unaligned_le32(sctx->state.st[i], (__le32 *)digest);
         |                                    ^~~~
         |                                    ctx
   arch/arm64/crypto/sha3-ce-glue.c:66:19: note: 'ctx' declared here
      66 |         struct sha3_ctx *ctx = crypto_sha3_desc(desc);
         |                          ^
   arch/arm64/crypto/sha3-ce-glue.c:90:28: error: no member named 'state' in 'struct sha3_ctx'
      90 |                 put_unaligned_le32(sctx->state.st[i], (__le32 *)digest);
         |                                    ~~~~  ^
   7 errors generated.


vim +55 arch/arm64/crypto/sha3-ce-glue.c

    35	
    36	asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
    37					 int md_len);
    38	
    39	static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
    40			       unsigned int len)
    41	{
    42		struct sha3_ctx *ctx = crypto_sha3_desc(desc);
    43		struct crypto_shash *tfm = desc->tfm;
    44		unsigned int bs, ds;
    45		int blocks;
    46	
    47		ds = crypto_shash_digestsize(tfm);
    48		bs = crypto_shash_blocksize(tfm);
    49		blocks = len / bs;
    50		len -= blocks * bs;
    51		do {
    52			int rem;
    53	
    54			kernel_neon_begin();
  > 55			rem = sha3_ce_transform(ctx->state.st, data, blocks, ds);
    56			kernel_neon_end();
    57			data += (blocks - rem) * bs;
    58			blocks = rem;
    59		} while (blocks);
    60		return len;
    61	}
    62	
    63	static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
    64				    u8 *out)
    65	{
    66		struct sha3_ctx *ctx = crypto_sha3_desc(desc);
    67		struct crypto_shash *tfm = desc->tfm;
    68		__le64 *digest = (__le64 *)out;
    69		u8 block[SHA3_224_BLOCK_SIZE];
    70		unsigned int bs, ds;
    71		int i;
    72	
    73		ds = crypto_shash_digestsize(tfm);
    74		bs = crypto_shash_blocksize(tfm);
    75		memcpy(block, src, len);
    76	
    77		block[len++] = 0x06;
    78		memset(block + len, 0, bs - len);
    79		block[bs - 1] |= 0x80;
    80	
    81		kernel_neon_begin();
  > 82		sha3_ce_transform(sctx->state.st, block, 1, ds);
    83		kernel_neon_end();
    84		memzero_explicit(block , sizeof(block));
    85	
    86		for (i = 0; i < ds / 8; i++)
    87			put_unaligned_le64(sctx->state.st[i], digest++);
    88	
    89		if (ds & 4)
    90			put_unaligned_le32(sctx->state.st[i], (__le32 *)digest);
    91	
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
