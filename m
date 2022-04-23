Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F47A
	for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 11:38:38 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id w19so18478198lfu.11
        for <llvm@lists.linux.dev>; Sat, 23 Apr 2022 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9EtoakrJrjTj5jLsYUp/T56xfz/HVSV91AzJtSvGSbU=;
        b=ev8cW5F027Wz1YcEXnGq0ELeFmb4UCHkXCgEsAYVEiBrxkAB7jwgmt/g4Aha+6T7zI
         ZJ4owIZ4ucBXZE13ovO2DNUkzVDEe2rP0ZoSrAeS+4JPEAVkRS5JeeAI+vmfHHxnX2Ua
         0yZJdPn+xkjl8Ivzf3FQbjyXant/1MMvtFR+WSyd+T0Tb3UUdbd7uqxqm6K86hm64xmw
         64iPp+joBvF2pkVC7pUvYLies6/2RgzfRk3qJcK7MYBcEMM9wMSdqEKp/e4sv54Ab9oP
         yUf1xeKcm0IiGzbHADRlV3wwpmQo7MLpAd1BshvibnV1vHAphE2w5cYBYnYahDm5Na2i
         7w0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9EtoakrJrjTj5jLsYUp/T56xfz/HVSV91AzJtSvGSbU=;
        b=ghHCC2c0sGcK/81zu42G3O2zGzUiNClpdHq9vykQBZioIWaOiSb6uZmf+qRyYKBcd4
         QPBFAGkmeZKdynnrPNTWK+K/0XJOw5xI4qbPQr05kG09xOLwLKjf5MWTf6siDvDK6y0U
         DjIqSr2nykZD5PUz4++IZs3VnRrlDZaJhGVwq6cgBbVPojoI69LDWyGGjmeZomUK40vC
         Zq0RJZACKPlI8AXBDBbmicnkUDUJjKb4NYqci9WUJ7BZn06UydRhtqq19gXcvtlYLlXA
         ENet1nMNnzkrF9wEMTdbpwIW2WoxqgRHgCuVtcbzEvdcM0A4QvuCO2E5xsngFg1MXAy3
         9/jQ==
X-Gm-Message-State: AOAM5316HxnmwR5ghLDqEjPW2hhg17m+xkoptPZFoxLJXfIihg+TYod0
	AIUCl1doZhD2QrlCxmW7KHI=
X-Google-Smtp-Source: ABdhPJyGdsEWmvXaacxzf676KaE3MCBTRwd20XKcfWXUk4tDCchpQPddCr3RuNB1+je4VIOlUO1tAg==
X-Received: by 2002:a05:6512:6d4:b0:470:f48d:44e2 with SMTP id u20-20020a05651206d400b00470f48d44e2mr6428203lff.542.1650713917064;
        Sat, 23 Apr 2022 04:38:37 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id g17-20020a2e9cd1000000b0024db538c2absm526411ljj.7.2022.04.23.04.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 04:38:36 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH RESEND v2 3/5] block/partitions/acorn: Remove redundant assignments
Date: Sat, 23 Apr 2022 13:38:09 +0200
Message-Id: <20220423113811.13335-3-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220423113811.13335-1-michalorzel.eng@gmail.com>
References: <20220423113811.13335-1-michalorzel.eng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of redundant assignments to a variable slot from function
adfspart_check_ADFS. It is being assigned a value that is never read
as we are breaking out from the switch case and the function ends.

Reported by clang-tidy [deadcode.DeadStores]

Signed-off-by: Michal Orzel <michalorzel.eng@gmail.com>
---
 block/partitions/acorn.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/partitions/acorn.c b/block/partitions/acorn.c
index 2c381c694c57..d2fc122d7426 100644
--- a/block/partitions/acorn.c
+++ b/block/partitions/acorn.c
@@ -282,13 +282,13 @@ int adfspart_check_ADFS(struct parsed_partitions *state)
 #ifdef CONFIG_ACORN_PARTITION_RISCIX
 		case PARTITION_RISCIX_SCSI:
 		case PARTITION_RISCIX_MFM:
-			slot = riscix_partition(state, start_sect, slot,
+			riscix_partition(state, start_sect, slot,
 						nr_sects);
 			break;
 #endif
 
 		case PARTITION_LINUX:
-			slot = linux_partition(state, start_sect, slot,
+			linux_partition(state, start_sect, slot,
 					       nr_sects);
 			break;
 		}
-- 
2.25.1

