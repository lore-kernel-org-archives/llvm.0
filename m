Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF231D61A3;
	Tue, 25 Nov 2025 23:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764113978; cv=none; b=YBL10qOvq3IBxFFEB1ycm/236Px58XUCp9s4nfCRa6htLZkOTfmYlhOfne6RHP9UkVWpah3PQ4G9OkQLSXuUztfOaB2XOZ7FnwGs4mNjH/WHiJtc6QJ8ew1wtCEp5nohfSBf8Takk05BGzotucazDaXk/lto/0ESXqVyq/r/tkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764113978; c=relaxed/simple;
	bh=ClFBMXYAL6JxWmmn/i2/+qJdyEpLGoepwkN+oBGG9O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROMhPVmeYTFGEioRiQ7oBCsI/0wMQMydbbdeZ+Sm/5c9g02c0ga0taxB0mwtuAgtHLEYLlPEWRuIxuSd2Uwn0bt82LKMKcfCa16yH4jC3BbKOXn3sXsHwc4iYxqeLzAQToTgAurKrMdZff91AHuDNMNHkhIlpo/FQw8B+XUt97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fo9Y0U51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fo9Y0U51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5A87C4CEF1;
	Tue, 25 Nov 2025 23:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764113978;
	bh=ClFBMXYAL6JxWmmn/i2/+qJdyEpLGoepwkN+oBGG9O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fo9Y0U510eeY9Owy5sGr6cr6Y8LIZtk/qgaHOEkt1FA5sqyU/AwFQzNCrlJHiwCVj
	 pyWyscKsYOUdIL6gEvVCwm1YmMnwXcY6PtaJR+nO2YNNiHhL1hYAzWUdkHjO8Gq9PH
	 v1kqzY3nW8957I1Aa//pCdWq6F/FRcWd6DxFwUcaYDEA5c7P/2ywGEOzM9BU5qJCYL
	 epQKHgTyNxeUTKhkIEEaFYwbUVP+F7ckvkP5uRS41aPB/l3dYirWZ07zSj+mFt59iS
	 Gun7GEjwwRFArz8pAlSDHgjihN6ycWPQwBR97ogkMJo5Sr8CW+HLawe/GQXrC4zg4g
	 CQpMuCTT31hcw==
Date: Tue, 25 Nov 2025 16:39:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <lkp@intel.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [tip:core/rseq 25/39] include/linux/rseq_entry.h:132:3: error:
 invalid operand for instruction
Message-ID: <20251125233933.GA1102709@ax162>
References: <202511250134.i0Jm8d7I-lkp@intel.com>
 <874iqji6n1.ffs@tglx>
 <897c6ba7-e27d-4170-be56-4d0f544bfa42@kernel.org>
 <20251125231834.GA4012217@ax162>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125231834.GA4012217@ax162>

On Tue, Nov 25, 2025 at 04:18:34PM -0700, Nathan Chancellor wrote:
> That avoids the error for me. I notice that this does not reproduce
> beyond clang-16 for me so I am going to bisect LLVM to see what fixes
> this error.

Oh, it is because of commit e2ffa15b9baa ("kbuild: Disable
CC_HAS_ASM_GOTO_OUTPUT on clang < 17"). Prior to that change, all
supported versions of clang would use the CONFIG_CC_HAS_ASM_GOTO_OUTPUT
blocks in arch/powerpc/include/asm/uaccess.h, whereas now clang-15 and
clang-16 will use the variants without asm goto with outputs.

Cheers,
Nathan
