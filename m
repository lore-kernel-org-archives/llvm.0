Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD0436BC
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:49:39 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bdf4752c3cso20308195ad.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695404978; x=1696009778; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2o1CYzB6+mJ2+hUW8zCgaKBLo7FrtBAUficPQDkUT8w=;
        b=Pl/8reFHWtjiPjmPTQStwEScxSnujdWf5vWrtxH3vQ2PnwIVfrvHwLaWEBXixSpXNA
         ZILD60fVJc+byVND0LyZAN8ftI2x7EAFdp52qoOefMIdUKrvsaR6oYik8ec1jwabyi6/
         5e0lTOQphlKtBREmFI405su2TeAiCwl+6rz+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695404978; x=1696009778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2o1CYzB6+mJ2+hUW8zCgaKBLo7FrtBAUficPQDkUT8w=;
        b=ZC/aAPC0ksYvsxw1BdKJTy7zj1rIkuqnUWdZbVILEpMHibP5oVSD5Naw1y1ksWMrAk
         5JhElXpTA6AylT0tV1bOahAaI95pTrugeFteVKydcnAI8FM0YLDtWA4MrG+ajCVu+jeX
         t3aDnAzoawetZKHDlxVG5IIYCAGjbXg+AcDDwZfKBOY/HD2+JR9fcTrHM5nPnc4Xr5Wd
         33gS9C1BJlHnMsg3xT9cyhGk1FF6u5uUaaHAA/ownvQRDTWKYfaUbkL7SMbE8zVhQj7G
         z2OVuTp3D2eRpa/sarynpC+DQQ+Weh7nZxm2778q+oUfen4TP7+gr13xOaMrWOhcHdg5
         +y7Q==
X-Gm-Message-State: AOJu0YyB768qzJtuLhHsF08CcmWYWUnk6+PAkiTA1aq/iL0Sqy/DLP3B
	K2LKzr3h0VAIUikHog6vcy0NGg==
X-Google-Smtp-Source: AGHT+IGvd6YZ4gKAdDYTDm0Jv2/Pab+ImwGyxn9Lpj+6Tu3lvA7azIcDOLjq7kzjSW3qiIl23xZoPw==
X-Received: by 2002:a17:90b:8c6:b0:26d:54de:b0d6 with SMTP id ds6-20020a17090b08c600b0026d54deb0d6mr377458pjb.20.1695404978555;
        Fri, 22 Sep 2023 10:49:38 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id dw24-20020a17090b095800b0026d533216e5sm5194253pjb.46.2023.09.22.10.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:49:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Michael Tretter <m.tretter@pengutronix.de>
Cc: Kees Cook <keescook@chromium.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] media: allegro: Annotate struct mcu_msg_push_buffers_internal with __counted_by
Date: Fri, 22 Sep 2023 10:49:36 -0700
Message-Id: <20230922174935.work.699-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=keescook@chromium.org;
 h=from:subject:message-id; bh=bN/ajVTfVuIiMGEGWWAcgGtceBsP5LcYYFGEKRmRbCI=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdOw4ytUtDHEFA0oq/D0lIUJ3hczfQWyTFNqp
 mzZrHCMZV6JAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3TsAAKCRCJcvTf3G3A
 JpSDEACqurosT1uzHcOqbuoB7iJin9Tu8TQRk+o2p2ReQ1BEhMuyNvL1gVTecnUtek8OCFNH8F6
 boRt8sZBndcQrwMtVGoM3lNwdoEndkQAJrPSUKF3nFwZaEbj5sILyoJLVXYTh+E5uJXbSUJPMqa
 JDCVjF3D89G2UUokDXLgSzNqMCEGxjz8pE11LDfwTWRhiBivcL36mVthUupVT1Shy+Soo2BpmIr
 pvW81aO8bXcvRLYIjKzlsidCVFgGkuD2ash8wMG6/KsmWfPbSTl2Tv21LyRMK0uPRAHigjT3Q6C
 nzHI09QduMSUnhW8enjTF8Wx+RPi1ZJsG3YKkOSgDzXGKoZ7UWb3z55zbXrrKh0uACw/Y4RUY25
 3Yvxvo6iglrP/+LCCJ4zWT/xPq7VM8DLwHHL8iKq6Dsnpq7rXNDo9m337Z1T/1NCWglWqvb9riw
 //2HXkXLKzo/8hl3FykRaQCZI4oyRlddySyKCmWm5770Rr5odHDThDOih1gLm1DACoH1oP/yHCn
 CPKFABdnUuAgtYbjkni8LJgY449sh91SZKfreS1q3hemGpqMRMvalfl+BWUHIdTQclq3mG8CzEG
 ssQonfBsYP7J6xN2aIVJJYwZGFihQkocrlmxmsbxArwreUaA2g2gKqrpVgwwIFToVk+8ezi2i+I
 eJ3MP+O JCJIPzfg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mcu_msg_push_buffers_internal.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/media/platform/allegro-dvt/allegro-mail.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.h b/drivers/media/platform/allegro-dvt/allegro-mail.h
index a5686058d754..c0c9013f1aab 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.h
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.h
@@ -184,7 +184,7 @@ struct mcu_msg_push_buffers_internal {
 	struct mcu_msg_header header;
 	u32 channel_id;
 	size_t num_buffers;
-	struct mcu_msg_push_buffers_internal_buffer buffer[];
+	struct mcu_msg_push_buffers_internal_buffer buffer[] __counted_by(num_buffers);
 };
 
 struct mcu_msg_put_stream_buffer {
-- 
2.34.1

