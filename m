Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F6372
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 21:24:59 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id p15so13247783ljn.3
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 14:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bOYkPNs6kBoQRrkZjo5EV/GM+dOfmzNF/MWgTdiF+c0=;
        b=MkdrdbxR65lqXV6wJ76/tFuL8QFam88AtYhA62tPAFEBbcHMyPy2haH+G7bq4zt8uf
         REzVQUd74s4JolJRn/LNNZongzDJAYYklBtf0kLdPjPBrHUnv5eSWvqP1WD0VeTKi9ce
         6WQQIA8wPCjNjMPZ7rtqv0bOQhEIJWtKwcdxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bOYkPNs6kBoQRrkZjo5EV/GM+dOfmzNF/MWgTdiF+c0=;
        b=OPe5P6YvYnmQJmmVRRgpvzMUlEqDHT2HuX7A1O5Kw2MBAYqP4ghod6wkzGBYGcP5TY
         xWL1JaMp+clnv7wmmDYK7JybMfPeJ9EwU8F6eI6LbuO8su2/IC0eaPTO4EiaeHe1rnW+
         4yVEAQ5ylQUuE4fkX541pj92iON84vRBgCfQ6EwWPSMQDdpPguIcgG5FZi3LNlqj/7Kk
         9HRbaaA64mXgxesJSneFAQzMCcj3wtfLSPJ91ArVbkUrmLSf/bAgXZuFns4w/L1SjM+r
         dpbdEdiAguEVHsd7LL/bjoHRS4Di4WOG1ElIIBvX5GXAK7PPRSmb6vAHaiFVk9m8CXGX
         m2Yg==
X-Gm-Message-State: AOAM531LVPk+t3ddzB7kx/c+TRj+QsletrBj2p+kJsTbqdVcujIK37cm
	swuRqhQK4WQO2WMBEJIYrKfNG7QI7JIB6cOO
X-Google-Smtp-Source: ABdhPJxdyMWbZ3o9QbYECUL8+C8c5xZjbX31qsZQBc0lepLNixsHwgj6gxECCKdOjsWE/Ug5gumJVA==
X-Received: by 2002:a2e:6d12:: with SMTP id i18mr11996953ljc.102.1630963496732;
        Mon, 06 Sep 2021 14:24:56 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 203sm1245341ljf.63.2021.09.06.14.24.55
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 14:24:56 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id q21so13202982ljj.6
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 14:24:55 -0700 (PDT)
X-Received: by 2002:a2e:b53a:: with SMTP id z26mr11643568ljm.95.1630963495713;
 Mon, 06 Sep 2021 14:24:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <871r644bd2.fsf@oldenburg.str.redhat.com> <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
 <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com>
 <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
 <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com>
 <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org>
 <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
In-Reply-To: <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Mon, 6 Sep 2021 14:24:39 -0700
X-Gmail-Original-Message-ID: <CAHk-=wikLP4KbTUUY_OKL6doyztjqFNKu_Q713vcrkjthc4S0g@mail.gmail.com>
Message-ID: <CAHk-=wikLP4KbTUUY_OKL6doyztjqFNKu_Q713vcrkjthc4S0g@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To: Jakub Jelinek <jakub@redhat.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Florian Weimer <fweimer@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 6, 2021 at 2:08 PM Linus Torvalds
<torvalds@linuxfoundation.org> wrote:
>
> And you think that we're making it harder for compiler people, but
> that's not at all the case.
>
> You really don't want to deal with us saying "you can't do that" when
> you do something that is

That got cut short when I went off to adding the examples of errors
that happen for those intrinsics headers.

But it was supposed to be "when you do something that is not valid in
the kernel".

There are some *very* core header files that the kernel cannot include
from outside. That "stdlib.h" thing already came up in the errors I
quoted.

But I think you'll find that you guys want to include things like
<errno.h> too, and you'll probably add others (<types.h>? things like
that) simply because they always work fine in user space, and you'd
not even notice.

Header file include chains get messy very quickly, and very easily.

I'm pretty sure you guys don't really want to deal with the pain that
is crazy kernel people that have their very bare environment.

So you may *think* you want the kernel to use your header files
"because compiler portability". Instead, you should be very thankful
that we don't, and that you don't have to deal with our mess any more
than you already do.

          Linus
