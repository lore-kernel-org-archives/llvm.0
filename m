Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467EA2581;
	Mon, 10 Jul 2023 18:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62763C433C7;
	Mon, 10 Jul 2023 18:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689015419;
	bh=6a95MaG5wnaCRzHywoqVC7AedCbdkYsnbaua7oz0Ap4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VV3c4q4fIQk3bJJZurOsgxU3/DA+OO/FKtsTS55crdR3aiz4w7kq002XBpQD/tsIm
	 B5Oj9ayfMXMDyC/qx1mGP6dXGjQlM3grp1pEUSxy/8RnS0+P/kwFG3o6YisGXpAtGU
	 oyk0F6d5zFcRI0sEsJ2Jk4Q7KtmKqWim9Klep9VE9TOkjgQTLJDUVrqX98MmFewXSp
	 2/6Kp8wUnTIEmGYNDRA7+i9PlpkZKNVcqYxPdoHTpFvf2u7ja/iilMCfuZ0arDhHrR
	 l7XgeBJ5DpT2Fuo1kFnY1u76n1iuEbQkXGdG5oxGBhK2YgpMSTsciD8pA7Kt4DDgHz
	 Zv/yR4CZa+o0w==
Date: Mon, 10 Jul 2023 11:56:57 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>,
	Wander Lairson Costa <wander@redhat.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [peterz-queue:sched/maybe 1/14] ERROR: modpost: vmlinux: local
 symbol '__put_task_struct_rcu_cb' was exported
Message-ID: <20230710185657.GA1505918@dev-arch.thelio-3990X>
References: <202307110147.tDoRemZ7-lkp@intel.com>
 <20230710182605.GA3044890@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710182605.GA3044890@hirez.programming.kicks-ass.net>

On Mon, Jul 10, 2023 at 08:26:05PM +0200, Peter Zijlstra wrote:
> On Tue, Jul 11, 2023 at 01:48:23AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
> > head:   69ff1e365682e2d516364c010b51f8a95140cd94
> > commit: eb15cb094ddb0227c9dfe5eb836d1a4357f070fd [1/14] kernel/fork: beware of __put_task_struct calling context
> > config: riscv-randconfig-r042-20230710 (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230711/202307110147.tDoRemZ7-lkp@intel.com/reproduce)
> > 
> 
> > >> ERROR: modpost: vmlinux: local symbol '__put_task_struct_rcu_cb' was exported
> 
> The commit above introduces this function:
> 
> +void __put_task_struct_rcu_cb(struct rcu_head *rhp)
> +{
> +       struct task_struct *task = container_of(rhp, struct task_struct, rcu);
> +
> +       __put_task_struct(task);
> +}
> +EXPORT_SYMBOL_GPL(__put_task_struct_rcu_cb);
> 
> How the heck does that become a local symbol?
> 

Looking at the configuration:

CONFIG_32BIT=y
CONFIG_ARCH_RV32I=y

It is highly likely that something is broken with 32-bit RISC-V and
clang, as that is not something we have ever tested. I don't even think
32-bit RISC-V is tested that much even with GCC, so I'm not sure if this
is even worth looking into.

Cheers,
Nathan
