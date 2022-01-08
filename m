Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE58A173
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641654603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=U169cYgO0bm4HCQJMyoMslqnpI+Gi+7C/va2IkqTrGk=;
	b=YgPNWlLaqYqLP0rUDyxAJSRP+SOWCfvNEaHrD807DYwnyFQPvf1FfdA8yGmqKS4FbHtHX9
	HBZaSae1d680o1gROD6tPLPzHOwift8BgogkbTSWsiITU4b8/ntl9UJOwgxG23w4S7bSNh
	vl3/VDl7lyZx6e5ojomZ0an5BsxL52o=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-pNV-RY4GPh6sv_KUkBnH3Q-1; Sat, 08 Jan 2022 10:10:00 -0500
X-MC-Unique: pNV-RY4GPh6sv_KUkBnH3Q-1
Received: by mail-oi1-f199.google.com with SMTP id n2-20020acaef02000000b002c6c1c37a03so6205226oih.21
        for <llvm@lists.linux.dev>; Sat, 08 Jan 2022 07:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U169cYgO0bm4HCQJMyoMslqnpI+Gi+7C/va2IkqTrGk=;
        b=EVZH3N8T9eVx9E77Ka9b/6V5F3DjYVq8ZvsX9776TqUMfjBtETQmogqBDYoJyOCZRo
         OA6LocrGpRV14WcRJ9LbVnYA5XJte164d5XPFFuiMAuk/fy1graZl6DG7bvr34bTRhzC
         FryE37irZ9e6qrOYQNuOfSa587XOeqSSF0YfP4CrSmJx0k6tsh5960s60LqGbsvAC2yv
         mH+/cS3GoU4qAsz5wF8yruFzOp+YDgFmLS+RWCdByygIpMA7cXi7L34xzA0HpNuJEqIB
         553e3+aGHrC910NIOeTb/3RKZM61pyeXGkJS9XqhiWjV8dm+elGOkNhW8lBPi1L/Fmc4
         c14Q==
X-Gm-Message-State: AOAM533wfzfZjBb9KulyjLplGljC2Ceec04TotB//uhVcO7jcccpIIm4
	DP4LjqbYisDx6bQC8OIoU/4uE86AEXWvjKqdZYn0NNBoRA+j2iqyX+0LkdmTCSWFwD8cAvOdUUi
	vKnCU2rCQjdLsMw==
X-Received: by 2002:a9d:d67:: with SMTP id 94mr47473295oti.156.1641654599569;
        Sat, 08 Jan 2022 07:09:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRTLAixm2+kpq1Ek12ZorOxtE4fuJpDVvDT4q2xl3gRi5czVDxU4IDwGgLDNGQUDPeCsGqYg==
X-Received: by 2002:a9d:d67:: with SMTP id 94mr47473290oti.156.1641654599386;
        Sat, 08 Jan 2022 07:09:59 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id c10sm371225ots.73.2022.01.08.07.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Jan 2022 07:09:58 -0800 (PST)
From: trix@redhat.com
To: vitor.soares@synopsys.com,
	alexandre.belloni@bootlin.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	bbrezillon@kernel.org
Cc: linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] i3c: master: dw: check return of dw_i3c_master_get_free_pos()
Date: Sat,  8 Jan 2022 07:09:48 -0800
Message-Id: <20220108150948.3988790-1-trix@redhat.com>
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

Clang static analysis reports this problem
dw-i3c-master.c:799:9: warning: The result of the left shift is
  undefined because the left operand is negative
                      COMMAND_PORT_DEV_INDEX(pos) |
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

pos can be negative because dw_i3c_master_get_free_pos() can return an
error.  So check for an error.

Fixes: 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/i3c/master/dw-i3c-master.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 03a368da51b95..51a8608203de7 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -793,6 +793,10 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 		return -ENOMEM;
 
 	pos = dw_i3c_master_get_free_pos(master);
+	if (pos < 0) {
+		dw_i3c_master_free_xfer(xfer);
+		return pos;
+	}
 	cmd = &xfer->cmds[0];
 	cmd->cmd_hi = 0x1;
 	cmd->cmd_lo = COMMAND_PORT_DEV_COUNT(master->maxdevs - pos) |
-- 
2.26.3

