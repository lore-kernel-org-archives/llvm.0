Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A5E24DCF6
	for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 16:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776097339; cv=pass; b=M7bL/cKM8yS7D7hMODF1nnnUbXkl/lCs9RdczXiybRFoeRlL13kk7O5EEzAB5xgUTgG6lgI6DizecwKSNxiUbXe0bZdmDgYYQWmsA2WnFGB+049yFFJ2aB1vY2hyB/gLP3+MJ+2NFFEeO/IZtDE0LeLxJ8OTMqw3XB+B+7Clv3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776097339; c=relaxed/simple;
	bh=S7l7CrCVrefRmX7UdO+DzmRqyGzFOenAMc8q1cZJtW8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mRgi0jYMhVGGetbCNb9qMf0UApsj34rI1X3gzsXEVTde//pRhAg0w46Tn7V669EGKN+vL/TPkMmZZ2Za8j9+RkSFWcziyFgM88YRS0DEj9sMvgYr3NiyzRkBtD1j15KIrnS8r4jvmoiG7wRed0PDHsHyYxguql2kteM6JFZ9r4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7CVGdv/; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7CVGdv/"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a2c508002eso100226e87.1
        for <llvm@lists.linux.dev>; Mon, 13 Apr 2026 09:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776097337; cv=none;
        d=google.com; s=arc-20240605;
        b=Fpd7DUEXuxSg8lPICbOmyzfE/wh33wvME5ettM9cM4HVy4BvBeWWJxz1fJmOGaB6QL
         RXRfRVnzcClWMwLuot7i3dELk3BUNkrjUHJ+7ClNO/Pezlz+ALL6c93kxRM141fPUokL
         3ZMwMQmSlkWJcbK+lAhetVXUBTEexiQNnfU7gneyc9J1iYONX6mzFJin7mIqAiEbpCnj
         KWuiQZBMY6iqQfpi++JQ71yPfG+x0z35sg8ihKe4mbI4GaB3RfYCvlaQ10ZUTHlVk4IJ
         Ew8HjdIa5Rq+uOr0JkzavOisGifqH0/8qH7WuXIPkQrvQk6I6glizO0mgkBTFt8IuTmi
         b5hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S7l7CrCVrefRmX7UdO+DzmRqyGzFOenAMc8q1cZJtW8=;
        fh=10WVIEVvim36pbqYUy3q7U2kbYUcFasJHOCQQapAnlA=;
        b=AfMf0+9qBaTkMgByVSnfcFDNSvhQnLmi5TGYDvikcqoXzKrmJ1YR+dRyJYE7SOFOzu
         ojeLALFcD1wnyJywGkJ29CUREzDbTRq/RfJ6wOuTxoMvBTziF4eWlbUEaIuupFtfBD9R
         tII7XZ4+gBQVxfsU1KTcvqcMD88D9VbL+Rs9/Z2XMnL/2vZLujV+cjuKAXjyq7jEgSmk
         A0S3vm3WO3Our3TRyTHuu3Dsmcm6Fppvk84kl7KUU45dFMbLF/+vpPhxelBnYin1JPp7
         7eGLBPQTqUMJ20azzWQarBM/RpU7mrSu0em34LvgqUGHipK2VzoXsVlhu8SMWUVXjCNY
         /bvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776097337; x=1776702137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7l7CrCVrefRmX7UdO+DzmRqyGzFOenAMc8q1cZJtW8=;
        b=f7CVGdv/IIu8F/WS33RfhcCP67ZC0ijg3c5rrv7zOxONcc5+/140Y3Uss+PmPX4vvs
         de4YyOBVbZ8vqLRnFa0mczlJIVooohL7IVlB6Q4/Vy5W5UdmUrbU13HOEUvAWL6C5IFM
         AjjGpq8oyF8G2Us/MV8alZpTLQNNl95rlnIMb9iK7Ux+BSn3spChtuhBm1263hyL56a1
         +NRZxY/0LUbFX5Mn2jdJeJKh59vl92ruxpSX0j2Th+HlH35jCWXKs+o7zecymYr1Ck8B
         rpKEY43ke6tAp3nCsjclG5s3guLn/N2rDbph/2ph9WqsvZCuDghtih8PKdbqPztUA9pI
         qM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776097337; x=1776702137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S7l7CrCVrefRmX7UdO+DzmRqyGzFOenAMc8q1cZJtW8=;
        b=CvYasCsdH6TBToqEXIcLK5Alm/yjS0VFCp0T1YC0olQDbUT1C2Yu312kYQkIZhkZg2
         cHo7gny7mKnG0LVT0u0HdcrFJQxjnoFkZ4wLAqZPMQkjOc/HdBX52ei2N2nL9+NLLWRU
         xo0Q4zFutOKPMF85QUpqpZRudsy/C6vGx0E+C9nM0sDrZ9BGVAg8nxnSYb1/XDo8tEps
         J5f8f+TI8o2xi8ZhUbaXu7qK5VAEN3x3WrmOU4qOM51gRQoeNll4KKks63FxgPjeya3q
         si4DGw4D/ygpAKIN9DcRWmZ6YM1SB46a0E0LUsEDHM5R6ZP2N9bsCsB+xiogUGqQc6uz
         cL8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8kvktSgvRBlxeduyyOVE/4ZCbF6IWRjg1H+/p4ht2m46OBy4awOoYmc0JGH2Howd2UKBAW@lists.linux.dev
X-Gm-Message-State: AOJu0YzOsa6H1/1dsPddAIFdT/EaAoOuVZqvBL/tEwwdqwldMy4R5z8c
	FWJ/quTX0Q80QBLXlSx4+0gnzM2dLDMoK/bKe2VWAwkXi0munf0F1qjRrjewBoViqSM0Hr00Cx3
	rjuPO2L7XXB/BXercs/KprFYdyCCpBGA=
X-Gm-Gg: AeBDietj4p3aWOE07xIQnz7q5BhjpaEveTx3Sh1ZwTm0m3IDRfEv1OQr5o83kxEeolC
	n2QrfLhWeLE720zXrV3B3KAmQHq6ABTzCGKq4POyWPxCd56zW4v8eHyVjpSlRc/Z4xxtWt79CS5
	SSuHerGBVnPVpnD6Cq9HM+bu/EezCxVKB4q4/qlWMBbYGMh1rnK+FCdCHhRgA/kk2IzmwoWC5fa
	PhSR6Sk8MzfJcB5YHjiT0HeIB+p6qMWKlWvRY4+T42GwMjJzxqounOnYEGrioe97N3b2k7bB6EE
	LiCBrZR20kf2CVruKpPwCtu9DSTCtfJTZ1B0t43p5LnlXTsufSngDp6UqjoFtJWSY5sOf3YdzMl
	TEcL4jx4p2ZF6xFsdsX91BLg=
X-Received: by 2002:a05:6512:3d8a:b0:5a2:b881:3289 with SMTP id
 2adb3069b0e04-5a3efb7bb0fmr2115807e87.5.1776097336232; Mon, 13 Apr 2026
 09:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260407165551.3075684-1-irogers@google.com>
In-Reply-To: <20260407165551.3075684-1-irogers@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Apr 2026 18:21:59 +0200
X-Gm-Features: AQROBzBqkwVHzhUQSq9HioWXKF47jyxOzKHJGMNoqNxhs46vvHgWN9LSHAOsGRs
Message-ID: <CANiq72=6_FRZbB7qLhfRM-X5nBAHPBsw4H9=O2omEnO5pQ4VNg@mail.gmail.com>
Subject: Re: [PATCH v1] tools clang-format: Add a tools clang-format that
 overrides some kernel behaviors
To: Ian Rogers <irogers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 6:56=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> +BasedOnStyle: InheritParentConfig

I hope we see more of this (i.e. inheriting) elsewhere, since I think
it can help adoption :)

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
