Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB6618BC26
	for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407797; cv=none; b=Vn4DOFY4N/SBo0vpi4k2SOoYfkZHRKzCl6ZlXciZPB+dNakLqWn3Nhttlbt1YejExjp2xiuOCnbr8Bsk9FAtGHnxm/Tmh22KP2UhtFcL8evR3CZnDOnPnSbqkrK+aeXXk2hompRcRlX+s+opJzw9kM4b4lLGJPruGPJVogHcvTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407797; c=relaxed/simple;
	bh=UwSwiJGZwSq+WhG8DJIpzDOvAXg+3MQPfE526y5E6XU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQ4TzSuyQ8JVJJAx/dEQ2oj5gUX0BlkFXIDV+A3Nj2b5sQk/eizEbMQsQbpeK6fZEAtbgaaLP/fhqYIkMKG9cMp48IS+WADnDWNHNa+AWR8rqkjIQ0sv5ShiNJ1CxNxlDuOIE24om+kNMEe0svo51/+YUMffILTQZkvvC47uz80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EMIRKBHh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EMIRKBHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740407793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4a5Pge3ndAsxD91Ok8sjj4Yec0ykdk1cuFOtuh9yTlo=;
	b=EMIRKBHh9cX7g3Z83KehxvJJ0KWEAbUKVrQmZmq1A0l00Z35bAOu1iS0U29bkMAN+DpEVp
	LR2HnBIVZ8aYSsAXidCu7DIZ3UUi/BXEqBKn1YXpgfW3IELsch9BDgr7lRzm59lROBDWNp
	I55vde4GWWkKP1Cnq+uIPnK9mTxArJk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-GELxwQ9APPqcn7xgjc480Q-1; Mon, 24 Feb 2025 09:36:31 -0500
X-MC-Unique: GELxwQ9APPqcn7xgjc480Q-1
X-Mimecast-MFC-AGG-ID: GELxwQ9APPqcn7xgjc480Q_1740407791
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4399d2a1331so22047455e9.1
        for <llvm@lists.linux.dev>; Mon, 24 Feb 2025 06:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407791; x=1741012591;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4a5Pge3ndAsxD91Ok8sjj4Yec0ykdk1cuFOtuh9yTlo=;
        b=ZMs4pbcfagx1vmXnhF6zB81O09Y55coy/jU3Puhr0FSum00CYK5Pp30DzqCjDXufoT
         YuNH2rFmNsEuxGHdfZAlKESZoomSJNRBOpi4hVlGLuSpVhPrprRPkHQX8a6jIIsBSOcz
         uSjHyx3eBoAQAQcn40xFbBhajshWq5g3KnWI3fSG/GPtK9FliIrJo1i4NriYcugMWf/A
         ahciQptdItTaunNA5xxx4vNH2WtI/KF3CqYlyirgRunqLdiJEVUmMhgYwR4d17lDTGvO
         9S8rPkY8+6cy5i+7jlfzg7XLE93XxxZuBzM2frqLCAbOatkEimnKzv2nTa+H7tDoy+7/
         epjg==
X-Forwarded-Encrypted: i=1; AJvYcCVjObxY5lK6K+BZmMa7cfwN+AmSYlLxhzSNfEYcK/Fe1STyoNzdOHdWpsa2vusYI/Nw+V2I@lists.linux.dev
X-Gm-Message-State: AOJu0YyzZcWvbkK17R2lg4t0Dg50Mld5CYU7tQZepQOQhnNomHst8Cxc
	k1pUJ1d892jLvB15EfoDWpN6y8Ueum1mtJkMT4UOT2lBu5Ufn5aQibbm00pRrSfrERjlwNhoCXb
	0Amw7BNSX5OxJytVmRlOowUdfialsm7eLX4njij3P76wjcvP2o+o=
X-Gm-Gg: ASbGncs5X9uKXIRUJrWrKggZfxD3QGVd9LKGS5kOHe24cKO4mTJBspCql82a1Lnto8F
	BeVbxUfiPK2JJFcb9yjZfI4d6TpMHoMjVhZj8qRIRz54lBk1WUJJXwzWiBgAecV4Lmtmk+j3RXt
	O6MO2N6/vD3l177rf5bcixI4GVgSiw7wZpqX5ax8VLZBdkWE1O+94IbbxZ73eOPvg7VTDwl8MB6
	a3XMZPIVjnsw497jzLz8rbTPgrArLOTSsOYdXeknI3wDYiq35uuQth7UcPon9lh4diijbX52VX+
	qK7R1iiyXjj4zNAtY5yaiWNlRBpUAyY/ogiAWSUEGYOKEt3cnqC+UD2VLhYcuL3VrMvINWDt+Q/
	P+KrSShzQPRjb3ANXCIph3GCTZq2/R0I+bWRpApdwS4Q=
X-Received: by 2002:a05:600c:1516:b0:439:5d00:e78f with SMTP id 5b1f17b1804b1-439a30d4c32mr143818725e9.11.1740407790784;
        Mon, 24 Feb 2025 06:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFGG4lEeSm6p0yFnCA/IQwyI272VMVV6NVwF1/1IUIoV6j97s6TFEZmg7Y5rX4hBQYsI/alA==
X-Received: by 2002:a05:600c:1516:b0:439:5d00:e78f with SMTP id 5b1f17b1804b1-439a30d4c32mr143818535e9.11.1740407790398;
        Mon, 24 Feb 2025 06:36:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c735:1900:ac8b:7ae5:991f:54fc? (p200300cbc7351900ac8b7ae5991f54fc.dip0.t-ipconnect.de. [2003:cb:c735:1900:ac8b:7ae5:991f:54fc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b0372124sm107073455e9.39.2025.02.24.06.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:36:29 -0800 (PST)
Message-ID: <d90ca138-7506-4d1c-b144-08b6099ee63c@redhat.com>
Date: Mon, 24 Feb 2025 15:36:28 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm, cma: fix 32-bit warning
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>,
 Frank van der Linden <fvdl@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250224141120.1240534-1-arnd@kernel.org>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250224141120.1240534-1-arnd@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HnxITpNVIpHk1yuQK5btWC83AWDto_0g7Cswp_wi1qU_1740407791
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.02.25 15:07, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about certain always-true conditions, like this one on 32-bit
> builds:
> 
> mm/cma.c:420:13: error: result of comparison of constant 4294967296 with expression of type 'phys_addr_t' (aka 'unsigned int') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>    420 |                 if (start < SZ_4G)
>        |                     ~~~~~ ^ ~~~~~
> 

Hm, so in this case the whole loop is unnecessary.

In any case

Acked-by: David Hildenbrand <david@redhat.com>


-- 
Cheers,

David / dhildenb

