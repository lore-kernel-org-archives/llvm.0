Received: from zg8tmja2lje4os43os4xodqa.icoremail.net (zg8tmja2lje4os43os4xodqa.icoremail.net [206.189.79.184])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 532241ACDE8
	for <llvm@lists.linux.dev>; Wed, 23 Oct 2024 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.79.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697656; cv=none; b=QNwDHEaVmeRxZhn5LR5j3o5D4cNlo/YOkgb/r/2nXUa2GLCv1ne4D4Tl0rVGdGkRMjws4m7DxtUExGV6dOqu6iRyKl01WphCuvSFgnBnK0v5RQxSO4UvPkIbBlOsbsLqkbcIU3P4GyCTf/rTd1RkFkZiy1hcQw2i38aF/OMYS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697656; c=relaxed/simple;
	bh=sRG3sksCD+HaKbg5LrT4TyCeTwWp2s1EsevkaNuyUZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=B/0VCn0Rdx5/xdowELhB89uguoP1TSZJvEXWa5ocHFXLEIWuGYXwj2p42n9BDN0vWZA0inTQ8yjrdyeedxgsj4KyONq8oBoWms7Cfuoj8Nvqp+pPAPndiLgUwPX9vqm+60AQ8agHBcHPdXjfCRByE5t17R4hPl3rDXXmi7dOnxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=206.189.79.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrACXnztAFxlnvG58CA--.37156S2;
	Wed, 23 Oct 2024 23:33:20 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wC3sEM4FxlnydKZAA--.10656S2;
	Wed, 23 Oct 2024 23:33:13 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: si.yanteng@linux.dev,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: hust-os-kernel-patches@googlegroups.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH] docs/zh_CN: add the translation of kbuild/llvm.rst
Date: Wed, 23 Oct 2024 23:32:02 +0800
Message-ID: <20241023153235.1291567-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrACXnztAFxlnvG58CA--.37156S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxtry3tFWfXw47JrW3KFy3Arb_yoWftrWfpF
	Z7CryfGanxJFyjyryI9F4Duw1rCw4kCa4jv3WrJw10vr1IvFy0v3W2kFW093srW3yxC34U
	JFyfCr1jyFy7CrDanT9S1TB71UUUUbUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUHqb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26F
	4j6r4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_Jw0_GFyl42
	xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIccxYrVCIc48FwI0_Xr0_Ar1l
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
	6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07Ut3k
	ZUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Finish the translation of kbuild/llvm.rst and move llvm from TODO
to the main body.

Update to commit 145082ebfcf0 ("Documentation/llvm: turn make command
for ccache into code block")

Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
---
 .../translations/zh_CN/kbuild/index.rst       |   3 +-
 .../translations/zh_CN/kbuild/llvm.rst        | 203 ++++++++++++++++++
 2 files changed, 205 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/kbuild/llvm.rst

diff --git a/Documentation/translations/zh_CN/kbuild/index.rst b/Documentation/translations/zh_CN/kbuild/index.rst
index 0ba96aecb13a..3f9ab52fa5bb 100644
--- a/Documentation/translations/zh_CN/kbuild/index.rst
+++ b/Documentation/translations/zh_CN/kbuild/index.rst
@@ -17,6 +17,7 @@
     gcc-plugins
     kbuild
     reproducible-builds
+    llvm
 
 TODO:
 
@@ -25,7 +26,7 @@ TODO:
 - makefiles
 - modules
 - issues
-- llvm
+
 
 .. only::  subproject and html
 
diff --git a/Documentation/translations/zh_CN/kbuild/llvm.rst b/Documentation/translations/zh_CN/kbuild/llvm.rst
new file mode 100644
index 000000000000..f71092144a26
--- /dev/null
+++ b/Documentation/translations/zh_CN/kbuild/llvm.rst
@@ -0,0 +1,203 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/kbuild/llvm.rst
+:Translator: 慕冬亮 Dongliang Mu <dzm91@hust.edu.cn>
+
+==========================
+使用 Clang/LLVM 构建 Linux
+==========================
+
+本文档介绍如何使用 Clang 和 LLVM 工具构建 Linux 内核。
+
+关于
+----
+
+Linux 内核传统上一直使用 GNU 工具链（如 GCC 和 binutils）进行编译。持续的工作使得
+`Clang <https://clang.llvm.org/>`_ 和 `LLVM <https://llvm.org/>`_ 工具可
+作为可行的替代品。一些发行版，如 `Android <https://www.android.com/>`_、
+`ChromeOS <https://www.chromium.org/chromium-os>`_、`OpenMandriva
+<https://www.openmandriva.org/>`_ 和 `Chimera Linux
+<https://chimera-linux.org/>`_ 使用 Clang 编译的内核。谷歌和 Meta 的数据中心
+集群也运行由 Clang 编译的内核。
+
+`LLVM 是由 C++ 对象实现的工具链组件集合 <https://www.aosabook.org/en/llvm.html>`_。
+Clang 是 LLVM 的前端，支持 C 语言和内核所需的 GNU C 扩展，其发音为 "klang"，而非
+"see-lang"。
+
+使用 LLVM 构建
+--------------
+
+通过以下命令调用 ``make``::
+
+	make LLVM=1
+
+为主机目标进行编译。对于交叉编译::
+
+	make LLVM=1 ARCH=arm64
+
+LLVM= 参数
+----------
+
+LLVM 有 GNU binutils 工具的替代品。这些工具可以单独启用。以下是支持的 make 变量
+完整列表::
+
+	make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
+	  OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
+	  HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
+
+``LLVM=1`` 扩展为上述命令。
+
+如果你的 LLVM 工具不在 PATH 中，你可以使用以斜杠结尾的 LLVM 变量提供它们的位置::
+
+	make LLVM=/path/to/llvm/
+
+这将使用 ``/path/to/llvm/clang``、``/path/to/llvm/ld.lld`` 等工具。也可以
+使用以下命令::
+
+	PATH=/path/to/llvm:$PATH make LLVM=1
+
+如果你的 LLVM 工具带有版本后缀，并且你希望测试该特定版本而非无后缀的可执行文件，
+类似于 ``LLVM=1``，你可以使用 ``LLVM`` 变量传递该后缀::
+
+	make LLVM=-14
+
+这将使用 ``clang-14``、``ld.lld-14`` 等工具。为了支持带有版本后缀的树外路径组合，
+我们建议::
+
+	PATH=/path/to/llvm/:$PATH make LLVM=-14
+
+``LLVM=0`` 与省略 ``LLVM`` 完全不同，它将表现得像 ``LLVM=1``。如果你只希望使用
+某些 LLVM 工具，请使用它们各自的 make 变量。
+
+在通过不同命令配置和构建时，应为每次调用 ``make`` 设置相同的 ``LLVM=`` 值。如果
+运行的脚本最终会调用 ``make``，则还应将 ``LLVM=`` 设置为环境变量。
+
+交叉编译
+--------
+
+单个 Clang 编译器二进制文件（及其对应的 LLVM 工具）通常会包含所有支持的后端，这可以
+简化交叉编译，尤其是使用 ``LLVM=1`` 时。如果仅使用 LLVM 工具，``CROSS_COMPILE``
+或目标三元组前缀就变得不必要。示例::
+
+	make LLVM=1 ARCH=arm64
+
+作为混合 LLVM 和 GNU 工具的示例，对于像 ``ARCH=s390`` 这样目前尚不支持
+``ld.lld`` 或 ``llvm-objcopy`` 的目标，你可以通过以下方式调用 ``make``::
+
+	make LLVM=1 ARCH=s390 LD=s390x-linux-gnu-ld.bfd \
+	  OBJCOPY=s390x-linux-gnu-objcopy
+
+此示例将调用 ``s390x-linux-gnu-ld.bfd`` 作为链接器和
+``s390x-linux-gnu-objcopy``，因此请确保它们在你的 ``$PATH`` 中。
+
+当 ``LLVM=1`` 未设置时，``CROSS_COMPILE`` 不会用于给 Clang 编译器二进制文件
+（或相应的 LLVM 工具）添加前缀，而 GNU 工具则需要这样做。
+
+LLVM_IAS= 参数
+--------------
+
+Clang 可以编译汇编代码。你可以传递 ``LLVM_IAS=0`` 禁用此行为，使 Clang 调用
+相应的非集成汇编器。示例::
+
+	make LLVM=1 LLVM_IAS=0
+
+在交叉编译时，你需要使用 ``CROSS_COMPILE`` 与 ``LLVM_IAS=0``，从而设置
+``--prefix=`` 使得编译器可以对应的非集成汇编器（通常，在面向另一种架构时，
+你不想使用系统汇编器）。例如::
+
+	make LLVM=1 ARCH=arm LLVM_IAS=0 CROSS_COMPILE=arm-linux-gnueabi-
+
+Ccache
+------
+
+``ccache`` 可以与 ``clang`` 一起使用，以改善后续构建（尽管在不同构建之间
+KBUILD_BUILD_TIMESTAMP_ 应设置为同一确定值，以避免 100% 的缓存未命中，
+详见 Reproducible_builds_ 获取更多信息）::
+
+	KBUILD_BUILD_TIMESTAMP='' make LLVM=1 CC="ccache clang"
+
+.. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
+.. _Reproducible_builds: reproducible-builds.html#timestamps
+
+支持的架构
+----------
+
+LLVM 并不支持 Linux 内核所有可支持的架构，同样，即使 LLVM 支持某一架构，也并不意味着在
+该架构下内核可以正常构建或工作。以下是当前 ``CC=clang`` 或 ``LLVM=1`` 支持的架构总结。
+支持级别对应于 MAINTAINERS 文件中的 "S" 值。如果某个架构未列出，则表示 LLVM 不支持它
+或存在已知问题。使用最新的稳定版 LLVM 或甚至开发版本通常会得到最佳结果。一个架构的
+``defconfig`` 通常预期能够良好工作，但某些配置可能存在尚未发现的问题。欢迎在以下
+问题跟踪器中提交错误报告！
+
+.. list-table::
+   :widths: 10 10 10
+   :header-rows: 1
+
+   * - 架构
+     - 支持级别
+     - ``make`` 命令
+   * - arm
+     - 支持
+     - ``LLVM=1``
+   * - arm64
+     - 支持
+     - ``LLVM=1``
+   * - hexagon
+     - 维护
+     - ``LLVM=1``
+   * - loongarch
+     - 维护
+     - ``LLVM=1``
+   * - mips
+     - 维护
+     - ``LLVM=1``
+   * - powerpc
+     - 维护
+     - ``LLVM=1``
+   * - riscv
+     - 支持
+     - ``LLVM=1``
+   * - s390
+     - 维护
+     - ``LLVM=1`` （LLVM >= 18.1.0），``CC=clang`` （LLVM < 18.1.0）
+   * - um (用户模式)
+     - 维护
+     - ``LLVM=1``
+   * - x86
+     - 支持
+     - ``LLVM=1``
+
+获取帮助
+--------
+
+- `网站 <https://clangbuiltlinux.github.io/>`_
+- `邮件列表 <https://lore.kernel.org/llvm/>`_: <llvm@lists.linux.dev>
+- `旧邮件列表档案 <https://groups.google.com/g/clang-built-linux>`_
+- `问题跟踪器 <https://github.com/ClangBuiltLinux/linux/issues>`_
+- IRC: #clangbuiltlinux 在 irc.libera.chat
+- `Telegram <https://t.me/ClangBuiltLinux>`_: @ClangBuiltLinux
+- `维基 <https://github.com/ClangBuiltLinux/linux/wiki>`_
+- `初学者问题 <https://github.com/ClangBuiltLinux/linux/issues?q=is%3Aopen+is%3Aissue+label%3A%22good+first+issue%22>`_
+
+.. _zh_cn_getting_llvm:
+
+获取 LLVM
+---------
+
+我们在 `kernel.org <https://kernel.org/pub/tools/llvm/>`_ 提供预编译的稳定版 LLVM。
+这些版本已经针对 Linux 内核构建，使用配置文件数据进行优化。相较于其他发行版中的 LLVM，它们应该
+能提高内核构建时间。
+
+以下是一些有助于从源代码构建 LLVM 或通过发行版的包管理器获取 LLVM 的链接。
+
+- https://releases.llvm.org/download.html
+- https://github.com/llvm/llvm-project
+- https://llvm.org/docs/GettingStarted.html
+- https://llvm.org/docs/CMake.html
+- https://apt.llvm.org/
+- https://www.archlinux.org/packages/extra/x86_64/llvm/
+- https://github.com/ClangBuiltLinux/tc-build
+- https://github.com/ClangBuiltLinux/linux/wiki/Building-Clang-from-source
+- https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/
-- 
2.43.0

