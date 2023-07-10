Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A613AF9;
	Mon, 10 Jul 2023 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mMEtO0ILV0zzGA/7s8mJgCRE8FNYrT7PYWMvQHEnv3A=; b=jrZpOtnFa71MFjpKOAKB3+ZqQ7
	sqHaKfuhlsWGbEsOyKZusSEQyFXpzuKL48olmOrjxwNB/sIHcbOPC6Hr+VkTGam4AD08gMW9ngCp2
	ql7J8555tOaGsjsGzahhr7mv/bWAv0gbnPvts+0Uz0/M+JHgQQsQwoZfi4R5/i80cRunEvqeB7OLf
	j9GozT3+nAQZv5T1NbMlyrgQu3+ZwAp7X6QVAZpK58jF5CS4gxVErOPhdvuButzJSdNJU05peIKdR
	XaThj9QJrH2u3UTtEwx6Ny0KsQWHNOtaKxKVUa6eSTN2t+Lu2LlfhLMe5cjL1yuD4BMek44jKR447
	fcUS7EQg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qIvaI-000qkk-1i;
	Mon, 10 Jul 2023 18:26:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 52506300195;
	Mon, 10 Jul 2023 20:26:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2A20E240EBDA6; Mon, 10 Jul 2023 20:26:05 +0200 (CEST)
Date: Mon, 10 Jul 2023 20:26:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Wander Lairson Costa <wander@redhat.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [peterz-queue:sched/maybe 1/14] ERROR: modpost: vmlinux: local
 symbol '__put_task_struct_rcu_cb' was exported
Message-ID: <20230710182605.GA3044890@hirez.programming.kicks-ass.net>
References: <202307110147.tDoRemZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202307110147.tDoRemZ7-lkp@intel.com>

On Tue, Jul 11, 2023 at 01:48:23AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
> head:   69ff1e365682e2d516364c010b51f8a95140cd94
> commit: eb15cb094ddb0227c9dfe5eb836d1a4357f070fd [1/14] kernel/fork: beware of __put_task_struct calling context
> config: riscv-randconfig-r042-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/config)
> compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/reproduce)
> 

> >> ERROR: modpost: vmlinux: local symbol '__put_task_struct_rcu_cb' was exported

The commit above introduces this function:

+void __put_task_struct_rcu_cb(struct rcu_head *rhp)
+{
+       struct task_struct *task = container_of(rhp, struct task_struct, rcu);
+
+       __put_task_struct(task);
+}
+EXPORT_SYMBOL_GPL(__put_task_struct_rcu_cb);

How the heck does that become a local symbol?
