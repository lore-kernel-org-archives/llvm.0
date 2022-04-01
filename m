Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B307B
	for <llvm@lists.linux.dev>; Fri,  1 Apr 2022 23:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648856290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pzVHxoX5/TWOSCvHDrWIJIS9FyjyMwnU9Qnf7hNn4W4=;
	b=PHpWcp910hSBxsCcZvggg3DwjKS5oxEPwsF0q0Nn/ikYHxCHsOrQ6ztvHL17sD7puj4w5z
	2ZIP2GGNfm6Vz0tznUU6pcuIdzh+jMNSnsz8km+CJ3ItHPcJuH1xzN1uGnlUrVPMnDN3dZ
	wsaJ7f+MD8/FhF6G7GkF2+C/zaLGIsA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-29-OPZY-irXM4uTWB3ULXyvWQ-1; Fri, 01 Apr 2022 19:38:09 -0400
X-MC-Unique: OPZY-irXM4uTWB3ULXyvWQ-1
Received: by mail-qk1-f199.google.com with SMTP id bk23-20020a05620a1a1700b0067b32f93b90so2844751qkb.16
        for <llvm@lists.linux.dev>; Fri, 01 Apr 2022 16:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pzVHxoX5/TWOSCvHDrWIJIS9FyjyMwnU9Qnf7hNn4W4=;
        b=ohcOu51WB2ymvErDpbPRjz72rxd4IrlFEny2srHDmQUp4PXoEbfFzFtkwtx5cOsDD7
         Q/J6wD3XUt8+XRMTB3JCF1SL4AXZXxSN7nm4vVz7Or19MS6gsjojYLYu3phB66V2kwa4
         HZL9V2N7KopPdBFAHLL0B8F+CcIozOVKCsjInR/CdpjDBrhjlx7mXa0wFMzm7MGUCcaX
         w+tJrWaj6sAdTDMkrE3XXvR/+mbZHVD2nsNNMrENPrjLSEOShJLYLPRTpRwrXBvFIhBX
         hg8OzqCYYfj3OJHWqTzPDc2TKFAxWt+gwKl+hfNomgQnmG5VwtjA336ALP6fsDWf6aM4
         kOOQ==
X-Gm-Message-State: AOAM533zVoE7xBqz5x9b1mnVAw6vHWsFsUhlPDdFd5oMnfV6SGL+ekga
	WLqf78NxGuzbJ+bAyKIuUY28mTerz+4aVIwwx7Cbwr0gkC87H/r2OEwWup41FGxatnOCUHlweX8
	3yxiMffdYYmsqHw==
X-Received: by 2002:a37:65c5:0:b0:67b:3232:8cc8 with SMTP id z188-20020a3765c5000000b0067b32328cc8mr8108191qkb.170.1648856289269;
        Fri, 01 Apr 2022 16:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbWdGn+H26OktJUd2PLi1j3y1cCH3LU+ahvL7e+ZzRQY1FZAfw60USIHvnPTHEoQ8KuF5wsQ==
X-Received: by 2002:a37:65c5:0:b0:67b:3232:8cc8 with SMTP id z188-20020a3765c5000000b0067b32328cc8mr8108185qkb.170.1648856289078;
        Fri, 01 Apr 2022 16:38:09 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id v18-20020a05622a189200b002e22e09d77fsm2883002qtc.59.2022.04.01.16.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 16:38:08 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: luciano.coelho@intel.com,
	kvalo@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	johannes.berg@intel.com,
	mukesh.sisodiya@intel.com,
	mordechay.goodstein@intel.com,
	matti.gottlieb@intel.com,
	rotem.saado@intel.com
Cc: linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] iwlwifi: fw: move memset before early return
Date: Fri,  1 Apr 2022 19:38:02 -0400
Message-Id: <20220401233802.1710547-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Clang static analysis reports this representative issue
dbg.c:1455:6: warning: Branch condition evaluates to
a garbage value
  if (!rxf_data.size)
       ^~~~~~~~~~~~~~

This check depends on iwl_ini_get_rxf_data() to clear
rxf_data but the function can return early without
doing the clear.  So move the memset before the early
return.

Fixes: cc9b6012d34b ("iwlwifi: yoyo: use hweight_long instead of bit manipulating")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
index abf49022edbe..666de922af61 100644
--- a/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
+++ b/drivers/net/wireless/intel/iwlwifi/fw/dbg.c
@@ -1388,13 +1388,13 @@ static void iwl_ini_get_rxf_data(struct iwl_fw_runtime *fwrt,
 	if (!data)
 		return;
 
+	memset(data, 0, sizeof(*data));
+
 	/* make sure only one bit is set in only one fid */
 	if (WARN_ONCE(hweight_long(fid1) + hweight_long(fid2) != 1,
 		      "fid1=%x, fid2=%x\n", fid1, fid2))
 		return;
 
-	memset(data, 0, sizeof(*data));
-
 	if (fid1) {
 		fifo_idx = ffs(fid1) - 1;
 		if (WARN_ONCE(fifo_idx >= MAX_NUM_LMAC, "fifo_idx=%d\n",
-- 
2.27.0

