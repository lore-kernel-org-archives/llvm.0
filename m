Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD85346FB3;
	Tue,  2 Jun 2026 10:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780396982; cv=none; b=JAjv060MMjgskcJ6uq210gpCZNM8PY/+65plAttbEgtrNN3g0jEbbKVzCK2606R0lHh+TQQnkYtQ7AERwcTWYxTaomtatTdnIhz+kB/ZqkaAA4hWew/172iK13PrLQcX9RLWQmt0R+qo/mDUM+bkyri7i25Iv0VklzeWsfItOEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780396982; c=relaxed/simple;
	bh=W5rxfSFMzLk4VSuPOkD7ArR3fzOC654FpFEO13lSgiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VG/zONS2FRzEL73gjiVvAC/sR/V3J8NPAPgQERlUlUdvaqicPKWJ0x3GirjqynrfecY5es55KJJFsN72/3o0xhcG9dN7c71kWuMSxKgnZ6hJEI9n6QrC9FsLXTzT2/u8k/t6mknTbXGN81ZekPNEoTy5YiUklzKu99TvJNLEvDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=K3tV1nJc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="K3tV1nJc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bHLmjk/6oDqG5nRWK88VT4S9DfvVpPURdycxeEWsr78=; b=K3tV1nJc5YYTCUEeLGoAG7uosf
	LoUGaACpMjQD9U11lVFf/JqME569WTe/m4d5+BE0ajVmDbgIEJzPkV04q4OOnNwv3TeG90iMQH2vJ
	XKdXBueErPont79SSVtA1EcwWIQsktVGZBdTWmQpFrWpREon6ngvt72piCBHs4GMtHfekdG/tJXfl
	NFxS1haW4kv2h41rCDPvmOzLdZhr5rvYvZYp4HmG9C1LfSQqf2l9THpHGm1i5nad0wrJpdX9wLH2D
	/3oj8auR1eTwdJz97eNlTRmhqvpOqkEHAvfMJ4KFWNCRKKoj7zxhSGLsPokO2dUZ8WRwmDfmPAVyV
	z/AdM5jg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUMaG-00000001nDk-33tj;
	Tue, 02 Jun 2026 10:42:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F1606300339; Tue, 02 Jun 2026 12:42:55 +0200 (CEST)
Date: Tue, 2 Jun 2026 12:42:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Qing Wang <wangqing7171@gmail.com>
Cc: mathieu.desnoyers@efficios.com, dvyukov@google.com,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, mark.rutland@arm.com, mingo@kernel.org,
	morbo@google.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	syzbot+185a631927096f9da2fc@syzkaller.appspotmail.com,
	tglx@kernel.org
Subject: Re: [PATCH v2] rseq: fix using an uninitialized stack variable in
 rseq_exit_user_update
Message-ID: <20260602104255.GG4149641@noisy.programming.kicks-ass.net>
References: <20260601143934.GT3493090@noisy.programming.kicks-ass.net>
 <20260602030854.574038-1-wangqing7171@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602030854.574038-1-wangqing7171@gmail.com>

On Tue, Jun 02, 2026 at 11:08:54AM +0800, Qing Wang wrote:
> There is an bug which is an uninitialized stack variable use in
> `rseq_exit_user_update()` reported by syzbot:
> 
> BUG: KMSAN: kernel-infoleak in rseq_set_ids_get_csaddr include/linux/rseq_entry.h:502 [inline]
> 
> The local variable:
> ```c
> 	struct rseq_ids ids = {
> 		.cpu_id	 = task_cpu(t),
> 		.mm_cid	 = task_mm_cid(t),
> 		.node_id = cpu_to_node(ids.cpu_id),
> 	};
> ```

FWIW, I've no idea what that ``` nonsense is, but it does not belong in
Changelogs. I've removed it.
