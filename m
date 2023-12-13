Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F188A17C8;
	Wed, 13 Dec 2023 00:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmTDlSdX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7ECC433C8;
	Wed, 13 Dec 2023 00:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702425820;
	bh=eRvxYfKdr7rmxElEkuksckuBtQYiMV05YPSQCJa1Iy8=;
	h=Date:From:To:Cc:Subject:From;
	b=EmTDlSdXbeQi1EZaXVnlNK3IPRbiYBxUncYJ6zmb0NDqLR0RzAjLvIj7QXlsqH9JZ
	 6c/s4yQXOdgJrSUf9IAzxrA17Bk1+qCvqICgHO4YBVBd0Mh8CQfAEQ/gCUrwxI9i1R
	 LUDIHRiabdq70BjIeTpURf6hkOJC7wn1qYwGl7XoY+8FRt+3MES466Qd4ijNCsB/mE
	 fSfO29GqS1wRKbsB82sqs6p1CfO/vWUDNDfuTiOfgqMbaMHGjIiHOUVBc5gkKDKoAZ
	 s9IMwSIsBCMyJmzwJUlwyW/y+sYCazV5eclGiEgU5tBX1iEXDzU/bez+x7l7YHMzNa
	 kzvu6fMy6MY9w==
Date: Tue, 12 Dec 2023 17:03:38 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Fangrui Song <maskray@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>, stable@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Apply b8ec60e1186cdcfce41e7db4c827cb107e459002 to linux-6.6.y
Message-ID: <20231213000338.GA866722@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Greg and Sasha,

Please consider applying commit b8ec60e1186c ("x86/speculation, objtool:
Use absolute relocations for annotations") to linux-6.6.y, which is the
only supported stable version that has the prerequisite commit
1c0c1faf5692 ("objtool: Use relative pointers for annotations"). This
fixes a bunch of warnings along the lines of the one in the commit
message that are seen when linking ARCH=i386 kernels with ld.lld 18+. It
picks cleanly for me.

Cheers,
Nathan
