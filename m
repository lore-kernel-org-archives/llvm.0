Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793453802;
	b=Jk5xJJO/FEVGrHlZIQsFUl4zyXtpBleZv7KAsP7XJJoA8m42XML1jrWAqn5BuarAMjtY
	 I2dTesI8BHOjWY3IjM+sVM1wwLsa9prdqStu9BGj1GPzQbSiVQh/yv4F2fpBvTWnVWCUM
	 Nm+SzJlhJ4OveJeskPNE2bsXilA7twFQlnOklUiouSL9YslUe8voa3uvW5XitQHLDPPUx
	 6G2SI0iP6L/xpf7Nbu8k8eSL5/Jzd4FUyII3w54ocsHoV/D7HXbr9HXikqLqgUTfnCa5B
	 I5rbO+W7DlnJlsv4Bp+QkKIAccOHj7Pvv7mGuguRaA5F4a1aaSTJJFOfEihLu3fNKtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793453802;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=jw6bl5NsvkKFzeDn/Yr+FgWkys/VlF0+Kx7JrcSwHKQ=;
	b=iOOkB0LUP1PJbGl/mf1kaFbI5rEjnaLBNpx6NRXj/N1Sn531q8ZRChHxqSRV9L4udDEr
	 S0zEGIeT8NSXEx2cOsPzV71BZ3YMeixZM3l125rttLKNW0jWqOQf9TNv6QVn43jQS1j/i
	 wbavO0wjkyxUSXBIoVGRk0BMHuav5s2rKyWp9MPrUsl6NXYwGtZP43WkPDmFntyJqgUXw
	 0IGKBUrh72vShbewRVw38AYVFFCVof3P6hOWe3uPmrQTXP7+MVcTXcScm6CyM3Ws+19P+
	 CNZ8Qsx3A77mGZzMlZQ71tOXQfI2aW902XRlT8UUVlQUXAa6K5uTIZjD/3gNnS1LUQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJ4iDOR9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90CC606A31D;
	Sat, 31 Oct 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lJ4iDOR9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105F41F000C1;
	Sat, 31 Oct 2026 13:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793453801;
	bh=jw6bl5NsvkKFzeDn/Yr+FgWkys/VlF0+Kx7JrcSwHKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lJ4iDOR98AFkRou3maeiDjlG7QIHewvw0r1OCX5YwZZRbkqbpw5uZS0jxYmj2HQcx
	 0UhNGhvvaX0ei9p/GuR4B3ftaDGkGIRlFUwJ5uI+zId/tsEyknroFMtcvpEmgBG8UM
	 wK3EDC7U5CSp5nBINa0yEFdz30ZC9FK2tfxNbn+BAPMmFXExzH7Pdfn+0TbU/Qm0la
	 ILTk3lMas3nYYybcW9Zj2iEjrlEMn6syFqmHgxvUWp04aQMXi3WnqyfL17RdE14XYu
	 OnBS+WK+xsk3Qsu+eGTQSSSdX+1mx/Hu/hcBolX+TJm0XfVC56oTOxaBnJha6nilQA
	 MhNx6yv7X7/Iw==
From: Sasha Levin <sashal@kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Rosen Penev <rosenp@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Florian Westphal <fw@strlen.de>,
	Julian Anastasov <ja@ssi.bg>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] x86/csum: Relax the len and proto constraints in 32-bit csum_ipv6_magic()
Date: Sat, 31 Oct 2026 09:36:38 -0400
Message-ID: <20261031133638.580496-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
References: <20261020003238.2823758-1-sashal@kernel.org> <CAKxU2N9paXhCuNknUzKx5dYxhXitLZ=OVVY7Sym1HV8Mow6cSQ@mail.gmail.com> <20261020011140.GCata_zHOTeTXLdlr2@fat_crate.local> <atbBFRU1Wm94oYB7@laps> <20261020012844.GDatbDzDp1zC0NtI6k@fat_crate.local>
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

On Mon, Oct 19, 2026 at 06:28:44PM -0700, Borislav Petkov wrote:
>I'd like to use a trimmed version of your commit message because it explains
>the big picture better as to why we need this in the first place.

Hi Boris,

Gentle ping on this one, I don't see it in tip yet. The clang i386
allmodconfig build of mainline is still failing on it.

--
Thanks,
Sasha
