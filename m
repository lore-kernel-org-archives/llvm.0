Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9C6318EFF
	for <llvm@lists.linux.dev>; Wed, 15 Jul 2026 01:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784078082; cv=none; b=FoR50BRKmWxnI8GpfOoxNSGlpH1JYtPcmXTitYotdgOwaLJLZtJ4aPKERHN8XvsbpZu+zzs94U4cjMFjg3N3GlPSbiuEsus14ExfY9diieY0y5i+pdDzxV9WxWlV4J2qKDdYSphCZ7E6Xc5g4UIpR2yqkw2NzOMwxi5jp88skas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784078082; c=relaxed/simple;
	bh=/cAePJoFLFQ0qWUgua+YcI2anEkgrMTozN9FQTusvEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h/YjqEJue+efvBPlGteJIfUQk3oUn4TO765At9YhLvgxsfTo/Qd8KlE8xe7//2rnunFdCmsseo5WHztizdGFeb2y7ofYD6WfgxFs9z4Nap+2DNb5+UuB/eJq0hYiENNtIKtly4vbkCgynXEdXk8vyCxiCVI0RTk0sJ+rXmAabws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODqTX+pA; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODqTX+pA"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c999f162c9aso2960395a12.3
        for <llvm@lists.linux.dev>; Tue, 14 Jul 2026 18:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784078081; x=1784682881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ZKIboljlMl2BHS7OS/1CYKXR7VTo24iT4oUvOKxEkI=;
        b=ODqTX+pAQ4nI46q/0Kst43foZorYOQrE4df10SUPpnnJqwEnzZ+uQbn6YSCDeX/0XE
         iaZKM2vqMCFn/l0JLHe1NxHjdCy4bsDmQvNInUOMlo8iRFexQRlu+LkP/9pa85XoxCZ9
         K3iqS5HCovJPo+nRXAnY+ctvNW8jbp+t48mclgK8Z+DrpUr3ZQo3S3VrRh5RllSJ2V3Q
         8yF71GcF1NcWUMNCVtJusbHvVxWSbTmagKi304e9Wiix9YDYg3QoyHYFtw8dafEnywu9
         kHkefWcCM1dfTdCd6hcCWHpfd12HorHzxQF+Zxan0y+i30/1FiXetjm1PkokTejw+5Ic
         U2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078081; x=1784682881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZKIboljlMl2BHS7OS/1CYKXR7VTo24iT4oUvOKxEkI=;
        b=FSPwSPWhGtP6RID1Ew118BFbc4IwqAYBALztRRkIf+9mhVD49h70kqz7wD+tyHmbPK
         yn79MxfSeTz3RX1JggvHzV7zzcX4pPV8bt1eYHRgbap9HG8mkCCxcxJVpINC2/P5Edp1
         j2pO4Sbm1MdpDfsn7fDKJSZa86IWYKmTq+l7JClGkUi0W3skPxdnZBHe/80KMKiatKgT
         dl/KAi4LKWAVZO6PWy7AY25o2ZwNlOP8zNJRqAWPfVYHFCwe/4vt2OVutjpAyrnf0kuo
         rumQmXRkU0CmAIs9OPQ128FyVh8B4wIbF1CBeq29RMhz/i6A3YYkWPDGioZAgh6f2W55
         HLfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq64BMq1VcJZK0cgAyQpHMZRGzIDFTMZxTFROr5/sVec9AFFw2NZQBSlXplfsp8Ast5L5fx@lists.linux.dev
X-Gm-Message-State: AOJu0YwkJu12sLie2yfOLGmivTEnkfFG8KtsQdY6pYKJM7mIPGJPNx/B
	TFLueSuLbhklvDdgtZWP98Z3DLnik8eEdqLk69yVssR5jnlp4rNhYQcE
X-Gm-Gg: AfdE7ckf8MRUwXxha3t5oEv/OclLKsjzJ7gNpMf9B0m6tW4BSxPS4ooswWsAQBqssjm
	Mr+F9jO9sQSboPFZcmXzM77mk/g9AydMwo1p0ly/5A60d4mZM3WXeBubod7MK7OpOcFkA4bfWad
	UMaEpMtDXFMOpnPdISj85zOxXD5HRsGP7Tsq00l9633HJQxQ/cSWxVoJfAFy1U1qK5TiLJDgx1W
	OXB6aNskjPggDD+FvwC6V2RCjizJ66O2w9eKdMx6WFRpa4rmS2TrJDi+V48AhjEbfoDnYje93ER
	zeo2NwShKtU448CmsnOXY3LpV0heUMaAtXr7WN8s/RE0GfIZUID8ggecbz6iCEMe0un3p3ph+Dl
	zTlEGm6c+t0iNsnXU3+MuWK9S8KSblJo3i673jr8p2H8gjauyqVDpxfRKoHIDkZz4BI7xVAwRKa
	wd0HZqBx/1Q529Ke/hqipOF7xlEaoXfcjvS3JHM+agNrLLd1RbL9osmOYgVb7LgqDiui+wyfhMw
	+USnvfkUPDdN97+r3kMfCOMkxVvrUXIaHqXNy5GRUc0L8TOMkXHtWohK5djcGMPGg==
X-Received: by 2002:a05:6a21:9203:b0:3c1:142e:762d with SMTP id adf61e73a8af0-3c34d5299f3mr7430640637.1.1784078081000;
        Tue, 14 Jul 2026 18:14:41 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3c1f77fsm10621994a12.32.2026.07.14.18.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:14:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-ide@vger.kernel.org
Cc: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] ata: sata_highbank: use devm_platform_ioremap_resource
Date: Tue, 14 Jul 2026 18:14:38 -0700
Message-ID: <20260715011438.1274211-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded platform_get_resource() plus devm_ioremap()
sequence with devm_platform_ioremap_resource(), which fetches the
resource, requests the region and maps it in one call. Switch the error
check to IS_ERR()/PTR_ERR() and drop the now-unused struct resource
pointer.

There is a single IORESOURCE_MEM resource, and the SATA PHY registers
are mapped separately via of_iomap() from distinct DT nodes, so the
region reservation added by devm_ioremap_resource() is exclusive and
does not introduce overlap failures.

The mem-based ata_port_desc() line is dropped along with the resource
pointer; the remaining per-port description is retained.

Built for ARM (drivers/ata/sata_highbank.o) with LLVM=1.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/ata/sata_highbank.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/ata/sata_highbank.c b/drivers/ata/sata_highbank.c
index 3421039f4bae..a0b6e197cfb5 100644
--- a/drivers/ata/sata_highbank.c
+++ b/drivers/ata/sata_highbank.c
@@ -455,7 +455,7 @@ static int ahci_highbank_probe(struct platform_device *pdev)
 	struct ahci_host_priv *hpriv;
 	struct ecx_plat_data *pdata;
 	struct ata_host *host;
-	struct resource *mem;
+	void __iomem *mmio;
 	int irq;
 	int i;
 	int rc;
@@ -463,11 +463,9 @@ static int ahci_highbank_probe(struct platform_device *pdev)
 	struct ata_port_info pi = ahci_highbank_port_info;
 	const struct ata_port_info *ppi[] = { &pi, NULL };
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!mem) {
-		dev_err(dev, "no mmio space\n");
-		return -EINVAL;
-	}
+	mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mmio))
+		return PTR_ERR(mmio);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -488,12 +486,7 @@ static int ahci_highbank_probe(struct platform_device *pdev)
 
 	hpriv->irq = irq;
 	hpriv->flags |= (unsigned long)pi.private_data;
-
-	hpriv->mmio = devm_ioremap(dev, mem->start, resource_size(mem));
-	if (!hpriv->mmio) {
-		dev_err(dev, "can't map %pR\n", mem);
-		return -ENOMEM;
-	}
+	hpriv->mmio = mmio;
 
 	rc = highbank_initialize_phys(dev, hpriv->mmio);
 	if (rc)
@@ -537,7 +530,6 @@ static int ahci_highbank_probe(struct platform_device *pdev)
 	for (i = 0; i < host->n_ports; i++) {
 		struct ata_port *ap = host->ports[i];
 
-		ata_port_desc(ap, "mmio %pR", mem);
 		ata_port_desc(ap, "port 0x%x", 0x100 + ap->port_no * 0x80);
 
 		/* set enclosure management message type */
-- 
2.55.0

