Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7F2F39C7;
	Wed,  6 May 2026 06:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047564; cv=none; b=htclv38FXiEBxOwxTaNWx30vH7ZUL2VYt7U9uaGZ4T8c0pxrvmQZAV8gQfpQcCNTp9Itu2T0oBw3oz2SW+B7EAdhDzdTgpaQH1Owgoqt8Rjk2Jb9dFzjxgFDbGB5CrtfruGwQ27uhkAaXiwRj7W2+Bh0yVLwbjg2wLTN4/JKeS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047564; c=relaxed/simple;
	bh=xAgiCqsw+mFkV5AhkwbSJmdEm+tjsb/eLP1MLLT+jl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vr6Jzbgh3iu5OPo8utDZprhB/u/59JD7lradwNlsfkN/Y5Qu5Gd8vGfz4Tswn5TqrjVejgieMNYbtbfqSdYuChxwXmQei/k6Kw07xDH7ElMhJ1Kq4tzKJIacCvcHf+2Uz2cXCZnLlctxrNaemxWnM0eL0xh7tz1eCSipiCUmWuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NET4k3Y0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NET4k3Y0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC9AC2BCB8;
	Wed,  6 May 2026 06:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778047564;
	bh=xAgiCqsw+mFkV5AhkwbSJmdEm+tjsb/eLP1MLLT+jl8=;
	h=From:Date:Subject:To:Cc:From;
	b=NET4k3Y0Dcs8Gh8HEFGl9EQpAnTLZz0pQ80VPg462SRPcw0RgM5wh6xmD8LefRgXT
	 6NeBbAvocfuqOMPoMfuwAkSW//zJ20YFGZAuFXqhnTZu8Ey6MSPWo0cGj5EsQsMu9x
	 H6DqgXieYeL4/K67N3yGupabl04tTc3YxgX8hckX5M+f91TFvOciAnLDSteSoFMMqj
	 7BHxk1A1LQKCTjYWgHsbVw1SAsDtD5nc4sycqXCodlTJ2bVO47BY3wNlgEzRzdW15C
	 LuXo+BlmPX3jzyMhjR4+qhK51C1wATi7y91v/iOV0Em+b5zB8vzIneuxtWeqc5HlEG
	 +A5wLu3RSEqlw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 06 May 2026 14:05:54 +0800
Subject: [PATCH] usb: typec: intel_pmc_mux: Zero initialize num_ports in
 pmc_usb_probe()
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-typec-intel_pmc_mux-fix-uninit-num_ports-v1-1-929b128a32e9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNWwrCMBCF4a2UeXYgVpKqWxEJNh11xExDLtJSu
 vdGffzg8J8FEkWmBOdmgUgfTjxKxX7XgHve5EHIQzW0qjVKK4N5DuSQJdPbBu+sLxPeecIiLJx
 RirdhjDnhQZvuqE/UDdRDzYVIdfe7ulz/TqV/kcvfPqzrBh0RIC2MAAAA
X-Change-ID: 20260506-typec-intel_pmc_mux-fix-uninit-num_ports-3567859e7deb
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 "kernelci.org bot" <bot@kernelci.org>, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=nathan@kernel.org;
 h=from:subject:message-id; bh=xAgiCqsw+mFkV5AhkwbSJmdEm+tjsb/eLP1MLLT+jl8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJm/bnmVyks1Lun9X1Gy6/pxzlzHU73uy54yGzTfPH34V
 YNjQ4hTRykLgxgXg6yYIkv1Y9XjhoZzzjLeODUJZg4rE8gQBi5OAZiIsQXDH96d2y/MzD0mKyza
 3HvyMMPlOzM8rfcauLL+LGI/PXWp4jOG/6msM75rvva6qrY+ZfdRe9ZpUQLfTl0x2rp3s04QL9O
 db+wA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

Clang warns (or errors with CONFIG_WERROR=y / W=e):

  drivers/usb/typec/mux/intel_pmc_mux.c:740:3: error: variable 'num_ports' is uninitialized when used here [-Werror,-Wuninitialized]
    740 |                 num_ports++;
        |                 ^~~~~~~~~

This should have been initialized to zero. Do so now to clean up the
warning and ensure num_ports does not use uninitialized memory.

Fixes: 8bdb0b3830ea ("usb: typec: intel_pmc_mux: combine kzalloc + kcalloc")
Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://lore.kernel.org/177793914437.2560.9287713196857718000@997d03828cfd/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/usb/typec/mux/intel_pmc_mux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index e22b070a140f..219a32da1348 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -732,7 +732,7 @@ static int pmc_usb_probe(struct platform_device *pdev)
 {
 	struct fwnode_handle *fwnode = NULL;
 	struct pmc_usb *pmc;
-	u8 num_ports;
+	u8 num_ports = 0;
 	int i = 0;
 	int ret;
 

---
base-commit: 25bd55f46032656012eecdc6eabd62f2685a2ccc
change-id: 20260506-typec-intel_pmc_mux-fix-uninit-num_ports-3567859e7deb

Best regards,
--  
Cheers,
Nathan

