Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64993D91
	for <llvm@lists.linux.dev>; Tue, 19 Jul 2022 17:06:23 +0000 (UTC)
Received: from fraeml714-chm.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LnQBT488Qz68B2P;
	Wed, 20 Jul 2022 01:02:57 +0800 (CST)
Received: from roberto-ThinkStation-P620.huawei.com (10.204.63.22) by
 fraeml714-chm.china.huawei.com (10.206.15.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 19 Jul 2022 19:06:20 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: <quentin@isovalent.com>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <martin.lau@linux.dev>, <song@kernel.org>,
	<john.fastabend@gmail.com>, <kpsingh@kernel.org>, <sdf@google.com>,
	<peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<terrelln@fb.com>, <nathan@kernel.org>, <ndesaulniers@google.com>
CC: <bpf@vger.kernel.org>, <linux-perf-users@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Roberto Sassu
	<roberto.sassu@huawei.com>
Subject: [PATCH 3/4] perf: Remove FEATURE_CHECK_LDFLAGS-disassembler-four-args
Date: Tue, 19 Jul 2022 19:05:54 +0200
Message-ID: <20220719170555.2576993-3-roberto.sassu@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719170555.2576993-1-roberto.sassu@huawei.com>
References: <20220719170555.2576993-1-roberto.sassu@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.204.63.22]
X-ClientProxiedBy: lhreml754-chm.china.huawei.com (10.201.108.204) To
 fraeml714-chm.china.huawei.com (10.206.15.33)
X-CFilter-Loop: Reflected

As the building mechanism is now able to retry detection with different
combinations of linking flags, setting
FEATURE_CHECK_LDFLAGS-disassembler-four-args is not necessary anymore, so
remove it.

Signed-off-by: Roberto Sassu <roberto.sassu@huawei.com>
---
 tools/perf/Makefile.config | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 73e0762092fe..6f8495544d19 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -297,8 +297,6 @@ FEATURE_CHECK_LDFLAGS-libpython := $(PYTHON_EMBED_LDOPTS)
 
 FEATURE_CHECK_LDFLAGS-libaio = -lrt
 
-FEATURE_CHECK_LDFLAGS-disassembler-four-args = -lbfd -lopcodes -ldl
-
 CORE_CFLAGS += -fno-omit-frame-pointer
 CORE_CFLAGS += -ggdb3
 CORE_CFLAGS += -funwind-tables
@@ -328,8 +326,8 @@ ifneq ($(TCMALLOC),)
 endif
 
 ifeq ($(FEATURES_DUMP),)
-# We will display at the end of this Makefile.config, using $(call feature_display_entries)
-# As we may retry some feature detection here, see the disassembler-four-args case, for instance
+# We will display at the end of this Makefile.config, using $(call feature_display_entries),
+# as we may retry some feature detection here.
   FEATURE_DISPLAY_DEFERRED := 1
 include $(srctree)/tools/build/Makefile.feature
 else
@@ -904,11 +902,9 @@ ifndef NO_LIBBFD
 
     ifeq ($(feature-libbfd-liberty), 1)
       EXTLIBS += -lbfd -lopcodes -liberty
-      FEATURE_CHECK_LDFLAGS-disassembler-four-args += -liberty -ldl
     else
       ifeq ($(feature-libbfd-liberty-z), 1)
         EXTLIBS += -lbfd -lopcodes -liberty -lz
-        FEATURE_CHECK_LDFLAGS-disassembler-four-args += -liberty -lz -ldl
       endif
     endif
     $(call feature_check,disassembler-four-args)
@@ -1329,7 +1325,7 @@ endif
 
 # re-generate FEATURE-DUMP as we may have called feature_check, found out
 # extra libraries to add to LDFLAGS of some other test and then redo those
-# tests, see the block about libbfd, disassembler-four-args, for instance.
+# tests.
 $(shell rm -f $(FEATURE_DUMP_FILENAME))
 $(foreach feat,$(FEATURE_TESTS),$(shell echo "$(call feature_assign,$(feat))" >> $(FEATURE_DUMP_FILENAME)))
 
-- 
2.25.1

