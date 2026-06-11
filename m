Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C9B37B02E
	for <llvm@lists.linux.dev>; Thu, 11 Jun 2026 06:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781160857; cv=none; b=q7Bj6PFKpgydbarKud64grXUCvNb2tvVZ1VWtJutPbgf3rcY6+JEM5Tg+qu2updhiPq7E0CZsTnlZa6HngpKu6KIMY/+519/bSaYTAGLc1IVuu4Zqw9eTLd1RQvCL8EdPsR9KBn+3Hje3hnl40X7xXGbGHeRnjdO91Fo/SX4xJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781160857; c=relaxed/simple;
	bh=BzoDKri2AnQ0Gzc0Q9uN7BE4vlA65vCGXfLvgcKu5xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=cPrURZss0YpPNMHOB5LRXcQ2hlJ60bYEiak0rTtHATArSB3OYYRng0A5sigZi9mBLEu62mk9kGW/m8GZ+sXOUUGmxCsrP+z8kgWo/7c5kc3E2tc26O/SHg5F+mMUfEkf4YfEDpngmU3xYuDkn1bjTzBcvMzQalvfbknmebZ/sRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XDnp94WL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XDnp94WL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781160851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SyfejcTOJzGfkGjW2j6iDmBXVI3fZpPrk4NxQ/CTQBQ=;
	b=XDnp94WLhgiz9zgC07XOiHVsFI1DH+16Rmm6dzhZLrN24/569RXR+gToKSNdYNSY4UBDZE
	sNqUw4TXNLzlESaky9axHz1lWiM4K+nxh+MmzeGzhIl6PfMmomBqSOAMg17KTx30LxecW6
	XCgHEVbh5clQC6Zh5yTODDXJhYVoI8w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-9dqnVJstMPKSQihUTs71TA-1; Thu, 11 Jun 2026 02:54:06 -0400
X-MC-Unique: 9dqnVJstMPKSQihUTs71TA-1
X-Mimecast-MFC-AGG-ID: 9dqnVJstMPKSQihUTs71TA_1781160845
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-490e17fff23so6079275e9.3
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 23:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781160845; x=1781765645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SyfejcTOJzGfkGjW2j6iDmBXVI3fZpPrk4NxQ/CTQBQ=;
        b=GVHXtGO05ACHegDOZRRvAraziR5OC472sj0Cx47wov5UVRu/1WvAOgNoBZKVYqfUdO
         Trqz71OGc1K+n6hlTaa0s09dsK47NV+8aJhLXQEW/dJZA5m6cJJXqS65Zn0jGvK/mxl3
         FWlvwtCpuHNpx5H9JUI0xEyDRTW/JFpUgVex+x6o+TfAQSzg9tYnodqRRaQFFEOsm8Mm
         XkB+Alc7JxDvTMAvNz5AbNU67co+ifkUw1F6ijrHrKwm11MZGAmDXxXQC2Doq0zRpO+u
         /So7vg2Pwgbe3+rjk8I+Sbg7ZNVRJq/Ly3qtr6I/8ijHb4kjqt8A0EcHzusHX8x23cGX
         iLNg==
X-Forwarded-Encrypted: i=1; AFNElJ8nejfy/PMwBU1fRN4mtdMaJiRHU76YcOQWrZ66okYUSEvUC6CzoT/QKfT5THGuCc7rytF/@lists.linux.dev
X-Gm-Message-State: AOJu0YwMgAu5sT6L/xgpPfoKRYZA3nOc5eaj241Y0pUj4JBP+SvGcpVx
	cbVJhUz6pjARlX5JuCvLVYrdN/ECpowyHWMC8i3Hq7UD8NHP4Wvlud6WlVeOogn6cCzb6rPZ4Py
	hPERaBXtO3q1GUspdpK8uGxv4kafqnAlM0IJU/HTbvnZEkVaFQl+GHQI=
X-Gm-Gg: Acq92OE3pFwmX8pZjXeKLqomIvEEQculjpt7DsXjlMaXW3RoQTCJGZ/GFd26rEePnuu
	iex0dvgGnG5G53cdECT1e83EHZsghOYtRxyLj8Fx5QAYHVL6xxmKQ37W76wpECgxWPe5N2eUgSY
	7jhaNKjzlDwHg/SwkebzX5w3PZycA77sNJ+VUQ/zTIOnqCz9Reh8x7QYdwHFOkhcMKllwA8SPC6
	Uu6p0B6/SBZaRvcBVeaA/4ZHjxRqf62tAZ/qYPOLhKWPQ6AVJrpfjhuLNb97dcWwKBgqk6mG0PH
	nd6YyoCYoXV/f3EMyRcLV5E6ag5Eji/ux9jsRfK6PLdlb17E2NhkzAOOI8G68WrEFxEM5PjzJOs
	5rGMLeoXHArM9MiMB21RAdVHmxmExQTZhHK9pleEpqAr+tTzF49m/AQ==
X-Received: by 2002:a05:600c:c04b:10b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-490e561e473mr9784585e9.35.1781160845358;
        Wed, 10 Jun 2026 23:54:05 -0700 (PDT)
X-Received: by 2002:a05:600c:c04b:10b0:490:c2a3:3302 with SMTP id 5b1f17b1804b1-490e561e473mr9784225e9.35.1781160844845;
        Wed, 10 Jun 2026 23:54:04 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm67202077f8f.32.2026.06.10.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 23:54:04 -0700 (PDT)
Date: Thu, 11 Jun 2026 02:54:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] vduse: Fix error around jumping over a __cleanup()
 variable
Message-ID: <20260611025332-mutt-send-email-mst@kernel.org>
References: <20260610-vduse_vq_kick-fix-guard-usage-v1-1-0ce02c08006e@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260610-vduse_vq_kick-fix-guard-usage-v1-1-0ce02c08006e@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IR4UYUUkeT4OConU8CssoFBAQUjJUJzqEj6PjBmX1xg_1781160845
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 10, 2026 at 12:16:49PM -0700, Nathan Chancellor wrote:
> When building with clang, there is an error in vduse_vq_kick() from
> attempting to jump over a variable declared with the cleanup attribute
> using goto:
> 
>   drivers/vdpa/vdpa_user/vduse_dev.c:566:3: error: cannot jump from this goto statement to its label
>     566 |                 goto unlock;
>         |                 ^
>   drivers/vdpa/vdpa_user/vduse_dev.c:568:2: note: jump bypasses initialization of variable with __attribute__((cleanup))
>     568 |         guard(rwsem_read)(&vq->dev->rwsem);
>         |         ^
> 
> Jumping over a variable declared with the cleanup attribute does not
> prevent the cleanup function from running, it would just result in the
> variable being passed uninitialized to the cleanup function .clang
> errors instead of generating the invalid code, unlike GCC.
> 
> The jump is only present to call spin_unlock(), so convert the
> spin_lock() and spin_unlock() calls to an equivalent guard() to avoid
> the jump while leaving runtime behavior unchanged, clearing up the
> warning.
> 
> Fixes: 6c141c034c1b ("vduse: Add suspend")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Eugenio?

> ---
>  drivers/vdpa/vdpa_user/vduse_dev.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/vdpa/vdpa_user/vduse_dev.c b/drivers/vdpa/vdpa_user/vduse_dev.c
> index a257fdcb77b7..0500da043761 100644
> --- a/drivers/vdpa/vdpa_user/vduse_dev.c
> +++ b/drivers/vdpa/vdpa_user/vduse_dev.c
> @@ -561,9 +561,9 @@ static int vduse_vdpa_set_vq_address(struct vdpa_device *vdpa, u16 idx,
>  
>  static void vduse_vq_kick(struct vduse_virtqueue *vq)
>  {
> -	spin_lock(&vq->kick_lock);
> +	guard(spinlock)(&vq->kick_lock);
>  	if (!vq->ready)
> -		goto unlock;
> +		return;
>  
>  	guard(rwsem_read)(&vq->dev->rwsem);
>  	if (vq->dev->suspended)
> @@ -573,8 +573,6 @@ static void vduse_vq_kick(struct vduse_virtqueue *vq)
>  		eventfd_signal(vq->kickfd);
>  	else
>  		vq->kicked = true;
> -unlock:
> -	spin_unlock(&vq->kick_lock);
>  }
>  
>  static void vduse_vq_kick_work(struct work_struct *work)
> 
> ---
> base-commit: 6c141c034c1b0b74a2ca4dd3d6fbb6d9054f6e46
> change-id: 20260610-vduse_vq_kick-fix-guard-usage-d1037c331419
> 
> Best regards,
> --  
> Cheers,
> Nathan

