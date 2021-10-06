Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4FD2C8E
	for <llvm@lists.linux.dev>; Wed,  6 Oct 2021 16:31:16 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id s64so6706309yba.11
        for <llvm@lists.linux.dev>; Wed, 06 Oct 2021 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E1N3Etrc+IvlHyTpW7XkflFyYfrFk6rq2AqHGQBELZI=;
        b=do0VsLfLI2lEtXGQ1eVW8WxUCz+l5Lk4ygQl5n1FOf2jF3PCNgZ1wMObNtiIbTcf+e
         B40CeDdtVeIMVjl5dzsNcPlaZ6m8HdwJNLaxvu6gQobCuQXyqqQ+Kk5M3vK321l/ESD1
         KIaCA/RM8+7OKe5KEHOXwRIoWauGyx25EptJHukJY5bPGQbVjCCkM6WNZ4M6YAIut9Z6
         jPiwx0xBNmxc4GmTvsqedBpLvzX1bYX4USqwZhelY13DEIRDd8pbNfnQYAH3T2oHjQSK
         ocZ26P/QWYFDW5HzWK9VG1wwJ9ZymgHn+DPb973yudIMMSdYI5fUK50mwFWdPk9zAuu+
         VDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E1N3Etrc+IvlHyTpW7XkflFyYfrFk6rq2AqHGQBELZI=;
        b=51BLO4VAbCd31EjkSFbcmmBjNbG+6W6n69XvfMZDrmaBoybVceJ4VohW1Xm5YajtMW
         0Ub3yqHl/LGQtFjnKa6yf3Cnv62MqiC4BBw9Ia/BzcPAx2rCK48+N6ZUUpW76ysDibHo
         P/+1V4AyqNTRzD9/UnCAOotavsLNhWWy8vDBYWnSwBD8u3AAPBa7RclYj9x2X6f85EZK
         7ARNmpxwph8SzARoN8ncVzGgzDNBsi0j/x14wpmvt0qt6U9e/HrHElEAuIjJ0gMlGy6O
         o8DFmncVHlWPU414d+8cFjwlZfdhLhY/+qor1IEhiUGi8PSCM567jJwQyUYY1iJzOxFE
         3jWg==
X-Gm-Message-State: AOAM53047j41IuWjGSP14xef9soRHAtVcaN+agHh2xheYA6UxB8Xm5t/
	f5tOIcXkJUkKvcSkVgpwkm7EkDK3OVCGunoyJSN/vw==
X-Google-Smtp-Source: ABdhPJy8ZvP2+QO+CLs1N3WqFjTvJStSsRb5E6N64u3z88hwpMV+U4CySxFZZ2HW0mgzuvjTeBsNSu/GKHKGulEh6FM=
X-Received: by 2002:a25:aaec:: with SMTP id t99mr30955841ybi.456.1633537875696;
 Wed, 06 Oct 2021 09:31:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-7-samitolvanen@google.com> <20211006032945.axlqh3vehgar6adr@treble>
 <20211006090249.248c65b0@gandalf.local.home>
In-Reply-To: <20211006090249.248c65b0@gandalf.local.home>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 6 Oct 2021 09:31:04 -0700
Message-ID: <CABCJKueL4Ebaan=JBUyO3oewq7RTHHXWUQpixgf2AfC_r5T3uA@mail.gmail.com>
Subject: Re: [PATCH v4 06/15] ftrace: Use an opaque type for functions not
 callable from C
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Josh Poimboeuf <jpoimboe@redhat.com>, X86 ML <x86@kernel.org>, 
	Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-hardening@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 6, 2021 at 6:02 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 5 Oct 2021 20:29:45 -0700
> Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> Thanks for Cc'ing me, as I should have been Cc'd on the original patch.

Sorry about that. I'll make sure you're cc'd on the next version.

> > On Thu, Sep 30, 2021 at 11:05:22AM -0700, Sami Tolvanen wrote:
> > > With CONFIG_CFI_CLANG, the compiler changes function references to point
> > > to the CFI jump table. As ftrace_call, ftrace_regs_call, and mcount_call
> > > are not called from C, use DECLARE_ASM_FUNC_SYMBOL to declare them.
>
> "not called from C" is a bit confusing.

Any thoughts on how to make this less confusing?

Sami
