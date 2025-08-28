Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D3927F73A
	for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 12:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383127; cv=none; b=ovzYpbqruqGdlfvixEZ+nWcf5Wn+ACsrJ/ys3wrG2I4wrUhsskyIn5uHxS6oig18BBsivPGCXL1IDFOLzLRZEOU6LbfcVFeuGYXJ6zXsmtVP629uknv8eIUbpSNz1P4vaBUdnOAuVAQkb5TIFkuSaNHZN+b3H3LiRwI/G/F0kjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383127; c=relaxed/simple;
	bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tEea8Xq66T2X67Hl9A5W0Ep2Hej6jc5Y4iriqvRYyh8VxA83yHvnDuVISikRgaaieRSqHXA65SKdGI8AWHoPieGAiLwZCZ//1YPTouL+HEA+N8loh1VnPV/FFJTXgeW6eYoWRHeCC10DrkXdE7k/afGqWbMURo7uanON4tJVL04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpV1KU39; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpV1KU39"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-32326e25000so144657a91.2
        for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 05:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756383125; x=1756987925; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=GpV1KU39pOGpsRbW0ge8UlCQ90F+7bOkbYnD0F9kp/cEZZwTFDav1yar5BPnrWkAPt
         PFHiGf6Cnj3lAlUtFNezQ2jGTosNZOdpsG12kIJhHPULshiwLpDDaCkftKYkM3UXVZTM
         8QgKHBFCAhZmMDg7Oe/BOQ7TWQ7OTTm4RcCl3nf0r2I8ED1j4H1wgOoO+hjCZ7Pku3cj
         XZeHl9tRxHaM8vKlPaQDZ6cZrTjY4z13DQ3DET2cV4dennL5iEHFPRBeEswwdLuwMCiK
         BtX6TwA2Qr22hW59L/9rkNwI1d+YKqcemJ5Dr5PORsCz9gA9teWJp3fi8e6Po5rTXWgY
         8uwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383125; x=1756987925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBzvIT3GFkBSLfKgD0eHJCY11TPcf6eJ4FO6sX8esZI=;
        b=QOgMzSXY8CFOmXpkn+yduBib9G+LPBSmldaTixorjKVjrcTZjonlwxHARZ7pe5V1f/
         ZExbyxArzFWEHCUfzSWja2ZxwrDNcSEWIcL22k7cLuiN4tOeVc7/jb5ybwcUN4eam0Jk
         lJpY/92oaSEBL0mG/kfONnvvXHaumwaz8CxzgG6qqMrGBIuTIZA0maUWa0X2XYfM3oYj
         IrbLIgvITOALvVVNhzhmKHLGtWnSC4dJvIS/EhMHaEgoCOhGUxyefDoKJl8Cak7dnRSI
         4QwK/261o32p+H1PRblJ6FZerr9UGjPrKxxLx3sb7vpJO/inDV7k6m255JXijFtkxrav
         OTvw==
X-Forwarded-Encrypted: i=1; AJvYcCV2SA6jSuIS4X3tGHKeC8sMxROD8JefHNTmGvM9fed+h2y0SSf3e/T24kpZfXz8RJUsZMGL@lists.linux.dev
X-Gm-Message-State: AOJu0YxuKC4rxLlCraXhdCmQ+OOsGzknMpBHMvz7lcj65K1EsshbN/m4
	jy92B35NGZtwqTPOX/TJSJ83RAZv6fxijPDmKdshnKe11AHki31NcJUfFC4rLWNeSudL6Emscak
	oMyIB7S5lrqbXQSfVQkt7Q4oHeK/diP8=
X-Gm-Gg: ASbGncuZdG4oVW0YyzPqVZxo8t6mHqVCBlpkQL4HdjE2S5j4vlhhh8d6sDHW5GudPG9
	yMj3x2C8497+V3Ejaiomq27AwziQN5JWOa2MuoVm00WhoXR0WDMXP/YAIwchSEANVdvPU9dH2bU
	yARN23CpQ4DUCONmJKNmTdE15qC7NMHyPb+Z5FZEfmnRB5XP1Mz+RkXpaeduaNe/JIqRjyrUNL9
	+ZQDzEBOo/YU0Gq3pPGgPAz4opRhu9xaur3ER2j+odWk2T5tOYwEEEy3R+Y0nt40hl/tMrsvJ5B
	I6wAjGGmFgC4heJ7pWqld2Iey/mrc5ld4D2srseH3YFbSX8=
X-Google-Smtp-Source: AGHT+IEHY3yqO9UJS3OJVe1SDsi7P25l1Vl9fz/i5xssn5nzwTw3KmrO7fDBd0I6tpqkx5s1cY/itDMI0psIb4lzmPQ=
X-Received: by 2002:a17:90b:1d03:b0:327:c9bb:be51 with SMTP id
 98e67ed59e1d1-327c9bbbf98mr469357a91.1.1756383125171; Thu, 28 Aug 2025
 05:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250825141316.work.967-kees@kernel.org> <20250825142603.1907143-5-kees@kernel.org>
 <CANiq72kc7Ky6+7Ny7jR04s8vU-g23qBQC0rQrOZDxDzXT+m1TQ@mail.gmail.com>
 <202508250834.E2456B9@keescook> <CANiq72mQsLqhpX29NP3Zm8HZ5m429tSXjgFcRYJM3e=Zac1G1w@mail.gmail.com>
 <9CCDBE93-7DBD-41D0-B9B6-05900F2AB1EE@outflux.net> <20250827013444.GA2859318@ax162>
 <56c2b1ce-00a4-403c-9927-79bfd9a23574@infradead.org> <20250827193815.GA2293657@ax162>
In-Reply-To: <20250827193815.GA2293657@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 28 Aug 2025 14:11:51 +0200
X-Gm-Features: Ac12FXyJC97cqOYkicibM9SLfUWzcvxlb3Xn6gpRe98j59S9iV5Oq9n8aEdlnuk
Message-ID: <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@outflux.net>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, 
	Puranjay Mohan <puranjay@kernel.org>, David Woodhouse <dwmw2@infradead.org>, 
	Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 9:38=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> I am not sure I understand what you mean here. With the series as it is
> or Kees's suggested fix, oldconfig still prompts the user to enable
> CONFIG_CFI with CONFIG_CFI_CLANG=3Dy in the old configuration. Both Migue=
l
> and I allude to that being fine but it would be really nice if users
> with CONFIG_CFI_CLANG=3Dy were automatically transitioned to CONFIG_CFI=
=3Dy
> without any action on their part. That seems to be in line with how
> Linus feels even as recently as this past merge window:
>
> https://lore.kernel.org/CAHk-=3DwgO0Rx2LcYT4f75Xs46orbJ4JxO2jbAFQnVKDYAjV=
5HeQ@mail.gmail.com/

Yeah, I think for pure renames one we should try to avoid churn if possible=
.

> Another idea I had to avoid this is introducing CONFIG_CFI_GCC as a user
> selectable symbol and making CONFIG_CFI the hidden symbol that both
> compiler symbols select. After a couple of releases (or maybe the next
> LTS), both CONFIG_CFI_CLANG and CONFIG_CFI_GCC could be eliminated with
> CONFIG_CFI becoming user selectable, which would keep things working
> since CONFIG_CFI=3Dy will be present in the previous configuration.

If we are OK with something like this (i.e. waiting a few releases),
then isn't it simpler the `def_bool` approach I mentioned? i.e. it
means one less symbol and one less rename later, right?

Cheers,
Miguel
