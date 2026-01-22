Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D812652B0
	for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085084; cv=none; b=girz+QAS+hAKefTSVTDWXM4lJE+sv3txKWpl/jv94H5ESnhdUNeACM7yC6wOxzd6HZo4NZnOYTqPGua7x+9Kg+KqdR2r3WYdNGT7PmKa1f/fW0vk0MtfwalNSk3BeMdZrBzyggm6JxpzwdHr+XWd0NW46i3huLuyV12WNVK2OEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085084; c=relaxed/simple;
	bh=nntplBT+20swkCLKitUr7M5dmp5xeZLydXiNjXxRNHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CS5vQe1hdlLPVmH18fwgk40Hq2RJ94hczBTz3fEqeQdGZSYgPB6lMCf23iM+xsKeT9LvNdZj+ZuRZEFO0gZHc5Fe0gsaE3c04NC3kFJJ3Sqcm0PXQ5obfPE/aCEadSkvcIQX75rBQPc3WXqGiG1lQfP9ZGeTCdzVcPtOAq/J6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KqtjEfDQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KqtjEfDQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769085080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LFSzJTNlbxqlWkI9uL9dnXcKklos1kYbBGtwLTdTQ1I=;
	b=KqtjEfDQ8MtTXoOtDvcaxSbbQOA7hSwrlfWhamPV7alsT/q1ZBn0RNa5CnXWmVFPrIKF9U
	elkmNknxymMDKlAoTRXYADFUfKsGGsVplGEBMaUfDvq/LlAbyen9Y6rb3vjrUODDe2YBi4
	RC9JA/5PUm2niSS4IQfokUpsw1ezwXY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-n5LrqTuqOzedvZr5fpy1sQ-1; Thu, 22 Jan 2026 07:31:17 -0500
X-MC-Unique: n5LrqTuqOzedvZr5fpy1sQ-1
X-Mimecast-MFC-AGG-ID: n5LrqTuqOzedvZr5fpy1sQ_1769085076
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890587d4e87so35836236d6.0
        for <llvm@lists.linux.dev>; Thu, 22 Jan 2026 04:31:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769085076; x=1769689876;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LFSzJTNlbxqlWkI9uL9dnXcKklos1kYbBGtwLTdTQ1I=;
        b=YFW+DJk0u6hPoQch5IZJ6H28DSryWxf/YsBcX1vOw1Ey80aV/w0NzpXpyip3W5k+ue
         S4hT+b47I6ZGhioKcpqzpgp7bZOsYkhv9ZNL1QwoU75jpRHjueBeeBGMsLbkvSla+4Hg
         7BhN6FHJICjOQdkwgrTfQtgtNNZ854J4Jn0YpCKpbpvuUEV2C3oaDtnqFKjQu8ALILRM
         SPfnnwoa1xbOnxK+/HTDWaVFxrp9uX5p+5pRKVo6zPcagc/xz1tYle7nRzKCXarZffLf
         auysMaPeANDNjZ1Cxdvkq4T7N9scEdMSTSjzO4cO4pyX9iuiFj8nxB2D2LLVgrGhfisF
         w3cg==
X-Forwarded-Encrypted: i=1; AJvYcCWcAokXSDXD7OMDljfNHFyLzQHcSVmzclBWTdH2PLW4mcX/6fijnaT01VB/XQng1svi3qky@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0UcRPzk8uqt/72HDU06vS6Zcaefj/lecn3CxzOeOz6hNWTrMW
	yQe0Nr4CcQalj2t/awwnVoRuAQqMjjcsuWi9r6aeDV2zWY8Ruv/XfIYaFUXCp7jydly7WIgtcaN
	F6RPNVm41pLBytEn4EgMhZOm03cEW53Q+CBi3/6Q2MFeuTQS73YcHr9M=
X-Gm-Gg: AZuq6aL4HQkWVKFwMQC4uNnAikPL++whsPejmH0MKk0RiR2PitkfIdGUEME6AgQ0qEZ
	fWsToBz6Hk+vFigiBqy/nytfErczlQxwvY+AM+dwcV6XxOmY6L97opIVDm5JOQIB/0Sb4jC1Hlg
	y9Y0xZ6hDN2N7lNivAm6V1JMbT4qNsnlk/S3aVXD09iQl1UcqB0R3TvghhYYn+73iGUiuR+sg+k
	jEaRBbhU+GtNTGlQvHZyPRUT0WJaa69KME5ezD4cub43GGe4++3L7iQm4lhYzJQxA2sXW9Bcknm
	PPrKbEojm23IPpxMrnEyycUxgwlIzsi2OyK/F7LZ7fiaUDoJVO3eF1vCRHy81dJDQwF/XjV7rpw
	9eCFtoJYBGvfkPioOS81WWwMrlZFTpcEt8Z/jXKJVmlrV
X-Received: by 2002:a05:6214:27cc:b0:880:5867:45b4 with SMTP id 6a1803df08f44-89463837a4amr142852756d6.13.1769085076636;
        Thu, 22 Jan 2026 04:31:16 -0800 (PST)
X-Received: by 2002:a05:6214:27cc:b0:880:5867:45b4 with SMTP id 6a1803df08f44-89463837a4amr142852286d6.13.1769085076236;
        Thu, 22 Jan 2026 04:31:16 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6ad74esm143654486d6.26.2026.01.22.04.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:31:15 -0800 (PST)
Date: Thu, 22 Jan 2026 07:31:14 -0500
From: Brian Masney <bmasney@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 13/13] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <aXIYklgDnskI1HXe@redhat.com>
References: <20260109-mips-pic32-header-move-v1-13-99859c55783d@redhat.com>
 <202601162110.K1eWGORM-lkp@intel.com>
 <aW-_eIjcRp7VM0bt@redhat.com>
 <20260121231321.GB2625738@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260121231321.GB2625738@ax162>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D5DLr5GqtzswNwS_RaT1-Eia7BqH-aGhkOsLimOxI2Y_1769085076
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 04:13:21PM -0700, Nathan Chancellor wrote:
> On Tue, Jan 20, 2026 at 12:46:32PM -0500, Brian Masney wrote:
> > None of the errors in this report appear to be due to the changes that
> > I made that allow drivers/clk/microchip/clk-core.c to be compiled on all
> > architectures instead of just MIPS.
> 
> Well, it is just the fact that this code is now compiled on all
> architectures via CONFIG_COMPILE_TEST, right? asm/traps.h is an
> architecture specific header, which might not work when used outside of
> arch/${SRCARCH}. In this case, x86's traps.h is used for arch/um but
> arch/um has never used this header before because all generic uses are
> gated on specific architectures like in this case.
> 
> Is this header needed when compile testing or could it be gated on
> CONFIG_MIPS?

I changed it so that it's gated on CONFIG_MIPS and it's working on
several arches.

Brian

