Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ACE155346;
	Wed, 11 Sep 2024 10:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726049523; cv=none; b=gMbOUuT/FluMCtUU8VwPYkW/Kx+bLkzPyY7/qdj5BTwL/dTTpHlHoU79rwhO6x71DrmiM30jGDJ1JchPzpl+76E3Q1fOyLPF6OZZbgVKH5yr7GllyKo9ep5MRvUrgTjtHvv0XHvapD6awgZTAfJ45W1pu/uhae9tAFHdaR3WZNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726049523; c=relaxed/simple;
	bh=Zagk+xnsbK6oJg+bN34Rq509AziQTgIlzQwBjc1kDco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aPm3AXke2s5O9bghs+Uaebbt9PJB7Ji/mNxj9MN1ZnJ7TOdiIfkqIT3ZOcHsgvI5Xu76NOR7PuxaSEHwDD9ojtmj1CRw0D0XjaKV+5XBGvULvxaToxms3MtBAdblEvRtLtyCHU17Mwv3yY6sIzkla9AlfU6CoSat+DWMvWEQq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQjBJr6e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQjBJr6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726049522; x=1757585522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zagk+xnsbK6oJg+bN34Rq509AziQTgIlzQwBjc1kDco=;
  b=CQjBJr6eAeCR7Feddwhy0q3l3jmAn59iamkZa5ZCw6cAnKAF8lABbBkS
   EW8f38a3JohokHnQWCsafAUoQdsO20ZzWxgPe83v6njQW9Xq9lRBXJgd6
   9QCztD8R9Gtx21JwAH0s4gMIPP8ZsyQ+PfNKNr8qIDNLf+B/Y6hULncyT
   YpzZbaWToymFWqXeWppuOUfM20/LtjVJLIMpVgqA3y++DR3cp5dH6/mW+
   66YZJ8NGaCsWwmkgByaNPmRZ9qE8RJUUfXgLYdZ4DyCZxT1cXCEUE/8NH
   5As4oLT8xh6OBPjxakhucD+wXSEH0YuOefxkGynLd5HGd+mMAXdLhaUbI
   A==;
X-CSE-ConnectionGUID: LaCSyfjLQrC0r4pI7DGANA==
X-CSE-MsgGUID: z/bs/SyyRMSmK0J0ymRnlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24711231"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="24711231"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:11:47 -0700
X-CSE-ConnectionGUID: l7OyQyphQ1uYqY1mkVXR7g==
X-CSE-MsgGUID: H89ORPvgTJuvyg1gyucI+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="66948430"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Sep 2024 03:11:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soKK7-0003Ma-0w;
	Wed, 11 Sep 2024 10:11:43 +0000
Date: Wed, 11 Sep 2024 18:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 11/11]
 crypto/asymmetric_keys/tpm2_key_ecdsa.c:222:26: warning: format specifies
 type 'unsigned int' but the argument has type 'off_t' (aka 'long')
Message-ID: <202409111825.DFufE4RC-lkp@intel.com>
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
commit: 79e909153c0a5ac21c2c5c0d4eac9229b3408178 [11/11] keys: asymmetric: Add tpm2_key_ecdsa
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240911/202409111825.DFufE4RC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111825.DFufE4RC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111825.DFufE4RC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:222:26: warning: format specifies type 'unsigned int' but the argument has type 'off_t' (aka 'long') [-Wformat]
     222 |                 pr_warn("offset=%u\n", offset);
         |                                 ~~     ^~~~~~
         |                                 %ld
   include/linux/printk.h:518:37: note: expanded from macro 'pr_warn'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:232:26: warning: format specifies type 'unsigned int' but the argument has type 'off_t' (aka 'long') [-Wformat]
     232 |                 pr_warn("offset=%u\n", offset);
         |                                 ~~     ^~~~~~
         |                                 %ld
   include/linux/printk.h:518:37: note: expanded from macro 'pr_warn'
     518 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |                                    ~~~     ^~~~~~~~~~~
   include/linux/printk.h:465:60: note: expanded from macro 'printk'
     465 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:437:19: note: expanded from macro 'printk_index_wrap'
     437 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> crypto/asymmetric_keys/tpm2_key_ecdsa.c:421:10: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
     421 |                 return ret;
         |                        ^~~
   crypto/asymmetric_keys/tpm2_key_ecdsa.c:417:9: note: initialize the variable 'ret' to silence this warning
     417 |         int ret;
         |                ^
         |                 = 0
   3 warnings generated.


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
   272	static int tpm2_key_ecdsa_eds_op(struct kernel_pkey_params *params,
   273					 const void *in, void *out)
   274	{
   275		struct tpm2_key *key = params->key->payload.data[asym_crypto];
   276		struct tpm_chip *chip = tpm_default_chip();
   277	
   278		if (!chip)
   279			return -ENODEV;
   280	
   281		switch (params->op) {
   282		case kernel_pkey_sign:
   283			return tpm2_key_ecdsa_sign(chip, key, params, in, out);
   284		default:
   285			return -EOPNOTSUPP;
   286		}
   287	}
   288	
   289	static int tpm2_key_ecdsa_verify_signature(const struct key *key,
   290						   const struct public_key_signature *sig)
   291	{
   292		const struct tpm2_key *tpm2_key = key->payload.data[asym_crypto];
   293		const off_t o = tpm2_key->priv_len + 2 + sizeof(*tpm2_key->desc);
   294		const struct tpm2_ecc_parms *p =
   295			(const struct tpm2_ecc_parms *)&tpm2_key->data[o];
   296		u16 ecc = be16_to_cpu(p->ecc);
   297		const char *ecc_name = tpm2_ecc_name(ecc);
   298		const u8 *x = tpm2_key_ecdsa_ecc_x(tpm2_key);
   299		u16 x_size = get_unaligned_be16(&x[0]);
   300		struct akcipher_request *req;
   301		struct scatterlist src_sg[2];
   302		struct crypto_akcipher *tfm;
   303		struct crypto_wait cwait;
   304		char data[256];
   305		u8 *ptr;
   306		int ret;
   307	
   308		tfm = crypto_alloc_akcipher(ecc_name, 0, 0);
   309		if (IS_ERR(tfm))
   310			return PTR_ERR(tfm);
   311	
   312		ptr = &data[0];
   313		*ptr++ = 0x04; /* uncompressed */
   314		memcpy(&ptr[0], &x[2], x_size);
   315		memcpy(&ptr[x_size], &x[2 + x_size + 2], x_size);
   316		ret = crypto_akcipher_set_pub_key(tfm, data, 2 * x_size + 1);
   317		if (ret)
   318			goto err_tfm;
   319	
   320		sha256(sig->digest, sig->digest_size, data);
   321	
   322		ret = -ENOMEM;
   323		req = akcipher_request_alloc(tfm, GFP_KERNEL);
   324		if (!req)
   325			goto err_tfm;
   326	
   327		sg_init_table(src_sg, 2);
   328		sg_set_buf(&src_sg[0], sig->s, sig->s_size);
   329		sg_set_buf(&src_sg[1], data, SHA256_DIGEST_SIZE);
   330	
   331		akcipher_request_set_crypt(req, src_sg, NULL, sig->s_size,
   332					   SHA256_DIGEST_SIZE);
   333	
   334		crypto_init_wait(&cwait);
   335		akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
   336					      CRYPTO_TFM_REQ_MAY_SLEEP,
   337					      crypto_req_done, &cwait);
   338	
   339		ret = crypto_wait_req(crypto_akcipher_verify(req), &cwait);
   340		if (ret) {
   341			pr_warn("crypto_wait_req() failed with %d\n", ret);
   342			goto err_tfm;
   343		}
   344	
   345		akcipher_request_free(req);
   346	
   347	err_tfm:
   348		crypto_free_akcipher(tfm);
   349		return ret;
   350	}
   351	
   352	/*
   353	 * Asymmetric TPM2 ECDSA key. Signs and decrypts with TPM.
   354	 */
   355	struct asymmetric_key_subtype tpm2_key_ecdsa_subtype = {
   356		.owner			= THIS_MODULE,
   357		.name			= "tpm2_key_ecdsa",
   358		.name_len		= sizeof("tpm2_key_ecdsa") - 1,
   359		.describe		= tpm2_key_ecdsa_describe,
   360		.destroy		= tpm2_key_ecdsa_destroy,
   361		.query			= tpm2_key_ecdsa_query,
   362		.eds_op			= tpm2_key_ecdsa_eds_op,
   363		.verify_signature	= tpm2_key_ecdsa_verify_signature,
   364	};
   365	EXPORT_SYMBOL_GPL(tpm2_key_ecdsa_subtype);
   366	
   367	static int __tpm2_key_ecdsa_preparse(struct tpm2_key *key)
   368	{
   369		const off_t o = key->priv_len + 2 + sizeof(*key->desc);
   370		const struct tpm2_ecc_parms *p =
   371			(const struct tpm2_ecc_parms *)&key->data[o];
   372		u16 x_size, y_size;
   373		const u8 *x, *y;
   374	
   375		if (tpm2_key_type(key) != TPM_ALG_ECC)
   376			return -EBADMSG;
   377	
   378		if (tpm2_key_policy_size(key) != 0)
   379			return -EBADMSG;
   380	
   381		if (be16_to_cpu(p->symmetric) != TPM_ALG_NULL)
   382			return -EBADMSG;
   383	
   384		if (be16_to_cpu(p->scheme) != TPM_ALG_NULL)
   385			return -EBADMSG;
   386	
   387		if (be16_to_cpu(p->ecc) != TPM2_ECC_NIST_P256 &&
   388		    be16_to_cpu(p->ecc) != TPM2_ECC_NIST_P384 &&
   389		    be16_to_cpu(p->ecc) != TPM2_ECC_NIST_P521)
   390			return -EBADMSG;
   391	
   392		if (be16_to_cpu(p->kdf) != TPM_ALG_NULL)
   393			return -EBADMSG;
   394	
   395		x = tpm2_key_ecdsa_ecc_x(key);
   396		x_size = get_unaligned_be16(&x[0]);
   397		if (x_size > ECC_MAX_BYTES)
   398			return -EBADMSG;
   399	
   400		y = tpm2_key_ecdsa_ecc_y(key);
   401		y_size = get_unaligned_be16(&y[0]);
   402		if (y_size > ECC_MAX_BYTES)
   403			return -EBADMSG;
   404	
   405		if (x_size != y_size)
   406			return -EBADMSG;
   407	
   408		return 0;
   409	}
   410	
   411	/*
   412	 * Attempt to parse a data blob for a key as a TPM private key blob.
   413	 */
   414	static int tpm2_key_ecdsa_preparse(struct key_preparsed_payload *prep)
   415	{
   416		struct tpm2_key *key;
   417		int ret;
   418	
   419		key = tpm2_key_decode(prep->data, prep->datalen);
   420		if (IS_ERR(key))
 > 421			return ret;
   422	
   423		if (key->oid != OID_TPMLoadableKey) {
   424			kfree(key);
   425			return -EBADMSG;
   426		}
   427	
   428		ret = __tpm2_key_ecdsa_preparse(key);
   429		if (ret < 0) {
   430			kfree(key);
   431			return ret;
   432		}
   433	
   434		prep->payload.data[asym_subtype] = &tpm2_key_ecdsa_subtype;
   435		prep->payload.data[asym_key_ids] = NULL;
   436		prep->payload.data[asym_crypto] = key;
   437		prep->payload.data[asym_auth] = NULL;
   438		prep->quotalen = 100;
   439		return 0;
   440	}
   441	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
