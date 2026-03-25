Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C01359A67;
	Wed, 25 Mar 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774421550; cv=none; b=EcWCOoReO0y1slrZ/VZnO16MeN9yQ6zyuz+KLI8z0MLRZXWKgSI25hRk4Zz7DAlqopuMoyCL/Gm7Wku0XRl/DxaR548iSzGyESzakmSrG3AnMBDqs2OUFFdjL2k5YFb03p6Sa9x2aUPntmdb6yAzyjXHzoSrvmqjpVvFQXWSM3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774421550; c=relaxed/simple;
	bh=fU/VJh0UztktKXhSBTPB1iPWDk4L9bU53cVBSq8CXbg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=b2fMDvBFnO3FMT5nbRfTtmPwrjIdpKu+NZO54kMQuOrisLeQ0lE4O6J72stO73rplQWXJQtqvOlxg3LoebSEUma6jGv1PiuIWwrd0ys6HQWE0Huw/v7Y14TFIU891zHuzQae3dBP3fwCXeMGekKOOIaEe1sZXsFlli0TmJAc4xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZM3lVxg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZM3lVxg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192BCC4CEF7;
	Wed, 25 Mar 2026 06:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774421549;
	bh=fU/VJh0UztktKXhSBTPB1iPWDk4L9bU53cVBSq8CXbg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OZM3lVxgorgE0odGqelej3/fjAhHD7YeknyfI7SVjzBgob8jn7kPaFwfMvKuoWUA8
	 yk+9A0NJido9xTQjWNWp2CepFEnHiaryCVLuKGKblNi7imMKyE527KGnSZx5as7Ajy
	 JOzWMw+goyCyiGCbBrsg5BffnhbbfzrkfiHhOE4vWDPMe4L6r9a5RVOoXqGQ3RQgrT
	 8mCmZjmmQXtlmYIqAuA4rKxKpQzILXO4QRNOGaTdIqGZHPnulVqpotW/UnP0Izx7eg
	 9OP8frL7ju0zcB5t6teZSXdgHzCdkF4s1noZnYVAgE3ArPCCnOqGn/Cdxp5qoW0Y6r
	 fH84+JpSeCONA==
Date: Wed, 25 Mar 2026 15:52:27 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Breno Leitao <leitao@debian.org>, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, "Masami Hiramatsu (Google)"
 <mhiramat@kernel.org>
Subject: Re: [trace:bootconfig/for-next 16/16] init/main.c:437:20: warning:
 stack frame size (4192) exceeds limit (2048) in
 'bootconfig_apply_early_params'
Message-Id: <20260325155227.55cdfb9f4ce96c335d0c7f18@kernel.org>
In-Reply-To: <202603251010.5Ui0yrB2-lkp@intel.com>
References: <202603251010.5Ui0yrB2-lkp@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 25 Mar 2026 10:37:25 +0800
kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace bootconfig/for-next
> head:   1a427f2a710583872b6176ea8378e0a1a8719fc4
> commit: 1a427f2a710583872b6176ea8378e0a1a8719fc4 [16/16] bootconfig: Apply early options from embedded config
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260325/202603251010.5Ui0yrB2-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251010.5Ui0yrB2-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603251010.5Ui0yrB2-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> init/main.c:437:20: warning: stack frame size (4192) exceeds limit (2048) in 'bootconfig_apply_early_params' [-Wframe-larger-than]
>      437 | static void __init bootconfig_apply_early_params(void)
>          |                    ^
>    1 warning generated.
> 
> 
> vim +/bootconfig_apply_early_params +437 init/main.c
> 
>    416	
>    417	/*
>    418	 * do_early_param() is defined later in this file but called from
>    419	 * bootconfig_apply_early_params() below, so we need a forward declaration.
>    420	 */
>    421	static int __init do_early_param(char *param, char *val,
>    422					 const char *unused, void *arg);
>    423	
>    424	/*
>    425	 * bootconfig_apply_early_params - dispatch kernel.* keys from the embedded
>    426	 * bootconfig as early_param() calls.
>    427	 *
>    428	 * early_param() handlers must run before most of the kernel initialises
>    429	 * (e.g. before the GIC driver reads irqchip.gicv3_pseudo_nmi).  A bootconfig
>    430	 * attached to the initrd arrives too late for this because the initrd is not
>    431	 * mapped yet when early params are processed.  The embedded bootconfig lives
>    432	 * in the kernel image itself (.init.data), so it is always reachable.
>    433	 *
>    434	 * This function is called from setup_boot_config() which runs in
>    435	 * start_kernel() before parse_early_param(), making the timing correct.
>    436	 */
>  > 437	static void __init bootconfig_apply_early_params(void)
>    438	{
>    439		char val_buf[COMMAND_LINE_SIZE];

Ah, this COMMAND_LINE_SIZE is too big to allocate it on stack.
We need to make it as a static __initdata variable.

Thank you,

>    440		struct xbc_node *knode, *root;
>    441		const char *val;
>    442	
>    443		root = xbc_find_node("kernel");
>    444		if (!root)
>    445			return;
>    446	
>    447		/*
>    448		 * Keys that do not match any early_param() handler are silently
>    449		 * ignored — do_early_param() always returns 0.
>    450		 */
>    451		xbc_node_for_each_key_value(root, knode, val) {
>    452			if (xbc_node_compose_key_after(root, knode, xbc_namebuf, XBC_KEYLEN_MAX) < 0)
>    453				continue;
>    454	
>    455			if (!val) {
>    456				do_early_param(xbc_namebuf, NULL, NULL, NULL);
>    457				continue;
>    458			}
>    459	
>    460			/*
>    461			 * We need to copy const char *val to a char pointer,
>    462			 * which is what do_early_param() need, given it might
>    463			 * call strsep(), strtok() later.
>    464			 */
>    465			strscpy(val_buf, val, sizeof(val_buf));
>    466			do_early_param(xbc_namebuf, val_buf, NULL, NULL);
>    467		}
>    468	}
>    469	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
