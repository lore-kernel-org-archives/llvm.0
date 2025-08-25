Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AC823E340
	for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 17:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756141242; cv=none; b=RMcQXXJKBEudKkB0HSkLdWFGwCJNpQl68+2PmJkZVov1j5fFZ3A5MK8Sp2YHkM4qKU7jpy2ojjgjMlMPFF6MVj+4uZTuF0OBQD9s0quAetSQXbyPoqcT4u9v8XUstM17FfgzbnRpgRAcAOJNb6/UXXxH7Ewjt+GwbqjxjMk5up0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756141242; c=relaxed/simple;
	bh=rzQMACObvWiM9uVvHkabX7dVPQNESJ2VQB0+KavI+nA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9YPRiaobAYhWfmMhVkSgKTcMjIOkdtUyOBAH22UfQL9sJmblnSz9jhe+RE8YYhUIWo1+U7YTC87ENlo5H76IzjgUpa8VhzkaWsfMLD37uJ6V2cP0+aCYo9hJR14hr0kxt6LiC7XkH6Qa142A6VYu7srchO/1r+9kJvAkQE6eQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yz8QpBVO; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yz8QpBVO"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b4717384710so604184a12.1
        for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 10:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756141240; x=1756746040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0oEN90SLYgvRgTxYwIkfotkQK1LJND5IDEHVs53sDg=;
        b=Yz8QpBVOQnnYZW7ipt6wx6NBgd5jkEpVx6Tzlwmb5TWadmo3X3v6XVsPx+Tz1yehCb
         ceLRrVGA+FJC0VIdQa7qWz7bsKJl2o7DwExKI7KCoN5PP75UkWOjdFeop85EoQvmLylq
         bTwTCHrBCcFY/0T2M966A8qcNfEh7whlD+cQs8XFLrTX8SnAoVIFW2lOfAbcjgj+zvIV
         A561BjSZH4kDEUrXA5/FLDDfhLDrYxyFmlvp2KY2BgqsgByV1qOgI80zscSMaTQD3tQH
         vgDX5mUEWDGD+EJQ63EVQ+XeRxlNKM1EyQIQ087aoZ06QmTVsDVfxqPTqwflzuZyTBYN
         9AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756141240; x=1756746040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f0oEN90SLYgvRgTxYwIkfotkQK1LJND5IDEHVs53sDg=;
        b=SAuLmDWvp+rvJw2tD5j/ov6ElUEWgRzqMHQHGHfuH+5BGJ29ThOHHwNZyvySFM5V1Y
         IFn19lb4qXVT5qVKin3c/6m5i5vWA66IXTDv/pgh6J0uJOs9RRzshs1FPOv4l4ZLULED
         q1TutCjy9j/8cb4FnVNULMzXr2RSF7V8Qmd4qOmpQclvhE7x9BZVNDrztkueQwmgSu/f
         Xs5ygKmZemaUHUP/YaOX+t4GUmRkbGq/KIJjjphloWUARv19MirMJxoAlqhsS62A3uxR
         Dyjzat4EotAfLAqzpmOMyuHnZAHALri0FMA5UYNx1qVtotyRDyP3h+o/BE8FKC1UzNaj
         Wqow==
X-Forwarded-Encrypted: i=1; AJvYcCVopuzSAYtletFih7Nh+vu9/k5f9gqs/lemQGqoyf4owVgEg0LenTs38K1ECRuNO5HLI62P@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0msEKLkr6kMFXl52kjOXtDdjU6XPwjAOH6UcuJlrvq6rbZwyS
	G+sOs4bPwvuedNDsjWVkv2FwxVpIs24/3lL7zHh4JaIgyWpqQzJ/CSQd0YE33WqcM40aQvDxzPD
	gaXe8DznfpFSCbNDZpNKW7ilFWbDzrUQ=
X-Gm-Gg: ASbGncvMkX+6xWjcPb6k0BbwH6VKmW7OmeFeYe7ymGmEWUndg98Km/KDaQ/+FW119Wn
	8u8JezSc9KISHw4LtTozP86/GgOSVouZfmiimph/EdpLv2NfGIuQ4i3GI2xHOu84Gi83zzN7yQa
	4Vu3BqzHSMehHv0TEiAUorr87cvhEWGbcFvO0lrSU3iC5Bv2IyMTxgixc+3eETSJxp1Q54F4i4O
	CQn9dG0rGR8+M9E9kRZe5r4Y1EXolB9TCylql33q6rg+3FkKyrlLHA/A0p0TB9xF2+BSUQmkBI7
	GDAOrif+5bnd/i7tUUq+qlQMQQ==
X-Google-Smtp-Source: AGHT+IHKT4JJBJ9rgR6CsJmxUiw1K8DlbFWihB3KfiTBy1l9WKV/JStW65ETOGMdOn/RgdA5Ko6AVAJXlO2Hf7k2FPY=
X-Received: by 2002:a17:902:cf09:b0:240:729c:a022 with SMTP id
 d9443c01a7336-24630427edbmr91627825ad.11.1756141239755; Mon, 25 Aug 2025
 10:00:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com> <202508250834.E2456B9@keescook>
In-Reply-To: <202508250834.E2456B9@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 Aug 2025 19:00:22 +0200
X-Gm-Features: Ac12FXyYN3VEhnMM3td2GuBBEWm8dOLy6K6qZL3tvq3QOv-O5HJfG5pSFZcSTv8
Message-ID: <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
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

On Mon, Aug 25, 2025 at 5:35=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Yeah, that's a good idea. What the right way to do that?
>
> config CFI_CLANG
>         bool "Use Clang's Control Flow Integrity (CFI)"
>         depends on ARCH_SUPPORTS_CFI
>         select CFI
>
> ?

I don't recall what is the idiomatic solution for renames, but I
remember Linus talking about this topic and about avoiding losing old
values if possible (perhaps getting a new question in `oldconfig` is
OK as long as the `olddefconfig` respects the old value).

I think your suggestion above will still make it appear twice in
`menuconfig` -- there may be a way to play with visibility to make it
better.

A simple possibility I can think of (assuming it works) is having the
CFI symbol for the time being introduced just as a `def_bool
CFI_CLANG` for a few releases so that people get the new one in their
configs.

Cheers,
Miguel
