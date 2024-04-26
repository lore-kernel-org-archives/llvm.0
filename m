Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E659213B595
	for <llvm@lists.linux.dev>; Fri, 26 Apr 2024 07:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714114820; cv=none; b=IUpXP3x9sfPwzMDps+iiexp8cxkc+8z3JsIOpAG6lSK2DVplIauOAhr8+TsZteJs0KKjeUpaOGx2+fr4tSv+kilsKt3yBH833RlUSIlmFBTKgrRTZhGcUkDVymI+JpnIbj74OPaIcjqZKzTLmGJIRBWSjCitqp/zwQmUfYT5BXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714114820; c=relaxed/simple;
	bh=x5akakkJPIKZAfWhGALOEORMuD/qH7NGkhisk6ppFQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=us41KjqOrImlQ/NNTn0K7xcScpU1yKkBjsB0AyPrboGpHsUjQj8pktDI7nBwMQDAfTFiMVyS7f5vyvYIaSnaGh4NqJW8dwajiApNBimTXSrrs8PLB78zaKsZ0bOaidld1VZOL0dVZeqkUPeeQMgy9bsDkSKeJOiMMOYyZavtscs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.112.218])
	by gateway (Coremail) with SMTP id _____8BxN+n1UCtmrlgDAA--.1724S3;
	Fri, 26 Apr 2024 15:00:05 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.112.218])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8AxhFbvUCtmPQIGAA--.2873S3;
	Fri, 26 Apr 2024 15:00:04 +0800 (CST)
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
Subject: [PATCH v2 1/4] docs/zh_CN/rust: Update the translation of arch-support to 6.9-rc4
Date: Fri, 26 Apr 2024 14:59:48 +0800
Message-Id: <e61eee747275c4e258416e079315b8e23fe3fde5.1714113680.git.siyanteng@loongson.cn>
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
X-CM-TRANSID:AQAAf8AxhFbvUCtmPQIGAA--.2873S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBj93XoW7WrWxZr1ruw1xWr1DuF15GFX_yoW8uF1fp3
	WDCr97Jr1UJryUGr1UXr1UXF1UGr18GryUJr18G3W7Xr4DJF18Jr1UtFnxJr1UGr18AryU
	Jr1UCryUJw4UAFbCm3ZEXasCq-sJn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8EPfPUUUUU==

Update to commit 81889e8523e6 ("RISC-V: enable building
64-bit kernels with rust support")
commit 01848eee20c6 ("docs: rust: fix improper rendering in
Arch Supportpage")
commit 724a75ac9542 ("arm64: rust: Enable Rust support
for AArch64")
commit 90868ff9cade ("LoongArch: Enable initial Rust support")
commit e5e86572e3f2 ("rust: sort uml documentation arch support table")
commit 04df97e150c8 ("Documentation: rust: Fix arch support table")
commit 0438aadfa69a ("rust: arch/um: Add support for CONFIG_RUST
under x86_64 UML")

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/rust/arch-support.rst       | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Documentation/translations/zh_CN/rust/arch-support.rst
index afbd02afec45..abd708d48f82 100644
--- a/Documentation/translations/zh_CN/rust/arch-support.rst
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -16,8 +16,12 @@
 
 下面是目前可以工作的架构的一般总结。支持程度与 ``MAINTAINERS`` 文件中的``S`` 值相对应:
 
-============  ================  ==============================================
-架构          支持水平          限制因素
-============  ================  ==============================================
-``x86``       Maintained        只有 ``x86_64``
-============  ================  ==============================================
+=============  ================  ==============================================
+架构           支持水平           限制因素
+=============  ================  ==============================================
+``arm64``      Maintained        只有小端序
+``loongarch``  Maintained        \-
+``riscv``      Maintained        只有 ``riscv64``
+``um``         Maintained        只有 ``x86_64``
+``x86``        Maintained        只有 ``x86_64``
+=============  ================  ==============================================
-- 
2.31.4

