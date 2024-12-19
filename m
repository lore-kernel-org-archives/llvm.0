Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7219581727
	for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734624159; cv=none; b=q7TUOXt0I/WbvPYsa3LQ4BxJWDrXmtQCrAN20KFtjKzTY6lcj/N7faAgT4Bh+YQhCeYeIYR+H/WmI88oMofSJmhzddxpDHHDZZxzwHNNDy+l0HkA+NE1DDkk+DCm9bEh93wdUVpMAFpg24ZrzooNHjM7TQGQe7P9Nmw6nE+xnBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734624159; c=relaxed/simple;
	bh=mP7E2b7q/836oHj5vJxaxKTUUt6joVbMS7hjtvjNdR4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uF5lkneoVRAXaL9goD282oudbE/VZ9FRryreMgPDVPO0Usf+9WbY41n5dPehIW2xTCeW+j5YHw1H3/f2++2D6AmzK3Z7EWn1e9k2ttmIoZVp4YM6RU6F0/MWt9IOfzxkivs5mfvfimFmcgBtH5OkWfuVifeJd9nXAi9caeo+35U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZizpMsR; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZizpMsR"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-303548a933aso7725041fa.3
        for <llvm@lists.linux.dev>; Thu, 19 Dec 2024 08:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734624155; x=1735228955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCc+bIRFJ7uKHEzOqjmhR8oFW6S9US5llU5iPyKV0QE=;
        b=PZizpMsRe0RBM/LFNyU6hcpNIGpMmXqaKtR5nqcqWJpLru46HSbu8nfoxHiIvAvsQg
         JNEzBKMq57So3QlEhuscgwBjSeU2AA4FOK2FdIoQrXVyacWdM8LG52GmxGYyo2UAM4e3
         hXEFiMYg8dwiKgEuKa5hE8eswRa61CY4KIDq9KWA3jMWoL48qoDS9k8799K8fLwGXhYt
         PZEA0A8mHNVwcmF5PTVsmHBPXqD6Wz3NT2+Z4BNdapCBBjUIwHeEvD+bUBYyHQT1IIYW
         v34+J/gudDE67TVSOqpHT5kfZC5qDv3A0a54qt+Lu4hVbdZSi2emNA8IBcOarJ7l1bU0
         4vCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734624155; x=1735228955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pCc+bIRFJ7uKHEzOqjmhR8oFW6S9US5llU5iPyKV0QE=;
        b=RfcplcQUJaXUyGBtHoLzFhMhAFEfybh6LEbNS3cjfvbDPck+C6tooUCDVoC8M9FPAz
         kLRottlAFEGK1Tw9ll5x/p2jlL+LIJ4hqJIkQNUDZ1gtRrsa+tz61jYl6PhMWSJQwNsO
         0LXWPe4gEXqKQvrmlKFEVtAl4ns3EOvm7uEfB0XDb+WyyIF5zTaumEeZxJ7GocVS1mKQ
         krHOv+UAeOb/0icLrzG+vc7G2TLdNol9bQpb8LMSXMquHO/610sJbd68n0d9UHXFvnv6
         Bbbs6TiavwuW5mSWBIkplYoWsH6QtIMpj+oLKcHrcQL+HKYTP4qXyMOPzBMW+A44ECtT
         Ue2w==
X-Forwarded-Encrypted: i=1; AJvYcCWNrWo5dV/KN+1uFcMgsN3wShoDON0A1rpenPHukQJrlgQF8vBP9tMFhQSV8D9/+E/g/rXj@lists.linux.dev
X-Gm-Message-State: AOJu0YwTmyktFlrPuaGnE3tnjKWN3HUrK8Kl6L7Mx/K2609gnAdGOs5k
	DXFeGdlw33yxX/03K/D7Aytw5asBk5Jqas/pFpOxtgyfsTNIMsUDgMhCOCMZwN0vTVM3mhWTkMB
	nMJAm5zB4EdMkZNqe4pRC7mAn43I=
X-Gm-Gg: ASbGncvHpFmaLxR6owg8DYToix/y/UP37XB9B6puTapy7zN7SxJe/1W/L/D4lk73piB
	a9IWkHuU3OwZF1qheBYm/V6twTw/U4eHlvXQ4Bg==
X-Google-Smtp-Source: AGHT+IHKqt5V6dT52AhO5kHkjIWjpVTnFDAFOsd8VPDI+LiXlzauyjQ6OmV02ageYI+6Bmd/9PmRcoEwHblm3Xyi6cM=
X-Received: by 2002:a05:651c:50f:b0:300:3a15:8f19 with SMTP id
 38308e7fff4ca-3044db51d52mr32106251fa.32.1734624154888; Thu, 19 Dec 2024
 08:02:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241219121828.2120780-1-gal@nvidia.com> <CAFULd4YHFFKBzaF28f8n3z8WcOzom1WUe_hfRBx0ehhCpT9xnQ@mail.gmail.com>
In-Reply-To: <CAFULd4YHFFKBzaF28f8n3z8WcOzom1WUe_hfRBx0ehhCpT9xnQ@mail.gmail.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 19 Dec 2024 17:02:23 +0100
Message-ID: <CAFULd4Z0PSzwvsFx_5deMKb7tV34uJWcHEadYGdk+D72QuHonA@mail.gmail.com>
Subject: Re: [PATCH] percpu: Remove intermediate variable in PERCPU_PTR()
To: Gal Pressman <gal@nvidia.com>
Cc: Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2024 at 1:30=E2=80=AFPM Uros Bizjak <ubizjak@gmail.com> wro=
te:
>
> On Thu, Dec 19, 2024 at 1:18=E2=80=AFPM Gal Pressman <gal@nvidia.com> wro=
te:
> >
> > The intermediate variable in the PERCPU_PTR() macro results in a kernel
> > panic on boot [1] due to a compiler bug seen when compiling the kernel
> > (+ KASAN) with gcc 11.3.1, but not when compiling with latest gcc
> > (v14.2)/clang(v18.1).
> >
> > To solve it, remove the intermediate variable (which is not needed) and
> > keep the casting that resolves the address space checks.
> >
> > [1]
> >   Oops: general protection fault, probably for non-canonical address 0x=
dffffc0000000003: 0000 [#1] SMP KASAN
> >   KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f=
]
> >   CPU: 0 UID: 0 PID: 547 Comm: iptables Not tainted 6.13.0-rc1_external=
_tested-master #1
> >   Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.13.0-0=
-gf21b5a4aeb02-prebuilt.qemu.org 04/01/2014
> >   RIP: 0010:nf_ct_netns_do_get+0x139/0x540
> >   Code: 03 00 00 48 81 c4 88 00 00 00 5b 5d 41 5c 41 5d 41 5e 41 5f c3 =
4d 8d 75 08 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 04 0=
2 84 c0 74 08 3c 03 0f 8e 27 03 00 00 41 8b 45 08 83 c0
> >   RSP: 0018:ffff888116df75e8 EFLAGS: 00010207
> >   RAX: dffffc0000000000 RBX: 1ffff11022dbeebe RCX: ffffffff839a2382
> >   RDX: 0000000000000003 RSI: 0000000000000008 RDI: ffff88842ec46d10
> >   RBP: 0000000000000002 R08: 0000000000000000 R09: fffffbfff0b0860c
> >   R10: ffff888116df75e8 R11: 0000000000000001 R12: ffffffff879d6a80
> >   R13: 0000000000000016 R14: 000000000000001e R15: ffff888116df7908
> >   FS:  00007fba01646740(0000) GS:ffff88842ec00000(0000) knlGS:000000000=
0000000
> >   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >   CR2: 000055bd901800d8 CR3: 00000001205f0003 CR4: 0000000000172eb0
> >   Call Trace:
> >    <TASK>
> >    ? die_addr+0x3d/0xa0
> >    ? exc_general_protection+0x144/0x220
> >    ? asm_exc_general_protection+0x22/0x30
> >    ? __mutex_lock+0x2c2/0x1d70
> >    ? nf_ct_netns_do_get+0x139/0x540
> >    ? nf_ct_netns_do_get+0xb5/0x540
> >    ? net_generic+0x1f0/0x1f0
> >    ? __create_object+0x5e/0x80
> >    xt_check_target+0x1f0/0x930
> >    ? textify_hooks.constprop.0+0x110/0x110
> >    ? pcpu_alloc_noprof+0x7cd/0xcf0
> >    ? xt_find_target+0x148/0x1e0
> >    find_check_entry.constprop.0+0x6c0/0x920
> >    ? get_info+0x380/0x380
> >    ? __virt_addr_valid+0x1df/0x3b0
> >    ? kasan_quarantine_put+0xe3/0x200
> >    ? kfree+0x13e/0x3d0
> >    ? translate_table+0xaf5/0x1750
> >    translate_table+0xbd8/0x1750
> >    ? ipt_unregister_table_exit+0x30/0x30
> >    ? __might_fault+0xbb/0x170
> >    do_ipt_set_ctl+0x408/0x1340
> >    ? nf_sockopt_find.constprop.0+0x17b/0x1f0
> >    ? lock_downgrade+0x680/0x680
> >    ? lockdep_hardirqs_on_prepare+0x284/0x400
> >    ? ipt_register_table+0x440/0x440
> >    ? bit_wait_timeout+0x160/0x160
> >    nf_setsockopt+0x6f/0xd0
> >    raw_setsockopt+0x7e/0x200
> >    ? raw_bind+0x590/0x590
> >    ? do_user_addr_fault+0x812/0xd20
> >    do_sock_setsockopt+0x1e2/0x3f0
> >    ? move_addr_to_user+0x90/0x90
> >    ? lock_downgrade+0x680/0x680
> >    __sys_setsockopt+0x9e/0x100
> >    __x64_sys_setsockopt+0xb9/0x150
> >    ? do_syscall_64+0x33/0x140
> >    do_syscall_64+0x6d/0x140
> >    entry_SYSCALL_64_after_hwframe+0x4b/0x53
> >   RIP: 0033:0x7fba015134ce
> >   Code: 0f 1f 40 00 48 8b 15 59 69 0e 00 f7 d8 64 89 02 48 c7 c0 ff ff =
ff ff eb b1 0f 1f 00 f3 0f 1e fa 49 89 ca b8 36 00 00 00 0f 05 <48> 3d 00 f=
0 ff ff 77 0a c3 66 0f 1f 84 00 00 00 00 00 48 8b 15 21
> >   RSP: 002b:00007ffd9de6f388 EFLAGS: 00000246 ORIG_RAX: 000000000000003=
6
> >   RAX: ffffffffffffffda RBX: 000055bd9017f490 RCX: 00007fba015134ce
> >   RDX: 0000000000000040 RSI: 0000000000000000 RDI: 0000000000000004
> >   RBP: 0000000000000500 R08: 0000000000000560 R09: 0000000000000052
> >   R10: 000055bd901800e0 R11: 0000000000000246 R12: 000055bd90180140
> >   R13: 000055bd901800e0 R14: 000055bd9017f498 R15: 000055bd9017ff10
> >    </TASK>
> >   Modules linked in: xt_MASQUERADE nf_conntrack_netlink nfnetlink xt_ad=
drtype iptable_nat nf_nat br_netfilter rpcsec_gss_krb5 auth_rpcgss oid_regi=
stry overlay zram zsmalloc mlx4_ib mlx4_en mlx4_core rpcrdma rdma_ucm ib_uv=
erbs ib_iser libiscsi scsi_transport_iscsi fuse ib_umad rdma_cm ib_ipoib iw=
_cm ib_cm ib_core
> >   ---[ end trace 0000000000000000 ]---
> >
> > Fixes: dabddd687c9e ("percpu: cast percpu pointer in PERCPU_PTR() via u=
nsigned long")
> > Closes: https://lore.kernel.org/all/7590f546-4021-4602-9252-0d525de35b5=
2@nvidia.com
> > Cc: Uros Bizjak <ubizjak@gmail.com>
> > Signed-off-by: Gal Pressman <gal@nvidia.com>
>
> Reviewed-by: Uros Bizjak <ubizjak@gmail.com>
>
> > ---
> >  include/linux/percpu-defs.h | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
> > index 35842d1e3879..573adb643d90 100644
> > --- a/include/linux/percpu-defs.h
> > +++ b/include/linux/percpu-defs.h
> > @@ -222,8 +222,7 @@ do {                                               =
                         \
> >
> >  #define PERCPU_PTR(__p)                                               =
         \
> >  ({                                                                    =
 \
> > -       unsigned long __pcpu_ptr =3D (__force unsigned long)(__p);     =
   \
> > -       (typeof(*(__p)) __force __kernel *)(__pcpu_ptr);               =
 \
> > +       (typeof(*(__p)) __force __kernel *)((__force unsigned long)(__p=
)); \
> >  })

Actually, you can simplify the above a bit by writing it as:

#define PERCPU_PTR(__p)                            \
    ((typeof(*(__p)) __force __kernel *)(__force unsigned long)(__p)) \

Uros.
