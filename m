Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BF2221272
	for <llvm@lists.linux.dev>; Wed, 16 Apr 2025 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744806042; cv=none; b=jId3Kw4wz0Dddoi8wBzuri7jvsF3ukfNvUB6NpFwoVWi+DwROvmRKAKzoM9swsIQOy3z+2vxVFVtB+djRqLpMlukdBLR/BsX4S+2YickKkoWKYLpaFj1C723PBJN2GSd7ACMg8/qxFLjK7TSjafI510YYaJLTNEx0bNAR4CbWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744806042; c=relaxed/simple;
	bh=WaTSUYK1hMxKOQ6WiHv2mnmP1BM+kYKbkKvvvb2454I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=APIkZM47R6G5W2tXOnWlYMJu9mZfP8A+T8NfVmQkQOmcFsO/bpk105zwDFvZI4Z/B/a8VFI7O/bP0qoJZiBUNTMlP3PepxvXF0VpJrcy5GFdzp6n2FfuU/7zPO3j0IvA4sKnGeLfUEgxsKGhrIdpGCivR+wuL1CUkukk/xcEjn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=AxDEobPs; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AxDEobPs"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-861525e9b0aso478130239f.3
        for <llvm@lists.linux.dev>; Wed, 16 Apr 2025 05:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744806038; x=1745410838; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHOXMSmibh9YxF/cJXula+hYg363zDSu6L63qFd8Pf0=;
        b=AxDEobPsrf0BGKQQyApQxyDwmDrJ+H0suKmyN3LPZCWE0khfP7xypcLEzK8W+TE8KN
         C1zHhoq8IOZxubqakM+MaDnzbeR9JYwlrUgYZhEz8B1I5N2VVMPs3Jnz8TesBH8fmAcM
         4Vln6JARwK5tcaZTDW20EYFdEIYdimUED1iBef3czHevsw/r++jzMKpfNzcoOB4PVmcd
         1IMSYToxIo+60i21DfZ9ttlN5n0kW7nRVR/CZhcwxU0bcsfTBYXZUvcB6ix69/uOgAfz
         ML/72prwi33Q9B7FeClaUp0p1Bd4/6P4/Zsy75BzwKNnGIDGh1e4YP4dj62vPBvtEfBR
         GnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744806038; x=1745410838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHOXMSmibh9YxF/cJXula+hYg363zDSu6L63qFd8Pf0=;
        b=mRZVUOegnrWEUx9VHj51ZJZVWbayS31x3P1XVhdoWapqsKlbgGmj8J66AOI/qqB0wr
         0GBgMDYL/cmqEIS+33EKERmAKFVNtInD1y9U1G0xTKcNPsxIceO3shJflrSbpJd80Dzp
         Auwg/cAmlxjRK/uVtKf7VNES1dIx7LnhbIFGRmiY6T+DDnFMw+OvNR2JpAfce9cgJwNo
         lAxLz1uQIhsYZUcIO86RlF9iaSjWUZTssIQ7YePDvSsijPNXbCFH2Lhnun115XCbTulw
         /oeg/gs7nTXuuS2x+L0mpik0VZY3QK1E0RH4WP40iczaohF1RyuNkwmqqvSkLl2/Pz9g
         wjVA==
X-Gm-Message-State: AOJu0YxCUilJ04Xwh8rMRwS54cTgE+oQ43AlT0BnFOcrfuDYoqsP6kDM
	9THHJGv/bOupTS3EMsb6mTUn+LmrW0d78bGeDLiU+DTMOTWEPD95g7+T/UERHV/hFkrtbK+9XuQ
	w9KQ=
X-Gm-Gg: ASbGncvEDgAVPc4Z/VWWiidvGTYmMXVo4xLaZM4eQ7UenzGqLDPkE4QG6uAAPiMH9U4
	5ZvpHtaaNN1uh58wJLSSM8jthiWE5qvnYT9UYUl7MGCOCaZIi+dryZf6e/pDi885ftSxZyK84R5
	YIDs5mDqE9B17aMVpcDw7AO+gEILl5uZkLFNF3D3DbSykwaL7Ze6oTZpVjAstDZT779ktJEtKiL
	FXs0dqwrEjMPaqBOwkMQaQ5SHt5KEyUGUjUhLVrkVDXy2//FlkqmF8I6tRTl2YhL6ERXIlE7acQ
	G73hNHjALqskZ+k/5KyipIOn3hK6H+1RhY3E0ys3Qkis1KOJMF1rKTCdnyCh2OA5c6K2pkXxc2V
	85PJb
X-Google-Smtp-Source: AGHT+IHMbZ4MBgMdxEe56ThzGgfclttS+FisMoQtlDjaHIQBfnLNjjLI8JRFK/A93FU4XEoVTlZziw==
X-Received: by 2002:a05:6602:1fd6:b0:861:c732:8cd0 with SMTP id ca18e2360f4ac-861c7328ce9mr103156339f.0.1744806038403;
        Wed, 16 Apr 2025 05:20:38 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505dfdf6fsm3619310173.85.2025.04.16.05.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 05:20:38 -0700 (PDT)
Message-ID: <10f1ff34-5a34-4a18-b0e7-010c407190fa@riscstar.com>
Date: Wed, 16 Apr 2025 07:20:37 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1:
 error: initializer element is not a compile-time constant
To: Haylen Chu <heylenay@4d2.org>, Yixun Lan <dlan@gentoo.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>
References: <202504152107.7ekGPIrF-lkp@intel.com>
 <564eb8e7-a4e1-49e6-a79d-da880a526540@riscstar.com>
 <20250415143137-GYB30887@gentoo>
 <9b52f950-9baf-4293-b211-82891b6f349e@riscstar.com>
 <Z_-eYhc2kZrVoL9m@ketchup>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <Z_-eYhc2kZrVoL9m@ketchup>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/16/25 7:11 AM, Haylen Chu wrote:
> On Tue, Apr 15, 2025 at 11:03:12AM -0500, Alex Elder wrote:
>> On 4/15/25 9:31 AM, Yixun Lan wrote:
>>> Hi Alex,
>>>
>>> On 09:16 Tue 15 Apr     , Alex Elder wrote:
>>>> On 4/15/25 8:44 AM, kernel test robot wrote:
>>>>> tree:   https://github.com/spacemit-com/linux for-next
>>>>> head:   9ead3efbc88a21e9a1f38948cc0902518022a2e5
>>>>> commit: e2d238ba301f25a5c8a7d490a36f9cd014d7aecc [4/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
>>>>> config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/config)
>>>>> compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
>>>>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/reproduce)
>>>>>
>>>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>>>> the same patch/commit), kindly add following tags
>>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202504152107.7ekGPIrF-lkp@intel.com/
>>>>>
>>>>> All errors (new ones prefixed by >>):
>>>>
>>>> If I'm interpreting this right, this seems to be a problem on
>>>> a S390 build (under COMPILE_TEST), because there is no constant
>>>> version of the __ffs() for that architecture.  This might be the
>>>> case on other architectures as well.
>>>>
>>>> On RISC-V, this is fine.
>>>>
>>>> Any recommendations on how to address this?
>>>>
>>> it occur to me the __ffs() isn't really necessary, since all input
>>> is constant value (GENMASK here), we then should know the shift..
>>
>> I asked Haylen to make this change.  Yes, we know the
>> shift, but I much prefer specifying only a constant mask
>> (which implies both the shift and the width) rather than
>> a constant mask and shift (or width and shift).
>>
>> If there's no way to avoid this S390 compile error, then
>> adding the separate (and redundant) shift value back
>> into all these definitions is a solution.
> 
> We could avoid the redundancy by specifying only width and shift and
> move the call to GENMASK() into the macro, see my previous reply. To me
> it doesn't look very different, it's just about where to invoke
> GENMASK().

Do what you like to fix it.  What you suggest is fine with me.

					-Alex

>> 					-Alex
> 
> Thanks,
> Haylen Chu
> 
>>
>>>
>>>>
>>>>
>>>>>
>>>>>>> drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
>>>>>         241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>>>             | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>       drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
>>>>>          33 |         .num_shift      = __ffs(_num_mask),                                     \
>>>>>             |                           ^~~~~~~~~~~~~~~~
>>>>>       drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
>>>>>         242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>>>             | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>>       drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
>>>>>          33 |         .num_shift      = __ffs(_num_mask),                                     \
>>>>>             |                           ^~~~~~~~~~~~~~~~
>>>>>       2 errors generated.
>>>>>
>>>>>
>>>>> vim +241 drivers/clk/spacemit/ccu-k1.c
>>>>>
>>>>>       239	
>>>>>       240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
>>>>>     > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>>>       242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
>>>>>       243	
>>>>>
>>>>
>>>
>>

