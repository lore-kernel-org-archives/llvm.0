Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530337;
	b=l4YoJ9v4P9JB0po+pK9m/CTuag5+7QLDjEF0FMo1w18GtC3D7+6KQBDerP2NtpYf8JAL
	 lIBkNHLWyYkI5sCBrtlaqxausgWC57UjdPQjkITS/gA131+iKDMDgDGhkl8CQMLe/rcwR
	 lp0N3b9nfJGdVe8+w7cJo2Ncx1MPkvqUa8LffghRnItnQKN/sxxL1Ox5NqCCbAyfUcIrc
	 ylV43mIYA/Np8bLScUq0TiIEIcZuTOr4TDlX79fcXTm8sbZLH/XAlA5+PnfrETOKgrcgC
	 G7fHbsAWV2Y0QYBUvxpokJjzRVtoDhj5k46NbCTsi8bO+MwNqP7D5bIwfaZqv7NkWdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
	b=aAF3csKZnyHpQYy22bEgKD105Ss6fan4YuxDqSEv1EoM9TcdC5tVeRDaAGQUJbX/vBUU
	 umyw459Tn+B4Yi/PLXQaqaouCbm1LvUr7Jq+GFlr6B1K2BIR1AU2VH4dlpDzyplzjC84q
	 muB0mRDeIE/yLinWhEzQE+FYTacV186gPTUk7rNrn6A6vej/l/7f+uwJpXEPOJjUIsuDw
	 x41x+mSYLmD97toA4EccuSddHBhsIVfVKR1Nxh18T8yTxq1VOnTbLrtVYwpaqp/f7pXjl
	 Vf1WisAgKULiY0EJgrBPbOzsG+fAFLaPe2WIBZ3P6gfO8ujb/GJL01UA0l4T64M2fUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iv2t9W8y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38EE8606A330
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 14:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38EE8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iv2t9W8y
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1839760b3a.3
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 06:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530336; cv=none;
        d=google.com; s=arc-20260327;
        b=dTNziPQEMAb7YeiZ+a6F+OA7xEe9RV6RrQUI/kC4L5mZcWnq3Ha2A8g8G9c7uFVLvW
         vQ15oUUzh+jU95tEXZ2cQY3h9383ALRYQois8VpwPYDSyD+36YbzFofE8za1Vkoaoftl
         KHbmHNeU+4SvLzQKEhIZNgx8mv1i/hpUGO1c2RewKKeIXpTbqOz92zdk4NFOo5ajbrNi
         XSUi6lBbLaoDpbCXGI++3vuf4L6ePOkarRxfqNMaW0gUmWCyL1qa25c8UzvdVKbapmf1
         mHPcnIEjMlLmHKPf8Lvajm3OL4c53FwN3KqLNvF0re8fkq4bAJdwYqakCoyriLI+CGzP
         2vxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        fh=qikLwWVAZjHj8mNYvFMdSJKsRTnMFabdRYB2z2lC9Js=;
        b=IzqCFzcOKWIAUZfNg0QG3H6EhzQnZDYaPnHwomNv5hb20FO0vlsDXceqUomjvcDwQ3
         CZdibiZr6REClx1w1b5hWbqpYOkPbLLe7Rm+KFM9/1hm6hFfpFhrvxC7wBAJCY2xOawx
         lk2A28rU/NLf3zdTYVEqKaK5UCb2tGCv5zXYnDUQ+UzeQd9kN4jL3uxmDGwhwl+NdUUh
         p9Rpwxp/jfp4bXOLFRWm2Uqh/BcZf3keDwcMI9YR1MQl7GqNcx7aeFQfJ+IQArc8k7Ke
         0i6wLk/oj+KzkyK2gN17xZIwp5UeObCo2v3bwn7xtKv+BwdkubCc0HA0sZT3TM55nu75
         CDDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795530336; x=1796135136; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        b=Iv2t9W8yhdEOX0uMyp0KOyJL9z5AJ+De0imhTG82PSaZNucMHerR3GvFjUetfW0wyT
         rbLSIR37n1KVqOK5al2fpTfsj0YG3Amt0OHjETBJ5Y5m81PgWjA5Fxx0S+AAR0oztUfp
         ZfFBrAUSlLmuP4utOZwLYG6oQev3CJlYI+Km/ZCxaSi7UkIE/RaDjM3tBaE1ribW10DB
         ppb11PXybpjnenyoCG/QwxtJX45QSWhDJuMzS7Jg2PJ4ik7vxNXJijq8wSj4v7yUxp5e
         cAOXKa4KqNujI+uy1kpbdobVHYPy1qwRrOX1uBvzIzgGJxnnPk+peUElX5HuKT6H/H8t
         weiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530336; x=1796135136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dF9Eh9RPsijpEV4u/u30zGzXT7uW3lnbZk/EegXl/U0=;
        b=JPzfPtcX4AtvLraL87a32QiWVADYZPw7g952+UCPiysCF3ohO8m7zTvA5Ui8HJ5pKh
         B5Dt4/BDmZmdP8DfC1WWhi9qhRD9adc2TZAUNf18TREDl+VFeoA0U2aK3HU1+wItENRX
         xIm8I3VinhoxmcDR6hA3Ts/qywqRoLK6uFenQzlw8tdcWcKBOeMnuBCWMclAlY4MM2nc
         4rgxTCKYfXQ65MC56hYRpU3ikJ/AkIflPpU9B2OX5FO7j6CZX7IWRF7iEEZherU/bO8a
         d+4e0WQ2+Ljm8hh8coN4SsYYKyHjW6hPT5BFAO7ZmeeMUQrvl2Jiaw/i7z3zdV2DS1dD
         NAtA==
X-Forwarded-Encrypted: i=1; AL+hErErSl5FYfRjeq4bbvhaJ0JuPKkcgEg+y3R65Eor7flWxuiUTdPqIP46EcknE6fnHzMnwryc@lists.linux.dev
X-Gm-Message-State: APuU4Z/g2x6ktTc0JFVwZT7zbaQooGfYo84DnJZZY6KgICVLpisH48Dw
	0JLuZv16uXfXHFYD0zB+1Iu4Zi/B80FKfp8VcS+V5Q5dFJkrQ7cUgR098rwH2HMato6+tzbQyXd
	LUzwCIeCkBaLhDMbUQp0Fi+7atnKwgo8=
X-Gm-Gg: AZFdTZdecHxfsmbO03Ex10ff5LuicqGapt5GGjF4fYdYBSCJijk4QI46KwVELWzhFwi
	3dplyJpmixn1jSOw1/AjBqiFLC9HWuWjFG6T/ArD9EEGjtjSYRsXbkI+DBiplWfqbGgqRUKkOxc
	hB03NpLGk7PvIBJM+wyNlSWv67Sn7D0QcV1rCuzF7HrEhZi2ZdTUN2kxyu7sgeldFfy5dTa59U3
	NdT+hmJSqpXSzeuge0z9BLtwvapa8/f9UP3zs8mZZEOY6HsHkMfYQCN7mCsOVZ1z90dKvK3DIRT
	qrROaq18v2eYjHuN5mmUOBXRTTUQY6RgwtU/W591JvD9TNaR+bOk3vHPI2fcRUNzERK6NOo9qWz
	Gn5qNK/Ju8FCzlNXCzt7O1XTeMm2oQd5x/JIFB0QRg1Bwz/uMu6v09hjVvhsZRlt8PLCrD/2kn0
	86SBTEEQmBzRddC1Yro4UVP8BmRPdDVUKLmVdCmg==
X-Received: by 2002:a05:6a00:aa05:b0:8ac:3a71:38a6 with SMTP id
 d2e1a72fcca58-8c87d51b350mr14612611b3a.52.1795530336387; Tue, 24 Nov 2026
 06:25:36 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119170342.1508789-1-irogers@google.com>
In-Reply-To: <20261119170342.1508789-1-irogers@google.com>
From: Xin Long <lucien.xin@gmail.com>
Date: Tue, 24 Nov 2026 09:25:24 -0500
X-Gm-Features: Aa3M54q7cf8dGtPcbVzPYANJ8EMqW3ekx7jrSJiP6UuKtxdr80Wu8XceJYu_RHk
Message-ID: <CADvbK_fM=xmwthLnz=j7YqRghc6ncDo8ESVYgWYeR0t_Byubhg@mail.gmail.com>
Subject: Re: [PATCH net] sctp: initialize new_value in custom proc_dointvec
 sysctl handlers
To: Ian Rogers <irogers@google.com>
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 12:03=E2=80=AFPM Ian Rogers <irogers@google.com> wr=
ote:
>
> proc_sctp_do_rto_min(), proc_sctp_do_rto_max(), proc_sctp_do_auth(),
> proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() point
> tbl.data at an uninitialized stack variable new_value on writes before
> calling proc_dointvec().
>
> proc_dointvec() can return 0 without writing to tbl.data, for example on
> a zero-length write (*lenp =3D=3D 0) or on a write at a non-zero file off=
set
> ignored by proc_first_pos_non_zero_ignore() (such as pwrite(fd, "1\n",
> 2, 1) or a split write where the trailing newline is written separately).
>
> When that happens:
> - proc_sctp_do_auth() unconditionally stores the uninitialized stack int
>   into net->sctp.auth_enable and sctp_sk(sk)->ep->auth_enable, both
>   corrupting SCTP authentication state and leaking 4 bytes of kernel
>   stack memory back on subsequent sysctl reads.
> - proc_sctp_do_rto_min(), proc_sctp_do_rto_max(),
>   proc_sctp_do_udp_port(), and proc_sctp_do_probe_interval() validate
>   the uninitialized value and overwrite the netns setting whenever stack
>   bytes happen to fall within range.
> - proc_sctp_do_udp_port() also stops and restarts the UDP encapsulation
>   socket even when the port number did not change.
>
> Initialize new_value to the current netns setting before calling
> proc_dointvec() (matching proc_dobool()), and skip tearing down and
> restarting the UDP encapsulation socket in proc_sctp_do_udp_port() when
> new_value equals net->sctp.udp_port.
>
> Found by enabling Clang's -Wconditional-uninitialized on an x86_64
> allyesconfig build, with AI coding assistant help to audit the warning
> and prepare the fix. Build-tested with Clang; not runtime-tested.
>
> Fixes: 4f3fdf3bc59c ("sctp: add check rto_min and rto_max in sysctl")
> Fixes: b14878ccb7fa ("net: sctp: cache auth_enable per endpoint")
> Fixes: 046c052b475e ("sctp: enable udp tunneling socks")
> Fixes: d1e462a7a5f3 ("sctp: add probe_interval in sysctl and sock/asoc/tr=
ansport")
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  net/sctp/sysctl.c | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/net/sctp/sysctl.c b/net/sctp/sysctl.c
> index 2b94c211427d..0c33f05fa532 100644
> --- a/net/sctp/sysctl.c
> +++ b/net/sctp/sysctl.c
> @@ -425,8 +425,9 @@ static int proc_sctp_do_rto_min(const struct ctl_tabl=
e *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.rto_=
min);
>         unsigned int min =3D *(unsigned int *) ctl->extra1;
>         unsigned int max =3D *(unsigned int *) ctl->extra2;
> +       int new_value =3D net->sctp.rto_min;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -453,8 +454,9 @@ static int proc_sctp_do_rto_max(const struct ctl_tabl=
e *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.rto_=
max);
>         unsigned int min =3D *(unsigned int *) ctl->extra1;
>         unsigned int max =3D *(unsigned int *) ctl->extra2;
> +       int new_value =3D net->sctp.rto_max;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -489,8 +491,9 @@ static int proc_sctp_do_auth(const struct ctl_table *=
ctl, int write,
>                              void *buffer, size_t *lenp, loff_t *ppos)
>  {
>         struct net *net =3D container_of(ctl->data, struct net, sctp.auth=
_enable);
> +       int new_value =3D net->sctp.auth_enable;
>         struct ctl_table tbl;
> -       int new_value, ret;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -522,8 +525,9 @@ static int proc_sctp_do_udp_port(const struct ctl_tab=
le *ctl, int write,
>         struct net *net =3D container_of(ctl->data, struct net, sctp.udp_=
port);
>         unsigned int min =3D *(unsigned int *)ctl->extra1;
>         unsigned int max =3D *(unsigned int *)ctl->extra2;
> +       int new_value =3D net->sctp.udp_port;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> @@ -541,18 +545,20 @@ static int proc_sctp_do_udp_port(const struct ctl_t=
able *ctl, int write,
>                         return -EINVAL;
>
>                 mutex_lock(&sctp_sysctl_mutex);
> -               net->sctp.udp_port =3D new_value;
> -               sctp_udp_sock_stop(net);
> -               if (new_value) {
> -                       ret =3D sctp_udp_sock_start(net);
> -                       if (ret)
> -                               net->sctp.udp_port =3D 0;
> +               if (new_value !=3D net->sctp.udp_port) {
> +                       net->sctp.udp_port =3D new_value;
> +                       sctp_udp_sock_stop(net);
> +                       if (new_value) {
> +                               ret =3D sctp_udp_sock_start(net);
> +                               if (ret)
> +                                       net->sctp.udp_port =3D 0;
> +                       }
> +
> +                       /* Update the value in the control socket */
> +                       lock_sock(sk);
> +                       sctp_sk(sk)->udp_port =3D htons(net->sctp.udp_por=
t);
> +                       release_sock(sk);
>                 }
> -
> -               /* Update the value in the control socket */
> -               lock_sock(sk);
> -               sctp_sk(sk)->udp_port =3D htons(net->sctp.udp_port);
> -               release_sock(sk);
>                 mutex_unlock(&sctp_sysctl_mutex);
>         }
>
> @@ -564,8 +570,9 @@ static int proc_sctp_do_probe_interval(const struct c=
tl_table *ctl, int write,
>  {
>         struct net *net =3D container_of(ctl->data, struct net,
>                                        sctp.probe_interval);
> +       int new_value =3D net->sctp.probe_interval;
>         struct ctl_table tbl;
> -       int ret, new_value;
> +       int ret;
>
>         memset(&tbl, 0, sizeof(struct ctl_table));
>         tbl.maxlen =3D sizeof(unsigned int);
> --
> 2.56.1.708.g77570a6a1d-goog
>

Acked-by: Xin Long <lucien.xin@gmail.com>
