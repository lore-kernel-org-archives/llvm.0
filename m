Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2694613475B
	for <llvm@lists.linux.dev>; Tue, 23 Apr 2024 13:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713877675; cv=none; b=A0tzZECsDyVxbvcQFnXKa3mYtLN0JmELGSIkERlDcJczgtCZmfGjhNXSo6c0oX8WGHywADh50AhydUOCZ6mmo8HsJQYJGN1JYVA0S2F2OpQSYlXTLAx8rzmfNS2w9wXxLXvsezHtzC3DLtaYFcyGakcA9UszA8oTxaz35N1s8oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713877675; c=relaxed/simple;
	bh=6ObOY6a19iSWeHzXcI4y0Y4L9Oh0YmS59AXiA+sMsEU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M90BfFJ41uLaqqtoyLjTskXnNL+c8ksAdCm0lmOMN/8fFDBnySAoIxo26Chzd1t5ot/NmeTw9TVo7BAd+eSxOdNFHm3v0QqnyOUhftC1x5PkZclf3+8kJUgcfA8B6DqjfAsjl1mPVIb6guItsM2Th7LSmopfjq+BG47HMfc2/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8Cx7+uosidmPGQBAA--.7978S3;
	Tue, 23 Apr 2024 21:07:52 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxTN6esidmK18CAA--.10071S4;
	Tue, 23 Apr 2024 21:07:49 +0800 (CST)
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
Subject: [PATCH v1 2/4] docs/zh_CN/rust: Update the translation of coding-guidelines to 6.9-rc4
Date: Tue, 23 Apr 2024 21:07:27 +0800
Message-Id: <c1d41290e80fc1e6364682c258445132c42442e4.1713875158.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.31.4
In-Reply-To: <cover.1713875158.git.siyanteng@loongson.cn>
References: <cover.1713875158.git.siyanteng@loongson.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxTN6esidmK18CAA--.10071S4
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtFWDJw13Cr4fWF15Cry8WFX_yoWkXrb_ur
	n7XrW0yw1xAFn7uF48AFy5Jr1rZayIkFy8CFn8tws8Cw1DAwsIq3WkJrykZanxWr4Dur98
	GayfAFyftrsFqosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqE5I8CrVACY4xI64kE6c02F40Ex7xfMIIYY7kG6xAYrbIjqfuFe4nvWSU5
	nxnvy29KBjDU0xBIdaVrnRJUUUBEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zV
	CF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY
	1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20x
	vEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
	aVCY1x0267AKxVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr2
	1l57IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv2
	0xvE14v26r1q6rW5McIj6I8E87Iv67AKxVWxJVW8Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4
	x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIccxYrVCFb41l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07b79a
	9UUUUU=

Update to commit bc2e7d5c298a ("rust: support `srctree`-relative links")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/rust/coding-guidelines.rst    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/translations/zh_CN/rust/coding-guidelines.rst b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
index 6c0bdbbc5a2a..d02e2dbff509 100644
--- a/Documentation/translations/zh_CN/rust/coding-guidelines.rst
+++ b/Documentation/translations/zh_CN/rust/coding-guidelines.rst
@@ -157,6 +157,18 @@ https://commonmark.org/help/
 
 	https://doc.rust-lang.org/rustdoc/how-to-write-documentation.html
 
+此外，内核支持通过在链接目标前缀 ``srctree/`` 来创建相对于源代码树的链接。例如:
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

