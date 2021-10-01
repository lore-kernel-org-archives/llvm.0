Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2ED3FDF
	for <llvm@lists.linux.dev>; Fri,  1 Oct 2021 20:07:37 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id h2so22879289ybi.13
        for <llvm@lists.linux.dev>; Fri, 01 Oct 2021 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MBLk927GvcqTts5ZXZsY0rNBa9CfWPtALtUWhvHfD0k=;
        b=jzDkGY/oX2BBlbsmSp5ApGvUVFq1EwemTnlAP/JY1bhAKaYvEKP92awpcx+vVt69v2
         Y0DySpaUPc8oEE1NYy5inzTKlur3eiTGIb8ToCdVedhHm9BX9Y3zzAsPPeRttaPBffLd
         Qrd5bgUhkmVOfgL+m7ksNSUdp96fSPRgrOotVPJBbnBO7fTgnADEOzcCVDWTy/dl2kLY
         7KtLtNzV6m2ae9NVXUDI33AH/tCIfDiL/Fg6jIbZaxzBT43CoxIN+738DFfkd0PrwNhk
         J4X1Zv4vZMYZnt0FFmeRWuwmfPm0+y06SbPc1joBKUPxYWGlD5o4JPwqqiuNOqOCRJfA
         FtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MBLk927GvcqTts5ZXZsY0rNBa9CfWPtALtUWhvHfD0k=;
        b=IC3ENjz7OsDRr71Gu7z4aI50PPiabGITClrKLPXFPGvzhDk/dyeXsFTjAMSYZUiR1/
         U4suE7i/AVAxDi9muwz6iSqle/RxcY3S955qvmCczAjlB5SioV4lUx10lnXqNIE2kWRi
         ZdRRLRgZVQCxoe24ODqzbecYpArVa8ylS4I8rM3eT8JQIQapMiU30rjb5vxKsW1/bGfu
         QxejdjCjeTZH9wjKfGRrFVh90HogCJp8s//etcZXxb354HQZ8luXlUdRIhM5SJLrd5VE
         IDfNkbR51YuMZUN0bscIKONMwwp/XamkbJWnshUdiS4dU4a3umpszS4m0zRPXC4NT6rC
         drAQ==
X-Gm-Message-State: AOAM5302DJ9goP1hbzxVYvJJefw1Xk36HYNQOv9kgeVTk7vYad04HrQD
	UmbDcQ7bDNjHu3ex/ep1kf5nFsMlgASc8/qT4YdCHg==
X-Google-Smtp-Source: ABdhPJyK8IpoknA+mSXQjbTAdDI7HXLYzQ/Vxv87fIjV5+NKCMojAZ1h7strK2gksLcLdbV5IDywivxRQ3NyA/yW9NA=
X-Received: by 2002:a25:e6d0:: with SMTP id d199mr8201002ybh.527.1633118855954;
 Fri, 01 Oct 2021 13:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210930180531.1190642-1-samitolvanen@google.com>
 <20210930180531.1190642-5-samitolvanen@google.com> <CAKwvOdnN-5PBnegEpb4eq3uPWezmAO6Zrvy3O7zyCNEBFvYt4A@mail.gmail.com>
In-Reply-To: <CAKwvOdnN-5PBnegEpb4eq3uPWezmAO6Zrvy3O7zyCNEBFvYt4A@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Fri, 1 Oct 2021 13:07:24 -0700
Message-ID: <CABCJKucX-FWcsaCt2TCY+2Y+GrKb5EKFFFsGWN8mbgZTTy8nNg@mail.gmail.com>
Subject: Re: [PATCH v4 04/15] cfi: Add DEFINE_CFI_IMMEDIATE_RETURN_STUB
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: X86 ML <x86@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Josh Poimboeuf <jpoimboe@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 30, 2021 at 11:50 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Sep 30, 2021 at 11:05 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > This change introduces the DEFINE_CFI_IMMEDIATE_RETURN_STUB macro,
> > which defines a stub function that immediately returns and when
> > defined in the core kernel, always passes indirect call checking
> > with CONFIG_CFI_CLANG. Note that this macro should only be used when
> > a stub cannot be called using the correct function type.
>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> Seems like the only use is in patch 5/15. Probably could be squashed...

I would prefer to keep these separate, but if everyone thinks that's
unnecessary, I'm happy to combine them.

Sami
