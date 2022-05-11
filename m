Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C431E2F33
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 19:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39142C340EE;
	Wed, 11 May 2022 19:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1652296968;
	bh=89dO1SHzQzwJDxkPJtRO7cKNAHULhicNiKr/szwgcZ4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VteasU/XEScRJom6rva5SHg2taUG3jPHueNEv3b/inAMDOJDF9TIOjapQ7mbJKy/H
	 86b5xY47ROVR3V4BMKXFQRXAK8J1TnMRX/mWyRFp7FQrdFEX1ZzFvPNck53Jjoi4B3
	 ofbRjnbKD6/qfdKMIwxZz+dFx1b03FBGt1zc+E88=
Date: Wed, 11 May 2022 12:22:47 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 10902/11094] mm/memcontrol.c:7467:6: error:
 redefinition of 'obj_cgroup_may_zswap'
Message-Id: <20220511122247.8eff682405531c6e7a9a8181@linux-foundation.org>
In-Reply-To: <202205120115.D6nVZNke-lkp@intel.com>
References: <202205120115.D6nVZNke-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 12 May 2022 01:49:04 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   6107040c99d5dfc920721c198d45ed2d639b113a
> commit: bf7930005b547c94d4cd312a2e0400cb8cf76d2a [10902/11094] zswap: memcg accounting
> config: i386-randconfig-a001-20220509 (https://download.01.org/0day-ci/archive/20220512/202205120115.D6nVZNke-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=bf7930005b547c94d4cd312a2e0400cb8cf76d2a
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout bf7930005b547c94d4cd312a2e0400cb8cf76d2a
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/memcontrol.c:7467:6: error: redefinition of 'obj_cgroup_may_zswap'
>    bool obj_cgroup_may_zswap(struct obj_cgroup *objcg)
>         ^

Thanks, this still occurs when the two Kconfig cleanups from that
patchset are included, so I did this:


--- a/mm/memcontrol.c~zswap-memcg-accounting-fix
+++ a/mm/memcontrol.c
@@ -7451,7 +7451,7 @@ static struct cftype memsw_files[] = {
 	{ },	/* terminate */
 };
 
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 /**
  * obj_cgroup_may_zswap - check if this cgroup can zswap
  * @objcg: the object cgroup
@@ -7582,7 +7582,7 @@ static struct cftype zswap_files[] = {
 	},
 	{ }	/* terminate */
 };
-#endif /* CONFIG_ZSWAP */
+#endif /* CONFIG_MEMCG_KMEM && CONFIG_ZSWAP */
 
 /*
  * If mem_cgroup_swap_init() is implemented as a subsys_initcall()
@@ -7602,7 +7602,7 @@ static int __init mem_cgroup_swap_init(v
 
 	WARN_ON(cgroup_add_dfl_cftypes(&memory_cgrp_subsys, swap_files));
 	WARN_ON(cgroup_add_legacy_cftypes(&memory_cgrp_subsys, memsw_files));
-#ifdef CONFIG_ZSWAP
+#if defined(CONFIG_MEMCG_KMEM) && defined(CONFIG_ZSWAP)
 	WARN_ON(cgroup_add_dfl_cftypes(&memory_cgrp_subsys, zswap_files));
 #endif
 	return 0;
_

