Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B2E192D8A
	for <llvm@lists.linux.dev>; Mon, 28 Jul 2025 21:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753736675; cv=none; b=aDlOwnGR+RoHaco9H9PYjWbmNh3wYVIhMUfZhWlS126tWQ9cKHrmfpIf7rYRJaUl/Z9iuDiVo7h2sLNwp5A+WjYDI6x5UgbM5gUPGIaTFNx6HwqtWT3pD5N0tmVZcAUZ/rzO1x8YrFPthk5LK7A4dZlJc7ErZC96qTFjBzfPp5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753736675; c=relaxed/simple;
	bh=zFb2Oa6g6C1AFnPxXLdZtpXeNv9w6hxscbJigmNdpCg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mTGWtqOpJ4jDXqq90wnV0QJXN5Nt/XXBaAjcPNbW1ZTFTgiMJHMdkogyl9uRSsw8fB9W76KLzrHFN341pGByKUxaynXk1GEhXG2+q9WeEfdCXwShXcBH62RfcXtSDrC2EeflTfta1afRl3HR5Yby3Y1Pm7jErYkQ7OpgG0er9QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dfQcllEC; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dfQcllEC"
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-3ddba1b53e8so54639775ab.1
        for <llvm@lists.linux.dev>; Mon, 28 Jul 2025 14:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753736673; x=1754341473; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=g2HkGuPdjC+GNCrApZe3pzlcGnX64te3qygbh3oqdwo=;
        b=dfQcllECwYwoV6dCRIvuKfoWowiqufAubNHPBVg+7jbkCRsl8ePkkq3vPB0l5UpxNa
         LLE8p4FmygDMHPFKmROtg/qEdIufOCBb6tkZc81oeiBES2U+EKv3k2PDbnVUNcnBy5Qk
         q9gsuiI7+Ljhsdhamiu8Tu4E11xM8PWtd6zcMoYEAPZ/b3RPAHpGU9zPt1sqLdaZq0YT
         ScgcI2h6gBdxOj3cFGhqGI4Y8uIJ4Nia3omvKMaqKjjx6+fhfWdGvcdd9HzAJSTMNYRU
         8sg97cUY1ACdsHXWBiRmJ9wZPn+MghinXVx2cOVe8PBaddyQSRjuRA8X+cbZGwyzJYKC
         5fOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753736673; x=1754341473;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2HkGuPdjC+GNCrApZe3pzlcGnX64te3qygbh3oqdwo=;
        b=TmNjRFLWAXD8yzWi1sS5ENefs9cOv20Y9e/0I0q7zznsrdQjMETnAsVz3XbY5rWZ3Q
         fP7LWgwePHrjkA3+aEiaHSRvWnhtJck58hKs6VHAXa5jgDzlUrn0WrlyB7ZvRUuU1G6e
         cIds7WHiC5IQkpH//HMHh3qWQ17xHvbX49GWT4GZLsZHiJaVZLK6VuWXYzPSRlTQCQvu
         lcTSyS2eAg3slG0Yythjyw0OXIW4Z1cbDAoKX1rvXgkgzNz2d//q2VDbBab41g0nNkHu
         R5XEV8CTn9wFoS0nkjC9qhBDvu42oi/TtLd9Mx9r0crbWf/dghz334Skx2BQFUkUZxxo
         Uh9A==
X-Forwarded-Encrypted: i=1; AJvYcCXP1GSb9VsJTuhh+uajw6rvcllBmzWMu8xvmDItZTliqUtFipJYqWk3xbo3KWnKTmgh0Rbx@lists.linux.dev
X-Gm-Message-State: AOJu0Yzwpe6gQWLup5QCh1CKNMadcdKrBgoqzn9PwxV5sYA1GUPPiDl6
	+/p7zZ4HDCkoSZ/50iJG97+ytU1uQACUBc32zbbrZFKg1F46We4XgW8IzKHxuysSpMj+gGGMTWF
	m35UGskJqnZlaK0/MH40aSrfh7A==
X-Google-Smtp-Source: AGHT+IF3ElRNmNEgLOiZ+XFI0ik5ZaJq9q7/NhwGFbXXUTCuR7C+nhEBtW4V6iPFUdR2A3KToowq+hl+CNEjc4UEBw==
X-Received: from ilbbu29.prod.google.com ([2002:a05:6e02:351d:b0:3df:2bc3:4c40])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:19ce:b0:3df:3bc5:bac1 with SMTP id e9e14a558f8ab-3e3c5250ebdmr229349785ab.5.1753736673097;
 Mon, 28 Jul 2025 14:04:33 -0700 (PDT)
Date: Mon, 28 Jul 2025 14:04:24 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANflh2gC/x2NSQ7CMAwAv1L5jKskELavoB6yuGAJmcoJFFT17
 0Q9jeYys0AhZSpw7RZQ+nDhlzSxuw7SI8idkHNzcMZ5c3JnjAcsNcQnYeay8S0sXHGqinNQQY/ WYzLpkuM+j84cocUmpZG/2+gGvre+/8Gwrn8ZZ8nEgAAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753736672; l=1896;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=zFb2Oa6g6C1AFnPxXLdZtpXeNv9w6hxscbJigmNdpCg=; b=HH73qpE/zdS+HCUqoI7QlwguMOVUWIcr2Ny2CgnzuAwg/gvWWMVd4GqIurLvfypFGt3lDRlob
 13Mch8agVrpDeZ9Y0oMMvccLNTHA6rhTzU/w5faraqws/Vx98Q7G6j3
X-Mailer: b4 0.12.3
Message-ID: <20250728-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-e373a895b9c5@google.com>
Subject: [PATCH 5.15.y] KVM: arm64: sys_regs: disable -Wuninitialized-const-pointer
 warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Christopher Covington <cov@codeaurora.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

A new warning in Clang 22 [1] complains that @clidr passed to
get_clidr_el1() is an uninitialized const pointer. get_clidr_el1()
doesn't really care since it casts away the const-ness anyways -- it is
a false positive.

|  ../arch/arm64/kvm/sys_regs.c:2838:23: warning: variable 'clidr' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
|   2838 |         get_clidr_el1(NULL, &clidr); /* Ugly... */
|        |                              ^~~~~

Disable this warning for sys_regs.o with an iron fist as it doesn't make
sense to waste maintainer's time or potentially break builds by
backporting large changelists from 6.2+.

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration").

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
I'm sending a similar patch for 6.1.
---
 arch/arm64/kvm/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index 989bb5dad2c8..109cca425d3e 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -25,3 +25,6 @@ kvm-y := $(KVM)/kvm_main.o $(KVM)/coalesced_mmio.o $(KVM)/eventfd.o \
 	 vgic/vgic-its.o vgic/vgic-debug.o
 
 kvm-$(CONFIG_HW_PERF_EVENTS)  += pmu-emul.o
+
+# Work around a false positive Clang 22 -Wuninitialized-const-pointer warning
+CFLAGS_sys_regs.o := $(call cc-disable-warning, uninitialized-const-pointer)

---
base-commit: 8bb7eca972ad531c9b149c0a51ab43a417385813
change-id: 20250728-b4-stable-disable-uninit-ptr-warn-5-15-c0c9db3df206

Best regards,
--
Justin Stitt <justinstitt@google.com>

