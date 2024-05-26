Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D111A2C1E;
	Sun, 26 May 2024 06:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716705339; cv=none; b=Z212Ir5pDGvvyZJC+ZiPWCwX78ZUGwA65Odhgt5rg55mxr6udKuP7vsyOpysYob9gDha42hVMNpwY9iOa94E3ykdBtLcFdKr+GVBWE2ZFq/9q3PpA/Y/w9GiLlhx4t37qebGTwdQOAMsiBtPk2qrd/R999yu53iJsMFDFuhy424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716705339; c=relaxed/simple;
	bh=GJ+aQb13J/ksxrMGkA8y4xTV21YGlAN+PlJRWexhFF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PtBDDXe7rL2der3f7wcQu0BE1LRUmGxk0TjBZk/4DHQ0FVfvzbO2FrVo3uOPTXXmphFiltDF3ecB+0s93BF0OaZPZHJZu1LZxNLtKN+WX4Wd011OBJouTcOd7z+ZobeZTtmYaZ49tEdQGQn7RNTT0B99XDHLHMA+RzUwu9oevsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VMkyaanC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VMkyaanC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716705338; x=1748241338;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GJ+aQb13J/ksxrMGkA8y4xTV21YGlAN+PlJRWexhFF0=;
  b=VMkyaanCnxSI7TwnuEWHwku6hSG3ADD5ERiZrvhVRtZRjW8VXpUzm3jn
   gmr7h6THIyJlNBVHYU72zRPL+021xcLCpV0kV/wzo+ERz5ck5aCBpbDdU
   VBDlXL2n23BPFrDzOTD2mKFKFQbcUL5m3Prwl1J2ccJTO+DRv/1g7I8oD
   X4JYpJXoZOYCTQD0KQaqByEb9hpiSdzof/ft7K91Lg1rPFmJQFRCUFs65
   HzigWk5yv1p4jCivIiOcrv6N01iM9uBIJklAtmFArnDQUG+TUpFXrfanX
   qB0/Q4j6hzoSF2juPFeHrfaN21fNhhyouxkLTbeh+xRn4T4Bi7WQPrnGl
   w==;
X-CSE-ConnectionGUID: j5HX7bG2QFOeyInFuMZUlA==
X-CSE-MsgGUID: nCYai24ETkCpzGzRqh68/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="16827684"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="16827684"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 23:35:37 -0700
X-CSE-ConnectionGUID: ZPFya3k5T32YEj2ihH7bqg==
X-CSE-MsgGUID: vd5YY370QIer0YpFNKM8Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="34342898"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 May 2024 23:35:35 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sB7Tb-0007od-0H;
	Sun, 26 May 2024 06:35:32 +0000
Date: Sun, 26 May 2024 14:34:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	James Prestwood <prestwoj@gmail.com>
Subject: [jarkko-tpmdd:tpm2key-v6 6/7]
 crypto/asymmetric_keys/tpm2_key_rsa.c:610:34: warning: result of comparison
 of constant 65537 with expression of type '__u16' (aka 'unsigned short') is
 always true
Message-ID: <202405261400.f2qXL4kf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   53809f171bd0e87446a5fecde95476c08606a215
commit: ba6cf4498068851af553834fa3a0e8f1408d65c6 [6/7] keys: asymmetric: tpm2_key_rsa
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405261400.f2qXL4kf-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405261400.f2qXL4kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405261400.f2qXL4kf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:16:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:16:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:16:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/tpm2_key_rsa.c:16:
   In file included from include/keys/trusted-type.h:12:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
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
>> crypto/asymmetric_keys/tpm2_key_rsa.c:610:34: warning: result of comparison of constant 65537 with expression of type '__u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
     610 |             be16_to_cpu(parms.exponent) != 0x00010001)
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:626:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     626 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_rsa.c:622:9: note: initialize the variable 'ret' to silence this warning
     622 |         int ret;
         |                ^
         |                 = 0
   9 warnings generated.


vim +610 crypto/asymmetric_keys/tpm2_key_rsa.c

   579	
   580	static int __tpm2_key_rsa_preparse(struct tpm2_key *key)
   581	{
   582		off_t offset = sizeof(key->desc) + tpm2_key_policy_size(key) + 2;
   583		struct tpm2_rsa_parms parms;
   584		u8 *pub = tpm2_key_pub(key);
   585	
   586		if (tpm2_key_type(key) != TPM_ALG_RSA)
   587			return -EBADMSG;
   588	
   589		if (tpm2_key_policy_size(key) != 0)
   590			return -EBADMSG;
   591	
   592		if (offset + sizeof(parms) > tpm2_key_pub_len(key))
   593			return -EBADMSG;
   594	
   595		memcpy(&parms, &pub[offset], sizeof(parms));
   596		offset += sizeof(parms);
   597	
   598		if (be16_to_cpu(parms.symmetric) != TPM_ALG_NULL)
   599			return -EBADMSG;
   600	
   601		if (be16_to_cpu(parms.scheme) != TPM_ALG_NULL)
   602			return -EBADMSG;
   603	
   604		if (be16_to_cpu(parms.key_bits) != 2048 &&
   605		    be16_to_cpu(parms.key_bits) != 3072 &&
   606		    be16_to_cpu(parms.key_bits) != 4096)
   607			return -EBADMSG;
   608	
   609		if (be16_to_cpu(parms.exponent) != 0x00000000 &&
 > 610		    be16_to_cpu(parms.exponent) != 0x00010001)
   611			return -EBADMSG;
   612	
   613		return 0;
   614	}
   615	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
