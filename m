Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11963A3804
	for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 11:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777028995; cv=none; b=EaUMgmiI63KZWa4BZfgqYobjwXgaTQAWZjtDNuRV35aEkq6LWjaiSmg6/h4XeikJ1jgVYM8ak3RYZNtYWwltq6JlP3M26T1HmYeyhVDBGCRLL4gohYSc3HWzo8Xq3gm2ZcUJF7GIOxR6T2TeexMBex3iwKheIPNBohCk61cNEWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777028995; c=relaxed/simple;
	bh=2m/skchHwc5eR3DekHbks6y2/UhAgeRXG9eMAJvaWJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1ws2/ejEJEksoIWZvIB2a0F7xnnwtKNbHvFZhF/AlWjFZ6MpnqhGU5YUt/dPRwRpTgoF0v0ZD62uHua5clt3DHaiHqzWgKzbi3vdom+QMFyeK0leep22NyVD4VlRg39RRU+jsNzPVDEAvy0FSjrVC1lO4hBEwNqLuXBQ879R6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muejwO7/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muejwO7/"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43d0deb7ad5so6354530f8f.2
        for <llvm@lists.linux.dev>; Fri, 24 Apr 2026 04:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777028992; x=1777633792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDKNX6OzlxA7jl/VimGCsLSHmvQn0nEFxj0ZFcUDDEc=;
        b=muejwO7/C4iXo+lz1uNAcKEqmZ0TbPakpdP11/HSMtUoTlcbTG4JkRy3ZATpQQGU7K
         FnXO18YxcloXis8lahgyQS795EmoGawjMB7wCipvOHbjYPAamP9tVTDyw7bFcCopKL0a
         W7uvMmcUBoFbO54GaKPfaQOztrDyu2i0iRsTRZOzvxXE+8gZcdTsA05RSVbpJ4IE+a6k
         EnQmC8QuOamAbbehriK36AHvGwrHOGeQa8mJXFeN1NYissfKj50NyPfR2lkQ87ynsG8U
         p5EhVpmw/MUHHHlmudsJMXi9rVuOiq4TsmYZ7gjdVDPJzVEikVOskYJfHU9XHxUhQqDA
         n7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777028992; x=1777633792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDKNX6OzlxA7jl/VimGCsLSHmvQn0nEFxj0ZFcUDDEc=;
        b=ZSNipvnxKOJGGNz6o1H+7XvXKLTUbzZTheiayCAu/O2gPZS/uZNFZyhq0Wh0+BokvG
         thi5Iwk7F8PlYdvTTkcZOKHZueLe8p9pzOymy5cxDXcFhaFyolNhCwhNtYgRHli7149K
         1Az1J5I89zkWn2P5pCD8EzzxNIB5F92eFGwnvkmPS5CPHCwfXrABBKW3HPoa16gERbhq
         sBWwywe/WwMkijYY/fy/LPPZPTEugvO6FwydIqeYb3Fa2JpP8/0AjWtaIpgMS8Y7N++P
         KAXvvZ6JqKk8xYRNbMNg+OS70omZCww9e0L3BYlgIDoHB6Ls0s/ZMhS8k6DklVsq1nfE
         lRFw==
X-Forwarded-Encrypted: i=1; AFNElJ8w2SaYOPnjRiFZ0H+il9FabUgCF5ajhi3j0H1Y5JPQZiabPXSHeM7nCxu8dYUSohKULQrG@lists.linux.dev
X-Gm-Message-State: AOJu0YxIz/8Fj0dTO2HTD88GiHAnZ1vHSa86TNHZhvyiTRpOaLkWqkT3
	Zm/qWYTWjnKJUuoq0iUWsLW148meIAtkp/oooNcy/P4dvcSpWZVzGhqD
X-Gm-Gg: AeBDiesOIwkK+EfqCJpOY6vUh/a30qOS1AiL7pHc8oEpPF3R/ac0/KwTKQDWNM2wo9a
	ji8SZWnhEj68nz/OWI2lHYs9R4OUtb5/LwHNyKgRxiB7HgnI1201wNb7OMdR+R9IUSGg54QZXE7
	wt96EqXoEgjMv1ltVJexAAsmREiZARVaJFBqXgFEacVlWb5FjF5x5HDRqwvCzJJjeAz61dW31ej
	AcLVTMvy7vdXVhiHbobUiGku7rrOsvVXS0A1ksc5d3UBb2Bm/A1tJEmyt8gm2YVQAvn7XB0On9P
	u/CwjUiBudpsWdz/PVHXKP7VGCfqihUmyb49/kNDzcGCAex8iaRRMA4OBXTUdKJHuZeQ0Tem94H
	BhYV2R5u5rVFJ64yahu2g3RuvI94wCl6PaA+SxaRDB+HfnTflODabnQCIdy4H5wKe2GzgCJzKtM
	2JsX2rACxwL8/tlGfXaDdi8UCqtnrwdPKhxfosd8ATAddjxPP/Q3KKXxWYM3DZVVvkELrl1KPNC
	UDl1PCyS1rvZA==
X-Received: by 2002:a05:6000:1863:b0:43e:a69b:d818 with SMTP id ffacd0b85a97d-43fe3e0ab5dmr49306229f8f.38.1777028991633;
        Fri, 24 Apr 2026 04:09:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc0f31sm59174867f8f.12.2026.04.24.04.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 04:09:51 -0700 (PDT)
Date: Fri, 24 Apr 2026 12:09:43 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org,
 ardb@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org,
 nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com,
 tamird@kernel.org, arnd@arndb.de, nsc@kernel.org, simona.vetter@ffwll.ch,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
Subject: Re: [PATCH V13 5/7] rust: Make __udivdi3() and __umoddi3() panic
Message-ID: <20260424120943.4a65dd69@pumpkin>
In-Reply-To: <aes7L3M1d_LvvGKa@luna>
References: <20260424054742.45832-1-mkchauras@gmail.com>
	<20260424054742.45832-6-mkchauras@gmail.com>
	<20260424101425.6bde0e17@pumpkin>
	<aes7L3M1d_LvvGKa@luna>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Apr 2026 11:43:11 +0200
Link Mauve <linkmauve@linkmauve.fr> wrote:

> On Fri, Apr 24, 2026 at 10:14:25AM +0100, David Laight wrote:
> > On Fri, 24 Apr 2026 11:17:40 +0530
> > "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com> wrote:
> >  =20
> > > From: Link Mauve <linkmauve@linkmauve.fr>
> > >=20
> > > The core crate currently depends on these two functions for i64/u64/
> > > i128/u128/core::time::Duration formatting, but we shouldn=E2=80=99t u=
se that in
> > > the kernel so let=E2=80=99s panic if they are ever called. =20
> >=20
> > Ugg.
> > Surely you can make it a link-time failure?
> > Or change the underlying code to avoid the divide. =20
>=20
> This is currently a link-time failure, which means if any of the core
> crate or drm_panic_qr are linked in, the kernel will fail to link.
>=20
> And since we rely on core, that means no kernel can be built on PowerPC
> without this patch.
>=20
> A possible solution would be to change the core crate to not divide
> u64s, but the last time I tried to do that I couldn=E2=80=99t quite figur=
e out
> how to do formatting without it, maybe I will just open an issue against
> Rust.

If the problematic code is (effectively) printf("%lld", val) there are much
better ways to generate the digit string than repeated 64bit divides.
On particular you can use 'multiply by reciprocal' instead.
For example see the latest (I think it'll be in 7.1-rc) version of
tools/include/nolibc/stdlib.h

	David
