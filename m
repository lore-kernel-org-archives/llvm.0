Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C563FC1
	for <llvm@lists.linux.dev>; Mon,  6 Sep 2021 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630924551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E78uanjC+A4pNGOOveJz0nPoj16iiTnpo7AzuQ/YmiQ=;
	b=Wz9CLlhtyexXHGH74nhPoCA0SxUJJaE0nNG5nqF+B+bXDGcQdnSGqKyWqfn6aKJeeQ0dGM
	jQgLA1WJ25bOb6TZ8sL70hJTjABEi1VKakDFa2aCraxdv4d/OVirWEhV8ueFDSDUAneVU9
	dKksSbw39ULFyGYrd269rcBhIDmc6zs=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-cvkyN1dENYiU318fo9hfkg-1; Mon, 06 Sep 2021 06:35:50 -0400
X-MC-Unique: cvkyN1dENYiU318fo9hfkg-1
Received: by mail-wr1-f71.google.com with SMTP id h1-20020adffd41000000b0015931e17ccfso1074594wrs.18
        for <llvm@lists.linux.dev>; Mon, 06 Sep 2021 03:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=E78uanjC+A4pNGOOveJz0nPoj16iiTnpo7AzuQ/YmiQ=;
        b=ZplwGRZfopZc60olpHRUM2IZYEuv+2vk0+Xx0Snq6+7A5d+DxTYDPicQ8iI8wd7L/+
         9DyHGpeEKYZh8L7hH84wMEXbGL9iYt5emVisnobU+juB5FcZyBJQ8P8xIWTuOjPQt8SR
         47vMtGfABaQN6/1gNrXvTTZBa1b2EQEVyFrLbIkghl6tg3RqD+LfEAJCvH+PZw5KQmBr
         UTv1OLOZPhCJYeuj8ohsGMwb6dcjjjrAUPTNz0FhDFB5CE001PQHUY9+y/6H28bwo40l
         ca49vUSfb97ynq7UAjxZrlRpd+22xM1Cpn89uCd6KtFm345/2MhHF3CdG+wAHyNUfXu6
         ErVw==
X-Gm-Message-State: AOAM530hmZL9LNb2Im5do94N9vKHlXfrVz4LqkblCc7DsxYJb+E/pabq
	iBWZGI40hsGhVYheOUUPGkENMIX8O7pVLSqbRgyub8mV/gF5pQl6+YIlrPu1rJxbR5wsDg3hd5b
	Ed9JVGjzQY+eWWw==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr12677195wrj.371.1630924549079;
        Mon, 06 Sep 2021 03:35:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDDwOYcH4tX+ZnhMRJkRDEUDJQROZnpCaDzqWLcRGuCbvWJt8IQBS2hg9zV6KtJ4T5UiDi3Q==
X-Received: by 2002:adf:dc8a:: with SMTP id r10mr12677179wrj.371.1630924548861;
        Mon, 06 Sep 2021 03:35:48 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6323.dip0.t-ipconnect.de. [91.12.99.35])
        by smtp.gmail.com with ESMTPSA id n14sm7261967wrx.10.2021.09.06.03.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Sep 2021 03:35:48 -0700 (PDT)
Subject: Re: [linux-next:master 10023/11721]
 include/linux/memory_hotplug.h:312:26: warning: unused parameter 'group'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <202109061139.7rjMTWLn-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8e405e43-c5f0-d58b-e38a-fe19f97c3333@redhat.com>
Date: Mon, 6 Sep 2021 12:35:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202109061139.7rjMTWLn-lkp@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

>     include/linux/memory_hotplug.h:311:47: warning: unused parameter 'start_pfn' [-Wunused-parameter]
>     static inline int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>                                                   ^
>     include/linux/memory_hotplug.h:311:72: warning: unused parameter 'nr_pages' [-Wunused-parameter]
>     static inline int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>                                                                            ^
>>> include/linux/memory_hotplug.h:312:26: warning: unused parameter 'group' [-Wunused-parameter]
>                                     struct memory_group *group)

What a bunch of useless warnings ...

Nothing to fix here.


-- 
Thanks,

David / dhildenb

