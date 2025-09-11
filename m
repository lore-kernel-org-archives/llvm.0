Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D28D327A3C
	for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 22:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757628050; cv=none; b=qAXLTUVTBzawMPnCkB2U4XyJUftLRC/+FZTw6mjjE8Xs/+Bqqsh3DjxfZzYsIwTVafoflURgOPRewImNYiToUl+D+qWNxlIs7jNnM16lYY7Bv/SOfW+c8qujM7BCCkgdR0VDP3+UjucLJMEXgIPXOUAFzXxqtbcdWyWEyds/TGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757628050; c=relaxed/simple;
	bh=AyIdQ9L9OeyX521nrdHbDt4oVSqD3xS+WzZJNAQawIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZboFOYjkXQRfjXdQD8WnMYIrpCpOdyBcd2ba61+KzfpABaSa2TBtzT5uiWV+R4tRNHjwnof+GZzfhuG3pyD7yOi42psELGv7NfZP3aXV9jZ97gAZ2phNhtigc6ARqHjwC6J7aOp5ZunHhQoEwRJ4xYVjsnPzI8CaMrsBgsRRF20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9AT4pmM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9AT4pmM"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso10051295e9.2
        for <llvm@lists.linux.dev>; Thu, 11 Sep 2025 15:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757628047; x=1758232847; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNGC3S96f0iYG7S7yObvSZ6IO9c4scAuRn29A95dofY=;
        b=L9AT4pmMFy79h2j6lt4usX7udxiV6Hal9uRGXX0Smxh4qGiJoilATB3JmgWhvzHQBG
         YsZOliAwyK2FoMpritJjyXetN3lAzbs9HPiPeOVQsUiiSaAhFXlRnB1GTNM7t0UBrH4f
         9ZRwVVqEJkDdEbfA0MO43ARqjKOK25T1HmsNcY68twCNLhpwhhDP+RiYnx3BnG9tSo1Y
         CE5lERO/WCHU6Y2rkRUSdAcymO5XFEeM4Su5LMBL19TSQDbYgqnoOz3U86qaD6bUyH0q
         ODzNgOpKCvVpQogJ/SqV0VD4NVuHQNGSgP/pHiiojYwtHBlVKXWEB3QogHqT/usCGtFt
         w+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757628047; x=1758232847;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNGC3S96f0iYG7S7yObvSZ6IO9c4scAuRn29A95dofY=;
        b=BlWSA2EBodxakWNNn0n2Q/iQBF1haTvm8Da2H2AJyOEi6e9iULr0GA3Z5HE1uRmRYC
         LvTzvOrBU6ks6Dw+e/ctTlUBA4luDMvIKsJpwOGXZhvW0oVwpfI2EffHpnDvpKSgNw05
         iGg//nDl6RqMX8tDwe/em9diFHYa1lCQA7gnRV1FChPHN4KGM+UGm/nUnPNQxovptZ5q
         RPFMVRq+SPeAem+R4loMhESdSyDxhO2av5xpW/76XXSHim4dFKG9XbxzsGSopKtBim82
         KxMBIdYS9KoPVED26Vb6RWYSthPzobSXGbdwSFShSYQocZUOqa8IcShu6Svv5dWxhqJb
         9X+A==
X-Forwarded-Encrypted: i=1; AJvYcCUQ18EV8Wm5K925RdsjJrg9nBc+a55jCL4vR2NZXFEC665a8tnoS/A3RewdMJh7mTlcTYs+@lists.linux.dev
X-Gm-Message-State: AOJu0YybQt6LHNjsWc73KNppaNRd7smH4cM5QccSCKGPqMW9RexsPJjv
	ygBlw7Qj5QIsFtTTeLzTDW8/+FY13SCcZU9xoVXiEJInNRCs3oCSJDM7l9yTwaQKPpZLqqI737/
	ZHlhN7/OggZixhh73yO6pQh0rZ4pCwsI=
X-Gm-Gg: ASbGncsibMDBi5GnNuIwnMcX/NRuQ9fMCGl1BQgKUvVlicaWB66al1hOAogdt02OMLM
	ZwN8TudUuWJG2F0QY+8EMS5tpBPO5zAYXQO5k3ffNxQ2sbGPuNTwyBbWxFjwmogPrHxDeBAeOPE
	UAWMLFJeqq1ACDmEFb1Li1PfAJKbbMOAvMO9A8iSvisSZv7gOezY33abn26ui0yImz+SNTe0CTN
	PTdq+W5X+LL9da6cVAlRm45xoW8rhldYYI4
X-Google-Smtp-Source: AGHT+IGhOSWpHlpALI/lzdPz72vgmRbcHanf8h6jJsn15Xo09fd25S6ynV6BBaXIb+2CIIQV9R9kuhRlge27S6C19mw=
X-Received: by 2002:a05:6000:4023:b0:3c9:3f46:70eb with SMTP id
 ffacd0b85a97d-3e7659f3b84mr741021f8f.52.1757628046755; Thu, 11 Sep 2025
 15:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250911010437.2779173-10-eddyz87@gmail.com> <202509112112.wkWw6wJW-lkp@intel.com>
 <c846a153010e40a52e98b8abe9db69f7d4cadd58.camel@gmail.com>
In-Reply-To: <c846a153010e40a52e98b8abe9db69f7d4cadd58.camel@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 11 Sep 2025 15:00:35 -0700
X-Gm-Features: AS18NWAAMoGo6ybHHipSr8Dg7OeGrogyD5EPk8l-wM51YPkXTYDAOkyqXPipa6c
Message-ID: <CAADnVQKGwghC=+V8u0tSPdkJ1f4usY5LeYUpxnJno=3xW8tYGg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 09/10] bpf: disable and remove registers chain
 based liveness
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: kernel test robot <lkp@intel.com>, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, oe-kbuild-all@lists.linux.dev, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Kernel Team <kernel-team@fb.com>, Yonghong Song <yonghong.song@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 2:26=E2=80=AFPM Eduard Zingerman <eddyz87@gmail.com=
> wrote:
>
> On Thu, 2025-09-11 at 22:19 +0800, kernel test robot wrote:
> > Hi Eduard,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on bpf-next/master]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Eduard-Zingerman=
/bpf-bpf_verifier_state-cleaned-flag-instead-of-REG_LIVE_DONE/20250911-0906=
04
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.gi=
t master
> > patch link:    https://lore.kernel.org/r/20250911010437.2779173-10-eddy=
z87%40gmail.com
> > patch subject: [PATCH bpf-next v1 09/10] bpf: disable and remove regist=
ers chain based liveness
> > config: x86_64-buildonly-randconfig-003-20250911 (https://download.01.o=
rg/0day-ci/archive/20250911/202509112112.wkWw6wJW-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20250911/202509112112.wkWw6wJW-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202509112112.wkWw6wJW-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > > > kernel/bpf/verifier.c:19305:11: warning: variable 'err' is uninitia=
lized when used here [-Wuninitialized]
> >     19305 |                                 err =3D err ? : push_jmp_hi=
story(env, cur, 0, 0);
> >           |                                       ^~~
> >    kernel/bpf/verifier.c:19140:12: note: initialize the variable 'err' =
to silence this warning
> >     19140 |         int n, err, states_cnt =3D 0;
> >           |                   ^
> >           |                    =3D 0
> >    1 warning generated.
> >
> >
> > vim +/err +19305 kernel/bpf/verifier.c
>
> This was sloppy on my side, should look as follows:
>
> --- a/kernel/bpf/verifier.c
> +++ b/kernel/bpf/verifier.c
> @@ -19297,9 +19297,12 @@ static int is_state_visited(struct bpf_verifier_=
env *env, int insn_idx)
>                          * the precision needs to be propagated back in
>                          * the current state.
>                          */
> -                       if (is_jmp_point(env, env->insn_idx))
> -                               err =3D err ? : push_jmp_history(env, cur=
, 0, 0);
> -                       err =3D err ? : propagate_precision(env, &sl->sta=
te, cur, NULL);
> +                       if (is_jmp_point(env, env->insn_idx)) {
> +                               err =3D push_jmp_history(env, cur, 0, 0);
> +                               if (err)
> +                                       return err;
> +                       }
> +                       err =3D propagate_precision(env, &sl->state, cur,=
 NULL);

hmm. init err=3D0 instead and avoid explicit if (err)return err ?
