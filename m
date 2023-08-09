Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6071D319
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 21:25:46 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5867fe87d16so4206287b3.2
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 14:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691616345; x=1692221145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xDx0Hy/g05LsgjXJunLNKRIVZ1PiGzjJ3aP3yYS1SPs=;
        b=q95v/fDBA425ZRj8HB8knec/n4Wh3vXc8UbBeQ9+7ttjuOkZDgYRPpnfEmLqXf/K0c
         9vUIwMzhWqcCXcQ3ORw3unREK+rNDPA94GFJB3geeKvjgleAH2TJzWdB4aiD1AgfKkI9
         Z/bn4LDdalSqacEfSDlGVSB+SrKHJq+8AHxcNmoUPLE2evR/gffiSsW98OvDz7w+3DyV
         T8HJ4BVxsFz1/VC2CZS3v9TY2Ew85MTPbGOCkMlUSQk0LvyVWCWPQ6Q0CKtwX4rYn4Mz
         Bzrx5iddUJRYh3HidSo+HrZFmOUe4x5eekX/x5QVelGZKMWymoP1yjh830Hf898C+unA
         TkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616345; x=1692221145;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xDx0Hy/g05LsgjXJunLNKRIVZ1PiGzjJ3aP3yYS1SPs=;
        b=iF1SX+9KV1iMZK3hARv/uDFAgJt57oFNzGRgXyyKdGcXhjTgnoPKdcbR9KosbbeCeH
         JYDAEcGHHbdDxoU74LcuPi2xablmP+dDykSrsBtdOxVOO8phRAc+EBMMsRj6QGQDA7qg
         pq+RAMhKEAXtYTBJgSEsOtP/iLYSb+9/mTYq/43jXeVlKBqI2pCm0VRNW9nbYwv0lxS7
         olYIyF3445j6wcNYym8fVVYAShkc4J4dfR5LxmEK5PZUDGTPWfkVLWpmFDsTp7K0Nrpo
         2Im3EU4XNsrZ4AJWwbXEKeY1zG8ebYUgeHDj+3Jw6o8MIq/vqtU+cWOTe6A4cgO/mGUw
         3yZg==
X-Gm-Message-State: AOJu0YyOjgknPD8rgwWdi5YcESv4b9EDVAYX2M2Cd6ezC5wgeGFZaxOs
	tS32ZPpW5/S7MRRXoMV1Uf+ac2oMTNzbw3ATIA==
X-Google-Smtp-Source: AGHT+IEsmlDYpjMBJObJR5jz4UIcD43JE1pStIMxSDRZxpyCeyJHub91Vaates1u0eDPesF/KIhjvHlbNAFHmDDJvQ==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:b718:0:b0:576:f61f:adbc with SMTP
 id v24-20020a81b718000000b00576f61fadbcmr8718ywh.1.1691616345223; Wed, 09 Aug
 2023 14:25:45 -0700 (PDT)
Date: Wed, 09 Aug 2023 21:25:35 +0000
In-Reply-To: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691616343; l=1671;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=1jpubBEYs5G/kONM8KXG1tjVjaf45XD96u1TgLGh88c=; b=HD13U7Lf7gLBUJgdxnwIDWUS5iUmJBBrEtQkf3kdA3nIJwjjfZ/thVFMV1IjFQZf6I2y84s5B
 9rseL9CjIuVBaaF60aQ2gvWP/yFSYM2Erz2oCmo8XTvy/PYDz3u5bej
X-Mailer: b4 0.12.3
Message-ID: <20230809-cbl-1903-v1-1-df9d66a3ba3e@google.com>
Subject: [PATCH 1/2] i2c: i2c-bcm-iproc: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with W=1 we see the following warning:

|  drivers/i2c/busses/i2c-bcm-iproc.c:1039:3: error: cast to smaller \
|       integer type 'enum bcm_iproc_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
|   1039 |                 (enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
|        |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This is due to the fact that the `bcm_iproc_i2c_type` enum members are
int-width and a cast from pointer-width down to int will cause
truncation and possible data loss. Although in this case `bcm_iproc_i2c_type`
has only a few enumerated fields and thus there is likely no data loss
occurring. Nonetheless, this patch is necessary to the goal of promoting
this warning out of W=1.

Link: https://github.com/ClangBuiltLinux/linux/issues/1903
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/i2c/busses/i2c-bcm-iproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-bcm-iproc.c b/drivers/i2c/busses/i2c-bcm-iproc.c
index 2d8342fdc25d..3464f3a376a5 100644
--- a/drivers/i2c/busses/i2c-bcm-iproc.c
+++ b/drivers/i2c/busses/i2c-bcm-iproc.c
@@ -1036,7 +1036,7 @@ static int bcm_iproc_i2c_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, iproc_i2c);
 	iproc_i2c->device = &pdev->dev;
 	iproc_i2c->type =
-		(enum bcm_iproc_i2c_type)of_device_get_match_data(&pdev->dev);
+		(unsigned long) of_device_get_match_data(&pdev->dev);
 	init_completion(&iproc_i2c->done);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

-- 
2.41.0.640.ga95def55d0-goog

