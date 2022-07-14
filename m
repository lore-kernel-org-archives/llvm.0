Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889737E
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 21:25:02 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id bp15so5685961ejb.6
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3t3I9dkeOpZv3dAGJjzgDy35dMg8T+EkyLmF6AEUuHY=;
        b=dfM/p2kaK73Hlj3gYy/B6pQeiTl6yNjenC/l7tWyHXO/NKnlYmKfPFxUnWCALi2Nza
         qBh/ZB/SDONX8G+QlzbRNpr4opolwhsauiPD4PEgBz6DTrBixKZNwJj2dqFTFIprdvAa
         fS3maq4vZY7wJ4sp0qBva9wRpI4kHMcIOecMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3t3I9dkeOpZv3dAGJjzgDy35dMg8T+EkyLmF6AEUuHY=;
        b=VI5oW2L/bxtngZt8/L9UsISP9UmDpqQfPrBLBewj9zLkwkpU04BLcyHz4P9VSgHZDa
         4kQIuvv/wW/dWzc2KKrnKbd/NKlcknM17hwBQr6GpzyEb2Bl05DID18AhamxVvw7efa9
         KJKb8Tb46RABguw3bJb3J4HdJ/o8pbPXzK5B/Pwwre5BKWTgnkQJu0RDsbwnAqYurBGc
         yjSbMk850OE02zMPs11NUBz3mV3zrUDcphAPd5q7xCBJySr1KIyQuuN0UL2fz7NLc/42
         RRh3BfYi3fK6KVpOPSbauqvGvlQKbOk5Xnbr0699W8TSExIZkDiZXfqaq8DHuQPGau4K
         MDMA==
X-Gm-Message-State: AJIora9zAJbxQ0N115OCW/XTpVMqd27KLOVLnL/DVuBWhyKMWSdQQmhp
	+CZAllpA2ub0ZuPfsApbZ2ZKQz30DULULA6SkOw=
X-Google-Smtp-Source: AGRyM1th0iuC1dvkOMS1naDp8TO8NDOoziwPizMu+wOhGCoCDAnNNswIziC8/mGnmyma3BR5WwV55Q==
X-Received: by 2002:a17:907:3fa8:b0:72b:5895:f54f with SMTP id hr40-20020a1709073fa800b0072b5895f54fmr10648917ejc.464.1657833900589;
        Thu, 14 Jul 2022 14:25:00 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id t10-20020a05640203ca00b0043a26e3db72sm1714377edw.54.2022.07.14.14.24.59
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 14:24:59 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id b6so1261655wmq.5
        for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 14:24:59 -0700 (PDT)
X-Received: by 2002:a05:600c:4ec9:b0:3a2:e9bd:fcd9 with SMTP id
 g9-20020a05600c4ec900b003a2e9bdfcd9mr17595143wmq.154.1657833899118; Thu, 14
 Jul 2022 14:24:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220714205646.4023495-1-ndesaulniers@google.com>
In-Reply-To: <20220714205646.4023495-1-ndesaulniers@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 14 Jul 2022 14:24:43 -0700
X-Gmail-Original-Message-ID: <CAHk-=whnndsMXO=32vFn9-Osw4r8-NvROV1rtsbxjw9Uvj1WPA@mail.gmail.com>
Message-ID: <CAHk-=whnndsMXO=32vFn9-Osw4r8-NvROV1rtsbxjw9Uvj1WPA@mail.gmail.com>
Subject: Re: [PATCH] ubsan: disable UBSAN_DIV_ZERO for clang
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Kees Cook <keescook@chromium.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, Marco Elver <elver@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 1:56 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Linus,
> I still think we should add explicit checks to gaurd against divide by
> zero.

I mean, that's what UBSAN_DIV_ZERO is supposed to do.

The fact that clang then messes it up, and turns "I found undefined
behavior" into "I just crashed the machine" is why it needs to be
disabled.

Please conmvince clang people to fix the sanitizer.

  san=C2=B7i=C2=B7tize
  /=CB=88san=C9=99=CB=8Ct=C4=ABz/
  verb
  make clean and hygienic; disinfect.

note how "sanitize" is meant to clean things of undefined behavior.

The way you do that is by warning, and giving it defined behavior. It
really is that simple.

Clang seems to warn and then just turn it into ANOTHER - and much
worse - undefined behavior.

In other words, clang doesn't "sanitize" anything at all. It just
moves the mess around and makes it worse.

                    Linus
