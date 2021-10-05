Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508DB2C8E
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 21:53:37 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id i84so825199ybc.12
        for <llvm@lists.linux.dev>; Tue, 05 Oct 2021 14:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vlN4jfg0gX2LZZN2w0PrP6x9vQI3f2fSsuMkV8Sa4Xg=;
        b=WxlCMf9yLZ3Uuf2DfAUeuTFIC8NL1nt/7BhNpeBIFVemwl6QReya/4bK0JXGKlCZQR
         3V4RPzA4g7R8Rm2RZjCgCJpQ9wA5YtXHHrs6b/CmzpZMhUO4hb/aXoiL0r5IRTN1FUnc
         2j0rfYw88yjBpXBsUrQgWIe8T3gz2J3MYPz7g8kJa/RxAUY9EMEIcHSGtLgLUDSw5Sl4
         8c1i0A/6foxCPPQupeAx8D4qb+q4lwKMAEnXcdFE2um+MCXJ4rv9VTXgQhdl/Qy8Sp7f
         dm0j5wwFq/sYhKnjktk5j204LvMn5dm5C/Uj4WbWLe7CD4wsOkLiVPyevXIwx+9VstpG
         PwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vlN4jfg0gX2LZZN2w0PrP6x9vQI3f2fSsuMkV8Sa4Xg=;
        b=Jb7f1foaHk80epOSbc+zLRjvye/SbUXKJeaQfcdohODJmSKefciqcPfcG6IuqwZKeQ
         um5QC+JRiO4RIyVVNQNDG+LiTVaacKM0jrv/zgXV/KllEMKylpYybI8NCbGbHjtR9RlU
         Z4ZPsu3tU/aOFzEVPKrHZHawoJ41o6tBhO2C9BOWN5ToiWSfoWjxhiR87DABm9b46Vnx
         4KCr5NU8rswFqVt+RliFnIcMdJe0Mx1bXnBzNiGf+CVQyDDwVAhDp+VMBlzEmOvMCFAW
         16WFw/jn4jzZLCMVB3qck3SgSAUixmTq6Tc1+LTd5+m0Z5OcCKJqk/uA4UHGjAiaycG4
         sl8Q==
X-Gm-Message-State: AOAM532fl1fUQ+VtEBHk+rMev4awLFWVhIYsKMiWPWF3Oep7m/A86WnX
	G2G3CsUjm4FL3EXpmoMw5tDHiMSJGVHAMrEWrc5Rgg==
X-Google-Smtp-Source: ABdhPJxeqlTZhXqga9k43BtCRV6P3IjRNNoQSEkCNn/i7ChYlIrPyZgPSI8OyeePFw8yqlBWHMU6Cd301mHXo+IlWb4=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr26586961ybg.338.1633470816214;
 Tue, 05 Oct 2021 14:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-5-samitolvanen@google.com> <YVsGoJ+NN6wRFi22@hirez.programming.kicks-ass.net>
 <CABCJKudBrHfwR=gQc=9=cfBjR9p5jm65ovSNwzLLEpDUdo6ZPQ@mail.gmail.com>
 <20211005065923.GH4323@worktop.programming.kicks-ass.net> <CABCJKud1Gm0ouROKLAw9t03qbs+_EASky053=SqijPJahqogng@mail.gmail.com>
 <20211005205612.GF174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211005205612.GF174703@worktop.programming.kicks-ass.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 5 Oct 2021 14:53:25 -0700
Message-ID: <CABCJKufUZxDdQziUFG5YzUDjChvy9XOHPxBjUG4GXUw4LCGpkA@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] cfi: Add DEFINE_CFI_IMMEDIATE_RETURN_STUB
To: Peter Zijlstra <peterz@infradead.org>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 5, 2021 at 1:58 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Oct 05, 2021 at 01:29:02PM -0700, Sami Tolvanen wrote:
> > On Mon, Oct 4, 2021 at 11:59 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> > > For x86_64 it should indeed never get called, however if you plan on
> > > supporting i386 then you need the annotation. Also, it might get called
> > > on arm64 which is about to grow basic HAVE_STATIC_CALL support.
> >
> > Good point. I read through the latest arm64 static call proposal and
> > while it can fall back to an indirect call, it doesn't look like that
> > would cause issues with CFI.
>
> Because that call is outside of compiler control?

Correct.

> Same will be true for
> any HAVE_STATIC_CALL implementation I suppose. The trampoline will be
> outside of compiler control.

True, so it shouldn't be a problem.

Sami
