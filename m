Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42678433C8
	for <llvm@lists.linux.dev>; Tue,  9 Apr 2024 05:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712639339; cv=none; b=ourwCg+bniFDtgt3OehxNnwXO3G5RD96qDbSge6jpvu9VaggBHr6BC66NulIxBlpIdnq3xS3k3kfm5GC2aVDtqe4QZRyaUkQYWymCJaqVMbP2I5rdEijqxIs9eRATZgSgagGE7o+ryCgEpJCdcPaRaCd1bk+XmgwV7MQEUJfaLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712639339; c=relaxed/simple;
	bh=dpumPbGeuszlGgZ/6QcYn1ZPkL3r/LCYuwQdgcIzQWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZMpa/IZvhHcVVx53Ip6MYmrWrSMoFgefFcaKCWcQDzxQqlXZ1eLM4oh086er7/DRwFijSBXGhZW6Gy3ob9M6nQQM1v3F1elpDQ/GwP8NJndY8Kn/MXzYaULeSv/ix59VZz3GySkEFjVrPBWLqIiQOeClQ1gm2Hs8TDjdy4vk/EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i1DdHUgo; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i1DdHUgo"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-36a2667fdaeso55845ab.0
        for <llvm@lists.linux.dev>; Mon, 08 Apr 2024 22:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712639337; x=1713244137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEL615D0PAohpi/ZueAVrRaSlrpex4n/Ywu5HFL+HUA=;
        b=i1DdHUgo5PVzMiNjTEc/Z2SzHKTnWakfiEcBZhWpLhj1TY0Ahu1FMZZpuc4rh6g0zS
         9oC8V+PAeeywD8y6e/1TKGQ1f3d1wCsS0XHXzUJmIuVmRaURcp9XUO/gYSBqGQbPx67Y
         aBA7YYcV6Ge2m+2G32EgmDQ04H8p/1b17yLwy6V5P3NWBpGPC8dyi71kDBZbxXgbxv0L
         fAzhZmRQ3SLVLUjFy7C0FLGCDfx9ZAliRIA8QmRH7UCRO2TUdNtrzKRBnYF1TlPvFfAR
         2G19Dtc7dbd3grJApuo1gfTS0rQICJhRiJhkmKN1c3bQ/LwsFMtXaeu4y8+su3Mv3wR9
         9gAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712639337; x=1713244137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEL615D0PAohpi/ZueAVrRaSlrpex4n/Ywu5HFL+HUA=;
        b=Cv8TEYWtW1Xn06E5UbPGPYxP1ctmlTHLborizy/HKnatJNqKKwXTNYPvdE+0+TTZ37
         7+GgnY7erh94sLDXn+JDhEFzLwf+2Pew8js3fWyl+EaPkZCoV+yTDXJJ2Ifhn3DId4Ip
         3J+2RficR/KlepGN9M2WtXNPTOwUrdRfB2P1K+f63uBeLBjg0tgnNQUcY7M6i1evyGh9
         213L6gwDhOWYKqhwKpe6iDMAEr0rGxwL255muSb05AASh+OCmmABjOjbXVRKeRyVAGRB
         c3Q6yriw7EtF8JqBbD+IuzM3zUey+OLKMU0x2m1OQek4iWSXRO44pNWWTWiCbuBzlggT
         5bRg==
X-Forwarded-Encrypted: i=1; AJvYcCU4yNoWSHs5n24q5OQOpt+sJz6XcVlCx0xFEshCM+Hb/RfclhWd/dd8FqZc5nzsutuYUuSxarJB5u/r8HAobViNFj3MZQ==
X-Gm-Message-State: AOJu0YzdR4mERFoyiSmuCzm+VYtVd3Izz941T5gtUE/XqrZ1NEleOvgB
	PiGlaAu2/flXjWBU3xKSVIFSrQKOuZepCti4mGnKlNfgVkSv7TF4zNnPUXm0aLDDWwDCKn2Jlzm
	5ih1GrypMoI931xf93EzlP1xs+0lIth8c3pSnHzXwFp+Zo/Bu/w==
X-Google-Smtp-Source: AGHT+IH7efisCsDzy68bbh6f3D2qyn7Zhr5zd6BXbQlYQ1t6gloGyZQkP7PdJR/HI8I6TtSndLyjiGhNNjGm2w1rVPE=
X-Received: by 2002:a05:6e02:1d86:b0:36a:1278:5c5 with SMTP id
 h6-20020a056e021d8600b0036a127805c5mr177596ila.26.1712639337111; Mon, 08 Apr
 2024 22:08:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202404082207.HCEdQhUO-lkp@intel.com> <20240408230632.5ml3amaztr5soyfs@skbuf>
In-Reply-To: <20240408230632.5ml3amaztr5soyfs@skbuf>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 9 Apr 2024 07:08:42 +0200
Message-ID: <CANn89iJ8EcqiF8YCPhDxcp5t79J1RLzTh6GHHgAxbTXbC+etRA@mail.gmail.com>
Subject: Re: [net-next:main 26/50] net/ipv4/tcp.c:4673:2: error: call to
 '__compiletime_assert_1030' declared with 'error' attribute: BUILD_BUG_ON
 failed: offsetof(struct tcp_sock, __cacheline_group_end__tcp_sock_write_txrx)
 - offsetofend(struct tcp_sock, __cacheline_group_begin__tcp_sock_...
To: Vladimir Oltean <olteanv@gmail.com>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 1:06=E2=80=AFAM Vladimir Oltean <olteanv@gmail.com> =
wrote:
>
> Hi Eric,
>
> On Mon, Apr 08, 2024 at 10:49:35PM +0800, kernel test robot wrote:
> > >> net/ipv4/tcp.c:4673:2: error: call to '__compiletime_assert_1030' de=
clared with 'error' attribute: BUILD_BUG_ON failed: offsetof(struct tcp_soc=
k, __cacheline_group_end__tcp_sock_write_txrx) - offsetofend(struct tcp_soc=
k, __cacheline_group_begin__tcp_sock_write_txrx) > 92
> > > 4673                CACHELINE_ASSERT_GROUP_SIZE(struct tcp_sock, tcp_=
sock_write_txrx, 92);
>
> I can confirm the same compile time assertion with an armv7 gcc 7.3.1 com=
piler.
> If I revert commit 86dad9aebd0d ("Revert "tcp: more struct tcp_sock adjus=
tments")
> it goes away.
>
> Before the change (actually with it reverted), I can see that the
> tcp_sock_write_txrx cacheline group begins at offset 1821 with a 3 byte
> hole, and ends at offset 1897 (it has 76 bytes).


...

> It gained 20 bytes in the change. Most notably, it gained a 4 byte hole
> between pred_flags and tcp_clock_cache.
>
> I haven't followed the development of these optimizations, and I tried a
> few trivial things, some of which didn't work, and some of which did.
> Of those that worked, the most notable one was letting the 2 u64 fields,
> tcp_clock_cache and tcp_mstamp, be the first members of the group, and
> moving the __be32 pred_flags right below them.
>
> Obviously my level of confidence in the fix is quite low, so it would be
> great if you could cast an expert eye onto this.

I am on it, do not worry, thanks !
