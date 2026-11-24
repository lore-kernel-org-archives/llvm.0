Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557054;
	b=Zf9xHfozA4VfCvLzNYZjfIhnvJlmad7SLtlMxkKAAy7WJnwXtLb9w7pJb0wLo4dOh4t+
	 JWXjQZeRAF7cKnYjAdNmWx0LFiQHV5L0MoHF4cLahihXCSIuEqap0DN/cKxodSZaHrvbB
	 4y8RYYojHgbMZv0eQoeTJMjMTCLeor6BOdW2Hk1y+UvLu26vBK+lp5hAsn25obttuD6ZF
	 qqUKgF1cgCRlguUm8j3Q19ZhqY2voNQRTMF7zPg+/Spe1JVP8CNy1ayeFbL5wZ67qiiJE
	 Uyc8wglfdVnapxsfR2cQQA3RBUqUIb7TGtdeB+QY+opObKFcRe61kjPV22UMHC3rhKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
	b=akkp1TIPjgOLLBFtwLH2bYLAm2iRIBcmL44/+i62GWynW1+DvMhBOFj3pOjygw0CpuFy
	 EohTU9Q254BVMYYZR2nUH5hsZa0WXElzgxhUm4HraNJOcjfU51FCYb/O32AjhdxbBEDQQ
	 cUQhhIpKsO61pX/pSf/ebUd3aNTv7Dx57+pshwC3SmUPdIZnaJ3JKD7a6EUr6+FJBBARG
	 Z5oZEqV1nbBV/S+Zjrqf/yd014RjmsSuKYM+PH+wzWmnGCr6r/iz+VzwbFCAdb16yhWwf
	 xzUoitMqy5weHmeopkH97IMf+17SduPHjyY23OciJWjGpoLfJRkYC84wYoibnE4kXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGAG+dWi;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F70F606A33A
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 21:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F70F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cGAG+dWi
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae391a05so34282365ad.1
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557053; x=1796161853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
        b=cGAG+dWiZX2HReqRD5cZ9OvrT3rak87YSSsSM7ILLsOVp1oEbCQ70bcBl2gU0uui/v
         Jy6olcKkbfKqimtMJGUe2BOY6RkwlhuwlQusfRhGs/SNypD0Rny5y88BuAZd+m8M0m0D
         uOv6mMyIv8FTVbsSY2zaFqU7F+TgQeuryRx2FqtYCMN/F8f5bC6i7vQCHymSR1Wod3Rq
         COgNFT6IUKepX6zlve+p+kG5mnwO+1o7b0MrkikT06JT+JGj478L1cS2Lb7d7oplmaHP
         RQCJWCcNaUHCDxgpcVXhkPXukURcWiw0+1nLKFN+nn3w9CKv88zi851r+1Mf896gs1QF
         4iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557053; x=1796161853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p24XAkvApPQJpmtKWickPyPDaZAtmZMyT0ckONLByAg=;
        b=BWl8+7fBaXqfpjImjOYLUZwf6/mh85EDFr5FBiJglXrA3tjfuxwJ5jj99iJvm9JUzZ
         lln7OrMnhyYHZU5XL5Cj3m8d9/gZANj57yf5OI1A+KxLza6dItZOoGzFX0gOvIaDRTi5
         ZQQKwMMg9j+IEpoOYXXIio1e7ShIbieiLXmOqdfBCLSES5DCC1Um/40Zpu3yFkMa8I/f
         evw5OkL1w8OdEeqvs5F9ylGhdxY0EUpqDIhwJ1+0o4OQo8GVqhGk0a0eA0igOoATpkkZ
         ITpAoWehbyPd+vnv4BZ4fVDn37dTQp+4mdARZ1IDu4VpLWqvgUrnOA3BDbkjLUbl3HwF
         U55w==
X-Forwarded-Encrypted: i=1; AL+hErGXc9TFI+SVCf08lLr/2cmuTXfG0em15iiA5UetB/tzpFwKetjEj2G19x8NldCdX6kvGBGs@lists.linux.dev
X-Gm-Message-State: APuU4Z/w2AC5oh0U3VZLE40/EiMRdWxOleKYBHckLls9PFyddzoyLvtS
	Ywu9vGzojieHoKQ1CXqN/ftDV1FqbGLlSlSXSv/j6/rimAuCZIEnZsU1/mUxhw==
X-Gm-Gg: AZFdTZdeeuqXKU7W9QBFG7x0nt64rbiIoPKTNw3uqZXh5yxC0k0S1cvlaAJOiPzVOXO
	h/UMaqQQGT7O/Qg6Svxt/xNM7mU1fzt9Ff925+ge3ej0dcX7cWdkwtp2X7mH2E0yfWWGztpih2L
	9nMi5sKIIw+kKKxyVm9abWdlyhtCj8SGyK12xAAgMxJusFdIhR/6mvrppVHgJpssDmw4I1HaHdY
	516pyE6NPpzcgtyOy4pEygN4oZHvsf0TgfrwnNkM4mEtwudRZ9htAfb9zNMkIa5HguFt7lISfFs
	k/pJMnc7R8BbzrVLZTpcD6vRLWTxNZKx/VeRU4zrPPVbgK+02sp9tyVJrgIUUgw2VPT23BFWhCv
	1c62mz8SkRCkEreOoy7woxSLyiaWiIdGPn8fxNcg8qlQZLGyY8F1dHrvwIdu+CII1o18rXUI/Le
	kf/P9Whg6zCxQpUx8eug1/7Flyy6dr40mO4ypkKl1fV/XcvLr2DnrD9yFEyBWYMmqnVNqCLW6Wl
	gjzh77oceyIbzzM7SbMnWyokqKnKyFnbLyO4djxPIw66JaWOSXZrTGpjgZGRdC19iJp8mozJQhH
	wxpn0+3sRPQxC0z+klkSHprNAV9eAbPu2L5Y8pZ0Zm8oS9gqJFaUj26Tp8uo9OTLTkq8BQ61nIm
	9agC0neD8D4gllApgsEywImkH2sOEl65C8faelIdpF5ggb265A4QXPm6u12b9L6ifpxUep6BGLr
	6+GQ==
X-Received: by 2002:a17:903:1a43:b0:2e9:5ed2:c39c with SMTP id d9443c01a7336-2f03f1ba01amr108241825ad.22.1795557053457;
        Tue, 24 Nov 2026 13:50:53 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:51 -0800 (PST)
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
Subject: [PATCH wireless-next v2 5/7] wifi: brcmsmac: embed brcms_protection in brcms_c_info
Date: Tue, 24 Nov 2026 13:50:38 -0800
Message-ID: <20261124215040.1261999-6-rosenp@gmail.com>
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

The protection settings (struct brcms_protection) have the same
lifetime as struct brcms_c_info. Embed them directly instead of
allocating them separately, removing one kzalloc()/kfree() pair and
its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../broadcom/brcm80211/brcmsmac/channel.c     |  6 ++--
 .../broadcom/brcm80211/brcmsmac/main.c        | 31 +++++++------------
 .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
 3 files changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
index a5c1c4d45683..b4c575f8c0f6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/channel.c
@@ -312,13 +312,13 @@ brcms_c_set_country(struct brcms_cm_info *wlc_cm,
 	struct brcms_c_info *wlc = wlc_cm->wlc;
 
 	if ((wlc->pub->_n_enab & SUPPORT_11N) !=
-	    wlc->protection->nmode_user)
+	    wlc->protection.nmode_user)
 		brcms_c_set_nmode(wlc);
 
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_2G_INDEX]);
 	brcms_c_stf_ss_update(wlc, &wlc->bandstate[BAND_5G_INDEX]);
 
-	brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+	brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	return;
 }
@@ -387,7 +387,7 @@ brcms_c_channel_set_chanspec(struct brcms_cm_info *wlc_cm, u16 chanspec,
 	if (ch->flags & IEEE80211_CHAN_NO_OFDM)
 		brcms_c_set_gmode(wlc, GMODE_LEGACY_B, false);
 	else
-		brcms_c_set_gmode(wlc, wlc->protection->gmode_user, false);
+		brcms_c_set_gmode(wlc, wlc->protection.gmode_user, false);
 
 	brcms_b_set_chanspec(wlc->hw, chanspec,
 			      !!(ch->flags & IEEE80211_CHAN_NO_IR),
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 2140feb86964..bd1880e3738f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->protection);
 	kfree(wlc->stf);
 	kfree(wlc->corestate);
 	kfree(wlc->hw);
@@ -466,12 +465,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 		goto fail;
 	}
 
-	wlc->protection = kzalloc_obj(*wlc->protection, GFP_ATOMIC);
-	if (wlc->protection == NULL) {
-		*err = 1016;
-		goto fail;
-	}
-
 	wlc->stf = kzalloc_obj(*wlc->stf, GFP_ATOMIC);
 	if (wlc->stf == NULL) {
 		*err = 1017;
@@ -3878,37 +3871,37 @@ void brcms_c_protection_upd(struct brcms_c_info *wlc, uint idx, int val)
 
 	switch (idx) {
 	case BRCMS_PROT_G_SPEC:
-		wlc->protection->_g = (bool) val;
+		wlc->protection._g = (bool) val;
 		break;
 	case BRCMS_PROT_G_OVR:
-		wlc->protection->g_override = (s8) val;
+		wlc->protection.g_override = (s8) val;
 		break;
 	case BRCMS_PROT_G_USER:
-		wlc->protection->gmode_user = (u8) val;
+		wlc->protection.gmode_user = (u8) val;
 		break;
 	case BRCMS_PROT_OVERLAP:
-		wlc->protection->overlap = (s8) val;
+		wlc->protection.overlap = (s8) val;
 		break;
 	case BRCMS_PROT_N_USER:
-		wlc->protection->nmode_user = (s8) val;
+		wlc->protection.nmode_user = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG:
-		wlc->protection->n_cfg = (s8) val;
+		wlc->protection.n_cfg = (s8) val;
 		break;
 	case BRCMS_PROT_N_CFG_OVR:
-		wlc->protection->n_cfg_override = (s8) val;
+		wlc->protection.n_cfg_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_NONGF:
-		wlc->protection->nongf = (bool) val;
+		wlc->protection.nongf = (bool) val;
 		break;
 	case BRCMS_PROT_N_NONGF_OVR:
-		wlc->protection->nongf_override = (s8) val;
+		wlc->protection.nongf_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_PAM_OVR:
-		wlc->protection->n_pam_override = (s8) val;
+		wlc->protection.n_pam_override = (s8) val;
 		break;
 	case BRCMS_PROT_N_OBSS:
-		wlc->protection->n_obss = (bool) val;
+		wlc->protection.n_obss = (bool) val;
 		break;
 
 	default:
@@ -6800,7 +6793,7 @@ brcms_c_rspec_to_rts_rspec(struct brcms_c_info *wlc, u32 rspec,
 	if (use_rspec)
 		/* use frame rate as rts rate */
 		rts_rspec = rspec;
-	else if (wlc->band->gmode && wlc->protection->_g && !is_cck_rate(rspec))
+	else if (wlc->band->gmode && wlc->protection._g && !is_cck_rate(rspec))
 		/* Use 11Mbps as the g protection RTS target rate and fallback.
 		 * Use the brcms_basic_rate() lookup to find the best basic rate
 		 * under the target in case 11 Mbps is not Basic.
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 94966418b069..266fe7825042 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -549,7 +549,7 @@ struct brcms_c_info {
 	s8 shortslot_override;
 	bool include_legacy_erp;
 
-	struct brcms_protection *protection;
+	struct brcms_protection protection;
 	s8 PLCPHdr_override;
 
 	struct brcms_stf *stf;
-- 
2.56.1

