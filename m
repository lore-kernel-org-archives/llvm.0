Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D085B1F940F
	for <llvm@lists.linux.dev>; Wed,  8 Jan 2025 12:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736337764; cv=none; b=qwQ6KdFJCBWS/N18S/vx3rh/sYSgI2O/H79YRp+hgcRws4sA7GBXCMjwxm9SK/vzIlhTxjmdJ4aEFPiwDRB8w2Z7yp91tdrMRiz6VNA2bYEoCniW2SF8xeoabm/9q1ZQvKKUCjhnrO6xZv7PfaegooV+7EWk7PDhBkjOCKqg1KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736337764; c=relaxed/simple;
	bh=IRcFUEnTe1JCKcKtnWX/qLTSGUTw9/fWw8tLCIvzbDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bFL7VMzTnTpt9wbCdZKdxOp9aptSBsZH6pvCKSYePvwMAw5lJgRVDLvh9o9PUNKASJm2i6P8XyVnmlmnUJaCQG6HiLztBvwk5KeCyG9KT1KM9c1HRdc4MEetfvDvv6kQ8+PL9SQO38ntuhsvlz8u12+kr9WMXGODbHSLTBlEedI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Zs9ANkA0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Zs9ANkA0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736337761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YLqYtIizfpzeEDN0YbG2hxxynEcPRAfxOqYGH5kCnXM=;
	b=Zs9ANkA0uoPaonAqvEpEYGS/WQ9BIE2EP9Gz95n2WhS6IohaV+EggmrhNnKFB5kG1AxmbQ
	x57iDnj+jR3mJk2tasQfWiW0glzxM9FyyfmlRAVKAE0IQwuedwUvWCNIS7ZudWByWobYgm
	VfKmNzkaaXrr4+V83O5PijYE6EE+/0c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-AhnQblrJOmOWqFnuy1kUAw-1; Wed, 08 Jan 2025 07:02:40 -0500
X-MC-Unique: AhnQblrJOmOWqFnuy1kUAw-1
X-Mimecast-MFC-AGG-ID: AhnQblrJOmOWqFnuy1kUAw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-436723db6c4so96226225e9.3
        for <llvm@lists.linux.dev>; Wed, 08 Jan 2025 04:02:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736337759; x=1736942559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLqYtIizfpzeEDN0YbG2hxxynEcPRAfxOqYGH5kCnXM=;
        b=tlo8w6GFuyogtH30qRU/31+VLyiymBOX0w6vrU0rXnjQoFYtiavl0i2hpMW2DQ2RL6
         zVAoUHyBaQSZXqziIdC9TSN/3Wtn+/bD1Eh+XrHz47dUlCtKK9j6A07Yjse9nobji+lN
         weDGLjcb5SXdPtnezLZWGGC5yBjJxZfDC+U4DxSmIFN0kS/V2IAK2R6I8uGYgSlCBb+U
         8xKryHykOGdV47S7EyOv42ItQgagXvYaaPZge4AnxNRp6QWm5L6hToJc/zn4GCuKwcx4
         +SYVfwnuBoUCQH4wdXlD/0/a6avDSJ4Y3Z5B2w2ywXAgH8VxUlT9BJUEn4dXoMMOeHcH
         OE/w==
X-Forwarded-Encrypted: i=1; AJvYcCXDqIcWpetvHD2zb+JBuuorJeb2FrYbtXGCXmD00CSvIYdYxR06xLtcEG8ArKMzgKZNL0zb@lists.linux.dev
X-Gm-Message-State: AOJu0YyzdyNWkJr51AcSFnUp0mgD4rvdK3611EVzdon/V8jrRWVy5yRR
	pVhZdsI0bi5Prdr3nihsYFMjSkfHNwS3txi3kyNHwWoM30Io5lA28Tz/SU8qR94WZG9q2MR2miQ
	uj5ANPlDjfMZtOODBiOuddE/oSMh4KCFqijLAe1/oYar+Hn57EEs=
X-Gm-Gg: ASbGnct5OQGMlEa+Z6Ja3IVrLZtoDqgHXSWhk3/dKXGzRv4jQinMrFrs73Y4ZLuBPu1
	Umn8F56jujd8vfkkdjXsf9wWUTKRK/l91/7INGAyUr3p4Crae2eiMJ+HcB3GFDFNFqOdi6jo7Rs
	PsOmroMrPfFwtI3CddNeQVGmfsyLkXm0jBuQYY7rNz62vPY/zWsSw9i2qJ0zaSt7Ai5GDtbiKz7
	UE5bOTp/sA1K7kJ0xv+nNKCOIz5Iasy21kY/Ves1RwfR5Kcd0M=
X-Received: by 2002:a05:600c:46ce:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-436e27072a7mr17628585e9.23.1736337759390;
        Wed, 08 Jan 2025 04:02:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGScykllzbh31utZyOyhyPCeqeJOHfUUx2k3Z8hq3BxWlAiscDN3qnY2p23jYlKYf6YnAI+gQ==
X-Received: by 2002:a05:600c:46ce:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-436e27072a7mr17628305e9.23.1736337758928;
        Wed, 08 Jan 2025 04:02:38 -0800 (PST)
Received: from redhat.com ([2a02:14f:175:d62d:93ef:d7e2:e7da:ed72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2ddcf38sm18472675e9.20.2025.01.08.04.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:02:38 -0800 (PST)
Date: Wed, 8 Jan 2025 07:02:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Yuxue Liu yuxue.liu@jaguarmicro.com" <yuxue.liu@jaguarmicro.com>
Cc: jasowang@redhat.com, lkp@intel.com, angus.chen@jaguarmicro.com,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
	xuanzhuo@linux.alibaba.com, oe-kbuild-all@lists.linux.dev,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] vdpa/vp_vdpa: implement kick_vq_with_data callback
Message-ID: <20250108070206-mutt-send-email-mst@kernel.org>
References: <CACGkMEvf9TS6c9PTiwWn3POr33m7m1shNfHOkviZpk-Pkbf79Q@mail.gmail.com>
 <20241203023743.1757-1-yuxue.liu@jaguarmicro.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241203023743.1757-1-yuxue.liu@jaguarmicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _3_DmRSobqUsLUFnz60lkG98Fbj-GW135jzIRdVNlII_1736337759
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2024 at 10:37:43AM +0800, Yuxue Liu yuxue.liu@jaguarmicro.com wrote:
> From: Yuxue Liu <yuxue.liu@jaguarmicro.com>
> 
> Implement the kick_vq_with_data vDPA callback.
> On kick, we pass the next available data to the hardware by writing it in
> the kick offset.
> 
> Signed-off-by: Yuxue Liu <yuxue.liu@jaguarmicro.com>

Pls do not send v2 as reply to v1.
I am not sure all tools test the patch if you do.

> ---
> v2: fix build error for kernel test robot
> 
>  drivers/vdpa/virtio_pci/vp_vdpa.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/vdpa/virtio_pci/vp_vdpa.c b/drivers/vdpa/virtio_pci/vp_vdpa.c
> index 16380764275e..8787407f75b0 100644
> --- a/drivers/vdpa/virtio_pci/vp_vdpa.c
> +++ b/drivers/vdpa/virtio_pci/vp_vdpa.c
> @@ -367,6 +367,14 @@ static void vp_vdpa_kick_vq(struct vdpa_device *vdpa, u16 qid)
>  	vp_iowrite16(qid, vp_vdpa->vring[qid].notify);
>  }
>  
> +static void vp_vdpa_kick_vq_with_data(struct vdpa_device *vdpa, u32 data)
> +{
> +	struct vp_vdpa *vp_vdpa = vdpa_to_vp(vdpa);
> +	u16 qid = data & 0xFFFF;
> +
> +	vp_iowrite32(data, vp_vdpa->vring[qid].notify);
> +}
> +
>  static u32 vp_vdpa_get_generation(struct vdpa_device *vdpa)
>  {
>  	struct virtio_pci_modern_device *mdev = vdpa_to_mdev(vdpa);
> @@ -472,6 +480,7 @@ static const struct vdpa_config_ops vp_vdpa_ops = {
>  	.get_vq_size	= vp_vdpa_get_vq_size,
>  	.set_vq_address	= vp_vdpa_set_vq_address,
>  	.kick_vq	= vp_vdpa_kick_vq,
> +	.kick_vq_with_data      = vp_vdpa_kick_vq_with_data,
>  	.get_generation	= vp_vdpa_get_generation,
>  	.get_device_id	= vp_vdpa_get_device_id,
>  	.get_vendor_id	= vp_vdpa_get_vendor_id,
> -- 
> 2.34.1

