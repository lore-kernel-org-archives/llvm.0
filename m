Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D712F80
	for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 21:33:41 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id b20so1916671lfv.3
        for <llvm@lists.linux.dev>; Tue, 28 Sep 2021 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAK5KWONO/Z7HLFe2Uv80i/fStPUDPzXZXg2mThOE4o=;
        b=vXjvDduX8Iyl6bM/yznsWEvsPMgEbgx9IlDYrdNaTNvP0HMwe129N9WgEzIfyCGNKX
         UFr0ie9SnOxPmXQfypPg3olY5I+3sDILif4FYnDDdACQ1BFkSlunw1sIn7fPN4FuPOcr
         R+uY2KZr6KnLUHt+cXKsXwWU3dLprFgqwLzn0tWG0tf7NIOdrzoLR4WaUOD7a6uxcMJM
         hosBJGe6FfhMWOjprNTQ06w+1vRYVpvjbU5CUkvvfZtJHWXoc0y0Rch4gdCp/9AZxLDw
         fczhVyjJnF/54YWqtyNOtvn+kiuQt8QA830LEFeHsovnNSk8717WpxQM/r+CYNS4yQ31
         goYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAK5KWONO/Z7HLFe2Uv80i/fStPUDPzXZXg2mThOE4o=;
        b=SN4LbyhsFtNE0vi7LBeqd4j1OXh4C8gPqsKHpzmPN77H5Um1XNRuE6QEj2gS/x524X
         h8BYn1k14kN+vSSAhBiiGQ8UZ4jLjCU1bqQiTzf/VFDArWf8npI8Q+ypGwgjnYg4AecC
         Tew2748VqoFoznha0ZTDK/wpQ4gRFx2Jpk/yfe+QrfyrOhqBIPsxtsATjMyG2GZ1wkMt
         LPe3vTw2DExFYccFwe/Sk4SXJ7OjOKs/ePgFH68A3OJU08TPzqMxFhDHgTJtwU7DmLVP
         MXTtPXXmymRzCUT+oe4LL/iIVcHyN7BOuBmO6RuL5vlAf5nZ1nKnevuxielPN5RT6IZ7
         mYcA==
X-Gm-Message-State: AOAM5325X6Z4/dcP5KHVi940+1VeU4SzLnSLewJ06Lcp4opdeXx0g1Yn
	r1LIZRXldDVG7YUKcw1W5+RIUc2WsOVhrxFOoR/FPg==
X-Google-Smtp-Source: ABdhPJzxOmJ4vA/QR0y62A+k8pNNEjGO4hO5qkA0b5HDkhnTghJMoX9c8iVn83p2LEJa2c8W6qfmS+k1z7OJGgZ1FFI=
X-Received: by 2002:a05:6512:e82:: with SMTP id bi2mr7767870lfb.95.1632864819075;
 Tue, 28 Sep 2021 14:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210928154143.2106903-1-arnd@kernel.org> <20210928154143.2106903-3-arnd@kernel.org>
In-Reply-To: <20210928154143.2106903-3-arnd@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Sep 2021 23:33:28 +0200
Message-ID: <CACRpkdY2cjyzCtAwzuOE-4XoGNcxEzP+xEUWmUUs-b9wW+pjsA@mail.gmail.com>
Subject: Re: [PATCH 02/14] ARM: patch: fix BE32 compilation
To: Arnd Bergmann <arnd@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Ard Biesheuvel <ardb@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 5:42 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On BE32 kernels, the __opcode_to_mem_thumb32() interface is intentionally
> not defined, but it is referenced whenever runtime patching is enabled
> for the kernel, which may be for ftrace, jump label, kprobes or kgdb:
>
> arch/arm/kernel/patch.c: In function '__patch_text_real':
> arch/arm/kernel/patch.c:94:32: error: implicit declaration of function '__opcode_to_mem_thumb32' [-Werror=implicit-function-declaration]
>    94 |                         insn = __opcode_to_mem_thumb32(insn);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~
>
> Since BE32 kernels never run Thumb2 code, we never end up using the
> result of this call, so providing an extern declaration without
> a definition makes it build correctly.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
