Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C993E9F74
	for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776864178; cv=none; b=qdjH9LQn2KWvXnTL2Q39B8TLyZSMLq3OG/R1cixsGzFRLMNhUkA8txumJHUQI9ibDq6UXpYn2m2ArIF538cIa2nI/RBmIkCfr7qzoWNPArHNdOfLJw9SZ4oVx7RcuAhKAAANaJNzuVLZDajwPvR7hCt3vy67xbIvSVxwerGAO8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776864178; c=relaxed/simple;
	bh=B3WIkMhhRY3ABt8emplhzp64UW8Mp2FLLu7xnNh2A9E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5uu2xYo3lNLPUUXYzrI4bzgaUHN+D98Y2qxfo6ddcUe4H/43ICDorZ7IyYyvv2Cvm0i1JhUwuv9oY8B7P8uCIkXbInZe0VF2Ip0y7abrAoJnfluHHcskOIFGrY5EF9Y/EbSUpfosCRaEKSXKCSsXaeQ+E2lXznPogcRX3PYlPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOKzoFxY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOKzoFxY"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so38665485e9.3
        for <llvm@lists.linux.dev>; Wed, 22 Apr 2026 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776864175; x=1777468975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TT49yQtE4TasiiFGgbCE5PSG5c9LX0hebT5gdrezyEY=;
        b=IOKzoFxYPfXCpa28sR5kdoqqKVnQL7ZW1ANrB7qms2OzCOZpjbpE+EFX4BlHPG5ugK
         FMdahQURdvNuc7KeTi+ttjq0G9nrmu0zy4YTPxh6Y6IVGE9zJjluoSB1mwPME42wc3Ok
         Tz9dOhjnOIQEypmwrRXoUg+vVTlCWDmdwF4p5NqAeAuSmGjsWMzPQcsRlm1/1+K5Yd9p
         uuffgnkZQrzdxzTqCtgddGcdaWXlDnMJJgeGHUIogOUi+C5yp66AbNCkBtszhHx4R65D
         rYzT3W90Xey9MatMFsVfGQXo5BHOWBQ/WV8fEYYa/qEv9sSR2ZkOWaj3+wg3KfETFxdk
         N0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776864175; x=1777468975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TT49yQtE4TasiiFGgbCE5PSG5c9LX0hebT5gdrezyEY=;
        b=kSRmVKKbils/gWD8AfZCcEKXDDPZe0mxPZtfxLVlm0bF4/raY9AfOCrYn8PczEOScP
         7+HVBnOq1o8ajiMWsCzfA1BQ1Sk0NkOBENUgdNVDO0ZmL4eaTR4RqsF7L9jbiHBVwvAl
         DKyA7VdmUSSHQrEzAhNORUQPi9MELIpKxNlaUumofgRxrZ3RbLf8jv/68V5s20nUXvEP
         DxT3wzE5l1cx8fuQVd6PZRWN6JQ4kBL8mGg/0OhFrk8zeq+9y5jtOpoGcOo8oYKfM5t2
         I8SS3XdKneLIpbIMQXT31uro+dniGnrLSgtMra7uMMBwSwPfXKnPLLu7t5rgAgcdNNvY
         A+UA==
X-Forwarded-Encrypted: i=1; AFNElJ9P7qTHxDDDtA+8aHOUy1WGYFEz+xpyI2ezjhWteJ2eJsvsBrAfgrBk/0FWpP2JAoITyToB@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5u6TAKIXWr8BPkv2Nm9AIMQSo+gorFF/Pjx7dbkfezVchtGiP
	vgdQSn98qt3V8pIAxdvNxVnUwfHZNX7sudLhVX7oBeZG17pfsCpLMLayuWCe2prb
X-Gm-Gg: AeBDievcy4Y6chso81meVHvgz+gf4GM1VJBsrStl7Nve7Q+bjhRLYv/3x5tcuZt+56L
	Jrx6fFqm+m88FttAE9475EiQ1UTyg4fghBA09eZl8JvrHfEZU2AZMhHw1lBVzGlEvseKl3Ewgww
	tVQFrE4Hk3nUw73gLsQJDvk31Y1VFP85139DS/aGYynjLnSskkWS83Ao/nIeuDEhsVyua9rBv/u
	mlSdvY4/KatHmwyjDxtoKyCCBxXSfNiXP3InDcdiME/YsU8icTe523fde570x2Mf6F+0tenvOm3
	havYw4poEZHNzPIpjqPnbR5I1X2B4x+HGNastzRVkfWK62WzzmBSbCbTKsmqnKBa7wxAgfndszz
	/+Ld0fKY/wUoz/zAQ+NQa3/tmfmBdqpKN9KABan5LM1Lek+pydmyQZuiQ94PV9SDNpVo8fpHlw6
	W3GukgVhsMCLlUuT05lsFyZ5I8hIoJjx/jE9n/QtjvzztFK0i1roSHdVUcNW/RBHPP3GFSPptvs
	0NxlMhxiIyZmA==
X-Received: by 2002:a05:600c:c0c8:b0:488:ab1d:dcc5 with SMTP id 5b1f17b1804b1-488fb787ba3mr242109915e9.27.1776864175017;
        Wed, 22 Apr 2026 06:22:55 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75c695sm134995895e9.14.2026.04.22.06.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 06:22:54 -0700 (PDT)
Date: Wed, 22 Apr 2026 14:22:52 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Marco Elver <elver@google.com>,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, Miguel Ojeda
 <ojeda@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, Nathan Chancellor
 <nathan@kernel.org>, llvm@lists.linux.dev
Subject: Re: [PATCH 1/2] Compiler Attributes: Add __access macro
Message-ID: <20260422142252.2e2c927c@pumpkin>
In-Reply-To: <CANiq72mzmrfa8-7G92xOdg2sqUgLMdzY_P8THUUYXcSmFCZ6dQ@mail.gmail.com>
References: <20260421190351.1976329-1-elver@google.com>
	<CANiq72=45YiMnJiX-73gc7Y6tVTs3fzmVDQ4WdRBQcgqesYFAw@mail.gmail.com>
	<CANpmjNPiyXdQnEXw=YbCrj4R5+8CvzNPX+C4gNaqW0Kjj2-k5A@mail.gmail.com>
	<63e461c3-2d8e-47c0-9901-34b53e53f22b@app.fastmail.com>
	<CANiq72mzmrfa8-7G92xOdg2sqUgLMdzY_P8THUUYXcSmFCZ6dQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Apr 2026 12:25:26 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, Apr 21, 2026 at 9:30=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wro=
te:
> >
> > gcc-10 knows the 'access' attribute, but not the 'none' variant:
> >
> > echo 'int f(void *p) __attribute__((access(none, 1)));' | /home/arnd/cr=
oss/arm64/gcc-10.5.0-nolibc/aarch64-linux/bin/aarch64-linux-gcc  -xc - -o /=
dev/null  -c
> > <stdin>:1:1: error: attribute 'access' invalid mode 'none'; expected on=
e of 'read_only', 'read_write', or 'write_only' =20
>=20
> Which is exactly the one we use in #2, indeed.
>=20
> That makes sense, thanks!
>=20
> We should still change the number here, because `__has_attribute` will
> pass even with GCC 10, i.e. since someone using `none` without a gate
> in Kconfig or elsewhere may not realize the mistake.
>=20
> So we should probably add a comment that the access mode `none` is
> only available in GCC 11 -- especially so if we add the docs David
> suggests, because otherwise it seems like it is supported.

Especially since the gcc docs make it pretty impossible to find out when
anything was added. Trial and error on godbolt shouldn't really be needed.

(and I missed that the size/count is the argument number as well).

	David

>=20
> Cheers,
> Miguel
>=20

