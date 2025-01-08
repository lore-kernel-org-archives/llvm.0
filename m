Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09D21A2C27
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305210; cv=none; b=fl8nXtXonB3l9wwfjEHmYtm6pKICeli1sdTA0ec9UDVttz5UzQDKXWe2MCffigvHI4JG+ACR1bInZMjd7wvFXw7XNEie6PjPdy94+0M5HSGW/eOU64IM17Kj/kdjeSZ9XEfTgRmaYhozlZkyef9Qw9QH+NT8HdnGSKLW6mwSdVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305210; c=relaxed/simple;
	bh=HU8Sp7rs/6eXrWhZ8ytCpUps6t1FpHVBVNPG68KgZeA=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=mKkDSw+/uzqBTC91FMdgM4lqdz4lbx3irvvn6srp1Bm9ZQ6Ah4P4tY+tzaPEYi0fEau7FL5qZ7EW8wPKFfMMtO261i6ov5FexyAMlwlgHJSbVXAVU2lqqIcNV+Yz16Tngl53TM5yyBJFe17DcHE8BSRSvSIMmKqa/erGlGS56ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Wgm5171S; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Wgm5171S"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d92cd1e811so3758796d6.1
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305206; x=1736910006; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFffj8OyFUR0Q+SLXK1K0ik0lcMFfCXWhx7x0gzeudo=;
        b=Wgm5171SQ1ZSbjv/zWU6qq+cKpfc1Ej6RQtvD9QfI3FSAsjHm6DwY30O8aXKOpHMwv
         ZCYUR/W6IGdJ5Swrw3M6eLfOR5faAm2WklIvl4wMTEGGqFXIvb1rKMYVDgESebEmdeFl
         hfylR4LxcUFnE7qUeFBsvWEvK9wqa7r7THeY1QftGmkPw16M7tq4C2OQft8/vp1CL2CI
         YNvS6GKB0Fb+itFo8TBWQI6og40kW8NkZiR+2JSZ45lwJPs0G8uQCoMQ2Bi1CB+69ZJ8
         e5+AGjey2GXR8vGmWV0/f7r+rmu3oM7+Jak869dOkfF9Q0TG0Td2mgqjMToySDhcWH5d
         nOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305206; x=1736910006;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nFffj8OyFUR0Q+SLXK1K0ik0lcMFfCXWhx7x0gzeudo=;
        b=pPf/As7hl3gK0lkKacy5TPCZadVIlk2x4UOMry/AA2Kq7ieyFxGRjHEpPJ8KreiYxC
         dMl8ayTJU9S2biKS+0/JAY/uYsQigSzJ/OwXkK0FmntY3Etkbkkm4IWuh+fOPN66xJWm
         JXBZ8hjnpWe5mcKa1NtBP93SDFwz2qeUSZpdcjlYSBjzzp1zkiWXWSbEZ7RGaQ6XRkqr
         VWlkY9wgp3TY5djj38XQxJ8ispsxSNlZw+xGFLwuynJduADxAwrfIN4vuL7GhBEzMQpx
         r+YWS361DJ/hILE0cz8avyCdaoYW8BrjHjH+VyhdLn8h5Bvtj6935eXytTrD1JLtKTb4
         Bs0A==
X-Forwarded-Encrypted: i=1; AJvYcCXPcWskAvuUOXoqSFr+jvSCNd/DUd6LW8jxwR5ULgrObdCUadazraDv5hQLZovgQT+5Vrco@lists.linux.dev
X-Gm-Message-State: AOJu0YyaiX2axDmRWejVJuIlrQVNb6Of2wgz4soi+8VvmwaaP4+jThjo
	6R4diTOpSYTgi8bEMhaurQ8uvXqUtYOlvmsRrPWV1I2togXsNspFdBGowQ3PPw==
X-Gm-Gg: ASbGncuRO4hGDCPfrxQUK2Vd0ORGmx1Z/ozewXxEW+0RCci938zNgO3D7ql9C2WUFRS
	zUEIgXLLlnMRfdIC1OZonEt1NTphJFqHVPRzNIHMWZJ6A1ocmlDw+K9IQd6gfnNAxuA+OvxqLEB
	+DPGdkiGRy66I9M4of+PGab3DUCFl2PHmiroj/DHzmqyNeBAz2RHU94eeeCsbFrx0Gw/Yrzswe8
	iow8ZgGIGYl5dlFr2xpBN3gQ/Xk7bSQ3uHug4RikkJYIMJGKQM=
X-Google-Smtp-Source: AGHT+IGdp03/voSTgKYILgCBQb+C3zrHmVmP/meSGBil56EB+87hk12MwVh/nz/ecoIFTIdWZ/X//A==
X-Received: by 2002:ad4:5ba6:0:b0:6d8:ab3c:5d7 with SMTP id 6a1803df08f44-6df9ae6a5ebmr23852956d6.24.1736305205990;
        Tue, 07 Jan 2025 19:00:05 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180eaaa8sm186245836d6.1.2025.01.07.19.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:05 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:04 -0500
Message-ID: <06eb43271d150c5003b00baef7350161@paul-moore.com>
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
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Casey Schaufler <casey@schaufler-ca.com>, John Johansen <john.johansen@canonical.com>, GUO Zihua <guozihua@huawei.com>, Canfeng Guo <guocanfeng@uniontech.com>
Subject: Re: [PATCH RFC v2 10/22] selinux: use u16 for security classes
References: <20241216164055.96267-10-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-10-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> Security class identifiers are limited to 2^16, thus use the appropriate
> type u16 consistently.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/policydb.c | 52 +++++++++++++++++++++++++---------
>  security/selinux/ss/policydb.h | 10 +++----
>  security/selinux/ss/services.c |  2 +-
>  3 files changed, 45 insertions(+), 19 deletions(-)
> 
> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 2408c3e8ae39..eeca470cc90c 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -927,7 +927,7 @@ int policydb_load_isids(struct policydb *p, struct sidtab *s)
>  	return 0;
>  }
>  
> -int policydb_class_isvalid(struct policydb *p, unsigned int class)
> +int policydb_class_isvalid(struct policydb *p, u16 class)
>  {
>  	if (!class || class > p->p_classes.nprim)
>  		return 0;
> @@ -1321,7 +1321,7 @@ static int class_read(struct policydb *p, struct symtab *s, struct policy_file *
>  	char *key = NULL;
>  	struct class_datum *cladatum;
>  	__le32 buf[6];
> -	u32 i, len, len2, ncons, nel;
> +	u32 i, len, len2, ncons, nel, val;
>  	int rc;
>  
>  	cladatum = kzalloc(sizeof(*cladatum), GFP_KERNEL);
> @@ -1334,9 +1334,14 @@ static int class_read(struct policydb *p, struct symtab *s, struct policy_file *
>  
>  	len = le32_to_cpu(buf[0]);
>  	len2 = le32_to_cpu(buf[1]);
> -	cladatum->value = le32_to_cpu(buf[2]);
>  	nel = le32_to_cpu(buf[4]);
>  
> +	val = le32_to_cpu(buf[2]);
> +	rc = -EINVAL;
> +	if (val >= U16_MAX)
> +		goto bad;

While this is a major issue, isn't U16_MAX technically still valid?  In
other words should this be: '(val > U16_MAX)'?

> @@ -1939,7 +1948,11 @@ static int filename_trans_read_helper_compat(struct policydb *p, struct policy_f
>  
>  	stype = le32_to_cpu(buf[0]);
>  	key.ttype = le32_to_cpu(buf[1]);
> -	key.tclass = le32_to_cpu(buf[2]);
> +	val = le32_to_cpu(buf[2]);
> +	rc = -EINVAL;
> +	if (val > U16_MAX || !policydb_class_isvalid(p, val))
> +		goto out;

We should split out the class validity check into a separate patch and
keep this just as the subject states: consolidate the class type to u16.

As an aside, I'm going to do a quick review pass on the rest of the
patches in this series, but I'm not going to merge them as I keep
hitting a number of merge failures due to this patch not being applied
and I'd rather not have to fix them all up :)

--
paul-moore.com
