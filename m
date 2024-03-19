Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6AD7BAFB
	for <llvm@lists.linux.dev>; Tue, 19 Mar 2024 11:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710846572; cv=none; b=OBS1+YCQjGYvedV6pTa1RYxEVHLH2VlGNBu1zVIlUeE2wku/DjytGPIAEOnDMfMTzALnNr2o78h4MH3xhstWZeSX5kY3PUv10QeFcmQYwhw5ZReYdIEHY3jjz1j9kkMNGm1qgdqgBzvhanGKrf1ui+cylhR+z8P4f1SFoqRBFxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710846572; c=relaxed/simple;
	bh=sBX9q9flXe4rDLLTikiy0lqMwDNq3tx8cV3867WS+2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bD1iLRDEedmq9zMvilggI1hj5KImh5IHUrwJ/x6R1UYkVKdo+jI0EF3bWS2luqTqlo9cwgjNxjrpw0GT3OHs2hLjuiHYndZY+Y9cJiW93YIZmkdtmpOvnC45vS3cy0y2s9SloT/qj0ViQ47gVk0MW3dncmXTt4uoRpwLuQ7s4Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hg7OjSSK; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hg7OjSSK"
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-7dacc916452so1201133241.0
        for <llvm@lists.linux.dev>; Tue, 19 Mar 2024 04:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710846569; x=1711451369; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iFFMom5/ZZ+nxNfevDyTk4uvoxRGCKNnKvOL6LWtnZw=;
        b=hg7OjSSK8+tFJNVqNv/8hcw2ws6/fILNsLbvhsYyr4VV+t978FAWRlNRWf4fsl4q10
         7KROpHo+AgAOUHigw2JLCPe/WdthAMizTWzOTlrMUKxiAgnM7JE6w4FVcWoTtpxdWJUe
         y04eUZOdk739+bPO31XIDAwrddkePKj6qruFqbkK/EuewA7UZbwziHblw2GQ7bkkxpz4
         y5D+0rMJ5iTw6syjOuMtfDc5vSQyyNRbxU+NJT9Np4NCT/QzvUethHm75sRuadB/9kt6
         D2Jinc5wAMDZwZZbM2O/RQGsOzdSZZ7QQK51m+PvBBPavzT4YB8FQrZBMEKehIpr7xav
         89TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710846569; x=1711451369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iFFMom5/ZZ+nxNfevDyTk4uvoxRGCKNnKvOL6LWtnZw=;
        b=DG4XjwytV62HfgY9M1z+bEdePdRQpdAx1QBCoFIBsfOHZOOzfy+q2IzNpwgt8Bab+Q
         bxzEjM9XASDeXVHRh38YDSM/mtRgzrY5Hhxi/pxzCf4PzVfqRN3wMd6EfOcLOZu69Qz3
         VMX3WHPZWs1/dfXdYGBx2HEWL12IP6qzZ0NXEpEyUMQHhmtld2V3yo52SnyoRANOAAXC
         0D8yXxUC1nv/wv3t8bcaZPS26wUVzln86hRO6faEKiEZExbb0NPZMB1AfP2oQ+Y1MEOC
         u69HGBj0nHdIlLxQRQr1fkAf60B8rc087OCRBLONWh3T2P3WqmOrsPflS8i8MBuYlaKt
         j4RA==
X-Forwarded-Encrypted: i=1; AJvYcCUQaXCfleP1TGdwem4U6f7PoSz7hBvASLRm2SOeI8AlgLCbAcDt0R3cKu0GGGsLCXTJOr08pbRBbb3GTvDGuaPkBm7rJQ==
X-Gm-Message-State: AOJu0YxXSt0xOsqzGWtY3F0rV1/uhiWnI1bsm4WHhZUehPDZcWy5K+C7
	3dNd5dg6yPGNafr63z1xpKmWKXYh6TCx5T23GtJl3EZRzg2SC8fwBnv4I9eRwPmH/8Q/lw/WnuW
	PZbpAk62xzsYw/GKMCUgD1D5+yCk=
X-Google-Smtp-Source: AGHT+IHM4xyglbb5pffkcPfzACI/wBLHk//vDjZGT4FoVpHhmkFKx2NL+9FyUklB5eUGBbhXcbX0g7MwXMxUrkqaoD8=
X-Received: by 2002:a05:6102:3a0b:b0:474:cb65:d400 with SMTP id
 b11-20020a0561023a0b00b00474cb65d400mr1843847vsu.24.1710846569394; Tue, 19
 Mar 2024 04:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240314141516.31747-1-liuhailong@oppo.com> <20240315081803.2223-1-liuhailong@oppo.com>
 <ZflTCY-Oaxm0U70u@tiehlicka>
In-Reply-To: <ZflTCY-Oaxm0U70u@tiehlicka>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 19 Mar 2024 19:09:18 +0800
Message-ID: <CAGsJ_4w0EHuAwvSFuqUsMO-bLjJwCmN_qjL6NuA043-4rgfgsQ@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "mm: skip CMA pages when they are not available"
To: Michal Hocko <mhocko@suse.com>, liuhailong@oppo.com
Cc: akpm@linux-foundation.org, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, surenb@google.com, zhaoyang.huang@unisoc.com, 
	quic_charante@quicinc.com, yuzhao@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 4:56=E2=80=AFPM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Fri 15-03-24 16:18:03, liuhailong@oppo.com wrote:
> > From: "Hailong.Liu" <liuhailong@oppo.com>
> >
> > This reverts
> > commit b7108d66318a ("Multi-gen LRU: skip CMA pages when they are not e=
ligible")
> > commit 5da226dbfce3 ("mm: skip CMA pages when they are not available")
> >
> > skip_cma may cause system not responding. if cma pages is large in lru_=
list
> > and system is in lowmemory, many tasks would direct reclaim and waste
> > cpu time to isolate_lru_pages and return.
> >
> > Test this patch on android-5.15 8G device
> > reproducer:
> > - cma_declare_contiguous 3G pages
> > - set /proc/sys/vm/swappiness 0 to enable direct_reclaim reclaim file
> >   only.
> > - run a memleak process in userspace
>
> Does this represent a sane configuration? CMA memory is unusable for
> kernel allocations and memleak process is also hard to reclaim due to
> swap suppression. Isn't such a system doomed to struggle to reclaim any
> memory? Btw. how does the same setup behave with the regular LRU
> implementation? My guess would be that it would struggle as well.

I assume the regular LRU implementation you are talking about is the LRU
without skip_cma()?

I remember Hailong mentioned something like " it also trigger memory psi
event to allow admin do something to release memory" and " without
patch the devices would kill camera process".  So it seems the difference
is if a killing will occur.

Hailong, would you like to provide more detail?

> --
> Michal Hocko
> SUSE Labs
>
