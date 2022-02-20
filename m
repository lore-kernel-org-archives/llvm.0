Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4827E7B
	for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 14:46:16 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id v13-20020a17090ac90d00b001b87bc106bdso16588269pjt.4
        for <llvm@lists.linux.dev>; Sun, 20 Feb 2022 06:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qgS6kerTVTZEPFtaozzEk5NaV1/XOee+v1wXFW66chg=;
        b=MkLnXQKr78XNHNQr64gTtkQWR05yMzArP/ZN4yRNkp/aCkE6XAIaQ0et4cpTSRNlQm
         G3meRKU7vxGidfyORZ0zXyGeR+yPAaUhmpiCj3StrD6EWFsweXF05woJTogMJjJx2AoM
         A5VkNbKigWVQbCv2+yCMgEhJB+bW4n8vocbmbf9hOuM+/tageUMWyRnpRAMrYH+aGegH
         ax3f/OLftPdoaD1YsFdM/5SqbgZHU/g2264Hy9PaYGf20kZdi6NY97lXhOkC3ypNoXyt
         7Ji3F3sOXK1Xv6ZKXUlVQreDVG5fqImLkvtWWoc08X0o0so2aILqOHgFhsiyXl7A4MnG
         VuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qgS6kerTVTZEPFtaozzEk5NaV1/XOee+v1wXFW66chg=;
        b=h6Gp4H4YTnvHPoedIp87IydrwM+5Op8/8s/vXQ+X6mlQXk5itRcBwIkFUgaFIaZolG
         ftzGBz9tamV6W7M1kUY6vZF4YnCjpsbvKCLXiyzn1da72HKL8I4XiOejuXeJD5KwPmKS
         vtaRORdjtJWGwnNvuG010pgMDfq4nnvmxdiRV11AhUhKYiKZ5T4FtuLtKAtUUkulBsQB
         7UGdq7FBUt5SXdwBQc5ZvdZA98BYEz8t6r7o0/HpPoxvIfA8QJgNvVjPpSyySYLHz8xN
         npK7/Mxt/grm9c28TRg12eDXjQCz/wnd6lw/fXVp09E//yLPrXieLHcXxVrd+mCs9+mj
         kWCg==
X-Gm-Message-State: AOAM533XVhloWkhfa608OZszmIlzKlGEHNa6DLlGbPSkF6Zv743fWiGx
	ryDsTt6IoED3+W4T97GXGvA=
X-Google-Smtp-Source: ABdhPJzVc7ivye/E72EOMqhrW2buJQ81swrxWqxFysdx9zCsNin/OGuT/XqyKOiY6AbOgVYofqHtFA==
X-Received: by 2002:a17:903:11cf:b0:14d:654b:b559 with SMTP id q15-20020a17090311cf00b0014d654bb559mr15382653plh.164.1645368375559;
        Sun, 20 Feb 2022 06:46:15 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9005:88cd:8c59:45e5:31c:c418])
        by smtp.gmail.com with ESMTPSA id i17sm15079540pgn.82.2022.02.20.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 06:46:15 -0800 (PST)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: clm@fb.com,
	josef@toxicpanda.com,
	dsterba@suse.com,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	"Souptick Joarder (HPE)" <jrdr.linux@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] btrfs: Initialize ret to 0 in scrub_simple_mirror()
Date: Sun, 20 Feb 2022 20:16:06 +0530
Message-Id: <20220220144606.5695-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot reported below warning ->
fs/btrfs/scrub.c:3439:2: warning: Undefined or garbage value
returned to caller [clang-analyzer-core.uninitialized.UndefReturn]

Initialize ret to 0.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 fs/btrfs/scrub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/scrub.c b/fs/btrfs/scrub.c
index 4baa8e43d585..5ca7e5ffbc96 100644
--- a/fs/btrfs/scrub.c
+++ b/fs/btrfs/scrub.c
@@ -3325,7 +3325,7 @@ static int scrub_simple_mirror(struct scrub_ctx *sctx,
 	const u32 max_length = SZ_64K;
 	struct btrfs_path path = {};
 	u64 cur_logical = logical_start;
-	int ret;
+	int ret = 0;
 
 	/* The range must be inside the bg */
 	ASSERT(logical_start >= bg->start &&
-- 
2.25.1

