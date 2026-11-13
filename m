Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588133;
	b=mWurRnMVhT//BJGF+JzHYRsOh8wF9Y62M3W5f/OfKeM1/tRlPNhxz7TDiqQihn5cLQd2
	 fhpU4N1aAMo8B7AOw46Cl5eKBhfeeTMxwRCpYTujQT873DyRws813xhzNsQCU7or2q+Ac
	 dRLB7IfkiZzA4c0+BaNOXx6/hlBNYsqndoDVR/KUtjBJ0FlXb/beMtL0QZtsIMNT4vIhz
	 fQZxLIlBpOmT60TB8aojsZtgjUDfBKfMIPVa0/gUwx3qq0/PcC5waGb8K0PD32nxeWg8V
	 VM5ccwvFwVOSOGLShNpHlOxcAJrs8iOpBEP4+ulfrshWm1oXnKmzKC1J7qS0bWZhxnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
	b=AdpFdZDZ/BDQ+gE/S/EOuRA927khP5RLwpqk+MLcL+YWOsHnIe8hOZYxu+Vewk9lnrIM
	 UeR3ZLB9AKFJkdcStG820HQQN5iI0F0QYHa1WyvSTfOuv4yFxdBlAV1p0KwOebhJsAOZ0
	 2eXM3MffptZfU1SExf6ZS4HjpvycMgF2yp8/HpKToeWLDFRGskGV0jsY0cUXZk9+krzFX
	 deGwsRjWiDxfBBEzVRbF8rHNIzfVkO38OtaNKFurirVQ0vByad6TU8Av0bxqwpGIxoM+q
	 fYlFZRgNipKS62WDrSgpRhJPnQyvrd44jCYo1LDk8RgQpJEHo5rWC4CJgcPz/4pJawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cRKpFvux;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B23F607CD53
	for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 16:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B23F607CD53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cRKpFvux
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab260600easo3302576b6e.1
        for <llvm@lists.linux.dev>; Fri, 13 Nov 2026 08:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794588132; x=1795192932; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=cRKpFvuxTyt3MSOtAMFpto54D7SK09pRtvmH51HT4SdHwGdY7mNGX8sQrUziWY2WNL
         tzActRZkoukAUisnFNE6Er84u3KdRntExyN8ctDPmAu/KY9eJws/btKQCH5hH5573+oB
         SFjCQazVUHtVs06bJbOgTO8pqibD58pS2BnGlal5MLwdSmWgcdin7+/I7J48rgaGEEqs
         9hg9agMlc0CHhLD5XTamb1hjpeCI608hx3MBOAscjmRI6w0GFZsKZpdNStJGBweX9+O5
         5rEFDT7LMoC9KbHshZaa8sOkpnw2577BZkOQyJg5apNhwfHIpAZtac3oiOluuS8WO3E3
         p5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794588132; x=1795192932;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gRNK11YgcY8cyMOB0/Yo8DNfUbiIMkO6zRKLCyKH5W0=;
        b=f8bhbqY/kW0u2ZgQTFpyJs+/N4LUtjMCyHSJmA5H2/WFuRaZLSkqrd3v8QGg2rg7iE
         mjqcVs5YDpjkaaEQznboRGo1+WRM2cVi/XS2IBpft8h6XfCLfayr8n7h8VhOb+GCDZEv
         mGAAHxRHA8E1osICUlb3gPsKkmBY0zkamfVcDV5z3iVP6adidd/PyKhGrolB0FWEaqW9
         gifcaERogbldkun64EKjcW3rggaDYxqPPsIG7d+8ZRc2rDKlC+hjRAE1OzqtqlZDLlPz
         MhWlR0qJ7jEVxcAv/kNw2ENJzWLMDwgfS4zr+VFA9w9Vvo+fMhXWvDX3TK7oZkV0S0U+
         U0dw==
X-Forwarded-Encrypted: i=1; AL+hErHQp3EqooQfbYvpET/uTEEJTuUH8ezz+aF1vOAAXrw6JOICitmKQa12XH5dm+rVRR8MkX56@lists.linux.dev
X-Gm-Message-State: APuU4Z8vivlXWw+kf44QVSC6nYSvG7bXZFEiPdAnU1LIgOBvy2PiLMUG
	lhEBprD4gZ/L4p0p0gM87/jG0mg/oJoWlMKvXXUbmnC5Tvcc69VyQk6LTWpsQKAwakPV71nJm5O
	qpflPB8R7ag==
X-Received: from oigo25.prod.google.com ([2002:a05:6808:8899:b0:4f4:cb57:f881])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:670c:b0:532:6c52:9778
 with SMTP id 5614622812f47-56e6520fd22mr1905058b6e.20.1794588131968; Fri, 13
 Nov 2026 08:42:11 -0800 (PST)
Date: Fri, 13 Nov 2026 08:41:37 -0800
In-Reply-To: <20261113164152.2095566-1-irogers@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261113164152.2095566-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261113164152.2095566-7-irogers@google.com>
Subject: [PATCH v13 06/21] perf comm: Add __guarded_by annotations to struct comm_strs
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, acme@kernel.org, namhyung@kernel.org
Cc: adrian.hunter@intel.com, bvanassche@acm.org, elver@google.com, 
	james.clark@linaro.org, jolsa@kernel.org, justinstitt@google.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev, mingo@redhat.com, morbo@google.com, nathan@kernel.org, 
	ndesaulniers@google.com, peterz@infradead.org
Content-Type: text/plain; charset="UTF-8"

Annotate strs, num_strs, and capacity in struct comm_strs with
__guarded_by(&lock) and __pt_guarded_by(&lock) so Clang verifies all
accesses hold comm_strs->lock.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/comm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
index 6343a3c9debe..9fc4e91a36e9 100644
--- a/tools/perf/util/comm.c
+++ b/tools/perf/util/comm.c
@@ -16,9 +16,9 @@ DECLARE_RC_STRUCT(comm_str) {
 
 static struct comm_strs {
 	struct rw_semaphore lock;
-	struct comm_str **strs;
-	int num_strs;
-	int capacity;
+	struct comm_str **strs __pt_guarded_by(&lock) __guarded_by(&lock);
+	int num_strs __guarded_by(&lock);
+	int capacity __guarded_by(&lock);
 } _comm_strs;
 
 static void comm_strs__remove_if_last(struct comm_str *cs);
-- 
2.56.1.703.gf848ed807c-goog

