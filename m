Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB70C3FC4
	for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 20:42:39 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id q21so19591494ljj.6
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HWY/EewUPKp73TzxAziJqvXmaqyygdW/b+QHkWc/nhk=;
        b=WUDcnWLSVuipyv/o870gx/3KRDXU/5/pW/w70Iw6g0/mUDCYF5940OAfsqWLvsksEK
         7ykNK7S4TpqCIds/8ffTUxTEHnfLwNVZ/b9beeHJ4pkGgI6UiMzi1Y64I6nBvLCe+zCv
         y2ebJSNNR55jpHO3tEmyEc5E5ilbPqcga0xEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HWY/EewUPKp73TzxAziJqvXmaqyygdW/b+QHkWc/nhk=;
        b=Q7vgeM9Xt3zEyMSIlm4Oly9FWeYiVV69qFBg4QUOmPCYGCyzRUO6Ghjvtp4RAZlON7
         xnnQYvW2Ajj39fAyoDdxSQhGmC+vPH60a2SUMwFDCNMmFXe9kWxdBQVdPBtqi9qk9Zuo
         iFrqQnDumObjntvHB9NweH9XcxTIeI4yNRVSCb3wy8wZDPUWKkrmgB/e//oaH6QsSkiJ
         qPPKKZyOnJj3Zm19VZsDqT6pz5LUViSbl3zY9UFT5TkcleId1cZYx4usFVsjtpQwVrcV
         CiinGXTeK74UGWugYKGt1M2d96YYbLGhhK8QLAoPKt9L/OyGcdKSn6snC1p6WNUHtiCt
         EvXg==
X-Gm-Message-State: AOAM5318lR+Ibz2eGbkM5/25eOtAZhoGgsEuZf7yiHGCdDkcz6sLfAQx
	4Qj94SBnOY9Kzd+WtLJdo6P1+Wdzeu5S3dmTtYo=
X-Google-Smtp-Source: ABdhPJy77fYzCJGtSxtsp79rmKyUlpIKjdREM/u5QED6RrQ8+JFx+V6A9oVB53gQC+GrM30QjK06Kg==
X-Received: by 2002:a2e:8547:: with SMTP id u7mr12069339ljj.188.1631565757539;
        Mon, 13 Sep 2021 13:42:37 -0700 (PDT)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 25sm1091002ljw.31.2021.09.13.13.42.36
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 13:42:36 -0700 (PDT)
Received: by mail-lf1-f43.google.com with SMTP id c8so23786113lfi.3
        for <llvm@lists.linux.dev>; Mon, 13 Sep 2021 13:42:36 -0700 (PDT)
X-Received: by 2002:a19:ae15:: with SMTP id f21mr834776lfc.402.1631565756235;
 Mon, 13 Sep 2021 13:42:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210913131113.390368911@linuxfoundation.org> <20210913131114.028340332@linuxfoundation.org>
 <CA+G9fYtdPnwf+fi4Oyxng65pWjW9ujZ7dd2Z-EEEHyJimNHN6g@mail.gmail.com>
 <YT+RKemKfg6GFq0S@kroah.com> <CAKwvOdmOAKTkgFK4Oke1SFGR_NxNqXe-buj1uyDgwZ4JdnP2Vg@mail.gmail.com>
 <CAKwvOdmCS5Q7AzUL5nziYVU7RrtRjoE9JjOXfVBWagO1Bzbsew@mail.gmail.com>
 <CA+icZUVuRaMs=bx775gDF88_xzy8LFkBA5xaK21hFDeYvgo12A@mail.gmail.com>
 <CAKwvOdmN3nQe8aL=jUwi0nGXzYQGic=NA2o40Q=yeHeafSsS3g@mail.gmail.com>
 <CAHk-=whwREzjT7=OSi5=qqOkQsvMkCOYVhyKQ5t8Rdq4bBEzuw@mail.gmail.com> <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com>
In-Reply-To: <CAKwvOdkf3B41RRe8FDkw1H-0hBt1_PhZtZxBZ5pj0pyh7vDLmA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 13:42:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjP2ijctPt2Hw3DagSZ-KgdRsO6zWTTKQNnSk0MajtJgA@mail.gmail.com>
Message-ID: <CAHk-=wjP2ijctPt2Hw3DagSZ-KgdRsO6zWTTKQNnSk0MajtJgA@mail.gmail.com>
Subject: Re: [PATCH 5.14 018/334] nbd: add the check to prevent overflow in __nbd_ioctl()
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Nathan Chancellor <natechancellor@gmail.com>, Baokun Li <libaokun1@huawei.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-stable <stable@vger.kernel.org>, 
	Hulk Robot <hulkci@huawei.com>, Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Sasha Levin <sashal@kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, 
	lkft-triage@lists.linaro.org, llvm@lists.linux.dev, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 13, 2021 at 1:16 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Do we have access to _Generic in GCC 4.9?

We've ended up using it unconditionally since last year, so yes.

In fact, the compiler version tests got removed when we raised the gcc
version requirement to 4.9 in commit 6ec4476ac825 ("Raise gcc version
requirement to 4.9"):

   "In particular, raising the minimum to 4.9 means that we can now just
    assume _Generic() exists, which is likely the much better replacement
    for a lot of very convoluted built-time magic with conditionals on
    sizeof and/or __builtin_choose_expr() with same_type() etc"

but we haven't used it much since.

The "seqprop" code for picking the right lock for seqlock is perhaps
the main example, and staring at that code will make you go blind, so
look away.

            Linus
