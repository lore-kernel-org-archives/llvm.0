Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E6813BC3E
	for <llvm@lists.linux.dev>; Wed,  5 Jun 2024 22:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717627951; cv=none; b=r8aoRSNNZ4KqJzKBs23w+Yyi/IYebXZ4z6BOnCMkwRzTCQSAHvEhIA8uFOKw3vMTvHaPqbsesWi6WVD6R+/W2VrYbseqJEKlNjorfuNTvZirdIp8klHsJBCjb8xI2GDbCAp3y7H7ZHyuopC/E/HMDPb2uhRIlNTrlFO5md7Zolk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717627951; c=relaxed/simple;
	bh=0cwXZcxCdrSifwf2gN5a3Jk2vxotO1McJQe9I4GT33w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oAQmCFwAbAabIY+rSi8bbJOcPQtryA4bOXJxG3RQ3NAF/J39/GhJ+5xD+RhDeKFvynWB6mca1mPz5YL7A/V44mC+CugifAdQPFW+VkAbVxCtlSWepLtFknlVDSTU9bzvUcpiI/zP68D1jf24YAsBLlDbwadwjrl6LICD9ebUdLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lc+s3sOP; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lc+s3sOP"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-37482449fd8so1303525ab.3
        for <llvm@lists.linux.dev>; Wed, 05 Jun 2024 15:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717627949; x=1718232749; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YSDCArb6+iGdyUdtqqd9pStleb4MvKmGGngMGBUDMQA=;
        b=Lc+s3sOPeLgrK1mjSr8Al3GETgmvjUJ5UdSbLL6oRVlQ5GaCxY8ecsGe+JUR7c5Bfs
         ZgAl4ugjTJVBi1jltrPNnXwOh3fsKKByDb59+jNtQNR3c/pY9v30GUlUq+ag2lMOb9fk
         pOhabczGYexvtFL6Qat5GNkRcgQepoF3iAA2qXG2JARIlu57TSAoYswu9UcB0Pk6bLN6
         4IIOERCQ54b7s4CGDhK8srPcpkCbS2xe0hu9CjwSqcsmSV8JWhmeLtAotZh7jD099y76
         Bx3EVBTkz7Ij6/vS8rlSABPl9fSTx/ME6OQOeKUDnV5QtHXiTeHiYBIv8kB6+wDQToOi
         adlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717627949; x=1718232749;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YSDCArb6+iGdyUdtqqd9pStleb4MvKmGGngMGBUDMQA=;
        b=hjDCyFT/0XEaZ3kEHq6/eWYMDmR9yPL1W4dxK+6udEwoUcKR3E1hM8aAPgWs5zAjJ+
         oMbG4VnL0tXkUb2UEtl+QfUlaewWGIP/6cVSWPIC/4mA47vf+xXNZOIB4Te2QHIBzqvE
         gxp4AWkvNIy7om8agdT0TFAzmyKZUnB+kJMzVhxlUv3j+P2bR/sxbDeOpu7nYX8ryjkS
         +lWBCJRAgz9Tp1HGH97q2QJLsm9tVJaBiOK6DBQjb+zHu4MLI7r6eUyEO3gwYyUsVB9k
         rC+6GBOz55wgIeztectmRjuJ/Qp0pdWl34p6cKvH9mrY9xkKS4ApbGkmA/6tNjzHW8Xf
         +LPw==
X-Forwarded-Encrypted: i=1; AJvYcCU9nXN3W8UXLox9KC1ddeGIbmvG6zq2H1ZrvCjUU+omdiiuIjakwgqdAOlN+4WLGCqUSditv+WQjqbUf1oqa3Ikuy9uzg==
X-Gm-Message-State: AOJu0YxgMo0lwUONt0Jt5nBpQe/UA/kSq/Xxv6xM93R+vb8tFcbFI+y4
	P8nWihLqp4HK2JmP6sa6i5fNbPegClyEqSw0LMoVf8KD+APeVdwgivrOLRg2Dw==
X-Google-Smtp-Source: AGHT+IGzKiuu7Olg+ErkMrLVtXTStiQhWRPUfQmlopnZPzGP8VPYwj/Ku5f0IqDPhNz9a6uiFJwWyw==
X-Received: by 2002:a05:6e02:1fed:b0:374:9c23:a06a with SMTP id e9e14a558f8ab-374b1ee216fmr42265675ab.6.1717627948503;
        Wed, 05 Jun 2024 15:52:28 -0700 (PDT)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de28f37482sm47423a12.94.2024.06.05.15.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 15:52:28 -0700 (PDT)
Date: Wed, 5 Jun 2024 22:52:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Edward Liaw <edliaw@google.com>
Cc: shuah@kernel.org, Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@android.com, llvm@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v1 2/2] selftests/mm: Guard defines from shm
Message-ID: <ZmDsKBrkh43-Zn8H@google.com>
References: <20240605223637.1374969-1-edliaw@google.com>
 <20240605223637.1374969-3-edliaw@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240605223637.1374969-3-edliaw@google.com>

On Wed, Jun 05, 2024 at 10:36:35PM +0000, Edward Liaw wrote:
> thuge-gen.c defines SHM_HUGE_* macros that are provided by the uapi
> since 4.14. These macros get redefined when compiling with Android's
> bionic because its sys/shm.h will import the uapi definitions.
> 
> However if linux/shm.h is included, with glibc, sys/shm.h will clash on
> some struct definitions:
> 
>   /usr/include/linux/shm.h:26:8: error: redefinition of ‘struct shmid_ds’
>      26 | struct shmid_ds {
>         |        ^~~~~~~~
>   In file included from /usr/include/x86_64-linux-gnu/bits/shm.h:45,
>                    from /usr/include/x86_64-linux-gnu/sys/shm.h:30:
>   /usr/include/x86_64-linux-gnu/bits/types/struct_shmid_ds.h:24:8: note: originally defined here
>      24 | struct shmid_ds
>         |        ^~~~~~~~

I also hit this issue while using bionic. I have a thread reporting this
issue here: https://lore.kernel.org/all/Zl4LC9lTNptB2xTJ@google.com/

According to Andi Kleen, glibc and others should add these defines in
their headers. So it make sense to me that we would need indefs to
prevent a redefine macro issue.

> 
> For now, guard the SHM_HUGE_* defines with ifndef to prevent
> redefinition warnings on Android bionic.
> 
> Signed-off-by: Edward Liaw <edliaw@google.com>
> ---
>  tools/testing/selftests/mm/thuge-gen.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tools/testing/selftests/mm/thuge-gen.c b/tools/testing/selftests/mm/thuge-gen.c
> index 034635317935..d50dc71cac32 100644
> --- a/tools/testing/selftests/mm/thuge-gen.c
> +++ b/tools/testing/selftests/mm/thuge-gen.c
> @@ -34,10 +34,18 @@
>  #endif
>  
>  #define SHM_HUGETLB     04000   /* segment will use huge TLB pages */
> +#ifndef SHM_HUGE_SHIFT

nit: I see this file uses the form "#if !defined()" above for
MAP_HUGETLB. Perhaps it makes sense to use that and keep things
consistent? I'm fine either way.

Reviewed-by: Carlos Llamas <cmllamas@google.com>

>  #define SHM_HUGE_SHIFT  26
> +#endif
> +#ifndef SHM_HUGE_MASK
>  #define SHM_HUGE_MASK   0x3f
> +#endif
> +#ifndef SHM_HUGE_2MB
>  #define SHM_HUGE_2MB    (21 << SHM_HUGE_SHIFT)
> +#endif
> +#ifndef SHM_HUGE_1GB
>  #define SHM_HUGE_1GB    (30 << SHM_HUGE_SHIFT)
> +#endif
>  
>  #define NUM_PAGESIZES   5
>  #define NUM_PAGES 4
> -- 
> 2.45.1.467.gbab1589fc0-goog
> 

