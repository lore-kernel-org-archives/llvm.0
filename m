Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02AE43A87
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:50:21 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bdf4752c3cso20322735ad.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405021; x=1696009821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fnSUWF58ojeWw3KcW4a/aInndGgQ4B+bmfIwHKF+S5o=;
        b=MJ839hZBiwjrw63xmK3nrRSPfuaiBQRXR2HWmI5qG8pOSYLrZjR0RXDvL5sjdPHRm1
         1nyHAkMrWtHIAkYg2rbfbNDf3WiTPRQAvsdaQuLd4UCV1WBheIo9QgGHMks42JuBCBpQ
         tyU6sFdxiq1Isa3iZvLV7y5BG2ztgt6uIOn+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405021; x=1696009821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnSUWF58ojeWw3KcW4a/aInndGgQ4B+bmfIwHKF+S5o=;
        b=w7Digl1oMMBTuzQXd3FmbYwuMZDVqELD1na8Y3moLhtuIFqKRPWX1LfnCyCH7fSARO
         K5bX+46YkAl6eXo/1w+HlDcmkAagMhfbcmKHW9cY5R4haGKJ9gcZUxHvV9s+tHRa1kf6
         S+b3LqPJcyEY2csOmsbEv28gLr/HHj8JLE8vK6J6ZY426UuHD7rydRBJ97hbvdbABfR4
         CXC6KK26svhrsmRDKjwrB8pkgfVLk+nAVFiqWdcg3oZL0N2I0fQLlnyhojvG1LWNpCTj
         asQLb+5zxro/zlxQvotRIwI2Vg0roDJqf2E8RXkja/t/9C7wRzThbbmg7jml8yTqR24d
         CTsQ==
X-Gm-Message-State: AOJu0YzdIEla/WFWf8wUW8vi89KCqgO3imsG7S2/h45hRG1Y4T5S+VRF
	f2DOz52u7eFZeJ9ty5aEszfYzA==
X-Google-Smtp-Source: AGHT+IEpwE+lbw9N8VqTU6cLI1njnvdhNqJvkC4T2WCQ+CtSy2geBYXLs4Lb8xITWNjg+VuykJZz8g==
X-Received: by 2002:a17:903:2348:b0:1c4:13cd:b85f with SMTP id c8-20020a170903234800b001c413cdb85fmr154761plh.5.1695405021369;
        Fri, 22 Sep 2023 10:50:21 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id j7-20020a17090276c700b001c0bf60ba5csm3750500plt.272.2023.09.22.10.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:50:20 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Kees Cook <keescook@chromium.org>,
	Nicolas Pitre <npitre@baylibre.com>,
	Len Baker <len.baker@gmx.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	linux-i3c@lists.infradead.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] i3c/master/mipi-i3c-hci: Annotate struct hci_rings_data with __counted_by
Date: Fri, 22 Sep 2023 10:50:19 -0700
Message-Id: <20230922175019.work.129-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1308; i=keescook@chromium.org;
 h=from:subject:message-id; bh=VnYZTZQDzvs6FPCd796RbHEvmVY4nxS6fY7pQ/TUq58=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdPb7evFPyNbPT0FdckJpxJpxqM4N1hl+rZT8
 PBWQWPuA6SJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3T2wAKCRCJcvTf3G3A
 JknqD/4/xs4n4EK36LHG01DepzXWVJmm7fPp0/czFh0mjmYFE+bK4F26rpn6lgsBQhf7ZjQ0Oj9
 nKVj0QLvgCFAtpBT32huepq+fL5RwuTNOtJ2/XlgSeNhVNO5huuxSsL7qveP4T2OJRJUWgxsG5S
 QKEU1ED/1P4CSCOEVITabzeBZjqANlqDE8aZVqz48j+C7Su+O2MeQZ8+tgA7ApE0UIynp599kxT
 hirXsgBk1UnxTKiCT/8YogzSWpIJP/kCfQBluYyuNgjXU6ByV771+6OFIHXuW1E5us27fhmapqS
 AgHC5MfhZAvS50WOCpsVNDXSCe0dM9hnEPgA6yscEl3Y5z6OE6D7GZBsj0C8T5ksP4j/kIZHQ3S
 eTPF69qS8MYYgPaCYKJi727lFoCd8EVEZhT5njFT2SWBdE83dALCTI5SisWRPjcAHSTJk/5TSpf
 wsaA+sMNRgxMRlF10ZSBfoDRlDd6HDPFL/leLCXvJMyCXNuNgs+EBtVHvlrte+K44NEq3qlVb5F
 ZXGWXTLNs6/9I4s5DWl3JrRbuvoTOUGWi9Pdc+RmUPx0sU3LAJgltK/3gAwmfpJEZHJVRuDmxuX
 Nu+VZAWXphQB9Gs3lc6M9eEGG+ijJjygN/yin4pvq+fQY13ztOFq8RKo7MKTBrH8D/1AfABwnBH
 0WbbyJb xBwZlDsA==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct hci_rings_data.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Nicolas Pitre <npitre@baylibre.com>
Cc: Len Baker <len.baker@gmx.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-i3c@lists.infradead.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/i3c/master/mipi-i3c-hci/dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dma.c b/drivers/i3c/master/mipi-i3c-hci/dma.c
index 2990ac9eaade..a1ecdfc35641 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dma.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dma.c
@@ -139,7 +139,7 @@ struct hci_rh_data {
 
 struct hci_rings_data {
 	unsigned int total;
-	struct hci_rh_data headers[];
+	struct hci_rh_data headers[] __counted_by(total);
 };
 
 struct hci_dma_dev_ibi_data {
-- 
2.34.1

