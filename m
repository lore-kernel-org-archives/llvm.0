Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446014B964;
	Tue,  7 May 2024 20:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715112295; cv=none; b=fLWQrEK+uIWP0eSDfkjWhv9TwMMDbardZeKyrpOKQFPfjXibxUx4Qq92qpm6xTc+bOVw7MNt7Onm+rbx12OkfhMbRhRjXO0tEdBLDLo3f2Gf5EPEGE+me1h0EReXriKlxNPASP2uYfObyjJfknxn1uye5JZYdZoNY77PsGIN3n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715112295; c=relaxed/simple;
	bh=vb5g01Vrqfd5rLiIJwJd8F8XU4K60CBiSSyfxxyUwpo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RvEoqlXUFr3Kq4eKqItqHpRhcfqDAIXQi6wq+Qc8aJEF0LZHF8CKH1Vtkl3NLSYtEFlaly+vFJPA6OCEa2BcStb2cSSJEU4z+Aw8PyhMRuf7j7APPz+POuFhDPu/MH1maVB50kDn7gpiWQyVLD0vk1PIS7kary63gUvFnVVSB1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESQCO2uk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESQCO2uk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D135C4AF18;
	Tue,  7 May 2024 20:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715112295;
	bh=vb5g01Vrqfd5rLiIJwJd8F8XU4K60CBiSSyfxxyUwpo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ESQCO2ukmVeefXWhYm93UaatG7JsESy2a8ZrBR4kpH33S5RPS48204rTHJAf3vtkB
	 77jJaTr/yLJwgby5pgl4iDazT94NOMgea1SciddA2oVrhcysqJqs16lz58pdvax9n3
	 zLfb7dZYGOrn3Ivp9KXTBwgl7MOY1QiH3p5V19iDv1XOsGeCoaiUbqWdf/tcIfmv9D
	 +6yZYboGH8I69tDNR80wGPMausWS6fk40o1LKLH5ZDMdThRjwBVCfcIw4B2tygy6fR
	 yF68Tr8jpKm6VubJWfV0FsiPuG8vdd2MhsDl5a2Hy3Dvj8oyCcERSN1kTn1YnwQfvR
	 ZsgsTRzhyxhQw==
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 23:04:52 +0300
Message-Id: <D13OKDXSO6XC.14X4HTKK67VLW@kernel.org>
Cc: <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [jarkko-tpmdd:next 22/38] drivers/char/tpm/tpm2-sessions.c:23:
 warning: Excess function parameter 'returns' description in
 'tpm2_parse_create_primary'
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "kernel test robot" <lkp@intel.com>, "James Bottomley"
 <James.Bottomley@hansenpartnership.com>
X-Mailer: aerc 0.17.0
References: <202405060916.dUftOVIp-lkp@intel.com>
In-Reply-To: <202405060916.dUftOVIp-lkp@intel.com>

On Mon May 6, 2024 at 4:10 AM EEST, kernel test robot wrote:
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.=
git next
> head:   152585665f0f6b89e67ed6d04c17b18d1f0f4077
> commit: 1c8cb605890dc0ffc8e82e7d1f8594a4d7b7189a [22/38] tpm: Add NULL pr=
imary creation
> config: s390-defconfig (https://download.01.org/0day-ci/archive/20240506/=
202405060916.dUftOVIp-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 3=
7ae4ad0eef338776c7e2cffb3896153d43dcd90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240506/202405060916.dUftOVIp-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405060916.dUftOVIp-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/char/tpm/tpm2-sessions.c:23: warning: Excess function paramete=
r 'returns' description in 'tpm2_parse_create_primary'
> >> drivers/char/tpm/tpm2-sessions.c:186: warning: Excess function paramet=
er 'returns' description in 'tpm2_create_primary'
>
>
> vim +23 drivers/char/tpm/tpm2-sessions.c
>
>     10=09
>     11	/**
>     12	 * tpm2_parse_create_primary() - parse the data returned from TPM_=
CC_CREATE_PRIMARY
>     13	 *
>     14	 * @chip:	The TPM the primary was created under
>     15	 * @buf:	The response buffer from the chip
>     16	 * @handle:	pointer to be filled in with the return handle of the =
primary
>     17	 * @hierarchy:	The hierarchy the primary was created for
>     18	 *
>     19	 * @returns: 0 on success or a positive TPM or negative standard e=
rror
>     20	 */
>     21	static int tpm2_parse_create_primary(struct tpm_chip *chip, struct=
 tpm_buf *buf,
>     22					     u32 *handle, u32 hierarchy)
>   > 23	{
>     24		struct tpm_header *head =3D (struct tpm_header *)buf->data;
>     25		off_t offset_r =3D TPM_HEADER_SIZE, offset_t;
>     26		u16 len =3D TPM_HEADER_SIZE;
>     27		u32 total_len =3D be32_to_cpu(head->length);
>     28		u32 val, param_len;
>     29=09
>     30		*handle =3D tpm_buf_read_u32(buf, &offset_r);
>     31		param_len =3D tpm_buf_read_u32(buf, &offset_r);
>     32		/*
>     33		 * param_len doesn't include the header, but all the other
>     34		 * lengths and offsets do, so add it to parm len to make
>     35		 * the comparisons easier
>     36		 */
>     37		param_len +=3D TPM_HEADER_SIZE;
>     38=09
>     39		if (param_len + 8 > total_len)
>     40			return -EINVAL;
>     41		len =3D tpm_buf_read_u16(buf, &offset_r);
>     42		offset_t =3D offset_r;
>     43		/* now we have the public area, compute the name of the object */
>     44		put_unaligned_be16(TPM_ALG_SHA256, chip->null_key_name);
>     45		sha256(&buf->data[offset_r], len, chip->null_key_name + 2);
>     46=09
>     47		/* validate the public key */
>     48		val =3D tpm_buf_read_u16(buf, &offset_t);
>     49=09
>     50		/* key type (must be what we asked for) */
>     51		if (val !=3D TPM_ALG_ECC)
>     52			return -EINVAL;
>     53		val =3D tpm_buf_read_u16(buf, &offset_t);
>     54=09
>     55		/* name algorithm */
>     56		if (val !=3D TPM_ALG_SHA256)
>     57			return -EINVAL;
>     58		val =3D tpm_buf_read_u32(buf, &offset_t);
>     59=09
>     60		/* object properties */
>     61		if (val !=3D TPM2_OA_TMPL)
>     62			return -EINVAL;
>     63=09
>     64		/* auth policy (empty) */
>     65		val =3D tpm_buf_read_u16(buf, &offset_t);
>     66		if (val !=3D 0)
>     67			return -EINVAL;
>     68=09
>     69		/* symmetric key parameters */
>     70		val =3D tpm_buf_read_u16(buf, &offset_t);
>     71		if (val !=3D TPM_ALG_AES)
>     72			return -EINVAL;
>     73=09
>     74		/* symmetric key length */
>     75		val =3D tpm_buf_read_u16(buf, &offset_t);
>     76		if (val !=3D AES_KEY_BITS)
>     77			return -EINVAL;
>     78=09
>     79		/* symmetric encryption scheme */
>     80		val =3D tpm_buf_read_u16(buf, &offset_t);
>     81		if (val !=3D TPM_ALG_CFB)
>     82			return -EINVAL;
>     83=09
>     84		/* signing scheme */
>     85		val =3D tpm_buf_read_u16(buf, &offset_t);
>     86		if (val !=3D TPM_ALG_NULL)
>     87			return -EINVAL;
>     88=09
>     89		/* ECC Curve */
>     90		val =3D tpm_buf_read_u16(buf, &offset_t);
>     91		if (val !=3D TPM2_ECC_NIST_P256)
>     92			return -EINVAL;
>     93=09
>     94		/* KDF Scheme */
>     95		val =3D tpm_buf_read_u16(buf, &offset_t);
>     96		if (val !=3D TPM_ALG_NULL)
>     97			return -EINVAL;
>     98=09
>     99		/* extract public key (x and y points) */
>    100		val =3D tpm_buf_read_u16(buf, &offset_t);
>    101		if (val !=3D EC_PT_SZ)
>    102			return -EINVAL;
>    103		memcpy(chip->null_ec_key_x, &buf->data[offset_t], val);
>    104		offset_t +=3D val;
>    105		val =3D tpm_buf_read_u16(buf, &offset_t);
>    106		if (val !=3D EC_PT_SZ)
>    107			return -EINVAL;
>    108		memcpy(chip->null_ec_key_y, &buf->data[offset_t], val);
>    109		offset_t +=3D val;
>    110=09
>    111		/* original length of the whole TPM2B */
>    112		offset_r +=3D len;
>    113=09
>    114		/* should have exactly consumed the TPM2B public structure */
>    115		if (offset_t !=3D offset_r)
>    116			return -EINVAL;
>    117		if (offset_r > param_len)
>    118			return -EINVAL;
>    119=09
>    120		/* creation data (skip) */
>    121		len =3D tpm_buf_read_u16(buf, &offset_r);
>    122		offset_r +=3D len;
>    123		if (offset_r > param_len)
>    124			return -EINVAL;
>    125=09
>    126		/* creation digest (must be sha256) */
>    127		len =3D tpm_buf_read_u16(buf, &offset_r);
>    128		offset_r +=3D len;
>    129		if (len !=3D SHA256_DIGEST_SIZE || offset_r > param_len)
>    130			return -EINVAL;
>    131=09
>    132		/* TPMT_TK_CREATION follows */
>    133		/* tag, must be TPM_ST_CREATION (0x8021) */
>    134		val =3D tpm_buf_read_u16(buf, &offset_r);
>    135		if (val !=3D TPM2_ST_CREATION || offset_r > param_len)
>    136			return -EINVAL;
>    137=09
>    138		/* hierarchy */
>    139		val =3D tpm_buf_read_u32(buf, &offset_r);
>    140		if (val !=3D hierarchy || offset_r > param_len)
>    141			return -EINVAL;
>    142=09
>    143		/* the ticket digest HMAC (might not be sha256) */
>    144		len =3D tpm_buf_read_u16(buf, &offset_r);
>    145		offset_r +=3D len;
>    146		if (offset_r > param_len)
>    147			return -EINVAL;
>    148=09
>    149		/*
>    150		 * finally we have the name, which is a sha256 digest plus a 2
>    151		 * byte algorithm type
>    152		 */
>    153		len =3D tpm_buf_read_u16(buf, &offset_r);
>    154		if (offset_r + len !=3D param_len + 8)
>    155			return -EINVAL;
>    156		if (len !=3D SHA256_DIGEST_SIZE + 2)
>    157			return -EINVAL;
>    158=09
>    159		if (memcmp(chip->null_key_name, &buf->data[offset_r],
>    160			   SHA256_DIGEST_SIZE + 2) !=3D 0) {
>    161			dev_err(&chip->dev, "NULL Seed name comparison failed\n");
>    162			return -EINVAL;
>    163		}
>    164=09
>    165		return 0;
>    166	}
>    167=09
>    168	/**
>    169	 * tpm2_create_primary() - create a primary key using a fixed P-25=
6 template
>    170	 *
>    171	 * @chip:      the TPM chip to create under
>    172	 * @hierarchy: The hierarchy handle to create under
>    173	 * @handle:    The returned volatile handle on success
>    174	 *
>    175	 * For platforms that might not have a persistent primary, this ca=
n be
>    176	 * used to create one quickly on the fly (it uses Elliptic Curve n=
ot
>    177	 * RSA, so even slow TPMs can create one fast).  The template uses=
 the
>    178	 * TCG mandated H one for non-endorsement ECC primaries, i.e. P-25=
6
>    179	 * elliptic curve (the only current one all TPM2s are required to
>    180	 * have) a sha256 name hash and no policy.
>    181	 *
>    182	 * @returns: 0 on success or positive TPM or negative error.
>    183	 */
>    184	static int tpm2_create_primary(struct tpm_chip *chip, u32 hierarch=
y,
>    185				       u32 *handle)
>  > 186	{
>    187		int rc;
>    188		struct tpm_buf buf;
>    189		struct tpm_buf template;
>    190=09
>    191		rc =3D tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_CREATE_PRIMAR=
Y);
>    192		if (rc)
>    193			return rc;
>    194=09
>    195		rc =3D tpm_buf_init_sized(&template);
>    196		if (rc) {
>    197			tpm_buf_destroy(&buf);
>    198			return rc;
>    199		}
>    200=09
>    201		/*
>    202		 * create the template.  Note: in order for userspace to
>    203		 * verify the security of the system, it will have to create
>    204		 * and certify this NULL primary, meaning all the template
>    205		 * parameters will have to be identical, so conform exactly to
>    206		 * the TCG TPM v2.0 Provisioning Guidance for the SRK ECC
>    207		 * key H template (H has zero size unique points)
>    208		 */
>    209=09
>    210		/* key type */
>    211		tpm_buf_append_u16(&template, TPM_ALG_ECC);
>    212=09
>    213		/* name algorithm */
>    214		tpm_buf_append_u16(&template, TPM_ALG_SHA256);
>    215=09
>    216		/* object properties */
>    217		tpm_buf_append_u32(&template, TPM2_OA_TMPL);
>    218=09
>    219		/* sauth policy (empty) */
>    220		tpm_buf_append_u16(&template, 0);
>    221=09
>    222		/* BEGIN parameters: key specific; for ECC*/
>    223=09
>    224		/* symmetric algorithm */
>    225		tpm_buf_append_u16(&template, TPM_ALG_AES);
>    226=09
>    227		/* bits for symmetric algorithm */
>    228		tpm_buf_append_u16(&template, AES_KEY_BITS);
>    229=09
>    230		/* algorithm mode (must be CFB) */
>    231		tpm_buf_append_u16(&template, TPM_ALG_CFB);
>    232=09
>    233		/* scheme (NULL means any scheme) */
>    234		tpm_buf_append_u16(&template, TPM_ALG_NULL);
>    235=09
>    236		/* ECC Curve ID */
>    237		tpm_buf_append_u16(&template, TPM2_ECC_NIST_P256);
>    238=09
>    239		/* KDF Scheme */
>    240		tpm_buf_append_u16(&template, TPM_ALG_NULL);
>    241=09
>    242		/* unique: key specific; for ECC it is two zero size points */
>    243		tpm_buf_append_u16(&template, 0);
>    244		tpm_buf_append_u16(&template, 0);
>    245=09
>    246		/* END parameters */
>    247=09
>    248		/* primary handle */
>    249		tpm_buf_append_u32(&buf, hierarchy);
>    250		tpm_buf_append_empty_auth(&buf, TPM2_RS_PW);
>    251=09
>    252		/* sensitive create size is 4 for two empty buffers */
>    253		tpm_buf_append_u16(&buf, 4);
>    254=09
>    255		/* sensitive create auth data (empty) */
>    256		tpm_buf_append_u16(&buf, 0);
>    257=09
>    258		/* sensitive create sensitive data (empty) */
>    259		tpm_buf_append_u16(&buf, 0);
>    260=09
>    261		/* the public template */
>    262		tpm_buf_append(&buf, template.data, template.length);
>    263		tpm_buf_destroy(&template);
>    264=09
>    265		/* outside info (empty) */
>    266		tpm_buf_append_u16(&buf, 0);
>    267=09
>    268		/* creation PCR (none) */
>    269		tpm_buf_append_u32(&buf, 0);
>    270=09
>    271		rc =3D tpm_transmit_cmd(chip, &buf, 0,
>    272				      "attempting to create NULL primary");
>    273=09
>    274		if (rc =3D=3D TPM2_RC_SUCCESS)
>    275			rc =3D tpm2_parse_create_primary(chip, &buf, handle, hierarchy);
>    276=09
>    277		tpm_buf_destroy(&buf);
>    278=09
>    279		return rc;
>    280	}
>    281=09


diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessi=
ons.c
index fc3f032df467..78b94097114d 100644
--- a/drivers/char/tpm/tpm2-sessions.c
+++ b/drivers/char/tpm/tpm2-sessions.c
@@ -16,7 +16,10 @@
  * @handle:    pointer to be filled in with the return handle of the prima=
ry
  * @hierarchy: The hierarchy the primary was created for
  *
- * @returns: 0 on success or a positive TPM or negative standard error
+ * Return:
+ * * 0         - OK
+ * * -errno    - A system error
+ * * TPM_RC    - A TPM error
  */
 static int tpm2_parse_create_primary(struct tpm_chip *chip, struct tpm_buf=
 *buf,
                                     u32 *handle, u32 hierarchy)
@@ -179,7 +182,10 @@ static int tpm2_parse_create_primary(struct tpm_chip *=
chip, struct tpm_buf *buf,
  * elliptic curve (the only current one all TPM2s are required to
  * have) a sha256 name hash and no policy.
  *
- * @returns: 0 on success or positive TPM or negative error.
+ * Return:
+ * * 0         - OK
+ * * -errno    - A system error
+ * * TPM_RC    - A TPM error
  */
 static int tpm2_create_primary(struct tpm_chip *chip, u32 hierarchy,
                               u32 *handle)

I copy-pasted from tpm-interface.c

BR, Jarkko
