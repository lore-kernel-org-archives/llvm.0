Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E4615AC
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 01:57:55 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a8so14328684ejc.8
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RzHOurcRZLEPdx5A8AtvMQus3L3vLI1jvcmAUoK7M3M=;
        b=QipcaPzemhcgIfEJYN144w0FnjRfqRUr/lWiEGEPhGe/qWrPlffischpqBrRPHT5m3
         Qe3ydqH/K9tObWP9AdmckmHt49bsCYrU9T+CBDF9fX8Zs8e9aORdJWAYCX4yUAPM9H/j
         m9xf6179ufuVV3J1o5iE6xXJG7Ck51v7CCX+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RzHOurcRZLEPdx5A8AtvMQus3L3vLI1jvcmAUoK7M3M=;
        b=o/W43XkPu9HBSVXYX9qiLvKJ5+7nAK0+blbWqi7mYt7GmydvDn9Z0SJFbotg5nDXUh
         VSFyDy2l7gaybXQZE1NcpsKYVf4L6MmCznoVSgLlbBFn9IRekoy6a/VdcX/+BS+TaM2t
         GPCnQXNLmWBBfjbQIKa5poDRlcEexSHyAC6tGr4VZQf8VWuBSrZAnwiwem+TESygpCb2
         /d+iSNwCH85oKW4uupxTsqcR7aAegM5cdhTaOMz/4rh6K4CQpVHn7fYHQoJOtSfNsqpf
         oaSIdVXGQrME+1mukhdw75wH4miVNDe2KwZRzmPyxTmieGpDiFxYLR0taj0KxCRKUl0z
         D8Sw==
X-Gm-Message-State: AOAM5336I4LqYDpwTdl/0oMKPd9DLIHtZ/UW8GG8AbrG6ZZND8RQjpHC
	NGgxjdrKyAXRLimtSf8counXwjOLdYyECQxEPWQ=
X-Google-Smtp-Source: ABdhPJwsVra45RJMZqsntkJiyG5M5L5JpBhcx6iwYjlLYJPmn60NliMr+03i/IGEs0iooYLm/pnpeA==
X-Received: by 2002:a17:906:1645:b0:6ce:de9:6eb1 with SMTP id n5-20020a170906164500b006ce0de96eb1mr7028830ejd.616.1647568673288;
        Thu, 17 Mar 2022 18:57:53 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id r14-20020a1709067fce00b006db0edb8a80sm2995908ejs.225.2022.03.17.18.57.53
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 18:57:53 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id j15so242722eje.9
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:57:53 -0700 (PDT)
X-Received: by 2002:a05:651c:1509:b0:249:6cd6:96d8 with SMTP id
 e9-20020a05651c150900b002496cd696d8mr685036ljf.358.1647568262431; Thu, 17 Mar
 2022 18:51:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220210223134.233757-1-morbo@google.com> <20220301201903.4113977-1-morbo@google.com>
 <CAGG=3QWh90r5C3gmTj9zxiJb-mwD=PGqGwZZTjAfyi1NCb1_9w@mail.gmail.com>
 <AC3D873E-A28B-41F1-8BF4-2F6F37BCEEB4@zytor.com> <CAGG=3QVu5QjQK8m2FWiYn-XQuVBjUGXcbznSbK22jVMB5GAutw@mail.gmail.com>
 <F5296439-4CA3-4F31-BD91-5ED1510BC382@zytor.com> <CAKwvOdkk-C8HMemKs4+yoxvNDgTLmvZG1rmwjVXBqhsQ-cED5g@mail.gmail.com>
 <CAHk-=whJfKN8Jag=8DS=pbZR3TY90znUOP6Km+TLRJ9dZEgNqw@mail.gmail.com>
 <878rt8gwxa.fsf@oldenburg.str.redhat.com> <CAHk-=wiZtg-E5s1CEZgaSE=e38vFoP3y2aV-4R82jqmcUoD0Aw@mail.gmail.com>
 <20220318002555.GP614@gate.crashing.org> <CAHk-=wjRfJijS5yJsLFzyJS6HFh46q8Eu6EvjGGjJSZ1+m74_Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjRfJijS5yJsLFzyJS6HFh46q8Eu6EvjGGjJSZ1+m74_Q@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 18:50:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wibzB9fSXZf79FhjAvoLsPP0YG4VKjQy0jZE8BZj8uBOg@mail.gmail.com>
Message-ID: <CAHk-=wibzB9fSXZf79FhjAvoLsPP0YG4VKjQy0jZE8BZj8uBOg@mail.gmail.com>
Subject: Re: [PATCH v5] x86: use builtins to read eflags
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Florian Weimer <fweimer@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Bill Wendling <morbo@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, 
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, llvm@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-toolchains <linux-toolchains@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022 at 6:21 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Now, compare that to just using inline asm: it's trivial, and we've
> used it basically unchanged for three decades.

Ok, so going _really_ far back, we used to have them literally written out:

        __asm__ __volatile__("pushfl ; popl %0 ; cli":"=r" (flags));

in random code, and then in October 1992 switched those nasty things
to instead use

   #define cli() __asm__ __volatile__ ("cli"::)

    #define save_flags(x) \
    __asm__ __volatile__("pushfl ; popl %0":"=r" (x))

and the code was changed to actually use

        save_flags(flags);
        cli();

instead of that open-coded raw asm.

And the "memory" clobber was added early June, 1993:

   #define save_flags(x) \
  -__asm__ __volatile__("pushfl ; popl %0":"=r" (x))
  +__asm__ __volatile__("pushfl ; popl %0":"=r" (x)::"memory")

so that thing really has existed in pretty much that exact form for
almost 30 years.

There's been tweaks since (the "=r" became "=g" before becoming "=rm",
comments have been added, "pushfl" became just "pushf" with x86-64,
and the thing has moved around and is now called "native_save_fl()" in
a completely different header file etc)

But at no point was it ever as buggy as the actual gcc intrinsic seems
to be today, nor have we needed to check for compiler versions etc.

                  Linus
