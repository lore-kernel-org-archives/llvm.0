Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EED03D60
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 20:12:52 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d6412374defso7381610276.0
        for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692216771; x=1692821571;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hydyucHbEMYV5+mvu/0+drZ5pRwXhZ3ATbVyt9DjydA=;
        b=fzxWMts4UEmnzP6fJ2QWvTELoVKoanALduDXpelbb6K2Sx/NKTI8aHONeqm3L7g60x
         Oph7ZPDsE00Ppnv0bsi1VSx6dApV6sx3Hli7NkAu1BfO5lg9grMb5d1JuBPrivixpInl
         AgRYBnKzIPNBDloGRS9Ps8sDg6jfY75rm9KNssmBlIwultXUB4rsg+z7mkMdDxLxZ1ZB
         uG1DIxxYD37lmVVS8JagsBToSaDO6obMBTgl3zKeset1INOlUjwvuUUdc3eh25MQs4Zu
         WkF94PpX0c+LD05aSIW+TnNhVISAXVuGJXt8VP5TLCmxY/cvW6PXTGPFFvBF25EpQXcK
         Zg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692216771; x=1692821571;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hydyucHbEMYV5+mvu/0+drZ5pRwXhZ3ATbVyt9DjydA=;
        b=Yxy3cgtJNk6LNpURTRMvu4UjDpTUmFhgnCZQH4KWNvOy0UKVxH7Dh+G4gnKmvdIhWs
         gsTexZFGTBL5O+IaWMuxhqVLglSc8SwQn/o2JkStKelm9JjD/CRKqK/ZDlKPDicNpoJG
         SlpoOkjqiUvaOuLwipwKmTDfzd3+hPS+7NZxoKhaUKZZUHBkkM1q3kGCUTdImjs7+WVa
         UNRX2fXZig7XFsXE/Da5Kb13ADHOpUyV4hqzWmQfcIc/XZKHiPJnGH3S5aohohGQyG9F
         xcMhJuVrISKEgyX6YueybSmnIvawoB48psZbcT2vAhT2dUG860e9dK2z+OoAQPUlVlTq
         DNOA==
X-Gm-Message-State: AOJu0YyJoTq+/ZtOpcBW4KOzg5uXC+v1zo/f0nnEnuNCc4nTcyHwzZJH
	IoQQBopZfuEJKdurBsRK2iwSMT42TIdRe9RlIA==
X-Google-Smtp-Source: AGHT+IFLGTAxhMYLm8DFHm78BtYVv9lY+/3tEbprNaXyy0am7lutMrDeIFseTWyfQKcL2/BeiHMfp+QrXAY9gzXU1g==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:dc02:0:b0:cfe:74cf:e61a with SMTP
 id y2-20020a25dc02000000b00cfe74cfe61amr34513ybe.6.1692216771386; Wed, 16 Aug
 2023 13:12:51 -0700 (PDT)
Date: Wed, 16 Aug 2023 20:12:50 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMEt3WQC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2MDC0Mz3bL8zBTdlKLMstSiYt2U3ETd/PIcMG1imGRpmmhgaWFkbqoE1F5 QlJqWWQE2Ojq2thYAc/7o4WoAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692216770; l=1512;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=U9ty+DDtLpJvR47VlNEwBh9kqmbTSFNlITqYCfsM3Bs=; b=v8iUzRtOSkauZieTRS3I319sV44jCCOMocqj50dYh39trm3BFtFgLPMdbYxUDlFOv5wj5bdFX
 O3GEz+290sKBU1Va5HaVwngl3C8rSo2dp55GAn8+BuMVf8JLuMPcr7F
X-Mailer: b4 0.12.3
Message-ID: <20230816-void-drivers-dma-owl-dma-v1-1-a0a5e085e937@google.com>
Subject: [PATCH] dmaengine: owl-dma: fix clang -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: Vinod Koul <vkoul@kernel.org>, "=?utf-8?q?Andreas_F=C3=A4rber?=" <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|       drivers/dma/owl-dma.c:1119:14: warning: cast to smaller integer type
|       'enum owl_dma_id' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|        1119 | od->devid = (enum owl_dma_id)of_device_get_match_data(&pdev->dev);

This is due to the fact that `of_device_get_match_data()` returns a
void* while `enum owl_dma_id` has the size of an int.

Cast result of `of_device_get_match_data()` to a uintptr_t to silence
the above warning for clang builds using W=1

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/dma/owl-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index b6e0ac8314e5..f340a04579f4 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1116,7 +1116,7 @@ static int owl_dma_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "dma-channels %d, dma-requests %d\n",
 		 nr_channels, nr_requests);
 
-	od->devid = (enum owl_dma_id)of_device_get_match_data(&pdev->dev);
+	od->devid = (uintptr_t)of_device_get_match_data(&pdev->dev);
 
 	od->nr_pchans = nr_channels;
 	od->nr_vchans = nr_requests;

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230816-void-drivers-dma-owl-dma-41b95a098275

Best regards,
--
Justin Stitt <justinstitt@google.com>

