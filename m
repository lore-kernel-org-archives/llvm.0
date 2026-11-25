Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645051;
	b=HinwFb/t00Rh7IBFWUfraRnKUjobFCbJmZeuH01/zlUJYbwy1CZtFkPQgUMr7/TmJzaZ
	 W3LpXg/3uedeIhlUuYs1P4x0Xgl9eaTxCiUuobuVx0fnXDSIBJlxn1tGm2JdHsTX5dSuw
	 U2kEAmHEmxqiz7eB3VRQ+w3k7pYEAAQL+RaXZWtevAdgiStB6CBBTU8ANbwpOaKnERA92
	 ZO9pzfvAinvz+khI5RGIZfhwG+jLbk03uA5dsX+gxxj4k0jIBlscjQQ11PPof6Mrax4wC
	 QmJ69vHFSQheBdIwgp2xwu3mGbkA+VygFfLL82uA9/iFi5bj0jzs6nr8GfDuCOXrdMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
	b=23W6mIvWyy13o54w6HQxpTTjCNkR2hdOLv2PmqM5ZHoZFgOn/IhGe/D0oRrLgkI8gwwH
	 irWsgp5wwGUWDZSF/5IZls215eQX8xyvD8rTDWI+Mf84g5lh4hUi2Lq3pxDuM0GJhrzNQ
	 DXpzEp5KfxDlDoEV3v/0mtJO6CMTkZMDLu1oo8RnF1/6jVxmIFkoyw0CkFCnlP6Ld1S1W
	 AdOH9TiiURv1R/dd/Ev0CCYGpAfuCCc0tTeLg8SsBIykJ5xnzmyCMmfA69XJQI78klbxd
	 JSqp+ycM6zhfOqvWvvJE6KPO9573NYnRY8D20CDIpxbTKR2jWpu+fTDoTY8KmrxRhRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IMNoideV;
	arc=none smtp.remote-ip=74.125.82.200
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D13606A323
	for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 22:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0D13606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IMNoideV
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so471068eec.0
        for <llvm@lists.linux.dev>; Wed, 25 Nov 2026 14:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795645050; x=1796249850; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
        b=IMNoideV/zbu1XlaBYmYoYVms1R+SylQWQ355U73Br66FXGlo/tincSNh73lAn99+L
         i9TqXBXsxjUhqDibjReDm5Z03Pr+ffJedoo8fPLUoCfG3vu7IfwtV0qRhi+3nHsAHz5u
         ndckdRzn1Q+A8zJnh6fxC4UHwgRQRElHqm7mI2BgiztJnBXjhCRdcgN+/n7eHwPK4WvX
         Miqd1bJzYp3Savb303q7R+dG/D/MF/QYQINlGCYSannwVu2xNtuBjCsrm/eutIrBwsDy
         uo3T0TgCflnyYHBzOHFojzyF8j8PnotoNqg1Oa9wx0s25QsJDaoQUR8gfeYswtlXXK3b
         zEEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645050; x=1796249850;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lv54m/y+dipKo9yg+wSMdMb5I16q7BiPD4/g2CnTvkE=;
        b=U7K3Sa9CrdOa4uwP17Mdx8qQsDz7si92WY0Fqx9H2aB9e9MHxzSjsJmYqOIkdAzKyQ
         iLM7bTfapV/3PXxZfOMx0Q2qzrKDfuK43doz9dmampfglBeK7sfDcHwFXCyKVo32e5kC
         UKqSAYeIGaLAfGn9yFfNsO7Qm/0SEIaqeGLoRdvdJlZoI2hgjKkNQZbVLQ0Lm9Hgwcvy
         9pQP69PjAFu73xfxAxXlUfhPUg5u8e+/vjjy1WIJ/C8TINY2DF0E4q8Exh5jL4GrhwpS
         LqfOADmvWEXmlaNs2hZiy9GtcmhFM2zBJkPVJmqU5tBfgCE84cDpcUmQdHwMW+7vXAjl
         CUPw==
X-Forwarded-Encrypted: i=1; AL+hErEWwUbPw/rGrK3OQWX97L7upLaq5zlmBFIk4xBTmJtPykV0I6j3ciCtkwl/4HgHsWd8MRUH@lists.linux.dev
X-Gm-Message-State: APuU4Z8RdYasUUxAJHtnzPPRhQbi9vfWXu8/719q16PP5yX3dEc2xIfi
	BOeKQme31bYSRw0bc2jGo7CzFYWV+KyK7Y3+RtYSgm+wU9PdaKVjUofs8g33zmcPHDDAeCLuqgx
	hVA==
X-Received: from dybph20.prod.google.com ([2002:a05:7301:4194:b0:385:8165:80dc])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8604:b0:386:b3e6:e741
 with SMTP id 5a478bee46e88-386b3e6e883mr8734453eec.26.1795645049680; Wed, 25
 Nov 2026 14:17:29 -0800 (PST)
Date: Wed, 25 Nov 2026 22:16:58 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221658.1420387-1-elkin@google.com>
Subject: [PATCH net] nfp: fix use-after-free in nfp_ccm_mbox_skb_return()
From: Elkin Cruz <elkin@google.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, oss-drivers@corigine.com, 
	netdev@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	irogers@google.com, Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

nfp_ccm_mbox_skb_return() casts skb->cb to struct nfp_ccm_mbox_cmsg_cb,
frees skb via dev_kfree_skb_any() when cb->err is non-zero, and then
reads cb->err from the freed skb to return it.

Read cb->err into a local variable before freeing skb.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: d3e4dfe060cc ("nfp: add support for sending control messages via mailbox")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 drivers/net/ethernet/netronome/nfp/ccm_mbox.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/ccm_mbox.c b/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
index aa8aba4ff7aa..c0f1d84208a4 100644
--- a/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
+++ b/drivers/net/ethernet/netronome/nfp/ccm_mbox.c
@@ -420,10 +420,11 @@ static void nfp_ccm_mbox_run_queue_unlock(struct nfp_net *nn)
 static int nfp_ccm_mbox_skb_return(struct sk_buff *skb)
 {
 	struct nfp_ccm_mbox_cmsg_cb *cb = (void *)skb->cb;
+	int err = cb->err;
 
-	if (cb->err)
+	if (err)
 		dev_kfree_skb_any(skb);
-	return cb->err;
+	return err;
 }
 
 /* If wait timed out but the command is already in progress we have
-- 
2.56.1.839.g22a8290db9-goog

