Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6D7156678
	for <llvm@lists.linux.dev>; Tue, 29 Jul 2025 00:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753749377; cv=none; b=JZkdAgkiGjXswg3QlgRASHl9auhZ4SqqmxyCKwKxOCRDKloKlOhE0CSVE4wwBvjcI27+o/0qU3JOi148LmEA7L8jHbiKLoyUtdf6Nz/qn29mdC2w4lIRoK89Ywt0MYlel2orI2+W5wMmXNqxqvY940V2bPrvc847mFLNQwoi9tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753749377; c=relaxed/simple;
	bh=1Gh39IFfwy1kYqEDRMn11elvC4t891W5yj/F7WcLcE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SLKicRoLbUj5Jhz2OdBG5ES9k4o+FX3I53sbf9Bl7eSQ6B3hoWGbWlwExfO4XTNpZa5iGVfrsRySdfdKMXthgcZvdvIiLYRGAo0Z8NhQsyyLncUJx20lAJzTjWoKW/5NDXF5dcLh/OkY/3JGlrgSTN1vQpmE7QW2KZx6WYk1Uxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Fo1s8iRS; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Fo1s8iRS"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso4402265a12.3
        for <llvm@lists.linux.dev>; Mon, 28 Jul 2025 17:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753749373; x=1754354173; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/ETbDJbyMnJcJth9NSQ1EqJE54cIcDMP4wIxlGlnYcw=;
        b=Fo1s8iRSwGLtodqnZ/wFr7CAzYNdxWy9yc15K+VF3aWKEoEpTpNfr5QU84zq23Sd2I
         rtjit5mg/guRB69VfU7NRKYVGqwAQUh09TwGxKvln/PjODHrWjvZujjINf6J3dKdASgt
         wNzj8c86F9tRT7jHsTchpuxcQjHvE7RPe4bTYOyvxlJ53S2zGRF6Bf+TY7U/CDDRirJa
         KasN870kqGDmO2qFjqyhlftnHhhAU+YjSZKuJKbQDUo0QCnK8omoDejresRpQxWoYume
         Y4c9wKNnk5pzc8oyCZJKR4a0F9aT0sP+kHeIoGMAb4ztXdnE4BeE0ZVWmYbIVIJR9LCx
         hJ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753749373; x=1754354173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ETbDJbyMnJcJth9NSQ1EqJE54cIcDMP4wIxlGlnYcw=;
        b=ib0TL+kLdZEfnlUkNiTSHBazEmKPZbWTSfA4xesFWJMiauc0G6u5xqcRdt3kJf24SO
         dZUKUVUUWkURr1qL9+t+WnsTP5AEjNo87DogJKGiwEse1cEpRaY7IbHdJGng6MIwHLPt
         /TkBkaee1YnmN+Bq/lGLiKS5eg+60DZSRqIVq7oR2DrkWfDpT+t6KwwTfLAGwnnksZEU
         5xbDYB33pUYetNqmmcX0dz0XNRmu90XXj4O1RPMq3WqDVh5g6rNK3kJUjLF7vHVC46b5
         /QiuwFZmCPAVpqzwF7rpkV/8bpQC8vkUE8Ggqi79P/3tVQgVkIjbciAwHP4wM8Z1zXwY
         2BiA==
X-Forwarded-Encrypted: i=1; AJvYcCVq8BlXFjlY8oWIByRGAYcyJuMJE8hBgp2wqb0BXc2Xa7xmyhravfCNBsCkje1d8Yf3atS7@lists.linux.dev
X-Gm-Message-State: AOJu0YxeDXCOidSjaZBT9nfruGbVl8ifnaqjhZYQHYX+a0zMMSYsmQ/Y
	UQyKmEHpeQZUk6s/a2B3aKgx0rmgypk4YxVwNG1dl6IRYkD+/fPsW02Qb+no+SuZDhE=
X-Gm-Gg: ASbGncubUW3sQjciBxB914uW0bkh3/GagIzuB769M+qBKyWwnkbJiPqcOLbyWcCZ/xI
	Tz/PNvtWcyIShJ1gx6RqVXXkAByjVgPk/fTDyD5wsFbVrUsqdC95mNuh1ahcuqNzrUmMyFWCl2o
	N1kvQogS1VLH6nEdc4nN0rPJDTavuc1FJV1m0pb0tu8OUv02UrF9f+Ir0JN+nuqNn3Pkcjsg6nA
	JuP/morU9i6HD76Als/TV/V/OjA6GaIH9a2fHG8NgWQfRjnrauCtNE5F+W9seoRz0f+Xj4RhpK6
	gwv+/IUHU/e3f+BZHyZKSEGMZtGqT/VdaIziLpSJtiUESGjsGiDuBjXtgwBOLbgYHhXn7RDDjOu
	33NUDqryc1sa+yci8FJSwUoNneK4HieKo
X-Google-Smtp-Source: AGHT+IEDJXqhf7DRrajAJZBJ8vJ6pYcfACWj1AXTIy+3dQeFkQYCW4S8o7ad1lMROev+GL8TvcTWBw==
X-Received: by 2002:a17:90b:1b45:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-31e7785ee72mr17793124a91.4.1753749373373;
        Mon, 28 Jul 2025 17:36:13 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31ecd1f0e80sm4264442a91.18.2025.07.28.17.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 17:36:12 -0700 (PDT)
Date: Mon, 28 Jul 2025 17:36:09 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Monk Chiang <monk.chiang@sifive.com>,
	Kito Cheng <kito.cheng@sifive.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	llvm@lists.linux.dev, rick.p.edgecombe@intel.com,
	broonie@kernel.org, cleger@rivosinc.com, samitolvanen@google.com,
	apatel@ventanamicro.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, charlie@rivosinc.com,
	samuel.holland@sifive.com, bjorn@rivosinc.com, fweimer@redhat.com,
	jeffreyalaw@gmail.com, heinrich.schuchardt@canonical.com,
	andrew@sifive.com, ved@rivosinc.com
Subject: Re: [PATCH 06/11] mm: Introduce ARCH_HAS_KERNEL_SHADOW_STACK
Message-ID: <aIgXeRDXNmOozRWp@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-6-04b8fa44c98c@rivosinc.com>
 <aISGypOAaDGaUZgd@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aISGypOAaDGaUZgd@kernel.org>

On Sat, Jul 26, 2025 at 10:42:02AM +0300, Mike Rapoport wrote:
>On Thu, Jul 24, 2025 at 04:36:59PM -0700, Deepak Gupta wrote:
>> commit bcc9d04e74 ("mm: Introduce ARCH_HAS_USER_SHADOW_STACK") introduced
>> `ARCH_HAS_USER_SHADOW_STACK`. Introducing `ARCH_HAS_KERNEL_SHADOW_STACK`
>> so that arches can enable hardware assistance for kernel shadow stack.
>>
>> If `CONFIG_DYNAMIC_SCS` or `CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK` are
>> selected, skip compiler flag `-fsanitizer=shadow-call-stack`.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  Makefile   | 2 +-
>>  mm/Kconfig | 6 ++++++
>>  2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 35e6e5240c61..7e3ecca9353d 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -987,7 +987,7 @@ LDFLAGS_vmlinux += --gc-sections
>>  endif
>>
>>  ifdef CONFIG_SHADOW_CALL_STACK
>> -ifndef CONFIG_DYNAMIC_SCS
>> +ifeq ($(or $(CONFIG_DYNAMIC_SCS),$(CONFIG_ARCH_HAS_KERNEL_SHADOW_STACK)),false)
>>  CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
>>  KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
>>  KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 781be3240e21..f295ea611cdb 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1367,6 +1367,12 @@ config ARCH_HAS_USER_SHADOW_STACK
>>  	  The architecture has hardware support for userspace shadow call
>>            stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>>
>> +config ARCH_HAS_KERNEL_SHADOW_STACK
>> +	bool
>> +	help
>> +	  The architecture has hardware support for kernel shadow call
>> +          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
>
>nit: tab and two space for indentation of the help text

Will fix it.

>
>> +
>
>I think both ARCH_HAS_USER_SHADOW_STACK and ARCH_HAS_KERNEL_SHADOW_STACK
>belong to arch/Kconfig rather than mm/Kconfig

Do you want me to move it?
This basically means that hardware shadow stack is supported or not.
It needs mm support. I think thats why user one landed here. I followed.

If it impacts mm, it should be here, right?

>
>>  config ARCH_SUPPORTS_PT_RECLAIM
>>  	def_bool n
>>
>>
>> --
>> 2.43.0
>>
>
>-- 
>Sincerely yours,
>Mike.
