Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27E713AF2
	for <llvm@lists.linux.dev>; Thu,  2 Oct 2025 06:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759386968; cv=none; b=li1AKNKYhDRIZDHsxGA4QD90sgqcQVyHy/Gmb5b2KpDkUYpGf6QhUmTRjGNLG+t3qW3lSF2eVm10YMP/wOjJ26cruCJNfrbcdxiaBGLq7KIcsSXaV4zwsq8/8ZgYipMaI0anpmQx4eKR3bYXN7WoGb4sWVnCH9anEAYtIE/vSOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759386968; c=relaxed/simple;
	bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l2S3pj+pM16Pn9S9WJk420c/9WQijwZ1y7oXvwzaKqFqkJaJyQF4tqoC2/34pNAAuOALaoy/2CIL2/3Hr/KUyFUPCzy9WCEei20MhCPsIYYzjwTz8xWnzsFQlu+q1n8b5CE6GfeM1kpgZD1hgWEP+JiuCzL9kw8vazudoEgyyxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlemI/mQ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlemI/mQ"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5688ac2f39dso784841e87.3
        for <llvm@lists.linux.dev>; Wed, 01 Oct 2025 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759386965; x=1759991765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
        b=RlemI/mQrWJ42vinM7wVZf7CUdGbddI/QK89+Xm79aB7+MUq0GfTaCSoEmwfiGhtUf
         /r+ABvv58pndTnr8MI8uChShP8MwvjJhU+0UXTyPBkUBCtnaSQvxt8ENO1AwiuZ67tCd
         22RbEimVgz0VJENP7L9oPHM1r1zhkp5d8S04k6tG47PNitoe+E+IfYItGEeo/jx20djK
         NRWgnPojddfaFSj7CbQWMWLA3DVC3PVWMJhxjiKzNAvenDgH87aBWFLxDplHYaq2Oc5e
         kr7DjZNBeGIelQJhVRW1trHzedNMLxFo7Zt7Pon9KnKUBGECNKJkNmg8OfEtbmm8NZpa
         HJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759386965; x=1759991765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+JxJRHM7RKVe2VKLf1OZeMJvur9jkhqQvZ7AlHIqtmE=;
        b=o1EgDgOBsldcH2kudw2+A1nPH/VQpq1EBBAht/emjgL3kWLhYFKskkL9irfBCm6psE
         zOFUQX2upS3Vs30kcbE/DS0yLiDjDGpCK/pbcYi9a9u+dx5Jb1+HkglyZCOryD50PM2f
         LZG38/6ZhLjvLMvUopRzMVRf2otRObwlZTTrecSFTzayvulsw6AW+Cs3YBSKirNWt5A7
         wJo/moFp9SOzTP5/EvfcEEopTVaCqk4+wsa+SMYBLro5sxzmHYVlwDu/Kv+v0ZjEWNh1
         uXvGIXjPvR9vEM5YquJ52EQtVsLNZVDU8EKjdCZcpUK8iUsGerVzgqmyMwA79M39wBFk
         1EAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWS0GKXbfGJ1d18XZ1QeAg95+8FFDW4cALmHeiL2UqaeUXLI5eqvKM4s0VLesACBfm+gKmS@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ3X6UoCHyqQRxdJvNQ9VfFlmN7FXKjZqGM521XwjfF424fCkn
	PcK7zsf1WC3M5moQ47PTEPYtIX+sWozbPcIQEqaBM0zhdRxQ3N5UPlo7pFreR0ru8uev6BKjEv9
	uf/+rr2NvMnL4Nzzn/YAOpuCg7iiZgpw=
X-Gm-Gg: ASbGnctRgPLVnVpJJL9Octk9KeBCGYEXDeG546o9UkzE62R4EncUzoi03EeOzPV3ps5
	Ba4XPpevOlmKjjhU/dCsxPsieNfNS2ieVDkpVe6HFHpCO9icAkP0vBjzB6sBBaVd+6Mo2yL3pFp
	Za4FiWCpOIH9xchKZoqyuI+ZNf6c6iu2RLJCiKxzaO2aXGei+3UVAHqhnUPfzM1hKC23Cqkf24M
	+mAXjFBZnp4RJVypG5J4zwfS7nYLkSKWTmaROFobrqQPREZXXz1u6qedi8114S/sw==
X-Google-Smtp-Source: AGHT+IF99G3AYiAUEQrPtjf+2h2PSZdL5Ih8yjphXmvu9P7cETElAJxwS9A+P9E5rAaBZ1LwUTeNFcGEcpOdmxasB90=
X-Received: by 2002:a05:6512:3b8d:b0:573:68fd:7ad2 with SMTP id
 2adb3069b0e04-58af9f6b129mr2083801e87.35.1759386964675; Wed, 01 Oct 2025
 23:36:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924175743.6790-1-hsukrut3@gmail.com> <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
In-Reply-To: <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Thu, 2 Oct 2025 08:35:53 +0200
X-Gm-Features: AS18NWAtwoESXok4b8-OK2ehiGbNAGs6cVgv71Xx2MQ4h4uKtcLLpvhfJQAkNZ0
Message-ID: <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: David Hunter <david.hunter.linux@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Helge Deller <deller@gmx.de>, Bernie Thompson <bernie@plugable.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Zsolt Kajtar <soci@c64.rulez.org>, 
	Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,
Apologies for the late reply,

On Mon, Sep 29, 2025 at 1:29=E2=80=AFAM David Hunter
<david.hunter.linux@gmail.com> wrote:
>
> On 9/27/25 12:12, kernel test robot wrote:
> > Hi Sukrut,
> >
> > kernel test robot noticed the following build errors:
> >
>
> Did you compile and test this code before submitting this patch?
>
>

Yes, I had compiled & loaded the udlfb module with no errors. Please
let me know how to proceed
in this case.
