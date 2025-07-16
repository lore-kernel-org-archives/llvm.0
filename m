Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E72F2C76
	for <llvm@lists.linux.dev>; Wed, 16 Jul 2025 10:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752660548; cv=none; b=gWai48j2X//CBUoVRHe8FILz8ZX/7mIJhS8hnuKjUxwIooq5bF6Fcu1ZJW9HJP4pXzU6JF+maNJQIPmEcV02NlwVtyzNj+LfEUvvF5kOn/X8e7e3sPJDyiib8kRc9JvTHHuuGuI8M2OUSs+XzXyuO9t0nuXY6rQOVYRQIYcUlFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752660548; c=relaxed/simple;
	bh=bFBhJZawVLHR8IcJ2Vcrd4R81/LwC9KrzFTtxMVX5cg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQYZQ1kXeKrX4nB13CRF6tdADaXlGwj0UtmWzt6029a4HwifguIS9bc/XjVzabYWFfQdYtqJKuRUNoAUFpzmX4sDVA511oKYHNF8U1DgNbJM48G674dHr1svSVVKAs5b9QpueKmAba7fcyiZ8zrFv8neIVGWsGaE47Gg7XHqN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jnkFnJpG; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jnkFnJpG"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e82314f9a51so4723788276.0
        for <llvm@lists.linux.dev>; Wed, 16 Jul 2025 03:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752660546; x=1753265346; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4gV45BWglfzhUxE59Qv4ombDQhK6ciqBH4GljP84GFs=;
        b=jnkFnJpG41ZyK7fLCfJp0DEuE4AyDMTNOOIWCUeNV6zkwNgCUGgU7iiEGm2SQ/2rkU
         2JObsj+5DT55+mThlhS2kleZDz8mmUFbaEqeNu0orwNieKkBHOLGHmRWo4BDtN347X4L
         39pXKEy5vp2hvF6wYCBiNX7nkCJCpwJk52aLxHL+Ky+hUv2ge/NrEqEN+4BAOtfKjSrt
         /tmVT1kLmku6/Y01J6OaUE6maDshuQ1usguaVVUutO6UKoGRW6AHzl2e/KjDf1900ke9
         e9NEWScZdhwJw5tbJr2lnEjeS3v7ZEqzIYs9s6liNRCTlRV5lVR4cOtjS4qVnFiC2TcI
         ZbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752660546; x=1753265346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gV45BWglfzhUxE59Qv4ombDQhK6ciqBH4GljP84GFs=;
        b=aQOJ9RnZWMiqDnkuT7GMWdA0/MwW4dv45+u0Rp6obQRUAm1nzrd6BJf44ovV2RohGZ
         RJQc2fh1ScSiSSi/E6jqzjF88hznG5f18C6Ouu8lAWkz570K6pwtK5IEHcj6mR8XwW69
         i29b9aAZDGMGUf7ArhA6E0eZbrs7RVc5yjf+cmT8Bg642PACCzb7mpgMC66EiTcS0GbC
         mKIO9P+2ng6VoxqiXqblbaImkRKYL+tYJP6WnNluj/IpptnpDf1SCmk0Eh6+au6gnZKU
         U4YRP3XUN5UfJ3pPuaLNhSDBbj3dERvrcHn2WYOsxFHFSYuULs7aJdPx8baLlokM3AJH
         i0TQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjp3nRS1U0TlYnqEKoMYxNUsIEW1bT3hN5Im4X2wwuKOXpyI/fiR9ZW236Av0VrYjyOih8@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs7ik/gz9hLKjhJmbgyIEH6UgRVTXhaYRoFTPrLoBufBWIkUgt
	SuPxeh5wvSQWWtFSAJzRx3WzGa/jWibbwjWm396+qmpSDB050VjNFYV0i/SQaXyXv5P+DnBNU/c
	jrWilJWg9lJvi1szyu7Y9gbRkQykrYhEGxbb/mfTCgQ==
X-Gm-Gg: ASbGncs5i6/ygcsuweVj+g58RIk2FF7/hLkgdCU3vJXA+BV2uHC1TmdclovYt8WuiJu
	wfSFnGtx1mYg8u2f3SqNkSJI9d95mnYrQyglS1Tfve76l6EKzqk8lMlU1s6gEylICDTF5HD6+1X
	Tjf33kbq3VvozrMA7mCHGERVRcEAIU5gX85vpd+sIpfHz416Z0q0RqEM+LI3Nq3u06H6TcGWtFQ
	c9HzP0U
X-Google-Smtp-Source: AGHT+IHbf9uC6mvlDjLNF6dIc9S4dSQ+VNOZ0NRDgEmrKLk0gdoDzLQwF9jjwQJK77A/D6L0h1BM5w/vF4E9CMZ6E90=
X-Received: by 2002:a05:690c:730a:b0:70e:7ff6:9ff3 with SMTP id
 00721157ae682-7183517dc19mr38773327b3.35.1752660545599; Wed, 16 Jul 2025
 03:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250715-memstick-fix-uninit-const-pointer-v1-1-f6753829c27a@kernel.org>
In-Reply-To: <20250715-memstick-fix-uninit-const-pointer-v1-1-f6753829c27a@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 16 Jul 2025 12:08:29 +0200
X-Gm-Features: Ac12FXyidmVqEt8vJA-TGBN58fq86rVrqsDtWU_9Q1n-pkGowaYzgUWF1QhgIVw
Message-ID: <CAPDyKFpb+_N_XbZrZ02QDFfgk0MNMWb=oJC4V10+s+CrDXdUQw@mail.gmail.com>
Subject: Re: [PATCH] memstick: core: Zero initialize id_reg in h_memstick_read_dev_id()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-mmc@vger.kernel.org, llvm@lists.linux.dev, 
	patches@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 00:56, Nathan Chancellor <nathan@kernel.org> wrote:
>
> A new warning in clang [1] points out that id_reg is uninitialized then
> passed to memstick_init_req() as a const pointer:
>
>   drivers/memstick/core/memstick.c:330:59: error: variable 'id_reg' is uninitialized when passed as a const pointer argument here [-Werror,-Wuninitialized-const-pointer]
>     330 |                 memstick_init_req(&card->current_mrq, MS_TPC_READ_REG, &id_reg,
>         |                                                                         ^~~~~~
>
> Commit de182cc8e882 ("drivers/memstick/core/memstick.c: avoid -Wnonnull
> warning") intentionally passed this variable uninitialized to avoid an
> -Wnonnull warning from a NULL value that was previously there because
> id_reg is never read from the call to memstick_init_req() in
> h_memstick_read_dev_id(). Just zero initialize id_reg to avoid the
> warning, which is likely happening in the majority of builds using
> modern compilers that support '-ftrivial-auto-var-init=zero'.
>
> Cc: stable@vger.kernel.org
> Fixes: de182cc8e882 ("drivers/memstick/core/memstick.c: avoid -Wnonnull warning")
> Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
> Closes: https://github.com/ClangBuiltLinux/linux/issues/2105
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/core/memstick.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
> index 043b9ec756ff..7f3f47db4c98 100644
> --- a/drivers/memstick/core/memstick.c
> +++ b/drivers/memstick/core/memstick.c
> @@ -324,7 +324,7 @@ EXPORT_SYMBOL(memstick_init_req);
>  static int h_memstick_read_dev_id(struct memstick_dev *card,
>                                   struct memstick_request **mrq)
>  {
> -       struct ms_id_register id_reg;
> +       struct ms_id_register id_reg = {};
>
>         if (!(*mrq)) {
>                 memstick_init_req(&card->current_mrq, MS_TPC_READ_REG, &id_reg,
>
> ---
> base-commit: ff09b71bf9daeca4f21d6e5e449641c9fad75b53
> change-id: 20250715-memstick-fix-uninit-const-pointer-ed6f138bf40d
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
