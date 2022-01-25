Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637422C82
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 14:15:02 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c24so60971923edy.4
        for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 06:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HkTnPkoYmXA4o33CQwaR2cCpMRcwMTvIA7CjbMtp4X8=;
        b=liF2Wp/McWZoP3ZShQIpjE5/sIhYMf0uJeg2L1aXhh63bJ3jbC0XABp7fLmb964SK5
         lOiJ5X1uXDw3TUO6bDVMIX5MriYFB7YATZZ0tLSPHNXGMJC6bZS9EL4rDa02swbuNdbo
         DmtoCsEf7K4cjP7y0huxJiA+KfUK4bdTQ42UQKRSLvYFTHN7qR9kSvroeia+Gghe029G
         ADJCK7nnTtoQFSrVi9QgAASkkemGFfMsogUpqQwAVZEGGdcklOk0W/zc6f/faEVkqC+E
         genNkQFFKgee8LsMbJycfmPud9Fbky6fk9QADDsjxChs8Na03s4X3XpKwPreRfDEjpF6
         h2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HkTnPkoYmXA4o33CQwaR2cCpMRcwMTvIA7CjbMtp4X8=;
        b=IWOzQadVlBV26LJZusvhZJ6VZ23RYKvRvM/lMwmx0y8LHYi+DNKsCyscFLLLsoxsq+
         EVQ5RuDg6MpYSrWH2/zAh8ycEDPImdjQvdmAgf4ugqkgPu5ub9ZuS2+uoaOkEXDoQTlv
         gOtabILPGDWJsqPjCiDtFGlsmThJQv3JaYpFZaYjK4IJbdg4b2JVoD/s5/QqyiFMKVSJ
         EFENk5TYjyAdWzOVdMFq6nYZkKFtrl5mkoYxhl2ldUKhnaVxQE2huYV9ENruOJBNAZ5G
         EyfR2OsmB2yLjSF+WOknFNIgktyvsZQ8P+Fhwsrs64tJ+mGq1W20KFn3gJSnAt7WAr7x
         UxHA==
X-Gm-Message-State: AOAM530Rx1asJQSWit/Zq+Q8MNh79IXIPyVXynLBYoyB0+0WWJ6wAObc
	grSught8X2SH24znoIo9dVU=
X-Google-Smtp-Source: ABdhPJyZ2SzgnylMxkUA8QHSS1c2l+JvdVmhWnUm2eTZkU0KnPQrcjvBrAUgZQADq3t2jU5m3VkPew==
X-Received: by 2002:a05:6402:4401:: with SMTP id y1mr5126326eda.215.1643120100734;
        Tue, 25 Jan 2022 06:15:00 -0800 (PST)
Received: from debianHome.localdomain (dynamic-077-010-144-044.77.10.pool.telefonica.de. [77.10.144.44])
        by smtp.gmail.com with ESMTPSA id lu44sm6292929ejb.145.2022.01.25.06.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 06:15:00 -0800 (PST)
From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
To: selinux@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Eric Paris <eparis@parisplace.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Jeff Vander Stoep <jeffv@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 8/9] selinux: simplify cred_init_security
Date: Tue, 25 Jan 2022 15:14:18 +0100
Message-Id: <20220125141422.32655-7-cgzones@googlemail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125141422.32655-1-cgzones@googlemail.com>
References: <20220125141422.32655-1-cgzones@googlemail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The parameter of selinux_cred() is declared const, so an explicit cast
dropping the const qualifier is not necessary. Without the cast the
local variable cred serves no purpose.

Reported by clang [-Wcast-qual]

Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
---
 security/selinux/hooks.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 5b6895e4fc29..a840c8c1ec35 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -211,10 +211,9 @@ static int selinux_lsm_notifier_avc_callback(u32 event)
  */
 static void cred_init_security(void)
 {
-	struct cred *cred = (struct cred *) current->real_cred;
 	struct task_security_struct *tsec;
 
-	tsec = selinux_cred(cred);
+	tsec = selinux_cred(current->real_cred);
 	tsec->osid = tsec->sid = SECINITSID_KERNEL;
 }
 
-- 
2.34.1

