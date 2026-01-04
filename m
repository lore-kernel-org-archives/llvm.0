Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49883277C9D
	for <llvm@lists.linux.dev>; Sun,  4 Jan 2026 20:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767560020; cv=none; b=Z/vDgK7CAJB9YR091HIrfro3lbm1NpuuL8BadKK9hzzfwg4T0YoBvHQMETBA9vqLtxDQ6pTeyK2YXTplOlfsPZoj2OhDVh1JMLEnr2Hmz8AVXbGmhu6gRwkjwAqikSp1in5a8Oc5nYGtZ7whIqQYv0AfsCh75or6t14hMEJEnfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767560020; c=relaxed/simple;
	bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHB1ufjH4CB+sAd5TwM9QhKpSwuKcajNCywVjRRFitNGXVcE00MfNFDF+Gk0pOFhu7HjBFEjmuqGiuD2E6bxXBtGnDZfKe5Oqeqok/l0o6fctgWD/HPEyXoT20euLY8tOsch6zioOtSqWWNj/cEfil58fNXWTKFtl+vz+KPi2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJFVsgbs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJFVsgbs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a110548f10so48535565ad.1
        for <llvm@lists.linux.dev>; Sun, 04 Jan 2026 12:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767560018; x=1768164818; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
        b=eJFVsgbsvMRkYzoZA2OqiQJuhCnKg5x+AJtVvVD37K+sJatKW1UqfmaErFlwEtQ0H3
         meeV6WDKEsAtUwgcbpTmJ1gH975az9l1byF+zRVPfb01FeDKWE58+J4n0VUHxgSXagCe
         QCdpao4otivwSJzicwndsGZhdEE5Ln3iJNR2/nEJDclfj9IUjRVTI1HRf49jfy1YugwQ
         d4jqZWtNLfzKwfqoZCYqOQrtLEoEVI056/4Vx5BfdpbD6olR/pLjRx3pZrIVgGLTITiC
         4Dy2Zx6zh/3QcZuj/y4PB2QndwvUABNCOrPrloijFDFaTucSEMUq2VKChcdTWm5o73Bk
         MBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767560018; x=1768164818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sK5xKgJux8sT3Sx9ZUS8NtOGkJPrQ0I7tH8PhjrPm4A=;
        b=P8t3iuPtW1oCrOJVNgGfyeFebCDbf53li0tbkCuxhfKLQn9cACXwrd1lQb8GUkK9SC
         +D+WYn9SQVqFJz3wLopjEcL0YOjaqr171IohJ+alroFSwDoxR0gnqoR5GRbWUN4O3RPQ
         H2KwIOgOKomCzYtolgEu1gaSOYf4B+eZUglu1J+kXja/0M8lQss2hJXNbJAjal3ofVC3
         HldSsDJXpEu22IL2Xwv99RVSCg/8euTnHYwdZjfrchzmyQjFUxGmP7OE4003SCeCubOG
         4R5aHBWjXsH6qlJcw2sE3dVl+/I2vEE/yDre3nuEX/ZmrSgh+ikRp+C7FXzFF1G/7Tpi
         m9yw==
X-Forwarded-Encrypted: i=1; AJvYcCWz3/k1QYqRpxUFLz87mVExCqJfDXNNRq610yn6Us/mBG63oUAdUCFI9W/XTUK7Y2ox76Ey@lists.linux.dev
X-Gm-Message-State: AOJu0YzA/hh3EkDHfTmXg1bZjzfc76onvMcBUEnLygoxEu+gmkP71vGq
	RWIXYQT0QVqA06hiHHW2eVpsFBxFvAX1NCvAqqaauiSUvGgh7bWJ59qQXDrgk6Dl15IUm48hQgQ
	UUG+44Dh2LHsU181HQ3j6PFxAMRMPeJc=
X-Gm-Gg: AY/fxX4sjAU4bWcYInbC4+4OOiVEz5tjjNxx0r8uqfXFdSEzlYE4q9YZsxW0G0lSPLS
	SBRnkCbcYUZG73HVC6HVqjRzqAUjtwedtSa9y0ws3EbaagX3S623jDpK2b7KsZirqrM49Jp71pj
	1eyuNu+jTtL9k98RvsGnIbCWsqeYgV6Hm3V9Ia8tIKNeJzCgijClw8mW5fAHfNXmg+8FeU3RQ9c
	F/TNk8RdPO/l+2kio0BaiwFSyKcStwtyNaoyhHWxk2pxS7SofphjNJfFBrSWDKZMTp1LyqfMJ0H
	3Q+jey1qfQH/md+KWCuSFaw/aq8A2LRGTbgR0VcbvDMY7qg9XS4qZ0K9ogNMZC6pXW/j03x2ojy
	XBf/u/7Njy7fq
X-Google-Smtp-Source: AGHT+IEY5WU8qdT2x4W9RhyaoUAIxe/Revt/XcUhrg0fBmvqp9LK2uRUv+DpO1/rHFugYJh7v9P+cWIgLbf4IU/ffNQ=
X-Received: by 2002:a05:7300:e9ce:20b0:2ae:5b31:5dc with SMTP id
 5a478bee46e88-2b05ec6b143mr17044785eec.7.1767560018452; Sun, 04 Jan 2026
 12:53:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251217150010.665153-1-siddhesh@gotplt.org> <20251217224050.1186896-1-siddhesh@gotplt.org>
In-Reply-To: <20251217224050.1186896-1-siddhesh@gotplt.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 21:53:25 +0100
X-Gm-Features: AQt7F2qb1EDeyLmlG9hUTUI1fBPD9sLv7nfHHvfBJvOJxdTKvQkzrqD3Rmnu53k
Message-ID: <CANiq72n0BtCxAsXOaNnSMWC-aW2bNTPzN=4VGb+ic8YA6jhsAw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: Add -fdiagnostics-show-context to bindgen_skip_c_flags
To: Siddhesh Poyarekar <siddhesh@gotplt.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: rust-for-linux@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, stable@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 17, 2025 at 11:41=E2=80=AFPM Siddhesh Poyarekar <siddhesh@gotpl=
t.org> wrote:
>
> but clang does not have this option, so avoid passing it to bindgen.

This looks indeed correct, although it is not yet in a released GCC
(testing quickly in Compiler Explorer, GCC 15.2 doesn't have it, but
GCC trunk has).

I will apply it -- Cc'ing ClangBuiltLinux and Kbuild so that they are aware=
.

Thanks!

Cheers,
Miguel
