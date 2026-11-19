Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108245;
	b=vVdznOVaWOs5VbA2oq4fDgabi43CfcsQo2ojvSdi6E1ggt0yse9nMbg7Jp2OW6YFmCnW
	 aejwUoum8t3D94vRici9JoOR0g6Aa1aC3vxw0kqmIII2VS1p2YVBivAs2ESnArI87IuXR
	 Q44eo0yvWyaZhSpZPPXfXNhG5RSFhDHC2rfZSngzzhs2y4UeiEfN8M3Hk/C6L2lAvkP3c
	 +TiaCIhMSgg8NhyWYVxu08IX3Ak5Sr5RCcKn4y0gObaM8nfThC8Ds66zgfchgTNvY3+1/
	 K+hcDVUUEeJyE3QN1Vd0OSRmknRiPc4gxQHAWDyJHJc+jMyPAs2JWBBUuaOra4d6ILQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108245;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Wf/5Oq5mchrTyiDMKcWORLhQhELf6w7llq5mVEibG3E=;
	b=MKprYOJSMUJ6xyX21euCUlcxRddFLpEa9Pgbrie4RI07WnAf0KvAW/oe1+ukVvPFFR8w
	 C8G4VwL1aVfJ8pmhEzxcwD3OOrnZUxdjy0N8OHnn0VeIvtS5vKrpOUziBTU1oyxu1GlyG
	 cDmlx91Bn0tK9ykIWh39KXaHNw3HCwp4zPtpZuLF1q12zjBkLdecqkUQyLPZb4mBNqchb
	 vlrscyd1tK9xFmfuV7csxhlWmjgDtxfzWvLSZIFVvsUxARoWMrl6t7UF25RBSs0XPHA9i
	 J2IjXctPvyzXLCw4WVc2ybm1TMvD1TYxWROuiF+Z411N9ZVjy3PzbsoDVhMfkW0E1/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YvAkXEp1;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E62460A3827
	for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 17:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E62460A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=YvAkXEp1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b41333cb47so41299a91.0
        for <llvm@lists.linux.dev>; Thu, 19 Nov 2026 09:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108245; x=1795713045; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wf/5Oq5mchrTyiDMKcWORLhQhELf6w7llq5mVEibG3E=;
        b=YvAkXEp1Ks+S1PbJRtZVppZe9y3lzwPy4gC98KolMuHkdmh9/jVrznE5MOKuwteoAG
         tSUdVchg0Yotto2AqB6MqIvmF4Ob2Yw1QoVrJnuR/j50Ps3BcNL5Mvn42qyVmI4zWIYO
         yhsq1Stje5cd/+Wj4Wk/RM6RowbUbKaDjNKidT5bxjM7YeLT93tC4xFS8aimFEax3YLK
         zgO0o6ddPN2vjoq66nOETwwfaFRLzgwhVrusrl0k5Po85d9h4ER1qf7OX41O6LlFnyUP
         mOiCS4UdHLRodISypDADisinpTaUqYddHCt2rTUx535ZS59FHjRwwdH6FN6psiS0YMM1
         rW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108245; x=1795713045;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wf/5Oq5mchrTyiDMKcWORLhQhELf6w7llq5mVEibG3E=;
        b=bm3XEmZb5W5Kj9/XV/BHbILc/isFyUIMfihZIRNsG5rxy8Jzlbca/M67xvrMRm13vi
         eUaK+V4puCsJN/SuCb3wXxOd+YgZkqza2FTdD8tDTRHdLS7SIGplDHdr+NsOzcwsrUht
         y0S3iJCtgc4AgcbuvMzHnx88KHusprmpKD0ac4hpriuGuT55r5ExCYcLQQmB0jTDAE+i
         21rbCCaZVfu3LW3anZ16Ey4d9gJX4lcDQUtQCP8J+0gHX3gSJyW4DG0syC7PXgDn9zLJ
         qcNJ+ZiYjro03rhRFyIbsGM1KEILEsq0xw/GukH5ZhnVzH19cPFW/EQE/tNiU5f6WTtO
         WP/A==
X-Forwarded-Encrypted: i=1; AL+hErH9hDP5mQBOOGBTu95hl7BxoYPbJvPsoF9WT+mI8dSX5cNyPlfgsbGoihIWs10pGARwWX3t@lists.linux.dev
X-Gm-Message-State: APuU4Z/2fKxYsAO6qN/A2GIeNRgiHWYHf4CzuX5xjs8GgFxVf62jselC
	5Q2KfA2gmS01uAqXe4fC6JqR0SzIecKhpxlzW7OHlANaNvsoYgN9oEE5ck9NM2LoIUSU8bxn+Ju
	kfcDmDduTJg==
X-Received: from pgfv9-n1.prod.google.com ([2002:a05:6a02:8749:10b0:cd8:5a84:95f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d10:b0:3ac:a1c7:20fd
 with SMTP id 98e67ed59e1d1-3b41c7ac351mr40117a91.4.1795108244548; Thu, 19 Nov
 2026 09:10:44 -0800 (PST)
Date: Thu, 19 Nov 2026 09:10:41 -0800
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
Message-ID: <20261119171041.1536322-1-irogers@google.com>
Subject: [PATCH] drm/tidss: Return drm_mode_status values from tidss_oldi_mode_valid()
From: Ian Rogers <irogers@google.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

tidss_oldi_mode_valid() has return type enum drm_mode_status, but
returns -EINVAL (-22) when the rounded serial clock differs by more
than 5% and 0 otherwise. When drm_mode_prune_invalid() logs rejected
modes via drm_get_mode_status_name(), status == -22 computes a
negative table index (-19) and triggers a WARN_ON().

Return MODE_CLOCK_RANGE and MODE_OK instead, matching
dispc_vp_mode_valid().

Found via Clang -Wimplicit-int-enum-cast on an x86_64 allyesconfig
build. Verified by building drivers/gpu/drm/tidss/tidss_oldi.o with
LLVM=1 W=1 (-Werror) and -Wimplicit-int-enum-cast, and with a
standalone C reproducer; not runtime-tested on TI DSS OLDI hardware.

Fixes: 86db652fc22f ("drm/tidss: Move OLDI mode validation to OLDI bridge mode_valid hook")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/gpu/drm/tidss/tidss_oldi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
index 62c9780f7855..3b5046628642 100644
--- a/drivers/gpu/drm/tidss/tidss_oldi.c
+++ b/drivers/gpu/drm/tidss/tidss_oldi.c
@@ -322,9 +322,9 @@ tidss_oldi_mode_valid(struct drm_bridge *bridge,
 	 * we use the same 5% check here.
 	 */
 	if (dispc_pclk_diff(mode->clock * 7 * 1000, round_clock) > 5)
-		return -EINVAL;
+		return MODE_CLOCK_RANGE;
 
-	return 0;
+	return MODE_OK;
 }
 
 static const struct drm_bridge_funcs tidss_oldi_bridge_funcs = {
-- 
2.56.1.708.g77570a6a1d-goog

