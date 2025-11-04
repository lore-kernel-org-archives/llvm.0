Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436D7335553
	for <llvm@lists.linux.dev>; Tue,  4 Nov 2025 17:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762277611; cv=none; b=k3A5vmyxobKCmeesv3XmRWCMiBpd8VUrx92F8VNlBXPTg8ESqzCQDsS0GD8fIPqnPCyrb7MDMVbYWQ5cJ6YT5emigI926xGfP32Xr5pne+9hubG7YKNv2/u+Xf1KMRSA3VHk1LaI+/cukz9I0zSxSIF3dC2e6gyoR1RMk9VsyZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762277611; c=relaxed/simple;
	bh=KEbGvm2hDSQS8jirig5zERdsRyiy9f6KQWSjXT4BpaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g28kyFZXnPqYmMJkwSY2opX36k08VyqREnTChi+E2IUIl0cJco/P2FKLj2lOe+dVP1Trf/DYy7jklG7Xn4yuAhKlR3qHGacXk7I0+LJf3Rf4NL+psvlL0KpzggI8oVIjSw8yIJnmZrQBECbmE2YuvWXcIZc1Uic3FNenrEj5OCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Tbf47s/z; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Tbf47s/z"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640c48b3b90so3397914a12.0
        for <llvm@lists.linux.dev>; Tue, 04 Nov 2025 09:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762277607; x=1762882407; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dTfDTquCk48dkTU3Tq45eZhigns6jK7aZyvpfJOfrnA=;
        b=Tbf47s/zUjp2bCcE9S6kWLbmG+NxwbDJNbkgp0twwBQm1cGc0gyJKULHGEoVZlKKDG
         HyXFXpZZnKLb6M18vpx3eRkt3rORcYht8aouV+0x6BUNBJIzi8N2Y+Fq/5Hu78n3I6YM
         BgQHFUns/AxqF/4UKvX6SQkM+1Bk6SnPZcse+gfg5iGKQZvK3wcfd1Eh2u5m5VTWcriB
         LsqK43NyKV7qNmFLk9Rq9pQoyJlllXBEpcG1LPnFGtWyAATGT4n5+OY0yq/t3TDBjRLR
         XIY/w2Au784wdAJrh1jPw29N5xO7Dm9lFnDKEGLC+kR7pLqLAw/VxSnySVAhWRX30svx
         L6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762277607; x=1762882407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dTfDTquCk48dkTU3Tq45eZhigns6jK7aZyvpfJOfrnA=;
        b=GxkxxKXimaSXCywbHxXUGjaYd3+qhVZSy6AzkEX7a545sHpdCdFhjHeIbeD5g5Qm6h
         xdb/hhj1j5oZqrM920iHr2GGrn6WZwNQYakr4BsKMJrQ+f1DhGJUt5CK35jtrenwhG11
         Ioy1wt21D6rOPqBPC5LuX+tMQfkJSmPx9M/0zU1phahpGKJyd/4KvV8RiZgxeE30JxVU
         ZAZdxk+6t9vXwWASDqwFe6e5Fly0TPnde/WdYTFmPISkWbDDGAf/mo1/PF8dAnsVC8d5
         tNgAveZ1DLmXYWuRYPWwzSi66HLVBWRgSBYbzFH2CjDFGGLsGAtmycuAjG2xbOPcQjtD
         c2EA==
X-Gm-Message-State: AOJu0YwqbmmOyMqJ54Q1aMnlp6REzARmHSJ0c1YYoKQnHSWMw2YmYGu9
	n4vGmh9m31mQB48Ghbxc402FdrGgW9MNj5NeoZE+Bwb9SPQnf4F+xsMWa5L8azwKj1uCayDGlxM
	gBXejMDpb0KAQfa3sc62F/Ky0CGk9OGQ+kXZChfa6kXtBQK+kNRcOyBjNlQ==
X-Gm-Gg: ASbGncvczdVP3LvKSS3xH1N0+pjr5vNfXjTF32egOC8N4Lt1ZrmRQEBwME2hgdxS1XD
	jkacbdaKo32xlys+CjTT5P0qGYoGvI9UQn6e9eknlMqQIoFq+ekTu65+0Q5kPa97m5taNCMEd+F
	06GC5+Qdq50BuaRF8aKDdim5Zu8ZU47xjZIYXtIuPsX1tJw+EayvrpSiCB1Udd21TyN+mikDLZU
	JKN+psBS6DFePhv2KaxPAEyguJ2NwGQCMs+W02o0PZeMRShpaVfFiqTONRdzRJlgCNt
X-Google-Smtp-Source: AGHT+IHAtkWxLI4f079UeX9mWGwD7T230+rA0BeumknybAB451rxF/wEunoh94xjXza19vrHmYhvGiuhu0O1dH647iw=
X-Received: by 2002:a05:6402:1447:b0:640:ea21:8bfd with SMTP id
 4fb4d7f45d1cf-64105b7a66amr13762a12.31.1762277607365; Tue, 04 Nov 2025
 09:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511042251.paO6f5BZ-lkp@intel.com> <aQod7jDFBjw9T-u2@kernel.org>
In-Reply-To: <aQod7jDFBjw9T-u2@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 4 Nov 2025 12:32:50 -0500
X-Gm-Features: AWmQ_blKIkIlMfgAINdWoBAGRXf_NXuynpSKevp0VOCPWGaVDe_zHYFu-h4128E
Message-ID: <CA+CK2bBYF5AndNHgqcb5zDbUOV04nE6xiZ0igcTdYf-GOU4aOQ@mail.gmail.com>
Subject: Re: [linux-next:master 4972/5926] kernel/kexec_handover_debug.c:16:18:
 error: use of undeclared identifier 'kho_scratch_cnt'
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Eh, "kho: make debugfs interface optional" makes this variable external.

Let me see how to fix this quickly.

On Tue, Nov 4, 2025 at 10:38=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> (adding Pasha)
>
> On Tue, Nov 04, 2025 at 10:48:31PM +0800, kernel test robot wrote:
> > Hi Mike,
> >
> > First bad commit (maybe !=3D root cause):
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   17490bd0527f59d841168457b245581f314b5fa0
> > commit: 8c211175c3abcebb8bffce8095d78d193e482105 [4972/5926] liveupdate=
-kho-warn-and-fail-on-metadata-or-preserved-memory-in-scratch-area-fix
> > config: x86_64-randconfig-071-20251104 (https://download.01.org/0day-ci=
/archive/20251104/202511042251.paO6f5BZ-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20251104/202511042251.paO6f5BZ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511042251.paO6f5BZ-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> kernel/kexec_handover_debug.c:16:18: error: use of undeclared identi=
fier 'kho_scratch_cnt'
> >       16 |         for (i =3D 0; i < kho_scratch_cnt; i++) {
> >          |                         ^
> > >> kernel/kexec_handover_debug.c:17:19: error: use of undeclared identi=
fier 'kho_scratch'
> >       17 |                 scratch_start =3D kho_scratch[i].addr;
> >          |                                 ^
> >    kernel/kexec_handover_debug.c:18:17: error: use of undeclared identi=
fier 'kho_scratch'
> >       18 |                 scratch_end =3D kho_scratch[i].addr + kho_sc=
ratch[i].size;
> >          |                               ^
> >    kernel/kexec_handover_debug.c:18:39: error: use of undeclared identi=
fier 'kho_scratch'
> >       18 |                 scratch_end =3D kho_scratch[i].addr + kho_sc=
ratch[i].size;
> >          |                                                     ^
> >    4 errors generated.
> >
> >
> > vim +/kho_scratch_cnt +16 kernel/kexec_handover_debug.c
> >
> > 4039a00022d42a Pasha Tatashin 2025-10-20  10
> > 4039a00022d42a Pasha Tatashin 2025-10-20  11  bool kho_scratch_overlap(=
phys_addr_t phys, size_t size)
> > 4039a00022d42a Pasha Tatashin 2025-10-20  12  {
> > 4039a00022d42a Pasha Tatashin 2025-10-20  13          phys_addr_t scrat=
ch_start, scratch_end;
> > 4039a00022d42a Pasha Tatashin 2025-10-20  14          unsigned int i;
> > 4039a00022d42a Pasha Tatashin 2025-10-20  15
> > 4039a00022d42a Pasha Tatashin 2025-10-20 @16          for (i =3D 0; i <=
 kho_scratch_cnt; i++) {
> > 4039a00022d42a Pasha Tatashin 2025-10-20 @17                  scratch_s=
tart =3D kho_scratch[i].addr;
> >
> > :::::: The code at line 16 was first introduced by commit
> > :::::: 4039a00022d42ac3d68b2eea63066bc9f7ef89ce kho: warn and fail on m=
etadata or preserved memory in scratch area
> >
> > :::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
> > :::::: CC: Andrew Morton <akpm@linux-foundation.org>
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
> --
> Sincerely yours,
> Mike.
