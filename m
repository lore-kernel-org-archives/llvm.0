Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDF21FD1
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 17:17:16 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id 17so24939507lji.1
        for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KL8N/pY8zwyCNOWClL3aPmpkcSCytFBXhGWYeb2tSlM=;
        b=hP9jomFsM9tiJmHqu5vhtQiaU4M38sOGV+VyG5U1ayhkNImHv8cDQVu6qLaHigHgGW
         IircsUEfdpLF/+pRpka+/QJDiCVhBLPfxujwGGkzCaB3Oexql1I+IgmqcYh+UcLpkjdB
         meHco10Zx9W5IG4TEPgvsmvCe1PjZKlPcCykBoVwtKnraHEwfDHkkYgo1kRcqRnjGYjl
         UbVRtOvvYFQoeobeFWs/6EmjfkUW/RYqYHWPNOZuDJHZY1MklKDjJ/7k3+MPR7pzoD2B
         p8L0If2ZZWbFpsCdEoiKYQmz7FJDYvvKiWQjNagbcNvyi5FmgKzsDbhh+v0kynnYIz3E
         gZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KL8N/pY8zwyCNOWClL3aPmpkcSCytFBXhGWYeb2tSlM=;
        b=FJkmvucCP0hSmcm2HpxDkGYK7FQJYmk99ZbkU7aRUfrVTgGFyVKpi2kl0uYg+YaDXr
         QqiKV93IeXZNdOWfnCkwSXU2ywDZpST4pM4SkZ8jXA6wTk3RLkvojTHLXGvCYKKE2W8a
         JzEDmSwNSElpfQjjqJYPzJNkk+cg8kLU5NOLyjy1CwF3V/q4zjFSXzBWmtCjGuPQgLHb
         tw92PWZ6C7tAouJLHEdMNFpkz2fig/oQ7z+J/L8sqQYS9y5QHkXQE4Co5cse9+MqkL/y
         NIpMsirZfL5d6QwwureZckJ1uixytsP0bAlbejLLBbsWObWwl99zPuCh4q+iqEFvlC7Q
         rnUA==
X-Gm-Message-State: AOAM5301AE3iecrgpckKyMNwgQnEU5nShjtNoGb3Mg1lDlDXKa2okOWl
	SesKax8zM8Ehy5f2UsfL9ME=
X-Google-Smtp-Source: ABdhPJwVvkzm1MBZLQgrTyEN1DXXBA06k5rCSKlVyVM7hBSk8jiH0NLNKGfxpryWtrvHIPGGp5/yWA==
X-Received: by 2002:a2e:6e0d:0:b0:247:fc9c:284e with SMTP id j13-20020a2e6e0d000000b00247fc9c284emr25043669ljc.251.1649783834914;
        Tue, 12 Apr 2022 10:17:14 -0700 (PDT)
Received: from morzel-asus.lan (static-91-225-135-18.devs.futuro.pl. [91.225.135.18])
        by smtp.gmail.com with ESMTPSA id m2-20020a05651202e200b0046ba665cd6dsm723928lfq.141.2022.04.12.10.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 10:17:14 -0700 (PDT)
From: Michal Orzel <michalorzel.eng@gmail.com>
To: Jens Axboe <axboe@kernel.dk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/5] block/partitions/acorn: Remove redundant assignments
Date: Tue, 12 Apr 2022 19:16:49 +0200
Message-Id: <20220412171651.19812-3-michalorzel.eng@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412171651.19812-1-michalorzel.eng@gmail.com>
References: <20220412171651.19812-1-michalorzel.eng@gmail.com>
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
Changes since v1:
-move the change into a separate patch
-add analysis
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

