Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F95294F0
	for <llvm@lists.linux.dev>; Tue,  6 Jun 2023 09:39:25 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1a27ffe9dcdso5581295fac.2
        for <llvm@lists.linux.dev>; Tue, 06 Jun 2023 02:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686044365; x=1688636365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wkn+HZKrKRvjZDeKyoBSF6uuTA952duEKPUjrTbetXc=;
        b=Xk98Lq63ARoE6wByWmP5TRbFLyEczW5OgMxZqZdrkN0xhQmBTDBvHky6C2JFWtS0EP
         t1k6AgtIqbbaNDEPOk9sVx6QN9364Gs48mHxkPxM9Q+e8jSEs8ry5JnHQq4iPKbWa68v
         dDN7dkOnic56zybeWXpVUMZdYO8QL8xXC7oZdFtb6DKE8T9lCunlOuqSaguUxhbhUkoo
         H2QyCwGTHT+f8fT16z+JvnaUJUpSuNdBmm5BOBgKAGZyxv23yEx+VoNc1cdunZQFXt63
         LEHR06oLfVuRM8riNXPsTYE0pKHi4y6umjoMTLXrY5tc1boeJg+mR/hWZHgPwS6UFGdL
         46LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044365; x=1688636365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wkn+HZKrKRvjZDeKyoBSF6uuTA952duEKPUjrTbetXc=;
        b=HSP7/LsB48F7SzezJFKWQPTipvD0c+5WHf9F8otsHvCG1uOjXkPLdPoKiek5ar4iIF
         Jnvt76o7fSejPSLaV9svvAm4Dfgt30hMwJo0hZRcRHj5QrfqgUF/FhxLi0daMZL8J1Pb
         gu96ZDTVrc+fHfUz5C3vc02jxem2cQWsg43Os/b9+lGKk17dciSfMqbfLkZI+N1Tl58z
         B0lDcYox+xnFwO/arPMcuDmQRY//aoEDPkNIbHH3EjQXjazDukODK94fYDJjh57m1TVy
         dL6kvP1DaeArYaIvyZyLj97Nq1sDGf8jArgFMGNHe0dBg3RTOd+ibKy92uHmzbA7K+Dl
         2anw==
X-Gm-Message-State: AC+VfDyY4mJl3HHrBUGFbrpQdYDYecBN3jahCB0D3sW8YWsI7BrUQ4px
	FwYHm41BboM1DPuqQ/BlDV45pzzhjMVMSOPjqYj52/i6GBpbWg==
X-Google-Smtp-Source: ACHHUZ7RlRqtk6XhCDIyyvV5f8xnVmgsCHWmmdKU+g3Rzq8HCG+ezOvRdvmsSn67PDqPLmMXNIE0/9Xh3slMMxMFays=
X-Received: by 2002:a05:6870:b7b3:b0:19f:45a1:b5a2 with SMTP id
 ed51-20020a056870b7b300b0019f45a1b5a2mr2054969oab.49.1686044364808; Tue, 06
 Jun 2023 02:39:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20200721041940.4029552-1-maskray@google.com> <6576b5c0-ff42-4d12-be68-bc66dce268a5n@googlegroups.com>
 <CAKwvOd=QDy02=USKKYQAr16M2YWVFwcZutEWmFWpJcS7sZemxg@mail.gmail.com>
In-Reply-To: <CAKwvOd=QDy02=USKKYQAr16M2YWVFwcZutEWmFWpJcS7sZemxg@mail.gmail.com>
From: Thomas-topway-it <thomas.topway.it@gmail.com>
Date: Tue, 6 Jun 2023 13:39:14 +0400
Message-ID: <CA+wrm5DCJzM0mfy9eZhjz1gGWrEsg4fr28WqgYJ49f_6iM8nPg@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

hello Nick,
    thanks a lot, I've added the new list as 'cc'.
So yes, after a lot of researches I also identified
the issue as such. However, shouldn't it be handled
automatically by Android Studio ?
Clang fails indeed because it is not provided with the
right target. Unless there is an easy way to add
it in the build.gradle, could it be related to the following ?

"To better model how GCC's -B/--prefix takes in effect in practice, newer
Clang (since
https://github.com/llvm/llvm-project/commit/3452a0d8c17f7166f479706b293caf6=
ac76ffd90)
only searches for $(prefix)$needle. Currently it will find /usr/bin/as
instead of /usr/bin/aarch64-linux-gnu-as."

https://groups.google.com/g/clang-built-linux/c/RbwKbwkBok8/m/rGUo8gUWBgAJ

Anyone has experience of the same issue with the CFlag '-no-integrated-as'
on Ubuntu 22 and up ?
(Thomas)


On Mon, 5 Jun 2023 at 20:25, Nick Desaulniers <ndesaulniers@google.com> wro=
te:
>
> On Sat, Jun 3, 2023 at 11:46=E2=80=AFAM Thomas-topway-it
> <thomas.topway.it@gmail.com> wrote:
> >
> > hello,  I'm trying to compile a c++ library on Android Studio,
> > on Ubuntu 22.10, Clang 15.0.7, with CFlag '-no-integrated-as'.
> > I think I experience the issue here described
> > /usr/bin/as: unrecognized option '-EL'
> > (this also setting manually the path of
> > aarch64-linux-android-as)
> > I've tried to downgrade to Clang 11 but no luck with
> > this also. (it compiles x86 and x86_64, but not
> > armeabi and arm64 for the same cause)
> > Is there a way to set the prefix at Android Studio
> > level instead than manually in the mk of
> > all the libraries? Or is there a solution
> > for the latest version of Ubuntu ?
> > I'm not sure if this is the right place to
> > ask this question, but perhaps you are able to
> > give some suggestions.
>
> Hi Thomas,
> This mailing list was used for discussion building the linux kernel with =
clang.
> https://clangbuiltlinux.github.io/
> We now use llvm@lists.linux.dev instead and this ML is inactive.
>
> I've never used Android Studio, so I can't help you with UI questions,
> but I know that the (host) assembler (probably x86_64) is complaining
> that it doesn't recognize the command line flag (`-EL`; endianness
> little) because x86_64 is not bi-endian (it's always LE) and that
> assembler flag was probably meant for the target assembler (aarch64?
> arm?).  That's a familiar failure when clang is not given a target
> triple on the command line, like `--target=3Daarch64-linux-gnu`, during
> cross compilation. I'm guessing you'd want a triple with `android`
> somewhere in the string.
>
> Hope this helps!
>
> > Thanks a lot
> >
> >
> > On Tuesday, 21 July 2020 at 08:20:05 UTC+4 Fangrui Song wrote:
> >>
> >> When CROSS_COMPILE is set (e.g. aarch64-linux-gnu-), if
> >> $(CROSS_COMPILE)elfedit is found at /usr/bin/aarch64-linux-gnu-elfedit=
,
> >> GCC_TOOLCHAIN_DIR will be set to /usr/bin/. --prefix=3D will be set to
> >> /usr/bin/ and Clang as of 11 will search for both
> >> $(prefix)aarch64-linux-gnu-$needle and $(prefix)$needle.
> >>
> >> GCC searchs for $(prefix)aarch64-linux-gnu/$version/$needle,
> >> $(prefix)aarch64-linux-gnu/$needle and $(prefix)$needle. In practice,
> >> $(prefix)aarch64-linux-gnu/$needle rarely contains executables.
> >>
> >> To better model how GCC's -B/--prefix takes in effect in practice, new=
er
> >> Clang (since
> >> https://github.com/llvm/llvm-project/commit/3452a0d8c17f7166f479706b29=
3caf6ac76ffd90)
> >> only searches for $(prefix)$needle. Currently it will find /usr/bin/as
> >> instead of /usr/bin/aarch64-linux-gnu-as.
> >>
> >> Set --prefix=3D to $(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
> >> (/usr/bin/aarch64-linux-gnu-) so that newer Clang can find the
> >> appropriate cross compiling GNU as (when -no-integrated-as is in
> >> effect).
> >>
> >> Reported-by: Nathan Chancellor <natecha...@gmail.com>
> >> Signed-off-by: Fangrui Song <mas...@google.com>
> >> Reviewed-by: Nathan Chancellor <natecha...@gmail.com>
> >> Tested-by: Nathan Chancellor <natecha...@gmail.com>
> >> Tested-by: Nick Desaulniers <ndesau...@google.com>
> >> Link: https://github.com/ClangBuiltLinux/linux/issues/1099
> >> ---
> >> Changes in v2:
> >> * Updated description to add tags and the llvm-project commit link.
> >> * Fixed a typo.
> >> ---
> >> Makefile | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/Makefile b/Makefile
> >> index 0b5f8538bde5..3ac83e375b61 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -567,7 +567,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | =
grep clang),)
> >> ifneq ($(CROSS_COMPILE),)
> >> CLANG_FLAGS +=3D --target=3D$(notdir $(CROSS_COMPILE:%-=3D%))
> >> GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)elfedit))
> >> -CLANG_FLAGS +=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)
> >> +CLANG_FLAGS +=3D --prefix=3D$(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
> >> GCC_TOOLCHAIN :=3D $(realpath $(GCC_TOOLCHAIN_DIR)/..)
> >> endif
> >> ifneq ($(GCC_TOOLCHAIN),)
> >> --
> >> 2.28.0.rc0.105.gf9edc3c819-goog
> >>
> > --
> > You received this message because you are subscribed to the Google Grou=
ps "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send =
an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/ms=
gid/clang-built-linux/6576b5c0-ff42-4d12-be68-bc66dce268a5n%40googlegroups.=
com.
>
>
>
> --
> Thanks,
> ~Nick Desaulniers
