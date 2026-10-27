Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095889;
	b=cG7J5LQVQ+g3ahoXwlQaWVPvL77knJJCI/XiOG4eoE4DxRobea4FuIl1RGfhLkp73BAi
	 e8rLDzXHNS8J2mvD6Jfp2nDaQNk+33oXVUaF7LgXidVMnTvA50Jj8NiUup+qIryfyTPl2
	 hJIVu6p5he9qqrUQwIA4bU8FclCQv64pPSzrh9VkUYdxUylIe38BfgnnhHk9hTd7LdO75
	 HV0nvCfbRkWKUWLSdLTg5IR1TE9CLpWBBbHFnIIleWibEDJRhbL2U/RBDbMi24SSYolXg
	 WJsYlpeffHgZLywy/hbbBFQq84OKafokTsR0u5Kf2iYzXdpADlQ+f9OOne1sOVJ6Vqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095889;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=6/YeDfApI5/B3fTI9oySLeJfCoTRXv5iGAW4/NOdoFs=;
	b=mHWF+F3KLKZLQtsGjMmfPkc5kWN3DkQeKf/FS3n8Yrjk3dnutvfeXtdklBRKH34IAcnt
	 lpEjwX3D0NyGZ0lR2bE9zhQX8IylTM0VqjfYePuSH5Vmw6b8Y9xzMkZcM20BDKpXAZUZq
	 sLQbcaJQEZWcNpMSzl0kPEo2WK2NYc90iWkwsHJxs9DxrdH8yf4uTwBRSgkFrXhU7qd5j
	 Tkdh9ctC6tCCN4lsGXw6EPhjy6K3atFvjFeM8xHniNykLZmYQtjrkIMCl6WoCshAF1gmJ
	 2x7beah9RzTXH/08DMKXMS9jS8rECd6fcz8feKiFaqizW07lSJPEizOFXLH2n3vZBEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="m/srp5dq";
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b="m/srp5dq";
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DD9606A31B
	for <llvm@lists.linux.dev>; Tue, 27 Oct 2026 10:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9DD9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=m/srp5dq;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=m/srp5dq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0462322398;
	Tue, 27 Oct 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793095887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6/YeDfApI5/B3fTI9oySLeJfCoTRXv5iGAW4/NOdoFs=;
	b=m/srp5dqL68s4vJGzCtYzkB8SKIbnyeFPpANMDtZKZb9gUejNgu2DWG+/LHf54qfZPT4Nk
	J4EMzLzKTcULkzT6hyTeARxzCZ3fLV3mOeQSX7dn0hpidkdK+oRi3jwIWL9nB6yirSiZoW
	7XQGip+IDq12KNDlMUEPVd/uSbtJ8pE=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1793095887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=6/YeDfApI5/B3fTI9oySLeJfCoTRXv5iGAW4/NOdoFs=;
	b=m/srp5dqL68s4vJGzCtYzkB8SKIbnyeFPpANMDtZKZb9gUejNgu2DWG+/LHf54qfZPT4Nk
	J4EMzLzKTcULkzT6hyTeARxzCZ3fLV3mOeQSX7dn0hpidkdK+oRi3jwIWL9nB6yirSiZoW
	7XQGip+IDq12KNDlMUEPVd/uSbtJ8pE=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4115D1321C;
	Tue, 27 Oct 2026 10:11:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vp0xJcx44GrVewAAD6G6ig
	(envelope-from <wqu@suse.com>); Tue, 27 Oct 2026 10:11:24 +0000
From: Qu Wenruo <wqu@suse.com>
To: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] .gitignore: ignore GNUmakefile
Date: Tue, 27 Oct 2026 20:41:06 +1030
Message-ID: <1b0822425d9c76cbf7dc4e5fe9eedf62ac153b56.1793095807.git.wqu@suse.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-11.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.995];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -11.80
X-Spam-Level: 
X-Spam-Flag: NO

I use GNUmakefile to shorten the command of "make".

E.g. for my arm64 worktree, I have a GNUmakefile with:

 export ARCH := arm64
 export LLVM := 1
 export PACMAN_PKGBASE := linux-arm64-custom
 export PACMAN_EXTRAPACKAGES :=
 export PKGEXT := .pkg.tar
 MAKEFLAGS += -j12
 include Makefile

And for my x86_64 worktree, it looks a little simpler:

 export LLVM := 1
 export PACMAN_PKGBASE := linux-custom
 export PACMAN_EXTRAPACKAGES :=
 export PKGEXT := pkg.tar
 MAKEFLAGS += -j12
 include Makefile

So at least in my case, GNUmakefile is really a shortcut to specify
extra environment variables and build flags.
Thus it should be added to gitignore.

Signed-off-by: Qu Wenruo <wqu@suse.com>
---
Changelog:
v2:
- Limit the GNUmakefile to the top-level directory
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index 9875120ea7bd..6f018294a119 100644
--- a/.gitignore
+++ b/.gitignore
@@ -194,3 +194,6 @@ sphinx_*/
 
 # bc language scripts (not LLVM bitcode)
 !kernel/time/timeconst.bc
+
+# GNUmakefile, mostly to export extra env variables or build flags
+/GNUmakefile
-- 
2.56.0

