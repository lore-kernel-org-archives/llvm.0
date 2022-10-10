Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD265CBD
	for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 22:35:06 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id gf8so10911875pjb.5
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 15:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o8aTfFEdi4IrDQkpWvZMcPZJzWibt89JJ0h0XlHUCWQ=;
        b=e1lyQBoAqNJtZtI3DVv8gdh9ihwwUAdS13M6PXLEg/2F1jkItICxGtUlAKTlCEOuuR
         qZ5osgVF3EM2tPdRk29tU2OjxCx86DTJtfUH20XCsVtr7bzYnvIHq2wu1stnDcE0x4KG
         2YEhQJ+QLy5wBicLAa4Iq/9Hb4ivru5f6GrIQXorOcrivamkEWHFujqFVs7EBGALGyxt
         2Dau4Y7iR4az5D6nfyWWoF0Fmxtc9bOKiwZvd6zrmiOK3StmHqBdkJyltZ9vr6c9xKFi
         cT6EUcRAkJ0jIgVlm0spsLfRzc/iF+v2zo8hxOwTk/VWGFuRb6R2W4tyI9acF15iw+v0
         XwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o8aTfFEdi4IrDQkpWvZMcPZJzWibt89JJ0h0XlHUCWQ=;
        b=gPWHZwvMr70hj8zr4oFZwlp+w/0aLKwPgGj1lkTXaFqwP+lAwOw8o+WaQFOtANE40d
         qqnYnuboLIj1wrssGlSnmeGw6NeIPNOfARqWpR/ACcdEQ7Gq1p0P+oKqJsHlcl4yj67T
         6cyEk4NLzJ8mdkWlzyJljVLZxKXxuoZKC+xhdi0xzgZBrdwXZBSqm89LDcVAMF4DG24v
         o52gAfsD68+iAF0M+7J14sFBL3sz8B1r/VRndBOWMQOYntzMM5E1LW0gJYr5xWVw/1JW
         bJcBareSsY3ERHgcFFHbkg1g9Dt+um84O3OuWXt5UqiSh7x1uEfZav3iC38P9GpQBgXL
         bumg==
X-Gm-Message-State: ACrzQf0atruTmU9RpFzSfdcQzXLi7efGljy9efZrbsDwlsznSWRT4UNU
	dvvZgoZ76rtlO0J1UK5o7FSn/UyJlv49cyh3gkduJw==
X-Google-Smtp-Source: AMsMyM5JfYd4wInrcYIE6hgmlF5BlVJQzwLFOGYIhvAxzBl22lj0XZrDwHRpQXWWo1bJWPVS6Ahz7DC+zvhkNqWpwkY=
X-Received: by 2002:a17:90b:1a81:b0:20a:71e5:728d with SMTP id
 ng1-20020a17090b1a8100b0020a71e5728dmr33430424pjb.107.1665441305834; Mon, 10
 Oct 2022 15:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220716001616.4052225-1-ndesaulniers@google.com>
 <CAK8P3a0ky5w82=d2N_iZ2HYujeCDKJJqjT8P25-_+VpsZYWA_A@mail.gmail.com>
 <CAKwvOdnfPeFpkD7zqt0EGk-xC_v_Lxt+2eOciMfbXihYG936Kw@mail.gmail.com> <ddc3156d-5580-4ec1-a218-2cdf5c1e9a48@app.fastmail.com>
In-Reply-To: <ddc3156d-5580-4ec1-a218-2cdf5c1e9a48@app.fastmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 10 Oct 2022 15:34:54 -0700
Message-ID: <CAKwvOdnQ-tWa0oY0CKAwJD5WQDgVBvxDtf6=E3hS8Ytz5J1OKg@mail.gmail.com>
Subject: Re: [PATCH] arm: lib: implement aeabi_uldivmod via div64_u64_rem
To: Arnd Bergmann <arnd@kernel.org>
Cc: clang-built-linux <llvm@lists.linux.dev>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Craig Topper <craig.topper@sifive.com>, 
	Philip Reames <listmail@philipreames.com>, jh@jhauser.us
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 10, 2022 at 3:14 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Mon, Oct 10, 2022, at 11:23 PM, Nick Desaulniers wrote:
> > On Sat, Jul 16, 2022 at 2:47 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >> On Sat, Jul 16, 2022 at 2:16 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/nwfpe/softfloat.c#n2312
> > Any creative ideas on how to avoid this? Perhaps putting the `aSig -=
> > bSig;` in inline asm? Inserting a `barrier()` or empty asm statement
> > into the loops also seems to work.
>
> I was going to suggest adding a barrier() as well, should have
> read on first ;-)

barrier() forces reloads+spills in the loop.  The output with `-mllvm
-replexitval=never` is optimal (assuming the loop is faster than
__aeabi_uldivmod (which I think is unprovable).
https://godbolt.org/z/7dMabYYcM

As much I hate relying on compiler-internal flags, I think this is optimal:
```
diff --git a/arch/arm/nwfpe/Makefile b/arch/arm/nwfpe/Makefile
index 303400fa2cdf..2aec85ab1e8b 100644
--- a/arch/arm/nwfpe/Makefile
+++ b/arch/arm/nwfpe/Makefile
@@ -11,3 +11,9 @@ nwfpe-y                               += fpa11.o
fpa11_cpdo.o fpa11_cpdt.o \
                                   entry.o

 nwfpe-$(CONFIG_FPE_NWFPE_XP)   += extended_cpdo.o
+
+# Try really hard to avoid generating calls to __aeabi_uldivmod() from
+# float64_rem() due to loop elision.
+ifdef CONFIG_CC_IS_CLANG
+CFLAGS_softfloat.o     += -mllvm -replexitval=never
+endif
```

Part of me is tempted to move float64_rem() to its own file for that
flag, but indvars+loop-utils isn't eliding other loops in that file
(comparing the full disassembly before+after the above diff).

Long term, it might be nice for us to have `--rtlib` recognize
`--rtlib=linux-kernel@version` or something so that we could better
describe the effective compiler runtime to the compiler.  There are
already differences in compiler-rt and libgcc where we could make
better codegen decisions if we were to consider the target rtlib.
These libraries also change over time though...
-- 
Thanks,
~Nick Desaulniers
