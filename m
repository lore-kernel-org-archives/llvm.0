Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651B82C190;
	Tue,  4 Feb 2025 15:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738681212; cv=none; b=BefogJnGMZm2YyYohkAOfbOTbQJVyGTOMKlhQF4Wc1RxHwaMMKEILbrxeeJzCmas1QRovd8tqRqNArA9jsAJPtQFAYHiq5YjA7WTs/b+4Yi0cXSKMl3gLUGXPC9hBxqEtbwGjAemvbXcwfkz+hRy1hvr0TdghwQl/j2Y6pR0DuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738681212; c=relaxed/simple;
	bh=m5TPFTKYTT+MlkUuqYtRI/WobOBwN8Guhvqco2EajnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jfylJFCKPT0IeqsMSsesTQV/SlTH9poElUUXNzKM251bIb+HMUxoM58NtLIRBQGNeroKIIsGZYg1JcDi+p0xcCbhQaH+fK2O+X2jIUf8hTayNnwIr1F0A3asEiwfmp/l3KlKk8S+IDc2eXf9mUfhcVMQt30UyshW48S4zCEpWJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso1343813e0c.3;
        Tue, 04 Feb 2025 07:00:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738681208; x=1739286008;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqtXXncgUB+ZsCHk40fUqdlhk/bIMSUEfJI7WLAn5Xc=;
        b=OQcxQSL0E2mmr35VpXhgzDFRCkMe8NVRjngTM+J2EDsWzOrKE1IFWpx42YyZ0jM9m2
         T2z5yc3/lOL54qSSWd1+PohKKqZdNKe+z5HTpzxZ/s3j+qU943fSW+A97VE0YYibaapC
         GxhUj75qHvxrf0VZUu6ktdlagwn5JT/FuzFuwU0LVconSagGL9VwZGtEgNOFRQ2dT44E
         BlLbPqby1Mt8r+KEtHRSl35DJnQ9/SfX1jrtw0YjCsLtAFpy+2Qc2CYFQGFcG0dv1n5a
         U7jtfS1pGthEyFfR5Q31mIq29rRpcG5MPBrxmeBq7l+UY+/Zto6q78Lagn4KZcqcoVv+
         vptg==
X-Forwarded-Encrypted: i=1; AJvYcCVaXAdpQNLPbDdH2C4EL9cTimblm7TzR/WWrzjSfEiioQZzVkcF+xnlyeuFEkv1xV++YKR+2i9Hmsuks2qQLw==@lists.linux.dev, AJvYcCXRUR6z+4i79h5jr88IJzpRZ0nD8wlPWypFFDRxoPPXLFeRaxvukkXnq8PfgcOcuo7P3il8@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+U89FduqBu0ccpFhUoojIDBOq0GDYh4LM9tfRNwX50zw0xmIz
	KZ/lnwIgise6EAuwqFtKuC7aS/VaBsecyiTs+yQjB5ASNIJrxunRGM971AJm
X-Gm-Gg: ASbGncsTrhFt9IsBlj2hIotx6D1AxTP8HgP4qCTxZeJAeJHsgGv1Qo68rVFYHEOPu5Z
	moPtlaZVpZzXLwyS35iqgYYAwgdnGvIJ445Jfpv+K+VD6ibXkjQvnlEvpLx37xGq/nh2KSLJZhb
	nU6tlam3TRAPDOk4viVjhdKzoIKbIleaZyhNsG2rzWEhFB8YudPqajIn9g6PthrbATUubrjNxRc
	di67ThpXVQQnFhliFhqGpYjsovLCer1sAZvsLRXcH3nfBr3d359CYQJU4+rB5mGYkUcxgGxOtEt
	/82wfq7fpObU8jZGdBU0H6E818n3BHj/A6j4NmS06pasOQ7dZxA7PQ==
X-Google-Smtp-Source: AGHT+IHLBEHufXzatWSsR3OdInY+9GEgGq7MO0FUtvmMkDMsxOy7lnwPF9Lgy6hb7UV66WTgAGRj+A==
X-Received: by 2002:a05:6122:d87:b0:518:81aa:899b with SMTP id 71dfb90a1353d-51e9e4e2f3cmr19887333e0c.6.1738681208560;
        Tue, 04 Feb 2025 07:00:08 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51eb1c12174sm1515394e0c.16.2025.02.04.07.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 07:00:08 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-4afefc876c6so1645943137.2;
        Tue, 04 Feb 2025 07:00:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUz5IRj+Ms0dvB/7uenA453MOKv5UqU21ZrDxGzhWy/G2/SaaAHxmj8kA7iHl5K3X5+9Kfu3BuaLlv1/4MXsA==@lists.linux.dev, AJvYcCXRnbaigyS1C1xGL3/WoNTUlw4pffdya+lkESCRHJasKMtPSYdkI+am6oMZ9E9I/mUJVvcZ@lists.linux.dev
X-Received: by 2002:a05:6102:5488:b0:4b2:cc94:1877 with SMTP id
 ada2fe7eead31-4b9a4f8ab8amr19032147137.13.1738681207991; Tue, 04 Feb 2025
 07:00:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502012258.KCOVEE5t-lkp@intel.com>
In-Reply-To: <202502012258.KCOVEE5t-lkp@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 4 Feb 2025 15:59:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUi8faCPsd5-bdG0ZR+DOZ-S212ZwRYr1LYZ3d3Vgkuhg@mail.gmail.com>
X-Gm-Features: AWEUYZlFVOU6yWQRsZt7YUAWBjWBvjKPvD2bsRlL8hENOpsDwBlAPuOeUtdcetY
Message-ID: <CAMuHMdUi8faCPsd5-bdG0ZR+DOZ-S212ZwRYr1LYZ3d3Vgkuhg@mail.gmail.com>
Subject: Re: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:539:21:
 warning: use of logical '&&' with constant operand
To: kernel test robot <lkp@intel.com>
Cc: Pawel Czarnecki <pczarnecki@internships.antmicro.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Gabriel Somlo <gsomlo@gmail.com>, 
	Mateusz Holenko <mholenko@antmicro.com>
Content-Type: text/plain; charset="UTF-8"

Hi Kernel Test Robot,

On Sat, 1 Feb 2025 at 15:55, kernel test robot <lkp@intel.com> wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   d063b9bfd84d4ae32eaa664cd7b8906d1e5a4265
> commit: b3db33d374f80bc6db7c611301e3290cec95fee2 [14/15] LiteX: driver for MMCM
> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250201/202502012258.KCOVEE5t-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502012258.KCOVEE5t-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502012258.KCOVEE5t-lkp@intel.com/

Thanks for your report!

> >> drivers/clk/clk-litex.c:539:21: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
>      539 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
>          |                            ^  ~~~~~~~~~~~~
>    drivers/clk/clk-litex.c:539:21: note: use '&' for a bitwise operation
>      539 |         mul = GLOB_MUL_VAL && HL_TIME_MASK;
>          |                            ^~
>          |                            &

Nice catch!

All four "&& HL_TIME_MASK" should be changed to "& HL_TIME_MASK".
Gabriel: I guess you don't need me to send a patch? ;-)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
