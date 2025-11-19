Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFF52E7BCC
	for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 16:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571455; cv=none; b=TdBRaudq8bPN3/abcnLioCCuEHeGy27E2DZlSBxyA6hQvrFFd4b3BU4MsOv4mkMi0B9ddkDOygDrvtdRhaFBBSzd0AkjyAswxgOyLGGdZieKrx2soa+CCEseiZ6hjzVvotXxejeqb+/+l6UZj3K/12/GU8/kqz4ZPTzLjswcVz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571455; c=relaxed/simple;
	bh=3qbmBlDOhBqpexe2KgI2APMs04wdSfYxDR78bi2WaDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixQN/QVKK0REsrL0nga12jUROawPmsC5637qmm9TMzSNDL/p+RQZjeoh5fDphC+urJzx6m4Dm5NfkBttamfjkQW2egrtpjEcC+dCcnJeEbH4KmuIkhUoV1gSdOtnPtyxAwnINvJtPG49zTXdtaJuYxkVZvTyMCsBGq+IEesxeDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EtYaJXC9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EtYaJXC9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b737cd03d46so654232966b.0
        for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 08:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763571451; x=1764176251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e5xr7znsz2E58DjiH4TrOVRBZvkxR+ArNemRIj4DQcU=;
        b=EtYaJXC9yFhhaYkxkkxzhYseGzQIJjOT6BCHM9Ezu0EXytT9/b2KvIohPcuOjEAR5K
         C8og2839Ml2flusmI65PgfjlGHXKEJfzeA2k6cJ1bGQF+EbXEyIRmM2B63T9Q2PYFpwe
         dbA6hmuK3p7xy6A9F1l3agQSG6EuSmfa+pM2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763571451; x=1764176251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5xr7znsz2E58DjiH4TrOVRBZvkxR+ArNemRIj4DQcU=;
        b=ZQTSU0xtCd2EUvpkua5z7WaGgHjMNWNnAxYZJa3tF0mzoicaGYJofCss8Tyle/og6E
         O7/hJtmGjjSzlOcbLvc6R2Q6dlljPIv3GxVkKOAyHgpQHb4L6h17zVWzC321bCGc4YQt
         XH/obkJHoGS48QD30DzrfACSbtQ3yHxDvnR2D/uN6gheoSjXCpEULPhdjr3gRhjEhJ4n
         sgjhNiQPMAyHc5iUv4JjRMIvlmSrt9yXAkhZSmZl7hFP2yH964rOMZGPFXUzfx+m/Of4
         tJZ+ujSv83FeBqSxIcGQ3sJtsBt9vgVxuYYFV2RCv6zNnLVDWXNmHHFkPlwUs3y+ygB4
         wSkw==
X-Forwarded-Encrypted: i=1; AJvYcCWEUArOm3GOGjNMSBGD2HM0sQyIvQwPNO7Ot9v76ZQM6zvEcnZ7Qt8xFF+1CnPr2ramOL5K@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7yAV3mdYtvBsnoveNY2N5SqOx3QesU4Tox9XM0AkQyD4JgphI
	SnpEVp7iN8OW10UTBtoM6iGjpSMWWal0t41emAIuxVyOs92xXuK3grtX2oR/Ej19DvP/T5ZZF5u
	bjqA1Tp6vBg==
X-Gm-Gg: ASbGncsehde9PjGg8wGgYOl1RVMYHjUSQol22VeMy/pYf+0fotVW53Yqn0PZayqpHyW
	0iy9AbWOcDBRu4r/1IL4FyhuXIROlBSafvLvRQ8AawyUJWcEv4aU9BVupXhPoSg00c5NpM1YwIu
	vA5brQiB/PjANeWQlNK+jkKODy5YSK+/DZ1tBJASNt5abZmLc3k+MMOzLc2spLDFqotMfPssVlv
	CUmnuk44LXybq5PU5LxbAE/c85VSBn1xBhdmTLSmZL110n6uah/Com9wScm+uvEUGua6gwyNT8z
	+7zt4Qg5WB+98RNUT+GWt1ny7WJMlJ8eFIidyjNa0hu0rbKXMYi6vuv2nUG8e/c2ka7haFycddK
	uYjK1XTP+fKdO1d6LFfy0S9qasIiZXOIzQl33SLiRdPwmqQggKmIA5qfDg8j64ypqlRzM6YPMf+
	io8jhMOP4uU1XVBYORBChnAUSvqg5VsCtkXzD2HbAHd127NuCZnQaAr/MLuXGCGbNzK9zeTNs=
X-Google-Smtp-Source: AGHT+IFXdk0h0wLKvJICsC4PwDHqFWmhHx8uWHlNaCJYaur01aDEBFrk26CJ0/U5eko5tKdMh+VhAg==
X-Received: by 2002:a17:906:6a10:b0:b73:8bd4:8fb with SMTP id a640c23a62f3a-b738bd40df4mr1674516966b.42.1763571451388;
        Wed, 19 Nov 2025 08:57:31 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73a5d77a03sm765204266b.63.2025.11.19.08.57.30
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:57:30 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b73669bdcd2so984931766b.2
        for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 08:57:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU+5QFtxI98/aam1loU/j1qdoEbxsKh5OC8ZGlAVjUi9VrnFwH8YvvBxceJkEpKBBlAU25e@lists.linux.dev
X-Received: by 2002:a17:906:478d:b0:b71:9c99:7b8a with SMTP id
 a640c23a62f3a-b7367bc6b95mr1993595766b.49.1763571449725; Wed, 19 Nov 2025
 08:57:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118170240.689299-2-Jason@zx2c4.com> <202511192000.TLYrcg0Z-lkp@intel.com>
 <CAHk-=wj9+OtEku8u9vfEUzMe5LMN-j5VjkDoo-KyKrcjN0oxrA@mail.gmail.com> <CAHmME9pvgyot-PJDbWu1saYagEYutddc_B9qNHf-MZ-vkw4zoQ@mail.gmail.com>
In-Reply-To: <CAHmME9pvgyot-PJDbWu1saYagEYutddc_B9qNHf-MZ-vkw4zoQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Nov 2025 08:57:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=whjG-B517DxHm5rSE0S76n+fHMdnJdqFg9VTvx6-HgGRA@mail.gmail.com>
X-Gm-Features: AWmQ_bkxxp7Yy44j171fiA9Z2Xle-tZAZS12NBySFcI47avzcJvVuC9gPT3eA3A
Message-ID: <CAHk-=whjG-B517DxHm5rSE0S76n+fHMdnJdqFg9VTvx6-HgGRA@mail.gmail.com>
Subject: Re: [PATCH libcrypto 2/2] crypto: chacha20poly1305: statically check
 fixed array lengths
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: kernel test robot <lkp@intel.com>, Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Nov 2025 at 08:47, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > Hmm. Is this a compiler bug?
>
> It's not. It's a 0day test bot bug! My original patch had in it some
> commentary about what a bug would look like when it's caught by the
> compiler. In order to provoke that compiler output, I mentioned in the
> commit message that this diff will produce such and such result:

Lol, ok.

I sometimes actively just whitespace-damage my "what about this"
patches to make sure people don't just blindly apply them without
thinking about them and actually look at them.

Maybe that's a good policy in general, so that the bots don't do the same ;)

            Linus
