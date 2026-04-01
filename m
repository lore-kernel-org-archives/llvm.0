Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF51C47D951
	for <llvm@lists.linux.dev>; Wed,  1 Apr 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060175; cv=none; b=rvTbi+DPE3k/3TYZ0txq1DPPCztaZ2XOrUhCBAPoXlp6nzZMYr7B0bdH5ttARWCys3xE9XgVB2WSzHs7zrxhrEspkuF/4uyGtnPBNWEffi9LriW9BqOejdb+FPqxEJ4ypnjns3uw6IefEFc+cyQCud4QuISJwV73DHE2JR/9T00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060175; c=relaxed/simple;
	bh=yVagyWKvjPbOTMFBAGYFdTOqwRpe3t1YiqqD3RZmsw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO3dOBeapIGtW1FseGgFkY4gtBtLlab+mpvXe7dQ0Ufhbyef4kYjhsbFmR+lYi8BfKmgN02P45U9ZGnW/dykwv0eUrwGENyG6pUuKQbH4zbIazaWu3HyB+RdAuyk0l/9atPKBrzKp7H73ArSYO1YYdwNfCmCp6PTQmYEvmCkxcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XhyNGAJC; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XhyNGAJC"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso1607958a12.0
        for <llvm@lists.linux.dev>; Wed, 01 Apr 2026 09:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775060170; x=1775664970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3FvjqJGRUGf5rvJLMczRoDDubOCSWcD2sRCL5wLsrmc=;
        b=XhyNGAJCNvSJ3pf/JJQMT45o95gLfqInIGccp6NH0I4lN1SJIRnQICX7KygslT4wby
         Zn1VkUqAHaQ7rAfT5viHGf08yI6iDaAiIT3UTpWjQMYxcCTs0rylgvdZ2Fu8DA7ZTgiz
         XpbDCYTsbF/oogFBNXaexmuqwWKtVa0q/7wGuEVNboizkJNmPxvml3F9hI72/hG8giui
         V8flVNVZ80AlxD9C613XKRM1vdHhrcQyKXLwbcNRVJMqwAgvRfNYizSzedJVt2vz9hjK
         iM9BGo8ZGbgGtaghkTlP3SxBQ2v4nkd31orCsDPhNK85O5HXp82GCC3GuNB9L6vHlep5
         Ej2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060170; x=1775664970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3FvjqJGRUGf5rvJLMczRoDDubOCSWcD2sRCL5wLsrmc=;
        b=jKSeNv2MvzyGlQjU+3gD6IsIECHxVHpS9MEMvlmaZkAnEyeFb00Fj9KnGpJOLb6pUy
         oxut2NBzVAGbsNAoyRFNl8fY5BKFoITQcobCkCt16AJbW0UY1oQrQ0lWwF9l89cBP8ik
         XiyX1+HpqmGk6A7xLchAaB+MCKnS6K3pVUYf2u4IzjT5gjKTehDRW9kLLqTSlnNK++7/
         vlayyjY+RYgxs+B8O7GaoAIh62Lqvqjklr99+7uoadXdSDesIlfMH4jlXbaVCzQzghGu
         oM6fvyq1FW8l7DUCCkfyuL7le/nE2SK0tb9ZEnTbpwdD5aITtxMAYS53Ej1+8wsbiKe1
         spWA==
X-Forwarded-Encrypted: i=1; AJvYcCVzNJRFfHOLr5Unz8eLkbwNwmRSpExnFDkuzVqzW+CjsksQOI/JGtr8RoqXzjblwP/Ley9Y@lists.linux.dev
X-Gm-Message-State: AOJu0YyRcJSzlq8P5ReqtMjBX8xlMNl6TXHKpj9AAKVP8oROJKA2DQSz
	6pAaKMkIwEHfZEwz/YrxaofZAnAeA85h/MpSrgcCyhGDpMSYM+o/UCvpzgX9FZTi4iM=
X-Gm-Gg: ATEYQzzuzJTYD9Dj6jN3zVcVkHp0qwQqstjrwn5UNrMxdMieqxNa2fpktRfjkL37zWw
	QU4nW1E2Ih5PQO2mJD7QSEGo3PEHBOHQFEBKclw1ueWKJd5LirPCQHA57nPJv30QrEULrHvbVup
	Mf+cNnBK3nHuT/F6TlS1LJzLL8zAf51CQmlWgEGLEnCorCdOm+1hSd3HSlO9IHEgIYafaVVy0aM
	9vC4+It+9+B4u+oYo7td0E86j/XrOCnD6SSC7WRybgrXiQBk6qEX+W08+bcAV0ootHaTdcoUoi7
	i8Jc7aZDhhPshYiNhJGbmBPiujMIX7t0N+MFGyftQ6qTKbQqUbC5GtwdUnkQ3B1FETB1bMr8xIO
	hiO9chfiRcSwULLbFYYaEMKtnRdgtON08LmlnVU8AbAX0/RvIrN0DBVaC14b/jDdF8/blDEdL0L
	1GEi5g0lHL
X-Received: by 2002:a17:907:80d:b0:b97:b88c:386b with SMTP id a640c23a62f3a-b9be88fea21mr486276566b.29.1775060169798;
        Wed, 01 Apr 2026 09:16:09 -0700 (PDT)
Received: from localhost ([189.99.238.3])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb4fb62esm539517241.0.2026.04.01.09.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:16:08 -0700 (PDT)
From: =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
Date: Wed, 01 Apr 2026 13:15:17 -0300
Subject: [PATCH 10/10] selftests/bpf: Tolerate missing files during install
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260401-selftests-bpf_misconfig-v1-10-3ae42c0af76f@suse.com>
References: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
In-Reply-To: <20260401-selftests-bpf_misconfig-v1-0-3ae42c0af76f@suse.com>
To: Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openssh-sha256; t=1775060128; l=1301;
 i=rbm@suse.com; h=from:subject:message-id;
 bh=yVagyWKvjPbOTMFBAGYFdTOqwRpe3t1YiqqD3RZmsw8=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgguRCc5X8/UX9M40lkMnr//aFGOhce
 x5ezt8MFNUFlqYAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJqWMuDkW7CGJ4c4k1sKyalpyIqTV3VBzKB/br2/xyUcVyk8o5hnm2bUhNHeFiX5vKvdQ7v/CyK
 tdCTirSltDAU=
X-Developer-Key: i=rbm@suse.com; a=openssh;
 fpr=SHA256:pzhe0fJpYLz+3cZ33FFPhIfaUElk9CXPFFXmalIH+1g

With partial builds, some TEST_GEN_FILES entries can be absent at install
time. rsync treats missing source arguments as fatal and aborts kselftest
installation.

Override INSTALL_SINGLE_RULE in selftests/bpf to use --ignore-missing-args,
while keeping the existing bpf-specific INSTALL_RULE extension logic.

Signed-off-by: Ricardo B. Marlière <rbm@suse.com>
---
 tools/testing/selftests/bpf/Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftests/bpf/Makefile
index 3d5b88435446..ec24bad44017 100644
--- a/tools/testing/selftests/bpf/Makefile
+++ b/tools/testing/selftests/bpf/Makefile
@@ -951,6 +951,13 @@ EXTRA_CLEAN := $(SCRATCH_DIR) $(HOST_SCRATCH_DIR)			\
 # Delete partially updated (corrupted) files on error
 .DELETE_ON_ERROR:
 
+# Some generated files might be absent when only a subset of BPF objects
+# could be built. Tell rsync to ignore missing source arguments.
+override define INSTALL_SINGLE_RULE
+	$(if $(INSTALL_LIST),@mkdir -p $(INSTALL_PATH))
+	$(if $(INSTALL_LIST),rsync -a --copy-unsafe-links --ignore-missing-args $(INSTALL_LIST) $(INSTALL_PATH)/)
+endef
+
 DEFAULT_INSTALL_RULE := $(INSTALL_RULE)
 override define INSTALL_RULE
 	$(DEFAULT_INSTALL_RULE)

-- 
2.53.0

