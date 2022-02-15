Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AC97C
	for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 19:42:16 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id e17so61390ljk.5
        for <llvm@lists.linux.dev>; Tue, 15 Feb 2022 11:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=scBaLfaGLWYYxtrlYU1JbIy2UJbbECdZygDHVPbgRRk=;
        b=lJP1yVdHufaCOzEkkjwdzlhxcctxP39rYiSDo8a2MXhB+GgPvhgLw6MCHYH5T5t/FQ
         nSpEnu9AuwpaiPiMgurzncCC3pIY50Fi/JoIzF71JmdI/CidTfrdaU+afI49C2/z/4we
         YnGAyB1qCVxghAFklVWc/ZYuUMF2Z3ATE/ENZqt1LKRrVZfmyMQuwGD2MSyFKI6Zo7gm
         Tsk61FxSAYjYAkDX31UTXa4uG+wyyh5QqcCdsgVR3zst/tkoYtVgN+33IDZLfTwBYBFb
         YHXOYNoumFJw50NPD1yysElaq4kVymT98hLvV4fLbfweVhc2S/NE2TER+lDvYSvPeqZo
         mohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=scBaLfaGLWYYxtrlYU1JbIy2UJbbECdZygDHVPbgRRk=;
        b=YLqcRDszwKrQkr5gbKqVQgTENP2hmAYJTze7PJZbDykByGFGNLr+F5sUScXkaqtDCs
         /r+w0grZgcS5pxb2RhFqFaUmMKO+DNqqnqL+WuYJmLr78jS+zkratbQTB/gfOUVfxY4S
         e3gZynQ/S4uS+ILZm0izSHxL3WVvve2+EbwSKijcugAh2bcF5HebcoKaJHf51n/ax1En
         sK1SxL9xNUKv91vYtqxtPUma71uW4TK4Fya0DUOv+EJf8fiFVKtdtZCNiTIlohtO9AlE
         RVrzPnQBr1XpD9S4CvomLYr1NpALgj3siJH4jF/UP0TJHC+weF+lSKCMUIWAujgYgfV8
         d6sQ==
X-Gm-Message-State: AOAM532EYGcGRQ6Goe1LgmYLcrks3JJqGYWXgAG5dErcl0vZQT9WNrjp
	BO3zHjy91VLVZp7wKU+90PFbtVK+aqezgPuz1ahzSA==
X-Google-Smtp-Source: ABdhPJzfSSA3stmYRDtGVr8aeAPeZeLZIDE3WmXVsx/LCmKZBtGQxbOB8RdUyWAPezYun7pq/C1CNTW4pBuvRhLj2Hg=
X-Received: by 2002:a05:651c:2121:: with SMTP id a33mr426220ljq.220.1644954134959;
 Tue, 15 Feb 2022 11:42:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220214175138.2902947-1-trix@redhat.com> <daabe69d3863caa62f7874a472edbf2bc892d99e.camel@codeconstruct.com.au>
 <6590666e-524d-51c3-0859-f8bf0c43c5ca@redhat.com>
In-Reply-To: <6590666e-524d-51c3-0859-f8bf0c43c5ca@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 15 Feb 2022 11:42:03 -0800
Message-ID: <CAKwvOd=ntKk7PwtYKWCV_44nf9ccCVDKiGJk_wB4yqfvPFDUbw@mail.gmail.com>
Subject: Re: [PATCH] mctp: fix use after free
To: Tom Rix <trix@redhat.com>, Jeremy Kerr <jk@codeconstruct.com.au>
Cc: matt@codeconstruct.com.au, davem@davemloft.net, kuba@kernel.org, 
	nathan@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 14, 2022 at 6:16 PM Tom Rix <trix@redhat.com> wrote:
>
>
> On 2/14/22 4:44 PM, Jeremy Kerr wrote:
> > Hi Tom,
> >
> > Also, can you share how you're doing the clang static analysis there?
> > I'll get that included in my checks too.
>
> build clang, then use it
>
> scan-build \
>      --use-cc=clang \
>      make CC=clang

I'm pretty sure we have a make target in Kbuild, too. It uses
clang-tidy as the driver, as clang-tidy can do BOTH the static
analyses AND clang-tidy checks.

$ make LLVM=1 all clang-analyzer

>
> There are a couple of configs that aren't happy with clang, these you
> can sed away with
>
> sed -e 's/CONFIG_FRAME_WARN=2048/CONFIG_FRAME_WARN=0/;
> s/CONFIG_RETPOLINE=y/CONFIG_RETPOLINE=n/;
> s/CONFIG_READABLE_ASM=y/CONFIG_READABLE_ASM=n/;
> s/CONFIG_FORTIFY_SOURCE=y/CONFIG_FORTIFY_SOURCE=n/'
>
> I am using clang 14

-- 
Thanks,
~Nick Desaulniers
