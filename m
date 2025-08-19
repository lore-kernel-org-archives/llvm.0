Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6577525A631
	for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 07:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755589449; cv=none; b=P7wsNJ6G0gtvgrZ9YDzxOgH3kMN3DiT7+Uxwq6QgDj/Ron5LzgQ4QA/62t+sF8hqsiMdiCQrQ78CZdPxhSALAvgd7/nyO5BA5e/ORQwrcHmMo2iPpViMa6D3borY9R0KsJPqfZRh5sL0SVaIUIcw4YCAt43IcOd/nL4faF7H6iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755589449; c=relaxed/simple;
	bh=hbXiwwmv/TAyN+dMm4mGAmUTFqxcIwE6CLeyaSscGWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=utK3P4Mx5E8SiZcJMkEHgcGfaKy37ep7iYCCW794l7gcsfVpRHkqBR8QhS0u9jlrMHMcy7fk3kOZR3c27SHyz6LIKgB5PeQEDMQnmvvq1pOc14oug3sBDDI71+7V+r/rf00/tRjMuQXQgDoZ5pu/mWdCJGI6SxWoX1AoYRyDPro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GtQlsVsl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GtQlsVsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755589446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fIj/g36bZghupXV216+l9nKZNoBOCc3syczxCiD8BLI=;
	b=GtQlsVslDxNIJx6BcVO1ac/kfsnvBgGRCQsGlhnSFi4FuhqJrd+ptA4ggz/AZwvbe0Zm9p
	EjdbO9AGK/wHVeM/PgGrQ2wpZEpE++ZpGcCzur1lJQvMuQyzl6J5Zcvu9U+ytH/5ghI0eg
	45chY6BXVs4QW4MrmMEHvlq6ERJ4FKc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-YwZ0-u42OpuV6H9mvIaQ_g-1; Tue, 19 Aug 2025 03:44:04 -0400
X-MC-Unique: YwZ0-u42OpuV6H9mvIaQ_g-1
X-Mimecast-MFC-AGG-ID: YwZ0-u42OpuV6H9mvIaQ_g_1755589443
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-45a1b1015f8so21799205e9.3
        for <llvm@lists.linux.dev>; Tue, 19 Aug 2025 00:44:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755589443; x=1756194243;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fIj/g36bZghupXV216+l9nKZNoBOCc3syczxCiD8BLI=;
        b=c0q6WmPOmKwnsW9+JkTTWh7B23InVodUfdXV7/aG1zpOZBGm23M4lSVQkMI7wcSPrX
         8zndjTb5Vwkp+GPEhrxB7hrhiUtsK/UxU1tQU6WjzdHrVdRjwNb6FC6FK1IF2uH+gpJY
         PcyNjoxS5oP/zXDFecdcwy3wiZP4jNaj02DcRaguN7pMlejW+muFGBA9D8qfLQkFCUUU
         iRSaSPu2dGwiFERWVjJovJ+3tdEvOqQ50YQt+WmUfIg02CDJoNcNcuAR92UcF0ld49w4
         yhjHXK3wslKI0duWZyGnZWdR+CyglU349qEMJevmMdQWL517PaQ+uAOsUrZOS296He61
         F7RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoiLsBpK+NQyWxi4/T5lImSPtDyS/YB2nra5z2zETByCUcuXkQH+/Uz1nzVE0caI+np5Z9@lists.linux.dev
X-Gm-Message-State: AOJu0YzypWxhmCwuy31VYuE+cMnF8xAsw4yX8zPUAvZ6HsPAG4/KfQja
	3ZuWTP2OF+/pR00i+XEG54tE8n5HB6FQzco+ezlFVCR+CEvwgE46Xskd+nijMWjLFLbgbrMWBwZ
	A61yUQxWNIVJ8DZjQHRj0wUrPSf4HJjJrNeAiISdECKjdvMXApciQmAc=
X-Gm-Gg: ASbGnct7zxOblEYTCOhsOqyUV7Y0FHJrSJcRS9lzZv/25FbxXno0QxDtqKvCNVx1yVn
	vu+EmJW3BSHgQ50miCpyBRUFacCSrBA9Bif1tNRxI3wlzgBxTPw3DOf9insm5j1HOl4WyYyMWNQ
	xXoE+LThr7BeDTLV8Ar7ABTbUdN0YOID46PmnU+mSCLL1QVXAfhAN1pZoxxE5LxRKyOo0qHTdq8
	r5MdnCmEPihqisZYkvvCyEN2mpyvkjLT1f8nfX9U7KIOj11xSUzYR1ILpoRytd4sg3Ld6/AnHlU
	wTjVzfNMTCDy9yQEU30CifrkWTfIMOL0avGeuAdCXJpw1D0Sr7J4YIwGP+Xe6TREaPZt74Og/d8
	/3Qu7cfRtkx8f+u9uJ9M9575kKlMRmTbmCgxcWVNCMc/ljx5W0gO6ogSqNhiHo1LVspA=
X-Received: by 2002:a05:6000:4011:b0:3b7:9c79:3293 with SMTP id ffacd0b85a97d-3c0ecc318e6mr949022f8f.58.1755589443066;
        Tue, 19 Aug 2025 00:44:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX3aCtmn8Z/3+2rglxcbECtcQWpRCN5o9VXE9VpdiFc9WoRBf+18fJ1/CrjpVetKu7qCsWUA==
X-Received: by 2002:a05:6000:4011:b0:3b7:9c79:3293 with SMTP id ffacd0b85a97d-3c0ecc318e6mr949000f8f.58.1755589442605;
        Tue, 19 Aug 2025 00:44:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f07:8700:71be:5385:87b8:5a98? (p200300d82f07870071be538587b85a98.dip0.t-ipconnect.de. [2003:d8:2f07:8700:71be:5385:87b8:5a98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c074d43c77sm2612291f8f.23.2025.08.19.00.44.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 00:44:02 -0700 (PDT)
Message-ID: <557f34ed-114b-48ff-8c01-ca9c939da08f@redhat.com>
Date: Tue, 19 Aug 2025 09:44:01 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm/mm_init: use deferred_init_memmap_chunk() in
 deferred_grow_zone()
To: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Bill Wendling <morbo@google.com>, Daniel Jordan
 <daniel.m.jordan@oracle.com>, Justin Stitt <justinstitt@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20250818064615.505641-1-rppt@kernel.org>
 <20250818064615.505641-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250818064615.505641-2-rppt@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: u_iJwQom_MvUpI49Fz7O1ynMMy1rw3Emn88R1iQoXGM_1755589443
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.08.25 08:46, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> deferred_grow_zone() initializes one or more sections in the memory map
> if buddy runs out of initialized struct pages when
> CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled.
> 
> It loops through memblock regions and initializes and frees pages in
> MAX_ORDER_NR_PAGES chunks.
> 
> Essentially the same loop is implemented in deferred_init_memmap_chunk(),
> the only actual difference is that deferred_init_memmap_chunk() does not
> count initialized pages.
> 
> Make deferred_init_memmap_chunk() count the initialized pages and return
> their number, wrap it with deferred_init_memmap_job() for multithreaded
> initialization with padata_do_multithreaded() and replace open-coded
> initialization of struct pages in deferred_grow_zone() with a call to
> deferred_init_memmap_chunk().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb

