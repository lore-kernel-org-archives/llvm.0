Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3BAA13CA8C;
	Thu, 23 May 2024 07:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716451009; cv=none; b=LoiUmjssUTXIM85CAeGMa0hjFvicxrd5bafA+kBtEtS5n/fDpe+GVx+GH8bp9k8ERfXEZPDGg7Pp0blw76+WOPGdrFEYTdbM0MNwBQjelHJ1R/liQbsL+R1vNdNvD3SnLxznU5q3GV1oXRRXJA9jFM+uCwEWrzsSfdSUsDnrnzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716451009; c=relaxed/simple;
	bh=HnQA4616BfyWRJAEIaaLhQ3+e2n20ryeUsttVbM1oz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lrAADrDpudicgtZH/RoVmOEgQj56Dl9jhVhP7k3ngHFxr9WOpLxpb5bs3mgjHgy4/HGawwCTsK8Pq1kOVqBtxkbl8EyzOxmR+uWo9MG/cekg3VI8KV4b2wSAOzC48IOQVPo25tz/Vw3TvBy8kTsQ05Vj1frZPbCLwomBbr3Yuf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k4a5Eghn; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4a5Eghn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716451008; x=1747987008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnQA4616BfyWRJAEIaaLhQ3+e2n20ryeUsttVbM1oz8=;
  b=k4a5Eghnjd7C5ECk4+4EySg7XOVFJ+my47BbtKPbPPnKnxW+y6awmnT4
   2JIJESBssLuzWWAmTMutWmxunLzQ9pAYPDO9oT5OMwxIOi6RkCANAUwl4
   IxP5pesPRPG2rxtuKNTmFaELvL+VKD6fQKRNN3iVfMI/4PoKYV/RZI3JT
   JnlPZXWnZzNB8kgMcfYPZ+d0BzW5GY/QTPTjh4MhxLrk37E1IkxO3qtcb
   qUXlM747ysOXwC0jhjaSa5hZF5twiQ7T1H+/jgF2L1KFJQO/jWSDioyo7
   YKCBXShWlrTxkBTxLDBmao8SyJJEI8+wuXguDq7M7QN0/2SyMNq6ONvo6
   w==;
X-CSE-ConnectionGUID: G18RW3esQlSVM1+Tc1JQIQ==
X-CSE-MsgGUID: zIHkeGnNSAKqcXs+WxFsTw==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23883801"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="23883801"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2024 00:56:47 -0700
X-CSE-ConnectionGUID: muzJf0ZJRx2LST6JK6G+fQ==
X-CSE-MsgGUID: 5pj/eDYgSByFXGkqWOz0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="64421859"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 May 2024 00:56:45 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sA3JN-0002b4-0d;
	Thu, 23 May 2024 07:56:34 +0000
Date: Thu, 23 May 2024 15:51:37 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2key-v3 7/7]
 crypto/asymmetric_keys/tpm2_key_rsa.c:360:1: warning: unused label
 'err_auth'
Message-ID: <202405231543.2UgLiw4L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v3
head:   9e82832aa16a3b33db19220c360342be336b77d2
commit: 9e82832aa16a3b33db19220c360342be336b77d2 [7/7] keys: asymmetric: ASYMMETRIC_TPM2_KEY_RSA_SUBTYPE
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240523/202405231543.2UgLiw4L-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405231543.2UgLiw4L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231543.2UgLiw4L-lkp@intel.com/

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
   crypto/asymmetric_keys/tpm2_key_rsa.c:284:15: warning: unused variable 'offset' [-Wunused-variable]
     284 |         unsigned int offset = 0;
         |                      ^~~~~~
>> crypto/asymmetric_keys/tpm2_key_rsa.c:360:1: warning: unused label 'err_auth' [-Wunused-label]
     360 | err_auth:
         | ^~~~~~~~~
   9 warnings generated.


vim +/err_auth +360 crypto/asymmetric_keys/tpm2_key_rsa.c

   278	
   279	static int __tpm2_key_rsa_decrypt(struct tpm_chip *chip,
   280					  struct tpm2_key_rsa *key,
   281					  struct kernel_pkey_params *params,
   282					  const void *in, int in_len, void *out)
   283	{
   284		unsigned int offset = 0;
   285		u32 key_handle = 0;
   286		struct tpm_buf buf;
   287		u16 decrypted_len;
   288		u32 parent;
   289		u8 *pos;
   290		int ret;
   291	
   292		ret = tpm_try_get_ops(chip);
   293		if (ret)
   294			return ret;
   295	
   296		ret = tpm2_start_auth_session(chip);
   297		if (ret)
   298			goto err_ops;
   299	
   300		parent = key->key.parent;
   301	
   302		ret = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
   303		if (ret < 0)
   304			goto err_parent;
   305	
   306		tpm_buf_append_name(chip, &buf, parent, NULL);
   307		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_CONTINUE_SESSION |
   308					    TPM2_SA_ENCRYPT, NULL, 0);
   309		tpm_buf_append(&buf, key->key.blob, key->key.blob_len);
   310		if (buf.flags & TPM_BUF_OVERFLOW) {
   311			ret = -E2BIG;
   312			goto err_buf;
   313		}
   314		tpm_buf_fill_hmac_session(chip, &buf);
   315		ret = tpm_transmit_cmd(chip, &buf, 4, "RSA key loading");
   316		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   317		if (ret) {
   318			ret = -EIO;
   319			goto err_buf;
   320		}
   321		key_handle = be32_to_cpup((__be32 *)&buf.data[TPM_HEADER_SIZE]);
   322	
   323		tpm_buf_reset(&buf, TPM2_ST_SESSIONS, TPM2_CC_RSA_DECRYPT);
   324		tpm_buf_append_name(chip, &buf, key_handle, NULL);
   325		tpm_buf_append_hmac_session(chip, &buf, TPM2_SA_DECRYPT, NULL, 0);
   326		tpm_buf_append_u16(&buf, in_len);
   327		tpm_buf_append(&buf, in, in_len);
   328		tpm_buf_append_u16(&buf, TPM_ALG_NULL);
   329		tpm_buf_append_u16(&buf, 0);
   330		tpm_buf_fill_hmac_session(chip, &buf);
   331		ret = tpm_transmit_cmd(chip, &buf, 4, "RSA key decrypting");
   332		ret = tpm_buf_check_hmac_response(chip, &buf, ret);
   333		if (ret) {
   334			ret = -EIO;
   335			goto err_blob;
   336		}
   337	
   338		pos = buf.data + TPM_HEADER_SIZE + 4;
   339		decrypted_len = be16_to_cpup((__be16 *)pos);
   340		pos += 2;
   341	
   342		if (params->out_len < decrypted_len) {
   343			ret = -EMSGSIZE;
   344			goto err_blob;
   345		}
   346	
   347		memcpy(out, pos, decrypted_len);
   348		ret = decrypted_len;
   349	
   350	err_blob:
   351		tpm2_flush_context(chip, key_handle);
   352	
   353	err_buf:
   354		tpm_buf_destroy(&buf);
   355	
   356	err_parent:
   357		if (key->key.parent == TPM2_RH_NULL)
   358			tpm2_flush_context(chip, parent);
   359	
 > 360	err_auth:
   361		if (ret < 0)
   362			tpm2_end_auth_session(chip);
   363	
   364	err_ops:
   365		tpm_put_ops(chip);
   366		return ret;
   367	}
   368	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
