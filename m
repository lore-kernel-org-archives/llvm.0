Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2986357D1E
	for <llvm@lists.linux.dev>; Sat,  1 Aug 2026 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785563739; cv=none; b=EzbBs5218jUU2bKndlps5oWU2UYnnLdVWwaDWN1T8L4f+FDk/8HUqg9GPX65U7DrIvS+dMohXun9b7+WAcrvt8aT6fQrdmlzY1UmrZ8UphRicbjaAkYUgO+Cg8yfwlwPCx1vgLoTwFYZYnkL1zJbSMXjSNOlt7DvAIfdI6AIal0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785563739; c=relaxed/simple;
	bh=ZHdedNPcudEcVol+83qSYMha4eWY9xZ3jg45Y9HOidY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CBGY9z/fexErcItCBItH2vqBPE/Okqc/3DyP0kMbaxxSHQNrS495fsgTvHCwrlRThtJ5D5km5h0+D5dlQCYnuSRLa4USyo68S2xliLJHBUhavfH6Ds5hxKamg1mLTGIK3zxscrQldrN3ZiN9vWhNNkdGrJvd5v9Nf1336EmJscA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=oZaMH4f1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="oZaMH4f1"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1621819a91.0
        for <llvm@lists.linux.dev>; Fri, 31 Jul 2026 22:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785563735; x=1786168535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d0YoODerQIzEOVN20KJQiVnY06JcnNCgCt2bly7t1Fo=;
        b=oZaMH4f1H0RmKvHdO5SZwgSwHvpajrX8eRWAqNzY/dFSOkZdEHO0u06V3iwnRpmUYO
         DNat82gOerlRMenGClNHng/U+YpXJyEbIWcO0w9LMz2Nnqyb2nWDQuLnhgbZvsCM3JnX
         Er86Hf78INk/KKxNHPLB0HbrefnrD3V8Ijq/rjIVpTGS7oXzHIA0CFztIB10971BcbDF
         rBSPGC+Xwz0UvuMfwubonbN7/WQYhXIIfX2m1FswbjY0xMq+qio1Tx3s8jozyPnMrMqJ
         OcVhgiLGRcWuq45mrjoje4+LB0T0LXHlOFFu/APkoGSStfkuZUX2+Wa5iIujxqpHB7dA
         +FsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785563735; x=1786168535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0YoODerQIzEOVN20KJQiVnY06JcnNCgCt2bly7t1Fo=;
        b=OQhvnh7XprcccZFy3e9+vCwB/D+2+Vd+G5K3afXGdsOxFrsp7iCWQ9xRJeoWLFvL6w
         jomcEXZ3xn2aSvaRyzqxz8FCMuW9TnSDMaa7hU5tpcDLjzthUWfCtc0beRgtD6RDiq9a
         N7tvMYBFsL3BYbwfzkHfi6yNY08tSrjmlyksaAhuSukIFyVg8wmUY1INQ0FHGuPdPt6N
         LzvnQLOyKeuMGFBgK6UhHfDf2poyU1ZjDGYAGuZBn5KDzceGss3DqxAWJ/IdZvX9GjFO
         U6e4TzzkKbeTKxK0kf21CwXtgR3VwgTy3VgeTIU3aKVSVg2R2oXibJJ4/jmfsgLB3mnK
         EIQg==
X-Forwarded-Encrypted: i=1; AHgh+RrAtcEen3aiGOWugoCBrMex8pzEyJRRqfz0X4ByYGie9XMCrnOeOTUzzza4fp0YzL+9aE1C@lists.linux.dev
X-Gm-Message-State: AOJu0YzlwFBhU5+QeM6pYDPbrUpI29w05ceSZpC4Lvm+mNJkzRTALTV7
	ppJ6HwNTbqbONnAhLlX1mxuzosI/ZXEpa7Iypj9tGEX/L24Mb8XEE236Z8ZB0I3X5Ts=
X-Gm-Gg: AR+sD10xfRPwpxRzOOwZ2N1pn3/5QxNwxxO0YTxmMqn2bvfOz/XB6jdp9K+f7Oif38I
	W6tOt04or6osPDWPqX2EvUa/913c0Z3jPz5JAIVqzRjDr7HnCsL9hvjE1oCPhbPGfwWEbu82dmx
	ST2fH9qMboiFardGWhUj/3Goy27u7j2bmu17SMArSLz3XlFIYfsiYWQiv64erZ7ZtkVBBaA0td4
	k/6mczno6i7qKjG9m4wkt4fa0IYcRYkIh3t47dfWya3NMzlCiuGIIPMjL5JyYVlhiTt5xD2Oe3e
	O4/sDvZIjCqqEaMuT3PngCt/KsNvEI1unZlR90jPrBc6Af4LPW8v8gdsMNVVGqZMH05NiaIEOMW
	IFFdlQKDndV9vhA8kTG0MnstbXJXwMwPj2+v2mdhNX7JhK3LHtNsHMCArw6EZfXRPHXrMDipV3f
	QMoK1MKSUTtMODQOZwfMKd9fsweNV/NbJCFvTGZTm5Ym/qby3crDmX6eE2iwAb3VKW2CAg4dHlL
	iDhIV5+Jd7wOdBA9s3z1dcjID2c/FSWDtMj1w9yOQllOaQFS4eYGpKbo1JYSovnIk3c0D6BwQzQ
	s61XxXVFi4ew2cU=
X-Received: by 2002:a05:6a21:9995:b0:3c3:b4e8:5565 with SMTP id adf61e73a8af0-3c92a8f301emr2512911637.61.1785563735027;
        Fri, 31 Jul 2026 22:55:35 -0700 (PDT)
Received: from Metius.iitm.ac.in ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13fab050d8csm16502537c88.0.2026.07.31.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 22:55:34 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: Steen.Hegelund@microchip.com
Cc: Abdun Nihaal <nihaal@cse.iitm.ac.in>,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	joe@dama.to,
	horatiu.vultur@microchip.com,
	stable@vger.kernel.org
Subject: [PATCH v3 net] net: microchip: vcap api: Fix possible memory leak in vcap_decode_rule()
Date: Sat,  1 Aug 2026 11:25:05 +0530
Message-ID: <20260801055507.47534-1-nihaal@cse.iitm.ac.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The memory allocated for struct vcap_rule_internal, keyfields and
actionfields inside vcap_dup_rule() are not freed in some of the error
paths in vcap_decode_rule(). Fix that by calling vcap_free_rule().

Compile tested only. Issue found using a prototype static analysis tool
built on top of the LLVM compiler infrastructure.

Fixes: 610c32b2ce66 ("net: microchip: vcap: Add vcap_get_rule")
Cc: stable@vger.kernel.org
Reviewed-by: Joe Damato <joe@dama.to>
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---

v2->v3:
- Rename the error label to "err_free_rule" to denote the first action
  being undone, as suggested by Jakub Kicinski
- Move the information about compile tested only, and how the issue was
  found to the commit message, as suggested by Jakub Kicinski.

v1->v2:
- Convert the error labels from "err" to "out_err" to avoid confusion
  with the err variable, as suggested by Joe Damato.

Link to v1: https://patchwork.kernel.org/project/netdevbpf/patch/20260727125757.134611-1-nihaal@cse.iitm.ac.in/
Link to v2: https://patchwork.kernel.org/project/netdevbpf/patch/20260728114253.196398-1-nihaal@cse.iitm.ac.in/

 drivers/net/ethernet/microchip/vcap/vcap_api.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
index ff86cde11a32..788c0728d763 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
@@ -2427,18 +2427,21 @@ struct vcap_rule *vcap_decode_rule(struct vcap_rule_internal *elem)
 
 	err = vcap_read_rule(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto err_free_rule;
 
 	err = vcap_decode_keyset(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto err_free_rule;
 
 	err = vcap_decode_actionset(ri);
 	if (err)
-		return ERR_PTR(err);
+		goto err_free_rule;
 
 out:
 	return &ri->data;
+err_free_rule:
+	vcap_free_rule(&ri->data);
+	return ERR_PTR(err);
 }
 
 struct vcap_rule *vcap_get_rule(struct vcap_control *vctrl, u32 id)
-- 
2.43.0

