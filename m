Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F6743553A
	for <llvm@lists.linux.dev>; Wed, 12 Aug 2026 12:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536763; cv=none; b=MPie1k5TEyg4HRHrtN53yMWeMC5eQ47XejktjVrANzHGjoxBjfcN7pNJkWgM8xLm57a+WUFd/lg0CS+Fxhz9k42uiYyfuI2Hy094NfycfJ1pfztk5LnQsr9H6u+UJyfXkw/ANu8qd+izgmYcNvHWXa4nr3rcXe+qPz57T22Wk2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536763; c=relaxed/simple;
	bh=BgkvugXzJtWboTBw3owQz7iG7Oa2vU0ORDqi4XN+BHE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=YAr/yuzJooVEnMfVJubJnPmR7gGPNd4erCZNcUC89lQw2w+06lA/lJiOQcaOf98S57izI3+8gteQGyoEXQvXINkmoXx76YepFvf8p56dHSM8QH9tGntY1YXqW04nsIztJLcZFEX2TdJ2w03jieJwYuKFyRiXzX8dYYEs3LkXCkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=h4NEiP+E; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yXpKfJaD; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="h4NEiP+E";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yXpKfJaD"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hKnS70jm8zKvws;
	Wed, 12 Aug 2026 14:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786536759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BgkvugXzJtWboTBw3owQz7iG7Oa2vU0ORDqi4XN+BHE=;
	b=h4NEiP+EPTaBsxXO27U1GIvkwe0CNSwTcotvanCwbe7u8OXDlP3odxNXEKZLLngCsX/tco
	JrfURsHJfOa75a7OKuxmzrzmAB5YW2Oxck2DjXj5JyvqXLivOR+TlgxrPnHzgV2a2f7zna
	lPrjmZ7HAkW7YGRwjNZTawHl3yHnOq62YOGju5YJ1bkRVg1Au0QQg4ltZnGbbsIZKE4xcj
	uBlORtT+sbhOGWyU7T9mXktkm4Na4bHqCrrXs5fzaIJ7AD5plS3O5gfvj1wDiJrCh89Uyy
	SF+8/jyEA1yenO+DuiOs1/K9dhY5ZEM7eJRHu7j8r5+sshJoxlRJwbUCQLHdCQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=yXpKfJaD;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1786536757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BgkvugXzJtWboTBw3owQz7iG7Oa2vU0ORDqi4XN+BHE=;
	b=yXpKfJaDdlfE6VRwEcxTQjNyzezSNFY4tzRw5P8XacGmmLuQcq/VmRtGvQnmn0XWrjLgB4
	Y5nH2TXfJ4sMcS/iSVFFDMX82u/3jfhhEgsLmyFnSzsDdCApPAg+EBcz3Yj+bNhlO1ibGi
	/EC/icCR+ZXlxc+8etHXVZY9PYs72i5xZEcHMqCx8jVEfzpFVo7rRYd/B+RKzrqaOYCwzC
	MML9NnR4H/LRVx9/v2oAkPTRb/yBx52yethI+mMcnsZzwXheB5M91uXuZoKbKC45WDfNUu
	Mt/zYKBcDoJHn/2PnH/t5JvGyChVsi/8d28GohwUjt05yK64xPWQDIPhqlJqHw==
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
Subject: [PATCH 0/5] Docs: changes.rst: Rework
Date: Wed, 12 Aug 2026 14:08:04 +0200
Message-ID: <20260812120805.1631430-3-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: ba15805d1a4b4b63201
X-MBO-RS-META: x6m8j1xn3wbjwzdxkno9xfwou7n87d4c
X-Rspamd-Queue-Id: 4hKnS70jm8zKvws

There are a couple things fallacious with changes.rst. First and foremost the
name. Even though I do not really expect the name to change, it is fixed with
patch 1, because I think it is the right thing to do. Further issues are
inaccurate language (patch 2) and missing software (patch 3). Patch 4 is about
translations of the file. Final patch 5 tries to changes the way optional
software is marked.

I send this now to get some feedback before the merge window not because I'm
aiming at 7.3

