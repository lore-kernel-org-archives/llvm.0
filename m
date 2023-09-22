Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6D44466
	for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 17:52:59 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-274cfc9b049so1774875a91.2
        for <llvm@lists.linux.dev>; Fri, 22 Sep 2023 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695405179; x=1696009979; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R6n/dIamPeUMVNuFW4cdEBQ5hVxUiI5G+G4L0zhGFPQ=;
        b=CpNCSxwDZeux9lDke5qxhFXg++wKCt9IQYMSf+pj9dxqCmXqSCyHLicW6E0u1yQB9c
         SpYNysftM5G9XwLVDcCDnc3Ml4t9PFh79EZTqZJS+9u90NxZrA1AkSQO04G1l0M1uoLf
         k2mjJmpQq2AD+gCiO0PIDAZR3DpeH4+4X9l/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695405179; x=1696009979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6n/dIamPeUMVNuFW4cdEBQ5hVxUiI5G+G4L0zhGFPQ=;
        b=CYhbIUL4Jv52xYPXNa5sA6KFBjmLXZ4kE4NFqXQfq9cfUckvBFMwigqTMRt0M9FFU6
         UqodydfnRGTPl5P+Ysr+sAYgkKyTcOG1xIbLywH+Ygrq32vlJM6OAW1DPVjJYEyU8wvO
         oOofFPZNUahrvlekvD0Te3EhXB3bEA7EzAFZfggpQMoExTxE5OEwbhq3O9/94ziavVN5
         s4KQYA8OjonvejQm4URb5mCAXTjNrsfskAbAiLao65MqjJ2izvpbIKO1ENr9SPkQdG4a
         n/WISs6gK73eyRqq0d42Ujdo/RSsn+6Qv8YuniskT8vWGlnkWn0s0VEfeHstTPlEfSml
         m61Q==
X-Gm-Message-State: AOJu0YyN3ohp609Wz0K3Hg4go6ADZRN4aUUy+ZP2ZwfwA9DsiU33OCgM
	4KJolN1OXYL6Dbl6SgaJhjzNAA==
X-Google-Smtp-Source: AGHT+IHs/kWRYrx0882mgjeumpR6xf+dWnB3lwAWwCO7lNvryszSCtcH04kTeCrZkbhmP/XPZZVTRg==
X-Received: by 2002:a17:90b:fca:b0:273:f848:7da2 with SMTP id gd10-20020a17090b0fca00b00273f8487da2mr391578pjb.45.1695405179414;
        Fri, 22 Sep 2023 10:52:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id lt22-20020a17090b355600b00276d039aecasm3613376pjb.13.2023.09.22.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:52:58 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Kees Cook <keescook@chromium.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] PCI: hv: Annotate struct hv_dr_state with __counted_by
Date: Fri, 22 Sep 2023 10:52:57 -0700
Message-Id: <20230922175257.work.900-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513; i=keescook@chromium.org;
 h=from:subject:message-id; bh=HwvhrIzwS1OngYd5h25a5+mvpp+30OatzAtcoVNIjeY=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBlDdR5RsFIE1XK7abVppH8HIyRHCNnXLkIt/UkZ
 OCZ2BX0XXmJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZQ3UeQAKCRCJcvTf3G3A
 JncDD/46utmowUFXG6KoCyjTSlzv++ojxe1IcbrO+gufqTuw+Zx9r3xXs4QIoyKi0eoj4jJJ2+/
 3G3V1RQtSXyo2+80fzGYwvGjiAxWZFUqpdWP89olIkZkeSRr4BZb3gPdRtaf3z5yqnYeFB7Ziw1
 7zEQEML3k5dIZKlwVoX6voveJFbeZA18/d7KXyr/+YM2bpBa4rhYjLYPc5zqZKU0pMUgRK18NyM
 sXIRpCsfnMA7Pv5Wpl/MfhbaUYg8DL6+1Lc1nyv2pcoXpAj6UDyOsPbVS2oISWnG0syC/qeiz3y
 6fhUJJv1t5jR2Fy4i25bMMqUIROm3k9XEmdslvlFRhVi5pejG2ExMka2HTOsamwrf2ckt+FLkDG
 66GyvAsPqpuOsIpO8IlKusDoYNyHAcN3PJZ/dQJHjyEwClZUOC8XxxJrmdT8PZqsU5pzBxzXfun
 fTkpKGSLKCXIidLcdyXyKD2bZtgS9DiKYIdZ+Pdis2gpsl7RS/cCOMdfmHUeddFhXkNtca9K7Od
 4/maxSa3KshNdnfJ0J1lxw+j3JMSjksAybCVgcQujf2TFW4p3cuG4n2P+9b4FfsyqCFgV2Fm6aH
 YQa8Y6HUI5fH7IAPonRww1YpCuZugNBdNzDh24gdEPiNlYqOl5sTEs9jIEtOcLrrd+NZFj2CmuD
 mOQAEY6 dJELRjrw==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
(for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

As found with Coccinelle[1], add __counted_by for struct hv_dr_state.

[1] https://github.com/kees/kernel-tools/blob/trunk/coccinelle/examples/counted_by.cocci

Cc: "K. Y. Srinivasan" <kys@microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: Dexuan Cui <decui@microsoft.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-hyperv@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/pci/controller/pci-hyperv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pci-hyperv.c b/drivers/pci/controller/pci-hyperv.c
index bed3cefdaf19..30c7dfeccb16 100644
--- a/drivers/pci/controller/pci-hyperv.c
+++ b/drivers/pci/controller/pci-hyperv.c
@@ -545,7 +545,7 @@ struct hv_pcidev_description {
 struct hv_dr_state {
 	struct list_head list_entry;
 	u32 device_count;
-	struct hv_pcidev_description func[];
+	struct hv_pcidev_description func[] __counted_by(device_count);
 };
 
 struct hv_pci_dev {
-- 
2.34.1

