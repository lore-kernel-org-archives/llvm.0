Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140E20765E
	for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 18:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734374717; cv=none; b=QpVjD1sua9ipt1/nIfBkGraYr3w9Cry1acepmNWQ72qO2kMz0kimeD6COb9P4/T5DU+l1TUln4QlsHJeVwm1gK64PU8sgeC0X/f7kGWq66crqhBuQ6pw5XJupt/g8Us0hhA1tULnuSQRTxPplgs0vVzfya6YDC+jHmKDpP/hDfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734374717; c=relaxed/simple;
	bh=wPhuadXVqq3NRot78X0jrmq9xXlKWbFpMlJqSo/gcfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ObDn8CPLBHnQvgiHgVvDs6yX41VkOppzoPQ0M1bVOZHKdo6Lfq9id6iR2OmFajdYvj+1v9jkPAFoe/OwSdMTtEtbXb0yPyd6bKI7RkCNwoO0i0izElSHx8S9M08t/6cUoMegqDFg50DHbdTF2C9LmsBd5KQCY0bWY6Yq1fZTG/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ahlwQUXO; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ahlwQUXO"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6ef7640e484so51054367b3.3
        for <llvm@lists.linux.dev>; Mon, 16 Dec 2024 10:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734374714; x=1734979514; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hho81fUxS1svxnIpTTMvF+QFJQ1gclraQmirxeDP/2A=;
        b=ahlwQUXOOdc5jNYVb826MdNGawRznKlh3uQ1emZOpShY31jCeW2+7KFXhGR9ZuDsC5
         uoUnDoAStd0tfO+tBqIPcM2hTkn09qSxDrnWP+aaoNGen23tG5pU051PnmZStXpkD4Sj
         2tN+lvROLiuSMwD6A6hSbXhKyzNW0YadMDN2zqTzJKCLnvkDeJ3PcY/N37HBhZpKnIxv
         c59lzwyR8VpZqJ6eYySfR2/AsFU77Br7rVJiVM2Tu06c5G2Kcj34KTA94lgaKMcWSUPE
         4tLwXn8jKwLcTKW93R15j86IXgKZZv09ALhwYsGoJy8ci5nxSUtkewWaxmvxfkkPiWgd
         IP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734374714; x=1734979514;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hho81fUxS1svxnIpTTMvF+QFJQ1gclraQmirxeDP/2A=;
        b=PSw7yVuRJNKDsiPjWR7Fbjed0CQmLmBMfGbjQGxIJkiilStCYfUQXvhBSWUNgDiOgW
         O451mPC+EpLzCluU+u5rkxi23ogr8MSdxnRF6vPZtFc3Vxl0yahsH8GTmthy6ig5dVMn
         /5gh4z9ZnjaOQ7DP5xNJfpy/iswvsX33Shn89TplqliJ1KbF1Eba1g7ywI0dq53hy+Wn
         VKgwx1q6cEb4Cm4bMx6PXWyu4AXfkIQ+9AZH485SVgBQXFCgq5oNCHWoM/l6tjRmgviN
         QuvcwTS7NAV3pprpl4k6lGjTg0Ob7vaTv3iSgHrCR+nX8hzNHaxmqCpnRDpJ0RJ/+fHS
         3GTA==
X-Forwarded-Encrypted: i=1; AJvYcCU5J1Bz0fH70/of9s3T2axImiMhNAxLUK6QdC2Emr0AQciWYetvun0xykH26xBkANh4Pr2J@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4hTaTYViS8ojg8aki976YVKtUitC5YjLcimVuebCjw7sqBKBw
	OsLPxqLFGqS/rm2BsvlTJEvwwW1FYN8f5+t8wb6vxb4xiI+krrdBjCn50JKm43Fd0G1UG4Ylk96
	R5ZUyr1vGuocKe4PC8DmJpYjqNK3OIVh0hMxsGQ==
X-Gm-Gg: ASbGncuF7kawv1tLAnCBrkmTblNVu2619n7jTYz2RtgFw/I87tcMqdVHsUvaxupWzH+
	24QCi5C4fKXx6II5cUroPOFe/cBR80yfttVAQS9ZQtouK8hAdgSKmGQLmjQW/MI/UhqZFiw==
X-Google-Smtp-Source: AGHT+IEoWJcDKQv5iEmEVMq3EpzCtQ9Q1A7OeekLCcpaKrEW68EjTvVaw4TXtlFnG0gT2cPtGh8+n5e6AdoDQWuvyI4=
X-Received: by 2002:a05:690c:7449:b0:6ef:8dd0:fff9 with SMTP id
 00721157ae682-6f279ad163fmr123605197b3.8.1734374713861; Mon, 16 Dec 2024
 10:45:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtpAwXa5mUQ5O7vDLK2xN4t-kJoxgUe1ZFRT=AGqmLSRA@mail.gmail.com>
 <20241216180231.GA1069997@ax162>
In-Reply-To: <20241216180231.GA1069997@ax162>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Mon, 16 Dec 2024 19:45:03 +0100
Message-ID: <CACMJSevssgFn6omKpV0rAMQKXpH__mmmkpdjUSYB7s2U=dsAEw@mail.gmail.com>
Subject: Re: next-20241216: drivers/crypto/qce/sha.c:365:3: error: cannot jump
 from this goto statement to its label
To: Nathan Chancellor <nathan@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>, 
	thara gopinath <thara.gopinath@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Dec 2024 at 19:02, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Naresh,
>
> Thanks for the report.
>
> + Bartosz as author of ce8fd0500b74
>
> On Mon, Dec 16, 2024 at 10:04:05PM +0530, Naresh Kamboju wrote:
> > The arm and arm64 builds failed on Linux next-20241216 due to following
> > build warnings / errors with clang-19 and clang-nightly toolchain.
> > Whereas the gcc-13 builds pass.
> >
> > arm, arm64:
> >   * build/clang-19-defconfig
> >   * build/clang-nightly-defconfig
> >
> > First seen on Linux next-20241216.
> >   Good: next-20241216
> >   Bad:  next-20241213
> >
> > Build log:
> > -----------
> <trimmed irrelevant warning>
> > drivers/crypto/qce/sha.c:365:3: error: cannot jump from this goto
> > statement to its label
> >   365 |                 goto err_free_ahash;
> >       |                 ^
> > drivers/crypto/qce/sha.c:373:6: note: jump bypasses initialization of
> > variable with __attribute__((cleanup))
> >   373 |         u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
> >       |             ^
> > 1 error generated.
>
> It is a bug to jump over the initialization of a cleanup variable
> because the cleanup function will be called on an uninitialized pointer
> in those cases. GCC does not catch this at compile time like clang does
> (it would be nice if we could document this somewhere and really
> encourage people doing cleanup annotations to ensure their patches pass
> a clang build except in architecture code where clang does not support
> that target):
>
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=91951
>
> It may be worth just reverting commit ce8fd0500b74 ("crypto: qce - use
> __free() for a buffer that's always freed") since it seems like little
> value in this case but if we want to forward fix it, I think we could
> just mirror what the rest of the kernel does and keep the declaration at
> the top of the function and initialize the pointer to NULL. The diff
> below resolves the issue for me, which I don't mind sending as a formal
> patch.
>
> Cheers,
> Nathan

I'm fine with dropping that commit from next.

Bartosz

>
> diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
> index c4ddc3b265ee..e251f0f9a4fd 100644
> --- a/drivers/crypto/qce/sha.c
> +++ b/drivers/crypto/qce/sha.c
> @@ -337,6 +337,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
>         struct scatterlist sg;
>         unsigned int blocksize;
>         struct crypto_ahash *ahash_tfm;
> +       u8 *buf __free(kfree) = NULL;
>         int ret;
>         const char *alg_name;
>
> @@ -370,8 +371,7 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
>                                    crypto_req_done, &wait);
>         crypto_ahash_clear_flags(ahash_tfm, ~0);
>
> -       u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
> -                                       GFP_KERNEL);
> +       buf = kzalloc(keylen + QCE_MAX_ALIGN_SIZE, GFP_KERNEL);
>         if (!buf) {
>                 ret = -ENOMEM;
>                 goto err_free_req;
