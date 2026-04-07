Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458413A872B
	for <llvm@lists.linux.dev>; Tue,  7 Apr 2026 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775558452; cv=pass; b=UXuHNzPJmZBGH1dfdgv/QhpEDBy7nbpUhnFgKfzwTucOQLxc0xKMu2o5TKscQXxIv7lxr5CGBjlmNIqw6PCIWLViNOTA8iZ+EKT4XazIOzlcK16PX3EMLpXEdetbaD4ENG/GNu0+Z/OK3ffqrTqyUs3pAEj9r2h8x0r94ENXbPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775558452; c=relaxed/simple;
	bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtKwHXpYNok1MRd8fpMxzfvBpfs+JrYbTQHIPJhu+EmdQ0wXH61m4yJJaBiJvbsDJpssJTSJ1fZAZr7fFNXjKE7tlCeIuDcWa8TQ3xHuhXTZq07taD51346Ov+CQzJYdkhZfx3HLt15aSYj3UJw6j4pbgrztW9lM+DIdmjY857A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jV86Mq5v; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jV86Mq5v"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-128bae6a35aso250987c88.1
        for <llvm@lists.linux.dev>; Tue, 07 Apr 2026 03:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775558450; cv=none;
        d=google.com; s=arc-20240605;
        b=GNsXwQb2upuk84BXpChRBxEGyYgCCawxV0OcY09bixnWlQvoEp25EGaISWprJc1Tz3
         4ebAaB9a+yPePtGDcQR2Bc6NbeVCUyWt0C2HDckhtQ2/UdkEcFyfX8+wQv5KHcS5YNxw
         +r8lJfrtOJj1JDhBPKWiIYECGS4b1wlW5qQf8/jDyu8V+j5+xJoPVaKEE+gerga/GNMH
         4TnUhBlvbJCiAtmc44qP4CK7c39yGbufjUyHicn914Sky/YaoAk7Q9Glf2FXBixj+46d
         OvAoIkQSvl/C/4/i3/baeVJZ7IyaVLvlx3ZLs09I1RWDLkpu3Qp55YNPgrr4VcOwWNX0
         3JEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
        fh=r3ZltKJsuzz3NwjNVt02fzArdbkIHgzYpNIpSv3yNo4=;
        b=TTt0CMsZuwWM0sm4c5kbporVUHaUUFZNTDpHAKPGGA+P3UpeToVcrhcswUGjzDrENd
         +ov5XVqaFcUp9nsMvusc+P5qL3hlofHtplNP2BWiSo4DCrkox+OBD7c6z2pBVcEP/lrZ
         KDiVNEV3rTjaOYJ4i4Df4sF0yX/pThKsh9SdGnwAQPjR9hWBaopHnDPxz7xQzsasfuTd
         gx0CUP1OzmxWYr5xBzy1z8o/VaNPFXqfu/QOd5Xs5tDWt+mXPhM0VOdhuAOAXYLiDIgf
         DuA3ZcnM8SeNwF9ZwexebTRiBx7+F8SEi1DYBsv2yRjN2PZSThBwYNJaUioE/6bPzElm
         HQ2w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775558450; x=1776163250; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
        b=jV86Mq5v8bJa+FSfMqqirRvUB57N+e+KshkWzp0sNJmJ/DjCBuG8Ed83Kux/lrf0L1
         Ep9Fjv04dThUmDhRLWkexHgeFL6oLL6PEfWQvZreKNxb1k+3VU7PDNpZWtl9Lp9dUcwQ
         3ndvcTOyPWXRImz34Srwa3KQ/G0HU+3PtdNB1O0bUQhcr2XKO5w64VVAbOZXSzuH0zuN
         2wVfbtp1SAobaLnhEdFBJisjhPsEpFCY9bvrNQU9mCW4hCDUOZL1XKOIii9oD1qsEABb
         wHIn+PRYdh7I7imZuzcMtgYiFvIrARKkO4BYkT7hCq6PqOF0peMp5qLzl4Dw9LHRKb11
         72hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558450; x=1776163250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IUoS/yALZHd4OmyTEbMHMatU0Sk8QqyqN5AUIDsRgWY=;
        b=CkQjHTh2k9n4KRiq4H1Fynzk0VwP7ZITc/BIOAb7LfSrWcKbgEYF3wtQgPsAIgIZbg
         Pho2LjtpKA5b5Fitl04VJEBtDsQl/K5a3g5onjk4NyZeLSHddq0zZkv7BlVUSDJNel+p
         UyRMe2AW924ed8TtIUG5gycPA21y437kIN5/2SMkXH0aO8WC84LvcS1GqP6MdXcD/ARY
         oIUAxtePeaJcDlZCeNdyf1Ye6HH/yWjrmFB5mjyHdkvGU1uMKk15gez9DoYO+yM6Ma4c
         NMpg6f6aIc9dZpBnxhQu/jQVYRScFoHI+opPlPdUb8NMA1B7IonghOzsflL1DUcK6TYW
         HwLA==
X-Forwarded-Encrypted: i=1; AJvYcCWb5/6tSjGU6EtUtJnKXsEGJ9wpkFcqsH8zw76eghLFkzHOv3/Jydj/vd3qrxzs1k0WMwfj@lists.linux.dev
X-Gm-Message-State: AOJu0YzaGnVXP/WOdTafryg2A9mg4usfxoi/MCzSo7k4Wg3uhby9OqMh
	34JwAIRvBchW7dgzzlsCJu5kTgXl4skvq/HgCdB1IQ/3A0FD/jPdqqONStFSSyReVi5qCS8k6ht
	RR2w+T2VFGPOqR1U/0Cy5KhhkcjA7Nnk=
X-Gm-Gg: AeBDieuCSXGe5LHC91iQF91u5hDf0Arzoz9aBJyFdpZ0ntCfUysm7Zxjyyiu9nRK5RB
	bEn8cxj9srlqBFkS0kiHNECa9nBu2o8CUKG9TzdPyqYO2n5h8Wx+QELPPUzV4qfGtJoDFsyUpzm
	pJ5cuUq0xEbsswy/FmWKNcWgec1tity0IGQ8/4qli7Qts1mIn0bQxVogN4TgfYNrUhR7pDd9Y9U
	DYQ7kT4GfvsrJcio+f/z88pcTx2D1wwQgofjvINkxYJsLQVt3guTj5mcpWnlJRoeM7wYnwDfhO3
	VNaIyJKvqaVZbVdLFfjOlysoyTWJy9tyr6nvUCxX9nn+hlfT7tu04a4v7v+2/RMl/97tYtvzlxg
	vcYKjQyKqXh6kDbbO88LPoQM=
X-Received: by 2002:a05:7301:1986:b0:2c8:d228:3df5 with SMTP id
 5a478bee46e88-2cbfc95a6a6mr3515468eec.8.1775558450253; Tue, 07 Apr 2026
 03:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260406095820.465994-1-ojeda@kernel.org>
In-Reply-To: <20260406095820.465994-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 12:40:36 +0200
X-Gm-Features: AQROBzBg5spyA6BYVGexDTp86I9n7gLDQThc9PTpTkz0AO6nnJln4y8vROYE75Q
Message-ID: <CANiq72nK2GwLdscU=Xs1Q=XuNk4QK1_MzO9OzJqAU1sydeP_nA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: kernel: update `file_with_nul` comment
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 6, 2026 at 11:59=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> `feature(file_with_nul)` [1] has been stabilized in Rust 1.92.0 [2].
>
> Thus update the comment to keep track of it.
>
> In addition, this will help to sort new conditionally enabled features
> (i.e. `cfg_attr`) around it appropiately.
>
> Link: https://github.com/rust-lang/rust/issues/141727 [1]
> Link: https://github.com/rust-lang/rust/pull/145664 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied (just this one) to `rust-next` -- thanks everyone!

Cheers,
Miguel
