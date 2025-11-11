Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46459280317
	for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852314; cv=none; b=oxIENpiJDKg96jAOJYKnmwoijHf5B8tJIJ2diqbH0ILwi4plEc/fvdL8fG8w2lPo1Ve/PL3xpUEUQdpoMFnm/ioLQ4U7IxFMNMTv/y0weBUxNAate4p95r+uWRKMGqA5NL63mZmH0hwupSWmJCPZ5VqO+4Yme3wU70T81t7/5Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852314; c=relaxed/simple;
	bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6945gMCNeBPMvjf5S6QwhIBMjiFcElOyU9vn5mkhgzkcPmLQUi2SWXGivLZvcHinUZzLcdCGZWIdA+1EeLzRgCG3N2tCKfyxoHVPgbnWvg+4ble7pYGA3t9iQ/UOHrKpOru5MIQpNmM2TjqKnN9RKdXUzW3ypGEEbqMELqbPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sVB9g2G8; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sVB9g2G8"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4edb029249aso19882841cf.2
        for <llvm@lists.linux.dev>; Tue, 11 Nov 2025 01:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852311; x=1763457111; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
        b=sVB9g2G8058ZfLVEUv3cRkD669kVgm2KIuNDZ87FyS3amnJXZWcykFIGqCjHgAgCav
         dYKaJWD5R1dyXM/q3y8ccEw72jTVR1SE3KfxpIqaoXjtae4ouoaEiCx8ZUDtoFSl5p+W
         4FxO24tTPXjBcn1D7y0g30wBkoJkU+tOHcqKwXHcf9v62aelsluMElXPZJq5RuETDKUP
         F/b3aLzvNg0jISzNsxrVcqXS924MrGDp1JuAoK1tiBZiyEMaUv/9JMo+2T70n8c8d1kZ
         yd4tkReWUNwEh5t+c5zmnvvxTmEGcRAkd71V9KikQ22xpYe8/6YK4Y7nWKPATuCMHN/O
         PTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852311; x=1763457111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
        b=FVQF7ByNZFpJ0sJPYcmOlJKBlV8croyTRGX1coNqzq8YrBdTFPTRVk4dcNnNDvBqn9
         5u1EdH9smvCAExRFo4aVXM8iLw7jXcaxhkD1rZLsZjmqcAnkBZC+BcPriDXfIY43E6j9
         zhmu/Q9Z9/U09wdf70jA7SfRwAqpwlypS75SXmsUSNHVHu331M9aFH4kmTjGOoTDQChm
         eNQfsWCqm/HV7GdiiMtZvmnTeeImRXhzKOHkFoM9veBZ0huYdBqbzgRAWLLt1FZ0uGIG
         xAPbN9dg44cy5D/WAQbMBnQlIQlIdzH+8ArjwIL2kuvP7kqwLIv4kXeTeMHw07/TqlZD
         lyCw==
X-Forwarded-Encrypted: i=1; AJvYcCVDff05y2wt++x9e0mrQjCKZ5Rpz/CaDk5uXrg4iJduipmP0SYWgqk453jKXMuqfKnLk7kq@lists.linux.dev
X-Gm-Message-State: AOJu0Yye+K9QjaPM2vtZ527fZ95VIstXenIyd3cy49aPOEx9rBVZbhwu
	wnstaTsrCgplMk1FoPKfxBuvyKWuLgPDirrSYREzF8rLZvyYkVmlxEE/pecFlMY6ubR4yBIEHEj
	LOQWFiq+JY0H9jFDHOYa4nSVkTo8cbzkKbEhYIEGO
X-Gm-Gg: ASbGnctJ+RAXqr7vaaT4oZNzHwVllj2xdbbbdzSQFxJdyIpjuzIDHaOWoHgPyfQZsOt
	5VQEuKM+sVMCH4wXoxuwaBnFGKOUP/61zDi8e/6iWzXS2vGIl2vgUzypxwXEEgEdxiU+Pcm3tr6
	QPTBJyA5b8FplE5rWsVQkggvlWazOk23C/xnh6hljOkhJqRqkvQWmlZXCxXT6drNaA3h5JeE/m1
	c+fBbtHBFxgmB3PolVM8rCeG049febQ7ilL7d/Khv70hezbrwft/8RjsZMugIRkwv5L2R58KA3W
	XfFh8ugNBq9sA4EHOxJ1Sul19juajJYpOUA1
X-Google-Smtp-Source: AGHT+IH+IyV5M3UDNVO30prt5PPyyx1n6sQAkg8H+r/cXESUVZ9Sxny0Upk5iwgOz2Gyh93ucwAfPrYSF2wYVT/cQJo=
X-Received: by 2002:ac8:7f84:0:b0:4d3:1b4f:dda1 with SMTP id
 d75a77b69052e-4eda4ff2f1fmr126391511cf.61.1762852310737; Tue, 11 Nov 2025
 01:11:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <f533bb094a566242ec196afbde222796c6d6c084.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <f533bb094a566242ec196afbde222796c6d6c084.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:11:14 +0100
X-Gm-Features: AWmQ_bnrR-pK5Rc9D-XEScjrYr9MOeawukkWZRpWJ1yHRGagV2Ym8rHVDa4nqXc
Message-ID: <CAG_fn=X-FB6vVtDC8WhQzF7cNePS5AtmC4W1-YfTce+5jOc+wA@mail.gmail.com>
Subject: Re: [PATCH v6 11/18] x86/kasan: KASAN raw shadow memory PTE init
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 9:07=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> In KASAN's generic mode the default value in shadow memory is zero.
> During initialization of shadow memory pages they are allocated and
> zeroed.
>
> In KASAN's tag-based mode the default tag for the arm64 architecture is
> 0xFE which corresponds to any memory that should not be accessed. On x86
> (where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
> during the initializations all the bytes in shadow memory pages should
> be filled with it.
>
> Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
> avoid zeroing out the memory so it can be set with the KASAN invalid
> tag.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Reviewed-by: Alexander Potapenko <glider@google.com>
