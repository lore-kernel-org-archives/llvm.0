Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com [210.131.2.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBF07F
	for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 18:23:46 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49]) (authenticated)
	by conssluserg-05.nifty.com with ESMTP id 29GINbFc016347
	for <llvm@lists.linux.dev>; Mon, 17 Oct 2022 03:23:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 29GINbFc016347
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1665944618;
	bh=fRz3ySy23/ffC+gMEN6Ix4ccsH+L67FX85AWDvOKFP8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=wdTea9oqL3X6867SSEk17SX9AwgoOktiD9xxzyf932KyAhT4lLe4EqW7at35Nj/3g
	 CGyiBsGFK1eZqa2ODBMvUVWHSPEsO0sn18DJcrYj5Gtmy8EmfJJkQDUokfGZKtbBgf
	 r4R7x1CoOedw+twFwI4gzbZYgNYcrRbsQOaX4cgDs461/uDPxsDClPUourmubfCJXG
	 9jBh4ekzZ19FHrPQ2vN0+fP7qqDRiqEBXsOj7OwpC/hU6CEXWZGv6UI/VrU4DYYLhr
	 y6cCZlBPUSqBbrMRAa6YiPtFYzqvPttBIAa6RxAsdYplroGQR9PPY7FwITjclkb/kF
	 HZtqLYnozXakw==
X-Nifty-SrcIP: [209.85.160.49]
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-1364357a691so11253817fac.7
        for <llvm@lists.linux.dev>; Sun, 16 Oct 2022 11:23:37 -0700 (PDT)
X-Gm-Message-State: ACrzQf2+WpK/B9b2tG3PJFrlvENOnvpqRnM/Ifo/VfsD9p9kaB5kLvz9
	XpYem8739K/mux31MymH0qdBO4iZfM2+xcLPxxw=
X-Google-Smtp-Source: AMsMyM6GRvVgXtI3ayO2vjiuPBvoDA4IVEzkiYVV0tBwypOIIW4e6YoM8Or3yA24icDQL2VRQQfGQFrPBzAw0kD++Z4=
X-Received: by 2002:a05:6870:8a09:b0:132:554d:2f3d with SMTP id
 p9-20020a0568708a0900b00132554d2f3dmr13479026oaq.194.1665944616376; Sun, 16
 Oct 2022 11:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011171427.58891-1-masahiroy@kernel.org> <CANiq72kvaPGr=2S6J7q7gfEg_CauHUfhuLmABpktfUPfK+_Hvg@mail.gmail.com>
In-Reply-To: <CANiq72kvaPGr=2S6J7q7gfEg_CauHUfhuLmABpktfUPfK+_Hvg@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 17 Oct 2022 03:22:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQkSbH-Gw3sgMzxHyA9pSf3gLVvbCLg3yvbO43_vi5=YA@mail.gmail.com>
Message-ID: <CAK7LNAQkSbH-Gw3sgMzxHyA9pSf3gLVvbCLg3yvbO43_vi5=YA@mail.gmail.com>
Subject: Re: [PATCH v2] Remove Intel compiler support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nick Terrell <terrelln@fb.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-ia64@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Len Brown <lenb@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Robert Moore <robert.moore@intel.com>, Tom Rix <trix@redhat.com>,
        devel@acpica.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 14, 2022 at 11:40 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 11, 2022 at 7:16 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
> > index 898b3458b24a..9221302f6ae8 100644
> > --- a/include/linux/compiler_attributes.h
> > +++ b/include/linux/compiler_attributes.h
> > @@ -64,16 +64,10 @@
> >   * compiler should see some alignment anyway, when the return value is
> >   * massaged by 'flags = ptr & 3; ptr &= ~3;').
> >   *
> > - * Optional: not supported by icc
> > - *
> >   *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-assume_005faligned-function-attribute
> >   * clang: https://clang.llvm.org/docs/AttributeReference.html#assume-aligned
> >   */
> > -#if __has_attribute(__assume_aligned__)
> > -# define __assume_aligned(a, ...)       __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))
> > -#else
> > -# define __assume_aligned(a, ...)
> > -#endif
> > +#define __assume_aligned(a, ...)        __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))
>
> Thanks for cleaning the conditional inclusion here. I double-checked
> it is indeed available for both GCC and Clang current minimum versions
> just in case: https://godbolt.org/z/PxaqeEdcE.
>
> > diff --git a/lib/zstd/common/compiler.h b/lib/zstd/common/compiler.h
> > index f5a9c70a228a..c281a6430cd4 100644
> > --- a/lib/zstd/common/compiler.h
> > +++ b/lib/zstd/common/compiler.h
> > @@ -116,7 +116,7 @@
> >
> >  /* vectorization
> >   * older GCC (pre gcc-4.3 picked as the cutoff) uses a different syntax */
> > -#if !defined(__INTEL_COMPILER) && !defined(__clang__) && defined(__GNUC__)
> > +#if !defined(__clang__) && defined(__GNUC__)
> >  #  if (__GNUC__ == 4 && __GNUC_MINOR__ > 3) || (__GNUC__ >= 5)
> >  #    define DONT_VECTORIZE __attribute__((optimize("no-tree-vectorize")))
> >  #  else
>
> These files come from upstream Zstandard -- should we keep those lines
> to minimize divergence?
> https://github.com/facebook/zstd/blob/v1.4.10/lib/common/compiler.h#L154.
>
> Commit e0c1b49f5b67 ("lib: zstd: Upgrade to latest upstream zstd
> version 1.4.10") is the latest upgrade, and says:
>
>     This patch is 100% generated from upstream zstd commit 20821a46f412 [0].
>
>     This patch is very large because it is transitioning from the custom
>     kernel zstd to using upstream directly. The new zstd follows upstreams
>     file structure which is different. Future update patches will be much
>     smaller because they will only contain the changes from one upstream
>     zstd release.
>
> So I think Nick would prefer to keep the changes as minimal as
> possible with respect to upstream.
>
> Further reading seems to suggest this is the case, e.g. see this
> commit upstream that introduces a space to match the kernel:
> https://github.com/facebook/zstd/commit/b53da1f6f499f0d44c5f40795b080d967b24e5fa.
>
> > diff --git a/lib/zstd/compress/zstd_fast.c b/lib/zstd/compress/zstd_fast.c
> > index 96b7d48e2868..800f3865119f 100644
> > --- a/lib/zstd/compress/zstd_fast.c
> > +++ b/lib/zstd/compress/zstd_fast.c
> > @@ -80,13 +80,6 @@ ZSTD_compressBlock_fast_generic(
> >      }
> >
> >      /* Main Search Loop */
> > -#ifdef __INTEL_COMPILER
> > -    /* From intel 'The vector pragma indicates that the loop should be
> > -     * vectorized if it is legal to do so'. Can be used together with
> > -     * #pragma ivdep (but have opted to exclude that because intel
> > -     * warns against using it).*/
> > -    #pragma vector always
> > -#endif
> >      while (ip1 < ilimit) {   /* < instead of <=, because check at ip0+2 */
> >          size_t mLength;
> >          BYTE const* ip2 = ip0 + 2;
>
> Ditto: https://github.com/facebook/zstd/blob/v1.4.10/lib/compress/zstd_fast.c#L83.
>
> Apart from the zstd divergence which I am not sure about, everything
> looks good to me!
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>
> Cheers,
> Miguel


Thanks for your close review.

I will drop zstd changes and send v3.



-- 
Best Regards
Masahiro Yamada
