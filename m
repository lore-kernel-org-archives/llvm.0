Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806A276038
	for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785460901; cv=none; b=iXfrjSpcr97BfDS4ND5mHX9QcfqW/Axu5jEgosCpRq0fIuIbt4jTgxE7sgE+Hdlyk6rM2xLw4mBUvFdIzuR+pRH4yq8J8IG2vcs9dA/QP6ZPXcAJFBfb0rDPVSk0UIdEtTrlff4PYQyVw3LJwRAnKEykpntOyh/zI2Hc0vsJ8jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785460901; c=relaxed/simple;
	bh=xsFVWzxEmP1xtSwF4J0aOwtU5FsqXzYKJ4uqEQVsIDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LP4ElJEiIyhXwwqk2nJp+/v8xO/hNxmjWQxdKUG8JZDP/RM3xwPBASBf9TgV+ttumy+PjuNoD9GmBkDl7EijjDWy1WV1X4hOVmbDZflWSSNQfDc0FIf84gQA8qkXtpzWXSayeiThlYw6guA6iBuDH+p0FKEOMx1PlL+V098F7+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oiafnBUj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oiafnBUj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so316279a91.1
        for <llvm@lists.linux.dev>; Thu, 30 Jul 2026 18:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785460897; x=1786065697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jg8//SIb3wCfw25zWTdBtLReUkKBuqQ+hnflSQ8n1KE=;
        b=oiafnBUjtZJzMYSuj1BLInF82mZ0PY79XO47YUR0coy8TMqBeFODioPuF8lvxtC4Fv
         n8IeEJRbBvqTsGtCZS3CFn1WTQiSf/vgQT0dNhs8D9QWaftXJP+I/3SuSqp22beTYgWw
         i/nMx40BbTU+9zN4uKhrkx5O6sJ8z3fg17ZAtlcZpi/kp0nOOVaXJO2r66j+S2xKEVbe
         NPWtgLxPx5fxnwq+abWLibkZ7cE0IJnvDpkMLpdRifGBtXfPE7aqH3jw+RblVA1EvoL1
         r7i9B1gQkgP/Ul0xAnjD2OdfMQMfehKYs16E/UC4ZgF8dHBpM9MZTqWaIYxA6Udh4MND
         0GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785460897; x=1786065697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jg8//SIb3wCfw25zWTdBtLReUkKBuqQ+hnflSQ8n1KE=;
        b=GJcIZUPopGNcaWhaVfLBEPjFXpoCM7OQo4KHuJYIr/Mw/rN7kWFqG/wJJUMz+PhF5l
         yIM8gljquIYNatZGK/ErWl7j/y1exitLaRS19vL9IRz984z8Nfd4SmpPN/rhojjc71HV
         AuYhpS4EC9fjq1N/mdjQ+iEEo3INC3E5OFbLTEH84U9bY8Nndlo2NsBF9Nu0NwF3vaNt
         HwN/jZSynaKbsgx7xOH2KY7ZCZwDPk8ZAdH+UhGCfS68XhmTv2e2eiOrbprv0lNkGgJR
         cucrGt9nYCWxd4BV3rObxShs4aV2a1+J1KrPoKDL6CxrYAE3teOjv/vjBSrXRLwIJvxu
         f75A==
X-Forwarded-Encrypted: i=1; AHgh+RqGDxRhpB3BvItLkjy9ogIG6Pb5vZoNcWvleDBEKb4lorHMowupByQA32bV1TmIs5sHDp4C@lists.linux.dev
X-Gm-Message-State: AOJu0YxuffYv2zfxYXyU/2GI/bd1BQERFuBECxw5UF9ETcPB7kZRdxP3
	zNTOK/cniDa2vf8buFiu+dP9iQ44qbAYsmduejgAHI3hleY07L5o0GNg
X-Gm-Gg: AR+sD11kts17DWWPCepxHLn7Dfr2ZJze818keotgAA9Wx+suJKJvS1d1ks1amrTg/lB
	D4Y9+risM0bR7JQzfKuDPY97PLnkut3mwZHxr1cY3xgF4m3+39XGNT/UYPGrvSQrOpZs/T479M9
	XED8URbP0lnu3tCiqzJ09tTvxL4RORqQJUmaG5/v2Lrzr9k22tCX1t31Wql07reezbWZ+5niVDG
	PamTt9NGXzCKyJ/mN/54XWK7PaINKJvrRtaUPk9Pp7wgKOzt3amygU5BLRzfO+9HuO62Qdonb6x
	o9abUSnJ8DlSU+KxDdu8nopTBHW+LGBLzFqW+8etJ04yId16wTOl4azXIYvC6A0THRmQJSawSlH
	tBRdo5vqJgofn9RVxe+0oi1zkUzYlqBU2FJBxULgqXt5Mc8fYNVt+/5YtLXNFZqPB9J3m1PME1/
	lW4tmrbu+FETW+Wsm44E5+NyfP/KzDZINiRqKEc8rk0ynnoo00CTrP6zNaMsi0s0XCPdsLhsp3j
	LKeK6CAGEgFhtKO7fWda4M1XCbwZq+EMW7mh/LVmZQX8QL+Uvz+/6PpAk8tNBCSVr5YBkw+V083
	cFfQ9raeHJg6UTyOTEl38JEPL7axA1RxadxYWg==
X-Received: by 2002:a17:90b:1650:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-38fb11368d2mr135362a91.4.1785460897057;
        Thu, 30 Jul 2026 18:21:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38facf50124sm198867a91.3.2026.07.30.18.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 18:21:36 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-edac@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	York Sun <york.sun@nxp.com>,
	imx@lists.linux.dev (open list:EDAC-FSL_DDR),
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 3/3] EDAC/fsl_ddr: restore MC error registers on probe failure
Date: Thu, 30 Jul 2026 18:21:30 -0700
Message-ID: <20260731012130.1212640-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731012130.1212640-1-rosenp@gmail.com>
References: <20260731012130.1212640-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fsl_mc_err_probe() clears FSL_MC_ERR_DISABLE and, in EDAC_OPSTATE_INT
mode, sets FSL_MC_ERR_INT_EN to enable error reporting. If a later
initialization step fails and jumps to the err/err2 labels, the cleanup
only frees driver memory and does not restore these hardware registers.

This leaves the memory controller configured to generate interrupts while
no handler is successfully registered, which can cause an unhandled
interrupt storm on the shared IRQ line. Restore FSL_MC_ERR_DISABLE,
FSL_MC_ERR_INT_EN and the SBE threshold in both error paths.

Do not pre-initialize orig_ddr_err_disable/orig_ddr_err_sbe to 0; the
err path must only restore registers that were actually modified.
Split the error labels so early failures (before the first hardware
write at line ~~580) jump to err_free, which does cleanup without
touching hardware registers. Save orig_ddr_err_sbe alongside
orig_ddr_err_disable so the err label correctly restores both
registers, avoiding stale bootloader state clobbers.

Built for arm64 (defconfig + CONFIG_EDAC_FSL_DDR) with LLVM=1;
drivers/edac/fsl_ddr_edac.o compiles cleanly.

Fixes: ea2eb9a8b620 ("EDAC, fsl-ddr: Separate FSL DDR driver from MPC85xx")
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/edac/fsl_ddr_edac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/edac/fsl_ddr_edac.c b/drivers/edac/fsl_ddr_edac.c
index c505fb268474..139277c4e2f0 100644
--- a/drivers/edac/fsl_ddr_edac.c
+++ b/drivers/edac/fsl_ddr_edac.c
@@ -577,23 +577,22 @@ int fsl_mc_err_probe(struct platform_device *op)
 	pdata->orig_ddr_err_disable = ddr_in32(pdata, FSL_MC_ERR_DISABLE);
 	ddr_out32(pdata, FSL_MC_ERR_DISABLE, 0);
 
+	/* store the original SBE threshold */
+	pdata->orig_ddr_err_sbe = ddr_in32(pdata, FSL_MC_ERR_SBE) & 0xff0000;
+
 	/* clear all error bits */
 	ddr_out32(pdata, FSL_MC_ERR_DETECT, ~0);
 
 	res = edac_mc_add_mc_with_groups(mci, fsl_ddr_dev_groups);
 	if (res) {
 		edac_dbg(3, "failed edac_mc_add_mc()\n");
-		goto err;
+		goto err1;
 	}
 
 	if (edac_op_state == EDAC_OPSTATE_INT) {
 		ddr_out32(pdata, FSL_MC_ERR_INT_EN,
 			  DDR_EIE_MBEE | DDR_EIE_SBEE);
 
-		/* store the original error management threshold */
-		pdata->orig_ddr_err_sbe = ddr_in32(pdata,
-						   FSL_MC_ERR_SBE) & 0xff0000;
-
 		/* set threshold to 1 error per interrupt */
 		ddr_out32(pdata, FSL_MC_ERR_SBE, 0x10000);
 
@@ -621,6 +620,11 @@ int fsl_mc_err_probe(struct platform_device *op)
 
 err2:
 	edac_mc_del_mc(&op->dev);
+	ddr_out32(pdata, FSL_MC_ERR_INT_EN, 0);
+err1:
+	ddr_out32(pdata, FSL_MC_ERR_DISABLE,
+		  pdata->orig_ddr_err_disable);
+	ddr_out32(pdata, FSL_MC_ERR_SBE, pdata->orig_ddr_err_sbe);
 err:
 	edac_mc_free(mci);
 	return res;
-- 
2.55.0

