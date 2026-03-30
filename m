Received: from mail-dy1-f202.google.com (mail-dy1-f202.google.com [74.125.82.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2603DB62D
	for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891169; cv=none; b=fPUnqUKXDrA9HUTN/e3ZYZNAwexe7lmD8DDX6iSmhkVeRq/JScpnAtNVXfNYeRLsCMctiyOaKnw7G4fNoRepBjHF/hRxznvvdMHEZvfen+X2tm4IH4I98AIFXm/nR7C0lDXMR/5mGgkOi4PqSkF5fufpEh2LoXxWSGb2ea9QKGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891169; c=relaxed/simple;
	bh=1dn6wx0kE3uz2URoABPgvTVUTzuMBnxMjei6SlfoEfk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GdrB7Ung7xtla8DNxN+Pn2EG+mauMgEpCQvPNsIWB8BeswHZt9MMc3vArP0XgFPk4JiMzVvEwPCJtqdGQJEaEQQ0gcYi4a+dESOPpVR0ylXhntF96o07nT51lJVk6DcR4Z05RedbQN4inipPW2bUzV16SKBHCqMVcVs1MwOGsNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b12PL2YL; arc=none smtp.client-ip=74.125.82.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b12PL2YL"
Received: by mail-dy1-f202.google.com with SMTP id 5a478bee46e88-2c7130f88e3so4665582eec.0
        for <llvm@lists.linux.dev>; Mon, 30 Mar 2026 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774891168; x=1775495968; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=b12PL2YLDI+E4Lmu0j3pBJqskktYf3aG7qQUPLF4tnHRQuySoIpslmye3qtG3FHUel
         lNgfB6GR3bJ8whqcGaPm3at9LwT/m/WOtwFrEA8sbNesNOQS/OA1hzKrO8r5zCMTKDnp
         8yp3ug8n19yOl/o0F2+aIw2DN5TwOJfW3+mRipEzkdCkqA9ul1o/psAdcKiI3ap/i0TW
         3taL+JGO3XYRmNsaTIb7EbREfV4Yh5OIA/hhu+Rhct7gZhoRCXXUwPY+V+Z37kxkXaL5
         2vxz+2OP68URzBH4pU5h24L1UJD2V3w7CvuMVHzCWIqszzo8WT+R8gb1vbMC+0J0wtIZ
         OTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891168; x=1775495968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVbuFhtmsLe2EwKEnKkn8YIdx3PwrexQLmQHP24bifI=;
        b=Rs3TtIyhhiTgpAjCmkwTCx46jczpU1bOtdvslOscWs9PISYq9Cl8DOdfnXPCi4R6aR
         ArSALyQTmOUgQCRyy8nfleWAEL51bVThyNCC58N8oa3jTLBWCmcxt1LoSVonQsYR2ui/
         DD8gmWSG8eSPID9P8v37gcCa66btw3SrD6ww04tyc/vKv8WSS/SLu9XlZdnpPn+nL05j
         WEThFfzlNp70LtHA6edLec8iMad3nHC4FDr+jyzdoQdtr3/xrbV1/CbVGkzsO42BDVb1
         WV05puvbs4TUq3CWJmDX3SaPMU3sSzeBCLQoROaVx+xfUqV6swvOEiPWPHj96Y5fzHeo
         q8fA==
X-Forwarded-Encrypted: i=1; AJvYcCVuwOJXHGLK02Kzs9OdWuB8YAG6Kd5czoGyxz3E9hMxQx/GMCj5HEyrE39jxcqt2llOdpsr@lists.linux.dev
X-Gm-Message-State: AOJu0YwfWfA8jdNqSyuyZkr8rNnqQsNeg4/bsCUXTogTX4OnzEAY5Xk1
	604u4EoK7pI+nIZCEK1MpKt39CqM2pjG3So+UMot15htmB1BKD8tUxb6zUGAipsfDdfjQg==
X-Received: from dycna11.prod.google.com ([2002:a05:7300:ea8b:b0:2c5:bc3b:f9c2])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:bc0c:b0:2c6:31f0:a018
 with SMTP id 5a478bee46e88-2c631f0b30dmr2722363eec.22.1774891167324; Mon, 30
 Mar 2026 10:19:27 -0700 (PDT)
Date: Mon, 30 Mar 2026 17:19:18 +0000
In-Reply-To: <20260330171920.2026779-1-xur@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260330171920.2026779-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260330171920.2026779-3-xur@google.com>
Subject: [PATCH v8 2/3] kbuild: change --thin back to 'T' in $(AR)
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Yonghong Song <yonghong.song@linux.dev>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

The '-T' flag in $(AR) is no longer problematic since the minimum
requirement for LLVM has been updated to version 15. As of LLVM 14
and onward, the '-T' flag functions identically to the '--thin' flag.

Fixed the issue seen on IBM Power11 System:
  ar: unrecognized option '--thin'

Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Closes: https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82d@linux.ibm.com/
Signed-off-by: Rong Xu <xur@google.com>
---
 scripts/Makefile.vmlinux_a | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index 9774f02b43b2..650d44330d1f 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -10,12 +10,12 @@ include $(srctree)/scripts/Makefile.lib
 # Link of built-in-fixup.a
 # ---------------------------------------------------------------------------
 
-# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
 quiet_cmd_ar_builtin_fixup = AR      $@
       cmd_ar_builtin_fixup = \
 	rm -f $@; \
-	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-- 
2.53.0.1018.g2bb0e51243-goog

