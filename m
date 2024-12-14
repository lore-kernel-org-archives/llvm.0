Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56354782
	for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734210646; cv=none; b=asItRZqeDPPOZ3aJVN6ovnArsHNFzdzLervjTd438bB3G4nBKtjgnI8ZnAEWuT3i9qZjN+6UuB1zTrXfUJsWnLSTPB3/sDdAzKOOyGSQsihkuOhabyTXh1ddEI7S84IuPx0qzFqG9pog1y5MGY6rvdHDnmTqq/Sb3LxguhwyEsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734210646; c=relaxed/simple;
	bh=dizETgqchOGN9znBptIwYYp5DcUVnRRkyxawE40hqy8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dsWbCwie4U1KwrAe4HnjWLvN2vYEl+qtytA4m/wvCClq7WYMCmDEZ98fo4EJ3cnUV0jlLtW07jRnaBL2A8fgDBAY0hnliOmvH5Utu9uogpTNXQOIcogcO9CIX/QumF4PHMoXtYiBMHx9pfDEUMY3DGvNeMBlHLxk6js8utL2etE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QyoH50bf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QyoH50bf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso3449173a12.0
        for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 13:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1734210642; x=1734815442; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WY4ZfJ2+ctfZ1Zv59YN+ivx3+dAJ3DnG8Iv2rYTKPj8=;
        b=QyoH50bfN9kmrnlep87J7WSN3I1BfuutMfjNwziRrmVP6iE55iOLw9v4SlI51Uoido
         Ajw7lM3dF5SFzdqz+uYlTxZcAa7b99vZ6sW1MNeqby1RNi4XGgMugFPToCmfF6BTT8Ya
         6hpT4BRwtkssMd8lqvtoLEeKOztyC6sdeQ66g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734210642; x=1734815442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WY4ZfJ2+ctfZ1Zv59YN+ivx3+dAJ3DnG8Iv2rYTKPj8=;
        b=gkEVWiRjJLDJS8pUWYiDJDhhW3CRCLfs+0egm1RQ6P/+X/tub5LymfsuYFU3+wuw4n
         OEdlsVFeINJt89tNT7+9VyJCPDFJYNYDIaI91bQFGMrro0tnz5PGzQzQbPAY1IsiUadi
         uFTCN/i4OIVLD9eKhLin07k5SzWPlG+jl2jedtHbkTA9ajbi/jAJs/i72wjof4dkI8j4
         3CYPL7qG333K01B8LVo/FNqSaBuUZB5RHp8yQ0FjjnvHb9qMekEPLZzSka/ccjUtrxKs
         DgALbGf1aEhk69iiinkrHou6fJka+Nqtpp52x6dn1ExkyPF0bnyU1PjQ0X3aXfPK3ojH
         UlWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaAi++PKlJB98nCg1Y2SiwQuCCzP/GQCYgQPL6Vjf0tMnuerAY3jIWhyVUWciZq4nPW37j@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+InCR591WpjTOLxJKk3pRrKaS+Ry4iy3ZY0noBRN9Bixo+3lW
	SiE73fUk2MpQqpYlgyLaxWcyvfDlmSyGYa2Z1ffd0MRCAc95e3kQWFxc9cuQ/tN3pDxlGrZl89W
	iIMU=
X-Gm-Gg: ASbGncvtAdmrYPoSBeB7rkI+ttv/oBldz4YGvMKqP8SE4nEHelzBoJEx3pS1II4F9O1
	uBYOFy0UndCGDmBI3XXwbnqWNjxaw6dTsvy83PgTrvigWmXgE61UUVsFeaPOgXMw814ULZEJXC6
	gMk8mAc4DKxdlbGDl3H3r4Ws2YlDTdr4vYlEKv5LYJce0t1+/4twqfD4yTewiqsIXFlrbPjTHPP
	K6BRy1XHASGrUt3llWzJXv6q/Rhte5GX2W1UaLP+EbGJUM8iZ1KKaaTfuRstt6vvxupZP8zB+Vw
	qVeVdAtnUq/vmlHYOltiYhtDwi3+znM=
X-Google-Smtp-Source: AGHT+IFj0cVGh1DOnDt0NFUxGs5Lgoo5s+X8jQfwG3TDN0ir0WSz2F018WZEn4vc4U0Wm6WCga456Q==
X-Received: by 2002:a05:6402:390a:b0:5d4:2ef7:1c with SMTP id 4fb4d7f45d1cf-5d63c3db8d9mr16470637a12.24.1734210642230;
        Sat, 14 Dec 2024 13:10:42 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab963913d1sm132206066b.165.2024.12.14.13.10.41
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 13:10:41 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a977d6cc7so369970866b.3
        for <llvm@lists.linux.dev>; Sat, 14 Dec 2024 13:10:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMOqE0UDCEbgFK4UMJ/CySMo7ayJCciKf0JGWaetZEey9l/P6+1RAaEof/QCNVVPyUR7Km@lists.linux.dev
X-Received: by 2002:a05:6402:35c2:b0:5d0:d3eb:a78f with SMTP id
 4fb4d7f45d1cf-5d63c157955mr17026663a12.0.1734210641295; Sat, 14 Dec 2024
 13:10:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241125110646.50799-1-cgoettsche@seltendoof.de>
 <e43da8418fc54a5eba7cdbb594b24bb9@paul-moore.com> <f7bfbf89d2ac4b929637bbb25f749c96@AcuMS.aculab.com>
In-Reply-To: <f7bfbf89d2ac4b929637bbb25f749c96@AcuMS.aculab.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Dec 2024 13:10:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgraNfcOCZ4n_C+ircQkD_AhsPM-=z7snt+eLgE-6otkg@mail.gmail.com>
Message-ID: <CAHk-=wgraNfcOCZ4n_C+ircQkD_AhsPM-=z7snt+eLgE-6otkg@mail.gmail.com>
Subject: Re: [PATCH] selinux: use native iterator types
To: David Laight <David.Laight@aculab.com>
Cc: Paul Moore <paul@paul-moore.com>, =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgoettsche@seltendoof.de>, 
	=?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"selinux@vger.kernel.org" <selinux@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"llvm@lists.linux.dev" <llvm@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Dec 2024 at 13:08, David Laight <David.Laight@aculab.com> wrote:
>
> Isn't this an example of why -Wsign-compare is entirely stupid and isn't enabled
> in the normal kernel build?

Yes. Please don't try to "fix" the warnings pointed out by that
completely broken warning.

I don't understand why some people seem to think "more warnings good".

-Wsign-compare is actively detrimental, and causes people to write
worse code (and often causes mindless type conversions that then
result in actual real bugs).

            Linus
