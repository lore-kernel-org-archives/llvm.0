Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BD37D
	for <llvm@lists.linux.dev>; Tue, 11 Jul 2023 14:39:40 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-579ef51428eso71108377b3.2
        for <llvm@lists.linux.dev>; Tue, 11 Jul 2023 07:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689086379; x=1691678379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KtTSHdQg0YCAtxJ0hEuqKRNYfw6pZc0XMvsle82y98s=;
        b=TLY7AgKRbyH6OnSPJ9DlYOyb0tY23mdMyNZyMPVQJwFRFxmkYyuycEFFv+r/0Cvlfb
         cXnx3pUDbdhdB7JFCxLw/wc6DL1DOGuRiVXpgQnfv4YwuUYgXrKKu7bP/wCEWApMmnKP
         363lfl8o7ZY/Kuwm48ioU2u57auUY5mW0De/lS9s7niiohlZMXlpdHCiMJjD3Ap5VleT
         eOeLUp6uGt9gg36d7ytKY/RoctpWa4iTtqdAY8AW2AOin6OdgNJYcg85NLtjI7XwOcG8
         MEsChbAT2uHZoPFSIR9QSVpHTXER9HL7JpuF7BEMOXCxmsASFZwQY4L9YnZlomyeRaQx
         8K0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689086379; x=1691678379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtTSHdQg0YCAtxJ0hEuqKRNYfw6pZc0XMvsle82y98s=;
        b=b6kB1wCmULEKFz7Ghy41fHee6i2mP1b1h7WQu3D7pjpyMxi5eY6wkoo13QyPU8oVyd
         sFcpOnQ/0TixyMB2gPk+dGUaDEB3DB6HlpKP1cA2rA+duwOQslfA7rU+GLFNZ/N2f5PW
         DHbOgIFL5ZD3u0gE0Owg1tJhAcx6pObNcdNSPBLfZkckGUw9MHa2bBb38vlYbydqW3ag
         5cHlV+OfpI7ZwnZ+jOZUXF90OrMyNd2IVQhZpTXEz33Ng9KJvbPJgjxzqP4e8bPRqLPY
         F4slvZPAl1fUuGN1gJdQwpxL3RY81gD4jpdRRdyl2vY6rlUaodD17GOzr0wZa7M+lJTC
         P6Mw==
X-Gm-Message-State: ABy/qLa/aoJFYBBxQEO4/3RCaP7OPZrLkDHQpYHH5ca8OP0RLz13Owtl
	WkAT+se4+DTb6K7i0++/c1+uqzY0nseAv+UXS98=
X-Google-Smtp-Source: APBJJlHt7LkksBX4dKb9ZjFQYZ4KsGxHurwvB30A58g+4iZVeHoPPXjmuXGg/AHzUHUgF9d+bkWo55Sr+FzdfGbqS+g=
X-Received: by 2002:a0d:fb03:0:b0:565:cf47:7331 with SMTP id
 l3-20020a0dfb03000000b00565cf477331mr19036939ywf.2.1689086379216; Tue, 11 Jul
 2023 07:39:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230704052136.155445-1-andrea.righi@canonical.com>
In-Reply-To: <20230704052136.155445-1-andrea.righi@canonical.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Jul 2023 16:39:27 +0200
Message-ID: <CANiq72k6um58AAydgkzhkmAdd8t1quzeGaPsR7-pS_ZXYf0-YQ@mail.gmail.com>
Subject: Re: [PATCH] btf, scripts: rust: drop is_rust_module.sh
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, bpf <bpf@vger.kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 4, 2023 at 7:21=E2=80=AFAM Andrea Righi <andrea.righi@canonical=
.com> wrote:
>
> With commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> we are now able to use pahole directly to identify Rust compilation
> units (CUs) and exclude them from generating BTF debugging information
> (when DEBUG_INFO_BTF is enabled).
>
> And if pahole doesn't support the --lang-exclude flag, we can't enable
> both RUST and DEBUG_INFO_BTF at the same time.
>
> So, in any case, the script is_rust_module.sh is just redundant and we
> can drop it.
>
> NOTE: we may also be able to drop the "Rust loadable module" mark
> inside Rust modules, but it seems safer to keep it for now to make sure
> we are not breaking any external tool that may potentially rely on it.

Just to recall the history of these changes:

  - The script got added in order to skip the BTF generation in the
`BTF [M]` step (under `DEBUG_INFO_BTF_MODULES`, which depends on
`DEBUG_INFO_BTF`).

  - A few months later, it was noticed that C modules couldn't be
loaded if Rust was enabled, due to the base BTF info in `vmlinux`.
That triggered the eventual addition of `--lang_exclude=3D` to `pahole`,
but meanwhile, we made `DEBUG_INFO_BTF` and `RUST` exclusive.

  - Now, this patch removes the script because having a newer `pahole`
also correctly skips the Rust CUs in the `BTF [M]` steps (i.e. and not
just the `vmlinux` one), since we pass `--lang_exclude=3D` to both cases
(`link-vmlinux.sh` and `Makefile.modfinal`), if I understand correctly
(the script could, in principle, have been removed even before
`pahole` got the new feature, given the exclusivity of the options).

If this is all correct, then the patch looks good to me. I am Cc'ing
Arnaldo, Martin and the BPF list.

If this goes through the Rust tree, I will also pick the older `Reviewed-by=
`s.

Thanks!

Cheers,
Miguel
