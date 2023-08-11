Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C838763B6;
	Fri, 11 Aug 2023 16:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6BEC433C8;
	Fri, 11 Aug 2023 16:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691772539;
	bh=Av3U0Q7AgXiB9TVGvCYc5p4MZ/bSQz3gqzAlPVvE6j0=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=RAAJf3tlrDlpl4WMhbaBAuSlCvU2eDGiumVqde4GY03O3gITQZSeyiDS060BnbOun
	 P648GI+a3YdVq/NX+gON96/LuiW4G43KksBA0b1L+wtJzO1oAhFpGYZWT05B9ldPRa
	 AZT7RSdMVyl2bf85Fyh44ngFAnHMJg+xbpuK26zkWdITROqfnoxy1lHSn3El0FsLGE
	 SPzzOyj5+3TLeG6RIl/BlsFa7F7x6un8wJFENLy3con6YtqTwlr8AnK0g6qZqyp41X
	 MOfOfqEuau79rvZVjq0SikAMOcp6WclDtjNKaHS6IDBZcDLjZhIuj43RQLS4Qg2Fp6
	 n8cBkGtK0+ZRg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D0FDFCE0593; Fri, 11 Aug 2023 09:48:58 -0700 (PDT)
Date: Fri, 11 Aug 2023 09:48:58 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [linux-next:master 5658/8441] kernel/rcu/update.c:529:6:
 warning: no previous prototype for function 'torture_sched_setaffinity'
Message-ID: <1dae5399-9a1b-4c55-a62b-1bece1f349c8@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202308111926.gYjAUtn4-lkp@intel.com>
 <d73b2fa1-fc12-4e1c-9dc6-a0505ea96ec1@paulmck-laptop>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d73b2fa1-fc12-4e1c-9dc6-a0505ea96ec1@paulmck-laptop>

On Fri, Aug 11, 2023 at 09:10:39AM -0700, Paul E. McKenney wrote:
> On Fri, Aug 11, 2023 at 07:13:48PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   21ef7b1e17d039053edaeaf41142423810572741
> > commit: 521ec59e5453e03a255e183ccee844fe3612f1b4 [5658/8441] torture: Move rcutorture_sched_setaffinity() out of rcutorture
> > config: x86_64-randconfig-x012-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111926.gYjAUtn4-lkp@intel.com/config)
> > compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> > reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111926.gYjAUtn4-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308111926.gYjAUtn4-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> kernel/rcu/update.c:529:6: warning: no previous prototype for function 'torture_sched_setaffinity' [-Wmissing-prototypes]
> >    long torture_sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
> >         ^
> >    kernel/rcu/update.c:529:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
> >    long torture_sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
> >    ^
> >    static 
> >    1 warning generated.
> > 
> > 
> > vim +/torture_sched_setaffinity +529 kernel/rcu/update.c
> > 
> >    526	
> >    527	#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST) || IS_MODULE(CONFIG_RCU_TORTURE_TEST) || IS_ENABLED(CONFIG_LOCK_TORTURE_TEST) || IS_MODULE(CONFIG_LOCK_TORTURE_TEST)
> >    528	/* Get rcutorture access to sched_setaffinity(). */
> >  > 529	long torture_sched_setaffinity(pid_t pid, const struct cpumask *in_mask)
> >    530	{
> >    531		int ret;
> >    532	
> >    533		ret = sched_setaffinity(pid, in_mask);
> >    534		WARN_ONCE(ret, "%s: sched_setaffinity(%d) returned %d\n", __func__, pid, ret);
> >    535		return ret;
> >    536	}
> >    537	EXPORT_SYMBOL_GPL(torture_sched_setaffinity);
> >    538	#endif
> >    539	
> 
> Hmmm...  The update.c source file includes torture.h which provides the
> declaration with the same set of #if conditions as the definition.
> 
> But does this diff help?

Never mind!

Fixed by this commit:

778df208f001 ("rcu: Include torture_sched_setaffinity() declaration")

							Thanx, Paul

> -----------------------------------------------------------------------
> 
> diff --git a/include/linux/torture.h b/include/linux/torture.h
> index c98d0c83d117..7d2c070e66d2 100644
> --- a/include/linux/torture.h
> +++ b/include/linux/torture.h
> @@ -128,8 +128,6 @@ void _torture_stop_kthread(char *m, struct task_struct **tp);
>  #define torture_preempt_schedule()	do { } while (0)
>  #endif
>  
> -#if IS_ENABLED(CONFIG_RCU_TORTURE_TEST) || IS_MODULE(CONFIG_RCU_TORTURE_TEST) || IS_ENABLED(CONFIG_LOCK_TORTURE_TEST) || IS_MODULE(CONFIG_LOCK_TORTURE_TEST)
>  long torture_sched_setaffinity(pid_t pid, const struct cpumask *in_mask);
> -#endif
>  
>  #endif /* __LINUX_TORTURE_H */
