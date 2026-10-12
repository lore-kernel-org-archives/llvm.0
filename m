Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E81181334;
	Mon, 12 Oct 2026 08:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794054; cv=none; b=b3ble1FQ/sFqdnOtlahfarAz7EUCDiks11fPy+4WZqItACUuvtjTTKKYqM8YQ+WxUKSXa82UNkVPczbqLf/Y8SmoT/iLx8CBNAJst8wMN7QbS6HvvSrR9PwEAaLJJDU9MomaDWm8989G/S8oOKGUZk6HAMKguMdU23IqhfGViOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794054; c=relaxed/simple;
	bh=rlV7ifkIwC/KVr8kwqXO1WuvmE50SIJfXcvDBgln/zQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t5LhbjBkQ0iHzlexX9Dg4pzRUQQjf/H34ndjg23MdYCHvPgAEitgO5HbcGaW5SRt/GPIXN5FjyesjOO/vLTtfpsyH6Ja4z0/H/xy5WWGRDhBNCT1JFYyOfbivk5tVauxXNwmVJXowsa9XdLT8ivqYC9AztaINxIlUwx+XBN2HKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fmNjlvgf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fmNjlvgf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A161F0089B;
	Mon, 12 Oct 2026 08:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794052;
	bh=UEzaTZuBEiAvww4S+VIm/R7VA+NaE4gP3nzJQbGS++k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fmNjlvgfSwedvrVlmRLUtI75y5t1R0Ma58PBz3Mhcky4k4VeaVtrChwOIcDp6UxoB
	 H8D8B98HnUa3B6x1UyvLcHYGiKEW04DA/IV5pXFSJMIaxsSqbLA38Y/VvrqdM0xq8O
	 MA1cw5bKGR2MWEr+AgYn3Fz3eew7lgE40LYyEWgX3DWuNwsmnJi27E9abYqYzAkgJ5
	 dxh9OYXhnAWxSzZzNl/qZrVbBB9B+ZV2+SzABld4IZSa1xS0A4Ti/MPm+6kNXtgXPM
	 7YLMT03CQ4xgULzDcjT5Q3RxprsFfuLujTb+wsp3SE/nrR2MKnWuORZcIJzXwYlDqR
	 3E9ME2CWGKCKQ==
From: Christian Brauner <brauner@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>, 
 Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev
In-Reply-To: <20261011223358.2327625-14-sashal@kernel.org>
References: <20261011223358.2327625-14-sashal@kernel.org>
Subject: Re: [PATCH] samples: pidfd: fix userprogs typo
Message-Id: <20261012-sinkflug-laute-eindecken-7c886e292bf0@brauner>
Date: Mon, 12 Oct 2026 10:34:08 +0200
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-3d1b8

On Sun, 11 Oct 2026 18:33:42 -0400, Sasha Levin wrote:
> The Makefile adds pidfd-metadata to "usertprogs-always-y", which kbuild
> does not know, so the sample has not been built since the conversion to
> userprogs, even with CONFIG_SAMPLE_PIDFD=y.
> 
> Fix the variable name. pidfd-metadata.c builds without warnings with
> gcc and clang for x86_64 and arm64.
> 
> [...]

Applied to the vfs.fixes branch of the vfs/vfs.git tree.
Patches in the vfs.fixes branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.fixes

[1/1] samples: pidfd: fix userprogs typo
      https://git.kernel.org/vfs/vfs/c/5355aea1165e

