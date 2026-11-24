Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557048;
	b=cRInj9sZVNQjW855ihOWVQBXXvGVHu8rf5MXKcjpzdU8EWl2AFczyZYUDvCT5MMinYE1
	 q1SBa9UYKCcfSpfpqmA0ss+c6cLWcENlUVyoT5haMXHlDED+EvqHF/mvULG3y4wU6ADR5
	 e1g5tP9WpSHI/YMHpzSJumRExWnXkBiOALoUSKysKo1ggEkhpzkaQT7Kc0pm8PJ+MRWvf
	 CjI+S2aCc6Cd2HXFI+BYmzygmmbc+TNfQgzNsYUfC//v1oODJnnt/xAtrArouQhCgsMY9
	 PcpiwlzIwfFwkeQq0MXD0T+FXs7gV4t0wJgEOZf4WbPoTvPWwqV8E3HTOcooHEIGYwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
	b=e1rMSCAghuj5xRt7RgFXdibl0Ddri/jsynUnga5Ocmk0O0bXp1t5KEYuKnEjn1ZjO3cw
	 RKySFfHThtgbV8af+ByivoHFnforD+LFT+3Y+GaZ/eRpeJEvBg0nhDmxN4METn5SJ2E1S
	 BP4sNk12urMzqNDFxcEDcgm8z8fYHD1qX4fHKliaKH1s8OkRlITiH8qE7uHpfFSA0wY0m
	 Fj+e25E9rEwQjAO5l7KOftia3G/Q4mx4yJ7Y8jdUNg7BeOIMLxWnAOlbudPMLvYmRTKw1
	 o6p+cDu1+57MvD8DNBp5eoKVYHcyk1SaqwwyciIfjwnE3rronV79TPGGx6MAWMp8wIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmzJyTvr;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D730606A333
	for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 21:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D730606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mmzJyTvr
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2f04e3bf46dso35818305ad.2
        for <llvm@lists.linux.dev>; Tue, 24 Nov 2026 13:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795557048; x=1796161848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
        b=mmzJyTvrjC1VqEZLf2Lin0hWSfB/nUvO3/lRRZ1cEPWvPtmAEDaCZuPBGoXVCr7hWg
         Bo8d9m3jnskq6BOqx/Qimtkbs6U9MgtbCSNyKw3k/GSdZoFdSd7tLxYveeJJd7EdM1j+
         gMBQ+NWYTYWAUu//C4xb37DjIceKWXsmpzxVDxWh65ndVMqkSXICosqJFEj3DmWOhY76
         gYduLwvNl0+6MGOzsJniMtd8hgA5nZBebrwMO5UzFAYQOq8aeczsEQ0bFUNuQNYOUpSU
         W6i4DBxUjs3EgcVsOPW6Cj9apaaGlxskoGlwsrBnQ/HQzCStWa5zqHy54T0kCBD9wE4p
         5udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557048; x=1796161848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcG1d+MWwg/1DfbKYXBKtvm7bkhq2utJdZgq0Y5kIiA=;
        b=kDOi03BaOpTqicCCwwuUWYGkZ7GFZTmcMVN7bMyWuR+IfrUJg4EwnR9F0S6CcTHhUn
         lCf5yr8ds1EOVfdFbHrVPk7cCrdxPQ/zZa7feGHMgDr0RyEKXwUgglasCtC5TKoymCoG
         RK9CvhU+4BWMGRizV0A1ZfZpF101kST7L0H2r7vdT/FzQ5EPXfs28SPho09LhT/05XSV
         bX1QCfD1LiUgKYkUW8n0uG6EBb4T7cutQ2+RzQbL520PxQD0qBTgIe8/1DvbuCRaXfyR
         K6cFcA9LUBKP75jjpsjn6jcQZGD6mKuVLJmFDlwh5jyrNrX/M8Ivgh9YGdo0yoVuIl2z
         uyGQ==
X-Forwarded-Encrypted: i=1; AL+hErEepLZnn9fru/Cyma8IPTt/29jhNv6/K/ajlmazgLfUyluv1Y8LxOXyC/VgWYygFCg1R0kz@lists.linux.dev
X-Gm-Message-State: APuU4Z+2Z6l4MSpIgWLnudsVTdtLYsOTROHxc2GwBiOnmt+fMhycCm4M
	hTQkhUlZoQdwjJFVIx6UhCeIkdLSJJkgwAvw0LqU2W5TMn20lN4g2uBY
X-Gm-Gg: AZFdTZdr0xJOQPMLXlF88K6mAxorboXz38ojtxkYLKMku4tF+2l+OhG9LFeDYqLCJ/P
	GRhsPHLSet78xbQc+tTsgJypEtXQtVAcXLDXCvVrKONKPrwdotBiVjlI4celvY8HynOxWTv6Yqy
	MUZCaO6iIVWhEsUn8XSMbRVIlB9BD2alowMIAgS72EnKqrbYpjunTgEhrb28nrljko4k/PJfjsc
	rRish5Gd8+7QCzzQVYCqd9WXflREytnplAl8kF9Px25jpgTo1h9/IiYe8rQd70c4739Gdx9hqqh
	5TfcFwRKBxZnjPzU+LPJHQg9HD13amPUZL2bz+8ItdqbHsxI7nsB7yuwRD5PRBAdWaDeio9pKhi
	7Ucy3B+IZGhSdkx1teTzBfFRjvgHNxpmFsMm+rUvEHWxupLwy0GCK8jtvFBtI5kWvpNwUfsrADH
	BCPBYBg6lM9IbBy3TL0He969qp8IfPyHFCZ7bZLtZK7nVIAIj/CT4m+ldFdMFkgd7NUtPlXDon6
	klDU6znfleKuuMPwAANCIt3CqskvEPxmc+gJZrUoAnnODY+NyEX1Pe33Dkrfs+nWCgqPGyldPkI
	Xc5Z7t++YkyOx/kNKSxYF3y+kFRAE/1VpQCmm0sahOtkXBanR1AybLc3oYhQzlcM2W0kp/Oh/Oa
	N+deS/ArVpetbLlHRFjf8sUDx1IE+dRHIcEUBaVvICrX/CIsUJPVkDqGse4Sm3kr0FmogwazD5p
	3+EQ==
X-Received: by 2002:a17:902:f652:b0:2e2:d77b:e587 with SMTP id d9443c01a7336-2f03f1cee76mr168499075ad.18.1795557047737;
        Tue, 24 Nov 2026 13:50:47 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0742996aesm47764545ad.11.2026.11.24.13.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:50:47 -0800 (PST)
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
Subject: [PATCH wireless-next v2 2/7] wifi: brcmsmac: embed modulecb array instead of separate allocation
Date: Tue, 24 Nov 2026 13:50:35 -0800
Message-ID: <20261124215040.1261999-3-rosenp@gmail.com>
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

Replace the separately allocated module callback array with a
directly embedded fixed-size array in struct brcms_c_info,
removing one kzalloc()/kfree() pair and its OOM error path.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 --------
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 3834f2da5aa7..ed022fd2613e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -420,7 +420,6 @@ static void brcms_c_detach_mfree(struct brcms_c_info *wlc)
 
 	kfree(wlc->bsscfg);
 	kfree(wlc->pub);
-	kfree(wlc->modulecb);
 	kfree(wlc->default_bss);
 	kfree(wlc->protection);
 	kfree(wlc->stf);
@@ -464,13 +463,6 @@ brcms_c_attach_malloc(uint unit, uint *err, uint devid)
 	}
 	wlc->hw->wlc = wlc;
 
-	wlc->modulecb =
-		kzalloc_objs(struct modulecb, BRCMS_MAXMODULES, GFP_ATOMIC);
-	if (wlc->modulecb == NULL) {
-		*err = 1009;
-		goto fail;
-	}
-
 	wlc->default_bss = kzalloc_obj(*wlc->default_bss, GFP_ATOMIC);
 	if (wlc->default_bss == NULL) {
 		*err = 1010;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
index 425c867964e9..8af883e40876 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h
@@ -517,7 +517,7 @@ struct brcms_c_info {
 
 	struct brcms_bss_cfg *bsscfg;
 
-	struct modulecb *modulecb;
+	struct modulecb modulecb[BRCMS_MAXMODULES];
 
 	u8 mimoft;
 	s8 cck_40txbw;
-- 
2.56.1

