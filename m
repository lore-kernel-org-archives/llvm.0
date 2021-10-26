Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A72CA8
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 07:11:56 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id f5so13212764pgc.12
        for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 00:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=YJt0hdV4kzdXc6X1C3SE5PDn2rhPDieOGx+r2tKEjZE=;
        b=HYeqwC260+v7LmqrfNhi8BodcmsCMqshSPxR4nFgNmstTkvQUcDqsmYoDqpRDnhe0P
         N5R0YrW7+b3NDKIWHa43KY1ni03gfzLWU/cTAfs8NVoWpF4D6Al30KM7inCMqDpWPvf0
         DPKX0XEJVC14/ygeP24nTEtaIOBeh8/lM21tGKocXH4AcL97bF/mWquqB80SClSkjoYz
         S0bRkgzsifWRI9BNZ8KSTYLpiRnnmFb9IJz3OxLNxneUQre9GLLxSLXuHX3Dawmq5cuw
         SVSEDZTP//P2wkdNj+EuuRCmQRMINpqX6Kvy9VAXW/4xAyYd7WiAgPq/mPiipksiKYJ5
         AFSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=YJt0hdV4kzdXc6X1C3SE5PDn2rhPDieOGx+r2tKEjZE=;
        b=GYIHicNhoaDuIdlrA14buCFM/i3gyL4Z5X1IUBqX+PFqdjdX2hfhjf3FUGFkLE63O4
         x4dhLBz1UUJS63fAPGQN6tTzf603iqIOhs1oyn9SmtxgILMcP9edlz2G4udd/TOupx2W
         R8KC4cT0UO101IdrPBeEUiKTqIpaLOJdwGDLPLsCVA/OXroL1VNDiw0/cvAc3YkSBLXM
         KwbW+SN/Qg0Rfd8KIHaxh0JH25LymdEY73p3dPc0rIbOmnZlR79UcW5JLK4TZHDUHEm1
         p4aY8Kmq5ulhdlp+IlmAgjVBNX4i3yLb1TTlX/PF0GgYMXVWtLg/MetCy54OG0HdmQxC
         bewg==
X-Gm-Message-State: AOAM5309HsQExDtcA9AT7U+WgY/pO8rvNeSci3+1jeYvq3z3/RPrC1Xr
	FVszJKJysdxAk+ZE+/kkWrA=
X-Google-Smtp-Source: ABdhPJyKVKyyzYptJNlN1szbfFlQqhI4CiYZWnN19Y5i6NZft9uz62l9xG7RV3OpWbGicirrwFhc4w==
X-Received: by 2002:a05:6a00:c8a:b0:47b:ff6e:4cf3 with SMTP id a10-20020a056a000c8a00b0047bff6e4cf3mr7880068pfv.50.1635232316568;
        Tue, 26 Oct 2021 00:11:56 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:11:56 -0700 (PDT)
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
Subject: [PATCH v7 05/10] media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area for no-mmu platform
Date: Tue, 26 Oct 2021 15:11:17 +0800
Message-Id: <1635232282-3992-6-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

For platforms without MMU the m2m provides a helper method
v4l2_m2m_get_unmapped_area(), The mmap() routines will call
this to get a proposed address for the mapping.

More detailed information about get_unmapped_area can be found in
Documentation/nommu-mmap.txt

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 21 +++++++++++++++++++++
 include/media/v4l2-mem2mem.h           |  5 +++++
 2 files changed, 26 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index e7f4bf5bc8dd..e2654b422334 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -966,6 +966,27 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 }
 EXPORT_SYMBOL(v4l2_m2m_mmap);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+					 unsigned long len, unsigned long pgoff,
+					 unsigned long flags)
+{
+	struct v4l2_fh *fh = file->private_data;
+	unsigned long offset = pgoff << PAGE_SHIFT;
+	struct vb2_queue *vq;
+
+	if (offset < DST_QUEUE_OFF_BASE) {
+		vq = v4l2_m2m_get_src_vq(fh->m2m_ctx);
+	} else {
+		vq = v4l2_m2m_get_dst_vq(fh->m2m_ctx);
+		pgoff -= (DST_QUEUE_OFF_BASE >> PAGE_SHIFT);
+	}
+
+	return vb2_get_unmapped_area(vq, addr, len, pgoff, flags);
+}
+EXPORT_SYMBOL_GPL(v4l2_m2m_get_unmapped_area);
+#endif
+
 #if defined(CONFIG_MEDIA_CONTROLLER)
 void v4l2_m2m_unregister_media_controller(struct v4l2_m2m_dev *m2m_dev)
 {
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 5a91b548ecc0..fdbd5257e020 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -495,6 +495,11 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
 		  struct vm_area_struct *vma);
 
+#ifndef CONFIG_MMU
+unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
+					 unsigned long len, unsigned long pgoff,
+					 unsigned long flags);
+#endif
 /**
  * v4l2_m2m_init() - initialize per-driver m2m data
  *
-- 
2.7.4

