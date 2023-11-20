Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABE46FBD;
	Mon, 20 Nov 2023 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7BgsxLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400A7C433C9;
	Mon, 20 Nov 2023 16:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700498448;
	bh=sYRcaSv4OeRhNDn8QMt+macnnrBAtvVPBWJoKpPRQdo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=I7BgsxLuyPuDatCSJFrWBe0PLuznybO3fQ82hI2yTSAWA5OzzgGFW7jnBaNKxqUaD
	 BN6mXwVRFN1lkWe9ygLcMavufFhoUtFOH5MGGAcYgv3a7vDA8yY5zOod7Ylt6zSr1J
	 lSM16qzACSQ4+GPzzDR8MYo/SBo99h1+Zqm7mX83A11tKzuZhmwxBIH/Wf/W/O06CL
	 w7CupDty2n8OksYI7d/N4HjkQr0EDxRkoZbQEpQs36dHkiKxuiJKLtVWDghmc4Ae0J
	 4fmDn5WqQy8UhVtZO+caNvBaQx0J3F6PDXCC/mDhaBkFwQFC4VsOR2TYfQUqqPvnTb
	 PkmDqWuAn1vvw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5079f9ec8d9so4774883e87.0;
        Mon, 20 Nov 2023 08:40:48 -0800 (PST)
X-Gm-Message-State: AOJu0Yx42tspBNlCwsCDc/UU7lV65Ur4U7Hg5iuUCk6vMtiAYB7iVBHH
	SSZ8H14vPeiGWwO4Y+wdN181QlraiYQNEmkNsw==
X-Google-Smtp-Source: AGHT+IGmnaSAOJGLyNAgBnyK75675UzVOPLA/nFVz3XU4+moE+VP8Rtp/+08vh8aIAOmtp+34WURZx2Eg5B/NSaVUzU=
X-Received: by 2002:a05:6512:3b26:b0:50a:a6ea:405f with SMTP id
 f38-20020a0565123b2600b0050aa6ea405fmr11339lfv.4.1700498446437; Mon, 20 Nov
 2023 08:40:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202311191205.EDRfQlJF-lkp@intel.com>
In-Reply-To: <202311191205.EDRfQlJF-lkp@intel.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Nov 2023 09:40:34 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJvUXhXNsHp20V_baeRhKjvsqmiMB9w99p6j167ZViRcQ@mail.gmail.com>
Message-ID: <CAL_JsqJvUXhXNsHp20V_baeRhKjvsqmiMB9w99p6j167ZViRcQ@mail.gmail.com>
Subject: Re: [linux-next:master 1467/1905] drivers/hwmon/nct6775-i2c.c:164:15:
 warning: cast to smaller integer type 'enum kinds' from 'const void *'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 9:10=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   eff99d8edbed7918317331ebd1e365d8e955d65e
> commit: 0a7093e69c1eb508d699d6076013706b0c523597 [1467/1905] hwmon: nct67=
75-i2c: Use i2c_get_match_data()
> config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/2023=
1119/202311191205.EDRfQlJF-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git =
ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20231119/202311191205.EDRfQlJF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202311191205.EDRfQlJF-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/hwmon/nct6775-i2c.c:164:15: warning: cast to smaller integer t=
ype 'enum kinds' from 'const void *' [-Wvoid-pointer-to-enum-cast]
>            data->kind =3D (enum kinds)i2c_get_match_data(client);
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    1 warning generated.

I thought I had fixed all these...

However, there's also been discussion[1] to turn this warning off.

Rob

[1] https://lore.kernel.org/all/CAKwvOd=3D1otHgNkJf7wBajDrGmRNQduvR5ie_XgJM=
PPWT6+n_mQ@mail.gmail.com/
