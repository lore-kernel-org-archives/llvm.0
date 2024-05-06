Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0307113D50E
	for <llvm@lists.linux.dev>; Mon,  6 May 2024 18:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715019606; cv=none; b=qFXwz1lX/iWdF5aPOrwbGXR9Sof6BBOFHcCt7I7crm4BRAB4ulzwAuzIjaaK401mUdUWLzLGemEClh/eMFjIdsaQUlT00xnJeT4aCLOI/T/tJdTZahTwhtfDLIlsHEC8aNrUXsj+hrkOgqUCRBAGTrkMNA+3504Pu2hP/TWMlfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715019606; c=relaxed/simple;
	bh=29kh0OQhNn8m2tDtlHwrVE2HKUPGcD9TJf7JFu5B20I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ALm71xZRfM99RPIQqNZHcglLYtWiv32Tsx0lMarRvlKu89FWXBztfYTxWYk/qjs0G98RUxYmmlzvXVxINzwcae88wFDbXcN8ErGXU4YDMMc1MPTfETMCoSrVuxzp6/uYdUd2KzV9CGlNBx3uKMmhs9m2AMiUUXpFNkvM5jWrzKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iyW7x07G; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iyW7x07G"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1e45572fb3fso21969495ad.0
        for <llvm@lists.linux.dev>; Mon, 06 May 2024 11:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715019604; x=1715624404; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PEorNdErbbliX1pJbW2p9S8u6EaFLwcWfv6R20jo+hk=;
        b=iyW7x07GsNs3pOhnKPzVnEiWo0zFLrGKc/IegTWhfQtBWhrKfDCSJNCrnoLsTWdD9G
         a0iHnfTiSrbhfgSf9Y6FRJfUFxuca5f/sLyghaQ+Wy/BUOMFZdHuIBHvRJVPvsN3tp1C
         minbQpT1fC/XAQZAYv/cGWVNWVhjlw8kva9r7STBZOymM5uikxUZt9slFZrt0US1XUCJ
         Q1AkypAZabWNndKkIIil/0j5Zzkxsnuz7+yjMXRZ1gjmgeA1tA4RkQ94r19ub3z4OZRk
         TZQCxp4DjOz/HbWrtW2yNCbSCkKVZGA2bjqQO+ADek0+ERP41BLBz3HSpKv4l5UCqkXg
         mFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715019604; x=1715624404;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PEorNdErbbliX1pJbW2p9S8u6EaFLwcWfv6R20jo+hk=;
        b=YrPu81b6q2tepjHbgi/S36MiR/ck+6HwRdipUqREgKtELlj5vr5sWrkAVlXpB6mvlp
         Hh6s62w9EXiTnTUAM66MnahCV0Fv56cGwRHAyWsvDMEBTUWShVb1opj+HezU5C/loR13
         2PBgv7VjWXLurBfi6mZwG6okYQENXK8a0nhjblUTZvsmavDh0VLOYL4KNGP5pjrsoh9B
         DZ13nWIbKvDGujilZ5d8UjpuEOrr0jhm6+aP/MpDT24vSwRkGrXsLnw9oijHsVLaTxJ+
         ENi1lK+QQc3msBGSIO7kljqzGN+/MGOnR2pu7Siz2p5nmiTbnif4UHVLa6dirz6mgaL6
         fHFw==
X-Forwarded-Encrypted: i=1; AJvYcCX7HbnxWHb01hnJFNugHkzJ/JylUOFoPUFJZImNqC4Rt2JUCvQ6bQiq5lKWaHBiZ2WJBQwGZb88rgIkhYGXAvWDRn3DDA==
X-Gm-Message-State: AOJu0Yzmfa6bkbCANubMmV/7EzqzxTOpFAMATKh5mz0HjAqgWwD+eGte
	TS3dl1gjngVXtV1EcpJPhz8y8svlTKZlsBLXQZKV1a6t6xJM3koEap5BmrMXe807vQAY1rn1o74
	y/w==
X-Google-Smtp-Source: AGHT+IESrbjMUY8Mv1UKtz5WxeKTzz99i+OpRkFhriDD5+V9JAcwp6S8JYlh7Y55BwCk8V/xyJtIzeIlI/M=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:ec89:b0:1e8:d158:4e13 with SMTP id
 x9-20020a170902ec8900b001e8d1584e13mr796623plg.7.1715019604185; Mon, 06 May
 2024 11:20:04 -0700 (PDT)
Date: Mon,  6 May 2024 18:19:49 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240506181951.1804451-1-edliaw@google.com>
Subject: [PATCH v4] selftests/vDSO: change elf_hash parameter to signed char
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@mit.edu>, "H. Peter Anvin" <hpa@linux.intel.com>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fixes clang compilation warnings by changing elf_hash's parameter type
to char * and casting to unsigned char * inside elf_hash:

parse_vdso.c:206:22: warning: passing 'const char *' to parameter of
 type 'const unsigned char *' converts between pointers to integer types
 where one is of the unique plain 'char' type and the other is not
 [-Wpointer-sign]
        ver_hash = elf_hash(version);
                            ^~~~~~~
parse_vdso.c:59:52: note: passing argument to parameter 'name' here
static unsigned long elf_hash(const unsigned char *name)
                                                   ^
parse_vdso.c:207:46: warning: passing 'const char *' to parameter of
 type 'const unsigned char *' converts between pointers to integer types
 where one is of the unique plain 'char' type and the other is not
 [-Wpointer-sign]
        ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
                                                    ^~~~
parse_vdso.c:59:52: note: passing argument to parameter 'name' here
static unsigned long elf_hash(const unsigned char *name)

Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
v2: updated commit message with correct compiler warning
v3: fixed checkpatch errors and indentation
https://lore.kernel.org/all/20240501180622.1676340-1-edliaw@google.com/
v4: moved the typecast into elf_hash based on libelf
https://sourceforge.net/p/elftoolchain/code/HEAD/tree/trunk/libelf/elf_hash.c#l47
---
 tools/testing/selftests/vDSO/parse_vdso.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 413f75620a35..33db8abd7d59 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -56,12 +56,15 @@ static struct vdso_info
 } vdso_info;

 /* Straight from the ELF specification. */
-static unsigned long elf_hash(const unsigned char *name)
+static unsigned long elf_hash(const char *name)
 {
 	unsigned long h = 0, g;
-	while (*name)
+	const unsigned char *s;
+
+	s = (const unsigned char *) name;
+	while (*s)
 	{
-		h = (h << 4) + *name++;
+		h = (h << 4) + *s++;
 		if (g = h & 0xf0000000)
 			h ^= g >> 24;
 		h &= ~g;
--
2.45.0.rc1.225.g2a3ae87e7f-goog

