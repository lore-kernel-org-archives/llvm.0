Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2412DAFB4
	for <llvm@lists.linux.dev>; Fri,  3 Oct 2025 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759517055; cv=none; b=ueTkNqz1tp1W2j9wTi4IyYE4k7GMP4yCrmlVGwI/1j3w6bKK3U1Gsi1PibKoHX5L/2kXCVR3DPrkDVGKpFznPkOhOaKFc1PrgUapwncdMDlTZZ8u+wYgVDpbHlp7okZna+qU7vDhCM3uT9VmAo1cQSGoWycOG4y1DA7LHB/rPcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759517055; c=relaxed/simple;
	bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Noexfu/LHBa7I4xoYHeFdM8O37cNt9fiCaqkDmxWZ3+diJj/nRISyMii8sDYSN5D2/UIRmDDYDkivJcK2O8Th83GALpskBS+/zsmXgnuBaEP9CpZxj1oVe3viLLnepx0c11OaKH2FBz67c6Iy2rfjvlddzRndLtoZ2ElJD1Q9sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAx1fL9P; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAx1fL9P"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5797c8612b4so3322159e87.2
        for <llvm@lists.linux.dev>; Fri, 03 Oct 2025 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759517052; x=1760121852; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
        b=TAx1fL9P14dgpVrRH0EaLzCSZN1vozgqqtzrYo/CkgEegEw+F3YJkH7zJVMe5zvHKj
         GclnUUeBuiQ/dfTyM3ziehAXsvkZGHi3bfm6j5H1tOxU8kRllNeYCXmgjYmOo4TBmXHi
         +pI7gNSbXcTGxyeD864rHRaODpplC7H6HnXCcHMc7tafs+uZXUG3za+33qEC1b3NNn9T
         zWnfB4WapSBVTlnRzm4EKavhhXxKUG9ofSFriLnLmeI2DhK8OdWCEL4FNOHRCq2D9kw2
         IZjvUgidYGm2zVgohItztzF80vj7s7E0MlPWGo7O8T8s6W2Xy1+6XrtO+7biiqztHPri
         mHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759517052; x=1760121852;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyuE14DxlDz2HfrhfyleFTggC3yW/RUkLxL0tsrQ6XA=;
        b=lrJZ6S/9HlM732s8OKakt6B5PBV7Y56A7YbpMbJ3nTiBILhfCLqIFHM2JBdoOJjtZo
         xZgOThJkg2pYIZyRYWWDPSrpfe4RJkTh8/Ph512O4SVf09RWrWVBUhm2+tfS5gZpMdUm
         YZYdgYZD5BiMxdd/7GA3gkORdELl6MUoGtwziMzj+Hel8NqYbGkW28CP3AT2+Jcu+paM
         ZOqaxHX2tt9vNhLvc6NB13YR3vvmcJ/OpNB+Aj7QedykCMnOe4jbpZoFZ+SUejbox7pB
         TRZt/iuWHB63FhguUY6NpqQGfUB9Dc0CbTjaMmNdZbN97o2L7sagLUfWRvEatRoMw6zP
         hflw==
X-Forwarded-Encrypted: i=1; AJvYcCXjUy5fSnmJPB4hgloBGdcLnRefXyzexiClZG+WOumjQl9jumkwu8AlpVR2EszcA600pisd@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7+3yuw8G4bWYe5bmuRyTgPl7DgF0Z/1UcHjCL12QXTCsEr/Ys
	KxAyi5WmryvOcEYRGG2Rr/2f7/lqwaHyrGeHNkcRGp1I8dV0d0e7ldvTpsMDmVPdyYKh7LHwmGZ
	P9TSSSMtTEEY0O9OZzYzNcXSzUwjuxy8=
X-Gm-Gg: ASbGncupmDloW3ncofKpWzOu6pOF2WBSdukhAKfG0Zuj7cOFCqA1gPb82NIgQMJGfgq
	rEroAN8yYBCyzjt2WPtiSFHaMfedZDUnyYdqzBwqiIeN4iXi22U8k2mtbB2m7NA0VQ7s4C2RHLc
	9noR/fSsCZVvAwHkatd3qM5XU7E9+TpOqAJxmo9djoBopzhm+c3yJ/a9jT3Wt1DDTGU9BS/mfDG
	tsk3+U0xkS/M1Gk7ihY4HDpn+sOL19Sp4uOpVQoIE3SQzk4toGwEUtTQwMl/niOBrD1t0Dif3Ti
X-Google-Smtp-Source: AGHT+IFGjI23yu+zZGYIIYp5GAvADK1Td8K5f92lbt6d4punv+uO2Xi2qzgSwr+Eyr8h+dgbxKZKruLqIS6Oqk0H0Go=
X-Received: by 2002:a05:6512:1245:b0:560:9993:f154 with SMTP id
 2adb3069b0e04-58cbbdd8224mr1238522e87.35.1759517051928; Fri, 03 Oct 2025
 11:44:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924175743.6790-1-hsukrut3@gmail.com> <202509272320.3K8kdDCw-lkp@intel.com>
 <bb9d90ca-aa4d-4168-bdc5-543109c74493@gmail.com> <CAHCkknrZ-ieNKeg-aj3-NVqgGSk770jJpUpCvn_SuffkPu+ZrQ@mail.gmail.com>
 <edccab86-321b-4e6e-998f-3ce320ee0193@gmx.de> <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
In-Reply-To: <41ef536d-2399-43f8-8041-c6b0e642aba2@suse.de>
From: sukrut heroorkar <hsukrut3@gmail.com>
Date: Fri, 3 Oct 2025 20:43:59 +0200
X-Gm-Features: AS18NWCgP_BX7ybrXY0sJ6ucNdQs1TMwDO0SWiLqnHgEzd_63diU8v-qea2nPRE
Message-ID: <CAHCkknrAKGxzAYE-R3QX20W4faR9Wfjgn37peyHRJcZ6PRLENA@mail.gmail.com>
Subject: Re: [PATCH] fbdev: udlfb: make CONFIG_FB_DEVICE optional
To: Thomas Zimmermann <tzimmermann@suse.de>, Helge Deller <deller@gmx.de>
Cc: David Hunter <david.hunter.linux@gmail.com>, kernel test robot <lkp@intel.com>, 
	Bernie Thompson <bernie@plugable.com>, Arnd Bergmann <arnd@arndb.de>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Zsolt Kajtar <soci@c64.rulez.org>, 
	Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>, linux-fbdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Oct 2, 2025 at 8:52=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi
>
> Am 02.10.25 um 08:41 schrieb Helge Deller:
> >>>> kernel test robot noticed the following build errors:
> >>>
> >>> Did you compile and test this code before submitting this patch?
> >>
> >> Yes, I had compiled & loaded the udlfb module with no errors. Please
> >> let me know how to proceed in this case.
> >
> > Look at the reported build error, which seems to happen in dev_dbg().
> > So, maybe in your testing you did not have debugging enabled?
> > The report contains the .config file with which you can test.
>
> Can we rather make an effort to remove the udlfb driver entirely? A few
> years back, there was one user who was still using it because of some
> problems with the DRM udl driver. But I think we've addressed them. The
> discussion is at [1].
Should I send a patch series to completely remove udlfb, since [1] echoed t=
hat
DRM udl driver is good enough?
>
> [1]
> https://lore.kernel.org/dri-devel/20201130125200.10416-1-tzimmermann@suse=
.de/
>
> Best regards
> Thomas
>
> >
> > Helge
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
>
