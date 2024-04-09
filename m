Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB04713E3ED
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 17:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712682105; cv=none; b=UL+BqXKtqmeys5PY+Y0z7wZnHBXUY2Dyz0iy6/ImgI62O32Pwj3TfAG7ukB1KJqExC5G+WEfP+5VnrCwCLLOmu0pOczrILvh1WVNHegQ5ZvqCHWYyaEwEED8K9+qvvIVv+r1m0MSOoD79Iy/UzTw0+kcIre/U6yj1z2fipEyUBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712682105; c=relaxed/simple;
	bh=lftnbDb228AtGqRmKG1GruD9Tdr0r/t4M1ad2PBgPI0=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=rVU4Isdw3oUOfj6eaPqGmnzBPEbq3YelMor1SCZpWY8qjDU3wjGDRcMrHgN1cL37UOKSZGFAh0kEQxidFA2SvosXDqvyckoJa9v1CMVKRJhdANqgrYwSledPQECrOfcXCCarvtdQKe7e/UP4SyMwiAPmgLwv6t0fbUE5JzeiW4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG3JgkBp; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG3JgkBp"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-416b5f6813cso6480935e9.0
        for <llvm@lists.linux.dev>; Tue, 09 Apr 2024 10:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712682102; x=1713286902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GsMNEF3lUCa87J+AsjZLBs3nM/4xYgj2UZQkqon9I0=;
        b=mG3JgkBpY2Hd0KGk6tJ+edQJN7OYyj/nbWg04LuT38CKSqxiVGG3FijEUirWNdPB5b
         rcHerfPoBjBEyuVTn/Omgmi1YKJePpb9wfLgbffPKm5OWrWX0QVBKA14QBFPJ3QUTCDt
         Wm6uQT+xPFW+IJST6Wf90qt0yzlPdbwadIYeCg2P9zcwLl1TFJ/e1NlYmA8ax+K7lXLi
         aCLboiRIDLzkGO1uFOlblmVMrpF61l0OAGYFIxceGyJlU0b9M2AnHHTI8fmMPwiuGLzB
         3+zLdCYRzVqbRJGvFTy7LuKR36XVUiE228AMmVo25pxzWjoUWOFqHEe9uDkbvrw03stA
         ckQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712682102; x=1713286902;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GsMNEF3lUCa87J+AsjZLBs3nM/4xYgj2UZQkqon9I0=;
        b=W8fAgJkNbtC+GVxVukFvlYWmajOVFlS+0FEwJ0Fc987c5xmLSEUPGICacADPOoTVtk
         R+ookgbzndK1s9jOTNmrCHRd+mg7VLgi3v1x8CdxWpZolvLeoZw2g4SE6UcB6p6bDqb1
         nNchApsPyNwSm5xmz28ptM8U8Pd/Hz4U2nAMiYdCUUl2XpGLIGogw7X2N2vhrjDU682D
         gYYWcIS4fqN8dUxF7FhGfYA5Sivn0U5ofG6ODWSYEtsIXQIjAxvsopc+kIvhsZ/NGeBQ
         2RwLRZFYDu+w8oXJCLtI8AgHXKzn7pQLxVucVEH4RzEPitpAdF+ZcSkVjNC2FSL7uXME
         oEVA==
X-Forwarded-Encrypted: i=1; AJvYcCXvm6TW9Oa1RfcXEnd3zVnepgdMJ2/ofg7aJfHCxPL2mXRa944iVKKYruTPPPeNhwzlKdssCd7TU1zIjtfS6SMjQm4vEw==
X-Gm-Message-State: AOJu0YzUGDiGWMskBuOl+BBsYp+LZVfOGN5zTfI2qnH212nunWmklZnp
	XKS5pfpU5Er4YZVVNMdUsQqvs8uyZzU3HP5V7TiOuu8C1ZJFuLGDX1s4urTNECo=
X-Google-Smtp-Source: AGHT+IElBhBg+n7nv1ufKcp4gnBNnHktsGfVzpiFGSrsNs4iqAFH5OsrMWEV2AOFNAmH/WjJusDm8g==
X-Received: by 2002:a05:600c:198c:b0:416:6b95:c631 with SMTP id t12-20020a05600c198c00b004166b95c631mr244269wmq.6.1712682102085;
        Tue, 09 Apr 2024 10:01:42 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id o34-20020a05600c512200b0041627ab1554sm21366717wms.22.2024.04.09.10.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 10:01:41 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] RDMA/mana_ib: Add flex array to struct
 mana_cfg_rx_steer_req_v2
To: Jakub Kicinski <kuba@kernel.org>, Leon Romanovsky <leon@kernel.org>
Cc: Erick Archer <erick.archer@outlook.com>, Long Li <longli@microsoft.com>,
 Ajay Sharma <sharmaajay@microsoft.com>, "K. Y. Srinivasan"
 <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 Shradha Gupta <shradhagupta@linux.microsoft.com>,
 Konstantin Taranov <kotaranov@microsoft.com>, linux-rdma@vger.kernel.org,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
 llvm@lists.linux.dev
References: <AS8PR02MB72374BD1B23728F2E3C3B1A18B022@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <20240408110730.GE8764@unreal> <20240408183657.7fb6cc35@kernel.org>
From: Edward Cree <ecree.xilinx@gmail.com>
Message-ID: <ca8a0df8-b178-31ff-026f-b2d298f3aa84@gmail.com>
Date: Tue, 9 Apr 2024 18:01:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240408183657.7fb6cc35@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 09/04/2024 02:36, Jakub Kicinski wrote:
> On Mon, 8 Apr 2024 14:07:30 +0300 Leon Romanovsky wrote:
>> Jakub, do you want shared branch for this series or should I take
>> everything through RDMA tree as netdev part is small enough?
> 
> Shared branch would be good. Ed has some outstanding patches 
> to refactor the ethtool RSS API.

For the record I am extremely unlikely to have time to get those
 done this cycle :(
Though in any case fwiw it doesn't look like this series touches
 anything that would conflict; mana doesn't appear to support
 custom RSS contexts and besides the changes are well away from
 the ethtool API handling.

-e
