Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CBC13AEF
	for <llvm@lists.linux.dev>; Wed,  5 Jul 2023 21:08:13 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-262d9e75438so73564a91.2
        for <llvm@lists.linux.dev>; Wed, 05 Jul 2023 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688591293; x=1691183293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ug73FggPnbwdd1VaI/h85Jqlh9rWzsohKtgG2/gb7Z0=;
        b=IFNOV4ZEPbH0J7ufVwembvtKuwugzRGT0taaw/ZrLwCiQHr92VrBulxkGJ4TK/gd83
         zPM5qvFSxmaP/2MudSKJG+aGnlR0QuiW97FKCvzeSmLETNIJJkE65jMJPTuJu/pTJaTE
         iXAqFJoBzZZrjQbyBFsPvGz7xeSpFZtnBx4ms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688591293; x=1691183293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ug73FggPnbwdd1VaI/h85Jqlh9rWzsohKtgG2/gb7Z0=;
        b=Q9CHS4CXJf0uaLSGU64/JQcoss/NX9/vy0RBvpRTMS9QYewetIYJqccMtLWDgPn8cd
         iXVaoEdzLtoCYagsC399IGLlq9GpJTdbZ4WRyKnIlmOajJ+WV9pQ6GuNzRUTLYQdNd9u
         GuGfS5+hW2OQtDgXLg0Ke9/pnFOe4lWPrnEkIAKxZKhKmDwZo6fynbhFjuvmv5dYlXpl
         4ebdCUC+3nAQnJxMU1gkIU+gGn3BNl2PNDeURdvTZCXUnEvaooKGToTZ9EuqcxjgAwkp
         5HXH7uNs51r5efR/3GtAJYij96MSLIjJHVaNWAo56/jlp+/aYf0pXLm8RO/WDLpuhU8Q
         0YtA==
X-Gm-Message-State: ABy/qLbmUXCi7VMvN+rPpFXJq50ph9byCoZfDEim9ATOVE48Ryh5MJ1F
	9M8ZubSDmGT9VyucjMgRU6vjgw==
X-Google-Smtp-Source: APBJJlEaIv/sTfl7OmBOeeEHSIo6/1kWdH6bBSD96cPSluFsMWjo9kBujHQEFtQf0dJEt3j/VamBsA==
X-Received: by 2002:a17:90a:358:b0:263:e804:3988 with SMTP id 24-20020a17090a035800b00263e8043988mr5089443pjf.1.1688591292720;
        Wed, 05 Jul 2023 14:08:12 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id cx3-20020a17090afd8300b00263987a50fcsm1815914pjb.22.2023.07.05.14.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 14:08:11 -0700 (PDT)
Date: Wed, 5 Jul 2023 14:08:09 -0700
From: Kees Cook <keescook@chromium.org>
To: Jann Horn <jannh@google.com>
Cc: Kees Cook <kees@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux LLVM <llvm@lists.linux.dev>,
	the arch/x86 maintainers <x86@kernel.org>
Subject: Re: CONFIG_UBSAN_TRAP #UD error message on x86 [was: Re:
 [CRASH][BISECTED] 6.4.1 crash in boot]
Message-ID: <202307051405.E746464@keescook>
References: <2b1a4f49-ba18-0246-af09-4e4133814411@alu.unizg.hr>
 <202307022230.6121D6896@keescook>
 <ed3e4315-b149-2f9e-70d4-45d7f83b9922@alu.unizg.hr>
 <202307031149.823F9A3@keescook>
 <202307031606.3FD9D0D@keescook>
 <fbf4103b-6471-1f06-34a8-4aa227f5e091@alu.unizg.hr>
 <3CDD1188-7B2A-4D53-9B8F-C07BC39844E9@kernel.org>
 <19d0e63c-db47-8f02-2f79-0923f675898c@alu.unizg.hr>
 <DA3FEB08-DF39-406B-89CC-9076CFCF597A@kernel.org>
 <CAG48ez0kmSqS_WJ1=neKpxKmMMkPYgNHfBD6ZSif_EWnso84wQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG48ez0kmSqS_WJ1=neKpxKmMMkPYgNHfBD6ZSif_EWnso84wQ@mail.gmail.com>

On Wed, Jul 05, 2023 at 05:16:36PM +0200, Jann Horn wrote:
> On Wed, Jul 5, 2023 at 4:10 AM Kees Cook <kees@kernel.org> wrote:
> > On July 4, 2023 4:15:20 PM PDT, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr> wrote:
> > >On 7/4/23 23:36, Kees Cook wrote:
> > >> On July 4, 2023 10:20:11 AM PDT, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr> wrote:
> > >>> all Wayland and X11.org GUI applications fail to start, with errors like this one:
> > >>>
> > >>> Jul  4 19:09:07 defiant kernel: [   40.529719] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> > >>
> > >> Hmm, is CONFIG_UBSAN_TRAP set?
> > >
> > >marvin@defiant:~/linux/kernel/linux_torvalds$ grep CONFIG_UBSAN_TRAP .config
> > >CONFIG_UBSAN_TRAP=y
> >
> > Ah-ha! Turn that off please. With it off you will get much more useful reports from USBAN.
> 
> It might be useful if the x86 code under handle_invalid_op() at least
> printed a warning about this when the kernel crashes with #UD on a
> system with CONFIG_UBSAN_TRAP=y? It seems pretty unintuitive and
> unhelpful that the kernel just crashes itself with a #UD and no
> further information in this configuration.
> 
> Even just a "WARNING: CONFIG_UBSAN_TRAP active, #UD might be caused by
> that" on every #UD that does not come from a known BUG() location or
> such might be better than nothing...

I've considered it, but usually CONFIG_UBSAN_TRAP isn't accidentally
set. Also, the crash info is something we can get help from on the
compiler side, to mark up where the traps are, similar to what we do
with KCFI, but it hasn't happened yet for x86. For example, arm64
already encodes the details in the trap instruction itself:
https://git.kernel.org/linus/25b84002afb9dc9a91a7ea67166879c13ad82422

> And maybe the Kconfig help text could be clearer on this, too.
> Currently it does say that this turns warnings into "full exceptions
> that abort the running kernel code" but it does not say that the
> exception reporting will become pretty unhelpful, so it's probably not
> really what you'd want for debugging.

Yeah, that's a reasonable change to make. Can you send a patch for this?
I can carry it.

Thanks!

-- 
Kees Cook
