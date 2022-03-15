Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2056F1FD4
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647350625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IEpiYhsMGlq2ReYke60gfIQZ2QzqWJpfRL9F+OcYAMY=;
	b=eTh/+BtUq8mkG3eLN+XzrwBClSIGZkA7ig53ycIRZfiDtSRDQzjBPWC7xbBnS7LfFbRFar
	o9tPJ3styOFDEd71BxS9nUnMEZobNGjjvLDosa2tbua8a10xmRmVvKSvFI5Fs5xBi4KOZu
	ciI++kvLZCTUSSzyxwrphkdbKJ3iFt0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-7mCoEQvoM2SdxLfzJmu0qQ-1; Tue, 15 Mar 2022 09:23:43 -0400
X-MC-Unique: 7mCoEQvoM2SdxLfzJmu0qQ-1
Received: by mail-wm1-f72.google.com with SMTP id c126-20020a1c3584000000b00380dee8a62cso6625569wma.8
        for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 06:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IEpiYhsMGlq2ReYke60gfIQZ2QzqWJpfRL9F+OcYAMY=;
        b=u09Rv+sS1q7nNJRo4xpusWl5j3euzo5rVzJuXiPOw7Uv1k+/uAejCPVjk4TKkkn/p/
         UYWYPxV8xYKJ0W3NqQcU2YG/H6YtHz9Rp+jiplG/Wn1ui+UZWqJVzgiif9+na+XqB0wi
         5aHir9ClVGTTiy6CtQ4AgYzvztBzHyJ5rO2Aeo90vM2mUt1a5+DlyGZ4cLFu41XZLV6Q
         1IJAbv/es27p+hGGgxuc3Otx5HyVdLwU58pUBZwSP/aLmn5QEa2TGJeNUeOVKA/jJlqT
         RneOt5BBxf5HBHh6zL2tFJLzUBv+tSEEAFc8dNerrtcoTBv+MpWPNbJgCFb5GpbJpmgE
         Q/1g==
X-Gm-Message-State: AOAM531stLjz5ic+6uBRJj84sEXr5d1OMVuKcn3cg0+ryZnveSunYYC0
	qeqsfxLsrtsC//KcVBb8IHHFUihIbwbXj/b9kya/gZa+MWoydYzEmBDnjqCBqi3jT7vB464Lw7z
	aOIknYEQ3O3lyfw==
X-Received: by 2002:a5d:47ac:0:b0:1fc:f09b:c258 with SMTP id 12-20020a5d47ac000000b001fcf09bc258mr20957690wrb.618.1647350622431;
        Tue, 15 Mar 2022 06:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhcNjWTrbaoqdRbx7Oloh29YUHJlQt1KnYFPeCC8VNb6iBtIWGW90Cdk830Tz31dWtDzSVEw==
X-Received: by 2002:a5d:47ac:0:b0:1fc:f09b:c258 with SMTP id 12-20020a5d47ac000000b001fcf09bc258mr20957671wrb.618.1647350622165;
        Tue, 15 Mar 2022 06:23:42 -0700 (PDT)
Received: from redhat.com ([2.53.2.35])
        by smtp.gmail.com with ESMTPSA id b15-20020adfc74f000000b001e888b871a0sm16230818wrh.87.2022.03.15.06.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 06:23:41 -0700 (PDT)
Date: Tue, 15 Mar 2022 09:23:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: trix@redhat.com
Cc: jasowang@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	lingshan.zhu@intel.com, sgarzare@redhat.com,
	xieyongji@bytedance.com, virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] vDPA/ifcvf: match pointer check to use
Message-ID: <20220315092101-mutt-send-email-mst@kernel.org>
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


Oh, absolutely. In fact vf->vring->cb.callback is just
vf->vring[0].cb.callback so it's wrong for any ring except 0. Does not
make sense.

So how did it work in testing then? No idea.
Zhu Lingshan, care to comment?


> -- 
> 2.26.3

