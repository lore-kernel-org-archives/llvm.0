Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B363B18A
	for <llvm@lists.linux.dev>; Sat,  6 Jun 2026 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780779035; cv=pass; b=WCrhU4vk1ZzL7a0drB6/NS27p3397c/fGQjAEZWle5dzGnFQ38trz9muCLu63QN/0KNEqc9DXPgWkVXj2bL47ehj1U1/683QPkIeZ0nLGHtuDK0qdri7kkqVPUtU38jeFdyMHVV2RT+CtiA57vAbfVSIzAlyxSLchCJg0ic69xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780779035; c=relaxed/simple;
	bh=y4hoeiC3aiBjcHuCFz3vWzDpKS1x/IhmXPYHGGdYl5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0Z/27LHhraepgCzXF8Uvaw1aYaspKaCVnDcniPz6b450KWx2PawXZcYkkisKu1R6YOOKb9HUpuhR+DCipREGQla39uaSdjkaOp3lcfkqAn1M6Zm6vY/StQW4G8X6RX+xDMGHssmJ4/TZQVUD4sWKZ13L62R+cnPIEvXs9IiXqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RV+C9mLb; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RV+C9mLb"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-13817614cd3so1004928c88.0
        for <llvm@lists.linux.dev>; Sat, 06 Jun 2026 13:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780779033; cv=none;
        d=google.com; s=arc-20240605;
        b=ltyVjz6VlxxKiVHXEiQHxqip9rbZZn8ddBdD7FkE39OmlROhb14HLn/2BSL6h29jB4
         V9tx89Q4Ij/oH+BGFN08Py2VcJVdl82FMtvZUfdTHmC+qxqrEAEC30Gxam06ZBBhHypU
         /8D9vE/eBJaVrfMF7s2siGBBgqXMJlg2R4lJpSfB1B71gQDHdIe/IO6rxpQtAA910ZOM
         G+gbXfPuVB5Dh2xnkv9LKiTUfk50Ma//gVNpE8nuSiKghm+3kFmEQzvVGRUaugZegEIH
         VOhiBnS11Xg1d6mgjYJhy6HhNHP6i4wSUfA+RN+/TdOXMCWmwGVkjzU17rx9u+f0QTzf
         znoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l6KNI83Gkn2cNA7zkcJPFtGn/pTseYG2KRO5jfoDb9Q=;
        fh=fVmZni4YviyRNQ25jQCf/YZbczNZewpx2uRy3dE2a4E=;
        b=b90yNYhSYysTVanhWPClwHZXDo20ml8xYSZOA7IACnmoTjaIh0qgw+jX3gsi8YRqXW
         H1OAHIKHCqkBCNL+FG4qsBkB3HC6e9RkHCzFkwcx4aHX+1baR8zO9vdDnbaxjCzv28gG
         6i1xkpcBQcwuYjNa7lbwr7N4k+dqjpjfNmy5zSnrAl+OHqGBKStQiRAjoh/TLRKwqck6
         mLe84//SuC7sZNEAnuo4otdt7vTDJMPnRr0zMnNSia1bCTeZvOUzExhB98fj3KIfv7Ff
         hvhIhS+ffiLcKPJeGqwSYyOaromca8CbjfBuWZaosClBykMqYmSOWQEP5hbXkPdwb/r3
         1YYQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780779033; x=1781383833; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l6KNI83Gkn2cNA7zkcJPFtGn/pTseYG2KRO5jfoDb9Q=;
        b=RV+C9mLbpmQoKV9RW2MrjX3Vvb+kxdvzj8fc5HJw362kdOvERVgOsHOuDQzQqpej7T
         J93VRxs1m4VRxK5Iox5oayykNVWNuhzwN/ke6ZZ/zMYW9yGHKHWQBf+KDu73gVbE1mnU
         93N+Xgk474l7SHTbesyEisrik5QplyEHk2fIAtS2NJzt69UFa1Fdy0g5cpN4hcq4eqRX
         jE6yRjWKwPDeKdUcgeqWvvf/lyBXdTHxNxy2fif4RaHi7zwDldb4lhvcK42/9UmcPchE
         gpgWmXdBbg3UPutbIc9KuqXiJERS5F8WvnxuOPRtVZwHf+KGoONJrK8h72KyaE/GVkwe
         Ur1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780779033; x=1781383833;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l6KNI83Gkn2cNA7zkcJPFtGn/pTseYG2KRO5jfoDb9Q=;
        b=Ob/Kl1oP4edKFZNdbUrpgh4wflGsV3E6pIXPX897U3GXwWlG6LIS7ouIcwlcomH5dp
         b2LskGya9+eQWmoDFqSqixRLzUShnzj3D6sCacAONDJ8FIxNgYpX8f6Pm5KrWAMWlrtV
         I6kJtpXcfxy1sATb+Tf/HuOeR3X91/mWjuoYMaMB3zgro10DSpudoks4xNjwhAPBR4bA
         vKGYfMq8Z5b+dMC5GP8F9uyQ53R0zyTbiB6MdYH/MPXTczO+1rB7LgerboOYpTL+absa
         JZ36GKG0AmPYjnyhvLSW+lPAcr9yn97ocI1Zkz45jP8iecAOBZVcUtwvYjjpd4czWhyM
         kJSA==
X-Gm-Message-State: AOJu0Yw4MNsEOjp8LGwTGNUfVvYoKRLmM2j/NqMQESVL+ks+OeGLsyAN
	aq6ioh1/W3vPl+vofxxhe+3SSEHBByTCUli7MJoO9XMDTy+BulStQzAf2QDTnouskrow10AdYZN
	64wz2lmkNmrF+JL1mIDiG17IjpgfZmksFxa1Vmk8vvztBYjMBp9BBl7ahbyYnOg==
X-Gm-Gg: Acq92OGOKxatLT4ouSAf0P0Z3r4xacN/wX2ohzgJi294RLUQQl/DJR4y6xJBgEL3xy8
	gi1Fmc3zNYcPPl84ChUC0P93M5D+MtecHa2ti9LA82CXkgMAw1gzrTzQOPB46YgqgqLBHBSYYHj
	d4qklfqaQGJhfUs/zB+4LR9OJ/7bp3yxQPHhksTpMCZvFL7CTuy15QRrt92gTzaV8I9ouZO1uo9
	QaQoEeqWIyezcWCXjbW3HA/pxV83++objvDpbS4wqm/q5anjWZR1VZLoOdqY3yttf4nFqS9sWKa
	WhTPI8ORNBpx4HYb+hwbiy37Hncj5YvtqRJk4nzQ1g9PECAni8C+aKS9n5MqfKUm6yAkCnkLlTW
	d07uXYyKLiYQTQnUnviGDul3wNgRAlrv9DKBrun3G5lzWxoOj7Qr0uozu0aw4cdo=
X-Received: by 2002:a05:7022:1005:b0:134:df7f:910d with SMTP id
 a92af1059eb24-138066bad62mr5040556c88.7.1780779032244; Sat, 06 Jun 2026
 13:50:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202606070019.yx2LhZPU-lkp@intel.com>
In-Reply-To: <202606070019.yx2LhZPU-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 6 Jun 2026 13:50:21 -0700
X-Gm-Features: AVVi8CfwL0bUdm6wKFmYKk6rFVapxyQHb1MebnOiIlJS36ggr2MFTiRAuTgikxA
Message-ID: <CAAVpQUDU8Ej2Aa0kLLgU=r=gyESa43s5YAVQOqYehzxn-85adw@mail.gmail.com>
Subject: Re: [linux-next:master 10754/11755] drivers/net/geneve.c:778:12:
 error: no member named 'local_ip6' in 'struct udp_port_cfg'
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 9:05=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   6e845bcb78c95af935094040bd4edc3c2b6dd784
> commit: afabbb56a7262979a75259e2710019aa8ced3e8a [10754/11755] geneve: In=
troduce IFLA_GENEVE_LOCAL and IFLA_GENEVE_LOCAL6.
> config: hexagon-randconfig-001-20260606 (https://download.01.org/0day-ci/=
archive/20260607/202606070019.yx2LhZPU-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260607/202606070019.yx2LhZPU-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606070019.yx2LhZPU-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> drivers/net/geneve.c:778:12: error: no member named 'local_ip6' in 'st=
ruct udp_port_cfg'
>      778 |                 udp_conf.local_ip6 =3D info->key.u.ipv6.src;
>          |                 ~~~~~~~~ ^
>    1 error generated.

My bad, posted the fix.
https://lore.kernel.org/netdev/20260606204848.1987046-1-kuniyu@google.com/T=
/#u

Thanks
