Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063317737
	for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 19:55:32 +0000 (UTC)
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-589f986ab8aso4043107b3.1
        for <llvm@lists.linux.dev>; Wed, 16 Aug 2023 12:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692215731; x=1692820531;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N67WiS7/3sb8Cj5N6RzDQuOPr7zI0dDToiYbr0rmgmw=;
        b=qqAMPQ5GdxbgdBzVIb7T7A7AxjWjb8DZommfyeV76VQL2kkVv7tkNkJUQ06TRq8XnT
         waLMQoVGcBnknva0JTqjv8UZ6Q+wYnClzOw4zyn+P5Ngf3Q6q6Cwk2hfakEIaqveWx8P
         jZ/xK08v011Lo51sEevdEdRGkUqTHL/QXB1gJnUCRoKect4TDA2Sc283QbDuly1TgYla
         7GtIvdLrfvitpRwndHWgT14eFK2AP78lTlIxPi7aMm16JurApTs+jnKNpgETgQfCyxeY
         dql2gk9AN8kJCTSa0Tf0acm/kTGEVr94Od1hnkrMQeCIIDi2UMgZnvcJa9mI5IEpOKer
         nAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692215731; x=1692820531;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N67WiS7/3sb8Cj5N6RzDQuOPr7zI0dDToiYbr0rmgmw=;
        b=G2mYQzmu/l0lVdLs6DQ8CyYk7mf6amzKYTFmKEqOQ9A1P58sbYJE4oxm8d1YjWjjH1
         1UE4YZGVOZWXp+OfHolUd5hXszZ8eNqGzGsjDzVYrjchRuWacYUIImiSEeYEgcVgrtnh
         PE2hDSLUctwoaKRd0MZSNDI48CtQELdEnaOzKh67PkcTJuPNVj54jn5Vw9MyfAaIYcpi
         E/mHjo7nbd5G9fSU4bqwCSE5Jt2cxiYvHD+I4JtokzF11ufCAyrGviySHp7R3GJZj3k5
         LfQXuVFMnJSZyzNHWpV7AQPJqffN1NqfCFbpVqP2aBDyCSAtCBETUMtl14vBjdroCUYV
         aQQA==
X-Gm-Message-State: AOJu0YweiRYM/AUDFuHCoX/VlhlxjWFvRK6+lTsXE0ZLWDS8buM/CSRz
	umHLYdR22xo2Ou0bFI/WBK7bJOIKK2vVH8Lg0g==
X-Google-Smtp-Source: AGHT+IH1FY4dJduz6fzigREg8tgE5e/JoOxQTJRQ+4NUOdZQ3sjCJGTYtxjEsAd879DrJol6J6MNGzXEiww4uT8XAA==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a81:ac16:0:b0:586:e91a:46c2 with SMTP
 id k22-20020a81ac16000000b00586e91a46c2mr10910ywh.4.1692215731117; Wed, 16
 Aug 2023 12:55:31 -0700 (PDT)
Date: Wed, 16 Aug 2023 19:55:29 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALAp3WQC/x2NywqEMAwAf0Vy3kBbwcf+yrKHYqLmYC2pFkX8d
 4u3mcvMBYlVOMG3ukA5S5I1FLGfCobZh4lRqDg442rT2QbzKoSkklkTTnEvvOAm4UTl6CMretP Vzg7U99RC6UTlUY738fvf9wNunyWqcwAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692215730; l=1587;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=1YZyFhkuynphmxg7TZPqc+HCfPgAHdsuqMCKaSpuV/U=; b=bBQyQBouy2hNFI2Y+MZ5b8WiXWffYYC1ZHRHShS4JwLZXQ5M+xDLuy36HSKM9qv3Feh2sFmcI
 EcULJCqRSxRDiOcyGlXjVSpYurYZS4f1tLMAnsNdkAn4PX9rVhH0Fj0
X-Mailer: b4 0.12.3
Message-ID: <20230816-void-drivers-gpu-drm-tiny-repaper-v1-1-9d8d10f0d52f@google.com>
Subject: [PATCH] drm/repaper: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: "=?utf-8?q?Noralf_Tr=C3=B8nnes?=" <noralf@tronnes.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|       drivers/gpu/drm/tiny/repaper.c:952:11: warning: cast to smaller integer
|       type 'enum repaper_model' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|         952 |                 model = (enum repaper_model)match;
|

This is due to the fact that `match` is a void* while `enum repaper_model`
has the size of an int.

Add uintptr_t cast to silence clang warning while also keeping enum cast
for readability and consistency with other `model` assignment just a
few lines below:
|       model = (enum repaper_model)spi_id->driver_data;

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
 drivers/gpu/drm/tiny/repaper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index c2677d081a7b..165f2099e7d8 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -949,7 +949,7 @@ static int repaper_probe(struct spi_device *spi)
 
 	match = device_get_match_data(dev);
 	if (match) {
-		model = (enum repaper_model)match;
+		model = (enum repaper_model)(uintptr_t)match;
 	} else {
 		spi_id = spi_get_device_id(spi);
 		model = (enum repaper_model)spi_id->driver_data;

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230816-void-drivers-gpu-drm-tiny-repaper-a08321cd99d7

Best regards,
--
Justin Stitt <justinstitt@google.com>

