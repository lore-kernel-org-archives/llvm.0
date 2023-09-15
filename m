Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0975F1A73C
	for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 20:06:14 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68fb98745c1so2117704b3a.1
        for <llvm@lists.linux.dev>; Fri, 15 Sep 2023 13:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694808374; x=1695413174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NA1Kdxb7daymV0YxfPouFeomYl6O2u2EVjnI/tmIwsA=;
        b=J5PRbU/Blrypd3x9GWfxXdtK2CxDOy0W6yKYN1CGXX6huwKqtNaBiVODxIxiYjs47u
         0pBuOta78EupJF3pDhYGCnUqefh1VvB7bXuszMlBl5gBYG8NCT6YRk2woux0JSJwn+sg
         kbnS8uar3OIMXu6keilqZFbHpnEvyQANpgsd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694808374; x=1695413174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NA1Kdxb7daymV0YxfPouFeomYl6O2u2EVjnI/tmIwsA=;
        b=Np2TuozVr298ClNzYUfTeBlb+p3d+IiIDat4ZDF2Z8i3K6grKQApnRTT+pKL3WuJ/A
         pIb8jPGJTtDKkCMgBpiUEtm0GwuXk0/Wd3ywvIe1r6+wAGDfXis8fjGqGqiVMDyMY/Ar
         jB6Hx2DuIdvbandjZ5nYyZUiSJjgxMUSi3MCxOFqOHPmhnX2v07qxPYBthHF2dwqTqbo
         vPnsb/iUbaoJ8OEkFKafAjqYi0JBvNukPEfo/wklX2pdIcx8h53ClIEb+IQfbkoSR0ie
         AGXRHOgtghlTZj3AJYt8Ls/xR24BZMEoOuSqEt2N2rIFr/0N+K9+RlVk5HyF4uT3disd
         NTSQ==
X-Gm-Message-State: AOJu0Yxqfu8KVAjePDeS2ejp5yQIpMTCk7ShLQqanQUIcf+HkayopFJd
	vmqdO1tPV8YxGzhNRMrKlooXUw==
X-Google-Smtp-Source: AGHT+IFke9xOUg8o+dOHQMGmNXaiNCKQ4Q7uIE2umqN8LSN8Mp8jp4PO0FBx8ts/vz9hu+v/WYKIrg==
X-Received: by 2002:a05:6a00:148c:b0:68e:2c3a:8775 with SMTP id v12-20020a056a00148c00b0068e2c3a8775mr2968885pfu.33.1694808374440;
        Fri, 15 Sep 2023 13:06:14 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x42-20020a056a000bea00b0068fcb70ccafsm3331958pfu.129.2023.09.15.13.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 13:06:13 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Kees Cook <keescook@chromium.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] wifi: mt76: Annotate struct mt76_rx_tid with __counted_by
Date: Fri, 15 Sep 2023 13:06:12 -0700
Message-Id: <20230915200612.never.786-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=keescook@chromium.org;
 h=from:subject:message-id; bh=F+6DHSa+ER+x+MQqlg0EvaQeoh8qJvI3pA3g8dGL8RY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlBLk0Jorek+I1OQBAgJduc/L4Xg3jOs5WnEWt9
 MGRZATCBjSJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQS5NAAKCRCJcvTf3G3A
 JjWhD/9tOUC/st1EceKH0gvMzRBD27QO4Nk+fG6Y9rJZUv16gV9EFMsoYqUSuRwgZy8/P9I+BVc
 mkHZtoGs6fWhEJtny0ZlAMmZdUHnicF2M7xIxIb7tZFMp8ryHV7g7tiV44qtuz3uQN5OR5/G52S
 Bn/tXp6kou8NrfLsJt1aauJtm7CgcykOJt93RH8I49CjsLVQ0mYrF78RZc+bromdT1TGY3lCbYu
 YDSjb1YGbcNcpayfbzfJ5jPwJU1gQAn2ZxQWEyrqc2J7py+yj914/HyikOMrYaVlgUrqBoOQpYm
 l5vhqamxGJPeuQpBh4WtZukLo3z/zlEjghImla5afiElmNqimHsGWRI55luMz6VjGivM2ekVN/S
 OzaBZMte8ZaHt365A6WesjhOeByhDLffpDTS5K13NGnlNJQZchkZYpeoPEx5OT0frP4OOB9o8vr
 C3RTak4zrGO4iFO1qPK1oI0qgvYa6AsmHUgus5elElfv5xavrh7yAAOJsGsbDmCh3TmV8te0Zb1
 0/wQs/l4sO4COIHIOrBNqNqVd8eilEgy2mRzPiEdVkwor2g0GCSU0wZbw2TABQ0flcoKda5qOjB
 PpNql+uzB7LJjZUtMa8HdL83infm7t7Kex3RaoAOWdRDfWmcI7i1ap4tETW5nwk4KrP0kRt2sxt
 gysLmbT Unzq0a5g==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct mt76_rx_tid.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: Kalle Valo <kvalo@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index e8757865a3d0..03ef617b1527 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -376,7 +376,7 @@ struct mt76_rx_tid {
 
 	u8 started:1, stopped:1, timer_pending:1;
 
-	struct sk_buff *reorder_buf[];
+	struct sk_buff *reorder_buf[] __counted_by(size);
 };
 
 #define MT_TX_CB_DMA_DONE		BIT(0)
-- 
2.34.1

