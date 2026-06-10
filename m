Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71E93D8128
	for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 13:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781098756; cv=none; b=TsgL+QVsGSFZjPiTQ5TbnjOSjSotPORK/04vrBURJMTIitdylx0FdIkbucK1W7vrS7STzcAXV/Swe6zEOnwjnvh2rfTevyp5UmpK0BhzWNR+GjgNLaO+NJDL+/r3V1zXLzfqn2oEusMNLiPex7yD3BRxBuuwjEQlIZR5SV3E9dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781098756; c=relaxed/simple;
	bh=N00Ky+WGYp84SzDMbu+B9refsaRvWDuX8zkxZe2IH6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofw+QG5THwPBQXtOP5ARi6TmBQRRpe5m8mJbyWUSVbzcgdHYkorXAh83g3MR5REJ5Yt+HS5vhnMBPjzCnLr24DDBwPODkctCEPsiOhGo3RfdGFNIasTbJzuXK1w38ETpDThAVEcxeO4WTuNVSTYg2sjVacd8htHw21ffYvRWefE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aId+oG1k; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aId+oG1k"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-befd83e0521so1407582466b.1
        for <llvm@lists.linux.dev>; Wed, 10 Jun 2026 06:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781098753; x=1781703553; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPHRXTOIn1D18o4cjb2DkZuJ0R5woSyQD9xCP2gFXJ8=;
        b=aId+oG1kcEso/3eCem+hPsih+jTqaI/uDBjKxmNO0tPQJhK3k+GKLakqXwcpSplaYl
         +5TSS+QSYDhx7Jm2VUxj9M0DAswYXv3EfHFQ82V6Vfyp9vUMSRGpui/Pk9nvXdF96hzE
         RSuSg0+VQDfr0+SMC8fhFWACC3gXbxOdFgrknkR//Wwfz9VOG2JiHGNaG9VPIHJ7/Fk8
         0zTTtzTQR5jtAkmZ8yxGlGFp0fGj2HVKuQ7NJ6bDtdGLfTqjL1WKWXKxP8NQl/aKA4JS
         A1JcVbuGWpEjBKgOr0kO9JCPDRueX12LM7ySYg9QxYPmNu/zLXxe04L2TDgxapNJp/Eb
         OJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781098753; x=1781703553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPHRXTOIn1D18o4cjb2DkZuJ0R5woSyQD9xCP2gFXJ8=;
        b=ecuO4I18mucHCvNDPZ4EuqwJAwPp0gTwKDlnC+4zq0x3qF/i3EpU8qjmk/1w1KmveE
         ZMTSOciEjFTBdt9dUUYOrYM9tZ7s6ScGT8RqEf9hw5W1byLGUjI3/1Q1h0oEhkSm2+QR
         sIjOqfrfWtZcSHeEO+BDdDHVTzFq9XTxkzoEp1vUn3u8Te0SjDPNPf4oJSwWaf6JY2t8
         6xMtFSgnyE2wNlu7cFV6TEkxVyGMnfDrbO9pL9tzo0nc6Nim5umd+r7H2GD8MTeDpPii
         9zsuWqW+7hzFE0IPDG2Lm6xRi+lp/xC++7AHEjb6rTvrBMuKTZIGiT20HBDH/IzBwOHF
         nlnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NkzGW1oU8P0zUKZoybxcAWIccdx7CuRQiZW5boFyKMxNvpA5cqO8YrMmMLo3ms7QaUBiX@lists.linux.dev
X-Gm-Message-State: AOJu0YxPnAMoboqCKiQwKk4INXnVxLXP+hclqDzOesStEHfhx0Dz9VG3
	rGXGauzEhqC/+jqSSulNThOFhN5V2H6Emo1RHh4/x+ksoGkkCNXyxGMgWlyMUEfbJxU=
X-Gm-Gg: Acq92OEkbiCYTPlCDn9Lu9Scw+fuWCzngpDVfZziS+5ADRSElSBhZlvSe538wOG+vxl
	WXcgHuRA+mRYHENU6JjoQx0GswhLVx+MbjUKvj29rehdbojbfb1OiAdC9/Ljirnrw/6oDke8UvM
	PbifUwPMY/oTK1wLV98HxYQkdXyw/ogmB6X8McgcN/NNJLcy7KL9xDd11/xWY8XvkTm46IYErel
	UZs/31RQonz5Q40Vluytyu6LX4RtehtwcDqgobvVPph/y4QMGs/g4MzIXXOrt0xYRE9UeUIYjcG
	t0KPxAV9WERTf75Rq3baX5WcLtFK5UHQgIBs9qUO7wlUsN8EDDIp91JIXcq0GGBQAPSsEBSMpme
	P4CNPq/1ewoHCOkjqcrjlJfqdhWGiIBCiEeFFWrumNigOBDnl1x5zDmQ/LUbmbhHGMko/UTS9BW
	11fryWY3mzK8cIaV/nrUOCAVSg7R1xC3HtQD81TLo=
X-Received: by 2002:a17:907:60d1:b0:bd8:fc89:cda0 with SMTP id a640c23a62f3a-bf3a8a0cdbamr1035525466b.24.1781098752912;
        Wed, 10 Jun 2026 06:39:12 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf054e04a89sm1179772566b.41.2026.06.10.06.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:39:12 -0700 (PDT)
Message-ID: <a76b93d7-89bb-483a-80dd-59e3dbf921a3@linaro.org>
Date: Wed, 10 Jun 2026 14:39:10 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf s390: Fix TEXTREL in Python extension by compiling
 as PIC
To: Jens Remus <jremus@linux.ibm.com>
Cc: Jan Polensky <japo@linux.ibm.com>, Thomas Richter
 <tmricht@linux.ibm.com>, Hendrik Brueckner <brueckner@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260610112451.1553054-1-jremus@linux.ibm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260610112451.1553054-1-jremus@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/06/2026 12:24 pm, Jens Remus wrote:
> On s390 the Python extension build fails as follows when using a linker
> that is configured to treat text relocations (TEXTREL) in shared
> libraries as error by default:
> 
>    GEN     python/perf.cpython-314-s390x-linux-gnu.so
> /usr/bin/ld.bfd: error: read-only segment has dynamic relocations
> 
> This occurrs because util/llvm-c-helpers.o is erroneously built from
> util/llvm-c-helpers.cpp without compiler option -fPIC but linked into
> the shared library (via libperf-util.a(perf-util-in.o)).
> 
> On s390, object files must be compiled as position-indepedent code (PIC)
> in order to be linked into shared libraries.  Commit a9a3f1d18a6c ("perf
> s390: Always build with -fPIC") added compiler option -fPIC to CFLAGS
> for s390, which is used in C compiles.  Add -fPIC to CXXFLAGS for s390
> as well, so that it is also used in C++ compiles.
> 
> Reported-by: Thomas Richter <tmricht@linux.ibm.com>
> Signed-off-by: Jens Remus <jremus@linux.ibm.com>
> ---
> 
> Notes (jremus):
>      This patch applies on top of the perf-tools-next tree:
>      
>        git://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git  master
>      
>      Note that this resolves the issue discussed in thread "[PATCH 1/1] perf
>      build: Fix Python extension build with GCC 16 hardening":
>      https://lore.kernel.org/all/ahV2XGx_6h7upuc3@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com/T/
> 
>   tools/perf/Makefile.config | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index 333ddd0e4bd8..33f90968c8a9 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -109,6 +109,7 @@ endif
>   
>   ifeq ($(ARCH),s390)
>     CFLAGS += -fPIC
> +  CXXFLAGS += -fPIC
>   endif
>   
>   ifeq ($(ARCH),mips)

Reviewed-by: James Clark <james.clark@linaro.org>

