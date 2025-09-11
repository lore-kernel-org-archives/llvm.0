Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98631804A;
	Thu, 11 Sep 2025 06:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757572459; cv=none; b=jtgjihdhlX+SYWjAERVs6K6avBNePtZWinsl2jDwkZ1K6GEysyMoXrW0Y2ieQBx2WtGTxMkMMdA267MsbdTViSNFzhO3tk7VfqABNSYBO4U7X/jyYZzlOu5oLYQzabUalCFQzd/G8FOFEUZ5N2JaATrmikfaD7W7N7q/EUDoEB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757572459; c=relaxed/simple;
	bh=XtL7Kx9yeZESFYmPY07/YUv6CKRmyo8/pZoRO8Oauak=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oa0d5y25ks5u5gXeK0WzlrR9iAclBs8K68cm4GNiwVdu/ulQgJAFVu7fw3wh9NMQcKZBI4GBO6omluEB3Sns5zC622PzlZShWKOxn70ap/QX1pHdp4GOPykfJYCDqD3mMmG9CrqL4cCbQhU+EA1I6UdSJeSK85NK8yPt1b1MVlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a26p26qK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a26p26qK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757572458; x=1789108458;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=XtL7Kx9yeZESFYmPY07/YUv6CKRmyo8/pZoRO8Oauak=;
  b=a26p26qKmPSl5slfSLZs7/MtMSSXDLGnwNm2Aw3Plj/r5JbHTkvaq5oE
   G0/z/p2linvAT+trb27ABvJ6os20O4NuJfP4UBj4pBC71o8Y1kW1P3nue
   Ed0wNQ7898ZsPQwPEgrFo8/RaFOSYlp2cw6nRwk7WnnYXYBQi4MPLlZb6
   kNXH6vkTMLcex+/EB0CgWhwmD2dElXboPbOGBigIDFfMFvqurVbMT4vTQ
   GFh1KYL0gqU8GYATl/UCJHBDxynRUlXHi048su9D7NSF2iDTQk45RXmbV
   ZR6qi04JTudtcU7HJf2bOW5UUGuNY2E32nngJGmgPxSFpOwII0ix2iwfy
   g==;
X-CSE-ConnectionGUID: 9nEjEdDBTLmlh021cI75xw==
X-CSE-MsgGUID: B12GvmdfTfyzXymhQyCQdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71318650"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="71318650"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 23:34:17 -0700
X-CSE-ConnectionGUID: YPWajGZ4QluqWjUvQc6psA==
X-CSE-MsgGUID: pSP0tFhTS225j7yNRVe5Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; 
   d="scan'208";a="210740802"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.168]) ([10.245.245.168])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 23:34:15 -0700
Message-ID: <9f88c6c5e3087b86e63b06a358abbe56a00f70ed.camel@linux.intel.com>
Subject: Re: [drm-xe:drm-xe-next 11/13]
 drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from this
 indirect goto statement to one of its possible targets
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, intel-xe@lists.freedesktop.org, Matthew
 Brost	 <matthew.brost@intel.com>
Date: Thu, 11 Sep 2025 08:34:12 +0200
In-Reply-To: <20250910193928.GA2640818@ax162>
References: <202509101853.nDmyxTEM-lkp@intel.com>
	 <4a68cafa4e06e8962d205e30521c9e333e9cbb35.camel@linux.intel.com>
	 <20250910193928.GA2640818@ax162>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

On Wed, 2025-09-10 at 12:39 -0700, Nathan Chancellor wrote:
> On Wed, Sep 10, 2025 at 05:16:50PM +0200, Thomas Hellstr=C3=B6m wrote:
> > On Wed, 2025-09-10 at 18:33 +0800, kernel test robot wrote:
> > > tree:=C2=A0=C2=A0 https://gitlab.freedesktop.org/drm/xe/kernel.git=C2=
=A0drm-xe-
> > > next
> > > head:=C2=A0=C2=A0 844150c255c94230aec41f88db8e2875cb97439e
> > > commit: 59eabff2a3524d7f3bf6c24890cd197c4c116fcb [11/13] drm/xe:
> > > Convert xe_bo_create_pin_map() for exhaustive eviction
> > > config: loongarch-randconfig-001-20250910
> > > (
> > > https://download.01.org/0day-ci/archive/20250910/202509101853.nDmy
> > > xT
> > > EM-lkp@intel.com/config)
> > > compiler: clang version 18.1.8
> > > (
> > > https://github.com/llvm/llvm-project=C2=A03b5b5c1ec4a3095ab096dd780e8=
4d
> > > 7a
> > > b81f3d7ff)
> > > reproduce (this is a W=3D1 build):
> > > (
> > > https://download.01.org/0day-ci/archive/20250910/202509101853.nDmy
> > > xT
> > > EM-lkp@intel.com/reproduce)
> > >=20
> > > If you fix the issue in a separate patch/commit (i.e. not just a
> > > new
> > > version of
> > > the same patch/commit), kindly add following tags
> > > > Reported-by: kernel test robot <lkp@intel.com>
> > > > Closes:
> > > > https://lore.kernel.org/oe-kbuild-all/202509101853.nDmyxTEM-lkp@int=
el.com/
> > >=20
> > > All errors (new ones prefixed by >>):
> > >=20
> > > > > drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump
> > > > > from
> >=20
> > This one looks like a clang loongarch bug. It doesn't happen on
> > clang
> > x86 and looks implausible.
>=20
> This does not appear for x86_64 because its defintion of _THIS_IP_ in
> arch/x86/include/asm/linkage.h does not use the address of a label
>=20
> =C2=A0 #ifdef CONFIG_64BIT
> =C2=A0 /*
> =C2=A0=C2=A0 * The generic version tends to create spurious ENDBR instruc=
tions
> under
> =C2=A0=C2=A0 * certain conditions.
> =C2=A0=C2=A0 */
> =C2=A0 #define _THIS_IP_ ({ unsigned long __here; asm ("lea 0(%%rip), %0"
> : "=3Dr" (__here)); __here; })
> =C2=A0 #endif
>=20
> compared to
>=20
> =C2=A0 #ifndef _THIS_IP_
> =C2=A0 #define _THIS_IP_=C2=A0 ({ __label__ __here; __here: (unsigned
> long)&&__here; })
> =C2=A0 #endif
>=20
> for all other architectures. I can reproduce this with both arm64 and
> i386:
>=20
> =C2=A0 $ make -skj"$(nproc)" ARCH=3Di386 LLVM=3D1 clean defconfig
>=20
> =C2=A0 $ scripts/config -e DRM_XE -e PROVE_LOCKING
>=20
> =C2=A0 $ make -skj"$(nproc)" ARCH=3Di386 LLVM=3D1 olddefconfig
> drivers/gpu/drm/xe/xe_migrate.o
> =C2=A0 drivers/gpu/drm/xe/xe_migrate.c:422:3: error: cannot jump from thi=
s
> indirect goto statement to one of its possible targets
> =C2=A0=C2=A0=C2=A0 422 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_exec_retry_on_contenti=
on(&exec);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 include/drm/drm_exec.h:123:4: note: expanded from macro
> 'drm_exec_retry_on_contention'
> =C2=A0=C2=A0=C2=A0 123 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 goto
> *__drm_exec_retry_ptr;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 drivers/gpu/drm/xe/xe_migrate.c:465:2: note: possible target of
> indirect goto statement
> =C2=A0=C2=A0=C2=A0 465 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
might_lock(&m->job_mutex);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 include/linux/lockdep.h:553:33: note: expanded from macro
> 'might_lock'
> =C2=A0=C2=A0=C2=A0 553 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
lock_release(&(lock)->dep_map,
> _THIS_IP_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 include/linux/instruction_pointer.h:10:41: note: expanded from
> macro '_THIS_IP_'
> =C2=A0=C2=A0=C2=A0=C2=A0 10 | #define _THIS_IP_=C2=A0 ({ __label__ __here=
; __here: (unsigned
> long)&&__here; })
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 drivers/gpu/drm/xe/xe_migrate.c:420:2: note: jump exits scope of
> variable with __attribute__((cleanup))
> =C2=A0=C2=A0=C2=A0 420 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
xe_validation_guard(&ctx, &xe->val, &exec, (struct
> xe_val_flags) {}, err) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 drivers/gpu/drm/xe/xe_validation.h:189:2: note: expanded from macr=
o
> 'xe_validation_guard'
> =C2=A0=C2=A0=C2=A0 189 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
scoped_guard(xe_validation, _ctx, _val, _exec,
> _flags, _ret) \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 include/linux/cleanup.h:429:2: note: expanded from macro
> 'scoped_guard'
> =C2=A0=C2=A0=C2=A0 429 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
__scoped_guard(_name, __UNIQUE_ID(label), args)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 include/linux/cleanup.h:420:20: note: expanded from macro
> '__scoped_guard'
> =C2=A0=C2=A0=C2=A0 420 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
for (CLASS(_name,
> scope)(args);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 drivers/gpu/drm/xe/xe_migrate.c:465:2: note: jump enters a
> statement expression
> =C2=A0=C2=A0=C2=A0 465 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
might_lock(&m->job_mutex);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 include/linux/lockdep.h:553:33: note: expanded from macro
> 'might_lock'
> =C2=A0=C2=A0=C2=A0 553 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
lock_release(&(lock)->dep_map,
> _THIS_IP_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> =C2=A0 include/linux/instruction_pointer.h:10:20: note: expanded from
> macro '_THIS_IP_'
> =C2=A0=C2=A0=C2=A0=C2=A0 10 | #define _THIS_IP_=C2=A0 ({ __label__ __here=
; __here: (unsigned
> long)&&__here; })
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^
> =C2=A0 ...
>=20
> While I agree that this is clearly a false positive because
> __drm_exec_retry_ptr is only assigned the label in
> drm_exec_until_all_locked() so we know __here will never be jumped to
> via 'goto *__drm_exec_retry_ptr;', I am not sure that this is a clang
> bug. Both compilers agree that the kernel's use of the address of a
> label in _THIS_IP_ is problematic because it does not conform to the
> only supported use case for taking the address of a label, which is
> for
> computed gotos:
>=20
> =C2=A0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D44298
> =C2=A0 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D120071
> =C2=A0 https://github.com/llvm/llvm-project/issues/138272
> =C2=A0 https://gcc.gnu.org/onlinedocs/gcc/Labels-as-Values.html
>=20
> Given that is the only supported use case, I don't think it is
> unreasonable for clang to make sure all address-taken labels in a
> function are valid jump targets for a computed goto since that is the
> only reason they should be exist in a function.
>=20
> This could be worked around fairly simply with something like the
> following diff.
>=20
> Cheers,
> Nathan

Yeah, I already have a patch in our CI that moves the goto and the
corresponding label to a separate static function so we can keep the
lockdep check.

Given your explanation, I need to change the commit message, though.

Thanks,
Thomas


>=20
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> b/drivers/gpu/drm/xe/xe_migrate.c
> index 6fad5d469629..b80eddf1a36e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -462,7 +462,13 @@ int xe_migrate_init(struct xe_migrate *m)
> =C2=A0
> =C2=A0	mutex_init(&m->job_mutex);
> =C2=A0	fs_reclaim_acquire(GFP_KERNEL);
> +#ifndef CONFIG_CC_IS_CLANG
> +	/*
> +	 * _THIS_IP_ runs afoul of clang's scope checking and the
> computed goto
> +	 * in drm_exec_retry_on_contention().
> +	 */
> =C2=A0	might_lock(&m->job_mutex);
> +#endif
> =C2=A0	fs_reclaim_release(GFP_KERNEL);
> =C2=A0
> =C2=A0	err =3D devm_add_action_or_reset(xe->drm.dev, xe_migrate_fini,
> m);

