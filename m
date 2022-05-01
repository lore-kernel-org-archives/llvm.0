Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEA523D3
	for <llvm@lists.linux.dev>; Sun,  1 May 2022 18:40:54 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id p4so9292827qtq.12
        for <llvm@lists.linux.dev>; Sun, 01 May 2022 11:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i9jSsJK67gVprD0OhIIxIaW2gZ3IT+EyIX8/ekopw/E=;
        b=NysN4XwiguttMWVksj7bhwyRkFDKawgcSZh2/EYGkK65y30NFKISODSSBr9h/0qix5
         fXmGQBFA0zF2UMfum3alevpj1tCiqDAyQIwTZYEuJaYFRUrUrWah4HHHuLkcnu965T4y
         HZzfDrHPbwPHSIKcVQ2h54tV/IIGN5AIWNTXh1U1ebN2r/7sx8we8b/DnNb9YQ5IG4nn
         Lj6nZZhuPbGQJTKh/z1TX/5h1jkI44wPyUOU/hot5NZW+X7HMOCCPlXRcGf1T2rClABf
         zzhXhKSfYwVQz6th7SZ6Joq5AxgaeDJ2Bum27sixeWvP8ygUissyc5Hb0AfJHeooqjwU
         R8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9jSsJK67gVprD0OhIIxIaW2gZ3IT+EyIX8/ekopw/E=;
        b=F1ttWjs4tegR4+uTSjk9Vzo/k293tiga/hOzNwBt8E9QZK0cuAq6l2kBbANu0vQU4d
         blY5Cqippb0wDcK9iHTkIMloQT+eqAQWQzJ3RNKCzA78MipAil6ZSBAbmHnSeRTqDLyO
         UPlf89KFKCI7nA+v7OWaVVaHLBvjcI3hIDt5vz8b7JqwgLCgjLh8jinoKzWylqn2OImT
         +TplPupchBbCsVMzfphJczbnC1/8PFBKGKjdItHkoEhwfvlgInr3X3548TmqFHSXXpNp
         1sVVaxUGACw7UBshg8myP7FWC7VcI3AnJAJ1io/eHNgWsfEYMnwtFqZ63G6wNUPnmBsS
         8OdQ==
X-Gm-Message-State: AOAM532hkUAinXt+t0Te7kdJGAdJ6Ap6aNrf95OPFo1hVPV4TQrabp14
	5GtLeF2Mifr3lyc0883VQPdLB/zmX2OJDbjzdWU=
X-Google-Smtp-Source: ABdhPJzcCM4JYknjyCagt7fQbMyD8hG2cFLA9ewuAj8jaiz34kcNy5TjrFhmDsUkm42CdCTwMEavhsQpUIDX6jbrNzQ=
X-Received: by 2002:ac8:5f10:0:b0:2f3:9f2e:e67b with SMTP id
 x16-20020ac85f10000000b002f39f2ee67bmr5412384qta.40.1651430453636; Sun, 01
 May 2022 11:40:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEQFVGb2aXVu7eys5PM=xZ7gtzdap_QyRrzi3WzY83ka=heOwQ@mail.gmail.com>
 <CAK8P3a0Lwtm86wYH+0yFtr=Luc6g3OLu_+vzZaJqxDxNHFmQDQ@mail.gmail.com>
 <CAKwvOdmfHS8UwZhEL-tLMJSzCXQEZZZhEMpDXuJHtP5s9yePBw@mail.gmail.com>
 <CAEQFVGYpPaE3cCxUBaiT97GU1i4Nr6yJdv6mU1kiCxqkLSMfBQ@mail.gmail.com>
 <CAEQFVGaUOQhCCceNzivzsR7XeNFrau48BuV-nf7CnSw7YauVoQ@mail.gmail.com>
 <CAEQFVGY6UwuV0s_926Mg=fWaApjYUJmqeK_E4ySpABkZRFwTLQ@mail.gmail.com> <CAEQFVGavOWzTf5VNNNr39pHaaJW8W=6hiGDH1JmVTQ2kf5KqAw@mail.gmail.com>
In-Reply-To: <CAEQFVGavOWzTf5VNNNr39pHaaJW8W=6hiGDH1JmVTQ2kf5KqAw@mail.gmail.com>
From: Mauro Rossi <issor.oruam@gmail.com>
Date: Sun, 1 May 2022 20:40:42 +0200
Message-ID: <CAEQFVGZfq17gj9z7Z_MDVUAsx-e16cJ3h1KVzcZ1-eimBcGoag@mail.gmail.com>
Subject: Re: Android 11 clang toochain: kernel 5.18 build error with 32 bit target
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chih-Wei Huang <cwhuang@android-x86.org>, 
	clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

> As promised I have rechecked the kernel build with Android 11 prebuilt
> toolchain (clang 11.0.2)
>
>   CC      mm/maccess.o
> /home/utente/r-x86_kernel/kernel/mm/maccess.c:37:3: error: invalid
> output size for constraint '=a'
>                 copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
>                 ^
> /home/utente/r-x86_kernel/kernel/mm/maccess.c:19:3: note: expanded
> from macro 'copy_from_kernel_nofault_loop'
>                 __get_kernel_nofault(dst, src, type, err_label);
>          \
>                 ^
> /home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:538:18:
> note: expanded from macro '__get_kernel_nofault'
>         __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
>                         ^
> /home/utente/r-x86_kernel/kernel/mm/maccess.c:37:3: error: invalid
> output size for constraint '=a'
> /home/utente/r-x86_kernel/kernel/mm/maccess.c:19:3: note: expanded
> from macro 'copy_from_kernel_nofault_loop'
>                 __get_kernel_nofault(dst, src, type, err_label);
>          \
>                 ^
> /home/utente/r-x86_kernel/kernel/arch/x86/include/asm/uaccess.h:538:18:
> note: expanded from macro '__get_kernel_nofault'
>         __get_user_size(*((type *)(dst)), (__force type __user *)(src), \
>                         ^
> 2 errors generated.
>
> At this point I will proceed in testing the build with Nick proposed
> changes in __get_user_size()
> and report back
>
> Thank you
> M.

Hello,

Nick proposed patch works for 32bit build and shows no regression in 64bit build
For Nick, in case you are not submitting for kernel-5.18 could you
please provide me with
commit title and message and allow me to use the fix in our future
android-x86 LTS kernel builds?

Thank you

Mauro
