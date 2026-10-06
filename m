Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4C43B05AD
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282743; cv=none; b=TLSpbqC6n5A05wjtuP7Le0J1jsYDeK/TybMIDYFwFEpEG8Lm8BS2xhBunamM+n30M+EFytATxDrAduy0sLcXEFBqIPHDKXj0o/DSzha6RacdfBjha/JmTZjYZm6U2kP5b5DO0yAr7itJp5ajXORY03x/+GUS4Sr3K5COENMZkIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282743; c=relaxed/simple;
	bh=3mYh92seikXtUvt3y+ZqIQGGSNX/WiLcPh6JuuTEkkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tSbVJfVNtAE67HgV+iRJ602ECa/ELYfWNKHohsnktoxHFK1bZV2XtGjf69eTFK6XZmMHXphc6ojoVAVXEhmXXsRzHfKXBYscNEK0oZJOjHsq+YHSpCvzQTTugKZZlUlsvDN0VvQdpe1eiG1YSMPXWDYQcU3OVI33N/QMouv2Duc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H66jlRVm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H66jlRVm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADD31F008BF
	for <llvm@lists.linux.dev>; Tue,  6 Oct 2026 10:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791282742;
	bh=vE01EV1zSfpVuJeSfikynDyyaUOUSSRxYC7VKoLHOYs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=H66jlRVmxbLAvCWY7wio83N91RBhaB+Fb/3/3PqyHazJQpe69u4eTmABkVeN50KIq
	 HoUQKqSRDDJwsxkhN7ZWehR2OoeWLENhJTFBkQX0YdeYTeLiwDZqq8YBaSUQf0QYbL
	 H8K23KqJp/N/KVbFTCXqWb1SpZiuR1FDQnJGUXyEksHIwfDFt8M6+8zQXLndkioLtn
	 FseRdXTAlEF5xbuvzZN1jmKV+mqZIkLpBYsBK72cVIoqnVVzaxdqjmX8TjMIVQl2Wr
	 T/s0JeXCD/kpoDa9sRJkMxHXWz0HwV5UxWTQ6rQrip1LKG7bleiPhG3BZWsx1o+gJT
	 OYVcivpcUTc3w==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso20189721fa.2
        for <llvm@lists.linux.dev>; Tue, 06 Oct 2026 03:32:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJAA4WcAqH6knoZPqMNsNfvJUES0mAGyaE2Cl/a/QLfQE+SK7SC4z/E5Qgy2zZs/dvJLbh@lists.linux.dev
X-Gm-Message-State: AFq9FYJh0t9sYcSVUixnMHnM2fe4v4bd1j0Uui95gK0iTYRaiuBHMvhy
	2cdhfXsrE3/PI3M9GSrg1mD9zm42Ob09OD49jjqp7Zm14N1eAGJJQFeZk1RetcanOZAHKgyWFAV
	D25mpyHp+pJHp5VVa5pmuVRGpOPN4a/w=
X-Received: by 2002:a2e:be1b:0:b0:3a6:636b:63c5 with SMTP id
 38308e7fff4ca-3a99af27150mr2412711fa.16.1791282740735; Tue, 06 Oct 2026
 03:32:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003093827.77857-1-kmehltretter@gmail.com> <20261003093827.77857-2-kmehltretter@gmail.com>
In-Reply-To: <20261003093827.77857-2-kmehltretter@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:32:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLk=+WSou4RFoho3JvWxV+ok-0ZnNZWhwdOVK_J7R7AM3A@mail.gmail.com>
X-Gm-Features: AclHuK8rkOnk1u1TfAFFALwn8ajDSse-J3apTnHTi28eDx-XnKGt_saLuoLvA5w
Message-ID: <CAD++jLk=+WSou4RFoho3JvWxV+ok-0ZnNZWhwdOVK_J7R7AM3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: cmpxchg: support 2-byte xchg() on pre-ARMv6 CPUs
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Bradley Morgan <brads@mainlining.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 11:38=E2=80=AFAM Karl Mehltretter <kmehltretter@gmai=
l.com> wrote:

> Pre-ARMv6 CPUs have no halfword swp, so __arch_xchg() only handles 1-
> and 4-byte exchanges there and turns any other size into a link error
> via __bad_xchg().
>
> No C code needs a 16-bit xchg() on these CPUs, but the Rust atomic
> helpers in rust/helpers/atomic_ext.c provide xchg() for Atomic<i16>
> unconditionally, so building with CONFIG_RUST=3Dy for ARMv5 fails:
>
>   ld.lld: error: undefined symbol: __bad_xchg
>   >>> referenced by helpers.c
>   >>>               rust/helpers/helpers.o:(rust_helper_atomic_i16_xchg)
>
> Implement the 2-byte case with interrupts disabled, as the pre-ARMv6
> atomic_t operations already do. This is safe because SMP requires
> ARMv6K or later.
>
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

All right this looks fair.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
