Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1731393DE6
	for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 20:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755809998; cv=none; b=eiez4nuz0cgka9O53WVmrDVXUs+rOU+lqB1rBTUh121/mUuBYOdLbtXhc7NZT+6ulbTVdtQtH6kWBSpbQ0QFUf9TyQ/O2SrGL0idPlw2DKMmz0IA1UoiraTbuurUkL1OS8B8zrc/OufzhLsDNTp8tLymH2BaH+N81Bvm/CR4N5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755809998; c=relaxed/simple;
	bh=iZGYE1Xd6jy1p5PRZ84O4xkm6GrvOQTQufb1eQO5abw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ei3OiG4ljY5tA0mcms70Yw5nUzsTc+slTnuWng5/MOHQ5tHXKHMVDLkbfQkRL+3bmunQ6B2AQHKPIWLqSHQr6NbuQXRsMkeR90F1dkyXfG9N1IMaLo2H5q5Kl+3OO6fdKWJcwFYvfqj7LFUg1ACGA6EDQfIvkF/ODLni/OOn0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P1KeL0pO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P1KeL0pO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755809995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4G04SOJ0glNxufycnOsZm8GbV4T3e/3GwhGPhyQ8IQ8=;
	b=P1KeL0pOcNlfoIpiEL+/Bs+7fJKCR7NuBBJzuI/D8gk+tkGNL7KqOPdMKy/8Tb5KcMOz9b
	+VWGnE2/gRLdw7db3wZai0fXpfH4fSWx3YghS+8EaGB6kiPsNC189/U1LWXChEv/HdrHtM
	VIg25ixKfYeOR9t4Iv01ilikV6XXb8k=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-btkNoBHgO62UzUQQdvBZWw-1; Thu, 21 Aug 2025 16:59:54 -0400
X-MC-Unique: btkNoBHgO62UzUQQdvBZWw-1
X-Mimecast-MFC-AGG-ID: btkNoBHgO62UzUQQdvBZWw_1755809994
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-88432d9d5d1so11833239f.1
        for <llvm@lists.linux.dev>; Thu, 21 Aug 2025 13:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755809994; x=1756414794;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4G04SOJ0glNxufycnOsZm8GbV4T3e/3GwhGPhyQ8IQ8=;
        b=DzLFWRVaYG5qWIhP3+DXoWDjCc+xKweBjcXfnEp7jXc/iFNiLwDephRPiOaU8NBgE/
         /GbMcuhZCh7Js+EaSDtZigK5eQ9eHyj7rGj6ASHQhZQUsa0cOjPEI6Kt3YhP8ziKUI84
         4QJ7c9mAFMEoc7FvpXSN25hfKCsUaoKUTYb9lPLqTc1uDbK4/Mo9taKrjPg0xo0rrqsH
         /QCjT2QgA1jq+9DP73GlzagCrQb4ESPswY5jl/weN0An10llajbmoQF2dzvbIYS02Sht
         XL0F8qySTM4ZMX1rJrWCrJtA0EOQANrxiCLVVFsPb7t1HTtPKF/sBN0sYGk0Voh8VAG/
         6pjw==
X-Forwarded-Encrypted: i=1; AJvYcCXwxX9deHdgDTuMcMAvWth7SG8O5qSZAzs7KlPGs/XOAM89Hc6/oDG3bg4COPukn4rBffjP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5RE0u44OIj7+l5bR07hWFq99XysCkU5nWCdusW9+njOVz8akt
	qChKjX1mGnum27ShXFy3C2mvGEt0DMwjHYqpD00mSqAC0P2f73zp8KXvfqOPOl5PyDL7jYMD79t
	hhxNS9fJvEBkhDJ46qB0m7QTnV0y5FL/cgLEy9I44AWn2Foj7QrF0Szo=
X-Gm-Gg: ASbGncvYUU4XJmK3ww/VYs0bqq7oQInh40O/ZOIiOJI/3CQTJIvLLBAERScaT4vCB17
	mWLOiACLo33qGYWTOAcSXRkOt60WvbjJ/jeboB+/gAq/f2iOt0ieLL06mn66BvZnLNpyCj0tzfV
	KFZQ2dhBToUpkii9qi0Zrt97VQLorUfPBqupKVxS9AUYdjKzxLV5VrdoavX/vxLIsJmQw0t+vW+
	cGHh777F5be7nRoGfIL7YY3VW4Jq5Y2qHKunoPyV3K6R51Jte7Gmhjg7wP/xgfKO4EI2qMKqNbd
	Qfd4C39Ylao0ywPtwPk25TVav0P4pTdK/rxbr/a0ahE=
X-Received: by 2002:a05:6602:2cc9:b0:881:659f:cd6c with SMTP id ca18e2360f4ac-886bd101642mr35933339f.1.1755809993779;
        Thu, 21 Aug 2025 13:59:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWsV1EzHTqmOI9QMn9r4+1m0MFqBhgNbF+N2ic8JnDHSvJKjdfICIF99AEr9+2AABgW89gRQ==
X-Received: by 2002:a05:6602:2cc9:b0:881:659f:cd6c with SMTP id ca18e2360f4ac-886bd101642mr35932439f.1.1755809993389;
        Thu, 21 Aug 2025 13:59:53 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-884702457d5sm273437639f.17.2025.08.21.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 13:59:51 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:59:49 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <nikhil.agarwal@amd.com>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>,
 <oe-kbuild-all@lists.linux.dev>, <robin.murphy@arm.com>, <krzk@kernel.org>,
 <tglx@linutronix.de>, <maz@kernel.org>, <linux@weissschuh.net>,
 <chenqiuji666@gmail.com>, <peterz@infradead.org>, <robh@kernel.org>,
 <abhijit.gangurde@amd.com>, <nathan@kernel.org>, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH v2 2/2] vfio/cdx: update driver to build without
 CONFIG_GENERIC_MSI_IRQ
Message-ID: <20250821145949.7fa51308.alex.williamson@redhat.com>
In-Reply-To: <20250821071308.1572106-2-nipun.gupta@amd.com>
References: <20250821071308.1572106-1-nipun.gupta@amd.com>
	<20250821071308.1572106-2-nipun.gupta@amd.com>
Organization: Red Hat
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: c3FO-EY_tRuwsElXuxTXlBoHXhb8lnwkR8RJCFs0hhs_1755809994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Aug 2025 12:43:08 +0530
Nipun Gupta <nipun.gupta@amd.com> wrote:

> Define dummy MSI related APIs in VFIO CDX driver to build the
> driver without enabling CONFIG_GENERIC_MSI_IRQ flag.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508070308.opy5dIFX-lkp@intel.com/
> Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> Changes v1->v2:
> - fix linking intr.c file in Makefile
> 
>  drivers/vfio/cdx/Makefile  |  6 +++++-
>  drivers/vfio/cdx/private.h | 14 ++++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vfio/cdx/Makefile b/drivers/vfio/cdx/Makefile
> index df92b320122a..dadbef2419ea 100644
> --- a/drivers/vfio/cdx/Makefile
> +++ b/drivers/vfio/cdx/Makefile
> @@ -5,4 +5,8 @@
>  
>  obj-$(CONFIG_VFIO_CDX) += vfio-cdx.o
>  
> -vfio-cdx-objs := main.o intr.o
> +vfio-cdx-objs := main.o
> +
> +ifdef CONFIG_GENERIC_MSI_IRQ
> +vfio-cdx-objs += intr.o
> +endif
> diff --git a/drivers/vfio/cdx/private.h b/drivers/vfio/cdx/private.h
> index dc56729b3114..0482a1516439 100644
> --- a/drivers/vfio/cdx/private.h
> +++ b/drivers/vfio/cdx/private.h
> @@ -38,11 +38,25 @@ struct vfio_cdx_device {
>  	u8			config_msi;
>  };
>  
> +#ifdef CONFIG_GENERIC_MSI_IRQ
>  int vfio_cdx_set_irqs_ioctl(struct vfio_cdx_device *vdev,
>  			    u32 flags, unsigned int index,
>  			    unsigned int start, unsigned int count,
>  			    void *data);
>  
>  void vfio_cdx_irqs_cleanup(struct vfio_cdx_device *vdev);
> +#else
> +static int vfio_cdx_set_irqs_ioctl(struct vfio_cdx_device *vdev,
> +				   u32 flags, unsigned int index,
> +				   unsigned int start, unsigned int count,
> +				   void *data)
> +{
> +	return 0;
> +}
> +
> +static void vfio_cdx_irqs_cleanup(struct vfio_cdx_device *vdev)
> +{
> +}
> +#endif
>  
>  #endif /* VFIO_CDX_PRIVATE_H */

Why are we returning success if we don't implement the function?  This
provides the wrong return value to the user.

Also, aren't we also missing in patch 1/ that cdx_dev->num_msi is
initialized and therefore vfio_cdx_ioctl_get_info() might return that
an interrupt is supported when it is not?  Thanks,

Alex

