Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3504EF9F6
	for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 23:43:55 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c0ecb9a075so112135765ad.2
        for <llvm@lists.linux.dev>; Fri, 29 Sep 2023 16:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696031035; x=1696635835; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XxXRgVO4X0oKRg65wlMjf/8hMDTc8L5/nBKtcjEkozU=;
        b=L/eC8N5/mJQzzh8RAW/x/+h+OOEeDZjdvPLy6+ATN46iHRvcXEfSgkr9SVwHEpwB/G
         X2zbBMAzVM1BGtOM4bFTrBXcqPXCjwMx5KJnCNUq0Cc2IpmpfBiHQKjiPrHdC5Pos0x0
         ZLPo2KVUL6R8RdmsICb8INN0RYyuYIp2JntaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696031035; x=1696635835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxXRgVO4X0oKRg65wlMjf/8hMDTc8L5/nBKtcjEkozU=;
        b=GByv4tf8QvxEN3k0ivXkZxMWuVeVR714TOME2g4+TMRpSUvGb52L1EjE9kTov7x75A
         IlpSRZfSxVg0Eyh1MBn7I0KC2qJwFa5ryEniE2Dbgz5LfUHTWctU+AjQZnpWd+I/BXFD
         IBSKZsI1EJBIKXzoPWnn2pE79Gcp1kP4qp/cAMjT7WBDUFs+zgxyzQPW4HgQPYAcaGLj
         3XqxeWSiJ11jdYWRowHZawqtDWPlvygLGX17qsvm9ismzS0rdq68wQOlA9GNzco2ztZ7
         AUtwvD8n1+v52AD+P1X+sivsbreVf68GY2hxAFLv1SwfLXLoHI7WILVS0vYi6DNL+QoF
         0EPQ==
X-Gm-Message-State: AOJu0Yw6u05755Yjn4NCkcDd4dXKwjs5ztFuMRh6ANELiQYHwMNRYLsx
	KRsi/J9YWMBLaNg+MBtEwJ7GCA==
X-Google-Smtp-Source: AGHT+IFoyjufbN/+tXciMnWrLm1gtDSKSS/anCouRumZaJShGMHHhX6IW7ptFVzMTxsQrVkg++m9jw==
X-Received: by 2002:a17:903:25d4:b0:1c6:112f:5d02 with SMTP id jc20-20020a17090325d400b001c6112f5d02mr4765528plb.55.1696031035416;
        Fri, 29 Sep 2023 16:43:55 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id f9-20020a170902ce8900b001c5076ae6absm17466616plg.126.2023.09.29.16.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 16:43:54 -0700 (PDT)
Date: Fri, 29 Sep 2023 16:43:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Song Liu <song@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] md/md-linear: Annotate struct linear_conf with
 __counted_by
Message-ID: <202309291643.BF67044DA@keescook>
References: <20230915200328.never.064-kees@kernel.org>
 <169601526973.3013632.16756928162777602693.b4-ty@chromium.org>
 <CAPhsuW6RfCryssufHjWHRdUGCh2DywnNNtidZ-UxEWvwo4gcbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPhsuW6RfCryssufHjWHRdUGCh2DywnNNtidZ-UxEWvwo4gcbQ@mail.gmail.com>

On Fri, Sep 29, 2023 at 04:40:13PM -0700, Song Liu wrote:
> On Fri, Sep 29, 2023 at 12:21 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, 15 Sep 2023 13:03:28 -0700, Kees Cook wrote:
> > > Prepare for the coming implementation by GCC and Clang of the __counted_by
> > > attribute. Flexible array members annotated with __counted_by can have
> > > their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> > > (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> > > functions).
> > >
> > > As found with Coccinelle[1], add __counted_by for struct linear_conf.
> > > Additionally, since the element count member must be set before accessing
> > > the annotated flexible array member, move its initialization earlier.
> > >
> > > [...]
> >
> > Applied to for-next/hardening, thanks!
> >
> > [1/1] md/md-linear: Annotate struct linear_conf with __counted_by
> >       https://git.kernel.org/kees/c/9add7681e09b
> 
> Hmm..
> 
> Jens pulled this into his for-next branch and for-6.7/block branch
> earlier today:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?h=for-next&id=e887544d7620f1d3cef017e45df7bc625182caff
> 
> Do we need to do anything about this (drop one of them)?

Whoops! Sorry, I hadn't seen it picked up. I'll drop it from my tree.
Thanks!

-Kees

-- 
Kees Cook
