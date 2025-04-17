Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6E18DB2B
	for <llvm@lists.linux.dev>; Thu, 17 Apr 2025 03:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744859618; cv=none; b=AA4kKzHl8qRFDjyhvbLk64oP4v2iAwdQvbmKtzprap6PTXohi8PbaitUssrqh6I1tH+XmeRPuTRUi92ZURU0ps3FnOFzVqZrHGRWSeO2Pj8sY3e6SkI8strhIeam9SilVuJn3yvtYA9GAm/OzxL64JxgUKIyTnKvIAkwa9iWyJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744859618; c=relaxed/simple;
	bh=8Lg76RDATX5nrSmqI25cRjIK96XzW42HFvsjBBBNz7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DQa3n7OA8zqwkCIQXTysmPoRRf3VNzDOhkOccSnSWr6vd+4OH12zzDB4uqXlIkg6a+1+hxe8RnPTKuyImDD2Wlz3K1xpjMVK3DETqeMplFlJceTs3vPD1ARD3Q5KpPZDF2GXqWlI4IrXvandI6P6pnMBosHxdD+FqhSZ/PndT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yGgs4SWi; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yGgs4SWi"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5f09f2b3959so5731a12.0
        for <llvm@lists.linux.dev>; Wed, 16 Apr 2025 20:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744859615; x=1745464415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znyb38ry2bcKrLD3m+0rc/cT6gNSpjuqkU+5HpltG+o=;
        b=yGgs4SWicxHQr0s5E/WHWBueQrm6zrvbAecxyVwB7pWPbOqBPhQFx02evZMF41RkdI
         mSGJI1+4PX0+ovParw7UB2p5cnEn03atKC0FccbqI9OegDgVhCduT+vyG2fMZRaJu2lO
         AiWPDMXtufFbDh7+FbBzRvQWpXC733NZcBoPeo8FG+QBJCHK8hk0/FeRsc1/3Rkhi7SY
         VBeNBDZ+PErTIQ3Bfzj2cAuNi1vikI8yG6lSFAV+ZyaMTJlGwVrJ6gc/5hRtXzJp/sbV
         9Jx38Z5i6Tb9FYwO37E3qzJPkt/Dc+9hXQTs76H0J6P8IFuaNefZdKyLWHH9nCWVzutS
         hJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744859615; x=1745464415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znyb38ry2bcKrLD3m+0rc/cT6gNSpjuqkU+5HpltG+o=;
        b=Bn86xcMVH2mI66Hll4OPzMHzYdiRYnt0N3nG20bEzvwOM5NRbT7mw+Zf5CaHqYWCLd
         NgMXv5850v5MWLQxmtOLUWzgbV6oiXn+QICYITRHyfoBayPojt8aZrTWV0tMUm36X3Bd
         P3RzeGTq/LjPgD7DKf9vq6477dD9Pc0U7LtCNb7t0fC0vp2Vude5S+OVFYkWr/MOedfK
         SB7HNz8qevZAj3KQEXziMIzMCAWAY2t+0na3bdSQNcMsyV2i9xRrf39xvqW/HF2zhP0E
         kgyGxEPK0aWvUpG6cCKmmnsByXyOPQ64CG+M5/DbEhn9mjWVWFHlR4UgiEZ+LIyzV//w
         K0zw==
X-Forwarded-Encrypted: i=1; AJvYcCUBE8QgPkeaQSHMyT+I6GAxZUufUwpHYolHFsuf2UpBT4STASZoc8DpfbO06rztnLceqU6q@lists.linux.dev
X-Gm-Message-State: AOJu0YwOFV9G/uInb3cTiHCQ55gSqJcpbjUNuBIk0g3psRGXW+qrInfc
	NBGLyiqnG+gove5gmFd5OSn1GIMvDhV6kAw9ftq7Xg3DqaPxWs2lXcjavfCTsStbyu/rnd5XaRK
	Zv2v09Alw3m9BSvbLJfgbUNahfbxg97vh6MNX
X-Gm-Gg: ASbGncu7+C617VVvYyOsH2uny2kuMhC0y9a3rjF/N0vsEErfkDEdsB/oWaIDoqgbBkz
	bGMVgpAskM1ufoIijYCuOlcOW8fr55NdSrVtp2w/vdd5d1d68OCmGSIb88YYnet3vcBVzOPXgq0
	CddhfTspT3EwV7aVQ6nyKZ
X-Google-Smtp-Source: AGHT+IFw7kF7r3vqgCR+cGVl4G2MtxTmmev5AUh8oAejDfyWDC9AK+zMJ11T151RgjPuKZOmNsKzWzgm73emQolRzkw=
X-Received: by 2002:a05:6402:175c:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-5f4d2927f8fmr28040a12.7.1744859615261; Wed, 16 Apr 2025
 20:13:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415174145.346121-2-robertpang@google.com> <202504171044.TFdtTfEh-lkp@intel.com>
In-Reply-To: <202504171044.TFdtTfEh-lkp@intel.com>
From: Robert Pang <robertpang@google.com>
Date: Wed, 16 Apr 2025 20:13:24 -0700
X-Gm-Features: ATxdqUFBgiAHFh1P-CiVkjQQGtPiTBX0iJ-hw-ydXq4hjwl8qjDqcXLZwoair-I
Message-ID: <CAJhEC05SjwDBis3rfDw4-gg+tEyQ-aCkTSFVFs+Zw9xSSZUekw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] bcache: process fewer btree nodes in incremental
 GC cycles
To: kernel test robot <lkp@intel.com>
Cc: Coly Li <colyli@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	linux-bcache@vger.kernel.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, Mingzhe Zou <mingzhe.zou@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please accept my apologies for the build error. It appears that the current
patch is missing a macro for 64-bit integer division needed for the i386
architecture. I will address this issue and submit a revised version prompt=
ly.

On Wed, Apr 16, 2025 at 7:31=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Robert,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on v6.15-rc2 next-20250416]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Pang/bcache=
-process-fewer-btree-nodes-in-incremental-GC-cycles/20250416-133615
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20250415174145.346121-2-robertpa=
ng%40google.com
> patch subject: [PATCH v2 1/1] bcache: process fewer btree nodes in increm=
ental GC cycles
> config: i386-buildonly-randconfig-001-20250417 (https://download.01.org/0=
day-ci/archive/20250417/202504171044.TFdtTfEh-lkp@intel.com/config)
> compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df=
0ef89dd64126512e4ee27b4ac3fd8ddf6247)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250417/202504171044.TFdtTfEh-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504171044.TFdtTfEh-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
> >> ERROR: modpost: "__udivdi3" [drivers/md/bcache/bcache.ko] undefined!
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
