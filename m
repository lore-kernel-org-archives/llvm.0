Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CBA3FF5
	for <llvm@lists.linux.dev>; Tue,  5 Oct 2021 00:50:47 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id s75so172463pgs.5
        for <llvm@lists.linux.dev>; Mon, 04 Oct 2021 17:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SEKA9eUvQTNrOEU0fVe9Oqo1M4Yd25Z/pj7b5KUJKIM=;
        b=WWWCnRoDUJPBY3ffxH06sF9uD9/8LAHeZ8/v8jzQmn3oDFDRtqjZjLRsuPlQTzwuXD
         1wH/q28vROmEvvplL7fs98Bp3waAHcYjtqW6AL3lannRpc98Vd0HSVMK6FTYvIGyyezB
         N1TvpFzrCX7j9hw6W9zfVzJLtyXZo9WiPYBvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SEKA9eUvQTNrOEU0fVe9Oqo1M4Yd25Z/pj7b5KUJKIM=;
        b=YvnnCN1vNGRDUi2+keZCsPQ5iH/2noMc0815SlML6oPdkf6Lym2vepGANB0ku3pdxw
         PrX5NoM34+Ha1BZdTHXxij42FIvSTkKXD+NkQkaClXZ6yb+W9FmjA03xjFThH3xAM497
         TX5T8zrF6qjqxeTuQY9otyD1ZWliHV8Qa6lfc1C7Yaj9gOhlzHlsC/kqRNBvcjmUJP2G
         a52SA+6qac8rzlXQJt/ZzOPqJEu4bYLZlmvM9MGWjjVFFvFl8tP8AmV9qoO1yajmqP/h
         w5uQPYt4i2kLz6j4TXORcaiNOPJnX8keYilgg45xvepew7pC4xEml8//SnhzY5tZ0izo
         AYjw==
X-Gm-Message-State: AOAM531rRlpupfRXznIbLeYQNqhdqyJqQrEGjOTs3IV8gs/TIKqsU7O8
	GGmdJxcHqCbTbSig3fYoplXPBg==
X-Google-Smtp-Source: ABdhPJxtStb/HuVbBznifn02CPo2ct45dVitFgpYgXK80binzVlQ/40jVorsYKbUDcKXdgARfQO4bg==
X-Received: by 2002:a63:b448:: with SMTP id n8mr13690353pgu.31.1633395047522;
        Mon, 04 Oct 2021 17:50:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i128sm5884418pfc.47.2021.10.04.17.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 17:50:47 -0700 (PDT)
Date: Mon, 4 Oct 2021 17:50:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ndesaulniers@google.com, akpm@linux-foundation.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux@rasmusvillemoes.dk, nathan@kernel.org, masahiroy@kernel.org,
	joe@perches.com, arnd@kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
Message-ID: <202110041750.C90595D1@keescook>
References: <202109130923.E294BFD5C@keescook>
 <mhng-387507df-2708-4ea1-9854-780fcb35eb1d@palmerdabbelt-glaptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-387507df-2708-4ea1-9854-780fcb35eb1d@palmerdabbelt-glaptop>

On Mon, Oct 04, 2021 at 05:40:42PM -0700, Palmer Dabbelt wrote:
> On Mon, 13 Sep 2021 09:23:45 PDT (-0700), keescook@chromium.org wrote:
> > On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
> > > The minimum supported version of GCC is now 5.1. The check wasn't
> > > correct as written anyways since GCC_VERSION is 0 when CC=clang.
> > > 
> > > Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > > Cc: Albert Ou <aou@eecs.berkeley.edu>
> > > Cc: linux-riscv@lists.infradead.org
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > 
> > Yeah, good catch for Clang too.
> > 
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> Only this patch ended up in my inbox.  Where you guys planning on keeping
> this whole series together, or did you want me to pick this for the RISC-V
> tree?

Linus already merged this series (see d20758951f8f28c0ee1b2a8a6bb8189858083895)

-- 
Kees Cook
