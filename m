Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369381531E8
	for <llvm@lists.linux.dev>; Wed, 29 Jul 2026 00:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785284017; cv=pass; b=p7bj+Lk7nYvQ80f0KJHsoALLSnzISGcnYD3SyuoCI/BspCuX5PacMoNQ3vbpFXkjxAh9506F2epASOW5E7blGyt9kJpLQMs6g8QvRx5oc2PhssllkjUowQKFs74146NyLC0s/dFbKUq+T7+28ahUdKFXFpaUWsnboERAWvSnyfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785284017; c=relaxed/simple;
	bh=h9aXM5QjNGMidHsRvBobL9YrXwlC8T0grjYAblNyM9c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NaLGxQWkfTeP3pgY0LWqanE2N81QhHintzkN3R58NWWABFGAIj18Ww7gQNv0RpBzEsYXjHei2Fuxqi6u54V5zUb3yq6h0lUgiwPD7De4zFLc0Ap5z7H/14c10fFlYNduXpacPrM4qpBDthO0eQ2ROQGwRw2E7bKNVzvxjF+EGpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFmBonep; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFmBonep"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so554535a12.1
        for <llvm@lists.linux.dev>; Tue, 28 Jul 2026 17:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785284014; cv=none;
        d=google.com; s=arc-20260327;
        b=mih2VZuLB6ink6XCUafog7pnlGU1B57sRhazGVsK+MR6M4GaZCgDlVOQwB40Cbl5p2
         fsIvZEA2I/gLKfULmUOD7es0sGPE2Q8P8dkMCCWprM8793Zue6IflYtaRjzAHoduRwzr
         OuT7ftOCZDc3xQufvsubu9cBO471P8IXulH78eL6Gr4Ep1YTROw/xJMBPF0vXLQDSc3N
         ulCGXF+CgGI470HAGHHwdcpSOXRZAJUp6zKn5sVeT9A4hVbvsCbrpdlGzbtNyNGiM6Ge
         UA2dMNVdwarWqoGdGhx9oGqxuDKI35tlPzVyHtbELatXrNDLrGIJgJRWfqeS9CDamv6U
         h+6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        fh=0KXJdorwPQZZ/NXsdTNyJ3ZrixQg+ieYT9hNSpC8TzQ=;
        b=kiAAUVOleCQp4brMpGuZug56JjANd+wSfZkPE/TUxkiixROLJy1j8HQSkzo9OOo4iS
         hPM51ZmbtSQV5n3aMQcsNNWIxk6LpJbttYpghQSHeguti8AGIk2annl+Y3Ca4KNd6cdR
         FDFRX0phlJ4KxY13DrPKDRZS6MzyewCbhVdqpxPgTHG2NQKsa48WF7h3rnndXdWq2sh0
         xH5eJ/HJWdGHlajF+CSTvNjRmIy7CIwdz6bLZ9moscXItqWRKFHL6CrlzFFpy5ceoYYj
         z5BWEhWSpII4nVe+QUaiR+8ovTvpNrziJAcaG2t5XAUAXwCwHPs1T1QpCvjYprBZJq5z
         t6Jg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785284014; x=1785888814; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        b=SFmBonepzF5CM1SVVlVP1r914ZKcai/fO7NQ4gj7i6ksxs27kkltaAU3uz1dPhPEL3
         X7ret0WF4EqMouG3Vqq5ENVKg7tsjyVQn8CLs2JhUnu+znN8PKjpTj9RK0qBidJFEFNs
         OhrMD02ouaHKOLrXRieqF4gYfSpFkNf4DRXA7TbxftiqVmU90HASFoGcLQTcJ3USHufu
         EuCjUCEH62MG+W5hXOpPYFBZ0MQf9U2DZNbchsEAoZSh9g+slk++pidX6vFyCQVRLtt8
         nMyLkmP4/h16QpAEMZdD98qGWnzdVYY3fEvfMV4Wje+5aXhVTOHh8DWg8VY8ewYyQ8aR
         v7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785284014; x=1785888814;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FZhPcLBAd3HL2IyjlVRA4vkZ5wn1M3m3VwbYPjbw23s=;
        b=aqpvD7YIqN47Xr/DAb9S+QQkDoYat6/HSTgZ60Q/q3cRXzxfsju3R+n3eRjYsBFoIj
         9ZubtgFTRiPNgtaguuKtlaR61haxfudysNx3HIMlw1kxw4/XL3y1gD/hVMsriTNwZKQl
         L/My3XO/I1LgYxs/2L4Nq0QoZeOKVU187OZKU+/xhaSukIDgncyykuPHtu97V06i2Une
         JElb/q1fMsa7+UWJ0JLvuxLEd0E0Pw+X1rAzXyeYbBgin50peQo3CIz89KaogSPio03n
         Cb6CZUj7AKcmxf/kvqu7XwiLciMQG9baCvmJZhHvX7GH4FRopMqPG9MYSaCbEXYzF15K
         IfmA==
X-Forwarded-Encrypted: i=1; AHgh+RpfbmQtBPPh60VHnu4qh9okhPwmeg3bA9ekWFyITeN2PIPt7QWgO/8/HQuIca3YXnBkM0KB@lists.linux.dev
X-Gm-Message-State: AOJu0YzTY8MnkRkc2GbZOfdIySqBagBf6fT3igNSc3HFcFKHFUvruDID
	PhvhpBeLZI7spwhWiC2OvX+yHn/cofqnKQ4w4R3s6515QeDFTJBe0yOJxUSU1fsy4Jy5W/8PhxT
	M/ccKnef0kjhWKraAa90gVuXgSzq5MUo=
X-Gm-Gg: AR+sD11E7bGyXMj6xB8LKOjDwhxVUWQxHRT5+DLKKMZjlhYsI7OHNmpxM5c72VtvbjP
	C/qTVHZkeGoC4dazQpldo4NQ9QX44/adA76AwWdoSya235ye1evOJE+zFhHs4iad2Qd1Ne76Ls3
	DYxNK6N9gmcm36t//IawxfJVi5RHPnk7fXN2pHuJd3HiVdNqK8b0MaCt98bD1NxoJCR/hVD/fpk
	zFkBF/O0lO7JJEXE6TphbqcVcOpBbFvddLyeiml5y0nDSMztT9SSUTOPludCHd+VxbZ0P8WZK46
	clK3SZWRiCiKXcuD3AACNZz/LQ55Clo4yp6GdXUvspo92UX4kEPTMCBBkrjjp1hRwcHaBTQ8jJ0
	BZJfsVDbb09WXC/i0Thl6ulrgjsV7S8Ryy9vZ04tdFrZWc1sf6VtEwFlmVQuczSqAtflw0Puy+4
	5APz4fW2NX5tgPpZE/0xgP7EElDazF8mJDrreeKHDes4mcH0g+sIyGxHU=
X-Received: by 2002:a05:6402:24c8:b0:697:ecb4:b86c with SMTP id
 4fb4d7f45d1cf-6a034a0b240mr1758311a12.2.1785284014277; Tue, 28 Jul 2026
 17:13:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714234609.902367-1-rosenp@gmail.com> <alhXciS9G_bGB2re@SMW015318>
 <20260719155822.GAalz0Hj3XT97KkPOk@fat_crate.local> <CAKxU2N-vMNR+ES2YYuJh+6XASmZ04cnFodb4kP4zRBW0mbEKaw@mail.gmail.com>
 <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
In-Reply-To: <20260728224059.GAamkv-4LJPspOw5ZV@fat_crate.local>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 28 Jul 2026 17:13:22 -0700
X-Gm-Features: AUfX_mxHW0ADcbLB742WYGYN1hzAzsCDZWTuKdLexmZw6VpD6MNkUeIKBO7Hquw
Message-ID: <CAKxU2N_=DMAxM=-QRZ_J5Tt2rbjXs7C4uJRQTWF-xTquL_oFvQ@mail.gmail.com>
Subject: Re: [PATCH] EDAC: fsl_ddr: use devm_platform_ioremap_resource()
To: Borislav Petkov <bp@alien8.de>
Cc: Frank Li <Frank.li@oss.nxp.com>, linux-edac@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Tony Luck <tony.luck@intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"open list:EDAC-FSL_DDR" <imx@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 3:41=E2=80=AFPM Borislav Petkov <bp@alien8.de> wrot=
e:
>
> On Tue, Jul 28, 2026 at 03:08:25PM -0700, Rosen Penev wrote:
> > The unfortunate part of that is sashiko does not understand v2 patches
> > and whatnot. Meaning it will always complain about things fixed in
> > other patches.
>
> That's fine as long as we've replied to the patches and said why it is ok=
. LLM
> is just a tool, at least for now and how it is used with Sashiko.
>
> What is more important here is finding real hw to test it on. I'm hoping =
Frank
> on Cc will move...
Based on some git log/grep, I don't see many devices that use this
driver unfortunately.
>
> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette
