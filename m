Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795323195;
	b=aOg3mE5dkpxxU6ulHPOlie2esLBoq+pcGuYz21YP3T+8L80GeCl3sW6ZAnZRR6jYHwhj
	 v1dP4783/9VDP0xaBtR0xohGrn0SOuHi4Ll99WPKF2PZ00aBN7dFK+u+bGV7qN7hgKdXV
	 4J402xcCUQa9TFJewlXnd4rsDjDDLbVtF7nHe48ru1hO59bpDfu+O87fgqzwvSJ1JpWsl
	 EcbDGYMrqZSzbNSeX0XaRyss8+nqaUMsjg1/x6mh9eYMqMcm2WQ3JfVeGDVnb/eKPiRoV
	 Ep5lSR8GWWj426OCYwF5AyNQz+sWbDYO9NJguf5jRLPvKIDtCiYTBi+SqKeV4FUi6hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795323195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=KAzUKzhhhScUAMTrwfyxBtcZxPud2TmkB4S9e7vTEGg=;
	b=tFv6Hm/A3xF/pCJG9b0Kkj/g7p/5oIfGByFq0XNSHsREstSSUXnNaEy531dUjsWPkOqo
	 WgQopPlA1aNoDrwSihT0hy5L68D/0eBSarZGG02KnUqjeoyymSU3TMLG8bkRBTVYdy8ex
	 /cAF+9LbhVV7wb3X0ccdlxG8KmGddl4I24uBy/J4vbGGeiLFORThE7eX+kQ39lqN6A/pY
	 86YCfoQYZXe1Bshmut2+jcJejdTBpnYfq8X7lpk4ryfPVI5AXOWQKd8ao6ZOSUs8Qsuol
	 dJVMZm1JcCB05qkUtkySEmT2KRxTpOqxpdPTXu5BdeWlphVboFbB0RJjoszOPspoSTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3tzaj5s;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7774606A331
	for <llvm@lists.linux.dev>; Sun, 22 Nov 2026 04:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7774606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=K3tzaj5s
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a7af8b94so261815eec.0
        for <llvm@lists.linux.dev>; Sat, 21 Nov 2026 20:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795323194; x=1795927994; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KAzUKzhhhScUAMTrwfyxBtcZxPud2TmkB4S9e7vTEGg=;
        b=K3tzaj5smhcmwt5HzIuvFFwc/YASGgSRCioN/38gYLpNeYUNRuT13QdSEMCN+eVb8W
         iYOdNBXouzZ+7SGqb2mGOyJ8sZSGwJCxNtZG2q998/bNMt9topEYZSFATiZs3HxJMvP2
         4Nx3jvUcbRBd3GUlV/gyexyspaeSj8l/qp00BbZ1LZi6aUu9b4cuoxEvECtVAf/ESyyS
         LNia5iOs+xGuuiPXTIln9K5qsDcfT4nKILCMYi9ZwmIAgLU8xrcbbeQV+SlwPmPlY4OD
         Vr0fk3pCMxObzbG7MUs1oHZsUF3yRY+clYP23lJL4LLUZm3Fi9/fbjqA5bdjRQ05WTy7
         Zopw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795323194; x=1795927994;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KAzUKzhhhScUAMTrwfyxBtcZxPud2TmkB4S9e7vTEGg=;
        b=iBEP/KOExahtjhjGmfb8kU2HSxMC1nEaFRZFSnHSaGokORI/htV4Qo7kcKVhR3Pob2
         tBv2JB5ODOMNOMppuoK1m2cam6lrFTyiFg+kK61oDqVFLKB6GkNxudRT0ZFKTTQbaKXe
         BaZu2UhwwZumn+K7lwIct75U9hYfBECsmRRkUGKcni0yeEDVpsu5gRA9uDBjZY4IPPov
         KYs4BpdnHNSePYja3SYnELkiJOmVYtwjMYvOpyPzU0n47HjQKVRoH0mP+X20i5i4R0cW
         vnXe4clg2LWh0PmFNMf4wJQYhASZwm75Lv0trmwjPDpra9yY/NkMxKku7ynsoVPZTTAx
         1x2Q==
X-Forwarded-Encrypted: i=1; AL+hErGjVrLetsYZOWNSTh7JUwQGmh/tbmuOZ1qOKdFNKp7VkHrgTV+mMvvswW3QUrTe93xUf1Vy@lists.linux.dev
X-Gm-Message-State: APuU4Z95LE6vuTTSr+5P/lUi+Xqq9Rf8+aEPMV1Ww+HgFPVwKXylXC3D
	spV5avgN1/ctJNXObzBCWXOjNyFkpeOKjYnV520F3bqXFPgo5lgvp57QX9OybG0Ps0kJskASZJR
	IQQz3XfScaw==
X-Received: from dybzy10.prod.google.com ([2002:a05:7301:e10a:b0:381:6d21:2e90])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:20c6:10b0:36a:15ee:c20e
 with SMTP id 5a478bee46e88-3869a150409mr4897178eec.33.1795323193190; Sat, 21
 Nov 2026 20:53:13 -0800 (PST)
Date: Sat, 21 Nov 2026 20:53:10 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261122045310.17980-1-irogers@google.com>
Subject: [PATCH v2] scsi: aic7xxx: Check ahc->flags instead of ahc->features
 for AHC_SCB_BTT
From: Ian Rogers <irogers@google.com>
To: Hannes Reinecke <hare@suse.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In ahc_linux_run_command(), the untagged queue throttling check tests
'(ahc->features & AHC_SCB_BTT) == 0'. However, AHC_SCB_BTT (0x40000) is
an ahc_flag bit stored in ahc->flags (and tested via ahc->flags at all
17 other sites across aic7xxx), whereas ahc->features has type
ahc_feature where bit 0x40000 is AHC_MULTIROLE, which is never set on
any controller.

Until now, '(ahc->features & AHC_SCB_BTT) == 0' was always true, which
serialized untagged commands across the whole target via
ahc->untagged_queues and masked a second omission from commit
e4e360c325c9 ("[SCSI] remove aic7xxx busyq"): ahc_platform_set_tags()
sets queue_depth to 2 for untagged devices ("even though we can only
execute them serially on the controller/device"), while SCB_64_BTT only
stores one SCB tag per (target, LUN) slot. In addition, sdev->simple_tags
remains set on SCSI-2+ devices even when aic7xxx disables tagging on dev
(clearing AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED).

Check both !(cmd->flags & SCMD_TAGGED) and
(dev->flags & (AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED)) == 0, return
SCSI_MLQUEUE_DEVICE_BUSY when dev->active != 0 so untagged commands are
serialized per LUN, and test ahc->flags instead of ahc->features for
AHC_SCB_BTT so controllers with SCB-space busy-target tables can still
issue untagged commands to different LUNs of a target concurrently.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wenum-enum-conversion enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wenum-enum-conversion; not tested on Adaptec Parallel SCSI hardware.

Fixes: e4e360c325c9 ("[SCSI] remove aic7xxx busyq")
Signed-off-by: Ian Rogers <irogers@google.com>
---

Notes:
    v2:
      - Serialize untagged commands per LUN via 'dev->active != 0' (and cover
        devices where AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED is clear despite
        SCMD_TAGGED) so queue_depth == 2 cannot dispatch two concurrent
        untagged SCBs to the same (target, LUN) slot when AHC_SCB_BTT is set
        (caught by Sashiko review on v1).
    
    v1: https://lore.kernel.org/r/20261119170605.1518761-1-irogers@google.com

 drivers/scsi/aic7xxx/aic7xxx_osm.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7xxx_osm.c
index d93b522695eb..af5782a63155 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
@@ -1429,18 +1429,26 @@ ahc_linux_run_command(struct ahc_softc *ahc, struct ahc_linux_device *dev,
 	 * We only allow one untagged transaction
 	 * per target in the initiator role unless
 	 * we are storing a full busy target *lun*
-	 * table in SCB space.
+	 * table in SCB space, in which case we
+	 * allow one untagged transaction per lun.
 	 */
-	if (!(cmd->flags & SCMD_TAGGED)
-	    && (ahc->features & AHC_SCB_BTT) == 0) {
-		int target_offset;
-
-		target_offset = cmd->device->id + cmd->device->channel * 8;
-		untagged_q = &(ahc->untagged_queues[target_offset]);
-		if (!TAILQ_EMPTY(untagged_q))
-			/* if we're already executing an untagged command
-			 * we're busy to another */
+	if (!(cmd->flags & SCMD_TAGGED) ||
+	    (dev->flags & (AHC_DEV_Q_BASIC | AHC_DEV_Q_TAGGED)) == 0) {
+		if (dev->active != 0)
 			return SCSI_MLQUEUE_DEVICE_BUSY;
+		if ((ahc->flags & AHC_SCB_BTT) == 0) {
+			int target_offset;
+
+			target_offset = cmd->device->id + cmd->device->channel * 8;
+			untagged_q = &(ahc->untagged_queues[target_offset]);
+			if (!TAILQ_EMPTY(untagged_q)) {
+				/*
+				 * If we're already executing an untagged
+				 * command we're busy to another.
+				 */
+				return SCSI_MLQUEUE_DEVICE_BUSY;
+			}
+		}
 	}
 
 	nseg = scsi_dma_map(cmd);
-- 
2.56.1.750.gf70dc682cf-goog

