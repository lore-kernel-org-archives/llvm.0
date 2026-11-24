Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557051;
	b=Fay4vNlANAqsfrK9O433zJywTHrjMnWbE13lcQOcc+M00KTn5ZDtlOEubLdmVClQFpaK
	 YQvSrzGqwN59CFCPahazWx8P6X6FmzMxEmnJfRG1mK27CBofZJpbDzV3kYif42x3ggeOg
	 BSa1SMn7PtmInbehSCaV0JNXoH97pUKvqcg3+sB1at+R1+0LR5pnj6KIlywwbtsxZY+3S
	 LvcwtByjx+OQS+7Xl2OQalZj6e5occ6cnFNvQd2Gqa93cucR4mMOd/4KUOPbGPAue7dW+
	 n8FSAwKiPIEpPaQCsTgn0dkLu6jWtc4qDyDTzuxFUFCVE3MAmgSvZaiysRLPTQ75o5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
	b=SAZRPI+zW7+OJb7POw3VEDOxk4tLDN0r9r2so8E3oeyLJCbYKjaQTGPVqsPEuJyd366g
	 91gIg6l3SPoleOxpULROfrddVaCac7LuMb8iYC/PeHL86GSzcEZtxTLzS7x/urC0wdP4k
	 /2Uc1jIMmXoSrVtZ9H+hZi1N5R/DGkSnuq6UImnufe2Ctv/4P4J+zmIYp+xhm5SlRkbeT
	 UWIH66Mf51G+gIBd8Si8T13RjQBT35bXBckwSBp4l7+3zGv4+ZGBomAotXPuLIntG9yda
	 5A4ltXkdpb1XXHJzu92K95gSb5PNpA9hkzsW7gHPe2Fea/prhFb8N2do+TwspHHPLvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVyvLeur;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D09606A321
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 21:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FVyvLeur
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f046b0adc0so27415405ad.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557050; x=1796161850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
        b=FVyvLeur73uosAWgqsZxQ7WvhfJIncVAk5DZTNg232rZR+i6smGRF9uJZuuvQMN6Cq
         0qhU4ks6GdowYBJ44f0e3smI+FmzmX3HDQn5U2tNB4xHPZm5oUR6xhMTJP9lXERwe5u6
         PGKh8pptku4TLAD/U3hnHy3RaNcXQZtq50AMXn8xOe9MeFSASY+/3+6JqO45pVs6/X1s
         XF+XIl5rariMw5ISV9ifH1SYgX/IvrAZec+PHNRXvSeXGp2DCtr6GPG9sCV8GaOp5TwH
         D/RoJE+oAN94joOUbmnpfanypmnFTn/S4NUcYV2y4oUiPkmBM+xVWvBSRohEbhhWJMLt
         qbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557050; x=1796161850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2pYjcoIM0nhPTg0Rm+QO3PbIqYRm/8v1mW95NTHJyLM=;
        b=S+LAO59LBUrCgEc6JpjQIbhWtDJtZe6gCayinxyPtN629F6hbuUTtyC4wFZbxbPAEY
         bNrVdFtvKQIVqK/yvaWeHkDXgIKsOgg4FEBL4cbuvP5pfQYyVv0a+7jgKmrjmZ2+zLna
         l4PrKyh5308kXgUaNwzUGUR6jMwlxfDNLPj3RhBHyTSvbWRaa9WrXgNpC4XWo7p23Rhu
         JvmVtWJMkRvtB9E2mFzfJ08D+xeeY5e1PkOhFheLpNNlFqtFCH1y+QemrbjsmJtPT14e
         DukKqfZ5R3UGgf7tOOjPv3dOLni/BVyaacLiZppaNKS8DYOSvRjwddoqhphIStoP7I80
         RyOg==
X-Forwarded-Encrypted: i=1; AL+hErFvbbV951v41AUwz/ejYS2xBsDmeLCqsBfQOhT8sl8hdQFx9/zXFFmTj49R4wH0vnjwupUr@lists.linux.dev
X-Gm-Message-State: APuU4Z/d7NomCI4lAW+Cxse9mnQhcpkzJBgpw8KE0LtcXFOSxl6xMO88
	0+SGGTtyfPXT+SlSnA/Nu5xJsV7gdBTcYPqmAwcoG5Ge+Luh3fj8/3Ai
X-Gm-Gg: AZFdTZf1os4ssWw1FRQZduMXew+OV+JUPiJ/9n/8lxHpdX8fx0ePScsgq9kr/mnPBlg
	m6erT3Lc1B7RHyBmW8h/8KWkgIXzqfHaha1fQq+rSGM4eMZE0Ds3jfNEqpTrIp63/7IWQPA35gO
	tAwWn1QgiGBZiO4VHhMef98ggFuVbU8FOpxusyRtEjnRSvIiMBT/iuA1ah1outGDcNBgztwzh5U
	HEnCldvtl8AFV8qcH0enRVcE5IUnUnqFOVWRM3CDynVQYjwxZifCwGrSIFDR/CztO3dGaLY+kqk
	XszOl16tmrHe7GVx6Ml98NMSwQ1GHvMthIlH117Yy3KWjTE34A5opvXwj6ICZN5QbZJGgbA+0dG
	OzryWwq2pmcbv7MPf5iHo19UDFlvujnRXSe+OQW+RgG6APiM1rFF8zxfVeOJKZFNU7Hu/s60LCG
	FiKkBcoFqOFXBXSD9M2vX5Ox0f2SCzkyYRXD6LXXeoSikUJ9JICmwU6aVIPKwf007MJJoOkzIk0
	ROzvtteSoDE+HEdc0pVh4ACpnHsnSRpBG5r4/19vrisTasDCFCQ4urZhdqiyjMfDfrqhed5sR9b
	YJ9y589/6fEIb/0BeWwy7ZAfgkZnlUN6tW3oLDtpAB4UdgaxIOY9rR9HaUnHWMGc6FRP2VfaRi3
	Dlf/UcDPQGk/wiBWmxo+mYA4gBOHf/dM/zX3+i3uK0lPv14rAxpUhNBzX8yIyiw6KSRDHlRpsyS
	mgn8uiwN5yeybzxgAAHkA5fL0=
X-Received: by 2002:a17:902:e847:b0:2ed:a66:cc7c with SMTP id d9443c01a7336-2f03f169619mr149288505ad.40.1795557049990;
        Tue, 24 Nov 2026 13:50:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:49 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH wireless-next v2 3/7] wifi: brcmsmac: embed macstat_snapshot in brcms_core
Date: Tue, 24 Nov 2026 13:50:36 -0800
Message-ID: <20261124215040.1261999-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261124215040.1261999-1-rosenp@gmail.com>
References: <20261124215040.1261999-1-rosenp@gmail.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MAC statistics snapshot is a fixed-size struct with the same
lifetime as struct brcms_core. Embed it directly instead of allocating
it separately, removing one kzalloc()/kfree() pair and its OOM error
path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/debug.c    |  2 +-
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.c | 13 ++-----------
 .../net/wireless/broadcom/brcm80211/brcmsmac/main.h |  2 +-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
index a1888ff02d08..711e994dd04d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
@@ -98,7 +98,7 @@ static int brcms_debugfs_macstat_read(struct seq_file *s, void *data)
 	int i;
 
 	spin_lock_bh(&wl->lock);
-	stats = *(drvr->wlc->core->macstat_snapshot);
+	stats = drvr->wlc->core->macstat_snapshot;
 	spin_unlock_bh(&wl->lock);
 
 	seq_printf(s, "txallfrm: %d\n", stats.txallfrm);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index ed022fd2613e..d000e2a70870 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -423,8 +423,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
-	if (wlc->corestate)
-		kfree(wlc->corestate->macstat_snapshot);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
@@ -493,13 +491,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate->macstat_snapshot = kzalloc_obj(*wlc->corestate->macstat_snapshot,
-						       GFP_ATOMIC);
-	if (wlc->corestate->macstat_snapshot == NULL) {
-		*err = 1027;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -2997,7 +2988,7 @@ static void brcms_c_statsupd(struct brcms_c_info *wlc)
 	if (!wlc->pub->up)
 		return;
 
-	macstats = wlc->core->macstat_snapshot;
+	macstats = &wlc->core->macstat_snapshot;
 
 #ifdef DEBUG
 	/* save last rx fifo 0 overflow count */
@@ -3054,7 +3045,7 @@ void brcms_c_reset(struct brcms_c_info *wlc)
 	brcms_c_statsupd(wlc);
 
 	/* reset our snapshot of macstat counters */
-	memset(wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
+	memset(&wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
 
 	brcms_b_reset(wlc->hw);
 }
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 8af883e40876..0e6a5edc74c8 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -240,7 +240,7 @@ struct brcms_core {
 	/* fifo */
 	uint *txavail[NFIFO];	/* # tx descriptors available */
 
-	struct macstat *macstat_snapshot;	/* mac hw prev read values */
+	struct macstat macstat_snapshot;	/* mac hw prev read values */
 };
 
 /*
-- 
2.56.1

