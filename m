Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF2C53BE
	for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 07:05:06 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fbc59de0e2so42686815e9.3
        for <llvm@lists.linux.dev>; Mon, 10 Jul 2023 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688972705; x=1691564705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFvL3tlkpDhpLI9w7XrEtJqw/lbmRTQDmsFPeVlaTJE=;
        b=B+OAWea8safjLliid5fb8P1XEOByAWmJtrdPeO8vVt0BsfB3sAQ/HEWF0pq51BZPP/
         9u6eXAkqEVbhocmUjbg2FiO7/4ydZdcFxw2s8OQrvJmOxT7ymv/XvTaj8BCcYMrkJSpe
         QPDT9DIoeFUUY6bTwyxFsdUzKFFiTcEOCfa+mrSxkonkUTXuBPf6Xn1fiZm8FyQTZPi6
         l8VqvMGpytp9+RGRmBHRwUHr1wjESiWVsJvoWcG8fr0+Gt/ezkG3pD+6ZPE0GcnGRTFj
         5f78Id5wtOSSXzbr8qM/drdbmelMDLqumNxOArrLO+/XVHuNqxzyEXY3sEfNRj3OMOrm
         XMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688972705; x=1691564705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mFvL3tlkpDhpLI9w7XrEtJqw/lbmRTQDmsFPeVlaTJE=;
        b=XyqVDqInAam6SEOOg/LWeWKOeErnfe/iCHuM2ErV+J2cFCazAQ7QX/ZSv5PpWg9oX0
         hX1DhUw3vf/09/DcCX0qyX7JQ8yVkpkBiCKqyNAYyLfAuHEbKuRZbsajGxddazi3uhZt
         ehngY6Mv4PnFdx9CX/RreQ0XHDgDOh3F3VbuuqT0FP9ogIfhXe2FWVkCgLosg/vOwPO2
         HsVUeyUhviOaMrawOTWkCcUhHlrgGy+PbvOviw2FMrGE682oxMAv2GAKAWiLbhv9/Wt3
         tcDcCgnK16yTCKqsbjlF/Or/3BlcDaRD4/FWa57U9iPEq2F3xJobp07aNlgjTWP6kRXu
         SIaw==
X-Gm-Message-State: ABy/qLbwFeQ3LT6cOtXouQwHTz7qqAx2gl5D7kSSd6WQkUvsGTsAZ7EI
	HtCsJeKL9f5z7QTQwyJ31j5ZXsDP4X1Ru/hGBjAVZ2Wv3Y/bIolz
X-Google-Smtp-Source: APBJJlE3NFpHmzslV9vKFkDNQrbvhe42+Doh1LqIf2mh+PVW47q644xaDCXNbv5LQWJCaCVpTz2Lne60UkJ44T2N8sA=
X-Received: by 2002:adf:fe01:0:b0:314:23b:dc56 with SMTP id
 n1-20020adffe01000000b00314023bdc56mr8033189wrr.71.1688972704715; Mon, 10 Jul
 2023 00:05:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307100638.uoomUZol-lkp@intel.com>
In-Reply-To: <202307100638.uoomUZol-lkp@intel.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 10 Jul 2023 09:04:52 +0200
Message-ID: <CAHVXubg2BUeM72rG5xLZFRQQ+eGfS3An0zeY7ueiH4nwFOeGcA@mail.gmail.com>
Subject: Re: ld.lld: error: section .bss load address range overlaps with .init.pi.text
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 10, 2023 at 12:23=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
> commit: 3b90b09af5be42491a8a74a549318cfa265b3029 riscv: Fix orphan sectio=
n warnings caused by kernel/pi
> date:   9 weeks ago
> config: riscv-randconfig-r022-20230710 (https://download.01.org/0day-ci/a=
rchive/20230710/202307100638.uoomUZol-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git =
4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230710/202307100638=
.uoomUZol-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307100638.uoomUZol-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: section .bss load address range overlaps with .init.pi.=
text
>    >>> .bss range is [0xDD5000, 0x1EC438F]
>    >>> .init.pi.text range is [0x1DBC350, 0x1DBF39B]
> --
> >> ld.lld: error: section .rodata load address range overlaps with .init.=
pi.bss
>    >>> .rodata range is [0x1DBF400, 0x2888177]
>    >>> .init.pi.bss range is [0x1EC4390, 0x1EC478F]
>

XIP_KERNEL=3Dy so nothing to do here.

Thanks,

Alex

> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
