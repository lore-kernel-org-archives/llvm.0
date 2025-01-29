Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E706E282E1;
	Wed, 29 Jan 2025 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738154778; cv=none; b=ObxYkDXLbMv9RSbnoQrT4NB+Tdp86ti7QItCs3o3TFd6/ouSzccpTdB1CkDVbco/SlLvqCwAejCAtrv6szOhH6AyJmkzKg/kGPyjUt4wu6OOGGvC61M0q25kYEG57V4hipFyGvkpU3QsoTxZi7v8lmzVigVW/Qk0anOcdNGMtHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738154778; c=relaxed/simple;
	bh=mJXAzZcYXVGbKKim4w+Ugc02y9LGQ3h03AG1TdUc3kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3TLOLcho4b0mRokFJiIT2jXtWuSa4FrT0oRZh0p4C3xdWCUvrDos8KiVjsr2ojN/VBOlCun0hkjAinKCfKDZNS17VqIploih1Ki6g0U1T/8zBLkAi8UgOXMwyKCnh00dZXNZPBG18oqfEwNQm2m9adUF9lyX3n+uQFR8IeVRpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j/GIOI+5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/GIOI+5"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaeec07b705so1291409366b.2;
        Wed, 29 Jan 2025 04:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738154775; x=1738759575; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri6V76cXb510WW2IY9bF+M8FmeQ+6SF+O7wuEcfgkzI=;
        b=j/GIOI+5JjlwzHIc+tXQe9/e3JiGdUQpmfQipzhICK7ke+BEg8n0nzly9x1BKp/NSH
         zuqrO+fTMTREo3CUepZ+/po8LrhXRm2vsD9KdLS97YMHfl9DYeT+0bs7lSzEadLZyguK
         1mVQrIOlaUjG3YJDBx35KLGsKJAX7WxBHIkVk795NWxaFv1gAaf4mQ/DyGjiOjhmFeL2
         uijU4ESKJYuXrH+MjPOd5aUq/CbbPIFFVh0xEWfuOkntkm1j1YkzBEPlLO99PEp52Y3p
         XjpEqIcY0bCTZK4+WMdhoiEWYqEDkWL9C6xMwBBsFe6wPg3IssiiGLlTQbflDsHgFNN/
         U1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738154775; x=1738759575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ri6V76cXb510WW2IY9bF+M8FmeQ+6SF+O7wuEcfgkzI=;
        b=wr8ojadixl5xXVIuCI8HWV6rwOTjLwh4x5IqHlTu+21ddhgnog6NlYDeGp982UCXMg
         cZmdOpHQvBPxLSu+SjVQ92kDB1EKvDLGwXkIb/eKbz2hv8iXf+p8b5FkeKyLFchSrutQ
         rneuByaj6EdU3XEy9uH4siDXObXgBXD1lXCDPg6kcoicRBufnX5wgOWoI0dsm+noxrSi
         8ILD3BaDLdxZMnL6a4v88lZAoAUo+FPeIwkD5qG7Mzujc+NlNxIX+TyfJtk8y0lCQzdG
         SlQAH5lGN5/vsdZk960t7uc2gK6vViv5mgeby+6HAlykHoEGfs4co32qjwMHZT/nECYC
         y12A==
X-Forwarded-Encrypted: i=1; AJvYcCWYPbYw9cV7+e5e5sL/JpUIQD23JaKAxnAbNrr4p2w2FDhckeav/bbrJZOyJq2YxzDRoFTI@lists.linux.dev, AJvYcCXJmzTI71NhsRfmBN6XuRhqtYNcP5j4Iv/7Smayw9D0t0HKkWIEPquWPaXl5YJEYh7xlDqd9sQNWWXslgLPJg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzEwudML+MYii10YJQgVMWFcsqJFZak2wS6ja/PaXGV5o0dubK/
	0QKwe1hoNcH6hSunTiFdza1RsNbfyotlc+jnLtjjnNJ6vRLt+/n/K9hj6n0SQy5L3f3bYRs2HGy
	0Bl3fKKmN9EOQm01GSQU8kjTGVr/f6Ltpd7I=
X-Gm-Gg: ASbGncuHSVZq+5Hj/XTAUULgR3ENhoWUB5BCgOoTKOVIEHX+3/7VKbBPLA5nJtb/Bef
	H/mVDSXXPOTXKUJPqivruY4X+Z/eCOwCFB9nUxA1sn2IFn6VYxn7vNFquyBKarqX0I5jh1IE6m8
	g=
X-Google-Smtp-Source: AGHT+IEXn+02ylyTziloMnp//Sg+0i48Mj90YqwEPfujo9MaWCbUGVs+XJ+yqlLwI1qHlFqqlswOXNioO/n0b6N8GAo=
X-Received: by 2002:a17:907:3e0f:b0:ab6:52d9:8cd8 with SMTP id
 a640c23a62f3a-ab6cfcdf2c5mr261520766b.13.1738154774808; Wed, 29 Jan 2025
 04:46:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501291646.VtwF98qd-lkp@intel.com>
In-Reply-To: <202501291646.VtwF98qd-lkp@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 29 Jan 2025 14:45:38 +0200
X-Gm-Features: AWEUYZm1V42TtYiTOCxOoWXEIpT60OE807NzfHyKW72HlU3C_eL6EOCG0phwOhQ
Message-ID: <CAHp75VcOYyVx=wcopvi-0iA5XePsGOrNO1wUSzYcYB4q86=7gA@mail.gmail.com>
Subject: Re: drivers/platform/surface/surface3_power.c:243:2: warning:
 'snprintf' will always be truncated; specified size is 10, but format string
 expands to at least 12
To: kernel test robot <lkp@intel.com>
Cc: Maximilian Luz <luzmaximilian@gmail.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 29, 2025 at 10:09=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> commit: 85f7582cd484dbf491b6d9bb2af6ef1467a024d2 platform/surface: Move S=
urface 3 Power OpRegion driver to platform/surface
> date:   4 years, 3 months ago
> config: x86_64-randconfig-071-20241231 (https://download.01.org/0day-ci/a=
rchive/20250129/202501291646.VtwF98qd-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51=
eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250129/202501291646.VtwF98qd-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501291646.VtwF98qd-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/platform/surface/surface3_power.c:243:2: warning: 'snprintf' w=
ill always be truncated; specified size is 10, but format string expands to=
 at least 12 [-Wformat-truncation-non-kprintf]
>      243 |         snprintf(bix->serial, ARRAY_SIZE(bix->serial), "%3pE%6=
pE", buf + 7, buf);

3 + 'E' + 6 + 'E' + NUL, that's how the compiler thinks about this
formatting string...

>          |         ^
>    1 warning generated.

I do not know how to properly address this because it's false positive
due to the compiler not being aware of pointer extensions used in
Linux kernel. The w/a is to increase the buffer if we can, but is it
practical? OTOH, this warning will be translated to a compilation
error in case of default WERROR settings on `make W=3D1` builds which is
also annoying to people what want have that clean.

--=20
With Best Regards,
Andy Shevchenko
