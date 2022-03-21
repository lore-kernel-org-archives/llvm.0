Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF4B4289
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647869978;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vB3vLBvRcKjKfgtWTOX9eVbtgZOrJ2AsHjIDSNYEF8=;
	b=VSGkoowcjzafZPDyNDsH9khvmzzeDJfhptqpgVtYu/fxa4qwUk8VCO+P4WdSHIAT9iG8pe
	//w6u8ZOILQrhAA8Ms19xS3d0nN6WINkkwhqcExeSTLZors5Mosl5vSZcIRR9IL36i3MsZ
	CCw/G9ofV0Lgqv7GxgkdIclS5uOS0T4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-yiP14evLOfCemkZt_fTDHA-1; Mon, 21 Mar 2022 09:39:37 -0400
X-MC-Unique: yiP14evLOfCemkZt_fTDHA-1
Received: by mail-qt1-f197.google.com with SMTP id y23-20020ac85257000000b002e06697f2ebso9278885qtn.16
        for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 06:39:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4vB3vLBvRcKjKfgtWTOX9eVbtgZOrJ2AsHjIDSNYEF8=;
        b=6z/yyKopPVCKPtIv4kK0xbPGVVfZa5Qtv+h644PQPoM/ZVVMeoLSoWBYeVcZGVN2m1
         rz3QBFGhguRouWwgZrzqTuZEvWgg/YFO8tl4o4OJGLl9tjIJUk6ShL7xyHidbJmW1WpC
         3sp091wvnXmLa8qmYIa79DKJIlTd6OnXFhE8P6/eOI84w+YlPAnM3sUGtqkdaroziEwN
         iQniQ+0+ql8ZYpDTmcG7cbl2zOnoqd7BkqScOjvny1PVi+lwATXUV11kcg2Emc+XxXq0
         ig8Hu5lmFy2vxWTVPidoSjswZLazAgiJNpuTXYQtPNn7/RTCv/jUWBkQomlWgD5AJWcD
         rChQ==
X-Gm-Message-State: AOAM530suUmVzcNBx+xi9Z0S7lJOU4d2g6Gm1SmWLEg4zUEOPoSMXRus
	uM5gHSmRGMoZPX2tcQM1DCZbD0iSMU6dMlAV6qcVw88xs+A7fWC3FiFrtjI2knCNGvU2nobhQSO
	R1XvMabMDRJ5H+93c0jlgqG6UD/tv+frjlRH4F6lekMYRmeizuG8dMwjwiA0/Fz2w+/6+a9g=
X-Received: by 2002:a05:622a:4cb:b0:2e1:ce8c:f097 with SMTP id q11-20020a05622a04cb00b002e1ce8cf097mr16352343qtx.395.1647869976648;
        Mon, 21 Mar 2022 06:39:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwffiZT7sArY+rjQRzyKQCS9OCGHnDeS5R5qqaSRAq/k1AH9vga4g3Q4n0n8Ja7bEYg1j6gaw==
X-Received: by 2002:a05:622a:4cb:b0:2e1:ce8c:f097 with SMTP id q11-20020a05622a04cb00b002e1ce8cf097mr16352307qtx.395.1647869976251;
        Mon, 21 Mar 2022 06:39:36 -0700 (PDT)
Received: from [192.168.1.9] (pool-68-163-101-245.bstnma.fios.verizon.net. [68.163.101.245])
        by smtp.gmail.com with ESMTPSA id e7-20020a37ac07000000b0067d7cd47af4sm7714115qkm.31.2022.03.21.06.39.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Mar 2022 06:39:35 -0700 (PDT)
To: trix@redhat.com, jpoimboe@redhat.com, jikos@kernel.org, mbenes@suse.cz,
 pmladek@suse.com, nathan@kernel.org, ndesaulniers@google.com
Cc: live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20220320015143.2208591-1-trix@redhat.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Subject: Re: [PATCH v2] livepatch: Reorder to use before freeing a pointer
Message-ID: <3ee9826e-b770-d015-0251-e9770172d973@redhat.com>
Date: Mon, 21 Mar 2022 09:39:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220320015143.2208591-1-trix@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=joe.lawrence@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 3/19/22 9:51 PM, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> livepatch-shadow-fix1.c:113:2: warning: Use of
>   memory after it is freed
>   pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The pointer is freed in the previous statement.
> Reorder the pr_info to report before the free.
> 
> Similar issue in livepatch-shadow-fix2.c
> 
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
> v2: Fix similar issue in livepatch-shadow-fix2.c
> 
>  samples/livepatch/livepatch-shadow-fix1.c | 2 +-
>  samples/livepatch/livepatch-shadow-fix2.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
> index 918ce17b43fda..6701641bf12d4 100644
> --- a/samples/livepatch/livepatch-shadow-fix1.c
> +++ b/samples/livepatch/livepatch-shadow-fix1.c
> @@ -109,9 +109,9 @@ static void livepatch_fix1_dummy_leak_dtor(void *obj, void *shadow_data)
>  	void *d = obj;
>  	int **shadow_leak = shadow_data;
>  
> -	kfree(*shadow_leak);
>  	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>  			 __func__, d, *shadow_leak);
> +	kfree(*shadow_leak);
>  }
>  
>  static void livepatch_fix1_dummy_free(struct dummy *d)
> diff --git a/samples/livepatch/livepatch-shadow-fix2.c b/samples/livepatch/livepatch-shadow-fix2.c
> index 29fe5cd420472..361046a4f10cf 100644
> --- a/samples/livepatch/livepatch-shadow-fix2.c
> +++ b/samples/livepatch/livepatch-shadow-fix2.c
> @@ -61,9 +61,9 @@ static void livepatch_fix2_dummy_leak_dtor(void *obj, void *shadow_data)
>  	void *d = obj;
>  	int **shadow_leak = shadow_data;
>  
> -	kfree(*shadow_leak);
>  	pr_info("%s: dummy @ %p, prevented leak @ %p\n",
>  			 __func__, d, *shadow_leak);
> +	kfree(*shadow_leak);
>  }
>  
>  static void livepatch_fix2_dummy_free(struct dummy *d)
> 

Hi Tom,

Ordering doesn't matter for the example, so let's clean up the static
analysis.

Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

But for my sanity, isn't this a false positive?  There shouldn't be harm
in printing the pointer itself, even after what it points to has been
freed, i.e.

	int *i = malloc(sizeof(*i));
	free(i);
	printf("%p\n", i);      << ok
	printf("%d\n", *i);     << NOT ok

But I suppose clang doesn't know that the passed pointer isn't getting
dereferenced by the function, so it throws up a warning?  Just curious
what your experience has been with respect to these reports.

Thanks,
-- 
Joe

