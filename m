Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43942FABFF
	for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 14:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132929; cv=none; b=C0SjoG11aO8qoO7pN3pCFN22TUuxU5UF9OyFbWCia/mZKrMKK3/1LD60DuTgHcuGGuQdLNi02kHka2wNZHFgo8s55TXURm+3IrI4UA57CmHZSAF9RTq3UugRhcz6QSmEmZPQcVx7f1VTOVyMXEFExjGRp4UCbUkUW5Gcwnyh2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132929; c=relaxed/simple;
	bh=dY2BC24LcOwPmwCFWjqjdFx0LB0w2liGu7oqHI05kJA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g/M8K9Rj5bMkKS8Uwjn7H+k+TJofofDri5TSuPL1uHYZt5ZrNz4x6nTebCEmG0uIIGyWqJIPgreBWKgixQU/S8XYmslr9cr8g5MlUS7AE+dnj9LsWZXeK94VZXUX8/YAZmvxQK+LDbgnVuy+PInytLYlBh76FAlRTf7dZxqv7l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J2cDLoLp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J2cDLoLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756132926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLqi3ZQ4Qq7GjJJBZEDnBdmpcriLiuWuU+N614GqayQ=;
	b=J2cDLoLpvo+3cRuatp2t7kJ5cD4gSNGJOuRVHaoK/gkH/K95winTR3hbLZvdkbC9Zb58zl
	8wOvp5kuaWWMd+76n6Z1EauI3M1BcoWn14u133xeeeDjfamXfOBHR6z3fRs7q+Yy0FJJ5M
	kL2Gu8rY9o5m0o1qo4bi0xzWPg6kEZk=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-3rWmltCIOnaqFt_ZwJhbJA-1; Mon, 25 Aug 2025 10:42:00 -0400
X-MC-Unique: 3rWmltCIOnaqFt_ZwJhbJA-1
X-Mimecast-MFC-AGG-ID: 3rWmltCIOnaqFt_ZwJhbJA_1756132920
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ed9124f2c5so1008535ab.2
        for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 07:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132920; x=1756737720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLqi3ZQ4Qq7GjJJBZEDnBdmpcriLiuWuU+N614GqayQ=;
        b=NC2QXcaAKphwTwwJ7pRDsRLMQcgZJozF1WkmAzXObBqcJvLqJPEUtPM37+l6u1ijA3
         +m7V2RGe6FcVzk6f7RFhXKmnj79in6IBNL+qnUCoHCF62xdC2APQD+pcajCdS/JhPed9
         97Z1fmWuku9Y0TCKrQUrU5ND6f+evAcgW7ulOhxLl2pIn9jlkaYgYqYxG2dYdi2I855t
         jTdkedEYcOixmqZ5kJ43wVcX0hBGPPJ32+Em77AjwUncCQyd+I8k2JSvNRlxLwIEadOF
         R3Cjp49aTZ30m2gAfQZ/gcLK/CTwDYp8fgGt3ULZlMLTsRNYsBJ+QC+xq4OG9OjfhzjW
         RQFw==
X-Forwarded-Encrypted: i=1; AJvYcCVz+Lj/cm7wf/O5m0F+RCPxayQ7/YyzaxAyC7cnrrBwBdKuw3E5E97ru163UWJWFb+rHHMi@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ8he+AgiVQHTNjHq6iCrnKom6fzTvTv6J+IWaihY06/qpH66l
	HNOZa3eEziCvnOlvx5XcHDizcetuMh1bE2xnGGMy3t0jR+Ki3AuMCDSqjg5qhQUKytM/XJ0zVBB
	0IFP6KzlpOfhJRtFhVOjjHtxOLa/m8zLNB3GQMhxH2UvR/+T06G9x8T0=
X-Gm-Gg: ASbGncvB/3MTMJ9NrZ6KO5DMAOBL8hr/pj2ntB4Ew2EfABK19sNCgr5SLLNUn+NAZr9
	hmbxJa2rH/XTdeZLpPUWOGl5db8bwHftEN592UhI+Vx2EkbHZyG3j3eVuU/LbfbJ4ZCTQCJo1BM
	GkRyy1cxHPjRRcDOS99pmC7BFK2ftAtejJuOZvNmptjgjgWShhYfs8mvW9JdQXG6RP7MwZn0rFH
	K4SfedcDr4eLd6tXvyAI8YmhiqupF7O9CcHXk9cuJ9D3LzgB7ztLhDUJ8PyyKKUxYb9Q/r7qpKq
	zbi6g0SocDalL2GO6H1jiBizs/Lr6biGJkyPGsdV1/g=
X-Received: by 2002:a05:6e02:1567:b0:3ec:9c32:6471 with SMTP id e9e14a558f8ab-3ec9c32673bmr18816515ab.2.1756132919652;
        Mon, 25 Aug 2025 07:41:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGW4Lgvz6FbySIAPwtm0U1Tae7UuaIE2esfeq7WZJykcdIyv6UETbtw/iCgysaF9obPTYn/Gg==
X-Received: by 2002:a05:6e02:1567:b0:3ec:9c32:6471 with SMTP id e9e14a558f8ab-3ec9c32673bmr18816275ab.2.1756132919255;
        Mon, 25 Aug 2025 07:41:59 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ec67d6ffdasm22921535ab.25.2025.08.25.07.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:41:58 -0700 (PDT)
Date: Mon, 25 Aug 2025 08:41:55 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Nipun Gupta <nipun.gupta@amd.com>
Cc: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <nikhil.agarwal@amd.com>,
 <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <llvm@lists.linux.dev>, <oe-kbuild-all@lists.linux.dev>,
 <robin.murphy@arm.com>, <krzk@kernel.org>, <tglx@linutronix.de>,
 <maz@kernel.org>, <linux@weissschuh.net>, <chenqiuji666@gmail.com>,
 <peterz@infradead.org>, <robh@kernel.org>, <abhijit.gangurde@amd.com>,
 <nathan@kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] vfio/cdx: update driver to build without
 CONFIG_GENERIC_MSI_IRQ
Message-ID: <20250825084155.10088e2a.alex.williamson@redhat.com>
In-Reply-To: <20250825043122.2126859-2-nipun.gupta@amd.com>
References: <20250825043122.2126859-1-nipun.gupta@amd.com>
	<20250825043122.2126859-2-nipun.gupta@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vsigts4ZD27ZYbRIrIV0D-rilNY_dchunvFg5-v6YOE_1756132920
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 25 Aug 2025 10:01:22 +0530
Nipun Gupta <nipun.gupta@amd.com> wrote:

> Define dummy MSI related APIs in VFIO CDX driver to build the
> driver without enabling CONFIG_GENERIC_MSI_IRQ flag.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508070308.opy5dIFX-lkp@intel.com/
> Reviewed-by: Nikhil Agarwal <nikhil.agarwal@amd.com>
> Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
> ---
> 
> Changes v1->v2:
> - fix linking intr.c file in Makefile
> Changes v2->v3:
> - return error from vfio_cdx_set_irqs_ioctl() when CONFIG_GENERIC_MSI_IRQ
>   is disabled
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
> index dc56729b3114..5343eb61bec4 100644
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
> +	return -ENODEV;

With the fix to patch 1/, the device info ioctl should be returning
that there are no irqs available, so this should use the same errno as
any other case of the user trying to set an out-of-bounds irq, -EINVAL.

With that change

Reviewed-by: Alex Williamson <alex.williamson@redhat.com>

> +}
> +
> +static void vfio_cdx_irqs_cleanup(struct vfio_cdx_device *vdev)
> +{
> +}
> +#endif
>  
>  #endif /* VFIO_CDX_PRIVATE_H */

