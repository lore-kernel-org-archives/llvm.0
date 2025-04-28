Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560261FC114
	for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837648; cv=none; b=iWxdCWT6Sdtymz3ncZs3PffTqV2hvPYpJcqp4IG41s4DstQc1DvVDyEWEamW9UtlJVgK1WH8pgVY5JrLnewc4fdc6cvPewA2MZ6dVSHCFTDmBVjFMFrzjgqruU+GrIGRDtb7e1LIM2KD9WhMbCXaaro42FRXFo+gYWRawjyStQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837648; c=relaxed/simple;
	bh=vJYYTWjFyBDX+IlkKzxTjJZfUn9LjHFj0wZGb1hpmMA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m/4Vkw7Btc07HMQr2vB9CvOi1soZRIVXjMsGrrRgahyLBqdAH4CM42hgoKYdeck0yFemyLsGMxgxFRXZemiNPPmUjO+UjAb6Ocac/Se3nfrHYqHxScrEHukNO1A8Ofr8mCY4KZ7CnltlDEwh3FkLZ6+GVtE+sh45wbznqfFvdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fbPOoBW3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fbPOoBW3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43690d4605dso34053115e9.0
        for <llvm@lists.linux.dev>; Mon, 28 Apr 2025 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745837644; x=1746442444; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vJYYTWjFyBDX+IlkKzxTjJZfUn9LjHFj0wZGb1hpmMA=;
        b=fbPOoBW33y6eOBzCJpUZ3dnAHfB4VAQ3LvnVCL/EkPlW4ISaqzucacn0IigOWVH6U5
         usLWHwu3MDyrjCOCqeF7J/kLPLYzuluSHcUv54RoWUMSiI0FriwkpZ+LV6SNiyT1UMIj
         TEO+JYV1n3fjGlgZS27OrSmlerJuI8goUXwlaXlaBKQnvxUKyuX30We4AxANPbGoTMO3
         4Nd71dOcDU15E0paKaiLOAS0+t4e8Zgf65LNcoYu6Xcz9qfSQ9DZLoUrT6J2ziClwSUM
         QhnomAnANl606K0c7tkxRSpZRr1RZ+TihT8UUUx53deN11y7ysF8nNpYUcum6DEtSV2P
         zW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837644; x=1746442444;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vJYYTWjFyBDX+IlkKzxTjJZfUn9LjHFj0wZGb1hpmMA=;
        b=hOCE1CTO5HuMr1skTk9mYHXWZESiIZsgcnUWCw5Q2kZxxxho0LL+9C3mlzIwAWfp7H
         8OWocEOh81TDVhMFZbJi8eAR4IXNqfRPKPMdfhBUrpe/namKNWrPUN4C/oh4oBKSOdng
         n78jyGW+fm7SeTC4EejKQ0YBSqALCVay4nOaK8g5Sg2MLKoZl/UpxNAuMWK/xnmOsQ0o
         9F86F6sua6/fUq3Gwmun0HnLw1oVVzBbBCGRZo9faKQLLpgmTc5TqjQfylC+aIAyGOSo
         32mMU9hctQUc8Pr1NY9BEwZ0ZQi+uP2WKFrQ8CFtoQn4CJ4TxCdR3vyU4lll3QYXgCq4
         ZnMA==
X-Gm-Message-State: AOJu0YxukjxncWRO+hzvpS4KpMEa/v8i09/cNmi7XPQUF022xohP0Kok
	MndibS3X4RuawbJeRwgAe7eD88lz+0gRDyiMXhqLGE7fNmJdC3nPAxQnq35lR+Q=
X-Gm-Gg: ASbGnctKy1TCfRn3JSzsJ/TfbKLLJ/fQu6h2d5ON5JrxGoTy5sKGEZ5c10RhvvwDodB
	kD0HVbiGrehp4akDjYNKc1md0lPrS4UMTSyqtjctxnXiG6xIM1DYM67oRw3lYHiu6mvAimY5TZL
	UghTz2mwJuzMGb77EGUfx78N0eOKDXUEG6KtLZ6yolWiqxG5P7gl9xgqM21uW0N1lNtKXAmx224
	7cadLWwdt0LTwKFwwrCMRL4CHoiL/LWx2/ltj4wvGPP6UH3I+bBHUl39dHSoONjXt27sxBamhIw
	CrweCxAPMmXOSkS/hGsG02acJ754wqhrLUQ80BMpzJ5O
X-Google-Smtp-Source: AGHT+IE5ALPDQ2XMbchs7dJLxyLSOiymC/SUhWH5ENA4v0SqHQ/mBm4J43KbUFaK+HBjkuPR28vHcQ==
X-Received: by 2002:a05:6000:4029:b0:3a0:8298:143d with SMTP id ffacd0b85a97d-3a08298145emr3587865f8f.13.1745837644433;
        Mon, 28 Apr 2025 03:54:04 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073ca5debsm10907346f8f.38.2025.04.28.03.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:54:04 -0700 (PDT)
Message-ID: <e377be676ffd2b6a697b39c3ab11007f5db53fb2.camel@linaro.org>
Subject: Re: [krzk:next/drivers 7/7]
 drivers/firmware/samsung/exynos-acpm.c:672: warning: Function parameter or
 struct member 'acpm_np' not described in 'acpm_get_by_node'
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Date: Mon, 28 Apr 2025 11:54:03 +0100
In-Reply-To: <3f0f7795-93dd-43c8-b64b-ace90cf26447@kernel.org>
References: <202504222051.7TqaSQ48-lkp@intel.com>
	 <3f0f7795-93dd-43c8-b64b-ace90cf26447@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3-2+build1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Krzysztof,

On Thu, 2025-04-24 at 22:37 +0200, Krzysztof Kozlowski wrote:
> On 22/04/2025 14:52, kernel test robot wrote:
> > tree:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/krzk/=
linux.git=C2=A0next/drivers
> > head:=C2=A0=C2=A0 a8dc26a0ec43fd416ca781a8030807e65f71cfc5
> > commit: a8dc26a0ec43fd416ca781a8030807e65f71cfc5 [7/7] firmware: exynos=
-acpm: introduce devm_acpm_get_by_node()
> > config: i386-buildonly-randconfig-001-20250422
> > (https://download.01.org/0day-ci/archive/20250422/202504222051.7TqaSQ48=
-lkp@intel.com/config)
> > compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project=C2=
=A058df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250422/202504222051.7TqaSQ48-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202504222051.7TqaSQ48-l=
kp@intel.com/
> >=20
> > All warnings (new ones prefixed by >>):
> >=20
> > > > drivers/firmware/samsung/exynos-acpm.c:672: warning: Function param=
eter or struct member 'acpm_np' not described in
> > > > 'acpm_get_by_node'
> > > > drivers/firmware/samsung/exynos-acpm.c:672: warning: expecting prot=
otype for acpm_get_by_phandle(). Prototype was for
> > > > acpm_get_by_node() instead
>=20
> Not sure if this was result of long holidays or just ignoring this... if
> the latter then: please always respond/address somehow bot reports.
>=20
> I sent fix for that, but in general I expect active contributors to fix
> their own patches.

Thanks for submitting the fix, and yes, I was away.

Cheers,
Andre'

