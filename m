Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0593619D8BF;
	Thu,  4 Jul 2024 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083481; cv=none; b=rGZv8HMsCiNQSrECsSpCj11Pv+CQWBV7jyTdZkdem2P5mwvMhajsTJtliWd/jRaiW7Sz0LR19R9IsvIBTd0EsjPFUspEh30815qE5EYEsXYNl8Of8tfaNCTAnjR2xHvcQY5fEKtMzRwTg0ylAXMfvvDYSXiqn8hwh/gXNlTr3As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083481; c=relaxed/simple;
	bh=aOTWjAAjIM94+2OeL6a+0ed6Veb+/3FeonvDApPAB/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TIwPeaBfoAZrJmLNOTet85zjfnsGPAa2JQ+n7BOmcVS7n86EZuQpcb85vo6/d/fJbluKCY0LVKaLfNgppOXR89UbBFbRpt6sDldhu5aGCWYHvbXhuqcGtPyytOhgSIRaQ3QwbF2WDZPtZafo7TlXvQvprEwE8GaIPXV+NwyazX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-643f3130ed1so3827207b3.2;
        Thu, 04 Jul 2024 01:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720083478; x=1720688278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+atf7BbdDqZ6avlCCGHHooOXIkofmq9N1hhKs6KZcR8=;
        b=CU8T+MnZqMkOawpciSXeiJsG95U2AhqAuazPtq8t19ZTA1eA51IZiPRvyaKwivuC9q
         kVBCYI+hhjGtKWF1UJ0DET0ZFUeQete67NL7Blr9Bfplyqia9hp/+DkN7xi/MmYIzQkI
         I7YC1IXJI8nJ117ua5GgmE0raz17SnHaEHL/LaE3U8hGClL9k489WaHc8jk1B2cxYc9b
         fBlXhaY1w4gO5I30grkPZeXBPXdPUKTuzFTEC+KiDkatJ+XBKgTPclDj46v/3BTLMqza
         4aYlRLT26OUkDoC5MymipHoM3mgBoIhQxiLk1CmgrOUbPkiS7MHsslv0gEhxYeZPBZXl
         Fglw==
X-Forwarded-Encrypted: i=1; AJvYcCVn6w19UYIofXbLc9PUcB+SKTVXFMCNr0N5Znfigfsqdx5DGpp9Agqts4sbIYZYWn0/5SZnxvXCDz0GI6hulcMdZFFsfE31/8PK28ERyw==
X-Gm-Message-State: AOJu0YzbnEvo1g3KzL3p+SCt04Z3Y7Xy0Eg9X0gLlyuLvQ8vCVLQifbs
	azrAd4mlC8ATDv1FO0SZ6lpwMlve5UWx1zVf8VMFH6eqZ/hOV5759JAuX7vY
X-Google-Smtp-Source: AGHT+IGyFXD+95yCsV50iJHLJpkvvb6OCG/Wqdw6LVm74U8+oE8FWdj679lkNDIF/hzv/w+FyQ2fSg==
X-Received: by 2002:a05:690c:f03:b0:632:c690:d991 with SMTP id 00721157ae682-652d6d9e372mr10834937b3.29.1720083477590;
        Thu, 04 Jul 2024 01:57:57 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-652d187181esm1340367b3.114.2024.07.04.01.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jul 2024 01:57:56 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6504101cfd6so3712687b3.3;
        Thu, 04 Jul 2024 01:57:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUii9mgwjoveUJvDD16/dsxDDHePGHfMKcBxfhphs99hSbyoefNE3IEceSY7LKhzuLMYOqomSnPV3l9b5d/mL7but4TKBQ90E7nl2LAbA==
X-Received: by 2002:a05:690c:f03:b0:64a:e2ab:be33 with SMTP id
 00721157ae682-652d6d9c2cbmr10875797b3.22.1720083476161; Thu, 04 Jul 2024
 01:57:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202407041634.GgIQlOpZ-lkp@intel.com>
In-Reply-To: <202407041634.GgIQlOpZ-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jul 2024 10:57:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU6Lzpmdo10jUbVJPnq0Q6dpF60L0icjJug_=WiUeY2QQ@mail.gmail.com>
Message-ID: <CAMuHMdU6Lzpmdo10jUbVJPnq0Q6dpF60L0icjJug_=WiUeY2QQ@mail.gmail.com>
Subject: Re: [linux-next:master 6880/10451] ld.lld: error: duplicate symbol: init_module
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Jocelyn Falempe <jfalempe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 4, 2024 at 10:54=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   0b58e108042b0ed28a71cd7edf5175999955b233

Aka next-20240703.

> commit: 294bbd1f2697ff28af7f036b2cb19fee78eb100b [6880/10451] drm/panic: =
Add support for drawing a monochrome graphical logo
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240704=
/202407041634.GgIQlOpZ-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 3=
26ba38a991250a8587a399a260b0f7af2c9166a)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240704/202407041634.GgIQlOpZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202407041634.GgIQlOpZ-lkp=
@intel.com/
>
> Note: the linux-next/master HEAD 0b58e108042b0ed28a71cd7edf5175999955b233=
 builds fine.
>       It may have been fixed somewhere.
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: duplicate symbol: init_module
>    >>> defined at drm_drv.c
>    >>>            drivers/gpu/drm/drm_drv.o:(init_module)
>    >>> defined at drm_panic.c
>    >>>            drivers/gpu/drm/drm_panic.o:(.ltext+0x0)

Should be fixed by commit 54be78446d0ac117 ("drm/panic: Restrict
graphical logo handling to built-in") in next-20240627 and later?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
