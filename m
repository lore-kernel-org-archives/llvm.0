Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC7C12F
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 18:58:08 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6418d8a659fso12610536d6.0
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 11:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692039487; x=1692644287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oac1NakR4+HaQnJJS2KWoIl9BhM/PnITDXJaAOB1MhA=;
        b=KCQ/YHJETF/2Df9lkPM1TTVA7PA0w1q72mWHR4hS1h41MeLVSVpKsp3CBY9hITwGqK
         ownUaLQqz1gUDeCDtbmGfbE/a/OjIJQAcWLh8rCeKOybhW79U5CuO8POtNnsvXt92dIc
         lL8oK3egA15RsuGjUwIAMd1M56ljwg19utRJjeaUrYJ6vVGPO2n/m941+3xHMdpoiLPM
         R51H+/aEvwWTbLtur1yzV+lqAeXW0UxHIFnSck7ADZg4PZLkuvl+IsYjRaVO9IAIlE8Z
         6/wmM1SBVdZLB9EGtXTovRvQeJBM8n1y3DupVKEdzw0YeZRpn6FplAN+ktXOgmXTfiY6
         Wokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692039487; x=1692644287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oac1NakR4+HaQnJJS2KWoIl9BhM/PnITDXJaAOB1MhA=;
        b=ROvxCsEfO8/c53oTyZtiCuDik4wO32Nq9j+IilecMC5qgKyg0xnwutNmmsFTDMbmFI
         s1N+mgpakG5awjx59iOUXywYm9gJ1xCZx3xKCkg0LRGY0SQlgZ+YTQtDjyw9uIUHTcql
         sd+hiXR381B9Fze7ctHzsIUnogLoF0HNBedrqI0opbyyY1HJqwc4oMhyMicJ9G/fplMa
         IYUDXxWaYXAQe4mrkXLCzRgms/XGGO96v9a0h9yu6DuOnhl2+IQfOpS5TUVVTpowBy65
         ql6AIa9OVeKNdJ3wpmn5n5gfupugTOxXWixchdpd1VHyZCZ4KXJJtBzOC+SwEbpm+zqt
         xmKw==
X-Gm-Message-State: AOJu0YycaTSinzMjoWqt6alj7lWykD0DAVggtMArmgPzmoWfNupw+W8a
	1bgyQ+5zjd/m9OpWFhoByQZJmHtpP7+ahiPFY3ib+g==
X-Google-Smtp-Source: AGHT+IE32kh7x2+dcklNNiRoqDp5BNyANmBCjjAzTj/cO0aLBpoCCh6CXSViX91o9TRqjJ6Mf8Rp18OSE3KZcedzIOs=
X-Received: by 2002:a0c:b317:0:b0:63c:f0f9:fedf with SMTP id
 s23-20020a0cb317000000b0063cf0f9fedfmr6421263qve.4.1692039487497; Mon, 14 Aug
 2023 11:58:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230811233556.97161-7-samitolvanen@google.com>
 <20230814175928.GA1028706@dev-arch.thelio-3990X> <202308141131.6B90A4205@keescook>
In-Reply-To: <202308141131.6B90A4205@keescook>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Aug 2023 11:57:30 -0700
Message-ID: <CABCJKueV8N4pDBFmw0aWn3wqeyjWUVTGotiC-gjMohJtw=_97Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: SCS support
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Fangrui Song <maskray@google.com>, linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 14, 2023 at 11:33=E2=80=AFAM Kees Cook <keescook@chromium.org> =
wrote:
>
> On Mon, Aug 14, 2023 at 10:59:28AM -0700, Nathan Chancellor wrote:
> > Hi Sami,
> >
> > On Fri, Aug 11, 2023 at 11:35:57PM +0000, Sami Tolvanen wrote:
> > > Hi folks,
> > >
> > > This series adds Shadow Call Stack (SCS) support for RISC-V. SCS
> > > uses compiler instrumentation to store return addresses in a
> > > separate shadow stack to protect them against accidental or
> > > malicious overwrites. More information about SCS can be found
> > > here:
> > >
> > >   https://clang.llvm.org/docs/ShadowCallStack.html
> > >
> > > Patch 1 is from Deepak, and it simplifies VMAP_STACK overflow
> > > handling by adding support for accessing per-CPU variables
> > > directly in assembly. The patch is included in this series to
> > > make IRQ stack switching cleaner with SCS, and I've simply
> > > rebased it. Patch 2 uses this functionality to clean up the stack
> > > switching by moving duplicate code into a single function. On
> > > RISC-V, the compiler uses the gp register for storing the current
> > > shadow call stack pointer, which is incompatible with global
> > > pointer relaxation. Patch 3 moves global pointer loading into a
> > > macro that can be easily disabled with SCS. Patch 4 implements
> > > SCS register loading and switching, and allows the feature to be
> > > enabled, and patch 5 adds separate per-CPU IRQ shadow call stacks
> > > when CONFIG_IRQ_STACKS is enabled.
> > >
> > > Note that this series requires Clang 17. Earlier Clang versions
> > > support SCS on RISC-V, but use the x18 register instead of gp,
> > > which isn't ideal. gcc has SCS support for arm64, but I'm not
> > > aware of plans to support RISC-V. Once the Zicfiss extension is
> > > ratified, it's probably preferable to use hardware-backed shadow
> > > stacks instead of SCS on hardware that supports the extension,
> > > and we may want to consider implementing CONFIG_DYNAMIC_SCS to
> > > patch between the implementation at runtime (similarly to the
> > > arm64 implementation, which switches to SCS when hardware PAC
> > > support isn't available).
> >
> > I took this series for a spin on top of 6.5-rc6 with both LLVM 18 (buil=
t
> > within the past couple of days) and LLVM 17.0.0-rc2 but it seems that
> > the CFI_BACKWARDS LKDTM test does not pass with
> > CONFIG_SHADOW_CALL_STACK=3Dy.
> >
> >   [   73.324652] lkdtm: Performing direct entry CFI_BACKWARD
> >   [   73.324900] lkdtm: Attempting unchecked stack return address redir=
ection ...
> >   [   73.325178] lkdtm: Eek: return address mismatch! 0000000000000002 =
!=3D ffffffff80614982
> >   [   73.325478] lkdtm: FAIL: stack return address manipulation failed!
> >
> > Does the test need to be adjusted or is there some other issue?
>
> Does it pass without the series? I tried to write it to be
> arch-agnostic, but I never tested it on RISC-V. It's very possible that
> test needs adjusting for the architecture. Besides the label horrors,
> the use of __builtin_frame_address may not work there either...

Looks like __builtin_frame_address behaves differently on RISC-V.
After staring at the disassembly a bit, using
__builtin_frame_address(0) - 1 instead of + 1 seems to yield correct
results. WIth that change, here's the test without SCS:

# echo CFI_BACKWARD > /sys/kernel/debug/provoke-crash/DIRECT
[   16.272028] lkdtm: Performing direct entry CFI_BACKWARD
[   16.272368] lkdtm: Attempting unchecked stack return address redirection=
 ...
[   16.272671] lkdtm: ok: redirected stack return address.
[   16.272885] lkdtm: Attempting checked stack return address redirection .=
..
[   16.273384] lkdtm: FAIL: stack return address was redirected!
[   16.273755] lkdtm: This is probably expected, since this kernel
(6.5.0-rc5-00005-g5a1201f89265-dirty riscv64) was built *without*
CONFIG_ARM64_PTR_AUTH_KERNEL=3Dy nor CONFIG_SHADOW_CALL_STACK=3Dy

And with SCS:

# echo CFI_BACKWARD > /sys/kernel/debug/provoke-crash/DIRECT
[   17.429551] lkdtm: Performing direct entry CFI_BACKWARD
[   17.430184] lkdtm: Attempting unchecked stack return address redirection=
 ...
[   17.431402] lkdtm: ok: redirected stack return address.
[   17.432031] lkdtm: Attempting checked stack return address redirection .=
..
[   17.432861] lkdtm: ok: control flow unchanged.

Sami
