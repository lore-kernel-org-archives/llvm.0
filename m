Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD97A7E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 03:12:55 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id b16so18277955wru.7
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=aUfdL0h8QoOM6NYh1e5obcpE+RfHCz5rvFmppJngHvA=;
        b=KHQsCzY7yTO3vvx/cyNUaGgEO5PXwRMVx66LyTgH51awzIcZcZZCOTCsDqttKMNV7Q
         BPSGYKQV/VrU0WTiCKhJgiIKmf0gqYyc0uQk6UjduBR66cv1eHJZ5pnLUWJNLzsvFnOH
         0nOzTtct9mO9njg2xFJHzO7qsjvHEnzUxCTgscZpuhzzCl2r/19Q8HxilmGnb8u15NDC
         +73+WRsR8Bxs2b8Vn/C8saNGHD0Q8+msyHaGAtqnuProdEZAx2WCKOpAtm2fE1xyJkvK
         edFQ7z3EFnP8pzcUF9TJCPjZpo2oj/chmIvKa9rLmFdUGBT/KyBERR0ROmpPVgYaHTBt
         ceIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=aUfdL0h8QoOM6NYh1e5obcpE+RfHCz5rvFmppJngHvA=;
        b=TmzaKfYDAPNn+o1O4ni9B2XSNvb1ImiOCIB8Os+0v5vBU5YmqIvGiPFKUFsUSb1cLF
         +5kgkw0CwaHIl/Y17bwRFkmGHQS276VPWFpp0MGVXvtQJ9hCtuygpNSGKBewAXgXEjk7
         Y0EQtFWYEsg/wf6V84wO2ie1WvlrR+XTASgpbY9VqgSmGVkMM5lJd+E8g3tSDC4d5AEq
         HaKRQNz7yoHhtNK3LNZJ68mtQqa1IWGSw6hKkj6gAS/I+SgWrylw7QVcAI/dqpXyRz/4
         jLdjepLdW03Q3AW5COjfUn67Q4dU5K/OiNGJQiLRjv2p6bxqKC/0+f5M9N8G7JqarqPd
         n0zw==
X-Gm-Message-State: ACgBeo10TgwlfFCJF0W2b3KkAngZ/aT3+RCZ8eaOUCizn/FAo71RIAJc
	ZWCPXC5mM/bz4e5KYtpqX2PdfbY+xOQKEjDy48WtQg==
X-Google-Smtp-Source: AA6agR6+XIck/mw2/xXcXiIMCskPM4UjDy9mMXNg+xODpTBkghjapXqW4g0z+ULl8GeHxGBAlviiQg4azrh96I5pTYk=
X-Received: by 2002:a05:6000:10cf:b0:228:df93:a9b1 with SMTP id
 b15-20020a05600010cf00b00228df93a9b1mr712220wrx.4.1662520373740; Tue, 06 Sep
 2022 20:12:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
 <20220831184408.2778264-3-ndesaulniers@google.com> <Yw+8QgtSbB2/3Eiq@dev-arch.thelio-3990X>
 <CAK7LNASQJ-B2kRGXea-dQt+1BgEsp_aLEPS_uJb1R6FSOj1Khg@mail.gmail.com>
In-Reply-To: <CAK7LNASQJ-B2kRGXea-dQt+1BgEsp_aLEPS_uJb1R6FSOj1Khg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 6 Sep 2022 20:12:42 -0700
Message-ID: <CAKwvOdnU5qBqOroEkjf=n-R_rpXxAVx2NhA2wKfasmOPTf6K6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] Makefile.compiler: Use KBUILD_AFLAGS for as-option
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Michal Marek <michal.lkml@markovi.net>, 
	Tom Rix <trix@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	X86 ML <x86@kernel.org>, Dmitrii Bundin <dmitrii.bundin.a@gmail.com>, 
	Fangrui Song <maskray@google.com>, Alexey Alexandrov <aalexand@google.com>, 
	Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 2:11 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Sep 1, 2022 at 4:53 AM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > On Wed, Aug 31, 2022 at 11:44:05AM -0700, Nick Desaulniers wrote:
> > > as-instr uses KBUILD_AFLAGS, but as-option uses KBUILD_CFLAGS.  This can
> > > cause as-option to fail unexpectedly because clang will emit
> > > -Werror,-Wunused-command-line-argument for various -m and -f flags for
> > > assembler sources.
> >
> > Now that I am looking closer at it, where does that '-Werror' come from?
>
>
>
>
> The related commit is
> c3f0d0bc5b01ad90c45276952802455750444b4f
>
> The previous discussion with Arnd is
> https://lore.kernel.org/linux-kbuild/20170314213724.3836900-1-arnd@arndb.de/
>
>
>
>
>
> > For cc-option, we add it to elevate clang's warnings about unused '-f',
> > '-m', and '-W' flags to errors so that we do not add those flags.
> > However, I do not see '-Werror' in as-option. I am going to assume it
> > came from CONFIG_WERROR, as I believe Android has that turned on by
> > default.
>
>
> CONFIG_WERROR is added to CFLAGS.
> But, I guess it is more correct to do likewise for others.
> (https://patchwork.kernel.org/project/linux-kbuild/patch/20220905083619.672091-1-masahiroy@kernel.org/)
>
>
>
> > I think that is the real problem: without '-Werror', the only
> > error that should come from as-option is when an option isn't supported
> > by the assembler, as clang will still warn but those will not be fatal
> > but with '-Werror', those warnings turn fatal, causing all subsequent
> > as-option calls to fail.
>
>
>
> Presumably, it is correct to add -Werror to as-option as well.
> We have no reason to add it to cc-option, but not to as-option.
>
>
>
>
> I also believe '-x assembler' should be changed to
> '-x assembler-with-cpp'.
>
>
> As I mentioned somewhere before, our assembly code (*.S) is always
> preprocessed. There is no *.s file in the kernel source tree.
>
>
> So, '-x assembler-with-cpp' matches the real situation.

Should I do this for as-instr then as well? In the same patch?

>
>
> One interesting thing is, clang does not warn
> [-Wunused-command-line-argument] for *.S files.
>
>
>
>
> $ clang -fomit-frame-pointer -c -x assembler /dev/null -o /dev/null
> clang: warning: argument unused during compilation:
> '-fomit-frame-pointer' [-Wunused-command-line-argument]
>
> $ clang -fomit-frame-pointer -c -x assembler-with-cpp /dev/null -o /dev/null
>
>
>
> The root cause is we are using '-x assembler', which
> never happens in the kernel tree.
>
>
>
>
> To sum up, the code I think correct is:
>
>
> as-option = $(call try-run,\
>    $(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp
> /dev/null -o "$$TMP",$(1),$(2))

Does your recent patch affect this?
https://lore.kernel.org/linux-kbuild/20220905083619.672091-1-masahiroy@kernel.org/
If so, then I should not add -Werror as you suggest above?

-- 
Thanks,
~Nick Desaulniers
