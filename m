Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BF265CCD
	for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421760; cv=none; b=O7M6Ku6wI7C3t6Sl1mObtCZVj1JoWTTff8cVjqDSFiN84glmGrSSe0J3ESelQMHZ9os+Fl7CmjBsF0cuUpGyYn6jGNtf3kgaBD5w2bqm6BQp4n5nui6zjMBpM1Dp7KUoBqVodbfO7SCs+GMFkmO+tBXfKbr7U6t072Z67XAI/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421760; c=relaxed/simple;
	bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M0cvQEuB6oo5ioi1lsZv9M1I3YvBXHmvvsDDOMjLs3cpIKG7t5DQhasl6NI3xn2bVTV2XL/K2NAEZLAbwlAaAdI8LG0qsOhECzvAEyAFeSyFY1dFd9POG2F5IkX/qZ3Me8ATj9hOXIbilFznVMA8N50edUkG2hZoKrPimsqQ4AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a4kxKKL7; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4kxKKL7"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32326e25000so225360a91.2
        for <llvm@lists.linux.dev>; Thu, 28 Aug 2025 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756421759; x=1757026559; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=a4kxKKL7HtkvmBnvemzgsGZe/eN3RemAwwiElooQKumzancJ0Bswf0nUkeu6QZ221b
         No0MXqtpIqfmfL5ih3wmswi1/5TNYIH4VP23kElNGEIJ8l2/Wg4GGP2pdNZWEua4k2kL
         r2lqlHdm+CVs6dZsSFgeR9F2G1sjvLJPkTverNaoov7Gtywya7ZnjHqJietqKpH9oRx9
         dNqe018GaOGO4lrgnfm2QSIootZ/mmqKH3kgSFs4VJfUar+FQT2tcS7WIruFFpGAzH8N
         nnRcqYXgbYcLoRJjRq5wlfJpSQL4dP99wRzaIpDXYwlkHVlryhgpMjL6Au7POzcRiAth
         k7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421759; x=1757026559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOlmlhx/uoqj1tpz6UAHfclWZ6+mPZOOZPCd2SEw9SI=;
        b=Hi90jLQAofOx30WjHu3foXfKfw7KSh64/CYza2/D+qiUXbGUUbYmfB+MakIwUOYX1y
         0E0SiaYU4QPcliSItefjIUYtL5BuzpBKtyg7qVerZ+I9s16EH9p3SJ5ebfiqnS8ZNwg/
         rg04cmliTJPlVLqaK81KrwKIHK69aDEJKJ3nHMCeSsevlSqfD2fMd444Ur2h5PSrDigz
         QZKGI8kNDtGxhik6Oj1phrWT9Vja4nZFPJyZBBjf9X59z0FOIb4xIQVsG+Hk6575ZCM5
         Z6xdU+OMtuyeg+6+xJnwFCtffrVWLdRyq7H1xQgZ7+6cGUzZzVQnn+taYHdLqdfav6hG
         CT8g==
X-Forwarded-Encrypted: i=1; AJvYcCUacRswK7R9CBoqetSpz0f/ekl4fGhyfbOHdZo9Zvb0KjbdcuWF8AokdYvLMtk84Pn9022N@lists.linux.dev
X-Gm-Message-State: AOJu0YyOBcX5TEuOMG18NXsSXqz6gqftEL1mUZNgFJNBKS8wFVwt9158
	KOv5KGrfzEn3gGKHP/4QIJuChlXLYSKibb0KDB78J9tfg4E4RRr1L6OyyT7nFscs9lkCenOK+oI
	0lpyTbgX3FPYfvppuCDI/WETl9voU0BBkhzOUVe0=
X-Gm-Gg: ASbGncvIqIoG22xjWWapFd445pdHyEduDLLSm9HZ3XNbOs/HwKecQj413+K/aKtJR5Y
	jrXdSQObfTwvjkiQp2eKV9JW2KGcTEmguCauJMn3zPmviD40m3sXVn6rfIwoF5ke8cHGXAb9b0y
	JfiMwOBpm8a3CIYuL4DPawf/xPUtpTMTLGLMRI0w279aFN56ybtRIONYIBXGR1Xh+LrRAmY5dp+
	k/GJStJMVDNuf9+I2sJS3uKtuvMHgiqYO0WgfyU1VNGZ0bA54JHxbXQ2CH8c++aV8zTZ2gJ/8gC
	+tfAjhyGMasKuNoP81m1LWdmkQ==
X-Google-Smtp-Source: AGHT+IGyhiVQPmqOT0rpkocxIF4+MoNVf9DAEsmChvxF7JPD+Cb6PcP1MNWLZ1lQ4jj5g+ohcbCqTNY4bA0OxcF+1AI=
X-Received: by 2002:a17:903:22c8:b0:246:a93c:aa0d with SMTP id
 d9443c01a7336-246a93cacc7mr149453825ad.11.1756421758714; Thu, 28 Aug 2025
 15:55:58 -0700 (PDT)
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
 <CANiq72nX7d3XQtQKDdeUh2RFy5HqSg360m4pzesJyBP+y9K7FA@mail.gmail.com>
 <20250828201915.GA219815@ax162> <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
In-Reply-To: <25B398C8-4D9A-46C6-AED9-9DA2805DF9D7@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 29 Aug 2025 00:55:46 +0200
X-Gm-Features: Ac12FXxNeQ4YfImZMukInEZi5M8BoR7IH_90HG8_feBBu1eJLxGu0KIOUkXPLIY
Message-ID: <CANiq72=1XKdy6VrAPE7xH65nadFzmrBBJWsLw5tYmxNJqFbnYg@mail.gmail.com>
Subject: Re: [PATCH 5/5] kcfi: Rename CONFIG_CFI_CLANG to CONFIG_CFI
To: Kees Cook <kees@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Kees Cook <kees@outflux.net>, Peter Zijlstra <peterz@infradead.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Mark Rutland <mark.rutland@arm.com>, Puranjay Mohan <puranjay@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 10:32=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> Oh! Keep CFI_CLANG the visible option? Will the later rename work right? =
I'll give it a try.

Yeah -- whenever we want, we can move everything to the CFI one, and
hopefully many users that enabled it will not see the prompt since
they will already have the value there already.

Kconfig doesn't save the unset value in this case, so some users will
still see the prompt. Which I guess is good for the GCC users, since
for them it is a new possibility after all, that they should consider.

I didn't really test it thoroughly though. Caveat emptor and all that...

Cheers,
Miguel
