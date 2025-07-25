Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5698634A
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 06:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753424427; cv=none; b=nhd3PihAz5W0Ie0utIM/weX6fofHRpHK3bL1f0kThYD1Ic847pxEpXnR9x3mj+nJE/KJRnv5koNP10azICMtKOBTT86iLT6k11rZV0ExoZqMUTaNHygNjA1IBVrakPtMTZkGkSNpsmBVCcr8rtz1KV0pPkMqX213hVli1ELh8i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753424427; c=relaxed/simple;
	bh=CzNkY+VnDu3peRwB9s6DITK/IEoW+u7ophXXib+eXGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GHn+LaiUG5UG+39ZDJB78GP3NrsH/c3YgWAc8GQLcYKu27ROtc1evlol4piILIkv3z7q1K8U2QCayAtVru/zpvZ7+4uyXWdj3fdBRuOUlR0uANK195e7WFoDAlwHPlIdM8akttT58DZNxl5CboytvtWlFBH8Q6LilQsZypXqwtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=udnJZhBp; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="udnJZhBp"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A77043F6FD
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 06:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424013;
	bh=TzyPAUEa1ra9f+Fo595oVFYE4lltInSXTAdJNreFcWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=udnJZhBpxpDYrlvsjoKrIlUlnlOSrYLmKnyfTuRYEjeGcdE8l8H+LsRPXEj8czvm/
	 170y6V27Umlvfy+2O2fnOGGXW+AIYVlR3xVR7I5+yu8xVceauTgXOCaHEVZvEyXH2R
	 RX00dXdxYHqrz4bLOa/yLEWgI2jnJX0zi37mWU2F1vHmBIB5VEeCLERFWIaAYujofy
	 Kom+bdiGREwvMXBbgYQk7e5LbWc2x0xeyjNM9hFu/Wb5ae5FN/lZM8amAPRZ5CgFwf
	 5S1GiI3e00RO/rtKj+H/4EmkfDyLkuaLhnwhq8BAZ1pP16BA8rzNbHMqxLA/zDV4HO
	 XkFX8W3sD246w==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so10621325e9.2
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424013; x=1754028813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TzyPAUEa1ra9f+Fo595oVFYE4lltInSXTAdJNreFcWM=;
        b=R+nEDn+OPIrhZgM2QAlP0b7XEnXajB8rrBOBKdD9fh2HcApN2M950HM8mvxBX46/Fg
         03LzjbmjYHwwWAKXXDrfuhwi4wXNNzTI6w1evzkL1eZdvIVwEftaoKQVOkik1HKXB2Io
         DDwAJDOuCfXwRjSvYNBp+PbcICo3QSbZcQdWH82QUZZP6joXGAJRW4frj5+ACzy29agI
         wO9sFtH7B7CY+tLBdKzyPBOsBqegQeseJ2zdHuThMppJZk6I8L2yHuPYIryUYCz6Gcr1
         InJ0F4j0sHf9WUspMzVelOuIAwugMNPTPnDte+VbSiMorz6KjE3PM3T2AHq20BsysyRn
         0nHw==
X-Forwarded-Encrypted: i=1; AJvYcCWcuitBeXFib3X7D+ishSSufHYnrptJyLbx73A5pZboh4gzl6jZlT+tWOMdoC3ZQi9Y/+qi@lists.linux.dev
X-Gm-Message-State: AOJu0YwjY40vJptQ1TUu/oIIvGphKhB5dnaIN47OmSAnXbZHrZn4FpSU
	0Oz+uH5OhdO0Xk8+zog0vvYQSsQjtENXsEn6EsUBfgbwIZTrnrCIRLcx4So8GFoUryuEIgPhpg9
	WUTh7nkQL2oZL5Ra5t49fTDRQv9YoCWwiFW4KNQM6K9jZva3ypIwcFUZ69nUhhBLsSF9OpRs=
X-Gm-Gg: ASbGncva9P0a5gp/qT74oYwDKFBHqRHHLaHCULAEY76aKYM2aLiKtk4d/pN+nFrIsyu
	epiIBiwR8ruQfSUvp6DQNGiPdU+nrn65Lwv+qAK0ItZV7TezHmxt0NfGkrIIpb8JBC4bBB829RP
	59lXi2SokAY/I64QOzXe7+jsP59wzcS4UwzZFk/Hs8d+7F2Y8TwDuPP68a3aVkw20VRCHBodZuR
	B/ckoiitOoM/ucAhMEQ5vIsxqQgEiSNBhejilIwVvqv1/TJVt3PztS4GjNrc+/DyxFCxaCoM9p1
	HR47R6qle34K9bTmVybN/Pd6NLasAsxTFVwPVJ/MLaEL2jtFvbsRqELHjx1DiTAS0eq+vtxd/av
	ZVTxRL052E6detfkXtMuxEawBVMsaddfhmfuZ
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-45876b12ab6mr2570265e9.8.1753424013118;
        Thu, 24 Jul 2025 23:13:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnuDATio1q8lhm2BzVtYuo6oTtxWHR46flKXtmOHWUTwYg4EBDhbjT8wj0HyskkwGEINn1ow==
X-Received: by 2002:a05:600c:861a:b0:456:1bae:5470 with SMTP id 5b1f17b1804b1-45876b12ab6mr2569725e9.8.1753424012699;
        Thu, 24 Jul 2025 23:13:32 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcb61sm41269355e9.20.2025.07.24.23.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:13:31 -0700 (PDT)
Message-ID: <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>
Date: Fri, 25 Jul 2025 08:13:29 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
To: Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.07.25 01:36, Deepak Gupta wrote:
> SYM_* macros are used to define assembly routines. In this patch series,
> re-define those macros in risc-v arch specific include file to include
> a landing pad instruction at the beginning. This is done only when the
> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
> 
> TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
> support.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
> index 9e88ba23cd2b..162774b81158 100644
> --- a/arch/riscv/include/asm/linkage.h
> +++ b/arch/riscv/include/asm/linkage.h
> @@ -6,7 +6,49 @@
>   #ifndef _ASM_RISCV_LINKAGE_H
>   #define _ASM_RISCV_LINKAGE_H
>   
> +#ifdef __ASSEMBLY__
> +#include <asm/assembler.h>
> +#endif
> +
>   #define __ALIGN		.balign 4
>   #define __ALIGN_STR	".balign 4"
>   
> +#ifdef __riscv_zicfilp
> +/*
> + * A landing pad instruction is needed at start of asm routines
> + * re-define macros for asm routines to have a landing pad at
> + * the beginning of function. Currently use label value of 0x1.

Your code below uses label value 0 which disables tag checking. As long 
as we don't have tool support for calculating function hashes that is an 
appropriate approach.

%s/Currently use label value of 0x1./Label value 0x0 disables tag checking./

Best regards

Heinrich

> + * Eventually, label should be calculated as a hash over function
> + * signature.
> + */
> +#define SYM_FUNC_START(name)				\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_NOALIGN(name)			\
> +	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_LOCAL(name)			\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_WEAK(name)			\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
> +	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
> +	lpad 0;
> +
> +#define SYM_TYPED_FUNC_START(name)				\
> +	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
> +	lpad 0;
> +
> +#endif
> +
>   #endif /* _ASM_RISCV_LINKAGE_H */
> 

