Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5B043745F
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786537440; cv=none; b=pww8GCHkMZPNEMTUij5T9cHEaxp1fSyewnsovU+J061KqXcvcDy10xMfaiAAJ8BOMe1GuiS3lfCC/xqvWsed65sckGk34d4Hx5LjM30wFarFtIoCLGNWWO2Rx9nmKvPGALQ2R3svoKxHhm+HhVAON+y3Fa332olPSyCVkg6Oeck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786537440; c=relaxed/simple;
	bh=MmG6pz8BC9PL7Lkts8zhD5yZiBDQ5v03Wdub/TPuQ7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pKzto6bu7yBaWD00txSmyuxPzDqWFLvv6sVG2tNTSjVY3B2zd142p9hCmdFQnqlY7e/CrGChtq2FMegSYknONOFK1cT0Irb6f7LZls5WD3hYgEmNSm7eQ5wlgYNpkwFutBougyYbqymv0Joy0RVgxa8MaUbX2z/g8oagTOt82pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=dYVJeCfj; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=x7Pyubxt; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="dYVJeCfj";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="x7Pyubxt"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hKnj7427SzKnDc;
	Wed, 12 Aug 2026 14:23:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YDRuzc52swUCCTIQqOg6vUTQnIXc040LAGZrgvnGr8=;
	b=dYVJeCfjEBCh8h9UWlz6nAp9fGcyApNJ9l8NfkCRJwmRV9GCZwdFVcPIe7/zNDbvvEo8im
	aVjfSQm7pOz81FkoSMlRstwu32wBWiw1Th8Bwy2UeeCw5FJ+73dDAN0raPSaezsxkzob82
	m14Wm3DriVjKK2RROeg6ntmgkB8V2GwtwSn+MmeiMgNh871a3d7yNklKkeUJIlOBTgkcL6
	HWeGUQYQtVLqHMIPF5vtvjbKdaku9ZUONr/wkU48NcuTCl+5Jh4vPjzoURBukTtyQoitaY
	bzfEHUwmIRy8viRkvfgplGYgt7hzwtqlZWCpfbsrxGb68pHm5P/YYAPE14KITA==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786537433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7YDRuzc52swUCCTIQqOg6vUTQnIXc040LAGZrgvnGr8=;
	b=x7Pyubxt8i1zE6kfFnfRA31uYTdAXNUXUYfSi4aNVHsdB1udVBl/4pmyrnaQC/iYJdfKjD
	xa1VucpTHU4QZqdawJvAf6uLzjquuv/P0oRFMdde3CKnjJG0hsOsAsrss9sh875e9rkBdj
	rxNDBEq6x8yKoDdAWoDX5P9VbtdtC/MZBwobpQjOGsJUYFEuBdPBdodGx1H0Krr/Mtal15
	v5Cyz3ehFowH4ZB8dbR3zg+gDwhM4aIFnWvf8qkr8CCGKPWN9ysV1XmLjFyw7Dhf6RaBiM
	P+lURmWXB9ttTxJSKkvLe7bQgUFcrYRUJqCCiIJkrMp6Y+j1H6qDmMEJubL/1Q==
To: Federico Vaga <federico.vaga@vaga.pv.it>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/5] Docs: pt_BR, it_IT: software-requirements.rst: copy tables from source
Date: Wed, 12 Aug 2026 14:22:38 +0200
Message-ID: <20260812122248.1635676-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
References: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 8gszeyhsgw1nw5k67dqyr9jtemdxbtu9
X-MBO-RS-ID: 0273f2a14329ed7cd7b

Copy the list from Documentation/process/software-requirements.rst to /it_IT/
and /pt_BR/ with the purpose to update and sort the lists in the translations.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 .../it_IT/process/software-requirements.rst   | 57 ++++++++++---------
 .../pt_BR/process/software-requirements.rst   | 56 +++++++++---------
 2 files changed, 61 insertions(+), 52 deletions(-)

diff --git a/Documentation/translations/it_IT/process/software-requirements.rst b/Documentation/translations/it_IT/process/software-requirements.rst
index 7ee54c972418..a01c01f03354 100644
--- a/Documentation/translations/it_IT/process/software-requirements.rst
+++ b/Documentation/translations/it_IT/process/software-requirements.rst
@@ -32,40 +32,45 @@ PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciautils.
 ====================== =================  ========================================
         Programma       Versione minima       Comando per verificare la versione
 ====================== =================  ========================================
-GNU C                  8.1                gcc --version
-Clang/LLVM (optional)  17.0.1             clang --version
-Rust (opzionale)       1.78.0             rustc --version
-bindgen (opzionale)    0.65.1             bindgen --version
-GNU make               4.0                make --version
 bash                   4.2                bash --version
+bc                     1.06.95            bc --version
+bindgen (optional)     0.71.1             bindgen --version
 binutils               2.30               ld -v
-flex                   2.5.35             flex --version
 bison                  2.0                bison --version
-pahole                 1.16               pahole --version
-util-linux             2.10o              mount --version
-kmod                   13                 depmod -V
+btrfs-progs            0.18               btrfs --version
+Clang/LLVM (optional)  17.0.1             clang --version
 e2fsprogs              1.41.4             e2fsck -V
+flex                   2.5.35             flex --version
+gdb                    7.2                gdb --version
+GNU awk (optional)     5.1.0              gawk --version
+GNU C                  8.1                gcc --version
+GNU make               4.0                make --version
+GNU tar                1.28               tar --version
+GRUB                   0.93               grub --version || grub-install --version
+gtags (optional)       6.6.5              gtags --version
+ip-route2              6.14.0             ip -V
+iptables               1.4.2              iptables -V
 jfsutils               1.1.3              fsck.jfs -V
-xfsprogs               2.6.0              xfs_db -V
-squashfs-tools         4.0                mksquashfs -version
-btrfs-progs            0.18               btrfsck
+kmod                   13                 kmod -V
+liblzma                5.8.1              lzma -V
+lzop                   1.04               lzop -V
+mcelog                 0.6                mcelog --version
+mkimage (optional)     2017.01            mkimage --version
+nfs-utils              1.0.5              showmount --version
+openssl & libcrypto    1.0.0              openssl version
+pahole                 1.26               pahole --version
 pcmciautils            004                pccardctl -V
-quota-tools            3.09               quota -V
 PPP                    2.4.0              pppd --version
-nfs-utils              1.0.5              showmount --version
 procps                 3.2.0              ps --version
-udev                   081                udevd --version
-grub                   0.93               grub --version || grub-install --version
-mcelog                 0.6                mcelog --version
-iptables               1.4.2              iptables -V
-openssl & libcrypto    1.0.0              openssl version
-bc                     1.06.95            bc --version
-Sphinx\ [#f1]_         2.4.4              sphinx-build --version
-cpio                   any                cpio --version
-GNU tar                1.28               tar --version
-gtags (opzionale)      6.6.5              gtags --version
-mkimage (opzionale)    2017.01            mkimage --version
-Python (opzionale)     3.5.x              python3 --version
+Python                 3.9.x              python3 --version
+quota-tools            3.09               quota -V
+Rust (optional)        1.85.0             rustc --version
+Sphinx\ [#f1]_         3.4.3              sphinx-build --version
+squashfs-tools         4.0                mksquashfs -version
+udev                   081                udevadm --version
+util-linux             2.10o              mount --version
+xfsprogs               2.6.0              xfs_db -V
+xz                     5.8.1              xz -V
 ====================== =================  ========================================
 
 .. [#f1] Sphinx è necessario solo per produrre la documentazione del Kernel
diff --git a/Documentation/translations/pt_BR/process/software-requirements.rst b/Documentation/translations/pt_BR/process/software-requirements.rst
index 51c7fe41663e..6cbeecd2d7b9 100644
--- a/Documentation/translations/pt_BR/process/software-requirements.rst
+++ b/Documentation/translations/pt_BR/process/software-requirements.rst
@@ -31,41 +31,45 @@ PC Card por exemplo, provavelmente não precisará se preocupar com o pcmciautil
 ====================== ===============  ========================================
 Programa               Versão mínima    Comando para verificar a versão
 ====================== ===============  ========================================
-GNU C                  8.1              gcc --version
-Clang/LLVM (optional)  17.0.1           clang --version
-Rust (optional)        1.85.0           rustc --version
-bindgen (optional)     0.71.1           bindgen --version
-GNU make               4.0              make --version
 bash                   4.2              bash --version
+bc                     1.06.95          bc --version
+bindgen (optional)     0.71.1           bindgen --version
 binutils               2.30             ld -v
-flex                   2.5.35           flex --version
-gdb                    7.2              gdb --version
 bison                  2.0              bison --version
-pahole                 1.22             pahole --version
-util-linux             2.10o            mount --version
-kmod                   13               kmod -V
+btrfs-progs            0.18             btrfs --version
+Clang/LLVM (optional)  17.0.1           clang --version
 e2fsprogs              1.41.4           e2fsck -V
+flex                   2.5.35           flex --version
+gdb                    7.2              gdb --version
+GNU awk (optional)     5.1.0            gawk --version
+GNU C                  8.1              gcc --version
+GNU make               4.0              make --version
+GNU tar                1.28             tar --version
+GRUB                   0.93             grub --version || grub-install --version
+gtags (optional)       6.6.5            gtags --version
+ip-route2              6.14.0           ip -V
+iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
-xfsprogs               2.6.0            xfs_db -V
-squashfs-tools         4.0              mksquashfs -version
-btrfs-progs            0.18             btrfs --version
+kmod                   13               kmod -V
+liblzma                5.8.1            lzma -V
+lzop                   1.04             lzop -V
+mcelog                 0.6              mcelog --version
+mkimage (optional)     2017.01          mkimage --version
+nfs-utils              1.0.5            showmount --version
+openssl & libcrypto    1.0.0            openssl version
+pahole                 1.26             pahole --version
 pcmciautils            004              pccardctl -V
-quota-tools            3.09             quota -V
 PPP                    2.4.0            pppd --version
-nfs-utils              1.0.5            showmount --version
 procps                 3.2.0            ps --version
-udev                   081              udevadm --version
-grub                   0.93             grub --version || grub-install --version
-mcelog                 0.6              mcelog --version
-iptables               1.4.2            iptables -V
-openssl & libcrypto    1.0.0            openssl version
-bc                     1.06.95          bc --version
-Sphinx [#f1]_          3.4.3            sphinx-build --version
-GNU tar                1.28             tar --version
-gtags (opcional)       6.6.5            gtags --version
-mkimage (opcional)     2017.01          mkimage --version
 Python                 3.9.x            python3 --version
-GNU AWK (opcional)     5.1.0            gawk --version
+quota-tools            3.09             quota -V
+Rust (optional)        1.85.0           rustc --version
+Sphinx\ [#f1]_         3.4.3            sphinx-build --version
+squashfs-tools         4.0              mksquashfs -version
+udev                   081              udevadm --version
+util-linux             2.10o            mount --version
+xfsprogs               2.6.0            xfs_db -V
+xz                     5.8.1            xz -V
 ====================== ===============  ========================================
 
 .. [#f1] O Sphinx é necessário apenas para gerar a documentação do Kernel.
-- 
2.54.0

