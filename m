Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEFF222585
	for <llvm@lists.linux.dev>; Tue, 11 Mar 2025 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741680404; cv=none; b=hzts2NmgOxMctkpO2Zg5lfZUPBRMMh+s+J5VfGmqvi3+KtFLEYRTcWF3IS/EcOiZ1vwXJ8EbOAYl8aI7P3kDjMvUwDsf/R+3bqU+T0jrtlzIatmSbWhpUJ9/TVKNrFnTsgHS0e5j2rUYsai3JrBDajnSMji/6aA4ChqcJWzCLLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741680404; c=relaxed/simple;
	bh=GqsHdypcLuJf8lTVxKP4YCkbR9d4MU9dFUFykzw15j8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uRkZVFyXBPjfiX39nuuuR/yW+V6sTuw/Hnxb0XQFfhbX7uhmuR29abswAXrqQfCqdHFZFXpjzAhxTlCgFkKDqdtrXC0CPQhg7qUgfMTKbZqftBByCPNv3pYaUSuY0FnucmMyUwEdHu2phO/ZUwAYDQAQCESOmiA6mH2HAh0/75s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tFAAj9i3; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tFAAj9i3"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-39131f2bbe5so1765126f8f.3
        for <llvm@lists.linux.dev>; Tue, 11 Mar 2025 01:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741680400; x=1742285200; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+xcm0K1L7sxdR65HoWG0zR/e3ats9JqNWJReeEzbxwI=;
        b=tFAAj9i3Gmxl7fvlp62tEQmNgEgy79GGw2oGWspDkZILgrAZx0YybAXzJtRQncT8Q3
         GlfelcPu8rIhiwzhRWtK8QfjOd5I7r8ebViqqDybQWaVTL+xiVrxdYbgkrgIPfEVwmhM
         0F/J/hQSrQP4F+X8FYQKL4SpDsEetIYhcbTt6MapoPasC2gHxRhok/QTZKEann4MLYTL
         /RyNzqdMTUTIuXoU/0c6TWL0ROKNy4ljv3DlzCoBMbfHtj+1Xes0ZS+z1+QB8LgdMZow
         NGC4ImQ76UnShKFGk7X6S/1uFUR8QWXqqBHbemD2DK3kEf0MT2O1WhmMEh7GKOQZH6uF
         Sh5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741680400; x=1742285200;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+xcm0K1L7sxdR65HoWG0zR/e3ats9JqNWJReeEzbxwI=;
        b=UdFkP5pmzuCahgVQy6Xg6+cdNRUqvGMh5tBopCu/Ds+z3bIDBMMhxHErsZMj4HzTWn
         QIDM8VusYbQ31m0du822tg+VWNaftlkBmZIzElpTBLS4wQFcaXly04vV7EXxFpi6Z+Yh
         YVFwGybE60uIkv7UNaRk5lTmj6j3HG35r0E6cDuYEykPSHUlMNAlWNzur2urxfuKFYmw
         W+1GCPk7hBdo5BRyQXSWil5lHf0FdjWZ2+/7GkQPBg26qHCKpSNRipt7zAtBKER1pqtp
         uGci2+qAwCHHGFLz+Xnb/fCBAFjogPweJU1QZyb7s5fLfl6XK65g+tn8AVva4JKsiEXA
         k1kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQWRumNcxlbtc6syBMbnqZq5EiZFSlG13gwfeLblrrOXm2iDBPgneUkQ0kiYQrJmbPr6J8@lists.linux.dev
X-Gm-Message-State: AOJu0YwJvJ5gBvoW/YBeLxvgfCST1qfd9rsXf1gl6QSW4E8stVkAfxtp
	sMZNe1beiIAzxqw+yhtLHiHDCiXlqrchLE2czm8NgAVWeWBDKi0Uh4AJvN1XfRT6+eOFJ1KLZ9x
	/oTgmEsNxoUTiOQ==
X-Google-Smtp-Source: AGHT+IGcrrTZTG+W6fZIwGjmzmkf4h8EJ1uAraxQiM1Mg0fkq2kWsZ8HARHFOyd2xy638gr8elcSnBE/hFQsuNY=
X-Received: from wmsp32.prod.google.com ([2002:a05:600c:1da0:b0:43c:f3b7:f2d7])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64cb:0:b0:391:40b8:e890 with SMTP id ffacd0b85a97d-39140b8e9f4mr9380366f8f.22.1741680399906;
 Tue, 11 Mar 2025 01:06:39 -0700 (PDT)
Date: Tue, 11 Mar 2025 08:06:37 +0000
In-Reply-To: <jesg4yu7m6fvzmgg5tlsktrrjm36l4qsranto5mdmnucx4pvf3@nhvt4juw5es3>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <jesg4yu7m6fvzmgg5tlsktrrjm36l4qsranto5mdmnucx4pvf3@nhvt4juw5es3>
Message-ID: <Z8_vDWjk2LpBqLre@google.com>
Subject: Re: [PATCH v2] rust/kernel/faux: mark Registration methods inline
From: Alice Ryhl <aliceryhl@google.com>
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?PT91dGYtOD9xP0JqPUMzPUI2cm5fUm95X0Jhcm9uPz0=?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Mon, Mar 10, 2025 at 03:51:38PM -0400, Ethan Carter Edwards wrote:
> When building the kernel on Arch Linux using on x86_64 with tools:
> $ rustc --version
> rustc 1.84.0 (9fc6b4312 2025-01-07)
> $ cargo --version
> cargo 1.84.0 (66221abde 2024-11-19)

Is there a reason you didn't drop this from the commit message?

> $ clang --version
> clang version 19.1.7
> Target: x86_64-pc-linux-gnu
> 
> The following symbols are generated:
> $ nm vmlinux | rg ' _R' | rustfilt | rg faux
> ffffffff81959ae0 T <kernel::faux::Registration>::new
> ffffffff81959b40 T <kernel::faux::Registration as core::ops::drop::Drop>::drop
> 
> However, these Rust symbols are wrappers around bindings in the C faux
> code. Inlining these functions removes the middle-man wrapper function
> After applying this patch, the above function signatures disappear.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Signed-off-by: Ethan Carter Edwards <ethan@ethancedwards.com>

On v1 I replied with:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

So you should add that to the commit message when you send a new
version. :)

(Unless there are changes that require me to review it again.)

Alice
