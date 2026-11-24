Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795532563;
	b=5Ac1yz2ryXse2j001NJHNTNGfBCYtMw2pZ9XAM5n2YYkz88sGg1T5nw/LTq/sdscuLgR
	 nhMVyF4FFQzRPJL0l/qA79SVdvsgFrXKk4ibgi4/TsR5f/FcxHbU6deYyrUZ0hLiT5SGC
	 leKwoiqO84ikDx1WcGhxzcbhr4BtMj/JEsiPY6rr9IS10PsGgNOjBT4lfFVqoYbwkoKJh
	 Gl+VPqOXQWa80uberSzBwKTZEXVRlcmNXyDyJNZEKVmzzcqWmePz1DXl3iY3rl4yPafAT
	 XfBJmjBM8GOkFeHkUinnoICzGrXcY0VUquD7LuC+0RrmPGsllxeW06RbfKyb5uNgOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795532563;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=/2YTiD7W3HO1AsCXEsbdjTD6UDZx8pPc9redwqi69eY=;
	b=mW7vv2bmV0O24bQgd33y2DaNkyOsPWNEikBNd2BCHhpxizUx/LKtG5U0NdhPUMecQR9f
	 b/bGZSKeZ+Dmk5vjXX8Wcuowg623BYoGQ73vrMyRCus1VqWcEGu+JxnMHrxoRMxxff48p
	 FP5wKQCS7sxi7w/Spj+APzLA2acn3N89AbAT1B9vsWB8/kjF/kjgqZ/0qas4f2Eh+dYvn
	 lTcNqBJY2dB6hyTq9oh3J0l6u2WZfI4VKHR08wERvDNGeRlOS4415IukPFVcsWaVo48z4
	 x2wLGWYMcrau6iYyArRUxnW6/KmLr5iGAAEp+ulRu0sRSflZS1+hSKdPS5Ryowv9HBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxX1pGvm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F761606A334;
	Tue, 24 Nov 2026 15:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hxX1pGvm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09D21F000E1;
	Tue, 24 Nov 2026 15:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795532562;
	bh=/2YTiD7W3HO1AsCXEsbdjTD6UDZx8pPc9redwqi69eY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hxX1pGvmt2SJyL5ZYhiw1GUR93J0tYGMVLufq343liRCeW0PY7ZMRhdOM3SRxpLyM
	 x8B3odsIaK5mBdS4qL5zveJGN8Mg9gpojQLzdyh7YfPBBJ/iy41FCSA54XBiOcGOUr
	 /+TPz6u1diN6OdhT90vMlk6COzgshcQklKh3hDGg6AeONdE1a+WiajfJcKam/Nw6kR
	 j02/73mVT0Z6n1tNiHrlmfsIlGJrng+D2dxp8uNs1WhB0ADhskEIK6pguqHoQt09PT
	 8uuK9ZfA1xWVnss7za2FN2gP/Zi0F3HA1w04onJLQGXw5+qzlZAbdRs5Wr/c1bNxf2
	 tmDp59bKNRA/Q==
From: Mark Brown <broonie@kernel.org>
To: Elkin Cruz <elkin@google.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, irogers@google.com
In-Reply-To: <20261120190442.2851983-1-elkin@google.com>
References: <20261120190442.2851983-1-elkin@google.com>
Subject: Re: [PATCH] regmap: guard DEFINE_FREE(regmap_field) against
 ERR_PTR values
Message-Id: <179552828430.264265.12790396165505407935.b4-ty@b4>
Date: Tue, 24 Nov 2026 13:51:24 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142; i=broonie@kernel.org;
 h=from:subject:message-id; bh=H/xokeoG0tJ6qhDSkXi/L6XWm1LIQt1tT8PFRD53Lm0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJZlwuYmjTc3X5m85no2GVTV/vNqC+J9bNvVPsb1+XCo
 ZTSZnm6o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNh3svIsEDg79MiSYfHT1cs
 SZb6tKu6d7UAU8sO3izvG6ekojU7+hkZLruyVEW+rLrU++uP0LNjV1oyzddcaiiM8P/Ek2ranb2
 MAwA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 20 Nov 2026 19:04:42 +0000, Elkin Cruz wrote:
> regmap: guard DEFINE_FREE(regmap_field) against ERR_PTR values

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/1] regmap: guard DEFINE_FREE(regmap_field) against ERR_PTR values
      https://git.kernel.org/broonie/regmap/c/573c689219af

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

