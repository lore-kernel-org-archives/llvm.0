Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F647E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 21:52:13 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id m16so4063766edb.11
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gCwGv/e/gf0C6iderKEIRJdi0X+OWhvleA0ffjecAUA=;
        b=dxV59InvESm2MJqKBf3+U1Ds3/hawDeEnGZ38sSmB5Il756bzpwxIre3Atc0Q1lkzC
         hyBFGJ3TV2g0q8oktcCZOMFI8cRxHm73bG0bhfMCqzN/UjJnIR7jKT4a9XBskQw9dd6h
         OqDy+jIwcgGlmmWZTsqokmdOnUKSxRvScSSq0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gCwGv/e/gf0C6iderKEIRJdi0X+OWhvleA0ffjecAUA=;
        b=1NN/oRzL7OPyfndpsvMBmjkpXwAAySTGOgbaZGBWdINs2Gx0Lf3bmGYwkftabwWr9l
         39G1jQG3Cazszv3VgbJWb/9HkV2zn0Pl0phbImmsbLiQjPBepgPG9ldd21z9GhK6dUzt
         4Z4T6EZ+MJKEUQJKBC+G02XfwkwzEb5wc5IVMzZA0r/iL+HJjFiN3QcOsyQloyd/4SS1
         tQFMsGyQ9FeuSaH4YHgdPRcgRR1JDjYeCXCrCti0JP7elEGj6GIHiqWVgzHXcwJa1Khl
         zG+Va7zwY6pYwjwx2rtImgWG5KFc+jDKIVugmrfVMW86AAKvzXHgBDPYDBfps/kAM+9A
         UoQA==
X-Gm-Message-State: AJIora/mzJbzn1FhjQv1LdsThWqNnIhcJvQ8YmLKqiyiOC/7Jk+g3/ab
	Wq3R1ibFeb6QiY0OKwU0fvXUA9CWpVQojacBxBU=
X-Google-Smtp-Source: AGRyM1tNvTkrwo0y3GHAyiYGaUxBYUCyJYg9b0NAPTYxlmT7GQ+PawabXj8O32e2KNqtDmK1SCHU8A==
X-Received: by 2002:a05:6402:1741:b0:433:4e4d:bfb4 with SMTP id v1-20020a056402174100b004334e4dbfb4mr14909875edx.7.1657835531939;
        Thu, 14 Jul 2022 14:52:11 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id la15-20020a170907780f00b0072aeda86ac3sm1193510ejc.149.2022.07.14.14.52.09
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 14:52:09 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id v16so4270728wrd.13
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:52:09 -0700 (PDT)
X-Received: by 2002:a5d:544b:0:b0:21d:70cb:b4a2 with SMTP id
 w11-20020a5d544b000000b0021d70cbb4a2mr9822619wrv.281.1657835528671; Thu, 14
 Jul 2022 14:52:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713152436.2294819-1-nathan@kernel.org> <20220714143005.73c71cf8@kernel.org>
In-Reply-To: <20220714143005.73c71cf8@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Jul 2022 14:51:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi+O_3+uef45jxj1+GhT+H0vXs9iz8rpjk49vCiyLS4DA@mail.gmail.com>
Message-ID: <CAHk-=wi+O_3+uef45jxj1+GhT+H0vXs9iz8rpjk49vCiyLS4DA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
To: Jakub Kicinski <kuba@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Borislav Petkov <bp@suse.de>, "the arch/x86 maintainers" <x86@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	stable <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 2:30 PM Jakub Kicinski <kuba@kernel.org> wrote:
>
> Hi, sorry to bother, any idea on the ETA for this fix getting into
> Linus's tree? I'm trying to figure out if we should wait with
> forwarding the networking trees or this will take a while.

Well, I have that patch by now in my own clang tree, but was holding
it off just because I was expecting a few other fixes for the fallout.

But if this particular one causes problems for maintainers, I can
easily just take it right away just cherry-pick it from my own
test-tree to my "main" tree.

            Linus
