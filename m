Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DE32F43
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 15:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kqE02dzRDRl7y2hgIY6W5nVbBS7sf7V+wbQ6b8v+gJ4=; b=vhAiG6IbQmevUMxUAN1yhan8tW
	TQZT32pMZ4EJw3FKFbL+aCbeAGhRfWxCJg6N+4E/ZAACkM36RAO5ZV2H8/HfToxP8RmDsuBlLSkhJ
	oCP639Pt/VSPnuGF81eSGXaoP+0o9afSBYunOzV8NoeJ6Cum9FWEjLn9Xmf4V8WJgJMr5h5ZlkDmz
	JgBi8mwBumCFkp9OvSpl/gfS65rtNCOdVvdaWNfJkx/nKpYy6fWhmhCa2Oa7bXg2WmzULLyAgLLM4
	gD4UdRK+5WNOyk4efWNgM1Pyu9SQTIiDiYukoMcyhGxDI5Lcu60Qt7O2dRJ9dkjt+vjI1BOZsJTnb
	VrKvxQxg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noojg-007gQb-4R; Wed, 11 May 2022 15:58:48 +0000
Date: Wed, 11 May 2022 08:58:48 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: ast@kernel.org, daniel@iogearbox.net
Cc: songliubraving@fb.com, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] bpf.h: fix clang compiler warning with
 unpriv_ebpf_notify()
Message-ID: <YnvdOAaYmhNiA5WN@bombadil.infradead.org>
References: <20220509203623.3856965-1-mcgrof@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509203623.3856965-1-mcgrof@kernel.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Mon, May 09, 2022 at 01:36:23PM -0700, Luis Chamberlain wrote:
> The recent commit "bpf: Move BPF sysctls from kernel/sysctl.c to BPF core"
> triggered 0-day to issue an email for what seems to have been an old
> clang warning. So this issue should have existed before as well, from
> what I can tell. The issue is that clang expects a forward declaration
> for routines declared as weak while gcc does not.
> 
> This can be reproduced with 0-day's x86_64-randconfig-c007
> https://download.01.org/0day-ci/archive/20220424/202204240008.JDntM9cU-lkp@intel.com/config
> 
> And using:
> 
> COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 SHELL=/bin/bash kernel/bpf/syscall.o
> Compiler will be installed in /home/mcgrof/0day
> make --keep-going HOSTCC=/home/mcgrof/0day/clang/bin/clang CC=/home/mcgrof/0day/clang/bin/clang LD=/home/mcgrof/0day/clang/bin/ld.lld HOSTLD=/home/mcgrof/0day/clang/bin/ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump OBJSIZE=llvm-size READELF=llvm-readelf HOSTCXX=clang++ HOSTAR=llvm-ar CROSS_COMPILE=x86_64-linux-gnu- --jobs=24 W=1 ARCH=x86_64 SHELL=/bin/bash kernel/bpf/syscall.o
>   DESCEND objtool
>   CALL    scripts/atomic/check-atomics.sh
>   CALL    scripts/checksyscalls.sh
>   CC      kernel/bpf/syscall.o
> kernel/bpf/syscall.c:4944:13: warning: no previous prototype for function 'unpriv_ebpf_notify' [-Wmissing-prototypes]
> void __weak unpriv_ebpf_notify(int new_state)
>             ^
> kernel/bpf/syscall.c:4944:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> void __weak unpriv_ebpf_notify(int new_state)
> ^
> static
> 
> Fixes: 2900005ea287 ("bpf: Move BPF sysctls from kernel/sysctl.c to BPF core")
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
> ---
> 
> Daniel,
> 
> Given what we did fore 2900005ea287 ("bpf: Move BPF sysctls from
> kernel/sysctl.c to BPF core") where I had pulled pr/bpf-sysctl a
> while ago into sysctl-next and then merged the patch in question,
> should I just safely carry this patch onto sysctl-next? Let me know
> how you'd like to proceed.
> 
> Also, it wasn't clear if putting this forward declaration on
> bpf.h was your ideal preference.

After testing this on sysctl-testing without issues going to move this
to sysctl-next now.

  Luis
