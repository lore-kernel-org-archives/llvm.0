Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94021D5AF
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 17:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759168687; cv=none; b=OQ9e4G8iWSKb6ozkTcrxAwWM3HjN0HY7yLbtzqXg+Nd1EdKWsXxoDY3X5m86xgLHRegcvv38Iq06t+xVgNrYWJbfYygiZNzj6d6IgDgpJ35ttrUpz+TfwDO23bIFQpxtCZaq94/XcdXXfXfias+m4naElqTbz5vvK3YpT7Yd8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759168687; c=relaxed/simple;
	bh=IHNM4NzgxnMmFEI01G6PNqPKsxoRpwq01Yb96j8WtNY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=snIP0DgI+odNxPiHPYbLAF0OFkb/8g2xoZS4g30WZ9D0ENjK2XPkDUosZj4+VmBLIYcxLnR+lbH+qceZZ5IzncAVnjaJsRrcorsuG8YyL5JoEKkYDy/9lzS3kd3u/Mb4tStKsD6u6SIq5veGxvW4RFZaqeUrrq6u2I1nuMC2aBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D5wB9LlK; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D5wB9LlK"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1777486e0c.3
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 10:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759168684; x=1759773484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E908RI2gAqiHDeoOAT4Wxeq827Q7LIlIthXPPeqIu0Y=;
        b=D5wB9LlKaEqnk4jJJ9iMdx+BnGggWzLA7aJqXHU709g1Cb7BFnQwbpjJppYOl0ByvM
         zyIHFtweTRUIwsKUW9PK8BQpvpFZ8gqeRXHSsbHnJs/FAk8tabYKwXNJUcVyU2Ufeq+P
         nwLPKKAJp1WSKEVQdTP1WRibc6KNGoFQqJUDsx97hxuGHmvW3ymBTn2E+eaHijZiWmoe
         +YpNQeNAiYfZwWodC7kmSA/DAG2XB9Z0M2cQf01EjtFelnazeplcvdH3U4FJpq/IOLiY
         +NqTEzDkqmjJC0iYr3DF0bUOVeZANDpyosZTrurCZOljxJRUA13pIYcVNKTayRF5e3ql
         atfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759168684; x=1759773484;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E908RI2gAqiHDeoOAT4Wxeq827Q7LIlIthXPPeqIu0Y=;
        b=Ub0/hCSGjkCFdYo2kSE3QShlbawqZpV2JYUAnHqDfcL6nuiCqnc5bgkzUeYb12vADg
         AluzhjwakImioYi/8EsfjEO8yTLK5rPFWeDCNyhWyJoTDiqg5uujO6ZIrggeXF9cObLK
         n2nBwT2S/ECNNRT7EoNuJpfA71AB0SPuBoPS6QfNzIXeJw6FCwhebo6ZsuYbQAPVzZES
         LKkByH2hARzPo50B78KqOdHnnYjHsX7ord4AEWr9CJ3HKC57tD5s4OLL8PwcA61Au+4j
         Su6f1IfijCmlndp47zHZoQ5GLSDXf6ay/g2+Kl5u+iTYOlD8hRw3F8mdZH0NGbgtMcSF
         vZQA==
X-Forwarded-Encrypted: i=1; AJvYcCUqyPyJHRvjEFvJyEm2RmhD4XWyzMSoXCjckfHZVufx2eCN5vvwyRT8S5oBYoxRQKUiMZ/D@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2cgaiDbBX+n/J1Qhvkic6YjRA4jg3o8E9YyIGbRbKs7fkQOMX
	vhE6FdHEBiZtFXdyOVZFl57wSAs7KeUOYM/eODMUkjJayFjFM59jcY2V
X-Gm-Gg: ASbGncuCgrfLphcOmwkKXe76xZvjEI1xF84krSN4V+1SoHLvUsmH++Rnaf3BJNSaoiy
	cEPNx1Y9iPdbxzDv6DsAqwnZu4nqeLsNb+myLYRCnAdq3YXDsMmwwX8LUY2ZUOrUfwMr2GfT5JG
	ZdqviGt/Tz/RNWUUDWVKaVcb6NMjtogkgBTvk5+dqMNCEEEvveVnnnQebS1IkRwWzqmP/bL+b2b
	a35m48TrOjfS7oqsOiubwhMQzAs6UHJUpsNYfC9B59LAmItuXWaEGZ3ntmpZI5FBNrkFzzUkGyk
	ggu5IjQs8aYevTlSnQ0ZN6rC/bbX4e7edjpygoHKEq5T0bXFz/QkXmzD+yYfekF++z3k3oN9bz4
	L9mTYPEAHL2uE5alE5fmBbz/9QMU4/BDohHLPC0e2klA4AHBQpDxZK673ePYv505qf11tCm9S0u
	AcUBwT
X-Google-Smtp-Source: AGHT+IGafwY5OqbBwbdedlnM684zSTSo0B+nKhBzZY2UTklcPWu1hk4PiOcg/kKTTuj5OpcgO90zPg==
X-Received: by 2002:a05:6122:c95:b0:53c:6d68:1cdc with SMTP id 71dfb90a1353d-54bea1f5fcemr6937065e0c.14.1759168684281;
        Mon, 29 Sep 2025 10:58:04 -0700 (PDT)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id a1e0cc1a2514c-916db3be313sm2499211241.20.2025.09.29.10.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 10:58:03 -0700 (PDT)
Date: Mon, 29 Sep 2025 13:58:02 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Sidharth Seela <sidharthseela@gmail.com>, 
 antonio@openvpn.net, 
 sd@queasysnail.net, 
 edumazet@google.com, 
 kuba@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemdebruijn.kernel@gmail.com, 
 kernelxing@tencent.com, 
 nathan@kernel.org, 
 nick.desaulniers+lkml@gmail.com, 
 morbo@google.com, 
 justinstitt@google.com
Cc: netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 david.hunter.linux@gmail.com, 
 Sidharth Seela <sidharthseela@gmail.com>
Message-ID: <willemdebruijn.kernel.321e70874e73c@gmail.com>
In-Reply-To: <20250929160230.36941-2-sidharthseela@gmail.com>
References: <20250929160230.36941-2-sidharthseela@gmail.com>
Subject: Re: [PATCH v2] net: Fix uninit character pointer and return values
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Reminder: use the net prefix: [PATCH net v2]

Sidharth Seela wrote:
> Fix uninitialized character pointer, and functions that return
> undefined values. These issues were caught by running clang using LLVM=1
> option; and are as follows:
> --
> ovpn-cli.c:1587:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
>  1587 |         if (!sock) {
>       |             ^~~~~
> ovpn-cli.c:1635:9: note: uninitialized use occurs here
>  1635 |         return ret;
>       |                ^~~
> ovpn-cli.c:1587:2: note: remove the 'if' if its condition is always false
>  1587 |         if (!sock) {
>       |         ^~~~~~~~~~~~
>  1588 |                 fprintf(stderr, "cannot allocate netlink socket\n");
>       |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  1589 |                 goto err_free;
>       |                 ~~~~~~~~~~~~~~
>  1590 |         }
>       |         ~
> ovpn-cli.c:1584:15: note: initialize the variable 'ret' to silence this warning
>  1584 |         int mcid, ret;
>       |                      ^
>       |                       = 0
> ovpn-cli.c:2107:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
>  2107 |         case CMD_INVALID:
>       |              ^~~~~~~~~~~
> ovpn-cli.c:2111:9: note: uninitialized use occurs here
>  2111 |         return ret;
>       |                ^~~
> ovpn-cli.c:1939:12: note: initialize the variable 'ret' to silence this warning
>  1939 |         int n, ret;
>       |                   ^
>       |
> --
> so_txtime.c:210:3: warning: variable 'reason' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
>   210 |                 default:
>       |                 ^~~~~~~
> so_txtime.c:219:27: note: uninitialized use occurs here
>   219 |                         data[ret - 1], tstamp, reason);
>       |                                                ^~~~~~
> so_txtime.c:177:21: note: initialize the variable 'reason' to silence this warning
>   177 |                 const char *reason;
>       |                                   ^
>       |

My previous response accidentally left a state comment. The main
feedback still held:

This default case calls error() and exits the program, so this cannot
happen.

> --
> Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
> ovpn module")
> Fixes: ca8826095e4d4 ("selftests/net: report etf errors correctly")
> 
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> 
> v2:
> 	- Use subsystem name "net".
> 	- Add fixes tags.
> 	- Remove txtimestamp fix as default case calls error.
> 	- Assign constant error string instead of NULL.
> --

End the commit with the Signed-off-by block. Either move changelog
above that, or below three (not two) dashes.
 
> diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
> index 9201f2905f2c..20d00378f34a 100644
> --- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
> +++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
> @@ -1581,7 +1581,7 @@ static int ovpn_listen_mcast(void)
>  {
>  	struct nl_sock *sock;
>  	struct nl_cb *cb;
> -	int mcid, ret;
> +	int mcid, ret = -1;
>  
>  	sock = nl_socket_alloc();
>  	if (!sock) {
> @@ -1936,7 +1936,7 @@ static int ovpn_run_cmd(struct ovpn_ctx *ovpn)
>  {
>  	char peer_id[10], vpnip[INET6_ADDRSTRLEN], laddr[128], lport[10];
>  	char raddr[128], rport[10];
> -	int n, ret;
> +	int n, ret = -1;
>  	FILE *fp;
>  
>  	switch (ovpn->cmd) {
> diff --git a/tools/testing/selftests/net/so_txtime.c b/tools/testing/selftests/net/so_txtime.c
> index 8457b7ccbc09..5bf3c483069b 100644
> --- a/tools/testing/selftests/net/so_txtime.c
> +++ b/tools/testing/selftests/net/so_txtime.c
> @@ -174,7 +174,7 @@ static int do_recv_errqueue_timeout(int fdt)
>  	msg.msg_controllen = sizeof(control);
>  
>  	while (1) {
> -		const char *reason;
> +		const char *reason = "unknown errno";
>  
>  		ret = recvmsg(fdt, &msg, MSG_ERRQUEUE);
>  		if (ret == -1 && errno == EAGAIN)
> -- 
> 2.47.3
> 


