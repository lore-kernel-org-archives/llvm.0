Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381091C07
	for <llvm@lists.linux.dev>; Sat,  8 Apr 2023 13:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFC3FC433A4
	for <llvm@lists.linux.dev>; Sat,  8 Apr 2023 13:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680961323;
	bh=+rvCJwQnhgHtRPTA4FpOWMqeq2UPBg8NLPxv4nEuxX0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j8wXnh8jcxeZy5hlnL9j7yhf1PfZDoBKolcpy8BAI3zytnC6o3YeEcQ21+RGU398S
	 lwlY1lX1+rGmxa3RW1a4ssgZVrMNHXDCC6WIPr8GtoapHSeRq8QJ4+1MkRoPe/q1co
	 pBZRK9TS0XYB4rlCrpX5ng+gaXL15uri2QVjR6Fo1l66G9KP7d7+87JoNRfKRWutR0
	 HW8KaNz2q7SbsqNYO02xV8LQKQ8X11uv0ovd00bz1EsLtjqCS292zKcsS54/wMPkBY
	 +uoYQ0p8nmdgW2/VffK8mE2GMfG1FpQRopt7rW1Yx0C1UStZhRxsOGAwfAxnow3PDU
	 QQ1B9czlK0ofA==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1841c57c221so3545075fac.3
        for <llvm@lists.linux.dev>; Sat, 08 Apr 2023 06:42:03 -0700 (PDT)
X-Gm-Message-State: AAQBX9eK4/qBGpvhQnoEQOAjsqsYg6P13FuLoKBshWlo6Akv+Oepj7vg
	ongGatebluZiesVgB55IU9/CRYz6SBXqh8BwTTY=
X-Google-Smtp-Source: AKy350YM5FAGa/kRWBMoLt816ScO0UDcA4Pm4t4Ada1UZVKLZfKRP4ulOWZgDvkSe3Ul/chuG7STZWY4sSR50yAJtLg=
X-Received: by 2002:a05:6870:1119:b0:17e:d9e2:a55c with SMTP id
 25-20020a056870111900b0017ed9e2a55cmr2268082oaf.11.1680961323046; Sat, 08 Apr
 2023 06:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230407070517.204676-1-andrea.righi@canonical.com>
In-Reply-To: <20230407070517.204676-1-andrea.righi@canonical.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 8 Apr 2023 22:41:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATG0rmbV79Uo8a8mX5uFNn878UbP0BEJ3c=cYSsO_a3ww@mail.gmail.com>
Message-ID: <CAK7LNATG0rmbV79Uo8a8mX5uFNn878UbP0BEJ3c=cYSsO_a3ww@mail.gmail.com>
Subject: Re: [PATCH] scripts: rust: drop is_rust_module.sh
To: Andrea Righi <andrea.righi@canonical.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Tom Rix <trix@redhat.com>, Eric Curtin <ecurtin@redhat.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>, Neal Gompa <neal@gompa.dev>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 4:05=E2=80=AFPM Andrea Righi <andrea.righi@canonical=
.com> wrote:
>
> Commit c1177979af9c ("btf, scripts: Exclude Rust CUs with pahole")
> introduced the constraint "!DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE"
> to enable RUST.
>
> With this constraint we don't need is_rust_module.sh anymore, because
> 'pahole --lang_exclude=3Drust' already has the capability to exclude Rust
> CUs. If pahole isn't recent enough (< 1.24) to support --lang_exclude,
> then DEBUG_INFO_BTF can't be enabled with RUST and is_rust_module.sh
> isn't used as well.
>
> In any case is_rust_module.sh is obsolete and we can just drop it.
>
> Link: https://lore.kernel.org/lkml/Y+p2xKIN6TJnQinK@righiandr-XPS-13-7390=
/
> Signed-off-by: Andrea Righi


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>


--=20
Best Regards
Masahiro Yamada
