Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8D1A3178;
	Wed, 10 Sep 2025 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757533172; cv=none; b=pubm1L35cwvV/SKimvdgCKZ9rnPHF9i1zJvfUmiouAte4kfdUK+6Rg9wfOL2tUgfZts4CaheGRDInBadP8VM/c4av7qhMitBt9C0zD+9XvDGt3hiysPwwxy2yPwtAttnqzoxmb5Z09+abXOcUklZYbi2NU88kPolOId/8baAqMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757533172; c=relaxed/simple;
	bh=2bYd+Kc/AiOJ1X8q1k04DyZRSNaK3CG/W0xtgbf35zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mc1MlfCJbZanrRLFhCC2PXbQCHA/z3L1W7Cfi6WrASOG+qn1SzDgZW3i1uHHghjZ+wZvefTmF1FJtgyr0jR83bRL3jlwF0utiWFCZmLnorvC0ko47Ymo4jgYbM1ExV+nNAieCck8RDeHAPDkO4SBr/6CKdmvWFQ+jKRbKOiRsg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVRFSm4c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVRFSm4c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC1AC4CEEB;
	Wed, 10 Sep 2025 19:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757533172;
	bh=2bYd+Kc/AiOJ1X8q1k04DyZRSNaK3CG/W0xtgbf35zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVRFSm4ct7fbUpC5hwJs/shcMdU7SUfgNnPLNsmRoZGlCxwxLHxhrVB8tXRW0Uc/o
	 UJIGmRoJ7XiQO6aeY2QjFiZaA2Hf13KA1WfGNqwzTQa4ZzmaCfQNYohkJb2PwcmP88
	 CV4A4MQtkNjpz5qnNv7Q2/M7kmjnQV1qdWF36BNOB0hsJ9UPGuX2uhcULskWwajr/c
	 8TlSH6mkMRwiVuJOpEBn1i2LWG/u/cKaU1XWYRxzTQqVMvqvOMASkwX80cZY1+cuCc
	 e4GxGch7JsdvAy+dHAdOX3Hzy8m18FU1zjCH3s+cLouNS6Cw3uBTBNpzyT+LEQmWKD
	 PTDdSp2qCXgVQ==
Date: Wed, 10 Sep 2025 12:39:28 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org,
	Matthew Brost <matthew.brost@intel.com>
Subject: Re: [drm-xe:drm-xe-next 11/13]
 drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from this indirect
 goto statement to one of its possible targets
Message-ID: <20250910193928.GA2640818@ax162>
References: <202509101853.nDmyxTEM-lkp@intel.com>
 <4a68cafa4e06e8962d205e30521c9e333e9cbb35.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a68cafa4e06e8962d205e30521c9e333e9cbb35.camel@linux.intel.com>

On Wed, Sep 10, 2025 at 05:16:50PM +0200, Thomas Hellström wrote:
> On Wed, 2025-09-10 at 18:33 +0800, kernel test robot wrote:
> > tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
> > head:   844150c255c94230aec41f88db8e2875cb97439e
> > commit: 59eabff2a3524d7f3bf6c24890cd197c4c116fcb [11/13] drm/xe:
> > Convert xe_bo_create_pin_map() for exhaustive eviction
> > config: loongarch-randconfig-001-20250910
> > (https://download.01.org/0day-ci/archive/20250910/202509101853.nDmyxT
> > EM-lkp@intel.com/config)
> > compiler: clang version 18.1.8
> > (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7a
> > b81f3d7ff)
> > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20250910/202509101853.nDmyxT
> > EM-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > > > drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from
> 
> This one looks like a clang loongarch bug. It doesn't happen on clang
> x86 and looks implausible.

This does not appear for x86_64 because its defintion of _THIS_IP_ in
arch/x86/include/asm/linkage.h does not use the address of a label

  #ifdef CONFIG_64BIT
  /*
   * The generic version tends to create spurious ENDBR instructions under
   * certain conditions.
   */
  #define _THIS_IP_ ({ unsigned long __here; asm ("lea 0(%%rip), %0" : "=r" (__here)); __here; })
  #endif

compared to

  #ifndef _THIS_IP_
  #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
  #endif

for all other architectures. I can reproduce this with both arm64 and i386:

  $ make -skj"$(nproc)" ARCH=i386 LLVM=1 clean defconfig

  $ scripts/config -e DRM_XE -e PROVE_LOCKING

  $ make -skj"$(nproc)" ARCH=i386 LLVM=1 olddefconfig drivers/gpu/drm/xe/xe_migrate.o
  drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from this indirect goto statement to one of its possible targets
    422 |                 drm_exec_retry_on_contention(&exec);
        |                 ^
  include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
    123 |                         goto *__drm_exec_retry_ptr;             \
        |                         ^
  drivers/gpu/drm/xe/xe_migrate.c:465:2: note: possible target of indirect goto statement
    465 |         might_lock(&m->job_mutex);
        |         ^
  include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
    553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
        |                                        ^
  include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
     10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
        |                                         ^
  drivers/gpu/drm/xe/xe_migrate.c:420:2: note: jump exits scope of variable with __attribute__((cleanup))
    420 |         xe_validation_guard(&ctx, &xe->val, &exec, (struct xe_val_flags) {}, err) {
        |         ^
  drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macro 'xe_validation_guard'
    189 |         scoped_guard(xe_validation, _ctx, _val, _exec, _flags, _ret) \
        |         ^
  include/linux/cleanup.h:429:2: note: expanded from macro 'scoped_guard'
    429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
        |         ^
  include/linux/cleanup.h:420:20: note: expanded from macro '__scoped_guard'
    420 |         for (CLASS(_name, scope)(args);                                 \
        |                           ^
  drivers/gpu/drm/xe/xe_migrate.c:465:2: note: jump enters a statement expression
    465 |         might_lock(&m->job_mutex);
        |         ^
  include/linux/lockdep.h:553:33: note: expanded from macro 'might_lock'
    553 |         lock_release(&(lock)->dep_map, _THIS_IP_);                      \
        |                                        ^
  include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
     10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
        |                    ^
  ...

While I agree that this is clearly a false positive because
__drm_exec_retry_ptr is only assigned the label in
drm_exec_until_all_locked() so we know __here will never be jumped to
via 'goto *__drm_exec_retry_ptr;', I am not sure that this is a clang
bug. Both compilers agree that the kernel's use of the address of a
label in _THIS_IP_ is problematic because it does not conform to the
only supported use case for taking the address of a label, which is for
computed gotos:

  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44298
  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071
  https://github.com/llvm/llvm-project/issues/138272
  https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html

Given that is the only supported use case, I don't think it is
unreasonable for clang to make sure all address-taken labels in a
function are valid jump targets for a computed goto since that is the
only reason they should be exist in a function.

This could be worked around fairly simply with something like the
following diff.

Cheers,
Nathan

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 6fad5d469629..b80eddf1a36e 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -462,7 +462,13 @@ int xe_migrate_init(struct xe_migrate *m)
 
 	mutex_init(&m->job_mutex);
 	fs_reclaim_acquire(GFP_KERNEL);
+#ifndef CONFIG_CC_IS_CLANG
+	/*
+	 * _THIS_IP_ runs afoul of clang's scope checking and the computed goto
+	 * in drm_exec_retry_on_contention().
+	 */
 	might_lock(&m->job_mutex);
+#endif
 	fs_reclaim_release(GFP_KERNEL);
 
 	err = devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini, m);
