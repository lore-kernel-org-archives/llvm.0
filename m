Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCC33E3C41
	for <llvm@lists.linux.dev>; Wed, 27 May 2026 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779872044; cv=pass; b=ZLUs01SQn6FIS1uCeNWJQjjmZOWAMB/4wOKQuwxUj3nrYrUciGh8OU6aUBOAA93nAppqu59D8Wnub/3sGmuU2kPK/zcoHWFEYeRAczB86qLxOBYyiXp3Nutp35Z6rAGn8p73ZCYHjNye7PQWVwosh7eIBfISlI/ZTZYoVUnZTAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779872044; c=relaxed/simple;
	bh=5kQqVgy93vtmWq/iqHHy5XJl4YOKgZ0WOXtnpQSKI20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alwTObUoCbwMMsFhXCDMPheA8+qMyeXHOHUB+0gP1oqP7jwff2+iSUaNMvmgGpDPEzNHE02v6bR3FnJviXD89Mi4tBPJwoKFvY//J/tjBT1HedYXbeBX7NPvU9u7qBJPrkT/4oRfObW6agykPw7roh78SL5zjT0x4083bMHdqVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoXAg4pG; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoXAg4pG"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30436e8f582so651530eec.3
        for <llvm@lists.linux.dev>; Wed, 27 May 2026 01:54:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779872041; cv=none;
        d=google.com; s=arc-20240605;
        b=K7QxI6T/rtlX4Ro/UsaD48LjyG7JMg1sF6VrFxeE54yRxRfk6gsRISmAPVZcFaiOKG
         ehfwww5X0BgFpZ3TzujiCmrO+u+FPWvIx8rurZhVVdgsQhDzr4GVCUdHeS1Ed5EYm0Se
         ygCv1OpL9wUiHiAKSUHTh+ZLS3i8RIeskEyoavD1JNmDzXKhS2z3fuyVLbnjDr4RvMJS
         T6bbpbrOT7lXhtouvEKbSfAfQXRNCZ280Sp9n1DKy6g+aXDSckHqnifZY0Y1msI+vS3n
         RXXUYAKhgUy1xsKxn2LvveuT80BztBfFyEcIGU7nbYxGabYvqgNHL2g4tuF1fk/wHZfA
         MAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KTtdTbKyDzrJWvdQmNFiYIjMxA9o3eokdgv/V7n0//c=;
        fh=fvHCacvO/mdW1wMiYGeUz3rP1c19KYh1mgU0QNfS39c=;
        b=E3DgbV1F6jPs8EsZqJj5Dahp5nVSjrf5+eylPKdSfphdGxm4Y8h+J1buXpUYorWbEN
         jhT22LVRvZhkOuzPY7+z9MyB3hRmFw6kmKvaTxeiYOEupif2wMD3uVlHlNz91OcG9P2e
         WDvRw3t1nkV0UxyosFZIUT96DM3gy+CEUYQ5ggF1YSG5k85eScaEdTn7b3R0EgxQi5FX
         6WkmLsmzvwmlHmYgdGHJhyGgx9/lM1BX+9acia/MqmW8G37m8TZUQ++OFwJPXtowjCbE
         NCNG/chcj4qT3FyoTLd5JT3pcQjBoK1HFeQGG5hQnlgGZsK+60S3HlGaI/B2LSnjPmRw
         00lQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779872041; x=1780476841; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTtdTbKyDzrJWvdQmNFiYIjMxA9o3eokdgv/V7n0//c=;
        b=WoXAg4pGgv2qBY5n7p+eIRWCaXRxmCz1H7iCfEBVHknfIoMw5NLeHDhJR4OlUW8eMH
         90Lpyb0K6pBtmJCr8hdhQwiQGj6N++yfYXPTIqN2M9Tikh3ykspfFKCz2QD5yaHSH+x2
         NcX3VQBuwv6+yr4bWpWOZU3EQ7SF9qA9n3Lh0iQhQ8PW77tkraxPoWeE2wOpkD6aErXC
         uzL+YriGoFKUclKCd0EOMLGWuVyZ2ZOpzBPBKLI6N2l+ogOrH2V2Fa0zjzkLdxt0thHK
         Deu8JNVVWoOSFj8wOTlbUdJxGpOgUXH+oE56kzuf13g1Nl1WXKDzgJ9GFTcwHvT0szAM
         1akw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779872041; x=1780476841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KTtdTbKyDzrJWvdQmNFiYIjMxA9o3eokdgv/V7n0//c=;
        b=sXpNFfAUi33fEh9JRI+qgmFRLnOOgoPxldzuEZIDvY14UFWofdzq6dm2Huts+DBfhW
         LB3/xlZJVEXL954eWtN+TOQ6H4of2mRGtMbAYUHOGpudIu2tLY8GsK1TrP4xWgOyVW1e
         KY1p5Q5BNjTU2KPIlNPyr60m7ysMvUTjAj33gEY6/Dpid2hCI/2TLRUIjulpK4+pfRu3
         GUmZKqbUoyvM2Gg8Rsd9w3DDXZRtro3HOY4tf+mo25VT9945bZyaDwwU2kYvYaR73j0i
         uKVfuYjrYE3lswCtyLquwZghmLasbmFMq/avTf0y9ICfxUUdqycFfnb0a+YFcjlttGVV
         9fpw==
X-Forwarded-Encrypted: i=1; AFNElJ/aD9nfFQxZ5WqWTrfrPzefworE4R1X6l79SlDSX45BGxTdXYcUjRqch83vOPyjfmUq5Ixg@lists.linux.dev
X-Gm-Message-State: AOJu0YwBNYPDaym3neRkBwXVA+3CXaaQXQuotfjYoGg2AJglpB0uSVvW
	TKw0s7ywZdfSLYzyM6wxAIfeFoqseLveiV/fgVv562Mau09fuQFklanOB0veMWVQhDXe8h2sKVJ
	WshLmSLjZDFhZ6E0V1EKSnzziVUGx0XE=
X-Gm-Gg: Acq92OHRxh+Dat1QHPJQmCVtQlhoBS60imVKGG7FxuQuohUmyoQDx6CfVOo9JWnVLjl
	+vvZzYXx26sk2Py0wfQKqY91AC71ME5taPuZUJcX14WXdgEsRhp7+tcjctD87b5tfkfC0eB9BJS
	5mI+sxqKq9nUtamgXEE18ARIxm9GUYxpPJieL6lCXn5F5A7rQyXvq8dc1YnCvf/7owZyhuvRPM9
	pbACUybm0JCIXssiHh0HSDsU3gfcTsjfz+jULMjfh7DTSp8IE2doX/wqYUxx5qTUzGH5/xQP5Gh
	loysPCljEqMZ7vYVzrARTfGvXoCgA6ZfVuM8ufnjeTT62f75zTdcWagBCIU6X55iRBj2Ixnta75
	rGqzYiun/i5NvG62OG/EBFU6E/tsNEcAxqQ==
X-Received: by 2002:a05:7300:27a1:b0:304:8860:74d6 with SMTP id
 5a478bee46e88-304886076aamr1840509eec.1.1779872041455; Wed, 27 May 2026
 01:54:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
In-Reply-To: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 10:53:48 +0200
X-Gm-Features: AVHnY4KWow-yXcwxHqbER2pSQEuTDAe0LrH93MgzWao3M9DArcKY015HW7Z1bkY
Message-ID: <CANiq72=Ar5gOb4Gj+f3AiNh15tVpYBzRc7K+3DW1NS7pnxLipA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: add support for Software Tag-Based KASAN
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 8, 2026 at 10:32=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
>       rust: kasan: KASAN+RUST requires clang
>       rust: kasan: add support for Software Tag-Based KASAN

Applied to `rust-next` -- thanks everyone!

If KASAN/Kbuild doesn't want that I take it, then please let me know,
happy to drop them, in which case:

  Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, I will keep them -- Acked-by's appreciated, of course!

Cheers,
Miguel
