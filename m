Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25324146D60
	for <llvm@lists.linux.dev>; Wed,  1 May 2024 18:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714586796; cv=none; b=o6ONEYNk3nu8ncjFTDP8RCw1kFlds8rAyUyzb5DpVgD/vFS7XWejQ2c3ShaD1RrbXva0kvLptnN1qM9n/FHZRacmwhOhRE5l8yqA/E7ir2FEBxVIPMZEg5wWj4RHSInMfB89Zxwak1NT5kjCZ5+E8LGkCESph1qMq29ilvxDqCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714586796; c=relaxed/simple;
	bh=z08x5qjd5V1B4JjVHfgs6lzO4CUiyLKjxSvmFLnvq3c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=tI1KAma1wTKn0JSlSXWMEu51Q2Dk1V5ik99uLggn2R0HbybwI8vtTTHFf2WycQaBnhaL14WR5yMAYiRUpmqwmViWGgN8Z1SgUHxmlB6FyEivaCwJxY0ChAfJyYRU5BL/2YCJIs1W90MRDW5zxRawrBVl1Cyn8ZlcNg2cIjLj7cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vCgtgpMg; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vCgtgpMg"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc64f63d768so13868424276.2
        for <llvm@lists.linux.dev>; Wed, 01 May 2024 11:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714586794; x=1715191594; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WCQ4ai1VSnRrtyOto1ox1rCCN6vQbsE1tY52jHJBoxo=;
        b=vCgtgpMgCo5kWg9y1B5S2SRlqpNpxW8/DkHixmLyL0sf67RJ48VwBRQR3o9PHFu8+9
         rCOon8l3YlfvsyIQ0w4wW3uH9hfeaXNSIP4q4OGhGqomnhtXBK9f/XFYFC8icLcTlAbH
         4oLs74DmeXgAXyaMOjllzOrylY7MUzXL46RUXCoSCLeXk1KSrSKQWbOCHt2cMuW4VNE7
         dF9fcJ2FZmxDMEeT0KocWfJVrsJsSJSwudSiuOxOkq7Va65e4S9VI0vT9Dh0OY7t48jf
         clKO3ANWUFNPLG1vbs/0izR8v6zmBW5kqE8LXJs25zt2WTlqWivupue9bKvw6NZQIybs
         cmsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714586794; x=1715191594;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WCQ4ai1VSnRrtyOto1ox1rCCN6vQbsE1tY52jHJBoxo=;
        b=oyaPfYDAm1tleo8Zjzj1fmQLaXnvnQh/HqARcY6861U198fm3du6YB8cNuWgLQLTZu
         yUf7zRhFeiNUJ6UV6R+jLu8IyGMhl77OrAVcfCD31mL7yYgZLDTjqaWVbeDriqdHT9Te
         0c9SfAPN2UujoxeUOFusOnEtXcjUjPdsydHBB8aiCyK5A39a7jGKFVotCaGtbY1E4ex4
         inu1OXtHSHuVnMF8Ubp0SGQsP6d6qST8ocfNbDxcCA7/2YVAoC2k4xX71kF1RK1zTm1T
         H6CpA14QYZpbdiox7yIkJu2mTHb4M+gMFXjBnGLXzquZ6PoD4VblrAeRQNBCkdu3fm3G
         m/DA==
X-Forwarded-Encrypted: i=1; AJvYcCUPBzMQdo0FI1LlWbRA+ip4DbvwxJK4BGPOeRIsCMQz5Cyuw/h8CSYpPVeB1sWxqnkTNgjBdsxoYJnAtGAVAciY0UP5sQ==
X-Gm-Message-State: AOJu0YwQckEs/ftKPr8kEbd4ionhRtsbod7mlW8sM9L7pME6ZGHkHeuf
	f08HQqZiTQNwOcHH9+z89V0bzxSO+0mF14kkzielKIq4savHYRu+RE3keur3uOWEPg0Tv+oIPpV
	p/g==
X-Google-Smtp-Source: AGHT+IHLJVHdkDpnZk/5+ui/KLYFczURc1pdUu54ubS7wHaSw0Y99fUuvk4v7GXL1YRdvuExXi+ubxEYAnA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:c11:b0:de6:166f:3250 with SMTP id
 fs17-20020a0569020c1100b00de6166f3250mr1029481ybb.2.1714586794180; Wed, 01
 May 2024 11:06:34 -0700 (PDT)
Date: Wed,  1 May 2024 18:06:18 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240501180622.1676340-1-edliaw@google.com>
Subject: [PATCH v3] selftests/vDSO: Explicit unsigned char conversion for elf_hash
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"H. Peter Anvin" <hpa@linux.intel.com>, Andy Lutomirski <luto@mit.edu>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fixes clang compilation warnings by adding explicit unsigned conversion:

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
v2: update commit message with correct compiler warning
v3: fix checkpatch errors and indentation
---
 tools/testing/selftests/vDSO/parse_vdso.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vDSO/parse_vdso.c b/tools/testing/selftests/vDSO/parse_vdso.c
index 413f75620a35..9e29ff0657ea 100644
--- a/tools/testing/selftests/vDSO/parse_vdso.c
+++ b/tools/testing/selftests/vDSO/parse_vdso.c
@@ -203,8 +203,9 @@ void *vdso_sym(const char *version, const char *name)
 	if (!vdso_info.valid)
 		return 0;

-	ver_hash = elf_hash(version);
-	ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
+	ver_hash = elf_hash((const unsigned char *)version);
+	ELF(Word) chain = vdso_info.bucket[
+		elf_hash((const unsigned char *)name) % vdso_info.nbucket];

 	for (; chain != STN_UNDEF; chain = vdso_info.chain[chain]) {
 		ELF(Sym) *sym = &vdso_info.symtab[chain];
--
2.45.0.rc0.197.gbae5840b3b-goog

