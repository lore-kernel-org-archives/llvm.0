Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51FC1FD4
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 13:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647350925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPwMDqoeq62hMQvUW+d6m4fa4n/Ezhwwm7xT9axVhHI=;
	b=dj+8Tgw3axGKNC+QQlVrUxLn3nEznJAnGqFhUPY1iZFflZAfeFdTUADEi/qjFTHm63JtW0
	6RNGGGrZQIemjU09QLVC9E6Jq9gaUm/4Tj/yC3aH04fA2UAh6N+Ujx6fQW+9wCKfURP5sr
	dIa97LahJNbKALucatexhlQKlLzq0WQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-Yp9hqyr9NFyAX8zeVhvZHA-1; Tue, 15 Mar 2022 09:28:42 -0400
X-MC-Unique: Yp9hqyr9NFyAX8zeVhvZHA-1
Received: by mail-wr1-f69.google.com with SMTP id j44-20020adf912f000000b00203a5a55817so1625405wrj.13
        for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 06:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iPwMDqoeq62hMQvUW+d6m4fa4n/Ezhwwm7xT9axVhHI=;
        b=3awWyS+XF/xj8WryZw+8LPGlKfiK1tXohGOBy2jiIGvnLpdn3zXlmVuhSE1DJ+JQJf
         1ejhiCZ7BllikIzlwVlzuFaOu4mhUKvfWRnOoMXpEhMUAqj++Kg+ZvH6X8Zz5Dxegtwh
         rnKt0Ed2U4S4c2nzXvhlmoNYa+8WbwInDdAYLkftvImBl55djx311SArk+r1e/4W5uMp
         uefzOy36QfuX01xa3rRdu90GK9toZVsgxkljskKpI3bpjQGIN7cXlmtYBJxkSjcVJeFb
         fhXVNQqPmaYhdNUh31KnaInPca6RtL5tQZ4va6GCTWbwuTUbzNhUU30GizF50elHQIJ3
         q2Sw==
X-Gm-Message-State: AOAM530nlZTkme/RHVK9OjDKZNRWyr/w5PKs04UDnJujg/b8vlrAnUb+
	VnPoMjD7BC6pzrocq2Fftswl75S88Swg563N8cQcx4tvtDzn3qU/ECKQOT0ZyNhWdA74uCWnPpj
	0z/3mK8z127PYcw==
X-Received: by 2002:a05:6000:2c4:b0:203:72c9:ef37 with SMTP id o4-20020a05600002c400b0020372c9ef37mr19554484wry.387.1647350921394;
        Tue, 15 Mar 2022 06:28:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynwrsQrU6Igmjz50LudSk6gmIi09KRWpQylByny5QYQEzWyoMegsicYMO/z5ro86kUgXM4yw==
X-Received: by 2002:a05:6000:2c4:b0:203:72c9:ef37 with SMTP id o4-20020a05600002c400b0020372c9ef37mr19554472wry.387.1647350921151;
        Tue, 15 Mar 2022 06:28:41 -0700 (PDT)
Received: from redhat.com ([2.53.2.35])
        by smtp.gmail.com with ESMTPSA id s2-20020a1cf202000000b0038977146b28sm2283136wmc.18.2022.03.15.06.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 06:28:40 -0700 (PDT)
Date: Tue, 15 Mar 2022 09:28:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: trix@redhat.com
Cc: jasowang@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	lingshan.zhu@intel.com, sgarzare@redhat.com,
	xieyongji@bytedance.com, virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] vDPA/ifcvf: match pointer check to use
Message-ID: <20220315092656-mutt-send-email-mst@kernel.org>
References: <20220315124130.1710030-1-trix@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220315124130.1710030-1-trix@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 15, 2022 at 05:41:30AM -0700, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> ifcvf_main.c:49:4: warning: Called function
>   pointer is null (null dereference)
>   vf->vring->cb.callback(vring->cb.private);
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> The check
>   vring = &vf->vring[i];
>   if (vring->cb.callback)
> 
> Does not match the use.  Change dereference so they match.
> 
> Fixes: 79333575b8bd ("vDPA/ifcvf: implement shared IRQ feature")

Thanks a lot! I squashed this into the offending patch - no point in
breaking bisect. Pushed to linux. However I'm now
having second thoughts about applying that patchset - I'd like
soma analysis explaining how this got through testing.

> Signed-off-by: Tom Rix <trix@redhat.com>

> ---
>  drivers/vdpa/ifcvf/ifcvf_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
> index 3b48e717e89f7..4366320fb68d3 100644
> --- a/drivers/vdpa/ifcvf/ifcvf_main.c
> +++ b/drivers/vdpa/ifcvf/ifcvf_main.c
> @@ -46,7 +46,7 @@ static irqreturn_t ifcvf_vqs_reused_intr_handler(int irq, void *arg)
>  	for (i = 0; i < vf->nr_vring; i++) {
>  		vring = &vf->vring[i];
>  		if (vring->cb.callback)
> -			vf->vring->cb.callback(vring->cb.private);
> +			vring->cb.callback(vring->cb.private);
>  	}
>  
>  	return IRQ_HANDLED;
> -- 
> 2.26.3

