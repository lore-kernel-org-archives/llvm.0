Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D6B2EE968
	for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 16:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753462589; cv=none; b=IIYpWbdPj36p0S0xbyYdbVQhC+XQ/528Rj1KOi0oNOfagZDVMgptyeo5uZcgHmrQ1AQTzsetX+y/b3PmedBDS8G6GpOVPHfDGkjuhTxv2rV12WukOT6y8w+XXm5iVmVThOuQZfN6UD9qxXemRoLyWfndhrHDWvJzmcxGYLv3Pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753462589; c=relaxed/simple;
	bh=NTQ9y5wzsLsqxpaNqmlZYWgK3Cf2/Yl8wkm2X8FzHig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFUiZruzkA8RcPtJInhamtSJ7YRr1a/nV4wqvA5TsOFwaU6JTnVgs/ZAln7zIvc8M4izL6tlwoHHspGP58mpLWLHxLlTCg0HPgccidAigzVOKVWIWVo17OQPu0VdDuA5phICXVxJMAgopbiz4W05r0ptWmPKZUsG7Ek8pSRJet8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=JH1kdhwj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="JH1kdhwj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-748f5a4a423so1738327b3a.1
        for <llvm@lists.linux.dev>; Fri, 25 Jul 2025 09:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753462586; x=1754067386; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WtgAXG2zxYUZH6Gw9dzWRKSuSkjlPnsCAnmjzmjgcv8=;
        b=JH1kdhwj7IUUs4EI/ea/Qjw+aZO+wPgZ5IFSiOQ/7fruUEgIaXrFKa02jp+mArEVzR
         SVmhW6gHDHTWCsmwP7SoRTazfbjGtIfRNv03rr7xT4SUtZAC3QnGxl+r6zIhsum9CdjX
         pqNnpwbmgL2yBmKdtqV/Eii0XIyp9A5jSprC4IIhp5c2vnJRw2GvGjqPw83Mf4GVCq9C
         DjA7We+bSINALYmbuu3B4LNZi9ub8kCJLmihRL0me6As6iZNsdW/6oRU++dqlE5etOn+
         qIEdphI8s2Z3KvJK+1vc6m/Zq8kJXuwa81uvBGikv5gDimhyJMqVeIay2FWQSEAisiDs
         +dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753462586; x=1754067386;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtgAXG2zxYUZH6Gw9dzWRKSuSkjlPnsCAnmjzmjgcv8=;
        b=wuc6MDCH3vNusxl0WSthhtG04RLVuiXM/Bj4HrNWOdHvzrdRh6pMHs+xWuV/nZHzae
         XRpU3g7T/azKvD4p1HSUg86fvEVVP1CBWdKuIyv+i9O5hUOtrE8S/USTtHF1X7mpPkCb
         wfCTN0Iz4IOrwSETou9kDs/2DP/g5KJeXmi5YyLxFMAgcVTVTO9FZGo8SFFJu2ustslr
         VI/e9dQOMjwBBEE47OX5qW63wX8JaNu827NbLyolJraPv22v+LYChqdMZY0JmVyffpjk
         wIWbywGlvB51/O/am4Ktdkldrq4JVV2W/KyGeH0+oVHi2CINqABx2ruAAbKYJ7JnksbN
         ihRw==
X-Forwarded-Encrypted: i=1; AJvYcCWZpQuiWF2O/6zgkQFMaI+49t3fC+M8wn2s8nwpfP3hTzK2VR1ao29SMT7NT8aKjGoP+qG5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9bvd3EiaAmzdXhxm+3OeiEqtl8DZbY12xaRoSDHnGtVAeQooM
	2nhwkf6ghWvxu9sMPyU0nEVhn1KCkKQmS84HPwfJ0wdOkfeW03U7ZBdIiD6N5b+1vw0=
X-Gm-Gg: ASbGncua9WvKRUlpgtz0FqUBTLL2GbGf/c4yn1oRHVMJpKT8M08KUAHTS3l9UqMYIwv
	2bcbyzOkjM70qYA/MUhyGivm3zsON06xscMQ3BBuVxWXSg3uyPsxXy6gHi+NXrNnBAhPJbJykdo
	jqTPPkHgO8Cb5Cj3QL/TZtGjQJHxApX+6fIJcxaCGinsakrAGY8ct7hfvouPOE5tpuUwghBJ/SP
	mjXNTesF+qNCPRReGk5m7Gk4xZaSugYpk0qNCGKxW6zAOfGIT5nS91/H5XzlleLpSvmDEvC4+rf
	oZPUGrhHUE/E+BQNWblWLEPvUsPO1ILXNRz1ACrNCmuZ7EcZW22e3UWn9ZnC5Ht/NdQyZaBPT+P
	sYWzoaePxapHL6tVO5Jg02qCBbtNnDJ4iZdKglFttdbw=
X-Google-Smtp-Source: AGHT+IETBPZe8HlkltWjZZmkG8X/wqZoM335inOFOubYlGpOP3IUTPKQOC96UsFlPqNZzJonrdrGDQ==
X-Received: by 2002:a05:6a00:b50:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-76335b7ef36mr4059760b3a.19.1753462586198;
        Fri, 25 Jul 2025 09:56:26 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f7f6d6312sm231084a12.62.2025.07.25.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:56:25 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:56:22 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Sami Tolvanen <samitolvanen@google.com>
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
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
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
	broonie@kernel.org, cleger@rivosinc.com, apatel@ventanamicro.com,
	ajones@ventanamicro.com, conor.dooley@microchip.com,
	charlie@rivosinc.com, samuel.holland@sifive.com, bjorn@rivosinc.com,
	fweimer@redhat.com, jeffreyalaw@gmail.com,
	heinrich.schuchardt@canonical.com, andrew@sifive.com,
	ved@rivosinc.com
Subject: Re: [PATCH 02/11] riscv: update asm call site in `call_on_irq_stack`
 to setup correct label
Message-ID: <aIO3NtHJ1iCoGOs7@debug.ba.rivosinc.com>
References: <20250724-riscv_kcfi-v1-0-04b8fa44c98c@rivosinc.com>
 <20250724-riscv_kcfi-v1-2-04b8fa44c98c@rivosinc.com>
 <20250725153351.GB1724026@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20250725153351.GB1724026@google.com>

On Fri, Jul 25, 2025 at 03:33:51PM +0000, Sami Tolvanen wrote:
>On Thu, Jul 24, 2025 at 04:36:55PM -0700, Deepak Gupta wrote:
>> Call sites written in asm performing indirect call, they need to setup
>> label register (t2/x7) with correct label.
>>
>> Currently first kernel was compiled with `-save-temps` option and
>> normalized function signature string is captured and then placed at the
>> asm callsite.
>>
>> TODO: to write a macro wrapper with toolchain support.
>>
>> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
>> ---
>>  arch/riscv/kernel/entry.S | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> index 2660faf52232..598e17e800ae 100644
>> --- a/arch/riscv/kernel/entry.S
>> +++ b/arch/riscv/kernel/entry.S
>> @@ -389,6 +389,7 @@ SYM_FUNC_START(call_on_irq_stack)
>>  	load_per_cpu t0, irq_stack_ptr, t1
>>  	li	t1, IRQ_STACK_SIZE
>>  	add	sp, t0, t1
>> +	lui t2, %lpad_hash("FvP7pt_regsE")
>
>Ah, I see. The plan is to hardcode the signatures in assembly code and
>keep them manually in sync with C code. When we implemented KCFI, we
>thought this would become extremely tedious to maintain after a while.

This is extremely tedious and not maintainable and primary reason (among
other secondary ones) to keep this patch series as RFC.

>Do you have any plans to add KCFI-style __kcfi_typeid_<function> symbols
>that would allow labels to be determined from C type signatures instead?

Yes something on similar lines. I have asked toolchain folks (Monk and Kito)
on how best to support this.

>
>Sami
