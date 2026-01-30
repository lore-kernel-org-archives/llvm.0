Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508053019A4
	for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769779810; cv=none; b=gIKdahEgyOdmvqTbhOrl3Cr+vLjGKNmXWsXbjSrOarNSsxxA8YOJm4NeEpfHY9nWUPXeCkCK5Qy5BwaXwD/cy+AiYPx6lkjNhKAr2EnILkQtC3lAo/vkuCTt3njQHD3Wtw9Hh7EI+xUZVYA3xdH/sVXozE0vGERat5QKSLTtVhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769779810; c=relaxed/simple;
	bh=26nK5ZuTSH07Hc66Z0TGP4MV/KjUVkYvGOV4qaYkpHE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZDrlSpcsU+WeMM64tdTF5gaVK9/RpXzVTlCXl1DPc012MusZXQ3FOsG/qMW4MkhKcL9+kjDuzohCUaW+uTH/ebyRAiNCFengJ12unhot0d4JJzzjneI9B7BGpYA/r3E3Jxrt0/lDNhskfs+JYslvswXfipGpQF0/oS1rLxgg984=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--elver.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZCe7Mxoe; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elver.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZCe7Mxoe"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-480711d09f1so34381565e9.0
        for <llvm@lists.linux.dev>; Fri, 30 Jan 2026 05:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769779808; x=1770384608; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ah0eS4SkK+p5W7jb3OOf6k8LtqY2IjJqo0gqvKUDvkY=;
        b=ZCe7MxoeH5/cvP0AtkLXSlrWoXDLld3CmZpdowXp95dCYRfUutZINo3PUTzAC1vRVb
         3oh+cJ3EIPiSq1NmD2x+4gTi7zn/a5BnpYcGFxrOqvciQP9xEvFLfDfS3YzY9OYpNl+N
         76KmzHrWt/JxS6juGd5CqzGFxwPmUAk3DxvgOy4OgMzV0DajC94BYxj0140fdGTEEhrH
         pYgdncTw70jssTU68Dds5tW4RgSk/acQ5uIRDsS52nGQmZxeHTzKE1D9BCUMNwH/DUg0
         DY1ZOwx9O9PhjYKX4rjjoQWvJRNUDWEJC3FSqbRqacI49Ll7DZWq+mBuu4xKBo7PRhFe
         L73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769779808; x=1770384608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ah0eS4SkK+p5W7jb3OOf6k8LtqY2IjJqo0gqvKUDvkY=;
        b=Oa30EQ+PnxcGhAmR1oufUJ+FA40wJb3Zupt63zF/AgrU0QIiYFijakVKFeZQ5C4kIZ
         fGIKm5gli5+21FTHPpB098UOui3UE8BA+uTopJ7gE7EpRjkaN27JHo3VRExvHV1AtGrc
         BffNFGM1sj4iW+mqIPI9mgbI2my65UXTkKW6uo/Cq7ogDocAfw9V3Qx5EPOsIiDF8+jl
         TYbE/TEQKEdQ1Oq1HG6RpaX4mM8CsELSOUUwK54OIMzDq94yHHbn0jDUqbt3DJzoKvU+
         ztPvRm0X+aWy9yJMnPPmEEJfQ/wQkNdNLeOYqYyEA/yLCqbUWBYz6WyDFJICFDpoWwLR
         c0DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEuxc/QjE5PNduJsJqsAbbIQ45ocbOdnj4AsMAVYAAR6/ABb4RfVdo8Zz8ExeHXr4+P0rV@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/LVSJZi9SmSFJ3xDDnnxII1QZepe8QHB39X6MRspPGpirOkyC
	UjTmsrWHLpqdQHnDgo7/egxe6aDDGKPo2NylLptgQ10vaXvGpDSy/iIq8NntCvwPdgq+JQIP7Fc
	yyg==
X-Received: from wmby7.prod.google.com ([2002:a05:600c:c047:b0:477:a678:a39a])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3b1d:b0:477:9cdb:e32e
 with SMTP id 5b1f17b1804b1-482db46014dmr37732115e9.9.1769779807742; Fri, 30
 Jan 2026 05:30:07 -0800 (PST)
Date: Fri, 30 Jan 2026 14:28:24 +0100
In-Reply-To: <20260130132951.2714396-1-elver@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260130132951.2714396-2-elver@google.com>
Subject: [PATCH v3 1/3] arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	David Laight <david.laight.linux@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"

The implementation of __READ_ONCE() under CONFIG_LTO=y incorrectly
qualified the fallback "once" access for types larger than 8 bytes,
which are not atomic but should still happen "once" and suppress common
compiler optimizations.

The cast `volatile typeof(__x)` applied the volatile qualifier to the
pointer type itself rather than the pointee. This created a volatile
pointer to a non-volatile type, which violated __READ_ONCE() semantics.

Fix this by casting to `volatile typeof(*__x) *`.

With a defconfig + LTO + debug options build, we see the following
functions to be affected:

	xen_manage_runstate_time (884 -> 944 bytes)
	xen_steal_clock (248 -> 340 bytes)
	  ^-- use __READ_ONCE() to load vcpu_runstate_info structs

Fixes: e35123d83ee3 ("arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y")
Cc: <stable@vger.kernel.org>
Reviewed-by: Boqun Feng <boqun@kernel.org>
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm64/include/asm/rwonce.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cd..fc0fb42b0b64 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -58,7 +58,7 @@
 	default:							\
 		atomic = 0;						\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(*__x) *)__x);\
 })
 
 #endif	/* !BUILD_VDSO */
-- 
2.53.0.rc1.225.gd81095ad13-goog

