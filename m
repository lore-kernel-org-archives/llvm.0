Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C2032AAB4
	for <llvm@lists.linux.dev>; Fri, 14 Nov 2025 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130493; cv=none; b=GyqdkiyaKRGCUbra3pnnBEAcBWP5ICIiS3EldQtxXmly8C0tlrfbrfQ/UNSRtRWwb8TWBThnxkFbKfxfRbcVHHmV8vWdRzIu3lK/L8TGpqqo/HrVS1ul0I2bBUWr6egj2L2HPL/y9srvBMMeWUjwgOtP0arCRvsWbn1CCfOSBWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130493; c=relaxed/simple;
	bh=vtbE4iQccIDPAbt51GtKugnCRkvsnDiu597g0q1p1vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O93GOdg3CXdqs9a8CkFm/2+n5ebIkEUPAwOpVrepdIa1W6SM6ZDOMwMGmXs+gJLt8RUEv+4Pn/2doT74ZATIm/lVmeMwVuxA/lOsG2+E/o/5cMcNLc1YBBLHn+0ItczDMag7++9qB905ec+++TboU5FYHYk+QtsS5GEMvhMnJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iN7f0g1Q; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iN7f0g1Q"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-4331b4d5c6eso7827415ab.2
        for <llvm@lists.linux.dev>; Fri, 14 Nov 2025 06:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130491; x=1763735291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g04XP369OdIGlU7nO8ZhA20Z4uYWbY8J/2UrhgEgmF8=;
        b=iN7f0g1Q1SVA9sK+LEUX0KdHnEjR+fLlRGvw4djrR67/pCsD7U3LXWh6fnmun6c9vl
         RFC8ETf2GSbvIr/qtQjmv0Y8JEAqrI7A17C3yAnWcUfO7WE1H2q3grj9Epe5G2YQZA7W
         cuM0Cgnyqf9g2hFQSY5yLxxY28CXHAWfJvvlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130491; x=1763735291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g04XP369OdIGlU7nO8ZhA20Z4uYWbY8J/2UrhgEgmF8=;
        b=NycrPlip5rNmIqTXplAabqqKnydj6bKvTMRy1BzCrU8lsJKpfpN5UyJ1A8Wsa4/oeP
         HJEdnDCe4ldnP2Q5CBiZY/tqaXoBQpmkgP2UESI7R8N2d+8cvPbGoqFca4x1OtiVFkAO
         Zyfjt+1DnLlrxnuizas1+YzH2WwHXuvl9RX7QavJ2yo4EuBXxPbpZGRKErA+eH6VuSJi
         Iq/Yfot3Cqyv2tsrRRMeFyBP5kNqvOjEidH6uxb7o0bW4+95O82jkFw3iffSpcG8frKw
         NMENQ1eXxEPBu3XCVEayDRlWSMqfLqdzrJYy3v/VPx7vSYHdSpMMj3kPO4y9jicEPIFZ
         t3tw==
X-Forwarded-Encrypted: i=1; AJvYcCUP248jmDE8LXqNmrLIjl2vNySlgyiS/XWTBdLmCtUsbGYMvmmB3TQ21ArZOLPMCeuaDnxN@lists.linux.dev
X-Gm-Message-State: AOJu0YwYPzfgJIWOmM8/w+68JaikSRy5oQdc6m+JyXQ2rV5wDE63w9uz
	9Nthr8PxFntnD6F8SK89QSTK/yESBqEQFW08fNyn7A0/TqM1PhAnZbCJOmipMazPmw==
X-Gm-Gg: ASbGncv6Qg6GT7EeqdWoX9GJPSMRyXTBVd/AA+n8S/3HgIgtVag76EGuN/5Q+Pb6MOV
	jSCcWrDuj/+jBxEFtW+vbTd+RjVvycve4T+36lsSp+c/9q1dbQK7rEfj+XZchkrK7kxI7l0pr9z
	uBF9ferQSg09SMHR0T65Q3KlbXiMYdBtKJ9bNmC4jimGTas+LZ9LAR2WXavMlEDF7Snx1Or6lXC
	49z42jHexo91rytAGEUtFvUIDl/mzCiRw/W8Ek7Hcr6Rcrx1ZK5vLZBX91BqTY3N3Wf6r6rd3u0
	TeD+VR7rdXV9zdaEahu9epGWA1Lf3CONdxzEa/y/EyN4o+VC5j3YjH/3UIy9EoVYsJJB0NFOfOo
	aEHX8MmN/B2ZjktsjoEzFOsRoFu/7tnJR3eRRSbP0P++ip8geL6RNobeV+qzxI2ZK3bf6t0H8P1
	nUrimTA66PMqJ9Xas=
X-Google-Smtp-Source: AGHT+IH9WRXDGpQxQ/K/6unFcP6iH5jd3lNOXJwjoIeZqn0+/6i1yonIkDQHVVuUwWSwfsG4BW0P5Q==
X-Received: by 2002:a05:6e02:2389:b0:433:330a:a572 with SMTP id e9e14a558f8ab-4348c8e3e5amr60110435ab.13.1763130491388;
        Fri, 14 Nov 2025 06:28:11 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:10 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v5 5/8] kbuild: Split out module targets into a variable
Date: Fri, 14 Nov 2025 07:27:31 -0700
Message-ID: <20251114142741.1919072-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a modules-targets variable to list the targets which cause modules
to be built, since we want to add a conditional target.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v5:
- Add a new patch to split out module targets into a variable

 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 638bc09a546a..8cd46222fc48 100644
--- a/Makefile
+++ b/Makefile
@@ -772,7 +772,12 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
+modules-targets := all
+modules-targets += modules
+modules-targets += nsdeps
+modules-targets += compile_commands.json
+modules-targets += clang-%
+ifneq ($(filter $(modules-targets),$(MAKECMDGOALS)),)
   KBUILD_MODULES := y
 endif
 
-- 
2.43.0

