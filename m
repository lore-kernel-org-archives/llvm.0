Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B20912B66
	for <llvm@lists.linux.dev>; Tue, 27 Jun 2023 12:15:16 +0000 (UTC)
Received: from loongson.cn (unknown [117.81.87.34])
	by gateway (Coremail) with SMTP id _____8DxPMfT0ppk7BYDAA--.4778S3;
	Tue, 27 Jun 2023 20:15:15 +0800 (CST)
Received: from localhost.localdomain (unknown [117.81.87.34])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx3yO60ppkXxIMAA--.8320S2;
	Tue, 27 Jun 2023 20:15:14 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH] rust: build: Define MODULE macro iif the CONFIG_MODULES is enabled
Date: Tue, 27 Jun 2023 20:14:22 +0800
Message-ID: <20230627121422.112246-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx3yO60ppkXxIMAA--.8320S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tFWDKFyfuw1xtF13Ww4DAwc_yoW8Gw1fpF
	97W3W8Ka15GF4DtFW8Ary5WF12q34UJ34Dua1DX3y2qFZxJ3sxK3yftFZagrW7ZF4xX34F
	qFs7uayaga4UCwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PUUUUU=

The LoongArch does not currently support modules when built with clang.
A pre-processor error is expected on building modules, that's caused by:

 #if defined(MODULE) && defined(CONFIG_AS_HAS_EXPLICIT_RELOCS)
 # if __has_attribute(model)
 #  define PER_CPU_ATTRIBUTES __attribute__((model("extreme")))
 # else
 #  error compiler support for the model attribute is necessary when a recent assembler is used
 # endif
 #endif

This also happens with bindgen too, so it would be better to define
MODULE macro if and only if the CONFIG_MODULES is enabled.

Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 rust/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/rust/Makefile b/rust/Makefile
index fc8cdcfcc9e5..d31d9fa27ef0 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -295,12 +295,16 @@ endif
 
 bindgen_c_flags_final = $(bindgen_c_flags_lto) -D__BINDGEN__
 
+ifdef CONFIG_MODULES
+bindgen_c_flags_final += -DMODULE
+endif
+
 quiet_cmd_bindgen = BINDGEN $@
       cmd_bindgen = \
 	$(BINDGEN) $< $(bindgen_target_flags) \
 		--use-core --with-derive-default --ctypes-prefix core::ffi --no-layout-tests \
 		--no-debug '.*' \
-		-o $@ -- $(bindgen_c_flags_final) -DMODULE \
+		-o $@ -- $(bindgen_c_flags_final) \
 		$(bindgen_target_cflags) $(bindgen_target_extra)
 
 $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
-- 
2.41.0

