Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD2285CA4;
	Wed, 24 Jun 2026 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782299785; cv=none; b=jogU2mumHJyph/qlZZss77V0flyIb1q3kfQxVpZ9WBtg/AlsDn0rPkYxTi9Kk+ieEZTqLJmTLGASibz7aV4LlY3Y+TFtfyF7eyt7tKQzUIoaClh7ZXupzU7fYZRBZKlcok7YukjqYoFOIkfpPvkbqeI7Vvu2/CVDvi/LXwq8whA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782299785; c=relaxed/simple;
	bh=oIsfJ1hFUStyq3ncouYTZtxI4Nucmmi7Ei96SGUTI8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWd6obPvvoaY8KpyPn8QOW5cZ0QD3XFMmTCINSJ4UjI8TwqEXJkMPgm0NL22ouCQtobggozGR72Z9tCgbOngDspT/B00hd8HoDyKIInrsruR/cagroLEUgxHIf5F1hELxIBkSsoN1xPV/QbJQd8qCA1v890IZrQGgvWf7qf9C58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=FbQhUh9N; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FbQhUh9N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=kX9kafbgNb6vkf0M0KuaaFfJ5ltxT9wGEN6sZ+NrGpY=; b=FbQhUh9NhPGHBLq//1OFXrur9z
	lJUGLcJC/nVr4jGOu30WFQg/WmG0gk90onS1AjXrzph8miuBGhCcGHx+7EV2Ya7S28TJIJ/3pMDkR
	wl3VhzuF+NiNK7HhauVyjLNyuEfQd/ZnLMiXp+JK2mjgzIHU2YLU8HEXZWdRBkVfpxPtxxSdFH5aQ
	5CoM7/09kJdJoL42ojpRbDqVYMkE/1vxZ0o88zQ9gaQNGyyaZFs2arCst8xNWl89w9OJE3Yu/FoyV
	rb4phIKzBmkRgj6TpNIBeOdb/3KqwIGBqW1E3zHXr3SNmSkBzYOuTBTxL26oPEqVcf+qeV+6B5rdd
	fscxH8tQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wcLaW-00000002G4C-2RZA;
	Wed, 24 Jun 2026 11:16:12 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 81FA0300400; Wed, 24 Jun 2026 13:16:11 +0200 (CEST)
Date: Wed, 24 Jun 2026 13:16:11 +0200
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
Message-ID: <20260624111611.GC48970@noisy.programming.kicks-ass.net>
References: <202606232356.gwHMAJAW-lkp@intel.com>
 <CABXGCsMFOo-X_JeZ6qiwN8L=_4wOcf9xeS_RcDAb8XfzA6+WBA@mail.gmail.com>
 <20260624092806.GX48970@noisy.programming.kicks-ass.net>
 <eb2f60d1-5b6f-479b-9e4e-a4509dd65efd@amd.com>
 <20260624105658.GB48970@noisy.programming.kicks-ass.net>
 <0ff5f3f7-c2d3-4b56-95ad-400626d8abb9@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ff5f3f7-c2d3-4b56-95ad-400626d8abb9@amd.com>

On Wed, Jun 24, 2026 at 01:04:36PM +0200, Christian König wrote:

> > Best I can come up with is something like this. Not exactly nice, but
> > should be fairly trivial to do.
> 
> Yeah, definitely not nice. The macro was created exactly because
> people messed this approach up more than once.
> 
> I could live with some other hack/workaround, but clearly not with
> changing all users.
> 
> Maybe we can goto the fixed named label but have an extra variable to
> check that we are in the right scope or something like that.

The fixed name will break test_multiple_loops() and any other user that
actually does that (couldn't find one in a hurry).

That would look like so; by making the drm_exec_retry*() helpers depend
on __drm_exec_loop, it can only be used inside
drm_exec_until_all_locked().



---
diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
index 2fc47f3b463b..fbb887930e6d 100644
--- a/drivers/gpu/drm/tests/drm_exec_test.c
+++ b/drivers/gpu/drm/tests/drm_exec_test.c
@@ -166,9 +166,9 @@ static void test_prepare_array(struct kunit *test)
 	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
 
 	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
-		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array),
-					     1);
+	drm_exec_until_all_locked(&exec) {
+		ret = drm_exec_prepare_array(&exec, array, ARRAY_SIZE(array), 1);
+	}
 	KUNIT_EXPECT_EQ(test, ret, 0);
 	drm_exec_fini(&exec);
 
@@ -176,26 +176,6 @@ static void test_prepare_array(struct kunit *test)
 	drm_gem_private_object_fini(gobj2);
 }
 
-static void test_multiple_loops(struct kunit *test)
-{
-	struct drm_exec exec;
-
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
-	{
-		break;
-	}
-	drm_exec_fini(&exec);
-
-	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
-	drm_exec_until_all_locked(&exec)
-	{
-		break;
-	}
-	drm_exec_fini(&exec);
-	KUNIT_SUCCEED(test);
-}
-
 static struct kunit_case drm_exec_tests[] = {
 	KUNIT_CASE(sanitycheck),
 	KUNIT_CASE(test_lock),
@@ -203,7 +183,6 @@ static struct kunit_case drm_exec_tests[] = {
 	KUNIT_CASE(test_duplicates),
 	KUNIT_CASE(test_prepare),
 	KUNIT_CASE(test_prepare_array),
-	KUNIT_CASE(test_multiple_loops),
 	{}
 };
 
diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
index 8725ba92ff91..4a6b6aba4f15 100644
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
@@ -121,7 +110,8 @@ _label:									 \
  * guaranteed that no GEM object is locked.
  */
 #define drm_exec_until_all_locked(exec)					\
-	__drm_exec_until_all_locked(exec, __UNIQUE_ID(drm_exec))
+	__drm_exec_retry: __maybe_unused;				\
+	for (bool __drm_exec_loop __maybe_unused = true; drm_exec_cleanup(exec);)
 
 /**
  * drm_exec_retry_on_contention - restart the loop to grap all locks
@@ -132,8 +122,9 @@ _label:									 \
  */
 #define drm_exec_retry_on_contention(exec)			\
 	do {							\
-		if (unlikely(drm_exec_is_contended(exec)))	\
-			goto *__drm_exec_retry_ptr;		\
+		if (unlikely(__drm_exec_loop &&			\
+			     drm_exec_is_contended(exec)))	\
+			goto __drm_exec_retry;			\
 	} while (0)
 
 /**
@@ -157,8 +148,9 @@ static inline bool drm_exec_is_contended(struct drm_exec *exec)
  */
 #define drm_exec_retry(_exec)					\
 	do {							\
-		WARN_ON((_exec)->contended != DRM_EXEC_DUMMY);	\
-		goto *__drm_exec_retry_ptr;			\
+		WARN_ON(__drm_exec_loop &&			\
+			(_exec)->contended != DRM_EXEC_DUMMY);	\
+		goto __drm_exec_retry;				\
 	} while (0)
 
 /**
