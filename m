Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE84177998
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 20:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714423424; cv=none; b=R56oPQmgWGOp1C2HW5iX3nF6zx+Klofe6a+jm3tNUeOdf9fJ5/HN08b/oDXs3t4S7u16V97IbYkDadbsAnREr+Ses90DffGv8TAKE1IIaG6Rtt6VatTC9VLJScfqzTJVUtH5i43vRNqcJbRvqBpiJoPeKokfbvU8NS4nWDhOssw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714423424; c=relaxed/simple;
	bh=Dqvvv5k/2rBndxGB8WRqT0FWAmJL3N2QMXq8c8tcCZ8=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XnJSaPxzIXw/3tZXPHiRQgj1QzWz65bQfcG1mKmlgC8cKuRau79kaetV+vNDwZRWfnzAHXst2RPTGPDKYH8q7NkawNapqNXi06tK7NY1VOUsyYizpbkvsISmwja5MKwspcT6Oj0/s9AE22dVFUhl3pH+qH4KgDUhiwtcZc+7D1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XiS5kG2u; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XiS5kG2u"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61be325413eso8399377b3.1
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 13:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714423422; x=1715028222; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kP5D9/l/449dTy3r209IVThrMxV6+RNO48E3tZy87Nw=;
        b=XiS5kG2ukzEIcCuuytiFqjxEgL9DofnswSxeErVgb9I/A7lHZJTyNJHZ4G4RQuUaxY
         3zxldmDKsvnJlAmcHIc7X+IO0l6zPYA3lCk0Tl1bPqRWpDs0hn0G2g8M9IQnYKiM/Gjq
         OPzepgYrFN2IzSj5PABB7PR7uPdFVxVz9RPRU9Wf361zGQcQCK9yFS8ao8/e8Sgi2mw1
         3C6ebazm0fkP210urOJJ8+7A0+2emcxi2kqivMGbZjzKr6mO0fGcV/UlWOeOsHYQbalt
         1Ya36PQOKICOtT5YY4NQrhJnY4n5Qfs28bSmpsSYzKuVeVJBlcBRLSR5wCwH/PZ+hM3v
         qNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714423422; x=1715028222;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kP5D9/l/449dTy3r209IVThrMxV6+RNO48E3tZy87Nw=;
        b=DvJzZ7uEyTk5G2Vsp2q+bMmJ61eU0xdYyZAkok/4bPXLH4nqKcxjKzGdmBnHsxql6r
         MJTqgJoZ/gy5diPi6kCPa5CgZgWtBpHiTUxT4wpEC+DqIkRUR6FYXFu3PzQSdp/jJFhq
         953duNOV+OOGzd8XnN4S6xc+VDADdxFjk8PSP+Jrb3O1jrF8KCIyTEu7xTia/BqonSnt
         cpGS1VsToL6upK/S3Rm535d0xlT16yI/z0IMEVJ5Ms8hs5mqZpjGynZWBxHIvpYJnFvu
         rLOukc3SjNebl1NhKKtSLxKZeK33FcyzwEfeRFSog3pQUt75x6ujV7DvjlWrcn++UkhN
         rQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCWfgxXnECGf2SzZXEgpfDLvqad0XqZZOqkHtHBvdCLg8qUdwrnj55XjC0eQe1+JFhqk2jRQefEbNmTTZxcL897S9tIJTQ==
X-Gm-Message-State: AOJu0Yza8GoXhtqYcvy5FP49be3ogH8U1v97foWvrkqDzvN/qgl4gOnF
	WaazfSPq3kbhcg4/wuOX4misL00Z4G7hepTsHQ9vIAcFdqWFYEAGDLT6nLXN9n3P2qfk1mnB3ie
	E0A==
X-Google-Smtp-Source: AGHT+IHcpzk6wYZrqzhB/+Lz7lRSuqPg6576nmgHC5Ed8jKuAp3HkexHCZB1xdt3BUA02fkvb59KkOzh1vc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:250f:b0:618:2ad1:a46f with SMTP id
 dt15-20020a05690c250f00b006182ad1a46fmr136239ywb.2.1714423422592; Mon, 29 Apr
 2024 13:43:42 -0700 (PDT)
Date: Mon, 29 Apr 2024 20:43:32 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429204333.146063-1-edliaw@google.com>
Subject: [PATCH] selftests/vDSO: Explicit unsigned char conversion for elf_hash
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"H. Peter Anvin" <hpa@linux.intel.com>, Andy Lutomirski <luto@mit.edu>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fixes clang compilation warnings by adding explicit unsigned conversion:

parse_vdso.c:206:22: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
        ver_hash = elf_hash((const char *)version);
                            ^~~~~~~~~~~~~~~~~~~~~
parse_vdso.c:59:52: note: passing argument to parameter 'name' here
static unsigned long elf_hash(const unsigned char *name)
                                                   ^
parse_vdso.c:207:46: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
        ELF(Word) chain = vdso_info.bucket[elf_hash((const char *)name) % vdso_info.nbucket];
                                                    ^~~~~~~~~~~~~~~~~~
parse_vdso.c:59:52: note: passing argument to parameter 'name' here
static unsigned long elf_hash(const unsigned char *name)

Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/vDSO/parse_vdso.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 413f75620a35..7e2ea9bea394 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -203,8 +203,8 @@ void *vdso_sym(const char *version, const char *name)
 	if (!vdso_info.valid)
 		return 0;
 
-	ver_hash = elf_hash(version);
-	ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
+	ver_hash = elf_hash((const unsigned char *)version);
+	ELF(Word) chain = vdso_info.bucket[elf_hash((const unsigned char *)name) % vdso_info.nbucket];
 
 	for (; chain != STN_UNDEF; chain = vdso_info.chain[chain]) {
 		ELF(Sym) *sym = &vdso_info.symtab[chain];
-- 
2.44.0.769.g3c40516874-goog

