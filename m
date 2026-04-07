Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11023EABC
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 08:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775551063; cv=pass; b=M4DtEAmh/K8CFu/M0GE1MjfYY6GVCtVymZVwsiDaSVAipbCxYXvrJgjXVXFV8tfPNEyU16bbxzupm9Jq7yqHp7NnXQQrlj1S1JXKGynJCp1bY2Wq6L+zS58EdGiNGdTYwv1w1ViI2TFXhUrlv9iau9dYpl/ZITRAsAwlY0AJ+Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775551063; c=relaxed/simple;
	bh=DfoJvrhbR9/q+l6t1NPKmCnTz4p/S80iMM1QrEsDKz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJtVlKTJnfHFhY8oCtHtDb+sNOhtwNqod9J8FCk/zuebDCuV2s3HBW2Yc1EKqBI6OrHKmAjVo7o4CnEfw5teSvMfd7L4KK+B7cdCk+OXxXGhb8SHvH9jBvGwAACz21ShOSSfjciJoD7UZSR1iUm+CnHlE27Kcz/NLo8jV2n8Vjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mlF9tBwJ; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mlF9tBwJ"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so326003eec.1
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 01:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551062; cv=none;
        d=google.com; s=arc-20240605;
        b=cJe+ux5Apy9UxQ8ILRPjAWu9SmoQkl5hV1FDWiOoDxHBEqia243PzvghMnCtbu+rWE
         pTzH09UbDF0gcXQCbLNIzzu9DWBt8kaQfyFv6hC/o3otAUlJ8RPdIjVXx9MRRfAvur7b
         Ty2Pg9EHmptCyaYAzz/78cO7opqhevUeU4R+9xSpxZXQuqtneGIX1GR4lxMlYREmCB7S
         JuacUNTqf5QR6pDVRLY1bDv32tOHdMCcOnOJKAHo0fNVPaDFMLTKBY8cen3UEFBIkgh2
         dfLfnw4FSssMtc0QIYCF7hPpHWG3sQalZF1A81Y3psYrYHuRXyQqfV0sDuVMbmkjJRpR
         pjSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        fh=z6XZ+BDBOozU8IpY7hBvTQyUhWG9e9D0Ao7nonS3Qho=;
        b=PxbcJTllIlOFeqdEVHfE5m3RyMHd0KuTicjH2d+FuB2xvNGCB7YDybhbiQuPVUCcoP
         BsDw4kYoi6l0BSc1EqFpd39v5zjj9Bmx37GbpSglH0D14NHkVl1wDxnzTHxn4QHKrguT
         08dyZSW3jUINUwxIVAnfsif4I5eImoGx8vLkGOBjhAgJc7KwtjCf0vPXOYzl14+sUZ9H
         WOpM/WuE4mJiqoNbnkVtHCMtp6H57pG2I9IXaKOtvMurd1Jv7PAzXtZ1kwZ34hXmx8Io
         nzp/vY3G8Snsq0dee/ohxOyJM7Zihic5ltgizCKtYOOAaIDILExC53CKLSMxMoMIXJjN
         h1Yg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775551062; x=1776155862; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=mlF9tBwJX7Yr9v3FQXzWTjWiHtpny3ia33ngr3KUw6HkKiWkOLAShI3LlqBBDRJBpp
         TMk+G7ilPZW7yHaK372B7zCNQdiqj+3aoBLR2ocZb2v0ic2/O2eBAUyTcOZnOesUfPKK
         dE17mKHzFThvh68b875tuLcCB8mYA2vWfNi2lWdk4TYRtcd14ht57cRgRve+p5rmA94G
         SVp+bA4ZTeFefaOCJYw55rN9BljNIS9vH8f4QUoLfKYyzA8uu7QpYsBfRs6jukRZJXON
         FN4u49bo+Spd6Gz4mGstRw9PKkE3p60T8OckQg/Jhmgk/2UP1XVIL4pcbFhcS1zHMnHx
         5z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551062; x=1776155862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=idGoakzJLXkdY1Eyc8AWpt2JuO/wBoas1ijt1LAdXXmiczT9sDK8HghCSM2jhybmtd
         jr5PfWTRbQFgnWdBmdmj31v5B+3jvpgZTDxrjbu03XwoMilfTDkE5nttGgs7P1IGXQRB
         cWAR5PB8BWwtxP9uSWUMwnvF8s+ErYVlEf7w+DPpulDyIMS/pSgGcx5/kl/4RthRtUdo
         +Y/xWLYzV9CBMinNzzENEspg+Jpqy51sDgsJ/VWtmr+Ppru2QsD2ck0+iks+C2SiBNCc
         xOrCdkkMBiKg6vkNBLbimR4dLBla7tMdFS/7GPB9jAq63cfTiZCWaCQzkwX4Pc04E25d
         BKVw==
X-Forwarded-Encrypted: i=1; AJvYcCW/8oDsxg2bzhRwgl3D/XHmUdaC7OIu2m+nwZM0nD0pmb2h1gVV/urAPqUbjuokBVr/5kpj@lists.linux.dev
X-Gm-Message-State: AOJu0YxUlqS7gYz34r0QYqTcdvDjmDQ330Y438VEd1wF8ed66/cp+nP6
	lOJwGOwlS3EC8Zd4WZds/hJkmMwreA8impyKp2uusJqh4i8UEjGCz3P8mbaoD/bBVx+E7jLMtC2
	A761Z1nfpRljw87YgQYUbY5h0AtVMipk=
X-Gm-Gg: AeBDies+ZtzZAXFvdX0Ghk82/VoXo661dtpRLGX9osqqjgLb8fRx1X60ozNFdOpxecT
	R6o6kIXSlq987Akw5+70+BpWv1Y1ZZzTlXn56JC1/RliwtAnU9kNEDasUGl/2AnMKJszVHmIROD
	6mMzaflKvIn6LVDWJkpWQJk0PYiyNDCbNzyniK8i5VQEMTLJBe/6V6Zgtps9ABy2V1reYdpz70s
	puzDWiTjCD1E6RP9kFHH4e9BfVhOx1g81MBo3ygvxsXmhytRxDwLun18ODwSyWYRr4KzgpFEi/e
	WZYqPDI8TjgHk/XJWVvFYfSHlfX25OHrEuLVCziUHamJSCMVgNFQuUHUomUezGfeFyUdNbE9shN
	hQQSVx2eyz1bqxtYAhbFZpog=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr3830933eec.7.1775551061539; Tue, 07 Apr 2026
 01:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
In-Reply-To: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 10:37:28 +0200
X-Gm-Features: AQROBzD3OQzI1eA28hVCCiGMvz4r5THmhHuU5dUr3xJV-N5wbeOjrOxDF8RLuuQ
Message-ID: <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 5:31=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> You're welcome! Actually it seems the lint was already improved
> upstream, starting with 1.90.0.
>
> Link: https://github.com/rust-lang/rust-clippy/commit/c0dc3b61 [0]

Indeed, I had the PR linked in
https://github.com/Rust-for-Linux/linux/issues/349, and it is nicer,
but it would still fire in a case like this patch :(

So we could conditionally enable it for Rust >=3D 1.90.0 now that we
have support for that (and allow locally some cases like this one when
they pop up), but it is still simpler to just ignore it (especially
since it can be quite confusing for other developers to see it
triggering).

I think we may want to eventually re-enable it when we use no unstable
language features.

Added:

    [ In addition, the lint fired without taking into account the features
      that have been enabled in a crate [2]. While this was improved in Rus=
t
      1.90.0 [3], it would still fire in a case like this patch. ]

Thanks!

Cheers,
Miguel
