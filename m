Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86A7305063
	for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 12:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755693741; cv=none; b=syUd2NUvEvd22U7vCT6PbqWfw9lti2lbyPfAlOkaqks+4TUhVm1a2ZwM8LoXXXmrwlSnAwhJihmILUZPrqp0Il4X/fjgj1IUD/5Pt4+EBQ2chLH1pq3hFVEoRxCdeqv1JqK8KGfF3if7ijPe+Z+0f+Q5n//9Op/9bmowp9o+1oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755693741; c=relaxed/simple;
	bh=wfUj5GVqJdy8Gzu7HZkb5EvyfjAxA67sUfDfZ4Afc9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmb/ZexvvGXfFOWPFRjy6JZ3olXIcVJexH3gHBNDjNY/5eRI4HrZ6X+kiCyKizsdoQgC/nB3oOL3547AyulUL1RrKRUu0QIhJv1+VMVt4fYGlMgUqnFjk77sJZx0e5yB3/iQ/2YGjLWtvLFFGV1SzKE/mX7efod74F39N5cLbyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpRXpCX5; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpRXpCX5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6188b793d21so9668320a12.3
        for <llvm@lists.linux.dev>; Wed, 20 Aug 2025 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755693736; x=1756298536; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIg9W/3Kh0nknE9bg10iXxQ5gJtP6ZAIJOJFszr9STA=;
        b=lpRXpCX5fqG6u0s3PbIn46nGyi8k9lrkJ71Iu4wH0TQHGzvwNFGsbY1O60+POSRJod
         /1yEZV8ZWQvoQlEnLP4z+Bsq4st0nFKRc0fwXiz/IQxtxtLOhcGGeWOiI62a9rNlXrqg
         7FrrP1nQVlN9fEX9/f5PhxU7X0IOZc26dpfwQ24NcFX9a/uZHV4cxZmWLd00KR9lfA5n
         TFec2A2cLGTtN+d2H5KkSTl2SklI0JC02MTK147NGa7Hapj8T0Mwx1vkKeQRsxGTbQh7
         YX/jLePMTpDY4NVr28JQjmBLv0MUCViGIqrW/j3NkjLAaWuf2qayzDBp4ugDG7oHamG0
         XOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755693736; x=1756298536;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIg9W/3Kh0nknE9bg10iXxQ5gJtP6ZAIJOJFszr9STA=;
        b=UlJ6jOJFeUhe+DckcEE3uYd9g/mLe1hWr3FOCwEoAQUlooHGlHFa6Fc1Pr58qDdN/4
         Nj6zODscPfP3586LPGRe/KNNWLcHRxCMiFuGoxuVkqWzSbPwgaXe/sUEPmtdlCagWlTg
         nlzOg6AYQLoE3QWuNf+HyA9iQMac+27yg1P842gm58VxXP+rvHF9PsSCHvOXmEfLrkIk
         /TzNfKby3U2x8MYK2cH44bmAppPbHpSibRljO5YQd4DNzwGeAX7RzyFBZddWSGTXlawv
         UXjuxxcFnhj3xT60Qu6tSonLPXUZ/x/2tvzjoTQCtp/VbkJeDax5NTEqe3TRFgsnSx+E
         /ykw==
X-Forwarded-Encrypted: i=1; AJvYcCXaqIF4jNkKienSdpCPuP7nzJhgBjaQBl4ufltW92BPlEQCEJDkH2BiDUKpobeurOdYOQdi@lists.linux.dev
X-Gm-Message-State: AOJu0YzHVUmr3gfcsNlA3BWqEJ4L5mi7bkCGqR9uKoTSFYGKV29PE7G1
	WsaGqGkB719PZDaP+7KLTF3fmpLGxYvh07niXAuTgWBDkB6z2j5+8YqK
X-Gm-Gg: ASbGncths1SN23bZ5kojlZPQkyzWlWWeXDEe5/XeCoQUDv/TyUcHAp/lP1jToaCoV0c
	2qeIQ1u3yADztyAp/XLVd6A/TwrsVG643ZGAo+jPp+Lq5/7Us1G8Vx+HhznXsxpk7XVge4VhanK
	YJO0WWy7FBqx/JEX+2GLIZ5yuLA+lY0Hjq900Ky2DNNuJogSmAJqnNFM2Uf5n1zkOWscg1abHpb
	92TYECq9p1sII/Ap/RvJ0A5W31+/PjMYowxUDNxLpyYm6qA0PQY7Qd8qbbbS1zC4g1NOCTikOOY
	6SySo5pFsgeNcZFdjlan97jp8wFOA+rrI1oLd9skyB8gXtxpjKsgAfpSN/WMIisJqx7p25C8yvg
	OUzYGpo4CSuVY01LcP4FYBmTSUI00meTsEmSR
X-Google-Smtp-Source: AGHT+IHHRa/Wjm92m9kTtxGRWzJ7agHg8ZuSbyEGNlj7C81CaI3UVA8ffbMZiBB1+byaZJtVfu6Ixw==
X-Received: by 2002:a05:6402:4306:b0:618:aed3:38a with SMTP id 4fb4d7f45d1cf-61a9782d02cmr2281770a12.31.1755693735970;
        Wed, 20 Aug 2025 05:42:15 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a758bff1csm3633444a12.56.2025.08.20.05.42.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Aug 2025 05:42:15 -0700 (PDT)
Date: Wed, 20 Aug 2025 12:42:15 +0000
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
Message-ID: <20250820124215.igq7ug4juiomjyng@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250818064615.505641-1-rppt@kernel.org>
 <20250818064615.505641-2-rppt@kernel.org>
 <20250819095223.ckjdsii4gc6u4nec@master>
 <aKRX9iIe8h9fFi9v@kernel.org>
 <20250819235158.mgei7l4yraheech4@master>
 <aKWTSq-JcTviuGlU@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKWTSq-JcTviuGlU@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)

On Wed, Aug 20, 2025 at 12:20:10PM +0300, Mike Rapoport wrote:
>On Tue, Aug 19, 2025 at 11:51:58PM +0000, Wei Yang wrote:
>> On Tue, Aug 19, 2025 at 01:54:46PM +0300, Mike Rapoport wrote:
>> >On Tue, Aug 19, 2025 at 09:52:23AM +0000, Wei Yang wrote:
>> >> Hi, Mike
>> >> 
>> >> After going through the code again, I have some trivial thoughts to discuss
>> >> with you. If not right, please let me know.
>> >> 
>> >> On Mon, Aug 18, 2025 at 09:46:12AM +0300, Mike Rapoport wrote:
>> >> 
>> >> In the file above this line, there is a compare between first_deferred_pfn and
>> >> its original value after grab pgdat_resize_lock.
>> >
>> >Do you mean this one:
>> >
>> >	if (first_deferred_pfn != pgdat->first_deferred_pfn) {
>> >		pgdat_resize_unlock(pgdat, &flags);
>> >		return true;
>> >	}
>> > 
>> 
>> Yes.
>> 
>> I am thinking something like this:
>> 
>>  	if (first_deferred_pfn != pgdat->first_deferred_pfn || 
>> 	    first_deferred_pfn == ULONG_MAX)
>> 
>> This means
>> 
>>   * someone else has grow zone before we grab the lock
>>   * or the whole zone has already been initialized
>
>deferred_grow_zone() can be called only before deferred_init_memmap(), so
>it's very unlikely that a zone will be completely initialized here. We
>start with at least one section with each deferred zone and every call to
>deferred_grow_zone() adds a section.
>
>And even if that was a case and first_deferred_pfn is ULONG_MAX, the loop
>below will end immediately, so I don't think additional condition here
>would be helpful.
> 

I think you are right.

>> >> I am thinking to compare first_deferred_pfn with ULONG_MAX, as it compared in
>> >> deferred_init_memmap(). This indicate this zone has already been initialized
>> >> totally.
>> >
>> >It may be another CPU ran deferred_grow_zone() and won the race for resize
>> >lock. Then pgdat->first_deferred_pfn will be larger than
>> >first_deferred_pfn, but still not entire zone would be initialized.
>> > 
>> >> Current code guard this by spfn < zone_end_pfn(zone). Maybe a check ahead
>> >> would be more clear?
>> >
>> >Not sure I follow you here. The check that we don't pass zone_end_pfn is
>> >inside the loop for every section we initialize.
>> > 
>> 
>> In case the zone has been initialized totally, first_deferred_pfn = ULONG_MAX.
>> 
>> Then we come to the loop with initial state:
>> 
>>     spfn = ULONG_MAX
>>     epfn = 0 (which is wrap around)
>> 
>> And loop condition check (spfn < zone_end_pfn(zone)) is false, so the loop is
>> skipped. This is how we handle a fully initialized zone now.
>> 
>> Would this be a little un-common?
>
>Why? The important thing is (spfn < zone_end_pfn(zone)) is false, and I
>think that's good enough.
> 

Well, no more else.

>> >> > 
>> >> >-	/* If the zone is empty somebody else may have cleared out the zone */
>> >> >-	if (!deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn,
>> >> >-						 first_deferred_pfn)) {
>> >> >-		pgdat->first_deferred_pfn = ULONG_MAX;
>> >> >-		pgdat_resize_unlock(pgdat, &flags);
>> >> >-		/* Retry only once. */
>> >> >-		return first_deferred_pfn != ULONG_MAX;
>> >> >+	/*
>> >> >+	 * Initialize at least nr_pages_needed in section chunks.
>> >> >+	 * If a section has less free memory than nr_pages_needed, the next
>> >> >+	 * section will be also initalized.
>> 
>> Nit, one typo here. s/initalized/initialized/
>
>Thanks, will fix.
> 
>-- 
>Sincerely yours,
>Mike.

-- 
Wei Yang
Help you, Help me
