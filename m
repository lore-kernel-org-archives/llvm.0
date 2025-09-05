Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2ACDF71
	for <llvm@lists.linux.dev>; Fri,  5 Sep 2025 07:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757058296; cv=none; b=oRPegg9iXNrh9Zw9pvMvcDNah+13qt4FBYhpokrCgdu20UGbBtduFeLKOZmphfBCpHesz0Y3GKUOLSPknmISeDPjSButiiAI2DvkRL4xpjJ23gSGrk+lv2iMTR2/jwhZ8Y53XPsXTRjKfHnTj8csGoXS6vCVrrGpbGfH3Yx1N4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757058296; c=relaxed/simple;
	bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hbnfwOi2O6WtG2Qb0iuFbr1KA971hN9nTwjacQ6MJ7D0N3OElRgu7wnZr9qB+Khj0eCVGFalxjLHcBV9gCLV+DLCCXGC/3TqiBqrBbrTtpvEq0KoXTGowX+G3Uk2khmQ7UESraBGPNv6Ell95bJHZUNeujgWIPBKwEwKcZKm9zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq0uN+8k; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq0uN+8k"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24b1331cb98so2561715ad.2
        for <llvm@lists.linux.dev>; Fri, 05 Sep 2025 00:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757058294; x=1757663094; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
        b=cq0uN+8k92Yv79ERULKNSGKPXEfmvFrmwAKdTEFs6LJNR+w7unIQHcqXKGBzUR75Gw
         0aF7Hc1pRW7sC7k02er3nErBandIkLNkZbHh/e0Mdx20ZJU6jgUbSTz3U8K2dTuYfBJf
         uoyEhlD/E4VmhVRMgtCsZS6H2/PkAgmcbKvOCJSlQNpHAZC4RzYbddDjLG4iXws7snX8
         qfMu2LymxAzCDzDX2oMzvhRaXmK7XUpraHZqBWkgtdBAdGfnXWGEZjyd0i+y+n3iHZOp
         HEwU0wsUy9QH7KSbhMpbpzbfsPhaV1p4q+USmeaJAe7fDlYKex5TTubMdN1gYZblQXjs
         RGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058294; x=1757663094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FriGNAMQK60A3zi1qw0sJL8xNzp+kQ4bPAmGrninAY=;
        b=wNwc9Z7wtsH6JLub1FYSZqupn9gnivlQprNogw5iHPmEP8/L4OF3x4zEfZxFssaBMt
         CdyrHmtS+TufLpnyuSWBaGBRFIRQo80k0yv6l4GrHegRpb31RqgLL3OfzBunlDWSDGS2
         js91uBYP20CmTJsIOJN98UDBC+++hD85TlVytyFh7u496hrt0OI9F5UK5/UH1yyGuPQt
         8WUKCCd2xWNJOF+SY+cT+WjGd3Rh2iUZ+6Js121X9KTFG5Qn7WAgmEox1Ypn9F4SNq7u
         fdpR45G1jgJg+B2gmrPwij54bypPUxpt1uCisMLPwW6Rt3ix82W1GeZpuUzoUayiJdpf
         qt+g==
X-Forwarded-Encrypted: i=1; AJvYcCXIVSy2u42HQiBcLUPRdMFkJLImDphZSzxkbS5j53fHV2TABSZvDqesYNsDIMTe4Pn09LX0@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3q42EAEFRfXtZ7BYGlSCxk8XCsa5hsXcaRBNXKH6ShdDSzS60
	kozIdmMMDJ+NNFv2NBtmTXzxo0m7lx2Qs6ML4DsNiieXjGflYzPDd5vsFbVT4JU/Ex4JwsrjNsI
	eAdgoTe05WV4G8eVBkSRFYSTleqXzmbE=
X-Gm-Gg: ASbGncuC6yqidYmh6LXG7ucRU1n6/AfNknGlUj8lg98iqgDEjuqC9rlmFt+5pV654yU
	Z0vGfwsH+9E4DRD6nRGUtITNY9QRzsSSk38DYuZqv7TaFSF6HJPBmYHikWToKnZP148r3ov7H1y
	68Y1cGhGW0UKZhHR+7qI3EbhlK8nQxRi6jXm4lsnuYwpKQLAzfb+OVTtWUFh3qHyuBQO1pC0J5p
	QAFJZLLKOsLLlG+53ZUPgLTQfjcvcVMwbPSq/xkYvptBoAHgCzyS54e95qv+0FUaoXXJNWGMKQi
	azIcCzp0KRUaEuDRsKvUl8mVpA==
X-Google-Smtp-Source: AGHT+IGp+cfcPTE7KjWQu/swfr5iYBHHS7MaJe/UBLnqHcZT/xW+eAFQaePAZ9b+NKm2RPENGVUXqKIAn3gIBqf29BI=
X-Received: by 2002:a17:902:d488:b0:24c:b6b6:e54c with SMTP id
 d9443c01a7336-24cb6b6e5f9mr45340275ad.3.1757058293921; Fri, 05 Sep 2025
 00:44:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250904033217.it.414-kees@kernel.org> <20250904070410.GX4067720@noisy.programming.kicks-ass.net>
 <202509040933.06AF02E714@keescook> <20250904200134.GA4067720@noisy.programming.kicks-ass.net>
 <202509041740.1007FFEA@keescook>
In-Reply-To: <202509041740.1007FFEA@keescook>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 5 Sep 2025 09:44:41 +0200
X-Gm-Features: Ac12FXxuAyzV67ABgZG5WJnwUzLnA_eITH6K0nXKAnUgoCmOACBUUDhH7lZTQYk
Message-ID: <CANiq72==vG_L35sQDGF6OFmTf=17qGs0k1NKiD17JYoforR30w@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] kcfi: Prepare for GCC support
To: Kees Cook <kees@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Nathan Chancellor <nathan@kernel.org>, 
	Vegard Nossum <vegard.nossum@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Randy Dunlap <rdunlap@infradead.org>, David Woodhouse <dwmw2@infradead.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Marco Elver <elver@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Ramon de C Valle <rcvalle@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 2:42=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> Assuming Nathan (and Vegard? or other folks from the other thread?) are
> okay with the kconfig changes, I'll take it via hardening.

I haven't had time to take a proper look, test it etc., so I didn't
reply, sorry -- but I am following the thread and I am glad if we have
something to easily/properly support this, so thanks for this.

(And sorry for having triggered all this discussion/work -- at least
if we get this done it will have been worth it :)

I will leave a quick message about the commit message.

Cheers,
Miguel
