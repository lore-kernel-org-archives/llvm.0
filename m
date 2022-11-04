Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA278489
	for <llvm@lists.linux.dev>; Fri,  4 Nov 2022 18:07:25 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id q1so4998530pgl.11
        for <llvm@lists.linux.dev>; Fri, 04 Nov 2022 11:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qg78ANf/M2jEd3KO/CDqW7vrKt5orr3ONjK7IQbi6F0=;
        b=UdfwPZjWfNlUJ2FfHGNt3Xf451L2UPrtmjSLgGoyBsuky91bOzKSZhsVAnU9Z9eJyO
         AD5RjWqPfcsEY/ygC57ONT1aNwxa4cA8PnCrdyQQkjN79qNhQMd7jnOdM7LUSL7TJ9qT
         6CW0UGAScq8feTw5SfaaXSmYTNgt7BIdcMF0uLj1kGFsmkVzdEsLrYGf3IT3JiCJh1mV
         6EoPri61DuCkda1kUSvxNUF8XfrVFk4waVhZOiPeWMRARREMktu2oe++JJczU56AffG7
         3g4Qb/JaLeHkbMdBmfTDrTArreBmsZjYAkJ6LHgmueX7diyKqR77ahmiNu8H4/sl8DY9
         AYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qg78ANf/M2jEd3KO/CDqW7vrKt5orr3ONjK7IQbi6F0=;
        b=wNB6HgYC6pO8rWBNzKV3BAhTrRAnpcByIUYRqCMrW7Ig6w1kLCKmK+TM26LAeDwfSJ
         wNgUPTkDEabwoIhNv2eaG0rSSQB123qrXUxh2hpy8SfzPlhtvPOP0qkWzEcBARatwuka
         YKqVUeEqwTfm1P+6wbOZrhQZ91/tq6k0wItnS4CNV3s8xc0rhsYRq9SxdCAArQT15+GA
         s6zbQwvvNsNWvAXI2QEt3uOv2qdwT+1qP/8+qfYwkLOA+PUCEEAssL2H0vX1MXh0Km35
         oZYPGI514iXCQqNMKpRgUGMjRQ5cmgDYyckXobZn8EjxrKERUArIgMS84+oPYeUdod4i
         atJw==
X-Gm-Message-State: ACrzQf3A8evq+R4XtB6LJ5cYrEwB2OrHcBl4nweyA4NdJK0wqCL7i1g6
	niPH2Vj++0v1cpNwFbJHj/ebb+nIiJuKC4PhcXT5jA==
X-Google-Smtp-Source: AMsMyM5PwJ1ZBcYSgFHLKu87CEEV1wah9U9YGFQ3+my8JFfs8yDRx6QkMpj1gRLcPLxD0GIU26MUYd360ifmqqv7Hsc=
X-Received: by 2002:a62:820a:0:b0:56d:2b5f:20dd with SMTP id
 w10-20020a62820a000000b0056d2b5f20ddmr34264216pfd.66.1667585244330; Fri, 04
 Nov 2022 11:07:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221103210748.1343090-1-ndesaulniers@google.com> <94597E96-D4FB-4312-8F8B-473AAC0503F7@zytor.com>
In-Reply-To: <94597E96-D4FB-4312-8F8B-473AAC0503F7@zytor.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 4 Nov 2022 11:07:12 -0700
Message-ID: <CAKwvOdmFTvpdFi08CMbxcnqHEcCTOtgkMWDx6Zyewxnb_pjo_g@mail.gmail.com>
Subject: Re: [PATCH] x86/msr-index: make SPEC_CTRL_IBRS assembler-portable
To: "H. Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Huang Rui <ray.huang@amd.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-team@android.com, Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 4, 2022 at 2:55 AM H. Peter Anvin <hpa@zytor.com> wrote:
>
> On November 3, 2022 2:07:48 PM PDT, Nick Desaulniers <ndesaulniers@google.com> wrote:
> >GNU binutils' assembler (GAS) didn't support L suffixes on immediates
> >until binutils 2.28 release. Building arch/x86/entry/entry_64.S with GAS
> >v2.27 will produce the following assembler errors:
> >
> >  arch/x86/entry/entry_64.S: Assembler messages:
> >  arch/x86/entry/entry_64.S:308: Error: found 'L', expected: ')'
> >  arch/x86/entry/entry_64.S:308: Error: found 'L', expected: ')'
> >  arch/x86/entry/entry_64.S:308: Error: junk `L<<(0)))' after expression
> >  arch/x86/entry/entry_64.S:596: Error: found 'L', expected: ')'
> >  arch/x86/entry/entry_64.S:596: Error: found 'L', expected: ')'
> >  arch/x86/entry/entry_64.S:596: Error: junk `L<<(0)))' after expression
> >
> >These come from the use of the preprocessor defined SPEC_CTRL_IBRS in
> >the IBRS_ENTER and IBRS_EXIT assembler macros. SPEC_CTRL_IBRS was using
> >the BIT macros from include/linux/bits.h which are only portable between
> >C and assembler for assemblers such as GAS v2.28 (or newer) or clang
> >because they use the L suffixes for immediate operands, which older GAS
> >releases cannot parse. The kernel still supports GAS v2.23 and newer
> >(and older for branches of stable). Let's expand the value of
> >SPEC_CTRL_IBRS in place so that assemblers don't have issues parsing the
> >value.
> >
> >Fixes: 2dbb887e875b ("x86/entry: Add kernel IBRS implementation")
> >Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> >---
> >Some other ideas considered:
> >* Use U64_C from include/asm-generic/int-ll64.h rather than BIT for the
> >  value of SPEC_CTRL_IBRS.
> >  * Do so for the entirety of arch/x86/include/asm/msr-index.h or just
> >    SPEC_CTRL_IBRS? include/asm-generic/int-ll64.h doesn't define a UL
> >    suffix; add one?
> >* Make include/linux/bits.h assembler-portable (for older assemblers)
> >  via the use of include/asm-generic/int-ll64.h.
> >
> > arch/x86/include/asm/msr-index.h | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> >index 10ac52705892..0192d853136c 100644
> >--- a/arch/x86/include/asm/msr-index.h
> >+++ b/arch/x86/include/asm/msr-index.h
> >@@ -46,7 +46,7 @@
> > #define MSR_TEST_CTRL_SPLIT_LOCK_DETECT               BIT(MSR_TEST_CTRL_SPLIT_LOCK_DETECT_BIT)
> >
> > #define MSR_IA32_SPEC_CTRL            0x00000048 /* Speculation Control */
> >-#define SPEC_CTRL_IBRS                        BIT(0)     /* Indirect Branch Restricted Speculation */
> >+#define SPEC_CTRL_IBRS                        1          /* Indirect Branch Restricted Speculation */
> > #define SPEC_CTRL_STIBP_SHIFT         1          /* Single Thread Indirect Branch Predictor (STIBP) bit */
> > #define SPEC_CTRL_STIBP                       BIT(SPEC_CTRL_STIBP_SHIFT)      /* STIBP mask */
> > #define SPEC_CTRL_SSBD_SHIFT          2          /* Speculative Store Bypass Disable bit */
>
> Let's fix the macro instead.

Ah, I need to do more homework; this issue is specific to stable
backports of the retbleed mitigations.
commit 95b980d62d52 ("linux/bits.h: make BIT(), GENMASK(), and friends
available in assembly")
fixed this exact problem already.  Ok, I'll work with stable to get
that backported as part of the series.  Sorry for the noise.
-- 
Thanks,
~Nick Desaulniers
