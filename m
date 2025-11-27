Received: from canpmsgout07.his.huawei.com (canpmsgout07.his.huawei.com [113.46.200.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1380B1E5B64
	for <llvm@lists.linux.dev>; Thu, 27 Nov 2025 02:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764212364; cv=none; b=Gy+bnbLyQjYn4fpiH09dn7X9WOODGrNrzf0TORqNR7puD0o+4CpAFWsDcF3iAqf/+BNLnwl91IFTNLuisCcMLBFLowg4ffJlFxEb2JWeQOnbWYZaeZ2H7Ys4eJ9FCgD4AHbxlLN6b7Cw1D5tWyY0yzcunnMiMjFA2F29CqVCV2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764212364; c=relaxed/simple;
	bh=l5vJIz9FULB3IF3xyJAkYtHjoO6hxxwgV77NWFGRO90=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DzsMz8Wd6OD80fLVDsAGyIDTH4GrOBhrCzpDDFFBu2hcKWIGHbNK5mS5hspjQs9rUYIpk0PngTFVX2z6ufRupWOTXw2ppDQdw25OZzlmv2Kx09QNCyiFg6knej7RCAE8jQZjtQWqH1ZqL/A9VHGQ46C299qPLXlIGXYSL3lF1z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YcRNjqtM; arc=none smtp.client-ip=113.46.200.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YcRNjqtM"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=487isU40MkNp22UnH8AvXx5D+tWDbOieleqkxAJexI0=;
	b=YcRNjqtMl/UunOCOv/oESBegCWwQHLambAX+0EY/y0ACug73VmxqhVPVwUyjkiwd9il62Of30
	50+K6GuuyfItCkK1T6GIGBGyhuY6q8K5Cb1VFHAKkFEZYpgvSQDwHvJnm8DKBeVT4fSr3LMkYNW
	Vrv9zRFVuTNnfc6xdfBL0LM=
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4dH1LY0xp7zLlXj;
	Thu, 27 Nov 2025 10:57:25 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 322261402C4;
	Thu, 27 Nov 2025 10:59:13 +0800 (CST)
Received: from kwepemq100008.china.huawei.com (7.202.195.91) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Nov 2025 10:59:13 +0800
Received: from DESKTOP-DKE2JV6.huawei.com (10.67.110.146) by
 kwepemq100008.china.huawei.com (7.202.195.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Nov 2025 10:59:12 +0800
From: Liyuan Pang <pangliyuan1@huawei.com>
To: <linux@armlinux.org.uk>, <nathan@kernel.org>,
	<nick.desaulniers+lkml@gmail.com>, <morbo@google.com>,
	<justinstitt@google.com>, <nico@fluxnic.net>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <xieyuanbin1@huawei.com>, <wanqian10@huawei.com>,
	Liyuan Pang <pangliyuan1@huawei.com>
Subject: [PATCH] ARM: fix input-only operand modification in load_unaligned_zeropad()
Date: Thu, 27 Nov 2025 10:58:48 +0800
Message-ID: <20251127025848.363992-1-pangliyuan1@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq100008.china.huawei.com (7.202.195.91)

In the inline assembly inside load_unaligned_zeropad(), the "addr" is
constrained as input-only operand. The compiler assumes that on exit
from the asm statement these operands contain the same values as they
had before executing the statement, but when kernel page fault happened,
the assembly fixup code "bic %2 %2, #0x3" modify the value of "addr",
which may lead to an unexpected behavior.

Use a temporary variable "tmp" to handle it, instead of modifying the
input-only operand, just like what arm64's load_unaligned_zeropad()
does.

Fixes: b9a50f74905a ("ARM: 7450/1: dcache: select DCACHE_WORD_ACCESS for little-endian ARMv6+ CPUs")

Co-developed-by: Xie Yuanbin <xieyuanbin1@huawei.com>
Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
Signed-off-by: Liyuan Pang <pangliyuan1@huawei.com>
---
Found this problem in linux-6.1.158 with default
multi_v7_defconfig and setting:
CONFIG_PREEMPT=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_KFENCE=y
Compiler: Debian clang version 21.1.6 (2)
Test case:
```c

int main()
{
	int ret;
	char path[4096] = "/tmp";

	for (size_t i = 0; i < 2044; ++i) {
		strcat(path, "/x");
		ret = mkdir(path, 0755);
		assert(ret == 0 || errno == EEXIST);
	}
	strcat(path, "/xx");

	assert(strlen(path) == 4095);

	while (1) {
		FILE *fp = fopen(path, "wb+");

		if (!fp) {
			perror("open failed:");
			exit(1);
		}
		fclose(fp);
	}
	return 0;
}
```
Soon, file open operations will unexpectedly fail
with -EISDIR error, even if the file does exist.
```Log:
root@(none):/# /root/a.out
[   39.994968] BUG: sleeping function called from invalid context at mm/memory.c:5323
[   39.995203] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 62, name: a.out
[   39.995531] preempt_count: 0, expected: 0
[   39.995682] RCU nest depth: 1, expected: 0
[   39.996039] CPU: 0 PID: 62 Comm: a.out Not tainted 6.1.158 #2
[   39.996299] Hardware name: Generic DT based system
[   39.996620]  unwind_backtrace from show_stack+0x10/0x14
[   39.997241]  show_stack from dump_stack_lvl+0x38/0x44
[   39.997460]  dump_stack_lvl from __might_resched+0x15c/0x170
[   39.997624]  __might_resched from lock_mm_and_find_vma+0x80/0x178
[   39.997785]  lock_mm_and_find_vma from do_page_fault+0x13c/0x33c
[   39.998151]  do_page_fault from do_DataAbort+0x3c/0xb4
[   39.998289]  do_DataAbort from __dabt_svc+0x4c/0x80
[   39.998506] Exception stack(0xf8bd1d88 to 0xf8bd1dd0)
[   39.998769] 1d80:                   c2ec4e58 c2eb1e88 00000000 00000080 eed39740 00000001
[   39.999113] 1da0: 00007fff c1c21288 eedf1ffd 80808080 fefefeff f8bd1e80 2f2f2f2f f8bd1dd8
[   39.999919] 1dc0: c0501bac c0501bfc 60000013 ffffffff
[   40.000128]  __dabt_svc from link_path_walk+0x12c/0x49c
[   40.000254]  link_path_walk from path_openat+0x80/0xb80
[   40.000337]  path_openat from do_filp_open+0x84/0x118
[   40.000622]  do_filp_open from do_sys_openat2+0x98/0x18c
[   40.000727]  do_sys_openat2 from sys_openat+0x80/0xa0
[   40.000908]  sys_openat from ret_fast_syscall+0x0/0x54
[   40.001048] Exception stack(0xf8bd1fa8 to 0xf8bd1ff0)
[   40.001304] 1fa0:                   00000000 00000000 ffffff9c bea0bd30 00000242 000001b6
[   40.001644] 1fc0: 00000000 00000000 00000242 00000142 00027529 00000002 00000002 00000000
[   40.001961] 1fe0: 00000001 bea0bc40 0006d0e8 0006d178
open failed:: Is a directory
```
The warning was caused by another issue:
Link: https://lore.kernel.org/20251126090505.3057219-1-wozizhi@huaweicloud.com
which is unrelated to this patch. Please ignore it.

The reason is that, in link_path_walk:
1. Before calling hash_name(), the @name variable store in r8 and
the address is 0xeead0ffd, which points to the string "xx".
2. During the execution of hash_name()->load_unaligned_zeropad(),
loading unsigned long from 0xeead0ffd triggers a page fault on
address 0xeead1000, then in fixup code "bic r8, r8, #0x3" change
r8's value to 0xeead0ffc.
3. After hash_name() returns, subsequent code continues to use r8
as the address of @name which is now the incorrect address 0xeead0ffc
pointing to the string "/xx".
4. Finally, in open_last_lookups, following check fails because
nd->last.name is now "/xx" instead of "xx".
```
		if (unlikely(nd->last.name[nd->last.len]))
			return ERR_PTR(-EISDIR);
```

 arch/arm/include/asm/word-at-a-time.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/word-at-a-time.h b/arch/arm/include/asm/word-at-a-time.h
index f9a3897b06e7..5023f98d8293 100644
--- a/arch/arm/include/asm/word-at-a-time.h
+++ b/arch/arm/include/asm/word-at-a-time.h
@@ -67,7 +67,7 @@ static inline unsigned long find_zero(unsigned long mask)
  */
 static inline unsigned long load_unaligned_zeropad(const void *addr)
 {
-	unsigned long ret, offset;
+	unsigned long ret, tmp;
 
 	/* Load word from unaligned pointer addr */
 	asm(
@@ -75,9 +75,9 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	"2:\n"
 	"	.pushsection .text.fixup,\"ax\"\n"
 	"	.align 2\n"
-	"3:	and	%1, %2, #0x3\n"
-	"	bic	%2, %2, #0x3\n"
-	"	ldr	%0, [%2]\n"
+	"3:	bic	%1, %2, #0x3\n"
+	"	ldr	%0, [%1]\n"
+	"	and	%1, %2, #0x3\n"
 	"	lsl	%1, %1, #0x3\n"
 #ifndef __ARMEB__
 	"	lsr	%0, %0, %1\n"
@@ -90,7 +90,7 @@ static inline unsigned long load_unaligned_zeropad(const void *addr)
 	"	.align	3\n"
 	"	.long	1b, 3b\n"
 	"	.popsection"
-	: "=&r" (ret), "=&r" (offset)
+	: "=&r" (ret), "=&r" (tmp)
 	: "r" (addr), "Qo" (*(unsigned long *)addr));
 
 	return ret;
-- 
2.34.1

