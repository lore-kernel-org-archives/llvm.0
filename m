Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197776;
	b=CDg4Pjrrty6rNeffkqHMrz+/2XOJzO9+XVS7xBw1fkdTalUzuntauWypJBT1EiNYHlfo
	 CnPq0dcNYjGu7u7OkWxtUlWwVshnExYlYbwT0uGbeUcXxtNy3nMVHAARXMGWuJnQlXbe2
	 yR0HHn1zvenq3ZnCgfrIyCCIM2w30T48VTMb3vLhtMhg0Z6902xZ66YpsLXzbXe+xtMwl
	 XqF+LUMeQ0/hUHsU5H6ezgYIXK2c2KBYSSWbL4okvyrsK5JG7NbpUCyJ8uXfYu0+qEv9O
	 fbXesoSqh/0jJLbjm9dKxFt00A6xSJaFb1aMGQQ9RLge3bGqMxmaBq+MXwbWTDXqBjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197776;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=YHaVD+y7zB4Ff+Ynnos42onyumUQm0y/KwmAf7PZvPc=;
	b=JTWcO1AbdMtHUZ5/obqv488DtoX7U7+sj0gYmKLgSdGzMnt5kKfkaCoA9Sf4hlD967l+
	 7DR+Q49UTcQp1A6MsCQS6UOgl6AAt9dma28PPJWWh19R0VBTxzOhnkDAUpzyTPhD/MAyV
	 bCJomAlPIc7bA2GpR/mjSBBNqm3ja3BwqUZ4vbkTPoCdCzY9NNtFUFiOMXQW0XUg6UYMK
	 nyTXQ8ShhgsphEQAD/fxj6h2VO7OFfAgoUIUlgKd8iYTNW5TQuwqKawRSCrdyUPjNaicH
	 aPkaHT4zFlg23h9g85tGOjf2byMOx911mJ6xrCIZccQ+LGfftDOkAq+fPE46SH6w8cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HcT2d1hB;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373D560A2603
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 18:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 373D560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HcT2d1hB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E6C534E4168F;
	Fri, 20 Nov 2026 18:02:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAEE0601B9;
	Fri, 20 Nov 2026 18:02:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8CA1511BC0966;
	Fri, 20 Nov 2026 19:02:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHaVD+y7zB4Ff+Ynnos42onyumUQm0y/KwmAf7PZvPc=;
	b=HcT2d1hB00gwT9eKZVT38Nwueg1NBjTtrvMpcVzxbnIsq9rhLiHwPF8kuXNhAN1MEFO0RQ
	nt3Y7zZowTfJBwusKYqk7IHR6nOPcBiICknQqBF7ofnNDddUwfnPtOUxPN2d8+wRzqr5mO
	Tfre2SxoXz0qhpKmp/jDgMZC0EN4Wu7oBH1xyBwW1GvCKt2x+DTY7zJVBYZzjLfLNRnGcx
	lHpQPcaCngKEH45sIEQg4W8tTaucw+cYG39V1ZPUVGPaF1hl7AUHZ2Ju5eeR/F/f4LJFmu
	vVqQhbsXLKzLb0sAAhghEWKdmOC39fXSnfWqnjOwaJ6qTfia5ATRc78M12y4WQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:48 +0100
Subject: [PATCH v6 06/43] drm/tests: Add test cases for DRM rotation name
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-vkms-all-config-v6-6-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
In-Reply-To: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3815;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=B3KVoBheTJ1J5bQ+MPIIQ77Ic/UjY4qZi8YFWPmcDx8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr97DCQJdM5xNMvxiHKxur4N8ef6SBI1snIq
 IcSVKU6CZCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOK/0g/9FN4GFIY83pPXzINllDbmrA0Fchk3F7o
 UOEW+Ak/u38WsasNhsmthMEYbdzeshkIFQ9f4ve0Yzly0KDistZVeTBiGndM3NUs4dPKVJunXIx
 qGw1sb0m+TMhTQoCgaUeMYklsb5Wj0ivDQpP5kQ2D6r0xnIBEKLvWr3z/HspcvS0AO2+5YWfWyg
 b3hzyv2oMoUVBYW9chr6uORju9hh6MPaw4mX/Q5rqUpVgjaRs+gqh6Ad4byWNhAm8K5Pt9xRvTu
 nxW3sF1aRc9W5Xm/f9ZzIQwWL+qEUh17qAX0xAO86Ns2LHnrt8dzN6FgTgZKOZa+m6DqTlozdkk
 AK2CMFhtAi0ttmOpA6nD2kA3ge8wu6o6yD4mQcnKnjdTbHLxEdppIqlkm81qD87an31AQJ+f3vT
 8uPJkrVMk5xPHXgV4YDvUaopM9/1sVoZ7MTpt4B39UxSfq3GE5NBj6WqRK4zYY5MFgJOV7+Px0S
 il+QwmJmTZ4YfX9mfvQvjTJXnX+NEa1+RR40KQMCeGMwVmw1v6NCTUDWQ57NK0RLtU/khsU+ujF
 KELMcMihyS653Vc9BnqHHTCO923DR9LkAqOK/e6b5nqERfUCgImHXzZmmgCKHaJ5GV8qUfrq48x
 YuezKEKrH/RQ7gOh6HWTCc1ory6ShRji3mTWLXk3ZUlnDiBYcNXs=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Verify the DRM_ROTATION_FMT()/DRM_ROTATION_FMT_ARGS() helpers.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/tests/Makefile            |  1 +
 drivers/gpu/drm/tests/drm_rotation_test.c | 76 +++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/tests/Makefile b/drivers/gpu/drm/tests/Makefile
index 42207df1d1c8..c10bd6a97f5b 100644
--- a/drivers/gpu/drm/tests/Makefile
+++ b/drivers/gpu/drm/tests/Makefile
@@ -24,6 +24,7 @@ obj-$(CONFIG_DRM_KUNIT_TEST) += \
 	drm_plane_helper_test.o \
 	drm_probe_helper_test.o \
 	drm_rect_test.o \
+	drm_rotation_test.o \
 	drm_sysfb_modeset_test.o \
 	drm_fixp_test.o \
 	drm_kunit_edid.o
diff --git a/drivers/gpu/drm/tests/drm_rotation_test.c b/drivers/gpu/drm/tests/drm_rotation_test.c
new file mode 100644
index 000000000000..c537e7ca35b9
--- /dev/null
+++ b/drivers/gpu/drm/tests/drm_rotation_test.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test cases for DRM rotation functions and macros
+ *
+ * Tests DRM_ROTATION_FMT_ARGS()
+ */
+
+#include <kunit/test.h>
+#include <drm/drm_blend.h>
+
+static void drm_test_rotation_fmt_args(struct kunit *test)
+{
+	char buf[128];
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(0));
+	KUNIT_EXPECT_STREQ(test, buf, "(0x00000000)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(DRM_MODE_ROTATE_0));
+	KUNIT_EXPECT_STREQ(test, buf, "rotate-0 (0x00000001)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(DRM_MODE_ROTATE_90));
+	KUNIT_EXPECT_STREQ(test, buf, "rotate-90 (0x00000002)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(DRM_MODE_ROTATE_180));
+	KUNIT_EXPECT_STREQ(test, buf, "rotate-180 (0x00000004)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(DRM_MODE_ROTATE_270));
+	KUNIT_EXPECT_STREQ(test, buf, "rotate-270 (0x00000008)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(DRM_MODE_REFLECT_X));
+	KUNIT_EXPECT_STREQ(test, buf, "reflect-x (0x00000010)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(DRM_MODE_REFLECT_Y));
+	KUNIT_EXPECT_STREQ(test, buf, "reflect-y (0x00000020)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT,
+		 DRM_ROTATION_FMT_ARGS(DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 |
+				       DRM_MODE_REFLECT_X));
+	KUNIT_EXPECT_STREQ(test, buf, "rotate-0 rotate-90 reflect-x (0x00000013)");
+
+	unsigned int all = DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90 | DRM_MODE_ROTATE_180 |
+			   DRM_MODE_ROTATE_270 | DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT, DRM_ROTATION_FMT_ARGS(all));
+	KUNIT_EXPECT_STREQ(test, buf,
+			   "rotate-0 rotate-90 rotate-180 rotate-270 reflect-x reflect-y (0x0000003f)");
+
+	memset(buf, 0, sizeof(buf));
+	snprintf(buf, sizeof(buf), DRM_ROTATION_FMT,
+		 DRM_ROTATION_FMT_ARGS(DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y));
+	KUNIT_EXPECT_STREQ(test, buf, "reflect-x reflect-y (0x00000030)");
+}
+
+static struct kunit_case drm_rotation_tests[] = {
+	KUNIT_CASE(drm_test_rotation_fmt_args),
+	{}
+};
+
+static struct kunit_suite drm_rotation_test_suite = {
+	.name = "drm_rotation",
+	.test_cases = drm_rotation_tests,
+};
+
+kunit_test_suite(drm_rotation_test_suite);
+
+MODULE_DESCRIPTION("Test cases for DRM rotation functions and macros");
+MODULE_LICENSE("GPL");

-- 
2.56.0

