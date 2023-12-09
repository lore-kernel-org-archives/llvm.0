Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5391D6B6
	for <llvm@lists.linux.dev>; Sat,  9 Dec 2023 21:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Q+niWgLU"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77f3c4914e5so169059185a.3
        for <llvm@lists.linux.dev>; Sat, 09 Dec 2023 13:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702157390; x=1702762190; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iFEUFFz09hiRyS0qcoPsXIF6VUSImKjj5WbLQv8dS3M=;
        b=Q+niWgLUwr2v/YhPPKKRWliHTNZKWj7aJvw7tKV1W2zTyG8T1GtgnhXsM4q5FVURB7
         zGSqh9zEJqdUXyFGuk5eriV1gqBc+ivVwrJdFjkb1ZOGJQMZFuE1uqPsvxGUEd81Vghr
         pFUduMrLueVc7ch24jlxgcYzLHkW7DSlO8c2QPNGEgxpbYcHk1ZOjOcCrlyUXIcGrgCv
         VWJ33d9WavnR0VTCMir+anvocSU3IbcDwt+lOM549FGVax01c9R+94a8mFR/8fdDi1v2
         TuHI3OKPyiL8nPOq4iMeoFZx2QIN21d2s/v7cvwfpP6UxD/TdMykh7Of7eiMEKBA0O/4
         4rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702157390; x=1702762190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iFEUFFz09hiRyS0qcoPsXIF6VUSImKjj5WbLQv8dS3M=;
        b=aaWc2ZTpvq38A2uESLOobh3dNW5qaUfpqr1sE4ihS0hXFiR5rMho33BI7vk2oWmNY3
         gVnl8rEfrDJ5IoVd0DMKUv41ZqmgQKAyzT/4ocrkuD5rkUuFPjyQXlwFMO6Q7fe4rzZ2
         HpVQ0TcUcnaJJi/oB9KZBdf6Hmwssi0F6H4nmKvw5XJG4Ssfx2jvZJIF7wenCPKNpxR6
         xv1DRBJCqPL2qQDajg7bz+Ko/dl9RTqoXKM299rU/UvBw3lFSCtoxqul0Xv/KsB8JW3D
         jX6snR9aM5EZHXRYSVDdsFQGqw22ImCCnT4ahxApwDSSq9iJy5MriBP4W/bn2FPLCIwy
         yoZw==
X-Gm-Message-State: AOJu0YyLArHr28PfAnpzpx6oLRQjC5FbpswcBZUgN+Frcs5SOc5smzzV
	iJFMk5856YH3y29ou+hxdCMSbA==
X-Google-Smtp-Source: AGHT+IFocs3LkyA/Jt/FCqhjxzgRz8AgbQ0brbt26sXxD73qHkqT5u0QLdYWPcmh/VTk8arvnDsjzw==
X-Received: by 2002:a05:620a:8112:b0:77f:61d3:734c with SMTP id os18-20020a05620a811200b0077f61d3734cmr1598295qkn.43.1702157390147;
        Sat, 09 Dec 2023 13:29:50 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:f559:1d79:8a5d:590e? ([2600:1700:2000:b002:f559:1d79:8a5d:590e])
        by smtp.gmail.com with ESMTPSA id tn24-20020a05620a3c1800b0077f052fa73bsm1662198qkn.15.2023.12.09.13.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 13:29:48 -0800 (PST)
Message-ID: <07d27191-12b6-4c84-b80e-75c618df9de4@sifive.com>
Date: Sat, 9 Dec 2023 15:29:47 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
 <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
 <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <5090a015-5b6f-44be-bb25-d2ca3fdf5d40@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 2023-12-09 2:38 PM, Arnd Bergmann wrote:
> On Fri, Dec 8, 2023, at 06:04, Samuel Holland wrote:
>> On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
>>> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
>>>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
>>>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
>>>>> architectures. Enabling hardware FP requires overriding the ISA string
>>>>> for the relevant compilation units.
>>>>
>>>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
>>>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
>>>
>>> :(
>>>
>>>> Nathan, have you given up on these being sorted out?
>>>
>>> Does your configuration have KASAN (I don't think RISC-V supports
>>> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
>>> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
>>> or KCSAN in dml2")?
>>>
>>> I am not really interested in playing whack-a-mole with these warnings
>>> like I have done in the past for the reasons I outlined here:
>>>
>>> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/
>>
>> I also see one of these with clang 17 even with KASAN disabled:
>>
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
>> warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
>> [-Wframe-larger-than]
>> void dml32_recalculate(struct display_mode_lib *mode_lib)
>>
>>      ^
>> 1532/2208 (69.38%) spills, 676/2208 (30.62%) variables
>>
>> So I'm in favor of just raising the limit for these files for clang, like you
>> suggested in the linked thread.
> 
> How about just adding a BUG_ON(IS_ENABLED(CONFIG_RISCV))
> in that function? That should also avoid the build failure
> but give a better indication of where the problem is
> if someone actually runs into that function and triggers
> a runtime stack overflow.

Won't that break actual users of the driver, trading an unlikely but
theoretically possible stack overflow for a guaranteed crash? The intent of this
series is that I have one of these GPUs plugged in to a RISC-V board, and I want
to use it.

Regards,
Samuel

