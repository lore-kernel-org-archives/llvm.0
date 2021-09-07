Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3A372
	for <llvm@lists.linux.dev>; Tue,  7 Sep 2021 22:18:33 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id z2so785242lft.1
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 15:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0zmMnIiAhcfycStlfZRMWh53/bzZhPDg9yKAX8nkCc=;
        b=cNF0wdQ/TI780fTJbXH+7PorV+kNufKENvngWCa75x9+fsFjdodc8BLriyvTsCTO8U
         3xhHhbhNl3mJ8vyi986ZALpOUaKDIIiRRrmudAYEM+8oj2aPJHDjMPeTyMLxFH9iIA3K
         h4nrgFG911smxfTzCOCLFHotIQtnlmu1V6DQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0zmMnIiAhcfycStlfZRMWh53/bzZhPDg9yKAX8nkCc=;
        b=KoFq3IwnH+m6m8+cz4F57cXJS3iDW2/CWk4n5POFc/oENBJvsGB2bCkAvQOdje59ur
         KNrS0eLVH3U5vwfNv/Exl0t0f6c77fCeXJMC0owbeCSub1EsLX9VsuYuCfihMl/GbQVu
         EJvFPHdUVozsPRwCyzmn80o46b/30lP4Cq3g1AaeennV3j5t3Ifk+yrg68dnlr64t6IO
         eRDaMNhqxw9JwNMoWXxz7QWRV7XhRA3+8CrZXyYw/KcOOoNMMOj05IxN+f+dg0cKBleT
         O5VMVGunnqGbYp9Td0uN4JxRY9ChDdSJw0AXRLFe7XatQjP0dLIJXlCYyJgvfqgXDgPM
         3mew==
X-Gm-Message-State: AOAM530Pwh6CjrDfLOww5k4sNwIK6a65CouOGxXVQvPMD5pLULOOCmjU
	9Jc+mnUR8VQpBhH59P6Uh/azeSP2xqoJsjSQk2Q=
X-Google-Smtp-Source: ABdhPJx6LaIlk7khmpUhnxT2VAjuRYzqe5k6KSIX+5lBaci9/wlGTqyv/LsFN1xqydO9bOIi+taspA==
X-Received: by 2002:a05:6512:c0f:: with SMTP id z15mr460454lfu.256.1631053111486;
        Tue, 07 Sep 2021 15:18:31 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id a7sm17707ljd.85.2021.09.07.15.18.30
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 15:18:30 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id c8so771634lfi.3
        for <llvm@lists.linux.dev>; Tue, 07 Sep 2021 15:18:30 -0700 (PDT)
X-Received: by 2002:a05:6512:3da5:: with SMTP id k37mr426102lfv.655.1631053110042;
 Tue, 07 Sep 2021 15:18:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com> <YTfkO2PdnBXQXvsm@elver.google.com>
In-Reply-To: <YTfkO2PdnBXQXvsm@elver.google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 7 Sep 2021 15:18:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
Message-ID: <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To: Marco Elver <elver@google.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev, 
	LSM List <linux-security-module@vger.kernel.org>, linux-toolchains@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <keescook@chromium.org>, 
	Mark Brown <broonie@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Chris Down <chris@chrisdown.name>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Daniel Borkmann <daniel@iogearbox.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 7, 2021 at 3:14 PM Marco Elver <elver@google.com> wrote:
>
>
>  config WERROR
>         bool "Compile the kernel with warnings as errors"
> -       default y
> +       default COMPILE_TEST

That seems reasonable. It very much is about build-testing.

              Linus
