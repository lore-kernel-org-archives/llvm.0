Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550B43D92
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 20:45:18 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-536bbef1c5eso11483917b3.9
        for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 12:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gbwZ7KJxlkNyIKWiZuH4bGbwcOZpsexyARY/sQCYU7Q=;
        b=EM6i17xmf4rHEkb6+ZAxBNfq12n66NGEbB3Bp0oCP6oXSZB+KWXgzh18MCjf8H0KqO
         buVvmlAfgnzYq7uX31oLSJ0w+3QaSYZ7LsPdi7nTrssLwQ8+j5EA9bC/WqcCz4FI4Olh
         Ox67BeF01mkW8yvtN9Z5/uQj2LxLLk1ByRbpIz5qHdqcRL+mirLXAELY4tz3FVU5pb2V
         +HO0kiEcs7n7xPiJwz2paZls62gb7WzQw0CCvRIAyYBUeLZ9dEnA29Xa+DXYQBJmkBVG
         TSgiVJ8a2gDNODRc+UclMPNqKnlCXFLZAW2SeqkdjdgQ+W8nSfg683q6VbHQfQ5WN/K9
         sqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gbwZ7KJxlkNyIKWiZuH4bGbwcOZpsexyARY/sQCYU7Q=;
        b=vz4P05ehA8dsRrhabCMb8STF/2aW1/5WqTjX16pAujKWylgkkO2ekniiCpi9cBeOD9
         Qgrw+1slsmJiRAaV/GAAXczMYXM0rCQePvsp+0QQnZe/Xp6v0jOULjZ2khxZFxpCG50v
         Jae2DhaqxSEqgukQFqW5cdbHKxh973o1ZdWjkRzc96swHS2agVy5XEJOLRHQIwqS0Wxm
         mTy0UmD+Vi484mQW81KlP80etoXLP7rIV4S00qrRVJL2KHHTt4bxvecVHYIrtt5QOb/d
         mQmnMyEMn+hMcO0JpOI/RAlbGcUWurAZhsvIqjiA8UFf27qwl2jJcYo64CcrVQ5Afg1p
         CNAA==
X-Gm-Message-State: AO0yUKVeMFBl1eaKCqu/Gtse9v9TSdxdq20342UyI+WyrubWeXU4fJpl
	sQ/5psFkGM8DBqGJHly3SFKRJwi2wQAEVZW0L3o=
X-Google-Smtp-Source: AK7set84Zz1Zr7T7N8qHPRl6RNV3+nFpbLtN1bYDnhyNzpxCSNaUv0uEVh3ISprN44/2u3gUR//r6clsUubamtYQ/C4=
X-Received: by 2002:a81:af1b:0:b0:533:8080:16ee with SMTP id
 n27-20020a81af1b000000b00533808016eemr5353877ywh.10.1677271517377; Fri, 24
 Feb 2023 12:45:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224135044.2882109-1-conor.dooley@microchip.com> <20230224135044.2882109-3-conor.dooley@microchip.com>
In-Reply-To: <20230224135044.2882109-3-conor.dooley@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 21:45:05 +0100
Message-ID: <CANiq72m1bnHZEd1n+tzaTXYqk8kU83CEPSFO7TBMX44J3poKOw@mail.gmail.com>
Subject: Re: [RFC RESEND 2/2] RISC-V: enable building the 64-bit kernels with
 rust support
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 2:51 PM Conor Dooley <conor.dooley@microchip.com> wrote:
>
> The rust modules work on 64-bit RISC-V, with no twiddling required.
> Select HAS_RUST and provide the required flags to kbuild so that the

HAS -> HAVE

> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
> index 6982b63775da..197919158596 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -15,5 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
>  ============  ================  ==============================================
>  Architecture  Level of support  Constraints
>  ============  ================  ==============================================
> +``riscv``     Maintained        ``rv64`` only.
> +============  ================  ==============================================
>  ``x86``       Maintained        ``x86_64`` only.

I think this separator between rows should not be here (it is not in
`rust-for-linux/rust`). Please see
https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#simple-tables.

Cheers,
Miguel
