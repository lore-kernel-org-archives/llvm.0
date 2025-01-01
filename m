Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4988529415
	for <llvm@lists.linux.dev>; Wed,  1 Jan 2025 08:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735718523; cv=none; b=gLjXqpr8n5zSJ9BQZMuD183n6q10GEypWEkoZHMoeZ3j6u8hZukluV1R7nar1Fu65qJTU09yxM6vNKcYwcu9esl8WPsXy5XUO/3BdG2DmJRIwAacGdAfSaoCZA5gCtQ995RC5OhsstGlE28m1+otC0FGKbD2ig0ubFAMQHTXCxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735718523; c=relaxed/simple;
	bh=vEe5/mNBibxcjWyJBo3RvRPPwKEWAeajnNVutiMLb68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm9i31Re8cQviv1bemjuKxRn84jq90piQ5hYT3KVr7zaDCUn/iz9/qicEHE9NZrLOysDkYXEKR3GEbiZEQ2exh8J0tQtCdPwB0ijhY/u5w/NaAhMzqfP7akKjiattuL8He5inRWZICBYMqYFkYWNrPJOoWdFnYMx0slhby0034M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMBxIM66; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMBxIM66"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E4D5C4CEE2
	for <llvm@lists.linux.dev>; Wed,  1 Jan 2025 08:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735718523;
	bh=vEe5/mNBibxcjWyJBo3RvRPPwKEWAeajnNVutiMLb68=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oMBxIM66ybSwMB0JGHJrXNTDkAwb7gvzZ7MOyw1qzTjFCIqCpNSIW5NSDbWhKFCkv
	 YdjmELWeXficgOMe4e6rBAgDjNkNwC7mdRPk+6Rrkdq8ep4+Qe3DPq13MSmlFm/Q3s
	 NnNOmt/2zxl39FE8RuxpzO2KiIoJabddF69zbVbWxvFpRzv/EpHg67bVD/HJBhQOUQ
	 K4lq9vA4XKM0TwNe+LGSCHx16Ezs4GdzuNaOmzbM2S8aEWNaJDCTB60cUSNKusOL6j
	 E6eZJMCw41bqGvp+Il0RFzp/tdMpu6x8qzMUOkmmkyvgPpnIq0vmWhiTpFdxMf58gw
	 mXkF/WA1SZkGQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-540201cfedbso11062415e87.3
        for <llvm@lists.linux.dev>; Wed, 01 Jan 2025 00:02:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+a19KDbl8xYHS2y4nQnp/Trr/6zk/Hiw5TGdYw4GCVDiHKpJGhBuTA5SXKMSYYH7vZ6gM@lists.linux.dev
X-Gm-Message-State: AOJu0Yya+lxgP8ppyN+eu3yh79/drxbtlv9lnF8KRb+n4slc4oeywc9C
	g6WVrhBYPSNDZJ8drcNQFst8hclx60ratB7rJwc9W0/1wjoi3K3SXC8pWXtb+S+KVJskUXzKwVX
	czGHNyenONSszlXder4sElsF42IM=
X-Google-Smtp-Source: AGHT+IFgK+EdEVutPQJnaHjPDyU5F6YYupfsxG09JiPC4AMSuGBPrm3D/kRFL8UJvYxwQ3bZbf0lvPpCCf+7T0fU7K4=
X-Received: by 2002:a05:6512:1391:b0:540:1b2d:8ee2 with SMTP id
 2adb3069b0e04-54229524fddmr13868076e87.6.1735718521258; Wed, 01 Jan 2025
 00:02:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241205112804.3416920-9-ardb+git@google.com> <20241231100137.GBZ3PBAdixv2CR_H9C@fat_crate.local>
 <CAMj1kXGAEc92TfEO-i+9SAmsso-NqqX1HbqFf49CC-QbOmpT1w@mail.gmail.com>
 <20241231103510.GCZ3PI3gSuuDzkG1q4@fat_crate.local> <CAMj1kXEj7-PadFJ57uYUTC_TCicX6E56rSiEF8Rr9_vH_G8PoA@mail.gmail.com>
 <20250101024348.GA1828419@ax162>
In-Reply-To: <20250101024348.GA1828419@ax162>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 1 Jan 2025 09:01:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHqV6eQCnfFsj1Pi-A1oXfC_ZM8t5FL22NOLm96tu2qMQ@mail.gmail.com>
Message-ID: <CAMj1kXHqV6eQCnfFsj1Pi-A1oXfC_ZM8t5FL22NOLm96tu2qMQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] x86: Rid .head.text of all abs references
To: Nathan Chancellor <nathan@kernel.org>
Cc: Borislav Petkov <bp@alien8.de>, clang-built-linux <llvm@lists.linux.dev>, 
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Tom Lendacky <thomas.lendacky@amd.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, 
	Brian Gerst <brgerst@gmail.com>, Kevin Loughlin <kevinloughlin@google.com>, 
	linux-toolchains@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 1 Jan 2025 at 03:43, Nathan Chancellor <nathan@kernel.org> wrote:
>
> Hi Ard,
>
> On Tue, Dec 31, 2024 at 08:29:17PM +0100, Ard Biesheuvel wrote:
> > (cc Nathan)
>
> Thanks for the CC.
>
> > On Tue, 31 Dec 2024 at 11:35, Borislav Petkov <bp@alien8.de> wrote:
> > >
> > > On Tue, Dec 31, 2024 at 11:12:55AM +0100, Ard Biesheuvel wrote:
> > > > I'll look into this asap, i.e., in a couple of days.
> > >
> > > :-P
> > >
> > > Thanks!
> > >
> >
> > I had a quick look, and managed to reproduce it with Clang 14 but not
> > with Clang 18.
> >
> > It looks like UBSAN is emitting some instrumentation here, in spite of
> > the __no_sanitize_undefined annotation (via __head) on
> > pvalidate_4k_page():
> >
> > arch/x86/coco/sev/core.o:
> >
> > 0000000000000a00 <pvalidate_4k_page>:
> >  ...
> >  b72:   40 88 de                mov    %bl,%sil
> >  b75:   48 c7 c7 00 00 00 00    mov    $0x0,%rdi
> >         b78: R_X86_64_32S       .data+0xb0
> >  b7c:   e8 00 00 00 00          callq  b81 <pvalidate_4k_page+0x181>
> >         b7d: R_X86_64_PLT32     __ubsan_handle_load_invalid_value-0x4
> >
> > So as far as this series is concerned, things are working correctly,
> > and an absolute reference to .data is being flagged in code that may
> > execute before the absolute address in question is even mapped.
>
> It appears that this is related to UBSAN_BOOL. This is reproducible with
> just:
>
> $ echo 'CONFIG_AMD_MEM_ENCRYPT=y
> CONFIG_UBSAN=y
> CONFIG_UBSAN_BOOL=y
> # CONFIG_UBSAN_ALIGNMENT is not set
> # CONFIG_UBSAN_BOUNDS is not set
> # CONFIG_UBSAN_DIV_ZERO is not set
> # CONFIG_UBSAN_ENUM is not set
> # CONFIG_UBSAN_SIGNED_WRAP is not set
> # CONFIG_UBSAN_SHIFT is not set
> # CONFIG_UBSAN_TRAP is not set
> # CONFIG_UBSAN_UNREACHABLE is not set' >kernel/configs/repro.config
>
> $ make -skj"$(nproc)" ARCH=x86_64 LLVM=1 mrproper defconfig repro.config vmlinux
> Absolute reference to symbol '.data' not permitted in .head.text
> make[5]: *** [arch/x86/Makefile.postlink:32: vmlinux] Error 1
> ...
>
> Given that this appears in LLVM 14 but not LLVM 15 and newer, I reverse
> bisected the fix in LLVM to [1], which was actually a fix from a report
> from Linus [2]. That seems like a reasonable change to blame, as UBSAN
> is generating this check from the asm() in pvalidate() and after the
> LLVM fix, that check is no longer generated.
>
> It does seem fishy that __no_sanitize_undefined does not prevent the
> generation of that check... Plugging Linus's original reproducer from
> [2] into Compiler Explorer [3], it seems like __no_sanitize_undefined
> does get respected. It is my understanding that inlining functions that
> do not have attributes that disable instrumentation into ones that do is
> supposed to remove the instrumentation, correct? It seems like
> pvalidate() does get inlined into pvalidate_4k_page() but the
> instrumentation remains. Explicitly adding __no_sanitize_undefined to
> pvalidate() hides this for me.
>

Thanks for the analysis.

Should we perhaps just add the below? All the other sanitizers are
already disabled for core.o, which is the only object file being built
in this sub-directory.

--- a/arch/x86/coco/sev/Makefile
+++ b/arch/x86/coco/sev/Makefile
@@ -13,3 +13,5 @@ KCOV_INSTRUMENT_core.o        := n
 # With some compiler versions the generated code results in boot hangs, caused
 # by several compilation units. To be safe, disable all instrumentation.
 KCSAN_SANITIZE         := n
+
+UBSAN_SANITIZE         := n
