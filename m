Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645567;
	b=yHo7zMkcnCDZxAzHvSlXUq63wMgxDBZQWMt4BFLP0HhvLkZ2skMb5PRwHKMyYeOdwR76
	 M3k3Dz1V2XhPEUsJRLQH3NbOgbTh9gxAqfC9LcvlSjbwZfBXJ2HF+Cs91rqvd+annWsLd
	 GrkLPnbq+++zmtat8urJTtY6YHSy5SBSEnGrn+IpNMPKv3jJWHh7WX8u9lDlHideagVIG
	 2F+CCBubZFyiC+5PPmhYLzQvZs2hUw/S/z2QcluXadR92YNR0FwMlz26oiyrPD5ROaD8E
	 zojNGDtzL92R7bXU8LVPxtfsmmhryrnDKAHfkvjE4ukjZEXaTP+5enoi8yYWbkFCJzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=0rVVzmzY0lwgJTS0cbzP8cvMbI4YDQ41g7jiphGM+4E=;
	b=x+6rm1MT1+L6FWdyhZIagc+5Bq+ZSr7Mf7WTGFqhOyyo+9IacCsvCpjHo0Vj25sx5s1L
	 mBfx+vGzRrDf3z5Iq2muTF4AsSaPaPP6BDefQgNzV0Ac9D4tQ2gLidZY6vHjvnp5tAuSa
	 uVT08F98QNtHWBxf0+3EHZD+b96babAOgdMXknZDClG0fVLxHYDZfkfVvEWL8JfeUuxh6
	 Iv3+/3K5LFnGMcVVOV8IANjXRBwtvx+CKEYB5InlCHCSln44QmIN7WVtZLpZO1B+0QF5T
	 BlqKlh6LVhNdwyqfi82OHSaUpc8L6J3b7Fg1asf4olVi/zkNiNl8bT5kpn75lxPBpEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p37X782M;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F10A60A260F
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F10A60A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p37X782M
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6653074eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645566; x=1796250366; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rVVzmzY0lwgJTS0cbzP8cvMbI4YDQ41g7jiphGM+4E=;
        b=p37X782M081OWDyMz9lAkx/vLN5Sy4JA9lEwv1vxk0OzpRuwbHqAexH2ppSlfdQ5WI
         jxbWp58vvZmYrIiKNjh5GUhAZvZ4EU8ijBoZ93NIRUlMMNhbuLktPhBxDffGOfiyT1ny
         8RztTSS7Kgh3z5Vg9IS0PUB9cwVpFEZ+fNEujrthG5wlC6izSXmBriTMnoUvrycbtQIH
         cgEYecVdgloeJviob1Zev0ywsicr+9euaUjaeRPehAu8AzJemgBhBeV1SdM60w619Ywn
         DW3natw4JK0guzjZcvX7Bz+kfNYueORgdsZparz8y0S/Vueq9vN+H/HFBS/48Ng2e1Eg
         vsow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645566; x=1796250366;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rVVzmzY0lwgJTS0cbzP8cvMbI4YDQ41g7jiphGM+4E=;
        b=HNg5MlYKGOUranLGLY0LsFF/eygiYSo+FdNGY3fx5wrVeBH96JLP6qUKkv16h/mfpH
         ezaPLyrii7OQqXfnTd5Jp1ZSQ3zUpL2lpZFZyTHQSdL4jr2X69w0OFa+NN+p7qe2A6k5
         MqxYJlExtTkL0BM9yJq6SgwG9F4GN/UWeOpvkE+Df9bGwPyY7+qfiwS0P7Axsa2N2c+l
         JOmkR2cpx4xJ0uJ5TGw538zcsFUE9eVxV8fWkuyISpXt0+LHuzjyDopE6CfOzKSWIkCJ
         ZNWlrugNNN9xmdySWGjw2YHSQGKaFz/+8KNqOxfVMESqo4uzjLvvLlLqumqan2rbh5N6
         PxdA==
X-Forwarded-Encrypted: i=1; AL+hErE2fQjMm2oEukXEFsS4mLS+iQ7kdbil2diYXPO8GjqlgEF3qgSFNSYI7gNj4tHRniveFuNQ@lists.linux.dev
X-Gm-Message-State: APuU4Z/eOya11Q374xP2rnBZHLft1ai4HgUGI91L+BhRK0FvOc3CUore
	Plnm+ZiaCI6yTmSlPxFruDRTCSyIiNp5MRdUbaBKR6xABIdk4QoCOIz+8mhM8v0/Ux8WXlfMe/0
	kMA==
X-Received: from dlbtp3.prod.google.com ([2002:a05:7022:3b83:b0:17d:5c89:d119])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:f10f:b0:1b3:abd2:2eb2
 with SMTP id a92af1059eb24-1b55689ed61mr23336815c88.10.1795645566067; Wed, 25
 Nov 2026 14:26:06 -0800 (PST)
Date: Wed, 25 Nov 2026 22:25:49 +0000
In-Reply-To: <20261125222549.1447825-1-elkin@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261125222549.1447825-1-elkin@google.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125222549.1447825-3-elkin@google.com>
Subject: [PATCH 2/2] pinctrl: tegra: Add register bank bounds checks
From: Elkin Cruz <elkin@google.com>
To: Linus Walleij <linusw@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Aaron Kling <webgeek1234@gmail.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	irogers@google.com, Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

Add defensive bounds checks on the register bank index in
tegra_pinconf_reg(), pmx_readl(), and pmx_writel() (using
WARN_ON_ONCE()) so misconfigured pin group tables cannot index past
pmx->regs[pmx->nbanks].

Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 51684c5dda34..c0b584d37a8e 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -30,11 +30,17 @@
 
 static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
 {
+	if (WARN_ON_ONCE(bank >= pmx->nbanks))
+		return 0;
+
 	return readl(pmx->regs[bank] + reg);
 }
 
 static inline void pmx_writel(struct tegra_pmx *pmx, u32 val, u32 bank, u32 reg)
 {
+	if (WARN_ON_ONCE(bank >= pmx->nbanks))
+		return;
+
 	writel_relaxed(val, pmx->regs[bank] + reg);
 	/* make sure pinmux register write completed */
 	pmx_readl(pmx, bank, reg);
@@ -525,7 +531,7 @@ static int tegra_pinconf_reg(struct tegra_pmx *pmx,
 		return -ENOTSUPP;
 	}
 
-	if (*reg < 0 || *bit < 0)  {
+	if (*reg < 0 || *bit < 0 || *bank < 0 || *bank >= pmx->nbanks)  {
 		if (report_err) {
 			const char *prop = "unknown";
 			int i;
-- 
2.56.1.839.g22a8290db9-goog

