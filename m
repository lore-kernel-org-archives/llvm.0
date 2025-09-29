Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F124418F
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 21:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759180449; cv=none; b=ckNMPVkp5GzkpE/2SHnFkZqYXiR7BFEOs8pBdrIn6SQvlX1mHQt+hVQ050wHSsVdq8ckO49XS3XmtSt8HTy0ry2HuGy6wJHCDmneoxi7rbnRPvJjOd/4cL8DgUoYeRjgQTyjp/dSGY58t9ZnXje5K5G5Gxb34hLqPmeI6W4+WGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759180449; c=relaxed/simple;
	bh=Ynh5t1oq+BGC5ayEleKfAh77OocncN7vunfZBZxFxdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fWikBdiZfk6BxRwM1RqCSnOqA2ce4TcPYnuTpVsEwPfx/KjqsrliSEBfwcChqGiHAhYoKBYZQOWYrfGWf+YWwZhFCFVuvMBcmINwhzKrGNY4Gwxxg2Uq1XhfQB2NPgVG1dfBm9j4x21mRI5vq8OwsRcWpj0AuTtbDKRVXTbElcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z6eN2kdQ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z6eN2kdQ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5565f0488bso3541886a12.2
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759180447; x=1759785247; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qPMfvOFUo6Dm7WbBf/aklHipttbPQuSYzlg3rBgSq2c=;
        b=Z6eN2kdQ8ztJNwl74VE3uLBkEdxfbs1AXNnuvCpKioJyGfydZ1JoH3sOMS1Pzwmy9e
         P6pBzoOUitV75KuDOF5LPv3HQysgkr3MSZKEi8ga7uK/IuItzYydS4bpK00nGqY0ejKz
         oHI61Xlx8xVjhzJJER3Cfigy6csKpUEoEzZIZ7aHuaqGCzfDkbsJL0WTbIo7M0KWckBu
         4PzPQO9Ts7vPnIa9CRb4mwLckvqkAUtYET9LeMjJ9ifisqTGs7HT7cF61bYScInqqR2Y
         pl9zwgitcJNz73ECW8qZecY+0tTXWG7itvnhXPTa9FW7GRZMB0oxK/QnUQhj6HKkt2CC
         hs3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759180447; x=1759785247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qPMfvOFUo6Dm7WbBf/aklHipttbPQuSYzlg3rBgSq2c=;
        b=dPicJs89nLWCKXPTym0vvHFphM8dBhaikbB6jc+4osN1QYEccn5jWjfhQuexM1ul6x
         jjmaLp8BwotKCS4jSBLF5nzpMnvzORm8mJ6AehvJnZD23XQsswx8G8c4vQiX7DC6oWv7
         hSgRDsrQVSfBuz54g/7vspGQHBbBZP6r7idtb380Sa4mAiWj+9zJLt8uLxckt62Unq55
         gpJVteh+6AtbH6c9ZaPf3KPt9gcgrCuU9PRtw4BrCz8h3LF1C5oa2zPg6kd7Q1I7zdYC
         w8mQSfDKNhV543qFUfWmgaDPmYH39jq4OdBk36oMFkAbl1QdV94wG1gDmoKY7mPg4XSk
         A2kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSltSZXbi3BKv/vKfnP9A61MdIYgHiC/B5riXDS0gd1gunu7vJtxjLsNXPOQCrAXqXeYk0@lists.linux.dev
X-Gm-Message-State: AOJu0YywPwVGnjI1B0oeRA/dZYM8HCEg6uNMbdy7gynjikpWHCSRfokQ
	34BAnIPV+JEabcXP/C1TS5wJePmdsUmDovBk+6poiTR6EZhSYTlCC7zR
X-Gm-Gg: ASbGncsZYGAKRj6RvijydnoFt4lms0wgI7wwB9YhodKmIEq8Ja9WJVfotWxEsYtpaTM
	LZ9/gJlrX3hsKYiPnN4tUYbSrmVq0L4Ikvd6Mm7UE8DvD88GGIX8IEiEfqtuXfpFsxb01EVEoiZ
	VgPStnaI4jJybONjtg3vs5LJ/+a7LE6ls3mUls26Lr5yi497EUag6XSb/t7ePBKL/QtK0O9VkIE
	M3ps+LZmNNAe2JCULJPUcYZDP27vet4DjRiPzh8QRImwm+d5lPKwVjqkj6/YFIefW51URkoyy99
	kIFmFPPOKuPsNjRZUwdHVwSh3kB92OexcOwEA2eC5pAfI0N7cjPPJ0C+/klo76JH9JU//aaN6j2
	Sx7FeAaN+neouIq2yESgyao6QPHU9
X-Google-Smtp-Source: AGHT+IG0ZHDqFJrZOvYs432O3Vs3qhLTPiCHHRZ6amJmNF+g4TGNvnUA39X9wjADrt/48NlD7oC1jQ==
X-Received: by 2002:a17:903:90d:b0:268:baa6:94ba with SMTP id d9443c01a7336-27ed4ab65b8mr155433085ad.53.1759180446950;
        Mon, 29 Sep 2025 14:14:06 -0700 (PDT)
Received: from y740.local ([2401:4900:1f31:e91f:2d6d:e8a8:f2d7:94ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed69b12cdsm137943045ad.115.2025.09.29.14.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 14:14:06 -0700 (PDT)
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
Subject: [PATCH net v3] selftest:net: Fix uninit return values
Date: Tue, 30 Sep 2025 02:42:42 +0530
Message-ID: <20250929211241.55701-2-sidharthseela@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix functions that return undefined values. These issues were caught by
running clang using LLVM=1 option; and are as follows:
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
Fixes: 959bc330a439 ("testing/selftests: add test tool and scripts for ovpn module")
ovpn module")

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
-- 
2.47.3

