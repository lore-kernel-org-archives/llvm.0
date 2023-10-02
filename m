Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70CD7F2
	for <llvm@lists.linux.dev>; Mon,  2 Oct 2023 07:42:40 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-49a319c9e17so4769944e0c.1
        for <llvm@lists.linux.dev>; Mon, 02 Oct 2023 00:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696232559; x=1696837359; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSh85qp98TAtPCnT67pcz20dczDxxqTD4YcLwPP44io=;
        b=Rtn3FTsX4sX5bVEtkhZxFOgHksIkE6V7jO7UHKvEH72qtVsNavcTBb3LLB+CZ6juAN
         ZcsRR2dpxAgRWBNWtHiwqSRJdMZ7lsaT0lWTpFfejEp007iC5A9UHFGtmEOka8AQ1rag
         PtGpDDKS3oO9Wv+qynZQkH3CpPV19ObGdPbcf5KAx6wSCvn83uHtyFafp6OUT5j61nmQ
         rF3sRxb1Cy6SYeEgwW+5C+rZCkRe2EmeHA5TUA/oKSjouG95YKXKkwBbcLL6BdTWMHKk
         Nxs5tSkrw6KiII6fRN1ZSiPGZW4bUFnBvV6mT6KNLjJ8kR+v6VVhamckjHN2HG6Mqxu6
         p12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696232559; x=1696837359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSh85qp98TAtPCnT67pcz20dczDxxqTD4YcLwPP44io=;
        b=GSxacJf/WiqC8i9DJApn4r+uDhFwl+QSbhc6tikjBvD+7dWNurIWexKXQRndB6VXQd
         Y1CFn6G1tFQzJKknlOCVN6stvHf8E2D/8P7eer2R0EQK7NylkFzg5nNHAv2+W6CYUi4n
         czn0vxwrtCmSZCx5ncE/gp1o9tthV+QkdWBCfWcv9ZR3pAg59CxqDPW4n+l/FbNEX8gI
         T5r/SJgYzu4Cp2c+QCpxtw/NVCr0c6nf7yr/r7VfRa0jOFDJ1k7Xtpj5kWx9IxQAFkGX
         8nETzsZru2NAkIf3CLcXYdsYHWN28gnTS43EjIDTE2YKdv0qr1S2hPlpuaXi6YgV2+Wi
         TWvQ==
X-Gm-Message-State: AOJu0YwvX5vboZA0dETF4AllqMuaM4zMt3jM2R7a0iXJBezhqx/i7nVP
	kvDyavO0K4gVQj7BIrZngzOWN6UyoHGDBXKLZtfSzQ==
X-Google-Smtp-Source: AGHT+IHiH489RsoEvG5mrvyEeCxTptwArpNqWcQAsB6rSnXOWlpgRvQ3FVsqD93DxR1muZRoq/7CFunpI/fq4emM2Mw=
X-Received: by 2002:a1f:ca82:0:b0:496:f00a:88b2 with SMTP id
 a124-20020a1fca82000000b00496f00a88b2mr6397262vkg.7.1696232559619; Mon, 02
 Oct 2023 00:42:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230928194801.2278999-1-mmaurer@google.com>
In-Reply-To: <20230928194801.2278999-1-mmaurer@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 2 Oct 2023 09:42:28 +0200
Message-ID: <CAH5fLgjUa+TRO_xOQp-uRo5wC8+iVgSh+MA573EjfFtiHbA4mg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Respect HOSTCC when linking for host
To: Matthew Maurer <mmaurer@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 28, 2023 at 9:48=E2=80=AFPM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> Currently, rustc defaults to invoking `cc`, even if `HOSTCC` is defined,
> resulting in build failures in hermetic environments where `cc` does not
> exist. This includes both hostprogs and proc-macros.
>
> Since we are setting the linker to `HOSTCC`, we set the linker flavor to
> `gcc` explicitly. The linker-flavor selects both which linker to search
> for if the linker is unset, and which kind of linker flags to pass.
> Without this flag, `rustc` would attempt to determine which flags to
> pass based on the name of the binary passed as `HOSTCC`. `gcc` is the
> name of the linker-flavor used by `rustc` for all C compilers, including
> both `gcc` and `clang`.
>
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

Tested-by: Alice Ryhl <aliceryhl@google.com>
