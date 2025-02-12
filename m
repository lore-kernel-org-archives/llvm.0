Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BB1FC102;
	Wed, 12 Feb 2025 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739354613; cv=none; b=RQWXyblGCtrIC9aoh35dl0QKd8AkRWltyp7XuRq0DIrN8g+Ea6SKdqI/u4IdqgzYE1FlI985jD72NZGr7XjWyCUqqJduuOBOwLO5KayL1c09Hsiqp3vHURJIeO+ZGeRlkrW5uPTsM8wAQM3+3rkye6jrRGSkKRIxHYEWUlI2l28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739354613; c=relaxed/simple;
	bh=/qZDTGoR1ovINC8frxvq7XHY227mD50j54dGAGwv5JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fcgs4+TOhc+DTCf6GI7SQNejEFllJ+93cyPBTOS7FC34zDgwUV9XUslXaUh/qbe9znos0RiBOcGQlfZ654dENvJz7gv6wBZrEGpte2BKZjwBAbTozzqHUYN1mQzPXV209T9FtpkT/S1CBsnTIvwzCmOnrxD32/75hAlhm1GCNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fcjbIRDq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fcjbIRDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EAE8C4CEDF;
	Wed, 12 Feb 2025 10:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739354612;
	bh=/qZDTGoR1ovINC8frxvq7XHY227mD50j54dGAGwv5JQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=fcjbIRDq6wJTWjIrrVY8mZVjP/ynoZOGGCkLV7RZ3Va4RL4NvWednVgvnOhrO+Npd
	 pHbREls6IzVLc7aIIAgRSUko66XwGbadZAna3x/NFajJshdnhd1g4lcecIe6ARaQes
	 0cxYAcaJzEgNkvgSsn79/96zB2YmV9F28Qs2Xg94c4hxf/XW39xh2uvnbLn28JLx1I
	 en+/waMwRrKziMvzRgMABkKF2DYPdc3UCiScEmeeVBmiNnPw1XSGv/7rYPnEOLlmgt
	 1+ot9zWvfVbKFtU+OlLvOOBHhLz1e6ukpJVpRaR1/j+Xqe3e7+G1ppK1NSJmz61D6X
	 XLfErqI42Ikxg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 12DBCCE0546; Wed, 12 Feb 2025 02:03:27 -0800 (PST)
Date: Wed, 12 Feb 2025 02:03:27 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 82/82] kernel/rcu/rcutorture.c:2453:110:
 warning: format specifies type 'unsigned long' but the argument has type
 'int'
Message-ID: <555c789d-5fe8-40d4-9b72-3490baa5c9b3@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202502112058.rTKa7Z3A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202502112058.rTKa7Z3A-lkp@intel.com>

On Tue, Feb 11, 2025 at 08:37:12PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   31c00ec5301cf02af354d57007bf0d79d5aef1c5
> commit: 31c00ec5301cf02af354d57007bf0d79d5aef1c5 [82/82] rcutorture: Check for ->up_read() without matching ->down_read()
> config: i386-buildonly-randconfig-006-20250211 (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502112058.rTKa7Z3A-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202502112058.rTKa7Z3A-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    In file included from kernel/rcu/rcutorture.c:47:
>    In file included from include/linux/oom.h:10:
>    In file included from include/linux/mm.h:2223:
>    include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>      518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
>          |                               ~~~~~~~~~~~ ^ ~~~
> >> kernel/rcu/rcutorture.c:2453:110: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
>     2453 |         WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
>          |                                                                                                  ~~~                ^~~~~~~~~~~~~~~~~~~~~~~
>          |                                                                                                  %d

And %d breaks my build.  So this is presumably what %zu was intended
to take care of.  So does the diff below fix this for you?  Either way,
thank you for your testing!

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/kernel/rcu/rcutorture.c b/kernel/rcu/rcutorture.c
index d62f1c787bd6..b4286136a052 100644
--- a/kernel/rcu/rcutorture.c
+++ b/kernel/rcu/rcutorture.c
@@ -2450,7 +2450,7 @@ static enum hrtimer_restart rcu_torture_updown_hrt(struct hrtimer *hrtp)
 
 	rtorsup = container_of(hrtp, struct rcu_torture_one_read_state_updown, rtorsu_hrt);
 	rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
-	WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
+	WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
 	rtorsup->rtorsu_nups++;
 	smp_store_release(&rtorsup->rtorsu_inuse, false);
 	return HRTIMER_NORESTART;
@@ -2498,7 +2498,12 @@ static void rcu_torture_updown_cleanup(void)
 		if (!smp_load_acquire(&rtorsup->rtorsu_inuse))
 			continue;
 		(void)hrtimer_cancel(&rtorsup->rtorsu_hrt);
-		WARN_ON_ONCE(rtorsup->rtorsu_inuse);
+		if (WARN_ON_ONCE(rtorsup->rtorsu_inuse)) {
+			rcu_torture_one_read_end(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1);
+			WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
+			rtorsup->rtorsu_nups++;
+			smp_store_release(&rtorsup->rtorsu_inuse, false);
+		}
 
 	}
 	kfree(updownreaders);
@@ -2521,7 +2526,7 @@ static void rcu_torture_updown_one(struct rcu_torture_one_read_state_updown *rto
 	if (!rcu_torture_one_read_start(&rtorsup->rtorsu_rtors, &rtorsup->rtorsu_trs, -1)) {
 		cur_ops->up_read(rawidx);
 		rtorsup->rtorsu_nups++;
-		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%lu.\n", __func__, rtorsup - updownreaders);
+		WARN_ONCE(rtorsup->rtorsu_nups >= rtorsup->rtorsu_ndowns, "%s: Up without matching down #%zu.\n", __func__, rtorsup - updownreaders);
 		schedule_timeout_idle(HZ);
 		return;
 	}
