Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8101FA0
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 00:01:56 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-31c8a5d51adso55970927b3.14
        for <llvm@lists.linux.dev>; Mon, 11 Jul 2022 17:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=UbrLjyWpKURQ7kneERVRt0vmSfJ+MsRa3+RTDwDzOxA=;
        b=jdWIDsW9ls7D7eFnaJ5VssudCChz11UFAzuZQnxj08R1Z9BiucUqCJcVSh5MVFtunZ
         L4MylUfu6alwXORkkAo1DszTi9QfNzAm42cOQegYHAjN/q1amRTV+8R7BIdQo8A4SSon
         36jRzbUdC2AnH5qSgAslRoGRgZ4eseqM31OJhjacC2A0TzAuFIn78BaYEf0etG9MYVIE
         hDshcWnkoH9H5L8TBlJNL7KYyfbZEx2wvMYh96KoWIOEnc/NV5NjsjCmVeOhFUSpi44s
         BjopRFaRdmOAMzR86n0mPPiJxcEDhh51Dvnlbw6UcrrH833gdBMRnaou5wf1bmFFzYiE
         5hqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=UbrLjyWpKURQ7kneERVRt0vmSfJ+MsRa3+RTDwDzOxA=;
        b=uFEBFnhf0N8A9tJDxbuybzLE96JToC2Y3wgZL+y5M2jCsTRBWqSlwQRlDWdg/UNT6F
         dN2zmqnte6eRG/bxYy6D3jZEWU04yckRC6oMLwOiLKrt4Dj2rpl/OxB8CeMzBL1xSsJE
         xjQZ6+G6e18am7x5P07wtuITp0yBaD5tyPAsUmIKBJScS02d0bvS2fOLpFaZuITcj6/9
         6xCEevMTI7z5m30vK/8pW6E0FGPq06xtjWB48eRK4thoyoUrnqgnjR31sAjBIvylVMa+
         4PAZEcDnHChxVp8qo2E1HN7LA9fn25Ke1O7HooMy/X0zZoyCsQKtXxwIt+T+sB03GnQa
         Ua4A==
X-Gm-Message-State: AJIora+eM6Qsa9Pm0m3H/JmChBcbGrEM1MLcla2TlfG/ckeqC2BSPcNP
	NdZajmg8KuhoDHTrM9vwqX2TsJHGw4KlvLLhOg==
X-Google-Smtp-Source: AGRyM1vhb3Soxi/cqk9BCGRX6HlpYhwrheWS5s0NH23TJeWILjzFPIzs7xMTniM2mVE0SHcCCGoRb7agVcrJWq3stw==
X-Received: from justinstitt.mtv.corp.google.com ([2620:15c:211:202:4bd0:f760:5332:9f1c])
 (user=justinstitt job=sendgmr) by 2002:a25:e7d8:0:b0:66f:5d93:d750 with SMTP
 id e207-20020a25e7d8000000b0066f5d93d750mr4234302ybh.216.1657584115692; Mon,
 11 Jul 2022 17:01:55 -0700 (PDT)
Date: Mon, 11 Jul 2022 17:01:52 -0700
Message-Id: <20220712000152.2292031-1-justinstitt@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.144.g8ac04bfd2-goog
Subject: [PATCH] nfp: fix clang -Wformat warnings
From: Justin Stitt <justinstitt@google.com>
To: Simon Horman <simon.horman@corigine.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	Justin Stitt <justinstitt@google.com>, Fei Qin <fei.qin@corigine.com>, 
	Yu Xiao <yu.xiao@corigine.com>, Yinjun Zhang <yinjun.zhang@corigine.com>, 
	Dirk van der Merwe <dirk.vandermerwe@netronome.com>, Leon Romanovsky <leon@kernel.org>, 
	oss-drivers@corigine.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

When building with Clang we encounter these warnings:
| drivers/net/ethernet/netronome/nfp/nfp_app.c:233:99: error: format
| specifies type 'unsigned char' but the argument has underlying type
| 'unsigned int' [-Werror,-Wformat] nfp_err(pf->cpp, "unknown FW app ID
| 0x%02hhx, driver too old or support for FW not built in\n", id);
-
| drivers/net/ethernet/netronome/nfp/nfp_main.c:396:11: error: format
| specifies type 'unsigned char' but the argument has type 'int'
| [-Werror,-Wformat] serial, interface >> 8, interface & 0xff);

Correct format specifier for `id` is `%x` since the default type for the
`nfp_app_id` enum is `unsigned int`. The second warning is also solved
by using the `%x` format specifier as the expressions involving
`interface` are implicity promoted to integers (%x is used to maintain
hexadecimal representation).

Link: https://github.com/ClangBuiltLinux/linux/issues/378
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/net/ethernet/netronome/nfp/nfp_app.c  | 2 +-
 drivers/net/ethernet/netronome/nfp/nfp_main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_app.c b/drivers/net/ethernet/netronome/nfp/nfp_app.c
index 09f250e74dfa..bb3f46c74f77 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_app.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_app.c
@@ -230,7 +230,7 @@ struct nfp_app *nfp_app_alloc(struct nfp_pf *pf, enum nfp_app_id id)
 	struct nfp_app *app;
 
 	if (id >= ARRAY_SIZE(apps) || !apps[id]) {
-		nfp_err(pf->cpp, "unknown FW app ID 0x%02hhx, driver too old or support for FW not built in\n", id);
+		nfp_err(pf->cpp, "unknown FW app ID 0x%02x, driver too old or support for FW not built in\n", id);
 		return ERR_PTR(-EINVAL);
 	}
 
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_main.c b/drivers/net/ethernet/netronome/nfp/nfp_main.c
index 4f88d17536c3..43b9e75a34a5 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_main.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_main.c
@@ -392,7 +392,7 @@ nfp_net_fw_find(struct pci_dev *pdev, struct nfp_pf *pf)
 	/* First try to find a firmware image specific for this device */
 	interface = nfp_cpp_interface(pf->cpp);
 	nfp_cpp_serial(pf->cpp, &serial);
-	sprintf(fw_name, "netronome/serial-%pMF-%02hhx-%02hhx.nffw",
+	sprintf(fw_name, "netronome/serial-%pMF-%02x-%02x.nffw",
 		serial, interface >> 8, interface & 0xff);
 	fw = nfp_net_fw_request(pdev, pf, fw_name);
 	if (fw)
-- 
2.37.0.144.g8ac04bfd2-goog

