Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107973;
	b=02kxh6u8Nhkt0b1ctW7koXFSO2MIhi1e30hdvsL/vMMwFygDQ5/KX9V1k/1gv99SUURF
	 uKuvVEIiLWI5wXlIZFbL2dE+yijTJSfQ9Yp8nfB1o2evwbPJQqryjEjSP1fFEjS3M90ox
	 CSZl5X4C+LV03LUPD6U3uHGUn1yyyQydacy/YeCXjAof5fIAkqVdxfmpdFA63iSKzAtR1
	 DGZPvKFQnjj/jNQcMxNDf0GD85Y6ahGFugwIbVucWxc+rHjPyIbTZ5wJH85R2j/XpB1Ho
	 GX9g3Ceqko/yhDjEFU/dj/qtPGU53MprQ6JYJBNgz5z408pzmJ2E/wD55hzJ1brrZ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cnk+S66UzyDHe3QGPtEeIJhvpws/OJ1mh8yUxrgOPRo=;
	b=TwdFJLBMUUNzY36sV7np9jEXMpO7M8xSc5npbrjG5j1fuDwXE42Ln3SMATAZcbKFo9ki
	 cSNfEwUCvq6VxnmyqehdYAFPCB/QS7qyWWApEWv9t08+4RNzUGpp7UtseVAOnH2UiiPTu
	 gI3nMkMIwGjsjBGGJzOJP3GsgjZBa6vqwj+EixnUPMJboe7NBOfIL1DJp27WE9m/43SOx
	 psXCXA/IJzfYetiWogxCngJQI86HWL8/tEHAYPjYDRDrylR43HRXzIzEPVNMncFBOqrHl
	 MgevlkAk814qf+oba5dn9NERH4Zc6eqvm2OtqxAiAxSYPAxy3nypqcSCrq6qyRe3cdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=md2QTAca;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A2B606A33D
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A2B606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=md2QTAca
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-384c78aa0dbso767834eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795107971; x=1795712771; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnk+S66UzyDHe3QGPtEeIJhvpws/OJ1mh8yUxrgOPRo=;
        b=md2QTAcaf4a4qxztTIEQKqzQ0m1FhsS+o6nhHdCPwWqjgujeLwoRTT22H1oidQc7Mj
         +VszQ8N+U7DIuoU8FXJ9rx4RkSC7s/pD2jp7wYlvivswbhBhX9Nh7rsm/ucTzAs5v1hA
         5wAUIezIoPX3xVQ0oS/WOIGrfMAqYOT5uozKgFBt4jAhW9KvVhhCgaw4JfAw3yIE3xcT
         qDywsrxx0nujpLeWS3JhfWkfGS3X1bbs+vEPvlpE16Zqhs4GVrz6QXdNfueV+w63Z7Wo
         fTdHemkRSUPXUaO1EMr2f6ZRNyum4Xag/NCzYbqTOoI/LySixHcXLA41XV0r6krMrE4A
         FBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107971; x=1795712771;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnk+S66UzyDHe3QGPtEeIJhvpws/OJ1mh8yUxrgOPRo=;
        b=EzKYxA3/BxS407mouKEGl5mt+89ApBeEJcJmdG2hpbgYZHtWoHcKLpRpBmEXxIbXeF
         ZenbMnenFGsoSpBIq+ImETQyagnJPC3tTMXC4zwQiDGlCOmH/tRTeWM6YU7ZLAHm/1Wu
         hbSel3PDWGklm7Ya1khDLR6qsUp96KKJcRyXXZiaJRpIH0CXuNavYI5WPQfNjon1d7us
         vEdNTmWjq3x62VlM3Do7AWKISUryX6mmiur7RpmV93Ehub6fM4cjKl+UTRZdMWtdiwvn
         MEZlu1bXr/bM6vScuzrJFzhOMG2oEmdjqwp3yuBkBZW2hgmqoM91EjdTmP/mR4+TCLR/
         B4QQ==
X-Forwarded-Encrypted: i=1; AL+hErFueNbOemrHnkUw3EHbZkByPzCRA85kUasCS+uGNa0GFcOkd97fC9a8umsgCFgG3fn7U2Ez@lists.linux.dev
X-Gm-Message-State: APuU4Z8imL25vozRe6W3L2a2SKysJypR8BsS7aJDiDMWeOjbqhB9AJSm
	Sfi1cngm+4fiGlP+PQn+10Z6vaGqZgJpQFb57LgF7pqa0fVgBmDxMwPQrwsgAB2JbaWN9qKkqvD
	EQD9jUoZhzw==
X-Received: from dycns21.prod.google.com ([2002:a05:7300:f795:b0:382:8cee:3808])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:648f:b0:380:c3e7:7814
 with SMTP id 5a478bee46e88-3827ff819f7mr6396707eec.7.1795107971055; Thu, 19
 Nov 2026 09:06:11 -0800 (PST)
Date: Thu, 19 Nov 2026 09:06:05 -0800
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119170605.1518761-1-irogers@google.com>
Subject: [PATCH] scsi: aic7xxx: Check ahc->flags instead of ahc->features for AHC_SCB_BTT
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

As a result, the condition is always true even when SCB-space busy-target
tables are active, needlessly serializing untagged commands per target and
mismatching the untagged_queues accounting elsewhere in the driver.

Test ahc->flags instead of ahc->features.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wenum-enum-conversion enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wenum-enum-conversion; not tested on Adaptec Parallel SCSI hardware.

Fixes: e4e360c325c9 ("[SCSI] remove aic7xxx busyq")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/scsi/aic7xxx/aic7xxx_osm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/aic7xxx/aic7xxx_osm.c b/drivers/scsi/aic7xxx/aic7xxx_osm.c
index d93b522695eb..e12ee18a18d5 100644
--- a/drivers/scsi/aic7xxx/aic7xxx_osm.c
+++ b/drivers/scsi/aic7xxx/aic7xxx_osm.c
@@ -1432,7 +1432,7 @@ ahc_linux_run_command(struct ahc_softc *ahc, struct ahc_linux_device *dev,
 	 * table in SCB space.
 	 */
 	if (!(cmd->flags & SCMD_TAGGED)
-	    && (ahc->features & AHC_SCB_BTT) == 0) {
+	    && (ahc->flags & AHC_SCB_BTT) == 0) {
 		int target_offset;
 
 		target_offset = cmd->device->id + cmd->device->channel * 8;
-- 
2.56.1.708.g77570a6a1d-goog

