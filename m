Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6678175B1;
	Wed, 29 May 2024 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975193; cv=none; b=ujpgnixnf9+6Az+VctYtqv/aDVS3V0W3hd6UzlX+T2Qr44Ur9QOKP5EK86ChKiOBfTrZrhTl89z5F15l/1nfTuAzKCLUiBuAYU4z+7aU7O75KDsA4dwk8hkg1TQz4l9c/dgAjgv/rU+asLCRElV+nmbqwPEGqvUourRIsXU9SGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975193; c=relaxed/simple;
	bh=VOHE8+XFYOI/3yKlFm4DVx4x+nfeXxTaK605tEECapY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VdZyHRrAOEpZ60iYaV5jtah9zQlco0o/2R5Cp5q4GUKwXlio0ESthjw+NcFn8GUApTbUyoSrxdS7fRTfN+GvYFayJP5p5r1LYKJBsoqAp+/t/FN/LtoE0c68ZBo0+4lHighjEgc1ccPXCVqavzk4xLYRUgxLSRpFuarn0y0X46M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbXWfevg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbXWfevg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716975191; x=1748511191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VOHE8+XFYOI/3yKlFm4DVx4x+nfeXxTaK605tEECapY=;
  b=NbXWfevgG17DuIqhlfwz2sAs7kIzIDVVYgf2GflvbdZHTrwT4zjkn706
   ghyuF9btyz0dYGsaPw1forZ+I+CoN9vAGNmfwaZRlR9NqebGAQaRcAibV
   hcq96vKkdExGcwLWwJ6aMkrayyuEmckVuabTN8DR9E9GAjlvqCmTPLePJ
   iibo9Kbp3PqRjzEwIvGIsKnANOEBAZ+g6Dcg1RuJRyMxmpJRHY65tcMso
   6r2t819apSzGfSnB6mVasin4LBzKADHlhrPAL49CxS6sJWIGI9oT09jPJ
   dSHrmEnzHR3Ubt+a/R2wNa30DNVFua3Pdj+qI6aiQGmsb6f60xyUt6ItV
   Q==;
X-CSE-ConnectionGUID: vPqqjB3PRrOrta+zrKJNOw==
X-CSE-MsgGUID: AAM/g55XTdCdoxKOQBaAaw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13139739"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="13139739"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 02:32:58 -0700
X-CSE-ConnectionGUID: XcET4DHvQJ+rKtsJGx7WNQ==
X-CSE-MsgGUID: 1mqwJP1eTAic9L5whiDBxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="66252211"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 May 2024 02:32:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCFfy-000DRb-1S;
	Wed, 29 May 2024 09:32:54 +0000
Date: Wed, 29 May 2024 17:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v7 9/9]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:222:26: warning: format specifies
 type 'unsigned int' but the argument has type 'off_t' (aka 'long')
Message-ID: <202405291703.l77ggr3t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v7
head:   892305fec7841bf841a9c19e01c999c5f4b4e831
commit: 892305fec7841bf841a9c19e01c999c5f4b4e831 [9/9] keys: asymmetric: Add tpm2_key_ecdsa
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240529/202405291703.l77ggr3t-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405291703.l77ggr3t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405291703.l77ggr3t-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:18:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:18:
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
   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:18:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from crypto/asymmetric_keys/tpm2_key_ecdsa.c:18:
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
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:222:26: warning: format specifies type 'unsigned int' but the argument has type 'off_t' (aka 'long') [-Wformat]
     222 |                 pr_warn("offset=%u\n", offset);
         |                                 ~~     ^~~~~~
         |                                 %ld
   include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
     517 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:232:26: warning: format specifies type 'unsigned int' but the argument has type 'off_t' (aka 'long') [-Wformat]
     232 |                 pr_warn("offset=%u\n", offset);
         |                                 ~~     ^~~~~~
         |                                 %ld
   include/linux/printk.h:517:37: note: expanded from macro 'pr_warn'
     517 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:464:60: note: expanded from macro 'printk'
     464 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:436:19: note: expanded from macro 'printk_index_wrap'
     436 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:421:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     421 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:417:9: note: initialize the variable 'ret' to silence this warning
     417 |         int ret;
         |                ^
         |                 = 0
   10 warnings generated.


vim +222 crypto/asymmetric_keys/tpm2_key_ecdsa.c

   128	
   129	static int tpm2_key_ecdsa_sign(struct tpm_chip *chip, struct tpm2_key *key,
   130				       struct kernel_pkey_params *params,
   131				       const void *in, void *out)
   132	{
   133		u8 r[SHA256_DIGEST_SIZE], s[SHA256_DIGEST_SIZE];
   134		u32 in_len = params->in_len;
   135		bool r_0, s_0;
   136		struct tpm_header *head;
   137		struct tpm_buf buf;
   138		u32 key_handle;
   139		u8 *ptr = out;
   140		off_t offset;
   141		int ret;
   142	
   143	
   144		/* Require explicit hash algorithm: */
   145		if (!params->hash_algo)
   146			return -EINVAL;
   147	
   148		/* Currently only support SHA256: */
   149		if (!!strcmp(params->hash_algo, "sha256"))
   150			return -EINVAL;
   151	
   152		ret = tpm_try_get_ops(chip);
   153		if (ret)
   154			return ret;
   155	
   156		ret = tpm2_start_auth_session(chip);
   157		if (ret)
   158			goto err_ops;
   159	
   160		ret = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
   161		if (ret < 0) {
   162			tpm2_end_auth_session(chip);
   163			goto err_ops;
   164		}
   165	
   166		tpm_buf_append_name(chip, &buf, key->parent, NULL);
   167		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_CONTINUE_SESSION |
   168					    TPM2_SA_ENCRYPT, NULL, 0);
   169		tpm_buf_append(&buf, &key->data[0], key->priv_len + key->pub_len);
   170		if (buf.flags & TPM_BUF_OVERFLOW) {
   171			tpm2_end_auth_session(chip);
   172			ret = -E2BIG;
   173			goto err_buf;
   174		}
   175		tpm_buf_fill_hmac_session(chip, &buf);
   176		ret = tpm_transmit_cmd(chip, &buf, 4, "ECDSA loading");
   177		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   178		if (ret) {
   179			tpm2_end_auth_session(chip);
   180			ret = -EIO;
   181			goto err_buf;
   182		}
   183	
   184		key_handle = be32_to_cpup((__be32 *)&buf.data[TPM_HEADER_SIZE]);
   185	
   186		tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_SIGN);
   187		tpm_buf_append_name(chip, &buf, key_handle, NULL);
   188		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT, NULL, 0);
   189	
   190		sha256(in, in_len, r);
   191		tpm_buf_append_u16(&buf, SHA256_DIGEST_SIZE);
   192		tpm_buf_append(&buf, r, SHA256_DIGEST_SIZE);
   193		tpm_buf_append_u16(&buf, TPM_ALG_ECDSA);
   194		tpm_buf_append_u16(&buf, TPM_ALG_SHA256);
   195	
   196		/* 10.7.2 A NULL Ticket */
   197		tpm_buf_append_u16(&buf, TPM2_ST_HASHCHECK);
   198		tpm_buf_append_u32(&buf, TPM2_RH_NULL);
   199		tpm_buf_append_u16(&buf, 0);
   200	
   201		tpm_buf_fill_hmac_session(chip, &buf);
   202		ret = tpm_transmit_cmd(chip, &buf, 4, "ECDSA signing");
   203		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   204		if (ret) {
   205			tpm2_end_auth_session(chip);
   206			ret = -EIO;
   207			goto err_key_handle;
   208		}
   209	
   210		/* Move to parameters: */
   211		head = (struct tpm_header *)buf.data;
   212		offset = sizeof(*head);
   213		if (be16_to_cpu(head->tag) == TPM2_ST_SESSIONS)
   214			offset += 4;
   215	
   216		ret = -EIO;
   217	
   218		/* Copy R: */
   219		if (tpm_buf_read_u16(&buf, &offset) != TPM_ALG_ECDSA ||
   220		    tpm_buf_read_u16(&buf, &offset) != TPM_ALG_SHA256 ||
   221		    tpm_buf_read_u16(&buf, &offset) != SHA256_DIGEST_SIZE) {
 > 222			pr_warn("offset=%u\n", offset);
   223			goto err_key_handle;
   224		}
   225	
   226		tpm_buf_read(&buf, &offset, SHA256_DIGEST_SIZE, r);
   227		r_0 = (r[0] & 0x80) != 0;
   228		pr_info("r_0=%d\n", r_0);
   229	
   230		/* Copy S: */
   231		if (tpm_buf_read_u16(&buf, &offset) != SHA256_DIGEST_SIZE) {
   232			pr_warn("offset=%u\n", offset);
   233			goto err_key_handle;
   234		}
   235	
   236		tpm_buf_read(&buf, &offset, SHA256_DIGEST_SIZE, s);
   237		s_0 = (r[0] & 0x80) != 0;
   238		pr_info("s_0=%d\n", r_0);
   239	
   240		/* Encode the ASN.1 signature: */
   241	#define TPM2_KEY_ECDSA_SIG_SIZE		(2 + 2 * (2 + SHA256_DIGEST_SIZE) + r_0 + s_0)
   242		pr_info("sig_size=%d\n", TPM2_KEY_ECDSA_SIG_SIZE);
   243		ptr[0] = 0x30; /* SEQUENCE */
   244		ptr[1] = TPM2_KEY_ECDSA_SIG_SIZE - 2;
   245	#define TPM2_KEY_ECDSA_SIG_R_TAG	2
   246	#define TPM2_KEY_ECDSA_SIG_R_SIZE	3
   247	#define TPM2_KEY_ECDSA_SIG_R_BODY	4
   248		ptr[TPM2_KEY_ECDSA_SIG_R_TAG] = 0x02; /* INTEGER */
   249		ptr[TPM2_KEY_ECDSA_SIG_R_SIZE] = SHA256_DIGEST_SIZE + r_0;
   250		ptr[TPM2_KEY_ECDSA_SIG_R_BODY] = 0x00; /* maybe dummy write */
   251		memcpy(&ptr[TPM2_KEY_ECDSA_SIG_R_BODY + r_0], r, SHA256_DIGEST_SIZE);
   252	#define TPM2_KEY_ECDSA_SIG_S_TAG	(4 + r_0 + SHA256_DIGEST_SIZE)
   253	#define TPM2_KEY_ECDSA_SIG_S_SIZE	(5 + r_0 + SHA256_DIGEST_SIZE)
   254	#define TPM2_KEY_ECDSA_SIG_S_BODY	(6 + r_0 + SHA256_DIGEST_SIZE)
   255		ptr[TPM2_KEY_ECDSA_SIG_S_TAG] = 0x02; /* INTEGER */
   256		ptr[TPM2_KEY_ECDSA_SIG_S_SIZE] = SHA256_DIGEST_SIZE + s_0;
   257		ptr[TPM2_KEY_ECDSA_SIG_S_BODY] = 0x00; /* maybe dummy write */
   258		memcpy(&ptr[TPM2_KEY_ECDSA_SIG_S_BODY + s_0], s, SHA256_DIGEST_SIZE);
   259		ret = TPM2_KEY_ECDSA_SIG_SIZE;
   260	
   261	err_key_handle:
   262		tpm2_flush_context(chip, key_handle);
   263	
   264	err_buf:
   265		tpm_buf_destroy(&buf);
   266	
   267	err_ops:
   268		tpm_put_ops(chip);
   269		return ret;
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
