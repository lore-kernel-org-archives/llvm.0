Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CDD1E47AD
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 06:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753424806; cv=none; b=Ex7nOevt4oxo2P1NebHUoo+8D+xsgRN+JHWk7HOGI62r1GkFJpqQQjV0GeML05jVAOEpXn76+5jvfY1BLWYGfIsUV5bqcBlKZd8xfsIIi7aGRtDeHZiZyf+RT9Zuz7PtjGQvScV6IKUCn+os3Rrz85luvyNqeNrdz7/qaZpVTCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753424806; c=relaxed/simple;
	bh=2si2snLINEkjaC7gF7x3f6zLZxI8VdibGsVfnQtcyl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtsSg76Q35VFqq3/9lFYC3HLtPuR5u538gbraiTTwnBJhtLgrdWURo5w1u34llsd13H6PavUszZKZw7YOpcIqibOA9/dtZjz0/6aKgENtwGgZvIhGdXATe3fQtMx1pvYrwDQ279USVy2GON4JIdU02iJPQR5vkSukPkSASa8pEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=v7Tjns5s; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="v7Tjns5s"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6A7253F67E
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 06:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753424803;
	bh=i7Z45Di1DKvPrIvb2/CHdBXTyeDYviINQxq/IZOTBeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=v7Tjns5sD6mCbcC9bkQSV7leVBBvPpvtt3CSuocamVImiqdXosoRsHzyGhfrlGIqb
	 k+u1jI+KoxsIJObWsVddIouGUv2ufC4LWI35dlvWAuZiQDJG5wmyxAMkce25lVK7PA
	 o/Rb8h9IEQJZjOXcpMVeLYp5/Nq/OhXlkfDNsocyzABFLL26Pfj3wZr8zJdW94JCYF
	 hGF+L5K3+0QlMZce6fcNJ2QHaD7aGveRItSwHqaAXf0pNipFtuAsYvtIQw36SqeYTV
	 U4MftAq0fJfVDCY5iDSdSge5xHkNYy15sthHzX5CZHPFfS3rOG6eF/y8kg2KGZu09A
	 rXadJynCgT31Q==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so1146814f8f.1
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753424802; x=1754029602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7Z45Di1DKvPrIvb2/CHdBXTyeDYviINQxq/IZOTBeg=;
        b=ecUXgFbxL5GLqBY4V3DJWbLNKCkVRvxYiafIvKi1vmlmfG1P4AxPTRnme0UWcG9vX9
         KVXSoadeyAqISwuYpAJ1TipPvh2MbqLHdkSE8ZFTcrEH+ziA/Fu0AQdTblNulx3+iKup
         oHS1csGP1R9R9WTMwsN/XOp1QpXlQ8tljFoY+m3t4ypYgEGr1IkFSnADDu2kBxtBZZAw
         z2XU4nWiHmHTA6PTIzIBMD6MfZluXtnZw9vxRXeFgcUztP2M92feMaZz1kDZ/X/k1hTU
         H6J0ZeBS6VgETBxTWFNB6MMKWFNQrA+rOiCNzvc4cTz3r0QITwygzxn3IK9/qN2WIkbH
         q84Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCl8TgyAHi6agbzAeCp8RxCzvsxZyOsM0QRApoyZdtN94JtkLm316htSXWjYFnMEB6fnVF@lists.linux.dev
X-Gm-Message-State: AOJu0YwDaOGVBdHoMzrOTCnFsEcIFelH9kC39rm+AHnas79lOb6DHdSl
	zI5lsUzJht6A9A0VjRd1XzV0uEFC8lpsWdSZiq5PLhj1LdNJ1+yI73iYhoNtkvTDHGu2dT68ER2
	By7/CpB6FIOagRhrHXfLkQV6jzjRVjaO939beY3idFZvmyDBaHEURTSIHGO4b8dFnRQSvsL0=
X-Gm-Gg: ASbGnctA9j6FNY0WE2h1nMevNIMcDWqp+cByVuGn10HRP8iWK2PMFNEZ5oanZyiw6Zh
	t4QmGiqehBQHd3RdEXYnVh6wzcjiLmxnElFZer5EDX3RUUjKC4h7ia6APTqNNd58CKJydDimkTF
	r4AG1pxebNzURJV1fPI8muS3sdNwCSJ9qbBcE+TV3oPh5EwE2YBYbBAwCoJH5jC/vwVJs7w/yH0
	nPJU/N4JUlbw6kTk5NeokslI9cPkgi4MtlLqjd5IA7Q9P9AgTqyeAuwnDvU/KVsSSZBtvamBOtt
	foA8c5r/YmC/E/2iL3N8BVTK2yXzR0lS3OZ2xmsKLoiV2UN2eqJPG028NeJBol0W04xVhePNK0P
	ivScJBJkzNByUfvg2mmp5Yhie0g8xibZRvxAQ
X-Received: by 2002:a05:6000:1a88:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3b77671592amr538375f8f.1.1753424802569;
        Thu, 24 Jul 2025 23:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTcbhP+qpBUFcpUqfk2Wp/N8FXB7Xsc01E0wuMcV6UBfsne+SnFue51uathOre6C5p/D/OcQ==
X-Received: by 2002:a05:6000:1a88:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3b77671592amr538323f8f.1.1753424802160;
        Thu, 24 Jul 2025 23:26:42 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcacf0bsm4109538f8f.38.2025.07.24.23.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:26:41 -0700 (PDT)
Message-ID: <0532c555-1876-449b-89cb-36ce5394433f@canonical.com>
Date: Fri, 25 Jul 2025 08:26:39 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] riscv: indirect jmp in asm that's static in nature
 to use sw guarded jump
To: Deepak Gupta <debug@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Monk Chiang <monk.chiang@sifive.com>,
 Kito Cheng <kito.cheng@sifive.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 rick.p.edgecombe@intel.com, broonie@kernel.org, cleger@rivosinc.com,
 samitolvanen@google.com, apatel@ventanamicro.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, samuel.holland@sifive.com,
 bjorn@rivosinc.com, fweimer@redhat.com, jeffreyalaw@gmail.com,
 andrew@sifive.com, ved@rivosinc.com
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-3-04b8fa44c98c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.07.25 01:36, Deepak Gupta wrote:
> Handwritten `__memset` asm routine perform static jumps within
> function and uses `a5` to do that. This would require a landing pad
> instruction at the target. Since its static jump and no memory load is
> involved, use `t2` instead which is exempt from requiring a landing pad.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>

Acked-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/lib/memset.S | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/lib/memset.S b/arch/riscv/lib/memset.S
> index da23b8347e2d..c4a318d8eef3 100644
> --- a/arch/riscv/lib/memset.S
> +++ b/arch/riscv/lib/memset.S
> @@ -56,12 +56,12 @@ SYM_FUNC_START(__memset)
>   
>   	/* Jump into loop body */
>   	/* Assumes 32-bit instruction lengths */
> -	la a5, 3f
> +	la t2, 3f
>   #ifdef CONFIG_64BIT
>   	srli a4, a4, 1
>   #endif
> -	add a5, a5, a4
> -	jr a5
> +	add t2, t2, a4
> +	jr t2
>   3:
>   	REG_S a1,        0(t0)
>   	REG_S a1,    SZREG(t0)
> 

