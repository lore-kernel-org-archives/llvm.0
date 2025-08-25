Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043342FCC17
	for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756134090; cv=none; b=VIz+1/aOAwG3T0KeAGVWrrq+jZ7rhIB0pxVPbPGW26zqFoA2VMc66OS83h63l9dgFMwmcKa2l/22tFTvaKyHsLnzEb6LiFsq2hH+TTA51gF75T+8yQM07F6yHoH98QfN/bciFUIZjSNrpfncK+lasQUiI8lCSWM/uf+oKTErkCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756134090; c=relaxed/simple;
	bh=L+GLP8NhyycYgeHZwc0fgaV7zH7hZ5ntFI5ZSTxIQKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIqxOOiHnSzcGAOOecNloB8Y166yAxNoeGYf1VnZY6/nxN3aGZzAfT3l70uPdLDFoLAcIiWMB9dXbQBS58KcgpIN4hUHEQ+9AL+x5cDTZxIMz4W9dKgI6JELSKTc0WOtOWHO+xNiWJShzpke8UrvzUTuKJISpNWnb9mcTxsVt8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8173rVf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8173rVf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-246180dc32cso5810505ad.0
        for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 08:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756134088; x=1756738888; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60iKAkP3LNe0WedWNS1417UnpVB5oYJPCUr+7fQ2LGY=;
        b=T8173rVfFHnD4fezYNyMI93QMLnUcfMx9bspTUbfszK2/PWUajIFUWadDyIy0xmoou
         CNLvCcYIOwyVBNzYCLWaZ/DvggcdlATb+/QpB+w4h8SOjvf/tTA0WAe7JgzSWg5u5PSs
         c9/Q7ZVzgcSGz9DgUeJ5vijAGk5JudErtOOabVA6FbfOldVZZcgmuEkJ5BbHUKHlo1ip
         DsnLoXYryypeKF5Q6ErZQZki9+fiac3HWTLmtdtHp3W9NMSD7ovGbZSNaMDsB56yDcPx
         1brI8yrdKU4FmGGTnON6C2qE1KY+Dk3gjC2dj798zxPhu2sRVJF7WCreuV0yDBPBw1kg
         6pNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756134088; x=1756738888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60iKAkP3LNe0WedWNS1417UnpVB5oYJPCUr+7fQ2LGY=;
        b=YR25XysUc5ZS+Lj3mttRCdrRf8a0kYWC1ESpk/teBaNllVxo426QyZuSOuYjVYNIVg
         ZsXdwqTiBbtrXLiwOYYWPj7s10euAuX5rUBK7s2n6spvExe6LeZRSQh+CXqXVv3ttMvX
         FxphhZyR0MTeSWzcDI2uHXPKp9i6v/abehrpybJnUPhJ8Z7l7dVoYPhvWHQZM5uI54vG
         oBCIXe9u62SkUSbkT+xGZQGaZqKZdi+n1xU437RoM/qeI6WI/9RsUW+n1d2Dp4zRewHb
         3lvuoMDIDl4aXD81jW8+coMgNY//NkDW0B371q6H9X05fXEMdZwLJWqlaPNk2n5Ewfgg
         flcQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+t9V/imW/VuzkUZ3sjBjSJ9W6aRF2dzjCunuqUSfk0E+QPxyQ6VMIJEn10EKc7zj8veLi@lists.linux.dev
X-Gm-Message-State: AOJu0YyKcpKvSgmE70Kwe7JzdaH54/SHKeEVxNkisbv0qDqCr1z/8v0X
	HVf7fwclXsg+Epk87bSdpGpw7WpQ9SDeFHhDvBcOjkixRBkWSzutXqz2LQNnDdYrfjSQPspDjO3
	SxO6TSZpWXcIwoytws9r8SbJ923HLZPY=
X-Gm-Gg: ASbGncvhmXODtjcOXwCvERIwhJeKYQ250wwKIlswOctf3IzC1U50TE/dPJ4DhWK9AkG
	psZMHoVDlodQmtMzIo+63QzlajB+m8uQGY3VL46lNGoD6O40YPuBAI9DPTePjC7e6IBtfXLZohi
	PCtLMHqLk8vAT0S+46CCPCeAWe+zzW3FlaErkgbvM+6+PV17Zj8TaDm3MRNzC79kYLZkwIo1kFf
	ve0AtYqIQi4GIvJ/2ClGHG71KLN33zege2dgNpF7JsPKnbXaQbTR3eAUWuXGOkEsg00eq7w06PG
	W6qC69VlxFditPDL+7K//ZHv2A==
X-Google-Smtp-Source: AGHT+IH6iiTQnmspwpwZFl3fWU7ZoF4htCbSAXCmYOC5YgyGhCHecWhDJChnNEZn0Tbpwb/nBEcItL6vKFF5JoBFO9I=
X-Received: by 2002:a17:902:e5d1:b0:246:9df4:d10 with SMTP id
 d9443c01a7336-2469df4127fmr48184305ad.8.1756134087549; Mon, 25 Aug 2025
 08:01:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Aug 2025 17:01:13 +0200
X-Gm-Features: Ac12FXzL7PU_Is1-tccv7Hdj8Uae-cmowXNNIswc_ypx-UP0ygKjVjE1oakxuiw
Message-ID: <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 4:28=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> -config CFI_CLANG
> -       bool "Use Clang's Control Flow Integrity (CFI)"
> -       depends on ARCH_SUPPORTS_CFI_CLANG
> +config CFI
> +       bool "Use Kernel Control Flow Integrity (kCFI)"
> +       depends on ARCH_SUPPORTS_CFI
>         depends on $(cc-option,-fsanitize=3Dkcfi)
>         help

Do we need to do something to make the transition smoother, i.e.
keeping the old one for a while to avoid a new question etc.?

Thanks!

Cheers,
Miguel
