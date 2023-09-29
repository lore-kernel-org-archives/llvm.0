Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2551B82
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 16:11:13 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4064876e8b8so41414605e9.0
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 09:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696003872; x=1696608672; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIPQ+mq4ibCqI5jqpIgOMLXR3PB1xuDdnJNEgz17YYw=;
        b=qKDSynbgi+p2qViCiA66wd4Ogw3h7XvmG+RkRqtquS4Im09ZsR6vaWV7BTernXEwkF
         1P167OWOLmGz0ZpwtUxYF5a+p1tKWrS4Of1NLRCq1LkOjImbYCrLSFpAZzl9Qfj2gTLF
         jSryehsBIoCLSENH23d3/aP4nAqk9WmZB7DjPAAUHziOue+rXh9D0JtUMaYwRg6l0y7G
         5lP7RLuOBHdej8Dr/hm6gYg60MVTyDC2iV8QA9LYmyA7ZOiWBuxaAb7ANqNEbvhnLTrL
         HZkXUB5UKYOROUCbZn0Ey/Uss2nmnNcRw0yF0Y82wpea2uhnYS1+AyGm2ZBc/Hsvm2W0
         CHBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696003872; x=1696608672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WIPQ+mq4ibCqI5jqpIgOMLXR3PB1xuDdnJNEgz17YYw=;
        b=lA6CVHvVvTnf4l5WrySVqfvKgU7njgjfVj3LpSBTbJFKVPpLGdwMP0qdU8y3X9Lzm2
         HLqlUrLB6W4MpK3pWtkenpEmU94/n4kKAc9QMtVEdIMuKXH2DJA0Ix3bLRAGrlpxjn/9
         moAFic4PmzpWtQvKSMcRcK86W8M9aq3x1TzZtPc4W3+2YyW4UhTrmueXJHizsUbhM0s9
         d7buiNf1y668Hhr9+mcoNWwiX6eZ2wl/zFRoF18rHYlFPkHZuQ8bMx8dFaxyXlX9peze
         JTAnCgIJG1GfBn58au0gYP1RqtOKfTBbttwRi1IA0dFyNg59gL5jYwCQ4bPpzvL8wodc
         kptQ==
X-Gm-Message-State: AOJu0YwSUZ8Zh2PvyCel/okRiOkLdIWiJu5OJC1Sx20qRuycZZAaEYVC
	Z3qwCZdT+JIm16R9KhSe20tKdk4HW+S35asWKRQ/Jw==
X-Google-Smtp-Source: AGHT+IHTkXbH1QknEI9Ysx3L+jH5s7p8b7Rc2XdNP9tA/fdwT11V/0psMIJDE4SeahHKIE8IAqZpA9dtji9ugui/hZw=
X-Received: by 2002:a5d:58cd:0:b0:314:152d:f8db with SMTP id
 o13-20020a5d58cd000000b00314152df8dbmr3503480wrf.58.1696003872116; Fri, 29
 Sep 2023 09:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
In-Reply-To: <20230922-5-10-fix-drm-mediatek-backport-v1-1-912d76cd4a96@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 29 Sep 2023 09:11:00 -0700
Message-ID: <CAKwvOdkvJgrstZdVCMRMy+QC4VqHYq0+n5fRGbH7iYDxgAov1Q@mail.gmail.com>
Subject: Re: [PATCH 5.10] drm/mediatek: Fix backport issue in mtk_drm_gem_prime_vmap()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 8:51=E2=80=AFAM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> When building with clang:
>
>   drivers/gpu/drm/mediatek/mtk_drm_gem.c:255:10: error: incompatible inte=
ger to pointer conversion returning 'int' from a function with result type =
'void *' [-Wint-conversion]
>     255 |                 return -ENOMEM;
>         |                        ^~~~~~~
>   1 error generated.
>
> GCC reports the same issue as a warning, rather than an error.
>
> Prior to commit 7e542ff8b463 ("drm/mediatek: Use struct dma_buf_map in
> GEM vmap ops"), this function returned a pointer rather than an integer.
> This function is indirectly called in drm_gem_vmap(), which treats NULL
> as -ENOMEM through an error pointer. Return NULL in this block to
> resolve the warning but keep the same end result.
>
> Fixes: 43f561e809aa ("drm/mediatek: Fix potential memory leak if vmap() f=
ail")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

(resending as text/plain)
Did this get picked up? Our CI has been red for a few days on
linux-5.10.y over this.

> ---
> This is a fix for a 5.10 backport, so it has no upstream relevance but
> I've still cc'd the relevant maintainers in case they have any comments
> or want to double check my work.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_gem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_gem.c b/drivers/gpu/drm/med=
iatek/mtk_drm_gem.c
> index fe64bf2176f3..b20ea58907c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_gem.c
> @@ -252,7 +252,7 @@ void *mtk_drm_gem_prime_vmap(struct drm_gem_object *o=
bj)
>         if (!mtk_gem->kvaddr) {
>                 kfree(sgt);
>                 kfree(mtk_gem->pages);
> -               return -ENOMEM;
> +               return NULL;
>         }
>  out:
>         kfree(sgt);
>
> ---
> base-commit: ff0bfa8f23eb4c5a65ee6b0d0b7dc2e3439f1063
> change-id: 20230922-5-10-fix-drm-mediatek-backport-0ee69329fef0
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>
>


--=20
Thanks,
~Nick Desaulniers
