Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E6D2505B3
	for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 15:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739287991; cv=none; b=fBCG2AxSY+mCaP5CGsYNz96N9bK0tM8ozmrUkMxJiF/FOi9xtM835pyiYC2qxnvA5M+XyvlQXcVhwtwsRtTmyT+NALHo6BE/RlPm/InZmmizyVNj09/7b6VGyfwOdTzh2LtzJ0JPmk6d1fTgjudhCNGY+JqZlyVfiJrUHKCuNp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739287991; c=relaxed/simple;
	bh=YNGkFnlzlwRtOdRnAVLsZY3LGyByKbmeHBrMNsgvNSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b8hXMRXQtprYQg8mmf2sJghtww7C1YS17plmlj8gmc3FTD2CKHStTM66l4bdjXQVM5fBqMqn8k4X/0yUWXsi9ZfyT7GCyF8dqvfxnV8FEyz2BPFnPxTiFnSo/tLuJydAirQeL/2iHrVCLIipOoyLvFl5PJOTp5DAquFNf4ndjLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haDDgoyK; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haDDgoyK"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-308dfea77e4so35867881fa.1
        for <llvm@lists.linux.dev>; Tue, 11 Feb 2025 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739287988; x=1739892788; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNGkFnlzlwRtOdRnAVLsZY3LGyByKbmeHBrMNsgvNSM=;
        b=haDDgoyK55A9+jt40Z2iiI3IXHj2Ifbh+WgQryXuGsysapHdYrtQc8U9g0rrdZZKyh
         0J5CEU/WRV6HiLb5Lu6Dmd0iBvXxH+UCgfniK3nPKn01lQtZWTH2nddBlsET6H8WS03U
         TPc3GdhYVY72rxyfGIAU1flXUhrB2q7pVL5MVVEXAXT/2Ze49Qj/jitnZtqx1UxBgK3h
         u/eUCZrfRQW/q1UQmE/TrP6gAnACCo9pU9ohNQpKm4LcQwY8oNQq7l6uElFoJSEqLtuP
         QMUv8ofhzABnpeJOWwSGX3Ce8An9pdfaNFM/vHTLJRKkB7UR8iTK/OQf23RD8BcOz08T
         HvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739287988; x=1739892788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNGkFnlzlwRtOdRnAVLsZY3LGyByKbmeHBrMNsgvNSM=;
        b=qLI9V5thWOhs8eCplYQrtgWv6SHJTIhk07Sn/78vkVonJiY5Be3ogAwX+D20P+vpdL
         dLHXfYbWK/mFMH7MiMTpLJG07gMYyJoYJ2iUNaSYQ+T0BDD/mxZb6yIKZKUlQSJp1f/V
         Jj9gi16Y8qKqYSOuv5QZ5pMwPdY95EVvsS+PwxSHbdb75f7Ih0X6P320S+3Cil6BhlRo
         Ji90USisd3JO6GrKVYDw1gDaR3Ex/Hw1rdZ/g8x1/Zkl0lfz0fY4y1FhtBgzA+/U15cQ
         0OmS/OtfqrLeqy4nWGETDrLb2kZSsfr7Apy5b4dvjBHjtrC8+YVJ8jy0Ds6wHn3mUr7J
         VueA==
X-Forwarded-Encrypted: i=1; AJvYcCXnmCa8t+cz2QgmV5VHacDxtbAZga3bBybNfLybNM6VemRiH6iTrQD6yqKI2L+6ymyvnyvR@lists.linux.dev
X-Gm-Message-State: AOJu0YwK+hNEYffiQsuIAv8EGKZ24vB6aZxKRfzX2AlEzzs0q9nynR1P
	4TCu5WPLHayVUgeytqlJNudrT4Hw+iW9DNiNm67xPN8W1Zvwga5LTM7+EuASu32rTEKzxFstq39
	Z7WovCWQbLK31W0YrmmJr7nMk0p8=
X-Gm-Gg: ASbGnct8wWTf7PiB5oBtcfwmp3zR+qIMWVYwBSZMCKepgdsUHUqHvoz/ZUf82IZx1Qk
	FibAHHCaukRoJv9r8qgAUvoDCzGkMFDHTFdzLkbc1DUEmcU3a++UJkhqjrZeTdPnjLJ1S79N0vr
	FGND3cHVXJddHH
X-Google-Smtp-Source: AGHT+IEJIadN2vcB3Csnlfq1Mk6E54+R37oXLjSd4XLWNMgXv60YKkYbgT6YQjGh9tMenLxjvbqCI+Hb1rXcI8wrbGM=
X-Received: by 2002:a2e:a80e:0:b0:308:eabd:297b with SMTP id
 38308e7fff4ca-308f910bd38mr13409571fa.4.1739287988170; Tue, 11 Feb 2025
 07:33:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250207-blackholedev-kunit-convert-v1-1-8ef0dc1ff881@gmail.com> <20250211144744.GA1615191@kernel.org>
In-Reply-To: <20250211144744.GA1615191@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 11 Feb 2025 10:32:31 -0500
X-Gm-Features: AWEUYZkWF6fllMbg1VhwNw-lz_6L-I85jBsAu5kQqPz4yDcgkWQy-hEBswDaQoU
Message-ID: <CAJ-ks9mpqHc_m1VCiBkjgONjJGUVJRWqKUQziA1STfOvUFTqjQ@mail.gmail.com>
Subject: Re: [PATCH] blackhole_dev: convert self-test to KUnit
To: Simon Horman <horms@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 9:47=E2=80=AFAM Simon Horman <horms@kernel.org> wro=
te:
>
> On Fri, Feb 07, 2025 at 06:38:41PM -0500, Tamir Duberstein wrote:
> > Convert this very simple smoke test to a KUnit test.
>
> Hi Tamir,
>
> I think some text explaining why this change is being made is
> warranted here.

Hi Simon, I think that would be stating KUnit's raison d'etre? I
followed Kees' lead as seen in
https://lore.kernel.org/all/20240612195921.2685842-2-kees@kernel.org/.

In this case we saw the benefit right away: kernel test robot
immediately spotted and reported a bug which I fixed in v2:
https://lore.kernel.org/all/20250208-blackholedev-kunit-convert-v2-1-182db9=
bd56ec@gmail.com/.
Weirdly this message is absent from lore, but should be in your inbox
(and my reply to it *is* present on lore).

> >
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> > I tested this using:
> >
> > $ tools/testing/kunit/kunit.py run --arch arm64 --make_options LLVM=3D1=
 --kconfig_add CONFIG_NET=3Dy blackholedev
>
> ...
