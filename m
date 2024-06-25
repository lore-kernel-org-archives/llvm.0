Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0D02E62F
	for <llvm@lists.linux.dev>; Tue, 25 Jun 2024 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719330311; cv=none; b=KOUaHkkG3wqRDqcmfBc7INKE9GgbIYOG704jzvXB22ekwkVN7/YVuLhuKpf9pSzhxpKIpHhG7+limC5dZ22i0HytppEZxtUlg3gBA5jLiDJPyBH6+N8ICHYBZMel+a7SjVNMsRJu4SSq4Cfcs1w9L50gtI46Pg24FL9K4soLI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719330311; c=relaxed/simple;
	bh=hf5eUmooJC7dWoChVFFPsyBXOKh1NM93BaxyD/i/B2Y=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=ZEQGz9EVPOTJjrm4DlPCMFpm1OhhXp3Cv7Fj1FUE42Cw9PtinRv1Xep8QtKdnisd2TMxxzQ5gnBk/W4aXeuHNWgHHEJzXeCKV0AaRMeldurjfdMwBQZ41Kdrp56jLSVTaG25iOmC+h+OrugcaMUJLGI+FBDeAvNtakFgEL3SBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=ts7wjuI0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="ts7wjuI0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-713fa1aea36so2718433a12.1
        for <llvm@lists.linux.dev>; Tue, 25 Jun 2024 08:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1719330309; x=1719935109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tZOMKcRfzsOTLcaI6P+nurFJ1oFQE37Rn/GemYRQhk=;
        b=ts7wjuI0igr2viLqYR7th0EjLztMcBJoOfdC6y1CVuwMb2e+FVyfKvh+dWBJxHKnOK
         URR7fkk33dZFYOoZOx23eu+WmzRwGYxi4FILGXu9ZV0zC20bMZkH2LHDjxdIKFoXeW1H
         0SjGtxEehm0RZUrQbGyPmCDJgV5+uyL1sjF+f7COI6f1RE2jNSbFkzFSblp3zhlFOCd9
         WGtjb935+bJIA6u7IRk6g57qBQwkbOL7FiUNaGSaV40hMhVhC2t8veIyQNBV0WN1m53g
         islOUzz/zdGYD6FzrTYNf5F6pt7ybk9wZFzf46+OAyfFMCA9+jiRGg6htzaqwd0Q78Yl
         idhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719330309; x=1719935109;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tZOMKcRfzsOTLcaI6P+nurFJ1oFQE37Rn/GemYRQhk=;
        b=Aki9YUb1lpMfsKqMk80jThi1BsG9w+x55LbEkD6fCy0YgxjjkNAqUDWmmzdUkm+v5o
         T7YdBT6iQ4TzO5zvfYqzD1XhUmf4uJqTlIm/YSa4rL56weUiZzTgutxhnmyBGzYYVkPt
         O8w7KZR3Nl1ThhWlrbVXVSsGXyDKuKphILNTCqJWhZturpXtE50RETROfchQGjDcmtJs
         CVcVG3aItzAfvavOCLHHeOSVfztQvMkVWdN55nUOv7QTYg1jKdbLYToEZx3g0Z6cvNDU
         812PBCFlp9re4z4RiWgyCMjZ5YjpRMttby0D/7RE9ZRU9nj7GD2YjYaBlRwCOX4ELxL0
         wttQ==
X-Forwarded-Encrypted: i=1; AJvYcCVewdcGHHxN/PZMRxhdR4xASY5wHyvV/gA5w73xxZGsTeKi6In9G16MgL2K4x77w81lJBcdY+tGHywWEsgJbtTMf/cP/Q==
X-Gm-Message-State: AOJu0YwIcFxm5Pb+RjeAZLtvW+i6a6Peq2EZbeB9hHkfikYidANuyRyL
	IZlF8L/Nm/guiwQBPEkT7OTzpBMtzdUQll+PpH8x3uK3B3tZok+5zH3G6syTUd4=
X-Google-Smtp-Source: AGHT+IGSYCPwWhLTCA7tsdYi2n2YERYEuj0Bk7h22FlWi9B1mlJhhHz/QYqnR8FLA80DAw08tCIl9Q==
X-Received: by 2002:a05:6a20:b918:b0:1bc:ed85:3920 with SMTP id adf61e73a8af0-1bcee9893f4mr7574816637.52.1719330307012;
        Tue, 25 Jun 2024 08:45:07 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70677235b41sm4843347b3a.24.2024.06.25.08.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:45:06 -0700 (PDT)
Date: Tue, 25 Jun 2024 08:45:06 -0700 (PDT)
X-Google-Original-Date: Tue, 25 Jun 2024 08:45:05 PDT (-0700)
Subject:     Re: [PATCH 1/8] riscv: stacktrace: convert arch_stack_walk() to noinstr
In-Reply-To: <cb71a5e9-aafe-48af-9f16-baae407d467b@ghiti.fr>
CC: andy.chiu@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, alexghiti@rivosinc.com, zong.li@sifive.com, rostedt@goodmis.org,
  mhiramat@kernel.org, Mark Rutland <mark.rutland@arm.com>, nathan@kernel.org,
  ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, puranjay@kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
  llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-37c10407-3c40-4045-9627-0b53f770cb4e@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 18 Jun 2024 02:55:32 PDT (-0700), alex@ghiti.fr wrote:
> Hi Andy,
>
> On 13/06/2024 09:11, Andy Chiu wrote:
>> arch_stack_walk() is called intensively in function_graph when the
>> kernel is compiled with CONFIG_TRACE_IRQFLAGS. As a result, the kernel
>> logs a lot of arch_stack_walk and its sub-functions into the ftrace
>> buffer. However, these functions should not appear on the trace log
>> because they are part of the ftrace itself. This patch references what
>> arm64 does for the smae function. So it further prevent the re-enter
>> kprobe issue, which is also possible on riscv.
>>
>> Related-to: commit 0fbcd8abf337 ("arm64: Prohibit instrumentation on arch_stack_walk()")
>> Fixes: 680341382da5 ("riscv: add CALLER_ADDRx support")
>> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
>> ---
>>   arch/riscv/kernel/stacktrace.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
>> index 528ec7cc9a62..0d3f00eb0bae 100644
>> --- a/arch/riscv/kernel/stacktrace.c
>> +++ b/arch/riscv/kernel/stacktrace.c
>> @@ -156,7 +156,7 @@ unsigned long __get_wchan(struct task_struct *task)
>>   	return pc;
>>   }
>>
>> -noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>> +noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>>   		     struct task_struct *task, struct pt_regs *regs)
>>   {
>>   	walk_stackframe(task, regs, consume_entry, cookie);
>>
>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> I'll try to make this go into -fixes, this is in my fixes branch at least.

Looks like there's some comments on the rest of the patch set.

Andy: aree you going to send a v2, or do you want me to just pick this 
one up onto fixes now and then handle the rest later?

>
> Thanks,
>
> Alex
