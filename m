Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9576029
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 22:15:13 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id k30so4130404edk.8
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 15:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=my5qru7kqzoTpYDlsQu0xITwTY0Hh5OwELAs4fo4zY8=;
        b=GlxE5oHtW5ud5Gv1JPWcbZYuF3saChl7AfUSHMcR8VnMAQUPu3EyIxoSwUEBh1Hgwk
         HF+iMgE2YpvcbSLjfG3zCrrHZFrev3/gq0aYQDBwtDW0Inkpe4XSpw1hB1mA6Vp2mRr2
         rUZibpS2GWUgVhEDprX250UIjPcUhfUQHcB3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=my5qru7kqzoTpYDlsQu0xITwTY0Hh5OwELAs4fo4zY8=;
        b=iobraIT7xla3ZTFkcU8HY17/7kn9bEEaRsCXEbFeoGfOPXZa1nEzo0DM9ZcmEI84Y6
         RSloqugcEd8QkXYUqdYrd+3SBGg05D3ujKAoABPy/4nwHuwqAd0zpelxM3acnIzmgHaW
         r+nO8LOloKmr2Qpo4VCAM2QhvKwHaZ8S65NA2rhwUkQXZlT9Kn2J3KFwd7fZ0XGIqNVF
         8Ji0DvRuavZI/h8TPiJOPuJ10nsi0xsW9aKZzDOwIqZN3iGoaPxGnc/i7OU45PeraoTk
         nlF6tgnUuiKNkgND/MV59JkNuy/E8MbjRydopWNpWyvtGzEtRDbr1nELeo2qinifU7d5
         YYWQ==
X-Gm-Message-State: AJIora/O1zXh15l7hHALPZXiEDc6EVsK1baDaJKB54UhTpFo5EBvsEOE
	is/1IxdvbCJtrFeCHO5jJ+ImneCOPY7o7367qeA=
X-Google-Smtp-Source: AGRyM1sBIAesuZOr+SSGnxYs5bKRns4XzIWkv6Vl8KYfFTLxqcD8rMoaV9bQx++BEItQ8T4Fo0AASQ==
X-Received: by 2002:a05:6402:280b:b0:437:9efc:a065 with SMTP id h11-20020a056402280b00b004379efca065mr15138056ede.3.1657836911719;
        Thu, 14 Jul 2022 15:15:11 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id o20-20020aa7c7d4000000b0043a587eb95dsm1761741eds.5.2022.07.14.15.15.10
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 15:15:10 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1992810wmb.5
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 15:15:10 -0700 (PDT)
X-Received: by 2002:a05:600c:34c9:b0:3a0:5072:9abe with SMTP id
 d9-20020a05600c34c900b003a050729abemr11134747wmq.8.1657836910095; Thu, 14 Jul
 2022 15:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713152436.2294819-1-nathan@kernel.org> <20220714143005.73c71cf8@kernel.org>
 <CAHk-=wi+O_3+uef45jxj1+GhT+H0vXs9iz8rpjk49vCiyLS4DA@mail.gmail.com> <20220714145652.22cf4878@kernel.org>
In-Reply-To: <20220714145652.22cf4878@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Jul 2022 15:14:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqJFV45497fBfc1HS3Oaoqi3pfenZ0XM3uqFGYz8wTQQ@mail.gmail.com>
Message-ID: <CAHk-=wgqJFV45497fBfc1HS3Oaoqi3pfenZ0XM3uqFGYz8wTQQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
To: Jakub Kicinski <kuba@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Borislav Petkov <bp@suse.de>, "the arch/x86 maintainers" <x86@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	stable <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 2:56 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> I have clang 13, let me double check this fix is enough for the build
> to complete without disabling WERROR.

I have clang 14 locally, and it builds fine with that (and doesn't
build without it).

I actually normally build the kernel with both gcc and clang. My
"upstream" kernel I build with gcc, and then I have my "private random
collection of patches" kernel that I build with clang and that are
just rebased on top of the kernel-of-the-day.

This is all entirely for historical reasons - part of my "private
random collection of patches" used to be the "asm goto with outputs",
which had clang support first.

But then the reason I never even noticed the build breakage with the
retbleed patches until much too late was that those I just had as a
third fork off my upstream kernel, so despite me usually building with
clang too, that only got attention from gcc.

So it's really just a microcosm version of the exact same bigger issue
we always have with those embargoed hw security patches: they end up
missing out on all the usual test environments.

Anyway, I cherry-picked Nathan's patch from my clang tree and pushed
it out as commit db886979683a ("x86/speculation: Use DECLARE_PER_CPU
for x86_spec_ctrl_current").

                 Linus
