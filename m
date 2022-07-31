Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BC815D9
	for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 23:27:38 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id s16so1157117ilp.3
        for <llvm@lists.linux.dev>; Sun, 31 Jul 2022 16:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=cB5WuvMsmL6F+p20kPSMg4z0wjNtUJa9fTAIeiqeNtg=;
        b=UwjeSffKQbdKGY38++8RLRXtWE5vnHPXf5aKbUsULqFgamZa7wJBKH/tgNsD/3P/Mb
         TOrhHiAvNZht6t+P5kI00oooFPMX7Ti4RHffhfxaJjmh8jq0j5ObeP/wgg6AsKe098Rm
         Vn27F0jGjclnXhHBz3KqVqiovzMzbaqvyrQoOzpN6vAEW84mkm0w5olUtD5LSJhUvwA1
         5Kpg1MROyplYVMbLlXcB8xq/SXOqIzqWkJyz/gDsBTSxYTECHz75m99rMqlfXYupKHnU
         HDlSpv3ovD6ag/rWdafkKN3LSEFxj6SohCvuK0IQ0f4deggi2e4qJzqzTap7aBOgXf47
         xXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=cB5WuvMsmL6F+p20kPSMg4z0wjNtUJa9fTAIeiqeNtg=;
        b=cxlU7LjzgDRE5BKtBtO0tsgdqS850+Q76Q1Afip9eLCMJJ/9M9JVc4ZSQYFrmmmo4w
         pUHfNO4Ib0O8epAQes002BOSxhKV6WIAcR72r+AnBycJYotAiOvj175sqsyb5E0zpkex
         G6DHGFcP2DOnz+68KYNDTEma5auFUVGOtQiSfCeAfJ0GMuhacXNSmrKSBbVLcX7hCr+R
         TnLRFOshMp7SGNRZEE9XiLkW9xMLdn4UAfI02VXjSJJVNDtBHzv3ZslvrwJLNYyUGSxE
         um/pYJm9q4lvFb6fygUYWfJ2GhF7SvpTLctxUmFLcrOoHmRu/dIp7RPgwwLz7gQT4pSJ
         b5UA==
X-Gm-Message-State: AJIora/mhb0+ymLtm6Pe0yY6dfxcA4QLADfPqtajGgMhSzSWLjSZaEHw
	YtV5YDgUuQPU76q55XdUxsQ=
X-Google-Smtp-Source: AGRyM1t0LOpDqDHWBniiscxsxsIm+A+EEkohFxAgrEOAmTVPyLMMCm+20QPpp0AZwJYHGODQZSIUgQ==
X-Received: by 2002:a92:d606:0:b0:2dc:e2d1:b75b with SMTP id w6-20020a92d606000000b002dce2d1b75bmr5107679ilm.91.1659310057599;
        Sun, 31 Jul 2022 16:27:37 -0700 (PDT)
Received: from james-x399.localdomain (71-33-133-32.hlrn.qwest.net. [71.33.133.32])
        by smtp.gmail.com with ESMTPSA id c189-20020a6bb3c6000000b0067b75781af9sm4995861iof.37.2022.07.31.16.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jul 2022 16:27:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: bpf@vger.kernel.org
Cc: James Hilliard <james.hilliard1@gmail.com>,
	"Jose E . Marchesi" <jose.marchesi@oracle.com>,
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] libbpf: skip empty sections in bpf_object__init_global_data_maps
Date: Sun, 31 Jul 2022 17:26:49 -0600
Message-Id: <20220731232649.4668-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GNU assembler generates an empty .bss section. This is a well
established behavior in GAS that happens in all supported targets.

The LLVM assembler doesn't generate an empty .bss section.

bpftool chokes on the empty .bss section.

Additionally in bpf_object__elf_collect the sec_desc->data is not
initialized when a section is not recognized. In this case, this
happens with .comment.

So we must check that sec_desc->data is initialized before checking
if the size is 0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Cc: Jose E. Marchesi <jose.marchesi@oracle.com>
---
 tools/lib/bpf/libbpf.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
index 50d41815f431..77e3797cf75a 100644
--- a/tools/lib/bpf/libbpf.c
+++ b/tools/lib/bpf/libbpf.c
@@ -1642,6 +1642,10 @@ static int bpf_object__init_global_data_maps(struct bpf_object *obj)
 	for (sec_idx = 1; sec_idx < obj->efile.sec_cnt; sec_idx++) {
 		sec_desc = &obj->efile.secs[sec_idx];
 
+		/* Skip recognized sections with size 0. */
+		if (sec_desc->data && sec_desc->data->d_size == 0)
+			continue;
+
 		switch (sec_desc->sec_type) {
 		case SEC_DATA:
 			sec_name = elf_sec_name(obj, elf_sec_by_idx(obj, sec_idx));
-- 
2.34.1

