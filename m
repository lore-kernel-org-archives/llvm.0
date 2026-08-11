Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F873264F1
	for <llvm@lists.linux.dev>; Tue, 11 Aug 2026 06:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430049; cv=none; b=fzMfU37vK/V+cdpik3mZquAlWRQUWvnNHIB3YD0q3LKqmCUss82Z+G66gGtX0w7cnnGk/Des2ejNMQkpsMRSnDLRa8MCkzNhBgZAKXGYLeeF961PsFf4ywbfxoNWtgHUBiM0Mll3FPsX79Ut2lyzb1vZuNrTRJ32hya3CkHoSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430049; c=relaxed/simple;
	bh=+7GhGXLEGPUz5iGB4uoeLstXKais/dJAz3maZh3x0CM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkc6OUo1yMRoNABMsiFB8vVgI9Cw/P+6aK9cNqU9m9T4TAP3mf797WhlGXVVGSl1usrRS71nIS4V9J33xI+Q7XkZVegzEznmVy8tBe9IvFIIG/Vw4j5TKMT6ITUI+z8ZnmpBYjD8kaSBkhxT36O56VsqKcAcrR24+StcgxK1vsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qypiLHiS; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qypiLHiS"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so3497793a91.1
        for <llvm@lists.linux.dev>; Mon, 10 Aug 2026 23:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786430048; x=1787034848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e7G7fEbJZ8y/XNupU9AJh184DDjemZTaOluaGNPD7bk=;
        b=qypiLHiSKeqO+Bk8Rxvm6gy9Bn2sBUsmKuF+gwNAyS7jGpHMDprS0tdGpW32RJiI0A
         U0ngSK/AIRzstlrx6Z+5nttkZGP9k44LezF5hK7+y0zKCwnAuxRDCRo9FPzRsFFCOy4u
         OWnwoE/si7TaPz+B6Ombhke58EvOSGCu7uoADE7LB21xPLMbKoNGIoi+YbnUZ2If+eY8
         eHkaW1s06MewyzVbnVSHOlp2oOqnIY+GPEtIY0ZCAyG9ooWytCKibceDg2NvpRJGXuVr
         rYnC4oxhalFEnEHiavhkIiveY8nY+nM2c9Fmh1t8NfH+CrRPnZkKPRTq53sgjV/V77nx
         nnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786430048; x=1787034848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e7G7fEbJZ8y/XNupU9AJh184DDjemZTaOluaGNPD7bk=;
        b=orswTvjo4T7R0r1VXj0hEH5vlSCI09KWHjHYE3LJYhxsTMOtrqPR4eG7czY22zPEKT
         Z5LUlOBNh2gJCwqSZaHPSiOvH2yu45kydP72Rg535BN5Yd3Fj8tIFZipyYq1FW7GgUSf
         zqgUjxQ+zdti3veiuyJXJqatjhMRe9VcrhJfIl7xIts+LBnj1SdUPH58dtAuvAsHTTLO
         /g93znRZJ3rooWrAjRPVU3bcawGVFQVoLJ4VR19Xcv5+Yvr5UKM7eMhxBYmLAZ0hA8sq
         bbKZGc+I71eDhvcEsHcmniZElsyPw3xwt0s+SWdaQXEJePLzk+QN3MPzYK/Vrgh03TFK
         bl0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpNU3BAaZifwZOXozZwHPkXfaTpwt2v2cDCn7X7oEiiZvC+k4KaFQbjv/gudMfOolE4L+Jk@lists.linux.dev
X-Gm-Message-State: AOJu0YywGz9GxoS2lQMMvA5tjLfDPH9C/nGZWKHHXm9EhvdwcZyQABGb
	13cQrPON12jsF2eyGEXBgOxomt18Ekyx0ZRPKVx4dOq8XCXiekVN4IbP
X-Gm-Gg: AR+sD11ziShMFqDis28Mn2XjL3Y05wa+Ltklpfc/yyYy9FlAAJt8yUTdGZ9FZ2FGYAS
	pDSLNiwTRT1ok8LAKcRNcMR2y6aMlecfUXvm6oejYKRRnjIPdtOPrNRNbf31wmdT0xJh6P2AoUJ
	T8K73JjFhe4e3YjMlfRKh0WiYWv2gWKR6xGf0ytEM6blRFFu92dHzQG7YAf7cSbY9F5lIUbDzab
	JawhVTALnRtEi616+x3nqzedijHRRUgQjmzbpk7tYd78cmJ8d7SFZuCtPgLOETq2x/H3NWqH87H
	goUAxThOzKFAwiFuyWfYpi/kuM74Z2FhtizEyPaS+/yXv7Elab6B/Nu2TMktUUMiBBpohp4G7ZX
	TQSrtqx1VHYDBrrV6JieAl45eajIGXhcZpars/POWzX063+LG4x5KMbjUDCNSxu56qLSZQUuRsJ
	R86+JhjJe72ITDWQUTwyPLZo7mEaOq5wV3B0Me6I9q/UvM7YLUvI7XwUvMWxQLBpucjv8juPtJ6
	QdKNCtSSpCb72McIpdccVQQCtRKWfU8rKKevw6T6Q==
X-Received: by 2002:a17:90b:17cf:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-392ec33737amr923917a91.5.1786430047553;
        Mon, 10 Aug 2026 23:34:07 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.bl1-in.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d537d905sm2248330a91.14.2026.08.10.23.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:34:07 -0700 (PDT)
From: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
To: ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	cmllamas@google.com,
	gregkh@linuxfoundation.org,
	mkchauras@gmail.com,
	paul@paul-moore.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH V2] rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h
Date: Tue, 11 Aug 2026 12:03:45 +0530
Message-ID: <20260811063345.685884-1-mkchauras@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rust/uapi/uapi_helper.h was directly including <uapi/asm-generic/ioctl.h>
instead of the proper <uapi/linux/ioctl.h>.

On powerpc, <uapi/linux/ioctl.h> pulls in <uapi/asm/ioctl.h> first, which
defines _IOC_SIZEBITS, _IOC_DIRBITS, _IOC_NONE, and _IOC_WRITE with the
arch-specific values, before falling through to <asm-generic/ioctl.h>.
By bypassing that chain and including <asm-generic/ioctl.h> directly,
the arch-specific overrides never ran first, so when other headers in
the compilation later brought in the full arch-aware chain, Clang saw
those four macros being defined a second time and emitted:

clang diag: arch/powerpc/include/uapi/asm/ioctl.h:5:9: warning: '_IOC_SIZEBITS' macro redefined [-Wmacro-redefined]
clang diag: arch/powerpc/include/uapi/asm/ioctl.h:6:9: warning: '_IOC_DIRBITS' macro redefined [-Wmacro-redefined]
clang diag: arch/powerpc/include/uapi/asm/ioctl.h:8:9: warning: '_IOC_NONE' macro redefined [-Wmacro-redefined]
clang diag: arch/powerpc/include/uapi/asm/ioctl.h:10:9: warning: '_IOC_WRITE' macro redefined [-Wmacro-redefined]

Fix this by replacing the direct include of <uapi/asm-generic/ioctl.h>
with <uapi/linux/ioctl.h>, which is the correct arch-aware entry point
and already maintains the intended include order.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608050618.9dekfjtF-lkp@intel.com/
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
Applies on linux-next.
Change Log:

V1 -> V2:
 - Put the original warning instead of trimmed
 - Put the base repo after "---"
V1: https://lore.kernel.org/all/20260808032143.2767112-1-mkchauras@gmail.com/

 rust/uapi/uapi_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/uapi/uapi_helper.h b/rust/uapi/uapi_helper.h
index 86c7b6b284b0..489748ef642c 100644
--- a/rust/uapi/uapi_helper.h
+++ b/rust/uapi/uapi_helper.h
@@ -6,12 +6,12 @@
  * Sorted alphabetically.
  */
 
-#include <uapi/asm-generic/ioctl.h>
 #include <uapi/drm/drm.h>
 #include <uapi/drm/nova_drm.h>
 #include <uapi/drm/panthor_drm.h>
 #include <uapi/linux/android/binder.h>
 #include <uapi/linux/android/binder_netlink.h>
+#include <uapi/linux/ioctl.h>
 #include <uapi/linux/mdio.h>
 #include <uapi/linux/mii.h>
 #include <uapi/linux/ethtool.h>

base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
-- 
2.55.0

