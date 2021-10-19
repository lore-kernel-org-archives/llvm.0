Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9A2C94
	for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 19:01:53 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id j8so19457036ila.11
        for <llvm@lists.linux.dev>; Tue, 19 Oct 2021 12:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WobMCGHbd5iE8RXCKMYU25vcm8PDvkdc5bc8OyqVW5s=;
        b=iGJ44RcAwe0LUv+MQxo6HEWoTqk4jJySctYq88Z7zREHp9rezPalo4koU/wfR0C/Nv
         0H9hRpvy/FRxEyXFQmTb2d0rfQFmdkiEGj0fFm+VaXmfNZecNaOD0pFRZgLBtXAYnSJ4
         rVKh45jNrKu9Riy2IwY0gFX3torYsWGp1aJD3FToIErNBIYpEfo3um5mICrtHgKmVdPV
         C79pD493xMQAaGyveiZb3Ny2i13GmwOZ3bJLdlC3WhQjm4KTfp7rfbnfVV6t0iJGJLUr
         27X3iMpoc8TAHrssN1rNTi/rcM+ZLQPv5N9q6GgnA05AvT9x54XmTYY1wu/T2ZwM/E29
         hV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WobMCGHbd5iE8RXCKMYU25vcm8PDvkdc5bc8OyqVW5s=;
        b=PVeRFLxzYhPq1+9OCUMH2WIj/DYejvw1wT3eeikxi0LQ8elN98OUnMASadTPsnwbYd
         4KYhVK09POaBKjivrbSw59Cooy4JatkNBwL5X80qzxMYse1wtv1saFzaY43Doqr/3QtJ
         V3EkkBhPM1GvGSTGqLcOavMs17YOQPFNsQJkvlUM6buLEmiTKhZ9jFDwJcZXhquLAlSZ
         bXYzUubS5Itb3Qk3+hhLKs+/6GP0N+ETtRn+jX0VxyT7aj+t6Hh7SrHQt5IxPL1N69Gs
         pgZMUZIv9/mdp3VspF9Am9KiTjZLXgkpJ+QhTfTsT/ixL7+gk2NmKFxaGXDk1dDKqf1S
         kuSA==
X-Gm-Message-State: AOAM5339ghqDJQqlpepZ0ZLy19aLpuzE230OkQyjqExrka6yoMqPuKZl
	a6Mhk0oAw0/o1MUgYkkkVN8NKircxXQUh2CGLsI=
X-Google-Smtp-Source: ABdhPJzU2z69O7Fqug+dPQ5GAVvRp04WE2rMCgYGOE487by9Yq9YbM36FEYlS9uT+ieFNlJILMVNTFhq9sT1rYHAXfg=
X-Received: by 2002:a05:6e02:188c:: with SMTP id o12mr18622447ilu.321.1634670112704;
 Tue, 19 Oct 2021 12:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211019171121.3510624-1-arnd@kernel.org>
In-Reply-To: <20211019171121.3510624-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 19 Oct 2021 21:01:41 +0200
Message-ID: <CANiq72kckY71gg=xMFOHEraW+PYGbRBsm2xv1tBn7013ipyyWg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] x86: avoid -mtune=atom with clang
To: Arnd Bergmann <arnd@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	"H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 19, 2021 at 7:11 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> +ifdef CONFIG_CC_IS_CLANG
> +        cflags-$(CONFIG_MATOM)         += -march=atom -mtune=generic
> +else
>          cflags-$(CONFIG_MATOM)         += -march=atom
> +endif

Is it possible to factor it out? Also, a comment with the LLVM version
we last checked would be good. Something like...

    cflags-$(CONFIG_MATOM)         += -march=atom

    # Atom optimizations do not seem well exercised in, at least, LLVM <= 13,
    # to the point of getting problems with register allocation.
    ifdef CONFIG_CC_IS_CLANG
            cflags-$(CONFIG_MATOM)         += -mtune=generic
    endif

Cheers,
Miguel
