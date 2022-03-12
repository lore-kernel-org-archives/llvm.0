Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB5E361
	for <llvm@lists.linux.dev>; Sat, 12 Mar 2022 14:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647096819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=idEHkhQAaOBliwENS0wsp/XJ+A6XVFB7baxao15C+mw=;
	b=hLmcei91oGlftmANiLillw7ve4An6bxuc3uRIe8T+PG1Ec0kJuANuAwcDcX33eHZIYhXB2
	eS+KhLA3Hg1zlBIpmtN/+RAoQsV2xoz882j+sy0FUUI2ZAoaNa82N3iWch/CPTuGjLqyGM
	uPTMzxDqaEBF55tWAxVMhZS0IUcmH1g=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-Q9GXc4XtP0Kxtb8zSoXkvg-1; Sat, 12 Mar 2022 09:53:37 -0500
X-MC-Unique: Q9GXc4XtP0Kxtb8zSoXkvg-1
Received: by mail-qv1-f72.google.com with SMTP id b3-20020a056214134300b004352de5b5f0so10070052qvw.20
        for <llvm@lists.linux.dev>; Sat, 12 Mar 2022 06:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=idEHkhQAaOBliwENS0wsp/XJ+A6XVFB7baxao15C+mw=;
        b=cjJibszBJmXjjxadi0eYEifPn9BoMDtQ0sd4f7UhLPdsLwapMdR+EHnMYFnc2kOYDC
         RV3Ya/wuLloe9Uwc/2NMKu1cR8aU40x/jx8qwLKpiPugl0AVE0qKcGD5o/GgicUUolFQ
         ZpabtDnGq4W/i8kS7onR827suuspkDL8D/pwobrV8nhOr1i1rQoyzkuy04Lw0QNhtLPv
         CVrCHJ3/UxXqMeTO8114tsCKkbTj37eTJ1IJn2R5Dsk8UROoeJfvqvJ1E+jEYxz+F1oK
         E2B7z5YsvvddTt2/JhikhEWNoAsfa5psDMc32YbkwJPUTuaBaz5nPdSnxpdZ0UJb6hc9
         zWkA==
X-Gm-Message-State: AOAM530DE3RJsYpdIvDtx0hGg9d/Hg4H9cOLLARNbS+LfEakGxHYSSE2
	eW8bDUxLJgnpBLH+hgH/ZN2wkoVpPVj7uG230BX/8kB8Bo7WhRX9EEyKtf+QLrOl4FzozXj+rCI
	m15RZkcNBB5tP+A==
X-Received: by 2002:a05:622a:1a12:b0:2e1:a631:aecc with SMTP id f18-20020a05622a1a1200b002e1a631aeccmr12502473qtb.383.1647096817448;
        Sat, 12 Mar 2022 06:53:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyedg6i9wIc8nITyii9SK3A7/ikxZR+w6n+U2G2GpCA5FFJbmerz+UION3dSN4kxgzqvNDuqA==
X-Received: by 2002:a05:622a:1a12:b0:2e1:a631:aecc with SMTP id f18-20020a05622a1a1200b002e1a631aeccmr12502459qtb.383.1647096817232;
        Sat, 12 Mar 2022 06:53:37 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id h62-20020a37b741000000b0067da4164f8fsm669640qkf.126.2022.03.12.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 06:53:36 -0800 (PST)
From: trix@redhat.com
To: hmh@hmh.eng.br,
	hdegoede@redhat.com,
	markgross@kernel.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: consistently check fan_get_status return.
Date: Sat, 12 Mar 2022 06:53:27 -0800
Message-Id: <20220312145327.1398510-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Clang static analysis returns this false positive
thinkpad_acpi.c:8926:19: warning: The left operand
  of '!=' is a garbage value
  (status != 0) ? "enabled" : "disabled", status);
   ~~~~~~ ^

The return of fan_get_status* is checked inconsistenly.
Sometime ret < 0 is an error, sometimes !ret.
Both fan_get_status() and fan_get_status_safe() return
0 on success and return negative otherwise.  Change
the checks for error, ret < 0, into checks for
not success, !ret.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 708743ec9ae79..c568fae56db29 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8285,7 +8285,7 @@ static int fan_set_enable(void)
 	case TPACPI_FAN_WR_ACPI_FANS:
 	case TPACPI_FAN_WR_TPEC:
 		rc = fan_get_status(&s);
-		if (rc < 0)
+		if (rc)
 			break;
 
 		/* Don't go out of emergency fan mode */
@@ -8304,7 +8304,7 @@ static int fan_set_enable(void)
 
 	case TPACPI_FAN_WR_ACPI_SFAN:
 		rc = fan_get_status(&s);
-		if (rc < 0)
+		if (rc)
 			break;
 
 		s &= 0x07;
@@ -8843,7 +8843,7 @@ static void fan_suspend(void)
 	/* Store fan status in cache */
 	fan_control_resume_level = 0;
 	rc = fan_get_status_safe(&fan_control_resume_level);
-	if (rc < 0)
+	if (rc)
 		pr_notice("failed to read fan level for later restore during resume: %d\n",
 			  rc);
 
@@ -8864,7 +8864,7 @@ static void fan_resume(void)
 
 	if (!fan_control_allowed ||
 	    !fan_control_resume_level ||
-	    (fan_get_status_safe(&current_level) < 0))
+	    fan_get_status_safe(&current_level))
 		return;
 
 	switch (fan_control_access_mode) {
@@ -8918,7 +8918,7 @@ static int fan_read(struct seq_file *m)
 	case TPACPI_FAN_RD_ACPI_GFAN:
 		/* 570, 600e/x, 770e, 770x */
 		rc = fan_get_status_safe(&status);
-		if (rc < 0)
+		if (rc)
 			return rc;
 
 		seq_printf(m, "status:\t\t%s\n"
@@ -8929,7 +8929,7 @@ static int fan_read(struct seq_file *m)
 	case TPACPI_FAN_RD_TPEC:
 		/* all except 570, 600e/x, 770e, 770x */
 		rc = fan_get_status_safe(&status);
-		if (rc < 0)
+		if (rc)
 			return rc;
 
 		seq_printf(m, "status:\t\t%s\n",
-- 
2.26.3

