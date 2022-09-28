Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AF14C62
	for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 19:00:30 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id r22-20020a9d7516000000b00659ef017e34so8740422otk.13
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=un08nCcMg2c1Bks3IVOtg7+kiIVa7Qq4kDC+GJMXpwI=;
        b=WvOhAv7ka7uu1ZxTrSvTuloMqcxvP/WvnrE9siyfWUbmT7s+0yjpuLw1ZrdYRkWbMJ
         9Gc/xJbpomgRAOWWoaZ6fI84rffSZQtmmnZqAeQTE2wLdA4alNEz7rEfwlbbhPxhnPdc
         C7ie0l/WkYdXkgLph2wxwJyati7fTe7uzlshY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=un08nCcMg2c1Bks3IVOtg7+kiIVa7Qq4kDC+GJMXpwI=;
        b=71qL1jh+M8ioKtolWLiRHGc1ulb8/N/GDBEx/wEjWMJWruPAhlsLj0geR1GQgotKnj
         vYHEZBOzYlpd3WZc2qoMGh+pOnsHyvZYfsewDrY6fvUK/NsvJya+yIAM/9Cuo6xin6Cj
         ghqO+W5E+wNPQzn+cGfJE0EPNUaPZw/VCvScqUbVJZInFNTg3huosNwmDNEICK9YVpWq
         bgi27kbeoyORtCziJAqDdu/s22CU6tkssBtW9keU9Dan9f+uabyjomJJULbqWqr79x7a
         ex67wjB8JtTQZord42Ev2wedy/Z4IpOoM67w4e9SlSu5CQ7AMv67N1xuI0uDLpUgN6h7
         sA1g==
X-Gm-Message-State: ACrzQf1t+cixRKJlkWIzS451Mss+pF6fPtznGkxt+9nLj1Bwu79QkFcg
	4btP3RppPFU28NDpk599J+d8OF01j812KQ==
X-Google-Smtp-Source: AMsMyM67fRKCzbJEuWEMgsq+UkmflE7+lO+OoaBvb5qm6wwhbmac4Xx6orfcjMXF6VaTA3G5z7lQQA==
X-Received: by 2002:a9d:150:0:b0:659:f778:3b90 with SMTP id 74-20020a9d0150000000b00659f7783b90mr14745021otu.183.1664391628678;
        Wed, 28 Sep 2022 12:00:28 -0700 (PDT)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id z89-20020a9d24e2000000b00636eeba9209sm2483926ota.52.2022.09.28.12.00.27
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 12:00:27 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-13189cd5789so6707967fac.11
        for <llvm@lists.linux.dev>; Wed, 28 Sep 2022 12:00:27 -0700 (PDT)
X-Received: by 2002:a05:6870:c888:b0:12c:7f3b:d67d with SMTP id
 er8-20020a056870c88800b0012c7f3bd67dmr6575667oab.229.1664391627405; Wed, 28
 Sep 2022 12:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202209271333.10AE3E1D@keescook> <20220927210248.3950201-1-ndesaulniers@google.com>
 <a753c608-813a-f880-67ca-f16fe503b152@rasmusvillemoes.dk>
In-Reply-To: <a753c608-813a-f880-67ca-f16fe503b152@rasmusvillemoes.dk>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Sep 2022 12:00:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgFM3zjzWC44iPuRiAe9VYamU931nSGDCHQ8Q3B9087Wg@mail.gmail.com>
Message-ID: <CAHk-=wgFM3zjzWC44iPuRiAe9VYamU931nSGDCHQ8Q3B9087Wg@mail.gmail.com>
Subject: Re: [PATCH v3] x86, mem: move memmove to out of line assembler
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <keescook@chromium.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 28, 2022 at 12:24 AM Rasmus Villemoes
<linux@rasmusvillemoes.dk> wrote:
>
> > +     /*
> > +      * movs instruction have many startup latency
> > +      * so we handle small size by general register.
> > +      */
> > +     cmpl    $680, n
> > +     jb      .Ltoo_small_forwards
>
> OK, this I get, there's some overhead, and hence we need _some_ cutoff
> value; 680 is probably chosen by some trial-and-error, but the exact
> value likely doesn't matter too much.
>
> > +     /*
> > +      * movs instruction is only good for aligned case.
> > +      */
> > +     movl    src, tmp0
> > +     xorl    dest, tmp0
> > +     andl    $0xff, tmp0
> > +     jz      .Lforward_movs
>
> But this part I don't understand at all. This checks that the src and
> dest have the same %256 value, which is a rather odd thing,

Both of these checks basically reflect the time the original code was
added, back in 2011, and are basically "that was the "rep movs
implementation of the time".

Neither of them is very relevant today, and not the right way to check
anyway (ie FSRM should replace that test for 680 bytes etc).

But fixing the code to check the right things should probably be a
separate issue from the "move from inline asm to explicit asm", so I
think the patch is right this way.

                    Linus
