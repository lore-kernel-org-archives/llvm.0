Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888AF28DD5
	for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 15:04:24 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-d8168d08bebso10219555276.0
        for <llvm@lists.linux.dev>; Tue, 26 Sep 2023 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695740663; x=1696345463; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hi8I/a7o7wwNWCt1t7ekaKgHNV+vsdHqCcY2PQYg2QI=;
        b=PPqaXDWsuodrARo19NRRyUyii3hf8TtlpYIkUPt079hx4lrGGMgbUhpenF2IacS+vW
         yzgfFYwsBowXwi+eXp8SqvjeHdfG+QAHNnb/bKI867y/bySQF5xns9cXmXrRx7x86dpG
         EaZs05hCfdlDngtIcPuYSiTKF7iwL5v/UAaQ9te2vKr3G5RHuOXn+xDScfIzxXOEqrP5
         aOOf/ELDrcpv9ToR4bzJ2XqPAnKnrCtPrDDEkB4hh5rlKIB2PXuTOzk3tahpV3w9Hp2Z
         YZB7px1+9NMSnU4cnxjDBMEu0qaPtFh79cBNYxiZOlt7715oA/QQpwp+vJgN+soZEAjE
         5twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740663; x=1696345463;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hi8I/a7o7wwNWCt1t7ekaKgHNV+vsdHqCcY2PQYg2QI=;
        b=L0SguRs0aXlFKIiW1ZaMclCm5UyS264MCYrmnfM3WHk71ShUbdiOORCIL2q2hRCLlC
         zSioGWbPindZvnhBGlMngzk1e+o+IbMwMfqiej3xMn9AwBAe433b7RAAPOxs9HmCN4wj
         kW1DHDy5uA/Vu7LxhCrRcNuAWLOQcophpwERHZcRSGijP0QqNA8hKMx/i98jWT+BIkaJ
         hWNbJ3lkOsqGT5s/Bms8U7GuJDXCkspAW6ewGzmwy8uONc5MNFQiy3YD8qDtDy3jviHe
         4qQO3c4JYS41nDClCCp872VZMxvi9GeLi1dt+dQVAO00uV2ZhjDXweIbPYB3pTYaLFHU
         z3rA==
X-Gm-Message-State: AOJu0YyJL8h4/gkmhbmvKpba1YC6PuMFumJXl5aq3jmP4fYKTfknG56c
	G9q4Zd5sGuQdlPyO0iPFohUkjTgXT0ZiAA2Ie/+6Hg==
X-Google-Smtp-Source: AGHT+IGQ+cDmUBy1mScBjOKjo++Q7IVdwaEUb7YBFTbK5U0lEpvDf6oS2L6LJvgIzbDQlTFsBZNTNRnN7t9lk62BZKU=
X-Received: by 2002:a5b:54b:0:b0:d84:90c5:4e1f with SMTP id
 r11-20020a5b054b000000b00d8490c54e1fmr7705526ybp.63.1695740663508; Tue, 26
 Sep 2023 08:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230922175249.work.593-kees@kernel.org>
In-Reply-To: <20230922175249.work.593-kees@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 26 Sep 2023 17:03:47 +0200
Message-ID: <CAPDyKFo2CeV2Gw-MCbYvA=SRMrb+BptK3hW7f3sz2m1ChmgMAw@mail.gmail.com>
Subject: Re: [PATCH] memstick: jmb38x_ms: Annotate struct jmb38x_ms with __counted_by
To: Kees Cook <keescook@chromium.org>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>, Alex Dubov <oakad@yahoo.com>, Tom Rix <trix@redhat.com>, 
	Len Baker <len.baker@gmx.com>, Dan Carpenter <error27@gmail.com>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-mmc@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Sept 2023 at 19:52, Kees Cook <keescook@chromium.org> wrote:
>
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct jmb38x_ms.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
>
> Cc: Maxim Levitsky <maximlevitsky@gmail.com>
> Cc: Alex Dubov <oakad@yahoo.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Tom Rix <trix@redhat.com>
> Cc: Len Baker <len.baker@gmx.com>
> Cc: Dan Carpenter <error27@gmail.com>
> Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
> Cc: linux-mmc@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/memstick/host/jmb38x_ms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/memstick/host/jmb38x_ms.c b/drivers/memstick/host/jmb38x_ms.c
> index 21cb2a786058..e77eb8b0eb12 100644
> --- a/drivers/memstick/host/jmb38x_ms.c
> +++ b/drivers/memstick/host/jmb38x_ms.c
> @@ -66,7 +66,7 @@ struct jmb38x_ms_host {
>  struct jmb38x_ms {
>         struct pci_dev        *pdev;
>         int                   host_cnt;
> -       struct memstick_host  *hosts[];
> +       struct memstick_host  *hosts[] __counted_by(host_cnt);
>  };
>
>  #define BLOCK_COUNT_MASK       0xffff0000
> --
> 2.34.1
>
