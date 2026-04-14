Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFCD31F99F
	for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 08:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154527; cv=none; b=l5SvNchIBeWcHcZeEwbTRypJ/7GjLqwdy7Zs/KdZ/4lQw/ZsWKHtWpAB2ZYQks75UgPaHHOIu3WNam0TCzGLmVc8+gMT98nU0dmiHRR8YUB3hTbVaOoO33dqCzXttJHykSgdMCYRxbrwERTF6VYdyED+eepoXqHTMKJIgrVLVCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154527; c=relaxed/simple;
	bh=kC2FmY3iYRVhZyL8KYRF5E6y92UpmxOMfLrbnl0GYZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dNCmzilVKVoa1hp2/fBmqKSPSoewoW8dB0//poZxNNUAftmk4UzQCl8rn3XDtz6zU3PgkOjlbdZmDGLXSYW28/HNrRQY0SfjasaBhV2fgWJrbZYfIBetkzfE6aGNCrM6fwKEneUlQpr9m9r5MXdDEbwLpPFc2sbnbrN9Q2O8ABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fPNDvGx2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fPNDvGx2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB730C2BCB6
	for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776154526;
	bh=kC2FmY3iYRVhZyL8KYRF5E6y92UpmxOMfLrbnl0GYZw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fPNDvGx2qaqbFhViStQ/cMrgaN7lTkBKKnUGaE9sNK/HFxN5dxwQKvoGOOu49efP9
	 Ub5ED1mFCACIhZ1b7vFGHhU/oAmyo4ByUKkYnPb5Tnv28EEO3dH7OC4GbpulkCzuRI
	 0MFgLK93HN/imiM5ZPYU5x93LHZYa3sE3i7179lCZ00zO9GfjDbGEEU079fFzZFi+7
	 kYVTudNvFdXaNHUwRqjfmVsfDzhZiwwq9nQNpzxdHEjxjKuZIpGkjfuR5bO3xclpKC
	 ulQu2V1V2gwZ/axpV8/FSAegtnjrSIRYB/08U61Yw1j+TpF80Kv8yCd55RVW7jRA2M
	 cSghfE0ZFTacw==
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so824903766b.1
        for <llvm@lists.linux.dev>; Tue, 14 Apr 2026 01:15:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+ENF9RrFOaqccyDAFEAvBvLOV1kbBgns7TOcyLKXwlj/MhfVPXSCKVKwFrhphaqeod9GW+@lists.linux.dev
X-Gm-Message-State: AOJu0Yxubruerdy3g6YPXg7ST5yW8H+Q1Djz5KYiYuLeYAK2SniIomFC
	eEgLn2g8mM+4pLELX83z78pKGnZJoh86b6kYehrDSy61meRXcOeLe5LFXFXe2caAtSfMBjyK4Zl
	/Nflqub8JQn/j42Xps8aBpPLcNqICatY=
X-Received: by 2002:a17:907:3ea9:b0:b98:1b18:782c with SMTP id
 a640c23a62f3a-b9d724f0c4amr885938166b.6.1776154525171; Tue, 14 Apr 2026
 01:15:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414080500.320095-1-r@hev.cc>
In-Reply-To: <20260414080500.320095-1-r@hev.cc>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 14 Apr 2026 16:15:13 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4q-LUUVLQEXtpm2dARfqZGfKk6Tz=f1_2Uo_ixAjebOg@mail.gmail.com>
X-Gm-Features: AQROBzBU7HT0TAgIhCIul-iItWaFERzy-4SvP-K2qZwQXR57-2ug8EXdNo_AD2M
Message-ID: <CAAhV-H4q-LUUVLQEXtpm2dARfqZGfKk6Tz=f1_2Uo_ixAjebOg@mail.gmail.com>
Subject: Re: [PATCH] perf build: Add clang and rust target flags for loongarch
To: WANG Rui <r@hev.cc>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	loongarch@lists.linux.dev, Haiyong Sun <sunhaiyong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 4:05=E2=80=AFPM WANG Rui <r@hev.cc> wrote:
>
> From: Haiyong Sun <sunhaiyong@loongson.cn>
>
> Add missing CLANG_TARGET_FLAGS_loongarch and RUST_TARGET_FLAGS_loongarch
> so that perf can be built with clang and enable rust cross compilation.
>
> Signed-off-by: Haiyong Sun <sunhaiyong@loongson.cn>
> Signed-off-by: WANG Rui <r@hev.cc>
Acked-by: Huacai Chen <chenhuacai@loongson.cn>

> ---
>  tools/perf/Makefile.config | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 15fbba9f4..1340744a6 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -27,6 +27,7 @@ CFLAGS +=3D -fno-strict-aliasing
>  ifeq ($(CC_NO_CLANG), 0)
>    CLANG_TARGET_FLAGS_arm       :=3D arm-linux-gnueabi
>    CLANG_TARGET_FLAGS_arm64     :=3D aarch64-linux-gnu
> +  CLANG_TARGET_FLAGS_loongarch :=3D loongarch64-linux-gnu
>    CLANG_TARGET_FLAGS_m68k      :=3D m68k-linux-gnu
>    CLANG_TARGET_FLAGS_mips      :=3D mipsel-linux-gnu
>    CLANG_TARGET_FLAGS_powerpc   :=3D powerpc64le-linux-gnu
> @@ -1167,6 +1168,7 @@ ifndef NO_RUST
>    ifneq ($(CROSS_COMPILE),)
>      RUST_TARGET_FLAGS_arm      :=3D arm-unknown-linux-gnueabi
>      RUST_TARGET_FLAGS_arm64    :=3D aarch64-unknown-linux-gnu
> +    RUST_TARGET_FLAGS_loongarch        :=3D loongarch64-unknown-linux-gn=
u
>      RUST_TARGET_FLAGS_m68k     :=3D m68k-unknown-linux-gnu
>      RUST_TARGET_FLAGS_mips     :=3D mipsel-unknown-linux-gnu
>      RUST_TARGET_FLAGS_powerpc  :=3D powerpc64le-unknown-linux-gnu
> --
> 2.53.0
>
>
