Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5376403
	for <llvm@lists.linux.dev>; Thu,  8 Feb 2024 13:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707399329; cv=none; b=I408Kaq4j4lZPnbMnRk7yM0quqvt3D2GFAMWPjtZ9JclLuDDvZ0cRY+UoCVheoOwmYRlgqIormhTgOSJFuVG4LhWY5N6wtI9SMekYvWToW0wQBhxR4jL8NvR1Rqfgt2vIcul4rf5l3iimk1xfDcFxGyfCpQNjsrqYZBPscKcqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707399329; c=relaxed/simple;
	bh=2h8Chmu0bOFl+lqBM3CEpFhy+LcorAhDE0bSby1h7vA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CiaIXloPNbIHv9XFWmJY2kGPaj7GarEMZo9/96TkZfdtaFWvakUZqXIX//QuhE/6guizXjoOcZqIdh6SR2Q+ew1FcX1xlVT6NCiXAJPyqqShac9DKCYQ9ddOfapozYGMxifWfevpPlq2XN1johTVkIt7TsUVRWMlLrff10mxWo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ez5npsva; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ez5npsva"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-560530f4e21so11265a12.1
        for <llvm@lists.linux.dev>; Thu, 08 Feb 2024 05:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707399324; x=1708004124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQ5SV2QSatUSY6hvPoK0c0jwTyeQgfDQaS3+98ICbFo=;
        b=Ez5npsvaggYxflFLmaQpkqQdWmOyN5qtpTGVNb2UXB8pgvVr7dKTt+ntedwK/SjHvE
         BO5waru5urRETvDPXzAOXlsMthUSYmkC2iq4e2uqiVbLpjCyMSI3UYqpyD2ILQFssgoI
         DuKc0Ps1/vktyTp0II4zFkp2yxCQRXjcUA54jeZczIp5zy98tha5u75duCPyxwVK5Vyc
         9LT0T3iSU10RdHCLaYxAlq6JQYcPz/kOLBVqiNpCORJeO8dUPQWDaCpgk4c5dsqbCT1c
         Zd00OIcjL/gWeTAvrYJus013aNab1iUILHdAPTSQoH77flICXZhS/loKHtE71S6G++0G
         IqGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707399324; x=1708004124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQ5SV2QSatUSY6hvPoK0c0jwTyeQgfDQaS3+98ICbFo=;
        b=JRCADzLnBWtyUQlb34sOnkZZ8Fvox4Rsg0XmvIU84Pbcy0cB4xv3btC2RQHNBHy+9M
         wvINQjdQwMZGgDaSyrc4dG1dqEcBHvoDpSJFm18xSwp+X6QyF2y00V4hZgr3otNULhjo
         wAW27rnf4hME2h1Rpaz9Asz5rIsPrpSPhyl/LyPaqGLh9iVrpXlGuvhselwPu4HSlA1Q
         BR4/ibk33POqLvComu0Y6xME57UcwoibuONlG38ExRmnhv1ixTPz54S/gImvpGZu3MzN
         n8ftuuPQU2BbxKaWHM7/xg8mByNoqCXqKJvvA44fdRnpaK14W738xnvYiH8w2WTeZLzj
         oe8A==
X-Forwarded-Encrypted: i=1; AJvYcCXxCKeim88a8rduwo0TEpwG7SUTewsipIc6VxnM0wWfWx8uWpsyT608Z35Nl6IJ2qvZ/IW/aBMNan+e89ekSMTry1VcaA==
X-Gm-Message-State: AOJu0Yzu8TBPnqqiIFBhIuin5pyuaeNuhIQ8Sf2Y42ATEEQzon2zaNq7
	8qftnL4S9M1PZpN9OQTHpCk/ryOWux8T+czAAv+mqp5OI6PFQF7IuGP5ffdE0Cgjp8ybm02Cckp
	we0Qu1OyGAO+Vo5wlEBO3qmvbQOQsWIIow/LI
X-Google-Smtp-Source: AGHT+IGYls60+/k8r8Q2Dcs9PLnGPZ3KgkcPy8oiu2YQjIAEhESrhu03JsI4ixOnmhIdHlYX3bMynNdlkGyPGTEJj7w=
X-Received: by 2002:a50:f694:0:b0:560:e397:6e79 with SMTP id
 d20-20020a50f694000000b00560e3976e79mr318931edn.2.1707399324033; Thu, 08 Feb
 2024 05:35:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240207142629.3456570-11-edumazet@google.com> <202402082151.O18ZoLSK-lkp@intel.com>
In-Reply-To: <202402082151.O18ZoLSK-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 8 Feb 2024 14:35:07 +0100
Message-ID: <CANn89iKQ6-MY2KtPU79P8RTZDc7D_Wp8h6F2+io1ab9E1kn3zQ@mail.gmail.com>
Subject: Re: [PATCH net-next 10/13] net: add netdev_set_operstate() helper
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org, eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 8, 2024 at 2:20=E2=80=AFPM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-a=
nnotate-data-races-around-dev-name_assign_type/20240207-222903
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20240207142629.3456570-11-edumaz=
et%40google.com
> patch subject: [PATCH net-next 10/13] net: add netdev_set_operstate() hel=
per
> config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240208=
/202402082151.O18ZoLSK-lkp@intel.com/config)
> compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7=
dd790db8b77c4a833c06632e903dc4f13877a64)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20240208/202402082151.O18ZoLSK-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402082151.O18ZoLSK-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> net/core/rtnetlink.c:852:12: error: call to '__compiletime_assert_784'=
 declared with 'error' attribute: BUILD_BUG failed
>      852 |         } while (!try_cmpxchg(&dev->operstate, &old, newstate)=
);
>          |                   ^
>    include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from=
 macro 'try_cmpxchg'
>     4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^
>    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from=
 macro 'raw_try_cmpxchg'
>      192 |         ___r =3D raw_cmpxchg((_ptr), ___o, (_new)); \
>          |                ^
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from=
 macro 'raw_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^
>    note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:423:2: note: expanded from macro '_comp=
iletime_assert'
>      423 |         __compiletime_assert(condition, msg, prefix, suffix)
>          |         ^
>    include/linux/compiler_types.h:416:4: note: expanded from macro '__com=
piletime_assert'
>      416 |                         prefix ## suffix();                   =
          \
>          |                         ^
>    <scratch space>:50:1: note: expanded from here
>       50 | __compiletime_assert_784
>          | ^
> >> net/core/rtnetlink.c:852:12: error: call to '__compiletime_assert_784'=
 declared with 'error' attribute: BUILD_BUG failed
>    include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from=
 macro 'try_cmpxchg'
>     4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^
>    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from=
 macro 'raw_try_cmpxchg'
>      192 |         ___r =3D raw_cmpxchg((_ptr), ___o, (_new)); \
>          |                ^
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from=
 macro 'raw_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^
>    note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:423:2: note: expanded from macro '_comp=
iletime_assert'
>      423 |         __compiletime_assert(condition, msg, prefix, suffix)
>          |         ^
>    include/linux/compiler_types.h:416:4: note: expanded from macro '__com=
piletime_assert'
>      416 |                         prefix ## suffix();                   =
          \
>          |                         ^
>    <scratch space>:50:1: note: expanded from here
>       50 | __compiletime_assert_784
>          | ^
> >> net/core/rtnetlink.c:852:12: error: call to '__compiletime_assert_784'=
 declared with 'error' attribute: BUILD_BUG failed
>    include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from=
 macro 'try_cmpxchg'
>     4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
>          |         ^
>    include/linux/atomic/atomic-arch-fallback.h:192:9: note: expanded from=
 macro 'raw_try_cmpxchg'
>      192 |         ___r =3D raw_cmpxchg((_ptr), ___o, (_new)); \
>          |                ^
>    include/linux/atomic/atomic-arch-fallback.h:55:21: note: expanded from=
 macro 'raw_cmpxchg'
>       55 | #define raw_cmpxchg arch_cmpxchg
>          |                     ^
>    note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
>    include/linux/compiler_types.h:423:2: note: expanded from macro '_comp=
iletime_assert'
>      423 |         __compiletime_assert(condition, msg, prefix, suffix)
>          |         ^
>    include/linux/compiler_types.h:416:4: note: expanded from macro '__com=
piletime_assert'
>      416 |                         prefix ## suffix();                   =
          \
>          |                         ^
>    <scratch space>:50:1: note: expanded from here
>       50 | __compiletime_assert_784
>          | ^
>    3 errors generated.
>
>
> vim +852 net/core/rtnetlink.c
>
>    844
>    845  void netdev_set_operstate(struct net_device *dev, int newstate)
>    846  {
>    847          unsigned char old =3D READ_ONCE(dev->operstate);
>    848
>    849          do {
>    850                  if (old =3D=3D newstate)
>    851                          return;
>  > 852          } while (!try_cmpxchg(&dev->operstate, &old, newstate));
>    853
>    854          netdev_state_change(dev);
>    855  }
>    856  EXPORT_SYMBOL(netdev_set_operstate);
>    857
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Ok, some arches are unable to perform cmpxchg() on u8, only plain
32bit integers.

I will send a v2 then.
