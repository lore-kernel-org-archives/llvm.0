Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333155;
	b=KLUofc3mpfRUxmMjh/riS7Hnv3B79pS4JZu1SuHAYaVt6q75p1UQAlyxnjFgvhBz0s84
	 WzjkVcf77SYxg4ZHFGcKm0Sxc/F3GBwMqBTrFcT6A4I9dKW1F9tjMy9uoDCX0K4eMV3SW
	 6Yvx+x/LNx5bvGKM4OmYe6fGyFzOK/tSl/UB4Vgr3f+OmOKbj+QwS14lWiEhNEzPUw2pH
	 etHVJ4Jjj/5KMDeA/punFzIYCLhC7YnR9j1q2ZGLZ0k1OhblbEqa/3nwVSvKAPrCZSmZ2
	 46T+jxMEaJKfJug6KduHJ9uRRi3+b2M9KqDy+DyEFrlJC64rlPq8nw2+flqyvHwKgYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
	b=tk0GFOfibPV7NFoV+39j757TidXIMa8siUllWbTYmAqBX88E6SJrkDLHda7kLNRtxauP
	 e7ceuzp6YAIO4PegklGK7ecwTlImUYtSkc89e7GC4qqRY+nUZVHeQUQcwOp05dEtUoshk
	 oSZe+6VgYgKkK1EjKja5rffBDXI74uI/TxzhHSInvwSa8aOa1QPQ+bzIp+wHZ3Zc6IJQj
	 rilqIBEpJMbpRooLUhk7RByYO914y1Y+L8l1HiwNRSH+aTlj/UrQxNzTK5WIBI0AriG+K
	 3XuIHs4hBh2Lqsx8YXAW1T+MipFRVRs284JzlPLUx6NTa1H39tXu4ZdEivX6R715+bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pNcRgMIZ;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92131606A322
	for <llvm@lists.linux.dev>; Fri, 30 Oct 2026 04:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92131606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pNcRgMIZ
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3514b90bb89so632137eec.1
        for <llvm@lists.linux.dev>; Thu, 29 Oct 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333154; x=1793937954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=pNcRgMIZIY2oZG+KBCWHOETi9ENJBfSv74eJI/QEk0Qv49pNOktbBQPM0cNGUV55/3
         ePz7BhW8pNjZ8f4f1LSwcic33EABoFyd47SE7TUqqEmcPmDgzlYbefkW2jeKuHT9YCoX
         EiEloNWcp73OAUo/HN1DbeN3mKUw6BNxygKbGN9KW1u8cfNeGOpnY0+APiLbZl6JIuHe
         42Vpoc/I6bR38uspIwB297pgPGcOf+fOJrpxGnUHkpQsB9afSCO4oOjMTYQ5DOvt2Tk+
         O73Kg0pG7Kj1iQoIowPPMoPHVY/KUvk8TmKThPcHK/hqxS3j+QlHVAereljRk0sZO8Q8
         iIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333154; x=1793937954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=uaAWY++knecO2psSUxiMdX98E3Q7OPFBQjOoYuSFSSYg0k169owxfRFNAM51OmTRSR
         ymZIII2wg7FPvglz8kQim4B1OAAr82HKnU3myEB5m+c543N3HS5hNoNwRUvwFD4FkS4m
         XENITUEtTOW4P+uChj97YR/meOVDqBaUa+NJe3OKsZKPMX1y0GM2E5+WrLPW3Xj2BM1u
         0bvVPelpXtc29iu37ElV0nPiZ2CMrrPy00mE1V1Tyr07nA5ATfaO0tPSgtPmS+u4j2fq
         KHvvEny4EaEeEdcl3f2eA/O+wQETRGLaSqXLXyjCkFICymm2XAyvTLSVlhLW9V9peHDx
         elsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqJIw2TykTVpI8YRNFR5u8slLELp9dmA0ciwxtiiNJLfVSqayguIVf5Jixoyc0gxGbkYfX@lists.linux.dev
X-Gm-Message-State: AFq9FYKe1Qs3IIWGglf68Llqy9gTfRlHUWv94bdOCJ11dsnW4OgX4bIP
	TYsGNjh8IMUXmTcq/YUzCpOdEY18QYW0sJ0bJAvd38fnviHYPLswnByAb+gVepeT37A=
X-Gm-Gg: AYBFou0MwX5dQDnNcYQqnePfsJU6y/Kum93z2JU16B2X+mmUxJZY68WzFKrGAFuOv7o
	yuTXDAX920UwCQ9qc/oZHUXf/UZdkFHclrjPjKjg40PuGGDUhEY1sdjURexPOg2BSXdc0XWU8B7
	4qMMZ1J3IAMWynMUJfYLpMqGN3k6XeifGndHa5IxkeG88aMwv23V1J+v/liCp/0Wy5gsQIgpPRp
	ATHNRFe5vrTc8XEPa+feYi52/ZaPivQsJ+w4SVbXHkJaGWnOn9iWQyctcHqqX8NHaUWhVoKLb0C
	L/fqskc74z3VVDv5OyGArW8wwOUJI1DNuMkEMOB2sK19OZjoZSucoLGPUYXn9SK8PFyY1Ge/xsE
	Jh3ZwEIqGZd5oGu/RD2G0NeYE7z3bu81hW+dOGcCbAEerEOK96LfMMb/F2cjbWIc0DmKBjnI9s1
	WMri67NHL0EOgjy40GYkqaDzjLifJOLcMf41IVVdPiaKDmDbiyQcdncr/zCgNzvG5hMyzl/nz6y
	NLT1kfOntg1GzgxKXIAdtB27jkkZQHVtdtIa4QFaSFlQcbZisLXx5lqvKXUOhwE11NJcq2ddSfz
	nMvUEKmIPYXIPNuNbbEbD1sQZ4z3NNs=
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr1772736eec.24.1793333153319;
        Thu, 29 Oct 2026 21:05:53 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm3512579eec.15.2026.10.29.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:05:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:35:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
Message-ID: <auQXnep2xKpuNJOF@vireshk-B250M-D3H>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
 <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
 <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>

On 28-10-26, 16:39, Rafael J. Wysocki (Intel) wrote:
> I'd expect the driver core to pick up the series as a whole then, so
> please feel free to add
> 
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
