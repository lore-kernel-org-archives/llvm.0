Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6CC58F09E
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886526; cv=none; b=UdTq1uYOol2w3efpgoWLLNICQO4wzIQ+z6F5QNlfdoCgkLA1AK3KSyQ2rMBcGVZ+DTOxM+3lg+oDFIa/SfMQ2LBWE/1U2frgPZyhr0GsLrmCEg7GOnj3+jWTMOldHnFJ3I/BQY0ej7vO9x91b/VTv1AO0ifNZeFgrlCvqmSPNIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886526; c=relaxed/simple;
	bh=YCFdNceXAmFoeYaaoZilFisOt8nfet1SAE5gqKxRIb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDOu2PZr3sPH+fGVOTasMGEggfmCYOO+79sTlgwZ58/LW4ZsfYjo04t+bamwZF8Cd6/NAs+4ZpPsrATSsLxyavG8kmUrnN6eYc9LMigchJVHKUJNezRdHtyK9QJdQ8pAkb4iM2/FCk0Q9BpE6xuVThoBBV75+cX8oJ5NMJBXBbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jR6useM2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jR6useM2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cff3b3b92so96995e9.1
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 09:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788886522; x=1789491322; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=70pm1sR81UgF7K4xKYYgzlq1/hkKMl0juN2wWiFyYyI=;
        b=jR6useM2dcqG+LcpzA2aSTPOZGTsgo17+pm5iyeNbw99sOXaAtjzGhI0US7rA9JFYM
         NdjOw5TPHvFA7UWN8Yi/yrnUS0mAp9ESzn0WpaQc9Fbgh9/RVctJ9Gw7Ks23UDTbWOmE
         ErHHsADP/0YOiMMA+WqZezjWiGbAarS71LsF3egMD9eoelKktNk1WRYzyChJB/raEXS+
         AHjyWFjxLPhwf41PZYK6bEi+hK+u3/K00Z0Ykw6vnL9dftNCNwPd9QRAH0jTxM85ycDC
         k4LkJKkM5yfmaQO74vfGpcglou1bRxabOh7qCU7SNqeo1I5HRkU0uAtRlSVx5q8DIAjm
         13uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886522; x=1789491322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70pm1sR81UgF7K4xKYYgzlq1/hkKMl0juN2wWiFyYyI=;
        b=R0Tpc92AZwFOe/hjS0uLtFLwN5UFPTU3HZ+6PcRLBcx5yge8pDhVvqwvCwyUT5VHev
         Hm5Pmy1PZ0NXyzU3/uBJ46LVbD3DNSyctgMK70pNUefbBC93dRxjJhMJa6j99VYPIqAz
         pzCDD6AC69+v/Lx2UqYHPpVHMCzwaRReEYAVImjRVJqOxrogliBjc2qY35895oU3zMtY
         AhHP7ZzOEcBGt9jRFdJwbLvB9C7RJB90MkSH8NgJPB0Ge+Hz7Xb7SlEJkATUcmNZ9WRZ
         yAmhIOeMpA2aykgs5U702YSmyTw/dVnG+Kg4/z/ULZLCZkwJL31RScImru/+MXoVis4J
         rS3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzbX1rLR7vHka75V59fdgSCsHyrsIINiau1Cdnvg/9+RlaOkOU4bvAsthgnDElgQiylyQqh@lists.linux.dev
X-Gm-Message-State: AFuF++nE2ooH6WEIr+ZE1fwiWotcOKujySWohZVgiumImoVB+yx29Bpw
	LLCWRqe64YP4Q08Fla6MVap7CRaiohNom2Nvs7A1a0Urp9m1OcZ1y3uhZjFh+iY45A==
X-Gm-Gg: AYBFou0J1SHCpyU0B3lZ7oXu0KwujEGStfk+YdbUzTG+hJfGMFu7EmbOKUkJ1hVOPAP
	SsD36vtFeaPdwrApEz2Px0xwLCWk3oxSWPRme0EpZUrV1aXoHegk/abBKzOlads1Gr9gEbVp8WV
	iUrKmhfDU8r3WvzfVPGEd+9FyQbmLU+0/SfmRQW09bGGiM1Ffloyp7f/sY8Mm+WCpLYMgzDODxL
	8EqbMdb1hnPONVUNSXcH15g2+gcmer+lJV6oR6meXKkjpaewOn56h01m9PQIgfUMBttmC5etG2Y
	ag6JPur8uxCFZjaFCKfbvA06fhoRbPGGqQDb0oX/z+JJFWptsyKMp+H3v/JoGW7gmJBVC+RgCV9
	+zF6oxuTbAoXwFi6E85jgXxDpZiaOULnu7BJ7x+AywoHfzeZsl117T1p4sLEsVmsEd0SCUwMQMw
	hBKu65gX8uapziGLB330lIG+fqtHT/665qIcrgt0fzEqNiJiZAIUJRRpIaqVna3SOrMwBS2/2qO
	+HL7apseDPXipToyYj2VinmNySlBz8NWFLg7emVV9DTAr2g
X-Received: by 2002:a05:600c:c088:b0:49c:fee1:5095 with SMTP id 5b1f17b1804b1-49d05a2110amr2862085e9.16.1788886522045;
        Tue, 08 Sep 2026 09:55:22 -0700 (PDT)
Received: from localhost ([2a00:79e0:288a:8:ac21:220d:3908:7e61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm42193292f8f.25.2026.09.08.09.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:55:21 -0700 (PDT)
From: Jann Horn <jannh@google.com>
Date: Tue, 08 Sep 2026 18:54:52 +0200
Subject: [PATCH RFC v3 12/12] Documentation/kcov: add documentation for
 EXT_RECORDS and KCOV_MEMORY
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-kcov-extrecord-v3-12-dcbc11593e88@google.com>
References: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
In-Reply-To: <20260908-kcov-extrecord-v3-0-dcbc11593e88@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Alexander Potapenko <glider@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 llvm@lists.linux.dev, Jann Horn <jannh@google.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788886494; l=3853;
 i=jannh@google.com; s=20240730; h=from:subject:message-id;
 bh=YCFdNceXAmFoeYaaoZilFisOt8nfet1SAE5gqKxRIb8=;
 b=aSllr6z4j5ZxQFN1J4mtvDyw4zIh2DzHMu0rf2hZN2Vk9RDxRq5UJb5pLt39tiRv6TbjlJMFn
 p1/1QLFNZ2ACxGm/+aK3WHNWaEbF1RiMPvLuwTx3hkv8nAjV+J0f3xl
X-Developer-Key: i=jannh@google.com; a=ed25519;
 pk=AljNtGOzXeF6khBXDJVVvwSEkVDGnnZZYqfWhP1V+C8=

Document the new KCOV features CONFIG_KCOV_EXT_RECORDS and
CONFIG_KCOV_MEMORY.

Signed-off-by: Jann Horn <jannh@google.com>
---
 Documentation/dev-tools/kcov.rst | 70 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 1a739290c8ec..41eef656ed90 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -383,3 +383,73 @@ local tasks spawned by the process and the global task that handles USB bus #1:
 		perror("close"), exit(1);
 	return 0;
     }
+
+Extended trace format
+---------------------
+
+If the kernel is built with ``CONFIG_KCOV_EXT_RECORDS=y`` (which requires LLVM
+>=23.1.0), the ``KCOV_TRACE_PC_EXT`` mode can be used instead of
+``KCOV_TRACE_PC``.
+
+``KCOV_TRACE_PC_EXT`` uses the top byte of recorded PCs to store a record type.
+The function entry block is recorded with type ``KCOV_RECORDFLAG_TYPE_ENTRY``,
+and an additional record with ``KCOV_RECORDFLAG_TYPE_EXIT`` is generated on
+function exit.
+
+``KCOV_RECORDFLAG_TYPE_ENTRY`` records are immediately followed by the PC from
+which the call occurred.
+
+After code sections which have to temporarily stop emitting KCOV trace events,
+a ``KCOV_RECORDFLAG_TYPE_EESUM`` record summarizes the entry/exit events that
+happened.
+
+Together, these record types allow keeping track of the current stack trace.
+
+Memory access tracing
+---------------------
+
+If the kernel is built with ``CONFIG_KCOV_MEMORY=y`` (which depends on
+``CONFIG_KCOV_EXT_RECORDS=y``), the ``KCOV_TRACE_MEMORY_ACCESS`` mode can be
+used to produce a trace similar to ``KCOV_TRACE_PC_EXT``, but with additional
+``KCOV_RECORDFLAG_TYPE_MEMORY`` records that are emitted for every memory
+access.
+
+In such a trace, when a record with type ``KCOV_RECORDFLAG_TYPE_MEMORY`` is
+encountered, the trace element is a ``struct memory_access_record`` with a
+size returned by the ioctl ``KCOV_GET_MEMORY_RECORD_SIZE``.
+
+Delay injection
+---------------
+
+If the kernel is built with ``CONFIG_KCOV_MEMORY=y``, userspace can configure
+soft ordering constraints (like "this load on thread A should happen before that
+write happens on thread B") through the ioctl ``KCOV_SET_DI``, with an argument
+pointing to a ``struct kcov_set_di_arg``.
+The kernel will attempt to fulfill these ordering constraints by spin-waiting,
+with a configurable timeout ``spin_limit`` after which the kernel gives up on
+forcing the specified ordering.
+
+For each thread, userspace supplies an array of ``struct kcov_di_stack``
+elements, each of which describes an action to take at a specific call stack
+ending at an instrumented memory access.
+An action is one of:
+
+ - ``DI_STACK_WAKE_PRE``: "set synchronization bit N before this memory access"
+ - ``DI_STACK_WAKE_POST``: "set synchronization bit N after this memory access"
+ - ``DI_STACK_WAIT``: "spin-wait for synchronization bit N"
+
+These are normally paired between two threads: One thread sets synchronization
+bit N after the access at call stack A, another thread spin-waits for
+synchronization bit N before the access at call stack B, and this establishes an
+A-happens-before-B ordering.
+
+Since this involves multiple threads (and therefore multiple KCOV instances),
+the member ``sync_bits_fd`` in ``struct kcov_set_di_arg`` informs the kernel
+which KCOV instance holds the shared synchronization bits (where -1 means the
+current instance).
+
+Userspace can also directly interact with these synchronization bits using:
+
+ - ``KCOV_RESET_DI_FLAGS`` for zeroing all bits
+ - ``KCOV_WAKE_DI_FLAG`` for setting a specific bit
+ - ``KCOV_SPINWAIT_DI_FLAG`` for spin-waiting on a specific bit

-- 
2.55.0.979.g7e5102b832-goog

