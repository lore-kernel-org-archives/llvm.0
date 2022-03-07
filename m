Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB497C
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 19:08:43 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id u7so21858138ljk.13
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqdFcj/W3ROtaaLGNZJbzsf9vyM2NVPkSBm3INx+BLs=;
        b=rfR0JcG6nuRaVIkXXgGAegektp5HSFDVUF91VlM0HcyOauIq6tLbs7wauxENXC0btb
         p8y1dXe10FP3m4bn7GIwnpvC6FX6LCWi8n0s3OsVBh5zR2vtqauwBqooPEyXFXPwsIXI
         62bdrmK25fNTgDZg8wJzs40LnOGNLG1en3+O2YHwTaLzbIVSg/0cJQFsDDU6mwqDgdRq
         8VIfwpxBj8u6NEY7gT9YpRSH4XlxawGUuOk2T4WsVMqRa405CTVD4rzPmUfb9jJIWnOH
         v5czkolhWUGk6Kk7sv9Vye1CuebzWG4LHHYshIxfssyFSMc2MP+BlO+5ww1BiNEr34zx
         gkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqdFcj/W3ROtaaLGNZJbzsf9vyM2NVPkSBm3INx+BLs=;
        b=qpkF696ppZ5BbI1KQSDDot7rnG6/yx17DwtnuIwUvHO/S6GlcSMexb9Gy0f118f+DF
         6ux8It0Ga5c0hB9HwWC+Fzs99lmXWzpiOsf9//dek1Uejz9LUI0qJp/rSHtU5N1eqbbm
         Q7gTjZhDUsdpYZj1UpOMSMq6B4vSshrTOj81SQFldm9RkZ152LedxFQ4PpNriplwQpkS
         TVK4l7Vd7KrIBcYL7n1bt5aSZnxw2m0/kYB6vHSRpEoUdNZqQGrMCItL0ViiRQ1yIZRj
         uHDuntWEL9rfwM5cEVW+igYyTodr8fJStcRZCg1Qi8S3SfhhD3ucZ31Xvt0r4iVaUGGZ
         UfuA==
X-Gm-Message-State: AOAM532xfCI0lBN0uDHqLTc1QAI+JPwempeQsoFWTtdGZ7mS7wlTjG04
	Hvnu/JVbCGCVyUc/3+iG2TI2+QGqyQSBI6JTdr/G+w==
X-Google-Smtp-Source: ABdhPJxUEH+WXE4ZEDL3yAUMLDOBvQpg4ljCyCYbedmFgU3xFcH283DgaImI8yUXP7kHpdQV2ZWAnn0IBgfQDPiwNxM=
X-Received: by 2002:a05:651c:1542:b0:233:8ff5:eb80 with SMTP id
 y2-20020a05651c154200b002338ff5eb80mr8416360ljp.352.1646680120998; Mon, 07
 Mar 2022 11:08:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220304170813.1689186-1-nathan@kernel.org>
In-Reply-To: <20220304170813.1689186-1-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Mar 2022 11:08:29 -0800
Message-ID: <CAKwvOd=Q-7vPaRPj1wQagFsY3txcAKzrqU_D2UAX3h4ym91uUA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Make $(LLVM) more flexible
To: Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 4, 2022 at 9:14 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index d32616891dcf..68b74416ec48 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -49,17 +49,36 @@ example: ::
>  LLVM Utilities
>  --------------
>
> -LLVM has substitutes for GNU binutils utilities. Kbuild supports ``LLVM=1``
> -to enable them. ::
> -
> -       make LLVM=1
> -
> -They can be enabled individually. The full list of the parameters: ::
> +LLVM has substitutes for GNU binutils utilities. They can be enabled individually.
> +The full list of supported make variables: ::
>
>         make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
>           OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
>           HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
>
> +To simplify the above command, Kbuild supports the ``LLVM`` variable: ::
> +
> +       make LLVM=1
> +
> +If your LLVM tools are not available in your PATH, you can supply their
> +location using the LLVM variable with a trailing slash: ::
> +
> +       make LLVM=/path/to/llvm/
> +
> +which will use ``/path/to/llvm/clang``, ``/path/to/llvm/ld.lld``, etc.

I don't think we should do this; `PATH=/path/to/llvm/ make LLVM=1`
works and (my interpretation of what) Masahiro said "if anyone asks
for this, here's how we could do that."  I don't think I've seen an
explicit ask for that. I'd rather LLVM= have 2 behaviors than 3, but I
won't hold this patch up over that.  Either way:

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> +
> +If your LLVM tools have a version suffix and you want to test with that
> +explicit version rather than the unsuffixed executables like ``LLVM=1``, you
> +can pass the suffix using the ``LLVM`` variable: ::
> +
> +       make LLVM=-14
> +
> +which will use ``clang-14``, ``ld.lld-14``, etc.
> +
> +``LLVM=0`` is not the same as omitting ``LLVM`` altogether, it will behave like
> +``LLVM=1``.

Hmm... I can see someone's build wrappers setting LLVM=1, then them
being surprised that appending LLVM=0 doesn't disable LLVM=1 as they
might expect.  But Masahiro says let's fix this later which is fine.

--
Thanks,
~Nick Desaulniers
