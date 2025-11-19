Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70178364EBF
	for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763569400; cv=none; b=uut/QCmLp3L0ldaJPG8QmMmHfSDoL67jY9Go43Y+yELioJ9x54hOhRNgGINzbE8gUboFxmLeXCvxORProb04hBegOFy2JUIfkTftdopBx/3TkgvTYhGAYoaM3sCt5Wnu9Z9kxVoWWkr6n1U9RLiTyGBA4Lq1lSDz4Ao+x9VYQW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763569400; c=relaxed/simple;
	bh=UKD3Ih/vdXts1YAdrLZqIWg/yDwIkFf0XJQHTJ83sEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ex6+elQ24pi+rO6lZuI7Pc3KQ3+/nr2832ZR5O/W8FPaUeRQqFlXpGRA3+eVX9bljZnNyoJPKdcKfWmpIaZx/eeBcawqDVwnmJkEJwodpRdNIfGCDwOcmufTjEUn32G/zOJn9S1hpEK775HkAlmVf4+FSRdBa90CwXCr0rxu4gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hsU7dpaF; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hsU7dpaF"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63c489f1e6cso1768633a12.1
        for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 08:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763569396; x=1764174196; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2SE94M0Eu3i3U+0dCVoKdz4qQM+FPRKFn1N8b2gaTM=;
        b=hsU7dpaFI6kXm9JwLq48xRXLnTYIH+dj2Ayxz+hPej+h4KqvQY2msBnQPIlvuWd7aP
         vb75ugPllnMHI5UCzx01m6IB2FzhZSjpozB7boxTdu3+S+vOqvJranmpcGiNN+tZzW9i
         x5Wt0qeq5f15JUj2jTz6ZxXzQg1/4O0paJf+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569396; x=1764174196;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y2SE94M0Eu3i3U+0dCVoKdz4qQM+FPRKFn1N8b2gaTM=;
        b=OvvN11Iaq+2AaZym62pvulYQqMslvmrOwILfliec+APyHJEIi1VbXNQyMnifBbV3bB
         +swR1GTxaIhNiaHrkXGM/gwaJqTKrAtr5NXCsvWsEX6ljINkIE5601rJLxPpKOlnOnk5
         PzmFsY+oWqf6HNf+926rVaYg/Kof1Qm1+QmWVE8+LXtslIL+oZA7J3eAgcS8ipNyAYXl
         rU0jQAY3/MUMbMCBzCOzAuocPB/InJlYLkRCqBgrgU604M19PKSY7JdF5aUHwiNZ0DPO
         FiW8+k94a7eOtWMu+dND/8+usESmNbNUyseCDmy+k7cwAop6pjKP/4AYGm456cwzHZA/
         XP8w==
X-Forwarded-Encrypted: i=1; AJvYcCWQb0I6wmr+j9Xxn4mOVns6Ht5gD8tn91omuiqDy7Bld4GYWHQmSZux3V7eMVmZ+P3YRWhL@lists.linux.dev
X-Gm-Message-State: AOJu0YxeaAKlC9kwzmpOh6ktNDNWIx5rbHF9zqON1NlaLq8g1im81+KJ
	9JlynaqGyWcruEwqANTdKYtRwt84E3BKsjwP0vgzhLW+UBpARV37gbVEiUC+tQ/L+KHl/Ixy2Gy
	6yFAD8Zk=
X-Gm-Gg: ASbGncs5A5QkDhfPi0lp+txq4WvJ38eZgQ9ifj6L075oQwqWW01foUHX2A9l1f1i4f+
	dbRzY27rzi7GiLuDg4u9dEDQZ8tvtdlghumyrhuOADa6oV62q7RERYBtzHn/Lj0qHWfHA4Iz/Gh
	I4G9HYHinlv1LiNG12/fKnfJsFQWEhLl2ct5Z9dgk1Wy1rhbcPFIbnfwhjTW6igIglhdLuaBLzm
	RdAAX+pI5dVAn2whxi7dDiNkIdIMjc3helfkg0ftd1c/S0ZY5onG+6QAHVET3BnOdEA1XOXvA6v
	FUib2/eRagDsxc8LxRAO99yMZcN3mwLkvl9/9CyzJubUzeB8PgW1EGSHSkDpWoVHCyKB1TxwFbt
	/s9qbA8xx6P/lE0y+h/E2NSTzDakUQ87SEeFbfNbh1bo5gm1cUeVHYBBv5ApoxYhiiOO/7oQ8a6
	1JErCBr3vyh+vUcmfZSlCjcK3cuyj907SklyLKTot1ltXfDCyMKGEBBJsrUzcH
X-Google-Smtp-Source: AGHT+IG+r1wzW03KvQbMpOS35BWLuF0EqMBAnJTWrXXNGmzTUsU5GA8VyvxS6LI1xjduE6RLmOmKkw==
X-Received: by 2002:a05:6402:b36:b0:641:88ff:10ad with SMTP id 4fb4d7f45d1cf-6451ee6e083mr2289258a12.14.1763569396353;
        Wed, 19 Nov 2025 08:23:16 -0800 (PST)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1fadsm16793760a12.31.2025.11.19.08.23.13
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 08:23:13 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b727f452fffso184713866b.1
        for <llvm@lists.linux.dev>; Wed, 19 Nov 2025 08:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvuqzEgv7KSkNHfziX6+M7ck2LBk8JGkbNUpu9ZBie4/Cbeyf1UZ1ndFq1HzZ7OzyH6pwo@lists.linux.dev
X-Received: by 2002:a17:907:3f22:b0:b70:83a2:3f5a with SMTP id
 a640c23a62f3a-b7637f09c18mr367914966b.0.1763569393225; Wed, 19 Nov 2025
 08:23:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118170240.689299-2-Jason@zx2c4.com> <202511192000.TLYrcg0Z-lkp@intel.com>
In-Reply-To: <202511192000.TLYrcg0Z-lkp@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 19 Nov 2025 08:22:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9+OtEku8u9vfEUzMe5LMN-j5VjkDoo-KyKrcjN0oxrA@mail.gmail.com>
X-Gm-Features: AWmQ_blvNYn7H28EA66iZpW2y6IrvCN6ellqnQuobuFiTc4oP03NDclyafTOCUE
Message-ID: <CAHk-=wj9+OtEku8u9vfEUzMe5LMN-j5VjkDoo-KyKrcjN0oxrA@mail.gmail.com>
Subject: Re: [PATCH libcrypto 2/2] crypto: chacha20poly1305: statically check
 fixed array lengths
To: kernel test robot <lkp@intel.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Eric Biggers <ebiggers@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Kees Cook <kees@kernel.org>, linux-crypto@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

 On Wed, 19 Nov 2025 at 04:46, kernel test robot <lkp@intel.com> wrote:
>
> >> drivers/net/wireguard/cookie.c:193:2: warning: array argument is too small; contains 31 elements, callee requires at least 32 [-Warray-bounds]

Hmm. Is this a compiler bug?

That checker->cookie_encryption_key is declared as

        u8 cookie_encryption_key[NOISE_SYMMETRIC_KEY_LEN];

and NOISE_SYMMETRIC_KEY_LEN is an enum that is defined to be the same
as CHACHA20POLY1305_KEY_SIZE, which is 32.

And the compiler is aware of that:

>    include/crypto/chacha20poly1305.h:32:20: note: callee declares array parameter as static here
>       32 |                                const u8 key[min_array_size(CHACHA20POLY1305_KEY_SIZE)]);
>          |                                         ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

but still talks about "contains 31 elements".

Is this some confusion with the compiler thinking that a "const u8[]"
is a string, and then at some point subtracted one as the max length,
and then is confused due to that?

Because if compilers screw this up, we can't do that 'static' thing,
regardless of name. I'm  not willing to play silly buggers with broken
compiler warnings.

               Linus
