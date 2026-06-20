Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF32571DA;
	Sat, 20 Jun 2026 19:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781985074; cv=none; b=MAIs/k14iFfpzYKTqadP7x8onI8GrzdaomVL1XuUbbd66yQ8ClZFMXGHAPznpR4fVd8Qh/9AKOmk6NLXeCbkYMwjfcIlZYZo8RF0lQI73lazaLjHWZ6mJZvA6N0tdHqVtMwoi1mcVVXEy3R1WKucvPD0cwfobrpfblNywPKZFa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781985074; c=relaxed/simple;
	bh=zkNv0YB6BQ2KOyQatadSpSxKg8r5Sxikbr2vWWS8Yhg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K75JDYj1FT8xjXg07GZcRk0bIJ5U3GwKLjDdgWT3dOiYx8Y3rQxOD4aIIg85SWKFIk55t1n9V5OKjo8XCiEfsNnxgxD7tNroRbdRSnm/5XE0KsM/PaGlzyUjXX9rGLtuLRk0uMjhfdaj4d4S6HbuaRn502130wdz3K4DryVKXcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ubae4kmp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ubae4kmp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048701F000E9;
	Sat, 20 Jun 2026 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781985072;
	bh=CfLMSNpOBtJxfJ/d4d9pXXtBE4sMpmroxd3E7m+GI8Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ubae4kmpBJFK48PDQle/qK4Z1okhseDvbsoXTZURFsdXOWJsSzOnCtKoNL9S7JeWy
	 tzjqHkkq08bXlphMAvaezNnOkGDVROJ0HYmxjLmFF5xx0n8/ARYcg8GpxA4ycnVGwK
	 gZfZzk0ZxcnVwTwwu3lxBjIJX+8XwW5mpzVHzD/Ii1Bwa+kBh49EG5w09OtmTipecT
	 tVFJgfUwzlLFe4wacqwRjMdIsGJ+f78MO7sQ+CGltde66Yq7/952kebSRmw1h82jYB
	 zFQrRkHGGeyq0JfRVv03tV5DyHYIPI6fFMdUQrCRqSYOV/9+2sXeStlHC7bdQ6/Sg8
	 7V2O6LYoKjdAQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Peter Zijlstra
 <peterz@infradead.org>, Qing Wang <wangqing7171@gmail.com>
Cc: mathieu.desnoyers@efficios.com, dvyukov@google.com,
 justinstitt@google.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, mark.rutland@arm.com, mingo@kernel.org,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com, Alexander Potapenko
 <glider@google.com>
Subject: Re: [PATCH v2] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
In-Reply-To: <8971cc3f-c0dc-49ab-a278-690a676cd5a9@I-love.SAKURA.ne.jp>
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
 <20260602030854.574038-1-wangqing7171@gmail.com>
 <20260602104255.GG4149641@noisy.programming.kicks-ass.net>
 <249b8ebd-1ef8-4c17-bc9c-a63c051c2369@I-love.SAKURA.ne.jp>
 <8733yiconb.ffs@fw13>
 <8971cc3f-c0dc-49ab-a278-690a676cd5a9@I-love.SAKURA.ne.jp>
Date: Sat, 20 Jun 2026 21:51:09 +0200
Message-ID: <871pe1ng7m.ffs@fw13>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Sat, Jun 20 2026 at 07:34, Tetsuo Handa wrote:
> On 2026/06/20 4:32, Thomas Gleixner wrote:
>> %On Fri, Jun 19 2026 at 21:45, Tetsuo Handa wrote:
>>> On 2026/06/02 19:42, Peter Zijlstra wrote:
>>>> On Tue, Jun 02, 2026 at 11:08:54AM +0800, Qing Wang wrote:
>>>>> There is an bug which is an uninitialized stack variable use in
>>>>> `rseq_exit_user_update()` reported by syzbot:
>>>>>
>>>>> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
>>>>>
>>>>> The local variable:
>>>>> ```c
>>>>> 	struct rseq_ids ids = {
>>>>> 		.cpu_id	 = task_cpu(t),
>>>>> 		.mm_cid	 = task_mm_cid(t),
>>>>> 		.node_id = cpu_to_node(ids.cpu_id),
>>>>> 	};
>>>>> ```
>>>>
>>>> FWIW, I've no idea what that ``` nonsense is, but it does not belong in
>>>> Changelogs. I've removed it.
>>>>
>>>
>>> It seems that this problem is still happening after
>>> commit 6d99479799c6 ("rseq: Fix using an uninitialized stack variable
>>> in rseq_exit_user_update()") was applied. Please check.
>> 
>> It seems is not really helpful. If you observe the problem can you
>> please provide the full debug splat?
>
> Please fetch the full debug splat from https://syzkaller.appspot.com/bug?extid=185a631927096f9da2fc .
> This problem is still happening as of commit 9ecfb2f7287a which includes commit 6d99479799c6.

That's not a code problem. That's a KMSAN/compiler issue.

> =====================================================
> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]

So it claims that the copy to user in rseq_set_ids_get_csaddr() is
leaking kernel info through an unitialized variable.

The ids struct is on stack and was initialized correctly ...

> BUG: KMSAN: kernel-infoleak in rseq_update_usr include/linux/rseq_entry.h:536 [inline]
> BUG: KMSAN: kernel-infoleak in rseq_exit_user_update include/linux/rseq_entry.h:645 [inline]

here in rseq_exit_user_update().

ffffffff90ff6433:       48 89 df                mov    %rbx,%rdi
ffffffff90ff6436:       e8 e5 3f db f0          call   ffffffff81daa420 <task_cpu>
ffffffff90ff643b:       89 c7                   mov    %eax,%edi
ffffffff90ff643d:       89 45 98                mov    %eax,-0x68(%rbp)         ids.cpu_id
ffffffff90ff6440:       8b 8b 94 0b 00 00       mov    0xb94(%rbx),%ecx
ffffffff90ff6446:       b8 ff ff ff 9f          mov    $0x9fffffff,%eax
ffffffff90ff644b:       21 c1                   and    %eax,%ecx
ffffffff90ff644d:       89 4d 90                mov    %ecx,-0x70(%rbp)
ffffffff90ff6450:       89 4d 9c                mov    %ecx,-0x64(%rbp)         ids.mm_cid
ffffffff90ff6453:       89 7d ac                mov    %edi,-0x54(%rbp)
ffffffff90ff6456:       e8 25 40 db f0          call   ffffffff81daa480 <cpu_to_node>
ffffffff90ff645b:       89 45 94                mov    %eax,-0x6c(%rbp) 
ffffffff90ff645e:       89 45 a0                mov    %eax,-0x60(%rbp)         ids.node_id
ffffffff90ff6461:       c7 45 a4 00 00 00 00    movl   $0x0,-0x5c(%rbp)
ffffffff90ff6468:       48 8b bb 50 0b 00 00    mov    0xb50(%rbx),%rdi
ffffffff90ff646f:       e8 9c 3e db f0          call   ffffffff81daa310 <mask_user_address>

> BUG: KMSAN: kernel-infoleak in __rseq_exit_to_user_mode_restart include/linux/rseq_entry.h:674 [inline]
> BUG: KMSAN: kernel-infoleak in rseq_exit_to_user_mode_restart include/linux/rseq_entry.h:703 [inline]
> BUG: KMSAN: kernel-infoleak in exit_to_user_mode_loop kernel/entry/common.c:103 [inline]
> BUG: KMSAN: kernel-infoleak in __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
> BUG: KMSAN: kernel-infoleak in irqentry_exit_to_user_mode_prepare include/linux/irq-entry-common.h:244 [inline]
> BUG: KMSAN: kernel-infoleak in irqentry_exit_to_user_mode include/linux/irq-entry-common.h:315 [inline]
> BUG: KMSAN: kernel-infoleak in irqentry_exit+0x4a6/0xa40 kernel/entry/common.c:165
>  rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
>  rseq_update_usr include/linux/rseq_entry.h:536 [inline]
>  rseq_exit_user_update include/linux/rseq_entry.h:645 [inline]
>  __rseq_exit_to_user_mode_restart include/linux/rseq_entry.h:674 [inline]
>  rseq_exit_to_user_mode_restart include/linux/rseq_entry.h:703 [inline]
>  exit_to_user_mode_loop kernel/entry/common.c:103 [inline]
>  __exit_to_user_mode_prepare include/linux/irq-entry-common.h:207 [inline]
>  irqentry_exit_to_user_mode_prepare include/linux/irq-entry-common.h:244 [inline]
>  irqentry_exit_to_user_mode include/linux/irq-entry-common.h:315 [inline]
>  irqentry_exit+0x4a6/0xa40 kernel/entry/common.c:165
>  exc_page_fault+0x7e/0xb0 arch/x86/mm/fault.c:1539
>  asm_exc_page_fault+0x2b/0x30 arch/x86/include/asm/idtentry.h:595

And then it claims that the local variable was created in a completely
unrelated piece of code:

> Local variable st.i.i created at:
>  __do_sys_statfs fs/statfs.c:193 [inline]
>  __se_sys_statfs fs/statfs.c:191 [inline]
>  __x64_sys_statfs+0x73/0x200 fs/statfs.c:191
>  x64_sys_call+0x334c/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:138

The above backtrace clearly tells that the CPU cannot have been in that
code because it's in a user mode page fault exception.

> Bytes 0-3 of 4 are uninitialized
> Memory access of size 4 starts at ffff8881192c3e78
> Data copied to user address 00007f05e438a680
 
The code is correct and does the right thing, so something is wrong in
KMSAN land. Alexander?

Thanks,

        tglx


