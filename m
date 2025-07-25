Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45271DDA09
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 14:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753453232; cv=none; b=Hfw3Ii+cbmuMckKjshfb1Ij8mb7225TDQUBfK8gKoKE1XN1QrzwfGsoL0hi4KSybfHKGaGL4G6IAaVPwBemN4rN9oSF5luGQxlMjO812TL5Ls8Y+qbTzIWrfIHrBcWpoiWhB83zDGuWXf//U7qEZ+qnsipudARKu2U005fsIU3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753453232; c=relaxed/simple;
	bh=OMwltMTnROc0x20VCZdOnkOJGoE17eDxpOQAnZCwq0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JMVFUo+0sxP1lFRcahIn/qsm8HrNPkZN4wRGssw7f9KlVr0PRiOsQLnjN+Wwex6IbBNLHKz3uVddyfEybVpcfDKPFgt2+AASd3yJOt70CePT86XMP1ocKAIaUwBsGiyGlPlaLP1/mFQd2sXVAbjt+1Hq15a4+Ubec6lQ27wU0vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PKqYLPll; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PKqYLPll"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b31d578e774so2296349a12.1
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 07:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753453230; x=1754058030; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jOelqn4iY/rsR6MxnRwx481vFltvLJp6wfVOt5IOJQo=;
        b=PKqYLPllVM8EvMAf081EbNSrc9MaI6jJ/e2RkoHXJdDMs0XXikT76OevwAzDQL5Fl/
         ZnpfKaStlsAv55H1KSvVS1MqRyWW1hXG0oLR65cRu3xRw+7aghhOIP096TJb/OphyOKX
         6AKJr28zOn80MgK/E2mLBTu4nipCtNDbI0WQnn+r+PK8SB0W9NjlFUtLE4Hd3kFwJRj1
         oHY5ZrcYnw+olm6z49loYA8p+J+EnM5LnFTZFHs4GTOq7++SZiaxEBjuKjJOWHkv8vek
         oAfpd9bqVCkaGV72pbd4kTjfl4+g6/cKSwGhDpcXQc1OU0GwNhPXucLhYkJvvxvi7JNI
         lwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753453230; x=1754058030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOelqn4iY/rsR6MxnRwx481vFltvLJp6wfVOt5IOJQo=;
        b=sxy3618t9FcmWVu0B1xMKSp0oHB0JV6Ge3/8dbegbJJMIwhSi5u3T4ngBnkkNk04YQ
         pbGgYj8HaTPB4mUwBiIyoCHkAjol0HWngVW0YEz8NCVakZ5gLnLKwUow/rl3Fx5zSADt
         ZF1UgiPL7++L0uBngcvR28gP/0j3hrliX4eKiGdcM72XrKRybO4zpRUp8BIrzdCJaT7Y
         6CkPORKrB0Jh7IKQuB7K1yMps98GJIxfxSRjNV93/t2cKwcttzQFetxsH73DAou1bdDD
         Iu6hkzFkABRbX9rtLNXIhV3nHvvO7z9YcBGKBROPj7zkdC0rN7RSJCJeHoocEqHDNdUA
         Sk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTPvTqO/pzYQMiL2fwBZrXPE1wYcoht4gaQ+Q9Z6U4E9qzRvfYuTiU9Ww2IiHi0LITY39v@lists.linux.dev
X-Gm-Message-State: AOJu0YxJVd+t2scu6SLOeZSzUFhDcCTGMnuhjuntqUHAIOX9WZ5LmWNX
	w7M6gt29QPVI/ZaDpE3c/4EeUPh/NQuhQIAOU/fqHtBi9bQQLC8j6IQsIi2QiMgswaE=
X-Gm-Gg: ASbGncuwzEywnaLtS0GJQbeaFKMVTx2MCa2MjcyUFuR+CdUtv6pOElDEpZL/rn4msa6
	N3ZtYIwPng8pLybVNzEChN3ScOuVWRbn9ETy9NauiUAC87YYootJ++ksDuv3Xo+GGkmLF09q/+j
	5FlCb1DbqCP9o0SvppSlQ90tdxb6Ani8sHQKyFcIaos105Oh1h2NWZwbSPPyvITyOJbTuSNUBM7
	tg7zeyKrdQP1N+CewMkEpUXq6uxlJhn7foW8eoP+4DViP65fPVfgfgs3ojdzuncs0i/aMM/Ijpz
	2S8yasPNrRyxLtOA38nQpzGl49iQiTHNdpnCvwCMzIsh8OMGCrzRuorSs6vgkL9VIGqFhFX7lF5
	PCwLY0lGVu/edXJwMYCAaENkNRvbSpLWDWhv1aMV3XX8=
X-Google-Smtp-Source: AGHT+IFnToE7Y9m/LQB1LHyZJTXUY15A+gO23FToLy9nHc/JxiCSxR6k0MWES+brycAIrDFP11y4GQ==
X-Received: by 2002:a17:90b:5407:b0:310:c8ec:4192 with SMTP id 98e67ed59e1d1-31e662e8312mr8688402a91.10.1753453230029;
        Fri, 25 Jul 2025 07:20:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e60a61628sm2176473a91.1.2025.07.25.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:20:29 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:20:26 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, andrew@sifive.com, ved@rivosinc.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>
Subject: Re: [PATCH 05/11] riscv: enable landing pad enforcement
Message-ID: <aIOSqskb_hBAqjIt@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-5-04b8fa44c98c@rivosinc.com>
 <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <1149732f-bc8d-4339-90c3-e34aeac9f1be@canonical.com>

On Fri, Jul 25, 2025 at 08:33:46AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>Enables landing pad enforcement by invoking a SBI FWFT call.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/kernel/asm-offsets.c |  1 +
>>  arch/riscv/kernel/head.S        | 19 +++++++++++++++++++
>>  2 files changed, 20 insertions(+)
>>
>>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>>index e4d55126dc3e..e6a9fad86fae 100644
>>--- a/arch/riscv/kernel/asm-offsets.c
>>+++ b/arch/riscv/kernel/asm-offsets.c
>>@@ -536,6 +536,7 @@ void asm_offsets(void)
>>  	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
>>  	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
>>  	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
>>+	DEFINE(SBI_FWFT_LANDING_PAD, SBI_FWFT_LANDING_PAD);
>>  	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
>>  #endif
>>  }
>>diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>index 9c99c5ad6fe8..59af044bf85c 100644
>>--- a/arch/riscv/kernel/head.S
>>+++ b/arch/riscv/kernel/head.S
>>@@ -185,6 +185,16 @@ secondary_start_sbi:
>>  1:
>>  #endif
>>  	scs_load_current
>>+
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_LANDING_PAD
>>+	li a1, 1 /* enable landing pad for supervisor */
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall	/* check for error condition and take appropriate action */
>>+#endif
>>+
>>  	call smp_callin
>>  #endif /* CONFIG_SMP */
>>@@ -359,6 +369,15 @@ SYM_CODE_START(_start_kernel)
>>  #endif
>>  	scs_load_current
>>+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_KERNEL_CFI)
>>+	li a7, SBI_EXT_FWFT
>>+	li a6, SBI_EXT_FWFT_SET
>>+	li a0, SBI_FWFT_LANDING_PAD
>>+	li a1, 1 /* enable landing pad for supervisor */
>
>The SBI specification calls BIT(0) "LOCK".
>Shouldn't we define a constant for the lock bit instead of using a 
>magic value?

See below `li a2, SBI_FWFT_SET_FLAG_LOCK`.

"li a1, 1 /* enable landing pad for supervisor */>" --> this is enabling.
Had we done "li a1, 0 /* enable landing pad for supervisor */" --> this is
asking firmware to disable the feature (turn off the bit in menvcfg CSR)

>Best regards
>
>Heinrich
>
>>+	li a2, SBI_FWFT_SET_FLAG_LOCK
>>+	ecall	/* check for error condition and take appropriate action */
>>+#endif
>>+
>>  #ifdef CONFIG_KASAN
>>  	call kasan_early_init
>>  #endif
>>
>
