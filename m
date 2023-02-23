Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0244E33D6
	for <llvm@lists.linux.dev>; Thu, 23 Feb 2023 20:35:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB164C433EF;
	Thu, 23 Feb 2023 20:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1677184535;
	bh=JHEqfRl0X/jFNF8vQposUxtRh/7zormMksualB8s0UI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RFS+rViljTl38Rt2RUZQ82Nk9gp/zq7B6CWbAeN37ENhecuy8gA7KAghKfkARQulf
	 9lhTPOrqah9mHRnPQZKElgAqxkgOTePGTyf9gsEyLhEomCFKv3CsLAxUokbwJkJKCo
	 tBfQDYhEknGCIHrEYZCakrm8I/8JlnVM4tGDnwbM=
Date: Thu, 23 Feb 2023 12:35:34 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Rob Landley <rob@landley.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexey
 Dobriyan <adobriyan@gmail.com>, Andrew Halaney <ahalaney@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>, "Eric W. Biederman"
 <ebiederm@xmission.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar
 <mingo@redhat.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 linux-kbuild@vger.kernel.org, Li Zhe <lizhe.67@bytedance.com>,
 llvm@lists.linux.dev, Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Mark
 Rutland <mark.rutland@arm.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Nicolas
 Schier <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/5] Patches used to build mkroot.
Message-Id: <20230223123534.a193783f82489eb3d1b65373@linux-foundation.org>
In-Reply-To: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
References: <b455394f-9faa-1f1a-f171-0b9d5e9ada35@landley.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Feb 2023 14:53:30 -0600 Rob Landley <rob@landley.net> wrote:

> The ~300 line bash script in toybox that builds bootable Linux systems
> for a dozen-ish targets can use a vanilla kernel, but the binaries I
> ship are built from a kernel with these patches:

It's nice to see a diffstat of the whole series to at least get an idea
of who might merge the series.

Who were you thinking might merge the series?  I was only cc'ed on two
of them, I think.

There is no "Previously:" changelog tag.  Please use plain old "Link:".

Also, "See https://..." after the "^---$" will get chopped off.  It
might be helpful to includes this also as a Link: tag.

