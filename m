Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33033F23DB
	for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996168; cv=pass; b=Tki21VonP3pKzBDtqkoW/xqGahBB+iUT+x0u9RCOXwdQwKP0yDKqO+z4TS/wOB6p+sJ01wxzBiOwzQ9C/EtnM/RkdKmv0O+eemaBdDRcZmwXwiK3feSigeaCClrySruEXpOvhmJB4OlZHbq6jdAhJtOqRMnYFJJnJL9syhSkHKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996168; c=relaxed/simple;
	bh=rKi6pIGi82k0LBkwFIDIO88q817cjLLfthYLujR5pLw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PkRpoG+HGeEo6+ILqxB+VX2AnKhiD3z0g9NU+wse2H1bT3w+RSStaiFIhGKbRyal6E7pUrSPsKy6sqLZCEwzCSbJDEqMKmQTRpTGnmYTOvG4HE3acBHpsPUolxkdWOGLC2/l550Vc4iyetH3OpexhYOluYtf2a2pTXVKnIyEYW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=otVNmYe2; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="otVNmYe2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48c4be28b82so780582f8f.2
        for <llvm@lists.linux.dev>; Wed, 14 Oct 2026 09:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791996164; cv=none;
        d=google.com; s=arc-20260327;
        b=Irn6GX02srnoWkDGsh+6UZLg+8fhSqwEKYjESW49P+ohPNYvwCOsDV/K0QOyyvbhYo
         GVQyTq6hAimBLvi3bX5e9S2MHvucCNMbpCp0IX617lfPXQjTD4PxTOjvfdZUu3kvY3W7
         Ur15dX/AVeawQ8e2nwt90xJa+D2jOqNbYHeF59WtJrIaZHDhHHR5H06to1AA3weRqPwH
         0Oh8QOPOK4AGIZZvgU7ZfNz4STpOnJKK6TOqu2F/0+/w/l3gvs+sPn7QCdv1MFA7/al5
         3tA8hcd5vGdr4JOlLlXRm1eU1FMZFEmHVfU8jLDhI215skx086eHguHLqzaHn61D7GrV
         mfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        fh=Xe9Hil6NZtS2Eoy0mZ/UKxgZG+ZzW0cwyIiORciDSQ0=;
        b=OgOoG4w5QOS1+ZUVh+Mj1tTZCl+AaM5udZiMtq3vVFbsbiJJY5URibhfEex1VgnwQ7
         NNfa2LScig+WnrUq2uAnKHBHEYax949DdPEwFwdRWs7Ol7HJmfSna4S4Y5h6IpYU4j6o
         xwcpryVMdPTZj8Aen3rLlI1ywXn622rI9acjmIb1ciyoWKBiRf/Jb2B8x90HbI7UK4sI
         vH0btMoA4OAtbCGXbsosO8sXrR8J5rsVUiqrxAUsFECMGBGqtIu6S3dMNXluL2tSw1ic
         xAQ6EKKqiRbOMBeyXEXB4/+cy3aTYmcSa1K00uh2jjiEvJqRZC9YgWZyqmG67QSQvlUq
         clGQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791996164; x=1792600964; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        b=otVNmYe2BrOjK0jKgqMhirGqDp+jrKUfcIValPtLMYXoqN62Qg2UvW1RhexKwNr1vS
         wa8rUJ4f6lN3i8KXkjuJfNEfsX8bjChPh9BD/94OTjqK/PIWXBwwgA9KSTxMZQeaUwZ+
         SQG6ryKK6DR22lzRk2sGBMGG3hTLzt9Fgl/e98WzFMAImyG+y2OscceZKP1ahEcXZLNJ
         b0kgtZVccCTHqg6jnMEmTZFpLVpJhNG2zMDv7EOpvxc+u/NQ078UW0aYIMeB10sbGl3a
         V5kQW9PcwUc4yaC9fGs4hTxu4GZKWYA8pHU3qcbMsvl/jByKCcAdnPJL4xqnNMy09ATl
         E9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996164; x=1792600964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v6p8wLsPj+VDCmBDPQwmg7rxehQ7WvfbYU3RH6s6NRw=;
        b=OYpHz0Hal2hC2Acvt6GgWrfN6T4ZLxQi8IP2BmoOnuCgEFz6GwMyT62+ruuVA0H/3Z
         HfraBy/netugt2H2sJZp5Ol3opQIsFDIPO9SIncyJIoyfymh0TLbwfdpqCGOZHBPLvxZ
         IK29RFOMclpqylMAv/CJ7puyVS+V4sKVmMozBm/1Ln9Gc834z7hscK4Z8zJx+FaiIsOO
         qINdjriFtHGx5FqczwafLDu/GR5vhxPOwSggeN1H0+5rH/LMPCi6n7kz6crKSVUpSXzS
         fMTv8hjIZe0f0KcEESgGpFKKAQMhPghP8UTV0Qg+zfBfX6jz5//fOS1NiMuwoiPGeGbR
         +3ag==
X-Forwarded-Encrypted: i=1; AKwUvBzwDdAOV9iN+XTi3lRdWSOzDK7XIrglP1mcUPwE2M/8PdUQpyplyZ7ctEb+2uM/trYdC2jV@lists.linux.dev
X-Gm-Message-State: AFq9FYIq8u0gpwkpoyYrQ7Qq5oLZwLBTiXYvWB38fQD9CK1jGHYVEn6o
	hq87eBkCkBHruBV0QfHWXR2O8JzfhC+MnX1e3Jf+d+iimdR5khPDDU5e1Xp9+lwMwijY4MfFK83
	5BPirtVjHPn325J+NTfcylqdzY1r2gnVuy1i4zaNL68s0wmgc6GHlsb6d4iA=
X-Gm-Gg: AYBFou1GxDWkohqBpiOJiNAHFxp2DZuIgOYQsZrtCqtBbFNZqX9ZIEVdGN72MD0H84g
	jhQWKApyU1RhfaEiZvHI+Ns0o+Tnke5j+zlZxjUNG9qbLguEcvrvUThzCVIhXXVZBQRciSebUKE
	3LMAaXFzXaHA8vcWKztFdmOToZ5LSJdNdc4kfwZKmQ7VYDQiGmmIDurHm7bUcgKmCEMEOQx1wDL
	wKCVmNkCLbsCpE/0/ZsvDlEV+EKcHDiZoKf5BPR0RKoYrslKPwqLyxndZJbBQoc/uota+R4x4zb
	nUYqZwDUxVmKiLPDBV0W7yhawp//4EdKglPl514/w9b8n93CDecFX7+nc65DhXDa8vJ7Unn+Vc+
	sFBZuv3mFKbGkywAAfbMuF1dZG2b5yrjOuy4R/hlY33LtRoMniLtqHT5e+mZkBwrPn9aYeYsM9d
	pSA+s9SG6dcc0o+twFqVZ4r3/HU9OLZCMRLFWyB6bF83GNVXOWfx6C
X-Received: by 2002:a05:600c:4e89:b0:4a1:96cd:2f64 with SMTP id
 5b1f17b1804b1-4a196cd312cmr283584205e9.1.1791996163311; Wed, 14 Oct 2026
 09:42:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013-kselftest-deps-llvm-v1-1-f2ee70ae1b79@kernel.org>
 <CAKwvOdmQkYy3xqTsumSxLdHpaXnt1Hb9g++DVmAYcx=cvjFBeg@mail.gmail.com> <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
In-Reply-To: <38d31a6b-b3d0-4b15-9b24-62d2bd6f9040@sirena.org.uk>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 14 Oct 2026 09:42:30 -0700
X-Gm-Features: AclHuK9Ord4aUgNPJNBcBx9FYXt-xGJSQPIiEoaEK27XDm7YBaJzhLkX1ABzBeU
Message-ID: <CAKwvOdnoZfE3bqNnRBTR4G805V4-iooe9YwS8ZO0ka2h9bgDQg@mail.gmail.com>
Subject: Re: [PATCH] selftests: kselftest_deps.sh: Support LLVM
To: Mark Brown <broonie@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Guillaume Tucker <guillaume.tucker@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:01=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 02:07:28PM -0700, Nick Desaulniers wrote:
> > On Tue, Oct 13, 2026 at 12:40=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > +       clang_target[riscv]=3Driscv64-linux-gnu
> > > +       clang_target[s390]=3Ds390x-linux-gnu
> > > +       clang_target[x86]=3Dx86_64-linux-gnu
>
> > ^ should this be either i386-linux-gnu or i686-linux-gnu, or does
> > `-m32` get set somewhere?
>
> Hrm, that'll just be a cut'n'paste from lib.mk which does not so far as

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/too=
ls/testing/selftests/lib.mk

> I can see set -m32 - it sets i386-linux-gnu for _i386.  Does that need a
> fix too, or am I missing something with how it works?

Ah, no looking at
commit 624c60f326c6 ("selftests: fix LLVM build for i386 and x86_64")

it looks like selftests have i386, x86, and x86_64 where x86 is x86_64
IIUC.  I see you also have a distinct i386 target.  My bad.

Acked-by: Nick Desaulniers <ndesaulniers@google.com>
--=20
Thanks,
~Nick Desaulniers
