Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFAA2570
	for <llvm@lists.linux.dev>; Tue, 10 Jan 2023 07:45:47 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c4-20020a1c3504000000b003d9e2f72093so6262726wma.1
        for <llvm@lists.linux.dev>; Mon, 09 Jan 2023 23:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ym5EqUyMGd6MRtXTTvcbTiCkzoNwWDdejFtLQlPuxB0=;
        b=EPKaq6ewhBu41grF4XfiubFBJGlurxUmCD5RF6TKYuGPhnksHKacrCCw9qdNP3N/9W
         7zlNeQI2tfq/njNFi8ei9y12WlVdjyS6DVN2MapauFVaNnDOJPsSQppMEdpR171yJ3dJ
         H0KEn4Dnogt0Hh6Dc+399mTYauzcj2qNCGEf1gD2V5Z/7TGzOhi38BgKDULGZYiLfeNh
         n/h5ehrjXyiQnXSTHRJLs80NwglLgV3V7nsf6w1wQJ5Ifbg8HDMcUL3XFwOirMnoXQcp
         NG3DzgjK/FWIb7ZAd0Z5fA20dnG5u2+shWt89tkiUvjYjUwKtC6O1zgAFoIm0+bv04cH
         huow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ym5EqUyMGd6MRtXTTvcbTiCkzoNwWDdejFtLQlPuxB0=;
        b=WAm7AjwqB07NA+JTwZccTmv5Lo2lNR3ac2Co5DPKNSe0D+BT9AqvkQ8Zwap87kdY7P
         JeJHN4OlX2XIyXZcB9ltZDdUU9x9BKt9XQ3qKVUcwQo4J/k3LVqoTGxgoqgGWXW56UT9
         lX5RLf02/QfalCqyA2OJNpba7IwZyyfXHX2JBz+TLxw8JKOC1hMKb4wkfwOrdigXjIbB
         54Lep3uMuH9rZ1iSHRjliWdYGCObC9g3mkiCI6ftug3vn4MihBMaHhX/6/whAPjH4ygM
         /iH4k5D0jWeDWJzSK+Sa/xAuDmL4QV/uvDQZyH0ExEK18sE2k4hR/8s/pMUOE4iqvikL
         GrCw==
X-Gm-Message-State: AFqh2kpHvbDaLWbuI5udFIxbhr3ZWf97TZfZhsPycl/qcYRN6WsAOMjn
	tRPd129VwLhXRHCIsQXRh7ZWcQ==
X-Google-Smtp-Source: AMrXdXt/e6dIeeujZIpS+wXo8XxrNMqZtTXHeNjs5aWlgAtIaoQC+vokYN4jhRaXIDBKSBiPhCJh+A==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id h6-20020a05600c350600b003cf803bd7ccmr51575286wmq.33.1673336745840;
        Mon, 09 Jan 2023 23:45:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id j30-20020a05600c1c1e00b003cfa80443a0sm15633046wms.35.2023.01.09.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 23:45:45 -0800 (PST)
Message-ID: <cbaa007c-c3d9-d522-b984-b8c11d1efc26@linaro.org>
Date: Tue, 10 Jan 2023 08:45:43 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 02/14] MIPS: Always use -Wa,-msoft-float and eliminate
 GAS_HAS_SET_HARDFLOAT
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org,
 ndesaulniers@google.com
Cc: nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-2-658cbc8fc592@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-2-658cbc8fc592@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/23 20:54, Nathan Chancellor wrote:
> -Wa,-msoft-float is tested with as-option, which will be a problem for
> clang with an upcoming change to move as-option to use KBUILD_AFLAGS
> instead of KBUILD_CFLAGS due to a lack of '-mno-abicalls' in
> KBUILD_AFLAGS at the point that this check occurs; $(cflags-y) is added
> to KBUILD_AFLAGS towards the end of this file.
> 
>    clang: error: ignoring '-fno-PIE' option as it cannot be used with implicit usage of -mabicalls and the N64 ABI [-Werror,-Woption-ignored]
> 
> This could be resolved by switching to a cc-option check but
> '$(cflags-y)' would need to be added so that '-mno-abicalls' is present
> for the test. However, this check is no longer necessary, as
> -msoft-float is supported by all supported assembler versions (GNU as
> 2.25+ and LLVM 11+). Eliminate GAS_HAS_SET_HARDFLOAT and all of its
> uses, inlining SET_HARDFLOAT where necessary.
> 
> Link: https://lore.kernel.org/202209101939.bvk64Fok-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: tsbogend@alpha.franken.de
> Cc: linux-mips@vger.kernel.org
> ---
>   arch/mips/Makefile                  | 11 +---------
>   arch/mips/include/asm/asmmacro-32.h |  4 ++--
>   arch/mips/include/asm/asmmacro.h    | 42 ++++++++++++++++++-------------------
>   arch/mips/include/asm/fpregdef.h    | 14 -------------
>   arch/mips/include/asm/mipsregs.h    | 20 ++++--------------
>   arch/mips/kernel/genex.S            |  2 +-
>   arch/mips/kernel/r2300_fpu.S        |  4 ++--
>   arch/mips/kernel/r4k_fpu.S          | 12 +++++------
>   arch/mips/kvm/fpu.S                 |  6 +++---
>   9 files changed, 40 insertions(+), 75 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

