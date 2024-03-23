Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCB2FBE9
	for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 17:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711215533; cv=none; b=uB9NYxIvMdePpSV5j7/TOJmTMz5xmR12/30oHRftJOV/QUWPp8sdIs/X+DSEtVOuqnEBMlu/o9kQ7K/IxjS4VJcqAtnngbuuGKwV1zzYbIgOd2ukY3HI6vKqLD3hWSTlW+8jwfNYRQYpGHJFxU0Xy98PyuKwLrNngHJwuzHkQ/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711215533; c=relaxed/simple;
	bh=UQIiK8Z4s/l94svTjPP1GphXf2R1CeD3GtdYcZYyGe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=eMn70sv7BMngOzXcgwl59Kct9IUJ11hbyKZjajssS217KB/7/pLMjWs/RpCBT4u9wWnaoruJhEmWsbX352hMcmUq/3Ku5Am4dOZ5ltTvMmpsJeqNirpZPiVpFi5ZjBwkxdy0LYAeOS3OLIbqsNfQCNUpL61Nn04VUUVD8NI1k2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XaUGgdef; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XaUGgdef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711215530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hIauagApnARH4T0nvgXygBukzfZfxhBo5aFzyNLrHzg=;
	b=XaUGgdefhdpmNAx3AOyVJo2GYd/WAedmOorkSdl56PL8WJPoIyH90djLnC4IKWfvplGS6n
	hH+ZVfqMBbaCleQrRPgvqCkb42oBwTojLnInGfeo10bT4dYeEe+oEwDlV/LaUVP5mOAsGC
	/r1X9yOGx+W4W9N3GrDj54uSRJJjVv8=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-XnmppUrqMD-Fl9PJuzvIAw-1; Sat, 23 Mar 2024 13:38:47 -0400
X-MC-Unique: XnmppUrqMD-Fl9PJuzvIAw-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c22fa01f9dso174534b6e.0
        for <llvm@lists.linux.dev>; Sat, 23 Mar 2024 10:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711215527; x=1711820327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIauagApnARH4T0nvgXygBukzfZfxhBo5aFzyNLrHzg=;
        b=OgpL7YtaJD55tGEFsnNd/mvjnq3CwEEHsYbHyWSKRtw569xKN5cjZroK/7DLth09Ji
         GGV1buHfVrPbd2U0KQnDOuOqGrnTmxbzU0SAPMEoZeme88K3yz+aNlYK3tXj6yhmyz/F
         ez+ziUKj+SOpI7PWrhhJyexgM0UkVQTRt36db37+tK8Y4wyD/ZwnVvnfnslacBkJMfka
         Fr0yjlAvOml5f7EAiwefXAlKWIlVZ9q6ZY9gl4zmG49df/tCg+ZeK0YTHpv5IEDZsjNs
         L4kXKq3ErD+zxvE4i36e17m6oqr1FD+Q+wNmfdnm4/sdYsmmE0mGPXfTuKkvq8OJvO93
         YDzQ==
X-Gm-Message-State: AOJu0YygrLncJ6swwe0hKzctLo1q9/FnwzWRAjxIKtxRTbxzSu65rMUQ
	ruPQbJBdyUGA+SIkpkojhY34X/zmoxbo+AGjC9J0dJ3XIVOQjLYUVK4R2Ur0ba7cf83l0efRTEU
	y98U1pJZTf3ouVmWqoXsymKuPmEsi2YNf67mz7vQPEfZ9h/P4R68=
X-Received: by 2002:aca:d05:0:b0:3c3:c090:59cd with SMTP id 5-20020aca0d05000000b003c3c09059cdmr2628148oin.0.1711215526684;
        Sat, 23 Mar 2024 10:38:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiVWsP3fTAlbJWgwYv+bI8uN+5fNa1oDVYu5Ny06AJ0joFwcEZjlU+wbLtW5FnYWSeHjMB3g==
X-Received: by 2002:aca:d05:0:b0:3c3:c090:59cd with SMTP id 5-20020aca0d05000000b003c3c09059cdmr2628133oin.0.1711215526216;
        Sat, 23 Mar 2024 10:38:46 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id jx12-20020a0562142b0c00b006961cc3f91asm2264494qvb.20.2024.03.23.10.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 10:38:45 -0700 (PDT)
Date: Sat, 23 Mar 2024 13:38:44 -0400
From: Peter Xu <peterx@redhat.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [akpm-mm:mm-unstable 115/141] mm/gup.c:536:22: error: call to
 undeclared function 'pud_pfn'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <Zf8TpI3unIxZuPRn@x1n>
References: <202403240112.kHKVSfCL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <202403240112.kHKVSfCL-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, Mar 24, 2024 at 01:24:25AM +0800, kernel test robot wrote:
> >> mm/gup.c:536:22: error: call to undeclared function 'pud_pfn'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      536 |         unsigned long pfn = pud_pfn(pud);
>          |                             ^
>    mm/gup.c:536:22: note: did you mean 'pte_pfn'?
>    arch/powerpc/include/asm/pgtable.h:60:29: note: 'pte_pfn' declared here
>       60 | static inline unsigned long pte_pfn(pte_t pte)
>          |                             ^
>    9 warnings and 1 error generated.

Duplicated issue of:

https://lore.kernel.org/r/202403231529.HRev1zcD-lkp@intel.com/

Resolved by:

https://lore.kernel.org/r/20240323151643.1047281-1-peterx@redhat.com

-- 
Peter Xu

