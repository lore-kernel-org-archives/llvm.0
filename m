Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637662F5482
	for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759226873; cv=none; b=bTfa7WftABpvvEBRCaxS2PwwhcPmj6pUoUmz/CvTrsHhsj+CmfRQ4M9T0CUIJNt5v2SEb6WvMBybBR5QlqTYrMZAHUpJ21sFB7gzYI1Ec1wGmnb0TncgDioglPAmeGdDVc+Ds5K0Wwev6LeIO9mpk3sYPrFI4vsl8r0YLYRch5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759226873; c=relaxed/simple;
	bh=FKY8z1CEGgUY6q+4pHNC/Om4xVBeYJauYh54XqnoY6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Unl454upIgXcp145ivujCCUWnfyCuHbdaoelNwq18+YpwgKOLcN8O74c8EXnuw3/iv82FJ6TruByAdLLVHmJ9OO0AxfHMXnso8ilbQrJnI4PPxyjtnXUP6ZRnz669O+YeUksR+WztpOayJXZu1R5qq4J5R5sOLu0fhGmudcW6+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lKzbKnBn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lKzbKnBn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27ee41e0798so71496215ad.1
        for <llvm@lists.linux.dev>; Tue, 30 Sep 2025 03:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759226870; x=1759831670; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HgwqWLqv5BJjpLMqtyvMalLTTdm/aF2XY54W3HTWoA=;
        b=lKzbKnBnZ+zLbQkUkbDrEFCK7CHIpNoTmk9L3syACIe7koi+dUEtLdwoE0KNaXzn7O
         y3h/ZCVfwQW9yLyPu2iIyj3kT1mHaYB3ag+OHCzBane8HOq40IshIVtwITV9dZfMC2K7
         Kg9rmziSh+AdjIpMf1BNpMSAkfg6Y/Cf1pdK94QUx7e+FjfxRyt71FtXqgAEsAy8/T+U
         ux8fBoj4utk1YcssmleqPlUgfVN3FZhgEA4y6VKWvmOI7+k9+OJes2Ab2QWGL3xC63Mx
         mhZy7gMYGOc0HrJLSVPR12YVzq+K6H+TPygerQukHyFPVaxf5tlW5oLR2dIb5cUbqedB
         EPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759226870; x=1759831670;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2HgwqWLqv5BJjpLMqtyvMalLTTdm/aF2XY54W3HTWoA=;
        b=KFbTGO86JunP9RkUsyPS9nGJdwKhVBLQU9nJaF+yNLT3alJplBE1hnTR/UiZjnNEm6
         UthySAfRPoZyzA21J5tHG+82ZiyHvtJSeEm1+Qtt7qMu+/hNooKvYkosNcCb+M3IXKew
         JrczS4Od0IkvqiMmhRYNo8LGlypR6kNfH5m4/VRvyyieafazhe3hP+Y8BCYYFoVw6ONz
         EAnxeRAcp/iVBzIwL94Wd7Et3XBFg8z/Q7lgKtzn6b0rwKl2Fr6jQBfrDt5phOGmFiym
         9c91Q6U1zjemHskQHSpw8/6cZG5AfmFANq4fyHlBcZPFlCpuDzUUDkUnBLfI8rjET5j7
         cihA==
X-Forwarded-Encrypted: i=1; AJvYcCU67lM0G07lumiL8YGsCvYHH7FchlUlAcCnHzZnuwWx3t/vtqza3hPIbGgUXGHxiI9mEGJE@lists.linux.dev
X-Gm-Message-State: AOJu0YwZzIb96YF3a+VG6r9fcV3D0C1F7J+9eD3H/ZiKTjRMq11h/sU4
	W73GPjtOuQxmV+aDrBXwiSJoFI2e0oJPRhmRfYh9gpmzJ9II9nEJ50Q5
X-Gm-Gg: ASbGnct3P4fOy+1c1+Q/srpfQ3Wi1+JNwN/zFnqSVB/5C2darGQ4KQg824j9BLQ7UnC
	9N1yZrEovRbpu0KBz61AyzNtYhgZVSfQA07TAoDJNHdBLP4p8knGrvYEGpS5GXWw3qz0dnBraW3
	MRg63iavIw5f8Bz8aFqEDuZ4fbY558Q9Shw7IIWJgYMHVZbnUqCRtgWR1DB/iFYNfBjrTi2cLZZ
	nRW9k1tapLWqY/nx0L3UtE450HAYmab++nKFafuwxZbbZvww7N6WlgVC02H1KWrl247GoIsvEAs
	E0WVgh2OEc/GHFhrxrp7RFiM2wvYjP/M8e7oCcxq0j0GpT4L4fRPOG3qyJ7DRFVESIsFngE3PgX
	0P4ZgQrXHANxaXCnwQq1tJd72XOMATEaP+/Vwk4HxWDT2uOpJcKYYxVchEIAFEm4=
X-Google-Smtp-Source: AGHT+IEUeUIAzZJUtqx0W1k5wrTJY310MNYv8ZMr9OBtEg3B71EpiDEoNAOJyPoAlF3t85pkcXk0Ig==
X-Received: by 2002:a17:903:19cf:b0:269:7427:fe37 with SMTP id d9443c01a7336-27ed4a30e5cmr216987585ad.29.1759226869598;
        Tue, 30 Sep 2025 03:07:49 -0700 (PDT)
Received: from y740.local ([2401:4900:1f31:e91f:2d6d:e8a8:f2d7:94ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6733a63sm155381685ad.64.2025.09.30.03.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 03:07:49 -0700 (PDT)
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
Subject: [PATCH net v4] selftest:net: Fix uninit return values
Date: Tue, 30 Sep 2025 15:36:57 +0530
Message-ID: <20250930100656.80420-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix functions that return undefined values. These issues were caught by
running clang using LLVM=1 option.


Clang warnings are as follows:
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


Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
ovpn module")
Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
---
v4:
	- Move changelog below sign-off.
	- Remove double-hyphens in commit description.
v3:
	- Use prefix net.
	- Remove so_txtime fix as default case calls error().
	- Changelog before sign-off.
	- Three dashes after sign-off
v2:
	- Use subsystem name "net".
	- Add fixes tags.
	- Remove txtimestamp fix as default case calls error.
	- Assign constant error string instead of NULL.


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
-- 
2.47.3

