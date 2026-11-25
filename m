Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645496;
	b=pF3SyGQJg+wBB7u8zSo1zoypwfsvnmqLXKMZEH17e3n/tvP0v52hYv/Lb1Eb98ZodSWb
	 DMAtOOOKGyX+jYmBVaKi337RyUJJ4cRxw5zLNEFnlTF/Ct0NwgI4s986al03x19VEPSvb
	 wjOvc0fBSEBOhJnAPvgkjKolXn8Ed6SgPrrW7Nvu6G5kjUcGe7EwW9grKyvSQqafcSREP
	 +HPHcRRnONn0inXLWTMyAMin3rg8oo5GRmpGn2SEhcAjzbPBfRKbm5WtddEgRxvEKtbuz
	 grirwetecYjKUpu7WgNQA1syEdG74yzKGde+cLmaZcqKwp9o1W87rB49m7/nWKfprBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645496;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=StPN5XiJsDNFXskzUTREunGJkezS8LFSBeJOfH/7nFE=;
	b=vooevlkmf6w2I7bg9Qnw6ycPWFNHnyF9V8ApsSjm0xHVIPh9n3kxo3c5I+NYjln1BhUG
	 Rg64lcsvpXSVHQqIn/U9JX2JvlfzEz0A+gg9gfKizdIuSuhhh5o8RD7MydDzYpzRLnEUU
	 hd+mm7cOxtXActsiWfmaL2S12Ak76YqM9kVDqxN5upapOFpNSM9DH16ap8Gt1Ex71qKNv
	 ig7RAuLIui9/2ebNZUQdzuS6auj0SQt06QC/XwiemyjWjhlVMngG4Man40MNpeo+BY3Hn
	 rsD2H2U0b8hjc4lOJ3G7OHjxb/hPzstgnqxXFdbOULVXAzdVBo/NY1pfts+l6FRabxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FkpvrKnE;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB1606A32E
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0FB1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FkpvrKnE
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386a0f79047so6681138eec.1
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645495; x=1796250295; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=StPN5XiJsDNFXskzUTREunGJkezS8LFSBeJOfH/7nFE=;
        b=FkpvrKnEYSH6QCroVZU78yapBDt23P2nqO/p9TXryf0uAGadhn5CE5gCUxT/dJRzyh
         0eK7PaFzUOqPXHc4Df8kofQYW/Q7xfgSob4ron6kKgiCnlaXPTLCf4dmhemMBZlw4ih/
         2j1RfqtQ6oTn5echrz5cUwm7tTNFYdMYD/w5mAxnYleTC+gFDlUN7MdAnh/J4vC12Ccj
         9HS76EpAhtZy991pp9u6TyWxlQvc31PeDpEverBeoC44vkLeT9PuhFRsai6Nfsyg8hJ+
         wrZsTqcPtGrIvGwlzBe1keXONWoPWnGF/v1yHmuMIUWYUx+wP5DB63IjAFoLgnAWleQo
         XTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645495; x=1796250295;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=StPN5XiJsDNFXskzUTREunGJkezS8LFSBeJOfH/7nFE=;
        b=fIv5SeFYcgjSpglooBL5KpY1y4WYVTGults25yTw9NM/VVcWYMFrL7zUvDpxm4k08e
         mEFho3shHFJT9gBpthnc0bDN9NYRBdLqiw01JSU+sK9BoX/3srHzVmn0rQuaU4RZODMD
         p7B9Atm0R545Ni6Qtf4yBDUZ+2VTPHWrUCvJCZsGAGPkwwRH6uIcqZgUDcTNH3Uu5bI6
         TS0QtAWzzM27+OKycRxJ0nQrFS4wylu7Uku8xsV7buoC97FXJvuHitXlq3aeVrZ8SR1v
         IbxFebo1+INo0lKTo4zpPOBiXmK2PYaHcLDrLV0TJmpNnrRgZLrYs8EP4yZt7zK+e+3J
         /MGQ==
X-Forwarded-Encrypted: i=1; AL+hErE6RerOIfYL3BiK6RVoj/iGsUPICW2XIWTMGVz4aHJHdkHYfA5TA6ZVR1GN46JH7tk+2Yxl@lists.linux.dev
X-Gm-Message-State: APuU4Z8Wp2C6Kl23BqQjm6c/YFuD6IacybdlS6vcKqFqvyYPItEDsD0F
	l/byMW49hUyNOwGSOKH/ulhANbyziMD2mbl6p95cqk340eoKOCbBJibb2q5JBAqWk72YXLNVBDk
	jEg==
X-Received: from dldz13-n2.prod.google.com ([2002:a05:701b:418d:20b0:1a7:3390:92b0])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:1708:b0:1b2:3742:828e
 with SMTP id a92af1059eb24-1b5567b21c1mr17035858c88.3.1795645494904; Wed, 25
 Nov 2026 14:24:54 -0800 (PST)
Date: Wed, 25 Nov 2026 22:24:42 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222442.1443878-1-elkin@google.com>
Subject: [PATCH] iommu/vt-d: Initialize prq_complete before requesting PRQ IRQ
From: Elkin Cruz <elkin@google.com>
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In intel_iommu_enable_prq(), request_threaded_irq() is called before
init_completion(&iommu->prq_complete). The interrupt thread
prq_event_thread() invokes complete(&iommu->prq_complete) upon receiving
events. If an interrupt fires immediately upon registration or after
enabling PRQ in DMAR_PQA_REG, the thread can access an uninitialized
completion structure.

Move init_completion(&iommu->prq_complete) before requesting the IRQ.

Fixes: 66ac4db36f4c ("iommu/vt-d: Add page request draining support")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---

I am trying out new Clang static analysis checks for kernel bug
classes, and they flagged this code as possibly buggy. The findings
were triaged/fixed and commit descriptions were drafted with help of AI,
then checked against linux-next (not runtime-tested on hardware).

Thanks,
Elkin

 drivers/iommu/intel/prq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/intel/prq.c b/drivers/iommu/intel/prq.c
index dddd3b51b657..7bf22ce7978d 100644
--- a/drivers/iommu/intel/prq.c
+++ b/drivers/iommu/intel/prq.c
@@ -318,6 +318,8 @@ int intel_iommu_enable_prq(struct intel_iommu *iommu)
 
 	snprintf(iommu->prq_name, sizeof(iommu->prq_name), "dmar%d-prq", iommu->seq_id);
 
+	init_completion(&iommu->prq_complete);
+
 	ret = request_threaded_irq(irq, NULL, prq_event_thread, IRQF_ONESHOT,
 				   iommu->prq_name, iommu);
 	if (ret) {
@@ -329,8 +331,6 @@ int intel_iommu_enable_prq(struct intel_iommu *iommu)
 	writeq(0ULL, iommu->reg + DMAR_PQT_REG);
 	writeq(virt_to_phys(iommu->prq) | PRQ_ORDER, iommu->reg + DMAR_PQA_REG);
 
-	init_completion(&iommu->prq_complete);
-
 	return 0;
 
 free_iopfq:
-- 
2.56.1.839.g22a8290db9-goog

