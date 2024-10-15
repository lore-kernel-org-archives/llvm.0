Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2948A1B0137;
	Tue, 15 Oct 2024 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728985015; cv=none; b=KHgaL4Siz/tbkxArq3u9tVDk6cuwekhH8y/nckaPIjlzk0gIwOGwHAFbizWkFw7dkgS/1UsPaCWN/UdGeozuvr1x5VbADAg560hvbIXhtXqQdVyzZK9yKb33wuLnWYX9Ax9Hp0g38PAcRywN7hGBYmuy5+ga92xCNianKZDgHVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728985015; c=relaxed/simple;
	bh=EuHSVp0ma6AF7blC/RGH7eF4epMQJtOuLhIEBG/TvBI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iaWIfYsXokkDoCyGSvFTXEwMjoJ9seEc0lVOV8N2b2onjkYUyBORUmVIMKm2uY+8rPu4+IUDNwrKHTPFHPqZlCEfQkMTO35gXG9HoDWJORwsmzvoPmiql4giB6vTL1xVt4+twFi5VYR1jbJ4O41O7KvmUTRO/Pr/YE6OehY4/6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkGxGTj6; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkGxGTj6"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a39620ff54so18858085ab.1;
        Tue, 15 Oct 2024 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728985013; x=1729589813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOzlHPSBobGuPptS2qSZ1QwRtjfsUbv4gGiNiZWPFR4=;
        b=LkGxGTj6zWlRmNXI4QQA7yFWIovFgvqLZqnotcbnlM3xo/FoCBeolePQxzEqOeZbkh
         zFz+nE/vWPW9qT/t3ErAsiV75h32YHcE3lJyJlyLT4xHWv6YDFFL4dFn9xQa0U+OlxCw
         AuVKwlDTVc+wSvUtdobmkBV5jhTSyjLLqHaTlLXbqxpjciVVlyk6hMUsGMUKunIq28DL
         2nagvRoy7vNSYHLyqk8oB6IUni27YbvwpzMIruUmyowu4x2oWE0wAUTu4Smt2jDMHxKs
         BCvidtZsEkVHOmWh5MYm4bU0YsZdu8zw9rckuRN5JTmtgtTiIwswYXBlHv/4gZfo4GnT
         kJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728985013; x=1729589813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sOzlHPSBobGuPptS2qSZ1QwRtjfsUbv4gGiNiZWPFR4=;
        b=cXBtGY3nhvgeFLAPz37vFxAU4BMV1d9vStPDmM9Sn19kwU9qMRBoU7V+Kx/FQnwOi1
         m9TFrGIb85VWNoOeHX7mgiD+ecKtUo0qlGG5Hyzq5r94sQTu+GpPXqg28W2OuEy/sYaZ
         4mV5MMcbfOjfWujiRaGYC64/W0fra8oeicTPScks66+pTqpVzSJbbKgKct/rUg0Vdfkj
         6GrwqWNe0eUKIC0uRsh8SJea8i0AB6lUorb01krjrgqZLn39GG0LXgrmmnlLVFb/01Cq
         s19wZ+03Gafx4FWhEDbfdV+zXVOAL9wlj/DXlqLNy7s9XSefM2rSB5JPBXczQraY3LGs
         VEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYMUN5c+eeLMtRQ66y3VyhnRd4uJylceaGmUA9jtblUdWzWe2cToqvP7OH4gJRGHs795OAW/dUif+mxDTtLg==@lists.linux.dev, AJvYcCX8ffq57bDKKirAbNYAG7bR7oONvdj+3fre6Eb0gBL1UWm8R8ClAqa5rYCL4jRMVQUivhqm@lists.linux.dev
X-Gm-Message-State: AOJu0YyPKJVI3cNd2Q1f3rPucgA7q8ShTcTQaU4RbTGOsQ6X/yTMRiNb
	AS6/u28TvBlXqMLcyBWJQ0a+BbBohi9v9idHHgmWjTvaVlRDFVCJRuRqTyRLgHmtsiLvahx7JjB
	O/C7NaBtvLfeqljyHXQUJ1SAwrBs=
X-Google-Smtp-Source: AGHT+IHAUit3P2s0RoURPDSBc3P7BsQ0e7J7JlVGM9tYWDXEhA89gyrAqTmPloyMh7hBhGScnTLEFj/4VJVnn72WJvY=
X-Received: by 2002:a05:6e02:1a0b:b0:3a3:b4dd:4db with SMTP id
 e9e14a558f8ab-3a3b5c73b7fmr147541985ab.0.1728985013202; Tue, 15 Oct 2024
 02:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241012040651.95616-10-kerneljasonxing@gmail.com> <202410151628.hcAdeahi-lkp@intel.com>
In-Reply-To: <202410151628.hcAdeahi-lkp@intel.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 15 Oct 2024 17:36:16 +0800
Message-ID: <CAL+tcoCsWdDKSfWfbAD2DtSFJRaCMJNVy4UbKqoLH8RfkPkBvA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 09/12] net-timestamp: add tx OPT_ID_TCP
 support for bpf case
To: kernel test robot <lkp@intel.com>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, dsahern@kernel.org, willemdebruijn.kernel@gmail.com, 
	willemb@google.com, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2024 at 4:41=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jason,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Xing/net-tim=
estamp-introduce-socket-tsflag-requestors/20241012-121010
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20241012040651.95616-10-kernelja=
sonxing%40gmail.com
> patch subject: [PATCH net-next v2 09/12] net-timestamp: add tx OPT_ID_TCP=
 support for bpf case
> config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241015/20=
2410151628.hcAdeahi-lkp@intel.com/config)
> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b=
5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20241015/202410151628.hcAdeahi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410151628.hcAdeahi-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
> >> net/core/sock.c:926:2: warning: variable 'tsflags' is uninitialized wh=
en used here [-Wuninitialized]
>      926 |         tsflags |=3D (sk->sk_tsflags[SOCKETOPT_TS_REQUESTOR] |
>          |         ^~~~~~~
>    net/core/sock.c:920:13: note: initialize the variable 'tsflags' to sil=
ence this warning
>      920 |         u32 tsflags;
>          |                    ^
>          |                     =3D 0
>    1 warning generated.

Thanks! I will fix it!
