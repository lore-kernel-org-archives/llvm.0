Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F378289377
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753425239; cv=none; b=FFBnHyrRcD+qbPLl1wxLEmIEloebg99RqvJPJExLN05oLyUc0hpY7i3BMwjK0PN4KluNMBYJdH4RYyhaMlkVnjDXg06fqQoWmrvf+x0ftxHf+rWFaoFayGluHUPxJWL9X0Dmb+UCqaJ2eRDoqX+ctprGChWdRX3i6LBgOG1aSU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753425239; c=relaxed/simple;
	bh=O5sZvO2bRfOkG7bX13D5V4uZzof7+lq/HEk97vq2bZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EORFjx+lNACUFfPinNBEUE3x8rDQu6r++c/ZBbwsk8Gr3VR6pRZsKoalVhHvWr4OoKNZkTLvZqF2ufqmavX0rkRKXhlJZm1o1J4KZF20UjMr4uj+B4r8wGodU9NjpjJRIXxT82joff8grtko05oXb4BcpM9/6WUrsmGegNeIZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=Qr56jLAZ; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="Qr56jLAZ"
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5E57140185
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 06:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1753425233;
	bh=AcnKBfE2a+S1VW5IMnseKsBzXFCCOskdFvDUc4TUQMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=Qr56jLAZ3Fb4/AkQddsgYPiu1R1d+0ds9WeCqb2NooioXI/WNSp2xUnCyeDyiaIDj
	 J3BHD/ve+XtmYfWhfOk4h0Feq5dsphSGqMzxMsv7YQ4PriKn91+tmLHOrUzgQy5ane
	 zo0AGz60wLhupgw3rgDHynmoIwOmQjVXpPReoduhg/xGA5p6SHK7hXCFROFUyovpfv
	 sL/xgxCpbyHfm3xQJZhP5l1txcr999Phipjj5Eu9rZtj8x5YKSkJ91loMaiynD7VH0
	 mTw6gQYFzd82tP7Z9ocNlb9YpocFHZM9t9HFdl4unWmdXCOh9NQQMr0XxdPtU2Jycx
	 p7/xMs9GCXLUg==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a503f28b09so958925f8f.0
        for <llvm@lists.linux.dev>; Thu, 24 Jul 2025 23:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753425230; x=1754030030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcnKBfE2a+S1VW5IMnseKsBzXFCCOskdFvDUc4TUQMs=;
        b=KRtMQlo5A42EXygO0Wv5sy9w9Uo8Ig1g+rxbO3zqJrgmYukwx8nU6UShn5dSK4tEeN
         qFlU3pwijWtv8uUIqHjG/yEvcn0veSaftSDJF8EnWdtM97fkbcHMh6zWZlgaoj2dixGi
         r9YCBQEFAqjXE8as9dVZIfcCMWucq6hPacJrzOexMxWP+ceaYl2P8F7Qvm49WDkgRmfy
         9aqqhlzGbZocjxyroR6sGHpTzyO3tAy21US3WeaCXcmLk9HNc5H3qeU6dJWzWKd5jfFx
         IkHwTt2+2wOw1sSrzrgv65LJWn3Rx+wBEnyBX5kAGtpQ/fxJe/YVl9MQSkMdV5MXZw5B
         h9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5XxobiaJha2CB+ZFYQaGMyP7vCreG6vL3yoO3cfByb05JD3KBCvvUar4nwL6rJM4cFIY@lists.linux.dev
X-Gm-Message-State: AOJu0YydUAyBqx/TlYB+NWFI3enjyf3URFWOgiiedMPPw0KM8FxV5nt2
	qdRXsmJNWYCndyz7foGcyWhzZmBLTXOLffZv9HWhtvFy2khWpWNpKNoQWwqTF+Dk3d8rV3oqBHA
	dqiyXehLz5W3MaVWOWqDTBp9ROURoUAfTP84ualOagn/CoV8+6O5SvY1flFKHn29uoHU48SE=
X-Gm-Gg: ASbGncudE2NKQuSkoeUHFD/4H0TORDx775JtJqpwwWGvS993AqjzBSTr6WenD2aKh05
	3iaulBhrY3DQc2oxkajKMsKrlqaVYVkX1ABGOE+k4ARWykevoKE1eqE8QL49ZzN9ZstjrM4nDz/
	D5QWFbo09UhKUirYn7xBay/66K243vE1ASM3mmSK0BRePbfUlSBwy/iJXIC1b+cZ6d48qMGsNXZ
	Q7PofoM/c+ho7GFZwwL8lRTRDols2WlumuXNuVF3lF/JdgV+KoVnfywJNEl23syRVQ/ZYTSEyiI
	lfRncSRLt+josD1ldtO9W81tNTcOqhpDxnOkyWUOsY2w/YYY6eC0GpltblaMwqUQiE2A/KZg5mM
	OnOIo53h2HED8fR7zfPnXV2LfKYu8aTlTLHIS
X-Received: by 2002:a05:6000:2c0d:b0:3a5:7895:7f6b with SMTP id ffacd0b85a97d-3b7765ecfd6mr508093f8f.7.1753425230191;
        Thu, 24 Jul 2025 23:33:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF33NxRWxXDTDDBoqgqdvHkBJufwM8gnuJUTxJTRNJxH7wzbKZ2u1yPOgBX88LofGXQiRQPhA==
X-Received: by 2002:a05:6000:2c0d:b0:3a5:7895:7f6b with SMTP id ffacd0b85a97d-3b7765ecfd6mr508059f8f.7.1753425229758;
        Thu, 24 Jul 2025 23:33:49 -0700 (PDT)
Received: from [192.168.123.154] (ip-005-147-080-091.um06.pools.vodafone-ip.de. [5.147.80.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fcc3429sm4041277f8f.75.2025.07.24.23.33.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 23:33:48 -0700 (PDT)
Message-ID: <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
Date: Fri, 25 Jul 2025 08:33:46 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] riscv: enable landing pad enforcement
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
 <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.07.25 01:36, Deepak Gupta wrote:
> Enables landing pad enforcement by invoking a SBI FWFT call.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>   arch/riscv/kernel/asm-offsets.c |  1 +
>   arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
>   2 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index e4d55126dc3e..e6a9fad86fae 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -536,6 +536,7 @@ void asm_offsets(void)
>   	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>   	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>   	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
> +	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
>   	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>   #endif
>   }
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index 9c99c5ad6fe8..59af044bf85c 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -185,6 +185,16 @@ secondary_start_sbi:
>   1:
>   #endif
>   	scs_load_current
> +
> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
> +	li a7, SBI_EXT_FWFT
> +	li a6, SBI_EXT_FWFT_SET
> +	li a0, SBI_FWFT_LANDING_PAD
> +	li a1, 1 /* enable landing pad for supervisor */
> +	li a2, SBI_FWFT_SET_FLAG_LOCK
> +	ecall	/* check for error condition and take appropriate action */
> +#endif
> +
>   	call smp_callin
>   #endif /* CONFIG_SMP */
>   
> @@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
>   #endif
>   	scs_load_current
>   
> +#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
> +	li a7, SBI_EXT_FWFT
> +	li a6, SBI_EXT_FWFT_SET
> +	li a0, SBI_FWFT_LANDING_PAD
> +	li a1, 1 /* enable landing pad for supervisor */

The SBI specification calls BIT(0) "LOCK".
Shouldn't we define a constant for the lock bit instead of using a magic 
value?

Best regards

Heinrich

> +	li a2, SBI_FWFT_SET_FLAG_LOCK
> +	ecall	/* check for error condition and take appropriate action */
> +#endif
> +
>   #ifdef CONFIG_KASAN
>   	call kasan_early_init
>   #endif
> 

