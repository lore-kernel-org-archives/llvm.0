Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108139;
	b=IUqrfhF/0C+oqowVvQzMrcxRo4PI03nGmXwsvBJA8xbGSayB+v6xRaFczd2FJJKRIdQ1
	 o/Ipbh/9iLqbmYNDz/iqXv9FkLKFxerH7Mksp4JE/E+jykhsSMgumi/Ym1zmGNd+XUzVA
	 JEz45b7SwALp6rWYARMUvb6OvAIAbnl2CPV2gzrc/1CT+ToHce/zvAgQ/53inWHQf4rq/
	 scDvoHkzHOJsu1vCthap4UPwdspahY6Jp2dlimWTyVqN5BCKxBeFbkr+Rlq1/cT81/J1A
	 uGvQWRdAKkSN26/ZQ6AsCu0ZOFIt8xJ+zOO7FloFmuWGuDUt9A6liexG1xpTKl01KOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
	b=vxopef+19JhswhzR4i2dJ/64vjyoEbybJInT24uSMRxFiDgmIz0v8E+ZOI9noN4Ol6jR
	 TfzmVM82FG8PLzEMp2cHh+X3mwJH/w4jRO+AS4by5PwvQbe+bUATACp4wMfp3AEv+PUmc
	 v4Xy1PjgJSBRS/nldH7+XIAd/9StuZVn1EZKNzxFTUUBOPG8NRpz5g7JawOgIJrU9eudm
	 F0jZXJBPlZyuN98p8f6IBy2g4xBl/Oh+lcHXAHSQuTIjL7bI4xothfXSWT4W2bgIp9aQs
	 LHqZfQFvwOOm8mxSFidCD9wu0So+LdewuXOdCSKnTehx0i0jw/Ve+WS01KIau+5wwPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UxRVRMna;
	arc=none smtp.remote-ip=74.125.82.72
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3460A2607
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4A3460A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UxRVRMna
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae17c536so2292627c88.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108138; x=1795712938; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
        b=UxRVRMnaW0EUANwByH4k06bxXx7KqVrb0mYP9iaKiaSKCmCg/EOc0sM36xpAKOkIpz
         RMAEe/DakPymnf+WyGZS+9xfmUUa+Wv7MFv2JScWLyyyZHG5hWXc7ZH4b9unXG6+Pvye
         nHR9SH9i+27ZONMmcoCUslj+NryLRfxeClnmTgw84+oR+77eRupSpmN7yiMnOPgTrTnE
         oGtggQFdmosoFONKXst3SLE4vlDeZ3bvOUoJL3KTQnwmtMvU0XDhm5/niAx0SIYoCzmu
         GGDo6kBnxwpY+l161pBCZDAOCaOO+73LZbmHXN7gmVHDJNxZXk06aY7RW5Wr5wBUcu5a
         lhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108138; x=1795712938;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BeMwuZ5xgQDXIgYlBcolpETHlDVDX0QAKZ3gBy9Xss=;
        b=GJmNozv4+hEpC1QgA5ShpgCK6PEGjJPbynQkDjBx/zDiyQNefn4LF5r0x9Hk70o+/f
         OeyVKRE7J110NztLkv3NLQV09zIdGm1catq4xmf0gFiodEtcz0RcCE+lWOgZSrEfbUHJ
         e1y9yiujJVAjaDpui3uuqvJFs/PIXl24oS8U3THdsWWqJ9WC7MpR51gi3pObVx3QPGp8
         4lN19AF+l2rM1B3BgRtrKIy6Jhxj9iHpxENy1oILWjsIndrOXAAbGQjNwuYjtfwnpHJz
         dUz9Z0WZTYii3iLYMamxiD5eVAJ8eM8M4yC+nBgEi+roe3pHI7dt1GZcObIC/CJaHyAu
         VCLw==
X-Forwarded-Encrypted: i=1; AL+hErF3FfLylhZyfMYLp2Bd4LLLV8dXC9XUTFfdFZOPkpygnA2zCwnekDX5zYe407JLLrJ6HI+I@lists.linux.dev
X-Gm-Message-State: APuU4Z9w4QglJKDr2+s4vMwjX/CDagsCO/E1XQkTC85xKSDy87i9xbnW
	f6vMw4/dJ+Z9xKLI6+4GrbkqT2Fa4OG3AtcthajRZlxpo6qf6NF90pk7TVnaylGRZ0sjtSwaiao
	CKBP1Imd3sg==
X-Received: from dldyr22-n2.prod.google.com ([2002:a05:701b:4516:20b0:1a7:58c6:c957])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:290:b0:1b5:25e:958d
 with SMTP id a92af1059eb24-1b5567bb581mr257768c88.5.1795108137553; Thu, 19
 Nov 2026 09:08:57 -0800 (PST)
Date: Thu, 19 Nov 2026 09:08:53 -0800
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
Message-ID: <20261119170853.1529676-1-irogers@google.com>
Subject: [PATCH] usb: typec: qcom-pmic-typec: Avoid reading uninitialized
 state on error paths
From: Ian Rogers <irogers@google.com>
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

In qcom_pmic_typec_port_set_cc(), error paths from regmap_read() and the
default switch branch jump to 'done:', which logs 'currsrc', 'mode', and
'misc' via dev_dbg() and passes uninitialized 'currsrc' into
rp_sel_to_name(), indexing rp_sel_name[] out-of-bounds when dynamic debug
is enabled. Similarly, early error paths in qcom_pmic_typec_port_get_cc()
jump to 'done:' before 'misc', 'attached', '*cc1', and '*cc2' are
initialized.

Return early on error paths in both functions instead of jumping to the
post-success dev_dbg() trace.

Found via an x86_64 LLVM=1 (Clang 21.1.8) allyesconfig audit with
-Wconditional-uninitialized enabled; fix and changelog drafted with an AI
coding assistant. Build-tested under LLVM=1 W=1 (-Werror) and
-Wconditional-uninitialized; not tested on Qualcomm PMIC Type-C hardware.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 .../typec/tcpm/qcom/qcom_pmic_typec_port.c    | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
index b2ad31e85b5e..a1595b8b53e7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
@@ -372,14 +372,12 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 	ret = regmap_read(pmic_typec_port->regmap,
 			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG, &misc);
 	if (ret)
-		goto done;
+		return ret;
 
 	attached = !!(misc & CC_ATTACHED);
 
-	if (pmic_typec_port->debouncing_cc) {
-		ret = -EBUSY;
-		goto done;
-	}
+	if (pmic_typec_port->debouncing_cc)
+		return -EBUSY;
 
 	*cc1 = TYPEC_CC_OPEN;
 	*cc2 = TYPEC_CC_OPEN;
@@ -392,7 +390,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 				  pmic_typec_port->base + TYPEC_SRC_STATUS_REG,
 				  &val);
 		if (ret)
-			goto done;
+			return ret;
 		switch (val & DETECTED_SRC_TYPE_MASK) {
 		case AUDIO_ACCESS_RA_RA:
 			val = TYPEC_CC_RA;
@@ -417,7 +415,7 @@ static int qcom_pmic_typec_port_get_cc(struct tcpc_dev *tcpc,
 				  pmic_typec_port->base + TYPEC_SNK_STATUS_REG,
 				  &val);
 		if (ret)
-			goto done;
+			return ret;
 		switch (val & DETECTED_SNK_TYPE_MASK) {
 		case SNK_RP_STD:
 			val = TYPEC_CC_RP_DEF;
@@ -472,7 +470,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 			  pmic_typec_port->base + TYPEC_MISC_STATUS_REG,
 			  &misc);
 	if (ret)
-		goto done;
+		goto err_unlock;
 
 	mode = EN_SRC_ONLY;
 
@@ -496,7 +494,7 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 	default:
 		dev_warn(dev, "unexpected set_cc %d\n", cc);
 		ret = -EINVAL;
-		goto done;
+		goto err_unlock;
 	}
 
 	if (mode == EN_SRC_ONLY) {
@@ -504,14 +502,11 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 				   pmic_typec_port->base + TYPEC_CURRSRC_CFG_REG,
 				   currsrc);
 		if (ret)
-			goto done;
+			goto err_unlock;
 	}
 
 	pmic_typec_port->cc = cc;
 	qcom_pmic_set_cc_debounce(pmic_typec_port);
-	ret = 0;
-
-done:
 	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
 
 	dev_dbg(dev, "set_cc: currsrc=%x %s mode %s debounce %d attached %d cc=%s\n",
@@ -520,6 +515,10 @@ static int qcom_pmic_typec_port_set_cc(struct tcpc_dev *tcpc,
 		pmic_typec_port->debouncing_cc, !!(misc & CC_ATTACHED),
 		misc_to_cc(misc));
 
+	return 0;
+
+err_unlock:
+	spin_unlock_irqrestore(&pmic_typec_port->lock, flags);
 	return ret;
 }
 
-- 
2.56.1.708.g77570a6a1d-goog

