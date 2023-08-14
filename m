Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3407E
	for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 22:43:14 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-d6265142e21so4752993276.2
        for <llvm@lists.linux.dev>; Mon, 14 Aug 2023 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692052994; x=1692657794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhP5hF7gsV/m6mRR8ob32YvEhTw2xPeRNUv47TvhXGs=;
        b=jFQc46cJTRErw+hng9tAokPjEOHl5jJIUhAjcuox1Slixjuhcu1DIUGSAs1PWoZrLE
         hiiIqXMEagsfhNWwOLggpXHYZ6rveONq5vpWW53M1urIa+/Iyg0RE3ROaMpkg5MuiRhE
         KhYQEI2TL4wc+ahPZbS0kzDzDC2ICyI9xIvs+1lOJUdVbNLk/LZiiLk+DJso6fdYtvUn
         Iy3FY70rsN2Ed9FCS6u6Ne33Nmz1jCwOk8RhdG6ofReL11UtsNlJAg4QWNxCbl2SG48u
         UIM2vEwhMgRn/KtNrFVtSQeBziX2jH+NF6pQ29w1yBZN55rFi7uneB1kg8fRB83uHJzR
         RNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692052994; x=1692657794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhP5hF7gsV/m6mRR8ob32YvEhTw2xPeRNUv47TvhXGs=;
        b=g5jz6AxSairHmpb7kYkhk6adkQUOxgQNPrXa44vQ3iiCCB5v7bv2tlTqHSYa21oYCI
         hS0JQma0Fv4fdff2u94gTy1JzdyP4alVDLEagEAo6WOmHnKKVPWwCryQ5nnv8IDTStM/
         QDsb5ukZSclD2uYTmqher/nsVBjPIo2A7XiKnsEKEilvMvqsFPnG+ugY1Fp9fJ2Ft803
         WHK2j6Hx4kEVSOFAb6/Emee2JpuBLQNHcRl4/V92aqCJdIVZk16oo1x7bQlHZNL4Qewa
         UeUy/GXYeuOTZTTsWTnVSOHrlA7FEbPro1KvGNIpYuNquCXqsw/KZAEKmXVEF1+Mg0eP
         g0+A==
X-Gm-Message-State: AOJu0YzkTADoBgqkWOXIX+KIrETobKCFCP187F1TZPUz/qsx42I/njwA
	vZdufJB8M8eXKBQvcJsL5BRH93qhnw+Q0zGj+yM=
X-Google-Smtp-Source: AGHT+IFpuYEJ/0nuvpgDua6ryUMqdgSSiGqdAodGAyLQ574FbDaMTr2TGX40TqotWWwvWMfuPrxQaWSx7DG1U9ivXLM=
X-Received: by 2002:a05:6902:4cf:b0:d43:e64f:bdcf with SMTP id
 v15-20020a05690204cf00b00d43e64fbdcfmr10448281ybs.0.1692052993673; Mon, 14
 Aug 2023 15:43:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230612194311.24826-1-aakashsensharma@gmail.com>
In-Reply-To: <20230612194311.24826-1-aakashsensharma@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 15 Aug 2023 00:43:02 +0200
Message-ID: <CANiq72mq34Locyu4EZ7WRmGdTHkSP77sNZt3Xfo0ZWx_bMLMcA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: upgrade to 0.65.1
To: Aakash Sen Sharma <aakashsensharma@gmail.com>
Cc: corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, masahiroy@kernel.org, me@kloenk.de, aliceryhl@google.com, 
	benno.lossin@proton.me, dev@niklasmohrin.de, lina@asahilina.net, 
	hca@linux.ibm.com, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 12, 2023 at 9:45=E2=80=AFPM Aakash Sen Sharma
<aakashsensharma@gmail.com> wrote:
>
> * Rationale:
>
> Upgrades bindgen to code-generation for anonymous unions, structs, and en=
ums [7]
> for LLVM-16 based toolchains.
>
> The following upgrade also incorporates `noreturn` support from bindgen
> allowing us to remove useless `loop` calls which was placed as a
> workaround.
>
> * Truncated build logs on using bindgen `v0.56.0` prior to LLVM-16 toolch=
ain:
>
> ```
> $ make rustdoc LLVM=3D1 CLIPPY=3D1 -j$(nproc)
>   RUSTC L rust/core.o
>   BINDGEN rust/bindings/bindings_generated.rs
>   BINDGEN rust/bindings/bindings_helpers_generated.rs
>   BINDGEN rust/uapi/uapi_generated.rs
> thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at__/_/in=
clude/linux/compiler_types_h_146_2)" is not a valid Ident', .../proc-macro2=
-1.0.24/src/fallback.rs:693:9
> ...
> thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at__/_/in=
clude/linux/compiler_types_h_146_2)" is not a valid Ident', .../proc-macro2=
-1.0.24/src/fallback.rs:693:9
> ...
> ```
>
> * LLVM-16 Changes:
>
> API changes [1] were introduced such that libclang would emit names like
> "(unnamed union at compiler_types.h:146:2)" for unnamed unions, structs, =
and
> enums whereas it previously returned an empty string.
>
> * Bindgen Changes:
>
> Bindgen `v0.56.0` on LLVM-16 based toolchains hence was unable to process=
 the
> anonymous union in `include/linux/compiler_types` `struct ftrace_branch_d=
ata`
> and caused subsequent panics as the new `libclang` API emitted name was n=
ot
> being handled. The following issue was fixed in Bindgen `v0.62.0` [2].
>
> Bindgen `v0.58.0` changed the flags `--whitelist-*` and `--blacklist-*`
> to `--allowlist-*` and `--blocklist-*` respectively [3].
>
> Bindgen `v0.61.0` added support for `_Noreturn`, `[[noreturn]]`, `__attri=
bute__((noreturn))` [4],
> hence the empty `loop`s used to circumvent bindgen returning `!` in place=
 of `()`
> for noreturn attributes have been removed completely.
>
> Bindgen `v0.61.0` also changed default functionality to bind `size_t` to =
`usize` [5] and
> added the `--no-size_t-is-usize` [5] flag to not bind `size_t` as `usize`=
.
>
> Bindgen `v0.65.0` removed `--size_t-is-usize` flag [6].
>
> Link: https://github.com/llvm/llvm-project/commit/19e984ef8f49bc3ccced156=
21989fa9703b2cd5b [1]
> Link: https://github.com/rust-lang/rust-bindgen/pull/2319 [2]
> Link: https://github.com/rust-lang/rust-bindgen/pull/1990 [3]
> Link: https://github.com/rust-lang/rust-bindgen/issues/2094 [4]
> Link: https://github.com/rust-lang/rust-bindgen/commit/cc78b6fdb6e829e5fb=
8fa1639f2182cb49333569 [5]
> Link: https://github.com/rust-lang/rust-bindgen/pull/2408 [6]
> Closes: https://github.com/Rust-for-Linux/linux/issues/1013 [7]
> Signed-off-by: Aakash Sen Sharma <aakashsensharma@gmail.com>

Applied to `rust-next`, thanks everyone!

I also did these extra changes:

    [ Reworded commit message. Mentioned the `bindgen-cli` binary crate
      change, linked to it and updated the Quick Start guide. Re-added a
      deleted "as" word in a code comment and reflowed comment to respect
      the maximum length. ]

In particular, I have reworded the commit message a fair bit:

    In LLVM 16, anonymous items may return names like `(unnamed union at ..=
)`
    rather than empty names [1], which breaks Rust-enabled builds because
    bindgen assumed an empty name instead of detecting them via
    `clang_Cursor_isAnonymous` [2]:

        $ make rustdoc LLVM=3D1 CLIPPY=3D1 -j$(nproc)
          RUSTC L rust/core.o
          BINDGEN rust/bindings/bindings_generated.rs
          BINDGEN rust/bindings/bindings_helpers_generated.rs
          BINDGEN rust/uapi/uapi_generated.rs
        thread 'main' panicked at
'"ftrace_branch_data_union_(anonymous_at__/_/include/linux/compiler_types_h=
_146_2)"
is not a valid Ident', .../proc-macro2-1.0.24/src/fallback.rs:693:9
        ...
        thread 'main' panicked at
'"ftrace_branch_data_union_(anonymous_at__/_/include/linux/compiler_types_h=
_146_2)"
is not a valid Ident', .../proc-macro2-1.0.24/src/fallback.rs:693:9
        ...

    This was fixed in bindgen 0.62.0. Therefore, upgrade bindgen to
    a more recent version, 0.65.1, to support LLVM 16.

    Since bindgen 0.58.0 changed the `--{white,black}list-*` flags to
    `--{allow,block}list-*` [3], update them on our side too.

    In addition, bindgen 0.61.0 moved its CLI utility into a binary crate
    called `bindgen-cli` [4]. Thus update the installation command in the
    Quick Start guide.

    Moreover, bindgen 0.61.0 changed the default functionality to bind
    `size_t` to `usize` [5] and added the `--no-size_t-is-usize` flag
    to not bind `size_t` as `usize`. Then bindgen 0.65.0 removed
    the `--size_t-is-usize` flag [6]. Thus stop passing the flag to bindgen=
.

    Finally, bindgen 0.61.0 added support for the `noreturn` attribute (in
    its different forms) [7]. Thus remove the infinite loop in our Rust
    panic handler after calling `BUG()`, since bindgen now correctly
    generates a `BUG()` binding that returns `!` instead of `()`.

    Link: https://github.com/llvm/llvm-project/commit/19e984ef8f49bc3ccced1=
5621989fa9703b2cd5b
[1]
    Link: https://github.com/rust-lang/rust-bindgen/pull/2319 [2]
    Link: https://github.com/rust-lang/rust-bindgen/pull/1990 [3]
    Link: https://github.com/rust-lang/rust-bindgen/pull/2284 [4]
    Link: https://github.com/rust-lang/rust-bindgen/commit/cc78b6fdb6e829e5=
fb8fa1639f2182cb49333569
[5]
    Link: https://github.com/rust-lang/rust-bindgen/pull/2408 [6]
    Link: https://github.com/rust-lang/rust-bindgen/issues/2094 [7]

Aakash: please let me know if that is not OK!

Cheers,
Miguel
