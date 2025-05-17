Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBBD1922FA
	for <llvm@lists.linux.dev>; Sat, 17 May 2025 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481679; cv=none; b=NyKf0L7bz5idD9D/9pTX39zExf7faMZc5xNwMa0NOSv8TJ48x3nyrfV1+1jVkCMmL3dDX/8Ma9PTduoHbh8S50x81PNeyxM8kRGcvz+WD2KqElDJ9bfRd/eJ/6G4QxkW3u+i8m9Vx+HPa00yfD2v2bY9yMvklRULIQNr69QPSrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481679; c=relaxed/simple;
	bh=x9WQu15a0CvTyQ8NsF9ruE7Lf/UN/ZhXRTmMwm/a6PY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mo919nl0bIJffVQPd+aaNwNe9OqFSQ5OTNtM6UawLmaaJYQTUmPjCZ4I3w1AT+xnAQfPLcvzE7SpcouCynBMgNVQYiXfAxM4pgvHJDmvFpVGQutxifr4ROxC0BKBHcislQCMdC5czB84t/krsFCZnZuG6Rav7eCfZnAdkdxCfMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=IO3ne5YO; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="IO3ne5YO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747481653; x=1748086453; i=spasswolf@web.de;
	bh=dadCyju+xeEXAIQZEjZo1Bn+Q8HMZfWwnjstkoQkIAE=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IO3ne5YORWWpnGoWaxN/8RmNcPgMSMKfD1UChWqFqUDEqrGh97Xipwpg9scgoGFd
	 wm6/GEtieIPx0B1RhEk5JXLth576mbKiWHa29sh2F0qPvlqP+tpA914sX9LscM7p5
	 KkveTT0Dac6bJ1msHultkD8TQ3oQV/LHpPO9L1/f+0hcaJ1c23ujjc7SpZGP1iJjz
	 ZeGG7B95bEwNmN/eC87X2Db5qC2yolH4oNjBqZKbvu+gIx8EAuPdYpH1pZ+v7e66n
	 Bvai0c+9vn+IFfacYKkmAneIZbhFfTuKYMR209xT3Txe0RiRUJk656ddeGSyXn2In
	 tXOkzLaPEzUxpamJJA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MgzaR-1ut9WT3pev-00ZRKw; Sat, 17
 May 2025 13:34:12 +0200
Message-ID: <388bbc4c805ce029bbd08010fd30405494f998a9.camel@web.de>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when
 compiled with clang
From: Bert Karwatzki <spasswolf@web.de>
To: Johannes Berg <johannes@sipsolutions.net>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, 
 "llvm@lists.linux.dev"
	 <llvm@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-wireless@vger.kernel.org, spasswolf@web.de
Date: Sat, 17 May 2025 13:34:11 +0200
In-Reply-To: <63cc1dbf07bde2c9d14e1f86ce2c2ce26a2a9936.camel@web.de>
References: <20250513164807.51780-1-spasswolf@web.de> <87h61ojg3g.ffs@tglx>
											 <7471a185adcc34a79c2ab8ce1e87ab922ae2232b.camel@web.de>
										 <b644ff1714731cfb652d809d4864f0d178b24a97.camel@web.de>
									 <2d8c1929bf5ab5260dacf9aa390456b3b49ce465.camel@sipsolutions.net>
								 <2cad838b39f00d93319509d2a6a77a4c42c7fa92.camel@web.de>
							 <a12c82c394e9676e32ede6b8312f821a16fef94b.camel@sipsolutions.net>
				 <f8552d41fb7eae286803b78302390614179b33b0.camel@web.de>
			 <8684a2b4bf367e2e2a97e2b52356ffe5436a8270.camel@sipsolutions.net>
		 <ba97a2559cda1b14e0c9754523ff1152bdad90ef.camel@web.de>
	 <63cc1dbf07bde2c9d14e1f86ce2c2ce26a2a9936.camel@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FRNQgOtzobnROA3s8DGrFucmEyfVDKJjuc6RLbOVOfy7sPFxp/G
 7rLq/rpK50GzlZXa2J1tFEpdhnJ+qYCUtrNGLD5sUhbDv6P7Mx3kIF9zP1+z9xCAbzopePZ
 9ETT62spdHptQBQI6k5sFz3Yv7qlyOOVIUbAiSqINEcCmrHq01YbmOTir5+/ol1hZ71mAlv
 E3/as/pKvRSOZZDwx6omw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BICPyeDsVVE=;SrJ/Ofhtuu3j0XVjrcaPLZgmih/
 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

Am Freitag, dem 16.05.2025 um 20:19 +0200 schrieb Bert Karwatzki:
> I've added a debugging statement:
>=20
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index 3bd5ee0995fe..853493eca4f5 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -4586,7 +4586,11 @@ static noinline void ieee80211_8023_xmit_clang_de=
bug_helper(struct sk_buff *skb,
>                                                             struct ieee8=
0211_local *local,
>                                                             struct ieee8=
0211_tx_info *info)
>  {
> -       if (unlikely(skb->sk && sock_flag(skb->sk, SOCK_WIFI_STATUS))) {
> +       if (unlikely(skb->sk && ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI=
_STATUS) ||
> +                               sock_flag(skb->sk, SOCK_WIFI_STATUS)))) =
{
> +               if ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) ^ so=
ck_flag(skb->sk, SOCK_WIFI_STATUS))
> +                       printk(KERN_INFO "%s: skb_shinfo(skb)->tx_flags =
& SKBTX_WIFI_STATUS =3D %u sock_flag(skb->sk,
> SOCK_WIFI_STATUS) =3D %u\n",
> +                                       __func__, (skb_shinfo(skb)->tx_f=
lags & SKBTX_WIFI_STATUS), sock_flag(skb->sk,
> SOCK_WIFI_STATUS));
>                 info->status_data =3D ieee80211_store_ack_skb(local, skb=
,
>                                                             &info->flags=
, NULL);
>                 if (info->status_data)
>=20
> This gives the following logoutput (and a lockup), indicating that sock_=
flag(skb->sk, SOCK_WIFI_STATUS) and
> (skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) are actually NOT equival=
ent (when compiled with clang and
> PREEMPT_RT=3Dy)

I've added more debugging output:

diff --git a/include/net/sock.h b/include/net/sock.h
index e223102337c7..e13560b5b7a8 100644
=2D-- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -2735,8 +2735,10 @@ static inline void _sock_tx_timestamp(struct sock *=
sk,
 				*tskey =3D atomic_inc_return(&sk->sk_tskey) - 1;
 		}
 	}
-	if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS)))
+	if (unlikely(sock_flag(sk, SOCK_WIFI_STATUS))) {
+		printk(KERN_INFO "%s: setting SKBTX_WIFI_STATUS for sk =3D %px\n", __fu=
nc__, sk);
 		*tx_flags |=3D SKBTX_WIFI_STATUS;
+	}
 }
=20
 static inline void sock_tx_timestamp(struct sock *sk,
diff --git a/net/core/sock.c b/net/core/sock.c
index e02a78538e3e..f6589ad5ba36 100644
=2D-- a/net/core/sock.c
+++ b/net/core/sock.c
@@ -1548,6 +1548,7 @@ int sk_setsockopt(struct sock *sk, int level, int op=
tname,
 		break;
=20
 	case SO_WIFI_STATUS:
+		printk(KERN_INFO "%s: setting SOCK_WIFI_STATUS to %u for sk =3D %px\n",=
 __func__, valbool, sk);
 		sock_valbool_flag(sk, SOCK_WIFI_STATUS, valbool);
 		break;
=20
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 853493eca4f5..eee2f80949c6 100644
=2D-- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4588,9 +4588,12 @@ static noinline void ieee80211_8023_xmit_clang_debu=
g_helper(struct sk_buff *skb,
 {
 	if (unlikely(skb->sk && ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS)=
 ||
 				sock_flag(skb->sk, SOCK_WIFI_STATUS)))) {
-		if ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) ^ sock_flag(skb->sk=
, SOCK_WIFI_STATUS))
+		if ((skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS) ^ sock_flag(skb->sk=
, SOCK_WIFI_STATUS)) {
 			printk(KERN_INFO "%s: skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS =
=3D %u sock_flag(skb->sk, SOCK_WIFI_STATUS) =3D %u\n",
 					__func__, (skb_shinfo(skb)->tx_flags & SKBTX_WIFI_STATUS), sock_flag=
(skb->sk, SOCK_WIFI_STATUS));
+			printk(KERN_INFO "%s: skb->sk =3D %px skb->sk->sk_flags =3D 0x%lx\n", =
__func__, skb->sk, skb->sk->sk_flags);
+			return; // This should make this case non-fatal.
+		}
 		info->status_data =3D ieee80211_store_ack_skb(local, skb,
 							    &info->flags, NULL);
 		if (info->status_data)



This gives after ~15min uptime

[  189.337797] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  189.337803] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1b798c4e00 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  191.325256] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  191.325259] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1b798c5a00 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  257.591831] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  257.591844] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1baf3bca00 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  301.786963] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  301.786967] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1c1bc40100 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  302.780881] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  302.780884] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1a44cf6000 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  482.792298] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  482.792304] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1da0f4de00 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  482.806144] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  482.806148] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1da0f4c500 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  482.817280] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  482.817284] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1da0f4df00 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  552.327291] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  552.327295] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1da0f4de00 skb->sk->sk_flags =3D 0xffffffffb4efe640
[  916.971599] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb_shin=
fo(skb)->tx_flags & SKBTX_WIFI_STATUS =3D 0 sock_flag(skb->sk, SOCK_WIFI_S=
TATUS) =3D 1
[  916.971607] [    T576] ieee80211_8023_xmit_clang_debug_helper: skb->sk =
=3D ffff8c1a62834000 skb->sk->sk_flags =3D 0xffffffffb4efe640

The printk()s in sk_set_sockopt() and _sock_tx_timestamp() are not called =
at all so the flag=C2=A0
SOCK_WIFI_STATUS is actually nevers set! What is printed when printing skb=
->sk->sk_flags looks
suspiciously like a pointer, and as sk_flags is actually a member of a uni=
on in struct sock_common
it seems clang is using sk_flags for one of the other union members here

struct sock_common {
[...]
	union {
		unsigned long	skc_flags;
		struct sock	*skc_listener; /* request_sock */
		struct inet_timewait_death_row *skc_tw_dr; /* inet_timewait_sock */
	};
[...]
}

Bert Karwatzki
