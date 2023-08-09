Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B589924512
	for <llvm@lists.linux.dev>; Wed,  9 Aug 2023 21:25:47 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d4db57d2982so263093276.3
        for <llvm@lists.linux.dev>; Wed, 09 Aug 2023 14:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691616346; x=1692221146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TeHUuHfRgnWDPuFH4hkEU5fzn9hCBRBVrCadOWnm/dY=;
        b=m3F8/0ulUMYTwL9xFOJ0hLRUE0yTJsXtRqAWzCWvR8A+u4BtSF1Y9J//7l8oh0HeNF
         d5qEkunwkS56Mz1cw7IUxuZVEOW2FD/UTOgzMNQJmPWQHyJ05/0wM/x6SuBrfs27Jrnt
         qUklp3oTnJ7R4SapRrWPkfff8qOSLDGr1ld2cj9x3iq+oq3psVc6yx8Uk7alFVQLOTC7
         FXHyjmZP0uT9Fi12AOmKZle93xdSLL1acnmz/8ctRZCUx4WiU1KuNlsM4s+l6BcfmLmd
         +0n++QJDHSgrwWPxPCHclEP51dI4/IAC4TY6UkzLXJbTD3a9ekMpmCia1UX6FTucRJgY
         pE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691616346; x=1692221146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TeHUuHfRgnWDPuFH4hkEU5fzn9hCBRBVrCadOWnm/dY=;
        b=W0pnAmgILRzd3n/l1+ctNBeKOOZGszxyQadA0h+X0tunESRDAVGWF0Yr4QyzatVEQK
         oX11id1ExWoWrC+ou5nEi3FMyBVnvEw5d4oxQqn6Ir5klYwW3oi+MhehmvYDoZosaorH
         eFtWRDFefTlpb7w50NzZEc92W6iItHMPqeHVVJ7cuJbf+j0AnaraN2blYNMljZZapJBK
         3sD1j1YMvwgV6mjSeFDhl5yGo7PCpd6GfiACCwPaPiu+hVu7h82As6UaWBcUDB2ZsBJV
         q2IzgYo4VCCDAmLSWKar2z40uqNmnfEj8PjHJgScVw1hNDnPitbbUv0XEmZ0sW+LZvmp
         PEzg==
X-Gm-Message-State: AOJu0YzsuexxQwsv/IqveAXHG5uW0tfDdj+THRNiabPqf2Xb9zD86hZP
	IkgwUo+PiSfQV107x8xVs62sl7vf75cIxlxO4w==
X-Google-Smtp-Source: AGHT+IER7CD8SLhYDzqAvYfXBz6YfQlFaQpKeWFvIJE3aWUQIYc8I61MFtiEi6h9Vzp0vHtlu9BcD3BOdPTotW/zYw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:1409:0:b0:c6a:caf1:e601 with SMTP
 id 9-20020a251409000000b00c6acaf1e601mr9823ybu.13.1691616346561; Wed, 09 Aug
 2023 14:25:46 -0700 (PDT)
Date: Wed, 09 Aug 2023 21:25:36 +0000
In-Reply-To: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20230809-cbl-1903-v1-0-df9d66a3ba3e@google.com>
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691616343; l=1145;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=8JnGtAd2EouEzprwFG0EpWdSWssM4tBnJ8iYInUW3tw=; b=y/bJoUJDpUrl23oM/z5FEe37aFVYK4HTaD9RQ9C+npAsantOFJJouIu1r+p30Gfq3nlCbIx8G
 DhPci9Ygy+cDBvibVqeQG0Mi40YPg54DPSndE/L8i0YHBy2nhk5+ZJD
X-Mailer: b4 0.12.3
Message-ID: <20230809-cbl-1903-v1-2-df9d66a3ba3e@google.com>
Subject: [PATCH 2/2] i2c: i2c-rcar: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Andi Shyti <andi.shyti@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Nathan Chancellor <nathan@kernel.org>, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

Fix the following warning:

|  drivers/i2c/busses/i2c-rcar.c:1066:18: error: cast to smaller integer type \
|       'enum rcar_i2c_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]
|   1066 |         priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
|        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Link: https://github.com/ClangBuiltLinux/linux/issues/1904
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/i2c/busses/i2c-rcar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 2d9c37410ebd..ae4072bc96dc 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -1063,7 +1063,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->io))
 		return PTR_ERR(priv->io);
 
-	priv->devtype = (enum rcar_i2c_type)of_device_get_match_data(dev);
+	priv->devtype = (unsigned long) of_device_get_match_data(dev);
 	init_waitqueue_head(&priv->wait);
 
 	adap = &priv->adap;

-- 
2.41.0.640.ga95def55d0-goog

