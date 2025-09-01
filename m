Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D552FB603
	for <llvm@lists.linux.dev>; Mon,  1 Sep 2025 08:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756715886; cv=none; b=BBcCWug5v3/x2FCSN9231ukfcKe9IrewBVfEr/Bt88JEZyflIQba8EPJylzhWNFe2EoXE2pfJIaiTjWFBBR7yNVR/cZnyWrkA0rhb/V+1NGFWJRx5Sal7pphUaLiHPGeiTjM3wyklWS2KDT3Zgt1ipnTIOE+/S6iQjyRPC2WTP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756715886; c=relaxed/simple;
	bh=nn+IGU9QQIl0hiOvRctWqa1lMMJEsS99p6zdED23K30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cRZDmL6emtE08A4u/akXomG6XJvpCqgxxbtyo2pORHKrucMGgPz0iKgnIT3rF6OORBxBF4XvnMtD1/fS+9nMhbbJGmIKSmLHixiAQC7rZBFe3dwmlQGlgA3CINLc7yPXg/+cqr8AS1lGgYMcNJLijTUArq41sFKebZirvBV5wOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aN4aTH24; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aN4aTH24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756715883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jrgwOs+scouNVZvyi3e77NdTzgLAbayEdAxxiP49p7Q=;
	b=aN4aTH24thb1eskhztBYTsPIa17N30aQ+XpoLHlyNrv8WIVamdHzCqzrbUchFuQtlc/Cld
	aw7X6H8bY8aXwrLKFqmQYyBVbuj9v1mhQYrCrlJVY7EzdtZpCKEx55pBFDn9UDv6zs/DF1
	EujUK/JUsIzhY9Qtnto9OzKasbmLNYg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-UFBWYFiTPGCNW3rnoykWGw-1; Mon, 01 Sep 2025 04:38:00 -0400
X-MC-Unique: UFBWYFiTPGCNW3rnoykWGw-1
X-Mimecast-MFC-AGG-ID: UFBWYFiTPGCNW3rnoykWGw_1756715879
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3d2edf6af18so716452f8f.1
        for <llvm@lists.linux.dev>; Mon, 01 Sep 2025 01:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756715879; x=1757320679;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrgwOs+scouNVZvyi3e77NdTzgLAbayEdAxxiP49p7Q=;
        b=R8owpNBA3Si1Y9Dn5YTfhDJO4awl5l1/3gRiMcSh1f2A7JLapQZS7G+i4ciWPIpGc3
         29+qx3REwSRICBXqIsC7a2N60yhRdDQgP9nzM9hGtfJFr+maShn9C60PzUWoN+vjpP0d
         Uo79SoUqhefxr3jt1fZSKFq/DwrQzUVZPHFAAJd88mCNJs4vx3NlALRnbn1kb098WBXB
         7V43emegmE7SndObggsHGfqI5c6W+7+tLGdrrh5YI27IqOg1JJSnFyszJGzDaW4xlH8y
         skqt2Sm62BLbsf/tIzz0IeCXkxw7xulFrvsl0jOGNArsA3MyV396ArH+20NiSgh17dP3
         K6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwJFl63BknpxE+uyuHMnXgxIld4eyU69xbMKj9DRJWtYEt2ZJj0+z11cytwGQMw2/iA4+Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzJt4AruZGzOb7wd0dVhwfvvEertjfk6NZbT/NiQ6+SXds/R0UG
	mQfk8HhcL4iC+B7hNBXT7EfruIumX/Ua8hW6JB6LIgore+gPMsy5rshENHA+uE9U3tJsZIctN+B
	S5WivEz5izrn3OfMQLshwt4VzFCpF6ZA8uibxIWWyj87nps4xw3uh2SA=
X-Gm-Gg: ASbGncuZz5IfsGs1DwY3vIZUndZJMCtxlFNWOERqVGn4DCdEF+Usrw01HIzMHUk7eGv
	3lHEtsxnT+PWNPpCRSYLNQjS12MYWXk7DchuhGQS8p6V8o25sAuEn6Vockzz5imoZI/Bx+UU8QU
	mnDkBuGwzMTF0LNDT253Ze7UWQip5xxPUaZEYbKoovklWHvhtglwlMBztcmYKsjwGjxFa84usdd
	TPF8axmWq5tUVpfYKViNWRWef6ZXekEPvsST7R4g90yMJIX3qJImby0I/dwTT788zB3pZaThknM
	jho3a1R2TIHM3SO+bmRk4CzD8pTN4QNdgWaBhCOMlREs87FkMhiU2sSM+W2Dya5hLptu6RD1Xwn
	fFNCX8pYJUpLqB25dPcnVNYpqHgeC8/v7gJK+9AsUlcH+zDwIMnVZboQ3y34lMjdKhv0=
X-Received: by 2002:a5d:5f53:0:b0:3d7:618b:293c with SMTP id ffacd0b85a97d-3d7618b324fmr1132390f8f.16.1756715879528;
        Mon, 01 Sep 2025 01:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9nWwOBCAvDBQoLLOnu8h3E49+M0YCTE2ZQwP6KwAdpKdeubmEVeAJTUT/HJf/S1n5/RmPbA==
X-Received: by 2002:a5d:5f53:0:b0:3d7:618b:293c with SMTP id ffacd0b85a97d-3d7618b324fmr1132361f8f.16.1756715879028;
        Mon, 01 Sep 2025 01:37:59 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f37:2b00:948c:dd9f:29c8:73f4? (p200300d82f372b00948cdd9f29c873f4.dip0.t-ipconnect.de. [2003:d8:2f37:2b00:948c:dd9f:29c8:73f4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34494776sm14122840f8f.61.2025.09.01.01.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 01:37:58 -0700 (PDT)
Message-ID: <38aff9eb-9d7f-4dd7-8ed8-fe29e469d068@redhat.com>
Date: Mon, 1 Sep 2025 10:37:56 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] memblock: drop
 for_each_free_mem_pfn_range_in_zone_from()
To: Mike Rapoport <rppt@kernel.org>, linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Bill Wendling <morbo@google.com>, Daniel Jordan
 <daniel.m.jordan@oracle.com>, Justin Stitt <justinstitt@google.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Wei Yang <richard.weiyang@gmail.com>, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250901083423.3061349-1-rppt@kernel.org>
 <20250901083423.3061349-5-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20250901083423.3061349-5-rppt@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZwlrnClr3DFIksKw-_D1Q-8UvggQSwu7wPRq5bjSfLQ_1756715879
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.09.25 10:34, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> for_each_free_mem_pfn_range_in_zone_from() and its "backend" implementation
> __next_mem_pfn_range_in_zone() were only used by deferred initialization of
> the memory map.
> 
> Remove them as they are not used anymore.
> 
> Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
> Link: https://lore.kernel.org/r/20250818064615.505641-5-rppt@kernel.org
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb

