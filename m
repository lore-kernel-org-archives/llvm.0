Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5491AAA5
	for <llvm@lists.linux.dev>; Thu,  4 Jul 2024 03:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720062724; cv=none; b=XRAc4mGKAc8W+xy07fH79Tf7ljAJqxeRt3afAdlggHSwct2bVL0kkWjwzKAMcdvu1VKLTZTvhLOJn9eRhEITUKdIINOglHaniV0MukdcHR8UXxjkZ/Kj8V3Ylfzt/C84BDfq47/davegJOSESXVf4aS2eaw1WUe8ElfqINFiF2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720062724; c=relaxed/simple;
	bh=/UiwJ7vry61dcxTQxjF50Ei9WLGwz7HSh/uxSqg+XYw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g7AsXzUAsVHOXNG899TLn+mFORQRZLZ6IQloYI31eUwvZz13hU1BHG+TJVII/UoMEoEdWVDqgDtzso1m4hM4kA3BmlzAiRUmuIk5jqPwQVe+f8KKikj4V7ks0CT9SiDFWcNvjfUDmBdeoGnGutJ63xNwDpLwN66W9GFl25f+lvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dy451EjU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dy451EjU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4255f915611so39095e9.0
        for <llvm@lists.linux.dev>; Wed, 03 Jul 2024 20:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720062721; x=1720667521; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hnV4ceST/LkaHatjT0/UaxHlRuB0JU9sQidd8Wmj6I=;
        b=dy451EjU3rNZyAYja8LxP9vF3xsDC35VUAkqUgbBMkyOA/LN2jDsqPW4TSYEKFaFlL
         TPbz7lAo7vbMULB+OTIYy/fAIwAjq28wagRk8SUWVndbmFwk+W7XFaMf1eOJh1sZOoBM
         V5q0aneRzg49kQXEoHa6fWgegixqUMyyMe1mkU/bAad9X7hSuEh+lcV5iMDo3t6ppP5n
         bKG6Xg9WRrZhluIzeYqQhIuFUTvBQaerFFAwMOH0TD9WOCTf3Z9b+6pUZw6kyxOuhaMb
         kQzu2cihyF/SUtQ/fxqUEnDkfA1opDdfP4pB1hhz3JOrO65+9YZtqsh6XnRNQExTWpii
         2QmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720062721; x=1720667521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hnV4ceST/LkaHatjT0/UaxHlRuB0JU9sQidd8Wmj6I=;
        b=h2mrqH3ZxTmXi2QyE0Gj2LPPtcGWzlO5PxlICFfhilU6e5nAqppZ1UdV7nWHbcjghD
         T6xvVbVo7fKzoNpX3zlvqP2qhznFg7spEKDXtvRh2vJ2jUgnfbtlG/0O4R2uhEULGMr3
         0fifEnQXzBlZSm7U+pvzsqlLM5qDCDaoJABQNl9Pjk0v8DVeVFBAbMtlLCfC7fqRjlpY
         PSt7z4fCeOqsQNOWgAnUiMzCTQQIbV+Q77DKnUraMXiPcokKcmHQ8QFSrIDrn3emI76t
         jY99nj2QjcI3kU5/BEZfruh1kre8PF8vFJILo1AIXRRNINmteKhI6dDf7oStXrTBztki
         txLw==
X-Forwarded-Encrypted: i=1; AJvYcCXup5+XjyUeKo9RI1MpHay/I7JptXBEHakd/Ikczxe3BKtQWYmUCrZsSdTkjigUaP+sAq4v/XJlmlIPQEyMGwC11GPwcA==
X-Gm-Message-State: AOJu0YxuBL382PoUzy421XRDZFfe8vv8ywaAZZ2hRQv+8veCfV4SAC31
	0desIn4iAYF21uT1zMFKs1Dgqd2ufhvLquYPq94deQ3t6x0AfPRGJ4vTQjImOQW2Oz8x0ie+rtS
	MmwzyIPcH+6h67TR33ffXedjfSjz6SUUfRhs=
X-Google-Smtp-Source: AGHT+IEuX2Qz/ogfT5gJgXQfb0LHWMxBUBN7AnqQd97K/HY1a2IRM5fhYc2R9zomHzZzKODquS0fRmSqFZrrC30XS4c=
X-Received: by 2002:a05:600c:45c8:b0:422:ff8d:5d25 with SMTP id
 5b1f17b1804b1-42649a552b0mr614825e9.5.1720062720857; Wed, 03 Jul 2024
 20:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240704024202.84726-1-jhubbard@nvidia.com>
In-Reply-To: <20240704024202.84726-1-jhubbard@nvidia.com>
From: John Stultz <jstultz@google.com>
Date: Wed, 3 Jul 2024 20:11:49 -0700
Message-ID: <CANDhNCpEvPL+b1mve-YJp4+yzQU-BAaAQLr1-G6Br7i83zaQaw@mail.gmail.com>
Subject: Re: [PATCH v3] selftests/timers: remove unused irqcount variable
To: John Hubbard <jhubbard@nvidia.com>
Cc: Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Stephen Boyd <sboyd@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kselftest@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 3, 2024 at 7:42=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> w=
rote:
>
> When building with clang, via:
>
>     make LLVM=3D1 -C tools/testing/selftest
>
> ...clang warns about an unused irqcount variable. clang is correct: the
> variable is incremented and then ignored.
>
> Fix this by deleting the irqcount variable.
>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Acked-by: John Stultz <jstultz@google.com>
