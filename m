Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957402D0624
	for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 20:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032252; cv=none; b=X8x+2tG+M+Oj/cYO7nigHZ8oCy3f29G2ZlvV7v4rx8wct3Gy67V8/eTWSR8XDjZWb/sj9O0vDw+LuDRJbnUtW7/OzzF0CGkqwCxpYfexXR+OWII8anA1uBt+9XCKlja1lj+5++m56ydwHh23A2BKglwgnpCrDaI4kvtqeXKhZP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032252; c=relaxed/simple;
	bh=bx4l8NAsbj7POKDVuwU9/31Dv8sSccK+JhWF2EwNC8g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=K6p9ndsAbYLpnjAFXN1Uly42ci30Te02mxrp31M7ZTAGOPMIuZWrT2RPjVSYaVR2jJt8M3Zb1ORaPWi2p7uutv4KNyKMJ8MrfAtqES7QUaF7u/CAfc8deUYmdM5VI0xiH/BJFcepA7bODazlF3r+JxMvwhnYQqXWqvVDHbbBxCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QrgpPL/q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QrgpPL/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755032249;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0MdgtvTf0GppffJVf7+x8IwG9neJu2jI9si12zBjn6Y=;
	b=QrgpPL/qrvsuB4GaiK8HAJITRaODm0P72aZEcF2XC+/ZfuvfWOLBz8cULNJLQsGxpmLIwT
	APU4gtxS+S3qfgOK7VXbGa5bL26Q61+HobIo1U26FoZ9N4DxkIetYvvN3nOnW48Zl1go3Q
	lWYewYRzltIUClJVO+Ztl1NmWspnHng=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-jFBJPGCpNeiIFiuFXWQT3w-1; Tue, 12 Aug 2025 16:57:28 -0400
X-MC-Unique: jFBJPGCpNeiIFiuFXWQT3w-1
X-Mimecast-MFC-AGG-ID: jFBJPGCpNeiIFiuFXWQT3w_1755032247
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-459de8f00cfso24180845e9.2
        for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 13:57:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032247; x=1755637047;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0MdgtvTf0GppffJVf7+x8IwG9neJu2jI9si12zBjn6Y=;
        b=ktZ9DyVVUpJnCxwWrSSsJZC1MF4ZJDGRRuzvorcKd0boxMzOFgbm438jcKnFstfOpv
         UceckAaoK942Lf3YVbkf5p85rOd7/li5WGzWk0kj39HhtmL/E4FNe45uIbT9PB+moHLw
         V9IalApXhonPns/LSJjfdwgVyUPuHZMWDp5S/eBnKJc2YTGC1Vh2i4PPunWkaxR7VspZ
         1Qsb0kR6E2z9AhkuoygndsC/rfMza8h8/TwGJmZNe3zleOoyRsTm9wsutOeCqMLeatKr
         TsTeCIWsnrBA3R+AK8QWopOtBbP0pDjdxx0BcKlUUAIruNXaxoYjsjonrdDuvrWUH/97
         Cx9w==
X-Gm-Message-State: AOJu0YwlxvGdOI8tyURV+RWzv7LDrRyZ9zSr7l8GKxknJYwPEHw2PEsg
	IWkwZ39oiUXn6az0ttjC0Xs7t4cp0cnQYXnJCcKXzpYmopw9OBREW0U9jiyBK1/tkXCEJqZOeCW
	GbzY22jzs0f8PFzNBi00BLIh64cASQ/RpL3OyiB6IWbCzupcUB/5tPsI=
X-Gm-Gg: ASbGncsvMgFU7S7orvCeBZlLNRcp07wePF8bMK7MpkaJ0c6XXmkvB6GSDbx84KfT0V5
	OWWw2Uy/nrtpydpVBIEaCHmKnCWmJbgK8n1bsKEqSsvS56ilK2sXD88fXVB3x8BM+GtUyA4bSER
	IMoe3l6cHv1xf3PrtZwQ2HhCwolJR8cGd5G8FjpJotdCeSVvjbVOhxFlz1phdOSNwiCjhIkaqGN
	xjgwQXabBhRdw0yeiBet1dEpmdBr9u0VTFhA0p4kuk4TykaiIAlfHNA8LxLvicWAKK5GeiRnCCY
	pLECY8XFcnJe1l6EI/qQSWJVCPey86wujSJg/EvxE2lHbUnCJKuulrSsxdb6Dmh7ApZGL7CVMNz
	yGTHhaXXqEfkBwD4o7Y4UP4ic9C6W01TT2syzhKKh9UDHGguulTRGpM+Hzwye/31NlBU=
X-Received: by 2002:a05:600c:1c92:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-45a165051e5mr5065385e9.0.1755032246878;
        Tue, 12 Aug 2025 13:57:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFswYwIbgttuhXqb8QMDI1keoza2GfmCEcOaefby30ent32meTCCjqsOciMD6knuT2QlVpEA==
X-Received: by 2002:a05:600c:1c92:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-45a165051e5mr5065245e9.0.1755032246477;
        Tue, 12 Aug 2025 13:57:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f30:cb00:c425:8b4b:d9ad:eee0? (p200300d82f30cb00c4258b4bd9adeee0.dip0.t-ipconnect.de. [2003:d8:2f30:cb00:c425:8b4b:d9ad:eee0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16de5f27sm1701335e9.13.2025.08.12.13.57.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 13:57:19 -0700 (PDT)
Message-ID: <522f31cc-f250-4883-8832-0d26ebf5210b@redhat.com>
Date: Tue, 12 Aug 2025 22:57:18 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [akpm-mm:mm-new 101/118] arch/powerpc/mm/ptdump/shared.c:70:1:
 error: use of 'pgtable_level' with tag type that does not match previous
 declaration
From: David Hildenbrand <david@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202508130304.5FJqRz2c-lkp@intel.com>
 <0c96fa0e-6f7e-4cca-8d57-f3e3786d44fa@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <0c96fa0e-6f7e-4cca-8d57-f3e3786d44fa@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Yq0YuLIkXtDXob-Hi8tLOxHzZk1k2slVfb0Lq7SQzz8_1755032247
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.08.25 22:50, David Hildenbrand wrote:
> On 12.08.25 21:18, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
>> head:   33ad02f876604ac2990e510480b0ab3a03cf892e
>> commit: 627bf62489a6d9a45f6d6f83edd0cb6c0ee610c0 [101/118] mm/rmap: convert "enum rmap_level" to "enum pgtable_level"
>> config: powerpc-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130304.5FJqRz2c-lkp@intel.com/config)
>> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130304.5FJqRz2c-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202508130304.5FJqRz2c-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>      In file included from arch/powerpc/mm/ptdump/shared.c:10:
>>      arch/powerpc/mm/ptdump/ptdump.h:14:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
>>         14 | struct pgtable_level {
>>            | ^
>>      include/linux/pgtable.h:1961:6: note: previous use is here
>>       1961 | enum pgtable_level {
>>            |      ^
>>      In file included from arch/powerpc/mm/ptdump/shared.c:10:
>>      arch/powerpc/mm/ptdump/ptdump.h:20:8: error: use of 'pgtable_level' with tag type that does not match previous declaration
>>         20 | extern struct pgtable_level pg_level[5];
>>            |        ^
>>      include/linux/pgtable.h:1961:6: note: previous use is here
>>       1961 | enum pgtable_level {
>>            |      ^
>>>> arch/powerpc/mm/ptdump/shared.c:70:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
>>         70 | struct pgtable_level pg_level[5] = {
>>            | ^
>>      include/linux/pgtable.h:1961:6: note: previous use is here
>>       1961 | enum pgtable_level {
>>            |      ^
>>      3 errors generated.
> 
> Huh, I cross compiled this on a bunch of ppc configs, but maybe not emough.
> 
> No, on the branch I submitted that did not exist.
> 
> Probably due to the rebase.

Ehm, no, Andrew, could it be that you accidentally dropped the ppc patch 
from mm-new. I can spot all but that patch in there:

https://lkml.kernel.org/r/20250811112631.759341-7-david@redhat.com

-- 
Cheers,

David / dhildenb

