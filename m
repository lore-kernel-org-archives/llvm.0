Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D47C
	for <llvm@lists.linux.dev>; Mon,  7 Mar 2022 19:27:33 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id r22so6448128ljd.4
        for <llvm@lists.linux.dev>; Mon, 07 Mar 2022 11:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SVBV2wZFJAjN2h9j0Z4F7Jopu2ak6HDZAwmIwXaGh1o=;
        b=b3guF+X4TC+TdqPtkW12kFCkavbOOOW56cGgKmUIHum7T6rwaa1+RbjhNEjwgHpfLb
         21h3Ap4cIwhxCiGf0ICLaAJnj9+V5Gno7TGr8zeo2/oskdQRKHAi5LrWx94LHOLMaL07
         POBLxzfhK8Zkhi6RwaKYtcyIIVmvQeMoMObjy9W5jKqTLygmvhVuUy0Ijqdvm4P9uGaP
         l4QB3vFDOij2gh11c/Xpkp24SJMXj1UfnVdY2/vi694x8xX+7YYhWPJxUoJEdvc6H3cz
         LTYcsGTKp+jAALjL7gmrEPq93MArixMhwHuV32R5GMnH8IQ13EK2mCBFY4VzJWSzStA/
         exyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SVBV2wZFJAjN2h9j0Z4F7Jopu2ak6HDZAwmIwXaGh1o=;
        b=oLJMvbKkR3qzvIWJvjHS+DcqQQPdSrgUHFDvo1id31WC0JWGK/xRyfrwkSUtpk+eon
         D3HNLQlYD+zX+J0/WDumHYzhrUxA6HbmJcfTkaqujyImuNu7BhPOIjqh5caTMwsBhBzZ
         RqzI3FUeWTgwN0kWxiPhcPWuHn7N7WlJ6meXQffdXF7jtDjeBghwSUOjDdgLAy/LwYxl
         HObGg3C7dSE6aqRu6pOS7+hslet6p9734sZDRgWf2ueNYrWVGVap4D7xp8S7/+E97ZJi
         Amybqc+gb0/nTBVrQHO4AI3Map/1Y0rIJC/wY6Y4fjO2Vi76yNFUhkL2xfe0FoAXIgYn
         sbwQ==
X-Gm-Message-State: AOAM533dFVuEWOTWIUHcKv6inf2cF2TBcLblykQpI5G7g2HJPgvGku1r
	SuYwBZETA6qxQJBJwJiKSYWF2aFIcWyV1JetAwF8Bg==
X-Google-Smtp-Source: ABdhPJwlCRpT16fu20mg/MrXVr3UiSRNMzd+8h23r72AfO3t1sYz5AUlWa7TNhUOqODIfn89a8MDl1AI71zquuH1lls=
X-Received: by 2002:a2e:871a:0:b0:246:ee2:1109 with SMTP id
 m26-20020a2e871a000000b002460ee21109mr8500427lji.165.1646681251621; Mon, 07
 Mar 2022 11:27:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220304224645.3677453-1-memxor@gmail.com> <20220304224645.3677453-6-memxor@gmail.com>
 <CAKwvOdnEyvjZn14WAPyL1O=S9C-LGx7aB3fYc7TAbgngfcXM5A@mail.gmail.com>
In-Reply-To: <CAKwvOdnEyvjZn14WAPyL1O=S9C-LGx7aB3fYc7TAbgngfcXM5A@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 7 Mar 2022 11:27:20 -0800
Message-ID: <CAKwvOdnwiRdvTRA1Y30bzOsnwUyvSEbq+qT0tU4_vVHz=y_0Ng@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 5/8] compiler-clang.h: Add __diag
 infrastructure for clang
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <kafai@fb.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Also, please cc me and the llvm mailing list on all changes to
include/linux/compiler-clang.h. I see now on lore there's further
patches here than just this single patch I was cc'ed on.

On Mon, Mar 7, 2022 at 11:25 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Mar 4, 2022 at 2:47 PM Kumar Kartikeya Dwivedi <memxor@gmail.com> wrote:
> >
> > From: Nathan Chancellor <nathan@kernel.org>
> >
> > Add __diag macros similar to those in compiler-gcc.h, so that warnings
> > that need to be adjusted for specific cases but not globally can be
> > ignored when building with clang.
> >
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: llvm@lists.linux.dev
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> > [ Kartikeya: wrote commit message ]
> > Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > ---
> >  include/linux/compiler-clang.h | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/include/linux/compiler-clang.h b/include/linux/compiler-clang.h
> > index 3c4de9b6c6e3..f1aa41d520bd 100644
> > --- a/include/linux/compiler-clang.h
> > +++ b/include/linux/compiler-clang.h
>
> The equivalent functionality for GCC has
> 357 #ifndef __diag_GCC
> 358 #define __diag_GCC(version, severity, string)
> 359 #endif
> in include/linux/compiler_types.h. Should this patch as well? (at
> least #define __diag_clang`)?
>
> > @@ -68,3 +68,25 @@
> >
> >  #define __nocfi                __attribute__((__no_sanitize__("cfi")))
> >  #define __cficanonical __attribute__((__cfi_canonical_jump_table__))
> > +
> > +/*
> > + * Turn individual warnings and errors on and off locally, depending
> > + * on version.
> > + */
> > +#define __diag_clang(version, severity, s) \
> > +       __diag_clang_ ## version(__diag_clang_ ## severity s)
> > +
> > +/* Severity used in pragma directives */
> > +#define __diag_clang_ignore    ignored
> > +#define __diag_clang_warn      warning
> > +#define __diag_clang_error     error
>
> These severities match GCC. I wonder if rather than copy+pasting these
> over, we could rework __diag_ignore, __diag_warn, and __diag_error to
> not invoke a compiler-suffixed macro and rather pass the compiler
> along (or make it implicit since we know CONFIG_CC_IS_CLANG vs
> CONFIG_CC_IS_GCC)?  We can probably land this than follow up on better
> code-reuse between compilers for diagnostics.
>
> > +
> > +#define __diag_str1(s)         #s
> > +#define __diag_str(s)          __diag_str1(s)
> > +#define __diag(s)              _Pragma(__diag_str(clang diagnostic s))
> > +
> > +#if CONFIG_CLANG_VERSION >= 110000
> > +#define __diag_clang_11(s)     __diag(s)
> > +#else
> > +#define __diag_clang_11(s)
> > +#endif
> > --
> > 2.35.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



-- 
Thanks,
~Nick Desaulniers
