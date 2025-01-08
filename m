Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E3619AD8C
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 03:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736305212; cv=none; b=oYv9AyePETyWnCliKaC5mXSKs05MRFjvwyxFOI+uiIglK09F9+K4WIInLh1nsWksk2/VZomECqQqB3LCNdbyG9F24AElZh0CYIv1AbzqK3dck8RhFA7DGztWAlCw4dDzYfHP2kGw3Zx4prStwPSDY0n6hKA5MrTjbQJpsd65TMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736305212; c=relaxed/simple;
	bh=ZPTrpXkGX9nmBxXD0CGCvXyP0lMxseg+fJgQD8tUf4Y=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=fkAMQ4a6R5zcyT2YkK/8tt15oASTYVOov5fR40hffihmCNTl4TD6C0p4nLOjh1WPcZYlr5OdzwX+o8UEVh8G4sJVfyW/0FANQ6G0Hm08xmNAvbxYsAGArFrApFTLwoAzi0XiP//KoTLvkc83QPa95QaQOllJNm4uLtJ5UU+zt0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=J6hhKd2R; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="J6hhKd2R"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6d8f75b31bfso142347666d6.3
        for <llvm@lists.linux.dev>; Tue, 07 Jan 2025 19:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1736305208; x=1736910008; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7EaVgVQac1/TEDkojCgAqe//LrBeO261JouQgHJyfE=;
        b=J6hhKd2RkHGwdkegQpBFyNajW4rhVJ0YwKdy6znArNV6pSBZeYe63su/WfrqOY569s
         Qq6LjnW1EW1i7BkL24dSnA8tSc8ywQRfvhUivH5Lu5PxUx8y+ddYJkBGf7t0Vn8MWsX6
         IC03p9e6FG6+eZlBXpp1RPz74DH9qDOOsU/FKyHXd16LIramBmVYA75Fc23aL0HqUJ73
         G5MPiZEJu1Ntc/SuHhdvWDUPuw8HhBweiTWOTqU4mEVij6Jq2MvE7WGovAK3X6C2wBUP
         2MKVmweM/GuSFxcQRpG0opspYwIZR8Brv+RGND8/fopZHXRF/JqQrbGbMLRrRDVYYoFO
         jnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736305208; x=1736910008;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q7EaVgVQac1/TEDkojCgAqe//LrBeO261JouQgHJyfE=;
        b=gqpnEqyRBRP9I56IN+kobCTMK+X86C8Arwde1rPw1lMYEip741TLE///MMHoIrMWKy
         UE/QmosHSP03xIHoiZRhGQJixdrfSWqQMpiDjSIuDCvkAQlK30H9Yv/jZ68gCCmeZGLT
         Dw5PDFw2S31vvHbjPM4GPXSGIXmFinsMbkj/nAtQn/B+QB84FQFLy/ogxFTj+7IwRIfH
         hMz0MRPzi76euav95+kIDxLryOn/irve1mEr2CPZQejw5Hf9doJDPu0oqOPLm81Th3Xg
         U9/FU3p9N4/09WsshyfcEI+o0nq3a6qikpJzayXBd2ySJQAYcFsPAtoZER/4ftFgKi3T
         kJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYU2D12XqY3rEin99ajUHApp11s2zNvYOD8DIflmCopc+sM2QZq1dXHiXO86F+URqn/CxS@lists.linux.dev
X-Gm-Message-State: AOJu0YwLQH4lJxskDxjqyd4ZJh603R+CSYOo6if/XWUAfNUA1OORWJLY
	C6gvSGGyRlAy9Lug62w8l4KdnT7KrZYyOZzNzQ7xp1HtCW6yC5BZqEyK5V7/yg==
X-Gm-Gg: ASbGnctbHhIMepVWcw7/jOZCewzyFksSimM3dESlt/cnqpvLEbcRZPVep1SJHt4eY9B
	FlQKCacH9VPaLKKZA+16NL/jaGJrTqSexWqoIl5nfn8HzyGwY4qAY3Z1S7/dD/rPOFZSkRk4++j
	BSpfI7vlU1unH5bY9VWd72WGVotQh+opHoTS4myrJxnlQe9WDFWKaP42AIu0kKd9IvKpm9SB7pP
	bXBUAgL7b5fNaKs92/QjXwn0n4Sg/8oNQV4NWOCBuzVWmnuHLM=
X-Google-Smtp-Source: AGHT+IEsWE9jKo66b0sH4kNpmR4E5z25J+93wZQ/0L5/G7HovezZh2H2H6IY8vxs9TWJK0T88Zw41Q==
X-Received: by 2002:a05:6214:570b:b0:6dc:d101:2bb2 with SMTP id 6a1803df08f44-6df9b0ee9b8mr25760146d6.0.1736305207948;
        Tue, 07 Jan 2025 19:00:07 -0800 (PST)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd180ea955sm187463756d6.21.2025.01.07.19.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 19:00:07 -0800 (PST)
Date: Tue, 07 Jan 2025 22:00:07 -0500
Message-ID: <fdaab30bbed2fe6565fc78227d17cdfa@paul-moore.com>
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
Cc: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, =?UTF-8?q?Thi=C3=A9baud=20Weksteen?= <tweek@google.com>, =?UTF-8?q?Bram=20Bonn=C3=A9?= <brambonne@google.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Eric Suen <ericsu@linux.microsoft.com>
Subject: Re: [PATCH RFC v2 12/22] selinux: check length fields in policies
References: <20241216164055.96267-12-cgoettsche@seltendoof.de>
In-Reply-To: <20241216164055.96267-12-cgoettsche@seltendoof.de>

On Dec 16, 2024 =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgoettsche@seltendoof.de> wrote:
> 
> In multiple places the binary policy announces how many items of some
> kind are to be expected next.  Before reading them the kernel already
> allocates enough memory for that announced size.  Validate that the
> remaining input size can actually fit the announced items, to avoid OOM
> issues on malformed binary policies.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---
>  security/selinux/ss/avtab.c       |  4 ++++
>  security/selinux/ss/conditional.c | 14 ++++++++++++++
>  security/selinux/ss/policydb.c    | 23 +++++++++++++++++++++++
>  security/selinux/ss/policydb.h    | 13 +++++++++++++
>  4 files changed, 54 insertions(+)
> 
> diff --git a/security/selinux/ss/avtab.c b/security/selinux/ss/avtab.c
> index 3bd949a200ef..a7bf0ceb45d4 100644
> --- a/security/selinux/ss/avtab.c
> +++ b/security/selinux/ss/avtab.c
> @@ -550,6 +550,10 @@ int avtab_read(struct avtab *a, struct policy_file *fp, struct policydb *pol)
>  		goto bad;
>  	}
>  
> +	rc = oom_check(2 * sizeof(u32), nel, fp);
> +	if (rc)
> +		goto bad;
> +
>  	rc = avtab_alloc(a, nel);
>  	if (rc)
>  		goto bad;
> diff --git a/security/selinux/ss/conditional.c b/security/selinux/ss/conditional.c
> index 35442f4ceedf..de29948efb48 100644
> --- a/security/selinux/ss/conditional.c
> +++ b/security/selinux/ss/conditional.c
> @@ -12,6 +12,7 @@
>  
>  #include "security.h"
>  #include "conditional.h"
> +#include "policydb.h"
>  #include "services.h"
>  
>  /*
> @@ -329,6 +330,10 @@ static int cond_read_av_list(struct policydb *p, struct policy_file *fp,
>  	if (len == 0)
>  		return 0;
>  
> +	rc = oom_check(2 * sizeof(u32), len, fp);
> +	if (rc)
> +		return rc;

Magic number, we should make it obvious why '2' is being used, if we
can't do that we should add a comment.

This comment applies several other places in this patch, I'll refrain
from mentioning all of them.

> diff --git a/security/selinux/ss/policydb.c b/security/selinux/ss/policydb.c
> index 1275fd7d9148..4bc1e225f2fe 100644
> --- a/security/selinux/ss/policydb.c
> +++ b/security/selinux/ss/policydb.c
> @@ -1174,6 +1177,10 @@ static int common_read(struct policydb *p, struct symtab *s, struct policy_file
>  	if (nel > 32)
>  		goto bad;
>  
> +	rc = oom_check(/*guaranteed read by perm_read()*/2 * sizeof(u32), nel, fp);
> +	if (rc)
> +		goto bad;

Please don't add a comment *inside* code like that, it makes the code
awful to read.

> diff --git a/security/selinux/ss/policydb.h b/security/selinux/ss/policydb.h
> index 690dc4a00cf3..828fef98e340 100644
> --- a/security/selinux/ss/policydb.h
> +++ b/security/selinux/ss/policydb.h
> @@ -352,6 +352,19 @@ struct policy_data {
>  	struct policy_file *fp;
>  };
>  
> +static inline int oom_check(size_t bytes, size_t num, const struct policy_file *fp)
> +{
> +	size_t len;
> +
> +	if (unlikely(check_mul_overflow(bytes, num, &len)))
> +		return -EINVAL;
> +
> +	if (unlikely(len > fp->len))
> +		return -EINVAL;
> +
> +	return 0;
> +}

I'd prefer if we could use a different name than "oom_check()", perhaps
"size_check()"?

--
paul-moore.com
