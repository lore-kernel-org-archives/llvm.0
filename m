Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DAA1D5ADE
	for <llvm@lists.linux.dev>; Wed,  9 Apr 2025 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232773; cv=none; b=Z3b6qdXFcy2v0iXPpKUJ90kqv5q3AkuXLGUgAJXJx2bXEofye0wgbBEhY4j/1h+S8GubPxhzyBRDCOf/Hnuvaolmwx4g7qZNF1J80eelXopA3o4vvAI4+UEeWgIvRVUxl3qXyWlZPB7E8hel4PfJyBbJtX8JSiBfPPKn7eA4tZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232773; c=relaxed/simple;
	bh=pkDCmCK9naL6Vl+XyjNyUFQmEvtkQBSbpV648xlXr0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jKMr0zAfsQBk0PqAn0x6HLQ7WqtO9GRbfROCwrxtcoA6s3671IhpuJsLdDJJIvCs5hx6mWXxpogAZ2IFgMM2NydpHElF6xsfH7cndzzUaPzxHaCaa/Q4n8OqY/izbYYdxr0V0nAxBo9AsqFOP4Ankp9CYrtRqH7Yb/0TfctRLVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K48nN4d9; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K48nN4d9"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6ce72844so16573a91.2
        for <llvm@lists.linux.dev>; Wed, 09 Apr 2025 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744232771; x=1744837571; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=baX+5Zv78I8HcbkYxjdZe3p8ly9kiBXGfznkMkDjWzg=;
        b=K48nN4d9JeLeXe1NhFOfd3bzcXXsDLKLXjJLcrRJ9sDJ9zXCCXyIlaeNSiyzmx+zWn
         BDkm4Yr3SKCLAxMhRCHOV4DnKdkzxxW1XE+uG3ch7NibIhXIaWcJDerMfoyEUOuaD2oM
         N9pi0y2fXE2Gb/gZ8QKXTtt3GONLuw3yx787lVf5aIlWAz31subW9BTvPIM4xYwr+vFJ
         ovm8eZ3UGCJHcKIzcfBe85UYmxEGhnd1gGjfwaugtqkSFRwMihbaayDkdKjxTz0/lhBb
         BKCsX2NRq9VQOvvcUkjqhr0lI9QHxaNA+AQx6RYc2giuTFIoq4ppINfyivz/0nooztyb
         zV9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744232771; x=1744837571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=baX+5Zv78I8HcbkYxjdZe3p8ly9kiBXGfznkMkDjWzg=;
        b=rHOy+xaIDKicVTdFvfmZoOsYhvw4JScJDjgB0shp2m97/aDrV8bXsGlonQhVAny8d5
         zqtgjguGez5V9CEL0JuJY5M3AlV16+mF7Yez7yv9X8XQmMRo+mtw+y2qBnopBOV02TtG
         7XytjvH/SmQygrbeztmcnQcP0D+Z9ut1UtP/TznWJ6XUZ4uWr7I5P3vsBge8VbQevMxl
         7gaFSdh4hQHfzSeMx18MLQd9EC41z8V/Rx90tYLGED5Pkgr8O04HnzBZUo0j1DaUa9X8
         AkiVpRHn1tAeBv+s/+nn1jECQ7QB2b/vU4XWbuOKJ2+Qm/YtPE1JZOkzsyaY0u3DYzlS
         BS4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXF0Eya/AnnT6K9CVJ7OEi2qEEsUzM7yvUyz9PIva7/rzrOvfvJUa0q0qAli4i5TMGxBgpA@lists.linux.dev
X-Gm-Message-State: AOJu0YxgW7/dscP1kKfih1PlvakCsFxnN0vygfBuxTwePRP1oLAvyp/U
	fbBUB7YHSa+uoKWpr6Mh8m4sFl3hsta4LodB4Rsmrv8dsSou+XBLEAtKyLEE4RcqRqaczbEXt9b
	xZHdpr9LOt/zyF7sXyC9VCG52V8c=
X-Gm-Gg: ASbGncvhpLlB/qj0ePPTETUa9KQxrdZK7XuiJiR+k5lbj5MXRoJus+aowugave62o32
	0n7wwJyp59LMOOMiNy/dJw8MGYhJKBB0r/vIEGaSH2GyH/MHutPS2FuQCvnfF40Xx5jto7zTC81
	RidlznI3Bl+RBuRZAEI2FFlg==
X-Google-Smtp-Source: AGHT+IEcwDh/QwcSZtRQOzKah6xPPVYt/1iFh55+JUvOEm1cvdiPe9fW6FPzdzfP2biO4dCnvITs8MuazzC6KAo/zjk=
X-Received: by 2002:a17:90b:1652:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-306dd581f05mr2145032a91.5.1744232770925; Wed, 09 Apr 2025
 14:06:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250319205141.3528424-1-gary@garyguo.net> <20250319205141.3528424-3-gary@garyguo.net>
 <CAH5fLgifMPxer5TcWUBUYKtGsPFryqPVwXT8-5qmmY6F3=nuBw@mail.gmail.com> <CANiq72nc-A2WZn4xgfKyqr3GbgenhXjZztHqnf=12xY16ggHkg@mail.gmail.com>
In-Reply-To: <CANiq72nc-A2WZn4xgfKyqr3GbgenhXjZztHqnf=12xY16ggHkg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Apr 2025 23:05:58 +0200
X-Gm-Features: ATxdqUGFPJhGsGn_8xddyJe62tWSPbE-L2b1BLMkL1zCms_O0XOzjnRwcZGO-U4
Message-ID: <CANiq72mMJLNq8PctLwXX=QM6EtoqV7EOgwv62W9tgkWv1A=quw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kbuild: rust: provide an option to inline C
 helpers into Rust
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Andrew Morton <akpm@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Tamir Duberstein <tamird@gmail.com>, Christian Brauner <brauner@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dirk Behme <dirk.behme@de.bosch.com>, Daniel Xu <dxu@dxuuu.xyz>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Matt Gilbride <mattgilbride@google.com>, 
	Paul Moore <paul@paul-moore.com>, Kees Cook <kees@kernel.org>, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 10:41=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> In addition, from what we discussed in the call, it would be nice to
> have some performance numbers compared to not enabling it, as well as
> compared to cross-language LTO.
>
> It would also help to know which users out there need/want to have this.

A couple more points, if we end up landing this:

  - We discussed that we may want this behind `EXPERT`.

  - We should probably mention in the config description that using an
exact LLVM version is recommended even if matching just the major
"should" work.

    By the way, here is the link that we sometimes mentioned in the
past: https://doc.rust-lang.org/rustc/linker-plugin-lto.html#toolchain-comp=
atibility

  - We may want to mention that one needs `llvm-link` and `llvm-as` in
the config description.

    It should not be a big deal, since they typically are available in
the usual `llvm` package of distributions (e.g. Fedora and Ubuntu),
and the kernel.org combined Rust+LLVM toolchains have them already
since June thanks to Nathan.

Cheers,
Miguel
