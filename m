Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E79226F2AE
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 09:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595379; cv=none; b=GlvmXTmJQvBzXry8+nv2dBmA408UBt7CUm6Y+YF1D8Miu02q3k0C7OzSKxij3boQmighHQioWEJyhDIb4djPUxx+orCUZ/wL2MS9Oe3NcnZLSvDY8ebyMQSFzK+2+QTA1GTVfNdmZ9YSN4aR0u+P0Uyxa/0ChFbvGLVpVW9b7Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595379; c=relaxed/simple;
	bh=UXFwtf2p/003AReVcccluZVWMM0ZZ/Y6H3ApM7M7xhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH/aPEJOosfR2pNqdYUKcoYqtbS//iwDQSAwM14LrxoqMeqRGI68QMvytRbHxsQSijju3EqCOxdectkNU9aV/wAT+72s4a66x1FQUXJ6tkAseFMD4S937mXARhiBQVA/y4c0PuIFERBFCPxrekfJ+zIKWtnbrhXj1m+wD5xog+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHXp0ADe; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHXp0ADe"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6188b5ad681so7054792a12.0
        for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 02:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755595376; x=1756200176; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PiTmIvcXIWmnCk2bi7fdSkP9CO3hr2liu1TEw3WtOs=;
        b=CHXp0ADeCe/2Vb4BeWsXCLTc1bLGhJIeUj9ThEi1yVgbbw3lXA5gxeuuYH+WvU3BIZ
         5Xj77+lfzrdFmSAgtQvNvJxqJ8eEFtvEZxPEcrDRM9UTLtcAs7Vyzz4+xf+NZyM8eCav
         dHvhqpbQDgbGoKyVfXWE/QuWgfYKoiG1DzwRrA8MZIeTEUPodsb3HiAtM0AA+AUT4CPb
         CEPm+0TfdbQ/+kUqhPq9mZ+3wmoEzbDmUpZAnfGIduoaMJZ/o7DFhaNxo5FO1k+64sbS
         fwf7JkSqzbscSnTY9X8G4Pcni+mzGwewBFUE5Mu8KHDAsb/WX1z4RYj/pcjzmmRaTV7O
         3LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595376; x=1756200176;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/PiTmIvcXIWmnCk2bi7fdSkP9CO3hr2liu1TEw3WtOs=;
        b=LGzbcGhHBJIQKTxCWsPM8BL0PKCeQv3ogcZl07XitzmCGi6SBseFAJsc+ShRu1p9ZV
         rZn+qAoi6uiJ+BylXspw7MsmqEjXqvulCc4OX478J+76h10GiokMeE8DCcjzfPXgCZd6
         aeegh5cLpkkeVE2p8XDypFv2Ggqo51QWMTfNmM9tGL7Snk74miEMRzCv6lUeyon7/TkY
         pjjhYbbgg0hfJlGQ7puwLiCgLkFaPgWmQGa4k/Og9GFn1rgHeDaeJtnURQj5rklJBuET
         X/sG29K5+XrsJMmgoD6/eTJNyrJru777PC4U7mHzwCNbWZPvCtqp8Ot0wu6UZg9Grv68
         DbCg==
X-Forwarded-Encrypted: i=1; AJvYcCUORwZEcuJ6xoOhR7qN5NZXwcdzPB7H2eria9MtA3cOcsUtUM4xl11++nkMNcCOkn/1RZJH@lists.linux.dev
X-Gm-Message-State: AOJu0YwXgnugGnWGO4JQPaevWEQ3U9+fzu+cBHjM/JVRHdHLZx4dzCP9
	n0kGEPyVfw6nWK3CrQ3aa2taIkLn/c86eur49uKq11dOFU5zvq4OuwU2
X-Gm-Gg: ASbGncsKvWWyxvGdz2CnJGr2U/DpZUS4T4nOlEr03fNPJDqmymMCmb/9OHTkO1WCk6y
	QGTZOlEU16VoRWPJ110NUXb6MZQlN+GXzk9McIXuod5Iw7wdZ4rt5zJpbpckt3V0CogpbYuKht7
	13sVVJOZ5osJBpT0Usuj2DM06bUVWaEtHSNoWpJLADL/Vq4dfONFi57CC+n7Q+y9n66902s6DE0
	Z23qu38qm3DTTfxzSKK6iJsjM3piZ2XxnfRoBiqgj4o/OtrGrMYUv7Z9jPsOwpVejNFBWfXX0PE
	OryAFzkrxfDxlwt4t0pi1T5RkcPa8ke5AH80j5A/Bt577oT/NjpDSWTXlIqi067+w6tE7Kt+ndP
	Qt5RqI6m51Uq+jN+U4HVm8A==
X-Google-Smtp-Source: AGHT+IGWpnAEgDV2y4INDQK6XxsdDqFMGmNPUYQ0xXd1Cp2WxE73D3UX/rFS8w2LlQ8JvhzNRZ03EA==
X-Received: by 2002:a05:6402:3494:b0:618:3a9d:53da with SMTP id 4fb4d7f45d1cf-61a7e765e7bmr1296928a12.31.1755595375783;
        Tue, 19 Aug 2025 02:22:55 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61a761f2599sm1333486a12.5.2025.08.19.02.22.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Aug 2025 02:22:55 -0700 (PDT)
Date: Tue, 19 Aug 2025 09:22:54 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Bill Wendling <morbo@google.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Justin Stitt <justinstitt@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 3/4] mm/mm_init: drop deferred_init_maxorder()
Message-ID: <20250819092254.cddlg6npwl75fvbn@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250818064615.505641-1-rppt@kernel.org>
 <20250818064615.505641-4-rppt@kernel.org>
 <408d7eaa-5aea-4490-9fd0-978c4eb94d32@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <408d7eaa-5aea-4490-9fd0-978c4eb94d32@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Tue, Aug 19, 2025 at 09:54:22AM +0200, David Hildenbrand wrote:
>> -static unsigned long __init
>> -deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
>> -			   struct zone *zone)
>> -{
>> -	unsigned long nr_pages = 0;
>> -	unsigned long spfn, epfn;
>> -	u64 i = 0;
>> +		while (spfn < epfn) {
>> +			unsigned long mo_pfn = ALIGN(spfn + 1, MAX_ORDER_NR_PAGES);
>> +			unsigned long chunk_end = min(mo_pfn, epfn);
>> -	deferred_init_mem_pfn_range_in_zone(&i, zone, &spfn, &epfn, start_pfn);
>> +			nr_pages += deferred_init_pages(zone, spfn, chunk_end);
>> +			deferred_free_pages(spfn, chunk_end - spfn);
>
>
>I assume the expectation is that all PFNs in the start_pfn -> end_pfn range
>will go to this zone, correct?

I think so.

defer_init only apply to the highest zone in one node.

>
>-- 
>Cheers
>
>David / dhildenb
>

-- 
Wei Yang
Help you, Help me
