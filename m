Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB52D641
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 05:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="jqskjqxl"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4b2cef60577so452140e0c.3
        for <llvm@lists.linux.dev>; Thu, 07 Dec 2023 21:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702011884; x=1702616684; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YCezDiITLYZlXZkoiENFPkRYgXSgvqAlJqwCHapkHlo=;
        b=jqskjqxlZJTQdyhmJWIx6O1zjzN3vc4oXlMBp9LYxqFF0kl5od2lbf5qne3GSJusEZ
         Hi8gfSULfxjABdZfd6/i/ezKUFUl5zlxd55Y3a9mSDvPibsS64VAs4kXwq6466NzTqU7
         R/mXTOvOG5+VfiB/uSBKhCig7iggZDmN6wUXTyfXpKhHZKp2YTVnnR/DHsWhKnA+AW4N
         X7tJukbGDKHe5rGKNX7Qtx7G+0ywPvPAbFhfjqoNhpJA+OBM7a8p/tE1eJYxgCoiXbZE
         G+Iu7vGk1m0tLIOaYThtF+k60PjkUVSaiD5guI0PHa793N1YKT9AghbKgg+0iubVWXkN
         pZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702011884; x=1702616684;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YCezDiITLYZlXZkoiENFPkRYgXSgvqAlJqwCHapkHlo=;
        b=vGrIyAWpSLGKlcP2VFb8WhsVQDX5AW9inw+b6OepG2qf/XmsVKgchZJexMJE3wE0Sh
         Om1WjQW3kXGyF350QhAqzM9HXKETAyEoh1cV8vV4JadaUxKRniY38h0G6Dkpr9JLo7LB
         fxtfI9E35xfbKDtyBt9Z0mdH7/rbvYEReX9pZ5UfHosiQwfM78Qj5J6FMFgDZ7aqmgY9
         E63dwXmcpSgaUGlNk7UfH+3yyF6SwdbVYJp/udG8M9Y+4IbAQzQ7dZAa+ApAMiDmj5Im
         Q+fyo2rURemFhbMoZUQ6KdgChWJqhN4FXqfy+8MuP65gdKg/857GXuuCaw661Q8W7aUn
         SZgA==
X-Gm-Message-State: AOJu0Yxa0ROCjeK/L/rxyK7TxAZ2Xw9DTtNpGpb4moqDcs8tNzLimqx9
	UF3qQ+CYDztwE+uhGWUwkvVpeQ==
X-Google-Smtp-Source: AGHT+IHd3xhGQZwcUIcLtaS/NPIhQH51OI4srkcBz6UdtbLizYUKJjw8nicEQTdHb0F/v/M3ROTE/Q==
X-Received: by 2002:a1f:c843:0:b0:4b2:c555:389 with SMTP id y64-20020a1fc843000000b004b2c5550389mr2948641vkf.31.1702011884531;
        Thu, 07 Dec 2023 21:04:44 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:41c5:bf1:860b:1e95? ([2600:1700:2000:b002:41c5:bf1:860b:1e95])
        by smtp.gmail.com with ESMTPSA id i14-20020a0cf38e000000b0067a33133420sm494592qvk.110.2023.12.07.21.04.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 21:04:44 -0800 (PST)
Message-ID: <4f277982-fffb-4fe1-bc02-007633400f31@sifive.com>
Date: Thu, 7 Dec 2023 23:04:43 -0600
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 llvm@lists.linux.dev, arnd@arndb.de
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <20231123-headdress-mold-0dd7a74477f7@wendy>
 <20231130004224.GE2513828@dev-arch.thelio-3990X>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231130004224.GE2513828@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Nathan,

On 2023-11-29 6:42 PM, Nathan Chancellor wrote:
> On Thu, Nov 23, 2023 at 02:23:01PM +0000, Conor Dooley wrote:
>> On Tue, Nov 21, 2023 at 07:05:15PM -0800, Samuel Holland wrote:
>>> RISC-V uses kernel_fpu_begin()/kernel_fpu_end() like several other
>>> architectures. Enabling hardware FP requires overriding the ISA string
>>> for the relevant compilation units.
>>
>> Ah yes, bringing the joy of frame-larger-than warnings to RISC-V:
>> ../drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:58:13: warning: stack frame size (2416) exceeds limit (2048) in 'DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation' [-Wframe-larger-than]
> 
> :(
> 
>> Nathan, have you given up on these being sorted out?
> 
> Does your configuration have KASAN (I don't think RISC-V supports
> KCSAN)? It is possible that dml/dcn32 needs something similar to commit
> 6740ec97bcdb ("drm/amd/display: Increase frame warning limit with KASAN
> or KCSAN in dml2")?
> 
> I am not really interested in playing whack-a-mole with these warnings
> like I have done in the past for the reasons I outlined here:
> 
> https://lore.kernel.org/20231019205117.GA839902@dev-arch.thelio-3990X/

I also see one of these with clang 17 even with KASAN disabled:

drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:37:6:
warning: stack frame size (2208) exceeds limit (2048) in 'dml32_recalculate'
[-Wframe-larger-than]
void dml32_recalculate(struct display_mode_lib *mode_lib)

     ^
1532/2208 (69.38%) spills, 676/2208 (30.62%) variables

So I'm in favor of just raising the limit for these files for clang, like you
suggested in the linked thread.

Regards,
Samuel

