Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582604252D9
	for <llvm@lists.linux.dev>; Mon, 31 Aug 2026 15:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189466; cv=none; b=b9PA3JP+zLjnz6ydlWxWYsodXIYjl9DBvjVkVJlRXD89suFZZdpvdaqrW+1+jIY0Rh/URPsiwAYSbvI4vN0uDIrChmRX1lAeoiUU+DQeQ3kxR6vHlXkGeFe+ypqXlofQ47jXajnILDMMqnDeStY4EYRocxW4DXhe+gp+Ynp1jIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189466; c=relaxed/simple;
	bh=NLHPYEVz67Qeiyuh5hRfxCkCSiDUvhrSIJyAjTWA0oc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qX6r7FTe7uIl3x9nGqR57G4X1ap7tmq2dAHExVwyHOWRf0Y5tjl9gXwPXEBXWHBHkhS8Zba9yp+HCMNN+crW3luacqcU4QIO7cKIKZjwfO7rQtMBo7mE4T687l+Ft8DBQwhwRaO5YeNnnn78mpSYP2EWBjyiCgFRZk4SXNjT/QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rrwwRxD5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=aYePcOzB; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rrwwRxD5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="aYePcOzB"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hYXfl42PczKvtw;
	Mon, 31 Aug 2026 17:17:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788189455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NLHPYEVz67Qeiyuh5hRfxCkCSiDUvhrSIJyAjTWA0oc=;
	b=rrwwRxD5+8a4jGNpmNfzBookKzBcqVr26HEYrnSHPhWGHI/7dfxECRycPWXiyfD6KWEg+z
	0dj5XKzajm/xdSqbdTvAwznX2tQhRSuvNXMTl/ePfrEPd3ZlcT2jKJYGKs6Fo5xbVwT+sR
	WQ83TCyme79tmfXcDkPILr+a+e3vrtsZAKiYNsAwejnGqq3QolLd99/SzHey5PI7SBBlPi
	i9PE5NChcWgRLymCdOP4vD9jlMrmH9QOZYWpsLi66ot3KkcIqJNHr75ipfddRYduDTNg6c
	L229lMOPFLdUHdIY1oHCt1b5+H9/547/pBaCHD8fThfgOVil5y4W9BM1rv9lmQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788189453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NLHPYEVz67Qeiyuh5hRfxCkCSiDUvhrSIJyAjTWA0oc=;
	b=aYePcOzBXO7DcMRDujBJcW+KukM/X7wNLPPSwhbiZoyxxaq7x2PE65hFKWXo9yaWfLBHhV
	TgVYuaK0wS9GRfgoS8T05wO/CLF002Hi5Ek4OZir55LamqeWHLNxq2cbW04etqUSx3jIq3
	B0s+NXZvAjeGXyfgzUIBolHAioyzJCPclZ6jWMgFjVOZcOa4Axw18Ps4JFynhzsoKBeR3S
	wyYeKIiwXgFFu1jr7vJtLylEeDzZuh19QS52gVCEtEy5s8b0WoKQYUFr3DeMljeQ4IasFo
	svXgBgRl/5D2fC6/OOpGL3GaaJxb5LU3Nq/L/ifsmGs1fu1HMVGzsAz74DifFw==
To: Manuel Ebner <manuelebnerli@mailbox.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Daniel Pereira <danielmaraboo@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Avadhut Naik <avadhut.naik@amd.com>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
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
	Justin Stitt <justinstitt@google.com>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 0/4 v2] Docs: changes.rst: rework
Date: Mon, 31 Aug 2026 17:16:06 +0200
Message-ID: <20260831151605.638172-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wkp3fkz5wau7ksszt98krrtn3w3da9cr
X-MBO-RS-ID: 94b4a028783434410c0

There are a couple things fallacious in changes.rst. Issues are
inaccurate language (patch 1). Patch 2 adds toolsets and patch 3 updates
the list in the translations. Finally patch 4 is a preview for a way to
handle the marking of optional software.

---
->[v2]
Ditch the name change [PATCH 1/5 v1]
Add Acked-by: Randy Dunlap to [PATCH 1/4 v2], [PATCH 2/4 v2]
Add genisoimage, mtools and syslinux to list [PATCH 2/4 v2]
Ditch footnotes in favor of a column [PATCH 4/4 v2]

[v1]
 https://lore.kernel.org/all/20260812120805.1631430-3-manuelebnerli@mailbox.org/
---
