Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890115;
	b=A9mAdWMR+EsfhJWcPUrsby7MXFp+/aphkXkif5GPlkznuODGaroPHtyGdS01oTmbPwnI
	 6vA11FlF/TsYcNUQ/7oaRVWCd0zcWV1z9+3uD2JPgP2IJAG3H8B+FOJy3iLfJSyF2QSz4
	 IzvgWTK+1cRUXB2/4HUlJ3sU9QbkwglsuAgbozRBsE1s3IYUWrOsx+doWHT3HE/5Ilmno
	 URnl0PwcpdAiuMbJQnhCQvoLNVgKHmZfk3NPrRj+fPQmbo2QwASAZtTtye/NuvD3JOV+A
	 64xGPwevv+/cz9AWlXSFlecsXb3HekUv/OrMQDMSh1+IJkUTX9h+KMBi918z4+yoGqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Nvy6CCcqwiTypH3Zs6Qc7VXNuAG2dCzSjfHucF683qY=;
	b=1H08LUXVyBjs7khOw26njGNlMHVPHIR6ZAiNA0djFN1zNv0dYX67qxl/yAy11xhL04vF
	 ywrZQrOiKpoS5UC7NB+bJGTiruSSwiCHRnBvsIHJmDFs6ITPrj7CXNtsdXmigHSGFTTGB
	 KL1OfPO5M7nU45KvUn75JF/iWcsAQNne4tOgWC/diWv4Wwfi3lipSvCm1tShkrL2rMlhT
	 2rW92Z+NFHRo8sgc1kK9PN3hnI9y/jd6DB5aGlBFDy4rPeB7SF++8DymWSm/gDOXCF2MV
	 Ncq0z9zPTD6FvulZCXG6BOs5kACC7Wy/x25Bggmzzr6eUqiTv0vldcNx/8zpRk1AqyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hW8H8paB;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7404B60A2605
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:35:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7404B60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hW8H8paB
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so3462469a91.3
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 20:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890115; x=1795494915; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nvy6CCcqwiTypH3Zs6Qc7VXNuAG2dCzSjfHucF683qY=;
        b=hW8H8paB9ZUUzpXQGBctsYnHbeQnKwyaD3h62yxZGCYKyfqW0antBD+X55G1K5iWiB
         HeKUMxflgWs3S7lYEFSYQQXG4hcxPvG9KPHT5gV5nxl3cZwTucbP44hosSnnD1XiN3KG
         +JZ1hgRokGNqC/0gI22OPsnSFdCn+eBvZkxweUJpuwzjJtQCIo8Hp1PabZfuYG0bY3g7
         fKW2h2egjWll/00TFf6CKSvVVeqtPYNNmhOLtqr2CbZgaUFDNw04TYU5OaczFrnBfruo
         yMHAuOb2PCg/e4ZFyrlBbIlCDX0zQbcGCtBZsajEsJxeawShCfgUNkjAakDE1gaEIrKl
         Jqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890115; x=1795494915;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvy6CCcqwiTypH3Zs6Qc7VXNuAG2dCzSjfHucF683qY=;
        b=MiTkdQQx8+P4m7llER1jeUGWejJnhTwk1E4vTrMdGx+sf4jazLVA9NjRLr0r9bL12S
         O5/04K9BB/LRaKk5dyHr3+8c3zRBeJ0Oghz9XSR0MLss5e8G6LcjnftbhH0peiBi2QRI
         T1cyzZ5jiFbqSDjOof9P/J7owCh7Mlnz2ImrMFK2GsUJTvF+4uFCWy+KTSIBJKmVWk3e
         /eqGpEnsYSWbXu7gY8t8m58JJnxNSgGx/sevwMvo02ii2Lz/vKJ+XR8jygNDgW+ZZUNg
         Usy1Onk7yzuuhnrRKBFht6cgpx8h4NaYV6oBY59jakItOmsRpVnyi2Bj9n7MSUyH+Nsq
         HA9Q==
X-Forwarded-Encrypted: i=1; AL+hErHSuEWWs7ih+WlzOzNJmswu52+JrXKPmqCArZx3LEk/8qx64A7OkpQe7YK3EfG2naQvhSN3@lists.linux.dev
X-Gm-Message-State: APuU4Z9YLyfsR9DnAzfQslT2FibLe/a1SADjyjReclJyq1yczl+2Xjw3
	GrnpqxexdpDDqKoKKy1D+6/j7OxHVTRWbV042NGrnejeBwE4GLh4J7VQrVcy48kN2lafVg6V4Uf
	HJnLz4HUWvz9YvOvTcvIncIMkPQ==
X-Received: from pjbrs16.prod.google.com ([2002:a17:90b:2b90:b0:3ae:bae0:3179])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:580c:b0:3b0:a7b5:c046 with SMTP id 98e67ed59e1d1-3b1b0b50028mr12486450a91.54.1794890114431;
 Mon, 16 Nov 2026 20:35:14 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:57 +0000
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
Message-ID: <20261117043504.1021063-6-dylanbhatch@google.com>
Subject: [RFC PATCH 05/12] scripts/gen_lr_unwind: emit .lr_unwind_fde and .lr_unwind_ranges
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

Implement emit_lr_unwind_sections() in scripts/gen_lr_unwind to append
.lr_unwind_fde, .rela.lr_unwind_fde, and .lr_unwind_ranges sections to
the target ELF relocatable object and update its .shstrtab and section
header table.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/gen_lr_unwind.c | 140 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 134 insertions(+), 6 deletions(-)

diff --git a/scripts/gen_lr_unwind.c b/scripts/gen_lr_unwind.c
index 118f995b2c48b..f65edd86ac78c 100644
--- a/scripts/gen_lr_unwind.c
+++ b/scripts/gen_lr_unwind.c
@@ -54,6 +54,19 @@ struct lr_unwind_ctx {
 	size_t		cap_runs;
 };
 
+#define LR_SHSTRTAB_EXTRA \
+	(sizeof(".lr_unwind_fde") + sizeof(".rela.lr_unwind_fde") + \
+	 sizeof(".lr_unwind_ranges"))
+
+struct elf_writer {
+	int		fd;
+	u64		off;
+	Elf64_Shdr	*shdrs;
+	unsigned int	shnum;
+	char		*shstrtab;
+	size_t		str_sz;
+};
+
 static int append_fde_entry(struct lr_unwind_ctx *ctx,
 			    const Elf64_Rela *eh_rela,
 			    s64 byte_off, u32 desc)
@@ -338,16 +351,131 @@ static int parse_eh_frame(struct lr_unwind_ctx *ctx)
 	return ret ? -1 : 0;
 }
 
+static u64 align_up(u64 val, u64 align)
+{
+	return (val + align - 1) & ~(align - 1);
+}
+
+static int pwrite_all(int fd, const void *buf, size_t count, off_t offset)
+{
+	const u8 *p = buf;
+
+	while (count > 0) {
+		ssize_t n = pwrite(fd, p, count, offset);
+
+		if (n < 0) {
+			if (errno == EINTR)
+				continue;
+			return -1;
+		}
+		p += n;
+		count -= n;
+		offset += n;
+	}
+	return 0;
+}
+
+static int append_section(struct elf_writer *w, const char *name,
+			  const void *data, u64 size, u64 align,
+			  u32 type, u64 flags, u32 link, u32 info, u64 entsize)
+{
+	size_t name_len = strlen(name) + 1;
+	u64 sec_off = align_up(w->off, align);
+
+	if (size && pwrite_all(w->fd, data, size, sec_off) < 0)
+		return -1;
+
+	memcpy(w->shstrtab + w->str_sz, name, name_len);
+	w->shdrs[w->shnum++] = (Elf64_Shdr){
+		.sh_name	= w->str_sz,
+		.sh_type	= type,
+		.sh_flags	= flags,
+		.sh_offset	= sec_off,
+		.sh_size	= size,
+		.sh_link	= link,
+		.sh_info	= info,
+		.sh_addralign	= align,
+		.sh_entsize	= entsize,
+	};
+	w->str_sz += name_len;
+	w->off = sec_off + size;
+	return 0;
+}
+
 static int emit_lr_unwind_sections(const char *fname, struct lr_unwind_ctx *ctx,
 				   unsigned int orig_shnum,
 				   unsigned int shstrndx)
 {
-	/* TODO: Emit .lr_unwind_fde, .rela.lr_unwind_fde, and .lr_unwind_ranges */
-	(void)fname;
-	(void)ctx;
-	(void)orig_shnum;
-	(void)shstrndx;
-	return 0;
+	const Elf64_Shdr *orig_shdrs =
+		ctx->map + ((const Elf64_Ehdr *)ctx->map)->e_shoff;
+	size_t orig_str_sz = orig_shdrs[shstrndx].sh_size;
+	Elf64_Ehdr ehdr = *(const Elf64_Ehdr *)ctx->map;
+	struct elf_writer w = {
+		.fd = -1,
+		.shnum = orig_shnum,
+		.str_sz = orig_str_sz,
+		.shdrs = calloc(orig_shnum + 3, sizeof(Elf64_Shdr)),
+		.shstrtab = malloc(orig_str_sz + LR_SHSTRTAB_EXTRA),
+	};
+	unsigned int fde_shndx = orig_shnum;
+	int ret = -1;
+
+	if (!w.shdrs || !w.shstrtab)
+		goto out;
+
+	memcpy(w.shdrs, orig_shdrs, orig_shnum * sizeof(Elf64_Shdr));
+	memcpy(w.shstrtab, ctx->map + orig_shdrs[shstrndx].sh_offset,
+	       orig_str_sz);
+
+	w.off = (ehdr.e_shoff + (u64)orig_shnum * sizeof(Elf64_Shdr) ==
+		 ctx->map_size) ? ehdr.e_shoff : ctx->map_size;
+
+	munmap((void *)ctx->map, ctx->map_size);
+	ctx->map = NULL;
+
+	w.fd = open(fname, O_RDWR);
+	if (w.fd < 0)
+		goto out;
+
+	if (append_section(&w, ".lr_unwind_fde", ctx->fdes,
+			   ctx->nr_fdes * sizeof(*ctx->fdes), 4,
+			   SHT_PROGBITS, SHF_ALLOC, 0, 0, 0) < 0 ||
+	    append_section(&w, ".rela.lr_unwind_fde", ctx->fde_relas,
+			   ctx->nr_fdes * sizeof(*ctx->fde_relas), 8,
+			   SHT_RELA, SHF_INFO_LINK, ctx->symtab_shndx,
+			   fde_shndx, sizeof(Elf64_Rela)) < 0 ||
+	    (ctx->nr_ranges &&
+	     append_section(&w, ".lr_unwind_ranges", ctx->ranges,
+			    ctx->nr_ranges * sizeof(*ctx->ranges), 2,
+			    SHT_PROGBITS, SHF_ALLOC, 0, 0, 0) < 0))
+		goto out;
+
+	if (pwrite_all(w.fd, w.shstrtab, w.str_sz, w.off) < 0)
+		goto out;
+	w.shdrs[shstrndx].sh_offset = w.off;
+	w.shdrs[shstrndx].sh_size = w.str_sz;
+	w.off = align_up(w.off + w.str_sz, 8);
+
+	if (ehdr.e_shnum == SHN_UNDEF || w.shnum >= SHN_LORESERVE) {
+		ehdr.e_shnum = SHN_UNDEF;
+		w.shdrs[0].sh_size = w.shnum;
+	} else {
+		ehdr.e_shnum = w.shnum;
+	}
+	ehdr.e_shoff = w.off;
+
+	if (pwrite_all(w.fd, w.shdrs, w.shnum * sizeof(Elf64_Shdr), w.off) < 0 ||
+	    pwrite_all(w.fd, &ehdr, sizeof(ehdr), 0) < 0 ||
+	    ftruncate(w.fd, w.off + w.shnum * sizeof(Elf64_Shdr)) < 0)
+		goto out;
+
+	ret = 0;
+out:
+	if (w.fd >= 0)
+		close(w.fd);
+	free(w.shstrtab);
+	free(w.shdrs);
+	return ret;
 }
 
 int main(int argc, char *argv[])
-- 
2.56.0.679.gc527c65306-goog

