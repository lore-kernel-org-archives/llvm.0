Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890118;
	b=1pxcCBGzA9/mi4N8fGnVh5SnHaZH34eosR4lodw+UVEGyUfYjvuezVNGPN0ISO/ocgk/
	 ko8vstBbAmbxzXWOdA+E61LXZwcVwHjVdTdhxV+vMIWRfR2yZbbHgeTZHi/SyKd5vHT55
	 Ky+2gNcW1motamSefSICTzfRVhTrj9WQq5Hy4bhqbV0bqWMH3sopldvt8+PK4RJ6vSOqP
	 T6XIRCEkPqbd169iTKGBEcCdgNkxkkduMfkXLqnz2Br5lMk+6PE91ZnI9jDLbcroIEJOS
	 fEOIFndfZbZCt+XC0QpNtYig6nLht71GLREVmRGSjkTLOuVWvMCtXgYMfRyw+FrBM2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
	b=abKkBduHrspgOV41jCA6WsA+wRLuuNZHYZgPVRxNmBD3sd1PLHH5jRdkdutGgyMq0th4
	 Pmq8gZ8oi/7X5xF2WU8FZ3ttrlhFVGOoxFERFMNOPyHDtUFLlm2EA9ILbmTGurrFpGEAK
	 25cWkO5NpZbjQrRPRIbZr6x+dvS3wJCxqEY9WmmS20avDo7iL6CSxzSwaK0eNBlGm/NV7
	 XeE59sAPg/jmMHOTQacFTlFKAYpU+zCn54KU7XFJfUSrCRvvZ5QFieERcGcqAAppZozaD
	 +Hv8AcPJIMywfjtOew18clyg1j+9sh10awdM9h4nXCLYtkwc2Yr+tnSoxmEJryPgFiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iRHbQs4i;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFCB606A32C
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFCB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iRHbQs4i
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2efdd509c6bso4564125ad.0
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 20:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890118; x=1795494918; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
        b=iRHbQs4iyUmFoflE8AMbrOP4YswQCTLl3GPqD9wZrUS6S1mAUs/ziLoSG/wq3fMIkI
         oUw9soPTBV8rVJKAXF9XsuV8I0wgxCTpaKm+49Ma7gmwODf9Ig09GfloJISczjuSx2jY
         fG/mCX8AtQuRDpfJdx+Xl1TE17BYOCayRZibRpaXbre247AMjaKVNgmcv20fHMq5JipC
         NJMdRiY/YWsuGJPeM+R79IcRuL+2E4Xou1I3vDgMomSqc7pBG9xeiKo78fY66WZo6TtD
         ruYSgYRgrDrSWANtZuHN9Q6/Kl3zrpDQ0fZzA4dNr7m2woQR8u4f+IBaWWCX7wexi9P0
         QYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890118; x=1795494918;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z05eBXZtj33QVuPoWyFJ9ACiczNoA+RtpuXMjmRS3N8=;
        b=WwOzg+yuti0OouwukAPwLV8yr7ySVzzYnlgrOAslG8H0Y54SdOOGF7l9TZ+AiO5Hu+
         d88f2RjHpFLB8Oawcfcl4Zeo/wLzOa/wGiPl1rATgtoJtLNhqss6bxmka/T5NYgbXyT3
         N52SwUBAoMdVxjpaWS32s4TIUA4DDkSDDLvnoz14VYmTdqwimIVjLk/xuSX0mbEHQWBL
         5/t4OSkQVMyowuY2XIhRaDnFu3E2+dyGtGTWWBVk6ab45IqW7k6VeXWbcNFo6rdqvck5
         vXsJkZWPfjkB551LgsGrAOgR7aexIwaasPKhaEGrgor1LoSOV0jmSXxGFWe4YxhcGWxR
         C6KQ==
X-Forwarded-Encrypted: i=1; AL+hErEPeFApeSD4qSSp0URaG0PqRujlb7FisP90GgmlguvqyacX0RT/YRcag83CqHUP3HZ45Jt/@lists.linux.dev
X-Gm-Message-State: APuU4Z86xP+gkME288cqfh9Iccto5pUtz/0JXEtHuw5hgqQSw3jMeWuC
	lXTVSc9KFeeh2Vrcj4IhMqZFcNBnwo99NiNMepz3nouT367c+QjO6PEDEsmMw/drptFj89rRLFl
	tIFgqcF5SBsjWUSvCTShXi8+HFA==
X-Received: from plbju12.prod.google.com ([2002:a17:903:428c:b0:2e8:44b9:5c18])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b50:b0:2ee:1f51:32ea with SMTP id d9443c01a7336-2ee1f513339mr100649615ad.25.1794890117329;
 Mon, 16 Nov 2026 20:35:17 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:59 +0000
In-Reply-To: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261117043504.1021063-1-dylanbhatch@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261117043504.1021063-8-dylanbhatch@google.com>
Subject: [RFC PATCH 07/12] scripts/sorttable: sort .lr_unwind_fde by start_offset
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Weinan Liu <wnliu@google.com>, 
	Jens Remus <jremus@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-crypto@vger.kernel.org, llvm@lists.linux.dev, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Indu Bhagat <ibhagatgnu@gmail.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, live-patching@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>
Content-Type: text/plain; charset="UTF-8"

Normalize the PC-relative start_offset word of each 8-byte struct lr_fde
entry in .lr_unwind_fde, qsort by virtual address, and denormalize back
to PC-relative offsets without modifying range_desc.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/sorttable.c | 50 ++++++++++++++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index 88e49a5c42512..38495c39e404b 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -600,6 +600,37 @@ static void get_mcount_loc(struct elf_mcount_loc *emloc, Elf_Shdr *symtab_sec,
 static inline int parse_symbols(const char *fname) { return 0; }
 #endif
 
+static int compare_relative_table(const void *a, const void *b)
+{
+	int32_t av = (int32_t)elf_parser.r(a);
+	int32_t bv = (int32_t)elf_parser.r(b);
+
+	if (av < bv)
+		return -1;
+	if (av > bv)
+		return 1;
+	return 0;
+}
+
+static void sort_lr_unwind_fde(char *fde_image, int image_size)
+{
+	int i;
+
+	for (i = 0; i < image_size; i += 8) {
+		uint32_t *loc = (uint32_t *)(fde_image + i);
+
+		elf_parser.w(elf_parser.r(loc) + i, loc);
+	}
+
+	qsort(fde_image, image_size / 8, 8, compare_relative_table);
+
+	for (i = 0; i < image_size; i += 8) {
+		uint32_t *loc = (uint32_t *)(fde_image + i);
+
+		elf_parser.w(elf_parser.r(loc) - i, loc);
+	}
+}
+
 static int do_sort(Elf_Ehdr *ehdr,
 		   char const *const fname,
 		   table_sort_t custom_sort)
@@ -609,6 +640,7 @@ static int do_sort(Elf_Ehdr *ehdr,
 	Elf_Shdr *strtab_sec = NULL;
 	Elf_Shdr *symtab_sec = NULL;
 	Elf_Shdr *extab_sec = NULL;
+	Elf_Shdr *lr_fde_sec = NULL;
 	Elf_Shdr *string_sec;
 	Elf_Sym *sym;
 	const Elf_Sym *symtab;
@@ -656,6 +688,8 @@ static int do_sort(Elf_Ehdr *ehdr,
 		idx = shdr_name(shdr);
 		if (!strcmp(secstrings + idx, "__ex_table"))
 			extab_sec = shdr;
+		if (!strcmp(secstrings + idx, ".lr_unwind_fde"))
+			lr_fde_sec = shdr;
 		if (!strcmp(secstrings + idx, ".symtab"))
 			symtab_sec = shdr;
 		if (!strcmp(secstrings + idx, ".strtab"))
@@ -759,6 +793,10 @@ static int do_sort(Elf_Ehdr *ehdr,
 		      extable_ent_size, compare_extable);
 	}
 
+	if (lr_fde_sec)
+		sort_lr_unwind_fde((char *)ehdr + shdr_offset(lr_fde_sec),
+				   shdr_size(lr_fde_sec));
+
 	/* find the flag main_extable_sort_needed */
 	sym_start = (void *)ehdr + shdr_offset(symtab_sec);
 	sym_end = sym_start + shdr_size(symtab_sec);
@@ -833,18 +871,6 @@ static int do_sort(Elf_Ehdr *ehdr,
 	return rc;
 }
 
-static int compare_relative_table(const void *a, const void *b)
-{
-	int32_t av = (int32_t)elf_parser.r(a);
-	int32_t bv = (int32_t)elf_parser.r(b);
-
-	if (av < bv)
-		return -1;
-	if (av > bv)
-		return 1;
-	return 0;
-}
-
 static void sort_relative_table(char *extab_image, int image_size)
 {
 	int i = 0;
-- 
2.56.0.679.gc527c65306-goog

