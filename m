Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBCF30F937
	for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756382937; cv=none; b=SGmbezX9RjpN9/sW0iy4iZGUBbM/njqVQQuoPETmWkpwvdxf8YpkU60H2xCKKUhDHGPlZ2csecz7ITG0lC7qZyCM/z/0co9LtWV+dYmJTKXw4dsgZA0wElZesfRXRfLSOZiY3Yy8EaPTD3VjG2E+Tp2sJ+P8LUXs9lv/ZeYRU6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756382937; c=relaxed/simple;
	bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P218KRu6YfkHNlbz7KMUDZbIsERlAy7vJaZa0Qush/Dhfjsndbo7N/rGhrvRO1sUdjek2Zn4M6xWpN2kMX2NQQ/dxPsFiMV7O2A1tM90raLpaNOd6vapgfM1Ze20NKa80hxWTQZBlPc0isPs5ITXLkAZz/SwqhAejr30RU+U6I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zJI+i2lo; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zJI+i2lo"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55f48d61ea2so1158500e87.1
        for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 05:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756382933; x=1756987733; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=zJI+i2lomzdnjEgfgN+49tGU9dw4+08m6u6/cDWW4OFSAQMfUt4PqnXjQ3HDsOPuyK
         CDh+efBXdqXdA8MYliLoXK4vZ5GDVXBdj82+iXwlElWG+fZDH25JnUgna0IlS6Gkr6Kq
         gLiotnaiyXpaMwya+UIyOtElLiDtB69exJMn0HvhVcKRwoQgQ5QXinFxnxzR9zmkYFrp
         Ny1N6oUa25Vg8DX9aOybP57a6nivp/eFNs3FYSrffOKpbyFIVYLi4Ezw3l004vM85Q7R
         RvPVMTVLg/JmqN9rqiULdEAgVqy9XgDInZmMJlT2K/U9PVGaw8CAkn1QwaJ/fAs0/q3Z
         r/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756382933; x=1756987733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sywg8iRUIcC+LFpPdVUH7AYVGdElA+Lmuu0M26yEpI=;
        b=pT7uHZvhUWGEem6bJcrJZuMLj5bK0/nI0Zt3RUJTh83AIZrDCphvNHd1abkQy5u5Am
         +cRU3Yb9MTFn5v3l3gjLD8A82XLiMIPY6g+FA29tFI6vkEOTdxcmBzeCfmV7ZzUf2es1
         adRtGubXH4v36s92BzgCcMfsni8bVZ9mTo+cq3VDSuGyT8jFjwANEjgu0AHAosVAvJ2z
         SpbRKN9VbAJ4yga6Y6GUg+eOB23kD6pEGiv8+zSmet1XvJtIp2wCubZGIpxrLCNT6R9j
         oCi1njahmwFu0kk3dZQLC+e/CLIBrgbo2gbYEF7rSab7f8k78FH6B8DNPK4+A3+NLyY/
         MDgw==
X-Forwarded-Encrypted: i=1; AJvYcCWAf3ZiyXCZjnu1O8B+SWqajrYzuk+qkRHHoeuTVBt3vM1RluJOeuO095enp/JkT+g5cBrv@lists.linux.dev
X-Gm-Message-State: AOJu0YzjYKAES+RRo4GfdUs+1xo3RSJ7XUeAHEAH+dHxuCJ+39nnWRaL
	XOLCaXsKFXgzLByUDOcLiPW7pabD6MjYNf+UbDPFEnx9SSLetcp66AMuJoDLrMwvJmCrSg6/rpQ
	krfgl+85oJXIgREcwlo+Yu6SBwMSnWJF+a8eUCq3vKg==
X-Gm-Gg: ASbGncslPhl/62dS+5eBd0rTdzW0mk1kVum8+564zYB83ercBboMTruWUHa329pl6t7
	SkPzPkh1GYahcs0LxtAuetLntr/EjPyhniBSBdCiHj/udJwEqN/zOtD+znP3sV+PXU2/Xa+Q799
	UuY+hoosVHp17sf1Kkaoaixw5tLxsu9qWMLkJitS228zlCCC5H9p2UsaIyVl9/MJFKxVzhY1MZu
	Q97tNj39v9w2xJymA==
X-Google-Smtp-Source: AGHT+IFg3M1giQrPALPiOG52C1JhN5PlRo7Xbw3xLek1Xu/lN9fGos88k4kc0ylKwurf0xKqLRcKUK5Mrc5xQ4s7/mM=
X-Received: by 2002:a05:6512:6509:b0:55f:53bd:b137 with SMTP id
 2adb3069b0e04-55f53bdb50bmr2129835e87.31.1756382933088; Thu, 28 Aug 2025
 05:08:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
In-Reply-To: <20250825142603.1907143-5-kees@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 14:08:42 +0200
X-Gm-Features: Ac12FXys7kn8v1WW0NYPHPp9t-_9fYAtRAX-1QlGxBAnqlbjxr2PgRu8yVVv_Ow
Message-ID: <CACRpkdYnM98n3JLBwVnVD3BRf4qrg4g9aBDqL_2Qb_cao6f5yA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@outflux.net>, 
	Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 4:26=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:

> From: Kees Cook <kees@outflux.net>
>
> The kernel's CFI implementation uses the KCFI ABI specifically, and is
> not strictly tied to a particular compiler. In preparation for GCC
> supporting KCFI[1], rename CONFIG_CFI_CLANG to CONFIG_CFI (along with
> associated options).
>
> Link: https://lore.kernel.org/linux-hardening/20250821064202.work.893-kee=
s@kernel.org [1]
> Signed-off-by: Kees Cook <kees@outflux.net>
> ---
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Puranjay Mohan <puranjay@kernel.org>

Yeah that was not a good neutral name to begin with.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I don't know about all that fuzz with providing the old symbol.
Seems complex. Folks anyway have to go over their config
symbols with every new kernel. But if people insist. I'm fine
either way.

Yours,
Linus Walleij
