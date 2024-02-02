Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2727214C59A
	for <llvm@lists.linux.dev>; Fri,  2 Feb 2024 18:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706897454; cv=none; b=RWU5SaVN5Zd+Vo0qaciIy/e5nJbiDPGbH7tool59orgDXZbDaVHcKjq6AJvvLnZNmrOVilc+a6FcTrSNfYr/QYKiAxu3wChJeFm7Nu/OEaC/Dny9o4lSV6dvy7N5YY4XMnbAVZGC+GmOxpO85uz72ugiDxeYojMWcP1McpfmAZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706897454; c=relaxed/simple;
	bh=Bz5RLrDSI2lz3eGrZ1BaBArmjYUlb+b6xEsdTMAn6jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OzkjeNTo0OtgFrmcUm/L4B97s3C/Yxzp8GNnbBuKAJrbbZpXfId0aFVXtTNyKaOoxR5X9vNH9yN8d+UBEnNZjw9ItdZ+J8wQ7upquYKkOOQiOtASlRRebpZ5yHomW6WIu8nl7QLWl5rTpeQAd1K/ev0a+wL1wCGVqzmX9uDLXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dN3di2NV; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dN3di2NV"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6041012c81fso24713347b3.0
        for <llvm@lists.linux.dev>; Fri, 02 Feb 2024 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706897451; x=1707502251; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T9UGts6nGQS3RkEfXeXcR2v8wnlBQKwVVYdgj9qNjJg=;
        b=dN3di2NVGHyAoqnHmqb7hX0a23gbO9uMIS40iMe/s6FMjnPn93fCXN2tAumE5IUjsc
         Tc4IYPiymqYGaAVONVdzjQxIGhp9phL2n1Wy/0/B1SmWvPyYK3apvKJlg1BtWb9k++6a
         FMInjwmyzqy2nme0bsYFM8rvhZ0y1JnQVbDBzLDwy/yYXbZm4gq2G8FO+fyE9fq71ST5
         gruHAbk3SDJCoOc13X/FdSJaZTMnEgCNScc0l3WuK9K9rm+8WF1bL4m/2ZZqygYn840z
         nrVc65H8Yg0A0K3tye7YC/YjG0CxF6V4NsciEWeQDh46NGgEmFLQ0JhrsBWTuO11/8ub
         pTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706897451; x=1707502251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9UGts6nGQS3RkEfXeXcR2v8wnlBQKwVVYdgj9qNjJg=;
        b=vOARX2a1UjAfzfZ4eTb3pQMZI5hzG2hVckWW8UvubQpeOjgXcM11ZWkBUQ6sKBYayv
         z13gjnPFHCdMI8onZzpjMx9W5FK7AzggvZjfZDMV81Oky9vYzqPLHygGckvs172uHDqv
         kkEWN/SwBEWmSIGVn5RQduD+hkse9b+8bug5bO+u1L/0bPWHhtuFCMLilFoNeDBp2JnY
         gAJurXQSqA3ONoPL7bQTV4HOyYIHcLzIXXMz8+FAUgsLtJN99pxnpF5+vJHI/VbOe0mg
         ozmoUo3RdGeDkZmqcSSos6+T2afaqgjev0FJjTGYxmJePPxD3OQgVCjTXnC7KyW5kRZB
         GnSA==
X-Gm-Message-State: AOJu0YzBKz37bcltXTsFcBIbcvfx72urqTxW8t4Ssd1/hL7Iyc7YUJRD
	Ylv89QxlD22oHGdAsGmG12MyrdIRxoVRK6PVh1cRzpcHJK/Bc2TKIJjbC4RvQdboI/XvCUNfZNT
	ELQ2GSEAdbXjxXH+HhTPmC0bJMordzPZ9u6Kv3g==
X-Google-Smtp-Source: AGHT+IEaGvHddmuizMRHJVxE6vTh6Fz0RMNu2HTzUn5QTT2/OptTAJOP+s9PzIaIo7n/qn5MsZwbga2DCIchY7JwDtA=
X-Received: by 2002:a81:b613:0:b0:604:ea3:6525 with SMTP id
 u19-20020a81b613000000b006040ea36525mr6745858ywh.0.1706897449670; Fri, 02 Feb
 2024 10:10:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240122102157.22761-3-brgl@bgdev.pl> <202402030101.nxmgLcAB-lkp@intel.com>
In-Reply-To: <202402030101.nxmgLcAB-lkp@intel.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Fri, 2 Feb 2024 19:10:38 +0100
Message-ID: <CACMJSetk29BXrb2ywuWPCsvkDn9k6+0gTbcxmZBUyJteJG2=hA@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 02/12] firmware: qcom: scm: enable the TZ mem allocator
To: kernel test robot <lkp@intel.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Elliot Berman <quic_eberman@quicinc.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Alex Elder <elder@linaro.org>, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@quicinc.com, Deepti Jaggi <quic_djaggi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 19:02, kernel test robot <lkp@intel.com> wrote:
>
> Hi Bartosz,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on linus/master]
> [also build test ERROR on krzk-dt/for-next v6.8-rc2 next-20240202]
> [cannot apply to arm64/for-next/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/firmware-qcom-add-a-dedicated-TrustZone-buffer-allocator/20240122-182633
> base:   linus/master
> patch link:    https://lore.kernel.org/r/20240122102157.22761-3-brgl%40bgdev.pl
> patch subject: [RESEND PATCH v6 02/12] firmware: qcom: scm: enable the TZ mem allocator
> config: i386-buildonly-randconfig-004-20240202 (https://download.01.org/0day-ci/archive/20240203/202402030101.nxmgLcAB-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402030101.nxmgLcAB-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402030101.nxmgLcAB-lkp@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> ld.lld: error: undefined symbol: gen_pool_create
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_best_fit
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_set_algo
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_add_owner
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_destroy
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_new) in archive vmlinux.a
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_pool_free) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_alloc_algo_owner
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_alloc) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_virt_to_phys
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_alloc) in archive vmlinux.a
> --
> >> ld.lld: error: undefined symbol: gen_pool_free_owner
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_alloc) in archive vmlinux.a
>    >>> referenced by qcom_tzmem.c
>    >>>               drivers/firmware/qcom/qcom_tzmem.o:(qcom_tzmem_free) in archive vmlinux.a
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

Huh, strange that it took so long to report it. Seems like QCOM_TZMEM
needs to select GENERIC_ALLOCATOR in Kconfig.

Bart
