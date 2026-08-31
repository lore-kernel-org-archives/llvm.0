Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE73046E00B
	for <llvm@lists.linux.dev>; Mon, 31 Aug 2026 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189956; cv=none; b=P2M21Tbn6FNLZuXo8Kk5nEDFJlrIXOM7AY3kKxzWNuQcElqt/Dqr0EtJXaHqpEb52/tD63nNgGPzVv1m4lp3riByKMhM5WT62VQ0mVQ8e7kk8ci4PSv/3bjFDPDaKJcDRKZ4+7TVscex+62qbKRoSwiOt1zt88yu+ZcAdoXhL8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189956; c=relaxed/simple;
	bh=6n96KrwdCy1R3cw3knruAQ0UKZlgvvVlvt3iShTbow0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CDYzKmZlRUVt2mp1EXxphVfsUi6fxeeTzBrNtkzo1hfksFAR2rJ4GD2hF3rcj79WlXdLEvzdO8ZuQFiKQFwr1RKD2TY+9JhBaa3VIdb4lQk/0UNBGUeT426XluuYts0KzVH7t/ZVYUg67O1GAj0ayw/j378B30VZnHZO1nYLF0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e7oCxPWF; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lyUUATlF; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e7oCxPWF";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lyUUATlF"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hYXrB3KRlzMlL2;
	Mon, 31 Aug 2026 17:25:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788189946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ8wDwLUHHM5alMinMFlBdo6Q2IkABX6kyUMOvTWkHA=;
	b=e7oCxPWF3NTVpnQ2bA+aeknMUr64ME2cPO1jwtXEKA3FSl2Oeq6vwJreR80fGEz1LX6Ulk
	pJdVvcwFiMa9XjFQaZKPq8pewrbk60t7nmKmCpHggGnON/Rb3Kli2kCIARpKgou4n4dEWk
	J2ogLq+fPgUh9VvbCEcVA3oeERl4Uio2lOf3uq4ZCwL2H7//Xw0vowX+8s0BzVKTIkJzIM
	aM+MTgnTGHdaqmg+2M3NoEdFNVvUGRcOUngSxi8assCtcLd2bE9H4gA70wQxcEtPJU6uxw
	rxYfFHJy6paw2cNOc5BJF8ruZAswEq8evAmu1mv4Jw95KgJKBMRGGCGQXZRBKw==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788189944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yJ8wDwLUHHM5alMinMFlBdo6Q2IkABX6kyUMOvTWkHA=;
	b=lyUUATlF2stKxxDrIEWF2LTvNqGPKVzKZPNR6aYIf9hJJaSiAa1iLK4gecZfmNA/C7h5Zp
	X/Vl3IXKMg1MeS9ci0MRgvuYziRKZoJ8Zipr9XMdZEaOPNWeKQcJ1eOfaX67Z/s6NFnOM0
	36uZDjUeJCLezmj3Rc/dxgvT3mdQu4QIr7y7bAcB3bCFaYl4ZbMHqIOntH22GImM0eW4Lb
	6vrKQQwz17ZVMk5S//bIBOtxgxYWlGlOxTTEmGY6H/8l3Kf83UfNEnw06qQyxW8y577qMC
	1XEY0BRGJEybF1lEcIOqoi6QPRNvjPMGoxFbkIgQMyAG411ceE/bCr3MzcXKAw==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
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
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] v2 Docs: changes.rst: introduce optional column
Date: Mon, 31 Aug 2026 17:25:22 +0200
Message-ID: <20260831152523.638881-1-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: oc546a5fwr1qnkcp7tk1jgc3muciipkx
X-MBO-RS-ID: a45539c2849ffa04d06

The optional tag isn't obvious nor defined. Therefore replace with column.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/process/changes.rst | 84 +++++++++++++++----------------
 1 file changed, 42 insertions(+), 42 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index b3fa980b63e3..905ac0f6cdc5 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,49 +29,49 @@ systems; obviously, if you don't have any PC Card hardware, for example,
 you probably do not need to concern yourself with pcmciautils.
 
 ====================== ===============  ========================================
-        Program        Minimal version       Command to check the version
+        Program        Minimal version  Required for 
 ====================== ===============  ========================================
-bash                   4.2              bash --version
-bc                     1.06.95          bc --version
-bindgen (optional)     0.71.1           bindgen --version
-binutils               2.30             ld -v
-bison                  2.0              bison --version
-btrfs-progs            0.18             btrfs --version
-Clang/LLVM (optional)  17.0.1           clang --version
-e2fsprogs              1.41.4           e2fsck -V
-flex                   2.5.35           flex --version
-gdb                    7.2              gdb --version
-genisoimage            1.1.11           genisoimage --version
-GNU awk (optional)     5.1.0            gawk --version
-GNU C                  8.1              gcc --version
-GNU make               4.0              make --version
-GNU tar                1.28             tar --version
-GRUB                   0.93             grub --version || grub-install --version
-gtags (optional)       6.6.5            gtags --version
-iproute2               6.14.0           ip -V
-iptables               1.4.2            iptables -V
-jfsutils               1.1.3            fsck.jfs -V
-kmod                   13               kmod -V
-liblzma                5.8.1            lzma -V
-lzop                   1.04             lzop -V
-mcelog                 0.6              mcelog --version
-mkimage (optional)     2017.01          mkimage --version
-mtools                 4.0.49           mtools -V
-nfs-utils              1.0.5            showmount --version
-openssl & libcrypto    1.0.0            openssl version
-pahole                 1.26             pahole --version
-pcmciautils            004              pccardctl -V
-PPP                    2.4.0            pppd --version
-procps                 3.2.0            ps --version
-Python                 3.9.x            python3 --version
-quota-tools            3.09             quota -V
-Rust (optional)        1.85.0           rustc --version
-Sphinx\ [#f1]_         3.4.3            sphinx-build --version
-squashfs-tools         4.0              mksquashfs -version
-syslinux               6.04             syslinux --version
-udev                   081              udevadm --version
-util-linux             2.10o            mount --version
-xfsprogs               2.6.0            xfs_db -V
+bash                   4.2              
+bc                     1.06.95          
+bindgen                0.71.1           generate Rust bindings
+binutils               2.30             
+bison                  2.0              
+btrfs-progs            0.18             
+Clang/LLVM             17.0.1           alternative to GNU C (gcc)
+e2fsprogs              1.41.4           ext4
+flex                   2.5.35           
+gdb                    7.2              
+genisoimage            1.1.11           
+GNU awk                5.1.0            objtool
+GNU C                  8.1              
+GNU make               4.0              
+GNU tar                1.28             
+GRUB                   0.93             
+gtags (optional)       6.6.5            
+iproute2               6.14.0           
+iptables               1.4.2            
+jfsutils               1.1.3            
+kmod                   13               
+liblzma                5.8.1            
+lzop                   1.04             
+mcelog                 0.6              
+mkimage                2017.01          ARCH=arc, arm, or powerpc
+mtools                 4.0.49           
+nfs-utils              1.0.5            
+openssl & libcrypto    1.0.0            
+pahole                 1.26             
+pcmciautils            004              
+PPP                    2.4.0            
+procps                 3.2.0            
+Python                 3.9.x            
+quota-tools            3.09             
+Rust                   1.85.0           CONFIG_RUST=y
+Sphinx\ [#f1]_         3.4.3            
+squashfs-tools         4.0              
+syslinux               6.04             
+udev                   081              
+util-linux             2.10o            
+xfsprogs               2.6.0            
 ====================== ===============  ========================================
 
 .. [#f1] Sphinx is needed only to build the Kernel documentation
-- 
2.54.0

