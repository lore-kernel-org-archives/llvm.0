Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24FB1CF9B
	for <llvm@lists.linux.dev>; Fri, 26 Jul 2024 14:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722005900; cv=none; b=j3XZmVd1L8bpBlQVYFL/dzYPdqQMy5hbhKUpLtBJtxLM/JRel1XaYWBkh2nubD9g6ieOX5aW0BDGqNAwJkatp2ob2x5W1Cmmttyws3bs7xPe9GyK5H9KiB5nE2Lb/37aJlLh9Q//wCLvnjLMwtjuJ3OFX1cy6nTK60hPAeN9tPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722005900; c=relaxed/simple;
	bh=dzlJqty6mK3u9JfGL9aBf3nIxzEBSXB1Yp38r35/d6k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nuQ+EO1kd5qa5PfU6EXoK1vNmEqooHkWZn5xrph47Jry/IvhFGPsUAq7ghivwTTmzFiZncewhwkkI6XmOq8emcg7ROBSS57YqkjJ2uLoKTajfIAt9nAfEa3H+7wq2pOlZre5kx3eCAZuG0KJcfG3kJ+4lh/xjX+X7TshJq0eG3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrAB312x6uaNmkbMHAg--.33883S2;
	Fri, 26 Jul 2024 22:58:02 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wDnOCx3uaNmQNwHAA--.3379S2;
	Fri, 26 Jul 2024 22:58:00 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] docs/zh_CN: add the translation of kbuild/headers_install.rst
Date: Fri, 26 Jul 2024 22:57:23 +0800
Message-ID: <20240726145754.2598197-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAB312x6uaNmkbMHAg--.33883S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxZF13tFW5GF1UuF47Kr1rJFb_yoWrKF1xp3
	WqgryxKF4UJFyakFyfGFW7GF1rGan29ay7t3WxJ34aqryrJFW8trnFvrySgrn7KrW8AFyU
	WF40qa4jkrW7A3DanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQIb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42
	xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUnFD73UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Finish the translation of kbuild/headers_install.rst and
kbuild/index.rst, then add kbuild into zh_CN/index.rst.

Update to commit 5b67fbfc32b5 ("Merge tag 'kbuild-v5.7' of
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../zh_CN/kbuild/headers_install.rst          | 39 +++++++++++++++++++
 .../translations/zh_CN/kbuild/index.rst       | 35 +++++++++++++++++
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/kbuild/headers_install.rst
 create mode 100644 Documentation/translations/zh_CN/kbuild/index.rst

diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index 20b9d4270d1f..7574e1673180 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -89,10 +89,10 @@ TODOList:
    admin-guide/index
    admin-guide/reporting-issues.rst
    userspace-api/index
+   内核构建系统 <kbuild/index>
 
 TODOList:
 
-* 内核构建系统 <kbuild/index>
 * 用户空间工具 <tools/index>
 
 也可参考独立于内核文档的 `Linux 手册页 <https://www.kernel.org/doc/man-pages/>`_ 。
diff --git a/Documentation/translations/zh_CN/kbuild/headers_install.rst b/Documentation/translations/zh_CN/kbuild/headers_install.rst
new file mode 100644
index 000000000000..50ab819a7f96
--- /dev/null
+++ b/Documentation/translations/zh_CN/kbuild/headers_install.rst
@@ -0,0 +1,39 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/kbuild/headers_install.rst
+:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+============================
+导出内核头文件供用户空间使用
+============================
+
+"make headers_install" 命令以适合于用户空间程序的形式导出内核头文件。
+
+Linux 内核导出的头文件描述了用户空间程序尝试使用内核服务的 API。这些内核
+头文件被系统的 C 库（例如 glibc 和 uClibc）用于定义可用的系统调用，以及
+与这些系统调用一起使用的常量和结构。C 库的头文件包括来自 linux 子目录的
+内核头文件。系统的 libc 头文件通常被安装在默认位置 /usr/include，而内核
+头文件在该位置的子目录中（主要是 /usr/include/linux 和 /usr/include/asm）。
+
+内核头文件向后兼容，但不向前兼容。这意味着使用旧内核头文件的 C 库构建的程序
+可以在新内核上运行（尽管它可能无法访问新特性），但使用新内核头文件构建的程序
+可能无法在旧内核上运行。
+
+"make headers_install" 命令可以在内核源代码的顶层目录中运行（或使用标准
+的树外构建）。它接受两个可选参数::
+
+  make headers_install ARCH=i386 INSTALL_HDR_PATH=/usr
+
+ARCH 表明为其生成头文件的架构，默认为当前架构。导出内核头文件的 linux/asm
+目录是基于特定平台的，要查看支持架构的完整列表，使用以下命令::
+
+  ls -d include/asm-* | sed 's/.*-//'
+
+INSTALL_HDR_PATH 表明头文件的安装位置，默认为 "./usr"。
+
+该命令会在 INSTALL_HDR_PATH 中自动创建创建一个 'include' 目录，而头文件
+会被安装在 INSTALL_HDR_PATH/include 中。
+
+内核头文件导出的基础设施由 David Woodhouse <dwmw2@infradead.org> 维护。
\ No newline at end of file
diff --git a/Documentation/translations/zh_CN/kbuild/index.rst b/Documentation/translations/zh_CN/kbuild/index.rst
new file mode 100644
index 000000000000..b9feb56b846a
--- /dev/null
+++ b/Documentation/translations/zh_CN/kbuild/index.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/kbuild/index
+:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+============
+内核编译系统
+============
+
+.. toctree::
+    :maxdepth: 1
+
+    headers_install
+
+TODO:
+
+- kconfig-language
+- kconfig-macro-language
+- kbuild
+- kconfig
+- makefiles
+- modules
+- issues
+- reproducible-builds
+- gcc-plugins
+- llvm
+
+.. only::  subproject and html
+
+   目录
+   =====
+
+   * :ref:`genindex`
-- 
2.43.0

