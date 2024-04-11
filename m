Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576213E47F
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 17:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712858024; cv=none; b=KD8qG3u8nLiYPMtyN8+u2UV5p2OTUz9fxTZue3yp7IkQXxh8EFYlPc2Qf8MLJW1FLQsbD5UxfuyWaeVpUdV7MLf3BAlnvk16w4uvYKkI+Cl9JD/0zVsQ6z5kpXpaoQFJP2vzCJ76nj+aGZeEkU4bBU9tIfrUCYg/Auh4u3GDdls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712858024; c=relaxed/simple;
	bh=YNm3q05GBcoPy402fbEtHnVeUxD5k5EjIxg4a5DtEsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xspb55YH9nhhgtF0sNq5Fn62kKSHicZRs+jt5awA47cHmUcgSDdBLQK1tD2t1yHJsdkPoB0yKs8H8ZGLdYKYbSerep2tX5JUByOJY5uLTBRsJttVan2Z1Gzd5GKdWu0z3FHIzFHbhMaDHzyZcK/TatIRf6Z0w2h+wVdYciCFVLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Okw2Brl1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Okw2Brl1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ed0e9ccca1so153235b3a.0
        for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 10:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712858023; x=1713462823; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sNBRHOyPI+Ix6+A4cvuQZL/n3YEyzqDCW+Z4zO41EyQ=;
        b=Okw2Brl1oZ9ApgVbR5MBngSVGnj0fDpBkdZxpCoYxy9dCKSMK/6Q3Pp5bU1v2+yzG/
         B3r6bHst2y/NzhcibMdosG+e58xgULrNr0N9/XAhfL7whLMC31jBzfwDSPhNy08wwYg/
         qZ0YngE1fnJLnxp6VRDf91RrWR7ay3eopsx8owyiEBtkNQXpglIMKwVQcJ+KM/OvIahO
         LAu34i4UXsxgN03tjHU/1d9vprAI0AJktWhXLwvJuGv3nqhP3BwHVqwAApnkUQVu50no
         dE+RPveLd2PDwc/cdHLyMPELGcd2DoszJgQR3YaLXHipbOkKht6Tx2H7YzTgkPIrvSyG
         Q5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712858023; x=1713462823;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNBRHOyPI+Ix6+A4cvuQZL/n3YEyzqDCW+Z4zO41EyQ=;
        b=YVsrrw92iVH+Q9pqTs8mRRMdYONTyWjcahgv8D1AR14jC3byQJgCWrN4xijGntEPq1
         rhWaKiZjq4/Q0jd4CI67mXCjWH0ly4cqsHCiSfEwcXHA2gOLKGSkR4SInC4jkETl/co5
         wJLFpZzAB9j+i2lKefJUN9lJ97TCCiPilRy01aHyrgMf08ahknpjUpKLpsrhsiGP9CML
         TvcED8sDWZGJaYQaQNx/ztHgr3NxDif8FgPAn71kuxIjAJ8gr3V3RpE2iQGW8+5z0ukx
         VQfCxzAyfPYMoiKOQB1xhtq6VRH7O67CkX76/oz3a7FPnasrGlt560pj0MGmKBvYLo4t
         SOBA==
X-Forwarded-Encrypted: i=1; AJvYcCXjGuuwrCX865pxHtCX/muJFCStJV2iStDdMnkvDCqaJN+SoiQUK+QoU5oP11EF3HTy9hJT5YKdtilquhrme9pploWA1g==
X-Gm-Message-State: AOJu0YzFg+NSH0mMNG4ehnYpYautFJ3BN+AZU6EHSdclq4QpGnNaz8rg
	jtzTqq7DK78a+xRJEqQSPep4tsWxR97Bw6DkuRLBsAZU07oGPSew071C5bHz0SA=
X-Google-Smtp-Source: AGHT+IHvTlKfIjzPeOBTC79yWowwoTcXJYi0DJrQEFv7vxDpvjIWBOVWUaYo1AptR3Y6sfvrZ3mgAQ==
X-Received: by 2002:a05:6a20:5648:b0:1a7:4b6f:7934 with SMTP id is8-20020a056a20564800b001a74b6f7934mr552627pzc.17.1712858022568;
        Thu, 11 Apr 2024 10:53:42 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a25-20020a63bd19000000b005e43cb66a7asm1356148pgf.87.2024.04.11.10.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 10:53:42 -0700 (PDT)
Date: Thu, 11 Apr 2024 10:53:39 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, nathan@kernel.org, ndesaulniers@google.com,
	morbo@google.com, justinstitt@google.com, andy.chiu@sifive.com,
	hankuan.chen@sifive.com, guoren@kernel.org, greentime.hu@sifive.com,
	cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	mchitale@ventanamicro.com, dbarboza@ventanamicro.com,
	waylingii@gmail.com, sameo@rivosinc.com, alexghiti@rivosinc.com,
	akpm@linux-foundation.org, shikemeng@huaweicloud.com,
	rppt@kernel.org, charlie@rivosinc.com, xiao.w.wang@intel.com,
	willy@infradead.org, jszhang@kernel.org, leobras@redhat.com,
	songshuaishuai@tinylab.org, haxel@fzi.de, samuel.holland@sifive.com,
	namcaov@gmail.com, bjorn@rivosinc.com, cuiyunhui@bytedance.com,
	wangkefeng.wang@huawei.com, falcon@tinylab.org,
	viro@zeniv.linux.org.uk, bhe@redhat.com, chenjiahao16@huawei.com,
	hca@linux.ibm.com, arnd@arndb.de, kent.overstreet@linux.dev,
	boqun.feng@gmail.com, oleg@redhat.com, paulmck@kernel.org,
	broonie@kernel.org, rick.p.edgecombe@intel.com
Subject: Re: [RFC PATCH 02/12] riscv: add landing pad for asm routines.
Message-ID: <ZhgjoyObf+nMihA4@debug.ba.rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
 <20240409061043.3269676-3-debug@rivosinc.com>
 <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKuee-6GGDDjvByCkikR02gka2BNhwRVBw6UAwEcmSQposQ@mail.gmail.com>

On Thu, Apr 11, 2024 at 05:15:17PM +0000, Sami Tolvanen wrote:
>On Tue, Apr 9, 2024 at 6:12 AM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> SYM_* macros are used to define assembly routines. In this patch series,
>> re-define those macros in risc-v arch specific include file to include
>> a landing pad instruction at the beginning. This is done only when the
>> compiler flag for landing pad is enabled (i.e. __riscv_zicfilp).
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/linkage.h | 42 ++++++++++++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/linkage.h b/arch/riscv/include/asm/linkage.h
>> index 9e88ba23cd2b..bb43ae7dadeb 100644
>> --- a/arch/riscv/include/asm/linkage.h
>> +++ b/arch/riscv/include/asm/linkage.h
>> @@ -6,7 +6,49 @@
>>  #ifndef _ASM_RISCV_LINKAGE_H
>>  #define _ASM_RISCV_LINKAGE_H
>>
>> +#ifdef __ASSEMBLY__
>> +#include <asm/assembler.h>
>> +#endif
>> +
>>  #define __ALIGN                .balign 4
>>  #define __ALIGN_STR    ".balign 4"
>>
>> +#ifdef __riscv_zicfilp
>> +/*
>> + * A landing pad instruction is needed at start of asm routines
>> + * re-define macros for asm routines to have a landing pad at
>> + * the beginning of function. Currently use label value of 0x1.
>> + * Eventually, label should be calculated as a hash over function
>> + * signature.
>> + */
>
>I haven't seen the compiler implementation for fine-grained Zicfilp
>yet, but in the kernel at least, this would ideally reuse as much of
>the KCFI plumbing as possible. For example, since only C code has type
>information, we left the type hash computation for the compiler, which
>allows assembly functions to just reference the appropriate
>__kcfi_typeid_* symbol.

Fine-grained compiler support hasn't made it in yet.

For reference, compiler that I've been using
https://github.com/sifive/riscv-gnu-toolchain/tree/cfi-dev

Honestly speaking, I didn't realize that kcfi plumbing has made it into
riscv as well. I realized that just after sending the patches.

In principle, I agree it should converge with software based kcfi scheme
as much as possible. However blocker that I see is `hash` is placed just
before function. This breaks for code mapped as execute only scenarios.
And ideally would like to have immediates at callsites instead of loads
(purely perf reason and not security).

But yes in next version, I'll take a look and try to converge as much as
possible.

>
>Sami
