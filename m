Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557056;
	b=DyrtZXgHJu+Zc1aCZoypkoeVg1jUqx2JDYU1vyj0puOAwaNd+pQzxSBgRvcXaJ81XIMJ
	 ykmxj3blCHS1qk6q1zQSIghMVINdMjneHJtscnMuk0aFQFuHVhqdRASB2qiHcRphD6F4t
	 8DqoPcGjZQA7c0cssueHmPlrgs4aZwrPnrrlYHzyTRqQbjm24fheJfViDKnsVqQNGK3Vy
	 JWRP0W4CybiQl7b9gYWhRYxyK7bU4jZVEKSGzrBvy2gM4vJLqOWKKJ1AQdxCW7d3ps/Y+
	 +FuZaBbeomW0+clWjQkTJZ8gTOVDTwKoIEEQQjyJfNBDIUf/p+iDdmI4xFyZF+W19Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lhC3E6j9bmGggUmcCK8Ii/A2YIIhfQwfAVP2Vr2BAu8=;
	b=NpQl9ikie3ZhS3am5hJy5Tv/VcWh1bYuLx8EwudOV/ilU01gpVMT7veCXZsJ42onxbvo
	 7uqKWJTiKS6roYo0d3QeqIlcY75snQBBVDgCeqpE8Bb5Jc2ojDSPBEFRxswmxDv/I1W5e
	 zYX+2MktD9GfVt8rKYpdTGfEUYg1UPZo+nsYdKKUNP8doDD4bMFv99Vy3mS0Xmr52piuY
	 LRA46047yw8EMXEnNujy/yBVFb39meho7QdhM0MOm9mtco0Cxu/7jJ73FdSVOBWD6rzd3
	 xEdUnZzAZOGEnlG+/RdOewPucUTYJGxtrmDsiY9bK+MkPoysEJof5y88vsR8GnOujTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J6pILxls;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5F0606A330
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 21:50:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B5F0606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J6pILxls
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f02ee04378so39855975ad.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557055; x=1796161855; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lhC3E6j9bmGggUmcCK8Ii/A2YIIhfQwfAVP2Vr2BAu8=;
        b=J6pILxlslWBfmro1mS96c6FhAXg3ZGBCuzw2GMWbfwMlMJG/sCWR3W8tSbmTZ8KJJD
         YefvgW83369BApm+vfouHsZZJRupnjbODBUrZ4DFoMDwxu7H+QqcbA//41pACkWjeG5/
         Ow/VRvOlr4cqQozTH+s9e4pzCZxdMJxqz4WX3SrbjPGaOH292udMbNiMbmqjmpE3KEdV
         gcj+Qy4VArUtpnWVIOOkxqN3wUVB/19qx9vZhYiCGAY2UBt6AyVLk7+gsc31aVhuuAoH
         NfNDeo2zl+/wR1EXqyZFX9OGSr4sfYZdpcnuqf4a8RoDpQkhySSi5iOLE2CTOuZQQqRV
         Wxjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557055; x=1796161855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lhC3E6j9bmGggUmcCK8Ii/A2YIIhfQwfAVP2Vr2BAu8=;
        b=dKq7uTPj5g8qde55Lb3dIUzr4J2+qsuKrK1hh1/FzpJRgcdIsqF9W9EJHpnQmw0l2o
         eUytd0mLXISvBaYRXG3rppDNTl+tT0q2tzdr1tMHpDCAhC3EpoqpxTpklT0Uwcsx1ln0
         +1FLZOyskhvkSa/Q5ZWrJ6wCUfp8DjJJhvrHNkA1DyWem8BIbrD3g+A5/iUxxeW6w8xH
         Qf0UMRX5fAfbAd+g+suRn8RwChqSZ4wL7031L2R3igYRQXdmaLQnB1GYD7cA2yrHWVgj
         /ppTYbUwKb122xLXD/RCoW3pOGQfLTyPIfx1ifwL8pGhMCTMLrE6g80ygpGOORDw9Oe1
         +nuQ==
X-Forwarded-Encrypted: i=1; AL+hErFROaH70qlGy+HWnFwgmicKxzU8xThG9hyJLv0ymfNUNemGArkghhApsQuC8XcMtvTN+itF@lists.linux.dev
X-Gm-Message-State: APuU4Z+MQkODK/yQFGxFZNQoywq0PNbN9jVDJuhVaAd883TAvJsu+brd
	vVFT1PGcQxcCOziUUn+yKO2e65UpnSF/njbVMMnT73hLm9cQDkiIlyPm
X-Gm-Gg: AZFdTZc/vG1k22ujZRv9lGh3jaibMGbsXdJPxYTdwBi0qiq02FtjIsoASvIqlTzQTw4
	XTMDBtXrEcY6hO/Iy1IXgdpcS0bM7eRZrvV/7R0vaMcM3/9JK20fHg3bt3/GcKF7MoLm6xlHvDt
	rLUfiXD0+Z2sH3xK8MC7hxNyt2deeconnCTT7OBXMZuiRWCqj3SZEr7PldS1IDWKTxmhVjsQUvu
	41R7PMPa2K0kX7nd+GBzINlbSzGHG6SkjNKR/O6FtRPKKdhlUkXME/eSeXB2ja6F1Ciy+jnEsoS
	ayWPT7P6uo5i0TxzyzXlAekP9q9W1wF2vcxqLUyMhQBAmH2Mk05ehgOOjrqoWE8gXqZP6Qo1TE0
	krPyANDTZQOTQB3DbjVlTss5wJMsxVmtkh5xLHoyz2Yl2zfvqMyDa3aP1Wv7mSsr8yLYLvUmA6u
	FbkqbcDF6RMrfCBm5OX8UQXO7XAdMfnbt3v/I56F9zeyTjaJ3F3E0oHT+uEaksaHuyOOPyalth0
	gigV/3PKbmAmF3BxP0MWonJidEGLISasdrIxdjGFrmxrn0p8BU1hXO7YplPwam0gg1OQP3qc5hS
	snHbV6EKBPVvImH4ZcPu3eqbcVZnQgpNVqi9kl8Ho9AKwVHvmriTqMfk+N5qGjRHhEoG5kfdEMZ
	NwEmXzySBIk6duYXz5K1BSQbpV5BWkTjkLyVUrrZxpsuULYOf1j/hYZ17bF+W2fU60MWnIMe/Jf
	OeJ0g=
X-Received: by 2002:a17:903:298c:b0:2ed:369a:42d2 with SMTP id d9443c01a7336-2f03f218049mr157938935ad.40.1795557055598;
        Tue, 24 Nov 2026 13:50:55 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:54 -0800 (PST)
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
Subject: [PATCH wireless-next v2 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:39 -0800
Message-ID: <20261124215040.1261999-7-rosenp@gmail.com>
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

There is only one struct brcms_core and it has the same lifetime as
struct brcms_c_info. Embed it directly instead of allocating it
separately, removing one kzalloc()/kfree() pair and its OOM error path.

Remove the now useless core pointer. It always points to corestate.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../wireless/broadcom/brcm80211/brcmsmac/debug.c |  2 +-
 .../wireless/broadcom/brcm80211/brcmsmac/main.c  | 16 ++++------------
 .../wireless/broadcom/brcm80211/brcmsmac/main.h  |  3 +--
 3 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
index 711e994dd04d..76f9d20f0d1c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/debug.c
@@ -98,7 +98,7 @@ static int brcms_debugfs_macstat_read(struct seq_file *s, void *data)
 	int i;
 
 	spin_lock_bh(&wl->lock);
-	stats = drvr->wlc->core->macstat_snapshot;
+	stats = drvr->wlc->corestate.macstat_snapshot;
 	spin_unlock_bh(&wl->lock);
 
 	seq_printf(s, "txallfrm: %d\n", stats.txallfrm);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index bd1880e3738f..422452b8a832 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -421,7 +421,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
 	kfree(wlc->stf);
-	kfree(wlc->corestate);
 	kfree(wlc->hw);
 	if (wlc->beacon)
 		dev_kfree_skb_any(wlc->beacon);
@@ -471,12 +470,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->corestate = kzalloc_obj(*wlc->corestate, GFP_ATOMIC);
-	if (wlc->corestate == NULL) {
-		*err = 1026;
-		goto fail;
-	}
-
 	return wlc;
 
  fail:
@@ -2974,7 +2967,7 @@ static void brcms_c_statsupd(struct brcms_c_info *wlc)
 	if (!wlc->pub->up)
 		return;
 
-	macstats = &wlc->core->macstat_snapshot;
+	macstats = &wlc->corestate.macstat_snapshot;
 
 #ifdef DEBUG
 	/* save last rx fifo 0 overflow count */
@@ -3031,7 +3024,7 @@ void brcms_c_reset(struct brcms_c_info *wlc)
 	brcms_c_statsupd(wlc);
 
 	/* reset our snapshot of macstat counters */
-	memset(&wlc->core->macstat_snapshot, 0, sizeof(struct macstat));
+	memset(&wlc->corestate.macstat_snapshot, 0, sizeof(struct macstat));
 
 	brcms_b_reset(wlc->hw);
 }
@@ -4453,7 +4446,7 @@ static int brcms_b_attach(struct brcms_c_info *wlc, struct bcma_device *core,
 		wlc_hw->band->bandtype = j ? BRCM_BAND_5G : BRCM_BAND_2G;
 		wlc->band->bandunit = j;
 		wlc->band->bandtype = j ? BRCM_BAND_5G : BRCM_BAND_2G;
-		wlc->core->coreidx = core->core_index;
+		wlc->corestate.coreidx = core->core_index;
 
 		wlc_hw->machwcap = bcma_read32(core, D11REGOFFS(machwcap));
 		wlc_hw->machwcap_backup = wlc_hw->machwcap;
@@ -7808,7 +7801,6 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 	pub = wlc->pub;
 
 	wlc->band = &wlc->bandstate[0];
-	wlc->core = wlc->corestate;
 	wlc->wl = wl;
 	pub->unit = unit;
 	pub->_piomode = piomode;
@@ -7849,7 +7841,7 @@ brcms_c_attach(struct brcms_info *wl, struct bcma_device *core, uint unit,
 
 	/* pull up some info resulting from the low attach */
 	for (i = 0; i < NFIFO; i++)
-		wlc->core->txavail[i] = wlc->hw->txavail[i];
+		wlc->corestate.txavail[i] = wlc->hw->txavail[i];
 
 	memcpy(&wlc->perm_etheraddr, &wlc->hw->etheraddr, ETH_ALEN);
 	memcpy(&pub->cur_etheraddr, &wlc->hw->etheraddr, ETH_ALEN);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 266fe7825042..5e2052bd913a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -468,9 +468,8 @@ struct brcms_c_info {
 	bool clk;
 
 	/* multiband */
-	struct brcms_core *core;
 	struct brcms_band *band;
-	struct brcms_core *corestate;
+	struct brcms_core corestate;
 	struct brcms_band bandstate[MAXBANDS];
 
 	/* packet queue */
-- 
2.56.1

