Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996E52F28
	for <llvm@lists.linux.dev>; Wed,  2 Feb 2022 21:09:31 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id c9so310571plg.11
        for <llvm@lists.linux.dev>; Wed, 02 Feb 2022 13:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=N/I9lN88woCCUFoo8q3GQ0U+UOLVhyA+KEq79xDhOwQ=;
        b=gy2KhoZlWLVxHSeIlgNS6LXR2Do4lE0fzqAmjllj1apNx5NM03qgdBQOKsPdZMjYmC
         DzR2yPDsHQfDvpcQQde05juXuWh8Az/4jleLh1nFeg7UL+dTeUB7Kvj+n1+XZ5P+AlfZ
         hOXLTDoIBxgMnG4UXHSA4hMy5PGguDk8o1u+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=N/I9lN88woCCUFoo8q3GQ0U+UOLVhyA+KEq79xDhOwQ=;
        b=PZQlUPQzqLXImk+Zd8R0kesO31upDXs/l7YQexlZjQPTLeQYVd3qBl3USh12qOMu2W
         55tNvJOWgFACD37T0yrg+54/GuqSQy1tmTsahUyxVyYrmyblH1XMG1/SQhMz5jKPsiei
         IdUMRJzi2Pdd6FmHJbbnsBKFSJWP02CdvhiJrd3o1N1OQlc8obBbikZBB1ZRnbvYT4cM
         I3A1o/XWezMxtWHQLXojQrBDw6qxqpw8/BwttPNONZRgYzgYI0LicpJtDJfatF1fSxlZ
         VnXN89hjvVPXoivkCOFjYVeVHPPTeU3elUhm4VzNT+wMiUSQyA2Ic/bD+9I2mE/K8dkJ
         sH2w==
X-Gm-Message-State: AOAM530Qk6z7nRcRB2DieHMmfI1lqqTNTtX5Ktvh/1SlUiCFI2Eh3cXu
	gY2SB2kVhfIefydT32sufYH++Q==
X-Google-Smtp-Source: ABdhPJwLGGUSXvSqUXoGyNotccNLcNU1es0zC0+QmCFktC8Y7/ncaKyqZeg/GnVbmr6ggTBnd6rZGw==
X-Received: by 2002:a17:902:ec81:: with SMTP id x1mr31734885plg.109.1643836171113;
        Wed, 02 Feb 2022 13:09:31 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g17sm8158756pfj.148.2022.02.02.13.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 13:09:30 -0800 (PST)
Date: Wed, 2 Feb 2022 13:09:30 -0800
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	George Burgess IV <gbiv@google.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-security-module <linux-security-module@vger.kernel.org>
Subject: Re: [PATCH 1/4] Compiler Attributes: Add Clang's __pass_object_size
Message-ID: <202202021307.75435AF9@keescook>
References: <20220202003033.704951-1-keescook@chromium.org>
 <20220202003033.704951-2-keescook@chromium.org>
 <CANiq72n1d7ouKNi+pbsy7chsg0DfCXxez27qqtS9XE1n3m5=8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n1d7ouKNi+pbsy7chsg0DfCXxez27qqtS9XE1n3m5=8Q@mail.gmail.com>

On Wed, Feb 02, 2022 at 02:11:51AM +0100, Miguel Ojeda wrote:
> On Wed, Feb 2, 2022 at 1:30 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > +/*
> > + * clang: https://clang.llvm.org/docs/AttributeReference.html#pass-object-size-pass-dynamic-object-size
> 
> For attributes that are not supported under all compilers, we have the
> "Optional" lines in the comment. From a quick look in Godbolt,
> `__pass_object_size__` and `__overloadable__` are supported for all
> Clang >= 11 but not GCC/ICC. Thus, could you please add to the
> comment:
> 
>     * Optional: not supported by gcc.
>     * Optional: not supported by icc.
> 
> to those two patches?
> 
> For `__diagnose_as_builtin__`, I only see it on Clang trunk, so I
> assume >= 14, thus could you please add:
> 
>     * Optional: only supported since clang >= 14.
> 
> ?
> 
> Thanks!

Gotcha, I will adjust these.

> > + * The "type" argument should match the __builtin_object_size(p, type) usage.
> 
> This should go above on top of the comment (it is true there is one
> case that does not follow it, but that one has to be cleaned up).
> 
> Also, this bit seems to be explained in the Clang documentation (i.e.
> not kernel-specific). Do you think we need it here?

It's the kind of detail I feel like I might forget a month from now, so
I added it as a bit of a hint. If you think it's too redundant, I can
leave it off.

-- 
Kees Cook
