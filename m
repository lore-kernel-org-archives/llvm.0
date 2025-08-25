Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB85A29A9C3
	for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756155596; cv=none; b=lBceBqhZJr2Iruby1mjnUvuazRGfHTCG5O6beOwxKL5Q4i+xEwff9nzBzU7yHwWPoB1xOf+XJD5AKBEc3hG1Gfsl1Zl4GAscZEWJZjcEvdDFcFkvPzBBa40TdW8WfPJGZL4v1cfYcCOZ9P+HTJmEJm4Jaeza7TNmu0Dr7xmWALQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756155596; c=relaxed/simple;
	bh=YBVOrpCcsqXAW5sCYr3wMwOJTycBQN3ZspPZEFbfxg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgo3IPoPGyrYpiYJZ/svPO6yO6B41h94vpj16k7ASbQG0ZtAzSu+e5xiyBsiUjSxzcHduB17tL7Ytaa/I7t7Io7qRaf8bDWR2VS0xmVTWcXKhv18OaAjvE4QfeksHXIYTk3PYODXR3Zo2iQZHbIBHRtzsgkYtuXcmqzqQgMDHpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=Pe/+W8tW; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Pe/+W8tW"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ec4802d359so9339845ab.1
        for <llvm@lists.linux.dev>; Mon, 25 Aug 2025 13:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1756155594; x=1756760394; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZcPPbu+aYl9Xu1jLxey4/WhZ40S4z542awI5r/G6Sno=;
        b=Pe/+W8tW0i73/gJvcYBnzjLIFRbJSro/ybotp7fGEiBJO860eAZiIziOUGm8SXtpW0
         VmPrsxwtf5fptNuTSzhy1Hln5X754KbHTnbqVP28x1n9BURPGoLs4ywjeFma1PRCeGo/
         sDsPTqq8p5MHJPEnF3hm+K9HtIK0KlwrnBCWSUB6ZjvHl0D4MMEC6fiSPuNpHR8gdssl
         bYmbDPE2V0D1KYc51bcvzjZmv7Y3mapAUm64renRLbH5yOEo6GhPS6XEMkiGcSbbCSJr
         3MSNJv3y0+VleM0NXsa0JiFffLKpNwvLePtykcS++C4N7Q74ZVaPcUlEtwvFdRH+wd4Q
         2tcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756155594; x=1756760394;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcPPbu+aYl9Xu1jLxey4/WhZ40S4z542awI5r/G6Sno=;
        b=fZgnEm3M/REoYNKm01RmN8/6gDD0X14Zp62yylGGFt3LfmzpDSgIjZmh2g6PrufCab
         Q6xtxb2LvPiSzKWw4qpEyGkSuO54aoG586hTpGR8ntKANFXsmUkv6H4+uflOPg6yn0I3
         qvBnNqONYOb7cUBQCrKs/FKkw9xR2bQqPvLJgE7387LVsVADf8l8WQT5Qg+wgZEzEoDC
         IcM4Mq9xmUG/2iQeuLWjAYFvFlNG+/H5p+y7Zp38fKcfDk1lUq3nfbzCZ9YxfI/0iqCt
         iiL5SdgeTe/oIDzEs13FMZVv2YB5HvRXxKZKIx7Rp5MgXT5HdnaTVqrehBbDGzI9LitK
         p2hw==
X-Forwarded-Encrypted: i=1; AJvYcCUp+ObV6uM+FmRNOU6CGUMMcKwO7cDV8SAG2jgCMf/3AoGe/1MDBqX4TylcPrgYQCXtz1VJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5Qiy7gSJSIeQePH/7gygceetsQHAb3mvRNgCe7ecYO6jaS0Eh
	Mym2MpfV9muhJgnQRQMspMt9rXlkzpDaXCRsGgDSqY0FJ3WR9UGNDfCaRAiPE0LLqgM=
X-Gm-Gg: ASbGncuzbOK6kCdeGihb4CJhA48omIgG7uUMLAE/xZtVlangFrTdX4AYXFB03+DhI3k
	ZhL3/3vf+Cl/dzs7z7h9uI7AqnRNR1Acn8T1N8WVgN4X3nqgKpqqLUYHWF6KFhiBGdaTijVkN/P
	+87GNnyYdxKdAVFUXhfEBlEcBT25F+QqfQNOrwIsKUkeWp8ddEv5UBLlBCBrVnZ/yYH8QOE+TAR
	+UgSsi2ZLKBoJUx+xdevhZkfSU9ICDIimuSVD31fD24j69hsDeGCU170cVCPKYKsm107K9fnc2z
	68LISx22tTlSLtP5garSMyfwgf40ELrAupfSY96eMkborX2w02Lnpl8F4kXcJjk7KBBjdEgg4iy
	3zyCgpgNCFwisvyX0o+nBrosGj1C0GmctLQsc36WRWbY=
X-Google-Smtp-Source: AGHT+IGl5YyJO5cNchW3hMpUrsJFnsYaH0jFB/UnFZkvzedPO9loSjPBh1OzNXyW8MzaaJOPsbW11Q==
X-Received: by 2002:a92:cdad:0:b0:3e9:eec4:9b5a with SMTP id e9e14a558f8ab-3e9eec49d85mr152368845ab.25.1756155593789;
        Mon, 25 Aug 2025 13:59:53 -0700 (PDT)
Received: from [100.64.0.1] ([136.226.102.202])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3ea4ec1fa3dsm54724275ab.45.2025.08.25.13.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Aug 2025 13:59:53 -0700 (PDT)
Message-ID: <9ae927d3-0a66-4354-910f-155ff9ba3e0f@sifive.com>
Date: Mon, 25 Aug 2025 15:59:46 -0500
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/19] x86: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: x86@kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org,
 llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sohil.mehta@intel.com,
 baohua@kernel.org, david@redhat.com, kbingham@kernel.org,
 weixugc@google.com, Liam.Howlett@oracle.com, alexandre.chartre@oracle.com,
 kas@kernel.org, mark.rutland@arm.com, trintaeoitogc@gmail.com,
 axelrasmussen@google.com, yuanchu@google.com, joey.gouly@arm.com,
 samitolvanen@google.com, joel.granados@kernel.org, graf@amazon.com,
 vincenzo.frascino@arm.com, kees@kernel.org, ardb@kernel.org,
 thiago.bauermann@linaro.org, glider@google.com, thuth@redhat.com,
 kuan-ying.lee@canonical.com, pasha.tatashin@soleen.com,
 nick.desaulniers+lkml@gmail.com, vbabka@suse.cz, kaleshsingh@google.com,
 justinstitt@google.com, catalin.marinas@arm.com,
 alexander.shishkin@linux.intel.com, dave.hansen@linux.intel.com,
 corbet@lwn.net, xin@zytor.com, dvyukov@google.com, tglx@linutronix.de,
 scott@os.amperecomputing.com, jason.andryuk@amd.com, morbo@google.com,
 nathan@kernel.org, lorenzo.stoakes@oracle.com, mingo@redhat.com,
 brgerst@gmail.com, kristina.martsenko@arm.com, bigeasy@linutronix.de,
 luto@kernel.org, jgross@suse.com, jpoimboe@kernel.org, urezki@gmail.com,
 mhocko@suse.com, ada.coupriediaz@arm.com, hpa@zytor.com, leitao@debian.org,
 peterz@infradead.org, wangkefeng.wang@huawei.com, surenb@google.com,
 ziy@nvidia.com, smostafa@google.com, ryabinin.a.a@gmail.com,
 ubizjak@gmail.com, jbohac@suse.cz, broonie@kernel.org,
 akpm@linux-foundation.org, guoweikang.kernel@gmail.com, rppt@kernel.org,
 pcc@google.com, jan.kiszka@siemens.com, nicolas.schier@linux.dev,
 will@kernel.org, andreyknvl@gmail.com, jhubbard@nvidia.com, bp@alien8.de
References: <cover.1756151769.git.maciej.wieczor-retman@intel.com>
 <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <c1902b7c161632681dac51bc04ab748853e616d0.1756151769.git.maciej.wieczor-retman@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maciej,

On 2025-08-25 3:24 PM, Maciej Wieczor-Retman wrote:
> For an address to be canonical it has to have its top bits equal to each
> other. The number of bits depends on the paging level and whether
> they're supposed to be ones or zeroes depends on whether the address
> points to kernel or user space.
> 
> With Linear Address Masking (LAM) enabled, the definition of linear
> address canonicality is modified. Not all of the previously required
> bits need to be equal, only the first and last from the previously equal
> bitmask. So for example a 5-level paging kernel address needs to have
> bits [63] and [56] set.
> 
> Add separate __canonical_address() implementation for
> CONFIG_KASAN_SW_TAGS since it's the only thing right now that enables
> LAM for kernel addresses (LAM_SUP bit in CR4).
> 
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> ---
> Changelog v4:
> - Add patch to the series.
> 
>  arch/x86/include/asm/page.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/x86/include/asm/page.h b/arch/x86/include/asm/page.h
> index bcf5cad3da36..a83f23a71f35 100644
> --- a/arch/x86/include/asm/page.h
> +++ b/arch/x86/include/asm/page.h
> @@ -82,10 +82,20 @@ static __always_inline void *pfn_to_kaddr(unsigned long pfn)
>  	return __va(pfn << PAGE_SHIFT);
>  }
>  
> +/*
> + * CONFIG_KASAN_SW_TAGS requires LAM which changes the canonicality checks.
> + */
> +#ifdef CONFIG_KASAN_SW_TAGS
> +static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
> +{
> +	return (vaddr | BIT_ULL(63) | BIT_ULL(vaddr_bits - 1));
> +}
> +#else
>  static __always_inline u64 __canonical_address(u64 vaddr, u8 vaddr_bits)
>  {
>  	return ((s64)vaddr << (64 - vaddr_bits)) >> (64 - vaddr_bits);
>  }
> +#endif

These two implementations have different semantics. The new function works only
on kernel addresses, whereas the existing one works on user addresses as well.
It looks like at least KVM's use of __is_canonical_address() expects the
function to work with user addresses.

Regards,
Samuel

>  
>  static __always_inline u64 __is_canonical_address(u64 vaddr, u8 vaddr_bits)
>  {

