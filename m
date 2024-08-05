Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091B517C64;
	Mon,  5 Aug 2024 14:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722866467; cv=none; b=C954ws2cykE+eeasIV9DcCcjrPeJq5kpwSGxVXcH/j28c6Ea2u7umIO3ucW4cdNfvisIxBAK7p+W6aETZ1kR5OgRCMYuGNeWM3j0bLjZVRy3mc9NHzUS5TDzqm3kTimN1eVgsJ5r+ORxoKTnEK3maHfI6Vb5EveYcE/EK0cV+mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722866467; c=relaxed/simple;
	bh=LYmlMc0K44iOMRb+22Ri63E0Ka9FGH2swdZtgwIlNjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O5NXW/DX6vVS5dw63hOG1ZAWsdB92DaY0z9g5TEv7caQjRIDnRfEUSf9niI4/7/HGglFPqSp0ypokPeitRDHCORWG7HrEHYoU11fEAo3kywxio7QXTedO3lbieEkGEP9tdGtFxn/pvPa4dZzUy7zpeSWhQbaB8LD+WY4ehRC8cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5mpwWtW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5mpwWtW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98E5C4AF0B;
	Mon,  5 Aug 2024 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722866466;
	bh=LYmlMc0K44iOMRb+22Ri63E0Ka9FGH2swdZtgwIlNjE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u5mpwWtWrpjVGdQGkSKQ+K//rJzjh2kPlaHq2cxCl86PXoPkx5o7bthDDjN7CxuE9
	 T8BMSFGKdHb2OWE+4cwdz8xoRuDKyXyXKDMrGV7bOq2TLyq9/X5Rvl1rgnxO3ie1Yf
	 ml/rfg9Kc4kmQ9zn8uBs9REkHfO37LIZ+jHE0uQx1R7G+cqYbPpso/Yt4r4E+Uo/wn
	 /BSxCSqStxro7xjaqnwuikcELs6aKsDwN7LZW0WmTr6kYfTn2/K/1rgAS3F8Lv64Az
	 SzRWKJSQF01pmb/ACQqxBredOqPSf+oDTOBu3BN57gveHAQhDWjxV43IsJTKNZxlae
	 b6xybCMKjHEZQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ef2fccca2cso119552881fa.1;
        Mon, 05 Aug 2024 07:01:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxb2jVLMZz4ANZB0fcTZXywCVgg92868seANvz59FsK6mlWh4umW7yWOFCFPTXQzwOC4iKqpuGOECA7SK63rvsRbckS1UKzJDtbc9jCigmUSw5hNKxNJmg1jxGnJZpbfRiJXU=
X-Gm-Message-State: AOJu0Yyr1ywoxp6HuVQFGBH8a4nLF/KcuFARfgHZIaD4HJ4DviptegZ5
	Q9ojV5ySLsns2EOsfQxZUobWxJK7iJUSsOCVcsOLbqh1oj/uvNfUTj63nitz1xZQI4PeY+7Bl2M
	sn1CFHTolXUZ/swf3slbD3nfR+g==
X-Google-Smtp-Source: AGHT+IEFbHCFnmoshA0WuXQphEnKNAn8UOd2m4R9GOBZska+HGyTOU5Gorn/3hrzQccKkomlkjUwq/uyVynmJwkC2Ig=
X-Received: by 2002:a2e:330e:0:b0:2ef:2472:300c with SMTP id
 38308e7fff4ca-2f15aab0abfmr70075191fa.25.1722866465250; Mon, 05 Aug 2024
 07:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202408030418.gnJDcCpm-lkp@intel.com> <20240805104758.52obllbjvuvtmd4n@vireshk-i7>
In-Reply-To: <20240805104758.52obllbjvuvtmd4n@vireshk-i7>
From: Rob Herring <robh@kernel.org>
Date: Mon, 5 Aug 2024 08:00:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+evBH2+XVeMAGXy9Ucof=G574+sFKcG94MqSUdgzFSgw@mail.gmail.com>
Message-ID: <CAL_Jsq+evBH2+XVeMAGXy9Ucof=G574+sFKcG94MqSUdgzFSgw@mail.gmail.com>
Subject: Re: [vireshk-pm:cpufreq/arm/linux-next 2/2] drivers/cpufreq/spear-cpufreq.c:202:12:
 warning: variable 'i' is uninitialized when used here
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 4:48=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.or=
g> wrote:
>
> On 03-08-24, 05:01, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git =
cpufreq/arm/linux-next
> > head:   dca2ef2b7d916c718c6e88084170413a8a1942d0
> > commit: dca2ef2b7d916c718c6e88084170413a8a1942d0 [2/2] cpufreq: spear: =
Use of_property_for_each_u32() instead of open coding
> > config: arm-defconfig (https://download.01.org/0day-ci/archive/20240803=
/202408030418.gnJDcCpm-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f2=
8c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240803/202408030418.gnJDcCpm-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202408030418.gnJDcCpm-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> drivers/cpufreq/spear-cpufreq.c:202:12: warning: variable 'i' is uni=
nitialized when used here [-Wuninitialized]
> >                    freq_tbl[i].frequency =3D val;
> >                             ^
> >    drivers/cpufreq/spear-cpufreq.c:176:12: note: initialize the variabl=
e 'i' to silence this warning
> >            int cnt, i, ret;
> >                      ^
> >                       =3D 0
> >    1 warning generated.
> >
> >
> > vim +/i +202 drivers/cpufreq/spear-cpufreq.c
>
> Rob, can you please send a fix for this ?

Will do. Looks like it is only with clang...

Is there some reason COMPILE_TEST is not enabled for almost everything
in cpufreq/?

Rob
