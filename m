Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381A6179654
	for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 21:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714424847; cv=none; b=qusxwHgaqJXJyBL5ZbsPWpka5uhNrbBcsATMZDJT2At/0FteA+iGP3cLwseMKsTWH3x85ndX8WvZ7oXDsT5PqH2HXpWBYKMo8+q4rmb/s4PBrcm9F+LyRlePwKCe2aFnW8nVyzN3z/a0mui5fuAaojLFRdSeYDUUcRPvu1v2HRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714424847; c=relaxed/simple;
	bh=bNW6HU81cGIeHe9Ew2GlDP3sf80i3dmA2+w1AJ4g7lk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=IssT7iClE+SutIS8wpe2TCwUDcd5lxkcoEtHmrJUbXix/lDyWh2DtUeaxgnH/k7aA1BrkiX0uAaH72iba9kCZbOgsXngJzqUnBYG4cpMY7SMMD2nsHX5myhHJ34TivUrZMFc9BjKYWoodLNbnSfwpRYz1T2pxOoBLx/XwkbL56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qddC8cYc; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qddC8cYc"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1e8fc91661fso48248585ad.1
        for <llvm@lists.linux.dev>; Mon, 29 Apr 2024 14:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714424844; x=1715029644; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZPemufr3xn60MlET/JappNLxVr0lGO242Dr5arYhPmM=;
        b=qddC8cYcJ2vtTWV9NgAmOpnnbS1WHlaPFmMTHxCiC+9sMrbR/XM7FSClaUN6QR8CT4
         iPn9JWaFqpv2cglmMCqzIIgOxCJLJk8kd5yuSI0yYKV13KcgTEY6VpDYT7arjeUcNd6h
         6foZSki9XF4qaXGw+Xy3IK32pmkdou9EVSalfZpuAbQl9nMRwDoAV78s3gF3MkMp3WeB
         Ps4FQr36xr1O+VHO1Wvig9GZAfDwUuIgxsNzSbMiCaCZ1SuoIJ+McWS3epcLU3XL17Qw
         o8ZOt/JvuZstXM/Rvl1zMguMCBROGaJcBGzxQJ2AxrNCEBe6OdQaD6FEK0qzZkhnSQMS
         3tUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714424844; x=1715029644;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZPemufr3xn60MlET/JappNLxVr0lGO242Dr5arYhPmM=;
        b=YChtfWHLSZ3+39ZrAWwKUYmWmocZs5NzM/7Lqb6xiSs64Z5gk2KGe7TuC36Ul0vnnJ
         7ykpCBxNj/UTGerVG4dN3yzuYC+8V9VX81X6nTsvVs+gqnkK9o5aSQCOg9aCjBPZzama
         vOGbR/zjhUtmExiaL+b+48gk+k++dfZehNYFilMBD3AFfKHQ4mo/RG6mcSw93VjOFf3C
         z3RIuO5d2r34PwypH/FAHetJntKDxeQ4SL+Uesgz3IN0ib8lhlppWml/uw7NqQXMgul/
         77ZqLyHc2IV9kvLEtv+Q2EeqHR3/LVYlLQlV9Ln53ASAOK2WNEHNXglDI26qQazTXntk
         DlLA==
X-Forwarded-Encrypted: i=1; AJvYcCWZkJ4SPjEXW4bQcZQi1RQt9DdypOYo0aHbjYPgqSzjM/LBfwi/F3amUzpoyJbxqDpVBjOBXqR3IonGL7eMPSSpC2DJ1g==
X-Gm-Message-State: AOJu0YzIuZi6zUonjaM4YDQWPoqy5Eo74NyMc6nOpAo/nZN/iHr7IkzD
	66+X8hVeA3kjqYtzgQw0pepROQ6lEIPqGSjngwjv3j/On7iivztLaD/m/3POBYKxNzWyx56r6cl
	VUw==
X-Google-Smtp-Source: AGHT+IFBGD7QB6vVNyyUyCjXOcacflWPyo+Z5Ud65lcVUKG1pidH8vesc6pbfjFPwGiC0U3xDqjPEOYjXtU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:e88b:b0:1e3:e092:53b9 with SMTP id
 w11-20020a170902e88b00b001e3e09253b9mr33232plg.4.1714424844307; Mon, 29 Apr
 2024 14:07:24 -0700 (PDT)
Date: Mon, 29 Apr 2024 21:07:20 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240429210722.154156-1-edliaw@google.com>
Subject: [PATCH v2] selftests/vDSO: Explicit unsigned char conversion for elf_hash
From: Edward Liaw <edliaw@google.com>
To: linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andy Lutomirski <luto@mit.edu>, "H. Peter Anvin" <hpa@linux.intel.com>
Cc: linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	Edward Liaw <edliaw@google.com>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Fixes clang compilation warnings by adding explicit unsigned conversion:

parse_vdso.c:206:22: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
        ver_hash = elf_hash(version);
                            ^~~~~~~
parse_vdso.c:59:52: note: passing argument to parameter 'name' here
static unsigned long elf_hash(const unsigned char *name)
                                                   ^
parse_vdso.c:207:46: warning: passing 'const char *' to parameter of type 'const unsigned char *' converts between pointers to integer types where one is of the unique plain 'char' type and the other is not [-Wpointer-sign]
        ELF(Word) chain = vdso_info.bucket[elf_hash(name) % vdso_info.nbucket];
                                                    ^~~~
parse_vdso.c:59:52: note: passing argument to parameter 'name' here
static unsigned long elf_hash(const unsigned char *name)

Fixes: 98eedc3a9dbf ("Document the vDSO and add a reference parser")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
v2: update commit message with correct compiler warning
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

