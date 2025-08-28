Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D6426FD9D
	for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 22:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421190; cv=none; b=SUlRgSXSdl2S2OlEK2h6q+wMRCYqdtEmm6q2yH2aTku/TYjk0hQF0CzOKTVErovo81/aZx5iGPlfgDDwYLqiWnMQ09qlkc9aU9j29L4ev4d44sdy5cjczzoEKenO0SCUi9CpZnL1u9rT+4BOTxp0mu/Hik1LXDl+sDnsdIhAqSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421190; c=relaxed/simple;
	bh=qZcEmOVzMLqyrHZwTmPM2aNebxZHRLa3GU1AdRbcKTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9AEBpZPsnGvH5+7OsOvEHdB2AsWiRCSLW7IIqvncEPueN2qHPIMLjrl3mpj+FgKrCjiMCuJ0MD1wNtB5m0JzXhv2lBaED3v99xNjQns2MvKfu1OLlcCvUH63V1FbrtFQtxrHql/s4Brv60yDxI0POkEar0KehFUzs4HMQGcS+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7GJ3Noj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7GJ3Noj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2489b6b6cbdso1905275ad.1
        for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421188; x=1757025988; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=Q7GJ3NojK2qEvpesCVG0FMlnZqiXfd4cjSKac7V3wAXBgdv/2Jy6Y+zbYph6DZAwmH
         QFMsRLC8xhdIavIJ7SJgRmcZOiL2v2Fi3GOK01HQB+LBq5grKapUrzNCLbeARr+WHhT3
         3FKDwQ8f2pXQ4sErrLmAw8mCXdeBqSxsTYwaxd7Nxxt4LNO8mHYRm1AfTkTP/kRg2aFZ
         n8+WyGP5yoNCbuCYY0Qy/s4pj7RXrkqdtARCAFq9qm/B9aT835T2aCOBh00OxrYh1bFK
         n5y7x3QNPMeeDx+C0W89DmeVlSX9L/xKslZPs3dKzhF5xBdAq+lIDiMn+fiVe7oInHB1
         FY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421188; x=1757025988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWTfsYajgxspjw0BEVIGAJj43TSZuMXWhqAKPxCzuMo=;
        b=pHPNkfsdyMInqbfNr023sjDLJL+hLLi9vZI1CG8lmZnwoi4Z8uNYkaP8aaIxVKLk/+
         a2xwpiRk6GLOMZ7CQht/VNCdBib8we+M9BbJhsuTEnXRqUxJMrKGXiGR70cR/rfjvOqt
         hznw6NC/FzDf2FrA3pe35owgAe+LYqnObQVnoSjAt3y63Ji6xySGvnzPhWJ45k7H0bD7
         Zbbu/aTDZR+LifztCmtKm9C+RW69+PRVSwF/0UOqrTJ36T3DaYYmBIiHrzY18uSoxgvv
         AvkOsNTU/oClMiuCCLU5RDkoVWZ4oIStQ1rTMnpquDQjHhC89rgFwle2y7RgvKRBLEBk
         eMxw==
X-Forwarded-Encrypted: i=1; AJvYcCVx8WmYpEVK5DB3vohKqMxTgs8nBLF6csu+SblmDsctXSrVWO2J3NC7vG3QvQDuWAFqT2A7@lists.linux.dev
X-Gm-Message-State: AOJu0Yyvr9FMKTkHuzX9zCrdD9QKa0a4uT9SGXvQALQBV1A9+oE7exek
	GsvkjKeFAmfpEY7Y18l0aPjMU3jSC/bvhxI1kH+wbuxd5pbxnCEwnAm8cH6+qo5Rbi/NH7eQZjP
	xw7S5EuLfO4Vzv6p1HpaU7usJ0Yr07cQ=
X-Gm-Gg: ASbGnctQ/shzUEfVP5KA0dJrQWnN6LDNjs7POCtqPPHkehBIlLi0t73WeibcB41uK+5
	HpR6UhLnTeoZGEcAnXIwdNPJTeBhsfzLI+uB7GjXXnTfurDJaQyqbnfYMEjAjcrdfd8JKNLJzQJ
	q6UDvFXXl0OK0ZBy2wBs0DvYVbhLeXBn0+ZxQJ5VvpBg9C3IkeDmBGeOkK3vgWbdhcV2XsVOd5v
	cuc6i+ZGfm97oD16YEM1GDVBqWpE24PW83Wr7GXT1NezkrJUWmpsq+k9GniUaBdY1VqkHGSZKYp
	s8+cYxjg25XcAE7QK2Vw/KCA1g==
X-Google-Smtp-Source: AGHT+IEki7N5+ZTphBMAlPvPh8Ed2D0soQ3ee4I0yeC35pDHbq+VM6I/+v50+BWUjpOg7vsfojcxdwe+ytoieurevJg=
X-Received: by 2002:a17:903:2f0c:b0:248:b43a:3ff with SMTP id
 d9443c01a7336-248b43a098cmr46736235ad.8.1756421188295; Thu, 28 Aug 2025
 15:46:28 -0700 (PDT)
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
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com> <20250828201915.GA219815@ax162>
In-Reply-To: <20250828201915.GA219815@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:46:16 +0200
X-Gm-Features: Ac12FXy71Ta7noj8hoAJaRqNi-cWiWGGHMHvo9xSNtrTkaZTnVcq8IZX729diUc
Message-ID: <CANiq72mRKHunT2Zkdj4dS5yHrx==MsmY33BvBqOy52_pNqrZFw@mail.gmail.com>
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

On Thu, Aug 28, 2025 at 10:19=E2=80=AFPM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> Ah yes, I reread your suggestion and that would probably be the best
> course of action, as it does avoid the extra symbol (although I am not
> sure what you mean by one less rename?). As I understand it:
>
>   config CFI_CLANG
>       bool "Use Kernel Control Flow Integrity (kCFI)"
>       depends on ARCH_SUPPORTS_CFI
>       depends on $(cc-option,-fsanitize=3Dkcfi)
>       help
>         <generic help text>
>
>   config CFI
>       def_bool CFI_CLANG
>
> then keep the rest of the change the same with the rename? I guess the

Yeah, exactly. The name isn't great, though, as you mention, if users
with GCC see it early on.

By one less rename I just meant that we wouldn't have both CFI_GCC and
CFI_CLANG "moved"/"merged" into CFI later on (just 1).

Cheers,
Miguel
