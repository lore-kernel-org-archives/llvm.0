Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128A0332904
	for <llvm@lists.linux.dev>; Thu,  6 Nov 2025 19:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456413; cv=none; b=JJ1m4JoZZ30V1R9JbOk+VKX4uykEzhEQr8mPT8laoYCbgzyRpW3GkKIZAQVsoU6agfLGtBK/7MGBJf8DP5dzrn5pTTLURVenmuELuPEh7Ks/GZYlhyswpa5OtpwdR+56V1xjKEh82UnZg7MjSLkXhnv9Jt6PzekVs8pX4DhOTk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456413; c=relaxed/simple;
	bh=x4jOvehz/l5AwiSkh8ZHNK5e+NDXmXMi2EeVQIPNblE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RArM/IQEUIb+SBaIj73TG/5KcIrxlDgdh/74YvSnJpHfvUKl4lm+NWgOHKs3bAq6fNS7RZHE+/FjkwtzXm9esa5zer2+pmpH0k04RZH0TYeZgo+gYhnBSVmAoetu36PTnaYwmZXyrGwDoGBm0DQPlUBMuVYHalzDMXiO4wInDLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aPAq5fk5; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aPAq5fk5"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b72bf7e703fso32686066b.2
        for <llvm@lists.linux.dev>; Thu, 06 Nov 2025 11:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1762456408; x=1763061208; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BSwDbZjhNyoFvwcPDAsMYknEo4DE1C1kmOdtpNJhXPc=;
        b=aPAq5fk5qukj/vOorHnsmhgfiSXWnyDp0XsOfa5OLJI9vH4rRQvc06Txhs+XJNU1sU
         n62EwuhbHnhVD/fxfmGIzKYZ8dPPSo4vbCA9XVZ3LdIPcsZJX+VyIxyt7JxH7zZDke8p
         UbJVRJdPpIDosE8Q6lIU6IN73eNIuRbYjM0Es=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762456408; x=1763061208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSwDbZjhNyoFvwcPDAsMYknEo4DE1C1kmOdtpNJhXPc=;
        b=PBhoFuXEr7zu1EvtufjJQ0GMmRDkEgrXeHq9+BawlUHBm8IaI8MLiq5Cmd7a/9ijJ8
         tFhHcj9He7Nc/7CZ/4paFdlDOPvMnEoLVK6ya3VO/z3EcxovOXqdRaPC9kIMuLe7rxRx
         F7WWsWeKOFqSiUKn0Y8vXW4wd6oRL7jK3SYaGa/zzaPDiCpiASvtP8AXGqCEdLnhcGHz
         2KEAO8goCLQ1ZKGRiCPW92pFTdkzRSEeN78YVpxsoUMxffSkVLTodCCiZYe+KgR6JKsh
         adjtW4H/OCgsGiB1YBstN02LhnNlLpseUy4aiyaAFM0owucEZ+nyWMvPMPnGnLQ76djk
         4p/w==
X-Forwarded-Encrypted: i=1; AJvYcCUGtTOL9dZAjWEBXFzwNiYz1hQgl9F8gqJQOngKwJIj6/fDWW4NywxIKftm4pvHNJPghSO0@lists.linux.dev
X-Gm-Message-State: AOJu0YyWCj/SrarBXQ2WCtVAE2uhYK3Y6hkgpZmcka0qPSG6P7Lf9NOV
	f/cOmwUNFWp8Nv0lKnw93VV0WEsPRPrg1ptqW66kX9kxYuP3GOqKO1hO07ERK4BmdXL8g/1tKvM
	PUB2aKJw=
X-Gm-Gg: ASbGnctfRHh+MUjx+ZqYohPVU9KHIhP3z4+HyMF3J8pNsBDyMvvO+JP3/iknV7dozmP
	27W5EFCkBrjGonUxaAr3GCNJrgu0lG2fKqVTxpfuh3dno0M8eQXGVwCfuREFQfDK5rEO7/9dcEQ
	KHVqx55AdURNQAoWKcq4c6puGEYAxW3gIA0QGQa1txQL1093WPvbNGamWC1ekZXQ4//zDB32mZ0
	A2shxWCaJ0Mnpknw/GYJ8MJs9q8/iop/DaH3yY812BxCkod0f/8PzNXKO28oVAg8XPz9MD130N1
	4lDhaKtDVxQ3vLhTkGATRE2ALZwRYCk2zo06W/fS9yPLBc0/GjWNHWjZJVF3suGipSLcjdPNw9P
	1nPqJkGm0lUKGS3Q9t9dAJA6rxBhVJvqtUk1OJ3m8DrW48LrlAVDZecfcfgwmL8jHL9LqE39MPJ
	90JhiP5jPt5OI6fsG0AAjlL5CvfsHNa2NVg5M/EYe8YuFDW1E3wQ==
X-Google-Smtp-Source: AGHT+IHMDcGBpbnKhv0OTHwoNbLIb8oXtmJPb1JGEZz3uDizV2LBk+uC+WCWgSrJgfZMC1dy5oDUFg==
X-Received: by 2002:a17:907:1c09:b0:b72:6b3c:1f0d with SMTP id a640c23a62f3a-b72c090e64fmr44354166b.35.1762456408217;
        Thu, 06 Nov 2025 11:13:28 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa24d2asm26865966b.70.2025.11.06.11.13.26
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 11:13:26 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b719ca8cb8dso283710066b.0
        for <llvm@lists.linux.dev>; Thu, 06 Nov 2025 11:13:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJBfOkcbWYH20/dhy145aPrzkPhr9loRAhWdIxa4XN8OObTw3cSmGiwGBI4C7IfVA1vinV@lists.linux.dev
X-Received: by 2002:a17:907:1c09:b0:b72:5983:db09 with SMTP id
 a640c23a62f3a-b72c090e472mr49124766b.32.1762456406121; Thu, 06 Nov 2025
 11:13:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251106105000.2103276-1-andriy.shevchenko@linux.intel.com> <20251106151649.GA1693433@ax162>
In-Reply-To: <20251106151649.GA1693433@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 6 Nov 2025 11:13:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=whr8NCjam2007HoR+FT5W_exO9k_-jyHvhpossGwAW-=Q@mail.gmail.com>
X-Gm-Features: AWmQ_bkTzWtaU1K-M2qK_nvVYHzghb1UwFKSpdgbkMeiD-l3K-Zk6yGbI_EZmaE
Message-ID: <CAHk-=whr8NCjam2007HoR+FT5W_exO9k_-jyHvhpossGwAW-=Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] compiler_types: Warn about unused static inline
 functions on second
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Dan Williams <dan.j.williams@intel.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Nov 2025 at 07:16, Nathan Chancellor <nathan@kernel.org> wrote:
>
> I can take this as a fix via kbuild or Linus can apply it directly

Yes, please just take it through the regular Kbuild tree (with
whatever modifications this thread then results in).

Thanks,
       Linus
