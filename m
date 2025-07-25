Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5581E5701
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 14:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753452628; cv=none; b=ktv0wWhAKNc9y6MFHbr+DEniVYC9b2SR+EWQLa9HzmJwzoGc6blNMO3hMiSAPYoDeZrDBk/Rs62QY+M5w2CU+qmjXbUkafoZRKoq+66DXhgKjJUSGAWUCcPQ5NsHmaNpVnwedW2ppQLCFu/NB4bDojEXhOEhOB24C7/AF+kOyqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753452628; c=relaxed/simple;
	bh=XXwJERhTFmbWjCdF0fhV0tx9/bF8PCxbGdYEPIf/O3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a76F6Xg0FPM70JF7VO4WIQ1Zy6Fuke14eY+LC6XEHc5N6i3hc9qudbOX19zLRKObW9LEoBDG846DlQ4vW+tSww2i2+AUkCacH5mSvY2bt59xRdUPX1WMF4fbU+39+8FrYo0O0JNaT5zAsCBgv7e0HONXWMJ2ktJaQ0brSrAlJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Vi9yxup1; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Vi9yxup1"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7490acf57b9so1565048b3a.2
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 07:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753452625; x=1754057425; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf/mOhm/oVbqNLjepUkvAGKUCLK5QqEVSdfRhcGCSHg=;
        b=Vi9yxup1WOWJnh1nAlAmIpRenDpG3vXu9b4i5zAqT4m4TQNTZLU069rKAigS87z6Td
         kSQiEa7RdfOCHmk4K8R8cZsEcWWQVhq0vst/sJlmcbPpV0b9H0xu5gTmgvnluKIyYrHN
         zkLLY30YTYSj8AnpbHTyA+rI1RVxjK+0fPG10APJvGThERdr+eXNdcW2WwhlkBfgTEVK
         tj/e5Uk2+vRUTNZoaqDMINr4wDrqlhWnnoQZ9eVuddfVM4nI/+uoHmbEkKw/OTfvdZsM
         gBwPDCByMHrWJucfXB4UTAjcMITj/SucrVHGJWyh1jsqLdbNDHrc0mufj0BBHzuk3PqU
         TfCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753452625; x=1754057425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf/mOhm/oVbqNLjepUkvAGKUCLK5QqEVSdfRhcGCSHg=;
        b=kgS8BJh/BlGQeIxy5W134p3bho+XElBNdxRF00NYSwPVhso4cDWhJHKWUhNYjG1VF8
         n5CKGIumHLdrmNCOf+M7jj9nzi0aP/9Lm5vR8qq44QFRnSXEuG9yAis4Q8Nr4W4pqCAC
         kfLnK7T6Fn4SUHu17pOz9Ran/iTDxbG+uWOJLhzcoaGHCLP6b9oPO864Uy0zT5N9x8w/
         iSm31yo1r4bjrUl+Fa2/D4bRKtb+PRnNRtS4p4yJhgf/TPyE7Itj6OJqyDggpy0oDxfx
         ardUWqB/xA7pCw0UK/7szTAM6QwLaMszZwGyfRhDbP8mKMTPiBHtw5tNRKL8B5ahF3OJ
         MtuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYcwo/fRO/OXLswJwoOCgN+PzQC10QK+0ZZxRIAwdzBRCMcPIs8UpNcyE+ZcgPks5D9A9M@lists.linux.dev
X-Gm-Message-State: AOJu0YxxKocWvRt19cYQ89ZPf6R7GjjBTWP1wtmyV6hDWmJbdGNHvmht
	s4udl8eKRxQWnUG+KxMyCOktH9p0eK/gcvu4u9PtD029D8pXaqDGuhqRS2RE1g5islo=
X-Gm-Gg: ASbGncvwzi+RpalKkZ5RyeLvvPwbI0ITpcUK2twcPUO1sU9rWRfe5/x7kwP+9rBNCZL
	qhXLTJhJelMnUTL6CngNG+F1pKRTdS+PYdTrqpUdi2shbZRUUAnRELGg/z79DCaMpBYtWncHrYX
	MQZ8qNDDWToDK/G6gqUyGfZr1F0WD/RlWWfvc7fPpFvqv2bFMYVPi/98Jzx9dmUwK0uMNswTp04
	0s7B8Dk/Y/f4VTMD1M1I9OezheCn/2qKRq9Zs5ScbWhvZq6PynmEm7USbeKY579AnyxBu9Ciyf9
	qR99Rwz2l1AkmvTljRp6XjljQVwUATJt3KZLzRwGzZUXIBn9IG1U8uF7QDoVHW4gTPo2IcnFeIs
	rg7JS2W6KwTPM3rxnOu1U+EIOZ3IwklrsO9qGgR5vuB4=
X-Google-Smtp-Source: AGHT+IHNN/h9IcORot4a3xhdjrHaAp7ln5/qPNI4g6XxmpxQs89n8kgWy8jMRw30pgwpyInfWpB5eg==
X-Received: by 2002:a05:6a00:1142:b0:749:456:4082 with SMTP id d2e1a72fcca58-76335849218mr3090044b3a.1.1753452625116;
        Fri, 25 Jul 2025 07:10:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b0615d7fsm3945846b3a.105.2025.07.25.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 07:10:24 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:10:21 -0700
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
Subject: Re: [PATCH 01/11] riscv: add landing pad for asm routines.
Message-ID: <aIOQTSVNkC1RztDW@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-1-04b8fa44c98c@rivosinc.com>
 <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2ba0c09d-2783-4dce-a889-06e16abbde61@canonical.com>

On Fri, Jul 25, 2025 at 08:13:29AM +0200, Heinrich Schuchardt wrote:
>On 25.07.25 01:36, Deepak Gupta wrote:
>>SYM_* macros are used to define assembly routines. In this patch series,
>>re-define those macros in risc-v arch specific include file to include
>>a landing pad instruction at the beginning. This is done only when the
>>compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>>
>>TODO: Update `lpad 0` with `lpad %lpad_hash(name)` after toolchain
>>support.
>>
>>Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>>---
>>  arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>>diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
>>index 9e88ba23cd2b..162774b81158 100644
>>--- a/arch/riscv/include/asm/linkage.h
>>+++ b/arch/riscv/include/asm/linkage.h
>>@@ -6,7 +6,49 @@
>>  #ifndef _ASM_RISCV_LINKAGE_H
>>  #define _ASM_RISCV_LINKAGE_H
>>+#ifdef __ASSEMBLY__
>>+#include <asm/assembler.h>
>>+#endif
>>+
>>  #define __ALIGN		.balign 4
>>  #define __ALIGN_STR	".balign 4"
>>+#ifdef __riscv_zicfilp
>>+/*
>>+ * A landing pad instruction is needed at start of asm routines
>>+ * re-define macros for asm routines to have a landing pad at
>>+ * the beginning of function. Currently use label value of 0x1.
>
>Your code below uses label value 0 which disables tag checking. As 
>long as we don't have tool support for calculating function hashes 
>that is an appropriate approach.
>

Yes I made the fix at other place where function prototype was determined
to be static (see `call_on_irq_stack` in entry.S)

In this patch, it wasn't possible.

>%s/Currently use label value of 0x1./Label value 0x0 disables tag checking./
>

Thanks its lingering from earlier. Will fix it.

>Best regards
>
>Heinrich
>
>>+ * Eventually, label should be calculated as a hash over function
>>+ * signature.
>>+ */
>>+#define SYM_FUNC_START(name)				\
>>+	SYM_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_NOALIGN(name)			\
>>+	SYM_START(name, SYM_L_GLOBAL, SYM_A_NONE)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_LOCAL(name)			\
>>+	SYM_START(name, SYM_L_LOCAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_LOCAL_NOALIGN(name)		\
>>+	SYM_START(name, SYM_L_LOCAL, SYM_A_NONE)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_WEAK(name)			\
>>+	SYM_START(name, SYM_L_WEAK, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#define SYM_FUNC_START_WEAK_NOALIGN(name)		\
>>+	SYM_START(name, SYM_L_WEAK, SYM_A_NONE)		\
>>+	lpad 0;
>>+
>>+#define SYM_TYPED_FUNC_START(name)				\
>>+	SYM_TYPED_START(name, SYM_L_GLOBAL, SYM_A_ALIGN)	\
>>+	lpad 0;
>>+
>>+#endif
>>+
>>  #endif /* _ASM_RISCV_LINKAGE_H */
>>
>
