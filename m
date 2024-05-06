Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FB61A28D;
	Mon,  6 May 2024 01:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714957849; cv=none; b=NJxNZzSqzqkctgskFcJmVivktNZmvaW1aJ14DOfOwva3ljKJb8ch9uaPcBwM/41xWkUUP+uXHeP1A+n5ruBff3R4K0medJwQnl+onQhF4Bd2cLOAD1DeGJeQuhjXpbJPa2XIzwbNIiLXi1BczHwMvJBmYaYIbqBobhA+r/WBTCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714957849; c=relaxed/simple;
	bh=lPXXnltbJJ+f8pTqAZNn0UTBBbv0LyIY6nmW73RGIn8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZkyTk05sPFmyrBEko/0sR5AiITGUiquIXgWk69kAqGOvSTBYIX3L6qcHmPaa3RjkWfJOArrOLkW7XusHheqecWj8siTl0Nkk878OviMJEsLqxBnNYPT+dfHYWh9T9jb09l1az2npE/zd6wvBnK0sZbkbKg5S53wldc/rPGcyhTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SfDOTfcH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SfDOTfcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714957847; x=1746493847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lPXXnltbJJ+f8pTqAZNn0UTBBbv0LyIY6nmW73RGIn8=;
  b=SfDOTfcHft7V7JCU1hM597qtrYsCgZPs6ed0i0bovvndZHnYjPUJ3Jgu
   SYsvI9i1ebz/NvdNxTQU3X6RKLCjSbR69+xBMzFZ06qlcU0bqlTA7Wbz4
   sVabjETcg1G6lgI5/ezJCXMIGf+EDQZ+nMg5i8BfNhqxrbPDB4gT5n2L8
   boJEnHXaW/vUNTy7trfLvnpvdYFYrfjWn2hdh260o3+Dtz5TKjbTHiazE
   1GjdjdSC3zL+tj63eyUO3gclMcJZtlj3YbisYYlIyMyVk22/cJsAFhr3n
   erw7RuuT7+O/vB/P9cvXTqUd76DaUioKfIe4Y/JCxBVJCjx0vgSw1Myrw
   A==;
X-CSE-ConnectionGUID: gm883TGhQ4OVZiEThyGS7Q==
X-CSE-MsgGUID: JPGjIsQYTL+Ef28SP2QBYw==
X-IronPort-AV: E=McAfee;i="6600,9927,11064"; a="10567735"
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="10567735"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2024 18:10:46 -0700
X-CSE-ConnectionGUID: 72HI5nxhT4CPhrFPdNE0Aw==
X-CSE-MsgGUID: 8KrbtshzTsSDGxzyJiO3HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,257,1708416000"; 
   d="scan'208";a="51184718"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 May 2024 18:10:45 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3msN-0000KO-0R;
	Mon, 06 May 2024 01:10:43 +0000
Date: Mon, 6 May 2024 09:10:23 +0800
From: kernel test robot <lkp@intel.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:next 22/38] drivers/char/tpm/tpm2-sessions.c:23:
 warning: Excess function parameter 'returns' description in
 'tpm2_parse_create_primary'
Message-ID: <202405060916.dUftOVIp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git next
head:   152585665f0f6b89e67ed6d04c17b18d1f0f4077
commit: 1c8cb605890dc0ffc8e82e7d1f8594a4d7b7189a [22/38] tpm: Add NULL primary creation
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240506/202405060916.dUftOVIp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405060916.dUftOVIp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405060916.dUftOVIp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/char/tpm/tpm2-sessions.c:23: warning: Excess function parameter 'returns' description in 'tpm2_parse_create_primary'
>> drivers/char/tpm/tpm2-sessions.c:186: warning: Excess function parameter 'returns' description in 'tpm2_create_primary'


vim +23 drivers/char/tpm/tpm2-sessions.c

    10	
    11	/**
    12	 * tpm2_parse_create_primary() - parse the data returned from TPM_CC_CREATE_PRIMARY
    13	 *
    14	 * @chip:	The TPM the primary was created under
    15	 * @buf:	The response buffer from the chip
    16	 * @handle:	pointer to be filled in with the return handle of the primary
    17	 * @hierarchy:	The hierarchy the primary was created for
    18	 *
    19	 * @returns: 0 on success or a positive TPM or negative standard error
    20	 */
    21	static int tpm2_parse_create_primary(struct tpm_chip *chip, struct tpm_buf *buf,
    22					     u32 *handle, u32 hierarchy)
  > 23	{
    24		struct tpm_header *head = (struct tpm_header *)buf->data;
    25		off_t offset_r = TPM_HEADER_SIZE, offset_t;
    26		u16 len = TPM_HEADER_SIZE;
    27		u32 total_len = be32_to_cpu(head->length);
    28		u32 val, param_len;
    29	
    30		*handle = tpm_buf_read_u32(buf, &offset_r);
    31		param_len = tpm_buf_read_u32(buf, &offset_r);
    32		/*
    33		 * param_len doesn't include the header, but all the other
    34		 * lengths and offsets do, so add it to parm len to make
    35		 * the comparisons easier
    36		 */
    37		param_len += TPM_HEADER_SIZE;
    38	
    39		if (param_len + 8 > total_len)
    40			return -EINVAL;
    41		len = tpm_buf_read_u16(buf, &offset_r);
    42		offset_t = offset_r;
    43		/* now we have the public area, compute the name of the object */
    44		put_unaligned_be16(TPM_ALG_SHA256, chip->null_key_name);
    45		sha256(&buf->data[offset_r], len, chip->null_key_name + 2);
    46	
    47		/* validate the public key */
    48		val = tpm_buf_read_u16(buf, &offset_t);
    49	
    50		/* key type (must be what we asked for) */
    51		if (val != TPM_ALG_ECC)
    52			return -EINVAL;
    53		val = tpm_buf_read_u16(buf, &offset_t);
    54	
    55		/* name algorithm */
    56		if (val != TPM_ALG_SHA256)
    57			return -EINVAL;
    58		val = tpm_buf_read_u32(buf, &offset_t);
    59	
    60		/* object properties */
    61		if (val != TPM2_OA_TMPL)
    62			return -EINVAL;
    63	
    64		/* auth policy (empty) */
    65		val = tpm_buf_read_u16(buf, &offset_t);
    66		if (val != 0)
    67			return -EINVAL;
    68	
    69		/* symmetric key parameters */
    70		val = tpm_buf_read_u16(buf, &offset_t);
    71		if (val != TPM_ALG_AES)
    72			return -EINVAL;
    73	
    74		/* symmetric key length */
    75		val = tpm_buf_read_u16(buf, &offset_t);
    76		if (val != AES_KEY_BITS)
    77			return -EINVAL;
    78	
    79		/* symmetric encryption scheme */
    80		val = tpm_buf_read_u16(buf, &offset_t);
    81		if (val != TPM_ALG_CFB)
    82			return -EINVAL;
    83	
    84		/* signing scheme */
    85		val = tpm_buf_read_u16(buf, &offset_t);
    86		if (val != TPM_ALG_NULL)
    87			return -EINVAL;
    88	
    89		/* ECC Curve */
    90		val = tpm_buf_read_u16(buf, &offset_t);
    91		if (val != TPM2_ECC_NIST_P256)
    92			return -EINVAL;
    93	
    94		/* KDF Scheme */
    95		val = tpm_buf_read_u16(buf, &offset_t);
    96		if (val != TPM_ALG_NULL)
    97			return -EINVAL;
    98	
    99		/* extract public key (x and y points) */
   100		val = tpm_buf_read_u16(buf, &offset_t);
   101		if (val != EC_PT_SZ)
   102			return -EINVAL;
   103		memcpy(chip->null_ec_key_x, &buf->data[offset_t], val);
   104		offset_t += val;
   105		val = tpm_buf_read_u16(buf, &offset_t);
   106		if (val != EC_PT_SZ)
   107			return -EINVAL;
   108		memcpy(chip->null_ec_key_y, &buf->data[offset_t], val);
   109		offset_t += val;
   110	
   111		/* original length of the whole TPM2B */
   112		offset_r += len;
   113	
   114		/* should have exactly consumed the TPM2B public structure */
   115		if (offset_t != offset_r)
   116			return -EINVAL;
   117		if (offset_r > param_len)
   118			return -EINVAL;
   119	
   120		/* creation data (skip) */
   121		len = tpm_buf_read_u16(buf, &offset_r);
   122		offset_r += len;
   123		if (offset_r > param_len)
   124			return -EINVAL;
   125	
   126		/* creation digest (must be sha256) */
   127		len = tpm_buf_read_u16(buf, &offset_r);
   128		offset_r += len;
   129		if (len != SHA256_DIGEST_SIZE || offset_r > param_len)
   130			return -EINVAL;
   131	
   132		/* TPMT_TK_CREATION follows */
   133		/* tag, must be TPM_ST_CREATION (0x8021) */
   134		val = tpm_buf_read_u16(buf, &offset_r);
   135		if (val != TPM2_ST_CREATION || offset_r > param_len)
   136			return -EINVAL;
   137	
   138		/* hierarchy */
   139		val = tpm_buf_read_u32(buf, &offset_r);
   140		if (val != hierarchy || offset_r > param_len)
   141			return -EINVAL;
   142	
   143		/* the ticket digest HMAC (might not be sha256) */
   144		len = tpm_buf_read_u16(buf, &offset_r);
   145		offset_r += len;
   146		if (offset_r > param_len)
   147			return -EINVAL;
   148	
   149		/*
   150		 * finally we have the name, which is a sha256 digest plus a 2
   151		 * byte algorithm type
   152		 */
   153		len = tpm_buf_read_u16(buf, &offset_r);
   154		if (offset_r + len != param_len + 8)
   155			return -EINVAL;
   156		if (len != SHA256_DIGEST_SIZE + 2)
   157			return -EINVAL;
   158	
   159		if (memcmp(chip->null_key_name, &buf->data[offset_r],
   160			   SHA256_DIGEST_SIZE + 2) != 0) {
   161			dev_err(&chip->dev, "NULL Seed name comparison failed\n");
   162			return -EINVAL;
   163		}
   164	
   165		return 0;
   166	}
   167	
   168	/**
   169	 * tpm2_create_primary() - create a primary key using a fixed P-256 template
   170	 *
   171	 * @chip:      the TPM chip to create under
   172	 * @hierarchy: The hierarchy handle to create under
   173	 * @handle:    The returned volatile handle on success
   174	 *
   175	 * For platforms that might not have a persistent primary, this can be
   176	 * used to create one quickly on the fly (it uses Elliptic Curve not
   177	 * RSA, so even slow TPMs can create one fast).  The template uses the
   178	 * TCG mandated H one for non-endorsement ECC primaries, i.e. P-256
   179	 * elliptic curve (the only current one all TPM2s are required to
   180	 * have) a sha256 name hash and no policy.
   181	 *
   182	 * @returns: 0 on success or positive TPM or negative error.
   183	 */
   184	static int tpm2_create_primary(struct tpm_chip *chip, u32 hierarchy,
   185				       u32 *handle)
 > 186	{
   187		int rc;
   188		struct tpm_buf buf;
   189		struct tpm_buf template;
   190	
   191		rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE_PRIMARY);
   192		if (rc)
   193			return rc;
   194	
   195		rc = tpm_buf_init_sized(&template);
   196		if (rc) {
   197			tpm_buf_destroy(&buf);
   198			return rc;
   199		}
   200	
   201		/*
   202		 * create the template.  Note: in order for userspace to
   203		 * verify the security of the system, it will have to create
   204		 * and certify this NULL primary, meaning all the template
   205		 * parameters will have to be identical, so conform exactly to
   206		 * the TCG TPM v2.0 Provisioning Guidance for the SRK ECC
   207		 * key H template (H has zero size unique points)
   208		 */
   209	
   210		/* key type */
   211		tpm_buf_append_u16(&template, TPM_ALG_ECC);
   212	
   213		/* name algorithm */
   214		tpm_buf_append_u16(&template, TPM_ALG_SHA256);
   215	
   216		/* object properties */
   217		tpm_buf_append_u32(&template, TPM2_OA_TMPL);
   218	
   219		/* sauth policy (empty) */
   220		tpm_buf_append_u16(&template, 0);
   221	
   222		/* BEGIN parameters: key specific; for ECC*/
   223	
   224		/* symmetric algorithm */
   225		tpm_buf_append_u16(&template, TPM_ALG_AES);
   226	
   227		/* bits for symmetric algorithm */
   228		tpm_buf_append_u16(&template, AES_KEY_BITS);
   229	
   230		/* algorithm mode (must be CFB) */
   231		tpm_buf_append_u16(&template, TPM_ALG_CFB);
   232	
   233		/* scheme (NULL means any scheme) */
   234		tpm_buf_append_u16(&template, TPM_ALG_NULL);
   235	
   236		/* ECC Curve ID */
   237		tpm_buf_append_u16(&template, TPM2_ECC_NIST_P256);
   238	
   239		/* KDF Scheme */
   240		tpm_buf_append_u16(&template, TPM_ALG_NULL);
   241	
   242		/* unique: key specific; for ECC it is two zero size points */
   243		tpm_buf_append_u16(&template, 0);
   244		tpm_buf_append_u16(&template, 0);
   245	
   246		/* END parameters */
   247	
   248		/* primary handle */
   249		tpm_buf_append_u32(&buf, hierarchy);
   250		tpm_buf_append_empty_auth(&buf, TPM2_RS_PW);
   251	
   252		/* sensitive create size is 4 for two empty buffers */
   253		tpm_buf_append_u16(&buf, 4);
   254	
   255		/* sensitive create auth data (empty) */
   256		tpm_buf_append_u16(&buf, 0);
   257	
   258		/* sensitive create sensitive data (empty) */
   259		tpm_buf_append_u16(&buf, 0);
   260	
   261		/* the public template */
   262		tpm_buf_append(&buf, template.data, template.length);
   263		tpm_buf_destroy(&template);
   264	
   265		/* outside info (empty) */
   266		tpm_buf_append_u16(&buf, 0);
   267	
   268		/* creation PCR (none) */
   269		tpm_buf_append_u32(&buf, 0);
   270	
   271		rc = tpm_transmit_cmd(chip, &buf, 0,
   272				      "attempting to create NULL primary");
   273	
   274		if (rc == TPM2_RC_SUCCESS)
   275			rc = tpm2_parse_create_primary(chip, &buf, handle, hierarchy);
   276	
   277		tpm_buf_destroy(&buf);
   278	
   279		return rc;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
