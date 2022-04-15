Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EB57B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 18:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650047022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kFsiuj5rFIIU65pz1ntOCgYscQgFC6WoW8AEcQc8/tY=;
	b=G3gVYeebNLztEoOSjgWTknkXcFvrckA7dBYR+5NKwRba8zjCRItDoWtsIJde2m7xgbYmjR
	ztWDFWh96hFQBD84o2e0CiLdJRwN2hedeoKI935xH1h1hZC3pCKBXcVwwtWCggIBSz1uDh
	ZOoU2ZjJGbqIRnqv44WbzPP9WD+m0oI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-bcn7UikcONqE4-xpao6eUg-1; Fri, 15 Apr 2022 14:23:41 -0400
X-MC-Unique: bcn7UikcONqE4-xpao6eUg-1
Received: by mail-qv1-f70.google.com with SMTP id a13-20020a0562140c2d00b00443dc12c9ebso7432483qvd.1
        for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 11:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kFsiuj5rFIIU65pz1ntOCgYscQgFC6WoW8AEcQc8/tY=;
        b=E8eKeiJL0+dTt63uoP2nMtdUKP6nVcmqOXxf/+g0IL801nufDyBqgLT9QC2dzL7oMm
         8zvnGrmoZOBMm7yFuxQaKip7fhD5ykrEemrTsyYztU5Ae5RFPU5M1tv29t3bh7fmn5mw
         2GCjWHZlYftp6s43romQfsuu+LNrPxc1QNOzmTGvsUpdIaToBo1BxX5jbJG55JCQQVLX
         YnUpBZ8QCRK2WQUZupIT03rfVH0EPWaKltYlXpQp1A6DUK3tKhMKFAtSIC/4Q6OT7cwf
         7gwzYxt8Q4g1MAS6ySpRZXS6BHVMMGxnN8/AT9xlkIM8mdH2RI1zCxKvX9qjKyEDOv9u
         Ix5Q==
X-Gm-Message-State: AOAM531ayC7iGFXXwAGQ0ml5igGK4MRfvh4vpaTEJa0SgGrfD///YYSf
	uPEkRjcZzPAUf0H0+E1IfDKrp0MnLXAhrYDI2yU+6pOYb8Ha1W2v9gzXL8h41ilupjCMC9PPX5V
	vajfnP1f+SKsHSA==
X-Received: by 2002:a37:67d8:0:b0:69b:eae2:50e7 with SMTP id b207-20020a3767d8000000b0069beae250e7mr137971qkc.739.1650047021260;
        Fri, 15 Apr 2022 11:23:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHTjKhYgPS32F5b55x/cqBLiVDD9MmJIba/xgfgG46VdzmqMhshD5nlI0BgEA/ZK72EWB/Dg==
X-Received: by 2002:a37:67d8:0:b0:69b:eae2:50e7 with SMTP id b207-20020a3767d8000000b0069beae250e7mr137963qkc.739.1650047021016;
        Fri, 15 Apr 2022 11:23:41 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::45])
        by smtp.gmail.com with ESMTPSA id b206-20020a3767d7000000b0069be71815b8sm2845193qkc.42.2022.04.15.11.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 11:23:40 -0700 (PDT)
Date: Fri, 15 Apr 2022 11:23:37 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
	hjl.tools@gmail.com, mbenes@suse.cz, rostedt@goodmis.org,
	linux-toolchains@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: The trouble with __weak and objtool got worse
Message-ID: <20220415182337.v4dcxyfokimfsnj4@treble>
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net>
 <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220415182130.iltk2uxnubeaa4nk@treble>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Apr 15, 2022 at 11:21:34AM -0700, Josh Poimboeuf wrote:
> On Fri, Apr 15, 2022 at 10:40:22AM -0700, Nick Desaulniers wrote:
> > On Fri, Apr 15, 2022 at 8:26 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Fri, Apr 15, 2022 at 01:19:04PM +0200, Peter Zijlstra wrote:
> > > > Alternatively:
> > > >
> > > >   https://sourceware.org/pipermail/binutils/2020-December/114671.html
> > > >
> > > > seems to suggest: -Wa,--generate-unused-section-symbols=yes, ought to
> > > > work, except I'm getting:
> > > >
> > > > $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,--generate-unused-section-symbols=yes -c foo*.c
> > > > as: unrecognized option '--generate-unused-section-symbols=yes'
> > > > as: unrecognized option '--generate-unused-section-symbols=yes'
> > >
> > > Reading so hard...
> > >
> > >  $ gcc -O2 -fcf-protection=none -fno-asynchronous-unwind-tables -Wa,-generate-unused-section-symbols=yes -c foo*.c
> > >
> > > seems to actually work.
> > 
> > $ clang hello.c -Wa,-generate-unused-section-symbols=yes
> > clang-15: error: unsupported argument
> > '-generate-unused-section-symbols=yes' to option '-Wa,'
> > 
> > :)
> > 
> > I recall LLVM not emitting STT_SECTION symbols being problematic for
> > objtool in the past.
> > Old pre-lore archive:
> > https://groups.google.com/g/clang-built-linux/c/1C6YoJKBsQQ/m/a8IS1NjGAgAJ
> > via https://github.com/ClangBuiltLinux/linux/issues/1209.
> > (It doesn't look too bad for me to implement)
> 
> Right, and that objtool "fix" -- silently falling back to
> non-section-symbol relocations instead of erroring out -- is causing
> this issue, when it's done for weak symbols.
> 
> If LLVM assembler doesn't support this option then we may have to go
> with something like this?  I can't seem to recreate so I'm not able to
> test.
> 
> We'd also need some objtool checks to make sure the non-section-symbol
> fallback isn't being done for a weak symbol.  Or just remove the
> fallback altogether and force section symbols whereever they're needed,
> similar to the below (untested).

(If the patch works, we could hopefully come up with something better,
using asm goto, that doesn't involve actual instructions)

-- 
Josh

