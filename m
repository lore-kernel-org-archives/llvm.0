Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F798299A8E
	for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757706850; cv=none; b=ArnHL0fAJ1XPJsDndGNllmjoA2B/dMmW8oug5NLoFVqBB3b7bOlehG0LDLlMbP3fCMVrXGBIIfeq+NaDXVtahaDvVtsjqM07tYcYOudwEX6YGv5ESL+d8AKgnZQuBZ8+ygZx8qC9jfZW/s3DYhRKok6u6cgfDnc9WU/QaUrcs3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757706850; c=relaxed/simple;
	bh=UaxWZRT2eVzBCGKMziU2Aq9Id91zLIcnt32JB283AaM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aBsAKVy9gnNtJzQizL7ZDSJGnOpbfbwb2BLjXGg00j/3q1dawI/aRfLXz17o1Is4VchQcbmRKPAW0vEzyWKvPHKT6GSmm8J/bePy+GoOTS35Xh2l5p3kQVDcgVFkRc0eztP3LcBgRTE5X9+QBLJzfgdboBG7OWo1Taq+P+alB4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJdHuiLC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJdHuiLC"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3db9641b725so1961395f8f.2
        for <llvm@lists.linux.dev>; Fri, 12 Sep 2025 12:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757706847; x=1758311647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crP5kybyDKEP1L3Fsm57wKH5BFdIt0syo+qIG2jEqhk=;
        b=lJdHuiLCWlUpSgdiiZEukuVtq1q2P3QR44Bm+ykw1qZRCV7tYQukHg4Csi5nYngNhs
         nDhip7hIrrPrSNH77ydcByELwFdO+19SO9pmE+aggHqI94jVuUAM+7r4wYmPd09QCjEL
         co2L8mU19TALdXs6ITUati8YGDasLXGWLa9kel2FirMIMJWu+miKKa8BS3dSYXVKgX5B
         HLcJEMNpCjb7mD/yM0oP46ppvUDybFqqGKpbUEclIvX5dUdLLodPF8RzMgy2yTrVcbBL
         LvTxizNKfA84mHFJMhGBSyoVzhN9rxJu16+FXd/c5gDXpTos62aK5O4U/IYBfiHe/Jzp
         dgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757706847; x=1758311647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crP5kybyDKEP1L3Fsm57wKH5BFdIt0syo+qIG2jEqhk=;
        b=JuaCA9V3mu59mZpVoSJVlljZTPopwfTxn32jckTwVCpRqmq+7j2VF+UCOHn88iSexD
         TmCzkG13p9lcYTwz3rFIl9QikF11WDr1IVj4P/Qoj+OSbYuea4/2EwFd22v3EHNNr+uT
         5QBZja54OfGHwE+GZsBz3sigrXeKIyUs+9OQRFPzdAFJkBRs9MNXwrT8ur4BpcuV/RpR
         EphJU4ebfY0KJddF97n6xNL+FSM8peq7Q6PChFsjWA/xYI1ErgdHSMChPV6+Xo8ToYrA
         hkGwy25GPkO9YfHpweRBVwvYKe4Cx9UbsT6Y8ZCFbUoQeMdtnQ74VcdZjfI13vbwPGfd
         oYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCViWEud4ZU1xo4OFam03bb0289w+BBJfcJeg4kkhjKXQR7kJu11ynC6uNVD8au7X3meXaZG@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2nAQjjKWM3as62rtkn9sZLHBY6Yl8B44YZSlkpCCMBGLE5RUx
	A5YrhzF1Sm5mSjs2X8W/VN3V4HQGL7hMl2Xuc4REGsn/rwqdCGpuWD2b
X-Gm-Gg: ASbGncsN7qHYA2SexkitKz/XClG+34ipDGgTk3xnEysiXTcy1sbeXjN93l9nUdGqHgN
	oMbYBynxMrP7TrAvypntFF5igCTRJjXwBGMUcL4JYpbXZl0YA/qYxeQxj1RlPjcdU+th0uYd55W
	ihiYaZpq4O8YncgQqNpZAHES6JsPmWX51z9VrsNtJH9h9LCT1OafsIr0R9Bi/o2aEmZPQsZ+NGt
	JsmjD7rlZkwZEV527kqYRuE8GhHLLOVMRwflVtc6jTw1conrLALHjuS09Q4kwYF3N9GKTvqHoj2
	Za2hSFF42BZKYAtsv5hP0TMIEte2xCGlVoDf7FgytMGcW1UgJTpazwxEisEjqziIh8CnHZxPUm3
	3rNr8jlt6uYxesGDtmJWWjbgMJ3YoQgnzXv1LBnZeUU+nK3zFoZ33yBErd3tqvUXM5uTIoJqaOV
	octF2A+Ms=
X-Google-Smtp-Source: AGHT+IHYbSxBKDnneqMGe4B4GqdstQRPwP2TMBkU5KGjwaP3qxT6Gii/ajCV1viHAEQt0HDASC1PLw==
X-Received: by 2002:a05:6000:40cb:b0:3da:d015:bf84 with SMTP id ffacd0b85a97d-3e7659cc7e2mr4361632f8f.25.1757706846599;
        Fri, 12 Sep 2025 12:54:06 -0700 (PDT)
Received: from yanesskka.. (node-188-187-35-212.domolink.tula.net. [212.35.187.188])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017bfd14sm74650375e9.21.2025.09.12.12.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 12:54:06 -0700 (PDT)
From: Yana Bashlykova <yana2bsh@gmail.com>
To: "David S. Miller" <davem@davemloft.net>
Cc: Yana Bashlykova <yana2bsh@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	bpf@vger.kernel.org,
	llvm@lists.linux.dev,
	lvc-project@linuxtesting.org
Subject: [PATCH 6.1 10/15] selftests: net: genetlink: add packet capture test infrastructure
Date: Fri, 12 Sep 2025 22:53:33 +0300
Message-Id: <20250912195339.20635-11-yana2bsh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250912195339.20635-1-yana2bsh@gmail.com>
References: <20250912195339.20635-1-yana2bsh@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add test cases for monitoring Netlink traffic during test execution

Require CONFIG_NLMON.

Signed-off-by: Yana Bashlykova <yana2bsh@gmail.com>
---
 tools/testing/selftests/net/Makefile    |   6 +
 tools/testing/selftests/net/genetlink.c | 234 ++++++++++++++++++++++++
 2 files changed, 240 insertions(+)
 create mode 100644 tools/testing/selftests/net/genetlink.c

diff --git a/tools/testing/selftests/net/Makefile b/tools/testing/selftests/net/Makefile
index 69c58362c0ed..0c325ccc5f03 100644
--- a/tools/testing/selftests/net/Makefile
+++ b/tools/testing/selftests/net/Makefile
@@ -71,6 +71,7 @@ TEST_GEN_FILES += bind_bhash
 TEST_GEN_PROGS += sk_bind_sendto_listen
 TEST_GEN_PROGS += sk_connect_zero_addr
 TEST_PROGS += test_ingress_egress_chaining.sh
+TEST_GEN_PROGS += genetlink
 
 TEST_FILES := settings
 
@@ -82,3 +83,8 @@ $(OUTPUT)/reuseport_bpf_numa: LDLIBS += -lnuma
 $(OUTPUT)/tcp_mmap: LDLIBS += -lpthread
 $(OUTPUT)/tcp_inq: LDLIBS += -lpthread
 $(OUTPUT)/bind_bhash: LDLIBS += -lpthread
+
+$(OUTPUT)/genetlink: LDLIBS += -lnl-3 -lnl-genl-3
+$(OUTPUT)/genetlink: CFLAGS += $(shell pkg-config --cflags libnl-3.0 libnl-genl-3.0)
+
+EXTRA_CLEAN := $(SCRATCH_DIR) $(OUTPUT)/genetlink.pcap
diff --git a/tools/testing/selftests/net/genetlink.c b/tools/testing/selftests/net/genetlink.c
new file mode 100644
index 000000000000..5be9ca68accd
--- /dev/null
+++ b/tools/testing/selftests/net/genetlink.c
@@ -0,0 +1,234 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Generic Netlink and Netlink test cases
+ *
+ * This test suite validates various aspects of Generic Netlink and Netlink communication
+ *
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <ctype.h>
+#include <sys/wait.h>
+#include <time.h>
+#include <inttypes.h>
+#include <signal.h>
+#include <netlink/netlink.h>
+#include <netlink/genl/genl.h>
+#include <netlink/genl/family.h>
+#include <netlink/genl/ctrl.h>
+#include <netlink/genl/mngt.h>
+#include <linux/genetlink.h>
+
+#include "../kselftest_harness.h"
+
+#define MY_GENL_FAMILY_NAME "TEST_GENL"
+#define MY_GENL_CMD_UNSPEC 0
+#define MY_GENL_CMD_ECHO 1
+#define MY_GENL_CMD_SET_VALUE 2
+#define MY_GENL_CMD_GET_VALUE 3
+#define MY_GENL_CMD_EVENT 4
+#define MY_GENL_CMD_NO_ATTRS 5
+
+#define MY_GENL_SMALL_CMD_GET 0
+
+#define MY_GENL_ATTR_UNSPEC 0
+#define MY_GENL_ATTR_DATA 1
+#define MY_GENL_ATTR_VALUE 2
+#define MY_GENL_ATTR_PATH 3
+#define MY_GENL_ATTR_NESTED 4
+#define MY_GENL_ATTR_MAX 4
+
+#define THIRD_GENL_FAMILY_NAME "THIRD_GENL"
+
+#define THIRD_GENL_CMD_ECHO 1
+
+#define THIRD_GENL_ATTR_UNSPEC 0
+#define THIRD_GENL_ATTR_DATA 1
+#define THIRD_GENL_ATTR_FLAG 2
+#define THIRD_GENL_ATTR_MAX 2
+
+#define PATH_GENL_TEST_NUM "/sys/kernel/genl_test/value"
+#define PATH_GENL_TEST_MES "/sys/kernel/genl_test/message"
+#define PATH_GENL_TEST_DEV "/sys/kernel/genl_test/some_info"
+#define PATH_PARALLEL_GENL_MES "/sys/kernel/parallel_genl/message"
+#define PATH_THIRD_GENL_MES "/sys/kernel/third_genl/message"
+
+#define MY_MCGRP_NAME "MY_MCGRP_GENL"
+
+#define GENL_CTRL "nlctrl"
+#define CTRL_ATTR_POLICY_MAX (__CTRL_ATTR_POLICY_DUMP_MAX - 1)
+
+#define PARALLEL_GENL_FAMILY_NAME "PARALLEL_GENL"
+#define PARALLEL_GENL_ATTR_UNSPEC 0
+#define PARALLEL_GENL_CMD_SEND 1
+#define PARALLEL_GENL_CMD_DUMP_INFO 2
+#define PARALLEL_GENL_CMD_SET_VALUE 3
+#define PARALLEL_GENL_CMD_GET_VALUE 4
+
+#define PARALLEL_GENL_ATTR_DATA 1
+#define PARALLEL_GENL_ATTR_BINARY 2
+#define PARALLEL_GENL_ATTR_NAME 3
+#define PARALLEL_GENL_ATTR_DESC 4
+#define PARALLEL_GENL_ATTR_FLAG_NONBLOCK 9
+#define PARALLEL_GENL_ATTR_FLAG_BLOCK 10
+#define PARALLEL_GENL_ATTR_PATH 12
+#define PARALLEL_GENL_ATTR_MAX 12
+
+#define LARGE_GENL_FAMILY_NAME "LARGE_GENL"
+
+/*
+ * Test cases
+ */
+
+/**
+ * TEST(capture_start) - Starts Netlink traffic capture using nlmon interface
+ *
+ * Creates a virtual nlmon interface, enables it and starts packet capture
+ * with tcpdump. Captured packets are saved to 'genetlink.pcap' file.
+ *
+ * Note:
+ * - Requires root privileges
+ * - Creates temporary interface 'nlmon0'
+ * - Runs tcpdump in background
+ * - Adds small delay to ensure capture starts
+ */
+
+TEST(capture_start)
+{
+	printf("Running Test: starting Netlink traffic capture...\n");
+
+	// Only root can monitor Netlink traffic
+	if (geteuid()) {
+		SKIP(return, "test requires root");
+		return;
+	}
+
+	char command[256];
+	int result;
+
+	snprintf(command, sizeof(command), "ip link add nlmon0 type nlmon");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command), "ip link set nlmon0 up");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command),
+		 "tcpdump -i nlmon0 -w genetlink.pcap &");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	printf("nlmon is up. Starting netlink process...\n");
+
+	sleep(2);
+
+	printf("Starting Netlink tests...\n");
+}
+
+/**
+ * TEST(capture_end) - Terminates Netlink traffic monitoring session
+ *
+ * Performs controlled shutdown of nlmon capture interface by:
+ * 1. Stopping tcpdump capture process
+ * 2. Bringing down nlmon interface
+ * 3. Deleting nlmon interface
+ *
+ * Test Procedure:
+ * 1. Privilege Check:
+ *    - Verifies root privileges (required for nlmon operations)
+ *    - Gracefully skips if not root
+ *
+ * 2. Capture Termination:
+ *    - Stops tcpdump process (2-second delay for cleanup)
+ *    - Brings nlmon0 interface down
+ *    - Deletes nlmon0 interface
+ *    - Validates each operation succeeds
+ *
+ * 3. Cleanup Verification:
+ *    - Checks system command exit statuses
+ *    - Provides detailed error reporting
+ *
+ * Key Validations:
+ * - Proper termination of monitoring session
+ * - Correct interface teardown
+ * - Root privilege enforcement
+ * - System command error handling
+ *
+ * Expected Behavior:
+ * - tcpdump process should terminate successfully
+ * - nlmon0 interface should deactivate cleanly
+ * - Interface should be removable
+ * - Non-root execution should skip gracefully
+ *
+ * Security Considerations:
+ * - Requires root for network interface control
+ * - Ensures complete capture session cleanup
+ * - Verifies proper resource release
+ *
+ * Note:
+ * - Should be paired with capture_start test
+ * - Includes 2-second delay for process stabilization
+ * - Provides status feedback through printf
+ */
+
+TEST(capture_end)
+{
+	printf("Running Test: stopping Netlink traffic capture...\n");
+
+	// Only root can monitor Netlink traffic
+	if (geteuid()) {
+		SKIP(return, "test requires root");
+		return;
+	}
+
+	char command[256];
+	int result;
+
+	sleep(2);
+
+	snprintf(command, sizeof(command), "pkill tcpdump");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command), "ip link set nlmon0 down");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	snprintf(command, sizeof(command), "ip link delete nlmon0 type nlmon");
+	result = system(command);
+	ASSERT_EQ(WEXITSTATUS(result), 0);
+	if (result == -1) {
+		perror("system");
+		return;
+	}
+
+	printf("The capturing is over\n");
+}
+
+TEST_HARNESS_MAIN
-- 
2.34.1

