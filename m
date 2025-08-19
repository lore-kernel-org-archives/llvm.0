Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E2330FF23
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755589186; cv=none; b=IBat75X7KNIddheotD1CXeZ7/hTqZc4AF6uY8coP+Np47klh1ZqvAtMXSvJiXdGyg39T1ZvzcpaYtvVhIHMRocpUhQT5WKuwqo2KS10tGdDbp0t0/g/GRjh7N4432xjBNMizFEZh/VdQf2zCMOxmw+bwiwymb8Fm8XBz/3T4F60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755589186; c=relaxed/simple;
	bh=eRD1kroDbQ1a6DO8DjocsXJeFSn2D5Gc+Oh+p/Mt9VA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qh9mavTeBfSjtpfZo/KL/f2Q980vWoUfeK4VWQz1RLTaPLWYa8aAA9YO8kFPAM9IROjYvhlzEJPlcNTlpoMBEhAM+1JzS+M2n9BPlUxHXpBGxkzwPGhq8s9cqKrOqhgYmeshl/7y8QqWGMON+la0yp0N0oNc7I9jItCdEJwAsiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDIDutxr; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDIDutxr"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b654241so8854640a12.1
        for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 00:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755589183; x=1756193983; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlGG0MimgPVuD1cdmYrztEX7ylcMD0YKZDmGx1Z6TgU=;
        b=LDIDutxrkbbfeihoOYTI5sN1MGkG8iOa4oMau/HyXF75ec0Ust1B2mfqMij/ZWH1WR
         BffokBJulYsZfsP7STVrDJeoNeqYToyr/wDyaSgoj00U9qDBw7i+TNU+jkEetinar0mz
         runw7pY6dMqs8K1ALSzRUAnkgdoy4FKaWBw406CYW0GPxdOggo/Ht7GEk9B5ZWkHkBOT
         1/MwNi0/cIHI0VsHk1DKMf47pL6EwCcIm7ScKc14w9g+kdEAtO7Tbeq7Cy8BX5cx5f1A
         p/NV2z8OE10isj3tyNaa8qPtvfp/zIj8SsChWIKgGdL+PXjvL0nIGNcHUc6ahegD8NON
         BNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589183; x=1756193983;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JlGG0MimgPVuD1cdmYrztEX7ylcMD0YKZDmGx1Z6TgU=;
        b=IgHlpPshJY1DG8wrsNixxykimlXSiKqaXBUb5SyUWs8xehIPMnNxEv4LAJKJEaww/z
         pMVvNk7jUTY9HVef1lMco7OmY/1yTFmuL6pZhJc0JXA5EFdoLYH1oFkrWEwqa5YQLxgn
         4rhBBYiXtZ9JzQECFc1bZTbjEYTEOjs7zOwWHOa5hWlW3TXU1SKl8u0LiBg23O2Aywua
         gWsGqpqmCafws5RscsxWxvkvSpaSlcz0ZS+ssV/Mr4ra+pfnjBTmL8x4y7r1PAGAFrZr
         SlMdt6vUmj+Yurg/2SHODjzyL0pYy40l1DvFTLcA0N/BQj5DRSAe7vEt3VHl+FiZavmS
         hC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwXxOEMK4e4Zkag1my7FJb3LyuEIAPkzvQ3cISYR8abbiq4OysYLcn1NiTRfKPe/4DdcAr@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ9RR+A2qyspeXpfdzUbFppFsNTIoSPUIlaG7mi1+VY1mLv3u2
	yIklAv62UHTjaUFt2e667M7//gQCkWA8fJLYJVh44ugeN5aUY9f+NuFd
X-Gm-Gg: ASbGncupHSi5YnWaJ1EcJz8R/y1cvJT/OS38wx4c59ojhwxn2MZk4+kYrBmeIhGWTTg
	bZs0aU6b4l2n56i/cIDXhBX3MyjU+C2nVSaSUiD6F9Ds6/6xGMX41OpH7mMkDO4+rbFD+XpSfyg
	dRzx4ZChFhUWT6ZDlCHq5pvj4A49IF6OKqSM8sTr75t2NIJ3K4q1/zbiG1/CqzWJidzDJw3MPX+
	u3poEgEx9IWHXmW0gqD4Qx7/oyq0EZKWS6BSLHT1kDWW1ehsuuSMSE9+3uKwIkM5PCvyJtAm333
	Ckf1ArMetjssaD3jlu8e/Mpks8Z0bAHeTeG2dAJeIelnEH2Mag6nAUD2IsaEv7fHei5s2OoaFwD
	uI8Sdy6AoG+RonLsylgDrxg==
X-Google-Smtp-Source: AGHT+IFDydZFQrkosnxXfosEK8EVZgkb6qLnlT4kiVd7o1+cVB/7rTEUO0G9UdoGYY9iwV3LjvIXOQ==
X-Received: by 2002:a17:907:3e1d:b0:afc:bcfc:b3b7 with SMTP id a640c23a62f3a-afddd0d283amr142302066b.38.1755589182644;
        Tue, 19 Aug 2025 00:39:42 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53f2bsm973006866b.4.2025.08.19.00.39.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Aug 2025 00:39:42 -0700 (PDT)
Date: Tue, 19 Aug 2025 07:39:41 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Bill Wendling <morbo@google.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Justin Stitt <justinstitt@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 0/4] mm/mm_init: simplify deferred init of struct pages
Message-ID: <20250819073941.esl7z5ibqqeabunh@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250818064615.505641-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818064615.505641-1-rppt@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Mon, Aug 18, 2025 at 09:46:11AM +0300, Mike Rapoport wrote:
>From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
>Hi,
>
>These patches simplify deferred initialization of the memory map.
>
>Beside nice negative diffstat I measured 3ms reduction in the
>initialization of deferred pages on single node system with 64GiB of RAM.

Nice cleanup.

For this series:

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

I guess the speed up is from "use a job per zone". So we do initialization per
zone instead of per memblock range in the zone, right?

>
>I don't have access to large memory machines, so I'd really appreciate
>testing of these patches on them to make sure there's no regression there.
>
>The patches are also available at git:
>https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=deferred-memmap-init/v1
>
>Mike Rapoport (Microsoft) (4):
>  mm/mm_init: use deferred_init_memmap_chunk() in deferred_grow_zone()
>  mm/mm_init: deferred_init_memmap: use a job per zone
>  mm/mm_init: drop deferred_init_maxorder()
>  memblock: drop for_each_free_mem_pfn_range_in_zone_from()
>
> .clang-format            |   1 -
> include/linux/memblock.h |  22 -----
> mm/memblock.c            |  64 -------------
> mm/mm_init.c             | 195 +++++++++++++--------------------------
> 4 files changed, 62 insertions(+), 220 deletions(-)
>
>
>base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me
