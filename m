Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DE47A
	for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657977361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gnHdMkzLi00tNGCUGHal6nCmNk9iiTh/Qem2M8JBxB0=;
	b=NIWjna02mmfQCHAOQs6j2ZaGWny+WyOjqp+nGgKxf8BzZ17gmjX061E3UqyekE3Tijmn4x
	+gO0Cj3qTH8BXE/n2lHE0Gk1Nt14A1lNepRIHX6jNWczTiLZlNHvPCkQrLTLDSffilwnyT
	EFKXjIp3AI4RLXEBOdd9dHPR+ei1DLA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-kkAXVNhUPomukbTdAwDcbQ-1; Sat, 16 Jul 2022 09:16:00 -0400
X-MC-Unique: kkAXVNhUPomukbTdAwDcbQ-1
Received: by mail-qt1-f199.google.com with SMTP id c22-20020ac81116000000b0031d25923ea8so5529370qtj.17
        for <llvm@lists.linux.dev>; Sat, 16 Jul 2022 06:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gnHdMkzLi00tNGCUGHal6nCmNk9iiTh/Qem2M8JBxB0=;
        b=DmRZNrj476XUzogJhCOVs9Pv63VqFr2/az9VQqEU3wJW+dXp9zq7TNLOeB3WjoKD2/
         63eIzaQmXK4AuA6M4J6uydvwgFKLoCRg2jnNwmt2FBniiGbNZo8ZvlkyDjEPwezR60/e
         asmGA7P0qMr+Q12pR17kUvEz/bNu3S+Coz6ewriOsgICW+dW1Eg9TBKzHhmUvOxp55HL
         I+c2QzcqT8h1tm92TlNN2vRqt/LWhMkNCXBdjdCDSv8Ueg0m+jtc2IUH6F5VmARBhmDK
         Z4O+Dodw4ZifU3Khql8AZ5GbXCSWOaGOTvZNvATTeF95hX3PLIbgKJqdj1WskfW76q6F
         9CEw==
X-Gm-Message-State: AJIora+ld1VTMgznmOGglpGQL83PogTnvDy1M4Qo/gQogfbBFE9igCvf
	YGI2EU2LSNFC4r3+AQj3fJr8qc8hHWCPFmnJ+IVdhNLHlZjUwyMVTWOe5NTsvsQqb9m78e6DZ23
	xqhYe4c4s9ICq2A==
X-Received: by 2002:ac8:594e:0:b0:31d:410f:8b56 with SMTP id 14-20020ac8594e000000b0031d410f8b56mr15567517qtz.574.1657977359658;
        Sat, 16 Jul 2022 06:15:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t0hlikaPC0mBP+PR0j6EJBA0q7qPSPcc2vLVEczOdQynomZ3XMyGd4vyQYhwE9REYZkwJhWA==
X-Received: by 2002:ac8:594e:0:b0:31d:410f:8b56 with SMTP id 14-20020ac8594e000000b0031d410f8b56mr15567502qtz.574.1657977359393;
        Sat, 16 Jul 2022 06:15:59 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id q7-20020a05620a0d8700b006b5905999easm6122095qkl.121.2022.07.16.06.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 06:15:59 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: axboe@kernel.dk,
	nathan@kernel.org,
	ndesaulniers@google.com,
	ming.lei@redhat.com
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] ublk_drv: initialize ret variable
Date: Sat, 16 Jul 2022 09:15:55 -0400
Message-Id: <20220716131555.2014270-1-trix@redhat.com>
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

clang build fails with
drivers/block/ublk_drv.c:1304:6: error: variable 'ret' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]

When the call to ublk_get_device_from_id() fails, ret is used without being
initized.  So initialize.

Fixes: 71f28f3136af ("ublk_drv: add io_uring based userspace block driver")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/block/ublk_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 52fd0af8a4f2..4d1199c98026 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -1298,7 +1298,7 @@ static int ublk_ctrl_get_queue_affinity(struct io_uring_cmd *cmd)
 	struct ublk_device *ub;
 	unsigned long queue;
 	unsigned int retlen;
-	int ret;
+	int ret = -ENODEV;
 
 	ub = ublk_get_device_from_id(header->dev_id);
 	if (!ub)
-- 
2.27.0

