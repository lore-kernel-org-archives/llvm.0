Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE32171CD
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 21:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757625990; cv=none; b=SWRPYY+t7aIlQs1a9O2mOZVGPO8aZQiGl4LLppq/0igrxmy7uY62XznSlwzTc42YTPOfEsyaz4FMt0z1pjlOKENJ7ZH9CdPQXgOxlqJaQ3SyxW1PzzUG2Ob4X7fUhoc/fneKfTZcZCL3NFcyYrG/EKS9x/myRrDGWbPHWOyRqCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757625990; c=relaxed/simple;
	bh=sFo11LJDFbgdEzVFkudN41eUwSXYsUo78kBXh07zsiw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tR+Tt4osn6gttpipQR5clfGN/KTiumBGbo58YI70h1kiBOiPOVFw490bbRu3o0W1A8MZOTowjS4PMob1opjAxAhzR0c90bIyKphA/sKzBn1kjDsJRvt2mgPNay573WfR4orDkpIJiODpzU+G+tQCLQGiTdb2BGJhvnxDhDCQL4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BdEPqZ1m; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BdEPqZ1m"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2445806e03cso14028055ad.1
        for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 14:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757625988; x=1758230788; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EjquTq5MAgSVrD6End1v2/eMfRkFt39jWpb1aBSSPxk=;
        b=BdEPqZ1mEyAivChqM3rT0Cdlw42oQ+pREsfn4BcDvuaiMbrv/tH7qejBLiGF546a/l
         Ge6+Ww/kFPejai9IaKLDUKQjVINJXtwIroOb1dPbKYvL1R8n3d74WnT/EiqTCulB1k75
         +McrefJO+ceIDmPcuG6e4OSsIISnKz0gWG/EghLX657JZlJR/1Nwz2KohD9IRLfzoelt
         ibea3e3HTnwRkNjP/h1tcJ5Dh8GCpcJkbr0NxqGft9dhstTJNB7Y9u5RKsePZ3f2h/Gk
         qeDh+h1yS84ckD0YnHDJjAKpEgD+qG86RgHQiTRjd8ZCXSygy+SskM9csTTzyPxQlTSm
         k22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757625988; x=1758230788;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjquTq5MAgSVrD6End1v2/eMfRkFt39jWpb1aBSSPxk=;
        b=KdkZLOWrDfQLYGv7s0Z1PYyFTnEl/j8hur3eSRYlt28/wBQP7x8ybsGzjgBoZVpMro
         HcDanZe8o6rYbwriVzsqoQZ/FGt8/YPMTtLm8R76E2+e8FLA5lmWYioyQitvFFpqf6uh
         HPTaybqSY5BuEmTP7BmLTTMJJZQxsotujGsY4r1Uz6jCRswJv0ha30TL36rMpoiRycvs
         DFHLWflDolH+HhOvF2RorzrB8OccE89ENCM3picb+H9tvlGrw6Rdc2TgoyvAIStu11Jb
         DaAW4w+AX/hn2gn+b3fPwdJBvC0Cj1KG5Jrx2kF9VHVol4898iQNZVvUbd2OAMxka7+D
         Zj9Q==
X-Gm-Message-State: AOJu0YwpRzvhGD4m6X0TTbTF4nKO3vejOayB5fO0m/4DTHoAgVwtwbI7
	9tZDgkgwpv4v+XCxbLb/znIg2QRYqMM3c48kUOEiN7meIQSuQ8Df7Nv4
X-Gm-Gg: ASbGncs3AtP0LDhTpI8hCATq3yGZlLPp+nKpGok56jX1pQ2YRZpR/VnGrn9FRu68+tC
	Xd4rPFgtAeJvu70aDdWQ0YKDBODISMoutEi9a4UQoc8lwtmvSbEJsA0FV0UmORByLtPl0l2EBzO
	5Wvm6teqqvn9X322uw2rJDV+GLhksG0RIdMA1Kkk2Uv6Je0o9AP5MU1ewvPuREdzBuk/1yAVV5e
	/hMF9giXxIg+oC9ZW4Vhv3vbiAs9Z7lejhaSxcJNn9wkA9+KOArmP63sIxYNYAmZ242jL94nGSB
	1SiB0bn6lKNREgWkZQYA01c3WNv30zMTykUNGgNl9XG9RHxJf+1w1LLChwb4/zq6iCCpi3w56yk
	trjr77wSQ0L2A2UDNABMMFMst4Ga/iw==
X-Google-Smtp-Source: AGHT+IEjwfOvzZk84xflzxjLm5xONbXJLauvwJlikYGw0U/j6U74AKTutnNrVqldFjubLYTuTs0HYg==
X-Received: by 2002:a17:903:1b08:b0:25c:9688:bdca with SMTP id d9443c01a7336-25d26e43a33mr7095795ad.50.1757625988238;
        Thu, 11 Sep 2025 14:26:28 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37295f4fsm28513255ad.42.2025.09.11.14.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 14:26:27 -0700 (PDT)
Message-ID: <c846a153010e40a52e98b8abe9db69f7d4cadd58.camel@gmail.com>
Subject: Re: [PATCH bpf-next v1 09/10] bpf: disable and remove registers
 chain based liveness
From: Eduard Zingerman <eddyz87@gmail.com>
To: kernel test robot <lkp@intel.com>, bpf@vger.kernel.org, ast@kernel.org, 
	andrii@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 daniel@iogearbox.net, 	martin.lau@linux.dev, kernel-team@fb.com,
 yonghong.song@linux.dev
Date: Thu, 11 Sep 2025 14:26:24 -0700
In-Reply-To: <202509112112.wkWw6wJW-lkp@intel.com>
References: <20250911010437.2779173-10-eddyz87@gmail.com>
	 <202509112112.wkWw6wJW-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-09-11 at 22:19 +0800, kernel test robot wrote:
> Hi Eduard,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on bpf-next/master]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman/b=
pf-bpf_verifier_state-cleaned-flag-instead-of-REG_LIVE_DONE/20250911-090604
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
master
> patch link:    https://lore.kernel.org/r/20250911010437.2779173-10-eddyz8=
7%40gmail.com
> patch subject: [PATCH bpf-next v1 09/10] bpf: disable and remove register=
s chain based liveness
> config: x86_64-buildonly-randconfig-003-20250911 (https://download.01.org=
/0day-ci/archive/20250911/202509112112.wkWw6wJW-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250911/202509112112.wkWw6wJW-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202509112112.wkWw6wJW-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
> > > kernel/bpf/verifier.c:19305:11: warning: variable 'err' is uninitiali=
zed when used here [-Wuninitialized]
>     19305 |                                 err =3D err ? : push_jmp_hist=
ory(env, cur, 0, 0);
>           |                                       ^~~
>    kernel/bpf/verifier.c:19140:12: note: initialize the variable 'err' to=
 silence this warning
>     19140 |         int n, err, states_cnt =3D 0;
>           |                   ^
>           |                    =3D 0
>    1 warning generated.
>=20
>=20
> vim +/err +19305 kernel/bpf/verifier.c

This was sloppy on my side, should look as follows:

--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -19297,9 +19297,12 @@ static int is_state_visited(struct bpf_verifier_en=
v *env, int insn_idx)
                         * the precision needs to be propagated back in
                         * the current state.
                         */
-                       if (is_jmp_point(env, env->insn_idx))
-                               err =3D err ? : push_jmp_history(env, cur, =
0, 0);
-                       err =3D err ? : propagate_precision(env, &sl->state=
, cur, NULL);
+                       if (is_jmp_point(env, env->insn_idx)) {
+                               err =3D push_jmp_history(env, cur, 0, 0);
+                               if (err)
+                                       return err;
+                       }
+                       err =3D propagate_precision(env, &sl->state, cur, N=
ULL);
                        if (err)
                                return err;
                        /* When processing iterator based loops above propa=
gate_liveness and


[...]
