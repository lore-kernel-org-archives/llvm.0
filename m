Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D6C2E3
	for <llvm@lists.linux.dev>; Tue,  1 Oct 2024 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727795585; cv=none; b=iyj3vtu4YAbhTiPMaY8E6mcepYTXDTQWWdu5yI0L83gOrJ+j0wR93AUlshsALBQ10i8a4ZB60IOGaTMt0mrTrfdbI6pQtWs0sR7Jf1BSf4LA5yptVz5VLn1c6+bz00s+NOJqszh9CemcU7NBsX27FxF4B4I0XTiVii7FeE3c2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727795585; c=relaxed/simple;
	bh=nYAgSONk63xOK7Bor3a7kozbxWLj4K+9v0t4icaPYyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWJX19WNn8C79I0bxto90busAmgq8Qnae1yrbU9n/m4duGUH6Mc2Oo0EH/Bz9px4FmFuY+m0xlQYLDlIsjBgXSbNq/EGA3j9eBf4BbjGCjIcmHHad+/VpBtViVR8HSNnFMZDOf1GSQH3OKybmFOwwbRGG8UkqjYg808Vt+7r+vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PjN/TQ+K; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PjN/TQ+K"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5389fca1fdbso620496e87.2
        for <llvm@lists.linux.dev>; Tue, 01 Oct 2024 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727795582; x=1728400382; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXScHmn8P9S4rD5O2nRTRJ+gDdKSkJpoElX+zbZagUM=;
        b=PjN/TQ+K4UM8durn5Q9xPDuPISXGWJCMCCAB2l6KMPmX2PHoxKihXqqsWitYxBZyM2
         WF01MsZMxiN2sRDxPIs05QzXX9dE9fEoIfJHbdp9i5f+HwGIOD7bj5kxKjb9zLbKXBBW
         2o/F38pFfbAnxkUg+1F/aQBJjV3XZnyvK+Rq0DBJ//TAcG6QiYPHwKkQoZekKeo2AOL9
         3IPV6aKvWR6rlr4/b7cVccMCzQ5cNfTo1OhaKzC6/ilMAv2gBgvhjUntqpKH5FUFX80/
         zWS4RNQKW75uFkzAhguO2S9CYqNq4yhZtYmH71YslcdIHSqZULYNdhaG6xD9BJab6aJ6
         TQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727795582; x=1728400382;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXScHmn8P9S4rD5O2nRTRJ+gDdKSkJpoElX+zbZagUM=;
        b=lRPw59uOkYXLY8KrkN2NhuZ309jbtpYgFX/xirBOVqJpMr8PA7+D1kmoOS9OV1WDC/
         uxA4sTb53Kts6I6aZDRdItds0Wt0FjSM6c6OKszD2ZxrVzy0Gb69gd6kXjT4bYrudYCh
         T6ePaGw9nSPo+USHVwsnEu3IWPfO1n9vaU65mo7vYxGuLRpOM4N+Pgh6WDXjg677QkE6
         TiJuDE15KYaKYdHZLaBCHXmBCQqTR7kyefWMDYxn/r/GLyZEE802cOEFeze8p2bmdgKr
         MSBckG23N/hD1umLD9DwPTTQBh0iymIlsBhbPiHLI3NkR/6q6EX/9J1gY3DAKTNWqcv7
         LV2A==
X-Forwarded-Encrypted: i=1; AJvYcCWE8sy9eXZuW/ln44Ated/2UzQ4shJETZaF0ira6vkpWCSJ3YSXJISbULJ5yC3tycBZJS/E@lists.linux.dev
X-Gm-Message-State: AOJu0YyfL7RK1+AATxU75ijVWQmZzFrHG1JbF1Rcfdfvc/3YaN+RYnPf
	UIa9A0F8+DK35J+0aqng1dJJGxw4HFEqQk9xYh1vsnb9KgYtPfTnEUmPnpEHQeQIc+ZBbAHZJSf
	U6gi1GUSRynKH6xzcdGgKvZSpk9M=
X-Google-Smtp-Source: AGHT+IGMhNBqjZ6ijgQcOXn6JFNmxnnktPEIZeD+nygAOPZgju/CctlYZ3G0XVoXICXF9IwanuhOiZqfY4Zocu+x87A=
X-Received: by 2002:a05:651c:506:b0:2ee:e196:1486 with SMTP id
 38308e7fff4ca-2fae1010f89mr288481fa.4.1727795581521; Tue, 01 Oct 2024
 08:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241001-playlist-deceiving-16ece2f440f5@spud>
In-Reply-To: <20241001-playlist-deceiving-16ece2f440f5@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Oct 2024 17:12:47 +0200
Message-ID: <CANiq72nREvDcdMinXgkVtqtUT8k+vHap9EWzxCboensXokvLQQ@mail.gmail.com>
Subject: Re: [PATCH v1] RISC-V: disallow gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 1:28=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arc=
h-support.rst
> index 750ff371570a0..54be7ddf3e57a 100644
> --- a/Documentation/rust/arch-support.rst
> +++ b/Documentation/rust/arch-support.rst
> @@ -17,7 +17,7 @@ Architecture   Level of support  Constraints
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>  ``arm64``      Maintained        Little Endian only.
>  ``loongarch``  Maintained        \-
> -``riscv``      Maintained        ``riscv64`` only.
> +``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
>  ``um``         Maintained        \-
>  ``x86``        Maintained        ``x86_64`` only.
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 22dc5ea4196ce..76843584960c2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -177,7 +177,7 @@ config RISCV
>         select HAVE_REGS_AND_STACK_ACCESS_API
>         select HAVE_RETHOOK if !XIP_KERNEL
>         select HAVE_RSEQ
> -       select HAVE_RUST if RUSTC_SUPPORTS_RISCV
> +       select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
>         select HAVE_SAMPLE_FTRACE_DIRECT
>         select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
>         select HAVE_STACKPROTECTOR

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
