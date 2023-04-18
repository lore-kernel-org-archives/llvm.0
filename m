Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB3023C0;
	Tue, 18 Apr 2023 11:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83822C433D2;
	Tue, 18 Apr 2023 11:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681817004;
	bh=IWIhSHtXN5nXxkAIHYe//XXXEDzJDm71oCZAeg45FLQ=;
	h=From:Date:Subject:To:Cc:From;
	b=j2BOdExt1aEudYgnio6ULM3NMX1kKONLTQzO8lrN5aWTX8ZAeQb069WqlkhDkaL5T
	 pwQeVc1ts2QGftGu3IuySEHNJ0IL+LnlSeCoeCgItn/swYpcpUlFlWwDOeSURv0mC8
	 3R2oqJE5g9FON1DHLyTEivkUnDst3+RhhG1rxR/0IQnu/lyL4xXXA86zH0x9SMPVLy
	 ogOW89hjUKzkmdAjuIyA1n0V6vUurYiqkvivHVrXqsVanlQgiNfVOwW8MZ2sJoX9EM
	 CBLqiIucydnPRYqO42+brshR7zZBYccdAZizU/KdzomcEE/EcQEjClMofkj/WcE5bY
	 9RQIt5TdMdd2Q==
From: Simon Horman <horms@kernel.org>
Date: Tue, 18 Apr 2023 13:23:11 +0200
Subject: [PATCH] staging: vchiq_arm: Make vchiq_platform_init() static
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230418-vchiq_platform_init-static-v1-1-3c38ba81bc66@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ59PmQC/x2NQQqDMBAAvyJ77kLU0tp+pYhkk7VZSBNNohTEv
 1d7HAZmNsichDM8qw0Sr5IlhgPqSwXG6fBmFHswNKpp1bXucDVO5mHyuowxfQYJUjAXXcSguj+
 ovZG1HREcAdKZkZIOxp0JH432OC+88GmnxKN8/+tXv+8/9Kxym4oAAAA=
To: Florian Fainelli <f.fainelli@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-staging@lists.linux.dev, llvm@lists.linux.dev
X-Mailer: b4 0.12.2

vchiq_platform_init() is only used in this file so it can be static.

clang-16 with W=1 reports:

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:5: error: no previous prototype for function 'vchiq_platform_init' [-Werror,-Wmissing-prototypes]
 int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
     ^
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:465:1: note: declare 'static' if the function is not intended to be used outside of this translation unit

Signed-off-by: Simon Horman <horms@kernel.org>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 40dd62cf7399..59312b9f2058 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -462,7 +462,8 @@ free_pagelist(struct vchiq_instance *instance, struct vchiq_pagelist_info *pagel
 	cleanup_pagelistinfo(instance, pagelistinfo);
 }
 
-int vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
+static int
+vchiq_platform_init(struct platform_device *pdev, struct vchiq_state *state)
 {
 	struct device *dev = &pdev->dev;
 	struct vchiq_drvdata *drvdata = platform_get_drvdata(pdev);

