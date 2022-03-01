Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AF9181
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 06:05:45 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id p8so13244412pfh.8
        for <llvm@lists.linux.dev>; Mon, 28 Feb 2022 22:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jUjj6TEe+83dCjS8RX0jAf7rSkzSpvGOk1hJbgvtBtY=;
        b=DxYpK0jV+QEPd20yIaRaBcP5pT5xy0FoABCkWe/WDEq9qlcMIEEXZ4iXcH8x6a/Id2
         jTfA4jsZbhVee4h+e8jUxmnWz+ym+UxXVqf9Yj+jyvwuIw4bMZKBh++iMgugY7fYOYMl
         iwSqicVK/G4VW5MPP+qDa1NQKl90Ma48qf+2C+U4DdOyd2eKNmQIuqv7o/2YTt2IJJHz
         f44wFrtst1fNuaoRayEdYpugwSlizSOGojTgzvynk5FxlI/bA5WOpUG4EaygL//GwthA
         Oeur+PFX4AWmZPyYbwYyc34SRsvWLnqwE4/NqhV6zeSxgH5Zazl8wkBI6isQfjfeucoR
         mc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jUjj6TEe+83dCjS8RX0jAf7rSkzSpvGOk1hJbgvtBtY=;
        b=y7zOomSGHHYRXW48zEjv6S4CRjjYVaTl7kMZAaWHXBvaSSidalmrK/kZoyPVfqf+uY
         dG1oQ0GNkUGDNWgxbTDhg0AEc23CxS+fOoH6kFmUVcYki04Jqt+O1oqqgeClLWiGEByd
         MwhhaqqQOVmrCtbSO/3qx/uWWKS83fwon+UbD+ez6RZF4DmRTLY8D/GUaiBHmhGESF+E
         ulPFDLVSqQr86RxpNI7ntlOzehmgFRSdQEELwOJ9/0wn/auaKfzuW/nnbHz7EqczMtSO
         vgUFOS3FDpeXXUhGTIJEY3wavYTZo93bxUR/4pgJxmsNq/XQ0QBHdDOqCEhe8rARMRyG
         D3rQ==
X-Gm-Message-State: AOAM530TSuuEBfoytfK+z+JL/JbI/4BSdKbntWBLdXpkABDcI17Cdz/e
	qSR/nPFxxXmkJxcPXcr8ooU=
X-Google-Smtp-Source: ABdhPJzoM5r6A72aCOV8FF/+Op4ZDplQaiVIBtr2PnIg7IFjdp32qTPOMs+QHihMavXo6ljYJ/wkmw==
X-Received: by 2002:a63:921a:0:b0:373:df77:ee5d with SMTP id o26-20020a63921a000000b00373df77ee5dmr20027488pgd.90.1646114744736;
        Mon, 28 Feb 2022 22:05:44 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9005:88cd:3423:e74e:cf1d:8494])
        by smtp.gmail.com with ESMTPSA id q14-20020a056a00150e00b004f1252a21casm15567872pfu.161.2022.02.28.22.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:05:44 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: robert.foss@linaro.org,
	todor.too@gmail.com,
	agross@kernel.org,
	bjorn.andersson@linaro.org,
	mchehab@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	"Souptick Joarder (HPE)" <jrdr.linux@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] media: camss: Replace hard coded value with parameter
Date: Tue,  1 Mar 2022 11:35:30 +0530
Message-Id: <20220301060530.5870-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot reported below warning ->
drivers/media/platform/qcom/camss/camss-csid-gen2.c:407:3:
warning: Value stored to 'val' is never read
[clang-analyzer-deadcode.DeadStores]

Replace hard coded value with val.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index abbfbf448893..2031bde13a93 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -405,7 +405,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PERIOD(0));
 
 		val = 0;
-		writel_relaxed(0, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
+		writel_relaxed(val, csid->base + CSID_RDI_FRM_DROP_PATTERN(0));
 
 		val = 1;
 		writel_relaxed(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(0));
-- 
2.25.1

