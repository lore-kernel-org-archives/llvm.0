Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C640138E
	for <llvm@lists.linux.dev>; Mon,  7 Aug 2023 06:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1691390273;
	bh=ni6N3FT+XqiJ1D10eJkiShr+T3NXxFp1tGK/dEGHs94=;
	h=From:Date:Subject:To:Cc:From;
	b=lx40vcbjL6vrGNekhAE+X6MIBtVcF/9QBHxUdBXVvnIPl077XuMuthI+I6UpBn9Pm
	 a6c5WFAGFBJ+wFF2Z+rcd3fcaM9x+2Ur32Oi6Hzkdl/IAA7jazO1XipwrCDcW15213
	 VPz+6rJxzA7uDn1Ixp1PHT+pQtBUG65Z8OQnxKZM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 07 Aug 2023 08:37:45 +0200
Subject: [PATCH] cpufreq: amd-pstate: fix global sysfs attribute type
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230807-amd-pstate-cfi-v1-1-0263daa13bc3@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIADiR0GQC/x3MQQqAIBBA0avErBswNbKuEi3ExppFJhoRhHdPW
 r7F/y9kSkwZpuaFRDdnPkNF1zbgdhs2Ql6rQQqphBED2mPFmC97ETrPaJSQejSu176HGsVEnp9
 /OC+lfPGOUZhgAAAA
To: Huang Rui <ray.huang@amd.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jannik Glueckert <jannik.glueckert@gmail.com>, 
 Bagas Sanjaya <bagasdotme@gmail.com>, 
 Linux LLVM Build Support <llvm@lists.linux.dev>, 
 Linux Power Management <linux-pm@vger.kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Huang Rui <ray.huang@amd.com>, stable@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691390272; l=3581;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ni6N3FT+XqiJ1D10eJkiShr+T3NXxFp1tGK/dEGHs94=;
 b=gECqiO43NLSBF6EL/FWzJyIhuHS2wygf/Ze967FjXMXfQkKO52PsscEBiQIOqW717HMIei6am
 PObnA9ZA3cQChixTd/K2OVlorY/QrC+f3/ueKDkn3eRIzK7qR+WIPtq
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

In commit 3666062b87ec ("cpufreq: amd-pstate: move to use bus_get_dev_root()")
the "amd_pstate" attributes where moved from a dedicated kobject to the
cpu root kobject.
While the dedicated kobject expects to contain kobj_attributes the root
kobject needs device_attributes.

As the changed arguments are not used by the callbacks it works most of
the time.
However CFI will detect this issue:

[ 4947.849350] CFI failure at dev_attr_show+0x24/0x60 (target: show_status+0x0/0x70; expected type: 0x8651b1de)
...
[ 4947.849409] Call Trace:
[ 4947.849410]  <TASK>
[ 4947.849411]  ? __warn+0xcf/0x1c0
[ 4947.849414]  ? dev_attr_show+0x24/0x60
[ 4947.849415]  ? report_cfi_failure+0x4e/0x60
[ 4947.849417]  ? handle_cfi_failure+0x14c/0x1d0
[ 4947.849419]  ? __cfi_show_status+0x10/0x10
[ 4947.849420]  ? handle_bug+0x4f/0x90
[ 4947.849421]  ? exc_invalid_op+0x1a/0x60
[ 4947.849422]  ? asm_exc_invalid_op+0x1a/0x20
[ 4947.849424]  ? __cfi_show_status+0x10/0x10
[ 4947.849425]  ? dev_attr_show+0x24/0x60
[ 4947.849426]  sysfs_kf_seq_show+0xa6/0x110
[ 4947.849433]  seq_read_iter+0x16c/0x4b0
[ 4947.849436]  vfs_read+0x272/0x2d0
[ 4947.849438]  ksys_read+0x72/0xe0
[ 4947.849439]  do_syscall_64+0x76/0xb0
[ 4947.849440]  ? do_user_addr_fault+0x252/0x650
[ 4947.849442]  ? exc_page_fault+0x7a/0x1b0
[ 4947.849443]  entry_SYSCALL_64_after_hwframe+0x72/0xdc

Reported-by: Jannik Glückert <jannik.glueckert@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217765
Link: https://lore.kernel.org/lkml/c7f1bf9b-b183-bf6e-1cbb-d43f72494083@gmail.com/
Fixes: 3666062b87ec ("cpufreq: amd-pstate: move to use bus_get_dev_root()")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Note:

This was not tested with CFI as I don't have the toolchain available.
Jannik, could you give it a spin?
---
 drivers/cpufreq/amd-pstate.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/amd-pstate.c b/drivers/cpufreq/amd-pstate.c
index 81fba0dcbee9..9a1e194d5cf8 100644
--- a/drivers/cpufreq/amd-pstate.c
+++ b/drivers/cpufreq/amd-pstate.c
@@ -1012,8 +1012,8 @@ static int amd_pstate_update_status(const char *buf, size_t size)
 	return 0;
 }
 
-static ssize_t show_status(struct kobject *kobj,
-			   struct kobj_attribute *attr, char *buf)
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
 {
 	ssize_t ret;
 
@@ -1024,7 +1024,7 @@ static ssize_t show_status(struct kobject *kobj,
 	return ret;
 }
 
-static ssize_t store_status(struct kobject *a, struct kobj_attribute *b,
+static ssize_t status_store(struct device *a, struct device_attribute *b,
 			    const char *buf, size_t count)
 {
 	char *p = memchr(buf, '\n', count);
@@ -1043,7 +1043,7 @@ cpufreq_freq_attr_ro(amd_pstate_lowest_nonlinear_freq);
 cpufreq_freq_attr_ro(amd_pstate_highest_perf);
 cpufreq_freq_attr_rw(energy_performance_preference);
 cpufreq_freq_attr_ro(energy_performance_available_preferences);
-define_one_global_rw(status);
+static DEVICE_ATTR_RW(status);
 
 static struct freq_attr *amd_pstate_attr[] = {
 	&amd_pstate_max_freq,
@@ -1062,7 +1062,7 @@ static struct freq_attr *amd_pstate_epp_attr[] = {
 };
 
 static struct attribute *pstate_global_attributes[] = {
-	&status.attr,
+	&dev_attr_status.attr,
 	NULL
 };
 

---
base-commit: 52a93d39b17dc7eb98b6aa3edb93943248e03b2f
change-id: 20230807-amd-pstate-cfi-8302498c54f5

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>

