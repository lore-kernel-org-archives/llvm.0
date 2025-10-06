Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3A72D3759
	for <llvm@lists.linux.dev>; Mon,  6 Oct 2025 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759759067; cv=none; b=H0+xK9aR2PHPkSO2ZjeexcToJW//S9vAysViV3a/jferBzNobmaBt8gVNtP9doDRjp9R5BGuLkbWE/T6Tbjwyfwwv3FEVA1Zka1sjWBKDZHRwBleVQjkkIfPdlsx7xb9Aj1o25b5femCNL2gYI82gRG5ODUF8QDWQTy4bi9Lmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759759067; c=relaxed/simple;
	bh=aoHPu3E0mvHoalx0FWQM3EH+lnlTpy4HtT99+90hPDc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KFRk1WGeOSh9wdpgZ0g6ZQW0qDi84+WHsCZrMlkxZ4vnzd+LXqGCiyOZVDB3Nko8eXdQx/2Oi3pTjqgd4ir0PAN8i8KMHIaD1K9AzNznXcnvOK1irgnO8NIk9H/3mnugRk+eLgfaqP3HZd9jnjuWl98qW9olWKelQr3bKs1ZDhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xe94k6yo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xe94k6yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759759064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N38NCXKatF4Nc9lTi4kU9EIStYgT9YorHxjupIC+4LM=;
	b=Xe94k6yoBohVja/fm+Awb2foeGBYDIIapZ9QvawSy8Jx8YGdKmSM4QQKk4iibJCZiSe54Q
	gBlnaXphDubGHU3nUg7iw51qGnQ3MDHEtfKCvdWEIQFtiUMWDyxXJRjj68Cpa4qQysKa4f
	mQd6S9D9nkSsyuvweLQ/jDZNO+vsB8w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-253--WCvi3fxOsqEL43hVssEvw-1; Mon, 06 Oct 2025 09:57:43 -0400
X-MC-Unique: -WCvi3fxOsqEL43hVssEvw-1
X-Mimecast-MFC-AGG-ID: -WCvi3fxOsqEL43hVssEvw_1759759061
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3f6b44ab789so2553948f8f.3
        for <llvm@lists.linux.dev>; Mon, 06 Oct 2025 06:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759759061; x=1760363861;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N38NCXKatF4Nc9lTi4kU9EIStYgT9YorHxjupIC+4LM=;
        b=W8iJXRCErKK9cfhdBUQ1Sca6z4i71YJmcXIUEbG+UTiQhu6QH9P5f3QPDWruv7jQZt
         sq+ZA3f23eeiCftNLztr+j4WdJkANYRnIY/cEz0aeOp0ZBFY4hum42fF7R6hXkgHY93t
         DRWqryxf8e2d4M3ya40WAuCoBpfetDG+dhRcJcIga2YlH0ZrO0tk4pjSLipg+4FlH/Mp
         r+cxSMl9NaTvm4mGtjvTnJOLa0L81ou370/jI20OXqGas69ZwKUYVPGGU1LjrVsYu4P3
         BG6lGBSdfYaxjp9cBtiWMZSoAx+dYdudYbuZwrhOlMmvXBR3jdfodOIhUBjFc4SXNmK7
         BeYA==
X-Forwarded-Encrypted: i=1; AJvYcCUvLnVY3CpfnMdeO6pEMeSbw9NXiKb5pDHCKGn73nkb1JuViOTOm9CSJIae18ram4vBgtrO@lists.linux.dev
X-Gm-Message-State: AOJu0YwatfG5LtBKE9IMm1XlcATyfybfR52qnuYiRhvx6587pnMwigoL
	pXw2E12YkTMlm/BgxTyBsqrEeh8tLEUWpOS/cAFqxWifBWaLWhPMt1kBtC5Ga06zQLq5/wJJtzZ
	Oi6IFwR/ms/Sc3txQ5VEe7kgVzMI8jpcawnHw2uQElo2KgMZtDCDSlbs=
X-Gm-Gg: ASbGncu41fa8MTA1YH8A9RgF1io0nCZxIXZHILz93w+JX3ULc/HOYhKeLYDjlPWFN7I
	zAlrvLT4WMwQtMBSmzzZdWdJxBBpJ5STbiRwS79UxC71aqhd37ZxQrsTDGH7rVUkze053s8hm73
	kviZiX9anUaKWXugm4gX3pkOm8wnBNegNrEKgB0qvHYIlRyOtFU+/i3vQMPf63sBq3O17uR9+B2
	sVTDwDYhULgu6KHvPmMerTJ/JrnipHm9W19PkqIamr+31rLwTmxK15YW8au7FCmDN4dkkcp6eXK
	ep8hkgNdWnTiFtSMW5IggViGSMGm2w6Dm4jffGTh8j7ckUXEsvw+k7x6iA+XOrHiaFHNZKDY9u5
	a8aMbSRWbkPJ5inIK7+A=
X-Received: by 2002:a05:6000:24c8:b0:3e7:471c:1de3 with SMTP id ffacd0b85a97d-4256714c990mr8743308f8f.14.1759759061347;
        Mon, 06 Oct 2025 06:57:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSEXhNL5qt3C2EExsoRcqgHMQ8DFjBOOTUMJgsVGWdtBaHzjZoYrl+W+SOqr9EcfM/+bfqVw==
X-Received: by 2002:a05:6000:24c8:b0:3e7:471c:1de3 with SMTP id ffacd0b85a97d-4256714c990mr8743277f8f.14.1759759060881;
        Mon, 06 Oct 2025 06:57:40 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de. [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6c54sm21356683f8f.11.2025.10.06.06.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 06:57:40 -0700 (PDT)
Date: Mon, 6 Oct 2025 15:57:38 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Tariq Toukan <tariqt@nvidia.com>
cc: Catalin Marinas <catalin.marinas@arm.com>, 
    Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
    Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    "David S. Miller" <davem@davemloft.net>, 
    Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
    Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
    linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Gal Pressman <gal@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>, 
    Jason Gunthorpe <jgg@nvidia.com>, Michael Guralnik <michaelgur@nvidia.com>, 
    Moshe Shemesh <moshe@nvidia.com>, Will Deacon <will@kernel.org>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
    Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
    "H. Peter Anvin" <hpa@zytor.com>, Justin Stitt <justinstitt@google.com>, 
    linux-s390@vger.kernel.org, llvm@lists.linux.dev, 
    Ingo Molnar <mingo@redhat.com>, Bill Wendling <morbo@google.com>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, 
    Salil Mehta <salil.mehta@huawei.com>, Sven Schnelle <svens@linux.ibm.com>, 
    Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org, 
    Yisen Zhuang <yisen.zhuang@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
    Leon Romanovsky <leonro@mellanox.com>, linux-arch@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>, 
    Michael Guralnik <michaelgur@mellanox.com>, patches@lists.linux.dev, 
    Niklas Schnelle <schnelle@linux.ibm.com>, 
    Jijie Shao <shaojijie@huawei.com>, Simon Horman <horms@kernel.org>, 
    Patrisious Haddad <phaddad@nvidia.com>
Subject: Re: [PATCH net-next V6] net/mlx5: Improve write-combining test
 reliability for ARM64 Grace CPUs
In-Reply-To: <1759093688-841357-1-git-send-email-tariqt@nvidia.com>
Message-ID: <e77083c4-82ac-0c95-1cf1-5a13f15e7c58@redhat.com>
References: <1759093688-841357-1-git-send-email-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6M8CsI5KxDGYd-nbsfkFrZKMq-S3m_onR_rIPGZLBmk_1759759061
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed

On Mon, 29 Sep 2025, Tariq Toukan wrote:
> +static void mlx5_iowrite64_copy(struct mlx5_wc_sq *sq, __be32 mmio_wqe[16],
> +				size_t mmio_wqe_size, unsigned int offset)
> +{
> +#if IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && IS_ENABLED(CONFIG_ARM64)
> +	if (cpu_has_neon()) {
> +		kernel_neon_begin();
> +		asm volatile
> +		(".arch_extension simd;\n\t"
> +		"ld1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%0]\n\t"
> +		"st1 {v0.16b, v1.16b, v2.16b, v3.16b}, [%1]"
> +		:
> +		: "r"(mmio_wqe), "r"(sq->bfreg.map + offset)
> +		: "memory", "v0", "v1", "v2", "v3");
> +		kernel_neon_end();
> +		return;
> +	}
> +#endif

This one breaks the build for me:
/tmp/cc2vw3CJ.s: Assembler messages:
/tmp/cc2vw3CJ.s:391: Error: unknown architectural extension `simd;'

Removing the extra ";" after simd seems to fix it.

Regards,
Sebastian

