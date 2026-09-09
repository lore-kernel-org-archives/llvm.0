Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C637155D871
	for <llvm@lists.linux.dev>; Wed,  9 Sep 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788958769; cv=pass; b=t+mTuarCszXjAT9uPm2DAG8VdsA+7XiFpVK+OABwlbA3Rc2lFaU2LjdDzVRB88p6rGndKNU64QJB7qFyrdZlx/sNmnCkscfmPUnuC0qhP/B2Voj6ksrmp0dC33Xw1V21WTkMqzjh0kEJ5NI4hAZUE3YN7Mg18lOnuf99oAgjmXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788958769; c=relaxed/simple;
	bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RIJYKcfRf71ce6TwVY0smmc5ryrkzqzo122G0M9jnksBghu14f5uS4Luuk4q/m0KaBZfIH4quokkyvFX5hIT0FdiukkLK0ZYW/l+waL7EgYkCXTNJYHDWsTkOn7/acuebCfzFjxlDt59Dp+2rX/ZJoaOdmX9Oi5M9iHwBifM9ME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNm75Kfo; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNm75Kfo"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed441so1010521a91.2
        for <llvm@lists.linux.dev>; Wed, 09 Sep 2026 05:59:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788958767; cv=none;
        d=google.com; s=arc-20260327;
        b=gD3agUB8h5wHz1oRCyH43FihSpYNXdCzxKCG9msv2B2rTKuYCG/jINfvsPH+DhSWSQ
         GbK6fpgVaaZl+Fw9oV41muZtUtc4OObvNk+PquUK5Xdqm+LYKEshN7D71uQpx1xqnkay
         WArR71BLiWiFrYn8p6fLw5EfpkYcjIk3apW1z9O2Ute+3WHnk9FNzOw/cahQpQate1k6
         uX/Y+gnhW6ZTEFVQhuta7wei5rIY7hyN7SUX/ockZk5WlCf1uzdHKpZ2qjeGYZEsFtVw
         5Jpszj9vDbV+Kd+H2slBcNNMyyR8+1INR4NQhSSkimJGSD6sBjlRoWi6vRV2mspFGfL6
         ZlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        fh=gu6z3ei5Wc1nwmiM2q4GHldPRayl8mzdPaJaWbVqn8E=;
        b=AauypGHmxcWNKPjmYyHF8f9rn/xYgOG8tfWI+QfDvmFxgcJsatSjJ4ofL9yJiCxNYx
         B3qJdQeF0SBbnX9tl8ygRK21RFm5CxRUiU70bxUypuSi31j7FNJEp+5ascuK7i/P24CG
         WWMIHjB4IAoBVFpTy6A+H3mEHbO7esdq+ysiRAWGePUWQkanm+eh7J4Kk8Fq/sf3/jRX
         B7nI9ADZLbmKNHfrIYBU6foxn0iRiBq0qZFNWiRuYspv9iUthQ2379ijDC/bvYd/L33i
         ZAw+EM0/6HMlLOvGgqbrvb8A+xJV8xtyYQcQj650P2skrAPoWtVdmCIi6jlOePdRNv3O
         VB3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788958767; x=1789563567; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=XNm75KfoltFZDovzOHLqnZ+3Xjw9aJUJvuZjZ/JvssqYDG47bwoi53O8RNvPvF2a00
         4uGunGQn4+N6cW4KguwHRMTr8QEBI4vsGMJeI8vSPSJPj/u5KHAXKsbNDUd4Rh7gfFs4
         kE/4HW1LWlNh64e42xu2YJjb0SLcjIyM6/1fGZM2zI4Pu9gBSdhcofqVpvoW1FMIWp6n
         r5cGVrqR7hgkI4JDM6b8wL6j3rkY0OKbWHBH3enMtzjuuSDA6IjZIxWhhyuXe9ahnPti
         asHduaXQ/EBmoaeRiqUHeJfESUhF7cnuwGgCviT3+1UAyuMdEi772fkkj83yuWGUZUc5
         Zq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958767; x=1789563567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1HbAAmLLEsFjOnWR9bXHueuoEhrvxEd4xap4Bi/h/A=;
        b=iOkDSmPPMjEr2YtQy/La0WtCA64/nhe+ZXp5NqJZaNZhutFjjx87r5ipYlsRO832AZ
         iUKYN5nhW05Zb+KewOWSVZkef9Om7C/zCrGhT1hOzOqs+Bh3eSLNXuxcYnuG+QHbHrHb
         9KteEz/7Zotb4xOfvgHc1tW5f2x5UeRCl805FQxM0Xl6X+zMLFKr88ew03i0Ta2Q6UBg
         vkHykDCk0PJ70EmBTtPYebH0veZsSHK0NTTP32rOzc1udugK4BwYovfiLUeNK8R6daQw
         4XeO95pc0QidkTrSC1rc+IJ/PhJLMLmHP5pSZKNeMAOO4qvxlbxPwu4+RkB8Cm2F/i/R
         /9PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMKS9RBaTkKpkLlqEIMO6I+D8vQusUt00tQkykvQMJp2vXohzZ2/2O60wPOOaG+eWf76a9@lists.linux.dev
X-Gm-Message-State: AFuF++mYWkzW1yF+N4xIAjiwcEC5ROiHWdaZ4L5qA4JBTxmnLfVV/Xun
	mIG3SUuE1+2/CHsgVPwnEP0COCf9qG3VYaT7bAbm2nDSi5e8Uxjm0Fi25bG2cbcjmHPkScaxc36
	QajdXvzV+jTjmydKdfAO7IDYHrZGwLTU=
X-Gm-Gg: AYBFou1NmaXEIEpbO4HWBEiqM3mONVY3T1F7YYxkUCA4EqR/526oHqEJYkcHMvJUx7Q
	y5H5mIgeHlEx2tBy6572jTSeD4lRkb/XAzSiIgFBZtHjisMkXxD5zjurXmqfYPWfutNsEoTjvnY
	WgdP6wluloxLbV2y7Sm4VFaREyQpegfA3n9ZX9MIEE6YrpTY5BhHEh4hB6atE5K+TDPjUgELzgn
	9hQqpG7WY6kSzaAQEtKISWx9GNB2Fg/wCmeQHzj2v8g6Ux/wRYzKnaWEaAsX+bdLtyFvZe1cW+O
	7Fw3S2nkx9gul/nBsFbt7bm7kE2x84oHyLhAa3IV/V2Hq9ZNLvcGrScYPMbTzKKHjp6/WU3A/it
	BJKKuCxzE9NSsnacQJIFotWcd4mJ2R6P08tlPJyr1rZ9N6QZKxc13zIp9j9iZb61f+2RYluVZ4V
	yPcJK5H6gmR/qJ4bnCMP7XxC/34z2OE2DJENpKQSZGiNwOYsTjSZg=
X-Received: by 2002:a17:90b:2888:b0:398:cee0:67dc with SMTP id
 98e67ed59e1d1-39b2699849cmr33697284a91.5.1788958766896; Wed, 09 Sep 2026
 05:59:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org> <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
In-Reply-To: <t8iID_-Rgtrxxg-f1ZfdOg1xmm7YedvOT4pgDFEXKxoIeu29-JooZ3SSlbze088O0kLSOdgP7xN_Bo9Xm_lO1x51Gd-gIgT-tFPfwM_gCEw=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 9 Sep 2026 14:59:13 +0200
X-Gm-Features: AcwNN1Vwugoxsn23N3HKo79fRO4c4hCKpdWpUEii2k3VTwCoJF2DILgisLp6T0w
Message-ID: <CANiq72=rUrjFD8dHggtO5g0D5Yu-LjO4s7t=+yoKtteD56KfXw@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: =?UTF-8?B?QmrDtnJuIEJhcm9u?= <bjorn3_gh@protonmail.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 12:22=E2=80=AFPM Bj=C3=B6rn Baron <bjorn3_gh@protonm=
ail.com> wrote:
>
> There are still several known reproducibility issues for the parallel
> frontend[1] and at least until fairly recently there were also deadlock
> issues and incorrect errors[2], so I would not recommend enabling it with=
out
> an explicit request from the user. Perhaps even only allow it on nightly
> rustc for now, then you don't need to check which of the two spellings of
> the flag is supported.

Thanks a lot for taking a look Bj=C3=B6rn.

If there are still major issues even in nightly, then I would say
let's not add it yet -- some users/CIs are testing with nightly
routinely, so it is probably best to avoid surprises for them. (If
someone wants to test the flag, they can still pass it manually.)

On the other hand, if there are no major issues left and it is just
reproducibility issues, then I guess we could add it to help figure
those issues out and avoid surprises later on.

> By the way, currently backend parallelism is entirely disabled due to the
> usage of --emit obj (which forces -Ccodegen-units=3D1). For -O2/3 builds

Yeah, we even set `-Ccodegen-units=3D1` explicitly at the moment, so we
would need to change that too (and likely make it an option, because
normally end users will want the best results, while developers may
want speed of iteration).

Cheers,
Miguel
