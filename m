Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2612017624F
	for <llvm@lists.linux.dev>; Fri, 12 Jul 2024 16:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802070; cv=none; b=g6Tjcde7FwKnATaUIlSUzqaxuE8iILJ+pQY8y5JvmxNdYPySRgs5tsksTYJH3SzRqmh9daIuCJnO/O83evU4rxFXCEGjSHJJmAp2koyjYlLWBGB3Gr/da+z/4lBBbq6EP1Y3D/R1HbL2ULDJYeSIWZ6wYNAD7zaAbKzvnYJoYB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802070; c=relaxed/simple;
	bh=Ko5ApnctGqxTLJF9SLd3BZfsxJs9G8s9AyRIX4oqdd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V3N7g6M3CNhUbIlPgE9yv1J9edVTHcC5/gZJ0rdpRx8g5EynJ1Cf4zpgE2jgc0oHnW0khLg1O7Rsggp2XleW9+OqUfRjXW/k1AsH3TtQEGLSVXang7NF+wrg/7VDnwjCyNrnfdyWQYYEzNqRi9m4OQEvouWZ8rqNBVF5tY3Wu8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=GnDUJyae; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GnDUJyae"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77c349bb81so265378466b.3
        for <llvm@lists.linux.dev>; Fri, 12 Jul 2024 09:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720802067; x=1721406867; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko5ApnctGqxTLJF9SLd3BZfsxJs9G8s9AyRIX4oqdd4=;
        b=GnDUJyae1WRrKRQF3MEVK7aVKIsJFNr92gUdP9dAVclqh0hYWzHjrTJbBVzXpGHuHS
         yRaKA3tw78u4mH9NtAu9jTD/KPjAOJ4PY2NU+ofhwdB9JNh5a0hYvw07swhGInk+IvDx
         f0EbBT3qihB0FfmGOLGe6h3d7Z1PCXRwJB7XVSEr3b/yz1HYmnaX1zTIezB3dC9DMLgg
         R9Dpy4vgO7xSrMk0B1nzpay7XM0csvmsxtJgLI2an+2dLCY8DyaW4CvC6ieiGD84s7ye
         AuxRL1cjfMSYnHK14Um8O11WmAZmwk+Z14o/eGkD8QDjX8aPIm76NxomgcXERhYOZcAU
         dAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720802067; x=1721406867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ko5ApnctGqxTLJF9SLd3BZfsxJs9G8s9AyRIX4oqdd4=;
        b=k/MoRv3XVhlvenRwhtP6yPJBSiFpQI0DbwkknHrsb1MzkhguyzzgsW73VJhvqMtWLQ
         wQuzQqGyQ+MIg0TYm42mgWUGNjgWxWy3RrbLpXsYtoyGMR/IRGGfX8/+wvjvqdxFiRB9
         07XM7qeGPOlDg8JR8crEYiilLGC6uGu69+LRqKpMosoOs3zquUgWxlGm7otuzsZJMMx+
         /bCAGnq4Xp+pHEIl4A5en5H2dht/VfDDbBaswhehimV7oLMjYs8CrPGfvW3vv2WLLOzq
         PCrtFxjQ6mWBDp7yGKpSYlVxD0ziWkeEIrRlrSYiOsxhjflEkZ4bHETrmpMtgRzrDSRs
         4+vw==
X-Forwarded-Encrypted: i=1; AJvYcCVR2FprUASdWvwViBSiUCLuOZSZekcTdTq3+gjK3hGz3Pw53qcVz5wkYYQgCIaVF2hJcippmMg0N0u5Se2U+GAz+CpFSw==
X-Gm-Message-State: AOJu0Ywp51iXne0N04arK2mBqQrQ0B0B2xRca7ikORvWMb0uayYz1m6R
	BV1sxLskUiakqbanVmjjbGDGRTS9ZXrAdjxS+Muj+WKVGWzhYxj3zmv8kTReNk8=
X-Google-Smtp-Source: AGHT+IFIkSLn+xMw/ggbyUGVHPR8oXe4gw9aACxLjgf3iesFhHrqTH2XCriTFDtXu1o/lJmDVUkazw==
X-Received: by 2002:a17:906:39d6:b0:a72:9963:eb8e with SMTP id a640c23a62f3a-a780b6b307emr658574666b.28.1720802067472;
        Fri, 12 Jul 2024 09:34:27 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6bc6c0sm359609866b.44.2024.07.12.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 09:34:27 -0700 (PDT)
Date: Fri, 12 Jul 2024 18:34:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: kernel test robot <lkp@intel.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, jdelvare@suse.com, 
	linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v5 3/3] hwmon: (adt7475) Add support for configuring
 initial PWM state
Message-ID: <xqniwjyz7jrf2vb46uql5eag6fttgybzbg36laqmfarplmxu6a@bgdksqe5dq6f>
References: <20240711234614.3104839-4-chris.packham@alliedtelesis.co.nz>
 <202407122021.YFqdjjQS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uvbasbsoovfjy5qv"
Content-Disposition: inline
In-Reply-To: <202407122021.YFqdjjQS-lkp@intel.com>


--uvbasbsoovfjy5qv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Fri, Jul 12, 2024 at 08:45:52PM +0800, kernel test robot wrote:
> >> ERROR: modpost: "__udivdi3" [drivers/hwmon/adt7475.ko] undefined!

FTR, this happens if you use a long division using plain /. You have to
use on of the helper functions for that.

Best regards
Uwe

--uvbasbsoovfjy5qv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmaRWw8ACgkQj4D7WH0S
/k5Sjgf9En6EDzoXQtBhmc4s/93+KbRCAlhxs/MIhtH1wfGU2SInNC6Bzzi7TW1l
z1/4LG4VW0QIru/jNxRZWC+ko1Y1aboC/ZpBDeHKsLl4drbzivFSg13dEL2xv/dS
+QuuW3BFKf/iaMBL/o1BSga0zLTwJabS0CaWWrtv+SokR0lkzFG7bDnMjECGyvg3
BymdnZMJSS0gutvVumXYrj3WXMM1vaVxDgB9g4Eliqnt99mRqoKt79V1fuJac1pd
tdqn6QWKRUnePqLaTMe2bKdYXIrzERZIFWFATlUeQ858I0F8a1Zjdik9HMVM/UGz
SW9L1yZzboDZhwHzxM+KryaI9xspyA==
=nT91
-----END PGP SIGNATURE-----

--uvbasbsoovfjy5qv--
