Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD137F
	for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 18:50:59 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id e141so6063241ybh.3
        for <llvm@lists.linux.dev>; Fri, 25 Nov 2022 10:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QlXZSq63uGUHYf3xEcy5GQyj8k3wzV3aaEBxQdNWSY4=;
        b=Ru0IfZVgDAD8+P3Vd/Cj6cxPxF1il1m19ndBb00b7fH4eUv5LyC2DmjHZHb/moUV8a
         JsHge43IkuVIWxO44XV59e4g09b+Elr2SLBiQ6IncYJ1qCu198pX6dbQvCzxvfKiNRjG
         vMUVcr5U+8Kk9sD8v59zmjFHrsosxLm+CbmQdD8r3TjVTxKRuPXV81ZDSQBaUNHROONl
         0sJ91C8DtHRaoHSPXNEPRQyHQZe2GD6/JLRFVBnyzzpmWc/pzDOp14qCif7nGdWMzb9m
         nX3jSAQdqVCWAjAgn/5l8aaKymxs3OYuzuTQaUoOYnVYES/FgdTTd19Oy2jA8KVKnQt6
         cR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlXZSq63uGUHYf3xEcy5GQyj8k3wzV3aaEBxQdNWSY4=;
        b=vGxyvpRRvj5wfsWcGuDxuJycRmxnjpKFNTZFWUg15hdrdD7PUt+yPwHDCb7a53H+Of
         qQqXBYr/vdIROrtGmgqMrPk+5ENQgcSHXPInGfmpAsj2+0PBMkMQLwB/vGRx7cO0bgCX
         bTjaQT0Bj8rpnfr+eTBYuFFef92lrjaWTa4K66gpS2wP7bb1P1D0yTAOtcYmEUsoTyQO
         qRSvT0UFbrnsL8voEPl1hmOTSSawANj8DKrSaXfiGgO8vKqQWe4RDausvul4nsyOsmTL
         ATrlrS2Eu4VI4n003hppK33Um9Yilax8/sl0PvUV2kQbeQfyBvk29KJ1gaWkEiV5i7eQ
         Mq/A==
X-Gm-Message-State: ANoB5pneYN7r1rwgCWN755XqGCxE2FAcLKrszapbs9Q2nONhj+opdiD4
	Uix+EukByFxA4TIA/r2cB0lH3jAO7mepePIJfWw=
X-Google-Smtp-Source: AA0mqf6XrludxqskbuOzV8FiitKfkb9O012hOxOMjMob+MhSVyQo30OjRMO2zb8ZSrAvK81lTzgc9Zh74jFhbyh+76s=
X-Received: by 2002:a25:ca58:0:b0:6f4:3ced:f7f8 with SMTP id
 a85-20020a25ca58000000b006f43cedf7f8mr68149ybg.489.1669402258512; Fri, 25 Nov
 2022 10:50:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221125154947.2163498-1-Liam.Howlett@oracle.com>
In-Reply-To: <20221125154947.2163498-1-Liam.Howlett@oracle.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 25 Nov 2022 19:50:47 +0100
Message-ID: <CANiq72ntFXb+ZhBqgBAMu2n8wcgJLZRZC1rmBVvL5m+K1Nhw2w@mail.gmail.com>
Subject: Re: [PATCH] tools: Rename __fallthrough to fallthrough
To: Liam Howlett <liam.howlett@oracle.com>
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	"linux-sparse@vger.kernel.org" <linux-sparse@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 25, 2022 at 4:50 PM Liam Howlett <liam.howlett@oracle.com> wrote:
>
> Rename the fallthrough attribute to better align with the kernel
> version.  Copy the definition from include/linux/compiler_attributes.h
> including the #else clause.  Adding the #else clause allows the tools
> compiler.h header to drop the check for a definition entirely and keeps
> both definitions together.

Thanks for doing this! Consistency with `tools/` is nice to have indeed.

I see that `compiler-gcc.h` is included for Clang too in `tools/`, so
it looks fine to me:

    Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

In the future, it could be nice to enable the warning for Clang too,
though I see it requires a few cleanups.

Another idea is to use something similar to `compiler_attributes.h` in
`tools/` (perhaps just copying it and removing what is not needed?).

Cheers,
Miguel
