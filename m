Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B542F21
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 00:29:23 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id a8so3652124pfa.6
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 16:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7jAxI29crxP7S7vFJnF3wftZXckofe+kHrOWNqXAQow=;
        b=bUGShFdQCuYs6lb/IPDvFbEdOFY+an3WZjtQkCOOMbGZP3vwME4Us6qOCzhxninbFG
         vlc3rzh9YtbyMmiO32kRO/is3fZ3gD2T/c6K2F9sVL1ZO6UTnBJ8Q8rHIPVST8uIweLP
         mV+M+tmIBCexSHDCYxuy1PtggQ94NGFYtM0H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7jAxI29crxP7S7vFJnF3wftZXckofe+kHrOWNqXAQow=;
        b=CmQS4aO5QU3vJRAaU1wS1fLPetOkjNPS8Kn0GFjhO8c6D7Kn+JQ2tRzpaL4qwNpfCC
         xQpLFv4pBfDktRV0fFRR/3RfPOsX/WzUiDvOTj8ycMTWEUrYB9TGyv6k/BwLUisT00Kj
         NfwYs0GmsjlPNO/mgmmPZNHPUgOe9vFar3/l9Q1Dc/AkuEo3nQxXxiAsWrduExMdjWfJ
         a9QN5xmUMTnUUhZeU2bEpd1DdQk/QCg1ykFdMeI1qDPt+ps2pfXBC4fkLGdaXsKUgz8+
         6HncuM58sd+pBO3ijy7lX84ybmubfOQWH9r6qvNvItjebm30iQKe4PprN8jeE08QbYfQ
         7TRQ==
X-Gm-Message-State: AOAM5300amaIOD3yM5lx4s+z8NfoHNFt+/wli3/vK3xISW/WI5Gwz2FG
	KeqotYJvLuzIhK34IYSSj8zgbw==
X-Google-Smtp-Source: ABdhPJyxEW/qo1THvmWccU/g3L0VLb9vuHRgXCa42FJarlVXjxquMHAwuHB6voQ/2hmHqAFsJtBB+Q==
X-Received: by 2002:a63:451f:: with SMTP id s31mr497461pga.114.1643934563402;
        Thu, 03 Feb 2022 16:29:23 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g5sm185194pfv.22.2022.02.03.16.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 16:29:23 -0800 (PST)
Date: Thu, 3 Feb 2022 16:29:22 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: George Burgess IV <gbiv@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH v6 1/4] Compiler Attributes: Add __pass_object_size for
 Clang
Message-ID: <202202031628.E28BBBB490@keescook>
References: <20220203173307.1033257-1-keescook@chromium.org>
 <20220203173307.1033257-2-keescook@chromium.org>
 <CAKwvOdmzdQ+X2BsUbuVBWzFtaE2Vst4=ihNNR=LmOdozqQ5Ukg@mail.gmail.com>
 <202202031247.4F3AC598@keescook>
 <CAKwvOdnUHFi=1+9VxsfwxNAkTFEytg5FV=Aii7awSx+ioRaQbQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKwvOdnUHFi=1+9VxsfwxNAkTFEytg5FV=Aii7awSx+ioRaQbQ@mail.gmail.com>

On Thu, Feb 03, 2022 at 02:01:06PM -0800, Nick Desaulniers wrote:
> On Thu, Feb 3, 2022 at 12:58 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Thu, Feb 03, 2022 at 12:18:24PM -0800, Nick Desaulniers wrote:
> > > On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
> > > >
> > > > In order to gain greater visibility to type information when using
> > > > __builtin_object_size(), Clang has a function attribute "pass_object_size"
> > > > that will make size information available for marked arguments in
> > > > a function by way of implicit additional function arguments that are
> > > > then wired up the __builtin_object_size().
> > > >
> > > > This is needed to implement FORTIFY_SOURCE in Clang, as a workaround
> > > > to Clang's __builtin_object_size() having limited visibility[1] into types
> > > > across function calls (even inlines).
> > > >
> > > > Since any usage must also be const, include it in the macro.
> > >
> > > I think it might be helpful to quote the docs
> > > (https://clang.llvm.org/docs/AttributeReference.html#pass-object-size-pass-dynamic-object-size)
> > >
> > > >> Additionally, any parameter that pass_object_size is applied to must be marked const at its function’s definition.
> > >
> > > One thing that's concerning to me is though:
> > >
> > > >> It is an error to take the address of a function with pass_object_size on any of its parameters.
> > >
> > > Surely the kernel has indirect calls to some of these functions
> > > somewhere? Is that just an issue for C++ name-mangling perhaps?
> >
> > AFAIU, this shouldn't be a problem for any of these. Nothing is trying
> > to take memcpy, memset, etc by address. The macro-ified version of this
> > change proved that out. :)
> 
> I thought Sami had found a location where memcpy was invoked
> indirectly as part of his kcfi work? Maybe I'm misremembering.
> 
> https://github.com/samitolvanen/linux/commit/46a777fb35784a8c6daf13d67de8bfb5148adc2a#diff-a27660992abdf360d01deac6364db31836d0d98b5d9573b7fc10a6785a669975R16

Hm, I've had memcpy as a macro for a while now, so dunno! That's not a
sensible thing to call indirectly. :)

-- 
Kees Cook
