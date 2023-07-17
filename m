Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E410970
	for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 22:29:26 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b8bbce9980so29504775ad.2
        for <llvm@lists.linux.dev>; Mon, 17 Jul 2023 15:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1689632966; x=1692224966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XFPVhrUWRZQSAaKQnnj1TZG9poZqEqSu3fVdFJa8KKE=;
        b=YHbmAyIqg8BYpJU1Jk+XnlqKZH3UCVovE5VLeCN3tuNUrY/YLOl0HTKZydaosVQ0mi
         bZ/+W7LaITxuZQ7V0/ZvDUCbe8DuZA62WoXOTwBKy/EH1GOSsAU1WER+eLG5I3bcGQ8g
         9RubTwXoJcDUl8g3IOnz3/GFqSZACjnxzTlCj+4JqoaaXj6mcm/Pbnow99OvOfjdCBkR
         juCPV3H7FJFjkVSd1lhUxp3cd0E0Pg7TUp1lyVgFshzwbhi8ju8hQFNSyiHsXMlks4Mu
         tF6014MG/tDwXw6owFkRGs3p712Y0TRM+xwwZ4ZAyVtu+hsrNEFxxR0Y0OuIfe9awYnk
         teCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689632966; x=1692224966;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFPVhrUWRZQSAaKQnnj1TZG9poZqEqSu3fVdFJa8KKE=;
        b=eicjPDw/q+zMiXOqopfuci2mbtlbqreNEywMGVvHRSXhJxYVKPWdx2rsCxA2rSdvOV
         yGMdGreDoxmm+nFxCqJHLQDAHB5bcEVuynZsqDjQhwXZXAZzyjxFyEBC/Mgws5cOvAWa
         qzuEMFzBgv13N2fnTPambXDEr85VthmA+TBBE6d5YYnZILJ08Ur2V5rYY4mU4B+LvTrY
         F/O4E0T5K9sL1p7ZZc6NAHHJ7QtSh8Y3mRXoqoZ2shXGJkyG0WgzdZQOMXxTykdf8J5V
         pf2pBSFdSoOqgAtZfNKh8M9SgNEsYBoiJI4QHNiTwqH9QR1OPg9zYRsgYdnSG8DXwauz
         gyaA==
X-Gm-Message-State: ABy/qLYkjcbtG4aAzSS999YPNVndlfof0fRxFZL7ObacTgJxmAvb7lI3
	h5R3bHq+FtvWdLgnhxzGWG9gSg==
X-Google-Smtp-Source: APBJJlGcyS1478AzqSwi9033GBaEO4A6Ib9Gvs0E+TYvAHuX+SPIhJ/+F5b4vj5CO2kQ+M8+NIDK/A==
X-Received: by 2002:a17:902:9a4b:b0:1b9:c03b:39d9 with SMTP id x11-20020a1709029a4b00b001b9c03b39d9mr10939188plv.53.1689632965727;
        Mon, 17 Jul 2023 15:29:25 -0700 (PDT)
Received: from sw06.internal.sifive.com ([64.62.193.194])
        by smtp.gmail.com with ESMTPSA id o15-20020a170902d4cf00b001b9e8e833f3sm375704plg.61.2023.07.17.15.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 15:29:25 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"Pan, Xinhui" <Xinhui.Pan@amd.com>,
	Tom Rix <trix@redhat.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] drm/amd/display: Allow building DC with clang on RISC-V
Date: Mon, 17 Jul 2023 15:29:23 -0700
Message-Id: <20230717222923.3026018-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

clang on RISC-V appears to be unaffected by the bug causing excessive
stack usage in calculate_bandwidth(). clang 16 with -fstack-usage
reports a 304 byte stack frame size with CONFIG_ARCH_RV32I, and 512
bytes with CONFIG_ARCH_RV64I.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/gpu/drm/amd/display/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index bf0a655d009e..901d1961b739 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -5,7 +5,7 @@ menu "Display Engine Configuration"
 config DRM_AMD_DC
 	bool "AMD DC - Enable new display engine"
 	default y
-	depends on BROKEN || !CC_IS_CLANG || X86_64 || SPARC64 || ARM64
+	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
 	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
-- 
2.40.1

