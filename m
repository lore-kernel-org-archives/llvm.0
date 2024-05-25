Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB2E10F1;
	Sat, 25 May 2024 03:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716606048; cv=none; b=HGvnkF3cAIzDr0sr7vpi/OQA60FDArc1BEr5O5FN5qEjxI1u6zY7v0NvbR+d1KZhn9ijfg79ZHbCM8LFIohDsnpBeXV6jNMlDukP/yJykWHCgo/4F5nDG4Lyv7ewVmnzheXihoYQ+LgxEE0ZrBmMgjwQvVKWsXNSIt4Uc0jXGfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716606048; c=relaxed/simple;
	bh=K0VXxsvjOLD9ZXlgicIkN5pze6mXZCgvgRb39SxmSnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfEWYhqA+tZ4MUOBqDDiTYAY4zxNklmW+xuKlQf5x+ClQNNDszkjbTsuPau9h9i8pTZXn5ElBNN57el7wmihqHo1MS2YTV2TpP/d7oyIPDexgN7cMvIJfPxlqSltpWuMSvLNg9ixuc5NogxRtSbrkwJIiKlbirDTJfTRGLHVSHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCwj1ivU; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCwj1ivU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716606047; x=1748142047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0VXxsvjOLD9ZXlgicIkN5pze6mXZCgvgRb39SxmSnk=;
  b=RCwj1ivUPdoebxj8R73IRLypvlQwHTUobAgrl3lXqlRcSCl2/AQxYtRK
   wTekwzbQOHur6DXE3pN4Tbnr3ZZLDlaR4GuEyRni6EnaRaVljHvdTkQHr
   df1034650XmmePXlnkFtaI5sxV1IgJbCUjrSSz+KSefBH1nd/8Yw8/dc3
   5IN1FcMchUdyDw94Jj+uGEI8Z0Yz70BnYnA2CyWyalU+MhOvEWQjds5MU
   XMxd/u25H3MN4PDChulWkoOGBJfDk4fSxrezv1ebWTQjZsRPpCtxFu6q1
   ZT4qouj/RYwD9x/gr21VYZnEHa/4vj/pBL39rwoaZOFfq1sMyXL0YC0Ro
   g==;
X-CSE-ConnectionGUID: t43DYUShQUiqTSJSt9qSqQ==
X-CSE-MsgGUID: CNx6tEBhSHWlHRVSJ4nq8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="13180473"
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="13180473"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 20:00:46 -0700
X-CSE-ConnectionGUID: yBtNqaJlRyqOWi6W5ze7XQ==
X-CSE-MsgGUID: b1q6h8GwRlSEbTgTTYOsOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,187,1712646000"; 
   d="scan'208";a="71613127"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 May 2024 20:00:46 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAheC-0006Oz-0I;
	Sat, 25 May 2024 03:00:40 +0000
Date: Sat, 25 May 2024 11:00:05 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 8/8]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:76:26: error: use of undeclared
 identifier 'key_ecdsa'; did you mean 'key_ecc'?
Message-ID: <202405251042.ZSq8ELNZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   a3a5d9adc5a9192e99dccaadf05fe70c5ef56971
commit: a3a5d9adc5a9192e99dccaadf05fe70c5ef56971 [8/8] keys: asymmetric: tpm2_key_ecdsa
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240525/202405251042.ZSq8ELNZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405251042.ZSq8ELNZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405251042.ZSq8ELNZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:19:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:19:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:19:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:19:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:76:26: error: use of undeclared identifier 'key_ecdsa'; did you mean 'key_ecc'?
      76 |         struct tpm2_key *key = &key_ecdsa->key;
         |                                 ^~~~~~~~~
         |                                 key_ecc
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:74:57: note: 'key_ecc' declared here
      74 | static int tpm2_key_ecdsa_preparse(struct tpm2_key_ecc *key_ecc)
         |                                                         ^
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:134:8: error: call to undeclared function 'tpm_buf_read'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     134 |         ret = tpm_buf_read(&buf, &offset, x_size, key_ecc);
         |               ^
   7 warnings and 2 errors generated.


vim +76 crypto/asymmetric_keys/tpm2_key_ecdsa.c

    73	
    74	static int tpm2_key_ecdsa_preparse(struct tpm2_key_ecc *key_ecc)
    75	{
  > 76		struct tpm2_key *key = &key_ecdsa->key;
    77		u16 pub_len = get_unaligned_be16(key->pub);
    78		u32 object_attributes;
    79		u16 auth_policy_len;
    80		struct tpm_buf buf;
    81		off_t offset = 2;
    82		u16 symmetric;
    83		u16 name_alg;
    84		u16 scheme;
    85		u16 x_size;
    86		u16 y_size;
    87		u16 type;
    88		u16 ecc;
    89		u16 kdf;
    90		int ret;
    91	
    92		buf.flags = TPM_BUF_TPM2B;
    93		buf.length = key->pub_len;
    94		buf.data = (void *)key->pub;
    95	
    96		if (pub_len != buf.length - 2)
    97			return -EBADMSG;
    98	
    99		/* TPMT_PUBLIC */
   100		type = tpm_buf_read_u16(&buf, &offset);
   101		if (type != TPM_ALG_ECC)
   102			return -EBADMSG;
   103	
   104		name_alg = tpm_buf_read_u16(&buf, &offset);
   105		object_attributes = tpm_buf_read_u32(&buf, &offset);
   106	
   107		auth_policy_len = tpm_buf_read_u16(&buf, &offset);
   108		/* Asymmetric keys do not support options string: */
   109		if (auth_policy_len != 0)
   110			return -EBADMSG;
   111	
   112		/* TPMS_ECC_PARMS */
   113		symmetric = tpm_buf_read_u16(&buf, &offset);
   114		if (symmetric != TPM_ALG_NULL)
   115			return -EBADMSG;
   116	
   117		scheme = tpm_buf_read_u16(&buf, &offset);
   118		if (scheme != TPM_ALG_NULL)
   119			return -EBADMSG;
   120	
   121		ecc = tpm_buf_read_u16(&buf, &offset);
   122		if (ecc != TPM2_ECC_NIST_P256 &&  ecc != TPM2_ECC_NIST_P384 &&
   123		    ecc != TPM2_ECC_NIST_P521)
   124			return -EBADMSG;
   125	
   126		kdf = tpm_buf_read_u16(&buf, &offset);
   127		if (kdf != TPM_ALG_NULL)
   128			return -EBADMSG;
   129	
   130		/* TPMS_ECC_POINT */
   131		x_size = tpm_buf_read_u16(&buf, &offset);
   132		if (x_size > ECC_MAX_DIGITS)
   133			return -EBADMSG;
 > 134		ret = tpm_buf_read(&buf, &offset, x_size, key_ecc);
   135	
   136		y_size = tpm_buf_read_u16(&buf, &offset);
   137		if (y_size > ECC_MAX_DIGITS)
   138			return -EBADMSG;
   139		ret = tpm_buf_read(&buf, &offset, y_size, key_ecc);
   140	
   141		return buf.flags & TPM_BUF_BOUNDARY_ERROR ? -EIO : 0;
   142	}
   143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
