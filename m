Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB5C31CA61
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 09:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755597147; cv=none; b=kqg89N15hbGRn7b0LBTBJ0938ntweKt21r9ecQxfQEJWMK7Hp7JnxeeleLERP9cugCXQw9dDgtFNW/6zPZb2RAC6A6sftxGV7Rv/rU8I2FO6Xdgn5Hpuf/324g388E9Q6bG8fWXT6hW9uVyVlQ8hTNeSuPB0A/Mk36kMEowk0Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755597147; c=relaxed/simple;
	bh=qAs0XcBYhHLYErfDfebFruRjYp1XDjaXf1ddxitMbfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5FkToq4qz1ozj7HU3J1QsJV6I0TiF5NzjY0z+RpuVekoQbxGhXuLARWzrPgA0GgEIoOeHRiRoEBZppbsc7NeGc1WpUxubaEcNAbNntEhZldP8fbOPMhjRxgqKbh2GXHYdv7MZDC/Wr+tZhrOPsfEV8rCvqNQ7rRrE1bdbhymCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbuLjQ6J; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbuLjQ6J"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6188b7532f3so9170149a12.2
        for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755597144; x=1756201944; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGKilKkH6ulJbbdDF/XnTU/jMrrNQ/OZzlvjuNWjrx4=;
        b=DbuLjQ6J/Qyy8d7WUI52qngiyySvzGauyC9+ef+IgtfAe2Iqybqm8ImaJsFMWGQpu0
         r94t4MfRzyYXkez8tHBGHVlEmXOxLbkpS4qogRwmdBcmjdYhLojqYD0rzD0yfrD7jRYQ
         v1zZzE5YNJkBt3B64Grfs8D8ZOzLSPQRpwPuZAmax2L023422TKWLAUsvbF4dM1D+An3
         bz2t1Ul2sD065tH320GxAEAqYhGP1oUWv1QIlvnY++W+8LcXLjiy3kJ8K7Fp1CJ2HzVH
         PICMiL7NxRlSuWVa4m6QhZLXfCr7HvRlL3SQWZ1Z56GzfBa5dDnHIboAbDgjLro67o9+
         limg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755597144; x=1756201944;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGKilKkH6ulJbbdDF/XnTU/jMrrNQ/OZzlvjuNWjrx4=;
        b=YzkRYdPaC7PlDCezXFdlQJ3p/vDg688J3DRbttBcf9pFg+sjiiQ3zddUxx00ApqJFf
         dL1SJxDuqPFDyieGUiowZ2NEcfMb84JLyCLZho1Sjko5II+tRLIBIf1R09rxlnvQ8yOB
         RyitBf/MsyVB6m4gDsgyWwhLqtaWtFqJJ9wsicKXS2OXEWEQFKkB6g9zmJ3kGlJZW2tH
         zpsdzjm9HCSpSuHJkQG4lhuFzSnxf179XCar5PiBpFWFMf7maoMATMkMBcVllHWR9h+B
         Ptor1aK189vdAh34HjjkLtdT/W4Onvp6soTqB99j4P5o+fEnQPXDGhtw2/eMAPqIMmNV
         y5Ew==
X-Forwarded-Encrypted: i=1; AJvYcCVvqYnH0aJXHdlDIi8j9wrd2s/uqZCWOv3masouTOzROKvLCHK/QK97+q8PFW0UKhjwSVHv@lists.linux.dev
X-Gm-Message-State: AOJu0YwFpR22cxHjm5JYeAnVjCW8/oVMX+qK2FKYhbEt0lhbqxJa6zmz
	dpxP0o8TRyNjhWhSjgrZHMvRKExb13YN9Ym2KX6pnSqyKCypxn9f2vqg
X-Gm-Gg: ASbGncv+0YGUbRg2oEfNeA/LfxefvzkIckkiz+J9lyUngJ+59tClf3/8JaeKoMHf+sL
	aLZASfUwUrTkwNdpFKDysxK8iuUhj5GR8tgZjpQfQyxkRjYpRFkWACISGF9VetekafEl6jZ1uSq
	nFzb1UTujUX1nQBjvuplm4lPUlmH36tLP4lRa6WWgqzBeCScFqq602bJZzWbPeJki4wejcIi0xA
	IaAyX43UdljlYa9fccH1vKS0Pqo3OnAdH3xDHf48yH5SY/UYSiM55rdKQVakJ2jbjQ+QNpUZMOt
	fRwmS+u7qEo89fU+hqEviHO9sZyw+qqKuAgP6zmiNd2cW7gCRyAyfV1IIjGaK+ffGbDbWT2Aoz5
	QBbbf6eHZdhc5lecKxKnBlg==
X-Google-Smtp-Source: AGHT+IGl4szIJa+BhsJtYd6B7f8e6cbRaIoS3/RZYsKJqrTQ2MNq/q3Jkblc6AIW/S6WMxr98PJw4A==
X-Received: by 2002:a17:907:d26:b0:af9:c31c:eeca with SMTP id a640c23a62f3a-afddd1ead43mr171516166b.48.1755597144172;
        Tue, 19 Aug 2025 02:52:24 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdd04e4d9sm980813666b.113.2025.08.19.02.52.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Aug 2025 02:52:23 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:52:23 +0000
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
Subject: Re: [PATCH 1/4] mm/mm_init: use deferred_init_memmap_chunk() in
 deferred_grow_zone()
Message-ID: <20250819095223.ckjdsii4gc6u4nec@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250818064615.505641-1-rppt@kernel.org>
 <20250818064615.505641-2-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818064615.505641-2-rppt@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

Hi, Mike

After going through the code again, I have some trivial thoughts to discuss
with you. If not right, please let me know.

On Mon, Aug 18, 2025 at 09:46:12AM +0300, Mike Rapoport wrote:
[...]
> bool __init deferred_grow_zone(struct zone *zone, unsigned int order)
> {
>-	unsigned long nr_pages_needed = ALIGN(1 << order, PAGES_PER_SECTION);
>+	unsigned long nr_pages_needed = SECTION_ALIGN_UP(1 << order);
> 	pg_data_t *pgdat = zone->zone_pgdat;
> 	unsigned long first_deferred_pfn = pgdat->first_deferred_pfn;
> 	unsigned long spfn, epfn, flags;
> 	unsigned long nr_pages = 0;
>-	u64 i = 0;
> 
> 	/* Only the last zone may have deferred pages */
> 	if (zone_end_pfn(zone) != pgdat_end_pfn(pgdat))
>@@ -2262,37 +2272,26 @@ bool __init deferred_grow_zone(struct zone *zone, unsigned int order)
> 		return true;
> 	}

In the file above this line, there is a compare between first_deferred_pfn and
its original value after grab pgdat_resize_lock.

I am thinking to compare first_deferred_pfn with ULONG_MAX, as it compared in
deferred_init_memmap(). This indicate this zone has already been initialized
totally.

Current code guard this by spfn < zone_end_pfn(zone). Maybe a check ahead
would be more clear?

> 
>-	/* If the zone is empty somebody else may have cleared out the zone */
>-	if (!deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn,
>-						 first_deferred_pfn)) {
>-		pgdat->first_deferred_pfn = ULONG_MAX;
>-		pgdat_resize_unlock(pgdat, &flags);
>-		/* Retry only once. */
>-		return first_deferred_pfn != ULONG_MAX;
>+	/*
>+	 * Initialize at least nr_pages_needed in section chunks.
>+	 * If a section has less free memory than nr_pages_needed, the next
>+	 * section will be also initalized.
>+	 * Note, that it still does not guarantee that allocation of order can
>+	 * be satisfied if the sections are fragmented because of memblock
>+	 * allocations.
>+	 */
>+	for (spfn = first_deferred_pfn, epfn = SECTION_ALIGN_UP(spfn + 1);

I am expecting first_deferred_pfn is section aligned. So epfn += PAGES_PER_SECTION
is fine?

Maybe I missed something.

>+	     nr_pages < nr_pages_needed && spfn < zone_end_pfn(zone);
>+	     spfn = epfn, epfn += PAGES_PER_SECTION) {
>+		nr_pages += deferred_init_memmap_chunk(spfn, epfn, zone);
> 	}
> 
> 	/*
>-	 * Initialize and free pages in MAX_PAGE_ORDER sized increments so
>-	 * that we can avoid introducing any issues with the buddy
>-	 * allocator.
>+	 * There were no pages to initialize and free which means the zone's
>+	 * memory map is completely initialized.
> 	 */
>-	while (spfn < epfn) {
>-		/* update our first deferred PFN for this section */
>-		first_deferred_pfn = spfn;
>-
>-		nr_pages += deferred_init_maxorder(&i, zone, &spfn, &epfn);
>-		touch_nmi_watchdog();
>-
>-		/* We should only stop along section boundaries */
>-		if ((first_deferred_pfn ^ spfn) < PAGES_PER_SECTION)
>-			continue;
>-
>-		/* If our quota has been met we can stop here */
>-		if (nr_pages >= nr_pages_needed)
>-			break;
>-	}
>+	pgdat->first_deferred_pfn = nr_pages ? spfn : ULONG_MAX;

If we come here because spfn >= zone_end_pfn(zone), first_deferred_pfn is left
a "valid" value and deferred_init_memmap() will try to do its job. But
actually nothing left to initialize.

For this case, I suggest to set it ULONG_MAX too. But this is really corner
case.

> 
>-	pgdat->first_deferred_pfn = spfn;
> 	pgdat_resize_unlock(pgdat, &flags);
> 
> 	return nr_pages > 0;
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me
