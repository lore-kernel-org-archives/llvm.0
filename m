Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5355F1A5BB0
	for <llvm@lists.linux.dev>; Sun, 20 Apr 2025 19:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745178527; cv=none; b=LuyafaPSCU0MA9AmBxF4i3K0B+3EnX/QdmXd9UKT67JPbugbm9tnbET25zeKdNxnAT+6bVkuPkeYH+gPw40zgrozaBN1LOg9dDSx+EAWk8WhZTFOHLh2w4jv/3R7aEc2nKOOZDItfxz4jsLCSWi7dNIwrOmVYh70KwpQrDKK+5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745178527; c=relaxed/simple;
	bh=rrMYwMnlrmdWpZrJ4kdBxP9ePBTeqAF3k4w/V3+8Kfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WYGQ05SlwCYuVWhn/LbrBKxTEvkDLNpMs3A2J4AAWaOrkAoa6HVoLf4egzZOD1A6voXQNIWn+W+DakFJW1Ihu/NFkm9T04dtLs6dqPoy3lEtExkLrssZU41cF8Xhh9/E1omIl3VIOSHsp5Te7Ey3o+eJkgR/YgvL2PEBLSysgAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ8AL0Sa; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ8AL0Sa"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30363975406so384683a91.0
        for <llvm@lists.linux.dev>; Sun, 20 Apr 2025 12:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745178525; x=1745783325; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRibRGPlM/02qOR9HcoY4oCMNCshfk4pYbOUB71XnBA=;
        b=kJ8AL0SaH6I3eDVIokRjYYKvkSEMeAmyhe/ssBOADmq8izMTW7s2E64xpOxbp9dmsp
         s30L47wO7fP5jYeMWS0d/EZjJy8J1A+Cbtuv+pBOrKYH7inDyakUCRxShYqWeJdCfZLE
         nad0ERlZJ6XWWwI/SyuEko1liW2OJa9pyRXjp8qwkUHk9FYsLOBPSeJpWblq4ipW4wQM
         iAwXUClYJ2rsyRf5rEvgUBmFOqsmIEJMFCaoq4Cd6pdpZrMa6EHoAz3nbfqS5uuy5eEa
         TEWdGcsdTvO2aEvOpz6PRcElJB1LNQeasdsCO/MNxPw9e1ARMhwv6wxxrAnoE03Y/O0A
         p9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745178525; x=1745783325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRibRGPlM/02qOR9HcoY4oCMNCshfk4pYbOUB71XnBA=;
        b=YlwMSeLuersOMiLqoGHs+Q170SEn+e7xB4qdTg4hgimtWGlMd9wWVhogmgqY4H4Bzz
         KIRj48WwVREUqeF6OSp52crpYuEDdaSpDv+LaDuerwaH83tbczoY77oU7EJYyG/BApt1
         wWQg5gl+rJHY+FAD23VclxRFV+VlLWzfg+//RwQVP/25J2olcL0WITv9/Ej9h21uBp+L
         PlQz6xyaHpHL3RVBRa9VrjSQ0o4y1nlKXmwpNV0howY1kIhezSE/+gRH0a2fPLcMnQoP
         48YdWOdgKR0UFWmlUtJBwbLopXvvNbNOIYH9pw7nMqC1B6/CS+d/I2aOoaQKSqYZY/4m
         fXHA==
X-Forwarded-Encrypted: i=1; AJvYcCXLfLl3Mm/gPZDFjUPW15bPD01ajDZQEfdgoZlknVsrodQ5nYX6jfvQAnOIhL14mLqJb1yY@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1z25kjKv2NZXX6VSd4biyA76tqfr4qwKnSxxl0D9p9NmJWiRV
	7Hc5RnRWolr6NirgpP76dDOoMtPcRl66nDYLBP0pxVrRAUW52MDVf32OqKIQ9kBUHIs985FFVCg
	BoT5Jm45Sik1h4MgaVCcXKy2MpLo=
X-Gm-Gg: ASbGnct8+SNp/7MfldxleE9DIm9vzADEc8mBLUTraTEAGuYtjpIAlWNw06fY2u3DPJ/
	i3cWcye1Qpqrk4e1TsWLABpgGNdkbSBn0H4uZAeteOwT21NMxAuABYxCOOapC7wFkIeGEVD3tHF
	hblh0l8+cYnKbG5caVZHoh1g==
X-Google-Smtp-Source: AGHT+IHUf8MxGXvEMHQggz21sFqv2EdwY+ocyAL74RdwapFcFoaxWiIRVtxfetoljJK98wYSr1Ymf/+7P2Akzd1KQWA=
X-Received: by 2002:a17:90b:3b8d:b0:2fe:b77a:2eba with SMTP id
 98e67ed59e1d1-3087bb426aemr5723618a91.1.1745178525504; Sun, 20 Apr 2025
 12:48:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250420184700.47144-1-contact@arnaud-lcm.com>
In-Reply-To: <20250420184700.47144-1-contact@arnaud-lcm.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 20 Apr 2025 21:48:33 +0200
X-Gm-Features: ATxdqUHcVK0N1mNr_8KS6bGNiAiT-Za3XXwOOGYlTUvAwClu7WSCO2gTmQysaCg
Message-ID: <CANiq72k4RJw3YENvQj5Q7LCG-v+nhZs=QhVa1AthUfZUoHmYdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] checkpatch.pl: Add warning for // comments on
 private Rust items
To: Arnaud Lecomte <contact@arnaud-lcm.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 20, 2025 at 8:47=E2=80=AFPM Arnaud Lecomte <contact@arnaud-lcm.=
com> wrote:
>
> The Rust-for-Linux project currently lacks enforcement of documentation f=
or private Rust items,
> as highlighted in https://github.com/Rust-for-Linux/linux/issues/1157.
> While rustc already lints missing documentation for public items, private=
 items remain unchecked.
> This patch series aims to close that gap by ensuring proper documentation=
 practices
> for private Rust items in the kernel.

To clarify, it is not that we want to enforce all private items to
have documentation, but rather to catch the odd `//` comment that was
supposed to be documentation. (The background here seems to imply the
former.)

> // Improper doc comment for a private function. - should trigger
> fn test() -> u32 {

Since this is just a `checkpatch.pl` warning, it may be fine to always
warn, i.e. the submitter can always decide if it is a false positive
or not -- I hope it does not become too annoying :)

(That is why the issue mentioned perhaps using some heuristics to decide).

> WARNING: Consider using `///` for private item documentation (line 33)

This text seems fine to me, although I wonder if newcomers to Rust may
just transform it into `///` when seeing this warning, i.e. the
opposite mistake. Perhaps we can make it more "conditional" (even if
the "Consider" is already there), e.g.

    Consider using `///` if this comment was intended as documentation

> To: Nathan Chancellor <nathan@kernel.org>
> To: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> To: Bill Wendling <morbo@google.com>
> To: Justin Stitt <justinstitt@google.com>
> Cc: llvm@lists.linux.dev

Should the LLVM subsystem be Cc'd?

Thanks for the patches!

Cheers,
Miguel
