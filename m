Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B845B498904
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788903220; cv=none; b=SZuGINmWGxEW9ZXidfnmCvQ8dlxjIJM3535osiamUI1EMVDSky9fjdWKEp2VTPl9ZoQo8PRrIw8YdOSie/CFUzSIuZnc8prbEmFElmAfyPkP6kH1tKiO8GmfuX3pOKJxRvgpXxqM94rPgd6vIVWCaUrAGkh0ARoGi6yHbI6px5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788903220; c=relaxed/simple;
	bh=gQYMQIZ0a0qQpuJQGl9sxe6tSFIiwDa+pVKYc1H04vk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVCsHJ+YMXhVdUgj2ub/9sHTqWe994+MS18/dtvpjYP4F0kfPC/zuPOIIH8thk6e1fOsRggAVNDREso6zpNQi2b4gemvqJfcdvy4V8qxMfBYRiTgEv5Q2yYY2kgocGf3l+ZoRaPUJd76eKpxOexlAoKbU2jfCmLjE1EW7LzSQVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT9GmtMS; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT9GmtMS"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39b2ad862bdso5624175a91.2
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 14:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788903218; x=1789508018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yHiWJUkqXIHHnljOBGvidp4XfKDa865c5NPgCl6nJgk=;
        b=JT9GmtMSmDbC7myLdSmleGvFbiVJVTfytLgk44CIHMiOQv3rhvR+revDDhtnCLv3Wb
         lqyrQWXsawjOc6KIsmecpeNzHMqo2EqUqBaQNoFHZccbKoW3Axs8ZaQGggDOKDcIp0N7
         vKbKHG6/gIeY+/HIwmM9QKJr9BpBbILvHmxyyKmhhqFIO7f5aAPqeu0daByAa1a3ICc7
         brA59fgyZ9G2C2ohvWw1Pl4ZT19m1aaiNIVmKuQ2pqzo7Mic+W1GzjKgQhkd7QPglNF2
         aWY37ua4pxZ/MoYh6utiVtZU5CKFtPf2skR6zx6jz6T1OCV1N1OJ84LIajMIYvJ6VzmX
         ARmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788903218; x=1789508018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yHiWJUkqXIHHnljOBGvidp4XfKDa865c5NPgCl6nJgk=;
        b=RXgyA6a2oiQByRHUIZxzQgGDVDy45qyglEZjpfHqPi38fEMmcu2FvKHCB03yR2xR0/
         HO8t+HhkBxZnzB4VkYAcYlZ46TmR8+SiHMBUBXp+/ojwMZgIuqj2KahQdGCfhhSvxX+9
         whQqSRT8rR//+0NPxcSgmku02mkvBqguf2LCxxv3y81AyqHQ8ZLfrXdceCfRDkYJfnOh
         awzZ1OLBF3lTNHttKOBWoJFGPJow7mpZrJJLflcfUOnayNPsoD4O8dNi4GDPhiNKUyP1
         SVSq+/C79zX7q1mPvZrGNjGscW84jhQrhBarPHZuIUrFV8APotFi2D9xWNrd8OcFnMvl
         aYOw==
X-Forwarded-Encrypted: i=1; AKwUvByt9bu/7MbhCZ8vFuPU5GfXZzVj4x49oLnwQsafscT0Ri6TSEvd1q7BgBFFd/HgUeL00feB@lists.linux.dev
X-Gm-Message-State: AFuF++nZ3TXH65qoo6MIe/N4WV+tRmWqBwmhG5LkSqcC7V7Q3EusaPJo
	jGD02R6VzSqgvPYpwr9Gg3Hg8pXblw0kc0gy4JE+RmmORgB9Icb3hY24Ml23Fw==
X-Gm-Gg: AYBFou2CG5KpMwc4MHam0yvZurkgZesMdvns9h+rFWGg9C6n90/pkznWjUYaeTSdxha
	Eomlz3vsHG9O8YcxpD7V0fo1Sj4r4JMavP74piEMyRBSPVRVaYc6Q65/E3Ych0Dvo99fOg/fh1u
	X4v6XXFDwrIm9GEL0ip+K2XVynIWlcuMyGWKJaB93L/wzp8oP+o91mg/UFa42hMjxe4eROqlK8M
	7o3G+GAJzPfUl74MX1oiOiWt95ZMITxl9zyMrxyNeQoMv09QX4GWhOAjyQ0RE94qxHOWYi7Cg6b
	kdcl/jxxov0JcSMC0j+YqvBDzsPgQZaQzfv1xw1y9lnD+HTireGRvrpSdz3PunkgG5Wp+AfobMX
	qvQJwllfz3WcrBIiWSokOpiC9lfUHYw7sFDdXgndBwtp1hD0DIMpTOCNRbQCnScsLXbBCOV+Mat
	SOZ4poSpyfXWeZo4EVocDrqRMxThNcxOyuWWDyyqeb3w0m5J5sBzCuETeyfaYUh67Chc8wclYTO
	TZIEW5PtRxkQ5zz4iNap10HGVhlrPu2G2LHWrp7OcAjKSqIFfX2i1rnPCm9/0jxdHbaxPwS90o0
	B2KdMFXumuNZnDh49JKyBEY0fohgtxpQFeUx5Q==
X-Received: by 2002:a17:90b:4c41:b0:398:9bd5:490e with SMTP id 98e67ed59e1d1-39b2623ac0fmr46132348a91.21.1788903217940;
        Tue, 08 Sep 2026 14:33:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b25f8d2c5sm28700771a91.2.2026.09.08.14.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:33:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2] dmaengine: bestcomm: ata: drop unused local variable 'inc'
Date: Tue,  8 Sep 2026 14:33:34 -0700
Message-ID: <20260908213334.593584-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bcom_ata_init() declared and assigned a struct bcom_ata_inc *inc that
was never read, tripping clang -Wunused-but-set-variable:

  drivers/dma/bestcomm/ata.c:58:23: error: variable 'inc' set but not
  used [-Werror,-Wunused-but-set-variable]
     58 |         struct bcom_ata_inc *inc;
        |                              ^

Drop the declaration and the bcom_task_inc() call that fed it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: use suggested title
 drivers/dma/bestcomm/ata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/dma/bestcomm/ata.c b/drivers/dma/bestcomm/ata.c
index 502a45d76adc..40126f3f189e 100644
--- a/drivers/dma/bestcomm/ata.c
+++ b/drivers/dma/bestcomm/ata.c
@@ -55,7 +55,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 {
 	struct bcom_task *tsk;
 	struct bcom_ata_var *var;
-	struct bcom_ata_inc *inc;
 
 	/* Prefetch breaks ATA DMA.  Turn it off for ATA DMA */
 	bcom_disable_prefetch();
@@ -69,7 +68,6 @@ bcom_ata_init(int queue_len, int maxbufsize)
 	bcom_ata_reset_bd(tsk);
 
 	var = (struct bcom_ata_var *) bcom_task_var(tsk->tasknum);
-	inc = (struct bcom_ata_inc *) bcom_task_inc(tsk->tasknum);
 
 	if (bcom_load_image(tsk->tasknum, bcom_ata_task)) {
 		bcom_task_free(tsk);
-- 
2.55.0

