Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D404D376;
	Sun, 16 Mar 2025 08:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742113743; cv=none; b=Luih2JMpKCRhfqMltVUHTjmC7wfoSUMDkMJ7l50uYvmCz2CCUZeINwX7ZkMo1W5nspdNQHYA2wz5LWq0L6Kcy+3OdhQanhJfu/abW2neL0TwS9XwGfbP2hgu92I9uWp78gdfTZdUO3yEQeJkLivlbcQLMyuU9aMldNp7pGVvcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742113743; c=relaxed/simple;
	bh=hKq+x4v1vav1ivExe/fQew/Nnfonc+W+e2Y5jDHc92s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dYDrHppNigePTuHkvbjNcvhsYBmpaPoXs6fkzGP60ReXQg4DUVvK+zOdsdRUgiFmezhC/BHdmo2VYs+GtgdRyy8Kob1kY0MK0RgRWH2ETJBBv8EIe2H9tHT5ykw8hiqGf+juGfDjvzMS3Q6GIPxp13hhqvBZ9svl+zLh8pa8Oqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDrBIT00; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDrBIT00"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-30bee1cb370so38370901fa.1;
        Sun, 16 Mar 2025 01:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742113738; x=1742718538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIZQbPcexVvBojT8YTCfGtYY1VAlpntzAPCe6NkzrRE=;
        b=GDrBIT00O5KSYIi76hG66w+UXIj974fB5Y8QqslO0+ajH/P3UA9oZSscYcV3c6nEap
         NNqQm6geC04dtyfhzcOS9NzvbTzaXXSYsF45HIHZ6LhOJvnR1PuHa2nUa45ipgzKZ2Y+
         Uj4IIuf2gL/EfbaQUPARF6Q0+eZKgwzf7xPfv8oCxALtzs0DI4Fm1m6EKuT/wyJHmuei
         sU5HwQg6dlhTOiprqSvW3LYVyt5gw3J58f0vnu0fUEeg/H3KHOKJrYZqKmWpHEfYNhCS
         aJY3FFsUhbOdt9L4huM4ptbsS6UW3+wm1J+4nn/ssm+xr3sp7LO0lTs93GKfw+/AjJRD
         v9aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742113738; x=1742718538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIZQbPcexVvBojT8YTCfGtYY1VAlpntzAPCe6NkzrRE=;
        b=rTtOwPmrSGYnQMhwT6zo+r1yn6QWDR0KDp45xfPxqxqMovhbKMUVP2LZn8plQv2RN8
         3DbsElEoLjnoVO8Dv3IkeerqDwdpSHhd+EI95Uda3qBNA7NlWAYClxT4vys+loCqLi+z
         XD4bInoGEoS1gRYbUwq9oZoUHkdFVxTfCL/qzi/fKliB1NdQTO/jzbftpxMLRM1HfSpQ
         OpkTyn/vSzXgt3j+elWxlhyFC3aOSYXyjiMaiJW0hvao0MJeHeW4Jf42a6ozAqJWOHbP
         NJpWF9imDS8uAwAsUw8CfoujL3msgbdRncWWcRr+U1cx8OkU0LAjO+oJ4usmP7OHv5Bo
         bYXg==
X-Forwarded-Encrypted: i=1; AJvYcCWI0NlnQE6/bdmOemr6aRgwHsx9SnvxQR57t5FlIHvbyn6iicuBT5QrgxXQz8JrxLjTlfsI4HBNdxEdRghi@lists.linux.dev
X-Gm-Message-State: AOJu0YxMM6VuRAbjJYNahm6nDM1T/3Bw9f6sp6hIBdB69flyH/5a+fC3
	SN/MmKno6inWcml7LeJO5rEVlYGSJrfTaQfLWKXAAVHgOvD2IahvlybH5fXk9s3+SGpBKYoFTHk
	VKFAub4SfWoN1qYmCebJ0bEHr4EM=
X-Gm-Gg: ASbGnct4+BOCFVReNZk4hMWBuBihIgCbPO95Mf2svVY8WclwBQU/c3TzQp0f2+zWl87
	adIAWc9uar0Io0Tp5yYhfBSWh9dYwgIRx5+pNQU0NFdgT8KGj/C/BppImXU7GwZ/gr7dhojV7MO
	JQMc5NC2jM5XtQrl8GMLyXs6cFcA==
X-Google-Smtp-Source: AGHT+IFdwjZqCm2sCMY/k3IL7LluYqZ2yTMx/Ut7uhZ6chnHoW5eJmN3Vjni7pzHJvh0FA6icgWt2m1aji/LrswaGmM=
X-Received: by 2002:a05:651c:b06:b0:308:e5e8:9d4c with SMTP id
 38308e7fff4ca-30c4a8d9084mr31414571fa.28.1742113737494; Sun, 16 Mar 2025
 01:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202503161004.ZmMcxxeB-lkp@intel.com>
In-Reply-To: <202503161004.ZmMcxxeB-lkp@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Sun, 16 Mar 2025 09:28:51 +0100
X-Gm-Features: AQ5f1Josv-P203gDTLctoTjqQY4gg7qjJdoXoDgghTVv76G5CY2BxWQ9DsMee-I
Message-ID: <CAFULd4ZX5NvpmvrtSQzz=iBQ20AGZqR2PSMZP4p7PrzE4qNJyA@mail.gmail.com>
Subject: Re: [tip:x86/asm 3/7] lib/test_bitmap.c:1269:2: error: call to
 '__compiletime_assert_279' declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(res)
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 16, 2025 at 3:52=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/a=
sm
> head:   9628d19e91f1ef9e7b1321e74a88bfa646d2a8d3
> commit: 01ba23bf1b3f9a4035faedc2aa450e251bcc2c7c [3/7] x86/hweight: Use A=
SM_CALL_CONSTRAINT in inline asm()
> config: x86_64-buildonly-randconfig-003-20250316 (https://download.01.org=
/0day-ci/archive/20250316/202503161004.ZmMcxxeB-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250316/202503161004.ZmMcxxeB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503161004.ZmMcxxeB-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> lib/test_bitmap.c:1269:2: error: call to '__compiletime_assert_279' de=
clared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(r=
es)
>     1269 |         BUILD_BUG_ON(!__builtin_constant_p(res));

I fail to see how the referred patch can cause an error in:

/* !(BIT(31) & BIT(18)) =3D=3D 1 */
res =3D !test_bit(18, &bitopvar);
BUILD_BUG_ON(!__builtin_constant_p(res));
BUILD_BUG_ON(!res);

Otherwise, the patch fixes a correctness issue, so there is nothing to
do with the patch anyway.

Uros.
