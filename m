Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F276034
	for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 17:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712856650; cv=none; b=fgSp+WGF+zsYrs3oS3gWYx/a3LCIkiKRErtKva3NMqmdM69nLy51OaPFSxy4rfKlR1ebKbRIFAZuSKxMXvNH28xcYqdJiferZPL4T0loOR1yF1MR8OBc69v+5Eud/Js7P8fJlN9xNKE/RTU3f2wbLrynBcLWC5ymRpsJEaOL+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712856650; c=relaxed/simple;
	bh=3PkwqQkO6dIHQdTSHshUiLVbhfmQ6aY/jws2kagcCEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j0fklgCgLKQnb6PUGTmwQdAREH0GWl4L8KHcD7JkbMTru1TUWhC1JsXguX/946m4klaYxfLrroNCvIEF7tiRUgCmkCodd9SmmYvIBX/Gs+7apaR4Rjs9RMQn12ZSoW+Ny8BqUgwaU/6s6e4krj6WkF5noMosXQe2FmEaz9NgHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=p8M60h4f; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="p8M60h4f"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6ecff9df447so119475b3a.1
        for <llvm@lists.linux.dev>; Thu, 11 Apr 2024 10:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712856648; x=1713461448; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GGDMriGqMWX2SVCYOCeQKA5ixlUpINxXv13ekIsefu4=;
        b=p8M60h4fSpYX1Ln/yKwuxtAZAkX0d05QOKFN8Sf3/j6numUCfoG4GCFzMunEM+sArN
         MojUlL42u7h2ZLqponBl4y1MH1FZ6pnOoH+J21O5Zl3pHXIQdNv1o/28tFSvc0nDWBo1
         LzfIqrvnILYOzo2kzBH0PJrAkfEKJtyrmqB8igaIX8i7wSXZs+p7kz4uhO1Jz+mYOP2P
         g6lEKcG5zV2Yx40GNoe1bZJM+i/9V/hkqU/PMbqz8E0Y2IIfu3tu8ghDdAiiOiIrHw+i
         shW97So/5IfGVSSU5QCrX/QkGovKxngjFfTE06smm4lkPoDPfpJrXVE3ceGHu+15mlb5
         1Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712856648; x=1713461448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GGDMriGqMWX2SVCYOCeQKA5ixlUpINxXv13ekIsefu4=;
        b=ImjlhbdLx10UYV4oqWz/9PphydxH5EzQc2DV+nXtKjFldg2EkaSCfPLtrCjIV/785T
         mcvOZu/0BE9ZDCbfwR7CmVW5OEjOdV4Xp91L3G2Jj6pRy7RltZnFGW5vqRTmMBrgH3yy
         PE99GDUElMKKqHlkwPDMQN5B/cbPyIH3BPPw/EirOmVnBglKrE4Xa/yzPOFwlzwo6hAu
         1cqNlJ/BMYPRNgiEDOyVsZikhjj66VBtHJa8uFSI6rvurWTwtiB21wOO8ZgE4Zo8i2+m
         dsDi1vDK8NiXN0FgvWhuaEhcg4vUSGAuexnzl1JMH1ouTICj4KmRS5UXCeFOikmI6DdQ
         7UPg==
X-Forwarded-Encrypted: i=1; AJvYcCWtCpab0iHihdZ0SD6oSIcGbg+uhm8QnBKQ6AYu2rhbINgP0fpAAXmvCoCdUVBBh41gBqCpvLvKBueqroeHs7lAjGVvkQ==
X-Gm-Message-State: AOJu0YyB/n1G+0Y8np2TrX6UKJBue3RHxgTwVJZ9/AMLvJCBS++Y3ZiZ
	muJ9GCjusbUEtRWO6UzV+8Hzl9rUmJakgk7oHCaFVm+Sz4IIHoIAAV7GOljHGIc=
X-Google-Smtp-Source: AGHT+IEiCzzp+1vro1jXejp7+//Vm+SCAsdvTNELFf+yEQKsv8bqhP5mexbLlJAAyee/qs+Xz2R5zw==
X-Received: by 2002:a05:6a00:2d20:b0:6ed:4a97:5dec with SMTP id fa32-20020a056a002d2000b006ed4a975decmr493911pfb.20.1712856647747;
        Thu, 11 Apr 2024 10:30:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id x33-20020a056a0018a100b006e6c61b264bsm1436542pfh.32.2024.04.11.10.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 10:30:47 -0700 (PDT)
Date: Thu, 11 Apr 2024 10:30:44 -0700
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
	broonie@kernel.org, rick.p.edgecombe@intel.com,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [RFC PATCH 08/12] riscv: dynamic (zicfiss) shadow call stack
 support
Message-ID: <ZhgeRA3XplDw7kmm@debug.ba.rivosinc.com>
References: <20240409061043.3269676-1-debug@rivosinc.com>
 <20240409061043.3269676-9-debug@rivosinc.com>
 <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABCJKud622jAHZGiYed-2veynA6rd_=1mnTwnTT1WNQ6203q6A@mail.gmail.com>

On Thu, Apr 11, 2024 at 05:05:38PM +0000, Sami Tolvanen wrote:
>Hi Deepak,
>
>Thanks for the patches!
>
>On Tue, Apr 9, 2024 at 6:12 AM Deepak Gupta <debug@rivosinc.com> wrote:
>>
>> Adding support for dynamic shadow call stack on riscv. zicfiss ISA extn.
>> enables protection for shadow stack against stray writes. This patch
>> enables scs_* macros to use zicfiss shadow stack pointer (CSR_SSP) instead
>> of relying on `gp`.
>
>CONFIG_DYNAMIC_SCS implies that runtime patching is used to select
>between software SCS and an alternative hardware implementation (in
>arm64's case, PAC instead of hardware shadow stacks). I understand
>this series is still an RFC, but I didn't see runtime patching
>support. Are you planning on implementing this later?

Since I didn't see any example on selecting PAC when `CONFIG_DYNAMIC_SCS`
is selected. So I had that confusion but wasn't sure. I thought of doing it
but I don't know how to binary rewrite all the functions. It might be too much.
So I went ahead with using `CONFIG_DYNAMIC_SCS` in this RFC series.

Question:
If arm64 were to use PAC with CONFIG_DYNAMIC_SCS, how would it fixup the code 
sequences already setup by compiler for shadow stack push and pop in runtime?
You expect this to be some offline process using some object editing tool or
a runtime decision? 

>
>If there's no plan to actually patch between Zicfiss and SCS at
>runtime, CONFIG_DYNAMIC_SCS doesn't seem like the appropriate choice
>and we might need a separate config option that still allows you to
>reuse most of the software SCS code.

I wanted to avoid "#ifdef RISCV_SPECIFIC_HW_SHSTK" in arch agnostic scs code.
And that's why went with CONFIG_DYNAMIC_SCS which sets dynamic static key once.
And then I use `is_dynamic` everywhere else in arch agnostic scs code.
>
>Sami
