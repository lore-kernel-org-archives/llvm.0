Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191597E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 06:00:20 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c131-20020a1c3589000000b003a84b160addso10395159wma.2
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 23:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=EVRMZUvSq6xdhiNGVwAMQ7WuOP9ljPbQMnIekWicfSw=;
        b=N5bYCEfkkrWyuEJPBnbTK/P4VF0qrJCydMxRgw41WsKreSUINlmQeNsJ/YPB5bBIFK
         SsQpepIKHI/EMjLdctJZb50mtWece3w2MYGIzGroJVKn/KYLRj2sZa7XEFWeOxkWj1bj
         7Xs/uYI8e4ObXhXJCLOc+IJG14T1N5SQM51tpw6CPYpEmTkd61bi5O06qN49dj0eC1bT
         IOr8MYSainsRvm7SpOLbsjDYPGs+bIDh4CwMiO9btuTPQzdr+1M6f2h0/BgtlBGwljRL
         es56etYDfYgVvxz4cr0R370WFJYutF+T50asjfOODsInyZBTG/LasVBGYcqd5mr29Wck
         eicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=EVRMZUvSq6xdhiNGVwAMQ7WuOP9ljPbQMnIekWicfSw=;
        b=Pbg5mVwpHmjsRML/RtyeQXtRy/ux9cDuTIQimtIQift3YWFtkdeuqMoKrYkjN78KIA
         vRey07kzzP+Bb5BRNkWdg4gOHEZkYVskUTsLZaOZSv7/4nbPL5BUSp4S+NDb+U2Km5OJ
         yac92/tTQknN2y/wjNeh1CcCsVakdndnLOWHu6L9ZJuPVZtLUnEm4YPtsOql5SfClX9Y
         ToZ148HQ3o96UkJX/F+yfif1/OnhACyR8INLF91D2SbmSxZp3mRdMvVDig1nr+0SqDMq
         q/5xtEYud/cXYF9/x16SNgPpn6cIMzYW+OcXbQshvZ7ib/QKnQ1M6N7e8INxC18IDz3Y
         UNCA==
X-Gm-Message-State: ACgBeo18fEDRrjFVr+V9TWQm7TQCEavkt278Lh0bQ0ao+FIG0Q5kLyOo
	LYOX/GE5nPJMkNjUb8nCirnGyl9pPSTOSRphNutZuQ==
X-Google-Smtp-Source: AA6agR6B3gQeycz+50jNE1EjqvKOK6DVZ6AZkhyR7V48tJgKgBWRV2R4ljnfmvXEtAbxKaCEOo921MMA+cgAFlUvbqE=
X-Received: by 2002:a05:600c:4ca3:b0:3a6:1616:e591 with SMTP id
 g35-20020a05600c4ca300b003a61616e591mr862526wmp.99.1662530419174; Tue, 06 Sep
 2022 23:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220902213750.1124421-1-morbo@google.com> <20220902213750.1124421-3-morbo@google.com>
 <202209022251.B14BD50B29@keescook> <CAGG=3QXpK+bFOSYZkdNNFGzNfgJSSADGTRWYRv6z0vfBAgQvWQ@mail.gmail.com>
In-Reply-To: <CAGG=3QXpK+bFOSYZkdNNFGzNfgJSSADGTRWYRv6z0vfBAgQvWQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 6 Sep 2022 23:00:07 -0700
Message-ID: <CAKwvOdm+kVTrqMrSPHwTa0NrG9qwTcFkGnikjYjk0ctFGBfeRA@mail.gmail.com>
Subject: Re: [PATCH 2/2] x86/paravirt: add extra clobbers with
 ZERO_CALL_USED_REGS enabled
To: Bill Wendling <morbo@google.com>
Cc: Kees Cook <keescook@chromium.org>, Juergen Gross <jgross@suse.com>, 
	"Srivatsa S. Bhat (VMware)" <srivatsa@csail.mit.edu>, Alexey Makhalov <amakhalov@vmware.com>, 
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, 
	virtualization@lists.linux-foundation.org, 
	LKML <linux-kernel@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 4, 2022 at 11:02 PM Bill Wendling <morbo@google.com> wrote:
>
> On Sat, Sep 3, 2022 at 12:18 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Fri, Sep 02, 2022 at 09:37:50PM +0000, Bill Wendling wrote:
> > > [...]
> > >         callq   *pv_ops+536(%rip)
> >
> > Do you know which pv_ops function is this? I can't figure out where
> > pte_offset_kernel() gets converted into a pv_ops call....
> >
> This one is _paravirt_ident_64, I believe. I think that the original
> issue Nathan was seeing was with another seemingly innocuous function.

_paravirt_ident_64 is marked noinstr, which makes me suspect that it
really needs to not be touched at all by the compiler for
these...special features.

Maybe the definition of noinstr in include/linux/compiler_types.h
should be adding __attribute__((zero_call_used_regs(skip)))?

Untested:

```
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.h
index 4f2a819fd60a..a51ab77e2da8 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -226,10 +226,17 @@ struct ftrace_likely_data {
 #define __no_sanitize_or_inline __always_inline
 #endif

+#ifdef CONFIG_ZERO_CALL_USED_REGS
+#define __no_zero_call_used_regs __attribute__((__zero_call_used_reg__(skip)))
+#else
+#define __no_zero_call_used_regs
+#endif
+
 /* Section for code which can't be instrumented at all */
 #define noinstr
         \
        noinline notrace __attribute((__section__(".noinstr.text")))    \
-       __no_kcsan __no_sanitize_address __no_profile __no_sanitize_coverage
+       __no_kcsan __no_sanitize_address __no_profile                   \
+       __no_sanitize_coverage __no_zero_call_used_regs

 #endif /* __KERNEL__ */
```
Or use __has_attribute in include/linux/compiler_attributes.h.
-- 
Thanks,
~Nick Desaulniers
