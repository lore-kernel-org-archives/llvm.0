Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18222CA8
	for <llvm@lists.linux.dev>; Sun, 18 May 2025 01:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747531847; cv=none; b=l0tpQ/jbxOa+iwag2XqHpCYg2r23NlKQ5izHTZsC0veYlC401hXJjTUyh39LuZDCAyHATX6qPgvwC+HiLAFgJu0GugGkVu1/LUxbt97TAw39BET6/biFJ4TeDCXvpAI0x6Fwe7FmYQQg3RKJS8NOeUcK25s562tmzEmt6rEXqj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747531847; c=relaxed/simple;
	bh=MmON3q5i6J4IArmTHUtVwfD2eTxirSwy3bB/aHW08Gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gk4EAbhHu3qbVgNOC0DfKa3nXM9xqTJaJbZRO5GgJJ1C+Cp8q0G2QqSFz/glCDMgin3TcHZJfXC/aRbWK8hY5O0rLw25u8mv3+8iWiDpceJPHNkIw27lTqhPcCyiSjphXvG3hmIPFYQ9PEaUoo3lfroIV9kFujZ1H7/UCD1EAEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnQbh2gg; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnQbh2gg"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-85e15dc8035so97200139f.0
        for <llvm@lists.linux.dev>; Sat, 17 May 2025 18:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747531845; x=1748136645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWe4uhrqQ6kYTV+uYSNoRxMT3RAe8ziimxoaSj21SIg=;
        b=jnQbh2ggHcBURcXR9qK7BHDTETWhUpWWK7jGBKtcXWhXB4Vaxvw7kTq+R4yOCHNWKs
         JhStt3e9AGWBbiuUUSEQOaUZ5C7VOtFj1AZmjnrF7lyV47Tu+X+7qn82Ej8LfF+uVt7W
         fzJ9S3z2etsJlGf7jq7/gSyKjwHPL9mbFEIMBKpiCjhBMh/TPI5+0aii34kKov38df6L
         XE/zpsbywMzLgs0Z+WH/UXpVNQ6/D5sjs0Fy6Ml58pOWoByvZNO7uQAkpdYxwM3KTvPy
         PxJKHe1KM29Fr+7QjPJnpizzSlXd4Qw7A2pj2mEaYzVsSKm4wDDdDhrM5swqbBgIvD6B
         KBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747531845; x=1748136645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWe4uhrqQ6kYTV+uYSNoRxMT3RAe8ziimxoaSj21SIg=;
        b=OqLVD7L55vRoP/P+yRtjlTRb9zdNU3VS3PPjt433C9WnGAO/X9ewbwrpZaRJUD0fnW
         LI9NdVFL+HKXfRyXt5U23dNBPNvSiBHdxC/a9J7hcQm2YmTKboYFmLIU0t92Mzjk1sq3
         O2mhdQnDKj4vLelH3jVWZ47Qr8FbhEKjACoZwjur2p6RWuFc8CsMTIJUU4Dnv4ZsPiSx
         fu18XifY2GGrjUVNB9fybAAIPWD8Dd2VlojP+HPevUXKXOUtZHr+fqRFIZVIQIdzeAjI
         gqL1v20Yhasn2HObezZ6sA31Ntm3FIqTYGhyJVud7mrsz+D7gRFAJ4ssBAZjGeyEAhhM
         gouw==
X-Forwarded-Encrypted: i=1; AJvYcCVKaHhv0auVgEdY+7XP/EAsR/k8SV3qGMq2yJmixp61QMVpl3VaftDH0Vu1ewghPc4bhGJf@lists.linux.dev
X-Gm-Message-State: AOJu0YxsxMtgw63CZl31skCQ6YQ2DdvA/djO8I0B+uCtciXQtDrPfMbH
	HF6x/ic3ZSk61Oty5etgda+61Eyx9W7P7RcFFr9GDjbQ5X8nkDuCMMzEnc0uO2NncTT1Pxr+A0I
	BSqKA6uPySmXkYUnlOP0TLWXu2eNxR5M=
X-Gm-Gg: ASbGncuWbp/mPMshlgryaMB4j1XUzVjbD4FBU47rkL9zQUJySYcuE+15EU7gTIb61Ya
	AA69+9aTiZEnnPTK3DirAoF2yXuvQcRGcsHxnFR5NfHFRH4DFttzSySBCMscMraxhAWYea64HrD
	zy+nSvcfUuylf1bW3hEqIaU5pfzCHmChKz
X-Google-Smtp-Source: AGHT+IF0AX8mqYNeSwGFaoY/T1VTx7e1a9qCdM4HH+LTc4XsEuTMgi9t54I95IeQ+E1OZjiYIg/TgWjB6VvVC6P0WFI=
X-Received: by 2002:a05:6602:3f0c:b0:86a:93c:a721 with SMTP id
 ca18e2360f4ac-86a24bbb754mr1018463339f.2.1747531844798; Sat, 17 May 2025
 18:30:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250513164807.51780-1-spasswolf@web.de> <87h61ojg3g.ffs@tglx>
 <7471a185adcc34a79c2ab8ce1e87ab922ae2232b.camel@web.de> <b644ff1714731cfb652d809d4864f0d178b24a97.camel@web.de>
 <2d8c1929bf5ab5260dacf9aa390456b3b49ce465.camel@sipsolutions.net>
 <2cad838b39f00d93319509d2a6a77a4c42c7fa92.camel@web.de> <a12c82c394e9676e32ede6b8312f821a16fef94b.camel@sipsolutions.net>
 <f8552d41fb7eae286803b78302390614179b33b0.camel@web.de> <8684a2b4bf367e2e2a97e2b52356ffe5436a8270.camel@sipsolutions.net>
 <ba97a2559cda1b14e0c9754523ff1152bdad90ef.camel@web.de> <63cc1dbf07bde2c9d14e1f86ce2c2ce26a2a9936.camel@web.de>
 <388bbc4c805ce029bbd08010fd30405494f998a9.camel@web.de> <15f3633cbd08b30475d5b76c5cc9180fbf17a12f.camel@web.de>
In-Reply-To: <15f3633cbd08b30475d5b76c5cc9180fbf17a12f.camel@web.de>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 18 May 2025 09:30:08 +0800
X-Gm-Features: AX0GCFv06TkGJgkKvaRslc77U1xmPTSHqh40F7JbBNWrPHJVJHUeMNiX2GPPk-Y
Message-ID: <CAL+tcoA3d-EdoGjei7aeyuA3zmj955uYkXf1wCAUy8iP3BxUjg@mail.gmail.com>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when compiled
 with clang
To: Bert Karwatzki <spasswolf@web.de>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bert,

Thanks for your report and analysis!

On Sun, May 18, 2025 at 3:49=E2=80=AFAM Bert Karwatzki <spasswolf@web.de> w=
rote:
>
> Am Samstag, dem 17.05.2025 um 13:34 +0200 schrieb Bert Karwatzki:
> > Am Freitag, dem 16.05.2025 um 20:19 +0200 schrieb Bert Karwatzki:
> > > I've added a debugging statement:
> > >
> > > diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> > > index 3bd5ee0995fe..853493eca4f5 100644
> > > --- a/net/mac80211/tx.c
> > > +++ b/net/mac80211/tx.c
> > > @@ -4586,7 +4586,11 @@ static noinline void ieee80211_8023_xmit_clang=
_debug_helper(struct sk_buff *skb,

What is the caller of it? It's the function that you customized?

> > >                                                             struct ie=
ee80211_local *local,
> > >                                                             struct ie=
ee80211_tx_info *info)
> > >  {
> > > -       if (unlikely(skb->sk && sock_flag(skb->sk, SOCK_WIFI_STATUS))=
) {
> > > +       if (unlikely(skb->sk && ((skb_shinfo(skb)->tx_flags & SKBTX_W=
IFI_STATUS) ||
> > > +                               sock_flag(skb->sk, SOCK_WIFI_STATUS))=
)) {
> > > +               if ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) ^=
 sock_flag(skb->sk, SOCK_WIFI_STATUS))
> > > +                       printk(KERN_INFO "%s: skb_shinfo(skb)->tx_fla=
gs & SKBTX_WIFI_STATUS =3D %u sock_flag(skb->sk,
> > > SOCK_WIFI_STATUS) =3D %u\n",
> > > +                                       __func__, (skb_shinfo(skb)->t=
x_flags & SKBTX_WIFI_STATUS), sock_flag(skb->sk,
> > > SOCK_WIFI_STATUS));
> > >                 info->status_data =3D ieee80211_store_ack_skb(local, =
skb,
> > >                                                             &info->fl=
ags, NULL);
> > >                 if (info->status_data)
> > >
> > > This gives the following logoutput (and a lockup), indicating that so=
ck_flag(skb->sk, SOCK_WIFI_STATUS) and
> > > (skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) are actually NOT equi=
valent (when compiled with clang and
> > > PREEMPT_RT=3Dy)

Moving skc_flags out of the union can solve the issue, right? Simple
modification looks like this:
diff --git a/include/net/sock.h b/include/net/sock.h
index 3e15d7105ad2..5810c7b80507 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -189,13 +189,13 @@ struct sock_common {

        atomic64_t              skc_cookie;

+       unsigned long   skc_flags;
        /* following fields are padding to force
         * offset(struct sock, sk_refcnt) =3D=3D 128 on 64bit arches
         * assuming IPV6 is enabled. We use this padding differently
         * for different kind of 'sockets'
         */
        union {
-               unsigned long   skc_flags;
                struct sock     *skc_listener; /* request_sock */
                struct inet_timewait_death_row *skc_tw_dr; /*
inet_timewait_sock */
        };

Can you give it a try?

> >
> > I've added more debugging output:
> >
> > diff --git a/include/net/sock.h b/include/net/sock.h
> > index e223102337c7..e13560b5b7a8 100644
> > --- a/include/net/sock.h
> > +++ b/include/net/sock.h
> > @@ -2735,8 +2735,10 @@ static inline void _sock_tx_timestamp(struct soc=
k *sk,
> >                               *tskey =3D atomic_inc_return(&sk->sk_tske=
y) - 1;
> >               }
> >       }
> > -     if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
> > +     if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS))) {
> > +             printk(KERN_INFO "%s: setting SKBTX_WIFI_STATUS for sk =
=3D %px\n", __func__, sk);
> >               *tx_flags |=3D SKBTX_WIFI_STATUS;
> > +     }
> >  }
> >
> >  static inline void sock_tx_timestamp(struct sock *sk,
> > diff --git a/net/core/sock.c b/net/core/sock.c
> > index e02a78538e3e..f6589ad5ba36 100644
> > --- a/net/core/sock.c
> > +++ b/net/core/sock.c
> > @@ -1548,6 +1548,7 @@ int sk_setsockopt(struct sock *sk, int level, int=
 optname,
> >               break;
> >
> >       case SO_WIFI_STATUS:
> > +             printk(KERN_INFO "%s: setting SOCK_WIFI_STATUS to %u for =
sk =3D %px\n", __func__, valbool, sk);
> >               sock_valbool_flag(sk, SOCK_WIFI_STATUS, valbool);
> >               break;
> >
> > diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> > index 853493eca4f5..eee2f80949c6 100644
> > --- a/net/mac80211/tx.c
> > +++ b/net/mac80211/tx.c
> > @@ -4588,9 +4588,12 @@ static noinline void ieee80211_8023_xmit_clang_d=
ebug_helper(struct sk_buff *skb,
> >  {
> >       if (unlikely(skb->sk && ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_=
STATUS) ||
> >                               sock_flag(skb->sk, SOCK_WIFI_STATUS)))) {
> > -             if ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) ^ soc=
k_flag(skb->sk, SOCK_WIFI_STATUS))
> > +             if ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) ^ soc=
k_flag(skb->sk, SOCK_WIFI_STATUS)) {
> >                       printk(KERN_INFO "%s: skb_shinfo(skb)->tx_flags &=
 SKBTX_WIFI_STATUS =3D %u sock_flag(skb->sk, SOCK_WIFI_STATUS) =3D %u\n",
> >                                       __func__, (skb_shinfo(skb)->tx_fl=
ags & SKBTX_WIFI_STATUS), sock_flag(skb->sk, SOCK_WIFI_STATUS));
> > +                     printk(KERN_INFO "%s: skb->sk =3D %px skb->sk->sk=
_flags =3D 0x%lx\n", __func__, skb->sk, skb->sk->sk_flags);
> > +                     return; // This should make this case non-fatal.
> > +             }
> >               info->status_data =3D ieee80211_store_ack_skb(local, skb,
> >                                                           &info->flags,=
 NULL);
> >               if (info->status_data)
> >
> >
> >
> > This gives after ~15min uptime
> >
> > [  189.337797] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  189.337803] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1b798c4e00 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  191.325256] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  191.325259] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1b798c5a00 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  257.591831] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  257.591844] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1baf3bca00 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  301.786963] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  301.786967] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1c1bc40100 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  302.780881] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  302.780884] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1a44cf6000 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  482.792298] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  482.792304] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1da0f4de00 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  482.806144] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  482.806148] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1da0f4c500 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  482.817280] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  482.817284] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1da0f4df00 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  552.327291] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  552.327295] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1da0f4de00 skb->sk->sk_flags =3D 0xffffffffb4efe640
> > [  916.971599] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_s=
hinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI=
_STATUS) =3D 1
> > [  916.971607] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->=
sk =3D ffff8c1a62834000 skb->sk->sk_flags =3D 0xffffffffb4efe640
> >
> > The printk()s in sk_set_sockopt() and _sock_tx_timestamp() are not call=
ed at all so the flag
> > SOCK_WIFI_STATUS is actually nevers set! What is printed when printing =
skb->sk->sk_flags looks
> > suspiciously like a pointer, and as sk_flags is actually a member of a =
union in struct sock_common
> > it seems clang is using sk_flags for one of the other union members her=
e
> >
> > struct sock_common {
> > [...]
> >       union {
> >               unsigned long   skc_flags;
> >               struct sock     *skc_listener; /* request_sock */
> >               struct inet_timewait_death_row *skc_tw_dr; /* inet_timewa=
it_sock */
> >       };
> > [...]
> > }
> >
> > Bert Karwatzki
>
> I added even more debugging output and found out why commit 76a853f86c97 =
(" wifi: free
> SKBTX_WIFI_STATUS skb tx_flags flag") does not work.
>
> diff --git a/include/net/sock.h b/include/net/sock.h
> index e13560b5b7a8..6e1291d2e5a1 100644
> --- a/include/net/sock.h
> +++ b/include/net/sock.h
> @@ -2738,6 +2738,8 @@ static inline void _sock_tx_timestamp(struct sock *=
sk,
>         if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS))) {
>                 printk(KERN_INFO "%s: setting SKBTX_WIFI_STATUS for sk =
=3D %px\n", __func__, sk);
>                 *tx_flags |=3D SKBTX_WIFI_STATUS;
> +       } else {
> +               printk(KERN_INFO "%s: NOT setting SKBTX_WIFI_STATUS for s=
k =3D %px\n", __func__, sk);
>         }
>  }
>
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index 20915895bdaa..4913b09c0617 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -912,6 +912,7 @@ reqsk_alloc_noprof(const struct request_sock_ops *ops=
, struct sock *sk_listener,
>                         return NULL;
>                 }
>                 req->rsk_listener =3D sk_listener;
> +               printk(KERN_INFO "%s: sk_listener =3D %px\n", __func__, s=
k_listener);
>         }
>         req->rsk_ops =3D ops;
>         req_to_sk(req)->sk_prot =3D sk_listener->sk_prot;
> @@ -986,6 +987,7 @@ static struct request_sock *inet_reqsk_clone(struct r=
equest_sock *req,
>         nreq_sk->sk_incoming_cpu =3D req_sk->sk_incoming_cpu;
>
>         nreq->rsk_listener =3D sk;
> +       printk(KERN_INFO "%s: rsk_listener =3D%px\n", __func__, sk);
>
>         /* We need not acquire fastopenq->lock
>          * because the child socket is locked in inet_csk_listen_stop().
> diff --git a/net/ipv4/inet_timewait_sock.c b/net/ipv4/inet_timewait_sock.=
c
> index 67efe9501581..1a3108ec7503 100644
> --- a/net/ipv4/inet_timewait_sock.c
> +++ b/net/ipv4/inet_timewait_sock.c
> @@ -190,6 +190,7 @@ struct inet_timewait_sock *inet_twsk_alloc(const stru=
ct sock *sk,
>                 const struct inet_sock *inet =3D inet_sk(sk);
>
>                 tw->tw_dr           =3D dr;
> +               printk(KERN_INFO "%s: sk =3D %px tw_dr =3D %px\n", __func=
__, sk, dr);
>                 /* Give us an identity. */
>                 tw->tw_daddr        =3D inet->inet_daddr;
>                 tw->tw_rcv_saddr    =3D inet->inet_rcv_saddr;
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index eee2f80949c6..227b86427e06 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -4586,6 +4586,8 @@ static noinline void ieee80211_8023_xmit_clang_debu=
g_helper(struct sk_buff *skb,
>                                                             struct ieee80=
211_local *local,
>                                                             struct ieee80=
211_tx_info *info)
>  {
> +       if (skb->sk)
> +               printk(KERN_INFO "%s: skb->sk =3D %px skb->sk->sk_flags =
=3D 0x%lx\n", __func__, skb->sk, skb->sk->sk_flags);
>         if (unlikely(skb->sk && ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_=
STATUS) ||
>                                 sock_flag(skb->sk, SOCK_WIFI_STATUS)))) {
>                 if ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) ^ soc=
k_flag(skb->sk, SOCK_WIFI_STATUS)) {
>
>
> This monitor the value of skb->sk->sk_flags not only in the error case bu=
t in all cases, and also monitors
> the places where the other members of the sk_flags union are set. The err=
or occurs when at the start
> of ieee80211_8023_xmit_clang_debug_helper() sk_flags is not actually the =
skc_flags member of the union
> but insted is skc_tw_dr which is only interpreted is flags.
>  So why does it work with gcc but fail with clang? sock_flag(skb->sk, SOC=
K_WIFI_STATUS) test bit 19 of
> skb->sk->sk_flags

Could you say more about this? I don't follow it. Why does the gcc
test just miss the crash issue? Is there anything (like call trace)
different between them?

My worry is that all the callers calling sock_flag might have such
potential risk...

Thanks,
Jason

>
> Here are the important snippets of debug output:
>
> clang:
> [  T575] ieee80211_8023_xmit_clang_debug_helper: skb->sk =3D ffff8f1bebba=
4300 skb->sk->sk_flags =3D 0xffffffffa16fe640
>
> Here test_bit(0xffffffffa16fe640, SOCK_WIFI_STATUS) is 1.
>
> gcc:
> [  T600] ieee80211_8023_xmit_clang_debug_helper: skb->sk =3D ffff8d3506be=
c700 skb->sk->sk_flags =3D 0xffffffff93d40100
> Here test_bit(0xffffffff93d40100, SOCK_WIFI_STATUS) is 0.
>
> So that this works with gcc just seems like luck. I've not yet test why i=
t works with clang when PREEMPT_RT is not
> enabled but my guess is that in that case we have a tw_dr pointer which f=
ails the test_bit().
>
> Bert Karwatzki
>
>
>
>
>
>
>
