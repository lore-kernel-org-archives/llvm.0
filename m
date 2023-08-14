Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FC1C13D
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 18:33:33 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-26b56cc7896so625652a91.3
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 11:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692038013; x=1692642813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J8iwZg12OLuhKmVur/3KwHW/8LJxcNDVt1vwEiERMGA=;
        b=bFFqbLkEpK7yIJMGtIvYU+M+BhgGIQ6EuxXiqxJXKdluI9eyiHNw6zWy58WyqWDYS7
         PNX3Ltz3Hv8rQyoWH1aYcEUjZVJSC6leddeGvziv/G5VPUH+Q4f8oQtHPAa1tXzbHyMw
         xaoKqVMs9yciwG/L14RqjSGjc5vmWl1o/+J2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692038013; x=1692642813;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8iwZg12OLuhKmVur/3KwHW/8LJxcNDVt1vwEiERMGA=;
        b=MvGIsds+Cqi6waFAbaAY/7CY9q9Blvcq2aRr7G0isFCuSIDSnmKTf/GijaH4tF6kIb
         2h8P61nk3mg+HnMFUtYgmhGffPhBwhnYKGYn6KTxN5HaUzl+fcYv1xI6ZkrEF9cyAoue
         K9QNC/3tJfkQzHS/It3KmgKkL2BcZWfC3FHmjBQJct7RCvDTRFr5/awPjUtaV0o8O3zN
         7EElQ/Hnb4CjwxVq8Y9N2p6rSzwSRczzZCf4bbQGhlh4FeKyFeemCIN6tj92WTbzSI/1
         kr4uncZxKWmFcmUqQbPS1I/PBq2rcJnKNVO678buD65HLxPSgLcAzNbmoguClH1durZA
         9OIw==
X-Gm-Message-State: AOJu0YwuHypXU0W9iwsMZKbUKhGqwI32sf6+sdxnbQ/7uMpIfNHMYQNn
	14HsD/W8VisJkxpgiJALjcg77A==
X-Google-Smtp-Source: AGHT+IEklZccVL6cUi3mOUlAJqnCYsINOyo2Bwkp+4IkA+X5znYYwIyoEN7NI88uHvmjTxQq2W/Tqg==
X-Received: by 2002:a17:90a:cb06:b0:26b:2538:d717 with SMTP id z6-20020a17090acb0600b0026b2538d717mr6989311pjt.25.1692038012892;
        Mon, 14 Aug 2023 11:33:32 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090aca8d00b00262eccfa29fsm10161456pjt.33.2023.08.14.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 11:33:32 -0700 (PDT)
Date: Mon, 14 Aug 2023 11:33:31 -0700
From: Kees Cook <keescook@chromium.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] riscv: SCS support
Message-ID: <202308141131.6B90A4205@keescook>
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230814175928.GA1028706@dev-arch.thelio-3990X>

On Mon, Aug 14, 2023 at 10:59:28AM -0700, Nathan Chancellor wrote:
> Hi Sami,
> 
> On Fri, Aug 11, 2023 at 11:35:57PM +0000, Sami Tolvanen wrote:
> > Hi folks,
> > 
> > This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
> > uses compiler instrumentation to store return addresses in a
> > separate shadow stack to protect them against accidental or
> > malicious overwrites. More information about SCS can be found
> > here:
> > 
> >   https://clang.llvm.org/docs/ShadowCallStack.html
> > 
> > Patch 1 is from Deepak, and it simplifies VMAP_STACK overflow
> > handling by adding support for accessing per-CPU variables
> > directly in assembly. The patch is included in this series to
> > make IRQ stack switching cleaner with SCS, and I've simply
> > rebased it. Patch 2 uses this functionality to clean up the stack
> > switching by moving duplicate code into a single function. On
> > RISC-V, the compiler uses the gp register for storing the current
> > shadow call stack pointer, which is incompatible with global
> > pointer relaxation. Patch 3 moves global pointer loading into a
> > macro that can be easily disabled with SCS. Patch 4 implements
> > SCS register loading and switching, and allows the feature to be
> > enabled, and patch 5 adds separate per-CPU IRQ shadow call stacks
> > when CONFIG_IRQ_STACKS is enabled.
> > 
> > Note that this series requires Clang 17. Earlier Clang versions
> > support SCS on RISC-V, but use the x18 register instead of gp,
> > which isn't ideal. gcc has SCS support for arm64, but I'm not
> > aware of plans to support RISC-V. Once the Zicfiss extension is
> > ratified, it's probably preferable to use hardware-backed shadow
> > stacks instead of SCS on hardware that supports the extension,
> > and we may want to consider implementing CONFIG_DYNAMIC_SCS to
> > patch between the implementation at runtime (similarly to the
> > arm64 implementation, which switches to SCS when hardware PAC
> > support isn't available).
> 
> I took this series for a spin on top of 6.5-rc6 with both LLVM 18 (built
> within the past couple of days) and LLVM 17.0.0-rc2 but it seems that
> the CFI_BACKWARDS LKDTM test does not pass with
> CONFIG_SHADOW_CALL_STACK=y.
> 
>   [   73.324652] lkdtm: Performing direct entry CFI_BACKWARD
>   [   73.324900] lkdtm: Attempting unchecked stack return address redirection ...
>   [   73.325178] lkdtm: Eek: return address mismatch! 0000000000000002 != ffffffff80614982
>   [   73.325478] lkdtm: FAIL: stack return address manipulation failed!
> 
> Does the test need to be adjusted or is there some other issue?

Does it pass without the series? I tried to write it to be
arch-agnostic, but I never tested it on RISC-V. It's very possible that
test needs adjusting for the architecture. Besides the label horrors,
the use of __builtin_frame_address may not work there either...

-- 
Kees Cook
