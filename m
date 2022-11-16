Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E735CB7
	for <llvm@lists.linux.dev>; Wed, 16 Nov 2022 13:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668606111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=SRrq0eBv0OrNigOniBgODL/kOmcDxSd8eLVyeuecC14=;
	b=eolmWsV05WhcXjEyJV6GE6fOcHlro6jNGl9C1QWmbM4LiaaLsWIupVJuwAhqjM74VbuZMd
	Omrv7vMRMBkvIvcX2Ok6nU6rb4mZOAV1E9VTziwJfIEM6rAJ28PcovQWA48B+Loc9h0TU5
	rT734MIyGja/3bgy/922ejvhy+1NRw0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-YN9q7_ZWPbmIKOVl5v6r-Q-1; Wed, 16 Nov 2022 08:41:50 -0500
X-MC-Unique: YN9q7_ZWPbmIKOVl5v6r-Q-1
Received: by mail-qk1-f198.google.com with SMTP id bs7-20020a05620a470700b006fac7447b1cso17307586qkb.17
        for <llvm@lists.linux.dev>; Wed, 16 Nov 2022 05:41:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRrq0eBv0OrNigOniBgODL/kOmcDxSd8eLVyeuecC14=;
        b=HgzA0DL+AXH0pvoMkXGWT/qzImgjo/sVLWuJcQeDJBIwWAed+BHjaKYTHYzHAnzoD+
         BePEjN8FTTICIoGK3bIbL6uUgNlzXd8NroXO3hOLdFHb+NlldQDgDwPQx6ok+UsNGea0
         EOSBTp/7H/H/+3Ok5i1ndhhiC7XuC1zxWc4E8NxBc6oTVEdPO6hRb/+BXa+o/JP14pU+
         JO7qrxln0lG/ciO7poBPAxson/wRicAtAeUrwqj+2GP7ojUMHku8n7QSgfMn8WVCaAyj
         4ivmhapTCmay6Zqj/Y5buf25W5s1SMS3EvTU4/XTq/Q9vcs4+8yeFVJecP9vvYIrMdq8
         qKCg==
X-Gm-Message-State: ANoB5pnH35V/fpKLWarr14uzN0982nBBw3CeTNNuKBBm8j+LVoXhRrYb
	bvdABWPmGP9Ehf9igju4rA1RAZzzC8UiMLMeCoNkJxXnqGxC1njfyFngQ2xrZNX6dVHxhoReAgV
	r/VFiiZPfJJiY
X-Received: by 2002:a0c:fb0f:0:b0:4bb:5ac4:126d with SMTP id c15-20020a0cfb0f000000b004bb5ac4126dmr20923423qvp.108.1668606109602;
        Wed, 16 Nov 2022 05:41:49 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7vRYrhSARaqPwsQs6rT3Xr/jfGf2KQue/iDTxcO1L2lxZr5UoFKscXeWN4TkLQICT5cQ8AfA==
X-Received: by 2002:a0c:fb0f:0:b0:4bb:5ac4:126d with SMTP id c15-20020a0cfb0f000000b004bb5ac4126dmr20923405qvp.108.1668606109386;
        Wed, 16 Nov 2022 05:41:49 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-31-29.cust.vodafonedsl.it. [2.34.31.29])
        by smtp.gmail.com with ESMTPSA id i20-20020ac85e54000000b0039ccbf75f92sm8801342qtx.11.2022.11.16.05.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 05:41:48 -0800 (PST)
From: Marco Pagani <marpagan@redhat.com>
To: Oded Gabbay <ogabbay@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Marco Pagani <marpagan@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] habanalabs: added return value check for hl_fw_dynamic_send_clear_cmd()
Date: Wed, 16 Nov 2022 14:41:25 +0100
Message-Id: <20221116134126.199087-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The clang-analyzer reported a warning: "Value stored to 'rc' is never
read".

The return value check for the first hl_fw_dynamic_send_clear_cmd() call
in hl_fw_dynamic_send_protocol_cmd() appears to be missing.

Signed-off-by: Marco Pagani <marpagan@redhat.com>
---
 drivers/misc/habanalabs/common/firmware_if.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/habanalabs/common/firmware_if.c b/drivers/misc/habanalabs/common/firmware_if.c
index 2de6a9bd564d..311942108dbc 100644
--- a/drivers/misc/habanalabs/common/firmware_if.c
+++ b/drivers/misc/habanalabs/common/firmware_if.c
@@ -1782,6 +1782,8 @@ int hl_fw_dynamic_send_protocol_cmd(struct hl_device *hdev,
 
 	/* first send clear command to clean former commands */
 	rc = hl_fw_dynamic_send_clear_cmd(hdev, fw_loader);
+	if (rc)
+		return rc;
 
 	/* send the actual command */
 	hl_fw_dynamic_send_cmd(hdev, fw_loader, cmd, size);
-- 
2.38.1

