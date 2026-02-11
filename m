Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F236AB5B;
	Wed, 11 Feb 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807406; cv=none; b=JMkABUTTOSWMLAHqFLP9F6wZMtEf0EZoECxbvHYsvsy5pZwBAn3zYWCqwfKFqyginRDhXCO0OF3ZsaPrgIgOb7ARU0HH+ky0wL1XzM2TlW78B1M4xeQMc9szO9bdYqBO99WHudfWd65hDHDrV3AQaK1KhQAQwvA/r7URb0qF0E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807406; c=relaxed/simple;
	bh=gMLlAag35c9LSAaTZF8soL/XlIj++H4vYTe1OQNLlNw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YteAOREBdrypjIjoSP2Dz0fGs/mSveSOaLfuwKpd2JWVEsZl5ireiqLOoSxx3bK0+BgEpD+0rCxunyy0aiGYvDCKcdarA2x2PsBen5Pv/5BppTRYM9AcwWG08iG9yj57UivvgaNdjxcJSskDP8AJQIOEFlKNPfxyBDvkc0UY5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AqimoI6M; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AqimoI6M"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4f9wNJ5fDgz9tpf;
	Wed, 11 Feb 2026 11:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1770807392; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8D2K+brmcX9jyLHAA/rQuQznyMmiZsmCIlbxqnliqqs=;
	b=AqimoI6MrWRJ/OVq1KjxAIVBZFJ8CbxzfeYbkIgj+wiOrcquAsbvKT9Ma+OrMQQeEJBuDr
	egMts1/FDconUdwxJfr7TpJQBvMexWM1Q6KD2O/puui71a3trxgSVhTlGkFoKK4nyDI5pU
	0uxWVjzj8soaNgSEWsOzMzeQgYC/FPMS+42dj/OmqtAiJS7HJNmtS5h2s33ENMgh6qqybx
	zt+v2fnjTuBzeQpN5Jl1ZQA+cnQhI/39baMhMV5ubSyK+ykZZxI8SZh4R2iTquG56lfAMZ
	iJHNo/9/7uIXw5paJTSR3JB+DdwdJJX4ZZOrmvftc6GHrTjfpyqEdZW6mr7W3A==
Message-ID: <ef514066e5771e8ac1deb3ae6baa14b798305fd2.camel@mailbox.org>
Subject: Re: [PATCH v6 06/31] drm/sched: Add some scheduling quality unit
 tests
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: kernel test robot <lkp@intel.com>, Tvrtko Ursulin
	 <tvrtko.ursulin@igalia.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 kernel-dev@igalia.com,  Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date: Wed, 11 Feb 2026 11:56:27 +0100
In-Reply-To: <202601292335.YI2PBzhs-lkp@intel.com>
References: <20260128110806.38350-7-tvrtko.ursulin@igalia.com>
	 <202601292335.YI2PBzhs-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: c4318eafb0eaf8ea950
X-MBO-RS-META: 8856ey5gqawaq6z5rij179qc97fac74p

On Thu, 2026-01-29 at 23:31 +0800, kernel test robot wrote:
> Hi Tvrtko,
>=20
> kernel test robot noticed the following build errors:
>=20
> [auto build test ERROR on drm-misc/drm-misc-next]
> [also build test ERROR on drm-xe/drm-xe-next daeinki-drm-exynos/exynos-dr=
m-next drm/drm-next drm-i915/for-linux-next drm-i915/for-linux-next-fixes d=
rm-tip/drm-tip linus/master v6.19-rc7 next-20260128]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]

Hi Tvrtko,

what about this build error? Seems to be an Xe branch conflict?


BTW, I think Danilo and I told you a few times already that we would
like to get the whole patch series into our inboxes. You seem to
exclude patches for other components, but it's important for me to see
all the other driver maintainers' RBs etc. there and be easily able to
ping those who haven't reacted yet and so on. Also quickly coyping an
mbox to test-apply something etc. etc. is easier

I guess you want to spare people from noisy mail traffic, but getting
31 patches is not a problem, those who don't care can simple ignore
them or collapse the thread in their mail program and so on.


Thanks
P.


>=20
> url:=C2=A0=C2=A0=C2=A0 https://github.com/intel-lab-lkp/linux/commits/Tvr=
tko-Ursulin/drm-amdgpu-Reject-impossible-entities-early/20260128-191117
> base:=C2=A0=C2=A0 https://gitlab.freedesktop.org/drm/misc/kernel.git=C2=
=A0drm-misc-next
> patch link:=C2=A0=C2=A0=C2=A0 https://lore.kernel.org/r/20260128110806.38=
350-7-tvrtko.ursulin%40igalia.com
> patch subject: [PATCH v6 06/31] drm/sched: Add some scheduling quality un=
it tests
> config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260=
129/202601292335.YI2PBzhs-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project=C2=
=A07cbf1a2591520c2491aa35339f227775f4d3adf6)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260129/202601292335.YI2PBzhs-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202601292335.YI2PBzhs-lkp=
@intel.com/
>=20
> All errors (new ones prefixed by >>):
>=20
> > > drivers/gpu/drm/scheduler/tests/tests_scheduler.c:676:10: error: init=
ializer element is not a compile-time constant
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_two_clien=
ts_attr),
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
> =C2=A0=C2=A0 include/kunit/test.h:224:13: note: expanded from macro 'KUNI=
T_CASE_PARAM_ATTR'
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .attr =3D attributes, .mod=
ule_name =3D KBUILD_MODNAME}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~
> =C2=A0=C2=A0 1 error generated.
>=20
>=20
> vim +676 drivers/gpu/drm/scheduler/tests/tests_scheduler.c
>=20
> =C2=A0=C2=A0 672=09
> =C2=A0=C2=A0 673	static struct kunit_case drm_sched_scheduler_two_clients=
_tests[] =3D {
> =C2=A0=C2=A0 674		KUNIT_CASE_PARAM_ATTR(drm_sched_scheduler_two_clients_t=
est,
> =C2=A0=C2=A0 675				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_tw=
o_clients_gen_params,
> =C2=A0> 676				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_scheduler_two_cli=
ents_attr),
> =C2=A0=C2=A0 677		{}
> =C2=A0=C2=A0 678	};
> =C2=A0=C2=A0 679=09
>=20

