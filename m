Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02D23FC0
	for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 16:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1632156850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zzlABCzc1z/h8/5FAcURoAK3fN+JbZCA63Q184+5bRE=;
	b=D0W5jdNjThIhyoWyVBw3zvctApfu03hJHw63yNIepx+Dy/D8UnMhiw+FcNhEepVCGdeLfk
	Q1o4ty4MOTavW9UASsU4jlfvC57IunBiE+VjUtd0iWi+cNzUUqG7xDNvBKYZMt3gElkr9Z
	YPvpDSyVEth72hEFe3g6p0x26qQFBt0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-VHaJeMR1NDaC_rB9GwUm4g-1; Mon, 20 Sep 2021 12:54:08 -0400
X-MC-Unique: VHaJeMR1NDaC_rB9GwUm4g-1
Received: by mail-ot1-f69.google.com with SMTP id o12-20020a9d410c000000b00547056f6644so2482150ote.20
        for <llvm@lists.linux.dev>; Mon, 20 Sep 2021 09:54:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzlABCzc1z/h8/5FAcURoAK3fN+JbZCA63Q184+5bRE=;
        b=DJMM8YdbfX3zsK7EnFzTp7efeqUyYywsoGadZOS08mzXdeBAZxkYz5QzMcTjmvmsJX
         D9odXp9CHNIkfn2RxQOimCkPhcaRuwNhbt/Gql/CTR2alwZqRI8PjThMe9jy7bFxtO5c
         IXPxfj949XkVGrd0glWs+wYULtt0v2XnLJIUWBTK5yNdneyd5t+hT2IlitrR+rwrXYv6
         RAbrcc+W3TZj7CrkZT214zzRuv+5njhYzcemNKEwjN1wFjc2tdNxWdC9kbISm6APgCMB
         7TSLg8pHdhFJCnsT0g3TjoX4J/r3usu7Q+UDY70ZyogYP3xL0iDkskou0prIdXuwb+1y
         PFpw==
X-Gm-Message-State: AOAM533DaLeqRCxl+1OT2nm8NxdpuM22jnMQ9xUZWaj/PjFZxsMhNLN1
	LTWYRCvlJ7N5mjUZev11qYqaUMgYAdDryG1SgIOOuHos2/EGXkX5tqOBGYVOAOx5BJo4u2UNHZe
	Y8gbbCg8tMGbO6Q==
X-Received: by 2002:a9d:730f:: with SMTP id e15mr9610543otk.260.1632156848200;
        Mon, 20 Sep 2021 09:54:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygBfy+NDy+BtEjDMWKR++vLlpw334lp+eSEKAbxnS8Kvxh8fx/uF1qqFopyFLbZUtFviSxKg==
X-Received: by 2002:a9d:730f:: with SMTP id e15mr9610531otk.260.1632156847992;
        Mon, 20 Sep 2021 09:54:07 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id r23sm3502079otu.54.2021.09.20.09.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 09:54:07 -0700 (PDT)
From: trix@redhat.com
To: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	jerinj@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	davem@davemloft.net,
	kuba@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com,
	schalla@marvell.com,
	vvelumuri@marvell.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] octeontx2-af: fix uninitialized variable
Date: Mon, 20 Sep 2021 09:53:47 -0700
Message-Id: <20210920165347.164087-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Building with clang 13 reports this error
rvu_nix.c:4600:7: error: variable 'val' is used uninitialized whenever
  'if' condition is false
                if (!is_rvu_otx2(rvu))
                    ^~~~~~~~~~~~~~~~~

So initialize val.

Fixes: 4b5a3ab17c6c ("octeontx2-af: Hardware configuration for inline IPsec")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
index ea3e03fa55d45c..70431db866b328 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_nix.c
@@ -4592,7 +4592,7 @@ static void nix_inline_ipsec_cfg(struct rvu *rvu, struct nix_inline_ipsec_cfg *r
 				 int blkaddr)
 {
 	u8 cpt_idx, cpt_blkaddr;
-	u64 val;
+	u64 val = 0;
 
 	cpt_idx = (blkaddr == BLKADDR_NIX0) ? 0 : 1;
 	if (req->enable) {
-- 
2.26.3

