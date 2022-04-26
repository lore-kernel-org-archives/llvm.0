Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182E7E
	for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 19:31:52 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id t25so33701857lfg.7
        for <llvm@lists.linux.dev>; Tue, 26 Apr 2022 12:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d2lKdoVg9+8QBkZZ79wr6jBXBfkh/xvdmyBoSZ2MvDQ=;
        b=N+7eZSpmJ/f3rHaZhc9oVBgge8yW5TewzdIlVD1HMMKA1ts0Y/O1q8e/zHgvge05TK
         O05SV7iFAA2xExBHsfBfSBz7YeZAuBIgYOvY+kR/JSsdz8khAXBTEPxD6cKSTUmnMWMy
         NLeQCIgM6KDZsailg1gAayzRv8qaMffx6oIWcUz/mm6e/uo0wq96rG7J49Iyl34S+NXT
         hl9xcWTyqekzSpnWl5n3EE2PJPOI2Eb54U4uLeOcavcS6+EELV17nEY5Mo1IaOqyvzDE
         fjHRlXhtnTSLZ5zC/KCtDT4f9UtJL2yB1ZflNRVL0Ahiozhe02TW02RycbZnGQKhXXuB
         z4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d2lKdoVg9+8QBkZZ79wr6jBXBfkh/xvdmyBoSZ2MvDQ=;
        b=5zeMGKb0Wuohur4p3blyaD+bnRslqK8nMdNyum43Xsr1Pe9kdEtka/RO6IE//XFk46
         ah/ajECn2hdcoEMTDqUxTVkLZh3kz6TT8AkTn5XyFMHlSmtO+rJLYIitT35sbid9Mgxf
         qLKLC5srbEwBAR+yDlL/oWEB8h5niB417YNzCSaCRbjEPvrBGLn7tH/NB6MndUAuUiaP
         ajZdkQWrhyB5QCTHuFsgGqXMCW4nGK+k4CE5sGEDPnE/07VyyQQ37t2t8NnePILWLLPe
         qlLWNqm+c725ULcwRaB0wb1n/jJgU2kmauKq+n5tFIcd4OlA5QcgQEQHepb9x652sTEo
         /Bqw==
X-Gm-Message-State: AOAM530wzRJHSUCXtH/BEXJmdF3C+uE611Ny35uRSeBQGfZIUPyl4Rkf
	aA3mNIURhFSKwFwraeuERu/V/zyW7XFJK971Ye0Hog==
X-Google-Smtp-Source: ABdhPJxRL7jtvn6Z6zaKcEtwBR1HYzZu3ep7tdyHsbrW8rW/3H1zXsznPgTRkfy0Abc2FM5N8duf32NGPhgKyoEMztg=
X-Received: by 2002:a05:6512:1d1:b0:471:f63a:b182 with SMTP id
 f17-20020a05651201d100b00471f63ab182mr13606660lfp.392.1651001510736; Tue, 26
 Apr 2022 12:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
 <CAK8P3a2vHuRB1vkjVkKaNxr3Ptfv3UBS0scsShQPxY46_xh9kA@mail.gmail.com>
 <Ymg43Ed/Sg8szdKq@dev-arch.thelio-3990X> <CAKwvOdkvg+jKVqetfrNPn5yNCxfZYHAhu2Cvc+dGLFG3+kOGUg@mail.gmail.com>
In-Reply-To: <CAKwvOdkvg+jKVqetfrNPn5yNCxfZYHAhu2Cvc+dGLFG3+kOGUg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 26 Apr 2022 12:31:39 -0700
Message-ID: <CAKwvOd=gdtxWgJTMYMT5NpFwGH8vwH8NbL3HursoAXvQJ7yydA@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Mauro Rossi <issor.oruam@gmail.com>, 
	Chih-Wei Huang <cwhuang@android-x86.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Mark Brown <broonie@kernel.org>, Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 26, 2022 at 12:23 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Tue, Apr 26, 2022 at 11:24 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Tue, Apr 26, 2022 at 02:21:16PM +0200, Arnd Bergmann wrote:
> > > On Mon, Apr 25, 2022 at 9:13 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
> > > > I have checked also with kernel-5.17 and the same build error is
> > > > happening also there, so it is not due to commit 34737e2698 ("uaccess: add generic
> > > > __{get,put}_kernel_nofault")
> > >
> > > Ok, that's good to know, thanks for checking! I suspect the problem is
> > > using a slightly too-old prerelease build of clang, where the released
> > > clang-11 build had the asm-goto-with-output feature enabled.
> >
> > Correct, the build failure can be reproduced with tip of tree LLVM if
> > CONFIG_CC_HAS_ASM_GOTO_OUTPUT is manually disabled, such as:
>
> That begs the question though; not all supported versions of GCC have
> asm goto w/ outputs. Why is this not an issue for older gcc versions?
> Perhaps it's because clang is validating inline asm constraints in
> dead code again? I thought I had fixed that in
> commit 158807de5822 ("x86/uaccess: Make __get_user_size() Clang
> compliant on 32-bit")
> in v5.9-rc1.
>
> I don't know why `=a` can't be used, yet.
> void foo(void *a) {
>     asm("":"=a"(*((unsigned long*)a)));
> }
> Compiles w/ -m32 just fine.  Perhaps creduce is needed.

Cvise converged on:
void copy_from_kernel_nofault(void) {
  asm("" : "=a"(*(long long *)0));
}
which is weird. Neither compiler accepts 0 for -m32, but they do for
-m64. Ah, it's the cast to long long*.

Let me see if this is fixable in the kernel sources.
-- 
Thanks,
~Nick Desaulniers
