Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794890117;
	b=mc5Cd6+GXkEmxrzOQkpHUmWOAp/FovmSaR38gtTb4k1vIAeyfWIzg+D7Xvtgns8R9mc+
	 Wc7/KK1YxcbQU/JVwwouA1jIvRBNmzDf1PL9HWk7LsSd4dHlZ1OyWlj8MDUTWnmoqL5Th
	 j9atyR7rkyvE6qNhUBXZALqXG+Dag0YaHCBB4sjOgakEvAGS/99zu4GrNyhwcLpBA6kMA
	 L2psdSgr9rNFfZvhXiVkpE2qVCuitnJqSxjrfdqVtBzDK9FLw3uyziWJDSGN9UnacPTY3
	 XXScnuOGzRbDj8mi/uZcIhHBy7gm4QDW82yL9YH59FNdSY5t9Jx0aARIC7q4UTWoxog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794890117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=T9/NqaAntZwSlf5Fz/R2wLuVPSPsxm3+6aPKCupi3FE=;
	b=hFBjGI3bpKFNmuV3WrBeKbSoOeOB8SHnTqmLX1DxupXR/LtGUhxchsmVAR75c7iRuye+
	 5xYAICj+RXXb3nlsv/VkTHK/lB1v49/2gsAO+UmXPL5y0cTOTywSZgo02l5Kc+OZk78ql
	 sfEgX6kubV2DPa1F+b236qtVfs5EIfKGbTdSAUhDG31HL/8sdbXIaQl+LdKNLkjGFyGfA
	 /b+MoXvsya01cB4u4n3JG7DoYHT/vXjq+3eSzWGxDBmH4CaqwTF6wruhBSHquNZx27SEF
	 QI1/0NGNHiA91pdoiDj6luTmLj4FPjzrHg29sLf1aIKjHzbU2tQT+BbLpOPVSW0eB8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NV7438SM;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D5E606A89E
	for <llvm@lists.linux.dev>; Tue, 17 Nov 2026 04:35:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1D5E606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NV7438SM
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b0a528ca65so3699459a91.0
        for <llvm@lists.linux.dev>; Mon, 16 Nov 2026 20:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794890116; x=1795494916; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T9/NqaAntZwSlf5Fz/R2wLuVPSPsxm3+6aPKCupi3FE=;
        b=NV7438SMy4rdoITi2rZ+exD76GbMG03gVCdudvXh717BLD4diZNIKzhEWZ9xX2K9UI
         /ffR9EHZzfh2piLcfqdWmwYflhXSOKUvZL/K8oCNtmEfIxqbnX8mBtFd4HHCPeCubGBF
         SlusJuq1Ew4ruESkStRc9yB41fBNgm884Vkfp1CV0fPaUGV8qkuODMIA+NgW6eGVJSVM
         VHo1J0Ns7JHHaWoSKsfTZ21LSOa6OjMYK6XBJkvlNRjFopCf0pxQ5NdQywflg4uTUHyB
         Q/Yt8RxD5J2yZCj5NhA5bhJWpzYTGb7Un3qkeWg4w0TZjOK0cYrn6KI1oNggn73AZI+Q
         Bidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794890116; x=1795494916;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T9/NqaAntZwSlf5Fz/R2wLuVPSPsxm3+6aPKCupi3FE=;
        b=ROp2a9NhYvHJhZkyc75HEjaRitU+M7li6Bl39U0++da/ipJdFsIejp6R+wfy9XEH14
         fpxIaeXq8nueqUy3964nCCspNhFV5oVWxs9zv/QGjqz8iEGd0t97IVnyfRXz/31OK1Zl
         MS3TvpjXVfCJPS75hb4BHTwFuMKnJC56fv/X1Pip47+YQyokLOKf83Hi89BRf6vJdbpK
         yuPsJL1HHnj7vRZ7vg2QzLzJk3zLtYLgTw+HEclJ+1XrsUbrVEiItTIf9BSDOI+QzUkm
         gbYcqsOEbhPELU+PWAeQcDkXaRV3R57A137AbairKHPxtwuQHvJHQmC2ogq27uVSK12/
         O1dg==
X-Forwarded-Encrypted: i=1; AL+hErEUmoUWYK41orvMTjCucJNn9jFWU2lPxLnXSRDHnT0EynDaPmlj7VonXxd3/KBg96/5XVyD@lists.linux.dev
X-Gm-Message-State: APuU4Z+OwLPMSP5667eeLZ5qjBDJ1eA4dziBJScsc+j1B4dPZwzxeFP2
	biGfAgi1vEIVxrOGlMr9P2wlpttKctombjcoQ8TUUi6XOzd1DlgsJYpIyZYqAtAHlje1Pw/IB0+
	pvn3siWe8P8jbrluI9Cdi2vO5uw==
X-Received: from plqw18.prod.google.com ([2002:a17:902:a712:b0:2e9:4ce7:154a])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f710:b0:2e8:93b1:49cc with SMTP id d9443c01a7336-2ee0dc2a5a9mr131239395ad.35.1794890115946;
 Mon, 16 Nov 2026 20:35:15 -0800 (PST)
Date: Tue, 17 Nov 2026 04:34:58 +0000
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
Message-ID: <20261117043504.1021063-7-dylanbhatch@google.com>
Subject: [RFC PATCH 06/12] scripts/gen_lr_unwind: add --dump option to inspect
 .lr_unwind tables
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

Add a --dump (-d) flag to scripts/gen_lr_unwind to dump .lr_unwind FDEs
and instruction ranges in human-readable format. Support dumping both
linked/post-processed objects containing .lr_unwind_fde and individual
relocatable .o files containing only .eh_frame.

Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
---
 scripts/gen_lr_unwind.c | 268 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 257 insertions(+), 11 deletions(-)

diff --git a/scripts/gen_lr_unwind.c b/scripts/gen_lr_unwind.c
index f65edd86ac78c..2058601ec6135 100644
--- a/scripts/gen_lr_unwind.c
+++ b/scripts/gen_lr_unwind.c
@@ -35,6 +35,8 @@ struct lr_unwind_ctx {
 	const Elf64_Shdr *eh_sec;
 	const Elf64_Shdr *rela_eh_sec;
 	const Elf64_Shdr *fde_sec;
+	const Elf64_Shdr *rela_fde_sec;
+	const Elf64_Shdr *ranges_sec;
 	unsigned int	symtab_shndx;
 
 	const Elf64_Rela *eh_relas;
@@ -67,6 +69,13 @@ struct elf_writer {
 	size_t		str_sz;
 };
 
+struct dump_sym {
+	u64		addr;
+	unsigned int	shndx;
+	bool		is_func;
+	const char	*name;
+};
+
 static int append_fde_entry(struct lr_unwind_ctx *ctx,
 			    const Elf64_Rela *eh_rela,
 			    s64 byte_off, u32 desc)
@@ -478,6 +487,225 @@ static int emit_lr_unwind_sections(const char *fname, struct lr_unwind_ctx *ctx,
 	return ret;
 }
 
+static int cmp_dump_sym(const void *a, const void *b)
+{
+	const struct dump_sym *sa = a, *sb = b;
+
+	if (sa->shndx != sb->shndx)
+		return sa->shndx < sb->shndx ? -1 : 1;
+	if (sa->addr != sb->addr)
+		return sa->addr < sb->addr ? -1 : 1;
+	if (sa->is_func != sb->is_func)
+		return sa->is_func ? 1 : -1;
+	return 0;
+}
+
+static const struct dump_sym *find_dump_sym(const struct dump_sym *syms,
+					    size_t nr_syms,
+					    unsigned int shndx, u64 addr)
+{
+	size_t lo = 0, hi = nr_syms;
+	const struct dump_sym *best = NULL;
+
+	while (lo < hi) {
+		size_t mid = lo + (hi - lo) / 2;
+		const struct dump_sym *s = &syms[mid];
+
+		if ((shndx && s->shndx < shndx) ||
+		    ((!shndx || s->shndx == shndx) && s->addr <= addr)) {
+			if (!shndx || s->shndx == shndx)
+				best = s;
+			lo = mid + 1;
+		} else {
+			hi = mid;
+		}
+	}
+
+	return best;
+}
+
+static const char *mode_name(enum lr_unwind_mode mode)
+{
+	switch (mode) {
+	case LR_UNWIND_LIVE:
+		return "LIVE";
+	case LR_UNWIND_FP:
+		return "FP";
+	case LR_UNWIND_SP:
+		return "SP";
+	default:
+		return "UNKNOWN";
+	}
+}
+
+static int dump_lr_unwind(struct lr_unwind_ctx *ctx, const Elf64_Shdr *shdrs,
+			  unsigned int shnum, const char *shstrtab)
+{
+	const struct lr_fde *fdes;
+	const Elf64_Rela *relas = NULL;
+	const lr_range_t *ranges = NULL;
+	size_t nr_fdes, nr_ranges = 0;
+	const Elf64_Sym *elf_syms = NULL;
+	size_t nr_elf_syms = 0;
+	const char *strtab = NULL;
+	struct dump_sym *dsyms = NULL;
+	size_t nr_dsyms = 0;
+	bool is_rel = (((const Elf64_Ehdr *)ctx->map)->e_type == ET_REL);
+
+	if (ctx->fde_sec) {
+		fdes = ctx->map + ctx->fde_sec->sh_offset;
+		nr_fdes = ctx->fde_sec->sh_size / sizeof(struct lr_fde);
+		if (ctx->rela_fde_sec)
+			relas = ctx->map + ctx->rela_fde_sec->sh_offset;
+		if (ctx->ranges_sec) {
+			ranges = ctx->map + ctx->ranges_sec->sh_offset;
+			nr_ranges = ctx->ranges_sec->sh_size / sizeof(lr_range_t);
+		}
+	} else {
+		if (!ctx->eh_sec || !ctx->rela_eh_sec || !ctx->symtab_shndx) {
+			fprintf(stderr, "No .lr_unwind_fde or .eh_frame section found\n");
+			return -1;
+		}
+		if (parse_eh_frame(ctx) < 0)
+			return -1;
+		fdes = ctx->fdes;
+		nr_fdes = ctx->nr_fdes;
+		relas = ctx->fde_relas;
+		ranges = ctx->ranges;
+		nr_ranges = ctx->nr_ranges;
+	}
+
+	if (ctx->symtab_shndx) {
+		const Elf64_Shdr *sym_sec = &shdrs[ctx->symtab_shndx];
+
+		elf_syms = ctx->map + sym_sec->sh_offset;
+		nr_elf_syms = sym_sec->sh_size / sizeof(Elf64_Sym);
+		strtab = ctx->map + shdrs[sym_sec->sh_link].sh_offset;
+
+		dsyms = malloc(nr_elf_syms * sizeof(*dsyms));
+		if (!dsyms)
+			return -1;
+
+		for (size_t i = 0; i < nr_elf_syms; i++) {
+			const Elf64_Sym *s = &elf_syms[i];
+			unsigned char type = ELF64_ST_TYPE(s->st_info);
+			const char *name = strtab + s->st_name;
+
+			if (s->st_shndx == SHN_UNDEF ||
+			    s->st_shndx >= SHN_LORESERVE)
+				continue;
+			if (type != STT_FUNC && type != STT_NOTYPE)
+				continue;
+			if (!name[0] || name[0] == '$' ||
+			    !strncmp(name, ".L", 2))
+				continue;
+
+			dsyms[nr_dsyms++] = (struct dump_sym){
+				.addr = s->st_value,
+				.shndx = is_rel ? s->st_shndx : 0,
+				.is_func = (type == STT_FUNC),
+				.name = name,
+			};
+		}
+
+		qsort(dsyms, nr_dsyms, sizeof(*dsyms), cmp_dump_sym);
+	}
+
+	for (size_t i = 0; i < nr_fdes; i++) {
+		const struct lr_fde *fde = &fdes[i];
+		u32 desc = fde->range_desc;
+		u32 sp_off = LR_FDE_SP_OFF_BYTES(desc);
+		lr_range_t inline_ranges[4];
+		const lr_range_t *r_list;
+		u32 r_cnt, total_insns = 0, insn_off = 0;
+
+		if (desc & LR_FDE_INLINE) {
+			lr_fde_unpack_inline(desc, inline_ranges);
+			r_list = inline_ranges;
+			r_cnt = 4;
+		} else {
+			u32 idx = LR_OOL_IDX(desc);
+
+			r_cnt = LR_OOL_COUNT(desc);
+			if (idx + r_cnt > nr_ranges) {
+				free(dsyms);
+				return -1;
+			}
+			r_list = &ranges[idx];
+		}
+
+		for (u32 j = 0; j < r_cnt; j++)
+			total_insns += LR_RANGE_LEN(r_list[j]);
+
+		printf("FDE[%zu] ", i);
+		if (relas && elf_syms) {
+			u32 sym_idx = ELF64_R_SYM(relas[i].r_info);
+
+			if (sym_idx < nr_elf_syms) {
+				const Elf64_Sym *sym = &elf_syms[sym_idx];
+				unsigned int shndx = sym->st_shndx;
+				u64 off = sym->st_value + relas[i].r_addend;
+
+				if (shndx < shnum && shndx < SHN_LORESERVE) {
+					const char *sec_name =
+						shstrtab + shdrs[shndx].sh_name;
+					const struct dump_sym *ds =
+						find_dump_sym(dsyms, nr_dsyms,
+							      shndx, off);
+
+					if (ds)
+						printf("%s+0x%lx <%s+0x%lx>",
+						       sec_name,
+						       (unsigned long)off,
+						       ds->name,
+						       (unsigned long)(off - ds->addr));
+					else
+						printf("%s+0x%lx", sec_name,
+						       (unsigned long)off);
+				}
+			}
+		} else if (ctx->fde_sec) {
+			u64 field_addr = ctx->fde_sec->sh_addr +
+					 i * sizeof(struct lr_fde);
+			u64 pc = field_addr + (s64)fde->start_offset;
+			const struct dump_sym *ds =
+				find_dump_sym(dsyms, nr_dsyms, 0, pc);
+
+			if (ds)
+				printf("0x%016lx <%s+0x%lx>", (unsigned long)pc,
+				       ds->name, (unsigned long)(pc - ds->addr));
+			else
+				printf("0x%016lx", (unsigned long)pc);
+		}
+
+		if (desc & LR_FDE_INLINE)
+			printf(" (len=0x%x, inline, sp_off=0x%x):\n",
+			       total_insns << 2, sp_off);
+		else
+			printf(" (len=0x%x, ool[%u..%u), sp_off=0x%x):\n",
+			       total_insns << 2, LR_OOL_IDX(desc),
+			       LR_OOL_IDX(desc) + r_cnt, sp_off);
+
+		for (u32 j = 0; j < r_cnt; j++) {
+			u32 len = LR_RANGE_LEN(r_list[j]);
+			enum lr_unwind_mode mode = LR_RANGE_MODE(r_list[j]);
+
+			if (!len)
+				continue;
+			printf("  [+0x%04x..+0x%04x) %4u insns  %s",
+			       insn_off << 2, (insn_off + len) << 2,
+			       len, mode_name(mode));
+			if (mode == LR_UNWIND_SP)
+				printf(" (sp+0x%x)", sp_off);
+			printf("\n");
+			insn_off += len;
+		}
+	}
+
+	free(dsyms);
+	return 0;
+}
+
 int main(int argc, char *argv[])
 {
 	struct lr_unwind_ctx ctx = { 0 };
@@ -485,22 +713,29 @@ int main(int argc, char *argv[])
 	const Elf64_Ehdr *ehdr;
 	const Elf64_Shdr *shdrs;
 	const char *shstrtab;
+	const char *fname;
+	bool dump = false;
 	struct stat sb;
 	int fd, ret = 1;
 
-	if (argc != 2) {
-		fprintf(stderr, "Usage: %s <file>\n", argv[0]);
+	if (argc == 3 && (!strcmp(argv[1], "--dump") || !strcmp(argv[1], "-d"))) {
+		dump = true;
+		fname = argv[2];
+	} else if (argc == 2 && argv[1][0] != '-') {
+		fname = argv[1];
+	} else {
+		fprintf(stderr, "Usage: %s [--dump] <file>\n", argv[0]);
 		return 1;
 	}
 
-	fd = open(argv[1], O_RDONLY);
+	fd = open(fname, O_RDONLY);
 	if (fd < 0) {
 		fprintf(stderr, "gen_lr_unwind: cannot open %s: %s\n",
-			argv[1], strerror(errno));
+			fname, strerror(errno));
 		return 1;
 	}
 	if (fstat(fd, &sb) < 0 || (size_t)sb.st_size < sizeof(Elf64_Ehdr)) {
-		fprintf(stderr, "gen_lr_unwind: invalid file %s\n", argv[1]);
+		fprintf(stderr, "gen_lr_unwind: invalid file %s\n", fname);
 		close(fd);
 		return 1;
 	}
@@ -510,7 +745,7 @@ int main(int argc, char *argv[])
 	close(fd);
 	if (ctx.map == MAP_FAILED) {
 		fprintf(stderr, "gen_lr_unwind: mmap failed on %s: %s\n",
-			argv[1], strerror(errno));
+			fname, strerror(errno));
 		return 1;
 	}
 
@@ -518,10 +753,12 @@ int main(int argc, char *argv[])
 	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG) ||
 	    ehdr->e_ident[EI_CLASS] != ELFCLASS64 ||
 	    ehdr->e_ident[EI_DATA] != ELFDATA2LSB ||
-	    ehdr->e_type != ET_REL ||
+	    (!dump && ehdr->e_type != ET_REL) ||
+	    (dump && ehdr->e_type != ET_REL && ehdr->e_type != ET_EXEC &&
+	     ehdr->e_type != ET_DYN) ||
 	    ehdr->e_machine != EM_AARCH64) {
-		fprintf(stderr, "gen_lr_unwind: %s is not an AArch64 ET_REL ELF\n",
-			argv[1]);
+		fprintf(stderr, "gen_lr_unwind: unsupported ELF file %s\n",
+			fname);
 		goto out;
 	}
 
@@ -536,6 +773,10 @@ int main(int argc, char *argv[])
 
 		if (!strcmp(name, ".lr_unwind_fde"))
 			ctx.fde_sec = &shdrs[i];
+		else if (!strcmp(name, ".rela.lr_unwind_fde"))
+			ctx.rela_fde_sec = &shdrs[i];
+		else if (!strcmp(name, ".lr_unwind_ranges"))
+			ctx.ranges_sec = &shdrs[i];
 		else if (!strcmp(name, ".eh_frame") ||
 			 !strcmp(name, ".init.eh_frame"))
 			ctx.eh_sec = &shdrs[i];
@@ -546,6 +787,11 @@ int main(int argc, char *argv[])
 			ctx.symtab_shndx = i;
 	}
 
+	if (dump) {
+		ret = dump_lr_unwind(&ctx, shdrs, shnum, shstrtab) ? 1 : 0;
+		goto out;
+	}
+
 	if (ctx.fde_sec) {
 		ret = 0;
 		goto out;
@@ -558,11 +804,11 @@ int main(int argc, char *argv[])
 
 	if (!parse_eh_frame(&ctx) &&
 	    (!ctx.nr_fdes ||
-	     !emit_lr_unwind_sections(argv[1], &ctx, shnum, shstrndx)))
+	     !emit_lr_unwind_sections(fname, &ctx, shnum, shstrndx)))
 		ret = 0;
 	else
 		fprintf(stderr, "gen_lr_unwind: failed to generate .lr_unwind for %s\n",
-			argv[1]);
+			fname);
 
 out:
 	if (ctx.map)
-- 
2.56.0.679.gc527c65306-goog

