Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84717ACA
	for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 20:50:15 +0000 (UTC)
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-d6b7eb39ef0so2471945276.3
        for <llvm@lists.linux.dev>; Tue, 15 Aug 2023 13:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692132614; x=1692737414;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ci189aHPBFBjtm/RN/hzTJMe0+KKoH+4CClRyv2s6dg=;
        b=SAeIcykjeO3O4waBr9JKtx/sxluuhH/9cEcIo8KaE0eyK1VF08SzRAJKh6p+FmA1JM
         69OTv8TvYkczMG0mhmrq9GTsueFg0IlEsypYeECDD2vH2l6576G5pEuCEzFlDoCMLvWT
         fn362CQrZE/tm0v5rMp0CN01qzTPzCv6QJCv7l/IHGeLYxWRcXVES5g5p9/31INLZcoa
         Rvnz18b/2PQNIiKNRAYs2uT62njO7WMkocibzanwhe1+v4vEpbghNK/2MHile54eDFs5
         uM8NETVzrBbLkfr44/H893S5AScQPRBPXeWc34kmCmUx4lVV+Kfwz5e0JGWHAb4m+tw5
         X+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692132614; x=1692737414;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ci189aHPBFBjtm/RN/hzTJMe0+KKoH+4CClRyv2s6dg=;
        b=IkQ3w2U9xoUK0+LIEqCVAr8Uz8Vna1vw311w9Hg39DZP1urt55gPXVb9d1KmL9T6L1
         UC7Hqk38DuTrPAhSYS0K+y2SGMhlz49ep8JTRUFWmigKy7Q7ltwKQUH9jhq0Ec30TxKJ
         70OpHtOxZgdL2YV1kw78j3FpFxFOZts8oDZ4vjUpsgaDCC+q5ixkDxws9HLKLe2YCVqp
         Jwo9B1LJCW6cYSkBXQQ3Oj41Hga2JgU6jAomruKdICjisXc/cjhTkBRAtMHD02OHWbzX
         O3C46gTE67zedzsnVn7zwunaCku0duEMH0InBgoYgMTJLmjpDFAQd1CWraIF9BLUjllw
         CLsA==
X-Gm-Message-State: AOJu0YzegH64rVjX86wqPzyhDmcQEOm5Tbn5t//dlsPi09OWC4CkQJJB
	rtOYdjFDvWgEMIXXCXf9Xizsic9WpuGff6auzQ==
X-Google-Smtp-Source: AGHT+IE0S8U2GnJZpujIzqMD7YILSF8i9bPnwtVZEQv8bw7cAjHxPN+IBbiHTBhY+Q8tDhl8X7qu4g/1kHaZi/Xotw==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:3482:0:b0:d51:577e:425d with SMTP
 id b124-20020a253482000000b00d51577e425dmr172964yba.12.1692132614147; Tue, 15
 Aug 2023 13:50:14 -0700 (PDT)
Date: Tue, 15 Aug 2023 20:50:13 +0000
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAATl22QC/x2NwQqDMBBEf0X23IXEaBV/pfRgm1H3EmUjQRD/v
 WthDvMOb+akDBVkGqqTFEWyrMnAPyr6LmOawRKNqXZ1cL1vuawSOaoUaOaEnbEv0LsksRxmhO7 TPNs++HFyZEObYpLjf/J6X9cPHh5EAXQAAAA=
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692132613; l=1704;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=koKe9TiNY9BHLtNN6bXZhZ0oxr/kaYIOgBRphxRQ9R4=; b=4zK7hYBEqziHv0W5/Pz/2k3HinI9eYV7eo3A7IjcFaIx8ueNhiyyhTdLIyTZ827+goMPHHYVm
 LXiqIzRSRwND2YO1dk2khOrUhZ9LI5EX+oXcD11QKowi4+yD62y5ymC
X-Mailer: b4 0.12.3
Message-ID: <20230815-void-drivers-net-ethernet-ni-nixge-v1-1-f096a6e43038@google.com>
Subject: [PATCH] net: nixge: fix -Wvoid-pointer-to-enum-cast warning
From: Justin Stitt <justinstitt@google.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"

When building with clang 18 I see the following warning:
|       drivers/net/ethernet/ni/nixge.c:1273:12: warning: cast to smaller integer
|               type 'enum nixge_version' from 'const void *' [-Wvoid-pointer-to-enum-cast]
|        1273 |         version = (enum nixge_version)of_id->data;

This is due to the fact that `of_id->data` is a void* while `enum nixge_version`
has the size of an int. This leads to truncation and possible data loss.

Link: https://github.com/ClangBuiltLinux/linux/issues/1910
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: There is likely no data loss occurring here since `enum nixge_version`
has only a few fields which aren't nearly large enough to cause data
loss. However, this patch still works towards the goal of enabling this
warning for more builds by reducing noise.
---
 drivers/net/ethernet/ni/nixge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 0fd156286d4d..105977804e6a 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -1270,7 +1270,7 @@ static int nixge_of_get_resources(struct platform_device *pdev)
 	if (!of_id)
 		return -ENODEV;
 
-	version = (enum nixge_version)of_id->data;
+	version = (uintptr_t)of_id->data;
 	if (version <= NIXGE_V2)
 		priv->dma_regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	else

---
base-commit: 2ccdd1b13c591d306f0401d98dedc4bdcd02b421
change-id: 20230815-void-drivers-net-ethernet-ni-nixge-37b465831af0

Best regards,
--
Justin Stitt <justinstitt@google.com>

