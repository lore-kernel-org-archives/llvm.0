Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F3FFBED;
	Sat, 25 May 2024 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716672365; cv=none; b=GzX9Aa1DRPXnYmt5J0awytKpRhjUTi30i2DtOqsLT8467ppNmmvxH/Vzs7Jvid0LST2ahSBB1Bn+ujBQ4ebED0f4VzDdqZxRFjdOTSesQSYgqrsRUTgImP8tCw081XlxRBl4JmVIcEKz6cAk8e1Lf+dFZsSNgqmukJs6UaE3Q9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716672365; c=relaxed/simple;
	bh=Sv/PLxjOLlS9mjWFBxB1XkRr/ApGnhLFE/KLvnhJ8fE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UgaeZM8HrSOs+xMNYJbEIRh6EP7KWhAUGOzarwzMSxIdLm7tyl4zbxUt6FF3zLbLnoji7I8uxNhNRWMt8wGDaDb8BIhEDrCrh9PLOwdfS5NYu65ww/5RcQqelBX3XqMjCsWSz1hlz0xU8mHQxf/FLCV9PSA1Gv2WZxfjop8LbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WJefc5/g; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WJefc5/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716672363; x=1748208363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sv/PLxjOLlS9mjWFBxB1XkRr/ApGnhLFE/KLvnhJ8fE=;
  b=WJefc5/gn2Bj3vaRmQ9yv/7B1fNLXPPFqFr/WxzuEW7GIJXNA/FLlPY3
   5DU5PE4qdtjXoB6snoUZC1VBUrFrtswgqewlJVXIk4qj10nCi6JFYrh7W
   Jxe+9of6sN2l5QUi1S6NtWsXRBzjaHWeFzSjrZ7PvRfOKOa5dm43GKCVs
   miogqUYr4m8qrJ1/ktXFp44WITB0q/wZ7bZ65pgBrMsYt6d/6BWugrEOh
   PZctYr8/Z6ONjjv5FUJv1gdS2MddiOg+Xs3eMFCkYZoqkw6/uMjZeJ2lH
   k3wyERBCOODb7K7TAWIbfU3SoTRSTVD1H5tvsb1gZO4qzbOEE7X/bvc+Y
   Q==;
X-CSE-ConnectionGUID: sgNZtq52Tjm919ZhNS8q/Q==
X-CSE-MsgGUID: kQzbU6/BQ7WARoEBLDOXYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="13146597"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="13146597"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2024 14:26:02 -0700
X-CSE-ConnectionGUID: EWFEKVYiSMW2ptEHG5bSpw==
X-CSE-MsgGUID: 1Katd9HrT/6EvmyTsmFrGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; 
   d="scan'208";a="39339065"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 May 2024 14:26:02 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAytr-0007Qp-0N;
	Sat, 25 May 2024 21:25:59 +0000
Date: Sun, 26 May 2024 05:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v6 5/8] crypto/tpm2_key.c:137:10: error:
 incompatible integer to pointer conversion returning 'int' from a function
 with result type 'struct tpm2_key *'
Message-ID: <202405260516.RRrQkvQt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v6
head:   d68aa6486fd8c27b17a28484c3da8724ebfc26cf
commit: ffb36188a8c18f15f4b2323011812a033f02765a [5/8] crypto: tpm2_key: ASN.1 decoder
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405260516.RRrQkvQt-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7aa382fd7257d9bd4f7fc50bb7078a3c26a1628c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260516.RRrQkvQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260516.RRrQkvQt-lkp@intel.com/

Note: the jarkko-tpmdd/tpm2key-v6 HEAD d68aa6486fd8c27b17a28484c3da8724ebfc26cf builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from crypto/tpm2_key.c:6:
   In file included from include/linux/tpm.h:24:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/tpm2_key.c:6:
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
   In file included from crypto/tpm2_key.c:6:
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
   In file included from crypto/tpm2_key.c:6:
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
>> crypto/tpm2_key.c:137:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct tpm2_key *' [-Wint-conversion]
     137 |                 return ret;
         |                        ^~~
   crypto/tpm2_key.c:141:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct tpm2_key *' [-Wint-conversion]
     141 |                 return -ENOMEM;
         |                        ^~~~~~~
   crypto/tpm2_key.c:131:6: warning: unused variable 'blob_len' [-Wunused-variable]
     131 |         u32 blob_len;
         |             ^~~~~~~~
   8 warnings and 2 errors generated.


vim +137 crypto/tpm2_key.c

   112	
   113	/**
   114	 * tpm_key_decode() - Decode TPM2 ASN.1 key
   115	 * @src:	ASN.1 source.
   116	 * @src_len:	ASN.1 source length.
   117	 *
   118	 * Decodes the TPM2 ASN.1 key and validates that the public key blob has all
   119	 * the shared fields of TPMT_PUBLIC. This is full coverage of the memory that
   120	 * can be validated before doing any key type specific validation.
   121	 *
   122	 * Return:
   123	 * - TPM2 ASN.1 key on success.
   124	 * - -EBADMSG when decoding fails.
   125	 * - -ENOMEM when OOM while allocating struct tpm2_key.
   126	 */
   127	struct tpm2_key *tpm2_key_decode(const u8 *src, u32 src_len)
   128	{
   129		struct tpm2_key_context ctx;
   130		struct tpm2_key *key;
   131		u32 blob_len;
   132		int ret;
   133	
   134		memset(&ctx, 0, sizeof(ctx));
   135		ret = asn1_ber_decoder(&tpm2_key_decoder, &ctx, src, src_len);
   136		if (ret < 0)
 > 137			return ret;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
