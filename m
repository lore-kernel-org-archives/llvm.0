Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED6C1AE874
	for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 11:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723634854; cv=none; b=rwJ46m2AjieOqhAarJlcJU7ncZj2vSmrob59842ohwuFPih/qqWGq/b6Eh2uB2RnCLPgdkpf01QvW/pVAKUhrJME2A2Ex1mMH0hD9r2SgnCsFe0HUC6+m+disssipj/qceuGOwx5uo96zYbJA98NbqmuvrwOL/WSIybDqT6neJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723634854; c=relaxed/simple;
	bh=WhU+e2jgq65ehnrJrXCUVJzjobCEAHClPzzdVgzZ17Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQiFhWvAQ9QUqr/lgVmOK+Rt6Y3gQcfdRAK3V7m0Jwszd6nIWmxm7v8+hyUkhKvkJrjAILApBaEM09YUa3uT19nkbV/MrWKcPLzQHlfA5m1lqae9cf1eLJF59C8zkzZgUWqdYHSwsP5V54IVZDnr8s8+rjittgGIh6B4MqWfGQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AICSMAXD; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AICSMAXD"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d3b36f5366so202573a91.0
        for <llvm@lists.linux.dev>; Wed, 14 Aug 2024 04:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723634852; x=1724239652; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhU+e2jgq65ehnrJrXCUVJzjobCEAHClPzzdVgzZ17Y=;
        b=AICSMAXDNayldpL6pM6UiFSUESsIIemjd0Q/uSkrgt8m/NMlF9GghI+aPDDqZH/Mui
         8oC2oMvBxX7+tO/Vz29Yjohs9BQfXsCpqu4DrnqA/TVvyAfdSbepRKhV/Vo23e6xJzQe
         x78ZKiP5JGif22djbKu3kiKxv4xtVVXdkF9GphQARmd62HDxHy1new2l+6zwZRL9qIOf
         k5/lTTNHBmoCSwoR/qS14VoddwZY/p6DYL6H/7x1EExWk2VCkR2dd/GX5f1X2/XT+k45
         Czh7LqnxVmV0enOJwfh7GSceeen9pkItZI2b9b3DagjESYtHgyBCIGCLX8BPcnH4x0l3
         k44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723634852; x=1724239652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhU+e2jgq65ehnrJrXCUVJzjobCEAHClPzzdVgzZ17Y=;
        b=iSKMWHypJfgfvIQYBVtWBqQiFqm7HGk4fHihI6y0SkHoZPNFVu/XQfEmvxoj6vN9Xu
         BU/RS/NqqUbtuMKbjlU31TCONMZ/je895/KaTPXr1d/c/A290iziE7AMgQn4LAOik0bt
         fBs6y1Z4LWToG0v4a3UEp3g6NKIwOvd++R9IAgHVrgLwnMkKOxfOcoP9/xF+/Casdmdf
         HqP3jK6VAN0npn7WxQdO4VfY/xMU0ujZXjnIIhv/ccfz7ImxdPf8vWNtezzvzWLAc2Fz
         0lGA86l3+lI3NwxkyxbNlW3fvcp0YbYWrWAAnx5qWQxj49zLpMYbLRhVK9Gu6OPxyxvG
         +kig==
X-Forwarded-Encrypted: i=1; AJvYcCUtQw9RYETqVbOTYafQ1dbMHIQdfKZGSZ6JOj539zsaFSSOihZh1fB7ZolUODuMjIrG0DYVKZigo0B7lUK6yC8imkJ4og==
X-Gm-Message-State: AOJu0Yy2p01RD7xodomjGJUcIeGGcHzlGVTK1cWUdLFJsNh7PwNpTXRK
	tgozPlvL9VNAn9o8PgIPCzjMO0aUKNCvqqe+qi1oExSoJYqBGKVc2Q8xbczOobBOy2kMyM/eQlN
	b0uSX2etNhEVbFu+vyFghE+AURD0=
X-Google-Smtp-Source: AGHT+IELKdSoSWG2UnYMmakzdFiUo5k7VT5bKKAkwEl/PovcViSJbpFA/Q4ffrafWGIOvcGXFiTjP48gn1Htq58EQOQ=
X-Received: by 2002:a17:90b:1949:b0:2c9:9ad5:7ca2 with SMTP id
 98e67ed59e1d1-2d3aaa8d177mr2841773a91.13.1723634851943; Wed, 14 Aug 2024
 04:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240812232910.2026387-1-mmaurer@google.com> <20240812232910.2026387-2-mmaurer@google.com>
In-Reply-To: <20240812232910.2026387-2-mmaurer@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Aug 2024 13:27:19 +0200
Message-ID: <CANiq72khUrha-a+59KYZgc63w-3P9=Dp_fs=+sgmV_A17q+PTA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kbuild: rust: Define probing macros for rustc
To: Matthew Maurer <mmaurer@google.com>
Cc: dvyukov@google.com, ojeda@kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>, aliceryhl@google.com, 
	samitolvanen@google.com, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 1:29=E2=80=AFAM Matthew Maurer <mmaurer@google.com>=
 wrote:
>
> 1. `rustc` support will soon be a minimum rather than a pinned version.

In the meantime, this happened, so we should update this sentence.

> 2. We already support multiple LLVMs linked into `rustc`, and these are

I guess you mean `rustc` is able to use multiple major versions of
LLVM -- or what do you mean by "multiple LLVMs linked"?

> +# $(rustc-option,<flag>)
> +# Return y if the Rust compiler supports <flag>, n otherwise
> +# Calls to this should be guarded so that they are not evaluated if
> +# CONFIG_HAVE_RUST is not set.

Hmm... why `HAVE_RUST`? Should that be `RUST_IS_AVAILABLE`? Or what is
the intention? Perhaps a comment would help here -- e.g. something
like the comment I used in the original approach [1]. Otherwise we
will forget... :)

Also, I guess you wanted to relax the precondition as much as
possible, which is great, just to double check, do we expect a case
outside `RUST=3Dy`?

> rustc-option =3D $(success,trap "rm -rf .tmp_$$" EXIT; mkdir .tmp_$$; $(R=
USTC) $(1) --crate-type=3Drlib /dev/null -o .tmp_$$/tmp.rlib)

I also had `out-dir` [1] since, if I remember correctly, `rustc` may
create temporary files in a potentially read-only location even in
this case.

Also, should we do `-Dwarnings` here?

> +# If you are testing for unstable features, consider `rustc-min-version`
> +# instead, as features may have different completeness while available.

`rustc-min-version` is not mainline yet -- we don't have a user yet,
but I can send it if so.

Thanks!

[1] https://github.com/Rust-for-Linux/linux/pull/1087#issuecomment-22184453=
03

Cheers,
Miguel
