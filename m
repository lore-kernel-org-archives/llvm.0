Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795202513;
	b=RWb8LSOAzPmDst/itPQlEDTShPAEHEkjyybKeAn065DY0QvyoaKZCfBYRAkYTxeGEkrb
	 IoS41vJb+bsraVljSdlRCJbKSOkXChVZ2+UDlkPcEVo5oW6tIjZfdWbSOh0PjwkeRqUEU
	 /Yl23o10CuL1Mu2giN/NVqk+Ba9ARJQT5bZLGKjtfbhBTsSY/q0HOfUMlB4aUTyLC5iSg
	 G1aPs5jEBJ6SHbVgAaCvam0nXxRnuoRRg/xAxj3gHE28C11XD8nkw7FaYN3Gr5XwjeZ3Y
	 U2cpbXT/u+0TPKkSepUaonbaeC0Kio5/IdBCxP42NPgbKTldrKSabqBSL5sC9CYTt9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=DNVNmDF5dVzvlnQ4zjX9N+gfP3FXX+TLZ7yfkqU1zlQ=;
	b=boBcQPAfmAjdasEbV1ueywxGb6o0/Vn4RvVA7u5tb4QmHRqhJejIbwk56dSuTyuBC61q
	 1OxWIBQ2E3qSy5lIjzjP/7IrAhOic31pLhOXsYLpaoTtLn8YburfEg9jhnTT7TUyZAmVa
	 5LMOPzw5Ed0pN3/4/qilWXk6df7exyARAz/NepMXRo1dwkpsYGb4E6r5EDkwQoUh2j+Kg
	 mbBEIwyXoj3As4m3gXe01wxOHljbHmM7oQ5TTLgUP5tpBj3jM5BNuz1tg4m1VsQiKBhuC
	 ua+ZSnI18/s2LhYoc0oqOfpLlU60Mz31e02WA7JvPMpWZXzT7R0WOeA5KHvzJ/EX97w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DBljP7yT;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A16E606A6FC
	for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 19:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A16E606A6FC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=DBljP7yT
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3846d5f54c1so1568069eec.1
        for <llvm@lists.linux.dev>; Fri, 20 Nov 2026 11:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795202507; x=1795807307; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DNVNmDF5dVzvlnQ4zjX9N+gfP3FXX+TLZ7yfkqU1zlQ=;
        b=DBljP7yTVqxCbgZgwWq5nEg+LN13+9T3CeEZ3A4c3rZC5UeGua8hRlH+Op0kxquR6h
         WR8/+GePbqd76E9GFcGb4VIeom8iftQDKbpUweO7eDu1Rbsj2vh04RolSrLD/cgvEas7
         SpWOSXkZ+Z2KWwStQQcSYa5v6KVYltgXyv7X8Xlgo0KRiQev0WsueYQuQz1Os06W8yhG
         CoDFYeF4KVzwsskVLt9i3hWdgYKYRQWhTityQC13Op0rSQuGd+9esvBPYLHb7EmEU7Ne
         B2Nbdp/FZZaTvUY6Cdh76vqzR1Dg95CseGu6PDx8dEdlTLsQc8FB7ffq0JVP0YpJnGfq
         Og9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202507; x=1795807307;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DNVNmDF5dVzvlnQ4zjX9N+gfP3FXX+TLZ7yfkqU1zlQ=;
        b=kzCwJed3UjkAqHtegk7j0RvC1YITeR25hdEHf0kgD5yEKOHX/sitEC+pxeo8aKKSOr
         e7ATisIxz6IvqEM8R04cBskKMEyLKq8kSaZMPVGlgMt9RC88mZxQUtSOywcYZLkzduqp
         Ly0v79Zor57LvBXBw1iJQxSyn+PQrB5GCRU7MlThh24XLxcPW+T/zH+z3cINRYcCpEMn
         Csj6xGfO8tu8CPfba4KrKkq8OUvp+8stBnVyjAvCsbEHGxVDXNa4Z8w49HgloZ0QBnKo
         K1aBGusq7h0Ga2L0hkCm15tc32Cat7P8j4t6/IoDObZudKj3Q7SHCG/7yNM79H8T8pet
         p0fw==
X-Forwarded-Encrypted: i=1; AL+hErFT6y5+vOHRvtIlijdVeXreLDS8S/xqCHpomuXqgxsLXo44rVMpxaaLCpeNlJjFfzrMH6VR@lists.linux.dev
X-Gm-Message-State: APuU4Z+cqi/LrDVDj9lanhZWGKhU/xalqDRH+dDjYp6xbhm/VRJUqFr0
	EoD8NJAh+qfU/ILyUZ3cdhBZLZDjXjVZRdSDczcHT7NN8vEjOmxwz6WGtkZP8iGOaxo9C/ZXVHx
	9pQ==
X-Received: from dycqw15-n1.prod.google.com ([2002:a05:7300:c00f:10b0:36f:5688:8a11])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:ff48:b0:385:3595:5e87
 with SMTP id 5a478bee46e88-3856fd5b5damr3386093eec.16.1795202506690; Fri, 20
 Nov 2026 11:21:46 -0800 (PST)
Date: Fri, 20 Nov 2026 19:20:50 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120192050.2868566-1-elkin@google.com>
Subject: [PATCH] drm/xe: clear backup ERR_PTR before retrying in xe_bo_evict_pinned()
From: Elkin Cruz <elkin@google.com>
To: Matthew Brost <matthew.brost@intel.com>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com, 
	Elkin Cruz <elkin@google.com>
Content-Type: text/plain; charset="UTF-8"

In xe_bo_evict_pinned(), backup is initialized to bo->backup_obj (NULL)
outside xe_validation_guard(). When xe_bo_init_locked() returns an
ERR_PTR on lock contention (-EDEADLK) or OOM (-ENOMEM),
drm_exec_retry_on_contention(&exec) or
xe_validation_retry_on_oom(&ctx, &ret) restarts the loop while backup
still holds the ERR_PTR. On the retried iteration, "if (!backup)" is
false, passing the ERR_PTR directly to xe_bo_evict_pinned_copy().

Extract ret = PTR_ERR(backup) and reset backup to NULL before
retrying.

Fixes: 844150c255c9 ("drm/xe: Convert pinned suspend eviction for exhaustive eviction")
Signed-off-by: Elkin Cruz <elkin@google.com>
---
I am trying out a new Clang static analysis linter for ERR_PTR/NULL
handling, and it flagged this code as possibly buggy. The findings were triaged
and fixed with an AI coding assistant, then checked against linux-next (not
runtime-tested on hardware).

Thanks,
Elkin

 drivers/gpu/drm/xe/xe_bo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index 353ac1e9a9d6..ae6fd20304ce 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1680,8 +1680,9 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
 						   XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
 						   XE_BO_FLAG_PINNED, NULL, &exec);
 			if (IS_ERR(backup)) {
-				drm_exec_retry_on_contention(&exec);
 				ret = PTR_ERR(backup);
+				backup = NULL;
+				drm_exec_retry_on_contention(&exec);
 				xe_validation_retry_on_oom(&ctx, &ret);
 				break;
 			}
-- 
2.56.1.750.gf70dc682cf-goog

