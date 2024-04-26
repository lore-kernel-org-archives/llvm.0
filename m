Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 784EC13AD04
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 07:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714114821; cv=none; b=pvwtNIixHk5rh9FFhWWvWQsee+QEkRRksdpVhislqNp4Uc2fg+X1ro0CwnBS7q1ge9uQ9ijmQt1Lo+jRyiA0OxGkphUZdkT5ViFUHxz+YnjcrLNuwm5vVUNfDTGS+xF/NxkkE9W98/zvskDr4Q2jEqM5G/QsyQONYBSMxzkeaPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714114821; c=relaxed/simple;
	bh=HPBYIXIk9r0EIsgk2baeYHeV/KCXuo3e/HDc+kAUaCA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LHrxMCmljvjHReFG/FGpZVY7zjQB0z9Riuuh86JZiNt2HND8LUT9UjBDnFuCDXjJDo+G5I0s5HmF7lZc6FrgUFuRZoxJvNkOHuuDpKJSkRt8m5sc6eulgo1LBHrBoME1/CIPUjQPvfywmY9iqE35nbUFuCKH0Ovf+JYvLL5gfDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8DxNvD+UCtmvFgDAA--.14174S3;
	Fri, 26 Apr 2024 15:00:14 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxhFbvUCtmPQIGAA--.2873S4;
	Fri, 26 Apr 2024 15:00:11 +0800 (CST)
From: Yanteng Si <siyanteng@loongson.cn>
To: ojeda@kernel.org,
	corbet@lwn.net,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@samsung.com,
	aliceryhl@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	alexs@kernel.org,
	dzm91@hust.edu.cn
Cc: Yanteng Si <siyanteng@loongson.cn>,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/4] docs/zh_CN/rust: Update the translation of coding-guidelines to 6.9-rc4
Date: Fri, 26 Apr 2024 14:59:49 +0800
Message-Id: <e83b5dd929371d42889b19750e5e0385544e170f.1714113680.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1714113680.git.siyanteng@loongson.cn>
References: <cover.1714113680.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8AxhFbvUCtmPQIGAA--.2873S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFWDJw13Cr4fWF15Cry8WFX_yoWkXrX_ur
	n7XFW0yryIyFn7uF48AFy3Jr1FvayIkFy8CFn8twsxCw1DAwsIq3WkWrykZanxWr4Dur98
	Ga93AFyfKrnFqosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqE5I8CrVACY4xI64kE6c02F40Ex7xfMIIYY7kG6xAYrbIjqfuFe4nvWSU5
	nxnvy29KBjDU0xBIdaVrnRJUUUPYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zV
	CF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
	jsIEc7CjxVAFwI0_Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2
	xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYY7kG6xAY
	rwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Cr0_Gr1UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	b79a9UUUUU=

Update to commit bc2e7d5c298a ("rust: support `srctree`-relative links")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/rust/coding-guidelines.rst    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rst b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
index 6c0bdbbc5a2a..419143b938ed 100644
--- a/Documentation/translations/zh_CN/rust/coding-guidelines.rst
+++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
@@ -157,6 +157,18 @@ https://commonmark.org/help/
 
 	https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
 
+此外，内核支持通过在链接目标前添加 ``srctree/`` 来创建相对于源代码树的链接。例如:
+
+.. code-block:: rust
+
+       //! C header: [`include/linux/printk.h`](srctree/include/linux/printk.h)
+
+或者:
+
+.. code-block:: rust
+
+       /// [`struct mutex`]: srctree/include/linux/mutex.h
+
 
 命名
 ----
-- 
2.31.4

