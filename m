Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7C7A
	for <llvm@lists.linux.dev>; Sun, 17 Apr 2022 15:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5jUwVyYZeE/z5B4prb0O6qAaF0gWafo0tpkOKRfzLr4=; b=ekqSQozQXoLeeG9W7WCIVfHtZY
	WAQUuUMacvt2rRDBqYkIBLfpjUydU9UR+4NgO07IKgo+3/LQJc5DYDrwHHR1x/hc8P5D50D77rS7K
	Or3xOsf9uwGe2FgbHmwOGZ1hxepN+VC4QB+BYQalOlquXxlEzlsVpiKWR7k4B+9d92E3bHfjFMfTZ
	Yrm+LTjR5vg6wPqy0IL9NbhBe9JwTjlo9JPVrimE/+cA59PX0AKvF6DIqEcFR8W/BnF6xzz/nkw8K
	v+7EpsMasIRGFqn4aR9deBNfMmLDizLdZ2KVKV4yHtKDdHyePbp28+AQagi7/qtBAOY7ZHtKt5f//
	HnvioYCw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ng76H-001Rsg-KF; Sun, 17 Apr 2022 15:46:09 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 184059861C1; Sun, 17 Apr 2022 17:46:09 +0200 (CEST)
Date: Sun, 17 Apr 2022 17:46:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, x86@kernel.org,
	hjl.tools@gmail.com, mbenes@suse.cz, rostedt@goodmis.org,
	linux-toolchains@vger.kernel.org,
	clang-built-linux <llvm@lists.linux.dev>
Subject: Re: The trouble with __weak and objtool got worse
Message-ID: <20220417154609.GD2762@worktop.programming.kicks-ass.net>
References: <YllUqPK4CWZeHku8@hirez.programming.kicks-ass.net>
 <20220415152633.GA2731@worktop.programming.kicks-ass.net>
 <CAKwvOdn1JVxxithobr=15hkumoQ51CjnPSbrq8hYBRm=A3L5kQ@mail.gmail.com>
 <20220415182130.iltk2uxnubeaa4nk@treble>
 <20220416104809.GC2731@worktop.programming.kicks-ass.net>
 <20220416160742.6g4nejji4xyrgpvp@treble>
 <20220417154422.GH2731@worktop.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220417154422.GH2731@worktop.programming.kicks-ass.net>

On Sun, Apr 17, 2022 at 05:44:22PM +0200, Peter Zijlstra wrote:
> On Sat, Apr 16, 2022 at 09:07:42AM -0700, Josh Poimboeuf wrote:
> 
> > I guess objtool will need to bite the bullet and create section symbols.
> 

Which then led to..

I'll properly post the patches on Tue, once this easter thing has run
it's course and we're actually working again, ha!

---
Subject: objtool: Fix type of reloc::addend
From: Peter Zijlstra <peterz@infradead.org>
Date: Sun Apr 17 17:03:40 CEST 2022

Elf{32,64}_Rela::r_addend is of type: Elf{32,64}_Sword, that means
that out reloc::addend needs to be long or face tuncation issues when
we do elf_rebuild_rel_reloc_sections():

  - 107:  48 b8 00 00 00 00 00 00 00 00   movabs $0x0,%rax        109: R_X86_64_64        level4_kernel_pgt+0x80000067
  + 107:  48 b8 00 00 00 00 00 00 00 00   movabs $0x0,%rax        109: R_X86_64_64        level4_kernel_pgt-0x7fffff99

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 tools/objtool/check.c               |    8 ++++----
 tools/objtool/elf.c                 |    2 +-
 tools/objtool/include/objtool/elf.h |    4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -560,12 +560,12 @@ static int add_dead_ends(struct objtool_
 		else if (reloc->addend == reloc->sym->sec->sh.sh_size) {
 			insn = find_last_insn(file, reloc->sym->sec);
 			if (!insn) {
-				WARN("can't find unreachable insn at %s+0x%x",
+				WARN("can't find unreachable insn at %s+0x%lx",
 				     reloc->sym->sec->name, reloc->addend);
 				return -1;
 			}
 		} else {
-			WARN("can't find unreachable insn at %s+0x%x",
+			WARN("can't find unreachable insn at %s+0x%lx",
 			     reloc->sym->sec->name, reloc->addend);
 			return -1;
 		}
@@ -595,12 +595,12 @@ static int add_dead_ends(struct objtool_
 		else if (reloc->addend == reloc->sym->sec->sh.sh_size) {
 			insn = find_last_insn(file, reloc->sym->sec);
 			if (!insn) {
-				WARN("can't find reachable insn at %s+0x%x",
+				WARN("can't find reachable insn at %s+0x%lx",
 				     reloc->sym->sec->name, reloc->addend);
 				return -1;
 			}
 		} else {
-			WARN("can't find reachable insn at %s+0x%x",
+			WARN("can't find reachable insn at %s+0x%lx",
 			     reloc->sym->sec->name, reloc->addend);
 			return -1;
 		}
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -546,7 +546,7 @@ static struct section *elf_create_reloc_
 						int reltype);
 
 int elf_add_reloc(struct elf *elf, struct section *sec, unsigned long offset,
-		  unsigned int type, struct symbol *sym, int addend)
+		  unsigned int type, struct symbol *sym, long addend)
 {
 	struct reloc *reloc;
 
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -73,7 +73,7 @@ struct reloc {
 	struct symbol *sym;
 	unsigned long offset;
 	unsigned int type;
-	int addend;
+	long addend;
 	int idx;
 	bool jump_table_start;
 };
@@ -135,7 +135,7 @@ struct elf *elf_open_read(const char *na
 struct section *elf_create_section(struct elf *elf, const char *name, unsigned int sh_flags, size_t entsize, int nr);
 
 int elf_add_reloc(struct elf *elf, struct section *sec, unsigned long offset,
-		  unsigned int type, struct symbol *sym, int addend);
+		  unsigned int type, struct symbol *sym, long addend);
 int elf_add_reloc_to_insn(struct elf *elf, struct section *sec,
 			  unsigned long offset, unsigned int type,
 			  struct section *insn_sec, unsigned long insn_off);
