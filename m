Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121E2222564
	for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 14:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740579863; cv=none; b=QhpwkE3VRJgugL1+oYCKBjxT9PrafGBKiMjgWuyL3Fzawt51Io0RkmQm3S9BZ3qFb4lT/wPp8FOm70MUP8C9/XQrM08A8WR6FDa9SJdBxe51TcLsG2aMz3VCwnjsUhutTst9e0wOdKHiiLTLYMfPitf11OzrHTNKGo2IPkK9KPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740579863; c=relaxed/simple;
	bh=UNZysI3Bk3FIihYOkE6GUxuzuKBo3xKD9cv3rGqKRvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LqNk+1uuBZpzpDpK0lnqpAIDJ16VRkVby5mH0HBA+a9IU2m+Wl0fpTLMevnqtElEGFLLRKagR0CU6AR+bdamLEOC/aJ8xzqLUozAkJYgw9FHR4DKsxI+bLsid5Z4laur9E6GpecG/5jWwp7UDrfCOlSz0dBP6bmzAjDRDd8347k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AdJhzVO3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AdJhzVO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740579860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5lEwrAW40hPGwrW3AbO2l6jHPIXuBUvnvZJz7Gg3Jo=;
	b=AdJhzVO3fHR/Pa2aVUA2TLWbDxKO7K64Vk1XJvL+v3uerzdWGqCf2KmTwRE53MMURUKaSU
	sHiJazW+JT9l8eNjT1SEt2ubwr5HE1TxOZMomz96MQThX4fITBa73VKZtyZlRbRV+aniwA
	FWCO54Z7DbQACMVW0E7EqmVrxa1MM44=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-YduaETXsNiOfdxsAliGI1w-1; Wed, 26 Feb 2025 09:24:19 -0500
X-MC-Unique: YduaETXsNiOfdxsAliGI1w-1
X-Mimecast-MFC-AGG-ID: YduaETXsNiOfdxsAliGI1w_1740579859
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc518f0564so14739933a91.2
        for <llvm@lists.linux.dev>; Wed, 26 Feb 2025 06:24:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740579858; x=1741184658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5lEwrAW40hPGwrW3AbO2l6jHPIXuBUvnvZJz7Gg3Jo=;
        b=xI2L7LTDb3UVbzcXt9W40WoyG+N3ihUJJlYKc1d9oHElNzVzaBOGqcnXPhbllBrzQA
         6+7A3ZBpy0NjXPTu52F6wbjFOfaxSCYP16hzvtOL+Ef0XpmIc9vSVIo96pt+hz90XGya
         e0+Ce7Rre/cP/jyoKK5L+5HzRT0oFIKLVYyRWFfDqgdoPW8sKr1zoY9eeHirKZbp/t/f
         Ygnb6G9t0z9IGbH28mlx3uDXkmuwtbpplVfpCsIYbuJCHX4bkwzWcxWtz/3+6vlgnKS7
         EWlSN7++FJgSfTxdOPcuA83YSeNFcQCGgSXMboG8tzc8tKJ00bbPSpgUwNHOB+qLGsNR
         yTLw==
X-Gm-Message-State: AOJu0YyPnjNyLcrvxusy9/VUXtKPyweJQm1rzRrE4urT7u7nJ5ll2quY
	NPXiRijFSuIdDVErR/VC8EwVBoL2A3QykDDackLVUk5szykR/uTUCtZwnbuEgLIVCoCaPmq27HT
	6q2AqjBtaiJqLOWb7+rjiKsOmKq1Nh7xoCdVGlznuvGnQc1LpQPs=
X-Gm-Gg: ASbGncsynhJgcAJbe/8bPNOm0WuxXoDT6zHs4H02M466k+ob5D8WT3fvEMOCDUqb9Nc
	bWEzdqidBcbNWcpPXLRZWQcnvjSl2Z655H0onkl4AXLY0DavxyJwCaKUKnWtkm92Ugx9ihZuTgS
	DRvXUx9266Oze9aQC5AD/yVJ+2VKE1Yi24ODoPyEsEQlFRIPyVl/1rJHFlFiua7AeDqtGLxuz+I
	VS5fI2KgQr08FQ8k6HtHjIQqRAVMnBoOidBmEjQ0FCozqnOG9oPiVeVuZ6fjC8Wne+wYnvY97KU
	TfBSkvQ2SR6UVLPQbKjIu0gcHJtN4oy2LDKax8/bep+rJW2M1kCKyo+puedze+aiLs2mr/BttJM
	I
X-Received: by 2002:a05:6a21:900c:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-1f10b69f208mr5114082637.37.1740579858704;
        Wed, 26 Feb 2025 06:24:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBj4IdUvz5/AlfSowCjjRTbdpI+sc0ZFAmFcPy6Wcno9/iu6YjoDkKkzvMrHXmarM0dXtXsA==
X-Received: by 2002:a05:6a21:900c:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-1f10b69f208mr5114045637.37.1740579858300;
        Wed, 26 Feb 2025 06:24:18 -0800 (PST)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-16-70-52-24-57.dsl.bell.ca. [70.52.24.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee6f8c06b3sm794659a12.30.2025.02.26.06.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 06:24:17 -0800 (PST)
Message-ID: <8cece92a-6ad0-43fe-9916-eeb850c039e1@redhat.com>
Date: Wed, 26 Feb 2025 09:24:11 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 5933/6583] include/linux/page_ext.h:131:20:
 error: call to undeclared function 'page_to_section'; ISO C99 and later do
 not support implicit function declarations
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202502261733.Ma0eUGKJ-lkp@intel.com>
 <e5aec89c-a7d5-453a-8883-e3c025db2e5b@app.fastmail.com>
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <e5aec89c-a7d5-453a-8883-e3c025db2e5b@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t0PcR55krAIIpoxLvDamWyLAtCCJGggQ1HTbNyVd1KM_1740579859
X-Mimecast-Originator: redhat.com
Content-Language: en-US, en-CA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-02-26 09:10, Arnd Bergmann wrote:
> On Wed, Feb 26, 2025, at 10:46, kernel test robot wrote:
>> commit: a2d6e9c1a867bb9f13943cb8483e2ab85b630bcd [5933/6583] mm:
>> page_ext: add an iteration API for page extensions
>> config: i386-buildonly-randconfig-004-20250226
> 
>>
>>     In file included from arch/x86/kernel/asm-offsets.c:14:
>>     In file included from include/linux/suspend.h:5:
>>     In file included from include/linux/swap.h:9:
>>     In file included from include/linux/memcontrol.h:21:
>>     In file included from include/linux/mm.h:8:
>>     In file included from include/linux/pgalloc_tag.h:12:
>>>> include/linux/page_ext.h:131:20: error: call to undeclared function 'page_to_section'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>>       131 |         iter->start_pfn = page_to_pfn(page);
>>           |                           ^
>>     include/asm-generic/memory_model.h:64:21: note: expanded from macro
>> 'page_to_pfn'
>>        64 | #define page_to_pfn __page_to_pfn
> 
> I'm getting this on all configurations that set CONFIG_SPARSEMEM
> but not CONFIG_SPARSEMEM_VMMEMMAP.

Oh, thanks. I didn't build with CONFIG_SPARSEMEM_VMEMMAP=n.

> There is also a possible problem with linux/page_ext.h
> including pgtable.h and mmzone.h, which I think can lead
> to circular header inclusions with linux/mm.h.

Thanks, I'll look into this.

Andrew, I think you'll have to drop this for now. I may not
have the time to look into this this week.

