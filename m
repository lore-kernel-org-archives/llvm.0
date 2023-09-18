Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8B8163
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 00:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694996739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AJdGHYJg1hgtR/OBv+kksXjfIjKSJaQgEUNRz4rnSZ4=;
	b=GmvybUmbNk8i2sLKHAOQ32EYyqORBflUfHrtEJ7Jl3jrkIDbRxRMZs2rkTWI5TzA3gEV3I
	CiavIzGjOTojrxEHBjMnh69I0A+udoNebwV3ypt5Q5kWpsanoCBAS+NbVMRvdOFoYa5vjV
	BlICdikFAN3lMizc57hZTXREia3pNFc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-uN-llfJDOuSLrS9oLx6hiA-1; Sun, 17 Sep 2023 20:25:37 -0400
X-MC-Unique: uN-llfJDOuSLrS9oLx6hiA-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2748ef8b3c7so1928268a91.1
        for <llvm@lists.linux.dev>; Sun, 17 Sep 2023 17:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694996737; x=1695601537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJdGHYJg1hgtR/OBv+kksXjfIjKSJaQgEUNRz4rnSZ4=;
        b=qcQ95IqZW6R3lcZMN9M3r0Y4NohAlw/zd0WbHJi1YF0ntmPiaFq4jJZMv/8nMB/vaA
         cIVAWeQuOZ1KE+YU+O4xM9UkbO2f0UI3lsDXnEiSvnzqTk54uKP46frniX8E2jZH7i4K
         e9xWZ+Mti+hf3VSqSnpj3cBbIG3MDx38QVkHje2G7pXcirICRWuh2zdwqc8NnA381z5N
         URsuDsa0G54IgZY7lgvSe5HLU3wjp7YA7CteKHDLQtyEJ/xwu4RJtqUBF0507v0aFjA4
         N8IplerxFlwMxnCoZk/YFxUE6y7/i0F458vjOuq4g0O9L80+zGiufSxe4x25BBw/Tq+y
         mlFQ==
X-Gm-Message-State: AOJu0YxX0bIV5tfCptd+eMtCgtjJO1u21qa6ZewcwyjaRyFFRCphk8At
	uVKe1tky+jW1IweiQeFuzCdfgnre0TFU88ZkSXpeoGa3dgN5brqz2qea1EWU5wJ7iZP6AshYG38
	AS61HP0PAX3B6Uw==
X-Received: by 2002:a17:90a:fd0f:b0:26d:2b42:cdae with SMTP id cv15-20020a17090afd0f00b0026d2b42cdaemr5172616pjb.3.1694996737001;
        Sun, 17 Sep 2023 17:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLXF0oBCb3Jg8l98K1Q8D+w9gzQ6POlmU6bqJG7rj6YyYltCayunR+jeerTVRAYQhzNW9o9g==
X-Received: by 2002:a17:90a:fd0f:b0:26d:2b42:cdae with SMTP id cv15-20020a17090afd0f00b0026d2b42cdaemr5172602pjb.3.1694996736663;
        Sun, 17 Sep 2023 17:25:36 -0700 (PDT)
Received: from [10.72.113.158] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id q8-20020a17090a178800b0026f39c90111sm6713718pja.20.2023.09.17.17.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 17:25:35 -0700 (PDT)
Message-ID: <246eda77-09c9-ae8a-996a-44d69fca84a4@redhat.com>
Date: Mon, 18 Sep 2023 08:25:31 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ceph: Annotate struct ceph_osd_request with __counted_by
To: Kees Cook <keescook@chromium.org>, Ilya Dryomov <idryomov@gmail.com>
Cc: Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201517.never.373-kees@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230915201517.never.373-kees@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/16/23 04:15, Kees Cook wrote:
> Prepare for the coming implementation by GCC and Clang of the __counted_by
> attribute. Flexible array members annotated with __counted_by can have
> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
> functions).
>
> As found with Coccinelle[1], add __counted_by for struct ceph_osd_request.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
>
> Cc: Ilya Dryomov <idryomov@gmail.com>
> Cc: Xiubo Li <xiubli@redhat.com>
> Cc: Jeff Layton <jlayton@kernel.org>
> Cc: ceph-devel@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   include/linux/ceph/osd_client.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/ceph/osd_client.h b/include/linux/ceph/osd_client.h
> index bf9823956758..b8610e9d2471 100644
> --- a/include/linux/ceph/osd_client.h
> +++ b/include/linux/ceph/osd_client.h
> @@ -278,7 +278,7 @@ struct ceph_osd_request {
>   	int r_attempts;
>   	u32 r_map_dne_bound;
>   
> -	struct ceph_osd_req_op r_ops[];
> +	struct ceph_osd_req_op r_ops[] __counted_by(r_num_ops);
>   };
>   
>   struct ceph_request_redirect {

Reviewed-by: Xiubo Li <xiubli@redhat.com>

Thanks!

- Xiubo


