Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BF51946DA
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 23:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755647524; cv=none; b=WGVvR0BRppINlbLHgU0vu4Wd1xo1+Rusd6y1u9UAFzWHPRdxB/UH6gkwfwI7O6+WWJ1FlIvbZrQ9VcbnwmQD+XvfSINXsSPcUqHCnf4zFwIKCesChS/rzxDUT6knBqzbRfFa4h3fmf5qENX2KeeaVhxl/d3nyHrbvX92iC+wi1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755647524; c=relaxed/simple;
	bh=tCbjBamqBRJAyRNUkdkIturfGMlxJnS5+BZA+9SZi04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=invR2ef5e8Xt6A1Em1PCRJlE4/VUK3h3aJeFglEctD944Z9cQCTRuZMe49IT925avWU1oe2cULcG78Z9Ouhk1PqKXmybHCRJj3VwToKY1xqlcwQ/1P8sX8JrNa7786jm8Y9dL6YPBtDLis+DTI+m8jsYL9qRiNx2P+5bZcl7Blw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtqSzqsM; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtqSzqsM"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6188b72b7caso7377724a12.2
        for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 16:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755647521; x=1756252321; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwii5vDRk2HqFHoEzFvdXjLh8+HDGIvx8Kia2Hy7yd4=;
        b=QtqSzqsMEujzQ+k1xYBI9/SHUZ63P80z9hR3u1Ka7xNY0jfCTq3sL1cUy/SlpGz+yy
         7afQ/JzqCQY4oaU9MBJcLKnk5ebKZ/gijsdm4br9IVKdD5sVZfLHJWBFlZbknhoETIs5
         54tMoQOVqXhkVEaJLMvlhVIG4sK71ZXpF0lBEHtxiDeeAr6FB6FSs7Q1Zwajn3vPFLbZ
         3AblnKhLzuf8A2CDOdjKXGDKdrBu+5bOUvjb3BA7NIO2U3bwWVOCbi3nLfQtfYa4EN82
         Z84bd5Rw9yVnJ/QQ98LTsLQjNJ+sYr5y9gmcd568enXoCc1S2RTrmh1x9JrOgEgCFCbR
         lxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755647521; x=1756252321;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hwii5vDRk2HqFHoEzFvdXjLh8+HDGIvx8Kia2Hy7yd4=;
        b=V6VRIuGkfN2I+WegWgl5rQqYtjATuzlXsOuwxNxL0vSSklJL88G+66dZ45k0W3vFEk
         CLhdv3abObcMXW+98Gc49FvpygMmQlbuHo1c/ubbzTJoLmnFL0scdONVNvppak67KM5V
         +8xUqiqAJdEvEEy89f+224Vs4ZqMXixgvCwhrFVc2wQbGrUbQ5NYNjUbhqmbttFlyIF1
         u19/VBRWFQBQiliiJOt5Yo2sBoGLRILNBXJIAqmckYjxrtNaBR3hIr8CbP+w33Nnjra8
         uITOQPnzpjIvvmmwJR+ofbx5oqFDfC7It/5eTNiNQdo337+PQtM0me3JLArm9ueyBXm1
         T8ng==
X-Forwarded-Encrypted: i=1; AJvYcCVi4qLNXWR8w4PCwOB3xUyIuTZbM9OiCIlC1kFN6VISWSthERC0s+SMYMhgBPUK6syvNvB8@lists.linux.dev
X-Gm-Message-State: AOJu0Yx83rzGwx06RHZ08kBGpCr11rA6C8L5X0Y5B4qu4SjznVmwhtQ6
	kOYzsX3MWWg2os7WiO/NQ7I+7C/nlPADHnZQNHvfc/X/C1n3arrglNNG
X-Gm-Gg: ASbGncu6IZXbUJfAkV0BUFciTunwpCEEfdjq3zyjHl0d1Krz/0dnrZr/hBo4QBK9/j1
	CN2Dwu93kT4Nq9oTQt14rUejjj1EAzuexXEJF+iHKSz6Z41VWjGb7MjrvWubGe+uWVWsvXaRzld
	xHbzEq+kphLewqb0OrAgJi0JSxsIsG97mL3cy/Zc8xoZzGjdWNdb6PESLCg7lyXynMW27n1LP1r
	mAFl/iag4iBNxGxZIdPGLa9sDawfSSMvpMsJ+5YcUhMz0fQyDMAj/wg5xH5ZZnh7qEbHxOQ80ZB
	SGTglwLam/3v7fV/K2/4+MJlhUn4M0y0sFFINiothBYn03sKNa44b5QXEeK8yrl9V0xCjRwkQpO
	EW9QRpPreQRXkEwfHdJWVag==
X-Google-Smtp-Source: AGHT+IHTWjAGjinh9nzHsJKsD5xLXBZISMysB5cDMytuX+CmFt7hFCd0FeBDXqTTZwWuSeECM1i6ww==
X-Received: by 2002:a05:6402:51d4:b0:61a:9385:c781 with SMTP id 4fb4d7f45d1cf-61a975e5b9bmr669786a12.38.1755647520722;
        Tue, 19 Aug 2025 16:52:00 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a758c062bsm2574102a12.55.2025.08.19.16.51.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Aug 2025 16:51:59 -0700 (PDT)
Date: Tue, 19 Aug 2025 23:51:58 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <20250819235158.mgei7l4yraheech4@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250818064615.505641-1-rppt@kernel.org>
 <20250818064615.505641-2-rppt@kernel.org>
 <20250819095223.ckjdsii4gc6u4nec@master>
 <aKRX9iIe8h9fFi9v@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKRX9iIe8h9fFi9v@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Aug 19, 2025 at 01:54:46PM +0300, Mike Rapoport wrote:
>On Tue, Aug 19, 2025 at 09:52:23AM +0000, Wei Yang wrote:
>> Hi, Mike
>> 
>> After going through the code again, I have some trivial thoughts to discuss
>> with you. If not right, please let me know.
>> 
>> On Mon, Aug 18, 2025 at 09:46:12AM +0300, Mike Rapoport wrote:
>> [...]
>> > bool __init deferred_grow_zone(struct zone *zone, unsigned int order)
>> > {
>> >-	unsigned long nr_pages_needed = ALIGN(1 << order, PAGES_PER_SECTION);
>> >+	unsigned long nr_pages_needed = SECTION_ALIGN_UP(1 << order);
>> > 	pg_data_t *pgdat = zone->zone_pgdat;
>> > 	unsigned long first_deferred_pfn = pgdat->first_deferred_pfn;
>> > 	unsigned long spfn, epfn, flags;
>> > 	unsigned long nr_pages = 0;
>> >-	u64 i = 0;
>> > 
>> > 	/* Only the last zone may have deferred pages */
>> > 	if (zone_end_pfn(zone) != pgdat_end_pfn(pgdat))
>> >@@ -2262,37 +2272,26 @@ bool __init deferred_grow_zone(struct zone *zone, unsigned int order)
>> > 		return true;
>> > 	}
>> 
>> In the file above this line, there is a compare between first_deferred_pfn and
>> its original value after grab pgdat_resize_lock.
>
>Do you mean this one:
>
>	if (first_deferred_pfn != pgdat->first_deferred_pfn) {
>		pgdat_resize_unlock(pgdat, &flags);
>		return true;
>	}
> 

Yes.

I am thinking something like this:

 	if (first_deferred_pfn != pgdat->first_deferred_pfn || 
	    first_deferred_pfn == ULONG_MAX)

This means

  * someone else has grow zone before we grab the lock
  * or the whole zone has already been initialized

>> I am thinking to compare first_deferred_pfn with ULONG_MAX, as it compared in
>> deferred_init_memmap(). This indicate this zone has already been initialized
>> totally.
>
>It may be another CPU ran deferred_grow_zone() and won the race for resize
>lock. Then pgdat->first_deferred_pfn will be larger than
>first_deferred_pfn, but still not entire zone would be initialized.
> 
>> Current code guard this by spfn < zone_end_pfn(zone). Maybe a check ahead
>> would be more clear?
>
>Not sure I follow you here. The check that we don't pass zone_end_pfn is
>inside the loop for every section we initialize.
> 

In case the zone has been initialized totally, first_deferred_pfn = ULONG_MAX.

Then we come to the loop with initial state:

    spfn = ULONG_MAX
    epfn = 0 (which is wrap around)

And loop condition check (spfn < zone_end_pfn(zone)) is false, so the loop is
skipped. This is how we handle a fully initialized zone now.

Would this be a little un-common?

>> > 
>> >-	/* If the zone is empty somebody else may have cleared out the zone */
>> >-	if (!deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn,
>> >-						 first_deferred_pfn)) {
>> >-		pgdat->first_deferred_pfn = ULONG_MAX;
>> >-		pgdat_resize_unlock(pgdat, &flags);
>> >-		/* Retry only once. */
>> >-		return first_deferred_pfn != ULONG_MAX;
>> >+	/*
>> >+	 * Initialize at least nr_pages_needed in section chunks.
>> >+	 * If a section has less free memory than nr_pages_needed, the next
>> >+	 * section will be also initalized.

Nit, one typo here. s/initalized/initialized/

>> >+	 * Note, that it still does not guarantee that allocation of order can
>> >+	 * be satisfied if the sections are fragmented because of memblock
>> >+	 * allocations.
>> >+	 */
>> >+	for (spfn = first_deferred_pfn, epfn = SECTION_ALIGN_UP(spfn + 1);

-- 
Wei Yang
Help you, Help me
