Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C42C218AAD;
	Wed, 14 Jan 2026 13:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768397276; cv=none; b=fOM1kuXU9HKO8Tg4CYv2GRamAB3FJCZorTFzSVovE827bam0dykqxewBq9LCqG9I3/j0BDyBaAr6kVh7HjRMJOjcb9jmGBuqEaUNbxrWweAnPsb46VocAyz1O7DXXwslBqhefhPd4KfvOO8yA5uQC2xRdjhs2WsnMtq3tBfFw6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768397276; c=relaxed/simple;
	bh=/D1sm2jr7C/VgsMKb76JHwW90ukFWumyizc2i36ozH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rvh7haBoYfDFA1IPFvV6F1NCMjEPEzcadNzMC+u1j7R4UN9q0z7hLcs90IZIcq2mOrDvG1jq5mKtLltTvuAvhf3GjWUEtatc0cet0ksGpPr96iux94T8+pB2UbbEaB3aBtSw8NFCGmhK7SqjqLtA53SvcWifLkmadSZ5X2VUhzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8KmqRYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8KmqRYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F3FAC4CEF7;
	Wed, 14 Jan 2026 13:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768397276;
	bh=/D1sm2jr7C/VgsMKb76JHwW90ukFWumyizc2i36ozH0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s8KmqRYopFJynletMiKE4ODLEIyvJBt2zbgNpFFOiVz0GS1A/XT7Rc2t2ObrMEj+y
	 Pv+hrBlaGY1P0hmiX81UQ3Kp7bwsJBXc7+cEr4sNYBK+9SrFebILBlVP680DgzII+w
	 iajRt8EyPmYfQ5FMLTzccURPQAcRZupOAbqifVN089fqffFH6MzIoftCHF4q4VftZc
	 Y2bbr1+wwcSwyzAIvBaAJCXWGagqCtO6bBjyG7I7iWV6HWio8EomQ2+dzE4iwwJY8h
	 CLFz3QrG+JAIcY+DDZD1u4Yz/GctrWl6wt4EOEhEBXN3sE6WtDiI6qvLbXB+7CAqmt
	 Z3ZQx87FqN0pA==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Carlos Llamas <cmllamas@google.com>
Cc: Nicolas Schier <nsc@kernel.org>,
	kernel-team@android.com,
	linux-kernel@vger.kernel.org,
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>
Subject: Re: [PATCH] kbuild: prefer ${NM} in check-function-names.sh
Date: Wed, 14 Jan 2026 14:27:40 +0100
Message-ID: <176839722213.411649.12526241406741915410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251218175824.3122690-1-cmllamas@google.com>
References: <20251218175824.3122690-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 18 Dec 2025 17:58:06 +0000, Carlos Llamas wrote:
> The check-function-names.sh scripts invokes 'nm' directly and this can
> be problematic during cross-compilation when the toolchain is different
> from the system's default (e.g. LLVM=1).
> 
>   scripts/check-function-names.sh: nm: not found
> 
> Let's prefer the ${NM} variable which is already set by kbuild. However,
> still fallback to plain 'nm' to ensure the script is still usable when
> called directly.
> 
> [...]

Applied, thanks!

[1/1] kbuild: prefer ${NM} in check-function-names.sh
      https://git.kernel.org/kbuild/c/946d4623

Best regards,
-- 
Nicolas

