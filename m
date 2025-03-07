Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D11F1A5BBB
	for <llvm@lists.linux.dev>; Fri,  7 Mar 2025 12:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741348895; cv=none; b=IX0xqoyvjuhIZIZy1vNZgaNAfJ5TjKho9TKaFk2XIQ3xaEKGHJjfKzx7UQ4CNYsFuu+JP1PjwKGgSFaE8xLbRoVqfTWLs5+BpP6adP/QAbTu7m971XQ46JbJy30/FzFV8NI3q0L/IaX6F4YZDlUBGAoeEIjNi/UFN/krHTWprNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741348895; c=relaxed/simple;
	bh=mmMr+xhjZvHBRBTTuxp8euc/tIBSneTQLPzMkDqRAak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgvMabb1RWN9p/C/70SCrZKW55tEXWTBSWcXvC3/ZbWZBHlaUvIGICMVMA2yAlSF7UfjOciHlYUuBuroialHsUzeqz19iSGYj1mtas57z2PY4nYkAK7k/RLzMxu0MhC07v1ckNna+aT5Bx7e8cxBVrWLWEhl3FX7bKRE7YpXigQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hftTNyTk; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hftTNyTk"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so2316146a91.2
        for <llvm@lists.linux.dev>; Fri, 07 Mar 2025 04:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741348893; x=1741953693; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmMr+xhjZvHBRBTTuxp8euc/tIBSneTQLPzMkDqRAak=;
        b=hftTNyTk5NpG2fLX3XZS6qregTpD41eXjKzo0AwHpCI0+lF91WTidX6wuNJshWuQwa
         wFok0c7TISsi6R1LFMAkXJQwxvyvLFa3+CXLyszh9b83JxUFxo3Eb7yxi6z1h9SCrFkn
         S7u2nbE+ePjSqi4LGQSK+7VXdCH8hrUCp3JJYbQzKypdJtJdARZotJAisVHRsgKfAC0O
         a0dCmmtj8WobLOLjINwx/eHv6vYm5OvnRcmo10pOhmt+zGEoR1bXiw2L3yZ+Kng8ipFI
         BO2KkRGK73QIzl9mb/+hCROb4rFyF38ApkrDBrrH9thVPmmC4WaBexTWkuv7+VUSyYTJ
         Rbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741348893; x=1741953693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmMr+xhjZvHBRBTTuxp8euc/tIBSneTQLPzMkDqRAak=;
        b=Duob8FUJjoZOh5hedhz1azQYBTdjZYkE7vvDT+jXGKEMa4ojNN2EmVn5jkIB+thkp8
         WhL3GP2cQFdpbuJIRO6qdqIJMZA0XEdFer01ZHXTCp1IgSBikrnALw2tHgFm6lbWmjom
         niXUm+fEIEEGfn3a6N/Rl2Nz7J6TcCKMZKdC7Im/fVBtTSf6dIcckAr5JsbtR+DPYmTV
         Al8wcHVatPZmvgnQ8rOFyZtaWwwjISyYdeHIB9SSSqmfV+PdaDUDtslqhEt1RtQmDe0R
         3jrjxrWqi3C95EKuvtDsBR76qcKFxa8BvwmI7aNok9+9fiOxfgSDo0IH5c7fG6wIndlM
         qI6A==
X-Forwarded-Encrypted: i=1; AJvYcCULHtLDbcAG0c/Rasc3p37vp4yzC0h+q+oJWyCXCb1dSar9ojXCEilaL8gZhZA5wlLYmyum@lists.linux.dev
X-Gm-Message-State: AOJu0YxGrurFgokPPcuXYiA0/eX7mvp5qmb4Y3WXT0b4+ws6rXccbJa4
	kxEM6jdaqYwAe0gBXKv/TbeHqL/4nhlwWmV1q+I7TM63uqdag5Bg/al4/S53uL3iX4ffyurVoDE
	12GevOjT2enSf9I9AcCETDEiEczZ2zwsQVdZh
X-Gm-Gg: ASbGncur4r9kuVOkHG+u93h0NidU8z73rRmh09czq00/3t1KWu5PcZfrlegJRfbW/No
	G/q1d+RtCSQ1LsJZogHRc0OmyPndZWAe99tdVYHT5qd0H5MZTVREHe0pnxALAkmq1qF//WsAZzn
	N1Viqxdot64I9DXZzrZycLdstyUSjoE/qJgR32DmWhtgoR5zNwRxhsYbUXeA==
X-Google-Smtp-Source: AGHT+IG9txxHucbW7sBnaoj04WCgd7gUefScwrXCqKnpH0wyhljY/819jbVPLV0H6lYWd/VVNBK+Sg7rG1HVQGtuo1M=
X-Received: by 2002:a17:90b:2d82:b0:2ee:c2b5:97a0 with SMTP id
 98e67ed59e1d1-2ff7cf0a651mr4971747a91.25.1741348893179; Fri, 07 Mar 2025
 04:01:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANpmjNPquO=W1JAh1FNQb8pMQjgeZAKCPQUAd7qUg=5pjJ6x=Q@mail.gmail.com>
 <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
In-Reply-To: <DB7PR02MB36260C79D8CD91925D0D3447E7CB2@DB7PR02MB3626.eurprd02.prod.outlook.com>
From: Marco Elver <elver@google.com>
Date: Fri, 7 Mar 2025 13:00:00 +0100
X-Gm-Features: AQ5f1Jqdj8YjIPI5H5CFES_Tox6dmBl4VFy_4M-5upNJxAZPnVJrcUpdN6hDcqo
Message-ID: <CANpmjNPGQ4_dHEDBxpg3R5325iztuKuo5FLnrpmpzvB+PwdmVQ@mail.gmail.com>
Subject: Re: Thread Safety Analysis and the Linux kernel
To: "Puchert, Aaron" <aaron.puchert@sap.com>
Cc: Aaron Ballman <aaron@aaronballman.com>, 
	"linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>, Bart Van Assche <bvanassche@acm.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ilya Biryukov <ibiryukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 6 Mar 2025 at 01:09, Puchert, Aaron <aaron.puchert@sap.com> wrote:
> From: Marco Elver <elver@google.com>
> > Hi Aaron ^ 2,
> >
> > [+Cc a bunch of folks that were involved in discussions.]
> >
> > After sending v2 of the -Wthread-safety / Capability Analysis patches
> > for the Linux kernel [1], a number of concrete improvements to
> > -Wthread-safety will be required sooner or later. It is unclear if
> > they are blockers to the Linux kernel's adoption because the feature
> > is currently designed as "opt-in per subsystem", but it's clear the
> > current state of things is not ideal.
> >
> > [1] https://lore.kernel.org/all/20250304092417.2873893-1-elver@google.c=
om/
>
> First of all, in addition to the documentation at https://clang.llvm.org/=
docs/ThreadSafetyAnalysis.html that you're already aware of, I can also rec=
ommend the paper by some of the original authors at https://static.googleus=
ercontent.com/media/research.google.com/en/us/pubs/archive/42958.pdf.

Thanks for your detailed responses!

Besides the discussion in concurrent mail threads (pun intended), I
just wanted to also mention the issue of who/when/how: after all is
said and done, and we have narrowed down what is missing, the question
is who can help implement things on the Clang side?

I will offer what I've done so far: try to dig in and see how far I
get (like for -Wthread-safety-pointer), but it's going to be ~months
this way. Someone more familiar with the Clang frontend and
Wthread-safety might fare better.

Any additional help and guidance will be much appreciated.

Thanks,
-- Marco
