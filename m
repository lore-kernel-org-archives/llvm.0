Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6987B2FFDE3
	for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 17:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774977432; cv=none; b=qGpfSIrzVUJaeo53KY90VT/fnp8K1GfFR2vfHMpD24KdMcHpM9fzJfiEuI05i9uJQPOe8ZfwbIz1XH0fuTTzqnjNxNIz9URTQiusPqIzCAlIcsPBYMNUlzbj4FoLIuvrCPbrjclrb/ZzIlqD0Ce0EkePgt751/oMH3vfz7lZ2t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774977432; c=relaxed/simple;
	bh=X8mgB91EilmZX84/+DAl/QEGzBiT68+EQBIZrGj6ois=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QeZ1CWDh8hu04ABgi9om2QrNq+MqSPzeRupgSQBGQ9C+/7fA7l3OcmveffLiSnQv47sSPO7QbE/T943LoZiDZ07fSq0HpKWKM/wMqZBdXgWL006uE38SPDqPeN0vs87mTOzQR3X9HQpUd5be7zHqROwNHHOHSYS3Jylk/k57704=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Hh2J2Anh; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Hh2J2Anh"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b9358dd7f79so54296466b.1
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1774977429; x=1775582229; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RzhkbeYcTn/pueZLzsl1uKI6wC45DhSkVKoC+DMZrjs=;
        b=Hh2J2AnhXD7u679lIxM1ZGmdISz/6RBjYeq+1c5TTVTwLTxfOIIire4meETEgNGjk1
         Ngsre2DyLTlF+7N7JihH17cHnneG5Iz1i4cjoUDai1JbfwFmR4DaRS1xGcsklcAfKivV
         P+ocUHwafZX1gGHvXZOCK1L9phQVlpwPlfzMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774977429; x=1775582229;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzhkbeYcTn/pueZLzsl1uKI6wC45DhSkVKoC+DMZrjs=;
        b=U5llRyqCB/i63j32j4BRHtptRR3feDhlYaB2bjME/ZPsqWrxv99n0aWzYrnFhZ21on
         DULrwMtf6PUh+SW5df17MEbznvsWnSZFlCEOZouYF1G8cUo1+J0EDwbOEyaYzcoYJYFt
         67AzpqxEFIcZmtuCUyQNVc/F9MfWVhYxh5Sqm5tHAsSbnw6JEtGRSrmT3w7bGJGqrCWN
         E/F3lPyjhL3X3G4W7++HUJ+VsP0XiTH7m5PVpqK655xalvtDLySOxQvIX2yPS2R9bBcA
         3uB7kUC2d+E3PqjFhSatbB372fXRoikhZtp1WViNMeDTTk5gnJi3vW2P5N2Gf1E+XPZz
         ldBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrPUmXt+RYptKnRy1ex2wiiei73aR9ZUlOURR38tENxynYqlGJutHKD/ckKLq6ywe9W3sw@lists.linux.dev
X-Gm-Message-State: AOJu0YyLYmldPNJfxT1LwcaxQqCNA2fRBrOaznvZZK+h61oqqUXNGycf
	0UGETLh3Zz3pEX7qYDRVQIFPYkakdKS9PPHLnwV9hwxza2LUo7YGiI4O4j0OGLMDF9TH8Uqaa4t
	tYPRVPk7QVw==
X-Gm-Gg: ATEYQzzn4TXC9/mMO/wZcljX9RL98pXiy3PEK2ZVT06/8KkV9+GuZ0BSHL4Jvx0J8g7
	RvkzRXrXGBKbSzeyA106s2Lw6AkwU5ZnF9P6SAdnikO5USAQZolZowi+fPUTI9X04FOpgvNd6Ek
	+53bX0jW5DiS8tTjAOb2vHklVcYvCB0AoQ69E8LU6EW0vOoKZTwjkhgpLbA7KTfJbfH5j0kIxZa
	i4y6BwohOzU0rip3noDw9Sqa+sjZkAwvFkU8Lsuo+ssVwRYWFDiJFc2ly6RMUsSII0h6p3vl+mH
	kREQN2ZDHKgdPeoe1Yc3+23VIhlGeNxPaS0V8VmYbSLsGUmr+JJvDHFVby+QKILFMdITKRVR/DZ
	UqFvbMYBwUOKPy7gWryCE2i9HAY/Rp/Im+xY5euui+5gMq1iHn7Lx4dJSHcVUzUSiXrh5i14u0D
	w/00zyZ/iJQsm4xff+MEUZRHJrgky/1lMT5NFjm8qM/GXvD2upLhf50sdbTda9mXJg4rcIfNcU
X-Received: by 2002:a17:907:119b:b0:b9b:fa57:d5bb with SMTP id a640c23a62f3a-b9c13cb5ef6mr28081266b.46.1774977428849;
        Tue, 31 Mar 2026 10:17:08 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b22530dsm429134266b.54.2026.03.31.10.17.07
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 10:17:08 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b97ed4ad579so940990266b.3
        for <llvm@lists.linux.dev>; Tue, 31 Mar 2026 10:17:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2T9PYmfCdeYRNivLkoDdcfvOfmGkWJhF1Sm55fBm/bI/MMVb0sHpTifUQgIr2lk7+1GFU@lists.linux.dev
X-Received: by 2002:a17:907:a604:b0:b97:b9d5:4ae4 with SMTP id
 a640c23a62f3a-b9c138e5f3bmr33991866b.20.1774977427566; Tue, 31 Mar 2026
 10:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260331163716.work.696-kees@kernel.org> <20260331163725.2765789-3-kees@kernel.org>
In-Reply-To: <20260331163725.2765789-3-kees@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 31 Mar 2026 10:16:51 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
X-Gm-Features: AQROBzBItZBmx5_N-ynlPw8E_7o3PG43Wcm0ba7e3I2MR7-9HUZsFelf3Nv9M7s
Message-ID: <CAHk-=wg=q7ptcMyUAqPGDbX_DKHivJVppc8bP0zpQqzOky_avA@mail.gmail.com>
Subject: Re: [PATCH 3/5] compiler_attributes: Add overflow_behavior macros
 __ob_trap and __ob_wrap
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Justin Stitt <justinstitt@google.com>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Nicolas Schier <nsc@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 31 Mar 2026 at 09:37, Kees Cook <kees@kernel.org> wrote:
>> +
> +  typedef unsigned int __attribute__((overflow_behavior(trap))) safe_uint;
> +  typedef unsigned int __attribute__((overflow_behavior(wrap))) wrapping_uint;

This is fundamentally broken sh*t.

Stop thinking that trapping is "safe".

It damn well isn't. A dead machine is not a safe machine.

Any patches that call trapping behavior safe will ne NAK'ed by me.,

We have decades of peoiple using BUG_ON() as a safety measure, and it
has been a HUGE PROBLEM.

There is no way in hell that we are ever adding implicit BUG_ON()
things that are this hidden, this easy to use, and then mislabeled as
being "safe".

Guys, that's the same logic as having a airbag in your car that just
shoots you in the head. You're certainly "safe" from the vagaries of
bad healthcare. But dammit, if anybody thinks that a "bullet to the
head" should be called "safe", then that person damn well shouldn't be
involved with kernel development.

So NAK NAK NAK NAK.

The only safe trapping behavior is something that has a clear an
unambiguous and simple to use way to *HANDLE* it. Not just "mark it
trapping".

              Linus
