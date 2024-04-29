Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE0180BE3
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714392603; cv=none; b=oBbR+Xk2A33vptu+p+ioqgNMVH0fXa5HLR5l0Za8cotjw4wIwyj5e+LqFY4vZjkGkmfeauN1P8DbuROF8b2wH298vexp+obnR6fz7Q83Mt6ARlBHq8jxGQRT82Zv5a5oWwn0OKtVYDIYYWBSHyokQMDSaAdloZyJqg8okE+BuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714392603; c=relaxed/simple;
	bh=k3LPaxpQ0t6t3el8UgR64nKFhllhxo4z3vuO4mc314Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNpFZb5wVwx0X6fuswikhrFm4hwmSRNncyH4QTjSFp4YZ2NjoKOJsiiwqlK8uUu1AJTW2DcD+XizpgL4xtyO1eq2Bg74Flcf0ALuQi54qcY5qo7y9k/THTa3mLbyqKEqsuWUzYbtaVUcmVVuWqbexLOkzjloGCIb/xtxtp3B0Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=MMdkBktP; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="MMdkBktP"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5aa241232faso3367394eaf.0
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 05:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1714392601; x=1714997401; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EXRgEPH1uU79zQD6+IHe0m9b6rETQiei9x6o058HUWY=;
        b=MMdkBktPBd1lj7AiJfjsUg7A8n9wYXWBCWMyyc720cpLun8MAYRGvsdkRGwPFKm4m4
         JALrjDlIlokUr6fW8ihwiumSe6wWMTYzNjwi6M9wsSluHEK6iIaxx/Fxaw6iXYm5YSuL
         pkVCd1AtDoFlzJJTjrJNfKJILMB/1Phan6x6AiHj8136uCSdJOH1zXc32jAqmjoYEP2h
         ujLWGhpBknBAY0fRxtR7nVD4XQQegHS/uQUoIebQO2gVvjYA6ar2HTv8XJOC2Rl0oxtZ
         E2p5YgO0XKVNhE0qafhb/k9ak/e8mr/t/8bYehGR1uKpzmzF5FISx3GL3099sJXJ+XiQ
         6NBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714392601; x=1714997401;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXRgEPH1uU79zQD6+IHe0m9b6rETQiei9x6o058HUWY=;
        b=E0EMu4BoKf4ehN80KUcc0EdGQsEwnXKE8siPDY4fjK7+YlPU9oAdHfh9cxJ5fZqzbm
         rI+OG24gIUXv/kdj6b73wxvQwbS+Rn6GBd10CqrsLAgKGALpZHHQ4fQ2fMzWndg5RtjF
         uYwhCCItESknzbx//8SBv8ZMuPv862D2W+mTELHYgs4E4VuIt2pWYnjX5JAJZtsNc+9K
         MMrQfhhhR2WGrhBjZZ/tzLryYbJXgzHWIlH0shoKs6ZNOtB8YPoyAAHUDGDkUtS0a8vR
         u2+aRg1tZloMHhmHY2kUD6Rv7ofOo810WetO/eeGgUdr3XTXikfW+8jWYqryeNEFQZ1G
         fXnw==
X-Forwarded-Encrypted: i=1; AJvYcCX41luKTz4yOZugQZ1d7cD+IG3Fi24NidxdpNsRuauxRoTVyZ6D1tAkwA+lDXF2HbbiDlMUujobltHPlS8FyeaSCLVEEQ==
X-Gm-Message-State: AOJu0YwSxK3qNY01ajZ7kdGA1FLgFDc+QfSt0cMj76IYjAD/un8mIq/t
	nb8McJqlxa6iOq1aldL+NsHxvOmZ+V7HAZLXFGV3avRUz0IbibyZ7u/VTIWiVbI=
X-Google-Smtp-Source: AGHT+IEY0PvXjgaQ9NXclObpxAxFwPAYyqZoUOatV7BjbYwCTbVrRKEXAnTs41fAvifo/8xzoAQp6w==
X-Received: by 2002:a05:6358:797:b0:186:9d05:5f0 with SMTP id n23-20020a056358079700b001869d0505f0mr12388658rwj.22.1714392600738;
        Mon, 29 Apr 2024 05:10:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id h2-20020ac85682000000b004365ab2894asm10399689qta.51.2024.04.29.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 05:10:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1s1PpX-000oW0-FJ;
	Mon, 29 Apr 2024 09:09:59 -0300
Date: Mon, 29 Apr 2024 09:09:59 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vasant Hegde <vasant.hegde@amd.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH v1 1/1] iommu/amd: Fix compilation error
Message-ID: <20240429120959.GM231144@ziepe.ca>
References: <20240429111707.2795194-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429111707.2795194-1-andriy.shevchenko@linux.intel.com>

On Mon, Apr 29, 2024 at 02:17:07PM +0300, Andy Shevchenko wrote:
> With WERROR=y, which is default, clang is not happy:
> 
> .../amd/pasid.c:168:3: error: call to undeclared function 'mmu_notifier_unregister'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> .../amd/pasid.c:191:8: error: call to undeclared function 'mmu_notifier_register'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
> 2 errors generated.
> 
> Select missed dependency.
> 
> Fixes: a5a91e54846d ("iommu/amd: Add SVA domain support")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/iommu/amd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
