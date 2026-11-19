Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108078;
	b=0snqZFdjCylUl3TiVwGrMYHPcpSG1H4EI2FGRblVA/Ys3YgZ8pbHmBlu64r1ZD1lVl2e
	 CsDVft4XE5CKtGW9ybvbv4XgRIj3GD0M0Jtnv5uTCHgusWRya2Loa87dq7GMYJa/ozP5j
	 LpcUQAeJ50fIq5YtUiZZfedhCGgXdTh8BZKfVoaKP9VecHatxsiIF3L1hLOwlidRLiUoz
	 +vpaKKOiBsmruob/LYfTVVAabPK/xmsYF3COb/ABR+2cQoDjxIWMwWIF86vSJjZW6mRbd
	 R2qLansfnRdqDbLxv3kc2nEDhAzj3nwY7Nc6kn/To6uu1PJ5DAyS3l8remKy16D/UiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108078;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=qSSvwSzjsPxY7MUI7K379bqPT4XfxGjV3jqJ9Ia2v10=;
	b=5KmoxHvpmplvzbC4GDBgAjAdQLjc/Tku+X7dyCq3uEtv5g+E+elkCOTz/CrKRVRjk34l
	 p9/2xcOhYKebPG5ZS/kFvrAw5S0wSxDFqcF7yraIZoXFB8CHLkwlvJKLLMLt5p6NEzdIc
	 r2YDicVi3ZxmZWPE5ajZMfmsYmVu1K6nd3pMEEZmApEOasp6gPQTGmcJ+pVS4XoRVbJ8J
	 K0513E2LWiI3nbVcJhKgEFQ8/b3rk+8Csclqckk3CFfSeZWhXdb52e/Sx+7gJyYVEoodg
	 x+fqfuVHCrXaQlGx3ihqpoSlnlBHkNWQcBbT3rfxSL0PdeSEScW7w612+SWYpVmLZ3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b5MTFzwX;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208D9606A336
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208D9606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=b5MTFzwX
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3285162eec.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108077; x=1795712877; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qSSvwSzjsPxY7MUI7K379bqPT4XfxGjV3jqJ9Ia2v10=;
        b=b5MTFzwXB9tecFRuAIEMGZ7qVjrfBcQ1j7iEvAOrhcv50dPT8m+pNB7DD++ijGZpnO
         V9nXQhs5SPHHWYpHrJ0p1rLgguVAtvXj2kAdaif6aNg6JbjhuQ/3Li9Q7eVBqASTibaB
         abJZVCtcG0GlJbA0O7Hu++ea3dyN18Z9TAsvXjorGdoddIS70io2ErQlsIv94NZEtY26
         nVsOybI11jdLxcF1l8wy3fusjfsrpETY8V4gCAHiXwSWFFECWid+F3v6Rg1O33Lv8WCV
         po2sjdwrN/uBcmcewZspKJtBqOAmVjkcAoueTmjmTtMZyaZgQTYctmnpKmSMmLfc5oms
         UN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108077; x=1795712877;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qSSvwSzjsPxY7MUI7K379bqPT4XfxGjV3jqJ9Ia2v10=;
        b=rMhEe++J5stEwBkZlXVVt0TwaJYCtWVfPCUlMGnBjzBvFEy5WpGSvAnGeKxaglRrpj
         RajuTfdjr4er3RPvSCu8GKulamLCcwq7Pz38m5McaOxHhExyeSpawn+A/ioj0aPm9Vyh
         U1LfPIvYWxNX8oEpObVlIl/b/zs2yC5nM7c05hPpq8wwnDo0RWENTEVKQmHegF42pDRE
         vVM3h9jhgk7vEcBcO7AKB2D8eksutk3jsiS40FYAV4jEFxPY1amNR3g5Ad5qwBwgTftg
         aiIVHxoV32ahH+KF064sHfea8RIv32RtLWx11qBhmaqzk+eDJvhLi2adtzkSQORurnWe
         CF+w==
X-Forwarded-Encrypted: i=1; AL+hErFgdvbPd0+QOcLSTCeEUuIylhORh7U7NxHVbkayDg0WD+8449BJsZA2tPbSzqQLDSDzlt27@lists.linux.dev
X-Gm-Message-State: APuU4Z9RgwdO11Y7udmb+o4MWSFBgIQdrTWqEkD2XNvHeWQ8Nmd6Zh+x
	LbpEK26piAIhfUwBeT1p0MRhWPzsosxyJu9k3iaUWH3x34lOb9HPw9cUnjDwTLL05O4luS8GxpJ
	pRtYlzrN9Bw==
X-Received: from dyjp21.prod.google.com ([2002:a05:7300:4615:b0:351:1933:2028])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:dc05:b0:36d:4560:dd38
 with SMTP id 5a478bee46e88-38281cf6398mr7088098eec.37.1795108076745; Thu, 19
 Nov 2026 09:07:56 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:53 -0800
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
Message-ID: <20261119170753.1526210-1-irogers@google.com>
Subject: [PATCH] wifi: rtlwifi: Fix octal 024 typo in P2P_PS_OFFLOAD H2C
 command IDs
From: Ian Rogers <irogers@google.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In rtl8821ae, rtl8192ee, and rtl8188ee, the H2C power-save command enums
define 0x20, 0x21, 0x22, 0x23 followed by 'H2C_*_P2P_PS_OFFLOAD = 024'.
The missing 'x' makes 024 an octal constant (decimal 20, 0x14) instead of
0x24 (decimal 36, matching H2C_8723B_P2P_PS_OFFLOAD = 0x24 in rtl8723be
and rtl8xxxu), sending the wrong H2C command ID to firmware during Wi-Fi
Direct P2P power-save offload updates.

Change 024 to 0x24 in all three headers.

Found via inspection of H2C command enums during an x86_64 LLVM=1
(Clang 21.1.8) allyesconfig warning audit; fix and changelog drafted with
an AI coding assistant. Build-tested under LLVM=1 W=1 (-Werror); not
tested on Realtek Wi-Fi hardware.

Fixes: f0eb856e0b6c ("rtlwifi: rtl8188ee: Add new driver")
Fixes: 21e4b0726dc6 ("rtlwifi: rtl8821ae: Move driver from staging to regular tree")
Fixes: b1a3bfc97cd9 ("rtlwifi: rtl8192ee: Move driver from staging to the regular tree")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h | 2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h
index 79f095e47d71..583e1c51c5c9 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8188ee/fw.h
@@ -127,7 +127,7 @@ enum rtl8188e_h2c_cmd {
 	H2C_88E_PS_TUNING_PARA = 0x21,
 	H2C_88E_PS_TUNING_PARA2 = 0x22,
 	H2C_88E_PS_LPS_PARA = 0x23,
-	H2C_88E_P2P_PS_OFFLOAD = 024,
+	H2C_88E_P2P_PS_OFFLOAD = 0x24,
 
 #if (USE_OLD_WOWLAN_DEBUG_FW == 0)
 	H2C_88E_WO_WLAN = 0x80,
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h
index 27ac4f8b9a9b..e485d6f8b6bc 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ee/fw.h
@@ -89,7 +89,7 @@ enum rtl8192e_h2c_cmd {
 	H2C_92E_PS_TUNING_PARA = 0x21,
 	H2C_92E_PS_TUNING_PARA2 = 0x22,
 	H2C_92E_PS_LPS_PARA = 0x23,
-	H2C_92E_P2P_PS_OFFLOAD = 024,
+	H2C_92E_P2P_PS_OFFLOAD = 0x24,
 
 #if (USE_OLD_WOWLAN_DEBUG_FW == 0)
 	H2C_92E_WO_WLAN = 0x80,
diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h
index af8d17b9e012..d5e65186fc85 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8821ae/fw.h
@@ -131,7 +131,7 @@ enum rtl8821a_h2c_cmd {
 	H2C_8821AE_PS_TUNING_PARA = 0x21,
 	H2C_8821AE_PS_TUNING_PARA2 = 0x22,
 	H2C_8821AE_PS_LPS_PARA = 0x23,
-	H2C_8821AE_P2P_PS_OFFLOAD = 024,
+	H2C_8821AE_P2P_PS_OFFLOAD = 0x24,
 
 	H2C_8821AE_WO_WLAN = 0x80,
 	H2C_8821AE_REMOTE_WAKE_CTRL = 0x81,
-- 
2.56.1.708.g77570a6a1d-goog

