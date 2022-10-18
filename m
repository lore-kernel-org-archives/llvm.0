Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842914C7C
	for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 15:16:04 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-35befab86a4so139993677b3.8
        for <llvm@lists.linux.dev>; Tue, 18 Oct 2022 08:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hC5+H9wThte8MY69gIx2xqsknF0ksS14sajV6ZapONA=;
        b=pEWnSzUOxXiPxOwCojbHt0Ql7Sdfg1xb/ShpS1y5GaG37LyQxCvdg73JJCCAvqEQNQ
         hwmA00zFIRl6uzKiAw+hTLFaEimqM7wHvuuwrrHiDliuekIv4avtOWHDMy4rK1AwmlWE
         xWHBGazzotTrsg8zHmb3joTQym6/9o7u6FCNFugQZIwv9U85JIJIFqVUKw/AFDfy/5LZ
         eKo3apEZNd1+OeRcvSYYeeHshtUltJXPxQBSVJHuyKUgkeu3z0+FVKz8njYW+CPJ6/pF
         eNB3Z/0zvNza+pGkkr7mC6ajLkZRlphMLN6EHw101qYsFgIC4WHfiJAc6JDjBi3yN204
         ryvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hC5+H9wThte8MY69gIx2xqsknF0ksS14sajV6ZapONA=;
        b=gvscqGzxfJAkv6b5ePNsV4wqIn+mp9HfOr3Lvec54J50m9LVLdwQZSmzg8fNVteobT
         tGb9TINx+gBrGFZLbeQ3bArYmRi4nNKHvk+WAA01Bj3slhLf6jwxRnSTw38zXmgH+ci8
         LCCV+N98rIMrrSafFP/TzEf/7GloPJB2etHRPyrFcqRXApRMelBxncUV7sqv/mRwDmpi
         LweI88BTFfcvkOIPql1x853q9Nk9fSAmfvUHQwiDtRm9tOPq/ugA4hTcSsBOiSo8RG+T
         rLkGgLartF4dNGHkiWcLPARL70cE+uoqxdRYYJKsL1rLDDJ9+N8yXbuLl3haMhuD6Hwz
         9Dxg==
X-Gm-Message-State: ACrzQf3S07juePp27QTzSoqaXFvFnfdDA0Yi0AshFcEcsWLCOibRNtZs
	phgFO7xiX3W+iwVb8YNfNqYA7e0o2+4tlfB/z63I3w==
X-Google-Smtp-Source: AMsMyM7vPdBrkAZHpKMlIc3VWMGVfXuLYdDN8TIrNVr5iRJf0YmFPuPgclnEA3cx2SM+BAgy7G0g8I9KORfaqsqqxdc=
X-Received: by 2002:a81:984a:0:b0:360:daaa:1edf with SMTP id
 p71-20020a81984a000000b00360daaa1edfmr2897339ywg.238.1666106163327; Tue, 18
 Oct 2022 08:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221018102254.2424506-1-ryasuoka@redhat.com>
In-Reply-To: <20221018102254.2424506-1-ryasuoka@redhat.com>
From: Marco Elver <elver@google.com>
Date: Tue, 18 Oct 2022 08:15:26 -0700
Message-ID: <CANpmjNMoZ6X-bPHg3pfWrnBfP-khpwXNvHxxrwXf2R27_PuSZA@mail.gmail.com>
Subject: Re: [PATCH] kcsan: Fix trivial typo in Kconfig help comments
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>
Cc: dvyukov@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Oct 2022 at 03:23, Ryosuke Yasuoka <ryasuoka@redhat.com> wrote:
>
> Fix trivial typo in Kconfig help comments in KCSAN_SKIP_WATCH and
> KCSAN_SKIP_WATCH_RANDOMIZE
>
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>

Reviewed-by: Marco Elver <elver@google.com>

Thanks.

> ---
>  lib/Kconfig.kcsan | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/lib/Kconfig.kcsan b/lib/Kconfig.kcsan
> index 47a693c45864..375575a5a0e3 100644
> --- a/lib/Kconfig.kcsan
> +++ b/lib/Kconfig.kcsan
> @@ -125,7 +125,7 @@ config KCSAN_SKIP_WATCH
>         default 4000
>         help
>           The number of per-CPU memory operations to skip, before another
> -         watchpoint is set up, i.e. one in KCSAN_WATCH_SKIP per-CPU
> +         watchpoint is set up, i.e. one in KCSAN_SKIP_WATCH per-CPU
>           memory operations are used to set up a watchpoint. A smaller value
>           results in more aggressive race detection, whereas a larger value
>           improves system performance at the cost of missing some races.
> @@ -135,8 +135,8 @@ config KCSAN_SKIP_WATCH_RANDOMIZE
>         default y
>         help
>           If instruction skip count should be randomized, where the maximum is
> -         KCSAN_WATCH_SKIP. If false, the chosen value is always
> -         KCSAN_WATCH_SKIP.
> +         KCSAN_SKIP_WATCH. If false, the chosen value is always
> +         KCSAN_SKIP_WATCH.
>
>  config KCSAN_INTERRUPT_WATCHER
>         bool "Interruptible watchers" if !KCSAN_STRICT
> --
> 2.37.3
>
