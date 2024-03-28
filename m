Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009C054BCB
	for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 14:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711636698; cv=none; b=iNwiBC8sz9gUvlJjE4eL8vX9SJJuhbA1Cadh4fpRshf2X1a7TZx2DybADV8eQJhE4eNl2g/+qVYZiAt1Xil7STOyTFpsbN0axTMR92fMZgo6VyVuW6m8OaCewCSa6XTsSes2L0Txa2+QUlKp3Eu4zUTgXNA7EJ8Dad2l/suMfqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711636698; c=relaxed/simple;
	bh=Je2UAtEY68if5uMZucjTLmJZ569unNwJAEX8q4vFPRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SfkV2MQ6IpYAPHMO3+COFNLw4Rmv3e8IFXVtGYOwpGHp/5M8rv+O2DhzANkEvtnQNCbdaz81UTUHmwGK9hruh/cQcvICbpmV4ixXuj7QMa9IqKYqP70jQNbN/vZQty9TxezxWBsgoLP+poCequWehcXwCTn02Nsvin6NLx/yPWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nGHC4ODB; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nGHC4ODB"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56c2cfdd728so11818a12.1
        for <llvm@lists.linux.dev>; Thu, 28 Mar 2024 07:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711636695; x=1712241495; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBDqCwUo0BszO/p4vM05OTn+yRfN49/fU9/chw4uLSk=;
        b=nGHC4ODBSKjkM6snQs+er/S7GVTja1fnpc2BwIpp4BvvN9CTaqbi1mYFanTC0PJgTN
         jxN+R8vbKc48wVpdfUiyLuUCB+0BKvavuzvL2S2vRo5q8tW+FGVZd6vgyuXfMYtfqSHx
         gLO9uw2HlY2Xp1PjfHcpBA8py/EtVZJZerUP9pFbm9mwazi/5s8S2+5VqmhGwW6i7Rwa
         13DrOhXYskl0LUVvdX+9/NoErgluxE3KhzGGienYFfwg3/ULjCnecu9E5qnTg3MWo+cT
         xlSG8aItibylrvTR4Fh9SRNdiZBpgFPV8lGSQHp6bZHEp2O/MGnzRvtfjMT5/7wAEt0G
         dJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711636695; x=1712241495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mBDqCwUo0BszO/p4vM05OTn+yRfN49/fU9/chw4uLSk=;
        b=LDC2TCh59rQ2KNZEMzdRcPmn7OR5TwHshjybpDwJ0HtrdYsHD+xzzM+oZxY4RrvzL4
         ++8Yx8nMAkv0ix9gzhQWI68+fdRzDwGE5bQdOalyXyLzOO5Vt8rv7UU5nDx117cguwlA
         iTgg0hd2k9rQKI9CWKohvXbeOs23/1YpCaqK0YAkphOK/wepJxGR+XYIXW4ahWzOb05X
         Hp+nQazxTIzDGLJ1izeXZjRR1TKNZg1QOSljndbm9qwRtzrkHbE3t9A0VFU3fc8GmtuB
         GJKHH3A8YZ56ML5Hklw6cehkxrxsEPJfOqyxI+5foTgyTzdMcrL+oRwcZ6MmGWPbucqI
         WR2w==
X-Forwarded-Encrypted: i=1; AJvYcCWnKcDyrDC13FnRjmfuRpV6S8qo2gb/HOd4/KciSuik2PK1M3smWtOuNo8fCw63KagCYGkgjJghAlW0uIMmp6384hAKnA==
X-Gm-Message-State: AOJu0Yy5Zmhexy6GxuCNEBlKSe9n8BXcKy0wNng5Fy62a9byl6Jflksc
	7cJrz+wOuYrYLmPt1doDV9KbVDnIAl221HPnMICB9Wyv7fU6XRxyulFNsd8diEtkMPElCkZnwnv
	Jfsy4mr0ejssK1t3FqOXkc9f1zlSc3KcDAyvm
X-Google-Smtp-Source: AGHT+IFpCb+hAEMXqJRx+znyNHc29XT0UrNVUxB6VWgzCxHc/S/gsBG3CXhdt+RzMQsIPrDbBmYFcfOf8JEENWeNtM0=
X-Received: by 2002:a50:bb21:0:b0:56c:18df:f9e1 with SMTP id
 y30-20020a50bb21000000b0056c18dff9e1mr142319ede.5.1711636695048; Thu, 28 Mar
 2024 07:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240328143051.1069575-1-arnd@kernel.org> <20240328143051.1069575-6-arnd@kernel.org>
In-Reply-To: <20240328143051.1069575-6-arnd@kernel.org>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 28 Mar 2024 15:38:03 +0100
Message-ID: <CANn89i+3FuKc1RsYaciNe3uQMZuJBjSmvC_ueuQ=NaFVzEnyuA@mail.gmail.com>
Subject: Re: [PATCH 5/9] ipv4: tcp_output: avoid warning about NET_ADD_STATS
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Dmitry Safonov <0x7f454c46@gmail.com>, 
	Neal Cardwell <ncardwell@google.com>, "mfreemon@cloudflare.com" <mfreemon@cloudflare.com>, 
	Yan Zhai <yan@cloudflare.com>, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 3:31=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Clang warns about a range check in percpu_add_op() being impossible
> to hit for an u8 variable:
>
> net/ipv4/tcp_output.c:188:3: error: result of comparison of constant -1 w=
ith expression of type 'u8' (aka 'unsigned char') is always false [-Werror,=
-Wtautological-constant-out-of-range-compare]
>                 NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
>                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/net/ip.h:291:41: note: expanded from macro 'NET_ADD_STATS'
>  #define NET_ADD_STATS(net, field, adnd) SNMP_ADD_STATS((net)->mib.net_st=
atistics, field, adnd)
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~
> include/net/snmp.h:143:4: note: expanded from macro 'SNMP_ADD_STATS'
>                         this_cpu_add(mib->mibs[field], addend)
>                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> include/linux/percpu-defs.h:509:33: note: expanded from macro 'this_cpu_a=
dd'
>  #define this_cpu_add(pcp, val)          __pcpu_size_call(this_cpu_add_, =
pcp, val)
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
> note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=3D=
0 to see all)
> <scratch space>:187:1: note: expanded from here
> this_cpu_add_8
> ^
> arch/x86/include/asm/percpu.h:326:35: note: expanded from macro 'this_cpu=
_add_8'
>  #define this_cpu_add_8(pcp, val)                percpu_add_op(8, volatil=
e, (pcp), val)
>                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~
> arch/x86/include/asm/percpu.h:127:31: note: expanded from macro 'percpu_a=
dd_op'
>                               ((val) =3D=3D 1 || (val) =3D=3D -1)) ?     =
       \
>                                              ~~~~~ ^  ~~
>

This seems like a bug in the macro or the compiler, because val is not
a constant ?

__builtin_constant_p(val) should return false ???

+#define percpu_add_op(size, qual, var, val)                            \
+do {                                                                   \
+       const int pao_ID__ =3D (__builtin_constant_p(val) &&              \
+                             ((val) =3D=3D 1 || (val) =3D=3D -1)) ?       =
     \
+                               (int)(val) : 0;                         \
+       if (0) {                                                        \
+               typeof(var) pao_tmp__;                                  \
+               pao_tmp__ =3D (val);                                      \
+               (void)pao_tmp__;                                        \
+       }                                                               \
+       if (pao_ID__ =3D=3D 1)                                             =
 \
+               percpu_unary_op(size, qual, "inc", var);                \
+       else if (pao_ID__ =3D=3D -1)                                       =
 \
+               percpu_unary_op(size, qual, "dec", var);                \
+       else                                                            \
+               percpu_to_op(size, qual, "add", var, val);              \
+} while (0)
+



> Avoid this warning with a cast to a signed 'int'.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  net/ipv4/tcp_output.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index e3167ad96567..dbe54fceee08 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -183,7 +183,7 @@ static inline void tcp_event_ack_sent(struct sock *sk=
, u32 rcv_nxt)
>
>         if (unlikely(tp->compressed_ack)) {
>                 NET_ADD_STATS(sock_net(sk), LINUX_MIB_TCPACKCOMPRESSED,
> -                             tp->compressed_ack);
> +                             (int)tp->compressed_ack);
>                 tp->compressed_ack =3D 0;
>                 if (hrtimer_try_to_cancel(&tp->compressed_ack_timer) =3D=
=3D 1)
>                         __sock_put(sk);
> --
> 2.39.2
>
