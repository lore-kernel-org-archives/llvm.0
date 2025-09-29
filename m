Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EE930C62E
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759161795; cv=none; b=W/CxmFbXJIvvW96Y3SweHKPv++r3C2GEQ9EUtSZYxlAuyDqGtyYcetoQu/TGO1AGScagKO2WCR7kSWFuReck0QUPOuipuufUaXMDdCJzmRIYbo97kYeHQ05enRVJWI8/vKw5zxKC8XKClMwt1cK5RS+Gy88/qWHsvZrPxlAyxgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759161795; c=relaxed/simple;
	bh=1jkw+7EvuIa/Han8qcxFLmMTXaJYMq7ZJC5YxwM3xL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HvjU8ZKBCmj5wJG7uxMKy+aCgeABsh8WfmAAlNX9jp8Dl3Xc61g+nMn//BETugg+JUElFbsDb1OnYJCtys6KdTZF2AhMgW9Hx5RDmztOFAY2HAHMcNBrfoIhEkKf4Chw8To/+Dtxz8YIwR+3tFi6wLcyZDZcRjCZaf2rYwDjD5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THWWUgaT; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THWWUgaT"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7800ff158d5so3118388b3a.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 09:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759161793; x=1759766593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KefHEpASHlImKTlDtTejqsu/vtIp51mWF2HZGf1Fkyo=;
        b=THWWUgaTbYmaMZ+QedwhYR4s8LRBLWUu6ETYmjPfxwtFZPvgSGPQN8rGAt19Phezvk
         usWzZ6mbf8opUHoqgmnv5SjlKoo4tFh/dKVq5Cv9Gy8IRfBo7iQpJaad0GO2wJE1CN5b
         /pYXMf23vgWfCFiuduGNgEeHeKFGGkXHJjq/AXzaBOz4QAsdCGq+aOwW4pQdwlS2uDva
         XzX/CQbr3a5Znt42XCA4iJ9omydkoREXEEpa/rfvkV9dks0iK4Es7HpJ5mpxELQrds/j
         NrmRz1Rw+jcphi/8tiuDKg45XHR93JRlYLk2nzEXWDskVU80Ts216ba4aYDYVwmkBryS
         GnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759161793; x=1759766593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KefHEpASHlImKTlDtTejqsu/vtIp51mWF2HZGf1Fkyo=;
        b=wr7leyjcetnBK6eGDcYzvUJwnRgSAR46uPj+9uqaJf9JFPJiJJ5pWG5+gx9iX8KJbp
         YvlLbRiy+DxXwRXII4RUY+dDbhszI4sYGtcwdf8fXSI5N1wJJQQQkiMvxMOgPXYzNiXj
         HaPf099tbAs2MDOO3SSZ2ADmoDL2QYMCZv5GTKaniG9Vzkf8onwRNyGZhBHNpQBHuzHn
         57SXuEZpnGphgyAd0WxQpJOuQckgsqwygHoKc9lW/yepmfmiaEkustoUM1+ykaW5VH64
         1qTpFR1yCqZiUeloWfV6fy3/DhbkhvUQl8loHbaFjQKIlaRaoq4D8gYoa/bdkaP183oo
         b0mA==
X-Forwarded-Encrypted: i=1; AJvYcCVGto4EUCdUbeiBIrOSr9lIyLTqlxac59SMyX78G/9Dit2dHe0bgydQ+bYOqkWY5qKymzqL@lists.linux.dev
X-Gm-Message-State: AOJu0YwW09/l14+vq07aruAEqmZ6vYWHWgatsTn7OLl0GAL2JToTTKWs
	W11WdL8PU0DjEW+7NQ1NJGD8qrUy2K07qWR0GP+ZIL+NjLaIp0tkoWSp
X-Gm-Gg: ASbGncsvzNaI7wASD9zdK00SPD/iE4FLFjeJHyVwveKrwApW86vq2r2/bWUiBG39L7D
	Q/SSqD/Cm8cVoLvtMLEZ8aN9k3qIcUEMNWot8it92uPRoYvt5Muzt7aJs/cUlWCh0uTzN0C5D/f
	D1SOTFZzAWUxysUszUSLcgKvxm6sugmYuYPZu9OoRJprv55FbwN0TnWt1h/PH8eber/ZoIch4CR
	36e2VfGkfuSSU34id9XB+4Bd5haiLawFthFPZmuRVCSK5KIMR+YA+fWZxKyhYL6RbcIDPpaaFOT
	HRv7+sDjNPQbrkKo4J+Wz0nXEbFb/kr1uz+ldZgCqmlqwASi+00F6lLnPUjWVpZErRscqkzhSHU
	tp8gS0bfxYiC2Uqj1Wkckhh8KQVzC
X-Google-Smtp-Source: AGHT+IFLs3m9GZxE68Q18gbvy+0afYHaST+CDXcgc2TlSHRuYVzEECyokcNZHk3sUQVFmBJDY053zw==
X-Received: by 2002:a05:6a20:9150:b0:248:4d59:93d5 with SMTP id adf61e73a8af0-2e7d72637famr22343288637.55.1759161792642;
        Mon, 29 Sep 2025 09:03:12 -0700 (PDT)
Received: from y740.local ([2401:4900:1f30:25ff:36cb:10ee:ba03:839f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55a0ca2sm11504525a12.42.2025.09.29.09.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 09:03:12 -0700 (PDT)
From: Sidharth Seela <sidharthseela@gmail.com>
To: antonio@openvpn.net,
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
Subject: [PATCH v2] net: Fix uninit character pointer and return values
Date: Mon, 29 Sep 2025 21:32:31 +0530
Message-ID: <20250929160230.36941-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix uninitialized character pointer, and functions that return
undefined values. These issues were caught by running clang using LLVM=1
option; and are as follows:
--
ovpn-cli.c:1587:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
 1587 |         if (!sock) {
      |             ^~~~~
ovpn-cli.c:1635:9: note: uninitialized use occurs here
 1635 |         return ret;
      |                ^~~
ovpn-cli.c:1587:2: note: remove the 'if' if its condition is always false
 1587 |         if (!sock) {
      |         ^~~~~~~~~~~~
 1588 |                 fprintf(stderr, "cannot allocate netlink socket\n");
      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1589 |                 goto err_free;
      |                 ~~~~~~~~~~~~~~
 1590 |         }
      |         ~
ovpn-cli.c:1584:15: note: initialize the variable 'ret' to silence this warning
 1584 |         int mcid, ret;
      |                      ^
      |                       = 0
ovpn-cli.c:2107:7: warning: variable 'ret' is used uninitialized whenever switch case is taken [-Wsometimes-uninitialized]
 2107 |         case CMD_INVALID:
      |              ^~~~~~~~~~~
ovpn-cli.c:2111:9: note: uninitialized use occurs here
 2111 |         return ret;
      |                ^~~
ovpn-cli.c:1939:12: note: initialize the variable 'ret' to silence this warning
 1939 |         int n, ret;
      |                   ^
      |
--
so_txtime.c:210:3: warning: variable 'reason' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
  210 |                 default:
      |                 ^~~~~~~
so_txtime.c:219:27: note: uninitialized use occurs here
  219 |                         data[ret - 1], tstamp, reason);
      |                                                ^~~~~~
so_txtime.c:177:21: note: initialize the variable 'reason' to silence this warning
  177 |                 const char *reason;
      |                                   ^
      |
--
Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
ovpn module")
Fixes: ca8826095e4d4 ("selftests/net: report etf errors correctly")

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>

v2:
	- Use subsystem name "net".
	- Add fixes tags.
	- Remove txtimestamp fix as default case calls error.
	- Assign constant error string instead of NULL.
--

diff --git a/tools/testing/selftests/net/ovpn/ovpn-cli.c b/tools/testing/selftests/net/ovpn/ovpn-cli.c
index 9201f2905f2c..20d00378f34a 100644
--- a/tools/testing/selftests/net/ovpn/ovpn-cli.c
+++ b/tools/testing/selftests/net/ovpn/ovpn-cli.c
@@ -1581,7 +1581,7 @@ static int ovpn_listen_mcast(void)
 {
 	struct nl_sock *sock;
 	struct nl_cb *cb;
-	int mcid, ret;
+	int mcid, ret = -1;
 
 	sock = nl_socket_alloc();
 	if (!sock) {
@@ -1936,7 +1936,7 @@ static int ovpn_run_cmd(struct ovpn_ctx *ovpn)
 {
 	char peer_id[10], vpnip[INET6_ADDRSTRLEN], laddr[128], lport[10];
 	char raddr[128], rport[10];
-	int n, ret;
+	int n, ret = -1;
 	FILE *fp;
 
 	switch (ovpn->cmd) {
diff --git a/tools/testing/selftests/net/so_txtime.c b/tools/testing/selftests/net/so_txtime.c
index 8457b7ccbc09..5bf3c483069b 100644
--- a/tools/testing/selftests/net/so_txtime.c
+++ b/tools/testing/selftests/net/so_txtime.c
@@ -174,7 +174,7 @@ static int do_recv_errqueue_timeout(int fdt)
 	msg.msg_controllen = sizeof(control);
 
 	while (1) {
-		const char *reason;
+		const char *reason = "unknown errno";
 
 		ret = recvmsg(fdt, &msg, MSG_ERRQUEUE);
 		if (ret == -1 && errno == EAGAIN)
-- 
2.47.3

