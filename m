Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE26398FB6
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764851060; cv=none; b=mxwSo3Yy9DFBnPtO9uloJzzhU6lofWMvL7nVkI9E8MXqFiKb3GnlAKiwmGBwHMS7WCQiONEjjG/Uh+qMdcw7npzwmi1VVppxSRjAkHx7gXBUFsJFx1ED6bcx0CtvG5bEm2sV3qL+4nPZ3MyzuIi8ygT+Zy6AcfSZmwdwuUSNtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764851060; c=relaxed/simple;
	bh=wx7YOTQm1+6xH4GoEtrFQixMVUNTd1Is2awGZzzUXxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aJWQQt/Q62HbhtwiWbpqYvzMYIhmvAmOFxocX9KeHyj9BOFkaUOqIkiAZHs6mUGV/sdRvzZKbnLawCXn60MTdwz49q2EGHny4LCEK16qvvm4NMVa3hbvU71QQA/+8Ejtx4dNmK1FukGetskRRrr+KD/wAsKUlxZoevlw9IvkHCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QTBtzOlr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QTBtzOlr"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-299e43c1adbso1050535ad.3
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 04:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764851059; x=1765455859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx7YOTQm1+6xH4GoEtrFQixMVUNTd1Is2awGZzzUXxU=;
        b=QTBtzOlryJmEOdz4giyluY9Ox9VdasURRpWgcaYmp7dixhT309Mi9b7BZq5iDJaKkz
         /zR0/UakFKu/84+BAlqz1g40YLiAvo1yis44pzxULw511l2rEoEyLzCrlFLfSWh2dYUy
         GKUsQRU833aFfunjq8Qsy4ZXdUnftw5AuC7M1Vo2aAQ2iD1SxYdCeWTIBAi0cjnP6IOe
         AohTaOxsm4x1M7MyauPz5+FRexxEL0DSx+W2TdTjDZqIavX3HA/AYOaNLrqAKv51NoGq
         Pn0c6P8jCCPpMCWR7b2XF7wIbmYVGEMnLswoZHWdS60ZfRX09TtJ8tDsGPvgxOUyBZSf
         jqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764851059; x=1765455859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wx7YOTQm1+6xH4GoEtrFQixMVUNTd1Is2awGZzzUXxU=;
        b=qfr9lHtGxpqcLl8CoQZTpvVLtNqT+fLAxZZcCOjuPlAgT6ybJQbR4g2oQhVWtl3Ud1
         7dQ/6t9TaGAIXV5TJbpex6zY0Dw0qP/XkKDqGXlr7Ln/JkkvGE0Q665VFozgIgwBoI8S
         SfZm+CRRAej4GJqYUtb+RlUGdw7Soa/bq0knbdOlsujjCPJGAVs+CxqZ4vwzOpC9RLv2
         MPQMLMGl742084EZ38+EgrL29F/n7rc7sqQix1jnp8hRz3WiGF1u0S0kyaH6XRgqjMSk
         sdoYB5bPbkoAofEe/XWP4RAZr3uwZVzuLioZwyxTe9YxO2MCir95Cnqh8hBVU/AH283g
         BtMw==
X-Forwarded-Encrypted: i=1; AJvYcCUoKBjqrc8uQIJNfU2wGVQMhJDyA64j9QKbpb1++2vVV+14DTnMoxEG3aIPR+o7eALv/TXY@lists.linux.dev
X-Gm-Message-State: AOJu0YxWIRr44UIIcLKqqZLw+8B00LhUrlVBLHuZ6lnwxukKjLy8w30S
	BbQXw3Fq6A0IHmcLf3niP5ttPYx2DSV5CKvSrBiRZ/m/2ulTSID44DrsqWJPW3YU3LfNpTSpEb7
	RgWqPg6VyU2eWqQTCbeQ7Xzvc0bCoo7A=
X-Gm-Gg: ASbGncuFFy61aC9LoXO0MmmEMzHCu8hvBw9bOi6H/OGGsNoXVSGKgWGxxzkcLz6Yr15
	MreDCz//zdRfJ1cc274T4gdbCta3W73bGLnY5DZg/LmlR5GCuQXa9CUbdCzzmXGyWWTcG6aIqog
	H8sP6jYIshfiebe+QDia195m+ZhOzLTfT73W3rC9+rsEwDF++00Jydlzu3TyM1zM9P1wq5/lKFT
	pNcZ2c8wRHQpCYv5bi2zuC2Cvu44PcGH4q3GDbT+ATxVmP9+TbPzdR3Sm7Tf9Ni7hmk4bJBEXu+
	ZB25yzADOcusQI7UxQ/ON7xJoko0YfU7UfENuNgLH2pHb9k/aqzw+MYJMDulfTOSMUy/yCGEZI/
	JeJXLzNUKAUukGg==
X-Google-Smtp-Source: AGHT+IEGCFDBt2eoPSljCNpANqr750UNfLEzTSVY3v8vro8CTu0dsedRZV8/m4AnguLNbvon7weD3EE/mhrcNnr6gGM=
X-Received: by 2002:a05:693c:2d91:b0:2a4:3593:5fc7 with SMTP id
 5a478bee46e88-2ab97b11c4fmr3497869eec.1.1764851058645; Thu, 04 Dec 2025
 04:24:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202512020454.Tf36WHw5-lkp@intel.com> <3447801b-95f7-4368-a433-e79669b5d22e@kernel.org>
 <lBhfqvej6RgECA1JyZ0zOpPTpcVF5ALMyOHAKGmHvM8HTxdqgCqEFn1xpvUGcCTJ31qM1Fptxl0DLLHcHZJo4g==@protonmail.internalid>
 <aTEi3KUUkPVGS3ix@xsang-OptiPlex-9020> <87fr9qwjt2.fsf@t14s.mail-host-address-is-not-set>
 <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
In-Reply-To: <f2320396-4509-4591-983c-6eb96db85663@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Dec 2025 13:24:03 +0100
X-Gm-Features: AWmQ_bm22o0HmIVipMvKSSbI8f__DLAk-7_3xkoLhOObPhxc2fM3rpD9hD8rtmY
Message-ID: <CANiq72mNQDN5cAi9XEo5X48ZNMjDoe3xkAeskFPcSjuhBCXwvg@mail.gmail.com>
Subject: Re: [linux-next:master 4752/13171] error[E0609]: no field
 `__bindgen_anon_1` on type `bindings::kernel_param`
To: Daniel Gomez <da.gomez@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Oliver Sang <oliver.sang@intel.com>, 
	kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Benno Lossin <lossin@kernel.org>, Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 4, 2025 at 12:59=E2=80=AFPM Daniel Gomez <da.gomez@kernel.org> =
wrote:
>
> + Any reason to use an unreleased clang version for this reports? Since c=
lang-22
> is not officially released yet, issues seen with it seem lower priority t=
han
> those reproduced with stable, released versions. Does it make sense to ac=
t
> on these kind of "bleeding edge" reports, or should we wait until they're
> confirmed on a stable release? Does 0day test both?

Some people in the kernel regularly test with unreleased compilers
(all GCC, Clang and Rust) in order to fix issues before those
compilers get actually released, e.g. ClangBuiltLinux for LLVM, I do
it for `rustc`, several people for GCC, etc.

So I guess the idea is similar for kernel test robot? There is value
on doing that, and whether one should act depends -- if it is close to
the release of the compiler, then it makes sense to try to figure out
what is breaking so that the compiler has a chance to fix it.
Otherwise, if nobody tries, we would get quite broken compilers (for
the kernel use case at least).

It is also why I think having at least a basic kernel build on the
upstream CIs of the compilers is a good idea (it already showed value
in upstream Rust and perhaps we should talk about it again in LPC for
Clang).

But, yeah, the reports can be confusing and reacting to them properly
does take time and effort (e.g. I need sometimes to bisect the
compiler etc.).

Does LKP try the bleeding edge versions only if a stable compiler
built successfully? That could perhaps help.

Andreas also suggested yesterday in our meeting to have such bleeding
edge reports perhaps more clearly marked or similar.

Cheers,
Miguel
