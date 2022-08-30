Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62019610B
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 22:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A5AC433D6;
	Tue, 30 Aug 2022 22:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1661898043;
	bh=zj1AqnuLESei39yoWq+PuLriWqWgl063cnr+Lbm14uY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gE87R8qQthoRQ2pa2nMBFZBmXpd4jQosBJl1PNFLLbkTmO1UMD2OarS7UaZJE+DY1
	 9f/5z3v7CLol6IIRcv4R5hn8BljiC+NE3WS0vD1XVXVe0uUJbaBACYJ4n9qkWHcOz3
	 4R+XEPmQ6xUkAeDti7V2fqgBU/N3wZrNiUoSBElg=
Date: Tue, 30 Aug 2022 15:20:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: kernel test robot <lkp@intel.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, llvm@lists.linux.dev,
 kbuild-all@lists.01.org, Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 3575/3976] mm/memory-tiers.c:647:35: error:
 use of undeclared identifier 'top_tier_adistance'
Message-Id: <20220830152042.8e0914c28d3397e16b5c6255@linux-foundation.org>
In-Reply-To: <202208310340.bfIiSHdK-lkp@intel.com>
References: <202208310340.bfIiSHdK-lkp@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 31 Aug 2022 03:25:27 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   282342f2dc97ccf54254c5de51bcc1101229615f
> commit: 2ec921a84615ee0665bcc369d40b92e2bed66cd5 [3575/3976] mm/demotion: expose memory tier details via sysfs
> config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20220831/202208310340.bfIiSHdK-lkp@intel.com/config)
> compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2ec921a84615ee0665bcc369d40b92e2bed66cd5
>         git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>         git fetch --no-tags linux-next master
>         git checkout 2ec921a84615ee0665bcc369d40b92e2bed66cd5
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> mm/memory-tiers.c:647:35: error: use of undeclared identifier 'top_tier_adistance'
>                    if (memtier->adistance_start >= top_tier_adistance)
>                                                    ^
>    1 error generated.

Thanks, I'll do this for now:

--- a/mm/memory-tiers.c~mm-demotion-expose-memory-tier-details-via-sysfs-fix-2
+++ a/mm/memory-tiers.c
@@ -108,7 +108,20 @@ static int top_tier_adistance;
  *
  */
 static struct demotion_nodes *node_demotion __read_mostly;
-#endif /* CONFIG_MIGRATION */
+
+/* I need a comment too */
+static inline bool i_need_a_name(struct memory_tier *memtier)
+{
+	return memtier->adistance_start >= top_tier_adistance;
+}
+
+#else	/* CONFIG_MIGRATION */
+
+static inline bool i_need_a_name(struct memory_tier *memtier)
+{
+	return false;
+}
+#endif	/* CONFIG_MIGRATION */
 
 static __always_inline nodemask_t get_memtier_nodemask(struct memory_tier *memtier)
 {
@@ -648,7 +661,7 @@ static ssize_t toptier_nodes_show(struct
 
 	mutex_lock(&memory_tier_lock);
 	list_for_each_entry(memtier, &memory_tiers, list) {
-		if (memtier->adistance_start >= top_tier_adistance)
+		if (i_need_a_name(memtier))
 			break;
 		nmask = get_memtier_nodemask(memtier);
 		nodes_or(top_tier_mask, top_tier_mask, nmask);

Aneesh, please provide suitable name and comment?

