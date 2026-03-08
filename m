Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C071AA7A6
	for <llvm@lists.linux.dev>; Sun,  8 Mar 2026 03:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772939328; cv=pass; b=QsVCI7BYrgaHaCVaQrqNwcWAU9ZeWBSAHZC0vB+UXXnnZgcJmMFcY+PSi/4T1Fnck4x22m3OqfKc8cYIlM29I8gvMqUnMaA8AQBB06TOnie7ciPovhyM7LL40suFiHpVLmk+PvfqRqJU6RY0Kc53VtRBf99D69Gw60XNwP29568=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772939328; c=relaxed/simple;
	bh=urYB0CUwxtHfVVQokjPh2rco2JxICNlUyjAd+lTINpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pu3SA2/jsgLmNMrtuT5zKkYxL4qpOmoAC1titauJ9usmuAFbPhlY1wVhV6xUhagi30iei2fEOMZOMH9JRTTXumLpUjQqR8cLfCX5NwM4+rd9O06THvoKPkcIjXKFlnvLdhlzZrvRUh65uOs/vk742K1ZOTdi97Dgb/pGko/WL6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fSdfNfA3; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fSdfNfA3"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-126ea4e9694so4047169c88.1
        for <llvm@lists.linux.dev>; Sat, 07 Mar 2026 19:08:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772939326; cv=none;
        d=google.com; s=arc-20240605;
        b=Ay1Nf9ghfopso2wXoUDaAyzP1zqQ1s7AoJR7+Aw+ET89M7vgEvHclRy88LoOBHgoeB
         KVMjsVAFtVtbNlPlJ//s1vT8e43PZPxfhBtK3rUSVhfInqWJ5YdXMsBy7VTSIBEfWr01
         EjVa7KVR36Aor1AqlNHdypEVwxkc3hyJ4ewjV6I2GdYiC1j9uBsJcUa/eKlooqS5v4+Z
         tpTbta8ldJXENuDfuEAEH8X6qwgrT7Bi2rg6uZiO6bJnI6ryPeDEeB6p0RDNMOblOezJ
         LnlNLZuB8eycYUIoKQ5YfcHIqsO11goPqz6bsJ9yFuuG/v5dFxYnefW4GtsB+L8aDlWJ
         Nkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vL+kYgBcVaHGMpKP/KOcO6tTjJs1gho5KzlvMYmWcNg=;
        fh=ZwfL2I9HiMoE+etZ80kR4zXoc5nuG/WNzVnEQRTT3Ks=;
        b=AV7c9DK601YJEcTsDmFNb5s68I0FI8syx+6IrcnlzV+mQ+slqaEQszz+K3Men+jEPv
         YQDQUt3/6pKInrSCfiou7xotoYCOYnNQUEATjjXooS5UyrvqD/OO/DVQye5/QhRauD7P
         4WY8FZnRrPFA5C2eVgZdMW0BAsDuKJJnUSwER+WH86Q/oMEX1vav86imtY0ZNjg4bnB3
         FJjTJ4qJPMMl8C/WnhKc9MlB8Xza8tZtucmaYASBHAF0fijNkR7OWD52tZ0ABOXhrPga
         msLfQIBqPlBVqKw0Iq2Ovyg/d07ghnQuD1m0fpHShqKWFwb/2fagrm4tq2zJCItn/93S
         847A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772939326; x=1773544126; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vL+kYgBcVaHGMpKP/KOcO6tTjJs1gho5KzlvMYmWcNg=;
        b=fSdfNfA3g9LsyLlgekLr1BTF9vPoczZfqCvxKrqS6PzCXcO0Vv4K2VEC9/GqasofZn
         K61drjb3JeJ6wWS2eN5B2efXkRn/Ck+gUVr2doDgHBILyGpz4j6sH9XVjhlOguGXXBYq
         1+bipYIyrgv3K5KKuTD2RxeBLwAqgwEm7uBPvQ0XoEnl+pH6R+PH2KYVMhk1XsUIcyB0
         zfa3xxK8YIt+5Wec3cMS/oAPm9OjqmhA8CpUZLiJxUjc93Tx+zflBNw5BKcTGMPGf3EF
         xQqzRq0lbF3FxiX4zrjmumHmv/eLS81+OpLP0fr3spQci99SCFZoJlDqn3V6pZG0Hxhp
         gw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772939326; x=1773544126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vL+kYgBcVaHGMpKP/KOcO6tTjJs1gho5KzlvMYmWcNg=;
        b=P4Gqe69gPNDzqvz7dgDRkGxyYpFb6nEeXjZgDjd7wQ0S7RbzB8vO8FcFiEGIozI7No
         4rfs/GI5iOLuXmbF2z+Ww512iPM2jpqA6CGz/t+h1b2uqjBXk8+gaV3mXLbBN9CGOLZV
         j06760OROb856iLnvVIHM6kBrwjzuFgQS2iNgRFcde4TSgRxsADW9BB6GXIfRtJyUq0O
         BFRGMVX3Vr3pvDJyzpg6hf2UZJYCs0Hsin/hMCAYfucEWGsxKAg8a/d8UcNdIZwEO+mb
         n40CAMHm3ukmsYDkpfsavDvO3ZnXiMRwiNdphvYWvlAC3GvOysOMEbLKVQV91pjKwV1n
         hXOQ==
X-Forwarded-Encrypted: i=1; AJvYcCULClw6I7DHK/Fu6hfZtMQPKGtb2gg3JH25d3acQ5QBG8JfWgzgkTGDzAzHoQBgjthxDEf2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3tw0idmNNiUCG9gs/ug1Hnx/ZCaTajPwjcGxXDSc5Kshj+Lth
	bbhDoXgdAEc3vqSghVOtkn9yR0EYuOrvhoXL+qW+xmlTlUmfFKmoKWslBidt6Lhn+tGc2RktLo6
	2VPCT8ndVuVbwj6u/7d/qov86YwvG6bvDrV9GEMIM
X-Gm-Gg: ATEYQzzpcI0uDQh6f96z7+H4hXsQ6Xu2PNnqWRv938Ot57Xss/bDRxJHS6JO6m+rTo+
	sB4CSS8416KHg+DWKDgWXYjicimpWQlbCzO/ZDzDrpvcM1duwCHMoRMtUZLc0/w7jJwoYxSgkpi
	ENtnct2vNhOarc/aPFz28dX7icKC5t3A84l8QchLKuFbIjAV9ERrS3PCyOhnwr9EPC//qB21HxS
	go07T9oi/s6ErXQEFCD4o3J/tIQVOm2N7kItA3MDa4Bes/89NJxZJ2SykRS90rXBpzQwHFkMlb+
	sZkVs3dPEVNrNhyF+njhXyomvvlRd/vFMbko6V/iT/WBqubAhuJ9tr5i/x6+DW4vOJ1HjDFq
X-Received: by 2002:a05:7022:117:b0:123:3407:1066 with SMTP id
 a92af1059eb24-128c2e8f192mr3059142c88.43.1772939325636; Sat, 07 Mar 2026
 19:08:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260307024709.718395-3-kuniyu@google.com> <202603072124.nNhJgNnw-lkp@intel.com>
In-Reply-To: <202603072124.nNhJgNnw-lkp@intel.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 7 Mar 2026 19:08:34 -0800
X-Gm-Features: AaiRm530dp8zNSZFQaweLHDEXy6u7qeD2gjLWLlfefoma-wEY34m8E-f-DzfMgs
Message-ID: <CAAVpQUCFHWPYown66QVTaNDeVWERg0a99gcc3WBQeikXdUy1=w@mail.gmail.com>
Subject: Re: [PATCH v1 net 2/2] ipv6: Don't remove permanent routes with
 exceptions from tb6_gc_hlist.
To: kernel test robot <lkp@intel.com>
Cc: David Ahern <dsahern@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Kui-Feng Lee <thinker.li@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 5:38=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> Hi Kuniyuki,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on net/main]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/=
ipv6-Remove-permanent-routes-from-tb6_gc_hlist-when-all-exceptions-expire/2=
0260307-104803
> base:   net/main
> patch link:    https://lore.kernel.org/r/20260307024709.718395-3-kuniyu%4=
0google.com
> patch subject: [PATCH v1 net 2/2] ipv6: Don't remove permanent routes wit=
h exceptions from tb6_gc_hlist.
> config: powerpc-currituck_defconfig (https://download.01.org/0day-ci/arch=
ive/20260307/202603072124.nNhJgNnw-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c=
32caeec8158d634bb71ab8911a6031248b9fc47)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260307/202603072124.nNhJgNnw-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202603072124.nNhJgNnw-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    In file included from net/core/sock.c:133:
>    In file included from include/net/xfrm.h:26:
> >> include/net/ip6_fib.h:557:35: error: no member named 'ipv6' in 'struct=
 net'
>      557 |         gc_args.timeout =3D READ_ONCE(net->ipv6.sysctl.ip6_rt_=
gc_interval),
>          |                                     ~~~  ^

Oops, I missed ip6_fib.h is included from many places.
I'll guard the GC functions with ifdef CONFIG_IPV6.
