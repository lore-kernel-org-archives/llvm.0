Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED4223B5
	for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647357358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kyz2RUFrfzcWwytFdN8JKP5rzgj6KOwPxkBy/7oRIpU=;
	b=Cy3r530evXgrG340mX7jJxJ5swqRPFdF0k8tvOlQVj/Ik7ZAOS6tL1kL3+uwZUUIvpTAzZ
	guc0+v+Zx5ezZotq2S56/7iMpkndyOL+zxEKvX+Gagmgwd3+jn9QDSqt4HH3PNMFxx67ds
	re3iEz8FjOOo4IILh7RC2LQeyxGMypA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-108-Y0sz3A16NJC_MKjkQqosBg-1; Tue, 15 Mar 2022 11:15:57 -0400
X-MC-Unique: Y0sz3A16NJC_MKjkQqosBg-1
Received: by mail-wr1-f69.google.com with SMTP id q14-20020adfea0e000000b002036c16c6daso5384469wrm.8
        for <llvm@lists.linux.dev>; Tue, 15 Mar 2022 08:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kyz2RUFrfzcWwytFdN8JKP5rzgj6KOwPxkBy/7oRIpU=;
        b=BbJDCTg9vcpHjKoxPuq98fOavhlkAuhs5kY5gZsSs5eu5y4ZxwxYTKqu3+8JyA4ZAA
         PwsWS7dQoKnrEivNIzFkpFeXYFCW6wTGEwkPSLBh9GhACbTW3D7iWcc4gHp/Zgt9VUoF
         dcwhubjlqzXy/wW5+2xo3HV4DIMMnJvkpUd6cXHWGUvbZzTkBLEIz7VQV5RJKmYX1RM6
         vweoM0gCI7iNjQaJaR43Gq13iuToACfdYEOjT+P2SE5nDy7BwzOEUE4tg0S1LSWFnkuq
         cib5qva6rTYvxuCw77We9FxbhdxNFhnvJAhsi+Kyi8/CjswPQ9xj4g5JG6mu+0f2bxoY
         VgeA==
X-Gm-Message-State: AOAM532Y9FcRg/4PAJkbejG+WFTE4ILF4lozTKKmkPuNYmuoNN80NHx7
	kHHSHqYFWq0h+/M1FLEbDWNATfUFCLGLs5HOHaFov9kVMtNMu4igk5oWl4SXIkDjQk58G8BMBPm
	Jbgo3vxZBrkPqFw==
X-Received: by 2002:a05:6000:3c3:b0:203:6976:6942 with SMTP id b3-20020a05600003c300b0020369766942mr20348018wrg.584.1647357355933;
        Tue, 15 Mar 2022 08:15:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypmXByJXceCvTyDTeaeG4rtFjn8ylgA1heE6UhT+IFbX4r7V634CRa98A5VvIu9kER2FggTQ==
X-Received: by 2002:a05:6000:3c3:b0:203:6976:6942 with SMTP id b3-20020a05600003c300b0020369766942mr20347991wrg.584.1647357355683;
        Tue, 15 Mar 2022 08:15:55 -0700 (PDT)
Received: from redhat.com ([2.53.2.35])
        by smtp.gmail.com with ESMTPSA id ay24-20020a05600c1e1800b00389a420e1ecsm2498962wmb.37.2022.03.15.08.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 08:15:55 -0700 (PDT)
Date: Tue, 15 Mar 2022 11:15:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Tom Rix <trix@redhat.com>
Cc: jasowang@redhat.com, nathan@kernel.org, ndesaulniers@google.com,
	lingshan.zhu@intel.com, sgarzare@redhat.com,
	xieyongji@bytedance.com, virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] vDPA/ifcvf: match pointer check to use
Message-ID: <20220315111456-mutt-send-email-mst@kernel.org>
References: <20220315124130.1710030-1-trix@redhat.com>
 <20220315092656-mutt-send-email-mst@kernel.org>
 <512a392d-23d7-c25b-7576-571001f28288@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <512a392d-23d7-c25b-7576-571001f28288@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 15, 2022 at 08:03:26AM -0700, Tom Rix wrote:
> 
> On 3/15/22 6:28 AM, Michael S. Tsirkin wrote:
> > On Tue, Mar 15, 2022 at 05:41:30AM -0700, trix@redhat.com wrote:
> > > From: Tom Rix <trix@redhat.com>
> > > 
> > > Clang static analysis reports this issue
> > > ifcvf_main.c:49:4: warning: Called function
> > >    pointer is null (null dereference)
> > >    vf->vring->cb.callback(vring->cb.private);
> > >    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 
> > > The check
> > >    vring = &vf->vring[i];
> > >    if (vring->cb.callback)
> > > 
> > > Does not match the use.  Change dereference so they match.
> > > 
> > > Fixes: 79333575b8bd ("vDPA/ifcvf: implement shared IRQ feature")
> > Thanks a lot! I squashed this into the offending patch - no point in
> > breaking bisect. Pushed to linux. However I'm now
> > having second thoughts about applying that patchset - I'd like
> > soma analysis explaining how this got through testing.
> 
> static analysis is something i do treewide.
> 
> There are currently ~2500 issues in linux-next, do not panic! many are false
> positives.
> 
> It is pretty easy to setup and once you have a baseline you can filter only
> your files.
> 
> Tom

Thanks for that info! I was actually directing this question to the
contributor since the code does not look like it could have ever
worked. I don't have the hardware in question myself.


> > > Signed-off-by: Tom Rix <trix@redhat.com>
> > > ---
> > >   drivers/vdpa/ifcvf/ifcvf_main.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
> > > index 3b48e717e89f7..4366320fb68d3 100644
> > > --- a/drivers/vdpa/ifcvf/ifcvf_main.c
> > > +++ b/drivers/vdpa/ifcvf/ifcvf_main.c
> > > @@ -46,7 +46,7 @@ static irqreturn_t ifcvf_vqs_reused_intr_handler(int irq, void *arg)
> > >   	for (i = 0; i < vf->nr_vring; i++) {
> > >   		vring = &vf->vring[i];
> > >   		if (vring->cb.callback)
> > > -			vf->vring->cb.callback(vring->cb.private);
> > > +			vring->cb.callback(vring->cb.private);
> > >   	}
> > >   	return IRQ_HANDLED;
> > > -- 
> > > 2.26.3

