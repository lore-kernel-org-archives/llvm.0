Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDE54A32;
	Wed, 28 Feb 2024 01:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709084758; cv=none; b=S4s72JEc0X6R1glFsZlxsWsDutax+cinKwBeWZW48fRUF3RCK1zpySM3yapJ+4pQMNtGXGRSLxHv5icrsnPPobaoJyQGTCshjVJaaEzA7TLnAw06zJfPUrQUMQapu71sopWpieS3XPtVy8cu49Bf+Bo514wiPEVzu7kQ+x2avjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709084758; c=relaxed/simple;
	bh=xklcXaT4eTFbG1Se3wPnwYyKUpa9I+yjQPpHl5UYWHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U42L5V+ZoINwEBJ5FioJsdU82a2etmclOaNz+fBPck9iyxPRll1UCgbADASJIYJWhcL4mE7Jku+cLZ23m9bN5HpoFgNQFyEOck0m2EMSiTxFfSAXDvT6ED1J75/dhJ+bG2qE8Ofm/BbAL4fAkNhgsVAzMn0/5gN6oJtBkR4756Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1o2nvXp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1o2nvXp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B25EC433F1;
	Wed, 28 Feb 2024 01:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709084757;
	bh=xklcXaT4eTFbG1Se3wPnwYyKUpa9I+yjQPpHl5UYWHk=;
	h=Date:From:To:Cc:Subject:From;
	b=k1o2nvXp5EtvIzAJsZdS4HVaUtlu2Q+gBiNAqnYIRCBT+FydDt1frqGHPHoGMtFVS
	 b9YOisZu6kY4XeHewr6V+b4+d01/ZiFM49wqxzdaJkdKg4m3dP09Yb08o269aDG9Kg
	 JMNXu33I0T+oxNzJedrVag+hiODUTlLDBAO4fRwMUCAgu0Y88hmrUr/Uwsm2JTgRvJ
	 jknM1xzdEpYoPNfvT2BQcFyRi+pRM21RQqOta/GDrE6ah9/lfNZdpTbAGXeYcuoAsn
	 0JZvT5xG9AULMyYf7WEsKWAnHH+URMn9Ge8623Rp26DsRdkkBEQiHKweoIG/V/Ik5S
	 zDewdYhP+DSow==
Date: Tue, 27 Feb 2024 18:45:55 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Please apply commit 5b750b22530fe53bf7fd6a30baacd53ada26911b to
 linux-6.1.y
Message-ID: <20240228014555.GA2678858@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

Please apply upstream commit 5b750b22530f ("drm/amd/display: Increase
frame warning limit with KASAN or KCSAN in dml") to linux-6.1.y, as it
is needed to avoid instances of -Wframe-larger-than in allmodconfig,
which has -Werror enabled. It applies cleanly for me and it is already
in 6.6 and 6.7. The fixes tag is not entirely accurate and commit
e63e35f0164c ("drm/amd/display: Increase frame-larger-than for all
display_mode_vba files"), which was recently applied to that tree,
depends on it (I should have made that clearer in the patch).

If there are any issues, please let me know.

Cheers,
Nathan
