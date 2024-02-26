Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B81412EBE3;
	Mon, 26 Feb 2024 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708976348; cv=none; b=NeDlPf/2MdaBjnkS8nDvl/slhaXUnaNv/uzBKe8jssWEZfmGln42ZGeULmrpy8I91uzjSllUVygNScnUABIHLWESjJxdBwNaxeY/CVYcFMZtAQx2XedYJJjiw2ze7PRRmRkvgLtv6mMA5Y10aQgHzx0ieQ66aa9lhvsxAeiOOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708976348; c=relaxed/simple;
	bh=8dgrE3ZDpRJiV8PrunEjETiI5kjelka8uMk8D8d73UM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BgSejySDEriNyfK8WAGpQ9TPy8ucVWE2M7MuP9VtIgGBI8g0e8JedNrWKtJe8nC1d6uI45SUjzuvnKNM5v9S+IcI8HHcdsM/a3oIgiDDVh5btP+mST0K+Jx6UWYGspxJ7BsKPUEoD+AL2lEVMoNsbOmO91VgWFPrjpsijuBo4tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CYOHoYau; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CYOHoYau"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87EFC433F1;
	Mon, 26 Feb 2024 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708976348;
	bh=8dgrE3ZDpRJiV8PrunEjETiI5kjelka8uMk8D8d73UM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CYOHoYauT8CGEdfI4ZiQDwKN/x/v5RNeoQda7PMg42B/fkVc6972hEkh4OVvME5mY
	 Q34I0wvliTWa7WbG9resrx02DvrURDLMG/mrpUC5ZASErmWlUBEMwqy7nqEEnwSnrh
	 3miHLr54faNdsPZw4b4HLSOlPSelYLyaMtWWjoXVE0Fvy9/K+6m3kB380v6dshjcmP
	 dki/JhGdilGadfaVtNISIQuEK3iwMcf+g0wFwegBO1wJEAAyiqF4pAWznfxupxsLKX
	 hINBLbiz6ldzHjYFsHP2n8LdeJAmo9ALgmecMaKdtP1/JXX03Xcx/calVQ1500GV4W
	 y83srKPKA3PnQ==
From: SeongJae Park <sj@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [sj:damon/next 18/20] mm/damon/core.c:752:44: warning: variable 'goal' used in loop condition not modified in loop body
Date: Mon, 26 Feb 2024 11:39:05 -0800
Message-Id: <20240226193905.44575-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <202402260800.F3OIgZl9-lkp@intel.com>
References: 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 26 Feb 2024 08:33:16 +0800 kernel test robot <lkp@intel.com> wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
> head:   a9e8680aa284cf5fd994087542cfa9e6f5f491b4
> commit: 74d79c7a174ab26a8f99bc482dd6b067c93bc554 [18/20] mm/damon: implement DAMON context input-only update function
> config: i386-buildonly-randconfig-003-20240226 (https://download.01.org/0day-ci/archive/20240226/202402260800.F3OIgZl9-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240226/202402260800.F3OIgZl9-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202402260800.F3OIgZl9-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> mm/damon/core.c:752:44: warning: variable 'goal' used in loop condition not modified in loop body [-Wfor-loop-analysis]
>      752 |         for (goal = damos_nth_quota_goal(i, src); goal; )
>          |                                                   ^~~~
> >> mm/damon/core.c:799:42: warning: variable 'filter' used in loop condition not modified in loop body [-Wfor-loop-analysis]
>      799 |         for (filter = damos_nth_filter(i, src); filter;)
>          |                                                 ^~~~~~
> >> mm/damon/core.c:853:42: warning: variable 'scheme' used in loop condition not modified in loop body [-Wfor-loop-analysis]
>      853 |         for (scheme = damon_nth_scheme(i, src); scheme;)
>          |                                                 ^~~~~~
> >> mm/damon/core.c:841:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
>      841 |         int i = 0, err;
>          |                    ^
> >> mm/damon/core.c:929:37: warning: variable 't' used in loop condition not modified in loop body [-Wfor-loop-analysis]
>      929 |         for (t = damon_nth_target(i, src); t;)
>          |                                            ^
>    5 warnings generated.

Thank you for this nice report!

I fixed the warnings with below changes, and squashed the diff on the
problem-caused commit.  I confirmed the warning is disappeared after the change
using the awesome reproducer that you provided :)

--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -734,7 +734,7 @@ static void damos_update_quota_goals(struct damos_quota *dst,
                struct damos_quota *src)
 {
        struct damos_quota_goal *goal, *next;
-       int i = 0;
+       int i = 0, j = 0;

        damos_for_each_quota_goal_safe(goal, next, dst) {
                struct damos_quota_goal *src_goal =
@@ -749,8 +749,11 @@ static void damos_update_quota_goals(struct damos_quota *dst,
                }
                damos_destroy_quota_goal(goal);
        }
-       for (goal = damos_nth_quota_goal(i, src); goal; )
+       damos_for_each_quota_goal_safe(goal, next, src) {
+               if (j++ < i)
+                       continue;
                damos_move_quota_goal(dst, goal);
+       }
 }

 static struct damos_filter *damos_nth_filter(int n, struct damos *s)
@@ -768,7 +771,7 @@ static struct damos_filter *damos_nth_filter(int n, struct damos *s)
 static int damos_update_filters(struct damos *dst, struct damos *src)
 {
        struct damos_filter *filter, *next;
-       int i = 0;
+       int i = 0, j = 0;

        damos_for_each_filter_safe(filter, next, dst) {
                struct damos_filter *src_filter = damos_nth_filter(i++, src);
@@ -783,8 +786,11 @@ static int damos_update_filters(struct damos *dst, struct damos *src)
                damos_destroy_filter(filter);
        }

-       for (filter = damos_nth_filter(i, src); filter;)
+       damos_for_each_filter_safe(filter, next, src) {
+               if (j++ < i)
+                       continue;
                damos_move_filter(dst, filter);
+       }
        return 0;
 }

@@ -825,20 +831,25 @@ static int damon_update_scheme(struct damos *dst, struct damos *src)
 static int damon_update_schemes(struct damon_ctx *dst, struct damon_ctx *src)
 {
        struct damos *scheme, *next;
-       int i = 0, err;
+       int i = 0, j = 0, err;

        damon_for_each_scheme_safe(scheme, next, dst) {
                struct damos *src_scheme = damon_nth_scheme(i++, src);

                if (src_scheme) {
                        err = damon_update_scheme(scheme, src_scheme);
+                       if (err)
+                               return err;
                        continue;
                }
                damon_destroy_scheme(scheme);
        }

-       for (scheme = damon_nth_scheme(i, src); scheme;)
+       damon_for_each_scheme_safe(scheme, next, src) {
+               if (j++ < i)
+                       continue;
                damon_move_scheme(dst, scheme);
+       }
        return 0;
 }

@@ -892,7 +903,7 @@ static struct damon_target *damon_nth_target(int n, struct damon_ctx *ctx)
 static int damon_update_targets(struct damon_ctx *dst, struct damon_ctx *src)
 {
        struct damon_target *t, *next;
-       int i = 0, err;
+       int i = 0, j = 0, err;

        damon_for_each_target_safe(t, next, dst) {
                struct damon_target *src_target = damon_nth_target(i++, src);
@@ -913,8 +924,11 @@ static int damon_update_targets(struct damon_ctx *dst, struct damon_ctx *src)
                damon_destroy_target(t);
        }

-       for (t = damon_nth_target(i, src); t;)
+       damon_for_each_target_safe(t, next, src) {
+               if (j++ < i)
+                       continue;
                damon_move_target(dst, t);
+       }
        return 0;
 }

[...]
