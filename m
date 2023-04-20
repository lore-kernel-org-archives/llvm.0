Received: from xmbg8.mail.qq.com (xmbg8.mail.qq.com [210.51.43.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F6C8492
	for <llvm@lists.linux.dev>; Thu, 20 Apr 2023 13:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1681998154;
	bh=E7pJ8JH4za56KdbQ6Rbh54isxL4xVCKZ8wbfrIdCrY4=;
	h=From:To:Cc:Subject:Date;
	b=pLabmfCa/gxRzWkW5/T9w14q/nx8GCEHihjCcwq32ZIH9/jbYpJB/MG4hasbYwbl4
	 y/4sH7Vs1V7YJzUxFUDptsaPDw5HPc0QjzSzV43UyjXDgQuUS67PmbCoB6lwKC59Vb
	 /nkdJ70XxZ4/Zcoud4DMWM2PffqvRHIQKfkGgj+8=
Received: from localhost.localdomain.localdomain ([219.238.10.2])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 584A06E6; Thu, 20 Apr 2023 18:22:04 +0800
X-QQ-mid: xmsmtpt1681986124t3chxyu9v
Message-ID: <tencent_CB1A298D31FD221496FF657CD7EF406E6605@qq.com>
X-QQ-XMAILINFO: NDgMZBR9sMmaUT5c7qkd18KH0pTZHNxLkthc94tfL7YUCpyUPjjdyeaVUNbCkP
	 Xdgm/eyJwxAZS4dPTg2sKcLaUI8eaIhmLzOM0vNJDMaEdT7akJPqVx3mpJPekU0qOUDy8SvoBbMk
	 c0wcUflwJmMqIPdgAmXdGiW2FnU3oEWiWedOeqePUcnP4YW/EvkWPMYLmCBlLoJzF8erE5JqqBcm
	 wRiDheW/eTeACjfXNGZ/lr/Stb6heSJOYTCdVmOjAnOSYaUz2uR8Hh/4Xi3QYR/GHh65yPpzc2iW
	 u6TZMIyjlfNa0jQ9Su/5KaJYkTKcGoCAucH/loiVH8GotCg9IFpWKvGNDVe3lSO/EpR8XNJarsSc
	 Zo/Wcb/SgszkAWgdbqFg7w3YKPf9TEIjR/iZ6gVn82+jD1rnw5DFX4hmQ0O33m1pGT5XH2fVp0ke
	 UtQrLIPzFKh40cBcluvVmlgSm5nwOj0QbFCu4/vNaXHl03+sv/ROotLQ8LIOoS5f2JWTRIPH6gII
	 6cKEvHexMxgQOjAK3c5fzOYtCnoe2n3LydK0dimXW9Qn9YoooLJV53JgPESzKAQNRURLzux7jyRG
	 sqsNvx/zCYo2fhD7iI2GA7Zy65OpvxgN/rdnwaPBFeaR1IeCqPtHABnEzbOIqr7CmeQG9o/MIpRf
	 /wpXIciMOv7ZkrfBL9r0NR+DkF2WeLOGFg8ADgSPoY7tqlLp8ikJOJsIHSucjKjUcMOjUKqmX5VA
	 DzLlGOwjqNXAhSLI1hAdvhmAtvRY0Z5SN+myYvUckYKc2Y2+ukac6UfYlg1brXbnJfxVVtX/gStc
	 Lzeho3r0AclG1G2s/Tm0B8V96UncmB/PEs/udqPNEc/RdNgFcMCGlOLalNloWc2Gft+ZmCv4WTjj
	 FeZV9c7x3uMwT8CY9uJ+Qc9LZpL3wl5FXe4EVfYZjnFQAXS6ob7a5zJFgwpbgcXoO4wvWjjC4Lwe
	 haLUGrCRpt093vedzAr8jylwhgvlAU
From: Zipeng Zhang <zhangzipeng0@foxmail.com>
To: corbet@lwn.net
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	wedsonaf@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	trix@redhat.com,
	masahiroy@kernel.org,
	codeagain@codeagain.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	Zipeng Zhang <zhangzipeng0@foxmail.com>
Subject: [PATCH] Documentation/process/changes: Escape --options to fix Sphinx output
Date: Thu, 20 Apr 2023 18:21:31 +0800
X-OQ-MSGID: <20230420102131.16545-1-zhangzipeng0@foxmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add an escape character to resolve the problem of
"--version" being displayed as "–version".

Without such escaping, -- is rendered as – (en dash).

Signed-off-by: Zipeng Zhang <zhangzipeng0@foxmail.com>
---
 Documentation/process/changes.rst | 38 +++++++++++++++----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index ef540865ad22..2d2747e1964a 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,17 +29,17 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  5.1              gcc --version
-Clang/LLVM (optional)  11.0.0           clang --version
-Rust (optional)        1.62.0           rustc --version
-bindgen (optional)     0.56.0           bindgen --version
-GNU make               3.82             make --version
-bash                   4.2              bash --version
+GNU C                  5.1              gcc \--version
+Clang/LLVM (optional)  11.0.0           clang \--version
+Rust (optional)        1.62.0           rustc \--version
+bindgen (optional)     0.56.0           bindgen \--version
+GNU make               3.82             make \--version
+bash                   4.2              bash \--version
 binutils               2.25             ld -v
-flex                   2.5.35           flex --version
-bison                  2.0              bison --version
-pahole                 1.16             pahole --version
-util-linux             2.10o            fdformat --version
+flex                   2.5.35           flex \--version
+bison                  2.0              bison \--version
+pahole                 1.16             pahole \--version
+util-linux             2.10o            fdformat \--version
 kmod                   13               depmod -V
 e2fsprogs              1.41.4           e2fsck -V
 jfsutils               1.1.3            fsck.jfs -V
@@ -49,17 +49,17 @@ squashfs-tools         4.0              mksquashfs -version
 btrfs-progs            0.18             btrfsck
 pcmciautils            004              pccardctl -V
 quota-tools            3.09             quota -V
-PPP                    2.4.0            pppd --version
-nfs-utils              1.0.5            showmount --version
-procps                 3.2.0            ps --version
-udev                   081              udevd --version
-grub                   0.93             grub --version || grub-install --version
-mcelog                 0.6              mcelog --version
+PPP                    2.4.0            pppd \--version
+nfs-utils              1.0.5            showmount \--version
+procps                 3.2.0            ps \--version
+udev                   081              udevd \--version
+grub                   0.93             grub \--version || grub-install \--version
+mcelog                 0.6              mcelog \--version
 iptables               1.4.2            iptables -V
 openssl & libcrypto    1.0.0            openssl version
-bc                     1.06.95          bc --version
-Sphinx\ [#f1]_         1.7              sphinx-build --version
-cpio                   any              cpio --version
+bc                     1.06.95          bc \--version
+Sphinx\ [#f1]_         1.7              sphinx-build \--version
+cpio                   any              cpio \--version
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
-- 
2.39.2

