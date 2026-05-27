Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59ED37B016
	for <llvm@lists.linux.dev>; Wed, 27 May 2026 15:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779895654; cv=pass; b=h6qB9TssGkNCxVKriXbBhtFMogdrCIvO7umPSgsD5eZIHNjZ9QgDBdhhBfq0BtXBXXDoy01QY/45lZFpxcmXo27eEpv9XIrlbR03pzv3JwO4CRWdkeKRzwy6UZ4XYQHHEV9WTasWDuKJAXyfR0lTQGC6ob1Z61ZlQk5xcvEuY2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779895654; c=relaxed/simple;
	bh=9TvJ9uuLIEORK+dGCmLuVAVGVIJIAY8t1AoduDJOjFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ot29bYiwl4vJY3Q3PTohk78uT086w9+04yVo520yfpS4wArxJQaIELHSJlBj+en35nwMxxDF7nhJ4ndVuRFGdKPwAk3F6syDY+UQIE9B8/uBzr9vEAX3lJMZVcvFK/XuPW4lE4QovbvWTADHaftwlIPQZ7+ToyM6xyl0mDi+Oc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aC5y3Ttb; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aC5y3Ttb"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2bda3b4318dso1217630eec.1
        for <llvm@lists.linux.dev>; Wed, 27 May 2026 08:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779895652; cv=none;
        d=google.com; s=arc-20240605;
        b=ZTI1tGaB/eqwLSKP05bzvs6SWw5ozl4l7YnVxRh9Ey39EkbhbuXdroyqcVZM0aOliU
         GkUBs5bDkpP0l6P4dS8nPVusNiiTckBJ0rdG0Bd80KQ9w1uwZ930i4PtoO0CNnrtFF+h
         aHd0uT7xqKyWlGuWoPdAwnSTZLk5I6Ji36+yWq2xioQM+7D67uxFRhBkD1OnYzt+WCmQ
         NvTLZ4iK35vYkvk34qo6JKLlmozqEGreZ4QtF9KxroC3rKCuCBO8/c4m70X8+CoqGxcG
         nWB5FhWl7VgKiwh3zitPydk2gjafTjANQle6vusw/3VJLs8ijTzGIW6DuVkx7xjbLmvO
         ctuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H4P3b21yApXuHT68EyOUNlmIwsJgC7TFNvxT82mSZVg=;
        fh=fZq3MQCgSmmCcAElJwSTKFtCISJNXkUp0Ban3oPgPjI=;
        b=g6nUh+B2i2Ckpia5IFoYOiJFfiDD8OQS0Au0uZD45RZhx+r/iV1wS4dEhPE6BrrZhT
         5LavM058rsBOtDqaD9799nDN59XenrlNrtJjEICh4BVry1G18Vyf3XampiU/jqwpa2QD
         yAPOb7eXTOu3cVTSV80b4wL1xB7jYwPYzpk6pBQT+S49/ollLxFr6D91sppisSfxY9ga
         hgJOF56Ux3gJJCZzy4mqxR/Ltl+ab5K2V4Isc9ZP8PZercHz061TZFM58ZELZvtS7HET
         ESgDGnOV39DZIGfUO15wzVqRhI3QWIpCzO7Pr2rype94kjaqWCEAXAYIdZbbzKBEQVUz
         mq4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779895652; x=1780500452; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4P3b21yApXuHT68EyOUNlmIwsJgC7TFNvxT82mSZVg=;
        b=aC5y3TtbwvsOUW+ftMLieJmaHa+G1TG+/B2eL/utcGhxCEBO4OJTNvfVRdbAB6uJFh
         VkeaMdMh3F0r7xKRdnPBKg41JsH/kim5LxTiBYr1dBDAd0x1Qm6BSWC+iCcMFOP05A/O
         uqlI79AQEp4Cs8WdF5YVQ3n8vpO1Vmia364fOjpNCZzQOvh+KzqQ/jGeniDAHBuMhKNA
         KHjCCACKJczdr6YOgvhTfNX1sTrkr5kXS5/jliqhNutLG8tx1cWB0iyCCVg2CxKeRrpG
         BNUF4raxCMF3ziBQ9qkF903OY0/i7i62asgNQvFV9IP5psMSoflnJcrHFYMu+szJnXRt
         XSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779895652; x=1780500452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4P3b21yApXuHT68EyOUNlmIwsJgC7TFNvxT82mSZVg=;
        b=JGDcah0SHT2sp6ZPSZviEbY2Syljp4TlU8ZRtDpg2ieKdclt+HQQ7oZEymfe2nim/8
         o+1sGBk2iJXs6oohSo4ZM7MjtcoAZxzEZIrpkcCsN7TiGaUC/HKS30PD0vMpn2I1Dn4W
         XgzOkBX+LNdij2Ct0e7syCH1Ajf4BqoDZv1HBOJGzkYurgFbdy+HArs87KH6JSveFAGS
         uyyMyqFJCEJCa6AspZmPWjjELKCtinsniReZWDCAkbkkJ89HVTjjFUo7ZsAvVbj0aR+M
         nIDLyR9ZDwlOI4SWyLbIRkH2ts/t002QVwcGbCTNimBOWMNlR8NxHwvtUS0YdcG1mrMR
         MWJA==
X-Forwarded-Encrypted: i=1; AFNElJ8YGYZJ0uA3KB/Qunuu8hYPwlieao00eactNvfOovOXOm+yiECy4bz5V1C0UI/f4vrXqMcT@lists.linux.dev
X-Gm-Message-State: AOJu0YwKx30jDDjEvCLpfvvtNtQuyaiPnIKa1a2z+pik2F6USCR8D/ey
	YbYs9oiA1SDV0twIU+z7p2QsUfZyfFcuEKu2hRRwZNxAE5s/wWPmoXoFm1HWUC9DMGuW4eZa7Mr
	WdbQAJLjB3P0lJwO7zkwY3L9V7OfJWRM=
X-Gm-Gg: Acq92OGS7UTPhZg+RKHi3rry9GyLUJ7XYuF18yFGF4nm+TaBdEuDZGla7yhODTuZY2u
	IAUHG8Mtq22qXOZKbhIuK0H+2UbgTql2ksmGXr/6Wx66D3yUwrKAhd1HZAmJInyvMrFp4CeYAQe
	2r//ywc1Vdjl6ZG4rC5apK/bzeISl2nOL/ZQUH+TdNn7JO2Dsk+i+yz5cW6JnO3MOtd4vgr69Q4
	maiXbhOZi0zCZO+TtEsJnYxE8yn/i/xlJaD5/aVYJxZwYLumqtSjY4viiEuPHCC7EcNx7QVSW2F
	m+Stvtb65UW8EYFgV2Zen6znr97lfQBViml8KRE78slPA+ZaC7Mzj3VhjSf2gk9SKGQa08bd/nc
	X/lQVAHTwxP691gZCf0aFcGySJP+EwmDDcA==
X-Received: by 2002:a05:7301:168e:b0:2f3:c1a6:361f with SMTP id
 5a478bee46e88-30448f3c004mr5114522eec.2.1779895651952; Wed, 27 May 2026
 08:27:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408-kasan-rust-sw-tags-v3-0-e07964d14363@google.com>
 <20260408-kasan-rust-sw-tags-v3-1-e07964d14363@google.com>
 <736d3bc7-9285-4c94-8a68-afb37ef27167@sirena.org.uk> <CANiq72kj0i+qUSAc-ZAQU=KtMS89miZL3=ni+b6Vrkeravo9rg@mail.gmail.com>
 <1980a603-db39-4b82-8c0d-dab3e92dd8e0@sirena.org.uk>
In-Reply-To: <1980a603-db39-4b82-8c0d-dab3e92dd8e0@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 27 May 2026 17:27:18 +0200
X-Gm-Features: AVHnY4KvjRGu7XZK-VQkuuEd59BricgsT6JoK2UOPa9P6pyz3w9H19-0yy56G9M
Message-ID: <CANiq72mbeCMzS2gReTMzb=KF4fSezp_FZWQ60HodiuwAeOkjKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: kasan: KASAN+RUST requires clang
To: Mark Brown <broonie@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 5:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> No, I just started building it with LLVM=3D1 though.  We'll see if
> anything fun happens with the different set of diagnostics, it's
> currently clean so we're OK right now.

Sounds good, thanks!

(`LLVM=3D1` is what we (or at least I) test the most by far, but it is
true that Linux distributions out there use the GCC (and thus, for
now, mixed GCC+LLVM) builds...)

Cheers,
Miguel
