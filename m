Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A404A07
	for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759163752; cv=none; b=CJQqhIwJ37zDoC1UGDjgIJnnM2Eg+PKwam1aWZRZWf2CfRKeowocIt8s9OVmRQDCWA7lVBUGBczfm4bV2516JMnc/KYW0ZOHM7/JmDJpDSy42LvzTrN+h8xWLWIUctAekOROtouXeofsUO3T0BpxlpJksM0rqdztsFxMQd3/7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759163752; c=relaxed/simple;
	bh=nxi3r8PydOEfc0wEkxbwOLWzqmSfQiGA5eB8DVA5Hic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dBNRV6t8CvUaoNWJdr4U8zL3nYiU1WQ09wNjH6BAmT9yrPLGeVK+5L8S6UM0r1vgzypxTdz6SmXL6EbAjSdDJ7lGEyhZx6ldpJspjljCLJF8VBfmhdZqwGeH+4QZxIjdKv2VGfkj5YF51nWLLVZ1T1NQMNXIy/bxsYDT6SPIIzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXkvzwKX; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXkvzwKX"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7810214de7cso377633b3a.1
        for <llvm@lists.linux.dev>; Mon, 29 Sep 2025 09:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759163750; x=1759768550; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jl0TJzOw7c1N6d488hhXazm3UzzWpEQY1F2z0NOrldo=;
        b=nXkvzwKXKkhMoZPllxPMZZ8PbCnF7cwlsRdKfOyBhDwFXNHaDzCA1zfUM6ETtXhF7/
         mGzwcI3nlVfLDWiW4rx/WDRqCH26X/HDWZe0VU1ZtXuMLTdeMlvzeVHXo0QMj+ygbj62
         a+e6ZI9rHBvlwv7uCX+N7F2i67zAcPE+bM1TxcADa25ywvOB9HaBuPiVBh4OaCyGXzHf
         QQl6YRh61o0+vJzCHqiErl8f45ZM8hEzDpQ878jY7YkHpOHwGSsOoMJ7HD16c3KiaH6J
         PS2R+Is1K0VoB7DJjKBYr7kP7Bh6aQ2FDhtDPbJnSc/nE6BJjIEvF93S9Yl4/ziIxbGP
         iW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759163750; x=1759768550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jl0TJzOw7c1N6d488hhXazm3UzzWpEQY1F2z0NOrldo=;
        b=kBXg13qVCjcKv9c6qqvIzCAGOY4tXd7DfckTycv0aJvH+6g9m4IDRXE6Cag0tkpHw/
         rr3M491j37ZwNZ1lr8KTWC+2zv9ZSuXwM8TrKHu96qi/az3W0f6QndqqsdS0pfsH/VuM
         uCWAYzV/+oWinRgtHWxWUar/SqrV3SsERVVR4HLjxevjuadIdaKK47vSU9GfVXiSJLF8
         7zEj22PtkOn+G4NYvIOcIBrraKbft3gfmf9nclKE8CR7gJvnmcEQOAJL1Qo/MQKNyQ0L
         3ShfHERzRLjHWhonRhypEXLeqFNVwKFRNr+JyHIQ8XuVou1lslkD5yzyfKSdAdqM02uH
         9HfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlRHiFp+mqekacv21K4+2K+VxywIvmtKWndwf7s3A+rbnaWeD7QUgmAWG/RElhw5Zbf/3b@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6deerqLnLPkcrtpXtff1JiCrFV/B9qDlLdXB+m4sJbB9o7s0V
	9faJpBMwXDer+zgvP1uQGM/b76WFSwO1fZf6VbEEoDWiOYKT+0Vpo7cw
X-Gm-Gg: ASbGncsOwueWJGo1w7n6uR29WX9yVIHJ4MzaT0cEUYyxkvht/AJ7eJHZFcOy4KTcydh
	ivWnKuMWj+WisHl07Wwxy4tWzRFfKnVgw0fJCaOV/Hwl8mna17KDFDZyGjPKJCqZSj8DNr2IN7X
	o9SFLTZNh57p9L5xUJ1qmxRa5qOYi6GWsdfq9wNQLo4eKYWjzI7F9T03vYR6xjuFRV1maKCofzo
	S64g+XVzP5w+dYOzkSP7Id66sI8GMswEJSWZkhq5cpyh0wPVwxWkx5icYRiIURhYHeZs267xBMB
	LIdPjAWx44BkMR5frQcQiqLYg9Ao2xGJbB44ETsRm6QN0DlkQLdwrD/2jP8+SCiMdcNN5KLR9MG
	yOW8LXsqdNVIMvNpGMI8=
X-Google-Smtp-Source: AGHT+IEe+mX5IHvRExB5eT7AjFhwBaVoLoo+nHJ/qfUKuNGScUHifc8/eCXvOh7oNHJaVtFlxJ8dFg==
X-Received: by 2002:a05:6a20:4324:b0:24e:2cee:957a with SMTP id adf61e73a8af0-2e7a69e5299mr11973213637.0.1759163749495;
        Mon, 29 Sep 2025 09:35:49 -0700 (PDT)
Received: from localhost ([104.249.174.141])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c06fe8sm11438810b3a.77.2025.09.29.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 09:35:49 -0700 (PDT)
From: Ben Guo <benx.guo@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: hust-os-kernel-patches@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] docs/zh_CN: Add translation of rust/testing.rst
Date: Mon, 29 Sep 2025 16:35:15 +0000
Message-ID: <20250929163531.376092-1-benx.guo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Complete the translation of rust/testing.rst and add the testing TOC entry
to rust/index.rst.

Add the translation based on commit a3b2347343e0
("Documentation: rust: testing: add docs on the new KUnit `#[test]` tests").

Signed-off-by: Ben Guo <benx.guo@gmail.com>
---
 .../translations/zh_CN/rust/index.rst         |   1 +
 .../translations/zh_CN/rust/testing.rst       | 215 ++++++++++++++++++
 2 files changed, 216 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/rust/testing.rst

diff --git a/Documentation/translations/zh_CN/rust/index.rst b/Documentation/translations/zh_CN/rust/index.rst
index b01f887e7167..efc2126f6307 100644
--- a/Documentation/translations/zh_CN/rust/index.rst
+++ b/Documentation/translations/zh_CN/rust/index.rst
@@ -19,6 +19,7 @@ Rust
     general-information
     coding-guidelines
     arch-support
+    testing
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/rust/testing.rst b/Documentation/translations/zh_CN/rust/testing.rst
new file mode 100644
index 000000000000..ca81f1cef6eb
--- /dev/null
+++ b/Documentation/translations/zh_CN/rust/testing.rst
@@ -0,0 +1,215 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/rust/testing.rst
+
+:翻译:
+
+ 郭杰 Ben Guo <benx.guo@gmail.com>
+
+测试
+====
+
+本文介绍了如何在内核中测试 Rust 代码。
+
+有三种测试类型：
+
+- KUnit 测试
+- ``#[test]`` 测试
+- Kselftests
+
+KUnit 测试
+----------
+
+这些测试来自 Rust 文档中的示例。它们会被转换为 KUnit 测试。
+
+使用
+****
+
+这些测试可以通过 KUnit 运行。例如，在命令行中使用 ``kunit_tool`` （ ``kunit.py`` ）::
+
+	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
+
+或者，KUnit 也可以在内核启动时以内置方式运行。获取更多 KUnit 信息，请参阅
+Documentation/dev-tools/kunit/index.rst。
+关于内核内置与命令行测试的详细信息，请参阅 Documentation/dev-tools/kunit/architecture.rst。
+
+要使用这些 KUnit 文档测试，需要在内核配置中启用以下选项::
+
+	CONFIG_KUNIT
+	   Kernel hacking -> Kernel Testing and Coverage -> KUnit - Enable support for unit tests
+	CONFIG_RUST_KERNEL_DOCTESTS
+	   Kernel hacking -> Rust hacking -> Doctests for the `kernel` crate
+
+KUnit 测试即文档测试
+********************
+
+文档测试（ *doctests* ）一般用于展示函数、结构体或模块等的使用方法。
+
+它们非常方便，因为它们就写在文档旁边。例如：
+
+.. code-block:: rust
+
+	/// 求和两个数字。
+	///
+	/// ```
+	/// assert_eq!(mymod::f(10, 20), 30);
+	/// ```
+	pub fn f(a: i32, b: i32) -> i32 {
+	    a + b
+	}
+
+在用户空间中，这些测试由 ``rustdoc`` 负责收集并运行。单独使用这个工具已经很有价值，
+因为它可以验证示例能否成功编译（确保和代码保持同步），
+同时还可以运行那些不依赖内核 API 的示例。
+
+然而，在内核中，这些测试会转换成 KUnit 测试套件。
+这意味着文档测试会被编译成 Rust 内核对象，从而可以在构建的内核环境中运行。
+
+通过与 KUnit 集成，Rust 的文档测试可以复用内核现有的测试设施。
+例如，内核日志会显示::
+
+	KTAP version 1
+	1..1
+	    KTAP version 1
+	    # Subtest: rust_doctests_kernel
+	    1..59
+	    # rust_doctest_kernel_build_assert_rs_0.location: rust/kernel/build_assert.rs:13
+	    ok 1 rust_doctest_kernel_build_assert_rs_0
+	    # rust_doctest_kernel_build_assert_rs_1.location: rust/kernel/build_assert.rs:56
+	    ok 2 rust_doctest_kernel_build_assert_rs_1
+	    # rust_doctest_kernel_init_rs_0.location: rust/kernel/init.rs:122
+	    ok 3 rust_doctest_kernel_init_rs_0
+	    ...
+	    # rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:150
+	    ok 59 rust_doctest_kernel_types_rs_2
+	# rust_doctests_kernel: pass:59 fail:0 skip:0 total:59
+	# Totals: pass:59 fail:0 skip:0 total:59
+	ok 1 rust_doctests_kernel
+
+文档测试中，也可以正常使用 `? <https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator>`_ 运算符，例如：
+
+.. code-block:: rust
+
+	/// ```
+	/// # use kernel::{spawn_work_item, workqueue};
+	/// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
+	/// # Ok::<(), Error>(())
+	/// ```
+
+这些测试和普通代码一样，也可以在 ``CLIPPY=1`` 条件下通过 Clippy 进行编译，
+因此可以从额外的 lint 检查中获益。
+
+为了便于开发者定位文档测试出错的具体行号，日志会输出一条 KTAP 诊断信息。
+其中标明了原始测试的文件和行号（不是 ``rustdoc`` 生成的临时 Rust 文件位置）::
+
+	# rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:150
+
+Rust 测试中常用的断言宏是来自 Rust 标准库（ ``core`` ）中的 ``assert!`` 和 ``assert_eq!`` 宏。
+内核提供了一个定制版本，这些宏的调用会被转发到 KUnit。
+和 KUnit 测试不同的是，这些宏不需要传递上下文参数（ ``struct kunit *`` ）。
+这使得它们更易于使用，同时文档的读者无需关心底层用的是什么测试框架。
+此外，这种方式未来也许可以让我们更容易测试第三方代码。
+
+当前有一个限制：KUnit 不支持在其他任务中执行断言。
+因此，如果断言真的失败了，我们只是简单地把错误打印到内核日志里。
+另外，文档测试不适用于非公开的函数。
+
+作为文档中的测试示例，应当像 “实际代码” 一样编写。
+例如：不要使用 ``unwrap()`` 或 ``expect()``，请使用 `? <https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator>`_ 运算符。
+更多背景信息，请参阅：
+
+	https://rust.docs.kernel.org/kernel/error/type.Result.html#error-codes-in-c-and-rust
+
+``#[test]`` 测试
+----------------
+
+此外，还有 ``#[test]`` 测试。与文档测试类似，这些测试与用户空间中的测试方式也非常相近，并且同样会映射到 KUnit。
+
+这些测试通过 ``kunit_tests`` 过程宏引入，该宏将测试套件的名称作为参数。
+
+例如，假设想要测试前面文档测试示例中的函数 ``f``，我们可以在定义该函数的同一文件中编写：
+
+.. code-block:: rust
+
+	#[kunit_tests(rust_kernel_mymod)]
+	mod tests {
+	    use super::*;
+
+	    #[test]
+	    fn test_f() {
+	        assert_eq!(f(10, 20), 30);
+	    }
+	}
+
+如果我们执行这段代码，内核日志会显示::
+
+	    KTAP version 1
+	    # Subtest: rust_kernel_mymod
+	    # speed: normal
+	    1..1
+	    # test_f.speed: normal
+	    ok 1 test_f
+	ok 1 rust_kernel_mymod
+
+与文档测试类似， ``assert!`` 和 ``assert_eq!`` 宏被映射回 KUnit 并且不会发生 panic。
+同样，支持 `? <https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator>`_ 运算符，
+测试函数可以什么都不返回（单元类型 ``()``）或 ``Result`` （任何 ``Result<T, E>``）。例如：
+
+.. code-block:: rust
+
+	#[kunit_tests(rust_kernel_mymod)]
+	mod tests {
+	    use super::*;
+
+	    #[test]
+	    fn test_g() -> Result {
+	        let x = g()?;
+	        assert_eq!(x, 30);
+	        Ok(())
+	    }
+	}
+
+如果我们运行测试并且调用 ``g`` 失败，那么内核日志会显示::
+
+	    KTAP version 1
+	    # Subtest: rust_kernel_mymod
+	    # speed: normal
+	    1..1
+	    # test_g: ASSERTION FAILED at rust/kernel/lib.rs:335
+	    Expected is_test_result_ok(test_g()) to be true, but is false
+	    # test_g.speed: normal
+	    not ok 1 test_g
+	not ok 1 rust_kernel_mymod
+
+如果 ``#[test]`` 测试可以对用户起到示例作用，那就应该改用文档测试。
+即使是 API 的边界情况，例如错误或边界问题，放在示例中展示也同样有价值。
+
+``rusttest`` 宿主机测试
+-----------------------
+
+这类测试运行在用户空间，可以通过 ``rusttest`` 目标在构建内核的宿主机中编译并运行::
+
+	make LLVM=1 rusttest
+
+当前操作需要内核 ``.config``。
+
+目前，它们主要用于测试 ``macros`` crate 的示例。
+
+Kselftests
+----------
+
+Kselftests 可以在 ``tools/testing/selftests/rust`` 文件夹中找到。
+
+测试所需的内核配置选项列在 ``tools/testing/selftests/rust/config`` 文件中，
+可以借助 ``merge_config.sh`` 脚本合并到现有配置中::
+
+	./scripts/kconfig/merge_config.sh .config tools/testing/selftests/rust/config
+
+Kselftests 会在内核源码树中构建，以便在运行相同版本内核的系统上执行测试。
+
+一旦安装并启动了与源码树匹配的内核，测试即可通过以下命令编译并执行::
+
+	make TARGETS="rust" kselftest
+
+请参阅 Documentation/dev-tools/kselftest.rst 文档以获取更多信息。
-- 
2.43.0

