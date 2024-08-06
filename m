Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095811BE23B
	for <llvm@lists.linux.dev>; Tue,  6 Aug 2024 10:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722941225; cv=none; b=IgbOwjbJv+w8ka6znUiAb9IJ5bYWEeBWpAimwRe90TH7dzj2/rFnkK2gMLX73o9BgCP9r6Bl3avd6Q5gN4plkdHERsCgB28yHpm6hPnOGBI7abLnhtkjRH+/nN6QFC+3rpgFw6ZP29vd08u0ld1M//uMXeBy/mSqCEztYPZ3nvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722941225; c=relaxed/simple;
	bh=VYIFMcmoFnEC+yzA/Q9NrdsqaxXWUOSVOa3/+7dtKFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oh8eHujs0CozwfXiUrjb4Gj9NtOoht1KD67fguaC2qcy+r5klDCk74/W/hszc8dWcrPxmkLkQ5WZehhu2mpU8eyShQnrUtv0E5Y3rrGKeQGyAjv3Yj7mtuLWExl08FQWA8FUK/BizkkE7l5cDnc0uXULLesd3lygR8MjSsNxwm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhB3vNNB; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhB3vNNB"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so358440b3a.2
        for <llvm@lists.linux.dev>; Tue, 06 Aug 2024 03:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722941223; x=1723546023; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYIFMcmoFnEC+yzA/Q9NrdsqaxXWUOSVOa3/+7dtKFc=;
        b=XhB3vNNBgTgIDR/TSwNLBxGJHsXCQEfyjkiPSShObekp4mMl8anPauuhv4HE5pPy/M
         j1ywSoZJfHVuG8jmmxwkWPcR/TlO1tG85dvqFddtuXA1pioBkXDDVkeCKMKBQ/xq8QB2
         20tT/yIsv5jgLuEW41FpPE0HnqfVh3zTQr1f+jO68DcsIDkM3ujhuh3wbf2tHt99UeKc
         wrUXrgtV7zq4xnbklHU8VFpgiq0E7AbZgmOJkrQOQKd9imivtPQ5g0HiauUuH2XSCFK2
         EJhSv48yDyvNz+EZZzZ4PYnWygmuwyw5M0M07eYN82aQZxIIKC3mtjp80PHDGu7J7JO+
         Wn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722941223; x=1723546023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYIFMcmoFnEC+yzA/Q9NrdsqaxXWUOSVOa3/+7dtKFc=;
        b=hEMNiJKpXTs8K4u4IgcTLycajY/eX04JqCvBywCfhZA7f/XhT2FYsXW+NWucPEDkMP
         gEeZfO5I+PDLyfsYLo1e4EZKpH0pFdJLrCxJKZZ3q4fMr2qhqjrlz09mkylRjt2si5n3
         XR0ViEOALUvtMifgUyaTIaBWY6YCs6MTqFreRGFLdDE5DkoV83R1Mxcyp8TqYSeOaT3M
         HCIbDx1Ev1SiU6jk+Fse5FeWsS/O4t9VDzzu7xQ2FJM12H6ZAAbBK509Uo8puyl/yR8e
         GaJLMnS+1My6yxHIKO2fkhN2Q0f96vhbT6lSmYGSuDUTo9cYPNHszcnus7zZPzZsPtof
         7M5A==
X-Forwarded-Encrypted: i=1; AJvYcCVrEtcJG5na/aQTKJvrMsIrGSppXQAkFsPj0yitLK8wYF3Tj46VYsYpoirezNcNPR49KkQV6Tj+lqRN7yXukxYWrse1iw==
X-Gm-Message-State: AOJu0YxSH4efedvDez3MZ61iBugYwjY+oHwp/sRlNbDKuvjH3UTyu1CE
	tL5YfJDSIvN+fSzCJ0K3elv8EZQNI27lpBpv+CG8OeIGFah9Qn2PFwD/QfZCIQgCdeHYAvGrINm
	xW003QU1LdRFyk3HXZ+SqwZPkCoY=
X-Google-Smtp-Source: AGHT+IF5FenssUoUMemoJIL2Bcf9TUbyZDFqw3lGBjUR6kyeAG9q0/eULHLPMdu8KMWQFGEdAEHdDhFefFrSJb1V3Vw=
X-Received: by 2002:a05:6a20:3951:b0:1c0:f2d9:a452 with SMTP id
 adf61e73a8af0-1c69955a835mr16736472637.13.1722941223180; Tue, 06 Aug 2024
 03:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240805214340.work.339-kees@kernel.org>
In-Reply-To: <20240805214340.work.339-kees@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Aug 2024 12:46:50 +0200
Message-ID: <CANiq72mifyQZ_13ZWYi2_cdcx9G3dOSVVtywC++6s0P_6JKAGQ@mail.gmail.com>
Subject: Re: [PATCH] string: Check for "nonstring" attribute on strscpy() arguments
To: Kees Cook <kees@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Marco Elver <elver@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Hao Luo <haoluo@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, linux-sparse@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Bill Wendling <morbo@google.com>, 
	Mark Rutland <mark.rutland@arm.com>, Jakub Kicinski <kuba@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Petr Pavlu <petr.pavlu@suse.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 11:43=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> +/* Determine if an attribute has been applied to a variable. */
> +#if __has_builtin(__builtin_has_attribute)
> +#define __annotated(var, attr) __builtin_has_attribute(var, attr)
> +#else
> +#define __annotated(var, attr) (false)
> +#endif

`__annotated` is obviously best-effort given this definition, and we
do similar things elsewhere, and it has a double-underscore. However,
I wonder if this being a "query" (vs. something like an attribute) may
imply that it has a greater risk of someone thinking it will always
reply with the right answer... (if e.g. they copy-paste another use).
Perhaps there is a more explicit name to let users recall that.

Anyway, it looks sensible to me: more compile-time checking seldomly
hurts (apart from complexity in these definitions :). So:

Reviewed-by: Miguel Ojeda <ojeda@kernel.org>

I also introduced a mistake on purpose and I got the expected build error, =
so:

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
