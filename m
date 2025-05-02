Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF091E489
	for <llvm@lists.linux.dev>; Fri,  2 May 2025 12:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188243; cv=none; b=e5K7s/z6yqZI9n8TUKaBrT76/RrHaOgEpzaqJe0vhH248I6+iIWkUX4G6SLGO6ir2xSnN+UAONyLa0J8SF9NmglHqSGkrUK95eWXy/r7tIO3eJkArtKjw0hYehqGfn+wdjJWNmM2PfK9D8pbFB3+KIhy/ROP4ToPZmnf65aI1BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188243; c=relaxed/simple;
	bh=4wbgRYNXz6Heu23u130WXz2Ie3l2+rM1ky9/GtEsM/I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fO7l42YR4oio6/WM6ngbNOWq4ZkiBQ7dq2WRz8iVsD2AZyz3mr7AovupfUidivtGeNIvxa4lhyJUjnu6kF8Bwp0rEbljDYIpRvEo4LsQldVSEFy9xULfwInJn1bCNOIGALYCeg0gcZ+7C50ZaT/d5gwbkYSN9Ffq20qof1NSUuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8QVEt3Z; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8QVEt3Z"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c1efc457bso1358190f8f.2
        for <llvm@lists.linux.dev>; Fri, 02 May 2025 05:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746188239; x=1746793039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=briwm5ooAxRyu9iD9OhCO5jhS4ZNlh92ZAJ4LiUJhxY=;
        b=D8QVEt3ZB0tvnLb+ipyxkxs+iC0CdCYPAxE4fDwVx1GCMT51Nhhjle7EoSydZtY4Y5
         OU61r9+iXBrdpBYuV1WIcTFEpvz02K82R201muYsULuQ1WZRUuc6U28apBRs8XZG5jyf
         cKar+9YELFLXpITUP5wiVliSf578yXPciSarRH/2nVeZ2RL4gzGqGyZCc27M68KKeleM
         aE2A27uXA2WGH1FGE3sqatz90R8s3I64pcb5udhq81/K1XlpEeKR0Ppi4vO/H1izESrx
         rJVFaZ49hFiOwHYWq47OCfIK1p56IegEavrIPCI2kl51gJhuIPdvVxCrcx4Ft55nAo0M
         5OBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188239; x=1746793039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=briwm5ooAxRyu9iD9OhCO5jhS4ZNlh92ZAJ4LiUJhxY=;
        b=gVW0gtOFw34PS/Nh0ppH31Puvfl8KyWWNO1SBR+YQPFfTcj5iU/wDkLvlKp1fZl7J6
         iwUP9nlwYWXxLHThizS2hSFoUJW+Kh/hvO4JLJ2YE25PcbAvSOQimvrvF+b00qh5jOan
         zpJz3IXp0d7Ze/2nn++fVcTbygR5pFqzltqHcqkqyXlUUWn6CwEh/gwn1wNaxiAq+5H5
         JUtBv1/VJ3QG0eDOAq74U5qqWor2Uzb8lR8k58lsm+gZtf8y9nw/JhroU7xb4QcxMrFj
         HrnINLpph1lj6kPpBiycAgYFDOnj0KNa/h/bY1xpsi5LBDrRBFubB8stJgi7VK6HUB47
         fL3g==
X-Forwarded-Encrypted: i=1; AJvYcCXh1s30PzmjPd3X+ARSNduME7/DWhK9Q1cblf3DuaSS0da3gmTr/hJONaRx/2OFSuUYK/uL@lists.linux.dev
X-Gm-Message-State: AOJu0YzblwCo2rIduvsxoxMGRZ+PbTB/UO8BBxKGf/p3fzS0fSK+NsTX
	kUhqCv3SLQaBtWM2nKpSgFrUi9Sdt3BoVON5KkxOyIMKCBhiAPqA7y8zVQ==
X-Gm-Gg: ASbGncsV1i83gF956lDdjgf7L1T/3MQvQbqnMjFVecvSWJXv5QcLYgYtBv+mpB0L92H
	pNx6eKDJ6gNAQGAnbHOS9aaIuu9Tc8fPiRht2BGltwZkyJeXaNp3PeacW0tULAqI8E/hOrp4AtG
	W5zxE//IffIlwTc8IjePhidFnZmX/zrtaDYC9PoNU6a7nk0zO9+GUAoOoekQ+EabIR8NQ3ZyVM1
	XlT9db3rWCZ6RMGWtVFh3OqQRsgHbSsE9ah3HNBtvEALnlGSReLSh62ceKItf7gmq77OLnsrdun
	dYQXBXtid5p3kC5rWMujkH/x8CS70/z9tlsiH29/6NodyYxF1HRTxeaFFfQrESiYKDnApIfEM+F
	u+X8=
X-Google-Smtp-Source: AGHT+IEIG3mjr93MsKdu6mTI7c0HzAfynRUUo2gBbYpI6a+TNHWHTrdGPuaGpbRxVWPG7gOzPGLOFA==
X-Received: by 2002:a05:6000:178e:b0:397:8f09:5f6 with SMTP id ffacd0b85a97d-3a099ae96e3mr2270971f8f.47.1746188239357;
        Fri, 02 May 2025 05:17:19 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b0ffd5sm2001845f8f.70.2025.05.02.05.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 05:17:18 -0700 (PDT)
Date: Fri, 2 May 2025 13:17:17 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Arnd Bergmann <arnd@arndb.de>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, Justin
 Stitt <justinstitt@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Jakub Kicinski <kuba@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan
 <leo.yan@arm.com>
Subject: Re: [PATCH v2 4/5] math64: Silence a clang -Wshorten-64-to-32
 warning
Message-ID: <20250502131717.69af6fbe@pumpkin>
In-Reply-To: <CAP-5=fVjAR0g=wN8sWetHoNWdoDVGNoKb8d8UdwxF_te=wmMLA@mail.gmail.com>
References: <20250430171534.132774-1-irogers@google.com>
	<20250430171534.132774-5-irogers@google.com>
	<20250501210729.60558b33@pumpkin>
	<CAP-5=fXrhsZYJwjJzqb-zMg+UoC-bKoYCjstq8yD9wHNCfbS5g@mail.gmail.com>
	<20250501212659.7e642411@pumpkin>
	<CAP-5=fVjAR0g=wN8sWetHoNWdoDVGNoKb8d8UdwxF_te=wmMLA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 May 2025 14:11:59 -0700
Ian Rogers <irogers@google.com> wrote:

....
> Sorry I don't understand what you're saying. Java certainly has bugs
> in this area which is why I've written checkers like:
> https://errorprone.info/bugpattern/BadComparable
> For code similar to:
> ```
> s32 compare(s64 a, s64 b) { return (s32)(a - b); }
> ```
> where the truncation is going to throw away the sign of the subtract
> and is almost certainly a bug. This matches the bugs that are fixed in
> this patch series for the perf code, in particular an issue on ARM
> that Leo Yan originally provided the fix for:
> https://lore.kernel.org/lkml/20250331172759.115604-1-leo.yan@arm.com/

That code is wrong with or without the (s32) cast.
And the explicit cast will hide the compiler warning.

If you want the compiler to find bugs you need to reduce the number
of casts to an absolute minimum and disable/fix the compiler warning
for false positives.

These type based (rather than value domain) warnings are all a PITA.

Another example is the 'signed v unsigned compare' which bleats for:
	int rval = read(... sizeof (foo));
	if (rval < 0)
		return -1;
	if (rval != sizeof (foo))
		// truncated
Whereas a statically_true(rval >= 0) test will pass.

	David
