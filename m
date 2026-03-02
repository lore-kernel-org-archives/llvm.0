Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314753806A6
	for <llvm@lists.linux.dev>; Mon,  2 Mar 2026 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772431396; cv=pass; b=ODhdp5RBDGzkhajEq1NbLTKWPAeRaiiiESewtAMmSjVhBJ/3IP1uXGDq7psnd+qXvKS5eErOOct+4ZAyfq+8lXJGm54Gl+A/Zthg32uueJ/b+IhmdeWDn500nqqd/wadVWxb4kGnd5olwviMo5YcZVCVzeus0wlKYtc5L76tZac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772431396; c=relaxed/simple;
	bh=VoL9+Q5vKBh/stH6CbzLSnBWXCrGTyp5hmi39PUL9ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJVTqX1dSGYmJAJl5EWN53aQNBQBy9sOxFS2EDSoPkZj607d9Wosp76MjVMyar/o1WTKqgOiydv3NxePnoJXStBdVqX+iZpjcmPXcp0SCQe5f/5jKpKPWbc1aJ19QRO1bE5/CuGVUZ70wIAQNLEMK3Y2GhCjgPNLr8+2ECK6vq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rDkRMd2Z; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rDkRMd2Z"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50336cffef9so36701151cf.0
        for <llvm@lists.linux.dev>; Sun, 01 Mar 2026 22:03:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772431388; cv=none;
        d=google.com; s=arc-20240605;
        b=C4NsCilR7kc5TZ6NMRQqOLF03JfJbJ1tmyfkTeoyumo5Sykepjzb9jSpG/HEXo68O+
         /0Ohlm4pL7/Ztw+UwDJ/9iy4X6yjCME+6VOqvgjnhYgy/QwhpgXErB4zgs2Ka9LGwCTW
         fped4VVDmiyI6rUv3ZIM25xPgriIVAU6rzluLCtRGFAIbqpLuLq1xR8MgkmVXvlzP8+G
         pykUa+GkCh6XsFHo7Jm5dTN9QuUnmGYXr5K4GfLnP6Pr5tDC2oRS8U9T5tA7feCFJ4eV
         wceEVd4+B1sW6hYjAoVCKTuFpQTTEJbLLhhHt8szuLs0qd5BDRgXeqJw6JIGdCSl3IFt
         thyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjR2Jso0hAuDoeUEgb8RQHlOodoa5Tiq2cd7ca0LZWk=;
        fh=+GEsqHuv/xh6CoCcLsrL8mttB2foX2Hg+HEtnpGqFVk=;
        b=Z6mNS0Boae5MgNT40fKA5+g5O1HLCeSU/BEhW42+TvTRAB+sQQrC01eeMdAAkl+I2V
         neAxvdH+cSJwLuVJoG4WnQhSctvSz8g4AJHouIzt33bQiWYng6Kqn91yIOzyYJAG4oW/
         WxFRS5S6LxArC3+RaOwV5ClOmhPCrSvcsjtHDUDPKcnKGxmJMx5wUjrW/8zf5096wZ6A
         KPPGBp7mIRdJsxpsU0svbOTYwSkvLuiAMEeVHIf/canVYTxOrpDUDZurM1mbAsjSntX8
         sdhjNuFVfwzeX83sYQo/JymaYNstNWmKVN8GbjBK8e+3tHeKMFm9mA3JLKB2tNvLBkVI
         ljZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772431388; x=1773036188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjR2Jso0hAuDoeUEgb8RQHlOodoa5Tiq2cd7ca0LZWk=;
        b=rDkRMd2ZOFss4L04qF557h70F/NLoSaCGyP1LWDueoHiJ8dtiaE6cHF7eA3onW2/Z0
         xTMnkn7oM8EKI3vkGF9c0Yn99wBVmQWPrjyCR67xa/OkX5kxphfnG/TvIjWaqNje+Scc
         lp96cGC1zBQPQvWPjGXORmPq3fA+7CPls3IY9sLizW8ob8J98tpf/Bnr/zUJWAoQOE8/
         22FA5E3cByZC8yQZnU1lwqeOVuzDYbL/tBPP45E0ZQ10ychX17JHNEwDZc31Kj51hiBN
         WUzunu4ZKLJiwsokN5pZOYF2GC3g5geER4lz5BaWkAjoJ8v+8W8DbnfeZ6u+liljdAeR
         4x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772431388; x=1773036188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjR2Jso0hAuDoeUEgb8RQHlOodoa5Tiq2cd7ca0LZWk=;
        b=F+EsTY1Imc3H+6dTmAt0AxnBR18fChZLD4+/hpq1A5pZaOUBZjedr6llsmxiEUwMWk
         YRsoMmTpTxeRZ/oXxby0Hk4oDqwR23UYkbleUuj4P2YRI+FQ7CX6MzaXrYugNW7VoW+m
         rDmPxfOPR7kTniUu/bzIEw1s5hbZXu3WN/GN1qRaqknYorJ0njzgqJpLUwT3kYqVpk4k
         SVmuWczutRTbLd+FOZAfPxToW3pA3XwUhDBXuqlQgF06Mr4BLCMWJvMEgD+EZ+BU1Rty
         1eAakSGq3uRa1SXz7VnvvrQNiNeJMJeIglBVkL+NzBodPSmhp3mw8qOWB2sbBaDXtCA6
         b+Gw==
X-Forwarded-Encrypted: i=1; AJvYcCUmx7fgti0p+5HQ+7JHYMaPX/wap82BNJJfao4WTC/oamNAg1rdh01WBiJ1dGeZChwEgO6J@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb8biHqd0O7rE7VsBq70i0nxezsrorcXB/rSEYyo1HxBU5k/VW
	7f0dSqee1Gqbxekq8M3Xm55dCkeNWAqMt7VRAa1BsSYCylXXpAFG+xyhgHkD+8SqAcJFpwZVCcS
	BWq+4sHx23eYwPNmWoEpZSathCQiybFtlneIMkA7R
X-Gm-Gg: ATEYQzwN3FKQY6ifkEfxgS9bfUSwhf1dtYr3rC2653f2Tt8CBlO5fYC/Dt05uSobgMI
	LZ8mCedFbWm3NtEp6InDeucX9LwLkLFmgCyPutr7MZashmxTLccvADTZ67CAjWH9WBtZdBjiIkB
	Ut3LOkabB6i3cm1KEPh9NdRfAEh3BYytKHJ0jzuQl3pB36Fte/2JJd75s3DRS/wTExqSTu+LuID
	OgBcjeLmtpNnOu1xh+3U0+Tirci9ignf9FH3ClCn7JTcRqlb0bAN9sJzKWltpdTuKLG99W9N1VH
	6QNv0G8=
X-Received: by 2002:a05:622a:5ca:b0:4ee:bac:e3a9 with SMTP id
 d75a77b69052e-50752a0a185mr159644611cf.68.1772431387431; Sun, 01 Mar 2026
 22:03:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260301181457.3539105-8-edumazet@google.com> <202603020743.NEL0agrx-lkp@intel.com>
In-Reply-To: <202603020743.NEL0agrx-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 2 Mar 2026 07:02:55 +0100
X-Gm-Features: AaiRm53wQGM3WwCV3bQMeh1Dn2GLN-C3-snKzACE_E-q2yOPyIOVSeKUAVhiYKE
Message-ID: <CANn89iLCXFOuMSrNQY27CfOwTfzUoVMkq1Zd+-O50YtCMSEmDw@mail.gmail.com>
Subject: Re: [PATCH v2 net-next 7/7] net-sysfs: use rps_tag_ptr and remove
 metadata from rps_dev_flow_table
To: kernel test robot <lkp@intel.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Simon Horman <horms@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	eric.dumazet@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 12:39=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Eric,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net-next/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Eric-Dumazet/net-a=
dd-rps_tag_ptr-type-and-helpers/20260302-021900
> base:   net-next/main
> patch link:    https://lore.kernel.org/r/20260301181457.3539105-8-edumaze=
t%40google.com
> patch subject: [PATCH v2 net-next 7/7] net-sysfs: use rps_tag_ptr and rem=
ove metadata from rps_dev_flow_table
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/202=
60302/202603020743.NEL0agrx-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009=
708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260302/202603020743.NEL0agrx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603020743.NEL0agrx-lkp=
@intel.com/

Yeah, in V3 I will remove the BITS_PER_LONG distinction, prone to
errors like this one.

 #if BITS_PER_LONG > 32
 ...
#else
  ...
#endif
