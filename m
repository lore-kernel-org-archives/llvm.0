Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED81FE47C
	for <llvm@lists.linux.dev>; Mon,  8 Sep 2025 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757348124; cv=none; b=g+4anqniKqd9xHyE0+JNPg5RM9O7VpGLJjtkpGBjV9+oJcKmEkKUHLPKhmOAUk3F0RJjUDVQJHWJx+fd6Bvv5Lf+mP4kBm9id7wH4lKHlj+JmKW8I7fs0uFjHZNGOBVNo+VNviS0oybEA3VuEYGyH/AVhbgA6dQ23q4hZCoapGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757348124; c=relaxed/simple;
	bh=uNUru7zzYgB2sxMmEWKB29J1/DPZc3utoJ6hlH1gScQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bRzBwW6hr1auNNuvmMB8l/pIAR4pwulRdn64fn06T6NUOdyYNeptXQuot8mwvZSyvk74cdGvKPEGaW1NrHajP2f0RIeJoeDLenDYwfNX0cNRbydCGn4xZYCHoRzrXHdk0Ne5dk3tp1/7nr22dbESYx2nVPX1sxOnetLep69wFeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D1mY48Ny; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D1mY48Ny"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5607a16639aso11656e87.1
        for <llvm@lists.linux.dev>; Mon, 08 Sep 2025 09:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757348120; x=1757952920; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNjG+KitGlrkzDIU5rpQqLyG76T9yZIXGSuaiItNQ8Y=;
        b=D1mY48Ny3Y8/cwS+avGoVJ9II11iQ2CcNF1jESfCdhPls74KZYu03UPmGyj0wdVk8J
         gaO/VN2QygtLSA+5A0SyOoDSsMnisIIP7ZSOAS/KW1ZDmlzVjpBjw8bHraOfCc2vvjaM
         lDRhcd4mWTwkTBV94bv5pOfardbtiHdKWK++ekHv501L7YzGUP/Tg5QMuAIhXPaSD7sb
         D/iKDICuUo0SqI8olT8l1CU+lsynteoakn65W36hXYRpTc/HRYC3lrUoO+neX0PFlUor
         T9fRsz4tBC8tv2hD+fv2EWuTbQfmU5T4+TmtES/eVCHWGx/UubZwy7kRpat3+FiJDG/L
         SHzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757348120; x=1757952920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNjG+KitGlrkzDIU5rpQqLyG76T9yZIXGSuaiItNQ8Y=;
        b=gtZg3bX/PP237amzeHQXHCiZ4JHmaPcDATVC9LzOaVeKo9vwBPmQdXzgKupihMvbAo
         jV2ZyZ44jkBGBnGYnW9diI1My6ImJJ+6aUS+8Oi8MB1qVObauBNZ0A3gHRhu7PrXtbz+
         CEoqhhj/1/unCtsbRg1Ec/e7ZYiuD5Y171bA5AgdVxQfUJziBbPc/F/3V5NXRKFQXYO1
         gqQEi7zPXMKv8qPsJyuLRSSolDk4Zhn7k45Iyr+WshKVQ+/cAgIUz+k6fph0Csc/COID
         XNvdc9BaizfNH7LyXo3NkCsYeLvytsj514rSfmqQaASZBrrgsRO1NIKgJ8NTa70ExeZq
         by3g==
X-Forwarded-Encrypted: i=1; AJvYcCVGtgmkJiyT5IUtTCSCeeaTScDXzdx/sGO2ZjaKONy8ZJCxyLkkmzJxJbj5Z/l7Ic6Ebdlh@lists.linux.dev
X-Gm-Message-State: AOJu0YznYNB+0iybvVzPAkkYQ5p8ohPCi6qi2YPzaETpCvwR88J3PUrg
	KA+JcSyinftXpevIeKycvM+B1Gp2v9iOA/KW/Y4badVetxjq/9VTrfi+wnEMShJYGzqIm90Q+2I
	7ebGIBRo0aHarWkfoa5AhV+bErjCf2niq8UN8s3D5
X-Gm-Gg: ASbGncuYxPms36JgrsCuVWK2zmkVuTIfn3ivTl41bSPDTr8W6yjH6xAGR6GjYX81cLF
	PHuOCa133yCiwvu0ucHqWmtgzMBZZRe1CRLQlqSF1SY3QX/yY+tfCtznk4maSELFeeK6xWz5/eU
	/3ZKiMw+t30zRO0LzLlhPRTyIa3/wm2DH8vwbxvcvFyytYbT6N71zKnlDA/ETJZUmqdawGP34xd
	s/ysOwqNyzZn1Lk71yD9zXr2A==
X-Google-Smtp-Source: AGHT+IHCFgf2RdVhu8TYS/rYvOmOVPxQpbxz1eazegKbLqZhwrcdPrTR9V2NoZ6tvq3rImVDtk9v8k9/bM5/xLJZgbQ=
X-Received: by 2002:a05:6512:15a9:b0:55f:6ac4:c3b2 with SMTP id
 2adb3069b0e04-5624189cb92mr517813e87.0.1757348119215; Mon, 08 Sep 2025
 09:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908152123.97829-1-kuba@kernel.org>
In-Reply-To: <20250908152123.97829-1-kuba@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 8 Sep 2025 09:15:07 -0700
X-Gm-Features: Ac12FXxUA5KIQ6gt91UijVuNGZtQcZZQjXWdNtL3h7riklG-58cTNHxzxIEdFLs
Message-ID: <CAHS8izPRupVvCDQr7-GF+-c3yeu83wZWgQth4_ub8bQ0AhQ9_w@mail.gmail.com>
Subject: Re: [PATCH net-next] page_pool: always add GFP_NOWARN for ATOMIC allocations
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 8, 2025 at 8:21=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> Driver authors often forget to add GFP_NOWARN for page allocation
> from the datapath. This is annoying to operators as OOMs are a fact
> of life, and we pretty much expect network Rx to hit page allocation
> failures during OOM. Make page pool add GFP_NOWARN for ATOMIC allocations
> by default.
>
> Don't compare to GFP_ATOMIC because it's a mask with 2 bits set.
> We want a single bit so that the compiler can do an unconditional
> mask and shift. clang builds the condition as:
>
>     1c31: 89 e8                         movl    %ebp, %eax
>     1c33: 83 e0 20                      andl    $0x20, %eax
>     1c36: c1 e0 0d                      shll    $0xd, %eax
>     1c39: 09 e8                         orl     %ebp, %eax
>
> so there seems to be no need any more to use the old flag multiplication
> tricks which is less readable. Pick the lowest bit out of GFP_ATOMIC
> to limit the size of the instructions.
>
> The specific change which makes me propose this is that bnxt, after
> commit cd1fafe7da1f ("eth: bnxt: add support rx side device memory TCP"),
> lost the GFP_NOWARN, again. It used to allocate with page_pool_dev_alloc_=
*

BTW, there is a page_pool_dev_alloc_netmems now that also add the
NOWARN and should have been devmem tcp compatible and maintained same
behavior I think.

> which added the NOWARN unconditionally. While switching to
> __bnxt_alloc_rx_netmem() authors forgot to add NOWARN in the explicitly
> specified flags.
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: hawk@kernel.org
> CC: ilias.apalodimas@linaro.org
> CC: nathan@kernel.org
> CC: nick.desaulniers+lkml@gmail.com
> CC: morbo@google.com
> CC: justinstitt@google.com
> CC: llvm@lists.linux.dev
> ---
>  net/core/page_pool.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index ba70569bd4b0..6ffce0e821e4 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -555,6 +555,13 @@ static noinline netmem_ref __page_pool_alloc_netmems=
_slow(struct page_pool *pool
>         netmem_ref netmem;
>         int i, nr_pages;
>
> +       /* Unconditionally set NOWARN if allocating from the datapath.
> +        * Use a single bit from the ATOMIC mask to help compiler optimiz=
e.
> +        */
> +       BUILD_BUG_ON(!(GFP_ATOMIC & __GFP_HIGH));
> +       if (gfp & __GFP_HIGH)
> +               gfp |=3D __GFP_NOWARN;
> +

I wonder if pp allocs are ever used for anything other than datapath
pages (and if not, we can add __GPF_NOWARN here unconditionally. But
this is good too I think.

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
