Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F7C47CA7D
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 21:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786482889; cv=none; b=Lmr1UwoBRGbOAtYLuzCL2g1+0leE7H/tZJZojI3npSJOpv92+hNHMb7w9xS4Hev8RNNhBzotN/0fX6tN5rR5FFOYQ0gDw1KIj4imVo7tVn9gcoy9sOB6ewxXmhOeyaT17i+BQBnHsb3stpCrjSWdBqTNdLLptHj3P43sVRcwvm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786482889; c=relaxed/simple;
	bh=vELLWw0jcQS3izlB2sdDvaRC3WcKac/J6CTcP0dIWC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WUvPcrSqOw4PhPZ6l78qxRSZOWsVnLyGVqU4QdPhvlVABITAvpaSWt7PW0GBGo0VFR6gBu4uVzMOLMM7sLrPE/gVb4kByBjdW/5/j6xQJR/wth0YqmhII97JWRSoKLODBwNZ/oq0A/1jqA69W6I8IsCxGObW1wrFNghFNzq5rU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qEKf9R0f; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qEKf9R0f"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8486672f03cso407198b3a.0
        for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 14:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786482886; x=1787087686; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsIA9G0uzM6tK8/PrMCXpabodZWsD0MRjRT85WaMGF4=;
        b=qEKf9R0fj7X8E7X8DFC8+ttJ0biixLCYBGROPKt8FbAwI0hYqhL5aDmmhyxWbj9wtG
         ObJT8AaSVLVkfKkcEfSD8sHkp1R0TlnWH7WJCv3i2iBtCv1rm2zYcxRqfa7TLWqscxrd
         LztV0rKpav3kYYmvQ+DjGk4Xf5PmkWOJRK3QMKfyhpJAbilQnfh8e/JshGiZVbv/Cmgy
         mA1l3OgVlGTkyK55ZzhSJpVVeUBXLJqGqyc6ZUgVA86ck7qVK4nccqpBjfvAyfe7bvpT
         fX8kE1C5Erp0M+ANkQyS7JHCpbJWuPCztzeoex9Mk0e/Y6YvbFvWbqpkh7atZWSaXGTp
         neDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786482886; x=1787087686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsIA9G0uzM6tK8/PrMCXpabodZWsD0MRjRT85WaMGF4=;
        b=UIahSDPRKfYpsWoUXINosgvw1aFb08mVCJ+VB4MIuaMSC6Xf8wXIRET2buZZoXtgEP
         Gn88o4AjOCChdAjyT96Y1UN5x13WqvZegSbox9utl6Sltc3edxiwc6kDgb/5Vl1IUkTH
         u0wsYzhD5ZCLOBsonu19alI9ZlrOEdS4Yu+V0tpufRu7QIXY9FD4sIDx7le4wErFFJVJ
         hCyTt2siLzyUZMOUULTNp1nLAE34yOzoPuaE+Gd4Wy3bppNHmCpl20Av/09yVzP8Y74+
         bNAeZ34P3bh6KPVanYDFUZgtLYY3Ts5YFfbHndqPZfkaP+38O0X9MCxI9i41j7fOx07B
         h2mQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPpe2/xrdqL3RvVlhGdIG9UUGyTVkyDU0rcv6GqXieS03faI58ZelzV99qNrWcD+CqwNEv@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4lGLkvvo1H3pb5Io5SGRZKdf4CXrAKGUD9EeQEmS5d35cZE6L
	Ca4YftDK0lIWLB+Pq2AQHoOpEJC4C0ZnwUbuvSQay0sxEP0IXpxUSlu/vZ9Jb+FfKg==
X-Gm-Gg: AR+sD10R51YsW73LVaSd946EdACx6aCw5wg6bba6CEiyfghb5qlmSWdp831AVAd0le2
	XkjvHYCE4pl4cTAwJCNJaOJJCCOa3wS+ZeTRSVeuOoMFmR7aSVnIAY2TxlIY6Zo0kdlAC8xk9ul
	Q4Gnv0qMHioP2MWzcpEoNlZY4u4srDdCmPIwzUcMwy3Ja8iBW983y6F/L6zc92lRWIy8ynUpPN9
	Ets8e+uAYuyI/Igu56lVaPfM9K/lyjJdcEikIUFqmx1f/00AucXbTRCh3D4w8MwVJ6bCs7dxOgz
	htmdAAneq89AYPC9QWYFzVrZFXbu4AkUpN28F/IIuHGqlU+hmTb5U5E67Y4FNmEqi6Q9yafJd48
	NeLZO0m49IsHuLif4TPAr9FKC36trGPAQte5VusuYP5pAAs+AoSyqdSzGnk7EJyOPMJU92wj9WR
	jBb2zUG3aRcE1arPZ5AxoFQcBHhebNjmGObNHeWBodNv1AmSrN97C/QOgoMiFq8hmt09DGe3h02
	bb8/w8Pzo+3ea7kHO5FVGNFAQE46Q==
X-Received: by 2002:a05:6a00:1d98:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fb5596c31mr161407b3a.35.1786482885795;
        Tue, 11 Aug 2026 14:14:45 -0700 (PDT)
Received: from google.com (132.200.185.35.bc.googleusercontent.com. [35.185.200.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fb1f2645bsm237399b3a.50.2026.08.11.14.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:14:45 -0700 (PDT)
Date: Tue, 11 Aug 2026 21:14:42 +0000
From: David Matlack <dmatlack@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Justin Stitt <justinstitt@google.com>, kvm@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, llvm@lists.linux.dev,
	Mark Bloch <mbloch@nvidia.com>, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, netdev@vger.kernel.org,
	Saeed Mahameed <saeedm@nvidia.com>, Shuah Khan <shuah@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>, patches@lists.linux.dev
Subject: Re: [PATCH v3 06/11] selftests: Fix arm64 IO barriers to match kernel
Message-ID: <anuQwhVv5UhjS_ER@google.com>
References: <0-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
 <6-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v3-76f117ad04f1+28a90-mlx5st_jgg@nvidia.com>

On 2026-07-16 02:03 PM, Jason Gunthorpe wrote:
> The tools/include readl/writel MMIO accessors on arm64 use
> inner-shareable barriers (dmb ish) while the kernel uses
> outer-shareable (dmb osh).  Fix them to match.
> 
> Add __io_bw() and __io_ar() definitions matching the kernel's
> arch/arm64/include/asm/io.h, including the dummy control dependency
> in __io_ar() that orders MMIO reads against all subsequent
> instructions.
> 
> Assisted-by: Claude:claude-opus-4.6
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

With the changes to tools/testing/selftests/lib.mk removed,

Reviewed-by: David Matlack <dmatlack@google.com>

> ---
>  tools/arch/arm64/include/asm/io.h | 20 ++++++++++++++++++++
>  tools/include/asm/io.h            |  2 ++
>  tools/testing/selftests/lib.mk    |  5 +++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 tools/arch/arm64/include/asm/io.h
