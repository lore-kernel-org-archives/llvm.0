Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3213E2264A9
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 10:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776853541; cv=pass; b=TY8MJHXOJ5M2BaoT7g79505/S+r7aETu/puzbVhN4QVdQxPq2HgKcpvgqHgjwOGqTrBBs59EqUEBaryNNVpaM8ctTodqdSnivRolSruQuz8fp1fipGWJipIDLjSC4aTaEp2xKrnKnNEC/cuA13OtvgYD9NeVkhYEd3CAEO5upY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776853541; c=relaxed/simple;
	bh=m1DObkz+KEZg9AE6oCn6SEHmSYUlpYIR9zoPeTnNycw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Amh0NZ2KYzAz4Vb/iJNxmk2Kdb5jvzu/HB4k9+NFYMessziAe56QCtOg2I8LlmUE9C9SpIb3w+ul7Wv/QkS/vbSdjn4PrImli1CXXr9RxnDpE/F0iG1jIUcn5wz0uVnnf7StLICUHxX67/P1ZPu7H+op5Nk2A4356l5z5KV6a9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=az225mB2; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="az225mB2"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bda3b4318dso710669eec.1
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 03:25:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776853539; cv=none;
        d=google.com; s=arc-20240605;
        b=a2Pdu8jHy7012GeGuRCRuQ0bgBr82Jw2ZKyXR5+PnSmHLl5Dq0SCh+bPnKg824Xqtj
         5RTZQelJXbVkrtW6ZYaEFKr4aQGje6sZI19dvY7xvAzqhi68tggnEtYHz3l0kD8+Zpu9
         nxUR29wScQDx/FjXbr30hDMtm/3mSdp3zOhRCP/iZVo3AcTmRrS2xA4JSxtswcVzEwJl
         lNPZTrsfNwqqNLoE9czXYl4vnjcGXcNo5vAeJ0HDh4EbAz29GaVZ3Sl//61mhZ0PUenL
         80H2EVXpCYjYZONUyfc4Aky2GcS5U/R9jMgUWe95YiJUoXvLku/VHA4n70gm6p3fbEc0
         C2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X5qZGcc4x+pk5v9ktUokd929/HO1011jn/3QuCtjPNc=;
        fh=e8olPWZSSeD05fz70ALrtoJ6Yl3iWJQX9L4Tvvr6rVY=;
        b=M907Y22Kzz/Lu+0S8DcpW0GqRUQxjpUIqeoiK+0UyuHojCJiFEJN84+6yyKOrDW7pk
         1PvN1oRyHp/UQRkysvKxqZqcm422yc1PJErZj4TPEBl1+cQwR8+58wzrDCS0wdKc+Bcr
         /tt1GdDh1d4exbOC6h4KavoHqSx3DLyfLNWLZUXIZ9kNscP5Ij9zhrEnDBlIcb2pDjaW
         z74CVhJfC0wIiYYuGwGGPH8ELQ/25TzRygH+yMQIdF6G43xqzc+GhHQr2FO44nmn8/r/
         4XV8IXmv2R1pEFenzTXH7j2PZK+p29/aFLbo9xz7EwJHZ5iw0QbJgkqdyPLooVTCEY8P
         O+qw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776853539; x=1777458339; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5qZGcc4x+pk5v9ktUokd929/HO1011jn/3QuCtjPNc=;
        b=az225mB2AUOA1mOyljv/Vo55MgbVzyTfW3CsZp7124iK5PYyu5JF1A3oamYQNVDwuz
         2pw0vBIC/G8s97ONqhcNYr+R4BtgX9sxGAUytDmjUatx2o0nypTWUBGJEq2JilMB0Yok
         riyVRgu0B0X1AEWlLxm2ZlTdllYAIafjZc4NI6qUQ5kBs6KMrQUZ4UFR0xGkD7jSZIFf
         bPI+tFkKq1srqHtbG5G/fPHRy161w6OI1ziPDNzSq6ghCO5jLnIMBAdQzFPtfNHISvs3
         ZPWbqDq7z5lc79/jl2w+Ku4Sc89Dw3SgKsUODP2PC77+gx1v3/UohUB0K47ZAuiYCHyx
         t6LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776853539; x=1777458339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X5qZGcc4x+pk5v9ktUokd929/HO1011jn/3QuCtjPNc=;
        b=HmTc6Eh1r30EW0yQzNGQyzfoIz3lgQ6atkiCG1wgaDKNx7D2wc8zcgCTmONJB5Y0pT
         9HSysrkWBMMuwU+c/soBhobo//Fv6SFm2+TO6AFDRMDTUIxU1gTY2kGt9g2LoQhyjROL
         HgTsXW9P9nIp5KsM2B4aYhYEDfHiN/dSeeCZ8hhIqtVnoUV7Q682tr7EcC17OPP7+vlv
         qRmg6O4m64bclFfeFLqSlyWBZYaCYNCc060zfmG7RTOg+jUhhIxex6NJTf75PSSVoYJk
         0gZ4Cg6a6b8payluGTDn+7v/P0cFrctcTAQtr/BXxh8rKYOZ/B6/Gwodln04UsUjw54I
         4Wew==
X-Forwarded-Encrypted: i=1; AFNElJ/BpP6NKtBXJBNgZXRHECD2NJPH+pVYdZEN3AJiN7YggvcHlKzZQX67UBe4ueyEfOAnOnO7@lists.linux.dev
X-Gm-Message-State: AOJu0YxyxnNDJHNZwQU7MyWMi+Jg1YbPqPYm0SCM7xVFaOcAKiaDWOmD
	qs37fLaBgP5h3szRG4j64pZQtFntCfL7GRYM1vK9eNxMP3/OyIQTKPPIDDNWX88/FH9cYr5h1Me
	II+vQQk90tEFHKZXKk8prkFRmlHVxnZw=
X-Gm-Gg: AeBDies+bU6LvPaWTScUJ2VRY3VlWV3NWbWMg8cNHicIH4YcQl6StJHO5OxHiStTVu5
	nw0vYyz1U7zlf3obtWZNz0QiWYBwHWnhEfqZjPenhB581yFVc3CfPnNaNJ71LMBAUW5faC3orxs
	P9XzsT/IqPYhQhX/aiPHM6uiLY3rdeRNDgfO9QjVtrKMYn96iWeCxCS9pCW/Q1iI2KzNgmMEn0d
	XWdE5Drvbom3sq5gVspV+qwhx3KxNcrXrPPVyY/CNnWMT96wdn22mPH34fzoDQYx1UcQxag7mUY
	EZ5q8sRsyvNqw+hfLfCNl2nvhFsrn54JQkwCIdeje+gJqHOY9mAWp0ecygUBrkfr1wksO5tmk3R
	cbocPOqD58lb0MXcUeMCWeyuo6yWXjZPDiA==
X-Received: by 2002:a05:7300:d50e:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2e478936a32mr4646610eec.3.1776853539281; Wed, 22 Apr 2026
 03:25:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260421190351.1976329-1-elver@google.com> <CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
 <CANpmjNPiyXdQnEXw=YbCrj4R5+8CvzNPX+C4gNaqW0Kjj2-k5A@mail.gmail.com> <63e461c3-2d8e-47c0-9901-34b53e53f22b@app.fastmail.com>
In-Reply-To: <63e461c3-2d8e-47c0-9901-34b53e53f22b@app.fastmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 22 Apr 2026 12:25:26 +0200
X-Gm-Features: AQROBzAQqNd17PCsrh50ljNHw2I1eht6r2wr9saw4Hir-6es6JKAMtVNz6ddOE8
Message-ID: <CANiq72mzmrfa8-7G92xOdg2sqUgLMdzY_P8THUUYXcSmFCZ6dQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
To: Arnd Bergmann <arnd@arndb.de>
Cc: Marco Elver <elver@google.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Dmitry Vyukov <dvyukov@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 9:30=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> gcc-10 knows the 'access' attribute, but not the 'none' variant:
>
> echo 'int f(void *p) __attribute__((access(none, 1)));' | /home/arnd/cros=
s/arm64/gcc-10.5.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc  -xc - -o /de=
v/null  -c
> <stdin>:1:1: error: attribute 'access' invalid mode 'none'; expected one =
of 'read_only', 'read_write', or 'write_only'

Which is exactly the one we use in #2, indeed.

That makes sense, thanks!

We should still change the number here, because `__has_attribute` will
pass even with GCC 10, i.e. since someone using `none` without a gate
in Kconfig or elsewhere may not realize the mistake.

So we should probably add a comment that the access mode `none` is
only available in GCC 11 -- especially so if we add the docs David
suggests, because otherwise it seems like it is supported.

Cheers,
Miguel
