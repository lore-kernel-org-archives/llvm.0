Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA1A33F5B6
	for <llvm@lists.linux.dev>; Sat,  4 Apr 2026 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336662; cv=pass; b=EI/PuBaElRNTUkBjLWN7y1e/+34eOly36L3C3IHH9vi2eEqlG5bYv3w4Xsijay1mTLKumbgoWGiL8oyrsE69Y1mt78wx8o+rj3ZXVmcNB6lnhPyWmv+17Cjuk2eUm5GH8R92TyS4e1WDtrFhnY1ANnX9LR0TbYntSCgJx996VvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336662; c=relaxed/simple;
	bh=OEvGM5ARxQS6grOCJs/z8BJJLd00bR6+I16kU6h5ie0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rhe8h6U7Xy2kf/3KSwFNGJ37oVtU8VwcbQP3teoTnMIv3D0k/mvSDSVNZ+CIDNtvwJ+VcT+fDIdqVj01D8WnVtxZZUMbivdGLTpSscqHTvtOalTYPRUo5pLtQbKvTRUVR5l6L4uQlcaQCSM7CHtlc9YExrmlkZJ4QzwM4YZGxw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYgdSmIu; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYgdSmIu"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2cdf546f956so25059eec.0
        for <llvm@lists.linux.dev>; Sat, 04 Apr 2026 14:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775336660; cv=none;
        d=google.com; s=arc-20240605;
        b=QZbeeaqL8rYIRT6KRCPW7m6GAXvP6DzyR42bIDUAnBavYvc2mGz0Xshz3E0+d67XnE
         +542n1lW/R6eUmO5YRNXxcWZ7yMDYluwavQ4xfIrqWH4+AMxwW+MZMqV0RM1PEJOOAUp
         dkfy12LvUhT0Cazlp2CUUn/5IVhOQ2FCycaL1o+NJ883bTuhxKlGCwyhiTC2sFCjNpkj
         1KErAkaA5QsRE1mwo7NSBuOcKwhr3BLL1fFqcCBhZEIDhUYje/IQS64iXUttz3e8OCkC
         NjB5BCJY7uYh583BehOF06asX5XK3+Ut9bN9krdVHAKoNI2hReE4zqcbJ1XVOWPxDl+7
         cexA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cYhFiwqA+wDjtVVMvyF4BuvxXVvpM8t3h/p4jRxczq8=;
        fh=iZmBABIUm22lzHPuQ3oKgfA/6s+v8MKTyWZTiQYaS1A=;
        b=j/48SSasmvsWCtl9PjplMmyBXh8/22fS02OpKb86ROzB94Fs09ZT1+ZiGoaCnMgeBV
         Ryk9S6ilS5ak0jHp7lZ68eYO/5Uw3Nsk7dr8ZZFkcciM2cQvVfXRr0ELx6lgeIWc6IwL
         7irXnwRuPMCsWKz/HwyKIIa2UQ07IEl9t2Gwveqeov9CR7HWnsv5spS1JR5lE9Z4ZNcj
         9zHyhvf6DMpSiBWKsWkJ+v/ZDU707e73t697pRgCknUeEh8DAwOavqSO7UjYznaneDsb
         tPYRCsMqZyZNRpuxzvrkdLX9FT2ShyQ7iPc1r5O81uAsyAWmyy+paIF+a2v4f+JsryLz
         dI3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775336660; x=1775941460; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYhFiwqA+wDjtVVMvyF4BuvxXVvpM8t3h/p4jRxczq8=;
        b=KYgdSmIuBUsfLulTlFhb2YpYIXrJNN8Ey6iO57qg35WRijKMe6YFGq+FGAgJCEODC9
         vP3hOF7GreaMEm9KS1alkLhuniQTIzIn01eeKtfEOmh6U9wNjOUmLqL+NxjASK38pxzu
         dbJZwmv/CFXqW/uVzeaUOg5q/LjliiC1KxsxM/1b2MEaPtlM49IMa6UY9D3CdtYwP1Jh
         kVDUZI8V4gU5mVWHJCF6TPuEI3zTZRkpe99c4SZvVMw9FFPema24bjOvKmHUuVWSLNdH
         3mQsnPBnFpZdeWjtHQf3TqzQ48cNrUWQj7oJxL5LBwTFPH1+NRjuyXjhYusuOtwx2tkp
         te3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336660; x=1775941460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYhFiwqA+wDjtVVMvyF4BuvxXVvpM8t3h/p4jRxczq8=;
        b=WCDQNB4hAVPql+H0L96YnMSVvark06vApdlryTdRbDULxDTpWhqr33FEd+09Z4Cm+u
         DdJuToTQO5Krc5yDqDp+iCEWH7+XaQBVnq9A/cGoxZDZPlHzX5qld9hYGoX0Nf+p+C9P
         s65JP/dR0snprTI8bp06A1VH0r0mxdo5kovtoFLwbNCwmgubrXwjxCqgMg7mvLcjeMRt
         Vr8h9mQ+aaNbIgkxn/mBvrKwtg4Tm/HomQziUFqUqD2CExlhGyDVLo0fog9OG3kvAwT0
         BXBdakEwFSokqZq+rPIvz6/WPvK2g8uXyRRQlW3it4Xahy1JUh5GBsxZxmQwOWi5MJ9V
         C+YA==
X-Forwarded-Encrypted: i=1; AJvYcCW8oaA9pJlvyo/CM2v1lTa+bkTKXdviexfYyNqtqcFoJTtbrirbfXpP4lWcBZGepjrQwNju@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ7tgUoV1QG8Y7tSAezB++UOwl2xLphbwWzVFGZFH94OUWiIcJ
	5LJxgneGigKiIykaZHLBGnxyGmbBl34QG8h0oV5pzrSaswJQ1wGtcnuA5uqxo7bUJdA734zhclY
	nanVOu82YvtCyquZDLcRJud6sa3ViXls=
X-Gm-Gg: AeBDieviucj8mfsB1sZ1DakulxuuQJ3T48PZxkqjks7CZe0C+m4wBDZcREZNJDGE9Gl
	ghyK5G5jBpL0FLKMXW2qRZTk8esfCLHkmHdlbZaQ8ylXzU8CI5lNOPyhkqncYJ09kWgOFOVthjw
	YC+IRRIT670yFbdOzoN6M/pbrBgR9ZZGzcCYFdEHNwXlfNo1rrdwLL4IMTAkJ4GGZZQGbmRhNTb
	tc7xdvjMQyLwnjaqBotAi6uI8PqQbDxJ/Kc11Q6BYvfguGomIMRyvZM3KAUamiHqNpMA2z5uCNV
	Q4QDfp8mo2ba9kJevfiiA4SXOe/OZEOHPZneHsWhMLCOSyeZJ3+vN6d12Yue+hs61QSYAzlwRmc
	WwwSzy4g+6+Pa9XPd9QmmLI598Yk7Hz6SnA==
X-Received: by 2002:a05:7300:8623:b0:2c7:8e1c:956b with SMTP id
 5a478bee46e88-2cbfc16eba8mr1628403eec.4.1775336660175; Sat, 04 Apr 2026
 14:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404121610.1956528-1-mkchauras@gmail.com> <20260404121610.1956528-2-mkchauras@gmail.com>
In-Reply-To: <20260404121610.1956528-2-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 4 Apr 2026 23:04:08 +0200
X-Gm-Features: AQROBzCMgLHa7cowntiZYSKVuRyKGh1fP2Cda-tJiBMZoAlSB8e92ElsqLSq1yE
Message-ID: <CANiq72k1KN68wG_dh0GcTyfiXUyrVUErJ5D8AOaV6z6=sX4BAg@mail.gmail.com>
Subject: Re: [PATCH V9 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 4, 2026 at 2:16=E2=80=AFPM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> When building Rust code with LLVM=3D1 with -j1, rustc was encountering
> an error:
> "multiple candidates for `rmeta` dependency `core` found", with two
> candidates:
> 1. The host's standard library from the rustup toolchain
> 2. The kernel's custom libcore.rmeta in the rust/ directory

Please clarify in what conditions this happens, e.g. when building
natively in an architecture like powerpc for which the target (...)

Otherwise, it sounds like this is something that would be happening to
essentially everyone just by building with `-j1`, which is not the
case.

Also, since you may need to reword a bit, please take the chance to
use the present tense to describe the current state, and then the
imperative for what is changed. (The past is usually used for
something that already changed in the past, not for something that
still happens before the patch is applied -- I hope that makes sense).

> - Update rustdoc-pin_init to use explicit --extern paths for proc macros
>   as pin-init also needs alloc crate from -L$(objtree)/rust. So the proc
>   macros needs an absolute path

As Gary mentioned, this list may be too exhaustive, i.e. one needs to
see it in the diff anyway. Usually what we do is try to summarize, and
most importantly, explain the "why".

Also, it doesn't seem like the list covers every change anyway if that
was the intention, e.g. the removal of `--out-dir`.

> -rustdoc-quote: private rustc_target_flags =3D $(quote-flags)
> +rustdoc-quote: private rustc_target_flags =3D $(quote-flags) \
> +    --extern proc_macro2

Hmm... why is this needed? The variable already carries the flag, no?

> -               --out-dir $(objtree)/$(obj) -L$(objtree)/$(obj) \

This looks like an important removal that is not explained/mentioned elsewh=
ere.

Also, is there a reason why we cannot keep the `-L` here instead of
adding it in every proc macro library?

> +    --extern pin_init_internal=3D$(abspath $(objtree)/$(obj)/$(libpin_in=
it_internal_name)) \
> +    --extern macros=3D$(abspath $(objtree)/$(obj)/$(libmacros_name)) \
> +    $(call cfgs-to-flags,$(pin_init-cfgs)) \

Hmm... This special handling isn't great, and the fact that it means
hardcoding/duplicating `pin_init-flags`.

Should we move the proc macros too?

> -               --crate-type proc-macro -L$(objtree)/$(obj) \
> +               --crate-type proc-macro \
> +               -L$(objtree)/$(obj)/host \

Spurious newline added?

> -               @$(objtree)/include/generated/rustc_cfg $<
> +               @$(objtree)/include/generated/rustc_cfg \
> +               $(rustc_target_flags) \
> +               $<

Why is the variable moved here?

Thanks!

Cheers,
Miguel
