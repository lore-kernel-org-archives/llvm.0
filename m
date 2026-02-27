Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2A63A7F63
	for <llvm@lists.linux.dev>; Fri, 27 Feb 2026 23:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772235659; cv=pass; b=K4Zp2ccrpwhQ2HS6ffUGm0L0nIf8r5hCz8jzcjg0DKEzqjYbgAjgbsiY6SZ66HHBOFaGzoXolvSXDviIpEHRMIdiMOze8mIaB9UAUzmkoK++okVeCeZi5Av9O720dw9AcEBMH0kGfGQZji0w1fT+6SKylQtH+vspaepXxCnb5mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772235659; c=relaxed/simple;
	bh=RP8tg76wlCDecz2kC4LOkuQOl8f8t3SLtfXwbbGnwFY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d7/OUgUg9ODABd8MkY02k7EMr65QpvBUNQoyZMg3fx2AwfB38BaMf50SBsWKYr+5/gsCEK/lYoOQj4oKGv8yHwRwHA21DPM2ENKJCZbld+qiU8knJEnLkWvCEhBd0u09uLtjOm6K2A+8fKAXiLU4/PxySiuIkMqmk5FCnMUF2Uk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFrFSSf4; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFrFSSf4"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bdde552635so100855eec.2
        for <llvm@lists.linux.dev>; Fri, 27 Feb 2026 15:40:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772235657; cv=none;
        d=google.com; s=arc-20240605;
        b=b/V0Y4SRgfyIVqvfD5vX9LdE1xgZ+6iauZtai14eJqLV3yVTQm5P5WhNG8Ll4jWdxm
         dNyP+T8nVXYhv26GHA2uhxpogw8+/pnzNQANLLTb71obAn3O/4+JFMyoxqmdv1mENJSo
         r/hMB+4mdhBTJjOC5m4cmO3adUTQnzPDb1BM+FyePtMKLV3HjckLnOJLbjGjoz2GXzni
         U7xsE19dkXmnjKnDmwYVqYEZd3TQVFwKP608uPWc2Stj2/g/BdOaRxu/jFvYLoG1/iJe
         Bi9aL/rrzKxgUL/hH4D9vo3IbdNdPJxWzVV+hgutyXJTMF9y0VFt4HJbEmSnVy/Hby3a
         ZzOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RP8tg76wlCDecz2kC4LOkuQOl8f8t3SLtfXwbbGnwFY=;
        fh=+osfa/ezuuSfuuZMXmgz8ac8SZN09C5wygH0v9KJtT4=;
        b=GuE2I55KpUN3Y+rL2jKEdoPNz8iBq8H6uN40G9HjXf2iEYW/cuk50z0EnfyvsTbuBA
         CSvKH60OXYbz6p1gsLHUlpn/OZo/Gq8eL4qaxR8AgySMYx0qfEbxTv3g/SLk6whdb5K+
         OAINGYXUZicPmucDz9aBiNCfCj9Tep8DihSsYYElIkilsFIm2mcqlLlKSXE34haaUkES
         6pIIed8ofdoNip/6LcXD/HR84AGES5IbnSagxy96fXaGyTCg7mD1R3jXdVPZYAXI3ehK
         UzwqV8/rlnwKdkEzFfEMgollmter3sKgbg8rtDxdhK9MVXAyG9fpM5arHdboLLL6dXaH
         oEZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772235657; x=1772840457; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP8tg76wlCDecz2kC4LOkuQOl8f8t3SLtfXwbbGnwFY=;
        b=JFrFSSf4mHQoqob7ELIWo9fXyTknd8QobFiZiuTqvhIxdX++8B7Nehfqgd26z54Eai
         csgLaSPLQuaKYckM38Xlap2DV60E4GafLzJseir3YLfdgTBR3B3sjzGqO364U/GAmTwm
         AndOvU2OEVj0n4Y/fCws1CMF0x6j+7q+nED7WVHAqB4QCJErXWZmA4gVrcwZ4c9Zyh26
         v1GSiMrYwF04t9RHaahhuoI6vSPtm710+Tcs2EoYFMvu37kBiXtxCJH5hR/94W1YjCSd
         d2vMVGFXFMxKimj5qRfI+6vt1WFlLMu4+D3GE/LlTT3hgDVWrL6bIUxl15l02iisCOaj
         zzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772235657; x=1772840457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP8tg76wlCDecz2kC4LOkuQOl8f8t3SLtfXwbbGnwFY=;
        b=dOLMKoD16OQ4n4tNFqYVsG71n3cI309CCpGDag3vE9iZF8oxKdxUuC0qeQZakUrSl+
         EJVXSFR7q2hPrQg3NsTSfX8QZahg6pJmJJk9NLCjsRDXVHHlPalEeHv5JFezJuLGT3ry
         gXU1eLQc61ZQvBvGKM92FEQogxiEjcrTaDauDHjLcYUMx23ywoAP4wRZPAEJsqlq5dAE
         yKBgNcPkrGX/LZayngdJ8kiNcClw0a9TKRJysvKbcbVp02vVuxO4WWg4wG+XCdRZfQET
         mRLittGvONHiWK2Y9ooerG0/XQntXnDSmZna+uimxgdtfRJJqQPNugLwW6/Si5Q/Nuzx
         OodA==
X-Gm-Message-State: AOJu0Ywj9W7zIwVab7z/c3iJYbkKW2xbwa79rZbfnQhZZBeqEk4fmN9d
	ae4jk0YUK8GGaAz4FJ0YmhkZgM2OeykVwmBL6RxiYM9Lpjgt2vhx5VUXs1ifoRPElVNqWUCwteB
	I5pasPNVEP8IKi+vE/GDekQfYkFZZAys=
X-Gm-Gg: ATEYQzyv4c+8OnfMcfwrhM6KOmBp8eeBbJbHlXP44/1xGgcTD9b3Gt/UE4HjCr1v09I
	Hj82RS1GVL40A+wRtmlyUtl7vYXsnniCQKdKbmMHMen4xuglcLCsq05WyrNalhoyoULR/2Ur3tM
	M7YC+E7u8Fv+EkCRX6NlyQsBb6KNYVLEK6jFLCeA2sF6faJBjuRauke3gYDkt8xhyw/vBsMLbDr
	hJGS9pUmgxl5X59OPLEQhL0rc8lbu6z/1YUCX9AQwDoXNqil8U281/OPDRni6ruA2KuXCdqA7me
	PjPiN4KLCYrA/FdokfNNGJh5PwHCWyDj0nTY0ugI+Mu6R0U6NMM2kDJFVg0+HTIo+hXP9a7M7AN
	Ce5Xdj97XrzEcX2tahXVr8Wd5aLbN
X-Received: by 2002:a05:7301:169b:b0:2bd:c883:5f90 with SMTP id
 5a478bee46e88-2bde1b34c6fmr764707eec.2.1772235657148; Fri, 27 Feb 2026
 15:40:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260225014834.GA1284670@ax162> <CANiq72=d8c8GJEjPik5tv+LYPdFLiQOpArb1-wNck5sCzdOhkA@mail.gmail.com>
 <20260225201231.GF2755225@ax162>
In-Reply-To: <20260225201231.GF2755225@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 00:40:44 +0100
X-Gm-Features: AaiRm53Pl4cAP2CaQul_k1jDoaKgl9Jo2siq2shmJMczRWqBSNjXZQ9ZbKaPTSA
Message-ID: <CANiq72mE5QnejOQiNFpnLsPi2QJAUfUNiNW+GZcQtaLsCZ0kNw@mail.gmail.com>
Subject: Re: Prebuilt LLVM 22.1.0 uploaded
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2026 at 9:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Hmmm, yeah good point. I had interpreted it as "latest LLVM version" not
> "latest LLVM stable version of the corresponding major version". I guess
> I had figured CONFIG_RUSTC_CLANG_LLVM_COMPATIBLE would help prevent any
> problems and most users would probably prefer the latest version of each
> tool, rather than the compatible ones, which are still available. I will
> work on a wording update there (or just revert back to 21.1.8 for those
> until Rust has LLVM 22 merged).

Thanks Nathan!

Tested-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
