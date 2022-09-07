Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com [210.131.2.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457687E
	for <llvm@lists.linux.dev>; Wed,  7 Sep 2022 04:28:18 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51]) (authenticated)
	by conssluserg-01.nifty.com with ESMTP id 2874S5nY030472
	for <llvm@lists.linux.dev>; Wed, 7 Sep 2022 13:28:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 2874S5nY030472
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662524885;
	bh=1UbbBUkvxSBhRKBM4/+Em4xozDMjh5y0hIq+C6QbsRg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GXJMmUPsQbYrp/qghqYA3gi9b1dY4MjZGQU5m1J9o4DuqFkrTU9WrUdz44bSDmP6s
	 O1Tnx/oKIu4satumwvM4kzJQvyv+5BkO4AoS+IxSpzXrj/3C2Ll3PNyqBwVvzQSuLN
	 0q2emN+ml5NpkxVAK6YXKwDwNuo8fxtKg4rRWjEnshtLhwD3ReiutEBeyxF8W4noUc
	 yVlgbFKD2GkNHdINB58XA/9EWlF01eFCrjKgtaWk6prc/RcMjTRZLSnJ4NM2ah4rAR
	 yTpuFcFLNOPR2rxEn3b9G6k9vw3qMiJlogrxEeSDmMAEHd/rgJurtYrTrjXwZXxjeW
	 ZVTYoW8A4w1Jg==
X-Nifty-SrcIP: [209.85.210.51]
Received: by mail-ot1-f51.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso9467047otb.6
        for <llvm@lists.linux.dev>; Tue, 06 Sep 2022 21:28:05 -0700 (PDT)
X-Gm-Message-State: ACgBeo17YxHz7jM1jwmRA8w1KyNLRl/gCZuj5bCPC36F+8BEdkDZaCic
	4MmsghdJnmsTBabiy+FlLyA7zyILl+FlYHD+Fdk=
X-Google-Smtp-Source: AA6agR6XPzafcHosnnYg49i0CuugkbKR2RUGJBerc2LsQm/WmngVgyb900/QA1Ge9aDuo/iNTIqZIGfKey0ezQC47NI=
X-Received: by 2002:a05:6830:658b:b0:63b:3501:7167 with SMTP id
 cn11-20020a056830658b00b0063b35017167mr715790otb.343.1662524884592; Tue, 06
 Sep 2022 21:28:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220831184408.2778264-1-ndesaulniers@google.com>
 <20220831184408.2778264-3-ndesaulniers@google.com> <Yw+8QgtSbB2/3Eiq@dev-arch.thelio-3990X>
 <CAK7LNASQJ-B2kRGXea-dQt+1BgEsp_aLEPS_uJb1R6FSOj1Khg@mail.gmail.com> <CAKwvOdnU5qBqOroEkjf=n-R_rpXxAVx2NhA2wKfasmOPTf6K6Q@mail.gmail.com>
In-Reply-To: <CAKwvOdnU5qBqOroEkjf=n-R_rpXxAVx2NhA2wKfasmOPTf6K6Q@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 7 Sep 2022 13:27:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQg=E4DGzfFpvnzNQsYrAhgs4SzQVYxqk-6ZeRvT3+2rw@mail.gmail.com>
Message-ID: <CAK7LNAQg=E4DGzfFpvnzNQsYrAhgs4SzQVYxqk-6ZeRvT3+2rw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] Makefile.compiler: Use KBUILD_AFLAGS for as-option
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <llvm@lists.linux.dev>, X86 ML <x86@kernel.org>,
        Dmitrii Bundin <dmitrii.bundin.a@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Alexey Alexandrov <aalexand@google.com>,
        Bill Wendling <morbo@google.com>, Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 7, 2022 at 12:12 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
> >
> >
> >
> >
> > I also believe '-x assembler' should be changed to
> > '-x assembler-with-cpp'.
> >
> >
> > As I mentioned somewhere before, our assembly code (*.S) is always
> > preprocessed. There is no *.s file in the kernel source tree.
> >
> >
> > So, '-x assembler-with-cpp' matches the real situation.
>
> Should I do this for as-instr then as well? In the same patch?


Probably we should fix as-instr in the same way.

You can do it in the same patch, or in a separate one.
It is up to you.






> >
> >
> > One interesting thing is, clang does not warn
> > [-Wunused-command-line-argument] for *.S files.
> >
> >
> >
> >
> > $ clang -fomit-frame-pointer -c -x assembler /dev/null -o /dev/null
> > clang: warning: argument unused during compilation:
> > '-fomit-frame-pointer' [-Wunused-command-line-argument]
> >
> > $ clang -fomit-frame-pointer -c -x assembler-with-cpp /dev/null -o /dev/null
> >
> >
> >
> > The root cause is we are using '-x assembler', which
> > never happens in the kernel tree.
> >
> >
> >
> >
> > To sum up, the code I think correct is:
> >
> >
> > as-option = $(call try-run,\
> >    $(CC) -Werror $(KBUILD_AFLAGS) $(1) -c -x assembler-with-cpp
> > /dev/null -o "$$TMP",$(1),$(2))
>
> Does your recent patch affect this?
> https://lore.kernel.org/linux-kbuild/20220905083619.672091-1-masahiroy@kernel.org/


No, I do not think so.



> If so, then I should not add -Werror as you suggest above?



I think we should always add -Werror to as-option.



as-option checks the command line options with /dev/null
as the source input (that is, source input is always valid).


If as-option results in a warning, that option will sprinkle
the same warning for all *.S files in the source tree.

So, any warning in as-option should be considered as an error.





-- 
Best Regards
Masahiro Yamada
