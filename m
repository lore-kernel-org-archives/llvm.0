Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5792D7DFB
	for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762795981; cv=none; b=rhFtK5vDvmmYcsxdQhs6izCEms65T37Bg6Du7vlxQ2kHSPeiA34lSEAkqawOXi2E/JcNf5kSsHptiF6+jGbx9NEAQJsoG3lYTxZoPF73wSRYnOVnKMEPzotht/+GJSGWJpzb/BHUZGUlTRnts8Mt+xAThsHxJFxy2m/uFOkImzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762795981; c=relaxed/simple;
	bh=lavqjS8uyddXCf50slP6/gj/LovmQ9D/FO5ATpZAsEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvsMOay80eVUkEpNlKAeBmp1PVU5j0QV1zw5oG4+T3EZ7QPAiZCJ3lRr1rlprGKdYr6phPhbI3OfaRH6YyuS/RjMqlF+TIxksmf+YLe6FmxFd276I+diJKFSCWm2dmpqkmfAkxS8vJfCckUwWzZdPFTGExlR+fN6Io1ZZJBdpEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kksu71tr; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kksu71tr"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88249766055so20047626d6.1
        for <llvm@lists.linux.dev>; Mon, 10 Nov 2025 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762795979; x=1763400779; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=auNNYNeszcnW8UxlPsUXlu6HqCk9VFPDDrt3cDy7QDk=;
        b=kksu71trA8pg8C9i8QZ2jW9IqCMZ2+alIfja1ZfsWBIlTwu2e6gvyPML5RRGngckxb
         TYJ1PcILezWTooGNXCxVX2YGmEWUzy6GURQx0h/WUvMs4V7vkbYsdh+g0KuTDktmUEj9
         E0VXIJxVFnetZN466ftApbv9ph6CD8Xe66/LfZPMooamHCpgWPybmwpJXjJGykuvDOZh
         092Z743cqZlYWmoS/hYeLET6U52xJbHLIWBH8WVCGAtKHTHlQeKbKmlFwyL2WYEA15MO
         +Mv9RSLBY3Qq7F7zuOc0FxN4Qck445U0cqt5Ndpmgyq8GE9qVV6riIrOye4/fxZrVCzq
         x7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762795979; x=1763400779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=auNNYNeszcnW8UxlPsUXlu6HqCk9VFPDDrt3cDy7QDk=;
        b=ui3ny8xjOIU+ldHeOWm1OSfv00FIfA6P60/kz27lWU5lcdVJsW62ndPjivafUCVutm
         5kP+BmMfXV7xmwGrsjX95r8+xbRsccYs/iCpTjmmqHCifa+gVhu41EIXWU3OrjHMHgCw
         /0Fanh4D/xTg5qMBR4Cg+Be8FHHfzGq00kTBqrbGx0L/yr5LmQ2Yjl71JG0RqyDJ48Wl
         1C1Op4QAuTOet/knkt26Y29tcINree9juzQjl4eNZpYLNons3gRMS0rh4sbBga4XaXVd
         E760/TFY47KJFMbxEULMPpxomR/R9XvlOSwexrMZ16BmfLl73LKKDm9Ov3CgmmaZqZ0u
         PrKg==
X-Forwarded-Encrypted: i=1; AJvYcCWtx2maTLC4CrxKEgA+CuGThZNP2FlE6lp5GTQcRyAg5dayb1sZGVtRQJA4ZErNAfOguLXd@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb7PCJKCqlyzpR1j/uNZMvUm8rQRjYtnZIhI0gJVM+m7iRp5ni
	e+U6iJb1pGV0RFvN81vregreFMYxRZYXbhNq01Vri08Ck3vNX1KMBCAjskdahqRXnb1JAneYrY3
	YJtPLJwxyc70pe+MQvhrCpvX3ME86PZn+FJE6DdWv
X-Gm-Gg: ASbGncvR/2f3ti+gryThpLL/NoeLpQbIqG2ac28qCMTddJWAIK7eWoQH7irZnN1cZxz
	OVYjTs14HByGGqVET+DmFjm+ZM0ycvzX8V9H8drtLr9pEc1zjbx03ueuijeYUgQ3YuMG3lWcphw
	glW6FbnAVELqM3oa3JLUW39TGlWmZedwXBkeCU+DJY3H5/y4FXYHSK5gQnjcMcbnYvLCn30GiVs
	U40O1Ee1CMKrEnaSked+SZ670zr0vIKI+qlYHgwq4TShlW4TiFvICJKMHX7mKIXfuhNZ0xJRzYN
	ixp+oaDmD4v+SQc=
X-Google-Smtp-Source: AGHT+IHeuRC7ChrdFjjxvcWC3ajdMKHJ+Azj7LDyTH5BCluSFj1o6p4ZSWP6EGrRrokOPiEV3z2rvlDUhI4wexrXKNM=
X-Received: by 2002:a0c:e00a:0:b0:882:4660:3724 with SMTP id
 6a1803df08f44-88246605291mr69808466d6.63.1762795978283; Mon, 10 Nov 2025
 09:32:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <fbce40a59b0a22a5735cb6e9b95c5a45a34b23cb.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Mon, 10 Nov 2025 18:32:21 +0100
X-Gm-Features: AWmQ_bmUvxxbg_c-XB1Dy80QL57feg4coPRIZHNTl9ervff8Rzi8S1pGrWY59Fo
Message-ID: <CAG_fn=Wj9rB0jHKT3QKjZsPYce1JFcb1e72QBOBP52Ybs3_qgQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/18] kasan: Unpoison pcpu chunks with base address tag
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
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, stable@vger.kernel.org, 
	Baoquan He <bhe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:05=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> The problem presented here is related to NUMA systems and tag-based
> KASAN modes - software and hardware ones. It can be explained in the
> following points:
>
>         1. There can be more than one virtual memory chunk.
>         2. Chunk's base address has a tag.
>         3. The base address points at the first chunk and thus inherits
>            the tag of the first chunk.
>         4. The subsequent chunks will be accessed with the tag from the
>            first chunk.
>         5. Thus, the subsequent chunks need to have their tag set to
>            match that of the first chunk.
>
> Refactor code by moving it into a helper in preparation for the actual
> fix.

The code in the helper function:

> +void __kasan_unpoison_vmap_areas(struct vm_struct **vms, int nr_vms)
> +{
> +       int area;
> +
> +       for (area =3D 0 ; area < nr_vms ; area++) {
> +               kasan_poison(vms[area]->addr, vms[area]->size,
> +                            arch_kasan_get_tag(vms[area]->addr), false);
> +       }
> +}

is different from what was originally called:

> -       for (area =3D 0; area < nr_vms; area++)
> -               vms[area]->addr =3D kasan_unpoison_vmalloc(vms[area]->add=
r,
> -                               vms[area]->size, KASAN_VMALLOC_PROT_NORMA=
L);
> +       kasan_unpoison_vmap_areas(vms, nr_vms);

, so the patch description is a bit misleading.

Please also ensure you fix the errors reported by kbuild test robot.
