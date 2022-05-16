Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041551361
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 16:33:04 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id v71so2904891ybi.4
        for <llvm@lists.linux.dev>; Mon, 16 May 2022 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uVOWBi2MNBuehei9huBnd/8loFbnwhqAiuOC/hCYUtE=;
        b=UMpVvjAskWnfR6g3ci4cMkPkNEchbPVQCDFZURqGgdGBGtyEU0+pfkHuIEsLxzzdxa
         B18bBKbFeo2JcX6Nz0IkEdagX64XxF2YEDcGnalbPkbzsdXHnZZGaCAZvltIUt8sXuPo
         zc+e8B4SuenU8MISBWZpTrjTRFvYcwbYxq6tk/fA+vLgbNtNdpbpv9n/FFbrhrGyS4/A
         hl891Clm6zzMg1ByvOjCgkYC1CBLqqCMd5UMKl7fYoxLVwfMTVOj3WL8d9fGHLWJxHp1
         HFHt9MPjqwqb5TyctUJdvK/tYMZpC5GtaKZHEttGWXNLnXoDb1+0WTqUO3MYlQIJ76Hw
         42MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uVOWBi2MNBuehei9huBnd/8loFbnwhqAiuOC/hCYUtE=;
        b=0X3OhiHo7fFLJyL6QO/bLZ4q01Ne2xd+kn+LeOjG1LqU9HD4TvZ2VNbWe0zgxUoYl7
         vqvW2UPrVJ7e1m2rjnMPnwW5xhRMQL/VQZthEdqfMhD2XQqmYe3KxcQu7AZDVIWp9fUl
         WciEmZskVZOnz+clEuvG/70TVDcN0rWEmpymypEEtKwp826XGZu0OD+9xP1YiWqgWVNO
         WVGmFhD6q3LU2fAIkhkuo5HS3gx0ZAk/yjJZIclUDeA5xslancoQHtw5J+U0x3QOPzvZ
         Wn9CkLvo6eEM/5aK05geT4p3Uj2D5qjuaX70jmLrHWzqg0JCp3oio/PZxiTWj9xRDQLX
         cKow==
X-Gm-Message-State: AOAM530idtov0cuNZx1u4zxTqRPy7y2a8Bihkv/ex9Mdj6bgwIyQC7y8
	2EuRUAJM1RFaDwjvrns/RBsC56i16KoslpoXRSnsLA==
X-Google-Smtp-Source: ABdhPJxnm0eijYHOVmrixfo245yISpWoVL7JodzT9EqGHwvEuWoWte/Watn8vMd89vUvUVL2y2IhRQzqqpGLJpOURZA=
X-Received: by 2002:a05:6902:90b:b0:64b:233d:8e03 with SMTP id
 bu11-20020a056902090b00b0064b233d8e03mr18090305ybb.428.1652718783727; Mon, 16
 May 2022 09:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220513202159.1550547-1-samitolvanen@google.com>
 <20220513202159.1550547-15-samitolvanen@google.com> <202205141455.0A6F409@keescook>
In-Reply-To: <202205141455.0A6F409@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 16 May 2022 09:32:27 -0700
Message-ID: <CABCJKudyuB3doGwcRpYNm-LrdEzjgwR3MTys3MmSs+vMkxhsPg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 14/21] treewide: Drop __cficanonical
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Josh Poimboeuf <jpoimboe@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, x86@kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Joao Moreira <joao@overdrivepizza.com>, 
	Sedat Dilek <sedat.dilek@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, May 14, 2022 at 2:56 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, May 13, 2022 at 01:21:52PM -0700, Sami Tolvanen wrote:
> > CONFIG_CFI_CLANG doesn't use a jump table anymore and therefore,
> > won't change function references to point elsewhere. Remove the
> > __cficanonical attribute and all uses of it.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  include/linux/compiler_types.h | 4 ----
> >  include/linux/init.h           | 4 ++--
> >  include/linux/pci.h            | 4 ++--
> >  3 files changed, 4 insertions(+), 8 deletions(-)
>
> I think this is missing removing it from include/linux/compiler-clang.h ?

That was removed in the earlier patch that switched the CFI implementation.

> With that done (or explained why not):

I'll add a note about it to the commit message.

Sami
