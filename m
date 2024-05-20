Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B914285;
	Mon, 20 May 2024 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716200722; cv=none; b=aWhaPaOp3S+fE633Y8q7Sw1ZoAQd7lE2lSOG9eWWHEjIpf64ODddX6dB+f9DAytat1Bw3NQDPl3a6sHstK+zlNVUm9EtmicNcVnmv0SXBRA8K/xoLOiIR8rCZOVkYhteWnbtdYSySRcaITthyc8IQ2dJO/4OA9q8URi5iBLdWQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716200722; c=relaxed/simple;
	bh=mQPTPuKp598QH7To7pU21XHUfs+B8WyZ/a2rQ+6wUc0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqI2PMeu0H+cd240R6lzuhjUyCw4OnhXHpo52GXaYaqTsTSyc9Su0IP9OpBO/I+CqnMeGgi4vQZ1qnqcQHbPQfLc3VmBjO+y3bOTKiHakx24KD4lXFqalckx8Sv17+tD7b/xpOb91bXXRvkt8JaJ2ecAg/jKnJAyf+SZZv9s08k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DgDL+Hln; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgDL+Hln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716200721; x=1747736721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mQPTPuKp598QH7To7pU21XHUfs+B8WyZ/a2rQ+6wUc0=;
  b=DgDL+Hlnj1DGsP6xUNU5iUIiFxPm9D6sK8DWU+98htWEVeH6RBHNw/FH
   iDSiCidhhR3NwgR/P801mLbtp4gGg0axXus8qK+o/ZHnxeXuAhny0vcGb
   NJSkX/qN/rcjDcX1VBM0mlYk5eeiBkeWcZ2CCIAseq54dHCEJP4o/ry/0
   ZKeJyby94saPmHNCfCXQ/soX4nReeHM9DoVwwDavoRocdl6zaWEVt8Psm
   fxxrhJF/70qjmVsb+gJH91tqVapWdivTpuaWTVKrF0aP2yf8Q0rbcz+Th
   w4zoCCt3OL2o6cIU9pHj30aEx6wdOphxxpY9DOYdiOTVGkNZSneCKcSqb
   Q==;
X-CSE-ConnectionGUID: o2P1NbcHSbOQ5g0fFRnTvQ==
X-CSE-MsgGUID: SW6mHZOrTdqZ+eFco3OKMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="23727543"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="23727543"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2024 03:20:08 -0700
X-CSE-ConnectionGUID: tgTXJvWVSm+8ON4u8eeh5g==
X-CSE-MsgGUID: xzWlMfxWTMeugl3gcblN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32472257"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2024 03:20:05 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s907f-0004oe-1h;
	Mon, 20 May 2024 10:20:03 +0000
Date: Mon, 20 May 2024 18:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2_key-2 8/8]
 crypto/asymmetric_keys/tpm2_key_rsa.c:500:12: warning: stack frame size
 (1184) exceeds limit (1024) in 'tpm2_key_rsa_query'
Message-ID: <202405201847.dE3Cn5Jz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key-2
head:   65954d4732015cf1fda0517aeb7fff7174ccd9fc
commit: ca8f7136e4751b9a1b07875567202c25746dc028 [8/8] keys: asymmetric: ASYMMETRIC_TPM2_KEY_RSA_SUBTYPE
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240520/202405201847.dE3Cn5Jz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405201847.dE3Cn5Jz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405201847.dE3Cn5Jz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:19:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:19:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:19:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> crypto/asymmetric_keys/tpm2_key_rsa.c:500:12: warning: stack frame size (1184) exceeds limit (1024) in 'tpm2_key_rsa_query' [-Wframe-larger-than]
     500 | static int tpm2_key_rsa_query(const struct kernel_pkey_params *params,
         |            ^
>> crypto/asymmetric_keys/tpm2_key_rsa.c:421:12: warning: stack frame size (1320) exceeds limit (1024) in 'tpm2_key_rsa_eds_op' [-Wframe-larger-than]
     421 | static int tpm2_key_rsa_eds_op(struct kernel_pkey_params *params,
         |            ^
>> crypto/asymmetric_keys/tpm2_key_rsa.c:442:12: warning: stack frame size (1304) exceeds limit (1024) in 'tpm2_key_rsa_verify' [-Wframe-larger-than]
     442 | static int tpm2_key_rsa_verify(const struct key *key,
         |            ^
   10 warnings generated.


vim +/tpm2_key_rsa_query +500 crypto/asymmetric_keys/tpm2_key_rsa.c

   420	
 > 421	static int tpm2_key_rsa_eds_op(struct kernel_pkey_params *params,
   422				       const void *in, void *out)
   423	{
   424		struct tpm2_key *key = params->key->payload.data[asym_crypto];
   425		struct tpm_chip *chip = tpm_default_chip();
   426	
   427		if (!chip)
   428			return -ENODEV;
   429	
   430		switch (params->op) {
   431		case kernel_pkey_encrypt:
   432			return tpm2_key_rsa_encrypt(key, params, in, out);
   433		case kernel_pkey_decrypt:
   434			return tpm2_key_rsa_decrypt(chip, key, params, in, out);
   435		case kernel_pkey_sign:
   436			return tpm2_key_rsa_sign(chip, key, params, in, out);
   437		default:
   438			return -EOPNOTSUPP;
   439		}
   440	}
   441	
 > 442	static int tpm2_key_rsa_verify(const struct key *key,
   443				       const struct public_key_signature *sig)
   444	{
   445		const struct tpm2_key *tk = key->payload.data[asym_crypto];
   446		char alg_name[CRYPTO_MAX_ALG_NAME];
   447		u8 enc_pub_key[PUB_KEY_BUF_SIZE];
   448		struct akcipher_request *req;
   449		struct scatterlist src_sg[2];
   450		struct crypto_akcipher *tfm;
   451		struct crypto_wait cwait;
   452		u32 enc_pub_key_len;
   453		int rc;
   454	
   455		if (WARN_ON(!tk || !sig || !sig->s))
   456			return -EINVAL;
   457	
   458		if (!sig->digest)
   459			return -ENOPKG;
   460	
   461		rc = tpm2_key_get_akcipher(sig->encoding, sig->hash_algo, alg_name);
   462		if (rc < 0)
   463			return rc;
   464	
   465		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
   466		if (IS_ERR(tfm))
   467			return PTR_ERR(tfm);
   468	
   469		enc_pub_key_len = tpm2_key_rsa_encode(tk->pub, tk->pub_len, enc_pub_key);
   470	
   471		rc = crypto_akcipher_set_pub_key(tfm, enc_pub_key, enc_pub_key_len);
   472		if (rc < 0)
   473			goto err_tfm;
   474	
   475		rc = -ENOMEM;
   476		req = akcipher_request_alloc(tfm, GFP_KERNEL);
   477		if (!req)
   478			goto err_tfm;
   479	
   480		sg_init_table(src_sg, 2);
   481		sg_set_buf(&src_sg[0], sig->s, sig->s_size);
   482		sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
   483		akcipher_request_set_crypt(req, src_sg, NULL, sig->s_size,
   484					   sig->digest_size);
   485		crypto_init_wait(&cwait);
   486		akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
   487					      CRYPTO_TFM_REQ_MAY_SLEEP,
   488					      crypto_req_done, &cwait);
   489		rc = crypto_wait_req(crypto_akcipher_verify(req), &cwait);
   490	
   491		akcipher_request_free(req);
   492	err_tfm:
   493		crypto_free_akcipher(tfm);
   494		pr_devel("<=%s() = %d\n", __func__, rc);
   495		if (WARN_ON_ONCE(rc > 0))
   496			rc = -EINVAL;
   497		return rc;
   498	}
   499	
 > 500	static int tpm2_key_rsa_query(const struct kernel_pkey_params *params,
   501				      struct kernel_pkey_query *info)
   502	{
   503		struct tpm2_key *tk = params->key->payload.data[asym_crypto];
   504		char alg_name[CRYPTO_MAX_ALG_NAME];
   505		u8 enc_pub_key[PUB_KEY_BUF_SIZE];
   506		struct crypto_akcipher *tfm;
   507		u32 enc_pub_key_len = 0;
   508		unsigned int len;
   509		int ret;
   510	
   511		ret = tpm2_key_get_akcipher(params->encoding, params->hash_algo, alg_name);
   512		if (ret < 0)
   513			return ret;
   514	
   515		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
   516		if (IS_ERR(tfm))
   517			return PTR_ERR(tfm);
   518	
   519		enc_pub_key_len = tpm2_key_rsa_encode(tk->pub, tk->pub_len, enc_pub_key);
   520	
   521		pr_info("%u %u\n", tk->pub_len, enc_pub_key_len);
   522	
   523		ret = crypto_akcipher_set_pub_key(tfm, enc_pub_key, enc_pub_key_len);
   524		if (ret < 0)
   525			goto err_tfm;
   526	
   527		len = crypto_akcipher_maxsize(tfm);
   528	
   529		info->key_size = tk->pub_len * 8;
   530		info->max_data_size = tk->pub_len;
   531		info->max_sig_size = len;
   532		info->max_enc_size = len;
   533		info->max_dec_size = tk->pub_len;
   534	
   535		info->supported_ops = KEYCTL_SUPPORTS_ENCRYPT |
   536				      KEYCTL_SUPPORTS_DECRYPT |
   537				      KEYCTL_SUPPORTS_VERIFY |
   538				      KEYCTL_SUPPORTS_SIGN;
   539	
   540	err_tfm:
   541		crypto_free_akcipher(tfm);
   542		return ret;
   543	}
   544	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
