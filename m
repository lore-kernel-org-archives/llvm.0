Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FEC406267
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 12:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047142; cv=pass; b=fHk15yQiNE7394ts6FU5v3hhRCQlv3mC4s2FttfwieTb+lTfjwq4Cmcam0VFQy31+8MThBIhMWggKTSXGPhrX0W8gqC7wTDCto6oVljzNXBz+o8YbYqOcsG9e8JH1uhmMCO+F60nuzaZ0jhluSmDFSgxiocCHLj8Qm+A56rFZs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047142; c=relaxed/simple;
	bh=GodnwCNRPwhTIOZcCkQ43DAq+lvsz0DfYPnKri1+5dQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DL/IrveRGk87qfvSHibVUMGtcEEYJTCCR8Y6oHgEroPTXtQYkQvmiUHL//6GUq4VNtQeHRSWPWVcbD56K5Cq51H8IWMpQ3MhpL1XoIXUxawvCZFHAaS/JvivlFQUbaIi/oqji6r8A5qkXnpO9QjtfMfeMIOlsili/8VhFWYN8RQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIQYqsHK; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIQYqsHK"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c6f5574d07so105187eec.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 05:39:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775047140; cv=none;
        d=google.com; s=arc-20240605;
        b=SOdMAU3kObPP9JH3DlmmmU7AvKCyB7mAm6twPY+mt2IcCTfOM/SUJVKEmPT7ArdHO4
         t9JmI9qOO54DGth631tOqzNjX4i/0WWnK5JwCoGNSXz4ct2nqfGpUNnwZB4fOnqrlfq6
         hekYXsUZEDk13JIzkwn4Pp2ETH0vejHV7PpT6thVkHb7/JUt78QCZYGInYbj+MxGv4P5
         aNmxrh6BFPlZowv1CzVFRIqRg3JcRUCVNUfrhfuiOmaeVY6q0Af+6kRj7bVFH1lXkOkI
         UXi3xqlAI4b2e2vTbzK5I8LactvGc6OJSFbzgr7Dc3tMdAZAH9ikEzkMHwUASkBy9vOu
         5sWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        fh=OMoqUao3cUxspD0bnLqcjin4bWM7Lpi24H57q9LKR2k=;
        b=BUHFtbwekDCEDoZNZzgxoTAv7lAss3J2fh53drE3vT99dwQWfwxBswxcSnpKC+bapb
         cyB4VH/iMh+DrxGenMjjcz8I6P4T0Yeks1Qcbh9RlT30vi7uIDm0jpDkq+Aat+82EA+3
         QFjRsZa0NvatgLQd8m/UZk/Pzk6IxvOtzrfoediw2hAAZUq+iQYDDgc3A0UuQfjfhlpY
         n+hcyJulJln6W3WdQCpPaFW1H7oxlFJWiwEkA7T0OWO/oLdasYhCgpucfHHBDMu7GmHR
         b/x2u1janrN1xlpINpf5xM49OzdaGfwrlfGAX9z1g6juC422Q9252iU6i0wkIk9/IBoe
         6LJg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775047140; x=1775651940; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=YIQYqsHKKmKPVIk2Y6RpdnxMBjNx/sDDKqsiDvUpn9pSG+2QSi9NhIU7MT8lKFV5//
         4HmNSycfdeS3SCsupPjqUtsMVOeuKb4f3vFRHh305c2zNmxCkpehfysjuYz09tic7VJ4
         mtjeZ8VvntW6q90/qq2HT4UXauDgCbHxGkFBxJSJx57HEpMWNLdipnKmGJBJktRxdiy1
         1LWqsEMiTsVgnpOpQV27TrkLryARosEMwFyXShwHG2L12yoBvAs0fa9scgABPVeYs2VB
         p6hCNATF1QJ6CKlD8znUejSXkm3UJhBYFHj6Fm3euscwC3/7Yb4X842c6Bsi4fiIgw1g
         5pmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047140; x=1775651940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C50p4ZX1kB4/qlngVjB93jucX5ZFw4nyYPOJ+NDGmJQ=;
        b=fDTC56hpoE9y6+nso6QX97eCUYUNWowJab3Ye2JCymj4x0Md+rsmkC2tRAWZ3H4nPv
         yHtObuj0V0JPcGNNm3iwUmtf3Pa+DQYcsAplciW8vEqGeq9R5TfNvEsn0/0HNrrt4d/G
         oh4/In1W+ocp9dRjaUAcCXRN5FI+wqb04yYyWBOpyxQWjblgSPtKkjZ+pmjc04v7zwk9
         0BQ5nmygLMml7+EQCmuf0FUXG9Der3XOP1STghc9tWPF1lGFs4DCa2mH9jvq/cw7eFxZ
         IW0+TfVXa6ZDPEQrSD9/+iiFqQ0NwoW34FSIpppcaGtRLmMwxAimhyXr76zYEXFGsJ0d
         Lx0g==
X-Forwarded-Encrypted: i=1; AJvYcCU2vnVd3TPB0v3EaK0R9LIouqQMoqY4wSd0ff1my5H1hY23RzDopvy3FUvMOBP0GQE993Hb@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1uHkOeLKPFdXfDBnuNuRL+h/5gq8XzXUB+TFw79Z9VbWXaOZK
	OVXl0/ZERLX1fvjb6pbxNHipFQpf0ngsAk3NDOR8UW/aCuwlBq182na8EDO55k5WnQt0oBcKu5d
	DxE8QRWSrtovuFW5MFDYCwNLjej8kT3g=
X-Gm-Gg: ATEYQzzLPg6fCCw5WoSRYCUZtw1skp5BbhdSyTgfJspTK8DeawKw0Ks495j4IKZy9xB
	IDWUwRrxiEqooJRE1iX6KoI89Vnp1w/SgkMfecxWFsa7b54wcib6l0YdG/CBFg+lD+OpDsDfq0m
	jk3wDr9rtArcJUxaTuobarViyp1lSsIhA9Tl02b/DBDYwg//cXcl48PtXgtqSvgex9ZHUaChM/r
	CeaDzvtJXCh+kccdfuEseN8XybvY1tNLx7D0F230r3K0Gju66w3Yg7vKPru5qZTx+dczIvYNlQt
	nd3dUBP4lOltOljSlQl1siaqQ6J2nFbmZ8MZxtuV+Tgdib9HNEfubHY6hTCGKnHGYmme8Pte56q
	IMZopC++gaxUhi5Y/8lM4DSM=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr857984eec.4.1775047139826; Wed, 01 Apr 2026
 05:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <ac0Ol1PaRTWNK6O9@google.com>
In-Reply-To: <ac0Ol1PaRTWNK6O9@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 14:38:46 +0200
X-Gm-Features: AQROBzB47ncfBs2Gvn4IVyEtA2T5y2xBZyqDi53mewiERXnAT8KcWfCgLbx6lUg
Message-ID: <CANiq72nk8Ti1bcjCO+5nPacz7JaH=x4+uTi3-+iu4H2ZfwfVrw@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
To: Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <fabiang@debian.org>, 
	=?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
	NoisyCoil <noisycoil@disroot.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 1, 2026 at 2:25=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Debian really *should* pick up 1.85.1. It contains bugfixes serious
> enough that the Rust team decided it was reasonble to release a point
> release.

I asked them about their policy yesterday here:

  https://lore.kernel.org/rust-for-linux/20260331190053.482607-1-ojeda@kern=
el.org/

Perhaps they just prefer to apply patches on top.

The issue linked above is the only one I noticed so far, and it is
quite specific.

Anyway, it is up to them.

Cheers,
Miguel
