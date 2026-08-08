Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6471C395D98
	for <llvm@lists.linux.dev>; Sat,  8 Aug 2026 03:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786159332; cv=none; b=JqnBYD4hgdwkfZKO+S8D7VYYVDDH69xvuloKImfo+Ym0VBScnHGXx0b28CSxr9FtQbw3kCnFk/uzGRhQvh1XwrY/3v4NZCuDkrivFqAu8PMo2ogYNpl/MYmoT/9kxqs0KzKuq6mXWuJgYs4t/t1ksolVUtzXvuiuXLJq80fwxwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786159332; c=relaxed/simple;
	bh=XY92FPm8CgMtwV9v50zUyh6AXSZ6A9wydtKKZtxj/oU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WFWeAU2G+UKyCAjRrvl5AkvxOVakV1d2oY3LIaH80uzqNwKrHZCWGktI9rBQJoFo3EeEWHVtZdtNs6/iseyBS3+noHvVJDo0fjmidJS8k7YzHjA3SD7X7hlakmYp0KCCkbig6mM+x44ygJceT4ECPxjuK8QkGO+Qk4pO6+Fy0l4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VypHY0vT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VypHY0vT"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e58034d05so134950a91.2
        for <llvm@lists.linux.dev>; Fri, 07 Aug 2026 20:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786159320; x=1786764120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mNXfsscFcsBx7GiXXV8Ydg8/2MbO5H0rQoaglQZ91nI=;
        b=VypHY0vTnP32f6d2PQE3/7u3EMwDec/AAxzProcOUaqfCw3kjmCUpeceASBupfFUtY
         64fP8vLIkJ5tJ1owCFQIXcGAr2hLJ9fgL0j1UG0j9SlFkTeyINwwwy7+v9z3ppkLkgcZ
         wPRAVaYlTDVmb5HHMX1uIERl0KnvLYoh5eQ5BwKWs7ZPOrhSVHHp9JKCJOrPgS2lQn2e
         p//ZFh8uU4WyYbDy40kucVOa0GhYh4aE4N6GZ1zE3Jjbq/nkMdiUjxGaqAdbos5ZWNW7
         9NNIpqy7fgWYgbjvlFSSMsNKzsO+YR89j6o0vD/9e/spAUZ3CU+MoAfw4Cl49GD44X/0
         kNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786159320; x=1786764120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mNXfsscFcsBx7GiXXV8Ydg8/2MbO5H0rQoaglQZ91nI=;
        b=NJch2Hmn/FJFouJnP1A75txx8DR2Mebfsc1T9zFOK38hWg8ksTW6aQ9U4RhqSgJKFe
         jAFypm0RMTp7X56Qt/QK4b2XKOyf3YLy0KYODBYKmgIXA4UH+Y5ClTPHmHVip+8NZD9L
         oY9t3SrKB2wEfCipe/ElRMMTU4WI21LkJ6JVxzRC/R1PQdf3x3qHBoml4HjfdNGP28qN
         FNp3zsbzTIoABW5B1PKbVjWU/rt6kb/IZleS740FXe53IYlsrjqQWK4a+l3ArOn6EdPP
         Bn1sRaifjcZq0FwEww755HYuPgGczQl7ajOzxHhYGkXKMhrttFq/wj/qiR6giemfWifW
         X63Q==
X-Forwarded-Encrypted: i=1; AHgh+RpuUA1WK6GQe97VfSWLAiq1/LtFNOf7Zu0xgC+1FpJqNqxz0s7bqyAiUcQhepUZg2tkkKrm@lists.linux.dev
X-Gm-Message-State: AOJu0YyyypMUaVvwg1LNDNlc6xtHDkp9ubvkkuQy7VvMXbjh2c+rbKfH
	D7yp/J47Btho0RkEtYrDOfZ8U7bAQR7jVRaEpDISLgn9Q78WCpzuO1aJ
X-Gm-Gg: AR+sD12auNPz89uSCM/e+Vwb+hIHifk3N+7j8Kj+lwbsNzW42BBf2hXMI4TehsdvJKv
	HJ3ffKIHPqVwAcY7o2UfYH3PBzZkslPwHSioXEFHCPg78vNPMT5bVhhy0y/vLom0pDc+PD3fXR+
	DFIS65U1cK6FNObCgJ0FTRIRGhh6ByDwwqCMHNAbeLz0G6dMBfrIXvbAo/Qva66cRDLFLW4f4Vk
	UKY+4e9wOPUAdpaCdwY72e/KjbmBaNA/x4gwJRri3zoaU/pwLI1pPzlaoTqGbxlzxwDnVtcOyUp
	EvjHsjIzeZH9v1ngT/4bALz6JF6dlucfWOGgQiwW9HsJAk5x06g5gkxRi6f+786CLgueqqyVl/j
	KouBpAtPeM2PTarlbUqEkbOxgkKIWG4jiDY1eLcjq746amr3fLCbh1EsWbslPPddmJjyhw80BgX
	V+LzeafmYv4PnpgPUhjAuZ9NxaNR7zRL+YklamkPss5/WqVt9mNmwa0DvflbSfN1zL+ZZ8pOCRN
	Yu9NQzy4GTC+ulztKwokdaIW5vdGMJzmYFVEIkprA==
X-Received: by 2002:a17:90b:264c:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3903c59936cmr29436120a91.8.1786159319550;
        Fri, 07 Aug 2026 20:21:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com.com ([106.51.166.106])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm13817468eec.16.2026.08.07.20.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 20:21:58 -0700 (PDT)
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
	wedsonaf@gmail.com,
	mattgilbride@google.com,
	boris.brezillon@collabora.com,
	robh@kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Cc: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include with linux/ioctl.h
Date: Sat,  8 Aug 2026 08:51:43 +0530
Message-ID: <20260808032143.2767112-1-mkchauras@gmail.com>
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

  uapi/asm-generic/ioctl.h: warning: '_IOC_SIZEBITS' macro redefined
  uapi/asm-generic/ioctl.h: warning: '_IOC_DIRBITS' macro redefined
  uapi/asm-generic/ioctl.h: warning: '_IOC_NONE' macro redefined
  uapi/asm-generic/ioctl.h: warning: '_IOC_WRITE' macro redefined

Fix this by replacing the direct include of <uapi/asm-generic/ioctl.h>
with <uapi/linux/ioctl.h>, which is the correct arch-aware entry point
and already maintains the intended include order.

Applies on linux-next.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608050618.9dekfjtF-lkp@intel.com/
Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
---
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
-- 
2.55.0

