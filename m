Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B792737E3
	for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774277617; cv=pass; b=Y9vXNHZxTKddoHa1yUuTygrEGrqeWS/8XJISuV7wNVAE/LO0kwAVZ/lWiU/iAlU81855N4Esa8ayRmyRghyf65JOoAjdNtT6HT2LNfnvP3jiOlihllNuJNUrcRra9wrSq4WYW1ae+L/cucXc0NyUoy+GMUMtYMWJxxvpWx1CfIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774277617; c=relaxed/simple;
	bh=SQMQ2nNoMlvs5BNEFGHnf/DZ8k1Iwt1ytZQm0Fd8SoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nS1inPAbsN7DsVH4RM+fgfd9eGHKRun5wtbjGHiid554+tDPH6/5ekB1YnXst1/90qyTGbIbyFKV/lxhI/U35wrBF6393ksM7roRkOcq7QWblHKc/Wi822fqCU5uD2KF1JEGZ5/+sXGcUfMmarUTdjhOOGpQNSPDFnw3SEDxkPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO1LSnQ+; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO1LSnQ+"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0e532a408so133829eec.2
        for <llvm@lists.linux.dev>; Mon, 23 Mar 2026 07:53:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774277615; cv=none;
        d=google.com; s=arc-20240605;
        b=SX1a2NahAs9H6vypq9bIupQwgmDP2di98gWHboCHEImT7O0tLqCC4QTPAX4JFdB7w6
         azQLM202Yy2H4c8oAVmxW8Ce64Gh5KHDB8bOMUkA+IhbZA9ZcRdQnNeQDXhlmG4ZRCaS
         BPFQz8RSn6hMQl22JzjY0vZTpG/SEYPRbbhHf12w71MKG+dqrbFXvvBOscr4wH9Mov5+
         SH8Y72JJCTXXemLFzUPWKP2tB5lrFgKGipXGbHYicscPu4nAS/dVvMBXvKX/SUYoFPZV
         soczZWeFLv5gdhfJRNr4BUpY2RNnUtseZwpAV0bUMR5pAXB9+2ZSNvWvMRHxxk/MEw8O
         qyuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        fh=zP3RslB9KC5HlFmSAtBpUREAgvTqFYzY7CQ+CMJF3v8=;
        b=cm1K4kJaq9tyhLhJ0Wd4muQAJ+dTlzy5vB1P6U6Ealwl/TeX+g/ZCABwPxAJiRQYlk
         URYxCUbyvP1lWlljLuYhSEGuYuwoATLa8Trxa6F21kqrXD60rEe4N6OmqJa51NvlfsPH
         JOxtMQYVz1PbhOkV1HBPEK9y9URkpsLwe8lCSDXM/gk/qicmqnVClHHkXuJCS+rl7FeO
         FgMKzsLRbhge+rKYuqRt3O1XewST1edaYUTSDX50MZoZ0kW+udVWetGtKWhOMXehLWsK
         CfKglPOV34i0LUNHUUM/r0Oay/kkMbCgnfNo6AAxgsJWlnWtgRwIy9VRnHeUT30S3Pky
         gekA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774277615; x=1774882415; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=iO1LSnQ+funa77hTvI+m8UMunsauC39AncUDlHFlWlB/INQY4KWrmiQWFpDCTKNQjl
         ijD1T4e2D2V2dk1uEOm+uhVWQsk+yC/m9USTzSip+bFQ1sJuMxToBmHK2e9rWd1AS89O
         MfJ2lUbcROUwJFjKY9BAjH37TrEfKEJn6ht4j2BaLv+t/aQrapnzOiR6AvKxKw45oDhY
         MLbic3f8rt6NhSS56BIrUI9Uqx9Gp4NLPO+1OSo+/q9kJyHgA1vxUYWonCrt9tLU9vEQ
         KywRywr+sW+fp3hmGLT3M4djrz7U+IsPEjWBZaOUDnist+CGMW7wF5eEuX3vjyybmzUM
         0dEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774277615; x=1774882415;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LI8/dUz99GIMIFX7jL9A6Uqav/8pN6H5Y3gQQrLVq3g=;
        b=T4a0RJMNqzna/5WSZCKTH3mBlaG5yt3NfMUK83SQloSMnKMQJ8jqJ8eE7vb56+cwKW
         ifEJOHINYHZ/CaPn/pe/1ynW8Hmy119un8fB7BId0mG3jKJhAhQOf0++RuonSBmFD1EP
         EXr+sOjc83OTcs30S2Yy5FTG9bRl08mzcjBgF++ZkpoeR2hK8GKuAeLV3q+K3+p9sMn9
         0hpCLw2nbjsNy5/IddlHLKkWs6k3mNEwS4JHwfJ5cepT2LMi91PwV1olULyEXh3PCQmB
         2Kcv/8DG5HCyhl3leB2qBQngb1EnvLutgf1r6kUpIMEnROc6X11tZe0M0Q8v5PlSX/Xk
         iuhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqk62Oh8/Lfo0fwDpaitJwve0tilU7nDj8ADM3i1yYSHKYP6LtDpIm3Nmg6Aq5X+qAWSeu@lists.linux.dev
X-Gm-Message-State: AOJu0YzqjkHHodR9betbR8in8e3qlqHmEVuupEnsSJ4GFN/NPyP97A0U
	6EzaOGWrbeQ67Mp21LtIGfiPCDF7dHrvESLgOeEXEL+Bk8L9X73wrbY4LKRbqn39wfR3YfcM3K5
	l7gEP4zF+WAcmadgxz9N58Pp3PQYhQy4=
X-Gm-Gg: ATEYQzw6Kcie2qpE56UnAaJDzmBhQY6Ax9ObJ3pNftEqZ9zejEau05w+xCZQX/rIDGj
	prw4h/yPZqRnERhDoEPMNubcX0XKsQyep0pJc5iVDhgfurUCQGDuEWPAfuxIKzAFT3YBStWvvMT
	oRVoxUaQVQDzxOWLsZ3NtR/lVBxWfyc5I7rVw54CvpKPXWVzvnWf00P/Q3ju3uYJgKruhy9d2Xb
	q/9DAaMZAQXDZCiOFYZei6uLY/t+cdwyAgRA3/c11P4PGzBTQeiVBMwxQgwnDMyOe1pEvyAwWX8
	rLc3pE4nzBuCtf+jQNI8Ohd8Sa7vdw6AZQE9yLqjTTudkKjWKNZRBl0e57d/R6mwsKaXjUT7Wc9
	lIneOVG4rGe4HFk7AR4cfYmM=
X-Received: by 2002:a05:7300:3215:b0:2c1:27c:758c with SMTP id
 5a478bee46e88-2c109938d44mr2357139eec.8.1774277615132; Mon, 23 Mar 2026
 07:53:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260322193830.89324-1-ojeda@kernel.org>
 <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
In-Reply-To: <4fba0163-547e-4099-8b37-5d8429bda6da@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 15:53:21 +0100
X-Gm-Features: AQROBzBN4j7-1buNPtn5ON4A_wtJBuiQQ3UlTVe5clvsCt_bKh7FB_BsDwGf67A
Message-ID: <CANiq72nmFsnoP3dv_-0PWH0XBpf0OuPzNR2CP9Hw56Z+RVifAg@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <ojeda@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Jean Delvare <khali@linux-fr.org>, 
	linux-kernel@vger.kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com, 
	akpm@linux-foundation.org, aliceryhl@google.com, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-mm@kvack.org, linux-um@lists.infradead.org, linux@armlinux.org.uk, 
	llvm@lists.linux.dev, lossin@kernel.org, mark.rutland@arm.com, 
	mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 2:54=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Callers should never treat NULL any differently to any other non-error
> pointer, this is not a value intended for inspection by users.
>
> Having specific handling for NULLs is very much not a preferred
> interface, and most things shouldn't.  The caller should probably have
> it's own !CONFIG_REGULATOR checks rather than using the return value.

Yeah, that is the understanding I got from reading both the docs and
the comment, but I think the docs (i.e. not the comment in the stub)
could point that `NULL` is one possible pointer value (perhaps
including discouraging relying on particular values at the same time,
and perhaps mentioning `!CONFIG_REGULATOR`).

i.e. to me, "Pointer to a struct regulator corresponding to the
regulator producer," sounds in the docs a bit too much like it will be
a valid one... no?

Another perspective is that, when one reads the rendered docs:

  https://docs.kernel.org/driver-api/regulator.html#c.regulator_get

one sees the postconditions, but they happen to not apply in all cases
(in fact, perhaps not having the "Returns" there would increase the
chances one realizes that, but I understand that you want them to
treat it as fully opaque as much as possible).

It could also help things like AI review systems which may only notice
the docs and not the comment inside the stub.

Perhaps it could be at least a one-line comment in the real
definition, even if not in the rendered docs, to have a chance for
others to notice.

I don't know -- I hope that helps, in any case. Perhaps Daniel can
tell us what he thought when he was writing the code, as another
perspective, i.e. whether it was the docs or not the issue.

Thanks!

Cheers,
Miguel
