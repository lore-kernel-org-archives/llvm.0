Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557052;
	b=e3ZCsCi42igHpNtCnzxT2uKBhyU6P5vxQSrEy2Ug5RPQa4jmYPnQeX1jgmOt18HEdFss
	 mK6jNUtf1HX/UB/TyV3RxCn9vac1Zdb5GJjSRgGluTcraZ4GqxDe9wHBF9YeU9KtfVk3q
	 9YBmKevYYl2nZ6UEU2UXUN7tr8/fHOdSY0eFg4oV4xrGWsAitrs4NdPtuIFzKSoq9CEWS
	 XYQtako1IJNZu6UeIGCG+Zyc0UtTs2XLUyNqCAJlJD3ArTRw2aKbkd6LeoUsv5aU/6X1g
	 OM3L9a0++pNcXlbQSmqLvfyfRjjjjlHSofdM6LvX1RyZFreDj4zdgVNYJJnxtrf+KXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
	b=oUyuIEmZhbaYTLByhI6SI4iLR2WPF2zYCjDRk2Sb4G1ods7VuWiytaIOUe8e24h1nvzS
	 Wa3hf2qsGOs+0Hz/AIo+hkKdguqwgv0km4/MScxLRKUNLweCdQvS4B8hMEovV3EyiQh8s
	 FR9zr5RZYFSr6tIjE1LEpyRD6iu7cyEjoXdDAEwO2huuI6cohu9JVkbY4feep7duVNCV6
	 3E7n+e/MGo0pZ7iCFeZr9N/KP/hWIdqicCGNLmktoBM7xVAg6mdwZDnE2XGox4zAIfgXI
	 dvEh9FSSILaFHgcNYAzC5akoV4cj8QTdYBgw6DIz37hpel1ynt4ohotSnLt3tzchg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DX0RHItJ;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E26606A333
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 21:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15E26606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DX0RHItJ
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04bea9a93so43781965ad.3
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557051; x=1796161851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
        b=DX0RHItJPIW8FUknLc5mmUCoyxqGmmec1YwNBvm+NMHL9K0QdkjXclfFVcGu6jMC3K
         9jK9021K5A+3c1gBno5czlZrMHKMA8N6U1PCTqomTSEIJ8mZZAYA5vbKZ0MTUgWsOZ0s
         BosU5RkZXbSh0CrBhL2db/nvkHTq5jLVwP+ONr+Bc9ibbMuh8iAo+ZuVdSogxSGif0uZ
         LABiyeD2/W76cHf+kq2YUqmCsRH/ew8rg3l8BxoC2V2hqqEF/F/H4F8vpOlxmBCDfOfs
         uHTRkdqc3KDnafIis3x2K2IBylzRNyuqijxUpu9aXr5vDXX4laoy2d8aKcfRKSn16FNi
         wKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557051; x=1796161851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DyUzeUaVSNTZ2aNn4snlOayctzDG+r7A6cNFkAQEJa4=;
        b=ci4izJEC5he2/Z6B+yOm2dVNjjOXIHbAN3OWIeajcN9w/zV2c4nKrPwiDm1NuWIj3U
         XI9GkJ+zPvE01MYfDgb0hkaAzyBLccKFGyHbXd56CARfOsUBg7YZTXmI2JaL7pPajNJQ
         IsTeaZ1m/wnMCvIgEEfD/iSJFZOS4Didl/diw3qksAPdx9S9GpXjIJb5A8LXF94g+hDC
         km/hHD/TSeSJGOHJ2vN+SFgT1Hc+FV/JpkUXHdpIrhzuz5g/e4pOZ0Zlik4hy7dmUFhx
         10/Y7/d5FYfQDIPqOAV/bLyejlOR6Ld51E39AzmCq9QHEgaaQMHhKavkpa4T8oOqyA7h
         lnhQ==
X-Forwarded-Encrypted: i=1; AL+hErG9zX3bYXpZl6123KyqIgcFS/T0UVjM2XJaaq2dQRc/+z5lDCZaw/dDsVbG56sFvo9GEvuy@lists.linux.dev
X-Gm-Message-State: APuU4Z+2ipoIgSi1PjUYqmaFn3In6OZPD9z2wAAEee4gNaE57z7KuUmr
	TdoPNrtQRI5n7tHVpNtS+NoFSUpLkbHci2O+Om9gZ6EEVqOzezd9Yv2L
X-Gm-Gg: AZFdTZdXrs8vU78MjC8MMeqaz/S2r7KOIaS6G8LmikNFRFqcClpGeGVyrNpb2+OEDdx
	ijuvM0IeNOpnwej70N4QI0GwzfrboEITkDjnXt+opsAOf5+ab8jFtHEp49bZCFY+8y6pIfYa2OK
	//lFPTQ/GdaCmknawGuZ0AGnQx7+ZFw+nupDmWs505y7NExH4wmYygb15zYttBD3FGwdOU+NFeB
	9PutoMcX6bL7ATys0c4gRin2EiQk9oh4DmB9qYDKjiyGXV81YAOwwwOt2GS5VvhxFn4qJJiK62Q
	K1IHA31wKp8LBXMxZC2es3tjBEpmAfczZjykP+NqIVwhr/DVcNVUvw4HnESiAjPRNud7WE1iQWC
	99bxJ+KJ4mp0ZjxX8wy9CgsrkJD78iQz0O261iTYa81a9h74z3mCviWKNRcdBzyM/OSMjQGGNqx
	QQHH+RCNVMekD1DPY9CsHRyyEN9UEDZXqVPMKlfAfeLKqd7E3JaCEF79dKJJRFx2lgDvesI3NVD
	Bpojh3wo7fZQcD5TntaGv2sfERCpXnxtCi+LuMGwbpLayY1sWkjrSTNW0enE1kQNhB++dqQqyMb
	U08eK58JE3pptJK1N+mRbD9F1oFMojrkuXpmc7zoMgeRipqamL7kWuM2j9JSg/3pI9ZDdfv40b3
	5k9hdG5jPu7Divu17s2BQGLGV6rMGY/9qZWH1sfw0gvhOoZ7PE7/5tCh5nt0pPrZqfVmb9ObK7+
	D3NQepth6F+jlyto2NRc7GrNo=
X-Received: by 2002:a17:902:c402:b0:2e9:5507:b52c with SMTP id d9443c01a7336-2f03f211b8emr172219685ad.34.1795557051242;
        Tue, 24 Nov 2026 13:50:51 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:50 -0800 (PST)
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
Subject: [PATCH wireless-next v2 4/7] wifi: brcmsmac: embed default_bss in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:37 -0800
Message-ID: <20261124215040.1261999-5-rosenp@gmail.com>
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

Replace the separately allocated default_bss pointer with a
directly embedded struct brcms_bss_info in brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmsmac/ampdu.c       |  2 +-
 .../broadcom/brcm80211/brcmsmac/main.c        | 35 ++++++++-----------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
index fc7a5dd2e5d8..b40761e571c2 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/ampdu.c
@@ -862,7 +862,7 @@ brcms_c_ampdu_dotxstatus_complete(struct ampdu_info *ampdu, struct scb *scb,
 				brcms_dbg_ht(wlc->hw->d11core,
 					  "%s: Pkt tx suppressed, illegal channel possibly %d\n",
 					  __func__, CHSPEC_CHANNEL(
-					  wlc->default_bss->chanspec));
+					  wlc->default_bss.chanspec));
 			} else {
 				if (supr_status != TX_STATUS_SUPR_FRAG)
 					brcms_err(wlc->hw->d11core,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index d000e2a70870..2140feb86964 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
@@ -461,12 +460,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
-	if (wlc->default_bss == NULL) {
-		*err = 1010;
-		goto fail;
-	}
-
 	wlc->bsscfg = kzalloc_obj(*wlc->bsscfg, GFP_ATOMIC);
 	if (wlc->bsscfg == NULL) {
 		*err = 1011;
@@ -822,7 +815,7 @@ brcms_c_dotxstatus(struct brcms_c_info *wlc, struct tx_status *txs)
 		brcms_dbg_tx(wlc->hw->d11core,
 			     "Pkt tx suppressed, dest chan %u, current %d\n",
 			     (xfts >> XFTS_CHANNEL_SHIFT) & 0xff,
-			     CHSPEC_CHANNEL(wlc->default_bss->chanspec));
+			     CHSPEC_CHANNEL(wlc->default_bss.chanspec));
 	}
 
 	tx_frame_count =
@@ -3311,7 +3304,7 @@ brcms_default_rateset(struct brcms_c_info *wlc, struct brcms_c_rateset *rs)
 	brcms_c_rateset_default(rs, NULL, wlc->band->phytype,
 		wlc->band->bandtype, false, BRCMS_RATE_MASK_FULL,
 		(bool) (wlc->pub->_n_enab & SUPPORT_11N),
-		brcms_chspec_bw(wlc->default_bss->chanspec),
+		brcms_chspec_bw(wlc->default_bss.chanspec),
 		wlc->stf->txstreams);
 }
 
@@ -4639,7 +4632,7 @@ static void brcms_c_bss_default_init(struct brcms_c_info *wlc)
 {
 	u16 chanspec;
 	struct brcms_band *band;
-	struct brcms_bss_info *bi = wlc->default_bss;
+	struct brcms_bss_info *bi = &wlc->default_bss;
 
 	/* init default and target BSS with some sane initial values */
 	memset(bi, 0, sizeof(*bi));
@@ -5198,9 +5191,9 @@ int brcms_c_set_gmode(struct brcms_c_info *wlc, u8 gmode, bool config)
 	}
 
 	/* Set default bss rateset */
-	wlc->default_bss->rateset.count = rs.count;
-	memcpy(wlc->default_bss->rateset.rates, rs.rates,
-	       sizeof(wlc->default_bss->rateset.rates));
+	wlc->default_bss.rateset.count = rs.count;
+	memcpy(wlc->default_bss.rateset.rates, rs.rates,
+	       sizeof(wlc->default_bss.rateset.rates));
 
 	return ret;
 }
@@ -5221,13 +5214,13 @@ int brcms_c_set_nmode(struct brcms_c_info *wlc)
 		wlc->pub->_n_enab = SUPPORT_HT;
 	else
 		wlc->pub->_n_enab = SUPPORT_11N;
-	wlc->default_bss->flags |= BRCMS_BSS_HT;
+	wlc->default_bss.flags |= BRCMS_BSS_HT;
 	/* add the mcs rates to the default and hw ratesets */
-	brcms_c_rateset_mcs_build(&wlc->default_bss->rateset,
+	brcms_c_rateset_mcs_build(&wlc->default_bss.rateset,
 			      wlc->stf->txstreams);
 	for (i = 0; i < wlc->pub->_nbands; i++)
 		memcpy(wlc->bandstate[i].hw_rateset.mcs,
-		       wlc->default_bss->rateset.mcs, MCSSET_LEN);
+		       wlc->default_bss.rateset.mcs, MCSSET_LEN);
 
 	return 0;
 }
@@ -5269,7 +5262,7 @@ brcms_c_set_internal_rateset(struct brcms_c_info *wlc,
 
  good:
 	/* apply new rateset */
-	memcpy(&wlc->default_bss->rateset, &new,
+	memcpy(&wlc->default_bss.rateset, &new,
 	       sizeof(struct brcms_c_rateset));
 	memcpy(&wlc->bandstate[bandunit].defrateset, &new,
 	       sizeof(struct brcms_c_rateset));
@@ -5299,7 +5292,7 @@ int brcms_c_set_channel(struct brcms_c_info *wlc, u16 channel)
 			wlc->bandinit_pending = false;
 	}
 
-	wlc->default_bss->chanspec = chspec;
+	wlc->default_bss.chanspec = chspec;
 	/* brcms_c_BSSinit() will sanitize the rateset before
 	 * using it.. */
 	if (wlc->pub->up && (wlc_phy_chanspec_get(wlc->band->pi) != chspec)) {
@@ -5343,7 +5336,7 @@ void brcms_c_get_current_rateset(struct brcms_c_info *wlc,
 	if (wlc->pub->associated)
 		rs = &wlc->bsscfg->current_bss.rateset;
 	else
-		rs = &wlc->default_bss->rateset;
+		rs = &wlc->default_bss.rateset;
 
 	/* Copy only legacy rateset section */
 	currs->count = rs->count;
@@ -5370,7 +5363,7 @@ int brcms_c_set_rateset(struct brcms_c_info *wlc, struct brcm_rateset *rs)
 		if (wlc->pub->associated)
 			mcsset_bss = &wlc->bsscfg->current_bss;
 		else
-			mcsset_bss = wlc->default_bss;
+			mcsset_bss = &wlc->default_bss;
 		memcpy(internal_rs.mcs, &mcsset_bss->rateset.mcs[0],
 		       MCSSET_LEN);
 	}
@@ -5403,7 +5396,7 @@ int brcms_c_set_beacon_period(struct brcms_c_info *wlc, u16 period)
 	if (period == 0)
 		return -EINVAL;
 
-	wlc->default_bss->beacon_period = period;
+	wlc->default_bss.beacon_period = period;
 
 	bcnint_us = period << 10;
 	brcms_c_time_lock(wlc);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 0e6a5edc74c8..94966418b069 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -524,7 +524,7 @@ struct brcms_c_info {
 	s8 ofdm_40txbw;
 	s8 mimo_40txbw;
 
-	struct brcms_bss_info *default_bss;
+	struct brcms_bss_info default_bss;
 
 	u16 mc_fid_counter;
 
-- 
2.56.1

