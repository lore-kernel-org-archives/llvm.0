Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B736229BD9D
	for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 20:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031828; cv=none; b=b3bFaZ6cueR/dRuFwOgTuGXh+M1KbCNWH6rs37LD2huuwPair7/XeKTzNlShDaE4qt0tOYkhTAJPoM/edGimrCNTzoLijUuliuy4O0E01rgaGX02SynNZ1cL2VvMwiL0AIkyejC8Ve4wuZqWyNyL/LfrRoXgTwsRT9py3vovasw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031828; c=relaxed/simple;
	bh=TB5K/tPK//9eu4Cg6VoBnKMQMx5mYfydMrgcHI/KPTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhHIjxDQ9N0/wwIRZhkp+rfhXVBzAc+kv+b4GSnsK+3prw1mW+PbhzqWHMjBS1eG29l052clvqNlMk6vQfoR2+J3/llNhk37ziEzyWx9huzYrsZiQPodcedSh/adcneCVRexw0FjVkJLWVxDi839tA+db7jbCn7NIoUL7wqs/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KRl/iJEE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KRl/iJEE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755031825;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=i7YvdQwB8rttbhsO1577uV1RViiXcc8diXFNbqrfJYg=;
	b=KRl/iJEEiqwz+B+lRRT1HPFp9XNmDt2aM9zex7hJU+W28TGCHkXXyD1TGe6lVJw6hPXI7U
	FHNKXmJX7zcaiUj/G96Bk5xWrzhjAUohszDdL6QltRVGsrJgSGslEWrKR4QP6Cedt8SQYj
	D8qwYysvnAa6i5MWpGqYuIQLkMXOm4U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-ci0HvZKKPe-BN08gAm69Yw-1; Tue, 12 Aug 2025 16:50:24 -0400
X-MC-Unique: ci0HvZKKPe-BN08gAm69Yw-1
X-Mimecast-MFC-AGG-ID: ci0HvZKKPe-BN08gAm69Yw_1755031823
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3b79ad7b8a5so3790878f8f.3
        for <llvm@lists.linux.dev>; Tue, 12 Aug 2025 13:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031823; x=1755636623;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i7YvdQwB8rttbhsO1577uV1RViiXcc8diXFNbqrfJYg=;
        b=QwPz6KJUBqfG+aF7ZpVtRfm68ukMZypKGgNlDf5uexG9OBiOdCtR1o7V3NmJGCuRZK
         PCNXO58tSXqkyoDBvBwOd4ptIyy3LkvwZsZZ8cl+gtwKiUQg5PcS5Ew2KFOVB5Dqkw9H
         F+Xrbu1jS7El5+mxhCbz9KjYGZXpsIF8symAVO6ETi8OoaBRPehkR+oF4U/P3Z4CPHT5
         cChdxFcruFyhJj5vIUnGuxsLD6cD+CF0zPo+QMkHDa6eyw+j6O7gvnBSd8O4a70mipWK
         GXNrAKllePSUu3TpdGe23SrMLT7yu3d0rS0hn+6w0DrB+naNg8wVWkH39KY32/RJVeZd
         m05g==
X-Gm-Message-State: AOJu0Yw/r/+JBXUMTMW0iutRr+UDyttpm1CXg8SOItUA4KJ/7Zu2EzpC
	15QGPKT49PFekeDqIq7xzr/9SWwe+EJyiL8i28IfAgRwpIn193QHbgBzPOcIE8VVjy9UHNMkxJj
	CY2jnfsBuZz/66J6hbkjqV6xwvRdtV21A5+EJr4ge/Ia5zDG8cPIub1qt0QzDv+c=
X-Gm-Gg: ASbGnctybyJ9Z1zrKU4p1xA7+fjHXi7PZtqTKxBTeP5yMWPjxuBBBOigScOOElUtQJB
	JbMmxDMZ5iE74DHvlZtNQJ+YFMJJqSgXbbYDLM5m0JV/npxSKKTsuXi+Jtt7kdO9Awcrk2P3JtK
	pa2sd2C5hLMquagMbV3J0O5NuxNQ4Bxut3Xe0eAVe52c4xSLUh+whncdJF/O6TUqgjCcNHH1sZd
	Eo/3ZO0ZW4SNIRnIgxYHv+/C5JSOxj8oj3AFKVCQnzG8wCNxJf/xSvg+LXkjux6d1CFi3wfUNq9
	b+Jy95Z1KyCYaYnjZ0kLRwG8qWKfDt9EC5ShQRQyJuOHtWLmUeAZwoS+Hbgi/jPbOuYfSfpPAsp
	h9LVb2fQS+GMPha8ENZpMmjOqUHgoo1ogSi/9Mil57auEXSMQMkEgCMhl3qX/HhirkQs=
X-Received: by 2002:a5d:5d86:0:b0:3b9:13e4:9693 with SMTP id ffacd0b85a97d-3b917edd49amr261524f8f.52.1755031822689;
        Tue, 12 Aug 2025 13:50:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNykJv7Lvbr5f90XjicFITMJaQbu0/2nFACy0ZV5jZlmNVRbBlprfnnGCdefBalsMmuBo+w==
X-Received: by 2002:a5d:5d86:0:b0:3b9:13e4:9693 with SMTP id ffacd0b85a97d-3b917edd49amr261518f8f.52.1755031822271;
        Tue, 12 Aug 2025 13:50:22 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f30:cb00:c425:8b4b:d9ad:eee0? (p200300d82f30cb00c4258b4bd9adeee0.dip0.t-ipconnect.de. [2003:d8:2f30:cb00:c425:8b4b:d9ad:eee0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm45439761f8f.22.2025.08.12.13.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 13:50:21 -0700 (PDT)
Message-ID: <0c96fa0e-6f7e-4cca-8d57-f3e3786d44fa@redhat.com>
Date: Tue, 12 Aug 2025 22:50:20 +0200
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
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202508130304.5FJqRz2c-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <202508130304.5FJqRz2c-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vsJ_QpiyknRIMZSZBZhIqmaCR5TMmTx-HMg4hRoNgSI_1755031823
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.08.25 21:18, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
> head:   33ad02f876604ac2990e510480b0ab3a03cf892e
> commit: 627bf62489a6d9a45f6d6f83edd0cb6c0ee610c0 [101/118] mm/rmap: convert "enum rmap_level" to "enum pgtable_level"
> config: powerpc-randconfig-001-20250812 (https://download.01.org/0day-ci/archive/20250813/202508130304.5FJqRz2c-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508130304.5FJqRz2c-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202508130304.5FJqRz2c-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from arch/powerpc/mm/ptdump/shared.c:10:
>     arch/powerpc/mm/ptdump/ptdump.h:14:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
>        14 | struct pgtable_level {
>           | ^
>     include/linux/pgtable.h:1961:6: note: previous use is here
>      1961 | enum pgtable_level {
>           |      ^
>     In file included from arch/powerpc/mm/ptdump/shared.c:10:
>     arch/powerpc/mm/ptdump/ptdump.h:20:8: error: use of 'pgtable_level' with tag type that does not match previous declaration
>        20 | extern struct pgtable_level pg_level[5];
>           |        ^
>     include/linux/pgtable.h:1961:6: note: previous use is here
>      1961 | enum pgtable_level {
>           |      ^
>>> arch/powerpc/mm/ptdump/shared.c:70:1: error: use of 'pgtable_level' with tag type that does not match previous declaration
>        70 | struct pgtable_level pg_level[5] = {
>           | ^
>     include/linux/pgtable.h:1961:6: note: previous use is here
>      1961 | enum pgtable_level {
>           |      ^
>     3 errors generated.

Huh, I cross compiled this on a bunch of ppc configs, but maybe not emough.

No, on the branch I submitted that did not exist.

Probably due to the rebase.

-- 
Cheers,

David / dhildenb

