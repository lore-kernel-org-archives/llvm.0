Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5D5ED6
	for <llvm@lists.linux.dev>; Wed,  2 Mar 2022 19:18:21 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id m14so4504891lfu.4
        for <llvm@lists.linux.dev>; Wed, 02 Mar 2022 11:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VeHPbYUmDQhwRvLDR7SEcUbulwlYPwQ9kvkyCVmk6Cw=;
        b=Rz6tM8IHWtmgttApx6BQXB7nieWceAqjNI2q3DfeSvnaQJSxpDT0ODHPnt+x613KVn
         sNrtExKe2lavT0wn5a0zIgIXpCH2KtVD64NdWQ6FYfu/AZDQc03Doz/F9aIOw9GibMYE
         bndEBVlQUsbr3AmnJE01ivzb96YDeKZk3/xbs9wPClplCgN2INNCA7VRfb0lIWcUQTMu
         IhmZ1TjSkUz2MxAaXkP2QHUBhw7PtukHeUuez09hAnjFlppbanVdfKHHi7GM9bIFHuTa
         ZmFkzkQFF8L0u8PePaQ/oHLdEYdscE21liiS64teesMBTmkzOtnzryx7isr1vS8o4BCu
         89tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VeHPbYUmDQhwRvLDR7SEcUbulwlYPwQ9kvkyCVmk6Cw=;
        b=cffXIePJc0GCAQd5avzWzyciA/TNRF5pA1rRytmfqa+1SzuSAAflYoI2vuTpjA7Az+
         /ofqTEiqcgJdt4yCDmQVggOb0s+lqBsFzrN5EKjGLLaVLGSoJLijGp77O8JKaoT3zDQQ
         xPHrkQbJsinUzL6b0Rs2LnqzF9bT+lQllsqhoOHn18sPrJmrtr0sepyLxacXatj5dWoV
         orF4gQW+BbBCWMl6PL15ccvKxMs7DEj/rtFv902tHpclPpM1h3+GJ9E5lhPjBe7G1rxG
         N4cjE5qvFyvYsYOy8kDn720OXvRd/NYtWq0coxskwX3C/YmZAVzd4Q3uhVmBi2+7Ibl1
         XIcg==
X-Gm-Message-State: AOAM530YCx74jC/QClTLiQ96fwdIeiwAtPeKhRyv+S8m5uSEl3WKrSfc
	/CeK/aoQWE3M3jbGbu1+FgTzav3Grk9utjbpKUwCIw==
X-Google-Smtp-Source: ABdhPJzRvLSkr1+M7JPctvNy8x2Fc5YVU61qF2BkXtYbK0MwUxxB/LYCV47mAc7jqfVU0UlWeSGdxXi79ClgbxfgeZU=
X-Received: by 2002:a05:6512:3341:b0:433:b033:bd22 with SMTP id
 y1-20020a056512334100b00433b033bd22mr18699297lfd.190.1646248699637; Wed, 02
 Mar 2022 11:18:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220224145138.952963315@infradead.org> <20220224151322.072632223@infradead.org>
 <CAKwvOdkD2WY=hEHy8_0zs70AGx6LRQwxL5mEZyB30uqpruYJyA@mail.gmail.com> <Yh+dMJsH+ZMPfqwD@thelio-3990X>
In-Reply-To: <Yh+dMJsH+ZMPfqwD@thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 2 Mar 2022 11:18:07 -0800
Message-ID: <CAKwvOdmouBTe5pH3JoP6EEfwNT5=6WvX3oCEZRxO0Dkf38S14w@mail.gmail.com>
Subject: Re: [PATCH v2 01/39] kbuild: Fix clang build
To: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, keescook@chromium.org
Cc: x86@kernel.org, joao@overdrivepizza.com, hjl.tools@gmail.com, 
	jpoimboe@redhat.com, andrew.cooper3@citrix.com, linux-kernel@vger.kernel.org, 
	samitolvanen@google.com, mark.rutland@arm.com, alyssa.milburn@intel.com, 
	mbenes@suse.cz, rostedt@goodmis.org, mhiramat@kernel.org, 
	alexei.starovoitov@gmail.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 2, 2022 at 8:37 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Tue, Mar 01, 2022 at 01:16:04PM -0800, Nick Desaulniers wrote:
> > As per our previous discussion
> > https://lore.kernel.org/linux-kbuild/CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com/
> > I'm still of the opionion that this should be solved by modifications
> > (permanent or one off) to one's $PATH.
>
> However, I think we could still address Peter's complaint of "there
> should be an easier way for me to use the tools that are already in my
> PATH" with his first iteration of this patch [1], which I feel is
> totally reasonable:
>
> $ make LLVM=-14
>
> It is still easy to use (in fact, it is shorter than 'CC=clang-14') and
> it does not change anything else about how we build with LLVM. We would
> just have to add something along the lines of
>
> "If your LLVM tools have a suffix like Debian's (clang-14, ld.lld-14,
> etc.), use LLVM=<suffix>.

"If your LLVM tools have a suffix and you prefer to test an explicit
version rather than the unsuffixed executables ..."

>
> $ make LLVM=-14"
>
> to Documentation/kbuild/llvm.rst.
>
> I might change the patch not to be so clever though:
>
> ifneq ($(LLVM),)
> ifneq ($(LLVM),1)
> LLVM_SFX := $(LLVM)
> endif
> endif
>
> [1]: https://lore.kernel.org/r/YXqpFHeY26sEbort@hirez.programming.kicks-ass.net/

I'd be much more amenable to that approach.
-- 
Thanks,
~Nick Desaulniers
