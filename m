Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4933B18DF60;
	Wed, 29 Jan 2025 22:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738188979; cv=none; b=aqNIqdJ7kdXCRaSY4fMW9A01zn2eVDGj1neJykSM1qHZpZ6jIwzxRNTuMEYmgKDx3r6vJv48qpzys8ooc4E4h2tTxUeP2yrqhC0DQ9LSFt9Qaz2sAG8YwOxaU5/w+fhfg+xvnLx3Z2xtvNnZDK8q3h2x7Xtzi3L+zbfD0KQSH64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738188979; c=relaxed/simple;
	bh=CBjBxfBArHaP5+KFSMSovBvLkn91zi5YvQjUjm6Fkxg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VDb4fiQxM0EkVwcopx9+xeAZCKtA1uXj6yi9VrCVg9r24e+ffnV9K3s6BGPV64Y+XNHbKHsS68CKDAKGsTPqfRsHxW7HHPllCixTAcnz5nqHz5gsPFiYGeecg5+LP9U/KO4/w7N804rXQvV+MRfjN6ED740BYGneTvgINCJFyes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP5iDm4J; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP5iDm4J"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so594935e9.1;
        Wed, 29 Jan 2025 14:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738188975; x=1738793775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daPgdxKytpeJo/vzJrQd3hQxPDtGozJJzmn9okR5/Yk=;
        b=AP5iDm4J61USKZzIiPBvvGkvFNoQxZE+7zuxDBgNj7HM02LnQ9QN9OoNqQIvuWeA1P
         YiNoZIZv8bnn4cXC/bwoGMOcdzCsUo2gTMZUCX4p9uGzla9Orz9wintfOBQ0YbOAEkhb
         nLtDo1gBOA36ElXKr7Tck/aM6o941r4uMaqQfhBygCzqeXytDGXOYI7crl6z1ZWaEepu
         DwUjXZ3Xjzwz6M7eIdvywN3Je+90iDpTSbXcTbWb6PNAJsUSA8rMcCq6/cL6PjPe9cW0
         Jni9leGYbMUU35OoIKMz46gHFFtF9Jr73eMW2CAqYMzPXna7/47PBorsGVySUJokCwdm
         wBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738188975; x=1738793775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daPgdxKytpeJo/vzJrQd3hQxPDtGozJJzmn9okR5/Yk=;
        b=QiKGw2lTXBdk5g2oLJZri0Fs+J1RzLbpF2aODYj3erTCp4neAX/Yqmjk/vl47fUuNm
         bDPNeWYBnefF7po73M3yWGSE6hPGjlDFJgwVQpjo5oAkSwJ3E4UEALUt4AS+QTN6WkIO
         0zPEjB5CTvFdOl8Hs1H0YypIVWNbhH0pa0NIFAbff0ebPokRPY7OXp5IJp94EqLwiPhx
         +a/dhXfIW3QY/tqkxgKoihAG/4shUh9xK5YFs8P64vCSjBWykMemOwa0xcOUI3eTZ4tk
         2on+BnHSkU0NhNkKvNow4f0Kefn9ZrmhGAsOoUYWJ53z/KpgiaSDnsqd6zDZj9cseH5q
         Tx7g==
X-Forwarded-Encrypted: i=1; AJvYcCUdMmlN75KcTtkv0D4kY9NI/2uuq6ZYve8Hjoard4CYcHC3EHDeS2zZzDxNwtGT+Ld9xxe/@lists.linux.dev, AJvYcCXyEca1KaQawB3w5R5eDz7NYyDbwcHxIExw30AickX6a6RKpF97+eMzntoo3THFErvgCchfGWbmPmuZY1aWNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/+w5XHMJdgBCNwW1Z2P8XPzhtSpRlARcG+PThxlNfJ6xBqkcj
	iBJoqAMcHDLfwK1O647ADshmkinZ5UqyLN3ZNZlXJ9eXUK2o7DIz
X-Gm-Gg: ASbGncusqM/JLtZGrijAHgSzHarWkdqKZqULncPANhsSOHSeTmZAxnChkbnxATur3RV
	AL08WmLM2eiR56AzjV/jZCUliJu+cr878xwzTxlsXeGIoBqSuRfbk8xA+H7Nz4nTE//PsnOxrBD
	7ryDvmoRzPNa22JTI7D4qlDF3CbAYUE2jSXX1krQiHYsCR3DAPhLcOfJcRM4tPYDwK21QivZA4Q
	nzPfhVGp/m6TsMPoZ4cS924iydqKeKRwj/QU6qIFPrFjOjf4lesvmELGL2N/b0aFODhGN3+7gzy
	oU1UUopq3lNtUL7VfNERdpXg9gKQ9CRoTywQoFBZnasia19sm+ZIhQ==
X-Google-Smtp-Source: AGHT+IEi0h/P9Ax4zfeG0ZIoZCiltydXmJWGbhNxx79y1e5qOKwoDDFKlFRLIG3wS4UCeaXx6Lgc2A==
X-Received: by 2002:a05:600c:474f:b0:434:a10f:c3 with SMTP id 5b1f17b1804b1-438dc3c346fmr36972515e9.9.1738188975404;
        Wed, 29 Jan 2025 14:16:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec7f1sm68166f8f.9.2025.01.29.14.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 14:16:15 -0800 (PST)
Date: Wed, 29 Jan 2025 22:16:14 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, kernel test robot <lkp@intel.com>, Maximilian Luz
 <luzmaximilian@gmail.com>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, Hans de Goede
 <hdegoede@redhat.com>
Subject: Re: drivers/platform/surface/surface3_power.c:243:2: warning:
 'snprintf' will always be truncated; specified size is 10, but format
 string expands to at least 12
Message-ID: <20250129221614.6510f165@pumpkin>
In-Reply-To: <20250129134648.GA3884012@ax162>
References: <202501291646.VtwF98qd-lkp@intel.com>
	<CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
	<20250129134648.GA3884012@ax162>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 29 Jan 2025 06:46:48 -0700
Nathan Chancellor <nathan@kernel.org> wrote:

> On Wed, Jan 29, 2025 at 02:45:38PM +0200, Andy Shevchenko wrote:
> > On Wed, Jan 29, 2025 at 10:09=E2=80=AFAM kernel test robot <lkp@intel.c=
om> wrote: =20
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git master
> > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: Mo=
ve Surface 3 Power OpRegion driver to platform/surface
> > > date:   4 years, 3 months ago
> > > config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-=
ci/archive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
> > > compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project =
ab51eccf88f5321e7c60591c5546b254b6afab99)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > > =20
> > > >> drivers/platform/surface/surface3_power.c:243:2: warning: 'snprint=
f' will always be truncated; specified size is 10, but format string expand=
s to at least 12 [-Wformat-truncation-non-kprintf] =20
> > >      243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3=
pE%6pE", buf + 7, buf); =20
> >=20
> > 3 + 'E' + 6 + 'E' + NUL, that's how the compiler thinks about this
> > formatting string...
> >  =20
> > >          |         ^
> > >    1 warning generated. =20
> >=20
> > I do not know how to properly address this because it's false positive
> > due to the compiler not being aware of pointer extensions used in
> > Linux kernel. The w/a is to increase the buffer if we can, but is it
> > practical? OTOH, this warning will be translated to a compilation
> > error in case of default WERROR settings on `make W=3D1` builds which is
> > also annoying to people what want have that clean. =20
>=20
> Hmmm, I missed that -Wformat-truncation-non-kprintf was only disabled in
> the non-W=3D1 block in scripts/Makefile.extrawarn. We never want to see
> these warnings at any level because they will almost always be a false
> positive, that's why the "non-kprintf" flags even exist in the first
> place:
...

There is a separate issue that it doesn't seem to be easy to mark a specific
snprintf() as one that will not actually overflow or where truncation is fi=
ne.

Persuading the compiler that the buffer size isn't constant currently works,
but I expect the compiler will start double checking against ARRAY_SIZE(buf=
fer)
'any time soon' which will require the same treatment applied to the buffer
address.

	David
