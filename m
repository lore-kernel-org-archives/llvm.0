Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE7163
	for <llvm@lists.linux.dev>; Mon, 18 Sep 2023 00:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694996719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7XGw7AdgYIk+RoEKFj7VSzvf+HqUpChJVq9bKRl2ets=;
	b=TkntXe/5AJ6EcuDQjCYYViIbwcnK/MBFNMSSdiCVWUc+bbkdlekPwWfuveoaScnDg8LMvr
	VUdigkqby0j95ULeF2Fg+FM4WXsGCG/Kbcv1X0wRcXVT4p2ogpaDVqQbArce8poBZ00rMN
	a2z0nyLq2EVfWfImwJKVPaIrUfS4NAI=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-_Eqjli9fO5yV_9dFf0f66w-1; Sun, 17 Sep 2023 20:25:17 -0400
X-MC-Unique: _Eqjli9fO5yV_9dFf0f66w-1
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-34fe59a20bfso3602945ab.1
        for <llvm@lists.linux.dev>; Sun, 17 Sep 2023 17:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694996717; x=1695601517;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XGw7AdgYIk+RoEKFj7VSzvf+HqUpChJVq9bKRl2ets=;
        b=uqaHjxJzc5hTxs4mcfYBWyoKXhrmSbMehc/YLY56rFMPeiTvDs5PXQNKG7iDVHGiBo
         Az0TravLiWU8zSv4vbgPVnZfrKFnEy2DCFn967g3JPlpsEdEFTfPbfjZ48NoZyMAZ1bO
         nJ6DyiI0eaMhkm09uiR6Zc4PbfXzFCXiinCVQ2UbTKaSH4/kvgZhXcS5ZXrFVqfp4moB
         f9ZOjbi+vFyk1lGPROWImDMKUEgXWV/cbvk+B2aYMhfsb2dO+3BvUdIUvIjhJdIDWjSC
         RRE3zXoSw2vOVlWcojED63dY5ietNL+I+rwPCGf2Q4ifHaFfjI2TZeZv78dVNGS/GDZk
         k4Fg==
X-Gm-Message-State: AOJu0YwV9Up7P5hCKf6A961rBtMLUnuXstb44vfPxLH/B9pqbIjD0+lX
	eZMOS5SYCzv5BL3KWfz0dirwsMxW2JD+OrUXrz+02IEJHUlx7EdXxODtPtVPcsVXZVNgy8w51iC
	5OuPCOWkv1q9A0w==
X-Received: by 2002:a92:c243:0:b0:34f:f373:ad7e with SMTP id k3-20020a92c243000000b0034ff373ad7emr465802ilo.1.1694996716961;
        Sun, 17 Sep 2023 17:25:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgUb4xgzcsF6D3DA7oMGkWPNDOVIlzmfnSfqk/GsC4gkgPnWHPQRcOFDq8+Xz2fcLmLDPI0A==
X-Received: by 2002:a92:c243:0:b0:34f:f373:ad7e with SMTP id k3-20020a92c243000000b0034ff373ad7emr465795ilo.1.1694996716745;
        Sun, 17 Sep 2023 17:25:16 -0700 (PDT)
Received: from [10.72.113.158] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id m23-20020a635817000000b0056606274e54sm4393724pgb.31.2023.09.17.17.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 17:25:16 -0700 (PDT)
Message-ID: <3c4c7ca8-e1a2-fbb1-bda4-b7000eb9a8d9@redhat.com>
Date: Mon, 18 Sep 2023 08:25:10 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ceph: Annotate struct ceph_monmap with __counted_by
To: Kees Cook <keescook@chromium.org>, Ilya Dryomov <idryomov@gmail.com>
Cc: Jeff Layton <jlayton@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ceph-devel@vger.kernel.org, netdev@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-hardening@vger.kernel.org
References: <20230915201510.never.365-kees@kernel.org>
From: Xiubo Li <xiubli@redhat.com>
In-Reply-To: <20230915201510.never.365-kees@kernel.org>
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
> As found with Coccinelle[1], add __counted_by for struct ceph_monmap.
> Additionally, since the element count member must be set before accessing
> the annotated flexible array member, move its initialization earlier.
>
> [1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci
>
> Cc: Ilya Dryomov <idryomov@gmail.com>
> Cc: Xiubo Li <xiubli@redhat.com>
> Cc: Jeff Layton <jlayton@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: ceph-devel@vger.kernel.org
> Cc: netdev@vger.kernel.org
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>   include/linux/ceph/mon_client.h | 2 +-
>   net/ceph/mon_client.c           | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/ceph/mon_client.h b/include/linux/ceph/mon_client.h
> index b658961156a0..7a9a40163c0f 100644
> --- a/include/linux/ceph/mon_client.h
> +++ b/include/linux/ceph/mon_client.h
> @@ -19,7 +19,7 @@ struct ceph_monmap {
>   	struct ceph_fsid fsid;
>   	u32 epoch;
>   	u32 num_mon;
> -	struct ceph_entity_inst mon_inst[];
> +	struct ceph_entity_inst mon_inst[] __counted_by(num_mon);
>   };
>   
>   struct ceph_mon_client;
> diff --git a/net/ceph/mon_client.c b/net/ceph/mon_client.c
> index faabad6603db..f263f7e91a21 100644
> --- a/net/ceph/mon_client.c
> +++ b/net/ceph/mon_client.c
> @@ -1136,6 +1136,7 @@ static int build_initial_monmap(struct ceph_mon_client *monc)
>   			       GFP_KERNEL);
>   	if (!monc->monmap)
>   		return -ENOMEM;
> +	monc->monmap->num_mon = num_mon;
>   
>   	for (i = 0; i < num_mon; i++) {
>   		struct ceph_entity_inst *inst = &monc->monmap->mon_inst[i];
> @@ -1147,7 +1148,6 @@ static int build_initial_monmap(struct ceph_mon_client *monc)
>   		inst->name.type = CEPH_ENTITY_TYPE_MON;
>   		inst->name.num = cpu_to_le64(i);
>   	}
> -	monc->monmap->num_mon = num_mon;

BTW, is this change related ?

>   	return 0;
>   }
>   

Else LGTM.

Reviewed-by: Xiubo Li <xiubli@redhat.com>

Thanks!

- Xiubo


