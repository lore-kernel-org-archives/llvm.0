Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048901A238F;
	Fri, 19 Jun 2026 19:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781897531; cv=none; b=g/BU0H12dDq+09lDrIQ8I3B2Ql6IwLaRpQTNVS0kBZDq95ipwK5JX4Yu/C62eNaOMWNTzcZwlkETQfhJPHEthT7+kAGV3XhWRp/ArCZo/Hi96s+Kovnykz7adnoOm7eIR5/Fnc+1AdtXgVu9y+Di/QeIZ6uzLjWSnUfNlgV/IFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781897531; c=relaxed/simple;
	bh=M3rdpTXb8BAjh9YioAyMCfpnak4SC63nlnkoeJquVxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HDGS8JxZ5db8cLbBleIHzczjSdMExdbMqxgXFx3HUp3pF1zm3xSRQUNAZhK7dZJ2wQKv075EFtXNpHbcel+CZ86N4jdqTDcNtjV8f3WRfng7cRmsuC7YiuSrZ0XnZE0wtO6nSKHgocsFPhDga499XKACSZnDvrSi/74XUh9iPRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNJTX/OJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNJTX/OJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9A51F000E9;
	Fri, 19 Jun 2026 19:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781897530;
	bh=SesHwE+9/VS5V/iG7+22Hi9CQjWlWoKzeBfXgS3pXhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=YNJTX/OJ9ReJnUycgJG1nqaCqabacWFEO6ALPepkIy3kbJxomBT5ZxAlWqAmZ9nQb
	 irhRObmVMVzt4iM9Lg87FMsKz0sY1yv6LWiFOFEfE80adAVa+JlWQ26dUgv9rQ4PVK
	 +JX1n/TXzsM4yUMmVcCdinQmT97warp7sECQA16L2WvSc+DOYS20VMA/YntQZ1e/qv
	 m++eOZNPC6F/+KAlNObS2fe5vLeNboLRaIYubH/YkC+BRJLp+xdAaaAWM63hmPUl+a
	 HJr6f2c742L/5KK2jtWJJoOMpnuKXRjFeuk7BLDAEgp5DUvxuYZrBvqXCNUjoduA33
	 XPI33stTtLOJg==
From: Thomas Gleixner <tglx@kernel.org>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Peter Zijlstra
 <peterz@infradead.org>, Qing Wang <wangqing7171@gmail.com>
Cc: mathieu.desnoyers@efficios.com, dvyukov@google.com,
 justinstitt@google.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, mark.rutland@arm.com, mingo@kernel.org,
 morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
 syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
In-Reply-To: <249b8ebd-1ef8-4c17-bc9c-a63c051c2369@I-love.SAKURA.ne.jp>
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
 <20260602030854.574038-1-wangqing7171@gmail.com>
 <20260602104255.GG4149641@noisy.programming.kicks-ass.net>
 <249b8ebd-1ef8-4c17-bc9c-a63c051c2369@I-love.SAKURA.ne.jp>
Date: Fri, 19 Jun 2026 21:32:08 +0200
Message-ID: <8733yiconb.ffs@fw13>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

%On Fri, Jun 19 2026 at 21:45, Tetsuo Handa wrote:
> On 2026/06/02 19:42, Peter Zijlstra wrote:
>> On Tue, Jun 02, 2026 at 11:08:54AM +0800, Qing Wang wrote:
>>> There is an bug which is an uninitialized stack variable use in
>>> `rseq_exit_user_update()` reported by syzbot:
>>>
>>> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
>>>
>>> The local variable:
>>> ```c
>>> 	struct rseq_ids ids = {
>>> 		.cpu_id	 = task_cpu(t),
>>> 		.mm_cid	 = task_mm_cid(t),
>>> 		.node_id = cpu_to_node(ids.cpu_id),
>>> 	};
>>> ```
>> 
>> FWIW, I've no idea what that ``` nonsense is, but it does not belong in
>> Changelogs. I've removed it.
>> 
>
> It seems that this problem is still happening after
> commit 6d99479799c6 ("rseq: Fix using an uninitialized stack variable
> in rseq_exit_user_update()") was applied. Please check.

It seems is not really helpful. If you observe the problem can you
please provide the full debug splat?
