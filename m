Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A8B583ACF
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887131; cv=pass; b=FE8PEPHmUsA4mdjhVik8ZdpfhTsVL72D8IhZX7fKrtEw9aQ29lt3Gu7mQTwRMgjBiNODyKAF+jsOS/3SDEmH1g7wQRpwQlrxskkJAmYNfH7RjXNNMKI2tAxBH7iX9znH/yXFHlq7y7nr0Mg0bczQuQbGd/8KElkWMKhbxb2J0Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887131; c=relaxed/simple;
	bh=ZUsNUDfHNSayvs0cLcpq7eFB/vP8mG73JqyT3D6YigY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b41uPhlOwbs7T5X3tGLBFdb3eoUKZS0kSwtSiQK3P78bmSOjIFPQtkyQKPqX7sOhgLqKfDbuxlWX8O8tpEVIv2EfrOVE3b3evd92zAHxlTxads2qqW2O3AXJUQYk/GKBT2zKh7iHEi2KkzONQgZeQO1ua+BW8cbRjiEYLulWZok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VcP3ZH11; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VcP3ZH11"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so254885ad.0
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 10:05:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788887129; cv=none;
        d=google.com; s=arc-20260327;
        b=JSy3ZwxbVPXvFp5KVXOsvcgI4n+eXK23Q8UIt1avk64QNRXgKDjW+trxHCqAdbSswt
         8iI9RX/YIj9xz3iurYp8aldS0Eyi/BhyR34XaGTIKxi0++XfG3X3R6a+V42gEwwQ2q+C
         bKFJ9JHfho/eFbNsvR0lbFRGi31427qNVtehEsdC7bqEi+mMCuqVTNfPVUbKbCxh+yVU
         Mf4YhrViXln56bs+G6yH8Mjko2I2+tli9ka8TNjCg29Umyon7jenfQ4RXVpPeP/EYzKw
         s1Gb9BkcJqt3Y8EHiIKCkTYBxalOTJXsP/EcJHO9EWUuNcRITHjaRUrEcv+eFpkhSrqR
         771A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t2BEbL6oK2TNdrl07S1eqJBu8muYQ4YhMI1yhqy/NuU=;
        fh=rZPqpv72IUdLSkPcqn+wPGzTdPbbHvgUFKen6wpE13k=;
        b=Qt8y1/C7ZyFFi/QpFdQYYPDx007q6cq+KQSduPkU01tJC5gt2vh2wSfGD2Og1oI0oC
         eSpRm+vT+aHrdaKI5hyleQeD/GhjwAAOhqFS3/oRecXvQ8W5CDdFMhovE70Czib4nWqi
         x62CsmWCY7549H7EW/Uqix79hS+Z1Sydo6RfH9NZHja7uCF6H+oBga7mwBLZZ4MPX6bW
         ex3dtpRfoTzHLgpPUHWzVDm8vrk4MAS9bdsV80HgcnCEy5A2OB0N8et3LREt9uiOtsKM
         eJCRcDxF/VGS/rwHx9xSbJ2ohB2/kECpxyujZjA1GkLG+vhRKlxG34bU39oXXoju4jjD
         O2Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788887129; x=1789491929; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t2BEbL6oK2TNdrl07S1eqJBu8muYQ4YhMI1yhqy/NuU=;
        b=VcP3ZH11dhdIoMyagWbPOTGxicRrjmM5Mu56x7iTMzcIY2YhzqLWEwpsJ0QZ1pXL5a
         jAlSPoPelQOEtkFqoko97YRGUDsP7EDeXo6yqhVMduDldn94cK0lMLtOOKwk0c9UAD3f
         Z0gpLxQjWbO8pVBoGK7Mx7bIQW/2BI526YnYp8mdiF7gbQkgLnCvOhs06gzkM4hjP9gw
         53hC7LqGySFijzuRDSKAdO6EOAKD4XKT8lAO81eA8FMFCj9l+va2c93pRdTsy+kHccQF
         sBhd2AgIpEY6WdAXfFlCa3OzQ+vm2G1EUHBiUvBwMTUbK/q+SKvscVcbytuANJUFWzTq
         GxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887129; x=1789491929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t2BEbL6oK2TNdrl07S1eqJBu8muYQ4YhMI1yhqy/NuU=;
        b=mu1rrY8O82UCc606ltJzmbZQ5uptzzkCgL9rnaz5POiR33LNxcX5z3TBdVao9CSsLS
         vlT2GbECxifbbiMi3PLeyVqCFr1TKIq72dc3J00sHTDZx6kmwG4FAm7n7vDn3UgPIfzQ
         zRYCFk6nLpKgqw+mxJRzJrHhiacGmteEATFUX5wwV1FbyJM9oTZ+6lOriHgTLUdN9Nd1
         Am6JWPgsHnba4oMwyr4CIlKY/gMj325lTfjYaKMu3B6WcrxQKpxKVVRB3iHI0A1SJExL
         b15hlng6SInTCyy8XW30oFMiEpU/j8f1PY49SptHSxbvm0g07mSpe+ZnqcwcgFgguGWb
         0dVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxjRHRqyu2tIh32tgdaQ3aMQVLyadodE3Wt1rw2D7SBa2q2aBunwl1QjB0bGoGZ01Ljpjq5@lists.linux.dev
X-Gm-Message-State: AFuF++nj9bWexI/RDnaf3RgBlRVOn+s1kpuCtqDrwc8gJvwLDvS4LcQ2
	9gvY4Kp4nn9dtNAYRxMw4Sa1P968oviRWybc8oYRNfVEUfhl+4CX01KebcN1OzK8n4T9b2GYQFn
	u6ANXmlLEpvM/xOnv7dVePOmn+uPby4wXY7sKUNyW
X-Gm-Gg: AYBFou2LvWkb7qTPHffA1Opbgl0/nU4bxEKvjtVjCylYJ15I3a2mq94+RXZCXBuWLi+
	okGnNtlT4rBb57f/6rtVOcKAuZFljocHz9VlNPsIGfycGq2N8J0Ca0gNU9mOYEEJhUuX0FAuvBv
	ZBvBq9FGTy2noFIaZFp8DehRA+KQ1OLcHPCxk2NawwhBiYo5F4xbIurOGm4RbWAxI+j4ApoToQE
	GYUVgxP0jg8ALsv+haNEoH7NqORH0HJBXbW2MNaVpkT18f7l7Z198Gh6+wbpuGbGtbzcLnv0fnN
	gRMmBohZSdWoO+wjjGFsH5UOJZS5s7qmOrB4omxov7qE/QyKKtFS7LNTqfiGvBWE73lzGdVLChN
	Y/fNR8s6wCzvkOoIZ5cjkPIqticM3vbA=
X-Received: by 2002:a17:903:26cc:b0:2d5:db3d:1a43 with SMTP id
 d9443c01a7336-2db28e87ca5mr17559255ad.16.1788887128208; Tue, 08 Sep 2026
 10:05:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com> <20260908-kcov-extrecord-v3-8-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-8-dcbc11593e88@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 8 Sep 2026 19:04:50 +0200
X-Gm-Features: AcwNN1VvbLJASh_Ky3VRZJSD9T0ID1T_I_eVvcK3XtYNZ85Q5pJtmiWgBBKhAmI
Message-ID: <CAG48ez1ueO-rc+TKQZJoFuf0ingYR=E7s_exEDvOyE=CsDp7Ew@mail.gmail.com>
Subject: Re: [PATCH RFC v3 08/12] kcov: log freeing of SLUB objects and pages
To: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, llvm@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Harry Yoo <harry@kernel.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 6:55=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> To help with using CONFIG_KCOV_MEMORY for detecting use-after-free issues=
,
> log when memory (SLUB objects or page allocations) is being freed.
>
> This should happen after KASAN has already marked the memory as freed;
> this will become important if we allow driving delay injection off this
> in the future.

Oops, I should include the page allocator and SLUB people on this one
patch in the series, since I'm adding a hook in their code.

> Signed-off-by: Jann Horn <jannh@google.com>
> ---
>  include/uapi/linux/kcov.h | 1 +
>  mm/kasan/common.c         | 2 ++
>  mm/page_alloc.c           | 3 +++
>  3 files changed, 6 insertions(+)
>
> diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
> index 7d7147e7b427..76822d1c119a 100644
> --- a/include/uapi/linux/kcov.h
> +++ b/include/uapi/linux/kcov.h
> @@ -90,6 +90,7 @@ static inline __u64 kcov_remote_handle(__u64 subsys, __=
u64 inst)
>  #define MEMORY_ACCESS_RECORD_WRITE 0x10
>  #define MEMORY_ACCESS_RECORD_RMW 0x20
>  #define MEMORY_ACCESS_RECORD_ATOMIC 0x40
> +#define MEMORY_ACCESS_RECORD_FREE 0x80
>  struct memory_access_record {
>         __aligned_u64 ip_address_and_kcov_flags;
>         __aligned_u64 data_address;
> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> index 1ab77ac9719c..3a648eaad024 100644
> --- a/mm/kasan/common.c
> +++ b/mm/kasan/common.c
> @@ -283,6 +283,8 @@ bool __kasan_slab_free(struct kmem_cache *cache, void=
 *object, bool init,
>                 return false;
>
>         poison_slab_object(cache, object, init);
> +       _kcov_handle_memaccess(object, cache->object_size,
> +                                   MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACC=
ESS_RECORD_FREE);
>
>         if (no_quarantine)
>                 return false;
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 083cbcb5bdde..910d14925b84 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1446,6 +1446,9 @@ static __always_inline bool __free_pages_prepare(st=
ruct page *page,
>         if (init)
>                 clear_highpages_kasan_tagged(page, 1 << order);
>
> +       _kcov_handle_memaccess(page_address(page), (1 << order)*PAGE_SIZE=
,
> +                                   MEMORY_ACCESS_RECORD_WRITE|MEMORY_ACC=
ESS_RECORD_FREE);
> +
>         /*
>          * arch_free_page() can make the page's contents inaccessible.  s=
390
>          * does this.  So nothing which can access the page's contents sh=
ould
>
> --
> 2.55.0.979.g7e5102b832-goog
>
