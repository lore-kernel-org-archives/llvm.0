Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF254BD4
	for <llvm@lists.linux.dev>; Wed,  4 Sep 2024 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725437572; cv=none; b=jFe9VRuZ0O9++XmEu/rCRWWZwgMbMKAbgcrLDLS7lCfx41wYN2KwEi1DWTdWqb7S2T6IEu3IvdfxpJQIHrlV/tCbQSfUCBkaJ2KXqrxecntXCemb+C4RLbwOiVqLiigG44W4fyWqy+ErAyEHl4NvkInenPxK/o5sBIlDKLK4b4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725437572; c=relaxed/simple;
	bh=65cQQU+M2UnU5X6Ms72kWMCyjT6kucVE8wcCMX9suS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7ndvaPooswlfkxcgYQaJtxxdaLoZTRJuLt6IEpqSs10Xc23TOjk4EhxY0IxlonuiSZ7hJ1KNjmX0hCxtuTGbLimiNr2p5saIZeTsun1F2SPnImAc6v6EAB8BuwKQrEVBoYZ7004nACoZhyT5gkEPEXvrDFJwY8HrZ8Ik3v/Mjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e17c1881a52so331743276.0
        for <llvm@lists.linux.dev>; Wed, 04 Sep 2024 01:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725437568; x=1726042368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mclf5cWZ7doo82bxSJ1tInXWyUxki/hxkifyVYswtWM=;
        b=B0Um/+7tq/Fnn8F2agiS4o6+ThkMFeODQANLjzZUHb2qdj5nv/k5L108gWR7c9Tr6m
         sA16QbjhSY6f7vRegLcDMHIN5OgtcAjhLk7D+RyrKekRseH1AtfpwjBlhClqc4Hyb5Wg
         637S3je+47snvoxntn0taur72VDP0nEA86OOBHdKWn9VdZ9WTe6ZxN9zv0WXzM5HZRed
         k/tJjS7qY80zGuAt0GFKH+U4mIH3ng7mBZrYDUHaMu4/BOmJzsGnxmhPikr0I3naPnrB
         ZhSXJLZgJd6f2y1z85kPMzM4QYwkuzM0udXkRb+ohaCKLfa61HTljhmeG1YS/Q1pd05J
         Hs+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXo70hKpsPz9aFftMRQz7A1Xok+h78JxD7+Zzr4RE167iziTSP9qhlvzR9n1TzFnFjBs1T@lists.linux.dev
X-Gm-Message-State: AOJu0YwifaMZko04tnvhQMvqN7Nn1yVQhWsbu+aFFB2Xz1doC6BB0ESl
	GHJBVEOcnZgBZa43xYaFn6+o8GYeAsUflIlUnHMsWA1u/+yaAlW3GWjL4fQ+
X-Google-Smtp-Source: AGHT+IEOf0jwBxP9i3Pmm/il46J2RJGNQzhx/araHTTsiWVpZVFej03owTh2DuJlD0Y81nGkyobNag==
X-Received: by 2002:a05:6902:1612:b0:e0e:8740:2a76 with SMTP id 3f1490d57ef6-e1d108ac5f4mr850036276.26.1725437568186;
        Wed, 04 Sep 2024 01:12:48 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e1a626f874dsm2443524276.56.2024.09.04.01.12.46
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 01:12:47 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6d7073a39dcso3986297b3.1
        for <llvm@lists.linux.dev>; Wed, 04 Sep 2024 01:12:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUBcuI/ICTKnwI5QotcJIs2v0mNLmYED/Ou+lDr5+vLRYtanf+hAI/7+fdQBhtpzgGwjERG@lists.linux.dev
X-Received: by 2002:a05:690c:680b:b0:664:74cd:5548 with SMTP id
 00721157ae682-6db25f47819mr8680237b3.1.1725437566641; Wed, 04 Sep 2024
 01:12:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240903-mips-rust-v1-0-0fdf0b2fd58f@flygoat.com> <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
In-Reply-To: <20240903-mips-rust-v1-2-0fdf0b2fd58f@flygoat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Sep 2024 10:12:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXC0ZBJibi=60VVG5mW1rwz=VgWxduph7SUxA4uyL5Mvw@mail.gmail.com>
Message-ID: <CAMuHMdXC0ZBJibi=60VVG5mW1rwz=VgWxduph7SUxA4uyL5Mvw@mail.gmail.com>
Subject: Re: [PATCH 2/3] MIPS: Rename mips_instruction type to workaround
 bindgen issue
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiaxun,

Thanks for your patch!

On Tue, Sep 3, 2024 at 7:15=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.com=
> wrote:
> We have a union and a type both named after mips_instruction,
> rust bindgen is not happy with this kind of naming alias.
>
> Given that union mips_instruction is a part of UAPI, the only
> thing we can do is to rename mips_instruction type.
>
> Rename it as mips_insn, which is not conflicting with anything
> and fits the name of header.

Nit: the header is called inst.h, not insn.h.

> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/include/asm/dsemul.h |  2 +-
>  arch/mips/include/asm/inst.h   |  6 +++---

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
