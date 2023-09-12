Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573A8A959
	for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 20:58:41 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-414b3b65e85so39326641cf.1
        for <llvm@lists.linux.dev>; Tue, 12 Sep 2023 13:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1694552320; x=1695157120; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Js1sPIN4tSpqKzVh+cdl+vbQOEHreHNkNpfHbtQhoUw=;
        b=H1VLMq5eiFzyVOlkja3m3ffiGD1f0hx0H+N4+IpIge9rAYaLV7QOOrHMunwNQv3nVw
         wPqgA1xVH7uomHgMcGlYyUp+N1n2sy8kBt/ejYv4x0pdbpSaBB6dAe1tqsJd/6xE8qx6
         uD53+Ryh+Zwabsug3rDlXBzXswJIDtlazVC+3vZSRfMp7UrYTd2q21ut/D5tg/8PB7Nj
         Jmf82mu38TuaGd/vtSBu5YqPzQhDdM718TAL3eoOrveMagKNmQMFRtnJOVvi+s4b3OyL
         4cGWTcmtea4KPI8+w7JV+gcw3p7w5iafk2CY5ZcsPb9y1WDrvnBvdpgl0vtZX4JZcTMv
         /Qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694552320; x=1695157120;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Js1sPIN4tSpqKzVh+cdl+vbQOEHreHNkNpfHbtQhoUw=;
        b=VZxY6uL5Xp4931Pxd5Na9Kwe2AJIS2506uRGaCYqxfZ1wp32zSpMCAaVDz9hbQPj0V
         VKJt5TEseCuBOMpEsih4amBkNGjh5WcXaw+nxh6Z0vU0R/wrjMlHfLfioyPPUZXbPAE1
         rz8L9OgRo8P4ExFIABntILEhM+eVL1cRhQE69JHsykOGWPdNlKPbepphyDoFg3MYaEiv
         kGbhufXseY7GdCY8C5PuRPoPEMjkANMBsYWjJ1P3gdzIrFqWyewg2ituVDxs7/bh4g8v
         EVaqKEX/GhiQQG5R1xadewTYVLKZhj2hMc9Gt3Yat33KCxPrZP0MAHunNhBVJa1YxhBP
         0xug==
X-Gm-Message-State: AOJu0Yzuq01yeRsl3bBye1dTKF22qawQlCuLVOGFc5U7+2hBuWTdtc2K
	0WjQTZm8AlLTzFGm5Bm0qTS4
X-Google-Smtp-Source: AGHT+IFx1FFRoXcJqvM1S2NAgyMm6l7izDLmyHVvc8gF1o9Jby+x6eU/Q7lfnMg6XgyGLr2S6gCrSw==
X-Received: by 2002:a05:622a:3cc:b0:403:a6e5:9aad with SMTP id k12-20020a05622a03cc00b00403a6e59aadmr576960qtx.47.1694552320183;
        Tue, 12 Sep 2023 13:58:40 -0700 (PDT)
Received: from localhost ([70.22.175.108])
        by smtp.gmail.com with ESMTPSA id z24-20020ac86b98000000b00414e93d940dsm3572106qts.50.2023.09.12.13.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 13:58:39 -0700 (PDT)
Date: Tue, 12 Sep 2023 16:58:39 -0400
Message-ID: <c91bb958ddbfd9b9572d51d96cd857b9.paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
To: Kees Cook <keescook@chromium.org>
Cc: Stephen Smalley <stephen.smalley.work@gmail.com>, Eric Paris <eparis@parisplace.org>, Ondrej Mosnacek <omosnace@redhat.com>, selinux@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, "GONG, Ruiqi" <gongruiqi1@huawei.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] selinux: Annotate struct sidtab_str_cache with  __counted_by
References: <20230817202210.never.014-kees@kernel.org>
In-Reply-To: <20230817202210.never.014-kees@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

On Aug 17, 2023 Kees Cook <keescook@chromium.org> wrote:
> 
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
> 
> As found with Coccinelle[1], add __counted_by for struct sidtab_str_cache.
> 
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
> 
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: Stephen Smalley <stephen.smalley.work@gmail.com>
> Cc: Eric Paris <eparis@parisplace.org>
> Cc: Ondrej Mosnacek <omosnace@redhat.com>
> Cc: selinux@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  security/selinux/ss/sidtab.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into selinux/next, thanks.

--
paul-moore.com
