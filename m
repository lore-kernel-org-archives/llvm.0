Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C62258EE0
	for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 08:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760084508; cv=none; b=QDI3pPjxe/lQWo7ZVSuEd2zlw3aG8jYQtxWGSoYI+9wdCY7lcP3PqFm3Bwqg1yDO27Q4VtpAwDhYi43RW2aoQXeUwzuc54zqnUPfBka9R/qB1xae3ZO26lhSct7UbR4JQP5pZGoz7VCUZpnduPGrN5HuwoPGw3DnMFIdpjADBKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760084508; c=relaxed/simple;
	bh=7n9x7QTrcndxlg+tUsPE5c3XWRfvOWdk/79MKsk4w/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=ABYln6dQGZNE1DiPxtK5vd7OPTJGyhZPHkm0wfEFg3e+oBao6j9fJ/n/HcqTa536KhbLvCqdB/wlxgQpzlH3mDqDt4mdu4MK/uYLIbfKFuR2yGylhbCDs0cyRCA1Q4UBJrNRSAQBeULLVBZGGhgQaM4XHlYZ4UBLdhOUyCm5rVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHTwpR6e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHTwpR6e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760084505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=;
	b=BHTwpR6e7wr4ErpXXeyOzQaa3+JiU8c2M+FWKXv7kVdTRl5GD2g5sLQCotbnGJGsYhjKch
	p1SN+tAGF+Wmas4ZUTDTjVGYihQG+uBoUmyRGrksu7rcAbksuJlC2K7lIpWvb0XY7UUZrK
	cDmAogVCXuqAJA6c/SvPUhfsRkFmtZI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-lW4jmlMrNb2r8wenDgmDtg-1; Fri, 10 Oct 2025 04:21:44 -0400
X-MC-Unique: lW4jmlMrNb2r8wenDgmDtg-1
X-Mimecast-MFC-AGG-ID: lW4jmlMrNb2r8wenDgmDtg_1760084503
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f384f10762so1356725f8f.3
        for <llvm@lists.linux.dev>; Fri, 10 Oct 2025 01:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760084503; x=1760689303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbJMedQSgMeF1x17YjO/qLNJsjbtU/nMqdfEt6aFy9Y=;
        b=WpZi8lADXo0trDJFdEit6AA9TxTsf6rd98+/XTYNfAIU4+b7+5hEZ63nGMUNLIcpVP
         5lOWAU3qcK5Dz0YlWrXMvepD+e0n6VgFLH/HkGG04ohvdNu/z7DazXjFCPVDhiWEDRsC
         Nm+7/naoF+Ach6qvbz9nK4H4DTwGJZ+VzKeJsOo8/K+EA/4uGPGSWgOd4c19uHdaYqdt
         p6YYnd9kEBvhQpksCM4QUiXptNpZKjUza3OYgQTh2lH3yLiMKq9gbrYfrImbw+x/bdaF
         14gLlCMVqlhz++RegedQGg2w51N4R0vC4cPtruLZG1uD/xj+NkWpqkawFtTJzm7xd4Xo
         RiQA==
X-Forwarded-Encrypted: i=1; AJvYcCVjAfY/JWvsBg0+V4l0gnTdIE6GQxTkZhHBkCgMnOm1U5JIJAiilqTxoLqjGBerjm1Nxxd7@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2a+qt9lty77RZv8+hmbJRkg6SwWhM1FtySMOj8K67xdZeW637
	UwIkDGqWuOpHR7mAGtllDnYxG4uwTJEL9K3z/9ZAY7DT5TuUg3kZj8BPivzv6rzIN4/xAUgwzRb
	Qmz3J3mmIg+Zdj6H6k23c3r89Es8nPDGfCZwPqO7+RiwFzRsgrPj2HdU=
X-Gm-Gg: ASbGncubZfTUioDA6fK0pPipR/mLzobBuHy2KF7nBlo3rHNu9+f6DLe7uet5fU7iaQt
	3pzasRt+Zpq+zSlPlR/efm8Cj9OafAlg0RzxKE11G8oTCABVDDX4FGVyH6E+RYV5TI+lQx97G99
	C/eIVjfeIgIZ9GzA1PtLVFTXdGvRkGuYVUG88yr1vCI+SdYH41/tKSYmssGgp13EZ30VJRGhgLL
	ddssTXWoXQxyrfONUIIHhs+J2/79XjA0kup8vYHTiyOpLf+ZCmsbqy0zseJxxhu9VsA0FYZydaT
	0EUgEqDPSSUDREkGKhXmSmFPc9VpD2pE//HMWGJQEi/OLBh/XqVWg0/riUaoop+R/v9yW9dLS/T
	zKXJJBJpAKQJXsA==
X-Received: by 2002:a05:6000:2910:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-4266e8db2abmr6017874f8f.62.1760084502778;
        Fri, 10 Oct 2025 01:21:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtaiyaP4ciHOEVEUj0fw2KNuY3ZMQkjybKrv/92syV0a+JBFL/CPIzPSOnaTNXUhiK7HidDA==
X-Received: by 2002:a05:6000:2910:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-4266e8db2abmr6017864f8f.62.1760084502351;
        Fri, 10 Oct 2025 01:21:42 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583424sm2946970f8f.21.2025.10.10.01.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 01:21:41 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] treewide: drop outdated compiler version remarks in Kconfig help texts
Date: Fri, 10 Oct 2025 10:21:38 +0200
Message-ID: <20251010082138.185752-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bGSJyYAPX8LsSTsAi1cBS0ZACMkjwy-pPvP68BpArSQ_1760084503
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

As of writing, Documentation/Changes states the minimal versions of GNU C
being 8.1, Clang being 15.0.0 and binutils being 2.30. A few Kconfig help
texts are pointing out that specific GCC and Clang versions are needed, but
by now, those pointers to versions, such later than 4.0, later than 4.4, or
clang later than 5.0, are obsolete and unlikely to be found by users
configuring their kernel builds anyway.

Drop these outdated remarks in Kconfig help texts referring to older
compiler and binutils versions. No functional change.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
Andrew, please pick this quick tree-wide help text clean-up patch.
Thanks.

 arch/Kconfig      | 19 ++++++++-----------
 arch/arm/Kconfig  |  2 --
 lib/Kconfig.debug |  3 +--
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 74ff01133532..602ede49daf9 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -232,17 +232,14 @@ config HAVE_EFFICIENT_UNALIGNED_ACCESS
 config ARCH_USE_BUILTIN_BSWAP
 	bool
 	help
-	  Modern versions of GCC (since 4.4) have builtin functions
-	  for handling byte-swapping. Using these, instead of the old
-	  inline assembler that the architecture code provides in the
-	  __arch_bswapXX() macros, allows the compiler to see what's
-	  happening and offers more opportunity for optimisation. In
-	  particular, the compiler will be able to combine the byteswap
-	  with a nearby load or store and use load-and-swap or
-	  store-and-swap instructions if the architecture has them. It
-	  should almost *never* result in code which is worse than the
-	  hand-coded assembler in <asm/swab.h>.  But just in case it
-	  does, the use of the builtins is optional.
+	  GCC and Clang have builtin functions for handling byte-swapping.
+	  Using these allows the compiler to see what's happening and
+	  offers more opportunity for optimisation. In particular, the
+	  compiler will be able to combine the byteswap with a nearby load
+	  or store and use load-and-swap or store-and-swap instructions if
+	  the architecture has them. It should almost *never* result in code
+	  which is worse than the hand-coded assembler in <asm/swab.h>.
+	  But just in case it does, the use of the builtins is optional.
 
 	  Any architecture with load-and-swap or store-and-swap
 	  instructions should set this. And it shouldn't hurt to set it
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 2e3f93b690f4..9b4024b277d4 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1159,8 +1159,6 @@ config AEABI
 	  disambiguate both ABIs and allow for backward compatibility support
 	  (selected with CONFIG_OABI_COMPAT).
 
-	  To use this you need GCC version 4.0.0 or later.
-
 config OABI_COMPAT
 	bool "Allow old ABI binaries to run with this kernel (EXPERIMENTAL)"
 	depends on AEABI && !THUMB2_KERNEL
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8aaaf72ec4f7..29e11893c873 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -342,8 +342,7 @@ config DEBUG_INFO_COMPRESSED_ZLIB
 	depends on $(cc-option,-gz=zlib)
 	depends on $(ld-option,--compress-debug-sections=zlib)
 	help
-	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
-	  5.0+, binutils 2.26+, and zlib.
+	  Compress the debug information using zlib.
 
 	  Users of dpkg-deb via debian/rules may find an increase in
 	  size of their debug .deb packages with this config set, due to the
-- 
2.51.0

