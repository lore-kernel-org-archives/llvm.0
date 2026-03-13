Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62E23D3CF7
	for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 17:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773424331; cv=none; b=pv8pYANhb5YiWeoGXlvt9H4GT4TL53tR5nNCXBjy81/GrClPLeHEo0mZDuZ8dhFTnI6xLurKaKI2BgzAktldaIraVFP0k01aJGsXWkWnH1/3orViMPgmnlRLJnIHxhsA6FKLKMtUlfqp+TA9QGDmgp7vvKzmnLQ3SQCIwZlUsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773424331; c=relaxed/simple;
	bh=vfrRQR+JpQYLSHtZyqbjbuFN1gFOZoHwi5oXGFGrSRw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jNs8oUQvaDcbRD4N7eYE0D7z276htN8aoBA9TpMhuS0lV+SryXHXdNY8KJisWhTjKyVBcTERp02fDlzen8MOg+gGvmjOxAlOlPOwwvv2WI9UVCMUzIfQah6W6DU/NtE27EgFQR+z2LqBjbM7D8+RdG47yu1Cq2RUd9A0nTYKfG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLkuDNwY; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tjmercier.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLkuDNwY"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-829b7ed8964so2519983b3a.2
        for <llvm@lists.linux.dev>; Fri, 13 Mar 2026 10:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773424327; x=1774029127; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4NBAuTsPtZw2mEjZqDawFjkhVE0UFfzabotF/tS63ZE=;
        b=bLkuDNwYyOYWEATN2I344R/x9Gfu4lOKGmcdKY9PEfH5SSkFGUNeYyIoHtneITJ9hN
         qS20/12IciqxwD2jYHJDvaSDy9mPfNQ0r7OY1tO8KymeswYC+cB/MPX4w+eIFvrt00NL
         fExTsl1A4NXwA0B/t5OLM/JtP0nn3BB9qcbij7cHw+si/2GDD2I8qeolFCxOsnu7wQqY
         UrMRnmOpQGLrIpTGZwgaxr+WAnP870Q86gDFFSGX4agjE0avDXTqIZP5/ZgDmNss7OM/
         IimMa2E/ttCDR8N5JAblaaPzzTMxGUcx8TBG9Qr4WNHagUrAYBNtHSLfFoNgmYIG0Qio
         UF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773424327; x=1774029127;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NBAuTsPtZw2mEjZqDawFjkhVE0UFfzabotF/tS63ZE=;
        b=Xh2AFXOvDYqtGp2ZqR1mi1nFDe5pgH0IyJiwnUzxe6AXFk5z2cX65ZKQIBtSbV74vl
         3dnjhbsPpKm7gg9ac9tFdqRHMxytrwEQLoLo/Hf2n9xTls8MOy/4ILPHC46Bb8PGtEgp
         w1aQNONeTiIGGqbJtG6QQjYl72p0t6/qLFMSyQEy2Mvcsn9dTial5P4Pqz3Q+Q3nCDVk
         qd03fgt+XQk0nHDc+kwfYfg7J8b2/Lcu2c5mjXi+lsPSnC/ss1rzk2RLiRuiC53GDxb/
         9siGUyrRHQh86cBBLoXPTlnlvkyd7AF7nqwC07Pbgfc7QeP0laO3eIAlh+iFmEcm5OkF
         xGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcnvtku1+l6L3Il6FhkxwO2UfT7CBEuY78qC4WIJtRs4MMu55n1UPg2IG2UxMNHflil+Dl@lists.linux.dev
X-Gm-Message-State: AOJu0YzSmvyUhT1V8OBRcvi8iNcXGcvxlAqBfFlKA0Qs30E460Mz4T62
	XQjsoRnPvGH64NLe1DD8TJkeEMOy/XvOMOb5M/U/s9WnB9TLxQNFU2osAVdBwJsg38Q2+BXy9/r
	P8NiqdXbywVm2iy3UzA==
X-Received: from pfnp5.prod.google.com ([2002:aa7:8605:0:b0:829:7d34:ff8b])
 (user=tjmercier job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:22c4:b0:827:3093:9026 with SMTP id d2e1a72fcca58-82a198fb819mr3435913b3a.48.1773424326549;
 Fri, 13 Mar 2026 10:52:06 -0700 (PDT)
Date: Fri, 13 Mar 2026 10:51:53 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
Message-ID: <20260313175153.235681-1-tjmercier@google.com>
Subject: [PATCH] kernfs: Add missing documentation for kernfs_put_active's
 drop_supers argument
From: "T.J. Mercier" <tjmercier@google.com>
To: gregkh@linuxfoundation.org
Cc: lkp@intel.com, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	devel@driverdev.osuosl.org, "T.J. Mercier" <tjmercier@google.com>
Content-Type: text/plain; charset="UTF-8"

The drop_supers argument was added to kernfs_put_active to control
whether the kernfs_supers_rwsem is temporarily dropped along with the
kernfs_rwsem, but no documentation was added for it.

Fixes: eea5d2bb34ba ("kernfs: Send IN_DELETE_SELF and IN_IGNORED")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603130112.2FcCzv1g-lkp@intel.com/
Signed-off-by: T.J. Mercier <tjmercier@google.com>
---
 fs/kernfs/dir.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 715b651e35a0..7f355316704c 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -481,6 +481,8 @@ void kernfs_put_active(struct kernfs_node *kn)
 /**
  * kernfs_drain - drain kernfs_node
  * @kn: kernfs_node to drain
+ * @drop_supers: Set to true if this function is called with the
+ *               kernfs_supers_rwsem locked.
  *
  * Drain existing usages and nuke all existing mmaps of @kn.  Multiple
  * removers may invoke this function concurrently on @kn and all will

base-commit: e7ccc9e054beb4c366228d24786f67c738206605
-- 
2.53.0.851.ga537e3e6e9-goog

