Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F8823FC1
	for <llvm@lists.linux.dev>; Sat,  4 Sep 2021 17:22:45 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id j12so3814252ljg.10
        for <llvm@lists.linux.dev>; Sat, 04 Sep 2021 10:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98jOqbKpX72E4sPthsn4i3f66mKPjIJDIcd25lirePI=;
        b=eG78AXkrvMPYFu6Gt5/vrTdbimFDR9TXxplLlMw1nHmpyJUrQcTh/9wCJeHztK4N/O
         YH6b6mzsWGz7vhhhzfSL8IebU3Rub4K0pwZno/LNvT//BotGevQQBUiOT3pV0qZM6otl
         SWBcPAB7k8Xg5RezMwEmNMsTPJcn+HxEyK5cw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98jOqbKpX72E4sPthsn4i3f66mKPjIJDIcd25lirePI=;
        b=cCwmALj6Y4s5znQOHmpvL0opb9dW86W/nkvePN2N5bTeI9plBL8zgbauKm1aGwx7Au
         +AsNq4sqG09our247mKSvIPVQUetYt2K1j13cs6D98uBII1+rvRc68NqHTjcd3vYx418
         3hoeXRl8xlv2EVxUkvfdMUiJ8no1VOk8cu4Gmohwr5MEtK1O5GFp30SRc8EoXV3C7taC
         f0ljaQhGslKnNvAzLYlEMmvwi1iUavRkuMAdOz8r4GmVdYEh4JKWuU1aS3TdvsO9hw45
         NzIuEyoYe36SUMzAQo3Sp3lXmARwHld7QVFh2dCYOLg0FkDY2u6PK5F8Fc+w/sCZ/u/o
         DB2A==
X-Gm-Message-State: AOAM533EOwyW4/+C3s0EvxMaQGbSnyRnP0gfM5qlhvVRzvutPJYpV8qy
	yirNk93QZ1tKXbos69+tTZArJvvR8SMJFZQ4
X-Google-Smtp-Source: ABdhPJw9yyByR50IY0hb7VHh7vWbI8GRNTi9tToI0V89KfeKm0UxtaiMJJT5rIq+YevHD/tyKBZVmw==
X-Received: by 2002:a2e:bb8f:: with SMTP id y15mr3613397lje.148.1630776162988;
        Sat, 04 Sep 2021 10:22:42 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id u17sm304779ljk.124.2021.09.04.10.22.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Sep 2021 10:22:42 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id y6so3853979lje.2
        for <llvm@lists.linux.dev>; Sat, 04 Sep 2021 10:22:41 -0700 (PDT)
X-Received: by 2002:a2e:a363:: with SMTP id i3mr3513230ljn.56.1630776161685;
 Sat, 04 Sep 2021 10:22:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
 <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com>
 <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com>
 <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com>
In-Reply-To: <871r644bd2.fsf@oldenburg.str.redhat.com>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Sat, 4 Sep 2021 10:22:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
Message-ID: <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
To: Florian Weimer <fweimer@redhat.com>
Cc: Segher Boessenkool <segher@kernel.crashing.org>, Nathan Chancellor <nathan@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	clang-built-linux <clang-built-linux@googlegroups.com>, llvm@lists.linux.dev, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 4, 2021 at 8:19 AM Florian Weimer <fweimer@redhat.com> wrote:
>
> In any case, it would be nice to know what the real motivation is.

I don't know about the original motivation, but the reason I like that
patch after-the-fact is that I've actually been in situations where I
test out self-built compilers without installing them.

Then it's convenient to have a completely standalone kernel tree.

Nobody cares about things like <stdatomic.h> They are completely
irrelevant for the kernel, exactly because we've always just done our
own, or used __builtin_xyz() for things.

<stdarg.h> is the only actual core header file that we have always
taken from the installed system headers - because historically it
really was required. Everything else we can just do ourselves.

                 Linus
