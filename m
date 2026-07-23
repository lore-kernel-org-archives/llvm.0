Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E122931D2;
	Thu, 23 Jul 2026 21:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841413; cv=none; b=YB5CB0yi5Q0KuAaPCiZDuOomOwx9HPmY6DBQyrkdngvy3Xjzce2o5eXWNJTjnWxDamiS4FBJOC2XfAFiw64uxj+++GRWT3quHyMJ0GLSPRlKR3IrX00a51oo+0fE+AHpl8mlJDDI5RqWen7pH1kJVYsb/o3fxYL7GBtFRMTb5Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841413; c=relaxed/simple;
	bh=Y5ldl6wH28A4HC6wsNyowajS3TCFbRSJQL7uFSe7Xs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JjK1MHZYw+iENouDK0nP/WJ8HVK/zAuXu67b5C41jL9lelFoAVkX/XP2XpH6MoM0FkDnXj3A7ugLObMqzZSfz9Us2VGv14SsgQN6FdhRvtN+VPe/X0Hvl2qVx8yoFMQLXrzsty2+33iZYWSOTd2wg1eUpHoYjdAu1JgyIRbsWOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OT9eI+/e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OT9eI+/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB0051F000E9;
	Thu, 23 Jul 2026 21:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841412;
	bh=+Gbp1bgfHO44kelU7eSxwSMlWxO4+ZjEVSmyYMfwjs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OT9eI+/eX2Qtp6yQOzst6ob+mObklRrNDR0dWOKa6Al263h6rq+VK9EqU/cCxO/yp
	 Cf7rbQYhEOQW2GlO3wsR8n5aeDrqgity60IGksJXdsgntQeZt80z0RPLURZ9g7KkAx
	 XQyefokfjVFV61DWkOrkjmN6en2UGtBy0vdTCnur6Ka1uACbMCCWXJWiBmPsXaLIbH
	 4wh4J3g2VBBtrb7dbVoLR7MA4audZkEA+PqDDiwogbmtECiToMI+tNHCWON/lSueYh
	 wYyXS1/U+f0QIYZIBHQMrQ2NECSO8Wq9uKvzqgRfrD0f2RO4H3SHbVVnPagQxxtHWQ
	 eFroaDhhw35rQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Guru Das Srinagesh <linux@gurudas.dev>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Link Mauve <linkmauve@linkmauve.fr>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] samples: rust_dma: use vertical import style
Date: Thu, 23 Jul 2026 23:16:45 +0200
Message-ID: <20260723211645.3473315-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260721-rfl-vert-imp-v2-1-71ce0df519f2@gurudas.dev>
References: <20260721-rfl-vert-imp-v2-1-71ce0df519f2@gurudas.dev>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 21 Jul 2026 00:55:30 -0700, Guru Das Srinagesh wrote:
> [PATCH v2] samples: rust_dma: use vertical import style

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] samples: rust_dma: use vertical import style
      commit: fde6b526a9ee

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
