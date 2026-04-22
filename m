Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4825F3E9F8A
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 13:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776862960; cv=none; b=ea9JmycmSWypSBaQ+QMhJto4H3RAE/h2AzsneM5ttJ9KuExGuTZHSOV6f6cuVNblaMpeUP3G8QKSdSB9p4R7ZhN+a8DWRrLzo0yN1T+iVmS0gmfiDwOyBwx8M/o8uMVln8Yh7PtoxwqyT/ZVFxtm9VY2UFgKUmrmeN0+/PzvGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776862960; c=relaxed/simple;
	bh=T1FD6RRcZe1hlxn6auCxKw8qq4oFtx3vYeZRnRheLT4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZpjtxVYnibVTFw33M1tMpSybUbwk+P5UBsSJONC6pHFc1WSFuPUNFuH11lYLYcgMW4capzsnk9ZZnQAiDsHP/k2EaZs1P/6XG1N2xEOPq/DTVOIQvE4l+pxLX42Ct84HEpGNQOB/CT3DAneHyRZV5F3Zend/eB2x4sjl5n2T6po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BUJPL0RG; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BUJPL0RG"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891f625344so37659465e9.0
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 06:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776862958; x=1777467758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAvQgbFKezKfMVm807wMCPxeAcqwUdGT7XqFMU3AArc=;
        b=BUJPL0RGAWzTaBWaHVMKw928Nl1lTgYb2sy+aw7GjR65inlk10fIZ48IouxoASzJoQ
         +/0YHvl4LTNsUMy9fb9UeUr/HzFtYeD3rX3SrKwI5LB8tMqxrchv3Zac0g1m/qvqEbB3
         Po+9gAxcUXsojKoVqUfebfgEbKUKcOI3lwiWW4E7imm38SPt5vN12nvmXMeTmecVEzTk
         R/ZJ2iH0Vhj32Sf3E1Z8lDMmm1s0XhQ6KRBzeDwN7uXb6A1HMwu0nyVKA/S7R4+YUm4/
         Xny5/jDu2Ng6ZteumB6M4BHcCm+BOHBjtLmFAcC55rZZCk7IeZ4vsb0kRG6FGUpcmCEI
         enLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776862958; x=1777467758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PAvQgbFKezKfMVm807wMCPxeAcqwUdGT7XqFMU3AArc=;
        b=jcVNEVbRPo80HpjJQKndBcQ2WZfAVHdQnbxcwLrMecOpGVZmmA/OMZWGyttO7Ag04d
         zGPthw899DvdWTWk/pcbgTce/gT6Cr9kD2p84GQFczBx6z/qBVZLyrTNeq2GgVFydohh
         KZxCcYWaK8aRus28BRXOpfRA9v9mjGyfktm5t+0+fUwfsOnH/CONsJuRzXE+5/3Fb+nR
         tlYr6xJTvtX/LI71TgcUOd5gqmqAbj8P+AYjAthRX4RPVucBxVJrn+F6hYhRnr9ykOQr
         +GalKRIWynoVQPq/ODAVYlSzJITGiPeOTbjIafqfsq1J8bG5iv6ccm36c7oOcXM3qsti
         geyg==
X-Forwarded-Encrypted: i=1; AFNElJ/CCYsAG3rEkKZbWrjxVKYenelROOAyuOahp80QnTtcvoz3ZO6SCgRJ/cNtiSRfxFmvoUcR@lists.linux.dev
X-Gm-Message-State: AOJu0YxNgOIieFXpY9aj2bNtxheAJkmI2vCiPZYjhx0cNVvoTOAaErPH
	NE/N421Npe5lE1bbiYaT+eZ2GFvHPVMF5O7uBYIrudOzWLvABQoDqFQs
X-Gm-Gg: AeBDiet2PnMI7VON0HXutQcYjRapV8zy27O02PlKJNzD9YpXxkVVIWb6fWcQPHxXsuK
	fDmAPOEsV6e1b7hgr2h69vUtGFVT+hL5HweNDwMy9rRfYKxkexpxtIY8onbl3NwMdmZM/izzgtC
	z5JU8nME8EIm9xxtePqlHTjvuB1QmcHLOTesUgbB6MltOt2xxNjy/OmIyAyX3Dq0i2A7hWQ/KbS
	T26fSOXrKVF2FQTfNJ8PlHNMAF60i/6BaXqY6wiNiZTFj/XYzUKJqc+ShpgEsnwvNGqBjBFqSeV
	9EwVVdQM5LXWuqGE4eDT82m2aqRWa51gtp1s+MaR7PIsBj90c2+EXnya39d9nZEFnPPDwz6sFqJ
	a6N/osdJ2P9Q4ltIyRGLG30haYam/TrCNhvpqolBYEG18mnup0jNAPft5bKl9vA35usToSIfRUF
	aHh55l1QFUSsEJlfPASt/kk3hvTOeZI6yUw/cqpdykeA60tvOfflV5l8oRPCxzpwUK3wHggvUH+
	9k=
X-Received: by 2002:a05:600c:a305:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a53cb8949mr97880775e9.14.1776862957416;
        Wed, 22 Apr 2026 06:02:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a59816b71sm36512125e9.1.2026.04.22.06.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:02:37 -0700 (PDT)
Date: Wed, 22 Apr 2026 14:02:29 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>, kasan-dev@googlegroups.com,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda
 <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Nathan Chancellor
 <nathan@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
Message-ID: <20260422140229.5a6f23f2@pumpkin>
In-Reply-To: <CANiq72=x5Ye+Cq6FNPTaLNyFJ+OMYQE45hLKibTyrgXfkeBn7g@mail.gmail.com>
References: <20260421190351.1976329-1-elver@google.com>
	<20260422110114.0f48d109@pumpkin>
	<CANiq72=x5Ye+Cq6FNPTaLNyFJ+OMYQE45hLKibTyrgXfkeBn7g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Apr 2026 12:25:32 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Wed, Apr 22, 2026 at 12:01=E2=80=AFPM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > Putting the actual syntax in the comment would help, eg as:
> >         __access__(read_only|read_write|write_only|none, param_number[,=
 size]) =20
>=20
> I guess you mean as a quick reminder for those that already know about
> the attribute?
>=20
> That sounds OK for an attribute like this, though generally speaking I
> would avoid duplicating the compiler docs. (Hopefully people will
> still read the actual docs... :)

It might save someone who is just 'wondering what it is about' from having
to read the gcc docs - particularly if reading the file where you don't have
a browser handy, or in an editor that doesn't support following links.

I also had to read a lot of the 'actual doc' to get a hint of what it
all meant.

> By the way, that could be `__access`, i.e. documenting our side, i.e. the=
 macro.

True, and ', size' should be ', count'.

	David

>=20
> Cheers,
> Miguel

