Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0F123D7D9
	for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 19:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760468644; cv=none; b=IWY2NUoqkj7zSmH7K0H/Ves9Kzcf745ijN1U4N04yAMiqG2qFoXPMMsIdLq5AJip18NBuxF/IsnavbUs2nd0WS2lXPVfEjykKLgNtwd+274HrlsBCPhYS9pAv1GNGHw22DlmQPBRmV1+eBbo/nGwBEk8tclSV6zs+t1CTtKWQSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760468644; c=relaxed/simple;
	bh=5y68QruZPAM2nXoI+E7P7xRzvuupmLhKZeN/D7gAGiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWCwHM8+0UO/hZco1vvUOShQRmP0GadUt/Eyzl1fpWAIVx9mwp87cr0lUHYURIOp/6NhB+n0tximAv86CMnj4/Q48VTqj5Wk0+Gbnqara2qqsWAoiN2jB7fyjGxTfvByB8IKCfrU5eHAyKYp0ltExjR82I1M8NB9XBEXG0eQ+og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BOqhGsc0; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BOqhGsc0"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-42f8e736ecaso122475ab.0
        for <llvm@lists.linux.dev>; Tue, 14 Oct 2025 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760468642; x=1761073442; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3xKBu+Miamd+V4YG8p75v/z/lqDKmiLl9I4U7VNKAE=;
        b=BOqhGsc0iuUEN9c6ThaT/XX4Sh3eWXYzqoOu7K42NEhp6792iFEWHGjAXujIeEo8fE
         vdXcyoXsTxXdhNrEs5UzO4xqT1joOvWLoeLI7j+rVksj5PtPsMeM2AYhMdnrViPJSauy
         pfoEdn9zQa5JVNiFANimfdf/mlijBURibEO3j5tLv71qWzQSfvpPUOPKP08StLNjzwo1
         Y78TKA9H5qkd3wq95myrTbo10lyPi4IP1ec1+cE05hLN5wAXdzU9bFzXKCKzl6A5gKBi
         RHHdS1MXIfeLozjiEtI9iss0kz7fsUTlqsbzzD2K/vaB6ceboYb0AH4DoSMVFphOnKdh
         KLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760468642; x=1761073442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3xKBu+Miamd+V4YG8p75v/z/lqDKmiLl9I4U7VNKAE=;
        b=jdjGT8XELmpSTNLdm4rNL0BwriI3ZLp5w3zpeuW74ew8xJyoTbSmXnUQ/OybI6BV7t
         Rb7bv8MJ9ZT4Hq0R2lplwHIEmvAgVM99/fRvpKCWMS6E8loFaaBp2g8d4qZAUfj3RggY
         rgLUW4YLnYcbn+0Ofv0BJRZ/xB3WJpivm8yWdmtTH/JKgzbSurgXXOWuZ05hQ6iSf2ny
         Tb8JRTN1g9BgfidykAzOqQ8f53h9UWpeZT1loKIUG2NJKa9C/4YwWEU5Y01WdOBgFwA8
         brm+JDxdeOFLBy13fQVP+SpnaEiI997h7m5etz3uzEqQwNOJ2vdPrzZJ+I8FtRUzIiWA
         oXvw==
X-Forwarded-Encrypted: i=1; AJvYcCWOWj/YtUOl/fjkRnwSTZKlY+c8wZx2qvCCYlu9bT1kN0ZehJI3Xbn/8ctM/0pDT/YHCdT0@lists.linux.dev
X-Gm-Message-State: AOJu0YzQ4EX2bgtjSFBAfi6EfilXJFnmLObKM6YL9RCZmh9gLuPfUOZm
	r4AW24rUI3vYJbw2oav6eq3dDyiyJ/T9q90Da6J2yDKTmdQvlPz0MxNGGffFphF9mzQEO8VwhrW
	JTivmfAHAOi15BdumKl4FI4/A4Vmqth0LZM2qj6MZ
X-Gm-Gg: ASbGnctbGiafqvVHjEJ6YqfVU54hLM5vRef5Ot7I+rJ7DWZMXcqm9WihwH1gPkefzvC
	2HxHect93q7kS3V68Y+1nMeOn4zmuuyN7e2qzv65qrgUehYxCo+jQ3aud4g4TqTn3/CaLrWrGUH
	RAjHO2MqsMPZBb9oaw5agoF/dr4lnqdbPT9eiV81Rd4jLgWVpGGWg26Kb4/7w0d2yAMtB17S3Jm
	oKhLsvykRpP5+VDgxx8Hrp4qVjVmsKrVZj5WpkIB2LZJXk9rnic/kRKRcTWkcU=
X-Google-Smtp-Source: AGHT+IGFq8+m5EUm1S0rfkHGcGMkfEEEniNyZUS3jih3A0xj2nWF9JKKfX2BM83QEzN490MbMoUDvrGaR7EKS8gi/HA=
X-Received: by 2002:a05:622a:6081:b0:4b7:9e3a:3804 with SMTP id
 d75a77b69052e-4e882f377e0mr272151cf.16.1760468641464; Tue, 14 Oct 2025
 12:04:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010210134.2066321-2-xur@google.com> <aOsO5gO+5/OkZXVn@rli9-mobl>
In-Reply-To: <aOsO5gO+5/OkZXVn@rli9-mobl>
From: Rong Xu <xur@google.com>
Date: Tue, 14 Oct 2025 12:03:49 -0700
X-Gm-Features: AS18NWAPmte4S6P8LMDWE8am8OtuITHNTNfP7cWAg9SzB0qhAN67sAjUYloyCJA
Message-ID: <CAF1bQ=QQQLp=m677dYGDwor=cbHR1JDeQuL92+MrZkQ-OQ_J3A@mail.gmail.com>
Subject: Re: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
To: kernel test robot <lkp@intel.com>
Cc: Alexey Gladkov <legion@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Bill Wendling <morbo@google.com>, Han Shen <shenhan@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Yabin Cui <yabinc@google.com>, Sriraman Tallam <tmsriram@google.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll filter -pie from vmlinux_o build (which produces a relocatable
object) in the new patch.

Thanks,

-Rong

On Sat, Oct 11, 2025 at 7:14=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on kees/for-next/kspp]
> [also build test ERROR on linus/master kees/for-next/pstore v6.17 next-20=
251010]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbu=
ild-Disable-AutoFDO-and-Propeller-flags-for-kernel-modules/20251011-050345
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git fo=
r-next/kspp
> patch link:    https://lore.kernel.org/r/20251010210134.2066321-2-xur%40g=
oogle.com
> patch subject: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags fo=
r kernel modules
> :::::: branch date: 26 hours ago
> :::::: commit date: 26 hours ago
> config: loongarch-defconfig (https://download.01.org/0day-ci/archive/2025=
1012/202510120709.Wx3q4Ppg-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251012/202510120709.Wx3q4Ppg-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/r/202510120709.Wx3q4Ppg-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: -r and -pie may not be used together
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
