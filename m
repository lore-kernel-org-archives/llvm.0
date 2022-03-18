Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E315AC
	for <llvm@lists.linux.dev>; Fri, 18 Mar 2022 01:29:30 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id ja24so8841716ejc.11
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b/pNbzgcdYJjSh+ACj0n1pQjCDJGCCGjloF/JdGNGSo=;
        b=dTK+uo+Jz568eICd2gFrkZaobtquyTLeKqTZIsWeFh8G+SUpzTGAJXhBoZXX4qGMFK
         OeEsQc3mooLTyuDiZs/fiz3l75SR99l/LHN+ZhVgwUnB9r+RMj/zfPEEFAsUtSaKjGEx
         7NDWm4uqPJjO5ZFjWHOgeB/nPhAXtIogQJuf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b/pNbzgcdYJjSh+ACj0n1pQjCDJGCCGjloF/JdGNGSo=;
        b=2soP5pFPTwesDgEEsFEBrXVDCbAzKZ1DzY5r/CfpAx3xQuAl8QLGdTy+ycWyb3kWRG
         5Aix9RWE5ZUdQ9SY4OgAqldAUkUSJ/P8xc6LD00mdBN/a/7WdKUiG4jNMv0cE/O4k192
         IQukJdhKKAWvoRaR7vjuTFqG8OdxxhXAELi6a/+U595AzeVmRdOoUZccHeUHkDGnU+OT
         k5CIn9Np16PVgh7tKon/T1kD6k7jGisklter0U6FN9d9bTwVfHaXk/inhWpTclHXRrCI
         6RKoQ/6ScVab8ZoyInt37BRUL23s5HbZRLp3/xdCLw6Mdu7nu7R8KCW4GDK/5vWryI8G
         j+Fw==
X-Gm-Message-State: AOAM533s16CCqV77C3FyEzKA0xSh0kMc/0GG2jySojfh5zhziYoNbUld
	icZd7LwTMF0GN4/K6zXoPrc0k4wpJo4PuVOiE3s=
X-Google-Smtp-Source: ABdhPJx71Plnu38uytyR0TmlP2NHE6mhpsxGz+HSVHq0NhnAipMFmQJKLENu9Ogu00TtbUKJ78Re3g==
X-Received: by 2002:a17:906:2846:b0:6ce:21cd:5398 with SMTP id s6-20020a170906284600b006ce21cd5398mr6934496ejc.49.1647566968741;
        Thu, 17 Mar 2022 18:29:28 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id sh15-20020a1709076e8f00b006df881fd066sm2270231ejc.9.2022.03.17.18.29.28
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 18:29:28 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id h13so8626163ede.5
        for <llvm@lists.linux.dev>; Thu, 17 Mar 2022 18:29:28 -0700 (PDT)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr4728907lji.152.1647566502600; Thu, 17
 Mar 2022 18:21:42 -0700 (PDT)
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
 <20220318002555.GP614@gate.crashing.org>
In-Reply-To: <20220318002555.GP614@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 17 Mar 2022 18:21:26 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjRfJijS5yJsLFzyJS6HFh46q8Eu6EvjGGjJSZ1+m74_Q@mail.gmail.com>
Message-ID: <CAHk-=wjRfJijS5yJsLFzyJS6HFh46q8Eu6EvjGGjJSZ1+m74_Q@mail.gmail.com>
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

On Thu, Mar 17, 2022 at 5:31 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Thu, Mar 17, 2022 at 01:36:19PM -0700, Linus Torvalds wrote:
> >
> > So yes, a builtin can improve code generation.
>
> Yes, and they are much easier to write, and can be written correctly by
> lookenspeepers who just *have* to twist every knob that they can -- more
> easily than inline asm anyway, which is unforgiving to the extreme.

What?

They aren't easier for the user: they are entirely undocumented, they
can't be fvound anywhere sane, and even if you do find them, you don't
actually have a clue which compiler version implements them.

If you know about the name - and how would you? - one of the first
google hits when you try to figure out what it does is the gcc
bugzilla about how they are undocumented:

    https://gcc.gnu.org/bugzilla//show_bug.cgi?id=92137

and then when you look at that bugzilla, the reply to the "it's
undocumented" is _literally_

    "You shouldn't use those, they are for internal use only.  That's
the reason they are not documented"

so I call BS on them being "easier to write".

I also call BS on the "can be written correctly", since the actual gcc
built-in is not just undocumented, it is also (a) badly defined in
that there is no chance in hell it can ever do anything sane thanks to
missing serialization definitions, and (b) clearly seriously buggy and
generates completely bogus code as Andrew Cooper found out.

Now, compare that to just using inline asm: it's trivial, and we've
used it basically unchanged for three decades.

So seriously: when I say "yes, a builtin can improve code generation",
I mean it purely in the theoretical sense.

Because in the *practical* sense that actually takes reality into
account, I can unequivocally say that the built-in is pure and utter
garbage, should never be used, and should actively be deleted from the
gcc source base because it's so fundamentally broken.

Do you really want to make arguments that are counter-factual when the
facts are *this* clear?

                  Linus
