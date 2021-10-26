Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7E22CA8
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 07:12:07 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id y1-20020a17090a134100b001a27a7e9c8dso1073447pjf.3
        for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pcmEq5vv4/Zod2OeFqMFRTk1dpSjGR5ACaXGxWChEao=;
        b=UROeYmwKyzBBptFZ2WM2sIvqfej1E24tNMxcO+fJbUuoHrtg/lP7jjI67OH+qdCK4c
         2EX6FMwa7uegRS2RqUpww4jwphTv3ml7Ungd7Ij4XVp63cooOxW5qnW3tLyuLnL4Ujec
         yQTW9BW+JoxLOLN3rYXVIFEeMznSxvuuCrfsVwkgbJCscGZIaOkCz3EXJPM0XoNyNhB5
         wWzFJss7rNc1Nx1qv4ymI2cYLw47ggMMnOVtp1I/v4Wx8VSxQP/njbRy1wHnwUsLcKK1
         4Y9AhoJBsGfjAxDCp94+ofWuBiouce9rBw3kpF2H/QE8vQSax6TWM9HPtsL/BuMIu2jj
         ZFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pcmEq5vv4/Zod2OeFqMFRTk1dpSjGR5ACaXGxWChEao=;
        b=2XhZOnqUOaALVKDhapAoN21eVqc7V+Ts5ioRp3qmZlp6WeLldnjIDJY6l9TB0ZCZ84
         35SEY7xpk1q655YZ5dLxITDB7zf1BZ/Z1DOIMOBOBEvQg8JrT8WyDllILpx+H+0WGbGo
         eAoTezGd1WP1tkq+KBEZQBUjkmYzbflI/BAyiMir4sFG4KfWF92SbzWSWELBvHnwD636
         PDddyHSwRWl/zqkwBNufleF05OVDNiERPXfOD+picJLDLu0s2HCoxSWWe6x444rsIeqd
         RLNsqQSeZnJsBPljaeYKYO0H4E0PjVBktkWHGGzzFAk1PUuTavIUT152M3koWJR9I5fU
         8L3g==
X-Gm-Message-State: AOAM530oSc1DYAAG8CLIgcTBOJFtwpFleg7YIKjFdpOAKhwJzvV81p+X
	ME2UYnAgv2Cx1stZknx8kOw=
X-Google-Smtp-Source: ABdhPJziu59cIkiWnsyl37/UYoRpXfnGMq87xvUw1+ZM3AAuKyK6nSnS4JbZ8hGQuLkxHrsKU3d2lA==
X-Received: by 2002:a17:90a:2bca:: with SMTP id n10mr27232652pje.241.1635232327365;
        Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.12.02
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:12:07 -0700 (PDT)
From: Dillon Min <dillon.minfei@gmail.com>
To: mchehab@kernel.org,
	mchehab+huawei@kernel.org,
	hverkuil-cisco@xs4all.nl,
	ezequiel@collabora.com,
	gnurou@gmail.com,
	pihsun@chromium.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	gabriel.fernandez@st.com,
	gabriel.fernandez@foss.st.com
Cc: patrice.chotard@foss.st.com,
	hugues.fruchet@foss.st.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	lkp@intel.com,
	kbuild-all@lists.01.org,
	llvm@lists.linux.dev
Subject: [PATCH v7 07/10] media: v4l2-ctrls: Add V4L2_CID_COLORFX_CBCR max setting
Date: Tue, 26 Oct 2021 15:11:19 +0800
Message-Id: <1635232282-3992-8-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

The max of V4L2_CID_COLORFX_CBCR is 0xffff, so add it to v4l2_ctrl_fill()
to sure not beyond that.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ebe82b6ba6e6..0cb6c0f18b39 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1400,6 +1400,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		/* Max is calculated as RGB888 that is 2^24 */
 		*max = 0xFFFFFF;
 		break;
+	case V4L2_CID_COLORFX_CBCR:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*step = 1;
+		*min = 0;
+		*max = 0xffff;
+		break;
 	case V4L2_CID_FLASH_FAULT:
 	case V4L2_CID_JPEG_ACTIVE_MARKER:
 	case V4L2_CID_3A_LOCK:
-- 
2.7.4

