Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205395115
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 19:52:32 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id e16so1515480lfc.13
        for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 12:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AQ3E8sCDZrEL2wZ8doD+CiI98BAdcflnpsvxxLxIuMs=;
        b=ENTvmxmfC4BBPkAvhD10+g2ipgazNCa4PAo9eVHZtO0K7t4pwlwqgomak+5pu8YwRJ
         05IbDBoO0ky49EF0YZ16JJCVFeR7Z9tKixBgevg/2393ptzAGOCK+UyXWJAsR8TlWx9R
         ZEjN0bsBQp4zVFejhCCUNvPjaId2PNhRRnnsQbJDR1bxrWukR/2LCBs8ftpwE68iS1ch
         vRxY210N95DMzLNpJH2jRAEQW25g4EtYLjiYQy532pwdPCzQnkGUZ/Hz2KLzgQo+MgQA
         djHW421qAfRshCbzSw2FzrnMQE3fucFLq7CGZfxVWOCAGxNIUiD/04HWve0DpOEztz0o
         4zIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AQ3E8sCDZrEL2wZ8doD+CiI98BAdcflnpsvxxLxIuMs=;
        b=jeG51yjURmtta1hjW0tnKCX9eNq5kXmKKQPSRehWtAyGbI51UAAAZBHqxqYPkECamO
         g5/l/r4gPVLyEmJRKzvq8g0i6tw8K8HNS57YP38zjeEINaX3GTz9fu0wHOl9nVGxJZGT
         gYe75pSuX7M0s5eS8SBtHhEQrJvtRbyIaRX3Pkaqy7iqC1a+9iBf5Z7r11F3k1EZ4gxn
         qt5bwQCFVXmTcWetZtoxVtZ6LkWODBX536A0I9I1aQy8B/rRYoE4cY+giZa2h5DVZ6jp
         ZPeXzwl5vA3vD4kP7RHZIuDDh2G/z+tOhPbZLdvW1p/BpJIOJkOLA/5eon1a2YjGlARf
         RNfQ==
X-Gm-Message-State: AOAM532rSu1Qb96A19/nDktg82tXcugNR73SoOtntQsseqZEVxiN9Esf
	RwteLhvfSgBJrUIxSATm3oKPTo1Pw2JIRO70rWcVtw==
X-Google-Smtp-Source: ABdhPJyRQNH0WtelZOLCxhPX/+XCdJCX7NUeT+ryQRKooQ4D3nMrEUPMm3JbVI2fIOqCYAy82TIIaA+3n9az4eMg7Ys=
X-Received: by 2002:a05:6512:308e:b0:448:3826:6d68 with SMTP id
 z14-20020a056512308e00b0044838266d68mr6639558lfd.184.1647633149856; Fri, 18
 Mar 2022 12:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220316183833.1563139-1-arnd@kernel.org> <3b9cedd6-a084-5d87-2fdd-0da10146827b@arm.com>
In-Reply-To: <3b9cedd6-a084-5d87-2fdd-0da10146827b@arm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 18 Mar 2022 12:52:18 -0700
Message-ID: <CAKwvOdnut8db1Z1FdZkkSXCvmggrzfKv9Y9GO3uz4ND=K5sB3g@mail.gmail.com>
Subject: Re: [PATCH] arm64: fix clang warning about TRAMP_VALIAS
To: Robin Murphy <robin.murphy@arm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Nathan Chancellor <nathan@kernel.org>, James Morse <james.morse@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 18, 2022 at 12:11 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-03-16 18:38, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The newly introduced TRAMP_VALIAS definition causes a build warning
> > with clang-14:
> >
> > arch/arm64/include/asm/vectors.h:66:31: error: arithmetic on a null pointer treated as a cast from integer to pointer is a GNU extension [-Werror,-Wnull-pointer-arithmetic]
>
> Tangentially, all the other GNU extensions we depend on throughout Linux
> are also GNU extensions. Do we know what's special about this one?

My first thought is that -Wnull-pointer-arithmetic should be in the
-Wgnu flag group, such that -Wno-gnu (as set by Kbuild) implies
-Wno-null-pointer-arithmetic.

One issue seems to be that -Wnull-pointer-arithmetic seems to control
at least 2 different checks in clang.

https://godbolt.org/z/hdYYejj3d

So it's likely these two checks should have 2 distinct flags, such
that the warning we're observing can be grouped under -Wgnu.

Filed: https://github.com/llvm/llvm-project/issues/54444

>
> Robin.
>
> >                  return (char *)TRAMP_VALIAS + SZ_2K * slot;
> >
> > Change the addition to something clang does not complain about.
> >
> > Fixes: bd09128d16fa ("arm64: Add percpu vectors for EL1")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >   arch/arm64/include/asm/vectors.h | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > I see this warning on 5.17-rc8, but did not test it on linux-next,
> > which may already have a fix.
> >
> > diff --git a/arch/arm64/include/asm/vectors.h b/arch/arm64/include/asm/vectors.h
> > index f64613a96d53..bc9a2145f419 100644
> > --- a/arch/arm64/include/asm/vectors.h
> > +++ b/arch/arm64/include/asm/vectors.h
> > @@ -56,14 +56,14 @@ enum arm64_bp_harden_el1_vectors {
> >   DECLARE_PER_CPU_READ_MOSTLY(const char *, this_cpu_vector);
> >
> >   #ifndef CONFIG_UNMAP_KERNEL_AT_EL0
> > -#define TRAMP_VALIAS 0
> > +#define TRAMP_VALIAS 0ul
> >   #endif
> >
> >   static inline const char *
> >   arm64_get_bp_hardening_vector(enum arm64_bp_harden_el1_vectors slot)
> >   {
> >       if (arm64_kernel_unmapped_at_el0())
> > -             return (char *)TRAMP_VALIAS + SZ_2K * slot;
> > +             return (char *)(TRAMP_VALIAS + SZ_2K * slot);
> >
> >       WARN_ON_ONCE(slot == EL1_VECTOR_KPTI);
> >



-- 
Thanks,
~Nick Desaulniers
