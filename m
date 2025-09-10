Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67FD25A320
	for <llvm@lists.linux.dev>; Wed, 10 Sep 2025 16:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757521985; cv=none; b=qop04qLBOlPyAeFpBx9x/IhxysrcYKM+TMAZjJ33mJK5JPTJDOGTbDewm3l9n88VsMsbADlfgPcNld1Uw9C7yHRJhQHgcj4FC/4T49RdosBYdoH0HmOAKlxHzLBPVCQZyknNQ1hTti7Qff1DDp5p6rHq/12ri1/e35WJt1TyPyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757521985; c=relaxed/simple;
	bh=6QWP6copzj9cf5FPkW3R7sbrZtIvIyER6xtRBGhVG/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hAnNr+i8Yz/qyhc0TnIGB5iNeIM/4QzT9I1gfTwgcCtl4l5cP+Wp6hXaTSWrWkNdGf76aefG8AIlQBeNHChPXe8SHzsPC9Z+SoiWB21rw8nMrNvC/Sx3RnmnMYDOWoQDsPkUmrhA0PAzg0GgIxHwgNn8LeP7Moffrqvq4eJdwIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=asr7Awi0; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="asr7Awi0"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4cb3367d87so4785993a12.3
        for <llvm@lists.linux.dev>; Wed, 10 Sep 2025 09:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757521983; x=1758126783; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crg9ulSxnVedet7AE0tAYFjDi5iUeW7YmzwRm7NeGuA=;
        b=asr7Awi0D157UCjZ9/cMpv0JqFTRNX65Sz6rlmVM+e7BBjQq2VIP9+aBQQGaGVkEBT
         tFULgELpL7XJJnhn7QtNmb+FjnYSAywN6XnB20n/R9vL7irttIF3FsJlml8/hIIuNT9B
         aSxiy2eqh/pBFLIilM5pu2wgovYrGOeE0ooWl7bhG9MXTU/dhdK1GFkVTaepoP1jIjb9
         1fjDY39qVhvIeuktaEGcf6fyKrJ/iJ6DfhvpkUGYqPOpoS28dcrqq5puQL3fPP08RkI9
         rF3LiIxihg3IrdoFByaMMrJ31vEra3wkZKMEDC+EPP70vJPQ1/iPf1gL/LsIQkyvYJIE
         nOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757521983; x=1758126783;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crg9ulSxnVedet7AE0tAYFjDi5iUeW7YmzwRm7NeGuA=;
        b=Q+q6SzaMsfUKzAnH/LaUr1PrkdimqML6V2qBRHBJ+Pw7uHvVsddeeOhqmpxHN0ijy1
         T2JwbYBQQFBh7f1+OmUXmJqAI5wOHW1RbuDWNbKAz8DrBt444UA1270w+xYObeHyxO3h
         QC8Boq7dQPA80/b1GVEdQZzcGdtIuC82Lmd0jIpEmmZ9CxXh+BcRJm7rJ+A82TpTb1lQ
         0UppisuswWkNJqmrBTJOYWQvsPpmPxisQsdMFxNcI8MrEKT+qEh7uP59fLOh0Hii8Egb
         drPS9S5+m/eQA7I8C/42DifIJwkaRSLtc1I+Ad33OjivFRIr9VDwE/uD3IiLmDaq+3NI
         +jkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZVn74uNAvjU1LHaM0pV98tPwGF629jyX9TyRdxL4FInqkCltNbIJmMoMdYsGdzGiaI/h7@lists.linux.dev
X-Gm-Message-State: AOJu0YzOtpe9N/QFZlCspEh5wUO1YCRbhXfwG9JSquxSwA9skJ+86/q7
	/1/0SBKmCJQtOh08fuC+WoaiMYSx4dyaSpNlALuEo0QZ3mJMLaekR70BWOgs2mi4jLK352RCFGB
	3MhcS8YS0JHoXGWZNF/TBOT1XE9f+gSu1gouVvtGa
X-Gm-Gg: ASbGncvQf1E6mUH7txvEG1+3gjq36sMI0h019IvYNBNqGOiAw5VCHSZi3IWhIuJyFJN
	czU5WkuSQ7ogr3VxXiB51fKnHakF1Udaen8KRfNRVO6dBHVfYnJVH3f19FypzjSwDPlI2GcLoaZ
	7JKCDVgK2JIhCxccgCVDyeWQMZ+ec8IG1280fr8eRAzztCCfmx7XJtRB4tD9aqqTT6LbLME44it
	cFcHQmDeMJprgQgOkgd2LNeZYCOMvbZJ1mhTt3yjF2O/YE=
X-Google-Smtp-Source: AGHT+IFygkRcH7mrdQ4Zhgc7n2vieMLoI6r6NoPaSe1OOy5LbAIzXpvm7rozB2gTILsaRSM0LL+d/usqZ1C3z4HoNpo=
X-Received: by 2002:a17:902:f54a:b0:24b:25f:5f81 with SMTP id
 d9443c01a7336-2516dfcb5c4mr232806255ad.17.1757521982717; Wed, 10 Sep 2025
 09:33:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250909204632.3994767-4-kuniyu@google.com> <202509101912.ROjtP2uL-lkp@intel.com>
In-Reply-To: <202509101912.ROjtP2uL-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Wed, 10 Sep 2025 09:32:51 -0700
X-Gm-Features: Ac12FXx6aKnMeDmD-Oqq_oMACp8aNPwM23p9lZayrp8qexUb1gFrzTNdorO62hI
Message-ID: <CAAVpQUAXoxU4r1dgC3wtTxx6oVMpOWjd9q7Ub=SEsnHMpL3RAw@mail.gmail.com>
Subject: Re: [PATCH v7 bpf-next/net 3/6] net-memcg: Introduce
 net.core.memcg_exclusive sysctl.
To: kernel test robot <lkp@intel.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@linux.dev>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neal Cardwell <ncardwell@google.com>, Willem de Bruijn <willemb@google.com>, 
	Mina Almasry <almasrymina@google.com>, bpf@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 4:58=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/net]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
tcp-Save-lock_sock-for-memcg-in-inet_csk_accept/20250910-044928
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git =
net
> patch link:    https://lore.kernel.org/r/20250909204632.3994767-4-kuniyu%=
40google.com
> patch subject: [PATCH v7 bpf-next/net 3/6] net-memcg: Introduce net.core.=
memcg_exclusive sysctl.
> config: um-randconfig-001-20250910 (https://download.01.org/0day-ci/archi=
ve/20250910/202509101912.ROjtP2uL-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7=
fb1dc08d2f025aad5777bb779dfac1197e9ef87)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250910/202509101912.ROjtP2uL-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509101912.ROjtP2uL-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    /usr/bin/ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permis=
sions
>    /usr/bin/ld: mm/memcontrol.o: in function `mem_cgroup_sk_set':
> >> memcontrol.c:(.text+0xa1e0): undefined reference to `init_net'
>    clang: error: linker command failed with exit code 1 (use -v to see in=
vocation)

CONFIG_NET=3Dn... will fix it in v8.

diff --git a/mm/memcontrol.c b/mm/memcontrol.c
index 0d017c8b8a00..b7d405b57e23 100644
--- a/mm/memcontrol.c
+++ b/mm/memcontrol.c
@@ -5002,8 +5002,10 @@ static void mem_cgroup_sk_set(struct sock *sk,
struct mem_cgroup *memcg)

  sk->sk_memcg =3D memcg;

+#ifdef CONFIG_NET
  if (READ_ONCE(sock_net(sk)->core.sysctl_memcg_exclusive))
    mem_cgroup_sk_set_flags(sk, SK_MEMCG_EXCLUSIVE);
+#endif
 }

 void mem_cgroup_sk_alloc(struct sock *sk)
