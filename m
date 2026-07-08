Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21603B1EC0;
	Wed,  8 Jul 2026 02:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479091; cv=none; b=Ap6ifzvE5zsWSdprGv6we5DOIruG2mBg+KmsiR1JGd30acXKW9dQCr3DH/DxQCoUH8/MmTba9ySq3ARBpd2/Rz9OAKjwNfkdMR/7dndMIq980BSjagKSP3NhcPSP+qwC+lBpfnTk+E3hNWYzCcxn8wSeG28MgEg8C/5LlOVxrFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479091; c=relaxed/simple;
	bh=3TQrBEyrtjaXI3YvI0j/WX6ok6g/pcDWYm3BjomsPpg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iQLv6SD5MCxcxDE0Rt8RDeetP2lUSlNzLX87Lx6duPVz6PLa1S1qRLIOXoosqblJoEofqqvp3SoQDIuvLyvuJnt1c6TVkbrnh9DVahN9b0/q6fCHWupOfF35noclNx5Q5Ew3t2WvlkYyOJXvW77Gxxc6obWBpqoHianvZ+2UYOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gcYrJuaM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gcYrJuaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783479090; x=1815015090;
  h=date:from:to:cc:subject:message-id;
  bh=3TQrBEyrtjaXI3YvI0j/WX6ok6g/pcDWYm3BjomsPpg=;
  b=gcYrJuaMTL7TvWATBJk8r3WFp/ZqDS5EqxXTVXc6IHR7tsEfZgkrpsLG
   E8RfkPv6mp6OsnlRfY/QktqbchyhoOvV4P23p0jdhRHpG+cc3BSHPtcdj
   ceLMETxw+M3BiMjk2eQtRQ+/u7X0mQVV9zBXHV7KXfLZhk1wKmTxI8dO4
   WtyXx+6dFQCBKK16ssv4ZCPGopGD5RdRpvJYxyTg4w078+fl8XgGoDAxz
   BSoJV8bi76OGvKNMWRBH5yNfHD3ojqnFJiq67ES5r3Mx58wqq4wrCULvz
   8gzcEDidDmWkFlGdnpTPLfbCxiUy8BFo4a5ADh6AmaOgtcmikMhYzc3Zm
   g==;
X-CSE-ConnectionGUID: DUucsOHsRIK2QpbtAXUJ+w==
X-CSE-MsgGUID: KNC/tm3RTg6elgdV5ZAHLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71653989"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71653989"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 19:51:25 -0700
X-CSE-ConnectionGUID: Q/sPY6RPRxud/wuOaRf2cQ==
X-CSE-MsgGUID: DnUh8qHSSSKqOV6lz1Sl+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253069967"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Jul 2026 19:51:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whINc-00000000Fwz-37EU;
	Wed, 08 Jul 2026 02:51:20 +0000
Date: Wed, 08 Jul 2026 10:50:22 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:aes-modes-v1 20/33]
 security/keys/trusted-keys/trusted_dcp.c:190:2: error: call to undeclared
 function 'put_unaligned_le32'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202607081028.w8J5w6U9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-modes-v1
head:   d26ef6871f91c259a44fb5a45937efe22313453a
commit: 9ed0ee739ea68cc0eb5a7461066ac3ea3c7d956b [20/33] KEYS: trusted: dcp: Use AES-GCM library instead of crypto_aead
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260708/202607081028.w8J5w6U9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081028.w8J5w6U9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081028.w8J5w6U9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/keys/trusted-keys/trusted_dcp.c:190:2: error: call to undeclared function 'put_unaligned_le32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     190 |         put_unaligned_le32(p->key_len, &b->payload_len);
         |         ^
   1 error generated.


vim +/put_unaligned_le32 +190 security/keys/trusted-keys/trusted_dcp.c

2e8a0f40a39cc2 David Gstir 2024-04-03  158  
2e8a0f40a39cc2 David Gstir 2024-04-03  159  static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablob)
2e8a0f40a39cc2 David Gstir 2024-04-03  160  {
2e8a0f40a39cc2 David Gstir 2024-04-03  161  	struct dcp_blob_fmt *b = (struct dcp_blob_fmt *)p->blob;
2e8a0f40a39cc2 David Gstir 2024-04-03  162  	int blen, ret;
e8d9fab39d1f87 David Gstir 2024-11-13  163  	u8 *plain_blob_key;
2e8a0f40a39cc2 David Gstir 2024-04-03  164  
2e8a0f40a39cc2 David Gstir 2024-04-03  165  	blen = calc_blob_len(p->key_len);
2e8a0f40a39cc2 David Gstir 2024-04-03  166  	if (blen > MAX_BLOB_SIZE)
2e8a0f40a39cc2 David Gstir 2024-04-03  167  		return -E2BIG;
2e8a0f40a39cc2 David Gstir 2024-04-03  168  
e8d9fab39d1f87 David Gstir 2024-11-13  169  	plain_blob_key = kmalloc(AES_KEYSIZE_128, GFP_KERNEL);
e8d9fab39d1f87 David Gstir 2024-11-13  170  	if (!plain_blob_key)
e8d9fab39d1f87 David Gstir 2024-11-13  171  		return -ENOMEM;
e8d9fab39d1f87 David Gstir 2024-11-13  172  
2e8a0f40a39cc2 David Gstir 2024-04-03  173  	b->fmt_version = DCP_BLOB_VERSION;
2e8a0f40a39cc2 David Gstir 2024-04-03  174  	get_random_bytes(b->nonce, AES_KEYSIZE_128);
0e28bf61a5f9ab David Gstir 2024-07-17  175  	get_random_bytes(plain_blob_key, AES_KEYSIZE_128);
2e8a0f40a39cc2 David Gstir 2024-04-03  176  
0e28bf61a5f9ab David Gstir 2024-07-17  177  	ret = do_aead_crypto(p->key, b->payload, p->key_len, plain_blob_key,
2e8a0f40a39cc2 David Gstir 2024-04-03  178  			     b->nonce, true);
2e8a0f40a39cc2 David Gstir 2024-04-03  179  	if (ret) {
2e8a0f40a39cc2 David Gstir 2024-04-03  180  		pr_err("Unable to encrypt blob payload: %i\n", ret);
0e28bf61a5f9ab David Gstir 2024-07-17  181  		goto out;
2e8a0f40a39cc2 David Gstir 2024-04-03  182  	}
2e8a0f40a39cc2 David Gstir 2024-04-03  183  
0e28bf61a5f9ab David Gstir 2024-07-17  184  	ret = encrypt_blob_key(plain_blob_key, b->blob_key);
2e8a0f40a39cc2 David Gstir 2024-04-03  185  	if (ret) {
2e8a0f40a39cc2 David Gstir 2024-04-03  186  		pr_err("Unable to encrypt blob key: %i\n", ret);
0e28bf61a5f9ab David Gstir 2024-07-17  187  		goto out;
2e8a0f40a39cc2 David Gstir 2024-04-03  188  	}
2e8a0f40a39cc2 David Gstir 2024-04-03  189  
6486cad00a8b7f David Gstir 2024-07-17 @190  	put_unaligned_le32(p->key_len, &b->payload_len);
2e8a0f40a39cc2 David Gstir 2024-04-03  191  	p->blob_len = blen;
0e28bf61a5f9ab David Gstir 2024-07-17  192  	ret = 0;
0e28bf61a5f9ab David Gstir 2024-07-17  193  
0e28bf61a5f9ab David Gstir 2024-07-17  194  out:
e8d9fab39d1f87 David Gstir 2024-11-13  195  	memzero_explicit(plain_blob_key, AES_KEYSIZE_128);
e8d9fab39d1f87 David Gstir 2024-11-13  196  	kfree(plain_blob_key);
0e28bf61a5f9ab David Gstir 2024-07-17  197  
0e28bf61a5f9ab David Gstir 2024-07-17  198  	return ret;
2e8a0f40a39cc2 David Gstir 2024-04-03  199  }
2e8a0f40a39cc2 David Gstir 2024-04-03  200  

:::::: The code at line 190 was first introduced by commit
:::::: 6486cad00a8b7f8585983408c152bbe33dda529b KEYS: trusted: fix DCP blob payload length assignment

:::::: TO: David Gstir <david@sigma-star.at>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
