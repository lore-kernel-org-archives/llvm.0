Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8533FDD
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 01:33:06 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id e16so13178771qtq.6
        for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 17:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MoWm32zvhEyqRVmUpa5LXZEYybwAAQFRmq/wU8a+Gt4=;
        b=EgGzc5rt8LRF5c2Eif2fVlYrh9HTecIoACGjTA6wXsMIE5Cq6qPShWc2VkeRIbLQLJ
         NzdWdQo2IAl4ibTNTDpXspNbyJX8M4MXNhOrJdH7s1L6p52qZ4QQmdA9tPnPO84GtTBx
         t7MPx8RQAxDA9goxsppgIVZ+UrbAWYJM/6BsuBOZkSZXcDSdMWpTIxG/j+/nhuMs3Lqj
         3/1dB0rzc7uOB2csLmqRxJfM1rzyDgXH68UG9wViOR32SdzStDiwpIWGxdl9ILrg8+5K
         qn0HtVvCShbOisPior89CQpUSaHiw49SefIEMrjQqmB2DRVai7BMhol9HGp4yJaVyAvZ
         B1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MoWm32zvhEyqRVmUpa5LXZEYybwAAQFRmq/wU8a+Gt4=;
        b=jYcSxLkfv/RKitv+T/bN2JrFBd9/z0dp1I1q30rHuOoGhNXx3LCcQJ6Nty8uGRlJvh
         3jsGJe0TTxfyLkB9lp2eQBhBnPmG75HQu3BcVvoF+z3wDoaL7nWUWgeE0OJp6xX2sLKP
         gCp4RU7m9munI5TH6hBio9xXxLwMHuetp3AOYlQmRp0DQlawjaqdv6iT0Fazd2kdmbyZ
         +LHJzsBde6ajyjTV7xOVHKknAv9cYVO7JIK52QVjZTJ6ASeoSUvWNoWbujuolKC9T9T6
         aS6AMn048k6FZLpku8dUr1LV/NNZSnbnchN/VQXKHiGakeB5WkRfeAGPtSkfx05mTQLC
         nPEw==
X-Gm-Message-State: AOAM530+tOg2r26PUZT+6sfuPN56xm/4YmNOHBH3Mvd+6mqclIl1lOui
	4MQQHxfMyf2Hq8J6FioBndQ=
X-Google-Smtp-Source: ABdhPJx9XbvUrAI3Emn6dngj5AmQ9NNxFJ3HrnmEE5AIo9Ak4wHhNAJY3XZGyeDXTS4yuiTX27NoKw==
X-Received: by 2002:a05:622a:1881:: with SMTP id v1mr17345340qtc.683.1643679185259;
        Mon, 31 Jan 2022 17:33:05 -0800 (PST)
Received: from WRT-WX9.. ([207.246.89.135])
        by smtp.gmail.com with ESMTPSA id v73sm9272458qkb.51.2022.01.31.17.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 17:33:04 -0800 (PST)
From: Changbin Du <changbin.du@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Changbin Du <changbin.du@gmail.com>
Subject: [PATCH] kallsyms: ignore all local labels prefixed by '.L'
Date: Tue,  1 Feb 2022 09:32:57 +0800
Message-Id: <20220201013257.17926-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The llvm compiler can generate lots of local labels ('.LBB', '.Ltmpxxx',
'.L__unnamed_xx', etc.). These symbols usually are useless for debugging.
And they might overlap with handwritten symbols.

Before this change, a dumpstack shows a local symbol for epc:
[    0.040341][    T0] Hardware name: riscv-virtio,qemu (DT)
[    0.040376][    T0] epc : .LBB6_14+0x22/0x6a
[    0.040452][    T0]  ra : restore_all+0x12/0x6e

The simple solution is that we can ignore all local labels prefixed by '.L'.
For handwritten symbols which need to be preserved should drop the '.L'
prefix.

After this change, the C defined symbol is shown so we can locate the
problematical code immediately:
[    0.035795][    T0] Hardware name: riscv-virtio,qemu (DT)
[    0.036332][    T0] epc : trace_hardirqs_on+0x54/0x13c
[    0.036567][    T0]  ra : restore_all+0x12/0x6e

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 54ad86d13784..8caabddf817c 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -108,7 +108,7 @@ static bool is_ignored_symbol(const char *name, char type)
 	/* Symbol names that begin with the following are ignored.*/
 	static const char * const ignored_prefixes[] = {
 		"$",			/* local symbols for ARM, MIPS, etc. */
-		".LASANPC",		/* s390 kasan local symbols */
+		".L",			/* local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.LASANPC, etc. */
 		"__crc_",		/* modversions */
 		"__efistub_",		/* arm64 EFI stub namespace */
 		"__kvm_nvhe_",		/* arm64 non-VHE KVM namespace */
-- 
2.32.0

