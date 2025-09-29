Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5D23016EC
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 11:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759146290; cv=none; b=jTTdDJ1fy4BdreUlb4vAKGTaDSzUbC5W78bqklf0pBVHwmZaSpEgtf1ZLMZ3xjTLSIpEf1IaL7glQrKuW09DP144x71b+5FdIucOYvVmsDZCQRsd/XYub677FWUsUUeSVr56bQ2T5jWlDPL0TNP5sYNznyoCFXR1Esdm58L1D1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759146290; c=relaxed/simple;
	bh=zVeuPbzY0FhptkGJ1a9ugn6FeUWvhdVRR3UeMZVNM5o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KI+ztulVGacre+o9zy0y6ulTrqonfm+dBK8sCCMkg54zFDQxtn7vFcUa/jsP/pM2knA+9iqQQCEl8kXTImrwIZiMLPX4JemfX4jTBYYGnU+g3WvqvWCNtK+WklwkECurHmlSgfMIFZci8zDTPlITsuib+oDYmiKL0cvpq2jeCds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKYOA3dw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKYOA3dw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2698d47e776so39273625ad.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 04:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146288; x=1759751088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UE/feaxoks8wdjZ8La5T0ON+317bxNw12dhG09tCwTc=;
        b=jKYOA3dw7uZWKA+yuZdY+xVlQ48IPkl1NmUUr0nHQGoAMdFDXjmvA/6F/6MyojtMyJ
         anXAOOn9tfTGIkbiig28cXJd5+u79hbJsxwb/NplslSRoRIG6MxgescDIAVwz18lkgSK
         vtj1JQ3zqjRS6Z699YEQW/3f7YShkj3C9w53sFLiIdkZ7qmdEgNYeW9ETovjEYjXVitL
         z5yiBBG+vVf0LHYuAaXFTUzxCOPCNLr8tzASUlSfwmcj5O1xiDhFo3Pd820KVHT0804U
         phd81lFWedfZjfrN1DcH9q2SDvJDhJyvj09bgynO/SXJSJ1fxzWujty0pKpGtZLDtw+L
         1owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146288; x=1759751088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UE/feaxoks8wdjZ8La5T0ON+317bxNw12dhG09tCwTc=;
        b=bwhbYTUriikA2vShTqQIoAIqD6JOqir5jzorIHFpl1+G//954yizUw/Cr7UPnPEJ8O
         l9pDp8USRC0YBPIAjX/BmR4LqNQuF4wCnUd1tq9x0vJ6DtVgqeQbdYWiueSeKkx8uIZ1
         OYtQPFCE4tdxmmdDC9HUCyStSiFLWA3GJJcKTlWS3Sg+cbN7j0yTiTnyBfRLXd269yHF
         6roquBULB53fbW3DG7ASCfRX+nisFuOi3irSCkRXGOfaAsr4f5jGyTttFp8sDoTU+L/2
         rSeJRQNMpo4Yq4BQ2w39ZOaSXbPaBSSXNdD0zF6aq3Y07vfGwrZXvHsylVXZuyDqENsO
         oYdg==
X-Forwarded-Encrypted: i=1; AJvYcCUshiguJpR893CSUCtG2yw1JjPUnYyYvv73+uEkYHlyU52EGkPNvrsgikOCbvJwpVRoeatG@lists.linux.dev
X-Gm-Message-State: AOJu0YyLCiDaD8Vmu+TGZAaY7nUNSg55JRM4ZzO56BmJ5d7y8jMvCMDu
	I7pwv+h6QGvajsgTmaLvu+jBH0KGJGAEQChcHYLh5cPssGc0GrYat5Vu
X-Gm-Gg: ASbGncuZkaJRUaRh3sBsvw+IgXTQacD5iOQWEVV//Iydy3JIR4qU2fvnIikctEWltm0
	KA7ed1QnmXk6PXH8Bw9AabESQ0RCuN+zxIH7kX1JX9FlNrSMF769G6h0ALusXWRi3Dy5vHAsMf2
	bnFn3E8cZV6+gdxU/XFrj2bYxodiUyQCtLNfH+nQhgS8tjQXnkDaJuxhRl5sYHBWk5jvXwVqvJT
	G/CdAUXN+CzlXwUVxsWa3shhoPTFnZUM/RmA7lq7/c5BednVqkkXxH8iMyyXG9cVWG0rzTSskhl
	jWe5wYHp8nQOHFruVpPgK0Kw1+nC0TzFwOQTOTPZC0iIhjZZbC6FpiAzxncNAv9vUm2R8f0MrKq
	ZaoihKooy9X4cWYfkdA/drnkN8Wh5
X-Google-Smtp-Source: AGHT+IFW39IV8MsCUWVxnyhwFPfmeS+3uE+Tr6I8ZPuadQnx51A6z7az29U8lVTzrBDUQwr69a76wg==
X-Received: by 2002:a17:902:ec89:b0:27e:f06b:ae31 with SMTP id d9443c01a7336-27ef06bb0b8mr124136985ad.61.1759146288506;
        Mon, 29 Sep 2025 04:44:48 -0700 (PDT)
Received: from y740.local ([2401:4900:1f30:25ff:36cb:10ee:ba03:839f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed672a51fsm129475495ad.63.2025.09.29.04.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:44:48 -0700 (PDT)
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
	Sidharth Seela <sidharthseela@gmail.com>
Subject: [PATCH] selftest:net: Fix uninit pointers and return values
Date: Mon, 29 Sep 2025 17:13:57 +0530
Message-ID: <20250929114356.25261-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix uninitialized character pointers, and functions that return
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
txtimestamp.c:240:2: warning: variable 'tsname' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
  240 |         default:
      |         ^~~~~~~
txtimestamp.c:244:20: note: uninitialized use occurs here
  244 |         __print_timestamp(tsname, &tss->ts[0], tskey, payload_len);
      |                           ^~~~~~
txtimestamp.c:220:20: note: initialize the variable 'tsname' to silence this warning
  220 |         const char *tsname;
      |                           ^
      |                            = NULL
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

Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---

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
index 8457b7ccbc09..b76df1efc2ef 100644
--- a/tools/testing/selftests/net/so_txtime.c
+++ b/tools/testing/selftests/net/so_txtime.c
@@ -174,7 +174,7 @@ static int do_recv_errqueue_timeout(int fdt)
 	msg.msg_controllen = sizeof(control);
 
 	while (1) {
-		const char *reason;
+		const char *reason = NULL;
 
 		ret = recvmsg(fdt, &msg, MSG_ERRQUEUE);
 		if (ret == -1 && errno == EAGAIN)
diff --git a/tools/testing/selftests/net/txtimestamp.c b/tools/testing/selftests/net/txtimestamp.c
index dae91eb97d69..bcc14688661d 100644
--- a/tools/testing/selftests/net/txtimestamp.c
+++ b/tools/testing/selftests/net/txtimestamp.c
@@ -217,7 +217,7 @@ static void print_timestamp_usr(void)
 static void print_timestamp(struct scm_timestamping *tss, int tstype,
 			    int tskey, int payload_len)
 {
-	const char *tsname;
+	const char *tsname = NULL;
 
 	validate_key(tskey, tstype);
 
-- 
2.47.3

