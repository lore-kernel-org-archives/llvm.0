Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B777D1D4152
	for <llvm@lists.linux.dev>; Tue,  5 Nov 2024 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730814273; cv=none; b=FBCz01r93WCK42EW4Ohbk9n0RLiFDNCv1iCk/l1Tth8p2ER/Q9VApB3zHmfqkUI/sx6iNrimdpD9PMoc/9hOgtTX5tgBDVI4tGHR5lr+PPxijtSUzXSpSUvpHE5jIHURvK8L8vqT55UuT9i6i5/zZ0e7x/XzVlhwd0fweSaIAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730814273; c=relaxed/simple;
	bh=98U9Z2AD0kDN3G6/Ym86C6dNCyUZfXoy+4DqYRUfv6c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B0DTkpE2U8hikIqDYHFDvAaSTtfRIKCTKDpfBHadJJrT8LmJqX0/GLy+T8B2dXnLOl1KRPpd4mEsMCPn9pOwV2LGKrdbXcCBiU9TGNd24XdQsbnMxf04pyrp5rSrp7HkEM3joSO6wtDgwFsJGTa9KLjCN1ae0cIOspH/EcCGSfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21972240006;
	Tue,  5 Nov 2024 13:44:25 +0000 (UTC)
Message-ID: <5dba5a49-91e5-4988-9018-63b146b5e26c@ghiti.fr>
Date: Tue, 5 Nov 2024 14:44:25 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] riscv: mm: Log potential KASAN shadow alias
Content-Language: en-US
To: Samuel Holland <samuel.holland@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, kasan-dev@googlegroups.com
Cc: llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Alexandre Ghiti <alexghiti@rivosinc.com>, Will Deacon <will@kernel.org>,
 Evgenii Stepanov <eugenis@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
References: <20241022015913.3524425-1-samuel.holland@sifive.com>
 <20241022015913.3524425-6-samuel.holland@sifive.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241022015913.3524425-6-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: alex@ghiti.fr

Hi Samuel,

On 22/10/2024 03:57, Samuel Holland wrote:
> When KASAN is enabled, shadow memory is allocated and mapped for all
> legitimate kernel addresses, but not for the entire address space. As a
> result, the kernel can fault when accessing a shadow address computed
> from a bogus pointer. This can be confusing, because the shadow address
> computed for (e.g.) NULL looks nothing like a NULL pointer. To assist
> debugging, if the faulting address might be the result of a KASAN shadow
> memory address computation, report the range of original memory
> addresses that would map to the faulting address.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>   - New patch for v2
>
>   arch/riscv/mm/fault.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index a9f2b4af8f3f..dae1131221b7 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -8,6 +8,7 @@
>   
>   
>   #include <linux/mm.h>
> +#include <linux/kasan.h>
>   #include <linux/kernel.h>
>   #include <linux/interrupt.h>
>   #include <linux/perf_event.h>
> @@ -30,6 +31,8 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
>   	pr_alert("Unable to handle kernel %s at virtual address " REG_FMT "\n", msg,
>   		addr);
>   
> +	kasan_non_canonical_hook(addr);
> +
>   	bust_spinlocks(0);
>   	die(regs, "Oops");
>   	make_task_dead(SIGKILL);


That's nice, I used to do that by hand :)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

