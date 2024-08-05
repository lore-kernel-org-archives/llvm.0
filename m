Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111DA136330;
	Mon,  5 Aug 2024 23:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722898968; cv=none; b=QkPnEoCIUchNE8fRlcrnDEBopgGjkRUk8Mjexwh1E/dO2QDhhSrXX7MHvHNoySOy15tKjY1RRgBvni0xW6vP91YdUQFcPzgxa6h4W9uBTZXmKI6xT5XkcjMuX4zGLYKEvPkBvvh6bfKSXZ/2nxxmrxU5vAAgNlZ+G6aI6655M7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722898968; c=relaxed/simple;
	bh=0Gdo3nqq540CcL7ibzeEufeGCXxLYGPGMYHqMRwmTRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kqx03QbQm1YgDS8fHyN0WthZFdvgQvbFlwZQBXCs8/0P3zQMg02jTJmB/+iYgXih4hYx6FXGYWQ5UGy6JKvxt0EYzYTZr/68qdwTEKnV3GvXJe6AwyynMMP7lztC2LIK7+a4Tp88acBT9wxDqDiaiUiJvIaCRoHqt/KG4PXtRPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ljl3GFCb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ljl3GFCb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC0CC4AF0B;
	Mon,  5 Aug 2024 23:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722898967;
	bh=0Gdo3nqq540CcL7ibzeEufeGCXxLYGPGMYHqMRwmTRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ljl3GFCbllR+AUqgxto9ZIuPsuUSl+fPJ1c06Tv8gHVvZXoMES+wrjYutBNJ021F2
	 OsaUE5jE3NCAoA71+yYiBpw7P+LZB6nHlcMuqFAx5SZS2XySbmSRMjE8HzhyUz5Lda
	 XCFQhMbO9ZVHz75FH6fZgrZe9t3iQWs1UAbPcskpaHp/x0guNDDDim6dLQP3AL8Uii
	 aul1kT26Crp0OUZPMW6RXAWrik4jUk0N0UtmEGYYyHNSgU/+lRCX24iKjyMIYhTk5H
	 tG3CwsJ9nxWehNeSGdQCiuodKE5YYxf5CEPy1fwCyP/UjO3xBFwzJ4cpAYqNek2Jzx
	 /DpfnVhqDUv3w==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef2cce8be8so133668811fa.1;
        Mon, 05 Aug 2024 16:02:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMmamQsupBD5TZdVL7oXq5gB1lsP0VP2NvnPLvx/Y6qNN1OuzLvhyB0RRrrDuuexbWTBn7C800XmHX1DuiIMRXkDthM7PWlsmJqOSWrCdtycYoddmPK3d5yxQRcSarhpOXupA=
X-Gm-Message-State: AOJu0YzpQKXF2oY5/Ini9UMvqeh635VT7q/NAD7p92zCLPvQ0ygsmAFL
	wvC9qE4zOU+EqM55somGhevAFxsPhPwJA3Zy+bGdecYFZyPP8B+nLhTA+b2CHhBM1I35uUYFnk3
	sduXvmtLj9PFAdRFjl5//NK34sw==
X-Google-Smtp-Source: AGHT+IE5UpL2i4KpdFQOQEkLIa7k+4ENdHDQfrjNsLeWhbg/3HLPQs//pjnhx3TTitjgRK4reX+wiHVeBzqLw5GCe9A=
X-Received: by 2002:a2e:9b0b:0:b0:2f0:2a55:8c4a with SMTP id
 38308e7fff4ca-2f15ab53707mr89313251fa.49.1722898965951; Mon, 05 Aug 2024
 16:02:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408030418.gnJDcCpm-lkp@intel.com> <20240805104758.52obllbjvuvtmd4n@vireshk-i7>
 <CAL_Jsq+evBH2+XVeMAGXy9Ucof=G574+sFKcG94MqSUdgzFSgw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+evBH2+XVeMAGXy9Ucof=G574+sFKcG94MqSUdgzFSgw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2024 17:02:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK6rY7S3X9sNSZFqhKPqz1wYz3QdgaQu42pnaKVA0HrwA@mail.gmail.com>
Message-ID: <CAL_JsqK6rY7S3X9sNSZFqhKPqz1wYz3QdgaQu42pnaKVA0HrwA@mail.gmail.com>
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 2/2] drivers/cpufreq/spear-cpufreq.c:202:12:
 warning: variable 'i' is uninitialized when used here
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 8:00=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Aug 5, 2024 at 4:48=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
> >
> > On 03-08-24, 05:01, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.gi=
t cpufreq/arm/linux-next
> > > head:   dca2ef2b7d916c718c6e88084170413a8a1942d0
> > > commit: dca2ef2b7d916c718c6e88084170413a8a1942d0 [2/2] cpufreq: spear=
: Use of_property_for_each_u32() instead of open coding
> > > config: arm-defconfig (https://download.01.org/0day-ci/archive/202408=
03/202408030418.gnJDcCpm-lkp@intel.com/config)
> > > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project =
f28c006a5895fc0e329fe15fead81e37457cb1d1)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240803/202408030418.gnJDcCpm-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202408030418.gnJDcCpm=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is u=
ninitialized when used here [-Wuninitialized]
> > >                    freq_tbl[i].frequency =3D val;
> > >                             ^
> > >    drivers/cpufreq/spear-cpufreq.c:176:12: note: initialize the varia=
ble 'i' to silence this warning
> > >            int cnt, i, ret;
> > >                      ^
> > >                       =3D 0
> > >    1 warning generated.
> > >
> > >
> > > vim +/i +202 drivers/cpufreq/spear-cpufreq.c
> >
> > Rob, can you please send a fix for this ?
>
> Will do. Looks like it is only with clang...
>
> Is there some reason COMPILE_TEST is not enabled for almost everything
> in cpufreq/?

Pushed this out for builders to test:

https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/log/?h=3Dcpu=
freq-compile-test
