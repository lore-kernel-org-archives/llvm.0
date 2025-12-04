Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A770E3090F7
	for <llvm@lists.linux.dev>; Thu,  4 Dec 2025 20:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764881095; cv=none; b=E1SvLjCUUoy+ywG+XzGWMhBAaToJgP1d89FfxY4Dhd7Y+wdvoNFJ1w7yaFOQRaaKy3d/GadGqCtv9orAxquBqM41V6KwpAiOfudO+udGqrY9Xr92//jmDyJkNkg3/oKfoHTmyYi8TaVtoOxPnULNsI5+RpyhHpKKFkd/N+1K4zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764881095; c=relaxed/simple;
	bh=DkT4IoaqkNBfsju7O9/ZY5rQLx27/V6FGQJUG42Mup8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=EAYb3rqtRV1EgY8Q2W+L9M3JmSebnH/nqW+Llm2+WfZ8e75rA3Y9qY1EslegU/HLLF7PMyFGs5+ra3K9PquqOzWCYwGCKlinqab02WhF5e1x0kKUBky1BiXdbBwZjdmyKmU+S/+BCmnKXQ5KvXci6Y3yjgvb9lZrwH/quucheUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XBfHAvAN; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XBfHAvAN"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-7c7593b5c93so2135335a34.3
        for <llvm@lists.linux.dev>; Thu, 04 Dec 2025 12:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764881093; x=1765485893; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5OBbaGawSd3zuwB2zG94CYQFa0ZhdmCDQUS3f4NQYYI=;
        b=XBfHAvANoPJR6rbqYZgj/4wB+XIvR8mFu8I5quzqg1gY+xIRQZFrRpOKl8D3QrLWPG
         55zYNbxFmFRlOaKyD+YJ4O0fjdEJ1nc000wMl9UpOwzgzy4qH3wUONgq8Q5zOFp6vJhE
         caOEYvt7we6yRrGcMoLkmDcWcF6+yH9+UTIZ18eu+weMlRFUvKxRqbx/g9+VkA3qqa1Y
         q7om4KKKTkSlDSqR/IkgIYO0JsWVVeDwg0nTH0eKbGsdMGhX/slJ5c8HW908aebaJNpO
         46eofTkd73uVMmPS1DaYyxybwoHaPBgTm6gghrseiP3Mnlgx89vhG5AhFY0dCdmJzzZv
         LvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764881093; x=1765485893;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OBbaGawSd3zuwB2zG94CYQFa0ZhdmCDQUS3f4NQYYI=;
        b=Z9xB+2LshceWsvkH4xVmQyfoFx6iAXkSNFoT6Bupbd+xANbpjCsBi46pwmMUUCpLHM
         T9bwr8zCkpCdNuGWp1qZ6kLDxz8VePFM5gJfmpK7LXGLS70UCklZUKRq2SyzoMroVlrC
         NadsgRYYsboAtaMVAe0z5oBQ0FN7ehAP16PsYlidrN7trM2DYXMxirepJaRUYkoHVsKz
         Ol3iLsPpVMEmz+LRqnpiNf4/bpe+f7eaQy9hO+7k4VFuVoZIrW3nY4vKnWs2l4IZib9t
         2lIisar2Hm0zLaaiEZBYwxuH/ICVMSQNSvYdgqzgCJBXEK9FbMvFzbwWd7uKBhvBo35p
         GsRA==
X-Forwarded-Encrypted: i=1; AJvYcCXZwgGYXYiYY58MKnz3loaZLlLRIbZBJiidkNERdCHOvxEZa+SI/4aMA6DzQ7+Pry2zJk1C@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbgf9jjKo5fDvtDJ5Z2YsYBBixhac3cYlrST7mTPI9q4+PC/KS
	AXV2tNC8G8bLoo3Tyg2yj/1EzJIDYWzIa/2yT0K2hpNISFoMVNi67d1Vo/snL7PLlPNmMgcwLfo
	Yr7KQFrRoXQ2MPNUi954fhVfEZQ==
X-Google-Smtp-Source: AGHT+IEcuhqU1li6sdaSW37CrgBCboSMB9naa4c5cngUNGLEZx1liCv6AqNlZif0YU6QUfNpDohXjlMOknbgvyUj2g==
X-Received: from otbep14.prod.google.com ([2002:a05:6830:6d8e:b0:7c7:9b8a:684b])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6830:410e:b0:7c7:8922:ef7c with SMTP id 46e09a7af769-7c94da26dc6mr5006480a34.4.1764881092785;
 Thu, 04 Dec 2025 12:44:52 -0800 (PST)
Date: Thu, 04 Dec 2025 12:44:48 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAL/yMWkC/5VOvQ6CMBh8FfLNfqQFK+DkIKuDjoaBlgpfgi1pK
 0oI7y7yBk73k8vdzeC1I+3hGM3g9EierFkF30Wgutq0GqlZNSQsESxLcpR79KGWvcaG/IYvQ4Y
 CDsHhu3YGBXKBiqmikWnzSNgB1rLB6Qd9tqE7iJiLePrZ1/JWXs5QrbQjH6ybticj33L/jo4cO eo0S+u8ELJQ4tRa2/Y6VvYJ1bIsX0FW+wDvAAAA
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764881091; l=2150;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=DkT4IoaqkNBfsju7O9/ZY5rQLx27/V6FGQJUG42Mup8=; b=MQ7J60MWDpuY5nepRRb7zNtHXX4bLPtT6AZPE1FKfLerM+41qAbUKMX5CNiL5AZEagtry6KBj
 gOL5zL1DMZTDVJPugwXeHn5WjWgPy/8e2W2HlNAaRr3yziNifi7kXGj
X-Mailer: b4 0.12.3
Message-ID: <20251204-b4-stable-disable-uninit-ptr-warn-5-15-v1-1-41212e2c6409@google.com>
Subject: [PATCH 5.15.y RESEND] KVM: arm64: sys_regs: disable
 -Wuninitialized-const-pointer warning
From: Justin Stitt <justinstitt@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Christopher Covington <cov@codeaurora.org>
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

This patch isn't needed for anything past 6.1 as this code section was
reworked in Commit 7af0c2534f4c ("KVM: arm64: Normalize cache
configuration"). Since there is no upstream equivalent, this patch just
needs to be applied to 5.15.

Disable this warning for sys_regs.o with an iron fist as it doesn't make
sense to waste maintainer's time or potentially break builds by
backporting large changelists from 6.2+.

Cc: stable@vger.kernel.org
Fixes: 7c8c5e6a9101e ("arm64: KVM: system register handling")
Link: https://github.com/llvm/llvm-project/commit/00dacf8c22f065cb52efb14cd091d441f19b319e [1]
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Resending this with Nathan's RB tag, an updated commit log and better
recipients from checkpatch.pl.

I'm also sending a similar patch resend for 6.1.
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

