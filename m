Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A48918FDAE
	for <llvm@lists.linux.dev>; Tue,  3 Dec 2024 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733216229; cv=none; b=U8HrJig+FZAzjehglbUbbVc9pXmMKre6nfii4MDlTSslzkGte2tTyKzqbzYbxx3pY2nBA+CNaWZVDCMtlULtUxNiKIpd0/9azTEYg2kUe0MYJvV93cqYTbUoGCuxkDz3VeJe/vJxNfYyOHIofUBv6tx13o1q9OI8j5fDzZHnxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733216229; c=relaxed/simple;
	bh=OOceX6kz0XXbimZbAprvOOOhYfdQDD8f85dFSF0Tppg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkiAm05CLETStVwoiGd4c22ap5AQYN+SdecoNYvg6pc5BLL3+g99GEYytH9VR5St+ntNGDsGYbF8qEmar2exXzcJodc/rGcxPcWvcVBAYJL1Z85zN1nK6Jd14l6xEnotHNWPPaMM8+PeqnqcmdyJyR/IRjv9BKAqVF+RtMwkSms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GvjhslKr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GvjhslKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733216227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGHz7ghiBxVIbssf5/hQmDMUZC5ROBwA/LtGFN8UTlY=;
	b=GvjhslKrT9P2RCxCy/xOVSLKPaMoJWqo7ndZYINUjcYSKS6B8E391OGfZ76FNeyQYc9zAx
	z3r3+X5emx/gynmEXFpmNJ7n0izf5wVzRbw+Ac8St2WAWYlndi2LuD4vuTsoQcYp/fksr8
	wa6MSg50QuK9Czuh7E7ZioLrINMiG9A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-lmAZ_DzSOcSPFMgDJbKbKQ-1; Tue, 03 Dec 2024 03:57:03 -0500
X-MC-Unique: lmAZ_DzSOcSPFMgDJbKbKQ-1
X-Mimecast-MFC-AGG-ID: lmAZ_DzSOcSPFMgDJbKbKQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ee5f6fa3feso5127244a91.0
        for <llvm@lists.linux.dev>; Tue, 03 Dec 2024 00:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733216222; x=1733821022;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FGHz7ghiBxVIbssf5/hQmDMUZC5ROBwA/LtGFN8UTlY=;
        b=LlPLOgI8JeJyTk0hIDa1wnxOfvnW9fYMISgop/k1XuCyaCqYVVD/Yq+3a1SS7FxVIo
         TrqL+hp96UgSjHMLWrd5k01p30lbRIz7tFspweDzd7Aq0nYuxvT5Aez2nNFnHK4qMhK5
         t9Mr5H3FEEzyKZwv/OSxjen8o499+0PoY2OOT39ighgjEpDr6pnvR/Auy0Jt/RPhvNFX
         +Oozzms7JCa7JMvKRf7ILVDTYDDgPKDoQaOde4d0FGRDnKWJ/bPRWPFQA8ZX1d74v8xs
         wHVYTbSx328TYyDfm5/oQzE9HC3M8UR3e5lFxhZko7+eu3qyPrg05+fz7ZYQPI3cZ67i
         urZQ==
X-Gm-Message-State: AOJu0YyvBE7X6CqQgkKOO3n0gI9ZMUeLs018MOpDtDtEpsR8FE3Tn39N
	PkcKyR13sGqwgQHYDKkU8rSYXr5m3f19fuz0PFA0Thk1Y8ewmVgYexYUTYw/WnCNpt/5hU27tBC
	5sOdw/AX0i+dhlU3R4EDBy7dBS/ieF+dSXjXaNcIrm+brM5RK5Vw=
X-Gm-Gg: ASbGncvrP/7i+XJ5zL3+Ind6Pynxko8X5gCb9Y1GPtJ1eV8H082e2UgAM30cNZncaYa
	xKGow+nMr5bdBR1HCMViwNtGT8OLZH3UL0G1lTImlE+1Gijw1baLfdCqfVcWQCGyJrXahd90qQK
	lF4JOt6rfUAk3HYAeCXoqBxx8RbMA+M9lEEQBSvk+VlbNt9WXz1PSOwT6w3oglu0l3pyeIxtvsm
	LcOZVeolTi+eKkkzuiERDoWh3Tslemu2DYkq0xa+FVhmEnBgnI=
X-Received: by 2002:a17:90b:33c6:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2ef011e4926mr2503895a91.7.1733216222622;
        Tue, 03 Dec 2024 00:57:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIcOl4s6XHMdDXHxmOpeH3xZ9kLRLW+50zloAvOHAMK7Z7v1F6jBYhjBcR7dhJA5/1Z8PpzQ==
X-Received: by 2002:a17:90b:33c6:b0:2ee:ee77:2263 with SMTP id 98e67ed59e1d1-2ef011e4926mr2503625a91.7.1733216215342;
        Tue, 03 Dec 2024 00:56:55 -0800 (PST)
Received: from [10.72.112.157] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eead160674sm4605513a91.3.2024.12.03.00.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 00:56:54 -0800 (PST)
Message-ID: <b1923d68-726a-4864-8661-54588a634d95@redhat.com>
Date: Tue, 3 Dec 2024 18:56:49 +1000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: kernel test robot <lkp@intel.com>, Jeremy Linton <jeremy.linton@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 steven.price@arm.com, sami.mujawar@arm.com, suzuki.poulose@arm.com,
 will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org
References: <20241203000156.72451-2-jeremy.linton@arm.com>
 <202412031348.bp5i3ws2-lkp@intel.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <202412031348.bp5i3ws2-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ASP2anH10-9M8_yB0io1LtCL9-1p1km-l6P1NE8pkso_1733216222
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/3/24 4:03 PM, kernel test robot wrote:
> Hi Jeremy,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on arm64/for-next/core]
> [also build test WARNING on linus/master v6.13-rc1 next-20241128]
> [cannot apply to kvmarm/next soc/for-next arm/for-next arm/fixes]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Linton/arm64-rsi-Add-automatic-arm-cca-guest-module-loading/20241203-080347
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
> patch link:    https://lore.kernel.org/r/20241203000156.72451-2-jeremy.linton%40arm.com
> patch subject: [PATCH v2 1/1] arm64: rsi: Add automatic arm-cca-guest module loading
> config: arm64-randconfig-004-20241203 (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/config)
> compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031348.bp5i3ws2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412031348.bp5i3ws2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:21: warning: attribute declaration must precede definition [-Wignored-attributes]
>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>           |                     ^
>     include/linux/compiler_attributes.h:356:56: note: expanded from macro '__maybe_unused'
>       356 | #define __maybe_unused                  __attribute__((__unused__))
>           |                                                        ^
>     include/linux/mod_devicetable.h:607:8: note: previous definition is here
>       607 | struct platform_device_id {
>           |        ^
>>> drivers/virt/coco/arm-cca-guest/arm-cca-guest.c:224:55: warning: unused variable 'arm_cca_match' [-Wunused-const-variable]
>       224 | static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>           |                                                       ^~~~~~~~~~~~~
>     2 warnings generated.
> 
> 
> vim +224 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
> 
>     222	
>     223	/* modalias, so userspace can autoload this module when RSI is available */
>   > 224	static const struct __maybe_unused platform_device_id arm_cca_match[] = {
>     225		{ RSI_PDEV_NAME, 0},
>     226		{ }
>     227	};
>     228	
> 

The definition may have to be something like below, to avoid the compiling warning.

static const struct platform_device_id __maybe_unused arm_cca_match[] = {
        ...
};

Thanks,
Gavin

