Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26629CA
	for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 07:11:51 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id oa4so10220785pjb.2
        for <llvm@lists.linux.dev>; Tue, 26 Oct 2021 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=v5Jn6J7/l0TaCmJa3oToQu6cLShq8Ci4O48ykDgquPE=;
        b=FnMiD/yEd8r5STTgSNxpiErKAzGkF/Kko+aHtyxKURrP9GTpaI/otiknwLSlWcg8JA
         LauRUtiGqflJco+vkSMWqZ+jIY2i543gFniL0JzBmJzAbf425b1bm0dvANz1aNk032YQ
         +NxzBzKjW4bw81gjqFnYZ49UTRhAcHPylrZ8MVPeWIOSQTjW0FO2QVDWQwcPAgrPnmhP
         61xdfdR+yD07+ofRM93/9fGpbOt13g2ubXNOVeoYCmuezdufEgE/gryZB+21nCg67V/v
         KU60CwlRPCXxxnNMKoUyQFnoey+kXZ1Ox4MUQXGN4ozObwgmJKv9++tjvZQAcpOaM50a
         FKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=v5Jn6J7/l0TaCmJa3oToQu6cLShq8Ci4O48ykDgquPE=;
        b=ZAFvn8eu0wIbwLD5KTenUr6+Jy14wZd2itWgwBuxOFGvpMPWwX4ifSUkiIDiO+8TZg
         Rn/sXK6B7HUQWgvAUSC6RjsAeDU6hkgR2UeQRZuwITvZzIL0DYRhUolKMurmQ954iNZz
         b+A6lRKfWha4VE4rifvAEjUDi7G+gDM5PMNQdxLbPQigousbhtrjEqWLhSRs5JAOJBcC
         z3kqKGyEvtdX9hlCeI6iI0getgkBX5GkcqNufum8EFoTtnpcaSEQdJn5+NeD8+tbaFgN
         NnmRT0s85tXUyncZzrsx2sgyw+uI9dVL4E0kQmdgCdOpErgn7pn0jEsDbYCChi2UzJ7Z
         v2Zw==
X-Gm-Message-State: AOAM531JKm/13icRmes+OsVhs+PcnUAV5Zc3WXf3yMVQXazU6dS/61oD
	QgyIU06n8f3eDfryrJGAZj0=
X-Google-Smtp-Source: ABdhPJySkA2o4FFhQYEyzwSUb7PH8O6xeB8p+lh9tMMoJ2WfjXksxtulja+sI2x6eUDSlRNcfIJnHw==
X-Received: by 2002:a17:902:a5c2:b0:140:14bb:8efd with SMTP id t2-20020a170902a5c200b0014014bb8efdmr20876966plq.31.1635232311156;
        Tue, 26 Oct 2021 00:11:51 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([137.59.103.165])
        by smtp.gmail.com with ESMTPSA id l11sm23243367pjg.22.2021.10.26.00.11.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Oct 2021 00:11:50 -0700 (PDT)
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
Subject: [PATCH v7 04/10] ARM: dts: stm32: Enable DMA2D on STM32F469-DISCO board
Date: Tue, 26 Oct 2021 15:11:16 +0800
Message-Id: <1635232282-3992-5-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Enable DMA2D on STM32F469-DISCO board.

Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
---
 arch/arm/boot/dts/stm32f469-disco.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/stm32f469-disco.dts b/arch/arm/boot/dts/stm32f469-disco.dts
index 30905ce672a0..ba26a3375b0d 100644
--- a/arch/arm/boot/dts/stm32f469-disco.dts
+++ b/arch/arm/boot/dts/stm32f469-disco.dts
@@ -132,6 +132,10 @@
 	clock-frequency = <8000000>;
 };
 
+&dma2d {
+	status = "okay";
+};
+
 &dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.7.4

