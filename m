Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBD972
	for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634238422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bXPqLb26D1n+X254p2WStepO6UEQEU6i6Gw3sazT/Yk=;
	b=RqSLZq4vNftqlyRetXWoYRYtvavdIEbsxwI2G8B9+En8IfJ9VjGBfA+lfcAMddWLWGGka8
	gEa9PA5tozcwo7sjMEMxA5QvLQ2LjQAOu/WqN0B7wWMXL95ip6J9DuPr27Y53EJoG5jaef
	Y9xWBTPyHvh4c19QgsSXMv9iSr6ItEo=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-3nSv42MWPsOilHgN5qhRfg-1; Thu, 14 Oct 2021 15:06:58 -0400
X-MC-Unique: 3nSv42MWPsOilHgN5qhRfg-1
Received: by mail-ot1-f70.google.com with SMTP id b7-20020a0568301de700b0054e351e751aso4238172otj.11
        for <llvm@lists.linux.dev>; Thu, 14 Oct 2021 12:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bXPqLb26D1n+X254p2WStepO6UEQEU6i6Gw3sazT/Yk=;
        b=nuBckiGILSFKkaysK21AVUgYAv148ydqs7Q8cD0MJdUY6swl0pwTczbuNFnuQrBKX8
         SL3RCTsiqRYYg/WsfxpNKCAHOk1FVpja0c17h2TT0ap1ejzfAXaLE39einIAIjfkqxFB
         nkobl9rYaeXRDnZUYDWKXv121p9Z7Pco4MItILUVqsyMve3PsFoyU6pl8uNhDV2IOsBf
         d3DQcG0BsrYXnKhStP2DIHxpWwLOXhCq3/Nr+sXBHudncsWWX5ZJTqgzj9XnamZ4jzPZ
         +S2kljr8KD0opu6NOgi7U6w9mypf7ErDcAo2ExtnLPP90Mhz0AAcAXSqjW3j2o2Vzvz3
         3uUA==
X-Gm-Message-State: AOAM530N4qtXGSA0pdwlRHPHp8xf5FOqE/TjIsKVdKP8kA4ONSK5BT6U
	76gcVEGlOnNtDL+J/nsISM33NiLnBjHhSGwGrK9hmLEeu1VaXqjvXwAL0oY3SG4gi1q+A7eZud3
	Se6Add4gcRZNDUQ==
X-Received: by 2002:a05:6820:253:: with SMTP id b19mr5649108ooe.28.1634238417794;
        Thu, 14 Oct 2021 12:06:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgmz6lljfLOy6EZAroJmPTbavii7SUe9t45FCkVEtlRBE3RWcOGCsz7qZDG4VxilKyIlLG0w==
X-Received: by 2002:a05:6820:253:: with SMTP id b19mr5649093ooe.28.1634238417583;
        Thu, 14 Oct 2021 12:06:57 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
        by smtp.gmail.com with ESMTPSA id l16sm593952oou.7.2021.10.14.12.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 12:06:57 -0700 (PDT)
Date: Thu, 14 Oct 2021 12:06:54 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Kees Cook <keescook@chromium.org>, Borislav Petkov <bp@alien8.de>,
	Sami Tolvanen <samitolvanen@google.com>, x86@kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Sedat Dilek <sedat.dilek@gmail.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v5 09/15] x86: Use an opaque type for functions not
 callable from C
Message-ID: <20211014190654.gn2jd43vw35gzdvs@treble>
References: <20211013181658.1020262-1-samitolvanen@google.com>
 <20211013181658.1020262-10-samitolvanen@google.com>
 <YWgSwmzPFrRbMC1P@zn.tnic>
 <202110140904.41B5183E@keescook>
 <YWhpbu/Y6V2p/zlY@zn.tnic>
 <202110141141.870A67E@keescook>
 <20211014145211.573579e6@gandalf.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20211014145211.573579e6@gandalf.local.home>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Oct 14, 2021 at 02:52:11PM -0400, Steven Rostedt wrote:
> On Thu, 14 Oct 2021 11:47:01 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > On Thu, Oct 14, 2021 at 07:31:26PM +0200, Borislav Petkov wrote:
> > > On Thu, Oct 14, 2021 at 09:07:57AM -0700, Kees Cook wrote:
> > > Looking at the changelog, DECLARE_ASM_FUNC_SYMBOL, makes a lot more
> > > sense to me even if it doesn't specify the aspect that it is not called
> > > by C but who cares - it is generic enough.  
> > 
> > Around we go. :) Josh[1] and Steven[2] explicitly disagreed with
> > that name, leading to the current name[3]. Do you want it to be
> > DECLARE_ASM_FUNC_SYMBOL() over those objections?
> 
> Just note, that I was fine with the original name, but was against the
> version Josh suggested ;-)

Naming is important, especially for something as confusing as this.  We
need to be able to read it in a few months and have some idea of what's
going on.

"DECLARE_ASM_FUNC_SYMBOL" is nonsensical.  As a reader of the code I
wonder why are some asm functions using it and not others?  And how do I
know if I need it for my new function?

"extern const u8 int3_magic[]" is even worse.  Why are some asm
functions randomly declared as arrays, and others not?  Where can I go
to find out more without digging through the commit log?

-- 
Josh

