Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 517606116
	for <llvm@lists.linux.dev>; Tue, 11 Jun 2024 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091468; cv=none; b=Ban31ByHsAWCEeWv+3gXeVf20d60XHC94xZ+JgnvNndKRTpNMfkVXznrwh3TdaunvXvNeHw9MUDKjUf/FM2yUXcuDLXDoIJQPRkl0KQ4G5C1N+tZWfC/DO3iZWhDfk6Ms4yDNImsqe7l8t/TlAmltPAnF9pMY/vT73PSBH0gGuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091468; c=relaxed/simple;
	bh=72lUgCjhFS9CofYliVXKecRiALBrHqQMHHGrzotam3c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FCN8sYgDrCwNxj/wQ75nj6HCtVNUbPxfDCXW0Xz2sMPgO33U85nrSQF2ph0Cp7ibv6GXNMsSIsrf44lO9+0HL0rAhikD7s3d6dx2WmzpiCUSz5KpKuuokNH8Wh/BjYn3x5jOzG/snB57ALkFr+Ub5ySdzk4706AdIBlLEPvIS04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPSA id 3201060198657;
	Tue, 11 Jun 2024 15:37:20 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: jonathan.derrick@linux.dev,
	axboe@kernel.dk,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com
Cc: Su Hui <suhui@nfschina.com>,
	jarkko@kernel.org,
	gjoyce@linux.vnet.ibm.com,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] block: sed-opal: avoid possible wrong address reference in read_sed_opal_key()
Date: Tue, 11 Jun 2024 15:37:00 +0800
Message-Id: <20240611073659.429582-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) warning:
block/sed-opal.c:line 317, column 3
Value stored to 'ret' is never read.

Fix this problem by returning the error code when keyring_search() failed.
Otherwise, 'key' will have a wrong value when 'kerf' stores the error code.

Fixes: 3bfeb6125664 ("block: sed-opal: keyring support for SED keys")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 block/sed-opal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/sed-opal.c b/block/sed-opal.c
index 14fe0fef811c..598fd3e7fcc8 100644
--- a/block/sed-opal.c
+++ b/block/sed-opal.c
@@ -314,7 +314,7 @@ static int read_sed_opal_key(const char *key_name, u_char *buffer, int buflen)
 			      &key_type_user, key_name, true);
 
 	if (IS_ERR(kref))
-		ret = PTR_ERR(kref);
+		return PTR_ERR(kref);
 
 	key = key_ref_to_ptr(kref);
 	down_read(&key->sem);
-- 
2.30.2

