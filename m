Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF69719ADBA
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305211; cv=none; b=YTzaFNodZFjpHdF/hO6a6x+NPuVfFCL64JLBUdUoaLt+oeEDeqasmEFtJOPf//Iy8imUbdC7vDYJeclkfGymeOz9UXh3C56xmrcpFmtatrLSjTnBEGeiC5NqqoOjHxlzl1O5uRQvgO9Vh+OF2E8USKvt942Kk7TW9SiwVURLaxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305211; c=relaxed/simple;
	bh=IBgdwAJe5H17wbrZDVA2x27/kX07CfX/jTa/yjL7fA8=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Rl/THnW6jqOOxkU1kfLDX/CeTr/Tu+esAI8rAirtVb+wUjvkuG/IXo/X8mOWzcYaRXHhCmljGCLj57gDjY0vThr/1SghIQZrBKIws2EzpXGsmBXiJDuw2cYMP0JhQtBRl1Hy3YWkfgnLJZk1y0wL84QLsJKT6v2Hp6PqH/zfPTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=eqEYp/VE; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="eqEYp/VE"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dcf63155b0so73548166d6.1
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305207; x=1736910007; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y9p3PIyde0IryzmGRbQB6cL/YMYO2iIIebuEb1QLjCU=;
        b=eqEYp/VEQWf6GE2wsUEqTWznWyw1vBZb6N3Z3jjynK1cs7izc3tdVpmArSi6vA2wfB
         cpO1sqqw/6JSOQSNY2Lqj4jhARGEk4kLalh9fP8Za8fOX+EI1EJS63hRWDpQvaWoTDSO
         bBLnhWzivW9yry0SKZyzw+uLJWErS6MpMElso+etExVjPkgFKsz4QAsWl63pMN90L0v9
         e+ezY3Md4FtNAaaXKP38Ei5dEYm9M6p194Ua+TNcsLawwyZ9pUiSjg7Ort224vMlBn/q
         eD7K4/NFoS1EXXdgl6WOiYdVk9TxfBn8dV6L5X/t9BYrllLoL1sAUCtPsZl8W3SVB5+2
         +evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305207; x=1736910007;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y9p3PIyde0IryzmGRbQB6cL/YMYO2iIIebuEb1QLjCU=;
        b=U44Y+KEvRIMMu4HHSq0jjqmiw8v4T7QPWbntMzAFmfesAX6O+rlXmO7fmJ9AppGqdy
         EPyTWdaDhXywmBab930eeH/IJrfDKoF1wfp78sz7qG1N9fb/vQXRgxKPVr1I4SMPA6FI
         hAmDLu8vRpg+lrscWk1kYG8vuhK9/mOIUbxOYQdXc7FhDPgC+7NOly6D8d9J45lp3rGB
         LbmXoeCr0N8XXs0PyRLGvvQmyzC2hH33l5Ark6UuyO9unsrulJ4RUGV2YUl2YPMtSI6T
         n3WD4eYZRfRb5qC1dVRLdqZC9Ai4R9na7Si5RnjnO9YmkVyC6Q/5eYa6mSWD0u9tajx7
         1WNA==
X-Forwarded-Encrypted: i=1; AJvYcCUq0STf34xd6iQk5KdYwqFTNdzcjcPUttlGE8buqe6BQlhlHikj6PXtCnmRk3Hxg1Z+f8/C@lists.linux.dev
X-Gm-Message-State: AOJu0YxnM0z/58kuvceHZFbxV5VfPZ+69RcR6giEybSgTfzsIXPYSwhX
	OeExYn/UcLg+qTd2OcKs1HZkXadK2c951Xj1ZIisNohDqa4XST4kFiWeWki9rA==
X-Gm-Gg: ASbGnct1zEfS9EK38So4Ou16Te/+u/0xdW4t5+N3QmolEGw/zAOgDiHjTo+5grq5pvi
	zaISxpQhbYEPsayEWQ1dWx0yE632yUvHrS9mjwL01qgY5jkbQaRSmQfMZynqTpGbse8E+cskcKk
	qt46ID3iEUM5XoKWB+iC2H4kVQfS/9tx9P5WkbjfYLqGG8Ubgbzyq441xLSgoMeDTo7kQUFvwTO
	WpyKaZ7sgGLAadiDoPV8OfGVGHJw9m1U7SK+IAOcIoqtffj16E=
X-Google-Smtp-Source: AGHT+IFRMJcPrngiHqUMozYobBJyTgbsJI3kbTOpFCUuC+SScE55JPq+uPAFNcMMnkTChRvnis6FtQ==
X-Received: by 2002:a05:6214:252f:b0:6d8:7ed4:335b with SMTP id 6a1803df08f44-6df9b25f37dmr23741846d6.26.1736305207047;
        Tue, 07 Jan 2025 19:00:07 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6df99ff40easm4836756d6.3.2025.01.07.19.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:06 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:06 -0500
Message-ID: <ef5f7c20f5a3a485cdf2603ea4a4cde9@paul-moore.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250107_1610/pstg-lib:20250107_1603/pstg-pwork:20250107_1610
From: Paul Moore <paul@paul-moore.com>
To: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, selinux@vger.kernel.org
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Eric Suen <ericsu@linux.microsoft.com>, Casey Schaufler <casey@schaufler-ca.com>, Mimi Zohar <zohar@linux.ibm.com>, Canfeng Guo <guocanfeng@uniontech.com>, GUO Zihua <guozihua@huawei.com>
Subject: Re: [PATCH RFC v2 11/22] selinux: more strict policy parsing
References: <20241216164055.96267-11-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-11-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Be more strict during parsing of policies and reject invalid values.
> 
> Add some error messages in the case of policy parse failures, to
> enhance debugging, either on a malformed policy or a too strict check.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
> v2:
>   accept unknown xperm specifiers to support backwards compatibility for
>   future ones, suggested by Thiébaud
> ---
>  security/selinux/ss/avtab.c       |  37 +++++--
>  security/selinux/ss/conditional.c |  18 ++--
>  security/selinux/ss/constraint.h  |   2 +-
>  security/selinux/ss/policydb.c    | 157 ++++++++++++++++++++++++------
>  security/selinux/ss/policydb.h    |  19 +++-
>  security/selinux/ss/services.c    |   2 -
>  6 files changed, 182 insertions(+), 53 deletions(-)
> 
> diff --git a/security/selinux/ss/avtab.c b/security/selinux/ss/avtab.c
> index c2c31521cace..3bd949a200ef 100644
> --- a/security/selinux/ss/avtab.c
> +++ b/security/selinux/ss/avtab.c
> @@ -349,7 +349,7 @@ int avtab_read_item(struct avtab *a, struct policy_file *fp, struct policydb *po
>  	struct avtab_extended_perms xperms;
>  	__le32 buf32[ARRAY_SIZE(xperms.perms.p)];
>  	int rc;
> -	unsigned int set, vers = pol->policyvers;
> +	unsigned int vers = pol->policyvers;
>  
>  	memset(&key, 0, sizeof(struct avtab_key));
>  	memset(&datum, 0, sizeof(struct avtab_datum));
> @@ -361,8 +361,8 @@ int avtab_read_item(struct avtab *a, struct policy_file *fp, struct policydb *po
>  			return rc;
>  		}
>  		items2 = le32_to_cpu(buf32[0]);
> -		if (items2 > ARRAY_SIZE(buf32)) {
> -			pr_err("SELinux: avtab: entry overflow\n");
> +		if (items2 < 5 || items2 > ARRAY_SIZE(buf32)) {
> +			pr_err("SELinux: avtab: invalid item count\n");
>  			return -EINVAL;
>  		}

A reminder that magic numbers are a bad thing, if we can't make it clear
what the '5' in the conditional above represents by using a computed
value, let's either use a #define with a helpful name or a comment to
make this a bit more understandable.

> @@ -444,9 +456,13 @@ int avtab_read_item(struct avtab *a, struct policy_file *fp, struct policydb *po
>  		return -EINVAL;
>  	}
>  
> -	set = hweight16(key.specified & (AVTAB_XPERMS | AVTAB_TYPE | AVTAB_AV));
> -	if (!set || set > 1) {
> -		pr_err("SELinux:  avtab:  more than one specifier\n");
> +	if (hweight16(key.specified & ~AVTAB_ENABLED) != 1) {
> +		pr_err("SELinux:  avtab:  not exactly one specifier\n");
> +		return -EINVAL;
> +	}
> +
> +	if (key.specified & ~(AVTAB_AV | AVTAB_TYPE | AVTAB_XPERMS | AVTAB_ENABLED)) {
> +		pr_err("SELinux:  avtab:  invalid specifier\n");
>  		return -EINVAL;
>  	}

Let's define a macro in avtab.h with all of the allowed avtab key
values, otherwise I think people are going to forget about this check
when adding a new flag and they are going to get frustrated :)

> @@ -471,6 +487,15 @@ int avtab_read_item(struct avtab *a, struct policy_file *fp, struct policydb *po
>  			pr_err("SELinux: avtab: truncated entry\n");
>  			return rc;
>  		}
> +		switch (xperms.specified) {
> +		case AVTAB_XPERMS_IOCTLFUNCTION:
> +		case AVTAB_XPERMS_IOCTLDRIVER:
> +		case AVTAB_XPERMS_NLMSG:
> +			break;
> +		default:
> +			pr_warn_once_policyload(pol, "SELinux: avtab: unsupported xperm specifier %#x\n",
> +						xperms.specified);
> +		}

Similar to the avtab flags discussion above, can we create a small
inline function in avtab.h that checks to see if an xperm is valid?

  /* feel free to come up with a better name */
  static inline bool avtab_xpermspec_valid(u8 specified)
  {
    if (specified == AVTAB_XPERMS_IOCTLFUNCTION)
      return true;
    elif (...)
      return true;

    return false;
  }

> diff --git a/security/selinux/ss/constraint.h b/security/selinux/ss/constraint.h
> index 203033cfad67..26ffdb8c1c29 100644
> --- a/security/selinux/ss/constraint.h
> +++ b/security/selinux/ss/constraint.h
> @@ -50,7 +50,7 @@ struct constraint_expr {
>  	u32 op; /* operator */
>  
>  	struct ebitmap names; /* names */
> -	struct type_set *type_names;
> +	struct type_set *type_names; /* (unused) */

If we're not using this field, let's remove it.  If for some odd reason
we need to keep it here for size reasons, or something similar, let's
turn it into a 'void *unused;' field.

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index eeca470cc90c..1275fd7d9148 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -634,13 +634,11 @@ static int sens_index(void *key, void *datum, void *datap)
>  	levdatum = datum;
>  	p = datap;
>  
> -	if (!levdatum->isalias) {
> -		if (!levdatum->level.sens ||
> -		    levdatum->level.sens > p->p_levels.nprim)
> -			return -EINVAL;
> +	if (!levdatum->level.sens || levdatum->level.sens > p->p_levels.nprim)
> +		return -EINVAL;
>  
> +	if (!levdatum->isalias)
>  		p->sym_val_to_name[SYM_LEVELS][levdatum->level.sens - 1] = key;
> -	}
>  
>  	return 0;
>  }

Hmm, I don't think the code above does the error checking in the same
way, how about something like this:

  int sens_index(...)
  {
    if (isalias)
      return 0;
    if (!level->sens || level->send > levels.nprim)
      return -EINVAL;
    p = ...;
    return 0;
  }

> @@ -653,12 +651,11 @@ static int cat_index(void *key, void *datum, void *datap)
>  	catdatum = datum;
>  	p = datap;
>  
> -	if (!catdatum->isalias) {
> -		if (!catdatum->value || catdatum->value > p->p_cats.nprim)
> -			return -EINVAL;
> +	if (!catdatum->value || catdatum->value > p->p_cats.nprim)
> +		return -EINVAL;
>  
> +	if (!catdatum->isalias)
>  		p->sym_val_to_name[SYM_CATS][catdatum->value - 1] = key;
> -	}
>  
>  	return 0;
>  }

Similar to the sensitivity level comment above.

> @@ -1136,6 +1133,9 @@ static int perm_read(struct policydb *p, struct symtab *s, struct policy_file *f
>  
>  	len = le32_to_cpu(buf[0]);
>  	perdatum->value = le32_to_cpu(buf[1]);
> +	rc = -EINVAL;
> +	if (perdatum->value < 1 || perdatum->value > 32)
> +		goto bad;

More magic number problems.

>  	rc = str_read(&key, GFP_KERNEL, fp, len);
>  	if (rc)
> @@ -1170,6 +1170,9 @@ static int common_read(struct policydb *p, struct symtab *s, struct policy_file
>  	len = le32_to_cpu(buf[0]);
>  	comdatum->value = le32_to_cpu(buf[1]);
>  	nel = le32_to_cpu(buf[3]);
> +	rc = -EINVAL;
> +	if (nel > 32)
> +		goto bad;

Magic number.

>  	rc = symtab_init(&comdatum->permissions, nel);
>  	if (rc)
> @@ -1335,6 +1338,9 @@ static int class_read(struct policydb *p, struct symtab *s, struct policy_file *
>  	len = le32_to_cpu(buf[0]);
>  	len2 = le32_to_cpu(buf[1]);
>  	nel = le32_to_cpu(buf[4]);
> +	rc = -EINVAL;
> +	if (nel > 32)
> +		goto bad;

Again.

> @@ -1527,7 +1578,7 @@ static int type_read(struct policydb *p, struct symtab *s, struct policy_file *f
>   * Read a MLS level structure from a policydb binary
>   * representation file.
>   */
> -static int mls_read_level(struct mls_level *lp, struct policy_file *fp)
> +static int mls_read_level(const struct policydb *p, struct mls_level *lp, struct policy_file *fp)
>  {
>  	__le32 buf[1];
>  	int rc;

Why is this here?  You don't use the @p parameter anywhere in this
patch and it add some code churn in all of the callers.

> @@ -1606,7 +1657,7 @@ static int sens_read(struct policydb *p, struct symtab *s, struct policy_file *f
>  	struct level_datum *levdatum;
>  	int rc;
>  	__le32 buf[2];
> -	u32 len;
> +	u32 len, val;
>  
>  	levdatum = kzalloc(sizeof(*levdatum), GFP_KERNEL);
>  	if (!levdatum)
> @@ -1617,13 +1668,17 @@ static int sens_read(struct policydb *p, struct symtab *s, struct policy_file *f
>  		goto bad;
>  
>  	len = le32_to_cpu(buf[0]);
> -	levdatum->isalias = le32_to_cpu(buf[1]);
> +	val = le32_to_cpu(buf[1]);
> +	rc = -EINVAL;
> +	if (val != 0 && val != 1)
> +		goto bad;
> +	levdatum->isalias = val;

Should we have a simple inline function to do the integer boolean check?

Considering all the places we check for 0 and 1, it seems like it might
be a bit cleaner, and would help with self-documenting.

> @@ -2221,7 +2303,7 @@ static int genfs_read(struct policydb *p, struct policy_file *fp)
>  
>  			rc = -EINVAL;
>  			val = le32_to_cpu(buf[0]);
> -			if (val >= U16_MAX)
> +			if (val >= U16_MAX || (val != 0 && !policydb_class_isvalid(p, val)))
>  				goto out;
>  			newc->v.sclass = val;
>  			rc = context_read_and_validate(&newc->context[0], p,

This should probably be in patch 10/22, yes?

> @@ -110,15 +110,15 @@ struct role_allow {
>  /* Type attributes */
>  struct type_datum {
>  	u32 value; /* internal type value */
> -	u32 bounds; /* boundary of type */
> -	unsigned char primary; /* primary name? */
> +	u32 bounds; /* boundary of type, 0 for none */
> +	unsigned char primary; /* primary name? (unused) */

See my previous comment about unused fields.

>  #endif /* _SS_POLICYDB_H_ */
> diff --git a/security/selinux/ss/services.c b/security/selinux/ss/services.c
> index 28c0bdf9fc9d..d5725c768d59 100644
> --- a/security/selinux/ss/services.c
> +++ b/security/selinux/ss/services.c
> @@ -445,8 +445,6 @@ static int dump_masked_av_helper(void *k, void *d, void *args)
>  	struct perm_datum *pdatum = d;
>  	char **permission_names = args;
>  
> -	BUG_ON(pdatum->value < 1 || pdatum->value > 32);

Do we need to convert this to a if-then check that does the proper error
handling, or is it already handled in the other changes in this patch?

--
paul-moore.com
