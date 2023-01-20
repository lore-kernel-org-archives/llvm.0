Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62925613A
	for <llvm@lists.linux.dev>; Fri, 20 Jan 2023 20:12:26 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so4508189wmc.1
        for <llvm@lists.linux.dev>; Fri, 20 Jan 2023 12:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2CXoT+7bD2FQOsPsa6Nm9x3leNHttFwc0jUiST/FDec=;
        b=jYVfOpBwMOY714CycyIDi5phhr+sGl8XFKrtrwoKPI8/cF2qPGeKF7HFnSjRs9sF2G
         vSAkkju1qImtBph0Ru2ydl1lS6ZBAkJSmVHkbU/eETfHDGoIg2PREqxP37e7ShjfFOPG
         i+MYM1vTmo88i37YM+hyUi5/TrYugRkdRbKRdM+Ya9YI1x5zqKUGoKcKSB1ihSIq4wvV
         MPHw9PyRXOm6uu6VDE8okQkgGKPuVfRxbTghwDdAO/XYgNIvy99+1CvpraRPydIuRHJt
         dtVo8oho0c66c2zWLK7tLu1WfzkjR9SMzZZtnFMGlL3olxmeiXQzHVvpsdakhtfkmkbj
         58Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2CXoT+7bD2FQOsPsa6Nm9x3leNHttFwc0jUiST/FDec=;
        b=bvqlP1VF+TEHmX+DSOrpPbVCpdoeEhykUj8PhYyGwAuFaNulBpq/XQj2ITbryVQ27n
         PJtrUhJ8st7AFIZ2ghYyoJHcobZ8teIOs1ndn4oeN8N+P7e7SGlL51eJPL4U4vE+es3/
         nzfw0K5fTw47AKsBorrB17AbIxCQXykd41qIuQy7EJVmgTWsPXkGuHJgASZKPmCh8gLf
         X243cQCCx+bkiTw/Ja2Zr7tlKie+5HMBs59Pz288ZlsbYHj24QfpOHAHKewIaWZJ9+Ij
         8UdnSz+xrwp5x0nTTExOnjAAItToWZIIZ0rZ6x1u4y1SJO2v0OY+HsAX120heA3rALAo
         kR8g==
X-Gm-Message-State: AFqh2kqsLnPgIi8GYBjtALBUGmcF1UZYkS+aINMuxRF3h2mmC03Uz9Wi
	WuPPDlwflJlpxFKK6DlxwzM=
X-Google-Smtp-Source: AMrXdXt9spc3ed6XX0v36+wnwgpldLEnjdXbePpeGPxvGzCLI4xzHXhDIo6NrWCBOQQrJefwC7mgmw==
X-Received: by 2002:a05:600c:4a27:b0:3db:3ef:2369 with SMTP id c39-20020a05600c4a2700b003db03ef2369mr15670901wmp.40.1674245544573;
        Fri, 20 Jan 2023 12:12:24 -0800 (PST)
Received: from localhost.localdomain ([2a02:3035:413:205e:4a24:a1a0:2076:6b5c])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b003daff80f16esm4711645wmg.27.2023.01.20.12.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 12:12:21 -0800 (PST)
From: Sedat Dilek <sedat.dilek@gmail.com>
To: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	llvm@lists.linux.dev
Cc: Sedat Dilek <sedat.dilek@gmail.com>,
	Yonghong Song <yhs@meta.com>
Subject: [PATCH] dwarf_loader: Sync with LINUX_ELFNOTE_LTO_INFO macro from kernel
Date: Fri, 20 Jan 2023 21:12:03 +0100
Message-Id: <20230120201203.10785-1-sedat.dilek@gmail.com>
X-Mailer: git-send-email 2.39.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As long as I am using CONFIG_DEBUG_INFO_BTF=y with LLVM/Clang
I have noticed the below macros where defined unconsistently.

See here pahole latest Git...

[ pahole:dwarf_loader ]

/* Match the define in linux:include/linux/elfnote.h */
#define LINUX_ELFNOTE_BUILD_LTO                0x101

...and latest Linus v6.2-rc4+ Git:

[ linux:include/linux/elfnote-lto.h ]

#define LINUX_ELFNOTE_LTO_INFO         0x101

Yonghong Song says:
> Ya, LINUX_ELFNOTE_BUILD_LTO is initially proposed macro name but later
> the formal kernel patch used LINUX_ELFNOTE_LTO_INFO. Could you submit
> a pahole for this so it is consistent with kernel? Thanks!

Fix this by syncing the pahole macro with the one from linux-kernel.

Suggested-by: Yonghong Song <yhs@meta.com>
Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 dwarf_loader.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/dwarf_loader.c b/dwarf_loader.c
index 5a74035c5708..96ce5db4f5bc 100644
--- a/dwarf_loader.c
+++ b/dwarf_loader.c
@@ -2808,8 +2808,8 @@ static int __cus__load_debug_types(struct conf_load *conf, Dwfl_Module *mod, Dwa
 	return 0;
 }
 
-/* Match the define in linux:include/linux/elfnote.h */
-#define LINUX_ELFNOTE_BUILD_LTO		0x101
+/* Match the define in linux:include/linux/elfnote-lto.h */
+#define LINUX_ELFNOTE_LTO_INFO		0x101
 
 static bool cus__merging_cu(Dwarf *dw, Elf *elf)
 {
@@ -2827,7 +2827,7 @@ static bool cus__merging_cu(Dwarf *dw, Elf *elf)
 			size_t name_off, desc_off, offset = 0;
 			GElf_Nhdr hdr;
 			while ((offset = gelf_getnote(data, offset, &hdr, &name_off, &desc_off)) != 0) {
-				if (hdr.n_type != LINUX_ELFNOTE_BUILD_LTO)
+				if (hdr.n_type != LINUX_ELFNOTE_LTO_INFO)
 					continue;
 
 				/* owner is Linux */
-- 
2.39.0

