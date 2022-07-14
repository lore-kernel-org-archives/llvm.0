Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08CD7E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 21:56:31 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id v12so4080291edc.10
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2h7rSRvHiDfpV/JqGRkiaejTHAdpZEG7Nka6Pnjwvpo=;
        b=FAJHcFc6Pyx6GGP8vdmgf+D87FHKZIDU4UUfWsXA0WewkwL17U/1QlPKqu4O/F8LE9
         JfpMTCmZoPBCS8TLm4xmpgZBOQo9wDEYpKkuh3sullDTs4kLFk+Oybo3QTYXyGsvBZDD
         VeeHRypWibElYQzySO6Uhn086bFCNc6RzuQPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2h7rSRvHiDfpV/JqGRkiaejTHAdpZEG7Nka6Pnjwvpo=;
        b=FraEUgm4P93bV/6Bq8cVs7t0K1elvubdlRVlT7uwBJAnKJSeQ/1LJL3I7QSsEKT9Jo
         1qNVjGzUxH3dsTTvJ1SGASUpzidH8dZ+ndcDIiufEVeNDQPdN4iKPnRvEENzzFNPRRiu
         NJSLvdHGRHqliq1C6uqBAL4F1B1BGiAxgYqHjGrv5FUVWLPBUQhzEAWkB7ZJ7BtBl4Mx
         C/NVtgL/0xTQj4OJwUrmfnRYXYRkE+ic7bQetxELIfVfpYiLC7MUYn0wUpULL/bsDnje
         35zfh0QgvjaY6JSqotZTXEZ+Pk9LTsg4KYyFT6XXoS4DcaHhXV2gDPLVvIJw0NJmbvHE
         MH0w==
X-Gm-Message-State: AJIora+Yitxty7MJJnxbch67DIhefE5pn7mZq6Q919TV/XZfU3faqD/4
	ceSHP52h1ZHLbtwEi6bz3F9aUZ+0e2OlXBfaT64=
X-Google-Smtp-Source: AGRyM1t1mPk32rEfb261IeyO/G/cIsJTKwJfcThvnqiT+7OheRsdzfKA0i9J56laBJBebFnqJFNv1g==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id h2-20020a056402280200b0043a909855a0mr14801405ede.179.1657835790012;
        Thu, 14 Jul 2022 14:56:30 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id r1-20020a17090609c100b0072a881b21d8sm1161583eje.119.2022.07.14.14.56.29
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 14:56:29 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id az2-20020a05600c600200b003a301c985fcso1737250wmb.4
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:56:29 -0700 (PDT)
X-Received: by 2002:a7b:cd97:0:b0:3a2:dfcf:dd2d with SMTP id
 y23-20020a7bcd97000000b003a2dfcfdd2dmr16997798wmj.68.1657835788646; Thu, 14
 Jul 2022 14:56:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713152436.2294819-1-nathan@kernel.org> <20220714143005.73c71cf8@kernel.org>
 <CAHk-=wi+O_3+uef45jxj1+GhT+H0vXs9iz8rpjk49vCiyLS4DA@mail.gmail.com>
In-Reply-To: <CAHk-=wi+O_3+uef45jxj1+GhT+H0vXs9iz8rpjk49vCiyLS4DA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Jul 2022 14:56:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjeVbrd3HOMh-t8968pMgZUFs6uP-p45Fn8qr27j8D0aQ@mail.gmail.com>
Message-ID: <CAHk-=wjeVbrd3HOMh-t8968pMgZUFs6uP-p45Fn8qr27j8D0aQ@mail.gmail.com>
Subject: Re: [PATCH v2] x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
To: Jakub Kicinski <kuba@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Borislav Petkov <bp@suse.de>, "the arch/x86 maintainers" <x86@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	stable <stable@vger.kernel.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 14, 2022 at 2:51 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> But if this particular one causes problems for maintainers, I can
> easily just take it right away just cherry-pick it from my own
> test-tree to my "main" tree.

Oh, and as I did that cherry-pick, I suddenly remembered that I think
PeterZ had a slightly different version of it - the one I picked up is
Nathan's "v2".

PeterZ, do you have preferences? I've waited this long, I might as
well wait a bit more before I push out whatever version people prefer.

              Linus
