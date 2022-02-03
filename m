Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E70A2F28
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 21:26:25 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id h23so3322483pgk.11
        for <llvm@lists.linux.dev>; Thu, 03 Feb 2022 13:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=JASYD2iL88ww2VWiUy6p02bfS5gw49UYGWcRXn9TON4=;
        b=iYVxoyFTip+1szHQnapGMLpfm1HpkZCS0F8LwwRGj4D71zzSt9sXh5Iwd4RuKKP11H
         Yj3fWwcgCkZnmFN0llcGYr9GH3/NLLqM/nDtsVQQWeuilNDl/3qGQJxVZFK6foe38G+q
         7eVyS7b9Xjh9tlEIj7X+Ai36ykoogRqJHndCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JASYD2iL88ww2VWiUy6p02bfS5gw49UYGWcRXn9TON4=;
        b=PQQZfoPFQalEmWZtZ4MS7G2Afthl0VFRXKE6cfNSx9F/ppVyElvb4aR9XfxvU+mFto
         HBk8o/k4vBVLRYVgCMdr0Lk4n5jN39mLnAxSOWDx5SHSrklaSoYmNJuWtW6iBEGX4sg5
         9JbP8izgW8HHrEs0ircCluDhyin7bVQOIpLqkMBlzdrlbWIew1PGqTKkxEMPR0iqsxTo
         7y1XzfMM/QVVXYgU1RLibal6WtCot7RXKMCRpXho35SRy0z+Nu+Xtl1x7nVQEq2a1OxL
         //Q3/SxL4/IVkfVWFMRySj4r92kGqQez56Wi3tVs6d6x77Ob4sPIAl2aM0E8CRGaGfvR
         s2AA==
X-Gm-Message-State: AOAM533N0MAbAVIkasEVwyM2U9b84CmH2ai58HuK3Qp+ZXJr4cqjuYh0
	JIdKQp+PIjpV5ad0mhAg+vF5KA==
X-Google-Smtp-Source: ABdhPJwWuqRwP0hYVRhNUuz+baJ0lKHKyif+Egk+Hd+0tQEMtNyxjnxOCHOr92bBrL3+sc3d63mJJg==
X-Received: by 2002:a63:5460:: with SMTP id e32mr7925pgm.330.1643923585032;
        Thu, 03 Feb 2022 13:26:25 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h11sm18750621pfe.214.2022.02.03.13.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 13:26:24 -0800 (PST)
Date: Thu, 3 Feb 2022 13:26:24 -0800
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	George Burgess IV <gbiv@google.com>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 4/4] fortify: Add Clang support
Message-ID: <202202031313.4A68EA9DB3@keescook>
References: <20220203173307.1033257-1-keescook@chromium.org>
 <20220203173307.1033257-5-keescook@chromium.org>
 <CAKwvOdk0UMAaw2j9OmjXN0Jc6FBOhfMP3JmSqMps2_MQFQLq-g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdk0UMAaw2j9OmjXN0Jc6FBOhfMP3JmSqMps2_MQFQLq-g@mail.gmail.com>

On Thu, Feb 03, 2022 at 12:37:41PM -0800, Nick Desaulniers wrote:
> On Thu, Feb 3, 2022 at 9:33 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Enable FORTIFY_SOURCE support for Clang:
> >
> > Use the new __pass_object_size and __overloadable attributes so
> > that Clang will have appropriate visibility into argument sizes such
> > that __builtin_object_size(p, 1) will behave correctly. Additional
> > details here:
> >     https://github.com/llvm/llvm-project/issues/53516
> >     https://github.com/ClangBuiltLinux/linux/issues/1401
> >
> > When available, use the new __diagnose_as attribute to make sure no
> > compile-time diagnostic warnings are lost due to the effectively renamed
> > string functions.
> 
> Consider adding something along the lines of the following to the
> above paragraph:
> Without diagnose_as, compile time error messages won't be as precise
> as they could be, but at least users of older toolchains will have
> fortified routines. That is more valuable, but certainly a tradeoff.

Sure, I've changed it to:

When available, use the new __diagnose_as attribute to make sure no
compile-time diagnostic warnings are lost due to the effectively renamed
string functions. Without __diagnose_as, Clang's compile time diagnostic
messages won't be as precise as they could be, but at least users of
older toolchains will have fortified routines.

how's that read for you?

> > Redefine strlen() as a macro that tests for being a constant expression
> > so that strlen() can still be used in static initializers, which was
> > lost when adding __pass_object_size and __overloadable.
> 
> I'd like to see `const` changes explicit in 4/4; I suspect that's
> _why_ __overloadable is even needed? If so, then a comment here about
> that wouldn't hurt.
> 
> Having const be more explicit in the signature will make it more
> obvious why the definition cannot modify the parameter.

Mostly I wanted to minimize further changes to this area when building
with GCC because of all the corner cases that keep popping up, and avoid
tweaking the prototypes any harder. :)

-- 
Kees Cook
