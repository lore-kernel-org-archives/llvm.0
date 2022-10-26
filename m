Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8C210FB;
	Wed, 26 Oct 2022 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GcWjCPz0aiQ3UDfRDASwxNkIdrXAItdYhv9int3ZI/U=; b=gj8w7MhoQY57qyVo4vwzYUUb/v
	aMDMjfENlY8Nbf2RXHRRNZzAayFtjwp02KNoehoojXkS9qD6tn624JJsoYGkHAJvNq0BE0yLgqSe7
	WPE1caovNzjAxQQm1hHErHtvr1FEaYBPL+TJNRvtiMXRViWmBxQFtz63qjFcHNgRnUoQ5oHW77k2F
	2bYWhMVRSxgBziZoOGuUkOJvgWAC//Hs2GrsBXlWLeqTr7kW2zBrp5OLWF98/UZLUWy+vai3ulDXC
	qgxZR24huXU2inSzfGM2KVAtt5EJasGtCmQq8WIiX6TfDDNcvmbJv0WLvyalULvWxqz9FP/kePS9u
	D1i31mtA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oncbT-006Y6C-JX; Wed, 26 Oct 2022 09:21:40 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 373853000DD;
	Wed, 26 Oct 2022 11:21:39 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 17A9C2C268BC5; Wed, 26 Oct 2022 11:21:39 +0200 (CEST)
Date: Wed, 26 Oct 2022 11:21:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: kernel test robot <lkp@intel.com>
Cc: Suren Baghdasaryan <surenb@google.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [peterz-queue:sched/core 16/18] kernel/sched/psi.c:983:35:
 error: too few arguments to function call, expected 3, have 2
Message-ID: <Y1j8I2qf78jHfLWs@hirez.programming.kicks-ass.net>
References: <202210260945.cCKjgJe3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202210260945.cCKjgJe3-lkp@intel.com>

On Wed, Oct 26, 2022 at 09:58:58AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> head:   7005e3c43be6b6297440e85cb7d8c12a94540b49
> commit: 95a70934458341dc43db09be8e7b88c98fba9b89 [16/18] psi: stop relying on timer_pending for poll_work rescheduling
> config: i386-randconfig-a004-20221024 (attached as .config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=95a70934458341dc43db09be8e7b88c98fba9b89
>         git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
>         git fetch --no-tags peterz-queue sched/core
>         git checkout 95a70934458341dc43db09be8e7b88c98fba9b89
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/sched/build_utility.c:97:
> >> kernel/sched/psi.c:983:35: error: too few arguments to function call, expected 3, have 2
>                            psi_schedule_poll_work(group, 1);
>                            ~~~~~~~~~~~~~~~~~~~~~~         ^
>    kernel/sched/psi.c:568:13: note: 'psi_schedule_poll_work' declared here
>    static void psi_schedule_poll_work(struct psi_group *group, unsigned long delay,
>                ^
>    1 error generated.
> 
> 

Droping for now; Suren could you fix up and repost please?
