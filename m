Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029C7A
	for <llvm@lists.linux.dev>; Tue, 31 May 2022 20:55:50 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-30c2f288f13so78591547b3.7
        for <llvm@lists.linux.dev>; Tue, 31 May 2022 13:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n0erMVA2WLxTnlrSBdIrVdtNSrXGOBg+9JqlB+pB8OI=;
        b=Hxx7j/A8m31TgFbVzraeVQLkmGp1R3N65ku/+Mo1VayfP7QOiMBD+Q/xPjg8gC4bVA
         Jge8obmljL51sJAaYF7hcYWToYBCdLzYVx438YdCYWoWfUanfv57BTTt5PIxsRm55Tep
         HhIsCwONlvBxa4J9CvqlRMtoEB2/f1Hdh4FMvvfauVrrIekTR/uTSxRrNeKTyFxC/0Wc
         kmxZlOJn80yA6ovOO5vY/zsQq/9gyFQUqcYWkgQCMtlC+hkW4PPaSoGwhwpdONxBZ2od
         PKpIiRwbt1w3Bu7UBf43dHqgICbwz+TL5rtJaYqlTlagSixAyr/fVLxKN+VAjK7KGW8P
         DnIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n0erMVA2WLxTnlrSBdIrVdtNSrXGOBg+9JqlB+pB8OI=;
        b=LGIFph/Ig6RwLfFm+Fy9UV1GCvk7sZy0t1mXYAhM6weV51up/kzB/GfgV1aZ5qVxD3
         GG3S9e4LVrquDTdo/c6prMcLJS02tDu0A9jQnVs/3TCAO3XO6U2wHmLnIQRdUOjwaSHd
         JW7L248gMgPOgYBMiURV8CAgJKu6TwTlypozu9cSxwVcjMBZPIi/vfWY+Nc4aH40yAGT
         JbFpP40Hzo5sr2hzF+nZnjvF5akbSGbGmpGjgbKV/LD+ztscX5HWLThl7p39MX6Zklba
         x88/RaXtgax1eRKEH11UHttArgRT3A8Lg+Gfy/vG+i1n1uafDduLuKn1uMvQkATcSYJd
         XTvg==
X-Gm-Message-State: AOAM533yf6ejT/qGeRZOGNUsXza93pHsLfhzEMiDLvzFz8OdvzpkGBi2
	jaGju3ItNKfM/fOX/5FAYvqxa+cA/Gki3u1Y+/qFcA==
X-Google-Smtp-Source: ABdhPJx0gO36aoJo+lIPrMYGfkoCjPcQotCjzgydI2LcD1yt1cMmnDPIEvKTVODPjaZ07o9ZrB+D0PX7D0hXZ2QdAPw=
X-Received: by 2002:a81:1e14:0:b0:2f8:c348:9c62 with SMTP id
 e20-20020a811e14000000b002f8c3489c62mr65829007ywe.291.1654030549041; Tue, 31
 May 2022 13:55:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220531175910.890307-1-samitolvanen@google.com> <202205311231.C26F6E4E@keescook>
In-Reply-To: <202205311231.C26F6E4E@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 31 May 2022 13:55:13 -0700
Message-ID: <CABCJKufAo8QoKcxa3oEgjpaLWx3+KmdMCJK0U02=H9L9snAHUQ@mail.gmail.com>
Subject: Re: [PATCH] cfi: Fix __cfi_slowpath_diag RCU usage with cpuidle
To: Kees Cook <keescook@chromium.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, May 31, 2022 at 12:33 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, May 31, 2022 at 10:59:10AM -0700, Sami Tolvanen wrote:
> > RCU_NONIDLE usage during __cfi_slowpath_diag can result in an invalid
> > RCU state in the cpuidle code path:
> >
> >   WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:613 rcu_eqs_enter+0xe4/0x138
> >   ...
> >   Call trace:
> >     rcu_eqs_enter+0xe4/0x138
> >     rcu_idle_enter+0xa8/0x100
> >     cpuidle_enter_state+0x154/0x3a8
> >     cpuidle_enter+0x3c/0x58
> >     do_idle.llvm.6590768638138871020+0x1f4/0x2ec
> >     cpu_startup_entry+0x28/0x2c
> >     secondary_start_kernel+0x1b8/0x220
> >     __secondary_switched+0x94/0x98
> >
> > Instead, call rcu_irq_enter/exit to wake up RCU only when needed and
> > disable interrupts for the entire CFI shadow/module check when we do.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  kernel/cfi.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/kernel/cfi.c b/kernel/cfi.c
> > index 9594cfd1cf2c..08102d19ec15 100644
> > --- a/kernel/cfi.c
> > +++ b/kernel/cfi.c
> > @@ -281,6 +281,8 @@ static inline cfi_check_fn find_module_check_fn(unsigned long ptr)
> >  static inline cfi_check_fn find_check_fn(unsigned long ptr)
> >  {
> >       cfi_check_fn fn = NULL;
> > +     unsigned long flags;
> > +     bool rcu_idle;
> >
> >       if (is_kernel_text(ptr))
> >               return __cfi_check;
> > @@ -290,13 +292,21 @@ static inline cfi_check_fn find_check_fn(unsigned long ptr)
> >        * the shadow and __module_address use RCU, so we need to wake it
> >        * up if necessary.
> >        */
> > -     RCU_NONIDLE({
> > -             if (IS_ENABLED(CONFIG_CFI_CLANG_SHADOW))
> > -                     fn = find_shadow_check_fn(ptr);
> > +     rcu_idle = !rcu_is_watching();
> > +     if (rcu_idle) {
> > +             local_irq_save(flags);
> > +             rcu_irq_enter();
> > +     }
> > +
> > +     if (IS_ENABLED(CONFIG_CFI_CLANG_SHADOW))
> > +             fn = find_shadow_check_fn(ptr);
> > +     if (!fn)
> > +             fn = find_module_check_fn(ptr);
> >
> > -             if (!fn)
> > -                     fn = find_module_check_fn(ptr);
> > -     });
> > +     if (rcu_idle) {
> > +             rcu_irq_exit();
> > +             local_irq_restore(flags);
> > +     }
> >
> >       return fn;
> >  }
> > --
> > 2.36.1.255.ge46751e96f-goog
> >
>
> Thanks for the fix! It looks like these tags could be added, yes?
>
> Fixes: cf68fffb66d6 ("add support for Clang CFI")
> Cc: stable@vger.kernel.org

Yes, agreed.

> Also, to improve the commit log, under what situation was this problem
> encountered?

On affected devices, this warning is triggered at boot.

Sami
