Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C073FADEE
	for <llvm@lists.linux.dev>; Thu, 28 May 2026 15:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779981332; cv=pass; b=nJJRO6eFpdwKx2+8CN8f+AOHkvDcQh1f7clry2ZCtcuWldqYVwNJ74lHzI4LxFU06/ETzFYF8ulpZKOmh4346pxQFWKDBs+xhhqXCNJ1oKN3I967KRlTwQoANC8QGfiJG6bNj2CdaemZUhe/70zAHV4wUu7HutEMYwcS2lA6UFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779981332; c=relaxed/simple;
	bh=Y1hkq8MSxHw3VdJ8eSo2oQ2NvWvlL9pcU93sRMFE598=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/kv2vaSYGKqY6g3gFECx9/H1NgCfRNPCsDAF5c9IF/wgiYIKSGXaXcxlYURxPuRWO1bqu4qaCsAkAhvm1+Eq2vTqcWm0fdJnoLvMuNYo6lm/Jj+d53CNsE0ezzOLwG8bFGtWf0RiGBPwCzut0KilvABujpJGhwkuSTMI0jDnwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=JPv+v7gZ; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="JPv+v7gZ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83538fbd0b2so5323958b3a.0
        for <llvm@lists.linux.dev>; Thu, 28 May 2026 08:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779981234; cv=none;
        d=google.com; s=arc-20240605;
        b=Xxvbza9AhmOHbxNLBaL+0ixlMYCKunWc62aXIFhcYWq3busR84J4025gO1YstY4XqN
         nebKpyja7s6oZ0yhzUQUQJmGKf8Q1PcyxiAFeFla8pPiFAsd/aF+I2VnFjOiQAWA8Njn
         ohU6yHgI7vOPqbCSe5uh03v0yDUD7D80N3lFuUp4Fiz9xPfiMwZVVstG974X3CbLCa5z
         Q3zXiVU8DHaR3T40UJ6IEnlAboA9saEbSU8xWWJRT22hZV0sHltnhjB0JOwB7l85VZwF
         sI5RQNr/YZQOeyaMrsCIjOratI4S8v4if7Xlq5Vp++EW4BAW0yxRdu94y39zxCaYPsxl
         dINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v25zfOayGfkaGbNqyJnQf+7cpwvfvY7ktaJ8S8eLFmY=;
        fh=Gxu+h3t2mKn1RIepA0Fft0LdsGrzNRbEXmkEiZZBnRw=;
        b=ACFkBM6foAWy23aGOEnOEeVX6dYH3BVqHocysUKVxmpU3x9PkNlnDDv1kt9y4NZzBc
         9lNCZP8h2/48swJURmbKOtZ82cg/4uYPUq8oICy81lpuhe9B/woNv4/5LBgNpz0NPRkH
         rZIYfY0BqB62pui4DdSZgoNBqXQaYTUplfE5Pzc14sW2Swezfh7ABQWRpHIMRnYLthQD
         SWuo9T90dlzz3hvx7IhZ9dGa3ggVTgdGX4gSbsxiGBoqO11NGENWEhAHXFb5k4TQkac/
         mPVS/nS7Np7FKumVpcdO8/4LSQzoD6q7chFkie91y3sqCirjBI1I0DTPIQYAkJxLTOVH
         VCsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1779981234; x=1780586034; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v25zfOayGfkaGbNqyJnQf+7cpwvfvY7ktaJ8S8eLFmY=;
        b=JPv+v7gZ3Za6DhUP4QdfzPkkyjHey3RuMUfyklH6skS2fqmYbePK/BYaJewJ9c9jNI
         wJniLyky19cKZFIgHj6J5hn84mu/JtGfKzKRZcy47kgbur+BBO905OqIk1c8XeW5bbBi
         y5GoaAj0SlrfHAgNaFDUeoXp+bl+MFLKPXrq1xHwYGLMgHbJlCRPULfZwgGU378cgbjV
         r0d6kptZMbWYUa1ykyNl8hMf5DtryGTCMGk5Ut8b0ZCwsJgO8v/I8W/NiELwKK0wn+67
         uUeAZV7l0oqmeWH3a8jeaj89wbXie99MFFn8IV7ssdjQ6t9FszncHT4vt5DByI+DnZWw
         Zeng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779981234; x=1780586034;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v25zfOayGfkaGbNqyJnQf+7cpwvfvY7ktaJ8S8eLFmY=;
        b=sZlAvnP1kT+C2W/B36xExAByHhJUiGP7Z6mewvyR/fxJkU4MnO3QgYlEjQE/0+CwUq
         zFMyJt9LKl1A+Dm5y3weK1a/34px5N31bM8fdkvGwoABdou7zGxMfHEkzI+kGRpiuVLS
         +uB6Z+L8GoeFZQeGe5T6icTSqpnIohOptJQM3gU5S+WolIev9SF86unHxOZ1jrBPzcDk
         AeMauGTvThnaa8F/0D5h1YGvVb5jApah6kSZGGA6EsZDOCBdNj5Q8B/2G1xChLZHxMxa
         ZhkisSNzZo5z4CsqTQp+nuwIYAmZmtH7u51rne2Vo9+Xnwf5sHKWNpLThzCaeZl2liXI
         3d3g==
X-Forwarded-Encrypted: i=1; AFNElJ+Axum/IkWTRmHEzM5tGmg32gdDH9q7L7n8ctOVBMpDQ4HN/cRomDO1cLCJPhy+fUp2cQsl@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1EidguxMQ6FqpaEbAdswJq6Q4xx7pe3HI6X9aPaLmII0peXWC
	47KGqoJfoqRWYr6usE7TDpo1kvxoid4oyZMHhFq3fDAloWHe3u1Q7/GPHMRnhmeuxnQlnFODxph
	hjCW+0ETDgKzaYNnBm29KvT8VY7+/HORfLH7/YyKN
X-Gm-Gg: Acq92OGaW4HQnZ/pa6TOw00we4rjvg6ydP5Sn3NI3NFv1VxynQwCnSh43ozqKf5N0h8
	2jVR89YfWQrUKUg3ViffEzZxL/soskYUse98ldWgAGMx7oOuZu9u5hbg8kWMLU69ibAUPAj/iXU
	X9LSS4vGKvs5Jv9hJX3uYyaD8wF3fu1N3J/hDzAVHTaJ9vMATZcQkbwnK22E92wXyPXVfc5EGVx
	0lQ7r59TxkmBkT7qGYM61HzB1jXqyolhrSqFCGNbzFPc8/swnHs97GztkYcsRBia/qAIAuA9ab/
	i5HZuxdbG5ji2v01hg==
X-Received: by 2002:a05:6a00:1888:b0:838:20b7:40ed with SMTP id
 d2e1a72fcca58-8415f6141a7mr29664848b3a.42.1779981234399; Thu, 28 May 2026
 08:13:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202605280441.YSawqHBc-lkp@intel.com>
In-Reply-To: <202605280441.YSawqHBc-lkp@intel.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 28 May 2026 11:13:41 -0400
X-Gm-Features: AVHnY4JyLcHMYBzw4uwDifZ6-3gkVNrPiSY-64S1IqdO0LgnLH-fdcS4TkOKQhM
Message-ID: <CAHC9VhRtOFUQXUUg7E=WMpAwzVYaR1NeuSF+40ZnkWUguZ2dVg@mail.gmail.com>
Subject: Re: [linux-next:master 8419/8766] kernel/auditfilter.c:592:60: error:
 too many arguments provided to function-like macro invocation
To: kernel test robot <lkp@intel.com>
Cc: Ricardo Robaina <rrobaina@redhat.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 4:27=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   e7d700e14934e68f86338c5610cf2ae76798b663
> commit: 84470b80b7b0ded9a6b071a211a028fe5fec7e44 [8419/8766] audit: fix r=
ecursive locking deadlock in audit_dupe_exe()
> config: arm-randconfig-003-20260528 (https://download.01.org/0day-ci/arch=
ive/20260528/202605280441.YSawqHBc-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 8=
53d532794be83adc97d51c9ff8c9095ce32631b)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260528/202605280441.YSawqHBc-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605280441.YSawqHBc-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> kernel/auditfilter.c:592:60: error: too many arguments provided to fun=
ction-like macro invocation
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                                               =
                  ^
>    kernel/audit.h:327:9: note: macro 'audit_alloc_mark' defined here
>      327 | #define audit_alloc_mark(k, p, l) (ERR_PTR(-EINVAL))
>          |         ^
> >> kernel/auditfilter.c:592:17: error: use of undeclared identifier 'audi=
t_alloc_mark'; did you mean 'audit_alloc'?
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                      ^~~~~~~~~~~~~~~~
>          |                                      audit_alloc
>    include/linux/audit.h:604:19: note: 'audit_alloc' declared here
>      604 | static inline int audit_alloc(struct task_struct *task)
>          |                   ^
> >> kernel/auditfilter.c:592:15: error: incompatible pointer types assigni=
ng to 'struct audit_fsnotify_mark *' from 'int (struct task_struct *)' [-Wi=
ncompatible-pointer-types]
>      592 |                         audit_mark =3D audit_alloc_mark(&entry=
->rule, str, f_val, NULL);
>          |                                    ^ ~~~~~~~~~~~~~~~~
>    kernel/auditfilter.c:879:35: error: too many arguments provided to fun=
ction-like macro invocation
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                                                        ^
>    kernel/audit.h:333:9: note: macro 'audit_dupe_exe' defined here
>      333 | #define audit_dupe_exe(n, o) (-EINVAL)
>          |         ^
> >> kernel/auditfilter.c:879:10: error: use of undeclared identifier 'audi=
t_dupe_exe'; did you mean 'audit_dupe_rule'?
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                               ^~~~~~~~~~~~~~
>          |                               audit_dupe_rule
>    kernel/auditfilter.c:819:21: note: 'audit_dupe_rule' declared here
>      819 | struct audit_entry *audit_dupe_rule(struct audit_krule *old,
>          |                     ^
> >> kernel/auditfilter.c:879:8: error: incompatible pointer to integer con=
version assigning to 'int' from 'struct audit_entry *(struct audit_krule *,=
 struct audit_watch_ctx *)' [-Wint-conversion]
>      879 |                         err =3D audit_dupe_exe(new, old, ctx);
>          |                             ^ ~~~~~~~~~~~~~~
>    6 errors generated.

This should be fixed in the current audit tree.

--=20
paul-moore.com
