Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEDC43CEC0
	for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 13:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974267; cv=none; b=l90JZEZaXzYS+Ve1S3Rz1pPK3bGFrFkrFDmslPDeGl1RlXQ/YuhFAdtN9CmE+BNDth/NWHVsCHI/NxGrywW8TQIrlkpGNVxjiVQpNtc+R8mLyiuQxSYXf+jvOJnwiCHm7u2h4MaxsjcZD6bXqiTzBVM9j34NqdNXkpEoIIpzqow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974267; c=relaxed/simple;
	bh=l1KmbxaSn1vlCmlCKqGoPg+3lItQFTLM7H5zRTTjdlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5lK0Y36+uFluD7V9oOSnLPeQQhiYhlGJvXHLkb+fFCXkYGesuOROBVAETgnYoWRndebC/DLjZ1U6Ptd83neZpdPeRBc0Hm48LrL72VKIJRJ5jkDuqldaCmifRYS6gGwQKzu7aw5lGXXrYexLZZKh76LtRUQ85+QJEjhuXvbrJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=SZWY+Cyc; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="SZWY+Cyc"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8edda5d56a5so36088656d6.3
        for <llvm@lists.linux.dev>; Mon, 17 Aug 2026 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786974258; x=1787579058; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BS4TBmNsymnramXeNmNZhBmFeFZI0B72fRANMpt3ZzQ=;
        b=SZWY+Cyc1v2CrpXeWczDzFqneCU9ygripk+vlqTLxvZe3EcyD3kuVMr5jRAGHPu3Pv
         GVU5AWroO6V2dnyuS8hejsSQRc8pXSRh+2e3z4JwcGa4YP9rnyD+tXYiWtn1n/0x2IwE
         xMeb45YPE73Io3RrnrXjeDgdJpODM8687UuX6GptMNO85aVwbp91weIunDRd2blWiJch
         KTqTHaukSM3D/+g6H0fj1yLLoddF08NlinQ2wNN5ZO571IxEyimcXI9jVUOTI4SRwa7U
         4Ot4jk78tw0bDMxE2toodvzm23X9qHE9mM/OEgwzq2uiIWuvtnRtVWGz112nfnCEIsiC
         UPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974258; x=1787579058;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BS4TBmNsymnramXeNmNZhBmFeFZI0B72fRANMpt3ZzQ=;
        b=TLjyXtZh66pI7ksYhKBE4ZjSYtqRgHMOZiDTi2qId6Cgt6IeeN/HHkfBmlusCVuxLV
         J/ryCNVtqVOOOwcAS4ggpPQNhJbFpmNPIQMv8x3xSKLgM/DhjU6owZp+d2uap4h4rSl1
         FGn4aUEGIQ/nAp4rYlGd6eGn1G5CsdTPHK+8xEd8ImZ2YXRIbz0FtBzcXJ/b1NI0xrI8
         CZpZ7kYLRGSByrbKa6Okzs1jmK0cG7kau/y9NvVXleAPKUQEWW6djZp0N3rhYw06QIW8
         UuaVJdeGDapWty+y7rNQNTdsRXYJuoMld9hyVi/WnOMNpIOdVLvSKKaw/zrcm2fqHavv
         IYAg==
X-Forwarded-Encrypted: i=1; AHgh+RpAL3dNvhcGHlnGxvKgE2UTqgPyRz+OZOcFBPXJIlqXfuTNK1jPHeTk1kguzjL4h/tnsfdt@lists.linux.dev
X-Gm-Message-State: AOJu0YyquhF4SvKZiNYZee2PBgcJ0QljUOOEj15N1n1BTl+35Hjfavxl
	KzRuw3UB6XXMXA900VP8ijHoQI1RsQfyrI1KzbLD08tVc/qN+Xb/3jz+DZZxRlkggLQ=
X-Gm-Gg: AR+sD13uS9MjWM7rigtm6BY75qRR3A0zuWVKhmKbagTQb9zce/WKLYr7BnR1xrkHFuK
	5Sn5h83lKVPPM1p4D4HzyJMJvU1P54pdn8+XG2uKVauA1po+B5c926bWV2+C8R93KRVVlKvTL2/
	EOnziy4kgVx9opCcZqP47pYTR7hj0EwGTggxJzDg5bBaOZ1akNbB7dfo6bHZuADFIr+ykj0Dzog
	X6ML6qxsoSIk5WlkUdCjFNefVmptwDPsiXdQ6CPpYchUsiMRZYuUd2g8Wlu2CbM+men630HLdJ3
	yJ+V36220qMeA6GxK4j+5UZ5yg0UmujZroMZAgIuvOPMIrvN90lVvG9cYO0Z6PdVjfHHOp5iV+n
	kmBdcItt0e4cmFW3I0u2qqy1mo59+Ikaneb3kfI8HQ80PCs6Z2dMQmFKEIGxecMSGScTUTE/Oxm
	jiy5UpwXKtjdpFZqoJu0rNvOtFqrvC4ftiflZd+yr7lzaCH8yg
X-Received: by 2002:a05:6214:2029:b0:8f3:e97:59c6 with SMTP id 6a1803df08f44-90a91dcd1eamr322787926d6.20.1786974258222;
        Mon, 17 Aug 2026 06:44:18 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c45986ae7sm9166026d6.48.2026.08.17.06.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 06:44:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wvxdQ-00000005wLX-438N;
	Mon, 17 Aug 2026 10:44:16 -0300
Date: Mon, 17 Aug 2026 10:44:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
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
Message-ID: <20260817134416.GA1415075@ziepe.ca>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817-qda-v2-v2-5-69a02e9090d4@oss.qualcomm.com>

On Mon, Aug 17, 2026 at 10:17:40AM +0530, Ekansh Gupta wrote:
> Register the QDA compute context bank bus (qda-compute-cb) with the
> IOMMU subsystem by adding it to the iommu_buses[] array.
> 
> The QDA driver creates synthetic devices on this bus to represent
> IOMMU context banks (CBs). Each CB device needs its own IOMMU domain
> so that the DSP memory manager can enforce per-session address space
> isolation. Without this registration, the IOMMU subsystem does not
> probe CB devices for IOMMU groups and of_dma_configure() in the bus
> dma_configure callback has no IOMMU domain to attach to.

I didn't notice a clear explanation of the proposed DT schema for this

But it looks awfully similar to the other driver that was creating a
kernel synthetic bus for actual real HW, that wasn't well liked.

What is this for? Why can't you have a normal DT binding for the
iommu with normal devices?

Jason
