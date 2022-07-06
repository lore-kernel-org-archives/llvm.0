Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BFD173
	for <llvm@lists.linux.dev>; Wed,  6 Jul 2022 00:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7884C341C7;
	Wed,  6 Jul 2022 00:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657066163;
	bh=nmM87fXlEUHDXHmTIV5KiaJWvg7wd0eeXa7YN6/Enho=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RCifeka0nYKgQl8dl2nBrU++6Xatlkma1RYc+qHu9nfG8sE8w85duz9aAnsitto54
	 IfP88SZ/5Z5BQJ/ZD3i00Fk/DlBagjViR0dvElzw2g0vepr1ZirGkm/TsWOAuQt7+E
	 pLm9w7TXDMPiJmDYNXoEPhmdtVc+5aSpahoE1KJwPfYKCsqAkLZinmeV9u9tU0tRst
	 eszx/GQR2/dUiXAIAzgU2sTwfJuXcF5nhsHZBF05MFDRvKOIborijnvjwWLfHinW9L
	 bw0Jd789ilulddyeKtl/fQ9UvSs2fJez/hi2vuVb9wAY633FQUQNLxuMuZ0KOJLq0H
	 hM/gcgNmxWo/w==
Message-ID: <6cf4bab7-8c38-a2ee-07b9-fc95f901d2cb@kernel.org>
Date: Tue, 5 Jul 2022 17:09:21 -0700
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] x86/Kconfig: Allow X86_X32_ABI with llvm-objcopy in some
 cases
Content-Language: en-US
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>,
 Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, x86@kernel.org, llvm@lists.linux.dev
Cc: "H. Peter Anvin" <hpa@zytor.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
References: <20220701210437.579322-1-alex_y_xu.ref@yahoo.ca>
 <20220701210437.579322-1-alex_y_xu@yahoo.ca>
From: Andy Lutomirski <luto@kernel.org>
In-Reply-To: <20220701210437.579322-1-alex_y_xu@yahoo.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/22 14:04, Alex Xu (Hello71) wrote:
> According to the comment and commit message, there are issues compiling
> with IBT and/or compressed debug sections. Therefore, the condition
> should be restricted to when those are enabled.

This whole situation is gross.  We code in the vDSO that needs to 
dereference a genuinely 64-bit pointer.  The x32 toolchain doesn't 
understand this, so we have a massive hack using objcopy.  I see a few 
solutions:

1. Keep the hack alive, with further hacks like this patch.

2. Drop the x32 vDSO.

3. Drop x32.

4. Get gcc and/or clang to add actual support for this.

I admit I'm partial to solution #3.  I wonder how practical #4 is.

--Andy
