Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6858E3AA1AF
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775036767; cv=pass; b=u7zlyUoM7dgCdJSeihmxxZXpJ+dXBb0OmwbGXQjjCTwMLDLiy2EBH2FXLpOAkq79m/OjucKwZxbNU1blGNAlpgsyQk+wAboBNpCaWNjwooGM+4cIM0r5DQYUE8zH9PhbrpJ4DwJ4dOB2RqRmMEPipexwVbSydDDlzelhorBL4bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775036767; c=relaxed/simple;
	bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AogZqAGPT3kNRRKforrBcaO83Al11C6iJdQMlZacW084RdqJTq9qtN/8UkzJOS75t0LrpJeDP1aS1QWahBvmqZ1Xvjgir/xlCajzY9y2eEoordyCO1tAOH0oRNDRfFYeYQQSbKZbtock5IUqGQS8xV2ngpJtuc1evEVedrsMLe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z21eSHLq; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z21eSHLq"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bda3b4318dso446553eec.1
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 02:46:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775036765; cv=none;
        d=google.com; s=arc-20240605;
        b=jEhzKYo4s2/uDFIxG9LV8eKi1P8SU1PIhYdKDmiShLQxJiUuHxNGwq7o3ImTgs4ulm
         Rv2xIN5K9hugkxEOtx7dra4xj/JwYwX0Ef5JmjaIjXx2Nm0rdrr7HJxDHpLIa1mWd9H3
         Y6+ow9JUcJMqYMmHd0BDfxJDBGfThNS4aZPbYAwSJqw1sy1BB+Kyp5nTSmDRLfkGpaMF
         YQ37mZbvCohYL64eMXYXXy9spnDDd20Us1pORkIzRjFs/VokC9oJOM9nCR1yjOmR7v8q
         ZEBtcVqKyr1wue1AIzULyU5L1Yb2MgAJGfO61WjJWyv0FSGWgXdb2zMGkl9LmGAoHIBx
         mfMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
        fh=tzmkNdta80CBADcDHeE3pvA6QkZ73nVXyC34NfgczEI=;
        b=OIqdQUErSEiVai7WM8L6S1TGADuJHwZgOvBtUV0a7Qs+RmrqcJc0jYoHORDz8gQZkm
         sUs5oDq0a5vh7lEkcrBJDF7A3vV+1+FJtvw4cFqbV8c+XPuw//tgKYVld4QegZtP7GWZ
         mOBPnOsCw4pEUMneysCyw0SKBLkMaf240X/aQnIq5m+BqAetUK4Cy+dCLpGO0t+K2J6H
         qkB/p3Kqx7uHFgIEJpB7dYTS6KPpY2v9nRLTvsschWXRswOi6MNIHf/Y/+MIV0PjrdHR
         7VSY9fqtHEU/IY1XjnYuq+jS0kxQhg3cyIkCC9KvZHn+lWybkFsnv5wfNNecovVg7wWC
         Veeg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775036765; x=1775641565; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
        b=Z21eSHLqgrOkCNZLMZNDfbQoZgQ5dtB88aT/D8S5Nh4qri29G+D85QBqUU9gOl8vxb
         N9AG8r67xsPkh1tgN2fZsPNzglAlaLDiSUwqhGioOWrQzdYav+uKTb7Uz3ZZZqDCE9ic
         0CNfq3grD/Gcqsdx2Rp29gAN/Da7D6cV2ZsuBm7L4L8+Ae87fJ1gF0bmgUR2/FezUNDC
         LEEdGBfrNRLEtCUIgPzbND7oHK+BhnK6w9spf4u8U1146FU1lL3fNF+J3vSCKu+PKUwl
         7VqRp1SZQp0u5LJJK1uxDWcV2zQ+zYIA7PyNji1N52oQ03B/x4fGVfKgHHI7hVsp7j24
         7Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775036765; x=1775641565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TCQWI5Q6FGCnOrU5VBk3cALOemQLRDh9ulOpMQcKOl0=;
        b=QJ0WWUa51pJwaMlL3cY5KyrfE+7q/G+oKcBYJaNPNaUDKY6iDvX3n2+illcqaFAGU7
         uYBJyiwjTYderdKA3gazvJMeKsoU21AK3iE8RZ1AMcEv2ml72v5s/S5nZyJyu378BjkM
         eaLkCjcDfTA//SVqu99vjKAhcf4sKZ0Gxlof1lrEssRrASHptzdiAC3aT8jH3i0Ee5On
         vTs76D1mOxG0VAhAkYbPHhEsAeczIKDMj6oqag9O/CK6yo0NKEt3W8tBlS7eMV4Xby4p
         6WV7NyLrtAEjiLSUPBmV9fHwC3oL6TtT0y6X7TylgwexhoVNp95RHyyQahudsEVMll/K
         UuoA==
X-Forwarded-Encrypted: i=1; AJvYcCVw/4gEm3b6C7c4dJ0HNwhUrPmrqv9YQ1NpgxX+9c05qamY5Yu2+XCwONvwPjG7I+EFAmj8@lists.linux.dev
X-Gm-Message-State: AOJu0YzFIIHMFiAWUbnhPyvAa9lSoIKWaIV7vIjdFTITzcDpnOBj+qsy
	IjsP3MeYuB7Bx7EQFZvaSGrzyq3WGUPVrFaDLOzNe/NzMmgOxo9OMJcYPybp7qbHgxWt1hoMO91
	3SHgE4WJY53R+f2kJ0+klZeluLbRFoF0=
X-Gm-Gg: ATEYQzzj5IJkNjGlZclGs1cmFqGAp4yrTX+/2bWmVh/6sTQG0E2Cu/vpNHoETODFMaY
	/wm6mlaxzGsv4OwgkHOD/dEHgjFNohKRUF/1Mi1OZOAWkRWuzLvKhPG2F8QSKsVuacbshfGorf8
	Y2DBtTUEJ7Jub2anZ6jqVUe55Xv2dSR9Eut7+vkpVsK7RXjR2+3nbfMutTMthyRcl5bKMWlCp0p
	zKm4qORooa6OZTPZQxeQPA1eBZRvPvw2g0yKZPgm00NkJx90NiIT2VTb6Yk7Szz3Enm+xpmgXtZ
	x9wftda7cdt1yPhltEPlESUyhPDQXLWO9ZV9IbPWZcXT9ixz7xHtGxEUO4C8AO2wJj3I/4Ut5w7
	vqDOy0L0gka1tuqpbGvULgNE=
X-Received: by 2002:a05:7301:7c12:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2c9327a40d3mr747575eec.3.1775036765317; Wed, 01 Apr 2026
 02:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331-kasan-rust-sw-tags-v2-1-f6765e3e1a2f@google.com> <CAH5fLgjbrFsJxikTe-94x4a9Q3K6V5rCJBK=0pmZ2_qjfreBBg@mail.gmail.com>
In-Reply-To: <CAH5fLgjbrFsJxikTe-94x4a9Q3K6V5rCJBK=0pmZ2_qjfreBBg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 11:45:52 +0200
X-Gm-Features: AQROBzCjUQu7NjNHmPbhIZ1BAZbb9ZAEsapzitn57V_yNBap9S6NbPzVn7RTz6M
Message-ID: <CANiq72mh7xnknFUyZ74=jBYqVP_Qqdg76SCFTzRDHV_J3gbqGg@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kasan: add support for Software Tag-Based KASAN
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 11:13=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Sashiko is asking what happens when GCC is enabled. I think we just
> don't want this enabled together with GCC. Miguel how do we usually
> handle such cases? I imagine we have quite a few options that are
> probably not compatible with gcc, but I'm not sure we explicitly list
> all those cases in Kconfig.

For options where it is """OK""" to drop them, one can use the
`bindgen_skip_c_flags` hack in `rust/Makefile` (which is best-effort,
and which we eventually should not have when proper GCC support is
added).

We have `--param=3D% --param asan-%` there, but to be honest, for things
like that, we may just want to gate it with a `depends on CC_IS_*`
instead.

Cheers,
Miguel
