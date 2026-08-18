Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1605746EC62
	for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787058448; cv=none; b=TjDTfotSo5H24YqpNpkoddbMYe7NxyoDCiSWNkxbjbKfdbga+XtNCZmaBSmCvkgbmNDJAG3k6O0PwhLcraebT1GOHBD6lxxP9UtoIQHzNaaeLS8Y9GR78eqiDqllYK5pn7JZgcKRQgTPS8MamkqQl/ddRkpl7a4AedT1ybkmhN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787058448; c=relaxed/simple;
	bh=aU2VtRXj8vmLbAKszI/rzjIGfSjXrWM/1EcRNLc+2zY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGPmHlAb5MhcNBYVo1EKxXJRb1N+CYKNjgUg+t0D1Yh3GHrIC/FzaQY0L8MeSz1vO8kuTho6daFeH/WcANudqUh8tbEhLugx4E3XmVGEST5YQLuVaInKX0KoFjbRUtxtvNcrxxDZtyHPJmtjCgpzRLn7NTEWPCUycW4SMaRUcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=US+l9vk3; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="US+l9vk3"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92e54f8c051so227911685a.3
        for <llvm@lists.linux.dev>; Tue, 18 Aug 2026 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787058446; x=1787663246; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6wSKG5ykq4Q6C1KtG/SKHUImq95NPkNyQJpM3ppYMA=;
        b=US+l9vk3HFTzG/7QOn8gBkUGmXS4OC1SiMpxA7FsOFKttoZIxwIeQafx4QROIJYvB9
         Eiqhp8ukczm9tQIhnICLehoeTfTdFfOPzLoF1+MQ1Go0NAqcCY4OZwMpUyIKuYrAEget
         /tWMm/Ved1S2+XntulFcMTArODnJaMQgDGjj+JzuRejFLIumKfuMRVr0LvNurMh61uA7
         MNCqfxv/M5ZBkx55CuCZpPm0UHAIA532Wlx6z0+g0aooX4Au0hJrBDr4ONZDrUXcy4m2
         7aV2EXmr7tWlcXboJIBs+5fSc/IwMPU2yaYtvu9qoHM+clzrqv4P44qc3M2v71YKNmbR
         qrGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787058446; x=1787663246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k6wSKG5ykq4Q6C1KtG/SKHUImq95NPkNyQJpM3ppYMA=;
        b=WOBA3V1P71SZlhbWIDTgsY42EqpHnEu8MKYf9oTP4LYZUHXg17+Fttveq+lSAIdTr0
         9Y4O1T1+q4ID9/oh6Hl6qauzooXdHpXipAa36qJwm5BgGyj2EFI7JacSWtiTQpORMlVT
         df5ukXQWuo56aYrjyHX+ansQ53CG06peBd92WH4VWxdhCLkWyU3VBbyieQb+JnZlaonh
         p8/T9Q1Au+xxaRVraw+Mjh2UtB5kelO7H4az2P48LhwHEiMnASACVKkbGcPuPQy//Glt
         JiDC4EKen6szOGQk/b3JTDkPKiSn82FgWcCZHfTm7sa79B6HUUxR+1GGL3CFvIAFyXxe
         RHyg==
X-Forwarded-Encrypted: i=1; AHgh+RrrFNSi+hF8G0Dh/V2yIDuFp59SEWrvR+AuY/OtzqVe78WMVrJoR/2XcfHpEF7JpKBr+Ubl@lists.linux.dev
X-Gm-Message-State: AOJu0Yw89SLJDaqQgA9/3mHQR1fSoPgP8rLMGJexAaxsvNwNDAxCrqbo
	BR+aE7IgeEM8uGXFHGtbC13F5tCCkDp0fJd6g8NrwyGXwMM/xWy4bFuFMEYW6vM9+5I=
X-Gm-Gg: AR+sD13r9e2EHBLN4N7DW1y0TYLwSUVeHaZL9rZA8j7lF7ElNGVJvBW+J96hsJuy+YV
	mlDkeVysGRDjsvqwW8+FLwmKRV89c4XwZuv7W9hVORHKq7na9JYPZxM+tVMujkUcei92hJRnNH3
	eyVHdzXUzqKxs+MP7toBc1EY//R/CaNHyc5Ybvr/It/AcLjjhubLov1kezDFkMp+6VeWY7zhQ2v
	EWQgN+j7yYa3BJ8Sn3jF6BS/qMKQIbtVJ66nt4pMhCNPYIJy112OBH8niSA6iVKDfPIj2aRYfnO
	wM7U3MJtisxRQwy3YcQovGjT8VN33sluyRsWRg5h5gWZtxca/WP41fYJLmtzdGSSW2B254LYENH
	tFCyl7A79HCaYFWEhpu+cSg/Lac47mLeTGw7eUhnOFz2N1Vs+WgeDA6Al9ceeB1/NXJokiRaWXd
	1RsYxMz7NyOzC/lWaX/pxX4IqDzO463kWjoMKIg0Qh1REzy8NnNsJfC+T7TlwEVeZO6X5PbV1L+
	wPnDbtvDnzgJwgYTBW1bukMs4TyW3jwVH+Sz+zv7qAvJQ==
X-Received: by 2002:a05:620a:4624:b0:934:aa56:45df with SMTP id af79cd13be357-93704af041cmr767327285a.11.1787058445831;
        Tue, 18 Aug 2026 06:07:25 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9370342b3b4sm281378685a.44.2026.08.18.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 06:07:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wwJXI-000000001zD-16ZT;
	Tue, 18 Aug 2026 10:07:24 -0300
Date: Tue, 18 Aug 2026 10:07:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	srinivas.kandagatla@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
	iommu@lists.linux.dev, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 05/15] iommu: Add QDA compute context bank bus to
 iommu_buses
Message-ID: <20260818130724.GA5482@ziepe.ca>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
 <20260817134416.GA1415075@ziepe.ca>
 <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <89ec74da-15ed-4278-b651-5c753fa4f146@oss.qualcomm.com>

On Tue, Aug 18, 2026 at 10:40:25AM +0530, Ekansh Gupta wrote:

> The CB child nodes are not separate addressable hardware — they are SMMU
> stream-ID assignments described as sub-resources of the parent DSP
> interface. 

So this is exactly the same thing.

Read my remarks here:
https://lore.kernel.org/linux-iommu/20260618151745.GD231643@ziepe.ca/

The DT modeling for devices that have multiple stream-IDs is to list
them all in iommus list.

If you don't like that DT modeling then you need to start out by
explaining why not very clearly.

There is undeniably a Linux gap where it forces all streams in the
iommus property to share a translation. This is a *linux* problem in
the iommu subsystem and DMA API. In an ideal world it should not be
fixed by hacking up new busses or mangling the DT.

But of the easy options I think hacking in new busses is the worst
option and has already been basically NAK'd for the hamoa project so
please don't use it here for a diferent qualcomm IP.

Given several qualcomm chips now have this same issue I strongly
suggest qualcomm consider trying to fix the root cause and provide
some way for a Linux driver to progmatically "unbundle" the multiple
streams.

It would be much easier if the HW properly supported actual sub
streams as we do already have a programming model for PASID. Maybe
some kind of driver thing to reconstruct the iommus so that each entry
is exposed as a PASID in the API instead of an alias or something like
that would be an easy direction.

Jason
