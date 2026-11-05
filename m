Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876980;
	b=VZ593Sg0ZeSoI0/RUxqbJdRDJT8sXg8KHPYwK6j5FOsiwMNAY6m5XohsncKVsPzYvsxD
	 ELHEV2Q7a6uVYI5u6xGvlyJDHbbm1IUCgAEAkykEYPpoO3WXUvRsXADxEBqhoEzLPjifi
	 W1t1w2XSvljZrnNVRiws/jwh9TBq6h6Q0BIfOWmNPJYBJ/+JgJ5Y+I29q9uuH2BmiKtZf
	 FH4u2zdu9LR7RQopEzkOq/Ip4XcW9mwyBYyxoAyebzGnIyclmnvISEJHnDk/iBop9ouzA
	 RzRIRGFWHl4PYDYPW4TmBcjvpcNeHYmZkUIwXKkDPIDQCzahzMANyQV4jMYc79dPlmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=NLxUrhb+i0y7kx7MWfP3g7AgEu7tvuVh8LKyS1nXFQo=;
	b=nnVW4nxTDNskE63UIr+Fx0hoQVcTJ87ZiTPMqmsZYLA++lWxit0jfKDjGkA9t+lgCNSh
	 xCQyFzrMP3cmPXBiUQzYXqrUXvca472U5sd4mGEcQ0h7JZXC6EOm2wSIzVjEgZXrx2q0g
	 i7VssKDfy6b46Limtw/x9/oMRTFhYvgLJ+al0/Vii1Qtqncn0e5n2SMXO1jiWO5JyUJQ0
	 32atPRhaRUbO5qBfwfs/bvRy6dQvotgmpoyHl7p4/i68NmjdrBTOgy0WXznetLs7+LKbW
	 d/H0+jZG+aLUXz/nHPeemIPQHW67TeiggGPJdcSZbAgRlP726DuJNOHWLPM0OBjkR/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y4DgVs1m;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D1606A326
	for <llvm@lists.linux.dev>; Thu,  5 Nov 2026 11:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 043D1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y4DgVs1m
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1438d9363fbso459077c88.0
        for <llvm@lists.linux.dev>; Thu, 05 Nov 2026 03:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793876979; x=1794481779; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NLxUrhb+i0y7kx7MWfP3g7AgEu7tvuVh8LKyS1nXFQo=;
        b=Y4DgVs1mFbgdNGLcgBhvyOBoF1nS7PPyb6/Fh4btEs71o6/fwGXF3hISD6BwQ8S3EN
         I/2Nnl2vDR71EjJsfXfEmFbz0B6I0nMnJtvIK3YwrG24aForRZPUbGwOPQryNP6XewKt
         zkt35oHDhO7F356/CQ31ie/UWSTOluOXZAUxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876979; x=1794481779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NLxUrhb+i0y7kx7MWfP3g7AgEu7tvuVh8LKyS1nXFQo=;
        b=OKG/189WaI+oglP48ufMrgVOT2K7ZgJxQncjEKTPEFB7nnOexAyTdyOfZH6PLqHiMs
         5Cl4OYBoDaTjT/JqHvYqOtClvI2ipsc2Ygx9JQYdbkxhAmjO4gB6JOjoZHkODaZoYPe8
         uGGjys4LPM3yw1JjUJP57LBU2CuUvQd162NFDpl8DAEL9M4xSqSozfd4V+O0YlQZpIz6
         xDVwX2HO5nrj+EPNXy1Df2IoQxgfriU1GxFSS5YpOTs9cobsUgVa7RVdEVo1V5I8ZBt1
         Z8RAfGBLvI86b1Qhrq+r5AEmvhq7t1itvJ33YjqXUXQK89UbUiqnd5ji8NAXWXK8xdVK
         P3dA==
X-Forwarded-Encrypted: i=1; AKwUvBwVxldOaMeFL9rzxSfrwvxpStIrOp01CxeZuoWZFtxc7/omeu67sh49kPzsf1tYkAnTODWk@lists.linux.dev
X-Gm-Message-State: APuU4Z/cu30KIyigOT39jupq2+IF8vXx7p9o8oEbzAtdGdHiZBhPLvx1
	6w3qvyH79fsFKflOuwI7WGOd/UFkp+UYTTuSAVNGM3SKDXhhVceG1n6LSnVPev0D6g==
X-Gm-Gg: AYBFou1KMs4kGqfLZUX1lxDYJGbpZFxG8FyAeZQeKrRi2Zjq6FYr89otBHiIaE9HuG1
	lLHSHAXVTvpJkZ0vACqawWVtVcpBLumtbdRxnRVjLUt6u9OE3f/jQ5L6SPZ4BqKMGar1r52OYwx
	MP6eeDtHFwEsBZzndRJr9fQhvSAlGrjx6/LW7+EtdgFlqKSf0eizGFxXHxaI/WNYTpSsauQlKRe
	yHJZ57lWzAhBks0yDzddn6QRwKvy4IybqQH/xsI8I18WxAn4K34/ZVAsCbs4suBg+IVRd/evXt4
	jrK0y6w86Qag7e+R3VrIFLXqG8nes7ivfyu+ZmVrdw0woCqZJMtFSsLF67jP6YCLpN/EF3uIOwH
	NG7Zp77SHl31/N0Jf9ZuaHfQmECFmE1rr7lhiLVByPJMklXMkZLcv571Tzue/vEj8cgns2rliQP
	Ya3D634qUnC+CwjD1g4dz/g9jpMvqTBWQ/WPE+Adoml3cqXMIDUhMXTcv16hwm2oZYktdGBR2aK
	po122ian9ieoyXnNzixwhxkko51lxbvTyPVu4YbltOF4RkQ92fc+OAXsFemr6ylngh93qVnexSk
	nMmAlddgh6Rch+KScU7t0ZbH8/R3oDDpvB9M0WfvKPjEHAr+M5vI5pC04WXG39mPFvg=
X-Received: by 2002:a05:7022:5e08:b0:1b2:42db:8a5d with SMTP id a92af1059eb24-1b24f42dcf9mr2938410c88.3.1793876978922;
        Thu, 05 Nov 2026 03:09:38 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:8bc:6b25:484c:8975])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm18931590c88.2.2026.11.05.03.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:09:38 -0800 (PST)
Date: Thu, 5 Nov 2026 20:09:34 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jenhao Chen <jenhaochen@google.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, minchan@google.com, liumartin@google.com, 
	benwei@google.com
Subject: Re: [PATCH] mm/zsmalloc: inline obj_malloc() and obj_free()
Message-ID: <auxjJapQ4j8518aH@google.com>
References: <20261030121700.260975-1-jenhaochen@google.com>
 <auwR7gnuLsF0lpmG@google.com>
 <20261105103947.7521-1-jenhaochen@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105103947.7521-1-jenhaochen@google.com>

On (26/11/05 10:39), Jenhao Chen wrote:
> On (26/11/05 14:23), Sergey Senozhatsky wrote:
> > I suppose there is performance benefit?
> > 
> > I guess I don't mind in principle, one thing to note is that this conflicts
> > with [1].
> > 
> > [1] https://lore.kernel.org/linux-kernel/20261105044752.1997895-1-senozhatsky@chromium.org
> 
> Hi Sergey,

Hello,

> Yes -- in a steady-state microbenchmark of paired alloc+write and free
> operations across 8 compressed object size classes (384..3136 B):
> 
> 1. On current mm-new (zs_malloc + zs_obj_write + zs_free):
>    - Clang 22 -O2: -7.7 (arm64) / -11.8 (x86_64) retired instructions
>      per pair (-3.2% cycles on x86_64).
>    - Clang 22 -O2 + CONFIG_AUTOFDO_CLANG: -13.0 (arm64) / -17.5 (x86_64)
>      retired instructions per pair (-4.8% cycles on x86_64), while
>      shrinking zs_malloc() from 2,872 B to 1,828 B on arm64 (-36%) and
>      2,088 B to 1,474 B on x86_64 (-29%).
>    - GCC 15 -O2 (x86_64, without AutoFDO): GCC leaves both obj_malloc()
>      (306 B) and obj_free() (120 B) out-of-line while inlining the
>      single-caller slow path alloc_zspage() into zs_malloc(); the patch
>      saves -23.7 retired instructions per pair and shrinks zs_malloc()
>      from 1,738 B to 1,441 B (-17%).

Cool.

> 2. Rebased on top of [1] (zs_store + zs_free):
>    In [PATCH 6/7], the new static obj_write() helper has two call sites
>    in zs_store(), so both Clang 22 -O2 (360 B on arm64, 219 B on x86_64)
>    and GCC 15 -O2 (obj_write.isra.0, 229 B on x86_64) leave obj_write()
>    out-of-line as well. In the zs_store() fast path, obj_malloc() packs
>    (m_zpdesc, obj, zspage->class) via location_to_obj(), and the
>    out-of-line obj_write() immediately unpacks obj_to_location(),
>    recomputes offset_in_page(class->size * obj_idx), and re-checks
>    !ZsHugePage(zspage).
> 
>    If we also mark obj_write() __always_inline alongside obj_malloc()
>    and obj_free() (with noinline on alloc_zspage()), the compiler CSEs
>    those redundant operations across the fast path:
>    - arm64 (Clang 22): -31.3 (-O2, -4.0%) / -34.7 (-O2 + AUTOFDO, -4.5%)
>      retired instructions per zs_store() + zs_free() pair (vs. -8.4 for
>      obj_malloc() alone), shrinking zs_store() under AUTOFDO from
>      3,144 B to 2,448 B (-22%).
>    - x86_64 (Clang 22): -26.6 (-O2) / -31.8 (-O2 + AUTOFDO) retired
>      instructions per pair (~4.0-4.5% latency reduction).
>    - x86_64 (GCC 15 -O2): -37.1 retired instructions (-5.1%) and -5.3%
>      latency (-5.5% cycles) per pair, while keeping zs_store() slightly
>      smaller (1,997 B -> 1,943 B).

Great, I'd love to see that in v2 commit message.

> Would you prefer that I send v2 rebased on top of [1] (including
> __always_inline on obj_write()), or send v2 against current mm-new
> first?

If it doesn't trouble you too much, can we finalize [1] first so then
you can send your patch atop of it?  I can ping you when [1] is done.
