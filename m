Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC3B4D8A1
	for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 21:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718918284; cv=none; b=UAT4p+adBjZSV5yb396kTbVRRPfg2nhIcHfuzsc/h4IZd4NH7luXkr7iAZnmrxohKA6zJA/F3qwkRDqd16BOfU1CE1fG/DsGJuquzalpcc9kwAUxlSviJurrZaFpbCqx8fpb2uTbUZDnK6Em2kwnfLxFiXOnS1AXqgal5+udjWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718918284; c=relaxed/simple;
	bh=/tlBQQa5I+myt35aHWeLT6dmvX1E6woSFRLGzCCAMQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kg6V3LtgZXpIyF168Bazs07nkCToahMai0m1zL/3hLETPSIl9xU741IC9QUIK3xdIELUP9Ryp9Qz4Kh/g3iZL4vu8gyL22wUnsY5X13fcZ9Buzoi5q/wENzbIlSnvdsJiam39Z0YmqbORoYvJcJFYB5iRpGseM6yXoFHhVUnEGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aFskjxIA; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aFskjxIA"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-48c50daef1fso471391137.1
        for <llvm@lists.linux.dev>; Thu, 20 Jun 2024 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718918281; x=1719523081; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWxCTNrmZRMZjk6xShuBA8spgETA5SXOSONvnp9DFsQ=;
        b=aFskjxIAUj+727HACmPjnlEEfcHTkkffUA9maf/Hjkjo5QYosDa8ybhwXNcl/lhwe0
         IsuM+Yapon0kKQZ45oce+oRfi+PInyQPTqXiJPIUOOaH/FNAoq+0YLXBFJeENS0bCZbB
         4fMGCBAi2sHzXZz0P32BbLFqVbo/+IFnHj8aZAgIwc+G3j3OnyDig7cglNVM0iSWUIAM
         gPl+cF2iVACQnSht9sv3Wh52O29MDOHSU6foaYQzDxzLkfmHNUbp+47eJKdsT/1NpFo9
         tyGBkn3Q7eIVdRp/9euDLg9F0IxNCIx7vnzyZVQ7PfwufUo4iM6tjze2HsQ+APFg91kz
         5kkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718918281; x=1719523081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWxCTNrmZRMZjk6xShuBA8spgETA5SXOSONvnp9DFsQ=;
        b=kZcg+PJn5aWT8QWASOU6Q0pdQ4jGMEm37QSMWiP/Th92ObtYAehxCnXS4ReTgVlLkv
         bAYxbFc/8LgruAcYVV6KSacBjs0+QL7rWA+ni8tll92BtTlLUoeyEcpCbH4TRNoygsYk
         3MkYUMXWX159HqbbBprWqbiioapJQqfph0uU2yT/DXCFNBieLeBRW+hfOtdHD/QHFbT/
         QUfDR3mBAOydmEMfGNFBM9+CVEe/Q1/NdeWu9mqjGZEbqe2216TFD32K7q/eiYaWEe9H
         rnaAORGr/2mob4qvcardPr7Kgri5pFCDm1tJ0CfYZifg63mE9BQtbSQY3Wphi3y7urSo
         k4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUL0bsR4VdRmseo/qiExaxzjFk00PoEFm+DPK8RATF/WC3RIrnivp3rwqKA3qI8eyW2MuajrCCaUfNS0pJzACvV9TSr2Q==
X-Gm-Message-State: AOJu0Yw0GyS895PBXQjo03b2D24d5qYRmjGJPOG/1N3LlXpGZYVHR1Dd
	/IMVV9AzF8KUMFDtXAkEee79fp5cJfivAvYhNgfD3ssq0bEc0prc8OIL7dgVSGvwrl+i0aYL4fx
	wOwpB8J0cr1LLt3hVRCObYsKehTtlCBE4I7yF
X-Google-Smtp-Source: AGHT+IEsX/QziDSHpD5+IQeMjE9fk7Imgp53eZRaEY7Yos9IZHYlKmLr/4gvYJhwGwxb+PEgR0uRZi0fcBDysyzRuVM=
X-Received: by 2002:a67:be0c:0:b0:48d:ab8c:5b66 with SMTP id
 ada2fe7eead31-48f130b7befmr7054249137.24.1718918280719; Thu, 20 Jun 2024
 14:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202406050622.SmOX6DL6-lkp@intel.com> <20240605061734.GD279426@thelio-3990X>
In-Reply-To: <20240605061734.GD279426@thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 20 Jun 2024 14:17:45 -0700
Message-ID: <CAKwvOd=osRnOXcha56Cir+Fh2ichSVmc-n=--JE+F4f1GL=Y7g@mail.gmail.com>
Subject: Re: [linux-next:master 1323/3381] drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:4:
 error: format specifies type 'unsigned char' but the argument has type 'int'
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alex Deucher <alexander.deucher@amd.com>, 
	Lijo Lazar <lijo.lazar@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 11:17=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> On Wed, Jun 05, 2024 at 06:23:57AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   d97496ca23a2d4ee80b7302849404859d9058bcd
> > commit: 0ea55445554209913a72eab86b60f5788776c4d6 [1323/3381] drm/amdgpu=
: Fix snprintf usage in amdgpu_gfx_kiq_init_ring
> > config: arm64-randconfig-003-20240605 (https://download.01.org/0day-ci/=
archive/20240605/202406050622.SmOX6DL6-lkp@intel.com/config)
> > compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f2=
8c006a5895fc0e329fe15fead81e37457cb1d1)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240605/202406050622.SmOX6DL6-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202406050622.SmOX6DL6-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:4: error: format specifi=
es type 'unsigned char' but the argument has type 'int' [-Werror,-Wformat]
> >                     xcc_id, ring->me, ring->pipe, ring->queue);
> >                     ^~~~~~
> > >> drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:12: error: format specif=
ies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int=
') [-Werror,-Wformat]
> >                     xcc_id, ring->me, ring->pipe, ring->queue);
> >                             ^~~~~~~~
> >    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:22: error: format specif=
ies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int=
') [-Werror,-Wformat]
> >                     xcc_id, ring->me, ring->pipe, ring->queue);
> >                                       ^~~~~~~~~~
> >    drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c:333:34: error: format specif=
ies type 'unsigned char' but the argument has type 'u32' (aka 'unsigned int=
') [-Werror,-Wformat]
> >                     xcc_id, ring->me, ring->pipe, ring->queue);
> >                                                   ^~~~~~~~~~~
> >    4 errors generated.
>
> For what it's worth, I think that we take care not to enable -Wformat
> with clang versions older than 16 because of this issue, see commit
> b0839b281c42 ("Makefile.extrawarn: re-enable -Wformat for clang; take
> 2") for more information. However, now that I am looking at
> scripts/Makefile.extrawarn, it appears that we only do that for a normal
> build, not W=3D1? That seems like a potential oversight of that change bu=
t
> I am a little fuzzy on the conversation around that and I am not sure
> Nick is around to answer that...

Yeah, unless `-Wformat` was being set explicitly somewhere else when I
wrote b0839b281c42 and has since been removed (-Wformat is part of
-Wall), then it looks like my "old clang" workarounds is only for "not
W=3D1 builds."  That block just needs to be moved outside of the
corresponding ifneq's else block.

>
> Cheers,
> Nathan



--=20
Thanks,
~Nick Desaulniers
