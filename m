Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19A23FC1
	for <llvm@lists.linux.dev>; Tue, 24 Aug 2021 20:09:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA50B61357;
	Tue, 24 Aug 2021 20:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629835741;
	bh=uUxS3w4NOSn9JSUG4eMqaNfVV/q8mARt5VKtS0HjAJY=;
	h=To:Cc:From:Subject:Date:From;
	b=VSa+FJEW1fAO9sC2RDHgJXnRm4cep9Jr8x9LNqqVZtQF4m2Y/XogiDGoga9/EO7ZI
	 sX4fBWXmTFJoZevWtijrx4i/dYx7RpZaU+SlQAYTLavRKpWjJ9uaTIWvtRYf0AfkuS
	 q009nb+cnd5G93COlmYLj0jZ87/UR80e3XnuFIyOTUBxPANK7PiHGG52QXsZyQ7JQp
	 Q4XNaYkQYLBLP+wZhioJn66cD/TbpQUUuPlfWK0BbRMi/qATZ98CW2TnZ3tbcpLHG9
	 s891+4NZiVkG2fz2uipkI8bJ2wsOOObUU1vSq9+qhHaPhPsvvJCJGfR7wKYaFBLojk
	 ls1ba2BbiQt/g==
To: Josh Poimboeuf <jpoimboe@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>,
 clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Nathan Chancellor <nathan@kernel.org>
Subject: objtool warning in cfg80211_edmg_chandef_valid() with ThinLTO
Message-ID: <5913cdf4-9c8e-38f8-8914-d3b8a3565d73@kernel.org>
Date: Tue, 24 Aug 2021 13:08:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Josh and Peter,

An in-review LLVM patch [1] introduces an optimization around switch 
cases, marking the default case unreachable when all known values are 
covered. This ended up introducing a boot regression when building a 
kernel with ThinLTO, which Sami reported initially [2] and I reported it 
upstream, generating some discussion starting from [3].

There is an objtool warning about the function that the author of the 
patch tracked down to be problematic:

vmlinux.o: warning: objtool: cfg80211_edmg_chandef_valid()+0x169: can't 
find jump dest instruction at .text.cfg80211_edmg_chandef_valid+0x17b

The LLVM developers are under the impression that this is an issue with 
objtool; specifically quoting Eli Friedman:

"The backend can, in general, create basic blocks that don't contain any 
instructions, and don't fall through to another block. A jump table 
entry can refer to such a block. I guess certain tools could be confused 
by this.

If that's the issue, it should be possible to work around it using 
'-mllvm -trap-unreachable'."

I can confirm that adding '-mllvm -trap-unreachable' to 
KBUILD_{C,LD}FLAGS does resolve the issue but I am curious if that is an 
adequate solution (as Nick has frowned upon the presence of '-mllvm' 
flags) or if there is something that could be done on the objtool side. 
I do have a small reproducer on Phabricator [4] and I can provide any 
binary files that would be helpful for seeing what is going on here.

[1] https://reviews.llvm.org/D106056
[2] https://github.com/ClangBuiltLinux/linux/issues/1440
[3] https://reviews.llvm.org/D106056#2953104
[4] https://reviews.llvm.org/D106056#2961136

Cheers,
Nathan
