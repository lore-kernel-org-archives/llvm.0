Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF0E2DF3DA
	for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774532875; cv=pass; b=dzIqB2CDSXIjs6itMFfcHGvX1G1dGI4+QfDZDt50YMxi8BvYuivO658kS3k8iCXGh4xh5wAcQPDOCcTJeJArQ+YqmbzARWTKPIowPY9AtytKWMwzY29quX0medDRQqqGMLbaloqSmEJKVAeF7GxxUhkJO+5YY9Gywng/9SU+gX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774532875; c=relaxed/simple;
	bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLvjWVDAWr98FZYJatNSwR01jIZ77g3dBZARk9jr4DOy71FfrmUO6QCIq6grOmCtVdgAv4A+hA0VS19tHBJM8AxjtcgMpNINW9DCCd9UaAQp7UJYdvpSBjxjFFXnNX9yEk21Vdo5Rite7uQ6GPj61VRQy7zV1u/DJPBhj4yeG6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pl0amtEQ; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pl0amtEQ"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c153272250so110032eec.2
        for <llvm@lists.linux.dev>; Thu, 26 Mar 2026 06:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774532873; cv=none;
        d=google.com; s=arc-20240605;
        b=c3A0Sk4rfhzXmojPtNzAjWLZGbpkrN2rsMNcLjTyysoCvfe4I62SoioX2bdVm8kBTG
         o6LsUdtl1/pkOyH9iYmoyUUsD48LSF+5/1XlFIwbvrFXKX2OTJimeVuw1dqdVmaipS6x
         S4bO1jlyXOs4h6PDq5FY45jNpkpKpflM4hvdwe2RZ2PrI3ZVsQTaPtvvuoag68yYnS1X
         l0I0w0nixqC+Igx3yExwdgNEtuKxwu9hCTc0XmaQr/Kn6uPP6K6d0mQkIVM2WqU2SZvh
         LoB6xPpXnpVPqG28Z5iz14nzqL0wo0Wgj+dlTY/vJm2FQmgdG1iniw5X/VPNWiyxS57q
         W3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        fh=5EpHfW3m9io2tWpBAsTsMHrN17toqfKCm67hyfan5wM=;
        b=ND9pd/JED5sUSnP2tE59cA7lA+QuR35LofVCTjHlYbeDm8fpSnkTYm6D+tZbMNwYHb
         l0RY5d4wnrKQc28JvJnS5VDN9NxHtMnl+dhNSiQvRQAkH7louDJML3KBYDnZfh1UdqLW
         Fdd8srkOCYkBa5M3HDD9rttNZ8M7xuQAnEM4vtRNnP9ggb8yqyiYdONi6TGdcggwk9BM
         r7XhnIa9ljVYKEabnYiIzLwW5HOzemxnEvOI1jY0VOz7g6VwSVhNnX4bzQK7RvS4vfXO
         xc2mN+Uik86zoVMe4NkPflzPGphGJTkyfVYSJECY93GaPFKH+v8QLwbvKuf7Cjk1qKZ9
         x28A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774532873; x=1775137673; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=pl0amtEQvyDOws3ss118COxP4ZkV7O6YihXW8zDnqpMTUoudGqFp6nlKfslZ02nkIh
         8VfIEhkhBnuJF0BFRRX2OyZQaZwSSLfurR1nrEbOO/mTuJVbNk/oLTpa5hrTP+7R791r
         5woTamPfKtaW0U0r8yBLhwrh0ufGQ16RyEjTkdRyI6p/zja56MRE9WMwaNwxqoOAZhFu
         l5glYUWoqSYUiOhh65w66l+uMKhWj2pSlldpdV5o6Vizc51eqW1x6gzS2S64VKfPplug
         rIMOF7E3YtUGNXj1KpowFhRbkm+WJV67/8JGK6EIWY9P0AEZrEa+uUUH+nsT5FGUb4wM
         yVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774532873; x=1775137673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3oU1ZaWY15KqHTdXghcWSWByFzglfTk9rdjKl+Mk/PM=;
        b=o0TI7mVigF8dyt4RJJlZLsrucDtVcyby/XJPIVaMdbnUVE5vsMjehhqwKY2NeYf4UT
         osVyJyWgN87wKUDnYSCTvY70oQJeqiClWOVL2p9xX4xd7KzKdoWHhe+NlhAvfYwmvbDB
         ebodxZklz6j6314KcdYrPLPtNJLL7OicxbzfRFrXgkDSC7zPqipFObMcFPMcSzwmOw1X
         cXnTzyB/oRkfPbHbqU3X0nMAKJ662NV7y577iud504c4qEwXBYItwdgt6JG8pOmANs6+
         xhQk+kgZ/KnlmVuHOZYy0xzZlJDkR73usV2YS44+IMIYXUi7y6LWpawG4h+XjeFsXtfr
         2cBw==
X-Forwarded-Encrypted: i=1; AJvYcCXSDk8KLvnBRtmxgy11Y8xnw37nIhCS0yT+J9PaHILMwZZ63x2iJ1oXnpXzCsUv6be1VwsD@lists.linux.dev
X-Gm-Message-State: AOJu0YymfSE3PTNVgqhC85LvIl8Es4gBiXpORpR3OrVx9WSRSA/AwetH
	xhQMYwUmVqlTvRZP3nwXCD3LSR+sHvLlCJgSeJIBJ7ZGaf4DAeVo7e+JYyZHQSWdTGkVYGkdZqV
	NE3yoU+Q7rnehlIu444Wc8DNkEvBMMyY=
X-Gm-Gg: ATEYQzxscsKS1ENC+F+Dk5nxBPoFqkG8JgUZ8Np2L0STtZqOHD5ej+zKAwmg5UVzCY3
	HjoSPE2cJjWk5wQsV35AaEEShzR/DQnM9PB4//ntJ1RtcTo4o3H7Dfy/+IcNz8c7KEv6Qs6kj78
	4ta2URtDsoVz9/0PQRpJGCVKHsGb0RxsbGwm3jmgHOzUQVDMfdpTbo4Dxcg43yjGZth9jmydqS5
	XGhjHlf2qjrkqUkcyuPR6uOrzqMj2WKjA/nJDODuKseFmwmRPLTaysKs5/8ELkk4UhgNHdMoGyi
	qHc+SloKFnLlO9XqR3HOEmBFP7pmblZghEmOs3cTAo2+GJ6zWzIgWCqH4/494VtA3bn+Aqfn8cu
	sYrxjQhLBmDthGDII1PvIXF0=
X-Received: by 2002:a05:7301:5f8a:b0:2be:140c:bc2b with SMTP id
 5a478bee46e88-2c15d282067mr2176054eec.2.1774532872905; Thu, 26 Mar 2026
 06:47:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260322192159.88138-1-ojeda@kernel.org> <20260323000327.111235-1-ojeda@kernel.org>
 <acEP7tl8pqFA3tK8@shell.armlinux.org.uk> <acUGAsjYvNvTEO92@google.com>
In-Reply-To: <acUGAsjYvNvTEO92@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Mar 2026 14:47:40 +0100
X-Gm-Features: AQROBzCEnROF6sNSCO8peAhuS8KhaF6UHZKXXIBMm9aT2zIjtnika7P390Hajek
Message-ID: <CANiq72mzPpkELXis1CiSbKUmBXNQYMiMmjj-7-sYiLh4T_JSOQ@mail.gmail.com>
Subject: Re: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Alice Ryhl <aliceryhl@google.com>, Christian Schrefl <chrisi.schrefl@gmail.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, 
	acourbot@nvidia.com, akpm@linux-foundation.org, 
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, david@davidgow.net, gary@garyguo.net, 
	johannes@sipsolutions.net, justinstitt@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-um@lists.infradead.org, llvm@lists.linux.dev, lossin@kernel.org, 
	mark.rutland@arm.com, mmaurer@google.com, morbo@google.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, nicolas.schier@linux.dev, nsc@kernel.org, 
	peterz@infradead.org, richard@nod.at, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, urezki@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 11:10=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> I noticed that the Makefile currently uses the arm-unknown-linux-gnueabi
> target. It should probably not be -linux target to avoid this? Probably
> it should just be armv7a-none-eabi, right? We gate HAVE_RUST on
> CPU_32v7, so we should not need to consider the other variants.

I think Christian tried several targets back then and eventually
picked that one.

Christian: what was the reason to pick the `-linux-` one? e.g. was
there something you wanted to rely on that target spec that you
couldn't enable or disable via `rustc` flags or similar?

Cc'ing a few folks.

Thanks!

Cheers,
Miguel
