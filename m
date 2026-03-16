Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EB4BA21
	for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669582; cv=pass; b=T3unoKvgUyqCPp4KoDX2zuuKcadQ+HWYkg/ApllvWFAYAQQkHjmFasrhyqiUkTnt9SLTMQSxkzChlWLFT2sUacHkrHtWgo8Dx1dquMVHXx9xfjLXqMOfoXbAjPOkiJcg1Gl12//rn9vv8IoBFX/lzZUOFLsQibJoEGfWecCqoPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669582; c=relaxed/simple;
	bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=m6t+j2TQLo0La7keNIbPyOeHMz4AtX1psyh5PpaP6NQeRyC5dozVEGOu98huybc+47KlPQ0qET70/jqZh6WmJgEiRsZJ69pPsOuzuYAMYOZwLmkdiAGQLk3Aoq0cUZzqPjTddzXp/idCPoo5+g7hp3uJTvFplkV4oKYaovIa7hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCBGjIlL; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCBGjIlL"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c0c482dfc8so28987eec.1
        for <llvm@lists.linux.dev>; Mon, 16 Mar 2026 06:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773669580; cv=none;
        d=google.com; s=arc-20240605;
        b=i/34Xt60PcRYD0dJE5rNGN0N0unkUUXQnj0JqNcCykOcHCNOCuYfh22T3RLtQViFfT
         duDaHEa/ejvIzzboYazkHmFky3KLHTMJf0AREngyCGhd7tSG3gfbmWFdBKu/3UXP3v1P
         WmDmG/JZo5XculpIrz9VvvX9AIFL9esdqonA9NZzawLAwTWBxUsfmkJKTsLmroy1Du1g
         iHxv5J5yoApXqmHuzaBWSa3SvY5kPW62xkszmkv2Evo7GpQP0dpc5nccRAQRuza8RodG
         s5skfrgkzoLGdvWV2Hw05B4cT4PUCz1LBhXsNDcopD0nxb8xbiEn+5pX+aQkHnC0Zrd9
         r/Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
        fh=y2SRU629Nfv/bn4bVRy22YAKfB3zCKD5A6VUswqtTOc=;
        b=Ok3oMID6MNVYLg0PNXpugAiGiaX4mS6Ug/X1SYxR2477bfBh1g2Sh2Te9w8uz+YmZx
         /bXr1WmsM0/wWVOIsy2ni9PqHvGkEkQhnVqf61WstHRzCUvlVU7ZeU+GUQmqpA1+/3mV
         s85sobhlr12ryw+b1iS1zBjV96Fnk338DQvxag6TT1DBvdj7IIqFwQSueOKULv6rDEfH
         gG7xa/kNMHmtOr/hIHkQDHvX2rU2KSoyvFoykzSbULh9RNFxn985Smzx9Z7IxK1bQ/nC
         jut80Ryz4o8jhDIGK04e9lKIEzGLyBL5giyqLAKuv8qcaWz+FrV3/fbN6b8fpc4uAeLZ
         7I6Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669580; x=1774274380; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
        b=dCBGjIlLENtcwvmhAky+VOAA1tnCFPSMAOolasKHvP9O7vN70UBJ9SNNqNimwNpjSc
         UWYCwW1Ew5+HEyh0DKjptkIoBxMj2Vvwws1MRzkmlm7zmeyL469SJDzDRp24cINeheQk
         4Q27dorYVIPjFK3N5/q/mV9zuKd82BF0xONFg4aK+l/5OH3FjFS5OzoI+AaTpuepyPwO
         k/cplVxe55USQPzTEvpFq29XjNBf4U1eR+TwESs2kvhaDB9BDR0g/ob8t44GoW2mdOUT
         FEfXV6SGLb1GJuUaILorKjkTVbCWByI9LjB6rIkMSc2V0Mff0PbCo6XcjHMM/bhcg5Wz
         mxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669580; x=1774274380;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
        b=fCKf+UkuzEuKENILWyF/+JuTcINnH6STEOvD5su/yVsZ11XD5B3nOkrZcut/Utd7xJ
         F8KM6ZD6sUNTmwck0E73/6QYg+2+RD2xta7ykS4/aoQ2T5nsXt7yoXu15JXmSFMCu87c
         9U2ipR51tGYXx6aKus6pgu0e1y/e+H3litI7Za3hfk+T3C6ngClEcvx4Nw8IHV31xOs1
         XQOnsFdzj4NCTonHQpsSF5T1i0oPJhypYs3vEbc1X852h6h5NYYUwy9xQw9pRMsXh2XB
         t5nZ+q8VdvNQzB+0y+CHsU70BoQ33i8VwI6Jj/NO/5erP5VRBf7D+mP1nSaYSpJy2Vat
         YAXg==
X-Forwarded-Encrypted: i=1; AJvYcCUmifN64QkpAq3+NKR9prXFPugeTGY0KOq57ossDWTPM7gQ0vsG90+d5UavCjmZtpgNmhTL@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi7bDQX2HYLQc4kJyC71i/AsiT0bDWiS6sjC2m8atMq2TfNcfm
	++12nv2t9Z2hX2Fq/uoek2q1wlrS5mLGf+tp83paAUbNPH866syvsSlEJePil5C/65i+X5UGaKR
	QDg19hqOFlG83FexoZH4Kx8E0v9AiEbc=
X-Gm-Gg: ATEYQzwdIxRD7bQ+jFEuazB3HZ13av37X3xEmETR7N8FemNOD2jc3r3qhqj5IgRMqk8
	txFVIBCz71bVjW7n1Bi6mgLG+H0uNdAnd3IQILlMiBJl6jjLVaeanb7idHcWzSalpkqS+IJbkVJ
	xav3xcRmhn9q5E/s39A9IJ+Bu1awHDnHzH2u0E25m0r5ZcpG5yZipY0huejOVZBZK0HKZqsk2gZ
	/V/F3Edp3CoMkvFYpV6gIagqWu+3aXRRqbemN8qgkEYTLR28PQ+HA4/iKTWlbQ1LuvH2P8yVlBV
	r547j9QjOcsjmy+43yCddcVZZG7URSn4Fq3SNOeuHdJCayTiwQA/X8Azc3SuEY/Jn9IenMyBNRO
	IHUqw6RfqmoDczqOKoRYm+m0=
X-Received: by 2002:a05:7301:fa8b:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2bea5537069mr3308614eec.3.1773669579867; Mon, 16 Mar 2026
 06:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger>
In-Reply-To: <abgGnfO5ZrpOUza7@levanger>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Mar 2026 14:59:26 +0100
X-Gm-Features: AaiRm53TmmEldlbSbIxGsm46srTQKJN82jRa_BhGLUfrM1H32Pu13C6vCiHeFPY
Message-ID: <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nicolas Schier <nsc@kernel.org>, xur@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 2:40=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> The simpliest solution would be to declare binutils 2.38 as build
> dependency; but I am afraid that it is still "too new", right now.

From the last bump at commit 118c40b7b503 ("kbuild: require gcc-8 and
binutils-2.30"), it seems binutils' minimum is supposed to go at
roughly the same pace as GCC's. Cc'ing Arnd.

Debian Old Stable has 2.40, so we would leave out Old Old Stable which
would have a recent enough GCC otherwise, so I guess that means we
cannot?

(I was taking a look at this minimum yesterday, because I was thinking
of removing the comment for a workaround related to binutils <=3D 2.36
in `Documentation/rust/quick-start.rst` when I bump the Rust minimum.
Of course, that comment is less critical, and those debugging a
Rust-enabled kernel likely have newer binutils anyway).

Cheers,
Miguel
