Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A70B4610
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:17:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A23C340EF
	for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645172279;
	bh=985JkUSSqBbFVhxRLYWrMBKJNtQrzXhfGYWAxKvGD2k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GDpS5aQdX0+PcjsMR4nWvYjgomG6SvCv9AXeneV0V1gKIEZcY2WolYPn/OxaP/742
	 IR6oQBAKYLZ0D4YJjsZqZmlKq8dwzwK/baLUVs1aVeUUJhS6xj3bunSx9zKyJF2hVR
	 KkcLK2tUdWC1VmEgA21X7gJEnoQ1gtuscU7m+5cfdljAyNrJKmw5QjWqHYf+W1+zG1
	 wkWPYI9xglKLY6dolJe1VPCfSV/x2lQVSOt60Mgv9P6nlt7P7UwmOt5FrSjjvdr38A
	 n/PNxEn+ROeKgeHxAd9w6Md4sF1XfbOWoRP2/58b260NtxcKOYTYKik6dXALB5SXpp
	 FdbWZS0JlEmAw==
Received: by mail-wm1-f52.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so5782173wml.5
        for <llvm@lists.linux.dev>; Fri, 18 Feb 2022 00:17:59 -0800 (PST)
X-Gm-Message-State: AOAM533u0FLa04XiDK/gZ5NIulZfZWqAc2FD2+xhWAG513W2vmKyHCm5
	Gi02RFkuN5IhyvNdImqW9TwzLZvKYIbRr6E+Izw=
X-Google-Smtp-Source: ABdhPJygcK+9HPjiV7c9DwLpRitODVPkrvDT03tsroNDlzqHAfUF9g2qwoiJ34Dj1Mdg8SyMda/7xu6nXLX7omU9ASY=
X-Received: by 2002:a1c:2742:0:b0:37b:b481:321f with SMTP id
 n63-20020a1c2742000000b0037bb481321fmr6035958wmn.56.1645172278148; Fri, 18
 Feb 2022 00:17:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220218081209.354383-1-maskray@google.com>
In-Reply-To: <20220218081209.354383-1-maskray@google.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 18 Feb 2022 09:17:46 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGZuOWOPEHv0YSM4GseG2PnTgS8mSLXQ+imo-TN7MmvaQ@mail.gmail.com>
Message-ID: <CAMj1kXGZuOWOPEHv0YSM4GseG2PnTgS8mSLXQ+imo-TN7MmvaQ@mail.gmail.com>
Subject: Re: [PATCH] arm64 module: remove (NOLOAD)
To: Fangrui Song <maskray@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Nathan Chancellor <nathan@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Feb 2022 at 09:12, Fangrui Song <maskray@google.com> wrote:
>
> On ELF, (NOLOAD) sets the section type to SHT_NOBITS[1]. It is conceptually
> inappropriate for .plt and .text.* sections which are always
> SHT_PROGBITS.
>
> In GNU ld, if PLT entries are needed, .plt will be SHT_PROGBITS anyway
> and (NOLOAD) will be essentially ignored. In ld.lld, since
> https://reviews.llvm.org/D118840 ("[ELF] Support (TYPE=<value>) to
> customize the output section type"), ld.lld will report a `section type
> mismatch` error. Just remove (NOLOAD) to fix the error.
>
> [1] https://lld.llvm.org/ELF/linker_script.html As of today, "The
> section should be marked as not loadable" on
> https://sourceware.org/binutils/docs/ld/Output-Section-Type.html is
> outdated for ELF.

This patch lacks a SOB line.

With one added,

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm64/include/asm/module.lds.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
> index a11ccadd47d2..094701ec5500 100644
> --- a/arch/arm64/include/asm/module.lds.h
> +++ b/arch/arm64/include/asm/module.lds.h
> @@ -1,8 +1,8 @@
>  SECTIONS {
>  #ifdef CONFIG_ARM64_MODULE_PLTS
> -       .plt 0 (NOLOAD) : { BYTE(0) }
> -       .init.plt 0 (NOLOAD) : { BYTE(0) }
> -       .text.ftrace_trampoline 0 (NOLOAD) : { BYTE(0) }
> +       .plt 0 : { BYTE(0) }
> +       .init.plt 0 : { BYTE(0) }
> +       .text.ftrace_trampoline 0 : { BYTE(0) }
>  #endif
>
>  #ifdef CONFIG_KASAN_SW_TAGS
> --
> 2.35.1.265.g69c8d7142f-goog
>
