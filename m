Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D402472B8;
	Wed, 24 Jun 2026 10:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782298628; cv=none; b=YZVDWQXCHyw8hdVv0FH8CW3R1JKlplVJuxlqcjhER0JT976izLsVufqiW4lqQX+um1c1ZBfWxqezefxW3ACLFI4SYHucQaaHj9VB2qnmLRFBD93++hFhjNAIRuaFK8O2jCv4J4SmdPn9QhZwsw/1dDCB2h8H+iWZdBLSrs/TVVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782298628; c=relaxed/simple;
	bh=INxrUct9WLacFXvQU97hRwFXyzi29Q0Xbi0FTzMgjg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F++XKSFqLRAmcZwHm/IoStRMxsLH9hLmkVlQZcd6UlugSh/FRfv/sRWT3elRayqXPFr+ZMPw5gfu0f5IwSrbb1Gr369DyvXsYEVKEdRyVUFCiDHtGcYd96fMvVe+DJ+ZtJ7AFaRxDpzpW/0w+ar6HIBFYXaZvlB0iNOBA0nQCtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LnbOfjKC; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LnbOfjKC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N1VssuBkLJnb64uC6QOIJ5bhhJaZoJolUbRCUHd19pM=; b=LnbOfjKCrnLjDaspVU7TzOk8dX
	yGB0rzTNA9Xx1dfRC3tr5mfxbda/KLMBiL1s401PtshNBZl5snDLX87fcw8z8YkF+QX4etfHbL/2S
	lh/IRnlFswxdhn5tS76c43kMZ1aaIE2Myz96EEwMZWOU2BmvLuPqAeS2+xXS1jDxfgj+60jfBn0Zz
	ptJb2QMP5bZz3PkufhMC0pfmwSGIRsj/XvNf4dg+2BGRbZKIkSGYBmeZE5g2G5voHse2DQ3U5nP6n
	HJlwBzyJZ5UkD3XpP0AFK6nfYgOFMwTIPC1StFf7bJ/lZsGsvOxOTSrkI69Y+AOi1iB8K6zoevyMB
	hvEklgVQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcLHw-00000007tar-3Ng6;
	Wed, 24 Jun 2026 10:57:01 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4CC97300400; Wed, 24 Jun 2026 12:56:58 +0200 (CEST)
Date: Wed, 24 Jun 2026 12:56:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	kernel test robot <lkp@intel.com>, jpoimboe@kernel.org,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Subject: Re: [linux-next:master 14191/14955] vmlinux.o: error: objtool:
 amdgpu_vm_handle_fault+0x186: sibling call from callable instruction with
 modified stack frame
Message-ID: <20260624105658.GB48970@noisy.programming.kicks-ass.net>
References: <202606232356.gwHMAJAW-lkp@intel.com>
 <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
 <20260624092806.GX48970@noisy.programming.kicks-ass.net>
 <eb2f60d1-5b6f-479b-9e4e-a4509dd65efd@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb2f60d1-5b6f-479b-9e4e-a4509dd65efd@amd.com>

On Wed, Jun 24, 2026 at 11:48:09AM +0200, Christian König wrote:

> > So, if my heat-addled brain isn't completely gone, then this all boils
> > down to something like:
> > 
> >   drm_exec_init(&exec);
> > label:
> >   for (;drm_exec_cleanup(&exec);) {
> >      ...
> >      if (unlikely(drm_exec_is_contended(&exec)))
> >        goto label;
> >      ...
> >   }
> >   ...
> >   drm_exec_fini(&exec);
> > 
> > Except, you've laundered that label through a computed goto to allow
> > multiple such constructs in a single function -- because can't have
> > multiple identical labels etc.
> 
> Just FYI: That's actually not the reason for this, the label name is unique now.

Yeah, I know, but I thought that the only way to transfer the name to
the drm_exec_retry() sites was to create that computed-goto alias.

> The computed goto is used to limit the scope you can use the retry
> macros because we initially had problems with people using that
> outside of the loop.

Ah, also a very good reason.

> Exactly that, yes. The nested loops are unfortunately a very common use case here.

Yep, saw that.

> > That is, I think this drm_exec_until_all_locked() thing has some
> > fundamental problems the moment clang fails to optimize it away.
> > Correctness really depends on the compiler not actually ever doing a
> > computed goto.
> 
> Mhm, that's not good at all but I also of hand don't see a way to
> avoid the computed goto.

Best I can come up with is something like this. Not exactly nice, but
should be fairly trivial to do.

---
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 2fc47f3b463b..7d69c06b2dd3 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -60,6 +60,7 @@ static void test_lock(struct kunit *test)
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
+drm_exec_label:
 		ret = drm_exec_lock_obj(&exec, &gobj);
 		drm_exec_retry_on_contention(&exec);
 		KUNIT_EXPECT_EQ(test, ret, 0);
@@ -80,6 +81,7 @@ static void test_lock_unlock(struct kunit *test)
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
+drm_exec_label:
 		ret = drm_exec_lock_obj(&exec, &gobj);
 		drm_exec_retry_on_contention(&exec);
 		KUNIT_EXPECT_EQ(test, ret, 0);
@@ -107,6 +109,7 @@ static void test_duplicates(struct kunit *test)
 
 	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
 	drm_exec_until_all_locked(&exec) {
+drm_exec_label:
 		ret = drm_exec_lock_obj(&exec, &gobj);
 		drm_exec_retry_on_contention(&exec);
 		KUNIT_EXPECT_EQ(test, ret, 0);
@@ -134,6 +137,7 @@ static void test_prepare(struct kunit *test)
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
 	drm_exec_until_all_locked(&exec) {
+drm_exec_label:
 		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
 		drm_exec_retry_on_contention(&exec);
 		KUNIT_EXPECT_EQ(test, ret, 0);
@@ -166,9 +170,10 @@ static void test_prepare_array(struct kunit *test)
 	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
-		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
-					     1);
+	drm_exec_until_all_locked(&exec) {
+drm_exec_label:
+		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array), 1);
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	drm_exec_fini(&exec);
 
@@ -181,15 +186,15 @@ static void test_multiple_loops(struct kunit *test)
 	struct drm_exec exec;
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
-	{
+	drm_exec_until_all_locked(&exec) {
+drm_exec_label:
 		break;
 	}
 	drm_exec_fini(&exec);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
-	{
+	drm_exec_until_all_locked(&exec) {
+drm_exec_label:
 		break;
 	}
 	drm_exec_fini(&exec);
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 8725ba92ff91..f2bfa6aa7b7b 100644
--- a/include/drm/drm_exec.h
+++ b/include/drm/drm_exec.h
@@ -101,17 +101,6 @@ drm_exec_obj(struct drm_exec *exec, unsigned long index)
 #define drm_exec_for_each_locked_object_reverse(exec, obj)		\
 	__drm_exec_for_each_locked_object_reverse(exec, obj, __UNIQUE_ID(drm_exec))
 
-/*
- * Helper to drm_exec_until_all_locked(). Don't use directly.
- *
- * Since labels can't be defined local to the loop's body we use a jump pointer
- * to make sure that the retry is only used from within the loop's body.
- */
-#define __drm_exec_until_all_locked(exec, _label)			 \
-_label:									 \
-	for (void *const __maybe_unused __drm_exec_retry_ptr = &&_label; \
-	     drm_exec_cleanup(exec);)
-
 /**
  * drm_exec_until_all_locked - loop until all GEM objects are locked
  * @exec: drm_exec object
@@ -121,7 +110,18 @@ _label:									 \
  * guaranteed that no GEM object is locked.
  */
 #define drm_exec_until_all_locked(exec)					\
-	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
+	while (drm_exec_cleanup(exec))
+
+#define drm_exec_label							\
+	__label__ __drm_exec_retry;					\
+	__label__ __drm_foo;						\
+	if (0) {							\
+	__drm_exec_retry: __maybe_unused;				\
+		continue;						\
+		goto __drm_foo;						\
+	}								\
+	__drm_foo
+
 
 /**
  * drm_exec_retry_on_contention - restart the loop to grap all locks
@@ -133,7 +133,7 @@ _label:									 \
 #define drm_exec_retry_on_contention(exec)			\
 	do {							\
 		if (unlikely(drm_exec_is_contended(exec)))	\
-			goto *__drm_exec_retry_ptr;		\
+			goto __drm_exec_retry;			\
 	} while (0)
 
 /**
@@ -158,7 +158,7 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
 #define drm_exec_retry(_exec)					\
 	do {							\
 		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
-		goto *__drm_exec_retry_ptr;			\
+		goto __drm_exec_retry;				\
 	} while (0)
 
 /**
