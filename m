Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4962DFA2D
	for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 16:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744732998; cv=none; b=C2mUVOdtRBHDdqxw039vo45BcvVRmseFjKiW95K18JC3/r3KBqTFgVjwmMHnIm9ItIyA1ALjePVLN1B948+Lz1K17kEqb124YlFrGolPsMF3c1AtQDcE2IURtIQLytkL+P0gF0d4HHJZf8MIokeRfhtKmCbTWf1x8qN/JxUn+Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744732998; c=relaxed/simple;
	bh=lYBkXbwh08npPqWg5a/3LlWt/j3jbuo6HOEpkAE6jTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhaoTKeVPCaPgYeBYZ353eAgPTfcOqevTWiaNf1XHAFGGJrq2PwAIvOdfL2lQhd+uMkBdW+N+HwUfw0L6d5T/Q1AZuh7ceicQtJC2BuhpBfMizCzojk4ia/rTDm+laRCqVhN4OAsohW26QryCmTyk20JlJkBox2e5EkOyc0uRVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=sFdvHZB9; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="sFdvHZB9"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d5bb2ae4d3so20649325ab.0
        for <llvm@lists.linux.dev>; Tue, 15 Apr 2025 09:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744732994; x=1745337794; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vya5laCOwqQD49KDWVQh568j1mmJYzr4WruJF+Ip7NE=;
        b=sFdvHZB9+14fDjMKVbCJO9Ndy3dQFq1OZywQjj8udWIUDyaWfOmC6Isqlir/nZ+fXu
         QNXGDmydr8e6yaa8aw9+yL4A3941SvDI8MByWsEBIaUbTpQr9OnJf2PZ04tD/mGgrvLN
         zSZhmTQvixxcK+n8+tJBdXSYIpTfToQq2snykfi0KrwVRPm6Hi3g+UQxUKD7otHXgUsH
         UTIqIrgKsrKT4kNvUmDGWqtjuZT7Pg6WFA8x0oBYXx9l9jyt0yVWBCOvajeFJDWos49d
         hoYpQuqYWRrBzpiyKulL6vYJS0VjjlxNxF3qaZNZlCS2272VyuF8kIrTnSOKCA6JT4kQ
         v/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744732994; x=1745337794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vya5laCOwqQD49KDWVQh568j1mmJYzr4WruJF+Ip7NE=;
        b=R6RowheUnXxOLrP1oy5cX6aBUQJxzV1u9I/LATrBKeYEm7AjcxNqu3i+I8yX73/ebV
         bcmxhmA7FCZSityUVQRR/EFeqvHBRcjCqGzI+J8kRHcQgV+0Zle0sFi/kkliF3H12glK
         muN9RVRZYi1M3Vk/B+AbhaVQbti0ztwCIr963JHs3ydiCBUhHDAQ/IlyxpQgT/6vECiL
         4x6pvEO8I4I28vFXoQo/CnlK16lITXNPFkXvXos0wmenotShaXrhDGzFQwWIbkWzKeXS
         bsW5dV36oqZA9xxTlX0PhuvkWm/4bY2dbkaDl/n9vUOG+/PIg7RIwKlPyYX/0v0Bbbd4
         Dl1w==
X-Forwarded-Encrypted: i=1; AJvYcCW6jAziouEUvcNseA4TNPdxmfcgtemA2WGP5T5DcmRPXthuCfyQ4Ce0AQb05s3yGtD/qYmZ@lists.linux.dev
X-Gm-Message-State: AOJu0YzYYBqHT0T5uG3LcZRzgTfDsL+3b/kg4W9o+MX5ADI4PVS5SCLJ
	ecNchp6f0LBtleJovqsA7WRn+JRnJTTTw6ZR7S+jxzuFFqC9mh7SCOVRhz2viXc=
X-Gm-Gg: ASbGnct72cEt3UGCGx9VA+hRXKUl+drUnxx+aOUe3i+KAT3IDTXcUwj2QarK9zf6TNY
	yc3vVbEIPAib0WXqzp2cZ1VhuLiS/62NbJcNI7fE2yG1MERL/Y60k4SB8bKlB5eE2b4GnYCchvw
	JhQ6o42yZiEtRnKMPnlEe6uqJ4sNjo2drVlkU9EBqZr9LefgCwJzIIczZ/V+D2TptrETxBt906r
	n8pjYBX8Rmo0Ke/Qo2yhXKubspVkiqPrJxs8ok2wKizaDa+DoPTWVeeuB9mSQh1F6p8T3dUjO8K
	boxuL/gsDQImx/3CVppBxZ+prrtNmo5OApmasiBx0iFWJjZSCcVI7jxBwY1qA7izdXTgRyioykS
	J0+da
X-Google-Smtp-Source: AGHT+IEtlCnnPDJ3cn+xWJLo5c8wTQqAyZYlX57UyLdVGhBFJ6IychxlTyKQMafYoxog8e9tbRNzeA==
X-Received: by 2002:a92:c267:0:b0:3d6:cb9b:cbec with SMTP id e9e14a558f8ab-3d7ec1ca79amr139889325ab.5.1744732994213;
        Tue, 15 Apr 2025 09:03:14 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dc5828c3sm33962785ab.48.2025.04.15.09.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 09:03:13 -0700 (PDT)
Message-ID: <9b52f950-9baf-4293-b211-82891b6f349e@riscstar.com>
Date: Tue, 15 Apr 2025 11:03:12 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1:
 error: initializer element is not a compile-time constant
To: Yixun Lan <dlan@gentoo.org>
Cc: Haylen Chu <heylenay@4d2.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>
References: <202504152107.7ekGPIrF-lkp@intel.com>
 <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>
 <20250415143137-GYB30887@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250415143137-GYB30887@gentoo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 9:31 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 09:16 Tue 15 Apr     , Alex Elder wrote:
>> On 4/15/25 8:44 AM, kernel test robot wrote:
>>> tree:   https://github.com/spacemit-com/linux for-next
>>> head:   9ead3efbc88a21e9a1f38948cc0902518022a2e5
>>> commit: e2d238ba301f25a5c8a7d490a36f9cd014d7aecc [4/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
>>> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/config)
>>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/reproduce)
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504152107.7ekGPIrF-lkp@intel.com/
>>>
>>> All errors (new ones prefixed by >>):
>>
>> If I'm interpreting this right, this seems to be a problem on
>> a S390 build (under COMPILE_TEST), because there is no constant
>> version of the __ffs() for that architecture.  This might be the
>> case on other architectures as well.
>>
>> On RISC-V, this is fine.
>>
>> Any recommendations on how to address this?
>>
> it occur to me the __ffs() isn't really necessary, since all input
> is constant value (GENMASK here), we then should know the shift..

I asked Haylen to make this change.  Yes, we know the
shift, but I much prefer specifying only a constant mask
(which implies both the shift and the width) rather than
a constant mask and shift (or width and shift).

If there's no way to avoid this S390 compile error, then
adding the separate (and redundant) shift value back
into all these definitions is a solution.

					-Alex

> 
>>
>>
>>>
>>>>> drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
>>>        241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>            | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
>>>         33 |         .num_shift      = __ffs(_num_mask),                                     \
>>>            |                           ^~~~~~~~~~~~~~~~
>>>      drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
>>>        242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>            | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>      drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
>>>         33 |         .num_shift      = __ffs(_num_mask),                                     \
>>>            |                           ^~~~~~~~~~~~~~~~
>>>      2 errors generated.
>>>
>>>
>>> vim +241 drivers/clk/spacemit/ccu-k1.c
>>>
>>>      239	
>>>      240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
>>>    > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>      242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>      243	
>>>
>>
> 

