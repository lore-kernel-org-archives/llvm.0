Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68AF3FC3
	for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 20:06:44 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id e7so1850852plh.8
        for <llvm@lists.linux.dev>; Fri, 10 Sep 2021 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NRK2NgDvRsilBj04h+hpQakfZkUVvcRxW9UNVMOuRXg=;
        b=m9CNC0GzwXRe3LGWOh4+Xai+/o1pzNO1nbZGPDv2Fthe2Nz1v3btK/7cmqSM7ssX31
         IDfxHzpt+tMsST92nebtXArJAGSRbCpmhGEFUZhnMvLPVSqD2B2KwhsMJppTB6KwoYwl
         4bXyPF7PkDO3/baP9b3zh/eEpYrseCcLCAy5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NRK2NgDvRsilBj04h+hpQakfZkUVvcRxW9UNVMOuRXg=;
        b=ondcSaB0nbgrhaJd7nN3RPhlsYLn1VitOjXrH4piwy6iwTLsv9jcFAhXdHh4a2hz6o
         m3zzEU2qPPLoDokpTbZzkmmUjSpAgmtCaCPG3ovJn1SVBgkps9vOUFNyNs0moEw494GG
         zbr+J/GvBTdIBq0T1tljgd8m5bHxBRFfMYUE34KJkPGiQWhhlH1rUovnFuYmh2kJn8u0
         5U3/2O3nyr8cD8SmQ/6dMuTtorMDehZWSkFgbEX8EpkQm6ooIkzDljX/bZurPpHEIWkh
         2TNJfPZBMlqFu/30EKJkVUwVCTFgSCbN7n4fi7xv3XvVuUpPH1N/jF7mZalXAoM4vwox
         jPBg==
X-Gm-Message-State: AOAM531+/6RstA5JPs2OCfy3s35T6uKk/VrFqTW6OgCC4i5FWZVyKBuZ
	JbtA5OEhnmpX71cxoraudUylRg==
X-Google-Smtp-Source: ABdhPJxJsEN6tPJOss1Pbu2mLYG9KZQIA+S2RqJ9zhGQgD0UbgXFz1wzJ21dE+lYDsrVBsqHmhe9Yw==
X-Received: by 2002:a17:902:7fc8:b0:13a:6e6b:a240 with SMTP id t8-20020a1709027fc800b0013a6e6ba240mr9095772plb.6.1631304404292;
        Fri, 10 Sep 2021 13:06:44 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s15sm5326301pfu.67.2021.09.10.13.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 13:06:43 -0700 (PDT)
Date: Fri, 10 Sep 2021 13:06:42 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Marco Elver <elver@google.com>, Will Deacon <will@kernel.org>,
	Arvind Sankar <nivedita@alum.mit.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
	llvm@lists.linux.dev,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] Compiler Attributes: Check GCC version for __alloc_size
 attribute
Message-ID: <202109101300.4FAAD4F81@keescook>
References: <20210910165851.3296624-1-keescook@chromium.org>
 <CAKwvOdngxD7P=qEvGcFZXB7mZp+Ub8_Rp3V3nXq5uMEcsrUsGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdngxD7P=qEvGcFZXB7mZp+Ub8_Rp3V3nXq5uMEcsrUsGA@mail.gmail.com>

On Fri, Sep 10, 2021 at 12:05:03PM -0700, Nick Desaulniers wrote:
> On Fri, Sep 10, 2021 at 9:58 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > Unfortunately, just version checking the use of -Wno-alloc-size-larger-than
> > is not sufficient to make the __alloc_size attribute behave correctly
> > under older GCC versions. The attribute itself must be disabled in those
> > situations too, as there appears to be no way to reliably silence the
> > SIZE_MAX constant expression cases for GCC versions less than 9.1:
> >
> > In file included from ./include/linux/resource_ext.h:11,
> >                  from ./include/linux/pci.h:40,
> >                  from drivers/net/ethernet/intel/ixgbe/ixgbe.h:9,
> >                  from drivers/net/ethernet/intel/ixgbe/ixgbe_lib.c:4:
> > In function 'kmalloc_node',
> >     inlined from 'ixgbe_alloc_q_vector' at ./include/linux/slab.h:743:9:
> > ./include/linux/slab.h:618:9: error: argument 1 value '18446744073709551615' exceeds maximum object size 9223372036854775807 [-Werror=alloc-size-larger-than=]
> >   return __kmalloc_node(size, flags, node);
> >          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > ./include/linux/slab.h: In function 'ixgbe_alloc_q_vector':
> > ./include/linux/slab.h:455:7: note: in a call to allocation function '__kmalloc_node' declared here
> >  void *__kmalloc_node(size_t size, gfp_t flags, int node) __assume_slab_alignment __malloc;
> >        ^~~~~~~~~~~~~~
> >
> > Specifically:
> > -Wno-alloc-size-larger-than is not correctly handled by GCC < 9.1
> >   https://godbolt.org/z/hqsfG7q84 (doesn't disable)
> 
> (heh, clang has had similar bugs with command line flags with `=` seperators)
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> 
> Though some of the below examples don't make sense to me (the one
> above is fine).
> 
> >   https://godbolt.org/z/P9jdrPTYh (doesn't admit to not knowing about option)
> 
> ^ technically your first link demonstrates that. This link doesn't add
> anything new and makes it look like there are more issues that there
> are.

Yes, but it's messy. I wanted to show each part of it. The above shows
that given just "-Wno-alloc-size-larger-than" and no other errors, the
compiler happily takes the argument. (i.e. $(call cc-option,...) would
think it succeeded).

> >   https://godbolt.org/z/465TPMWKb (only warns when other warnings appear)
> 
> ^ this example doesn't make sense to me.  I couldn't reproduce what
> you're describing.

In this one, the only difference between it and the one above it is
having an unrelated warning present:

<source>: In function 'main':
<source>:8:9: warning: unused variable 'trigger_an_extra_warning'
[-Wunused-variable]
     int trigger_an_extra_warning;
         ^~~~~~~~~~~~~~~~~~~~~~~~

At which point it suddenly DOES admit to not knowing about
-Wno-alloc-size-larger-than:

<source>: At top level:
cc1: warning: unrecognized command line option '-Wno-alloc-size-larger-than'

> 
> >
> > -Walloc-size-larger-than=18446744073709551615 is not handled by GCC < 8
> >   https://godbolt.org/z/73hh1EPxz (ignores numeric value)
> 
> Should this be GCC < 8.2?

Yeah, that's true, the note here should say "8.2", but for the purposes
of this attempted it, everything below 9.1 is broken in various ways.
Better to just avoid everything. I wanted to document all the ways it is
broken, though, so folks don't go through my same pain. :P

> Some other feedback on the general use of godbolt.  Under Output,
> please always disable Intel Asm Syntax; it causes me physical pain.
> Also under output, usually disabling Execute the Output is what you
> want, too.

Good points, yes!

Thanks for checking this out. :)

-- 
Kees Cook
