Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50D11FCC
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 04:08:07 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id j6-20020a17090a694600b00200bba67dadso10104286pjm.5
        for <llvm@lists.linux.dev>; Mon, 12 Sep 2022 21:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=uanTL/bnlnJQgtwLSfczwro/TOgawj0bo0VSuHyRExY=;
        b=LQvkqGqqUHSPlHPc845FHWHSftI9v84JIYOknsWb6h6jpm3wGnvNf8yBQTlnTAndwj
         ZdqRWHHbR5dapmKsDAvU+Ds1jZqp2V9bKcs3IWt7HNgSz3Iw7TdlhicIO9FCTk9umyGm
         G0tRPu6EblFFFRbjsjZ37LPTKGRAvYi2ESuuiKQs66Vp4Zw1u1i/0OywhmlVnKnnapG6
         Z4NHaqAjcMjJKbZFentHQHeUa0cJ0EDfoVc62Vg0FO0oesrbgZdvWOBIqvZJJhorqJB3
         H1pnOhffgb4Ihds61EkWxbjJPv86enNZYEajrRampSyWIvdXc7g3utON2EVhyl4w6qCp
         N16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=uanTL/bnlnJQgtwLSfczwro/TOgawj0bo0VSuHyRExY=;
        b=Zu7Hrq3lhuoscYGFHS92sSGDvOAn9LyZGFh4x0MsaWntNdFw7Cl3CPI2NoHDzUP5bc
         i5renj1QUKzGR7udQXiTsvexcfSGClYjk7mySe4QjPkZ6cYO2VgZLcOCSnQZOs/UtKan
         iZMTnlzpClv7uMgLUAMI2uc2VGakWGRSs5Dt/nrcZ/CmDSFEcSAKMVsTyJn4I+nhVeGW
         3iJCyeruFsRvtd1DebHNQxCNG9Tlfq4COomR9LlFv4ArtODQxXhJNQpMII3htqTxGAAe
         JNViOkNWkFvrPOWn12qKEFJJQkdI6VRWyDc09520bzE3BXBfN9jdFWXDlufvri/0VDvR
         dJfQ==
X-Gm-Message-State: ACgBeo2SohdRn8YRwZvBNXFt0jpUAfsKt1iAHwXTqJp/vsRdPMsPcPfE
	tjr0NYF8GKqYXbVDvJhpPOk=
X-Google-Smtp-Source: AA6agR6cXEZFHwV6pGtOO8vmhiuAq6xxruH6T71pUW6vDO7/gIK2ZCilxUsfGInY1ieI+ZdP6GEOMA==
X-Received: by 2002:a17:903:25d3:b0:176:e9d3:64bc with SMTP id jc19-20020a17090325d300b00176e9d364bcmr28790846plb.45.1663042087464;
        Mon, 12 Sep 2022 21:08:07 -0700 (PDT)
Received: from ubuntu-jammy.. ([61.16.102.77])
        by smtp.gmail.com with ESMTPSA id d7-20020a170902654700b0017691eb7e17sm6877641pln.239.2022.09.12.21.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 21:08:06 -0700 (PDT)
From: yangxingwu <xingwu.yang@gmail.com>
To: nathan@kernel.org
Cc: ndesaulniers@google.com,
	trix@redhat.com,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yangxingwu <xingwu.yang@gmail.com>
Subject: [PATCH] scripts/clang-tools: remove unused module
Date: Tue, 13 Sep 2022 04:07:53 +0000
Message-Id: <20220913040753.2198-2-xingwu.yang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220913040753.2198-1-xingwu.yang@gmail.com>
References: <20220913040753.2198-1-xingwu.yang@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused imported 'os' module

Signed-off-by: yangxingwu <xingwu.yang@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 1337cedca..bb78c9bde 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -12,7 +12,6 @@ compile_commands.json.
 import argparse
 import json
 import multiprocessing
-import os
 import subprocess
 import sys

--
2.37.2

